@implementation TUAudioRoute

- (TUAudioRoute)initWithDictionary:(id)a3
{
  id v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  TUAudioRoute *v19;
  TUAudioRoute *v20;
  NSString *v21;
  objc_super v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v6 = (_QWORD *)getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr_0;
  v27 = getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr_0;
  if (!getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr_0)
  {
    v7 = (void *)MediaExperienceLibrary_0();
    v6 = dlsym(v7, "AVSystemController_RouteDescriptionKey_RouteUID");
    v25[3] = (uint64_t)v6;
    getAVSystemController_RouteDescriptionKey_RouteUIDSymbolLoc_ptr_0 = (uint64_t)v6;
  }
  _Block_object_dispose(&v24, 8);
  if (!v6)
    -[TUAudioRoute initWithDictionary:].cold.1();
  objc_msgSend(v5, "objectForKeyedSubscript:", *v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v9 = (_QWORD *)getAVSystemController_RouteDescriptionKey_RouteNameSymbolLoc_ptr;
  v27 = getAVSystemController_RouteDescriptionKey_RouteNameSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_RouteNameSymbolLoc_ptr)
  {
    v10 = (void *)MediaExperienceLibrary_0();
    v9 = dlsym(v10, "AVSystemController_RouteDescriptionKey_RouteName");
    v25[3] = (uint64_t)v9;
    getAVSystemController_RouteDescriptionKey_RouteNameSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v24, 8);
  if (!v9)
    -[TUAudioRoute initWithDictionary:].cold.2();
  objc_msgSend(v5, "objectForKeyedSubscript:", *v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v12 = (id *)getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr_0;
  v27 = getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr_0;
  if (!getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr_0)
  {
    v13 = (void *)MediaExperienceLibrary_0();
    v12 = (id *)dlsym(v13, "AVSystemController_RouteDescriptionKey_AVAudioRouteName");
    v25[3] = (uint64_t)v12;
    getAVSystemController_RouteDescriptionKey_AVAudioRouteNameSymbolLoc_ptr_0 = (uint64_t)v12;
  }
  _Block_object_dispose(&v24, 8);
  if (!v12)
    -[TUAudioRoute initWithDictionary:].cold.3();
  v14 = *v12;
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v16 = v11;
  else
    v16 = v15;
  v17 = v16;
  v18 = v17;
  v19 = 0;
  if (!v8 || !v17)
    goto LABEL_17;
  v23.receiver = self;
  v23.super_class = (Class)TUAudioRoute;
  v20 = -[TURoute initWithUniqueIdentifier:name:](&v23, sel_initWithUniqueIdentifier_name_, v8, v17);
  v19 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_route, a3);
    v21 = v15;
    self = (TUAudioRoute *)v19->_avAudioRouteName;
    v19->_avAudioRouteName = v21;
LABEL_17:

  }
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_avAudioRouteName, 0);
}

- (id)customDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v9.receiver = self;
  v9.super_class = (Class)TUAudioRoute;
  -[TURoute customDescription](&v9, sel_customDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TUAudioRoute isBluetooth](self, "isBluetooth"))
  {
    -[TUAudioRoute bluetoothProductIdentifier](self, "bluetoothProductIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR(" bluetoothProductIdentifier=%@"), v6);

    objc_msgSend(v5, "appendFormat:", CFSTR(" isA2DPRoute=%d"), -[TUAudioRoute isA2DPRoute](self, "isA2DPRoute"));
  }
  v7 = (void *)objc_msgSend(v5, "copy");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUAudioRoute)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  TUAudioRoute *v12;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  objc_msgSend(v4, "setWithObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_route);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeDictionaryWithKeysOfClasses:objectsOfClasses:forKey:", v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[TUAudioRoute initWithDictionary:](self, "initWithDictionary:", v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *route;
  id v4;
  id v5;

  route = self->_route;
  v4 = a3;
  NSStringFromSelector(sel_route);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", route, v5);

}

- (BOOL)isCurrentlyPicked
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[TUAudioRoute route](self, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (_QWORD *)getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr_0;
  v11 = getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr_0;
  if (!getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr_0)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v3 = dlsym(v4, "AVSystemController_RouteDescriptionKey_RouteCurrentlyPicked");
    v9[3] = (uint64_t)v3;
    getAVSystemController_RouteDescriptionKey_RouteCurrentlyPickedSymbolLoc_ptr_0 = (uint64_t)v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
    -[TUAudioRoute isCurrentlyPicked].cold.1();
  objc_msgSend(v2, "objectForKeyedSubscript:", *v3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)isHandset
{
  _BOOL4 v3;

  if (-[TUAudioRoute isReceiver](self, "isReceiver"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[TUAudioRoute isDefaultRoute](self, "isDefaultRoute");
    if (v3)
      LOBYTE(v3) = !-[TUAudioRoute isSpeaker](self, "isSpeaker");
  }
  return v3;
}

- (BOOL)isReceiver
{
  void *v2;
  char v3;

  -[TUAudioRoute avAudioRouteName](self, "avAudioRouteName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Receiver"));

  return v3;
}

- (BOOL)isSpeaker
{
  void *v2;
  char v3;

  -[TUAudioRoute avAudioRouteName](self, "avAudioRouteName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Speaker"));

  return v3;
}

- (BOOL)isAirTunes
{
  void *v2;
  char v3;

  -[TUAudioRoute avAudioRouteName](self, "avAudioRouteName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("AirTunes"));

  return v3;
}

- (BOOL)isCarAudio
{
  void *v2;
  char v3;

  -[TUAudioRoute avAudioRouteName](self, "avAudioRouteName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("CarAudioOutput"));

  return v3;
}

- (BOOL)isBluetoothLE
{
  void *v2;
  char v3;

  -[TUAudioRoute avAudioRouteName](self, "avAudioRouteName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("BluetoothLEOutput"));

  return v3;
}

- (BOOL)isBluetooth
{
  id *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v3 = (id *)getAVSystemController_RouteDescriptionKey_IsBTRouteSymbolLoc_ptr;
  v13 = getAVSystemController_RouteDescriptionKey_IsBTRouteSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_IsBTRouteSymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v3 = (id *)dlsym(v4, "AVSystemController_RouteDescriptionKey_IsBTRoute");
    v11[3] = (uint64_t)v3;
    getAVSystemController_RouteDescriptionKey_IsBTRouteSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v10, 8);
  if (!v3)
    -[TUAudioRoute isBluetooth].cold.1();
  if (!*v3)
    return 0;
  v5 = *v3;
  -[TUAudioRoute route](self, "route", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "BOOLValue");
  return v8;
}

- (BOOL)isBluetoothManaged
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[TUAudioRoute route](self, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (_QWORD *)getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr;
  v11 = getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v3 = dlsym(v4, "AVSystemController_RouteDescriptionKey_BTDetails_IsBTManaged");
    v9[3] = (uint64_t)v3;
    getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManagedSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
    -[TUAudioRoute isBluetoothManaged].cold.1();
  objc_msgSend(v2, "objectForKeyedSubscript:", *v3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (int64_t)bluetoothEndpointType
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  int v20;

  if (!-[TUAudioRoute isBluetooth](self, "isBluetooth"))
    return 0;
  getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType();
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TUAudioRoute route](self, "route");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Headphones();
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7
      && (v8 = (void *)v7,
          getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Headphones(),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v6, "isEqualToString:", v9),
          v9,
          v8,
          (v10 & 1) != 0))
    {
      v3 = 1;
    }
    else
    {
      getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Vehicle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (v11
        && (v12 = (void *)v11,
            getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Vehicle(),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v6, "isEqualToString:", v13),
            v13,
            v12,
            (v14 & 1) != 0))
      {
        v3 = 2;
      }
      else
      {
        getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Speakers();
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15
          && (v16 = (void *)v15,
              getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_Speakers(),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v6, "isEqualToString:", v17),
              v17,
              v16,
              (v18 & 1) != 0))
        {
          v3 = 3;
        }
        else
        {
          getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_TTY();
          v3 = objc_claimAutoreleasedReturnValue();
          if (v3)
          {
            getAVSystemController_RouteDescriptionKey_BTDetails_EndpointType_TTY();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v6, "isEqualToString:", v19);

            if (v20)
              v3 = 4;
            else
              v3 = 0;
          }
        }
      }
    }

  }
  return v3;
}

- (BOOL)isA2DPRoute
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (!-[TUAudioRoute isBluetooth](self, "isBluetooth"))
    return 0;
  -[TUAudioRoute route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = (_QWORD *)getAVSystemController_RouteDescriptionKey_BTDetails_IsA2DPRouteSymbolLoc_ptr;
  v12 = getAVSystemController_RouteDescriptionKey_BTDetails_IsA2DPRouteSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_BTDetails_IsA2DPRouteSymbolLoc_ptr)
  {
    v5 = (void *)MediaExperienceLibrary_0();
    v4 = dlsym(v5, "AVSystemController_RouteDescriptionKey_BTDetails_IsA2DPRoute");
    v10[3] = (uint64_t)v4;
    getAVSystemController_RouteDescriptionKey_BTDetails_IsA2DPRouteSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
    -[TUAudioRoute isA2DPRoute].cold.1();
  objc_msgSend(v3, "objectForKeyedSubscript:", *v4, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (BOOL)isInEarDetectionEnabled
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (!-[TUAudioRoute isInEarDetectionSupported](self, "isInEarDetectionSupported"))
    return 0;
  -[TUAudioRoute route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = (_QWORD *)getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabledSymbolLoc_ptr;
  v12 = getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabledSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabledSymbolLoc_ptr)
  {
    v5 = (void *)MediaExperienceLibrary_0();
    v4 = dlsym(v5, "AVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabled");
    v10[3] = (uint64_t)v4;
    getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabledSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
    -[TUAudioRoute isInEarDetectionEnabled].cold.1();
  objc_msgSend(v3, "objectForKeyedSubscript:", *v4, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (BOOL)isInEarDetectionSupported
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  if (!-[TUAudioRoute isPreferred](self, "isPreferred"))
    return 0;
  -[TUAudioRoute route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v4 = (_QWORD *)getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectSupportedSymbolLoc_ptr;
  v12 = getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectSupportedSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectSupportedSymbolLoc_ptr)
  {
    v5 = (void *)MediaExperienceLibrary_0();
    v4 = dlsym(v5, "AVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectSupported");
    v10[3] = (uint64_t)v4;
    getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectSupportedSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v9, 8);
  if (!v4)
    -[TUAudioRoute isInEarDetectionSupported].cold.1();
  objc_msgSend(v3, "objectForKeyedSubscript:", *v4, v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (BOOL)isWiredHeadphones
{
  void *v3;
  char v4;

  if (-[TUAudioRoute isHeadphoneJackConnected](self, "isHeadphoneJackConnected")
    && !-[TUAudioRoute isWiredHeadset](self, "isWiredHeadset"))
  {
    return 1;
  }
  -[TUAudioRoute avAudioRouteName](self, "avAudioRouteName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Headphone"));

  return v4;
}

- (BOOL)isWiredHeadset
{
  void *v2;
  id v3;
  void *v4;
  _BOOL4 v6;
  id *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = -[TUAudioRoute isHeadphoneJackConnected](self, "isHeadphoneJackConnected");
  if (v6)
  {
    -[TUAudioRoute route](self, "route");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v7 = (id *)getAVSystemController_HeadphoneJackHasInputAttributeSymbolLoc_ptr;
    v15 = getAVSystemController_HeadphoneJackHasInputAttributeSymbolLoc_ptr;
    if (!getAVSystemController_HeadphoneJackHasInputAttributeSymbolLoc_ptr)
    {
      v8 = (void *)MediaExperienceLibrary_0();
      v7 = (id *)dlsym(v8, "AVSystemController_HeadphoneJackHasInputAttribute");
      v13[3] = (uint64_t)v7;
      getAVSystemController_HeadphoneJackHasInputAttributeSymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&v12, 8);
    if (!v7)
      -[TUAudioRoute isWiredHeadset].cold.1();
    v3 = *v7;
    objc_msgSend(v2, "objectForKeyedSubscript:", v3, v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "BOOLValue") & 1) != 0)
    {
      v9 = 1;
LABEL_8:

      return v9;
    }
  }
  -[TUAudioRoute avAudioRouteName](self, "avAudioRouteName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v10, "isEqualToString:", CFSTR("Headset"));

  if (v6)
    goto LABEL_8;
  return v9;
}

- (BOOL)isWirelessHeadset
{
  void *v2;
  _QWORD *v3;
  void *v4;
  char v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  -[TUAudioRoute avAudioRouteName](self, "avAudioRouteName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v3 = (_QWORD *)getAVSystemController_PickableRouteType_WirelessSymbolLoc_ptr;
  v10 = getAVSystemController_PickableRouteType_WirelessSymbolLoc_ptr;
  if (!getAVSystemController_PickableRouteType_WirelessSymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v3 = dlsym(v4, "AVSystemController_PickableRouteType_Wireless");
    v8[3] = (uint64_t)v3;
    getAVSystemController_PickableRouteType_WirelessSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v7, 8);
  if (!v3)
    -[TUAudioRoute isWirelessHeadset].cold.1();
  v5 = objc_msgSend(v2, "isEqualToString:", *v3, v7);

  return v5;
}

- (BOOL)isDefaultRoute
{
  _QWORD *v3;
  void *v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v3 = (_QWORD *)getAVSystemController_PickableRouteType_DefaultSymbolLoc_ptr;
  v9 = getAVSystemController_PickableRouteType_DefaultSymbolLoc_ptr;
  if (!getAVSystemController_PickableRouteType_DefaultSymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v3 = dlsym(v4, "AVSystemController_PickableRouteType_Default");
    v7[3] = (uint64_t)v3;
    getAVSystemController_PickableRouteType_DefaultSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v6, 8);
  if (!v3)
    -[TUAudioRoute isDefaultRoute].cold.1();
  return -[TUAudioRoute _routeTypeEqualTo:](self, "_routeTypeEqualTo:", *v3, v6);
}

- (BOOL)isPreferred
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[TUAudioRoute route](self, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (_QWORD *)getAVSystemController_RouteDescriptionKey_IsPreferredExternalRouteSymbolLoc_ptr;
  v11 = getAVSystemController_RouteDescriptionKey_IsPreferredExternalRouteSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_IsPreferredExternalRouteSymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v3 = dlsym(v4, "AVSystemController_RouteDescriptionKey_IsPreferredExternalRoute");
    v9[3] = (uint64_t)v3;
    getAVSystemController_RouteDescriptionKey_IsPreferredExternalRouteSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
    -[TUAudioRoute isPreferred].cold.1();
  objc_msgSend(v2, "objectForKeyedSubscript:", *v3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)isPreferredAndActive
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[TUAudioRoute route](self, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (_QWORD *)getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr;
  v11 = getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v3 = dlsym(v4, "AVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActive");
    v9[3] = (uint64_t)v3;
    getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActiveSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
    -[TUAudioRoute isPreferredAndActive].cold.1();
  objc_msgSend(v2, "objectForKeyedSubscript:", *v3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)isPartnerRouteRoutable
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[TUAudioRoute route](self, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (_QWORD *)getAVSystemController_RouteDescriptionKey_BTDetails_PartnerRouteRoutableSymbolLoc_ptr;
  v11 = getAVSystemController_RouteDescriptionKey_BTDetails_PartnerRouteRoutableSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_BTDetails_PartnerRouteRoutableSymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v3 = dlsym(v4, "AVSystemController_RouteDescriptionKey_BTDetails_PartnerRouteRoutable");
    v9[3] = (uint64_t)v3;
    getAVSystemController_RouteDescriptionKey_BTDetails_PartnerRouteRoutableSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
    -[TUAudioRoute isPartnerRouteRoutable].cold.1();
  objc_msgSend(v2, "objectForKeyedSubscript:", *v3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)isSiblingRoutePresent
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[TUAudioRoute route](self, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (_QWORD *)getAVSystemController_RouteDescriptionKey_BTDetails_SiblingRoutePresentSymbolLoc_ptr;
  v11 = getAVSystemController_RouteDescriptionKey_BTDetails_SiblingRoutePresentSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_BTDetails_SiblingRoutePresentSymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v3 = dlsym(v4, "AVSystemController_RouteDescriptionKey_BTDetails_SiblingRoutePresent");
    v9[3] = (uint64_t)v3;
    getAVSystemController_RouteDescriptionKey_BTDetails_SiblingRoutePresentSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
    -[TUAudioRoute isSiblingRoutePresent].cold.1();
  objc_msgSend(v2, "objectForKeyedSubscript:", *v3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)supportsHighQualityVoiceWithMedia
{
  return 0;
}

- (BOOL)supportsSharePlay
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[TUAudioRoute route](self, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (_QWORD *)getAVSystemController_RouteDescriptionKey_SupportsSharePlaySymbolLoc_ptr;
  v11 = getAVSystemController_RouteDescriptionKey_SupportsSharePlaySymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_SupportsSharePlaySymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v3 = dlsym(v4, "AVSystemController_RouteDescriptionKey_SupportsSharePlay");
    v9[3] = (uint64_t)v3;
    getAVSystemController_RouteDescriptionKey_SupportsSharePlaySymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
    -[TUAudioRoute supportsSharePlay].cold.1();
  objc_msgSend(v2, "objectForKeyedSubscript:", *v3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (int64_t)deviceType
{
  void *v2;
  int64_t v3;

  -[TUAudioRoute bluetoothProductIdentifier](self, "bluetoothProductIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8194")) & 1) != 0
    || (objc_msgSend(v2, "hasSuffix:", CFSTR("76,8207")) & 1) != 0)
  {
    v3 = 1;
  }
  else if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8206")) & 1) != 0)
  {
    v3 = 18;
  }
  else if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8212")) & 1) != 0
         || (objc_msgSend(v2, "hasSuffix:", CFSTR("76,8228")) & 1) != 0)
  {
    v3 = 29;
  }
  else if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8229")) & 1) != 0
         || (objc_msgSend(v2, "hasSuffix:", CFSTR("76,8198")) & 1) != 0)
  {
    v3 = 2;
  }
  else if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8197")) & 1) != 0)
  {
    v3 = 3;
  }
  else if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8195")) & 1) != 0)
  {
    v3 = 4;
  }
  else
  {
    if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8201")) & 1) != 0)
      goto LABEL_18;
    if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8203")) & 1) != 0)
    {
      v3 = 16;
      goto LABEL_4;
    }
    if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8204")) & 1) != 0)
    {
      v3 = 17;
      goto LABEL_4;
    }
    if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8205")) & 1) != 0)
    {
      v3 = 19;
      goto LABEL_4;
    }
    if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8202")) & 1) != 0)
    {
      v3 = 20;
      goto LABEL_4;
    }
    if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8208")) & 1) != 0)
    {
      v3 = 21;
      goto LABEL_4;
    }
    if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8209")) & 1) != 0
      || (objc_msgSend(v2, "hasSuffix:", CFSTR("76,8214")) & 1) != 0)
    {
      v3 = 24;
      goto LABEL_4;
    }
    if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8215")) & 1) != 0)
    {
LABEL_18:
      v3 = 5;
    }
    else if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8218")) & 1) != 0)
    {
      v3 = 31;
    }
    else if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8230")) & 1) != 0)
    {
      v3 = 33;
    }
    else if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8221")) & 1) != 0)
    {
      v3 = 34;
    }
    else if ((objc_msgSend(v2, "hasSuffix:", CFSTR("76,8210")) & 1) != 0)
    {
      v3 = 25;
    }
    else if (objc_msgSend(v2, "hasSuffix:", CFSTR("76,8211")))
    {
      v3 = 26;
    }
    else
    {
      v3 = 0;
    }
  }
LABEL_4:

  return v3;
}

- (NSString)bluetoothProductIdentifier
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  -[TUAudioRoute route](self, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v3 = (_QWORD *)getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr;
  v10 = getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v3 = dlsym(v4, "AVSystemController_RouteDescriptionKey_BTDetails_ProductID");
    v8[3] = (uint64_t)v3;
    getAVSystemController_RouteDescriptionKey_BTDetails_ProductIDSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v7, 8);
  if (!v3)
    -[TUAudioRoute bluetoothProductIdentifier].cold.1();
  objc_msgSend(v2, "objectForKeyedSubscript:", *v3, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)isHeadphoneJackConnected
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  -[TUAudioRoute route](self, "route");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = (_QWORD *)getAVSystemController_HeadphoneJackIsConnectedAttributeSymbolLoc_ptr;
  v11 = getAVSystemController_HeadphoneJackIsConnectedAttributeSymbolLoc_ptr;
  if (!getAVSystemController_HeadphoneJackIsConnectedAttributeSymbolLoc_ptr)
  {
    v4 = (void *)MediaExperienceLibrary_0();
    v3 = dlsym(v4, "AVSystemController_HeadphoneJackIsConnectedAttribute");
    v9[3] = (uint64_t)v3;
    getAVSystemController_HeadphoneJackIsConnectedAttributeSymbolLoc_ptr = (uint64_t)v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
    -[TUAudioRoute isHeadphoneJackConnected].cold.1();
  objc_msgSend(v2, "objectForKeyedSubscript:", *v3, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  return v6;
}

- (BOOL)_routeTypeEqualTo:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  -[TUAudioRoute route](self, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v6 = (_QWORD *)getAVSystemController_RouteDescriptionKey_RouteTypeSymbolLoc_ptr;
  v14 = getAVSystemController_RouteDescriptionKey_RouteTypeSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_RouteTypeSymbolLoc_ptr)
  {
    v7 = (void *)MediaExperienceLibrary_0();
    v6 = dlsym(v7, "AVSystemController_RouteDescriptionKey_RouteType");
    v12[3] = (uint64_t)v6;
    getAVSystemController_RouteDescriptionKey_RouteTypeSymbolLoc_ptr = (uint64_t)v6;
  }
  _Block_object_dispose(&v11, 8);
  if (!v6)
    -[TUAudioRoute _routeTypeEqualTo:].cold.1();
  objc_msgSend(v5, "objectForKeyedSubscript:", *v6, v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v4);

  return v9;
}

- (id)identifiersOfOtherConnectedDevices
{
  void *v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUAudioRoute route](self, "route");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v5 = (_QWORD *)getAVSystemController_RouteDescriptionKey_OtherDevicesConnectedSymbolLoc_ptr;
  v25 = getAVSystemController_RouteDescriptionKey_OtherDevicesConnectedSymbolLoc_ptr;
  if (!getAVSystemController_RouteDescriptionKey_OtherDevicesConnectedSymbolLoc_ptr)
  {
    v6 = (void *)MediaExperienceLibrary_0();
    v5 = dlsym(v6, "AVSystemController_RouteDescriptionKey_OtherDevicesConnected");
    v23[3] = (uint64_t)v5;
    getAVSystemController_RouteDescriptionKey_OtherDevicesConnectedSymbolLoc_ptr = (uint64_t)v5;
  }
  _Block_object_dispose(&v22, 8);
  if (!v5)
    -[TUAudioRoute identifiersOfOtherConnectedDevices].cold.1();
  objc_msgSend(v4, "objectForKeyedSubscript:", *v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v22 = 0;
        v23 = &v22;
        v24 = 0x2020000000;
        v13 = (_QWORD *)getAVSystemController_RouteDescriptionKey_OtherDevicesConnected_UniqueIDSymbolLoc_ptr;
        v25 = getAVSystemController_RouteDescriptionKey_OtherDevicesConnected_UniqueIDSymbolLoc_ptr;
        if (!getAVSystemController_RouteDescriptionKey_OtherDevicesConnected_UniqueIDSymbolLoc_ptr)
        {
          v14 = (void *)MediaExperienceLibrary_0();
          v13 = dlsym(v14, "AVSystemController_RouteDescriptionKey_OtherDevicesConnected_UniqueID");
          v23[3] = (uint64_t)v13;
          getAVSystemController_RouteDescriptionKey_OtherDevicesConnected_UniqueIDSymbolLoc_ptr = (uint64_t)v13;
        }
        _Block_object_dispose(&v22, 8);
        if (!v13)
          -[TUAudioRoute identifiersOfOtherConnectedDevices].cold.2();
        objc_msgSend(v12, "objectForKeyedSubscript:", *v13, (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          objc_msgSend(v3, "addObject:", v15);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v9);
  }

  v16 = (void *)objc_msgSend(v3, "copy");
  return v16;
}

- (NSString)avAudioRouteName
{
  return self->_avAudioRouteName;
}

- (NSDictionary)route
{
  return self->_route;
}

- (void)initWithDictionary:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_RouteUID(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 51, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)initWithDictionary:.cold.2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_RouteName(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 49, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)initWithDictionary:.cold.3()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_AVAudioRouteName(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 30, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)isCurrentlyPicked
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_RouteCurrentlyPicked(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 48, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)isBluetooth
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_IsBTRoute(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 41, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)isBluetoothManaged
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_IsBTManaged(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 37, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)isA2DPRoute
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_IsA2DPRoute(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 36, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)isInEarDetectionEnabled
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectEnabled(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 46, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)isInEarDetectionSupported
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_InEarDetectSupported(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 47, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)isWiredHeadset
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_HeadphoneJackHasInputAttribute(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 26, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)isWirelessHeadset
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_PickableRouteType_Wireless(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 29, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)isDefaultRoute
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_PickableRouteType_Default(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 28, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)isPreferred
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_IsPreferredExternalRoute(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 42, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)isPreferredAndActive
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_PreferredExternalRouteDetails_IsActive(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 45, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)isPartnerRouteRoutable
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_PartnerRouteRoutable(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 38, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)isSiblingRoutePresent
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_SiblingRoutePresent(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 40, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)supportsSharePlay
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_SupportsSharePlay(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 52, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)bluetoothProductIdentifier
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_BTDetails_ProductID(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 39, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)isHeadphoneJackConnected
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_HeadphoneJackIsConnectedAttribute(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 27, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)_routeTypeEqualTo:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_RouteType(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 50, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

- (void)identifiersOfOtherConnectedDevices
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getAVSystemController_RouteDescriptionKey_OtherDevicesConnected_UniqueID(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("TUAudioRoute.m"), 44, CFSTR("%s"), OUTLINED_FUNCTION_1_2());

  __break(1u);
}

@end
