@implementation WFSetupData

- (WFSetupData)initWithKeyboards:(void *)a3 appleID:(id)a4 usesSameAccountForiTunes:(BOOL)a5 isConnectedToWiFi:(BOOL)a6 networks:(id)a7 networkPasswords:(id)a8 localePreferences:(id)a9 isAutomaticTimeZoneEnabled:(BOOL)a10 timeZone:(id)a11 accessibilitySettings:(id)a12 firstName:(id)a13 deviceModel:(id)a14 deviceClass:(id)a15 hasHomeButton:(BOOL)a16 isRestoring:(BOOL)a17 deviceName:(id)a18 backupUUID:(id)a19 isBackupEnabled:(BOOL)a20 dateOfLastBackup:(id)a21 isOptedInToLocationServices:(BOOL)a22 isOptedInToDeviceAnalytics:(BOOL)a23 locationServicesData:(id)a24 isOptedInToFindMyDevice:(BOOL)a25 isOptedInToAppAnalytics:(BOOL)a26 siriAssistantIsEnabled:(BOOL)a27 siriVoiceTriggerIsEnabled:(BOOL)a28 siriAssistantLanguageCode:(id)a29 siriAssistantOutputVoice:(id)a30 siriDataSharingIsEnabled:(BOOL)a31 dictationIsEnabled:(BOOL)a32 suppressDictationOptIn:(BOOL)a33 deviceTermsIdentifier:(int64_t)a34 productVersion:(id)a35 anisetteDataProvider:(id)a36 prescriptionRecords:(id)a37 walletData:(id)a38
{
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  WFSetupData *v49;
  WFSetupDataInternal *v50;
  WFSetupDataInternal *underlyingSwiftObject;
  WFSetupData *v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _BOOL4 v60;
  _BOOL4 v61;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  objc_super v72;

  v60 = a5;
  v61 = a6;
  v71 = a4;
  v40 = a7;
  v70 = a8;
  v41 = a9;
  v42 = a11;
  v43 = a12;
  v44 = a13;
  v45 = a14;
  v46 = a15;
  v47 = a18;
  v48 = a19;
  v69 = a24;
  v68 = a29;
  v67 = a30;
  v66 = a35;
  v65 = a36;
  v64 = a37;
  v63 = a38;
  v72.receiver = self;
  v72.super_class = (Class)WFSetupData;
  v49 = -[WFSetupData init](&v72, sel_init);
  if (v49)
  {
    BYTE2(v58) = a33;
    LOWORD(v58) = __PAIR16__(a32, a31);
    WORD1(v57) = __PAIR16__(a28, a27);
    LOWORD(v57) = __PAIR16__(a26, a25);
    *(_WORD *)((char *)&v56 + 1) = __PAIR16__(a23, a22);
    LOBYTE(v56) = a20;
    LOWORD(v55) = __PAIR16__(a17, a16);
    LOBYTE(v54) = a10;
    v50 = -[WFSetupDataInternal initWithKeyboards:appleID:usesSameAccountForiTunes:isConnectedToWiFi:networks:networkPasswords:localePreferences:isAutomaticTimeZoneEnabled:timeZone:accessibilitySettings:firstName:deviceModel:deviceClass:hasHomeButton:isRestoring:deviceName:backupUUID:isBackupEnabled:isOptedInToLocationServices:isOptedInToDeviceAnalytics:locationServicesData:isOptedInToFindMyDevice:isOptedInToAppAnalytics:siriAssistantIsEnabled:siriVoiceTriggerIsEnabled:siriAssistantLanguageCode:siriAssistantOutputVoice:siriDataSharingIsEnabled:dictationIsEnabled:suppressDictationOptIn:deviceTermsIdentifier:productVersion:anisetteDataProvider:prescriptionRecords:walletData:]([WFSetupDataInternal alloc], "initWithKeyboards:appleID:usesSameAccountForiTunes:isConnectedToWiFi:networks:networkPasswords:localePreferences:isAutomaticTimeZoneEnabled:timeZone:accessibilitySettings:firstName:deviceModel:deviceClass:hasHomeButton:isRestoring:deviceName:backupUUID:isBackupEnabled:isOptedInToLocationServices:isOptedInToDeviceAnalytics:locationServicesData:isOptedInToFindMyDevice:isOptedInToAppAnalytics:siriAssistantIsEnabled:siriVoiceTriggerIsEnabled:siriAssistantLanguageCode:siriAssistantOutputVoice:siriDataSharingIsEnabled:dictationIsEnabled:suppressDictationOptIn:deviceTermsIdentifier:productVersion:anisetteDataProvider:prescriptionRecords:walletData:", a3, v71, v60, v61, v40, v70, v41, v54, v42, v43, v44, v45,
            v46,
            v55,
            v47,
            v48,
            v56,
            v69,
            v57,
            v68,
            v67,
            v58,
            a34,
            v66,
            v65,
            v64,
            v63);
    underlyingSwiftObject = v49->_underlyingSwiftObject;
    v49->_underlyingSwiftObject = v50;

    v52 = v49;
  }

  return v49;
}

- (NSArray)keyboards
{
  return (NSArray *)-[WFSetupDataInternal keyboards](self->_underlyingSwiftObject, "keyboards");
}

- (NSString)appleID
{
  return -[WFSetupDataInternal appleID](self->_underlyingSwiftObject, "appleID");
}

- (BOOL)usesSameAccountForiTunes
{
  return -[WFSetupDataInternal usesSameAccountForiTunes](self->_underlyingSwiftObject, "usesSameAccountForiTunes");
}

- (BOOL)isConnectedToWiFi
{
  return -[WFSetupDataInternal isConnectedToWiFi](self->_underlyingSwiftObject, "isConnectedToWiFi");
}

- (NSArray)networks
{
  return -[WFSetupDataInternal networks](self->_underlyingSwiftObject, "networks");
}

- (NSArray)networkPasswords
{
  return -[WFSetupDataInternal networkPasswords](self->_underlyingSwiftObject, "networkPasswords");
}

- (NSDictionary)localePreferences
{
  return -[WFSetupDataInternal localePreferences](self->_underlyingSwiftObject, "localePreferences");
}

- (BOOL)isAutomaticTimeZoneEnabled
{
  return -[WFSetupDataInternal isAutomaticTimeZoneEnabled](self->_underlyingSwiftObject, "isAutomaticTimeZoneEnabled");
}

- (NSString)timeZone
{
  return -[WFSetupDataInternal timeZone](self->_underlyingSwiftObject, "timeZone");
}

- (NSData)accessibilitySettings
{
  return -[WFSetupDataInternal accessibilitySettings](self->_underlyingSwiftObject, "accessibilitySettings");
}

- (id)walletData
{
  return -[WFSetupDataInternal walletData](self->_underlyingSwiftObject, "walletData");
}

- (NSString)firstName
{
  return -[WFSetupDataInternal firstName](self->_underlyingSwiftObject, "firstName");
}

- (NSString)deviceName
{
  return -[WFSetupDataInternal deviceName](self->_underlyingSwiftObject, "deviceName");
}

- (NSString)backupUUID
{
  return -[WFSetupDataInternal backupUUID](self->_underlyingSwiftObject, "backupUUID");
}

- (BOOL)isBackupEnabled
{
  return -[WFSetupDataInternal isBackupEnabled](self->_underlyingSwiftObject, "isBackupEnabled");
}

- (BOOL)isOptedInToLocationServices
{
  return -[WFSetupDataInternal isOptedInToLocationServices](self->_underlyingSwiftObject, "isOptedInToLocationServices");
}

- (NSData)locationServicesData
{
  return -[WFSetupDataInternal locationServicesData](self->_underlyingSwiftObject, "locationServicesData");
}

- (BOOL)isOptedInToFindMyDevice
{
  return -[WFSetupDataInternal isOptedInToFindMyDevice](self->_underlyingSwiftObject, "isOptedInToFindMyDevice");
}

- (BOOL)isOptedInToDeviceAnalytics
{
  return -[WFSetupDataInternal isOptedInToDeviceAnalytics](self->_underlyingSwiftObject, "isOptedInToDeviceAnalytics");
}

- (BOOL)isOptedInToAppAnalytics
{
  return -[WFSetupDataInternal isOptedInToAppAnalytics](self->_underlyingSwiftObject, "isOptedInToAppAnalytics");
}

- (BOOL)siriAssistantIsEnabled
{
  return -[WFSetupDataInternal siriAssistantIsEnabled](self->_underlyingSwiftObject, "siriAssistantIsEnabled");
}

- (BOOL)siriVoiceTriggerIsEnabled
{
  return -[WFSetupDataInternal siriVoiceTriggerIsEnabled](self->_underlyingSwiftObject, "siriVoiceTriggerIsEnabled");
}

- (NSString)siriAssistantLanguageCode
{
  return -[WFSetupDataInternal siriAssistantLanguageCode](self->_underlyingSwiftObject, "siriAssistantLanguageCode");
}

- (NSString)siriAssistantOutputVoice
{
  return (NSString *)-[WFSetupDataInternal siriAssistantOutputVoice](self->_underlyingSwiftObject, "siriAssistantOutputVoice");
}

- (BOOL)siriDataSharingIsEnabled
{
  return -[WFSetupDataInternal siriDataSharingIsEnabled](self->_underlyingSwiftObject, "siriDataSharingIsEnabled");
}

- (BOOL)dictationIsEnabled
{
  return -[WFSetupDataInternal dictationIsEnabled](self->_underlyingSwiftObject, "dictationIsEnabled");
}

- (BOOL)suppressDictationOptIn
{
  return -[WFSetupDataInternal suppressDictationOptIn](self->_underlyingSwiftObject, "suppressDictationOptIn");
}

- (int64_t)deviceTermsIdentifier
{
  return -[WFSetupDataInternal deviceTermsIdentifier](self->_underlyingSwiftObject, "deviceTermsIdentifier");
}

- (NSString)productVersion
{
  return -[WFSetupDataInternal productVersion](self->_underlyingSwiftObject, "productVersion");
}

+ (BOOL)supportsSecureCoding
{
  return +[WFSetupDataInternal supportsSecureCoding](WFSetupDataInternal, "supportsSecureCoding");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WFSetupData underlyingSwiftObject](self, "underlyingSwiftObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeWithCoder:", v4);

}

- (WFSetupData)initWithCoder:(id)a3
{
  id v4;
  WFSetupData *v5;
  WFSetupDataInternal *v6;
  WFSetupData *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFSetupData;
  v5 = -[WFSetupData init](&v9, sel_init);
  if (v5)
  {
    v6 = -[WFSetupDataInternal initWithCoder:]([WFSetupDataInternal alloc], "initWithCoder:", v4);
    -[WFSetupData setUnderlyingSwiftObject:](v5, "setUnderlyingSwiftObject:", v6);

    -[WFSetupData underlyingSwiftObject](v5, "underlyingSwiftObject");
    v7 = (WFSetupData *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v7 = v5;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (NSString)deviceClass
{
  return self->_deviceClass;
}

- (BOOL)hasHomeButton
{
  return self->_hasHomeButton;
}

- (BOOL)isRestoring
{
  return self->_isRestoring;
}

- (WFSetupDataInternal)underlyingSwiftObject
{
  return (WFSetupDataInternal *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUnderlyingSwiftObject:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingSwiftObject, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_deviceModel, 0);
}

@end
