void sub_228D1A6C0(_Unwind_Exception *a1)
{
  __48__SHSRingerControl_canChangeRingtoneWithButtons__block_invoke();
  _Unwind_Resume(a1);
}

id _SHSCTClient()
{
  if (_SHSCTClient_onceToken != -1)
    dispatch_once(&_SHSCTClient_onceToken, &__block_literal_global);
  return (id)_SHSCTClient_coreTelephonyClient;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_228D1DC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL SHSSystemHapticsSetting()
{
  return CFPreferencesGetAppBooleanValue(CFSTR("effects-haptic"), CFSTR("com.apple.preferences.sounds"), 0) != 0;
}

id SHS_BundleForSoundsAndHapticsSettingsFramework()
{
  if (SHS_BundleForSoundsAndHapticsSettingsFramework_onceToken != -1)
    dispatch_once(&SHS_BundleForSoundsAndHapticsSettingsFramework_onceToken, &__block_literal_global_0);
  return (id)SHS_BundleForSoundsAndHapticsSettingsFramework__soundsAndHapticsSettingsFrameworkBundle;
}

id SHS_LocalizedStringForSounds(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  SHS_BundleForSoundsAndHapticsSettingsFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, 0, CFSTR("Sounds"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id SHSLogForCategory(unint64_t a1)
{
  if (a1 >= 2)
    SHSLogForCategory_cold_1();
  if (SHSLogForCategory_loggingToken != -1)
    dispatch_once(&SHSLogForCategory_loggingToken, &__block_literal_global_1);
  return (id)SHSLogForCategory_logObjects[a1];
}

void sub_228D24918(_Unwind_Exception *a1)
{
  __27__SHSRingerControl_dealloc__block_invoke();
  _Unwind_Resume(a1);
}

void sub_228D24B78(_Unwind_Exception *a1)
{
  __26__SHSRingerControl__setup__block_invoke();
  _Unwind_Resume(a1);
}

void sub_228D24D70(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_228D24D88(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  sub_228D24D70(a1);
}

void sub_228D25030(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_228D2526C(_Unwind_Exception *a1)
{
  __26__SHSRingerControl_reload__block_invoke();
  _Unwind_Resume(a1);
}

void sub_228D25764(_Unwind_Exception *a1)
{
  __30__SHSRingerControl_setVolume___block_invoke();
  _Unwind_Resume(a1);
}

void sub_228D25CCC(_Unwind_Exception *a1)
{
  __34__SHSRingerControl__updateVolume___block_invoke();
  _Unwind_Resume(a1);
}

void sub_228D261B4(_Unwind_Exception *a1)
{
  __64__SHSRingerControl__handleEffectiveVolumeDidChangeNotification___block_invoke();
  _Unwind_Resume(a1);
}

void sub_228D26388(_Unwind_Exception *a1)
{
  __60__SHSRingerControl__handleServerConnectionDiedNotification___block_invoke();
  _Unwind_Resume(a1);
}

uint64_t unknownWiredDeviceStatusChanged(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadSpecifiers");
}

void sub_228D2A80C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void unknownWiredDeviceStatusChanged_0(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  objc_msgSend(a2, "reloadSpecifiers");
  objc_msgSend(a2, "audioSettingsManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getPreferenceFor:", *MEMORY[0x24BE0A1A0]);
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
LABEL_3:

    return;
  }
  objc_msgSend(a2, "audioSettingsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getPreferenceFor:", *MEMORY[0x24BE0A1D0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=Sounds&path=HEADPHONE_LEVEL_LIMIT_SETTING"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "openSensitiveURL:withOptions:", v4, 0);
    goto LABEL_3;
  }
}

void sub_228D2B618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t static HeadphoneNotificationChartFactory.create()()
{
  void *v0;
  id v1;
  id v2;

  if (qword_255A16068 != -1)
    swift_once();
  v0 = (void *)static HeadphoneAudioNotificationModel.shared;
  type metadata accessor for HeadphoneAudioNotificationModel();
  sub_228D2D734(&qword_255A16070, (uint64_t (*)(uint64_t))type metadata accessor for HeadphoneAudioNotificationModel, (uint64_t)&protocol conformance descriptor for HeadphoneAudioNotificationModel);
  v1 = v0;
  sub_228D31D54();
  v2 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_255A16078));
  return sub_228D31DE4();
}

id HeadphoneNotificationChartFactory.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id HeadphoneNotificationChartFactory.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneNotificationChartFactory();
  return objc_msgSendSuper2(&v2, sel_init);
}

id HeadphoneNotificationChartFactory.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneNotificationChartFactory();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_228D2BA58@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t OpaqueTypeConformance2;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t KeyPath;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v52[5];
  id v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;

  v54 = a1;
  v69 = a3;
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A160A8);
  v58 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A160B0);
  v8 = *(_QWORD *)(v7 - 8);
  v60 = v7;
  v61 = v8;
  MEMORY[0x24BDAC7A8]();
  v55 = (char *)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A160B8);
  v67 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8]();
  v57 = (char *)v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A160C0);
  v66 = *(_QWORD *)(v68 - 8);
  MEMORY[0x24BDAC7A8]();
  v59 = (char *)v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A160C8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A160D0);
  MEMORY[0x24BDAC7A8]();
  v62 = (uint64_t)v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  v15 = a2;
  sub_228D31D24();

  swift_release();
  swift_release();
  v76 = v72;
  v52[4] = swift_getKeyPath();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  *(_QWORD *)(v16 + 24) = v15;
  v53 = v15;
  v52[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_255A160D8);
  v52[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_255A160E0);
  v52[1] = sub_228D2DCD4(&qword_255A160E8, &qword_255A160D8, MEMORY[0x24BEE12D8]);
  sub_228D2D734(&qword_255A160F0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE930]);
  v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A160F8);
  v18 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A16100);
  v19 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A16108);
  v72 = sub_228D31CDC();
  v73 = MEMORY[0x24BDB8168];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v21 = sub_228D2D64C();
  v22 = MEMORY[0x24BEE0D00];
  v72 = v19;
  v73 = MEMORY[0x24BEE0D00];
  v74 = OpaqueTypeConformance2;
  v75 = v21;
  v23 = swift_getOpaqueTypeConformance2();
  v72 = v18;
  v73 = v22;
  v74 = v23;
  v75 = v21;
  v24 = swift_getOpaqueTypeConformance2();
  v72 = v17;
  v73 = MEMORY[0x24BDF1FA8];
  v74 = v24;
  v75 = MEMORY[0x24BDF1F80];
  swift_getOpaqueTypeConformance2();
  sub_228D31CC4();
  v25 = sub_228D2DCD4(&qword_255A16118, &qword_255A160A8, MEMORY[0x24BDB8148]);
  v26 = v55;
  v27 = v56;
  sub_228D31E8C();
  v28 = v27;
  (*(void (**)(char *, uint64_t))(v58 + 8))(v6, v27);
  v70 = v54;
  v71 = v53;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A16120);
  v72 = v28;
  v73 = v25;
  v30 = swift_getOpaqueTypeConformance2();
  v31 = sub_228D2DCD4(&qword_255A16128, &qword_255A16120, MEMORY[0x24BDB82F0]);
  v32 = v57;
  v33 = v60;
  sub_228D31E80();
  (*(void (**)(char *, uint64_t))(v61 + 8))(v26, v33);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A16130);
  v72 = v33;
  v73 = v29;
  v74 = v30;
  v75 = v31;
  swift_getOpaqueTypeConformance2();
  sub_228D2D698();
  v34 = v59;
  v35 = v64;
  sub_228D31E98();
  (*(void (**)(char *, uint64_t))(v67 + 8))(v32, v35);
  v36 = sub_228D31EEC();
  KeyPath = swift_getKeyPath();
  v38 = v66;
  v39 = v68;
  (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v13, v34, v68);
  v40 = (uint64_t *)&v13[*(int *)(v63 + 36)];
  *v40 = KeyPath;
  v40[1] = v36;
  (*(void (**)(char *, uint64_t))(v38 + 8))(v34, v39);
  v41 = sub_228D31F04();
  LOBYTE(KeyPath) = sub_228D31DFC();
  v42 = v62;
  sub_228D2D7C4((uint64_t)v13, v62, &qword_255A160C8);
  v43 = v42 + *(int *)(v65 + 36);
  *(_QWORD *)v43 = v41;
  *(_BYTE *)(v43 + 8) = KeyPath;
  sub_228D2D9C4((uint64_t)v13, &qword_255A160C8);
  LOBYTE(v41) = sub_228D31DFC();
  v44 = v69;
  sub_228D2D7C4(v42, v69, &qword_255A160D0);
  v45 = v44 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255A16158) + 36);
  *(_BYTE *)v45 = v41;
  *(_OWORD *)(v45 + 8) = xmmword_228D33960;
  __asm { FMOV            V0.2D, #9.0 }
  *(_OWORD *)(v45 + 24) = _Q0;
  *(_BYTE *)(v45 + 40) = 0;
  return sub_228D2D9C4(v42, &qword_255A160D0);
}

uint64_t sub_228D2C0C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t OpaqueTypeConformance2;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  int *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;

  v72 = a2;
  v73 = a3;
  v76 = a4;
  v77 = a1;
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A16198);
  MEMORY[0x24BDAC7A8]();
  v71 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_228D31C88();
  v74 = *(_QWORD *)(v5 - 8);
  v75 = v5;
  MEMORY[0x24BDAC7A8]();
  v70 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_228D31DD8();
  v66 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8]();
  v65 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A161A0);
  MEMORY[0x24BDAC7A8]();
  v59 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A16170);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_228D31BBC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A161A8);
  MEMORY[0x24BDAC7A8]();
  v57 = sub_228D31CDC();
  v60 = *(_QWORD *)(v57 - 8);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A16108);
  v62 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8]();
  v56 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A16100);
  v64 = *(_QWORD *)(v78 - 8);
  MEMORY[0x24BDAC7A8]();
  v58 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A160F8);
  v69 = *(_QWORD *)(v68 - 8);
  MEMORY[0x24BDAC7A8]();
  v79 = (char *)&v54 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_228D31DCC();
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BDCF250], v11);
  v20 = sub_228D31BC8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v10, 1, 1, v20);
  v21 = v77;
  sub_228D31C40();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_228D2D9C4((uint64_t)v10, &qword_255A16170);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  sub_228D31DCC();
  v22 = (int *)v63;
  v55 = *(int *)(v63 + 48);
  v23 = v21;
  v83 = *(_QWORD *)(v21 + v55);
  sub_228D31C4C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v54 = sub_228D31B68();
  sub_228D31CD0();
  v24 = v66;
  v25 = v65;
  v26 = v67;
  (*(void (**)(char *, _QWORD, uint64_t))(v66 + 104))(v65, *MEMORY[0x24BDEEB68], v67);
  v27 = MEMORY[0x24BDB8168];
  v28 = v56;
  v29 = v57;
  sub_228D31BE0();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v16, v29);
  v30 = (uint64_t *)(v23 + v22[20]);
  v31 = v30[1];
  v83 = *v30;
  v84 = v31;
  v87 = v29;
  v88 = v27;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v33 = sub_228D2D64C();
  v34 = v58;
  v35 = v61;
  v36 = MEMORY[0x24BEE0D00];
  sub_228D31BF8();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v28, v35);
  v37 = (uint64_t *)(v23 + v22[16]);
  v38 = v37[1];
  v87 = *v37;
  v88 = v38;
  v83 = v35;
  v84 = v36;
  v85 = OpaqueTypeConformance2;
  v86 = v33;
  v39 = swift_getOpaqueTypeConformance2();
  v40 = v78;
  sub_228D31BEC();
  (*(void (**)(char *, uint64_t))(v64 + 8))(v34, v40);
  v41 = v70;
  sub_228D31C7C();
  v42 = v22;
  v43 = v22[12];
  v44 = v22[16];
  v45 = (uint64_t)v71;
  v46 = &v71[v44];
  v47 = &v71[v42[20]];
  v48 = v77;
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v54 - 8) + 16))(v71, v77);
  *(_QWORD *)(v45 + v43) = *(_QWORD *)(v48 + v55);
  v49 = v37[1];
  *(_QWORD *)v46 = *v37;
  *((_QWORD *)v46 + 1) = v49;
  v50 = v30[1];
  *(_QWORD *)v47 = *v30;
  *((_QWORD *)v47 + 1) = v50;
  v80 = v45;
  v81 = v72;
  v82 = v73;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_228D31F88();
  v83 = v78;
  v84 = MEMORY[0x24BEE0D00];
  v85 = v39;
  v86 = v33;
  swift_getOpaqueTypeConformance2();
  v51 = v68;
  v52 = v79;
  sub_228D31BD4();
  (*(void (**)(char *, uint64_t))(v74 + 8))(v41, v75);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v52, v51);
  return sub_228D2D9C4(v45, &qword_255A16198);
}

uint64_t sub_228D2C83C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  int *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t result;
  uint64_t *v35;
  _QWORD v36[2];
  uint64_t *v37;
  uint64_t v38;

  v37 = a2;
  sub_228D31B98();
  MEMORY[0x24BDAC7A8]();
  v36[1] = __swift_instantiateConcreteTypeFromMangledName(&qword_255A161B0);
  MEMORY[0x24BDAC7A8]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A16198);
  v3 = (int *)MEMORY[0x24BDAC7A8]();
  v5 = (char *)v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = v3[12];
  v7 = v3[16];
  v8 = &v5[v7];
  v9 = v3[20];
  v10 = &v5[v9];
  v11 = (_QWORD *)(a1 + v7);
  v12 = (_QWORD *)(a1 + v9);
  v13 = sub_228D31B68();
  v36[0] = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v36[0] + 16))(v5, a1, v13);
  v14 = *(_QWORD *)(a1 + v6);
  *(_QWORD *)&v5[v6] = v14;
  v15 = v11[1];
  *(_QWORD *)v8 = *v11;
  *((_QWORD *)v8 + 1) = v15;
  v16 = v12[1];
  *(_QWORD *)v10 = *v12;
  *((_QWORD *)v10 + 1) = v16;
  v38 = v14;
  sub_228D31B80();
  sub_228D2DA00();
  sub_228D31AD8();
  sub_228D2DCD4(&qword_255A161C0, &qword_255A161B0, MEMORY[0x24BDCC928]);
  v17 = sub_228D31E5C();
  v19 = v18;
  v21 = v20 & 1;
  (*(void (**)(char *, uint64_t))(v36[0] + 8))(v5, v13);
  v22 = objc_msgSend((id)objc_opt_self(), sel_tertiaryLabelColor);
  MEMORY[0x22E2BF560](v22);
  v23 = sub_228D31E44();
  v25 = v24;
  LOBYTE(v12) = v26;
  swift_release();
  LOBYTE(v5) = v12 & 1;
  sub_228D2DA44(v17, v19, v21);
  swift_bridgeObjectRelease();
  sub_228D31E2C();
  v27 = sub_228D31E50();
  v29 = v28;
  v31 = v30;
  v33 = v32;
  swift_release();
  sub_228D2DA44(v23, v25, (char)v5);
  result = swift_bridgeObjectRelease();
  v35 = v37;
  *v37 = v27;
  v35[1] = v29;
  *((_BYTE *)v35 + 16) = v31 & 1;
  v35[3] = v33;
  return result;
}

uint64_t sub_228D2CADC@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[4];

  v17[1] = a3;
  sub_228D31C64();
  MEMORY[0x24BDAC7A8]();
  sub_228D31C10();
  MEMORY[0x24BDAC7A8]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A16170);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_228D31BBC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_228D31C28();
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BDCF250], v7);
  v11 = sub_228D31BC8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 1, 1, v11);
  sub_228D31C1C();
  sub_228D2D9C4((uint64_t)v6, &qword_255A16170);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  v13 = a2;
  sub_228D31C04();
  sub_228D31C58();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A16178);
  v14 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A16180);
  v15 = sub_228D2DCD4(&qword_255A16188, &qword_255A16180, MEMORY[0x24BDB7E40]);
  v17[2] = v14;
  v17[3] = v15;
  swift_getOpaqueTypeConformance2();
  return sub_228D31CF4();
}

uint64_t sub_228D2CD5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _QWORD v5[2];

  sub_228D31CA0();
  MEMORY[0x24BDAC7A8]();
  sub_228D31CB8();
  MEMORY[0x24BDAC7A8]();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A16180);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5[1] = sub_228D2D810();
  sub_228D31CAC();
  sub_228D31C94();
  sub_228D2D974();
  sub_228D31C34();
  sub_228D31E2C();
  sub_228D31E14();
  sub_228D31E20();
  swift_release();
  sub_228D2DCD4(&qword_255A16188, &qword_255A16180, MEMORY[0x24BDB7E40]);
  sub_228D31CE8();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_228D2CF28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  v4 = sub_228D31F7C();
  v6 = v5;
  v7 = a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255A16130) + 36);
  sub_228D2CFB4(v7);
  v8 = (uint64_t *)(v7 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255A16150) + 36));
  *v8 = v4;
  v8[1] = v6;
  v9 = sub_228D31C70();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a2, a1, v9);
}

uint64_t sub_228D2CFB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t KeyPath;
  uint64_t *v15;
  uint64_t v16;
  _OWORD *v17;
  __int128 v18;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;

  v21 = a1;
  v1 = sub_228D31DC0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_228D31F58();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A16160);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_228D31F4C();
  v12 = objc_msgSend((id)objc_opt_self(), sel_separatorColor);
  v13 = MEMORY[0x22E2BF560](v12);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v11, v8, v5);
  v15 = (uint64_t *)&v11[*(int *)(v9 + 36)];
  *v15 = KeyPath;
  v15[1] = v13;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_228D31DB4();
  sub_228D31D78();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_228D31F88();
  sub_228D31D48();
  v16 = v21;
  sub_228D2D7C4((uint64_t)v11, v21, &qword_255A16160);
  v17 = (_OWORD *)(v16 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255A16168) + 36));
  v18 = v23;
  *v17 = v22;
  v17[1] = v18;
  v17[2] = v24;
  return sub_228D2D9C4((uint64_t)v11, &qword_255A16160);
}

uint64_t sub_228D2D1B8()
{
  return sub_228D31EE0();
}

uint64_t sub_228D2D1D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_228D2BA58(*(_QWORD *)v1, *(void **)(v1 + 8), a1);
}

void sub_228D2D1D8(uint64_t *a1@<X8>)
{
  void **v1;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *v1;
  v4 = (void *)sub_228D31B50();
  v5 = objc_msgSend(v3, sel_stringFromDate_, v4);

  v6 = sub_228D31FC4();
  v8 = v7;

  *a1 = v6;
  a1[1] = v8;
}

void sub_228D2D24C()
{
  sub_228D32024();
  __break(1u);
}

void sub_228D2D2AC()
{
  sub_228D32024();
  __break(1u);
}

uint64_t sub_228D2D30C()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  sub_228D32048();
  v2 = v1;
  sub_228D32018();

  return sub_228D32060();
}

void sub_228D2D358()
{
  id *v0;
  id v1;

  v1 = *v0;
  sub_228D32018();

}

uint64_t sub_228D2D39C()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  sub_228D32048();
  v2 = v1;
  sub_228D32018();

  return sub_228D32060();
}

uint64_t sub_228D2D3E4()
{
  sub_228D2DE34();
  return sub_228D3200C() & 1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2BFC2C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for HeadphoneNotificationChartFactory()
{
  return objc_opt_self();
}

_QWORD *initializeBufferWithCopyOfBuffer for HeadphoneNotificationChart(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  id v4;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = v3;
  return a1;
}

void destroy for HeadphoneNotificationChart(uint64_t a1)
{

}

_QWORD *assignWithCopy for HeadphoneNotificationChart(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;

  *a1 = *a2;
  v3 = (void *)a2[1];
  v4 = (void *)a1[1];
  a1[1] = v3;
  v5 = v3;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for HeadphoneNotificationChart(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;

  v3 = a2[1];
  v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for HeadphoneNotificationChart(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HeadphoneNotificationChart(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HeadphoneNotificationChart()
{
  return &type metadata for HeadphoneNotificationChart;
}

uint64_t sub_228D2D5C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_228D2D5DC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_228D2D600@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_228D2C0C8(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2BFC38](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_228D2D64C()
{
  unint64_t result;

  result = qword_255A16110;
  if (!qword_255A16110)
  {
    result = MEMORY[0x22E2BFC44](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255A16110);
  }
  return result;
}

uint64_t sub_228D2D690@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_228D2CADC(*(_QWORD *)(v1 + 16), *(void **)(v1 + 24), a1);
}

unint64_t sub_228D2D698()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255A16138;
  if (!qword_255A16138)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A16130);
    v2[0] = sub_228D2D734(&qword_255A16140, (uint64_t (*)(uint64_t))MEMORY[0x24BDB7F18], MEMORY[0x24BDB7F10]);
    v2[1] = sub_228D2DCD4(&qword_255A16148, &qword_255A16150, MEMORY[0x24BDEF370]);
    result = MEMORY[0x22E2BFC44](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255A16138);
  }
  return result;
}

uint64_t sub_228D2D734(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E2BFC44](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_228D2D774@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_228D31D84();
  *a1 = result;
  return result;
}

uint64_t sub_228D2D79C()
{
  swift_retain();
  return sub_228D31D90();
}

uint64_t sub_228D2D7C4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_228D2D808()
{
  return sub_228D2CD5C();
}

id sub_228D2D810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v0 = sub_228D31BC8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_228D31B98();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1500]), sel_init);
  sub_228D31B80();
  v9 = (void *)sub_228D31B74();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  objc_msgSend(v8, sel_setLocale_, v9);

  sub_228D31BB0();
  v10 = (void *)sub_228D31BA4();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  objc_msgSend(v8, sel_setCalendar_, v10);

  v11 = (void *)sub_228D31FB8();
  objc_msgSend(v8, sel_setLocalizedDateFormatFromTemplate_, v11);

  return v8;
}

unint64_t sub_228D2D974()
{
  unint64_t result;

  result = qword_255A16190;
  if (!qword_255A16190)
  {
    result = MEMORY[0x22E2BFC44](&unk_228D33BA4, &type metadata for DateFormatterFormatStyle);
    atomic_store(result, (unint64_t *)&qword_255A16190);
  }
  return result;
}

uint64_t sub_228D2D9B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_228D2C83C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_228D2D9C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_228D2DA00()
{
  unint64_t result;

  result = qword_255A161B8;
  if (!qword_255A161B8)
  {
    result = MEMORY[0x22E2BFC44](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_255A161B8);
  }
  return result;
}

uint64_t sub_228D2DA44(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for DateFormatterFormatStyle()
{
  return &type metadata for DateFormatterFormatStyle;
}

unint64_t sub_228D2DA68()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255A161C8;
  if (!qword_255A161C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A16158);
    v2[0] = sub_228D2DAD4();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x22E2BFC44](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255A161C8);
  }
  return result;
}

unint64_t sub_228D2DAD4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255A161D0;
  if (!qword_255A161D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A160D0);
    v2[0] = sub_228D2DB58();
    v2[1] = sub_228D2DCD4(&qword_255A161F0, &qword_255A161F8, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x22E2BFC44](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255A161D0);
  }
  return result;
}

unint64_t sub_228D2DB58()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[6];

  result = qword_255A161D8;
  if (!qword_255A161D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A160C8);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A160B8);
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A16130);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A160B0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A16120);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A160A8);
    sub_228D2DCD4(&qword_255A16118, &qword_255A160A8, MEMORY[0x24BDB8148]);
    swift_getOpaqueTypeConformance2();
    sub_228D2DCD4(&qword_255A16128, &qword_255A16120, MEMORY[0x24BDB82F0]);
    v4[2] = v2;
    v4[3] = v3;
    v4[4] = swift_getOpaqueTypeConformance2();
    v4[5] = sub_228D2D698();
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = sub_228D2DCD4(&qword_255A161E0, &qword_255A161E8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x22E2BFC44](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_255A161D8);
  }
  return result;
}

uint64_t sub_228D2DCD4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E2BFC44](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_228D2DD18()
{
  unint64_t result;

  result = qword_255A16200;
  if (!qword_255A16200)
  {
    result = MEMORY[0x22E2BFC44](&unk_228D33AEC, &type metadata for DateFormatterFormatStyle);
    atomic_store(result, (unint64_t *)&qword_255A16200);
  }
  return result;
}

unint64_t sub_228D2DD60()
{
  unint64_t result;

  result = qword_255A16208;
  if (!qword_255A16208)
  {
    result = MEMORY[0x22E2BFC44](&unk_228D33B7C, &type metadata for DateFormatterFormatStyle);
    atomic_store(result, (unint64_t *)&qword_255A16208);
  }
  return result;
}

unint64_t sub_228D2DDA8()
{
  unint64_t result;

  result = qword_255A16210;
  if (!qword_255A16210)
  {
    result = MEMORY[0x22E2BFC44](&unk_228D33B54, &type metadata for DateFormatterFormatStyle);
    atomic_store(result, (unint64_t *)&qword_255A16210);
  }
  return result;
}

unint64_t sub_228D2DDF0()
{
  unint64_t result;

  result = qword_255A16218;
  if (!qword_255A16218)
  {
    result = MEMORY[0x22E2BFC44](&unk_228D33B14, &type metadata for DateFormatterFormatStyle);
    atomic_store(result, (unint64_t *)&qword_255A16218);
  }
  return result;
}

unint64_t sub_228D2DE34()
{
  unint64_t result;

  result = qword_255A16220;
  if (!qword_255A16220)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255A16220);
  }
  return result;
}

void sub_228D2DE78()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;

  v0 = (void *)sub_228D31FB8();
  v1 = (id)SFRuntimeAbsoluteFilePathForPath();

  sub_228D31FC4();
  v2 = objc_allocWithZone(MEMORY[0x24BDD1488]);
  v3 = (void *)sub_228D31FB8();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithPath_, v3);

  if (v4)
    qword_255A16D70 = (uint64_t)v4;
  else
    __break(1u);
}

uint64_t sub_228D2DF34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t result;
  _QWORD v12[2];

  v1 = sub_228D31B98();
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_228D31FAC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v12 - v7;
  switch(*(_QWORD *)(v0 + 16))
  {
    case 0:
    case 1:
    case 2:
    case 3:
      sub_228D31FA0();
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
      if (qword_255A16060 != -1)
        swift_once();
      v9 = (id)qword_255A16D70;
      sub_228D31B8C();
      v10 = sub_228D31FD0();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      result = v10;
      break;
    default:
      v12[1] = *(_QWORD *)(v0 + 16);
      result = sub_228D3203C();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_228D2E148()
{
  uint64_t v0;

  sub_228D2E4A4(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t sub_228D2E16C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for SHSHapticsOptionsViewModel();
  result = sub_228D31D00();
  *a1 = result;
  return result;
}

uint64_t SHSHapticsOption.title.getter(uint64_t a1)
{
  uint64_t result;

  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      result = sub_228D31DCC();
      break;
    default:
      result = sub_228D3203C();
      __break(1u);
      break;
  }
  return result;
}

unint64_t SHSHapticsOption.init(rawValue:)(unint64_t a1)
{
  return sub_228D2E3B4(a1);
}

void *static SHSHapticsOption.allCases.getter()
{
  return &unk_24F197AE8;
}

BOOL sub_228D2E2A8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_228D2E2BC()
{
  sub_228D32048();
  sub_228D32054();
  return sub_228D32060();
}

uint64_t sub_228D2E300()
{
  return sub_228D32054();
}

uint64_t sub_228D2E328()
{
  sub_228D32048();
  sub_228D32054();
  return sub_228D32060();
}

unint64_t sub_228D2E368@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_228D2E3B4(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_228D2E398(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void sub_228D2E3A4(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F197B28;
}

unint64_t sub_228D2E3B4(unint64_t result)
{
  if (result > 3)
    return 0;
  return result;
}

unint64_t sub_228D2E3C8()
{
  unint64_t result;

  result = qword_255A16228;
  if (!qword_255A16228)
  {
    result = MEMORY[0x22E2BFC44](&protocol conformance descriptor for SHSHapticsOption, &type metadata for SHSHapticsOption);
    atomic_store(result, (unint64_t *)&qword_255A16228);
  }
  return result;
}

unint64_t sub_228D2E410()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A16230;
  if (!qword_255A16230)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A16238);
    result = MEMORY[0x22E2BFC44](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_255A16230);
  }
  return result;
}

uint64_t sub_228D2E45C()
{
  return MEMORY[0x24BEE1778];
}

uint64_t type metadata accessor for SHSHapticsOptionsViewModel()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for SHSHapticsOption()
{
  return &type metadata for SHSHapticsOption;
}

uint64_t sub_228D2E498()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_228D2E4A4(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

char *static SHSViewControllerFactory.createHapticsOptionsViewController(_:delegate:)(uint64_t a1)
{
  id v2;
  char *v3;

  v2 = objc_allocWithZone((Class)type metadata accessor for SHSHapticsOptionsViewController());
  swift_unknownObjectRetain();
  v3 = (char *)objc_msgSend(v2, sel_init);
  *(_QWORD *)&v3[OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController_selectedOption] = a1;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v3;
}

uint64_t type metadata accessor for SHSHapticsOptionsViewController()
{
  return objc_opt_self();
}

id SHSViewControllerFactory.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SHSViewControllerFactory.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SHSViewControllerFactory();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SHSViewControllerFactory()
{
  return objc_opt_self();
}

id SHSViewControllerFactory.__deallocating_deinit()
{
  return sub_228D2EF68(type metadata accessor for SHSViewControllerFactory);
}

uint64_t sub_228D2E69C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController____lazy_storage___hapticsOptionsViewModel;
  if (*(_QWORD *)(v0
                 + OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController____lazy_storage___hapticsOptionsViewModel))
  {
    v2 = *(_QWORD *)(v0
                   + OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController____lazy_storage___hapticsOptionsViewModel);
  }
  else
  {
    v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController_selectedOption);
    MEMORY[0x22E2BFCC8](v0 + OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController_delegate);
    type metadata accessor for SHSHapticsOptionsViewModel();
    v2 = swift_allocObject();
    *(_QWORD *)(v2 + 16) = 0;
    swift_unknownObjectWeakInit();
    *(_QWORD *)(v2 + 16) = v3;
    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    *(_QWORD *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

void sub_228D2E75C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;

  v1 = v0;
  v17.receiver = v0;
  v17.super_class = (Class)type metadata accessor for SHSHapticsOptionsViewController();
  objc_msgSendSuper2(&v17, sel_viewDidLoad);
  sub_228D2E69C();
  type metadata accessor for SHSHapticsOptionsViewModel();
  sub_228D2EFD0();
  v15 = sub_228D31D54();
  v16 = v2;
  v3 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_255A163A8));
  v4 = (void *)sub_228D31DE4();
  v5 = objc_msgSend(v4, sel_view, v15, v16);
  if (!v5)
  {
    v6 = v4;
    goto LABEL_6;
  }
  v6 = v5;
  v7 = objc_msgSend(v1, sel_view);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, sel_addSubview_, v6);

    v9 = objc_msgSend(v1, sel_view);
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, sel_bounds);
      v12 = v11;
      v14 = v13;

      objc_msgSend(v6, sel_setFrame_, 0.0, 0.0, v12, v14);
      objc_msgSend(v6, sel_setAutoresizingMask_, 18);
      objc_msgSend(v1, sel_addChildViewController_, v4);
      objc_msgSend(v4, sel_didMoveToParentViewController_, v1);

LABEL_6:
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

id sub_228D2E924(char a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class **v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  objc_class *v17;
  uint64_t v18;
  void (*v19)(objc_class **, uint64_t, uint64_t);
  id result;
  void *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  void (*v35)(char *, uint64_t);
  char *v36;
  void *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  objc_super v47;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A16390);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v44 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_228D31F94();
  v45 = *(_QWORD *)(v4 - 8);
  v46 = v4;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v43 = (char **)((char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_228D31AE4();
  v7 = *(_QWORD *)(v6 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (objc_class **)((char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_228D31B98();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  sub_228D31FAC();
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v38 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = sub_228D31AF0();
  v41 = *(_QWORD *)(v12 - 8);
  v42 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v40 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v36 - v15;
  v17 = (objc_class *)type metadata accessor for SHSHapticsOptionsViewController();
  v37 = v1;
  v47.receiver = v1;
  v47.super_class = v17;
  objc_msgSendSuper2(&v47, sel_viewDidAppear_, a1 & 1);
  sub_228D31FA0();
  sub_228D31B8C();
  *v9 = v17;
  v18 = *MEMORY[0x24BDCD338];
  v19 = *(void (**)(objc_class **, uint64_t, uint64_t))(v7 + 104);
  v39 = v6;
  v19(v9, v18, v6);
  v36 = v16;
  sub_228D31AFC();
  result = (id)MobileGestalt_get_current_device();
  if (result)
  {
    v21 = result;
    MobileGestalt_get_deviceSupportsClosedLoopHaptics();

    sub_228D31FA0();
    v23 = v40;
    v22 = v41;
    v24 = v39;
    sub_228D31B8C();
    *v9 = v17;
    v19(v9, v18, v24);
    sub_228D31AFC();
    v25 = v43;
    *v43 = 0xD00000000000001CLL;
    v25[1] = 0x8000000228D36610;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v45 + 104))(v25, *MEMORY[0x24BE85558], v46);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A16398);
    v26 = v22;
    v27 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
    v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_228D33DB0;
    v29 = v42;
    (*(void (**)(unint64_t, char *, uint64_t))(v26 + 16))(v28 + v27, v23, v42);
    v30 = v44;
    sub_228D31B08();
    v31 = sub_228D31B14();
    v32 = v23;
    v33 = *(_QWORD *)(v31 - 8);
    result = (id)(*(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48))(v30, 1, v31);
    if ((_DWORD)result != 1)
    {
      v34 = v36;
      sub_228D32000();
      swift_bridgeObjectRelease();
      (*(void (**)(_QWORD *, uint64_t))(v45 + 8))(v25, v46);
      v35 = *(void (**)(char *, uint64_t))(v26 + 8);
      v35(v32, v29);
      v35(v34, v29);
      return (id)(*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v30, v31);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_228D2EDDC(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  void *v6;
  id v7;
  objc_super v9;

  *(_QWORD *)&v3[OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController_selectedOption] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v3[OBJC_IVAR____TtC24SoundsAndHapticsSettings31SHSHapticsOptionsViewController____lazy_storage___hapticsOptionsViewModel] = 0;
  if (a2)
  {
    v6 = (void *)sub_228D31FB8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for SHSHapticsOptionsViewController();
  v7 = objc_msgSendSuper2(&v9, sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id sub_228D2EF5C()
{
  return sub_228D2EF68(type metadata accessor for SHSHapticsOptionsViewController);
}

id sub_228D2EF68(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_228D2EFD0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A163A0;
  if (!qword_255A163A0)
  {
    v1 = type metadata accessor for SHSHapticsOptionsViewModel();
    result = MEMORY[0x22E2BFC44](&unk_228D33D74, v1);
    atomic_store(result, (unint64_t *)&qword_255A163A0);
  }
  return result;
}

uint64_t *HeadphoneAudioNotificationModel.shared.unsafeMutableAddressor()
{
  if (qword_255A16068 != -1)
    swift_once();
  return &static HeadphoneAudioNotificationModel.shared;
}

id sub_228D2F058()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for HeadphoneAudioNotificationModel()), sel_init);
  static HeadphoneAudioNotificationModel.shared = (uint64_t)result;
  return result;
}

id static HeadphoneAudioNotificationModel.shared.getter()
{
  if (qword_255A16068 != -1)
    swift_once();
  return (id)static HeadphoneAudioNotificationModel.shared;
}

uint64_t property wrapper backing initializer of HeadphoneAudioNotificationModel.data()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A160D8);
  return sub_228D31D18();
}

Swift::Void __swiftcall HeadphoneAudioNotificationModel.setData(_:)(Swift::OpaquePointer a1)
{
  void *v1;
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  int v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  char *v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A16198);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_228D31B38();
  v56 = *(_QWORD *)(v7 - 8);
  v57 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v55 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = sub_228D31B44();
  v54 = *(_QWORD *)(v60 - 8);
  v9 = MEMORY[0x24BDAC7A8](v60);
  v53 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v59 = (char *)&v43 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A163B0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v43 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_228D31B68();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *((_QWORD *)a1._rawValue + 2);
  if (!v19)
  {
    v42 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_28;
  }
  v51 = (int *)v3;
  v52 = v6;
  v50 = v4;
  v58 = v1;
  swift_bridgeObjectRetain();
  v20 = 0;
  v61 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v62 = MEMORY[0x24BEE4AD8] + 8;
  do
  {
    v21 = *((_QWORD *)a1._rawValue + v20 + 4);
    v22 = *(_QWORD *)(v21 + 16);
    swift_bridgeObjectRetain();
    if (!v22 || (v23 = sub_228D2FAA0(1702125924, 0xE400000000000000), (v24 & 1) == 0))
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v14, 1, 1, v15);
LABEL_4:
      swift_bridgeObjectRelease();
      sub_228D2D9C4((uint64_t)v14, &qword_255A163B0);
      goto LABEL_5;
    }
    sub_228D2FB48(*(_QWORD *)(v21 + 56) + 32 * v23, (uint64_t)&v64);
    v25 = swift_dynamicCast();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v14, v25 ^ 1u, 1, v15);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
      goto LABEL_4;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
    if (*(_QWORD *)(v21 + 16)
      && (v26 = sub_228D2FAA0(0x746E756F63, 0xE500000000000000), (v27 & 1) != 0)
      && (sub_228D2FB48(*(_QWORD *)(v21 + 56) + 32 * v26, (uint64_t)&v64), (swift_dynamicCast() & 1) != 0))
    {
      v28 = v63;
      if (*(_QWORD *)(v21 + 16) && (v29 = sub_228D2FAA0(1668506980, 0xE400000000000000), (v30 & 1) != 0))
      {
        sub_228D2FB48(*(_QWORD *)(v21 + 56) + 32 * v29, (uint64_t)&v64);
      }
      else
      {
        v64 = 0u;
        v65 = 0u;
      }
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v65 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v48 = *((_QWORD *)&v63 + 1);
          v49 = v63;
          v31 = v53;
          MEMORY[0x22E2BF110]();
          v47 = v28;
          v32 = v55;
          sub_228D31B2C();
          sub_228D31B20();
          (*(void (**)(char *, uint64_t))(v56 + 8))(v32, v57);
          v46 = *(void (**)(char *, uint64_t))(v54 + 8);
          v46(v31, v60);
          sub_228D2D734(&qword_255A163C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE2A0], MEMORY[0x24BDCE290]);
          v33 = v59;
          sub_228D31B5C();
          v46(v33, v60);
          v63 = v64;
          swift_bridgeObjectRetain();
          sub_228D31FE8();
          swift_bridgeObjectRelease();
          v45 = *((_QWORD *)&v63 + 1);
          v46 = (void (*)(char *, uint64_t))v63;
          v44 = v51[12];
          v34 = (uint64_t)v52;
          v35 = &v52[v51[16]];
          v43 = &v52[v51[20]];
          (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v52, v18, v15);
          *(_QWORD *)(v34 + v44) = v47;
          v36 = v45;
          *(_QWORD *)v35 = v46;
          *((_QWORD *)v35 + 1) = v36;
          v37 = v43;
          v38 = v48;
          *(_QWORD *)v43 = v49;
          *((_QWORD *)v37 + 1) = v38;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v61 = (_QWORD *)sub_228D2FB84(0, v61[2] + 1, 1, v61);
          v40 = v61[2];
          v39 = v61[3];
          if (v40 >= v39 >> 1)
            v61 = (_QWORD *)sub_228D2FB84(v39 > 1, v40 + 1, 1, v61);
          v41 = v61;
          v61[2] = v40 + 1;
          sub_228D2FD00((uint64_t)v52, (uint64_t)v41+ ((*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80))+ *(_QWORD *)(v50 + 72) * v40);
        }
      }
      else
      {
        sub_228D2D9C4((uint64_t)&v64, &qword_255A163C0);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
LABEL_5:
    ++v20;
  }
  while (v19 != v20);
  swift_bridgeObjectRelease();
  v1 = v58;
  v42 = v61;
LABEL_28:
  swift_getKeyPath();
  swift_getKeyPath();
  *(_QWORD *)&v64 = v42;
  v1;
  sub_228D31D30();
  type metadata accessor for HeadphoneAudioNotificationModel();
  sub_228D2D734(&qword_255A16070, (uint64_t (*)(uint64_t))type metadata accessor for HeadphoneAudioNotificationModel, (uint64_t)&protocol conformance descriptor for HeadphoneAudioNotificationModel);
  sub_228D31D00();
  sub_228D31D0C();
  swift_release();
}

uint64_t sub_228D2F890()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_228D31D24();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_228D2F900@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_228D31D24();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_228D2F97C(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  v3 = v2;
  return sub_228D31D30();
}

id HeadphoneAudioNotificationModel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HeadphoneAudioNotificationModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_228D2FA64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for HeadphoneAudioNotificationModel();
  result = sub_228D31D00();
  *a1 = result;
  return result;
}

unint64_t sub_228D2FAA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_228D32048();
  sub_228D31FDC();
  v4 = sub_228D32060();
  return sub_228D2FE18(a1, a2, v4);
}

uint64_t type metadata accessor for HeadphoneAudioNotificationModel()
{
  uint64_t result;

  result = qword_255A163F8;
  if (!qword_255A163F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_228D2FB48(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

size_t sub_228D2FB84(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A16420);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255A16198) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255A16198) - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_228D2FD00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A16198);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_228D2FD48()
{
  return type metadata accessor for HeadphoneAudioNotificationModel();
}

void sub_228D2FD50()
{
  unint64_t v0;

  sub_228D2FDBC();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_228D2FDBC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255A16408)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A160D8);
    v0 = sub_228D31D3C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255A16408);
  }
}

unint64_t sub_228D2FE18(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_228D32030() & 1) == 0)
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
      while (!v14 && (sub_228D32030() & 1) == 0);
    }
  }
  return v6;
}

_QWORD *initializeBufferWithCopyOfBuffer for SHSHapticsOptionsView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for SHSHapticsOptionsView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for SHSHapticsOptionsView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for SHSHapticsOptionsView()
{
  return &type metadata for SHSHapticsOptionsView;
}

uint64_t sub_228D2FFA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_228D2FFB4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v0 = sub_228D31B98();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_228D31FAC();
  MEMORY[0x24BDAC7A8](v1);
  swift_retain();
  sub_228D31FA0();
  if (qword_255A16060 != -1)
    swift_once();
  v2 = (id)qword_255A16D70;
  sub_228D31B8C();
  sub_228D31FD0();
  swift_release();
  sub_228D2D64C();
  sub_228D31E74();
  swift_retain();
  sub_228D2DF34();
  swift_release();
  sub_228D31E74();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A16448);
  sub_228D30490();
  return sub_228D31F70();
}

uint64_t sub_228D301CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getKeyPath();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A16238);
  sub_228D2DCD4(&qword_255A16460, &qword_255A16238, MEMORY[0x24BEE12D8]);
  sub_228D304F4();
  return sub_228D31F64();
}

uint64_t sub_228D302B4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = *a1;
  type metadata accessor for SHSHapticsOptionsViewModel();
  sub_228D2D734((unint64_t *)&qword_255A163A0, (uint64_t (*)(uint64_t))type metadata accessor for SHSHapticsOptionsViewModel, (uint64_t)&unk_228D33D74);
  swift_retain();
  result = sub_228D31D54();
  *a2 = result;
  a2[1] = v5;
  a2[2] = v3;
  return result;
}

uint64_t sub_228D30330()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE v7[16];
  uint64_t v8;
  uint64_t v9;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A16428);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = v0[1];
  v8 = *v0;
  v9 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A16430);
  sub_228D30420();
  sub_228D31E38();
  sub_228D2DCD4(&qword_255A16458, &qword_255A16428, MEMORY[0x24BDF1A30]);
  sub_228D31EA4();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_228D30418()
{
  return sub_228D2FFB4();
}

unint64_t sub_228D30420()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[3];

  result = qword_255A16438;
  if (!qword_255A16438)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A16430);
    v2 = sub_228D30490();
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    v3[2] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x22E2BFC44](MEMORY[0x24BDF4AF8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255A16438);
  }
  return result;
}

unint64_t sub_228D30490()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_255A16440;
  if (!qword_255A16440)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A16448);
    v2 = sub_228D304F4();
    result = MEMORY[0x22E2BFC44](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255A16440);
  }
  return result;
}

unint64_t sub_228D304F4()
{
  unint64_t result;

  result = qword_255A16450;
  if (!qword_255A16450)
  {
    result = MEMORY[0x22E2BFC44]("mAF&,F", &type metadata for HapticsOptionRow);
    atomic_store(result, (unint64_t *)&qword_255A16450);
  }
  return result;
}

uint64_t sub_228D30538()
{
  uint64_t v0;

  return sub_228D301CC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

_QWORD *sub_228D30540@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_228D3054C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_228D30570@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_228D302B4(a1, a2);
}

uint64_t destroy for HapticsOptionRow()
{
  return swift_release();
}

_QWORD *_s24SoundsAndHapticsSettings16HapticsOptionRowVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for HapticsOptionRow(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for HapticsOptionRow(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_release();
  a1[2] = a2[2];
  return a1;
}

uint64_t getEnumTagSinglePayload for HapticsOptionRow(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HapticsOptionRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HapticsOptionRow()
{
  return &type metadata for HapticsOptionRow;
}

uint64_t sub_228D306F4()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A16428);
  sub_228D2DCD4(&qword_255A16458, &qword_255A16428, MEMORY[0x24BDF1A30]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_228D30758()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_228D30768(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  if (*(_QWORD *)(a2 + 16) == a3)
  {
    swift_retain();
  }
  else
  {
    type metadata accessor for SHSHapticsOptionsViewModel();
    sub_228D2D734((unint64_t *)&qword_255A163A0, (uint64_t (*)(uint64_t))type metadata accessor for SHSHapticsOptionsViewModel, (uint64_t)&unk_228D33D74);
    swift_retain();
    sub_228D31D00();
    sub_228D31D0C();
    swift_release();
    v5 = (void *)MEMORY[0x22E2BFCC8](a2 + 24);
    if (v5)
    {
      objc_msgSend(v5, sel_hapticsOptionsDidChange_, a3);
      swift_unknownObjectRelease();
    }
  }
  *(_QWORD *)(a2 + 16) = a3;
  return swift_release();
}

uint64_t sub_228D3082C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE v13[16];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A16488);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v13[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = a1;
  v18 = a2;
  v19 = a3;
  v14 = a1;
  v15 = a2;
  v16 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A164B0);
  sub_228D31024();
  sub_228D31F34();
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v9 + 16))(a4, v11, v8);
  *(_BYTE *)(a4 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255A16470) + 36)) = 0;
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_228D30944@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;

  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 3:
      sub_228D31DCC();
      if (qword_255A16060 != -1)
        swift_once();
      v3 = (id)qword_255A16D70;
      result = sub_228D31E68();
      *(_QWORD *)a2 = result;
      *(_QWORD *)(a2 + 8) = v5;
      *(_BYTE *)(a2 + 16) = v6 & 1;
      *(_QWORD *)(a2 + 24) = v7;
      break;
    default:
      result = sub_228D3203C();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_228D30AC0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t KeyPath;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A164F0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A164F8);
  v32 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A164C8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v28 - v16;
  if (*(_QWORD *)(a1 + 16) == a2)
  {
    v18 = sub_228D31F1C();
    v19 = sub_228D31E2C();
    v31 = a3;
    v20 = v19;
    KeyPath = swift_getKeyPath();
    v30 = v6;
    v33 = v18;
    v34 = KeyPath;
    v35 = v20;
    sub_228D31E08();
    v29 = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A164D0);
    v28 = v9;
    sub_228D3113C();
    sub_228D31EC8();
    swift_release();
    swift_release();
    swift_release();
    v22 = sub_228D31EF8();
    v23 = swift_getKeyPath();
    v24 = v32;
    v25 = v28;
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v15, v11, v28);
    v26 = (uint64_t *)&v15[*(int *)(v29 + 36)];
    *v26 = v23;
    v26[1] = v22;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v25);
    sub_228D31218((uint64_t)v15, (uint64_t)v17);
    sub_228D31260((uint64_t)v17, (uint64_t)v8);
    swift_storeEnumTagMultiPayload();
    sub_228D31090();
    sub_228D31DF0();
    return sub_228D312A8((uint64_t)v17);
  }
  else
  {
    *v8 = sub_228D31F28();
    swift_storeEnumTagMultiPayload();
    sub_228D31090();
    return sub_228D31DF0();
  }
}

uint64_t sub_228D30D88@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
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
  uint64_t v12;
  _QWORD *v13;
  _QWORD v15[8];

  v15[1] = a1;
  v2 = sub_228D31D6C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A16468);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v1;
  v11 = v1[1];
  v12 = v1[2];
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v10;
  v13[3] = v11;
  v13[4] = v12;
  v15[4] = v10;
  v15[5] = v11;
  v15[6] = v12;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A16470);
  sub_228D30F74();
  sub_228D31F40();
  sub_228D31D60();
  sub_228D2DCD4(&qword_255A164A0, &qword_255A16468, MEMORY[0x24BDF43B0]);
  sub_228D2D734(&qword_255A164A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED868], MEMORY[0x24BDED858]);
  sub_228D31ED4();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_228D30F38()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_228D30F5C()
{
  uint64_t *v0;

  return sub_228D30768(v0[2], v0[3], v0[4]);
}

uint64_t sub_228D30F68@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_228D3082C(v1[2], v1[3], v1[4], a1);
}

unint64_t sub_228D30F74()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255A16478;
  if (!qword_255A16478)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A16470);
    v2[0] = sub_228D2DCD4(&qword_255A16480, &qword_255A16488, MEMORY[0x24BDF41A8]);
    v2[1] = sub_228D2DCD4(&qword_255A16490, &qword_255A16498, MEMORY[0x24BDEFAD8]);
    result = MEMORY[0x22E2BFC44](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255A16478);
  }
  return result;
}

uint64_t sub_228D31010@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_228D30944(*(_QWORD *)(v1 + 32), a1);
}

uint64_t sub_228D3101C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_228D30AC0(*(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), a1);
}

unint64_t sub_228D31024()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255A164B8;
  if (!qword_255A164B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A164B0);
    v2[0] = sub_228D31090();
    v2[1] = MEMORY[0x24BDF40E8];
    result = MEMORY[0x22E2BFC44](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255A164B8);
  }
  return result;
}

unint64_t sub_228D31090()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_255A164C0;
  if (!qword_255A164C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A164C8);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A164D0);
    v2[3] = sub_228D3113C();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_228D2DCD4(&qword_255A161E0, &qword_255A161E8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x22E2BFC44](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255A164C0);
  }
  return result;
}

unint64_t sub_228D3113C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255A164D8;
  if (!qword_255A164D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A164D0);
    v2 = sub_228D2DCD4(&qword_255A164E0, &qword_255A164E8, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x22E2BFC44](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255A164D8);
  }
  return result;
}

uint64_t sub_228D311C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_228D31D9C();
  *a1 = result;
  return result;
}

uint64_t sub_228D311E8()
{
  swift_retain();
  return sub_228D31DA8();
}

uint64_t sub_228D31218(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A164C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_228D31260(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A164C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_228D312A8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A164C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_228D312E8()
{
  uint64_t (*v0)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A16468);
  sub_228D31D6C();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED868];
  sub_228D2DCD4(&qword_255A164A0, &qword_255A16468, MEMORY[0x24BDF43B0]);
  sub_228D2D734(&qword_255A164A8, v0, MEMORY[0x24BDED858]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_228D31394()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void SHSLogForCategory_cold_1()
{
  __assert_rtn("SHSLogForCategory", "SHSLogging.m", 14, "category < SHSLoggingCategoryCount");
}

uint64_t sub_228D31AC0()
{
  return MEMORY[0x24BDCB148]();
}

uint64_t sub_228D31ACC()
{
  return MEMORY[0x24BDCB170]();
}

uint64_t sub_228D31AD8()
{
  return MEMORY[0x24BDCC8D0]();
}

uint64_t sub_228D31AE4()
{
  return MEMORY[0x24BDCD340]();
}

uint64_t sub_228D31AF0()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_228D31AFC()
{
  return MEMORY[0x24BDCD3B0]();
}

uint64_t sub_228D31B08()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_228D31B14()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_228D31B20()
{
  return MEMORY[0x24BDCE040]();
}

uint64_t sub_228D31B2C()
{
  return MEMORY[0x24BDCE148]();
}

uint64_t sub_228D31B38()
{
  return MEMORY[0x24BDCE160]();
}

uint64_t sub_228D31B44()
{
  return MEMORY[0x24BDCE2A0]();
}

uint64_t sub_228D31B50()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_228D31B5C()
{
  return MEMORY[0x24BDCE8D8]();
}

uint64_t sub_228D31B68()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_228D31B74()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_228D31B80()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_228D31B8C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_228D31B98()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_228D31BA4()
{
  return MEMORY[0x24BDCF0C0]();
}

uint64_t sub_228D31BB0()
{
  return MEMORY[0x24BDCF0D0]();
}

uint64_t sub_228D31BBC()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_228D31BC8()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_228D31BD4()
{
  return MEMORY[0x24BDB7BD0]();
}

uint64_t sub_228D31BE0()
{
  return MEMORY[0x24BDB7C00]();
}

uint64_t sub_228D31BEC()
{
  return MEMORY[0x24BDB7C50]();
}

uint64_t sub_228D31BF8()
{
  return MEMORY[0x24BDB7C70]();
}

uint64_t sub_228D31C04()
{
  return MEMORY[0x24BDB7DD8]();
}

uint64_t sub_228D31C10()
{
  return MEMORY[0x24BDB7DE0]();
}

uint64_t sub_228D31C1C()
{
  return MEMORY[0x24BDB7DF0]();
}

uint64_t sub_228D31C28()
{
  return MEMORY[0x24BDB7E08]();
}

uint64_t sub_228D31C34()
{
  return MEMORY[0x24BDB7E10]();
}

uint64_t sub_228D31C40()
{
  return MEMORY[0x24BDB7E60]();
}

uint64_t sub_228D31C4C()
{
  return MEMORY[0x24BDB7E78]();
}

uint64_t sub_228D31C58()
{
  return MEMORY[0x24BDB7F00]();
}

uint64_t sub_228D31C64()
{
  return MEMORY[0x24BDB7F08]();
}

uint64_t sub_228D31C70()
{
  return MEMORY[0x24BDB7F18]();
}

uint64_t sub_228D31C7C()
{
  return MEMORY[0x24BDB7F40]();
}

uint64_t sub_228D31C88()
{
  return MEMORY[0x24BDB7F70]();
}

uint64_t sub_228D31C94()
{
  return MEMORY[0x24BDB8058]();
}

uint64_t sub_228D31CA0()
{
  return MEMORY[0x24BDB8060]();
}

uint64_t sub_228D31CAC()
{
  return MEMORY[0x24BDB80F0]();
}

uint64_t sub_228D31CB8()
{
  return MEMORY[0x24BDB80F8]();
}

uint64_t sub_228D31CC4()
{
  return MEMORY[0x24BDB8138]();
}

uint64_t sub_228D31CD0()
{
  return MEMORY[0x24BDB8150]();
}

uint64_t sub_228D31CDC()
{
  return MEMORY[0x24BDB8170]();
}

uint64_t sub_228D31CE8()
{
  return MEMORY[0x24BDB81C0]();
}

uint64_t sub_228D31CF4()
{
  return MEMORY[0x24BDB82C0]();
}

uint64_t sub_228D31D00()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_228D31D0C()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_228D31D18()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_228D31D24()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_228D31D30()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_228D31D3C()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_228D31D48()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_228D31D54()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_228D31D60()
{
  return MEMORY[0x24BDED860]();
}

uint64_t sub_228D31D6C()
{
  return MEMORY[0x24BDED868]();
}

uint64_t sub_228D31D78()
{
  return MEMORY[0x24BDEDF38]();
}

uint64_t sub_228D31D84()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_228D31D90()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_228D31D9C()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_228D31DA8()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_228D31DB4()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_228D31DC0()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_228D31DCC()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_228D31DD8()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_228D31DE4()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_228D31DF0()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_228D31DFC()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_228D31E08()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_228D31E14()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_228D31E20()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_228D31E2C()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_228D31E38()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_228D31E44()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_228D31E50()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_228D31E5C()
{
  return MEMORY[0x24BDF1FB8]();
}

uint64_t sub_228D31E68()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_228D31E74()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_228D31E80()
{
  return MEMORY[0x24BDB8358]();
}

uint64_t sub_228D31E8C()
{
  return MEMORY[0x24BDB8388]();
}

uint64_t sub_228D31E98()
{
  return MEMORY[0x24BDB8418]();
}

uint64_t sub_228D31EA4()
{
  return MEMORY[0x24BE85518]();
}

uint64_t sub_228D31EB0()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_228D31EBC()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_228D31EC8()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_228D31ED4()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_228D31EE0()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_228D31EEC()
{
  return MEMORY[0x24BDF3BF8]();
}

uint64_t sub_228D31EF8()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_228D31F04()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_228D31F10()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_228D31F1C()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_228D31F28()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_228D31F34()
{
  return MEMORY[0x24BDF4150]();
}

uint64_t sub_228D31F40()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_228D31F4C()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_228D31F58()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_228D31F64()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_228D31F70()
{
  return MEMORY[0x24BDF4AB8]();
}

uint64_t sub_228D31F7C()
{
  return MEMORY[0x24BDF4F00]();
}

uint64_t sub_228D31F88()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_228D31F94()
{
  return MEMORY[0x24BE85560]();
}

uint64_t sub_228D31FA0()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_228D31FAC()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_228D31FB8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_228D31FC4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_228D31FD0()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_228D31FDC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_228D31FE8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_228D31FF4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_228D32000()
{
  return MEMORY[0x24BE75F20]();
}

uint64_t sub_228D3200C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_228D32018()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_228D32024()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_228D32030()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_228D3203C()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_228D32048()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_228D32054()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_228D32060()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x24BE1FA98]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x24BE1FAA0]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
}

uint64_t MobileGestalt_get_deviceSupportsClosedLoopHaptics()
{
  return MEMORY[0x24BED85C0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t NSStringFromTLAlertType()
{
  return MEMORY[0x24BEB8C90]();
}

uint64_t PSGetCapabilityBoolAnswer()
{
  return MEMORY[0x24BE75A88]();
}

uint64_t PSShouldInsetListView()
{
  return MEMORY[0x24BE75C68]();
}

uint64_t PSTableViewSideInset()
{
  return MEMORY[0x24BE75D38]();
}

uint64_t PreferencesTableViewCellLeftPad()
{
  return MEMORY[0x24BE75DB0]();
}

uint64_t PreferencesTableViewCellRightPad()
{
  return MEMORY[0x24BE75DB8]();
}

uint64_t PreferencesTableViewFooterColor()
{
  return MEMORY[0x24BE75DC0]();
}

uint64_t PreferencesTableViewFooterFont()
{
  return MEMORY[0x24BE75DC8]();
}

uint64_t SFRuntimeAbsoluteFilePathForPath()
{
  return MEMORY[0x24BE857A0]();
}

uint64_t TLAlertTypeFromString()
{
  return MEMORY[0x24BEB8DA0]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BEBE0B0](category);
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
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

