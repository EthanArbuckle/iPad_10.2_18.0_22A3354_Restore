@implementation STInstalledApp

+ (id)bundleIdentifiersInstalledForDSID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "longLongValue"))
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("userDeviceState.user.dsid"), v7);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("userDeviceState.user.localUserDeviceState"), v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[STInstalledApp bundleIdentifiersInstalledForPredicate:inContext:error:](STInstalledApp, "bundleIdentifiersInstalledForPredicate:inContext:error:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)bundleIdentifiersInstalledForAltDSID:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length"))
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("userDeviceState.user.altDSID"), v7);
  else
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != NULL"), CFSTR("userDeviceState.user.localUserDeviceState"), v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[STInstalledApp bundleIdentifiersInstalledForPredicate:inContext:error:](STInstalledApp, "bundleIdentifiersInstalledForPredicate:inContext:error:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)bundleIdentifiersInstalledForPredicate:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[STInstalledApp fetchRequest](STInstalledApp, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setResultType:", 2);
  objc_msgSend(v7, "setReturnsDistinctResults:", 1);
  v17[0] = CFSTR("bundleIdentifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPropertiesToFetch:", v8);

  objc_msgSend(v7, "setPredicate:", v6);
  v16 = 0;
  objc_msgSend(v7, "execute:", &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  v11 = v10;
  if (v9)
  {
    v12 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v9, "valueForKey:", CFSTR("bundleIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
    if (a5 && v10)
    {
      v14 = 0;
      *a5 = objc_retainAutorelease(v10);
    }
  }

  return v14;
}

- (void)setUserDeviceState:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "localDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STInstalledApp setInstalledLocally:](self, "setInstalledLocally:", v4 != 0);

  -[STInstalledApp managedObjectOriginal_setUserDeviceState:](self, "managedObjectOriginal_setUserDeviceState:", v5);
}

+ (id)fetchRequest
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___STInstalledApp;
  objc_msgSendSuper2(&v3, sel_fetchRequest);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("bundleIdentifier")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("userDeviceState")))
  {
    -[STUniquedManagedObject updateUniqueIdentifier](self, "updateUniqueIdentifier");
  }
  v5.receiver = self;
  v5.super_class = (Class)STInstalledApp;
  -[STInstalledApp didChangeValueForKey:](&v5, sel_didChangeValueForKey_, v4);

}

- (id)computeUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "serializableClassName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STInstalledApp bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STInstalledApp userDeviceState](self, "userDeviceState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%@-%@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)STInstalledApp;
  -[STUniquedManagedObject dictionaryRepresentation](&v18, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STInstalledApp adamID](self, "adamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("adamID"));

  -[STInstalledApp betaVersionIdentifier](self, "betaVersionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("betaVersionIdentifier"));

  -[STInstalledApp bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("bundleIdentifier"));

  -[STInstalledApp displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("displayName"));

  -[STInstalledApp distributorID](self, "distributorID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("distributorID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STInstalledApp distributorIsThirdParty](self, "distributorIsThirdParty"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("distributorIsThirdParty"));

  -[STInstalledApp iconData](self, "iconData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("iconData"));

  -[STInstalledApp versionIdentifier](self, "versionIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("versionIdentifier"));

  -[STInstalledApp userDeviceState](self, "userDeviceState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uniqueIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[STInstalledApp userDeviceState](self, "userDeviceState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("userDeviceState"));

  }
  v16 = (void *)objc_msgSend(v3, "copy");

  return v16;
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  STInstalledApp *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adamID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STInstalledApp setAdamID:](self, "setAdamID:", v5);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("betaVersionIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STInstalledApp setBetaVersionIdentifier:](self, "setBetaVersionIdentifier:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STInstalledApp setBundleIdentifier:](self, "setBundleIdentifier:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("versionIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STInstalledApp setVersionIdentifier:](self, "setVersionIdentifier:", v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("distributorIsThirdParty"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STInstalledApp setDistributorIsThirdParty:](self, "setDistributorIsThirdParty:", objc_msgSend(v9, "BOOLValue"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    -[STInstalledApp setDisplayName:](self, "setDisplayName:", v10);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("distributorID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[STInstalledApp setDistributorID:](self, "setDistributorID:", v11);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("iconData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    -[STInstalledApp setIconData:](self, "setIconData:", v12);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userDeviceState"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    +[STUserDeviceState fetchRequest](STUserDeviceState, "fetchRequest");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uniqueIdentifier"), v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPredicate:", v15);

    v26 = 0;
    objc_msgSend(v14, "execute:", &v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v26;
    objc_msgSend(v16, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[STInstalledApp setUserDeviceState:](self, "setUserDeviceState:", v18);

  }
  else
  {
    -[STInstalledApp setUserDeviceState:](self, "setUserDeviceState:", 0);
    v17 = 0;
  }
  -[STInstalledApp userDeviceState](self, "userDeviceState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = 1;
  }
  else
  {
    v21 = _os_feature_enabled_impl();
    +[STLog appMonitor](STLog, "appMonitor");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);
    if ((v21 & 1) != 0)
    {
      if (v23)
        -[STInstalledApp updateWithDictionaryRepresentation:].cold.1(self);
    }
    else
    {
      if (v23)
        -[STInstalledApp updateWithDictionaryRepresentation:].cold.2(self);

      +[STLog screentime](STLog, "screentime");
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v28 = "-[STInstalledApp updateWithDictionaryRepresentation:]";
        v29 = 2112;
        v30 = self;
        _os_log_impl(&dword_1D22E7000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s: Deleting installed app (%@)", buf, 0x16u);
      }

      -[STInstalledApp managedObjectContext](self, "managedObjectContext");
      v22 = objc_claimAutoreleasedReturnValue();
      -[NSObject deleteObject:](v22, "deleteObject:", self);
    }
    v20 = v21 ^ 1;

  }
  return v20;
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[STInstalledApp dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)fetchOrCreateWithDictionaryRepresentation:(id)a3 inContext:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  STInstalledApp *v14;

  v8 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("uniqueIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uniqueIdentifier"), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  objc_msgSend(v10, "execute:", a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "firstObject");
    v14 = (STInstalledApp *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      v14 = -[STInstalledApp initWithContext:]([STInstalledApp alloc], "initWithContext:", v8);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (NSString)serializableClassName
{
  return (NSString *)CFSTR("app");
}

- (void)updateIconDataWithURL:(id)a3
{
  id v4;
  float v5;
  float v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CGImage *v13;
  __CFData *v14;
  __CFString *v15;
  CGImageDestination *v16;
  const __CFAllocator *v17;
  CFNumberRef v18;
  CFNumberRef v19;
  void *v20;
  const __CFDictionary *v21;
  float valuePtr;
  uint64_t v23;
  void *values[3];
  void *keys[3];
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  MGGetFloat32Answer();
  v6 = v5;
  v7 = v5;
  v8 = 87.0 / v5;
  v23 = 29 * (uint64_t)v5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A820]), "initWithURL:", v4);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v8, v8, v7);
  v26[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "prepareImagesForImageDescriptors:", v11);

  objc_msgSend(v9, "imageForDescriptor:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (CGImage *)objc_msgSend(v12, "CGImage");
  v14 = (__CFData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 4096);
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v16 = CGImageDestinationCreateWithData(v14, v15, 1uLL, 0);

  valuePtr = v6 * 72.0;
  v17 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v18 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloatType, &valuePtr);
  v19 = CFNumberCreate(v17, kCFNumberLongType, &v23);
  v20 = (void *)*MEMORY[0x1E0CBC9F8];
  keys[0] = *(void **)MEMORY[0x1E0CBCA00];
  keys[1] = v20;
  keys[2] = *(void **)MEMORY[0x1E0CBC778];
  values[0] = v18;
  values[1] = v18;
  values[2] = v19;
  v21 = CFDictionaryCreate(v17, (const void **)keys, (const void **)values, 3, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFRelease(v18);
  CFRelease(v19);
  CGImageDestinationAddImage(v16, v13, v21);
  CFRelease(v21);
  CGImageDestinationFinalize(v16);
  -[STInstalledApp setIconData:](self, "setIconData:", v14);
  CFRelease(v16);

}

- (void)updateWithDictionaryRepresentation:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1D22E7000, v2, v3, "InstalledApp %@ without a UserDeviceState: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

- (void)updateWithDictionaryRepresentation:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "uniqueIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_1D22E7000, v2, v3, "Deleted orphaned InstalledApp %@ without a UserDeviceState: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2_3();
}

@end
