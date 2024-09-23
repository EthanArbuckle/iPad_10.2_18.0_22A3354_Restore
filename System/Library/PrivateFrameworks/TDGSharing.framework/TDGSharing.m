uint64_t variable initialization expression of WFSetupData.Builder.keyboards()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.appleID()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.usesSameAccountForiTunes()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.isConnectedToWiFi()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.networks()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.networkPasswords()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.localePreferences()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.isAutomaticTimeZoneEnabled()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.timeZone()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.accessibilitySettings()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.firstName()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.deviceModel()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.deviceClass()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.hasHomeButton()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.isRestoring()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.deviceName()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.backupUUID()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.isBackupEnabled()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.isOptedInToLocationServices()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.locationServicesData()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.isOptedInToFindMyDevice()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.isOptedInToAppAnalytics()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.isOptedInToDeviceAnalytics()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.siriAssistantIsEnabled()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.siriVoiceTriggerIsEnabled()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.siriAssistantLanguageCode()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.siriAssistantOutputVoice()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.siriDataSharingIsEnabled()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.dictationIsEnabled()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.suppressDictationOptIn()
{
  return 2;
}

uint64_t variable initialization expression of WFSetupData.Builder.deviceTermsIdentifier()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.productVersion()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.anisetteDataProvider()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.prescriptionRecords()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.Builder.walletData()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupData.version()
{
  return 0;
}

double variable initialization expression of PrescriptionRecord.version()
{
  return 1.0;
}

uint64_t variable initialization expression of WFSetupServer.dispatchQueue()
{
  sub_247CB17C0();
  return sub_247CEF70C();
}

unint64_t sub_247CB17C0()
{
  unint64_t result;

  result = qword_2576F1D40;
  if (!qword_2576F1D40)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2576F1D40);
  }
  return result;
}

uint64_t variable initialization expression of WFSetupServer.completionHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.activationHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.setupProgressEventHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.userInteractionProgressEventHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.setupPromptPinHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.receivedObjectHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.anisetteDataProvider()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.shouldAdvertiseFast()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.sfService()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.resumeAuthTag()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.peer@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_247CEF550();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t variable initialization expression of WFSetupServer.sfSession()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServer.serverState()
{
  return 0;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t variable initialization expression of WFSetupServer.preventExitForLocaleClient()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.interruptionHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.invalidationHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.peerDevice()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.messageSessionTemplate()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.setupProgressEventHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.userInteractionProgressEventHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.setupSecurePairingCompletionHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.receivedObjectHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.showPinHandler()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupClient.clientState()
{
  return 0;
}

uint64_t _s10TDGSharing13WFSetupServerC16analyticsManager33_0F9370D4A0722B5CE32DB26B8EE7BA1ALLAA09AnalyticsE0Cvpfi_0()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(void);
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[24];
  ValueMetadata *v7;
  _UNKNOWN **v8;
  _BYTE v9[24];
  ValueMetadata *v10;
  _UNKNOWN **v11;

  v10 = &type metadata for CoreAnalyticsBackend;
  v11 = &off_25194C828;
  v0 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v9, (uint64_t)&type metadata for CoreAnalyticsBackend);
  MEMORY[0x24BDAC7A8](v0, v0);
  v2 = *(void (**)(void))(v1 + 16);
  v2();
  v7 = &type metadata for CoreAnalyticsBackend;
  v8 = &off_25194C828;
  type metadata accessor for AnalyticsManager();
  v3 = swift_allocObject();
  v4 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v6, (uint64_t)&type metadata for CoreAnalyticsBackend);
  MEMORY[0x24BDAC7A8](v4, v4);
  v2();
  *(_QWORD *)(v3 + 40) = &type metadata for CoreAnalyticsBackend;
  *(_QWORD *)(v3 + 48) = &off_25194C828;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v3;
}

uint64_t variable initialization expression of WFSetupClient.sfSession()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServerAnisetteDataProvider.session()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServerAnisetteDataProvider.companionAuthDevice()
{
  return 0;
}

uint64_t variable initialization expression of WFSetupServerAnisetteDataProvider.transportableAuthKitAccount()
{
  return 0;
}

void type metadata accessor for WFSetupServerUserInteractionProgressEvent(uint64_t a1)
{
  sub_247CB1B00(a1, &qword_2576F1D48);
}

void type metadata accessor for WFSetupClientUserInteractionProgressEvent(uint64_t a1)
{
  sub_247CB1B00(a1, &qword_2576F1D50);
}

void type metadata accessor for WFSetupProgressEvent(uint64_t a1)
{
  sub_247CB1B00(a1, &qword_2576F1D58);
}

ValueMetadata *type metadata accessor for CoreAnalyticsBackend()
{
  return &type metadata for CoreAnalyticsBackend;
}

void sub_247CB1AD8(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_247CB1AE0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void type metadata accessor for CFData(uint64_t a1)
{
  sub_247CB1B00(a1, &qword_2576F1D60);
}

void sub_247CB1B00(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t WFSetupData.BuildError.errorDescription.getter(unsigned __int8 a1)
{
  sub_247CEF79C();
  sub_247CEF67C();
  WFSetupData.PropertyKey.rawValue.getter(a1);
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  sub_247CEF67C();
  return 0;
}

uint64_t sub_247CB1BE4()
{
  unsigned __int8 *v0;

  return WFSetupData.BuildError.errorDescription.getter(*v0);
}

uint64_t WFSetupData.Builder.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  WFSetupData.Builder.init()();
  return v0;
}

uint64_t WFSetupData.Builder.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = v0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  *(_WORD *)(v0 + 40) = 514;
  *(_QWORD *)(v0 + 56) = 0;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 48) = 0;
  *(_BYTE *)(v0 + 72) = 2;
  *(_QWORD *)(v0 + 80) = 0;
  *(_QWORD *)(v0 + 88) = 0;
  *(_QWORD *)(v0 + 96) = 0;
  *(_QWORD *)(v0 + 104) = 0xF000000000000000;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  *(_OWORD *)(v0 + 144) = 0u;
  *(_WORD *)(v0 + 160) = 514;
  *(_OWORD *)(v0 + 184) = 0u;
  *(_OWORD *)(v0 + 168) = 0u;
  *(_WORD *)(v0 + 200) = 514;
  *(_OWORD *)(v0 + 208) = xmmword_247CF0AF0;
  *(_DWORD *)(v0 + 224) = 33686018;
  *(_BYTE *)(v0 + 228) = 2;
  *(_QWORD *)(v0 + 240) = 0;
  *(_QWORD *)(v0 + 248) = 0;
  *(_QWORD *)(v0 + 232) = 0;
  *(_WORD *)(v0 + 256) = 514;
  *(_BYTE *)(v0 + 258) = 2;
  *(_QWORD *)(v0 + 264) = 0;
  *(_BYTE *)(v0 + 272) = 1;
  *(_OWORD *)(v0 + 280) = 0u;
  *(_OWORD *)(v0 + 296) = 0u;
  *(_QWORD *)(v0 + 312) = 0;
  *(_QWORD *)(v0 + 320) = 0xF000000000000000;
  if (qword_2576F1D18 != -1)
    swift_once();
  v2 = sub_247CEF598();
  __swift_project_value_buffer(v2, (uint64_t)qword_2576F4A30);
  v3 = sub_247CEF580();
  v4 = sub_247CEF6E8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_247CAF000, v3, v4, "Initializing WFSetupData.Builder.", v5, 2u);
    MEMORY[0x249590A5C](v5, -1, -1);
  }

  return v1;
}

id WFSetupData.Builder.build()()
{
  uint64_t v0;
  int v1;
  char v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v1 = *(unsigned __int8 *)(v0 + 40);
  if (v1 == 2)
  {
    v2 = 2;
  }
  else
  {
    v3 = *(unsigned __int8 *)(v0 + 41);
    if (v3 == 2)
    {
      v2 = 5;
    }
    else if (*(_QWORD *)(v0 + 48))
    {
      if (*(_QWORD *)(v0 + 56))
      {
        if (*(_QWORD *)(v0 + 64))
        {
          v4 = *(unsigned __int8 *)(v0 + 72);
          if (v4 == 2)
          {
            v2 = 7;
          }
          else if (*(_QWORD *)(v0 + 88))
          {
            if (*(_QWORD *)(v0 + 136))
            {
              if (*(_QWORD *)(v0 + 152))
              {
                v5 = *(unsigned __int8 *)(v0 + 160);
                if (v5 == 2)
                {
                  v2 = 13;
                }
                else
                {
                  v6 = *(unsigned __int8 *)(v0 + 161);
                  if (v6 == 2)
                  {
                    v2 = 14;
                  }
                  else if (*(_QWORD *)(v0 + 176))
                  {
                    v7 = *(unsigned __int8 *)(v0 + 200);
                    if (v7 == 2)
                    {
                      v2 = 17;
                    }
                    else
                    {
                      v8 = *(unsigned __int8 *)(v0 + 201);
                      if (v8 == 2)
                      {
                        v2 = 18;
                      }
                      else
                      {
                        v9 = *(unsigned __int8 *)(v0 + 224);
                        if (v9 == 2)
                        {
                          v2 = 20;
                        }
                        else
                        {
                          v10 = *(unsigned __int8 *)(v0 + 225);
                          if (v10 == 2)
                          {
                            v2 = 21;
                          }
                          else
                          {
                            v55 = *(_QWORD *)(v0 + 176);
                            v53 = *(_QWORD *)(v0 + 136);
                            v54 = *(_QWORD *)(v0 + 152);
                            v51 = *(_QWORD *)(v0 + 64);
                            v52 = *(_QWORD *)(v0 + 88);
                            v49 = *(_QWORD *)(v0 + 48);
                            v50 = *(_QWORD *)(v0 + 56);
                            v11 = *(unsigned __int8 *)(v0 + 226);
                            if (v11 == 2)
                            {
                              v2 = 22;
                            }
                            else
                            {
                              v48 = *(unsigned __int8 *)(v0 + 227);
                              if (v48 == 2)
                              {
                                v2 = 23;
                              }
                              else
                              {
                                v47 = *(unsigned __int8 *)(v0 + 228);
                                if (v47 == 2)
                                {
                                  v2 = 24;
                                }
                                else
                                {
                                  v46 = *(unsigned __int8 *)(v0 + 256);
                                  if (v46 == 2)
                                  {
                                    v2 = 27;
                                  }
                                  else
                                  {
                                    v45 = *(unsigned __int8 *)(v0 + 257);
                                    if (v45 == 2)
                                    {
                                      v2 = 28;
                                    }
                                    else
                                    {
                                      v44 = *(unsigned __int8 *)(v0 + 258);
                                      if (v44 == 2)
                                      {
                                        v2 = 29;
                                      }
                                      else if ((*(_BYTE *)(v0 + 272) & 1) != 0)
                                      {
                                        v2 = 30;
                                      }
                                      else
                                      {
                                        v43 = *(_QWORD *)(v0 + 288);
                                        if (v43)
                                        {
                                          v40 = *(void **)(v0 + 296);
                                          if (v40)
                                          {
                                            v42 = *(_QWORD *)(v0 + 304);
                                            if (v42)
                                            {
                                              v28 = *(_QWORD *)(v0 + 80);
                                              v26 = *(_QWORD *)(v0 + 128);
                                              v21 = *(_QWORD *)(v0 + 168);
                                              v22 = *(_QWORD *)(v0 + 144);
                                              v19 = *(_QWORD *)(v0 + 280);
                                              v20 = *(_QWORD *)(v0 + 264);
                                              v27 = v3 & 1;
                                              v25 = v1 & 1;
                                              v39 = *(_QWORD *)(v0 + 16);
                                              v24 = *(_QWORD *)(v0 + 24);
                                              v37 = *(_QWORD *)(v0 + 96);
                                              v38 = *(_QWORD *)(v0 + 32);
                                              v36 = *(_QWORD *)(v0 + 104);
                                              v23 = *(_QWORD *)(v0 + 112);
                                              v35 = *(_QWORD *)(v0 + 120);
                                              v18 = *(_QWORD *)(v0 + 184);
                                              v32 = *(_QWORD *)(v0 + 208);
                                              v33 = *(_QWORD *)(v0 + 216);
                                              v34 = *(_QWORD *)(v0 + 192);
                                              v17 = *(_QWORD *)(v0 + 232);
                                              v30 = *(_QWORD *)(v0 + 240);
                                              v31 = *(void **)(v0 + 248);
                                              v12 = *(_QWORD *)(v0 + 312);
                                              v13 = *(_QWORD *)(v0 + 320);
                                              v29 = v12;
                                              objc_allocWithZone((Class)type metadata accessor for WFSetupData());
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              v41 = v40;
                                              swift_bridgeObjectRetain();
                                              swift_unknownObjectRetain();
                                              sub_247CB5C68(v37, v36);
                                              swift_bridgeObjectRetain();
                                              swift_bridgeObjectRetain();
                                              sub_247CB5C68(v32, v33);
                                              v14 = v31;
                                              swift_bridgeObjectRetain();
                                              sub_247CB5C68(v29, v13);
                                              return WFSetupData.init(keyboards:appleID:usesSameAccountForiTunes:isConnectedToWiFi:networks:networkPasswords:localePreferences:isAutomaticTimeZoneEnabled:timeZone:accessibilitySettings:firstName:deviceModel:deviceClass:hasHomeButton:isRestoring:deviceName:backupUUID:isBackupEnabled:isOptedInToLocationServices:isOptedInToDeviceAnalytics:locationServicesData:isOptedInToFindMyDevice:isOptedInToAppAnalytics:siriAssistantIsEnabled:siriVoiceTriggerIsEnabled:siriAssistantLanguageCode:siriAssistantOutputVoice:siriDataSharingIsEnabled:dictationIsEnabled:suppressDictationOptIn:deviceTermsIdentifier:productVersion:anisetteDataProvider:prescriptionRecords:walletData:)(v39, v24, v38, v25, v27, v49, v50, v51, v4 & 1, v28, v52, v37, v36, v23, v35, v26, v53, v22, v54,
                                                       v5 & 1,
                                                       v6 & 1,
                                                       v21,
                                                       v55,
                                                       v18,
                                                       v34,
                                                       v7 & 1,
                                                       v8 & 1,
                                                       v11 & 1,
                                                       v32,
                                                       v33,
                                                       v9 & 1,
                                                       v10 & 1,
                                                       v48 & 1,
                                                       v47 & 1,
                                                       v17,
                                                       v30,
                                                       (uint64_t)v31,
                                                       v46 & 1,
                                                       v45 & 1,
                                                       v44 & 1,
                                                       v20,
                                                       v19,
                                                       v43,
                                                       (uint64_t)v41,
                                                       v42,
                                                       v29,
                                                       v13);
                                            }
                                            v2 = 33;
                                          }
                                          else
                                          {
                                            v2 = 32;
                                          }
                                        }
                                        else
                                        {
                                          v2 = 31;
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                  else
                  {
                    v2 = 15;
                  }
                }
              }
              else
              {
                v2 = 12;
              }
            }
            else
            {
              v2 = 11;
            }
          }
          else
          {
            v2 = 8;
          }
        }
        else
        {
          v2 = 6;
        }
      }
      else
      {
        v2 = 4;
      }
    }
    else
    {
      v2 = 3;
    }
  }
  sub_247CB5C24();
  swift_allocError();
  *v16 = v2;
  return (id)swift_willThrow();
}

uint64_t WFSetupData.Builder.setKeyboards(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_247CAF000, v5, v6, "Set keyboards.", v7, 2u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_QWORD *)(v2 + 16) = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setAppleID(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = v2;
  v6 = sub_247CEF598();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576F1D18 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v6, (uint64_t)qword_2576F4A30);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  swift_bridgeObjectRetain_n();
  v12 = sub_247CEF580();
  v13 = sub_247CEF6E8();
  if (os_log_type_enabled(v12, v13))
  {
    v21 = v7;
    v14 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v24 = v20;
    *(_DWORD *)v14 = 136315138;
    if (a2)
      v15 = a1;
    else
      v15 = 7104878;
    v22 = a1;
    if (a2)
      v16 = a2;
    else
      v16 = 0xE300000000000000;
    v19 = v14 + 4;
    swift_bridgeObjectRetain();
    v23 = sub_247CB5D84(v15, v16, &v24);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    a1 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v12, v13, "Set appleID: %s.", v14, 0xCu);
    v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v17, -1, -1);
    MEMORY[0x249590A5C](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v6);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  *(_QWORD *)(v3 + 24) = a1;
  *(_QWORD *)(v3 + 32) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setUsesSameAccountForiTunes(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set usesSameAccountForiTunes: %{BOOL}d.", v7, 8u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_BYTE *)(v2 + 40) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsConnectedToWiFi(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set isConnectedToWiFi: %{BOOL}d.", v7, 8u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_BYTE *)(v2 + 41) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setNetworks(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  swift_bridgeObjectRetain_n();
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v15 = v8;
    *(_DWORD *)v7 = 136315138;
    v9 = sub_247CB64B4();
    v10 = swift_bridgeObjectRetain();
    v11 = MEMORY[0x249590354](v10, v9);
    v13 = v12;
    swift_bridgeObjectRelease();
    sub_247CB5D84(v11, v13, &v15);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set networks: %s.", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v8, -1, -1);
    MEMORY[0x249590A5C](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(_QWORD *)(v2 + 48) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setNetworkPasswords(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_247CAF000, v5, v6, "Set networkPasswords", v7, 2u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_QWORD *)(v2 + 56) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setLocalePreferences(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  swift_bridgeObjectRetain_n();
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v13 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    v9 = sub_247CEF628();
    v11 = v10;
    swift_bridgeObjectRelease();
    sub_247CB5D84(v9, v11, &v13);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set localePreferences: %s.", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v8, -1, -1);
    MEMORY[0x249590A5C](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(_QWORD *)(v2 + 64) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsAutomaticTimeZoneEnabled(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set isAutomaticTimeZoneEnabled: %{BOOL}d.", v7, 8u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_BYTE *)(v2 + 72) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setTimeZone(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  if (qword_2576F1D18 != -1)
    swift_once();
  v6 = sub_247CEF598();
  __swift_project_value_buffer(v6, (uint64_t)qword_2576F4A30);
  swift_bridgeObjectRetain_n();
  v7 = sub_247CEF580();
  v8 = sub_247CEF6E8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v12 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_247CB5D84(a1, a2, &v12);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247CAF000, v7, v8, "Set timeZone: %s.", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v10, -1, -1);
    MEMORY[0x249590A5C](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(_QWORD *)(v3 + 80) = a1;
  *(_QWORD *)(v3 + 88) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setAccessibilitySettings(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = sub_247CEF598();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576F1D18 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v6, (uint64_t)qword_2576F4A30);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  sub_247CB5C68(a1, a2);
  sub_247CB5C68(a1, a2);
  v12 = sub_247CEF580();
  v13 = sub_247CEF6E8();
  if (os_log_type_enabled(v12, v13))
  {
    v26 = v6;
    v14 = swift_slowAlloc();
    v25 = v7;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc();
    v24 = v16;
    *(_DWORD *)v15 = 136315138;
    v28 = v16;
    if (a2 >> 60 == 15)
      v17 = 7104878;
    else
      v17 = 0x3E617461443CLL;
    if (a2 >> 60 == 15)
      v18 = 0xE300000000000000;
    else
      v18 = 0xE600000000000000;
    v27 = sub_247CB5D84(v17, v18, &v28);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CB64F0(a1, a2);
    sub_247CB64F0(a1, a2);
    _os_log_impl(&dword_247CAF000, v12, v13, "Set accessibilitySettings: %s.", v15, 0xCu);
    v19 = v24;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v19, -1, -1);
    MEMORY[0x249590A5C](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v26);
  }
  else
  {
    sub_247CB64F0(a1, a2);
    sub_247CB64F0(a1, a2);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  v20 = *(_QWORD *)(v3 + 96);
  v21 = *(_QWORD *)(v3 + 104);
  *(_QWORD *)(v3 + 96) = a1;
  *(_QWORD *)(v3 + 104) = a2;
  sub_247CB5C68(a1, a2);
  sub_247CB64F0(v20, v21);
  return swift_retain();
}

uint64_t WFSetupData.Builder.setFirstName(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = v2;
  v6 = sub_247CEF598();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576F1D18 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v6, (uint64_t)qword_2576F4A30);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  swift_bridgeObjectRetain_n();
  v12 = sub_247CEF580();
  v13 = sub_247CEF6E8();
  if (os_log_type_enabled(v12, v13))
  {
    v21 = v7;
    v14 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v24 = v20;
    *(_DWORD *)v14 = 136315138;
    if (a2)
      v15 = a1;
    else
      v15 = 7104878;
    v22 = a1;
    if (a2)
      v16 = a2;
    else
      v16 = 0xE300000000000000;
    v19 = v14 + 4;
    swift_bridgeObjectRetain();
    v23 = sub_247CB5D84(v15, v16, &v24);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    a1 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v12, v13, "Set firstName: %s.", v14, 0xCu);
    v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v17, -1, -1);
    MEMORY[0x249590A5C](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v6);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  *(_QWORD *)(v3 + 112) = a1;
  *(_QWORD *)(v3 + 120) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setDeviceModel(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = v2;
  v6 = sub_247CEF598();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576F1D18 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v6, (uint64_t)qword_2576F4A30);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  swift_bridgeObjectRetain_n();
  v12 = sub_247CEF580();
  v13 = sub_247CEF6E8();
  if (os_log_type_enabled(v12, v13))
  {
    v21 = v7;
    v14 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v24 = v20;
    *(_DWORD *)v14 = 136315138;
    if (a2)
      v15 = a1;
    else
      v15 = 7104878;
    v22 = a1;
    if (a2)
      v16 = a2;
    else
      v16 = 0xE300000000000000;
    v19 = v14 + 4;
    swift_bridgeObjectRetain();
    v23 = sub_247CB5D84(v15, v16, &v24);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    a1 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v12, v13, "Set deviceModel: %s.", v14, 0xCu);
    v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v17, -1, -1);
    MEMORY[0x249590A5C](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v6);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  *(_QWORD *)(v3 + 128) = a1;
  *(_QWORD *)(v3 + 136) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setDeviceClass(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = v2;
  v6 = sub_247CEF598();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576F1D18 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v6, (uint64_t)qword_2576F4A30);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  swift_bridgeObjectRetain_n();
  v12 = sub_247CEF580();
  v13 = sub_247CEF6E8();
  if (os_log_type_enabled(v12, v13))
  {
    v21 = v7;
    v14 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v24 = v20;
    *(_DWORD *)v14 = 136315138;
    if (a2)
      v15 = a1;
    else
      v15 = 7104878;
    v22 = a1;
    if (a2)
      v16 = a2;
    else
      v16 = 0xE300000000000000;
    v19 = v14 + 4;
    swift_bridgeObjectRetain();
    v23 = sub_247CB5D84(v15, v16, &v24);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    a1 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v12, v13, "Set deviceClass: %s.", v14, 0xCu);
    v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v17, -1, -1);
    MEMORY[0x249590A5C](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v6);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  *(_QWORD *)(v3 + 144) = a1;
  *(_QWORD *)(v3 + 152) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setHasHomeButton(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set hasHomeButton: %{BOOL}d.", v7, 8u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_BYTE *)(v2 + 160) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsRestoring(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set isRestoring: %{BOOL}d.", v7, 8u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_BYTE *)(v2 + 161) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setDeviceName(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = v2;
  v6 = sub_247CEF598();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576F1D18 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v6, (uint64_t)qword_2576F4A30);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  swift_bridgeObjectRetain_n();
  v12 = sub_247CEF580();
  v13 = sub_247CEF6E8();
  if (os_log_type_enabled(v12, v13))
  {
    v21 = v7;
    v14 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v24 = v20;
    *(_DWORD *)v14 = 136315138;
    if (a2)
      v15 = a1;
    else
      v15 = 7104878;
    v22 = a1;
    if (a2)
      v16 = a2;
    else
      v16 = 0xE300000000000000;
    v19 = v14 + 4;
    swift_bridgeObjectRetain();
    v23 = sub_247CB5D84(v15, v16, &v24);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    a1 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v12, v13, "Set deviceName: %s.", v14, 0xCu);
    v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v17, -1, -1);
    MEMORY[0x249590A5C](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v6);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  *(_QWORD *)(v3 + 168) = a1;
  *(_QWORD *)(v3 + 176) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setBackupUUID(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;

  v3 = v2;
  if (qword_2576F1D18 != -1)
    swift_once();
  v6 = sub_247CEF598();
  __swift_project_value_buffer(v6, (uint64_t)qword_2576F4A30);
  swift_bridgeObjectRetain_n();
  v7 = sub_247CEF580();
  v8 = sub_247CEF6E8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F1D70);
    v11 = sub_247CEF664();
    sub_247CB5D84(v11, v12, &v14);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v7, v8, "Set backupUUID: %s.", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v10, -1, -1);
    MEMORY[0x249590A5C](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(_QWORD *)(v3 + 184) = a1;
  *(_QWORD *)(v3 + 192) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsBackupEnabled(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set isBackupEnabled: %{BOOL}d.", v7, 8u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_BYTE *)(v2 + 200) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsOptedInToLocationServices(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set isOptedInToLocationServices: %{BOOL}d.", v7, 8u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_BYTE *)(v2 + 201) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setLocationServicesData(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = sub_247CEF598();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576F1D18 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v6, (uint64_t)qword_2576F4A30);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  sub_247CB5C68(a1, a2);
  sub_247CB5C68(a1, a2);
  v12 = sub_247CEF580();
  v13 = sub_247CEF6E8();
  if (os_log_type_enabled(v12, v13))
  {
    v26 = v6;
    v14 = swift_slowAlloc();
    v25 = v7;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc();
    v24 = v16;
    *(_DWORD *)v15 = 136315138;
    v28 = v16;
    if (a2 >> 60 == 15)
      v17 = 7104878;
    else
      v17 = 0x3E617461443CLL;
    if (a2 >> 60 == 15)
      v18 = 0xE300000000000000;
    else
      v18 = 0xE600000000000000;
    v27 = sub_247CB5D84(v17, v18, &v28);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CB64F0(a1, a2);
    sub_247CB64F0(a1, a2);
    _os_log_impl(&dword_247CAF000, v12, v13, "Set locationServicesData: %s.", v15, 0xCu);
    v19 = v24;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v19, -1, -1);
    MEMORY[0x249590A5C](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v26);
  }
  else
  {
    sub_247CB64F0(a1, a2);
    sub_247CB64F0(a1, a2);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  v20 = *(_QWORD *)(v3 + 208);
  v21 = *(_QWORD *)(v3 + 216);
  *(_QWORD *)(v3 + 208) = a1;
  *(_QWORD *)(v3 + 216) = a2;
  sub_247CB5C68(a1, a2);
  sub_247CB64F0(v20, v21);
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsOptedInToFindMyDevice(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set isOptedInToFindMyDevice: %{BOOL}d.", v7, 8u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_BYTE *)(v2 + 224) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsOptedInToDeviceAnalytics(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set isOptedInToDeviceAnalytics: %{BOOL}d.", v7, 8u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_BYTE *)(v2 + 226) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setIsOptedInToAppAnalytics(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set isOptedInToAppAnalytics: %{BOOL}d.", v7, 8u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_BYTE *)(v2 + 225) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setSiriAssistantIsEnabled(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set siriAssistantIsEnabled: %{BOOL}d.", v7, 8u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_BYTE *)(v2 + 227) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setSiriVoiceTriggerIsEnabled(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set siriVoiceTriggerIsEnabled: %{BOOL}d.", v7, 8u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_BYTE *)(v2 + 228) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setSiriAssistantLanguageCode(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = v2;
  v6 = sub_247CEF598();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576F1D18 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v6, (uint64_t)qword_2576F4A30);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  swift_bridgeObjectRetain_n();
  v12 = sub_247CEF580();
  v13 = sub_247CEF6E8();
  if (os_log_type_enabled(v12, v13))
  {
    v21 = v7;
    v14 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v24 = v20;
    *(_DWORD *)v14 = 136315138;
    if (a2)
      v15 = a1;
    else
      v15 = 7104878;
    v22 = a1;
    if (a2)
      v16 = a2;
    else
      v16 = 0xE300000000000000;
    v19 = v14 + 4;
    swift_bridgeObjectRetain();
    v23 = sub_247CB5D84(v15, v16, &v24);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    a1 = v22;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v12, v13, "Set siriAssistantLanguageCode: %s.", v14, 0xCu);
    v17 = v20;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v17, -1, -1);
    MEMORY[0x249590A5C](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v6);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  *(_QWORD *)(v3 + 232) = a1;
  *(_QWORD *)(v3 + 240) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setSiriAssistantOutputVoice(_:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  id v14;
  void *v16;
  uint64_t v17;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = a1;
  v6 = sub_247CEF580();
  v7 = sub_247CEF6E8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v17 = v9;
    *(_DWORD *)v8 = 136315138;
    v16 = a1;
    v10 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F1D78);
    v11 = sub_247CEF664();
    sub_247CB5D84(v11, v12, &v17);
    sub_247CEF748();

    a1 = v16;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v6, v7, "Set siriAssistantOutputVoice: %s.", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v9, -1, -1);
    MEMORY[0x249590A5C](v8, -1, -1);

  }
  else
  {

  }
  v13 = *(void **)(v2 + 248);
  *(_QWORD *)(v2 + 248) = a1;
  v14 = v5;

  return swift_retain();
}

uint64_t WFSetupData.Builder.setSiriDataSharingIsEnabled(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set siriDataSharingIsEnabled: %{BOOL}d.", v7, 8u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_BYTE *)(v2 + 256) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setDictationIsEnabled(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set dictationIsEnabled: %{BOOL}d.", v7, 8u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_BYTE *)(v2 + 257) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setSuppressDictationOptIn(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 67109120;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set suppressDictationOptIn: %{BOOL}d.", v7, 8u);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_BYTE *)(v2 + 258) = a1 & 1;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setDeviceTermsIdentifier(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 134217984;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set deviceTermsIdentifier: %ld.", v7, 0xCu);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  *(_QWORD *)(v2 + 264) = a1;
  *(_BYTE *)(v2 + 272) = 0;
  return swift_retain();
}

uint64_t WFSetupData.Builder.setProductVersion(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  if (qword_2576F1D18 != -1)
    swift_once();
  v6 = sub_247CEF598();
  __swift_project_value_buffer(v6, (uint64_t)qword_2576F4A30);
  swift_bridgeObjectRetain_n();
  v7 = sub_247CEF580();
  v8 = sub_247CEF6E8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v12 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    sub_247CB5D84(a1, a2, &v12);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247CAF000, v7, v8, "Set productVersion: %s.", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v10, -1, -1);
    MEMORY[0x249590A5C](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(_QWORD *)(v3 + 280) = a1;
  *(_QWORD *)(v3 + 288) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setAnisetteDataProvider(_:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v17;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  v5 = a1;
  v6 = sub_247CEF580();
  v7 = sub_247CEF6E8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v17 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = objc_msgSend(v5, sel_description);
    v11 = sub_247CEF658();
    v13 = v12;

    sub_247CB5D84(v11, v13, &v17);
    sub_247CEF748();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v6, v7, "Set anisetteDataProvider: %s.", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v9, -1, -1);
    MEMORY[0x249590A5C](v8, -1, -1);

  }
  else
  {

  }
  v14 = *(void **)(v2 + 296);
  *(_QWORD *)(v2 + 296) = v5;
  v15 = v5;

  return swift_retain();
}

uint64_t WFSetupData.Builder.setPrescriptionRecords(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;

  v2 = v1;
  if (qword_2576F1D18 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A30);
  swift_bridgeObjectRetain_n();
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v13 = v8;
    *(_DWORD *)v7 = 136315138;
    v9 = type metadata accessor for PrescriptionRecord();
    v10 = MEMORY[0x249590360](a1, v9);
    sub_247CB5D84(v10, v11, &v13);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v5, v6, "Set prescription records: %s.", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v8, -1, -1);
    MEMORY[0x249590A5C](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  *(_QWORD *)(v2 + 304) = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t WFSetupData.Builder.setWalletData(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = sub_247CEF598();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576F1D18 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v6, (uint64_t)qword_2576F4A30);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
  sub_247CB5C68(a1, a2);
  sub_247CB5C68(a1, a2);
  v12 = sub_247CEF580();
  v13 = sub_247CEF6E8();
  if (os_log_type_enabled(v12, v13))
  {
    v26 = v6;
    v14 = swift_slowAlloc();
    v25 = v7;
    v15 = (uint8_t *)v14;
    v16 = swift_slowAlloc();
    v24 = v16;
    *(_DWORD *)v15 = 136315138;
    v28 = v16;
    if (a2 >> 60 == 15)
      v17 = 7104878;
    else
      v17 = 0x3E617461443CLL;
    if (a2 >> 60 == 15)
      v18 = 0xE300000000000000;
    else
      v18 = 0xE600000000000000;
    v27 = sub_247CB5D84(v17, v18, &v28);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CB64F0(a1, a2);
    sub_247CB64F0(a1, a2);
    _os_log_impl(&dword_247CAF000, v12, v13, "Set wallet data: %s.", v15, 0xCu);
    v19 = v24;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v19, -1, -1);
    MEMORY[0x249590A5C](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v26);
  }
  else
  {
    sub_247CB64F0(a1, a2);
    sub_247CB64F0(a1, a2);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  v20 = *(_QWORD *)(v3 + 312);
  v21 = *(_QWORD *)(v3 + 320);
  *(_QWORD *)(v3 + 312) = a1;
  *(_QWORD *)(v3 + 320) = a2;
  sub_247CB5C68(a1, a2);
  sub_247CB64F0(v20, v21);
  return swift_retain();
}

uint64_t WFSetupData.Builder.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247CB64F0(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247CB64F0(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 216));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247CB64F0(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 320));
  return v0;
}

uint64_t WFSetupData.Builder.__deallocating_deinit()
{
  WFSetupData.Builder.deinit();
  return swift_deallocClassInstance();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_247CB5C14(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

unint64_t sub_247CB5C24()
{
  unint64_t result;

  result = qword_2576F1D68;
  if (!qword_2576F1D68)
  {
    result = MEMORY[0x2495909F0](&protocol conformance descriptor for WFSetupData.BuildError, &type metadata for WFSetupData.BuildError);
    atomic_store(result, (unint64_t *)&qword_2576F1D68);
  }
  return result;
}

uint64_t sub_247CB5C68(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_247CB5C7C(a1, a2);
  return a1;
}

uint64_t sub_247CB5C7C(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_247CB5CC0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_247CB5CF4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_247CB5D14(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_247CB5D84(v6, v7, a3);
  v8 = *a1 + 8;
  sub_247CEF748();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_247CB5D84(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_247CB5E54(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_247CB674C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_247CB674C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_247CB5E54(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_247CEF754();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_247CB600C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_247CEF7C0();
  if (!v8)
  {
    sub_247CEF808();
    __break(1u);
LABEL_17:
    result = sub_247CEF844();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_247CB600C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_247CB60A0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_247CB6278(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_247CB6278(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_247CB60A0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_247CB6214(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_247CEF7A8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_247CEF808();
      __break(1u);
LABEL_10:
      v2 = sub_247CEF694();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_247CEF844();
    __break(1u);
LABEL_14:
    result = sub_247CEF808();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_247CB6214(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2398);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_247CB6278(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2398);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_247CEF844();
  __break(1u);
  return result;
}

_BYTE **sub_247CB63C4(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *sub_247CB63D4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_247CEF844();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_247CB6468(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_247CB648C@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_247CB64B4()
{
  unint64_t result;

  result = qword_2576F2DE0;
  if (!qword_2576F2DE0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2576F2DE0);
  }
  return result;
}

uint64_t sub_247CB64F0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_247CB6504(a1, a2);
  return a1;
}

uint64_t sub_247CB6504(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495909D8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_247CB6588@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WFSetupData.PropertyKey(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xDE)
    goto LABEL_17;
  if (a2 + 34 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 34) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 34;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 34;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 34;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x23;
  v8 = v6 - 35;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s10BuildErrorOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 34 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 34) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xDE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xDD)
    return ((uint64_t (*)(void))((char *)&loc_247CB66A0 + 4 * byte_247CF0B1D[v4]))();
  *a1 = a2 + 34;
  return ((uint64_t (*)(void))((char *)sub_247CB66D4 + 4 * byte_247CF0B18[v4]))();
}

uint64_t sub_247CB66D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CB66DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247CB66E4);
  return result;
}

uint64_t sub_247CB66F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247CB66F8);
  *(_BYTE *)result = a2 + 34;
  return result;
}

uint64_t sub_247CB66FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CB6704(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CB6710()
{
  return 0;
}

ValueMetadata *type metadata accessor for WFSetupData.BuildError()
{
  return &type metadata for WFSetupData.BuildError;
}

uint64_t type metadata accessor for WFSetupData.Builder()
{
  return objc_opt_self();
}

uint64_t sub_247CB674C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_247CB678C(unsigned __int8 a1)
{
  unint64_t result;

  result = 0xD00000000000001CLL;
  if (a1 >= 2u)
    return 0xD000000000000014;
  return result;
}

void sub_247CB67E8(char a1)
{
  sub_247CEF910();
  __asm { BR              X10 }
}

uint64_t sub_247CB6840()
{
  sub_247CEF670();
  swift_bridgeObjectRelease();
  return sub_247CEF928();
}

uint64_t sub_247CB68A4()
{
  sub_247CEF910();
  sub_247CEF670();
  swift_bridgeObjectRelease();
  return sub_247CEF928();
}

uint64_t sub_247CB690C()
{
  sub_247CEF910();
  sub_247CEF670();
  swift_bridgeObjectRelease();
  return sub_247CEF928();
}

void sub_247CB6974(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_247CB69B8()
{
  sub_247CEF670();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247CB6A00()
{
  sub_247CEF670();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247CB6A40()
{
  sub_247CEF670();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247CB6A80()
{
  sub_247CEF910();
  sub_247CEF670();
  swift_bridgeObjectRelease();
  return sub_247CEF928();
}

uint64_t sub_247CB6AE4()
{
  sub_247CEF910();
  sub_247CEF670();
  swift_bridgeObjectRelease();
  return sub_247CEF928();
}

void sub_247CB6B48(uint64_t a1, char a2)
{
  sub_247CEF910();
  __asm { BR              X10 }
}

uint64_t sub_247CB6B9C()
{
  sub_247CEF670();
  swift_bridgeObjectRelease();
  return sub_247CEF928();
}

uint64_t WFSetupRequestKey.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_247CB6C3C + 4 * byte_247CF0CEC[a1]))(0xD000000000000015, 0x8000000247CF2070);
}

void sub_247CB6C70(char *a1)
{
  sub_247CBCF70(*a1);
}

void sub_247CB6C7C()
{
  char *v0;

  sub_247CB67E8(*v0);
}

void sub_247CB6C84(uint64_t a1)
{
  char *v1;

  sub_247CB6974(a1, *v1);
}

void sub_247CB6C8C(uint64_t a1)
{
  char *v1;

  sub_247CB6B48(a1, *v1);
}

uint64_t sub_247CB6C94@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s10TDGSharing17WFSetupRequestKeyO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_247CB6CC0@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = WFSetupRequestKey.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

BOOL WFSetupResponseKey.init(rawValue:)()
{
  uint64_t v0;

  v0 = sub_247CEF850();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

unint64_t WFSetupResponseKey.rawValue.getter()
{
  return 0xD000000000000015;
}

uint64_t sub_247CB6D48()
{
  return 1;
}

uint64_t sub_247CB6D50()
{
  sub_247CEF910();
  sub_247CEF670();
  return sub_247CEF928();
}

uint64_t sub_247CB6DA4()
{
  return sub_247CEF670();
}

uint64_t sub_247CB6DC0()
{
  sub_247CEF910();
  sub_247CEF670();
  return sub_247CEF928();
}

uint64_t sub_247CB6E10@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_247CEF850();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_247CB6E60(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x8000000247CF2070;
}

uint64_t _s10TDGSharing17WFSetupRequestKeyO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_247CEF850();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

unint64_t sub_247CB6ECC()
{
  unint64_t result;

  result = qword_2576F23A0;
  if (!qword_2576F23A0)
  {
    result = MEMORY[0x2495909F0](&protocol conformance descriptor for WFSetupRequestKey, &type metadata for WFSetupRequestKey);
    atomic_store(result, (unint64_t *)&qword_2576F23A0);
  }
  return result;
}

unint64_t sub_247CB6F14()
{
  unint64_t result;

  result = qword_2576F23A8;
  if (!qword_2576F23A8)
  {
    result = MEMORY[0x2495909F0](&protocol conformance descriptor for WFSetupResponseKey, &type metadata for WFSetupResponseKey);
    atomic_store(result, (unint64_t *)&qword_2576F23A8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for WFSetupRequestKey(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WFSetupRequestKey(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_247CB7034 + 4 * byte_247CF0CF5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_247CB7068 + 4 * byte_247CF0CF0[v4]))();
}

uint64_t sub_247CB7068(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CB7070(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247CB7078);
  return result;
}

uint64_t sub_247CB7084(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247CB708CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_247CB7090(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CB7098(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CB70A4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_247CB70AC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for WFSetupRequestKey()
{
  return &type metadata for WFSetupRequestKey;
}

uint64_t getEnumTagSinglePayload for WFSetupResponseKey(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for WFSetupResponseKey(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_247CB7158 + 4 * byte_247CF0CFA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_247CB7178 + 4 * byte_247CF0CFF[v4]))();
}

_BYTE *sub_247CB7158(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_247CB7178(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247CB7180(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247CB7188(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247CB7190(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247CB7198(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for WFSetupResponseKey()
{
  return &type metadata for WFSetupResponseKey;
}

uint64_t WFSetupData.PropertyKey.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_247CB71EC + 4 * byte_247CF0F18[a1]))(0xD000000000000018, 0x8000000247CF20F0);
}

uint64_t sub_247CB71EC()
{
  return 0x6472616F6279656BLL;
}

uint64_t sub_247CB720C()
{
  return 0x4449656C707061;
}

uint64_t sub_247CB7224()
{
  return 0x736B726F7774656ELL;
}

uint64_t sub_247CB723C(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_247CB74B8()
{
  return 0x614474656C6C6177;
}

id WFSetupData.__allocating_init(keyboards:appleID:usesSameAccountForiTunes:isConnectedToWiFi:networks:networkPasswords:localePreferences:isAutomaticTimeZoneEnabled:timeZone:accessibilitySettings:firstName:deviceModel:deviceClass:hasHomeButton:isRestoring:deviceName:backupUUID:isBackupEnabled:isOptedInToLocationServices:isOptedInToDeviceAnalytics:locationServicesData:isOptedInToFindMyDevice:isOptedInToAppAnalytics:siriAssistantIsEnabled:siriVoiceTriggerIsEnabled:siriAssistantLanguageCode:siriAssistantOutputVoice:siriDataSharingIsEnabled:dictationIsEnabled:suppressDictationOptIn:deviceTermsIdentifier:productVersion:anisetteDataProvider:prescriptionRecords:walletData:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, __int128 a10, __int128 a11, __int128 a12, __int128 a13, uint64_t a14, uint64_t a15, char a16, char a17, __int128 a18, uint64_t a19, uint64_t a20,char a21,char a22,char a23,uint64_t a24,uint64_t a25,char a26,char a27,char a28,char a29,__int128 a30,uint64_t a31,char a32,char a33,char a34,__int128 a35,__int128 a36,__int128 a37,uint64_t a38)
{
  objc_class *v38;
  id v39;

  v39 = objc_allocWithZone(v38);
  return WFSetupData.init(keyboards:appleID:usesSameAccountForiTunes:isConnectedToWiFi:networks:networkPasswords:localePreferences:isAutomaticTimeZoneEnabled:timeZone:accessibilitySettings:firstName:deviceModel:deviceClass:hasHomeButton:isRestoring:deviceName:backupUUID:isBackupEnabled:isOptedInToLocationServices:isOptedInToDeviceAnalytics:locationServicesData:isOptedInToFindMyDevice:isOptedInToAppAnalytics:siriAssistantIsEnabled:siriVoiceTriggerIsEnabled:siriAssistantLanguageCode:siriAssistantOutputVoice:siriDataSharingIsEnabled:dictationIsEnabled:suppressDictationOptIn:deviceTermsIdentifier:productVersion:anisetteDataProvider:prescriptionRecords:walletData:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, *((uint64_t *)&a10 + 1), a11, *((uint64_t *)&a11 + 1), a12, *((uint64_t *)&a12 + 1), a13, *((uint64_t *)&a13 + 1), a14, a15,
           a16,
           a17,
           a18,
           *((uint64_t *)&a18 + 1),
           a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           *((uint64_t *)&a30 + 1),
           a31,
           a32,
           a33,
           a34,
           a35,
           *((uint64_t *)&a35 + 1),
           a36,
           *((uint64_t *)&a36 + 1),
           a37,
           *((uint64_t *)&a37 + 1),
           a38);
}

uint64_t WFSetupData.version.getter()
{
  return 0;
}

uint64_t WFSetupData.keyboards.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t WFSetupData.appleID.getter()
{
  return sub_247CB7CB0(&OBJC_IVAR___WFSetupDataInternal_appleID);
}

uint64_t WFSetupData.usesSameAccountForiTunes.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_usesSameAccountForiTunes);
}

uint64_t WFSetupData.walletData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WFSetupDataInternal_walletData);
  sub_247CB5C68(v1, *(_QWORD *)(v0 + OBJC_IVAR___WFSetupDataInternal_walletData + 8));
  return v1;
}

uint64_t WFSetupData.isConnectedToWiFi.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isConnectedToWiFi);
}

uint64_t WFSetupData.networks.getter()
{
  return swift_bridgeObjectRetain();
}

id sub_247CB77F0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  void *v4;

  sub_247CBBA5C(0, a4);
  swift_bridgeObjectRetain();
  v4 = (void *)sub_247CEF6A0();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t WFSetupData.networkPasswords.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WFSetupData.localePreferences.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t WFSetupData.isAutomaticTimeZoneEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isAutomaticTimeZoneEnabled);
}

uint64_t WFSetupData.timeZone.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WFSetupDataInternal_timeZone);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WFSetupData.accessibilitySettings.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WFSetupDataInternal_accessibilitySettings);
  sub_247CB5C68(v1, *(_QWORD *)(v0 + OBJC_IVAR___WFSetupDataInternal_accessibilitySettings + 8));
  return v1;
}

uint64_t WFSetupData.firstName.getter()
{
  return sub_247CB7CB0(&OBJC_IVAR___WFSetupDataInternal_firstName);
}

uint64_t WFSetupData.deviceModel.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WFSetupDataInternal_deviceModel);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WFSetupData.deviceClass.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WFSetupDataInternal_deviceClass);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WFSetupData.hasHomeButton.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_hasHomeButton);
}

uint64_t WFSetupData.isRestoring.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isRestoring);
}

uint64_t WFSetupData.deviceName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WFSetupDataInternal_deviceName);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t WFSetupData.backupUUID.getter()
{
  return sub_247CB7CB0(&OBJC_IVAR___WFSetupDataInternal_backupUUID);
}

uint64_t WFSetupData.isBackupEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isBackupEnabled);
}

uint64_t WFSetupData.isOptedInToLocationServices.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isOptedInToLocationServices);
}

id sub_247CB7AF4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = a1 + *a3;
  v4 = *(_QWORD *)(v3 + 8);
  if (v4 >> 60 == 15)
  {
    v5 = 0;
  }
  else
  {
    v6 = *(_QWORD *)v3;
    sub_247CB5C7C(*(_QWORD *)v3, *(_QWORD *)(v3 + 8));
    v5 = (void *)sub_247CEF4F0();
    sub_247CB64F0(v6, v4);
  }
  return v5;
}

uint64_t WFSetupData.locationServicesData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WFSetupDataInternal_locationServicesData);
  sub_247CB5C68(v1, *(_QWORD *)(v0 + OBJC_IVAR___WFSetupDataInternal_locationServicesData + 8));
  return v1;
}

uint64_t WFSetupData.isOptedInToFindMyDevice.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isOptedInToFindMyDevice);
}

uint64_t WFSetupData.isOptedInToDeviceAnalytics.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isOptedInToDeviceAnalytics);
}

uint64_t WFSetupData.isOptedInToAppAnalytics.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_isOptedInToAppAnalytics);
}

uint64_t WFSetupData.siriAssistantIsEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_siriAssistantIsEnabled);
}

uint64_t WFSetupData.siriVoiceTriggerIsEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_siriVoiceTriggerIsEnabled);
}

id sub_247CB7C4C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v3;

  if (*(_QWORD *)(a1 + *a3 + 8))
  {
    swift_bridgeObjectRetain();
    v3 = (void *)sub_247CEF64C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

uint64_t WFSetupData.siriAssistantLanguageCode.getter()
{
  return sub_247CB7CB0(&OBJC_IVAR___WFSetupDataInternal_siriAssistantLanguageCode);
}

uint64_t sub_247CB7CB0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *a1);
  swift_bridgeObjectRetain();
  return v2;
}

void *WFSetupData.siriAssistantOutputVoice.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___WFSetupDataInternal_siriAssistantOutputVoice);
  v2 = v1;
  return v1;
}

uint64_t WFSetupData.siriDataSharingIsEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_siriDataSharingIsEnabled);
}

uint64_t WFSetupData.dictationIsEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_dictationIsEnabled);
}

uint64_t WFSetupData.suppressDictationOptIn.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___WFSetupDataInternal_suppressDictationOptIn);
}

uint64_t WFSetupData.deviceTermsIdentifier.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR___WFSetupDataInternal_deviceTermsIdentifier);
}

id sub_247CB7DAC()
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_247CEF64C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t WFSetupData.productVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WFSetupDataInternal_productVersion);
  swift_bridgeObjectRetain();
  return v1;
}

id WFSetupData.anisetteDataProvider.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___WFSetupDataInternal_anisetteDataProvider);
}

uint64_t WFSetupData.prescriptionRecords.getter()
{
  return swift_bridgeObjectRetain();
}

id WFSetupData.init(keyboards:appleID:usesSameAccountForiTunes:isConnectedToWiFi:networks:networkPasswords:localePreferences:isAutomaticTimeZoneEnabled:timeZone:accessibilitySettings:firstName:deviceModel:deviceClass:hasHomeButton:isRestoring:deviceName:backupUUID:isBackupEnabled:isOptedInToLocationServices:isOptedInToDeviceAnalytics:locationServicesData:isOptedInToFindMyDevice:isOptedInToAppAnalytics:siriAssistantIsEnabled:siriVoiceTriggerIsEnabled:siriAssistantLanguageCode:siriAssistantOutputVoice:siriDataSharingIsEnabled:dictationIsEnabled:suppressDictationOptIn:deviceTermsIdentifier:productVersion:anisetteDataProvider:prescriptionRecords:walletData:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, char a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,char a27,char a28,uint64_t a29,uint64_t a30,char a31,char a32,char a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,char a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47)
{
  _BYTE *v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  objc_super v61;

  *(_QWORD *)&v47[OBJC_IVAR___WFSetupDataInternal_version] = 0;
  *(_QWORD *)&v47[OBJC_IVAR___WFSetupDataInternal_keyboards] = a1;
  v48 = &v47[OBJC_IVAR___WFSetupDataInternal_appleID];
  *v48 = a2;
  v48[1] = a3;
  v47[OBJC_IVAR___WFSetupDataInternal_usesSameAccountForiTunes] = a4;
  v47[OBJC_IVAR___WFSetupDataInternal_isConnectedToWiFi] = a5;
  *(_QWORD *)&v47[OBJC_IVAR___WFSetupDataInternal_networks] = a6;
  *(_QWORD *)&v47[OBJC_IVAR___WFSetupDataInternal_networkPasswords] = a7;
  *(_QWORD *)&v47[OBJC_IVAR___WFSetupDataInternal_localePreferences] = a8;
  v47[OBJC_IVAR___WFSetupDataInternal_isAutomaticTimeZoneEnabled] = a9;
  v49 = &v47[OBJC_IVAR___WFSetupDataInternal_timeZone];
  *v49 = a10;
  v49[1] = a11;
  v50 = &v47[OBJC_IVAR___WFSetupDataInternal_accessibilitySettings];
  *v50 = a12;
  v50[1] = a13;
  v51 = &v47[OBJC_IVAR___WFSetupDataInternal_firstName];
  *v51 = a14;
  v51[1] = a15;
  v52 = &v47[OBJC_IVAR___WFSetupDataInternal_deviceModel];
  *v52 = a16;
  v52[1] = a17;
  v53 = &v47[OBJC_IVAR___WFSetupDataInternal_deviceClass];
  *v53 = a18;
  v53[1] = a19;
  v47[OBJC_IVAR___WFSetupDataInternal_hasHomeButton] = a20;
  v47[OBJC_IVAR___WFSetupDataInternal_isRestoring] = a21;
  v54 = &v47[OBJC_IVAR___WFSetupDataInternal_deviceName];
  *v54 = a22;
  v54[1] = a23;
  v55 = &v47[OBJC_IVAR___WFSetupDataInternal_backupUUID];
  *v55 = a24;
  v55[1] = a25;
  v47[OBJC_IVAR___WFSetupDataInternal_isBackupEnabled] = a26;
  v47[OBJC_IVAR___WFSetupDataInternal_isOptedInToLocationServices] = a27;
  v47[OBJC_IVAR___WFSetupDataInternal_isOptedInToDeviceAnalytics] = a28;
  v56 = &v47[OBJC_IVAR___WFSetupDataInternal_locationServicesData];
  *v56 = a29;
  v56[1] = a30;
  v47[OBJC_IVAR___WFSetupDataInternal_isOptedInToFindMyDevice] = a31;
  v47[OBJC_IVAR___WFSetupDataInternal_isOptedInToAppAnalytics] = a32;
  v47[OBJC_IVAR___WFSetupDataInternal_siriAssistantIsEnabled] = a33;
  v47[OBJC_IVAR___WFSetupDataInternal_siriVoiceTriggerIsEnabled] = a34;
  v57 = &v47[OBJC_IVAR___WFSetupDataInternal_siriAssistantLanguageCode];
  *v57 = a35;
  v57[1] = a36;
  *(_QWORD *)&v47[OBJC_IVAR___WFSetupDataInternal_siriAssistantOutputVoice] = a37;
  v47[OBJC_IVAR___WFSetupDataInternal_siriDataSharingIsEnabled] = a38;
  v47[OBJC_IVAR___WFSetupDataInternal_dictationIsEnabled] = a39;
  v47[OBJC_IVAR___WFSetupDataInternal_suppressDictationOptIn] = a40;
  *(_QWORD *)&v47[OBJC_IVAR___WFSetupDataInternal_deviceTermsIdentifier] = a41;
  v58 = &v47[OBJC_IVAR___WFSetupDataInternal_productVersion];
  *v58 = a42;
  v58[1] = a43;
  *(_QWORD *)&v47[OBJC_IVAR___WFSetupDataInternal_anisetteDataProvider] = a44;
  *(_QWORD *)&v47[OBJC_IVAR___WFSetupDataInternal_prescriptionRecords] = a45;
  v59 = &v47[OBJC_IVAR___WFSetupDataInternal_walletData];
  *v59 = a46;
  v59[1] = a47;
  v61.receiver = v47;
  v61.super_class = (Class)type metadata accessor for WFSetupData();
  return objc_msgSendSuper2(&v61, sel_init);
}

uint64_t type metadata accessor for WFSetupData()
{
  return objc_opt_self();
}

uint64_t static WFSetupData.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall WFSetupData.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  unint64_t v78;
  __int128 v79;
  __int128 v80;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_keyboards);
  if (v4)
  {
    *((_QWORD *)&v80 + 1) = swift_getObjectType();
    *(_QWORD *)&v79 = v4;
  }
  else
  {
    v79 = 0u;
    v80 = 0u;
  }
  swift_unknownObjectRetain();
  sub_247CB9200((uint64_t)&v79, 0);
  sub_247CB9318((uint64_t)&v79);
  v5 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_appleID + 8);
  if (v5)
  {
    v6 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_appleID);
    *((_QWORD *)&v80 + 1) = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v79 = v6;
    *((_QWORD *)&v79 + 1) = v5;
  }
  else
  {
    v79 = 0u;
    v80 = 0u;
  }
  swift_bridgeObjectRetain();
  sub_247CB9200((uint64_t)&v79, 1u);
  sub_247CB9318((uint64_t)&v79);
  v7 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_usesSameAccountForiTunes);
  v8 = (void *)sub_247CEF64C();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v7, v8, v79);

  *(_QWORD *)&v79 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_networks);
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F24D8);
  v9 = sub_247CEF8B0();
  v10 = (void *)sub_247CEF64C();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v9, v10);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  *(_QWORD *)&v79 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_networkPasswords);
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F24E0);
  v11 = sub_247CEF8B0();
  v12 = (void *)sub_247CEF64C();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v11, v12);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  v13 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isConnectedToWiFi);
  v14 = (void *)sub_247CEF64C();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v13, v14);

  *(_QWORD *)&v79 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_localePreferences);
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F24E8);
  v15 = sub_247CEF8B0();
  v16 = (void *)sub_247CEF64C();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v15, v16);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  v17 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isAutomaticTimeZoneEnabled);
  v18 = (void *)sub_247CEF64C();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v17, v18);

  v19 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_timeZone + 8);
  *(_QWORD *)&v79 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_timeZone);
  *((_QWORD *)&v79 + 1) = v19;
  swift_bridgeObjectRetain_n();
  v20 = MEMORY[0x24BEE0D00];
  v21 = sub_247CEF8B0();
  v22 = (void *)sub_247CEF64C();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v21, v22);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  v23 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_accessibilitySettings);
  v24 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_accessibilitySettings + 8);
  if (v24 >> 60 == 15)
  {
    v79 = 0u;
    v80 = 0u;
  }
  else
  {
    *((_QWORD *)&v80 + 1) = MEMORY[0x24BDCDDE8];
    *(_QWORD *)&v79 = v23;
    *((_QWORD *)&v79 + 1) = v24;
  }
  sub_247CB5C68(v23, v24);
  sub_247CB9200((uint64_t)&v79, 9u);
  sub_247CB9318((uint64_t)&v79);
  v25 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_firstName + 8);
  if (v25)
  {
    v26 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_firstName);
    *((_QWORD *)&v80 + 1) = v20;
    *(_QWORD *)&v79 = v26;
    *((_QWORD *)&v79 + 1) = v25;
  }
  else
  {
    v79 = 0u;
    v80 = 0u;
  }
  swift_bridgeObjectRetain();
  sub_247CB9200((uint64_t)&v79, 0xAu);
  sub_247CB9318((uint64_t)&v79);
  v27 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_deviceModel + 8);
  *(_QWORD *)&v79 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_deviceModel);
  *((_QWORD *)&v79 + 1) = v27;
  swift_bridgeObjectRetain_n();
  v28 = sub_247CEF8B0();
  v29 = (void *)sub_247CEF64C();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v28, v29);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  v30 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_deviceClass + 8);
  *(_QWORD *)&v79 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_deviceClass);
  *((_QWORD *)&v79 + 1) = v30;
  swift_bridgeObjectRetain_n();
  v31 = sub_247CEF8B0();
  v32 = (void *)sub_247CEF64C();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v31, v32);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  v33 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_hasHomeButton);
  v34 = (void *)sub_247CEF64C();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v33, v34);

  v35 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isRestoring);
  v36 = (void *)sub_247CEF64C();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v35, v36);

  v37 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_deviceName + 8);
  *(_QWORD *)&v79 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_deviceName);
  *((_QWORD *)&v79 + 1) = v37;
  swift_bridgeObjectRetain_n();
  v38 = sub_247CEF8B0();
  v39 = (void *)sub_247CEF64C();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v38, v39);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  v40 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_backupUUID + 8);
  if (v40)
  {
    v41 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_backupUUID);
    *((_QWORD *)&v80 + 1) = v20;
    *(_QWORD *)&v79 = v41;
    *((_QWORD *)&v79 + 1) = v40;
  }
  else
  {
    v79 = 0u;
    v80 = 0u;
  }
  swift_bridgeObjectRetain();
  sub_247CB9200((uint64_t)&v79, 0x10u);
  sub_247CB9318((uint64_t)&v79);
  v42 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isBackupEnabled);
  v43 = (void *)sub_247CEF64C();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v42, v43, v79);

  v44 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isOptedInToLocationServices);
  v45 = (void *)sub_247CEF64C();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v44, v45);

  v46 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_locationServicesData);
  v47 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_locationServicesData + 8);
  if (v47 >> 60 == 15)
  {
    v79 = 0u;
    v80 = 0u;
  }
  else
  {
    *((_QWORD *)&v80 + 1) = MEMORY[0x24BDCDDE8];
    *(_QWORD *)&v79 = v46;
    *((_QWORD *)&v79 + 1) = v47;
  }
  sub_247CB5C68(v46, v47);
  sub_247CB9200((uint64_t)&v79, 0x13u);
  sub_247CB9318((uint64_t)&v79);
  v48 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isOptedInToFindMyDevice);
  v49 = (void *)sub_247CEF64C();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v48, v49, v79);

  v50 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isOptedInToAppAnalytics);
  v51 = (void *)sub_247CEF64C();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v50, v51);

  v52 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_isOptedInToDeviceAnalytics);
  v53 = (void *)sub_247CEF64C();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v52, v53);

  v54 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_siriAssistantIsEnabled);
  v55 = (void *)sub_247CEF64C();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v54, v55);

  v56 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_siriVoiceTriggerIsEnabled);
  v57 = (void *)sub_247CEF64C();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v56, v57);

  v58 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_siriAssistantLanguageCode + 8);
  if (v58)
  {
    v59 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_siriAssistantLanguageCode);
    *((_QWORD *)&v80 + 1) = v20;
    *(_QWORD *)&v79 = v59;
    *((_QWORD *)&v79 + 1) = v58;
  }
  else
  {
    v79 = 0u;
    v80 = 0u;
  }
  swift_bridgeObjectRetain();
  sub_247CB9200((uint64_t)&v79, 0x19u);
  sub_247CB9318((uint64_t)&v79);
  v60 = *(void **)(v2 + OBJC_IVAR___WFSetupDataInternal_siriAssistantOutputVoice);
  if (v60)
  {
    *((_QWORD *)&v80 + 1) = sub_247CBBA5C(0, &qword_2576F24F8);
    *(_QWORD *)&v79 = v60;
  }
  else
  {
    v79 = 0u;
    v80 = 0u;
  }
  v61 = v60;
  sub_247CB9200((uint64_t)&v79, 0x1Au);
  sub_247CB9318((uint64_t)&v79);
  v62 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_siriDataSharingIsEnabled);
  v63 = (void *)sub_247CEF64C();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v62, v63, v79);

  v64 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_dictationIsEnabled);
  v65 = (void *)sub_247CEF64C();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v64, v65);

  v66 = *(unsigned __int8 *)(v2 + OBJC_IVAR___WFSetupDataInternal_suppressDictationOptIn);
  v67 = (void *)sub_247CEF64C();
  -[objc_class encodeBool:forKey:](with.super.isa, sel_encodeBool_forKey_, v66, v67);

  v68 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_deviceTermsIdentifier);
  v69 = (void *)sub_247CEF64C();
  -[objc_class encodeInteger:forKey:](with.super.isa, sel_encodeInteger_forKey_, v68, v69);

  v70 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_productVersion + 8);
  *(_QWORD *)&v79 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_productVersion);
  *((_QWORD *)&v79 + 1) = v70;
  swift_bridgeObjectRetain_n();
  v71 = sub_247CEF8B0();
  v72 = (void *)sub_247CEF64C();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v71, v72);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  v73 = *(id *)(v2 + OBJC_IVAR___WFSetupDataInternal_anisetteDataProvider);
  v74 = (void *)sub_247CEF64C();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v73, v74);

  *(_QWORD *)&v79 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_prescriptionRecords);
  swift_bridgeObjectRetain_n();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F24F0);
  v75 = sub_247CEF8B0();
  v76 = (void *)sub_247CEF64C();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v75, v76);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  v77 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_walletData);
  v78 = *(_QWORD *)(v2 + OBJC_IVAR___WFSetupDataInternal_walletData + 8);
  if (v78 >> 60 == 15)
  {
    v79 = 0u;
    v80 = 0u;
  }
  else
  {
    *((_QWORD *)&v80 + 1) = MEMORY[0x24BDCDDE8];
    *(_QWORD *)&v79 = v77;
    *((_QWORD *)&v79 + 1) = v78;
  }
  sub_247CB5C68(v77, v78);
  sub_247CB9200((uint64_t)&v79, 0x22u);
  sub_247CB9318((uint64_t)&v79);
}

void sub_247CB9200(uint64_t a1, unsigned __int8 a2)
{
  void *v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[3];
  uint64_t v12;

  if (*(_QWORD *)(a1 + 24))
  {
    sub_247CBBC1C(a1, (uint64_t)v11);
    v4 = v12;
    if (v12)
    {
      v5 = __swift_project_boxed_opaque_existential_0(v11, v12);
      v6 = *(_QWORD *)(v4 - 8);
      MEMORY[0x24BDAC7A8](v5, v5);
      v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v6 + 16))(v8);
      v9 = sub_247CEF880();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
    }
    else
    {
      v9 = 0;
    }
    WFSetupData.PropertyKey.rawValue.getter(a2);
    v10 = (void *)sub_247CEF64C();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_encodeObject_forKey_, v9, v10);
    swift_unknownObjectRelease();

  }
}

uint64_t sub_247CB9318(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F24D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id WFSetupData.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return WFSetupData.init(coder:)(a1);
}

id WFSetupData.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  int v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v47;
  void *v48;
  unsigned int v49;
  int v50;
  void *v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  void *v61;
  unsigned int v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  void *v71;
  unint64_t v72;
  void *v73;
  unsigned int v74;
  void *v75;
  unsigned int v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  unint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  int v87;
  void *v88;
  unint64_t v89;
  uint64_t v90;
  int v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  unsigned int v96;
  void *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  uint64_t v103;
  void *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  void *v108;
  unsigned __int8 v109;
  int v110;
  void *v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v114;
  NSObject *v115;
  os_log_type_t v116;
  uint8_t *v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  os_log_type_t v121;
  uint8_t *v122;
  const char *v123;
  uint64_t v124;
  char *v125;
  char *v126;
  char *v127;
  char *v128;
  char *v129;
  char *v130;
  char *v131;
  char *v132;
  char *v133;
  char *v134;
  char *v135;
  unint64_t *v136;
  char *v137;
  objc_class *v138;
  void *v139;
  void *v140;
  unsigned int v141;
  unsigned int v142;
  unsigned int v143;
  unsigned int v144;
  unsigned int v145;
  unsigned int v146;
  unsigned int v147;
  unsigned int v148;
  unsigned int v149;
  void *v150;
  unint64_t v151;
  unint64_t v152;
  unint64_t v153;
  id v154;
  uint64_t v155;
  unint64_t v156;
  unint64_t v157;
  unint64_t v158;
  unint64_t v159;
  unint64_t v160;
  unsigned int v161;
  unsigned int v162;
  void *v163;
  unint64_t v164;
  unint64_t v165;
  void *v166;
  void *v167;
  void *v168;
  unsigned int v169;
  unint64_t v170;
  void *v171;
  uint64_t v172;
  void *v173;
  __int128 v174;
  void *v175;
  unsigned int v176;
  unsigned int v177;
  __int128 v178;
  uint64_t v179;
  unint64_t v180;
  uint64_t v181;
  char *v182;
  uint64_t v183;
  objc_super v184;
  void *v185;
  unint64_t v186;
  __int128 v187;
  __int128 v188;

  *(_QWORD *)&v1[OBJC_IVAR___WFSetupDataInternal_version] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2500);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_247CF1010;
  v183 = sub_247CBBA5C(0, &qword_2576F2508);
  *(_QWORD *)(v3 + 32) = v183;
  v4 = sub_247CBBA5C(0, (unint64_t *)&unk_2576F2510);
  *(_QWORD *)(v3 + 40) = v4;
  v5 = sub_247CBBA5C(0, (unint64_t *)&qword_2576F2DE0);
  *(_QWORD *)(v3 + 48) = v5;
  v182 = v1;
  v6 = (void *)sub_247CEF64C();
  v7 = objc_msgSend(a1, sel_containsValueForKey_, v6);

  if ((v7 & 1) != 0)
  {
    sub_247CEF724();
    swift_bridgeObjectRelease();
    v8 = *((_QWORD *)&v188 + 1);
    if (*((_QWORD *)&v188 + 1))
    {
      v9 = __swift_project_boxed_opaque_existential_0(&v187, *((uint64_t *)&v188 + 1));
      v10 = *(_QWORD *)(v8 - 8);
      MEMORY[0x24BDAC7A8](v9, v9);
      v12 = (char *)&v139 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v10 + 16))(v12);
      v181 = sub_247CEF880();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v187);
      goto LABEL_6;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v181 = 0;
LABEL_6:
  v13 = swift_allocObject();
  v178 = xmmword_247CF1020;
  *(_OWORD *)(v13 + 16) = xmmword_247CF1020;
  *(_QWORD *)(v13 + 32) = v4;
  v14 = (void *)sub_247CEF64C();
  v15 = objc_msgSend(a1, sel_containsValueForKey_, v14);

  if (v15)
  {
    sub_247CEF724();
  }
  else
  {
    v187 = 0u;
    v188 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v188 + 1))
  {
    v16 = swift_dynamicCast();
    if (v16)
      v17 = v185;
    else
      v17 = 0;
    if (v16)
      v18 = v186;
    else
      v18 = 0;
    v180 = v18;
  }
  else
  {
    sub_247CB9318((uint64_t)&v187);
    v17 = 0;
    v180 = 0;
  }
  v19 = (void *)sub_247CEF64C();
  v177 = objc_msgSend(a1, sel_decodeBoolForKey_, v19);

  v20 = (void *)sub_247CEF64C();
  v176 = objc_msgSend(a1, sel_decodeBoolForKey_, v20);

  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_247CF1030;
  *(_QWORD *)(v21 + 32) = v183;
  *(_QWORD *)(v21 + 40) = v5;
  *(_QWORD *)(v21 + 48) = sub_247CBBA5C(0, (unint64_t *)&unk_2576F2520);
  v22 = sub_247CBBA5C(0, (unint64_t *)&unk_2576F2DD0);
  *(_QWORD *)(v21 + 56) = v22;
  *(_QWORD *)(v21 + 64) = v4;
  v179 = sub_247CBBA5C(0, &qword_2576F2530);
  *(_QWORD *)(v21 + 72) = v179;
  sub_247CEF724();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v188 + 1))
  {
    swift_bridgeObjectRelease();
    sub_247CB9318((uint64_t)&v187);
LABEL_34:
    if (qword_2576F1D10 != -1)
      swift_once();
    v37 = sub_247CEF598();
    __swift_project_value_buffer(v37, (uint64_t)qword_2576F4A18);
    v38 = sub_247CEF580();
    v39 = sub_247CEF6DC();
    if (!os_log_type_enabled(v38, v39))
      goto LABEL_57;
    v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v40 = 0;
    v41 = "Unexpectedly failed to decode networks";
    goto LABEL_56;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F24D8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  v173 = v17;
  v23 = v185;
  v24 = swift_allocObject();
  v174 = xmmword_247CF1040;
  *(_OWORD *)(v24 + 16) = xmmword_247CF1040;
  *(_QWORD *)(v24 + 32) = v183;
  *(_QWORD *)(v24 + 40) = v4;
  sub_247CEF724();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v188 + 1))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_247CB9318((uint64_t)&v187);
LABEL_40:
    if (qword_2576F1D10 != -1)
      swift_once();
    v42 = sub_247CEF598();
    __swift_project_value_buffer(v42, (uint64_t)qword_2576F4A18);
    v38 = sub_247CEF580();
    v39 = sub_247CEF6DC();
    if (!os_log_type_enabled(v38, v39))
      goto LABEL_57;
    v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v40 = 0;
    v41 = "Unexpectedly failed to decode network passwords";
    goto LABEL_56;
  }
  v175 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F24E0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_40;
  }
  v25 = v185;
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_247CF1050;
  *(_QWORD *)(v26 + 32) = v183;
  *(_QWORD *)(v26 + 40) = v5;
  *(_QWORD *)(v26 + 48) = v4;
  *(_QWORD *)(v26 + 56) = v22;
  *(_QWORD *)(v26 + 64) = v179;
  sub_247CEF724();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v188 + 1))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_247CB9318((uint64_t)&v187);
LABEL_46:
    if (qword_2576F1D10 != -1)
      swift_once();
    v43 = sub_247CEF598();
    __swift_project_value_buffer(v43, (uint64_t)qword_2576F4A18);
    v38 = sub_247CEF580();
    v39 = sub_247CEF6DC();
    if (!os_log_type_enabled(v38, v39))
      goto LABEL_57;
    v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v40 = 0;
    v41 = "Unexpectedly failed to decode locale preferences";
    goto LABEL_56;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F24E8);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_46;
  }
  v27 = v185;
  v28 = (void *)sub_247CEF64C();
  v29 = objc_msgSend(a1, sel_decodeBoolForKey_, v28);

  v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = v178;
  *(_QWORD *)(v30 + 32) = v4;
  sub_247CEF724();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v188 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v169 = v29;
      v171 = v25;
      v31 = v185;
      v32 = v186;
      v33 = swift_allocObject();
      *(_OWORD *)(v33 + 16) = v178;
      *(_QWORD *)(v33 + 32) = v179;
      sub_247CEF724();
      swift_bridgeObjectRelease();
      v168 = v31;
      v170 = 0xD000000000000015;
      if (*((_QWORD *)&v188 + 1))
      {
        v34 = swift_dynamicCast();
        v35 = (uint64_t)v185;
        if (!v34)
          v35 = 0;
        v172 = v35;
        if (v34)
          v36 = v186;
        else
          v36 = 0xF000000000000000;
      }
      else
      {
        sub_247CB9318((uint64_t)&v187);
        v172 = 0;
        v36 = 0xF000000000000000;
      }
      v47 = swift_allocObject();
      *(_OWORD *)(v47 + 16) = v178;
      *(_QWORD *)(v47 + 32) = v4;
      v48 = (void *)sub_247CEF64C();
      v49 = objc_msgSend(a1, sel_containsValueForKey_, v48);

      if (v49)
      {
        sub_247CEF724();
      }
      else
      {
        v187 = 0u;
        v188 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v188 + 1))
      {
        v50 = swift_dynamicCast();
        if (v50)
          v51 = v185;
        else
          v51 = 0;
        if (v50)
          v52 = v186;
        else
          v52 = 0;
      }
      else
      {
        sub_247CB9318((uint64_t)&v187);
        v51 = 0;
        v52 = 0;
      }
      v53 = swift_allocObject();
      *(_OWORD *)(v53 + 16) = v178;
      *(_QWORD *)(v53 + 32) = v4;
      sub_247CEF724();
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v188 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v167 = v51;
          v54 = v186;
          v166 = v185;
          v55 = swift_allocObject();
          *(_OWORD *)(v55 + 16) = v178;
          *(_QWORD *)(v55 + 32) = v4;
          sub_247CEF724();
          swift_bridgeObjectRelease();
          if (*((_QWORD *)&v188 + 1))
          {
            if ((swift_dynamicCast() & 1) != 0)
            {
              v165 = v54;
              v163 = v185;
              v164 = v186;
              v56 = (void *)sub_247CEF64C();
              v162 = objc_msgSend(a1, sel_decodeBoolForKey_, v56);

              v57 = (void *)sub_247CEF64C();
              v161 = objc_msgSend(a1, sel_decodeBoolForKey_, v57);

              v58 = swift_allocObject();
              *(_OWORD *)(v58 + 16) = v178;
              *(_QWORD *)(v58 + 32) = v4;
              sub_247CEF724();
              swift_bridgeObjectRelease();
              if (*((_QWORD *)&v188 + 1))
              {
                if ((swift_dynamicCast() & 1) != 0)
                {
                  v158 = v52;
                  v59 = v186;
                  v150 = v185;
                  v60 = swift_allocObject();
                  *(_OWORD *)(v60 + 16) = v178;
                  *(_QWORD *)(v60 + 32) = v4;
                  v61 = (void *)sub_247CEF64C();
                  v62 = objc_msgSend(a1, sel_containsValueForKey_, v61);

                  if (v62)
                  {
                    sub_247CEF724();
                  }
                  else
                  {
                    v187 = 0u;
                    v188 = 0u;
                  }
                  swift_bridgeObjectRelease();
                  v157 = v59;
                  if (*((_QWORD *)&v188 + 1))
                  {
                    v70 = swift_dynamicCast();
                    v71 = v185;
                    if (!v70)
                      v71 = 0;
                    v140 = v71;
                    if (v70)
                      v72 = v186;
                    else
                      v72 = 0;
                    v153 = v72;
                  }
                  else
                  {
                    sub_247CB9318((uint64_t)&v187);
                    v140 = 0;
                    v153 = 0;
                  }
                  v73 = (void *)sub_247CEF64C();
                  v74 = objc_msgSend(a1, sel_decodeBoolForKey_, v73);

                  v75 = (void *)sub_247CEF64C();
                  v76 = objc_msgSend(a1, sel_decodeBoolForKey_, v75);

                  v77 = swift_allocObject();
                  *(_OWORD *)(v77 + 16) = v178;
                  *(_QWORD *)(v77 + 32) = v179;
                  v151 = 0xD000000000000014;
                  sub_247CEF724();
                  swift_bridgeObjectRelease();
                  v159 = v36;
                  v149 = v74;
                  if (*((_QWORD *)&v188 + 1))
                  {
                    v78 = swift_dynamicCast();
                    v79 = (uint64_t)v185;
                    if (!v78)
                      v79 = 0;
                    v155 = v79;
                    v80 = 0xF000000000000000;
                    if (v78)
                      v80 = v186;
                  }
                  else
                  {
                    sub_247CB9318((uint64_t)&v187);
                    v155 = 0;
                    v80 = 0xF000000000000000;
                  }
                  v156 = v80;
                  v81 = (void *)sub_247CEF64C();
                  v147 = objc_msgSend(a1, sel_decodeBoolForKey_, v81);

                  v82 = (void *)sub_247CEF64C();
                  v146 = objc_msgSend(a1, sel_decodeBoolForKey_, v82);

                  v83 = (void *)sub_247CEF64C();
                  v145 = objc_msgSend(a1, sel_decodeBoolForKey_, v83);

                  v160 = 0xD000000000000016;
                  v84 = (void *)sub_247CEF64C();
                  v144 = objc_msgSend(a1, sel_decodeBoolForKey_, v84);

                  v85 = (void *)sub_247CEF64C();
                  v143 = objc_msgSend(a1, sel_decodeBoolForKey_, v85);

                  v86 = swift_allocObject();
                  *(_OWORD *)(v86 + 16) = v178;
                  *(_QWORD *)(v86 + 32) = v4;
                  sub_247CEF724();
                  swift_bridgeObjectRelease();
                  if (*((_QWORD *)&v188 + 1))
                  {
                    v87 = swift_dynamicCast();
                    v88 = v185;
                    if (!v87)
                      v88 = 0;
                    v139 = v88;
                    if (v87)
                      v89 = v186;
                    else
                      v89 = 0;
                    v152 = v89;
                  }
                  else
                  {
                    sub_247CB9318((uint64_t)&v187);
                    v139 = 0;
                    v152 = 0;
                  }
                  v90 = swift_allocObject();
                  *(_OWORD *)(v90 + 16) = v178;
                  *(_QWORD *)(v90 + 32) = sub_247CBBA5C(0, &qword_2576F24F8);
                  sub_247CEF724();
                  swift_bridgeObjectRelease();
                  v148 = v76;
                  if (*((_QWORD *)&v188 + 1))
                  {
                    v91 = swift_dynamicCast();
                    v92 = v185;
                    if (!v91)
                      v92 = 0;
                    v154 = v92;
                  }
                  else
                  {
                    sub_247CB9318((uint64_t)&v187);
                    v154 = 0;
                  }
                  v93 = (void *)sub_247CEF64C();
                  v142 = objc_msgSend(a1, sel_decodeBoolForKey_, v93);

                  v94 = (void *)sub_247CEF64C();
                  v141 = objc_msgSend(a1, sel_decodeBoolForKey_, v94);

                  v95 = (void *)sub_247CEF64C();
                  v96 = objc_msgSend(a1, sel_decodeBoolForKey_, v95);

                  v97 = (void *)sub_247CEF64C();
                  v98 = objc_msgSend(a1, sel_decodeIntegerForKey_, v97);

                  v99 = swift_allocObject();
                  *(_OWORD *)(v99 + 16) = v174;
                  v100 = type metadata accessor for PrescriptionRecord();
                  v101 = v183;
                  *(_QWORD *)(v99 + 32) = v100;
                  *(_QWORD *)(v99 + 40) = v101;
                  sub_247CEF724();
                  swift_bridgeObjectRelease();
                  if (*((_QWORD *)&v188 + 1))
                  {
                    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F24F0);
                    if ((swift_dynamicCast() & 1) != 0)
                    {
                      LODWORD(v183) = v96;
                      v102 = v185;
                      v103 = swift_allocObject();
                      *(_OWORD *)(v103 + 16) = v178;
                      *(_QWORD *)(v103 + 32) = v4;
                      sub_247CEF724();
                      swift_bridgeObjectRelease();
                      if (*((_QWORD *)&v188 + 1))
                      {
                        v104 = v102;
                        if ((swift_dynamicCast() & 1) != 0)
                        {
                          v170 = (unint64_t)v185;
                          *(_QWORD *)&v174 = v186;
                          v105 = swift_allocObject();
                          *(_OWORD *)(v105 + 16) = v178;
                          *(_QWORD *)(v105 + 32) = type metadata accessor for WFSetupServerAnisetteDataProvider();
                          sub_247CEF724();
                          swift_bridgeObjectRelease();
                          if (*((_QWORD *)&v188 + 1))
                          {
                            if ((swift_dynamicCast() & 1) != 0)
                            {
                              v106 = v185;
                              v107 = swift_allocObject();
                              *(_OWORD *)(v107 + 16) = v178;
                              *(_QWORD *)(v107 + 32) = v179;
                              v108 = (void *)sub_247CEF64C();
                              v109 = objc_msgSend(a1, sel_containsValueForKey_, v108);

                              if ((v109 & 1) != 0)
                              {
                                sub_247CEF724();
                                swift_bridgeObjectRelease();
                                if (*((_QWORD *)&v188 + 1))
                                {
                                  v110 = swift_dynamicCast();
                                  v111 = v185;
                                  v112 = v186;
                                  if (!v110)
                                  {
                                    v111 = 0;
                                    v112 = 0xF000000000000000;
                                  }
                                  goto LABEL_163;
                                }
                              }
                              else
                              {
                                v187 = 0u;
                                v188 = 0u;
                                swift_bridgeObjectRelease();
                              }
                              sub_247CB9318((uint64_t)&v187);
                              v111 = 0;
                              v112 = 0xF000000000000000;
LABEL_163:
                              v125 = v182;
                              *(_QWORD *)&v182[OBJC_IVAR___WFSetupDataInternal_keyboards] = v181;
                              v126 = &v125[OBJC_IVAR___WFSetupDataInternal_appleID];
                              *(_QWORD *)v126 = v173;
                              *((_QWORD *)v126 + 1) = v180;
                              v125[OBJC_IVAR___WFSetupDataInternal_usesSameAccountForiTunes] = v177;
                              v125[OBJC_IVAR___WFSetupDataInternal_isConnectedToWiFi] = v176;
                              *(_QWORD *)&v125[OBJC_IVAR___WFSetupDataInternal_networks] = v175;
                              *(_QWORD *)&v125[OBJC_IVAR___WFSetupDataInternal_networkPasswords] = v171;
                              *(_QWORD *)&v125[OBJC_IVAR___WFSetupDataInternal_localePreferences] = v27;
                              v125[OBJC_IVAR___WFSetupDataInternal_isAutomaticTimeZoneEnabled] = v169;
                              v127 = &v125[OBJC_IVAR___WFSetupDataInternal_timeZone];
                              *(_QWORD *)v127 = v168;
                              *((_QWORD *)v127 + 1) = v32;
                              v128 = &v125[OBJC_IVAR___WFSetupDataInternal_accessibilitySettings];
                              *(_QWORD *)v128 = v172;
                              *((_QWORD *)v128 + 1) = v159;
                              v129 = &v125[OBJC_IVAR___WFSetupDataInternal_firstName];
                              *(_QWORD *)v129 = v167;
                              *((_QWORD *)v129 + 1) = v158;
                              v130 = &v125[OBJC_IVAR___WFSetupDataInternal_deviceModel];
                              *(_QWORD *)v130 = v166;
                              *((_QWORD *)v130 + 1) = v165;
                              v131 = &v125[OBJC_IVAR___WFSetupDataInternal_deviceClass];
                              *(_QWORD *)v131 = v163;
                              *((_QWORD *)v131 + 1) = v164;
                              v125[OBJC_IVAR___WFSetupDataInternal_hasHomeButton] = v162;
                              v125[OBJC_IVAR___WFSetupDataInternal_isRestoring] = v161;
                              v132 = &v125[OBJC_IVAR___WFSetupDataInternal_deviceName];
                              *(_QWORD *)v132 = v150;
                              *((_QWORD *)v132 + 1) = v157;
                              v133 = &v125[OBJC_IVAR___WFSetupDataInternal_backupUUID];
                              *(_QWORD *)v133 = v140;
                              *((_QWORD *)v133 + 1) = v153;
                              v125[OBJC_IVAR___WFSetupDataInternal_isBackupEnabled] = v149;
                              v125[OBJC_IVAR___WFSetupDataInternal_isOptedInToLocationServices] = v148;
                              v125[OBJC_IVAR___WFSetupDataInternal_isOptedInToDeviceAnalytics] = v145;
                              v134 = &v125[OBJC_IVAR___WFSetupDataInternal_locationServicesData];
                              *(_QWORD *)v134 = v155;
                              *((_QWORD *)v134 + 1) = v156;
                              v125[OBJC_IVAR___WFSetupDataInternal_isOptedInToFindMyDevice] = v147;
                              v125[OBJC_IVAR___WFSetupDataInternal_isOptedInToAppAnalytics] = v146;
                              v125[OBJC_IVAR___WFSetupDataInternal_siriAssistantIsEnabled] = v144;
                              v125[OBJC_IVAR___WFSetupDataInternal_siriVoiceTriggerIsEnabled] = v143;
                              v135 = &v125[OBJC_IVAR___WFSetupDataInternal_siriAssistantLanguageCode];
                              *(_QWORD *)v135 = v139;
                              *((_QWORD *)v135 + 1) = v152;
                              *(_QWORD *)&v125[OBJC_IVAR___WFSetupDataInternal_siriAssistantOutputVoice] = v154;
                              v125[OBJC_IVAR___WFSetupDataInternal_siriDataSharingIsEnabled] = v142;
                              v125[OBJC_IVAR___WFSetupDataInternal_dictationIsEnabled] = v141;
                              v125[OBJC_IVAR___WFSetupDataInternal_suppressDictationOptIn] = v183;
                              *(_QWORD *)&v125[OBJC_IVAR___WFSetupDataInternal_deviceTermsIdentifier] = v98;
                              v136 = (unint64_t *)&v125[OBJC_IVAR___WFSetupDataInternal_productVersion];
                              *v136 = v170;
                              v136[1] = v174;
                              *(_QWORD *)&v125[OBJC_IVAR___WFSetupDataInternal_anisetteDataProvider] = v106;
                              *(_QWORD *)&v125[OBJC_IVAR___WFSetupDataInternal_prescriptionRecords] = v104;
                              v137 = &v125[OBJC_IVAR___WFSetupDataInternal_walletData];
                              *(_QWORD *)v137 = v111;
                              *((_QWORD *)v137 + 1) = v112;

                              v138 = (objc_class *)type metadata accessor for WFSetupData();
                              v184.receiver = v125;
                              v184.super_class = v138;
                              v45 = objc_msgSendSuper2(&v184, sel_init);

                              return v45;
                            }
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                          }
                          else
                          {
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            swift_bridgeObjectRelease();
                            sub_247CB9318((uint64_t)&v187);
                          }
                          if (qword_2576F1D10 != -1)
                            swift_once();
                          v124 = sub_247CEF598();
                          __swift_project_value_buffer(v124, (uint64_t)qword_2576F4A18);
                          v115 = sub_247CEF580();
                          v121 = sub_247CEF6DC();
                          if (!os_log_type_enabled(v115, v121))
                            goto LABEL_159;
                          v122 = (uint8_t *)swift_slowAlloc();
                          *(_WORD *)v122 = 0;
                          v123 = "Unexpectedly failed to decode the anisette data provider. ";
                          goto LABEL_158;
                        }
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                      }
                      else
                      {
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        swift_bridgeObjectRelease();
                        sub_247CB9318((uint64_t)&v187);
                      }
                      if (qword_2576F1D10 != -1)
                        swift_once();
                      v120 = sub_247CEF598();
                      __swift_project_value_buffer(v120, (uint64_t)qword_2576F4A18);
                      v115 = sub_247CEF580();
                      v121 = sub_247CEF6DC();
                      if (!os_log_type_enabled(v115, v121))
                        goto LABEL_159;
                      v122 = (uint8_t *)swift_slowAlloc();
                      *(_WORD *)v122 = 0;
                      v123 = "Unexpectedly failed to decode the product version. ";
LABEL_158:
                      _os_log_impl(&dword_247CAF000, v115, v121, v123, v122, 2u);
                      MEMORY[0x249590A5C](v122, -1, -1);
LABEL_159:
                      swift_unknownObjectRelease();
                      v118 = v172;
                      v119 = v159;
LABEL_160:
                      sub_247CB64F0(v118, v119);
                      sub_247CB64F0(v155, v156);

                      goto LABEL_58;
                    }
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                    sub_247CB9318((uint64_t)&v187);
                  }
                  v113 = v159;
                  if (qword_2576F1D10 != -1)
                    swift_once();
                  v114 = sub_247CEF598();
                  __swift_project_value_buffer(v114, (uint64_t)qword_2576F4A18);
                  v115 = sub_247CEF580();
                  v116 = sub_247CEF6DC();
                  if (os_log_type_enabled(v115, v116))
                  {
                    v117 = (uint8_t *)swift_slowAlloc();
                    *(_WORD *)v117 = 0;
                    _os_log_impl(&dword_247CAF000, v115, v116, "Unexpectedly failed to decode the prescription records. ", v117, 2u);
                    MEMORY[0x249590A5C](v117, -1, -1);
                  }
                  swift_unknownObjectRelease();
                  v118 = v172;
                  v119 = v113;
                  goto LABEL_160;
                }
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
              }
              else
              {
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                sub_247CB9318((uint64_t)&v187);
              }
              if (qword_2576F1D10 != -1)
                swift_once();
              v69 = sub_247CEF598();
              __swift_project_value_buffer(v69, (uint64_t)qword_2576F4A18);
              v64 = sub_247CEF580();
              v65 = sub_247CEF6DC();
              if (!os_log_type_enabled(v64, v65))
                goto LABEL_99;
              v66 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v66 = 0;
              v67 = "Unexpectedly failed to decode the device name";
              goto LABEL_98;
            }
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            sub_247CB9318((uint64_t)&v187);
          }
          if (qword_2576F1D10 != -1)
            swift_once();
          v68 = sub_247CEF598();
          __swift_project_value_buffer(v68, (uint64_t)qword_2576F4A18);
          v64 = sub_247CEF580();
          v65 = sub_247CEF6DC();
          if (!os_log_type_enabled(v64, v65))
            goto LABEL_99;
          v66 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v66 = 0;
          v67 = "Unexpectedly failed to decode the device class";
LABEL_98:
          _os_log_impl(&dword_247CAF000, v64, v65, v67, v66, 2u);
          MEMORY[0x249590A5C](v66, -1, -1);
LABEL_99:
          swift_unknownObjectRelease();
          sub_247CB64F0(v172, v36);

          goto LABEL_58;
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_247CB9318((uint64_t)&v187);
      }
      if (qword_2576F1D10 != -1)
        swift_once();
      v63 = sub_247CEF598();
      __swift_project_value_buffer(v63, (uint64_t)qword_2576F4A18);
      v64 = sub_247CEF580();
      v65 = sub_247CEF6DC();
      if (!os_log_type_enabled(v64, v65))
        goto LABEL_99;
      v66 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v66 = 0;
      v67 = "Unexpectedly failed to decode the accessibility settings";
      goto LABEL_98;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_247CB9318((uint64_t)&v187);
  }
  if (qword_2576F1D10 != -1)
    swift_once();
  v44 = sub_247CEF598();
  __swift_project_value_buffer(v44, (uint64_t)qword_2576F4A18);
  v38 = sub_247CEF580();
  v39 = sub_247CEF6DC();
  if (os_log_type_enabled(v38, v39))
  {
    v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v40 = 0;
    v41 = "Unexpectedly failed to decode the time zone settings";
LABEL_56:
    _os_log_impl(&dword_247CAF000, v38, v39, v41, v40, 2u);
    MEMORY[0x249590A5C](v40, -1, -1);
  }
LABEL_57:

  swift_unknownObjectRelease();
LABEL_58:
  type metadata accessor for WFSetupData();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_247CBB654(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = WFSetupData.PropertyKey.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == WFSetupData.PropertyKey.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_247CEF88C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_247CBB6DC()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_247CEF910();
  WFSetupData.PropertyKey.rawValue.getter(v1);
  sub_247CEF670();
  swift_bridgeObjectRelease();
  return sub_247CEF928();
}

uint64_t sub_247CBB73C()
{
  unsigned __int8 *v0;

  WFSetupData.PropertyKey.rawValue.getter(*v0);
  sub_247CEF670();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247CBB77C()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_247CEF910();
  WFSetupData.PropertyKey.rawValue.getter(v1);
  sub_247CEF670();
  swift_bridgeObjectRelease();
  return sub_247CEF928();
}

uint64_t sub_247CBB7D8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s10TDGSharing11WFSetupDataC11PropertyKeyO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_247CBB804@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = WFSetupData.PropertyKey.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

id WFSetupData.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void WFSetupData.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WFSetupData.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WFSetupData();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_247CBBA4C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 16) = a2;
  *(_QWORD *)(result + 24) = 2 * a2;
  return result;
}

uint64_t sub_247CBBA5C(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t _s10TDGSharing11WFSetupDataC11PropertyKeyO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_247CEF898();
  swift_bridgeObjectRelease();
  if (v0 >= 0x23)
    return 35;
  else
    return v0;
}

unint64_t sub_247CBBB0C()
{
  unint64_t result;

  result = qword_2576F2538;
  if (!qword_2576F2538)
  {
    result = MEMORY[0x2495909F0](&protocol conformance descriptor for WFSetupData.PropertyKey, &type metadata for WFSetupData.PropertyKey);
    atomic_store(result, (unint64_t *)&qword_2576F2538);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for WFSetupData.PropertyKey(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 34 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 34) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xDE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xDD)
    return ((uint64_t (*)(void))((char *)&loc_247CBBB9C + 4 * byte_247CF0F40[v4]))();
  *a1 = a2 + 34;
  return ((uint64_t (*)(void))((char *)sub_247CBBBD0 + 4 * byte_247CF0F3B[v4]))();
}

uint64_t sub_247CBBBD0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CBBBD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247CBBBE0);
  return result;
}

uint64_t sub_247CBBBEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247CBBBF4);
  *(_BYTE *)result = a2 + 34;
  return result;
}

uint64_t sub_247CBBBF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CBBC00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WFSetupData.PropertyKey()
{
  return &type metadata for WFSetupData.PropertyKey;
}

uint64_t sub_247CBBC1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F24D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

double PrescriptionRecord.version.getter()
{
  return 1.0;
}

uint64_t PrescriptionRecord.accPayload.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WFPrescriptionRecord_accPayload);
  sub_247CB5C7C(v1, *(_QWORD *)(v0 + OBJC_IVAR___WFPrescriptionRecord_accPayload + 8));
  return v1;
}

uint64_t PrescriptionRecord.enrollmentName.getter()
{
  return sub_247CB7CB0(&OBJC_IVAR___WFPrescriptionRecord_enrollmentName);
}

uint64_t PrescriptionRecord.enrollmentDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR___WFPrescriptionRecord_enrollmentDate;
  v4 = sub_247CEF508();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t PrescriptionRecord.leftLensFactoryCalibrationData.getter()
{
  return sub_247CB7CB0(&OBJC_IVAR___WFPrescriptionRecord_leftLensFactoryCalibrationData);
}

uint64_t PrescriptionRecord.rightLensFactoryCalibrationData.getter()
{
  return sub_247CB7CB0(&OBJC_IVAR___WFPrescriptionRecord_rightLensFactoryCalibrationData);
}

id PrescriptionRecord.__allocating_init(accPayload:enrollmentName:enrollmentDate:leftLensFactoryCalibrationData:rightLensFactoryCalibrationData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  id v25;
  objc_super v28;

  v17 = (char *)objc_allocWithZone(v9);
  *(_QWORD *)&v17[OBJC_IVAR___WFPrescriptionRecord_version] = 0x3FF0000000000000;
  v18 = &v17[OBJC_IVAR___WFPrescriptionRecord_accPayload];
  *(_QWORD *)v18 = a1;
  *((_QWORD *)v18 + 1) = a2;
  v19 = &v17[OBJC_IVAR___WFPrescriptionRecord_enrollmentName];
  *(_QWORD *)v19 = a3;
  *((_QWORD *)v19 + 1) = a4;
  v20 = &v17[OBJC_IVAR___WFPrescriptionRecord_enrollmentDate];
  v21 = sub_247CEF508();
  v22 = *(_QWORD *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v20, a5, v21);
  v23 = &v17[OBJC_IVAR___WFPrescriptionRecord_leftLensFactoryCalibrationData];
  *(_QWORD *)v23 = a6;
  *((_QWORD *)v23 + 1) = a7;
  v24 = &v17[OBJC_IVAR___WFPrescriptionRecord_rightLensFactoryCalibrationData];
  *(_QWORD *)v24 = a8;
  *((_QWORD *)v24 + 1) = a9;
  v28.receiver = v17;
  v28.super_class = v9;
  v25 = objc_msgSendSuper2(&v28, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(a5, v21);
  return v25;
}

id PrescriptionRecord.init(accPayload:enrollmentName:enrollmentDate:leftLensFactoryCalibrationData:rightLensFactoryCalibrationData:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char *v9;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  id v21;
  objc_super v23;

  *(_QWORD *)&v9[OBJC_IVAR___WFPrescriptionRecord_version] = 0x3FF0000000000000;
  v14 = &v9[OBJC_IVAR___WFPrescriptionRecord_accPayload];
  *(_QWORD *)v14 = a1;
  *((_QWORD *)v14 + 1) = a2;
  v15 = &v9[OBJC_IVAR___WFPrescriptionRecord_enrollmentName];
  *(_QWORD *)v15 = a3;
  *((_QWORD *)v15 + 1) = a4;
  v16 = &v9[OBJC_IVAR___WFPrescriptionRecord_enrollmentDate];
  v17 = sub_247CEF508();
  v18 = *(_QWORD *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v16, a5, v17);
  v19 = &v9[OBJC_IVAR___WFPrescriptionRecord_leftLensFactoryCalibrationData];
  *(_QWORD *)v19 = a6;
  *((_QWORD *)v19 + 1) = a7;
  v20 = &v9[OBJC_IVAR___WFPrescriptionRecord_rightLensFactoryCalibrationData];
  *(_QWORD *)v20 = a8;
  *((_QWORD *)v20 + 1) = a9;
  v23.receiver = v9;
  v23.super_class = (Class)type metadata accessor for PrescriptionRecord();
  v21 = objc_msgSendSuper2(&v23, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a5, v17);
  return v21;
}

uint64_t type metadata accessor for PrescriptionRecord()
{
  uint64_t result;

  result = qword_2576F2680;
  if (!qword_2576F2680)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t PrescriptionRecord.description.getter()
{
  return 0x657463616465723CLL;
}

uint64_t sub_247CBBFBC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_247CBBFF4 + 4 * byte_247CF1060[a1]))(0xD00000000000001ELL, 0x8000000247CF2CF0);
}

uint64_t sub_247CBBFF4()
{
  return 0x6F6C796150636361;
}

uint64_t sub_247CBC010()
{
  return 0x656D6C6C6F726E65;
}

uint64_t sub_247CBC044(uint64_t a1)
{
  return a1 + 1;
}

uint64_t static PrescriptionRecord.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall PrescriptionRecord.encode(with:)(NSCoder with)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  void *v42;
  _QWORD v43[3];
  uint64_t v44;
  __int128 v45;
  __int128 v46;

  v3 = sub_247CEF508();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v1 + OBJC_IVAR___WFPrescriptionRecord_accPayload);
  v9 = *(_QWORD *)(v1 + OBJC_IVAR___WFPrescriptionRecord_accPayload + 8);
  *(_QWORD *)&v45 = v8;
  *((_QWORD *)&v45 + 1) = v9;
  sub_247CB5C7C(v8, v9);
  sub_247CB5C7C(v8, v9);
  v10 = sub_247CEF8B0();
  v11 = (void *)sub_247CEF64C();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v10, v11);
  swift_unknownObjectRelease();

  sub_247CB6504(v8, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v1 + OBJC_IVAR___WFPrescriptionRecord_enrollmentDate, v3);
  v12 = sub_247CEF8B0();
  v13 = (void *)sub_247CEF64C();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v12, v13);
  swift_unknownObjectRelease();

  v14 = *(_QWORD *)(v1 + OBJC_IVAR___WFPrescriptionRecord_enrollmentName + 8);
  v15 = MEMORY[0x24BEE0D00];
  if (v14)
  {
    v16 = *(_QWORD *)(v1 + OBJC_IVAR___WFPrescriptionRecord_enrollmentName);
    *((_QWORD *)&v46 + 1) = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v45 = v16;
    *((_QWORD *)&v45 + 1) = v14;
    sub_247CBBC1C((uint64_t)&v45, (uint64_t)v43);
    v17 = v44;
    if (v44)
    {
      v18 = __swift_project_boxed_opaque_existential_0(v43, v44);
      v19 = *(_QWORD *)(v17 - 8);
      MEMORY[0x24BDAC7A8](v18, v18);
      v21 = (char *)v43 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v19 + 16))(v21);
      swift_bridgeObjectRetain();
      v22 = sub_247CEF880();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v17);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
    }
    else
    {
      swift_bridgeObjectRetain();
      v22 = 0;
    }
    v23 = (void *)sub_247CEF64C();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v22, v23);
    swift_unknownObjectRelease();

  }
  else
  {
    v45 = 0u;
    v46 = 0u;
  }
  sub_247CBCE98((uint64_t)&v45, &qword_2576F24D0);
  v24 = *(_QWORD *)(v1 + OBJC_IVAR___WFPrescriptionRecord_leftLensFactoryCalibrationData + 8);
  if (v24)
  {
    v25 = *(_QWORD *)(v1 + OBJC_IVAR___WFPrescriptionRecord_leftLensFactoryCalibrationData);
    *((_QWORD *)&v46 + 1) = v15;
    *(_QWORD *)&v45 = v25;
    *((_QWORD *)&v45 + 1) = v24;
    sub_247CBBC1C((uint64_t)&v45, (uint64_t)v43);
    v26 = v44;
    if (v44)
    {
      v27 = __swift_project_boxed_opaque_existential_0(v43, v44);
      v28 = *(_QWORD *)(v26 - 8);
      MEMORY[0x24BDAC7A8](v27, v27);
      v30 = (char *)v43 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v28 + 16))(v30);
      swift_bridgeObjectRetain();
      v31 = sub_247CEF880();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v26);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
    }
    else
    {
      swift_bridgeObjectRetain();
      v31 = 0;
    }
    v32 = (void *)sub_247CEF64C();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v31, v32);
    swift_unknownObjectRelease();

  }
  else
  {
    v45 = 0u;
    v46 = 0u;
  }
  sub_247CBCE98((uint64_t)&v45, &qword_2576F24D0);
  v33 = (uint64_t *)(v1 + OBJC_IVAR___WFPrescriptionRecord_rightLensFactoryCalibrationData);
  v34 = *(_QWORD *)(v1 + OBJC_IVAR___WFPrescriptionRecord_rightLensFactoryCalibrationData + 8);
  if (v34)
  {
    v35 = *v33;
    *((_QWORD *)&v46 + 1) = v15;
    *(_QWORD *)&v45 = v35;
    *((_QWORD *)&v45 + 1) = v34;
    sub_247CBBC1C((uint64_t)&v45, (uint64_t)v43);
    v36 = v44;
    if (v44)
    {
      v37 = __swift_project_boxed_opaque_existential_0(v43, v44);
      v38 = *(_QWORD *)(v36 - 8);
      MEMORY[0x24BDAC7A8](v37, v37);
      v40 = (char *)v43 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v38 + 16))(v40);
      swift_bridgeObjectRetain();
      v41 = sub_247CEF880();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v40, v36);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
    }
    else
    {
      swift_bridgeObjectRetain();
      v41 = 0;
    }
    v42 = (void *)sub_247CEF64C();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v41, v42);
    swift_unknownObjectRelease();

  }
  else
  {
    v45 = 0u;
    v46 = 0u;
  }
  sub_247CBCE98((uint64_t)&v45, &qword_2576F24D0);
}

id PrescriptionRecord.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return PrescriptionRecord.init(coder:)(a1);
}

id PrescriptionRecord.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  char *v37;
  objc_class *v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  objc_super v56;
  uint64_t v57;
  unint64_t v58;
  _BYTE v59[24];
  uint64_t v60;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F25F0);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_247CEF508();
  v8 = *(_QWORD *)(v7 - 8);
  v53 = v7;
  v54 = v8;
  MEMORY[0x24BDAC7A8](v7, v9);
  v52 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v1[OBJC_IVAR___WFPrescriptionRecord_version] = 0x3FF0000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2500);
  v11 = swift_allocObject();
  v55 = xmmword_247CF1020;
  *(_OWORD *)(v11 + 16) = xmmword_247CF1020;
  v12 = sub_247CBBA5C(0, (unint64_t *)&unk_2576F2510);
  *(_QWORD *)(v11 + 32) = v12;
  v13 = v1;
  sub_247CEF724();
  swift_bridgeObjectRelease();
  if (v60)
  {
    v14 = swift_dynamicCast();
    v15 = v57;
    v16 = v58;
    if (!v14)
    {
      v15 = 0;
      v16 = 0;
    }
  }
  else
  {
    sub_247CBCE98((uint64_t)v59, &qword_2576F24D0);
    v15 = 0;
    v16 = 0;
  }
  v17 = &v13[OBJC_IVAR___WFPrescriptionRecord_leftLensFactoryCalibrationData];
  *(_QWORD *)v17 = v15;
  *((_QWORD *)v17 + 1) = v16;
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = v55;
  *(_QWORD *)(v18 + 32) = v12;
  sub_247CEF724();
  swift_bridgeObjectRelease();
  if (v60)
  {
    v19 = swift_dynamicCast();
    v20 = v57;
    v21 = v58;
    if (!v19)
    {
      v20 = 0;
      v21 = 0;
    }
  }
  else
  {
    sub_247CBCE98((uint64_t)v59, &qword_2576F24D0);
    v20 = 0;
    v21 = 0;
  }
  v22 = &v13[OBJC_IVAR___WFPrescriptionRecord_rightLensFactoryCalibrationData];
  *(_QWORD *)v22 = v20;
  *((_QWORD *)v22 + 1) = v21;
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = v55;
  *(_QWORD *)(v23 + 32) = v12;
  sub_247CEF724();
  swift_bridgeObjectRelease();
  if (v60)
  {
    v24 = swift_dynamicCast();
    v25 = v57;
    v26 = v58;
    if (!v24)
    {
      v25 = 0;
      v26 = 0;
    }
  }
  else
  {
    sub_247CBCE98((uint64_t)v59, &qword_2576F24D0);
    v25 = 0;
    v26 = 0;
  }
  v27 = &v13[OBJC_IVAR___WFPrescriptionRecord_enrollmentName];
  *(_QWORD *)v27 = v25;
  *((_QWORD *)v27 + 1) = v26;
  v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = v55;
  *(_QWORD *)(v28 + 32) = sub_247CBBA5C(0, &qword_2576F2530);
  sub_247CEF724();
  swift_bridgeObjectRelease();
  if (!v60)
  {
    sub_247CBCE98((uint64_t)v59, &qword_2576F24D0);
    goto LABEL_19;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_19:
    if (qword_2576F1CF8 != -1)
      swift_once();
    v40 = sub_247CEF598();
    __swift_project_value_buffer(v40, (uint64_t)qword_2576F49D0);
    v41 = sub_247CEF580();
    v42 = sub_247CEF6DC();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_247CAF000, v41, v42, "Failed to decode and retrieve accPayload from record. ", v43, 2u);
      MEMORY[0x249590A5C](v43, -1, -1);
    }

    goto LABEL_31;
  }
  v30 = v57;
  v29 = v58;
  v31 = (uint64_t *)&v13[OBJC_IVAR___WFPrescriptionRecord_accPayload];
  *v31 = v57;
  v31[1] = v29;
  v50 = v31;
  v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = v55;
  *(_QWORD *)(v32 + 32) = sub_247CBBA5C(0, (unint64_t *)&unk_2576F2520);
  v51 = v30;
  *(_QWORD *)&v55 = v29;
  sub_247CB5C7C(v30, v29);
  sub_247CEF724();
  swift_bridgeObjectRelease();
  if (!v60)
  {
    sub_247CBCE98((uint64_t)v59, &qword_2576F24D0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v54 + 56))(v6, 1, 1, v53);
    goto LABEL_25;
  }
  v33 = v53;
  v34 = swift_dynamicCast();
  v35 = v54;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(v6, v34 ^ 1u, 1, v33);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v6, 1, v33) == 1)
  {
LABEL_25:
    sub_247CBCE98((uint64_t)v6, &qword_2576F25F0);
    if (qword_2576F1CF8 != -1)
      swift_once();
    v44 = sub_247CEF598();
    __swift_project_value_buffer(v44, (uint64_t)qword_2576F49D0);
    v45 = sub_247CEF580();
    v46 = sub_247CEF6DC();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_247CAF000, v45, v46, "Failed to decode and retrieve enrollmentDate from record. ", v47, 2u);
      MEMORY[0x249590A5C](v47, -1, -1);

      sub_247CB6504(v51, v55);
    }
    else
    {
      sub_247CB6504(v51, v55);

    }
    sub_247CB6504(*v50, v50[1]);
LABEL_31:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    type metadata accessor for PrescriptionRecord();
    swift_deallocPartialClassInstance();
    return 0;
  }
  sub_247CB6504(v51, v55);
  v36 = *(void (**)(char *, char *, uint64_t))(v35 + 32);
  v37 = v52;
  v36(v52, v6, v33);
  v36(&v13[OBJC_IVAR___WFPrescriptionRecord_enrollmentDate], v37, v33);

  v38 = (objc_class *)type metadata accessor for PrescriptionRecord();
  v56.receiver = v13;
  v56.super_class = v38;
  v39 = objc_msgSendSuper2(&v56, sel_init);

  return v39;
}

id PrescriptionRecord.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PrescriptionRecord.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PrescriptionRecord.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PrescriptionRecord();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_247CBCE98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247CBCED4()
{
  return type metadata accessor for PrescriptionRecord();
}

uint64_t sub_247CBCEDC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247CEF508();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_247CBCF70(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_247CBCFBC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(void))((char *)sub_247CBD00C + 4 * byte_247CF10D4[a2]))();
}

uint64_t sub_247CBD00C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;

  if (a1 == a3 && v3 == 0x8000000247CF2090)
    v4 = 1;
  else
    v4 = sub_247CEF88C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_247CBD090(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aNotinitirunnin_0[8 * a1] == *(_QWORD *)&aNotinitirunnin_0[8 * a2]
    && *(_QWORD *)&aAlized_0[8 * a1] == *(_QWORD *)&aAlized_0[8 * a2])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_247CEF88C();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_247CBD114(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aNotintiainitia_0[8 * a1] == *(_QWORD *)&aNotintiainitia_0[8 * a2]
    && *(_QWORD *)&aNotintiainitia_0[8 * a1 + 24] == *(_QWORD *)&aNotintiainitia_0[8 * a2 + 24])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_247CEF88C();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_247CBD198(uint64_t a1)
{
  uint64_t result;

  result = 0xD000000000000014;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
    case 4:
      result = 0xD00000000000001ALL;
      break;
    case 2:
      result = 0xD00000000000002BLL;
      break;
    case 3:
      result = 0xD000000000000021;
      break;
    case 5:
      result = 0xD000000000000023;
      break;
    case 6:
      result = 0xD00000000000001CLL;
      break;
    case 7:
      result = 0xD000000000000016;
      break;
    default:
      result = sub_247CEF8A4();
      __break(1u);
      break;
  }
  return result;
}

BOOL sub_247CBD288(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_247CBD29C()
{
  sub_247CEF910();
  sub_247CEF634();
  return sub_247CEF928();
}

uint64_t sub_247CBD2FC()
{
  sub_247CCD810();
  return sub_247CEF4A8();
}

uint64_t sub_247CBD334()
{
  sub_247CEF910();
  sub_247CEF634();
  return sub_247CEF928();
}

unint64_t sub_247CBD390@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_247CCD3D4(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_247CBD3C0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_247CBD3CC()
{
  sub_247CCD810();
  return sub_247CEF4C0();
}

uint64_t sub_247CBD3F4()
{
  sub_247CCD810();
  return sub_247CEF4B4();
}

uint64_t sub_247CBD41C()
{
  uint64_t *v0;

  return sub_247CBD198(*v0);
}

unint64_t sub_247CBD424()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_247CBD440()
{
  sub_247CCD810();
  return sub_247CEF49C();
}

id WFSetupServer.dispatchQueue.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
  swift_beginAccess();
  return *v1;
}

void WFSetupServer.dispatchQueue.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*WFSetupServer.dispatchQueue.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t WFSetupServer.completionHandler.getter()
{
  return sub_247CBDCE4(&OBJC_IVAR___WFSetupServerInternal_completionHandler, (void (*)(_QWORD, _QWORD))sub_247CCFF58);
}

uint64_t WFSetupServer.completionHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_247CBDDFC(a1, a2, &OBJC_IVAR___WFSetupServerInternal_completionHandler, (uint64_t (*)(uint64_t, uint64_t))sub_247CCFF5C);
}

uint64_t (*WFSetupServer.completionHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WFSetupServer.activationHandler.getter()
{
  return sub_247CBDCE4(&OBJC_IVAR___WFSetupServerInternal_activationHandler, (void (*)(_QWORD, _QWORD))sub_247CCFF58);
}

uint64_t WFSetupServer.activationHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_247CBDDFC(a1, a2, &OBJC_IVAR___WFSetupServerInternal_activationHandler, (uint64_t (*)(uint64_t, uint64_t))sub_247CCFF5C);
}

uint64_t (*WFSetupServer.activationHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WFSetupServer.setupProgressEventHandler.getter()
{
  return sub_247CBDCE4(&OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler, (void (*)(_QWORD, _QWORD))sub_247CCFF58);
}

uint64_t WFSetupServer.setupProgressEventHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_247CBDDFC(a1, a2, &OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler, (uint64_t (*)(uint64_t, uint64_t))sub_247CCFF5C);
}

uint64_t (*WFSetupServer.setupProgressEventHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WFSetupServer.userInteractionProgressEventHandler.getter()
{
  return sub_247CBDCE4(&OBJC_IVAR___WFSetupServerInternal_userInteractionProgressEventHandler, (void (*)(_QWORD, _QWORD))sub_247CCFF58);
}

uint64_t sub_247CBD984(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t WFSetupServer.userInteractionProgressEventHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_247CBDDFC(a1, a2, &OBJC_IVAR___WFSetupServerInternal_userInteractionProgressEventHandler, (uint64_t (*)(uint64_t, uint64_t))sub_247CCFF5C);
}

uint64_t (*WFSetupServer.userInteractionProgressEventHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WFSetupServer.setupPromptPinHandler.getter()
{
  return sub_247CBDCE4(&OBJC_IVAR___WFSetupServerInternal_setupPromptPinHandler, (void (*)(_QWORD, _QWORD))sub_247CCFF58);
}

uint64_t sub_247CBDADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t, uint64_t);

  v5 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  swift_retain();
  v5(a2, a3);
  return swift_release();
}

uint64_t WFSetupServer.setupPromptPinHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_247CBDDFC(a1, a2, &OBJC_IVAR___WFSetupServerInternal_setupPromptPinHandler, (uint64_t (*)(uint64_t, uint64_t))sub_247CCFF5C);
}

uint64_t (*WFSetupServer.setupPromptPinHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_247CBDC2C(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[6];

  v7 = (uint64_t *)(a1 + *a3);
  swift_beginAccess();
  v8 = *v7;
  if (!*v7)
    return 0;
  v9 = v7[1];
  aBlock[4] = v8;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = a4;
  aBlock[3] = a5;
  v10 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v10;
}

uint64_t WFSetupServer.receivedObjectHandler.getter()
{
  return sub_247CBDCE4(&OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler, (void (*)(_QWORD, _QWORD))sub_247CBDD44);
}

uint64_t sub_247CBDCE4(_QWORD *a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(v2 + *a1);
  swift_beginAccess();
  v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_247CBDD44(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t WFSetupServer.receivedObjectHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_247CBDDFC(a1, a2, &OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler, (uint64_t (*)(uint64_t, uint64_t))sub_247CBDE58);
}

uint64_t sub_247CBDDFC(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  v9 = *v8;
  v10 = v8[1];
  *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t sub_247CBDE58(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t (*WFSetupServer.receivedObjectHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *WFSetupServer.anisetteDataProvider.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___WFSetupServerInternal_anisetteDataProvider);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_247CBDF9C(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___WFSetupServerInternal_anisetteDataProvider);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t sub_247CBDFFC()
{
  sub_247CEF79C();
  sub_247CEF67C();
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  sub_247CEF67C();
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  sub_247CEF67C();
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_247CBE158(char a1)
{
  return *(_QWORD *)&aNotintiainitia_0[8 * a1];
}

uint64_t sub_247CBE178(char *a1, char *a2)
{
  return sub_247CBD114(*a1, *a2);
}

uint64_t sub_247CBE184()
{
  return sub_247CB68A4();
}

uint64_t sub_247CBE18C()
{
  return sub_247CB6A40();
}

uint64_t sub_247CBE194()
{
  return sub_247CB6A80();
}

uint64_t sub_247CBE19C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_247CCD3E4();
  *a1 = result;
  return result;
}

uint64_t sub_247CBE1C8@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_247CBE158(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_247CBE1F0()
{
  char *v0;

  return sub_247CBE158(*v0);
}

uint64_t sub_247CBE1F8(char a1)
{
  return *(_QWORD *)&aNotinitirunnin_0[8 * a1];
}

uint64_t sub_247CBE218(char *a1, char *a2)
{
  return sub_247CBD090(*a1, *a2);
}

uint64_t sub_247CBE224()
{
  return sub_247CB690C();
}

uint64_t sub_247CBE22C()
{
  return sub_247CB6A00();
}

uint64_t sub_247CBE234()
{
  return sub_247CB6AE4();
}

uint64_t sub_247CBE23C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_247CCD42C();
  *a1 = result;
  return result;
}

uint64_t sub_247CBE268@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_247CBE1F8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_247CBE290()
{
  char *v0;

  return sub_247CBE1F8(*v0);
}

uint64_t sub_247CBE298()
{
  return sub_247CBDFFC();
}

id WFSetupServer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id WFSetupServer.init()()
{
  char *v0;
  uint64_t v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  objc_super v17;
  _BYTE v18[24];
  ValueMetadata *v19;
  _UNKNOWN **v20;

  v1 = OBJC_IVAR___WFSetupServerInternal_dispatchQueue;
  sub_247CBBA5C(0, (unint64_t *)&qword_2576F1D40);
  v2 = v0;
  *(_QWORD *)&v0[v1] = sub_247CEF70C();
  v3 = &v2[OBJC_IVAR___WFSetupServerInternal_completionHandler];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = &v2[OBJC_IVAR___WFSetupServerInternal_activationHandler];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &v2[OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &v2[OBJC_IVAR___WFSetupServerInternal_userInteractionProgressEventHandler];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v2[OBJC_IVAR___WFSetupServerInternal_setupPromptPinHandler];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = &v2[OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  *(_QWORD *)&v2[OBJC_IVAR___WFSetupServerInternal_anisetteDataProvider] = 0;
  v2[OBJC_IVAR___WFSetupServerInternal_shouldAdvertiseFast] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___WFSetupServerInternal_sfService] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___WFSetupServerInternal_resumeAuthTag] = 0;
  v9 = &v2[OBJC_IVAR___WFSetupServerInternal_peer];
  v10 = sub_247CEF550();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(_QWORD *)&v2[OBJC_IVAR___WFSetupServerInternal_sfSession] = 0;
  *(_DWORD *)&v2[OBJC_IVAR___WFSetupServerInternal_serverState] = 0;
  v11 = OBJC_IVAR___WFSetupServerInternal_analyticsManager;
  v19 = &type metadata for CoreAnalyticsBackend;
  v20 = &off_25194C828;
  type metadata accessor for AnalyticsManager();
  v12 = swift_allocObject();
  v13 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v18, (uint64_t)&type metadata for CoreAnalyticsBackend);
  MEMORY[0x24BDAC7A8](v13, v13);
  (*(void (**)(void))(v14 + 16))();
  *(_QWORD *)(v12 + 40) = &type metadata for CoreAnalyticsBackend;
  *(_QWORD *)(v12 + 48) = &off_25194C828;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  *(_QWORD *)&v2[v11] = v12;
  *(_QWORD *)&v2[OBJC_IVAR___WFSetupServerInternal_preventExitForLocaleClient] = 0;

  v15 = (objc_class *)type metadata accessor for WFSetupServer();
  v17.receiver = v2;
  v17.super_class = v15;
  return objc_msgSendSuper2(&v17, sel_init);
}

uint64_t type metadata accessor for WFSetupServer()
{
  uint64_t result;

  result = qword_2576F2778;
  if (!qword_2576F2778)
    return swift_getSingletonMetadata();
  return result;
}

char *WFSetupServer.__allocating_init(queue:)(void *a1)
{
  objc_class *v1;
  char *v3;
  void **v4;
  void *v5;

  v3 = (char *)objc_msgSend(objc_allocWithZone(v1), sel_init);
  v4 = (void **)&v3[OBJC_IVAR___WFSetupServerInternal_dispatchQueue];
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;

  return v3;
}

char *WFSetupServer.init(queue:)(void *a1)
{
  void *v1;
  char *v3;
  void **v4;
  void *v5;

  v3 = (char *)objc_msgSend(v1, sel_init);
  v4 = (void **)&v3[OBJC_IVAR___WFSetupServerInternal_dispatchQueue];
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;

  return v3;
}

id WFSetupServer.__deallocating_deinit()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  objc_super v7;

  v1 = v0;
  if (qword_2576F1D00 != -1)
    swift_once();
  v2 = sub_247CEF598();
  __swift_project_value_buffer(v2, (uint64_t)qword_2576F49E8);
  v3 = sub_247CEF580();
  v4 = sub_247CEF6E8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_247CAF000, v3, v4, "WFSetupServer deinit.", v5, 2u);
    MEMORY[0x249590A5C](v5, -1, -1);
  }

  sub_247CC3E8C();
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for WFSetupServer();
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

Swift::Void __swiftcall WFSetupServer.prepareToRun()()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  const char *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;

  if (qword_2576F1D00 != -1)
    swift_once();
  v1 = sub_247CEF598();
  __swift_project_value_buffer(v1, (uint64_t)qword_2576F49E8);
  v2 = sub_247CEF580();
  v3 = sub_247CEF6E8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v16 = v5;
    *(_DWORD *)v4 = 136446210;
    sub_247CB5D84(0x5465726170657270, 0xEE0029286E75526FLL, &v16);
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v2, v3, "Running %{public}s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v5, -1, -1);
    MEMORY[0x249590A5C](v4, -1, -1);
  }

  v6 = OBJC_IVAR___WFSetupServerInternal_preventExitForLocaleClient;
  if (*(_QWORD *)(v0 + OBJC_IVAR___WFSetupServerInternal_preventExitForLocaleClient))
  {
    v7 = sub_247CEF580();
    v8 = sub_247CEF6E8();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      v10 = "preventExitForLocaleClient is already active";
LABEL_12:
      _os_log_impl(&dword_247CAF000, v7, v8, v10, v9, 2u);
      MEMORY[0x249590A5C](v9, -1, -1);
    }
  }
  else
  {
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE900E8]), sel_init);
    v12 = *(void **)(v0 + v6);
    *(_QWORD *)(v0 + v6) = v11;

    v13 = *(void **)(v0 + v6);
    if (v13)
    {
      v14 = v13;
      v15 = (void *)sub_247CEF64C();
      objc_msgSend(v14, sel_preventExitForLocaleReason_, v15);

    }
    v7 = sub_247CEF580();
    v8 = sub_247CEF6E8();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      v10 = "preventExitForLocaleClient activated";
      goto LABEL_12;
    }
  }

}

Swift::Void __swiftcall WFSetupServer.activate()()
{
  char *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void **v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  char *v17;
  uint64_t v18;
  _QWORD aBlock[6];

  v1 = sub_247CEF5A4();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v4);
  v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_247CEF5BC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (void **)&v0[OBJC_IVAR___WFSetupServerInternal_dispatchQueue];
  swift_beginAccess();
  v13 = *v12;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v0;
  aBlock[4] = sub_247CCCEC0;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247CBF050;
  aBlock[3] = &block_descriptor;
  v15 = _Block_copy(aBlock);
  v16 = v13;
  v17 = v0;
  sub_247CEF5B0();
  v18 = MEMORY[0x24BEE4AF8];
  sub_247CCF9D4((unint64_t *)&qword_2576F2710, v2, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2718);
  sub_247CCCEE0();
  sub_247CEF76C();
  MEMORY[0x2495903B4](0, v11, v6, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v1);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  swift_release();
}

void sub_247CBEE84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  NSObject *oslog;

  v1 = OBJC_IVAR___WFSetupServerInternal_serverState;
  if ((*(_BYTE *)(a1 + OBJC_IVAR___WFSetupServerInternal_serverState) & 1) != 0)
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    v2 = sub_247CEF598();
    __swift_project_value_buffer(v2, (uint64_t)qword_2576F49E8);
    oslog = sub_247CEF580();
    v3 = sub_247CEF6E8();
    if (os_log_type_enabled(oslog, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_247CAF000, oslog, v3, "WFSetupServer is already activated.", v4, 2u);
      MEMORY[0x249590A5C](v4, -1, -1);
    }

  }
  else
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    v6 = sub_247CEF598();
    __swift_project_value_buffer(v6, (uint64_t)qword_2576F49E8);
    v7 = sub_247CEF580();
    v8 = sub_247CEF6E8();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_247CAF000, v7, v8, "Activating WFSetupServer", v9, 2u);
      MEMORY[0x249590A5C](v9, -1, -1);
    }

    *(_BYTE *)(a1 + v1) = 1;
    *(_BYTE *)(a1 + OBJC_IVAR___WFSetupServerInternal_shouldAdvertiseFast) = 1;
    WFSetupServer.prepareToRun()();
    sub_247CC41EC();
  }
}

uint64_t sub_247CBF050(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

Swift::Void __swiftcall WFSetupServer.invalidate()()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  void **v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  char *v21;
  uint64_t v22;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_247CEF5A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_247CEF5BC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576F1D00 != -1)
    swift_once();
  v12 = sub_247CEF598();
  __swift_project_value_buffer(v12, (uint64_t)qword_2576F49E8);
  v13 = sub_247CEF580();
  v14 = sub_247CEF6E8();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_247CAF000, v13, v14, "WFSetupServer invalidate called", v15, 2u);
    MEMORY[0x249590A5C](v15, -1, -1);
  }

  v16 = (void **)&v1[OBJC_IVAR___WFSetupServerInternal_dispatchQueue];
  swift_beginAccess();
  v17 = *v16;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v1;
  aBlock[4] = sub_247CCCF70;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247CBF050;
  aBlock[3] = &block_descriptor_6;
  v19 = _Block_copy(aBlock);
  v20 = v17;
  v21 = v1;
  sub_247CEF5B0();
  v22 = MEMORY[0x24BEE4AF8];
  sub_247CCF9D4((unint64_t *)&qword_2576F2710, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2718);
  sub_247CCCEE0();
  sub_247CEF76C();
  MEMORY[0x2495903B4](0, v11, v6, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  swift_release();
}

void sub_247CBF350(uint64_t a1)
{
  _BYTE *v2;
  char v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *oslog;

  v2 = (_BYTE *)(a1 + OBJC_IVAR___WFSetupServerInternal_serverState);
  if (*(_BYTE *)(a1 + OBJC_IVAR___WFSetupServerInternal_serverState + 2)
    && *(_BYTE *)(a1 + OBJC_IVAR___WFSetupServerInternal_serverState + 2) == 1)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    if (qword_2576F1D00 != -1)
      swift_once();
    v4 = sub_247CEF598();
    __swift_project_value_buffer(v4, (uint64_t)qword_2576F49E8);
    oslog = sub_247CEF580();
    v5 = sub_247CEF6E8();
    if (os_log_type_enabled(oslog, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_247CAF000, oslog, v5, "Invalidate method already called", v6, 2u);
      MEMORY[0x249590A5C](v6, -1, -1);
    }

    return;
  }
  v3 = sub_247CEF88C();
  swift_bridgeObjectRelease();
  if ((v3 & 1) != 0)
    goto LABEL_5;
  v2[2] = 1;
  v7 = *(void **)(a1 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  if (v7)
  {
    v8 = v7;
    sub_247CCAF94(v8);

  }
  v9 = OBJC_IVAR___WFSetupServerInternal_sfService;
  objc_msgSend(*(id *)(a1 + OBJC_IVAR___WFSetupServerInternal_sfService), sel_invalidate);
  v10 = *(void **)(a1 + v9);
  *(_QWORD *)(a1 + v9) = 0;

  *v2 = 0;
  sub_247CC9118();
}

Swift::Void __swiftcall WFSetupServer.sendObject(object:encrypted:)(Swift::OpaquePointer object, Swift::Bool encrypted)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  os_log_type_t v22;
  uint8_t *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_247CEF550();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(void **)(v2 + OBJC_IVAR___WFSetupServerInternal_sfService);
  if (v14)
  {
    v15 = v2 + OBJC_IVAR___WFSetupServerInternal_peer;
    swift_beginAccess();
    sub_247CCFBBC(v15, (uint64_t)v8, &qword_2576F2728);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    {
      v16 = v14;
      sub_247CBCE98((uint64_t)v8, &qword_2576F2728);
      if (qword_2576F1D00 != -1)
        swift_once();
      v17 = sub_247CEF598();
      __swift_project_value_buffer(v17, (uint64_t)qword_2576F49E8);
      v18 = sub_247CEF580();
      v19 = sub_247CEF6DC();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_247CAF000, v18, v19, "Attempted to send object without peer", v20, 2u);
        MEMORY[0x249590A5C](v20, -1, -1);
      }

    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v13, v8, v9);
      v24 = v14;
      v25 = (void *)sub_247CEF538();
      sub_247CBF89C((uint64_t)object._rawValue);
      v26 = (void *)sub_247CEF604();
      swift_bridgeObjectRelease();
      objc_msgSend(v24, sel_sendToPeer_flags_object_, v25, encrypted, v26);

      (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
  }
  else
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    v21 = sub_247CEF598();
    __swift_project_value_buffer(v21, (uint64_t)qword_2576F49E8);
    v27 = sub_247CEF580();
    v22 = sub_247CEF6DC();
    if (os_log_type_enabled(v27, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_247CAF000, v27, v22, "Attempting to send object without sfService", v23, 2u);
      MEMORY[0x249590A5C](v23, -1, -1);
    }

  }
}

uint64_t sub_247CBF89C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2840);
    v2 = sub_247CEF838();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_247CB674C(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_247CCCFBC(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_247CCCFBC(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_247CCCFBC(v36, v37);
    sub_247CCCFBC(v37, &v33);
    result = sub_247CEF778();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_247CCCFBC(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_247CCFC00();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

void WFSetupServer.sendSetup(action:info:responseHandler:)(int a1, uint64_t a2, void (*a3)(void *, _QWORD, _QWORD), uint64_t a4)
{
  uint64_t v4;
  void *v7;
  uint64_t inited;
  id v11;
  unint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t (*v19)();
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  uint64_t (*v29)(uint64_t, void *, uint64_t, uint64_t);
  void *v30;
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  _OWORD v34[2];

  v7 = *(void **)(v4 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  if (v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2738);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247CF1020;
    *(_QWORD *)(inited + 32) = 0xD000000000000010;
    *(_QWORD *)(inited + 40) = 0x8000000247CF2D90;
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1328];
    *(_BYTE *)(inited + 48) = 1;
    v11 = v7;
    v12 = sub_247CC01C4(inited);
    v30 = (void *)MEMORY[0x24BEE44F0];
    LODWORD(v28) = a1;
    sub_247CCCFBC(&v28, v34);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v33 = a2;
    sub_247CCD07C(v34, 24947, 0xE200000000000000, isUniquelyReferenced_nonNull_native);
    v14 = v33;
    swift_bridgeObjectRelease();
    v15 = (void *)sub_247CEF64C();
    sub_247CBF89C(v12);
    swift_bridgeObjectRelease();
    v16 = (void *)sub_247CEF604();
    swift_bridgeObjectRelease();
    sub_247CBF89C(v14);
    swift_bridgeObjectRelease();
    v17 = (void *)sub_247CEF604();
    swift_bridgeObjectRelease();
    if (a3)
    {
      v18 = swift_allocObject();
      *(_QWORD *)(v18 + 16) = a3;
      *(_QWORD *)(v18 + 24) = a4;
      v19 = (uint64_t (*)())sub_247CCD1B0;
    }
    else
    {
      v18 = 0;
      v19 = nullsub_1;
    }
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = v19;
    *(_QWORD *)(v26 + 24) = v18;
    v31 = sub_247CCD1AC;
    v32 = v26;
    *(_QWORD *)&v28 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v28 + 1) = 1107296256;
    v29 = sub_247CC07F0;
    v30 = &block_descriptor_12;
    v27 = _Block_copy(&v28);
    sub_247CBDD44((uint64_t)a3);
    swift_release();
    objc_msgSend(v11, sel_sendRequestID_options_request_responseHandler_, v15, v16, v17, v27);

    _Block_release(v27);
  }
  else
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    v20 = sub_247CEF598();
    __swift_project_value_buffer(v20, (uint64_t)qword_2576F49E8);
    v21 = sub_247CEF580();
    v22 = sub_247CEF6DC();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_247CAF000, v21, v22, "Server is not ready to send a setup action", v23, 2u);
      MEMORY[0x249590A5C](v23, -1, -1);
    }

    if (a3)
    {
      sub_247CCCF78();
      v24 = (void *)swift_allocError();
      *v25 = 0;
      swift_retain();
      a3(v24, 0, 0);

      sub_247CBDE58((uint64_t)a3);
    }
  }
}

unint64_t sub_247CC0084(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2840);
  v2 = sub_247CEF838();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_247CCFBBC(v6, (uint64_t)v15, &qword_2576F2848);
    result = sub_247CDD188((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_247CCCFBC(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_247CC01C4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2850);
  v2 = sub_247CEF838();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_247CCFBBC(v6, (uint64_t)&v15, &qword_2576F2858);
    v7 = v15;
    v8 = v16;
    result = sub_247CDD1B8(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_247CCCFBC(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_247CC02F8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2830);
  v2 = (_QWORD *)sub_247CEF838();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_DWORD *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_247CDD1B8(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_DWORD *)(v2[7] + 4 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 6;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_247CC0408(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F27C8);
  v2 = (_QWORD *)sub_247CEF838();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_247CDD1B8(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_247CC0528(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F27C0);
  v2 = (_QWORD *)sub_247CEF838();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_247CDD1B8(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_247CC0640(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F27D0);
  v2 = sub_247CEF838();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_247CCFBBC(v6, (uint64_t)&v15, &qword_2576F27D8);
    v7 = v15;
    v8 = v16;
    result = sub_247CDD1B8(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = sub_247CCD854((uint64_t)&v17, v3[7] + 32 * result, &qword_2576F24D0);
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_247CC0788(_QWORD *a1, _QWORD *a2, _QWORD *a3, uint64_t (*a4)(_QWORD, _QWORD, _QWORD))
{
  return a4(*a1, *a2, *a3);
}

uint64_t sub_247CC07B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t *, uint64_t *, uint64_t *))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = a2;
  v7 = a1;
  v5 = a3;
  return a4(&v7, &v6, &v5);
}

uint64_t sub_247CC07F0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void (*v6)(void *, uint64_t, uint64_t);
  uint64_t v7;
  id v8;

  v4 = a4;
  v6 = *(void (**)(void *, uint64_t, uint64_t))(a1 + 32);
  if (!a3)
  {
    v7 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = sub_247CEF61C();
  if (v4)
LABEL_3:
    v4 = sub_247CEF61C();
LABEL_4:
  swift_retain();
  v8 = a2;
  v6(a2, v7, v4);
  swift_release();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void WFSetupServer.sendUserInteractionEvent(inEvent:withEncryption:responseHandler:)(uint64_t a1, char a2, void (*a3)(void *, _QWORD, _QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t (*v18)();
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t inited;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  char v40;
  uint64_t aBlock;
  unint64_t v42;
  uint64_t (*v43)(uint64_t, void *, uint64_t, uint64_t);
  void *v44;
  uint64_t (*v45)(uint64_t, uint64_t, uint64_t);
  uint64_t v46;

  v5 = v4;
  if (qword_2576F1D00 != -1)
    swift_once();
  v7 = sub_247CEF598();
  __swift_project_value_buffer(v7, (uint64_t)qword_2576F49E8);
  swift_bridgeObjectRetain_n();
  v8 = sub_247CEF580();
  v9 = sub_247CEF6E8();
  if (os_log_type_enabled(v8, v9))
  {
    v40 = a2;
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    aBlock = v11;
    *(_DWORD *)v10 = 136446722;
    sub_247CB5D84(0xD000000000000041, 0x8000000247CF2DF0, &aBlock);
    sub_247CEF748();
    *(_WORD *)(v10 + 12) = 2082;
    swift_bridgeObjectRetain();
    v12 = sub_247CEF628();
    v14 = v13;
    swift_bridgeObjectRelease();
    sub_247CB5D84(v12, v14, &aBlock);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 22) = 1024;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v8, v9, "%{public}s invoked with inEvent: %{public}s, withEncryption: %{BOOL}d", (uint8_t *)v10, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v11, -1, -1);
    v15 = v10;
    a2 = v40;
    MEMORY[0x249590A5C](v15, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v16 = *(void **)(v5 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  if (v16)
  {
    if (a3)
    {
      v17 = swift_allocObject();
      *(_QWORD *)(v17 + 16) = a3;
      *(_QWORD *)(v17 + 24) = a4;
      v18 = (uint64_t (*)())sub_247CCD1B0;
    }
    else
    {
      v17 = 0;
      v18 = nullsub_1;
    }
    v24 = swift_allocObject();
    *(_QWORD *)(v24 + 16) = v18;
    *(_QWORD *)(v24 + 24) = v17;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247CF1020;
    aBlock = 0xD000000000000010;
    v42 = 0x8000000247CF2D90;
    v37 = v16;
    sub_247CBDD44((uint64_t)a3);
    sub_247CEF790();
    *(_QWORD *)(inited + 96) = MEMORY[0x24BEE1328];
    *(_BYTE *)(inited + 72) = (a2 & 1) == 0;
    sub_247CC0084(inited);
    swift_bridgeObjectRetain_n();
    v26 = sub_247CEF580();
    v27 = sub_247CEF6E8();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = swift_slowAlloc();
      v29 = swift_slowAlloc();
      aBlock = v29;
      *(_DWORD *)v28 = 136446466;
      swift_bridgeObjectRetain();
      v30 = sub_247CEF628();
      v32 = v31;
      swift_bridgeObjectRelease();
      sub_247CB5D84(v30, v32, &aBlock);
      sub_247CEF748();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 1024;
      sub_247CEF748();
      _os_log_impl(&dword_247CAF000, v26, v27, "Sending interaction event: %{public}s, withEncryption: %{BOOL}d", (uint8_t *)v28, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v29, -1, -1);
      MEMORY[0x249590A5C](v28, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v33 = (void *)sub_247CEF64C();
    v34 = (void *)sub_247CEF604();
    swift_bridgeObjectRelease();
    v35 = (void *)sub_247CEF604();
    v45 = sub_247CCD1AC;
    v46 = v24;
    aBlock = MEMORY[0x24BDAC760];
    v42 = 1107296256;
    v43 = sub_247CC07F0;
    v44 = &block_descriptor_22;
    v36 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v37, sel_sendRequestID_options_request_responseHandler_, v33, v34, v35, v36);
    _Block_release(v36);

    swift_release();
  }
  else
  {
    v19 = sub_247CEF580();
    v20 = sub_247CEF6DC();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_247CAF000, v19, v20, "Failed to send object to server. SfSession is not available. ", v21, 2u);
      MEMORY[0x249590A5C](v21, -1, -1);
    }

    if (a3)
    {
      sub_247CCCF78();
      v22 = (void *)swift_allocError();
      *v23 = 0;
      a3(v22, 0, 0);

    }
  }
}

void WFSetupServer.startSecureChannelPairing(with:context:completion:)(int a1, uint64_t a2, void (*a3)(_QWORD, _QWORD), _BYTE *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  int v24;
  _BOOL4 v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  void (*v29)(_QWORD, _QWORD);
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  void *v48;
  _QWORD *v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  void *v56;
  _QWORD *v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  _QWORD *v67;
  _BYTE v68[12];
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _BYTE *v75;
  _BYTE *v76;
  int v77;
  _BYTE *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  v5 = v4;
  v77 = a1;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  v11 = MEMORY[0x24BDAC7A8](v9, v10);
  v76 = &v68[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v11, v13);
  v78 = &v68[-v14];
  v15 = sub_247CEF550();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15, v17);
  v19 = &v68[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2576F1D00 != -1)
    swift_once();
  v20 = sub_247CEF598();
  v21 = __swift_project_value_buffer(v20, (uint64_t)qword_2576F49E8);
  swift_bridgeObjectRetain_n();
  v79 = v21;
  v22 = sub_247CEF580();
  v23 = sub_247CEF6E8();
  v24 = v23;
  v25 = os_log_type_enabled(v22, v23);
  v72 = a2;
  if (v25)
  {
    v26 = swift_slowAlloc();
    v70 = swift_slowAlloc();
    v81 = v70;
    *(_DWORD *)v26 = 136446722;
    v75 = v19;
    v80 = sub_247CB5D84(0xD000000000000033, 0x8000000247CF2E40, &v81);
    v73 = v5;
    v74 = v16;
    sub_247CEF748();
    *(_WORD *)(v26 + 12) = 1024;
    LODWORD(v80) = v77 & 1;
    sub_247CEF748();
    *(_WORD *)(v26 + 18) = 2080;
    swift_bridgeObjectRetain();
    v71 = v15;
    v27 = sub_247CEF628();
    v69 = v24;
    v28 = a4;
    v29 = a3;
    v31 = v30;
    swift_bridgeObjectRelease();
    v32 = v27;
    v5 = v73;
    v80 = sub_247CB5D84(v32, v31, &v81);
    v16 = v74;
    v19 = v75;
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    a3 = v29;
    a4 = v28;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v22, (os_log_type_t)v69, "%{public}s invoked with reset flag: %{BOOL}d and context: %s", (uint8_t *)v26, 0x1Cu);
    v33 = v70;
    v15 = v71;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v33, -1, -1);
    MEMORY[0x249590A5C](v26, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v34 = *(void **)(v5 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  if (v34)
  {
    v35 = v34;
    v36 = objc_msgSend(v35, sel_peerDevice);
    if (!v36)
    {
      v41 = (uint64_t)v78;
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v78, 1, 1, v15);
LABEL_16:
      sub_247CBCE98(v41, &qword_2576F2728);
      v50 = sub_247CEF580();
      v51 = sub_247CEF6DC();
      if (os_log_type_enabled(v50, v51))
      {
        v52 = (uint8_t *)swift_slowAlloc();
        v53 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v52 = 138412290;
        sub_247CCCF78();
        swift_allocError();
        *v54 = 4;
        v55 = _swift_stdlib_bridgeErrorToNSError();
        v81 = v55;
        sub_247CEF748();
        *v53 = v55;
        _os_log_impl(&dword_247CAF000, v50, v51, "Failed to start pair setup session due to error: %@", v52, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v53, -1, -1);
        MEMORY[0x249590A5C](v52, -1, -1);
      }

      sub_247CCCF78();
      v56 = (void *)swift_allocError();
      *v57 = 4;
      a3(v56, 0);

      return;
    }
    v37 = v36;
    v38 = objc_msgSend(v36, sel_identifier);

    if (v38)
    {
      v39 = (uint64_t)v76;
      sub_247CEF544();

      v40 = 0;
      v41 = (uint64_t)v78;
    }
    else
    {
      v40 = 1;
      v41 = (uint64_t)v78;
      v39 = (uint64_t)v76;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(v39, v40, 1, v15);
    sub_247CCD854(v39, v41, &qword_2576F2728);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v41, 1, v15) == 1)
      goto LABEL_16;
    v78 = a4;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v16 + 32))(v19, v41, v15);
    if (*(_QWORD *)(v5 + OBJC_IVAR___WFSetupServerInternal_sfService))
    {
      v58 = *(unsigned __int8 *)(v5 + OBJC_IVAR___WFSetupServerInternal_serverState + 3);
      v75 = v19;
      __asm { BR              X10 }
    }
    v59 = sub_247CEF580();
    v60 = sub_247CEF6DC();
    if (os_log_type_enabled(v59, v60))
    {
      v74 = v16;
      v61 = (uint8_t *)swift_slowAlloc();
      v62 = (_QWORD *)swift_slowAlloc();
      v75 = v19;
      *(_DWORD *)v61 = 138412290;
      sub_247CCCF78();
      swift_allocError();
      *v63 = 1;
      v64 = v15;
      v65 = _swift_stdlib_bridgeErrorToNSError();
      v81 = v65;
      v16 = v74;
      v19 = v75;
      sub_247CEF748();
      *v62 = v65;
      v15 = v64;
      _os_log_impl(&dword_247CAF000, v59, v60, "Failed to start pair setup session due to error: %@", v61, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v62, -1, -1);
      MEMORY[0x249590A5C](v61, -1, -1);
    }

    sub_247CCCF78();
    v66 = (void *)swift_allocError();
    *v67 = 1;
    a3(v66, 0);

    (*(void (**)(_BYTE *, uint64_t))(v16 + 8))(v19, v15);
  }
  else
  {
    v42 = sub_247CEF580();
    v43 = sub_247CEF6DC();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v45 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v44 = 138412290;
      sub_247CCCF78();
      swift_allocError();
      *v46 = 0;
      v47 = _swift_stdlib_bridgeErrorToNSError();
      v81 = v47;
      sub_247CEF748();
      *v45 = v47;
      _os_log_impl(&dword_247CAF000, v42, v43, "Failed to start pair setup session due to no available SFSession: %@", v44, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v45, -1, -1);
      MEMORY[0x249590A5C](v44, -1, -1);
    }

    sub_247CCCF78();
    v48 = (void *)swift_allocError();
    *v49 = 0;
    a3(v48, 0);

  }
}

void sub_247CC1CC4(void *a1, uint64_t a2, uint64_t a3)
{
  sub_247CC1CE4(a1, a2, a3, 8uLL, "Successfully sent over event: (%s");
}

void sub_247CC1CD4(void *a1, uint64_t a2, uint64_t a3)
{
  sub_247CC1CE4(a1, a2, a3, 5uLL, "Successfully sent over event: (%s)");
}

void sub_247CC1CE4(void *a1, uint64_t a2, uint64_t a3, unint64_t a4, const char *a5)
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  __CFString *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  NSObject *oslog;
  uint64_t v30;

  if (a1)
  {
    v7 = a1;
    if (qword_2576F1D00 != -1)
      swift_once();
    v8 = sub_247CEF598();
    __swift_project_value_buffer(v8, (uint64_t)qword_2576F49E8);
    v9 = a1;
    v10 = a1;
    oslog = sub_247CEF580();
    v11 = sub_247CEF6DC();
    if (os_log_type_enabled(oslog, v11))
    {
      v12 = swift_slowAlloc();
      v13 = swift_slowAlloc();
      v30 = v13;
      *(_DWORD *)v12 = 136446466;
      v14 = WFSetupProgressEventToString(a4);
      v15 = sub_247CEF658();
      v17 = v16;

      sub_247CB5D84(v15, v17, &v30);
      sub_247CEF748();
      swift_bridgeObjectRelease();
      *(_WORD *)(v12 + 12) = 2082;
      swift_getErrorValue();
      v18 = sub_247CEF8C8();
      sub_247CB5D84(v18, v19, &v30);
      sub_247CEF748();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_247CAF000, oslog, v11, "Failed to send over event: (%{public}s, with error: %{public}s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v13, -1, -1);
      MEMORY[0x249590A5C](v12, -1, -1);

      return;
    }

  }
  else
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    v21 = sub_247CEF598();
    __swift_project_value_buffer(v21, (uint64_t)qword_2576F49E8);
    oslog = sub_247CEF580();
    v22 = sub_247CEF6E8();
    if (os_log_type_enabled(oslog, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v30 = v24;
      *(_DWORD *)v23 = 136315138;
      v25 = WFSetupProgressEventToString(a4);
      v26 = sub_247CEF658();
      v28 = v27;

      sub_247CB5D84(v26, v28, &v30);
      sub_247CEF748();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, oslog, v22, a5, v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v24, -1, -1);
      MEMORY[0x249590A5C](v23, -1, -1);

      return;
    }
  }

}

void sub_247CC2138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  id v5;

  if (a1)
    v4 = sub_247CEF4CC();
  else
    v4 = 0;
  v5 = (id)v4;
  (*(void (**)(uint64_t))(a3 + 16))(a3);

}

void WFSetupServer.startSecureChannelPairing(with:completion:)(int a1, void (*a2)(_QWORD, _QWORD), uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  void *v40;
  _QWORD *v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  _QWORD *v46;
  _QWORD *v47;
  void (*v48)(_QWORD, _QWORD);
  uint64_t v49;
  void *v50;
  _QWORD *v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  char *v59;
  uint64_t v60;
  _QWORD *v61;
  void *v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;

  v4 = v3;
  v66 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  v9 = MEMORY[0x24BDAC7A8](v7, v8);
  v69 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)&v64 - v12;
  v14 = sub_247CEF550();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14, v16);
  v18 = (char *)&v64 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576F1D00 != -1)
    swift_once();
  v19 = sub_247CEF598();
  v68 = __swift_project_value_buffer(v19, (uint64_t)qword_2576F49E8);
  v20 = sub_247CEF580();
  v21 = sub_247CEF6E8();
  v22 = os_log_type_enabled(v20, v21);
  v67 = v13;
  if (v22)
  {
    v23 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    v65 = v15;
    v25 = v24;
    v71 = v24;
    *(_DWORD *)v23 = 136446466;
    v70 = sub_247CB5D84(0xD00000000000002BLL, 0x8000000247CF2E80, &v71);
    sub_247CEF748();
    *(_WORD *)(v23 + 12) = 1024;
    LODWORD(v70) = v66 & 1;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v20, v21, "%{public}s invoked with reset flag: %{BOOL}d", (uint8_t *)v23, 0x12u);
    swift_arrayDestroy();
    v26 = v25;
    v15 = v65;
    MEMORY[0x249590A5C](v26, -1, -1);
    MEMORY[0x249590A5C](v23, -1, -1);
  }

  v27 = *(void **)&v3[OBJC_IVAR___WFSetupServerInternal_sfSession];
  v28 = (uint64_t)v69;
  if (v27)
  {
    v29 = v27;
    v30 = objc_msgSend(v29, sel_peerDevice);
    if (!v30)
    {
      v42 = (uint64_t)v67;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v67, 1, 1, v14);
LABEL_15:
      sub_247CBCE98(v42, &qword_2576F2728);
      v43 = sub_247CEF580();
      v44 = sub_247CEF6DC();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        v46 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v45 = 138412290;
        sub_247CCCF78();
        swift_allocError();
        *v47 = 4;
        v48 = a2;
        v49 = _swift_stdlib_bridgeErrorToNSError();
        v71 = v49;
        sub_247CEF748();
        *v46 = v49;
        a2 = v48;
        _os_log_impl(&dword_247CAF000, v43, v44, "Failed to start pair setup session due to error: %@", v45, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v46, -1, -1);
        MEMORY[0x249590A5C](v45, -1, -1);
      }

      sub_247CCCF78();
      v50 = (void *)swift_allocError();
      *v51 = 4;
      a2(v50, 0);

      return;
    }
    v31 = v30;
    v32 = objc_msgSend(v30, sel_identifier);

    if (v32)
    {
      sub_247CEF544();

      v33 = 0;
    }
    else
    {
      v33 = 1;
    }
    v42 = (uint64_t)v67;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v28, v33, 1, v14);
    sub_247CCD854(v28, v42, &qword_2576F2728);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v42, 1, v14) == 1)
      goto LABEL_15;
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v18, v42, v14);
    if (*(_QWORD *)&v4[OBJC_IVAR___WFSetupServerInternal_sfService])
    {
      v65 = v15;
      v67 = v4;
      v52 = v4[OBJC_IVAR___WFSetupServerInternal_serverState + 3];
      v69 = v18;
      __asm { BR              X10 }
    }
    v53 = sub_247CEF580();
    v54 = sub_247CEF6DC();
    if (os_log_type_enabled(v53, v54))
    {
      v68 = a3;
      v55 = (uint8_t *)swift_slowAlloc();
      v56 = swift_slowAlloc();
      v65 = v15;
      v57 = (_QWORD *)v56;
      v67 = (char *)v14;
      *(_DWORD *)v55 = 138412290;
      sub_247CCCF78();
      swift_allocError();
      *v58 = 1;
      v59 = v18;
      v60 = _swift_stdlib_bridgeErrorToNSError();
      v71 = v60;
      v14 = (uint64_t)v67;
      sub_247CEF748();
      *v57 = v60;
      v18 = v59;
      _os_log_impl(&dword_247CAF000, v53, v54, "Failed to start pair setup session due to error: %@", v55, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
      swift_arrayDestroy();
      v61 = v57;
      v15 = v65;
      MEMORY[0x249590A5C](v61, -1, -1);
      MEMORY[0x249590A5C](v55, -1, -1);
    }

    sub_247CCCF78();
    v62 = (void *)swift_allocError();
    *v63 = 1;
    a2(v62, 0);

    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  }
  else
  {
    v34 = sub_247CEF580();
    v35 = sub_247CEF6DC();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v36 = 138412290;
      sub_247CCCF78();
      swift_allocError();
      *v38 = 0;
      v39 = _swift_stdlib_bridgeErrorToNSError();
      v71 = v39;
      sub_247CEF748();
      *v37 = v39;
      _os_log_impl(&dword_247CAF000, v34, v35, "Failed to start pair setup session due to no available SFSession: %@", v36, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v37, -1, -1);
      MEMORY[0x249590A5C](v36, -1, -1);
    }

    sub_247CCCF78();
    v40 = (void *)swift_allocError();
    *v41 = 0;
    a2(v40, 0);

  }
}

void sub_247CC2D1C(void *a1)
{
  id v2;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  NSObject *oslog;
  uint64_t v20;

  if (a1)
  {
    v2 = a1;
    if (qword_2576F1D00 != -1)
      swift_once();
    v3 = sub_247CEF598();
    __swift_project_value_buffer(v3, (uint64_t)qword_2576F49E8);
    oslog = sub_247CEF580();
    v4 = sub_247CEF6DC();
    if (os_log_type_enabled(oslog, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v20 = v6;
      *(_DWORD *)v5 = 136446210;
      v7 = WFSetupProgressEventToString(8uLL);
      v8 = sub_247CEF658();
      v10 = v9;

      sub_247CB5D84(v8, v10, &v20);
      sub_247CEF748();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, oslog, v4, "Failed to send over event: (%{public}s", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v6, -1, -1);
      MEMORY[0x249590A5C](v5, -1, -1);

LABEL_10:
      return;
    }

  }
  else
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    v11 = sub_247CEF598();
    __swift_project_value_buffer(v11, (uint64_t)qword_2576F49E8);
    oslog = sub_247CEF580();
    v12 = sub_247CEF6E8();
    if (os_log_type_enabled(oslog, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v20 = v14;
      *(_DWORD *)v13 = 136446210;
      v15 = WFSetupProgressEventToString(8uLL);
      v16 = sub_247CEF658();
      v18 = v17;

      sub_247CB5D84(v16, v18, &v20);
      sub_247CEF748();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, oslog, v12, "Successfully sent over event: (%{public}s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v14, -1, -1);
      MEMORY[0x249590A5C](v13, -1, -1);
      goto LABEL_10;
    }
  }

}

void sub_247CC3048(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  os_log_t osloga;
  NSObject *oslog;
  uint64_t v28;

  if (a1)
  {
    v6 = a1;
    if (qword_2576F1D00 != -1)
      swift_once();
    v7 = sub_247CEF598();
    __swift_project_value_buffer(v7, (uint64_t)qword_2576F49E8);
    v8 = sub_247CEF580();
    v9 = sub_247CEF6DC();
    if (os_log_type_enabled(v8, v9))
    {
      osloga = a4;
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v28 = v11;
      *(_DWORD *)v10 = 136446210;
      v12 = WFSetupProgressEventToString(5uLL);
      v13 = sub_247CEF658();
      v15 = v14;

      v16 = v13;
      a4 = osloga;
      sub_247CB5D84(v16, v15, &v28);
      sub_247CEF748();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v8, v9, "Failed to send over event: (%{public}s)", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v11, -1, -1);
      MEMORY[0x249590A5C](v10, -1, -1);
    }

    v17 = a1;
    ((void (*)(void *, _QWORD))a4)(a1, 0);

  }
  else
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    v18 = sub_247CEF598();
    __swift_project_value_buffer(v18, (uint64_t)qword_2576F49E8);
    oslog = sub_247CEF580();
    v19 = sub_247CEF6E8();
    if (os_log_type_enabled(oslog, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v28 = v21;
      *(_DWORD *)v20 = 136446210;
      v22 = WFSetupProgressEventToString(5uLL);
      v23 = sub_247CEF658();
      v25 = v24;

      sub_247CB5D84(v23, v25, &v28);
      sub_247CEF748();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, oslog, v19, "Successfully sent over event: (%{public}s)", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v21, -1, -1);
      MEMORY[0x249590A5C](v20, -1, -1);

    }
    else
    {

    }
  }
}

Swift::Void __swiftcall WFSetupServer.tryPin(_:)(Swift::String a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint8_t *v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t v43;
  uint8_t *v44;
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint8_t *v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  uint8_t *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  char *v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  void (*v71)(char *, uint64_t);
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  _QWORD *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  _QWORD *v80;
  void *v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  void *v86;
  char *v87;
  char *v88;
  Swift::String v89;
  _QWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93[3];

  v2 = v1;
  v89 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  v5 = MEMORY[0x24BDAC7A8](v3, v4);
  v7 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5, v8);
  v10 = (char *)&v87 - v9;
  v11 = sub_247CEF550();
  v12 = *(_QWORD *)(v11 - 8);
  v14 = MEMORY[0x24BDAC7A8](v11, v13);
  v16 = (char *)&v87 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14, v17);
  v19 = (char *)&v87 - v18;
  if (qword_2576F1D00 != -1)
    swift_once();
  v20 = sub_247CEF598();
  v91 = __swift_project_value_buffer(v20, (uint64_t)qword_2576F49E8);
  v21 = sub_247CEF580();
  v22 = sub_247CEF6E8();
  v23 = os_log_type_enabled(v21, v22);
  v90 = v7;
  if (v23)
  {
    v24 = swift_slowAlloc();
    v87 = v10;
    v25 = (uint8_t *)v24;
    v26 = swift_slowAlloc();
    v88 = v19;
    v27 = v26;
    v93[0] = v26;
    *(_DWORD *)v25 = 136446210;
    v92 = sub_247CB5D84(0x5F286E6950797274, 0xEA0000000000293ALL, v93);
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v21, v22, "%{public}s invoked to validate pin.", v25, 0xCu);
    swift_arrayDestroy();
    v28 = v27;
    v19 = v88;
    MEMORY[0x249590A5C](v28, -1, -1);
    v29 = v25;
    v10 = v87;
    MEMORY[0x249590A5C](v29, -1, -1);
  }

  v30 = *(void **)(v1 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  if (!v30)
  {
    v37 = sub_247CEF580();
    v38 = sub_247CEF6DC();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = v2;
      v40 = (uint8_t *)swift_slowAlloc();
      v41 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v40 = 138412290;
      sub_247CCCF78();
      swift_allocError();
      *v42 = 0;
      v43 = _swift_stdlib_bridgeErrorToNSError();
      v93[0] = v43;
      sub_247CEF748();
      *v41 = v43;
      _os_log_impl(&dword_247CAF000, v37, v38, "Failed to start pair setup session due to no available SFSession: %@", v40, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v41, -1, -1);
      v44 = v40;
      v2 = v39;
      MEMORY[0x249590A5C](v44, -1, -1);
    }

    sub_247CBBA5C(0, (unint64_t *)&qword_2576F2DE0);
    v45 = (void *)sub_247CEF6D0();
    v46 = (uint64_t *)(v2 + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler);
    swift_beginAccess();
    v48 = *v46;
    v47 = v46[1];
    sub_247CBDD44(v48);
    sub_247CE1FA0(7uLL, v45, 1, v48, v47);
    sub_247CBDE58(v48);
    goto LABEL_18;
  }
  v31 = v30;
  v32 = objc_msgSend(v31, sel_peerDevice);
  if (!v32)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
LABEL_15:
    sub_247CBCE98((uint64_t)v10, &qword_2576F2728);
    v49 = sub_247CEF580();
    v50 = sub_247CEF6DC();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = v2;
      v52 = (uint8_t *)swift_slowAlloc();
      v53 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v52 = 138412290;
      sub_247CCCF78();
      swift_allocError();
      *v54 = 4;
      v55 = _swift_stdlib_bridgeErrorToNSError();
      v93[0] = v55;
      sub_247CEF748();
      *v53 = v55;
      _os_log_impl(&dword_247CAF000, v49, v50, "Failed to start pair setup session due to error: %@", v52, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v53, -1, -1);
      v56 = v52;
      v2 = v51;
      MEMORY[0x249590A5C](v56, -1, -1);
    }

    sub_247CBBA5C(0, (unint64_t *)&qword_2576F2DE0);
    v45 = (void *)sub_247CEF6D0();
    v57 = (uint64_t *)(v2 + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler);
    swift_beginAccess();
    v59 = *v57;
    v58 = v57[1];
    sub_247CBDD44(v59);
    sub_247CE1FA0(7uLL, v45, 1, v59, v58);
    sub_247CBDE58(v59);

LABEL_18:
    return;
  }
  v33 = v32;
  v34 = objc_msgSend(v32, sel_identifier);

  if (v34)
  {
    v35 = (uint64_t)v90;
    sub_247CEF544();

    v36 = 0;
  }
  else
  {
    v36 = 1;
    v35 = (uint64_t)v90;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v35, v36, 1, v11);
  sub_247CCD854(v35, (uint64_t)v10, &qword_2576F2728);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    goto LABEL_15;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v19, v10, v11);
  v60 = *(void **)(v2 + OBJC_IVAR___WFSetupServerInternal_sfService);
  if (v60)
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v16, v19, v11);
    v61 = v60;
    v62 = v16;
    v63 = sub_247CEF580();
    v64 = sub_247CEF6E8();
    if (os_log_type_enabled(v63, v64))
    {
      v65 = swift_slowAlloc();
      v90 = (_QWORD *)v12;
      v66 = (uint8_t *)v65;
      v67 = swift_slowAlloc();
      v91 = (uint64_t)v61;
      v68 = v67;
      v93[0] = v67;
      *(_DWORD *)v66 = 136315138;
      v88 = v19;
      sub_247CCF9D4(&qword_2576F2748, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v69 = sub_247CEF874();
      v92 = sub_247CB5D84(v69, v70, v93);
      v19 = v88;
      sub_247CEF748();
      swift_bridgeObjectRelease();
      v71 = (void (*)(char *, uint64_t))v90[1];
      v71(v62, v11);
      _os_log_impl(&dword_247CAF000, v63, v64, "Authenticating pin with peer: %s", v66, 0xCu);
      swift_arrayDestroy();
      v72 = v68;
      v61 = (id)v91;
      MEMORY[0x249590A5C](v72, -1, -1);
      MEMORY[0x249590A5C](v66, -1, -1);
    }
    else
    {
      v71 = *(void (**)(char *, uint64_t))(v12 + 8);
      v71(v62, v11);
    }

    v85 = (void *)sub_247CEF64C();
    v86 = (void *)sub_247CEF538();
    objc_msgSend(v61, sel_pairSetupTryPIN_peer_, v85, v86);

    v71(v19, v11);
  }
  else
  {
    v73 = sub_247CEF580();
    v74 = sub_247CEF6DC();
    if (os_log_type_enabled(v73, v74))
    {
      v91 = v2;
      v75 = (uint8_t *)swift_slowAlloc();
      v90 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v75 = 138412290;
      sub_247CCCF78();
      swift_allocError();
      *v76 = 1;
      v77 = v12;
      v78 = v19;
      v79 = _swift_stdlib_bridgeErrorToNSError();
      v93[0] = v79;
      v2 = v91;
      sub_247CEF748();
      v80 = v90;
      *v90 = v79;
      v19 = v78;
      v12 = v77;
      _os_log_impl(&dword_247CAF000, v73, v74, "Failed to start pair setup session due to error: %@", v75, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v80, -1, -1);
      MEMORY[0x249590A5C](v75, -1, -1);
    }

    sub_247CBBA5C(0, (unint64_t *)&qword_2576F2DE0);
    v81 = (void *)sub_247CEF6D0();
    v82 = (uint64_t *)(v2 + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler);
    swift_beginAccess();
    v84 = *v82;
    v83 = v82[1];
    sub_247CBDD44(v84);
    sub_247CE1FA0(7uLL, v81, 1, v84, v83);

    sub_247CBDE58(v84);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v19, v11);
  }
}

uint64_t sub_247CC3E8C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  char *v33;
  uint64_t v34;
  uint64_t v35[3];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  v3 = MEMORY[0x24BDAC7A8](v1, v2);
  v5 = (char *)&v35[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v3, v6);
  v9 = (char *)&v35[-1] - v8;
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = (char *)&v35[-1] - v11;
  if (qword_2576F1D00 != -1)
    swift_once();
  v13 = sub_247CEF598();
  __swift_project_value_buffer(v13, (uint64_t)qword_2576F49E8);
  v14 = v0;
  v15 = sub_247CEF580();
  v16 = sub_247CEF6E8();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v35[0] = v18;
    *(_DWORD *)v17 = 136315138;
    v19 = *(void **)&v14[OBJC_IVAR___WFSetupServerInternal_sfSession];
    if (v19)
    {
      v20 = objc_msgSend(v19, sel_identifier);
      if (v20)
      {
        v21 = v20;
        sub_247CEF544();

        v22 = sub_247CEF550();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v9, 0, 1, v22);
      }
      else
      {
        v24 = sub_247CEF550();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v9, 1, 1, v24);
      }
      sub_247CCD854((uint64_t)v9, (uint64_t)v12, &qword_2576F2728);
    }
    else
    {
      v23 = sub_247CEF550();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v12, 1, 1, v23);
    }
    v25 = sub_247CEF664();
    v34 = sub_247CB5D84(v25, v26, v35);
    sub_247CEF748();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v15, v16, "Invalidating client session with identifier: %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v18, -1, -1);
    MEMORY[0x249590A5C](v17, -1, -1);

  }
  else
  {

  }
  v27 = *(void **)&v14[OBJC_IVAR___WFSetupServerInternal_resumeAuthTag];
  *(_QWORD *)&v14[OBJC_IVAR___WFSetupServerInternal_resumeAuthTag] = 0;

  v28 = OBJC_IVAR___WFSetupServerInternal_sfSession;
  objc_msgSend(*(id *)&v14[OBJC_IVAR___WFSetupServerInternal_sfSession], sel_invalidate);
  v29 = *(void **)&v14[v28];
  *(_QWORD *)&v14[v28] = 0;

  v30 = sub_247CEF550();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v5, 1, 1, v30);
  v31 = (uint64_t)&v14[OBJC_IVAR___WFSetupServerInternal_peer];
  swift_beginAccess();
  sub_247CCFA4C((uint64_t)v5, v31);
  result = swift_endAccess();
  v33 = &v14[OBJC_IVAR___WFSetupServerInternal_serverState];
  v33[1] = 0;
  v33[3] = 0;
  return result;
}

void sub_247CC41EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void **v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  v1 = v0;
  v2 = sub_247CEF5E0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (uint64_t *)((char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = (void **)(v1 + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
  swift_beginAccess();
  v8 = *v7;
  *v6 = v8;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BEE5610], v2);
  v9 = v8;
  LOBYTE(v8) = sub_247CEF5F8();
  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v6, v2);
  if ((v8 & 1) != 0)
  {
    if (qword_2576F1D00 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v10 = sub_247CEF598();
  __swift_project_value_buffer(v10, (uint64_t)qword_2576F49E8);
  v11 = sub_247CEF580();
  v12 = sub_247CEF6E8();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_247CAF000, v11, v12, "Running the server", v13, 2u);
    MEMORY[0x249590A5C](v13, -1, -1);
  }

  sub_247CCF128(0xD000000000000013, 0x8000000247CF35C0, "FIXME: %{public}s Calling resume if needed");
  if (!*(_QWORD *)(v1 + OBJC_IVAR___WFSetupServerInternal_sfService))
    sub_247CC5898(0);
}

void sub_247CC43B0(unint64_t a1, uint64_t a2, void (*a3)(_QWORD, _QWORD, _QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  __CFString *v24;
  uint64_t v25;
  void (*v26)(_QWORD, _QWORD, _QWORD);
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t inited;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t (*v41)();
  uint64_t v42;
  uint64_t v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  __CFString *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t (*v61)();
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint64_t v67;
  __CFString *v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  char isUniquelyReferenced_nonNull_native;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  _OWORD v92[2];
  __int128 v93;
  uint64_t v94;
  uint64_t aBlock;
  unint64_t v96;
  uint64_t (*v97)(uint64_t, void *, uint64_t, uint64_t);
  void *v98;
  uint64_t (*v99)(uint64_t, uint64_t, uint64_t);
  uint64_t v100;

  v5 = v4;
  if (qword_2576F1D00 != -1)
    swift_once();
  v10 = sub_247CEF598();
  __swift_project_value_buffer(v10, (uint64_t)qword_2576F49E8);
  v11 = sub_247CEF580();
  v12 = sub_247CEF6E8();
  v89 = a2;
  v91 = a1;
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v86 = swift_slowAlloc();
    aBlock = v86;
    *(_DWORD *)v13 = 136446466;
    sub_247CB5D84(0xD000000000000032, 0x8000000247CF3620, &aBlock);
    sub_247CEF748();
    *(_WORD *)(v13 + 12) = 2080;
    v14 = WFSetupProgressEventToString(a1);
    v15 = sub_247CEF658();
    v16 = a4;
    v18 = v17;

    *(_QWORD *)&v93 = sub_247CB5D84(v15, v18, &aBlock);
    sub_247CEF748();
    a4 = v16;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v11, v12, "%{public}s invoked with inEvent: %s)", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v86, -1, -1);
    MEMORY[0x249590A5C](v13, -1, -1);
  }

  v19 = *(void **)(v5 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  if (v19)
  {
    if (v91 > 0xF)
      return;
    if (((1 << v91) & 0xFE1F) != 0)
    {
      v20 = v19;
      v21 = sub_247CEF580();
      v22 = sub_247CEF6DC();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = swift_slowAlloc();
        v90 = swift_slowAlloc();
        aBlock = v90;
        *(_DWORD *)v23 = 136446466;
        sub_247CB5D84(0xD000000000000032, 0x8000000247CF3620, &aBlock);
        sub_247CEF748();
        *(_WORD *)(v23 + 12) = 2082;
        v24 = WFSetupProgressEventToString(v91);
        v25 = sub_247CEF658();
        v26 = a3;
        v28 = v27;

        *(_QWORD *)&v93 = sub_247CB5D84(v25, v28, &aBlock);
        sub_247CEF748();
        a3 = v26;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247CAF000, v21, v22, "%{public}s invoked with unexpected event: %{public}s. Only events related to secure channel should be sent through this method. ", (uint8_t *)v23, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v90, -1, -1);
        MEMORY[0x249590A5C](v23, -1, -1);
      }

      if (a3)
      {
        sub_247CCCF78();
        v29 = swift_allocError();
        *v30 = 6;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_247CF1020;
        aBlock = 0;
        v96 = 0xE000000000000000;
        v32 = MEMORY[0x24BEE0D00];
        sub_247CEF790();
        *(_QWORD *)(inited + 96) = v32;
        *(_QWORD *)(inited + 72) = 0;
        *(_QWORD *)(inited + 80) = 0xE000000000000000;
        v33 = sub_247CC0084(inited);
        a3(v29, 0, v33);
        swift_bridgeObjectRelease();

        v34 = (void *)v29;
LABEL_16:

        return;
      }

    }
    else
    {
      if (((1 << v91) & 0x1C0) != 0)
      {
        if (a3)
        {
          v40 = swift_allocObject();
          *(_QWORD *)(v40 + 16) = a3;
          *(_QWORD *)(v40 + 24) = a4;
          v41 = (uint64_t (*)())sub_247CCD1B0;
        }
        else
        {
          v40 = 0;
          v41 = nullsub_1;
        }
        v42 = swift_allocObject();
        *(_QWORD *)(v42 + 16) = v41;
        *(_QWORD *)(v42 + 24) = v40;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
        v43 = swift_initStackObject();
        *(_OWORD *)(v43 + 16) = xmmword_247CF1020;
        aBlock = 0xD000000000000010;
        v96 = 0x8000000247CF2D90;
        v44 = v19;
        sub_247CBDD44((uint64_t)a3);
        sub_247CEF790();
        *(_QWORD *)(v43 + 96) = MEMORY[0x24BEE1328];
        *(_BYTE *)(v43 + 72) = 1;
        sub_247CC0084(v43);
        v45 = sub_247CEF580();
        v46 = sub_247CEF6E8();
        if (os_log_type_enabled(v45, v46))
        {
          v47 = (uint8_t *)swift_slowAlloc();
          v87 = v44;
          v48 = swift_slowAlloc();
          aBlock = v48;
          *(_DWORD *)v47 = 136446210;
          v49 = WFSetupProgressEventToString(v91);
          v50 = sub_247CEF658();
          v52 = v51;

          *(_QWORD *)&v93 = sub_247CB5D84(v50, v52, &aBlock);
          sub_247CEF748();
          v53 = v91;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_247CAF000, v45, v46, "Sending secure pairing event: %{public}s", v47, 0xCu);
          swift_arrayDestroy();
          v54 = v48;
          v44 = v87;
          MEMORY[0x249590A5C](v54, -1, -1);
          MEMORY[0x249590A5C](v47, -1, -1);

        }
        else
        {

          v53 = v91;
        }
        v55 = (void *)sub_247CEF64C();
        v56 = (void *)sub_247CEF604();
        swift_bridgeObjectRelease();
        v57 = swift_initStackObject();
        *(_OWORD *)(v57 + 16) = xmmword_247CF1020;
        aBlock = 0xD000000000000014;
        v96 = 0x8000000247CF2050;
        sub_247CEF790();
        *(_QWORD *)(v57 + 96) = MEMORY[0x24BEE1768];
        *(_QWORD *)(v57 + 72) = v53;
        sub_247CC0084(v57);
        v58 = (void *)sub_247CEF604();
        swift_bridgeObjectRelease();
        v99 = sub_247CCD1AC;
        v100 = v42;
        aBlock = MEMORY[0x24BDAC760];
        v96 = 1107296256;
        v97 = sub_247CC07F0;
        v98 = &block_descriptor_163;
        v59 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(v44, sel_sendRequestID_options_request_responseHandler_, v55, v56, v58, v59);

        _Block_release(v59);
        swift_release();

      }
      else
      {
        if (a3)
        {
          v60 = swift_allocObject();
          *(_QWORD *)(v60 + 16) = a3;
          *(_QWORD *)(v60 + 24) = a4;
          v61 = (uint64_t (*)())sub_247CCD1B0;
        }
        else
        {
          v60 = 0;
          v61 = nullsub_1;
        }
        v62 = swift_allocObject();
        *(_QWORD *)(v62 + 16) = v61;
        *(_QWORD *)(v62 + 24) = v60;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
        v63 = swift_initStackObject();
        *(_OWORD *)(v63 + 16) = xmmword_247CF1020;
        aBlock = 0xD000000000000010;
        v96 = 0x8000000247CF2D90;
        v88 = v19;
        sub_247CBDD44((uint64_t)a3);
        sub_247CEF790();
        *(_QWORD *)(v63 + 96) = MEMORY[0x24BEE1328];
        *(_BYTE *)(v63 + 72) = 1;
        sub_247CC0084(v63);
        v64 = sub_247CEF580();
        v65 = sub_247CEF6E8();
        if (os_log_type_enabled(v64, v65))
        {
          v66 = (uint8_t *)swift_slowAlloc();
          v67 = swift_slowAlloc();
          aBlock = v67;
          *(_DWORD *)v66 = 136446210;
          v68 = WFSetupProgressEventToString(5uLL);
          v69 = sub_247CEF658();
          v71 = v70;

          *(_QWORD *)&v93 = sub_247CB5D84(v69, v71, &aBlock);
          sub_247CEF748();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_247CAF000, v64, v65, "Sending secure pairing event: %{public}s", v66, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x249590A5C](v67, -1, -1);
          MEMORY[0x249590A5C](v66, -1, -1);
        }

        v72 = swift_initStackObject();
        *(_OWORD *)(v72 + 16) = xmmword_247CF1020;
        aBlock = 0xD000000000000014;
        v96 = 0x8000000247CF2050;
        sub_247CEF790();
        *(_QWORD *)(v72 + 96) = MEMORY[0x24BEE1768];
        *(_QWORD *)(v72 + 72) = 5;
        sub_247CC0084(v72);
        if (*(_QWORD *)(v89 + 16)
          && (v73 = sub_247CDD1B8(0xD000000000000021, 0x8000000247CF20B0), (v74 & 1) != 0)
          && (sub_247CB674C(*(_QWORD *)(v89 + 56) + 32 * v73, (uint64_t)&aBlock),
              v75 = MEMORY[0x24BEE1328],
              (swift_dynamicCast() & 1) != 0))
        {
          v76 = v62;
          v77 = v93;
          v78 = sub_247CEF580();
          v79 = sub_247CEF6E8();
          if (os_log_type_enabled(v78, v79))
          {
            v80 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)v80 = 67109120;
            LODWORD(aBlock) = v77;
            sub_247CEF748();
            _os_log_impl(&dword_247CAF000, v78, v79, "Received security context with userHasCompletedFirstPaneOnServer: %{BOOL}d", v80, 8u);
            MEMORY[0x249590A5C](v80, -1, -1);
          }

          *(_QWORD *)&v93 = 0xD000000000000021;
          *((_QWORD *)&v93 + 1) = 0x8000000247CF20B0;
          sub_247CEF790();
          v94 = v75;
          LOBYTE(v93) = v77;
          sub_247CCCFBC(&v93, v92);
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          sub_247CCD1BC(v92, (uint64_t)&aBlock, isUniquelyReferenced_nonNull_native);
          swift_bridgeObjectRelease();
          sub_247CCF0F4((uint64_t)&aBlock);
          v62 = v76;
          v82 = v88;
        }
        else
        {
          v82 = v88;
        }
        v83 = (void *)sub_247CEF64C();
        v84 = (void *)sub_247CEF604();
        swift_bridgeObjectRelease();
        v58 = (void *)sub_247CEF604();
        swift_bridgeObjectRelease();
        v99 = sub_247CCD1AC;
        v100 = v62;
        aBlock = MEMORY[0x24BDAC760];
        v96 = 1107296256;
        v97 = sub_247CC07F0;
        v98 = &block_descriptor_174;
        v85 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        objc_msgSend(v82, sel_sendRequestID_options_request_responseHandler_, v83, v84, v58, v85);

        swift_release();
        _Block_release(v85);

      }
    }
  }
  else
  {
    v35 = sub_247CEF580();
    v36 = sub_247CEF6DC();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_247CAF000, v35, v36, "Failed to send object to server. SfSession is not available. ", v37, 2u);
      MEMORY[0x249590A5C](v37, -1, -1);
    }

    if (a3)
    {
      sub_247CCCF78();
      v38 = swift_allocError();
      *v39 = 0;
      a3(v38, 0, 0);
      v34 = (void *)v38;
      goto LABEL_16;
    }
  }
}

void sub_247CC51E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id *v34;
  id v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t);
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t aBlock[6];
  uint64_t v66;

  v3 = v2;
  v61 = a2;
  v5 = sub_247CEF5A4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_247CEF5BC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v63 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_247CEF5D4();
  v15 = *(_QWORD *)(v14 - 8);
  v17 = MEMORY[0x24BDAC7A8](v14, v16);
  v19 = (char *)&v55 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v17, v20);
  v23 = (char *)&v55 - v22;
  v62 = a1;
  if (a1 > 2)
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    v43 = sub_247CEF598();
    __swift_project_value_buffer(v43, (uint64_t)qword_2576F49E8);
    v44 = sub_247CEF580();
    v45 = sub_247CEF6DC();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      v47 = swift_slowAlloc();
      aBlock[0] = v47;
      *(_DWORD *)v46 = 136446210;
      v66 = sub_247CB5D84(0xD000000000000026, 0x8000000247CF3590, aBlock);
      sub_247CEF748();
      _os_log_impl(&dword_247CAF000, v44, v45, "%{public}s No more service restart attempts, publishing completion(error).", v46, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v47, -1, -1);
      MEMORY[0x249590A5C](v46, -1, -1);
    }

    v48 = v3 + OBJC_IVAR___WFSetupServerInternal_activationHandler;
    swift_beginAccess();
    v50 = *(void (**)(uint64_t))v48;
    v49 = *(_QWORD *)(v48 + 8);
    sub_247CBDD44((uint64_t)v50);
    v51 = v61;
    sub_247CE2C08(v50, v49, v61, 0);
    sub_247CBDE58((uint64_t)v50);
    v52 = v3 + OBJC_IVAR___WFSetupServerInternal_completionHandler;
    swift_beginAccess();
    v54 = *(void (**)(uint64_t))v52;
    v53 = *(_QWORD *)(v52 + 8);
    sub_247CBDD44((uint64_t)v54);
    sub_247CE2C08(v54, v53, v51, 0);
    sub_247CBDE58((uint64_t)v54);
    WFSetupServer.invalidate()();
  }
  else
  {
    v57 = v21;
    v58 = v11;
    v61 = v6;
    if (qword_2576F1D00 != -1)
      swift_once();
    v24 = sub_247CEF598();
    __swift_project_value_buffer(v24, (uint64_t)qword_2576F49E8);
    v25 = sub_247CEF580();
    v26 = sub_247CEF6E8();
    v27 = os_log_type_enabled(v25, v26);
    v59 = v10;
    v60 = v9;
    if (v27)
    {
      v56 = (void (*)(char *, uint64_t))v5;
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      aBlock[0] = v29;
      *(_DWORD *)v28 = 136446210;
      v66 = sub_247CB5D84(0xD000000000000026, 0x8000000247CF3590, aBlock);
      v5 = (uint64_t)v56;
      sub_247CEF748();
      _os_log_impl(&dword_247CAF000, v25, v26, "%{public}s Quietly invalidating service that failed to start.", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v29, -1, -1);
      MEMORY[0x249590A5C](v28, -1, -1);
    }

    v30 = OBJC_IVAR___WFSetupServerInternal_sfService;
    v31 = *(void **)(v3 + OBJC_IVAR___WFSetupServerInternal_sfService);
    if (v31)
    {
      objc_msgSend(v31, sel_setInvalidationHandler_, 0);
      v31 = *(void **)(v3 + v30);
    }
    objc_msgSend(v31, sel_invalidate);
    v32 = *(void **)(v3 + v30);
    *(_QWORD *)(v3 + v30) = 0;

    v33 = v62;
    v34 = (id *)(v3 + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
    swift_beginAccess();
    v35 = *v34;
    sub_247CEF5C8();
    v36 = v23;
    MEMORY[0x249590288](v19, (double)v33 * 0.25);
    v56 = *(void (**)(char *, uint64_t))(v15 + 8);
    v37 = v57;
    v56(v19, v57);
    v38 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v39 = swift_allocObject();
    *(_QWORD *)(v39 + 16) = v38;
    *(_QWORD *)(v39 + 24) = v33;
    aBlock[4] = (uint64_t)sub_247CCFAB8;
    aBlock[5] = v39;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_247CBF050;
    aBlock[3] = (uint64_t)&block_descriptor_105;
    v40 = _Block_copy(aBlock);
    swift_retain();
    v41 = v63;
    sub_247CEF5B0();
    v64 = MEMORY[0x24BEE4AF8];
    sub_247CCF9D4((unint64_t *)&qword_2576F2710, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2718);
    sub_247CCCEE0();
    v42 = v60;
    sub_247CEF76C();
    MEMORY[0x24959039C](v36, v41, v42, v40);
    _Block_release(v40);

    (*(void (**)(char *, uint64_t))(v61 + 8))(v42, v5);
    (*(void (**)(char *, uint64_t))(v58 + 8))(v41, v59);
    v56(v36, v37);
    swift_release();
    swift_release();
  }
}

void sub_247CC5840(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x249590A98](v3);
  if (v4)
  {
    v5 = (void *)v4;
    sub_247CC5898(a2);

  }
}

void sub_247CC5898(uint64_t a1)
{
  char *v1;
  void *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t aBlock;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;

  v2 = v1;
  if (qword_2576F1D00 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F49E8);
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v7 = 134217984;
    aBlock = a1;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v5, v6, "SFService start: attempt: %ld", v7, 0xCu);
    MEMORY[0x249590A5C](v7, -1, -1);
  }

  v8 = OBJC_IVAR___WFSetupServerInternal_sfService;
  objc_msgSend(*(id *)&v1[OBJC_IVAR___WFSetupServerInternal_sfService], sel_invalidate);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE901A8]), sel_init);
  v10 = *(void **)&v1[v8];
  *(_QWORD *)&v1[v8] = v9;
  v11 = v9;

  if (v1[OBJC_IVAR___WFSetupServerInternal_shouldAdvertiseFast] == 1)
    objc_msgSend(v11, sel_setAdvertiseRate_, 50);
  v12 = &v1[OBJC_IVAR___WFSetupServerInternal_dispatchQueue];
  swift_beginAccess();
  objc_msgSend(v11, sel_setDispatchQueue_, *(_QWORD *)v12);
  objc_msgSend(v11, sel_setNeedsSetup_, 1);
  objc_msgSend(v11, sel_setOverrideScreenOff_, 1);
  objc_msgSend(v11, sel_setIdentifier_, *MEMORY[0x24BE90380]);
  objc_msgSend(v11, sel_setDeviceActionType_, 36);
  objc_msgSend(v11, sel_setSessionFlags_, 2);
  if (*(_QWORD *)&v1[OBJC_IVAR___WFSetupServerInternal_resumeAuthTag])
  {
    v13 = sub_247CEF580();
    v14 = sub_247CEF6E8();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      aBlock = v16;
      *(_DWORD *)v15 = 136446210;
      sub_247CB5D84(0xD000000000000016, 0x8000000247CF3570, &aBlock);
      sub_247CEF748();
      _os_log_impl(&dword_247CAF000, v13, v14, "FIXME: %{public}s resumeAuthTag is not nil", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v16, -1, -1);
      MEMORY[0x249590A5C](v15, -1, -1);
    }

  }
  v40 = sub_247CC5FE0;
  v41 = 0;
  v17 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v37 = 1107296256;
  v38 = sub_247CBF050;
  v39 = &block_descriptor_60;
  v18 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setInterruptionHandler_, v18);
  _Block_release(v18);
  v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v40 = sub_247CCFA14;
  v41 = v19;
  aBlock = v17;
  v37 = 1107296256;
  v38 = sub_247CBF050;
  v39 = &block_descriptor_64;
  v20 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_setInvalidationHandler_, v20);
  _Block_release(v20);
  v40 = sub_247CC61B0;
  v41 = 0;
  aBlock = v17;
  v37 = 1107296256;
  v38 = sub_247CC638C;
  v39 = &block_descriptor_67;
  v21 = _Block_copy(&aBlock);
  objc_msgSend(v11, sel_setPeerDisconnectedHandler_, v21);
  _Block_release(v21);
  v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v40 = sub_247CCFA1C;
  v41 = v22;
  aBlock = v17;
  v37 = 1107296256;
  v38 = sub_247CBDADC;
  v39 = &block_descriptor_71;
  v23 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_setPromptForPINHandler_, v23);
  _Block_release(v23);
  v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v40 = sub_247CCFA24;
  v41 = v24;
  aBlock = v17;
  v37 = 1107296256;
  v38 = sub_247CC6530;
  v39 = &block_descriptor_75;
  v25 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_setReceivedObjectHandler_, v25);
  _Block_release(v25);
  v26 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v40 = sub_247CCFA2C;
  v41 = v26;
  aBlock = v17;
  v37 = 1107296256;
  v38 = sub_247CC70C4;
  v39 = &block_descriptor_79;
  v27 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_setSessionStartedHandler_, v27);
  _Block_release(v27);
  v28 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v40 = sub_247CCFA34;
  v41 = v28;
  aBlock = v17;
  v37 = 1107296256;
  v38 = sub_247CC78C8;
  v39 = &block_descriptor_83;
  v29 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_setSessionEndedHandler_, v29);
  _Block_release(v29);
  v30 = swift_allocObject();
  *(_QWORD *)(v30 + 16) = v2;
  v40 = sub_247CCFA3C;
  v41 = v30;
  aBlock = v17;
  v37 = 1107296256;
  v38 = sub_247CC70C4;
  v39 = &block_descriptor_89;
  v31 = _Block_copy(&aBlock);
  v32 = v2;
  swift_release();
  objc_msgSend(v11, sel_setSessionSecuredHandler_, v31);
  _Block_release(v31);
  v33 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = v33;
  *(_QWORD *)(v34 + 24) = a1;
  v40 = sub_247CCFA44;
  v41 = v34;
  aBlock = v17;
  v37 = 1107296256;
  v38 = sub_247CD1570;
  v39 = &block_descriptor_96;
  v35 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_activateWithCompletion_, v35);
  _Block_release(v35);

}

void sub_247CC5FE0()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_2576F1D00 != -1)
    swift_once();
  v0 = sub_247CEF598();
  __swift_project_value_buffer(v0, (uint64_t)qword_2576F49E8);
  oslog = sub_247CEF580();
  v1 = sub_247CEF6E8();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_247CAF000, oslog, v1, "SFService interrupted", v2, 2u);
    MEMORY[0x249590A5C](v2, -1, -1);
  }

}

void sub_247CC60AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x249590A98](v1);
  if (v2)
  {
    v3 = v2;
    WFSetupServer.invalidate()();
  }
  else
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    v4 = sub_247CEF598();
    __swift_project_value_buffer(v4, (uint64_t)qword_2576F49E8);
    v3 = sub_247CEF580();
    v5 = sub_247CEF6DC();
    if (os_log_type_enabled(v3, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_247CAF000, v3, v5, "WFSetupServer unexpectedly nil", v6, 2u);
      MEMORY[0x249590A5C](v6, -1, -1);
    }
  }

}

void sub_247CC61B0(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *oslog;
  uint64_t v13;

  if (qword_2576F1D00 != -1)
    swift_once();
  v3 = sub_247CEF598();
  __swift_project_value_buffer(v3, (uint64_t)qword_2576F49E8);
  v4 = a2;
  v5 = a2;
  oslog = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(oslog, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v13 = v8;
    *(_DWORD *)v7 = 136446210;
    v9 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2838);
    v10 = sub_247CEF664();
    sub_247CB5D84(v10, v11, &v13);
    sub_247CEF748();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_247CAF000, oslog, v6, "Peer client device disconnected with error %{public}s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v8, -1, -1);
    MEMORY[0x249590A5C](v7, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_247CC638C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, void *);
  id v11;
  uint64_t v13;

  v5 = sub_247CEF550();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void (**)(char *, void *))(a1 + 32);
  sub_247CEF544();
  swift_retain();
  v11 = a3;
  v10(v9, a3);
  swift_release();

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

void sub_247CC6450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = a3 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x249590A98](v5);
  if (v6)
  {
    v7 = (void *)v6;
    sub_247CCC640(a1, a2);

  }
}

void sub_247CC64BC(void *a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v7 = a4 + 16;
  swift_beginAccess();
  v8 = MEMORY[0x249590A98](v7);
  if (v8)
  {
    v9 = (void *)v8;
    sub_247CC810C(a1, a3, a2);

  }
}

void sub_247CC6530(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  sub_247CEF61C();
  swift_retain();
  v4 = a2;
  v3();
  swift_release();
  swift_bridgeObjectRelease();

}

void sub_247CC65CC(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void (*v51)(char *);
  id v52;
  NSObject *v53;
  uint8_t *v54;
  id v55;
  void *v56;
  id v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  char *v66;
  unint64_t v67;
  os_log_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int (*v72)(char *, uint64_t, uint64_t);
  id v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(char *, char *, uint64_t);
  id v80;
  void *v81;
  id v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  char *v88;
  void (*v89)(char *, uint64_t);
  void (*v90)(char *, char *, uint64_t);
  char *v91;
  NSObject *v92;
  os_log_type_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  void (*v99)(char *, uint64_t);
  uint64_t v100;
  unint64_t v101;
  char *v102;
  uint64_t v103;
  char *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  os_log_t v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  int v113;
  char *v114;
  char *v115;
  char *v116;
  char *v117;
  char *v118;
  char *v119;
  uint64_t v120;
  char *v121;
  char *v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126[3];
  uint64_t v127[3];

  v4 = sub_247CEF550();
  v124 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4, v5);
  v119 = (char *)&v106 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6, v8);
  v114 = (char *)&v106 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v116 = (char *)&v106 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12, v14);
  v123 = (char *)&v106 - v16;
  MEMORY[0x24BDAC7A8](v15, v17);
  v115 = (char *)&v106 - v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  v21 = MEMORY[0x24BDAC7A8](v19, v20);
  v118 = (char *)&v106 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v21, v23);
  v117 = (char *)&v106 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24, v26);
  v122 = (char *)&v106 - v28;
  v30 = MEMORY[0x24BDAC7A8](v27, v29);
  v121 = (char *)&v106 - v31;
  v33 = MEMORY[0x24BDAC7A8](v30, v32);
  v35 = (char *)&v106 - v34;
  v37 = MEMORY[0x24BDAC7A8](v33, v36);
  v39 = (char *)&v106 - v38;
  MEMORY[0x24BDAC7A8](v37, v40);
  v42 = (char *)&v106 - v41;
  v43 = sub_247CEF598();
  v44 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43, v45);
  v47 = (char *)&v106 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v48 = MEMORY[0x249590A98](a2 + 16);
  if (v48)
  {
    v49 = (void *)v48;
    v120 = v4;
    if (qword_2576F1D00 != -1)
      swift_once();
    v50 = __swift_project_value_buffer(v43, (uint64_t)qword_2576F49E8);
    v51 = *(void (**)(char *))(v44 + 16);
    v110 = v50;
    v51(v47);
    v52 = a1;
    v53 = sub_247CEF580();
    v113 = sub_247CEF6E8();
    if (os_log_type_enabled(v53, (os_log_type_t)v113))
    {
      v108 = v53;
      v112 = v49;
      v111 = 7104878;
      v54 = (uint8_t *)swift_slowAlloc();
      v107 = swift_slowAlloc();
      v127[0] = v107;
      *(_DWORD *)v54 = 136315138;
      v109 = v52;
      v55 = objc_msgSend(v52, sel_peerDevice);
      if (v55)
      {
        v56 = v55;
        v57 = objc_msgSend(v55, sel_identifier);

        if (v57)
        {
          sub_247CEF544();

          v58 = 0;
        }
        else
        {
          v58 = 1;
        }
        v65 = v124;
        v63 = v120;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v124 + 56))(v39, v58, 1, v120);
        sub_247CCD854((uint64_t)v39, (uint64_t)v42, &qword_2576F2728);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v65 + 48))(v42, 1, v63))
        {
          sub_247CBCE98((uint64_t)v42, &qword_2576F2728);
          v64 = 0xE300000000000000;
        }
        else
        {
          v66 = v115;
          (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v115, v42, v63);
          sub_247CBCE98((uint64_t)v42, &qword_2576F2728);
          v111 = sub_247CEF52C();
          v64 = v67;
          (*(void (**)(char *, uint64_t))(v65 + 8))(v66, v63);
        }
        v62 = v123;
      }
      else
      {
        v64 = 0xE300000000000000;
        v62 = v123;
        v63 = v120;
      }
      v126[0] = sub_247CB5D84(v111, v64, v127);
      sub_247CEF748();
      v52 = v109;

      swift_bridgeObjectRelease();
      v68 = v108;
      _os_log_impl(&dword_247CAF000, v108, (os_log_type_t)v113, "Session started with %s", v54, 0xCu);
      v69 = v107;
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v69, -1, -1);
      MEMORY[0x249590A5C](v54, -1, -1);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v47, v43);
      v49 = v112;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v44 + 8))(v47, v43);
      v62 = v123;
      v63 = v120;
    }
    v70 = (uint64_t)v49 + OBJC_IVAR___WFSetupServerInternal_peer;
    swift_beginAccess();
    sub_247CCFBBC(v70, (uint64_t)v35, &qword_2576F2728);
    v71 = v124;
    v72 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v124 + 48);
    if (v72(v35, 1, v63) == 1)
    {
      sub_247CBCE98((uint64_t)v35, &qword_2576F2728);
      v73 = objc_msgSend(v52, sel_peerDevice);
      if (v73)
      {
        v74 = v73;
        v75 = objc_msgSend(v73, sel_identifier);

        if (v75)
        {
          v76 = (uint64_t)v118;
          sub_247CEF544();

          v77 = 0;
          v78 = (uint64_t)v121;
        }
        else
        {
          v77 = 1;
          v78 = (uint64_t)v121;
          v76 = (uint64_t)v118;
        }
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v71 + 56))(v76, v77, 1, v63);
        sub_247CCD854(v76, v78, &qword_2576F2728);
      }
      else
      {
        v78 = (uint64_t)v121;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v71 + 56))(v121, 1, 1, v63);
      }
      swift_beginAccess();
      sub_247CCFA4C(v78, v70);
      swift_endAccess();
      goto LABEL_36;
    }
    v79 = *(void (**)(char *, char *, uint64_t))(v71 + 32);
    v79(v62, v35, v63);
    v80 = objc_msgSend(v52, sel_peerDevice);
    if (!v80)
    {
      v87 = (uint64_t)v122;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v71 + 56))(v122, 1, 1, v63);
LABEL_35:
      (*(void (**)(char *, uint64_t))(v71 + 8))(v62, v63);
      sub_247CBCE98(v87, &qword_2576F2728);
LABEL_36:
      sub_247CC9594(v52);

      return;
    }
    v81 = v80;
    v82 = objc_msgSend(v80, sel_identifier);

    if (v82)
    {
      v83 = v117;
      sub_247CEF544();

      v84 = (uint64_t)v83;
      v85 = 0;
      v86 = v119;
      v87 = (uint64_t)v122;
    }
    else
    {
      v85 = 1;
      v86 = v119;
      v87 = (uint64_t)v122;
      v84 = (uint64_t)v117;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v71 + 56))(v84, v85, 1, v63);
    sub_247CCD854(v84, v87, &qword_2576F2728);
    if (v72((char *)v87, 1, v63) == 1)
      goto LABEL_35;
    v88 = v116;
    v79(v116, (char *)v87, v63);
    sub_247CCF9D4(&qword_2576F2828, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
    if ((sub_247CEF640() & 1) != 0)
    {
      v89 = *(void (**)(char *, uint64_t))(v71 + 8);
      v89(v88, v63);
      v89(v62, v63);
      goto LABEL_36;
    }
    v112 = v49;
    v90 = *(void (**)(char *, char *, uint64_t))(v71 + 16);
    v91 = v114;
    v90(v114, v88, v63);
    v90(v86, v62, v63);
    v92 = sub_247CEF580();
    v93 = sub_247CEF6E8();
    if (os_log_type_enabled(v92, v93))
    {
      v94 = swift_slowAlloc();
      v122 = (char *)swift_slowAlloc();
      v126[0] = (uint64_t)v122;
      *(_DWORD *)v94 = 136315394;
      sub_247CCF9D4(&qword_2576F2748, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v109 = v52;
      v95 = sub_247CEF874();
      v125 = sub_247CB5D84(v95, v96, v126);
      sub_247CEF748();
      swift_bridgeObjectRelease();
      v97 = v91;
      v98 = v63;
      v99 = *(void (**)(char *, uint64_t))(v124 + 8);
      v99(v97, v98);
      *(_WORD *)(v94 + 12) = 2080;
      v52 = v109;
      v100 = sub_247CEF874();
      v125 = sub_247CB5D84(v100, v101, v126);
      sub_247CEF748();
      swift_bridgeObjectRelease();
      v99(v86, v98);
      _os_log_impl(&dword_247CAF000, v92, v93, "Requesting peer %s dismiss because we are already communicating with %s", (uint8_t *)v94, 0x16u);
      v102 = v122;
      swift_arrayDestroy();
      v62 = v123;
      MEMORY[0x249590A5C](v102, -1, -1);
      v103 = v94;
      v88 = v116;
      MEMORY[0x249590A5C](v103, -1, -1);
    }
    else
    {
      v104 = v91;
      v98 = v63;
      v99 = *(void (**)(char *, uint64_t))(v71 + 8);
      v99(v104, v98);
      v99(v86, v98);
    }

    v105 = v112;
    sub_247CCC888(v52);

    v99(v88, v98);
    v99(v62, v98);
  }
  else
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    __swift_project_value_buffer(v43, (uint64_t)qword_2576F49E8);
    v59 = sub_247CEF580();
    v60 = sub_247CEF6DC();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v61 = 0;
      _os_log_impl(&dword_247CAF000, v59, v60, "WFSetupServer unexpectedly nil for session started signal", v61, 2u);
      MEMORY[0x249590A5C](v61, -1, -1);
    }

  }
}

void sub_247CC70C4(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_247CC7114(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  unint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t inited;
  unint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  _QWORD *v70;
  void *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  NSObject *v76;
  char *v77;
  id v78;
  uint64_t v79;
  uint64_t v80[3];
  ValueMetadata *v81;
  unint64_t v82;

  v78 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  v7 = MEMORY[0x24BDAC7A8](v5, v6);
  v9 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v7, v10);
  v13 = (char *)&v72 - v12;
  v15 = MEMORY[0x24BDAC7A8](v11, v14);
  v74 = (char *)&v72 - v16;
  MEMORY[0x24BDAC7A8](v15, v17);
  v75 = (uint64_t)&v72 - v18;
  v19 = sub_247CEF598();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19, v21);
  v23 = (char *)&v72 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v24 = MEMORY[0x249590A98](a3 + 16);
  if (v24)
  {
    v25 = v24;
    v77 = v9;
    if (qword_2576F1D00 != -1)
      swift_once();
    v26 = __swift_project_value_buffer(v19, (uint64_t)qword_2576F49E8);
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v23, v26, v19);
    v27 = a2;
    v28 = a2;
    v29 = sub_247CEF580();
    v30 = sub_247CEF6E8();
    v31 = os_log_type_enabled(v29, v30);
    v76 = v25;
    if (v31)
    {
      v73 = v13;
      v32 = (uint8_t *)swift_slowAlloc();
      v33 = swift_slowAlloc();
      v80[0] = v33;
      *(_DWORD *)v32 = 136446210;
      if (a2)
      {
        swift_getErrorValue();
        v34 = sub_247CEF8C8();
        v36 = v35;
      }
      else
      {
        v36 = 0xE300000000000000;
        v34 = 7104878;
      }
      v79 = sub_247CB5D84(v34, v36, v80);
      sub_247CEF748();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_247CAF000, v29, v30, "Session ended with error %{public}s", v32, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v33, -1, -1);
      MEMORY[0x249590A5C](v32, -1, -1);

      (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
      v13 = v73;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
    }
    v40 = v78;
    v41 = (uint64_t)v77;
    if (a2)
    {
      v42 = a2;
      v43 = objc_msgSend(v40, sel_identifier);
      if (v43)
      {
        v44 = v43;
        sub_247CEF544();

        v45 = sub_247CEF550();
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v41, 0, 1, v45);
      }
      else
      {
        v45 = sub_247CEF550();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v41, 1, 1, v45);
      }
      sub_247CCD854(v41, (uint64_t)v13, &qword_2576F2728);
      sub_247CEF550();
      v50 = *(_QWORD *)(v45 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v50 + 48))(v13, 1, v45) == 1)
      {
        sub_247CBCE98((uint64_t)v13, &qword_2576F2728);
        v51 = 0;
        v52 = 0xE000000000000000;
      }
      else
      {
        v51 = sub_247CEF520();
        v53 = v13;
        v52 = v54;
        (*(void (**)(char *, uint64_t))(v50 + 8))(v53, v45);
      }
      v55 = (void *)sub_247CEF4CC();
      v56 = objc_msgSend(v55, sel_code);

      v79 = (uint64_t)v56;
      v57 = sub_247CEF874();
      v59 = v58;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2810);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_247CF1020;
      *(_QWORD *)(inited + 32) = 0x646F43726F727265;
      *(_QWORD *)(inited + 40) = 0xE900000000000065;
      *(_QWORD *)(inited + 48) = v57;
      *(_QWORD *)(inited + 56) = v59;
      v61 = sub_247CC0408(inited);
      v81 = &type metadata for DisconnectedProximitySetupServerAnalyticsEvent;
      v82 = sub_247CCF938();
      v62 = (_QWORD *)swift_allocObject();
      v80[0] = (uint64_t)v62;
      v62[2] = 0xD000000000000035;
      v62[3] = 0x8000000247CF3420;
      v62[4] = v51;
      v62[5] = v52;
      v62[6] = v61;
      sub_247CDEA30(v80);

    }
    else
    {
      v46 = objc_msgSend(v78, sel_identifier);
      if (v46)
      {
        v47 = v46;
        v48 = (uint64_t)v74;
        sub_247CEF544();

        v49 = sub_247CEF550();
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v48, 0, 1, v49);
      }
      else
      {
        v49 = sub_247CEF550();
        v48 = (uint64_t)v74;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v74, 1, 1, v49);
      }
      v63 = v75;
      sub_247CCD854(v48, v75, &qword_2576F2728);
      sub_247CEF550();
      v64 = *(_QWORD *)(v49 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v64 + 48))(v63, 1, v49) == 1)
      {
        sub_247CBCE98(v63, &qword_2576F2728);
        v65 = 0;
        v66 = 0xE000000000000000;
      }
      else
      {
        v65 = sub_247CEF520();
        v66 = v67;
        (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v63, v49);
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2810);
      v68 = swift_initStackObject();
      *(_OWORD *)(v68 + 16) = xmmword_247CF1020;
      *(_QWORD *)(v68 + 32) = 0x646F43726F727265;
      *(_QWORD *)(v68 + 40) = 0xE900000000000065;
      *(_QWORD *)(v68 + 48) = 48;
      *(_QWORD *)(v68 + 56) = 0xE100000000000000;
      v69 = sub_247CC0408(v68);
      v81 = &type metadata for DisconnectedProximitySetupServerAnalyticsEvent;
      v82 = sub_247CCF938();
      v70 = (_QWORD *)swift_allocObject();
      v80[0] = (uint64_t)v70;
      v70[2] = 0xD000000000000035;
      v70[3] = 0x8000000247CF3420;
      v70[4] = v65;
      v70[5] = v66;
      v70[6] = v69;
      sub_247CDEA30(v80);
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v80);
    v37 = v76;
    v71 = *(Class *)((char *)&v76->isa + OBJC_IVAR___WFSetupServerInternal_sfService);
    if (v71)
      objc_msgSend(v71, sel_setNeedsSetup_, 1);
    sub_247CCAF94(v40);
  }
  else
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    __swift_project_value_buffer(v19, (uint64_t)qword_2576F49E8);
    v37 = sub_247CEF580();
    v38 = sub_247CEF6DC();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_247CAF000, v37, v38, "WFSetupServer unexpectedly nil for session ended signal", v39, 2u);
      MEMORY[0x249590A5C](v39, -1, -1);
    }
  }

}

void sub_247CC78C8(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(id, void *);
  id v6;
  id v7;

  v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(v7, a3);
  swift_release();

}

void sub_247CC793C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v4 = sub_247CEF550();
  v5 = *(_QWORD *)(v4 - 8);
  v46 = v4;
  v47 = v5;
  MEMORY[0x24BDAC7A8](v4, v6);
  v45 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  v10 = MEMORY[0x24BDAC7A8](v8, v9);
  v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v13);
  v15 = (char *)&v42 - v14;
  v16 = sub_247CEF598();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v18);
  v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576F1D00 != -1)
    swift_once();
  v21 = __swift_project_value_buffer(v16, (uint64_t)qword_2576F49E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, v21, v16);
  v22 = a1;
  v23 = sub_247CEF580();
  v24 = sub_247CEF6E8();
  if (os_log_type_enabled(v23, v24))
  {
    v44 = v17;
    v25 = (uint8_t *)swift_slowAlloc();
    v43 = swift_slowAlloc();
    v49 = v43;
    *(_DWORD *)v25 = 136446210;
    v26 = objc_msgSend(v22, sel_peerDevice);
    if (v26)
    {
      v27 = v26;
      v42 = a2;
      v28 = objc_msgSend(v26, sel_identifier);

      if (v28)
      {
        sub_247CEF544();

        v29 = 0;
      }
      else
      {
        v29 = 1;
      }
      v30 = v46;
      v31 = v47;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v47 + 56))(v12, v29, 1, v46);
      v32 = (uint64_t)v12;
      v33 = v31;
      sub_247CCD854(v32, (uint64_t)v15, &qword_2576F2728);
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v15, 1, v30))
      {
        v37 = v45;
        (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v45, v15, v30);
        sub_247CBCE98((uint64_t)v15, &qword_2576F2728);
        v38 = v30;
        v39 = sub_247CEF52C();
        v40 = v33;
        v34 = v41;
        (*(void (**)(char *, uint64_t))(v40 + 8))(v37, v38);
        v36 = v39;
        v35 = v43;
        goto LABEL_13;
      }
      sub_247CBCE98((uint64_t)v15, &qword_2576F2728);
    }
    v34 = 0xE300000000000000;
    v35 = v43;
    v36 = 7104878;
LABEL_13:
    v48 = sub_247CB5D84(v36, v34, &v49);
    sub_247CEF748();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v23, v24, "Session secured with %{public}s", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v35, -1, -1);
    MEMORY[0x249590A5C](v25, -1, -1);

    (*(void (**)(char *, uint64_t))(v44 + 8))(v20, v16);
    goto LABEL_14;
  }

  (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v16);
LABEL_14:
  sub_247CCB7D4(v22);
}

void sub_247CC7CF8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  char *v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  uint64_t v29[3];

  v5 = a2 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x249590A98](v5);
  if (!v6)
  {
    if (qword_2576F1D00 == -1)
    {
LABEL_8:
      v18 = sub_247CEF598();
      __swift_project_value_buffer(v18, (uint64_t)qword_2576F49E8);
      v19 = sub_247CEF580();
      v20 = sub_247CEF6DC();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_247CAF000, v19, v20, "SFService activate completion called but WFSetupServer has been deallocated!", v21, 2u);
        MEMORY[0x249590A5C](v21, -1, -1);
      }

      return;
    }
LABEL_20:
    swift_once();
    goto LABEL_8;
  }
  v7 = (char *)v6;
  if (a1)
  {
    v8 = a1;
    if (qword_2576F1D00 != -1)
      swift_once();
    v9 = sub_247CEF598();
    __swift_project_value_buffer(v9, (uint64_t)qword_2576F49E8);
    v10 = a1;
    v11 = a1;
    v12 = sub_247CEF580();
    v13 = sub_247CEF6E8();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      v29[0] = v15;
      *(_DWORD *)v14 = 136446466;
      swift_getErrorValue();
      v16 = sub_247CEF8C8();
      sub_247CB5D84(v16, v17, v29);
      sub_247CEF748();
      swift_bridgeObjectRelease();

      *(_WORD *)(v14 + 12) = 2050;
      sub_247CEF748();
      _os_log_impl(&dword_247CAF000, v12, v13, "SFService activate failed: %{public}s on attempt %{public}ld", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v15, -1, -1);
      MEMORY[0x249590A5C](v14, -1, -1);
    }
    else
    {

    }
    if (!__OFADD__(a3, 1))
    {
      sub_247CC51E0(a3 + 1, (uint64_t)a1);

      return;
    }
    __break(1u);
    goto LABEL_20;
  }
  if (qword_2576F1D00 != -1)
    swift_once();
  v22 = sub_247CEF598();
  __swift_project_value_buffer(v22, (uint64_t)qword_2576F49E8);
  v23 = sub_247CEF580();
  v24 = sub_247CEF6E8();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v25 = 134349056;
    v29[0] = a3;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v23, v24, "SFService activated successfully on attempt %{public}ld", v25, 0xCu);
    MEMORY[0x249590A5C](v25, -1, -1);
  }

  v26 = &v7[OBJC_IVAR___WFSetupServerInternal_activationHandler];
  swift_beginAccess();
  v28 = *(void (**)(uint64_t))v26;
  v27 = *((_QWORD *)v26 + 1);
  sub_247CBDD44((uint64_t)v28);
  sub_247CE2C08(v28, v27, 0, 0);

  sub_247CBDE58((uint64_t)v28);
}

void sub_247CC810C(void *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  void *v44;
  uint64_t v45;
  _QWORD *v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unsigned int (*v53)(_QWORD, _QWORD, _QWORD);
  void *v54;
  void *v55;
  id v56;
  char *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint8_t *v62;
  uint64_t v63;
  void (*v64)(char *, char *, uint64_t);
  id v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t);
  uint64_t v75;
  char *v76;
  NSObject *v77;
  os_log_type_t v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  uint64_t v84;
  uint64_t v85;
  void (*v86)(uint64_t);
  uint64_t v87;
  void *v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  NSObject *v94;
  os_log_type_t v95;
  uint64_t v96;
  uint8_t *v97;
  uint64_t inited;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  void *v102;
  NSObject *v103;
  os_log_type_t v104;
  uint8_t *v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  unint64_t v109;
  uint8_t *v110;
  void (*v111)(char *, uint64_t);
  uint8_t *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  NSObject *v117;
  os_log_type_t v118;
  uint8_t *v119;
  NSObject *v120;
  os_log_type_t v121;
  _BOOL4 v122;
  uint64_t v123;
  uint8_t *v124;
  uint64_t v125;
  uint64_t v126;
  void (*v127)(uint64_t);
  os_log_type_t v128;
  uint8_t *v129;
  char *v130;
  uint8_t *v131;
  id v132;
  void *v133;
  uint64_t v134;
  void *v135;
  char *v136;
  char *v137;
  uint64_t v138;
  char *v139;
  char *v140;
  char *v141;
  uint64_t v142;
  unsigned int v143;
  unsigned int (*v144)(_QWORD, _QWORD, _QWORD);
  char *v145;
  uint64_t v146;
  char *v147;
  char *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  uint8_t *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155[15];
  uint64_t v156;
  uint64_t v157[3];
  uint64_t v158[5];

  v143 = a3;
  v158[3] = *MEMORY[0x24BDAC8D0];
  v5 = sub_247CEF598();
  v6 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x24BDAC7A8](v5, v7);
  v139 = (char *)&v136 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v10);
  v141 = (char *)&v136 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  v14 = MEMORY[0x24BDAC7A8](v12, v13);
  v16 = (char *)&v136 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v14, v17);
  v148 = (char *)&v136 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18, v20);
  v23 = (char *)&v136 - v22;
  MEMORY[0x24BDAC7A8](v21, v24);
  v26 = (char *)&v136 - v25;
  v27 = sub_247CEF550();
  v28 = *(uint8_t **)(v27 - 8);
  v151 = v27;
  v152 = v28;
  v30 = MEMORY[0x24BDAC7A8](v27, v29);
  v136 = (char *)&v136 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x24BDAC7A8](v30, v32);
  v35 = (char *)&v136 - v34;
  MEMORY[0x24BDAC7A8](v33, v36);
  v147 = (char *)&v136 - v37;
  if (qword_2576F1D00 != -1)
    swift_once();
  v137 = v16;
  v142 = v6;
  v38 = __swift_project_value_buffer(v5, (uint64_t)qword_2576F49E8);
  v39 = a1;
  swift_bridgeObjectRetain_n();
  v40 = v39;
  v146 = v38;
  v41 = sub_247CEF580();
  v42 = sub_247CEF6E8();
  v43 = os_log_type_enabled(v41, v42);
  v153 = a2;
  v150 = v40;
  v145 = v23;
  v140 = v35;
  if (v43)
  {
    v138 = v5;
    v44 = v40;
    v45 = swift_slowAlloc();
    v46 = (_QWORD *)swift_slowAlloc();
    v144 = (unsigned int (*)(_QWORD, _QWORD, _QWORD))swift_slowAlloc();
    v158[0] = (uint64_t)v144;
    *(_DWORD *)v45 = 138543618;
    v47 = objc_msgSend(v44, sel_peerDevice);
    v48 = v47;
    if (v47)
      v157[0] = (uint64_t)v47;
    else
      v157[0] = 0;
    sub_247CEF748();
    *v46 = v48;
    v49 = v150;

    *(_WORD *)(v45 + 12) = 2082;
    swift_bridgeObjectRetain();
    v50 = sub_247CEF628();
    v52 = v51;
    swift_bridgeObjectRelease();
    v157[0] = sub_247CB5D84(v50, v52, v158);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v41, v42, "Received the following objects from [%{public}@]: %{public}s", (uint8_t *)v45, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v46, -1, -1);
    v53 = v144;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v53, -1, -1);
    MEMORY[0x249590A5C](v45, -1, -1);

    v5 = v138;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v54 = (void *)sub_247CEF604();
  v55 = (void *)sub_247CEF64C();
  v56 = (id)NSDictionaryGetNSNumber();

  v57 = v148;
  v58 = v149;
  if (!v56)
    __break(1u);
  v59 = sub_247CEF904();

  v60 = v58 + OBJC_IVAR___WFSetupServerInternal_peer;
  swift_beginAccess();
  sub_247CCFBBC(v60, (uint64_t)v26, &qword_2576F2728);
  v61 = v151;
  v62 = v152;
  v144 = (unsigned int (*)(_QWORD, _QWORD, _QWORD))*((_QWORD *)v152 + 6);
  if (v144(v26, 1, v151) == 1)
  {
    v63 = (uint64_t)v26;
LABEL_19:
    sub_247CBCE98(v63, &qword_2576F2728);
    goto LABEL_20;
  }
  v64 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v62 + 4);
  v64(v147, v26, v61);
  v65 = objc_msgSend(v150, sel_peerDevice);
  if (!v65)
  {
    v69 = (uint64_t)v145;
    (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v62 + 7))(v145, 1, 1, v61);
    v70 = v147;
LABEL_18:
    (*((void (**)(char *, uint64_t))v62 + 1))(v70, v61);
    v63 = v69;
    goto LABEL_19;
  }
  v66 = v65;
  v67 = objc_msgSend(v65, sel_identifier);

  if (v67)
  {
    sub_247CEF544();

    v68 = 0;
  }
  else
  {
    v68 = 1;
  }
  v61 = v151;
  v62 = v152;
  v70 = v147;
  (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v152 + 7))(v57, v68, 1, v151);
  v71 = (uint64_t)v57;
  v69 = (uint64_t)v145;
  sub_247CCD854(v71, (uint64_t)v145, &qword_2576F2728);
  if (v144(v69, 1, v61) == 1)
    goto LABEL_18;
  v72 = v140;
  v64(v140, (char *)v69, v61);
  sub_247CCF9D4(&qword_2576F2828, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  v73 = v61;
  if ((sub_247CEF640() & 1) == 0)
  {
    sub_247CCC888(v150);
    v111 = (void (*)(char *, uint64_t))*((_QWORD *)v152 + 1);
    v111(v72, v73);
    v111(v70, v73);
    return;
  }
  v74 = (void (*)(char *, uint64_t))*((_QWORD *)v152 + 1);
  v74(v72, v73);
  v74(v70, v73);
LABEL_20:
  switch(v59)
  {
    case 1:
      if ((v143 & 1) == 0)
        goto LABEL_34;
      sub_247CCF128(0xD000000000000021, 0x8000000247CF34A0, "FIXME: %{public}s");
      break;
    case 3:
      v81 = sub_247CEF580();
      v82 = sub_247CEF6E8();
      if (os_log_type_enabled(v81, v82))
      {
        v83 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v83 = 0;
        _os_log_impl(&dword_247CAF000, v81, v82, "PreAuth request received.", v83, 2u);
        MEMORY[0x249590A5C](v83, -1, -1);
      }

      v84 = v58 + OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler;
      swift_beginAccess();
      v86 = *(void (**)(uint64_t))v84;
      v85 = *(_QWORD *)(v84 + 8);
      sub_247CBDD44((uint64_t)v86);
      sub_247CE381C(v153, 1, v86, v85);
      sub_247CBDE58((uint64_t)v86);
      v87 = MEMORY[0x24BEE4AD8] + 8;
      v88 = (void *)sub_247CEF604();
      v89 = (uint64_t *)(v58 + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler);
      swift_beginAccess();
      v91 = *v89;
      v90 = v89[1];
      sub_247CBDD44(v91);
      sub_247CE1FA0(0xAuLL, v88, 1, v91, v90);
      sub_247CBDE58(v91);

      v92 = v141;
      v93 = v142;
      (*(void (**)(char *, uint64_t, uint64_t))(v142 + 16))(v141, v146, v5);
      v94 = sub_247CEF580();
      v95 = sub_247CEF6E8();
      if (os_log_type_enabled(v94, v95))
      {
        v96 = swift_slowAlloc();
        v153 = v87;
        v97 = (uint8_t *)v96;
        v150 = (void *)swift_slowAlloc();
        v155[0] = (uint64_t)v150;
        *(_DWORD *)v97 = 136315138;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2820);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_247CF1020;
        v148 = (char *)(v97 + 4);
        *(_QWORD *)(inited + 32) = 28783;
        *(_QWORD *)(inited + 40) = 0xE200000000000000;
        *(_DWORD *)(inited + 48) = 4;
        sub_247CC02F8(inited);
        v138 = v5;
        v99 = sub_247CEF628();
        v101 = v100;
        swift_bridgeObjectRelease();
        v154 = sub_247CB5D84(v99, v101, v155);
        v58 = v149;
        sub_247CEF748();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247CAF000, v94, v95, "Sending PreAuth Response: %s", v97, 0xCu);
        v102 = v150;
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v102, -1, -1);
        MEMORY[0x249590A5C](v97, -1, -1);

        (*(void (**)(char *, uint64_t))(v93 + 8))(v141, v138);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v93 + 8))(v92, v5);
      }
      v112 = v152;
      v113 = *(void **)(v58 + OBJC_IVAR___WFSetupServerInternal_sfService);
      if (!v113)
      {
        v103 = sub_247CEF580();
        v128 = sub_247CEF6DC();
        if (!os_log_type_enabled(v103, v128))
          goto LABEL_51;
        v129 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v129 = 0;
        _os_log_impl(&dword_247CAF000, v103, v128, "Unexpectedly found the sfService to be nil", v129, 2u);
        v110 = v129;
        goto LABEL_50;
      }
      v114 = (uint64_t)v137;
      sub_247CCFBBC(v60, (uint64_t)v137, &qword_2576F2728);
      v115 = v151;
      if (v144(v114, 1, v151) == 1)
      {
        v116 = v113;
        sub_247CBCE98(v114, &qword_2576F2728);
        v117 = sub_247CEF580();
        v118 = sub_247CEF6DC();
        if (os_log_type_enabled(v117, v118))
        {
          v119 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v119 = 0;
          _os_log_impl(&dword_247CAF000, v117, v118, "Unexpectedly found the peer to be nil", v119, 2u);
          MEMORY[0x249590A5C](v119, -1, -1);
        }

      }
      else
      {
        v130 = v136;
        (*((void (**)(char *, uint64_t, uint64_t))v112 + 4))(v136, v114, v115);
        v131 = v112;
        v132 = v113;
        v133 = (void *)sub_247CEF538();
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
        v134 = swift_initStackObject();
        *(_OWORD *)(v134 + 16) = xmmword_247CF1020;
        v155[0] = 28783;
        v155[1] = 0xE200000000000000;
        sub_247CEF790();
        *(_QWORD *)(v134 + 96) = MEMORY[0x24BEE3F88];
        *(_DWORD *)(v134 + 72) = 4;
        sub_247CC0084(v134);
        v135 = (void *)sub_247CEF604();
        swift_bridgeObjectRelease();
        objc_msgSend(v132, sel_sendToPeer_flags_object_, v133, v143, v135);

        (*((void (**)(char *, uint64_t))v131 + 1))(v130, v115);
      }
      break;
    case 4:
      sub_247CCB5A0();
      break;
    case 5:
      if ((v143 & 1) != 0)
      {
        v120 = sub_247CEF580();
        v121 = sub_247CEF6E8();
        v122 = os_log_type_enabled(v120, v121);
        v123 = v153;
        if (v122)
        {
          v124 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v124 = 0;
          _os_log_impl(&dword_247CAF000, v120, v121, "Received config message", v124, 2u);
          MEMORY[0x249590A5C](v124, -1, -1);
        }

        v125 = v58 + OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler;
        swift_beginAccess();
        v127 = *(void (**)(uint64_t))v125;
        v126 = *(_QWORD *)(v125 + 8);
        sub_247CBDD44((uint64_t)v127);
        sub_247CE381C(v123, 1, v127, v126);
        sub_247CBDE58((uint64_t)v127);
      }
      else
      {
LABEL_34:
        swift_bridgeObjectRetain_n();
        v103 = sub_247CEF580();
        v104 = sub_247CEF6E8();
        if (os_log_type_enabled(v103, v104))
        {
          v105 = (uint8_t *)swift_slowAlloc();
          v106 = swift_slowAlloc();
          v157[0] = v106;
          *(_DWORD *)v105 = 136446210;
          v152 = v105 + 4;
          swift_bridgeObjectRetain();
          v107 = sub_247CEF628();
          v109 = v108;
          swift_bridgeObjectRelease();
          v156 = sub_247CB5D84(v107, v109, v157);
          sub_247CEF748();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_247CAF000, v103, v104, "Ignoring unencrypted config request: %{public}s", v105, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x249590A5C](v106, -1, -1);
          v110 = v105;
LABEL_50:
          MEMORY[0x249590A5C](v110, -1, -1);
LABEL_51:

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
      }
      break;
    case 12:
      sub_247CCB2A0(v153);
      break;
    default:
      v75 = v142;
      v76 = v139;
      (*(void (**)(char *, uint64_t, uint64_t))(v142 + 16))(v139, v146, v5);
      v77 = sub_247CEF580();
      v78 = sub_247CEF6E8();
      if (os_log_type_enabled(v77, v78))
      {
        v79 = swift_slowAlloc();
        v80 = swift_slowAlloc();
        v157[0] = v80;
        *(_DWORD *)v79 = 16777730;
        LOBYTE(v156) = v59;
        sub_247CEF748();
        *(_WORD *)(v79 + 5) = 2080;
        v156 = sub_247CB5D84(7104878, 0xE300000000000000, v157);
        sub_247CEF748();
        _os_log_impl(&dword_247CAF000, v77, v78, "Ignoring unsupported opcode %hhu, %s", (uint8_t *)v79, 0xFu);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v80, -1, -1);
        MEMORY[0x249590A5C](v79, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v75 + 8))(v76, v5);
      break;
  }
}

void sub_247CC9118()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void **v7;
  void *v8;
  id v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  const char *v16;
  char v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t *v22;
  void (*v23)(_QWORD);
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = v0;
  v2 = sub_247CEF5E0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (uint64_t *)((char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = (void **)(v1 + OBJC_IVAR___WFSetupServerInternal_dispatchQueue);
  swift_beginAccess();
  v8 = *v7;
  *v6 = v8;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BEE5610], v2);
  v9 = v8;
  LOBYTE(v8) = sub_247CEF5F8();
  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v6, v2);
  if ((v8 & 1) == 0)
  {
    __break(1u);
    goto LABEL_29;
  }
  v10 = v1 + OBJC_IVAR___WFSetupServerInternal_serverState;
  if (*(_BYTE *)(v1 + OBJC_IVAR___WFSetupServerInternal_serverState + 2)
    && *(_BYTE *)(v1 + OBJC_IVAR___WFSetupServerInternal_serverState + 2) != 1)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    if (qword_2576F1D00 == -1)
    {
LABEL_10:
      v12 = sub_247CEF598();
      __swift_project_value_buffer(v12, (uint64_t)qword_2576F49E8);
      v13 = sub_247CEF580();
      v14 = sub_247CEF6E8();
      if (!os_log_type_enabled(v13, v14))
      {
LABEL_13:

        return;
      }
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      v16 = "Invalidated already";
LABEL_12:
      _os_log_impl(&dword_247CAF000, v13, v14, v16, v15, 2u);
      MEMORY[0x249590A5C](v15, -1, -1);
      goto LABEL_13;
    }
LABEL_29:
    swift_once();
    goto LABEL_10;
  }
  v11 = sub_247CEF88C();
  swift_bridgeObjectRelease();
  if ((v11 & 1) != 0)
    goto LABEL_9;
  if (*(_BYTE *)(v10 + 2) && *(_BYTE *)(v10 + 2) == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = sub_247CEF88C();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0)
    {
      if (qword_2576F1D00 != -1)
        swift_once();
      v18 = sub_247CEF598();
      __swift_project_value_buffer(v18, (uint64_t)qword_2576F49E8);
      v19 = sub_247CEF580();
      v20 = sub_247CEF6E8();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_247CAF000, v19, v20, "Unexpectedly invalidated", v21, 2u);
        MEMORY[0x249590A5C](v21, -1, -1);
      }

    }
  }
  if (!*(_QWORD *)(v1 + OBJC_IVAR___WFSetupServerInternal_sfService))
  {
    v22 = (uint64_t *)(v1 + OBJC_IVAR___WFSetupServerInternal_completionHandler);
    swift_beginAccess();
    v23 = (void (*)(_QWORD))*v22;
    if (*v22)
    {
      swift_retain();
      v23(0);
      sub_247CBDE58((uint64_t)v23);
      v24 = *v22;
    }
    else
    {
      v24 = 0;
    }
    *v22 = 0;
    v22[1] = 0;
    sub_247CBDE58(v24);
    v25 = (uint64_t *)(v1 + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler);
    swift_beginAccess();
    v26 = *v25;
    *v25 = 0;
    v25[1] = 0;
    sub_247CBDE58(v26);
    *(_BYTE *)(v10 + 2) = 2;
    if (qword_2576F1D00 != -1)
      swift_once();
    v27 = sub_247CEF598();
    __swift_project_value_buffer(v27, (uint64_t)qword_2576F49E8);
    v13 = sub_247CEF580();
    v14 = sub_247CEF6E8();
    if (!os_log_type_enabled(v13, v14))
      goto LABEL_13;
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    v16 = "Invalidated";
    goto LABEL_12;
  }
}

void sub_247CC9594(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  char *v25;
  id v26;
  char *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  uint64_t inited;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  uint64_t v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  id v67;
  os_log_type_t v68;
  uint8_t *v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  void (*v76)(NSObject *, char *, uint64_t);
  NSObject *v77;
  unint64_t v78;
  NSObject *v79;
  id v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  unint64_t v85;
  unint64_t v86;
  char *v87;
  os_log_t v88;
  id v89;
  char *v90;
  os_log_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char *v95;
  uint64_t v96;
  int v97;
  NSObject *v98;
  uint64_t v99;
  uint64_t aBlock;
  unint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;

  v2 = v1;
  v4 = sub_247CEF550();
  v5 = *(char **)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v98 = ((char *)&v89 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  v10 = MEMORY[0x24BDAC7A8](v8, v9);
  v12 = (char *)&v89 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v13);
  v15 = (char *)&v89 - v14;
  v16 = sub_247CEF598();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16, v18);
  v20 = (char *)&v89 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = OBJC_IVAR___WFSetupServerInternal_sfSession;
  if (*(_QWORD *)&v2[OBJC_IVAR___WFSetupServerInternal_sfSession])
  {
    v95 = v5;
    v96 = v4;
    if (qword_2576F1D00 != -1)
      swift_once();
    v22 = __swift_project_value_buffer(v16, (uint64_t)qword_2576F49E8);
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v20, v22, v16);
    v23 = a1;
    v24 = v16;
    v25 = v2;
    v26 = v23;
    v27 = v25;
    v28 = sub_247CEF580();
    v97 = sub_247CEF6E8();
    if (os_log_type_enabled(v28, (os_log_type_t)v97))
    {
      v91 = v28;
      v92 = v17;
      v93 = v24;
      v94 = v2;
      v29 = 7104878;
      v30 = swift_slowAlloc();
      v31 = swift_slowAlloc();
      aBlock = v31;
      *(_DWORD *)v30 = 136446466;
      v89 = v26;
      v32 = objc_msgSend(v26, sel_peerDevice);
      v90 = v27;
      if (v32)
      {
        v33 = v32;
        v34 = objc_msgSend(v32, sel_identifier);

        v35 = v92;
        if (v34)
        {
          sub_247CEF544();

          v36 = 0;
        }
        else
        {
          v36 = 1;
        }
        v74 = v95;
        v75 = v96;
        (*((void (**)(char *, uint64_t, uint64_t, uint64_t))v95 + 7))(v12, v36, 1, v96);
        sub_247CCD854((uint64_t)v12, (uint64_t)v15, &qword_2576F2728);
        if ((*((unsigned int (**)(char *, uint64_t, uint64_t))v74 + 6))(v15, 1, v75))
        {
          sub_247CBCE98((uint64_t)v15, &qword_2576F2728);
          v70 = 0xE300000000000000;
          v71 = 7104878;
        }
        else
        {
          v76 = (void (*)(NSObject *, char *, uint64_t))*((_QWORD *)v74 + 2);
          v95 = v20;
          v77 = v98;
          v76(v98, v15, v75);
          sub_247CBCE98((uint64_t)v15, &qword_2576F2728);
          v71 = sub_247CEF52C();
          v70 = v78;
          v79 = v77;
          v20 = v95;
          (*((void (**)(NSObject *, uint64_t))v74 + 1))(v79, v75);
        }
        v73 = v31;
        v72 = v35;
        v29 = 7104878;
      }
      else
      {
        v70 = 0xE300000000000000;
        v71 = 7104878;
        v72 = v92;
        v73 = v31;
      }
      v99 = sub_247CB5D84(v71, v70, &aBlock);
      sub_247CEF748();
      v80 = v89;

      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 12) = 2082;
      v81 = *(void **)&v94[v21];
      if (v81 && (v82 = objc_msgSend(v81, sel_peerDevice)) != 0)
      {
        v83 = v82;
        v84 = objc_msgSend(v82, sel_description);

        v29 = sub_247CEF658();
        v86 = v85;

      }
      else
      {
        v86 = 0xE300000000000000;
      }
      v99 = sub_247CB5D84(v29, v86, &aBlock);
      sub_247CEF748();
      v87 = v90;

      swift_bridgeObjectRelease();
      v88 = v91;
      _os_log_impl(&dword_247CAF000, v91, (os_log_type_t)v97, "Ignoring session from:  %{public}s when active with: %{public}s", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v73, -1, -1);
      MEMORY[0x249590A5C](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v72 + 8))(v20, v93);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v24);
    }
  }
  else
  {
    *(_QWORD *)&v2[OBJC_IVAR___WFSetupServerInternal_sfSession] = a1;
    v37 = a1;
    v38 = objc_msgSend(v37, sel_messageSessionTemplate);
    if (v38)
    {
      v39 = v38;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_247CF1040;
      aBlock = 0x746365726964;
      v101 = 0xE600000000000000;
      v98 = v39;
      sub_247CEF790();
      v41 = MEMORY[0x24BEE1328];
      *(_QWORD *)(inited + 96) = MEMORY[0x24BEE1328];
      *(_BYTE *)(inited + 72) = 1;
      aBlock = 0xD000000000000010;
      v101 = 0x8000000247CF2D90;
      sub_247CEF790();
      *(_QWORD *)(inited + 168) = v41;
      *(_BYTE *)(inited + 144) = 1;
      sub_247CC0084(inited);
      v42 = (void *)sub_247CEF64C();
      v43 = (void *)sub_247CEF604();
      v44 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v104 = sub_247CCF8BC;
      v105 = v44;
      aBlock = MEMORY[0x24BDAC760];
      v101 = 1107296256;
      v102 = sub_247CD1884;
      v103 = &block_descriptor_39;
      v45 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v37, sel_registerRequestID_options_handler_, v42, v43, v45);
      _Block_release(v45);

      v46 = (void *)sub_247CEF64C();
      v47 = (void *)sub_247CEF604();
      v48 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v104 = sub_247CCF8C4;
      v105 = v48;
      aBlock = MEMORY[0x24BDAC760];
      v101 = 1107296256;
      v102 = sub_247CD1884;
      v103 = &block_descriptor_43;
      v49 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v37, sel_registerRequestID_options_handler_, v46, v47, v49);
      _Block_release(v49);

      v50 = (void *)sub_247CEF64C();
      v51 = (void *)sub_247CEF604();
      swift_bridgeObjectRelease();
      v52 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v104 = sub_247CCF8E4;
      v105 = v52;
      v53 = MEMORY[0x24BDAC760];
      aBlock = MEMORY[0x24BDAC760];
      v101 = 1107296256;
      v102 = sub_247CD1884;
      v103 = &block_descriptor_47;
      v54 = _Block_copy(&aBlock);
      swift_release();
      objc_msgSend(v37, sel_registerRequestID_options_handler_, v50, v51, v54);
      _Block_release(v54);

      v55 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v56 = swift_allocObject();
      *(_QWORD *)(v56 + 16) = v55;
      *(_QWORD *)(v56 + 24) = v37;
      v104 = sub_247CCF930;
      v105 = v56;
      aBlock = v53;
      v101 = 1107296256;
      v102 = sub_247CD1570;
      v103 = &block_descriptor_54;
      v57 = _Block_copy(&aBlock);
      v58 = v37;
      swift_release();
      objc_msgSend(v58, sel_setErrorHandler_, v57);
      _Block_release(v57);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F27E8);
      v59 = swift_allocObject();
      *(_OWORD *)(v59 + 16) = xmmword_247CF1020;
      *(_QWORD *)(v59 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v59 + 32) = 7631725;
      *(_QWORD *)(v59 + 40) = 0xE300000000000000;
      *(_QWORD *)(v59 + 88) = sub_247CBBA5C(0, &qword_2576F27F0);
      v60 = v98;
      *(_QWORD *)(v59 + 64) = v98;
      sub_247CBBA5C(0, (unint64_t *)&qword_2576F2DE0);
      v61 = v60;
      v62 = (void *)sub_247CEF6D0();
      v63 = (uint64_t *)&v2[OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler];
      swift_beginAccess();
      v65 = *v63;
      v64 = v63[1];
      sub_247CBDD44(v65);
      sub_247CE1FA0(3uLL, v62, 1, v65, v64);
      sub_247CBDE58(v65);

      v66 = *(void **)&v2[OBJC_IVAR___WFSetupServerInternal_sfService];
      if (v66)
      {
        v67 = v66;
        objc_msgSend(v67, sel_setNeedsSetup_, 0);

      }
    }
    else
    {
      if (qword_2576F1D00 != -1)
        swift_once();
      __swift_project_value_buffer(v16, (uint64_t)qword_2576F49E8);
      v98 = sub_247CEF580();
      v68 = sub_247CEF6E8();
      if (os_log_type_enabled(v98, v68))
      {
        v69 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v69 = 0;
        _os_log_impl(&dword_247CAF000, v98, v68, "No message template", v69, 2u);
        MEMORY[0x249590A5C](v69, -1, -1);
      }

    }
  }
}

void sub_247CCA194(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, _QWORD, unint64_t), uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v7 = a5 + 16;
  swift_beginAccess();
  v8 = MEMORY[0x249590A98](v7);
  if (v8)
  {
    v9 = (void *)v8;
    sub_247CCF2B4(a2, a3);

  }
}

void sub_247CCA204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v10 = a5 + 16;
  swift_beginAccess();
  v11 = MEMORY[0x249590A98](v10);
  if (v11)
  {
    v12 = (void *)v11;
    a6(a2, a3, a4);

  }
}

void sub_247CCA284(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  void *v19;
  uint8_t *v20;
  _QWORD *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t inited;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  _QWORD v45[10];

  v45[8] = *MEMORY[0x24BDAC8D0];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  v8 = MEMORY[0x24BDAC7A8](v6, v7);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v11);
  v13 = (char *)&v42 - v12;
  if (qword_2576F1D00 != -1)
    swift_once();
  v14 = sub_247CEF598();
  __swift_project_value_buffer(v14, (uint64_t)qword_2576F49E8);
  v15 = a1;
  v16 = a1;
  v17 = sub_247CEF580();
  v18 = sub_247CEF6E8();
  if (os_log_type_enabled(v17, v18))
  {
    v43 = a2;
    v19 = a3;
    v20 = (uint8_t *)swift_slowAlloc();
    v21 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v20 = 138412290;
    if (a1)
    {
      v22 = a1;
      v23 = _swift_stdlib_bridgeErrorToNSError();
      v45[0] = v23;
      sub_247CEF748();
    }
    else
    {
      v45[0] = 0;
      sub_247CEF748();
      v23 = 0;
    }
    *v21 = v23;

    _os_log_impl(&dword_247CAF000, v17, v18, "Error Handler invoked with error: %@", v20, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v21, -1, -1);
    MEMORY[0x249590A5C](v20, -1, -1);

    a3 = v19;
    a2 = v43;
    if (!a1)
      return;
  }
  else
  {

    if (!a1)
      return;
  }
  swift_beginAccess();
  v24 = MEMORY[0x249590A98](a2 + 16);
  if (v24)
  {
    v25 = (void *)v24;
    v26 = a1;
    swift_retain();

    v27 = objc_msgSend(a3, sel_identifier);
    if (v27)
    {
      v28 = v27;
      sub_247CEF544();

      v29 = sub_247CEF550();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v10, 0, 1, v29);
    }
    else
    {
      v29 = sub_247CEF550();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v10, 1, 1, v29);
    }
    sub_247CCD854((uint64_t)v10, (uint64_t)v13, &qword_2576F2728);
    sub_247CEF550();
    v30 = *(_QWORD *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v13, 1, v29) == 1)
    {
      sub_247CBCE98((uint64_t)v13, &qword_2576F2728);
      v31 = 0;
      v32 = 0xE000000000000000;
    }
    else
    {
      v31 = sub_247CEF520();
      v32 = v33;
      (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v29);
    }
    v34 = (void *)sub_247CEF4CC();
    v35 = objc_msgSend(v34, sel_code);

    v44 = v35;
    v36 = sub_247CEF874();
    v38 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2810);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247CF1020;
    *(_QWORD *)(inited + 32) = 0x646F43726F727265;
    *(_QWORD *)(inited + 40) = 0xE900000000000065;
    *(_QWORD *)(inited + 48) = v36;
    *(_QWORD *)(inited + 56) = v38;
    v40 = sub_247CC0408(inited);
    v45[3] = &type metadata for DisconnectedProximitySetupServerAnalyticsEvent;
    v45[4] = sub_247CCF938();
    v41 = (_QWORD *)swift_allocObject();
    v45[0] = v41;
    v41[2] = 0xD000000000000035;
    v41[3] = 0x8000000247CF3420;
    v41[4] = v31;
    v41[5] = v32;
    v41[6] = v40;
    sub_247CDEA30(v45);

    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  }
}

void sub_247CCA72C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  unint64_t v21;
  unint64_t v22;
  void *v23;
  _QWORD *v24;
  uint64_t inited;
  unint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(_QWORD, _QWORD, _QWORD);
  uint64_t v33[5];
  __int128 v34;
  __int128 v35;

  if (qword_2576F1D00 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F49E8);
  swift_bridgeObjectRetain_n();
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v32 = a2;
    v7 = swift_slowAlloc();
    v31 = swift_slowAlloc();
    v33[0] = v31;
    *(_DWORD *)v7 = 136446466;
    *(_QWORD *)&v34 = sub_247CB5D84(0xD000000000000028, 0x8000000247CF3370, v33);
    sub_247CEF748();
    *(_WORD *)(v7 + 12) = 2082;
    swift_bridgeObjectRetain();
    v8 = sub_247CEF628();
    v10 = v9;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v34 = sub_247CB5D84(v8, v10, v33);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v5, v6, "%{public}s invoked with request: %{public}s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v31, -1, -1);
    v11 = v7;
    a2 = v32;
    MEMORY[0x249590A5C](v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v12 = MEMORY[0x24BEE0D00];
  sub_247CEF790();
  if (*(_QWORD *)(a1 + 16) && (v13 = sub_247CDD188((uint64_t)v33), (v14 & 1) != 0))
  {
    sub_247CB674C(*(_QWORD *)(a1 + 56) + 32 * v13, (uint64_t)&v34);
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
  }
  sub_247CCF0F4((uint64_t)v33);
  if (*((_QWORD *)&v35 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v27 = sub_247CEF580();
      v28 = sub_247CEF6E8();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        v30 = swift_slowAlloc();
        v33[0] = v30;
        *(_DWORD *)v29 = 136446210;
        *(_QWORD *)&v34 = sub_247CB5D84(0xD000000000000028, 0x8000000247CF3370, v33);
        sub_247CEF748();
        _os_log_impl(&dword_247CAF000, v27, v28, "%{public}s received unknown setup event", v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v30, -1, -1);
        MEMORY[0x249590A5C](v29, -1, -1);
      }

      return;
    }
  }
  else
  {
    sub_247CBCE98((uint64_t)&v34, &qword_2576F24D0);
  }
  swift_bridgeObjectRetain_n();
  v15 = sub_247CEF580();
  v16 = sub_247CEF6DC();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v33[0] = v18;
    *(_DWORD *)v17 = 136446210;
    swift_bridgeObjectRetain();
    v19 = sub_247CEF628();
    v20 = a2;
    v22 = v21;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v34 = sub_247CB5D84(v19, v22, v33);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    a2 = v20;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v15, v16, "Failed to retrieve security event raw value from request: %{public}s", v17, 0xCu);
    v12 = MEMORY[0x24BEE0D00];
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v18, -1, -1);
    MEMORY[0x249590A5C](v17, -1, -1);

    if (!v20)
      return;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    if (!a2)
      return;
  }
  sub_247CCCF78();
  v23 = (void *)swift_allocError();
  *v24 = 3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247CF1020;
  v33[0] = 0;
  v33[1] = 0xE000000000000000;
  sub_247CEF790();
  *(_QWORD *)(inited + 96) = v12;
  *(_QWORD *)(inited + 72) = 0;
  *(_QWORD *)(inited + 80) = 0xE000000000000000;
  v26 = sub_247CC0084(inited);
  a2(v23, 0, v26);
  swift_bridgeObjectRelease();

}

void sub_247CCAF94(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34[3];

  v2 = v1;
  v4 = sub_247CEF598();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OBJC_IVAR___WFSetupServerInternal_sfSession;
  v10 = *(void **)&v2[OBJC_IVAR___WFSetupServerInternal_sfSession];
  if (v10)
  {
    sub_247CBBA5C(0, &qword_2576F2808);
    v11 = a1;
    v12 = v10;
    v13 = sub_247CEF730();

    if ((v13 & 1) != 0)
    {
      if (qword_2576F1D00 != -1)
        swift_once();
      v14 = __swift_project_value_buffer(v4, (uint64_t)qword_2576F49E8);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v14, v4);
      v15 = v2;
      v16 = sub_247CEF580();
      v17 = sub_247CEF6E8();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        v19 = swift_slowAlloc();
        v34[0] = v19;
        *(_DWORD *)v18 = 136446210;
        v20 = *(void **)&v2[v9];
        v32 = v19;
        if (v20 && (v21 = objc_msgSend(v20, sel_peerDevice)) != 0)
        {
          v22 = v21;
          v23 = objc_msgSend(v21, sel_description);

          v24 = sub_247CEF658();
          v26 = v25;

        }
        else
        {
          v26 = 0xE300000000000000;
          v24 = 7104878;
        }
        v33 = sub_247CB5D84(v24, v26, v34);
        sub_247CEF748();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247CAF000, v16, v17, "Ending setup session with %{public}s", v18, 0xCu);
        v27 = v32;
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v27, -1, -1);
        MEMORY[0x249590A5C](v18, -1, -1);

      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      v28 = (uint64_t *)&v15[OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler];
      swift_beginAccess();
      v30 = *v28;
      v29 = v28[1];
      sub_247CBDD44(v30);
      sub_247CE1FA0(4uLL, 0, 1, v30, v29);
      sub_247CBDE58(v30);
      sub_247CC3E8C();
    }
  }
}

void sub_247CCB2A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30[3];

  v2 = v1;
  v4 = sub_247CEF598();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (void *)sub_247CEF604();
  v10 = (void *)sub_247CEF64C();
  v11 = (id)NSDictionaryGetNSNumber();

  if (qword_2576F1D00 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v4, (uint64_t)qword_2576F49E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v12, v4);
  v13 = v11;
  v14 = sub_247CEF580();
  v15 = sub_247CEF6E8();
  if (os_log_type_enabled(v14, v15))
  {
    v26 = v5;
    v27 = v2;
    v28 = a1;
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v30[0] = v17;
    *(_DWORD *)v16 = 136446210;
    if (v13)
    {
      v18 = objc_msgSend(v13, sel_description);
      v19 = sub_247CEF658();
      v21 = v20;

    }
    else
    {
      v21 = 0xE300000000000000;
      v19 = 7104878;
    }
    v29 = sub_247CB5D84(v19, v21, v30);
    sub_247CEF748();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v14, v15, "App event received: ID %{public}s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v17, -1, -1);
    MEMORY[0x249590A5C](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v4);
    v2 = v27;
    a1 = v28;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  v22 = v2 + OBJC_IVAR___WFSetupServerInternal_receivedObjectHandler;
  swift_beginAccess();
  v24 = *(void (**)(uint64_t))v22;
  v23 = *(_QWORD *)(v22 + 8);
  sub_247CBDD44((uint64_t)v24);
  sub_247CE381C(a1, 1, v24, v23);
  sub_247CBDE58((uint64_t)v24);

}

uint64_t sub_247CCB5A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15[3];

  v1 = v0;
  if (qword_2576F1D00 != -1)
    swift_once();
  v2 = sub_247CEF598();
  __swift_project_value_buffer(v2, (uint64_t)qword_2576F49E8);
  swift_bridgeObjectRetain_n();
  v3 = sub_247CEF580();
  v4 = sub_247CEF6E8();
  if (os_log_type_enabled(v3, v4))
  {
    v14 = v1;
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v15[0] = v6;
    *(_DWORD *)v5 = 136446210;
    swift_bridgeObjectRetain();
    v7 = sub_247CEF628();
    v9 = v8;
    swift_bridgeObjectRelease();
    sub_247CB5D84(v7, v9, v15);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    v1 = v14;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v3, v4, "PreAuthResponse: %{public}s, received from client", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v6, -1, -1);
    MEMORY[0x249590A5C](v5, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v10 = (uint64_t *)(v1 + OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler);
  swift_beginAccess();
  v12 = *v10;
  v11 = v10[1];
  sub_247CBDD44(v12);
  sub_247CE1FA0(0xBuLL, 0, 1, v12, v11);
  return sub_247CBDE58(v12);
}

void sub_247CCB7D4(void *a1)
{
  char *v1;
  void *v2;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  id v19;
  id *v20;
  id v21;
  char *v22;
  char *v23;
  id v24;
  char *v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  char **p_types;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  void **v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  NSObject *v54;
  uint64_t v55[3];

  v2 = *(void **)&v1[OBJC_IVAR___WFSetupServerInternal_sfSession];
  if (!v2)
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    v9 = sub_247CEF598();
    __swift_project_value_buffer(v9, (uint64_t)qword_2576F49E8);
    v54 = sub_247CEF580();
    v10 = sub_247CEF6E8();
    if (os_log_type_enabled(v54, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_247CAF000, v54, v10, "sfSession is unexpectedly nil in handleSessionSecured", v11, 2u);
      MEMORY[0x249590A5C](v11, -1, -1);
    }
    goto LABEL_12;
  }
  v54 = v2;
  v4 = -[NSObject fixedPIN](v54, sel_fixedPIN);
  if (v4)
  {

    if (qword_2576F1D00 != -1)
      swift_once();
    v5 = sub_247CEF598();
    __swift_project_value_buffer(v5, (uint64_t)qword_2576F49E8);
    v6 = sub_247CEF580();
    v7 = sub_247CEF6E8();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_247CAF000, v6, v7, "PreAuth session secured", v8, 2u);
      MEMORY[0x249590A5C](v8, -1, -1);
    }

    -[NSObject setFixedPIN:](v54, sel_setFixedPIN_, 0);
LABEL_12:

    return;
  }
  if (qword_2576F1D00 != -1)
    swift_once();
  v12 = sub_247CEF598();
  __swift_project_value_buffer(v12, (uint64_t)qword_2576F49E8);
  v13 = sub_247CEF580();
  v14 = sub_247CEF6E8();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_247CAF000, v13, v14, "PostAuth session secured", v15, 2u);
    MEMORY[0x249590A5C](v15, -1, -1);
  }

  v16 = sub_247CEF580();
  v17 = sub_247CEF6E8();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_247CAF000, v16, v17, "Setting up anisetteDataProvider…", v18, 2u);
    MEMORY[0x249590A5C](v18, -1, -1);
  }

  v19 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for WFSetupServerAnisetteDataProvider()), sel_init);
  v20 = (id *)&v1[OBJC_IVAR___WFSetupServerInternal_anisetteDataProvider];
  swift_beginAccess();
  v21 = *v20;
  *v20 = v19;
  v22 = (char *)v19;

  v23 = v1;
  v24 = a1;
  v25 = v23;
  v26 = v24;
  v27 = sub_247CEF580();
  v28 = sub_247CEF6E8();
  p_types = &stru_251950FF8.types;
  if (os_log_type_enabled(v27, v28))
  {
    v30 = swift_slowAlloc();
    v31 = swift_slowAlloc();
    v55[0] = v31;
    *(_DWORD *)v30 = 136315394;
    v32 = *v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F27F8);
    v33 = sub_247CEF664();
    sub_247CB5D84(v33, v34, v55);
    sub_247CEF748();

    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2080;
    v35 = objc_msgSend(v26, sel_messageSessionTemplate);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2800);
    v36 = sub_247CEF664();
    sub_247CB5D84(v36, v37, v55);
    sub_247CEF748();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v27, v28, "Setting the session template for anisetteDataProvider: %s to %s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    v38 = v31;
    p_types = (char **)(&stru_251950FF8 + 8);
    MEMORY[0x249590A5C](v38, -1, -1);
    MEMORY[0x249590A5C](v30, -1, -1);

  }
  else
  {

  }
  v39 = objc_msgSend(v26, p_types[485]);
  v40 = (void **)&v22[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session];
  swift_beginAccess();
  v41 = *v40;
  *v40 = v39;

  v42 = objc_msgSend(v26, p_types[485]);
  if (v42)
  {
    v43 = v42;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F27E8);
    v44 = swift_allocObject();
    v45 = MEMORY[0x24BEE0D00];
    *(_OWORD *)(v44 + 16) = xmmword_247CF1020;
    *(_QWORD *)(v44 + 56) = v45;
    *(_QWORD *)(v44 + 32) = 7631725;
    *(_QWORD *)(v44 + 40) = 0xE300000000000000;
    *(_QWORD *)(v44 + 88) = sub_247CBBA5C(0, &qword_2576F27F0);
    *(_QWORD *)(v44 + 64) = v43;
    sub_247CBBA5C(0, (unint64_t *)&qword_2576F2DE0);
    v46 = v43;
    v47 = (void *)sub_247CEF6D0();
    v48 = (uint64_t *)&v25[OBJC_IVAR___WFSetupServerInternal_setupProgressEventHandler];
    swift_beginAccess();
    v50 = *v48;
    v49 = v48[1];
    sub_247CBDD44(v50);
    sub_247CE1FA0(9uLL, v47, 1, v50, v49);
    sub_247CBDE58(v50);

  }
  else
  {
    v51 = sub_247CEF580();
    v52 = sub_247CEF6E8();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v53 = 0;
      _os_log_impl(&dword_247CAF000, v51, v52, "No message session template on session secured", v53, 2u);
      MEMORY[0x249590A5C](v53, -1, -1);

    }
    else
    {

    }
  }
}

void sub_247CCBF0C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD), uint64_t a3)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  __CFString *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(unint64_t);
  uint64_t inited;
  unint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint8_t *v41;
  void *v42;
  _QWORD *v43;
  void (*v44)(_QWORD, _QWORD, _QWORD);
  uint64_t v45;
  uint64_t v46[5];
  __int128 v47;
  __int128 v48;

  if (qword_2576F1D00 != -1)
    swift_once();
  v6 = sub_247CEF598();
  __swift_project_value_buffer(v6, (uint64_t)qword_2576F49E8);
  swift_bridgeObjectRetain();
  sub_247CBDD44((uint64_t)a2);
  swift_bridgeObjectRetain();
  sub_247CBDD44((uint64_t)a2);
  v7 = sub_247CEF580();
  v8 = sub_247CEF6E8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    *(_QWORD *)&v47 = v10;
    *(_DWORD *)v9 = 136446466;
    swift_bridgeObjectRetain();
    v11 = sub_247CEF628();
    v13 = v12;
    swift_bridgeObjectRelease();
    v46[0] = sub_247CB5D84(v11, v13, (uint64_t *)&v47);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2082;
    if (a2)
    {
      v14 = swift_allocObject();
      *(_QWORD *)(v14 + 16) = a2;
      *(_QWORD *)(v14 + 24) = a3;
    }
    else
    {
      v14 = 0;
    }
    v46[1] = v14;
    sub_247CBDD44((uint64_t)a2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F27E0);
    v15 = sub_247CEF664();
    v46[0] = sub_247CB5D84(v15, v16, (uint64_t *)&v47);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CBDE58((uint64_t)a2);
    sub_247CBDE58((uint64_t)a2);
    _os_log_impl(&dword_247CAF000, v7, v8, "WFSetupClient received request: %{public}s with handler: %{public}s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v10, -1, -1);
    MEMORY[0x249590A5C](v9, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_247CBDE58((uint64_t)a2);
    sub_247CBDE58((uint64_t)a2);

  }
  v17 = MEMORY[0x24BEE0D00];
  sub_247CEF790();
  if (*(_QWORD *)(a1 + 16) && (v18 = sub_247CDD188((uint64_t)v46), (v19 & 1) != 0))
  {
    sub_247CB674C(*(_QWORD *)(a1 + 56) + 32 * v18, (uint64_t)&v47);
  }
  else
  {
    v47 = 0u;
    v48 = 0u;
  }
  sub_247CCF0F4((uint64_t)v46);
  if (!*((_QWORD *)&v48 + 1))
  {
    sub_247CBCE98((uint64_t)&v47, &qword_2576F24D0);
LABEL_20:
    swift_bridgeObjectRetain_n();
    v34 = sub_247CEF580();
    v35 = sub_247CEF6DC();
    if (os_log_type_enabled(v34, v35))
    {
      v44 = a2;
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = swift_slowAlloc();
      v46[0] = v37;
      *(_DWORD *)v36 = 136446210;
      swift_bridgeObjectRetain();
      v38 = sub_247CEF628();
      v40 = v39;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v47 = sub_247CB5D84(v38, v40, v46);
      sub_247CEF748();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v34, v35, "Failed to retrieve user interaction event raw value from request: %{public}s", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v37, -1, -1);
      v41 = v36;
      a2 = v44;
      MEMORY[0x249590A5C](v41, -1, -1);

      if (!v44)
        return;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      if (!a2)
        return;
    }
    sub_247CCCF78();
    v42 = (void *)swift_allocError();
    *v43 = 2;
    a2(v42, 0, 0);

    return;
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_20;
  v20 = sub_247CEF580();
  v21 = sub_247CEF6E8();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v46[0] = v23;
    *(_DWORD *)v22 = 136446210;
    v24 = WFSetupClientUserInteractionProgressEventToString(0xD000000000000015);
    v25 = sub_247CEF658();
    v27 = v26;

    *(_QWORD *)&v47 = sub_247CB5D84(v25, v27, v46);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v20, v21, "Retrieved user client interaction event: (%{public}s)", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v23, -1, -1);
    v28 = v22;
    v17 = MEMORY[0x24BEE0D00];
    MEMORY[0x249590A5C](v28, -1, -1);
  }

  v29 = v45 + OBJC_IVAR___WFSetupServerInternal_userInteractionProgressEventHandler;
  swift_beginAccess();
  v31 = *(void (**)(unint64_t))v29;
  v30 = *(_QWORD *)(v29 + 8);
  sub_247CBDD44((uint64_t)v31);
  sub_247CE40F4(0xD000000000000015, 1, v31, v30);
  sub_247CBDE58((uint64_t)v31);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247CF1020;
    *(_QWORD *)&v47 = 0;
    *((_QWORD *)&v47 + 1) = 0xE000000000000000;
    sub_247CEF790();
    *(_QWORD *)(inited + 96) = v17;
    *(_QWORD *)(inited + 72) = 0;
    *(_QWORD *)(inited + 80) = 0xE000000000000000;
    v33 = sub_247CC0084(inited);
    a2(0, 0, v33);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_247CCC640(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v16[3];

  if (qword_2576F1D00 != -1)
    swift_once();
  v5 = sub_247CEF598();
  __swift_project_value_buffer(v5, (uint64_t)qword_2576F49E8);
  v6 = sub_247CEF580();
  v7 = sub_247CEF6E8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = swift_slowAlloc();
    v9 = swift_slowAlloc();
    v16[0] = v9;
    *(_DWORD *)v8 = 136446722;
    sub_247CB5D84(0xD00000000000002CLL, 0x8000000247CF3340, v16);
    sub_247CEF748();
    *(_WORD *)(v8 + 12) = 2082;
    v10 = sub_247CEF874();
    sub_247CB5D84(v10, v11, v16);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 22) = 1024;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v6, v7, "%{public}s invoked with flags: %{public}s, throttle seconds: %d", (uint8_t *)v8, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v9, -1, -1);
    MEMORY[0x249590A5C](v8, -1, -1);
  }

  v12 = v2 + OBJC_IVAR___WFSetupServerInternal_setupPromptPinHandler;
  swift_beginAccess();
  v14 = *(void (**)(uint64_t, uint64_t))v12;
  v13 = *(_QWORD *)(v12 + 8);
  sub_247CBDD44((uint64_t)v14);
  sub_247CE30C8(a1, a2, 1, v14, v13);
  return sub_247CBDE58((uint64_t)v14);
}

void sub_247CCC888(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _QWORD *v26;
  id v27;
  uint64_t inited;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint64_t v33;
  uint8_t *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  _QWORD v48[2];
  uint8_t *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53[2];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  v6 = MEMORY[0x24BDAC7A8](v4, v5);
  v8 = (char *)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6, v9);
  v11 = (char *)v48 - v10;
  v12 = sub_247CEF550();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12, v14);
  v16 = (char *)v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = objc_msgSend(a1, sel_peerDevice);
  if (!v17)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    goto LABEL_7;
  }
  v18 = v17;
  v19 = objc_msgSend(v17, sel_identifier);

  if (v19)
  {
    sub_247CEF544();

    v20 = 0;
  }
  else
  {
    v20 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v8, v20, 1, v12);
  sub_247CCD854((uint64_t)v8, (uint64_t)v11, &qword_2576F2728);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
LABEL_7:
    sub_247CBCE98((uint64_t)v11, &qword_2576F2728);
    if (qword_2576F1D00 != -1)
      swift_once();
    v21 = sub_247CEF598();
    __swift_project_value_buffer(v21, (uint64_t)qword_2576F49E8);
    v22 = a1;
    v23 = sub_247CEF580();
    v24 = sub_247CEF6DC();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v25 = 138412290;
      v53[0] = (uint64_t)v22;
      v27 = v22;
      sub_247CEF748();
      *v26 = v22;

      _os_log_impl(&dword_247CAF000, v23, v24, "Unable to determine peer identifier from %@ to dismiss session.", v25, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v26, -1, -1);
      MEMORY[0x249590A5C](v25, -1, -1);

    }
    else
    {

    }
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v16, v11, v12);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247CF1020;
  v53[0] = 0xD000000000000022;
  v53[1] = 0x8000000247CF3310;
  sub_247CEF790();
  *(_QWORD *)(inited + 96) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 72) = 1;
  sub_247CC0084(inited);
  if (qword_2576F1D00 != -1)
    swift_once();
  v29 = sub_247CEF598();
  __swift_project_value_buffer(v29, (uint64_t)qword_2576F49E8);
  swift_bridgeObjectRetain_n();
  v30 = sub_247CEF580();
  v31 = sub_247CEF6E8();
  v32 = os_log_type_enabled(v30, v31);
  v33 = MEMORY[0x24BEE4AD8];
  if (v32)
  {
    v51 = v16;
    v34 = (uint8_t *)swift_slowAlloc();
    v50 = swift_slowAlloc();
    v53[0] = v50;
    v49 = v34;
    *(_DWORD *)v34 = 136315138;
    v48[0] = v34 + 4;
    swift_bridgeObjectRetain();
    v48[1] = v33 + 8;
    v35 = a1;
    v36 = v2;
    v37 = sub_247CEF628();
    v39 = v38;
    swift_bridgeObjectRelease();
    v40 = v37;
    v2 = v36;
    a1 = v35;
    v52 = sub_247CB5D84(v40, v39, v53);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    v16 = v51;
    swift_bridgeObjectRelease();
    v41 = v49;
    _os_log_impl(&dword_247CAF000, v30, v31, "Sending dismiss response: %s", v49, 0xCu);
    v42 = v50;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v42, -1, -1);
    MEMORY[0x249590A5C](v41, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v43 = *(void **)(v2 + OBJC_IVAR___WFSetupServerInternal_sfService);
  if (v43)
  {
    v44 = v43;
    v45 = (void *)sub_247CEF538();
    v46 = objc_msgSend(a1, sel_sessionFlags);
    v47 = (void *)sub_247CEF604();
    swift_bridgeObjectRelease();
    objc_msgSend(v44, sel_sendToPeer_flags_object_, v45, v46, v47);

    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_247CCCE7C(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_247CCCE9C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_247CCCEC0()
{
  uint64_t v0;

  sub_247CBEE84(*(_QWORD *)(v0 + 16));
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_247CCCEE0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576F2720;
  if (!qword_2576F2720)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576F2718);
    result = MEMORY[0x2495909F0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2576F2720);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495909E4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_247CCCF70()
{
  uint64_t v0;

  sub_247CBF350(*(_QWORD *)(v0 + 16));
}

unint64_t sub_247CCCF78()
{
  unint64_t result;

  result = qword_2576F2730;
  if (!qword_2576F2730)
  {
    result = MEMORY[0x2495909F0](&unk_247CF131C, &type metadata for WFSetupServer.WFSetupServerError);
    atomic_store(result, (unint64_t *)&qword_2576F2730);
  }
  return result;
}

_OWORD *sub_247CCCFBC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_247CCCFCC(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_247CEF748();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

_OWORD *sub_247CCD07C(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_247CDD1B8(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
        return sub_247CCCFBC(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_247CDDCDC();
      goto LABEL_7;
    }
    sub_247CDD3C0(v15, a4 & 1);
    v21 = sub_247CDD1B8(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_247CCD2F4(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_247CEF8BC();
  __break(1u);
  return result;
}

void sub_247CCD1B4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_247CC3048(a1, a2, a3, *(NSObject **)(v3 + 16));
}

_OWORD *sub_247CCD1BC(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _OWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_247CDD188(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = (_OWORD *)(v16[7] + 32 * v10);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
        return sub_247CCCFBC(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_247CDDEC0();
      goto LABEL_7;
    }
    sub_247CDD6BC(v13, a3 & 1);
    v19 = sub_247CDD188(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_247CCD898(a2, (uint64_t)v21);
      return sub_247CCD35C(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)sub_247CEF8BC();
  __break(1u);
  return result;
}

_OWORD *sub_247CCD2F4(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_247CCCFBC(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

_OWORD *sub_247CCD35C(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = sub_247CCCFBC(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

unint64_t sub_247CCD3D4(unint64_t result)
{
  if (result > 7)
    return 0;
  return result;
}

uint64_t sub_247CCD3E4()
{
  unint64_t v0;

  v0 = sub_247CEF850();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_247CCD42C()
{
  unint64_t v0;

  v0 = sub_247CEF850();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

id sub_247CCD474@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR___WFSetupServerInternal_anisetteDataProvider);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_247CCD4C8()
{
  return type metadata accessor for WFSetupServer();
}

void sub_247CCD4D0()
{
  unint64_t v0;

  sub_247CCD590();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_247CCD590()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576F2788)
  {
    sub_247CEF550();
    v0 = sub_247CEF73C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2576F2788);
  }
}

_DWORD *__swift_memcpy4_1(_DWORD *result, _DWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WFSetupServer.WFSetupServerState(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[4])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for WFSetupServer.WFSetupServerState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 4) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for WFSetupServer.WFSetupServerState()
{
  return &type metadata for WFSetupServer.WFSetupServerState;
}

ValueMetadata *type metadata accessor for WFSetupServer.WFSetupServerError()
{
  return &type metadata for WFSetupServer.WFSetupServerError;
}

unint64_t sub_247CCD6AC()
{
  unint64_t result;

  result = qword_2576F2790;
  if (!qword_2576F2790)
  {
    result = MEMORY[0x2495909F0](&unk_247CF11B4, &type metadata for WFSetupServer.WFSetupServerError);
    atomic_store(result, (unint64_t *)&qword_2576F2790);
  }
  return result;
}

unint64_t sub_247CCD6F4()
{
  unint64_t result;

  result = qword_2576F2798;
  if (!qword_2576F2798)
  {
    result = MEMORY[0x2495909F0](&unk_247CF128C, &type metadata for WFSetupServer.WFSetupServerError);
    atomic_store(result, (unint64_t *)&qword_2576F2798);
  }
  return result;
}

unint64_t sub_247CCD73C()
{
  unint64_t result;

  result = qword_2576F27A0;
  if (!qword_2576F27A0)
  {
    result = MEMORY[0x2495909F0](&unk_247CF1254, &type metadata for WFSetupServer.WFSetupServerError);
    atomic_store(result, (unint64_t *)&qword_2576F27A0);
  }
  return result;
}

unint64_t sub_247CCD784()
{
  unint64_t result;

  result = qword_2576F27A8;
  if (!qword_2576F27A8)
  {
    result = MEMORY[0x2495909F0](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_2576F27A8);
  }
  return result;
}

unint64_t sub_247CCD7CC()
{
  unint64_t result;

  result = qword_2576F27B0;
  if (!qword_2576F27B0)
  {
    result = MEMORY[0x2495909F0](&unk_247CF12CC, &type metadata for WFSetupServer.WFSetupServerError);
    atomic_store(result, (unint64_t *)&qword_2576F27B0);
  }
  return result;
}

unint64_t sub_247CCD810()
{
  unint64_t result;

  result = qword_2576F27B8;
  if (!qword_2576F27B8)
  {
    result = MEMORY[0x2495909F0](&unk_247CF11E4, &type metadata for WFSetupServer.WFSetupServerError);
    atomic_store(result, (unint64_t *)&qword_2576F27B8);
  }
  return result;
}

uint64_t sub_247CCD854(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_247CCD898(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

void sub_247CCD8D4(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  void *v45;
  _QWORD *v46;
  void *v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  void *v55;
  _QWORD *v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  _BYTE *v65;
  uint64_t v66;
  _QWORD *v67;
  void *v68;
  _QWORD *v69;
  void *v70;
  _BYTE v71[12];
  int v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  _BYTE *v78;
  uint64_t v79;
  _BYTE *v80;
  uint64_t v81;
  uint64_t v82;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  v9 = MEMORY[0x24BDAC7A8](v7, v8);
  v80 = &v71[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = &v71[-v12];
  v14 = sub_247CEF550();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14, v16);
  v18 = &v71[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2576F1D00 != -1)
    swift_once();
  v19 = sub_247CEF598();
  v20 = __swift_project_value_buffer(v19, (uint64_t)qword_2576F49E8);
  swift_bridgeObjectRetain_n();
  v79 = v20;
  v21 = sub_247CEF580();
  v22 = sub_247CEF6E8();
  v23 = v22;
  v24 = os_log_type_enabled(v21, v22);
  v75 = a1;
  v78 = v13;
  if (v24)
  {
    v25 = swift_slowAlloc();
    v73 = swift_slowAlloc();
    v82 = v73;
    *(_DWORD *)v25 = 136446722;
    v74 = a3;
    v81 = sub_247CB5D84(0xD000000000000033, 0x8000000247CF2E40, &v82);
    v76 = v15;
    v77 = v14;
    sub_247CEF748();
    *(_WORD *)(v25 + 12) = 1024;
    LODWORD(v81) = a1 & 1;
    sub_247CEF748();
    *(_WORD *)(v25 + 18) = 2080;
    swift_bridgeObjectRetain();
    v26 = sub_247CEF628();
    v72 = v23;
    v27 = v18;
    v28 = a4;
    v30 = v29;
    swift_bridgeObjectRelease();
    v81 = sub_247CB5D84(v26, v30, &v82);
    v14 = v77;
    a3 = v74;
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    a4 = v28;
    v18 = v27;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v21, (os_log_type_t)v72, "%{public}s invoked with reset flag: %{BOOL}d and context: %s", (uint8_t *)v25, 0x1Cu);
    v31 = v73;
    v15 = v76;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v31, -1, -1);
    MEMORY[0x249590A5C](v25, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v32 = *(void **)(a3 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  v33 = (uint64_t)v80;
  if (v32)
  {
    v34 = v32;
    v35 = objc_msgSend(v34, sel_peerDevice);
    if (!v35)
    {
      v48 = (uint64_t)v78;
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v78, 1, 1, v14);
LABEL_16:
      sub_247CBCE98(v48, &qword_2576F2728);
      v49 = sub_247CEF580();
      v50 = sub_247CEF6DC();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc();
        v52 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v51 = 138412290;
        sub_247CCCF78();
        swift_allocError();
        *v53 = 4;
        v54 = _swift_stdlib_bridgeErrorToNSError();
        v82 = v54;
        sub_247CEF748();
        *v52 = v54;
        _os_log_impl(&dword_247CAF000, v49, v50, "Failed to start pair setup session due to error: %@", v51, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v52, -1, -1);
        MEMORY[0x249590A5C](v51, -1, -1);
      }

      sub_247CCCF78();
      v55 = (void *)swift_allocError();
      *v56 = 4;
      v57 = (void *)sub_247CEF4CC();
      (*(void (**)(uint64_t, void *, _QWORD))(a4 + 16))(a4, v57, 0);

      return;
    }
    v36 = v35;
    v37 = objc_msgSend(v35, sel_identifier);

    if (v37)
    {
      sub_247CEF544();

      v38 = 0;
    }
    else
    {
      v38 = 1;
    }
    v48 = (uint64_t)v78;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v33, v38, 1, v14);
    sub_247CCD854(v33, v48, &qword_2576F2728);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v48, 1, v14) == 1)
      goto LABEL_16;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v15 + 32))(v18, v48, v14);
    if (*(_QWORD *)(a3 + OBJC_IVAR___WFSetupServerInternal_sfService))
    {
      v58 = *(unsigned __int8 *)(a3 + OBJC_IVAR___WFSetupServerInternal_serverState + 3);
      v80 = (_BYTE *)a4;
      __asm { BR              X10 }
    }
    v59 = sub_247CEF580();
    v60 = sub_247CEF6DC();
    if (os_log_type_enabled(v59, v60))
    {
      v76 = v15;
      v61 = (uint8_t *)swift_slowAlloc();
      v62 = swift_slowAlloc();
      v77 = v14;
      v63 = (_QWORD *)v62;
      *(_DWORD *)v61 = 138412290;
      sub_247CCCF78();
      swift_allocError();
      *v64 = 1;
      v65 = v18;
      v66 = _swift_stdlib_bridgeErrorToNSError();
      v82 = v66;
      v15 = v76;
      sub_247CEF748();
      *v63 = v66;
      v18 = v65;
      _os_log_impl(&dword_247CAF000, v59, v60, "Failed to start pair setup session due to error: %@", v61, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
      swift_arrayDestroy();
      v67 = v63;
      v14 = v77;
      MEMORY[0x249590A5C](v67, -1, -1);
      MEMORY[0x249590A5C](v61, -1, -1);
    }

    sub_247CCCF78();
    v68 = (void *)swift_allocError();
    *v69 = 1;
    v70 = (void *)sub_247CEF4CC();
    (*(void (**)(uint64_t, void *, _QWORD))(a4 + 16))(a4, v70, 0);

    (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v18, v14);
  }
  else
  {
    v39 = sub_247CEF580();
    v40 = sub_247CEF6DC();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      v42 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v41 = 138412290;
      sub_247CCCF78();
      swift_allocError();
      *v43 = 0;
      v44 = _swift_stdlib_bridgeErrorToNSError();
      v82 = v44;
      sub_247CEF748();
      *v42 = v44;
      _os_log_impl(&dword_247CAF000, v39, v40, "Failed to start pair setup session due to no available SFSession: %@", v41, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v42, -1, -1);
      MEMORY[0x249590A5C](v41, -1, -1);
    }

    sub_247CCCF78();
    v45 = (void *)swift_allocError();
    *v46 = 0;
    v47 = (void *)sub_247CEF4CC();
    (*(void (**)(uint64_t, void *, _QWORD))(a4 + 16))(a4, v47, 0);

  }
}

void sub_247CCE4D4(int a1, uint64_t a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (**v13)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  void *v38;
  _QWORD *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  void *v48;
  _QWORD *v49;
  void *v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  _QWORD *v56;
  _QWORD *v57;
  char *v58;
  uint64_t v59;
  _QWORD *v60;
  void *v61;
  _QWORD *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  char *v67;
  uint64_t v68;
  void (**v69)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;

  v66 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  v7 = MEMORY[0x24BDAC7A8](v5, v6);
  v69 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v64 - v10;
  v12 = sub_247CEF550();
  v13 = *(void (***)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 - 8);
  MEMORY[0x24BDAC7A8](v12, v14);
  v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(swift_allocObject() + 16) = a3;
  _Block_copy(a3);
  if (qword_2576F1D00 != -1)
    swift_once();
  v17 = sub_247CEF598();
  v68 = __swift_project_value_buffer(v17, (uint64_t)qword_2576F49E8);
  v18 = sub_247CEF580();
  v19 = sub_247CEF6E8();
  v20 = os_log_type_enabled(v18, v19);
  v67 = v11;
  if (v20)
  {
    v21 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    v65 = v12;
    v23 = v22;
    v71 = v22;
    *(_DWORD *)v21 = 136446466;
    v70 = sub_247CB5D84(0xD00000000000002BLL, 0x8000000247CF2E80, &v71);
    sub_247CEF748();
    *(_WORD *)(v21 + 12) = 1024;
    LODWORD(v70) = v66 & 1;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v18, v19, "%{public}s invoked with reset flag: %{BOOL}d", (uint8_t *)v21, 0x12u);
    swift_arrayDestroy();
    v24 = v23;
    v12 = v65;
    MEMORY[0x249590A5C](v24, -1, -1);
    MEMORY[0x249590A5C](v21, -1, -1);
  }

  v25 = *(void **)(a2 + OBJC_IVAR___WFSetupServerInternal_sfSession);
  v26 = (uint64_t)v69;
  if (!v25)
  {
    v32 = sub_247CEF580();
    v33 = sub_247CEF6DC();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v34 = 138412290;
      sub_247CCCF78();
      swift_allocError();
      *v36 = 0;
      v37 = _swift_stdlib_bridgeErrorToNSError();
      v71 = v37;
      sub_247CEF748();
      *v35 = v37;
      _os_log_impl(&dword_247CAF000, v32, v33, "Failed to start pair setup session due to no available SFSession: %@", v34, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v35, -1, -1);
      MEMORY[0x249590A5C](v34, -1, -1);
    }

    sub_247CCCF78();
    v38 = (void *)swift_allocError();
    *v39 = 0;
    v40 = (void *)sub_247CEF4CC();
    ((void (**)(_QWORD, void *, _QWORD))a3)[2](a3, v40, 0);

    goto LABEL_23;
  }
  v27 = v25;
  v28 = objc_msgSend(v27, sel_peerDevice);
  if (v28)
  {
    v29 = v28;
    v30 = objc_msgSend(v28, sel_identifier);

    if (v30)
    {
      sub_247CEF544();

      v31 = 0;
    }
    else
    {
      v31 = 1;
    }
    v41 = (uint64_t)v67;
    v13[7](v26, v31, 1, v12);
    sub_247CCD854(v26, v41, &qword_2576F2728);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v13[6])(v41, 1, v12) == 1)
      goto LABEL_15;
    ((void (*)(char *, uint64_t, uint64_t))v13[4])(v16, v41, v12);
    if (*(_QWORD *)(a2 + OBJC_IVAR___WFSetupServerInternal_sfService))
    {
      v65 = a2;
      v51 = *(unsigned __int8 *)(a2 + OBJC_IVAR___WFSetupServerInternal_serverState + 3);
      v67 = v16;
      v69 = v13;
      __asm { BR              X10 }
    }
    v52 = sub_247CEF580();
    v53 = sub_247CEF6DC();
    if (os_log_type_enabled(v52, v53))
    {
      v65 = v12;
      v54 = (uint8_t *)swift_slowAlloc();
      v55 = swift_slowAlloc();
      v68 = (uint64_t)a3;
      v56 = (_QWORD *)v55;
      v69 = v13;
      *(_DWORD *)v54 = 138412290;
      sub_247CCCF78();
      swift_allocError();
      *v57 = 1;
      v58 = v16;
      v59 = _swift_stdlib_bridgeErrorToNSError();
      v71 = v59;
      v12 = v65;
      v13 = v69;
      sub_247CEF748();
      *v56 = v59;
      v16 = v58;
      _os_log_impl(&dword_247CAF000, v52, v53, "Failed to start pair setup session due to error: %@", v54, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
      swift_arrayDestroy();
      v60 = v56;
      a3 = (void (**)(_QWORD, _QWORD, _QWORD))v68;
      MEMORY[0x249590A5C](v60, -1, -1);
      MEMORY[0x249590A5C](v54, -1, -1);
    }

    sub_247CCCF78();
    v61 = (void *)swift_allocError();
    *v62 = 1;
    v63 = (void *)sub_247CEF4CC();
    ((void (**)(_QWORD, void *, _QWORD))a3)[2](a3, v63, 0);

    ((void (*)(char *, uint64_t))v13[1])(v16, v12);
LABEL_23:
    swift_release();
    return;
  }
  v41 = (uint64_t)v67;
  v13[7]((uint64_t)v67, 1, 1, v12);
LABEL_15:
  sub_247CBCE98(v41, &qword_2576F2728);
  v42 = sub_247CEF580();
  v43 = sub_247CEF6DC();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc();
    v45 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v44 = 138412290;
    sub_247CCCF78();
    swift_allocError();
    *v46 = 4;
    v47 = _swift_stdlib_bridgeErrorToNSError();
    v71 = v47;
    sub_247CEF748();
    *v45 = v47;
    _os_log_impl(&dword_247CAF000, v42, v43, "Failed to start pair setup session due to error: %@", v44, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v45, -1, -1);
    MEMORY[0x249590A5C](v44, -1, -1);
  }

  sub_247CCCF78();
  v48 = (void *)swift_allocError();
  *v49 = 4;
  v50 = (void *)sub_247CEF4CC();
  ((void (**)(_QWORD, void *, _QWORD))a3)[2](a3, v50, 0);

  swift_release();
}

uint64_t sub_247CCF0F4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

void sub_247CCF128(uint64_t a1, unint64_t a2, const char *a3)
{
  uint64_t v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  NSObject *oslog;
  uint64_t v11;

  if (qword_2576F1D00 != -1)
    swift_once();
  v6 = sub_247CEF598();
  __swift_project_value_buffer(v6, (uint64_t)qword_2576F49E8);
  oslog = sub_247CEF580();
  v7 = sub_247CEF6E8();
  if (os_log_type_enabled(oslog, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v11 = v9;
    *(_DWORD *)v8 = 136446210;
    sub_247CB5D84(a1, a2, &v11);
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, oslog, v7, a3, v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v9, -1, -1);
    MEMORY[0x249590A5C](v8, -1, -1);

  }
  else
  {

  }
}

void sub_247CCF2B4(uint64_t a1, void (*a2)(_QWORD, _QWORD, unint64_t))
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  unsigned int v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v29[2];
  __int128 v30;
  uint64_t v31;
  uint64_t v32[5];

  if (qword_2576F1D00 != -1)
    swift_once();
  v2 = sub_247CEF598();
  __swift_project_value_buffer(v2, (uint64_t)qword_2576F49E8);
  swift_bridgeObjectRetain_n();
  v3 = sub_247CEF580();
  v4 = sub_247CEF6E8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v32[0] = v6;
    *(_DWORD *)v5 = 136446210;
    swift_bridgeObjectRetain();
    v7 = sub_247CEF628();
    v9 = v8;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v30 = sub_247CB5D84(v7, v9, v32);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v3, v4, "Handle setup action request: %{public}s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v6, -1, -1);
    MEMORY[0x249590A5C](v5, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v10 = sub_247CC0084(MEMORY[0x24BEE4AF8]);
  v11 = (void *)sub_247CEF604();
  v12 = (void *)sub_247CEF64C();
  v13 = (id)NSDictionaryGetNSNumber();

  if (v13)
  {
    v14 = sub_247CEF934();

    v15 = sub_247CEF580();
    v16 = sub_247CEF6E8();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v32[0] = v18;
      *(_DWORD *)v17 = 136446210;
      SFSetupActionToString(v14);
      v19 = sub_247CEF688();
      *(_QWORD *)&v30 = sub_247CB5D84(v19, v20, v32);
      sub_247CEF748();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v15, v16, "SendActionRequest %{public}s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v18, -1, -1);
      MEMORY[0x249590A5C](v17, -1, -1);
    }

    if (v14 == 7)
    {
      sub_247CCF128(0xD000000000000019, 0x8000000247CF3480, "FIXME: %{public}s");
    }
    else if (v14 == 6)
    {
      sub_247CCF128(0xD00000000000001ALL, 0x8000000247CF3460, "FIXME: %{public}s");
    }
    else
    {
      v21 = sub_247CEF580();
      v22 = sub_247CEF6E8();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        v24 = swift_slowAlloc();
        v32[0] = v24;
        *(_DWORD *)v23 = 136446210;
        SFSetupActionToString(v14);
        v25 = sub_247CEF688();
        *(_QWORD *)&v30 = sub_247CB5D84(v25, v26, v32);
        sub_247CEF748();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247CAF000, v21, v22, "Unsupported sendAction: %{public}s", v23, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v24, -1, -1);
        MEMORY[0x249590A5C](v23, -1, -1);
      }

      *((_QWORD *)&v30 + 1) = 0xE200000000000000;
      sub_247CEF790();
      v31 = MEMORY[0x24BEE3F88];
      *(_QWORD *)&v30 = 4294960589;
      sub_247CCCFBC(&v30, v29);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_247CCD1BC(v29, (uint64_t)v32, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      sub_247CCF0F4((uint64_t)v32);
    }
    a2(0, 0, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

__CFString *WFSetupClientUserInteractionProgressEventToString(unint64_t a1)
{
  __CFString *v1;
  __CFString *v2;

  if (a1 <= 5)
  {
    v1 = off_25194D688[a1];
    v2 = off_25194D658[a1];
  }
  return v1;
}

__CFString *WFSetupProgressEventToString(unint64_t a1)
{
  __CFString *v1;
  __CFString *v2;

  if (a1 <= 0xF)
  {
    v1 = off_25194D738[a1];
    v2 = off_25194D6B8[a1];
  }
  return v1;
}

uint64_t sub_247CCF898()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_247CCF8BC(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, _QWORD, unint64_t), uint64_t a4)
{
  uint64_t v4;

  sub_247CCA194(a1, a2, a3, a4, v4);
}

void sub_247CCF8C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_247CCA204(a1, a2, a3, a4, v4, (void (*)(uint64_t, uint64_t, uint64_t))sub_247CCBF0C);
}

void sub_247CCF8E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_247CCA204(a1, a2, a3, a4, v4, (void (*)(uint64_t, uint64_t, uint64_t))sub_247CCA72C);
}

uint64_t sub_247CCF904()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_247CCF930(void *a1)
{
  uint64_t v1;

  sub_247CCA284(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

unint64_t sub_247CCF938()
{
  unint64_t result;

  result = qword_2576F2818;
  if (!qword_2576F2818)
  {
    result = MEMORY[0x2495909F0](&unk_247CF1668, &type metadata for DisconnectedProximitySetupServerAnalyticsEvent);
    atomic_store(result, (unint64_t *)&qword_2576F2818);
  }
  return result;
}

uint64_t sub_247CCF97C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

const char *SFSetupActionToString(unsigned int a1)
{
  if (a1 > 0xA)
    return "?";
  else
    return off_25194D600[a1];
}

uint64_t sub_247CCF9D4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2495909F0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_247CCFA14()
{
  uint64_t v0;

  sub_247CC60AC(v0);
}

void sub_247CCFA1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_247CC6450(a1, a2, v2);
}

void sub_247CCFA24(void *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;

  sub_247CC64BC(a1, a2, a3, v3);
}

void sub_247CCFA2C(void *a1)
{
  uint64_t v1;

  sub_247CC65CC(a1, v1);
}

void sub_247CCFA34(void *a1, void *a2)
{
  uint64_t v2;

  sub_247CC7114(a1, a2, v2);
}

void sub_247CCFA3C(void *a1)
{
  uint64_t v1;

  sub_247CC793C(a1, *(_QWORD *)(v1 + 16));
}

void sub_247CCFA44(void *a1)
{
  uint64_t v1;

  sub_247CC7CF8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_247CCFA4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_247CCFA94()
{
  swift_release();
  return swift_deallocObject();
}

void sub_247CCFAB8()
{
  uint64_t v0;

  sub_247CC5840(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_247CCFAC0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_247CCFAE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_247CC2138(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_247CCFAEC()
{
  swift_release();
  return swift_deallocObject();
}

void sub_247CCFB10(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;

  sub_247CD17B8(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

void sub_247CCFB18(uint64_t a1)
{
  uint64_t v1;

  sub_247CD175C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_247CCFB20()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_247CCFB34()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_247CCFB44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_247CD1684(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_247CCFB4C(uint64_t a1)
{
  uint64_t v1;

  sub_247CD15C4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_247CCFB54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t *, uint64_t *, uint64_t *);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(uint64_t (**)(uint64_t *, uint64_t *, uint64_t *))(v3 + 16);
  v7 = a2;
  v8 = a1;
  v6 = a3;
  return v4(&v8, &v7, &v6);
}

uint64_t sub_247CCFB90(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v3 + 16))(*a1, *a2, *a3);
}

uint64_t sub_247CCFBBC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247CCFC00()
{
  return swift_release();
}

uint64_t getEnumTagSinglePayload for WFSetupServer.WFSetupServerState.SecureSessionPairingState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WFSetupServer.WFSetupServerState.SecureSessionPairingState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_247CCFCE4 + 4 * byte_247CF10E5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_247CCFD18 + 4 * byte_247CF10E0[v4]))();
}

uint64_t sub_247CCFD18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CCFD20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247CCFD28);
  return result;
}

uint64_t sub_247CCFD34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247CCFD3CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_247CCFD40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CCFD48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WFSetupServer.WFSetupServerState.SecureSessionPairingState()
{
  return &type metadata for WFSetupServer.WFSetupServerState.SecureSessionPairingState;
}

uint64_t getEnumTagSinglePayload for WFSetupServer.WFSetupServerState.InvalidationState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for WFSetupServer.WFSetupServerState.InvalidationState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_247CCFE40 + 4 * byte_247CF10EF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_247CCFE74 + 4 * byte_247CF10EA[v4]))();
}

uint64_t sub_247CCFE74(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CCFE7C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247CCFE84);
  return result;
}

uint64_t sub_247CCFE90(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247CCFE98);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_247CCFE9C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CCFEA4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WFSetupServer.WFSetupServerState.InvalidationState()
{
  return &type metadata for WFSetupServer.WFSetupServerState.InvalidationState;
}

unint64_t sub_247CCFEC4()
{
  unint64_t result;

  result = qword_2576F2860;
  if (!qword_2576F2860)
  {
    result = MEMORY[0x2495909F0](&unk_247CF1434, &type metadata for WFSetupServer.WFSetupServerState.InvalidationState);
    atomic_store(result, (unint64_t *)&qword_2576F2860);
  }
  return result;
}

unint64_t sub_247CCFF0C()
{
  unint64_t result;

  result = qword_2576F2868;
  if (!qword_2576F2868)
  {
    result = MEMORY[0x2495909F0](&unk_247CF14FC, &type metadata for WFSetupServer.WFSetupServerState.SecureSessionPairingState);
    atomic_store(result, (unint64_t *)&qword_2576F2868);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DisconnectedProximitySetupServerAnalyticsEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DisconnectedProximitySetupServerAnalyticsEvent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for DisconnectedProximitySetupServerAnalyticsEvent(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for DisconnectedProximitySetupServerAnalyticsEvent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for DisconnectedProximitySetupServerAnalyticsEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DisconnectedProximitySetupServerAnalyticsEvent(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DisconnectedProximitySetupServerAnalyticsEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DisconnectedProximitySetupServerAnalyticsEvent()
{
  return &type metadata for DisconnectedProximitySetupServerAnalyticsEvent;
}

uint64_t sub_247CD02CC(char a1)
{
  if (!a1)
    return 1701667182;
  if (a1 == 1)
    return 0xD000000000000011;
  return 0x64616F6C796170;
}

BOOL sub_247CD0320(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_247CD0334()
{
  sub_247CEF910();
  sub_247CEF91C();
  return sub_247CEF928();
}

uint64_t sub_247CD0378()
{
  return sub_247CEF91C();
}

uint64_t sub_247CD03A0()
{
  sub_247CEF910();
  sub_247CEF91C();
  return sub_247CEF928();
}

uint64_t sub_247CD03E0()
{
  char *v0;

  return sub_247CD02CC(*v0);
}

uint64_t sub_247CD03E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_247CD08D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247CD040C()
{
  return 0;
}

void sub_247CD0418(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_247CD0424()
{
  sub_247CD06E8();
  return sub_247CEF94C();
}

uint64_t sub_247CD044C()
{
  sub_247CD06E8();
  return sub_247CEF958();
}

uint64_t sub_247CD0474(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE v11[16];
  uint64_t v12;
  char v13;
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F28C0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_247CD06E8();
  sub_247CEF940();
  v14 = 0;
  sub_247CEF85C();
  if (!v2)
  {
    v13 = 1;
    sub_247CEF85C();
    v12 = *(_QWORD *)(v3 + 32);
    v11[15] = 2;
    __swift_instantiateConcreteTypeFromMangledName(qword_2576F2878);
    sub_247CD0624();
    sub_247CEF868();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_247CD05D4()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_247CD0600@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 32);
  return swift_bridgeObjectRetain();
}

uint64_t sub_247CD060C(_QWORD *a1)
{
  return sub_247CD0474(a1);
}

unint64_t sub_247CD0624()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2576F2870;
  if (!qword_2576F2870)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_2576F2878);
    v2[0] = MEMORY[0x24BEE0D08];
    v2[1] = MEMORY[0x24BEE0D08];
    result = MEMORY[0x2495909F0](MEMORY[0x24BEE04C0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2576F2870);
  }
  return result;
}

unint64_t sub_247CD0680(uint64_t a1)
{
  unint64_t result;

  result = sub_247CD06A4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_247CD06A4()
{
  unint64_t result;

  result = qword_2576F28B8;
  if (!qword_2576F28B8)
  {
    result = MEMORY[0x2495909F0](&unk_247CF1640, &type metadata for DisconnectedProximitySetupServerAnalyticsEvent);
    atomic_store(result, (unint64_t *)&qword_2576F28B8);
  }
  return result;
}

unint64_t sub_247CD06E8()
{
  unint64_t result;

  result = qword_2576F28C8;
  if (!qword_2576F28C8)
  {
    result = MEMORY[0x2495909F0](&unk_247CF1748, &type metadata for DisconnectedProximitySetupServerAnalyticsEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576F28C8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DisconnectedProximitySetupServerAnalyticsEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_247CD0778 + 4 * byte_247CF15F5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_247CD07AC + 4 * byte_247CF15F0[v4]))();
}

uint64_t sub_247CD07AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CD07B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247CD07BCLL);
  return result;
}

uint64_t sub_247CD07C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247CD07D0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_247CD07D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CD07DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DisconnectedProximitySetupServerAnalyticsEvent.CodingKeys()
{
  return &type metadata for DisconnectedProximitySetupServerAnalyticsEvent.CodingKeys;
}

unint64_t sub_247CD07FC()
{
  unint64_t result;

  result = qword_2576F28D0;
  if (!qword_2576F28D0)
  {
    result = MEMORY[0x2495909F0](&unk_247CF1720, &type metadata for DisconnectedProximitySetupServerAnalyticsEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576F28D0);
  }
  return result;
}

unint64_t sub_247CD0844()
{
  unint64_t result;

  result = qword_2576F28D8;
  if (!qword_2576F28D8)
  {
    result = MEMORY[0x2495909F0](&unk_247CF1690, &type metadata for DisconnectedProximitySetupServerAnalyticsEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576F28D8);
  }
  return result;
}

unint64_t sub_247CD088C()
{
  unint64_t result;

  result = qword_2576F28E0;
  if (!qword_2576F28E0)
  {
    result = MEMORY[0x2495909F0](&unk_247CF16B8, &type metadata for DisconnectedProximitySetupServerAnalyticsEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576F28E0);
  }
  return result;
}

uint64_t sub_247CD08D0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v3 || (sub_247CEF88C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000247CF3890 || (sub_247CEF88C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64616F6C796170 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_247CEF88C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

void WFSetupClient.provisionAnisette(completion:)(uint64_t a1, uint64_t a2)
{
  sub_247CD0F14(a1, a2, (uint64_t)sub_247CD1974, (uint64_t)&block_descriptor_27, (SEL *)&selRef_provisionWithCompletion_);
}

void WFSetupClient.eraseAnisette(completion:)(uint64_t a1, uint64_t a2)
{
  sub_247CD0F14(a1, a2, (uint64_t)sub_247CD1974, (uint64_t)&block_descriptor_21, (SEL *)&selRef_eraseWithCompletion_);
}

void WFSetupClient.fetchAnisetteDataAndProvisionIfNecessary(_:withCompletion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_247CD0F14(a2, a3, (uint64_t)sub_247CDA3F0, (uint64_t)&block_descriptor_18, (SEL *)&selRef_anisetteDataWithCompletion_);
}

void _s10TDGSharing13WFSetupClientC12syncAnisette11withSIMData10completiony10Foundation4DataVSg_ySb_s5Error_pSgtcSgtF_0(uint64_t a1, unint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  void *v8;
  _QWORD v9[6];

  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0ACB0]), sel_init);
  if (a2 >> 60 == 15)
  {
    v8 = 0;
    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  v8 = (void *)sub_247CEF4F0();
  if (a3)
  {
LABEL_5:
    v9[4] = a3;
    v9[5] = a4;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 1107296256;
    v9[2] = sub_247CD1974;
    v9[3] = &block_descriptor_24;
    a3 = _Block_copy(v9);
    swift_retain();
    swift_release();
  }
LABEL_6:
  objc_msgSend(v7, sel_syncWithSIMData_completion_, v8, a3);
  _Block_release(a3);

}

void sub_247CD0F14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  id v10;
  void *v11;
  _QWORD v12[6];

  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0ACB0]), sel_init);
  if (a1)
  {
    v12[4] = a1;
    v12[5] = a2;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 1107296256;
    v12[2] = a3;
    v12[3] = a4;
    v11 = _Block_copy(v12);
    swift_retain();
    swift_release();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v10, *a5, v11);
  _Block_release(v11);

}

void _s10TDGSharing13WFSetupClientC18legacyAnisetteData7forDSID14withCompletionySSSg_ySo010AKAnisetteF0CSg_s5Error_pSgtcSgtF_0(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  _QWORD v8[6];

  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0ACB0]), sel_init);
  if (a2)
    a2 = (void *)sub_247CEF64C();
  if (a3)
  {
    v8[4] = a3;
    v8[5] = a4;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1107296256;
    v8[2] = sub_247CDA3F0;
    v8[3] = &block_descriptor_0;
    a3 = _Block_copy(v8);
    swift_retain();
    swift_release();
  }
  objc_msgSend(v7, sel_legacyAnisetteDataForDSID_withCompletion_, a2, a3);
  _Block_release(a3);

}

uint64_t sub_247CD10C8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_247CD10EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_247CE59B8(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_247CD10F4(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_247CE5960(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for DisconnectedProximitySetupClientAnalyticsEvent()
{
  return &type metadata for DisconnectedProximitySetupClientAnalyticsEvent;
}

uint64_t sub_247CD115C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE v11[16];
  uint64_t v12;
  char v13;
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F29F0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_247CD1388();
  sub_247CEF940();
  v14 = 0;
  sub_247CEF85C();
  if (!v2)
  {
    v13 = 1;
    sub_247CEF85C();
    v12 = *(_QWORD *)(v3 + 32);
    v11[15] = 2;
    __swift_instantiateConcreteTypeFromMangledName(qword_2576F2878);
    sub_247CD0624();
    sub_247CEF868();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_247CD12BC()
{
  sub_247CD1388();
  return sub_247CEF94C();
}

uint64_t sub_247CD12E4()
{
  sub_247CD1388();
  return sub_247CEF958();
}

uint64_t sub_247CD130C(_QWORD *a1)
{
  return sub_247CD115C(a1);
}

unint64_t sub_247CD1320(uint64_t a1)
{
  unint64_t result;

  result = sub_247CD1344();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_247CD1344()
{
  unint64_t result;

  result = qword_2576F29E8;
  if (!qword_2576F29E8)
  {
    result = MEMORY[0x2495909F0](&unk_247CF17F0, &type metadata for DisconnectedProximitySetupClientAnalyticsEvent);
    atomic_store(result, (unint64_t *)&qword_2576F29E8);
  }
  return result;
}

unint64_t sub_247CD1388()
{
  unint64_t result;

  result = qword_2576F29F8;
  if (!qword_2576F29F8)
  {
    result = MEMORY[0x2495909F0](&unk_247CF18F8, &type metadata for DisconnectedProximitySetupClientAnalyticsEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576F29F8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DisconnectedProximitySetupClientAnalyticsEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_247CD1418 + 4 * byte_247CF17A5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_247CD144C + 4 * byte_247CF17A0[v4]))();
}

uint64_t sub_247CD144C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CD1454(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247CD145CLL);
  return result;
}

uint64_t sub_247CD1468(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247CD1470);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_247CD1474(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CD147C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DisconnectedProximitySetupClientAnalyticsEvent.CodingKeys()
{
  return &type metadata for DisconnectedProximitySetupClientAnalyticsEvent.CodingKeys;
}

unint64_t sub_247CD149C()
{
  unint64_t result;

  result = qword_2576F2A00;
  if (!qword_2576F2A00)
  {
    result = MEMORY[0x2495909F0](&unk_247CF18D0, &type metadata for DisconnectedProximitySetupClientAnalyticsEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576F2A00);
  }
  return result;
}

unint64_t sub_247CD14E4()
{
  unint64_t result;

  result = qword_2576F2A08;
  if (!qword_2576F2A08)
  {
    result = MEMORY[0x2495909F0](&unk_247CF1840, &type metadata for DisconnectedProximitySetupClientAnalyticsEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576F2A08);
  }
  return result;
}

unint64_t sub_247CD152C()
{
  unint64_t result;

  result = qword_2576F2A10;
  if (!qword_2576F2A10)
  {
    result = MEMORY[0x2495909F0](&unk_247CF1868, &type metadata for DisconnectedProximitySetupClientAnalyticsEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576F2A10);
  }
  return result;
}

void sub_247CD1570(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_247CD15C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_247CEF4CC();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t sub_247CD1610(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;

  v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v4 = sub_247CEF61C();
  swift_retain();
  v3(a2, v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_247CD1684(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;

  v5 = (id)sub_247CEF604();
  (*(void (**)(uint64_t, uint64_t, id))(a3 + 16))(a3, a1, v5);

}

uint64_t sub_247CD16F0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = sub_247CEF61C();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_247CD175C(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)sub_247CEF604();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);

}

void sub_247CD17B8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;
  id v9;

  if (a1)
    v7 = (void *)sub_247CEF4CC();
  else
    v7 = 0;
  if (a2)
    a2 = (void *)sub_247CEF604();
  if (a3)
    v8 = sub_247CEF604();
  else
    v8 = 0;
  v9 = (id)v8;
  (*(void (**)(uint64_t, void *, void *))(a4 + 16))(a4, v7, a2);

}

uint64_t sub_247CD1884(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  void (*v5)(uint64_t, uint64_t, void (*)(uint64_t, void *, uint64_t), uint64_t);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v5 = *(void (**)(uint64_t, uint64_t, void (*)(uint64_t, void *, uint64_t), uint64_t))(a1 + 32);
  if (a2)
    v6 = sub_247CEF61C();
  else
    v6 = 0;
  v7 = sub_247CEF61C();
  v8 = _Block_copy(a4);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  swift_retain();
  v5(v6, v7, sub_247CCFB10, v9);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_247CD1974(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

id WFSetupClient.dispatchQueue.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
  swift_beginAccess();
  return *v1;
}

void WFSetupClient.dispatchQueue.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*WFSetupClient.dispatchQueue.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WFSetupClient.interruptionHandler.getter()
{
  return sub_247CBDCE4(&OBJC_IVAR___WFSetupClientInternal_interruptionHandler, (void (*)(_QWORD, _QWORD))sub_247CBDD44);
}

uint64_t WFSetupClient.interruptionHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_247CBDDFC(a1, a2, &OBJC_IVAR___WFSetupClientInternal_interruptionHandler, (uint64_t (*)(uint64_t, uint64_t))sub_247CBDE58);
}

uint64_t (*WFSetupClient.interruptionHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WFSetupClient.invalidationHandler.getter()
{
  return sub_247CBDCE4(&OBJC_IVAR___WFSetupClientInternal_invalidationHandler, (void (*)(_QWORD, _QWORD))sub_247CBDD44);
}

uint64_t WFSetupClient.invalidationHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_247CBDDFC(a1, a2, &OBJC_IVAR___WFSetupClientInternal_invalidationHandler, (uint64_t (*)(uint64_t, uint64_t))sub_247CBDE58);
}

uint64_t (*WFSetupClient.invalidationHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *WFSetupClient.peerDevice.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___WFSetupClientInternal_peerDevice);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void WFSetupClient.peerDevice.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR___WFSetupClientInternal_peerDevice);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*WFSetupClient.peerDevice.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_247CD1E8C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id *v3;

  v3 = (id *)(a1 + *a3);
  swift_beginAccess();
  return *v3;
}

void *WFSetupClient.messageSessionTemplate.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___WFSetupClientInternal_messageSessionTemplate);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_247CD1F28(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  void **v5;
  void *v6;
  id v7;

  v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;

}

void sub_247CD1F80(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___WFSetupClientInternal_messageSessionTemplate);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t WFSetupClient.setupProgressEventHandler.getter()
{
  return sub_247CBDCE4(&OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler, (void (*)(_QWORD, _QWORD))sub_247CCFF58);
}

uint64_t WFSetupClient.setupProgressEventHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_247CBDDFC(a1, a2, &OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler, (uint64_t (*)(uint64_t, uint64_t))sub_247CCFF5C);
}

uint64_t (*WFSetupClient.setupProgressEventHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WFSetupClient.userInteractionProgressEventHandler.getter()
{
  return sub_247CBDCE4(&OBJC_IVAR___WFSetupClientInternal_userInteractionProgressEventHandler, (void (*)(_QWORD, _QWORD))sub_247CCFF58);
}

uint64_t WFSetupClient.userInteractionProgressEventHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_247CBDDFC(a1, a2, &OBJC_IVAR___WFSetupClientInternal_userInteractionProgressEventHandler, (uint64_t (*)(uint64_t, uint64_t))sub_247CCFF5C);
}

uint64_t (*WFSetupClient.userInteractionProgressEventHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WFSetupClient.setupSecurePairingCompletionHandler.getter()
{
  return sub_247CBDCE4(&OBJC_IVAR___WFSetupClientInternal_setupSecurePairingCompletionHandler, (void (*)(_QWORD, _QWORD))sub_247CCFF58);
}

uint64_t WFSetupClient.setupSecurePairingCompletionHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_247CBDDFC(a1, a2, &OBJC_IVAR___WFSetupClientInternal_setupSecurePairingCompletionHandler, (uint64_t (*)(uint64_t, uint64_t))sub_247CCFF5C);
}

uint64_t (*WFSetupClient.setupSecurePairingCompletionHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WFSetupClient.receivedObjectHandler.getter()
{
  return sub_247CBDCE4(&OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler, (void (*)(_QWORD, _QWORD))sub_247CBDD44);
}

uint64_t WFSetupClient.receivedObjectHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_247CBDDFC(a1, a2, &OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler, (uint64_t (*)(uint64_t, uint64_t))sub_247CBDE58);
}

uint64_t (*WFSetupClient.receivedObjectHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t WFSetupClient.showPinHandler.getter()
{
  return sub_247CBDCE4(&OBJC_IVAR___WFSetupClientInternal_showPinHandler, (void (*)(_QWORD, _QWORD))sub_247CCFF58);
}

uint64_t sub_247CD2480(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  v4 = sub_247CEF658();
  v6 = v5;
  swift_retain();
  v3(a2, v4, v6);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t WFSetupClient.showPinHandler.setter(uint64_t a1, uint64_t a2)
{
  return sub_247CBDDFC(a1, a2, &OBJC_IVAR___WFSetupClientInternal_showPinHandler, (uint64_t (*)(uint64_t, uint64_t))sub_247CCFF5C);
}

uint64_t (*WFSetupClient.showPinHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_247CD25D0()
{
  sub_247CEF79C();
  sub_247CEF67C();
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  sub_247CEF67C();
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  sub_247CEF67C();
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  sub_247CEF67C();
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  sub_247CEF67C();
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  sub_247CEF67C();
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  sub_247CEF67C();
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  sub_247CEF67C();
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_247CD28A4(char a1)
{
  if (!a1)
    return 0x6974696E49746F6ELL;
  if (a1 == 1)
    return 0xD000000000000012;
  return 0xD000000000000017;
}

uint64_t sub_247CD2910()
{
  char *v0;

  return sub_247CD28A4(*v0);
}

uint64_t sub_247CD2918(char a1)
{
  return *(_QWORD *)&aNotinitiinprog[8 * a1];
}

uint64_t sub_247CD2938()
{
  char *v0;

  return sub_247CD2918(*v0);
}

uint64_t sub_247CD2940()
{
  return sub_247CD25D0();
}

id WFSetupClient.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id WFSetupClient.init()()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  v1 = v0;
  sub_247CBBA5C(0, (unint64_t *)&qword_2576F1D40);
  v2 = (void *)sub_247CEF70C();
  v3 = objc_msgSend(v1, sel_initWithQueue_deviceIdentifier_, v2, 0);

  return v3;
}

void *WFSetupClient.__allocating_init(queue:deviceIdentifier:)(void *a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return WFSetupClient.init(queue:deviceIdentifier:)(a1, a2, a3);
}

void *WFSetupClient.init(queue:deviceIdentifier:)(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  id v22;
  objc_class *v23;
  id v24;
  void *v25;
  id v26;
  char *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id *v32;
  id v33;
  id v34;
  uint64_t v35;
  char *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  objc_super v58;
  _BYTE v59[24];
  ValueMetadata *v60;
  _UNKNOWN **v61;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = &v3[OBJC_IVAR___WFSetupClientInternal_interruptionHandler];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v11 = &v3[OBJC_IVAR___WFSetupClientInternal_invalidationHandler];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *(_QWORD *)&v3[OBJC_IVAR___WFSetupClientInternal_peerDevice] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___WFSetupClientInternal_messageSessionTemplate] = 0;
  v12 = &v3[OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler];
  *(_QWORD *)v12 = 0;
  *((_QWORD *)v12 + 1) = 0;
  v13 = &v3[OBJC_IVAR___WFSetupClientInternal_userInteractionProgressEventHandler];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v14 = &v3[OBJC_IVAR___WFSetupClientInternal_setupSecurePairingCompletionHandler];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v15 = &v3[OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v16 = &v3[OBJC_IVAR___WFSetupClientInternal_showPinHandler];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  *(_QWORD *)&v3[OBJC_IVAR___WFSetupClientInternal_clientState] = 0;
  v17 = OBJC_IVAR___WFSetupClientInternal_analyticsManager;
  v60 = &type metadata for CoreAnalyticsBackend;
  v61 = &off_25194C828;
  type metadata accessor for AnalyticsManager();
  v18 = swift_allocObject();
  v19 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v59, (uint64_t)&type metadata for CoreAnalyticsBackend);
  MEMORY[0x24BDAC7A8](v19, v19);
  (*(void (**)(void))(v20 + 16))();
  *(_QWORD *)(v18 + 40) = &type metadata for CoreAnalyticsBackend;
  *(_QWORD *)(v18 + 48) = &off_25194C828;
  v21 = v3;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
  *(_QWORD *)&v3[v17] = v18;
  *(_QWORD *)&v21[OBJC_IVAR___WFSetupClientInternal_sfSession] = 0;
  *(_QWORD *)&v21[OBJC_IVAR___WFSetupClientInternal_dispatchQueue] = a1;
  v22 = a1;

  v23 = (objc_class *)type metadata accessor for WFSetupClient();
  v58.receiver = v21;
  v58.super_class = v23;
  v24 = objc_msgSendSuper2(&v58, sel_init);
  v25 = v24;
  if (!a3)
  {
    v45 = qword_2576F1D08;
    v34 = v24;
    if (v45 != -1)
      swift_once();
    v46 = sub_247CEF598();
    __swift_project_value_buffer(v46, (uint64_t)qword_2576F4A00);
    v47 = sub_247CEF580();
    v48 = sub_247CEF6DC();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_247CAF000, v47, v48, "deviceIdentifier provided was nil", v49, 2u);
      MEMORY[0x249590A5C](v49, -1, -1);
    }

    goto LABEL_15;
  }
  v26 = objc_allocWithZone(MEMORY[0x24BE90108]);
  v27 = v25;
  v28 = objc_msgSend(v26, sel_init);
  sub_247CEF514();
  swift_bridgeObjectRelease();
  v29 = sub_247CEF550();
  v30 = *(_QWORD *)(v29 - 8);
  v31 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v9, 1, v29) != 1)
  {
    v31 = (void *)sub_247CEF538();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v29);
  }
  objc_msgSend(v28, sel_setIdentifier_, v31);

  v32 = (id *)&v27[OBJC_IVAR___WFSetupClientInternal_peerDevice];
  swift_beginAccess();
  v33 = *v32;
  *v32 = v28;
  v34 = v28;

  if (qword_2576F1D08 != -1)
    swift_once();
  v35 = sub_247CEF598();
  __swift_project_value_buffer(v35, (uint64_t)qword_2576F4A00);
  v36 = v27;
  v37 = sub_247CEF580();
  v38 = sub_247CEF6E8();
  if (!os_log_type_enabled(v37, v38))
  {

LABEL_15:
    return v25;
  }
  v54 = v22;
  v39 = (uint8_t *)swift_slowAlloc();
  v40 = swift_slowAlloc();
  v57 = v40;
  *(_DWORD *)v39 = 136446210;
  if (*v32)
  {
    v41 = objc_msgSend(*v32, sel_description);
    v42 = sub_247CEF658();
    v44 = v43;

  }
  else
  {
    v42 = 0;
    v44 = 0;
  }
  v55 = v42;
  v56 = v44;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F1D70);
  v50 = sub_247CEF664();
  v55 = sub_247CB5D84(v50, v51, &v57);
  sub_247CEF748();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_247CAF000, v37, v38, "SFDevice created: %{public}s", v39, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x249590A5C](v40, -1, -1);
  MEMORY[0x249590A5C](v39, -1, -1);

  return v25;
}

id WFSetupClient.__deallocating_deinit()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  objc_super v10;

  v1 = v0;
  if (qword_2576F1D08 != -1)
    swift_once();
  v2 = sub_247CEF598();
  __swift_project_value_buffer(v2, (uint64_t)qword_2576F4A00);
  v3 = sub_247CEF580();
  v4 = sub_247CEF6E8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_247CAF000, v3, v4, "WFSetupClient deinit", v5, 2u);
    MEMORY[0x249590A5C](v5, -1, -1);
  }

  if (*((_BYTE *)v0 + OBJC_IVAR___WFSetupClientInternal_clientState + 2) == 1
    && (*((_BYTE *)v0 + OBJC_IVAR___WFSetupClientInternal_clientState + 5) & 1) == 0)
  {
    v6 = sub_247CEF580();
    v7 = sub_247CEF6DC();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_247CAF000, v6, v7, "deallocating object before invalidation is called", v8, 2u);
      MEMORY[0x249590A5C](v8, -1, -1);
    }

  }
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for WFSetupClient();
  return objc_msgSendSuper2(&v10, sel_dealloc);
}

Swift::Void __swiftcall WFSetupClient.invalidate()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void **v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];

  v1 = sub_247CEF5A4();
  v16 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_247CEF5BC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (void **)(v0 + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
  swift_beginAccess();
  v11 = *v10;
  v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_247CD99F8;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_247CBF050;
  aBlock[3] = &block_descriptor_1;
  v13 = _Block_copy(aBlock);
  v14 = v11;
  swift_retain();
  sub_247CEF5B0();
  v17 = MEMORY[0x24BEE4AF8];
  sub_247CD9A18();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2718);
  sub_247CCCEE0();
  sub_247CEF76C();
  MEMORY[0x2495903B4](0, v9, v4, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v16 + 8))(v4, v1);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  swift_release();
  swift_release();
}

void sub_247CD352C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  _BYTE *v7;
  char v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _BYTE *v12;
  uint64_t v13;
  void *v14;
  id v15;
  char *v16;
  void *v17;
  _BYTE *v18;
  uint64_t v19;
  void *v20;
  uint64_t *v21;
  void (*v22)(void);
  uint64_t v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject **v41;
  uint64_t v42[3];

  v1 = a1 + 16;
  if (qword_2576F1D08 != -1)
    swift_once();
  v2 = sub_247CEF598();
  __swift_project_value_buffer(v2, (uint64_t)qword_2576F4A00);
  v3 = sub_247CEF580();
  v4 = sub_247CEF6E8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v42[0] = v6;
    *(_DWORD *)v5 = 136446210;
    sub_247CB5D84(0x6164696C61766E69, 0xEC00000029286574, v42);
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v3, v4, "%{public}s invoked", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v6, -1, -1);
    MEMORY[0x249590A5C](v5, -1, -1);
  }

  swift_beginAccess();
  v7 = (_BYTE *)MEMORY[0x249590A98](v1);
  if (!v7 || (v8 = v7[OBJC_IVAR___WFSetupClientInternal_clientState + 5], v7, (v8 & 1) != 0))
  {
    v9 = sub_247CEF580();
    v10 = sub_247CEF6E8();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_247CAF000, v9, v10, "Already called invalidation method", v11, 2u);
      MEMORY[0x249590A5C](v11, -1, -1);
    }
    goto LABEL_30;
  }
  swift_beginAccess();
  v12 = (_BYTE *)MEMORY[0x249590A98](v1);
  if (v12)
  {
    v12[OBJC_IVAR___WFSetupClientInternal_clientState + 5] = 1;

  }
  swift_beginAccess();
  v13 = MEMORY[0x249590A98](v1);
  if (v13)
  {
    v14 = (void *)v13;
    v15 = *(id *)(v13 + OBJC_IVAR___WFSetupClientInternal_sfSession);

    objc_msgSend(v15, sel_invalidate);
  }
  swift_beginAccess();
  v16 = (char *)MEMORY[0x249590A98](v1);
  if (v16)
  {
    v17 = *(void **)&v16[OBJC_IVAR___WFSetupClientInternal_sfSession];
    *(_QWORD *)&v16[OBJC_IVAR___WFSetupClientInternal_sfSession] = 0;

  }
  swift_beginAccess();
  v18 = (_BYTE *)MEMORY[0x249590A98](v1);
  if (v18)
  {
    v18[OBJC_IVAR___WFSetupClientInternal_clientState + 4] = 0;

  }
  swift_beginAccess();
  v19 = MEMORY[0x249590A98](v1);
  if (v19)
  {
    v20 = (void *)v19;
    v21 = (uint64_t *)(v19 + OBJC_IVAR___WFSetupClientInternal_invalidationHandler);
    swift_beginAccess();
    v22 = (void (*)(void))*v21;
    sub_247CBDD44(*v21);

    if (v22)
    {
      v22();
      sub_247CBDE58((uint64_t)v22);
    }
  }
  swift_beginAccess();
  v23 = MEMORY[0x249590A98](v1);
  if (v23)
  {
    v24 = (void *)v23;
    v25 = (uint64_t *)(v23 + OBJC_IVAR___WFSetupClientInternal_invalidationHandler);
    swift_beginAccess();
    v26 = *v25;
    *v25 = 0;
    v25[1] = 0;
    sub_247CBDE58(v26);

  }
  swift_beginAccess();
  v27 = MEMORY[0x249590A98](v1);
  if (v27)
  {
    v28 = (void *)v27;
    v29 = (uint64_t *)(v27 + OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler);
    swift_beginAccess();
    v30 = *v29;
    *v29 = 0;
    v29[1] = 0;
    sub_247CBDE58(v30);

  }
  swift_beginAccess();
  v31 = MEMORY[0x249590A98](v1);
  if (v31)
  {
    v32 = (void *)v31;
    v33 = (uint64_t *)(v31 + OBJC_IVAR___WFSetupClientInternal_setupSecurePairingCompletionHandler);
    swift_beginAccess();
    v34 = *v33;
    *v33 = 0;
    v33[1] = 0;
    sub_247CBDE58(v34);

  }
  swift_beginAccess();
  v35 = MEMORY[0x249590A98](v1);
  if (v35)
  {
    v36 = (void *)v35;
    v37 = (uint64_t *)(v35 + OBJC_IVAR___WFSetupClientInternal_showPinHandler);
    swift_beginAccess();
    v38 = *v37;
    *v37 = 0;
    v37[1] = 0;
    sub_247CBDE58(v38);

  }
  swift_beginAccess();
  v39 = MEMORY[0x249590A98](v1);
  if (v39)
  {
    v40 = (void *)v39;
    v41 = (NSObject **)(v39 + OBJC_IVAR___WFSetupClientInternal_peerDevice);
    swift_beginAccess();
    v9 = *v41;
    *v41 = 0;

LABEL_30:
  }
}

void WFSetupClient.sendUserInteractionEvent(inEvent:withEncryption:responseHandler:)(uint64_t a1, char a2, void (*a3)(_QWORD, _QWORD, _QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t (*v21)();
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  _BYTE *v26;
  void *v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t inited;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t aBlock;
  unint64_t v50;
  uint64_t (*v51)(uint64_t, void *, uint64_t, uint64_t);
  void *v52;
  uint64_t (*v53)(uint64_t, uint64_t, uint64_t);
  uint64_t v54;

  v5 = v4;
  if (qword_2576F1D08 != -1)
    swift_once();
  v9 = sub_247CEF598();
  __swift_project_value_buffer(v9, (uint64_t)qword_2576F4A00);
  swift_bridgeObjectRetain_n();
  v10 = sub_247CEF580();
  v11 = sub_247CEF6E8();
  if (os_log_type_enabled(v10, v11))
  {
    v47 = a3;
    v12 = swift_slowAlloc();
    v46 = swift_slowAlloc();
    aBlock = v46;
    *(_DWORD *)v12 = 136446722;
    sub_247CB5D84(0xD000000000000041, 0x8000000247CF2DF0, &aBlock);
    sub_247CEF748();
    *(_WORD *)(v12 + 12) = 2082;
    swift_bridgeObjectRetain();
    v13 = a4;
    v14 = sub_247CEF628();
    v16 = v15;
    swift_bridgeObjectRelease();
    v17 = v14;
    a4 = v13;
    sub_247CB5D84(v17, v16, &aBlock);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 22) = 1024;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v10, v11, "%{public}s invoked with inEvent: %{public}s, withEncryption: %{BOOL}d", (uint8_t *)v12, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v46, -1, -1);
    v18 = v12;
    a3 = (void (*)(_QWORD, _QWORD, _QWORD))v47;
    MEMORY[0x249590A5C](v18, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v19 = *(void **)(v5 + OBJC_IVAR___WFSetupClientInternal_sfSession);
  if (v19)
  {
    if (*(_BYTE *)(v5 + OBJC_IVAR___WFSetupClientInternal_clientState + 4) == 1)
    {
      if (a3)
      {
        v20 = swift_allocObject();
        *(_QWORD *)(v20 + 16) = a3;
        *(_QWORD *)(v20 + 24) = a4;
        v21 = (uint64_t (*)())sub_247CD9AD0;
      }
      else
      {
        v20 = 0;
        v21 = nullsub_1;
      }
      v34 = swift_allocObject();
      *(_QWORD *)(v34 + 16) = v21;
      *(_QWORD *)(v34 + 24) = v20;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_247CF1020;
      aBlock = 0xD000000000000010;
      v50 = 0x8000000247CF2D90;
      v48 = v19;
      sub_247CBDD44((uint64_t)a3);
      sub_247CEF790();
      *(_QWORD *)(inited + 96) = MEMORY[0x24BEE1328];
      *(_BYTE *)(inited + 72) = (a2 & 1) == 0;
      sub_247CC0084(inited);
      swift_bridgeObjectRetain_n();
      v36 = sub_247CEF580();
      v37 = sub_247CEF6E8();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = swift_slowAlloc();
        v39 = swift_slowAlloc();
        aBlock = v39;
        *(_DWORD *)v38 = 136446466;
        swift_bridgeObjectRetain();
        v40 = sub_247CEF628();
        v42 = v41;
        swift_bridgeObjectRelease();
        sub_247CB5D84(v40, v42, &aBlock);
        sub_247CEF748();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v38 + 12) = 1024;
        sub_247CEF748();
        _os_log_impl(&dword_247CAF000, v36, v37, "Sending interaction event: %{public}s, withEncryption: %{BOOL}d", (uint8_t *)v38, 0x12u);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v39, -1, -1);
        MEMORY[0x249590A5C](v38, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v43 = (void *)sub_247CEF64C();
      v44 = (void *)sub_247CEF604();
      swift_bridgeObjectRelease();
      v28 = (id)sub_247CEF604();
      v53 = sub_247CD9AC8;
      v54 = v34;
      aBlock = MEMORY[0x24BDAC760];
      v50 = 1107296256;
      v51 = sub_247CC07F0;
      v52 = &block_descriptor_6_0;
      v45 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v48, sel_sendRequestID_options_request_responseHandler_, v43, v44, v28, v45);
      _Block_release(v45);

      swift_release();
LABEL_24:

      return;
    }
    v28 = v19;
    v29 = sub_247CEF580();
    v30 = sub_247CEF6DC();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_247CAF000, v29, v30, "Attempting to send an object before the session is activated", v31, 2u);
      MEMORY[0x249590A5C](v31, -1, -1);
    }

    if (!a3)
      goto LABEL_24;
    sub_247CD9A60();
    v32 = swift_allocError();
    *v33 = 3;
    a3(v32, 0, 0);

    v27 = (void *)v32;
LABEL_18:

    return;
  }
  v22 = sub_247CEF580();
  v23 = sub_247CEF6DC();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_247CAF000, v22, v23, "Failed to send object to server. SfSession is unexpectedly nil. ", v24, 2u);
    MEMORY[0x249590A5C](v24, -1, -1);
  }

  if (a3)
  {
    sub_247CD9A60();
    v25 = swift_allocError();
    *v26 = 2;
    a3(v25, 0, 0);
    v27 = (void *)v25;
    goto LABEL_18;
  }
}

Swift::Void __swiftcall WFSetupClient.activate()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void **v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t aBlock[9];

  v1 = v0;
  v2 = sub_247CEF5A4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_247CEF5BC();
  v26 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576F1D08 != -1)
    swift_once();
  v11 = sub_247CEF598();
  __swift_project_value_buffer(v11, (uint64_t)qword_2576F4A00);
  v12 = sub_247CEF580();
  v13 = sub_247CEF6E8();
  if (os_log_type_enabled(v12, v13))
  {
    v24 = v1;
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v25 = v3;
    v16 = v15;
    aBlock[0] = v15;
    *(_DWORD *)v14 = 136446210;
    aBlock[6] = sub_247CB5D84(0x6574617669746361, 0xEA00000000002928, aBlock);
    v1 = v24;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v12, v13, "%{public}s is invoked. ", v14, 0xCu);
    swift_arrayDestroy();
    v17 = v16;
    v3 = v25;
    MEMORY[0x249590A5C](v17, -1, -1);
    MEMORY[0x249590A5C](v14, -1, -1);
  }

  v18 = (void **)(v1 + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
  swift_beginAccess();
  v19 = *v18;
  v20 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = (uint64_t)sub_247CD9AD8;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_247CBF050;
  aBlock[3] = (uint64_t)&block_descriptor_13;
  v21 = _Block_copy(aBlock);
  v22 = v19;
  swift_retain();
  sub_247CEF5B0();
  v27 = MEMORY[0x24BEE4AF8];
  sub_247CD9A18();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2718);
  sub_247CCCEE0();
  sub_247CEF76C();
  MEMORY[0x2495903B4](0, v10, v6, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v10, v7);
  swift_release();
  swift_release();
}

void sub_247CD4630(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17[4];

  v1 = a1 + 16;
  if (qword_2576F1D08 != -1)
    swift_once();
  v2 = sub_247CEF598();
  __swift_project_value_buffer(v2, (uint64_t)qword_2576F4A00);
  v3 = sub_247CEF580();
  v4 = sub_247CEF6E8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_247CAF000, v3, v4, "Client is being activated", v5, 2u);
    MEMORY[0x249590A5C](v5, -1, -1);
  }

  swift_beginAccess();
  v6 = MEMORY[0x249590A98](v1);
  if (v6)
  {
    v7 = v6;
    *(_BYTE *)(v6 + OBJC_IVAR___WFSetupClientInternal_clientState + 2) = 1;
    v8 = (uint64_t *)(v6 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler);
    swift_beginAccess();
    v10 = *v8;
    v9 = v8[1];
    sub_247CBDD44(v10);
    sub_247CE1FA0(0, 0, 0, v10, v9);
    sub_247CBDE58(v10);
    v11 = sub_247CEF580();
    v12 = sub_247CEF6E8();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_247CAF000, v11, v12, "Activate signal has been recieved, advancing connection state", v13, 2u);
      MEMORY[0x249590A5C](v13, -1, -1);
    }

    sub_247CD4C78();
  }
  else
  {
    v7 = sub_247CEF580();
    v14 = sub_247CEF6DC();
    if (os_log_type_enabled(v7, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v17[0] = v16;
      *(_DWORD *)v15 = 136315138;
      v17[3] = sub_247CB5D84(0x4370757465534657, 0xED0000746E65696CLL, v17);
      sub_247CEF748();
      _os_log_impl(&dword_247CAF000, v7, v14, "%s is unexpectedly deallocated. ", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v16, -1, -1);
      MEMORY[0x249590A5C](v15, -1, -1);
    }
  }

}

Swift::Void __swiftcall WFSetupClient.sendObject(_:encrypted:)(Swift::OpaquePointer _, Swift::Bool encrypted)
{
  uint64_t v2;
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  NSObject *oslog;

  v3 = *(void **)(v2 + OBJC_IVAR___WFSetupClientInternal_sfSession);
  if (v3)
  {
    if (*(_BYTE *)(v2 + OBJC_IVAR___WFSetupClientInternal_clientState + 4) == 1)
    {
      v4 = encrypted;
      v5 = qword_2576F1D08;
      v6 = v3;
      if (v5 != -1)
        swift_once();
      v7 = sub_247CEF598();
      __swift_project_value_buffer(v7, (uint64_t)qword_2576F4A00);
      v8 = sub_247CEF580();
      v9 = sub_247CEF6E8();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_247CAF000, v8, v9, "Sending object to server", v10, 2u);
        MEMORY[0x249590A5C](v10, -1, -1);
      }

      oslog = sub_247CEF604();
      objc_msgSend(v6, sel_sendWithFlags_object_, v4, oslog);

    }
    else
    {
      v14 = qword_2576F1D08;
      oslog = v3;
      if (v14 != -1)
        swift_once();
      v15 = sub_247CEF598();
      __swift_project_value_buffer(v15, (uint64_t)qword_2576F4A00);
      v16 = sub_247CEF580();
      v17 = sub_247CEF6DC();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_247CAF000, v16, v17, "Attempting to send an object before the session is activated", v18, 2u);
        MEMORY[0x249590A5C](v18, -1, -1);
      }

    }
  }
  else
  {
    if (qword_2576F1D08 != -1)
      swift_once();
    v11 = sub_247CEF598();
    __swift_project_value_buffer(v11, (uint64_t)qword_2576F4A00);
    oslog = sub_247CEF580();
    v12 = sub_247CEF6DC();
    if (os_log_type_enabled(oslog, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_247CAF000, oslog, v12, "Failed to send object to server. SfSession is unexpectedly nil.", v13, 2u);
      MEMORY[0x249590A5C](v13, -1, -1);
    }
  }

}

void sub_247CD4C78()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void **v14;
  void *v15;
  id v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  char *v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  _BOOL4 v35;
  uint8_t *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  char *v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  char *v48;
  char *v49;
  NSObject *v50;
  os_log_type_t v51;
  _BOOL4 v52;
  uint8_t *v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  unint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint8_t *v61;
  void (*v62)(char *, uint64_t);
  int v63;
  NSObject *v64;
  os_log_type_t v65;
  _BOOL4 v66;
  uint8_t *v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  int v71;
  os_log_type_t v72;
  _BOOL4 v73;
  uint8_t *v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  char *v78;
  NSObject *v79;
  os_log_type_t v80;
  uint64_t v81;
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char *v88;
  uint64_t v89;
  uint8_t *v90;
  os_log_type_t v91;
  const char *v92;
  NSObject *v93;
  os_log_type_t v94;
  uint8_t *v95;
  NSObject *v96;
  os_log_type_t v97;
  uint8_t *v98;
  int v99;
  os_log_type_t v100;
  _BOOL4 v101;
  uint8_t *v102;
  NSObject *v103;
  os_log_type_t v104;
  uint8_t *v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114[3];

  v1 = sub_247CEF598();
  v2 = *(_QWORD *)(v1 - 8);
  v4 = MEMORY[0x24BDAC7A8](v1, v3);
  v6 = (char *)&v106 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4, v7);
  v110 = (char *)&v106 - v8;
  v9 = sub_247CEF5E0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (uint64_t *)((char *)&v106 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = (void **)&v0[OBJC_IVAR___WFSetupClientInternal_dispatchQueue];
  swift_beginAccess();
  v15 = *v14;
  *v13 = v15;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v10 + 104))(v13, *MEMORY[0x24BEE5610], v9);
  v16 = v15;
  LOBYTE(v15) = sub_247CEF5F8();
  (*(void (**)(_QWORD *, uint64_t))(v10 + 8))(v13, v9);
  if ((v15 & 1) != 0)
  {
    if (qword_2576F1D08 == -1)
      goto LABEL_3;
  }
  else
  {
    __break(1u);
  }
  swift_once();
LABEL_3:
  v17 = __swift_project_value_buffer(v1, (uint64_t)qword_2576F4A00);
  v18 = v0;
  v19 = sub_247CEF580();
  v20 = sub_247CEF6E8();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc();
    v109 = v2;
    v22 = (uint8_t *)v21;
    v23 = swift_slowAlloc();
    v108 = v6;
    v24 = v17;
    v25 = v1;
    v26 = v23;
    v114[0] = v23;
    *(_DWORD *)v22 = 136446210;
    v27 = sub_247CD25D0();
    v111 = sub_247CB5D84(v27, v28, v114);
    sub_247CEF748();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v19, v20, "Advancing connection state. Current state: %{public}s", v22, 0xCu);
    swift_arrayDestroy();
    v29 = v26;
    v1 = v25;
    v17 = v24;
    v6 = v108;
    MEMORY[0x249590A5C](v29, -1, -1);
    v30 = v22;
    v2 = v109;
    MEMORY[0x249590A5C](v30, -1, -1);

  }
  else
  {

  }
  v31 = &v18[OBJC_IVAR___WFSetupClientInternal_peerDevice];
  swift_beginAccess();
  if (!*(_QWORD *)v31)
  {
    v58 = sub_247CEF580();
    v59 = sub_247CEF6DC();
    if (os_log_type_enabled(v58, v59))
    {
      v60 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v60 = 0;
      _os_log_impl(&dword_247CAF000, v58, v59, "Peer device has not been defined or has been cleared. Not advancing connection state.", v60, 2u);
      MEMORY[0x249590A5C](v60, -1, -1);
    }

    return;
  }
  v32 = *(_QWORD *)&v18[OBJC_IVAR___WFSetupClientInternal_sfSession];
  v33 = sub_247CEF580();
  v34 = sub_247CEF6E8();
  v35 = os_log_type_enabled(v33, v34);
  if (!v32)
  {
    if (v35)
    {
      v61 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v61 = 0;
      _os_log_impl(&dword_247CAF000, v33, v34, "Not yet connected, attempting to start SFSession", v61, 2u);
      MEMORY[0x249590A5C](v61, -1, -1);
    }

    sub_247CD6E10();
    return;
  }
  if (v35)
  {
    v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v36 = 0;
    _os_log_impl(&dword_247CAF000, v33, v34, "Session is present", v36, 2u);
    MEMORY[0x249590A5C](v36, -1, -1);
  }

  v37 = sub_247CEF580();
  v38 = sub_247CEF6E8();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v39 = 0;
    _os_log_impl(&dword_247CAF000, v37, v38, "Checking authState", v39, 2u);
    MEMORY[0x249590A5C](v39, -1, -1);
  }

  v40 = &v18[OBJC_IVAR___WFSetupClientInternal_clientState];
  if (!v18[OBJC_IVAR___WFSetupClientInternal_clientState])
  {
    v41 = sub_247CEF580();
    v42 = sub_247CEF6E8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_247CAF000, v41, v42, "AuthState is .notInitiated, send preAuth", v43, 2u);
      MEMORY[0x249590A5C](v43, -1, -1);
    }

    v44 = (uint64_t *)&v18[OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler];
    swift_beginAccess();
    v46 = *v44;
    v45 = v44[1];
    sub_247CBDD44(v46);
    sub_247CE1FA0(0xAuLL, 0, 0, v46, v45);
    sub_247CBDE58(v46);
    *v40 = 1;
    sub_247CD62E0();
  }
  v47 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v48 = v110;
  v47(v110, v17, v1);
  v49 = v18;
  v50 = sub_247CEF580();
  v51 = sub_247CEF6E8();
  v52 = os_log_type_enabled(v50, v51);
  v108 = (char *)v47;
  if (v52)
  {
    v109 = v2;
    v107 = v1;
    v53 = (uint8_t *)swift_slowAlloc();
    v54 = swift_slowAlloc();
    v113 = v54;
    *(_DWORD *)v53 = 136446210;
    v55 = *v40;
    if (*v40)
    {
      if (v55 == 1)
        v56 = 0xD000000000000012;
      else
        v56 = 0xD000000000000017;
      if (v55 == 1)
        v57 = 0x8000000247CF3B80;
      else
        v57 = 0x8000000247CF3A80;
    }
    else
    {
      v57 = 0xEC00000064657461;
      v56 = 0x6974696E49746F6ELL;
    }
    v112 = sub_247CB5D84(v56, v57, &v113);
    sub_247CEF748();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v50, v51, "AuthState is past .notInitiated (%{public}s), checking server response", v53, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v54, -1, -1);
    MEMORY[0x249590A5C](v53, -1, -1);

    v62 = *(void (**)(char *, uint64_t))(v109 + 8);
    v1 = v107;
    v62(v110, v107);
  }
  else
  {

    v62 = *(void (**)(char *, uint64_t))(v2 + 8);
    v62(v48, v1);
  }
  v63 = *v40;
  v64 = sub_247CEF580();
  v65 = sub_247CEF6E8();
  v66 = os_log_type_enabled(v64, v65);
  if (v63 != 2)
  {
    if (!v66)
      goto LABEL_65;
    v90 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v90 = 0;
    v91 = v65;
    v92 = "PreAuth Response not received yet. Waiting for the server to send preAuth response.";
LABEL_64:
    _os_log_impl(&dword_247CAF000, v64, v91, v92, v90, 2u);
    MEMORY[0x249590A5C](v90, -1, -1);
    goto LABEL_65;
  }
  if (v66)
  {
    v67 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v67 = 0;
    _os_log_impl(&dword_247CAF000, v64, v65, "AuthState has received server response", v67, 2u);
    MEMORY[0x249590A5C](v67, -1, -1);
  }

  v68 = sub_247CEF580();
  v69 = sub_247CEF6E8();
  if (os_log_type_enabled(v68, v69))
  {
    v70 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v70 = 0;
    _os_log_impl(&dword_247CAF000, v68, v69, "Checking secure channel status", v70, 2u);
    MEMORY[0x249590A5C](v70, -1, -1);
  }

  v71 = v40[7];
  v64 = sub_247CEF580();
  v72 = sub_247CEF6E8();
  v73 = os_log_type_enabled(v64, v72);
  if (v71 != 1)
  {
    if (!v73)
      goto LABEL_65;
    v90 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v90 = 0;
    v91 = v72;
    v92 = "Secure channel has not yet been established.";
    goto LABEL_64;
  }
  if (v73)
  {
    v74 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v74 = 0;
    _os_log_impl(&dword_247CAF000, v64, v72, "Secure channel is established.", v74, 2u);
    MEMORY[0x249590A5C](v74, -1, -1);
  }

  v75 = sub_247CEF580();
  v76 = sub_247CEF6E8();
  if (os_log_type_enabled(v75, v76))
  {
    v77 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v77 = 0;
    _os_log_impl(&dword_247CAF000, v75, v76, "Checking coreCDPSetupState initiated", v77, 2u);
    MEMORY[0x249590A5C](v77, -1, -1);
  }

  if (v40[1])
  {
    ((void (*)(char *, uint64_t, uint64_t))v108)(v6, v17, v1);
    v78 = v49;
    v79 = sub_247CEF580();
    v80 = sub_247CEF6E8();
    if (os_log_type_enabled(v79, v80))
    {
      v81 = swift_slowAlloc();
      v110 = v78;
      v82 = (uint8_t *)v81;
      v83 = swift_slowAlloc();
      v108 = v6;
      v84 = v83;
      *(_DWORD *)v82 = 136315138;
      v85 = 8 * v40[1];
      v86 = *(_QWORD *)&aNotinitiinprog[v85];
      v113 = v84;
      v87 = *(_QWORD *)&aAted[v85];
      v107 = v1;
      v112 = sub_247CB5D84(v86, v87, &v113);
      sub_247CEF748();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v79, v80, "CoreCDPSetup is %s.", v82, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v84, -1, -1);
      MEMORY[0x249590A5C](v82, -1, -1);

      v89 = v107;
      v88 = v108;
    }
    else
    {

      v88 = v6;
      v89 = v1;
    }
    v62(v88, v89);
    v96 = sub_247CEF580();
    v97 = sub_247CEF6E8();
    if (os_log_type_enabled(v96, v97))
    {
      v98 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v98 = 0;
      _os_log_impl(&dword_247CAF000, v96, v97, "Checking is proximity setup complete", v98, 2u);
      MEMORY[0x249590A5C](v98, -1, -1);
    }

    v99 = v40[6];
    v64 = sub_247CEF580();
    v100 = sub_247CEF6E8();
    v101 = os_log_type_enabled(v64, v100);
    if (v99 == 1)
    {
      if (v101)
      {
        v102 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v102 = 0;
        _os_log_impl(&dword_247CAF000, v64, v100, "Proximity setup is completed. ", v102, 2u);
        MEMORY[0x249590A5C](v102, -1, -1);
      }

      v103 = sub_247CEF580();
      v104 = sub_247CEF6E8();
      if (os_log_type_enabled(v103, v104))
      {
        v105 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v105 = 0;
        _os_log_impl(&dword_247CAF000, v103, v104, "Calling successful completion handler", v105, 2u);
        MEMORY[0x249590A5C](v105, -1, -1);
      }

      sub_247CD83C8(0);
      return;
    }
    if (v101)
    {
      v90 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v90 = 0;
      v91 = v100;
      v92 = "Proximity setup is not yet completed";
      goto LABEL_64;
    }
LABEL_65:

    return;
  }
  v93 = sub_247CEF580();
  v94 = sub_247CEF6E8();
  if (os_log_type_enabled(v93, v94))
  {
    v95 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v95 = 0;
    _os_log_impl(&dword_247CAF000, v93, v94, "CoreCDPSetup is not initiated, setting up", v95, 2u);
    MEMORY[0x249590A5C](v95, -1, -1);
  }

  sub_247CD8C5C();
}

void sub_247CD5A20(unint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD), uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  __CFString *v22;
  void (*v23)(_QWORD, _QWORD, _QWORD);
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _BYTE *v30;
  uint64_t inited;
  uint64_t v32;
  unint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint8_t *v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t (*v39)();
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  __CFString *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  unint64_t v61;
  uint64_t aBlock;
  unint64_t v63;
  uint64_t (*v64)(uint64_t, void *, uint64_t, uint64_t);
  void *v65;
  uint64_t (*v66)(uint64_t, uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;

  if (qword_2576F1D08 != -1)
    swift_once();
  v7 = sub_247CEF598();
  __swift_project_value_buffer(v7, (uint64_t)qword_2576F4A00);
  v8 = sub_247CEF580();
  v9 = sub_247CEF6E8();
  v61 = a1;
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v58 = a2;
    v11 = swift_slowAlloc();
    aBlock = v11;
    *(_DWORD *)v10 = 136446466;
    v68 = sub_247CB5D84(0xD00000000000002ALL, 0x8000000247CF3C70, &aBlock);
    sub_247CEF748();
    *(_WORD *)(v10 + 12) = 2082;
    v12 = WFSetupProgressEventToString_0(a1);
    v13 = sub_247CEF658();
    v15 = v14;

    v68 = sub_247CB5D84(v13, v15, &aBlock);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v8, v9, "%{public}s invoked with inEvent: %{public}s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    v16 = v11;
    a2 = (void (*)(_QWORD, _QWORD, _QWORD))v58;
    MEMORY[0x249590A5C](v16, -1, -1);
    MEMORY[0x249590A5C](v10, -1, -1);
  }

  v17 = *(void **)(v3 + OBJC_IVAR___WFSetupClientInternal_sfSession);
  if (v17)
  {
    if (v61 > 0xF)
      return;
    if (((1 << v61) & 0xFE1F) != 0)
    {
      v18 = v17;
      v19 = sub_247CEF580();
      v20 = sub_247CEF6DC();
      if (os_log_type_enabled(v19, v20))
      {
        v59 = v18;
        v21 = swift_slowAlloc();
        v57 = swift_slowAlloc();
        aBlock = v57;
        *(_DWORD *)v21 = 136446466;
        v68 = sub_247CB5D84(0xD00000000000002ALL, 0x8000000247CF3C70, &aBlock);
        sub_247CEF748();
        *(_WORD *)(v21 + 12) = 2082;
        v22 = WFSetupProgressEventToString_0(v61);
        v23 = a2;
        v24 = sub_247CEF658();
        v26 = v25;

        v27 = v24;
        a2 = v23;
        v68 = sub_247CB5D84(v27, v26, &aBlock);
        sub_247CEF748();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247CAF000, v19, v20, "%{public}s invoked with unexpected event: %{public}s. Only events related to secure channel should be sent through this method. ", (uint8_t *)v21, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v57, -1, -1);
        v28 = v21;
        v18 = v59;
        MEMORY[0x249590A5C](v28, -1, -1);
      }

      if (a2)
      {
        sub_247CD9A60();
        v29 = (void *)swift_allocError();
        *v30 = 4;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_247CF1020;
        aBlock = 0;
        v63 = 0xE000000000000000;
        v32 = MEMORY[0x24BEE0D00];
        sub_247CEF790();
        *(_QWORD *)(inited + 96) = v32;
        *(_QWORD *)(inited + 72) = 0;
        *(_QWORD *)(inited + 80) = 0xE000000000000000;
        v33 = sub_247CC0084(inited);
        a2(v29, 0, v33);
        swift_bridgeObjectRelease();

LABEL_16:
        return;
      }

    }
    else
    {
      if (a2)
      {
        v38 = swift_allocObject();
        *(_QWORD *)(v38 + 16) = a2;
        *(_QWORD *)(v38 + 24) = a3;
        v39 = (uint64_t (*)())sub_247CDA2FC;
      }
      else
      {
        v38 = 0;
        v39 = nullsub_1;
      }
      v40 = swift_allocObject();
      *(_QWORD *)(v40 + 16) = v39;
      *(_QWORD *)(v40 + 24) = v38;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
      v41 = swift_initStackObject();
      *(_OWORD *)(v41 + 16) = xmmword_247CF1020;
      aBlock = 0xD000000000000010;
      v63 = 0x8000000247CF2D90;
      v60 = v17;
      sub_247CBDD44((uint64_t)a2);
      sub_247CEF790();
      *(_QWORD *)(v41 + 96) = MEMORY[0x24BEE1328];
      *(_BYTE *)(v41 + 72) = 1;
      sub_247CC0084(v41);
      v42 = sub_247CEF580();
      v43 = sub_247CEF6E8();
      if (os_log_type_enabled(v42, v43))
      {
        v44 = (uint8_t *)swift_slowAlloc();
        v45 = swift_slowAlloc();
        aBlock = v45;
        *(_DWORD *)v44 = 136446210;
        v46 = WFSetupProgressEventToString_0(v61);
        v47 = sub_247CEF658();
        v49 = v48;

        v68 = sub_247CB5D84(v47, v49, &aBlock);
        sub_247CEF748();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247CAF000, v42, v43, "Sending secure pairing event: %{public}s", v44, 0xCu);
        swift_arrayDestroy();
        v50 = v45;
        v51 = v61;
        MEMORY[0x249590A5C](v50, -1, -1);
        MEMORY[0x249590A5C](v44, -1, -1);

      }
      else
      {

        v51 = v61;
      }
      v52 = (void *)sub_247CEF64C();
      v53 = (void *)sub_247CEF604();
      swift_bridgeObjectRelease();
      v54 = swift_initStackObject();
      *(_OWORD *)(v54 + 16) = xmmword_247CF1020;
      aBlock = 0xD000000000000014;
      v63 = 0x8000000247CF2050;
      sub_247CEF790();
      *(_QWORD *)(v54 + 96) = MEMORY[0x24BEE1768];
      *(_QWORD *)(v54 + 72) = v51;
      sub_247CC0084(v54);
      v55 = (void *)sub_247CEF604();
      swift_bridgeObjectRelease();
      v66 = sub_247CDA388;
      v67 = v40;
      aBlock = MEMORY[0x24BDAC760];
      v63 = 1107296256;
      v64 = sub_247CC07F0;
      v65 = &block_descriptor_80;
      v56 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v60, sel_sendRequestID_options_request_responseHandler_, v52, v53, v55, v56);

      _Block_release(v56);
      swift_release();

    }
  }
  else
  {
    v34 = sub_247CEF580();
    v35 = sub_247CEF6DC();
    if (os_log_type_enabled(v34, (os_log_type_t)v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_247CAF000, v34, (os_log_type_t)v35, "Failed to send object to server. SfSession is not available. ", v36, 2u);
      MEMORY[0x249590A5C](v36, -1, -1);
    }

    if (a2)
    {
      sub_247CD9A60();
      v29 = (void *)swift_allocError();
      *v37 = 2;
      a2(v29, 0, 0);
      goto LABEL_16;
    }
  }
}

void sub_247CD62E0()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  unint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  unsigned int v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  unint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  unint64_t v47;
  char v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  unint64_t v55;
  id v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  void *v73;
  id v74;
  _QWORD v75[2];
  uint64_t v76;
  id v77;
  Class isa;
  NSObject *v79;
  unint64_t v80;
  _OWORD v81[2];
  __int128 v82;
  uint64_t v83;
  uint64_t v84[5];
  unint64_t v85;

  v1 = sub_247CEF574();
  isa = v1[-1].isa;
  v79 = v1;
  MEMORY[0x24BDAC7A8](v1, v2);
  v4 = (char *)v75 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(void **)(v0 + OBJC_IVAR___WFSetupClientInternal_sfSession);
  if (v5)
  {
    v77 = v5;
    v6 = sub_247CC0084(MEMORY[0x24BEE4AF8]);
    *(_QWORD *)&v82 = 28783;
    *((_QWORD *)&v82 + 1) = 0xE200000000000000;
    sub_247CEF790();
    v83 = MEMORY[0x24BEE3F88];
    LODWORD(v82) = 3;
    sub_247CCCFBC(&v82, v81);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v80 = v6;
    sub_247CCD1BC(v81, (uint64_t)v84, isUniquelyReferenced_nonNull_native);
    v8 = v80;
    v85 = v80;
    swift_bridgeObjectRelease();
    sub_247CCF0F4((uint64_t)v84);
    v9 = _AXSCopySettingsDataBlobForBuddy();
    if (v9)
    {
      v10 = v9;
      *(_QWORD *)&v82 = 1951627361;
      *((_QWORD *)&v82 + 1) = 0xE400000000000000;
      sub_247CEF790();
      type metadata accessor for CFData(0);
      v83 = v11;
      *(_QWORD *)&v82 = v10;
      sub_247CCCFBC(&v82, v81);
      v12 = swift_isUniquelyReferenced_nonNull_native();
      v80 = v8;
      sub_247CCD1BC(v81, (uint64_t)v84, v12);
      v85 = v80;
      swift_bridgeObjectRelease();
      sub_247CCF0F4((uint64_t)v84);
    }
    else
    {
      if (qword_2576F1D08 != -1)
        swift_once();
      v16 = sub_247CEF598();
      __swift_project_value_buffer(v16, (uint64_t)qword_2576F4A00);
      v17 = sub_247CEF580();
      v18 = sub_247CEF6DC();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_247CAF000, v17, v18, "Failed to get the accessibility settings", v19, 2u);
        MEMORY[0x249590A5C](v19, -1, -1);
      }

    }
    v20 = SFDeviceClassCodeGet();
    *(_QWORD *)&v82 = 0x7373616C6364;
    *((_QWORD *)&v82 + 1) = 0xE600000000000000;
    sub_247CEF790();
    v83 = MEMORY[0x24BEE4260];
    LOBYTE(v82) = v20;
    sub_247CCCFBC(&v82, v81);
    v21 = v85;
    v22 = swift_isUniquelyReferenced_nonNull_native();
    v80 = v21;
    sub_247CCD1BC(v81, (uint64_t)v84, v22);
    v85 = v80;
    swift_bridgeObjectRelease();
    sub_247CCF0F4((uint64_t)v84);
    if (qword_2576F1D08 != -1)
      swift_once();
    v23 = sub_247CEF598();
    v24 = __swift_project_value_buffer(v23, (uint64_t)qword_2576F4A00);
    v25 = sub_247CEF580();
    v26 = sub_247CEF6E8();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v84[0] = v28;
      *(_DWORD *)v27 = 136446210;
      SFDeviceClassCodeToString(v20);
      v29 = sub_247CEF688();
      *(_QWORD *)&v82 = sub_247CB5D84(v29, v30, v84);
      sub_247CEF748();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v25, v26, "Setting device class in pre-Auth data: %{public}s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v28, -1, -1);
      MEMORY[0x249590A5C](v27, -1, -1);
    }

    v31 = (void *)objc_opt_self();
    v32 = objc_msgSend(v31, sel_preferredLanguages);
    v33 = MEMORY[0x24BEE0D00];
    v34 = (_QWORD *)sub_247CEF6AC();

    if (v34[2])
    {
      v35 = v34[4];
      v36 = v34[5];
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRelease();
      v37 = sub_247CEF580();
      v38 = sub_247CEF6E8();
      if (os_log_type_enabled(v37, v38))
      {
        v39 = swift_slowAlloc();
        v75[1] = v24;
        v40 = (uint8_t *)v39;
        v41 = swift_slowAlloc();
        v76 = v35;
        v42 = v41;
        v84[0] = v41;
        *(_DWORD *)v40 = 136446210;
        swift_bridgeObjectRetain();
        *(_QWORD *)&v82 = sub_247CB5D84(v76, v36, v84);
        v33 = MEMORY[0x24BEE0D00];
        sub_247CEF748();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_247CAF000, v37, v38, "Setting preferred langauge in pre-Auth data: %{public}s", v40, 0xCu);
        swift_arrayDestroy();
        v43 = v42;
        v35 = v76;
        MEMORY[0x249590A5C](v43, -1, -1);
        MEMORY[0x249590A5C](v40, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      *(_QWORD *)&v82 = 1735287148;
      *((_QWORD *)&v82 + 1) = 0xE400000000000000;
      sub_247CEF790();
      v83 = v33;
      *(_QWORD *)&v82 = v35;
      *((_QWORD *)&v82 + 1) = v36;
      sub_247CCCFBC(&v82, v81);
      v47 = v85;
      v48 = swift_isUniquelyReferenced_nonNull_native();
      v80 = v47;
      sub_247CCD1BC(v81, (uint64_t)v84, v48);
      v85 = v80;
      swift_bridgeObjectRelease();
      sub_247CCF0F4((uint64_t)v84);
    }
    else
    {
      swift_bridgeObjectRelease();
      v44 = sub_247CEF580();
      v45 = sub_247CEF6E8();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v46 = 0;
        _os_log_impl(&dword_247CAF000, v44, v45, "No preferred language", v46, 2u);
        MEMORY[0x249590A5C](v46, -1, -1);
      }

    }
    v49 = objc_msgSend(v31, sel_currentLocale);
    sub_247CEF568();

    v50 = sub_247CEF55C();
    v52 = v51;
    (*((void (**)(char *, NSObject *))isa + 1))(v4, v79);
    *(_QWORD *)&v82 = 0x656C61636F6CLL;
    *((_QWORD *)&v82 + 1) = 0xE600000000000000;
    sub_247CEF790();
    v83 = v33;
    *(_QWORD *)&v82 = v50;
    *((_QWORD *)&v82 + 1) = v52;
    sub_247CCCFBC(&v82, v81);
    v53 = v85;
    v54 = swift_isUniquelyReferenced_nonNull_native();
    v80 = v53;
    sub_247CCD1BC(v81, (uint64_t)v84, v54);
    v55 = v80;
    v85 = v80;
    swift_bridgeObjectRelease();
    sub_247CCF0F4((uint64_t)v84);
    v56 = (id)MobileGestalt_get_current_device();
    if (v56)
    {
      v57 = v56;
      v58 = (id)MobileGestalt_copy_productType_obj();

      if (v58)
      {
        v59 = sub_247CEF658();
        v61 = v60;

        *(_QWORD *)&v82 = 0x6C65646F6DLL;
        *((_QWORD *)&v82 + 1) = 0xE500000000000000;
        sub_247CEF790();
        v83 = v33;
        *(_QWORD *)&v82 = v59;
        *((_QWORD *)&v82 + 1) = v61;
        sub_247CCCFBC(&v82, v81);
        v62 = swift_isUniquelyReferenced_nonNull_native();
        v80 = v55;
        sub_247CCD1BC(v81, (uint64_t)v84, v62);
        v85 = v80;
        swift_bridgeObjectRelease();
        sub_247CCF0F4((uint64_t)v84);
      }
      else
      {
        v63 = sub_247CEF580();
        v64 = sub_247CEF6DC();
        if (os_log_type_enabled(v63, v64))
        {
          v65 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v65 = 0;
          _os_log_impl(&dword_247CAF000, v63, v64, "Failed to get model for device", v65, 2u);
          MEMORY[0x249590A5C](v65, -1, -1);
        }

      }
      v66 = sub_247CEF580();
      v67 = sub_247CEF6E8();
      if (os_log_type_enabled(v66, v67))
      {
        v68 = (uint8_t *)swift_slowAlloc();
        v69 = swift_slowAlloc();
        v84[0] = v69;
        *(_DWORD *)v68 = 136446210;
        v79 = (v68 + 4);
        swift_beginAccess();
        swift_bridgeObjectRetain();
        v70 = sub_247CEF628();
        v72 = v71;
        swift_bridgeObjectRelease();
        *(_QWORD *)&v81[0] = sub_247CB5D84(v70, v72, v84);
        sub_247CEF748();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247CAF000, v66, v67, "Send PreAuth info: %{public}s", v68, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v69, -1, -1);
        MEMORY[0x249590A5C](v68, -1, -1);
      }

      swift_beginAccess();
      swift_bridgeObjectRetain();
      v73 = (void *)sub_247CEF604();
      swift_bridgeObjectRelease();
      v74 = v77;
      objc_msgSend(v77, sel_sendWithFlags_object_, 0, v73);

      swift_bridgeObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_2576F1D08 != -1)
      swift_once();
    v13 = sub_247CEF598();
    __swift_project_value_buffer(v13, (uint64_t)qword_2576F4A00);
    v79 = sub_247CEF580();
    v14 = sub_247CEF6E8();
    if (os_log_type_enabled(v79, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_247CAF000, v79, v14, "Unexpectedly found sfSession to be nil", v15, 2u);
      MEMORY[0x249590A5C](v15, -1, -1);
    }

  }
}

void sub_247CD6E10()
{
  uint64_t v0;
  id *v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;

  v1 = (id *)(v0 + OBJC_IVAR___WFSetupClientInternal_peerDevice);
  swift_beginAccess();
  if (*v1)
  {
    v2 = OBJC_IVAR___WFSetupClientInternal_sfSession;
    v3 = *(void **)(v0 + OBJC_IVAR___WFSetupClientInternal_sfSession);
    v4 = *v1;
    objc_msgSend(v3, sel_invalidate);
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE901B0]), sel_init);
    v6 = (_QWORD *)(v0 + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
    swift_beginAccess();
    objc_msgSend(v5, sel_setDispatchQueue_, *v6);
    objc_msgSend(v5, sel_setPeerDevice_, v4);
    objc_msgSend(v5, sel_setServiceIdentifier_, *MEMORY[0x24BE90380]);
    objc_msgSend(v5, sel_setSessionFlags_, 1);
    v7 = *(void **)(v0 + v2);
    *(_QWORD *)(v0 + v2) = v5;
    v8 = v5;

    v9 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v32 = sub_247CD9EC4;
    v33 = v9;
    v10 = MEMORY[0x24BDAC760];
    v28 = MEMORY[0x24BDAC760];
    v29 = 1107296256;
    v30 = sub_247CD1570;
    v31 = &block_descriptor_47_0;
    v11 = _Block_copy(&v28);
    swift_release();
    objc_msgSend(v8, sel_setErrorHandler_, v11);
    _Block_release(v11);
    v32 = sub_247CD75B8;
    v33 = 0;
    v28 = v10;
    v29 = 1107296256;
    v30 = sub_247CBF050;
    v31 = &block_descriptor_50;
    v12 = _Block_copy(&v28);
    objc_msgSend(v8, sel_setInvalidationHandler_, v12);
    _Block_release(v12);
    v13 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v32 = sub_247CD9ECC;
    v33 = v13;
    v28 = v10;
    v29 = 1107296256;
    v30 = sub_247CBF050;
    v31 = &block_descriptor_54_0;
    v14 = _Block_copy(&v28);
    swift_release();
    objc_msgSend(v8, sel_setInterruptionHandler_, v14);
    _Block_release(v14);
    v15 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v32 = sub_247CD9ED4;
    v33 = v15;
    v28 = v10;
    v29 = 1107296256;
    v30 = sub_247CD2480;
    v31 = &block_descriptor_58;
    v16 = _Block_copy(&v28);
    swift_release();
    objc_msgSend(v8, sel_setShowPINHandlerEx_, v16);
    _Block_release(v16);
    v17 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v32 = sub_247CD9EDC;
    v33 = v17;
    v28 = v10;
    v29 = 1107296256;
    v30 = sub_247CD1610;
    v31 = &block_descriptor_62;
    v18 = _Block_copy(&v28);
    swift_release();
    objc_msgSend(v8, sel_setReceivedObjectHandler_, v18);
    _Block_release(v18);
    v19 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v32 = sub_247CD9EE4;
    v33 = v19;
    v28 = v10;
    v29 = 1107296256;
    v30 = sub_247CD1570;
    v31 = &block_descriptor_66;
    v20 = _Block_copy(&v28);
    swift_release();
    objc_msgSend(v8, sel_setPairSetupCompletionHandler_, v20);
    _Block_release(v20);
    v21 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = v21;
    *(_QWORD *)(v22 + 24) = v8;
    v32 = sub_247CD9F18;
    v33 = v22;
    v28 = v10;
    v29 = 1107296256;
    v30 = sub_247CD1570;
    v31 = &block_descriptor_73;
    v23 = _Block_copy(&v28);
    v24 = v8;
    swift_release();
    -[NSObject activateWithCompletion:](v24, sel_activateWithCompletion_, v23);
    _Block_release(v23);

  }
  else
  {
    if (qword_2576F1D08 != -1)
      swift_once();
    v25 = sub_247CEF598();
    __swift_project_value_buffer(v25, (uint64_t)qword_2576F4A00);
    v24 = sub_247CEF580();
    v26 = sub_247CEF6DC();
    if (os_log_type_enabled(v24, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_247CAF000, v24, v26, "Attempted to start SFSession, but peer device is nil", v27, 2u);
      MEMORY[0x249590A5C](v27, -1, -1);
    }
  }

}

void sub_247CD733C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25[3];

  v4 = sub_247CEF598();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a2 + 16;
  if (qword_2576F1D08 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A00);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v10, v4);
  v11 = a1;
  v12 = a1;
  v13 = sub_247CEF580();
  v14 = sub_247CEF6DC();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v25[0] = v16;
    *(_DWORD *)v15 = 136446210;
    v23 = a2 + 16;
    if (a1)
    {
      swift_getErrorValue();
      v17 = sub_247CEF8C8();
      v19 = v18;
    }
    else
    {
      v19 = 0xE300000000000000;
      v17 = 7104878;
    }
    v24 = sub_247CB5D84(v17, v19, v25);
    sub_247CEF748();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_247CAF000, v13, v14, "SFSession error: %{public}s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v16, -1, -1);
    MEMORY[0x249590A5C](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v9 = v23;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  swift_beginAccess();
  v20 = MEMORY[0x249590A98](v9);
  if (v20)
  {
    v21 = (void *)v20;
    sub_247CD83C8(a1);

  }
}

void sub_247CD75B8()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_2576F1D08 != -1)
    swift_once();
  v0 = sub_247CEF598();
  __swift_project_value_buffer(v0, (uint64_t)qword_2576F4A00);
  oslog = sub_247CEF580();
  v1 = sub_247CEF6E8();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_247CAF000, oslog, v1, "SFSession invalidated!", v2, 2u);
    MEMORY[0x249590A5C](v2, -1, -1);
  }

}

void sub_247CD7684(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  NSObject *v7;
  void (**v8)(uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;

  v1 = a1 + 16;
  if (qword_2576F1D08 != -1)
    swift_once();
  v2 = sub_247CEF598();
  __swift_project_value_buffer(v2, (uint64_t)qword_2576F4A00);
  v3 = sub_247CEF580();
  v4 = sub_247CEF6E8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_247CAF000, v3, v4, "SFSession interrupted", v5, 2u);
    MEMORY[0x249590A5C](v5, -1, -1);
  }

  swift_beginAccess();
  v6 = MEMORY[0x249590A98](v1);
  if (v6)
  {
    v7 = v6;
    v8 = (void (**)(uint64_t))(v6 + OBJC_IVAR___WFSetupClientInternal_interruptionHandler);
    swift_beginAccess();
    v9 = *v8;
    if (*v8)
    {
      v10 = swift_retain();
      v9(v10);

      sub_247CBDE58((uint64_t)v9);
      return;
    }
  }
  else
  {
    v7 = sub_247CEF580();
    v11 = sub_247CEF6DC();
    if (os_log_type_enabled(v7, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_247CAF000, v7, v11, "WFSetupClient is unexpectedly false", v12, 2u);
      MEMORY[0x249590A5C](v12, -1, -1);
    }
  }

}

void sub_247CD7840(unsigned int a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v7 = a4 + 16;
  swift_beginAccess();
  v8 = MEMORY[0x249590A98](v7);
  if (v8)
  {
    v9 = (void *)v8;
    sub_247CDEDDC(a1, a2, a3);

  }
}

void sub_247CD78B4(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = a3 + 16;
  swift_beginAccess();
  v6 = MEMORY[0x249590A98](v5);
  if (v6)
  {
    v7 = (void *)v6;
    sub_247CDF044(a2, a1);

  }
}

void sub_247CD7920(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x249590A98](v3);
  if (v4)
  {
    v5 = (void *)v4;
    sub_247CDF998(a1);

  }
}

void sub_247CD7978(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _BYTE *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char *v28;
  id v29;
  void **v30;
  void *v31;
  uint64_t v32;
  uint64_t v33[3];
  uint64_t v34[3];

  v3 = a2 + 16;
  if (a1)
  {
    if (qword_2576F1D08 != -1)
      swift_once();
    v5 = sub_247CEF598();
    __swift_project_value_buffer(v5, (uint64_t)qword_2576F4A00);
    v6 = a1;
    v7 = a1;
    v8 = sub_247CEF580();
    v9 = sub_247CEF6E8();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v34[0] = v11;
      *(_DWORD *)v10 = 136446210;
      swift_getErrorValue();
      v12 = sub_247CEF8C8();
      v33[0] = sub_247CB5D84(v12, v13, v34);
      sub_247CEF748();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_247CAF000, v8, v9, "SFSession activate failed with error: %{public}s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v11, -1, -1);
      MEMORY[0x249590A5C](v10, -1, -1);
    }
    else
    {

    }
    swift_beginAccess();
    v25 = MEMORY[0x249590A98](v3);
    if (v25)
    {
      v26 = (void *)v25;
      sub_247CD83C8(a1);
LABEL_20:

    }
  }
  else
  {
    swift_beginAccess();
    v15 = (_BYTE *)MEMORY[0x249590A98](v3);
    if (v15)
    {
      v15[OBJC_IVAR___WFSetupClientInternal_clientState + 4] = 1;

    }
    if (qword_2576F1D08 != -1)
      swift_once();
    v16 = sub_247CEF598();
    __swift_project_value_buffer(v16, (uint64_t)qword_2576F4A00);
    v17 = a3;
    v18 = sub_247CEF580();
    v19 = sub_247CEF6E8();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v33[0] = v21;
      *(_DWORD *)v20 = 136446210;
      v22 = objc_msgSend(v17, sel_messageSessionTemplate);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2800);
      v23 = sub_247CEF664();
      sub_247CB5D84(v23, v24, v33);
      sub_247CEF748();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v18, v19, "Setting message session template to %{public}s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v21, -1, -1);
      MEMORY[0x249590A5C](v20, -1, -1);

    }
    else
    {

    }
    swift_beginAccess();
    v27 = MEMORY[0x249590A98](v3);
    if (v27)
    {
      v28 = (char *)v27;
      v29 = objc_msgSend(v17, sel_messageSessionTemplate);
      v30 = (void **)&v28[OBJC_IVAR___WFSetupClientInternal_messageSessionTemplate];
      swift_beginAccess();
      v31 = *v30;
      *v30 = v29;

    }
    swift_beginAccess();
    v32 = MEMORY[0x249590A98](v3);
    if (v32)
    {
      v26 = (void *)v32;
      sub_247CD7DD0();
      goto LABEL_20;
    }
  }
}

void sub_247CD7DD0()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t inited;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t aBlock;
  unint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t, const void *);
  void *v35;
  void (*v36)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v37;

  if (qword_2576F1D08 != -1)
    swift_once();
  v1 = sub_247CEF598();
  __swift_project_value_buffer(v1, (uint64_t)qword_2576F4A00);
  v2 = sub_247CEF580();
  v3 = sub_247CEF6E8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_247CAF000, v2, v3, "SFSession activated", v4, 2u);
    MEMORY[0x249590A5C](v4, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247CF1040;
  sub_247CEF790();
  v6 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 96) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 72) = 1;
  aBlock = 0x746365726964;
  v33 = 0xE600000000000000;
  sub_247CEF790();
  *(_QWORD *)(inited + 168) = v6;
  *(_BYTE *)(inited + 144) = 1;
  sub_247CC0084(inited);
  v7 = *(void **)(v0 + OBJC_IVAR___WFSetupClientInternal_sfSession);
  if (v7)
  {
    v8 = v7;
    v9 = (void *)sub_247CEF64C();
    v10 = (void *)sub_247CEF604();
    v11 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v36 = sub_247CD9E44;
    v37 = v11;
    aBlock = MEMORY[0x24BDAC760];
    v33 = 1107296256;
    v34 = sub_247CD1884;
    v35 = &block_descriptor_28;
    v12 = _Block_copy(&aBlock);
    swift_release();
    -[NSObject registerRequestID:options:handler:](v8, sel_registerRequestID_options_handler_, v9, v10, v12);
    _Block_release(v12);

    v13 = (void *)sub_247CEF64C();
    v14 = (void *)sub_247CEF604();
    v15 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v36 = sub_247CD9E64;
    v37 = v15;
    v16 = MEMORY[0x24BDAC760];
    aBlock = MEMORY[0x24BDAC760];
    v33 = 1107296256;
    v34 = sub_247CD1884;
    v35 = &block_descriptor_32;
    v17 = _Block_copy(&aBlock);
    swift_release();
    -[NSObject registerRequestID:options:handler:](v8, sel_registerRequestID_options_handler_, v13, v14, v17);
    _Block_release(v17);

    v18 = (void *)sub_247CEF64C();
    v19 = (void *)sub_247CEF604();
    v20 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v36 = sub_247CD9E84;
    v37 = v20;
    aBlock = v16;
    v33 = 1107296256;
    v34 = sub_247CD1884;
    v35 = &block_descriptor_36;
    v21 = _Block_copy(&aBlock);
    swift_release();
    -[NSObject registerRequestID:options:handler:](v8, sel_registerRequestID_options_handler_, v18, v19, v21);
    _Block_release(v21);

    v22 = (void *)sub_247CEF64C();
    v23 = (void *)sub_247CEF604();
    swift_bridgeObjectRelease();
    v24 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v36 = sub_247CD9EA4;
    v37 = v24;
    aBlock = v16;
    v33 = 1107296256;
    v34 = sub_247CD1884;
    v35 = &block_descriptor_40;
    v25 = _Block_copy(&aBlock);
    swift_release();
    -[NSObject registerRequestID:options:handler:](v8, sel_registerRequestID_options_handler_, v22, v23, v25);
    _Block_release(v25);

    v26 = sub_247CEF580();
    v27 = sub_247CEF6E8();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_247CAF000, v26, v27, "Completed SFSessionActivated, attempting to advance connection state", v28, 2u);
      MEMORY[0x249590A5C](v28, -1, -1);
    }

    sub_247CD4C78(v29);
  }
  else
  {
    swift_bridgeObjectRelease();
    v8 = sub_247CEF580();
    v30 = sub_247CEF6DC();
    if (os_log_type_enabled(v8, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_247CAF000, v8, v30, "Unexpectedly found sfSession to be nil", v31, 2u);
      MEMORY[0x249590A5C](v31, -1, -1);
    }
  }

}

uint64_t sub_247CD83C8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void **v22;
  void **v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *boxed_opaque_existential_0;
  void *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t inited;
  unint64_t v80;
  _QWORD *v81;
  __int128 v83;
  char *v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89[3];
  ValueMetadata *v90;
  unint64_t v91;
  uint64_t v92;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  v6 = MEMORY[0x24BDAC7A8](v4, v5);
  v8 = (char *)&v83 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v6, v9);
  v12 = (char *)&v83 - v11;
  v14 = MEMORY[0x24BDAC7A8](v10, v13);
  v84 = (char *)&v83 - v15;
  MEMORY[0x24BDAC7A8](v14, v16);
  v85 = (uint64_t)&v83 - v17;
  v18 = sub_247CEF5E0();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18, v20);
  v22 = (void **)((char *)&v83 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v23 = (void **)(v2 + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
  swift_beginAccess();
  v24 = *v23;
  *v22 = *v23;
  (*(void (**)(void **, _QWORD, uint64_t))(v19 + 104))(v22, *MEMORY[0x24BEE5610], v18);
  v25 = v24;
  v26 = sub_247CEF5F8();
  (*(void (**)(void **, uint64_t))(v19 + 8))(v22, v18);
  if ((v26 & 1) != 0)
  {
    v26 = 0xD000000000000044;
    if (a1)
    {
      v27 = a1;
      if (qword_2576F1D08 == -1)
        goto LABEL_4;
      goto LABEL_31;
    }
    if (qword_2576F1D08 != -1)
      swift_once();
    v38 = sub_247CEF598();
    __swift_project_value_buffer(v38, (uint64_t)qword_2576F4A00);
    v39 = sub_247CEF580();
    v40 = sub_247CEF6E8();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_247CAF000, v39, v40, "Completed", v41, 2u);
      MEMORY[0x249590A5C](v41, -1, -1);
    }

    v42 = (uint64_t *)(v2 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler);
    swift_beginAccess();
    v44 = *v42;
    v43 = v42[1];
    sub_247CBDD44(v44);
    sub_247CE1FA0(1uLL, 0, 0, v44, v43);
    sub_247CBDE58(v44);
    v45 = *(void **)(v2 + OBJC_IVAR___WFSetupClientInternal_sfSession);
    if (v45)
    {
      v46 = objc_msgSend(v45, sel_identifier);
      if (v46)
      {
        v47 = v46;
        sub_247CEF544();

        v48 = sub_247CEF550();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v8, 0, 1, v48);
      }
      else
      {
        v48 = sub_247CEF550();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v8, 1, 1, v48);
      }
      sub_247CD9D08((uint64_t)v8, (uint64_t)v12);
      sub_247CEF550();
      v75 = *(_QWORD *)(v48 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v75 + 48))(v12, 1, v48) != 1)
      {
        v76 = sub_247CEF520();
        v77 = v78;
        (*(void (**)(char *, uint64_t))(v75 + 8))(v12, v48);
        goto LABEL_28;
      }
      sub_247CD9D50((uint64_t)v12);
    }
    v76 = 0;
    v77 = 0xE000000000000000;
LABEL_28:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2810);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247CF1020;
    *(_QWORD *)(inited + 32) = 0x646F43726F727265;
    *(_QWORD *)(inited + 40) = 0xE900000000000065;
    *(_QWORD *)(inited + 48) = 48;
    *(_QWORD *)(inited + 56) = 0xE100000000000000;
    v80 = sub_247CC0408(inited);
    v90 = &type metadata for DisconnectedProximitySetupClientAnalyticsEvent;
    v91 = sub_247CD9D90();
    v81 = (_QWORD *)swift_allocObject();
    v89[0] = (uint64_t)v81;
    v81[2] = 0xD000000000000044;
    v81[3] = 0x8000000247CF3BC0;
    v81[4] = v76;
    v81[5] = v77;
    v81[6] = v80;
    sub_247CDEA30(v89);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v89);
  }
  __break(1u);
LABEL_31:
  swift_once();
LABEL_4:
  v28 = sub_247CEF598();
  __swift_project_value_buffer(v28, (uint64_t)qword_2576F4A00);
  v29 = a1;
  v30 = a1;
  v31 = sub_247CEF580();
  v32 = sub_247CEF6E8();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    v34 = swift_slowAlloc();
    v89[0] = v34;
    *(_DWORD *)v33 = 136446210;
    swift_getErrorValue();
    v35 = sub_247CEF8C8();
    v92 = sub_247CB5D84(v35, v36, v89);
    sub_247CEF748();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_247CAF000, v31, v32, "Failed: %{public}s", v33, 0xCu);
    swift_arrayDestroy();
    v37 = v34;
    v26 = 0xD000000000000044;
    MEMORY[0x249590A5C](v37, -1, -1);
    MEMORY[0x249590A5C](v33, -1, -1);
  }
  else
  {

  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F27E8);
  v49 = swift_allocObject();
  v83 = xmmword_247CF1020;
  *(_OWORD *)(v49 + 16) = xmmword_247CF1020;
  *(_QWORD *)(v49 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v49 + 32) = 28517;
  *(_QWORD *)(v49 + 40) = 0xE200000000000000;
  swift_getErrorValue();
  v50 = v87;
  v51 = v88;
  *(_QWORD *)(v49 + 88) = v88;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v49 + 64));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 16))(boxed_opaque_existential_0, v50, v51);
  sub_247CBBA5C(0, (unint64_t *)&qword_2576F2DE0);
  v53 = (void *)sub_247CEF6D0();
  v54 = (uint64_t *)(v2 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler);
  swift_beginAccess();
  v56 = *v54;
  v55 = v54[1];
  sub_247CBDD44(v56);
  sub_247CE1FA0(1uLL, v53, 0, v56, v55);
  sub_247CBDE58(v56);

  v57 = *(void **)(v2 + OBJC_IVAR___WFSetupClientInternal_sfSession);
  if (v57)
  {
    v58 = objc_msgSend(v57, sel_identifier);
    if (v58)
    {
      v59 = v58;
      v60 = (uint64_t)v84;
      sub_247CEF544();

      v61 = sub_247CEF550();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56))(v60, 0, 1, v61);
    }
    else
    {
      v61 = sub_247CEF550();
      v60 = (uint64_t)v84;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56))(v84, 1, 1, v61);
    }
    v62 = v85;
    sub_247CD9D08(v60, v85);
    sub_247CEF550();
    v63 = *(_QWORD *)(v61 - 8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v63 + 48))(v62, 1, v61) != 1)
    {
      v64 = sub_247CEF520();
      v65 = v66;
      (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v62, v61);
      goto LABEL_22;
    }
    sub_247CD9D50(v62);
  }
  v64 = 0;
  v65 = 0xE000000000000000;
LABEL_22:
  v67 = (void *)sub_247CEF4CC();
  v68 = objc_msgSend(v67, sel_code);

  v86 = v68;
  v69 = sub_247CEF874();
  v71 = v70;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2810);
  v72 = swift_initStackObject();
  *(_OWORD *)(v72 + 16) = v83;
  *(_QWORD *)(v72 + 32) = 0x646F43726F727265;
  *(_QWORD *)(v72 + 40) = 0xE900000000000065;
  *(_QWORD *)(v72 + 48) = v69;
  *(_QWORD *)(v72 + 56) = v71;
  v73 = sub_247CC0408(v72);
  v90 = &type metadata for DisconnectedProximitySetupClientAnalyticsEvent;
  v91 = sub_247CD9D90();
  v74 = (_QWORD *)swift_allocObject();
  v89[0] = (uint64_t)v74;
  v74[2] = v26;
  v74[3] = 0x8000000247CF3BC0;
  v74[4] = v64;
  v74[5] = v65;
  v74[6] = v73;
  sub_247CDEA30(v89);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v89);
}

void sub_247CD8C5C()
{
  void (**v0)(char *, uint64_t);
  void (**v1)(char *, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  char *v23;
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _QWORD *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void (**v37)(char *, uint64_t);
  uint64_t aBlock[6];
  uint64_t v39;

  v1 = v0;
  v2 = sub_247CEF598();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576F1D08 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v2, (uint64_t)qword_2576F4A00);
  v8 = sub_247CEF580();
  v9 = sub_247CEF6E8();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v37 = v1;
    aBlock[0] = v11;
    v12 = v11;
    *(_DWORD *)v10 = 136446210;
    v39 = sub_247CB5D84(0xD000000000000011, 0x8000000247CF3BA0, aBlock);
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v8, v9, "%{public}s is invoked. ", v10, 0xCu);
    swift_arrayDestroy();
    v13 = v12;
    v1 = v37;
    MEMORY[0x249590A5C](v13, -1, -1);
    MEMORY[0x249590A5C](v10, -1, -1);
  }

  v14 = (char *)v1 + OBJC_IVAR___WFSetupClientInternal_clientState;
  if (*((_BYTE *)v1 + OBJC_IVAR___WFSetupClientInternal_clientState + 1))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v7, v2);
    v15 = v1;
    v16 = sub_247CEF580();
    v17 = sub_247CEF6E8();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = swift_slowAlloc();
      v19 = swift_slowAlloc();
      aBlock[0] = v19;
      *(_DWORD *)v18 = 136446466;
      v39 = sub_247CB5D84(0xD000000000000011, 0x8000000247CF3BA0, aBlock);
      v37 = (void (**)(char *, uint64_t))v3;
      sub_247CEF748();
      v20 = 8 * v14[1];
      v21 = *(_QWORD *)&aNotinitiinprog[v20];
      *(_WORD *)(v18 + 12) = 2080;
      v39 = sub_247CB5D84(v21, *(_QWORD *)&aAted[v20], aBlock);
      sub_247CEF748();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v16, v17, "%{public}s invoked but coreCDPSetupState is %s. Skipping setting up coreCDP approval server.", (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v19, -1, -1);
      MEMORY[0x249590A5C](v18, -1, -1);

      v37[1](v6, v2);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  else
  {
    v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE1A3F8]), sel_init);
    v23 = (char *)v1 + OBJC_IVAR___WFSetupClientInternal_messageSessionTemplate;
    swift_beginAccess();
    objc_msgSend(v22, sel_setSharingChannel_, *(_QWORD *)v23);
    v24 = v22;
    v25 = sub_247CEF580();
    v26 = sub_247CEF6E8();
    if (os_log_type_enabled(v25, v26))
    {
      v37 = (void (**)(char *, uint64_t))v7;
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v27 = 138412290;
      aBlock[0] = (uint64_t)v24;
      v29 = v24;
      sub_247CEF748();
      *v28 = v24;

      _os_log_impl(&dword_247CAF000, v25, v26, "Creating cdpStateController with context: %@", v27, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v28, -1, -1);
      MEMORY[0x249590A5C](v27, -1, -1);
    }
    else
    {

      v25 = v24;
    }

    v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE1A490]), sel_initWithContext_, v24);
    v31 = sub_247CEF580();
    v32 = sub_247CEF6E8();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_247CAF000, v31, v32, "Starting coreCDP approval server…", v33, 2u);
      MEMORY[0x249590A5C](v33, -1, -1);
    }

    if (v30)
    {
      v34 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = (uint64_t)sub_247CD9CF8;
      aBlock[5] = v34;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_247CD1974;
      aBlock[3] = (uint64_t)&block_descriptor_17;
      v35 = _Block_copy(aBlock);
      v36 = v30;
      swift_release();
      objc_msgSend(v36, sel_startCircleApplicationApprovalServer_, v35);

      _Block_release(v35);
    }
    else
    {

    }
  }
}

uint64_t sub_247CD928C(int a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  id v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  _BYTE *v41;
  char v42;
  uint64_t result;
  void *v44;
  id *v45;
  id v46;
  void *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t aBlock[6];
  uint64_t v58;

  v6 = sub_247CEF5A4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_247CEF5BC();
  v53 = *(_QWORD *)(v11 - 8);
  v54 = v11;
  MEMORY[0x24BDAC7A8](v11, v12);
  v52 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2576F1D08 != -1)
    swift_once();
  v55 = a3 + 16;
  v14 = sub_247CEF598();
  v15 = __swift_project_value_buffer(v14, (uint64_t)qword_2576F4A00);
  v16 = a2;
  v17 = a2;
  v18 = sub_247CEF580();
  v19 = sub_247CEF6E8();
  v20 = os_log_type_enabled(v18, v19);
  v51 = a3;
  if (v20)
  {
    v21 = swift_slowAlloc();
    v49 = v15;
    v22 = v21;
    v23 = swift_slowAlloc();
    aBlock[0] = v23;
    *(_DWORD *)v22 = 67109378;
    LODWORD(v58) = a1 & 1;
    sub_247CEF748();
    *(_WORD *)(v22 + 8) = 2080;
    LODWORD(v50) = a1;
    v58 = (uint64_t)a2;
    v24 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2838);
    v25 = sub_247CEF664();
    v58 = sub_247CB5D84(v25, v26, aBlock);
    v27 = v50;
    sub_247CEF748();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_247CAF000, v18, v19, "CDP approval server started with success: %{BOOL}d, error: %s", (uint8_t *)v22, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v23, -1, -1);
    MEMORY[0x249590A5C](v22, -1, -1);

    if ((v27 & 1) == 0)
      goto LABEL_5;
  }
  else
  {

    if ((a1 & 1) == 0)
    {
LABEL_5:
      v28 = a2;
      v29 = a2;
      v30 = sub_247CEF580();
      v31 = sub_247CEF6E8();
      if (os_log_type_enabled(v30, v31))
      {
        v50 = v6;
        v32 = (uint8_t *)swift_slowAlloc();
        v33 = swift_slowAlloc();
        aBlock[0] = v33;
        *(_DWORD *)v32 = 136446210;
        v58 = (uint64_t)a2;
        v34 = a2;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2838);
        v35 = sub_247CEF664();
        v58 = sub_247CB5D84(v35, v36, aBlock);
        v6 = v50;
        sub_247CEF748();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_247CAF000, v30, v31, "Setting the coreCDPSetupState to failed with error: %{public}s", v32, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v33, -1, -1);
        MEMORY[0x249590A5C](v32, -1, -1);
      }
      else
      {

      }
      v40 = v55;
      swift_beginAccess();
      v41 = (_BYTE *)MEMORY[0x249590A98](v40);
      if (v41)
      {
        v42 = 3;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
  }
  v37 = sub_247CEF580();
  v38 = sub_247CEF6E8();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v39 = 0;
    _os_log_impl(&dword_247CAF000, v37, v38, "Setting the coreCDPSetupState to succeeded", v39, 2u);
    MEMORY[0x249590A5C](v39, -1, -1);
  }

  v40 = v55;
  swift_beginAccess();
  v41 = (_BYTE *)MEMORY[0x249590A98](v40);
  if (v41)
  {
    v42 = 2;
LABEL_15:
    v41[OBJC_IVAR___WFSetupClientInternal_clientState + 1] = v42;

  }
LABEL_16:
  swift_beginAccess();
  result = MEMORY[0x249590A98](v40);
  if (result)
  {
    v44 = (void *)result;
    v45 = (id *)(result + OBJC_IVAR___WFSetupClientInternal_dispatchQueue);
    swift_beginAccess();
    v46 = *v45;

    aBlock[4] = (uint64_t)sub_247CD9D00;
    aBlock[5] = v51;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_247CBF050;
    aBlock[3] = (uint64_t)&block_descriptor_20;
    v47 = _Block_copy(aBlock);
    swift_retain();
    v48 = v52;
    sub_247CEF5B0();
    v56 = MEMORY[0x24BEE4AF8];
    sub_247CD9A18();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2718);
    sub_247CCCEE0();
    sub_247CEF76C();
    MEMORY[0x2495903B4](0, v48, v10, v47);
    _Block_release(v47);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v48, v54);
    return swift_release();
  }
  return result;
}

void sub_247CD98B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  void *v7;

  v1 = a1 + 16;
  if (qword_2576F1D08 != -1)
    swift_once();
  v2 = sub_247CEF598();
  __swift_project_value_buffer(v2, (uint64_t)qword_2576F4A00);
  v3 = sub_247CEF580();
  v4 = sub_247CEF6E8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_247CAF000, v3, v4, "Setup attempt of CoreCDP is complete, advancing connection state", v5, 2u);
    MEMORY[0x249590A5C](v5, -1, -1);
  }

  swift_beginAccess();
  v6 = MEMORY[0x249590A98](v1);
  if (v6)
  {
    v7 = (void *)v6;
    sub_247CD4C78(v6);

  }
}

uint64_t type metadata accessor for WFSetupClient()
{
  return objc_opt_self();
}

uint64_t sub_247CD99D4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_247CD99F8()
{
  uint64_t v0;

  sub_247CD352C(v0);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_247CD9A18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576F2710;
  if (!qword_2576F2710)
  {
    v1 = sub_247CEF5A4();
    result = MEMORY[0x2495909F0](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_2576F2710);
  }
  return result;
}

unint64_t sub_247CD9A60()
{
  unint64_t result;

  result = qword_2576F2A80;
  if (!qword_2576F2A80)
  {
    result = MEMORY[0x2495909F0](&unk_247CF1A54, &type metadata for WFSetupClient.WFSetupClientError);
    atomic_store(result, (unint64_t *)&qword_2576F2A80);
  }
  return result;
}

uint64_t sub_247CD9AA4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247CD9AC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_247CC07B4(a1, a2, a3, *(uint64_t (**)(uint64_t *, uint64_t *, uint64_t *))(v3 + 16));
}

uint64_t sub_247CD9AD0(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;

  return sub_247CC0788(a1, a2, a3, *(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v3 + 16));
}

void sub_247CD9AD8()
{
  uint64_t v0;

  sub_247CD4630(v0);
}

id sub_247CD9AE0@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR___WFSetupClientInternal_messageSessionTemplate);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

_QWORD *__swift_memcpy8_1(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for WFSetupClient.WFSetupClientState(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 2);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for WFSetupClient.WFSetupClientState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_BYTE *)(result + 2) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for WFSetupClient.WFSetupClientState()
{
  return &type metadata for WFSetupClient.WFSetupClientState;
}

uint64_t storeEnumTagSinglePayload for WFSetupClient.WFSetupClientError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_247CD9C30 + 4 * byte_247CF1955[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_247CD9C64 + 4 * byte_247CF1950[v4]))();
}

uint64_t sub_247CD9C64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CD9C6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247CD9C74);
  return result;
}

uint64_t sub_247CD9C80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247CD9C88);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_247CD9C8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CD9C94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WFSetupClient.WFSetupClientError()
{
  return &type metadata for WFSetupClient.WFSetupClientError;
}

unint64_t sub_247CD9CB4()
{
  unint64_t result;

  result = qword_2576F2AB0;
  if (!qword_2576F2AB0)
  {
    result = MEMORY[0x2495909F0](&unk_247CF1A04, &type metadata for WFSetupClient.WFSetupClientError);
    atomic_store(result, (unint64_t *)&qword_2576F2AB0);
  }
  return result;
}

uint64_t sub_247CD9CF8(int a1, void *a2)
{
  uint64_t v2;

  return sub_247CD928C(a1, a2, v2);
}

void sub_247CD9D00()
{
  uint64_t v0;

  sub_247CD98B0(v0);
}

uint64_t sub_247CD9D08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247CD9D50(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2728);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_247CD9D90()
{
  unint64_t result;

  result = qword_2576F2AB8;
  if (!qword_2576F2AB8)
  {
    result = MEMORY[0x2495909F0](&unk_247CF1818, &type metadata for DisconnectedProximitySetupClientAnalyticsEvent);
    atomic_store(result, (unint64_t *)&qword_2576F2AB8);
  }
  return result;
}

uint64_t sub_247CD9DD4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void sub_247CD9E44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_247CCA204(a1, a2, a3, a4, v4, (void (*)(uint64_t, uint64_t, uint64_t))sub_247CDFE14);
}

void sub_247CD9E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_247CCA204(a1, a2, a3, a4, v4, (void (*)(uint64_t, uint64_t, uint64_t))sub_247CDA538);
}

void sub_247CD9E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_247CCA204(a1, a2, a3, a4, v4, (void (*)(uint64_t, uint64_t, uint64_t))sub_247CE060C);
}

void sub_247CD9EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_247CCA204(a1, a2, a3, a4, v4, (void (*)(uint64_t, uint64_t, uint64_t))sub_247CE0B70);
}

void sub_247CD9EC4(void *a1)
{
  uint64_t v1;

  sub_247CD733C(a1, v1);
}

void sub_247CD9ECC()
{
  uint64_t v0;

  sub_247CD7684(v0);
}

void sub_247CD9ED4(unsigned int a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  sub_247CD7840(a1, a2, a3, v3);
}

void sub_247CD9EDC(int a1, uint64_t a2)
{
  uint64_t v2;

  sub_247CD78B4(a1, a2, v2);
}

void sub_247CD9EE4(void *a1)
{
  uint64_t v1;

  sub_247CD7920(a1, v1);
}

uint64_t sub_247CD9EEC()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_247CD9F18(void *a1)
{
  uint64_t v1;

  sub_247CD7978(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

const char *SFDeviceClassCodeToString(unsigned int a1)
{
  if (a1 > 8)
    return "?";
  else
    return off_25194E638[(char)a1];
}

__CFString *WFSetupProgressEventToString_0(unint64_t a1)
{
  __CFString *v1;
  __CFString *v2;

  if (a1 <= 0xF)
  {
    v1 = off_25194E700[a1];
    v2 = off_25194E680[a1];
  }
  return v1;
}

void sub_247CD9F88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = (id)sub_247CEF64C();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a1, v4);

}

void sub_247CD9FD8()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (id)sub_247CEF604();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t sub_247CDA034()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_247CDA058(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = (id)sub_247CEF604();
  (*(void (**)(uint64_t, uint64_t, id))(v3 + 16))(v3, a1, v4);

}

uint64_t sub_247CDA0C4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t storeEnumTagSinglePayload for WFSetupClient.WFSetupClientState.CDPSetupState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_247CDA11C + 4 * byte_247CF195F[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_247CDA150 + 4 * byte_247CF195A[v4]))();
}

uint64_t sub_247CDA150(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CDA158(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247CDA160);
  return result;
}

uint64_t sub_247CDA16C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247CDA174);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_247CDA178(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CDA180(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WFSetupClient.WFSetupClientState.CDPSetupState()
{
  return &type metadata for WFSetupClient.WFSetupClientState.CDPSetupState;
}

uint64_t storeEnumTagSinglePayload for WFSetupClient.WFSetupClientState.PreAuthState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_247CDA1E8 + 4 * byte_247CF1969[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_247CDA21C + 4 * byte_247CF1964[v4]))();
}

uint64_t sub_247CDA21C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CDA224(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247CDA22CLL);
  return result;
}

uint64_t sub_247CDA238(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247CDA240);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_247CDA244(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247CDA24C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WFSetupClient.WFSetupClientState.PreAuthState()
{
  return &type metadata for WFSetupClient.WFSetupClientState.PreAuthState;
}

unint64_t sub_247CDA26C()
{
  unint64_t result;

  result = qword_2576F2AC0;
  if (!qword_2576F2AC0)
  {
    result = MEMORY[0x2495909F0](&unk_247CF1B18, &type metadata for WFSetupClient.WFSetupClientState.PreAuthState);
    atomic_store(result, (unint64_t *)&qword_2576F2AC0);
  }
  return result;
}

unint64_t sub_247CDA2B4()
{
  unint64_t result;

  result = qword_2576F2AC8;
  if (!qword_2576F2AC8)
  {
    result = MEMORY[0x2495909F0](&unk_247CF1BA8, &type metadata for WFSetupClient.WFSetupClientState.CDPSetupState);
    atomic_store(result, (unint64_t *)&qword_2576F2AC8);
  }
  return result;
}

void sub_247CDA3F0(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_247CDA464@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  int v5;
  char v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11[2];

  result = sub_247CDBF24(a1);
  if ((v6 & 1) != 0)
    goto LABEL_7;
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
  {
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    v7 = sub_247CDBFAC(v11, result, v5, 0, a1);
    v8 = v11[0];
    v9 = v11[1];
    *(_QWORD *)a2 = v7;
    *(_QWORD *)(a2 + 8) = v10;
    *(_QWORD *)(a2 + 16) = v8;
    *(_QWORD *)(a2 + 24) = v9;
    swift_bridgeObjectRetain();
    sub_247CB5C7C(v8, v9);
    swift_bridgeObjectRelease();
    return sub_247CB6504(v8, v9);
  }
  return result;
}

void sub_247CDA538(uint64_t a1)
{
  char v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  _QWORD *v10;

  v1 = sub_247CDC04C(a1);
  v3 = v2;
  if (qword_2576F1CF0 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F49B8);
  v5 = v3;
  v6 = sub_247CEF580();
  v7 = sub_247CEF6E8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v9 = v5;
    sub_247CEF748();
    *v10 = v5;

    _os_log_impl(&dword_247CAF000, v6, v7, "Successfully retrieved anisette request: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v10, -1, -1);
    MEMORY[0x249590A5C](v8, -1, -1);

  }
  else
  {

  }
  __asm { BR              X10 }
}

uint64_t sub_247CDB1A8(char a1, uint64_t a2, void (*a3)(uint64_t, _QWORD, unint64_t))
{
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  objc_class *v10;
  char *v11;
  char *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  objc_super v19;
  __int128 v20;
  uint64_t v21;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247CF1020;
  *(_QWORD *)&v20 = 0xD00000000000001CLL;
  *((_QWORD *)&v20 + 1) = 0x8000000247CF3D80;
  v7 = MEMORY[0x24BEE0D00];
  sub_247CEF790();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2AD8);
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_247CF1020;
  strcpy((char *)(v8 + 32), "isProvisioned");
  *(_WORD *)(v8 + 46) = -4864;
  *(_QWORD *)(v8 + 72) = MEMORY[0x24BEE1328];
  *(_BYTE *)(v8 + 48) = a1;
  v9 = sub_247CC0640(v8);
  v10 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
  v11 = (char *)objc_allocWithZone(v10);
  v12 = &v11[OBJC_IVAR___WFAnisetteResponse_id];
  *(_QWORD *)v12 = 0x6F697369766F7270;
  *((_QWORD *)v12 + 1) = 0xE90000000000006ELL;
  *(_QWORD *)&v11[OBJC_IVAR___WFAnisetteResponse_data] = v9;
  v19.receiver = v11;
  v19.super_class = v10;
  v13 = objc_msgSendSuper2(&v19, sel_init);
  v14 = sub_247CECF48();
  v16 = v15;

  if (v16 >> 60 == 15)
  {
    *(_QWORD *)(inited + 96) = v7;
    *(_QWORD *)(inited + 72) = 0;
    *(_QWORD *)(inited + 80) = 0xE000000000000000;
  }
  else
  {
    v21 = MEMORY[0x24BDCDDE8];
    *(_QWORD *)&v20 = v14;
    *((_QWORD *)&v20 + 1) = v16;
    sub_247CCCFBC(&v20, (_OWORD *)(inited + 72));
  }
  v17 = sub_247CC0084(inited);
  a3(a2, 0, v17);
  return swift_bridgeObjectRelease();
}

uint64_t sub_247CDB38C(char a1, uint64_t a2, void (*a3)(uint64_t, _QWORD, unint64_t))
{
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  objc_class *v10;
  char *v11;
  char *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  objc_super v19;
  __int128 v20;
  uint64_t v21;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247CF1020;
  *(_QWORD *)&v20 = 0xD00000000000001CLL;
  *((_QWORD *)&v20 + 1) = 0x8000000247CF3D80;
  v7 = MEMORY[0x24BEE0D00];
  sub_247CEF790();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2AD8);
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_247CF1020;
  *(_QWORD *)(v8 + 32) = 0x6465636E79537369;
  *(_QWORD *)(v8 + 40) = 0xE800000000000000;
  *(_QWORD *)(v8 + 72) = MEMORY[0x24BEE1328];
  *(_BYTE *)(v8 + 48) = a1;
  v9 = sub_247CC0640(v8);
  v10 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
  v11 = (char *)objc_allocWithZone(v10);
  v12 = &v11[OBJC_IVAR___WFAnisetteResponse_id];
  *(_QWORD *)v12 = 1668184435;
  *((_QWORD *)v12 + 1) = 0xE400000000000000;
  *(_QWORD *)&v11[OBJC_IVAR___WFAnisetteResponse_data] = v9;
  v19.receiver = v11;
  v19.super_class = v10;
  v13 = objc_msgSendSuper2(&v19, sel_init);
  v14 = sub_247CECF48();
  v16 = v15;

  if (v16 >> 60 == 15)
  {
    *(_QWORD *)(inited + 96) = v7;
    *(_QWORD *)(inited + 72) = 0;
    *(_QWORD *)(inited + 80) = 0xE000000000000000;
  }
  else
  {
    v21 = MEMORY[0x24BDCDDE8];
    *(_QWORD *)&v20 = v14;
    *((_QWORD *)&v20 + 1) = v16;
    sub_247CCCFBC(&v20, (_OWORD *)(inited + 72));
  }
  v17 = sub_247CC0084(inited);
  a3(a2, 0, v17);
  return swift_bridgeObjectRelease();
}

uint64_t sub_247CDB558(char a1, uint64_t a2, void (*a3)(uint64_t, _QWORD, unint64_t))
{
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  objc_class *v10;
  char *v11;
  char *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  objc_super v19;
  __int128 v20;
  uint64_t v21;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247CF1020;
  *(_QWORD *)&v20 = 0xD00000000000001CLL;
  *((_QWORD *)&v20 + 1) = 0x8000000247CF3D80;
  v7 = MEMORY[0x24BEE0D00];
  sub_247CEF790();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2AD8);
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_247CF1020;
  *(_QWORD *)(v8 + 32) = 0x6465736172457369;
  *(_QWORD *)(v8 + 40) = 0xE800000000000000;
  *(_QWORD *)(v8 + 72) = MEMORY[0x24BEE1328];
  *(_BYTE *)(v8 + 48) = a1;
  v9 = sub_247CC0640(v8);
  v10 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
  v11 = (char *)objc_allocWithZone(v10);
  v12 = &v11[OBJC_IVAR___WFAnisetteResponse_id];
  *(_QWORD *)v12 = 0x6573617265;
  *((_QWORD *)v12 + 1) = 0xE500000000000000;
  *(_QWORD *)&v11[OBJC_IVAR___WFAnisetteResponse_data] = v9;
  v19.receiver = v11;
  v19.super_class = v10;
  v13 = objc_msgSendSuper2(&v19, sel_init);
  v14 = sub_247CECF48();
  v16 = v15;

  if (v16 >> 60 == 15)
  {
    *(_QWORD *)(inited + 96) = v7;
    *(_QWORD *)(inited + 72) = 0;
    *(_QWORD *)(inited + 80) = 0xE000000000000000;
  }
  else
  {
    v21 = MEMORY[0x24BDCDDE8];
    *(_QWORD *)&v20 = v14;
    *((_QWORD *)&v20 + 1) = v16;
    sub_247CCCFBC(&v20, (_OWORD *)(inited + 72));
  }
  v17 = sub_247CC0084(inited);
  a3(a2, 0, v17);
  return swift_bridgeObjectRelease();
}

uint64_t sub_247CDB728(void *a1, uint64_t a2, void (*a3)(uint64_t, _QWORD, unint64_t))
{
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  objc_class *v13;
  char *v14;
  char *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  objc_super v22;
  __int128 v23;
  uint64_t v24;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247CF1020;
  *(_QWORD *)&v23 = 0xD00000000000001CLL;
  *((_QWORD *)&v23 + 1) = 0x8000000247CF3D80;
  v7 = MEMORY[0x24BEE0D00];
  sub_247CEF790();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2AD8);
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_247CF1020;
  strcpy((char *)(v8 + 32), "anisetteData");
  *(_BYTE *)(v8 + 45) = 0;
  *(_WORD *)(v8 + 46) = -5120;
  if (a1)
  {
    v9 = sub_247CBBA5C(0, &qword_2576F2AE0);
    v10 = a1;
  }
  else
  {
    v10 = 0;
    v9 = 0;
    *(_QWORD *)(v8 + 56) = 0;
    *(_QWORD *)(v8 + 64) = 0;
  }
  *(_QWORD *)(v8 + 48) = v10;
  *(_QWORD *)(v8 + 72) = v9;
  v11 = a1;
  v12 = sub_247CC0640(v8);
  v13 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
  v14 = (char *)objc_allocWithZone(v13);
  v15 = &v14[OBJC_IVAR___WFAnisetteResponse_id];
  *(_QWORD *)v15 = 0x6863746566;
  *((_QWORD *)v15 + 1) = 0xE500000000000000;
  *(_QWORD *)&v14[OBJC_IVAR___WFAnisetteResponse_data] = v12;
  v22.receiver = v14;
  v22.super_class = v13;
  v16 = objc_msgSendSuper2(&v22, sel_init);
  v17 = sub_247CECF48();
  v19 = v18;

  if (v19 >> 60 == 15)
  {
    *(_QWORD *)(inited + 96) = v7;
    *(_QWORD *)(inited + 72) = 0;
    *(_QWORD *)(inited + 80) = 0xE000000000000000;
  }
  else
  {
    v24 = MEMORY[0x24BDCDDE8];
    *(_QWORD *)&v23 = v17;
    *((_QWORD *)&v23 + 1) = v19;
    sub_247CCCFBC(&v23, (_OWORD *)(inited + 72));
  }
  v20 = sub_247CC0084(inited);
  a3(a2, 0, v20);
  return swift_bridgeObjectRelease();
}

uint64_t sub_247CDB934(void *a1, uint64_t a2, void (*a3)(uint64_t, _QWORD, unint64_t))
{
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  objc_class *v13;
  char *v14;
  char *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  objc_super v22;
  __int128 v23;
  uint64_t v24;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247CF1020;
  *(_QWORD *)&v23 = 0xD00000000000001CLL;
  *((_QWORD *)&v23 + 1) = 0x8000000247CF3D80;
  v7 = MEMORY[0x24BEE0D00];
  sub_247CEF790();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2AD8);
  v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_247CF1020;
  strcpy((char *)(v8 + 32), "anisetteData");
  *(_BYTE *)(v8 + 45) = 0;
  *(_WORD *)(v8 + 46) = -5120;
  if (a1)
  {
    v9 = sub_247CBBA5C(0, &qword_2576F2AE0);
    v10 = a1;
  }
  else
  {
    v10 = 0;
    v9 = 0;
    *(_QWORD *)(v8 + 56) = 0;
    *(_QWORD *)(v8 + 64) = 0;
  }
  *(_QWORD *)(v8 + 48) = v10;
  *(_QWORD *)(v8 + 72) = v9;
  v11 = a1;
  v12 = sub_247CC0640(v8);
  v13 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
  v14 = (char *)objc_allocWithZone(v13);
  v15 = &v14[OBJC_IVAR___WFAnisetteResponse_id];
  *(_QWORD *)v15 = 0x79636167656CLL;
  *((_QWORD *)v15 + 1) = 0xE600000000000000;
  *(_QWORD *)&v14[OBJC_IVAR___WFAnisetteResponse_data] = v12;
  v22.receiver = v14;
  v22.super_class = v13;
  v16 = objc_msgSendSuper2(&v22, sel_init);
  v17 = sub_247CECF48();
  v19 = v18;

  if (v19 >> 60 == 15)
  {
    *(_QWORD *)(inited + 96) = v7;
    *(_QWORD *)(inited + 72) = 0;
    *(_QWORD *)(inited + 80) = 0xE000000000000000;
  }
  else
  {
    v24 = MEMORY[0x24BDCDDE8];
    *(_QWORD *)&v23 = v17;
    *((_QWORD *)&v23 + 1) = v19;
    sub_247CCCFBC(&v23, (_OWORD *)(inited + 72));
  }
  v20 = sub_247CC0084(inited);
  a3(a2, 0, v20);
  return swift_bridgeObjectRelease();
}

unint64_t sub_247CDBB40(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char *v6;
  unint64_t result;
  int64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _OWORD *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  char v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  _BYTE v27[40];
  _OWORD v28[2];
  _OWORD v29[2];
  uint64_t v30;
  _OWORD v31[2];
  _OWORD v32[2];
  uint64_t v33;

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2AF0);
    v2 = (_QWORD *)sub_247CEF838();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v25 = v1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(v1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(v1 + 64);
  v6 = (char *)v32 + 8;
  v24 = (unint64_t)(63 - v4) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v14 = (v5 - 1) & v5;
      v15 = __clz(__rbit64(v5)) | (v8 << 6);
      v16 = v8;
    }
    else
    {
      v17 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_40;
      if (v17 >= v24)
      {
LABEL_36:
        sub_247CCFC00();
        return (unint64_t)v2;
      }
      v18 = *(_QWORD *)(v25 + 8 * v17);
      v16 = v8 + 1;
      if (!v18)
      {
        v16 = v8 + 2;
        if (v8 + 2 >= v24)
          goto LABEL_36;
        v18 = *(_QWORD *)(v25 + 8 * v16);
        if (!v18)
        {
          v16 = v8 + 3;
          if (v8 + 3 >= v24)
            goto LABEL_36;
          v18 = *(_QWORD *)(v25 + 8 * v16);
          if (!v18)
          {
            v16 = v8 + 4;
            if (v8 + 4 >= v24)
              goto LABEL_36;
            v18 = *(_QWORD *)(v25 + 8 * v16);
            if (!v18)
            {
              v19 = v8 + 5;
              if (v8 + 5 >= v24)
                goto LABEL_36;
              v18 = *(_QWORD *)(v25 + 8 * v19);
              if (!v18)
              {
                while (1)
                {
                  v16 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_41;
                  if (v16 >= v24)
                    goto LABEL_36;
                  v18 = *(_QWORD *)(v25 + 8 * v16);
                  ++v19;
                  if (v18)
                    goto LABEL_26;
                }
              }
              v16 = v8 + 5;
            }
          }
        }
      }
LABEL_26:
      v14 = (v18 - 1) & v18;
      v15 = __clz(__rbit64(v18)) + (v16 << 6);
    }
    sub_247CCD898(*(_QWORD *)(v1 + 48) + 40 * v15, (uint64_t)v31);
    sub_247CB674C(*(_QWORD *)(v1 + 56) + 32 * v15, (uint64_t)v6);
    v29[0] = v32[0];
    v29[1] = v32[1];
    v30 = v33;
    v28[0] = v31[0];
    v28[1] = v31[1];
    sub_247CCD898((uint64_t)v28, (uint64_t)v27);
    if (!swift_dynamicCast())
    {
      sub_247CBCE98((uint64_t)v28, &qword_2576F2AF8);
      swift_bridgeObjectRelease();
LABEL_35:
      sub_247CCFC00();
      swift_release();
      return 0;
    }
    sub_247CB674C((uint64_t)v29 + 8, (uint64_t)v27);
    sub_247CBCE98((uint64_t)v28, &qword_2576F2AF8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      sub_247CB64F0(0, 0xF000000000000000);
      goto LABEL_35;
    }
    result = sub_247CDD1B8(v26, *((uint64_t *)&v26 + 1));
    if ((v20 & 1) != 0)
    {
      v9 = v1;
      v10 = v6;
      v11 = 16 * result;
      v12 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v12 = v26;
      v13 = v2[7] + v11;
      v6 = v10;
      v1 = v9;
      result = sub_247CB6504(*(_QWORD *)v13, *(_QWORD *)(v13 + 8));
      *(_OWORD *)v13 = v26;
      goto LABEL_8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v26;
    *(_OWORD *)(v2[7] + 16 * result) = v26;
    v21 = v2[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_39;
    v2[2] = v23;
LABEL_8:
    v8 = v16;
    v5 = v14;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_247CDBF24(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t *sub_247CDBFAC(uint64_t *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a5 + 48) + 16 * a2);
    v6 = (uint64_t *)(*(_QWORD *)(a5 + 56) + 16 * a2);
    v7 = *v6;
    v8 = v6[1];
    *result = *v6;
    result[1] = v8;
    swift_bridgeObjectRetain();
    sub_247CB5C7C(v7, v8);
    return (uint64_t *)v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_247CDC04C(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;

  if (!sub_247CDBB40(a1))
  {
    if (qword_2576F1CF0 != -1)
      swift_once();
    v4 = sub_247CEF598();
    __swift_project_value_buffer(v4, (uint64_t)qword_2576F49B8);
    swift_bridgeObjectRetain_n();
    v5 = sub_247CEF580();
    v6 = sub_247CEF6DC();
    v2 = v6;
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v58 = v8;
      *(_DWORD *)v7 = 136315138;
      v9 = sub_247CEF628();
      v62 = sub_247CB5D84(v9, v10, &v58);
      sub_247CEF748();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v5, (os_log_type_t)v2, "Failed to retrieve anisette data dict from request: %s", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v8, -1, -1);
      MEMORY[0x249590A5C](v7, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_247CDCA94();
    swift_allocError();
    v35 = xmmword_247CF1C60;
    goto LABEL_23;
  }
  v3 = swift_bridgeObjectRetain();
  sub_247CDA464(v3, (uint64_t)&v58);
  swift_bridgeObjectRelease();
  if (v59)
    sub_247CB6504(v60, v61);
  v11 = sub_247CED9A4();
  if (v11 == 5)
  {
    if (qword_2576F1CF0 != -1)
      swift_once();
    v12 = sub_247CEF598();
    __swift_project_value_buffer(v12, (uint64_t)qword_2576F49B8);
    swift_bridgeObjectRetain();
    v13 = sub_247CEF580();
    v14 = sub_247CEF6DC();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v2 = swift_slowAlloc();
      v58 = v2;
      *(_DWORD *)v15 = 136315138;
      v16 = sub_247CEF628();
      v62 = sub_247CB5D84(v16, v17, &v58);
      sub_247CEF748();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v13, v14, "Failed to retrieve anisette request data blob from: %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v2, -1, -1);
      MEMORY[0x249590A5C](v15, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_247CDCA94();
    swift_allocError();
    v35 = xmmword_247CF1C50;
LABEL_23:
    *(_OWORD *)v34 = v35;
    *(_BYTE *)(v34 + 16) = 5;
LABEL_24:
    swift_willThrow();
    return v2;
  }
  v2 = v11;
  v18 = swift_bridgeObjectRetain();
  sub_247CDA464(v18, (uint64_t)&v58);
  swift_bridgeObjectRelease();
  if (!v59)
  {
    if (qword_2576F1CF0 != -1)
      swift_once();
    v37 = sub_247CEF598();
    __swift_project_value_buffer(v37, (uint64_t)qword_2576F49B8);
    swift_bridgeObjectRetain();
    v38 = sub_247CEF580();
    v39 = sub_247CEF6DC();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      v41 = swift_slowAlloc();
      v58 = v41;
      *(_DWORD *)v40 = 136315138;
      v42 = sub_247CEF628();
      v62 = sub_247CB5D84(v42, v43, &v58);
      sub_247CEF748();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v38, v39, "Failed to retrieve anisette request data blob from: %s", v40, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v41, -1, -1);
      MEMORY[0x249590A5C](v40, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v44 = 8 * (char)v2;
    v45 = *(_QWORD *)&aProvisiosync[v44];
    v46 = *(_QWORD *)&aN[v44];
    sub_247CDCA94();
    swift_allocError();
    *(_QWORD *)v47 = v45;
    *(_QWORD *)(v47 + 8) = v46;
    *(_BYTE *)(v47 + 16) = 0;
    goto LABEL_24;
  }
  v19 = v60;
  v20 = v61;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247CBBA5C(0, &qword_2576F2AE8);
  type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
  v21 = sub_247CEF6F4();
  v22 = v1;
  if (!v1)
  {
    if (v21)
    {
      sub_247CB6504(v19, v20);
      return v2;
    }
    if (qword_2576F1CF0 != -1)
      swift_once();
    v48 = sub_247CEF598();
    __swift_project_value_buffer(v48, (uint64_t)qword_2576F49B8);
    sub_247CB5C7C(v19, v20);
    sub_247CB5C7C(v19, v20);
    v49 = sub_247CEF580();
    v50 = sub_247CEF6DC();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      v57 = swift_slowAlloc();
      v58 = v57;
      *(_DWORD *)v51 = 136315138;
      v52 = sub_247CEF4E4();
      v62 = sub_247CB5D84(v52, v53, &v58);
      sub_247CEF748();
      swift_bridgeObjectRelease();
      sub_247CB6504(v19, v20);
      sub_247CB6504(v19, v20);
      _os_log_impl(&dword_247CAF000, v49, v50, "Failed to unarchive anisette request from: %s", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v57, -1, -1);
      MEMORY[0x249590A5C](v51, -1, -1);
    }
    else
    {
      sub_247CB6504(v19, v20);
      sub_247CB6504(v19, v20);
    }

    v54 = 8 * (char)v2;
    v55 = *(_QWORD *)&aProvisiosync[v54];
    v2 = *(_QWORD *)&aN[v54];
    sub_247CDCA94();
    v22 = (void *)swift_allocError();
    *(_QWORD *)v56 = v55;
    *(_QWORD *)(v56 + 8) = v2;
    *(_BYTE *)(v56 + 16) = 2;
    swift_willThrow();
  }
  if (qword_2576F1CF0 != -1)
    swift_once();
  v23 = sub_247CEF598();
  __swift_project_value_buffer(v23, (uint64_t)qword_2576F49B8);
  sub_247CB5C7C(v19, v20);
  v24 = v22;
  sub_247CB5C7C(v19, v20);
  v25 = v22;
  v26 = sub_247CEF580();
  v27 = sub_247CEF6DC();
  if (os_log_type_enabled(v26, v27))
  {
    v2 = swift_slowAlloc();
    v28 = swift_slowAlloc();
    v58 = v28;
    *(_DWORD *)v2 = 136315394;
    v29 = sub_247CEF4E4();
    v62 = sub_247CB5D84(v29, v30, &v58);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CB6504(v19, v20);
    sub_247CB6504(v19, v20);
    *(_WORD *)(v2 + 12) = 2080;
    v62 = (uint64_t)v22;
    v31 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2DC0);
    v32 = sub_247CEF664();
    v62 = sub_247CB5D84(v32, v33, &v58);
    sub_247CEF748();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_247CAF000, v26, v27, "Failed to unarchive anisette request from: %s with error: %s", (uint8_t *)v2, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v28, -1, -1);
    MEMORY[0x249590A5C](v2, -1, -1);
  }
  else
  {
    sub_247CB6504(v19, v20);
    sub_247CB6504(v19, v20);

  }
  swift_willThrow();
  sub_247CB6504(v19, v20);
  return v2;
}

unint64_t sub_247CDCA94()
{
  unint64_t result;

  result = qword_2576F2AD0;
  if (!qword_2576F2AD0)
  {
    result = MEMORY[0x2495909F0](&unk_247CF1F60, &type metadata for WFSetupServerAnisetteDataProvider.AnisetteErrors);
    atomic_store(result, (unint64_t *)&qword_2576F2AD0);
  }
  return result;
}

uint64_t sub_247CDCAD8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247CDCAFC(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_247CDB934(a1, a2, *(void (**)(uint64_t, _QWORD, unint64_t))(v2 + 16));
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_247CDCB1C(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_247CDB728(a1, a2, *(void (**)(uint64_t, _QWORD, unint64_t))(v2 + 16));
}

uint64_t sub_247CDCB24(char a1, uint64_t a2)
{
  uint64_t v2;

  return sub_247CDB558(a1, a2, *(void (**)(uint64_t, _QWORD, unint64_t))(v2 + 16));
}

uint64_t sub_247CDCB2C(char a1, uint64_t a2)
{
  uint64_t v2;

  return sub_247CDB38C(a1, a2, *(void (**)(uint64_t, _QWORD, unint64_t))(v2 + 16));
}

uint64_t sub_247CDCB34(char a1, uint64_t a2)
{
  uint64_t v2;

  return sub_247CDB1A8(a1, a2, *(void (**)(uint64_t, _QWORD, unint64_t))(v2 + 16));
}

uint64_t static AnalyticsError.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t AnalyticsError.hash(into:)()
{
  return sub_247CEF91C();
}

uint64_t AnalyticsError.hashValue.getter()
{
  sub_247CEF910();
  sub_247CEF91C();
  return sub_247CEF928();
}

uint64_t sub_247CDCBD8()
{
  sub_247CEF910();
  sub_247CEF91C();
  return sub_247CEF928();
}

uint64_t sub_247CDCC18()
{
  return sub_247CEF91C();
}

uint64_t sub_247CDCC3C()
{
  sub_247CEF910();
  sub_247CEF91C();
  return sub_247CEF928();
}

unint64_t sub_247CDCC7C()
{
  unint64_t result;

  result = qword_2576F2B00;
  if (!qword_2576F2B00)
  {
    result = MEMORY[0x2495909F0](&protocol conformance descriptor for AnalyticsError, &type metadata for AnalyticsError);
    atomic_store(result, (unint64_t *)&qword_2576F2B00);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for AnalyticsError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_247CDCD00 + 4 * byte_247CF1CC0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_247CDCD20 + 4 * byte_247CF1CC5[v4]))();
}

_BYTE *sub_247CDCD00(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_247CDCD20(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247CDCD28(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247CDCD30(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247CDCD38(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247CDCD40(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AnalyticsError()
{
  return &type metadata for AnalyticsError;
}

unint64_t sub_247CDCD5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  NSObject *v24;
  os_log_type_t v25;
  int v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  os_log_t v31;
  uint8_t *v32;
  void *v33;
  uint64_t v34;
  uint8_t *v35;
  os_log_t v36;
  void *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  id v41[4];
  _BYTE v42[32];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v5 = *(_QWORD *)(a1 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1, a2);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6, v9);
  v11 = (char *)&v34 - v10;
  sub_247CEF46C();
  swift_allocObject();
  sub_247CEF460();
  v12 = sub_247CEF454();
  v14 = v13;
  swift_release();
  if (!v3)
  {
    v39 = v5;
    v16 = (void *)objc_opt_self();
    v17 = (void *)sub_247CEF4F0();
    v41[0] = 0;
    v18 = objc_msgSend(v16, sel_JSONObjectWithData_options_error_, v17, 0, v41);

    v19 = v41[0];
    if (v18)
    {
      sub_247CEF760();
      swift_unknownObjectRelease();
      sub_247CB674C((uint64_t)v42, (uint64_t)v41);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2BB0);
      if ((swift_dynamicCast() & 1) != 0)
      {
        sub_247CB6504(v12, v14);
        v14 = v40;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      }
      else
      {
        if (qword_2576F1D28 != -1)
          swift_once();
        v21 = sub_247CEF598();
        __swift_project_value_buffer(v21, (uint64_t)qword_2576F4A60);
        v22 = v39;
        v23 = *(void (**)(char *, uint64_t, uint64_t))(v39 + 16);
        v23(v11, v2, a1);
        v24 = sub_247CEF580();
        v25 = sub_247CEF6DC();
        v26 = v25;
        if (os_log_type_enabled(v24, v25))
        {
          v27 = swift_slowAlloc();
          v38 = v26;
          v28 = (uint8_t *)v27;
          v37 = (void *)swift_slowAlloc();
          v41[0] = v37;
          v35 = v28;
          v36 = v24;
          *(_DWORD *)v28 = 136315138;
          v23(v8, (uint64_t)v11, a1);
          v29 = sub_247CEF664();
          v40 = sub_247CB5D84(v29, v30, (uint64_t *)v41);
          sub_247CEF748();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v22 + 8))(v11, a1);
          v32 = v35;
          v31 = v36;
          _os_log_impl(&dword_247CAF000, v36, (os_log_type_t)v38, "Failed to encode object as [String: NSObject]: %s", v35, 0xCu);
          v33 = v37;
          swift_arrayDestroy();
          MEMORY[0x249590A5C](v33, -1, -1);
          MEMORY[0x249590A5C](v32, -1, -1);

        }
        else
        {
          (*(void (**)(char *, uint64_t))(v22 + 8))(v11, a1);

        }
        sub_247CDED98();
        swift_allocError();
        swift_willThrow();
        sub_247CB6504(v12, v14);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
      }
    }
    else
    {
      v20 = v19;
      sub_247CEF4D8();

      swift_willThrow();
      sub_247CB6504(v12, v14);
    }
  }
  return v14;
}

uint64_t sub_247CDD144()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AnalyticsManager()
{
  return objc_opt_self();
}

unint64_t sub_247CDD188(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_247CEF778();
  return sub_247CDD21C(a1, v2);
}

unint64_t sub_247CDD1B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_247CEF910();
  sub_247CEF670();
  v4 = sub_247CEF928();
  return sub_247CDD2E0(a1, a2, v4);
}

unint64_t sub_247CDD21C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_247CCD898(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x249590420](v9, a1);
      sub_247CCF0F4((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_247CDD2E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_247CEF88C() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_247CEF88C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_247CDD3C0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2850);
  v6 = sub_247CEF82C();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_247CCCFBC(v24, v35);
      }
      else
      {
        sub_247CB674C((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_247CEF910();
      sub_247CEF670();
      result = sub_247CEF928();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_247CCCFBC(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_247CDD6BC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2840);
  v6 = sub_247CEF82C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_34;
      v23 = *(_QWORD *)(v36 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v23 = *(_QWORD *)(v36 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v14 = v24;
      }
    }
LABEL_21:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((a2 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v40 = *(_QWORD *)(v25 + 32);
      v38 = v26;
      v39 = v27;
      sub_247CCCFBC((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_247CCD898(v25, (uint64_t)&v38);
      sub_247CB674C(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    result = sub_247CEF778();
    v28 = -1 << *(_BYTE *)(v7 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v7 + 48) + 40 * v15;
    v17 = v38;
    v18 = v39;
    *(_QWORD *)(v16 + 32) = v40;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    result = (uint64_t)sub_247CCCFBC(v37, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_247CDD9D0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F27C0);
  v38 = a2;
  v6 = sub_247CEF82C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_247CEF910();
    sub_247CEF670();
    result = sub_247CEF928();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

void *sub_247CDDCDC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2850);
  v2 = *v0;
  v3 = sub_247CEF820();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_247CB674C(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_247CCCFBC(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_247CDDEC0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2840);
  v2 = *v0;
  v3 = sub_247CEF820();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_247CCD898(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_247CB674C(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_247CCCFBC(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_247CDE0A4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F27C0);
  v2 = *v0;
  v3 = sub_247CEF820();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_247CDE254(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _QWORD *v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v46;
  char v47;
  char v48;
  _QWORD *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t result;
  void *v54;

  swift_bridgeObjectRetain();
  swift_retain();
  sub_247CDE594();
  if (!v8)
    goto LABEL_23;
  v10 = v7;
  v11 = v8;
  v54 = v9;
  v12 = (_QWORD *)*a5;
  v14 = sub_247CDD1B8(v7, v8);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v18 = v13;
  if (v12[3] >= v17)
  {
    if ((a4 & 1) != 0)
    {
      v21 = (_QWORD *)*a5;
      if ((v13 & 1) != 0)
        goto LABEL_9;
    }
    else
    {
      sub_247CDE0A4();
      v21 = (_QWORD *)*a5;
      if ((v18 & 1) != 0)
        goto LABEL_9;
    }
LABEL_11:
    v21[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v21[6] + 16 * v14);
    *v25 = v10;
    v25[1] = v11;
    *(_QWORD *)(v21[7] + 8 * v14) = v54;
    v26 = v21[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
    {
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
    v21[2] = v28;
LABEL_13:
    sub_247CDE594();
    if (v30)
    {
      v32 = v29;
      v33 = v30;
      v34 = v31;
      do
      {
        v41 = (_QWORD *)*a5;
        v42 = sub_247CDD1B8(v32, v33);
        v44 = v41[2];
        v45 = (v43 & 1) == 0;
        v27 = __OFADD__(v44, v45);
        v46 = v44 + v45;
        if (v27)
          goto LABEL_24;
        v47 = v43;
        if (v41[3] < v46)
        {
          sub_247CDD9D0(v46, 1);
          v42 = sub_247CDD1B8(v32, v33);
          if ((v47 & 1) != (v48 & 1))
            goto LABEL_26;
        }
        v49 = (_QWORD *)*a5;
        if ((v47 & 1) != 0)
        {
          v35 = 8 * v42;
          v36 = *(id *)(v49[7] + 8 * v42);
          swift_bridgeObjectRelease();

          v37 = v49[7];
          *(_QWORD *)(v37 + v35) = v36;
        }
        else
        {
          v49[(v42 >> 6) + 8] |= 1 << v42;
          v50 = (uint64_t *)(v49[6] + 16 * v42);
          *v50 = v32;
          v50[1] = v33;
          *(_QWORD *)(v49[7] + 8 * v42) = v34;
          v51 = v49[2];
          v27 = __OFADD__(v51, 1);
          v52 = v51 + 1;
          if (v27)
            goto LABEL_25;
          v49[2] = v52;
        }
        sub_247CDE594();
        v32 = v38;
        v33 = v39;
        v34 = v40;
      }
      while (v39);
    }
LABEL_23:
    swift_release();
    swift_bridgeObjectRelease();
    sub_247CCFC00();
    return swift_release();
  }
  sub_247CDD9D0(v17, a4 & 1);
  v19 = sub_247CDD1B8(v10, v11);
  if ((v18 & 1) == (v20 & 1))
  {
    v14 = v19;
    v21 = (_QWORD *)*a5;
    if ((v18 & 1) == 0)
      goto LABEL_11;
LABEL_9:
    v22 = 8 * v14;
    v23 = *(id *)(v21[7] + 8 * v14);
    swift_bridgeObjectRelease();

    v24 = v21[7];
    *(_QWORD *)(v24 + v22) = v23;
    goto LABEL_13;
  }
LABEL_26:
  result = sub_247CEF8BC();
  __break(1u);
  return result;
}

id sub_247CDE55C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id v4;

  v2 = a1[1];
  v4 = (id)a1[2];
  *a2 = *a1;
  a2[1] = v2;
  a2[2] = v4;
  swift_bridgeObjectRetain();
  return v4;
}

void sub_247CDE594()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (*v11)(uint64_t *__return_ptr, _QWORD *);
  id v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v8 = *v7;
    v9 = v7[1];
    v10 = *(void **)(*(_QWORD *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v11 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    v12 = v10;
    v11(&v19, v20);

    swift_bridgeObjectRelease();
    return;
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      v15 = v0[1];
      v16 = *(_QWORD *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        v5 = (v16 - 1) & v16;
        v6 = __clz(__rbit64(v16)) + (v13 << 6);
        v4 = v13;
        goto LABEL_3;
      }
      v17 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        v16 = *(_QWORD *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          v13 = v17;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          v16 = *(_QWORD *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            v13 = v3 + 3;
            goto LABEL_7;
          }
          v17 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            v16 = *(_QWORD *)(v15 + 8 * v17);
            if (v16)
              goto LABEL_10;
            v13 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              v16 = *(_QWORD *)(v15 + 8 * v13);
              if (v16)
                goto LABEL_7;
              v4 = v14 - 1;
              v18 = v3 + 6;
              while (v14 != v18)
              {
                v16 = *(_QWORD *)(v15 + 8 * v18++);
                if (v16)
                {
                  v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v0[3] = v4;
    v0[4] = 0;
  }
}

NSObject *sub_247CDE720(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD *v17;
  id v18;
  uint64_t v19;
  unint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  NSObject *v23;
  uint64_t v24[5];

  sub_247CC0528(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRelease();
  v3 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_0(a1, v3);
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v24[3] = AssociatedTypeWitness;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v24[4] = AssociatedConformanceWitness;
  __swift_allocate_boxed_opaque_existential_0(v24);
  v5(v3, v4);
  v8 = sub_247CDCD5C(AssociatedTypeWitness, AssociatedConformanceWitness);
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    if (qword_2576F1D28 != -1)
      swift_once();
    v12 = sub_247CEF598();
    __swift_project_value_buffer(v12, (uint64_t)qword_2576F4A60);
    v13 = v1;
    v14 = v1;
    v23 = sub_247CEF580();
    v15 = sub_247CEF6DC();
    if (os_log_type_enabled(v23, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v16 = 138543362;
      v18 = v1;
      v19 = _swift_stdlib_bridgeErrorToNSError();
      v24[0] = v19;
      sub_247CEF748();
      *v17 = v19;

      _os_log_impl(&dword_247CAF000, v23, v15, "Failed to generate dictionary from payload: %{public}@.", v16, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v17, -1, -1);
      MEMORY[0x249590A5C](v16, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
  }
  else
  {
    v9 = v8;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    v10 = a1[3];
    v11 = a1[4];
    __swift_project_boxed_opaque_existential_0(a1, v10);
    v21 = sub_247CDCD5C(v10, *(_QWORD *)(v11 + 8));
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v24[0] = v9;
    sub_247CDE254(v21, (uint64_t)sub_247CDE55C, 0, isUniquelyReferenced_nonNull_native, v24);
    v23 = v24[0];
    swift_bridgeObjectRelease();
  }
  return v23;
}

void sub_247CDEA30(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  sub_247CDE720(a1);
  if (!v1)
  {
    if (qword_2576F1D28 != -1)
      swift_once();
    v3 = sub_247CEF598();
    __swift_project_value_buffer(v3, (uint64_t)qword_2576F4A60);
    sub_247CDED18((uint64_t)a1, (uint64_t)v19);
    swift_bridgeObjectRetain_n();
    v4 = sub_247CEF580();
    v5 = sub_247CEF6E8();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = swift_slowAlloc();
      v18 = swift_slowAlloc();
      v22 = v18;
      *(_DWORD *)v6 = 136446466;
      v8 = v20;
      v7 = v21;
      __swift_project_boxed_opaque_existential_0(v19, v20);
      v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 32))(v8, v7);
      sub_247CB5D84(v9, v10, &v22);
      sub_247CEF748();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
      *(_WORD *)(v6 + 12) = 2082;
      sub_247CDED5C();
      swift_bridgeObjectRetain();
      v11 = sub_247CEF628();
      v13 = v12;
      swift_bridgeObjectRelease();
      sub_247CB5D84(v11, v13, &v22);
      sub_247CEF748();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v4, v5, "Sending analytics event \"%{public}s\" with payload %{public}s.", (uint8_t *)v6, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v18, -1, -1);
      MEMORY[0x249590A5C](v6, -1, -1);

    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);

      swift_bridgeObjectRelease_n();
    }
    v14 = a1[3];
    v15 = a1[4];
    __swift_project_boxed_opaque_existential_0(a1, v14);
    (*(void (**)(uint64_t, uint64_t))(v15 + 32))(v14, v15);
    v16 = (void *)sub_247CEF64C();
    sub_247CDED5C();
    v17 = (void *)sub_247CEF604();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_247CDED18(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_247CDED5C()
{
  unint64_t result;

  result = qword_2576F2BA8;
  if (!qword_2576F2BA8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2576F2BA8);
  }
  return result;
}

unint64_t sub_247CDED98()
{
  unint64_t result;

  result = qword_2576F2BB8;
  if (!qword_2576F2BB8)
  {
    result = MEMORY[0x2495909F0](&protocol conformance descriptor for AnalyticsError, &type metadata for AnalyticsError);
    atomic_store(result, (unint64_t *)&qword_2576F2BB8);
  }
  return result;
}

uint64_t sub_247CDEDDC(unsigned int a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD, uint64_t, unint64_t);
  uint64_t v16;
  uint64_t v17[3];

  v4 = v3;
  if (qword_2576F1D08 != -1)
    swift_once();
  v8 = sub_247CEF598();
  __swift_project_value_buffer(v8, (uint64_t)qword_2576F4A00);
  swift_bridgeObjectRetain_n();
  v9 = sub_247CEF580();
  v10 = sub_247CEF6E8();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v17[0] = v16;
    *(_DWORD *)v11 = 136446722;
    sub_247CB5D84(0xD00000000000001FLL, 0x8000000247CF3E40, v17);
    sub_247CEF748();
    *(_WORD *)(v11 + 12) = 1026;
    sub_247CEF748();
    *(_WORD *)(v11 + 18) = 2080;
    swift_bridgeObjectRetain();
    sub_247CB5D84(a2, a3, v17);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_247CAF000, v9, v10, "%{public}s invoked with pairing flags: %{public}u and pin: %s", (uint8_t *)v11, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v16, -1, -1);
    MEMORY[0x249590A5C](v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v12 = v4 + OBJC_IVAR___WFSetupClientInternal_showPinHandler;
  swift_beginAccess();
  v14 = *(void (**)(_QWORD, uint64_t, unint64_t))v12;
  v13 = *(_QWORD *)(v12 + 8);
  sub_247CCFF58(v14, v13);
  sub_247CE490C(a1, a2, a3, v14, v13);
  return sub_247CBDE58((uint64_t)v14);
}

void sub_247CDF044(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t inited;
  id v31;
  void *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  const char *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  void (**v47)(uint64_t);
  void (*v48)(uint64_t);
  uint64_t v49[5];
  __int128 v50;
  __int128 v51;

  v3 = v2;
  if (qword_2576F1D08 != -1)
    swift_once();
  v6 = sub_247CEF598();
  __swift_project_value_buffer(v6, (uint64_t)qword_2576F4A00);
  swift_bridgeObjectRetain();
  v7 = sub_247CEF580();
  v8 = sub_247CEF6E8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    *(_DWORD *)v9 = 67109376;
    LODWORD(v49[0]) = a2;
    sub_247CEF748();
    *(_WORD *)(v9 + 8) = 2048;
    v49[0] = *(_QWORD *)(a1 + 16);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v7, v8, "Received object, flags %u: %ld fields", (uint8_t *)v9, 0x12u);
    MEMORY[0x249590A5C](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  sub_247CEF790();
  if (*(_QWORD *)(a1 + 16) && (v10 = sub_247CDD188((uint64_t)v49), (v11 & 1) != 0))
  {
    sub_247CB674C(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)&v50);
  }
  else
  {
    v50 = 0u;
    v51 = 0u;
  }
  sub_247CCF0F4((uint64_t)v49);
  if (*((_QWORD *)&v51 + 1))
    swift_dynamicCast();
  else
    sub_247CB9318((uint64_t)&v50);
  v12 = (void *)sub_247CEF604();
  v13 = (void *)sub_247CEF64C();
  v14 = (id)NSDictionaryGetNSNumber();

  if (!v14)
  {
    __break(1u);
    return;
  }
  v15 = sub_247CEF904();

  if (v15 == 2)
  {
    if ((a2 & 1) == 0)
    {
      swift_bridgeObjectRetain_n();
      v37 = sub_247CEF580();
      v38 = sub_247CEF6E8();
      if (os_log_type_enabled(v37, v38))
      {
        v39 = (uint8_t *)swift_slowAlloc();
        v40 = swift_slowAlloc();
        v49[0] = v40;
        *(_DWORD *)v39 = 136315138;
        swift_bridgeObjectRetain();
        v41 = sub_247CEF628();
        v43 = v42;
        swift_bridgeObjectRelease();
        *(_QWORD *)&v50 = sub_247CB5D84(v41, v43, v49);
        sub_247CEF748();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247CAF000, v37, v38, "Ignoring unencrypted config response: %s", v39, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v40, -1, -1);
        MEMORY[0x249590A5C](v39, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    v44 = sub_247CEF580();
    v45 = sub_247CEF6E8();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v46 = 0;
      _os_log_impl(&dword_247CAF000, v44, v45, "Config response received", v46, 2u);
      MEMORY[0x249590A5C](v46, -1, -1);
    }

    sub_247CE1950();
    v47 = (void (**)(uint64_t))(v3 + OBJC_IVAR___WFSetupClientInternal_receivedObjectHandler);
    swift_beginAccess();
    v48 = *v47;
    if (*v47)
    {
      swift_retain();
      v48(a1);
      sub_247CBDE58((uint64_t)v48);
    }
    *(_BYTE *)(v3 + OBJC_IVAR___WFSetupClientInternal_clientState + 3) = 1;
    v33 = sub_247CEF580();
    v34 = sub_247CEF6E8();
    if (!os_log_type_enabled(v33, v34))
      goto LABEL_38;
    v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v35 = 0;
    v36 = "Handled received config response, advancing connection state";
    goto LABEL_37;
  }
  if (v15 == 4)
  {
    v23 = sub_247CEF580();
    v24 = sub_247CEF6E8();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_247CAF000, v23, v24, "PreAuth response received", v25, 2u);
      MEMORY[0x249590A5C](v25, -1, -1);
    }

    *(_BYTE *)(v3 + OBJC_IVAR___WFSetupClientInternal_clientState) = 2;
    v26 = (uint64_t *)(v3 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler);
    swift_beginAccess();
    v28 = *v26;
    v27 = v26[1];
    sub_247CCFF58(v28, v27);
    sub_247CE1FA0(0xBuLL, 0, 0, v28, v27);
    sub_247CBDE58(v28);
    v29 = *(void **)(v3 + OBJC_IVAR___WFSetupClientInternal_sfSession);
    if (v29)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_247CF1020;
      *(_QWORD *)&v50 = 28783;
      *((_QWORD *)&v50 + 1) = 0xE200000000000000;
      v31 = v29;
      sub_247CEF790();
      *(_QWORD *)(inited + 96) = MEMORY[0x24BEE3F88];
      *(_DWORD *)(inited + 72) = 4;
      sub_247CC0084(inited);
      v32 = (void *)sub_247CEF604();
      swift_bridgeObjectRelease();
      objc_msgSend(v31, sel_sendWithFlags_object_, 0, v32);

    }
    v33 = sub_247CEF580();
    v34 = sub_247CEF6E8();
    if (!os_log_type_enabled(v33, v34))
      goto LABEL_38;
    v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v35 = 0;
    v36 = "PreAuth response received signal sent to the server, advancing connection state";
LABEL_37:
    _os_log_impl(&dword_247CAF000, v33, v34, v36, v35, 2u);
    MEMORY[0x249590A5C](v35, -1, -1);
LABEL_38:

    sub_247CD4C78();
    return;
  }
  if (v15 == 5 && (a2 & 1) == 0)
  {
    swift_bridgeObjectRetain_n();
    v16 = sub_247CEF580();
    v17 = sub_247CEF6E8();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v49[0] = v19;
      *(_DWORD *)v18 = 136315138;
      swift_bridgeObjectRetain();
      v20 = sub_247CEF628();
      v22 = v21;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v50 = sub_247CB5D84(v20, v22, v49);
      sub_247CEF748();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v16, v17, "Ignoring unencrypted config message: %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v19, -1, -1);
      MEMORY[0x249590A5C](v18, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_247CDF998(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v32[3];

  v2 = v1;
  if (qword_2576F1D08 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A00);
  v5 = a1;
  v6 = a1;
  v7 = sub_247CEF580();
  v8 = sub_247CEF6E8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v32[0] = v10;
    *(_DWORD *)v9 = 136315394;
    sub_247CB5D84(0xD000000000000021, 0x8000000247CF3E10, v32);
    sub_247CEF748();
    *(_WORD *)(v9 + 12) = 2082;
    v11 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2838);
    v12 = sub_247CEF664();
    sub_247CB5D84(v12, v13, v32);
    sub_247CEF748();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_247CAF000, v7, v8, "%s invoked with error: %{public}s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v10, -1, -1);
    MEMORY[0x249590A5C](v9, -1, -1);

    if (a1)
    {
LABEL_5:
      v14 = a1;
      v15 = sub_247CEF580();
      v16 = sub_247CEF6E8();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_247CAF000, v15, v16, "Failed to establish encrypted channel.", v17, 2u);
        MEMORY[0x249590A5C](v17, -1, -1);
      }

      v18 = (uint64_t *)(v2 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler);
      swift_beginAccess();
      v20 = *v18;
      v19 = v18[1];
      sub_247CCFF58(v20, v19);
      sub_247CE1FA0(7uLL, 0, 0, v20, v19);
      sub_247CBDE58(v20);
      sub_247CD5A20(7uLL, (void (*)(_QWORD, _QWORD, _QWORD))sub_247CE1474, 0);

      goto LABEL_12;
    }
  }
  else
  {

    if (a1)
      goto LABEL_5;
  }
  v21 = sub_247CEF580();
  v22 = sub_247CEF6E8();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_247CAF000, v21, v22, "Successfully established encrypted channel. ", v23, 2u);
    MEMORY[0x249590A5C](v23, -1, -1);
  }

  v24 = (uint64_t *)(v2 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler);
  swift_beginAccess();
  v26 = *v24;
  v25 = v24[1];
  sub_247CCFF58(v26, v25);
  sub_247CE1FA0(6uLL, 0, 0, v26, v25);
  sub_247CBDE58(v26);
  sub_247CD5A20(6uLL, (void (*)(_QWORD, _QWORD, _QWORD))sub_247CE170C, 0);
  *(_BYTE *)(v2 + OBJC_IVAR___WFSetupClientInternal_clientState + 7) = 1;
LABEL_12:
  v27 = sub_247CEF580();
  v28 = sub_247CEF6E8();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_247CAF000, v27, v28, "Handling of pair setup is complete, advancing connection state now that we are securely paired", v29, 2u);
    MEMORY[0x249590A5C](v29, -1, -1);
  }

  return sub_247CD4C78(v30);
}

uint64_t sub_247CDFE14(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t *v25;
  os_log_type_t v26;
  uint8_t *v27;
  const char *v28;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char isUniquelyReferenced_nonNull_native;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(_QWORD, _QWORD, _QWORD);
  _OWORD v49[2];
  __int128 v50;
  uint64_t v51;
  uint64_t v52[6];

  v3 = v2;
  v5 = (void *)sub_247CEF604();
  v6 = (void *)sub_247CEF64C();
  v7 = (id)NSDictionaryGetNSNumber();

  if (!v7)
  {
    __break(1u);
    JUMPOUT(0x247CE05ECLL);
  }
  v8 = sub_247CEF934();

  v9 = sub_247CC0084(MEMORY[0x24BEE4AF8]);
  if (qword_2576F1D08 != -1)
    swift_once();
  v10 = sub_247CEF598();
  __swift_project_value_buffer(v10, (uint64_t)qword_2576F4A00);
  swift_bridgeObjectRetain_n();
  v11 = sub_247CEF580();
  v12 = sub_247CEF6E8();
  if (os_log_type_enabled(v11, v12))
  {
    v48 = a2;
    v13 = swift_slowAlloc();
    v47 = swift_slowAlloc();
    v52[0] = v47;
    *(_DWORD *)v13 = 136446466;
    SFSetupActionToString_0(v8);
    v14 = sub_247CEF688();
    sub_247CB5D84(v14, v15, v52);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2082;
    swift_bridgeObjectRetain();
    v16 = sub_247CEF628();
    v18 = v17;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v50 = sub_247CB5D84(v16, v18, v52);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v11, v12, "SetupActionRequest: %{public}s, %{public}s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v47, -1, -1);
    v19 = v13;
    a2 = v48;
    MEMORY[0x249590A5C](v19, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  switch(v8)
  {
    case 1u:
      v20 = sub_247CEF604();
      v21 = (uint64_t *)(v3 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler);
      swift_beginAccess();
      v23 = *v21;
      v22 = v21[1];
      sub_247CCFF58(v23, v22);
      v24 = 14;
      goto LABEL_10;
    case 2u:
      v20 = sub_247CEF604();
      v25 = (uint64_t *)(v3 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler);
      swift_beginAccess();
      v23 = *v25;
      v22 = v25[1];
      sub_247CCFF58(v23, v22);
      v24 = 13;
LABEL_10:
      sub_247CE1FA0(v24, v20, 0, v23, v22);
      sub_247CBDE58(v23);
      goto LABEL_18;
    case 3u:
      v20 = sub_247CEF580();
      v26 = sub_247CEF6E8();
      if (!os_log_type_enabled(v20, v26))
        goto LABEL_18;
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      v28 = "Unsupported SFSetupActionMigrateStart";
      break;
    case 4u:
      v20 = sub_247CEF580();
      v26 = sub_247CEF6E8();
      if (!os_log_type_enabled(v20, v26))
        goto LABEL_18;
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      v28 = "Unsupported Migrations stop";
      break;
    case 5u:
      v20 = sub_247CEF580();
      v26 = sub_247CEF6E8();
      if (!os_log_type_enabled(v20, v26))
        goto LABEL_18;
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      v28 = "Unsupported SFSetupActionSoftwareUpdate";
      break;
    case 8u:
      v37 = sub_247CEF580();
      v38 = sub_247CEF6E8();
      if (os_log_type_enabled(v37, v38))
      {
        v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_247CAF000, v37, v38, "Received setup action done from server", v39, 2u);
        MEMORY[0x249590A5C](v39, -1, -1);
      }

      *(_BYTE *)(v3 + OBJC_IVAR___WFSetupClientInternal_clientState + 6) = 1;
      v40 = (uint64_t *)(v3 + OBJC_IVAR___WFSetupClientInternal_setupProgressEventHandler);
      swift_beginAccess();
      v42 = *v40;
      v41 = v40[1];
      sub_247CCFF58(v42, v41);
      sub_247CE1FA0(0xFuLL, 0, 0, v42, v41);
      sub_247CBDE58(v42);
      v43 = sub_247CEF580();
      v44 = sub_247CEF6E8();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v45 = 0;
        _os_log_impl(&dword_247CAF000, v43, v44, "Handled setup action done, advancing connections state", v45, 2u);
        MEMORY[0x249590A5C](v45, -1, -1);
      }

      sub_247CD4C78(v46);
      goto LABEL_19;
    default:
      v30 = sub_247CEF580();
      v31 = sub_247CEF6E8();
      if (os_log_type_enabled(v30, v31))
      {
        v32 = (uint8_t *)swift_slowAlloc();
        v33 = swift_slowAlloc();
        v52[0] = v33;
        *(_DWORD *)v32 = 136446210;
        SFSetupActionToString_0(v8);
        v34 = sub_247CEF688();
        *(_QWORD *)&v50 = sub_247CB5D84(v34, v35, v52);
        sub_247CEF748();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247CAF000, v30, v31, "Unsupported SetupAction: %{public}s", v32, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v33, -1, -1);
        MEMORY[0x249590A5C](v32, -1, -1);
      }

      *((_QWORD *)&v50 + 1) = 0xE200000000000000;
      sub_247CEF790();
      v51 = MEMORY[0x24BEE3F88];
      *(_QWORD *)&v50 = 4294960589;
      sub_247CCCFBC(&v50, v49);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_247CCD1BC(v49, (uint64_t)v52, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      sub_247CCF0F4((uint64_t)v52);
      goto LABEL_19;
  }
  _os_log_impl(&dword_247CAF000, v20, v26, v28, v27, 2u);
  MEMORY[0x249590A5C](v27, -1, -1);
LABEL_18:

LABEL_19:
  a2(0, 0, v9);
  return swift_bridgeObjectRelease();
}

void sub_247CE060C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  uint64_t inited;
  unint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint8_t *v28;
  void *v29;
  _BYTE *v30;
  uint64_t v31;
  void (*v32)(_QWORD, _QWORD, _QWORD);
  uint64_t v33[5];
  __int128 v34;
  __int128 v35;

  v3 = v2;
  if (qword_2576F1D08 != -1)
    swift_once();
  v6 = sub_247CEF598();
  __swift_project_value_buffer(v6, (uint64_t)qword_2576F4A00);
  swift_bridgeObjectRetain_n();
  v7 = sub_247CEF580();
  v8 = sub_247CEF6E8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v31 = swift_slowAlloc();
    v33[0] = v31;
    *(_DWORD *)v9 = 136446466;
    *(_QWORD *)&v34 = sub_247CB5D84(0xD000000000000035, 0x8000000247CF3DD0, v33);
    sub_247CEF748();
    *(_WORD *)(v9 + 12) = 2082;
    swift_bridgeObjectRetain();
    v10 = sub_247CEF628();
    v12 = v11;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v34 = sub_247CB5D84(v10, v12, v33);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v7, v8, "%{public}s invoked with request: %{public}s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v31, -1, -1);
    MEMORY[0x249590A5C](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v13 = MEMORY[0x24BEE0D00];
  sub_247CEF790();
  if (*(_QWORD *)(a1 + 16) && (v14 = sub_247CDD188((uint64_t)v33), (v15 & 1) != 0))
  {
    sub_247CB674C(*(_QWORD *)(a1 + 56) + 32 * v14, (uint64_t)&v34);
  }
  else
  {
    v34 = 0u;
    v35 = 0u;
  }
  sub_247CCF0F4((uint64_t)v33);
  if (!*((_QWORD *)&v35 + 1))
  {
    sub_247CB9318((uint64_t)&v34);
LABEL_15:
    swift_bridgeObjectRetain_n();
    v21 = sub_247CEF580();
    v22 = sub_247CEF6DC();
    if (os_log_type_enabled(v21, v22))
    {
      v32 = a2;
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v33[0] = v24;
      *(_DWORD *)v23 = 136446210;
      swift_bridgeObjectRetain();
      v25 = sub_247CEF628();
      v27 = v26;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v34 = sub_247CB5D84(v25, v27, v33);
      sub_247CEF748();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v21, v22, "Failed to retrieve user server interaction event raw value from request: %{public}s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v24, -1, -1);
      v28 = v23;
      a2 = v32;
      MEMORY[0x249590A5C](v28, -1, -1);

      if (!v32)
        return;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      if (!a2)
        return;
    }
    sub_247CD9A60();
    v29 = (void *)swift_allocError();
    *v30 = 0;
    a2(v29, 0, 0);

    return;
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_15;
  v16 = v3 + OBJC_IVAR___WFSetupClientInternal_userInteractionProgressEventHandler;
  swift_beginAccess();
  v18 = *(void (**)(uint64_t))v16;
  v17 = *(_QWORD *)(v16 + 8);
  sub_247CCFF58(v18, v17);
  sub_247CE501C(0xD000000000000015, 0, v18, v17);
  sub_247CBDE58((uint64_t)v18);
  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247CF1020;
    *(_QWORD *)&v34 = 0;
    *((_QWORD *)&v34 + 1) = 0xE000000000000000;
    sub_247CEF790();
    *(_QWORD *)(inited + 96) = v13;
    *(_QWORD *)(inited + 72) = 0;
    *(_QWORD *)(inited + 80) = 0xE000000000000000;
    v20 = sub_247CC0084(inited);
    a2(0, 0, v20);
    swift_bridgeObjectRelease();
  }
}

void sub_247CE0B70(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  _BYTE *v24;
  uint64_t inited;
  unint64_t v26;
  void (*v27)(_QWORD, _QWORD, _QWORD);
  uint64_t v28[5];
  __int128 v29;
  __int128 v30;

  if (qword_2576F1D08 != -1)
    swift_once();
  v4 = sub_247CEF598();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576F4A00);
  swift_bridgeObjectRetain_n();
  v5 = sub_247CEF580();
  v6 = sub_247CEF6E8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v27 = a2;
    v8 = swift_slowAlloc();
    v28[0] = v8;
    *(_DWORD *)v7 = 136446466;
    *(_QWORD *)&v29 = sub_247CB5D84(0xD000000000000028, 0x8000000247CF3370, v28);
    sub_247CEF748();
    *(_WORD *)(v7 + 12) = 2080;
    swift_bridgeObjectRetain();
    v9 = sub_247CEF628();
    v11 = v10;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v29 = sub_247CB5D84(v9, v11, v28);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v5, v6, "%{public}s invoked with request: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    v12 = v8;
    a2 = v27;
    MEMORY[0x249590A5C](v12, -1, -1);
    MEMORY[0x249590A5C](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v13 = MEMORY[0x24BEE0D00];
  sub_247CEF790();
  if (*(_QWORD *)(a1 + 16) && (v14 = sub_247CDD188((uint64_t)v28), (v15 & 1) != 0))
  {
    sub_247CB674C(*(_QWORD *)(a1 + 56) + 32 * v14, (uint64_t)&v29);
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
  }
  sub_247CCF0F4((uint64_t)v28);
  if (*((_QWORD *)&v30 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
      return;
  }
  else
  {
    sub_247CB9318((uint64_t)&v29);
  }
  swift_bridgeObjectRetain_n();
  v16 = sub_247CEF580();
  v17 = sub_247CEF6DC();
  if (!os_log_type_enabled(v16, v17))
  {

    swift_bridgeObjectRelease_n();
    if (!a2)
      return;
    goto LABEL_18;
  }
  v18 = (uint8_t *)swift_slowAlloc();
  v19 = swift_slowAlloc();
  v28[0] = v19;
  *(_DWORD *)v18 = 136446210;
  swift_bridgeObjectRetain();
  v20 = sub_247CEF628();
  v22 = v21;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v29 = sub_247CB5D84(v20, v22, v28);
  sub_247CEF748();
  swift_bridgeObjectRelease_n();
  v13 = MEMORY[0x24BEE0D00];
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_247CAF000, v16, v17, "Failed to retrieve security event raw value from request: %{public}s", v18, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x249590A5C](v19, -1, -1);
  MEMORY[0x249590A5C](v18, -1, -1);

  if (a2)
  {
LABEL_18:
    sub_247CD9A60();
    v23 = (void *)swift_allocError();
    *v24 = 1;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247CF1020;
    v28[0] = 0;
    v28[1] = 0xE000000000000000;
    sub_247CEF790();
    *(_QWORD *)(inited + 96) = v13;
    *(_QWORD *)(inited + 72) = 0;
    *(_QWORD *)(inited + 80) = 0xE000000000000000;
    v26 = sub_247CC0084(inited);
    a2(v23, 0, v26);
    swift_bridgeObjectRelease();

  }
}

void sub_247CE1474(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *oslog;
  uint64_t v18;

  if (qword_2576F1D08 != -1)
    swift_once();
  v2 = sub_247CEF598();
  __swift_project_value_buffer(v2, (uint64_t)qword_2576F4A00);
  v3 = a1;
  v4 = a1;
  v5 = a1;
  v6 = a1;
  oslog = sub_247CEF580();
  v7 = sub_247CEF6E8();
  if (os_log_type_enabled(oslog, v7))
  {
    v8 = swift_slowAlloc();
    v9 = swift_slowAlloc();
    v18 = v9;
    *(_DWORD *)v8 = 136446722;
    v10 = WFSetupProgressEventToString_1(7uLL);
    v11 = sub_247CEF658();
    v13 = v12;

    sub_247CB5D84(v11, v13, &v18);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 1024;

    sub_247CEF748();
    *(_WORD *)(v8 + 18) = 2082;
    v14 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2838);
    v15 = sub_247CEF664();
    sub_247CB5D84(v15, v16, &v18);
    sub_247CEF748();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_247CAF000, oslog, v7, "Pairing event: (%{public}s sent with success: %{BOOL}d, error: %{public}s", (uint8_t *)v8, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v9, -1, -1);
    MEMORY[0x249590A5C](v8, -1, -1);

  }
  else
  {

  }
}

void sub_247CE170C(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *oslog;
  uint64_t v12;

  if (qword_2576F1D08 != -1)
    swift_once();
  v2 = sub_247CEF598();
  __swift_project_value_buffer(v2, (uint64_t)qword_2576F4A00);
  v3 = a1;
  v4 = a1;
  oslog = sub_247CEF580();
  v5 = sub_247CEF6E8();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    v12 = v7;
    *(_DWORD *)v6 = 67109378;
    sub_247CEF748();
    *(_WORD *)(v6 + 8) = 2082;
    v8 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2838);
    v9 = sub_247CEF664();
    sub_247CB5D84(v9, v10, &v12);
    sub_247CEF748();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_247CAF000, oslog, v5, "Pairing event sent with success: %{BOOL}d, error: %{public}s", (uint8_t *)v6, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v7, -1, -1);
    MEMORY[0x249590A5C](v6, -1, -1);

  }
  else
  {

  }
}

__CFString *WFSetupProgressEventToString_1(unint64_t a1)
{
  __CFString *v1;
  __CFString *v2;

  if (a1 <= 0xF)
  {
    v1 = off_25194EB48[a1];
    v2 = off_25194EAC8[a1];
  }
  return v1;
}

void sub_247CE1950()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (qword_2576F1D08 != -1)
    swift_once();
  v0 = sub_247CEF598();
  __swift_project_value_buffer(v0, (uint64_t)qword_2576F4A00);
  swift_bridgeObjectRetain_n();
  v1 = sub_247CEF580();
  v2 = sub_247CEF6E8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    v4 = swift_slowAlloc();
    v8 = v4;
    *(_DWORD *)v3 = 136315138;
    swift_bridgeObjectRetain();
    v5 = sub_247CEF628();
    v7 = v6;
    swift_bridgeObjectRelease();
    sub_247CB5D84(v5, v7, &v8);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v1, v2, "Received config response %s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v4, -1, -1);
    MEMORY[0x249590A5C](v3, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

const char *SFSetupActionToString_0(unsigned int a1)
{
  if (a1 > 0xA)
    return "?";
  else
    return off_25194EA70[a1];
}

uint64_t sub_247CE1B48()
{
  uint64_t v0;

  v0 = sub_247CEF598();
  __swift_allocate_value_buffer(v0, qword_2576F49B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2576F49B8);
  return sub_247CEF58C();
}

uint64_t sub_247CE1BC0()
{
  uint64_t v0;

  v0 = sub_247CEF598();
  __swift_allocate_value_buffer(v0, qword_2576F49D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2576F49D0);
  return sub_247CEF58C();
}

uint64_t sub_247CE1C40()
{
  uint64_t v0;

  v0 = sub_247CEF598();
  __swift_allocate_value_buffer(v0, qword_2576F49E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2576F49E8);
  return sub_247CEF58C();
}

uint64_t sub_247CE1CC0()
{
  uint64_t v0;

  v0 = sub_247CEF598();
  __swift_allocate_value_buffer(v0, qword_2576F4A00);
  __swift_project_value_buffer(v0, (uint64_t)qword_2576F4A00);
  return sub_247CEF58C();
}

uint64_t sub_247CE1D40()
{
  uint64_t v0;

  v0 = sub_247CEF598();
  __swift_allocate_value_buffer(v0, qword_2576F4A18);
  __swift_project_value_buffer(v0, (uint64_t)qword_2576F4A18);
  return sub_247CEF58C();
}

uint64_t sub_247CE1DBC()
{
  uint64_t v0;

  v0 = sub_247CEF598();
  __swift_allocate_value_buffer(v0, qword_2576F4A30);
  __swift_project_value_buffer(v0, (uint64_t)qword_2576F4A30);
  return sub_247CEF58C();
}

uint64_t sub_247CE1E3C()
{
  uint64_t v0;

  v0 = sub_247CEF598();
  __swift_allocate_value_buffer(v0, qword_2576F4A48);
  __swift_project_value_buffer(v0, (uint64_t)qword_2576F4A48);
  return sub_247CEF58C();
}

uint64_t sub_247CE1EB8()
{
  uint64_t v0;

  v0 = sub_247CEF598();
  __swift_allocate_value_buffer(v0, qword_2576F4A60);
  __swift_project_value_buffer(v0, (uint64_t)qword_2576F4A60);
  return sub_247CEF58C();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_247CE1F78(char a1)
{
  if ((a1 & 1) != 0)
    return 0x726576726573;
  else
    return 0x746E65696C63;
}

uint64_t sub_247CE1FA0(unint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  id v21;
  id v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  _BOOL4 v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(_QWORD *, _QWORD *);
  void (*v43)(char *, uint64_t, uint64_t);
  uint64_t v44;
  void (*v45)(unint64_t, uint64_t (*)(_QWORD *, _QWORD *));
  id v46;
  id v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  id v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t inited;
  uint64_t v72;
  unint64_t v73;
  NSObject *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  id v79;
  NSObject *v80;
  os_log_type_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  id v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  NSObject *v95;
  int v96;
  char *v97;
  void *v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  void (*v103)(char *, uint64_t, uint64_t);
  int v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t (*v110)(_QWORD *, _QWORD *);
  unint64_t v111;
  uint64_t v112[2];

  v109 = a5;
  v104 = a3;
  v107 = a1;
  v7 = sub_247CEF598();
  v8 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x24BDAC7A8](v7, v9);
  v12 = (char *)&v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v10, v13);
  v16 = (char *)&v95 - v15;
  MEMORY[0x24BDAC7A8](v14, v17);
  v19 = (char *)&v95 - v18;
  if (qword_2576F1D20 != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v7, (uint64_t)qword_2576F4A48);
  v103 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v103(v19, v20, v7);
  v21 = a2;
  sub_247CBDD44(a4);
  v22 = v21;
  sub_247CBDD44(a4);
  v23 = v19;
  v24 = sub_247CEF580();
  v106 = a4;
  v25 = (uint64_t)a2;
  v26 = v24;
  v27 = sub_247CEF6E8();
  v28 = os_log_type_enabled(v26, (os_log_type_t)v27);
  v105 = v7;
  v108 = v25;
  if (v28)
  {
    v96 = v27;
    v97 = v23;
    v95 = v26;
    v102 = v8;
    v99 = v12;
    v100 = v16;
    v101 = v20;
    v29 = swift_slowAlloc();
    v30 = swift_slowAlloc();
    v112[0] = v30;
    *(_DWORD *)v29 = 136316162;
    v110 = (uint64_t (*)(_QWORD *, _QWORD *))sub_247CB5D84(0xD00000000000001DLL, 0x8000000247CF4110, v112);
    sub_247CEF748();
    *(_WORD *)(v29 + 12) = 2080;
    v31 = WFSetupProgressEventToString_2(v107);
    v32 = v22;
    v33 = sub_247CEF658();
    v35 = v34;

    v110 = (uint64_t (*)(_QWORD *, _QWORD *))sub_247CB5D84(v33, v35, v112);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 22) = 2082;
    v110 = (uint64_t (*)(_QWORD *, _QWORD *))v25;
    v98 = v32;
    v36 = v32;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2C20);
    v37 = sub_247CEF664();
    v110 = (uint64_t (*)(_QWORD *, _QWORD *))sub_247CB5D84(v37, v38, v112);
    sub_247CEF748();

    swift_bridgeObjectRelease();
    *(_WORD *)(v29 + 32) = 2082;
    v39 = v106;
    if (v106)
    {
      v40 = swift_allocObject();
      v41 = v109;
      *(_QWORD *)(v40 + 16) = v39;
      *(_QWORD *)(v40 + 24) = v41;
      v42 = sub_247CE593C;
    }
    else
    {
      v42 = 0;
      v40 = 0;
    }
    v43 = v103;
    v75 = v95;
    v110 = v42;
    v111 = v40;
    sub_247CBDD44(v39);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C30);
    v76 = sub_247CEF664();
    v110 = (uint64_t (*)(_QWORD *, _QWORD *))sub_247CB5D84(v76, v77, v112);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CBDE58(v39);
    sub_247CBDE58(v39);
    *(_WORD *)(v29 + 42) = 2082;
    if ((v104 & 1) != 0)
      v78 = 0x726576726573;
    else
      v78 = 0x746E65696C63;
    v110 = (uint64_t (*)(_QWORD *, _QWORD *))sub_247CB5D84(v78, 0xE600000000000000, v112);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v75, (os_log_type_t)v96, "%s invoked with event: (%s, message: (%{public}s), handler: %{public}s, publisher: (%{public}s)", (uint8_t *)v29, 0x34u);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v30, -1, -1);
    MEMORY[0x249590A5C](v29, -1, -1);

    v7 = v105;
    v102 = *(_QWORD *)(v102 + 8);
    ((void (*)(char *, uint64_t))v102)(v97, v105);
    v44 = v108;
    v20 = v101;
    v16 = v100;
    v12 = v99;
    v22 = v98;
    if (!v39)
    {
LABEL_26:
      v43(v12, v20, v7);
      v79 = v22;
      v80 = sub_247CEF580();
      v81 = sub_247CEF6E8();
      if (os_log_type_enabled(v80, v81))
      {
        v82 = swift_slowAlloc();
        v109 = swift_slowAlloc();
        v110 = (uint64_t (*)(_QWORD *, _QWORD *))v109;
        *(_DWORD *)v82 = 136446722;
        if ((v104 & 1) != 0)
          v83 = 0x726576726573;
        else
          v83 = 0x746E65696C63;
        v112[0] = sub_247CB5D84(v83, 0xE600000000000000, (uint64_t *)&v110);
        v99 = v12;
        sub_247CEF748();
        swift_bridgeObjectRelease();
        *(_WORD *)(v82 + 12) = 2082;
        v84 = v44;
        v85 = WFSetupProgressEventToString_2(v107);
        v86 = sub_247CEF658();
        v88 = v87;

        v112[0] = sub_247CB5D84(v86, v88, (uint64_t *)&v110);
        sub_247CEF748();
        swift_bridgeObjectRelease();
        *(_WORD *)(v82 + 22) = 2082;
        v112[0] = v84;
        v89 = v79;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2C20);
        v90 = sub_247CEF664();
        v112[0] = sub_247CB5D84(v90, v91, (uint64_t *)&v110);
        sub_247CEF748();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247CAF000, v80, v81, "WFSetupProgressHandler is nil. %{public}s unable to publish event: %{public}s, with message: %{public}s", (uint8_t *)v82, 0x20u);
        v92 = v109;
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v92, -1, -1);
        MEMORY[0x249590A5C](v82, -1, -1);

        v93 = v99;
        v94 = v105;
      }
      else
      {

        v93 = v12;
        v94 = v7;
      }
      return ((uint64_t (*)(char *, uint64_t))v102)(v93, v94);
    }
  }
  else
  {

    v39 = v106;
    sub_247CBDE58(v106);
    sub_247CBDE58(v39);

    v102 = *(_QWORD *)(v8 + 8);
    ((void (*)(char *, uint64_t))v102)(v23, v7);
    v43 = v103;
    v44 = v108;
    if (!v39)
      goto LABEL_26;
  }
  v45 = (void (*)(unint64_t, uint64_t (*)(_QWORD *, _QWORD *)))v39;
  v43(v16, v20, v7);
  sub_247CBDD44(v39);
  v46 = v22;
  sub_247CBDD44(v39);
  v47 = v46;
  sub_247CBDD44(v39);
  v48 = sub_247CEF580();
  v49 = sub_247CEF6E8();
  if (os_log_type_enabled(v48, v49))
  {
    v50 = swift_slowAlloc();
    v101 = v20;
    v51 = v50;
    v106 = swift_slowAlloc();
    v112[0] = v106;
    *(_DWORD *)v51 = 136315650;
    if ((v104 & 1) != 0)
      v52 = 0x726576726573;
    else
      v52 = 0x746E65696C63;
    v110 = (uint64_t (*)(_QWORD *, _QWORD *))sub_247CB5D84(v52, 0xE600000000000000, v112);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    *(_WORD *)(v51 + 12) = 2082;
    v110 = (uint64_t (*)(_QWORD *, _QWORD *))v44;
    v53 = v47;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2C20);
    v54 = sub_247CEF664();
    v100 = v16;
    v110 = (uint64_t (*)(_QWORD *, _QWORD *))sub_247CB5D84(v54, v55, v112);
    sub_247CEF748();

    swift_bridgeObjectRelease();
    *(_WORD *)(v51 + 22) = 2082;
    v56 = swift_allocObject();
    v57 = v109;
    *(_QWORD *)(v56 + 16) = v45;
    *(_QWORD *)(v56 + 24) = v57;
    v110 = sub_247CE58DC;
    v111 = v56;
    sub_247CBDD44((uint64_t)v45);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2C28);
    v58 = sub_247CEF664();
    v110 = (uint64_t (*)(_QWORD *, _QWORD *))sub_247CB5D84(v58, v59, v112);
    sub_247CEF748();
    v44 = v108;
    swift_bridgeObjectRelease();
    sub_247CBDE58((uint64_t)v45);
    sub_247CBDE58((uint64_t)v45);
    _os_log_impl(&dword_247CAF000, v48, v49, "%s publishing message: %{public}s using handler: %{public}s", (uint8_t *)v51, 0x20u);
    v60 = v106;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v60, -1, -1);
    MEMORY[0x249590A5C](v51, -1, -1);

    v61 = v100;
    v62 = v105;
  }
  else
  {

    sub_247CBDE58((uint64_t)v45);
    sub_247CBDE58((uint64_t)v45);

    v61 = v16;
    v62 = v7;
  }
  ((void (*)(char *, uint64_t))v102)(v61, v62);
  if (v44 && (v110 = 0, sub_247CEF610(), v110))
  {
    v45(v107, v110);
  }
  else
  {
    v63 = v47;
    v64 = sub_247CEF580();
    v65 = sub_247CEF6DC();
    if (os_log_type_enabled(v64, v65))
    {
      v66 = (uint8_t *)swift_slowAlloc();
      v67 = swift_slowAlloc();
      v110 = (uint64_t (*)(_QWORD *, _QWORD *))v67;
      *(_DWORD *)v66 = 136446210;
      v112[0] = v44;
      v68 = v63;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2C20);
      v69 = sub_247CEF664();
      v112[0] = sub_247CB5D84(v69, v70, (uint64_t *)&v110);
      sub_247CEF748();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v64, v65, "Failed to convert message: %{public}s from NSDictionary to [AnyHashable: Any]", v66, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v67, -1, -1);
      MEMORY[0x249590A5C](v66, -1, -1);

    }
    else
    {

    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247CF1020;
    v110 = 0;
    v111 = 0xE000000000000000;
    v72 = MEMORY[0x24BEE0D00];
    sub_247CEF790();
    *(_QWORD *)(inited + 96) = v72;
    *(_QWORD *)(inited + 72) = 0;
    *(_QWORD *)(inited + 80) = 0xE000000000000000;
    v73 = sub_247CC0084(inited);
    v45(v107, (uint64_t (*)(_QWORD *, _QWORD *))v73);
  }
  swift_bridgeObjectRelease();
  return sub_247CBDE58((uint64_t)v45);
}

uint64_t sub_247CE2C08(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *);
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(_QWORD *);
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41[2];
  uint64_t v42;

  v40 = a4;
  v7 = sub_247CEF598();
  v8 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x24BDAC7A8](v7, v9);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v13);
  v15 = (char *)&v34 - v14;
  if (qword_2576F1D20 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v7, (uint64_t)qword_2576F4A48);
  v17 = *(void (**)(char *))(v8 + 16);
  v39 = v16;
  v17(v15);
  sub_247CBDD44((uint64_t)a1);
  sub_247CBDD44((uint64_t)a1);
  v18 = sub_247CEF580();
  v19 = sub_247CEF6E8();
  if (os_log_type_enabled(v18, v19))
  {
    v35 = v17;
    v37 = v12;
    v20 = swift_slowAlloc();
    v34 = swift_slowAlloc();
    v42 = v34;
    *(_DWORD *)v20 = 136446722;
    v41[0] = sub_247CB5D84(0xD00000000000001CLL, 0x8000000247CF40F0, &v42);
    sub_247CEF748();
    *(_WORD *)(v20 + 12) = 2082;
    v38 = v7;
    v36 = a3;
    if (a1)
    {
      v21 = swift_allocObject();
      *(_QWORD *)(v21 + 16) = a1;
      *(_QWORD *)(v21 + 24) = a2;
      v22 = sub_247CE5904;
    }
    else
    {
      v22 = 0;
      v21 = 0;
    }
    v41[0] = (uint64_t)v22;
    v41[1] = v21;
    sub_247CBDD44((uint64_t)a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2C18);
    v25 = sub_247CEF664();
    v41[0] = sub_247CB5D84(v25, v26, &v42);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CBDE58((uint64_t)a1);
    sub_247CBDE58((uint64_t)a1);
    *(_WORD *)(v20 + 22) = 2082;
    if ((v40 & 1) != 0)
      v27 = 0x726576726573;
    else
      v27 = 0x746E65696C63;
    v41[0] = sub_247CB5D84(v27, 0xE600000000000000, &v42);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v18, v19, "%{public}s invoked with handler: (%{public}s), publisher: %{public}s", (uint8_t *)v20, 0x20u);
    v28 = v34;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v28, -1, -1);
    MEMORY[0x249590A5C](v20, -1, -1);

    v23 = *(void (**)(char *, uint64_t))(v8 + 8);
    v7 = v38;
    v23(v15, v38);
    a3 = v36;
    v12 = v37;
    v17 = v35;
    if (!a1)
      goto LABEL_13;
LABEL_7:
    swift_retain();
    a1(a3);
    return sub_247CBDE58((uint64_t)a1);
  }
  sub_247CBDE58((uint64_t)a1);
  sub_247CBDE58((uint64_t)a1);

  v23 = *(void (**)(char *, uint64_t))(v8 + 8);
  v23(v15, v7);
  if (a1)
    goto LABEL_7;
LABEL_13:
  ((void (*)(char *, uint64_t, uint64_t))v17)(v12, v39, v7);
  v29 = sub_247CEF580();
  v30 = sub_247CEF6E8();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    *(_DWORD *)v31 = 136446210;
    v41[0] = v32;
    if ((v40 & 1) != 0)
      v33 = 0x726576726573;
    else
      v33 = 0x746E65696C63;
    v42 = sub_247CB5D84(v33, 0xE600000000000000, v41);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v29, v30, "Handler is nil. publisher: %{public}s Unable to publish completion event.", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v32, -1, -1);
    MEMORY[0x249590A5C](v31, -1, -1);
  }

  return ((uint64_t (*)(char *, uint64_t))v23)(v12, v7);
}

void sub_247CE30C8(uint64_t a1, uint64_t a2, int a3, void (*a4)(uint64_t, uint64_t), uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  void (*v19)(_QWORD);
  NSObject *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(unsigned int *, unsigned int *);
  void (*v27)(_BYTE *, uint64_t);
  _BYTE *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  os_log_type_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  _BYTE v53[12];
  int v54;
  uint64_t v55;
  _BYTE *v56;
  uint64_t v57;
  unsigned int v58;
  unsigned int v59;
  void (*v60)(_BYTE *, uint64_t, uint64_t);
  int v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v61 = a3;
  v9 = sub_247CEF598();
  v10 = *(_QWORD *)(v9 - 8);
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v14 = &v53[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v12, v15);
  v17 = &v53[-v16];
  if (qword_2576F1D20 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v9, (uint64_t)qword_2576F4A48);
  v19 = *(void (**)(_QWORD))(v10 + 16);
  v62 = v18;
  v60 = (void (*)(_BYTE *, uint64_t, uint64_t))v19;
  v19(v17);
  sub_247CBDD44((uint64_t)a4);
  sub_247CBDD44((uint64_t)a4);
  v20 = sub_247CEF580();
  v21 = sub_247CEF6E8();
  if (os_log_type_enabled(v20, (os_log_type_t)v21))
  {
    v54 = v21;
    v56 = v14;
    v57 = v9;
    v22 = swift_slowAlloc();
    v55 = swift_slowAlloc();
    v65 = v55;
    *(_DWORD *)v22 = 136446978;
    v63 = sub_247CB5D84(0xD000000000000018, 0x8000000247CF40B0, &v65);
    sub_247CEF748();
    *(_WORD *)(v22 + 12) = 2082;
    v58 = a1;
    v59 = a2;
    v63 = __PAIR64__(a2, a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2BE0);
    v23 = sub_247CEF664();
    v63 = sub_247CB5D84(v23, v24, &v65);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 22) = 2082;
    if (a4)
    {
      v25 = swift_allocObject();
      *(_QWORD *)(v25 + 16) = a4;
      *(_QWORD *)(v25 + 24) = a5;
      v26 = sub_247CE5938;
    }
    else
    {
      v26 = 0;
      v25 = 0;
    }
    v42 = v54;
    v63 = (unint64_t)v26;
    v64 = v25;
    sub_247CBDD44((uint64_t)a4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2BF0);
    v43 = sub_247CEF664();
    v63 = sub_247CB5D84(v43, v44, &v65);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CBDE58((uint64_t)a4);
    sub_247CBDE58((uint64_t)a4);
    *(_WORD *)(v22 + 32) = 2082;
    if ((v61 & 1) != 0)
      v45 = 0x726576726573;
    else
      v45 = 0x746E65696C63;
    v63 = sub_247CB5D84(v45, 0xE600000000000000, &v65);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v20, v42, "%{public}s invoked with event: %{public}s, handler: (%{public}s), publisher: (%{public}s)", (uint8_t *)v22, 0x2Au);
    v46 = v55;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v46, -1, -1);
    MEMORY[0x249590A5C](v22, -1, -1);

    v27 = *(void (**)(_BYTE *, uint64_t))(v10 + 8);
    v9 = v57;
    v27(v17, v57);
    a1 = v58;
    a2 = v59;
    v14 = v56;
    if (!a4)
      goto LABEL_19;
  }
  else
  {
    sub_247CBDE58((uint64_t)a4);
    sub_247CBDE58((uint64_t)a4);

    v27 = *(void (**)(_BYTE *, uint64_t))(v10 + 8);
    v27(v17, v9);
    if (!a4)
    {
LABEL_19:
      v47 = sub_247CEF580();
      v48 = sub_247CEF6E8();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = (uint8_t *)swift_slowAlloc();
        v50 = swift_slowAlloc();
        v63 = v50;
        *(_DWORD *)v49 = 136446210;
        v65 = __PAIR64__(a2, a1);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2BE0);
        v51 = sub_247CEF664();
        v65 = sub_247CB5D84(v51, v52, (uint64_t *)&v63);
        sub_247CEF748();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247CAF000, v47, v48, "WFSetupPromptPinHandler is nil. Unable to publish event: %{public}s", v49, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v50, -1, -1);
        MEMORY[0x249590A5C](v49, -1, -1);
      }

      return;
    }
  }
  v60(v14, v62, v9);
  swift_retain_n();
  v28 = v14;
  v29 = sub_247CEF580();
  v30 = sub_247CEF6E8();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = swift_slowAlloc();
    v56 = v28;
    v32 = v31;
    v62 = swift_slowAlloc();
    v65 = v62;
    *(_DWORD *)v32 = 136446722;
    if ((v61 & 1) != 0)
      v33 = 0x726576726573;
    else
      v33 = 0x746E65696C63;
    v57 = v9;
    v63 = sub_247CB5D84(v33, 0xE600000000000000, &v65);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2082;
    v63 = __PAIR64__(a2, a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2BE0);
    v59 = a2;
    v34 = sub_247CEF664();
    v58 = a1;
    v63 = sub_247CB5D84(v34, v35, &v65);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 22) = 2082;
    v36 = swift_allocObject();
    *(_QWORD *)(v36 + 16) = a4;
    *(_QWORD *)(v36 + 24) = a5;
    v63 = (unint64_t)sub_247CE5810;
    v64 = v36;
    sub_247CBDD44((uint64_t)a4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2BE8);
    v37 = sub_247CEF664();
    v63 = sub_247CB5D84(v37, v38, &v65);
    a2 = v59;
    sub_247CEF748();
    a1 = v58;
    swift_bridgeObjectRelease();
    sub_247CBDE58((uint64_t)a4);
    sub_247CBDE58((uint64_t)a4);
    _os_log_impl(&dword_247CAF000, v29, v30, "%{public}s publishing event: (%{public}s), using handler: (%{public}s)", (uint8_t *)v32, 0x20u);
    v39 = v62;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v39, -1, -1);
    MEMORY[0x249590A5C](v32, -1, -1);

    v40 = v56;
    v41 = v57;
  }
  else
  {
    sub_247CBDE58((uint64_t)a4);
    sub_247CBDE58((uint64_t)a4);

    v40 = v28;
    v41 = v9;
  }
  v27(v40, v41);
  a4(a1, a2);
  sub_247CBDE58((uint64_t)a4);
}

uint64_t sub_247CE381C(uint64_t a1, int a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  NSObject *v22;
  int v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(_QWORD *);
  void (*v31)(char *, uint64_t);
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  _QWORD v57[2];
  uint64_t v58;
  int v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, uint64_t, uint64_t);
  uint64_t (*v67)(_QWORD *);
  uint64_t v68;
  uint64_t v69;

  LODWORD(v64) = a2;
  v7 = sub_247CEF598();
  v8 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x24BDAC7A8](v7, v9);
  v12 = (char *)v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v10, v13);
  v16 = (char *)v57 - v15;
  MEMORY[0x24BDAC7A8](v14, v17);
  v19 = (char *)v57 - v18;
  if (qword_2576F1D20 != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v7, (uint64_t)qword_2576F4A48);
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v65 = v20;
  v66 = v21;
  ((void (*)(char *))v21)(v19);
  swift_bridgeObjectRetain();
  sub_247CBDD44((uint64_t)a3);
  swift_bridgeObjectRetain();
  sub_247CBDD44((uint64_t)a3);
  v22 = sub_247CEF580();
  v23 = sub_247CEF6E8();
  v24 = os_log_type_enabled(v22, (os_log_type_t)v23);
  v63 = v7;
  if (v24)
  {
    v59 = v23;
    v60 = v8;
    v61 = v12;
    v62 = v16;
    v25 = swift_slowAlloc();
    v58 = swift_slowAlloc();
    v69 = v58;
    *(_DWORD *)v25 = 136315906;
    v67 = (uint64_t (*)(_QWORD *))sub_247CB5D84(0xD000000000000018, 0x8000000247CF40B0, &v69);
    sub_247CEF748();
    *(_WORD *)(v25 + 12) = 2082;
    swift_bridgeObjectRetain();
    v57[1] = MEMORY[0x24BEE4AD8] + 8;
    v26 = sub_247CEF628();
    v28 = v27;
    swift_bridgeObjectRelease();
    v67 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v26, v28, &v69);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 22) = 2082;
    if (a3)
    {
      v29 = swift_allocObject();
      *(_QWORD *)(v29 + 16) = a3;
      *(_QWORD *)(v29 + 24) = a4;
      v30 = sub_247CE5904;
    }
    else
    {
      v30 = 0;
      v29 = 0;
    }
    v7 = v63;
    v67 = v30;
    v68 = v29;
    sub_247CBDD44((uint64_t)a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2C10);
    v44 = sub_247CEF664();
    v67 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v44, v45, &v69);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CBDE58((uint64_t)a3);
    sub_247CBDE58((uint64_t)a3);
    *(_WORD *)(v25 + 32) = 2082;
    if ((v64 & 1) != 0)
      v46 = 0x726576726573;
    else
      v46 = 0x746E65696C63;
    v67 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v46, 0xE600000000000000, &v69);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v22, (os_log_type_t)v59, "%s invoked with object: (%{public}s), handler: (%{public}s), publisher: (%{public}s)", (uint8_t *)v25, 0x2Au);
    v47 = v58;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v47, -1, -1);
    MEMORY[0x249590A5C](v25, -1, -1);

    v31 = *(void (**)(char *, uint64_t))(v60 + 8);
    v31(v19, v7);
    v12 = v61;
    v16 = v62;
    if (!a3)
      goto LABEL_19;
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_247CBDE58((uint64_t)a3);
    sub_247CBDE58((uint64_t)a3);

    v31 = *(void (**)(char *, uint64_t))(v8 + 8);
    v31(v19, v7);
    if (!a3)
    {
LABEL_19:
      v66(v12, v65, v7);
      swift_bridgeObjectRetain_n();
      v48 = sub_247CEF580();
      v49 = sub_247CEF6E8();
      if (os_log_type_enabled(v48, v49))
      {
        v50 = swift_slowAlloc();
        v51 = swift_slowAlloc();
        v61 = v12;
        v52 = v51;
        v67 = (uint64_t (*)(_QWORD *))v51;
        *(_DWORD *)v50 = 136446466;
        if ((v64 & 1) != 0)
          v53 = 0x726576726573;
        else
          v53 = 0x746E65696C63;
        v69 = sub_247CB5D84(v53, 0xE600000000000000, (uint64_t *)&v67);
        sub_247CEF748();
        swift_bridgeObjectRelease();
        *(_WORD *)(v50 + 12) = 2082;
        swift_bridgeObjectRetain();
        v66 = (void (*)(char *, uint64_t, uint64_t))v31;
        v54 = sub_247CEF628();
        v56 = v55;
        swift_bridgeObjectRelease();
        v69 = sub_247CB5D84(v54, v56, (uint64_t *)&v67);
        sub_247CEF748();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247CAF000, v48, v49, "ReceivedObjectHandler is nil. %{public}s unable to publish object: %{public}s", (uint8_t *)v50, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v52, -1, -1);
        MEMORY[0x249590A5C](v50, -1, -1);

        return ((uint64_t (*)(char *, uint64_t))v66)(v61, v63);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        return ((uint64_t (*)(char *, uint64_t))v31)(v12, v7);
      }
    }
  }
  v66(v16, v65, v7);
  sub_247CBDD44((uint64_t)a3);
  swift_bridgeObjectRetain();
  sub_247CBDD44((uint64_t)a3);
  swift_bridgeObjectRetain();
  sub_247CBDD44((uint64_t)a3);
  v32 = sub_247CEF580();
  v33 = sub_247CEF6E8();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = swift_slowAlloc();
    v65 = swift_slowAlloc();
    v69 = v65;
    *(_DWORD *)v34 = 136446722;
    if ((v64 & 1) != 0)
      v35 = 0x726576726573;
    else
      v35 = 0x746E65696C63;
    v62 = v16;
    v67 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v35, 0xE600000000000000, &v69);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2082;
    swift_bridgeObjectRetain();
    v64 = MEMORY[0x24BEE4AD8] + 8;
    v36 = sub_247CEF628();
    v66 = (void (*)(char *, uint64_t, uint64_t))v31;
    v38 = v37;
    swift_bridgeObjectRelease();
    v67 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v36, v38, &v69);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 22) = 2082;
    v39 = swift_allocObject();
    *(_QWORD *)(v39 + 16) = a3;
    *(_QWORD *)(v39 + 24) = a4;
    v67 = sub_247CE5878;
    v68 = v39;
    sub_247CBDD44((uint64_t)a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2C08);
    v40 = sub_247CEF664();
    v67 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v40, v41, &v69);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CBDE58((uint64_t)a3);
    sub_247CBDE58((uint64_t)a3);
    _os_log_impl(&dword_247CAF000, v32, v33, "%{public}s publishing object: (%{public}s), using handler: (%{public}s)", (uint8_t *)v34, 0x20u);
    v42 = v65;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v42, -1, -1);
    MEMORY[0x249590A5C](v34, -1, -1);

    ((void (*)(char *, uint64_t))v66)(v62, v63);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_247CBDE58((uint64_t)a3);
    sub_247CBDE58((uint64_t)a3);

    v31(v16, v7);
  }
  a3(a1);
  return sub_247CBDE58((uint64_t)a3);
}

uint64_t sub_247CE40F4(unint64_t a1, int a2, void (*a3)(unint64_t), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  NSObject *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(_QWORD *);
  void (*v31)(char *, uint64_t);
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  os_log_type_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  unint64_t v65;
  char *v66;
  int v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  void (*v71)(char *, uint64_t, uint64_t);
  uint64_t (*v72)(_QWORD *);
  uint64_t v73;
  uint64_t v74;

  v8 = sub_247CEF598();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v11, v14);
  v17 = (char *)&v61 - v16;
  MEMORY[0x24BDAC7A8](v15, v18);
  v20 = (char *)&v61 - v19;
  if (qword_2576F1D20 != -1)
    swift_once();
  v21 = __swift_project_value_buffer(v8, (uint64_t)qword_2576F4A48);
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v70 = v21;
  v71 = v22;
  ((void (*)(char *))v22)(v20);
  sub_247CBDD44((uint64_t)a3);
  sub_247CBDD44((uint64_t)a3);
  v23 = sub_247CEF580();
  v67 = sub_247CEF6E8();
  if (os_log_type_enabled(v23, (os_log_type_t)v67))
  {
    v63 = v9;
    v64 = a2;
    v66 = v13;
    v68 = v8;
    v69 = v17;
    v24 = swift_slowAlloc();
    v62 = swift_slowAlloc();
    v74 = v62;
    *(_DWORD *)v24 = 136315906;
    v72 = (uint64_t (*)(_QWORD *))sub_247CB5D84(0xD000000000000018, 0x8000000247CF40B0, &v74);
    sub_247CEF748();
    *(_WORD *)(v24 + 12) = 2082;
    v65 = a1;
    v25 = WFSetupClientUserInteractionProgressEventToString_0(a1);
    v26 = sub_247CEF658();
    v28 = v27;

    v72 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v26, v28, &v74);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 22) = 2082;
    if (a3)
    {
      v29 = swift_allocObject();
      *(_QWORD *)(v29 + 16) = a3;
      *(_QWORD *)(v29 + 24) = a4;
      v30 = sub_247CE5904;
    }
    else
    {
      v30 = 0;
      v29 = 0;
    }
    v8 = v68;
    v44 = v67;
    v72 = v30;
    v73 = v29;
    sub_247CBDD44((uint64_t)a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2C00);
    v45 = sub_247CEF664();
    v72 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v45, v46, &v74);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CBDE58((uint64_t)a3);
    sub_247CBDE58((uint64_t)a3);
    *(_WORD *)(v24 + 32) = 2082;
    LOBYTE(a2) = v64;
    if ((v64 & 1) != 0)
      v47 = 0x726576726573;
    else
      v47 = 0x746E65696C63;
    v72 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v47, 0xE600000000000000, &v74);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v23, v44, "%s invoked with event: (%{public}s), handler: (%{public}s), publisher: (%{public}s)", (uint8_t *)v24, 0x2Au);
    v48 = v62;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v48, -1, -1);
    MEMORY[0x249590A5C](v24, -1, -1);

    v31 = *(void (**)(char *, uint64_t))(v63 + 8);
    v31(v20, v8);
    a1 = v65;
    v13 = v66;
    v17 = v69;
    if (!a3)
      goto LABEL_19;
  }
  else
  {
    sub_247CBDE58((uint64_t)a3);
    sub_247CBDE58((uint64_t)a3);

    v31 = *(void (**)(char *, uint64_t))(v9 + 8);
    v31(v20, v8);
    if (!a3)
    {
LABEL_19:
      v71(v13, v70, v8);
      v49 = sub_247CEF580();
      v50 = sub_247CEF6E8();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = swift_slowAlloc();
        v66 = v13;
        v52 = v51;
        v53 = swift_slowAlloc();
        v72 = (uint64_t (*)(_QWORD *))v53;
        *(_DWORD *)v52 = 136446466;
        if ((a2 & 1) != 0)
          v54 = 0x726576726573;
        else
          v54 = 0x746E65696C63;
        v74 = sub_247CB5D84(v54, 0xE600000000000000, (uint64_t *)&v72);
        sub_247CEF748();
        swift_bridgeObjectRelease();
        *(_WORD *)(v52 + 12) = 2082;
        v55 = WFSetupClientUserInteractionProgressEventToString_0(a1);
        v56 = sub_247CEF658();
        v71 = (void (*)(char *, uint64_t, uint64_t))v31;
        v57 = v8;
        v58 = v56;
        v60 = v59;

        v74 = sub_247CB5D84(v58, v60, (uint64_t *)&v72);
        sub_247CEF748();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247CAF000, v49, v50, "WFSetupClientUserInteractionProgressEventHandler is nil. %{public}s unable to publish event: %{public}s", (uint8_t *)v52, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v53, -1, -1);
        MEMORY[0x249590A5C](v52, -1, -1);

        return ((uint64_t (*)(char *, uint64_t))v71)(v66, v57);
      }
      else
      {

        return ((uint64_t (*)(char *, uint64_t))v31)(v13, v8);
      }
    }
  }
  v71(v17, v70, v8);
  swift_retain_n();
  v32 = sub_247CEF580();
  v33 = sub_247CEF6E8();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = swift_slowAlloc();
    v35 = swift_slowAlloc();
    v68 = v8;
    v70 = v35;
    v74 = v35;
    *(_DWORD *)v34 = 136446722;
    if ((a2 & 1) != 0)
      v36 = 0x726576726573;
    else
      v36 = 0x746E65696C63;
    v69 = v17;
    v72 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v36, 0xE600000000000000, &v74);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 12) = 2082;
    v72 = (uint64_t (*)(_QWORD *))a1;
    type metadata accessor for WFSetupClientUserInteractionProgressEvent(0);
    v71 = (void (*)(char *, uint64_t, uint64_t))v31;
    v37 = sub_247CEF664();
    v72 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v37, v38, &v74);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    *(_WORD *)(v34 + 22) = 2082;
    v39 = swift_allocObject();
    *(_QWORD *)(v39 + 16) = a3;
    *(_QWORD *)(v39 + 24) = a4;
    v72 = sub_247CE5904;
    v73 = v39;
    sub_247CBDD44((uint64_t)a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2BF8);
    v40 = sub_247CEF664();
    v72 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v40, v41, &v74);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CBDE58((uint64_t)a3);
    sub_247CBDE58((uint64_t)a3);
    _os_log_impl(&dword_247CAF000, v32, v33, "%{public}s publishing event: (%{public}s), using handler: %{public}s", (uint8_t *)v34, 0x20u);
    v42 = v70;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v42, -1, -1);
    MEMORY[0x249590A5C](v34, -1, -1);

    ((void (*)(char *, uint64_t))v71)(v69, v68);
  }
  else
  {
    sub_247CBDE58((uint64_t)a3);
    sub_247CBDE58((uint64_t)a3);

    v31(v17, v8);
  }
  a3(a1);
  return sub_247CBDE58((uint64_t)a3);
}

void sub_247CE490C(unsigned int a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD, uint64_t, unint64_t), uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)();
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t (*v37)();
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  uint64_t (*v45)();
  uint64_t v46;
  uint64_t v47;

  v44 = a1;
  v9 = sub_247CEF598();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = qword_2576F1D20;
  swift_bridgeObjectRetain();
  if (v14 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v9, (uint64_t)qword_2576F4A48);
  swift_bridgeObjectRetain();
  sub_247CBDD44((uint64_t)a4);
  swift_bridgeObjectRetain();
  sub_247CBDD44((uint64_t)a4);
  v43 = v15;
  v16 = sub_247CEF580();
  v17 = sub_247CEF6E8();
  if (os_log_type_enabled(v16, v17))
  {
    v40 = v13;
    v41 = v10;
    v42 = v9;
    v18 = a2;
    v19 = swift_slowAlloc();
    v38 = swift_slowAlloc();
    v47 = v38;
    *(_DWORD *)v19 = 136446978;
    v45 = (uint64_t (*)())sub_247CB5D84(0xD000000000000013, 0x8000000247CF40D0, &v47);
    sub_247CEF748();
    *(_WORD *)(v19 + 12) = 2080;
    swift_bridgeObjectRetain();
    v39 = v18;
    v45 = (uint64_t (*)())sub_247CB5D84(v18, a3, &v47);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 22) = 1024;
    LODWORD(v45) = v44;
    sub_247CEF748();
    *(_WORD *)(v19 + 28) = 2082;
    if (a4)
    {
      v20 = swift_allocObject();
      *(_QWORD *)(v20 + 16) = a4;
      *(_QWORD *)(v20 + 24) = a5;
      v21 = sub_247CE57E0;
    }
    else
    {
      v21 = 0;
      v20 = 0;
    }
    v22 = v43;
    v45 = v21;
    v46 = v20;
    sub_247CBDD44((uint64_t)a4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2BD8);
    v31 = sub_247CEF664();
    v45 = (uint64_t (*)())sub_247CB5D84(v31, v32, &v47);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CBDE58((uint64_t)a4);
    sub_247CBDE58((uint64_t)a4);
    _os_log_impl(&dword_247CAF000, v16, v17, "%{public}s invoked with pin: %s, pairingFlags: %u, handler: (%{public}s", (uint8_t *)v19, 0x26u);
    v33 = v38;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v33, -1, -1);
    MEMORY[0x249590A5C](v19, -1, -1);

    a2 = v39;
    v13 = v40;
    v10 = v41;
    v9 = v42;
    if (!a4)
      goto LABEL_13;
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_247CBDE58((uint64_t)a4);
    sub_247CBDE58((uint64_t)a4);

    v22 = v43;
    if (!a4)
    {
LABEL_13:
      swift_bridgeObjectRetain();
      v34 = sub_247CEF580();
      v35 = sub_247CEF6E8();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)swift_slowAlloc();
        v37 = (uint64_t (*)())swift_slowAlloc();
        v45 = v37;
        *(_DWORD *)v36 = 136315138;
        swift_bridgeObjectRetain();
        v47 = sub_247CB5D84(a2, a3, (uint64_t *)&v45);
        sub_247CEF748();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_247CAF000, v34, v35, "WFSetupShowPinHandler is nil. Unable to publish pairing pin: %s", v36, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v37, -1, -1);
        MEMORY[0x249590A5C](v36, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      return;
    }
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v22, v9);
  sub_247CBDD44((uint64_t)a4);
  swift_bridgeObjectRetain();
  sub_247CBDD44((uint64_t)a4);
  swift_bridgeObjectRetain();
  sub_247CBDD44((uint64_t)a4);
  v23 = sub_247CEF580();
  v24 = sub_247CEF6E8();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = swift_slowAlloc();
    v42 = v9;
    v26 = v25;
    v43 = swift_slowAlloc();
    v47 = v43;
    *(_DWORD *)v26 = 136446722;
    v41 = v10;
    v45 = (uint64_t (*)())sub_247CB5D84(0x746E65696C63, 0xE600000000000000, &v47);
    v40 = v13;
    sub_247CEF748();
    *(_WORD *)(v26 + 12) = 2080;
    swift_bridgeObjectRetain();
    v45 = (uint64_t (*)())sub_247CB5D84(a2, a3, &v47);
    sub_247CEF748();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v26 + 22) = 2082;
    v27 = swift_allocObject();
    *(_QWORD *)(v27 + 16) = a4;
    *(_QWORD *)(v27 + 24) = a5;
    v45 = sub_247CE57E0;
    v46 = v27;
    sub_247CBDD44((uint64_t)a4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2BD0);
    v28 = sub_247CEF664();
    v45 = (uint64_t (*)())sub_247CB5D84(v28, v29, &v47);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CBDE58((uint64_t)a4);
    sub_247CBDE58((uint64_t)a4);
    _os_log_impl(&dword_247CAF000, v23, v24, "%{public}s publishing pairing pin: (%s), using handler: (%{public}s)", (uint8_t *)v26, 0x20u);
    v30 = v43;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v30, -1, -1);
    MEMORY[0x249590A5C](v26, -1, -1);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v40, v42);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_247CBDE58((uint64_t)a4);
    sub_247CBDE58((uint64_t)a4);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
  a4(v44, a2, a3);
  sub_247CBDE58((uint64_t)a4);
  swift_bridgeObjectRelease();
}

void sub_247CE501C(uint64_t a1, int a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  NSObject *v18;
  uint64_t v19;
  __CFString *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD *);
  void (*v26)(char *, uint64_t);
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  os_log_type_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  __CFString *v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t (*v62)(_QWORD *);
  uint64_t v63;
  uint64_t v64;

  v61 = a2;
  v7 = sub_247CEF598();
  v8 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x24BDAC7A8](v7, v9);
  v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10, v13);
  v15 = (char *)&v53 - v14;
  if (qword_2576F1D20 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v7, (uint64_t)qword_2576F4A48);
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v17(v15, v16, v7);
  sub_247CBDD44((uint64_t)a3);
  sub_247CBDD44((uint64_t)a3);
  v18 = sub_247CEF580();
  LODWORD(v57) = sub_247CEF6E8();
  if (os_log_type_enabled(v18, (os_log_type_t)v57))
  {
    v54 = v17;
    v55 = v16;
    v56 = v8;
    v58 = v12;
    v59 = v7;
    v19 = swift_slowAlloc();
    v53 = swift_slowAlloc();
    v64 = v53;
    *(_DWORD *)v19 = 136446978;
    v62 = (uint64_t (*)(_QWORD *))sub_247CB5D84(0xD000000000000018, 0x8000000247CF40B0, &v64);
    sub_247CEF748();
    *(_WORD *)(v19 + 12) = 2080;
    v60 = a1;
    v20 = WFSetupServerUserInteractionProgressEventToString(a1);
    v21 = sub_247CEF658();
    v23 = v22;

    v62 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v21, v23, &v64);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2082;
    if (a3)
    {
      v24 = swift_allocObject();
      *(_QWORD *)(v24 + 16) = a3;
      *(_QWORD *)(v24 + 24) = a4;
      v25 = sub_247CE5904;
    }
    else
    {
      v25 = 0;
      v24 = 0;
    }
    v40 = v57;
    v62 = v25;
    v63 = v24;
    sub_247CBDD44((uint64_t)a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2BC8);
    v41 = sub_247CEF664();
    v62 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v41, v42, &v64);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CBDE58((uint64_t)a3);
    sub_247CBDE58((uint64_t)a3);
    *(_WORD *)(v19 + 32) = 2082;
    if ((v61 & 1) != 0)
      v43 = 0x726576726573;
    else
      v43 = 0x746E65696C63;
    v62 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v43, 0xE600000000000000, &v64);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247CAF000, v18, v40, "%{public}s invoked with event: (%s), handler: (%{public}s), publisher: (%{public}s)", (uint8_t *)v19, 0x2Au);
    v44 = v53;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v44, -1, -1);
    MEMORY[0x249590A5C](v19, -1, -1);

    v26 = *(void (**)(char *, uint64_t))(v56 + 8);
    v7 = v59;
    v26(v15, v59);
    a1 = v60;
    v12 = v58;
    v17 = v54;
    v16 = v55;
    if (!a3)
      goto LABEL_19;
  }
  else
  {
    sub_247CBDE58((uint64_t)a3);
    sub_247CBDE58((uint64_t)a3);

    v26 = *(void (**)(char *, uint64_t))(v8 + 8);
    v26(v15, v7);
    if (!a3)
    {
LABEL_19:
      v45 = sub_247CEF580();
      v46 = sub_247CEF6E8();
      if (os_log_type_enabled(v45, v46))
      {
        v47 = (uint8_t *)swift_slowAlloc();
        v48 = swift_slowAlloc();
        v62 = (uint64_t (*)(_QWORD *))v48;
        *(_DWORD *)v47 = 136446210;
        v49 = WFSetupServerUserInteractionProgressEventToString(a1);
        v50 = sub_247CEF658();
        v52 = v51;

        v64 = sub_247CB5D84(v50, v52, (uint64_t *)&v62);
        sub_247CEF748();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247CAF000, v45, v46, "WFSetupServerUserInteractionProgressEventHandler is nil. Unable to publish event: (%{public}s)", v47, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x249590A5C](v48, -1, -1);
        MEMORY[0x249590A5C](v47, -1, -1);
      }

      return;
    }
  }
  v17(v12, v16, v7);
  swift_retain_n();
  v27 = sub_247CEF580();
  v28 = sub_247CEF6E8();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = swift_slowAlloc();
    v59 = v7;
    v30 = v29;
    v57 = swift_slowAlloc();
    v64 = v57;
    *(_DWORD *)v30 = 136446722;
    if ((v61 & 1) != 0)
      v31 = 0x726576726573;
    else
      v31 = 0x746E65696C63;
    v58 = v12;
    v62 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v31, 0xE600000000000000, &v64);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2082;
    v62 = (uint64_t (*)(_QWORD *))a1;
    type metadata accessor for WFSetupServerUserInteractionProgressEvent(0);
    v60 = a1;
    v32 = sub_247CEF664();
    v62 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v32, v33, &v64);
    sub_247CEF748();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 22) = 2082;
    v34 = swift_allocObject();
    *(_QWORD *)(v34 + 16) = a3;
    *(_QWORD *)(v34 + 24) = a4;
    v62 = sub_247CE5904;
    v63 = v34;
    sub_247CBDD44((uint64_t)a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2BC0);
    v35 = sub_247CEF664();
    v62 = (uint64_t (*)(_QWORD *))sub_247CB5D84(v35, v36, &v64);
    a1 = v60;
    sub_247CEF748();
    swift_bridgeObjectRelease();
    sub_247CBDE58((uint64_t)a3);
    sub_247CBDE58((uint64_t)a3);
    _os_log_impl(&dword_247CAF000, v27, v28, "%{public}s publishing event: (%{public}s), using handler: (%{public}s)", (uint8_t *)v30, 0x20u);
    v37 = v57;
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v37, -1, -1);
    MEMORY[0x249590A5C](v30, -1, -1);

    v38 = v58;
    v39 = v59;
  }
  else
  {
    sub_247CBDE58((uint64_t)a3);
    sub_247CBDE58((uint64_t)a3);

    v38 = v12;
    v39 = v7;
  }
  v26(v38, v39);
  a3(a1);
  sub_247CBDE58((uint64_t)a3);
}

__CFString *WFSetupServerUserInteractionProgressEventToString(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;

  if (!a1)
  {
    v1 = CFSTR("WFSetupServerUserInteractionProgressEventBeganInteractingWithDevice");
    goto LABEL_5;
  }
  if (a1 == 1)
  {
    v1 = CFSTR("WFSetupServerUserInteractionProgressEventChosePinPairingSetup");
LABEL_5:
    v2 = v1;
  }
  return v1;
}

uint64_t sub_247CE57BC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247CE57E4(unsigned int *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v2 + 16))(*a1, *a2, a2[1]);
}

uint64_t sub_247CE5810(unsigned int *a1, unsigned int *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

id WFSetupClientUserInteractionProgressEventToString_0(unint64_t a1)
{
  void *v1;
  id v2;

  if (a1 <= 5)
  {
    v1 = (void *)*((_QWORD *)&off_25194EE08 + a1);
    v2 = *((id *)&off_25194EDD8 + a1);
  }
  return v1;
}

uint64_t sub_247CE5878(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

id WFSetupProgressEventToString_2(unint64_t a1)
{
  void *v1;
  id v2;

  if (a1 <= 0xF)
  {
    v1 = (void *)*((_QWORD *)&off_25194EEB8 + a1);
    v2 = *((id *)&off_25194EE38 + a1);
  }
  return v1;
}

uint64_t sub_247CE58DC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

id WFSetupServerAnisetteDataProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void sub_247CE5960(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_247CEF4CC();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, a1 & 1);

}

void sub_247CE59B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_247CEF4CC();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_247CE5A10(char a1)
{
  return *(_QWORD *)&aSimdata[8 * a1];
}

uint64_t sub_247CE5A30(char a1)
{
  return *(_QWORD *)&aProvisiosync_0[8 * a1];
}

void *WFSetupServerAnisetteDataProvider.session.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void WFSetupServerAnisetteDataProvider.session.setter(void *a1)
{
  sub_247CE5C28(a1, &OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
}

uint64_t (*WFSetupServerAnisetteDataProvider.session.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *WFSetupServerAnisetteDataProvider.companionAuthDevice.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void WFSetupServerAnisetteDataProvider.companionAuthDevice.setter(void *a1)
{
  sub_247CE5C28(a1, &OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice);
}

uint64_t (*WFSetupServerAnisetteDataProvider.companionAuthDevice.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void *WFSetupServerAnisetteDataProvider.transportableAuthKitAccount.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void WFSetupServerAnisetteDataProvider.transportableAuthKitAccount.setter(void *a1)
{
  sub_247CE5C28(a1, &OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount);
}

void sub_247CE5C28(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;

  v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;

}

uint64_t (*WFSetupServerAnisetteDataProvider.transportableAuthKitAccount.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

char *WFSetupServerAnisetteDataProvider.init()()
{
  char *v0;
  id v1;
  void *v2;
  char *v3;
  id v4;
  id v5;
  void **v6;
  void *v7;
  id v8;
  void **v9;
  void *v10;
  objc_super v12;

  *(_QWORD *)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount] = 0;
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for WFSetupServerAnisetteDataProvider();
  v1 = objc_msgSendSuper2(&v12, sel_init);
  v2 = (void *)objc_opt_self();
  v3 = (char *)v1;
  v4 = objc_msgSend(v2, sel_currentDevice);
  v5 = v4;
  if (v4)
    objc_msgSend(v4, sel_setLinkType_, 3);
  v6 = (void **)&v3[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice];
  swift_beginAccess();
  v7 = *v6;
  *v6 = v5;

  v8 = sub_247CEE670();
  v9 = (void **)&v3[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount];
  swift_beginAccess();
  v10 = *v9;
  *v9 = v8;

  return v3;
}

uint64_t type metadata accessor for WFSetupServerAnisetteDataProvider()
{
  return objc_opt_self();
}

id WFSetupServerAnisetteDataProvider.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_247CEEAE0();

  return v4;
}

id WFSetupServerAnisetteDataProvider.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_247CEEAE0();

  return v2;
}

void WFSetupServerAnisetteDataProvider.provisionAnisette(completion:)(void (*a1)(_QWORD, void *), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  unint64_t v13;
  objc_class *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  uint64_t inited;
  void *v31;
  uint64_t v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t aBlock;
  unint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v41;
  void (*v42)(unsigned int, uint64_t, uint64_t);
  _QWORD *v43;
  objc_super v44;
  uint64_t v45;
  uint64_t v46;

  v3 = v2;
  if (qword_2576F1CF0 != -1)
    swift_once();
  v6 = sub_247CEF598();
  __swift_project_value_buffer(v6, (uint64_t)qword_2576F49B8);
  v7 = sub_247CEF580();
  v8 = sub_247CEF6E8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    aBlock = v10;
    *(_DWORD *)v9 = 136446210;
    v46 = sub_247CB5D84(0xD00000000000001ELL, 0x8000000247CF4220, &aBlock);
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v7, v8, "%{public}s is invoked. ", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v10, -1, -1);
    MEMORY[0x249590A5C](v9, -1, -1);
  }

  v11 = (id *)(v3 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
  swift_beginAccess();
  if (*v11)
  {
    v36 = a2;
    v37 = *v11;
    v12 = MEMORY[0x24BEE4AF8];
    v13 = sub_247CC01C4(MEMORY[0x24BEE4AF8]);
    v14 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
    v15 = (char *)objc_allocWithZone(v14);
    v16 = OBJC_IVAR___WFAnisetteRequest_data;
    v17 = v15;
    *(_QWORD *)&v15[v16] = sub_247CC01C4(v12);
    v18 = &v17[OBJC_IVAR___WFAnisetteRequest_id];
    *(_QWORD *)v18 = 0x6F697369766F7270;
    *((_QWORD *)v18 + 1) = 0xE90000000000006ELL;
    *(_QWORD *)&v15[v16] = v13;

    swift_bridgeObjectRelease();
    v44.receiver = v17;
    v44.super_class = v14;
    v19 = objc_msgSendSuper2(&v44, sel_init);
    v26 = sub_247CEC130();
    v28 = v27;

    v35 = (void *)sub_247CEF64C();
    sub_247CC0084(MEMORY[0x24BEE4AF8]);
    v29 = (void *)sub_247CEF604();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247CF1020;
    aBlock = 0x6F697369766F7270;
    v39 = 0xE90000000000006ELL;
    sub_247CEF790();
    *(_QWORD *)(inited + 96) = MEMORY[0x24BDCDDE8];
    *(_QWORD *)(inited + 72) = v26;
    *(_QWORD *)(inited + 80) = v28;
    sub_247CB5C7C(v26, v28);
    sub_247CC0084(inited);
    v31 = (void *)sub_247CEF604();
    swift_bridgeObjectRelease();
    v32 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v33 = (_QWORD *)swift_allocObject();
    v33[2] = a1;
    v33[3] = v36;
    v33[4] = v32;
    v42 = sub_247CEEEB8;
    v43 = v33;
    aBlock = MEMORY[0x24BDAC760];
    v39 = 1107296256;
    v40 = sub_247CE70FC;
    v41 = &block_descriptor_3;
    v34 = _Block_copy(&aBlock);
    sub_247CBDD44((uint64_t)a1);
    swift_release();
    objc_msgSend(v37, sel_sendRequestID_options_request_responseHandler_, v35, v29, v31, v34);
    _Block_release(v34);

    sub_247CB6504(v26, v28);
  }
  else
  {
    v20 = sub_247CEF580();
    v21 = sub_247CEF6DC();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      aBlock = v23;
      *(_DWORD *)v22 = 136446210;
      v45 = sub_247CB5D84(0xD00000000000001ELL, 0x8000000247CF4220, &aBlock);
      sub_247CEF748();
      _os_log_impl(&dword_247CAF000, v20, v21, "%{public}s invoked but session is nil", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v23, -1, -1);
      MEMORY[0x249590A5C](v22, -1, -1);
    }

    if (a1)
    {
      sub_247CDCA94();
      v24 = (void *)swift_allocError();
      *(_QWORD *)v25 = 0;
      *(_QWORD *)(v25 + 8) = 0;
      *(_BYTE *)(v25 + 16) = 5;
      a1(0, v24);

    }
  }
}

void sub_247CE65BC(unsigned int a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD, _QWORD), uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t *v25;
  uint64_t *v26;
  char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  void (*v59)(_QWORD, _QWORD);
  unsigned int v60;
  uint64_t v61;
  unsigned __int8 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67[5];

  v11 = sub_247CEF598();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    swift_beginAccess();
    v23 = MEMORY[0x249590A98](a6 + 16);
    if (v23)
    {
      v24 = (void *)v23;
      v37 = (char *)sub_247CEF298(a3, 0);

      if (v37)
      {
        v38 = *(_QWORD *)&v37[OBJC_IVAR___WFAnisetteResponse_data];
        if (*(_QWORD *)(v38 + 16))
        {
          swift_bridgeObjectRetain();
          v39 = sub_247CDD1B8(0x7369766F72507369, 0xED000064656E6F69);
          if ((v40 & 1) != 0)
          {
            sub_247CBBC1C(*(_QWORD *)(v38 + 56) + 32 * v39, (uint64_t)&v63);
          }
          else
          {
            v63 = 0;
            v64 = 0;
            v65 = 0;
            v66 = 1;
          }
          swift_bridgeObjectRelease();
          if (v66 != 1)
          {
            sub_247CEF3DC((uint64_t)&v63, (uint64_t)v67);
            if (v67[3])
            {
              if ((swift_dynamicCast() & 1) != 0)
              {
                v61 = a5;
                v41 = v62;
                if (qword_2576F1D00 != -1)
                  swift_once();
                v42 = __swift_project_value_buffer(v11, (uint64_t)qword_2576F49E8);
                (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v42, v11);
                v43 = sub_247CEF580();
                v44 = sub_247CEF6E8();
                v45 = os_log_type_enabled(v43, v44);
                v60 = v41;
                if (v45)
                {
                  v46 = swift_slowAlloc();
                  v47 = swift_slowAlloc();
                  v59 = a4;
                  v48 = v47;
                  v67[0] = v47;
                  *(_DWORD *)v46 = 67109378;
                  LODWORD(v63) = v41;
                  sub_247CEF748();
                  *(_WORD *)(v46 + 8) = 2080;
                  v63 = sub_247CB5D84(0x6F697369766F7270, 0xE90000000000006ELL, v67);
                  sub_247CEF748();
                  _os_log_impl(&dword_247CAF000, v43, v44, "Received response: isProvisioned %{BOOL}d for service id: %s", (uint8_t *)v46, 0x12u);
                  swift_arrayDestroy();
                  v49 = v48;
                  a4 = v59;
                  MEMORY[0x249590A5C](v49, -1, -1);
                  MEMORY[0x249590A5C](v46, -1, -1);
                }

                (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
                if (a4)
                {
                  v50 = qword_2576F1CF0;
                  swift_retain();
                  if (v50 != -1)
                    swift_once();
                  __swift_project_value_buffer(v11, (uint64_t)qword_2576F49B8);
                  v51 = sub_247CEF580();
                  v52 = sub_247CEF6E8();
                  if (os_log_type_enabled(v51, v52))
                  {
                    v53 = (uint8_t *)swift_slowAlloc();
                    v54 = swift_slowAlloc();
                    v67[0] = v54;
                    *(_DWORD *)v53 = 136446210;
                    v63 = sub_247CB5D84(0xD00000000000001ELL, 0x8000000247CF4220, v67);
                    sub_247CEF748();
                    _os_log_impl(&dword_247CAF000, v51, v52, "Invoking completion block that was passed into: %{public}s", v53, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x249590A5C](v54, -1, -1);
                    MEMORY[0x249590A5C](v53, -1, -1);
                  }

                  a4(v60, 0);
                  sub_247CBDE58((uint64_t)a4);
                }
                else
                {
                  if (qword_2576F1CF0 != -1)
                    swift_once();
                  __swift_project_value_buffer(v11, (uint64_t)qword_2576F49B8);
                  v55 = sub_247CEF580();
                  v56 = sub_247CEF6E8();
                  if (os_log_type_enabled(v55, v56))
                  {
                    v57 = (uint8_t *)swift_slowAlloc();
                    v58 = swift_slowAlloc();
                    v67[0] = v58;
                    *(_DWORD *)v57 = 136446210;
                    v63 = sub_247CB5D84(0xD00000000000001ELL, 0x8000000247CF4220, v67);
                    sub_247CEF748();
                    _os_log_impl(&dword_247CAF000, v55, v56, "No completion block passed into %{public}s. ", v57, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x249590A5C](v58, -1, -1);
                    MEMORY[0x249590A5C](v57, -1, -1);

                  }
                  else
                  {

                  }
                }
                return;
              }
LABEL_14:
              if (qword_2576F1CF0 != -1)
                swift_once();
              __swift_project_value_buffer(v11, (uint64_t)qword_2576F49B8);
              v27 = v37;
              v28 = sub_247CEF580();
              v29 = sub_247CEF6DC();
              if (os_log_type_enabled(v28, v29))
              {
                v30 = (uint8_t *)swift_slowAlloc();
                v31 = swift_slowAlloc();
                v67[0] = v31;
                v61 = a5;
                *(_DWORD *)v30 = 136315138;
                v63 = (uint64_t)v37;
                v32 = v27;
                __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2E00);
                v33 = sub_247CEF664();
                v63 = sub_247CB5D84(v33, v34, v67);
                sub_247CEF748();

                swift_bridgeObjectRelease();
                _os_log_impl(&dword_247CAF000, v28, v29, "Failed to retrieve value for isProvisioned from anisetteResponse: %s", v30, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x249590A5C](v31, -1, -1);
                MEMORY[0x249590A5C](v30, -1, -1);

                if (a4)
                {
LABEL_18:
                  sub_247CDCA94();
                  v35 = swift_allocError();
                  *(_OWORD *)v36 = xmmword_247CF1E40;
                  *(_BYTE *)(v36 + 16) = 0;
                  a4(0, v35);

                  v22 = (void *)v35;
                  goto LABEL_19;
                }
              }
              else
              {

                if (a4)
                  goto LABEL_18;
              }

              return;
            }
            v25 = &qword_2576F24D0;
            v26 = v67;
LABEL_13:
            sub_247CBCE98((uint64_t)v26, v25);
            goto LABEL_14;
          }
LABEL_12:
          v25 = (uint64_t *)&unk_2576F2DF8;
          v26 = &v63;
          goto LABEL_13;
        }
      }
    }
    else
    {
      v37 = 0;
    }
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 1;
    goto LABEL_12;
  }
  if (qword_2576F1CF0 != -1)
    swift_once();
  __swift_project_value_buffer(v11, (uint64_t)qword_2576F49B8);
  v16 = sub_247CEF580();
  v17 = sub_247CEF6DC();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v18 = 67240192;
    LODWORD(v67[0]) = a1;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v16, v17, "Provisioning request failed with osstatus code: %{public}d", v18, 8u);
    MEMORY[0x249590A5C](v18, -1, -1);
  }

  if (a4)
  {
    v19 = a1;
    sub_247CDCA94();
    v20 = swift_allocError();
    *(_QWORD *)v21 = v19;
    *(_QWORD *)(v21 + 8) = 0;
    *(_BYTE *)(v21 + 16) = 4;
    a4(0, v20);
    v22 = (void *)v20;
LABEL_19:

  }
}

uint64_t sub_247CE70DC(char a1)
{
  return *(_QWORD *)&aIsprovisissync[8 * a1];
}

uint64_t sub_247CE70FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;

  v4 = a4;
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32);
  if (!a3)
  {
    v7 = 0;
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  v7 = sub_247CEF61C();
  if (v4)
LABEL_3:
    v4 = sub_247CEF61C();
LABEL_4:
  swift_retain();
  v6(a2, v7, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void WFSetupServerAnisetteDataProvider.syncAnisette(withSIMData:completion:)(uint64_t a1, unint64_t a2, void (*a3)(_QWORD, void *), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  void **v14;
  void *v15;
  uint64_t inited;
  id v17;
  unint64_t v18;
  objc_class *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _QWORD *v40;
  void *v41;
  void (*v43)(_QWORD, void *);
  uint64_t aBlock;
  unint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v47;
  void (*v48)(unsigned int, uint64_t, uint64_t);
  _QWORD *v49;
  objc_super v50;
  uint64_t v51;
  uint64_t v52;

  v5 = v4;
  if (qword_2576F1CF0 != -1)
    swift_once();
  v9 = sub_247CEF598();
  __swift_project_value_buffer(v9, (uint64_t)qword_2576F49B8);
  v10 = sub_247CEF580();
  v11 = sub_247CEF6E8();
  v43 = a3;
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    aBlock = v13;
    *(_DWORD *)v12 = 136446210;
    v52 = sub_247CB5D84(0xD000000000000025, 0x8000000247CF4270, &aBlock);
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v10, v11, "%{public}s is invoked. ", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v13, -1, -1);
    MEMORY[0x249590A5C](v12, -1, -1);
  }

  v14 = (void **)(v5 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
  swift_beginAccess();
  v15 = *v14;
  if (*v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2738);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247CF1020;
    *(_QWORD *)(inited + 32) = 0x617461446D6973;
    *(_QWORD *)(inited + 40) = 0xE700000000000000;
    *(_QWORD *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C80);
    *(_QWORD *)(inited + 48) = a1;
    *(_QWORD *)(inited + 56) = a2;
    sub_247CB5C68(a1, a2);
    sub_247CB5C68(a1, a2);
    v17 = v15;
    v18 = sub_247CC01C4(inited);
    v19 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
    v20 = (char *)objc_allocWithZone(v19);
    v21 = OBJC_IVAR___WFAnisetteRequest_data;
    v22 = v20;
    *(_QWORD *)&v20[v21] = sub_247CC01C4(MEMORY[0x24BEE4AF8]);
    v23 = &v22[OBJC_IVAR___WFAnisetteRequest_id];
    *(_QWORD *)v23 = 1668184435;
    *((_QWORD *)v23 + 1) = 0xE400000000000000;
    *(_QWORD *)&v20[v21] = v18;

    swift_bridgeObjectRelease();
    v50.receiver = v22;
    v50.super_class = v19;
    v24 = objc_msgSendSuper2(&v50, sel_init);
    sub_247CB64F0(a1, a2);
    v31 = sub_247CEC130();
    v33 = v32;

    v34 = (void *)sub_247CEF64C();
    sub_247CC0084(MEMORY[0x24BEE4AF8]);
    v35 = v17;
    v36 = (void *)sub_247CEF604();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
    v37 = swift_initStackObject();
    *(_OWORD *)(v37 + 16) = xmmword_247CF1020;
    aBlock = 1668184435;
    v45 = 0xE400000000000000;
    sub_247CEF790();
    *(_QWORD *)(v37 + 96) = MEMORY[0x24BDCDDE8];
    *(_QWORD *)(v37 + 72) = v31;
    *(_QWORD *)(v37 + 80) = v33;
    sub_247CB5C7C(v31, v33);
    sub_247CC0084(v37);
    v38 = (void *)sub_247CEF604();
    swift_bridgeObjectRelease();
    v39 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v40 = (_QWORD *)swift_allocObject();
    v40[2] = v43;
    v40[3] = a4;
    v40[4] = v39;
    v48 = sub_247CEEEE0;
    v49 = v40;
    aBlock = MEMORY[0x24BDAC760];
    v45 = 1107296256;
    v46 = sub_247CE70FC;
    v47 = &block_descriptor_10;
    v41 = _Block_copy(&aBlock);
    sub_247CBDD44((uint64_t)v43);
    swift_release();
    objc_msgSend(v35, sel_sendRequestID_options_request_responseHandler_, v34, v36, v38, v41);
    _Block_release(v41);

    sub_247CB6504(v31, v33);
  }
  else
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    __swift_project_value_buffer(v9, (uint64_t)qword_2576F49E8);
    v25 = sub_247CEF580();
    v26 = sub_247CEF6DC();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      aBlock = v28;
      *(_DWORD *)v27 = 136446210;
      v51 = sub_247CB5D84(0xD000000000000025, 0x8000000247CF4270, &aBlock);
      sub_247CEF748();
      _os_log_impl(&dword_247CAF000, v25, v26, "%{public}s invoked but session is nil", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v28, -1, -1);
      MEMORY[0x249590A5C](v27, -1, -1);
    }

    if (v43)
    {
      sub_247CDCA94();
      v29 = (void *)swift_allocError();
      *(_QWORD *)v30 = 0;
      *(_QWORD *)(v30 + 8) = 0;
      *(_BYTE *)(v30 + 16) = 5;
      v43(0, v29);

    }
  }
}

void sub_247CE79FC(unsigned int a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD, _QWORD), uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t *v25;
  uint64_t *v26;
  char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  void (*v59)(_QWORD, _QWORD);
  unsigned int v60;
  uint64_t v61;
  unsigned __int8 v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67[5];

  v11 = sub_247CEF598();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    swift_beginAccess();
    v23 = MEMORY[0x249590A98](a6 + 16);
    if (v23)
    {
      v24 = (void *)v23;
      v37 = (char *)sub_247CEF298(a3, 1);

      if (v37)
      {
        v38 = *(_QWORD *)&v37[OBJC_IVAR___WFAnisetteResponse_data];
        if (*(_QWORD *)(v38 + 16))
        {
          swift_bridgeObjectRetain();
          v39 = sub_247CDD1B8(0x6465636E79537369, 0xE800000000000000);
          if ((v40 & 1) != 0)
          {
            sub_247CBBC1C(*(_QWORD *)(v38 + 56) + 32 * v39, (uint64_t)&v63);
          }
          else
          {
            v63 = 0;
            v64 = 0;
            v65 = 0;
            v66 = 1;
          }
          swift_bridgeObjectRelease();
          if (v66 != 1)
          {
            sub_247CEF3DC((uint64_t)&v63, (uint64_t)v67);
            if (v67[3])
            {
              if ((swift_dynamicCast() & 1) != 0)
              {
                v61 = a5;
                v41 = v62;
                if (qword_2576F1D00 != -1)
                  swift_once();
                v42 = __swift_project_value_buffer(v11, (uint64_t)qword_2576F49E8);
                (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v42, v11);
                v43 = sub_247CEF580();
                v44 = sub_247CEF6E8();
                v45 = os_log_type_enabled(v43, v44);
                v60 = v41;
                if (v45)
                {
                  v46 = swift_slowAlloc();
                  v47 = swift_slowAlloc();
                  v59 = a4;
                  v48 = v47;
                  v67[0] = v47;
                  *(_DWORD *)v46 = 67109378;
                  LODWORD(v63) = v41;
                  sub_247CEF748();
                  *(_WORD *)(v46 + 8) = 2082;
                  v63 = sub_247CB5D84(1668184435, 0xE400000000000000, v67);
                  sub_247CEF748();
                  _os_log_impl(&dword_247CAF000, v43, v44, "Received response: isSynced %{BOOL}d for service id: %{public}s", (uint8_t *)v46, 0x12u);
                  swift_arrayDestroy();
                  v49 = v48;
                  a4 = v59;
                  MEMORY[0x249590A5C](v49, -1, -1);
                  MEMORY[0x249590A5C](v46, -1, -1);
                }

                (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
                if (a4)
                {
                  v50 = qword_2576F1CF0;
                  swift_retain();
                  if (v50 != -1)
                    swift_once();
                  __swift_project_value_buffer(v11, (uint64_t)qword_2576F49B8);
                  v51 = sub_247CEF580();
                  v52 = sub_247CEF6E8();
                  if (os_log_type_enabled(v51, v52))
                  {
                    v53 = (uint8_t *)swift_slowAlloc();
                    v54 = swift_slowAlloc();
                    v67[0] = v54;
                    *(_DWORD *)v53 = 136446210;
                    v63 = sub_247CB5D84(0xD000000000000025, 0x8000000247CF4270, v67);
                    sub_247CEF748();
                    _os_log_impl(&dword_247CAF000, v51, v52, "Invoking completion block that was passed into: %{public}s", v53, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x249590A5C](v54, -1, -1);
                    MEMORY[0x249590A5C](v53, -1, -1);
                  }

                  a4(v60, 0);
                  sub_247CBDE58((uint64_t)a4);
                }
                else
                {
                  if (qword_2576F1CF0 != -1)
                    swift_once();
                  __swift_project_value_buffer(v11, (uint64_t)qword_2576F49B8);
                  v55 = sub_247CEF580();
                  v56 = sub_247CEF6E8();
                  if (os_log_type_enabled(v55, v56))
                  {
                    v57 = (uint8_t *)swift_slowAlloc();
                    v58 = swift_slowAlloc();
                    v67[0] = v58;
                    *(_DWORD *)v57 = 136446210;
                    v63 = sub_247CB5D84(0xD000000000000025, 0x8000000247CF4270, v67);
                    sub_247CEF748();
                    _os_log_impl(&dword_247CAF000, v55, v56, "No completion block passed into %{public}s. ", v57, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x249590A5C](v58, -1, -1);
                    MEMORY[0x249590A5C](v57, -1, -1);

                  }
                  else
                  {

                  }
                }
                return;
              }
LABEL_14:
              if (qword_2576F1CF0 != -1)
                swift_once();
              __swift_project_value_buffer(v11, (uint64_t)qword_2576F49B8);
              v27 = v37;
              v28 = sub_247CEF580();
              v29 = sub_247CEF6DC();
              if (os_log_type_enabled(v28, v29))
              {
                v30 = (uint8_t *)swift_slowAlloc();
                v31 = swift_slowAlloc();
                v67[0] = v31;
                v61 = a5;
                *(_DWORD *)v30 = 136315138;
                v63 = (uint64_t)v37;
                v32 = v27;
                __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2E00);
                v33 = sub_247CEF664();
                v63 = sub_247CB5D84(v33, v34, v67);
                sub_247CEF748();

                swift_bridgeObjectRelease();
                _os_log_impl(&dword_247CAF000, v28, v29, "Failed to retrieve value for isSynced from anisetteResponse: %s", v30, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x249590A5C](v31, -1, -1);
                MEMORY[0x249590A5C](v30, -1, -1);

                if (a4)
                {
LABEL_18:
                  sub_247CDCA94();
                  v35 = swift_allocError();
                  *(_OWORD *)v36 = xmmword_247CF1E60;
                  *(_BYTE *)(v36 + 16) = 0;
                  a4(0, v35);

                  v22 = (void *)v35;
                  goto LABEL_19;
                }
              }
              else
              {

                if (a4)
                  goto LABEL_18;
              }

              return;
            }
            v25 = &qword_2576F24D0;
            v26 = v67;
LABEL_13:
            sub_247CBCE98((uint64_t)v26, v25);
            goto LABEL_14;
          }
LABEL_12:
          v25 = (uint64_t *)&unk_2576F2DF8;
          v26 = &v63;
          goto LABEL_13;
        }
      }
    }
    else
    {
      v37 = 0;
    }
    v63 = 0;
    v64 = 0;
    v65 = 0;
    v66 = 1;
    goto LABEL_12;
  }
  if (qword_2576F1D00 != -1)
    swift_once();
  __swift_project_value_buffer(v11, (uint64_t)qword_2576F49E8);
  v16 = sub_247CEF580();
  v17 = sub_247CEF6DC();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v18 = 67240192;
    LODWORD(v67[0]) = a1;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v16, v17, "Syncing anisette with sim data anisette request failed with error status code: %{public}d", v18, 8u);
    MEMORY[0x249590A5C](v18, -1, -1);
  }

  if (a4)
  {
    v19 = a1;
    sub_247CDCA94();
    v20 = swift_allocError();
    *(_QWORD *)v21 = v19;
    *(_QWORD *)(v21 + 8) = 0;
    *(_BYTE *)(v21 + 16) = 4;
    a4(0, v20);
    v22 = (void *)v20;
LABEL_19:

  }
}

void WFSetupServerAnisetteDataProvider.eraseAnisette(completion:)(void (*a1)(_QWORD, void *), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  unint64_t v12;
  objc_class *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  uint64_t inited;
  void *v30;
  uint64_t v31;
  _QWORD *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t aBlock;
  unint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v40;
  void (*v41)(unsigned int, uint64_t, uint64_t);
  _QWORD *v42;
  objc_super v43;
  uint64_t v44;
  uint64_t v45;

  v3 = v2;
  if (qword_2576F1CF0 != -1)
    swift_once();
  v5 = sub_247CEF598();
  __swift_project_value_buffer(v5, (uint64_t)qword_2576F49B8);
  v6 = sub_247CEF580();
  v7 = sub_247CEF6E8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    aBlock = v9;
    *(_DWORD *)v8 = 136446210;
    v45 = sub_247CB5D84(0xD00000000000001ALL, 0x8000000247CF42A0, &aBlock);
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v6, v7, "%{public}s is invoked. ", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v9, -1, -1);
    MEMORY[0x249590A5C](v8, -1, -1);
  }

  v10 = (id *)(v3 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
  swift_beginAccess();
  if (*v10)
  {
    v35 = *v10;
    v11 = MEMORY[0x24BEE4AF8];
    v12 = sub_247CC01C4(MEMORY[0x24BEE4AF8]);
    v13 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
    v14 = (char *)objc_allocWithZone(v13);
    v15 = OBJC_IVAR___WFAnisetteRequest_data;
    v16 = v14;
    *(_QWORD *)&v14[v15] = sub_247CC01C4(v11);
    v17 = &v16[OBJC_IVAR___WFAnisetteRequest_id];
    *(_QWORD *)v17 = 0x6573617265;
    *((_QWORD *)v17 + 1) = 0xE500000000000000;
    *(_QWORD *)&v14[v15] = v12;

    swift_bridgeObjectRelease();
    v43.receiver = v16;
    v43.super_class = v13;
    v18 = objc_msgSendSuper2(&v43, sel_init);
    v25 = sub_247CEC130();
    v27 = v26;

    v34 = (void *)sub_247CEF64C();
    sub_247CC0084(MEMORY[0x24BEE4AF8]);
    v28 = (void *)sub_247CEF604();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247CF1020;
    aBlock = 0x6573617265;
    v38 = 0xE500000000000000;
    sub_247CEF790();
    *(_QWORD *)(inited + 96) = MEMORY[0x24BDCDDE8];
    *(_QWORD *)(inited + 72) = v25;
    *(_QWORD *)(inited + 80) = v27;
    sub_247CB5C7C(v25, v27);
    sub_247CC0084(inited);
    v30 = (void *)sub_247CEF604();
    swift_bridgeObjectRelease();
    v31 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v32 = (_QWORD *)swift_allocObject();
    v32[2] = a1;
    v32[3] = a2;
    v32[4] = v31;
    v41 = sub_247CEEEF0;
    v42 = v32;
    aBlock = MEMORY[0x24BDAC760];
    v38 = 1107296256;
    v39 = sub_247CE70FC;
    v40 = &block_descriptor_17_0;
    v33 = _Block_copy(&aBlock);
    sub_247CBDD44((uint64_t)a1);
    swift_release();
    objc_msgSend(v35, sel_sendRequestID_options_request_responseHandler_, v34, v28, v30, v33);
    _Block_release(v33);

    sub_247CB6504(v25, v27);
  }
  else
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    __swift_project_value_buffer(v5, (uint64_t)qword_2576F49E8);
    v19 = sub_247CEF580();
    v20 = sub_247CEF6DC();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      aBlock = v22;
      *(_DWORD *)v21 = 136446210;
      v44 = sub_247CB5D84(0xD00000000000001ALL, 0x8000000247CF42A0, &aBlock);
      sub_247CEF748();
      _os_log_impl(&dword_247CAF000, v19, v20, "%{public}s invoked but session is nil", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v22, -1, -1);
      MEMORY[0x249590A5C](v21, -1, -1);
    }

    if (a1)
    {
      sub_247CDCA94();
      v23 = (void *)swift_allocError();
      *(_QWORD *)v24 = 0;
      *(_QWORD *)(v24 + 8) = 0;
      *(_BYTE *)(v24 + 16) = 5;
      a1(0, v23);

    }
  }
}

void sub_247CE8C64(unsigned int a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD, _QWORD), uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t *v25;
  uint64_t *v26;
  char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  _QWORD v59[2];
  unsigned int v60;
  uint64_t v61;
  void (*v62)(_QWORD, _QWORD);
  unsigned __int8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68[5];

  v11 = sub_247CEF598();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    swift_beginAccess();
    v23 = MEMORY[0x249590A98](a6 + 16);
    if (v23)
    {
      v24 = (void *)v23;
      v37 = (char *)sub_247CEF298(a3, 2);

      if (v37)
      {
        v38 = *(_QWORD *)&v37[OBJC_IVAR___WFAnisetteResponse_data];
        if (*(_QWORD *)(v38 + 16))
        {
          swift_bridgeObjectRetain();
          v39 = sub_247CDD1B8(0x6465736172457369, 0xE800000000000000);
          if ((v40 & 1) != 0)
          {
            sub_247CBBC1C(*(_QWORD *)(v38 + 56) + 32 * v39, (uint64_t)&v64);
          }
          else
          {
            v64 = 0;
            v65 = 0;
            v66 = 0;
            v67 = 1;
          }
          swift_bridgeObjectRelease();
          if (v67 != 1)
          {
            sub_247CEF3DC((uint64_t)&v64, (uint64_t)v68);
            if (v68[3])
            {
              if ((swift_dynamicCast() & 1) != 0)
              {
                v61 = a5;
                v41 = v63;
                if (qword_2576F1CF0 != -1)
                  swift_once();
                v42 = __swift_project_value_buffer(v11, (uint64_t)qword_2576F49B8);
                (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v42, v11);
                v43 = sub_247CEF580();
                v44 = sub_247CEF6E8();
                v45 = os_log_type_enabled(v43, v44);
                v60 = v41;
                if (v45)
                {
                  v46 = swift_slowAlloc();
                  v62 = a4;
                  v47 = v46;
                  v48 = swift_slowAlloc();
                  v59[1] = v42;
                  v49 = v48;
                  v68[0] = v48;
                  *(_DWORD *)v47 = 67109378;
                  LODWORD(v64) = v41;
                  sub_247CEF748();
                  *(_WORD *)(v47 + 8) = 2080;
                  v64 = sub_247CB5D84(0x6573617265, 0xE500000000000000, v68);
                  sub_247CEF748();
                  _os_log_impl(&dword_247CAF000, v43, v44, "Received response: isErased %{BOOL}d for service id: %s", (uint8_t *)v47, 0x12u);
                  swift_arrayDestroy();
                  MEMORY[0x249590A5C](v49, -1, -1);
                  v50 = v47;
                  a4 = v62;
                  MEMORY[0x249590A5C](v50, -1, -1);
                }

                (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
                if (a4)
                {
                  swift_retain();
                  v51 = sub_247CEF580();
                  v52 = sub_247CEF6E8();
                  if (os_log_type_enabled(v51, v52))
                  {
                    v53 = (uint8_t *)swift_slowAlloc();
                    v54 = swift_slowAlloc();
                    v68[0] = v54;
                    *(_DWORD *)v53 = 136446210;
                    v64 = sub_247CB5D84(0xD00000000000001ALL, 0x8000000247CF42A0, v68);
                    sub_247CEF748();
                    _os_log_impl(&dword_247CAF000, v51, v52, "Invoking completion block that was passed into: %{public}s", v53, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x249590A5C](v54, -1, -1);
                    MEMORY[0x249590A5C](v53, -1, -1);
                  }

                  a4(v60, 0);
                  sub_247CBDE58((uint64_t)a4);
                }
                else
                {
                  v55 = sub_247CEF580();
                  v56 = sub_247CEF6E8();
                  if (os_log_type_enabled(v55, v56))
                  {
                    v57 = (uint8_t *)swift_slowAlloc();
                    v58 = swift_slowAlloc();
                    v68[0] = v58;
                    *(_DWORD *)v57 = 136446210;
                    v64 = sub_247CB5D84(0xD00000000000001ALL, 0x8000000247CF42A0, v68);
                    sub_247CEF748();
                    _os_log_impl(&dword_247CAF000, v55, v56, "No completion block passed into %{public}s. ", v57, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x249590A5C](v58, -1, -1);
                    MEMORY[0x249590A5C](v57, -1, -1);

                  }
                  else
                  {

                  }
                }
                return;
              }
LABEL_14:
              if (qword_2576F1CF0 != -1)
                swift_once();
              __swift_project_value_buffer(v11, (uint64_t)qword_2576F49B8);
              v27 = v37;
              v28 = sub_247CEF580();
              v29 = sub_247CEF6DC();
              if (os_log_type_enabled(v28, v29))
              {
                v30 = (uint8_t *)swift_slowAlloc();
                v31 = swift_slowAlloc();
                v68[0] = v31;
                v62 = a4;
                *(_DWORD *)v30 = 136315138;
                v64 = (uint64_t)v37;
                v32 = v27;
                __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2E00);
                v33 = sub_247CEF664();
                v64 = sub_247CB5D84(v33, v34, v68);
                a4 = v62;
                sub_247CEF748();

                swift_bridgeObjectRelease();
                _os_log_impl(&dword_247CAF000, v28, v29, "Failed to retrieve value for isErased from anisetteResponse: %s", v30, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x249590A5C](v31, -1, -1);
                MEMORY[0x249590A5C](v30, -1, -1);

                if (a4)
                {
LABEL_18:
                  sub_247CDCA94();
                  v35 = swift_allocError();
                  *(_OWORD *)v36 = xmmword_247CF1E80;
                  *(_BYTE *)(v36 + 16) = 0;
                  a4(0, v35);

                  v22 = (void *)v35;
                  goto LABEL_19;
                }
              }
              else
              {

                if (a4)
                  goto LABEL_18;
              }

              return;
            }
            v25 = &qword_2576F24D0;
            v26 = v68;
LABEL_13:
            sub_247CBCE98((uint64_t)v26, v25);
            goto LABEL_14;
          }
LABEL_12:
          v25 = (uint64_t *)&unk_2576F2DF8;
          v26 = &v64;
          goto LABEL_13;
        }
      }
    }
    else
    {
      v37 = 0;
    }
    v64 = 0;
    v65 = 0;
    v66 = 0;
    v67 = 1;
    goto LABEL_12;
  }
  if (qword_2576F1D00 != -1)
    swift_once();
  __swift_project_value_buffer(v11, (uint64_t)qword_2576F49E8);
  v16 = sub_247CEF580();
  v17 = sub_247CEF6DC();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v18 = 67109120;
    LODWORD(v68[0]) = a1;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v16, v17, "Erase anisette request failed with error: %d", v18, 8u);
    MEMORY[0x249590A5C](v18, -1, -1);
  }

  if (a4)
  {
    v19 = a1;
    sub_247CDCA94();
    v20 = swift_allocError();
    *(_QWORD *)v21 = v19;
    *(_QWORD *)(v21 + 8) = 0;
    *(_BYTE *)(v21 + 16) = 4;
    a4(0, v20);
    v22 = (void *)v20;
LABEL_19:

  }
}

void WFSetupServerAnisetteDataProvider.fetchAnisetteDataAndProvisionIfNecessary(_:withCompletion:)(char a1, void (*a2)(_QWORD, _QWORD), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  void (*v10)(_QWORD, _QWORD);
  uint64_t v11;
  uint64_t v12;
  void **v13;
  void *v14;
  uint64_t inited;
  id v16;
  unint64_t v17;
  objc_class *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  void *v38;
  void *v40;
  uint64_t aBlock;
  unint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v45;
  void (*v46)(unsigned int, uint64_t, uint64_t);
  _QWORD *v47;
  objc_super v48;
  uint64_t v49;
  uint64_t v50;

  v4 = v3;
  if (qword_2576F1CF0 != -1)
    swift_once();
  v6 = sub_247CEF598();
  __swift_project_value_buffer(v6, (uint64_t)qword_2576F49B8);
  v7 = sub_247CEF580();
  v8 = sub_247CEF6E8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = a2;
    v11 = swift_slowAlloc();
    aBlock = v11;
    *(_DWORD *)v9 = 136446210;
    v50 = sub_247CB5D84(0xD00000000000003BLL, 0x8000000247CF42C0, &aBlock);
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v7, v8, "%{public}s is invoked. ", v9, 0xCu);
    swift_arrayDestroy();
    v12 = v11;
    a2 = v10;
    MEMORY[0x249590A5C](v12, -1, -1);
    MEMORY[0x249590A5C](v9, -1, -1);
  }

  v13 = (void **)(v4 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
  swift_beginAccess();
  v14 = *v13;
  if (*v13)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2738);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247CF1020;
    *(_QWORD *)(inited + 32) = 0x7250646C756F6873;
    *(_QWORD *)(inited + 40) = 0xEF6E6F697369766FLL;
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1328];
    *(_BYTE *)(inited + 48) = a1 & 1;
    v16 = v14;
    v17 = sub_247CC01C4(inited);
    v18 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
    v19 = (char *)objc_allocWithZone(v18);
    v20 = OBJC_IVAR___WFAnisetteRequest_data;
    v21 = v19;
    *(_QWORD *)&v19[v20] = sub_247CC01C4(MEMORY[0x24BEE4AF8]);
    v22 = &v21[OBJC_IVAR___WFAnisetteRequest_id];
    *(_QWORD *)v22 = 0x6863746566;
    *((_QWORD *)v22 + 1) = 0xE500000000000000;
    *(_QWORD *)&v19[v20] = v17;

    swift_bridgeObjectRelease();
    v48.receiver = v21;
    v48.super_class = v18;
    v23 = objc_msgSendSuper2(&v48, sel_init);
    v30 = sub_247CEC130();
    v32 = v31;

    v40 = (void *)sub_247CEF64C();
    sub_247CC0084(MEMORY[0x24BEE4AF8]);
    v33 = (void *)sub_247CEF604();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
    v34 = swift_initStackObject();
    *(_OWORD *)(v34 + 16) = xmmword_247CF1020;
    aBlock = 0x6863746566;
    v43 = 0xE500000000000000;
    sub_247CEF790();
    *(_QWORD *)(v34 + 96) = MEMORY[0x24BDCDDE8];
    *(_QWORD *)(v34 + 72) = v30;
    *(_QWORD *)(v34 + 80) = v32;
    sub_247CB5C7C(v30, v32);
    sub_247CC0084(v34);
    v35 = (void *)sub_247CEF604();
    swift_bridgeObjectRelease();
    v36 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v37 = (_QWORD *)swift_allocObject();
    v37[2] = a2;
    v37[3] = a3;
    v37[4] = v36;
    v46 = sub_247CEEF00;
    v47 = v37;
    aBlock = MEMORY[0x24BDAC760];
    v43 = 1107296256;
    v44 = sub_247CE70FC;
    v45 = &block_descriptor_24_1;
    v38 = _Block_copy(&aBlock);
    sub_247CBDD44((uint64_t)a2);
    swift_release();
    objc_msgSend(v16, sel_sendRequestID_options_request_responseHandler_, v40, v33, v35, v38);
    _Block_release(v38);

    sub_247CB6504(v30, v32);
  }
  else
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    __swift_project_value_buffer(v6, (uint64_t)qword_2576F49E8);
    v24 = sub_247CEF580();
    v25 = sub_247CEF6DC();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      v27 = swift_slowAlloc();
      aBlock = v27;
      *(_DWORD *)v26 = 136446210;
      v49 = sub_247CB5D84(0xD00000000000003BLL, 0x8000000247CF42C0, &aBlock);
      sub_247CEF748();
      _os_log_impl(&dword_247CAF000, v24, v25, "%{public}s invoked but session is nil", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v27, -1, -1);
      MEMORY[0x249590A5C](v26, -1, -1);
    }

    if (a2)
    {
      sub_247CDCA94();
      v28 = (void *)swift_allocError();
      *(_QWORD *)v29 = 0;
      *(_QWORD *)(v29 + 8) = 0;
      *(_BYTE *)(v29 + 16) = 5;
      a2(0, v28);

    }
  }
}

void WFSetupServerAnisetteDataProvider.legacyAnisetteData(forDSID:withCompletion:)(uint64_t a1, uint64_t a2, void (*a3)(_QWORD, void *), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void **v16;
  void *v17;
  uint64_t inited;
  id v19;
  unint64_t v20;
  objc_class *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  _QWORD *v41;
  void *v42;
  void (*v45)(_QWORD, void *);
  uint64_t aBlock;
  unint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v49;
  void (*v50)(unsigned int, uint64_t, uint64_t);
  _QWORD *v51;
  objc_super v52;
  uint64_t v53;
  uint64_t v54;

  v5 = v4;
  if (qword_2576F1CF0 != -1)
    swift_once();
  v8 = sub_247CEF598();
  __swift_project_value_buffer(v8, (uint64_t)qword_2576F49B8);
  v9 = sub_247CEF580();
  v10 = sub_247CEF6E8();
  v45 = a3;
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = a1;
    v13 = v5;
    v14 = swift_slowAlloc();
    aBlock = v14;
    *(_DWORD *)v11 = 136446210;
    v54 = sub_247CB5D84(0xD00000000000002BLL, 0x8000000247CF4300, &aBlock);
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v9, v10, "%{public}s is invoked. ", v11, 0xCu);
    swift_arrayDestroy();
    v15 = v14;
    v5 = v13;
    a1 = v12;
    MEMORY[0x249590A5C](v15, -1, -1);
    MEMORY[0x249590A5C](v11, -1, -1);
  }

  v16 = (void **)(v5 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
  swift_beginAccess();
  v17 = *v16;
  if (*v16)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2738);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_247CF1020;
    *(_QWORD *)(inited + 32) = 1684632420;
    *(_QWORD *)(inited + 40) = 0xE400000000000000;
    *(_QWORD *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F1D70);
    *(_QWORD *)(inited + 48) = a1;
    *(_QWORD *)(inited + 56) = a2;
    swift_bridgeObjectRetain();
    v19 = v17;
    v20 = sub_247CC01C4(inited);
    v21 = (objc_class *)type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
    v22 = (char *)objc_allocWithZone(v21);
    v23 = OBJC_IVAR___WFAnisetteRequest_data;
    v24 = v22;
    *(_QWORD *)&v22[v23] = sub_247CC01C4(MEMORY[0x24BEE4AF8]);
    v25 = &v24[OBJC_IVAR___WFAnisetteRequest_id];
    *(_QWORD *)v25 = 0x79636167656CLL;
    *((_QWORD *)v25 + 1) = 0xE600000000000000;
    *(_QWORD *)&v22[v23] = v20;

    swift_bridgeObjectRelease();
    v52.receiver = v24;
    v52.super_class = v21;
    v26 = objc_msgSendSuper2(&v52, sel_init);
    v33 = sub_247CEC130();
    v35 = v34;

    v36 = (void *)sub_247CEF64C();
    sub_247CC0084(MEMORY[0x24BEE4AF8]);
    v37 = (void *)sub_247CEF604();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2C70);
    v38 = swift_initStackObject();
    *(_OWORD *)(v38 + 16) = xmmword_247CF1020;
    aBlock = 0x79636167656CLL;
    v47 = 0xE600000000000000;
    sub_247CEF790();
    *(_QWORD *)(v38 + 96) = MEMORY[0x24BDCDDE8];
    *(_QWORD *)(v38 + 72) = v33;
    *(_QWORD *)(v38 + 80) = v35;
    sub_247CB5C7C(v33, v35);
    sub_247CC0084(v38);
    v39 = (void *)sub_247CEF604();
    swift_bridgeObjectRelease();
    v40 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v41 = (_QWORD *)swift_allocObject();
    v41[2] = v45;
    v41[3] = a4;
    v41[4] = v40;
    v50 = sub_247CEEFB4;
    v51 = v41;
    aBlock = MEMORY[0x24BDAC760];
    v47 = 1107296256;
    v48 = sub_247CE70FC;
    v49 = &block_descriptor_31;
    v42 = _Block_copy(&aBlock);
    sub_247CBDD44((uint64_t)v45);
    swift_release();
    objc_msgSend(v19, sel_sendRequestID_options_request_responseHandler_, v36, v37, v39, v42);

    _Block_release(v42);
    sub_247CB6504(v33, v35);
  }
  else
  {
    if (qword_2576F1D00 != -1)
      swift_once();
    __swift_project_value_buffer(v8, (uint64_t)qword_2576F49E8);
    v27 = sub_247CEF580();
    v28 = sub_247CEF6DC();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      aBlock = v30;
      *(_DWORD *)v29 = 136446210;
      v53 = sub_247CB5D84(0xD00000000000002BLL, 0x8000000247CF4300, &aBlock);
      sub_247CEF748();
      _os_log_impl(&dword_247CAF000, v27, v28, "%{public}s invoked but session is nil", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v30, -1, -1);
      MEMORY[0x249590A5C](v29, -1, -1);
    }

    if (v45)
    {
      sub_247CDCA94();
      v31 = (void *)swift_allocError();
      *(_QWORD *)v32 = 0;
      *(_QWORD *)(v32 + 8) = 0;
      *(_BYTE *)(v32 + 16) = 5;
      v45(0, v31);

    }
  }
}

void sub_247CEA6C8(unsigned int a1, __n128 a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD, _QWORD), uint64_t a6, uint64_t a7, char a8, const char *a9, uint64_t a10, unint64_t a11, unint64_t a12, const char *a13)
{
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  uint64_t *v34;
  char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  void *v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  os_log_type_t v53;
  _BOOL4 v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  void (*v59)(_QWORD, _QWORD);
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  void *v64;
  os_log_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  uint64_t v71;
  unint64_t v72;
  id v73;
  NSObject *v74;
  os_log_type_t v75;
  uint8_t *v76;
  uint64_t v77;
  _QWORD v78[2];
  os_log_t v79;
  uint64_t v80;
  char *v81;
  int v82;
  uint64_t v83;
  uint8_t *v84;
  __n128 v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91[5];

  v85 = a2;
  v19 = sub_247CEF598();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19, v21);
  v23 = (char *)v78 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    swift_beginAccess();
    v31 = MEMORY[0x249590A98](a7 + 16);
    if (v31)
    {
      v32 = (void *)v31;
      v45 = (char *)sub_247CEF298(a4, a8);

      if (v45)
      {
        v46 = *(_QWORD *)&v45[OBJC_IVAR___WFAnisetteResponse_data];
        if (*(_QWORD *)(v46 + 16))
        {
          swift_bridgeObjectRetain();
          v47 = sub_247CDD1B8(0x6574746573696E61, 0xEC00000061746144);
          if ((v48 & 1) != 0)
          {
            sub_247CBBC1C(*(_QWORD *)(v46 + 56) + 32 * v47, (uint64_t)&v87);
          }
          else
          {
            v87 = 0;
            v88 = 0;
            v89 = 0;
            v90 = 1;
          }
          swift_bridgeObjectRelease();
          if (v90 != 1)
          {
            sub_247CEF3DC((uint64_t)&v87, (uint64_t)v91);
            if (v91[3])
            {
              sub_247CBBA5C(0, &qword_2576F2AE0);
              if ((swift_dynamicCast() & 1) != 0)
              {
                v49 = v86;
                if (qword_2576F1D00 != -1)
                  swift_once();
                v83 = a10;
                v84 = (uint8_t *)a11;
                v50 = __swift_project_value_buffer(v19, (uint64_t)qword_2576F49E8);
                (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v23, v50, v19);
                v51 = v49;
                v52 = sub_247CEF580();
                v53 = sub_247CEF6E8();
                v82 = v53;
                v54 = os_log_type_enabled(v52, v53);
                v85.n128_u64[0] = (unint64_t)v51;
                if (v54)
                {
                  v55 = swift_slowAlloc();
                  v79 = v52;
                  v56 = v55;
                  v80 = swift_slowAlloc();
                  v91[0] = v80;
                  *(_DWORD *)v56 = 136315394;
                  v78[1] = v56 + 4;
                  v57 = objc_msgSend(v51, sel_description);
                  v58 = sub_247CEF658();
                  v81 = v45;
                  v59 = a5;
                  v60 = v58;
                  v62 = v61;
                  v78[0] = v61;

                  v63 = v60;
                  a5 = v59;
                  v45 = v81;
                  v87 = sub_247CB5D84(v63, v62, v91);
                  sub_247CEF748();
                  v64 = (void *)v85.n128_u64[0];

                  swift_bridgeObjectRelease();
                  *(_WORD *)(v56 + 12) = 2080;
                  v87 = sub_247CB5D84(0x6863746566, 0xE500000000000000, v91);
                  sub_247CEF748();
                  v65 = v79;
                  _os_log_impl(&dword_247CAF000, v79, (os_log_type_t)v82, a9, (uint8_t *)v56, 0x16u);
                  v66 = v80;
                  swift_arrayDestroy();
                  MEMORY[0x249590A5C](v66, -1, -1);
                  MEMORY[0x249590A5C](v56, -1, -1);

                }
                else
                {

                }
                (*(void (**)(char *, uint64_t))(v20 + 8))(v23, v19);
                if (a5)
                {
                  v67 = qword_2576F1CF0;
                  swift_retain();
                  if (v67 != -1)
                    swift_once();
                  __swift_project_value_buffer(v19, (uint64_t)qword_2576F49B8);
                  v68 = sub_247CEF580();
                  v69 = sub_247CEF6E8();
                  if (os_log_type_enabled(v68, v69))
                  {
                    v70 = (uint8_t *)swift_slowAlloc();
                    v71 = swift_slowAlloc();
                    v91[0] = v71;
                    *(_DWORD *)v70 = 136446210;
                    v87 = sub_247CB5D84(v83, (unint64_t)v84, v91);
                    sub_247CEF748();
                    _os_log_impl(&dword_247CAF000, v68, v69, "Invoking completion block that was passed into: %{public}s", v70, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x249590A5C](v71, -1, -1);
                    MEMORY[0x249590A5C](v70, -1, -1);
                  }

                  v72 = v85.n128_u64[0];
                  v73 = (id)v85.n128_u64[0];
                  a5(v72, 0);

                  sub_247CBDE58((uint64_t)a5);
                }
                else
                {
                  if (qword_2576F1CF0 != -1)
                    swift_once();
                  __swift_project_value_buffer(v19, (uint64_t)qword_2576F49B8);
                  v74 = sub_247CEF580();
                  v75 = sub_247CEF6E8();
                  if (os_log_type_enabled(v74, v75))
                  {
                    v76 = (uint8_t *)swift_slowAlloc();
                    v77 = swift_slowAlloc();
                    v91[0] = v77;
                    *(_DWORD *)v76 = 136446210;
                    v87 = sub_247CB5D84(v83, (unint64_t)v84, v91);
                    sub_247CEF748();
                    _os_log_impl(&dword_247CAF000, v74, v75, "No completion block passed into %{public}s. ", v76, 0xCu);
                    swift_arrayDestroy();
                    MEMORY[0x249590A5C](v77, -1, -1);
                    MEMORY[0x249590A5C](v76, -1, -1);

                  }
                  else
                  {

                  }
                }
                return;
              }
LABEL_14:
              if (qword_2576F1CF0 != -1)
                swift_once();
              __swift_project_value_buffer(v19, (uint64_t)qword_2576F49B8);
              v35 = v45;
              v36 = sub_247CEF580();
              v37 = sub_247CEF6DC();
              if (os_log_type_enabled(v36, v37))
              {
                v85.n128_u64[0] = a12;
                v38 = (uint8_t *)swift_slowAlloc();
                v39 = swift_slowAlloc();
                v91[0] = v39;
                *(_DWORD *)v38 = 136315138;
                v84 = v38 + 4;
                v87 = (uint64_t)v45;
                v40 = v35;
                __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576F2E00);
                v41 = sub_247CEF664();
                v87 = sub_247CB5D84(v41, v42, v91);
                sub_247CEF748();

                swift_bridgeObjectRelease();
                _os_log_impl(&dword_247CAF000, v36, v37, (const char *)v85.n128_u64[0], v38, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x249590A5C](v39, -1, -1);
                MEMORY[0x249590A5C](v38, -1, -1);

                if (a5)
                {
LABEL_18:
                  sub_247CDCA94();
                  v43 = swift_allocError();
                  *(_OWORD *)v44 = xmmword_247CF1EB0;
                  *(_BYTE *)(v44 + 16) = 0;
                  a5(0, v43);

                  v30 = (void *)v43;
                  goto LABEL_19;
                }
              }
              else
              {

                if (a5)
                  goto LABEL_18;
              }

              return;
            }
            v33 = &qword_2576F24D0;
            v34 = v91;
LABEL_13:
            sub_247CBCE98((uint64_t)v34, v33);
            goto LABEL_14;
          }
LABEL_12:
          v33 = (uint64_t *)&unk_2576F2DF8;
          v34 = &v87;
          goto LABEL_13;
        }
      }
    }
    else
    {
      v45 = 0;
    }
    v87 = 0;
    v88 = 0;
    v89 = 0;
    v90 = 1;
    goto LABEL_12;
  }
  if (qword_2576F1D00 != -1)
    swift_once();
  __swift_project_value_buffer(v19, (uint64_t)qword_2576F49E8);
  v24 = sub_247CEF580();
  v25 = sub_247CEF6DC();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v26 = 67109120;
    LODWORD(v91[0]) = a1;
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v24, v25, a13, v26, 8u);
    MEMORY[0x249590A5C](v26, -1, -1);
  }

  if (a5)
  {
    v27 = a1;
    sub_247CDCA94();
    v28 = swift_allocError();
    *(_QWORD *)v29 = v27;
    *(_QWORD *)(v29 + 8) = 0;
    *(_BYTE *)(v29 + 16) = 4;
    a5(0, v28);
    v30 = (void *)v28;
LABEL_19:

  }
}

uint64_t sub_247CEB2BC(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  sub_247CBBA5C(0, &qword_2576F2AE8);
  type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
  result = sub_247CEF6F4();
  if (!result)
  {
    if (qword_2576F1CF0 != -1)
      swift_once();
    v5 = sub_247CEF598();
    __swift_project_value_buffer(v5, (uint64_t)qword_2576F49B8);
    sub_247CB5C7C(a1, a2);
    sub_247CB5C7C(a1, a2);
    v6 = sub_247CEF580();
    v7 = sub_247CEF6DC();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v13 = v9;
      *(_DWORD *)v8 = 136315138;
      sub_247CB5C7C(a1, a2);
      v10 = sub_247CEF4E4();
      v12 = v11;
      sub_247CB6504(a1, a2);
      sub_247CB5D84(v10, v12, &v13);
      sub_247CEF748();
      swift_bridgeObjectRelease();
      sub_247CB6504(a1, a2);
      sub_247CB6504(a1, a2);
      _os_log_impl(&dword_247CAF000, v6, v7, "Failed to unarchive anisette data response for %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v9, -1, -1);
      MEMORY[0x249590A5C](v8, -1, -1);
    }
    else
    {
      sub_247CB6504(a1, a2);
      sub_247CB6504(a1, a2);
    }

    return 0;
  }
  return result;
}

uint64_t sub_247CEB730(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_247CEF7E4();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_247CB674C(i, (uint64_t)v5);
    sub_247CBBA5C(0, &qword_2576F2C90);
    if (!swift_dynamicCast())
      break;
    sub_247CEF7CC();
    sub_247CEF7F0();
    sub_247CEF7FC();
    sub_247CEF7D8();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

id WFSetupServerAnisetteDataProvider.__deallocating_deinit()
{
  return sub_247CED41C(type metadata accessor for WFSetupServerAnisetteDataProvider);
}

uint64_t sub_247CEB8A8()
{
  sub_247CEF79C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  sub_247CEF67C();
  swift_bridgeObjectRetain();
  sub_247CEF628();
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 540697705;
}

uint64_t sub_247CEB9A8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[3];
  uint64_t v22;
  _QWORD v23[3];
  uint64_t v24;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR___WFAnisetteRequest_id);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___WFAnisetteRequest_id + 8);
  v24 = MEMORY[0x24BEE0D00];
  v23[0] = v3;
  v23[1] = v4;
  sub_247CBBC1C((uint64_t)v23, (uint64_t)v21);
  v5 = v22;
  if (v22)
  {
    v6 = __swift_project_boxed_opaque_existential_0(v21, v22);
    v7 = *(_QWORD *)(v5 - 8);
    MEMORY[0x24BDAC7A8](v6, v6);
    v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    swift_bridgeObjectRetain();
    v10 = sub_247CEF880();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  }
  else
  {
    swift_bridgeObjectRetain();
    v10 = 0;
  }
  v11 = (void *)sub_247CEF64C();
  objc_msgSend(a1, sel_encodeObject_forKey_, v10, v11);
  swift_unknownObjectRelease();

  sub_247CBCE98((uint64_t)v23, &qword_2576F24D0);
  v12 = *(_QWORD *)(v1 + OBJC_IVAR___WFAnisetteRequest_data);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2DF0);
  v23[0] = v12;
  sub_247CBBC1C((uint64_t)v23, (uint64_t)v21);
  v13 = v22;
  if (v22)
  {
    v14 = __swift_project_boxed_opaque_existential_0(v21, v22);
    v15 = *(_QWORD *)(v13 - 8);
    MEMORY[0x24BDAC7A8](v14, v14);
    v17 = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v15 + 16))(v17);
    swift_bridgeObjectRetain();
    v18 = sub_247CEF880();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  }
  else
  {
    swift_bridgeObjectRetain();
    v18 = 0;
  }
  v19 = (void *)sub_247CEF64C();
  objc_msgSend(a1, sel_encodeObject_forKey_, v18, v19);
  swift_unknownObjectRelease();

  return sub_247CBCE98((uint64_t)v23, &qword_2576F24D0);
}

id sub_247CEBC50(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  objc_super v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24[3];
  uint64_t v25;

  v3 = OBJC_IVAR___WFAnisetteRequest_data;
  v4 = v1;
  *(_QWORD *)&v1[v3] = sub_247CC01C4(MEMORY[0x24BEE4AF8]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2500);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_247CF1020;
  v6 = sub_247CBBA5C(0, (unint64_t *)&unk_2576F2510);
  *(_QWORD *)(v5 + 32) = v6;
  sub_247CEF724();
  swift_bridgeObjectRelease();
  if (!v25)
  {
    sub_247CBCE98((uint64_t)v24, &qword_2576F24D0);
    goto LABEL_7;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_7:
    if (qword_2576F1CF0 != -1)
      swift_once();
    v13 = sub_247CEF598();
    __swift_project_value_buffer(v13, (uint64_t)qword_2576F49B8);
    v14 = sub_247CEF580();
    v15 = sub_247CEF6DC();
    if (!os_log_type_enabled(v14, v15))
      goto LABEL_18;
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v24[0] = v17;
    *(_DWORD *)v16 = 136315138;
    v22 = sub_247CB5D84(0x6574746573696E41, 0xEF74736575716552, v24);
    sub_247CEF748();
    v18 = "Failed to decode id for object %s";
    goto LABEL_17;
  }
  v8 = v22;
  v7 = v23;
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_247CF1EC0;
  *(_QWORD *)(v9 + 32) = v6;
  *(_QWORD *)(v9 + 40) = sub_247CBBA5C(0, (unint64_t *)&unk_2576F2DD0);
  *(_QWORD *)(v9 + 48) = sub_247CBBA5C(0, &qword_2576F2530);
  *(_QWORD *)(v9 + 56) = sub_247CBBA5C(0, (unint64_t *)&qword_2576F2DE0);
  sub_247CEF724();
  swift_bridgeObjectRelease();
  if (!v25)
  {
    swift_bridgeObjectRelease();
    sub_247CBCE98((uint64_t)v24, &qword_2576F24D0);
LABEL_13:
    if (qword_2576F1CF0 != -1)
      swift_once();
    v19 = sub_247CEF598();
    __swift_project_value_buffer(v19, (uint64_t)qword_2576F49B8);
    v14 = sub_247CEF580();
    v15 = sub_247CEF6DC();
    if (!os_log_type_enabled(v14, v15))
      goto LABEL_18;
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v24[0] = v17;
    *(_DWORD *)v16 = 136315138;
    v22 = sub_247CB5D84(0x6574746573696E41, 0xEF74736575716552, v24);
    sub_247CEF748();
    v18 = "Failed to decode data for object %s";
LABEL_17:
    _os_log_impl(&dword_247CAF000, v14, v15, v18, v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v17, -1, -1);
    MEMORY[0x249590A5C](v16, -1, -1);
LABEL_18:

    swift_bridgeObjectRelease();
    type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
    swift_deallocPartialClassInstance();
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2DF0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  v10 = v22;
  v11 = (uint64_t *)&v4[OBJC_IVAR___WFAnisetteRequest_id];
  *v11 = v8;
  v11[1] = v7;
  *(_QWORD *)&v1[v3] = v10;

  swift_bridgeObjectRelease();
  v21.receiver = v4;
  v21.super_class = (Class)type metadata accessor for AnisetteServiceFactory.AnisetteRequest();
  v12 = objc_msgSendSuper2(&v21, sel_init);

  return v12;
}

uint64_t sub_247CEC130()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v34;
  void *v35;
  id v36[2];

  v36[1] = *(id *)MEMORY[0x24BDAC8D0];
  v36[0] = 0;
  v1 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, v0, 1, v36);
  v2 = v36[0];
  if (v1)
  {
    v3 = sub_247CEF4FC();

    if (qword_2576F1CF0 != -1)
      swift_once();
    v4 = sub_247CEF598();
    __swift_project_value_buffer(v4, (uint64_t)qword_2576F49B8);
    v5 = v0;
    v6 = sub_247CEF580();
    v7 = sub_247CEF6E8();
    if (os_log_type_enabled(v6, v7))
    {
      v34 = v3;
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = (void *)swift_slowAlloc();
      v36[0] = v9;
      *(_DWORD *)v8 = 136315138;
      v10 = objc_msgSend(v5, sel_description);
      v11 = sub_247CEF658();
      v13 = v12;

      v14 = v11;
      v3 = v34;
      sub_247CB5D84(v14, v13, (uint64_t *)v36);
      sub_247CEF748();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v6, v7, "Successfully archived request: %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v9, -1, -1);
      MEMORY[0x249590A5C](v8, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    v15 = v2;
    v16 = (void *)sub_247CEF4D8();

    swift_willThrow();
    if (qword_2576F1CF0 != -1)
      swift_once();
    v17 = sub_247CEF598();
    v3 = __swift_project_value_buffer(v17, (uint64_t)qword_2576F49B8);
    v18 = v0;
    v19 = v16;
    v20 = v18;
    v21 = v16;
    v22 = sub_247CEF580();
    v23 = sub_247CEF6DC();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = swift_slowAlloc();
      v35 = (void *)swift_slowAlloc();
      v36[0] = v35;
      *(_DWORD *)v24 = 136315394;
      v25 = objc_msgSend(v20, sel_description);
      v26 = v16;
      v27 = sub_247CEF658();
      v29 = v28;

      sub_247CB5D84(v27, v29, (uint64_t *)v36);
      sub_247CEF748();

      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2082;
      v30 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2DC0);
      v31 = sub_247CEF664();
      sub_247CB5D84(v31, v32, (uint64_t *)v36);
      sub_247CEF748();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_247CAF000, v22, v23, "Failed to archive request %s with error: %{public}s", (uint8_t *)v24, 0x16u);
      v3 = (uint64_t)v35;
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v35, -1, -1);
      MEMORY[0x249590A5C](v24, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
  }
  return v3;
}

id sub_247CEC608()
{
  return sub_247CED41C(type metadata accessor for AnisetteServiceFactory.AnisetteRequest);
}

id sub_247CEC634(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  void *v5;

  v4 = a1;
  a3();

  v5 = (void *)sub_247CEF64C();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_247CEC68C()
{
  sub_247CEF79C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  sub_247CEF67C();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F24D0);
  sub_247CEF628();
  sub_247CEF67C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 540697705;
}

uint64_t sub_247CEC78C(char a1)
{
  if ((a1 & 1) != 0)
    return 1635017060;
  else
    return 25705;
}

uint64_t sub_247CEC7B8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[3];
  uint64_t v22;
  _QWORD v23[3];
  uint64_t v24;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR___WFAnisetteResponse_id);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___WFAnisetteResponse_id + 8);
  v24 = MEMORY[0x24BEE0D00];
  v23[0] = v3;
  v23[1] = v4;
  sub_247CBBC1C((uint64_t)v23, (uint64_t)v21);
  v5 = v22;
  if (v22)
  {
    v6 = __swift_project_boxed_opaque_existential_0(v21, v22);
    v7 = *(_QWORD *)(v5 - 8);
    MEMORY[0x24BDAC7A8](v6, v6);
    v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v7 + 16))(v9);
    swift_bridgeObjectRetain();
    v10 = sub_247CEF880();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  }
  else
  {
    swift_bridgeObjectRetain();
    v10 = 0;
  }
  v11 = (void *)sub_247CEF64C();
  objc_msgSend(a1, sel_encodeObject_forKey_, v10, v11);
  swift_unknownObjectRelease();

  sub_247CBCE98((uint64_t)v23, &qword_2576F24D0);
  v12 = *(_QWORD *)(v1 + OBJC_IVAR___WFAnisetteResponse_data);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2DC8);
  v23[0] = v12;
  sub_247CBBC1C((uint64_t)v23, (uint64_t)v21);
  v13 = v22;
  if (v22)
  {
    v14 = __swift_project_boxed_opaque_existential_0(v21, v22);
    v15 = *(_QWORD *)(v13 - 8);
    MEMORY[0x24BDAC7A8](v14, v14);
    v17 = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v15 + 16))(v17);
    swift_bridgeObjectRetain();
    v18 = sub_247CEF880();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
  }
  else
  {
    swift_bridgeObjectRetain();
    v18 = 0;
  }
  v19 = (void *)sub_247CEF64C();
  objc_msgSend(a1, sel_encodeObject_forKey_, v18, v19);
  swift_unknownObjectRelease();

  return sub_247CBCE98((uint64_t)v23, &qword_2576F24D0);
}

id sub_247CECA60(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  os_log_type_t v18;
  objc_super v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[3];
  uint64_t v24;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2500);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_247CF1020;
  v4 = sub_247CBBA5C(0, (unint64_t *)&unk_2576F2510);
  *(_QWORD *)(v3 + 32) = v4;
  v5 = v1;
  sub_247CEF724();
  swift_bridgeObjectRelease();
  if (!v24)
  {

    sub_247CBCE98((uint64_t)v23, &qword_2576F24D0);
LABEL_8:
    if (qword_2576F1CF0 != -1)
      swift_once();
    v12 = sub_247CEF598();
    __swift_project_value_buffer(v12, (uint64_t)qword_2576F49B8);
    v13 = sub_247CEF580();
    v14 = sub_247CEF6DC();
    if (!os_log_type_enabled(v13, v14))
      goto LABEL_19;
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v23[0] = v16;
    *(_DWORD *)v15 = 136315138;
    v21 = sub_247CB5D84(0xD000000000000010, 0x8000000247CF1F20, v23);
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v13, v14, "Failed to decode id for object %s", v15, 0xCu);
    goto LABEL_18;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_8;
  }
  v7 = v21;
  v6 = v22;
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_247CF1050;
  *(_QWORD *)(v8 + 32) = v4;
  *(_QWORD *)(v8 + 40) = sub_247CBBA5C(0, (unint64_t *)&unk_2576F2DD0);
  *(_QWORD *)(v8 + 48) = sub_247CBBA5C(0, &qword_2576F2530);
  *(_QWORD *)(v8 + 56) = sub_247CBBA5C(0, (unint64_t *)&qword_2576F2DE0);
  *(_QWORD *)(v8 + 64) = sub_247CBBA5C(0, &qword_2576F2AE0);
  sub_247CEF724();
  swift_bridgeObjectRelease();
  if (!v24)
  {

    swift_bridgeObjectRelease();
    sub_247CBCE98((uint64_t)v23, &qword_2576F24D0);
LABEL_14:
    if (qword_2576F1CF0 != -1)
      swift_once();
    v17 = sub_247CEF598();
    __swift_project_value_buffer(v17, (uint64_t)qword_2576F49B8);
    v13 = sub_247CEF580();
    v18 = sub_247CEF6DC();
    if (!os_log_type_enabled(v13, v18))
      goto LABEL_19;
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v23[0] = v16;
    *(_DWORD *)v15 = 136315138;
    v21 = sub_247CB5D84(0xD000000000000010, 0x8000000247CF1F20, v23);
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v13, v18, "Failed to decode data for object %s", v15, 0xCu);
LABEL_18:
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v16, -1, -1);
    MEMORY[0x249590A5C](v15, -1, -1);
LABEL_19:

    type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
    swift_deallocPartialClassInstance();
    return 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2DC8);
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  v9 = v21;
  v10 = (uint64_t *)&v5[OBJC_IVAR___WFAnisetteResponse_id];
  *v10 = v7;
  v10[1] = v6;
  *(_QWORD *)&v5[OBJC_IVAR___WFAnisetteResponse_data] = v9;

  v20.receiver = v5;
  v20.super_class = (Class)type metadata accessor for AnisetteServiceFactory.AnisetteResponse();
  v11 = objc_msgSendSuper2(&v20, sel_init);

  return v11;
}

uint64_t sub_247CECF48()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v34;
  id v35[2];

  v35[1] = *(id *)MEMORY[0x24BDAC8D0];
  v35[0] = 0;
  v1 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, v0, 1, v35);
  v2 = v35[0];
  if (v1)
  {
    v3 = sub_247CEF4FC();

    if (qword_2576F1CF0 != -1)
      swift_once();
    v4 = sub_247CEF598();
    __swift_project_value_buffer(v4, (uint64_t)qword_2576F49B8);
    v5 = v0;
    v6 = sub_247CEF580();
    v7 = sub_247CEF6E8();
    if (os_log_type_enabled(v6, v7))
    {
      v34 = v3;
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = (void *)swift_slowAlloc();
      v35[0] = v9;
      *(_DWORD *)v8 = 136315138;
      v10 = objc_msgSend(v5, sel_description);
      v11 = sub_247CEF658();
      v13 = v12;

      v14 = v11;
      v3 = v34;
      sub_247CB5D84(v14, v13, (uint64_t *)v35);
      sub_247CEF748();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247CAF000, v6, v7, "Successfully archived response: %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v9, -1, -1);
      MEMORY[0x249590A5C](v8, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    v15 = v2;
    v16 = (void *)sub_247CEF4D8();

    swift_willThrow();
    if (qword_2576F1CF0 != -1)
      swift_once();
    v17 = sub_247CEF598();
    __swift_project_value_buffer(v17, (uint64_t)qword_2576F49B8);
    v18 = v0;
    v19 = v16;
    v20 = v18;
    v21 = v16;
    v22 = sub_247CEF580();
    v23 = sub_247CEF6DC();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = swift_slowAlloc();
      v25 = (void *)swift_slowAlloc();
      v35[0] = v25;
      *(_DWORD *)v24 = 136315394;
      v26 = objc_msgSend(v20, sel_description);
      v27 = sub_247CEF658();
      v29 = v28;

      sub_247CB5D84(v27, v29, (uint64_t *)v35);
      sub_247CEF748();

      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      v30 = v16;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2DC0);
      v31 = sub_247CEF664();
      sub_247CB5D84(v31, v32, (uint64_t *)v35);
      sub_247CEF748();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_247CAF000, v22, v23, "Failed to archive request %s with error: %s", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v25, -1, -1);
      MEMORY[0x249590A5C](v24, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  return v3;
}

id sub_247CED410()
{
  return sub_247CED41C(type metadata accessor for AnisetteServiceFactory.AnisetteResponse);
}

id sub_247CED41C(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_247CED460()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_247CED498()
{
  return swift_deallocClassInstance();
}

uint64_t sub_247CED4A8(char a1)
{
  uint64_t result;

  result = 0xD000000000000013;
  if (a1)
  {
    if (a1 == 1)
      return 0xD00000000000001BLL;
    else
      return 0x6E6F6973736573;
  }
  return result;
}

uint64_t static WFSetupServerAnisetteDataProvider.supportsSecureCoding.getter()
{
  return 1;
}

Swift::Void __swiftcall WFSetupServerAnisetteDataProvider.encode(with:)(NSCoder with)
{
  uint64_t v1;
  void **v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void **v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  void **v25;
  void *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  _QWORD v37[3];
  uint64_t v38;
  __int128 v39;
  __int128 v40;

  v3 = (void **)(v1 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice);
  swift_beginAccess();
  v4 = *v3;
  if (*v3)
  {
    *((_QWORD *)&v40 + 1) = sub_247CBBA5C(0, &qword_2576F2C98);
    *(_QWORD *)&v39 = v4;
    sub_247CBBC1C((uint64_t)&v39, (uint64_t)v37);
    v5 = v38;
    if (v38)
    {
      v6 = __swift_project_boxed_opaque_existential_0(v37, v38);
      v7 = *(_QWORD *)(v5 - 8);
      MEMORY[0x24BDAC7A8](v6, v6);
      v9 = (char *)&v37[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v7 + 16))(v9);
      v10 = v4;
      v11 = sub_247CEF880();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    }
    else
    {
      v12 = v4;
      v11 = 0;
    }
    v13 = (void *)sub_247CEF64C();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v11, v13);
    swift_unknownObjectRelease();

  }
  else
  {
    v39 = 0u;
    v40 = 0u;
  }
  sub_247CBCE98((uint64_t)&v39, &qword_2576F24D0);
  v14 = (void **)(v1 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount);
  swift_beginAccess();
  v15 = *v14;
  if (*v14)
  {
    *((_QWORD *)&v40 + 1) = sub_247CBBA5C(0, &qword_2576F2C90);
    *(_QWORD *)&v39 = v15;
    sub_247CBBC1C((uint64_t)&v39, (uint64_t)v37);
    v16 = v38;
    if (v38)
    {
      v17 = __swift_project_boxed_opaque_existential_0(v37, v38);
      v18 = *(_QWORD *)(v16 - 8);
      MEMORY[0x24BDAC7A8](v17, v17);
      v20 = (char *)&v37[-1] - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v18 + 16))(v20);
      v21 = v15;
      v22 = sub_247CEF880();
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v16);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    }
    else
    {
      v23 = v15;
      v22 = 0;
    }
    v24 = (void *)sub_247CEF64C();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v22, v24);
    swift_unknownObjectRelease();

  }
  else
  {
    v39 = 0u;
    v40 = 0u;
  }
  sub_247CBCE98((uint64_t)&v39, &qword_2576F24D0);
  v25 = (void **)(v1 + OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session);
  swift_beginAccess();
  v26 = *v25;
  if (*v25)
  {
    *((_QWORD *)&v40 + 1) = sub_247CBBA5C(0, &qword_2576F27F0);
    *(_QWORD *)&v39 = v26;
    sub_247CBBC1C((uint64_t)&v39, (uint64_t)v37);
    v27 = v38;
    if (v38)
    {
      v28 = __swift_project_boxed_opaque_existential_0(v37, v38);
      v29 = *(_QWORD *)(v27 - 8);
      MEMORY[0x24BDAC7A8](v28, v28);
      v31 = (char *)&v37[-1] - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v29 + 16))(v31);
      v32 = v26;
      v33 = sub_247CEF880();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v27);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    }
    else
    {
      v34 = v26;
      v33 = 0;
    }
    v35 = (void *)sub_247CEF64C();
    -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v33, v35);
    swift_unknownObjectRelease();

  }
  else
  {
    v39 = 0u;
    v40 = 0u;
  }
  sub_247CBCE98((uint64_t)&v39, &qword_2576F24D0);
}

uint64_t sub_247CED980(void (*a1)(void))
{
  a1();
  return sub_247CEF964();
}

uint64_t sub_247CED9A4()
{
  unint64_t v0;

  v0 = sub_247CEF850();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

void *sub_247CED9EC()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  const char *v30;
  id v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  id v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  char v49;
  id v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  const char *v58;
  NSObject *v59;
  os_log_type_t v60;
  id v61;
  os_log_type_t v62;
  id v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  void *v67;
  id v68;
  id v69;
  id v70;
  id v71;
  os_log_type_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  id v78;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93[3];
  uint64_t v94;

  if (qword_2576F1CF0 != -1)
    goto LABEL_76;
  while (1)
  {
    v0 = sub_247CEF598();
    __swift_project_value_buffer(v0, (uint64_t)qword_2576F49B8);
    v1 = sub_247CEF580();
    v2 = sub_247CEF6E8();
    if (os_log_type_enabled(v1, v2))
    {
      v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_247CAF000, v1, v2, "Accessing idmsAccountForICloud property", v3, 2u);
      MEMORY[0x249590A5C](v3, -1, -1);
    }

    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB4398]), sel_init);
    v5 = objc_msgSend(v4, sel_aa_primaryAppleAccount);
    if (!v5)
      break;
    v6 = v5;
    v7 = objc_msgSend(v5, sel_username);
    if (v7)
    {
      v8 = v7;
      v84 = sub_247CEF658();
      v87 = v9;

    }
    else
    {
      v84 = 0;
      v87 = 0;
    }
    v13 = objc_msgSend(v6, sel_aa_altDSID, v80);
    if (v13)
    {
      v14 = v13;
      v85 = sub_247CEF658();
      v16 = v15;

    }
    else
    {
      v85 = 0;
      v16 = 0;
    }
    v17 = (void *)sub_247CEF64C();
    v18 = objc_msgSend(v6, sel_accountPropertyForKey_, v17);

    if (v18)
    {
      sub_247CEF760();
      swift_unknownObjectRelease();
    }
    else
    {
      v91 = 0u;
      v92 = 0u;
    }
    sub_247CEF3DC((uint64_t)&v91, (uint64_t)v93);
    if (v94)
    {
      sub_247CBBA5C(0, (unint64_t *)&unk_2576F2DD0);
      if (swift_dynamicCast())
        v19 = v90;
      else
        v19 = 0;
    }
    else
    {
      sub_247CBCE98((uint64_t)v93, &qword_2576F24D0);
      v19 = 0;
    }
    v20 = objc_msgSend(v4, sel_accountTypeWithAccountTypeIdentifier_, *MEMORY[0x24BDB4080]);
    v21 = objc_msgSend(v4, sel_accountsWithAccountType_, v20);
    if (!v21
      || (v22 = v21,
          v23 = sub_247CEF6AC(),
          v22,
          v24 = sub_247CEB730(v23),
          swift_bridgeObjectRelease(),
          !v24))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v27 = sub_247CEF580();
      v28 = sub_247CEF6DC();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v29 = 0;
        v30 = "Failed to retrieve idms accounts";
        goto LABEL_81;
      }
LABEL_82:

      return 0;
    }
    if (v24 >> 62)
    {
      swift_bridgeObjectRetain();
      v25 = sub_247CEF814();
      swift_bridgeObjectRelease();
      if (!v25)
      {
LABEL_78:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_79:
        v27 = sub_247CEF580();
        v28 = sub_247CEF6DC();
        if (os_log_type_enabled(v27, v28))
        {
          v29 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v29 = 0;
          v30 = "Failed to find idms account asscociated with primary icloud account";
LABEL_81:
          _os_log_impl(&dword_247CAF000, v27, v28, v30, v29, 2u);
          MEMORY[0x249590A5C](v29, -1, -1);
        }
        goto LABEL_82;
      }
    }
    else
    {
      v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v25)
        goto LABEL_78;
    }
    v83 = v19;
    v80 = v20;
    v81 = v6;
    v82 = v4;
    v26 = 4;
    while (1)
    {
      v31 = (v24 & 0xC000000000000001) != 0
          ? (id)MEMORY[0x249590450](v26 - 4, v24)
          : *(id *)(v24 + 8 * v26);
      v32 = v31;
      v33 = v26 - 3;
      if (__OFADD__(v26 - 4, 1))
        break;
      v34 = objc_msgSend(v31, sel_aa_altDSID);
      if (v34)
      {
        v35 = v34;
        v36 = sub_247CEF658();
        v38 = v37;

        if (v16)
        {
          if (v36 == v85 && v16 == v38)
          {
            v36 = v85;
LABEL_61:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v50 = v32;
            swift_bridgeObjectRetain();
            v51 = sub_247CEF580();
            v52 = sub_247CEF6E8();
            if (!os_log_type_enabled(v51, v52))
            {

              swift_bridgeObjectRelease_n();
              return v32;
            }
            v53 = swift_slowAlloc();
            v88 = swift_slowAlloc();
            v93[0] = v88;
            *(_DWORD *)v53 = 136315394;
            v54 = objc_msgSend(v50, sel_description);
            v55 = sub_247CEF658();
            v57 = v56;

            *(_QWORD *)&v91 = sub_247CB5D84(v55, v57, v93);
            sub_247CEF748();

            swift_bridgeObjectRelease();
            *(_WORD *)(v53 + 12) = 2080;
            swift_bridgeObjectRetain();
            *(_QWORD *)&v91 = sub_247CB5D84(v36, v38, v93);
            sub_247CEF748();
            swift_bridgeObjectRelease_n();
            v58 = "Found idms account: %s with matching dsid: %s";
            v59 = v51;
            v60 = v52;
LABEL_67:
            _os_log_impl(&dword_247CAF000, v59, v60, v58, (uint8_t *)v53, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x249590A5C](v88, -1, -1);
            MEMORY[0x249590A5C](v53, -1, -1);

LABEL_68:
            v67 = v81;
LABEL_70:

LABEL_71:
            return v32;
          }
          if ((sub_247CEF88C() & 1) != 0)
            goto LABEL_61;
        }
        swift_bridgeObjectRelease();
      }
      v40 = objc_msgSend(v32, sel_username, v80);
      if (v40)
      {
        v41 = v40;
        v42 = sub_247CEF658();
        v44 = v43;

        if (v87)
        {
          if (v42 == v84 && v87 == v44)
          {
            v42 = v84;
LABEL_65:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v61 = v32;
            swift_bridgeObjectRetain();
            v51 = sub_247CEF580();
            v62 = sub_247CEF6E8();
            if (os_log_type_enabled(v51, v62))
            {
              v53 = swift_slowAlloc();
              v88 = swift_slowAlloc();
              v93[0] = v88;
              *(_DWORD *)v53 = 136315394;
              v63 = objc_msgSend(v61, sel_description);
              v64 = sub_247CEF658();
              v66 = v65;

              *(_QWORD *)&v91 = sub_247CB5D84(v64, v66, v93);
              sub_247CEF748();

              swift_bridgeObjectRelease();
              *(_WORD *)(v53 + 12) = 2080;
              swift_bridgeObjectRetain();
              *(_QWORD *)&v91 = sub_247CB5D84(v42, v44, v93);
              sub_247CEF748();
              swift_bridgeObjectRelease_n();
              v58 = "Found idms account: %s with matching username: %s";
              v59 = v51;
              v60 = v62;
              goto LABEL_67;
            }

            swift_bridgeObjectRelease_n();
            v67 = v83;
            goto LABEL_70;
          }
          if ((sub_247CEF88C() & 1) != 0)
            goto LABEL_65;
        }
        swift_bridgeObjectRelease();
      }
      v45 = (void *)sub_247CEF64C();
      v46 = objc_msgSend(v32, sel_accountPropertyForKey_, v45);

      if (v46)
      {
        sub_247CEF760();
        swift_unknownObjectRelease();
      }
      else
      {
        v91 = 0u;
        v92 = 0u;
      }
      sub_247CEF3DC((uint64_t)&v91, (uint64_t)v93);
      if (v94)
      {
        sub_247CBBA5C(0, (unint64_t *)&unk_2576F2DD0);
        if ((swift_dynamicCast() & 1) != 0)
        {
          if (v83)
          {
            v47 = v90;
            v48 = v83;
            v49 = sub_247CEF730();

            if ((v49 & 1) != 0)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v68 = v32;
              v69 = v47;
              v70 = v68;
              v71 = v69;
              v51 = sub_247CEF580();
              v72 = sub_247CEF6E8();
              if (os_log_type_enabled(v51, v72))
              {
                v73 = swift_slowAlloc();
                v86 = (_QWORD *)swift_slowAlloc();
                v89 = swift_slowAlloc();
                v93[0] = v89;
                *(_DWORD *)v73 = 136315394;
                v74 = objc_msgSend(v70, sel_description);
                v75 = sub_247CEF658();
                v77 = v76;

                *(_QWORD *)&v91 = sub_247CB5D84(v75, v77, v93);
                sub_247CEF748();

                swift_bridgeObjectRelease();
                *(_WORD *)(v73 + 12) = 2112;
                *(_QWORD *)&v91 = v71;
                v78 = v71;
                sub_247CEF748();
                *v86 = v71;

                _os_log_impl(&dword_247CAF000, v51, v72, "Found idms account: %s with matching dsid: %@", (uint8_t *)v73, 0x16u);
                __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2740);
                swift_arrayDestroy();
                MEMORY[0x249590A5C](v86, -1, -1);
                swift_arrayDestroy();
                MEMORY[0x249590A5C](v89, -1, -1);
                MEMORY[0x249590A5C](v73, -1, -1);

                goto LABEL_68;
              }

              goto LABEL_71;
            }

          }
          else
          {

          }
        }

      }
      else
      {

        sub_247CBCE98((uint64_t)v93, &qword_2576F24D0);
      }
      ++v26;
      if (v33 == v25)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v6 = v81;
        v4 = v82;
        v20 = v80;
        v19 = v83;
        goto LABEL_79;
      }
    }
    __break(1u);
LABEL_76:
    swift_once();
  }
  v10 = sub_247CEF580();
  v11 = sub_247CEF6DC();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_247CAF000, v10, v11, "Failed to retrieve primary iCloud account", v12, 2u);
    MEMORY[0x249590A5C](v12, -1, -1);
  }

  return 0;
}

id sub_247CEE670()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  void *v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  id v30[2];

  v30[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = sub_247CED9EC();
  if (!v0)
  {
    if (qword_2576F1CF0 != -1)
      swift_once();
    v13 = sub_247CEF598();
    __swift_project_value_buffer(v13, (uint64_t)qword_2576F49B8);
    v14 = sub_247CEF580();
    v15 = sub_247CEF6DC();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_247CAF000, v14, v15, "Unable to provide clientDeviceAccount due to failure to retrieve idms account", v16, 2u);
      MEMORY[0x249590A5C](v16, -1, -1);
    }

    return 0;
  }
  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v3 = objc_msgSend(v2, sel_transportableAuthKitAccount_, v1);

  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB4398]), sel_init);
  v30[0] = 0;
  v5 = objc_msgSend(v4, sel_credentialForAccount_error_, v3, v30);

  if (!v5)
  {
    v17 = v30[0];
    v18 = (void *)sub_247CEF4D8();

    swift_willThrow();
    if (qword_2576F1CF0 != -1)
      swift_once();
    v19 = sub_247CEF598();
    __swift_project_value_buffer(v19, (uint64_t)qword_2576F49B8);
    v20 = v18;
    v21 = v18;
    v22 = sub_247CEF580();
    v23 = sub_247CEF6DC();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = (void *)swift_slowAlloc();
      v30[0] = v25;
      *(_DWORD *)v24 = 136446210;
      v26 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2DC0);
      v27 = sub_247CEF664();
      sub_247CB5D84(v27, v28, (uint64_t *)v30);
      sub_247CEF748();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_247CAF000, v22, v23, "Failed to retrieve account credentials due to error: %{public}s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249590A5C](v25, -1, -1);
      MEMORY[0x249590A5C](v24, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  v6 = qword_2576F1CF0;
  v7 = v30[0];
  if (v6 != -1)
    swift_once();
  v8 = sub_247CEF598();
  __swift_project_value_buffer(v8, (uint64_t)qword_2576F49B8);
  v9 = sub_247CEF580();
  v10 = sub_247CEF6E8();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_247CAF000, v9, v10, "Successfully retrieved accounts credentials", v11, 2u);
    MEMORY[0x249590A5C](v11, -1, -1);
  }

  if (v3)
  {
    v12 = v3;
    objc_msgSend(v12, sel_setCredential_, v5);

  }
  else
  {

  }
  return v3;
}

id sub_247CEEAE0()
{
  char *v0;
  void **v1;
  void **v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v17;
  objc_super v18;
  uint64_t v19;
  uint64_t v20[3];
  uint64_t v21;

  *(_QWORD *)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_session] = 0;
  v1 = (void **)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice];
  *(_QWORD *)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_companionAuthDevice] = 0;
  v2 = (void **)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount];
  *(_QWORD *)&v0[OBJC_IVAR____TtC10TDGSharing33WFSetupServerAnisetteDataProvider_transportableAuthKitAccount] = 0;
  v3 = qword_2576F1CF0;
  v4 = v0;
  if (v3 != -1)
    swift_once();
  v5 = sub_247CEF598();
  __swift_project_value_buffer(v5, (uint64_t)qword_2576F49B8);
  v6 = sub_247CEF580();
  v7 = sub_247CEF6E8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v20[0] = v9;
    *(_DWORD *)v8 = 136446210;
    v19 = sub_247CB5D84(0x646F632874696E69, 0xEC000000293A7265, v20);
    sub_247CEF748();
    _os_log_impl(&dword_247CAF000, v6, v7, "%{public}s is invoked.", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249590A5C](v9, -1, -1);
    MEMORY[0x249590A5C](v8, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576F2500);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_247CF1020;
  *(_QWORD *)(v10 + 32) = sub_247CBBA5C(0, &qword_2576F2C98);
  sub_247CEF724();
  swift_bridgeObjectRelease();
  if (v21)
  {
    if (swift_dynamicCast())
      v11 = (void *)v19;
    else
      v11 = 0;
  }
  else
  {
    sub_247CBCE98((uint64_t)v20, &qword_2576F24D0);
    v11 = 0;
  }
  swift_beginAccess();
  v12 = *v1;
  *v1 = v11;

  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_247CF1020;
  *(_QWORD *)(v13 + 32) = sub_247CBBA5C(0, &qword_2576F2C90);
  sub_247CEF724();
  swift_bridgeObjectRelease();
  if (v21)
  {
    if (swift_dynamicCast())
      v14 = v17;
    else
      v14 = 0;
  }
  else
  {
    sub_247CBCE98((uint64_t)v20, &qword_2576F24D0);
    v14 = 0;
  }
  swift_beginAccess();
  v15 = *v2;
  *v2 = v14;

  v18.receiver = v4;
  v18.super_class = (Class)type metadata accessor for WFSetupServerAnisetteDataProvider();
  return objc_msgSendSuper2(&v18, sel_init);
}

uint64_t type metadata accessor for AnisetteServiceFactory.AnisetteRequest()
{
  return objc_opt_self();
}

uint64_t sub_247CEEE90()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_247CEEEB8(unsigned int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_247CE65BC(a1, a2, a3, *(void (**)(_QWORD, _QWORD))(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

void sub_247CEEEE0(unsigned int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_247CE79FC(a1, a2, a3, *(void (**)(_QWORD, _QWORD))(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32));
}

void sub_247CEEEF0(unsigned int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_247CE8C64(a1, a2, a3, *(void (**)(_QWORD, _QWORD))(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32));
}

void sub_247CEEF00(unsigned int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_247CEA6C8(a1, (__n128)xmmword_247CF1E70, a2, a3, *(void (**)(_QWORD, _QWORD))(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), 3, "Received response: anisetteData %s for service id: %s", 0xD00000000000003BLL, 0x8000000247CF42C0, (unint64_t)"Failed to retrieve value for anisetteData from anisetteResponse: %s", "Fetch Anisette request failed with error: %d");
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_247CEEFB4(unsigned int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_247CEA6C8(a1, (__n128)xmmword_247CF1EA0, a2, a3, *(void (**)(_QWORD, _QWORD))(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), 4, "Received response: legacyAnisetteData %s for service id: %s", 0xD00000000000002BLL, 0x8000000247CF4300, (unint64_t)"Failed to retrieve value for legacy anisetteData from anisetteResponse: %s", "Legacy fetch Anisette request failed with error: %d");
}

uint64_t type metadata accessor for AnisetteServiceFactory()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for AnisetteServiceFactory.AnisetteResponse()
{
  return objc_opt_self();
}

uint64_t sub_247CEF074(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for WFSetupServerAnisetteDataProvider.AnisetteErrors(uint64_t a1)
{
  return sub_247CEF09C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_247CEF09C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s10TDGSharing33WFSetupServerAnisetteDataProviderC14AnisetteErrorsOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_247CEF074(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for WFSetupServerAnisetteDataProvider.AnisetteErrors(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_247CEF074(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_247CEF09C(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for WFSetupServerAnisetteDataProvider.AnisetteErrors(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_247CEF09C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for WFSetupServerAnisetteDataProvider.AnisetteErrors(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 5)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for WFSetupServerAnisetteDataProvider.AnisetteErrors(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 251;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_247CEF234(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 4u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 5);
}

uint64_t sub_247CEF24C(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    *(_QWORD *)result = a2 - 5;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 5;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for WFSetupServerAnisetteDataProvider.AnisetteErrors()
{
  return &type metadata for WFSetupServerAnisetteDataProvider.AnisetteErrors;
}

uint64_t sub_247CEF274()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_247CEF298(uint64_t a1, char a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  if (!a1 || (v3 = sub_247CDBB40(a1)) == 0)
  {
    sub_247CDCA94();
    swift_allocError();
    v10 = 0;
    *(_QWORD *)v11 = 1;
    v12 = 5;
LABEL_10:
    *(_QWORD *)(v11 + 8) = v10;
    *(_BYTE *)(v11 + 16) = v12;
    swift_willThrow();
    return v10;
  }
  v4 = v3;
  if (!*(_QWORD *)(v3 + 16) || (v5 = sub_247CDD1B8(0xD00000000000001CLL, 0x8000000247CF3D80), (v6 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_9:
    v13 = 8 * a2;
    v14 = *(_QWORD *)&aProvisiosync_0[v13];
    v10 = *(_QWORD *)&aN_0[v13];
    sub_247CDCA94();
    swift_allocError();
    *(_QWORD *)v11 = v14;
    v12 = 3;
    goto LABEL_10;
  }
  v7 = (uint64_t *)(*(_QWORD *)(v4 + 56) + 16 * v5);
  v8 = *v7;
  v9 = v7[1];
  sub_247CB5C7C(*v7, v9);
  swift_bridgeObjectRelease();
  v10 = sub_247CEB2BC(v8, v9);
  sub_247CB6504(v8, v9);
  if (!v10)
    goto LABEL_9;
  return v10;
}

uint64_t sub_247CEF3DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576F24D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247CEF454()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_247CEF460()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_247CEF46C()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_247CEF478()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_247CEF484()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_247CEF490()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_247CEF49C()
{
  return MEMORY[0x24BDCC240]();
}

uint64_t sub_247CEF4A8()
{
  return MEMORY[0x24BDCC248]();
}

uint64_t sub_247CEF4B4()
{
  return MEMORY[0x24BDCC250]();
}

uint64_t sub_247CEF4C0()
{
  return MEMORY[0x24BDCC258]();
}

uint64_t sub_247CEF4CC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_247CEF4D8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_247CEF4E4()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_247CEF4F0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_247CEF4FC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_247CEF508()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_247CEF514()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_247CEF520()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_247CEF52C()
{
  return MEMORY[0x24BDCE9B8]();
}

uint64_t sub_247CEF538()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_247CEF544()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_247CEF550()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_247CEF55C()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_247CEF568()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_247CEF574()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_247CEF580()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_247CEF58C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_247CEF598()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_247CEF5A4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_247CEF5B0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_247CEF5BC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_247CEF5C8()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_247CEF5D4()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_247CEF5E0()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_247CEF5EC()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_247CEF5F8()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_247CEF604()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_247CEF610()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t sub_247CEF61C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_247CEF628()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_247CEF634()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_247CEF640()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_247CEF64C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_247CEF658()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_247CEF664()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_247CEF670()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_247CEF67C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_247CEF688()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_247CEF694()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_247CEF6A0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_247CEF6AC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_247CEF6B8()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_247CEF6C4()
{
  return MEMORY[0x24BEE1168]();
}

uint64_t sub_247CEF6D0()
{
  return MEMORY[0x24BDCFDF8]();
}

uint64_t sub_247CEF6DC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_247CEF6E8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_247CEF6F4()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_247CEF700()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_247CEF70C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_247CEF718()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_247CEF724()
{
  return MEMORY[0x24BDD0178]();
}

uint64_t sub_247CEF730()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_247CEF73C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_247CEF748()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_247CEF754()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_247CEF760()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_247CEF76C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_247CEF778()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_247CEF784()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_247CEF790()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_247CEF79C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_247CEF7A8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_247CEF7B4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_247CEF7C0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_247CEF7CC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_247CEF7D8()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_247CEF7E4()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_247CEF7F0()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_247CEF7FC()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_247CEF808()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_247CEF814()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_247CEF820()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_247CEF82C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_247CEF838()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_247CEF844()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_247CEF850()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_247CEF85C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_247CEF868()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_247CEF874()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_247CEF880()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_247CEF88C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_247CEF898()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_247CEF8A4()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_247CEF8B0()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_247CEF8BC()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_247CEF8C8()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_247CEF8D4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_247CEF8E0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_247CEF8EC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_247CEF8F8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_247CEF904()
{
  return MEMORY[0x24BDD0798]();
}

uint64_t sub_247CEF910()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_247CEF91C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_247CEF928()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_247CEF934()
{
  return MEMORY[0x24BDD07C8]();
}

uint64_t sub_247CEF940()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_247CEF94C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_247CEF958()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_247CEF964()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t MobileGestalt_copy_productType_obj()
{
  return MEMORY[0x24BED8548]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
}

uint64_t NSDictionaryGetNSNumber()
{
  return MEMORY[0x24BE29680]();
}

uint64_t SFDeviceClassCodeGet()
{
  return MEMORY[0x24BE90278]();
}

uint64_t _AXSCopySettingsDataBlobForBuddy()
{
  return MEMORY[0x24BED21A8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

