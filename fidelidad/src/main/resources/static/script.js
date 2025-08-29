async function loadSelect(url, selectId, placeholder) {
  const res = await fetch(url);
  const data = await res.json();
  const select = document.getElementById(selectId);
  select.innerHTML = `<option value="">-- ${placeholder} --</option>`;
  data.forEach(item => {
    select.innerHTML += `<option value="${item.id}">${item.name}</option>`;
  });
}

window.onload = async () => {
  await loadSelect('/api/id-types', 'idType', 'Seleccione tipo');
  await loadSelect('/api/brands', 'brand', 'Seleccione marca');
  await loadSelect('/api/countries', 'country', 'Seleccione país');

  document.getElementById('country').addEventListener('change', async e => {
    if (e.target.value) {
      await loadSelect('/api/departments?countryId=' + e.target.value, 'department', 'Seleccione depto');
    }
  });

  document.getElementById('department').addEventListener('change', async e => {
    if (e.target.value) {
      await loadSelect('/api/cities?departmentId=' + e.target.value, 'city', 'Seleccione ciudad');
    }
  });

//SWWETALERT
document.getElementById('form').addEventListener('submit', async e => {
  e.preventDefault();

  const payload = {
    idTypeId: Number(document.getElementById('idType').value),
    idNumber: document.getElementById('idNumber').value,
    firstName: document.getElementById('firstName').value,
    lastName: document.getElementById('lastName').value,
    birthDate: document.getElementById('birthDate').value || null,
    address: document.getElementById('address').value,
    cityId: Number(document.getElementById('city').value),
    brandId: Number(document.getElementById('brand').value)
  };

  try {
    const res = await fetch('/api/customers', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
      body: JSON.stringify(payload)
    });

    const text = await res.text();
    let data = {};
    try { data = JSON.parse(text); } catch { /* puede venir texto plano */ }

    if (res.ok) {
      await Swal.fire({
        icon: 'success',
        title: '¡Registro exitoso!',
        text: data.id ? `Tu ID de cliente es ${data.id}` : 'El registro se completó correctamente.',
        confirmButtonColor: '#3085d6',
        confirmButtonText: 'Aceptar'
      });

      // reset del formulario y selects dependientes
      e.target.reset();
      // Limpia selects dependientes por si quedaron valores
      document.getElementById('department').innerHTML = '<option value="">-- Seleccione depto --</option>';
      document.getElementById('city').innerHTML = '<option value="">-- Seleccione ciudad --</option>';

      // si usas fondo por marca, al reset quítalo:
      const brandSelect = document.getElementById('brand');
      if (brandSelect) {
        const brandName = '';
        if (typeof setBrandBackground === 'function') setBrandBackground(brandName);
      }
    } else {
      Swal.fire({
        icon: 'error',
        title: 'Error',
        text: (data && data.error) ? data.error : (text || 'Ocurrió un error al registrar'),
        confirmButtonColor: '#d33',
        confirmButtonText: 'Cerrar'
      });
    }
  } catch (err) {
    Swal.fire({
      icon: 'error',
      title: 'Error inesperado',
      text: err.message,
      confirmButtonColor: '#d33',
      confirmButtonText: 'Cerrar'
    });
  }
});

};
//SWEETALERT 50% OFF
function shouldShowPromo(days=7) {
  const key = 'promo_shown_at';
  const last = localStorage.getItem(key);
  if (!last) return true;
  const ms = Date.now() - Number(last);
  const daysSince = ms / (1000 * 60 * 60 * 24);
  return daysSince >= days;
}

async function showWelcomePromo() {
  // Puedes cambiar imagen, título y texto a tu gusto
  await Swal.fire({
    title: '¡Bienvenido!',
    html: '<b>Regístrate y obtén 50% de descuento</b><br/>Solo por tiempo limitado.',
    icon: 'info',
    confirmButtonText: 'Quiero registrarme',
    confirmButtonColor: '#3085d6',
    backdrop: true,
    allowOutsideClick: true
  });

  localStorage.setItem('promo_shown_at', Date.now().toString());
}

document.addEventListener('DOMContentLoaded', () => {
  showWelcomePromo();
});

    // PRUEBA CAMBIAR FONDO AL SELECCIONAR MARCA
const brandBgMap = {

  'Americanino': '/assets/brands/americanino_bg.jpg',
  'American Eagle': '/assets/brands/american_eagle_bg.jpg',
  'Chevignon': '/assets/brands/chevignon_bg.jpg',
  'Esprit': '/assets/brands/esprit_bg.jpg',
  'Naf Naf': '/assets/brands/naf_naf_bg.jpeg',
  'Rifle': '/assets/brands/rifle_bg.jpeg'
};

function setBrandBackground(brandName) {
  const bgDiv = document.querySelector('.bg-logos');
  if (brandName && brandBgMap[brandName]) {
    document.body.style.backgroundImage = `url('${brandBgMap[brandName]}')`;
    document.body.style.backgroundSize = 'cover';
    document.body.style.backgroundPosition = 'center';
    document.body.style.backgroundAttachment = 'fixed';

    if (bgDiv) bgDiv.style.display = 'none';
  } else {

    document.body.style.backgroundImage = 'none';
    if (bgDiv) bgDiv.style.display = 'block';
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const brandSelect = document.getElementById('brand');
  if (brandSelect) {
    brandSelect.addEventListener('change', () => {

      const brandName = brandSelect.options[brandSelect.selectedIndex]?.text?.trim();
      setBrandBackground(brandName);
    });
  }
});
