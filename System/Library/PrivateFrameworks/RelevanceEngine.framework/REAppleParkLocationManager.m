@implementation REAppleParkLocationManager

void __46___REAppleParkLocationManager_currentLocation__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", 37.3353672, -122.011737);
  v1 = (void *)currentLocation_AppleParkLocation;
  currentLocation_AppleParkLocation = v0;

}

void __63___REAppleParkLocationManager_startLocationUpdatesWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "currentLocation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

@end
