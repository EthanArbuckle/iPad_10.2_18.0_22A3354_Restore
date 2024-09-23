@implementation RCPEventSenderProperties

- (unint64_t)senderID
{
  return self->_senderID;
}

+ (id)touchScreenDigitizerSender
{
  if (touchScreenDigitizerSender_onceToken != -1)
    dispatch_once(&touchScreenDigitizerSender_onceToken, &__block_literal_global_81);
  return (id)touchScreenDigitizerSender_sender;
}

- (BOOL)sendsMousePointerEvents
{
  return self->_sendsMousePointerEvents;
}

- (NSDictionary)properties
{
  return self->_properties;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RCPEventSenderProperties)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  RCPEventSenderProperties *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("properties"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("senderID"));

  objc_msgSend((id)objc_opt_class(), "senderWithProperties:senderID:", v5, v6);
  v7 = (RCPEventSenderProperties *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *properties;
  id v5;

  properties = self->_properties;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", properties, CFSTR("properties"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_senderID, CFSTR("senderID"));

}

+ (id)_cachedPropertiesOrCacheIfNeeded:(id)a3 senderID:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (_cachedPropertiesOrCacheIfNeeded_senderID__onceToken != -1)
    dispatch_once(&_cachedPropertiesOrCacheIfNeeded_senderID__onceToken, &__block_literal_global_5);
  objc_msgSend((id)_cachedPropertiesOrCacheIfNeeded_senderID__cache, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[RCPEventSenderProperties _senderWithProperties:senderID:](RCPEventSenderProperties, "_senderWithProperties:senderID:", v5, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)_cachedPropertiesOrCacheIfNeeded_senderID__cache, "setObject:forKeyedSubscript:", v6, v5);
  }

  return v6;
}

void __70__RCPEventSenderProperties__cachedPropertiesOrCacheIfNeeded_senderID___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)_cachedPropertiesOrCacheIfNeeded_senderID__cache;
  _cachedPropertiesOrCacheIfNeeded_senderID__cache = (uint64_t)v0;

}

+ (id)supplyMissingStandardProperties:(id)a3 senderID:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[2];
  _QWORD v44[2];
  void *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  _BYTE v48[128];
  _QWORD v49[2];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (supplyMissingStandardProperties_senderID__onceToken != -1)
    dispatch_once(&supplyMissingStandardProperties_senderID__onceToken, &__block_literal_global_6);
  v6 = (void *)objc_msgSend((id)supplyMissingStandardProperties_senderID__defaultProperties, "mutableCopy");
  objc_msgSend(v6, "addEntriesFromDictionary:", v5);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PrimaryUsagePage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("page"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("PrimaryUsagePage"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PrimaryUsage"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("usage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("PrimaryUsage"));

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DeviceUsagePairs"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("usagePairs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v37 = a4;
      v38 = v5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PrimaryUsagePage"));
      v14 = objc_claimAutoreleasedReturnValue();
      v36 = v6;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PrimaryUsage"));
      v49[0] = CFSTR("DeviceUsagePage");
      v49[1] = CFSTR("DeviceUsage");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)v14;
      v50[0] = v14;
      v50[1] = v33;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v15);

      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v35 = v12;
      v16 = v12;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v40;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v40 != v19)
              objc_enumerationMutation(v16);
            v21 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("page"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("usage"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v46[0] = CFSTR("DeviceUsagePage");
            v46[1] = CFSTR("DeviceUsage");
            v47[0] = v22;
            v47[1] = v23;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v24);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        }
        while (v18);
      }

      v6 = v36;
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v13, CFSTR("DeviceUsagePairs"));
      a4 = v37;
      v5 = v38;
      v25 = v34;
      v12 = v35;
      v26 = (void *)v33;
    }
    else
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PrimaryUsagePage"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PrimaryUsage"));
      v27 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v27;
      if (!v13 || !v27)
        goto LABEL_25;
      v43[0] = CFSTR("DeviceUsagePage");
      v43[1] = CFSTR("DeviceUsage");
      v44[0] = v13;
      v44[1] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("DeviceUsagePairs"));

    }
LABEL_25:

  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocationID"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("recap-bus-%d"), supplyMissingStandardProperties_senderID__deviceCount);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v30, CFSTR("LocationID"));

    ++supplyMissingStandardProperties_senderID__deviceCount;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v31, CFSTR("recapSenderID"));

  }
  return v6;
}

void __69__RCPEventSenderProperties_supplyMissingStandardProperties_senderID___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[4];
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Transport");
  v2[1] = CFSTR("Authenticated");
  v3[0] = CFSTR("Recap");
  v3[1] = MEMORY[0x1E0C9AAB0];
  v2[2] = CFSTR("VendorID");
  v2[3] = CFSTR("ProductID");
  v3[2] = &unk_1E4FCC7F8;
  v3[3] = &unk_1E4FCC7F8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)supplyMissingStandardProperties_senderID__defaultProperties;
  supplyMissingStandardProperties_senderID__defaultProperties = v0;

}

+ (id)senderFromIOHIDService:(__IOHIDServiceClient *)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  const __CFString *v13;
  CFTypeRef v14;
  const void *v15;
  void *v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  IOHIDServiceClientGetRegistryID(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongLongValue");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v6;
  if (senderFromIOHIDService__onceToken != -1)
    dispatch_once(&senderFromIOHIDService__onceToken, &__block_literal_global_44);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (id)senderFromIOHIDService__persistentPropertyKeys;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(const __CFString **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v14 = IOHIDServiceClientCopyProperty(a3, v13);
        if (v14)
        {
          v15 = v14;
          objc_msgSend(v7, "setObject:forKey:", v14, v13);
          CFRelease(v15);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  objc_msgSend(a1, "senderWithProperties:senderID:", v7, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __51__RCPEventSenderProperties_senderFromIOHIDService___block_invoke()
{
  void *v0;

  v0 = (void *)senderFromIOHIDService__persistentPropertyKeys;
  senderFromIOHIDService__persistentPropertyKeys = (uint64_t)&unk_1E4FCCFA0;

}

+ (BOOL)_isMouseSender:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKey:", CFSTR("DeviceUsagePairs"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DeviceUsagePage"), (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DeviceUsage"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "intValue") == 1 && objc_msgSend(v10, "intValue") == 2)
        {

          v11 = 1;
          goto LABEL_12;
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

+ (id)_senderWithProperties:(id)a3 senderID:(unint64_t)a4
{
  id v6;
  RCPEventSenderProperties *v7;
  uint64_t v8;
  NSDictionary *properties;

  v6 = a3;
  v7 = objc_alloc_init(RCPEventSenderProperties);
  v8 = objc_msgSend(v6, "copy");
  properties = v7->_properties;
  v7->_properties = (NSDictionary *)v8;

  v7->_senderID = a4;
  LOBYTE(a4) = objc_msgSend(a1, "_isMouseSender:", v6);

  v7->_sendsMousePointerEvents = a4;
  return v7;
}

+ (id)senderWithProperties:(id)a3
{
  return (id)objc_msgSend(a1, "senderWithProperties:senderID:", a3, 0);
}

+ (id)senderWithProperties:(id)a3 senderID:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_80);
  objc_msgSend(a1, "supplyMissingStandardProperties:senderID:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_cachedPropertiesOrCacheIfNeeded:senderID:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __54__RCPEventSenderProperties_touchScreenDigitizerSender__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[RCPEventSenderProperties senderWithProperties:](RCPEventSenderProperties, "senderWithProperties:", &unk_1E4FCCFE8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)touchScreenDigitizerSender_sender;
  touchScreenDigitizerSender_sender = v0;

}

+ (id)touchScreenDigitizerSenderForDisplayUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (touchScreenDigitizerSenderForDisplayUUID__onceToken != -1)
    dispatch_once(&touchScreenDigitizerSenderForDisplayUUID__onceToken, &__block_literal_global_89);
  objc_msgSend((id)touchScreenDigitizerSenderForDisplayUUID__touchScreenDigitizerSenders, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "touchScreenDigitizerSender");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("Built-In"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, CFSTR("displayUUID"));
    +[RCPEventSenderProperties senderWithProperties:](RCPEventSenderProperties, "senderWithProperties:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)touchScreenDigitizerSenderForDisplayUUID__touchScreenDigitizerSenders, "setObject:forKeyedSubscript:", v5, v4);

  }
  return v5;
}

void __69__RCPEventSenderProperties_touchScreenDigitizerSenderForDisplayUUID___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)touchScreenDigitizerSenderForDisplayUUID__touchScreenDigitizerSenders;
  touchScreenDigitizerSenderForDisplayUUID__touchScreenDigitizerSenders = v0;

}

+ (id)pencilDigitizerSender
{
  if (pencilDigitizerSender_onceToken != -1)
    dispatch_once(&pencilDigitizerSender_onceToken, &__block_literal_global_92);
  return (id)pencilDigitizerSender_sender;
}

void __49__RCPEventSenderProperties_pencilDigitizerSender__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[RCPEventSenderProperties senderWithProperties:](RCPEventSenderProperties, "senderWithProperties:", &unk_1E4FCD010);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)pencilDigitizerSender_sender;
  pencilDigitizerSender_sender = v0;

}

+ (id)mouseSender
{
  if (mouseSender_onceToken != -1)
    dispatch_once(&mouseSender_onceToken, &__block_literal_global_99);
  return (id)mouseSender_sender;
}

void __39__RCPEventSenderProperties_mouseSender__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[RCPEventSenderProperties senderWithProperties:](RCPEventSenderProperties, "senderWithProperties:", &unk_1E4FCD088);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)mouseSender_sender;
  mouseSender_sender = v0;

}

+ (id)trackpadSender
{
  if (trackpadSender_onceToken != -1)
    dispatch_once(&trackpadSender_onceToken, &__block_literal_global_121);
  return (id)trackpadSender_sender;
}

void __42__RCPEventSenderProperties_trackpadSender__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[RCPEventSenderProperties senderWithProperties:](RCPEventSenderProperties, "senderWithProperties:", &unk_1E4FCD150);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)trackpadSender_sender;
  trackpadSender_sender = v0;

}

+ (id)gamepadSender
{
  if (gamepadSender_onceToken != -1)
    dispatch_once(&gamepadSender_onceToken, &__block_literal_global_158);
  return (id)gamepadSender_sender;
}

void __41__RCPEventSenderProperties_gamepadSender__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[RCPEventSenderProperties senderWithProperties:](RCPEventSenderProperties, "senderWithProperties:", &unk_1E4FCD178);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gamepadSender_sender;
  gamepadSender_sender = v0;

}

+ (id)tvRemoteSender
{
  if (tvRemoteSender_onceToken != -1)
    dispatch_once(&tvRemoteSender_onceToken, &__block_literal_global_163);
  return (id)tvRemoteSender_sender;
}

void __42__RCPEventSenderProperties_tvRemoteSender__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PrimaryUsagePage");
  v3[1] = CFSTR("PrimaryUsage");
  v4[0] = &unk_1E4FCC810;
  v4[1] = &unk_1E4FCC960;
  v3[2] = CFSTR("Authenticated");
  v3[3] = CFSTR("Built-In");
  v4[2] = MEMORY[0x1E0C9AAB0];
  v4[3] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCPEventSenderProperties senderWithProperties:](RCPEventSenderProperties, "senderWithProperties:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)tvRemoteSender_sender;
  tvRemoteSender_sender = v1;

}

+ (id)keyboardSender
{
  if (keyboardSender_onceToken != -1)
    dispatch_once(&keyboardSender_onceToken, &__block_literal_global_164);
  return (id)keyboardSender_sender;
}

void __42__RCPEventSenderProperties_keyboardSender__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PrimaryUsagePage");
  v3[1] = CFSTR("PrimaryUsage");
  v4[0] = &unk_1E4FCC888;
  v4[1] = &unk_1E4FCC978;
  v3[2] = CFSTR("Authenticated");
  v4[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCPEventSenderProperties senderWithProperties:](RCPEventSenderProperties, "senderWithProperties:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)keyboardSender_sender;
  keyboardSender_sender = v1;

}

+ (id)keyboardSenderForDisplayUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (keyboardSenderForDisplayUUID__onceToken != -1)
    dispatch_once(&keyboardSenderForDisplayUUID__onceToken, &__block_literal_global_166);
  objc_msgSend((id)keyboardSenderForDisplayUUID__keyboardSenders, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(a1, "keyboardSender");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "properties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "setObject:forKeyedSubscript:", v4, CFSTR("displayUUID"));
    +[RCPEventSenderProperties senderWithProperties:](RCPEventSenderProperties, "senderWithProperties:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)keyboardSenderForDisplayUUID__keyboardSenders, "setObject:forKeyedSubscript:", v5, v4);

  }
  return v5;
}

void __57__RCPEventSenderProperties_keyboardSenderForDisplayUUID___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)keyboardSenderForDisplayUUID__keyboardSenders;
  keyboardSenderForDisplayUUID__keyboardSenders = v0;

}

+ (id)naturalInputCollectionSender
{
  if (naturalInputCollectionSender_onceToken != -1)
    dispatch_once(&naturalInputCollectionSender_onceToken, &__block_literal_global_167_0);
  return (id)naturalInputCollectionSender_sender;
}

void __56__RCPEventSenderProperties_naturalInputCollectionSender__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[RCPEventSenderProperties senderWithProperties:](RCPEventSenderProperties, "senderWithProperties:", &unk_1E4FCD1A0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)naturalInputCollectionSender_sender;
  naturalInputCollectionSender_sender = v0;

}

+ (id)globalPositionSender
{
  if (globalPositionSender_onceToken != -1)
    dispatch_once(&globalPositionSender_onceToken, &__block_literal_global_173);
  return (id)globalPositionSender_sender;
}

void __48__RCPEventSenderProperties_globalPositionSender__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[RCPEventSenderProperties senderWithProperties:](RCPEventSenderProperties, "senderWithProperties:", &unk_1E4FCD1C8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)globalPositionSender_sender;
  globalPositionSender_sender = v0;

}

+ (id)crownSender
{
  if (crownSender_onceToken != -1)
    dispatch_once(&crownSender_onceToken, &__block_literal_global_179);
  return (id)crownSender_sender;
}

void __39__RCPEventSenderProperties_crownSender__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PrimaryUsagePage");
  v3[1] = CFSTR("PrimaryUsage");
  v4[0] = &unk_1E4FCC9F0;
  v4[1] = &unk_1E4FCC888;
  v3[2] = CFSTR("Authenticated");
  v3[3] = CFSTR("Built-In");
  v4[2] = MEMORY[0x1E0C9AAB0];
  v4[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCPEventSenderProperties senderWithProperties:](RCPEventSenderProperties, "senderWithProperties:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)crownSender_sender;
  crownSender_sender = v1;

}

+ (id)phoneButtonSender
{
  if (phoneButtonSender_onceToken != -1)
    dispatch_once(&phoneButtonSender_onceToken, &__block_literal_global_181);
  return (id)phoneButtonSender_sender;
}

void __45__RCPEventSenderProperties_phoneButtonSender__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("PrimaryUsagePage");
  v3[1] = CFSTR("PrimaryUsage");
  v4[0] = &unk_1E4FCCA08;
  v4[1] = &unk_1E4FCC888;
  v3[2] = CFSTR("Authenticated");
  v3[3] = CFSTR("Built-In");
  v4[2] = MEMORY[0x1E0C9AAB0];
  v4[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[RCPEventSenderProperties senderWithProperties:](RCPEventSenderProperties, "senderWithProperties:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)phoneButtonSender_sender;
  phoneButtonSender_sender = v1;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
