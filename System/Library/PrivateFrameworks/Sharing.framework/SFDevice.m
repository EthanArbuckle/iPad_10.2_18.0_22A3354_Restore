@implementation SFDevice

- (SFBLEDevice)bleDevice
{
  return self->_bleDevice;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (BOOL)isBLEDeviceReplaced
{
  return self->_isBLEDeviceReplaced;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *accountAltDSID;
  NSString *accountID;
  uint64_t audioRoutingScore;
  SFBLEDevice *bleDevice;
  NSString *contactIdentifier;
  uint64_t deviceFlags;
  int64_t deviceType;
  int64_t distance;
  uint64_t hotspotInfo;
  NSUUID *identifier;
  NSString *idsIdentifier;
  NSString *mediaRemoteID;
  NSString *mediaRouteID;
  NSString *model;
  NSString *name;
  unint64_t problemFlags;
  NSString *rapportIdentifier;
  NSString *requestSSID;
  uint64_t systemPairState;
  id v24;

  v4 = a3;
  accountAltDSID = self->_accountAltDSID;
  v24 = v4;
  if (accountAltDSID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", accountAltDSID, CFSTR("altDSID"));
    v4 = v24;
  }
  accountID = self->_accountID;
  if (accountID)
  {
    objc_msgSend(v24, "encodeObject:forKey:", accountID, CFSTR("aid"));
    v4 = v24;
  }
  audioRoutingScore = self->_audioRoutingScore;
  if ((_DWORD)audioRoutingScore)
  {
    objc_msgSend(v24, "encodeInteger:forKey:", audioRoutingScore, CFSTR("auRS"));
    v4 = v24;
  }
  if (self->_autoUnlockEnabled)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("auE"));
    v4 = v24;
  }
  if (self->_autoUnlockWatch)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("auW"));
    v4 = v24;
  }
  bleDevice = self->_bleDevice;
  if (bleDevice)
  {
    objc_msgSend(v24, "encodeObject:forKey:", bleDevice, CFSTR("bleD"));
    v4 = v24;
  }
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier)
  {
    objc_msgSend(v24, "encodeObject:forKey:", contactIdentifier, CFSTR("cnID"));
    v4 = v24;
  }
  if (self->_deviceActionType)
  {
    objc_msgSend(v24, "encodeInteger:forKey:");
    v4 = v24;
  }
  if (self->_deviceClassCode)
  {
    objc_msgSend(v24, "encodeInteger:forKey:");
    v4 = v24;
  }
  deviceFlags = self->_deviceFlags;
  if ((_DWORD)deviceFlags)
  {
    objc_msgSend(v24, "encodeInt64:forKey:", deviceFlags, CFSTR("dFlg"));
    v4 = v24;
  }
  if (self->_deviceModelCode)
  {
    objc_msgSend(v24, "encodeInteger:forKey:");
    v4 = v24;
  }
  deviceType = self->_deviceType;
  if (deviceType)
  {
    objc_msgSend(v24, "encodeInteger:forKey:", deviceType, CFSTR("devT"));
    v4 = v24;
  }
  distance = self->_distance;
  if (distance)
  {
    objc_msgSend(v24, "encodeInteger:forKey:", distance, CFSTR("dist"));
    v4 = v24;
  }
  if (self->_duetSync)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("ds"));
    v4 = v24;
  }
  if (self->_enhancedDiscovery)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("enDi"));
    v4 = v24;
  }
  if (self->_hasProblem)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("hp"));
    v4 = v24;
  }
  hotspotInfo = self->_hotspotInfo;
  if ((_DWORD)hotspotInfo)
  {
    objc_msgSend(v24, "encodeInt64:forKey:", hotspotInfo, CFSTR("hsi"));
    v4 = v24;
  }
  identifier = self->_identifier;
  if (identifier)
  {
    objc_msgSend(v24, "encodeObject:forKey:", identifier, CFSTR("ident"));
    v4 = v24;
  }
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier)
  {
    objc_msgSend(v24, "encodeObject:forKey:", idsIdentifier, CFSTR("idsID"));
    v4 = v24;
  }
  if (self->_idsIdentifierConflict)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("idsc"));
    v4 = v24;
  }
  if (self->_inDiscoverySession)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("iLagS"));
    v4 = v24;
  }
  if (self->_isBLEDeviceReplaced)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("replace"));
    v4 = v24;
  }
  mediaRemoteID = self->_mediaRemoteID;
  if (mediaRemoteID)
  {
    objc_msgSend(v24, "encodeObject:forKey:", mediaRemoteID, CFSTR("MRI"));
    v4 = v24;
  }
  mediaRouteID = self->_mediaRouteID;
  if (mediaRouteID)
  {
    objc_msgSend(v24, "encodeObject:forKey:", mediaRouteID, CFSTR("MRtI"));
    v4 = v24;
  }
  model = self->_model;
  if (model)
  {
    objc_msgSend(v24, "encodeObject:forKey:", model, CFSTR("model"));
    v4 = v24;
  }
  name = self->_name;
  if (name)
  {
    objc_msgSend(v24, "encodeObject:forKey:", name, CFSTR("name"));
    v4 = v24;
  }
  if (self->_needsAWDL)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("awdl"));
    v4 = v24;
  }
  if (self->_needsKeyboard)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("kb"));
    v4 = v24;
  }
  if (self->_needsSetup)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("setup"));
    v4 = v24;
  }
  if (self->_osVersion)
  {
    objc_msgSend(v24, "encodeInteger:forKey:");
    v4 = v24;
  }
  if (self->_paired)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("paired"));
    v4 = v24;
  }
  problemFlags = self->_problemFlags;
  if (problemFlags)
  {
    objc_msgSend(v24, "encodeInt64:forKey:", problemFlags, CFSTR("pf"));
    v4 = v24;
  }
  rapportIdentifier = self->_rapportIdentifier;
  if (rapportIdentifier)
  {
    objc_msgSend(v24, "encodeObject:forKey:", rapportIdentifier, CFSTR("rid"));
    v4 = v24;
  }
  requestSSID = self->_requestSSID;
  if (requestSSID)
  {
    objc_msgSend(v24, "encodeObject:forKey:", requestSSID, CFSTR("rSSID"));
    v4 = v24;
  }
  systemPairState = self->_systemPairState;
  if ((_DWORD)systemPairState)
  {
    objc_msgSend(v24, "encodeInt64:forKey:", systemPairState, CFSTR("sps"));
    v4 = v24;
  }
  if (self->_testMode)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("tm"));
    v4 = v24;
  }
  if (self->_watchLocked)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("wl"));
    v4 = v24;
  }
  if (self->_wifiP2P)
  {
    objc_msgSend(v24, "encodeBool:forKey:", 1, CFSTR("wp2p"));
    v4 = v24;
  }

}

- (id)description
{
  int v3;
  id v4;
  void *v5;
  NSString *idsIdentifier;
  const __CFString *v7;
  id *v8;
  id v9;
  id v10;
  int deviceActionType;
  int v12;
  const char *v13;
  id v14;
  int64_t v15;
  _BYTE *v16;
  uint64_t v17;
  int64_t distance;
  const char *v19;
  id v20;
  id v21;
  id v22;
  NSString *v23;
  NSString *v24;
  id v25;
  NSString *v26;
  NSString *v27;
  id v28;
  unsigned int deviceClassCode;
  const char *v30;
  id v31;
  const char *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  NSString *v41;
  NSString *v42;
  id v43;
  NSString *v44;
  NSString *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  unsigned int systemPairState;
  const char *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  unsigned int audioRoutingScore;
  const char *v62;
  id v63;
  int64_t deviceType;
  const char *v65;
  const char *v66;
  id v67;
  unsigned int v68;
  const char *v69;
  id v70;
  void *v71;
  int Int64Ranged;
  id v73;
  id v74;
  NSUUID *identifier;
  unint64_t name;
  const char *v78;
  const __CFString *v79;
  _BYTE *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  id v84;
  _QWORD v85[2];

  v3 = SFShouldLogSensitiveDescriptions();
  v85[1] = 0;
  identifier = self->_identifier;
  NSAppendPrintF();
  v4 = 0;
  v5 = v4;
  idsIdentifier = self->_idsIdentifier;
  if (v3)
  {
    if (!idsIdentifier)
      goto LABEL_10;
    v85[0] = v4;
    if (self->_idsIdentifierConflict)
      v7 = CFSTR(" (conflict)");
    else
      v7 = &stru_1E483B8E8;
    identifier = (NSUUID *)idsIdentifier;
    v79 = v7;
    v8 = (id *)v85;
  }
  else
  {
    if (!idsIdentifier)
      goto LABEL_10;
    v84 = v4;
    identifier = (NSUUID *)idsIdentifier;
    v8 = &v84;
  }
  NSAppendPrintF();
  v9 = *v8;

  v5 = v9;
LABEL_10:
  if (self->_isBLEDeviceReplaced)
  {
    NSAppendPrintF();
    v10 = v5;

    v5 = v10;
  }
  deviceActionType = self->_deviceActionType;
  if (self->_deviceActionType)
  {
    if (self->_deviceActionType > 0x63u)
    {
      switch(deviceActionType)
      {
        case 'd':
          v13 = "B238SetupAfterWiFi";
          break;
        case 'e':
          v13 = "B389SetupFromFindMy";
          break;
        case 'f':
          v13 = "B389SetupDone";
          break;
        default:
LABEL_57:
          v13 = "?";
          break;
      }
    }
    else
    {
      v12 = deviceActionType - 1;
      v13 = "ATVSetup";
      switch(v12)
      {
        case 0:
          break;
        case 3:
          v13 = "MobileBackup";
          break;
        case 4:
          v13 = "WatchSetup";
          break;
        case 5:
          v13 = "ATVPair";
          break;
        case 6:
          v13 = "InternetRelay";
          break;
        case 7:
          v13 = "WiFiPassword";
          break;
        case 8:
          v13 = "iOSSetup";
          break;
        case 9:
          v13 = "Repair";
          break;
        case 10:
          v13 = "LegacyHomePodSetup";
          break;
        case 11:
          v13 = "ApplePay";
          break;
        case 12:
          v13 = "WHASetup";
          break;
        case 13:
          v13 = "DevToolsPair";
          break;
        case 16:
          v13 = "DDPing";
          break;
        case 17:
          v13 = "DDPong";
          break;
        case 18:
          v13 = "RemoteAutoFill";
          break;
        case 19:
          v13 = "CompanionLinkProx";
          break;
        case 20:
          v13 = "RemoteManagement";
          break;
        case 21:
          v13 = "RemoteAutoFillPong";
          break;
        case 23:
          v13 = "AccessorySetup";
          break;
        case 24:
          v13 = "TVLS";
          break;
        case 26:
          v13 = "ShareAudio";
          break;
        case 27:
          v13 = "AppSignIn";
          break;
        case 28:
          v13 = "Fitness";
          break;
        case 29:
          v13 = "TVCCS";
          break;
        case 30:
          v13 = "TVSA";
          break;
        case 31:
          v13 = "AuthenticateAccounts";
          break;
        case 32:
          v13 = "HomePodSetup";
          break;
        case 33:
          v13 = "CompanionAuthentication";
          break;
        case 35:
          v13 = "dovePeace";
          break;
        case 42:
          v13 = "AuthenticateAccountsV2";
          break;
        case 49:
          v13 = "NeedsRDLink";
          break;
        case 50:
          v13 = "NeedsCLink";
          break;
        case 51:
          v13 = "Goodbye";
          break;
        case 52:
          v13 = "PointToShare";
          break;
        case 54:
          v13 = "AUAction";
          break;
        case 55:
          v13 = "AcceptedInvitations";
          break;
        case 83:
          v13 = "HasInvitations";
          break;
        default:
          goto LABEL_57;
      }
    }
    identifier = (NSUUID *)v13;
    NSAppendPrintF();
    v14 = v5;

    v5 = v14;
  }
  if (-[SFBLEDevice rssi](self->_bleDevice, "rssi", identifier, v79))
  {
    v15 = -[SFBLEDevice rssi](self->_bleDevice, "rssi");
    v16 = (_BYTE *)-[SFBLEDevice rssiEstimate](self->_bleDevice, "rssiEstimate");
    if (-[SFBLEDevice insideBubble](self->_bleDevice, "insideBubble"))
      v17 = 42;
    else
      v17 = 126;
    distance = self->_distance;
    if (distance <= 29)
    {
      switch(distance)
      {
        case 0:
          v19 = "U";
          goto LABEL_80;
        case 10:
          v19 = "I";
          goto LABEL_80;
        case 20:
          v19 = "N";
          goto LABEL_80;
      }
    }
    else if (distance > 49)
    {
      if (distance == 50)
      {
        v19 = "H";
        goto LABEL_80;
      }
      if (distance == 60)
      {
        v19 = "F";
        goto LABEL_80;
      }
    }
    else
    {
      if (distance == 30)
      {
        v19 = "P";
        goto LABEL_80;
      }
      if (distance == 40)
      {
        v19 = "R";
LABEL_80:
        v82 = v17;
        v83 = v19;
        name = v15;
        v80 = v16;
        NSAppendPrintF();
        v20 = v5;

        v5 = v20;
        goto LABEL_81;
      }
    }
    v19 = "?";
    goto LABEL_80;
  }
LABEL_81:
  if (self->_name)
  {
    name = (unint64_t)self->_name;
    NSAppendPrintF();
    v21 = v5;

    v5 = v21;
  }
  if (self->_model)
  {
    name = (unint64_t)self->_model;
    NSAppendPrintF();
    v22 = v5;

    v5 = v22;
  }
  v23 = self->_accountAltDSID;
  v24 = v23;
  if (v23)
  {
    name = (unint64_t)v23;
    NSAppendPrintF();
    v25 = v5;

    v5 = v25;
  }

  v26 = self->_accountID;
  v27 = v26;
  if (v26)
  {
    name = (unint64_t)v26;
    NSAppendPrintF();
    v28 = v5;

    v5 = v28;
  }

  deviceClassCode = self->_deviceClassCode;
  if (self->_deviceClassCode)
  {
    if (deviceClassCode > 8)
      v30 = "?";
    else
      v30 = off_1E4832378[(char)(deviceClassCode - 1)];
    name = (unint64_t)v30;
    NSAppendPrintF();
    v31 = v5;

    v5 = v31;
  }
  if (self->_deviceModelCode)
  {
    v32 = "D22ish";
    switch(self->_deviceModelCode)
    {
      case 1u:
        break;
      case 2u:
        v32 = "SEish";
        break;
      case 3u:
        v32 = "J3XXish";
        break;
      case 4u:
        v32 = "N112ish";
        break;
      case 5u:
        v32 = "B520ish";
        break;
      case 6u:
        v32 = "B620ish";
        break;
      case 7u:
        v32 = "J255ish";
        break;
      default:
        v32 = "?";
        break;
    }
    name = (unint64_t)v32;
    NSAppendPrintF();
    v33 = v5;

    v5 = v33;
  }
  if (self->_contactIdentifier)
  {
    name = (unint64_t)self->_contactIdentifier;
    NSAppendPrintF();
    v34 = v5;

    v5 = v34;
  }
  if (self->_autoUnlockEnabled)
  {
    NSAppendPrintF();
    v35 = v5;

    v5 = v35;
  }
  if (self->_autoUnlockWatch)
  {
    NSAppendPrintF();
    v36 = v5;

    v5 = v36;
  }
  if (self->_duetSync)
  {
    NSAppendPrintF();
    v37 = v5;

    v5 = v37;
  }
  if (self->_enhancedDiscovery)
  {
    NSAppendPrintF();
    v38 = v5;

    v5 = v38;
  }
  if (self->_hotspotInfo)
  {
    name = self->_hotspotInfo;
    NSAppendPrintF();
    v39 = v5;

    v5 = v39;
  }
  if (self->_inDiscoverySession)
  {
    name = self->_inDiscoverySession;
    NSAppendPrintF();
    v40 = v5;

    v5 = v40;
  }
  v41 = self->_mediaRemoteID;
  v42 = v41;
  if (v41)
  {
    name = (unint64_t)v41;
    NSAppendPrintF();
    v43 = v5;

    v5 = v43;
  }

  v44 = self->_mediaRouteID;
  v45 = v44;
  if (v44)
  {
    name = (unint64_t)v44;
    NSAppendPrintF();
    v46 = v5;

    v5 = v46;
  }

  if (self->_needsAWDL)
  {
    NSAppendPrintF();
    v47 = v5;

    v5 = v47;
  }
  if (self->_needsKeyboard)
  {
    NSAppendPrintF();
    v48 = v5;

    v5 = v48;
  }
  if (self->_needsSetup)
  {
    NSAppendPrintF();
    v49 = v5;

    v5 = v49;
  }
  if (self->_paired)
  {
    NSAppendPrintF();
    v50 = v5;

    v5 = v50;
  }
  systemPairState = self->_systemPairState;
  if (systemPairState)
  {
    switch(systemPairState)
    {
      case 0xAu:
        v52 = "NotPaired";
        break;
      case 0x1Eu:
        v52 = "Verified";
        break;
      case 0x14u:
        v52 = "Conjectured";
        break;
      default:
        v52 = "?";
        break;
    }
    name = (unint64_t)v52;
    NSAppendPrintF();
    v53 = v5;

    v5 = v53;
  }
  if (self->_rapportIdentifier)
  {
    name = (unint64_t)self->_rapportIdentifier;
    NSAppendPrintF();
    v54 = v5;

    v5 = v54;
  }
  if (self->_requestSSID)
  {
    name = (unint64_t)self->_requestSSID;
    NSAppendPrintF();
    v55 = v5;

    v5 = v55;
  }
  if (self->_watchLocked)
  {
    NSAppendPrintF();
    v56 = v5;

    v5 = v56;
  }
  if (self->_wifiP2P)
  {
    NSAppendPrintF();
    v57 = v5;

    v5 = v57;
  }
  if (self->_problemFlags)
  {
    name = self->_problemFlags;
    v80 = &algn_1A2AF7E77;
    NSAppendPrintF();
    v58 = v5;

    v5 = v58;
  }
  if (self->_deviceFlags)
  {
    name = self->_deviceFlags;
    v80 = &unk_1A2AF7F8F;
    NSAppendPrintF();
    v59 = v5;

    v5 = v59;
  }
  if (self->_osVersion)
  {
    name = self->_osVersion;
    NSAppendPrintF();
    v60 = v5;

    v5 = v60;
  }
  audioRoutingScore = self->_audioRoutingScore;
  if (audioRoutingScore)
  {
    if (audioRoutingScore > 0xF)
      v62 = "?";
    else
      v62 = off_1E48323B8[audioRoutingScore - 1];
    name = (unint64_t)v62;
    NSAppendPrintF();
    v63 = v5;

    v5 = v63;
  }
  deviceType = self->_deviceType;
  if (deviceType)
  {
    v65 = "?";
    if (deviceType == 1)
      v65 = "Generic";
    if (deviceType == 2)
      v66 = "VirtualMachine";
    else
      v66 = v65;
    name = (unint64_t)v66;
    NSAppendPrintF();
    v67 = v5;

    v5 = v67;
  }
  v68 = -[SFBLEDevice decryptedActivityLevel](self->_bleDevice, "decryptedActivityLevel", name, v80, v82, v83);
  if (v68)
  {
    if (v68 > 0xE)
      v69 = "?";
    else
      v69 = off_1E4832430[(char)(v68 - 1)];
    v78 = v69;
    v81 = v68;
    NSAppendPrintF();
    v70 = v5;

    v5 = v70;
  }
  -[SFBLEDevice advertisementFields](self->_bleDevice, "advertisementFields", v78, v81);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  Int64Ranged = CFDictionaryGetInt64Ranged();

  if (Int64Ranged)
  {
    NSAppendPrintF();
    v73 = v5;

    v5 = v73;
  }
  v74 = v5;

  return v74;
}

- (void)updateWithBLEDevice:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  NSArray *v8;
  NSArray *batteryInfo;
  uint64_t v10;
  void *v11;
  uint64_t Int64;
  void *TypedValue;
  void *v14;
  unsigned int deviceFlags;
  uint64_t v16;
  unsigned int v17;
  unsigned int Int64Ranged;
  int v19;
  unint64_t v20;
  int v21;
  BOOL v22;
  SFBLEDevice *v23;
  SEL v24;
  id v25;

  v25 = a3;
  objc_msgSend(v25, "advertisementFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    self->_autoUnlockEnabled = CFDictionaryGetInt64() != 0;
    self->_autoUnlockWatch = CFDictionaryGetInt64() != 0;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("batteryInfo"));
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    batteryInfo = self->_batteryInfo;
    self->_batteryInfo = v8;

    v10 = -[SFBLEDevice decryptedActivityLevel](self->_bleDevice, "decryptedActivityLevel");
    objc_storeStrong((id *)&self->_bleDevice, a3);
    -[SFBLEDevice setDecryptedActivityLevel:](self->_bleDevice, "setDecryptedActivityLevel:", v10);
    if (-[SFBLEDevice distance](self->_bleDevice, "distance"))
      self->_distance = -[SFBLEDevice distance](self->_bleDevice, "distance");
    self->_deviceActionType = CFDictionaryGetInt64Ranged();
    self->_deviceClassCode = CFDictionaryGetInt64Ranged();
    self->_deviceModelCode = CFDictionaryGetInt64Ranged();
    self->_duetSync = CFDictionaryGetInt64() != 0;
    self->_enhancedDiscovery = CFDictionaryGetInt64() != 0;
    self->_inDiscoverySession = CFDictionaryGetInt64() != 0;
    objc_storeStrong((id *)&self->_identifier, v7);
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    Int64 = CFDictionaryGetInt64();
    if (objc_msgSend(v11, "length"))
    {
      objc_storeStrong((id *)&self->_idsIdentifier, v11);
      self->_idsIdentifierConflict = Int64 != 0;
      self->_deviceFlags |= 8u;
    }
    if (!self->_model)
    {
      CFStringGetTypeID();
      TypedValue = (void *)CFDictionaryGetTypedValue();
      if (!TypedValue)
        TypedValue = self->_model;
      objc_storeStrong((id *)&self->_model, TypedValue);
    }
    objc_msgSend(v25, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
      objc_storeStrong((id *)&self->_name, v14);
    self->_needsAWDL = CFDictionaryGetInt64() != 0;
    self->_needsKeyboard = CFDictionaryGetInt64() != 0;
    self->_needsSetup = CFDictionaryGetInt64() != 0;
    self->_osVersion = CFDictionaryGetInt64Ranged();
    self->_paired = CFDictionaryGetInt64() != 0;
    self->_watchLocked = CFDictionaryGetInt64() != 0;
    self->_wifiP2P = CFDictionaryGetInt64() != 0;
    deviceFlags = self->_deviceFlags;
    if ((deviceFlags & 8) != 0 || (v16 = CFDictionaryGetInt64(), deviceFlags = self->_deviceFlags, !v16))
      v17 = deviceFlags & 0xFFFFFFEF;
    else
      v17 = deviceFlags | 0x10;
    self->_deviceFlags = v17;
    self->_deviceFlags = self->_deviceFlags & 0xFFFFFFDF | (32 * (CFDictionaryGetInt64() != 0));
    self->_deviceFlags = self->_deviceFlags & 0xFFFFFF7F | ((CFDictionaryGetInt64() != 0) << 7);
    Int64Ranged = CFDictionaryGetInt64Ranged();
    self->_deviceFlags = self->_deviceFlags & 0xFFFFDDFF | (((Int64Ranged >> 4) & 1) << 9) & 0xFFFFDFFF | (((Int64Ranged >> 3) & 1) << 13);
    self->_deviceFlags = self->_deviceFlags & 0xFFFFFEFF | ((CFDictionaryGetInt64Ranged() & 1) << 8);
    self->_deviceFlags = self->_deviceFlags & 0xFFFFF7FF | (((CFDictionaryGetInt64Ranged() >> 11) & 1) << 11);
    v19 = objc_msgSend(v25, "tempPaired");
    v20 = 0;
    if (v19)
      v21 = 4096;
    else
      v21 = 0;
    self->_deviceFlags = self->_deviceFlags & 0xFFFFEFFF | v21;
    v22 = self->_deviceActionType == 10;
    self->_hasProblem = v22;
    if (v22)
      v20 = CFDictionaryGetInt64();
    self->_problemFlags = v20;

  }
  else
  {
    v23 = (SFBLEDevice *)FatalErrorF();
    -[SFBLEDevice identifier](v23, v24);
  }
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountAltDSID, 0);
  objc_storeStrong((id *)&self->_requestSSID, 0);
  objc_storeStrong((id *)&self->_rapportIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_mediaRouteID, 0);
  objc_storeStrong((id *)&self->_mediaRemoteID, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_bleDevice, 0);
  objc_storeStrong((id *)&self->_batteryInfo, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

- (SFDevice)initWithCoder:(id)a3
{
  id v4;
  SFDevice *v5;
  id v6;
  id v7;
  uint64_t v8;
  SFBLEDevice *bleDevice;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *contactIdentifier;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSUUID *identifier;
  uint64_t v19;
  NSString *idsIdentifier;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  NSString *model;
  uint64_t v28;
  NSString *name;
  id v30;
  id v31;
  uint64_t v32;
  NSString *rapportIdentifier;
  id v34;
  id v35;
  id v36;
  SFDevice *v37;
  objc_super v39;
  uint64_t v40;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)SFDevice;
  v5 = -[SFDevice init](&v39, sel_init);

  if (v5)
  {
    v5->_deviceType = 1;
    v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v40 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_audioRoutingScore = v40;
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("auE")))
      v5->_autoUnlockEnabled = objc_msgSend(v7, "decodeBoolForKey:", CFSTR("auE"));
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("auW")))
      v5->_autoUnlockWatch = objc_msgSend(v7, "decodeBoolForKey:", CFSTR("auW"));
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("bleD")))
    {
      objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bleD"));
      v8 = objc_claimAutoreleasedReturnValue();
      bleDevice = v5->_bleDevice;
      v5->_bleDevice = (SFBLEDevice *)v8;

      -[SFBLEDevice advertisementFields](v5->_bleDevice, "advertisementFields");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("batteryInfo"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_storeStrong((id *)&v5->_batteryInfo, v11);

    }
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("cnID")))
    {
      objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cnID"));
      v12 = objc_claimAutoreleasedReturnValue();
      contactIdentifier = v5->_contactIdentifier;
      v5->_contactIdentifier = (NSString *)v12;

    }
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("devAT")))
      v5->_deviceActionType = objc_msgSend(v7, "decodeIntegerForKey:", CFSTR("devAT"));
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("devCC")))
      v5->_deviceClassCode = objc_msgSend(v7, "decodeIntegerForKey:", CFSTR("devCC"));
    v40 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_deviceFlags = v40;
    v40 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_deviceModelCode = v40;
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("devT")))
      v5->_deviceType = objc_msgSend(v7, "decodeIntegerForKey:", CFSTR("devT"));
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("dist")))
      v5->_distance = objc_msgSend(v7, "decodeIntegerForKey:", CFSTR("dist"));
    v14 = v7;
    if (objc_msgSend(v14, "containsValueForKey:", CFSTR("ds")))
      v5->_duetSync = objc_msgSend(v14, "decodeBoolForKey:", CFSTR("ds"));

    v15 = v14;
    if (objc_msgSend(v15, "containsValueForKey:", CFSTR("enDi")))
      v5->_enhancedDiscovery = objc_msgSend(v15, "decodeBoolForKey:", CFSTR("enDi"));

    v16 = v15;
    if (objc_msgSend(v16, "containsValueForKey:", CFSTR("hp")))
      v5->_hasProblem = objc_msgSend(v16, "decodeBoolForKey:", CFSTR("hp"));

    v40 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_hotspotInfo = v40;
    if (objc_msgSend(v16, "containsValueForKey:", CFSTR("ident")))
    {
      objc_msgSend(v16, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ident"));
      v17 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSUUID *)v17;

    }
    if (objc_msgSend(v16, "containsValueForKey:", CFSTR("idsID")))
    {
      objc_msgSend(v16, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsID"));
      v19 = objc_claimAutoreleasedReturnValue();
      idsIdentifier = v5->_idsIdentifier;
      v5->_idsIdentifier = (NSString *)v19;

    }
    v21 = v16;
    if (objc_msgSend(v21, "containsValueForKey:", CFSTR("idsc")))
      v5->_idsIdentifierConflict = objc_msgSend(v21, "decodeBoolForKey:", CFSTR("idsc"));

    v22 = v21;
    if (objc_msgSend(v22, "containsValueForKey:", CFSTR("iLagS")))
      v5->_inDiscoverySession = objc_msgSend(v22, "decodeBoolForKey:", CFSTR("iLagS"));

    v23 = v22;
    if (objc_msgSend(v23, "containsValueForKey:", CFSTR("replace")))
      v5->_isBLEDeviceReplaced = objc_msgSend(v23, "decodeBoolForKey:", CFSTR("replace"));

    v24 = v23;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v25 = v24;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    if (objc_msgSend(v25, "containsValueForKey:", CFSTR("model")))
    {
      objc_msgSend(v25, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
      v26 = objc_claimAutoreleasedReturnValue();
      model = v5->_model;
      v5->_model = (NSString *)v26;

    }
    if (objc_msgSend(v25, "containsValueForKey:", CFSTR("name")))
    {
      objc_msgSend(v25, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
      v28 = objc_claimAutoreleasedReturnValue();
      name = v5->_name;
      v5->_name = (NSString *)v28;

    }
    v30 = v25;
    if (objc_msgSend(v30, "containsValueForKey:", CFSTR("awdl")))
      v5->_needsAWDL = objc_msgSend(v30, "decodeBoolForKey:", CFSTR("awdl"));

    if (objc_msgSend(v30, "containsValueForKey:", CFSTR("kb")))
      v5->_needsKeyboard = objc_msgSend(v30, "decodeBoolForKey:", CFSTR("kb"));
    if (objc_msgSend(v30, "containsValueForKey:", CFSTR("setup")))
      v5->_needsSetup = objc_msgSend(v30, "decodeBoolForKey:", CFSTR("setup"));
    v40 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_osVersion = v40;
    if (objc_msgSend(v30, "containsValueForKey:", CFSTR("paired")))
      v5->_paired = objc_msgSend(v30, "decodeBoolForKey:", CFSTR("paired"));
    v31 = v30;
    if (objc_msgSend(v31, "containsValueForKey:", CFSTR("pf")))
      v5->_problemFlags = objc_msgSend(v31, "decodeInt64ForKey:", CFSTR("pf"));

    if (objc_msgSend(v31, "containsValueForKey:", CFSTR("rid")))
    {
      objc_msgSend(v31, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rid"));
      v32 = objc_claimAutoreleasedReturnValue();
      rapportIdentifier = v5->_rapportIdentifier;
      v5->_rapportIdentifier = (NSString *)v32;

    }
    v34 = v31;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v40 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v5->_systemPairState = v40;
    v35 = v34;
    if (objc_msgSend(v35, "containsValueForKey:", CFSTR("tm")))
      v5->_testMode = objc_msgSend(v35, "decodeBoolForKey:", CFSTR("tm"));

    if (objc_msgSend(v35, "containsValueForKey:", CFSTR("wl")))
      v5->_watchLocked = objc_msgSend(v35, "decodeBoolForKey:", CFSTR("wl"));
    v36 = v35;
    if (objc_msgSend(v36, "containsValueForKey:", CFSTR("wp2p")))
      v5->_wifiP2P = objc_msgSend(v36, "decodeBoolForKey:", CFSTR("wp2p"));

    v37 = v5;
  }

  return v5;
}

- (NSString)model
{
  return self->_model;
}

- (unsigned)deviceClassCode
{
  return self->_deviceClassCode;
}

- (unsigned)deviceActionType
{
  return self->_deviceActionType;
}

- (void)setHotspotInfo:(unsigned int)a3
{
  self->_hotspotInfo = a3;
}

- (void)setAudioRoutingScore:(int)a3
{
  self->_audioRoutingScore = a3;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)mediaRouteID
{
  return self->_mediaRouteID;
}

- (NSString)mediaRemoteID
{
  return self->_mediaRemoteID;
}

- (BOOL)inDiscoverySession
{
  return self->_inDiscoverySession;
}

- (unsigned)hotspotInfo
{
  return self->_hotspotInfo;
}

- (BOOL)duetSync
{
  return self->_duetSync;
}

- (int64_t)distance
{
  return self->_distance;
}

- (unsigned)deviceFlags
{
  return self->_deviceFlags;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)accountID
{
  return self->_accountID;
}

- (NSString)accountAltDSID
{
  return self->_accountAltDSID;
}

- (NSString)rapportIdentifier
{
  return self->_rapportIdentifier;
}

- (unsigned)deviceModelCode
{
  return self->_deviceModelCode;
}

- (BOOL)paired
{
  return self->_paired;
}

- (SFDevice)init
{
  SFDevice *v2;
  _BOOL4 IsVirtualMachine;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFDevice;
  v2 = -[SFDevice init](&v6, sel_init);
  if (v2)
  {
    IsVirtualMachine = SFDeviceIsVirtualMachine();
    v4 = 1;
    if (IsVirtualMachine)
      v4 = 2;
    v2->_deviceType = v4;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)needsKeyboardOnly
{
  return self->_needsKeyboard && self->_deviceActionType - 81 < 0xFFFFFFE1;
}

- (void)updateWithPairedPeer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_name)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_storeStrong((id *)&self->_name, v5);
    v4 = v7;
  }
  if (!self->_model)
  {
    objc_msgSend(v4, "model");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_storeStrong((id *)&self->_model, v6);
      v5 = v6;
    }
    else
    {
      v5 = 0;
    }
  }
  if (self->_systemPairState <= 0x13)
    self->_systemPairState = 20;

}

- (void)updateWithRPIdentity:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (!self->_accountAltDSID && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "accountAltDSID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_storeStrong((id *)&self->_accountAltDSID, v4);

  }
  if (!self->_accountID)
  {
    objc_msgSend(v15, "accountID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_storeStrong((id *)&self->_accountID, v5);

  }
  if (!self->_contactIdentifier)
  {
    objc_msgSend(v15, "contactID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_storeStrong((id *)&self->_contactIdentifier, v6);

  }
  v7 = objc_msgSend(v15, "type");
  v8 = 2;
  switch(v7)
  {
    case 2:
      if (SFDeviceIsVirtualMachine())
      {
        v8 = 8;
        goto LABEL_22;
      }
      break;
    case 4:
      goto LABEL_22;
    case 6:
      v8 = 4;
      goto LABEL_22;
    case 8:
      v8 = 1024;
      goto LABEL_22;
    case 9:
      v8 = 64;
      goto LABEL_22;
    case 12:
      v8 = 0x4000;
      goto LABEL_22;
    case 13:
      v8 = 0x8000;
LABEL_22:
      self->_deviceFlags |= v8;
      break;
    default:
      break;
  }
  if (!self->_idsIdentifier)
  {
    objc_msgSend(v15, "idsDeviceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_storeStrong((id *)&self->_idsIdentifier, v9);

  }
  if (!self->_mediaRemoteID && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "mediaRemoteID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_storeStrong((id *)&self->_mediaRemoteID, v10);

  }
  if (!self->_mediaRouteID && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v15, "mediaRouteID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_storeStrong((id *)&self->_mediaRouteID, v11);

  }
  if (!self->_model)
  {
    objc_msgSend(v15, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_storeStrong((id *)&self->_model, v12);

  }
  objc_msgSend(v15, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_storeStrong((id *)&self->_name, v13);

  objc_msgSend(v15, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_storeStrong((id *)&self->_rapportIdentifier, v14);

  if (self->_systemPairState <= 0x13 && objc_msgSend(v15, "type") == 2)
    self->_systemPairState = 20;

}

- (void)setAccountID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int)audioRoutingScore
{
  return self->_audioRoutingScore;
}

- (BOOL)autoUnlockEnabled
{
  return self->_autoUnlockEnabled;
}

- (void)setAutoUnlockEnabled:(BOOL)a3
{
  self->_autoUnlockEnabled = a3;
}

- (BOOL)autoUnlockWatch
{
  return self->_autoUnlockWatch;
}

- (void)setAutoUnlockWatch:(BOOL)a3
{
  self->_autoUnlockWatch = a3;
}

- (NSArray)batteryInfo
{
  return self->_batteryInfo;
}

- (void)setBatteryInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setBleDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bleDevice, a3);
}

- (void)setContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setDeviceActionType:(unsigned __int8)a3
{
  self->_deviceActionType = a3;
}

- (void)setDeviceClassCode:(unsigned __int8)a3
{
  self->_deviceClassCode = a3;
}

- (void)setDeviceFlags:(unsigned int)a3
{
  self->_deviceFlags = a3;
}

- (void)setDeviceModelCode:(unsigned __int8)a3
{
  self->_deviceModelCode = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDistance:(int64_t)a3
{
  self->_distance = a3;
}

- (BOOL)enhancedDiscovery
{
  return self->_enhancedDiscovery;
}

- (BOOL)hasProblem
{
  return self->_hasProblem;
}

- (void)setHasProblem:(BOOL)a3
{
  self->_hasProblem = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setIdsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)idsIdentifierConflict
{
  return self->_idsIdentifierConflict;
}

- (void)setIsBLEDeviceReplaced:(BOOL)a3
{
  self->_isBLEDeviceReplaced = a3;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)needsAWDL
{
  return self->_needsAWDL;
}

- (BOOL)needsKeyboard
{
  return self->_needsKeyboard;
}

- (BOOL)needsSetup
{
  return self->_needsSetup;
}

- (void)setNeedsSetup:(BOOL)a3
{
  self->_needsSetup = a3;
}

- (unint64_t)problemFlags
{
  return self->_problemFlags;
}

- (NSString)requestSSID
{
  return self->_requestSSID;
}

- (void)setRequestSSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (unsigned)systemPairState
{
  return self->_systemPairState;
}

- (void)setSystemPairState:(unsigned int)a3
{
  self->_systemPairState = a3;
}

- (BOOL)wakeDevice
{
  return self->_wakeDevice;
}

- (void)setWakeDevice:(BOOL)a3
{
  self->_wakeDevice = a3;
}

- (BOOL)watchLocked
{
  return self->_watchLocked;
}

- (void)setWatchLocked:(BOOL)a3
{
  self->_watchLocked = a3;
}

- (BOOL)wifiP2P
{
  return self->_wifiP2P;
}

- (unsigned)osVersion
{
  return self->_osVersion;
}

- (void)setOsVersion:(unsigned __int8)a3
{
  self->_osVersion = a3;
}

- (void)setAccountAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void)setPaired:(BOOL)a3
{
  self->_paired = a3;
}

- (BOOL)testMode
{
  return self->_testMode;
}

- (void)setTestMode:(BOOL)a3
{
  self->_testMode = a3;
}

@end
