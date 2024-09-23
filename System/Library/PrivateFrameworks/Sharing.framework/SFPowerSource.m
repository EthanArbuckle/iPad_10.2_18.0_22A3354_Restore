@implementation SFPowerSource

- (id)description
{
  id v3;
  id v4;
  int64_t sourceID;
  id v6;
  NSString *accessoryCategory;
  id v8;
  NSString *accessoryID;
  id v10;
  NSData *batteryCaseAddress;
  id v12;
  double chargeLevel;
  uint64_t v14;
  id v15;
  NSString *groupID;
  id v17;
  id v18;
  id v19;
  NSString *partID;
  id v21;
  int64_t productID;
  id v23;
  int64_t color;
  id v25;
  int64_t adapterErrorFlags;
  id v27;
  int64_t adapterFamilyCode;
  id v29;
  NSString *adapterName;
  id v31;
  id v32;
  int64_t adapterSourceID;
  id v34;
  id v35;
  int64_t familyCode;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id *v48;
  id v49;
  SFPowerSource *v51;
  const char *v52;
  int64_t v53;
  double v54;
  id v55;
  id v56;
  _QWORD v57[25];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  uint64_t v63;

  v63 = 0;
  v51 = self;
  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  sourceID = self->_sourceID;
  if (sourceID)
  {
    v62 = v3;
    v51 = (SFPowerSource *)sourceID;
    NSAppendPrintF();
    v6 = v62;

    v4 = v6;
  }
  accessoryCategory = self->_accessoryCategory;
  if (accessoryCategory)
  {
    v61 = v4;
    v51 = (SFPowerSource *)accessoryCategory;
    NSAppendPrintF();
    v8 = v4;

    v4 = v8;
  }
  accessoryID = self->_accessoryID;
  if (accessoryID)
  {
    v60 = v4;
    v51 = (SFPowerSource *)accessoryID;
    NSAppendPrintF();
    v10 = v4;

    v4 = v10;
  }
  batteryCaseAddress = self->_batteryCaseAddress;
  if (batteryCaseAddress)
  {
    v59 = v4;
    v51 = (SFPowerSource *)batteryCaseAddress;
    NSAppendPrintF();
    v12 = v4;

    v4 = v12;
  }
  chargeLevel = self->_chargeLevel;
  if (chargeLevel != 0.0)
  {
    v58 = v4;
    v54 = chargeLevel * 100.0;
    v14 = 43;
    if (!self->_charging)
      v14 = 45;
    v51 = (SFPowerSource *)v14;
    NSAppendPrintF();
    v15 = v58;

    v4 = v15;
  }
  groupID = self->_groupID;
  if (groupID)
  {
    v57[24] = v4;
    v51 = (SFPowerSource *)groupID;
    NSAppendPrintF();
    v17 = v4;

    v4 = v17;
  }
  if (-[SFPowerSource matID](self, "matID", v51, *(_QWORD *)&v54))
  {
    v57[23] = v4;
    v53 = -[SFPowerSource matID](self, "matID");
    NSAppendPrintF();
    v18 = v4;

    if (-[SFPowerSource matID](self, "matID", v53) == 0xFFFF)
    {
      v57[22] = v18;
      NSAppendPrintF();
      v19 = v18;

      v18 = v19;
    }
    if (-[SFPowerSource matID](self, "matID") == 123456789)
    {
      v57[21] = v18;
      NSAppendPrintF();
      v4 = v18;

    }
    else
    {
      v4 = v18;
    }
  }
  partID = self->_partID;
  if (partID)
  {
    v57[20] = v4;
    v52 = (const char *)partID;
    NSAppendPrintF();
    v21 = v4;

    v4 = v21;
  }
  productID = self->_productID;
  if (productID)
  {
    v57[19] = v4;
    v52 = (const char *)productID;
    NSAppendPrintF();
    v23 = v4;

    v4 = v23;
  }
  color = self->_color;
  if (color != -1)
  {
    v57[18] = v4;
    v52 = (const char *)color;
    NSAppendPrintF();
    v25 = v4;

    v4 = v25;
  }
  adapterErrorFlags = self->_adapterErrorFlags;
  if (adapterErrorFlags)
  {
    v57[17] = v4;
    v52 = (const char *)adapterErrorFlags;
    NSAppendPrintF();
    v27 = v4;

    v4 = v27;
  }
  adapterFamilyCode = self->_adapterFamilyCode;
  if (adapterFamilyCode)
  {
    v57[16] = v4;
    v52 = (const char *)adapterFamilyCode;
    NSAppendPrintF();
    v29 = v4;

    v4 = v29;
  }
  adapterName = self->_adapterName;
  if (adapterName)
  {
    v57[15] = v4;
    v52 = (const char *)adapterName;
    NSAppendPrintF();
    v31 = v4;

    v4 = v31;
  }
  if (self->_adapterSharedSource)
  {
    v57[14] = v4;
    v52 = "yes";
    NSAppendPrintF();
    v32 = v4;

    v4 = v32;
  }
  adapterSourceID = self->_adapterSourceID;
  if (adapterSourceID)
  {
    v57[13] = v4;
    v52 = (const char *)adapterSourceID;
    NSAppendPrintF();
    v34 = v4;

    v4 = v34;
  }
  if (self->_showChargingUI)
  {
    v57[12] = v4;
    v52 = "yes";
    NSAppendPrintF();
    v35 = v4;

    v4 = v35;
  }
  familyCode = self->_familyCode;
  if (familyCode)
  {
    v57[11] = v4;
    v52 = (const char *)familyCode;
    NSAppendPrintF();
    v37 = v4;

    v4 = v37;
  }
  if (-[NSArray count](self->_LEDs, "count", v52))
  {
    v57[10] = v4;
    NSAppendPrintF();
    v38 = v4;

    v4 = v38;
  }
  if (self->_maxCapacity > 0.0)
  {
    v57[9] = v4;
    NSAppendPrintF();
    v39 = v4;

    v4 = v39;
  }
  if (self->_vendorID)
  {
    v57[8] = v4;
    NSAppendPrintF();
    v40 = v4;

    v4 = v40;
  }
  if (self->_temperature)
  {
    v57[7] = v4;
    NSAppendPrintF();
    v41 = v4;

    v4 = v41;
  }
  if (self->_type)
  {
    v57[6] = v4;
    NSAppendPrintF();
    v42 = v4;

    v4 = v42;
  }
  if (self->_transportType)
  {
    v57[5] = v4;
    NSAppendPrintF();
    v43 = v4;

    v4 = v43;
  }
  if (self->_name)
  {
    v57[4] = v4;
    NSAppendPrintF();
    v44 = v4;

    v4 = v44;
  }
  if (self->_lowPowerModeEnabled)
  {
    v57[3] = v4;
    NSAppendPrintF();
    v45 = v4;

    v4 = v45;
  }
  if (self->_lowWarnLevel != 0.0)
  {
    v57[2] = v4;
    NSAppendPrintF();
    v46 = v4;

    v4 = v46;
  }
  if (self->_powerState)
  {
    v57[1] = v4;
    NSAppendPrintF();
    v47 = v4;

    if (self->_powerState == 1)
    {
      if (self->_charging)
      {
        v57[0] = v47;
        v48 = (id *)v57;
      }
      else
      {
        v56 = v47;
        v48 = &v56;
      }
    }
    else
    {
      v55 = v47;
      v48 = &v55;
    }
    NSAppendPrintF();
    v4 = *v48;

  }
  NSAppendPrintF();
  v49 = v4;

  return v49;
}

- (int64_t)matID
{
  __CFString *v3;
  __CFString *v4;
  char v5;
  __CFString *v6;
  __CFString *v7;
  char v8;
  __CFString *v9;
  __CFString *v10;
  char v11;

  if (!IsAppleInternalBuild()
    || !-[SFPowerSource wirelessCharging](self, "wirelessCharging")
    || !BOOLeanValueForPreference(CFSTR("EnableAnyCharger"), 0))
  {
    return -[SFPowerSource adapterSourceID](self, "adapterSourceID");
  }
  if (-[SFPowerSource isInternal](self, "isInternal"))
    return 123456789;
  -[SFPowerSource accessoryCategory](self, "accessoryCategory");
  v3 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 == CFSTR("Battery Case")
    || v3 && (v5 = -[__CFString isEqual:](v3, "isEqual:", CFSTR("Battery Case")), v4, (v5 & 1) != 0))
  {
LABEL_16:

    return 123456789;
  }
  -[SFPowerSource accessoryCategory](self, "accessoryCategory");
  v6 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 == CFSTR("Watch")
    || v6 && (v8 = -[__CFString isEqual:](v6, "isEqual:", CFSTR("Watch")), v7, (v8 & 1) != 0)
    || (-[SFPowerSource partID](self, "partID"),
        v9 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(),
        v9 == CFSTR("Case")))
  {

    goto LABEL_16;
  }
  v10 = v9;
  if (v9)
  {
    v11 = -[__CFString isEqual:](v9, "isEqual:", CFSTR("Case"));

    if ((v11 & 1) == 0)
      return -[SFPowerSource adapterSourceID](self, "adapterSourceID");
    return 123456789;
  }

  return -[SFPowerSource adapterSourceID](self, "adapterSourceID");
}

- (int64_t)adapterSourceID
{
  return self->_adapterSourceID;
}

- (BOOL)wirelessCharging
{
  BOOL v3;
  __CFString *v4;
  __CFString *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  char v9;
  int64_t v10;
  int64_t v11;
  _BOOL4 v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  __CFString *v16;
  __CFString *v17;
  int v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  BOOL v22;
  __CFString *v24;
  __CFString *v25;
  int v26;
  _BOOL4 v27;

  v3 = -[SFPowerSource charging](self, "charging")
    && IsAppleInternalBuild()
    && BOOLeanValueForPreference(CFSTR("EnableAnyCharger"), 0) != 0;
  -[SFPowerSource accessoryCategory](self, "accessoryCategory");
  v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 != CFSTR("Battery Case"))
  {
    if (!v4)
      goto LABEL_12;
    v6 = -[__CFString isEqual:](v4, "isEqual:", CFSTR("Battery Case"));

    if (!v6)
      goto LABEL_12;
  }
  -[SFPowerSource transportType](self, "transportType");
  v7 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v7 != CFSTR("AID"))
  {
    v8 = v7;
    if (v7)
    {
      v9 = -[__CFString isEqual:](v7, "isEqual:", CFSTR("AID"));

      if ((v9 & 1) != 0)
        goto LABEL_15;
LABEL_13:
      v10 = -[SFPowerSource adapterFamilyCode](self, "adapterFamilyCode");
      goto LABEL_16;
    }
LABEL_12:

    goto LABEL_13;
  }

LABEL_15:
  v10 = -[SFPowerSource familyCode](self, "familyCode");
LABEL_16:
  v11 = v10;
  v12 = -[SFPowerSource charging](self, "charging");
  -[SFPowerSource groupID](self, "groupID");
  v13 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v13 == CFSTR("Internal"))
    goto LABEL_25;
  v14 = v13;
  if (v13)
  {
    v15 = -[__CFString isEqual:](v13, "isEqual:", CFSTR("Internal"));

    if (v15)
      goto LABEL_25;
  }
  -[SFPowerSource accessoryCategory](self, "accessoryCategory");
  v16 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v16 == CFSTR("Battery Case"))
    goto LABEL_25;
  v17 = v16;
  if (v16)
  {
    v18 = -[__CFString isEqual:](v16, "isEqual:", CFSTR("Battery Case"));

    if (v18)
      goto LABEL_25;
  }
  -[SFPowerSource accessoryCategory](self, "accessoryCategory");
  v19 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  if (v19 == CFSTR("Watch")
    || (v20 = v19) != 0
    && (v21 = -[__CFString isEqual:](v19, "isEqual:", CFSTR("Watch")), v20, v20, v21))
  {
LABEL_25:
    v22 = v11 == -536723452 && v12;
    return v22 || v3;
  }
  else
  {
    -[SFPowerSource partID](self, "partID");
    v24 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    if (v24 == CFSTR("Case")
      || (v25 = v24) != 0
      && (v26 = -[__CFString isEqual:](v24, "isEqual:", CFSTR("Case")), v25, v25, v26))
    {
      if (-[SFPowerSource adapterSourceID](self, "adapterSourceID"))
        v27 = -[SFPowerSource adapterSourceID](self, "adapterSourceID") != 0xFFFF;
      else
        v27 = 0;
      if (v11 == -536723452)
        v27 = 1;
      return v27 && (v27 || v12) || v3;
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)charging
{
  return self->_charging;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (NSString)accessoryCategory
{
  return self->_accessoryCategory;
}

- (int64_t)adapterFamilyCode
{
  return self->_adapterFamilyCode;
}

- (unsigned)updateWithPowerAdapterDetails:(id)a3
{
  id v5;
  unsigned int v6;
  void *v7;
  NSString *adapterName;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  char v12;
  uint64_t Int64;

  v5 = a3;
  objc_storeStrong((id *)&self->_ioKitAdapterDescription, a3);
  if ((int)CFDictionaryGetInt64Ranged() == self->_adapterFamilyCode)
  {
    v6 = 0;
  }
  else
  {
    -[SFPowerSource setAdapterFamilyCode:](self, "setAdapterFamilyCode:");
    v6 = 256;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  adapterName = self->_adapterName;
  v9 = v7;
  v10 = adapterName;
  if (v9 == v10)
  {

    goto LABEL_11;
  }
  v11 = v10;
  if ((v9 == 0) == (v10 != 0))
  {

    goto LABEL_10;
  }
  v12 = -[NSString isEqual:](v9, "isEqual:", v10);

  if ((v12 & 1) == 0)
  {
LABEL_10:
    -[SFPowerSource setAdapterName:](self, "setAdapterName:", v9);
    v6 = 256;
  }
LABEL_11:
  Int64 = CFDictionaryGetInt64();
  if (self->_adapterSharedSource != (Int64 != 0))
  {
    -[SFPowerSource setAdapterSharedSource:](self, "setAdapterSharedSource:", Int64 != 0);
    v6 = 256;
  }
  if ((int)CFDictionaryGetInt64Ranged() != self->_adapterSourceID)
  {
    -[SFPowerSource setAdapterSourceID:](self, "setAdapterSourceID:");
    v6 = 256;
  }
  if ((int)CFDictionaryGetInt64Ranged() != self->_adapterErrorFlags)
  {
    -[SFPowerSource setAdapterErrorFlags:](self, "setAdapterErrorFlags:");
    v6 |= 0x100u;
  }
  -[SFPowerSource startLowPowerMonitoringIfAppropriate](self, "startLowPowerMonitoringIfAppropriate");

  return v6;
}

- (unsigned)updateWithPowerSourceDescription:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSString *accessoryCategory;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  char v12;
  unsigned int v13;
  void *v14;
  NSString *accessoryID;
  NSString *v16;
  NSString *v17;
  NSString *v18;
  char v19;
  void *v20;
  void *v21;
  NSData *batteryCaseAddress;
  NSData *v23;
  NSData *v24;
  NSData *v25;
  char v26;
  uint64_t Int64;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  NSString *groupID;
  NSString *v36;
  NSString *v37;
  NSString *v38;
  char v39;
  void *v40;
  NSArray *LEDs;
  NSArray *v42;
  NSArray *v43;
  NSArray *v44;
  char v45;
  id v46;
  NSArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  SFPowerSourceLEDInfo *v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  const char *v57;
  uint64_t v58;
  NSArray *v59;
  NSArray *v60;
  char v61;
  void *v62;
  uint64_t v63;
  double v64;
  void *v65;
  NSString *name;
  NSString *v67;
  NSString *v68;
  NSString *v69;
  char v70;
  void *v71;
  NSString *partID;
  NSString *v73;
  NSString *v74;
  NSString *v75;
  char v76;
  void *v77;
  NSString *partName;
  NSString *v79;
  NSString *v80;
  NSString *v81;
  char v82;
  void *v83;
  __CFString *v84;
  __CFString *v85;
  char v86;
  int v87;
  __CFString *v88;
  __CFString *v89;
  char v90;
  __CFString *v91;
  __CFString *v92;
  int v93;
  void *v94;
  NSString *state;
  NSString *v96;
  NSString *v97;
  NSString *v98;
  char v99;
  void *v100;
  NSString *transportType;
  NSString *v102;
  NSString *v103;
  NSString *v104;
  char v105;
  void *v106;
  NSString *type;
  NSString *v108;
  NSString *v109;
  NSString *v110;
  char v111;
  __CFString *v112;
  __CFString *v113;
  int v114;
  void *v115;
  void *v116;
  NSDictionary *ioKitAdapterDescription;
  NSDictionary *v118;
  NSDictionary *v119;
  NSDictionary *v120;
  char v121;
  void *v123;
  void *v124;
  void *v125;
  unsigned int v126;
  SFPowerSource *v127;
  id v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _BYTE v133[128];
  uint64_t v134;

  v134 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_ioKitDescription, a3);
  self->_present = 1;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_7;
  accessoryCategory = self->_accessoryCategory;
  v9 = v6;
  v10 = accessoryCategory;
  if (v9 == v10)
  {

    goto LABEL_7;
  }
  v11 = v10;
  if (v10)
  {
    v12 = -[NSString isEqual:](v9, "isEqual:", v10);

    if ((v12 & 1) == 0)
      goto LABEL_9;
LABEL_7:
    v13 = 0;
    goto LABEL_10;
  }

LABEL_9:
  -[SFPowerSource setAccessoryCategory:](self, "setAccessoryCategory:", v9);
  v13 = 1;
LABEL_10:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_18;
  accessoryID = self->_accessoryID;
  v16 = v14;
  v17 = accessoryID;
  if (v16 == v17)
  {

    goto LABEL_18;
  }
  v18 = v17;
  if (!v17)
  {

    goto LABEL_17;
  }
  v19 = -[NSString isEqual:](v16, "isEqual:", v17);

  if ((v19 & 1) == 0)
  {
LABEL_17:
    -[SFPowerSource setAccessoryID:](self, "setAccessoryID:", v16);
    v13 = 1;
  }
LABEL_18:
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v20)
    goto LABEL_26;
  batteryCaseAddress = self->_batteryCaseAddress;
  v23 = v20;
  v24 = batteryCaseAddress;
  if (v23 == v24)
  {

    goto LABEL_26;
  }
  v25 = v24;
  if (!v24)
  {

    goto LABEL_25;
  }
  v26 = -[NSData isEqual:](v23, "isEqual:", v24);

  if ((v26 & 1) == 0)
  {
LABEL_25:
    -[SFPowerSource setBatteryCaseAddress:](self, "setBatteryCaseAddress:", v23);
    v13 = 1;
  }
LABEL_26:
  Int64 = CFDictionaryGetInt64();
  v28 = CFDictionaryGetInt64();
  if (self->_charging != ((Int64 | v28) != 0))
  {
    -[SFPowerSource setCharging:](self, "setCharging:");
    v13 |= 4u;
  }
  if (self->_showChargingUI != (v28 != 0))
  {
    -[SFPowerSource setShowChargingUI:](self, "setShowChargingUI:", v28 != 0);
    v13 |= 4u;
  }
  CFDictionaryGetDouble();
  v30 = v29;
  CFDictionaryGetDouble();
  v32 = v31;
  v33 = v30 * 100.0 / v31 / 100.0;
  if (v33 > 1.0)
    v33 = 1.0;
  if (v33 < 0.0)
    v33 = 0.0;
  if (v33 != self->_chargeLevel)
  {
    -[SFPowerSource setChargeLevel:](self, "setChargeLevel:");
    v13 |= 2u;
  }
  if ((int)CFDictionaryGetInt64Ranged() != self->_color)
  {
    -[SFPowerSource setColor:](self, "setColor:");
    v13 |= 1u;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    groupID = self->_groupID;
    v36 = v34;
    v37 = groupID;
    if (v36 == v37)
    {

      goto LABEL_46;
    }
    v38 = v37;
    if (v37)
    {
      v39 = -[NSString isEqual:](v36, "isEqual:", v37);

      if ((v39 & 1) != 0)
        goto LABEL_46;
    }
    else
    {

    }
    -[SFPowerSource setGroupID:](self, "setGroupID:", v36);
    v13 |= 1u;
  }
LABEL_46:
  if ((int)CFDictionaryGetInt64Ranged() != self->_familyCode)
  {
    -[SFPowerSource setFamilyCode:](self, "setFamilyCode:");
    v13 |= 1u;
  }
  CFArrayGetTypeID();
  CFDictionaryGetTypedValue();
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v40, "count"))
  {
    LEDs = self->_LEDs;
    v42 = v40;
    v43 = LEDs;
    if (v42 == v43)
    {

    }
    else
    {
      v44 = v43;
      if ((v42 == 0) != (v43 != 0))
      {
        v45 = -[NSArray isEqual:](v42, "isEqual:", v43);

        if ((v45 & 1) != 0)
          goto LABEL_88;
      }
      else
      {

      }
      v123 = v34;
      v124 = v40;
      v125 = v21;
      v126 = v13;
      v127 = self;
      v128 = v5;
      v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v129 = 0u;
      v130 = 0u;
      v131 = 0u;
      v132 = 0u;
      v47 = v42;
      v48 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v129, v133, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v130;
        do
        {
          for (i = 0; i != v49; ++i)
          {
            if (*(_QWORD *)v130 != v50)
              objc_enumerationMutation(v47);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v52 = objc_alloc_init(SFPowerSourceLEDInfo);
              CFStringGetTypeID();
              v53 = (const char *)objc_msgSend(objc_retainAutorelease((id)CFDictionaryGetTypedValue()), "UTF8String");
              if (v53)
              {
                v54 = v53;
                if (!strcmp(v53, "Green"))
                {
                  v55 = 1;
                }
                else if (!strcmp(v54, "Orange"))
                {
                  v55 = 2;
                }
                else if (!strcmp(v54, "White"))
                {
                  v55 = 3;
                }
                else
                {
                  v55 = 4 * (strcmp(v54, "Red") == 0);
                }
                -[SFPowerSourceLEDInfo setLEDColor:](v52, "setLEDColor:", v55, v123, v124);
              }
              CFStringGetTypeID();
              v56 = (const char *)objc_msgSend(objc_retainAutorelease((id)CFDictionaryGetTypedValue()), "UTF8String");
              if (v56)
              {
                v57 = v56;
                if (!strcmp(v56, "Off"))
                {
                  v58 = 0;
                }
                else if (!strcmp(v57, "Solid"))
                {
                  v58 = 1;
                }
                else
                {
                  v58 = 2 * (strcmp(v57, "Blinking") == 0);
                }
                -[SFPowerSourceLEDInfo setLEDState:](v52, "setLEDState:", v58, v123, v124);
              }
              objc_msgSend(v46, "addObject:", v52, v123, v124);

            }
          }
          v49 = -[NSArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v129, v133, 16);
        }
        while (v49);
      }

      self = v127;
      v59 = v127->_LEDs;
      v60 = (NSArray *)v46;
      v42 = v60;
      if (v59 == v60)
      {

        v5 = v128;
        v13 = v126;
        v40 = v124;
        v21 = v125;
        v34 = v123;
      }
      else
      {
        v13 = v126;
        v34 = v123;
        v40 = v124;
        if ((v60 != 0) != (v59 == 0))
        {
          v61 = -[NSArray isEqual:](v59, "isEqual:", v60);

          v5 = v128;
          v21 = v125;
          if ((v61 & 1) != 0)
            goto LABEL_87;
        }
        else
        {

          v5 = v128;
          v21 = v125;
        }
        v62 = (void *)-[NSArray copy](v42, "copy", v123, v124);
        -[SFPowerSource setLEDs:](v127, "setLEDs:", v62);

        v13 = v126 | 1;
      }
    }
LABEL_87:

  }
LABEL_88:
  v63 = CFDictionaryGetInt64();
  if (self->_lowPowerModeEnabled != (v63 != 0))
  {
    -[SFPowerSource setLowPowerModeEnabled:](self, "setLowPowerModeEnabled:", v63 != 0);
    v13 |= 4u;
  }
  CFDictionaryGetDouble();
  if ((double)(int)v64 / 100.0 != self->_lowWarnLevel)
  {
    -[SFPowerSource setLowWarnLevel:](self, "setLowWarnLevel:");
    v13 |= 1u;
  }
  if (v32 != self->_maxCapacity)
  {
    -[SFPowerSource setMaxCapacity:](self, "setMaxCapacity:", v32);
    v13 |= 4u;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    name = self->_name;
    v67 = v65;
    v68 = name;
    if (v67 == v68)
    {

      goto LABEL_102;
    }
    v69 = v68;
    if (v68)
    {
      v70 = -[NSString isEqual:](v67, "isEqual:", v68);

      if ((v70 & 1) != 0)
        goto LABEL_102;
    }
    else
    {

    }
    -[SFPowerSource setName:](self, "setName:", v67, v123, v124);
    v13 |= 1u;
  }
LABEL_102:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v71)
    goto LABEL_110;
  partID = self->_partID;
  v73 = v71;
  v74 = partID;
  if (v73 == v74)
  {

    goto LABEL_110;
  }
  v75 = v74;
  if (!v74)
  {

    goto LABEL_109;
  }
  v76 = -[NSString isEqual:](v73, "isEqual:", v74);

  if ((v76 & 1) == 0)
  {
LABEL_109:
    -[SFPowerSource setPartID:](self, "setPartID:", v73, v123, v124);
    v13 |= 1u;
  }
LABEL_110:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v77 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v77)
    goto LABEL_118;
  partName = self->_partName;
  v79 = v77;
  v80 = partName;
  if (v79 == v80)
  {

    goto LABEL_118;
  }
  v81 = v80;
  if (!v80)
  {

    goto LABEL_117;
  }
  v82 = -[NSString isEqual:](v79, "isEqual:", v80);

  if ((v82 & 1) == 0)
  {
LABEL_117:
    -[SFPowerSource setPartName:](self, "setPartName:", v79, v123, v124);
    v13 |= 1u;
  }
LABEL_118:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  v84 = v83;
  v85 = v84;
  if (v84 == CFSTR("Off Line"))
  {
LABEL_121:
    v87 = 1;
    goto LABEL_130;
  }
  if (!v84)
    goto LABEL_129;
  v86 = -[__CFString isEqual:](v84, "isEqual:", CFSTR("Off Line"));

  if ((v86 & 1) != 0)
    goto LABEL_121;
  v88 = v85;
  if (v88 == CFSTR("AC Power")
    || (v89 = v88, v90 = -[__CFString isEqual:](v88, "isEqual:", CFSTR("AC Power")), v89, (v90 & 1) != 0)
    || (v91 = v89, v91 == CFSTR("UPS Power"))
    || (v92 = v91, v93 = -[__CFString isEqual:](v91, "isEqual:", CFSTR("UPS Power")), v92, v93))
  {
    if (CFDictionaryGetInt64() || CFDictionaryGetInt64())
      v87 = 4;
    else
      v87 = 3;
  }
  else
  {
LABEL_129:
    v87 = 2;
  }
LABEL_130:
  if (v87 != self->_powerState)
  {
    -[SFPowerSource setPowerState:](self, "setPowerState:");
    v13 |= 4u;
  }
  if ((int)CFDictionaryGetInt64Ranged() != self->_productID)
  {
    -[SFPowerSource setProductID:](self, "setProductID:");
    v13 |= 1u;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  if (v94)
  {
    state = self->_state;
    v96 = v94;
    v97 = state;
    if (v96 == v97)
    {

      goto LABEL_142;
    }
    v98 = v97;
    if (v97)
    {
      v99 = -[NSString isEqual:](v96, "isEqual:", v97);

      if ((v99 & 1) != 0)
        goto LABEL_142;
    }
    else
    {

    }
    -[SFPowerSource setState:](self, "setState:", v96, v123, v124);
    v13 |= 4u;
  }
LABEL_142:
  if ((int)CFDictionaryGetInt64Ranged() != self->_temperature)
  {
    -[SFPowerSource setTemperature:](self, "setTemperature:");
    v13 |= 1u;
  }
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (v100)
  {
    transportType = self->_transportType;
    v102 = v100;
    v103 = transportType;
    if (v102 == v103)
    {

      goto LABEL_152;
    }
    v104 = v103;
    if (v103)
    {
      v105 = -[NSString isEqual:](v102, "isEqual:", v103);

      if ((v105 & 1) != 0)
        goto LABEL_152;
    }
    else
    {

    }
    -[SFPowerSource setTransportType:](self, "setTransportType:", v102, v123, v124);
    v13 |= 1u;
  }
LABEL_152:
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v106)
    goto LABEL_160;
  type = self->_type;
  v108 = v106;
  v109 = type;
  if (v108 == v109)
  {

    goto LABEL_160;
  }
  v110 = v109;
  if (!v109)
  {

    goto LABEL_159;
  }
  v111 = -[NSString isEqual:](v108, "isEqual:", v109);

  if ((v111 & 1) == 0)
  {
LABEL_159:
    -[SFPowerSource setType:](self, "setType:", v108, v123, v124);
    v13 |= 1u;
  }
LABEL_160:
  if ((int)CFDictionaryGetInt64Ranged() != self->_vendorID)
  {
    -[SFPowerSource setVendorID:](self, "setVendorID:");
    v13 |= 1u;
  }
  v112 = self->_type;
  if (v112 == CFSTR("Accessory Source")
    || (v113 = v112) != 0
    && (v114 = -[__CFString isEqual:](v112, "isEqual:", CFSTR("Accessory Source")), v113, v114))
  {
    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v115;
    if (v115)
    {
      ioKitAdapterDescription = self->_ioKitAdapterDescription;
      v118 = v115;
      v119 = ioKitAdapterDescription;
      if (v118 == v119)
      {

      }
      else
      {
        v120 = v119;
        if (v119)
        {
          v121 = -[NSDictionary isEqual:](v118, "isEqual:", v119);

          if ((v121 & 1) != 0)
            goto LABEL_173;
        }
        else
        {

        }
        v13 |= -[SFPowerSource updateWithPowerAdapterDetails:](self, "updateWithPowerAdapterDetails:", v118, v123, v124);
      }
    }
LABEL_173:

  }
  -[SFPowerSource startLowPowerMonitoringIfAppropriate](self, "startLowPowerMonitoringIfAppropriate", v123, v124);

  return v13;
}

- (void)startLowPowerMonitoringIfAppropriate
{
  _QWORD handler[5];

  if (-[SFPowerSource isInternal](self, "isInternal") && self->_lowPowerMonitoringToken == -1)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __53__SFPowerSource_startLowPowerMonitoringIfAppropriate__block_invoke;
    handler[3] = &unk_1E482FB48;
    handler[4] = self;
    if (!notify_register_dispatch("com.apple.system.batterysavermode", &self->_lowPowerMonitoringToken, MEMORY[0x1E0C80D38], handler))-[SFPowerSource lowPowerModeChanged:](self, "lowPowerModeChanged:", self->_lowPowerMonitoringToken);
  }
}

- (BOOL)isInternal
{
  __CFString *v2;
  __CFString *v3;
  char v4;

  -[SFPowerSource type](self, "type");
  v2 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == CFSTR("InternalBattery"))
  {
    v4 = 1;
  }
  else if (v2)
  {
    v4 = -[__CFString isEqual:](v2, "isEqual:", CFSTR("InternalBattery"));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)type
{
  return self->_type;
}

- (void)setChanges:(unsigned int)a3
{
  self->_changes = a3;
}

- (void)setPresent:(BOOL)a3
{
  self->_present = a3;
}

- (void)setAdded:(BOOL)a3
{
  self->_added = a3;
}

- (BOOL)present
{
  return self->_present;
}

- (unsigned)changes
{
  return self->_changes;
}

- (BOOL)added
{
  return self->_added;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPowerSource)init
{
  SFPowerSource *v2;
  SFPowerSource *v3;
  SFPowerSource *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFPowerSource;
  v2 = -[SFPowerSource init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lowPowerMonitoringToken = -1;
    v2->_color = -1;
    v4 = v2;
  }

  return v3;
}

- (SFPowerSource)initWithCoder:(id)a3
{
  id v4;
  SFPowerSource *v5;
  SFPowerSource *v6;
  SFPowerSource *v7;

  v4 = a3;
  v5 = -[SFPowerSource init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[SFPowerSource _updateWithCoder:](v5, "_updateWithCoder:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)_updateWithCoder:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double v31;
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  NSDictionary *ioKitDescription;
  id v47;
  id v48;

  v4 = a3;
  objc_opt_class();
  NSDecodeObjectIfPresent();
  -[SFPowerSource setAccessoryCategory:](self, "setAccessoryCategory:", 0);
  v5 = v4;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  -[SFPowerSource setAccessoryID:](self, "setAccessoryID:", 0);
  v6 = v5;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  -[SFPowerSource setBatteryCaseAddress:](self, "setBatteryCaseAddress:", 0);
  v7 = v6;
  v8 = 0;
  if (objc_msgSend(v7, "containsValueForKey:", CFSTR("adapterErrorFlag")))
    v8 = objc_msgSend(v7, "decodeIntegerForKey:", CFSTR("adapterErrorFlag"));

  -[SFPowerSource setAdapterErrorFlags:](self, "setAdapterErrorFlags:", v8);
  v9 = v7;
  if (objc_msgSend(v9, "containsValueForKey:", CFSTR("adapterFamilyCode")))
    v10 = objc_msgSend(v9, "decodeIntegerForKey:", CFSTR("adapterFamilyCode"));
  else
    v10 = 0;

  -[SFPowerSource setAdapterFamilyCode:](self, "setAdapterFamilyCode:", v10);
  v11 = v9;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  -[SFPowerSource setAdapterName:](self, "setAdapterName:", 0);
  v12 = v11;
  if (objc_msgSend(v12, "containsValueForKey:", CFSTR("adapterSharedSource")))
    v13 = objc_msgSend(v12, "decodeBoolForKey:", CFSTR("adapterSharedSource"));
  else
    v13 = 0;

  -[SFPowerSource setAdapterSharedSource:](self, "setAdapterSharedSource:", v13);
  v14 = v12;
  if (objc_msgSend(v14, "containsValueForKey:", CFSTR("adapterSourceID")))
    v15 = objc_msgSend(v14, "decodeIntegerForKey:", CFSTR("adapterSourceID"));
  else
    v15 = 0;

  -[SFPowerSource setAdapterSourceID:](self, "setAdapterSourceID:", v15);
  v16 = v14;
  if (objc_msgSend(v16, "containsValueForKey:", CFSTR("charging")))
    v17 = objc_msgSend(v16, "decodeBoolForKey:", CFSTR("charging"));
  else
    v17 = 0;

  -[SFPowerSource setCharging:](self, "setCharging:", v17);
  v18 = v16;
  v19 = 0.0;
  if (objc_msgSend(v18, "containsValueForKey:", CFSTR("chargeLevel")))
  {
    objc_msgSend(v18, "decodeDoubleForKey:", CFSTR("chargeLevel"));
    v19 = v20;
  }

  -[SFPowerSource setChargeLevel:](self, "setChargeLevel:", v19);
  v21 = v18;
  if (objc_msgSend(v21, "containsValueForKey:", CFSTR("color")))
    v22 = objc_msgSend(v21, "decodeIntegerForKey:", CFSTR("color"));
  else
    v22 = -1;

  -[SFPowerSource setColor:](self, "setColor:", v22);
  v23 = v21;
  if (objc_msgSend(v23, "containsValueForKey:", CFSTR("familyCode")))
    v24 = objc_msgSend(v23, "decodeIntegerForKey:", CFSTR("familyCode"));
  else
    v24 = 0;

  -[SFPowerSource setFamilyCode:](self, "setFamilyCode:", v24);
  v25 = v23;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  -[SFPowerSource setGroupID:](self, "setGroupID:", 0);
  objc_opt_class();
  NSDecodeNSArrayOfClassIfPresent();
  -[SFPowerSource setLEDs:](self, "setLEDs:", 0);
  v26 = v25;
  v27 = 0.0;
  v28 = 0.0;
  if (objc_msgSend(v26, "containsValueForKey:", CFSTR("lowWarnLevel")))
  {
    objc_msgSend(v26, "decodeDoubleForKey:", CFSTR("lowWarnLevel"));
    v28 = v29;
  }

  -[SFPowerSource setLowWarnLevel:](self, "setLowWarnLevel:", v28);
  v30 = v26;
  if (objc_msgSend(v30, "containsValueForKey:", CFSTR("maxCapacity")))
  {
    objc_msgSend(v30, "decodeDoubleForKey:", CFSTR("maxCapacity"));
    v27 = v31;
  }

  -[SFPowerSource setMaxCapacity:](self, "setMaxCapacity:", v27);
  v32 = v30;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  -[SFPowerSource setName:](self, "setName:", 0);
  v33 = v32;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  -[SFPowerSource setPartID:](self, "setPartID:", 0);
  v34 = v33;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  -[SFPowerSource setPartName:](self, "setPartName:", 0);
  NSDecodeSInt64RangedIfPresent();
  -[SFPowerSource setPowerState:](self, "setPowerState:", 0);
  v35 = v34;
  v36 = 0;
  if (objc_msgSend(v35, "containsValueForKey:", CFSTR("productID")))
    v36 = objc_msgSend(v35, "decodeIntegerForKey:", CFSTR("productID"));

  -[SFPowerSource setProductID:](self, "setProductID:", v36);
  NSDecodeSInt64RangedIfPresent();
  -[SFPowerSource setRole:](self, "setRole:", 0);
  v37 = v35;
  v38 = 0;
  if (objc_msgSend(v37, "containsValueForKey:", CFSTR("sourceID")))
    v38 = objc_msgSend(v37, "decodeIntegerForKey:", CFSTR("sourceID"));

  -[SFPowerSource setSourceID:](self, "setSourceID:", v38);
  v39 = v37;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  -[SFPowerSource setState:](self, "setState:", 0);
  v40 = v39;
  v41 = 0;
  if (objc_msgSend(v40, "containsValueForKey:", CFSTR("temperature")))
    v41 = objc_msgSend(v40, "decodeIntegerForKey:", CFSTR("temperature"));

  -[SFPowerSource setTemperature:](self, "setTemperature:", v41);
  v42 = v40;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  -[SFPowerSource setTransportType:](self, "setTransportType:", 0);
  v43 = v42;
  objc_opt_class();
  NSDecodeObjectIfPresent();

  -[SFPowerSource setType:](self, "setType:", 0);
  v44 = v43;
  v45 = 0;
  if (objc_msgSend(v44, "containsValueForKey:", CFSTR("vendorID")))
    v45 = objc_msgSend(v44, "decodeIntegerForKey:", CFSTR("vendorID"));

  -[SFPowerSource setVendorID:](self, "setVendorID:", v45);
  ioKitDescription = self->_ioKitDescription;
  self->_ioKitDescription = 0;

  v47 = v44;
  objc_opt_class();
  NSDecodeStandardContainerIfPresent();

  self->_present = 0;
  v48 = v47;
  if (objc_msgSend(v48, "containsValueForKey:", CFSTR("present")))
    self->_present = objc_msgSend(v48, "decodeBoolForKey:", CFSTR("present"));

  -[SFPowerSource startLowPowerMonitoringIfAppropriate](self, "startLowPowerMonitoringIfAppropriate");
}

- (void)encodeWithCoder:(id)a3
{
  NSString *accessoryCategory;
  NSString *accessoryID;
  int64_t adapterErrorFlags;
  int64_t adapterFamilyCode;
  NSString *adapterName;
  int64_t adapterSourceID;
  NSData *batteryCaseAddress;
  int64_t color;
  int64_t familyCode;
  NSString *groupID;
  void *v14;
  NSString *name;
  NSString *partID;
  NSString *partName;
  uint64_t powerState;
  int64_t productID;
  uint64_t role;
  int64_t sourceID;
  NSString *state;
  int64_t temperature;
  NSString *transportType;
  NSString *type;
  int64_t vendorID;
  NSDictionary *ioKitDescription;
  id v28;

  v28 = a3;
  accessoryCategory = self->_accessoryCategory;
  if (accessoryCategory)
    objc_msgSend(v28, "encodeObject:forKey:", accessoryCategory, CFSTR("accessoryCategory"));
  accessoryID = self->_accessoryID;
  if (accessoryID)
    objc_msgSend(v28, "encodeObject:forKey:", accessoryID, CFSTR("accessoryID"));
  adapterErrorFlags = self->_adapterErrorFlags;
  if (adapterErrorFlags)
    objc_msgSend(v28, "encodeInteger:forKey:", adapterErrorFlags, CFSTR("adapterErrorFlag"));
  adapterFamilyCode = self->_adapterFamilyCode;
  if (adapterFamilyCode)
    objc_msgSend(v28, "encodeInteger:forKey:", adapterFamilyCode, CFSTR("adapterFamilyCode"));
  adapterName = self->_adapterName;
  if (adapterName)
    objc_msgSend(v28, "encodeObject:forKey:", adapterName, CFSTR("adapterName"));
  if (self->_adapterSharedSource)
    objc_msgSend(v28, "encodeBool:forKey:", 1, CFSTR("adapterSharedSource"));
  adapterSourceID = self->_adapterSourceID;
  if (adapterSourceID)
    objc_msgSend(v28, "encodeInteger:forKey:", adapterSourceID, CFSTR("adapterSourceID"));
  batteryCaseAddress = self->_batteryCaseAddress;
  if (batteryCaseAddress)
    objc_msgSend(v28, "encodeObject:forKey:", batteryCaseAddress, CFSTR("batteryCaseAddress"));
  if (self->_charging)
    objc_msgSend(v28, "encodeBool:forKey:", 1, CFSTR("charging"));
  if (self->_chargeLevel > 0.0)
    objc_msgSend(v28, "encodeDouble:forKey:", CFSTR("chargeLevel"));
  color = self->_color;
  if (color != -1)
    objc_msgSend(v28, "encodeInteger:forKey:", color, CFSTR("color"));
  familyCode = self->_familyCode;
  if (familyCode)
    objc_msgSend(v28, "encodeInteger:forKey:", familyCode, CFSTR("familyCode"));
  groupID = self->_groupID;
  if (groupID)
    objc_msgSend(v28, "encodeObject:forKey:", groupID, CFSTR("groupID"));
  if (-[NSArray count](self->_LEDs, "count"))
    objc_msgSend(v28, "encodeObject:forKey:", self->_LEDs, CFSTR("LEDs"));
  if (self->_lowPowerModeEnabled)
    objc_msgSend(v28, "encodeBool:forKey:", 1, CFSTR("lowPowerMode"));
  v14 = v28;
  if (self->_lowWarnLevel > 0.0)
  {
    objc_msgSend(v28, "encodeDouble:forKey:", CFSTR("lowWarnLevel"));
    v14 = v28;
  }
  if (self->_maxCapacity > 0.0)
  {
    objc_msgSend(v28, "encodeDouble:forKey:", CFSTR("maxCapacity"));
    v14 = v28;
  }
  name = self->_name;
  if (name)
  {
    objc_msgSend(v28, "encodeObject:forKey:", name, CFSTR("name"));
    v14 = v28;
  }
  partID = self->_partID;
  if (partID)
  {
    objc_msgSend(v28, "encodeObject:forKey:", partID, CFSTR("partID"));
    v14 = v28;
  }
  partName = self->_partName;
  if (partName)
  {
    objc_msgSend(v28, "encodeObject:forKey:", partName, CFSTR("partName"));
    v14 = v28;
  }
  powerState = self->_powerState;
  if ((_DWORD)powerState)
  {
    objc_msgSend(v28, "encodeInteger:forKey:", powerState, CFSTR("powerState"));
    v14 = v28;
  }
  productID = self->_productID;
  if (productID)
  {
    objc_msgSend(v28, "encodeInteger:forKey:", productID, CFSTR("productID"));
    v14 = v28;
  }
  role = self->_role;
  if ((_DWORD)role)
  {
    objc_msgSend(v28, "encodeInteger:forKey:", role, CFSTR("role"));
    v14 = v28;
  }
  sourceID = self->_sourceID;
  if (sourceID)
  {
    objc_msgSend(v28, "encodeInteger:forKey:", sourceID, CFSTR("sourceID"));
    v14 = v28;
  }
  state = self->_state;
  if (state)
  {
    objc_msgSend(v28, "encodeObject:forKey:", state, CFSTR("state"));
    v14 = v28;
  }
  temperature = self->_temperature;
  if (temperature)
  {
    objc_msgSend(v28, "encodeInteger:forKey:", temperature, CFSTR("temperature"));
    v14 = v28;
  }
  transportType = self->_transportType;
  if (transportType)
  {
    objc_msgSend(v28, "encodeObject:forKey:", transportType, CFSTR("transportType"));
    v14 = v28;
  }
  type = self->_type;
  if (type)
  {
    objc_msgSend(v28, "encodeObject:forKey:", type, CFSTR("type"));
    v14 = v28;
  }
  vendorID = self->_vendorID;
  if (vendorID)
  {
    objc_msgSend(v28, "encodeInteger:forKey:", vendorID, CFSTR("vendorID"));
    v14 = v28;
  }
  ioKitDescription = self->_ioKitDescription;
  if (ioKitDescription)
  {
    objc_msgSend(v28, "encodeObject:forKey:", ioKitDescription, CFSTR("ioKitDictionary"));
    v14 = v28;
  }
  if (self->_present)
  {
    objc_msgSend(v28, "encodeBool:forKey:", 1, CFSTR("present"));
    v14 = v28;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[SFPowerSource invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SFPowerSource;
  -[SFPowerSource dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int64_t sourceID;
  NSString *accessoryID;
  void *v7;
  NSString *p_isa;
  NSData *v9;
  NSData *v10;
  int v11;
  char v12;
  NSData *batteryCaseAddress;
  void *v14;
  NSData *v15;
  NSData *v16;
  int v17;
  NSString *groupID;
  void *v19;
  NSString *v20;
  NSData *v21;
  int v22;
  NSString *accessoryCategory;
  void *v24;
  NSString *v25;
  NSString *v26;
  int v27;
  NSString *partID;
  void *v29;
  NSString *v30;
  NSString *v31;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    sourceID = self->_sourceID;
    if (sourceID == objc_msgSend(v4, "sourceID"))
    {
      accessoryID = self->_accessoryID;
      objc_msgSend(v4, "accessoryID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      p_isa = accessoryID;
      v9 = v7;
      v10 = v9;
      if (p_isa == (NSString *)v9)
      {

      }
      else
      {
        if ((p_isa == 0) == (v9 != 0))
        {
          v12 = 0;
          v15 = v9;
LABEL_37:

          goto LABEL_38;
        }
        v11 = -[NSString isEqual:](p_isa, "isEqual:", v9);

        if (!v11)
        {
          v12 = 0;
LABEL_39:

          goto LABEL_40;
        }
      }
      batteryCaseAddress = self->_batteryCaseAddress;
      objc_msgSend(v4, "batteryCaseAddress");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = batteryCaseAddress;
      v16 = v14;
      p_isa = (NSString *)&v16->super.isa;
      if (v15 == v16)
      {

      }
      else
      {
        if ((v15 == 0) == (v16 != 0))
        {
          v12 = 0;
          v20 = (NSString *)&v16->super.isa;
LABEL_36:

          goto LABEL_37;
        }
        v17 = -[NSData isEqual:](v15, "isEqual:", v16);

        if (!v17)
        {
          v12 = 0;
LABEL_38:

          goto LABEL_39;
        }
      }
      groupID = self->_groupID;
      objc_msgSend(v4, "groupID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = groupID;
      v21 = v19;
      v15 = v21;
      if (v20 == (NSString *)v21)
      {

      }
      else
      {
        if ((v20 == 0) == (v21 != 0))
        {
          v12 = 0;
          v25 = (NSString *)&v21->super.isa;
LABEL_35:

          goto LABEL_36;
        }
        v22 = -[NSString isEqual:](v20, "isEqual:", v21);

        if (!v22)
        {
          v12 = 0;
          goto LABEL_37;
        }
      }
      accessoryCategory = self->_accessoryCategory;
      objc_msgSend(v4, "accessoryCategory");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = accessoryCategory;
      v26 = v24;
      v20 = v26;
      if (v25 == v26)
      {

      }
      else
      {
        if ((v25 == 0) == (v26 != 0))
        {
          v12 = 0;
          v30 = v26;
LABEL_34:

          goto LABEL_35;
        }
        v27 = -[NSString isEqual:](v25, "isEqual:", v26);

        if (!v27)
        {
          v12 = 0;
          goto LABEL_36;
        }
      }
      partID = self->_partID;
      objc_msgSend(v4, "partID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = partID;
      v31 = v29;
      v25 = v31;
      if (v30 == v31)
      {
        v12 = 1;
      }
      else if ((v30 == 0) == (v31 != 0))
      {
        v12 = 0;
      }
      else
      {
        v12 = -[NSString isEqual:](v30, "isEqual:", v31);
      }

      goto LABEL_34;
    }
  }
  v12 = 0;
LABEL_40:

  return v12;
}

- (unint64_t)hash
{
  int64_t sourceID;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;

  sourceID = self->_sourceID;
  v4 = -[NSString hash](self->_accessoryID, "hash") ^ sourceID;
  v5 = -[NSData hash](self->_batteryCaseAddress, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_groupID, "hash");
  v7 = -[NSString hash](self->_accessoryCategory, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_partID, "hash");
}

- (id)detailedDescription
{
  NSPrintF();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)publish
{
  SFPowerSource *v2;
  NSString *accessoryCategory;
  NSString *accessoryID;
  NSData *batteryCaseAddress;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *groupID;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  unsigned int v17;
  const char *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  const char *v22;
  void *v23;
  void *v24;
  void *v25;
  double lowWarnLevel;
  void *v27;
  void *v28;
  NSString *name;
  NSString *partID;
  NSString *partName;
  void *v32;
  NSString *state;
  void *v34;
  NSString *transportType;
  NSString *type;
  void *v37;
  __CFString *v38;
  __CFString *v39;
  int v40;
  id v41;
  void *v42;
  void *v43;
  NSString *adapterName;
  void *v45;
  void *v46;
  NSDictionary *v47;
  NSDictionary *ioKitDescription;
  id *p_ioKitDescription;
  NSDictionary *v50;
  NSDictionary *v51;
  NSDictionary *v52;
  char v53;
  int v54;
  NSDictionary *v56;
  SFPowerSource *v57;
  NSArray *obj;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[2];
  _QWORD v64[2];
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v57 = v2;
  if (v2->_psID || (v54 = IOPSCreatePowerSource()) == 0)
  {
    v56 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    accessoryCategory = v2->_accessoryCategory;
    if (accessoryCategory)
      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", accessoryCategory, CFSTR("Accessory Category"));
    accessoryID = v2->_accessoryID;
    if (accessoryID)
      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", accessoryID, CFSTR("Accessory Identifier"));
    batteryCaseAddress = v2->_batteryCaseAddress;
    if (batteryCaseAddress)
      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", batteryCaseAddress, CFSTR("Address"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2->_charging, &v2->_psID);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v6, CFSTR("Is Charging"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", fabs(v2->_chargeLevel + -1.0) < 0.00000011920929);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v7, CFSTR("Is Charged"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(v2->_chargeLevel * 100.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v8, CFSTR("Current Capacity"));

    if (v2->_color != -1)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v9, CFSTR("Device Color"));

    }
    groupID = v2->_groupID;
    if (groupID)
      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", groupID, CFSTR("Group Identifier"));
    if (-[NSArray count](v2->_LEDs, "count"))
    {
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = v2->_LEDs;
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v60;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v60 != v13)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
            v16 = (void *)MEMORY[0x1E0CB3940];
            v17 = objc_msgSend(v15, "LEDState");
            v18 = "?";
            if (v17 <= 2)
              v18 = off_1E4830DD8[v17];
            objc_msgSend(v16, "stringWithUTF8String:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)MEMORY[0x1E0CB3940];
            v21 = objc_msgSend(v15, "LEDColor");
            v22 = "?";
            if (v21 <= 4)
              v22 = off_1E4830DF0[v21];
            objc_msgSend(v20, "stringWithUTF8String:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v63[0] = CFSTR("State");
            v63[1] = CFSTR("Color");
            v64[0] = v19;
            v64[1] = v23;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v24);

          }
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
        }
        while (v12);
      }

      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v11, CFSTR("LEDs"));
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2->_lowPowerModeEnabled);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v25, CFSTR("LPM Active"));

    lowWarnLevel = v2->_lowWarnLevel;
    if (lowWarnLevel > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)(lowWarnLevel * 100.0));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v27, CFSTR("Low Warn Level"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2->_maxCapacity);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v28, CFSTR("Max Capacity"));

    name = v2->_name;
    if (name)
      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", name, CFSTR("Name"));
    partID = v2->_partID;
    if (partID)
      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", partID, CFSTR("Part Identifier"));
    partName = v2->_partName;
    if (partName)
      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", partName, CFSTR("Part Name"));
    if (v2->_productID)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v32, CFSTR("Product ID"));

    }
    state = v2->_state;
    if (state)
      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", state, CFSTR("Power Source State"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v2->_temperature);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v34, CFSTR("Temperature"));

    transportType = v2->_transportType;
    if (transportType)
      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", transportType, CFSTR("Transport Type"));
    type = v2->_type;
    if (type)
      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", type, CFSTR("Type"));
    if (v2->_vendorID)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v37, CFSTR("Vendor ID"));

    }
    v38 = v2->_type;
    if (v38 == CFSTR("Accessory Source")
      || (v39 = v38) != 0
      && (v40 = -[__CFString isEqual:](v38, "isEqual:", CFSTR("Accessory Source")), v39, v40))
    {
      v41 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      if (v2->_adapterErrorFlags)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v42, CFSTR("ErrorFlags"));

      }
      if (v2->_adapterFamilyCode)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v43, CFSTR("FamilyCode"));

      }
      adapterName = v2->_adapterName;
      if (adapterName)
        objc_msgSend(v41, "setObject:forKeyedSubscript:", adapterName, CFSTR("Name"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2->_adapterSharedSource);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setObject:forKeyedSubscript:", v45, CFSTR("SharedSource"));

      if (v2->_adapterSourceID)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "setObject:forKeyedSubscript:", v46, CFSTR("Source"));

      }
      -[NSDictionary setObject:forKeyedSubscript:](v56, "setObject:forKeyedSubscript:", v41, CFSTR("AdapterDetails"));

    }
    v47 = v56;
    if (!v56)
      goto LABEL_65;
    p_ioKitDescription = (id *)&v2->_ioKitDescription;
    ioKitDescription = v2->_ioKitDescription;
    v50 = v56;
    v51 = ioKitDescription;
    if (v50 == v51)
    {

      v47 = v56;
    }
    else
    {
      v52 = v51;
      if (v51)
      {
        v53 = -[NSDictionary isEqual:](v50, "isEqual:", v51);

        v47 = v56;
        if ((v53 & 1) != 0)
          goto LABEL_65;
      }
      else
      {

        v47 = v56;
      }
      objc_storeStrong(p_ioKitDescription, v47);
      v54 = IOPSSetPowerSourceDetails();
      v47 = v56;
      if (v54)
        goto LABEL_66;
    }
LABEL_65:
    v54 = 0;
    v50 = v47;
    goto LABEL_66;
  }
  v50 = 0;
LABEL_66:

  objc_sync_exit(v57);
  return v54;
}

- (void)invalidate
{
  SFPowerSource *v2;
  int lowPowerMonitoringToken;
  SFPowerSource *obj;

  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  lowPowerMonitoringToken = obj->_lowPowerMonitoringToken;
  if (lowPowerMonitoringToken != -1)
  {
    notify_cancel(lowPowerMonitoringToken);
    v2 = obj;
    obj->_lowPowerMonitoringToken = -1;
  }
  if (v2->_psID)
  {
    IOPSReleasePowerSource();
    v2 = obj;
    obj->_psID = 0;
  }
  objc_sync_exit(v2);

}

- (NSArray)LEDs
{
  if (self->_LEDs)
    return self->_LEDs;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

uint64_t __53__SFPowerSource_startLowPowerMonitoringIfAppropriate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "lowPowerModeChanged:", a2);
}

- (void)lowPowerModeChanged:(int)a3
{
  uint64_t v4;
  _BOOL4 v5;
  uint64_t state64;

  state64 = 0;
  if (!notify_get_state(a3, &state64))
  {
    v4 = state64;
    v5 = state64 != 0;
    if (v5 != -[SFPowerSource isLowPowerModeEnabled](self, "isLowPowerModeEnabled"))
    {
      -[SFPowerSource willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("lowPowerModeEnabled"));
      self->_lowPowerModeEnabled = v4 != 0;
      -[SFPowerSource didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("lowPowerModeEnabled"));
    }
  }
}

- (void)updateWithPowerSource:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0CB36F8];
  v5 = a3;
  v9 = (id)objc_msgSend([v4 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "encodeWithCoder:", v9);

  v6 = objc_alloc(MEMORY[0x1E0CB3710]);
  objc_msgSend(v9, "encodedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initForReadingFromData:error:", v7, 0);

  -[SFPowerSource _updateWithCoder:](self, "_updateWithCoder:", v8);
  objc_msgSend(v8, "finishDecoding");

}

- (void)setAccessoryCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)accessoryID
{
  return self->_accessoryID;
}

- (void)setAccessoryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSData)batteryCaseAddress
{
  return self->_batteryCaseAddress;
}

- (void)setBatteryCaseAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setCharging:(BOOL)a3
{
  self->_charging = a3;
}

- (double)chargeLevel
{
  return self->_chargeLevel;
}

- (void)setChargeLevel:(double)a3
{
  self->_chargeLevel = a3;
}

- (int64_t)color
{
  return self->_color;
}

- (void)setColor:(int64_t)a3
{
  self->_color = a3;
}

- (int64_t)familyCode
{
  return self->_familyCode;
}

- (void)setFamilyCode:(int64_t)a3
{
  self->_familyCode = a3;
}

- (void)setGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void)setLEDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (BOOL)isLowPowerModeEnabled
{
  return self->_lowPowerModeEnabled;
}

- (void)setLowPowerModeEnabled:(BOOL)a3
{
  self->_lowPowerModeEnabled = a3;
}

- (double)lowWarnLevel
{
  return self->_lowWarnLevel;
}

- (void)setLowWarnLevel:(double)a3
{
  self->_lowWarnLevel = a3;
}

- (double)maxCapacity
{
  return self->_maxCapacity;
}

- (void)setMaxCapacity:(double)a3
{
  self->_maxCapacity = a3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)partID
{
  return self->_partID;
}

- (void)setPartID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)partName
{
  return self->_partName;
}

- (void)setPartName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (int)powerState
{
  return self->_powerState;
}

- (void)setPowerState:(int)a3
{
  self->_powerState = a3;
}

- (int64_t)productID
{
  return self->_productID;
}

- (void)setProductID:(int64_t)a3
{
  self->_productID = a3;
}

- (int)role
{
  return self->_role;
}

- (void)setRole:(int)a3
{
  self->_role = a3;
}

- (BOOL)showChargingUI
{
  return self->_showChargingUI;
}

- (void)setShowChargingUI:(BOOL)a3
{
  self->_showChargingUI = a3;
}

- (int64_t)sourceID
{
  return self->_sourceID;
}

- (void)setSourceID:(int64_t)a3
{
  self->_sourceID = a3;
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (int64_t)temperature
{
  return self->_temperature;
}

- (void)setTemperature:(int64_t)a3
{
  self->_temperature = a3;
}

- (NSString)transportType
{
  return self->_transportType;
}

- (void)setTransportType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (int64_t)vendorID
{
  return self->_vendorID;
}

- (void)setVendorID:(int64_t)a3
{
  self->_vendorID = a3;
}

- (int64_t)adapterErrorFlags
{
  return self->_adapterErrorFlags;
}

- (void)setAdapterErrorFlags:(int64_t)a3
{
  self->_adapterErrorFlags = a3;
}

- (void)setAdapterFamilyCode:(int64_t)a3
{
  self->_adapterFamilyCode = a3;
}

- (NSString)adapterName
{
  return self->_adapterName;
}

- (void)setAdapterName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (BOOL)adapterSharedSource
{
  return self->_adapterSharedSource;
}

- (void)setAdapterSharedSource:(BOOL)a3
{
  self->_adapterSharedSource = a3;
}

- (void)setAdapterSourceID:(int64_t)a3
{
  self->_adapterSourceID = a3;
}

- (NSDictionary)ioKitAdapterDescription
{
  return self->_ioKitAdapterDescription;
}

- (void)setIoKitAdapterDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (NSDictionary)ioKitDescription
{
  return self->_ioKitDescription;
}

- (void)setIoKitDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioKitDescription, 0);
  objc_storeStrong((id *)&self->_ioKitAdapterDescription, 0);
  objc_storeStrong((id *)&self->_adapterName, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_transportType, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_partName, 0);
  objc_storeStrong((id *)&self->_partID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_LEDs, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_batteryCaseAddress, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
}

@end
