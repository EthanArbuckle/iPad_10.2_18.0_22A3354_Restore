@implementation WPScanRequest

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)scanningRates
{
  $9FE6E10C8CE45DBC9A88DFDEA39A390D *result;

  objc_copyStruct(retstr, &self->_scanningRates, 24, 1, 0);
  return result;
}

- (unsigned)clientType
{
  return self->_clientType;
}

- (NSData)maskValue
{
  return self->_maskValue;
}

- (NSData)blobValue
{
  return self->_blobValue;
}

- (NSNumber)rssiThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)peers
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)useCaseList
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)allowDuplicates
{
  return self->_allowDuplicates;
}

- (BOOL)scanCache
{
  return self->_scanCache;
}

- (BOOL)holdVoucher
{
  return self->_holdVoucher;
}

- (WPScanRequest)initWithCoder:(id)a3
{
  id v4;
  WPScanRequest *v5;
  uint64_t v6;
  NSNumber *rssiThreshold;
  uint64_t v8;
  NSData *blobValue;
  uint64_t v10;
  NSData *maskValue;
  uint64_t v12;
  NSDictionary *options;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *peers;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *useCaseList;
  objc_super v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)WPScanRequest;
  v5 = -[WPScanRequest init](&v26, sel_init);
  if (v5)
  {
    v5->_clientType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kClientType"));
    v5->_scanningRates.screenOffInterval = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kScanningRatesScreenOff"));
    v5->_scanningRates.screenOnInterval = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kScanningRatesScreenOn"));
    v5->_scanningRates.window = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kScanningRatesWindow"));
    v5->_scanWhenLocked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kScanWhenLocked"));
    v5->_scanCache = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kWPScanCache"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kRSSIThreshold"));
    v6 = objc_claimAutoreleasedReturnValue();
    rssiThreshold = v5->_rssiThreshold;
    v5->_rssiThreshold = (NSNumber *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kBlobValue"));
    v8 = objc_claimAutoreleasedReturnValue();
    blobValue = v5->_blobValue;
    v5->_blobValue = (NSData *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMaskValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    maskValue = v5->_maskValue;
    v5->_maskValue = (NSData *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kScanningOptions"));
    v12 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSDictionary *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("kPeers"));
    v17 = objc_claimAutoreleasedReturnValue();
    peers = v5->_peers;
    v5->_peers = (NSArray *)v17;

    v5->_allowDuplicates = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kAllowDuplicates"));
    v5->_activeScanning = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kActiveScanning"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kUpdateTime"));
    v5->_updateTime = v19;
    v5->_nearbyScanMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kNearbyScanMode"));
    v5->_advBuffer = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kAdvBuffer"));
    v5->_priorityCritical = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kPriorityCritical"));
    v5->_range = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kRange"));
    v5->_holdVoucher = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kHoldVoucher"));
    v20 = (void *)MEMORY[0x24BDBCF20];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, CFSTR("kUseCases"));
    v23 = objc_claimAutoreleasedReturnValue();
    useCaseList = v5->_useCaseList;
    v5->_useCaseList = (NSArray *)v23;

    v5->_retainDuplicates = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kRetainDuplicates"));
    v5->_startPending = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kStartPending"));
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  int64_t v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v17;
  _BOOL4 v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  -[WPScanRequest scanningRates](self, "scanningRates");
  if (v29 == 0xFFFF)
  {
    v25 = CFSTR("No Scan");
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    -[WPScanRequest scanningRates](self, "scanningRates");
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%ld"), v28);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  -[WPScanRequest scanningRates](self, "scanningRates");
  if (v27 == 0xFFFF)
  {
    v24 = CFSTR("No Scan");
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[WPScanRequest scanningRates](self, "scanningRates");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%ld"), v26);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)MEMORY[0x24BDD17C8];
  v22 = -[WPScanRequest clientType](self, "clientType");
  -[WPScanRequest blobValue](self, "blobValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPScanRequest maskValue](self, "maskValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[WPScanRequest activeScanning](self, "activeScanning");
  v18 = -[WPScanRequest allowDuplicates](self, "allowDuplicates");
  v17 = -[WPScanRequest scanWhenLocked](self, "scanWhenLocked");
  -[WPScanRequest rssiThreshold](self, "rssiThreshold");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");
  -[WPScanRequest peers](self, "peers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WPScanRequest nearbyScanMode](self, "nearbyScanMode");
  v9 = -[WPScanRequest advBuffer](self, "advBuffer");
  v10 = -[WPScanRequest priorityCritical](self, "priorityCritical");
  v11 = -[WPScanRequest range](self, "range");
  v12 = -[WPScanRequest retainDuplicates](self, "retainDuplicates");
  -[WPScanRequest useCaseList](self, "useCaseList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WPScanRequest convertUseCaseToString:](self, "convertUseCaseToString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("scan request of type %ld, blob: %@, mask %@, active: %d, duplicates: %d, screen on: %@, screen off: %@, locked: %d,  rssi: %ld, peers: %@ nearby scan mode: %ld, advbuf: %ld, priority critical: %d, range: %d, retain duplicates: %d, usecases: %@"), v22, v21, v20, v19, v18, v25, v24, v17, v6, v7, v8, v9, v10, v11, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)retainDuplicates
{
  return self->_retainDuplicates;
}

- (BOOL)priorityCritical
{
  return self->_priorityCritical;
}

- (BOOL)activeScanning
{
  return self->_activeScanning;
}

- (BOOL)range
{
  return self->_range;
}

- (int64_t)nearbyScanMode
{
  return self->_nearbyScanMode;
}

- (BOOL)startPending
{
  return self->_startPending;
}

- (BOOL)scanWhenLocked
{
  return self->_scanWhenLocked;
}

- (id)convertUseCaseToString:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  const char *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)MEMORY[0x24BDD17C8];
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "integerValue");
        if (v11 >= 0x20000)
        {
          if (v11 >= 327680)
          {
            if (v11 >= 589824)
            {
              if (v11 <= 2147418111)
              {
                switch(v11)
                {
                  case 589824:
                    v12 = "FindNearbyRemote";
                    break;
                  case 589825:
                    v12 = "FindNearbyPencil";
                    break;
                  case 655360:
                    v12 = "AccessDigitalHomeKey";
                    break;
                  default:
LABEL_119:
                    v12 = "?";
                    break;
                }
              }
              else
              {
                switch(v11)
                {
                  case 2147418112:
                    v12 = "InternalTestNoLockScan";
                    break;
                  case 2147418113:
                    v12 = "InternalTestNoScreenOffScan";
                    break;
                  case 2147418114:
                    v12 = "InternalTestScanWithNoDups";
                    break;
                  case 2147418115:
                    v12 = "InternalTestScanWithDups";
                    break;
                  case 2147418116:
                    v12 = "InternalTestScanFor20Seconds";
                    break;
                  case 2147418117:
                    v12 = "InternalTestActiveScan";
                    break;
                  case 2147418118:
                    v12 = "InternalTestUUIDScan";
                    break;
                  case 2147418119:
                    v12 = "InternalTestScanFor10ClockSeconds";
                    break;
                  case 2147418120:
                    v12 = "InternalTestScanBoost";
                    break;
                  default:
                    goto LABEL_119;
                }
              }
            }
            else if (v11 > 458752)
            {
              switch(v11)
              {
                case 524288:
                  v12 = "ADPD";
                  break;
                case 524289:
                  v12 = "ADPDBuffer";
                  break;
                case 524290:
                  v12 = "MicroLocation";
                  break;
                case 524291:
                  v12 = "MicroLocationLeech";
                  break;
                default:
                  if (v11 == 458753)
                  {
                    v12 = "PrecisionFindingFindee";
                  }
                  else
                  {
                    if (v11 != 458754)
                      goto LABEL_119;
                    v12 = "PrecisionFindingFindeeHighPriority";
                  }
                  break;
              }
            }
            else
            {
              switch(v11)
              {
                case 393216:
                  v12 = "CaptiveNetworkJoin";
                  break;
                case 393217:
                  v12 = "UseCaseSIMTransfer";
                  break;
                case 393218:
                  v12 = "MacSetup";
                  break;
                case 393219:
                  v12 = "AppleIDSignIn";
                  break;
                case 393220:
                  v12 = "AppleIDSignInSettings";
                  break;
                default:
                  if (v11 == 327680)
                  {
                    v12 = "RapportThirdParty";
                  }
                  else
                  {
                    if (v11 != 458752)
                      goto LABEL_119;
                    v12 = "PrecisionFindingFinder";
                  }
                  break;
              }
            }
          }
          else
          {
            switch(v11)
            {
              case 131072:
                v12 = "SharingDefault";
                break;
              case 131073:
                v12 = "SharingPhoneAutoUnlock";
                break;
              case 131074:
                v12 = "SharingSiriWatchAuth";
                break;
              case 131075:
                v12 = "SharingMacAutoUnlock";
                break;
              case 131076:
                v12 = "SharingEDTScreenOn";
                break;
              case 131077:
                v12 = "SharingEDTWiFiDisabled";
                break;
              case 131078:
                v12 = "SharingEDTWombatEligibleAsDefaultCamera";
                break;
              case 131079:
                v12 = "SharingEDTWombatCameraPicker";
                break;
              case 131080:
                v12 = "SharingWombatBackground";
                break;
              case 131081:
                v12 = "SharingUniversalControl";
                break;
              case 131082:
                v12 = "SharingPeopleProximity";
                break;
              case 131083:
                v12 = "SharingEDTEnsembleOpenDisplayPrefs";
                break;
              case 131084:
                v12 = "SharingEDTNearbydMotionStopped";
                break;
              case 131085:
                v12 = "SharingDoubleBoostGenericScan";
                break;
              case 131086:
                v12 = "SharingEDTIncomingAdvertisement ";
                break;
              case 131087:
                v12 = "SharingEDTWombatStreamStart";
                break;
              case 131088:
                v12 = "SharingOYAutoUnlock";
                break;
              case 131089:
                goto LABEL_119;
              case 131090:
                v12 = "SharingAirDrop";
                break;
              case 131091:
                v12 = "SharingNearbyInvitationHost";
                break;
              case 131092:
                v12 = "SharingNearbyInvitationParticipant";
                break;
              case 131093:
                v12 = "SharingAirDropAskToAirDrop";
                break;
              case 131094:
                v12 = "SharingAirDropTempIdentity";
                break;
              case 131095:
                v12 = "SharingAirDropNeedsCLink";
                break;
              case 131096:
                v12 = "SharingRemoteWidgetUpdate";
                break;
              case 131097:
                v12 = "SharingCountryCodeUpdate";
                break;
              case 131098:
                v12 = "SharingMacPhoneAutoUnlock";
                break;
              case 131099:
                v12 = "SharingVisionProDiscovery";
                break;
              case 131100:
                v12 = "SharingVisionProStateChange";
                break;
              case 131101:
                v12 = "SharingContinuityScreen";
                break;
              case 131102:
                v12 = "SharingEDTRemoteDisplay";
                break;
              default:
                if (v11 == 196608)
                {
                  v12 = "DigitalIDTSA";
                }
                else
                {
                  if (v11 != 0x40000)
                    goto LABEL_119;
                  v12 = "DigitalCarKeyThirdParty";
                }
                break;
            }
          }
        }
        else
        {
          v12 = "Unspecified";
          switch(v11)
          {
            case 0:
              break;
            case 1:
              v12 = "HealthKit";
              break;
            case 2:
              v12 = "HomeKit";
              break;
            case 3:
              v12 = "FindMyObjectConnection";
              break;
            case 4:
              v12 = "FindMyObjectConnectionTransient";
              break;
            case 5:
              v12 = "MIDI";
              break;
            case 6:
              v12 = "Continuity";
              break;
            case 7:
              v12 = "InstantHotSpot";
              break;
            case 8:
              v12 = "NearBy";
              break;
            case 9:
              v12 = "Sharing";
              break;
            case 10:
              v12 = "HearingSupport";
              break;
            case 11:
              v12 = "Magnet";
              break;
            case 12:
              v12 = "HID";
              break;
            case 13:
              v12 = "LEA";
              break;
            case 14:
              v12 = "External";
              break;
            case 15:
              v12 = "ExternalMedical";
              break;
            case 16:
              v12 = "ExternalLock";
              break;
            case 17:
              v12 = "ExternalWatch";
              break;
            case 18:
              v12 = "SmartRouting";
              break;
            case 19:
              v12 = "DigitalID";
              break;
            case 20:
              v12 = "DigitalKey";
              break;
            case 21:
              v12 = "DigitalCarKey";
              break;
            case 22:
              v12 = "HeySiri";
              break;
            case 23:
              v12 = "ThirdPartyApp";
              break;
            case 24:
              v12 = "CNJ";
              break;
            default:
              switch(v11)
              {
                case 256:
                  v12 = "DevicePresenceDetection";
                  break;
                case 257:
                  v12 = "AudioBox";
                  break;
                case 258:
                  v12 = "SIMTransfer";
                  break;
                case 259:
                  v12 = "ProximityScreenOnLeechScan";
                  break;
                case 260:
                  v12 = "MacMigrate";
                  break;
                case 263:
                  v12 = "HIDUARTService";
                  break;
                case 264:
                  v12 = "AccessibilitySwitchControlPairing";
                  break;
                case 265:
                  v12 = "BaseBandFastConnect";
                  break;
                case 266:
                  v12 = "SafetyAlerts";
                  break;
                case 267:
                  v12 = "LECarPlay";
                  break;
                case 268:
                  v12 = "TCCBluetooth";
                  break;
                case 269:
                  v12 = "AOPBufferLeech";
                  break;
                default:
                  goto LABEL_119;
              }
              break;
          }
        }
        objc_msgSend(v10, "stringWithUTF8String:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "appendFormat:", CFSTR("%@ "), v13);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (int64_t)advBuffer
{
  return self->_advBuffer;
}

- (double)updateTime
{
  return self->_updateTime;
}

- (void)setStartPending:(BOOL)a3
{
  self->_startPending = a3;
}

- (void)setMaskValue:(id)a3
{
  NSData *v4;
  NSData *maskValue;

  v4 = (NSData *)a3;
  if (-[NSData length](v4, "length") >= 0x17)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("MaskValueTooLong"), CFSTR("The mask value provided %@ is longer than the %ld bytes"), v4, 22);
  maskValue = self->_maskValue;
  self->_maskValue = v4;

}

- (void)setBlobValue:(id)a3
{
  NSData *v4;
  NSData *blobValue;

  v4 = (NSData *)a3;
  if (-[NSData length](v4, "length") >= 0x17)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("BlobValueTooLong"), CFSTR("The blob value provided %@ is longer than the %ld bytes"), v4, 22);
  blobValue = self->_blobValue;
  self->_blobValue = v4;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCaseList, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_maskValue, 0);
  objc_storeStrong((id *)&self->_blobValue, 0);
  objc_storeStrong((id *)&self->_rssiThreshold, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WPScanRequest)init
{
  WPScanRequest *v2;
  WPScanRequest *v3;
  __int128 v4;
  NSNumber *rssiThreshold;
  uint64_t v6;
  NSArray *peers;
  uint64_t v8;
  NSDictionary *options;
  uint64_t v10;
  NSData *blobValue;
  uint64_t v12;
  NSData *maskValue;
  uint64_t v14;
  NSArray *useCaseList;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WPScanRequest;
  v2 = -[WPScanRequest init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v4 = 0xFFFFLL;
    *((_QWORD *)&v4 + 1) = 0xFFFFLL;
    *(_OWORD *)&v2->_scanningRates.screenOnInterval = v4;
    v2->_scanningRates.window = 0xFFFFLL;
    v2->_scanWhenLocked = 1;
    rssiThreshold = v2->_rssiThreshold;
    v2->_rssiThreshold = (NSNumber *)&unk_24D7D7E30;

    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    peers = v3->_peers;
    v3->_peers = (NSArray *)v6;

    v3->_allowDuplicates = 0;
    *(_WORD *)&v3->_activeScanning = 0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    options = v3->_options;
    v3->_options = (NSDictionary *)v8;

    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v10 = objc_claimAutoreleasedReturnValue();
    blobValue = v3->_blobValue;
    v3->_blobValue = (NSData *)v10;

    objc_msgSend(MEMORY[0x24BDBCE50], "data");
    v12 = objc_claimAutoreleasedReturnValue();
    maskValue = v3->_maskValue;
    v3->_maskValue = (NSData *)v12;

    v3->_clientType = 27;
    v3->_updateTime = 0.0;
    *(_OWORD *)&v3->_nearbyScanMode = xmmword_21762EDD0;
    *(_WORD *)&v3->_priorityCritical = 0;
    v3->_holdVoucher = 0;
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v14 = objc_claimAutoreleasedReturnValue();
    useCaseList = v3->_useCaseList;
    v3->_useCaseList = (NSArray *)v14;

    *(_WORD *)&v3->_retainDuplicates = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    objc_msgSend(v4, "setClientType:", -[WPScanRequest clientType](self, "clientType"));
    -[WPScanRequest scanningRates](self, "scanningRates");
    v12 = v14;
    v13 = v15;
    objc_msgSend(v4, "setScanningRates:", &v12);
    objc_msgSend(v4, "setAllowDuplicates:", -[WPScanRequest allowDuplicates](self, "allowDuplicates"));
    objc_msgSend(v4, "setScanCache:", -[WPScanRequest scanCache](self, "scanCache"));
    objc_msgSend(v4, "setScanWhenLocked:", -[WPScanRequest scanWhenLocked](self, "scanWhenLocked"));
    objc_msgSend(v4, "setActiveScanning:", -[WPScanRequest activeScanning](self, "activeScanning"));
    -[WPScanRequest rssiThreshold](self, "rssiThreshold");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRssiThreshold:", v5);

    -[WPScanRequest blobValue](self, "blobValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBlobValue:", v6);

    -[WPScanRequest maskValue](self, "maskValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setMaskValue:", v7);

    -[WPScanRequest options](self, "options");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setOptions:", v8);

    -[WPScanRequest peers](self, "peers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPeers:", v9);

    -[WPScanRequest updateTime](self, "updateTime");
    objc_msgSend(v4, "setUpdateTime:");
    objc_msgSend(v4, "setNearbyScanMode:", -[WPScanRequest nearbyScanMode](self, "nearbyScanMode"));
    objc_msgSend(v4, "setAdvBuffer:", -[WPScanRequest advBuffer](self, "advBuffer"));
    objc_msgSend(v4, "setPriorityCritical:", -[WPScanRequest priorityCritical](self, "priorityCritical"));
    objc_msgSend(v4, "setRange:", -[WPScanRequest range](self, "range"));
    objc_msgSend(v4, "setHoldVoucher:", -[WPScanRequest holdVoucher](self, "holdVoucher"));
    -[WPScanRequest useCaseList](self, "useCaseList");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUseCaseList:", v10);

    objc_msgSend(v4, "setRetainDuplicates:", -[WPScanRequest retainDuplicates](self, "retainDuplicates"));
    objc_msgSend(v4, "setStartPending:", -[WPScanRequest startPending](self, "startPending"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[WPScanRequest clientType](self, "clientType"), CFSTR("kClientType"));
  -[WPScanRequest scanningRates](self, "scanningRates");
  objc_msgSend(v4, "encodeInteger:forKey:", v13, CFSTR("kScanningRatesScreenOn"));
  -[WPScanRequest scanningRates](self, "scanningRates");
  objc_msgSend(v4, "encodeInteger:forKey:", v12, CFSTR("kScanningRatesScreenOff"));
  -[WPScanRequest scanningRates](self, "scanningRates");
  objc_msgSend(v4, "encodeInteger:forKey:", v11, CFSTR("kScanningRatesWindow"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest scanWhenLocked](self, "scanWhenLocked"), CFSTR("kScanWhenLocked"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest scanCache](self, "scanCache"), CFSTR("kWPScanCache"));
  -[WPScanRequest rssiThreshold](self, "rssiThreshold");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kRSSIThreshold"));

  -[WPScanRequest blobValue](self, "blobValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kBlobValue"));

  -[WPScanRequest maskValue](self, "maskValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kMaskValue"));

  -[WPScanRequest options](self, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kScanningOptions"));

  -[WPScanRequest peers](self, "peers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("kPeers"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest allowDuplicates](self, "allowDuplicates"), CFSTR("kAllowDuplicates"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest activeScanning](self, "activeScanning"), CFSTR("kActiveScanning"));
  -[WPScanRequest updateTime](self, "updateTime");
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("kUpdateTime"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[WPScanRequest nearbyScanMode](self, "nearbyScanMode"), CFSTR("kNearbyScanMode"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[WPScanRequest advBuffer](self, "advBuffer"), CFSTR("kAdvBuffer"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest priorityCritical](self, "priorityCritical"), CFSTR("kPriorityCritical"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest range](self, "range"), CFSTR("kRange"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest holdVoucher](self, "holdVoucher"), CFSTR("kHoldVoucher"));
  -[WPScanRequest useCaseList](self, "useCaseList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("kUseCases"));

  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest retainDuplicates](self, "retainDuplicates"), CFSTR("kRetainDuplicates"));
  objc_msgSend(v4, "encodeBool:forKey:", -[WPScanRequest startPending](self, "startPending"), CFSTR("kStartPending"));

}

- (void)setClientType:(unsigned __int8)a3
{
  self->_clientType = a3;
}

- (void)setScanningRates:(id *)a3
{
  objc_copyStruct(&self->_scanningRates, a3, 24, 1, 0);
}

- (void)setAllowDuplicates:(BOOL)a3
{
  self->_allowDuplicates = a3;
}

- (void)setScanWhenLocked:(BOOL)a3
{
  self->_scanWhenLocked = a3;
}

- (void)setActiveScanning:(BOOL)a3
{
  self->_activeScanning = a3;
}

- (void)setScanCache:(BOOL)a3
{
  self->_scanCache = a3;
}

- (void)setRssiThreshold:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)options
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setPeers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setUpdateTime:(double)a3
{
  self->_updateTime = a3;
}

- (void)setNearbyScanMode:(int64_t)a3
{
  self->_nearbyScanMode = a3;
}

- (void)setAdvBuffer:(int64_t)a3
{
  self->_advBuffer = a3;
}

- (void)setPriorityCritical:(BOOL)a3
{
  self->_priorityCritical = a3;
}

- (void)setRange:(BOOL)a3
{
  self->_range = a3;
}

- (void)setHoldVoucher:(BOOL)a3
{
  self->_holdVoucher = a3;
}

- (void)setUseCaseList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setRetainDuplicates:(BOOL)a3
{
  self->_retainDuplicates = a3;
}

@end
