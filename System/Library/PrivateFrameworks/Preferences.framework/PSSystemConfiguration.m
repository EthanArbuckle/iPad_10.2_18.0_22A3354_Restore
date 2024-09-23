@implementation PSSystemConfiguration

+ (id)sharedInstance
{
  if (sharedInstance_cacheOnce != -1)
    dispatch_once(&sharedInstance_cacheOnce, &__block_literal_global_12);
  return (id)sharedInstance___sharedInstance;
}

void __39__PSSystemConfiguration_sharedInstance__block_invoke()
{
  PSSystemConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(PSSystemConfiguration);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

- (void)dealloc
{
  __SCPreferences *prefs;
  objc_super v4;

  prefs = self->_prefs;
  if (prefs)
    CFRelease(prefs);
  v4.receiver = self;
  v4.super_class = (Class)PSSystemConfiguration;
  -[PSSystemConfiguration dealloc](&v4, sel_dealloc);
}

- (unsigned)synchronizeForWriting:(BOOL)a3
{
  __SCPreferences *prefs;
  int v6;
  __SCPreferences *v7;
  int v8;
  const char *v9;

  prefs = self->_prefs;
  if (!prefs)
  {
    v7 = SCPreferencesCreateWithAuthorization(0, CFSTR("com.apple.preferences"), 0, 0);
    self->_prefs = v7;
    if (a3)
      goto LABEL_6;
LABEL_10:
    LOBYTE(v6) = 1;
    return v6;
  }
  if (!a3)
  {
    SCPreferencesSynchronize(prefs);
    goto LABEL_10;
  }
  v6 = SCPreferencesLock(prefs, 1u);
  if (v6)
    goto LABEL_7;
  SCPreferencesSynchronize(self->_prefs);
  v7 = self->_prefs;
LABEL_6:
  v6 = SCPreferencesLock(v7, 1u);
LABEL_7:
  if (!v6)
  {
    v8 = SCError();
    v9 = SCErrorString(v8);
    NSLog(CFSTR("SCPreferencesLock failed: %s"), v9);
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)cleanupPrefs
{
  __SCPreferences *prefs;

  prefs = self->_prefs;
  if (prefs)
  {
    CFRelease(prefs);
    self->_prefs = 0;
  }
}

- (__CFString)dataServiceID
{
  const __SCNetworkSet *v3;
  const __SCNetworkSet *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  const __SCNetworkService *ValueAtIndex;
  const __SCNetworkInterface *Interface;
  const __SCNetworkInterface *v12;
  CFStringRef InterfaceType;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;

  -[PSSystemConfiguration synchronizeForWriting:](self, "synchronizeForWriting:", 0);
  v3 = SCNetworkSetCopyCurrent(self->_prefs);
  if (!v3)
  {
    v17 = 0;
    goto LABEL_17;
  }
  v4 = v3;
  v5 = SCNetworkSetCopyServices(v3);
  if (!v5)
  {
    v17 = 0;
    goto LABEL_16;
  }
  v6 = v5;
  Count = CFArrayGetCount(v5);
  if (Count < 1)
  {
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  v8 = Count;
  v9 = 0;
  while (1)
  {
    ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v6, v9);
    Interface = SCNetworkServiceGetInterface(ValueAtIndex);
    if (!Interface)
      goto LABEL_11;
    v12 = Interface;
    InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
    if (!InterfaceType || !CFEqual(InterfaceType, CFSTR("com.apple.CommCenter")))
      goto LABEL_11;
    SCNetworkInterfaceGetConfiguration(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("AllowNetworkAccess"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if ((objc_msgSend(v15, "BOOLValue") & 1) != 0)
        break;
    }

LABEL_11:
    if (v8 == ++v9)
      goto LABEL_12;
  }
  v17 = (__CFString *)(id)-[__CFString copy]((id)SCNetworkServiceGetServiceID(ValueAtIndex), "copy");

LABEL_13:
  CFRelease(v6);
LABEL_16:
  CFRelease(v4);
LABEL_17:
  -[PSSystemConfiguration cleanupPrefs](self, "cleanupPrefs");
  return v17;
}

- (__CFString)voicemailServiceID
{
  const __SCNetworkSet *v3;
  const __SCNetworkSet *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  const __SCNetworkService *ValueAtIndex;
  const __SCNetworkInterface *Interface;
  const __SCNetworkInterface *v12;
  CFStringRef InterfaceType;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;

  -[PSSystemConfiguration synchronizeForWriting:](self, "synchronizeForWriting:", 0);
  v3 = SCNetworkSetCopyCurrent(self->_prefs);
  if (!v3)
  {
    v17 = 0;
    goto LABEL_17;
  }
  v4 = v3;
  v5 = SCNetworkSetCopyServices(v3);
  if (!v5)
  {
    v17 = 0;
    goto LABEL_16;
  }
  v6 = v5;
  Count = CFArrayGetCount(v5);
  if (Count < 1)
  {
LABEL_12:
    v17 = 0;
    goto LABEL_13;
  }
  v8 = Count;
  v9 = 0;
  while (1)
  {
    ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v6, v9);
    Interface = SCNetworkServiceGetInterface(ValueAtIndex);
    if (!Interface)
      goto LABEL_11;
    v12 = Interface;
    InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
    if (!InterfaceType || !CFEqual(InterfaceType, CFSTR("com.apple.CommCenter")))
      goto LABEL_11;
    SCNetworkInterfaceGetConfiguration(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("AllowNetworkAccess"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if (!objc_msgSend(v15, "BOOLValue"))
        break;
    }

LABEL_11:
    if (v8 == ++v9)
      goto LABEL_12;
  }
  v17 = (__CFString *)(id)-[__CFString copy]((id)SCNetworkServiceGetServiceID(ValueAtIndex), "copy");

LABEL_13:
  CFRelease(v6);
LABEL_16:
  CFRelease(v4);
LABEL_17:
  -[PSSystemConfiguration cleanupPrefs](self, "cleanupPrefs");
  return v17;
}

- (__CFString)getServiceIDForPDPContext:(unsigned int)a3
{
  CFStringRef v4;
  CFStringRef v5;
  const __SCNetworkSet *v6;
  const __SCNetworkSet *v7;
  const __CFArray *v8;
  const __CFArray *v9;
  CFIndex Count;
  CFIndex v11;
  CFIndex v12;
  const __SCNetworkService *ValueAtIndex;
  const __SCNetworkInterface *Interface;
  const __SCNetworkInterface *v15;
  CFStringRef InterfaceType;
  CFStringRef BSDName;
  __CFString *v18;

  v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("ip%d"), a3);
  if (!v4)
    return 0;
  v5 = v4;
  -[PSSystemConfiguration synchronizeForWriting:](self, "synchronizeForWriting:", 0);
  v6 = SCNetworkSetCopyCurrent(self->_prefs);
  if (v6)
  {
    v7 = v6;
    v8 = SCNetworkSetCopyServices(v6);
    if (v8)
    {
      v9 = v8;
      Count = CFArrayGetCount(v8);
      if (Count < 1)
      {
LABEL_12:
        v18 = 0;
      }
      else
      {
        v11 = Count;
        v12 = 0;
        while (1)
        {
          ValueAtIndex = (const __SCNetworkService *)CFArrayGetValueAtIndex(v9, v12);
          Interface = SCNetworkServiceGetInterface(ValueAtIndex);
          if (Interface)
          {
            v15 = Interface;
            InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
            if (InterfaceType)
            {
              if (CFEqual(InterfaceType, CFSTR("com.apple.CommCenter")))
              {
                BSDName = SCNetworkInterfaceGetBSDName(v15);
                if (BSDName)
                {
                  if (CFEqual(v5, BSDName))
                    break;
                }
              }
            }
          }
          if (v11 == ++v12)
            goto LABEL_12;
        }
        v18 = (__CFString *)(id)-[__CFString copy]((id)SCNetworkServiceGetServiceID(ValueAtIndex), "copy");
      }
      CFRelease(v9);
    }
    else
    {
      v18 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    v18 = 0;
  }
  CFRelease(v5);
  -[PSSystemConfiguration cleanupPrefs](self, "cleanupPrefs");
  return v18;
}

- (id)interfaceConfigurationValueForKey:(__CFString *)a3 serviceID:(__CFString *)a4
{
  const __SCNetworkService *v7;
  const __SCNetworkService *v8;
  const __SCNetworkInterface *Interface;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a4)
  {
    -[PSSystemConfiguration synchronizeForWriting:](self, "synchronizeForWriting:", 0);
    v7 = SCNetworkServiceCopy(self->_prefs, a4);
    if (v7)
    {
      v8 = v7;
      Interface = SCNetworkServiceGetInterface(v7);
      if (Interface)
      {
        SCNetworkInterfaceGetConfiguration(Interface);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "objectForKey:", a3);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "copy");

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      v13 = 0;
    }
    -[PSSystemConfiguration cleanupPrefs](self, "cleanupPrefs");
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)setInterfaceConfigurationValue:(id)a3 forKey:(__CFString *)a4 serviceID:(__CFString *)a5
{
  const __SCNetworkService *v8;
  const __SCNetworkService *v9;
  const __SCNetworkInterface *Interface;
  const __SCNetworkInterface *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  int v16;
  const char *v17;
  id v18;

  v18 = a3;
  if (a5 && -[PSSystemConfiguration synchronizeForWriting:](self, "synchronizeForWriting:", 1))
  {
    v8 = SCNetworkServiceCopy(self->_prefs, a5);
    if (!v8)
    {
LABEL_17:
      -[PSSystemConfiguration cleanupPrefs](self, "cleanupPrefs");
      goto LABEL_18;
    }
    v9 = v8;
    Interface = SCNetworkServiceGetInterface(v8);
    if (!Interface)
    {
LABEL_16:
      CFRelease(v9);
      goto LABEL_17;
    }
    v11 = Interface;
    SCNetworkInterfaceGetConfiguration(Interface);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      NSLog(CFSTR("setInterfaceConfigurationValue: failed to get configuration. key:%@ value:%@"), a4, v18);
LABEL_15:

      goto LABEL_16;
    }
    v14 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v14, "setObject:forKey:", v18, a4);
    objc_msgSend(v14, "setObject:forKey:", *MEMORY[0x1E0C9AE50], CFSTR("SettingsHaveBeenAlteredByPreferences"));
    if (SCNetworkInterfaceSetConfiguration(v11, (CFDictionaryRef)v14))
    {
      if (SCPreferencesCommitChanges(self->_prefs))
      {
        if (SCPreferencesApplyChanges(self->_prefs))
        {
LABEL_14:

          goto LABEL_15;
        }
        v15 = CFSTR("SCPreferencesApplyChanges failed: %s");
      }
      else
      {
        v15 = CFSTR("SCPreferencesCommitChanges failed: %s");
      }
    }
    else
    {
      v15 = CFSTR("SCNetworkInterfaceSetConfiguration failed: %s");
    }
    v16 = SCError();
    v17 = SCErrorString(v16);
    NSLog(&v15->isa, v17);
    goto LABEL_14;
  }
LABEL_18:

}

- (id)protocolConfiguration:(__CFString *)a3 serviceID:(__CFString *)a4
{
  const __SCNetworkService *v7;
  const __SCNetworkService *v8;
  const __SCNetworkProtocol *v9;
  const __SCNetworkProtocol *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a4)
  {
    -[PSSystemConfiguration synchronizeForWriting:](self, "synchronizeForWriting:", 0);
    v7 = SCNetworkServiceCopy(self->_prefs, a4);
    if (v7)
    {
      v8 = v7;
      v9 = SCNetworkServiceCopyProtocol(v7, a3);
      if (v9)
      {
        v10 = v9;
        SCNetworkProtocolGetConfiguration(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
          v13 = (void *)objc_msgSend(v11, "copy");
        else
          v13 = 0;
        CFRelease(v10);

      }
      else
      {
        v13 = 0;
      }
      CFRelease(v8);
    }
    else
    {
      v13 = 0;
    }
    -[PSSystemConfiguration cleanupPrefs](self, "cleanupPrefs");
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

- (void)setProtocolConfiguration:(id)a3 protocolType:(__CFString *)a4 serviceID:(__CFString *)a5
{
  const __SCNetworkService *v8;
  const __SCNetworkService *v9;
  const __SCNetworkProtocol *v10;
  const __SCNetworkProtocol *v11;
  __CFString *v12;
  int v13;
  const char *v14;
  const __CFDictionary *config;

  config = (const __CFDictionary *)a3;
  if (a5 && -[PSSystemConfiguration synchronizeForWriting:](self, "synchronizeForWriting:", 1))
  {
    v8 = SCNetworkServiceCopy(self->_prefs, a5);
    if (!v8)
    {
LABEL_14:
      -[PSSystemConfiguration cleanupPrefs](self, "cleanupPrefs");
      goto LABEL_15;
    }
    v9 = v8;
    v10 = SCNetworkServiceCopyProtocol(v8, a4);
    if (!v10)
    {
LABEL_13:
      CFRelease(v9);
      goto LABEL_14;
    }
    v11 = v10;
    if (SCNetworkProtocolSetConfiguration(v10, config))
    {
      if (SCPreferencesCommitChanges(self->_prefs))
      {
        if (SCPreferencesApplyChanges(self->_prefs))
        {
LABEL_12:
          CFRelease(v11);
          goto LABEL_13;
        }
        v12 = CFSTR("SCPreferencesApplyChanges failed: %s");
      }
      else
      {
        v12 = CFSTR("SCPreferencesCommitChanges failed: %s");
      }
    }
    else
    {
      v12 = CFSTR("SCNetworkProtocolSetConfiguration failed: %s");
    }
    v13 = SCError();
    v14 = SCErrorString(v13);
    NSLog(&v12->isa, v14);
    goto LABEL_12;
  }
LABEL_15:

}

- (id)protocolConfigurationValueForKey:(__CFString *)a3 protocolType:(__CFString *)a4 serviceID:(__CFString *)a5
{
  const __SCNetworkService *v9;
  const __SCNetworkService *v10;
  const __SCNetworkProtocol *v11;
  const __SCNetworkProtocol *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (a5)
  {
    -[PSSystemConfiguration synchronizeForWriting:](self, "synchronizeForWriting:", 0);
    v9 = SCNetworkServiceCopy(self->_prefs, a5);
    if (v9)
    {
      v10 = v9;
      v11 = SCNetworkServiceCopyProtocol(v9, a4);
      if (v11)
      {
        v12 = v11;
        SCNetworkProtocolGetConfiguration(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "objectForKey:", a3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v15, "copy");

        }
        else
        {
          v16 = 0;
        }
        CFRelease(v12);

      }
      else
      {
        v16 = 0;
      }
      CFRelease(v10);
    }
    else
    {
      v16 = 0;
    }
    -[PSSystemConfiguration cleanupPrefs](self, "cleanupPrefs");
  }
  else
  {
    v16 = 0;
  }
  return v16;
}

- (void)setProtocolConfigurationValue:(id)a3 forKey:(__CFString *)a4 protocolType:(__CFString *)a5 serviceID:(__CFString *)a6
{
  const __SCNetworkService *v10;
  const __SCNetworkService *v11;
  const __SCNetworkProtocol *v12;
  const __SCNetworkProtocol *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  int v18;
  const char *v19;
  id v20;

  v20 = a3;
  if (a6 && -[PSSystemConfiguration synchronizeForWriting:](self, "synchronizeForWriting:", 1))
  {
    v10 = SCNetworkServiceCopy(self->_prefs, a6);
    if (!v10)
    {
LABEL_17:
      -[PSSystemConfiguration cleanupPrefs](self, "cleanupPrefs");
      goto LABEL_18;
    }
    v11 = v10;
    v12 = SCNetworkServiceCopyProtocol(v10, a5);
    if (!v12)
    {
LABEL_16:
      CFRelease(v11);
      goto LABEL_17;
    }
    v13 = v12;
    SCNetworkProtocolGetConfiguration(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (!v14)
    {
      NSLog(CFSTR("setProtocolConfigurationValue: failed to get configuration. key:%@ value:%@"), a4, v20);
LABEL_15:
      CFRelease(v13);

      goto LABEL_16;
    }
    v16 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v16, "setObject:forKey:", v20, a4);
    if (SCNetworkProtocolSetConfiguration(v13, (CFDictionaryRef)v16))
    {
      if (SCPreferencesCommitChanges(self->_prefs))
      {
        if (SCPreferencesApplyChanges(self->_prefs))
        {
LABEL_14:

          goto LABEL_15;
        }
        v17 = CFSTR("SCPreferencesApplyChanges failed: %s");
      }
      else
      {
        v17 = CFSTR("SCPreferencesCommitChanges failed: %s");
      }
    }
    else
    {
      v17 = CFSTR("SCNetworkProtocolSetConfiguration failed: %s");
    }
    v18 = SCError();
    v19 = SCErrorString(v18);
    NSLog(&v17->isa, v19);
    goto LABEL_14;
  }
LABEL_18:

}

@end
