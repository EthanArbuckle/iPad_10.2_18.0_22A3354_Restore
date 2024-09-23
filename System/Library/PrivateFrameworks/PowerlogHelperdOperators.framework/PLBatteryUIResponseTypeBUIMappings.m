@implementation PLBatteryUIResponseTypeBUIMappings

- (id)dependencies
{
  return 0;
}

- (void)run
{
  void *v3;
  void *v4;
  id v5;

  -[PLBatteryUIResponseTypeBUIMappings getInstalledPluginMapping](self, "getInstalledPluginMapping");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[PLBatteryUIResponseTypeUtilities getBundleIDToReplacementBundleIDMap](PLBatteryUIResponseTypeUtilities, "getBundleIDToReplacementBundleIDMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v3);

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBUIMappings setBatteryUIMappings:](self, "setBatteryUIMappings:", v4);

}

- (id)result
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("buiMappings");
  -[PLBatteryUIResponseTypeBUIMappings batteryUIMappings](self, "batteryUIMappings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)getInstalledPluginMapping
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(MEMORY[0x1E0CA5848], "enumeratorWithOptions:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v7);
        objc_msgSend(v8, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "containingBundleRecord");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "extensionPointRecord");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          v14 = v11 == 0;
        else
          v14 = 1;
        if (!v14)
        {
          if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.posterkit.provider")))
          {
            v15 = v2;
            v16 = CFSTR("HLS");
            goto LABEL_18;
          }
          if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider")))
          {
            v15 = v2;
            v16 = CFSTR("com.apple.mobileslideshow");
            goto LABEL_18;
          }
          if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.sidecar.extension.capture")))
          {
            v15 = v2;
            v16 = CFSTR("ContinuityCamera");
            goto LABEL_18;
          }
          if (objc_msgSend(v13, "isEqualToString:", CFSTR("HomeKit")))
          {
            v15 = v2;
            v16 = CFSTR("com.apple.Home");
LABEL_18:
            objc_msgSend(v15, "setObject:forKey:", v16, v9);
LABEL_19:
            objc_msgSend(v2, "setObject:forKey:", v11, v9);
            goto LABEL_20;
          }
          if (objc_msgSend(v13, "hasSuffix:", CFSTR("/watch")))
          {
            v17 = objc_msgSend(v13, "length") - 6;
          }
          else
          {
            if (!objc_msgSend(v13, "hasSuffix:", CFSTR(".watchkitextension")))
              goto LABEL_19;
            v17 = objc_msgSend(v13, "length") - 18;
          }
          objc_msgSend(v13, "substringWithRange:", 0, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKey:", v18, v9);

          goto LABEL_19;
        }
LABEL_20:

        ++v7;
      }
      while (v5 != v7);
      v19 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      v5 = v19;
    }
    while (v19);
  }

  return v2;
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponderService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDictionary)batteryUIMappings
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBatteryUIMappings:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryUIMappings, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

@end
