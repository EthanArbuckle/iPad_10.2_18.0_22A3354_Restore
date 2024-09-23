@implementation PSGAboutDataSource

- (void)_addKey:(id)a3 localizedString:(id)a4 isCopyable:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v8 = (void *)MEMORY[0x24BE75590];
  v9 = a3;
  objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a4, self, 0, sel_valueForSpecifier_, 0, 4, 0);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v9, *MEMORY[0x24BE75AC0]);

  if (v5)
    objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759C8]);
  -[PSSpecifierDataSource specifiers](self, "specifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

}

- (void)_addLocalizedKey:(id)a3 identifier:(id)a4 isCopyable:(BOOL)a5 allowMultilineTitle:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v6 = a6;
  v7 = a5;
  v14 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, sel_valueForSpecifier_, 0, 4, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  if (v10 || (v12 = v14) != 0)
    objc_msgSend(v11, "setProperty:forKey:", v12, *MEMORY[0x24BE75AC0]);
  if (v7)
    objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE759C8]);
  if (v6)
    objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  -[PSSpecifierDataSource specifiers](self, "specifiers", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v11);

}

- (void)_addKey:(id)a3 localizedString:(id)a4 value:(id)a5 isCopyable:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  id v12;

  v6 = a6;
  v10 = a5;
  -[PSGAboutDataSource _addKey:localizedString:isCopyable:](self, "_addKey:localizedString:isCopyable:", a3, a4, v6);
  -[PSSpecifierDataSource specifiers](self, "specifiers");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGAboutDataSource _setValue:forSpecifier:](self, "_setValue:forSpecifier:", v10, v11);

}

- (void)_setValue:(id)a3 forSpecifierWithKey:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[PSSpecifierDataSource specifierForID:](self, "specifierForID:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PSGAboutDataSource _setValue:forSpecifier:](self, "_setValue:forSpecifier:", v6, v7);

}

- (void)_setValue:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  if (a3)
  {
    v5 = *MEMORY[0x24BE75DA0];
    v8 = a4;
    objc_msgSend(v8, "setProperty:forKey:", a3, v5);
  }
  else
  {
    v6 = a4;
    PSG_BundleForGeneralSettingsUIFramework();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("N/A"), &stru_24F9C95C8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75DA0]);

  }
}

- (void)_setValue:(id)a3 forPropertyKey:(id)a4 forSpecifierWithKey:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[PSSpecifierDataSource specifierForID:](self, "specifierForID:", a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperty:forKey:", v9, v8);

}

- (id)_myNumber
{
  const void *active;
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  BOOL v5;
  uint64_t v6;
  const void *v7;
  __CFString *String;
  void *v9;
  uint64_t v10;

  active = (const void *)CPPhoneNumberCopyActiveCountryCode();
  v3 = (const __CFDictionary *)CTSettingCopyEffectiveSimInfo();
  if (v3)
  {
    v4 = v3;
    if (CFDictionaryGetValue(v3, (const void *)*MEMORY[0x24BDC3008]))
      v5 = active == 0;
    else
      v5 = 1;
    if (v5 || (v6 = CFPhoneNumberCreate()) == 0)
    {
      String = &stru_24F9C95C8;
    }
    else
    {
      v7 = (const void *)v6;
      String = (__CFString *)CFPhoneNumberCreateString();
      CFRelease(v7);
    }
    CFRelease(v4);
    if (!active)
      goto LABEL_11;
    goto LABEL_10;
  }
  String = &stru_24F9C95C8;
  if (active)
LABEL_10:
    CFRelease(active);
LABEL_11:
  if (!-[__CFString length](String, "length"))
  {
    PSG_BundleForGeneralSettingsUIFramework();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_NUMBER"), &stru_24F9C95C8, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    String = (__CFString *)v10;
  }
  return String;
}

- (id)valueForSpecifier:(id)a3
{
  return (id)objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75DA0]);
}

- (id)_bluetoothMACAddress
{
  void *v2;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_object_t v6;
  const __CFData *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFData *v15;
  uint64_t v16;
  UInt8 buffer[6];
  mach_port_t mainPort;
  CFRange v19;

  mainPort = 0;
  if (!IOMasterPort(0, &mainPort)
    && (v4 = IOServiceNameMatching("bluetooth")) != 0
    && (MatchingService = IOServiceGetMatchingService(mainPort, v4)) != 0)
  {
    v6 = MatchingService;
    v7 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IODeviceTree", CFSTR("local-mac-address"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 1u);
    if (v7)
    {
      v15 = v7;
      PSGGreenTeaBluetoothHardwareAddressLog(CFSTR("Reading MAC Address from Bluetooth"), v8, v9, v10, v11, v12, v13, v14, v16);
      v19.location = 0;
      v19.length = 6;
      CFDataGetBytes(v15, v19, buffer);
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%02x:%02x:%02x:%02x:%02x:%02x"), buffer[0], buffer[1], buffer[2], buffer[3], buffer[4], buffer[5]);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v15);
    }
    else
    {
      v2 = 0;
    }
    IOObjectRelease(v6);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)_macAddressSpecifierKey
{
  if (MGGetBoolAnswer())
    return CFSTR("MACAddress_WLAN");
  else
    return CFSTR("MACAddress");
}

- (id)_macAddressLocalizedString
{
  int v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  v2 = MGGetBoolAnswer();
  PSG_BundleForGeneralSettingsUIFramework();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
    v5 = CFSTR("MACAddress_WLAN");
  else
    v5 = CFSTR("MACAddress");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24F9C95C8, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_macAddress
{
  CFArrayRef v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __SCNetworkInterface *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v2 = SCNetworkInterfaceCopyAll();
  v3 = (void *)-[__CFArray count](v2, "count");
  if (v3)
  {
    v4 = 0;
    v5 = *MEMORY[0x24BDF5A48];
    while (1)
    {
      v6 = (const __SCNetworkInterface *)-[__CFArray objectAtIndex:](v2, "objectAtIndex:", v4);
      if (-[__CFString isEqualToString:]((id)SCNetworkInterfaceGetInterfaceType(v6), "isEqualToString:", v5))break;
      if (v3 == (void *)++v4)
      {
        v3 = 0;
        goto LABEL_7;
      }
    }
    PSGGreenTeaWLANHardwareAddressLog(CFSTR("Reading MAC Address from WLAN"), v7, v8, v9, v10, v11, v12, v13, v15);
    SCNetworkInterfaceGetHardwareAddressString(v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_7:

  return v3;
}

- (id)_carrierVersion:(id)a3
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
  id v12;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE856F0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carrierName:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PSG_BundleForGeneralSettingsUIFramework();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NO_NETWORK"), &stru_24F9C95C8, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = v12;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x24BE856F0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "carrierBundleVersion:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v12 = v5;
    goto LABEL_6;
  }
  v8 = (void *)MEMORY[0x24BDD17C8];
  PSG_BundleForGeneralSettingsUIFramework();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CARRIER_VERSION_FORMAT"), &stru_24F9C95C8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v10, v5, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

- (void)_getBootStrapIccid
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *v16;
  NSString *bootstrapIccid;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subscriptionContexts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "mobileEquipmentInfo:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "baseId");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          objc_msgSend(v11, "baseId");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "length");

          if (v15)
          {
            objc_msgSend(v11, "baseId");
            v16 = (NSString *)objc_claimAutoreleasedReturnValue();
            bootstrapIccid = self->_bootstrapIccid;
            self->_bootstrapIccid = v16;

            goto LABEL_12;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_12:

}

- (BOOL)_isUsingBootstrap:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *bootstrapIccid;
  BOOL v10;

  v4 = (void *)MEMORY[0x24BE85700];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mobileEquipmentInfo:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ICCID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  bootstrapIccid = self->_bootstrapIccid;
  if (bootstrapIccid)
    v10 = -[NSString isEqualToString:](bootstrapIccid, "isEqualToString:", v8);
  else
    v10 = 0;

  return v10;
}

- (BOOL)shouldShowSIMSpecifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *bootstrapIccid;
  _BOOL4 v10;

  v4 = (void *)MEMORY[0x24BE85700];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mobileEquipmentInfo:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "ICCID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  bootstrapIccid = self->_bootstrapIccid;
  if (bootstrapIccid)
    v10 = !-[NSString isEqualToString:](bootstrapIccid, "isEqualToString:", v8);
  else
    LOBYTE(v10) = 1;
  if (!objc_msgSend(v8, "length"))
    LOBYTE(v10) = 0;

  return v10;
}

- (id)_PRLString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mobileEquipmentInfo:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "PRLVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%hu"), objc_msgSend(v6, "unsignedShortValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_ERIString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mobileEquipmentInfo:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ERIVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%hi"), (int)objc_msgSend(v6, "shortValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_NAIString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mobileEquipmentInfo:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "NAI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_MINString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mobileEquipmentInfo:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "MIN");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_IMSStatusString:(id)a3
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  BOOL v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE856F8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "IMSStatusVoice:", v3);

  objc_msgSend(MEMORY[0x24BE856F8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "IMSStatusSMS:", v3);

  objc_msgSend(MEMORY[0x24BE856F8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "RCSStatus:", v3);

  if (v9)
    v10 = v5 == 0;
  else
    v10 = 1;
  if (v10 || (v7 & 1) == 0)
  {
    v12 = CFSTR("IMS_STATUS_VOICE");
    if ((v5 & v7) != 0)
      v12 = CFSTR("IMS_STATUS_VOICE_AND_SMS");
    if (v5)
      v11 = (__CFString *)v12;
    else
      v11 = CFSTR("IMS_STATUS_SMS");
    if ((v5 | v7) != 1)
    {
      v13 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v11 = CFSTR("STATUS_VOICE_AND_SMS_AND_RCS");
  }
  PSG_LocalizedStringForGeneral(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v13;
}

- (id)_ICCIDString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75CE8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[PSGAboutDataSource _isUsingBootstrap:](self, "_isUsingBootstrap:", v4);
  objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mobileEquipmentInfo:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)self)
    objc_msgSend(v6, "effectiveICCID");
  else
    objc_msgSend(v6, "ICCID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
  }
  else
  {
    PSG_BundleForGeneralSettingsUIFramework();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NO_SIM"), &stru_24F9C95C8, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (void)updateCarrierSpecifier:(id)a3
{
  char *v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char **v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  _QWORD v30[4];
  char *v31;

  v4 = (char *)a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75CE8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "slotID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_carrierCellState, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    -[NSMutableDictionary objectForKeyedSubscript:](self->_carrierCellState, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue") + 1;

    objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mobileEquipmentInfo:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    switch(~(6 * (v11 / 6)) + v11)
    {
      case 0:
        objc_msgSend(v13, "PRLVersion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
          goto LABEL_5;
        PSG_BundleForGeneralSettingsUIFramework();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PRL"), &stru_24F9C95C8, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setName:", v16);

        v17 = 1;
        v18 = &selRef__PRLString_;
        break;
      case 1:
LABEL_5:
        objc_msgSend(v13, "ERIVersion");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v19)
          goto LABEL_7;
        PSG_BundleForGeneralSettingsUIFramework();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ERI"), &stru_24F9C95C8, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setName:", v20);

        v17 = 2;
        v18 = &selRef__ERIString_;
        break;
      case 2:
LABEL_7:
        objc_msgSend(v13, "NAI");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
          goto LABEL_9;
        PSG_BundleForGeneralSettingsUIFramework();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("NAI"), &stru_24F9C95C8, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setName:", v22);

        v17 = 3;
        v18 = &selRef__NAIString_;
        break;
      case 3:
LABEL_9:
        objc_msgSend(v13, "MIN");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v23)
          goto LABEL_11;
        PSG_BundleForGeneralSettingsUIFramework();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MSID"), &stru_24F9C95C8, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setName:", v24);

        v17 = 4;
        v18 = &selRef__MINString_;
        break;
      case 4:
LABEL_11:
        -[PSGAboutDataSource _IMSStatusString:](self, "_IMSStatusString:", v5);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
          goto LABEL_13;
        PSG_LocalizedStringForGeneral(CFSTR("IMS_STATUS"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setName:", v15);
        v17 = 5;
        v18 = &selRef__IMSStatusString_;
        break;
      default:
LABEL_13:
        PSG_BundleForGeneralSettingsUIFramework();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CARRIER_VERSION"), &stru_24F9C95C8, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setName:", v26);

        v17 = 0;
        v18 = &selRef__carrierVersion_;
        break;
    }

    *(_QWORD *)&v5[*MEMORY[0x24BE75750]] = *v18;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v17);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_carrierCellState, "setObject:forKeyedSubscript:", v27, v7);

    -[NSMutableDictionary objectForKeyedSubscript:](self->_carrierCellState, "objectForKeyedSubscript:", v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "intValue");

    if (v29 != v9)
    {
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __45__PSGAboutDataSource_updateCarrierSpecifier___block_invoke;
      v30[3] = &unk_24F9C81F8;
      v31 = v5;
      -[PSSpecifierDataSource performUpdatesAnimated:usingBlock:](self, "performUpdatesAnimated:usingBlock:", 0, v30);

    }
  }

}

uint64_t __45__PSGAboutDataSource_updateCarrierSpecifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadSpecifier:", *(_QWORD *)(a1 + 32));
}

- (id)_modelRegionString
{
  if (_modelRegionString_onceToken != -1)
    dispatch_once(&_modelRegionString_onceToken, &__block_literal_global_2);
  return (id)_modelRegionString_modelRegionString;
}

void __40__PSGAboutDataSource__modelRegionString__block_invoke()
{
  uint64_t v0;
  __CFString *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)MGCopyAnswer();
  v0 = MGCopyAnswer();
  if (v0)
    v1 = (__CFString *)v0;
  else
    v1 = &stru_24F9C95C8;
  v2 = objc_msgSend(v4, "length");
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v4, v1);
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (void *)_modelRegionString_modelRegionString;
  _modelRegionString_modelRegionString = v2;

}

- (id)_regulatoryModelNumberString
{
  if (_regulatoryModelNumberString_onceToken != -1)
    dispatch_once(&_regulatoryModelNumberString_onceToken, &__block_literal_global_479);
  return (id)_regulatoryModelNumberString_regulatoryModelNumberString;
}

void __50__PSGAboutDataSource__regulatoryModelNumberString__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)_regulatoryModelNumberString_regulatoryModelNumberString;
  _regulatoryModelNumberString_regulatoryModelNumberString = v0;

}

- (id)_modelNameString
{
  if (_modelNameString_onceToken != -1)
    dispatch_once(&_modelNameString_onceToken, &__block_literal_global_482);
  return PSG_LocalizedStringForModelNames((void *)_modelNameString_modelNameString);
}

void __38__PSGAboutDataSource__modelNameString__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)MGCopyAnswer();
  objc_msgSend(v2, "objectForKey:", CFSTR("ArtworkDeviceProductDescription"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_modelNameString_modelNameString;
  _modelNameString_modelNameString = v0;

}

- (id)_productVersionStringFallback
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x24BDBCE70]);
  SFRuntimeAbsoluteFilePathForPath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithContentsOfFile:", v3);

  objc_msgSend(v4, "objectForKey:", CFSTR("ProductVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_productBuildVersionString
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sf_isiPad");

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "operatingSystemVersion");

  }
  _CFCopySupplementalVersionDictionary();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7
    && (objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BDBD208]),
        v9 = objc_claimAutoreleasedReturnValue(),
        v10 = (void *)_productBuildVersionString_productVersion,
        _productBuildVersionString_productVersion = v9,
        v10,
        _productBuildVersionString_productVersion))
  {
    v11 = (id)_productBuildVersionString_productVersion;
  }
  else
  {
    -[PSGAboutDataSource _productVersionStringFallback](self, "_productVersionStringFallback");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (id)suManagerClient
{
  SUManagerClient *suClient;
  NSObject *v4;
  dispatch_queue_t v5;
  SUManagerClient *v6;
  SUManagerClient *v7;

  suClient = self->_suClient;
  if (!suClient)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x24BDAC9C0], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.preferences.about.sumanagerclient", v4);

    v6 = (SUManagerClient *)objc_msgSend(objc_alloc(MEMORY[0x24BEAEC38]), "initWithDelegate:queue:clientType:", 0, v5, 0);
    v7 = self->_suClient;
    self->_suClient = v6;

    suClient = self->_suClient;
  }
  return suClient;
}

- (id)softwareVersionString
{
  void *v2;
  uint64_t v3;
  void *v4;

  PSG_BundleForGeneralSettingsUIFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("OS Version"), &stru_24F9C95C8, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)softwareVersionString_softwareVersionString;
  softwareVersionString_softwareVersionString = v3;

  return (id)softwareVersionString_softwareVersionString;
}

- (void)cancelAbout
{
  id v2;

  -[PSGAboutDataSource aboutController](self, "aboutController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissModalViewControllerWithTransition:", 7);

}

- (void)updateProductModelSpecifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  if (v4)
  {
    -[PSGAboutDataSource _modelRegionString](self, "_modelRegionString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGAboutDataSource _regulatoryModelNumberString](self, "_regulatoryModelNumberString");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v5 && v6)
    {
      v8 = *MEMORY[0x24BE75DA0];
      objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75DA0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", v5);

      v11 = v7;
      if ((v10 & 1) != 0
        || (objc_msgSend(v4, "propertyForKey:", v8),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v12, "isEqualToString:", v7),
            v12,
            v11 = v5,
            v13))
      {
        -[PSGAboutDataSource _setValue:forSpecifier:](self, "_setValue:forSpecifier:", v11, v4);
      }
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __50__PSGAboutDataSource_updateProductModelSpecifier___block_invoke;
      v14[3] = &unk_24F9C81F8;
      v15 = v4;
      -[PSSpecifierDataSource performUpdatesAnimated:usingBlock:](self, "performUpdatesAnimated:usingBlock:", 0, v14);

    }
  }

}

uint64_t __50__PSGAboutDataSource_updateProductModelSpecifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadSpecifier:", *(_QWORD *)(a1 + 32));
}

- (void)_loadMediaFinished:(id)a3
{
  NSMutableDictionary *mediaDict;
  id v6;

  v6 = a3;
  mediaDict = self->_mediaDict;
  self->_mediaDict = 0;

  if (!self->_cancel)
  {
    self->_loaded = 1;
    objc_storeStrong((id *)&self->_mediaDict, a3);
    -[PSSpecifierDataSource performUpdatesAnimated:usingBlock:](self, "performUpdatesAnimated:usingBlock:", 0, &__block_literal_global_499);
  }
  self->_threadRunning = 0;
  -[NSLock unlock](self->_lock, "unlock");

}

uint64_t __41__PSGAboutDataSource__loadMediaFinished___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadSpecifiersWithIDs:", &unk_24F9D45C0);
}

- (id)countForKey:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (!self->_reloadTimer
    && (self->_loaded
     || !self->_threadRunning
     && (self->_threadRunning = 1, -[NSLock lock](self->_lock, "lock"), ALGetPhotosAndVideosCount(), self->_loaded)))
  {
    v6 = (void *)MEMORY[0x24BDD16F0];
    -[NSMutableDictionary objectForKey:](self->_mediaDict, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringFromNumber:numberStyle:", v7, 1);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = self->_loading;
  }

  return v5;
}

void __34__PSGAboutDataSource_countForKey___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x22E324948]();
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDDC818], "setFilteringDisabled:", 1);
  objc_msgSend(MEMORY[0x24BDDC818], "songsQuery");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIgnoreSystemFilterPredicates:", 1);
  objc_msgSend(v8, "setIgnoreRestrictionsPredicates:", 1);
  objc_msgSend(v8, "setShouldIncludeNonLibraryEntities:", 1);
  v9 = *MEMORY[0x24BDDBBB0];
  objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDDBBB0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addFilterPredicate:", v10);

  v11 = objc_msgSend(v8, "_countOfItems");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("songs"));

  if (v17)
  {
    objc_msgSend(v7, "setObject:forKey:", v17, CFSTR("photos"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("photos"));

  }
  objc_msgSend(MEMORY[0x24BDDC818], "videosQuery");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setIgnoreSystemFilterPredicates:", 1);
  objc_msgSend(v14, "setIgnoreRestrictionsPredicates:", 1);
  objc_msgSend(MEMORY[0x24BDDC810], "predicateWithValue:forProperty:", MEMORY[0x24BDBD1C8], v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addFilterPredicate:", v15);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v5, "unsignedIntegerValue") + objc_msgSend(v14, "_countOfItems"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v16, CFSTR("videos"));

  objc_msgSend(*(id *)(a1 + 32), "performSelectorOnMainThread:withObject:waitUntilDone:", sel__loadMediaFinished_, v7, 0);
  objc_autoreleasePoolPop(v6);

}

- (id)_songs:(id)a3
{
  return -[PSGAboutDataSource countForKey:](self, "countForKey:", CFSTR("songs"));
}

- (id)_videos:(id)a3
{
  return -[PSGAboutDataSource countForKey:](self, "countForKey:", CFSTR("videos"));
}

- (id)_photos:(id)a3
{
  return -[PSGAboutDataSource countForKey:](self, "countForKey:", CFSTR("photos"));
}

- (void)setDeviceName:(id)a3 specifier:(id)a4
{
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  -[PSGAboutDataSource deviceNameToIgnoreOnce](self, "deviceNameToIgnoreOnce");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v6)
  {
    -[PSGAboutDataSource setDeviceNameToIgnoreOnce:](self, "setDeviceNameToIgnoreOnce:", 0);
  }
  else
  {
    SetDeviceName();
    -[PSSpecifierDataSource performUpdatesAnimated:usingBlock:](self, "performUpdatesAnimated:usingBlock:", 0, &__block_literal_global_519);
  }

}

uint64_t __46__PSGAboutDataSource_setDeviceName_specifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadSpecifierWithID:", CFSTR("NAME_CELL_ID"));
}

- (id)specifiersForSpecifier:(id)a3 observer:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  if (!-[PSGAboutDataSource areSpecifiersLoaded](self, "areSpecifiersLoaded"))
    -[PSGAboutDataSource loadSpecifiers](self, "loadSpecifiers");
  if (objc_msgSend(v5, "observerType") == 1)
    -[PSGAboutDataSource _loadValues](self, "_loadValues");
  v6 = (void *)MEMORY[0x24BDBCE30];
  -[PSSpecifierDataSource specifiers](self, "specifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_loadValues
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_22E024000, v0, v1, "%s error fetching volume space info: %d", v2, v3, v4, v5, 2u);
}

void __33__PSGAboutDataSource__loadValues__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "appState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInstalled");

  v5 = v8;
  if (v4)
  {
    objc_msgSend(v8, "correspondingApplicationRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appClipMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

    v5 = v8;
  }

}

uint64_t __33__PSGAboutDataSource__loadValues__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeSpecifierWithID:", CFSTR("APPLICATIONS"));
}

- (id)getAPFSCurrentUserVolumeNode
{
  if (getAPFSCurrentUserVolumeNode_onceToken != -1)
    dispatch_once(&getAPFSCurrentUserVolumeNode_onceToken, &__block_literal_global_567);
  return (id)getAPFSCurrentUserVolumeNode_volumeDeviceNode;
}

void __50__PSGAboutDataSource_getAPFSCurrentUserVolumeNode__block_invoke()
{
  id v0;
  int v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  statfs v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  bzero(&v5, 0x878uLL);
  NSHomeDirectory();
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = statfs((const char *)objc_msgSend(v0, "UTF8String"), &v5);

  if (v1)
  {
    _PSGLoggingFacility();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __50__PSGAboutDataSource_getAPFSCurrentUserVolumeNode__block_invoke_cold_1();

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v5.f_mntfromname);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)getAPFSCurrentUserVolumeNode_volumeDeviceNode;
  getAPFSCurrentUserVolumeNode_volumeDeviceNode = v3;

}

- (BOOL)areSpecifiersLoaded
{
  return self->_hasLoadedSpecifiers;
}

- (void)reloadSpecifiers
{
  objc_super v2;

  self->_hasLoadedSpecifiers = 0;
  v2.receiver = self;
  v2.super_class = (Class)PSGAboutDataSource;
  -[PSSpecifierDataSource reloadSpecifiers](&v2, sel_reloadSpecifiers);
}

- (id)aboutController
{
  void *v2;
  void *v3;

  -[PSSpecifierDataSource observersOfClass:](self, "observersOfClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)loadSpecifiers
{
  void *v3;
  uint64_t v4;
  int v5;
  int isDeviceNameEditable;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  int v70;
  void *v71;
  void *v72;
  void *v73;
  unint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  int v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  unint64_t v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  const void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  int v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void *v148;
  __CFString *v149;
  void *v150;
  uint64_t v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  uint64_t v156;
  void *v157;
  __CFString *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  void *v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t i;
  void *v170;
  void *v171;
  void *v172;
  uint64_t v173;
  void *v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  unint64_t v181;
  void *v182;
  unint64_t v183;
  void *v184;
  void *v185;
  uint64_t v186;
  uint64_t *v187;
  unint64_t v188;
  uint64_t v189;
  int v190;
  uint64_t j;
  uint64_t v192;
  void *v193;
  _BOOL4 v194;
  void *v195;
  void *v196;
  char v197;
  void *v198;
  void *v199;
  void *v200;
  id *p_isa;
  void *v202;
  void *v203;
  void *v204;
  const __CFString *v205;
  uint64_t v206;
  void *v207;
  void *v208;
  void *v209;
  uint64_t v210;
  void *v211;
  void *v212;
  uint64_t v213;
  __CFString *v214;
  uint64_t v215;
  uint64_t v216;
  __CFString *v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  NSObject *v221;
  void *v222;
  void *v223;
  void *v224;
  id *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  id v236;
  void *v237;
  void *v238;
  void *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  NSObject *v261;
  uint64_t v262;
  void *v263;
  CFMutableDictionaryRef v264;
  CFMutableDictionaryRef v265;
  __CFDictionary *v266;
  const __CFDictionary *v267;
  io_service_t MatchingService;
  NSObject *v269;
  const char *v270;
  uint32_t v271;
  void *v272;
  NSObject *v273;
  const char *v274;
  CFArrayRef v275;
  CFArrayRef v276;
  NSObject *v277;
  void *v278;
  void *v279;
  NSObject *v280;
  void *v281;
  NSObject *v282;
  void *v283;
  NSObject *v284;
  void *v285;
  NSObject *v286;
  const char *v287;
  uint32_t v288;
  id v289;
  id v290;
  id v291;
  id v292;
  id v293;
  id v294;
  void *v295;
  void *v296;
  void *v297;
  void *v298;
  uint64_t v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  uint64_t v305;
  void *v306;
  void *v307;
  void *v308;
  void *v309;
  void *v310;
  void *v311;
  void *v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  uint64_t v317;
  void *v318;
  void *v319;
  void *v320;
  unint64_t v321;
  void *v322;
  void *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t k;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  id v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t m;
  void *v339;
  void *v340;
  int v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  __CFString *v351;
  id v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  BOOL v356;
  uint64_t v357;
  uint64_t v358;
  id v359;
  int v360;
  void *v361;
  int v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  int obj;
  id obja;
  id objb;
  uint64_t v369;
  void *v370;
  int v371;
  int v372;
  void *v373;
  void *v374;
  int v375;
  uint64_t v376;
  char v377;
  char v378;
  void *v379;
  void *v380;
  PSGAboutDataSource *v381;
  void *v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  _QWORD v395[5];
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  __int128 v401;
  __int128 v402;
  __int128 v403;
  CFTypeRef cf;
  _BYTE v405[128];
  _BYTE v406[128];
  _BYTE v407[128];
  _BYTE v408[128];
  uint8_t v409[128];
  uint8_t buf[16];
  __int128 v411;
  uint64_t v412;
  uint64_t v413;

  v413 = *MEMORY[0x24BDAC8D0];
  -[PSGAboutDataSource _getBootStrapIccid](self, "_getBootStrapIccid");
  if (self->_hasLoadedSpecifiers)
    return;
  self->_hasLoadedSpecifiers = 1;
  v381 = self;
  -[PSSpecifierDataSource specifiers](self, "specifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PSG_LocalizedStringForGeneral(CFSTR("Device_Name"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MGGetBoolAnswer();
  obj = MGGetBoolAnswer();
  v362 = MGGetBoolAnswer();
  v371 = MGGetBoolAnswer();
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v382 = v3;
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:");
  isDeviceNameEditable = _isDeviceNameEditable();
  v7 = (void *)MEMORY[0x24BE75590];
  if (isDeviceNameEditable)
  {
    v8 = objc_opt_class();
    v9 = 2;
  }
  else
  {
    v8 = 0;
    v9 = 4;
  }
  objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v4, v381, sel_setDeviceName_specifier_, sel_deviceName_, v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x24BE75AC0];
  objc_msgSend(v10, "setProperty:forKey:", CFSTR("NAME_CELL_ID"), *MEMORY[0x24BE75AC0]);
  v12 = v382;
  v348 = v10;
  objc_msgSend(v382, "addObject:", v10);
  v13 = (void *)MEMORY[0x24BE75590];
  -[PSGAboutDataSource softwareVersionString](v381, "softwareVersionString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, v381, 0, sel__productBuildVersionString, objc_opt_class(), 2, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v369 = v11;
  objc_msgSend(v15, "setProperty:forKey:", CFSTR("SW_VERSION_SPECIFIER"), v11);
  -[PSGAboutDataSource suManagerClient](v381, "suManagerClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProperty:forKey:", v16, CFSTR("SUManagerClient"));

  v355 = *MEMORY[0x24BE759C8];
  objc_msgSend(v15, "setProperty:forKey:", MEMORY[0x24BDBD1C8]);
  v347 = v15;
  objc_msgSend(v382, "addObject:", v15);
  PSG_BundleForGeneralSettingsUIFramework();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ProductModelName"), &stru_24F9C95C8, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGAboutDataSource _addKey:localizedString:isCopyable:](v381, "_addKey:localizedString:isCopyable:", CFSTR("ProductModelName"), v18, 1);

  PSG_BundleForGeneralSettingsUIFramework();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("ProductModel"), &stru_24F9C95C8, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGAboutDataSource _addKey:localizedString:isCopyable:](v381, "_addKey:localizedString:isCopyable:", CFSTR("ProductModel"), v20, 1);

  PSG_BundleForGeneralSettingsUIFramework();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("SerialNumber"), &stru_24F9C95C8, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGAboutDataSource _addKey:localizedString:isCopyable:](v381, "_addKey:localizedString:isCopyable:", CFSTR("SerialNumber"), v22, 1);

  -[PSGAboutDataSource sharedNDOController](v381, "sharedNDOController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "specifiers");
  v24 = objc_claimAutoreleasedReturnValue();

  if (v24)
    objc_msgSend(v382, "addObjectsFromArray:", v24);
  v346 = (void *)v24;
  v350 = (void *)v4;
  if (objc_opt_class())
  {
    -[PSGAboutDataSource systemHealthUIClient](v381, "systemHealthUIClient");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "getCurrentSystemHealthInfoSpecifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v382, "addObjectsFromArray:", v26);

    v12 = v382;
  }
  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setProperty:forKey:", CFSTR("INFORMATION_GROUP"), v369);
  v345 = v27;
  objc_msgSend(v12, "addObject:", v27);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "subscriptionContexts");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "mobileEquipmentInfoLength");

    if (v31 <= 1)
    {
      objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[PSGAboutDataSource _isUsingBootstrap:](v381, "_isUsingBootstrap:", v32))
      {
        v33 = (void *)MEMORY[0x24BE75590];
        PSG_BundleForGeneralSettingsUIFramework();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("NETWORK"), &stru_24F9C95C8, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v35, v381, 0, sel_valueForSpecifier_, 0, 4, 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%li"), CFSTR("NETWORK"), objc_msgSend(v32, "slotID"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setProperty:forKey:", v37, v369);
        objc_msgSend(v382, "addObject:", v36);

      }
    }

  }
  v375 = v5;
  PSG_BundleForGeneralSettingsUIFramework();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("SONGS"), &stru_24F9C95C8, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v39, v381, 0, sel__songs_, 0, 4, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setProperty:forKey:", CFSTR("SONGS"), v369);
  v41 = v382;
  objc_msgSend(v382, "addObject:", v40);
  PSG_BundleForGeneralSettingsUIFramework();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("VIDEOS"), &stru_24F9C95C8, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v43, v381, 0, sel__videos_, 0, 4, 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v44, "setProperty:forKey:", CFSTR("VIDEOS"), v369);
  objc_msgSend(v382, "addObject:", v44);
  PSG_BundleForGeneralSettingsUIFramework();
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("PHOTOS"), &stru_24F9C95C8, 0);
  v46 = objc_claimAutoreleasedReturnValue();

  v344 = (void *)v46;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v46, v381, 0, sel__photos_, 0, 4, 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "setProperty:forKey:", CFSTR("PHOTOS"), v369);
  v361 = v47;
  objc_msgSend(v382, "addObject:", v47);
  PSG_BundleForGeneralSettingsUIFramework();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("APPLICATIONS"), &stru_24F9C95C8, 0);
  v49 = objc_claimAutoreleasedReturnValue();

  v343 = (void *)v49;
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v49, v381, 0, 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setProperty:forKey:", CFSTR("APPLICATIONS"), v369);
  v342 = v50;
  objc_msgSend(v382, "addObject:", v50);
  PSG_BundleForGeneralSettingsUIFramework();
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("User Data Capacity"), &stru_24F9C95C8, 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGAboutDataSource _addKey:localizedString:isCopyable:](v381, "_addKey:localizedString:isCopyable:", CFSTR("User Data Capacity"), v52, 0);

  PSG_BundleForGeneralSettingsUIFramework();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("User Data Available"), &stru_24F9C95C8, 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSGAboutDataSource _addKey:localizedString:isCopyable:](v381, "_addKey:localizedString:isCopyable:", CFSTR("User Data Available"), v54, 0);

  if (objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v382, "addObject:", v55);
    objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "currentUser");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = (void *)objc_opt_new();
    objc_msgSend(v57, "givenName");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setGivenName:", v59);

    objc_msgSend(v57, "familyName");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setFamilyName:", v60);

    objc_msgSend(MEMORY[0x24BDD1738], "localizedStringFromPersonNameComponents:style:options:", v58, 1, 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v61)
    {
      PSG_LocalizedStringForAbout(CFSTR("USER"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v62 = v61;

    v63 = (void *)MEMORY[0x24BDD17C8];
    PSG_LocalizedStringForAbout(CFSTR("SHARED_IPAD_USER_CAPACITY"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "stringWithFormat:", v64, v62);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGAboutDataSource _addLocalizedKey:identifier:isCopyable:allowMultilineTitle:](v381, "_addLocalizedKey:identifier:isCopyable:allowMultilineTitle:", v65, CFSTR("SHARED_IPAD_USER_CAPACITY"), 0, 1);

    v66 = (void *)MEMORY[0x24BDD17C8];
    PSG_LocalizedStringForAbout(CFSTR("SHARED_IPAD_USER_AVAILABE"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "stringWithFormat:", v67, v62);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGAboutDataSource _addLocalizedKey:identifier:isCopyable:allowMultilineTitle:](v381, "_addLocalizedKey:identifier:isCopyable:allowMultilineTitle:", v68, CFSTR("SHARED_IPAD_USER_AVAILABE"), 0, 1);

    v41 = v382;
  }
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("HARDWARE_GROUP"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "addObject:", v69);

  v70 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "subscriptionContexts");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "mobileEquipmentInfoLength");

    if (v74 <= 1)
    {
      objc_msgSend(v72, "objectAtIndexedSubscript:", 0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = (void *)MEMORY[0x24BE75590];
      PSG_BundleForGeneralSettingsUIFramework();
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "localizedStringForKey:value:table:", CFSTR("CARRIER_VERSION"), &stru_24F9C95C8, 0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v78, v381, 0, sel__carrierVersion_, 0, 4, 0);
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%li"), CFSTR("CARRIER_VERSION"), objc_msgSend(v75, "slotID"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setProperty:forKey:", v80, v369);
      objc_msgSend(v79, "setProperty:forKey:", v75, *MEMORY[0x24BE75CE8]);
      objc_msgSend(v382, "addObject:", v79);

      v361 = v79;
    }

    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = objc_msgSend(v81, "sf_isiPad");

    if (v82)
    {
      PSG_BundleForGeneralSettingsUIFramework();
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("CellularDataAddress"), &stru_24F9C95C8, 0);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSGAboutDataSource _addKey:localizedString:isCopyable:](v381, "_addKey:localizedString:isCopyable:", CFSTR("CellularDataAddress"), v84, 0);

    }
    v41 = v382;
  }
  if (v362)
  {
    -[PSGAboutDataSource _macAddressSpecifierKey](v381, "_macAddressSpecifierKey");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGAboutDataSource _macAddressLocalizedString](v381, "_macAddressLocalizedString");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGAboutDataSource _addKey:localizedString:isCopyable:](v381, "_addKey:localizedString:isCopyable:", v85, v86, 1);

  }
  if (obj)
  {
    PSG_BundleForGeneralSettingsUIFramework();
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "localizedStringForKey:value:table:", CFSTR("BTMACAddress"), &stru_24F9C95C8, 0);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGAboutDataSource _addKey:localizedString:isCopyable:](v381, "_addKey:localizedString:isCopyable:", CFSTR("BTMACAddress"), v88, 1);

    v41 = v382;
  }
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "subscriptionContexts");
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v91, "mobileEquipmentInfoLength");

    if (v92 <= 1)
    {
      objc_msgSend(v90, "objectAtIndexedSubscript:", 0);
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "mobileEquipmentInfo:", v93);
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      if (v95)
      {
        objc_msgSend(v95, "IMEI");
        v96 = (void *)objc_claimAutoreleasedReturnValue();

        if (v96)
        {
          v97 = (void *)MEMORY[0x24BE75590];
          PSG_BundleForGeneralSettingsUIFramework();
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v98, "localizedStringForKey:value:table:", CFSTR("ModemIMEI"), &stru_24F9C95C8, 0);
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v99, v381, 0, sel_valueForSpecifier_, 0, 4, 0);
          v100 = (void *)objc_claimAutoreleasedReturnValue();

          v101 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v93, "slotID");
          objc_msgSend(v101, "stringWithFormat:", CFSTR("%@.%li"));
          obja = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "setProperty:forKey:");
          PSGGreenTeaIMEILog(CFSTR("Reading IMEI from CTMobileEquipmentInfo"), v102, v103, v104, v105, v106, v107, v108, (uint64_t)CFSTR("ModemIMEI"));
          objc_msgSend(v95, "IMEI");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v109, "IMEIString");
          v110 = (void *)objc_claimAutoreleasedReturnValue();
          v363 = *MEMORY[0x24BE75DA0];
          objc_msgSend(v100, "setProperty:forKey:", v110);

          v111 = MEMORY[0x24BDBD1C8];
          objc_msgSend(v100, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v355);
          v112 = *MEMORY[0x24BE75D70];
          objc_msgSend(v100, "setProperty:forKey:", v111, *MEMORY[0x24BE75D70]);
          objc_msgSend(v382, "addObject:", v100);
          if (-[PSGAboutDataSource shouldShowSIMSpecifier:](v381, "shouldShowSIMSpecifier:", v93))
          {
            v113 = (void *)MEMORY[0x24BE75590];
            PSG_BundleForGeneralSettingsUIFramework();
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v114, "localizedStringForKey:value:table:", CFSTR("ICCID"), &stru_24F9C95C8, 0);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v113, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v115, v381, 0, sel__ICCIDString_, 0, 4, 0);
            v116 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%li"), CFSTR("ICCID"), objc_msgSend(v93, "slotID"));
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v116, "setProperty:forKey:", v117, v369);
            v118 = MEMORY[0x24BDBD1C8];
            objc_msgSend(v116, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v355);
            objc_msgSend(v116, "setProperty:forKey:", v118, v112);
            objc_msgSend(v116, "setProperty:forKey:", v93, *MEMORY[0x24BE75CE8]);
            objc_msgSend(v382, "addObject:", v116);

          }
          objc_msgSend(v95, "MEID");
          v119 = (void *)objc_claimAutoreleasedReturnValue();

          if (v119)
          {
            v120 = (void *)MEMORY[0x24BE75590];
            PSG_BundleForGeneralSettingsUIFramework();
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v121, "localizedStringForKey:value:table:", CFSTR("MEID"), &stru_24F9C95C8, 0);
            v122 = v112;
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v123, v381, 0, sel_valueForSpecifier_, 0, 4, 0);
            v124 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%li"), CFSTR("MEID"), objc_msgSend(v93, "slotID"));
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v124, "setProperty:forKey:", v125, v369);
            objc_msgSend(v95, "MEID");
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v124, "setProperty:forKey:", v126, v363);

            v127 = MEMORY[0x24BDBD1C8];
            objc_msgSend(v124, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v355);
            objc_msgSend(v124, "setProperty:forKey:", v127, v122);
            objc_msgSend(v382, "addObject:", v124);

          }
          v70 = v375;
        }
      }

    }
    *(_QWORD *)buf = 0;
    v411 = 0u;
    v412 = 0;
    *(_QWORD *)&buf[8] = v381;
    v128 = _CTServerConnectionCreate();
    v41 = v382;
    if (v128)
    {
      v129 = (const void *)v128;
      cf = 0;
      if (!((unint64_t)_CTServerConnectionCopyFirmwareVersion() >> 32))
      {
        PSG_BundleForGeneralSettingsUIFramework();
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v130, "localizedStringForKey:value:table:", CFSTR("ModemVersion"), &stru_24F9C95C8, 0);
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        -[PSGAboutDataSource _addKey:localizedString:value:isCopyable:](v381, "_addKey:localizedString:value:isCopyable:", CFSTR("ModemVersion"), v131, cf, 0);

        objc_msgSend(v382, "lastObject");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
        objc_msgSend(v132, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75D70]);

        v41 = v382;
      }
      CFRelease(v129);
    }

  }
  if (v371)
  {
    PSG_BundleForGeneralSettingsUIFramework();
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "localizedStringForKey:value:table:", CFSTR("SEID"), &stru_24F9C95C8, 0);
    v134 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v134, 0, 0, 0, objc_opt_class(), 1, 0);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObject:", v135);

  }
  if (v70)
  {
    objc_msgSend(MEMORY[0x24BE856E8], "sharedInstance");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = objc_msgSend(v136, "isActivationCodeFlowSupported");

    if (!v137)
      goto LABEL_64;
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v138 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v138, "subscriptionContexts");
    v139 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v139, "objectAtIndexedSubscript:", 0);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v140, "mobileEquipmentInfo:", v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v139, "count") < 2)
    {
      if (!v142)
      {
LABEL_56:
        v149 = &stru_24F9C95C8;
LABEL_63:

LABEL_64:
        +[PSUICoreTelephonyPostponementCache sharedInstance](PSUICoreTelephonyPostponementCache, "sharedInstance");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v154, "getActivationPolicyState");
        v155 = (void *)objc_claimAutoreleasedReturnValue();

        if (v155 && objc_msgSend(v155, "carrierLock"))
        {
          v156 = objc_msgSend(v155, "carrierLock");
          PSG_LocalizedStringForGeneral(CFSTR("CARRIER_LOCK"));
          v157 = (void *)objc_claimAutoreleasedReturnValue();
          if (v156 == 1)
            v158 = CFSTR("CARRIER_LOCK_UNLOCKED");
          else
            v158 = CFSTR("CARRIER_LOCK_LOCKED");
          PSG_LocalizedStringForGeneral(v158);
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          v160 = (void *)MEMORY[0x24BE75590];
          if (v156 == 1)
          {
            v161 = 0;
            v162 = 4;
          }
          else
          {
            v161 = objc_opt_class();
            v162 = 2;
          }
          objc_msgSend(v160, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v157, v381, 0, sel_valueForSpecifier_, v161, v162, 0);
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v163, "setProperty:forKey:", v159, *MEMORY[0x24BE75DA0]);
          objc_msgSend(v382, "addObject:", v163);

        }
        goto LABEL_74;
      }
      v145 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v139, "objectAtIndexedSubscript:", 1);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "mobileEquipmentInfo:", v144);
      v145 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v142)
      {
        if (!v145)
          goto LABEL_56;
        goto LABEL_58;
      }
    }
    objc_msgSend(v142, "CSN");
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    v147 = objc_msgSend(v146, "length");

    if (v147)
    {
      v148 = v142;
LABEL_60:
      objc_msgSend(v148, "CSN");
      v149 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_62:
      PSG_LocalizedStringForGeneral(CFSTR("EID"));
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v152, v381, 0, sel_valueForSpecifier_, 0, 4, 0);
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v153, "setProperty:forKey:", v149, *MEMORY[0x24BE75DA0]);
      objc_msgSend(v153, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      objc_msgSend(v153, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v355);
      objc_msgSend(v382, "addObject:", v153);

      goto LABEL_63;
    }
    if (!v145)
    {
LABEL_61:
      v149 = &stru_24F9C95C8;
      goto LABEL_62;
    }
LABEL_58:
    objc_msgSend(v145, "CSN");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend(v150, "length");

    if (v151)
    {
      v148 = v145;
      goto LABEL_60;
    }
    goto LABEL_61;
  }
LABEL_74:
  objc_msgSend(MEMORY[0x24BDC7CF0], "sharedAccessoryManager");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v164, "availableAccessories");
  v165 = (void *)objc_claimAutoreleasedReturnValue();

  v402 = 0u;
  v403 = 0u;
  v400 = 0u;
  v401 = 0u;
  objb = v165;
  v166 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v400, v409, 16);
  if (v166)
  {
    v167 = v166;
    v168 = *(_QWORD *)v401;
    do
    {
      for (i = 0; i != v167; ++i)
      {
        if (*(_QWORD *)v401 != v168)
          objc_enumerationMutation(objb);
        v170 = *(void **)(*((_QWORD *)&v400 + 1) + 8 * i);
        if (_shouldShowAccessoryInfo(v170))
        {
          objc_msgSend(v170, "name");
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v171, "length"))
          {
            PSG_BundleForGeneralSettingsUIFramework();
            v172 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v172, "localizedStringForKey:value:table:", CFSTR("ACCESSORY"), &stru_24F9C95C8, 0);
            v173 = objc_claimAutoreleasedReturnValue();

            v171 = (void *)v173;
          }
          objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v171, v381, 0, 0, objc_opt_class(), 1, 0);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v174, "setUserInfo:", v170);
          objc_msgSend(v170, "bonjourName");
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v176 = objc_msgSend(v175, "length");

          v177 = (void *)MEMORY[0x24BDD16A8];
          if (v176)
          {
            objc_msgSend(v170, "bonjourName");
            v178 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v177, "stringWithString:", v178);
            v179 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v170, "connectionID"));
            v178 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v178, "stringValue");
            v180 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v177, "stringWithString:", v180);
            v179 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v179, "appendString:", CFSTR("_ACCESSORY"));
          objc_msgSend(v174, "setIdentifier:", v179);

          objc_msgSend(v382, "addObject:", v174);
        }
      }
      v167 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v400, v409, 16);
    }
    while (v167);
  }

  v181 = 0x24BE85000uLL;
  objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = objc_msgSend(v182, "mobileEquipmentInfoLength");

  if (v183 >= 2)
  {
    v398 = 0u;
    v399 = 0u;
    v396 = 0u;
    v397 = 0u;
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v184, "subscriptionContexts");
    v185 = (void *)objc_claimAutoreleasedReturnValue();

    v186 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v396, v408, 16);
    v187 = (uint64_t *)MEMORY[0x24BDC2CD0];
    v188 = 0x24BE75000;
    if (v186)
    {
      v189 = v186;
      v372 = 0;
      v376 = *(_QWORD *)v397;
      v364 = *MEMORY[0x24BDC2CD0];
      v190 = 1;
      v359 = v185;
      do
      {
        for (j = 0; j != v189; ++j)
        {
          if (*(_QWORD *)v397 != v376)
            objc_enumerationMutation(v359);
          v192 = *(_QWORD *)(*((_QWORD *)&v396 + 1) + 8 * j);
          -[CoreTelephonyClient getSimHardwareInfo:error:](v381->__client, "getSimHardwareInfo:error:", v192, 0);
          v193 = (void *)objc_claimAutoreleasedReturnValue();
          v194 = objc_msgSend(v193, "hardwareType") != 2;
          objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v195, "simStatus:", v192);
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          v197 = objc_msgSend(v196, "isEqualToString:", v364);

          if ((v197 & 1) == 0)
            v372 += -[PSGAboutDataSource shouldShowSIMSpecifier:](v381, "shouldShowSIMSpecifier:", v192);
          v188 = 0x24BE75000uLL;
          v190 &= v194;

        }
        v189 = objc_msgSend(v359, "countByEnumeratingWithState:objects:count:", &v396, v408, 16);
      }
      while (v189);

      if (!v190)
      {
        v187 = (uint64_t *)MEMORY[0x24BDC2CD0];
        if (v372 != 1)
        {
          v360 = 0;
          p_isa = (id *)&v381->super.super.isa;
          goto LABEL_108;
        }
        objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
        v202 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v202, "subscriptionContexts");
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v203, "sortedArrayUsingComparator:", &__block_literal_global_634);
        v200 = (void *)objc_claimAutoreleasedReturnValue();

        v360 = 0;
        v372 = 1;
LABEL_103:
        p_isa = (id *)&v381->super.super.isa;
        if (v200)
        {
LABEL_109:
          v393 = 0u;
          v394 = 0u;
          v391 = 0u;
          v392 = 0u;
          v352 = v200;
          v365 = objc_msgSend(v352, "countByEnumeratingWithState:objects:count:", &v391, v407, 16);
          if (!v365)
            goto LABEL_161;
          v205 = CFSTR("AVAILABLE_SIM");
          if (!v372)
            v205 = CFSTR("AVAILABLE_SIMS");
          v351 = (__CFString *)v205;
          v356 = 1;
          v357 = *v187;
          v358 = *(_QWORD *)v392;
          v353 = *MEMORY[0x24BE75DA0];
          v354 = *MEMORY[0x24BE75CE8];
          while (1)
          {
            v206 = 0;
            do
            {
              if (*(_QWORD *)v392 != v358)
                objc_enumerationMutation(v352);
              v207 = *(void **)(*((_QWORD *)&v391 + 1) + 8 * v206);
              objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
              v208 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v208, "simStatus:", v207);
              v209 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v209, "isEqualToString:", v357) & 1) != 0)
                LOBYTE(v210) = 1;
              else
                LODWORD(v210) = objc_msgSend(p_isa, "shouldShowSIMSpecifier:", v207) ^ 1;

              objc_msgSend(p_isa[17], "getSimHardwareInfo:error:", v207, 0);
              v211 = (void *)objc_claimAutoreleasedReturnValue();
              v212 = v211;
              if (v360)
              {
                if (v372 > 1)
                  goto LABEL_137;
                v213 = objc_msgSend(v211, "simLocation");
                v214 = CFSTR("FRONT_SIM");
                if (v213 == 1 || (v215 = objc_msgSend(v212, "simLocation"), v214 = CFSTR("BACK_SIM"), v215 == 2))
                {
                  PSG_LocalizedStringForGeneral(v214);
                  v216 = objc_claimAutoreleasedReturnValue();
                  if (!v216)
                    goto LABEL_137;
                }
                else
                {
                  _PSGLoggingFacility();
                  v221 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v221, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)&buf[4] = v207;
                    _os_log_error_impl(&dword_22E024000, v221, OS_LOG_TYPE_ERROR, "subscription context slot unknown: %@", buf, 0xCu);
                  }

LABEL_137:
                  objc_msgSend(v207, "label");
                  v216 = objc_claimAutoreleasedReturnValue();
                }
                v220 = (void *)v216;
                goto LABEL_139;
              }
              v217 = v351;
              if ((v210 & 1) == 0)
              {
                if (v372 > 1)
                  goto LABEL_130;
                v218 = objc_msgSend(v212, "hardwareType");
                v217 = CFSTR("eSIM");
                if (v218 != 2)
                {
                  v219 = objc_msgSend(v212, "hardwareType");
                  v217 = CFSTR("PHYSICAL_SIM");
                  if (v219 != 1)
                  {
                    _PSGLoggingFacility();
                    v261 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v261, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)&buf[4] = v207;
                      _os_log_error_impl(&dword_22E024000, v261, OS_LOG_TYPE_ERROR, "subscription context slot unknown: %@", buf, 0xCu);
                    }

LABEL_130:
                    objc_msgSend(v207, "label");
                    v220 = (void *)objc_claimAutoreleasedReturnValue();
                    goto LABEL_131;
                  }
                }
              }
              PSG_LocalizedStringForGeneral(v217);
              v220 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v220)
                goto LABEL_130;
LABEL_131:
              if (!v356)
              {
                v356 = 0;
                goto LABEL_140;
              }
              v356 = v372 != 0;
LABEL_139:
              objc_msgSend(*(id *)(v188 + 1424), "groupSpecifierWithName:", v220);
              v222 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v382, "addObject:", v222);

LABEL_140:
              objc_msgSend(MEMORY[0x24BE85700], "sharedInstance");
              v223 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v223, "mobileEquipmentInfo:", v207);
              v224 = (void *)objc_claimAutoreleasedReturnValue();

              if ((v210 & 1) == 0)
              {
                v377 = v210;
                v225 = p_isa;
                if ((objc_msgSend(p_isa, "_isUsingBootstrap:", v207) & 1) == 0)
                {
                  v226 = *(void **)(v188 + 1424);
                  PSG_BundleForGeneralSettingsUIFramework();
                  v227 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v227, "localizedStringForKey:value:table:", CFSTR("NETWORK"), &stru_24F9C95C8, 0);
                  v228 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v226, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v228, v225, 0, sel_valueForSpecifier_, 0, 4, 0);
                  v229 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%li"), CFSTR("NETWORK"), objc_msgSend(v207, "slotID"));
                  v230 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v229, "setProperty:forKey:", v230, v369);
                  objc_msgSend(v382, "addObject:", v229);

                }
                v231 = *(void **)(v188 + 1424);
                PSG_BundleForGeneralSettingsUIFramework();
                v232 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("CARRIER_VERSION"), &stru_24F9C95C8, 0);
                v210 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v231, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v210, v225, 0, sel__carrierVersion_, 0, 4, 0);
                v233 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%li"), CFSTR("CARRIER_VERSION"), objc_msgSend(v207, "slotID"));
                v234 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v233, "setProperty:forKey:", v234, v369);
                objc_msgSend(v233, "setProperty:forKey:", v207, v354);
                objc_msgSend(v382, "addObject:", v233);

                v361 = v233;
                p_isa = v225;
                LOBYTE(v210) = v377;
              }
              if (v224)
              {
                objc_msgSend(v224, "IMEI");
                v235 = (void *)objc_claimAutoreleasedReturnValue();

                if (v235)
                {
                  v378 = v210;
                  if (objc_msgSend(v207, "slotID") == 2)
                  {
                    PSG_LocalizedStringForGeneral(CFSTR("ModemIMEI2"));
                    v236 = (id)objc_claimAutoreleasedReturnValue();
                    v210 = (uint64_t)v236;
                  }
                  else
                  {
                    PSG_BundleForGeneralSettingsUIFramework();
                    v236 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v236, "localizedStringForKey:value:table:", CFSTR("ModemIMEI"), &stru_24F9C95C8, 0);
                    v210 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

                  }
                  objc_msgSend(*(id *)(v188 + 1424), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v210, p_isa, 0, sel_valueForSpecifier_, 0, 4, 0);
                  v237 = (void *)objc_claimAutoreleasedReturnValue();
                  v238 = (void *)MEMORY[0x24BDD17C8];
                  objc_msgSend(v207, "slotID");
                  objc_msgSend(v238, "stringWithFormat:", CFSTR("%@.%li"));
                  v239 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v237, "setProperty:forKey:", v239, v369);
                  PSGGreenTeaIMEILog(CFSTR("Reading IMEI from CTMobileEquipmentInfo"), v240, v241, v242, v243, v244, v245, v246, (uint64_t)CFSTR("ModemIMEI"));
                  objc_msgSend(v224, "IMEI");
                  v247 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v247, "IMEIString");
                  v248 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v237, "setProperty:forKey:", v248, v353);

                  v188 = 0x24BE75000uLL;
                  objc_msgSend(v237, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v355);
                  objc_msgSend(v382, "addObject:", v237);

                  p_isa = (id *)&v381->super.super.isa;
                  LOBYTE(v210) = v378;
                }
                if ((v210 & 1) == 0)
                {
                  if (objc_msgSend(p_isa, "shouldShowSIMSpecifier:", v207))
                  {
                    v249 = *(void **)(v188 + 1424);
                    PSG_BundleForGeneralSettingsUIFramework();
                    v250 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v250, "localizedStringForKey:value:table:", CFSTR("ICCID"), &stru_24F9C95C8, 0);
                    v251 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v249, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v251, v381, 0, sel__ICCIDString_, 0, 4, 0);
                    v252 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%li"), CFSTR("ICCID"), objc_msgSend(v207, "slotID"));
                    v253 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v252, "setProperty:forKey:", v253, v369);
                    objc_msgSend(v252, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v355);
                    objc_msgSend(v252, "setProperty:forKey:", v207, v354);
                    objc_msgSend(v382, "addObject:", v252);

                    p_isa = (id *)&v381->super.super.isa;
                  }
                  objc_msgSend(v224, "MEID");
                  v254 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v254)
                  {
                    v255 = *(void **)(v188 + 1424);
                    PSG_BundleForGeneralSettingsUIFramework();
                    v256 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v256, "localizedStringForKey:value:table:", CFSTR("MEID"), &stru_24F9C95C8, 0);
                    v257 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v255, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v257, v381, 0, sel_valueForSpecifier_, 0, 4, 0);
                    v258 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%li"), CFSTR("MEID"), objc_msgSend(v207, "slotID"));
                    v259 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v258, "setProperty:forKey:", v259, v369);
                    objc_msgSend(v224, "MEID");
                    v260 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v258, "setProperty:forKey:", v260, v353);

                    p_isa = (id *)&v381->super.super.isa;
                    objc_msgSend(v258, "setProperty:forKey:", MEMORY[0x24BDBD1C8], v355);
                    objc_msgSend(v382, "addObject:", v258);

                  }
                }
              }

              ++v206;
            }
            while (v365 != v206);
            v262 = objc_msgSend(v352, "countByEnumeratingWithState:objects:count:", &v391, v407, 16);
            v365 = v262;
            if (!v262)
            {
LABEL_161:

              v181 = 0x24BE85000;
              goto LABEL_162;
            }
          }
        }
LABEL_108:
        objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
        v204 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v204, "subscriptionContexts");
        v200 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_109;
      }
      v187 = (uint64_t *)MEMORY[0x24BDC2CD0];
    }
    else
    {

      v372 = 0;
    }
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "subscriptionContexts");
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    v395[0] = MEMORY[0x24BDAC760];
    v395[1] = 3221225472;
    v395[2] = __36__PSGAboutDataSource_loadSpecifiers__block_invoke;
    v395[3] = &unk_24F9C8370;
    v395[4] = v381;
    objc_msgSend(v199, "sortedArrayUsingComparator:", v395);
    v200 = (void *)objc_claimAutoreleasedReturnValue();

    v360 = 1;
    goto LABEL_103;
  }
  v188 = 0x24BE75000;
LABEL_162:
  if ((_os_feature_enabled_impl() & 1) != 0
    || !_os_feature_enabled_impl()
    || !PSGetCapabilityBoolAnswer())
  {
    goto LABEL_232;
  }
  cf = 0;
  v263 = (void *)MGCopyAnswer();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = CFSTR("D6/BMDrlb8V3WSiqL8gL+w");
      v269 = MEMORY[0x24BDACB70];
      v270 = "Failed to query %@.";
      v271 = 12;
LABEL_213:
      _os_log_impl(&dword_22E024000, v269, OS_LOG_TYPE_DEFAULT, v270, buf, v271);
    }
LABEL_214:
    v272 = 0;
    v267 = 0;
    goto LABEL_215;
  }
  if (!objc_msgSend(v263, "BOOLValue"))
  {
    v272 = 0;
    v267 = 0;
    goto LABEL_175;
  }
  *(_QWORD *)buf = 0;
  v264 = IOServiceMatching("IOPMPowerSource");
  if (!v264)
    goto LABEL_257;
  v265 = v264;
  v266 = IOServiceMatching("AppleAuthCPRelay");
  v267 = v266;
  if (v266)
  {
    CFDictionarySetValue(v266, CFSTR("IOParentMatch"), v265);
    MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B20], v267);
    if (MatchingService)
    {
      IORegistryEntryCreateCFProperties(MatchingService, (CFMutableDictionaryRef *)buf, 0, 0);
      v267 = *(const __CFDictionary **)buf;
      if (*(_QWORD *)buf)
        *(_QWORD *)buf = 0;
    }
    else
    {
      v267 = 0;
    }
  }
  CFRelease(v265);
  if (*(_QWORD *)buf)
    CFRelease(*(CFTypeRef *)buf);
  if (!v267)
  {
LABEL_257:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v269 = MEMORY[0x24BDACB70];
      v270 = "Failed to query battery authentication data.";
      v271 = 2;
      goto LABEL_213;
    }
    goto LABEL_214;
  }
  -[__CFDictionary objectForKeyedSubscript:](v267, "objectForKeyedSubscript:", CFSTR("isTrustedForUI"));
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_215;
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)&buf[4] = "isTrustedForUI";
    v286 = MEMORY[0x24BDACB70];
    v287 = "Battery authentication data missing expected key (%s), authentication status unknown.";
    v288 = 12;
LABEL_254:
    _os_log_impl(&dword_22E024000, v286, OS_LOG_TYPE_DEFAULT, v287, buf, v288);
LABEL_215:

    _PSGLoggingFacility();
    v273 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v274 = "Battery failed authentication.";
      goto LABEL_217;
    }
    goto LABEL_218;
  }
  if ((objc_msgSend(v272, "BOOLValue") & 1) == 0)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_215;
    *(_WORD *)buf = 0;
    v286 = MEMORY[0x24BDACB70];
    v287 = "Battery failed authentication.";
    v288 = 2;
    goto LABEL_254;
  }
LABEL_175:

  if (IOPSCopyPowerSourcesByTypePrecise())
  {
    _PSGLoggingFacility();
    v273 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v274 = "Failed to retrieve power sources info (kIOPSSourceInternal).";
LABEL_217:
      _os_log_impl(&dword_22E024000, v273, OS_LOG_TYPE_DEFAULT, v274, buf, 2u);
    }
LABEL_218:
    v279 = 0;
    v276 = 0;
    v281 = 0;
    v285 = 0;
    v283 = 0;
LABEL_219:

    goto LABEL_220;
  }
  v275 = IOPSCopyPowerSourcesList(cf);
  v276 = v275;
  if (!v275 || !-[__CFArray count](v275, "count"))
  {
    _PSGLoggingFacility();
    v277 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v277, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E024000, v277, OS_LOG_TYPE_DEFAULT, "Failed to retrieve power sources list.", buf, 2u);
    }

  }
  -[__CFArray objectAtIndexedSubscript:](v276, "objectAtIndexedSubscript:", 0);
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  IOPSGetPowerSourceDescription(v276, v278);
  v279 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v279)
  {
    _PSGLoggingFacility();
    v280 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v280, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E024000, v280, OS_LOG_TYPE_DEFAULT, "Failed to retrieve power source description.", buf, 2u);
    }

  }
  objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("Date of manufacture"));
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v281 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _PSGLoggingFacility();
    v282 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v282, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E024000, v282, OS_LOG_TYPE_DEFAULT, "Failed to retrieve battery date of manufacture.", buf, 2u);
    }

  }
  objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("Cycle count"));
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v283 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _PSGLoggingFacility();
    v284 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v284, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E024000, v284, OS_LOG_TYPE_DEFAULT, "Failed to retrieve battery cycle count.", buf, 2u);
    }

  }
  objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("Date of first use"));
  v285 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v285 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    _PSGLoggingFacility();
    v273 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22E024000, v273, OS_LOG_TYPE_DEFAULT, "Failed to retrieve battery date of first use.", buf, 2u);
    }
    v188 = 0x24BE75000;
    goto LABEL_219;
  }
  v188 = 0x24BE75000;
LABEL_220:
  if (cf)
    CFRelease(cf);
  v289 = objc_retainAutorelease(v283);
  v290 = objc_retainAutorelease(v285);
  v291 = objc_retainAutorelease(v281);

  v292 = v289;
  v293 = v290;
  v294 = v291;
  v295 = (void *)objc_opt_new();
  objc_msgSend(v295, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM yyyy"));
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("GMT"));
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v295, "setTimeZone:", v296);

  v297 = *(void **)(v188 + 1424);
  PSG_LocalizedStringForLOTX(CFSTR("BATTERY"));
  v298 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v297, "groupSpecifierWithID:name:", CFSTR("BATTERY_HEALTH_GROUP"), v298);
  v299 = objc_claimAutoreleasedReturnValue();

  v373 = (void *)v299;
  objc_msgSend(v382, "addObject:", v299);
  PSG_LocalizedStringForLOTX(CFSTR("UNKNOWN"));
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  v301 = *(void **)(v188 + 1424);
  PSG_LocalizedStringForLOTX(CFSTR("BATTERY_MANUFACTURE_DATE"));
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v301, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v302, v381, 0, sel_valueForSpecifier_, 0, 4, 0);
  v303 = (void *)objc_claimAutoreleasedReturnValue();

  v379 = v294;
  if (v294)
  {
    objc_msgSend(v295, "stringFromDate:", v294);
    v304 = (void *)objc_claimAutoreleasedReturnValue();
    v305 = *MEMORY[0x24BE75DA0];
    objc_msgSend(v303, "setObject:forKeyedSubscript:", v304, *MEMORY[0x24BE75DA0]);

  }
  else
  {
    v305 = *MEMORY[0x24BE75DA0];
    objc_msgSend(v303, "setObject:forKeyedSubscript:", v300, *MEMORY[0x24BE75DA0]);
  }
  objc_msgSend(v382, "addObject:", v303);
  v306 = (void *)MEMORY[0x24BE75590];
  PSG_LocalizedStringForLOTX(CFSTR("BATTERY_FIRST_USE"));
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v306, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v307, v381, 0, sel_valueForSpecifier_, 0, 4, 0);
  v308 = (void *)objc_claimAutoreleasedReturnValue();

  if (v293)
  {
    v309 = v292;
    v310 = v293;
    objc_msgSend(v295, "stringFromDate:", v293);
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v308, "setObject:forKeyedSubscript:", v311, v305);

  }
  else
  {
    v310 = 0;
    v309 = v292;
    objc_msgSend(v308, "setObject:forKeyedSubscript:", v300, v305);
  }
  objc_msgSend(v382, "addObject:", v308);
  v312 = (void *)MEMORY[0x24BE75590];
  PSG_LocalizedStringForLOTX(CFSTR("BATTERY_CYCLE_COUNT"));
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v312, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v313, v381, 0, sel_valueForSpecifier_, 0, 4, 0);
  v314 = (void *)objc_claimAutoreleasedReturnValue();

  if (v309)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%@"), v309);
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v314, "setObject:forKeyedSubscript:", v315, v305);

  }
  else
  {
    objc_msgSend(v314, "setObject:forKeyedSubscript:", v300, v305);
  }
  objc_msgSend(v382, "addObject:", v314);

  v188 = 0x24BE75000uLL;
  v181 = 0x24BE85000uLL;
LABEL_232:
  objc_msgSend(*(id *)(v188 + 1424), "groupSpecifierWithID:", CFSTR("CERT_TRUST_SETTINGS_GROUP"));
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v382, "addObject:");
  PSG_BundleForGeneralSettingsUIFramework();
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v316, "localizedStringForKey:value:table:", CFSTR("CERT_TRUST_SETTINGS"), &stru_24F9C95C8, 0);
  v317 = objc_claimAutoreleasedReturnValue();

  v374 = (void *)v317;
  objc_msgSend(*(id *)(v188 + 1424), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v317, 0, 0, 0, objc_opt_class(), 1, 0);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v318, "setIdentifier:", CFSTR("CERT_TRUST_SETTINGS"));
  v370 = v318;
  objc_msgSend(v382, "addObject:", v318);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", &unk_24F9D45D8);
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v181 + 1792), "sharedInstance");
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  v321 = objc_msgSend(v320, "mobileEquipmentInfoLength");

  if (v321 >= 2)
  {
    v389 = 0u;
    v390 = 0u;
    v387 = 0u;
    v388 = 0u;
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v322, "subscriptionContexts");
    v323 = (void *)objc_claimAutoreleasedReturnValue();

    v324 = objc_msgSend(v323, "countByEnumeratingWithState:objects:count:", &v387, v406, 16);
    if (v324)
    {
      v325 = v324;
      v326 = *(_QWORD *)v388;
      do
      {
        for (k = 0; k != v325; ++k)
        {
          if (*(_QWORD *)v388 != v326)
            objc_enumerationMutation(v323);
          v328 = *(void **)(*((_QWORD *)&v387 + 1) + 8 * k);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%li"), CFSTR("ModemIMEI"), objc_msgSend(v328, "slotID"));
          v329 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v319, "addObject:", v329);

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%li"), CFSTR("ICCID"), objc_msgSend(v328, "slotID"));
          v330 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v319, "addObject:", v330);

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%li"), CFSTR("MEID"), objc_msgSend(v328, "slotID"));
          v331 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v319, "addObject:", v331);

        }
        v325 = objc_msgSend(v323, "countByEnumeratingWithState:objects:count:", &v387, v406, 16);
      }
      while (v325);
    }

  }
  v385 = 0u;
  v386 = 0u;
  v383 = 0u;
  v384 = 0u;
  v332 = v382;
  v333 = objc_msgSend(v332, "countByEnumeratingWithState:objects:count:", &v383, v405, 16);
  if (v333)
  {
    v334 = v333;
    v335 = *(_QWORD *)v384;
    v336 = *MEMORY[0x24BE75D70];
    v337 = MEMORY[0x24BDBD1C8];
    do
    {
      for (m = 0; m != v334; ++m)
      {
        if (*(_QWORD *)v384 != v335)
          objc_enumerationMutation(v332);
        v339 = *(void **)(*((_QWORD *)&v383 + 1) + 8 * m);
        objc_msgSend(v339, "identifier");
        v340 = (void *)objc_claimAutoreleasedReturnValue();
        v341 = objc_msgSend(v319, "containsObject:", v340);

        if (v341)
          objc_msgSend(v339, "setProperty:forKey:", v337, v336);
      }
      v334 = objc_msgSend(v332, "countByEnumeratingWithState:objects:count:", &v383, v405, 16);
    }
    while (v334);
  }

}

uint64_t __36__PSGAboutDataSource_loadSpecifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  v6 = a3;
  objc_msgSend(v5, "getSimHardwareInfo:error:", a2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "getSimHardwareInfo:error:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "simLocation");
  if (v9 >= objc_msgSend(v8, "simLocation"))
  {
    v11 = objc_msgSend(v7, "simLocation");
    v10 = v11 > objc_msgSend(v8, "simLocation");
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

uint64_t __36__PSGAboutDataSource_loadSpecifiers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = (void *)MEMORY[0x24BE856A8];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "simStatus:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x24BDC2CD0];
  v10 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDC2CD0]);

  objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "simStatus:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "isEqualToString:", v9);
  if (v10)
    return 1;
  else
    return v13 << 63 >> 63;
}

- (void)cleanupMLReloadTimer
{
  NSTimer *reloadTimer;

  -[NSTimer invalidate](self->_reloadTimer, "invalidate");
  reloadTimer = self->_reloadTimer;
  self->_reloadTimer = 0;

}

- (void)forceReloadMediaStats:(id)a3
{
  -[PSGAboutDataSource cleanupMLReloadTimer](self, "cleanupMLReloadTimer", a3);
  self->_loaded = 0;
  -[PSSpecifierDataSource performUpdatesAnimated:usingBlock:](self, "performUpdatesAnimated:usingBlock:", 0, &__block_literal_global_682);
}

uint64_t __44__PSGAboutDataSource_forceReloadMediaStats___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadSpecifiersWithIDs:", &unk_24F9D45F0);
}

- (void)enableMLUpdates:(BOOL)a3
{
  void *v4;
  BOOL v5;

  if (a3)
  {
    if (self->_isGeneratingNotifications)
      return;
    objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginGeneratingLibraryChangeNotifications");
    v5 = 1;
  }
  else
  {
    if (!self->_isGeneratingNotifications)
      return;
    objc_msgSend(MEMORY[0x24BDDC7F0], "defaultMediaLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endGeneratingLibraryChangeNotifications");
    v5 = 0;
  }

  self->_isGeneratingNotifications = v5;
}

- (void)mediaLibraryDidChange:(id)a3
{
  NSTimer *v4;
  NSTimer *reloadTimer;

  -[PSGAboutDataSource cleanupMLReloadTimer](self, "cleanupMLReloadTimer", a3);
  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_forceReloadMediaStats_, 0, 0, 1.0);
  v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  reloadTimer = self->_reloadTimer;
  self->_reloadTimer = v4;

  -[PSSpecifierDataSource performUpdatesAnimated:usingBlock:](self, "performUpdatesAnimated:usingBlock:", 0, &__block_literal_global_689);
}

uint64_t __44__PSGAboutDataSource_mediaLibraryDidChange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadSpecifiersWithIDs:", &unk_24F9D4608);
}

- (void)simStatusChangedToReady
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  -[PSSpecifierDataSource specifierForID:](self, "specifierForID:", CFSTR("CellularDataAddress"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PSGAboutDataSource _myNumber](self, "_myNumber");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setProperty:forKey:", v4, *MEMORY[0x24BE75DA0]);

    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __45__PSGAboutDataSource_simStatusChangedToReady__block_invoke;
    v5[3] = &unk_24F9C7E70;
    v5[4] = self;
    v6 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

void __45__PSGAboutDataSource_simStatusChangedToReady__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __45__PSGAboutDataSource_simStatusChangedToReady__block_invoke_2;
  v2[3] = &unk_24F9C81F8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "performUpdatesAnimated:usingBlock:", 0, v2);

}

uint64_t __45__PSGAboutDataSource_simStatusChangedToReady__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadSpecifier:", *(_QWORD *)(a1 + 32));
}

- (void)prlVersionChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("SubscriptionContext"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v7, "slotID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGAboutDataSource prlVersionChangedForSlot:](self, "prlVersionChangedForSlot:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE856A8], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subscriptionContexts");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "slotID", (_QWORD)v17));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[PSGAboutDataSource prlVersionChangedForSlot:](self, "prlVersionChangedForSlot:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v13);
    }

  }
}

- (void)prlVersionChangedForSlot:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_carrierCellState, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (v6 == 1)
  {
    -[PSGAboutDataSource getCarrierSpecifierForSlot:](self, "getCarrierSpecifierForSlot:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __47__PSGAboutDataSource_prlVersionChangedForSlot___block_invoke;
      v9[3] = &unk_24F9C7E70;
      v9[4] = self;
      v10 = v7;
      dispatch_async(MEMORY[0x24BDAC9B8], v9);

    }
  }

}

void __47__PSGAboutDataSource_prlVersionChangedForSlot___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __47__PSGAboutDataSource_prlVersionChangedForSlot___block_invoke_2;
  v2[3] = &unk_24F9C81F8;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "performUpdatesAnimated:usingBlock:", 0, v2);

}

uint64_t __47__PSGAboutDataSource_prlVersionChangedForSlot___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadSpecifier:", *(_QWORD *)(a1 + 32));
}

- (id)getCarrierSpecifierForSlot:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("CARRIER_VERSION"), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSSpecifierDataSource specifierForID:](self, "specifierForID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PSGAboutDataSource)init
{
  PSGAboutDataSource *v2;
  void *v3;
  uint64_t v4;
  NSString *loading;
  NSString *bootstrapIccid;
  NSLock *v7;
  NSLock *lock;
  void *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  CoreTelephonyClient *v11;
  CoreTelephonyClient *client;
  void *v13;
  uint64_t v14;
  NSObject *photoVideoNotificationToken;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PSGAboutDataSource;
  v2 = -[PSSpecifierDataSource init](&v20, sel_init);
  if (v2)
  {
    PSG_BundleForGeneralSettingsUIFramework();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("LOADING"), &stru_24F9C95C8, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    loading = v2->_loading;
    v2->_loading = (NSString *)v4;

    bootstrapIccid = v2->_bootstrapIccid;
    v2->_bootstrapIccid = 0;

    v7 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    lock = v2->_lock;
    v2->_lock = v7;

    -[NSLock setName:](v2->_lock, "setName:", CFSTR("AboutController"));
    objc_msgSend(MEMORY[0x24BDC7CF0], "sharedAccessoryManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerForLocalNotifications");

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)HostRenamedDevice, (CFStringRef)*MEMORY[0x24BEDC4B8], 0, CFNotificationSuspensionBehaviorCoalesce);
    v11 = (CoreTelephonyClient *)objc_alloc_init(MEMORY[0x24BDC2810]);
    client = v2->__client;
    v2->__client = v11;

    -[CoreTelephonyClient setDelegate:](v2->__client, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel__accessoryDidUpdate_, *MEMORY[0x24BDC7BC8], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel__accessoryDidUpdate_, *MEMORY[0x24BDC7BE0], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel__accessoryDidUpdate_, *MEMORY[0x24BDC7BD0], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel__accessoryDidUpdate_, *MEMORY[0x24BDC7BF0], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel__accessoryDidUpdate_, *MEMORY[0x24BDC7C08], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel__accessoryDidUpdate_, *MEMORY[0x24BDC7BF8], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel__accessoryDidUpdate_, *MEMORY[0x24BDC7C00], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_mediaLibraryDidChange_, *MEMORY[0x24BDDBCF0], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_simStatusChangedToReady, *MEMORY[0x24BE856C8], 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_mediaLibraryDidChange_, CFSTR("PSPhotoVideoCountChange"), 0);
    objc_msgSend(v13, "addObserver:selector:name:object:", v2, sel_prlVersionChanged_, *MEMORY[0x24BE85710], 0);
    ALRegisterForPhotosAndVideosCount();
    v14 = objc_claimAutoreleasedReturnValue();
    photoVideoNotificationToken = v2->_photoVideoNotificationToken;
    v2->_photoVideoNotificationToken = v14;

    objc_msgSend(MEMORY[0x24BDC7CF0], "sharedAccessoryManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "startIPAccessoryDiscovery");

    objc_msgSend(MEMORY[0x24BE6C4D0], "sharedController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGAboutDataSource setSharedNDOController:](v2, "setSharedNDOController:", v17);

    if (objc_opt_class())
    {
      objc_msgSend(MEMORY[0x24BE27EA8], "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSGAboutDataSource setSystemHealthUIClient:](v2, "setSystemHealthUIClient:", v18);

    }
  }
  return v2;
}

void __26__PSGAboutDataSource_init__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PSPhotoVideoCountChange"), 0);

}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDC7CF0], "sharedAccessoryManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopIPAccessoryDiscovery");

  -[NSTimer invalidate](self->_reloadTimer, "invalidate");
  -[PSGAboutDataSource enableMLUpdates:](self, "enableMLUpdates:", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  self->_cancel = 1;
  -[NSLock lock](self->_lock, "lock");
  -[NSLock unlock](self->_lock, "unlock");
  objc_msgSend(MEMORY[0x24BDC7CF0], "sharedAccessoryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterForLocalNotifications");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  ALUnregisterForPhotosAndVideosCount();
  v7.receiver = self;
  v7.super_class = (Class)PSGAboutDataSource;
  -[PSGAboutDataSource dealloc](&v7, sel_dealloc);
}

- (void)_accessoryDidUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id location;
  _QWORD v29[4];
  id v30;
  id v31;
  PSGAboutDataSource *v32;
  id v33;
  id v34;
  id v35;
  char v36;

  v4 = a3;
  if (!objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    objc_initWeak(&location, self);
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __42__PSGAboutDataSource__accessoryDidUpdate___block_invoke_2;
    v25[3] = &unk_24F9C8460;
    objc_copyWeak(&v27, &location);
    v26 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v25);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    goto LABEL_18;
  }
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDC7BD8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "connectionID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v6, "bonjourName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    objc_msgSend(v6, "bonjourName");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v14 = (void *)v11;
    goto LABEL_8;
  }
  objc_msgSend(v6, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "length");

  if (v13)
  {
    objc_msgSend(v6, "name");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  v14 = 0;
LABEL_8:
  if (!objc_msgSend(v14, "length")
    || (objc_msgSend(v8, "setString:", v14),
        objc_msgSend(v8, "appendString:", CFSTR("_ACCESSORY")),
        -[PSSpecifierDataSource specifierForID:](self, "specifierForID:", v8),
        (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v7, "stringValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setString:", v16);

    objc_msgSend(v8, "appendString:", CFSTR("_ACCESSORY"));
    -[PSSpecifierDataSource specifierForID:](self, "specifierForID:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (_shouldShowAccessoryInfo(v6))
  {
    objc_msgSend(v4, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BDC7BD0]))
    {
      objc_msgSend(v4, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDC7C08]) ^ 1;

    }
    else
    {
      v19 = 1;
    }

  }
  else
  {
    v19 = 0;
  }
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __42__PSGAboutDataSource__accessoryDidUpdate___block_invoke;
  v29[3] = &unk_24F9C8438;
  v36 = v19;
  v30 = v15;
  v31 = v14;
  v32 = self;
  v33 = v6;
  v34 = v8;
  v35 = v7;
  v20 = v7;
  v21 = v8;
  v22 = v6;
  v23 = v14;
  v24 = v15;
  -[PSSpecifierDataSource performUpdatesAnimated:usingBlock:](self, "performUpdatesAnimated:usingBlock:", 1, v29);

LABEL_18:
}

void __42__PSGAboutDataSource__accessoryDidUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = a2;
  v19 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "removeSpecifier:");
    v3 = v19;
  }
  if (*(_BYTE *)(a1 + 80))
  {
    v4 = *(void **)(a1 + 40);
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      PSG_BundleForGeneralSettingsUIFramework();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ACCESSORY"), &stru_24F9C95C8, 0);
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, *(_QWORD *)(a1 + 48), 0, 0, objc_opt_class(), 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(v7, "setUserInfo:");
      v9 = *(void **)(a1 + 56);
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v9, "bonjourName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "length");

    if (v11)
    {
      v14 = *(void **)(a1 + 64);
      v12 = (id *)(a1 + 64);
      v13 = v14;
      objc_msgSend(*(v12 - 1), "bonjourName");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 72), "intValue"))
      {
LABEL_15:
        objc_msgSend(v19, "specifierForID:", CFSTR("HARDWARE_GROUP"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "appendSpecifier:toGroup:", v8, v18);

        v3 = v19;
        goto LABEL_16;
      }
      v13 = *(void **)(a1 + 64);
      v16 = *(void **)(a1 + 72);
      v12 = (id *)(a1 + 64);
      objc_msgSend(v16, "stringValue");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v15;
    objc_msgSend(v13, "setString:", v15);

    objc_msgSend(*v12, "appendString:", CFSTR("_ACCESSORY"));
    objc_msgSend(v8, "setIdentifier:", *v12);
    goto LABEL_15;
  }
LABEL_16:

}

void __42__PSGAboutDataSource__accessoryDidUpdate___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_accessoryDidUpdate:", *(_QWORD *)(a1 + 32));

}

- (void)reloadDeviceName
{
  -[PSSpecifierDataSource performUpdatesAnimated:usingBlock:](self, "performUpdatesAnimated:usingBlock:", 0, &__block_literal_global_717);
}

uint64_t __38__PSGAboutDataSource_reloadDeviceName__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadSpecifierWithID:", CFSTR("NAME_CELL_ID"));
}

- (void)carrierBundleChange:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    -[PSGAboutDataSource reloadSpecifiers](self, "reloadSpecifiers");
  }
  else
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __42__PSGAboutDataSource_carrierBundleChange___block_invoke;
    v5[3] = &unk_24F9C7E70;
    v5[4] = self;
    v6 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v5);

  }
}

uint64_t __42__PSGAboutDataSource_carrierBundleChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "carrierBundleChange:", *(_QWORD *)(a1 + 40));
}

- (NSString)deviceNameToIgnoreOnce
{
  return self->_deviceNameToIgnoreOnce;
}

- (void)setDeviceNameToIgnoreOnce:(id)a3
{
  objc_storeStrong((id *)&self->_deviceNameToIgnoreOnce, a3);
}

- (NDOACController)sharedNDOController
{
  return self->_sharedNDOController;
}

- (void)setSharedNDOController:(id)a3
{
  objc_storeStrong((id *)&self->_sharedNDOController, a3);
}

- (CoreTelephonyClient)_client
{
  return self->__client;
}

- (void)set_client:(id)a3
{
  objc_storeStrong((id *)&self->__client, a3);
}

- (SystemHealthUI)systemHealthUIClient
{
  return self->_systemHealthUIClient;
}

- (void)setSystemHealthUIClient:(id)a3
{
  objc_storeStrong((id *)&self->_systemHealthUIClient, a3);
}

- (NSArray)ndoSpecifiers
{
  return self->_ndoSpecifiers;
}

- (void)setNdoSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_ndoSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ndoSpecifiers, 0);
  objc_storeStrong((id *)&self->_systemHealthUIClient, 0);
  objc_storeStrong((id *)&self->__client, 0);
  objc_storeStrong((id *)&self->_sharedNDOController, 0);
  objc_storeStrong((id *)&self->_deviceNameToIgnoreOnce, 0);
  objc_storeStrong((id *)&self->_suClient, 0);
  objc_storeStrong((id *)&self->_carrierCellState, 0);
  objc_storeStrong((id *)&self->_bootstrapIccid, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_photoVideoNotificationToken, 0);
  objc_storeStrong((id *)&self->_reloadTimer, 0);
  objc_storeStrong((id *)&self->_loading, 0);
  objc_storeStrong((id *)&self->_headsetSpecifier, 0);
  objc_storeStrong((id *)&self->_mediaDict, 0);
}

void __50__PSGAboutDataSource_getAPFSCurrentUserVolumeNode__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_22E024000, v0, v1, "%s error fetching current user volume: %d", v2, v3, v4, v5, 2u);
}

@end
