@implementation WFSetupDataInternal

- (int64_t)version
{
  return 0;
}

- (id)keyboards
{
  return (id)swift_unknownObjectRetain();
}

- (NSString)appleID
{
  return (NSString *)sub_247CB7C4C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupDataInternal_appleID);
}

- (BOOL)usesSameAccountForiTunes
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_usesSameAccountForiTunes);
}

- (NSData)walletData
{
  return (NSData *)sub_247CB7AF4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupDataInternal_walletData);
}

- (BOOL)isConnectedToWiFi
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isConnectedToWiFi);
}

- (NSArray)networks
{
  return (NSArray *)sub_247CB77F0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___WFSetupDataInternal_networks, (unint64_t *)&qword_2576F2DE0);
}

- (NSArray)networkPasswords
{
  return (NSArray *)sub_247CB77F0((uint64_t)self, (uint64_t)a2, (uint64_t)&OBJC_IVAR___WFSetupDataInternal_networkPasswords, (unint64_t *)&unk_2576F2510);
}

- (NSDictionary)localePreferences
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_247CEF604();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (BOOL)isAutomaticTimeZoneEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isAutomaticTimeZoneEnabled);
}

- (NSString)timeZone
{
  return (NSString *)sub_247CB7DAC();
}

- (NSData)accessibilitySettings
{
  return (NSData *)sub_247CB7AF4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupDataInternal_accessibilitySettings);
}

- (NSString)firstName
{
  return (NSString *)sub_247CB7C4C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupDataInternal_firstName);
}

- (NSString)deviceModel
{
  return (NSString *)sub_247CB7DAC();
}

- (NSString)deviceClass
{
  return (NSString *)sub_247CB7DAC();
}

- (BOOL)hasHomeButton
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_hasHomeButton);
}

- (BOOL)isRestoring
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isRestoring);
}

- (NSString)deviceName
{
  return (NSString *)sub_247CB7DAC();
}

- (NSString)backupUUID
{
  return (NSString *)sub_247CB7C4C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupDataInternal_backupUUID);
}

- (BOOL)isBackupEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isBackupEnabled);
}

- (BOOL)isOptedInToLocationServices
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isOptedInToLocationServices);
}

- (NSData)locationServicesData
{
  return (NSData *)sub_247CB7AF4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupDataInternal_locationServicesData);
}

- (BOOL)isOptedInToFindMyDevice
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isOptedInToFindMyDevice);
}

- (BOOL)isOptedInToDeviceAnalytics
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isOptedInToDeviceAnalytics);
}

- (BOOL)isOptedInToAppAnalytics
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_isOptedInToAppAnalytics);
}

- (BOOL)siriAssistantIsEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_siriAssistantIsEnabled);
}

- (BOOL)siriVoiceTriggerIsEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_siriVoiceTriggerIsEnabled);
}

- (NSString)siriAssistantLanguageCode
{
  return (NSString *)sub_247CB7C4C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___WFSetupDataInternal_siriAssistantLanguageCode);
}

- (AFVoiceInfo)siriAssistantOutputVoice
{
  return (AFVoiceInfo *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                + OBJC_IVAR___WFSetupDataInternal_siriAssistantOutputVoice));
}

- (BOOL)siriDataSharingIsEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_siriDataSharingIsEnabled);
}

- (BOOL)dictationIsEnabled
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_dictationIsEnabled);
}

- (BOOL)suppressDictationOptIn
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_suppressDictationOptIn);
}

- (int64_t)deviceTermsIdentifier
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_deviceTermsIdentifier);
}

- (NSString)productVersion
{
  return (NSString *)sub_247CB7DAC();
}

- (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider)anisetteDataProvider
{
  return (_TtC10TDGSharing33WFSetupServerAnisetteDataProvider *)*(id *)((char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_anisetteDataProvider);
}

- (NSArray)prescriptionRecords
{
  void *v2;

  type metadata accessor for PrescriptionRecord();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_247CEF6A0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (WFSetupDataInternal)initWithKeyboards:(id)a3 appleID:(id)a4 usesSameAccountForiTunes:(BOOL)a5 isConnectedToWiFi:(BOOL)a6 networks:(id)a7 networkPasswords:(id)a8 localePreferences:(id)a9 isAutomaticTimeZoneEnabled:(BOOL)a10 timeZone:(id)a11 accessibilitySettings:(id)a12 firstName:(id)a13 deviceModel:(id)a14 deviceClass:(id)a15 hasHomeButton:(BOOL)a16 isRestoring:(BOOL)a17 deviceName:(id)a18 backupUUID:(id)a19 isBackupEnabled:(BOOL)a20 isOptedInToLocationServices:(BOOL)a21 isOptedInToDeviceAnalytics:(BOOL)a22 locationServicesData:(id)a23 isOptedInToFindMyDevice:(BOOL)a24 isOptedInToAppAnalytics:(BOOL)a25 siriAssistantIsEnabled:(BOOL)a26 siriVoiceTriggerIsEnabled:(BOOL)a27 siriAssistantLanguageCode:(id)a28 siriAssistantOutputVoice:(id)a29 siriDataSharingIsEnabled:(BOOL)a30 dictationIsEnabled:(BOOL)a31 suppressDictationOptIn:(BOOL)a32 deviceTermsIdentifier:(int64_t)a33 productVersion:(id)a34 anisetteDataProvider:(id)a35 prescriptionRecords:(id)a36 walletData:(id)a37
{
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  char v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  uint64_t v105;

  if (a4)
  {
    v38 = sub_247CEF658();
    v100 = v39;
    v101 = v38;
  }
  else
  {
    v100 = 0;
    v101 = 0;
  }
  sub_247CBBA5C(0, (unint64_t *)&qword_2576F2DE0);
  v99 = sub_247CEF6AC();
  sub_247CBBA5C(0, (unint64_t *)&unk_2576F2510);
  v98 = sub_247CEF6AC();
  v97 = sub_247CEF61C();
  v40 = sub_247CEF658();
  v95 = v41;
  v96 = v40;
  v102 = a3;
  swift_unknownObjectRetain();
  v42 = a13;
  v43 = a14;
  v44 = a15;
  v45 = a18;
  v46 = a19;
  v47 = a23;
  v48 = a28;
  v94 = a29;
  v85 = a34;
  v91 = a35;
  v87 = a36;
  v88 = a37;
  if (a12)
  {
    v49 = a12;
    v50 = sub_247CEF4FC();
    v92 = v51;
    v93 = v50;

    if (v42)
    {
LABEL_6:
      v52 = sub_247CEF658();
      v89 = v53;
      v90 = v52;

      goto LABEL_9;
    }
  }
  else
  {
    v92 = 0xF000000000000000;
    v93 = 0;
    if (v42)
      goto LABEL_6;
  }
  v89 = 0;
  v90 = 0;
LABEL_9:
  v54 = sub_247CEF658();
  v83 = v55;
  v84 = v54;

  v56 = sub_247CEF658();
  v81 = v57;
  v82 = v56;

  v58 = sub_247CEF658();
  v79 = v59;
  v80 = v58;

  if (v46)
  {
    v105 = sub_247CEF658();
    v78 = v60;

    if (v47)
      goto LABEL_11;
LABEL_14:
    v61 = 0;
    v63 = 0xF000000000000000;
    if (v48)
      goto LABEL_12;
    goto LABEL_15;
  }
  v105 = 0;
  v78 = 0;
  if (!v47)
    goto LABEL_14;
LABEL_11:
  v61 = sub_247CEF4FC();
  v63 = v62;

  if (v48)
  {
LABEL_12:
    v64 = sub_247CEF658();
    v66 = v65;

    goto LABEL_16;
  }
LABEL_15:
  v64 = 0;
  v66 = 0;
LABEL_16:
  v67 = a22;
  v68 = a17;
  v69 = a16;
  v70 = sub_247CEF658();
  v76 = v71;
  v77 = v70;

  type metadata accessor for PrescriptionRecord();
  v86 = sub_247CEF6AC();

  if (v88)
  {
    v72 = sub_247CEF4FC();
    v74 = v73;

    v68 = a17;
    v69 = a16;
    v67 = a22;
  }
  else
  {
    v72 = 0;
    v74 = 0xF000000000000000;
  }
  return (WFSetupDataInternal *)WFSetupData.init(keyboards:appleID:usesSameAccountForiTunes:isConnectedToWiFi:networks:networkPasswords:localePreferences:isAutomaticTimeZoneEnabled:timeZone:accessibilitySettings:firstName:deviceModel:deviceClass:hasHomeButton:isRestoring:deviceName:backupUUID:isBackupEnabled:isOptedInToLocationServices:isOptedInToDeviceAnalytics:locationServicesData:isOptedInToFindMyDevice:isOptedInToAppAnalytics:siriAssistantIsEnabled:siriVoiceTriggerIsEnabled:siriAssistantLanguageCode:siriAssistantOutputVoice:siriDataSharingIsEnabled:dictationIsEnabled:suppressDictationOptIn:deviceTermsIdentifier:productVersion:anisetteDataProvider:prescriptionRecords:walletData:)((uint64_t)v102, v101, v100, a5, a6, v99, v98, v97, a10, v96, v95, v93, v92, v90, v89, v84, v83, v82, v81,
                                  v69,
                                  v68,
                                  v80,
                                  v79,
                                  v105,
                                  v78,
                                  a20,
                                  a21,
                                  v67,
                                  v61,
                                  v63,
                                  a24,
                                  a25,
                                  a26,
                                  a27,
                                  v64,
                                  v66,
                                  (uint64_t)v94,
                                  a30,
                                  a31,
                                  a32,
                                  a33,
                                  v77,
                                  v76,
                                  (uint64_t)v91,
                                  v86,
                                  v72,
                                  v74);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  WFSetupDataInternal *v5;

  v4 = a3;
  v5 = self;
  WFSetupData.encode(with:)((NSCoder)v4);

}

- (WFSetupDataInternal)initWithCoder:(id)a3
{
  return (WFSetupDataInternal *)WFSetupData.init(coder:)(a3);
}

- (WFSetupDataInternal)init
{
  WFSetupDataInternal *result;

  result = (WFSetupDataInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  sub_247CB64F0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_walletData), *(_QWORD *)&self->version[OBJC_IVAR___WFSetupDataInternal_walletData]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247CB64F0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_accessibilitySettings), *(_QWORD *)&self->version[OBJC_IVAR___WFSetupDataInternal_accessibilitySettings]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247CB64F0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFSetupDataInternal_locationServicesData), *(_QWORD *)&self->version[OBJC_IVAR___WFSetupDataInternal_locationServicesData]);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
