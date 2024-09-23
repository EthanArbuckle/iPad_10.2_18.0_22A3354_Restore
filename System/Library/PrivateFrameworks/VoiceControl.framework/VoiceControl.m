void sub_24A25169C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AssistantServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getAFPreferencesClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("AFPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getAFPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_24A251C6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getNSLocaleClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!IntlPreferencesLibraryCore_frameworkLibrary)
  {
    IntlPreferencesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!IntlPreferencesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getNSLocaleClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("NSLocale");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getNSLocaleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_24A251D78(uint64_t a1, uint64_t a2)
{
  __SecTask *v2;
  __SecTask *v3;
  __CFString *v6;
  CFTypeRef v7;
  char v8;
  _QWORD *v10;

  v3 = v2;
  v6 = (__CFString *)sub_24A259184();
  v7 = SecTaskCopyValueForEntitlement(v3, v6, 0);

  if (v7 && (__swift_instantiateConcreteTypeFromMangledName(&qword_25791DDB8), (swift_dynamicCast() & 1) != 0))
  {
    v8 = sub_24A2521BC(a1, a2, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  return v8 & 1;
}

Swift::Bool __swiftcall NSProcessInfo.hasEntitlement(_:)(Swift::String a1)
{
  SecTaskRef v1;
  __SecTask *v2;
  __CFString *v3;
  CFTypeRef v4;
  void *v5;
  unsigned __int8 v6;

  v1 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = (__CFString *)sub_24A259184();
  v4 = SecTaskCopyValueForEntitlement(v2, v3, 0);

  if (!v4)
  {

    return 0;
  }
  objc_opt_self();
  v5 = (void *)swift_dynamicCastObjCClass();
  if (!v5)
  {

    swift_unknownObjectRelease();
    return 0;
  }
  v6 = objc_msgSend(v5, sel_BOOLValue);

  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_24A251F04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_24A259190();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t _sSo13NSProcessInfoC12VoiceControlE23canReadPreferenceDomainySbSSF_0(uint64_t a1, uint64_t a2)
{
  SecTaskRef v4;
  __SecTask *v5;
  __CFString *v6;
  CFTypeRef v7;
  void *v8;
  unsigned __int8 v9;
  char v10;

  v4 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  if (v4)
  {
    v5 = v4;
    v6 = (__CFString *)sub_24A259184();
    v7 = SecTaskCopyValueForEntitlement(v5, v6, 0);

    if (v7)
    {
      objc_opt_self();
      v8 = (void *)swift_dynamicCastObjCClass();
      if (!v8)
      {

        swift_unknownObjectRelease();
        v10 = 1;
        return v10 & 1;
      }
      v9 = objc_msgSend(v8, sel_BOOLValue);
      swift_unknownObjectRelease();
      if ((v9 & 1) != 0 && (sub_24A251D78(a1, a2) & 1) == 0)
      {
        v10 = sub_24A251D78(a1, a2);

        return v10 & 1;
      }
    }

    v10 = 1;
  }
  else
  {
    v10 = 0;
  }
  return v10 & 1;
}

uint64_t _sSo13NSProcessInfoC12VoiceControlE24canWritePreferenceDomainySbSSF_0(uint64_t a1, uint64_t a2)
{
  SecTaskRef v4;
  __SecTask *v5;
  __CFString *v6;
  CFTypeRef v7;
  void *v8;
  unsigned __int8 v9;
  char v10;

  v4 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x24BDBD240]);
  if (!v4)
  {
    v10 = 0;
    return v10 & 1;
  }
  v5 = v4;
  v6 = (__CFString *)sub_24A259184();
  v7 = SecTaskCopyValueForEntitlement(v5, v6, 0);

  if (!v7)
    goto LABEL_7;
  objc_opt_self();
  v8 = (void *)swift_dynamicCastObjCClass();
  if (!v8)
  {

    swift_unknownObjectRelease();
    goto LABEL_9;
  }
  v9 = objc_msgSend(v8, sel_BOOLValue);
  swift_unknownObjectRelease();
  if ((v9 & 1) == 0)
  {
LABEL_7:

LABEL_9:
    v10 = 1;
    return v10 & 1;
  }
  v10 = sub_24A251D78(a1, a2);

  return v10 & 1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD0B0AC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24A2521BC(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_24A259250();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_24A259250() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_24A2522BC()
{
  uint64_t result;

  result = sub_24A259184();
  qword_25791DDC0 = result;
  return result;
}

id static VCNotification.AlwaysShowOverlayTypeSettingsChanged.getter()
{
  return sub_24A253294(&qword_25791DD80, (id *)&qword_25791DDC0);
}

uint64_t sub_24A25230C()
{
  uint64_t result;

  result = sub_24A259184();
  qword_25791DDC8 = result;
  return result;
}

id static VCNotification.LocaleIdentifierChanged.getter()
{
  return sub_24A253294(&qword_25791DD88, (id *)&qword_25791DDC8);
}

uint64_t sub_24A25235C()
{
  uint64_t result;

  result = sub_24A259184();
  qword_25791DDD0 = result;
  return result;
}

id static VCNotification.PlaySoundUponRecognitionSettingsChanged.getter()
{
  return sub_24A253294(&qword_25791DD90, (id *)&qword_25791DDD0);
}

uint64_t sub_24A2523AC()
{
  uint64_t result;

  result = sub_24A259184();
  qword_25791DDD8 = result;
  return result;
}

id static VCNotification.UserHintsSettingsChanged.getter()
{
  return sub_24A253294(&qword_25791DD98, (id *)&qword_25791DDD8);
}

void sub_24A2523FC()
{
  if (*MEMORY[0x24BED2730])
    qword_25791DDE0 = *MEMORY[0x24BED2730];
  else
    __break(1u);
}

id static VCNotification.VoiceControlEnabledChanged.getter()
{
  return sub_24A253294(&qword_25791DDA0, (id *)&qword_25791DDE0);
}

uint64_t sub_24A252438()
{
  uint64_t result;

  result = sub_24A259184();
  qword_25791DDE8 = result;
  return result;
}

id static VCNotification.ShowTextResponseUponRecognitionSettingsChanged.getter()
{
  return sub_24A253294(&qword_25791DDA8, (id *)&qword_25791DDE8);
}

id VCNotification.__deallocating_deinit(uint64_t a1)
{
  return sub_24A2554D0(a1, type metadata accessor for VCNotification);
}

uint64_t type metadata accessor for VCNotification()
{
  return objc_opt_self();
}

void sub_24A2524B8(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_24A2524E4()
{
  uint64_t v0;
  id v1;

  if (qword_25791DD80 != -1)
    swift_once();
  v0 = qword_25791DDC0;
  v1 = (id)qword_25791DDC0;
  return v0;
}

void sub_24A252630(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_24A252670(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_24A252768 + 4 * byte_24A2597A0[a2]))(0xD000000000000010);
}

uint64_t sub_24A252768(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0xD000000000000010 && v1 == 0x800000024A259BA0)
    v2 = 1;
  else
    v2 = sub_24A259250();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_24A2528A8(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_24A2528E0()
{
  sub_24A25919C();
  return swift_bridgeObjectRelease();
}

VoiceControl::RXDebugAutomationMode_optional __swiftcall RXDebugAutomationMode.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 4;
  if ((unint64_t)rawValue < 4)
    v2 = rawValue;
  *v1 = v2;
  return (VoiceControl::RXDebugAutomationMode_optional)rawValue;
}

void *static RXDebugAutomationMode.allCases.getter()
{
  return &unk_251BAD168;
}

uint64_t RXDebugAutomationMode.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_24A2529E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24A2529F4()
{
  sub_24A259268();
  sub_24A259274();
  return sub_24A259280();
}

uint64_t sub_24A252A38()
{
  return sub_24A259274();
}

uint64_t sub_24A252A60()
{
  sub_24A259268();
  sub_24A259274();
  return sub_24A259280();
}

VoiceControl::RXDebugAutomationMode_optional sub_24A252AA0(Swift::Int *a1)
{
  return RXDebugAutomationMode.init(rawValue:)(*a1);
}

void sub_24A252AA8(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

void sub_24A252AB4(_QWORD *a1@<X8>)
{
  *a1 = &unk_251BAD190;
}

VoiceControl::VCOverlayType_optional __swiftcall VCOverlayType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  VoiceControl::VCOverlayType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_24A25922C();
  result.value = swift_bridgeObjectRelease();
  v5 = 9;
  if (v3 < 9)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static VCOverlayType.allCases.getter()
{
  return &unk_251BAD2B0;
}

uint64_t VCOverlayType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24A252B50 + 4 * byte_24A2597B2[*v0]))(1701736270, 0xE400000000000000);
}

unint64_t sub_24A252B50()
{
  return 0xD000000000000010;
}

void sub_24A252C14(char *a1)
{
  sub_24A252630(*a1);
}

uint64_t sub_24A252C20()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_24A259268();
  sub_24A2528A8((uint64_t)v3, v1);
  return sub_24A259280();
}

void sub_24A252C64(uint64_t a1)
{
  char *v1;

  sub_24A2528A8(a1, *v1);
}

uint64_t sub_24A252C6C()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_24A259268();
  sub_24A2528A8((uint64_t)v3, v1);
  return sub_24A259280();
}

VoiceControl::VCOverlayType_optional sub_24A252CAC(Swift::String *a1)
{
  return VCOverlayType.init(rawValue:)(*a1);
}

uint64_t sub_24A252CB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = VCOverlayType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_24A252CDC(_QWORD *a1@<X8>)
{
  *a1 = &unk_251BAD2B0;
}

id sub_24A252CEC(id result, uint64_t a2)
{
  char *v2;
  uint64_t v4;
  uint64_t *v5;
  void *v6;
  char *v7;
  id v8;
  char PreferenceDomainySbSSF_0;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  objc_super v15;

  if (a2)
  {
    v4 = (uint64_t)result;
    v5 = (uint64_t *)&v2[OBJC_IVAR____TtC12VoiceControlP33_B83C1536E71AFC7DD8A14C611F75D0B914VCUserDefaults_prefDomain];
    *v5 = (uint64_t)result;
    v5[1] = a2;
    v6 = (void *)objc_opt_self();
    v7 = v2;
    swift_bridgeObjectRetain();
    v8 = objc_msgSend(v6, sel_processInfo);
    swift_bridgeObjectRetain();
    PreferenceDomainySbSSF_0 = _sSo13NSProcessInfoC12VoiceControlE23canReadPreferenceDomainySbSSF_0(v4, a2);

    swift_bridgeObjectRelease();
    v7[OBJC_IVAR____TtC12VoiceControlP33_B83C1536E71AFC7DD8A14C611F75D0B914VCUserDefaults_canReadDomain] = PreferenceDomainySbSSF_0 & 1;
    v10 = objc_msgSend(v6, sel_processInfo);
    v11 = *v5;
    v12 = v5[1];
    swift_bridgeObjectRetain();
    LOBYTE(v11) = _sSo13NSProcessInfoC12VoiceControlE24canWritePreferenceDomainySbSSF_0(v11, v12);

    swift_bridgeObjectRelease();
    v7[OBJC_IVAR____TtC12VoiceControlP33_B83C1536E71AFC7DD8A14C611F75D0B914VCUserDefaults_canWriteDomain] = v11 & 1;

    v13 = (void *)sub_24A259184();
    swift_bridgeObjectRelease();
    v15.receiver = v7;
    v15.super_class = (Class)type metadata accessor for VCUserDefaults();
    v14 = objc_msgSendSuper2(&v15, sel_initWithSuiteName_, v13);

    if (v14)
    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_24A252FEC(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  char v10;
  void *v11;
  void *v12;
  __CFNotificationCenter *v13;
  __CFString *v14;
  objc_super v15;
  _QWORD v16[3];
  uint64_t v17;

  sub_24A258574(a1, (uint64_t)v16);
  v2 = v17;
  if (v17)
  {
    v3 = __swift_project_boxed_opaque_existential_0(v16, v17);
    v4 = *(_QWORD *)(v2 - 8);
    MEMORY[0x24BDAC7A8](v3, v3);
    v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v4 + 16))(v6);
    v7 = sub_24A259244();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)sub_24A259184();
  v9 = (objc_class *)type metadata accessor for VCUserDefaults();
  v15.receiver = v1;
  v15.super_class = v9;
  objc_msgSendSuper2(&v15, sel_setObject_forKey_, v7, v8);
  swift_unknownObjectRelease();

  swift_bridgeObjectRetain();
  v10 = sub_24A257968();
  if (v10 != 7)
  {
    sub_24A2524B8(v10);
    if (v11)
    {
      v12 = v11;
      v13 = CFNotificationCenterGetDarwinNotifyCenter();
      sub_24A259190();
      v14 = (__CFString *)sub_24A259184();
      swift_bridgeObjectRelease();
      CFNotificationCenterPostNotification(v13, v14, 0, 0, 1u);

    }
  }
}

id sub_24A253228()
{
  return sub_24A2554D0(0, type metadata accessor for VCUserDefaults);
}

id sub_24A25324C()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for VCSettings()), sel_init);
  qword_25791DDF0 = (uint64_t)result;
  return result;
}

id static VCSettings.shared.getter()
{
  return sub_24A253294(&qword_25791DDB0, (id *)&qword_25791DDF0);
}

id sub_24A253294(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

void sub_24A253344(char a1)
{
  uint64_t v1;
  uint64_t v2;
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  v2 = v1;
  sub_24A2591A8();
  v4 = (objc_class *)type metadata accessor for VCUserDefaults();
  v5 = objc_allocWithZone(v4);
  v6 = (void *)sub_24A259184();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_initWithSuiteName_, v6);

  v8 = OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain;
  v9 = *(void **)(v2 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain) = v7;

  sub_24A2591A8();
  swift_bridgeObjectRelease();
  v10 = objc_allocWithZone(v4);
  v11 = (void *)sub_24A259184();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v10, sel_initWithSuiteName_, v11);

  v13 = OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsDaemon;
  v14 = *(void **)(v2 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsDaemon);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsDaemon) = v12;

  if ((a1 & 1) != 0)
  {
    v15 = *(void **)(v2 + v8);
    if (v15)
    {
      v16 = v15;
      swift_bridgeObjectRetain();
      v17 = (void *)sub_24A259184();
      swift_bridgeObjectRelease();
      objc_msgSend(v16, sel_removePersistentDomainForName_, v17);

    }
    v18 = *(void **)(v2 + v13);
    if (v18)
    {
      v19 = v18;
      swift_bridgeObjectRetain();
      v20 = (id)sub_24A259184();
      swift_bridgeObjectRelease();
      objc_msgSend(v19, sel_removePersistentDomainForName_, v20);

    }
  }
}

uint64_t sub_24A253590()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC12VoiceControl10VCSettings_testMode);
  swift_beginAccess();
  return *v1;
}

void sub_24A2535D4(char a1)
{
  uint64_t v1;
  char *v3;

  v3 = (char *)(v1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_testMode);
  swift_beginAccess();
  *v3 = a1;
  sub_24A253344(a1);
}

void (*sub_24A25362C(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC12VoiceControl10VCSettings_testMode;
  v3[3] = v1;
  v3[4] = v4;
  swift_beginAccess();
  return sub_24A253684;
}

void sub_24A253684(_QWORD **a1, char a2)
{
  _QWORD *v3;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_24A253344(*(_BYTE *)(v3[3] + v3[4]));
  free(v3);
}

BOOL sub_24A2536C0()
{
  return _AXSCommandAndControlEnabled() != 0;
}

uint64_t sub_24A2536DC()
{
  return _AXSCommandAndControlSetEnabled();
}

uint64_t (*sub_24A2536E4(BOOL *a1))()
{
  *a1 = _AXSCommandAndControlEnabled() != 0;
  return sub_24A25371C;
}

uint64_t sub_24A25371C()
{
  return _AXSCommandAndControlSetEnabled();
}

uint64_t String.voiceControlLocaleIdentifier.getter()
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
  _QWORD v10[6];

  v0 = sub_24A259118();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2);
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x24BDCEBA8], v0);
  v5 = sub_24A259100();
  v7 = v6;
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  v10[4] = v5;
  v10[5] = v7;
  v10[2] = 45;
  v10[3] = 0xE100000000000000;
  v10[0] = 95;
  v10[1] = 0xE100000000000000;
  sub_24A253848();
  v8 = sub_24A2591E4();
  swift_bridgeObjectRelease();
  return v8;
}

unint64_t sub_24A253848()
{
  unint64_t result;

  result = qword_25791DE00;
  if (!qword_25791DE00)
  {
    result = MEMORY[0x24BD0B0C4](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25791DE00);
  }
  return result;
}

unint64_t sub_24A253890(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791DEF8);
  v2 = (_QWORD *)sub_24A259220();
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
    result = sub_24A2563F4(v5, v6);
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

uint64_t sub_24A2539B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
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
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v27[1] = a1;
  v27[2] = a2;
  v6 = sub_24A259118();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27[3] = a5;
  v11 = *a5;
  v12 = *MEMORY[0x24BDCEBA8];
  v27[0] = *(_QWORD *)(v7 + 104);
  ((void (*)(char *, uint64_t, uint64_t))v27[0])(v10, v12, v6);
  swift_bridgeObjectRetain();
  v13 = sub_24A259100();
  v15 = v14;
  v16 = *(void (**)(char *, uint64_t))(v7 + 8);
  v16(v10, v6);
  v32 = v13;
  v33 = v15;
  v30 = 45;
  v31 = 0xE100000000000000;
  v28 = 95;
  v29 = 0xE100000000000000;
  sub_24A253848();
  v17 = sub_24A2591E4();
  v19 = v18;
  swift_bridgeObjectRelease();
  LOBYTE(v17) = sub_24A253BDC(v17, v19, v11);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v17 & 1) != 0)
  {
    ((void (*)(char *, uint64_t, uint64_t))v27[0])(v10, v12, v6);
    v21 = sub_24A259100();
    v23 = v22;
    v16(v10, v6);
    v32 = v21;
    v33 = v23;
    v30 = 45;
    v31 = 0xE100000000000000;
    v28 = 95;
    v29 = 0xE100000000000000;
    v24 = sub_24A2591E4();
    v26 = v25;
    swift_bridgeObjectRelease();
    sub_24A256248(&v32, v24, v26);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24A253BDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_24A259268();
    sub_24A25919C();
    v6 = sub_24A259280();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_24A259250() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_24A259250() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_24A253D10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  char *v43;
  uint64_t v44;
  char v45;
  char *v46;
  char v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v57;
  void (*v58)(char *, uint64_t, uint64_t);
  unsigned int v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v63 = a3;
  v5 = sub_24A259118();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = a2;
  if (a2)
  {
    v10 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    sub_24A258478();
    v11 = (void *)sub_24A2591B4();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791DE08);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_24A259A50;
    *(_QWORD *)(v12 + 32) = a1;
    *(_QWORD *)(v12 + 40) = a2;
    v13 = (void *)sub_24A2591B4();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v10, sel_preferredLocalizationsFromArray_forPreferences_, v11, v13);

    v15 = sub_24A2591C0();
    if (*(_QWORD *)(v15 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v16 = *MEMORY[0x24BDCEBA8];
      v17 = v5;
      v18 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
      v18(v9, v16, v17);
LABEL_7:
      v24 = sub_24A259100();
      v26 = v25;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v17);
      v70 = v24;
      v71 = v26;
      v68 = 45;
      v69 = 0xE100000000000000;
      v66 = 95;
      v67 = 0xE100000000000000;
      sub_24A253848();
      v62 = sub_24A2591E4();
      v64 = v27;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    swift_bridgeObjectRelease();
  }
  v61 = v5;
  v19 = (void *)objc_opt_self();
  sub_24A258478();
  v20 = (void *)sub_24A2591B4();
  swift_bridgeObjectRelease();
  sub_24A259124();
  v21 = (void *)sub_24A2591B4();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(v19, sel_preferredLocalizationsFromArray_forPreferences_, v20, v21);

  v23 = sub_24A2591C0();
  if (*(_QWORD *)(v23 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v16 = *MEMORY[0x24BDCEBA8];
    v18 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
    v17 = v61;
    v18(v9, v16, v61);
    goto LABEL_7;
  }
  swift_bridgeObjectRelease();
  v62 = 0;
  v64 = 0;
  v16 = *MEMORY[0x24BDCEBA8];
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v17 = v61;
LABEL_9:
  v18(v9, v16, v17);
  v28 = sub_24A259100();
  v30 = v29;
  v31 = *(void (**)(char *, uint64_t))(v6 + 8);
  v31(v9, v17);
  v70 = v28;
  v71 = v30;
  v68 = 45;
  v69 = 0xE100000000000000;
  v66 = 95;
  v67 = 0xE100000000000000;
  sub_24A253848();
  v32 = sub_24A2591E4();
  v34 = v33;
  swift_bridgeObjectRelease();
  if (v65)
  {
    swift_bridgeObjectRelease();
    if (!v64)
      goto LABEL_25;
    goto LABEL_24;
  }
  v65 = v34;
  v61 = v32;
  v59 = v16;
  v58 = v18;
  v18(v9, v16, v17);
  v35 = v64;
  swift_bridgeObjectRetain();
  v36 = sub_24A259100();
  v38 = v37;
  v60 = v9;
  v31(v9, v17);
  v70 = v36;
  v71 = v38;
  v68 = 45;
  v69 = 0xE100000000000000;
  v66 = 95;
  v67 = 0xE100000000000000;
  v39 = sub_24A2591E4();
  v41 = v40;
  swift_bridgeObjectRelease();
  if (v35)
  {
    v42 = v31;
    if (v62 == v39 && v35 == v41)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v43 = v60;
      v44 = v65;
    }
    else
    {
      v45 = sub_24A259250();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v43 = v60;
      v44 = v65;
      if ((v45 & 1) == 0)
        goto LABEL_23;
    }
    v46 = sub_24A258478();
    v47 = sub_24A2521BC(v61, v44, v46);
    swift_bridgeObjectRelease();
    if ((v47 & 1) != 0)
    {
      v48 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
      v49 = objc_msgSend(v48, sel_languageCode);

      if (v49)
      {
        sub_24A259190();

        v58(v43, v59, v17);
        v50 = sub_24A259100();
        v52 = v51;
        v42(v43, v17);
        v70 = v50;
        v71 = v52;
        v68 = 45;
        v69 = 0xE100000000000000;
        v66 = 95;
        v67 = 0xE100000000000000;
        v53 = sub_24A2591E4();
        v55 = v54;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v53 == v61 && v55 == v44)
        {
          swift_bridgeObjectRelease();
LABEL_27:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          goto LABEL_25;
        }
        v57 = sub_24A259250();
        swift_bridgeObjectRelease();
        if ((v57 & 1) != 0)
          goto LABEL_27;
      }
    }
LABEL_23:
    swift_bridgeObjectRelease();
LABEL_24:
    swift_bridgeObjectRetain();
    goto LABEL_25;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_25:
  sub_24A2590E8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A25442C()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (!v1)
  {
    v7 = 0u;
    v8 = 0u;
LABEL_11:
    sub_24A25905C((uint64_t)&v7, &qword_25791DE18);
    return 0;
  }
  v2 = v1;
  v3 = (void *)sub_24A259184();
  v4 = objc_msgSend(v2, sel_objectForKey_, v3);

  if (v4)
  {
    sub_24A2591F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_24A258600((uint64_t)v6, (uint64_t)&v7);

  if (!*((_QWORD *)&v8 + 1))
    goto LABEL_11;
  if (swift_dynamicCast())
    return *(_QWORD *)&v6[0];
  else
    return 0;
}

uint64_t sub_24A254548(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[3];
  uint64_t v14;
  __int128 v15;
  __int128 v16;

  v3 = *(void **)(v2 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (v3)
  {
    if (a2)
    {
      *((_QWORD *)&v16 + 1) = MEMORY[0x24BEE0D00];
      *(_QWORD *)&v15 = result;
      *((_QWORD *)&v15 + 1) = a2;
    }
    else
    {
      v15 = 0u;
      v16 = 0u;
    }
    sub_24A258574((uint64_t)&v15, (uint64_t)v13);
    v4 = v14;
    if (v14)
    {
      v5 = __swift_project_boxed_opaque_existential_0(v13, v14);
      v6 = *(_QWORD *)(v4 - 8);
      MEMORY[0x24BDAC7A8](v5, v5);
      v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v6 + 16))(v8);
      swift_bridgeObjectRetain();
      v9 = v3;
      v10 = sub_24A259244();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
    }
    else
    {
      swift_bridgeObjectRetain();
      v11 = v3;
      v10 = 0;
    }
    v12 = (void *)sub_24A259184();
    objc_msgSend(v3, sel_setObject_forKey_, v10, v12);

    swift_unknownObjectRelease();
    return sub_24A25905C((uint64_t)&v15, &qword_25791DE18);
  }
  return result;
}

uint64_t sub_24A2546BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_24A25442C();
  sub_24A253D10(v2, v3, a1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24A2546EC()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (!v1)
  {
    v7 = 0u;
    v8 = 0u;
LABEL_9:
    sub_24A25905C((uint64_t)&v7, &qword_25791DE18);
    return 1;
  }
  v2 = v1;
  v3 = (void *)sub_24A259184();
  v4 = objc_msgSend(v2, sel_objectForKey_, v3);

  if (v4)
  {
    sub_24A2591F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_24A258600((uint64_t)v6, (uint64_t)&v7);

  if (!*((_QWORD *)&v8 + 1))
    goto LABEL_9;
  if (swift_dynamicCast())
    return LOBYTE(v6[0]);
  return 1;
}

uint64_t sub_24A2547FC(uint64_t result)
{
  return sub_24A2549A0(result);
}

uint64_t (*sub_24A254818(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = sub_24A2546EC() & 1;
  return sub_24A254850;
}

uint64_t sub_24A254850(uint64_t a1)
{
  return sub_24A2547FC(*(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_24A254874()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t result;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (!v1)
  {
    v7 = 0u;
    v8 = 0u;
LABEL_9:
    sub_24A25905C((uint64_t)&v7, &qword_25791DE18);
    return 0;
  }
  v2 = v1;
  v3 = (void *)sub_24A259184();
  v4 = objc_msgSend(v2, sel_objectForKey_, v3);

  if (v4)
  {
    sub_24A2591F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_24A258600((uint64_t)v6, (uint64_t)&v7);

  if (!*((_QWORD *)&v8 + 1))
    goto LABEL_9;
  result = swift_dynamicCast();
  if ((_DWORD)result)
    return LOBYTE(v6[0]);
  return result;
}

uint64_t sub_24A254984(uint64_t result)
{
  return sub_24A2549A0(result);
}

uint64_t sub_24A2549A0(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[3];
  uint64_t v13;
  _BYTE v14[24];
  uint64_t v15;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (v2)
  {
    v15 = MEMORY[0x24BEE1328];
    v14[0] = result & 1;
    sub_24A258574((uint64_t)v14, (uint64_t)v12);
    v3 = v13;
    if (v13)
    {
      v4 = __swift_project_boxed_opaque_existential_0(v12, v13);
      v5 = *(_QWORD *)(v3 - 8);
      MEMORY[0x24BDAC7A8](v4, v4);
      v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v5 + 16))(v7);
      v8 = v2;
      v9 = sub_24A259244();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
    }
    else
    {
      v10 = v2;
      v9 = 0;
    }
    v11 = (void *)sub_24A259184();
    objc_msgSend(v2, sel_setObject_forKey_, v9, v11);

    swift_unknownObjectRelease();
    return sub_24A25905C((uint64_t)v14, &qword_25791DE18);
  }
  return result;
}

uint64_t (*sub_24A254AEC(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = sub_24A254874() & 1;
  return sub_24A254B24;
}

uint64_t sub_24A254B24(uint64_t a1)
{
  return sub_24A254984(*(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_24A254B48()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  _OWORD v6[2];
  __int128 v7;
  __int128 v8;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (!v1)
  {
    v7 = 0u;
    v8 = 0u;
LABEL_11:
    sub_24A25905C((uint64_t)&v7, &qword_25791DE18);
    return 3;
  }
  v2 = v1;
  v3 = (void *)sub_24A259184();
  v4 = objc_msgSend(v2, sel_objectForKey_, v3);

  if (v4)
  {
    sub_24A2591F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_24A258600((uint64_t)v6, (uint64_t)&v7);

  if (!*((_QWORD *)&v8 + 1))
    goto LABEL_11;
  if ((swift_dynamicCast() & 1) == 0)
    return 3;
  if (*(_QWORD *)&v6[0] >= 4uLL)
    return 3;
  else
    return LODWORD(v6[0]);
}

BOOL sub_24A254C64()
{
  return sub_24A254B48() == 3;
}

uint64_t sub_24A254C84(uint64_t result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[3];
  uint64_t v14;
  _QWORD v15[4];

  v2 = *(void **)(v1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (v2)
  {
    v3 = 3;
    if ((result & 1) == 0)
      v3 = 0;
    v15[3] = MEMORY[0x24BEE1768];
    v15[0] = v3;
    sub_24A258574((uint64_t)v15, (uint64_t)v13);
    v4 = v14;
    if (v14)
    {
      v5 = __swift_project_boxed_opaque_existential_0(v13, v14);
      v6 = *(_QWORD *)(v4 - 8);
      MEMORY[0x24BDAC7A8](v5, v5);
      v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v6 + 16))(v8);
      v9 = v2;
      v10 = sub_24A259244();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
    }
    else
    {
      v11 = v2;
      v10 = 0;
    }
    v12 = (void *)sub_24A259184();
    objc_msgSend(v2, sel_setObject_forKey_, v10, v12);

    swift_unknownObjectRelease();
    return sub_24A25905C((uint64_t)v15, &qword_25791DE18);
  }
  return result;
}

uint64_t (*sub_24A254DD8(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = sub_24A254B48() == 3;
  return sub_24A254E18;
}

uint64_t sub_24A254E18(uint64_t a1)
{
  return sub_24A254C84(*(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_24A254E3C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t result;
  char v8;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsDaemon);
  if (!v3)
  {
    v10 = 0u;
    v11 = 0u;
LABEL_11:
    result = sub_24A25905C((uint64_t)&v10, &qword_25791DE18);
    goto LABEL_12;
  }
  v4 = v3;
  v5 = (void *)sub_24A259184();
  v6 = objc_msgSend(v4, sel_objectForKey_, v5);

  if (v6)
  {
    sub_24A2591F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_24A258600((uint64_t)v9, (uint64_t)&v10);

  if (!*((_QWORD *)&v11 + 1))
    goto LABEL_11;
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  if (*(_QWORD *)&v9[0] >= 4uLL)
    v8 = 0;
  else
    v8 = v9[0];
LABEL_13:
  *a1 = v8;
  return result;
}

unsigned __int8 *sub_24A254F5C(unsigned __int8 *result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v13[3];
  uint64_t v14;
  _QWORD v15[4];

  v2 = *(void **)(v1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsDaemon);
  if (v2)
  {
    v3 = *result;
    v15[3] = MEMORY[0x24BEE1768];
    v15[0] = v3;
    sub_24A258574((uint64_t)v15, (uint64_t)v13);
    v4 = v14;
    if (v14)
    {
      v5 = __swift_project_boxed_opaque_existential_0(v13, v14);
      v6 = *(_QWORD *)(v4 - 8);
      MEMORY[0x24BDAC7A8](v5, v5);
      v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v6 + 16))(v8);
      v9 = v2;
      v10 = sub_24A259244();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
    }
    else
    {
      v11 = v2;
      v10 = 0;
    }
    v12 = (void *)sub_24A259184();
    objc_msgSend(v2, sel_setObject_forKey_, v10, v12);

    swift_unknownObjectRelease();
    return (unsigned __int8 *)sub_24A25905C((uint64_t)v15, &qword_25791DE18);
  }
  return result;
}

uint64_t (*sub_24A2550A8(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  sub_24A254E3C((_BYTE *)(a1 + 8));
  return sub_24A2550DC;
}

uint64_t sub_24A2550DC(uint64_t a1, char a2)
{
  return sub_24A255480(a1, a2, (uint64_t (*)(char *))sub_24A254F5C);
}

char sub_24A2550E8@<W0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  id v4;
  void *v5;
  id v6;
  char result;
  char v8;
  Swift::String v9[2];
  __int128 v10;
  __int128 v11;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain);
  if (!v3)
  {
    v10 = 0u;
    v11 = 0u;
LABEL_11:
    result = sub_24A25905C((uint64_t)&v10, &qword_25791DE18);
    goto LABEL_12;
  }
  v4 = v3;
  v5 = (void *)sub_24A259184();
  v6 = objc_msgSend(v4, sel_objectForKey_, v5);

  if (v6)
  {
    sub_24A2591F0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_24A258600((uint64_t)v9, (uint64_t)&v10);

  if (!*((_QWORD *)&v11 + 1))
    goto LABEL_11;
  result = swift_dynamicCast();
  if ((result & 1) == 0)
  {
LABEL_12:
    v8 = 0;
    goto LABEL_13;
  }
  result = VCOverlayType.init(rawValue:)(v9[0]).value;
  v8 = v10;
  if (v10 == 9)
    v8 = 0;
LABEL_13:
  *a1 = v8;
  return result;
}

uint64_t sub_24A255214(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_defaultsMain))
    __asm { BR              X12 }
  return result;
}

uint64_t (*sub_24A255440(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  sub_24A2550E8((_BYTE *)(a1 + 8));
  return sub_24A255474;
}

uint64_t sub_24A255474(uint64_t a1, char a2)
{
  return sub_24A255480(a1, a2, (uint64_t (*)(char *))sub_24A255214);
}

uint64_t sub_24A255480(uint64_t a1, char a2, uint64_t (*a3)(char *))
{
  char *v3;
  char v5;
  char v6;

  if ((a2 & 1) != 0)
  {
    v5 = *(_BYTE *)(a1 + 8);
    v3 = &v5;
  }
  else
  {
    v6 = *(_BYTE *)(a1 + 8);
    v3 = &v6;
  }
  return a3(v3);
}

id VCSettings.__deallocating_deinit(uint64_t a1)
{
  return sub_24A2554D0(a1, type metadata accessor for VCSettings);
}

id sub_24A2554D0(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_24A255538(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_24A257758((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  result = sub_24A255684(v5);
  *a1 = v2;
  return result;
}

_QWORD *sub_24A2555A0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791DE08);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_24A25776C((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_24A259044();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_24A255684(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  BOOL v52;
  unint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  uint64_t v63;
  char v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  _QWORD *v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  unint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;

  v3 = a1[1];
  result = sub_24A259238();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_24A255D28(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_151;
  v101 = result;
  v98 = a1;
  if (v3 <= 1)
  {
    v7 = MEMORY[0x24BEE4AF8];
    v104 = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v10 = MEMORY[0x24BEE4AF8];
LABEL_117:
      result = v10;
      v100 = v7;
      if (v11 >= 2)
      {
        v91 = *v98;
        do
        {
          v92 = v11 - 2;
          if (v11 < 2)
            goto LABEL_146;
          if (!v91)
            goto LABEL_159;
          v93 = result;
          v94 = *(_QWORD *)(result + 32 + 16 * v92);
          v95 = *(_QWORD *)(result + 32 + 16 * (v11 - 1) + 8);
          result = sub_24A255DF4((char *)(v91 + 16 * v94), (char *)(v91 + 16 * *(_QWORD *)(result + 32 + 16 * (v11 - 1))), v91 + 16 * v95, v104);
          if (v1)
            break;
          if (v95 < v94)
            goto LABEL_147;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_24A256118(v93);
            v93 = result;
          }
          if (v92 >= *(_QWORD *)(v93 + 16))
            goto LABEL_148;
          v96 = (_QWORD *)(v93 + 32 + 16 * v92);
          *v96 = v94;
          v96[1] = v95;
          v97 = *(_QWORD *)(v93 + 16);
          if (v11 > v97)
            goto LABEL_149;
          memmove((void *)(v93 + 32 + 16 * (v11 - 1)), (const void *)(v93 + 32 + 16 * v11), 16 * (v97 - v11));
          result = v93;
          *(_QWORD *)(v93 + 16) = v97 - 1;
          v11 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v100 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v100 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    result = sub_24A2591CC();
    *(_QWORD *)(result + 16) = v6;
    v100 = result;
    v104 = (char *)(result + 32);
  }
  v8 = 0;
  v9 = *a1;
  v99 = v9 + 8;
  v10 = MEMORY[0x24BEE4AF8];
  v102 = v3;
  while (1)
  {
    v12 = v8++;
    if (v8 >= v3)
      goto LABEL_45;
    v13 = (uint64_t *)(v9 + 16 * v8);
    result = *v13;
    v14 = v13[1];
    v15 = (_QWORD *)(v9 + 16 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_44;
      v17 = 0;
    }
    else
    {
      result = sub_24A259250();
      v17 = result;
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_36;
    }
    v19 = (_QWORD *)(v99 + 16 * v18);
    do
    {
      result = *(v19 - 1);
      v21 = (_QWORD *)(v9 + 16 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if ((v17 & 1) != 0)
          goto LABEL_37;
      }
      else
      {
        result = sub_24A259250();
        if (((v17 ^ result) & 1) != 0)
          goto LABEL_36;
      }
      v19 += 2;
      v20 = v18 + 1;
      v8 = v18;
      v18 = v20;
    }
    while (v20 < v3);
    v18 = v20;
LABEL_36:
    v8 = v18;
    if ((v17 & 1) != 0)
    {
LABEL_37:
      if (v18 < v12)
        goto LABEL_155;
      if (v12 < v18)
      {
        v23 = 16 * v18;
        v24 = 16 * v12;
        v25 = v18;
        v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9)
              goto LABEL_158;
            v27 = v9 + v23;
            v28 = *(_QWORD *)(v9 + v24);
            v29 = *(_QWORD *)(v9 + v24 + 8);
            *(_OWORD *)(v9 + v24) = *(_OWORD *)(v9 + v23 - 16);
            *(_QWORD *)(v27 - 16) = v28;
            *(_QWORD *)(v27 - 8) = v29;
          }
          ++v26;
          v23 -= 16;
          v24 += 16;
        }
        while (v26 < v25);
      }
LABEL_44:
      v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12))
        goto LABEL_150;
      if (v8 - v12 < v101)
        break;
    }
LABEL_66:
    if (v8 < v12)
      goto LABEL_145;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_24A256020(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
      v10 = result;
    }
    v38 = *(_QWORD *)(v10 + 16);
    v37 = *(_QWORD *)(v10 + 24);
    v11 = v38 + 1;
    if (v38 >= v37 >> 1)
    {
      result = (uint64_t)sub_24A256020((char *)(v37 > 1), v38 + 1, 1, (char *)v10);
      v10 = result;
    }
    *(_QWORD *)(v10 + 16) = v11;
    v39 = v10 + 32;
    v40 = (uint64_t *)(v10 + 32 + 16 * v38);
    *v40 = v12;
    v40[1] = v8;
    if (v38)
    {
      v103 = v8;
      while (1)
      {
        v41 = v11 - 1;
        if (v11 >= 4)
        {
          v46 = v39 + 16 * v11;
          v47 = *(_QWORD *)(v46 - 64);
          v48 = *(_QWORD *)(v46 - 56);
          v52 = __OFSUB__(v48, v47);
          v49 = v48 - v47;
          if (v52)
            goto LABEL_134;
          v51 = *(_QWORD *)(v46 - 48);
          v50 = *(_QWORD *)(v46 - 40);
          v52 = __OFSUB__(v50, v51);
          v44 = v50 - v51;
          v45 = v52;
          if (v52)
            goto LABEL_135;
          v53 = v11 - 2;
          v54 = (uint64_t *)(v39 + 16 * (v11 - 2));
          v56 = *v54;
          v55 = v54[1];
          v52 = __OFSUB__(v55, v56);
          v57 = v55 - v56;
          if (v52)
            goto LABEL_136;
          v52 = __OFADD__(v44, v57);
          v58 = v44 + v57;
          if (v52)
            goto LABEL_138;
          if (v58 >= v49)
          {
            v76 = (uint64_t *)(v39 + 16 * v41);
            v78 = *v76;
            v77 = v76[1];
            v52 = __OFSUB__(v77, v78);
            v79 = v77 - v78;
            if (v52)
              goto LABEL_144;
            v69 = v44 < v79;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v70 = *(_QWORD *)(v10 + 32);
            v71 = *(_QWORD *)(v10 + 40);
            v52 = __OFSUB__(v71, v70);
            v63 = v71 - v70;
            v64 = v52;
            goto LABEL_98;
          }
          v43 = *(_QWORD *)(v10 + 32);
          v42 = *(_QWORD *)(v10 + 40);
          v52 = __OFSUB__(v42, v43);
          v44 = v42 - v43;
          v45 = v52;
        }
        if ((v45 & 1) != 0)
          goto LABEL_137;
        v53 = v11 - 2;
        v59 = (uint64_t *)(v39 + 16 * (v11 - 2));
        v61 = *v59;
        v60 = v59[1];
        v62 = __OFSUB__(v60, v61);
        v63 = v60 - v61;
        v64 = v62;
        if (v62)
          goto LABEL_139;
        v65 = (uint64_t *)(v39 + 16 * v41);
        v67 = *v65;
        v66 = v65[1];
        v52 = __OFSUB__(v66, v67);
        v68 = v66 - v67;
        if (v52)
          goto LABEL_141;
        if (__OFADD__(v63, v68))
          goto LABEL_143;
        if (v63 + v68 >= v44)
        {
          v69 = v44 < v68;
LABEL_104:
          if (v69)
            v41 = v53;
          goto LABEL_106;
        }
LABEL_98:
        if ((v64 & 1) != 0)
          goto LABEL_140;
        v72 = (uint64_t *)(v39 + 16 * v41);
        v74 = *v72;
        v73 = v72[1];
        v52 = __OFSUB__(v73, v74);
        v75 = v73 - v74;
        if (v52)
          goto LABEL_142;
        if (v75 < v63)
          goto LABEL_15;
LABEL_106:
        v80 = v41 - 1;
        if (v41 - 1 >= v11)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        v81 = v9;
        if (!v9)
          goto LABEL_157;
        v82 = v10;
        v83 = (uint64_t *)(v39 + 16 * v80);
        v84 = *v83;
        v85 = v39;
        v86 = v41;
        v87 = (_QWORD *)(v39 + 16 * v41);
        v88 = v87[1];
        v89 = v81;
        result = sub_24A255DF4((char *)(v81 + 16 * *v83), (char *)(v81 + 16 * *v87), v81 + 16 * v88, v104);
        if (v1)
          goto LABEL_114;
        if (v88 < v84)
          goto LABEL_131;
        if (v86 > *(_QWORD *)(v82 + 16))
          goto LABEL_132;
        *v83 = v84;
        *(_QWORD *)(v85 + 16 * v80 + 8) = v88;
        v90 = *(_QWORD *)(v82 + 16);
        if (v86 >= v90)
          goto LABEL_133;
        v10 = v82;
        v11 = v90 - 1;
        result = (uint64_t)memmove(v87, v87 + 2, 16 * (v90 - 1 - v86));
        v39 = v85;
        *(_QWORD *)(v82 + 16) = v90 - 1;
        v9 = v89;
        v8 = v103;
        if (v90 <= 2)
          goto LABEL_15;
      }
    }
    v11 = 1;
LABEL_15:
    v3 = v102;
    if (v8 >= v102)
    {
      v7 = v100;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v101))
    goto LABEL_153;
  if (v12 + v101 >= v3)
    v30 = v3;
  else
    v30 = v12 + v101;
  if (v30 >= v12)
  {
    if (v8 != v30)
    {
      v31 = (uint64_t *)(v9 + 16 * v8);
      do
      {
        v32 = (uint64_t *)(v9 + 16 * v8);
        result = *v32;
        v33 = v32[1];
        v34 = v12;
        v35 = v31;
        do
        {
          if (result == *(v35 - 2) && v33 == *(v35 - 1))
            break;
          result = sub_24A259250();
          if ((result & 1) == 0)
            break;
          if (!v9)
            goto LABEL_156;
          result = *v35;
          v33 = v35[1];
          *(_OWORD *)v35 = *((_OWORD *)v35 - 1);
          *(v35 - 1) = v33;
          *(v35 - 2) = result;
          v35 -= 2;
          ++v34;
        }
        while (v8 != v34);
        ++v8;
        v31 += 2;
      }
      while (v8 != v30);
      v8 = v30;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

uint64_t sub_24A255D28(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
LABEL_5:
    v9 = (uint64_t *)(v7 + 16 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = (uint64_t *)v8;
    while (1)
    {
      v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (result = sub_24A259250(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      result = *v12;
      v10 = v12[1];
      *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24A255DF4(char *__dst, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  BOOL v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  BOOL v20;
  BOOL v21;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = __src - __dst;
  v9 = __src - __dst + 15;
  if (__src - __dst >= 0)
    v9 = __src - __dst;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)__src;
  v12 = a3 - (_QWORD)__src + 15;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v12 = a3 - (_QWORD)__src;
  v13 = v12 >> 4;
  if (v10 >= v12 >> 4)
  {
    if (a4 != __src || &__src[16 * v13] <= a4)
      memmove(a4, __src, 16 * v13);
    v14 = &v4[16 * v13];
    if (v7 >= v6 || v11 < 16)
      goto LABEL_48;
    v17 = (char *)(a3 - 16);
    while (1)
    {
      v18 = v17 + 16;
      v19 = v6 - 16;
      v20 = *((_QWORD *)v14 - 2) == *((_QWORD *)v6 - 2) && *((_QWORD *)v14 - 1) == *((_QWORD *)v6 - 1);
      if (v20 || (sub_24A259250() & 1) == 0)
      {
        v19 = v14 - 16;
        if (v18 != v14)
        {
          v14 -= 16;
LABEL_45:
          *(_OWORD *)v17 = *(_OWORD *)v19;
          goto LABEL_46;
        }
        v21 = v17 >= v14;
        v14 -= 16;
        if (v21)
          goto LABEL_45;
      }
      else
      {
        if (v18 != v6)
        {
          v6 -= 16;
          goto LABEL_45;
        }
        v21 = v17 >= v6;
        v6 -= 16;
        if (v21)
          goto LABEL_45;
      }
LABEL_46:
      if (v6 > v7)
      {
        v17 -= 16;
        if (v14 > v4)
          continue;
      }
      goto LABEL_48;
    }
  }
  if (a4 != __dst || &__dst[16 * v10] <= a4)
    memmove(a4, __dst, 16 * v10);
  v14 = &v4[16 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 16)
  {
    while (1)
    {
      v15 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (v15 || (sub_24A259250() & 1) == 0)
        break;
      v16 = v6;
      v15 = v7 == v6;
      v6 += 16;
      if (!v15)
        goto LABEL_20;
LABEL_21:
      v7 += 16;
      if (v4 >= v14 || (unint64_t)v6 >= a3)
        goto LABEL_23;
    }
    v16 = v4;
    v15 = v7 == v4;
    v4 += 16;
    if (v15)
      goto LABEL_21;
LABEL_20:
    *(_OWORD *)v7 = *(_OWORD *)v16;
    goto LABEL_21;
  }
LABEL_23:
  v6 = v7;
LABEL_48:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 0xFuLL : 0)) & 0xFFFFFFFFFFFFFFF0])
    memmove(v6, v4, 16 * ((v14 - v4) / 16));
  return 1;
}

char *sub_24A256020(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791DEE8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_24A256118(uint64_t a1)
{
  return sub_24A256020(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_24A25612C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_24A256148(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_24A256148(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25791DE08);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_24A256248(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_24A259268();
  swift_bridgeObjectRetain();
  sub_24A25919C();
  v8 = sub_24A259280();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_24A259250() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_24A259250() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_24A257164(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t sub_24A2563F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24A259268();
  sub_24A25919C();
  v4 = sub_24A259280();
  return sub_24A257084(a1, a2, v4);
}

uint64_t sub_24A256458()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791DEF0);
  v3 = sub_24A259208();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_24A259268();
      sub_24A25919C();
      result = sub_24A259280();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_24A256734(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe, a2);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    v7 = sub_24A2568B4((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    v7 = sub_24A2568B4((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x24BD0B124](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_24A2568B4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t v28;
  unint64_t i;
  unint64_t v30;
  _QWORD *v31;
  BOOL v32;
  BOOL v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int64_t v41;
  unint64_t v42;
  int64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  BOOL v52;
  uint64_t v53;
  _QWORD *v54;
  BOOL v55;
  unint64_t *v57;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;
  uint64_t v61;
  int64_t v62;
  int64_t v63;

  v4 = a4;
  v5 = a3;
  v57 = (unint64_t *)result;
  if (*(_QWORD *)(a4 + 16) < *(_QWORD *)(a3 + 16))
  {
    v6 = 0;
    v58 = a4 + 56;
    v7 = 1 << *(_BYTE *)(a4 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(a4 + 56);
    v59 = (unint64_t)(v7 + 63) >> 6;
    v61 = 0;
    v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          v62 = v6;
          v12 = v11 | (v6 << 6);
        }
        else
        {
          v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59)
            goto LABEL_79;
          v14 = *(_QWORD *)(v58 + 8 * v13);
          v15 = v6 + 1;
          if (!v14)
          {
            v15 = v6 + 2;
            if (v6 + 2 >= v59)
              goto LABEL_79;
            v14 = *(_QWORD *)(v58 + 8 * v15);
            if (!v14)
            {
              v15 = v6 + 3;
              if (v6 + 3 >= v59)
                goto LABEL_79;
              v14 = *(_QWORD *)(v58 + 8 * v15);
              if (!v14)
              {
                v16 = v6 + 4;
                if (v6 + 4 >= v59)
                  goto LABEL_79;
                v14 = *(_QWORD *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    v15 = v16 + 1;
                    if (__OFADD__(v16, 1))
                      goto LABEL_83;
                    if (v15 >= v59)
                      goto LABEL_79;
                    v14 = *(_QWORD *)(v58 + 8 * v15);
                    ++v16;
                    if (v14)
                      goto LABEL_22;
                  }
                }
                v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          v9 = (v14 - 1) & v14;
          v62 = v15;
          v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v12);
        v19 = *v17;
        v18 = v17[1];
        sub_24A259268();
        swift_bridgeObjectRetain();
        sub_24A25919C();
        v20 = sub_24A259280();
        v21 = -1 << *(_BYTE *)(v5 + 32);
        v22 = v20 & ~v21;
        v23 = v22 >> 6;
        v24 = 1 << v22;
        if (((1 << v22) & *(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
          break;
LABEL_6:
        result = swift_bridgeObjectRelease();
        v6 = v62;
        v5 = a3;
        v4 = a4;
      }
      v25 = *(_QWORD *)(a3 + 48);
      v26 = (_QWORD *)(v25 + 16 * v22);
      v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_24A259250() & 1) == 0)
      {
        v28 = ~v21;
        for (i = v22 + 1; ; i = v30 + 1)
        {
          v30 = i & v28;
          if (((*(_QWORD *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0)
            break;
          v31 = (_QWORD *)(v25 + 16 * v30);
          v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_24A259250() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v23 = v30 >> 6;
            v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      result = swift_bridgeObjectRelease();
LABEL_38:
      v6 = v62;
      v5 = a3;
      v57[v23] |= v24;
      v33 = __OFADD__(v61++, 1);
      v4 = a4;
      if (v33)
        goto LABEL_82;
    }
  }
  v34 = 0;
  v60 = a3 + 56;
  v61 = 0;
  v35 = 1 << *(_BYTE *)(a3 + 32);
  if (v35 < 64)
    v36 = ~(-1 << v35);
  else
    v36 = -1;
  v37 = v36 & *(_QWORD *)(a3 + 56);
  v63 = (unint64_t)(v35 + 63) >> 6;
  v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63)
      goto LABEL_79;
    v42 = *(_QWORD *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      v34 = v41 + 1;
      if (v41 + 1 >= v63)
        goto LABEL_79;
      v42 = *(_QWORD *)(v60 + 8 * v34);
      if (!v42)
      {
        v34 = v41 + 2;
        if (v41 + 2 >= v63)
          goto LABEL_79;
        v42 = *(_QWORD *)(v60 + 8 * v34);
        if (!v42)
          break;
      }
    }
LABEL_62:
    v37 = (v42 - 1) & v42;
    v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    v44 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v40);
    v46 = *v44;
    v45 = v44[1];
    sub_24A259268();
    swift_bridgeObjectRetain();
    sub_24A25919C();
    v47 = sub_24A259280();
    v48 = -1 << *(_BYTE *)(v4 + 32);
    v49 = v47 & ~v48;
    if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
      goto LABEL_46;
    v50 = *(_QWORD *)(a4 + 48);
    v51 = (_QWORD *)(v50 + 16 * v49);
    v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_24A259250() & 1) != 0)
    {
LABEL_76:
      result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      v33 = __OFADD__(v61++, 1);
      v5 = a3;
      v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_24A256DF0(v57, a2, v61, v5);
      }
    }
    else
    {
      v53 = ~v48;
      while (1)
      {
        v49 = (v49 + 1) & v53;
        if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
          break;
        v54 = (_QWORD *)(v50 + 16 * v49);
        v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_24A259250() & 1) != 0)
          goto LABEL_76;
      }
LABEL_46:
      result = swift_bridgeObjectRelease();
      v5 = a3;
      v4 = a4;
    }
  }
  v43 = v41 + 3;
  if (v43 >= v63)
    goto LABEL_79;
  v42 = *(_QWORD *)(v60 + 8 * v43);
  if (v42)
  {
    v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    v34 = v43 + 1;
    if (__OFADD__(v43, 1))
      break;
    if (v34 >= v63)
      goto LABEL_79;
    v42 = *(_QWORD *)(v60 + 8 * v34);
    ++v43;
    if (v42)
      goto LABEL_62;
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_24A256DF0(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791DEF0);
  result = sub_24A259214();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_24A259268();
    swift_bridgeObjectRetain();
    sub_24A25919C();
    result = sub_24A259280();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

unint64_t sub_24A257084(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_24A259250() & 1) == 0)
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
      while (!v14 && (sub_24A259250() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_24A257164(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_24A256458();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_24A2572FC();
      goto LABEL_22;
    }
    sub_24A2574AC();
  }
  v11 = *v4;
  sub_24A259268();
  sub_24A25919C();
  result = sub_24A259280();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_24A259250(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_24A25925C();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_24A259250();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_24A2572FC()
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
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791DEF0);
  v2 = *v0;
  v3 = sub_24A2591FC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24A2574AC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791DEF0);
  v3 = sub_24A259208();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_24A259268();
    swift_bridgeObjectRetain();
    sub_24A25919C();
    result = sub_24A259280();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_24A257758(uint64_t a1)
{
  return sub_24A256148(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_24A25776C(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_24A257968()
{
  unint64_t v0;

  v0 = sub_24A25922C();
  swift_bridgeObjectRelease();
  if (v0 >= 7)
    return 7;
  else
    return v0;
}

uint64_t sub_24A2579B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  id v26;
  void (*v27)(char *, _QWORD, uint64_t);
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  __int128 v34;
  _OWORD v35[2];
  uint64_t v36;

  v0 = sub_24A259118();
  v1 = *(_QWORD *)(v0 - 8);
  v29 = v0;
  v30 = v1;
  MEMORY[0x24BDAC7A8](v0, v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_allocWithZone(MEMORY[0x24BDD1488]);
  v6 = (void *)sub_24A259184();
  v7 = objc_msgSend(v5, sel_initWithPath_, v6);

  if (!v7)
  {
    __break(1u);
    goto LABEL_13;
  }
  v8 = (void *)sub_24A259184();
  v9 = objc_msgSend(v7, sel_objectForInfoDictionaryKey_, v8);

  if (!v9)
  {
LABEL_13:
    __break(1u);
    result = swift_release();
    __break(1u);
    return result;
  }
  sub_24A2591F0();
  swift_unknownObjectRelease();
  sub_24A25904C(&v34, v35);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25791DDB8);
  swift_dynamicCast();
  v10 = v36;
  v11 = *(_QWORD *)(v36 + 16);
  v12 = MEMORY[0x24BEE4AF8];
  if (v11)
  {
    v26 = v7;
    v33 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_24A25612C(0, v11, 0);
    v28 = *MEMORY[0x24BDCEBA8];
    v27 = *(void (**)(char *, _QWORD, uint64_t))(v30 + 104);
    v25 = v10;
    v13 = v10 + 40;
    do
    {
      v14 = v29;
      v27(v4, v28, v29);
      swift_bridgeObjectRetain();
      v15 = sub_24A259100();
      v17 = v16;
      (*(void (**)(char *, uint64_t))(v30 + 8))(v4, v14);
      *(_QWORD *)&v35[0] = v15;
      *((_QWORD *)&v35[0] + 1) = v17;
      *(_QWORD *)&v34 = 45;
      *((_QWORD *)&v34 + 1) = 0xE100000000000000;
      v31 = 95;
      v32 = 0xE100000000000000;
      sub_24A253848();
      v18 = sub_24A2591E4();
      v20 = v19;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v12 = v33;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24A25612C(0, *(_QWORD *)(v12 + 16) + 1, 1);
        v12 = v33;
      }
      v22 = *(_QWORD *)(v12 + 16);
      v21 = *(_QWORD *)(v12 + 24);
      if (v22 >= v21 >> 1)
      {
        sub_24A25612C((char *)(v21 > 1), v22 + 1, 1);
        v12 = v33;
      }
      v13 += 16;
      *(_QWORD *)(v12 + 16) = v22 + 1;
      v23 = v12 + 16 * v22;
      *(_QWORD *)(v23 + 32) = v18;
      *(_QWORD *)(v23 + 40) = v20;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    v7 = v26;
  }
  v36 = v12;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v35[0] = v36;
  swift_bridgeObjectRetain_n();
  sub_24A255538((char **)v35);
  swift_bridgeObjectRelease();

  v36 = *(_QWORD *)&v35[0];
  swift_bridgeObjectRelease();
  return v36;
}

char *sub_24A257D24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  char *v22;
  uint64_t v23;
  int64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  _QWORD v47[2];
  unsigned int v48;
  void (*v49)(char *, unint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67[2];
  uint64_t v68;

  v0 = sub_24A259118();
  v61 = *(_QWORD *)(v0 - 8);
  v62 = v0;
  MEMORY[0x24BDAC7A8](v0, v1);
  v60 = (char *)v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791DF00);
  v5 = MEMORY[0x24BDAC7A8](v3, v4);
  v59 = (char *)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5, v7);
  v58 = (char *)v47 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791DF08);
  MEMORY[0x24BDAC7A8](v9, v10);
  v57 = (char *)v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25791DF10);
  MEMORY[0x24BDAC7A8](v12, v13);
  v56 = (char *)v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24A259178();
  v54 = *(_QWORD *)(v15 - 8);
  v55 = v15;
  MEMORY[0x24BDAC7A8](v15, v16);
  v53 = (char *)v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_24A25916C();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18, v20);
  v22 = (char *)v47 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_24A259148();
  v24 = *(_QWORD *)(v23 + 16);
  if (v24)
  {
    v68 = MEMORY[0x24BEE4AF8];
    sub_24A25612C(0, v24, 0);
    v25 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
    v47[1] = v23;
    v26 = v23 + v25;
    v50 = *(_QWORD *)(v19 + 72);
    v49 = *(void (**)(char *, unint64_t, uint64_t))(v19 + 16);
    v48 = *MEMORY[0x24BDCEBA8];
    v51 = v19;
    v52 = v18;
    v27 = v60;
    do
    {
      v49(v22, v26, v18);
      sub_24A25913C();
      sub_24A259160();
      sub_24A259154();
      v28 = v53;
      sub_24A25910C();
      sub_24A2590F4();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v28, v55);
      v29 = (uint64_t)v59;
      sub_24A259154();
      v30 = sub_24A259130();
      LODWORD(v28) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 48))(v29, 1, v30);
      sub_24A25905C(v29, &qword_25791DF00);
      if ((_DWORD)v28 == 1)
      {
        v31 = (void *)objc_opt_self();
        v32 = (void *)sub_24A259184();
        swift_bridgeObjectRelease();
        v33 = objc_msgSend(v31, sel_addLikelySubtagsForLocaleIdentifier_, v32);

        sub_24A259190();
      }
      v34 = v61;
      v35 = v62;
      (*(void (**)(char *, _QWORD, uint64_t))(v61 + 104))(v27, v48, v62);
      v36 = (char *)sub_24A259100();
      v38 = v37;
      (*(void (**)(char *, uint64_t))(v34 + 8))(v27, v35);
      v67[0] = v36;
      v67[1] = v38;
      v65 = 45;
      v66 = 0xE100000000000000;
      v63 = 95;
      v64 = 0xE100000000000000;
      sub_24A253848();
      v39 = sub_24A2591E4();
      v41 = v40;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v18 = v52;
      (*(void (**)(char *, uint64_t))(v51 + 8))(v22, v52);
      v42 = v68;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24A25612C(0, *(_QWORD *)(v42 + 16) + 1, 1);
        v42 = v68;
      }
      v44 = *(_QWORD *)(v42 + 16);
      v43 = *(_QWORD *)(v42 + 24);
      if (v44 >= v43 >> 1)
      {
        sub_24A25612C((char *)(v43 > 1), v44 + 1, 1);
        v42 = v68;
      }
      *(_QWORD *)(v42 + 16) = v44 + 1;
      v45 = v42 + 16 * v44;
      *(_QWORD *)(v45 + 32) = v39;
      *(_QWORD *)(v45 + 40) = v41;
      v26 += v50;
      --v24;
    }
    while (v24);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v42 = MEMORY[0x24BEE4AF8];
  }
  v67[0] = (char *)v42;
  swift_bridgeObjectRetain();
  sub_24A255538(v67);
  swift_bridgeObjectRelease();
  return v67[0];
}

uint64_t sub_24A258224(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_24A2591D8();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_24A256248(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_24A2582B8(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;

  v22 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v7)
      return swift_release();
    v20 = *(_QWORD *)(v22 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v7)
        return swift_release();
      v20 = *(_QWORD *)(v22 + 8 * v9);
      if (!v20)
      {
        v9 = v19 + 2;
        if (v19 + 2 >= v7)
          return swift_release();
        v20 = *(_QWORD *)(v22 + 8 * v9);
        if (!v20)
        {
          v9 = v19 + 3;
          if (v19 + 3 >= v7)
            return swift_release();
          v20 = *(_QWORD *)(v22 + 8 * v9);
          if (!v20)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v20 - 1) & v20;
    v11 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_5:
    v12 = 16 * v11;
    v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + v12);
    v14 = *v13;
    v15 = v13[1];
    v16 = (uint64_t *)(*(_QWORD *)(a1 + 56) + v12);
    v17 = *v16;
    v18 = v16[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v14, v15, v17, v18);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v21 = v19 + 4;
  if (v21 >= v7)
    return swift_release();
  v20 = *(_QWORD *)(v22 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v7)
      return swift_release();
    v20 = *(_QWORD *)(v22 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

char *sub_24A258478()
{
  char *v0;
  char *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v9[3];

  v0 = sub_24A257D24();
  v1 = (char *)sub_24A258224((uint64_t)v0);
  swift_bridgeObjectRelease();
  v9[2] = v1;
  v2 = sub_24A253890((uint64_t)&unk_251BAD2E0);
  sub_24A2582B8(v2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_24A259038);
  swift_bridgeObjectRelease();
  v3 = sub_24A2579B0();
  v4 = sub_24A258224(v3);
  swift_bridgeObjectRelease();
  v5 = swift_bridgeObjectRetain();
  v6 = sub_24A256734(v5, v4);
  swift_bridgeObjectRelease();
  v7 = (char *)sub_24A2555A0(v6);
  swift_release();
  v9[0] = v7;
  swift_retain();
  sub_24A255538(v9);
  swift_bridgeObjectRelease();
  swift_release();
  return v9[0];
}

uint64_t sub_24A258574(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791DE18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_24A258600(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25791DE18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for VCSettings()
{
  return objc_opt_self();
}

unint64_t sub_24A25866C()
{
  unint64_t result;

  result = qword_25791DE28;
  if (!qword_25791DE28)
  {
    result = MEMORY[0x24BD0B0C4](&protocol conformance descriptor for RXDebugAutomationMode, &type metadata for RXDebugAutomationMode);
    atomic_store(result, (unint64_t *)&qword_25791DE28);
  }
  return result;
}

uint64_t sub_24A2586B0()
{
  return sub_24A258784(&qword_25791DE30, &qword_25791DE38);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD0B0B8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_24A25871C()
{
  unint64_t result;

  result = qword_25791DE40;
  if (!qword_25791DE40)
  {
    result = MEMORY[0x24BD0B0C4](&protocol conformance descriptor for VCOverlayType, &type metadata for VCOverlayType);
    atomic_store(result, (unint64_t *)&qword_25791DE40);
  }
  return result;
}

uint64_t sub_24A258760()
{
  return sub_24A258784(&qword_25791DE48, &qword_25791DE50);
}

uint64_t sub_24A258784(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24BD0B0C4](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24A2587C4@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC12VoiceControl10VCSettings_testMode);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_24A258814(char *a1, _QWORD *a2)
{
  char v2;
  char *v3;

  v2 = *a1;
  v3 = (char *)(*a2 + OBJC_IVAR____TtC12VoiceControl10VCSettings_testMode);
  swift_beginAccess();
  *v3 = v2;
  sub_24A253344(v2);
}

uint64_t sub_24A258870@<X0>(BOOL *a1@<X8>)
{
  uint64_t result;

  result = _AXSCommandAndControlEnabled();
  *a1 = (_DWORD)result != 0;
  return result;
}

uint64_t sub_24A25889C()
{
  return _AXSCommandAndControlSetEnabled();
}

uint64_t sub_24A2588A4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24A2546EC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24A2588D0(unsigned __int8 *a1)
{
  return sub_24A2547FC(*a1);
}

uint64_t sub_24A2588F4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24A254874();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24A258920(unsigned __int8 *a1)
{
  return sub_24A254984(*a1);
}

uint64_t sub_24A258944@<X0>(BOOL *a1@<X8>)
{
  uint64_t result;

  result = sub_24A254B48();
  *a1 = result == 3;
  return result;
}

uint64_t sub_24A258978(unsigned __int8 *a1)
{
  return sub_24A254C84(*a1);
}

uint64_t sub_24A25899C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_24A254E3C(&v3);
  *a1 = v3;
  return result;
}

unsigned __int8 *sub_24A2589D4(unsigned __int8 *a1)
{
  unsigned __int8 v2;

  v2 = *a1;
  return sub_24A254F5C(&v2);
}

uint64_t sub_24A258A08@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_24A2550E8(&v3);
  *a1 = v3;
  return result;
}

uint64_t sub_24A258A40(char *a1)
{
  char v2;

  v2 = *a1;
  return sub_24A255214((uint64_t)&v2);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RXDebugAutomationMode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RXDebugAutomationMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24A258B60 + 4 * byte_24A2597C9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24A258B94 + 4 * byte_24A2597C4[v4]))();
}

uint64_t sub_24A258B94(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A258B9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A258BA4);
  return result;
}

uint64_t sub_24A258BB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A258BB8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24A258BBC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A258BC4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RXDebugAutomationMode()
{
  return &type metadata for RXDebugAutomationMode;
}

uint64_t getEnumTagSinglePayload for VCOverlayType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for VCOverlayType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_24A258CC0 + 4 * byte_24A2597D3[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_24A258CF4 + 4 * byte_24A2597CE[v4]))();
}

uint64_t sub_24A258CF4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A258CFC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24A258D04);
  return result;
}

uint64_t sub_24A258D10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24A258D18);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_24A258D1C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A258D24(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24A258D30(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24A258D38(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for VCOverlayType()
{
  return &type metadata for VCOverlayType;
}

uint64_t type metadata accessor for VCUserDefaults()
{
  return objc_opt_self();
}

uint64_t method lookup function for VCSettings()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of VCSettings.testMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of VCSettings.testMode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of VCSettings.testMode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of VCSettings.enabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of VCSettings.enabled.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of VCSettings.enabled.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of VCSettings.supportedLocales.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of VCSettings.bestSupportedLocaleFor(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of VCSettings.setPreferredLocale(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of VCSettings.activeLocale.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of VCSettings.showTextResponseUponRecognition.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of VCSettings.showTextResponseUponRecognition.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of VCSettings.showTextResponseUponRecognition.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of VCSettings.playSoundUponRecognition.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of VCSettings.playSoundUponRecognition.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of VCSettings.playSoundUponRecognition.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of VCSettings.showUserHints.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of VCSettings.showUserHints.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of VCSettings.showUserHints.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of VCSettings.automationMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of VCSettings.automationMode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of VCSettings.automationMode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of VCSettings.alwaysShowOverlayType.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of VCSettings.alwaysShowOverlayType.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of VCSettings.alwaysShowOverlayType.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8))();
}

uint64_t sub_24A259038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_24A2539B0(a1, a2, a3, a4, *(uint64_t **)(v4 + 16));
}

uint64_t sub_24A259044()
{
  return swift_release();
}

_OWORD *sub_24A25904C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24A25905C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getNSLocaleClass_block_invoke_cold_1(v0);
}

void __getNSLocaleClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_24A2590E8();
}

uint64_t sub_24A2590E8()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_24A2590F4()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_24A259100()
{
  return MEMORY[0x24BDCEB30]();
}

uint64_t sub_24A25910C()
{
  return MEMORY[0x24BDCEB98]();
}

uint64_t sub_24A259118()
{
  return MEMORY[0x24BDCEBB8]();
}

uint64_t sub_24A259124()
{
  return MEMORY[0x24BDCEC88]();
}

uint64_t sub_24A259130()
{
  return MEMORY[0x24BDCED08]();
}

uint64_t sub_24A25913C()
{
  return MEMORY[0x24BDCEDE0]();
}

uint64_t sub_24A259148()
{
  return MEMORY[0x24BDCEDE8]();
}

uint64_t sub_24A259154()
{
  return MEMORY[0x24BDCEE18]();
}

uint64_t sub_24A259160()
{
  return MEMORY[0x24BDCEE20]();
}

uint64_t sub_24A25916C()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_24A259178()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_24A259184()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24A259190()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24A25919C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24A2591A8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24A2591B4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_24A2591C0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_24A2591CC()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_24A2591D8()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_24A2591E4()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_24A2591F0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24A2591FC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_24A259208()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_24A259214()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_24A259220()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_24A25922C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_24A259238()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_24A259244()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_24A259250()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24A25925C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_24A259268()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24A259274()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24A259280()
{
  return MEMORY[0x24BEE4328]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x24BED2170]();
}

uint64_t _AXSCommandAndControlSetEnabled()
{
  return MEMORY[0x24BED2178]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
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

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

