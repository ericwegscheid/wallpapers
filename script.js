
const totalImages = 20;
const gallery = document.getElementById('gallery');

for (let i = 1; i <= totalImages; i++ ) {
  const img = document.createElement('img');
  img.setAttribute('src', `./images/${i}.jpg`);
  gallery.appendChild(img);
}
