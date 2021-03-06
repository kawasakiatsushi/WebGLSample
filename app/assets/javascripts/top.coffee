$ ->
  width = 500
  height = 300
  shere = []

  #Scene
  scene = new THREE.Scene()

  # 画像設定
  texture = THREE.ImageUtils.loadTexture("3d.png")

  # Mesh
  geometry = new THREE.SphereGeometry(100)

  # material = new THREE.MeshBasicMaterial({color: "red"})
  material = new THREE.MeshBasicMaterial({ map: texture })
  material.side = THREE.DoubleSide

  cube = new THREE.Mesh(geometry, material)
  cube.position.set(0,0,0)
  # scene.add(cube)

  r = (n) ->
    Math.floor(Math.random() * (n * 1))

  # Mesh
  for i in [1..10]
    console.log(i)
    shereSize = 5
    rGeometry = new THREE.SphereGeometry(shereSize)
    rMaterial = new THREE.MeshBasicMaterial({color: "#fff"})
    shere[i] = new THREE.Mesh(rGeometry, rMaterial)
    shere[i].position.set(50+r(400),  100+r(30), 50+r(30))
    scene.add(shere[i])

  # helper
  axis = new THREE.AxisHelper(1000)
  axis.position.set(0, 0, 0)
  scene.add(axis)

  # camera
  camera = new THREE.PerspectiveCamera(45, width / height, 1, 1500)
  camera.position.set(0, 180, 300)
  camera.lookAt(cube.position)

  # Rendering
  renderer = new THREE.WebGLRenderer
  renderer.setSize 1000, 500
  renderer.setClearColor("#333", 1)
  document.getElementById('stage').appendChild renderer.domElement

  render =  () =>
    requestAnimationFrame(render)
    for i in [1..10]

      # shere[i].rotation.x += i * Math.PI / 180
      # shere[i].rotation.y += i * Math.PI / 180
      # shere[i].rotation.z += i * Math.PI / 180
      shere[i].position.x = Math.sin(new Date().getTime() / 200+i) * 100
      shere[i].position.z = Math.cos(new Date().getTime() / 200+i) * 100
      console.log(shere[i].position.x)
    renderer.render(scene, camera)

  render()
  # control
  control = new THREE.OrbitControls(camera, renderer.domElement)
  return
