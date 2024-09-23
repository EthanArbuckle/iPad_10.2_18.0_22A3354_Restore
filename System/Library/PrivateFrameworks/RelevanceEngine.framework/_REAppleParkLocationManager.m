@implementation _REAppleParkLocationManager

- (id)currentLocation
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (currentLocation_onceToken != -1)
    dispatch_once(&currentLocation_onceToken, &__block_literal_global_12_0);
  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("RESimulatedLocationKey"), CFSTR("com.apple.RelevanceEngine"));
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDBFA80]);
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("lat"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "doubleValue");
    v6 = v5;
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("long"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = objc_msgSend(v3, "initWithLatitude:longitude:", v6, v8);
    v10 = (void *)currentLocation_AppleParkLocation;
    currentLocation_AppleParkLocation = v9;

  }
  v11 = (id)currentLocation_AppleParkLocation;

  return v11;
}

- (void)startLocationUpdatesWithHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63___REAppleParkLocationManager_startLocationUpdatesWithHandler___block_invoke;
  v6[3] = &unk_24CF8B2E0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

@end
