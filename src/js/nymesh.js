var width = window.innerWidth,
  height = window.innerHeight;

var scene = new THREE.Scene();
scene.background = new THREE.Color(0xffffff);

var axes = new THREE.AxesHelper(100);
scene.add(axes);

var camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 1000);
camera.position.set(20, -80, 100);
// camera.zoom(50);

var renderer = new THREE.WebGLRenderer();
renderer.setSize(width, height);

// var geometry = new THREE.PlaneGeometry(60, 60, 9, 9);

// var material = new THREE.MeshBasicMaterial({
//     color: 0x000000, 
//     wireframe: true
// });

// var plane = new THREE.Mesh(geometry, material);
// scene.add(plane);
var terrainLoader = new THREE.TerrainLoader();
terrainLoader.load('../assets/ny_crop.bin', function (data) {

  var geometry = new THREE.PlaneGeometry(400, 400, 393, 678);

  for (var i = 0, l = geometry.vertices.length; i < l; i++) {
    geometry.vertices[i].z = data[i] / 65535 * 10;
  }

  var material = new THREE.MeshPhongMaterial({
    color: 0xdddddd,
    wireframe: true
  });

  var plane = new THREE.Mesh(geometry, material);
  scene.add(plane);

});

var controls = new THREE.TrackballControls(camera);

document.getElementById('webgl1').appendChild(renderer.domElement);

render();

function render() {
  controls.update();
  requestAnimationFrame(render);
  renderer.render(scene, camera);
}