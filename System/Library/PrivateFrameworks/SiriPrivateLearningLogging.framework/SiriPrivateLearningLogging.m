id PLLoggingXPCServiceInterface()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AC6410);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v5, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2, v5, v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_storeInstrumentationWithEvents_completion_, 0, 0);

  return v0;
}

uint64_t sub_21188BA04(uint64_t a1)
{
  return sub_21188BAC8(a1, qword_254AC4C60);
}

uint64_t sub_21188BA28(uint64_t a1)
{
  return sub_21188BAC8(a1, qword_254AC4C78);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_21188BAA4(uint64_t a1)
{
  return sub_21188BAC8(a1, qword_254AC4C90);
}

uint64_t sub_21188BAC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2118966D4();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2118966C8();
}

_QWORD *sub_21188BB3C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_21188BB48(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

const char *SiriPLUSFeatureFlag.domain.getter()
{
  return "SiriPLUS";
}

uint64_t SiriPLUSFeatureFlag.feature.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_21188BB90 + 4 * byte_211896FE0[*v0]))("Logging", 7);
}

const char *sub_21188BB90()
{
  return "Analytics";
}

const char *sub_21188BBA4()
{
  return "AnalyticsMaintenance";
}

const char *sub_21188BBB8()
{
  return "AnalyticsEvents";
}

const char *sub_21188BBCC()
{
  return "PICSRuntime";
}

BOOL static SiriPLUSFeatureFlag.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SiriPLUSFeatureFlag.hash(into:)()
{
  return sub_2118969A4();
}

uint64_t SiriPLUSFeatureFlag.hashValue.getter()
{
  sub_211896998();
  sub_2118969A4();
  return sub_2118969B0();
}

BOOL sub_21188BC60(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21188BC74()
{
  sub_211896998();
  sub_2118969A4();
  return sub_2118969B0();
}

uint64_t sub_21188BCB8()
{
  return sub_2118969A4();
}

uint64_t sub_21188BCE0()
{
  sub_211896998();
  sub_2118969A4();
  return sub_2118969B0();
}

unint64_t sub_21188BD24()
{
  unint64_t result;

  result = qword_254AC48A0;
  if (!qword_254AC48A0)
  {
    result = MEMORY[0x212BE2498](&protocol conformance descriptor for SiriPLUSFeatureFlag, &type metadata for SiriPLUSFeatureFlag);
    atomic_store(result, (unint64_t *)&qword_254AC48A0);
  }
  return result;
}

const char *sub_21188BD68()
{
  return "SiriPLUS";
}

uint64_t sub_21188BD7C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_21188BDA4 + 4 * byte_211896FE5[*v0]))("Logging", 7);
}

const char *sub_21188BDA4()
{
  return "Analytics";
}

const char *sub_21188BDB8()
{
  return "AnalyticsMaintenance";
}

const char *sub_21188BDCC()
{
  return "AnalyticsEvents";
}

const char *sub_21188BDE0()
{
  return "PICSRuntime";
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriPLUSFeatureFlag(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SiriPLUSFeatureFlag(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21188BEE0 + 4 * byte_211896FEF[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_21188BF14 + 4 * byte_211896FEA[v4]))();
}

uint64_t sub_21188BF14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21188BF1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21188BF24);
  return result;
}

uint64_t sub_21188BF30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21188BF38);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_21188BF3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21188BF44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21188BF50(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21188BF5C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriPLUSFeatureFlag()
{
  return &type metadata for SiriPLUSFeatureFlag;
}

uint64_t sub_21188BF74()
{
  uint64_t result;

  type metadata accessor for SELFStoreFilter();
  result = sub_21188BFA0();
  qword_254AC4CA8 = result;
  return result;
}

uint64_t sub_21188BFA0()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[32];

  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_211896710();
  v3 = objc_msgSend(v1, sel_objectForInfoDictionaryKey_, v2);

  if (v3)
  {
    sub_21189686C();
    swift_unknownObjectRelease();
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
  }
  sub_21188D3F0((uint64_t)&v13, (uint64_t)v15);
  sub_21188D478((uint64_t)v15, (uint64_t)&v13);
  if (*((_QWORD *)&v14 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4970);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v4 = v12;
      goto LABEL_13;
    }
  }
  else
  {
    sub_21188D4C0((uint64_t)&v13);
  }
  if (qword_254AC47B0 != -1)
    swift_once();
  v5 = sub_2118966D4();
  __swift_project_value_buffer(v5, (uint64_t)qword_254AC48A8);
  v6 = sub_2118966BC();
  v7 = sub_2118967F4();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    *(_QWORD *)&v13 = v9;
    *(_DWORD *)v8 = 136315138;
    sub_211891CD8(0xD000000000000017, 0x8000000211897450, (uint64_t *)&v13);
    sub_211896854();
    _os_log_impl(&dword_21188A000, v6, v7, "Bundle info is missing %s, using an empty allow list", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BE2510](v9, -1, -1);
    MEMORY[0x212BE2510](v8, -1, -1);
  }

  v4 = sub_21188D29C(MEMORY[0x24BEE4AF8]);
LABEL_13:
  type metadata accessor for SELFStoreFilter();
  v10 = swift_allocObject();
  sub_21188C23C(v4);
  sub_21188D4C0((uint64_t)v15);
  return v10;
}

uint64_t sub_21188C23C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  int64_t v6;
  char *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __CFString *v18;
  __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  int v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;

  v42 = a1 + 64;
  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 64);
  v43 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v6 = 0;
  v7 = (char *)MEMORY[0x24BEE4AF8];
  v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
  while (v4)
  {
    v9 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    v10 = v9 | (v6 << 6);
LABEL_26:
    if (*(_BYTE *)(*(_QWORD *)(a1 + 56) + v10) == 1)
    {
      v14 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
      v16 = *v14;
      v15 = v14[1];
      swift_bridgeObjectRetain();
      v17 = (id)sub_211896710();
      if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNKNOWN_EVENT")) & 1) == 0)
      {
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UEI_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 1;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UEI_SERVER_EVENT")) & 1) != 0)
        {
          v25 = 2;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("DAILY_DEVICE_STATUS")) & 1) != 0)
        {
          v25 = 3;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("MT_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 4;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PROACTIVE_EVENT_TRACKER")) & 1) != 0)
        {
          v25 = 5;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ORDERED_ANY_EVENT")) & 1) != 0)
        {
          v25 = 6;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PROVISIONAL_EVENT")) & 1) != 0)
        {
          v25 = 7;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SIRI_UNDER_TEST_EVENT")) & 1) != 0)
        {
          v25 = 8;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("REQUEST_LINK_EVENT")) & 1) != 0)
        {
          v25 = 9;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ABE_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 10;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ABE_SERVER_EVENT")) & 1) != 0)
        {
          v25 = 11;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("FLOW_SERVER_EVENT")) & 1) != 0)
        {
          v25 = 12;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("FLOW_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 13;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CAM_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 14;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UNIFIED_SIRI_PERFORMANCE_EVENT")) & 1) != 0)
        {
          v25 = 15;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("GRR_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 16;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("DIM_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 17;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("NLX_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 18;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ORCH_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 19;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ASR_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 20;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("DATA_UPLOAD_EVENT")) & 1) != 0)
        {
          v25 = 21;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("IH_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 22;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("MH_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 23;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TTS_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 24;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CLP_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 25;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RR_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 26;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CNV_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 27;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ANC_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 28;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ANC_SERVER_EVENT")) & 1) != 0)
        {
          v25 = 29;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("DELETE_HISTORY_TRIGGER_SERVER_EVENT")) & 1) != 0)
        {
          v25 = 30;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("HAL_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 31;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("NET_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 32;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SAD_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 33;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("DFI_DATA_EVENT")) & 1) != 0)
        {
          v25 = 34;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SERVER_ORDERED_ANY_EVENT")) & 1) != 0)
        {
          v25 = 35;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SERVER_REQUEST_LINK_EVENT")) & 1) != 0)
        {
          v25 = 36;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("DODML_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 37;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PLUS_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 38;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("EXP_SEARCH_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 39;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("EXP_SIRI_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 40;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SRST_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 41;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("POMMES_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 42;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("MT_CLIENT_EVENT_V2")) & 1) != 0)
        {
          v25 = 43;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CDA_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 44;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("MWT_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 45;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("HOME_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 46;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("OPT_IN_CHANGELOG_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 47;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("OPT_IN_PROPAGATION_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 48;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PEGASUS_SERVER_EVENT")) & 1) != 0)
        {
          v25 = 49;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RSS_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 50;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("EXP_SIRI_SERVER_EVENT")) & 1) != 0)
        {
          v25 = 51;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SUGGESTIONS_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 52;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("FLOW_LINK_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 53;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RF_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 54;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SIRI_SERVER_ORDERED_ANY_EVENT")) & 1) != 0)
        {
          v25 = 55;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SIC_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 56;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("INFERENCE_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 57;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CAAR_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 58;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RFG_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 59;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SMT_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 60;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SC_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 61;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SIRI_SETUP_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 62;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("OPT_IN_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 63;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LOG_REDACTION_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 64;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PSE_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 65;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("GROUPED_MESSAGES_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 66;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ACTIVATION_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 67;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("IA_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 68;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("NLG_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 69;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TTM_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 70;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRP_REQUEST_LINK_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 71;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ODM_SIRI_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 72;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("IDENTITY_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 73;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("HOMEKIT_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 74;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("READ_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 75;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("OPAQUE_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 76;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("GROUPED_MESSAGES_SERVER_EVENT")) & 1) != 0)
        {
          v25 = 77;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("GROUPED_MESSAGES_GROUPING")) & 1) != 0)
        {
          v25 = 78;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("GROUPED_MESSAGES_PRODUCER_METADATA")) & 1) != 0)
        {
          v25 = 79;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RTS_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 80;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ODD_SIRI_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 81;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SESSION_EVENT")) & 1) != 0)
        {
          v25 = 82;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SESSION_BYTE_EVENT")) & 1) != 0)
        {
          v25 = 83;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ODBATCH_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 84;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("NLROUTER_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 85;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PFA_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 86;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SPEECH_DONATION_EVENT")) & 1) != 0)
        {
          v25 = 87;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SR_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 88;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("IFT_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 89;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("CM_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 90;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PNR_ON_DEVICE_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 91;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("JR_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 92;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("RG_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 93;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PR_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 94;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("QUERY_DECORATION_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 95;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PG_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 96;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("DIALOGENGINE_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 97;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("UAF_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 98;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("IF_PLATFORM_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 99;
          goto LABEL_238;
        }
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("IF_PLATFORM_REQUEST_CLIENT_EVENT")) & 1) != 0)
        {
          v25 = 100;
          goto LABEL_238;
        }
        if (objc_msgSend(v17, "isEqualToString:", CFSTR("FL_CLIENT_EVENT")))
        {
          v25 = 101;
LABEL_238:

          goto LABEL_239;
        }
      }

      v18 = CFSTR("UNKNOWN_EVENT");
      v19 = CFSTR("UNKNOWN_EVENT");
      v20 = sub_21189671C();
      v22 = v21;

      if (v16 == v20 && v15 == v22)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v24 = sub_211896974();
        swift_bridgeObjectRelease();
        if ((v24 & 1) == 0)
          goto LABEL_5;
      }
      v25 = 0;
LABEL_239:
      swift_bridgeObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v8 = sub_21188D69C(0, v8[2] + 1, 1, v8);
      v27 = v8[2];
      v26 = v8[3];
      if (v27 >= v26 >> 1)
        v8 = sub_21188D69C((_QWORD *)(v26 > 1), v27 + 1, 1, v8);
      v8[2] = v27 + 1;
      v28 = &v8[2 * v27];
      v28[4] = v16;
      v28[5] = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v7 = sub_21188D590(0, *((_QWORD *)v7 + 2) + 1, 1, v7);
      v30 = *((_QWORD *)v7 + 2);
      v29 = *((_QWORD *)v7 + 3);
      if (v30 >= v29 >> 1)
        v7 = sub_21188D590((char *)(v29 > 1), v30 + 1, 1, v7);
      *((_QWORD *)v7 + 2) = v30 + 1;
      *(_DWORD *)&v7[4 * v30 + 32] = v25;
LABEL_5:
      result = swift_bridgeObjectRelease();
    }
  }
  v11 = v6 + 1;
  if (__OFADD__(v6, 1))
  {
    __break(1u);
    goto LABEL_253;
  }
  if (v11 >= v43)
    goto LABEL_247;
  v12 = *(_QWORD *)(v42 + 8 * v11);
  ++v6;
  if (v12)
    goto LABEL_25;
  v6 = v11 + 1;
  if (v11 + 1 >= v43)
    goto LABEL_247;
  v12 = *(_QWORD *)(v42 + 8 * v6);
  if (v12)
    goto LABEL_25;
  v6 = v11 + 2;
  if (v11 + 2 >= v43)
    goto LABEL_247;
  v12 = *(_QWORD *)(v42 + 8 * v6);
  if (v12)
    goto LABEL_25;
  v6 = v11 + 3;
  if (v11 + 3 >= v43)
    goto LABEL_247;
  v12 = *(_QWORD *)(v42 + 8 * v6);
  if (v12)
    goto LABEL_25;
  v6 = v11 + 4;
  if (v11 + 4 >= v43)
    goto LABEL_247;
  v12 = *(_QWORD *)(v42 + 8 * v6);
  if (v12)
    goto LABEL_25;
  v13 = v11 + 5;
  if (v13 >= v43)
  {
LABEL_247:
    swift_release();
    swift_bridgeObjectRelease();
    if (qword_254AC47A0 == -1)
    {
LABEL_248:
      v31 = sub_2118966D4();
      __swift_project_value_buffer(v31, (uint64_t)qword_254AC4C90);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v32 = sub_2118966BC();
      v33 = sub_2118967E8();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = swift_slowAlloc();
        v35 = swift_slowAlloc();
        *(_DWORD *)v34 = 134218242;
        v44 = v35;
        sub_211896854();
        swift_bridgeObjectRelease();
        *(_WORD *)(v34 + 12) = 2080;
        v36 = swift_bridgeObjectRetain();
        v37 = MEMORY[0x212BE1F64](v36, MEMORY[0x24BEE0D00]);
        v39 = v38;
        swift_bridgeObjectRelease();
        sub_211891CD8(v37, v39, &v44);
        sub_211896854();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21188A000, v32, v33, "SELFStoreFilter is configured to allow %ld event type(s): %s", (uint8_t *)v34, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x212BE2510](v35, -1, -1);
        MEMORY[0x212BE2510](v34, -1, -1);
        swift_bridgeObjectRelease();

      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      v40 = sub_21188DAC4((uint64_t)v7);
      swift_bridgeObjectRelease();
      result = v41;
      *(_QWORD *)(v41 + 16) = v40;
      return result;
    }
LABEL_253:
    swift_once();
    goto LABEL_248;
  }
  v12 = *(_QWORD *)(v42 + 8 * v13);
  if (v12)
  {
    v6 = v13;
LABEL_25:
    v4 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v6 << 6);
    goto LABEL_26;
  }
  while (1)
  {
    v6 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v6 >= v43)
      goto LABEL_247;
    v12 = *(_QWORD *)(v42 + 8 * v6);
    ++v13;
    if (v12)
      goto LABEL_25;
  }
  __break(1u);
  return result;
}

unint64_t sub_21188D29C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4988);
  v2 = (_QWORD *)sub_211896950();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_21188D7A8(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_BYTE *)(v2[7] + result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 24;
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

uint64_t sub_21188D3AC()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SELFStoreFilter()
{
  return objc_opt_self();
}

uint64_t sub_21188D3F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4968);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BE2480]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21188D478(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4968);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21188D4C0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4968);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21188D500()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_2118966D4();
  __swift_allocate_value_buffer(v0, qword_254AC48A8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_254AC48A8);
  if (qword_254AC47A0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_254AC4C90);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

char *sub_21188D590(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4978);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 29;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32])
          memmove(v13, a4 + 32, 4 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_21188D9DC(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_21188D69C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4980);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_21188D8EC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_21188D7A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_211896998();
  sub_211896740();
  v4 = sub_2118969B0();
  return sub_21188D80C(a1, a2, v4);
}

unint64_t sub_21188D80C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_211896974() & 1) == 0)
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
      while (!v14 && (sub_211896974() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21188D8EC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_21189695C();
  __break(1u);
  return result;
}

char *sub_21188D9DC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 4 * a1 + 32);
    v6 = 4 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_21189695C();
  __break(1u);
  return result;
}

uint64_t sub_21188DAC4(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  unsigned int *v4;
  unsigned int v5;
  int v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_2118967C4();
  v7 = result;
  if (v2)
  {
    v4 = (unsigned int *)(a1 + 32);
    do
    {
      v5 = *v4++;
      sub_211893758(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

id sub_21188DB38()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)PLLoggingServiceStore), sel_init);
  qword_254AC4990 = (uint64_t)result;
  return result;
}

id static PLLoggingServiceStore.sharedInstance.getter()
{
  if (qword_254AC47B8 != -1)
    swift_once();
  return (id)qword_254AC4990;
}

uint64_t PLLoggingServiceStore.storeInstrumentation(events:completion:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (qword_254AC47D8 != -1)
    swift_once();
  return sub_211895DB8(a1, a2, a3);
}

unint64_t sub_21188DD34()
{
  unint64_t result;

  result = qword_254AC4998;
  if (!qword_254AC4998)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254AC4998);
  }
  return result;
}

uint64_t sub_21188DD70(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_21188DD80()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_21188DDA4()
{
  uint64_t v0;

  return sub_211892A40(*(_QWORD *)(v0 + 16));
}

id sub_21188DDB0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(uint64_t);
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t aBlock;
  uint64_t v30;
  uint64_t (*v31)(uint64_t);
  void *v32;
  void (*v33)();
  uint64_t v34;

  v28 = a1;
  v26 = sub_21189680C();
  v1 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_211896800();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8]();
  sub_211896704();
  MEMORY[0x24BDAC7A8]();
  v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  sub_21188F338(0, (unint64_t *)&qword_254AC4BC0);
  v6 = v5;
  sub_2118966EC();
  aBlock = MEMORY[0x24BEE4AF8];
  sub_21188F370((unint64_t *)&unk_254AC49E0, v4, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4BD0);
  sub_21188F3B0((unint64_t *)&unk_254AC49F0, &qword_254AC4BD0);
  sub_211896878();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v26);
  v7 = (void *)sub_211896824();
  objc_msgSend(v6, sel_setSerialQueue_, v7);

  v8 = PLLoggingXPCServiceInterface();
  v9 = v28;
  objc_msgSend(v28, sel_setRemoteObjectInterface_, v8);

  v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v11 = swift_allocObject();
  v12 = v27;
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)(v11 + 24) = v12;
  v33 = sub_21188F438;
  v34 = v11;
  v13 = MEMORY[0x24BDAC760];
  aBlock = MEMORY[0x24BDAC760];
  v30 = 1107296256;
  v31 = sub_21188E9E0;
  v32 = &block_descriptor_18;
  v14 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v9, sel_setInvalidationHandler_, v14);
  _Block_release(v14);
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v15;
  *(_QWORD *)(v16 + 24) = v12;
  v33 = sub_21188F460;
  v34 = v16;
  aBlock = v13;
  v30 = 1107296256;
  v31 = sub_21188E9E0;
  v32 = &block_descriptor_25;
  v17 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v9, sel_setInterruptionHandler_, v17);
  _Block_release(v17);
  v18 = objc_msgSend(v6, sel_serialQueue);
  objc_msgSend(v9, sel__setQueue_, v18);

  objc_msgSend(v6, sel_setClientConnection_, v9);
  v19 = objc_msgSend(v6, sel_clientConnection);

  objc_msgSend(v19, sel_resume);
  if (qword_254AC4790 != -1)
    swift_once();
  v20 = sub_2118966D4();
  __swift_project_value_buffer(v20, (uint64_t)qword_254AC4C60);
  v21 = sub_2118966BC();
  v22 = sub_2118967E8();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_21188A000, v21, v22, "PLLoggingServiceClient initialized", v23, 2u);
    MEMORY[0x212BE2510](v23, -1, -1);
  }

  return v6;
}

uint64_t sub_21188E268()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[2];
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_2118966E0();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v15[0] = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_211896704();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(v1, sel_serialQueue);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v1;
  aBlock[4] = sub_21188F4AC;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21188E9E0;
  aBlock[3] = &block_descriptor_31;
  v12 = _Block_copy(aBlock);
  v13 = v1;
  sub_2118966F8();
  v15[1] = MEMORY[0x24BEE4AF8];
  sub_21188F370(&qword_254AC49A0, v3, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AC49A8);
  sub_21188F3B0((unint64_t *)&unk_254AC49B0, &qword_254AC49A8);
  sub_211896878();
  MEMORY[0x212BE1FD0](0, v9, v5, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v15[0] + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return swift_release();
}

void sub_21188E468(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), const char *a4)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  void *v12;

  v6 = a1 + 16;
  if (qword_254AC4790 != -1)
    swift_once();
  v7 = sub_2118966D4();
  __swift_project_value_buffer(v7, (uint64_t)qword_254AC4C60);
  v8 = sub_2118966BC();
  v9 = a3();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_21188A000, v8, v9, a4, v10, 2u);
    MEMORY[0x212BE2510](v10, -1, -1);
  }

  swift_beginAccess();
  v11 = MEMORY[0x212BE254C](v6);
  if (v11)
  {
    v12 = (void *)v11;
    sub_21188E268();

  }
}

uint64_t PLLoggingServiceClient.storeInstrumentation(events:completion:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  id v19;
  _QWORD *v20;
  void *v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v4 = v3;
  v8 = sub_2118966E0();
  v28 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_211896704();
  v26 = *(_QWORD *)(v11 - 8);
  v27 = v11;
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254AC4790 != -1)
    swift_once();
  v14 = sub_2118966D4();
  __swift_project_value_buffer(v14, (uint64_t)qword_254AC4C60);
  swift_bridgeObjectRetain_n();
  v15 = sub_2118966BC();
  v16 = sub_2118967E8();
  if (os_log_type_enabled(v15, v16))
  {
    v25 = a3;
    v17 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v17 = 134217984;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      v18 = sub_211896944();
      swift_bridgeObjectRelease();
    }
    else
    {
      v18 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    aBlock[0] = v18;
    sub_211896854();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21188A000, v15, v16, "storeInstrumentation called with %ld event(s)", v17, 0xCu);
    MEMORY[0x212BE2510](v17, -1, -1);

    a3 = v25;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v19 = objc_msgSend(v4, sel_serialQueue);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = v4;
  v20[3] = a1;
  v20[4] = a2;
  v20[5] = a3;
  aBlock[4] = sub_21188F028;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21188E9E0;
  aBlock[3] = &block_descriptor;
  v21 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  v22 = v4;
  sub_21188F088(a2);
  sub_2118966F8();
  v29 = MEMORY[0x24BEE4AF8];
  sub_21188F370(&qword_254AC49A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AC49A8);
  sub_21188F3B0((unint64_t *)&unk_254AC49B0, &qword_254AC49A8);
  sub_211896878();
  MEMORY[0x212BE1FD0](0, v13, v10, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v27);
  return swift_release();
}

id sub_21188E8DC()
{
  void *v0;
  id result;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD aBlock[6];

  result = objc_msgSend(v0, sel_clientConnection);
  if (result)
  {
    v2 = result;
    aBlock[4] = sub_21188EAD0;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21188ECAC;
    aBlock[3] = &block_descriptor_9;
    v3 = _Block_copy(aBlock);
    v4 = objc_msgSend(v2, sel_remoteObjectProxyWithErrorHandler_, v3);
    _Block_release(v3);

    sub_21189686C();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AC49C0);
    if (swift_dynamicCast())
      return (id)v5;
    else
      return 0;
  }
  return result;
}

uint64_t sub_21188E9E0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_21188EAD0(void *a1)
{
  uint64_t v2;
  id v3;
  id v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *oslog;
  uint64_t v12;

  if (qword_254AC4790 != -1)
    swift_once();
  v2 = sub_2118966D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_254AC4C60);
  v3 = a1;
  v4 = a1;
  oslog = sub_2118966BC();
  v5 = sub_2118967F4();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v12 = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AC49C8);
    v9 = sub_211896728();
    sub_211891CD8(v9, v10, &v12);
    sub_211896854();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_21188A000, oslog, v5, "Error communicating with PLLoggingService XPC %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BE2510](v7, -1, -1);
    MEMORY[0x212BE2510](v6, -1, -1);

  }
  else
  {

  }
}

void sub_21188ECAC(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

id sub_21188ECFC(void *a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_msgSend(a1, sel_clientConnection);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_setExportedObject_, 0);

  }
  v4 = objc_msgSend(a1, sel_clientConnection);
  objc_msgSend(v4, sel_invalidate);

  return objc_msgSend(a1, sel_setClientConnection_, 0);
}

uint64_t sub_21188ED88(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_21188ED98(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_21188EDCC@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

void *sub_21188EDF4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_21189695C();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

_BYTE **sub_21188EE88(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

id _sSo22PLLoggingServiceClientC26SiriPrivateLearningLoggingE04makeC0AByFZ_0()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  void *v5;
  id v6;

  if (qword_254AC4790 != -1)
    swift_once();
  v0 = sub_2118966D4();
  __swift_project_value_buffer(v0, (uint64_t)qword_254AC4C60);
  v1 = sub_2118966BC();
  v2 = sub_2118967E8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21188A000, v1, v2, "makeClient: creating a new PLLoggingServiceClient", v3, 2u);
    MEMORY[0x212BE2510](v3, -1, -1);
  }

  sub_21189671C();
  v4 = objc_allocWithZone(MEMORY[0x24BDD1988]);
  v5 = (void *)sub_211896710();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithMachServiceName_options_, v5, 0);

  sub_21188F338(0, (unint64_t *)&unk_254AC49D0);
  return sub_21188DDB0(v6);
}

uint64_t sub_21188EFEC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 32))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_21188F028()
{
  _QWORD *v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;

  v1 = v0[3];
  v2 = (void *)v0[4];
  v3 = v0[5];
  v4 = sub_21188E8DC();
  sub_21188F100(v4, v1, v2, v3);
  return swift_unknownObjectRelease();
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

uint64_t sub_21188F088(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BE248C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21188F0DC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21188F100(void *a1, unint64_t a2, void *a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  _QWORD v14[6];

  if (a1)
  {
    sub_21188F338(0, (unint64_t *)&qword_254AC4998);
    swift_unknownObjectRetain();
    v8 = (void *)sub_211896788();
    if (a3)
    {
      v14[4] = a3;
      v14[5] = a4;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 1107296256;
      v14[2] = sub_21188E9E0;
      v14[3] = &block_descriptor_6;
      a3 = _Block_copy(v14);
      swift_retain();
      swift_release();
    }
    objc_msgSend(a1, sel_storeInstrumentationWithEvents_completion_, v8, a3);
    _Block_release(a3);
    swift_unknownObjectRelease();

  }
  else
  {
    if (qword_254AC4790 != -1)
      swift_once();
    v9 = sub_2118966D4();
    __swift_project_value_buffer(v9, (uint64_t)qword_254AC4C60);
    swift_bridgeObjectRetain_n();
    v10 = sub_2118966BC();
    v11 = sub_2118967F4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v12 = 134217984;
      if (a2 >> 62)
      {
        swift_bridgeObjectRetain();
        v13 = sub_211896944();
        swift_bridgeObjectRelease();
      }
      else
      {
        v13 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v14[0] = v13;
      sub_211896854();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21188A000, v10, v11, "Cannot store %ld event(s), unable to obtain a connection", v12, 0xCu);
      MEMORY[0x212BE2510](v12, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_21188F338(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21188F370(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x212BE2498](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21188F3B0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x212BE2498](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21188F3F0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21188F414()
{
  swift_release();
  return swift_deallocObject();
}

void sub_21188F438()
{
  uint64_t v0;

  sub_21188E468(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), MEMORY[0x24BEE7910], "Client connection was invalidated");
}

void sub_21188F460()
{
  uint64_t v0;

  sub_21188E468(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), MEMORY[0x24BEE7908], "Client connection was interrupted");
}

uint64_t sub_21188F488()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_21188F4AC()
{
  uint64_t v0;

  return sub_21188ECFC(*(void **)(v0 + 16));
}

BOOL sub_21188F4E0(unsigned int a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  int v12;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v4 = MEMORY[0x212BE2144](*(_QWORD *)(a2 + 40), a1, 4);
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(_DWORD *)(v8 + 4 * v6) == a1)
    return 1;
  v10 = ~v5;
  v11 = (v6 + 1) & v10;
  if (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
    return 0;
  do
  {
    v12 = *(_DWORD *)(v8 + 4 * v11);
    result = v12 == a1;
    if (v12 == a1)
      break;
    v11 = (v11 + 1) & v10;
  }
  while (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_21188F5AC()
{
  return sub_211896620();
}

uint64_t sub_21188F5C8()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  sub_211896650();
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_211896620();
  type metadata accessor for _FlatFileStore();
  v2 = swift_allocObject();
  result = _FlatFileStore.init(path:)((uint64_t)v1);
  qword_253EF9418 = v2;
  return result;
}

uint64_t _FlatFileStore.__allocating_init()()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v4;

  sub_211896650();
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_211896620();
  type metadata accessor for _FlatFileStore();
  v2 = swift_allocObject();
  _FlatFileStore.init(path:)((uint64_t)v1);
  return v2;
}

uint64_t static _FlatFileStore.shared.getter()
{
  if (qword_253EF9420 != -1)
    swift_once();
  return swift_retain();
}

uint64_t _FlatFileStore.__allocating_init(path:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  _FlatFileStore.init(path:)(a1);
  return v2;
}

uint64_t type metadata accessor for _FlatFileStore()
{
  uint64_t result;

  result = qword_253EF9428;
  if (!qword_253EF9428)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t _FlatFileStore.init(path:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  unsigned int v9;
  void (*v10)(uint64_t, uint64_t);
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  id v22;
  id v23[2];

  v2 = v1;
  v23[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = v1 + OBJC_IVAR____TtC26SiriPrivateLearningLogging14_FlatFileStore_path;
  v5 = sub_211896650();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  v7 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v8 = (void *)sub_21189662C();
  v23[0] = 0;
  v9 = objc_msgSend(v7, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v8, 1, 0, v23);

  if (v9)
  {
    v10 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v11 = v23[0];
    v10(a1, v5);
  }
  else
  {
    v12 = v23[0];
    v13 = (void *)sub_211896608();

    swift_willThrow();
    if (qword_254AC47A0 != -1)
      swift_once();
    v14 = sub_2118966D4();
    __swift_project_value_buffer(v14, (uint64_t)qword_254AC4C90);
    swift_retain_n();
    v15 = sub_2118966BC();
    v16 = sub_2118967F4();
    if (os_log_type_enabled(v15, v16))
    {
      v22 = v13;
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = (void *)swift_slowAlloc();
      v23[0] = v18;
      *(_DWORD *)v17 = 136315138;
      sub_21188F370(&qword_254AC4A00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v19 = sub_211896968();
      sub_211891CD8(v19, v20, (uint64_t *)v23);
      sub_211896854();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21188A000, v15, v16, "Unable to create directory: %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE2510](v18, -1, -1);
      MEMORY[0x212BE2510](v17, -1, -1);

    }
    else
    {

      swift_release_n();
    }

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
  }
  return v2;
}

uint64_t sub_21188FAB4(unint64_t a1)
{
  return sub_21189147C(a1, sub_21188FAC0);
}

void sub_21188FAC0(void **a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v17;
  void *v18;
  id v19;
  void *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  unint64_t v28;
  unint64_t v29;
  double v30;
  double v31;
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
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  void (*v49)(char *, uint64_t);
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  char *v63;
  uint64_t v64;
  id v65;
  NSObject *v66;
  os_log_type_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  void *v81;
  void (*v82)(char *, char *, uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88[2];
  uint64_t v89;

  v83 = a2;
  v3 = sub_211896650();
  v4 = *(_QWORD *)(v3 - 8);
  v84 = v3;
  v85 = v4;
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v80 = (char *)&v80 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v80 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v86 = (char *)&v80 - v10;
  v82 = (void (*)(char *, char *, uint64_t))sub_2118966B0();
  v11 = *((_QWORD *)v82 - 1);
  MEMORY[0x24BDAC7A8](v82);
  v13 = (char *)&v80 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_21189668C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v80 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a1;
  v19 = sub_211891B6C(v18);
  if (v19)
  {
    v20 = v19;
    v21 = (char *)objc_msgSend(v19, sel_anyEventType);

  }
  else
  {
    v21 = (char *)objc_msgSend(v18, sel_anyEventType);
  }
  v81 = v18;
  v22 = v9;
  if (v21 > 0x65)
  {
    v24 = CFSTR("UNKNOWN_EVENT");
    v25 = CFSTR("UNKNOWN_EVENT");
  }
  else
  {
    v23 = 8 * (int)v21;
    v24 = *(__CFString **)((char *)&off_24CC9C5F8 + v23);
    v25 = *(__CFString **)((char *)&off_24CC9C928 + v23);
  }
  v26 = v24;
  v27 = v25;
  v87 = sub_21189671C();
  v29 = v28;

  if (qword_254AC47A8 != -1)
    swift_once();
  if (sub_21188F4E0(v21, *(_QWORD *)(qword_254AC4CA8 + 16)))
  {
    sub_211896680();
    sub_211896674();
    v31 = v30;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    if ((~*(_QWORD *)&v31 & 0x7FF0000000000000) != 0)
    {
      if (v31 > -9.22337204e18)
      {
        if (v31 < 9.22337204e18)
        {
          v88[0] = (uint64_t)v31;
          sub_211896968();
          v88[0] = v87;
          v88[1] = v29;
          swift_bridgeObjectRetain();
          sub_211896758();
          sub_211896758();
          swift_bridgeObjectRelease();
          sub_211896758();
          sub_2118966A4();
          sub_211896698();
          (*(void (**)(char *, void (*)(char *, char *, uint64_t)))(v11 + 8))(v13, v82);
          v32 = sub_2118929B4(4);
          v34 = v33;
          v36 = v35;
          v38 = v37;
          swift_bridgeObjectRelease();
          MEMORY[0x212BE1EEC](v32, v34, v36, v38);
          sub_211896758();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_211896758();
          v21 = v86;
          sub_211896638();
          swift_bridgeObjectRelease();
          if (qword_254AC47A0 == -1)
          {
LABEL_14:
            v39 = sub_2118966D4();
            v40 = __swift_project_value_buffer(v39, (uint64_t)qword_254AC4C90);
            v42 = v84;
            v41 = v85;
            v82 = *(void (**)(char *, char *, uint64_t))(v85 + 16);
            v82(v22, v21, v84);
            swift_bridgeObjectRetain();
            v83 = v40;
            v43 = sub_2118966BC();
            v44 = sub_2118967E8();
            if (os_log_type_enabled(v43, v44))
            {
              v45 = swift_slowAlloc();
              v46 = swift_slowAlloc();
              v88[0] = v46;
              *(_DWORD *)v45 = 136315394;
              swift_bridgeObjectRetain();
              v89 = sub_211891CD8(v87, v29, v88);
              sub_211896854();
              swift_bridgeObjectRelease_n();
              *(_WORD *)(v45 + 12) = 2080;
              v47 = sub_211896644();
              v89 = sub_211891CD8(v47, v48, v88);
              sub_211896854();
              swift_bridgeObjectRelease();
              v49 = *(void (**)(char *, uint64_t))(v85 + 8);
              v49(v22, v42);
              _os_log_impl(&dword_21188A000, v43, v44, "Storing an event of type=%s to path=%s", (uint8_t *)v45, 0x16u);
              swift_arrayDestroy();
              v50 = v46;
              v21 = v86;
              MEMORY[0x212BE2510](v50, -1, -1);
              MEMORY[0x212BE2510](v45, -1, -1);
            }
            else
            {
              swift_bridgeObjectRelease_n();
              v49 = *(void (**)(char *, uint64_t))(v41 + 8);
              v49(v22, v42);
            }

            v56 = v81;
            v57 = (void *)objc_opt_self();
            __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4AD0);
            v58 = swift_allocObject();
            *(_OWORD *)(v58 + 16) = xmmword_211897150;
            *(_QWORD *)(v58 + 56) = sub_21188DD34();
            *(_QWORD *)(v58 + 32) = v56;
            v59 = v56;
            v60 = (void *)sub_211896788();
            swift_bridgeObjectRelease();
            sub_211896644();
            v61 = (void *)sub_211896710();
            swift_bridgeObjectRelease();
            v62 = objc_msgSend(v57, sel_writeProtoBuffers_toFile_, v60, v61);

            if (v62)
            {
              v63 = v80;
              v82(v80, v21, v42);
              v64 = v42;
              v65 = v62;
              v66 = sub_2118966BC();
              v67 = sub_2118967F4();
              if (os_log_type_enabled(v66, v67))
              {
                v68 = v63;
                v69 = swift_slowAlloc();
                v87 = swift_slowAlloc();
                v88[0] = v87;
                *(_DWORD *)v69 = 136315394;
                v70 = sub_211896644();
                v89 = sub_211891CD8(v70, v71, v88);
                sub_211896854();
                swift_bridgeObjectRelease();
                v72 = v68;
                v73 = v64;
                v49(v72, v64);
                *(_WORD *)(v69 + 12) = 2080;
                v89 = (uint64_t)v65;
                v74 = v65;
                __swift_instantiateConcreteTypeFromMangledName(&qword_254AC49C8);
                v75 = sub_211896728();
                v89 = sub_211891CD8(v75, v76, v88);
                sub_211896854();

                swift_bridgeObjectRelease();
                _os_log_impl(&dword_21188A000, v66, v67, "Failed to write an event to path=%s, error=%s", (uint8_t *)v69, 0x16u);
                v77 = v87;
                swift_arrayDestroy();
                MEMORY[0x212BE2510](v77, -1, -1);
                MEMORY[0x212BE2510](v69, -1, -1);

                v78 = v86;
                v79 = v73;
              }
              else
              {

                v49(v63, v64);
                v78 = v21;
                v79 = v64;
              }
            }
            else
            {
              v78 = v21;
              v79 = v42;
            }
            v49(v78, v79);
            return;
          }
LABEL_31:
          swift_once();
          goto LABEL_14;
        }
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_30;
  }
  if (qword_254AC47A0 != -1)
    swift_once();
  v51 = sub_2118966D4();
  __swift_project_value_buffer(v51, (uint64_t)qword_254AC4C90);
  swift_bridgeObjectRetain();
  v52 = sub_2118966BC();
  v53 = sub_2118967E8();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc();
    v55 = swift_slowAlloc();
    v88[0] = v55;
    *(_DWORD *)v54 = 136315138;
    swift_bridgeObjectRetain();
    v89 = sub_211891CD8(v87, v29, v88);
    sub_211896854();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21188A000, v52, v53, "Dropping an event of type=%s: not allowed", v54, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BE2510](v55, -1, -1);
    MEMORY[0x212BE2510](v54, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_211890430(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  if (!(a1 >> 62))
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  result = sub_211896944();
  v3 = result;
  if (!result)
    return swift_bridgeObjectRelease();
LABEL_3:
  if (v3 >= 1)
  {
    v5 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x212BE20CC](v5, a1);
      else
        v6 = *(id *)(a1 + 8 * v5 + 32);
      v7 = v6;
      ++v5;
      v8 = v6;
      sub_21188FAC0(&v8, v1);

    }
    while (v3 != v5);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

unint64_t sub_211890510()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *);
  id v11;
  void *v12;
  id v13;
  id v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint8_t *v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  _OWORD v40[2];
  __int128 v41;
  uint64_t v42;
  unint64_t v43;

  v1 = v0;
  v2 = sub_211896614();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_211896650();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void (**)(char *))(v7 + 16);
  v38 = v0 + OBJC_IVAR____TtC26SiriPrivateLearningLogging14_FlatFileStore_path;
  v10(v9);
  v11 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_211896644();
  v12 = (void *)sub_211896710();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_enumeratorAtPath_, v12);

  if (v13)
  {
    v37 = v6;
    v43 = MEMORY[0x24BEE4AF8];
    v14 = v13;
    sub_2118967D0();

    sub_21188F370(&qword_254AC4A08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCD520], MEMORY[0x24BDCD530]);
    sub_211896848();
    while (v42)
    {
      sub_2118927BC(&v41, v40);
      sub_211890AE8((uint64_t)v40, (uint64_t *)&v39);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v40);
      sub_211892318(v39);
      sub_211896848();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v15 = v43;
    if (v43 >> 62)
    {
      swift_bridgeObjectRetain();
      v23 = sub_211896944();
      swift_bridgeObjectRelease();
      if (v23)
        goto LABEL_6;
    }
    else if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_6:

      v6 = v37;
      goto LABEL_19;
    }
    if (qword_254AC47A0 != -1)
      swift_once();
    v24 = sub_2118966D4();
    __swift_project_value_buffer(v24, (uint64_t)qword_254AC4C90);
    swift_retain_n();
    v25 = sub_2118966BC();
    v26 = sub_2118967E8();
    v27 = os_log_type_enabled(v25, v26);
    v6 = v37;
    if (v27)
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      *(_QWORD *)&v41 = v36;
      v35 = v28;
      *(_DWORD *)v28 = 136315138;
      v34 = v28 + 4;
      sub_21188F370(&qword_254AC4A00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v29 = sub_211896968();
      *(_QWORD *)&v40[0] = sub_211891CD8(v29, v30, (uint64_t *)&v41);
      sub_211896854();
      swift_release_n();
      swift_bridgeObjectRelease();
      v31 = v35;
      _os_log_impl(&dword_21188A000, v25, v26, "No events found in directory: %s", v35, 0xCu);
      v32 = v36;
      swift_arrayDestroy();
      MEMORY[0x212BE2510](v32, -1, -1);
      MEMORY[0x212BE2510](v31, -1, -1);

    }
    else
    {

      swift_release_n();
    }
  }
  else
  {
    if (qword_254AC47A0 != -1)
      swift_once();
    v16 = sub_2118966D4();
    __swift_project_value_buffer(v16, (uint64_t)qword_254AC4C90);
    swift_retain_n();
    v17 = sub_2118966BC();
    v18 = sub_2118967F4();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      *(_QWORD *)&v41 = v20;
      v37 = v1;
      *(_DWORD *)v19 = 136315138;
      sub_21188F370(&qword_254AC4A00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
      v21 = sub_211896968();
      *(_QWORD *)&v40[0] = sub_211891CD8(v21, v22, (uint64_t *)&v41);
      sub_211896854();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21188A000, v17, v18, "Unable to reference directory: %s", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE2510](v20, -1, -1);
      MEMORY[0x212BE2510](v19, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v15 = MEMORY[0x24BEE4AF8];
  }
LABEL_19:
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v15;
}

void sub_211890AE8(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  unint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  _QWORD v47[2];
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  unint64_t v53;
  void *v54;
  void *v55;
  char v56;
  uint64_t v57;

  v5 = sub_211896650();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)v47 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v47 - v13;
  sub_211892960(a1, (uint64_t)&v55);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_9;
  v50 = v5;
  v51 = a2;
  if ((sub_211896770() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    a2 = v51;
LABEL_9:
    if (qword_254AC47A0 != -1)
      swift_once();
    v27 = sub_2118966D4();
    __swift_project_value_buffer(v27, (uint64_t)qword_254AC4C90);
    sub_211892960(a1, (uint64_t)&v55);
    v28 = sub_2118966BC();
    v29 = sub_2118967E8();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v57 = v31;
      *(_DWORD *)v30 = 136315138;
      sub_211892960((uint64_t)&v55, (uint64_t)&v54);
      if (swift_dynamicCast())
      {
        v32 = v52;
        v33 = v53;
      }
      else
      {
        v33 = 0x8000000211897E30;
        v32 = 0xD00000000000001DLL;
      }
      v54 = (void *)sub_211891CD8(v32, v33, &v57);
      sub_211896854();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v55);
      _os_log_impl(&dword_21188A000, v28, v29, "Unexpected file extension (expected .pb) from file: %s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE2510](v31, -1, -1);
      MEMORY[0x212BE2510](v30, -1, -1);
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v55);
    }

    goto LABEL_18;
  }
  sub_211896638();
  swift_bridgeObjectRelease();
  sub_211891248((uint64_t *)&v54, &v55);
  if (v2)
  {
    v15 = v54;
    if (qword_254AC47A0 != -1)
      swift_once();
    v16 = sub_2118966D4();
    __swift_project_value_buffer(v16, (uint64_t)qword_254AC4C90);
    v17 = v50;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v12, v14, v50);
    sub_21189299C(v15);
    sub_21189299C(v15);
    v18 = sub_2118966BC();
    v19 = sub_2118967F4();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = swift_slowAlloc();
      v49 = swift_slowAlloc();
      v54 = (void *)v49;
      *(_DWORD *)v20 = 136315394;
      v21 = sub_211896644();
      v55 = (void *)sub_211891CD8(v21, v22, (uint64_t *)&v54);
      sub_211896854();
      swift_bridgeObjectRelease();
      v23 = *(void (**)(char *, uint64_t))(v6 + 8);
      v23(v12, v50);
      *(_WORD *)(v20 + 12) = 2080;
      v55 = v15;
      v56 = 1;
      sub_21189299C(v15);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4AC8);
      v24 = sub_211896728();
      v55 = (void *)sub_211891CD8(v24, v25, (uint64_t *)&v54);
      v17 = v50;
      sub_211896854();
      swift_bridgeObjectRelease();
      sub_2118929A8(v15);
      sub_2118929A8(v15);
      _os_log_impl(&dword_21188A000, v18, v19, "Failed to deserialise SISchemaAnyEvent instance(s) from file=%s, result=%s", (uint8_t *)v20, 0x16u);
      v26 = v49;
      swift_arrayDestroy();
      MEMORY[0x212BE2510](v26, -1, -1);
      MEMORY[0x212BE2510](v20, -1, -1);
    }
    else
    {
      v23 = *(void (**)(char *, uint64_t))(v6 + 8);
      v23(v12, v17);
      sub_2118929A8(v15);
      sub_2118929A8(v15);
    }

    a2 = v51;
    sub_2118929A8(v15);
    v23(v14, v17);
  }
  else
  {
    v35 = v55;
    v55 = 0;
    sub_21188DD34();
    v36 = v35;
    sub_211896794();
    v34 = (uint64_t)v55;
    a2 = v51;
    if (v55)
    {
      sub_2118929A8(v35);
      sub_2118929A8(v35);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v14, v50);
      goto LABEL_19;
    }
    if (qword_254AC47A0 != -1)
      swift_once();
    v37 = sub_2118966D4();
    __swift_project_value_buffer(v37, (uint64_t)qword_254AC4C90);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v14, v50);
    v38 = sub_2118966BC();
    v39 = sub_2118967F4();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      v49 = swift_slowAlloc();
      v55 = (void *)v49;
      v48 = v40;
      *(_DWORD *)v40 = 136315138;
      v47[1] = v40 + 4;
      v41 = sub_211896644();
      v54 = (void *)sub_211891CD8(v41, v42, (uint64_t *)&v55);
      sub_211896854();
      swift_bridgeObjectRelease();
      v43 = *(void (**)(char *, uint64_t))(v6 + 8);
      v44 = v50;
      v43(v9, v50);
      v45 = v48;
      _os_log_impl(&dword_21188A000, v38, v39, "Failed to deserialise [SISchemaAnyEvent] array from file=%s)", v48, 0xCu);
      v46 = v49;
      swift_arrayDestroy();
      MEMORY[0x212BE2510](v46, -1, -1);
      MEMORY[0x212BE2510](v45, -1, -1);
    }
    else
    {
      v43 = *(void (**)(char *, uint64_t))(v6 + 8);
      v44 = v50;
      v43(v9, v50);
    }

    a2 = v51;
    sub_2118929A8(v35);
    sub_2118929A8(v35);
    v43(v14, v44);
  }
LABEL_18:
  v34 = MEMORY[0x24BEE4AF8];
LABEL_19:
  *a2 = v34;
}

id sub_211891248@<X0>(uint64_t *a1@<X1>, _QWORD *a2@<X8>)
{
  void *v4;
  uint64_t ObjCClassFromMetadata;
  void *v6;
  id v7;
  id v8;
  id result;
  id v10;
  uint64_t v11;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_self();
  sub_21188DD34();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  sub_211896644();
  v6 = (void *)sub_211896710();
  swift_bridgeObjectRelease();
  v12[0] = 0;
  v7 = objc_msgSend(v4, sel_readProtoBuffersOfClass_fromFile_error_, ObjCClassFromMetadata, v6, v12);

  v8 = v12[0];
  if (v7)
  {
    *a2 = v7;
    return v8;
  }
  else
  {
    v10 = v12[0];
    v11 = sub_211896608();

    result = (id)swift_willThrow();
    *a1 = v11;
  }
  return result;
}

uint64_t _FlatFileStore.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC26SiriPrivateLearningLogging14_FlatFileStore_path;
  v2 = sub_211896650();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t _FlatFileStore.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC26SiriPrivateLearningLogging14_FlatFileStore_path;
  v2 = sub_211896650();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_211891410(unint64_t a1)
{
  return sub_21188FAB4(a1);
}

unint64_t sub_211891430()
{
  return sub_211890510();
}

uint64_t sub_211891450(unint64_t a1)
{
  return sub_211890430(a1);
}

uint64_t sub_211891470(unint64_t a1)
{
  return sub_21189147C(a1, sub_211891564);
}

uint64_t sub_21189147C(unint64_t a1, void (*a2)(id *, uint64_t))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;

  v4 = v2;
  if (!(a1 >> 62))
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v6)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  result = sub_211896944();
  v6 = result;
  if (!result)
    return swift_bridgeObjectRelease();
LABEL_3:
  if (v6 >= 1)
  {
    v8 = 0;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x212BE20CC](v8, a1);
      else
        v9 = *(id *)(a1 + 8 * v8 + 32);
      v10 = v9;
      ++v8;
      v11 = v9;
      a2(&v11, v4);

    }
    while (v6 != v8);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_211891564(void **a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  double Current;
  id v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  id v45;
  _QWORD v46[2];
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v4 = sub_2118966B0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  v9 = sub_211891B6C(*a1);
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(v9, sel_anyEventType);

  }
  else
  {
    v11 = objc_msgSend(v8, sel_anyEventType);
  }
  v48 = a2;
  if (v11 > 0x65)
  {
    v13 = CFSTR("UNKNOWN_EVENT");
    v14 = CFSTR("UNKNOWN_EVENT");
  }
  else
  {
    v12 = 8 * (int)v11;
    v13 = *(__CFString **)((char *)&off_24CC9CC58 + v12);
    v14 = *(__CFString **)((char *)&off_24CC9CF88 + v12);
  }
  v15 = v13;
  v16 = v14;
  v17 = sub_21189671C();
  v19 = v18;

  if (qword_254AC47A8 != -1)
    swift_once();
  if (sub_21188F4E0(v11, *(_QWORD *)(qword_254AC4CA8 + 16)))
  {
    sub_2118966A4();
    sub_211896698();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    Current = CFAbsoluteTimeGetCurrent();
    v21 = objc_msgSend(v8, sel_data);
    if (v21)
    {
      v22 = v21;
      v23 = sub_211896668();
      v25 = v24;

      v26 = objc_allocWithZone(MEMORY[0x24BE0CD48]);
      v27 = (void *)sub_211896710();
      swift_bridgeObjectRelease();
      v28 = (void *)sub_21189665C();
      v29 = objc_msgSend(v26, sel_initWithUniqueId_absoluteTimestamp_eventData_, v27, v28, Current);
      sub_2118928D0(v23, v25);

      if (qword_254AC47A0 != -1)
        swift_once();
      v30 = sub_2118966D4();
      __swift_project_value_buffer(v30, (uint64_t)qword_254AC4C90);
      v31 = v29;
      swift_bridgeObjectRetain();
      v32 = sub_2118966BC();
      v33 = sub_2118967E8();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = swift_slowAlloc();
        v47 = swift_slowAlloc();
        v50 = v47;
        *(_DWORD *)v34 = 136315394;
        swift_bridgeObjectRetain();
        v49 = sub_211891CD8(v17, v19, &v50);
        sub_211896854();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v34 + 12) = 2080;
        v46[1] = v34 + 14;
        v35 = objc_msgSend(v31, sel_uniqueId);
        v36 = sub_21189671C();
        v38 = v37;

        v49 = sub_211891CD8(v36, v38, &v50);
        sub_211896854();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_21188A000, v32, v33, "Storing an event of type=%s with id=%s to Biome", (uint8_t *)v34, 0x16u);
        v39 = v47;
        swift_arrayDestroy();
        MEMORY[0x212BE2510](v39, -1, -1);
        MEMORY[0x212BE2510](v34, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v45 = objc_msgSend(*(id *)(v48 + 16), sel_source);
      objc_msgSend(v45, sel_sendEvent_, v31);

    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_254AC47A0 != -1)
      swift_once();
    v40 = sub_2118966D4();
    __swift_project_value_buffer(v40, (uint64_t)qword_254AC4C90);
    swift_bridgeObjectRetain();
    v41 = sub_2118966BC();
    v42 = sub_2118967E8();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      v44 = swift_slowAlloc();
      v50 = v44;
      *(_DWORD *)v43 = 136315138;
      swift_bridgeObjectRetain();
      v49 = sub_211891CD8(v17, v19, &v50);
      sub_211896854();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21188A000, v41, v42, "Dropping an event of type=%s: not allowed", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BE2510](v44, -1, -1);
      MEMORY[0x212BE2510](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_211891B28()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_211891B4C(unint64_t a1)
{
  return sub_211891470(a1);
}

id sub_211891B6C(void *a1)
{
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  id v6;
  id v7;

  if (objc_msgSend(a1, sel_anyEventType) != 6)
    return a1;
  v2 = objc_msgSend(a1, sel_payload);
  if (v2)
  {
    v3 = sub_211896668();
    v5 = v4;

    v2 = (id)sub_21189665C();
    sub_2118928D0(v3, v5);
  }
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B30]), sel_initWithData_, v2);

  v7 = objc_msgSend(v6, sel_event);
  return v7;
}

uint64_t sub_211891C48(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_211891C68(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_211891CD8(v6, v7, a3);
  v8 = *a1 + 8;
  sub_211896854();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_211891CD8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_211891DA8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_211892960((uint64_t)v12, *a3);
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
      sub_211892960((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_211891DA8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_211896860();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_211891F60(a5, a6);
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
  v8 = sub_21189692C();
  if (!v8)
  {
    sub_211896938();
    __break(1u);
LABEL_17:
    result = sub_21189695C();
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

uint64_t sub_211891F60(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_211891FF4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2118921CC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2118921CC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_211891FF4(uint64_t a1, unint64_t a2)
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
      v3 = sub_211892168(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_211896908();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_211896938();
      __break(1u);
LABEL_10:
      v2 = sub_211896764();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21189695C();
    __break(1u);
LABEL_14:
    result = sub_211896938();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_211892168(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4AD8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2118921CC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4AD8);
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
  result = sub_21189695C();
  __break(1u);
  return result;
}

uint64_t sub_211892318(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_211896944();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_211896944();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x212BE20D8](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_2118924D0(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_211896944();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_2118967B8();
  }
  __break(1u);
  return result;
}

uint64_t sub_2118924D0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_211896944();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_211896944();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_211892914();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4AB8);
          v12 = sub_2118926C8(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_21188DD34();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_21189695C();
  __break(1u);
  return result;
}

void (*sub_2118926C8(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_211892748(v6, a2, a3);
  return sub_21189271C;
}

void sub_21189271C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_211892748(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x212BE20CC](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_2118927B4;
  }
  __break(1u);
  return result;
}

void sub_2118927B4(id *a1)
{

}

_OWORD *sub_2118927BC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
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

uint64_t dispatch thunk of _PLSELFStore.write(events:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of _PLSELFStore.readAll()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_2118927FC()
{
  return type metadata accessor for _FlatFileStore();
}

uint64_t sub_211892804()
{
  uint64_t result;
  unint64_t v1;

  result = sub_211896650();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for _FlatFileStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static _FlatFileStore.interactionPath.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of _FlatFileStore.__allocating_init(path:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of _FlatFileStore.write(events:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of _FlatFileStore.store(events:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of _FlatFileStore.readAll()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t type metadata accessor for BiomeStore()
{
  return objc_opt_self();
}

uint64_t sub_2118928D0(uint64_t a1, unint64_t a2)
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

unint64_t sub_211892914()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254AC4AC0;
  if (!qword_254AC4AC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254AC4AB8);
    result = MEMORY[0x212BE2498](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254AC4AC0);
  }
  return result;
}

uint64_t sub_211892960(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_21189299C(id a1)
{
  return a1;
}

void sub_2118929A8(id a1)
{

}

uint64_t sub_2118929B4(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_21189674C();
    return sub_21189677C();
  }
  return result;
}

uint64_t sub_211892A40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

void sub_211892A48(uint64_t a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a2 + 16;
  if (qword_254AC4798 != -1)
    swift_once();
  v7 = sub_2118966D4();
  __swift_project_value_buffer(v7, (uint64_t)qword_254AC4C78);
  v8 = sub_2118966BC();
  v9 = sub_2118967E8();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v10 = 67109120;
    sub_211896854();
    _os_log_impl(&dword_21188A000, v8, v9, a4, v10, 8u);
    MEMORY[0x212BE2510](v10, -1, -1);
  }

  swift_beginAccess();
  v11 = MEMORY[0x212BE254C](v6);
  if (v11)
  {
    v12 = (void *)v11;
    swift_beginAccess();
    v13 = (void *)MEMORY[0x212BE254C](a3 + 16);
    sub_211892E60(v13);

  }
}

uint64_t sub_211892C10(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  char *v14;
  id v15;
  _QWORD v17[2];
  _QWORD aBlock[6];

  v3 = sub_2118966E0();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_211896704();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = *(_QWORD *)&v1[OBJC_IVAR____TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate_queue];
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v1;
  *(_QWORD *)(v12 + 24) = a1;
  aBlock[4] = sub_21189598C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21188E9E0;
  aBlock[3] = &block_descriptor_14;
  v13 = _Block_copy(aBlock);
  v14 = v1;
  v15 = a1;
  sub_2118966F8();
  v17[1] = MEMORY[0x24BEE4AF8];
  sub_21188F370(&qword_254AC49A0, v4, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AC49A8);
  sub_21188F3B0((unint64_t *)&unk_254AC49B0, &qword_254AC49A8);
  sub_211896878();
  MEMORY[0x212BE1FD0](0, v11, v7, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

void sub_211892DFC(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  swift_beginAccess();
  sub_211893858(&v4, a2);
  v3 = v4;
  swift_endAccess();

}

uint64_t sub_211892E60(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_2118966E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_211896704();
  result = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v25 = v10;
    v26 = result;
    v13 = qword_254AC4798;
    v14 = a1;
    if (v13 != -1)
      swift_once();
    v15 = sub_2118966D4();
    __swift_project_value_buffer(v15, (uint64_t)qword_254AC4C78);
    v16 = v14;
    v17 = sub_2118966BC();
    v18 = sub_2118967E8();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v24 = v7;
      *(_DWORD *)v19 = 67109120;
      LODWORD(aBlock[0]) = objc_msgSend(v16, sel_processIdentifier);
      v7 = v24;
      sub_211896854();

      _os_log_impl(&dword_21188A000, v17, v18, "Removing connection (pid=%d)", v19, 8u);
      MEMORY[0x212BE2510](v19, -1, -1);

    }
    else
    {

    }
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = v2;
    *(_QWORD *)(v20 + 24) = v16;
    aBlock[4] = sub_211895958;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21188E9E0;
    aBlock[3] = &block_descriptor_8;
    v21 = _Block_copy(aBlock);
    v22 = v16;
    v23 = v2;
    sub_2118966F8();
    v27 = MEMORY[0x24BEE4AF8];
    sub_21188F370(&qword_254AC49A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AC49A8);
    sub_21188F3B0((unint64_t *)&unk_254AC49B0, &qword_254AC49A8);
    sub_211896878();
    MEMORY[0x212BE1FD0](0, v12, v7, v21);
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v26);
    return swift_release();
  }
  return result;
}

void sub_211893184(uint64_t a1, void *a2)
{
  void *v3;

  swift_beginAccess();
  v3 = (void *)sub_211894D48(a2);
  swift_endAccess();

}

id sub_21189320C()
{
  return sub_21189337C(type metadata accessor for PLLoggingServiceListenerDelegate);
}

id sub_211893250()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PLLoggingServiceDefaultHandler()), sel_init);
  qword_254AC4CB0 = (uint64_t)result;
  return result;
}

id sub_211893370()
{
  return sub_21189337C(type metadata accessor for PLLoggingServiceDefaultHandler);
}

id sub_21189337C(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id sub_2118933B0()
{
  id result;

  result = sub_2118933CC();
  qword_254AC4AE0 = (uint64_t)result;
  return result;
}

id sub_2118933CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  char *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v19;
  objc_super v20;
  uint64_t v21;

  v0 = sub_21189680C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_211896800();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_211896704();
  MEMORY[0x24BDAC7A8](v6);
  sub_21188F338(0, (unint64_t *)&qword_254AC4BC0);
  sub_2118966EC();
  v21 = MEMORY[0x24BEE4AF8];
  sub_21188F370((unint64_t *)&unk_254AC49E0, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4BD0);
  sub_21188F3B0((unint64_t *)&unk_254AC49F0, &qword_254AC4BD0);
  sub_211896878();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  v7 = (void *)sub_211896824();
  sub_21189671C();
  v8 = objc_allocWithZone(MEMORY[0x24BDD1998]);
  v9 = (void *)sub_211896710();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v8, sel_initWithMachServiceName_, v9);

  v11 = (objc_class *)type metadata accessor for PLLoggingServiceListenerDelegate();
  v12 = objc_allocWithZone(v11);
  v13 = v7;
  v14 = (char *)v12;
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_211896944())
    sub_211895A34(MEMORY[0x24BEE4AF8]);
  else
    v15 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v14[OBJC_IVAR____TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate_connections] = v15;
  *(_QWORD *)&v14[OBJC_IVAR____TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate_queue] = v13;
  v16 = v13;

  v20.receiver = v14;
  v20.super_class = v11;
  v17 = objc_msgSendSuper2(&v20, sel_init);

  return sub_211895254(v10, v17, v16);
}

id static PLLoggingServiceListener.sharedInstance.getter()
{
  if (qword_254AC47D0 != -1)
    swift_once();
  return (id)qword_254AC4AE0;
}

uint64_t type metadata accessor for PLLoggingServiceListenerDelegate()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for PLLoggingServiceDefaultHandler()
{
  return objc_opt_self();
}

uint64_t sub_211893758(_DWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;

  v3 = v2;
  v6 = *v2;
  v7 = MEMORY[0x212BE2144](*(_QWORD *)(v6 + 40), a2, 4);
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    sub_211894288(a2, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v14;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(v6 + 48);
  if (*(_DWORD *)(v10 + 4 * v9) != (_DWORD)a2)
  {
    v11 = ~v8;
    do
    {
      v9 = (v9 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_DWORD *)(v10 + 4 * v9) != (_DWORD)a2);
  }
  result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_211893858(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_2118968B4();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_21188F338(0, &qword_254AC4BA8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_2118968A8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_211893AF4(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_211893F6C();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_211894208((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_211896830();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_21188F338(0, &qword_254AC4BA8);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_21189683C();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_21189683C();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_2118943AC((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_211893AF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4BB0);
    v2 = sub_2118968F0();
    v14 = v2;
    sub_21189689C();
    if (sub_2118968C0())
    {
      sub_21188F338(0, &qword_254AC4BA8);
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_211893F6C();
          v2 = v14;
        }
        result = sub_211896830();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_2118968C0());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_211893CE8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4BB8);
  result = sub_2118968E4();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (uint64_t *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    v26 = -1 << v7;
    v27 = v1;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v28 = 1 << *(_BYTE *)(v2 + 32);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                if (v28 >= 64)
                  bzero((void *)(v2 + 56), 8 * v10);
                else
                  *v6 = v26;
                v1 = v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v14);
      result = MEMORY[0x212BE2144](*(_QWORD *)(v4 + 40), v18, 4);
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_211893F6C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4BB0);
  v3 = sub_2118968E4();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_211896830();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_211894208(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_211896830();
  result = sub_211896890();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_211894288(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  unsigned int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_211893CE8();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_211894530();
      goto LABEL_14;
    }
    sub_21189486C();
  }
  v8 = *v3;
  result = MEMORY[0x212BE2144](*(_QWORD *)(*v3 + 40), v5, 4);
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_DWORD *)(v10 + 4 * a2) == v5)
    {
LABEL_13:
      result = sub_211896980();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_DWORD *)(v10 + 4 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_DWORD *)(*(_QWORD *)(v12 + 48) + 4 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

void sub_2118943AC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_211893F6C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_2118946C4();
      goto LABEL_14;
    }
    sub_211894AD0();
  }
  v8 = *v3;
  v9 = sub_211896830();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_21188F338(0, &qword_254AC4BA8);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_21189683C();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_211896980();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_21189683C();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

void *sub_211894530()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4BB8);
  v2 = *v0;
  v3 = sub_2118968D8();
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * v15) = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_2118946C4()
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4BB0);
  v2 = *v0;
  v3 = sub_2118968D8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_21189486C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4BB8);
  result = sub_2118968E4();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v26 = v1;
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v14);
    result = MEMORY[0x212BE2144](*(_QWORD *)(v4 + 40), v18, 4);
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_DWORD *)(*(_QWORD *)(v4 + 48) + 4 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v26;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_211894AD0()
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
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4BB0);
  v3 = sub_2118968E4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_211896830();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_211894D48(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v18;

  v3 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v4 = a1;
    v5 = sub_2118968CC();

    if ((v5 & 1) != 0)
    {
      v6 = sub_211894F1C();
      swift_bridgeObjectRelease();
      return v6;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  v7 = sub_211896830();
  v8 = -1 << *(_BYTE *)(v3 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
    goto LABEL_12;
  sub_21188F338(0, &qword_254AC4BA8);
  v10 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v9);
  v11 = sub_21189683C();

  if ((v11 & 1) == 0)
  {
    v12 = ~v8;
    do
    {
      v9 = (v9 + 1) & v12;
      if (((*(_QWORD *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_12;
      v13 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v9);
      v14 = sub_21189683C();

    }
    while ((v14 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v16 = *v1;
  v18 = *v1;
  *v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_2118946C4();
    v16 = v18;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * v9);
  sub_2118950B4(v9);
  *v1 = v18;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_211894F1C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  char v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v1 = v0;
  swift_bridgeObjectRelease();
  v2 = sub_2118968A8();
  v3 = swift_unknownObjectRetain();
  v4 = sub_211893AF4(v3, v2);
  v15 = v4;
  swift_retain();
  v5 = sub_211896830();
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = v5 & ~v6;
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    sub_21188F338(0, &qword_254AC4BA8);
    v8 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v7);
    v9 = sub_21189683C();

    if ((v9 & 1) != 0)
    {
LABEL_6:
      swift_release();
      v13 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v7);
      sub_2118950B4(v7);
      if ((sub_21189683C() & 1) != 0)
      {
        *v1 = v15;
        return v13;
      }
      __break(1u);
    }
    else
    {
      v10 = ~v6;
      while (1)
      {
        v7 = (v7 + 1) & v10;
        if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
          break;
        v11 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v7);
        v12 = sub_21189683C();

        if ((v12 & 1) != 0)
          goto LABEL_6;
      }
    }
    swift_release();
    __break(1u);
  }
  result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_2118950B4(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_211896884();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v6);
        v11 = sub_211896830();

        v12 = v11 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = *(_QWORD *)(v3 + 48);
            v16 = (_QWORD *)(v15 + 8 * v2);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v2 != v6 || (v2 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v18 = *(_QWORD *)(v3 + 16);
  v19 = __OFSUB__(v18, 1);
  v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

id sub_211895254(void *a1, void *a2, void *a3)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;

  if (qword_254AC4798 != -1)
    swift_once();
  v6 = sub_2118966D4();
  __swift_project_value_buffer(v6, (uint64_t)qword_254AC4C78);
  v7 = sub_2118966BC();
  v8 = sub_2118967DC();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21188A000, v7, v8, "Initializing PLLoggingServiceListener", v9, 2u);
    MEMORY[0x212BE2510](v9, -1, -1);
  }

  v10 = objc_msgSend(objc_allocWithZone((Class)PLLoggingServiceListener), sel_init);
  objc_msgSend(v10, sel_setDelegate_, a2);
  objc_msgSend(v10, sel_setListener_, a1);
  v11 = objc_msgSend(v10, sel_listener);
  objc_msgSend(v11, sel__setQueue_, a3);

  v12 = objc_msgSend(v10, sel_listener);
  objc_msgSend(v12, sel_setDelegate_, objc_msgSend(v10, sel_delegate));

  swift_unknownObjectRelease();
  v13 = objc_msgSend(v10, sel_listener);

  objc_msgSend(v13, sel_resume);
  v14 = sub_2118966BC();
  v15 = sub_2118967DC();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_21188A000, v14, v15, "Started PLLoggingServiceListener", v16, 2u);
    MEMORY[0x212BE2510](v16, -1, -1);
  }

  return v10;
}

uint64_t sub_2118954B4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  void (*v24)();
  uint64_t v25;

  v2 = v1;
  v4 = objc_msgSend(a1, sel_processIdentifier);
  if (qword_254AC4798 != -1)
    swift_once();
  v5 = sub_2118966D4();
  __swift_project_value_buffer(v5, (uint64_t)qword_254AC4C78);
  v6 = sub_2118966BC();
  v7 = sub_2118967DC();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v8 = 67109120;
    LODWORD(v20) = v4;
    sub_211896854();
    _os_log_impl(&dword_21188A000, v6, v7, "PLLoggingService connection request received (pid=%d)", v8, 8u);
    MEMORY[0x212BE2510](v8, -1, -1);
  }

  if (qword_254AC47C8 != -1)
    swift_once();
  objc_msgSend(a1, sel_setExportedObject_, qword_254AC4CB0, v20);
  v9 = PLLoggingXPCServiceInterface();
  objc_msgSend(a1, sel_setExportedInterface_, v9);

  v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = swift_allocObject();
  *(_DWORD *)(v12 + 16) = v4;
  *(_QWORD *)(v12 + 24) = v10;
  *(_QWORD *)(v12 + 32) = v11;
  v24 = sub_2118959BC;
  v25 = v12;
  v13 = MEMORY[0x24BDAC760];
  v20 = MEMORY[0x24BDAC760];
  v21 = 1107296256;
  v22 = sub_21188E9E0;
  v23 = &block_descriptor_26;
  v14 = _Block_copy(&v20);
  swift_release();
  objc_msgSend(a1, sel_setInvalidationHandler_, v14);
  _Block_release(v14);
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v17 = swift_allocObject();
  *(_DWORD *)(v17 + 16) = v4;
  *(_QWORD *)(v17 + 24) = v15;
  *(_QWORD *)(v17 + 32) = v16;
  v24 = sub_211895A10;
  v25 = v17;
  v20 = v13;
  v21 = 1107296256;
  v22 = sub_21188E9E0;
  v23 = &block_descriptor_34;
  v18 = _Block_copy(&v20);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v18);
  _Block_release(v18);
  objc_msgSend(a1, sel__setQueue_, *(_QWORD *)(v2 + OBJC_IVAR____TtC26SiriPrivateLearningLogging32PLLoggingServiceListenerDelegate_queue));
  sub_211892C10(a1);
  objc_msgSend(a1, sel_resume);
  return 1;
}

void sub_211895804(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  _QWORD v7[6];

  if (qword_254AC47B8 != -1)
    swift_once();
  v5 = (void *)qword_254AC4990;
  sub_21188F338(0, (unint64_t *)&qword_254AC4998);
  v6 = (void *)sub_211896788();
  if (a2)
  {
    v7[4] = a2;
    v7[5] = a3;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 1107296256;
    v7[2] = sub_21188E9E0;
    v7[3] = &block_descriptor_0;
    a2 = _Block_copy(v7);
    swift_retain();
    swift_release();
  }
  objc_msgSend(v5, sel_storeInstrumentationWithEvents_completion_, v6, a2);
  _Block_release(a2);

}

uint64_t sub_211895910()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_211895934()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
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

void sub_211895958()
{
  uint64_t v0;

  sub_211893184(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_211895960()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_21189598C()
{
  uint64_t v0;

  sub_211892DFC(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_211895994()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_2118959BC()
{
  uint64_t v0;

  sub_211892A48(*(unsigned int *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), "Connection from %d was invalidated");
}

uint64_t objectdestroy_22Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_211895A10()
{
  uint64_t v0;

  sub_211892A48(*(unsigned int *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), "Connection from %d was interrupted");
}

void sub_211895A34(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_211896944();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4BB0);
      v3 = sub_2118968FC();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_211896944();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v42 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v40 = v1;
    while (1)
    {
      while (1)
      {
        v8 = MEMORY[0x212BE20CC](v7, v1);
        v9 = __OFADD__(v7++, 1);
        if (v9)
        {
          __break(1u);
          goto LABEL_36;
        }
        v10 = v8;
        v11 = sub_211896830();
        v12 = -1 << *(_BYTE *)(v3 + 32);
        v13 = v11 & ~v12;
        v14 = v13 >> 6;
        v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
        v16 = 1 << v13;
        if (((1 << v13) & v15) != 0)
          break;
LABEL_20:
        *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
        *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
        v22 = *(_QWORD *)(v3 + 16);
        v9 = __OFADD__(v22, 1);
        v23 = v22 + 1;
        if (v9)
          goto LABEL_37;
        *(_QWORD *)(v3 + 16) = v23;
        if (v7 == v4)
          return;
      }
      sub_21188F338(0, &qword_254AC4BA8);
      v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
      v18 = sub_21189683C();

      if ((v18 & 1) == 0)
      {
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_21189683C();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v40;
        v4 = v42;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      v1 = v40;
      v4 = v42;
      if (v7 == v42)
        return;
    }
  }
  v24 = 0;
  v39 = v1 + 32;
  v41 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v41)
  {
    v25 = *(id *)(v39 + 8 * v24);
    v26 = sub_211896830();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_21188F338(0, &qword_254AC4BA8);
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_21189683C();

      if ((v33 & 1) != 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v34 = ~v27;
      while (1)
      {
        v28 = (v28 + 1) & v34;
        v29 = v28 >> 6;
        v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
        v31 = 1 << v28;
        if ((v30 & (1 << v28)) == 0)
          break;
        v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
        v36 = sub_21189683C();

        if ((v36 & 1) != 0)
          goto LABEL_24;
      }
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_38;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v42)
      return;
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_211895DB8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v4 = v3;
  v8 = sub_2118966E0();
  v27 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_211896704();
  v25 = *(_QWORD *)(v11 - 8);
  v26 = v11;
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254AC47A0 != -1)
    swift_once();
  v14 = sub_2118966D4();
  __swift_project_value_buffer(v14, (uint64_t)qword_254AC4C90);
  swift_bridgeObjectRetain_n();
  v15 = sub_2118966BC();
  v16 = sub_2118967E8();
  if (os_log_type_enabled(v15, v16))
  {
    v24 = a3;
    v17 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v17 = 134217984;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      v18 = sub_211896944();
      swift_bridgeObjectRelease();
    }
    else
    {
      v18 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    aBlock[0] = v18;
    sub_211896854();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21188A000, v15, v16, "Received %ld new SISChemaAnyEvent event(s)", v17, 0xCu);
    MEMORY[0x212BE2510](v17, -1, -1);

    a3 = v24;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = v4;
  v19[3] = a1;
  v19[4] = a2;
  v19[5] = a3;
  aBlock[4] = sub_211896540;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21188E9E0;
  aBlock[3] = &block_descriptor_1;
  v20 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  v21 = v4;
  sub_21188F088(a2);
  sub_2118966F8();
  v28 = MEMORY[0x24BEE4AF8];
  sub_21188F370(&qword_254AC49A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AC49A8);
  sub_21188F3B0((unint64_t *)&unk_254AC49B0, &qword_254AC49A8);
  sub_211896878();
  MEMORY[0x212BE1FD0](0, v13, v10, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v8);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
  return swift_release();
}

uint64_t sub_211896108(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v5 = (_QWORD *)(a1 + OBJC_IVAR____TtC26SiriPrivateLearningLogging25PLLoggingServiceStoreBase_store);
  v6 = v5[3];
  v7 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v6);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 8))(a2, v6, v7);
  if (a3)
    return a3(result);
  return result;
}

id sub_2118961A8()
{
  return sub_21189337C(type metadata accessor for PLLoggingServiceStoreBase);
}

uint64_t type metadata accessor for PLLoggingServiceStoreBase()
{
  return objc_opt_self();
}

id sub_21189620C()
{
  id result;

  result = sub_211896228();
  qword_254AC4CB8 = (uint64_t)result;
  return result;
}

id sub_211896228()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  _BYTE v12[40];
  _QWORD v13[5];

  v10 = sub_21189680C();
  v0 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_211896800();
  MEMORY[0x24BDAC7A8]();
  sub_211896704();
  MEMORY[0x24BDAC7A8]();
  if (qword_253EF9420 != -1)
    swift_once();
  v3 = qword_253EF9418;
  sub_211896588();
  sub_2118966F8();
  v13[0] = MEMORY[0x24BEE4AF8];
  sub_21188F370((unint64_t *)&unk_254AC49E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254AC4BD0);
  sub_21188F3B0((unint64_t *)&unk_254AC49F0, &qword_254AC4BD0);
  sub_211896878();
  (*(void (**)(char *, _QWORD, uint64_t))(v0 + 104))(v2, *MEMORY[0x24BEE5750], v10);
  v4 = sub_211896824();
  v13[3] = type metadata accessor for _FlatFileStore();
  v13[4] = &protocol witness table for _FlatFileStore;
  v13[0] = v3;
  v5 = (char *)objc_allocWithZone((Class)type metadata accessor for PLLoggingServiceFlatFileStore());
  sub_2118965C4((uint64_t)v13, (uint64_t)v12);
  *(_QWORD *)&v5[OBJC_IVAR____TtC26SiriPrivateLearningLogging25PLLoggingServiceStoreBase_queue] = v4;
  sub_2118965C4((uint64_t)v12, (uint64_t)&v5[OBJC_IVAR____TtC26SiriPrivateLearningLogging25PLLoggingServiceStoreBase_store]);
  v6 = (objc_class *)type metadata accessor for PLLoggingServiceStoreBase();
  v11.receiver = v5;
  v11.super_class = v6;
  swift_retain_n();
  v7 = objc_msgSendSuper2(&v11, sel_init);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  swift_release();
  return v7;
}

id sub_2118964A4()
{
  return sub_21189337C(type metadata accessor for PLLoggingServiceFlatFileStore);
}

uint64_t type metadata accessor for PLLoggingServiceFlatFileStore()
{
  return objc_opt_self();
}

id sub_2118964D4()
{
  return sub_21189337C(type metadata accessor for PLLoggingServiceBiomeStore);
}

uint64_t type metadata accessor for PLLoggingServiceBiomeStore()
{
  return objc_opt_self();
}

uint64_t sub_211896504()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 32))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_211896540()
{
  uint64_t v0;

  return sub_211896108(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t (**)(uint64_t))(v0 + 32));
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

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_211896588()
{
  unint64_t result;

  result = qword_254AC4BC0;
  if (!qword_254AC4BC0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254AC4BC0);
  }
  return result;
}

uint64_t sub_2118965C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_211896608()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_211896614()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_211896620()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_21189662C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_211896638()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_211896644()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_211896650()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21189665C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_211896668()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_211896674()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_211896680()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21189668C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_211896698()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2118966A4()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2118966B0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2118966BC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2118966C8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2118966D4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2118966E0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2118966EC()
{
  return MEMORY[0x24BEE54C0]();
}

uint64_t sub_2118966F8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_211896704()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_211896710()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21189671C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_211896728()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_211896734()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_211896740()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21189674C()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_211896758()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_211896764()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_211896770()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_21189677C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_211896788()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_211896794()
{
  return MEMORY[0x24BDCFBC0]();
}

uint64_t sub_2118967A0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2118967AC()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_2118967B8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2118967C4()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2118967D0()
{
  return MEMORY[0x24BDCFE18]();
}

uint64_t sub_2118967DC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2118967E8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2118967F4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_211896800()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21189680C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_211896818()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_211896824()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_211896830()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_21189683C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_211896848()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_211896854()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_211896860()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21189686C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_211896878()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_211896884()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_211896890()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_21189689C()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2118968A8()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_2118968B4()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_2118968C0()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_2118968CC()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_2118968D8()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2118968E4()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2118968F0()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_2118968FC()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_211896908()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_211896914()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_211896920()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_21189692C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_211896938()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_211896944()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_211896950()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21189695C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_211896968()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_211896974()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_211896980()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21189698C()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_211896998()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2118969A4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2118969B0()
{
  return MEMORY[0x24BEE4328]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

