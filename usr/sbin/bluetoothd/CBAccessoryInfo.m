@implementation CBAccessoryInfo

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;

  v3 = objc_opt_class(self);
  v4 = objc_claimAutoreleasedReturnValue(-[CBDevice identifier](self->_cbDevice, "identifier"));
  v5 = (void *)v4;
  v6 = "yes";
  if (self->_powerSourceIDLeft)
    v7 = "yes";
  else
    v7 = "no";
  if (self->_powerSourceIDRight)
    v8 = "yes";
  else
    v8 = "no";
  if (!self->_powerSourceIDCase)
    v6 = "no";
  v9 = NSPrintF_safe("%@: ID %@, PowerSources Left %s, Right %s, Case %s", v3, v4, v7, v8, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  return v10;
}

- (void)invalidate
{
  -[CBAccessoryInfo powerSourceRemove](self, "powerSourceRemove");
}

- (void)powerSourceUpdate
{
  uint64_t v3;
  OpaqueIOPSPowerSourceID *powerSourceIDLeft;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *powerSourceDetailsLeft;
  uint64_t v10;
  OpaqueIOPSPowerSourceID *powerSourceIDRight;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableDictionary *powerSourceDetailsRight;

  if (-[CBDevice proximityPairingProductID](self->_cbDevice, "proximityPairingProductID")
    && (-[CBDevice accessoryStatusFlags](self->_cbDevice, "accessoryStatusFlags") & 1) != 0)
  {
    if (-[CBDevice batteryStateMain](self->_cbDevice, "batteryStateMain"))
      return;
    -[CBAccessoryInfo _powerSourceUpdateWithPartID:](self, "_powerSourceUpdateWithPartID:", "Left");
    -[CBAccessoryInfo _powerSourceUpdateWithPartID:](self, "_powerSourceUpdateWithPartID:", "Right");
  }
  else
  {
    powerSourceIDLeft = self->_powerSourceIDLeft;
    if (powerSourceIDLeft)
    {
      v5 = IOPSReleasePowerSource(powerSourceIDLeft, v3);
      if (dword_100977910 < 31)
      {
        v6 = v5;
        if (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30))
        {
          v7 = CUPrintErrorCode(v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
          LogPrintF_safe(&dword_100977910, "-[CBAccessoryInfo powerSourceUpdate]", 30, "Accessory power source remove: lid open, left, %@, %@", self, v8);

        }
      }
      self->_powerSourceIDLeft = 0;
    }
    powerSourceDetailsLeft = self->_powerSourceDetailsLeft;
    self->_powerSourceDetailsLeft = 0;

    powerSourceIDRight = self->_powerSourceIDRight;
    if (powerSourceIDRight)
    {
      v12 = IOPSReleasePowerSource(powerSourceIDRight, v10);
      if (dword_100977910 < 31)
      {
        v13 = v12;
        if (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30))
        {
          v14 = CUPrintErrorCode(v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          LogPrintF_safe(&dword_100977910, "-[CBAccessoryInfo powerSourceUpdate]", 30, "Accessory power source remove: lid open, right, %@, %@", self, v15);

        }
      }
      self->_powerSourceIDRight = 0;
    }
    powerSourceDetailsRight = self->_powerSourceDetailsRight;
    self->_powerSourceDetailsRight = 0;

  }
  -[CBAccessoryInfo _powerSourceUpdateWithPartID:](self, "_powerSourceUpdateWithPartID:", "Case");
}

- (void)_powerSourceUpdateWithPartID:(const char *)a3
{
  CBDevice *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  BOOL v13;
  float v15;
  float v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  const char *v22;
  id *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  float v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  void *v49;
  unsigned __int8 v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  unsigned __int8 v56;
  __CFString *v57;
  __CFString *v58;
  void *v59;
  __CFString *v60;
  __CFString *v61;
  __CFString *v62;
  unsigned __int8 v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  unsigned __int8 v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  CBAccessoryInfo *v77;
  unsigned __int8 v78;
  double v79;
  void *v80;
  void *v81;
  id v82;
  id v83;
  void *v84;
  unsigned __int8 v85;
  objc_class *v86;
  int v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  void *v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  _BOOL4 v102;
  CBAccessoryInfo *v103;
  objc_class *v104;

  v5 = self->_cbDevice;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice identifier](v5, "identifier"));
  if (v6)
  {
    v7 = -[CBDevice proximityPairingProductID](v5, "proximityPairingProductID");
    v8 = -[CBDevice proximityPairingProductID](v5, "proximityPairingProductID");
    v103 = self;
    if (v8 == 8213)
      v9 = 8212;
    else
      v9 = v7;
    v10 = -[CBDevice proximityPairingProductID](v5, "proximityPairingProductID");
    if (v10 == 8216)
      v9 = 8228;
    v11 = -[CBDevice proximityPairingProductID](v5, "proximityPairingProductID");
    v12 = v11 == 8220 ? 8219 : v9;
    v13 = v11 == 8220 || v10 == 8216;
    if (v13 || v8 == 8213)
    {
      if (!strcmp(a3, "Left"))
      {
        -[CBDevice batteryLevelLeft](v5, "batteryLevelLeft");
        v16 = v15;
        v18 = -[CBDevice batteryStateLeft](v5, "batteryStateLeft");
        v19 = 24;
        v20 = 16;
      }
      else
      {
        if (strcmp(a3, "Right"))
        {
          if (strcmp(a3, "Case"))
          {
            if (dword_100977910 <= 90
              && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 90)))
            {
              LogPrintF_safe(&dword_100977910, "-[CBAccessoryInfo _powerSourceUpdateWithPartID:]", 90, "### Accessory power source update failed: bad part ID '%s', %@", a3, self);
            }
            goto LABEL_155;
          }
          -[CBDevice batteryLevelCase](v5, "batteryLevelCase");
          v16 = v44;
          v18 = -[CBDevice batteryStateCase](v5, "batteryStateCase");
          v19 = 56;
          v20 = 48;
          v22 = "Audio Battery Case";
LABEL_27:
          v23 = (id *)((char *)&self->super.isa + v20);
          if (!v18)
          {
            v35 = *(uint64_t *)((char *)&self->super.isa + v19);
            if (v35)
            {
              v36 = IOPSReleasePowerSource(v35, v17);
              if (dword_100977910 <= 30)
              {
                v37 = v36;
                if (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30))
                {
                  v38 = CUPrintErrorCode(v37);
                  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
                  LogPrintF_safe(&dword_100977910, "-[CBAccessoryInfo _powerSourceUpdateWithPartID:]", 30, "Accessory power source remove: state unknown, %s, %@, %@", a3, self, v39);

                }
              }
              *(Class *)((char *)&self->super.isa + v19) = 0;
            }
            v45 = *v23;
            *v23 = 0;

            goto LABEL_155;
          }
          v100 = v19;
          v24 = *v23;
          v102 = v24 == 0;
          if (!v24)
          {
            v24 = objc_alloc_init((Class)NSMutableDictionary);
            objc_storeStrong(v23, v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v22));
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("Accessory Category"));

            objc_msgSend(v24, "setObject:forKeyedSubscript:", v6, CFSTR("Accessory Identifier"));
            objc_msgSend(v24, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("Is Present"));
            objc_msgSend(v24, "setObject:forKeyedSubscript:", &off_100960310, CFSTR("Max Capacity"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v26, CFSTR("Part Identifier"));

            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v12));
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v27, CFSTR("Product ID"));

            objc_msgSend(v24, "setObject:forKeyedSubscript:", CFSTR("Bluetooth LE"), CFSTR("Transport Type"));
            objc_msgSend(v24, "setObject:forKeyedSubscript:", CFSTR("Accessory Source"), CFSTR("Type"));
            objc_msgSend(v24, "setObject:forKeyedSubscript:", &off_100960328, CFSTR("Vendor ID"));
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", -[CBDevice vendorIDSource](v5, "vendorIDSource")));
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, CFSTR("Vendor ID Source"));

            v29 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice btAddressData](v5, "btAddressData"));
            v30 = CUPrintNSDataAddress(v29);
            v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
            objc_msgSend(v24, "setObject:forKeyedSubscript:", v31, CFSTR("Group Identifier"));

          }
          v32 = strcmp(a3, "Case");
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Name")));
          if (v32)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(-[CBDevice name](self->_primaryCBDevice, "name"));
            goto LABEL_82;
          }
          v40 = -[CBDevice proximityPairingProductID](v5, "proximityPairingProductID");
          if ((int)v40 > 612)
          {
            if ((int)v40 > 776)
            {
              if ((int)v40 <= 8212)
              {
                switch((int)v40)
                {
                  case 777:
                    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth")));
                    v42 = v41;
                    v43 = CFSTR("apple_wireless_mouse");
                    goto LABEL_80;
                  case 780:
                    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth")));
                    v42 = v41;
                    v43 = CFSTR("apple_mighty_mouse");
                    goto LABEL_80;
                  case 781:
LABEL_156:
                    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth")));
                    v42 = v41;
                    v43 = CFSTR("apple_magic_mouse");
                    goto LABEL_80;
                  case 782:
LABEL_157:
                    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth")));
                    v42 = v41;
                    v43 = CFSTR("apple_magic_trackpad");
                    goto LABEL_80;
                  default:
                    goto LABEL_162;
                }
              }
              if ((_DWORD)v40 == 8220 || (_DWORD)v40 == 8216 || (_DWORD)v40 == 8213)
              {
                v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth")));
                v42 = v41;
                v43 = CFSTR("apple_airpods_case");
                goto LABEL_80;
              }
            }
            else
            {
              if ((int)v40 <= 665)
              {
                switch((int)v40)
                {
                  case 613:
                    goto LABEL_157;
                  case 615:
                    goto LABEL_158;
                  case 617:
                    goto LABEL_156;
                  case 620:
                    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth")));
                    v42 = v41;
                    v43 = CFSTR("apple_magic_keyboard_keypad");
                    goto LABEL_80;
                  default:
                    goto LABEL_162;
                }
              }
              switch((_DWORD)v40)
              {
                case 0x29A:
                  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth")));
                  v42 = v41;
                  v43 = CFSTR("apple_magic_keyboard_touch");
                  goto LABEL_80;
                case 0x29C:
LABEL_158:
                  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth")));
                  v42 = v41;
                  v43 = CFSTR("apple_magic_keyboard");
                  goto LABEL_80;
                case 0x29F:
                  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth")));
                  v42 = v41;
                  v43 = CFSTR("apple_magic_keyboard_touch_keypad");
LABEL_80:
                  v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", v43, &stru_100941758, CFSTR("CBLocalizable")));
LABEL_81:
                  v34 = (void *)v46;

                  goto LABEL_82;
              }
            }
LABEL_162:
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[CBProductInfo productInfoWithProductID:](CBProductInfo, "productInfoWithProductID:", v40));
            v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "productName"));
            goto LABEL_81;
          }
          if ((int)v40 <= 557)
          {
            if ((int)v40 > 521)
            {
              if ((_DWORD)v40 != 522 && (_DWORD)v40 != 556 && (_DWORD)v40 != 557)
                goto LABEL_162;
            }
            else
            {
              if (!(_DWORD)v40)
              {
                v34 = 0;
LABEL_82:
                v101 = v6;
                if (v34)
                {
                  v47 = v33;
                  v48 = v34;
                  if (v47 == v48)
                  {

                  }
                  else
                  {
                    v49 = v48;
                    if (v47)
                    {
                      v50 = objc_msgSend(v47, "isEqual:", v48);

                      if ((v50 & 1) != 0)
                        goto LABEL_90;
                    }
                    else
                    {

                    }
                    objc_msgSend(v24, "setObject:forKeyedSubscript:", v49, CFSTR("Name"));
                    v102 = 1;
                  }
                }
LABEL_90:
                if (dword_100977910 <= 30
                  && (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30)))
                {
                  LogPrintF_safe(&dword_100977910, "-[CBAccessoryInfo _powerSourceUpdateWithPartID:]", 30, "Accessory power source create with battery level: %d", (int)(float)(v16 * 100.0));
                }
                v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", (int)(float)(v16 * 100.0)));
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Current Capacity")));
                v53 = v51;
                v54 = v52;
                v98 = v34;
                v99 = v33;
                if (v53 == v54)
                {

                  goto LABEL_101;
                }
                v55 = v54;
                if ((v53 == 0) != (v54 != 0))
                {
                  v56 = objc_msgSend(v53, "isEqual:", v54);

                  if ((v56 & 1) != 0)
                  {
LABEL_101:
                    v57 = CFSTR("Battery Power");
                    if (v18 == 1)
                      v57 = CFSTR("AC Power");
                    v58 = v57;
                    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Power Source State")));
                    v60 = v58;
                    v61 = v59;
                    if (v60 == v61)
                    {

                      goto LABEL_110;
                    }
                    v62 = v61;
                    if (v61)
                    {
                      v63 = -[__CFString isEqual:](v60, "isEqual:", v61);

                      if ((v63 & 1) != 0)
                      {
LABEL_110:
                        if (v18 == 1)
                          v64 = &__kCFBooleanTrue;
                        else
                          v64 = &__kCFBooleanFalse;
                        v65 = v64;
                        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Is Charging")));
                        v67 = v65;
                        v68 = v66;
                        if (v67 == v68)
                        {

                          goto LABEL_120;
                        }
                        v69 = v68;
                        if (v68)
                        {
                          v70 = objc_msgSend(v67, "isEqual:", v68);

                          if ((v70 & 1) != 0)
                          {
LABEL_120:
                            if ((int)(float)(v16 * 100.0) >= 10)
                              v71 = &__kCFBooleanFalse;
                            else
                              v71 = &__kCFBooleanTrue;
                            v72 = v71;
                            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Low Warn Level")));
                            v74 = v72;
                            v75 = v73;
                            if (v74 == v75)
                            {

                              v77 = v103;
                              goto LABEL_130;
                            }
                            v76 = v75;
                            v77 = v103;
                            if (v75)
                            {
                              v78 = objc_msgSend(v74, "isEqual:", v75);

                              if ((v78 & 1) != 0)
                              {
LABEL_130:
                                -[CBDevice accessoryStatusOBCTime](v5, "accessoryStatusOBCTime");
                                if ((int)(v79 / 60.0) < 1)
                                {
LABEL_139:
                                  v86 = *(Class *)((char *)&v77->super.isa + v100);
                                  v104 = v86;
                                  v87 = v102;
                                  if (!v86)
                                  {
                                    v88 = IOPSCreatePowerSource(&v104);
                                    v86 = v104;
                                    *(Class *)((char *)&v77->super.isa + v100) = v104;
                                    if (dword_100977910 <= 30
                                      && (dword_100977910 != -1
                                       || (v92 = _LogCategory_Initialize(&dword_100977910, 30), v86 = v104, v92)))
                                    {
                                      if (v86)
                                        v89 = "yes";
                                      else
                                        v89 = "no";
                                      v90 = CUPrintErrorCode(v88);
                                      v91 = (void *)objc_claimAutoreleasedReturnValue(v90);
                                      v97 = v89;
                                      v77 = v103;
                                      LogPrintF_safe(&dword_100977910, "-[CBAccessoryInfo _powerSourceUpdateWithPartID:]", 30, "Accessory power source create: %@, power source ID: %s, error return: %@", v103, v97, v91);

                                      v87 = 1;
                                      v86 = v104;
                                    }
                                    else
                                    {
                                      v87 = 1;
                                    }
                                  }
                                  if (v86)
                                  {
                                    if (v87)
                                    {
                                      v93 = IOPSSetPowerSourceDetails();
                                      if (dword_100977910 <= 30)
                                      {
                                        v94 = v93;
                                        if (dword_100977910 != -1
                                          || _LogCategory_Initialize(&dword_100977910, 30))
                                        {
                                          v95 = CUPrintErrorCode(v94);
                                          v96 = (void *)objc_claimAutoreleasedReturnValue(v95);
                                          LogPrintF_safe(&dword_100977910, "-[CBAccessoryInfo _powerSourceUpdateWithPartID:]", 30, "Accessory power source update: %@, error: %@, publish power source %@ for device: %@", v77, v96, v24, v5);

                                        }
                                      }
                                    }
                                  }

                                  v6 = v101;
                                  goto LABEL_155;
                                }
                                v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
                                v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Time to Full Charge")));
                                v82 = v80;
                                v83 = v81;
                                if (v82 == v83)
                                {

                                }
                                else
                                {
                                  v84 = v83;
                                  if ((v82 == 0) != (v83 != 0))
                                  {
                                    v85 = objc_msgSend(v82, "isEqual:", v83);

                                    if ((v85 & 1) != 0)
                                      goto LABEL_138;
                                  }
                                  else
                                  {

                                  }
                                  objc_msgSend(v24, "setObject:forKeyedSubscript:", v82, CFSTR("Time to Full Charge"));
                                  v102 = 1;
                                }
LABEL_138:

                                goto LABEL_139;
                              }
                            }
                            else
                            {

                            }
                            objc_msgSend(v24, "setObject:forKeyedSubscript:", v74, CFSTR("Low Warn Level"));
                            v102 = 1;
                            goto LABEL_130;
                          }
                        }
                        else
                        {

                        }
                        objc_msgSend(v24, "setObject:forKeyedSubscript:", v67, CFSTR("Is Charging"));
                        v102 = 1;
                        goto LABEL_120;
                      }
                    }
                    else
                    {

                    }
                    objc_msgSend(v24, "setObject:forKeyedSubscript:", v60, CFSTR("Power Source State"));
                    v102 = 1;
                    goto LABEL_110;
                  }
                }
                else
                {

                }
                objc_msgSend(v24, "setObject:forKeyedSubscript:", v53, CFSTR("Current Capacity"));
                v102 = 1;
                goto LABEL_101;
              }
              if ((_DWORD)v40 != 520 && (_DWORD)v40 != 521)
                goto LABEL_162;
            }
          }
          else if ((int)v40 <= 570)
          {
            if ((_DWORD)v40 != 558 && (_DWORD)v40 != 569 && (_DWORD)v40 != 570)
              goto LABEL_162;
          }
          else if ((int)v40 > 597)
          {
            if ((_DWORD)v40 != 598 && (_DWORD)v40 != 599)
              goto LABEL_162;
          }
          else if ((_DWORD)v40 != 571 && (_DWORD)v40 != 597)
          {
            goto LABEL_162;
          }
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth")));
          v42 = v41;
          v43 = CFSTR("apple_wireless_keyboard");
          goto LABEL_80;
        }
        -[CBDevice batteryLevelRight](v5, "batteryLevelRight");
        v16 = v21;
        v18 = -[CBDevice batteryStateRight](v5, "batteryStateRight");
        v19 = 40;
        v20 = 32;
      }
      v22 = "Headset";
      goto LABEL_27;
    }
  }
LABEL_155:

}

- (void)powerSourceRemove
{
  OpaqueIOPSPowerSourceID *powerSourceIDLeft;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *powerSourceDetailsLeft;
  uint64_t v9;
  OpaqueIOPSPowerSourceID *powerSourceIDRight;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSMutableDictionary *powerSourceDetailsRight;
  uint64_t v16;
  OpaqueIOPSPowerSourceID *powerSourceIDCase;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  NSMutableDictionary *powerSourceDetailsCase;

  powerSourceIDLeft = self->_powerSourceIDLeft;
  if (powerSourceIDLeft)
  {
    v4 = IOPSReleasePowerSource(powerSourceIDLeft, a2);
    if (dword_100977910 < 31)
    {
      v5 = v4;
      if (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30))
      {
        v6 = CUPrintErrorCode(v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
        LogPrintF_safe(&dword_100977910, "-[CBAccessoryInfo powerSourceRemove]", 30, "Accessory power source remove: left, %@, %@", self, v7);

      }
    }
    self->_powerSourceIDLeft = 0;
  }
  powerSourceDetailsLeft = self->_powerSourceDetailsLeft;
  self->_powerSourceDetailsLeft = 0;

  powerSourceIDRight = self->_powerSourceIDRight;
  if (powerSourceIDRight)
  {
    v11 = IOPSReleasePowerSource(powerSourceIDRight, v9);
    if (dword_100977910 < 31)
    {
      v12 = v11;
      if (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30))
      {
        v13 = CUPrintErrorCode(v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        LogPrintF_safe(&dword_100977910, "-[CBAccessoryInfo powerSourceRemove]", 30, "Accessory power source remove: right, %@, %@", self, v14);

      }
    }
    self->_powerSourceIDRight = 0;
  }
  powerSourceDetailsRight = self->_powerSourceDetailsRight;
  self->_powerSourceDetailsRight = 0;

  powerSourceIDCase = self->_powerSourceIDCase;
  if (powerSourceIDCase)
  {
    v18 = IOPSReleasePowerSource(powerSourceIDCase, v16);
    if (dword_100977910 < 31)
    {
      v19 = v18;
      if (dword_100977910 != -1 || _LogCategory_Initialize(&dword_100977910, 30))
      {
        v20 = CUPrintErrorCode(v19);
        v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
        LogPrintF_safe(&dword_100977910, "-[CBAccessoryInfo powerSourceRemove]", 30, "Accessory power source remove: case, %@, %@", self, v21);

      }
    }
    self->_powerSourceIDCase = 0;
  }
  powerSourceDetailsCase = self->_powerSourceDetailsCase;
  self->_powerSourceDetailsCase = 0;

}

- (CBDevice)cbDevice
{
  return self->_cbDevice;
}

- (void)setCbDevice:(id)a3
{
  objc_storeStrong((id *)&self->_cbDevice, a3);
}

- (NSMutableDictionary)powerSourceDetailsLeft
{
  return self->_powerSourceDetailsLeft;
}

- (void)setPowerSourceDetailsLeft:(id)a3
{
  objc_storeStrong((id *)&self->_powerSourceDetailsLeft, a3);
}

- (OpaqueIOPSPowerSourceID)powerSourceIDLeft
{
  return self->_powerSourceIDLeft;
}

- (void)setPowerSourceIDLeft:(OpaqueIOPSPowerSourceID *)a3
{
  self->_powerSourceIDLeft = a3;
}

- (NSMutableDictionary)powerSourceDetailsRight
{
  return self->_powerSourceDetailsRight;
}

- (void)setPowerSourceDetailsRight:(id)a3
{
  objc_storeStrong((id *)&self->_powerSourceDetailsRight, a3);
}

- (OpaqueIOPSPowerSourceID)powerSourceIDRight
{
  return self->_powerSourceIDRight;
}

- (void)setPowerSourceIDRight:(OpaqueIOPSPowerSourceID *)a3
{
  self->_powerSourceIDRight = a3;
}

- (NSMutableDictionary)powerSourceDetailsCase
{
  return self->_powerSourceDetailsCase;
}

- (void)setPowerSourceDetailsCase:(id)a3
{
  objc_storeStrong((id *)&self->_powerSourceDetailsCase, a3);
}

- (OpaqueIOPSPowerSourceID)powerSourceIDCase
{
  return self->_powerSourceIDCase;
}

- (void)setPowerSourceIDCase:(OpaqueIOPSPowerSourceID *)a3
{
  self->_powerSourceIDCase = a3;
}

- (CBDevice)primaryCBDevice
{
  return self->_primaryCBDevice;
}

- (void)setPrimaryCBDevice:(id)a3
{
  objc_storeStrong((id *)&self->_primaryCBDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryCBDevice, 0);
  objc_storeStrong((id *)&self->_powerSourceDetailsCase, 0);
  objc_storeStrong((id *)&self->_powerSourceDetailsRight, 0);
  objc_storeStrong((id *)&self->_powerSourceDetailsLeft, 0);
  objc_storeStrong((id *)&self->_cbDevice, 0);
}

@end
