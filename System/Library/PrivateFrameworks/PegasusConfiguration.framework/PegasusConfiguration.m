uint64_t getEnumTagSinglePayload for UserAgent(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 64))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserAgent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserAgent()
{
  return &type metadata for UserAgent;
}

ValueMetadata *type metadata accessor for Client()
{
  return &type metadata for Client;
}

ValueMetadata *type metadata accessor for SessionType()
{
  return &type metadata for SessionType;
}

uint64_t destroy for Client()
{
  return swift_bridgeObjectRelease();
}

unint64_t destroy for SessionType(uint64_t a1)
{
  unint64_t result;
  int v2;

  result = *(_QWORD *)(a1 + 8);
  v2 = -1;
  if (result < 0xFFFFFFFF)
    v2 = result;
  if ((v2 + 1) <= 1)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t Client.type.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void sub_1AF20527C(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_1AF20749C(a1, *v1);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for Requestor()
{
  return &type metadata for Requestor;
}

uint64_t sub_1AF2052A8(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  LODWORD(v4) = -1;
  if (v3 < 0xFFFFFFFF)
    v4 = *(_QWORD *)(a2 + 8);
  if ((v4 + 1) > 1)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t UserAgent.client.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)v1;
  *(_QWORD *)(a1 + 16) = v2;
  return swift_bridgeObjectRetain();
}

_BYTE *sub_1AF205314(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

uint64_t PegasusClientName.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1AF205354 + 4 * byte_1AF242AAD[*v0]))(0xD000000000000012, 0x80000001AF245EA0);
}

uint64_t sub_1AF205354()
{
  return 0x6E776F6E6B6E55;
}

uint64_t sub_1AF20536C()
{
  return 0x697261666173;
}

uint64_t sub_1AF205380()
{
  return 0x6867696C746F7073;
}

uint64_t sub_1AF2053A0()
{
  return 1769105779;
}

uint64_t sub_1AF2053B0()
{
  return 0x70756B6F6F6CLL;
}

uint64_t sub_1AF2053C4()
{
  return 0x736567617373656DLL;
}

uint64_t sub_1AF2053DC()
{
  return 1937204590;
}

uint64_t sub_1AF2053EC()
{
  return 0x64636573726170;
}

uint64_t sub_1AF205404()
{
  return 0x745F636573726170;
}

uint64_t sub_1AF205424()
{
  return 0x6767757365726F63;
}

uint64_t sub_1AF205478()
{
  return 1818845549;
}

uint64_t sub_1AF205488()
{
  return 0x6F72657473797274;
}

uint64_t sub_1AF2054A0()
{
  return 0x6570786574657564;
}

uint64_t sub_1AF2054C0@<X0>(uint64_t a1@<X8>)
{
  return a1 - 5;
}

uint64_t sub_1AF205588()
{
  return 0x6361666B636F6C63;
}

uint64_t sub_1AF2055A4()
{
  return 0x657370756B6F6F6CLL;
}

unint64_t sub_1AF2055C4()
{
  return 0xD000000000000015;
}

void NSFileManager.parsecdAssetsDirectoryURL.getter(uint64_t a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void (*v14)(void *, _BYTE *, uint64_t);
  void (*v15)(_BYTE *, uint64_t);
  uint64_t v16;
  id v17;
  void *v18;
  _BYTE v19[16];
  id v20[2];

  v20[1] = *(id *)MEMORY[0x1E0C80C00];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  OUTLINED_FUNCTION_10();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  OUTLINED_FUNCTION_4_2();
  sub_1AF240E2C();
  OUTLINED_FUNCTION_2_4();
  v5 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v5);
  v9 = &v19[-v8];
  v20[0] = 0;
  v10 = objc_msgSend(v1, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 13, 1, 0, 0, v20);
  v11 = v20[0];
  if (!v10)
  {
    v17 = v20[0];
    v18 = (void *)sub_1AF240D6C();

    swift_willThrow();
    OUTLINED_FUNCTION_37((uint64_t)v1, 1);
    goto LABEL_5;
  }
  v12 = v10;
  sub_1AF240DD8();
  v13 = v11;

  v14 = *(void (**)(void *, _BYTE *, uint64_t))(v3 + 32);
  v14(v1, v7, v2);
  OUTLINED_FUNCTION_37((uint64_t)v1, 0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v1, 1, v2) == 1)
  {
LABEL_5:
    sub_1AF209738((uint64_t)v1, (uint64_t *)&unk_1ED32FF80);
    v16 = 1;
    goto LABEL_6;
  }
  v14(v9, v1, v2);
  sub_1AF240DB4();
  sub_1AF240D78();
  v15 = *(void (**)(_BYTE *, uint64_t))(v3 + 8);
  v15(v7, v2);
  v15(v9, v2);
  v16 = 0;
LABEL_6:
  OUTLINED_FUNCTION_37(a1, v16);
  OUTLINED_FUNCTION_12();
}

uint64_t dispatch thunk of ConfigAccessProvider.hasPendingTasks.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_1AF2057F4(uint64_t a1, uint64_t a2)
{
  return sub_1AF206B5C(a1, a2, FeedbackStreamDescriptor.rawValue.getter);
}

uint64_t static UserAgent.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return (*(_QWORD *)a1 == *(_QWORD *)a2) & (*(unsigned __int8 *)(a1 + 24) ^ *(unsigned __int8 *)(a2 + 24) ^ 1u);
}

uint64_t static Client.parsecd.getter@<X0>(uint64_t a1@<X8>)
{
  return OUTLINED_FUNCTION_4_12(&qword_1ED32EAB8, (uint64_t)&xmmword_1ED32EA98, a1);
}

uint64_t sub_1AF205848(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1AF2057F4(*a1, *a2);
}

uint64_t sub_1AF205854(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t dispatch thunk of ConfigAccessProvider.currentConfig.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for PegasusClientName()
{
  return &type metadata for PegasusClientName;
}

uint64_t NSFileManager.parsecdCustomFBDirectoryURL.getter()
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
  char *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  char v14[16];

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_5_2();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v6);
  v7 = OUTLINED_FUNCTION_0_5();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = &v14[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  NSFileManager.parsecdAssetsDirectoryURL.getter(v3);
  if (__swift_getEnumTagSinglePayload(v3, 1, v7) == 1)
  {
    sub_1AF209738(v3, (uint64_t *)&unk_1ED32FF80);
    v11 = 1;
  }
  else
  {
    strcpy(v14, "CustomFeedback");
    v14[15] = -18;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v2, *MEMORY[0x1E0CAFD60], v1);
    sub_1AF208AB8();
    sub_1AF240E14();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v1);
    swift_bridgeObjectRelease();
    v12 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v12(v3, v7);
    sub_1AF240D78();
    v12((uint64_t)v10, v7);
    v11 = 0;
  }
  return __swift_storeEnumTagSinglePayload(v0, v11, 1, v7);
}

void type metadata accessor for ShouldThrottleConfigFetchResult()
{
  OUTLINED_FUNCTION_103();
}

id BiomeStreamConfig.storeConfig.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 32);
}

uint64_t ConfigurationManager.configuration(for:forceFetch:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 336) = a2;
  *(_QWORD *)(v3 + 224) = a1;
  *(_QWORD *)(v3 + 232) = v2;
  return swift_task_switch();
}

void OUTLINED_FUNCTION_48()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 208) = *(_QWORD *)(*(_QWORD *)(v0 + 144) + 200);
  sub_1AF20C338();
}

uint64_t OUTLINED_FUNCTION_48_0(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_19()
{
  return sub_1AF2411B0();
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19_0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = v1;
  *(_QWORD *)(v2 - 128) = result;
  return result;
}

unint64_t OUTLINED_FUNCTION_19_1()
{
  return 0xD000000000000018;
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return sub_1AF2410F0();
}

uint64_t OUTLINED_FUNCTION_19_4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_19_5(uint64_t a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  return sub_1AF21F5B0((uint64_t)va);
}

uint64_t sub_1AF205AF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1AF205B2C()
{
  uint64_t v0;

  sub_1AF205B50(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1AF205B50(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

void *static FeedbackStreamDescriptor.allCases.getter()
{
  return &unk_1E5F3B360;
}

uint64_t sub_1AF205B84()
{
  uint64_t v0;

  MEMORY[0x1AF45A8C4](*(_QWORD *)(v0 + 16), -1, -1);
  return swift_deallocClassInstance();
}

uint64_t Client.init(_:)@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  unint64_t v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  if (a1)
  {
    v3 = sub_1AF2412B8();
    v5 = v4;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_13();
    sub_1AF208AB8();
    if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
    {
      OUTLINED_FUNCTION_72();
      v6 = 24;
      v7 = 21;
    }
    else
    {
      OUTLINED_FUNCTION_3_13();
      if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
      {
        OUTLINED_FUNCTION_72();
        v7 = 1;
        v6 = 1;
      }
      else
      {
        OUTLINED_FUNCTION_3_13();
        if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
        {
          OUTLINED_FUNCTION_72();
          v7 = 2;
          v6 = 2;
        }
        else
        {
          OUTLINED_FUNCTION_3_13();
          if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
          {
            OUTLINED_FUNCTION_72();
            v7 = 3;
            v6 = 3;
          }
          else
          {
            v17 = sub_1AF2412B8();
            v18 = v10;
            v11 = OUTLINED_FUNCTION_0_14();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
            {
              OUTLINED_FUNCTION_72();
              v6 = 26;
              v7 = 23;
            }
            else
            {
              OUTLINED_FUNCTION_3_13();
              if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
              {
                OUTLINED_FUNCTION_72();
                v7 = 4;
                v6 = 4;
              }
              else
              {
                OUTLINED_FUNCTION_3_13();
                if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                {
                  OUTLINED_FUNCTION_72();
                  v7 = 5;
                  v6 = 5;
                }
                else
                {
                  OUTLINED_FUNCTION_3_13();
                  if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                  {
                    OUTLINED_FUNCTION_72();
                    v7 = 6;
                    v6 = 6;
                  }
                  else
                  {
                    OUTLINED_FUNCTION_3_13();
                    if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                    {
                      OUTLINED_FUNCTION_72();
                      v7 = 8;
                      v6 = 8;
                    }
                    else
                    {
                      OUTLINED_FUNCTION_3_13();
                      if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                      {
                        OUTLINED_FUNCTION_72();
                        v7 = 9;
                        v6 = 9;
                      }
                      else
                      {
                        OUTLINED_FUNCTION_3_13();
                        if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                        {
                          OUTLINED_FUNCTION_72();
                          v7 = 10;
                          v6 = 10;
                        }
                        else
                        {
                          OUTLINED_FUNCTION_3_13();
                          if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                          {
                            OUTLINED_FUNCTION_72();
                            v7 = 12;
                            v6 = 12;
                          }
                          else
                          {
                            OUTLINED_FUNCTION_3_13();
                            if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                            {
                              OUTLINED_FUNCTION_72();
                              v7 = 13;
                              v6 = 13;
                            }
                            else
                            {
                              OUTLINED_FUNCTION_3_13();
                              if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                              {
                                OUTLINED_FUNCTION_72();
                                v6 = 15;
                                v7 = 14;
                              }
                              else
                              {
                                OUTLINED_FUNCTION_3_13();
                                if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                                {
                                  OUTLINED_FUNCTION_72();
                                  v6 = 14;
                                  v7 = 15;
                                }
                                else
                                {
                                  OUTLINED_FUNCTION_3_13();
                                  if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                                  {
                                    OUTLINED_FUNCTION_72();
                                    v6 = 20;
                                    v7 = 18;
                                  }
                                  else
                                  {
                                    OUTLINED_FUNCTION_3_13();
                                    if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                                    {
                                      OUTLINED_FUNCTION_72();
                                      v6 = 21;
                                      v7 = 17;
                                    }
                                    else
                                    {
                                      OUTLINED_FUNCTION_8_8();
                                      if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                                      {
                                        OUTLINED_FUNCTION_72();
                                        v6 = 27;
                                        v7 = 24;
                                      }
                                      else
                                      {
                                        OUTLINED_FUNCTION_8_8();
                                        if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                                        {
                                          OUTLINED_FUNCTION_72();
                                          v6 = 28;
                                          v7 = 25;
                                        }
                                        else
                                        {
                                          v17 = v3;
                                          v18 = v5;
                                          if ((OUTLINED_FUNCTION_1_14() & 1) != 0)
                                          {
                                            OUTLINED_FUNCTION_72();
                                            v7 = 7;
                                            v6 = 7;
                                          }
                                          else
                                          {
                                            v17 = v3;
                                            v18 = v5;
                                            if ((OUTLINED_FUNCTION_1_14() & 1) != 0)
                                            {
                                              OUTLINED_FUNCTION_72();
                                              v6 = 19;
                                              v7 = 16;
                                            }
                                            else
                                            {
                                              if (qword_1ED32EC10 != -1)
                                                swift_once();
                                              v12 = sub_1AF2411B0();
                                              __swift_project_value_buffer(v12, (uint64_t)qword_1ED330210);
                                              OUTLINED_FUNCTION_6_9();
                                              v13 = sub_1AF241198();
                                              v14 = sub_1AF2414B0();
                                              if (os_log_type_enabled(v13, v14))
                                              {
                                                v15 = (uint8_t *)swift_slowAlloc();
                                                v17 = swift_slowAlloc();
                                                *(_DWORD *)v15 = 136315138;
                                                OUTLINED_FUNCTION_6_9();
                                                sub_1AF208AF4(v3, v5, &v17);
                                                sub_1AF24157C();
                                                swift_bridgeObjectRelease_n();
                                                _os_log_impl(&dword_1AF203000, v13, v14, "Failed to get client type for %s", v15, 0xCu);
                                                swift_arrayDestroy();
                                                OUTLINED_FUNCTION_1();
                                              }

                                              swift_bridgeObjectRelease_n();
                                              v7 = 0;
                                              v6 = 0;
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
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    LOBYTE(v17) = v6;
    v8 = PegasusClientName.rawValue.getter();
    result = v16;
  }
  else
  {
    if (qword_1ED32ED00 != -1)
      swift_once();
    v8 = qword_1ED32F7D0;
    result = swift_bridgeObjectRetain();
    v7 = 0;
  }
  *a2 = v7;
  a2[1] = v8;
  a2[2] = result;
  return result;
}

uint64_t UserAgent.fullString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  OUTLINED_FUNCTION_1_0();
  return v1;
}

void Client.name.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_50();
}

void destroy for BiomeStreamConfig(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t parsecdUserAgent.getter()
{
  if (qword_1ED32EAC0 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_8((uint64_t)&xmmword_1ED32EAD8);
  OUTLINED_FUNCTION_1_0();
  return OUTLINED_FUNCTION_3_7();
}

uint64_t sub_1AF206368(_OWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v4;
  __int128 v5;

  *(_QWORD *)(v2 + 208) = a1;
  *(_QWORD *)(v2 + 216) = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E980);
  *(_QWORD *)(v2 + 224) = swift_task_alloc();
  v4 = a1[1];
  *(_OWORD *)(v2 + 16) = *a1;
  *(_OWORD *)(v2 + 32) = v4;
  v5 = a1[3];
  *(_OWORD *)(v2 + 48) = a1[2];
  *(_OWORD *)(v2 + 64) = v5;
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_2();
}

uint64_t ConfigurationManager.configAccessProvider.getter()
{
  return swift_unknownObjectRetain();
}

id FeedbackStoreConfig.getConfig(forStream:)@<X0>(unsigned __int8 *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD *v15;

  v4 = *v2;
  if (*(_QWORD *)(v4 + 16) && (v5 = sub_1AF20746C(*a1), (v6 & 1) != 0))
  {
    v7 = (_QWORD *)(*(_QWORD *)(v4 + 56) + 48 * v5);
    v8 = v7[1];
    v9 = v7[2];
    v10 = v7[3];
    v11 = (void *)v7[4];
    v12 = (void *)v7[5];
    *a2 = *v7;
    a2[1] = v8;
    a2[2] = v9;
    a2[3] = v10;
    a2[4] = v11;
    a2[5] = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13 = v11;
    return v12;
  }
  else
  {
    sub_1AF241630();
    swift_bridgeObjectRelease();
    FeedbackStreamDescriptor.rawValue.getter();
    sub_1AF24133C();
    OUTLINED_FUNCTION_27();
    sub_1AF227FC8();
    swift_allocError();
    *v15 = 0xD000000000000013;
    v15[1] = 0x80000001AF2474C0;
    return (id)swift_willThrow();
  }
}

uint64_t initializeBufferWithCopyOfBuffer for Client(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

BOOL sub_1AF20653C()
{
  return sub_1AF225660();
}

uint64_t sub_1AF206560()
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
  char v9;
  _QWORD *v10;
  __n128 *inited;
  __n128 *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  sub_1AF206700(*(_QWORD *)(v0 + 224), (uint64_t)v21);
  v2 = v21[0];
  v1 = v21[1];
  *(_QWORD *)(v0 + 240) = v21[0];
  *(_QWORD *)(v0 + 248) = v1;
  v3 = v22;
  v4 = v23;
  *(_QWORD *)(v0 + 256) = v22;
  *(_QWORD *)(v0 + 264) = v4;
  v5 = v24;
  v6 = v25;
  *(_QWORD *)(v0 + 272) = v24;
  *(_QWORD *)(v0 + 280) = v6;
  v7 = v26;
  v8 = v27;
  *(_QWORD *)(v0 + 288) = v26;
  *(_QWORD *)(v0 + 296) = v8;
  if (!v3)
    goto LABEL_6;
  if (!v2)
  {
    sub_1AF205AF0(0, v1, v3);
LABEL_6:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33538);
    inited = (__n128 *)swift_initStackObject();
    v13 = OUTLINED_FUNCTION_22_0(inited, (__n128)xmmword_1AF242860);
    OUTLINED_FUNCTION_2_3((uint64_t)v13, MEMORY[0x1E0DEA968], v14);
    v15 = sub_1AF241210();
    v16 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    v17 = OUTLINED_FUNCTION_19_1();
    sub_1AF220830(v17, v18, v19, v15);
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v9 = v4 & 1;
  if (*(_BYTE *)(v0 + 336) == 1)
  {
    *(_QWORD *)(v0 + 160) = v2;
    *(_QWORD *)(v0 + 168) = v1;
    *(_QWORD *)(v0 + 176) = v3;
    *(_BYTE *)(v0 + 184) = v9;
    *(_QWORD *)(v0 + 192) = v5;
    *(_QWORD *)(v0 + 200) = v6;
    *(_QWORD *)(v0 + 208) = v7;
    *(_QWORD *)(v0 + 216) = v8;
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 304) = v10;
    *v10 = v0;
    v10[1] = sub_1AF22059C;
    return sub_1AF20F098(v0 + 160);
  }
  else
  {
    *(_QWORD *)(v0 + 96) = v2;
    *(_QWORD *)(v0 + 104) = v1;
    *(_QWORD *)(v0 + 112) = v3;
    *(_BYTE *)(v0 + 120) = v9;
    *(_QWORD *)(v0 + 128) = v5;
    *(_QWORD *)(v0 + 136) = v6;
    *(_QWORD *)(v0 + 144) = v7;
    *(_QWORD *)(v0 + 152) = v8;
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 320) = v20;
    *v20 = v0;
    v20[1] = sub_1AF220624;
    return sub_1AF20C0F0(v0 + 96);
  }
}

double sub_1AF206700@<D0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  unsigned __int8 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  if (a1 == 8)
  {
LABEL_4:
    Client.init(_:)(a1, (unint64_t *)&v17);
    v15 = v17;
    v16 = v18;
    v14 = 0;
    UserAgent.init(_:requestor:)((uint64_t *)&v15, &v14, (uint64_t)&v19);
    v3 = v20;
    v4 = v21;
    v5 = v22;
    v6 = v23;
    v7 = v24;
    *(_OWORD *)a2 = v19;
    *(_QWORD *)(a2 + 16) = v3;
    *(_QWORD *)(a2 + 24) = v4;
    *(_OWORD *)(a2 + 32) = v5;
    *(_QWORD *)(a2 + 48) = v6;
    *(_QWORD *)(a2 + 56) = v7;
    return *(double *)&v5;
  }
  if (a1 != 7)
  {
    if (a1 != 5)
    {
      *(_QWORD *)&v5 = 0;
      *(_OWORD *)(a2 + 32) = 0u;
      *(_OWORD *)(a2 + 48) = 0u;
      *(_OWORD *)a2 = 0u;
      *(_OWORD *)(a2 + 16) = 0u;
      return *(double *)&v5;
    }
    goto LABEL_4;
  }
  if (qword_1ED32EAC0 != -1)
    swift_once();
  v8 = qword_1ED32EAE8;
  v9 = byte_1ED32EAF0;
  v10 = xmmword_1ED32EAF8;
  v11 = qword_1ED32EB08;
  v12 = unk_1ED32EB10;
  *(_OWORD *)a2 = xmmword_1ED32EAD8;
  *(_QWORD *)(a2 + 16) = v8;
  *(_QWORD *)(a2 + 24) = v9;
  *(_OWORD *)(a2 + 32) = v10;
  *(_QWORD *)(a2 + 48) = v11;
  *(_QWORD *)(a2 + 56) = v12;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return *(double *)&v5;
}

uint64_t sub_1AF20681C()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  _OWORD *v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD *v28;
  _OWORD *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  __int128 v35;
  __int128 v36;
  _QWORD *v37;
  _OWORD v38[4];

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 216) + 240);
  v2 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + 24) + 16);
  OUTLINED_FUNCTION_61();
  os_unfair_lock_lock(v2);
  v3 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 232) = v3;
  swift_unknownObjectRetain();
  os_unfair_lock_unlock(v2);
  OUTLINED_FUNCTION_29();
  if (!v3)
  {
    v24 = *(__int128 **)(v0 + 208);
    sub_1AF212448((void (*)(os_unfair_lock_s *))sub_1AF213830);
    v25 = *v24;
    v26 = v24[1];
    v27 = v24[3];
    *(_OWORD *)(v0 + 112) = v24[2];
    *(_OWORD *)(v0 + 128) = v27;
    *(_OWORD *)(v0 + 80) = v25;
    *(_OWORD *)(v0 + 96) = v26;
    v28 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 280) = v28;
    *v28 = v0;
    v28[1] = sub_1AF20FAC0;
    OUTLINED_FUNCTION_11_0();
    v32 = 2;
    return OUTLINED_FUNCTION_73(v29, v30, v31, v32, 1);
  }
  v4 = (_OWORD *)(v0 + 16);
  v5 = *(_OWORD **)(v0 + 208);
  v6 = v5[1];
  v38[0] = *v5;
  v38[1] = v6;
  v7 = v5[3];
  v38[2] = v5[2];
  v38[3] = v7;
  v8 = sub_1AF20A21C(v3, (uint64_t *)v38);
  v11 = v8;
  *(_QWORD *)(v0 + 240) = v8;
  *(_QWORD *)(v0 + 248) = v9;
  *(_BYTE *)(v0 + 296) = v10;
  if (v10 < 0)
  {
    v33 = v9;
    v34 = v10 & 0x7F;
    sub_1AF212448((void (*)(os_unfair_lock_s *))sub_1AF213830);
    v35 = *(_OWORD *)(v0 + 32);
    *(_OWORD *)(v0 + 144) = *v4;
    *(_OWORD *)(v0 + 160) = v35;
    v36 = *(_OWORD *)(v0 + 64);
    *(_OWORD *)(v0 + 176) = *(_OWORD *)(v0 + 48);
    *(_OWORD *)(v0 + 192) = v36;
    v37 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 256) = v37;
    *v37 = v0;
    v37[1] = sub_1AF20FA00;
    v29 = (_OWORD *)(v0 + 144);
    v30 = v11;
    v31 = v33;
    v32 = v34;
    return OUTLINED_FUNCTION_73(v29, v30, v31, v32, 1);
  }
  if (v8 == 9)
  {
    sub_1AF212448((void (*)(os_unfair_lock_s *))sub_1AF2135DC);
    if (qword_1ED32E488 != -1)
      swift_once();
    v12 = OUTLINED_FUNCTION_19();
    v13 = OUTLINED_FUNCTION_17(v12, (uint64_t)qword_1ED32E560);
    v14 = sub_1AF2414C8();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_WORD *)v15 = 0;
      OUTLINED_FUNCTION_21(&dword_1AF203000, v13, v14, "Configuration expired or expiring soon. Vending stale configuration and attempt to fetch new one in the background.", v15);
      OUTLINED_FUNCTION_1();
    }
    v16 = *(_QWORD *)(v0 + 224);

    v17 = OUTLINED_FUNCTION_135();
    __swift_storeEnumTagSinglePayload(v16, 1, 1, v17);
    v18 = OUTLINED_FUNCTION_22();
    swift_weakInit();
    v19 = OUTLINED_FUNCTION_22();
    *(_QWORD *)(v19 + 16) = 0;
    *(_QWORD *)(v19 + 24) = 0;
    *(_QWORD *)(v19 + 32) = v18;
    v20 = *(_OWORD *)(v0 + 32);
    *(_OWORD *)(v19 + 40) = *v4;
    *(_OWORD *)(v19 + 56) = v20;
    v21 = *(_OWORD *)(v0 + 64);
    *(_OWORD *)(v19 + 72) = *(_OWORD *)(v0 + 48);
    *(_OWORD *)(v19 + 88) = v21;
    sub_1AF219B40(v0 + 16);
    sub_1AF2108AC(v16, (uint64_t)&unk_1EEE33848, v19);
    v22 = swift_release();
    OUTLINED_FUNCTION_77(v22, (uint64_t *)&unk_1ED32E980);
  }
  OUTLINED_FUNCTION_152();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v11, v3);
}

void sub_1AF206B10()
{
  uint64_t v0;
  os_unfair_lock_s *v1;

  v1 = *(os_unfair_lock_s **)(*(_QWORD *)(*(_QWORD *)(v0 + 240) + 24) + 16);
  OUTLINED_FUNCTION_175();
  os_unfair_lock_lock(v1);
  swift_unknownObjectRetain();
  os_unfair_lock_unlock(v1);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_49();
}

uint64_t sub_1AF206B5C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v4 = a3();
  v6 = v5;
  if (v4 == a3() && v6 == v7)
    v9 = 1;
  else
    v9 = OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_40();
  return v9 & 1;
}

void NSFileManager.parsecdSessionFBDirectoryURL.getter()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v11[4];

  v5 = v1;
  v6 = OUTLINED_FUNCTION_7_1();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_2_4();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v11 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF209250(v5);
  v11[1] = 0x6973736553776172;
  v11[2] = 0xEB00000000736E6FLL;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 104))(v3, *MEMORY[0x1E0CAFD60], v6);
  sub_1AF208AB8();
  sub_1AF240E14();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v3, v6);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v2);
  OUTLINED_FUNCTION_37(v0, 0);
  OUTLINED_FUNCTION_12();
}

uint64_t sub_1AF206D08()
{
  sub_1AF2417EC();
  SessionType.hash(into:)();
  return sub_1AF241810();
}

uint64_t SessionType.hash(into:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = v0[1];
  switch(v1)
  {
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
      result = sub_1AF2417F8();
      break;
    default:
      v2 = *v0;
      sub_1AF2417F8();
      if (v1)
      {
        sub_1AF241804();
        OUTLINED_FUNCTION_101();
        sub_1AF241300();
        result = sub_1AF209B9C(v2, v1);
      }
      else
      {
        result = sub_1AF241804();
      }
      break;
  }
  return result;
}

uint64_t sub_1AF206E6C()
{
  sub_1AF206E8C();
  return swift_deallocClassInstance();
}

uint64_t sub_1AF206E8C()
{
  uint64_t v0;
  uint64_t v1;

  if ((*(_BYTE *)(v0 + 81) & 1) == 0)
    sub_1AF20BDB4();
  v1 = sub_1AF206FC4();
  swift_release();
  swift_bridgeObjectRelease();
  return v1;
}

void sub_1AF206EE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if ((*(_BYTE *)(v0 + 81) & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)v0 + 400))();
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_37_0();

  sub_1AF206F84(v0 + *(_QWORD *)(*(_QWORD *)v0 + 136));
  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 144);
  v2 = sub_1AF240F04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  OUTLINED_FUNCTION_49();
}

uint64_t sub_1AF206F84(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E948);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for UserAgent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for UserAgent(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v3;
  v4 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

PegasusConfiguration::FeedbackStoreConfig __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> FeedbackStoreConfig.init(fileManager:streams:)(NSFileManager fileManager, Swift::OpaquePointer streams)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  objc_class *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  objc_class *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  objc_class *isa;
  uint64_t v30;
  char v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  void *v37;
  uint64_t *v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  PegasusConfiguration::FeedbackStoreConfig result;
  _QWORD *v43;
  uint64_t v44;
  void *rawValue;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;

  v5 = v3;
  v8 = v2;
  v9 = sub_1AF240E2C();
  v47 = *(_QWORD *)(v9 - 8);
  v48 = v9;
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_2_8();
  sub_1AF20DCC8();
  v10 = (_QWORD *)sub_1AF241210();
  v46 = *((_QWORD *)streams._rawValue + 2);
  if (v46)
  {
    v43 = v8;
    sub_1AF20DC7C();
    swift_bridgeObjectRetain();
    v11 = 0;
    v44 = v4;
    rawValue = streams._rawValue;
    while (1)
    {
      v55 = v11;
      v12 = *((unsigned __int8 *)streams._rawValue + v11 + 32);
      if (*((_BYTE *)streams._rawValue + v11 + 32))
      {
        v53 = OUTLINED_FUNCTION_3_8();
        v54 = v13;
        sub_1AF208AB8();
        v14 = fileManager.super.isa;
        v15 = sub_1AF241594();
        swift_bridgeObjectRelease();
        v16 = *(_QWORD *)(v15 + 16);
        if (!v16)
          goto LABEL_25;
        v17 = v15 + 16 * v16;
        v19 = *(_QWORD *)(v17 + 16);
        v18 = *(_QWORD *)(v17 + 24);
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_40();
        v53 = v19;
        v54 = v18;
        sub_1AF24133C();
        v20 = v54;
        v51 = 0xD000000000000028;
        v52 = v53;
        v21 = 0x80000001AF247460;
      }
      else
      {
        v22 = fileManager.super.isa;
        v21 = 0x80000001AF247490;
        v20 = 0xEB00000000736673;
        v52 = 0x5F6E6F6973736573;
        v51 = 0xD000000000000026;
      }
      LOBYTE(v53) = v12;
      NSFileManager.biomeStreamURL(for:)((unsigned __int8 *)&v53, v4);
      if (v5)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        goto LABEL_23;
      }
      v49 = v20;
      v50 = v21;
      v23 = sub_1AF240DE4();
      v25 = v24;
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v4, v48);
      v26 = (_DWORD)v12 ? 0x200000 : 0x20000;
      v27 = sub_1AF2097A0(v23, v25, v26, 3);
      OUTLINED_FUNCTION_3_8();
      v28 = sub_1AF24124C();
      OUTLINED_FUNCTION_40();
      isa = fileManager.super.isa;

      swift_isUniquelyReferenced_nonNull_native();
      v53 = (uint64_t)v10;
      v30 = sub_1AF20746C(v12);
      if (__OFADD__(v10[2], (v31 & 1) == 0))
        break;
      v32 = v30;
      v33 = v31;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC80);
      if ((sub_1AF241690() & 1) != 0)
      {
        v34 = sub_1AF20746C(v12);
        if ((v33 & 1) != (v35 & 1))
          goto LABEL_27;
        v32 = v34;
      }
      v10 = (_QWORD *)v53;
      if ((v33 & 1) != 0)
      {
        v36 = *(_QWORD *)(v53 + 56) + 48 * v32;
        v37 = *(void **)(v36 + 32);

        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_40();
        *(_QWORD *)v36 = v52;
        *(_QWORD *)(v36 + 8) = v49;
        *(_QWORD *)(v36 + 16) = v51;
        *(_QWORD *)(v36 + 24) = v50;
        *(_QWORD *)(v36 + 32) = v27;
        *(_QWORD *)(v36 + 40) = v28;
      }
      else
      {
        *(_QWORD *)(v53 + 8 * (v32 >> 6) + 64) |= 1 << v32;
        *(_BYTE *)(v10[6] + v32) = v12;
        v38 = (uint64_t *)(v10[7] + 48 * v32);
        *v38 = v52;
        v38[1] = v49;
        v38[2] = v51;
        v38[3] = v50;
        v38[4] = (uint64_t)v27;
        v38[5] = v28;
        v39 = v10[2];
        v40 = __OFADD__(v39, 1);
        v41 = v39 + 1;
        if (v40)
          goto LABEL_26;
        v10[2] = v41;
      }
      v11 = v55 + 1;
      swift_bridgeObjectRelease();
      v5 = 0;
      fileManager.super.isa = isa;
      v4 = v44;
      streams._rawValue = rawValue;
      if (v46 == v11)
      {
        OUTLINED_FUNCTION_27();
        v8 = v43;
        goto LABEL_21;
      }
    }
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    result.streamConfigs._rawValue = (void *)sub_1AF241798();
    __break(1u);
  }
  else
  {
LABEL_21:
    OUTLINED_FUNCTION_27();

    *v8 = v10;
LABEL_23:
    OUTLINED_FUNCTION_0();
  }
  return result;
}

uint64_t sub_1AF20746C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  sub_1AF20749C(*(_QWORD *)(v1 + 40), a1);
  return sub_1AF207648(a1, v3);
}

void sub_1AF20749C(uint64_t a1, uint64_t a2)
{
  sub_1AF2074A8(a1, a2, (void (*)(uint64_t))FeedbackStreamDescriptor.rawValue.getter);
}

void sub_1AF2074A8(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_8_7();
  a3(v4);
  OUTLINED_FUNCTION_15_4();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_13();
}

uint64_t FeedbackStreamDescriptor.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1AF20752C + 4 * byte_1AF2440F0[*v0]))(0xD000000000000010, 0x80000001AF246090);
}

uint64_t sub_1AF20752C()
{
  return 0x6E6F6973736573;
}

uint64_t sub_1AF207544(uint64_t a1)
{
  return a1 + 3;
}

uint64_t sub_1AF207648(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

uint64_t NSFileManager.biomeStreamURL(for:)@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t (*v2)(_QWORD, _QWORD);
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
  char *v15;
  uint64_t v16;
  char *v17;
  int v18;
  _QWORD *v19;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  int v33;
  uint64_t v34;
  uint64_t (*v35)(_QWORD, _QWORD);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39[4];

  v38 = a2;
  v4 = sub_1AF240D90();
  v37 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_57();
  v36 = v6 - v5;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_57();
  v10 = v9 - v8;
  v11 = sub_1AF240E2C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)v30 - v16;
  v18 = *a1;
  sub_1AF208F4C();
  if (__swift_getEnumTagSinglePayload(v10, 1, v11) == 1)
  {
    sub_1AF209738(v10, (uint64_t *)&unk_1ED32FF80);
    sub_1AF227FC8();
    swift_allocError();
    *v19 = 0;
    v19[1] = 0;
    return swift_willThrow();
  }
  else
  {
    v34 = v4;
    v32 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 32);
    v32(v17, v10, v11);
    if (qword_1ED32EC08 != -1)
      swift_once();
    v33 = v18;
    v35 = v2;
    v21 = sub_1AF2411B0();
    __swift_project_value_buffer(v21, (uint64_t)qword_1ED330238);
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    v22 = sub_1AF241198();
    v23 = sub_1AF241498();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v39[0] = v31;
      *(_DWORD *)v24 = 136315138;
      v30[1] = v24 + 4;
      sub_1AF209828();
      v25 = sub_1AF241720();
      v39[3] = sub_1AF208AF4(v25, v26, v39);
      sub_1AF24157C();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_8();
      _os_log_impl(&dword_1AF203000, v22, v23, "Container URL: %s", v24, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_4_8();

    v27 = v34;
    if (v33)
    {
      v39[0] = 0x6B63616264656566;
      v39[1] = 0xE800000000000000;
      v29 = v36;
      v28 = v37;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v37 + 104))(v36, *MEMORY[0x1E0CAFD60], v34);
      sub_1AF208AB8();
      sub_1AF240E20();
      (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v27);
      return v2(v17, v11);
    }
    else
    {
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v32)(v38, v17, v11);
    }
  }
}

void OUTLINED_FUNCTION_1()
{
  JUMPOUT(0x1AF45A8C4);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_72()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_88()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_101()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  uint64_t v0;

  return sub_1AF208AF4(0x676E69727453, 0xE600000000000000, (uint64_t *)(v0 - 104));
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_2_3@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  *(_QWORD *)(result + 32) = a3;
  *(_QWORD *)(result + 40) = v3;
  *(_QWORD *)(result + 72) = a2;
  strcpy((char *)(result + 48), "invalid client");
  *(_BYTE *)(result + 63) = -18;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_5(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

void OUTLINED_FUNCTION_2_6(os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
}

__n128 OUTLINED_FUNCTION_2_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __int128 a19, uint64_t a20,char a21,__n128 a22,uint64_t a23,uint64_t a24)
{
  uint64_t v24;
  __n128 result;

  result = a22;
  *(_OWORD *)v24 = a19;
  *(_QWORD *)(v24 + 16) = a20;
  *(_BYTE *)(v24 + 24) = a21;
  *(__n128 *)(v24 + 32) = a22;
  *(_QWORD *)(v24 + 48) = a23;
  *(_QWORD *)(v24 + 56) = a24;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  return swift_dynamicCast();
}

double OUTLINED_FUNCTION_2_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,__int128 a21)
{
  uint64_t v21;

  return sub_1AF239D78((uint64_t)&a16, v21, &a21);
}

uint64_t OUTLINED_FUNCTION_2_11()
{
  return sub_1AF240F04();
}

uint64_t OUTLINED_FUNCTION_2_12(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

void OUTLINED_FUNCTION_2_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  sub_1AF20CB84(v11, v13, a1, a2, a3, v12, *(_QWORD *)(v14 - 152), v10, a9, a10);
}

uint64_t OUTLINED_FUNCTION_2_15(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_2_16()
{
  return swift_beginAccess();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1AF45A81C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_6()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_7(uint64_t (*a1)(void))
{
  return a1();
}

BOOL OUTLINED_FUNCTION_119(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_1AF24157C();
}

void OUTLINED_FUNCTION_0_3(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v1;
  a1[1] = v2;
}

void OUTLINED_FUNCTION_0_4(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_1AF21D3DC(v2 - 128, a1, (a2 - 32) | 0x8000000000000000);
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return sub_1AF240E2C();
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return sub_1AF240C88();
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return sub_1AF24133C();
}

uint64_t OUTLINED_FUNCTION_0_8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_BYTE *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  *(_OWORD *)v1 = *(_OWORD *)a1;
  *(_QWORD *)(v1 + 16) = v2;
  *(_BYTE *)(v1 + 24) = v3;
  *(_QWORD *)(v1 + 32) = v4;
  *(_QWORD *)(v1 + 40) = v5;
  *(_QWORD *)(v1 + 48) = v6;
  *(_QWORD *)(v1 + 56) = v7;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_0_9(uint64_t a1, uint64_t *a2)
{
  sub_1AF228130(a1, a2);
}

uint64_t OUTLINED_FUNCTION_0_10(__n128 *a1, __n128 a2)
{
  uint64_t v2;

  a1[1] = a2;
  return sub_1AF20CD88(v2 + 32, (uint64_t)&a1[2]);
}

uint64_t OUTLINED_FUNCTION_0_11()
{
  return sub_1AF241240();
}

uint64_t OUTLINED_FUNCTION_0_12()
{
  return sub_1AF24157C();
}

uint64_t OUTLINED_FUNCTION_0_14()
{
  return sub_1AF2415C4();
}

uint64_t OUTLINED_FUNCTION_0_15()
{
  return sub_1AF240D90();
}

uint64_t OUTLINED_FUNCTION_0_16()
{
  return sub_1AF2410F0();
}

uint64_t OUTLINED_FUNCTION_0_17()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_37(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_47()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_60(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_95()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_1_3(unsigned __int16 a1)
{
  return a1 | 0x6867696C746F0000;
}

void OUTLINED_FUNCTION_1_4()
{
  uint64_t v0;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(v0 + 16) + 48));
}

uint64_t OUTLINED_FUNCTION_1_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, __int128 a14, uint64_t a15, uint64_t a16, __int128 a17, uint64_t a18, uint64_t a19, char a20)
{
  char v20;

  a14 = a17;
  a15 = a18;
  a13 = v20;
  return UserAgent.init(_:requestor:)((uint64_t *)&a14, &a13, (uint64_t)&a20);
}

void OUTLINED_FUNCTION_1_6()
{
  JUMPOUT(0x1AF45A8C4);
}

double OUTLINED_FUNCTION_1_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __int128 a19)
{
  uint64_t v19;

  return sub_1AF239D78((uint64_t)&a14, v19, &a19);
}

uint64_t OUTLINED_FUNCTION_1_9()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_1_10()
{
  return type metadata accessor for FederatedIdentifier();
}

uint64_t OUTLINED_FUNCTION_1_11(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v1 - 112))(*(_QWORD *)(v1 - 128), v0);
}

uint64_t OUTLINED_FUNCTION_1_13()
{
  return sub_1AF241810();
}

uint64_t OUTLINED_FUNCTION_1_14()
{
  return sub_1AF2415C4();
}

uint64_t OUTLINED_FUNCTION_1_16()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_1_17()
{
  return sub_1AF241744();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_55()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_87(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_136()
{
  return sub_1AF240F04();
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  return result;
}

void OUTLINED_FUNCTION_3_2(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_1AF21D3DC(v2 - 128, a1, (a2 - 32) | 0x8000000000000000);
}

uint64_t OUTLINED_FUNCTION_3_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return sub_1AF205AF0(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_3_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_3_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

void OUTLINED_FUNCTION_3_6()
{
  uint64_t v0;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(v0 + 16) + 48));
}

uint64_t OUTLINED_FUNCTION_3_7()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  char v0;
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = v0;
  return FeedbackStreamDescriptor.rawValue.getter();
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_project_value_buffer(v0, v1);
}

uint64_t OUTLINED_FUNCTION_3_10()
{
  return sub_1AF2410F0();
}

uint64_t OUTLINED_FUNCTION_3_11()
{
  return sub_1AF2410F0();
}

uint64_t OUTLINED_FUNCTION_3_12()
{
  return sub_1AF2417EC();
}

uint64_t OUTLINED_FUNCTION_3_15(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

_QWORD *OUTLINED_FUNCTION_3_16(uint64_t a1, _QWORD *a2)
{
  return __swift_project_boxed_opaque_existential_1(a2, a2[3]);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_85()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_96()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  uint64_t *v0;

  return sub_1AF205AF0(v0[30], v0[31], v0[32]);
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  return sub_1AF241228();
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1AF209B9C(v0, v1);
}

uint64_t OUTLINED_FUNCTION_12_6()
{
  return swift_deallocPartialClassInstance();
}

uint64_t OUTLINED_FUNCTION_12_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_12_8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, *(_QWORD *)(v3 - 136));
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void OUTLINED_FUNCTION_21(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return sub_1AF240EE0();
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = v0;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_21_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_21_4()
{
  uint64_t v0;

  return v0;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void OUTLINED_FUNCTION_8_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_1AF21D3DC(v1 - 128, 0xD000000000000019, (a1 - 32) | 0x8000000000000000);
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return sub_1AF241744();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1AF20CD88(v0 + 112, v1 + 112);
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return sub_1AF2415F4();
}

uint64_t OUTLINED_FUNCTION_8_5(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_8_6(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_8_7()
{
  return sub_1AF2417EC();
}

uint64_t OUTLINED_FUNCTION_8_9()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_10()
{
  return sub_1AF241318();
}

uint64_t OUTLINED_FUNCTION_8_11()
{
  return sub_1AF241504();
}

void OUTLINED_FUNCTION_8_12()
{
  sub_1AF235570();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_105()
{
  return sub_1AF240E2C();
}

uint64_t OUTLINED_FUNCTION_113()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_5_0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1AF208AF4(a1, a2, (uint64_t *)(v2 - 104));
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_task_switch();
}

unint64_t OUTLINED_FUNCTION_5_3(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return sub_1AF24133C();
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_5_7(uint64_t a1)
{
  uint64_t v1;

  return sub_1AF23E5D0(a1, 68, 2, v1);
}

uint64_t OUTLINED_FUNCTION_5_8()
{
  return sub_1AF2410F0();
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  return sub_1AF240F40();
}

uint64_t OUTLINED_FUNCTION_5_10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  return sub_1AF231880(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_5_11()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_13(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1AF209B9C(a1, a2);
  return v2;
}

id OUTLINED_FUNCTION_41(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1AF20CDCC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_37_1(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  sub_1AF21F578((uint64_t)va, a2);
}

uint64_t OUTLINED_FUNCTION_18@<X0>(uint64_t a1@<X1>, __int16 a2@<W8>)
{
  *(_WORD *)(a1 + 8) = a2;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_18_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  return sub_1AF20CE14(v8, v6, v7, v5, a5);
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return sub_1AF24133C();
}

uint64_t OUTLINED_FUNCTION_14()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

id OUTLINED_FUNCTION_4_0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_1AF241744();
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return 0;
}

void OUTLINED_FUNCTION_4_3(_BYTE *a1@<X8>)
{
  *a1 = 28;
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return sub_1AF24133C();
}

uint64_t OUTLINED_FUNCTION_4_6(uint64_t *a1)
{
  return __swift_instantiateConcreteTypeFromMangledName(a1);
}

__n128 OUTLINED_FUNCTION_4_7(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __n128 a13)
{
  __n128 result;

  result = a13;
  a1[1] = a13;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_4_10()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  return sub_1AF208AF4(v0, v1, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_4_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = *(_QWORD *)(v1 + 24);
  *(_QWORD *)(v2 - 144) = v1 + 48;
  *(_QWORD *)(v2 - 136) = *(_QWORD *)(v0 + 72);
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_4_12@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_1AF233A04(a1, (uint64_t *)(a2 + 16), (_OWORD *)a2, a3);
}

uint64_t OUTLINED_FUNCTION_4_13()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_77(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1AF209710(v2, a2);
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1AF20CDCC(v1, v0);
}

uint64_t OUTLINED_FUNCTION_23(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_89()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_163()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_23_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1AF21F578(v2, a2);
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_16()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1AF219BC4(v1, v0);
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_16_0(uint64_t a1, SEL *a2)
{
  void *v2;

  return sub_1AF21F51C(v2, a2);
}

id OUTLINED_FUNCTION_16_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  return objc_msgSend(v1, (SEL)(v2 + 102), v0);
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_16_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v4)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v5;

  return v4(0, v5, a3, v3);
}

uint64_t OUTLINED_FUNCTION_16_4(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_91()
{
  return sub_1AF24124C();
}

void OUTLINED_FUNCTION_66(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v3;
  va_list va;

  va_start(va, a3);
  sub_1AF20C188(v3, 1, (uint64_t *)va, 0, 1);
}

uint64_t OUTLINED_FUNCTION_62()
{
  return swift_weakLoadStrong();
}

void OUTLINED_FUNCTION_54()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

unint64_t sub_1AF208AB8()
{
  unint64_t result;

  result = qword_1ED32FF70;
  if (!qword_1ED32FF70)
  {
    result = MEMORY[0x1AF45A834](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED32FF70);
  }
  return result;
}

uint64_t sub_1AF208AF4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_1AF208BC0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1AF208D14((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1AF208D14((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    OUTLINED_FUNCTION_6_9();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1AF208BC0(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1AF233B14((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1AF241588();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_1AF233BD8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_1AF241654();
    if (!v8)
    {
      result = sub_1AF2416A8();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_1AF208D14(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_64()
{
  return sub_1AF241744();
}

uint64_t OUTLINED_FUNCTION_73(_OWORD *a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  return sub_1AF20F3F4(a1, a2, a3, a4, a5);
}

uint64_t OUTLINED_FUNCTION_93@<X0>(uint64_t (*a1)(_QWORD, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(*(_QWORD *)(v3 - 136), v1, v2);
}

uint64_t OUTLINED_FUNCTION_74()
{
  return sub_1AF24142C();
}

uint64_t OUTLINED_FUNCTION_61()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_56()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_10_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  return sub_1AF229C64((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_10_4()
{
  uint64_t v0;

  os_unfair_lock_lock(*(os_unfair_lock_t *)(*(_QWORD *)(v0 + 32) + 16));
}

uint64_t OUTLINED_FUNCTION_20()
{
  uint64_t v0;

  return sub_1AF22F1D0(*(_QWORD *)(v0 - 88));
}

uint64_t OUTLINED_FUNCTION_10_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_86(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  unsigned __int8 v0;

  return sub_1AF228358(v0);
}

double OUTLINED_FUNCTION_6_1()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_6_2(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1AF20CD88(v0 + 72, v1 + 72);
}

uint64_t OUTLINED_FUNCTION_6_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  return sub_1AF21F5B0((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return 0x5F6E6F6973736573;
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return 0;
}

void OUTLINED_FUNCTION_6_8(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6_9()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6_10()
{
  return sub_1AF2417F8();
}

uint64_t OUTLINED_FUNCTION_6_11()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_6_12()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6_13(uint64_t a1, unint64_t *a2)
{
  return sub_1AF20C87C(0, a2);
}

uint64_t OUTLINED_FUNCTION_6_14(uint64_t a1, _QWORD *a2)
{
  *a2 = 0;
  a2[1] = 0;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_6_15()
{
  return sub_1AF2410F0();
}

uint64_t OUTLINED_FUNCTION_6_16(uint64_t a1, uint64_t a2)
{
  return sub_1AF221D14(a1, a2);
}

uint64_t sub_1AF208F4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  void (*v18)(uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  OUTLINED_FUNCTION_83();
  v34 = v1;
  v35 = v2;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_131();
  v6 = OUTLINED_FUNCTION_105();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_98();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v29 - v9;
  sub_1AF209250(v0);
  OUTLINED_FUNCTION_37((uint64_t)v0, 0);
  v11 = OUTLINED_FUNCTION_35((uint64_t)v0, 1, v6);
  if (v12)
  {
    OUTLINED_FUNCTION_77(v11, (uint64_t *)&unk_1ED32FF80);
    if (qword_1ED32EC08 != -1)
      swift_once();
    v13 = OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_17(v13, (uint64_t)qword_1ED330238);
    v14 = OUTLINED_FUNCTION_63();
    if (OUTLINED_FUNCTION_34(v14))
    {
      v15 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_WORD *)v15 = 0;
      OUTLINED_FUNCTION_21(&dword_1AF203000, v0, OS_LOG_TYPE_DEFAULT, "Failed to get container URL for pegasus configuration", v15);
      OUTLINED_FUNCTION_1();
    }

    v16 = 1;
  }
  else
  {
    v18 = *(void (**)(uint64_t))(v7 + 32);
    v19 = OUTLINED_FUNCTION_167();
    v18(v19);
    if (qword_1ED32EC08 != -1)
      swift_once();
    v20 = OUTLINED_FUNCTION_19();
    __swift_project_value_buffer(v20, (uint64_t)qword_1ED330238);
    v21 = OUTLINED_FUNCTION_160();
    v22(v21);
    v23 = sub_1AF241198();
    v24 = sub_1AF241498();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = OUTLINED_FUNCTION_4();
      v31 = v18;
      v26 = (uint8_t *)v25;
      v30 = OUTLINED_FUNCTION_4();
      v33 = v30;
      *(_DWORD *)v26 = 136315138;
      v29 = v26 + 4;
      sub_1AF209868((unint64_t *)&qword_1ED32EC48, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
      v27 = sub_1AF241720();
      v32 = sub_1AF208AF4(v27, v28, &v33);
      sub_1AF24157C();
      OUTLINED_FUNCTION_40();
      OUTLINED_FUNCTION_130();
      OUTLINED_FUNCTION_87(&dword_1AF203000, v23, v24, "PegasusConfiguration container URL: %s", v26);
      OUTLINED_FUNCTION_113();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_130();

    ((void (*)(uint64_t, char *, uint64_t))v18)(v4, v10, v6);
    v16 = 0;
  }
  return OUTLINED_FUNCTION_37(v4, v16);
}

void sub_1AF209250(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12[2];
  uint64_t v13;
  void *v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_4_2();
  v6 = sub_1AF240D90();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_5_2();
  v14 = a1;
  sub_1AF2093E4();
  v8 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EBE8);
  if (swift_dynamicCast())
  {
    sub_1AF220BCC(v12, (uint64_t)v15);
    v9 = v16;
    v10 = v17;
    __swift_project_boxed_opaque_existential_1(v15, v16);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
  }
  else
  {
    v13 = 0;
    memset(v12, 0, sizeof(v12));
    sub_1AF209738((uint64_t)v12, (uint64_t *)&unk_1ED32EBF8);
    sub_1AF2276F8();
    if (!v2)
    {
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 104))(v3, *MEMORY[0x1E0CAFD60], v6);
      v11 = sub_1AF240E2C();
      __swift_storeEnumTagSinglePayload(v1, 1, 1, v11);
      sub_1AF240E08();
    }
  }
}

unint64_t sub_1AF2093E4()
{
  unint64_t result;

  result = qword_1ED32EBF0;
  if (!qword_1ED32EBF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED32EBF0);
  }
  return result;
}

void static PegasusConfigContainerURLProvider.containerURL()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  MEMORY[0x1E0C80A78](v1);
  v2 = OUTLINED_FUNCTION_0_15();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_57();
  v6 = v5 - v4;
  sub_1AF2276F8();
  if (!v0)
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E0CAFD60], v2);
    v7 = sub_1AF240E2C();
    OUTLINED_FUNCTION_2_15(v7);
    sub_1AF240E08();
  }
}

uint64_t sub_1AF209504@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  void *v2;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;

  v5 = a1[1];
  if (v5)
  {
    *a2 = *a1;
    a2[1] = v5;
    return swift_bridgeObjectRetain();
  }
  v7 = static PrimaryPersonaContainerPathLookup.path(for:)();
  if (!v2)
  {
    *a1 = v7;
    a1[1] = v8;
    *a2 = v7;
    a2[1] = v8;
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  if (qword_1EEE33580 != -1)
    swift_once();
  v9 = sub_1AF2411B0();
  __swift_project_value_buffer(v9, (uint64_t)qword_1EEE33C18);
  v10 = v2;
  v11 = v2;
  v12 = sub_1AF241198();
  v13 = sub_1AF2414B0();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v14 = 138543362;
    v16 = v2;
    v17 = _swift_stdlib_bridgeErrorToNSError();
    sub_1AF24157C();
    *v15 = v17;

    _os_log_impl(&dword_1AF203000, v12, v13, "access failed with error: %{public}@", v14, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33E80);
    swift_arrayDestroy();
    MEMORY[0x1AF45A8C4](v15, -1, -1);
    MEMORY[0x1AF45A8C4](v14, -1, -1);
  }
  else
  {

  }
  return swift_willThrow();
}

void sub_1AF209710(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_86(v2);
  OUTLINED_FUNCTION_50();
}

uint64_t sub_1AF209738(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1AF209774(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_86(v3);
  return a1;
}

id sub_1AF2097A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;

  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = (void *)sub_1AF24124C();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_initWithStoreBasePath_segmentSize_protectionClass_, v7, a3, a4);

  return v8;
}

unint64_t sub_1AF209828()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED32EC48;
  if (!qword_1ED32EC48)
  {
    v1 = sub_1AF240E2C();
    result = MEMORY[0x1AF45A834](MEMORY[0x1E0CB0048], v1);
    atomic_store(result, (unint64_t *)&qword_1ED32EC48);
  }
  return result;
}

void sub_1AF209868(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x1AF45A834](a3, v5), a1);
  }
  OUTLINED_FUNCTION_50();
}

uint64_t static SessionType.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  switch(v3)
  {
    case 1:
      if (v5 != 1)
        goto LABEL_45;
      v6 = OUTLINED_FUNCTION_5_13(*a1, 1);
      sub_1AF209B9C(v6, 1);
      return v5;
    case 2:
      if (v5 != 2)
        goto LABEL_45;
      v10 = OUTLINED_FUNCTION_5_13(*a1, 2);
      v11 = 2;
      goto LABEL_43;
    case 3:
      if (v5 != 3)
        goto LABEL_45;
      v10 = OUTLINED_FUNCTION_5_13(*a1, 3);
      v11 = 3;
      goto LABEL_43;
    case 4:
      if (v5 != 4)
        goto LABEL_45;
      v10 = OUTLINED_FUNCTION_5_13(*a1, 4);
      v11 = 4;
      goto LABEL_43;
    case 5:
      if (v5 != 5)
        goto LABEL_45;
      v10 = OUTLINED_FUNCTION_5_13(*a1, 5);
      v11 = 5;
      goto LABEL_43;
    case 6:
      if (v5 != 6)
        goto LABEL_45;
      v10 = OUTLINED_FUNCTION_5_13(*a1, 6);
      v11 = 6;
      goto LABEL_43;
    case 7:
      if (v5 != 7)
        goto LABEL_45;
      v10 = OUTLINED_FUNCTION_5_13(*a1, 7);
      v11 = 7;
      goto LABEL_43;
    case 8:
      if (v5 != 8)
        goto LABEL_45;
      v10 = OUTLINED_FUNCTION_5_13(*a1, 8);
      v11 = 8;
      goto LABEL_43;
    case 9:
      if (v5 != 9)
        goto LABEL_45;
      v10 = OUTLINED_FUNCTION_5_13(*a1, 9);
      v11 = 9;
      goto LABEL_43;
    case 10:
      if (v5 != 10)
        goto LABEL_45;
      v10 = OUTLINED_FUNCTION_5_13(*a1, 10);
      v11 = 10;
      goto LABEL_43;
    case 11:
      if (v5 != 11)
        goto LABEL_45;
      v10 = OUTLINED_FUNCTION_5_13(*a1, 11);
      v11 = 11;
      goto LABEL_43;
    case 12:
      if (v5 != 12)
        goto LABEL_45;
      v10 = OUTLINED_FUNCTION_5_13(*a1, 12);
      v11 = 12;
      goto LABEL_43;
    case 13:
      if (v5 != 13)
        goto LABEL_45;
      v10 = OUTLINED_FUNCTION_5_13(*a1, 13);
      v11 = 13;
      goto LABEL_43;
    case 14:
      if (v5 != 14)
        goto LABEL_45;
      v10 = OUTLINED_FUNCTION_5_13(*a1, 14);
      v11 = 14;
      goto LABEL_43;
    case 15:
      if (v5 != 15)
        goto LABEL_45;
      v10 = OUTLINED_FUNCTION_5_13(*a1, 15);
      v11 = 15;
      goto LABEL_43;
    case 16:
      if (v5 != 16)
        goto LABEL_45;
      v10 = OUTLINED_FUNCTION_5_13(*a1, 16);
      v11 = 16;
      goto LABEL_43;
    default:
      if ((unint64_t)(v5 - 1) < 0x10)
      {
LABEL_45:
        v12 = *a2;
        v13 = a2[1];
LABEL_46:
        sub_1AF20A01C(v12, v13);
        sub_1AF20A01C(v2, v3);
        goto LABEL_47;
      }
      if (v3)
      {
        if (v5)
        {
          v7 = *a1;
          if (v2 == v4 && v3 == v5)
          {
            OUTLINED_FUNCTION_14_6(v7, v3);
            v10 = v2;
            v11 = v3;
LABEL_43:
            sub_1AF209B9C(v10, v11);
          }
          else
          {
            v9 = sub_1AF241744();
            OUTLINED_FUNCTION_14_6(v4, v5);
            OUTLINED_FUNCTION_12_5();
            if ((v9 & 1) == 0)
              return 0;
          }
          return 1;
        }
        v12 = *a2;
        v13 = 0;
        goto LABEL_46;
      }
      swift_bridgeObjectRetain();
      sub_1AF20A01C(v4, v5);
      sub_1AF20A01C(v2, 0);
      sub_1AF209B9C(v2, 0);
      OUTLINED_FUNCTION_12_5();
      if (!v5)
        return 1;
LABEL_47:
      sub_1AF209B9C(v2, v3);
      OUTLINED_FUNCTION_12_5();
      return 0;
  }
}

uint64_t sub_1AF209B9C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((unint64_t)(a2 - 1) >= 0x10)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t dynamic_cast_existential_1_unconditional(uint64_t a1)
{
  uint64_t result;

  result = swift_conformsToProtocol2();
  if (result)
    return a1;
  __break(1u);
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_9_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_9_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

id OUTLINED_FUNCTION_9_3()
{
  uint64_t v0;

  return objc_allocWithZone(*(Class *)(v0 + 2024));
}

uint64_t OUTLINED_FUNCTION_9_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  return sub_1AF21F5B0((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v1 - 104), *(_QWORD *)(v1 - 96));
}

uint64_t OUTLINED_FUNCTION_9_6()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_9_7()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_9_8()
{
  unsigned __int8 v0;

  return sub_1AF20D8DC(v0);
}

uint64_t OUTLINED_FUNCTION_9_11()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_81()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_71(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 152) = a1;
  return sub_1AF24157C();
}

uint64_t OUTLINED_FUNCTION_17(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_1AF241198();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_1AF240D90();
}

uint64_t OUTLINED_FUNCTION_7_2(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return sub_1AF2414B0();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return sub_1AF24133C();
}

uint64_t OUTLINED_FUNCTION_7_5()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_7_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  return sub_1AF229C64((uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_7_7(uint64_t a1)
{
  uint64_t v1;

  return sub_1AF20C0EC(a1, 68, 2, v1);
}

uint64_t OUTLINED_FUNCTION_7_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_7_9(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = a1;
  return v1 - 72;
}

uint64_t OUTLINED_FUNCTION_7_10()
{
  return sub_1AF2416D8();
}

uint64_t OUTLINED_FUNCTION_7_11()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(v3, v0, v2);
}

uint64_t OUTLINED_FUNCTION_7_12@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

__n128 OUTLINED_FUNCTION_65(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __n128 a9)
{
  unint64_t v9;
  __n128 *v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 v13;
  unint64_t v14;
  unint64_t v15;
  __n128 result;

  v10[13].n128_u64[1] = a1;
  v10[1].n128_u64[0] = v15;
  v10[1].n128_u64[1] = v14;
  v10[2].n128_u64[0] = v9;
  v10[2].n128_u8[8] = v13;
  result = a9;
  v10[3] = a9;
  v10[4].n128_u64[0] = v12;
  v10[4].n128_u64[1] = v11;
  return result;
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return sub_1AF2417F8();
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 128) = v0;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_32(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_32_0(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;

  return v2(a1, a2, v4, v3);
}

void OUTLINED_FUNCTION_32_1(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1AF23A7C0(a1, a2, a3);
}

BOOL OUTLINED_FUNCTION_31(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_31_0()
{
  os_unfair_lock_s *v0;

  os_unfair_lock_lock(v0);
}

uint64_t OUTLINED_FUNCTION_31_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_26(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;

  v5 = *v3;
  v6 = (uint64_t *)(v4 - 8);
  *v6 = *v3;
  *(_QWORD *)(v5 + 96) = a2;
  *(_QWORD *)(v5 + 104) = v2;
  *(_BYTE *)(v5 + 88) = a1;
  *(_QWORD *)(v5 + 80) = v3;
  *v6 = *v3;
  *(_QWORD *)(v5 + 232) = v2;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_26_0(double a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = v1;
  *(double *)(v2 - 128) = a1;
}

void OUTLINED_FUNCTION_26_1()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_26_3()
{
  return sub_1AF241138();
}

uint64_t OUTLINED_FUNCTION_26_4()
{
  return sub_1AF241618();
}

uint64_t OUTLINED_FUNCTION_24(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

void OUTLINED_FUNCTION_24_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_1AF21F4DC(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);

  return v1(v0, 1);
}

uint64_t OUTLINED_FUNCTION_24_2()
{
  return sub_1AF2412AC();
}

uint64_t OUTLINED_FUNCTION_24_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_24_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return sub_1AF2412AC();
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  return sub_1AF241708();
}

uint64_t OUTLINED_FUNCTION_15_4()
{
  return sub_1AF241300();
}

double OUTLINED_FUNCTION_15_5(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v2;
  uint64_t v3;
  va_list va;

  va_start(va, a2);
  return sub_1AF239D78((uint64_t)va, v2, (_OWORD *)(v3 - 128));
}

uint64_t OUTLINED_FUNCTION_141()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_13()
{
  uint64_t *v0;

  return sub_1AF205AF0(v0[30], v0[31], v0[32]);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return sub_1AF24136C();
}

uint64_t OUTLINED_FUNCTION_13_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF20A01C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if ((unint64_t)(a2 - 1) >= 0x10)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_1AF20A034(char a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_26(a1, a2);
  if (!v3)
    *(_BYTE *)(v4 + 123) = v2;
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_12_0();
}

void OUTLINED_FUNCTION_11_1(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 104) = a1;
  *(double *)(v2 - 128) = a2;
}

uint64_t OUTLINED_FUNCTION_11_2(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return sub_1AF2415F4();
}

uint64_t OUTLINED_FUNCTION_11_4()
{
  return sub_1AF2415F4();
}

uint64_t OUTLINED_FUNCTION_11_5()
{
  return sub_1AF241228();
}

BOOL OUTLINED_FUNCTION_11_6(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_11_8()
{
  return sub_1AF2415F4();
}

uint64_t OUTLINED_FUNCTION_11_9@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_11_10()
{
  uint64_t v0;

  return v0;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void Config.isDefault.getter()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (qword_1EEE33508 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_139();
  v2 = OUTLINED_FUNCTION_41(v1, sel_valueForKey_);
  OUTLINED_FUNCTION_102();
  if (v0)
  {
    OUTLINED_FUNCTION_45();
    v3 = OUTLINED_FUNCTION_36();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_115();
  }
  OUTLINED_FUNCTION_44(v3, v4, &qword_1ED32F808, v5, v6, v7);
  if (v15)
    OUTLINED_FUNCTION_43();
  else
    OUTLINED_FUNCTION_90(v8, &qword_1ED32F808, v9, v10, v11, v12, v13, v14);
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_110();
}

uint64_t sub_1AF20A21C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t Throttle;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t ObjectType;
  int v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _QWORD v37[2];
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;

  v3 = v2;
  v38 = sub_1AF240C40();
  v37[1] = *(_QWORD *)(v38 - 8);
  MEMORY[0x1E0C80A78](v38);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  MEMORY[0x1E0C80A78](v6);
  v39 = (char *)v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1AF240F04();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  Throttle = type metadata accessor for ConfigFetchThrottle(0);
  v13 = MEMORY[0x1E0C80A78](Throttle);
  v15 = (char *)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)v37 - v16;
  v18 = *a2;
  v46 = a2[1];
  v47 = v18;
  v45 = a2[2];
  v44 = *((unsigned __int8 *)a2 + 24);
  v19 = a2[4];
  v42 = a2[5];
  v43 = v19;
  v20 = a2[6];
  v40 = a2[7];
  v41 = v20;
  if ((sub_1AF20BC4C(a1) & 1) != 0)
    return 1;
  v21 = (void *)swift_unknownObjectRetain();
  v48 = v17;
  sub_1AF20A908(v21, (uint64_t)v17);
  if (MEMORY[0x1AF45A960](v3 + 224))
  {
    v22 = *(_QWORD *)(v3 + 232);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v22 + 24))(&v50, ObjectType, v22);
    swift_unknownObjectRelease();
    v24 = v50;
  }
  else
  {
    v24 = 4;
  }
  sub_1AF20AC4C((uint64_t)v48, (uint64_t)v15);
  if (v24 != 4)
  {
    sub_1AF20A7D4((uint64_t)v15, type metadata accessor for ConfigFetchThrottle);
    if (v24 != 3)
      goto LABEL_10;
LABEL_9:
    sub_1AF20BB54();
  }
  sub_1AF240EF8();
  sub_1AF240E80();
  v26 = v25;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v27 = *(double *)&v15[*(int *)(Throttle + 20)];
  sub_1AF20A7D4((uint64_t)v15, type metadata accessor for ConfigFetchThrottle);
  if (v26 >= v27)
    goto LABEL_9;
  LOBYTE(v24) = 0;
LABEL_10:
  if (qword_1ED32E488 != -1)
    swift_once();
  v28 = sub_1AF2411B0();
  __swift_project_value_buffer(v28, (uint64_t)qword_1ED32E560);
  v29 = sub_1AF241198();
  v30 = sub_1AF2414A4();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v50 = v32;
    *(_DWORD *)v31 = 136315138;
    LOBYTE(v49) = v24;
    v33 = sub_1AF2412AC();
    v49 = sub_1AF208AF4(v33, v34, &v50);
    sub_1AF24157C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AF203000, v29, v30, "shouldThrottleConfigFetch: (%s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1AF45A8C4](v32, -1, -1);
    MEMORY[0x1AF45A8C4](v31, -1, -1);
  }

  sub_1AF20A7D4((uint64_t)v48, type metadata accessor for ConfigFetchThrottle);
  return 8;
}

void sub_1AF20A7D4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_86(v2);
  OUTLINED_FUNCTION_50();
}

uint64_t sub_1AF20A7FC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1AF240F04();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t storeEnumTagSinglePayload for ShouldThrottleConfigFetchResult(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 3;
  if (a3 + 3 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFD)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1AF20A898 + 4 * byte_1AF2420DF[v5]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1AF20A8CC + 4 * byte_1AF2420DA[v5]))();
}

uint64_t sub_1AF20A8CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF20A8D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF20A8DCLL);
  return result;
}

uint64_t sub_1AF20A8E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF20A8F0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1AF20A8F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF20A8FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF20A908@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int *Throttle;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _QWORD *v16;
  uint64_t result;
  uint64_t v18;
  _OWORD v19[2];
  __int128 v20;
  __int128 v21;

  if (!a1)
  {
    v20 = 0u;
    v21 = 0u;
LABEL_9:
    sub_1AF209710((uint64_t)&v20, &qword_1ED32F808);
    goto LABEL_10;
  }
  swift_unknownObjectRetain();
  v4 = (void *)sub_1AF24124C();
  v5 = objc_msgSend(a1, sel_valueForKey_, v4);

  swift_unknownObjectRelease();
  if (v5)
  {
    sub_1AF2415D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v19, 0, sizeof(v19));
  }
  sub_1AF20AB3C((uint64_t)v19, (uint64_t)&v20, &qword_1ED32F808);
  if (!*((_QWORD *)&v21 + 1))
    goto LABEL_9;
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_1AF240EBC();
    goto LABEL_11;
  }
LABEL_10:
  sub_1AF240E74();
  if (!a1)
  {
    Throttle = (int *)type metadata accessor for ConfigFetchThrottle(0);
    *(_QWORD *)(a2 + Throttle[5]) = 0;
    v16 = (_QWORD *)(a2 + Throttle[7]);
    *v16 = 0;
    v16[1] = 0;
    v15 = 1;
    v14 = 0;
    goto LABEL_13;
  }
LABEL_11:
  swift_unknownObjectRetain();
  sub_1AF213AD8();
  v7 = v6;
  swift_unknownObjectRelease();
  Throttle = (int *)type metadata accessor for ConfigFetchThrottle(0);
  *(_QWORD *)(a2 + Throttle[5]) = v7;
  swift_unknownObjectRetain();
  v9 = sub_1AF20AB68();
  v11 = v10;
  swift_unknownObjectRelease();
  v12 = (uint64_t *)(a2 + Throttle[7]);
  *v12 = v9;
  v12[1] = v11;
  swift_unknownObjectRetain();
  sub_1AF213B74();
  v14 = v13;
  swift_unknownObjectRelease_n();
  v15 = 0;
LABEL_13:
  result = type metadata accessor for ConfigFetchThrottle(0);
  v18 = a2 + Throttle[6];
  *(_QWORD *)v18 = v14;
  *(_BYTE *)(v18 + 8) = v15;
  return result;
}

uint64_t type metadata accessor for ConfigFetchThrottle(uint64_t a1)
{
  return sub_1AF20AB0C(a1, qword_1ED32E840);
}

uint64_t sub_1AF20AB0C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1AF20AB3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_116(a1, a2, a3);
  OUTLINED_FUNCTION_173(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_50();
}

uint64_t sub_1AF20AB68()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  if (qword_1EEE33508 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_139();
  v2 = OUTLINED_FUNCTION_41(v1, sel_valueForKey_);
  OUTLINED_FUNCTION_102();
  if (v0)
  {
    OUTLINED_FUNCTION_45();
    v3 = OUTLINED_FUNCTION_36();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_115();
  }
  OUTLINED_FUNCTION_44(v3, v4, &qword_1ED32F808, v5, v6, v7);
  if (v17)
  {
    if (OUTLINED_FUNCTION_43())
      return v16;
    else
      return 0;
  }
  else
  {
    OUTLINED_FUNCTION_90(v8, &qword_1ED32F808, v9, v10, v11, v12, v13, v14);
    return 0;
  }
}

uint64_t sub_1AF20AC4C(uint64_t a1, uint64_t a2)
{
  uint64_t Throttle;

  Throttle = type metadata accessor for ConfigFetchThrottle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(Throttle - 8) + 16))(a2, a1, Throttle);
  return a2;
}

uint64_t sub_1AF20AC90(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  v6 = sub_1AF240F04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_BYTE *)(v8 + 8) = *(_BYTE *)(v9 + 8);
  v10 = a3[7];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1AF20AD1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v9;
  void (*v10)(char *, uint64_t);
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v16;

  v1 = sub_1AF240F04();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v16 - v6;
  v8 = v0 + *(int *)(type metadata accessor for ConfigFetchThrottle(0) + 24);
  if ((*(_BYTE *)(v8 + 8) & 1) != 0)
  {
    v9 = 1;
  }
  else if (*(double *)v8 <= 0.0)
  {
    v9 = 0;
  }
  else
  {
    sub_1AF240EBC();
    if (qword_1ED32E4C0 != -1)
      swift_once();
    sub_1AF240EA4();
    v9 = sub_1AF240E98();
    v10 = *(void (**)(char *, uint64_t))(v2 + 8);
    v10(v5, v1);
    if ((v9 & 1) != 0)
    {
      if (qword_1ED32E488 != -1)
        swift_once();
      v11 = sub_1AF2411B0();
      __swift_project_value_buffer(v11, (uint64_t)qword_1ED32E560);
      v12 = sub_1AF241198();
      v13 = sub_1AF2414A4();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1AF203000, v12, v13, "Config is going to expire soon. Go fetch it.", v14, 2u);
        MEMORY[0x1AF45A8C4](v14, -1, -1);
      }

    }
    v10(v7, v1);
  }
  return v9 & 1;
}

uint64_t sub_1AF20AEF8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v25;
  os_log_type_t type;
  uint64_t v27;

  if (!a2)
    return 0;
  v5 = (uint64_t *)(v2 + *(int *)(type metadata accessor for ConfigFetchThrottle(0) + 28));
  v6 = v5[1];
  if (!v6)
    return 0;
  v7 = *v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = sub_1AF20B2EC();
  if (v10 == -1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1ED32E488 != -1)
      swift_once();
    v20 = sub_1AF2411B0();
    __swift_project_value_buffer(v20, (uint64_t)qword_1ED32E560);
    v21 = sub_1AF241198();
    v22 = sub_1AF2414A4();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1AF203000, v21, v22, "Context not changed, no need to refresh config", v23, 2u);
      MEMORY[0x1AF45A8C4](v23, -1, -1);
    }

    return 0;
  }
  v11 = v8;
  v12 = v9;
  v13 = v10;
  if (qword_1ED32E488 != -1)
    swift_once();
  v14 = sub_1AF2411B0();
  __swift_project_value_buffer(v14, (uint64_t)qword_1ED32E560);
  sub_1AF219858(v11, v12, v13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1AF219858(v11, v12, v13);
  v15 = sub_1AF241198();
  v16 = sub_1AF2414A4();
  if (os_log_type_enabled(v15, v16))
  {
    type = v16;
    v17 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    v27 = v25;
    *(_DWORD *)v17 = 136315650;
    v18 = sub_1AF2119D4(v11, v12, v13);
    sub_1AF208AF4(v18, v19, &v27);
    sub_1AF24157C();
    swift_bridgeObjectRelease();
    sub_1AF219884(v11, v12, v13);
    sub_1AF219884(v11, v12, v13);
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_1AF208AF4(v7, v6, &v27);
    sub_1AF24157C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_1AF208AF4(a1, a2, &v27);
    sub_1AF24157C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AF203000, v15, type, "Context has changed (%s) from %s to %s", (uint8_t *)v17, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x1AF45A8C4](v25, -1, -1);
    MEMORY[0x1AF45A8C4](v17, -1, -1);

  }
  else
  {
    sub_1AF219884(v11, v12, v13);
    sub_1AF219884(v11, v12, v13);

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  return v11;
}

uint64_t sub_1AF20B2EC()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, char *, uint64_t);
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v60;
  void (*v61)(uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t result;
  uint64_t v68;
  char v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  uint64_t v75;
  uint64_t v76;
  char v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  char *v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t (*v87)(char *, unint64_t, uint64_t);
  unint64_t v88;
  uint64_t (*v89)(char *, unint64_t, uint64_t);
  char v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char v98;
  void (*v99)(uint64_t, uint64_t);
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;

  OUTLINED_FUNCTION_83();
  v114 = v0;
  v115 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = sub_1AF240C88();
  v109 = *(_QWORD *)(v10 - 8);
  v110 = v10;
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_79();
  v111 = v11;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v12);
  v112 = (char *)&v102 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E538);
  OUTLINED_FUNCTION_10();
  v15 = MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v102 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v102 - v18;
  v113 = sub_1AF240D0C();
  v20 = *(_QWORD *)(v113 - 8);
  v21 = MEMORY[0x1E0C80A78](v113);
  v22 = MEMORY[0x1E0C80A78](v21);
  MEMORY[0x1E0C80A78](v22);
  v24 = MEMORY[0x1E0C80A78]((char *)&v102 - v23);
  v25 = MEMORY[0x1E0C80A78](v24);
  v27 = (char *)&v102 - v26;
  v28 = MEMORY[0x1E0C80A78](v25);
  v30 = (char *)&v102 - v29;
  v31 = MEMORY[0x1E0C80A78](v28);
  v33 = (char *)&v102 - v32;
  v34 = MEMORY[0x1E0C80A78](v31);
  v39 = v9 == v5 && v7 == v3;
  if (v39)
    return OUTLINED_FUNCTION_80();
  v104 = v34;
  v105 = v38;
  v106 = v37;
  v107 = v36;
  v108 = (uint64_t)&v102 - v35;
  if ((OUTLINED_FUNCTION_64() & 1) != 0)
    return OUTLINED_FUNCTION_80();
  sub_1AF240D00();
  v40 = v113;
  OUTLINED_FUNCTION_35((uint64_t)v19, 1, v113);
  if (v39)
  {
    v41 = (uint64_t)v19;
LABEL_13:
    sub_1AF209710(v41, &qword_1ED32E538);
    return OUTLINED_FUNCTION_80();
  }
  v103 = v33;
  v42 = *(void (**)(uint64_t, char *, uint64_t))(v20 + 32);
  v43 = v108;
  v42(v108, v19, v40);
  sub_1AF240D00();
  OUTLINED_FUNCTION_35((uint64_t)v17, 1, v40);
  if (v44)
  {
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v43, v40);
    v41 = (uint64_t)v17;
    goto LABEL_13;
  }
  v45 = (uint64_t)v103;
  v42((uint64_t)v103, v17, v40);
  v46 = v45;
  v47 = sub_1AF240CF4();
  v49 = v48;
  v50 = sub_1AF240CF4();
  v52 = v51;
  if (v49)
  {
    if (v51)
    {
      if (v47 == v50 && v49 == v51)
      {
        OUTLINED_FUNCTION_72();
        v54 = 1;
      }
      else
      {
        v54 = OUTLINED_FUNCTION_64();
        OUTLINED_FUNCTION_72();
      }
    }
    else
    {
      v54 = 0;
      v52 = v49;
    }
    goto LABEL_25;
  }
  if (v51)
  {
    v54 = 0;
LABEL_25:
    v55 = v113;
    OUTLINED_FUNCTION_27();
    goto LABEL_26;
  }
  v54 = 1;
  v55 = v113;
LABEL_26:
  OUTLINED_FUNCTION_25((uint64_t)v30, v108);
  OUTLINED_FUNCTION_25((uint64_t)v27, v46);
  if ((v54 & 1) == 0)
  {
    OUTLINED_FUNCTION_3((uint64_t)v27);
    OUTLINED_FUNCTION_3((uint64_t)v30);
LABEL_41:
    v62 = v105;
    OUTLINED_FUNCTION_25(v105, v108);
    v63 = v104;
    OUTLINED_FUNCTION_25(v104, v46);
    goto LABEL_42;
  }
  sub_1AF240CD0();
  OUTLINED_FUNCTION_112();
  v56 = sub_1AF240CD0();
  v58 = v57;
  if (!v52)
  {
    v61 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    OUTLINED_FUNCTION_3((uint64_t)v27);
    OUTLINED_FUNCTION_3((uint64_t)v30);
    if (!v58)
      goto LABEL_48;
    goto LABEL_40;
  }
  if (!v57)
  {
    OUTLINED_FUNCTION_101();
    OUTLINED_FUNCTION_3((uint64_t)v27);
    OUTLINED_FUNCTION_3((uint64_t)v30);
    OUTLINED_FUNCTION_27();
LABEL_40:
    OUTLINED_FUNCTION_40();
    goto LABEL_41;
  }
  if (v49 == v56 && v52 == v57)
  {
    OUTLINED_FUNCTION_101();
    OUTLINED_FUNCTION_40();
    v61 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    OUTLINED_FUNCTION_3((uint64_t)v27);
    OUTLINED_FUNCTION_3((uint64_t)v30);
    OUTLINED_FUNCTION_67();
LABEL_48:
    v62 = v105;
    OUTLINED_FUNCTION_25(v105, v108);
    v63 = v104;
    OUTLINED_FUNCTION_25(v104, v46);
    v64 = v110;
    goto LABEL_49;
  }
  v60 = OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_40();
  v61 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
  OUTLINED_FUNCTION_3((uint64_t)v27);
  OUTLINED_FUNCTION_3((uint64_t)v30);
  OUTLINED_FUNCTION_67();
  v62 = v105;
  OUTLINED_FUNCTION_25(v105, v108);
  v63 = v104;
  OUTLINED_FUNCTION_25(v104, v46);
  v64 = v110;
  if ((v60 & 1) == 0)
  {
LABEL_42:
    OUTLINED_FUNCTION_3(v63);
    OUTLINED_FUNCTION_3(v62);
    v65 = v107;
LABEL_43:
    OUTLINED_FUNCTION_25(v65, v108);
    v66 = v106;
    OUTLINED_FUNCTION_25(v106, v46);
LABEL_44:
    OUTLINED_FUNCTION_3(v66);
    OUTLINED_FUNCTION_3(v65);
LABEL_45:
    OUTLINED_FUNCTION_3(v46);
    OUTLINED_FUNCTION_3(v108);
    return OUTLINED_FUNCTION_80();
  }
LABEL_49:
  v110 = sub_1AF240CE8();
  v68 = v55;
  v70 = v69;
  v71 = sub_1AF240CE8();
  v73 = v72;
  v61(v63, v68);
  v61(v62, v68);
  if ((v70 & 1) != 0)
  {
    v74 = v73 & 1;
    v65 = v107;
    v75 = v64;
  }
  else
  {
    v65 = v107;
    if ((v73 & 1) != 0)
      goto LABEL_43;
    v75 = v64;
    v74 = v110 == v71;
  }
  OUTLINED_FUNCTION_25(v65, v108);
  v66 = v106;
  OUTLINED_FUNCTION_25(v106, v46);
  if (!v74)
    goto LABEL_44;
  sub_1AF240CDC();
  OUTLINED_FUNCTION_112();
  if (v73 == sub_1AF240CDC() && v64 == v76)
  {
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_3(v66);
    OUTLINED_FUNCTION_3(v65);
  }
  else
  {
    v78 = OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_3(v66);
    OUTLINED_FUNCTION_3(v65);
    if ((v78 & 1) == 0)
      goto LABEL_45;
  }
  v79 = v108;
  v80 = sub_1AF240C94();
  if (!v80)
  {
    OUTLINED_FUNCTION_3(v46);
    v100 = v79;
LABEL_94:
    OUTLINED_FUNCTION_3(v100);
    return OUTLINED_FUNCTION_80();
  }
  v81 = v80;
  result = sub_1AF240C94();
  if (!result)
  {
    OUTLINED_FUNCTION_55();
    v101 = v46;
LABEL_93:
    OUTLINED_FUNCTION_3(v101);
    v100 = v108;
    goto LABEL_94;
  }
  v82 = result;
  v110 = *(_QWORD *)(v81 + 16);
  if (!v110)
  {
LABEL_92:
    OUTLINED_FUNCTION_55();
    OUTLINED_FUNCTION_96();
    v101 = (uint64_t)v103;
    goto LABEL_93;
  }
  v83 = 0;
  v84 = v111;
  while (v83 < *(_QWORD *)(v81 + 16))
  {
    v85 = (*(unsigned __int8 *)(v109 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v109 + 80);
    v86 = *(_QWORD *)(v109 + 72) * v83;
    v87 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v109 + 16);
    result = v87(v112, v81 + v85 + v86, v75);
    v88 = *(_QWORD *)(v82 + 16);
    if (v83 == v88)
    {
      (*(void (**)(char *, uint64_t))(v109 + 8))(v112, v75);
      goto LABEL_92;
    }
    if (v83 >= v88)
      goto LABEL_98;
    v87(v84, v82 + v85 + v86, v75);
    sub_1AF240C70();
    OUTLINED_FUNCTION_112();
    if (v86 == sub_1AF240C70() && v87 == v89)
    {
      OUTLINED_FUNCTION_67();
    }
    else
    {
      v91 = OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_27();
      OUTLINED_FUNCTION_40();
      if ((v91 & 1) == 0)
      {
        OUTLINED_FUNCTION_55();
        OUTLINED_FUNCTION_96();
        OUTLINED_FUNCTION_170();
        OUTLINED_FUNCTION_68();
        OUTLINED_FUNCTION_176();
        OUTLINED_FUNCTION_3((uint64_t)v103);
        OUTLINED_FUNCTION_3(v108);
        return OUTLINED_FUNCTION_80();
      }
    }
    v92 = sub_1AF240C7C();
    v94 = v93;
    v95 = sub_1AF240C7C();
    if (v94)
    {
      if (!v96)
        goto LABEL_95;
      if (v92 == v95 && v94 == v96)
      {
        OUTLINED_FUNCTION_72();
        OUTLINED_FUNCTION_27();
      }
      else
      {
        v98 = OUTLINED_FUNCTION_64();
        OUTLINED_FUNCTION_72();
        OUTLINED_FUNCTION_27();
        if ((v98 & 1) == 0)
        {
          OUTLINED_FUNCTION_55();
LABEL_96:
          OUTLINED_FUNCTION_27();
          OUTLINED_FUNCTION_170();
          OUTLINED_FUNCTION_68();
          OUTLINED_FUNCTION_176();
          OUTLINED_FUNCTION_3((uint64_t)v103);
          OUTLINED_FUNCTION_3(v108);
          return OUTLINED_FUNCTION_80();
        }
      }
    }
    else if (v96)
    {
LABEL_95:
      OUTLINED_FUNCTION_55();
      OUTLINED_FUNCTION_96();
      goto LABEL_96;
    }
    ++v83;
    v99 = *(void (**)(uint64_t, uint64_t))(v109 + 8);
    v99((uint64_t)v111, v75);
    result = ((uint64_t (*)(char *, uint64_t))v99)(v112, v75);
    if (v110 == v83)
      goto LABEL_92;
  }
  __break(1u);
LABEL_98:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_94(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

void sub_1AF20BB54()
{
  OUTLINED_FUNCTION_146();
}

void sub_1AF20BB68(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _WORD *v10;

  if (a1)
  {
    v2 = v1[29];
    ObjectType = swift_getObjectType();
    OUTLINED_FUNCTION_145(ObjectType, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 64));
    OUTLINED_FUNCTION_36();
  }
  else
  {
    v4 = v1[13];
    v5 = v1[14];
    v6 = __swift_project_boxed_opaque_existential_1(v1 + 10, v4);
    if ((OUTLINED_FUNCTION_145(v4, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 40)) & 1) == 0)
    {
      if (qword_1ED32EA58 != -1)
        swift_once();
      v7 = OUTLINED_FUNCTION_19();
      v8 = OUTLINED_FUNCTION_17(v7, (uint64_t)qword_1ED3301E8);
      v9 = sub_1AF241498();
      if (OUTLINED_FUNCTION_119(v9))
      {
        v10 = (_WORD *)OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_76(v10);
        OUTLINED_FUNCTION_21(&dword_1AF203000, v8, v6, "Required context missing", (uint8_t *)v5);
        OUTLINED_FUNCTION_1();
      }

    }
  }
  OUTLINED_FUNCTION_49();
}

uint64_t sub_1AF20BC4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;
  char v5;
  char v7;

  if (MEMORY[0x1AF45A960](v1 + 224))
  {
    v3 = *(_QWORD *)(v1 + 232);
    ObjectType = swift_getObjectType();
    v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(a1, ObjectType, v3);
    swift_unknownObjectRelease();
    return v5 & 1;
  }
  else
  {
    sub_1AF2109F4();
    return v7 & 1;
  }
}

uint64_t sub_1AF20BCC0()
{
  uint64_t v0;
  int v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(unsigned __int8 *)(v0 + 123);
  if (v1 == 1)
  {
    *(_BYTE *)(*(_QWORD *)(v0 + 216) + qword_1ED32E818) = 1;
    LOBYTE(v1) = *(_BYTE *)(v0 + 123);
  }
  v2 = *(void **)(v0 + 96);
  *(_BYTE *)(*(_QWORD *)(v0 + 216) + qword_1ED32E820) = v1;
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_160();
  v3 = (void *)sub_1AF24124C();
  v4 = objc_msgSend(v2, sel_findConfigForUserAgent_, v3);
  swift_unknownObjectRelease_n();

  sub_1AF20BDB4();
  OUTLINED_FUNCTION_15();
  sub_1AF20C030();
  return (*(uint64_t (**)(id))(v0 + 8))(v4);
}

void OUTLINED_FUNCTION_44(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, ...)
{
  uint64_t v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  sub_1AF20AB3C((uint64_t)va, (uint64_t)va1, a3);
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  uint64_t v0;

  return v0;
}

void sub_1AF20BDB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((*(_BYTE *)(v0 + 81) & 1) == 0)
  {
    v1 = v0;
    if (*(_QWORD *)(v0 + qword_1ED3301A8))
    {
      swift_retain();
      sub_1AF22B4B4();
      swift_release();
    }
    v2 = MEMORY[0x1E0DEA968];
    if ((*(_BYTE *)(v0 + qword_1ED32E818) & 1) == 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA20);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1AF242870;
      if (qword_1EEE33380 != -1)
        swift_once();
      v4 = *(_QWORD *)algn_1EEE33FC8;
      *(_QWORD *)(inited + 32) = qword_1EEE33FC0;
      *(_QWORD *)(inited + 40) = v4;
      v5 = objc_allocWithZone(MEMORY[0x1E0CB37E8]);
      OUTLINED_FUNCTION_23_1();
      *(_QWORD *)(inited + 48) = OUTLINED_FUNCTION_16_1();
      if (qword_1EEE334D8 != -1)
        swift_once();
      v6 = *(_QWORD *)algn_1EEE33FD8;
      *(_QWORD *)(inited + 56) = qword_1EEE33FD0;
      *(_QWORD *)(inited + 64) = v6;
      v7 = objc_allocWithZone(MEMORY[0x1E0CB37E8]);
      OUTLINED_FUNCTION_23_1();
      *(_QWORD *)(inited + 72) = OUTLINED_FUNCTION_16_1();
      sub_1AF22D2A0();
      v8 = sub_1AF241210();
      sub_1AF22AE8C(v8);
      v10 = v9;
      OUTLINED_FUNCTION_40();
      sub_1AF232040(v10);
      OUTLINED_FUNCTION_72();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
    v11 = OUTLINED_FUNCTION_0_1();
    *(_OWORD *)(v11 + 16) = xmmword_1AF242860;
    v12 = sub_1AF2412AC();
    v14 = v13;
    *(_QWORD *)(v11 + 56) = v2;
    *(_QWORD *)(v11 + 64) = sub_1AF20BFF4();
    *(_QWORD *)(v11 + 32) = v12;
    *(_QWORD *)(v11 + 40) = v14;
    sub_1AF20C0EC("outcome=%{signpost.description:attribute,public}s", 49, 2, v11);
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_141();
    OUTLINED_FUNCTION_31_0();
    if ((*(_BYTE *)(v1 + 81) & 1) == 0)
      sub_1AF20C978();
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_85();
  }
  OUTLINED_FUNCTION_4_9();
}

unint64_t sub_1AF20BFF4()
{
  unint64_t result;

  result = qword_1ED32E960;
  if (!qword_1ED32E960)
  {
    result = MEMORY[0x1AF45A834](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED32E960);
  }
  return result;
}

void sub_1AF20C030()
{
  os_unfair_lock_s *v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_4();
  v2 = *(_QWORD *)(v1 + 24);
  v3 = __OFSUB__(v2, 1);
  v4 = v2 - 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 24) = v4;
    OUTLINED_FUNCTION_2_6(v0);
  }
}

uint64_t sub_1AF20C060(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  os_unfair_lock_s *v9;

  v9 = *(os_unfair_lock_s **)(*(_QWORD *)(v4 + *(_QWORD *)(*(_QWORD *)v4 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v9);
  *(_QWORD *)(v4 + 24) = a1;
  *(_QWORD *)(v4 + 32) = a2;
  *(_BYTE *)(v4 + 40) = a3;
  *(_BYTE *)(v4 + 41) = 0;
  *(_QWORD *)(v4 + 56) = a4;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_72();
  os_unfair_lock_unlock(v9);
  return swift_release();
}

uint64_t sub_1AF20C0F0(uint64_t a1)
{
  OUTLINED_FUNCTION_69(a1);
  return OUTLINED_FUNCTION_30_0();
}

uint64_t sub_1AF20C108()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  _QWORD *v13;
  _OWORD *v14;

  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_169();
  OUTLINED_FUNCTION_61();
  v1 = OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_66(v1, v2, v3);
  OUTLINED_FUNCTION_65(v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 224) = v13;
  v14 = (_OWORD *)OUTLINED_FUNCTION_164(v13, (uint64_t)sub_1AF20A034);
  return sub_1AF206368(v14);
}

void sub_1AF20C188(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t inited;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v8 = *a3;
  v9 = a3[1];
  v10 = a3[2];
  *(_BYTE *)(v5 + qword_1ED32E820) = 0;
  *(_QWORD *)(v5 + qword_1ED3301A8) = 0;
  v11 = v5 + qword_1ED3301B0;
  *(_QWORD *)v11 = 0;
  *(_BYTE *)(v11 + 8) = 1;
  *(_BYTE *)(v5 + qword_1ED32E818) = 0;
  v12 = (_QWORD *)(v5 + qword_1ED3301B8);
  *v12 = v8;
  v12[1] = v9;
  v12[2] = v10;
  *(_QWORD *)v11 = a4;
  *(_BYTE *)(v11 + 8) = a5 & 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
  if ((a5 & 1) != 0)
  {
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1AF242860;
    *(_QWORD *)(inited + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(inited + 64) = sub_1AF20BFF4();
    *(_QWORD *)(inited + 32) = v9;
    *(_QWORD *)(inited + 40) = v10;
  }
  else
  {
    v14 = swift_initStackObject();
    *(_OWORD *)(v14 + 16) = xmmword_1AF242870;
    *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
    v15 = sub_1AF20BFF4();
    *(_QWORD *)(v14 + 32) = v9;
    *(_QWORD *)(v14 + 40) = v10;
    v16 = MEMORY[0x1E0DEE1F0];
    *(_QWORD *)(v14 + 96) = MEMORY[0x1E0DEE190];
    *(_QWORD *)(v14 + 104) = v16;
    *(_QWORD *)(v14 + 64) = v15;
    *(_QWORD *)(v14 + 72) = a4;
  }
  OUTLINED_FUNCTION_163();
  sub_1AF20C368();
}

uint64_t type metadata accessor for ResourceAccessSpan()
{
  uint64_t result;

  result = qword_1ED32E828;
  if (!qword_1ED32E828)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1AF20C338()
{
  os_unfair_lock_s *v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1_4();
  v2 = *(_QWORD *)(v1 + 24);
  v3 = __OFADD__(v2, 1);
  v4 = v2 + 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 24) = v4;
    OUTLINED_FUNCTION_2_6(v0);
  }
}

void sub_1AF20C368()
{
  uint64_t v0;
  id *v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
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
  _DWORD *v22;
  unsigned __int8 v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_unfair_lock_s *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t ObjectType;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;

  OUTLINED_FUNCTION_83();
  v1 = (id *)v0;
  v53 = v2;
  v54 = v3;
  HIDWORD(v51) = v4;
  v52 = v5;
  v58 = v6;
  v8 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E948);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_79();
  v55 = v10;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v51 - v12;
  v14 = OUTLINED_FUNCTION_136();
  v56 = *(_QWORD *)(v14 - 8);
  v57 = v14;
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_57();
  v17 = v16 - v15;
  swift_weakInit();
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  *(_WORD *)(v0 + 40) = 256;
  *(_QWORD *)(v0 + 48) = 0;
  *(_QWORD *)(v0 + 56) = 0;
  *(_QWORD *)(v0 + 64) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v0 + 72) = 0;
  *(_BYTE *)(v0 + 81) = 0;
  v61 = 0xD000000000000010;
  v62 = 0x80000001AF246690;
  v59 = 45;
  v60 = 0xE100000000000000;
  sub_1AF20C87C(0, (unint64_t *)&qword_1ED32E9B8);
  v63 = 95;
  v64 = 0xE100000000000000;
  v50 = sub_1AF208AB8();
  sub_1AF2415A0();
  if (qword_1ED32E448 != -1)
    swift_once();
  OUTLINED_FUNCTION_118();
  *(_QWORD *)(v0 + 88) = sub_1AF241528();
  v18 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 136);
  v19 = sub_1AF241138();
  __swift_storeEnumTagSinglePayload(v18, 1, 1, v19);
  v20 = *((_QWORD *)*v1 + 19);
  type metadata accessor for Locker();
  v21 = OUTLINED_FUNCTION_22();
  v22 = (_DWORD *)OUTLINED_FUNCTION_4();
  *(_QWORD *)(v21 + 16) = v22;
  *v22 = 0;
  *(id *)((char *)v1 + v20) = (id)v21;
  sub_1AF240EF8();
  (*(void (**)(char *, uint64_t, uint64_t))(v56 + 32))((char *)v1 + *((_QWORD *)*v1 + 18), v17, v57);
  swift_weakAssign();
  v23 = v58;
  *((_BYTE *)v1 + 80) = v58;
  v24 = v1[11];
  OUTLINED_FUNCTION_175();
  sub_1AF241114();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v19);
  v25 = (uint64_t)v1 + *((_QWORD *)*v1 + 17);
  OUTLINED_FUNCTION_143();
  v57 = v25;
  sub_1AF20C910((uint64_t)v13, v25);
  swift_endAccess();
  v61 = (unint64_t)v1;
  OUTLINED_FUNCTION_175();
  v26 = sub_1AF2412AC();
  v28 = v27;
  v29 = *(os_unfair_lock_s **)(v8[4] + 16);
  os_unfair_lock_lock(v29);
  v30 = v8 + 2;
  v31 = v8;
  if (MEMORY[0x1AF45A960](v8 + 2))
  {
    v56 = v19;
    v32 = v8[3];
    OUTLINED_FUNCTION_9_0();
    v33 = v8;
    v34 = v8[5];
    OUTLINED_FUNCTION_163();
    swift_bridgeObjectRetain();
    sub_1AF239DC8(v26, v28, v34);
    v36 = v35;
    OUTLINED_FUNCTION_95();
    OUTLINED_FUNCTION_72();
    swift_release();
    if (v36)
    {
      v37 = OUTLINED_FUNCTION_89();
      (*(void (**)(id *, _UNKNOWN **, uint64_t, uint64_t))(v32 + 32))(v1, &off_1E5F3BC20, v37, v32);
    }
    OUTLINED_FUNCTION_88();
    v31 = v33;
    v23 = v58;
    v19 = v56;
  }
  type metadata accessor for ActivityMonitor.WeakReference();
  v38 = OUTLINED_FUNCTION_22();
  *(_QWORD *)(v38 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v38 + 24) = &off_1E5F3BC20;
  swift_unknownObjectWeakAssign();
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_163();
  sub_1AF20C8B4(v38, v26, v28);
  swift_endAccess();
  OUTLINED_FUNCTION_95();
  os_unfair_lock_unlock(v29);
  OUTLINED_FUNCTION_95();
  if (MEMORY[0x1AF45A960](v30))
  {
    v39 = v31[3];
    ObjectType = swift_getObjectType();
    OUTLINED_FUNCTION_140((uint64_t)v1, (uint64_t)&off_1E5F3BC20, ObjectType, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v39 + 8));
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_88();
  }
  else
  {
    OUTLINED_FUNCTION_15();
  }
  v41 = v55;
  sub_1AF20DC38(v57, v55, &qword_1ED32E948);
  v42 = OUTLINED_FUNCTION_166();
  OUTLINED_FUNCTION_35(v42, v43, v19);
  if (v44)
  {
    __break(1u);
  }
  else
  {
    v45 = v1[11];
    v46 = sub_1AF2414E0();
    v47 = sub_1AF20D8DC(v23);
    LOBYTE(v50) = BYTE4(v51);
    sub_1AF20CB84(v46, (uint64_t)v45, v47, v48, v49, v41, v52, v53, v50, v54);

    OUTLINED_FUNCTION_95();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v41, v19);
    sub_1AF20D6E8();
    swift_release();
    OUTLINED_FUNCTION_78();
  }
}

uint64_t type metadata accessor for ActivityMonitor.WeakReference()
{
  return objc_opt_self();
}

uint64_t sub_1AF20C87C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1AF20C8B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_14_0();
  sub_1AF20D0B8(a1, a2, a3);
  *v3 = v8;
  return OUTLINED_FUNCTION_10_0();
}

uint64_t sub_1AF20C910(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E948);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for Locker()
{
  return objc_opt_self();
}

void sub_1AF20C978()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E948);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_17_2();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_42_0();
  sub_1AF20D3C8(v0);
  OUTLINED_FUNCTION_39_0();
  if ((v2 & 1) != 0 || !v1)
  {
    OUTLINED_FUNCTION_5_11();
    OUTLINED_FUNCTION_41_0();
    v18 = OUTLINED_FUNCTION_26_3();
    OUTLINED_FUNCTION_48_0(v18);
    if (!v7)
    {
      sub_1AF2414D4();
      OUTLINED_FUNCTION_9_8();
      OUTLINED_FUNCTION_28_2();
      v16 = OUTLINED_FUNCTION_44_0();
      goto LABEL_7;
    }
    __break(1u);
LABEL_17:
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_5_11();
  OUTLINED_FUNCTION_40_0();
  v6 = OUTLINED_FUNCTION_26_3();
  OUTLINED_FUNCTION_30_1(v6);
  if (v7)
    goto LABEL_17;
  OUTLINED_FUNCTION_163();
  sub_1AF2414D4();
  v8 = OUTLINED_FUNCTION_9_8();
  OUTLINED_FUNCTION_2_13(v8, v9, v10, v11, v12, v13, v14, v15, v25, v26);
  OUTLINED_FUNCTION_95();
  v16 = OUTLINED_FUNCTION_50_0();
LABEL_7:
  v17(v16);
  if (OUTLINED_FUNCTION_43_0())
  {
    OUTLINED_FUNCTION_21_1();
    sub_1AF2412AC();
    OUTLINED_FUNCTION_10_4();
    OUTLINED_FUNCTION_18_0(v19, v20, v21, v22, (uint64_t)&off_1E5F3BC20);
    os_unfair_lock_unlock(v2);
    OUTLINED_FUNCTION_96();
    if (MEMORY[0x1AF45A960](v3 + 16))
    {
      OUTLINED_FUNCTION_35_0();
      v23 = OUTLINED_FUNCTION_22_1();
      OUTLINED_FUNCTION_32_0(v23, (uint64_t)&off_1E5F3BC20);
      OUTLINED_FUNCTION_51_0();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_release();
    }
    OUTLINED_FUNCTION_52_0();
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_95();
    OUTLINED_FUNCTION_40();
    swift_release();
    OUTLINED_FUNCTION_14_5();
    *(_QWORD *)(v0 + 64) = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)(v0 + 72) = 0;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_37_0();
    OUTLINED_FUNCTION_27_2();
  }
  else
  {
    sub_1AF23217C();
    if ((v24 & 1) != 0)
    {
      sub_1AF2414BC();
      OUTLINED_FUNCTION_20_2();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_95();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_78();
}

void sub_1AF20CB84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __n128 *v13;
  __n128 *v14;
  __n128 *v15;
  __n128 *v16;

  switch(*(_QWORD *)(a10 + 16))
  {
    case 0:
      OUTLINED_FUNCTION_5_6();
      sub_1AF2410FC();
      return;
    case 1:
      OUTLINED_FUNCTION_4_6(&qword_1ED32EA40);
      v10 = OUTLINED_FUNCTION_22();
      *(_OWORD *)(v10 + 16) = xmmword_1AF242860;
      v11 = v10 + 32;
      v12 = a10 + 32;
      goto LABEL_8;
    case 2:
      OUTLINED_FUNCTION_4_6(&qword_1ED32EA40);
      v13 = (__n128 *)OUTLINED_FUNCTION_22();
      OUTLINED_FUNCTION_0_10(v13, (__n128)xmmword_1AF242870);
      v11 = (uint64_t)&v13[4].n128_i64[1];
      v12 = a10 + 72;
      goto LABEL_8;
    case 3:
      OUTLINED_FUNCTION_4_6(&qword_1ED32EA40);
      v14 = (__n128 *)OUTLINED_FUNCTION_22();
      OUTLINED_FUNCTION_0_10(v14, (__n128)xmmword_1AF242880);
      OUTLINED_FUNCTION_6_3();
      v11 = (uint64_t)&v14[7];
      v12 = a10 + 112;
      goto LABEL_8;
    case 4:
      OUTLINED_FUNCTION_4_6(&qword_1ED32EA40);
      v15 = (__n128 *)OUTLINED_FUNCTION_22();
      OUTLINED_FUNCTION_0_10(v15, (__n128)xmmword_1AF2428C0);
      OUTLINED_FUNCTION_6_3();
      OUTLINED_FUNCTION_8_3();
      v11 = (uint64_t)&v15[9].n128_i64[1];
      v12 = a10 + 152;
      goto LABEL_8;
    case 5:
      OUTLINED_FUNCTION_4_6(&qword_1ED32EA40);
      v16 = (__n128 *)OUTLINED_FUNCTION_22();
      OUTLINED_FUNCTION_0_10(v16, (__n128)xmmword_1AF243DD0);
      OUTLINED_FUNCTION_6_3();
      OUTLINED_FUNCTION_8_3();
      sub_1AF20CD88(a10 + 152, (uint64_t)&v16[9].n128_i64[1]);
      v11 = (uint64_t)&v16[12];
      v12 = a10 + 192;
LABEL_8:
      sub_1AF20CD88(v12, v11);
      OUTLINED_FUNCTION_5_6();
      sub_1AF2410FC();
      swift_bridgeObjectRelease();
      break;
    default:
      return;
  }
}

uint64_t sub_1AF20CD88(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1AF20CDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E948);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF20CE14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  swift_beginAccess();
  v10 = sub_1AF20CFB0(a2, a3);
  swift_endAccess();
  result = swift_release();
  if (!v10)
  {
    if (MEMORY[0x1AF45A960](a1 + 16))
    {
      v12 = *(_QWORD *)(a1 + 24);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 40))(a4, a5, ObjectType, v12);
      OUTLINED_FUNCTION_88();
    }
    v14 = swift_getObjectType();
    v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a5 + 32))(v14, a5);
    sub_1AF2414B0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_1AF242870;
    v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a5 + 24))(v14, a5);
    v19 = v18;
    v20 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v16 + 56) = MEMORY[0x1E0DEA968];
    v21 = sub_1AF20BFF4();
    *(_QWORD *)(v16 + 64) = v21;
    *(_QWORD *)(v16 + 32) = v17;
    *(_QWORD *)(v16 + 40) = v19;
    (*(void (**)(uint64_t, uint64_t))(a5 + 40))(v14, a5);
    v22 = sub_1AF241648();
    *(_QWORD *)(v16 + 96) = v20;
    *(_QWORD *)(v16 + 104) = v21;
    *(_QWORD *)(v16 + 72) = v22;
    *(_QWORD *)(v16 + 80) = v23;
    sub_1AF2410F0();

    return OUTLINED_FUNCTION_55();
  }
  return result;
}

uint64_t sub_1AF20CFB0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1AF20D23C(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  swift_isUniquelyReferenced_nonNull_native();
  v10 = *v3;
  *v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E9E0);
  sub_1AF241690();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v6);
  type metadata accessor for ActivityMonitor.WeakReference();
  sub_1AF24169C();
  *v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1AF20D0B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_1AF20D23C(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E9E0);
  if ((sub_1AF241690() & 1) == 0)
    goto LABEL_5;
  v13 = sub_1AF20D23C(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_1AF241798();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];
    result = swift_release();
    *(_QWORD *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_1AF20D380(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_17_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_17_1(uint64_t a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  return sub_1AF208D14((uint64_t)va1, (uint64_t)va);
}

void OUTLINED_FUNCTION_17_4()
{
  sub_1AF235570();
}

uint64_t OUTLINED_FUNCTION_17_5@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v3, a1, v2);
}

uint64_t OUTLINED_FUNCTION_17_6()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

unint64_t sub_1AF20D23C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1AF2417EC();
  sub_1AF241300();
  v4 = sub_1AF241810();
  return sub_1AF20D2A0(a1, a2, v4);
}

unint64_t sub_1AF20D2A0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1AF241744() & 1) == 0)
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
      while (!v14 && (sub_1AF241744() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1AF20D380(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

void sub_1AF20D3C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (sub_1AF20D5A0(a1))
  {
    sub_1AF2414A4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1AF242870;
    if (qword_1ED32E448 != -1)
      swift_once();
    v2 = qword_1ED330178;
    v3 = unk_1ED330180;
    v4 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    v5 = sub_1AF20BFF4();
    *(_QWORD *)(v1 + 64) = v5;
    *(_QWORD *)(v1 + 32) = v2;
    *(_QWORD *)(v1 + 40) = v3;
    sub_1AF229DF0();
    swift_bridgeObjectRetain();
    v6 = sub_1AF241204();
    *(_QWORD *)(v1 + 96) = v4;
    *(_QWORD *)(v1 + 104) = v5;
    *(_QWORD *)(v1 + 72) = v6;
    *(_QWORD *)(v1 + 80) = v7;
    sub_1AF2410F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1AF21BE5C();
    v8 = (void *)sub_1AF24124C();
    swift_bridgeObjectRelease();
    v9 = (id)sub_1AF2411EC();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_1AF20D5A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = dynamic_cast_existential_1_unconditional((uint64_t)&type metadata for ResourceAccessActivity);
  if (!a1)
    return 0;
  v4 = v2;
  v5 = v3;
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  swift_bridgeObjectRetain();
  v7 = v6(v4, v5);
  v9 = v8;
  v10 = sub_1AF241570();
  swift_isUniquelyReferenced_nonNull_native();
  sub_1AF21ECE8(v10, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  v13 = v12;
  sub_1AF232250();
  v14 = sub_1AF24145C();
  swift_isUniquelyReferenced_nonNull_native();
  sub_1AF21ECE8(v14, v11, v13);
  v15 = a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1AF20D6E8()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  _QWORD v8[5];

  v1 = v0;
  v2 = *(_BYTE *)(v0 + 80);
  v8[3] = &type metadata for ResourceAccessActivity;
  v8[4] = &off_1E5F3C3A0;
  LOBYTE(v8[0]) = v2;
  v3 = *(char *)__swift_project_boxed_opaque_existential_1(v8, (uint64_t)&type metadata for ResourceAccessActivity);
  if (qword_1ED32E858 != -1)
LABEL_13:
    swift_once();
  v4 = *(_QWORD *)(qword_1ED3301C0 + 16);
  if (v4)
  {
    for (i = 0; ; ++i)
    {
      v6 = i + 1;
      if (__OFADD__(i, 1))
      {
        __break(1u);
        goto LABEL_13;
      }
      if (qword_1AF242710[*(char *)(qword_1ED3301C0 + 32 + i)] == qword_1AF242710[v3])
        break;
      if (v6 == v4)
        return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
    }
    sub_1AF24133C();
    if (qword_1ED32E448 != -1)
      swift_once();
    swift_bridgeObjectRetain();
    sub_1AF24133C();
    swift_bridgeObjectRelease();
    sub_1AF20D8DC(v2);
    sub_1AF241648();
    sub_1AF24133C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1AF24133C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_retain();
    sub_1AF20DB38(0xD000000000000010, 0x80000001AF246690, v1);
    swift_bridgeObjectRelease();
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
}

uint64_t sub_1AF20D8DC(unsigned __int8 a1)
{
  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_1AF20D908 + 4 * byte_1AF24447E[a1]))("unknown", 7);
}

const char *sub_1AF20D908()
{
  return "configuration";
}

uint64_t sub_1AF20DB38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_1AF241624();
    return swift_release();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
    {
      v5 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      v6 = a1 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      v5 = sub_1AF241654();
    }
    sub_1AF219780(v5, v6, (uint64_t (*)(void))sub_1AF219F00);
    return swift_release();
  }
  *(_QWORD *)(a3 + 72) = os_transaction_create();
  swift_release();
  return swift_unknownObjectRelease();
}

void sub_1AF20DC38(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_116(a1, a2, a3);
  OUTLINED_FUNCTION_173(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_50();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

unint64_t sub_1AF20DC7C()
{
  unint64_t result;

  result = qword_1ED32EC70;
  if (!qword_1ED32EC70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED32EC70);
  }
  return result;
}

ValueMetadata *type metadata accessor for FeedbackStreamDescriptor()
{
  return &type metadata for FeedbackStreamDescriptor;
}

unint64_t sub_1AF20DCC8()
{
  unint64_t result;

  result = qword_1ED32EC60;
  if (!qword_1ED32EC60)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for FeedbackStreamDescriptor, &type metadata for FeedbackStreamDescriptor);
    atomic_store(result, (unint64_t *)&qword_1ED32EC60);
  }
  return result;
}

ValueMetadata *type metadata accessor for FeedbackStoreConfig()
{
  return &type metadata for FeedbackStoreConfig;
}

ValueMetadata *type metadata accessor for BiomeStreamConfig()
{
  return &type metadata for BiomeStreamConfig;
}

_QWORD *sub_1AF20DD24(_QWORD *result, unsigned int a2)
{
  if (a2 > 0x7FFFFFFE)
  {
    *result = 0;
    result[1] = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
  }
  else if (a2)
  {
    result[1] = a2;
  }
  return result;
}

uint64_t static PegasusConfigContainerURLProvider.configFileName.getter()
{
  uint64_t v0;

  if (qword_1ED32EBE0 != -1)
    swift_once();
  v0 = qword_1ED330228;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1AF20DDB0(void *a1, unsigned int a2)
{
  int v2;
  char v3;
  int v4;
  uint64_t v5;
  unsigned int v6;
  char v7;
  uint64_t v8;
  void *v9;
  unsigned int v10;
  uint64_t v12;
  unsigned __int8 v13;
  char v14;

  v2 = (a2 >> 7) & 3;
  if (!v2)
    return 7;
  if (v2 != 1)
    return qword_1AF2426D0[(_QWORD)a1];
  v3 = (a2 & 0x100) != 0;
  sub_1AF219A18(a1, a2, v3);
  OUTLINED_FUNCTION_81();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC40);
  v4 = OUTLINED_FUNCTION_47();
  if (v4)
    v5 = v12;
  else
    v5 = 6;
  if (v4)
    v6 = v13;
  else
    v6 = 0;
  v7 = v14 | ~(_BYTE)v4;
  v8 = sub_1AF20DDB0(v5, v6 | ((v14 & 1 | ((v4 & 1) == 0)) << 8));
  sub_1AF2199F8((id)v5, v6, v7 & 1);
  v9 = (void *)OUTLINED_FUNCTION_80();
  sub_1AF2199F8(v9, v10, v3);
  return v8;
}

uint64_t sub_1AF20DEAC(void *a1, unsigned int a2)
{
  int v3;
  char v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  char v9;
  uint64_t v10;
  uint64_t v12;
  unsigned __int8 v13;
  char v14;

  v3 = (a2 >> 7) & 3;
  if (v3)
  {
    if (v3 != 1)
      __asm { BR              X9 }
    v5 = (a2 & 0x100) != 0;
    sub_1AF219A18(a1, a2, v5);
    OUTLINED_FUNCTION_81();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC40);
    v6 = OUTLINED_FUNCTION_47();
    if (v6)
      v7 = v12;
    else
      v7 = 6;
    if (v6)
      v8 = v13;
    else
      v8 = 0;
    v9 = v14 | ~(_BYTE)v6;
    v10 = sub_1AF20DEAC(v7, v8 | ((v14 & 1 | ((v6 & 1) == 0)) << 8));
    sub_1AF2199F8((id)v7, v8, v9 & 1);
    sub_1AF2199F8(a1, a2, v5);
  }
  else
  {
    sub_1AF241720();
    sub_1AF24133C();
    OUTLINED_FUNCTION_27();
    return 0x6F43737574617473;
  }
  return v10;
}

unint64_t sub_1AF20E0D8(char a1, unsigned int a2)
{
  int v2;

  v2 = (a2 >> 7) & 3;
  if (!v2)
    return 19;
  if (v2 == 1)
    return a2 & 0x7F;
  return 0x211815201F1E1D19uLL >> (8 * a1);
}

id sub_1AF20E11C(uint64_t a1, unsigned int a2)
{
  int v2;
  void *v3;
  unsigned int v4;
  char v5;
  char v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t inited;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  unsigned int v19;
  void *v21;
  unsigned __int8 v22;
  unsigned __int8 v23;

  v2 = a2 & 0x100;
  if (((a2 >> 7) & 3) == 1)
  {
    v3 = (void *)OUTLINED_FUNCTION_80();
    sub_1AF219A18(v3, v4, v5);
    OUTLINED_FUNCTION_81();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC40);
    v6 = v2 != 0;
    if (OUTLINED_FUNCTION_47())
    {
      v7 = sub_1AF20E11C(v21, v22 | (v23 << 8));
      sub_1AF2199F8(v21, v22, v23);
    }
    else
    {
      v7 = sub_1AF240D60();
    }
    v18 = (void *)OUTLINED_FUNCTION_80();
    sub_1AF2199F8(v18, v19, v6);
  }
  else
  {
    v8 = (void *)OUTLINED_FUNCTION_80();
    v10 = sub_1AF20DDB0(v8, v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33538);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1AF242860;
    *(_QWORD *)(inited + 32) = 0x6E6F73616572;
    *(_QWORD *)(inited + 40) = 0xE600000000000000;
    v12 = (void *)OUTLINED_FUNCTION_80();
    v14 = sub_1AF20DEAC(v12, v13);
    *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(inited + 48) = v14;
    *(_QWORD *)(inited + 56) = v15;
    v16 = sub_1AF241210();
    v17 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    return sub_1AF220830(0xD000000000000018, 0x80000001AF2466B0, v10, v16);
  }
  return (id)v7;
}

BOOL static ShouldThrottleConfigFetchResultReason.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void ShouldThrottleConfigFetchResultReason.hash(into:)()
{
  sub_1AF2417F8();
  OUTLINED_FUNCTION_50();
}

uint64_t ShouldThrottleConfigFetchResultReason.hashValue.getter()
{
  sub_1AF2417EC();
  sub_1AF2417F8();
  return sub_1AF241810();
}

uint64_t sub_1AF20E364()
{
  sub_1AF2417EC();
  sub_1AF2417F8();
  return sub_1AF241810();
}

BOOL static ShouldThrottleConfigFetchResult.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;

  v2 = *a1;
  v3 = *a2;
  if (v2 == 3)
    return v3 == 3;
  if (v3 == 3)
    return 0;
  return v2 == v3;
}

void LocalCachePaths.standard.getter(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_1AF20DC38(v1, a1, (uint64_t *)&unk_1ED32FF80);
}

void LocalCachePaths.legacy.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for LocalCachePaths(0);
  sub_1AF20DC38(v1 + *(int *)(v3 + 20), a1, (uint64_t *)&unk_1ED32FF80);
  OUTLINED_FUNCTION_50();
}

uint64_t type metadata accessor for LocalCachePaths(uint64_t a1)
{
  return sub_1AF20AB0C(a1, (uint64_t *)&unk_1ED32E7E0);
}

void LocalCachePaths.init(standard:legacy:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;

  sub_1AF20AB3C(a1, a3, (uint64_t *)&unk_1ED32FF80);
  v5 = type metadata accessor for LocalCachePaths(0);
  sub_1AF20AB3C(a2, a3 + *(int *)(v5 + 20), (uint64_t *)&unk_1ED32FF80);
  OUTLINED_FUNCTION_49();
}

BOOL static LocalCachePaths.== infix(_:_:)()
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(_QWORD, uint64_t, uint64_t);
  char v35;
  void (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  uint64_t v47;
  char v48;
  void (*v49)(uint64_t);
  uint64_t v50;
  _QWORD v51[2];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  OUTLINED_FUNCTION_83();
  v58 = v1;
  v59 = v2;
  v4 = v3;
  v6 = v5;
  v7 = OUTLINED_FUNCTION_105();
  v57 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_57();
  v51[1] = v9 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33648);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_79();
  v56 = v12;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)v51 - v14;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_99();
  MEMORY[0x1E0C80A78](v17);
  v52 = (uint64_t)v51 - v18;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v19);
  v55 = (uint64_t)v51 - v20;
  OUTLINED_FUNCTION_127();
  v22 = MEMORY[0x1E0C80A78](v21);
  v24 = (char *)v51 - v23;
  v25 = MEMORY[0x1E0C80A78](v22);
  v27 = (char *)v51 - v26;
  MEMORY[0x1E0C80A78](v25);
  v29 = (char *)v51 - v28;
  v53 = v6;
  OUTLINED_FUNCTION_51(v6, (uint64_t)v51 - v28);
  v54 = v4;
  OUTLINED_FUNCTION_51(v4, (uint64_t)v27);
  v30 = (uint64_t)&v15[*(int *)(v10 + 48)];
  OUTLINED_FUNCTION_51((uint64_t)v29, (uint64_t)v15);
  OUTLINED_FUNCTION_51((uint64_t)v27, v30);
  OUTLINED_FUNCTION_24((uint64_t)v15);
  if (v31)
  {
    OUTLINED_FUNCTION_33((uint64_t)v27);
    OUTLINED_FUNCTION_33((uint64_t)v29);
    OUTLINED_FUNCTION_24(v30);
    if (v31)
    {
      sub_1AF209710((uint64_t)v15, (uint64_t *)&unk_1ED32FF80);
      goto LABEL_11;
    }
LABEL_9:
    v32 = (uint64_t)v15;
LABEL_20:
    sub_1AF209710(v32, &qword_1EEE33648);
    return 0;
  }
  sub_1AF20DC38((uint64_t)v15, (uint64_t)v24, (uint64_t *)&unk_1ED32FF80);
  OUTLINED_FUNCTION_24(v30);
  if (v31)
  {
    OUTLINED_FUNCTION_134((uint64_t)v27);
    OUTLINED_FUNCTION_134((uint64_t)v29);
    (*(void (**)(char *, uint64_t))(v57 + 8))(v24, v7);
    goto LABEL_9;
  }
  v33 = v57;
  v34 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v57 + 32);
  v51[0] = v0;
  OUTLINED_FUNCTION_93(v34);
  sub_1AF209868((unint64_t *)&unk_1EEE33650, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0028]);
  v35 = OUTLINED_FUNCTION_153();
  v36 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
  v37 = v0;
  v0 = v51[0];
  v36(v37, v7);
  OUTLINED_FUNCTION_33((uint64_t)v27);
  OUTLINED_FUNCTION_33((uint64_t)v29);
  v36((uint64_t)v24, v7);
  OUTLINED_FUNCTION_33((uint64_t)v15);
  if ((v35 & 1) == 0)
    return 0;
LABEL_11:
  v38 = type metadata accessor for LocalCachePaths(0);
  v39 = v55;
  OUTLINED_FUNCTION_51(v53 + *(int *)(v38 + 20), v55);
  v40 = v52;
  OUTLINED_FUNCTION_51(v54 + *(int *)(v38 + 20), v52);
  v41 = v56;
  v42 = v56 + *(int *)(v10 + 48);
  OUTLINED_FUNCTION_51(v39, v56);
  OUTLINED_FUNCTION_51(v40, v42);
  OUTLINED_FUNCTION_24(v41);
  if (!v31)
  {
    sub_1AF20DC38(v41, v0, (uint64_t *)&unk_1ED32FF80);
    OUTLINED_FUNCTION_24(v42);
    if (!v43)
    {
      v47 = v57;
      OUTLINED_FUNCTION_93(*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v57 + 32));
      sub_1AF209868((unint64_t *)&unk_1EEE33650, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0028]);
      v48 = OUTLINED_FUNCTION_153();
      v49 = *(void (**)(uint64_t))(v47 + 8);
      v50 = OUTLINED_FUNCTION_167();
      v49(v50);
      OUTLINED_FUNCTION_33(v40);
      OUTLINED_FUNCTION_33(v39);
      ((void (*)(uint64_t, uint64_t))v49)(v0, v7);
      OUTLINED_FUNCTION_33(v41);
      return (v48 & 1) != 0;
    }
    OUTLINED_FUNCTION_134(v40);
    OUTLINED_FUNCTION_134(v39);
    v44 = OUTLINED_FUNCTION_167();
    v45(v44);
    goto LABEL_19;
  }
  OUTLINED_FUNCTION_33(v40);
  OUTLINED_FUNCTION_33(v39);
  OUTLINED_FUNCTION_24(v42);
  if (!v31)
  {
LABEL_19:
    v32 = v41;
    goto LABEL_20;
  }
  sub_1AF209710(v41, (uint64_t *)&unk_1ED32FF80);
  return 1;
}

void sub_1AF20E8DC()
{
  OUTLINED_FUNCTION_149(&qword_1ED330228);
}

void sub_1AF20E900()
{
  qword_1ED3301E0 = 0x40CC200000000000;
}

void sub_1AF20E914()
{
  qword_1ED3301D8 = 0x4082C00000000000;
}

uint64_t sub_1AF20E928()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_9_0();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = OUTLINED_FUNCTION_80();
    sub_1AF20EE78(v1, v2);
    return OUTLINED_FUNCTION_85();
  }
  return result;
}

void sub_1AF20E988()
{
  OUTLINED_FUNCTION_146();
}

void sub_1AF20E9A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t v4;

  if (!a1
    || (v2 = *(_QWORD *)(v1 + 232),
        ObjectType = swift_getObjectType(),
        LOBYTE(v2) = OUTLINED_FUNCTION_145(ObjectType, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16)),
        OUTLINED_FUNCTION_88(),
        (v2 & 1) != 0))
  {
    v4 = OUTLINED_FUNCTION_22();
    swift_weakInit();
    OUTLINED_FUNCTION_141();
    sub_1AF212B54((uint64_t)&unk_1EEE337D0, v4);
    swift_release_n();
  }
  OUTLINED_FUNCTION_49();
}

uint64_t sub_1AF20EA10(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = a1;
  return swift_task_switch();
}

uint64_t sub_1AF20EA28()
{
  uint64_t v0;

  OUTLINED_FUNCTION_5();
  if (OUTLINED_FUNCTION_62())
    sub_1AF20EA90();
  return OUTLINED_FUNCTION_59(0, 0, *(uint64_t (**)(void))(v0 + 8));
}

void sub_1AF20EA90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  MEMORY[0x1E0C80A78](v0);
  v1 = type metadata accessor for LocalCachePaths(0);
  MEMORY[0x1E0C80A78](v1);
  v2 = sub_1AF240E2C();
  MEMORY[0x1E0C80A78](v2);
  sub_1AF20FFEC();
}

uint64_t sub_1AF20EB68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
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
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v30;
  os_log_type_t v31;
  uint8_t *v32;
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
  uint64_t v43;
  uint64_t v44;

  sub_1AF20DC38(v6, v3, v4);
  sub_1AF20A7D4(v6, v5);
  if (__swift_getEnumTagSinglePayload(v3, 1, v0) == 1)
  {
    sub_1AF209710(v3, (uint64_t *)&unk_1ED32FF80);
    if (qword_1ED32E488 != -1)
      swift_once();
    v8 = sub_1AF2411B0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1ED32E560);
    v9 = sub_1AF241198();
    v10 = sub_1AF2414A4();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1AF203000, v9, v10, "ConfigDebug: pathToCache=nil", v11, 2u);
      MEMORY[0x1AF45A8C4](v11, -1, -1);
    }

  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v1, v3, v0);
    v12 = *(void **)(v2 + 128);
    v13 = (void *)sub_1AF240DA8();
    v14 = (void *)sub_1AF24124C();
    v15 = objc_msgSend(v12, sel_loadWithUrl_userAgent_userDefaults_, v13, v14, 0);

    if (v15
      || (sub_1AF21017C(v16, v17, v18, v19, v20, v21, v22, v23, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43,
            v44),
          v24))
    {
      if (qword_1ED32E488 != -1)
        swift_once();
      v25 = sub_1AF2411B0();
      __swift_project_value_buffer(v25, (uint64_t)qword_1ED32E560);
      v26 = sub_1AF241198();
      v27 = sub_1AF241498();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_1AF203000, v26, v27, "Loaded config from disk cache", v28, 2u);
        MEMORY[0x1AF45A8C4](v28, -1, -1);
      }
    }
    else
    {
      if (qword_1ED32E488 != -1)
        swift_once();
      v30 = sub_1AF2411B0();
      __swift_project_value_buffer(v30, (uint64_t)qword_1ED32E560);
      v26 = sub_1AF241198();
      v31 = sub_1AF2414A4();
      if (os_log_type_enabled(v26, v31))
      {
        v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_1AF203000, v26, v31, "ConfigDebug: cachedConfig=nil", v32, 2u);
        MEMORY[0x1AF45A8C4](v32, -1, -1);
      }
    }

    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v0);
  }
  return 0;
}

uint64_t sub_1AF20EE78(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  Class isa;
  uint64_t ObjectType;
  uint64_t v16;
  uint64_t v17;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E980);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_57();
  v9 = v8 - v7;
  if (qword_1ED32E488 != -1)
    swift_once();
  v10 = OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_17(v10, (uint64_t)qword_1ED32E560);
  v11 = OUTLINED_FUNCTION_117();
  if (OUTLINED_FUNCTION_58(v11))
  {
    v12 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(_WORD *)v12 = 0;
    OUTLINED_FUNCTION_21(&dword_1AF203000, v2, v3, "Configuration changed", v12);
    OUTLINED_FUNCTION_1();
  }

  if (MEMORY[0x1AF45A960](&v2[28]))
  {
    isa = v2[29].isa;
    ObjectType = swift_getObjectType();
    (*((void (**)(uint64_t, uint64_t, uint64_t, Class))isa + 1))(a1, a2, ObjectType, isa);
    return swift_unknownObjectRelease();
  }
  else
  {
    v16 = sub_1AF241420();
    OUTLINED_FUNCTION_92(v16);
    v17 = OUTLINED_FUNCTION_22();
    *(_QWORD *)(v17 + 16) = 0;
    *(_QWORD *)(v17 + 24) = 0;
    sub_1AF21F934(v9, (uint64_t)&unk_1EEE337C0, v17);
    return swift_release();
  }
}

uint64_t sub_1AF20EFE4()
{
  return swift_task_switch();
}

uint64_t sub_1AF20EFF8()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_1EEE33570 != -1)
    swift_once();
  OUTLINED_FUNCTION_9_0();
  objc_msgSend(v1, sel_postNotificationName_object_userInfo_, qword_1EEE33A00, 0, 0);

  return OUTLINED_FUNCTION_84(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF20F098(uint64_t a1)
{
  OUTLINED_FUNCTION_69(a1);
  return OUTLINED_FUNCTION_30_0();
}

uint64_t sub_1AF20F0B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __n128 v12;
  _QWORD *v13;
  _OWORD *v14;

  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_169();
  OUTLINED_FUNCTION_61();
  v1 = OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_66(v1, v2, v3);
  OUTLINED_FUNCTION_65(v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 224) = v13;
  v14 = (_OWORD *)OUTLINED_FUNCTION_164(v13, (uint64_t)sub_1AF20F138);
  return OUTLINED_FUNCTION_73(v14, 2, 0, 2, 0);
}

uint64_t sub_1AF20F138(char a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_26(a1, a2);
  if (!v3)
    *(_BYTE *)(v4 + 123) = v2;
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_12_0();
}

uint64_t sub_1AF20F180()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  unsigned int v4;
  int v5;
  char v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  uint64_t v16;

  v1 = *(void **)(v0 + 232);
  *(_QWORD *)(v0 + 128) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC40);
  if (swift_dynamicCast())
  {

    v3 = *(void **)(v0 + 112);
    v4 = *(unsigned __int8 *)(v0 + 120);
    v5 = *(unsigned __int8 *)(v0 + 121);
    v6 = sub_1AF20E0D8((char)v3, v4 | (v5 << 8));
    if (v6 == 1)
      *(_BYTE *)(*(_QWORD *)(v0 + 216) + qword_1ED32E818) = 1;
    *(_BYTE *)(*(_QWORD *)(v0 + 216) + qword_1ED32E820) = v6;
    sub_1AF20E11C((uint64_t)v3, v4 | (v5 << 8));
    swift_willThrow();
    sub_1AF2199F8(v3, v4, v5);

    sub_1AF20BDB4();
    swift_release();
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 216);

    *(_BYTE *)(v7 + qword_1ED32E820) = 24;
    if (qword_1ED32E488 != -1)
      swift_once();
    v8 = *(void **)(v0 + 232);
    v9 = OUTLINED_FUNCTION_19();
    v10 = __swift_project_value_buffer(v9, (uint64_t)qword_1ED32E560);
    v11 = v8;
    v12 = v8;
    sub_1AF241198();
    v13 = OUTLINED_FUNCTION_156();
    if (OUTLINED_FUNCTION_34(v13))
    {
      v14 = (uint8_t *)OUTLINED_FUNCTION_4();
      v15 = (_QWORD *)OUTLINED_FUNCTION_4();
      *(_DWORD *)v14 = 138412290;
      OUTLINED_FUNCTION_126();
      v16 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 136) = v16;
      sub_1AF24157C();
      *v15 = v16;
      OUTLINED_FUNCTION_56();
      OUTLINED_FUNCTION_56();
      OUTLINED_FUNCTION_87(&dword_1AF203000, v10, (os_log_type_t)v10, "Unexpected error type. Error: %@", v14);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33E80);
      OUTLINED_FUNCTION_113();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_56();

    swift_willThrow();
    sub_1AF20BDB4();
    OUTLINED_FUNCTION_15();
  }
  sub_1AF20C030();
  return OUTLINED_FUNCTION_32(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF20F3F4(_OWORD *a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  *(_QWORD *)(v6 + 104) = a3;
  *(_QWORD *)(v6 + 112) = v5;
  *(_BYTE *)(v6 + 193) = a5;
  *(_BYTE *)(v6 + 192) = a4;
  *(_QWORD *)(v6 + 96) = a2;
  v7 = a1[1];
  *(_OWORD *)(v6 + 16) = *a1;
  *(_OWORD *)(v6 + 32) = v7;
  v8 = a1[3];
  *(_OWORD *)(v6 + 48) = a1[2];
  *(_OWORD *)(v6 + 64) = v8;
  return swift_task_switch();
}

uint64_t sub_1AF20F428()
{
  os_log_type_t v0;
  uint8_t *v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  os_log_type_t v5;
  _WORD *v6;
  uint64_t v7;
  uint64_t *v8;
  _QWORD *v10;

  v3 = *(NSObject **)(*(_QWORD *)(v2 + 112) + 200);
  *(_QWORD *)(v2 + 120) = v3;
  if (sub_1AF2256AC())
  {
    if (qword_1ED32E488 != -1)
      swift_once();
    v4 = OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_17(v4, (uint64_t)qword_1ED32E560);
    v5 = OUTLINED_FUNCTION_63();
    if (OUTLINED_FUNCTION_31(v5))
    {
      v6 = (_WORD *)OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_76(v6);
      OUTLINED_FUNCTION_21(&dword_1AF203000, v3, v0, "Early exiting task with timeoutWaitingOnConnection error", v1);
      OUTLINED_FUNCTION_1();
    }

    sub_1AF219B88();
    v7 = OUTLINED_FUNCTION_8();
    sub_1AF21944C();
    OUTLINED_FUNCTION_8();
    *v8 = v7;
    OUTLINED_FUNCTION_18((uint64_t)v8, 129);
    return OUTLINED_FUNCTION_60(*(uint64_t (**)(void))(v2 + 8));
  }
  else
  {
    *(_QWORD *)(v2 + 128) = *(_QWORD *)(*(_QWORD *)(v2 + 112) + 208);
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v2 + 136) = v10;
    *v10 = v2;
    v10[1] = sub_1AF20F55C;
    return sub_1AF212A60();
  }
}

uint64_t sub_1AF20F55C()
{
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1AF20F590()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_BYTE *)(v0 + 193);
  v3 = *(_QWORD *)(v0 + 96);
  v4 = *(_BYTE *)(v0 + 192);
  v5 = OUTLINED_FUNCTION_22();
  *(_QWORD *)(v0 + 144) = v5;
  swift_weakInit();
  v6 = OUTLINED_FUNCTION_22();
  *(_QWORD *)(v0 + 152) = v6;
  *(_QWORD *)(v6 + 16) = v5;
  *(_BYTE *)(v6 + 24) = v2;
  v7 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v6 + 32) = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v6 + 48) = v7;
  v8 = *(_OWORD *)(v0 + 64);
  *(_OWORD *)(v6 + 64) = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v6 + 80) = v8;
  *(_QWORD *)(v6 + 96) = v3;
  *(_QWORD *)(v6 + 104) = v1;
  *(_BYTE *)(v6 + 112) = v4;
  swift_retain();
  sub_1AF219B40(v0 + 16);
  v9 = OUTLINED_FUNCTION_160();
  sub_1AF21986C(v9, v10, v4);
  OUTLINED_FUNCTION_157();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_1AF20F660()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  _QWORD *v5;
  _QWORD *v7;

  v1 = sub_1AF212594((uint64_t)&unk_1EEE337F8, *(_QWORD *)(v0 + 152));
  v3 = v2;
  v4 = v2 & 1;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_85();
  *(_QWORD *)(v0 + 160) = v1;
  *(_BYTE *)(v0 + 194) = v4;
  if ((v3 & 1) != 0)
  {
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 168) = v5;
    *v5 = v0;
    v5[1] = sub_1AF20F754;
    return sub_1AF225720();
  }
  else
  {
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC40);
    *v7 = v0;
    v7[1] = sub_1AF20F8F8;
    return OUTLINED_FUNCTION_74();
  }
}

uint64_t sub_1AF20F754(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 195) = a1;
  OUTLINED_FUNCTION_177();
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1AF20F7A0()
{
  os_log_type_t v0;
  NSObject *v1;
  uint8_t *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  os_log_type_t v7;
  _WORD *v8;
  uint64_t v9;
  uint64_t *v10;

  if ((*(_BYTE *)(v3 + 195) & 1) != 0)
  {
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v3 + 176) = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC40);
    *v4 = v3;
    v4[1] = sub_1AF20F8F8;
    return OUTLINED_FUNCTION_74();
  }
  else
  {
    if (qword_1ED32E488 != -1)
      swift_once();
    v6 = OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_17(v6, (uint64_t)qword_1ED32E560);
    v7 = OUTLINED_FUNCTION_156();
    if (OUTLINED_FUNCTION_31(v7))
    {
      v8 = (_WORD *)OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_76(v8);
      OUTLINED_FUNCTION_21(&dword_1AF203000, v1, v0, "Request timeout has passed, exiting additional tasks", v2);
      OUTLINED_FUNCTION_1();
    }

    sub_1AF219B88();
    v9 = OUTLINED_FUNCTION_8();
    sub_1AF21944C();
    OUTLINED_FUNCTION_8();
    *v10 = v9;
    OUTLINED_FUNCTION_18((uint64_t)v10, 129);
    OUTLINED_FUNCTION_15();
    return OUTLINED_FUNCTION_53(*(uint64_t (**)(void))(v3 + 8));
  }
}

uint64_t sub_1AF20F8F8()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_52();
  *v2 = *v1;
  *(_QWORD *)(v3 + 184) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1AF20F948()
{
  uint64_t v0;
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(v0 + 194);
  swift_release();
  if (v1)
    v2 = 1;
  else
    v2 = *(unsigned __int8 *)(v0 + 80);
  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v2, *(_QWORD *)(v0 + 88));
}

uint64_t sub_1AF20F990()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(v0 + 184);
  if (*(_BYTE *)(v0 + 194) == 1)
  {
    sub_1AF21944C();
    OUTLINED_FUNCTION_8();
    *v2 = v1;
    OUTLINED_FUNCTION_18((uint64_t)v2, 129);
  }
  else
  {
    swift_willThrow();
  }
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_60(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF20FA00()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_158(v4);
  *(_QWORD *)(v3 + 264) = v1;
  swift_task_dealloc();
  if (v1)
  {
    sub_1AF219830(*(_QWORD *)(v3 + 240), *(_QWORD *)(v3 + 248), *(_BYTE *)(v3 + 296));
  }
  else
  {
    v5 = *(_QWORD *)(v3 + 240);
    v6 = *(_QWORD *)(v3 + 248);
    *(_QWORD *)(v3 + 272) = v2;
    *(_BYTE *)(v3 + 297) = v0;
    sub_1AF219830(v5, v6, *(_BYTE *)(v3 + 296));
  }
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_1AF20FA78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_unknownObjectRelease();
  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(unsigned __int8 *)(v0 + 297);
  swift_task_dealloc();
  return OUTLINED_FUNCTION_39(v2, v1, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF20FAC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_158(v5);
  *(_QWORD *)(v4 + 288) = v1;
  swift_task_dealloc();
  if (v1)
  {
    OUTLINED_FUNCTION_11_0();
    return OUTLINED_FUNCTION_2();
  }
  else
  {
    swift_task_dealloc();
    return OUTLINED_FUNCTION_39(v0, v2, *(uint64_t (**)(void))(v3 + 8));
  }
}

uint64_t sub_1AF20FB30()
{
  uint64_t v0;

  OUTLINED_FUNCTION_152();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF20FB58()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_152();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1AF20FB88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;

  type metadata accessor for LocalCachePaths(0);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_57();
  if (MEMORY[0x1AF45A960](v0 + 224))
  {
    v2 = *(_QWORD *)(v0 + 232);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v2 + 16))(ObjectType, v2);
    swift_unknownObjectRelease();
  }
  sub_1AF20FFEC();
}

uint64_t sub_1AF20FC28()
{
  char v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  sub_1AF20FC90(v4, v6, v2, v1, v5, v0 & 1, v3);
  sub_1AF20A7D4(v3, type metadata accessor for LocalCachePaths);
  return OUTLINED_FUNCTION_80();
}

size_t sub_1AF20FC90(uint64_t a1, _QWORD *a2, uint64_t a3, _QWORD *a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  size_t v23;
  unint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;

  if (qword_1ED32E488 != -1)
    swift_once();
  v13 = sub_1AF2411B0();
  __swift_project_value_buffer(v13, (uint64_t)qword_1ED32E560);
  swift_bridgeObjectRetain_n();
  v14 = sub_1AF241198();
  v15 = sub_1AF241498();
  if (os_log_type_enabled(v14, v15))
  {
    v28 = a3;
    v16 = (uint8_t *)swift_slowAlloc();
    v29 = a5;
    v17 = swift_slowAlloc();
    v31 = v17;
    *(_DWORD *)v16 = 136315138;
    swift_bridgeObjectRetain();
    v18 = sub_1AF241204();
    v27 = a6;
    v20 = v19;
    swift_bridgeObjectRelease();
    sub_1AF208AF4(v18, v20, &v31);
    sub_1AF24157C();
    swift_bridgeObjectRelease_n();
    a6 = v27;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1AF203000, v14, v15, "saving config: %s", v16, 0xCu);
    swift_arrayDestroy();
    v21 = v17;
    a5 = v29;
    MEMORY[0x1AF45A8C4](v21, -1, -1);
    v22 = v16;
    a3 = v28;
    MEMORY[0x1AF45A8C4](v22, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v23 = sub_1AF214B20(a1, a2, a3, a4, a5, a6 & 1, a7);
  if (v24 >> 60 == 15)
  {
    sub_1AF21944C();
    swift_allocError();
    *(_QWORD *)v25 = 4;
    *(_WORD *)(v25 + 8) = 256;
    swift_willThrow();
  }
  return v23;
}

BOOL sub_1AF20FF2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  uint64_t v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = *(_QWORD *)(v1 + 152);
  v4 = *(_BYTE *)(v1 + 160);
  v5 = *(_QWORD *)(v1 + 168);
  v6 = *(_QWORD *)(v1 + 176);
  v7 = *(_QWORD *)(v1 + 184);
  v8 = *(_QWORD *)(v1 + 192);
  v16 = *(_OWORD *)(v1 + 136);
  v17 = v3;
  v18 = v4;
  v19 = v5;
  v20 = v6;
  v21 = v7;
  v22 = v8;
  OUTLINED_FUNCTION_163();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_118();
  v9 = sub_1AF20A21C(a1, (uint64_t *)&v16);
  v11 = v10;
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_95();
  if ((v11 & 0x80) == 0)
    return v9 != 1;
  v13 = OUTLINED_FUNCTION_80();
  sub_1AF219830(v13, v14, v15);
  return 1;
}

uint64_t sub_1AF20FFE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AF20CD88(v1 + 80, a1);
}

void sub_1AF20FFEC()
{
  OUTLINED_FUNCTION_146();
}

void sub_1AF210004(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;

  if (a1)
  {
    v3 = *(_QWORD *)(v2 + 232);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v3 + 48))(ObjectType, v3);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_1AF210050(v1);
    OUTLINED_FUNCTION_49();
  }
}

void sub_1AF210050(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_99();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v14 - v5;
  sub_1AF208F4C();
  v7 = OUTLINED_FUNCTION_105();
  v8 = OUTLINED_FUNCTION_166();
  v10 = OUTLINED_FUNCTION_35(v8, v9, v7);
  if (v11)
  {
    OUTLINED_FUNCTION_168(v10, (uint64_t *)&unk_1ED32FF80);
    v12 = 1;
  }
  else
  {
    if (qword_1ED32EBE0 != -1)
      swift_once();
    sub_1AF240DB4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v1, v7);
    v12 = 0;
  }
  OUTLINED_FUNCTION_37((uint64_t)v6, v12);
  v13 = type metadata accessor for LocalCachePaths(0);
  OUTLINED_FUNCTION_37(a1 + *(int *)(v13 + 20), 1);
  sub_1AF20AB3C((uint64_t)v6, a1, (uint64_t *)&unk_1ED32FF80);
}

void sub_1AF21017C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  char v41;
  uint64_t ObjCClassFromMetadata;
  id v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  id v53;
  uint64_t v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  _WORD *v62;
  uint64_t v63;
  os_log_type_t v64;
  uint8_t *v65;

  OUTLINED_FUNCTION_83();
  a19 = v22;
  a20 = v23;
  v24 = v20;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v25);
  OUTLINED_FUNCTION_57();
  v28 = v27 - v26;
  v29 = OUTLINED_FUNCTION_105();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  OUTLINED_FUNCTION_98();
  MEMORY[0x1E0C80A78](v31);
  v33 = (uint8_t *)&a9 - v32;
  v34 = v20[13];
  v35 = v20[14];
  __swift_project_boxed_opaque_existential_1(v20 + 10, v34);
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v35);
  if (v36 && (v37 = sub_1AF2412C4(), v39 = v38, OUTLINED_FUNCTION_122(), v39))
  {
    v40 = v37 == 20035 && v39 == 0xE200000000000000;
    if (v40)
      v41 = 1;
    else
      v41 = OUTLINED_FUNCTION_64();
    OUTLINED_FUNCTION_46();
  }
  else
  {
    v41 = 0;
  }
  type metadata accessor for PegasusConfigController();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v43 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  if ((v41 & 1) != 0)
    v44 = 0x64656C6261736964;
  else
    v44 = 0x746C7561666564;
  if ((v41 & 1) != 0)
    v45 = 0xE800000000000000;
  else
    v45 = 0xE700000000000000;
  v46 = sub_1AF2197A0(v44, v45, 0x7473696C70, 0xE500000000000000, v43);

  if (v46)
  {
    sub_1AF240DD8();

    v46 = *(id *)(v30 + 32);
    ((void (*)(uint64_t, uint64_t, uint64_t))v46)(v28, v21, v29);
    OUTLINED_FUNCTION_137(v28, 0);
    v47 = OUTLINED_FUNCTION_166();
    v49 = OUTLINED_FUNCTION_35(v47, v48, v29);
    if (!v40)
    {
      ((void (*)(uint8_t *, uint64_t, uint64_t))v46)(v33, v28, v29);
      v50 = (void *)v24[16];
      v51 = sub_1AF240DA8();
      v52 = (void *)sub_1AF24124C();
      v53 = objc_msgSend(v50, sel_loadWithUrl_userAgent_userDefaults_, v51, v52, 0);

      if (v53)
      {
        if (qword_1ED32E488 != -1)
          swift_once();
        v54 = OUTLINED_FUNCTION_19();
        OUTLINED_FUNCTION_17(v54, (uint64_t)qword_1ED32E560);
        v55 = OUTLINED_FUNCTION_117();
        if (os_log_type_enabled(v51, v55))
        {
          v56 = (uint8_t *)OUTLINED_FUNCTION_4();
          *(_WORD *)v56 = 0;
          OUTLINED_FUNCTION_21(&dword_1AF203000, v51, v55, "Bundled config load complete", v56);
          OUTLINED_FUNCTION_1();
        }
      }
      else
      {
        if (qword_1ED32E488 != -1)
          swift_once();
        v63 = OUTLINED_FUNCTION_19();
        OUTLINED_FUNCTION_17(v63, (uint64_t)qword_1ED32E560);
        v64 = OUTLINED_FUNCTION_63();
        if (os_log_type_enabled(v51, v64))
        {
          v65 = (uint8_t *)OUTLINED_FUNCTION_4();
          *(_WORD *)v65 = 0;
          OUTLINED_FUNCTION_21(&dword_1AF203000, v51, v64, "Bundled config is not in plist format", v65);
          OUTLINED_FUNCTION_1();
        }
      }

      OUTLINED_FUNCTION_129();
      goto LABEL_31;
    }
  }
  else
  {
    v57 = OUTLINED_FUNCTION_166();
    v49 = OUTLINED_FUNCTION_137(v57, v58);
  }
  OUTLINED_FUNCTION_168(v49, (uint64_t *)&unk_1ED32FF80);
  if (qword_1ED32E488 != -1)
    swift_once();
  v59 = OUTLINED_FUNCTION_19();
  v60 = OUTLINED_FUNCTION_17(v59, (uint64_t)qword_1ED32E560);
  v61 = sub_1AF2414B0();
  if (OUTLINED_FUNCTION_119(v61))
  {
    v62 = (_WORD *)OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_76(v62);
    OUTLINED_FUNCTION_21(&dword_1AF203000, v60, (os_log_type_t)v46, "Bundle is missing config.plist", v33);
    OUTLINED_FUNCTION_1();
  }

LABEL_31:
  OUTLINED_FUNCTION_78();
}

void sub_1AF210568()
{
  uint64_t v0;

  OUTLINED_FUNCTION_171();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 40);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 80);

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_27();
  swift_release();
  swift_release();
  swift_release();
  sub_1AF205B50(v0 + 224);
  swift_release();
  OUTLINED_FUNCTION_49();
}

uint64_t sub_1AF2105F0()
{
  sub_1AF210568();
  return swift_deallocClassInstance();
}

uint64_t sub_1AF210618(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17[3];
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_BYTE *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(v1 + 240);
  v9 = *(os_unfair_lock_s **)(*(_QWORD *)(v8 + 24) + 16);
  OUTLINED_FUNCTION_141();
  os_unfair_lock_lock(v9);
  v10 = *(_QWORD *)(v8 + 16);
  swift_unknownObjectRetain();
  os_unfair_lock_unlock(v9);
  OUTLINED_FUNCTION_85();
  if (!v10)
    return 0;
  v17[0] = v2;
  v17[1] = v3;
  v17[2] = v4;
  v18 = v5;
  v19 = v6;
  v20 = v7;
  v21 = v16;
  v22 = v15;
  v11 = sub_1AF20A21C(v10, v17);
  if ((v13 & 0x80) == 0)
    __asm { BR              X10 }
  sub_1AF219830(v11, v12, v13);
  OUTLINED_FUNCTION_36();
  return 0;
}

uint64_t sub_1AF210718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 104) = a4;
  *(_QWORD *)(v5 + 112) = a5;
  return swift_task_switch();
}

uint64_t sub_1AF210730()
{
  uint64_t v0;
  uint64_t v1;
  __int128 *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _QWORD *v7;

  OUTLINED_FUNCTION_5();
  v1 = OUTLINED_FUNCTION_62();
  *(_QWORD *)(v0 + 120) = v1;
  if (!v1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  if (sub_1AF225660())
  {
    OUTLINED_FUNCTION_15();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v3 = *(__int128 **)(v0 + 112);
  v4 = v3[3];
  v6 = *v3;
  v5 = v3[1];
  *(_OWORD *)(v0 + 48) = v3[2];
  *(_OWORD *)(v0 + 64) = v4;
  *(_OWORD *)(v0 + 16) = v6;
  *(_OWORD *)(v0 + 32) = v5;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v7;
  *v7 = v0;
  v7[1] = sub_1AF2107E8;
  return sub_1AF20F3F4((_OWORD *)(v0 + 16), 1, 0, 2, 1);
}

uint64_t sub_1AF2107E8()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_52();
  *v2 = *v1;
  *(_QWORD *)(v3 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_1AF210844()
{
  uint64_t v0;

  swift_release();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF210870()
{
  uint64_t v0;

  swift_release();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF21089C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1AF2108AC(a1, a2, a3);
}

uint64_t sub_1AF2108AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E980);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_131();
  v6 = OUTLINED_FUNCTION_167();
  sub_1AF20DC38(v6, v7, (uint64_t *)&unk_1ED32E980);
  v8 = OUTLINED_FUNCTION_135();
  v9 = OUTLINED_FUNCTION_35(v3, 1, v8);
  if (v10)
  {
    OUTLINED_FUNCTION_77(v9, (uint64_t *)&unk_1ED32E980);
  }
  else
  {
    sub_1AF241414();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v3, v8);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1AF2413E4();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void sub_1AF2109F4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  v1 = OUTLINED_FUNCTION_91();
  v2 = OUTLINED_FUNCTION_41(v1, sel_valueForKey_);
  OUTLINED_FUNCTION_102();
  if (v0)
  {
    OUTLINED_FUNCTION_45();
    v3 = OUTLINED_FUNCTION_36();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_115();
  }
  OUTLINED_FUNCTION_44(v3, v4, &qword_1ED32F808, v5, v6, v7);
  if (v16)
  {
    sub_1AF20C87C(0, (unint64_t *)&qword_1ED32F800);
    if ((OUTLINED_FUNCTION_42() & 1) != 0)
    {
      objc_msgSend(v15, sel_BOOLValue);

    }
  }
  else
  {
    OUTLINED_FUNCTION_90(v8, &qword_1ED32F808, v9, v10, v11, v12, v13, v14);
  }
  OUTLINED_FUNCTION_110();
}

uint64_t sub_1AF210AC0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  *(_BYTE *)(v6 + 169) = a6;
  *(_QWORD *)(v6 + 120) = a4;
  *(_QWORD *)(v6 + 128) = a5;
  *(_BYTE *)(v6 + 168) = a2;
  *(_QWORD *)(v6 + 104) = a1;
  *(_QWORD *)(v6 + 112) = a3;
  return swift_task_switch();
}

uint64_t sub_1AF210AE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _QWORD *v11;
  _QWORD *v12;

  OUTLINED_FUNCTION_5();
  v1 = OUTLINED_FUNCTION_62();
  *(_QWORD *)(v0 + 136) = v1;
  if (v1)
  {
    if ((*(_BYTE *)(v0 + 168) & 1) != 0 && (v2 = sub_1AF210618(*(_QWORD *)(v0 + 112)), v3))
    {
      v4 = v2;
      v5 = v3;
      OUTLINED_FUNCTION_15();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v4, v5);
    }
    else
    {
      v7 = *(__int128 **)(v0 + 112);
      OUTLINED_FUNCTION_61();
      sub_1AF2256E0();
      OUTLINED_FUNCTION_29();
      v8 = *v7;
      v9 = v7[1];
      v10 = v7[3];
      *(_OWORD *)(v0 + 48) = v7[2];
      *(_OWORD *)(v0 + 64) = v10;
      *(_OWORD *)(v0 + 16) = v8;
      *(_OWORD *)(v0 + 32) = v9;
      v11 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 144) = v11;
      *v11 = v0;
      v11[1] = sub_1AF210C0C;
      return sub_1AF210CD8(v0 + 16, *(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128), *(_BYTE *)(v0 + 169));
    }
  }
  else
  {
    sub_1AF21944C();
    OUTLINED_FUNCTION_8();
    *v12 = 7;
    OUTLINED_FUNCTION_18((uint64_t)v12, 256);
    return OUTLINED_FUNCTION_53(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_1AF210C0C()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_158(v4);
  *(_QWORD *)(v3 + 152) = v1;
  swift_task_dealloc();
  if (!v1)
  {
    *(_QWORD *)(v3 + 160) = v2;
    *(_BYTE *)(v3 + 170) = v0;
  }
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_1AF210C6C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_144();
  OUTLINED_FUNCTION_15();
  return OUTLINED_FUNCTION_39(*(unsigned __int8 *)(v0 + 170), *(_QWORD *)(v0 + 160), *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF210CA4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_144();
  OUTLINED_FUNCTION_15();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AF210CD8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v5 + 88) = a3;
  *(_QWORD *)(v5 + 96) = v4;
  *(_BYTE *)(v5 + 328) = a4;
  *(_QWORD *)(v5 + 80) = a2;
  v7 = sub_1AF240C40();
  *(_QWORD *)(v5 + 104) = v7;
  *(_QWORD *)(v5 + 112) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v5 + 120) = swift_task_alloc();
  *(_QWORD *)(v5 + 128) = swift_task_alloc();
  *(_QWORD *)(v5 + 136) = swift_task_alloc();
  v8 = sub_1AF240E2C();
  *(_QWORD *)(v5 + 144) = v8;
  *(_QWORD *)(v5 + 152) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v5 + 160) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  *(_QWORD *)(v5 + 168) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E520);
  *(_QWORD *)(v5 + 176) = swift_task_alloc();
  *(_QWORD *)(v5 + 184) = swift_task_alloc();
  *(_QWORD *)(v5 + 192) = swift_task_alloc();
  *(_QWORD *)(v5 + 200) = swift_task_alloc();
  *(_OWORD *)(v5 + 208) = *(_OWORD *)a1;
  v9 = *(_QWORD *)(a1 + 16);
  *(_BYTE *)(v5 + 329) = *(_BYTE *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v5 + 224) = v9;
  *(_QWORD *)(v5 + 232) = v10;
  *(_OWORD *)(v5 + 240) = *(_OWORD *)(a1 + 40);
  *(_QWORD *)(v5 + 256) = *(_QWORD *)(a1 + 56);
  return swift_task_switch();
}

void sub_1AF210E24()
{
  uint8_t *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _WORD *v5;

  if (qword_1ED32E488 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_19();
  *(_QWORD *)(v1 + 264) = __swift_project_value_buffer(v2, (uint64_t)qword_1ED32E560);
  v3 = sub_1AF241198();
  v4 = sub_1AF2414A4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (_WORD *)OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_76(v5);
    OUTLINED_FUNCTION_21(&dword_1AF203000, v3, v4, "fetching config", v0);
    OUTLINED_FUNCTION_1();
  }

  sub_1AF20BB54();
}

uint64_t sub_1AF2114D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 312) = a1;
  *(_QWORD *)(v3 + 320) = v1;
  OUTLINED_FUNCTION_177();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_88();
  if (v1)
    OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_12_0();
}

uint64_t sub_1AF21155C()
{
  os_log_type_t v0;
  uint8_t *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  _WORD *v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;

  v3 = *(NSObject **)(v2 + 264);
  swift_bridgeObjectRetain_n();
  sub_1AF241198();
  v4 = OUTLINED_FUNCTION_156();
  if (OUTLINED_FUNCTION_34(v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_4();
    v6 = OUTLINED_FUNCTION_4();
    *(_DWORD *)v5 = 136315138;
    v19 = v6;
    OUTLINED_FUNCTION_118();
    v7 = sub_1AF241204();
    v9 = v8;
    OUTLINED_FUNCTION_55();
    *(_QWORD *)(v2 + 40) = sub_1AF208AF4(v7, v9, &v19);
    sub_1AF24157C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_87(&dword_1AF203000, v3, (os_log_type_t)v1, "got config: %s", v5);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }
  swift_bridgeObjectRelease_n();

  if (*(_QWORD *)(v2 + 280))
    sub_1AF20FB88();
  v10 = *(NSObject **)(v2 + 264);
  swift_bridgeObjectRelease();
  sub_1AF241198();
  v11 = OUTLINED_FUNCTION_63();
  if (OUTLINED_FUNCTION_31(v11))
  {
    v12 = (_WORD *)OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_76(v12);
    OUTLINED_FUNCTION_21(&dword_1AF203000, v10, v0, "configCacheRequest failed because of bad url", v1);
    OUTLINED_FUNCTION_1();
  }
  v13 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 288);
  v14 = *(_QWORD *)(v2 + 136);
  v15 = *(_QWORD *)(v2 + 104);

  sub_1AF21944C();
  OUTLINED_FUNCTION_8();
  *v16 = 4;
  OUTLINED_FUNCTION_18((uint64_t)v16, 256);
  v17 = v13(v14, v15);
  OUTLINED_FUNCTION_174(v17, &qword_1ED32E520);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_132();
  OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_165();
  OUTLINED_FUNCTION_159();
  OUTLINED_FUNCTION_123();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_161();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1AF21194C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_148(*(uint64_t (**)(_QWORD, _QWORD))(v0 + 288));
  OUTLINED_FUNCTION_77(v1, &qword_1ED32E520);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_132();
  OUTLINED_FUNCTION_108();
  OUTLINED_FUNCTION_165();
  OUTLINED_FUNCTION_159();
  OUTLINED_FUNCTION_123();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_106();
  OUTLINED_FUNCTION_161();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AF2119D4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v5;

  if (a3)
  {
    if (a3 != 1)
      __asm { BR              X10 }
    v3 = 0x68632E6D61726170;
  }
  else
  {
    v3 = 0x64612E6D61726170;
  }
  v5 = v3;
  sub_1AF24133C();
  return v5;
}

void sub_1AF211A84()
{
  JUMPOUT(0x1AF211A44);
}

void sub_1AF211A9C()
{
  JUMPOUT(0x1AF211A44);
}

void sub_1AF211AB0()
{
  JUMPOUT(0x1AF211A44);
}

void sub_1AF211AD4()
{
  JUMPOUT(0x1AF211A44);
}

uint64_t sub_1AF211AF0(uint64_t a1, uint64_t a2, char a3)
{
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
  uint64_t v17;

  v6 = sub_1AF241138();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF2414EC();
  if (qword_1ED32E7F8 != -1)
    swift_once();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1AF242870;
  v11 = sub_1AF2119D4(a1, a2, a3);
  v13 = v12;
  *(_QWORD *)(v10 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v10 + 64) = sub_1AF20BFF4();
  *(_QWORD *)(v10 + 32) = v11;
  *(_QWORD *)(v10 + 40) = v13;
  v14 = sub_1AF21803C();
  v15 = MEMORY[0x1E0DEB490];
  *(_QWORD *)(v10 + 96) = MEMORY[0x1E0DEB418];
  *(_QWORD *)(v10 + 104) = v15;
  *(_QWORD *)(v10 + 72) = v14;
  sub_1AF24112C();
  sub_1AF2410FC();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1AF211C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  *(_QWORD *)(v6 + 184) = a5;
  *(_QWORD *)(v6 + 192) = a6;
  *(_QWORD *)(v6 + 168) = a2;
  *(_QWORD *)(v6 + 176) = a3;
  *(_QWORD *)(v6 + 160) = a1;
  *(_OWORD *)(v6 + 200) = *(_OWORD *)a4;
  *(_QWORD *)(v6 + 216) = *(_QWORD *)(a4 + 16);
  return swift_task_switch();
}

uint64_t sub_1AF211CB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void (*v9)(uint64_t (*)(void *), _QWORD *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, _QWORD, uint64_t, uint64_t, float);

  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 216);
  v3 = *(_QWORD **)(v0 + 176);
  v21 = *(_QWORD *)(v0 + 200);
  v22 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 160);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E7D8);
  OUTLINED_FUNCTION_22();
  v5 = sub_1AF218E08(0);
  *(_OWORD *)(v0 + 56) = 0u;
  *(_QWORD *)(v0 + 224) = v5;
  *(_OWORD *)(v0 + 72) = 0u;
  v6 = v3[3];
  v7 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v6);
  v8 = (_QWORD *)OUTLINED_FUNCTION_22();
  v8[2] = v5;
  v8[3] = v4;
  v8[4] = v21;
  v8[5] = v1;
  v8[6] = v2;
  v9 = *(void (**)(uint64_t (*)(void *), _QWORD *, uint64_t, uint64_t))(v7 + 8);
  OUTLINED_FUNCTION_61();
  swift_retain();
  OUTLINED_FUNCTION_118();
  v9(sub_1AF219C30, v8, v6, v7);
  v10 = OUTLINED_FUNCTION_15();
  if (v22)
  {
    v11 = *(_QWORD *)(v0 + 192);
    v12 = *(_QWORD *)(v0 + 168);
    v13 = OUTLINED_FUNCTION_89();
    v14 = v0 + 88;
    v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 72))(v12, v13, v11);
    OUTLINED_FUNCTION_142(v15, &qword_1ED32F808);
  }
  else
  {
    OUTLINED_FUNCTION_142(v10, &qword_1ED32F808);
    v14 = v0 + 88;
    *(_OWORD *)(v0 + 88) = 0u;
    *(_OWORD *)(v0 + 104) = 0u;
  }
  sub_1AF20AB3C(v14, v0 + 56, &qword_1ED32F808);
  v16 = *(_QWORD *)(v0 + 40);
  v17 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v16);
  v18 = *MEMORY[0x1E0CB3338];
  v23 = (uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t, float))(**(int **)(v17 + 8) + *(_QWORD *)(v17 + 8));
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 232) = v19;
  *v19 = v0;
  v19[1] = sub_1AF211EB0;
  return v23(v0 + 120, *(_QWORD *)(v0 + 168), v16, v17, v18);
}

uint64_t sub_1AF211EB0()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_52();
  *v2 = *v1;
  *(_QWORD *)(v3 + 240) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1AF211F00()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;

  v1 = *(void **)(v0 + 240);
  v3 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 128);
  v4 = *(void **)(v0 + 136);
  v5 = *(_QWORD *)(v0 + 144);
  v22 = v0 + 56;
  v23 = v3;
  v24 = v2;
  v25 = v4;
  v26 = v5;
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_138();
  v6 = v4;
  swift_bridgeObjectRetain();
  sub_1AF213D4C(&v23);
  if (v1)
  {
    OUTLINED_FUNCTION_16();

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_16();

    OUTLINED_FUNCTION_46();
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
    if (qword_1ED32E488 != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_19();
    v8 = __swift_project_value_buffer(v7, (uint64_t)qword_1ED32E560);
    OUTLINED_FUNCTION_126();
    OUTLINED_FUNCTION_126();
    sub_1AF241198();
    v9 = OUTLINED_FUNCTION_63();
    if (OUTLINED_FUNCTION_58(v9))
    {
      v10 = (uint8_t *)OUTLINED_FUNCTION_4();
      v11 = (_QWORD *)OUTLINED_FUNCTION_4();
      *(_DWORD *)v10 = 138412290;
      OUTLINED_FUNCTION_126();
      v12 = _swift_stdlib_bridgeErrorToNSError();
      OUTLINED_FUNCTION_71(v12);
      *v11 = v12;
      OUTLINED_FUNCTION_56();
      OUTLINED_FUNCTION_56();
      OUTLINED_FUNCTION_87(&dword_1AF203000, v8, (os_log_type_t)(v0 + 16), "error in getting config: %@", v10);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33E80);
      OUTLINED_FUNCTION_113();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_56();
    v13 = *(_QWORD *)(v0 + 184);

    v14 = (void *)sub_1AF2143E0(v1);
    if (v13)
    {
      v15 = *(_QWORD *)(v0 + 192);
      v16 = OUTLINED_FUNCTION_89();
      (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(v15 + 88))(v14, v22, v16, v15);
    }
    if (sub_1AF21447C())
    {
      sub_1AF218278(v1);
      OUTLINED_FUNCTION_29();
    }
    swift_willThrow();

    sub_1AF209710(v22, &qword_1ED32F808);
    if (sub_1AF21447C())
    {
      OUTLINED_FUNCTION_155();
      OUTLINED_FUNCTION_29();
    }
    OUTLINED_FUNCTION_15();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v18 = sub_1AF214200();
    v19 = *(_QWORD *)(v0 + 184);
    OUTLINED_FUNCTION_16();
    if (v19)
    {
      v20 = *(_QWORD *)(v0 + 192);
      v21 = OUTLINED_FUNCTION_89();
      v23 = v3;
      v24 = v2;
      v25 = v4;
      v26 = v5;
      OUTLINED_FUNCTION_140((uint64_t)&v23, v22, v21, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 80));
    }
    OUTLINED_FUNCTION_16();

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_16();

    OUTLINED_FUNCTION_46();
    sub_1AF209710(v22, &qword_1ED32F808);
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
    if (sub_1AF21447C())
    {
      OUTLINED_FUNCTION_155();
      OUTLINED_FUNCTION_29();
    }
    OUTLINED_FUNCTION_15();
    return (*(uint64_t (**)(id))(v0 + 8))(v18);
  }
}

uint64_t sub_1AF212234()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v19;

  v2 = *(_QWORD *)(v0 + 240);
  v3 = (void *)sub_1AF240D60();
  v4 = sub_1AF22EB3C();

  LOBYTE(v3) = v4 | 0x80;
  sub_1AF21944C();
  v5 = (void *)OUTLINED_FUNCTION_8();
  *(_QWORD *)v6 = v2;
  *(_BYTE *)(v6 + 8) = (_BYTE)v3;
  *(_BYTE *)(v6 + 9) = 0;
  swift_willThrow();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  if (qword_1ED32E488 != -1)
    swift_once();
  v7 = OUTLINED_FUNCTION_19();
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_1ED32E560);
  OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_81();
  sub_1AF241198();
  v9 = OUTLINED_FUNCTION_63();
  if (OUTLINED_FUNCTION_58(v9))
  {
    v10 = (uint8_t *)OUTLINED_FUNCTION_4();
    v11 = (_QWORD *)OUTLINED_FUNCTION_4();
    *(_DWORD *)v10 = 138412290;
    OUTLINED_FUNCTION_81();
    v12 = _swift_stdlib_bridgeErrorToNSError();
    OUTLINED_FUNCTION_71(v12);
    *v11 = v12;
    OUTLINED_FUNCTION_133();
    OUTLINED_FUNCTION_133();
    OUTLINED_FUNCTION_87(&dword_1AF203000, v8, v1, "error in getting config: %@", v10);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33E80);
    OUTLINED_FUNCTION_113();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_133();
  OUTLINED_FUNCTION_133();
  v13 = *(_QWORD *)(v0 + 184);

  v14 = (void *)sub_1AF2143E0(v5);
  if (v13)
  {
    OUTLINED_FUNCTION_89();
    v15 = OUTLINED_FUNCTION_160();
    OUTLINED_FUNCTION_140(v15, v16, v17, v18);
  }
  if (sub_1AF21447C())
  {
    sub_1AF218278(v5);
    OUTLINED_FUNCTION_29();
  }
  swift_willThrow();

  OUTLINED_FUNCTION_168(v19, &qword_1ED32F808);
  if (sub_1AF21447C())
  {
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_29();
  }
  OUTLINED_FUNCTION_85();
  return OUTLINED_FUNCTION_32(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1AF212448(void (*a1)(os_unfair_lock_s *))
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;

  v3 = *(os_unfair_lock_s **)(v1 + 16);
  v4 = v3 + 4;
  v5 = v3 + 6;
  os_unfair_lock_lock(v3 + 6);
  a1(v4);
  os_unfair_lock_unlock(v5);
}

void sub_1AF21249C(uint64_t a1)
{
  uint64_t v1;

  swift_defaultActor_initialize();
  *(_QWORD *)(v1 + 120) = 0;
  *(_QWORD *)(v1 + 128) = 0;
  *(_WORD *)(v1 + 136) = 0;
  *(_QWORD *)(v1 + 112) = a1;
  OUTLINED_FUNCTION_50();
}

uint64_t sub_1AF2124CC()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 120))
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC40);
    sub_1AF241438();
    swift_release();
  }
  if (*(_QWORD *)(v0 + 128))
  {
    swift_retain();
    sub_1AF241438();
    swift_release();
  }
  swift_release();
  swift_release();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1AF212580()
{
  sub_1AF2124CC();
  return swift_defaultActor_deallocate();
}

uint64_t sub_1AF212594(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E980);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v2 + 120))
  {
    v8 = *(_QWORD *)(v2 + 120);
  }
  else
  {
    v9 = sub_1AF241420();
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v9);
    v10 = swift_allocObject();
    swift_weakInit();
    v11 = (_QWORD *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v10;
    v11[5] = a1;
    v11[6] = a2;
    swift_retain();
    v8 = sub_1AF2108AC((uint64_t)v7, (uint64_t)&unk_1EEE337A0, (uint64_t)v11);
    sub_1AF209710((uint64_t)v7, (uint64_t *)&unk_1ED32E980);
    *(_QWORD *)(v2 + 120) = v8;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v8;
}

uint64_t sub_1AF2126E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[13] = a5;
  v6[14] = a6;
  v6[11] = a1;
  v6[12] = a4;
  return swift_task_switch();
}

uint64_t sub_1AF212704()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t (*v5)(void);

  OUTLINED_FUNCTION_5();
  v1 = OUTLINED_FUNCTION_62();
  swift_release();
  if (v1)
  {
    v5 = (uint64_t (*)(void))(**(int **)(v0 + 104) + *(_QWORD *)(v0 + 104));
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 120) = v2;
    *v2 = v0;
    v2[1] = sub_1AF2127A4;
    return OUTLINED_FUNCTION_23(v5);
  }
  else
  {
    sub_1AF21944C();
    OUTLINED_FUNCTION_8();
    *v4 = 7;
    OUTLINED_FUNCTION_18((uint64_t)v4, 256);
    return OUTLINED_FUNCTION_23(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_1AF2127A4(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_BYTE *)(v4 + 160) = a1;
  *(_QWORD *)(v4 + 128) = a2;
  *(_QWORD *)(v4 + 136) = v2;
  OUTLINED_FUNCTION_177();
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1AF212804()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_5();
  v1 = OUTLINED_FUNCTION_62();
  *(_QWORD *)(v0 + 144) = v1;
  if (v1)
  {
    swift_unknownObjectRetain();
    OUTLINED_FUNCTION_157();
    return OUTLINED_FUNCTION_0_0();
  }
  else
  {
    v3 = (uint64_t (*)(void))OUTLINED_FUNCTION_150();
    return OUTLINED_FUNCTION_7(v3);
  }
}

uint64_t sub_1AF21285C()
{
  uint64_t v0;

  sub_1AF212978(*(unsigned __int8 *)(v0 + 160), *(_QWORD *)(v0 + 128));
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_1AF2128A4()
{
  uint64_t (*v0)(void);

  v0 = (uint64_t (*)(void))OUTLINED_FUNCTION_150();
  return v0();
}

uint64_t sub_1AF2128B8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_5();
  v1 = OUTLINED_FUNCTION_62();
  *(_QWORD *)(v0 + 152) = v1;
  if (v1)
    return OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_151();
  return OUTLINED_FUNCTION_23(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF212914()
{
  sub_1AF212978(0, 0);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1AF212950()
{
  uint64_t v0;

  OUTLINED_FUNCTION_151();
  return OUTLINED_FUNCTION_23(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF212978(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t result;

  if (a2)
  {
    v4 = swift_unknownObjectRetain();
    sub_1AF2129CC(v4);
  }
  *(_QWORD *)(v2 + 120) = 0;
  result = swift_release();
  *(_BYTE *)(v2 + 136) = a2 != 0;
  return result;
}

uint64_t sub_1AF2129CC(uint64_t a1)
{
  _QWORD *v1;
  os_unfair_lock_s *v3;
  void (*v4)(uint64_t *, uint64_t *);
  uint64_t v6;
  uint64_t v7;

  v7 = a1;
  v3 = *(os_unfair_lock_s **)(v1[3] + 16);
  os_unfair_lock_lock(v3);
  v6 = v1[2];
  v1[2] = a1;
  swift_unknownObjectRetain();
  os_unfair_lock_unlock(v3);
  v4 = (void (*)(uint64_t *, uint64_t *))v1[4];
  if (v4)
  {
    swift_retain();
    v4(&v6, &v7);
    sub_1AF2192C4((uint64_t)v4);
  }
  swift_unknownObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_1AF212A60()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1AF212A78()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 128);
  *(_QWORD *)(v0 + 24) = v1;
  if (!v1)
    return OUTLINED_FUNCTION_84(*(uint64_t (**)(void))(v0 + 8));
  OUTLINED_FUNCTION_61();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v2;
  *v2 = v0;
  v2[1] = sub_1AF212AF4;
  return sub_1AF241444();
}

uint64_t sub_1AF212AF4()
{
  OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_157();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1AF212B2C()
{
  uint64_t v0;

  swift_release();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF212B54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E980);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF241408();
  v7 = sub_1AF241420();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v7);
  v8 = swift_allocObject();
  swift_weakInit();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v8;
  v9[5] = a1;
  v9[6] = a2;
  swift_retain();
  sub_1AF21F934((uint64_t)v6, (uint64_t)&unk_1EEE33780, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_1AF212C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[6] = a5;
  v6[7] = a6;
  v6[5] = a4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E980);
  v6[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1AF212CB0()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_5();
  v1 = OUTLINED_FUNCTION_62();
  *(_QWORD *)(v0 + 72) = v1;
  if (v1)
    return OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_147();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF212D04()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  *(_BYTE *)(v0 + 88) = *(_BYTE *)(v1 + 137);
  *(_BYTE *)(v1 + 137) = 1;
  return OUTLINED_FUNCTION_30_0();
}

uint64_t sub_1AF212D24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = *(_QWORD *)(v0 + 72);
  if ((*(_BYTE *)(v0 + 88) & 1) != 0)
  {
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_147();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 56);
    v3 = *(_QWORD *)(v0 + 64);
    v5 = *(_QWORD *)(v0 + 48);
    v6 = OUTLINED_FUNCTION_135();
    OUTLINED_FUNCTION_92(v6);
    v7 = (_QWORD *)OUTLINED_FUNCTION_22();
    v7[2] = 0;
    v7[3] = 0;
    v7[4] = v5;
    v7[5] = v4;
    v7[6] = v1;
    OUTLINED_FUNCTION_141();
    OUTLINED_FUNCTION_61();
    *(_QWORD *)(v0 + 80) = sub_1AF21F934(v3, (uint64_t)&unk_1EEE33790, (uint64_t)v7);
    OUTLINED_FUNCTION_157();
    return swift_task_switch();
  }
}

uint64_t sub_1AF212DE4()
{
  uint64_t v0;

  sub_1AF212FC4(*(_QWORD *)(v0 + 80));
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1AF212E14()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_147();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF212E44(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(void);

  *(_QWORD *)(v6 + 16) = a6;
  v9 = (uint64_t (*)(void))((char *)a4 + *a4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 24) = v7;
  *v7 = v6;
  v7[1] = sub_1AF212E9C;
  return v9();
}

uint64_t sub_1AF212E9C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v8;

  v6 = *v3;
  v8 = *v3;
  OUTLINED_FUNCTION_158(&v8);
  swift_task_dealloc();
  if (v2)
  {

    a1 = 0;
    a2 = 0;
  }
  *(_QWORD *)(v6 + 32) = a1;
  *(_QWORD *)(v6 + 40) = a2;
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_1AF212F0C()
{
  uint64_t v0;

  sub_1AF212F68(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
  OUTLINED_FUNCTION_11_0();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1AF212F40()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF212F68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  *(_QWORD *)(v2 + 128) = 0;
  result = swift_release();
  *(_BYTE *)(v2 + 137) = 0;
  if ((*(_BYTE *)(v2 + 136) & 1) == 0)
  {
    if (a2)
    {
      v5 = swift_unknownObjectRetain();
      return sub_1AF2129CC(v5);
    }
  }
  return result;
}

BOOL sub_1AF212FB0()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 137);
  *(_BYTE *)(v0 + 137) = 1;
  return (v1 & 1) == 0;
}

uint64_t sub_1AF212FC4(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(v1 + 137) == 1 && !*(_QWORD *)(v1 + 128))
  {
    *(_QWORD *)(v1 + 128) = result;
    return swift_retain();
  }
  return result;
}

uint64_t sub_1AF212FE4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1AF212FF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 88);
  v2 = sub_1AF241534();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  sub_1AF2192C4(*(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 104)));
  return v0;
}

uint64_t sub_1AF21305C()
{
  sub_1AF212FF4();
  return swift_deallocClassInstance();
}

uint64_t sub_1AF21307C()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1AF2130A0()
{
  sub_1AF21307C();
  return swift_deallocClassInstance();
}

uint64_t sub_1AF2130BC()
{
  sub_1AF212448((void (*)(os_unfair_lock_s *))sub_1AF2130EC);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1AF2130EC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t result;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  os_signpost_id_t v28;
  void (*v29)(char *, uint64_t);
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  const char *v38;
  char *v39;
  uint64_t v40;
  os_signpost_id_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;

  v3 = sub_1AF24115C();
  v49 = *(_QWORD *)(v3 - 8);
  v50 = v3;
  v4 = MEMORY[0x1E0C80A78](v3);
  v48 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v43 - v6;
  v8 = sub_1AF241138();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v43 - v14;
  result = MEMORY[0x1E0C80A78](v13);
  v18 = (char *)&v43 - v17;
  v19 = *a1;
  v20 = *(_QWORD *)(*a1 + 16);
  v51 = v1;
  v52 = a1;
  if (v20)
  {
    *(_QWORD *)(v19 + 16) = 0;
    v47 = *(_QWORD *)(v19 + 32);
    if (qword_1ED32E498 != -1)
      swift_once();
    v21 = sub_1AF241150();
    __swift_project_value_buffer(v21, (uint64_t)qword_1ED32E580);
    v22 = sub_1AF241144();
    sub_1AF241168();
    LODWORD(v46) = sub_1AF2414D4();
    if ((sub_1AF241510() & 1) != 0)
    {
      v45 = v9;
      v23 = v12;
      swift_retain();
      sub_1AF24118C();
      swift_release();
      v25 = v49;
      v24 = v50;
      if ((*(unsigned int (**)(char *, uint64_t))(v49 + 88))(v7, v50) == *MEMORY[0x1E0DF2190])
      {
        v26 = 0;
        v44 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v24);
        v44 = "BagRequests=%{public}lu";
        v26 = 1;
      }
      v12 = v23;
      v9 = v45;
      (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v15, v18, v8);
      v27 = swift_slowAlloc();
      *(_BYTE *)v27 = 0;
      *(_BYTE *)(v27 + 1) = v26;
      *(_WORD *)(v27 + 2) = 2050;
      v53 = v47;
      sub_1AF24157C();
      v28 = sub_1AF241120();
      _os_signpost_emit_with_name_impl(&dword_1AF203000, v22, (os_signpost_type_t)v46, v28, "bagExpiredSpan", v44, (uint8_t *)v27, 0xCu);
      MEMORY[0x1AF45A8C4](v27, -1, -1);

      v29 = *(void (**)(char *, uint64_t))(v9 + 8);
      v29(v18, v8);
      swift_release();
      result = ((uint64_t (*)(char *, uint64_t))v29)(v15, v8);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v18, v8);
      result = swift_release();
    }
    a1 = v52;
  }
  v30 = (_QWORD *)*a1;
  v30[4] = 0;
  if (v30[3])
  {
    v30[3] = 0;
    v31 = v30[5];
    if (qword_1ED32E498 != -1)
      swift_once();
    v32 = sub_1AF241150();
    __swift_project_value_buffer(v32, (uint64_t)qword_1ED32E580);
    v33 = sub_1AF241144();
    sub_1AF241168();
    LODWORD(v47) = sub_1AF2414D4();
    if ((sub_1AF241510() & 1) != 0)
    {
      v45 = v31;
      v46 = v12;
      swift_retain();
      v34 = v48;
      sub_1AF24118C();
      swift_release();
      v36 = v49;
      v35 = v50;
      if ((*(unsigned int (**)(char *, uint64_t))(v49 + 88))(v34, v50) == *MEMORY[0x1E0DF2190])
      {
        v37 = 0;
        v38 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v36 + 8))(v34, v35);
        v38 = "BagRequests=%{public}lu";
        v37 = 1;
      }
      v39 = v46;
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v15, v46, v8);
      v40 = swift_slowAlloc();
      *(_BYTE *)v40 = 0;
      *(_BYTE *)(v40 + 1) = v37;
      *(_WORD *)(v40 + 2) = 2050;
      v53 = v45;
      sub_1AF24157C();
      v41 = sub_1AF241120();
      _os_signpost_emit_with_name_impl(&dword_1AF203000, v33, (os_signpost_type_t)v47, v41, "bagInvalidSpan", v38, (uint8_t *)v40, 0xCu);
      MEMORY[0x1AF45A8C4](v40, -1, -1);

      v42 = *(void (**)(char *, uint64_t))(v9 + 8);
      v42(v39, v8);
      swift_release();
      result = ((uint64_t (*)(char *, uint64_t))v42)(v15, v8);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
      result = swift_release();
    }
    a1 = v52;
  }
  *(_QWORD *)(*a1 + 40) = 0;
  return result;
}

uint64_t sub_1AF2135DC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t *v15;
  uint8_t *v16;
  os_signpost_id_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;

  v2 = v1;
  v4 = sub_1AF241138();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)&v23 - v10;
  v12 = *a1;
  if (*(_QWORD *)(*a1 + 16))
    goto LABEL_7;
  v26 = *(_QWORD *)(v12 + 32);
  if (qword_1ED32E498 != -1)
    goto LABEL_10;
  while (1)
  {
    v13 = sub_1AF241150();
    __swift_project_value_buffer(v13, (uint64_t)qword_1ED32E580);
    sub_1AF24112C();
    v14 = sub_1AF241144();
    v25 = sub_1AF2414E0();
    if ((sub_1AF241510() & 1) != 0)
    {
      v23 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v23(v8, v11, v4);
      v15 = (uint8_t *)swift_slowAlloc();
      v24 = v2;
      v16 = v15;
      *(_DWORD *)v15 = 134349056;
      v27 = v26;
      sub_1AF24157C();
      v17 = sub_1AF241120();
      _os_signpost_emit_with_name_impl(&dword_1AF203000, v14, (os_signpost_type_t)v25, v17, "bagExpiredSpan", "BagRequests=%{public}lu", v16, 0xCu);
      v18 = v16;
      v2 = v24;
      MEMORY[0x1AF45A8C4](v18, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      v23(v8, v11, v4);
    }
    else
    {

      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v11, v4);
    }
    sub_1AF241180();
    swift_allocObject();
    v19 = sub_1AF241174();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    *(_QWORD *)(v12 + 16) = v19;
    result = swift_release();
    v12 = *a1;
LABEL_7:
    v20 = *(_QWORD *)(v12 + 32);
    v21 = __CFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
      break;
    __break(1u);
LABEL_10:
    swift_once();
  }
  *(_QWORD *)(v12 + 32) = v22;
  return result;
}

uint64_t sub_1AF213830(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t *v15;
  uint8_t *v16;
  os_signpost_id_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;

  v2 = v1;
  v4 = sub_1AF241138();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)&v23 - v10;
  v12 = *(_QWORD **)a1;
  if (*(_QWORD *)(*(_QWORD *)a1 + 24))
    goto LABEL_7;
  v26 = v12[4];
  if (qword_1ED32E498 != -1)
    goto LABEL_10;
  while (1)
  {
    v13 = sub_1AF241150();
    __swift_project_value_buffer(v13, (uint64_t)qword_1ED32E580);
    sub_1AF24112C();
    v14 = sub_1AF241144();
    v25 = sub_1AF2414E0();
    if ((sub_1AF241510() & 1) != 0)
    {
      v23 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v23(v8, v11, v4);
      v15 = (uint8_t *)swift_slowAlloc();
      v24 = v2;
      v16 = v15;
      *(_DWORD *)v15 = 134349056;
      v27 = v26;
      sub_1AF24157C();
      v17 = sub_1AF241120();
      _os_signpost_emit_with_name_impl(&dword_1AF203000, v14, (os_signpost_type_t)v25, v17, "bagExpiredSpan", "BagRequests=%{public}lu", v16, 0xCu);
      v18 = v16;
      v2 = v24;
      MEMORY[0x1AF45A8C4](v18, -1, -1);

      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      v23(v8, v11, v4);
    }
    else
    {

      (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v11, v4);
    }
    sub_1AF241180();
    swift_allocObject();
    v19 = sub_1AF241174();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    v12[3] = v19;
    result = swift_release();
    v12 = *(_QWORD **)a1;
LABEL_7:
    v20 = v12[5];
    v21 = __CFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
      break;
    __break(1u);
LABEL_10:
    swift_once();
  }
  v12[5] = v22;
  return result;
}

void sub_1AF213A84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  type metadata accessor for ConfigUsageReporter.State();
  v1 = OUTLINED_FUNCTION_22();
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E9D0);
  v2 = OUTLINED_FUNCTION_22();
  *(_DWORD *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v0 + 16) = v2;
  OUTLINED_FUNCTION_50();
}

void sub_1AF213AD8()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = OUTLINED_FUNCTION_91();
  v2 = OUTLINED_FUNCTION_41(v1, sel_valueForKey_);
  OUTLINED_FUNCTION_102();
  if (v0)
  {
    OUTLINED_FUNCTION_45();
    v3 = OUTLINED_FUNCTION_36();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_115();
  }
  OUTLINED_FUNCTION_44(v3, v4, &qword_1ED32F808, v5, v6, v7);
  if (v15)
    OUTLINED_FUNCTION_42();
  else
    OUTLINED_FUNCTION_90(v8, &qword_1ED32F808, v9, v10, v11, v12, v13, v14);
  OUTLINED_FUNCTION_110();
}

void sub_1AF213B74()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (qword_1ED32ECA0 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_139();
  v2 = OUTLINED_FUNCTION_41(v1, sel_valueForKey_);
  OUTLINED_FUNCTION_102();
  if (v0)
  {
    OUTLINED_FUNCTION_45();
    v3 = OUTLINED_FUNCTION_36();
  }
  else
  {
    v7 = OUTLINED_FUNCTION_115();
  }
  OUTLINED_FUNCTION_44(v3, v4, &qword_1ED32F808, v5, v6, v7);
  if (v15)
    OUTLINED_FUNCTION_42();
  else
    OUTLINED_FUNCTION_90(v8, &qword_1ED32F808, v9, v10, v11, v12, v13, v14);
  OUTLINED_FUNCTION_110();
}

uint64_t sub_1AF213C38(void *a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  swift_retain();
  swift_bridgeObjectRetain();
  v11 = nw_activity_create();
  type metadata accessor for ResourceAccessNetworkSpan();
  v12 = swift_allocObject();
  v13 = sub_1AF219C84(a3, 1, a4, a5, a6, 0, 1, a1, v11, 0, 0xE000000000000000, v12);
  return sub_1AF213CF8(v13);
}

uint64_t sub_1AF213CF8(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;

  v3 = *(os_unfair_lock_s **)(v1 + 24);
  os_unfair_lock_lock(v3);
  *(_QWORD *)(v1 + 16) = a1;
  swift_retain();
  swift_release();
  os_unfair_lock_unlock(v3);
  return swift_release();
}

void sub_1AF213D4C(uint64_t *a1)
{
  unint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  os_log_type_t type;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v2 = *a1;
  v1 = a1[1];
  v3 = (void *)a1[2];
  if (v3 && (objc_opt_self(), (v4 = swift_dynamicCastObjCClass()) != 0))
  {
    v5 = (void *)v4;
    v6 = v3;
    v7 = objc_msgSend(v5, sel_statusCode);
    if (qword_1ED32E488 != -1)
      swift_once();
    v8 = sub_1AF2411B0();
    __swift_project_value_buffer(v8, (uint64_t)qword_1ED32E560);
    v9 = v6;
    v10 = sub_1AF241198();
    v11 = sub_1AF2414A4();
    if (os_log_type_enabled(v10, v11))
    {
      type = v11;
      v12 = swift_slowAlloc();
      v32 = swift_slowAlloc();
      v34 = v32;
      *(_DWORD *)v12 = 134218242;
      sub_1AF24157C();
      *(_WORD *)(v12 + 12) = 2080;
      v13 = objc_msgSend(v5, sel_debugDescription);
      v14 = v9;
      v15 = v7;
      v16 = sub_1AF241270();
      v18 = v17;

      v19 = v16;
      v7 = v15;
      v9 = v14;
      sub_1AF208AF4(v19, v18, &v34);
      sub_1AF24157C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AF203000, v10, type, "config request status code: %ld, response: %s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1AF45A8C4](v32, -1, -1);
      MEMORY[0x1AF45A8C4](v12, -1, -1);

    }
    else
    {

    }
    if (v7 != (id)200)
    {
      sub_1AF21944C();
      swift_allocError();
      *(_QWORD *)v30 = v7;
      *(_WORD *)(v30 + 8) = 0;
      swift_willThrow();
    }

  }
  else
  {
    if (qword_1ED32E488 != -1)
      swift_once();
    v20 = sub_1AF2411B0();
    __swift_project_value_buffer(v20, (uint64_t)qword_1ED32E560);
    sub_1AF219C40(v2, v1);
    v21 = v3;
    swift_bridgeObjectRetain();
    sub_1AF219C40(v2, v1);
    v22 = v21;
    swift_bridgeObjectRetain();
    v23 = sub_1AF241198();
    v24 = sub_1AF241498();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v33 = swift_slowAlloc();
      v34 = v33;
      *(_DWORD *)v25 = 136315138;
      v26 = v22;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33828);
      v27 = sub_1AF2412AC();
      sub_1AF208AF4(v27, v28, &v34);
      sub_1AF24157C();
      swift_bridgeObjectRelease();
      sub_1AF219BC4(v2, v1);
      swift_bridgeObjectRelease();

      sub_1AF219BC4(v2, v1);
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1AF203000, v23, v24, "UNIDENTIFIED_RESPONSE_TYPE %s", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF45A8C4](v33, -1, -1);
      MEMORY[0x1AF45A8C4](v25, -1, -1);

    }
    else
    {
      sub_1AF219BC4(v2, v1);
      swift_bridgeObjectRelease();

      sub_1AF219BC4(v2, v1);
      swift_bridgeObjectRelease();

    }
    sub_1AF21944C();
    swift_allocError();
    *(_QWORD *)v29 = 4;
    *(_WORD *)(v29 + 8) = 256;
    swift_willThrow();
  }
}

id sub_1AF214200()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  id v11[4];
  _BYTE v12[32];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_1AF240E50();
  v11[0] = 0;
  v2 = objc_msgSend(v0, sel_JSONObjectWithData_options_error_, v1, 1, v11);

  v3 = v11[0];
  if (v2)
  {
    sub_1AF2415D0();
    swift_unknownObjectRelease();
    sub_1AF208D14((uint64_t)v12, (uint64_t)v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC90);
    if ((swift_dynamicCast() & 1) != 0
      && (v2 = (id)v10,
          v4 = _s20PegasusConfiguration0A25ConfigControllerInternalsV05cleanC7OfNullsySDySSypGSgAEFZ_0(v10),
          swift_bridgeObjectRelease(),
          v4))
    {
      sub_1AF22B120(v4);
      v2 = v5;
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
    }
    else
    {
      sub_1AF21944C();
      swift_allocError();
      *(_QWORD *)v6 = 5;
      *(_WORD *)(v6 + 8) = 256;
      swift_willThrow();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
    }
  }
  else
  {
    v7 = v3;
    v2 = (id)sub_1AF240D6C();

    swift_willThrow();
    sub_1AF21944C();
    swift_allocError();
    *(_QWORD *)v8 = v2;
    *(_WORD *)(v8 + 8) = 149;
    swift_willThrow();
  }
  return v2;
}

uint64_t sub_1AF2143E0(void *a1)
{
  id v1;
  id v2;
  void *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC40);
  if (!OUTLINED_FUNCTION_47())
    return sub_1AF240D60();
  v2 = sub_1AF20E11C((uint64_t)v4, v5 | (v6 << 8));
  sub_1AF2199F8(v4, v5, v6);
  return (uint64_t)v2;
}

uint64_t sub_1AF21447C()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  v1 = *(os_unfair_lock_s **)(v0 + 24);
  os_unfair_lock_lock(v1);
  v2 = *(_QWORD *)(v0 + 16);
  swift_retain();
  os_unfair_lock_unlock(v1);
  return v2;
}

uint64_t _s20PegasusConfiguration0A25ConfigControllerInternalsV05cleanC7OfNullsySDySSypGSgAEFZ_0(uint64_t a1)
{
  _QWORD v3[4];
  _BYTE v4[24];
  uint64_t v5;

  v3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC90);
  v3[0] = a1;
  swift_bridgeObjectRetain();
  sub_1AF21455C((uint64_t)v3, (uint64_t)v4);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v3);
  if (v5)
  {
    if (swift_dynamicCast())
      return v3[0];
    else
      return 0;
  }
  else
  {
    sub_1AF209710((uint64_t)v4, &qword_1ED32F808);
    return 0;
  }
}

uint64_t sub_1AF21455C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v15;
  uint64_t v16;
  _OWORD v17[2];
  id v18[5];
  uint64_t v19;
  _BYTE v20[32];

  sub_1AF208D14(a1, (uint64_t)v20);
  sub_1AF20C87C(0, (unint64_t *)&unk_1ED32E9A8);
  if (swift_dynamicCast())
  {

    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E970);
    if (swift_dynamicCast())
    {
      v5 = *(_QWORD *)(v19 + 16);
      if (v5)
      {
        v6 = v19 + 32;
        swift_bridgeObjectRetain();
        v7 = MEMORY[0x1E0DEE9D8];
        do
        {
          sub_1AF208D14(v6, (uint64_t)v18);
          sub_1AF21455C(&v15, v18);
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
          if (v16)
          {
            sub_1AF219FD0(&v15, v17);
            sub_1AF219FD0(v17, &v15);
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              sub_1AF2355A8();
              v7 = v9;
            }
            v8 = *(_QWORD *)(v7 + 16);
            if (v8 >= *(_QWORD *)(v7 + 24) >> 1)
            {
              sub_1AF2355A8();
              v7 = v10;
            }
            *(_QWORD *)(v7 + 16) = v8 + 1;
            sub_1AF219FD0(&v15, (_OWORD *)(v7 + 32 * v8 + 32));
          }
          else
          {
            sub_1AF209710((uint64_t)&v15, &qword_1ED32F808);
          }
          v6 += 32;
          --v5;
        }
        while (v5);
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
        v7 = MEMORY[0x1E0DEE9D8];
      }
      *(_QWORD *)(a2 + 24) = v4;
      *(_QWORD *)a2 = v7;
    }
    else
    {
      v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC90);
      if (swift_dynamicCast())
      {
        sub_1AF2147B8();
        v13 = v12;
        swift_bridgeObjectRelease();
        *(_QWORD *)(a2 + 24) = v11;
        *(_QWORD *)a2 = v13;
      }
      else
      {
        sub_1AF208D14(a1, a2);
      }
    }
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
}

void sub_1AF2147B8()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  __int128 v27;
  uint64_t v28;
  _OWORD v29[3];
  uint64_t v30;
  _OWORD v31[2];
  __int128 v32;
  _OWORD v33[2];
  __int128 v34;
  _OWORD v35[2];
  uint64_t v36;
  _QWORD v37[7];
  uint64_t *v38;

  v0 = MEMORY[0x1E0DEE9E0];
  v36 = MEMORY[0x1E0DEE9E0];
  sub_1AF21E75C(v37);
  v1 = v37[0];
  v2 = v37[3];
  v3 = v37[4];
  v25 = v37[1];
  v26 = (unint64_t)(v37[2] + 64) >> 6;
  v38 = &v30;
  swift_bridgeObjectRetain();
  while (1)
  {
    while (1)
    {
      if (v3)
      {
        v4 = __clz(__rbit64(v3));
        v3 &= v3 - 1;
        v5 = v4 | (v2 << 6);
      }
      else
      {
        v6 = v2 + 1;
        if (__OFADD__(v2, 1))
          goto LABEL_36;
        if (v6 >= v26)
          goto LABEL_34;
        v7 = *(_QWORD *)(v25 + 8 * v6);
        v8 = v2 + 1;
        if (!v7)
        {
          v8 = v2 + 2;
          if (v2 + 2 >= v26)
            goto LABEL_34;
          v7 = *(_QWORD *)(v25 + 8 * v8);
          if (!v7)
          {
            v8 = v2 + 3;
            if (v2 + 3 >= v26)
              goto LABEL_34;
            v7 = *(_QWORD *)(v25 + 8 * v8);
            if (!v7)
            {
              v8 = v2 + 4;
              if (v2 + 4 >= v26)
                goto LABEL_34;
              v7 = *(_QWORD *)(v25 + 8 * v8);
              if (!v7)
              {
                v8 = v2 + 5;
                if (v2 + 5 >= v26)
                  goto LABEL_34;
                v7 = *(_QWORD *)(v25 + 8 * v8);
                if (!v7)
                {
                  v9 = v2 + 6;
                  while (v9 < v26)
                  {
                    v7 = *(_QWORD *)(v25 + 8 * v9++);
                    if (v7)
                    {
                      v8 = v9 - 1;
                      goto LABEL_19;
                    }
                  }
LABEL_34:
                  sub_1AF219FE0();
                  return;
                }
              }
            }
          }
        }
LABEL_19:
        v3 = (v7 - 1) & v7;
        v5 = __clz(__rbit64(v7)) + (v8 << 6);
        v2 = v8;
      }
      v10 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v5);
      v12 = *v10;
      v11 = v10[1];
      sub_1AF208D14(*(_QWORD *)(v1 + 56) + 32 * v5, (uint64_t)v35);
      *(_QWORD *)&v34 = v12;
      *((_QWORD *)&v34 + 1) = v11;
      v32 = v34;
      v33[0] = v35[0];
      v33[1] = v35[1];
      swift_bridgeObjectRetain();
      sub_1AF21455C(&v27, v33);
      if (v28)
        break;
      sub_1AF209710((uint64_t)&v32, &qword_1EEE33858);
      sub_1AF209710((uint64_t)&v27, &qword_1ED32F808);
    }
    sub_1AF219FD0(&v27, v31);
    v13 = v32;
    v29[2] = v32;
    sub_1AF219FD0(v33, v38);
    sub_1AF219FD0(v31, v29);
    v14 = *(_QWORD *)(v0 + 16);
    if (*(_QWORD *)(v0 + 24) <= v14)
    {
      sub_1AF219488(v14 + 1, 1);
      v0 = v36;
    }
    sub_1AF2417EC();
    sub_1AF241300();
    v15 = sub_1AF241810();
    v16 = v0 + 64;
    v17 = -1 << *(_BYTE *)(v0 + 32);
    v18 = v15 & ~v17;
    v19 = v18 >> 6;
    if (((-1 << v18) & ~*(_QWORD *)(v0 + 64 + 8 * (v18 >> 6))) == 0)
      break;
    v20 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v0 + 64 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(_QWORD *)(v16 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v20;
    *(_OWORD *)(*(_QWORD *)(v0 + 48) + 16 * v20) = v13;
    sub_1AF219FD0(v29, (_OWORD *)(*(_QWORD *)(v0 + 56) + 32 * v20));
    ++*(_QWORD *)(v0 + 16);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
  }
  v21 = 0;
  v22 = (unint64_t)(63 - v17) >> 6;
  while (++v19 != v22 || (v21 & 1) == 0)
  {
    v23 = v19 == v22;
    if (v19 == v22)
      v19 = 0;
    v21 |= v23;
    v24 = *(_QWORD *)(v16 + 8 * v19);
    if (v24 != -1)
    {
      v20 = __clz(__rbit64(~v24)) + (v19 << 6);
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_36:
  __break(1u);
}

size_t sub_1AF214B20(uint64_t a1, _QWORD *a2, uint64_t a3, _QWORD *a4, uint64_t a5, int a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  _QWORD *v52;
  NSString *v53;
  id v54;
  void *v55;
  id v56;
  void (*v57)(char *, char *, uint64_t);
  char *v58;
  void (*v59)(char *, char *, uint64_t);
  char *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  double v66;
  double v67;
  void (*v68)(char *, uint64_t);
  id v69;
  void *v70;
  double v71;
  double v72;
  id v73;
  void *v74;
  void *v75;
  char *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(char *, char *, uint64_t);
  void *v81;
  uint64_t v82;
  NSObject *v83;
  os_log_type_t v84;
  uint8_t *v85;
  void *v86;
  void *v87;
  _BYTE *v88;
  uint64_t v90;
  char *v91;
  NSObject *v92;
  os_log_type_t v93;
  uint8_t *v94;
  void *v95;
  uint64_t v96;
  unint64_t v97;
  void (*v98)(char *, uint64_t);
  char *v99;
  uint64_t v100;
  NSObject *v101;
  os_log_type_t v102;
  uint8_t *v103;
  void *v104;
  void *v105;
  id v106;
  id v107;
  char *v108;
  void *v109;
  _BYTE *v110;
  id v111;
  void *v112;
  void *v113;
  id v114;
  id v115;
  NSObject *v116;
  os_log_type_t v117;
  uint8_t *v118;
  _QWORD *v119;
  id v120;
  void *v121;
  uint64_t v122;
  _QWORD *v123;
  char *v124;
  size_t v125;
  uint64_t v126;
  uint64_t v127;
  int EnumTagSinglePayload;
  uint64_t v129;
  NSObject *v130;
  os_log_type_t v131;
  uint8_t *v132;
  void *v133;
  _BYTE *v134;
  char *v135;
  void *v136;
  unsigned __int8 v137;
  void *v138;
  unsigned int v139;
  id v140;
  id v141;
  void *v142;
  uint64_t v143;
  id v144;
  id v145;
  NSObject *v146;
  os_log_type_t v147;
  uint8_t *v148;
  _QWORD *v149;
  id v150;
  void *v151;
  void *v152;
  unsigned int v153;
  id v154;
  id v155;
  void *v156;
  void *v157;
  void *v158;
  unsigned int v159;
  id v160;
  id v161;
  char *v162;
  id v163;
  void *v164;
  uint64_t v165;
  char *v166;
  char *v167;
  id v168;
  id v169;
  NSObject *v170;
  os_log_type_t v171;
  char *v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t v175;
  void (*v176)(char *, uint64_t);
  uint64_t v177;
  unint64_t v178;
  id v179;
  uint64_t v180;
  _QWORD *v181;
  char *v182;
  void (*v183)(char *, uint64_t);
  void *v184;
  unsigned int v185;
  id v186;
  id v187;
  void *v188;
  uint64_t v189;
  id v190;
  id v191;
  NSObject *v192;
  os_log_type_t v193;
  char *v194;
  uint64_t v195;
  _QWORD *v196;
  uint64_t v197;
  unint64_t v198;
  id v199;
  uint64_t v200;
  _QWORD *v201;
  char *v202;
  uint64_t v203;
  uint64_t v204;
  void (*v205)(char *, uint64_t);
  char *v206;
  void *v207;
  unsigned __int8 v208;
  void *v209;
  unsigned int v210;
  id v211;
  id v212;
  void *v213;
  uint64_t v214;
  id v215;
  id v216;
  NSObject *v217;
  os_log_type_t v218;
  uint8_t *v219;
  id v220;
  void *v221;
  _QWORD *v222;
  void *v223;
  unsigned int v224;
  id v225;
  id v226;
  void *v227;
  char *v228;
  void *v229;
  void *v230;
  unsigned int v231;
  id v232;
  id v233;
  void *v234;
  uint64_t v235;
  id v236;
  id v237;
  NSObject *v238;
  os_log_type_t v239;
  _BOOL4 v240;
  char *v241;
  uint8_t *v242;
  _QWORD *v243;
  id v244;
  void *v245;
  char *v246;
  _QWORD *v247;
  uint8_t *v248;
  char *v249;
  uint64_t v250;
  void (*v251)(char *, uint64_t, uint64_t);
  void (*v252)(char *, char *, uint64_t);
  _QWORD *v253;
  char *v254;
  char *v255;
  char *v256;
  char *v257;
  char *v258;
  char *v259;
  uint64_t v260;
  char *v261;
  uint64_t v262;
  char *v263;
  char *v264;
  char *v265;
  char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  _QWORD *v270;
  char *v271;
  uint64_t v272;
  uint64_t v273;
  _QWORD *v274;
  char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  unint64_t v279;
  uint64_t v280;
  id v281[6];

  v262 = a7;
  LODWORD(v273) = a6;
  v270 = a4;
  v269 = a3;
  v274 = a2;
  v267 = a1;
  v281[5] = *(id *)MEMORY[0x1E0C80C00];
  v272 = sub_1AF240F04();
  v268 = *(_QWORD *)(v272 - 8);
  MEMORY[0x1E0C80A78](v272);
  v271 = (char *)&v250 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  v9 = MEMORY[0x1E0C80A78](v8);
  v258 = (char *)&v250 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v9);
  v260 = (uint64_t)&v250 - v12;
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v250 - v13;
  v15 = sub_1AF240E2C();
  v16 = *(_QWORD **)(v15 - 8);
  v17 = MEMORY[0x1E0C80A78](v15);
  v257 = (char *)&v250 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v17);
  v255 = (char *)&v250 - v20;
  v21 = MEMORY[0x1E0C80A78](v19);
  v254 = (char *)&v250 - v22;
  v23 = MEMORY[0x1E0C80A78](v21);
  v266 = (char *)&v250 - v24;
  v25 = MEMORY[0x1E0C80A78](v23);
  v264 = (char *)&v250 - v26;
  v27 = MEMORY[0x1E0C80A78](v25);
  v259 = (char *)&v250 - v28;
  v29 = MEMORY[0x1E0C80A78](v27);
  v256 = (char *)&v250 - v30;
  v31 = MEMORY[0x1E0C80A78](v29);
  v261 = (char *)&v250 - v32;
  v33 = MEMORY[0x1E0C80A78](v31);
  v263 = (char *)&v250 - v34;
  v35 = MEMORY[0x1E0C80A78](v33);
  v265 = (char *)&v250 - v36;
  v37 = MEMORY[0x1E0C80A78](v35);
  v39 = (char *)&v250 - v38;
  MEMORY[0x1E0C80A78](v37);
  v275 = (char *)&v250 - v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
  v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_1AF242870;
  v42 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v43 = objc_msgSend(v42, sel_globallyUniqueString);

  v44 = sub_1AF241270();
  v46 = v45;

  v47 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v41 + 56) = MEMORY[0x1E0DEA968];
  v48 = sub_1AF20BFF4();
  *(_QWORD *)(v41 + 32) = v44;
  *(_QWORD *)(v41 + 40) = v46;
  *(_QWORD *)(v41 + 96) = v47;
  *(_QWORD *)(v41 + 104) = v48;
  *(_QWORD *)(v41 + 64) = v48;
  *(_QWORD *)(v41 + 72) = 0x73696C702E676162;
  *(_QWORD *)(v41 + 80) = 0xE900000000000074;
  v49 = sub_1AF241288();
  v51 = v50;
  __swift_instantiateConcreteTypeFromMangledName(qword_1ED32E748);
  swift_allocObject();
  v52 = (_QWORD *)swift_retain();
  v276 = sub_1AF218D9C(v52, 6, 0);
  sub_1AF20C87C(0, &qword_1ED32E9A0);
  v53 = NSTemporaryDirectory();
  sub_1AF241270();

  v54 = sub_1AF216D7C();
  v55 = (void *)sub_1AF24124C();
  v56 = objc_msgSend(v54, sel_URLByAppendingPathComponent_, v55);

  if (!v56)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v15);
    goto LABEL_13;
  }
  sub_1AF240DD8();

  v57 = (void (*)(char *, char *, uint64_t))v16[4];
  v57(v14, v39, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v15);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15) == 1)
  {
LABEL_13:
    sub_1AF209710((uint64_t)v14, (uint64_t *)&unk_1ED32FF80);
    if (qword_1ED32E488 != -1)
      swift_once();
    v82 = sub_1AF2411B0();
    __swift_project_value_buffer(v82, (uint64_t)qword_1ED32E560);
    swift_bridgeObjectRetain();
    v83 = sub_1AF241198();
    v84 = sub_1AF2414B0();
    if (os_log_type_enabled(v83, v84))
    {
      v85 = (uint8_t *)swift_slowAlloc();
      v86 = (void *)swift_slowAlloc();
      v281[0] = v86;
      *(_DWORD *)v85 = 136315138;
      swift_bridgeObjectRetain();
      v278 = sub_1AF208AF4(v49, v51, (uint64_t *)v281);
      sub_1AF24157C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1AF203000, v83, v84, "error creating temporary config file: %s", v85, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF45A8C4](v86, -1, -1);
      MEMORY[0x1AF45A8C4](v85, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_1AF219898();
    v87 = (void *)swift_allocError();
    *v88 = 6;
    sub_1AF218DD8(v87);

    swift_release();
    return 0;
  }
  swift_bridgeObjectRelease();
  v58 = v275;
  v57(v275, v14, v15);
  sub_1AF20C87C(0, (unint64_t *)&unk_1ED32E990);
  v59 = (void (*)(char *, char *, uint64_t))v16[2];
  v59(v39, v58, v15);
  v60 = (char *)sub_1AF216ED4((uint64_t)v39, 0);
  if (!v60)
  {
    if (qword_1ED32E488 != -1)
      swift_once();
    v90 = sub_1AF2411B0();
    __swift_project_value_buffer(v90, (uint64_t)qword_1ED32E560);
    v91 = v266;
    v59(v266, v275, v15);
    v92 = sub_1AF241198();
    v93 = sub_1AF2414B0();
    if (os_log_type_enabled(v92, v93))
    {
      v94 = (uint8_t *)swift_slowAlloc();
      v95 = (void *)swift_slowAlloc();
      v281[0] = v95;
      *(_DWORD *)v94 = 136315138;
      v96 = sub_1AF240D9C();
      v278 = sub_1AF208AF4(v96, v97, (uint64_t *)v281);
      sub_1AF24157C();
      swift_bridgeObjectRelease();
      v98 = (void (*)(char *, uint64_t))v16[1];
      v98(v91, v15);
      _os_log_impl(&dword_1AF203000, v92, v93, "error opening config cache output stream: %s", v94, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF45A8C4](v95, -1, -1);
      MEMORY[0x1AF45A8C4](v94, -1, -1);
    }
    else
    {
      v98 = (void (*)(char *, uint64_t))v16[1];
      v98(v91, v15);
    }

    sub_1AF219898();
    v109 = (void *)swift_allocError();
    *v110 = 3;
    sub_1AF218DD8(v109);
    swift_release();
    v98(v275, v15);

    return 0;
  }
  v266 = v60;
  objc_msgSend(v60, sel_open);
  v277 = v267;
  v278 = 0xD000000000000012;
  v279 = 0x80000001AF246650;
  swift_bridgeObjectRetain();
  sub_1AF2415F4();
  v61 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, 0.0);
  v62 = sub_1AF20C87C(0, (unint64_t *)&qword_1ED32F800);
  v280 = v62;
  v278 = (uint64_t)v61;
  sub_1AF21D358((uint64_t)&v278, (uint64_t)v281);
  if (qword_1ED32ECA0 != -1)
    swift_once();
  v251 = (void (*)(char *, uint64_t, uint64_t))v57;
  v252 = v59;
  v253 = v16;
  v267 = v15;
  v278 = qword_1ED330260;
  v279 = *(_QWORD *)algn_1ED330268;
  swift_bridgeObjectRetain();
  v63 = MEMORY[0x1E0DEA968];
  sub_1AF2415F4();
  v64 = v271;
  v65 = v272;
  if (qword_1ED32E8A8 != -1)
    swift_once();
  sub_1AF240EA4();
  sub_1AF240EC8();
  v67 = v66;
  v68 = *(void (**)(char *, uint64_t))(v268 + 8);
  v68(v64, v65);
  v69 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, v67);
  v280 = v62;
  v278 = (uint64_t)v69;
  sub_1AF21D358((uint64_t)&v278, (uint64_t)v281);
  v70 = v274;
  if (qword_1EEE33508 != -1)
    swift_once();
  v278 = qword_1EEE33FE0;
  v279 = *(_QWORD *)algn_1EEE33FE8;
  swift_bridgeObjectRetain();
  sub_1AF2415F4();
  v280 = v63;
  v278 = v269;
  v279 = (unint64_t)v270;
  swift_bridgeObjectRetain();
  sub_1AF21D358((uint64_t)&v278, (uint64_t)v281);
  v278 = 0xD000000000000011;
  v279 = 0x80000001AF246630;
  sub_1AF2415F4();
  sub_1AF240EF8();
  sub_1AF240EC8();
  v72 = v71;
  v68(v64, v65);
  v73 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, v72);
  v280 = v62;
  v278 = (uint64_t)v73;
  sub_1AF21D358((uint64_t)&v278, (uint64_t)v281);
  if ((v273 & 1) == 0)
  {
    v99 = v266;
    if (qword_1ED32E488 != -1)
      swift_once();
    v100 = sub_1AF2411B0();
    __swift_project_value_buffer(v100, (uint64_t)qword_1ED32E560);
    v101 = sub_1AF241198();
    v102 = sub_1AF2414C8();
    if (os_log_type_enabled(v101, v102))
    {
      v103 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v103 = 0;
      _os_log_impl(&dword_1AF203000, v101, v102, "skipped saving config because flag is disabled", v103, 2u);
      MEMORY[0x1AF45A8C4](v103, -1, -1);
    }

    v104 = (void *)objc_opt_self();
    v105 = (void *)sub_1AF2411EC();
    swift_bridgeObjectRelease();
    v281[0] = 0;
    v106 = objc_msgSend(v104, sel_dataWithPropertyList_format_options_error_, v105, 200, 0, v281);

    v107 = v281[0];
    if (v106)
    {
      v125 = sub_1AF240E5C();

      v108 = v275;
      sub_1AF216DEC(v70);

      swift_release();
      ((void (*)(char *, uint64_t))v253[1])(v108, v267);
      return v125;
    }
    v112 = v107;
    v113 = (void *)sub_1AF240D6C();

    swift_willThrow();
    v114 = v113;
    v115 = v113;
    v116 = sub_1AF241198();
    v117 = sub_1AF2414B0();
    if (os_log_type_enabled(v116, v117))
    {
      v118 = (uint8_t *)swift_slowAlloc();
      v119 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v118 = 138412290;
      v120 = v113;
      v121 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v281[0] = v121;
      sub_1AF24157C();
      *v119 = v121;
      v99 = v266;

      _os_log_impl(&dword_1AF203000, v116, v117, "error formatting config %@", v118, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33E80);
      swift_arrayDestroy();
      MEMORY[0x1AF45A8C4](v119, -1, -1);
      MEMORY[0x1AF45A8C4](v118, -1, -1);
    }
    else
    {

    }
    v122 = v267;
    v123 = v253;

    sub_1AF218DD8(v113);
    v124 = v275;
    sub_1AF216DEC(v70);

    swift_release();
    ((void (*)(char *, uint64_t))v123[1])(v124, v122);
    return 0;
  }
  v74 = (void *)objc_opt_self();
  v75 = (void *)sub_1AF2411EC();
  swift_bridgeObjectRelease();
  v76 = v266;
  v77 = objc_msgSend(v74, sel_writePropertyList_toStream_format_options_error_, v75, v266, 200, 0, 0);

  objc_msgSend(v76, sel_close);
  sub_1AF20C87C(0, &qword_1ED32EB70);
  v78 = (uint64_t)v265;
  v79 = v267;
  v80 = v252;
  v252(v265, v275, v267);
  v81 = v70;
  v111 = sub_1AF216F58(v78);
  v125 = sub_1AF239BEC();
  v273 = v126;

  v127 = v260;
  sub_1AF20DC38(v262, v260, (uint64_t *)&unk_1ED32FF80);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v127, 1, v79);
  if (EnumTagSinglePayload == 1)
  {
    sub_1AF209710(v127, (uint64_t *)&unk_1ED32FF80);
    if (qword_1ED32E488 != -1)
      swift_once();
    v129 = sub_1AF2411B0();
    __swift_project_value_buffer(v129, (uint64_t)qword_1ED32E560);
    v130 = sub_1AF241198();
    v131 = sub_1AF2414B0();
    if (os_log_type_enabled(v130, v131))
    {
      v132 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v132 = 0;
      _os_log_impl(&dword_1AF203000, v130, v131, "error getting pathToCache for config.plist", v132, 2u);
      MEMORY[0x1AF45A8C4](v132, -1, -1);
    }

    sub_1AF219898();
    v133 = (void *)swift_allocError();
    *v134 = 8;
    sub_1AF218DD8(v133);

    v135 = v275;
    sub_1AF216DEC(v70);

    swift_release();
    ((void (*)(char *, uint64_t))v253[1])(v135, v79);
  }
  else
  {
    v251(v263, v127, v79);
    sub_1AF240DCC();
    sub_1AF240D9C();
    v136 = (void *)sub_1AF24124C();
    swift_bridgeObjectRelease();
    v137 = objc_msgSend(v70, sel_fileExistsAtPath_, v136);

    v272 = v125;
    if ((v137 & 1) == 0)
    {
      v138 = (void *)sub_1AF240DA8();
      v281[0] = 0;
      v139 = objc_msgSend(v70, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v138, 1, 0, v281);

      if (v139)
      {
        v140 = v281[0];
      }
      else
      {
        v141 = v281[0];
        v142 = (void *)sub_1AF240D6C();

        swift_willThrow();
        if (qword_1ED32E488 != -1)
          swift_once();
        v143 = sub_1AF2411B0();
        __swift_project_value_buffer(v143, (uint64_t)qword_1ED32E560);
        v144 = v142;
        v145 = v142;
        v146 = sub_1AF241198();
        v147 = sub_1AF2414B0();
        if (os_log_type_enabled(v146, v147))
        {
          v148 = (uint8_t *)swift_slowAlloc();
          v149 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v148 = 138412290;
          v79 = v267;
          v271 = (char *)(v148 + 4);
          v150 = v142;
          v151 = (void *)_swift_stdlib_bridgeErrorToNSError();
          v281[0] = v151;
          v125 = v272;
          sub_1AF24157C();
          *v149 = v151;
          v76 = v266;

          _os_log_impl(&dword_1AF203000, v146, v147, "error creating pegasus configd cache folder: %@", v148, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33E80);
          swift_arrayDestroy();
          MEMORY[0x1AF45A8C4](v149, -1, -1);
          MEMORY[0x1AF45A8C4](v148, -1, -1);
        }
        else
        {

        }
        v81 = v274;

        sub_1AF218DD8(v142);
      }
    }
    v152 = (void *)sub_1AF240DA8();
    v281[0] = 0;
    v153 = objc_msgSend(v81, sel_removeItemAtURL_error_, v152, v281);

    if (v153)
    {
      v154 = v281[0];
    }
    else
    {
      v155 = v281[0];
      v156 = (void *)sub_1AF240D6C();

      swift_willThrow();
    }
    v157 = (void *)sub_1AF240DA8();
    v158 = (void *)sub_1AF240DA8();
    v281[0] = 0;
    v159 = objc_msgSend(v81, sel_copyItemAtURL_toURL_error_, v157, v158, v281);

    v160 = v281[0];
    if (v159)
    {
      sub_1AF218DB8((uint64_t)v77);
      v161 = v160;
      v162 = v257;
    }
    else
    {
      v163 = v281[0];
      v164 = (void *)sub_1AF240D6C();

      swift_willThrow();
      if (qword_1ED32E488 != -1)
        swift_once();
      v165 = sub_1AF2411B0();
      __swift_project_value_buffer(v165, (uint64_t)qword_1ED32E560);
      v166 = v254;
      v80(v254, v275, v79);
      v167 = v255;
      v80(v255, v263, v79);
      v168 = v164;
      v169 = v164;
      v170 = sub_1AF241198();
      v171 = sub_1AF2414B0();
      if (os_log_type_enabled(v170, v171))
      {
        v172 = v166;
        v173 = swift_slowAlloc();
        v270 = (_QWORD *)swift_slowAlloc();
        v271 = (char *)swift_slowAlloc();
        v281[0] = v271;
        *(_DWORD *)v173 = 136315650;
        v174 = sub_1AF240D9C();
        v278 = sub_1AF208AF4(v174, v175, (uint64_t *)v281);
        sub_1AF24157C();
        swift_bridgeObjectRelease();
        v176 = (void (*)(char *, uint64_t))v253[1];
        v176(v172, v267);
        *(_WORD *)(v173 + 12) = 2080;
        v177 = sub_1AF240D9C();
        v278 = sub_1AF208AF4(v177, v178, (uint64_t *)v281);
        sub_1AF24157C();
        swift_bridgeObjectRelease();
        v176(v167, v267);
        v79 = v267;
        *(_WORD *)(v173 + 22) = 2112;
        v179 = v164;
        v180 = _swift_stdlib_bridgeErrorToNSError();
        v278 = v180;
        v76 = v266;
        sub_1AF24157C();
        v181 = v270;
        *v270 = v180;
        v81 = v274;

        _os_log_impl(&dword_1AF203000, v170, v171, "error copying config from %s to %s: %@", (uint8_t *)v173, 0x20u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33E80);
        swift_arrayDestroy();
        MEMORY[0x1AF45A8C4](v181, -1, -1);
        v182 = v271;
        swift_arrayDestroy();
        MEMORY[0x1AF45A8C4](v182, -1, -1);
        MEMORY[0x1AF45A8C4](v173, -1, -1);

      }
      else
      {

        v183 = (void (*)(char *, uint64_t))v253[1];
        v183(v166, v79);
        v183(v167, v79);

      }
      v125 = v272;
      v162 = v257;
      v80 = v252;
    }
    v184 = (void *)sub_1AF240DA8();
    v281[0] = 0;
    v185 = objc_msgSend(v81, sel_removeItemAtURL_error_, v184, v281);

    if (v185)
    {
      v186 = v281[0];
    }
    else
    {
      v187 = v281[0];
      v188 = (void *)sub_1AF240D6C();

      swift_willThrow();
      if (qword_1ED32E488 != -1)
        swift_once();
      v189 = sub_1AF2411B0();
      __swift_project_value_buffer(v189, (uint64_t)qword_1ED32E560);
      v80(v162, v275, v79);
      v190 = v188;
      v191 = v188;
      v192 = sub_1AF241198();
      v193 = sub_1AF2414B0();
      if (os_log_type_enabled(v192, v193))
      {
        v194 = v162;
        v195 = swift_slowAlloc();
        v196 = (_QWORD *)swift_slowAlloc();
        v271 = (char *)swift_slowAlloc();
        v281[0] = v271;
        *(_DWORD *)v195 = 136315394;
        v197 = sub_1AF240D9C();
        v278 = sub_1AF208AF4(v197, v198, (uint64_t *)v281);
        sub_1AF24157C();
        swift_bridgeObjectRelease();
        ((void (*)(char *, uint64_t))v253[1])(v194, v79);
        *(_WORD *)(v195 + 12) = 2112;
        v199 = v188;
        v200 = _swift_stdlib_bridgeErrorToNSError();
        v278 = v200;
        v81 = v274;
        sub_1AF24157C();
        *v196 = v200;
        v76 = v266;

        _os_log_impl(&dword_1AF203000, v192, v193, "error removing temporary config from %s: %@", (uint8_t *)v195, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33E80);
        swift_arrayDestroy();
        v201 = v196;
        v125 = v272;
        MEMORY[0x1AF45A8C4](v201, -1, -1);
        v202 = v271;
        swift_arrayDestroy();
        MEMORY[0x1AF45A8C4](v202, -1, -1);
        MEMORY[0x1AF45A8C4](v195, -1, -1);

      }
      else
      {

        ((void (*)(char *, uint64_t))v253[1])(v162, v79);
      }
    }
    v203 = (uint64_t)v258;
    v204 = type metadata accessor for LocalCachePaths(0);
    sub_1AF20DC38(v262 + *(int *)(v204 + 20), v203, (uint64_t *)&unk_1ED32FF80);
    if (__swift_getEnumTagSinglePayload(v203, 1, v79) == 1)
    {
      v205 = (void (*)(char *, uint64_t))v253[1];
      v205(v261, v79);
      v205(v263, v79);
      sub_1AF209710(v203, (uint64_t *)&unk_1ED32FF80);
    }
    else
    {
      v206 = v256;
      v251(v256, v203, v79);
      sub_1AF240DCC();
      sub_1AF240D9C();
      v207 = (void *)sub_1AF24124C();
      swift_bridgeObjectRelease();
      v208 = objc_msgSend(v81, sel_fileExistsAtPath_, v207);

      if ((v208 & 1) == 0)
      {
        v209 = (void *)sub_1AF240DA8();
        v281[0] = 0;
        v210 = objc_msgSend(v81, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v209, 1, 0, v281);

        if (v210)
        {
          v211 = v281[0];
        }
        else
        {
          v212 = v281[0];
          v213 = (void *)sub_1AF240D6C();

          swift_willThrow();
          if (qword_1ED32E488 != -1)
            swift_once();
          v214 = sub_1AF2411B0();
          __swift_project_value_buffer(v214, (uint64_t)qword_1ED32E560);
          v215 = v213;
          v216 = v213;
          v217 = sub_1AF241198();
          v218 = sub_1AF2414B0();
          if (os_log_type_enabled(v217, v218))
          {
            v219 = (uint8_t *)swift_slowAlloc();
            v274 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v219 = 138412290;
            v79 = v267;
            v220 = v213;
            v221 = (void *)_swift_stdlib_bridgeErrorToNSError();
            v281[0] = v221;
            sub_1AF24157C();
            v222 = v274;
            *v274 = v221;
            v76 = v266;

            _os_log_impl(&dword_1AF203000, v217, v218, "error creating bag copy folder: %@", v219, 0xCu);
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33E80);
            swift_arrayDestroy();
            v206 = v256;
            MEMORY[0x1AF45A8C4](v222, -1, -1);
            MEMORY[0x1AF45A8C4](v219, -1, -1);

          }
          else
          {

          }
        }
      }
      v223 = (void *)sub_1AF240DA8();
      v281[0] = 0;
      v224 = objc_msgSend(v81, sel_removeItemAtURL_error_, v223, v281);

      if (v224)
      {
        v225 = v281[0];
      }
      else
      {
        v226 = v281[0];
        v227 = (void *)sub_1AF240D6C();

        swift_willThrow();
      }
      v228 = v263;
      v229 = (void *)sub_1AF240DA8();
      v230 = (void *)sub_1AF240DA8();
      v281[0] = 0;
      v231 = objc_msgSend(v81, sel_copyItemAtURL_toURL_error_, v229, v230, v281);

      if (v231)
      {
        v205 = (void (*)(char *, uint64_t))v253[1];
        v232 = v281[0];
        v205(v259, v79);
        v205(v206, v79);
        v205(v261, v79);
        v205(v228, v79);
      }
      else
      {
        v233 = v281[0];
        v234 = (void *)sub_1AF240D6C();

        swift_willThrow();
        if (qword_1ED32E488 != -1)
          swift_once();
        v235 = sub_1AF2411B0();
        __swift_project_value_buffer(v235, (uint64_t)qword_1ED32E560);
        v236 = v234;
        v237 = v234;
        v238 = sub_1AF241198();
        v239 = sub_1AF2414B0();
        v240 = os_log_type_enabled(v238, v239);
        v241 = v263;
        if (v240)
        {
          v242 = (uint8_t *)swift_slowAlloc();
          v243 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v242 = 138412290;
          v244 = v234;
          v245 = (void *)_swift_stdlib_bridgeErrorToNSError();
          v281[0] = v245;
          v125 = v272;
          v246 = v263;
          sub_1AF24157C();
          *v243 = v245;
          v76 = v266;

          _os_log_impl(&dword_1AF203000, v238, v239, "Copy bag to location failed with error: %@", v242, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33E80);
          swift_arrayDestroy();
          v247 = v243;
          v79 = v267;
          MEMORY[0x1AF45A8C4](v247, -1, -1);
          v248 = v242;
          v241 = v246;
          MEMORY[0x1AF45A8C4](v248, -1, -1);

        }
        else
        {

        }
        v205 = (void (*)(char *, uint64_t))v253[1];
        v205(v259, v79);
        v205(v206, v79);
        v205(v261, v79);
        v205(v241, v79);
      }
    }
    v249 = v275;
    sub_1AF216DEC(v81);

    swift_release();
    v205(v249, v79);
  }
  return v125;
}

id sub_1AF216D7C()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_1AF24124C();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initFileURLWithPath_, v1);

  return v2;
}

void sub_1AF216DEC(void *a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (void *)sub_1AF240DA8();
  v6[0] = 0;
  LODWORD(a1) = objc_msgSend(a1, sel_removeItemAtURL_error_, v2, v6);

  if ((_DWORD)a1)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    v5 = (void *)sub_1AF240D6C();

    swift_willThrow();
  }
}

id sub_1AF216ED4(uint64_t a1, char a2)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_1AF240DA8();
  v6 = objc_msgSend(v4, sel_initWithURL_append_, v5, a2 & 1);

  v7 = sub_1AF240E2C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
  return v6;
}

id sub_1AF216F58(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  id v7;
  id v8;
  uint64_t v9;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = (void *)sub_1AF240DA8();
  v11[0] = 0;
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_fileHandleForReadingFromURL_error_, v2, v11);

  v4 = v11[0];
  if (v3)
  {
    v5 = sub_1AF240E2C();
    v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
    v7 = v4;
    v6(a1, v5);
  }
  else
  {
    v8 = v11[0];
    sub_1AF240D6C();

    swift_willThrow();
    v9 = sub_1AF240E2C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
  }
  return v3;
}

uint64_t sub_1AF21706C()
{
  uint64_t result;

  sub_1AF20C87C(0, (unint64_t *)&qword_1ED32E9B8);
  if (qword_1ED32EAD0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  result = sub_1AF241528();
  qword_1ED32E5A0 = result;
  return result;
}

void sub_1AF217110(uint64_t a1)
{
  sub_1AF217148(a1, (uint64_t (*)(_QWORD))MEMORY[0x1E0DF2258], qword_1ED32E560, MEMORY[0x1E0DF2268]);
}

void sub_1AF21712C(uint64_t a1)
{
  sub_1AF217148(a1, (uint64_t (*)(_QWORD))MEMORY[0x1E0DF2170], qword_1ED32E580, MEMORY[0x1E0DF2148]);
}

void sub_1AF217148(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t *a3, void (*a4)(id))
{
  uint64_t v6;

  v6 = a2(0);
  __swift_allocate_value_buffer(v6, a3);
  __swift_project_value_buffer(v6, (uint64_t)a3);
  if (qword_1ED32E5A8 != -1)
    swift_once();
  a4((id)qword_1ED32E5A0);
  OUTLINED_FUNCTION_49();
}

void sub_1AF2171CC()
{
  qword_1EEE33FE0 = 0x6C72756761625F5FLL;
  *(_QWORD *)algn_1EEE33FE8 = 0xE800000000000000;
}

void sub_1AF2171F0()
{
  OUTLINED_FUNCTION_149(&qword_1ED330260);
}

unint64_t sub_1AF217218()
{
  unint64_t result;

  result = qword_1EEE33660;
  if (!qword_1EEE33660)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for ShouldThrottleConfigFetchResultReason, &type metadata for ShouldThrottleConfigFetchResultReason);
    atomic_store(result, &qword_1EEE33660);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ShouldThrottleConfigFetchResultReason(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ShouldThrottleConfigFetchResultReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AF217328 + 4 * byte_1AF2420D0[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1AF21735C + 4 * byte_1AF2420CB[v4]))();
}

uint64_t sub_1AF21735C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF217364(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF21736CLL);
  return result;
}

uint64_t sub_1AF217378(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF217380);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1AF217384(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF21738C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for ShouldThrottleConfigFetchResultReason()
{
  OUTLINED_FUNCTION_103();
}

uint64_t getEnumTagSinglePayload for ShouldThrottleConfigFetchResult(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
  {
    v6 = *a1;
    v7 = v6 >= 3;
    v8 = v6 - 3;
    if (!v7)
      v8 = -1;
    if (v8 + 1 >= 2)
      return v8;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 3;
    if (a2 + 3 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_1AF2173F8 + 4 * byte_1AF2420D5[v4]))();
  }
}

uint64_t sub_1AF21744C(unsigned __int8 *a1)
{
  unsigned int v1;

  v1 = *a1;
  if (v1 >= 3)
    return v1 - 2;
  else
    return 0;
}

_BYTE *sub_1AF217460(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 2;
  return result;
}

uint64_t dispatch thunk of PegasusConfigDelegate.didChangeConfig(from:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.shouldPersistConfig.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.shouldThrottleFetchRequest.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.isRefreshDisabled(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.cachedURLString.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.localCacheURLs.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.createRequest()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.hasRequiredContext.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.willFetchConfig(request:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.didFetchConfigRequest(withResult:startContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 80))();
}

uint64_t dispatch thunk of PegasusConfigDelegate.didFailConfigRequest(withError:startContext:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 88))();
}

uint64_t *initializeBufferWithCopyOfBuffer for LocalCachePaths(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1AF240E2C();
    if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v7))
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v7);
    }
    v10 = *(int *)(a3 + 20);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v7))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v11, v12, v7);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for LocalCachePaths(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = sub_1AF240E2C();
  if (!__swift_getEnumTagSinglePayload(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  result = __swift_getEnumTagSinglePayload(v5, 1, v4);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v5, v4);
  return result;
}

char *initializeWithCopy for LocalCachePaths(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = sub_1AF240E2C();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v6))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v9, v10, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for LocalCachePaths(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_1AF240E2C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 24))(a1, a2, v6);
LABEL_7:
  v11 = *(int *)(a3 + 20);
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (!v14)
  {
    v16 = *(_QWORD *)(v6 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 24))(v12, v13, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
    goto LABEL_12;
  }
  if (v15)
  {
LABEL_12:
    v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v12, v13, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
  return a1;
}

char *initializeWithTake for LocalCachePaths(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = sub_1AF240E2C();
  if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6))
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v6))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v9, v10, v6);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for LocalCachePaths(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumTagSinglePayload;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v6 = sub_1AF240E2C();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v6);
  v8 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v6);
  if (EnumTagSinglePayload)
  {
    if (!v8)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v9 = *(_QWORD *)(v6 - 8);
  if (v8)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(a1, v6);
LABEL_6:
    v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 40))(a1, a2, v6);
LABEL_7:
  v11 = *(int *)(a3 + 20);
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = __swift_getEnumTagSinglePayload((uint64_t)&a1[v11], 1, v6);
  v15 = __swift_getEnumTagSinglePayload((uint64_t)v13, 1, v6);
  if (!v14)
  {
    v16 = *(_QWORD *)(v6 - 8);
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v12, v13, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v6);
    goto LABEL_12;
  }
  if (v15)
  {
LABEL_12:
    v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v12, v13, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LocalCachePaths()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AF217C18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for LocalCachePaths()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AF217C5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  v0 = OUTLINED_FUNCTION_154();
  return __swift_storeEnumTagSinglePayload(v0, v1, v2, v3);
}

void sub_1AF217C8C()
{
  unint64_t v0;

  sub_1AF217CF4();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_1AF217CF4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED32E540)
  {
    sub_1AF240E2C();
    v0 = sub_1AF241534();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED32E540);
  }
}

uint64_t type metadata accessor for PegasusConfigController()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ConfigTaskController()
{
  return objc_opt_self();
}

uint64_t sub_1AF217D8C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1AF241534();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for Container(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Container);
}

uint64_t type metadata accessor for ConfigUsageReporter()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ConfigUsageReporter.State()
{
  return objc_opt_self();
}

void type metadata accessor for PegasusConfigControllerInternals()
{
  OUTLINED_FUNCTION_103();
}

void type metadata accessor for BMStreamIdentifier(uint64_t a1)
{
  sub_1AF21A640(a1, (unint64_t *)&unk_1EEE336E0);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_1AF21A640(a1, &qword_1ED32F7C8);
}

uint64_t sub_1AF217E94(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_1AF217EC8()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_1AF217ED0(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_1AF217F10(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_1AF217F48(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1AF217F88(uint64_t result, int a2, int a3)
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

void type metadata accessor for ConfigResult()
{
  OUTLINED_FUNCTION_103();
}

uint64_t sub_1AF217FD0()
{
  uint64_t result;

  sub_1AF20C87C(0, (unint64_t *)&qword_1ED32E9B8);
  result = sub_1AF241528();
  qword_1ED32E7F0 = result;
  return result;
}

uint64_t sub_1AF21803C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(unint64_t, _QWORD, uint64_t);
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v0 = sub_1AF240F04();
  v25 = *(_QWORD *)(v0 - 8);
  v26 = v0;
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1AF241000();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_1AF240D54();
  v24 = *(_QWORD *)(v27 - 8);
  MEMORY[0x1E0C80A78](v27);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF240FE8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32EA10);
  v9 = sub_1AF240FF4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1AF242870;
  v14 = v13 + v12;
  v15 = *(void (**)(unint64_t, _QWORD, uint64_t))(v10 + 104);
  v15(v14, *MEMORY[0x1E0CB1140], v9);
  v15(v14 + v11, *MEMORY[0x1E0CB1178], v9);
  sub_1AF23C760(v13);
  sub_1AF240EEC();
  sub_1AF240FD0();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v2, v26);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v16 = sub_1AF240D24();
  if ((v17 & 1) != 0)
    goto LABEL_7;
  v18 = v16;
  v19 = sub_1AF240D3C();
  v21 = v20;
  result = (*(uint64_t (**)(char *, uint64_t))(v24 + 8))(v8, v27);
  if ((v21 & 1) != 0)
    return -1;
  v23 = 100 * v18;
  if ((unsigned __int128)(v18 * (__int128)100) >> 64 != (100 * v18) >> 63)
  {
    __break(1u);
    return result;
  }
  result = v23 + v19;
  if (__OFADD__(v23, v19))
  {
    __break(1u);
LABEL_7:
    (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v27);
    return -1;
  }
  return result;
}

void sub_1AF218278(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 472);
  v3 = *(void **)(v1 + v2);
  *(_QWORD *)(v1 + v2) = a1;
  v4 = a1;

}

uint64_t sub_1AF2182A8(_QWORD *a1, int a2)
{
  uint64_t v2;
  id *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD *v17;
  unsigned __int8 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  os_unfair_lock_s *v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t ObjectType;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t result;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;

  v3 = (id *)v2;
  v43 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E948);
  v6 = MEMORY[0x1E0C80A78](v5);
  v40 = (uint64_t)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v40 - v8;
  v10 = sub_1AF240F04();
  v41 = *(_QWORD *)(v10 - 8);
  v42 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_weakInit();
  *(_QWORD *)(v2 + 24) = 0;
  *(_QWORD *)(v2 + 32) = 0;
  *(_WORD *)(v2 + 40) = 256;
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 56) = 0;
  *(_QWORD *)(v2 + 64) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v2 + 72) = 0;
  *(_BYTE *)(v2 + 81) = 0;
  v46 = qword_1ED32EA60;
  v47 = unk_1ED32EA68;
  v44 = 45;
  v45 = 0xE100000000000000;
  sub_1AF20C87C(0, (unint64_t *)&qword_1ED32E9B8);
  v48 = 95;
  v49 = 0xE100000000000000;
  sub_1AF208AB8();
  sub_1AF2415A0();
  if (qword_1ED32E4E8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  *(_QWORD *)(v2 + 88) = sub_1AF241528();
  v13 = v2 + *(_QWORD *)(*(_QWORD *)v2 + 136);
  v14 = sub_1AF241138();
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v14);
  v15 = *((_QWORD *)*v3 + 19);
  type metadata accessor for Locker();
  v16 = swift_allocObject();
  v17 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v16 + 16) = v17;
  *v17 = 0;
  *(id *)((char *)v3 + v15) = (id)v16;
  sub_1AF240EF8();
  (*(void (**)(char *, char *, uint64_t))(v41 + 32))((char *)v3 + *((_QWORD *)*v3 + 18), v12, v42);
  swift_weakAssign();
  v18 = v43;
  *((_BYTE *)v3 + 80) = v43;
  v19 = v3[11];
  swift_retain();
  sub_1AF241114();
  v42 = v14;
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v14);
  v20 = (uint64_t)v3 + *((_QWORD *)*v3 + 17);
  swift_beginAccess();
  v41 = v20;
  sub_1AF20C910((uint64_t)v9, v20);
  swift_endAccess();
  v46 = (uint64_t)v3;
  swift_retain();
  v21 = sub_1AF2412AC();
  v23 = v22;
  v24 = *(os_unfair_lock_s **)(a1[4] + 16);
  os_unfair_lock_lock(v24);
  v25 = a1 + 2;
  v26 = a1;
  if (MEMORY[0x1AF45A960](a1 + 2))
  {
    v27 = a1[3];
    swift_beginAccess();
    v28 = a1;
    v29 = a1[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1AF239DC8(v21, v23, v29);
    v31 = v30;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    if (v31)
    {
      ObjectType = swift_getObjectType();
      (*(void (**)(id *, _UNKNOWN **, uint64_t, uint64_t))(v27 + 32))(v3, &off_1E5F3BC20, ObjectType, v27);
    }
    swift_unknownObjectRelease();
    v26 = v28;
    v18 = v43;
  }
  type metadata accessor for ActivityMonitor.WeakReference();
  v33 = swift_allocObject();
  *(_QWORD *)(v33 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v33 + 24) = &off_1E5F3BC20;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1AF20C8B4(v33, v21, v23);
  swift_endAccess();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v24);
  swift_bridgeObjectRelease();
  if (MEMORY[0x1AF45A960](v25))
  {
    v34 = v26[3];
    v35 = swift_getObjectType();
    (*(void (**)(id *, _UNKNOWN **, uint64_t, uint64_t))(v34 + 8))(v3, &off_1E5F3BC20, v35, v34);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
  v36 = v40;
  v37 = v42;
  sub_1AF20DC38(v41, v40, &qword_1ED32E948);
  result = __swift_getEnumTagSinglePayload(v36, 1, v37);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v39 = v3[11];
    sub_1AF2414E0();
    sub_1AF232A00(v18);
    sub_1AF241108();

    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 8))(v36, v37);
    swift_release();
    return (uint64_t)v3;
  }
  return result;
}

uint64_t sub_1AF218804(_QWORD *a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v6;
  id *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _DWORD *v21;
  unsigned __int8 v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  os_unfair_lock_s *v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t ObjectType;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t result;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  _BYTE v48[4];
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  unint64_t v62;

  v7 = (id *)v6;
  v51 = a4;
  v52 = a6;
  v49 = a5;
  v50 = a3;
  v56 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E948);
  v10 = MEMORY[0x1E0C80A78](v9);
  v53 = &v48[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v10);
  v13 = &v48[-v12];
  v14 = sub_1AF240F04();
  v54 = *(_QWORD *)(v14 - 8);
  v55 = v14;
  MEMORY[0x1E0C80A78](v14);
  v16 = &v48[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  swift_weakInit();
  *(_QWORD *)(v6 + 24) = 0;
  *(_QWORD *)(v6 + 32) = 0;
  *(_WORD *)(v6 + 40) = 256;
  *(_QWORD *)(v6 + 48) = 0;
  *(_QWORD *)(v6 + 56) = 0;
  *(_QWORD *)(v6 + 64) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v6 + 72) = 0;
  *(_BYTE *)(v6 + 81) = 0;
  v59 = 0xD000000000000010;
  v60 = 0x80000001AF246690;
  v57 = 45;
  v58 = 0xE100000000000000;
  sub_1AF20C87C(0, (unint64_t *)&qword_1ED32E9B8);
  v61 = 95;
  v62 = 0xE100000000000000;
  v47 = sub_1AF208AB8();
  sub_1AF2415A0();
  if (qword_1ED32E4F8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  *(_QWORD *)(v6 + 88) = sub_1AF241528();
  v17 = v6 + *(_QWORD *)(*(_QWORD *)v6 + 136);
  v18 = sub_1AF241138();
  __swift_storeEnumTagSinglePayload(v17, 1, 1, v18);
  v19 = *((_QWORD *)*v7 + 19);
  type metadata accessor for Locker();
  v20 = swift_allocObject();
  v21 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v20 + 16) = v21;
  *v21 = 0;
  *(id *)((char *)v7 + v19) = (id)v20;
  sub_1AF240EF8();
  (*(void (**)(char *, _BYTE *, uint64_t))(v54 + 32))((char *)v7 + *((_QWORD *)*v7 + 18), v16, v55);
  swift_weakAssign();
  v22 = v56;
  *((_BYTE *)v7 + 80) = v56;
  v23 = v7[11];
  swift_retain();
  sub_1AF241114();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v18);
  v24 = (uint64_t)v7 + *((_QWORD *)*v7 + 17);
  swift_beginAccess();
  v55 = v24;
  sub_1AF20C910((uint64_t)v13, v24);
  swift_endAccess();
  v59 = (unint64_t)v7;
  swift_retain();
  v25 = sub_1AF2412AC();
  v27 = v26;
  v28 = *(os_unfair_lock_s **)(a1[4] + 16);
  os_unfair_lock_lock(v28);
  v29 = a1 + 2;
  v30 = a1;
  if (MEMORY[0x1AF45A960](a1 + 2))
  {
    v54 = v18;
    v31 = a1[3];
    swift_beginAccess();
    v32 = a1;
    v33 = a1[5];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1AF239DC8(v25, v27, v33);
    v35 = v34;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    if (v35)
    {
      ObjectType = swift_getObjectType();
      (*(void (**)(id *, _UNKNOWN **, uint64_t, uint64_t))(v31 + 32))(v7, &off_1E5F3BC20, ObjectType, v31);
    }
    swift_unknownObjectRelease();
    v30 = v32;
    v22 = v56;
    v18 = v54;
  }
  type metadata accessor for ActivityMonitor.WeakReference();
  v37 = swift_allocObject();
  *(_QWORD *)(v37 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v37 + 24) = &off_1E5F3BC20;
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1AF20C8B4(v37, v25, v27);
  swift_endAccess();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v28);
  swift_bridgeObjectRelease();
  if (MEMORY[0x1AF45A960](v29))
  {
    v38 = v30[3];
    v39 = swift_getObjectType();
    (*(void (**)(id *, _UNKNOWN **, uint64_t, uint64_t))(v38 + 8))(v7, &off_1E5F3BC20, v39, v38);
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
  v40 = v53;
  sub_1AF20DC38(v55, (uint64_t)v53, &qword_1ED32E948);
  result = __swift_getEnumTagSinglePayload((uint64_t)v40, 1, v18);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v42 = v7[11];
    v43 = sub_1AF2414E0();
    v44 = sub_1AF20D8DC(v22);
    LOBYTE(v47) = v49;
    sub_1AF20CB84(v43, (uint64_t)v42, v44, v45, v46, (uint64_t)v40, v50, v51, v47, v52);

    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v40, v18);
    swift_release();
    return (uint64_t)v7;
  }
  return result;
}

uint64_t sub_1AF218D9C(_QWORD *a1, int a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + qword_1ED32E6C0) = 0;
  *(_QWORD *)(v3 + *(_QWORD *)(*(_QWORD *)v3 + 472)) = a3;
  return sub_1AF2182A8(a1, a2);
}

uint64_t sub_1AF218DB8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 472);
  v3 = *(_QWORD *)(v1 + v2);
  v4 = __OFADD__(v3, result);
  v5 = v3 + result;
  if (v4)
    __break(1u);
  else
    *(_QWORD *)(v1 + v2) = v5;
  return result;
}

void sub_1AF218DD8(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + qword_1ED32E6C0);
  *(_QWORD *)(v1 + qword_1ED32E6C0) = a1;
  v3 = a1;

}

uint64_t sub_1AF218E08(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;

  *(_QWORD *)(v1 + 16) = a1;
  swift_retain();
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = 0;
  swift_release();
  return v1;
}

uint64_t sub_1AF218E4C(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a2 + 72) = os_transaction_create();
  return swift_unknownObjectRelease();
}

uint64_t sub_1AF218E84(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1AF241258();
  *a2 = 0;
  return result;
}

uint64_t sub_1AF218EF8(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1AF241264();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1AF218F74()
{
  uint64_t v0;

  sub_1AF241270();
  v0 = sub_1AF24124C();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_1AF218FA8()
{
  uint64_t *v0;

  sub_1AF21913C(*v0, (void (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1AF218FD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1AF218F74();
  *a1 = result;
  return result;
}

uint64_t sub_1AF218FF4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1AF24124C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_1AF219038(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = sub_1AF21905C();
  a1[1] = v2;
  OUTLINED_FUNCTION_50();
}

uint64_t sub_1AF219060()
{
  sub_1AF209868(&qword_1EEE33768, (uint64_t (*)(uint64_t))type metadata accessor for BMStreamIdentifier, (uint64_t)&unk_1AF242514);
  sub_1AF209868(&qword_1EEE33770, (uint64_t (*)(uint64_t))type metadata accessor for BMStreamIdentifier, (uint64_t)&unk_1AF2424B4);
  return sub_1AF2416E4();
}

void sub_1AF2190E4()
{
  sub_1AF209868(&qword_1EEE33750, (uint64_t (*)(uint64_t))type metadata accessor for BMStreamIdentifier, (uint64_t)&unk_1AF242478);
}

void sub_1AF219110()
{
  sub_1AF209868(&qword_1EEE33758, (uint64_t (*)(uint64_t))type metadata accessor for BMStreamIdentifier, (uint64_t)&unk_1AF24244C);
}

void sub_1AF21913C(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;

  v3 = sub_1AF241270();
  a2(v3);
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_50();
}

uint64_t sub_1AF21916C()
{
  sub_1AF241270();
  sub_1AF241300();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF2191AC()
{
  uint64_t v0;

  sub_1AF241270();
  sub_1AF2417EC();
  sub_1AF241300();
  v0 = sub_1AF241810();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_1AF21921C()
{
  uint64_t *v0;

  sub_1AF21913C(*v0, MEMORY[0x1E0DEA950]);
}

uint64_t sub_1AF21923C()
{
  return sub_1AF21916C();
}

uint64_t sub_1AF219244()
{
  return sub_1AF2191AC();
}

void sub_1AF21924C()
{
  sub_1AF21F60C();
}

void sub_1AF219258()
{
  sub_1AF209868(&qword_1EEE33760, (uint64_t (*)(uint64_t))type metadata accessor for BMStreamIdentifier, (uint64_t)&unk_1AF2424E8);
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

uint64_t sub_1AF2192C4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1AF2192D4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1AF2192FC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_82();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_107(v0);
  v2 = OUTLINED_FUNCTION_20_0(v1);
  return sub_1AF212C50(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_1AF219350()
{
  OUTLINED_FUNCTION_128();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_114();
  return swift_deallocObject();
}

uint64_t sub_1AF219378()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_82();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_107(v0);
  v2 = OUTLINED_FUNCTION_20_0(v1);
  return sub_1AF212E44(v2, v3, v4, v5, v6, v7);
}

uint64_t objectdestroy_2Tm()
{
  OUTLINED_FUNCTION_128();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_114();
  return swift_deallocObject();
}

uint64_t sub_1AF2193F8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_82();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_107(v0);
  v2 = OUTLINED_FUNCTION_20_0(v1);
  return sub_1AF2126E8(v2, v3, v4, v5, v6, v7);
}

unint64_t sub_1AF21944C()
{
  unint64_t result;

  result = qword_1EEE33528;
  if (!qword_1EEE33528)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF242688, &unk_1E5F3BA20);
    atomic_store(result, (unint64_t *)&qword_1EEE33528);
  }
  return result;
}

uint64_t sub_1AF219488(uint64_t a1, char a2)
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
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32EC30);
  v6 = sub_1AF2416C0();
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
    if (!v10)
      goto LABEL_7;
LABEL_6:
    v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
      v21 = *v19;
      v20 = v19[1];
      v22 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * i);
      if ((a2 & 1) != 0)
      {
        sub_1AF219FD0(v22, v35);
      }
      else
      {
        sub_1AF208D14((uint64_t)v22, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1AF2417EC();
      sub_1AF241300();
      result = sub_1AF241810();
      v23 = -1 << *(_BYTE *)(v7 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6))) == 0)
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v23) >> 6;
        while (++v25 != v28 || (v27 & 1) == 0)
        {
          v29 = v25 == v28;
          if (v25 == v28)
            v25 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v25);
          if (v30 != -1)
          {
            v26 = __clz(__rbit64(~v30)) + (v25 << 6);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      v26 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
      *(_QWORD *)(v11 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
      v31 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v26);
      *v31 = v21;
      v31[1] = v20;
      result = (uint64_t)sub_1AF219FD0(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v26));
      ++*(_QWORD *)(v7 + 16);
      if (v10)
        goto LABEL_6;
LABEL_7:
      v16 = v13 + 1;
      if (__OFADD__(v13, 1))
        goto LABEL_40;
      if (v16 >= v33)
        goto LABEL_33;
      v17 = v34[v16];
      ++v13;
      if (!v17)
      {
        v13 = v16 + 1;
        if (v16 + 1 >= v33)
          goto LABEL_33;
        v17 = v34[v13];
        if (!v17)
        {
          v18 = v16 + 2;
          if (v18 >= v33)
          {
LABEL_33:
            swift_release();
            v3 = v2;
            if ((a2 & 1) != 0)
            {
              v32 = 1 << *(_BYTE *)(v5 + 32);
              if (v32 >= 64)
                sub_1AF2368C4(0, (unint64_t)(v32 + 63) >> 6, v34);
              else
                *v34 = -1 << v32;
              *(_QWORD *)(v5 + 16) = 0;
            }
            break;
          }
          v17 = v34[v18];
          if (!v17)
          {
            while (1)
            {
              v13 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_41;
              if (v13 >= v33)
                goto LABEL_33;
              v17 = v34[v13];
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          v13 = v18;
        }
      }
LABEL_18:
      v10 = (v17 - 1) & v17;
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1AF219780(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

id sub_1AF2197A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  void *v7;
  id v8;

  v6 = (void *)sub_1AF24124C();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_1AF24124C();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(a5, sel_URLForResource_withExtension_, v6, v7);

  return v8;
}

uint64_t sub_1AF219830(uint64_t result, uint64_t a2, char a3)
{
  if (a3 < 0)
    return sub_1AF219840(result, a2, a3 & 0x7F);
  return result;
}

uint64_t sub_1AF219840(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 1u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1AF219858(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF)
    return sub_1AF21986C(a1, a2, a3);
  return a1;
}

uint64_t sub_1AF21986C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 1u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_1AF219884(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 0xFF)
    return sub_1AF219840(a1, a2, a3);
  return a1;
}

unint64_t sub_1AF219898()
{
  unint64_t result;

  result = qword_1EEE337A8;
  if (!qword_1EEE337A8)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF245214, &unk_1E5F3BD50);
    atomic_store(result, (unint64_t *)&qword_1EEE337A8);
  }
  return result;
}

uint64_t sub_1AF2198D4()
{
  OUTLINED_FUNCTION_128();
  return swift_deallocObject();
}

uint64_t sub_1AF2198F4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_107(v1);
  *v2 = v0;
  v2[1] = sub_1AF219954;
  return sub_1AF20EFE4();
}

uint64_t sub_1AF219954()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF219978()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1AF2199C0;
  return sub_1AF20EA10(v0);
}

uint64_t sub_1AF2199C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  OUTLINED_FUNCTION_6();
  return OUTLINED_FUNCTION_59(a1, a2, *(uint64_t (**)(void))(v2 + 8));
}

void sub_1AF2199F8(id a1, unsigned int a2, char a3)
{
  int v3;

  if ((a3 & 1) != 0)
    v3 = 2;
  else
    v3 = 0;
  if ((v3 & 0xFFFFFFFE | (a2 >> 7) & 1) == 1)

}

id sub_1AF219A18(id result, unsigned int a2, char a3)
{
  int v3;

  if ((a3 & 1) != 0)
    v3 = 2;
  else
    v3 = 0;
  if ((v3 & 0xFFFFFFFE | (a2 >> 7) & 1) == 1)
    return result;
  return result;
}

uint64_t sub_1AF219A38()
{
  uint64_t v0;

  OUTLINED_FUNCTION_171();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AF219840(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), *(_BYTE *)(v0 + 112));
  return swift_deallocObject();
}

uint64_t sub_1AF219A7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  _QWORD *v8;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_BYTE *)(v0 + 24);
  v4 = v0 + 32;
  v5 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 104);
  v7 = *(_BYTE *)(v0 + 112);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v8;
  *v8 = v1;
  v8[1] = sub_1AF219AFC;
  return sub_1AF210AC0(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_1AF219AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  OUTLINED_FUNCTION_6();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(a1, a2);
}

uint64_t sub_1AF219B40(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_1AF219B88()
{
  unint64_t result;

  result = qword_1EEE33800;
  if (!qword_1EEE33800)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF2437EC, &type metadata for TaskCoordinator.TaskError);
    atomic_store(result, &qword_1EEE33800);
  }
  return result;
}

uint64_t sub_1AF219BC4(uint64_t a1, unint64_t a2)
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

uint64_t sub_1AF219C08()
{
  OUTLINED_FUNCTION_171();
  swift_release();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_114();
  return swift_deallocObject();
}

uint64_t sub_1AF219C30(void *a1)
{
  uint64_t v1;

  return sub_1AF213C38(a1, *(_QWORD *)(v1 + 16), *(_QWORD **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_1AF219C40(uint64_t a1, unint64_t a2)
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

uint64_t sub_1AF219C84(_QWORD *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v15;
  _QWORD *v16;
  uint64_t inited;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  const char *v24;
  _QWORD *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;

  v15 = a12 + qword_1ED3301C8;
  *(_BYTE *)(v15 + 8) = 1;
  *(_QWORD *)v15 = 0;
  v16 = (_QWORD *)(a12 + qword_1ED3301D0);
  *v16 = a3;
  v16[1] = a4;
  v16[2] = a5;
  if ((a7 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1AF242870;
    v28 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(inited + 56) = MEMORY[0x1E0DEA968];
    v29 = sub_1AF20BFF4();
    *(_QWORD *)(inited + 32) = a4;
    *(_QWORD *)(inited + 40) = a5;
    *(_QWORD *)(inited + 96) = v28;
    *(_QWORD *)(inited + 104) = v29;
    *(_QWORD *)(inited + 64) = v29;
    *(_QWORD *)(inited + 72) = a10;
    *(_QWORD *)(inited + 80) = a11;
    *(_QWORD *)(a12 + *(_QWORD *)(*(_QWORD *)a12 + 472)) = 0;
    v30 = *(_QWORD *)(*(_QWORD *)a12 + 480);
    *(_QWORD *)(a12 + v30) = 0;
    v31 = (_QWORD *)(a12 + *(_QWORD *)(*(_QWORD *)a12 + 464));
    *v31 = a8;
    v31[1] = &off_1E5F3CC30;
    swift_bridgeObjectRetain();
    swift_retain();
    objc_msgSend(a8, sel_set_nw_activity_, a9);
    *(_QWORD *)(a12 + v30) = a9;
    swift_unknownObjectRetain();
    swift_release();
    swift_unknownObjectRelease();
    v24 = "client=%{signpost.description:attribute,public}s, version=%{signpost.description:attribute,public}s";
    v25 = a1;
    v26 = a2;
    v27 = 99;
  }
  else
  {
    *(_QWORD *)v15 = a6;
    *(_BYTE *)(v15 + 8) = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1AF242880;
    v19 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(inited + 56) = MEMORY[0x1E0DEA968];
    v20 = sub_1AF20BFF4();
    *(_QWORD *)(inited + 32) = a4;
    *(_QWORD *)(inited + 40) = a5;
    *(_QWORD *)(inited + 96) = v19;
    *(_QWORD *)(inited + 104) = v20;
    *(_QWORD *)(inited + 64) = v20;
    *(_QWORD *)(inited + 72) = a10;
    *(_QWORD *)(inited + 80) = a11;
    v21 = MEMORY[0x1E0DEE1F0];
    *(_QWORD *)(inited + 136) = MEMORY[0x1E0DEE190];
    *(_QWORD *)(inited + 144) = v21;
    *(_QWORD *)(inited + 112) = a6;
    *(_QWORD *)(a12 + *(_QWORD *)(*(_QWORD *)a12 + 472)) = 0;
    v22 = *(_QWORD *)(*(_QWORD *)a12 + 480);
    *(_QWORD *)(a12 + v22) = 0;
    v23 = (_QWORD *)(a12 + *(_QWORD *)(*(_QWORD *)a12 + 464));
    *v23 = a8;
    v23[1] = &off_1E5F3CC30;
    swift_bridgeObjectRetain();
    swift_retain();
    objc_msgSend(a8, sel_set_nw_activity_, a9);
    *(_QWORD *)(a12 + v22) = a9;
    swift_unknownObjectRetain();
    swift_release();
    swift_unknownObjectRelease();
    v24 = "client=%{signpost.description:attribute,public}s, version=%{signpost.description:attribute,public}s, identifie"
          "r=%{signpost.description:attribute,public}llu";
    v25 = a1;
    v26 = a2;
    v27 = 155;
  }
  v32 = sub_1AF218804(v25, v26, (uint64_t)v24, v27, 2, inited);
  swift_unknownObjectRelease();

  return v32;
}

uint64_t sub_1AF219F00(uint64_t a1)
{
  uint64_t v1;

  return sub_1AF218E4C(a1, v1);
}

uint64_t sub_1AF219F18()
{
  OUTLINED_FUNCTION_128();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AF219F58(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = swift_task_alloc();
  v8 = (_QWORD *)OUTLINED_FUNCTION_107(v7);
  *v8 = v2;
  v8[1] = sub_1AF219954;
  return sub_1AF210718(a1, v4, v5, v6, (uint64_t)(v1 + 5));
}

_OWORD *sub_1AF219FD0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1AF219FE0()
{
  return swift_release();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1AF45A7D4](a1, v6, a5);
}

uint64_t *sub_1AF21A014(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1AF240F04();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    *(_QWORD *)v9 = *(_QWORD *)v10;
    v9[8] = v10[8];
    v11 = a3[7];
    v12 = (uint64_t *)((char *)a1 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1AF21A0CC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v6 = sub_1AF240F04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v7 = a3[6];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_BYTE *)(v9 + 8);
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_BYTE *)(v8 + 8) = v10;
  v11 = a3[7];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1AF21A170(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_1AF240F04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_BYTE *)(v8 + 8) = *(_BYTE *)(v9 + 8);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_1AF21A1F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_1AF240F04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_BYTE *)(v8 + 8) = *(_BYTE *)(v9 + 8);
  v10 = a3[7];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  v14 = *v12;
  v13 = v12[1];
  *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1AF21A280()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_1AF21A28C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (*(_DWORD *)(*(_QWORD *)(OUTLINED_FUNCTION_136() - 8) + 84) == a2)
  {
    v2 = OUTLINED_FUNCTION_80();
    __swift_getEnumTagSinglePayload(v2, v3, v4);
  }
  else
  {
    OUTLINED_FUNCTION_49();
  }
}

uint64_t sub_1AF21A304()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1AF21A310(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_DWORD *)(*(_QWORD *)(OUTLINED_FUNCTION_136() - 8) + 84) == a3)
  {
    v7 = OUTLINED_FUNCTION_154();
    __swift_storeEnumTagSinglePayload(v7, v8, v9, v10);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 28) + 8) = a2;
    OUTLINED_FUNCTION_49();
  }
}

uint64_t sub_1AF21A370()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1AF240F04();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_1AF21A3FC(uint64_t a1)
{
  sub_1AF2199F8(*(id *)a1, *(unsigned __int8 *)(a1 + 8), *(_BYTE *)(a1 + 9));
}

void sub_1AF21A410(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;
  unsigned __int8 v5;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 9);
  v5 = *(_BYTE *)(a2 + 8);
  sub_1AF219A18(*(id *)a2, v5, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 9) = v4;
  OUTLINED_FUNCTION_49();
}

uint64_t sub_1AF21A458(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;
  unsigned __int8 v5;
  void *v6;
  char v7;
  unsigned int v8;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 9);
  v5 = *(_BYTE *)(a2 + 8);
  sub_1AF219A18(*(id *)a2, v5, v4);
  v6 = *(void **)a1;
  v7 = *(_BYTE *)(a1 + 9);
  *(_QWORD *)a1 = v3;
  v8 = *(unsigned __int8 *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 9) = v4;
  sub_1AF2199F8(v6, v8, v7);
  return a1;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t sub_1AF21A4CC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;
  void *v5;
  char v6;
  unsigned int v7;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(_BYTE *)(a2 + 9);
  v5 = *(void **)a1;
  v6 = *(_BYTE *)(a1 + 9);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v7 = *(unsigned __int8 *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 9) = v4;
  sub_1AF2199F8(v5, v7, v6);
  return a1;
}

uint64_t sub_1AF21A514(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x1FE && *(_BYTE *)(a1 + 10))
    {
      v2 = *(_DWORD *)a1 + 509;
    }
    else
    {
      v2 = ((*(unsigned __int8 *)(a1 + 8) >> 7) | (2 * *(unsigned __int8 *)(a1 + 9))) ^ 0x1FF;
      if (v2 >= 0x1FD)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t sub_1AF21A560(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x1FD)
  {
    *(_WORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 510;
    if (a3 >= 0x1FE)
      *(_BYTE *)(result + 10) = 1;
  }
  else
  {
    if (a3 >= 0x1FE)
      *(_BYTE *)(result + 10) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_WORD *)(result + 8) = __PAIR16__((-128 * a2) >> 24, (_BYTE)a2 << 7);
    }
  }
  return result;
}

uint64_t sub_1AF21A5B4(uint64_t a1)
{
  int v1;
  unsigned int v2;

  if (*(_BYTE *)(a1 + 9))
    v1 = 2;
  else
    v1 = 0;
  v2 = v1 | (*(unsigned __int8 *)(a1 + 8) >> 7);
  if (v2 <= 1)
    return v2;
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_1AF21A5E0(uint64_t result)
{
  *(_BYTE *)(result + 8) &= ~0x80u;
  return result;
}

uint64_t sub_1AF21A5F0(uint64_t result, unsigned int a2)
{
  if (a2 < 2)
  {
    *(_BYTE *)(result + 8) = *(_BYTE *)(result + 8) & 0x7F | ((_BYTE)a2 << 7);
  }
  else
  {
    *(_QWORD *)result = a2 - 2;
    *(_BYTE *)(result + 8) = 0;
  }
  *(_BYTE *)(result + 9) = a2 > 1;
  return result;
}

void type metadata accessor for PegasusConfigFetchError()
{
  OUTLINED_FUNCTION_103();
}

void type metadata accessor for CFError(uint64_t a1)
{
  sub_1AF21A640(a1, (unint64_t *)&unk_1EEE33860);
}

void sub_1AF21A640(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_20_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_25(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return swift_task_switch();
}

void OUTLINED_FUNCTION_33(uint64_t a1)
{
  uint64_t *v1;

  sub_1AF209710(a1, v1);
}

BOOL OUTLINED_FUNCTION_34(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_35(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_1AF241744();
}

uint64_t OUTLINED_FUNCTION_39(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return sub_1AF2415D0();
}

void OUTLINED_FUNCTION_51(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1AF20DC38(a1, a2, v2);
}

void OUTLINED_FUNCTION_52()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_53(uint64_t (*a1)(void))
{
  return a1();
}

BOOL OUTLINED_FUNCTION_58(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_59(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_63()
{
  return sub_1AF2414B0();
}

uint64_t OUTLINED_FUNCTION_67()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 120) + 8))(v0, v1);
}

__n128 OUTLINED_FUNCTION_69(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __n128 result;

  *(_QWORD *)(v2 + 144) = v1;
  *(_OWORD *)(v2 + 152) = *(_OWORD *)a1;
  v3 = *(_QWORD *)(a1 + 16);
  *(_BYTE *)(v2 + 122) = *(_BYTE *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v2 + 168) = v3;
  *(_QWORD *)(v2 + 176) = v4;
  result = *(__n128 *)(a1 + 40);
  *(__n128 *)(v2 + 184) = result;
  *(_QWORD *)(v2 + 200) = *(_QWORD *)(a1 + 56);
  return result;
}

_WORD *OUTLINED_FUNCTION_76(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_80()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_84(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_90(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  sub_1AF209710((uint64_t)va, a2);
}

uint64_t OUTLINED_FUNCTION_92(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_97()
{
  return type metadata accessor for ResourceAccessSpan();
}

void OUTLINED_FUNCTION_102()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_106()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_107(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_108()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_109()
{
  uint64_t v0;
  unsigned __int8 v1;
  uint64_t v2;

  return sub_1AF21986C(v0, v2, v1);
}

uint64_t OUTLINED_FUNCTION_114()
{
  uint64_t v0;

  return v0;
}

double OUTLINED_FUNCTION_115()
{
  return 0.0;
}

uint64_t OUTLINED_FUNCTION_116(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_117()
{
  return sub_1AF2414A4();
}

uint64_t OUTLINED_FUNCTION_118()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_120()
{
  unsigned __int8 v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1AF219840(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_121()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_122()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_123()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_124()
{
  unsigned __int8 v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1AF219840(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_125(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

id OUTLINED_FUNCTION_126()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_128()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_129()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_130()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_132()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_133()
{
  void *v0;

}

void OUTLINED_FUNCTION_134(uint64_t a1)
{
  uint64_t *v1;

  sub_1AF209710(a1, v1);
}

uint64_t OUTLINED_FUNCTION_135()
{
  return sub_1AF241420();
}

uint64_t OUTLINED_FUNCTION_137(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_138()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1AF219C40(v1, v0);
}

uint64_t OUTLINED_FUNCTION_139()
{
  return sub_1AF24124C();
}

uint64_t OUTLINED_FUNCTION_140@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v4;

  return a4(a1, a2, a3, v4);
}

void OUTLINED_FUNCTION_142(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1AF209710(v2, a2);
}

uint64_t OUTLINED_FUNCTION_143()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_144()
{
  return sub_1AF226068();
}

uint64_t OUTLINED_FUNCTION_145@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void OUTLINED_FUNCTION_146()
{
  JUMPOUT(0x1AF45A960);
}

uint64_t OUTLINED_FUNCTION_147()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_148@<X0>(uint64_t (*a1)(_QWORD, _QWORD)@<X8>)
{
  uint64_t v1;

  return a1(*(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 104));
}

void OUTLINED_FUNCTION_149(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v1;
  a1[1] = v2 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
}

uint64_t OUTLINED_FUNCTION_150()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 88);
  *(_BYTE *)v2 = *(_BYTE *)(v0 + 160);
  *(_QWORD *)(v2 + 8) = v1;
  return *(_QWORD *)(v0 + 8);
}

uint64_t OUTLINED_FUNCTION_151()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_152()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_153()
{
  return sub_1AF241240();
}

uint64_t OUTLINED_FUNCTION_154()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_155()
{
  sub_1AF22B4B4();
}

uint64_t OUTLINED_FUNCTION_156()
{
  return sub_1AF241498();
}

void OUTLINED_FUNCTION_158(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t OUTLINED_FUNCTION_159()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_160()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_161()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_162(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_164@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_165()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_166()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_167()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_168(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1AF209710(v2, a2);
}

uint64_t OUTLINED_FUNCTION_169()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_170()
{
  return sub_1AF240C70();
}

uint64_t OUTLINED_FUNCTION_171()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_172(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  return sub_1AF208AF4(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_173@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void OUTLINED_FUNCTION_174(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1AF209710(v2, a2);
}

uint64_t OUTLINED_FUNCTION_175()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_176()
{
  uint64_t (*v0)(_QWORD, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(*(_QWORD *)(v2 - 96), v1);
}

uint64_t OUTLINED_FUNCTION_177()
{
  return swift_task_dealloc();
}

uint64_t sub_1AF21AB80()
{
  if (qword_1EEE334A0 != -1)
    swift_once();
  qword_1ED330188 = qword_1EEE33F50;
  unk_1ED330190 = *(_QWORD *)algn_1EEE33F58;
  return swift_bridgeObjectRetain();
}

uint64_t *sub_1AF21ABD0()
{
  if (qword_1ED32E4F8 != -1)
    swift_once();
  return &qword_1ED330188;
}

void sub_1AF21AC10()
{
  qword_1EEE33FF8 = (uint64_t)&unk_1E5F3B338;
}

unint64_t sub_1AF21AC24()
{
  return 0xD000000000000010;
}

uint64_t sub_1AF21AC40()
{
  uint64_t v0;

  sub_1AF21ABD0();
  v0 = qword_1ED330188;
  OUTLINED_FUNCTION_1_0();
  return v0;
}

void sub_1AF21AC74()
{
  sub_1AF231A30();
}

void sub_1AF21AC7C()
{
  sub_1AF231CC0();
}

void sub_1AF21AC84()
{
  sub_1AF231F78();
}

uint64_t sub_1AF21AC8C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1AF21ACB4();
  *a1 = result;
  return result;
}

uint64_t sub_1AF21ACB4()
{
  return 41;
}

uint64_t sub_1AF21ACBC@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;

  result = sub_1AF228DB8(*v1);
  *a1 = result;
  return result;
}

BOOL sub_1AF21ACE4(char *a1, char *a2)
{
  return sub_1AF21F788(*a1, *a2);
}

uint64_t sub_1AF21ACF0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF21AD04()
{
  uint64_t v0;
  uint64_t v1;

  if ((*(_BYTE *)(v0 + 81) & 1) == 0)
    sub_1AF22B4B4();
  v1 = sub_1AF21AD48();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1AF21AD48()
{
  uint64_t v0;
  uint64_t v1;

  if ((*(_BYTE *)(v0 + 81) & 1) == 0)
    sub_1AF22B4B4();
  v1 = sub_1AF206FC4();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_1AF21ADA8()
{
  sub_1AF21AD04();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceAccessNetworkSpan()
{
  uint64_t result;

  result = qword_1ED32E898;
  if (!qword_1ED32E898)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1AF21AE00()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1AF21AE48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  sub_1AF2414B0();
  OUTLINED_FUNCTION_2_0();
  sub_1AF2410F0();
  sub_1AF21AF9C();
  sub_1AF2414B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
  v1 = OUTLINED_FUNCTION_0_1();
  *(_OWORD *)(v1 + 16) = xmmword_1AF242860;
  v3 = *(_QWORD *)(v0 + qword_1ED3301D0 + 8);
  v2 = *(_QWORD *)(v0 + qword_1ED3301D0 + 16);
  v4 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
  v5 = sub_1AF20BFF4();
  *(_QWORD *)(v1 + 64) = v5;
  *(_QWORD *)(v1 + 32) = v3;
  *(_QWORD *)(v1 + 40) = v2;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  sub_1AF2410F0();
  swift_bridgeObjectRelease();
  sub_1AF2414B0();
  v6 = OUTLINED_FUNCTION_0_1();
  *(_OWORD *)(v6 + 16) = xmmword_1AF242860;
  *(_QWORD *)(v6 + 56) = v4;
  *(_QWORD *)(v6 + 64) = v5;
  *(_QWORD *)(v6 + 32) = v3;
  *(_QWORD *)(v6 + 40) = v2;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  sub_1AF2410F0();
  swift_bridgeObjectRelease();
  sub_1AF2414B0();
  OUTLINED_FUNCTION_2_0();
  return sub_1AF2410F0();
}

uint64_t sub_1AF21AF9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
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
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;

  v1 = v0;
  sub_1AF2414B0();
  sub_1AF2410F0();
  sub_1AF22BAE4();
  sub_1AF2414B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_1AF242860;
  v3 = *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 464) + 8);
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE339A0);
  v4 = sub_1AF2412AC();
  v6 = v5;
  *(_QWORD *)(v2 + 56) = MEMORY[0x1E0DEA968];
  v7 = sub_1AF20BFF4();
  *(_QWORD *)(v2 + 64) = v7;
  *(_QWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 40) = v6;
  sub_1AF2410F0();
  swift_bridgeObjectRelease();
  sub_1AF2414B0();
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1AF242860;
  ObjectType = swift_getObjectType();
  v40 = *(void (**)(uint64_t, uint64_t))(v3 + 16);
  v40(ObjectType, v3);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33828);
  v10 = sub_1AF2412AC();
  *(_QWORD *)(v8 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v8 + 64) = v7;
  *(_QWORD *)(v8 + 32) = v10;
  *(_QWORD *)(v8 + 40) = v11;
  sub_1AF2410F0();
  swift_bridgeObjectRelease();
  v12 = sub_1AF22B694();
  if ((v15 & 1) != 0)
  {
    sub_1AF2414B0();
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_1AF242860;
    v40(ObjectType, v3);
    v32 = sub_1AF2412AC();
    v33 = MEMORY[0x1E0DEA968];
    v30 = v7;
    *(_QWORD *)(v31 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v31 + 64) = v7;
    *(_QWORD *)(v31 + 32) = v32;
    *(_QWORD *)(v31 + 40) = v34;
    sub_1AF2410F0();
    v29 = v33;
  }
  else
  {
    v16 = v13;
    v17 = v14;
    v18 = HIDWORD(v14);
    v41 = v12;
    sub_1AF2414B0();
    v19 = swift_allocObject();
    v20 = MEMORY[0x1E0DEB418];
    *(_OWORD *)(v19 + 16) = xmmword_1AF242860;
    v21 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v19 + 56) = v20;
    *(_QWORD *)(v19 + 64) = v21;
    *(_QWORD *)(v19 + 32) = v16;
    sub_1AF2410F0();
    swift_bridgeObjectRelease();
    sub_1AF2414B0();
    v22 = swift_allocObject();
    v23 = MEMORY[0x1E0DEE0F8];
    *(_OWORD *)(v22 + 16) = xmmword_1AF242860;
    v24 = MEMORY[0x1E0DEE168];
    *(_QWORD *)(v22 + 56) = v23;
    *(_QWORD *)(v22 + 64) = v24;
    *(_DWORD *)(v22 + 32) = v18;
    sub_1AF2410F0();
    swift_bridgeObjectRelease();
    sub_1AF2414B0();
    v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_1AF242860;
    *(_QWORD *)(v25 + 56) = v23;
    *(_QWORD *)(v25 + 64) = v24;
    *(_DWORD *)(v25 + 32) = v17;
    sub_1AF2410F0();
    swift_bridgeObjectRelease();
    sub_1AF2414B0();
    v26 = swift_allocObject();
    v27 = MEMORY[0x1E0DEB070];
    *(_OWORD *)(v26 + 16) = xmmword_1AF242860;
    v28 = MEMORY[0x1E0DEB100];
    *(_QWORD *)(v26 + 56) = v27;
    *(_QWORD *)(v26 + 64) = v28;
    *(_QWORD *)(v26 + 32) = v41;
    sub_1AF2410F0();
    v29 = MEMORY[0x1E0DEA968];
    v30 = v7;
  }
  swift_bridgeObjectRelease();
  sub_1AF2414B0();
  v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_1AF242860;
  v36 = *(id *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 472));
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33CA0);
  v37 = sub_1AF2412AC();
  *(_QWORD *)(v35 + 56) = v29;
  *(_QWORD *)(v35 + 64) = v30;
  *(_QWORD *)(v35 + 32) = v37;
  *(_QWORD *)(v35 + 40) = v38;
  sub_1AF2410F0();
  swift_bridgeObjectRelease();
  sub_1AF2414B0();
  return sub_1AF2410F0();
}

uint64_t sub_1AF21B49C(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v4 = v3;
  v8 = sub_1AF229428(a1, a2, a3);
  if (qword_1EEE334C0 != -1)
    swift_once();
  v9 = qword_1EEE33FA0;
  v10 = *(_QWORD *)algn_1EEE33FA8;
  v11 = *(_QWORD *)(v4 + qword_1ED3301D0);
  v12 = objc_allocWithZone(MEMORY[0x1E0CB37E8]);
  swift_bridgeObjectRetain();
  v13 = objc_msgSend(v12, sel_initWithUnsignedInteger_, v11);
  swift_isUniquelyReferenced_nonNull_native();
  sub_1AF21ECE8((uint64_t)v13, v9, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AF232040(v8);
  swift_bridgeObjectRelease();
  return sub_1AF21B5BC(a1, a2, a3);
}

uint64_t sub_1AF21B5BC(uint64_t a1, unint64_t a2, double a3)
{
  int v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v6 = HIDWORD(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1AF2428C0;
  v8 = MEMORY[0x1E0DEB490];
  *(_QWORD *)(v7 + 56) = MEMORY[0x1E0DEB418];
  *(_QWORD *)(v7 + 64) = v8;
  *(_QWORD *)(v7 + 32) = a1;
  v9 = MEMORY[0x1E0DEE0F8];
  v10 = MEMORY[0x1E0DEE168];
  *(_QWORD *)(v7 + 96) = MEMORY[0x1E0DEE0F8];
  *(_QWORD *)(v7 + 104) = v10;
  *(_DWORD *)(v7 + 72) = v3;
  *(_QWORD *)(v7 + 136) = v9;
  *(_QWORD *)(v7 + 144) = v10;
  v11 = MEMORY[0x1E0DEB070];
  *(_DWORD *)(v7 + 112) = v6;
  v12 = MEMORY[0x1E0DEB100];
  *(_QWORD *)(v7 + 176) = v11;
  *(_QWORD *)(v7 + 184) = v12;
  *(double *)(v7 + 152) = a3;
  sub_1AF20C0EC("statusCode=%{signpost.description:attribute,public}d, download=%{signpost.description:attribute}lu, upload=%{signpost.description:attribute}lu, runtime=%{signpost.description:attribute}f", 186, 2, v7);
  return swift_bridgeObjectRelease();
}

uint64_t getEnumTagSinglePayload for ResourceAccessActivity(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xD8)
  {
    if (a2 + 40 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 40) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 41;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x29;
  v5 = v6 - 41;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ResourceNetworkActivity(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 40 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 40) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xD8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xD7)
    return ((uint64_t (*)(void))((char *)&loc_1AF21B764 + 4 * byte_1AF2428D5[v4]))();
  *a1 = a2 + 40;
  return ((uint64_t (*)(void))((char *)sub_1AF21B798 + 4 * byte_1AF2428D0[v4]))();
}

uint64_t sub_1AF21B798(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF21B7A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF21B7A8);
  return result;
}

uint64_t sub_1AF21B7B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF21B7BCLL);
  *(_BYTE *)result = a2 + 40;
  return result;
}

uint64_t sub_1AF21B7C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF21B7C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ResourceNetworkActivity()
{
  return &type metadata for ResourceNetworkActivity;
}

unint64_t sub_1AF21B7E8()
{
  unint64_t result;

  result = qword_1ED32E888;
  if (!qword_1ED32E888)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF242948, &type metadata for ResourceNetworkActivity);
    atomic_store(result, (unint64_t *)&qword_1ED32E888);
  }
  return result;
}

unint64_t sub_1AF21B824(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1AF21B850();
  result = sub_1AF21B88C();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1AF21B850()
{
  unint64_t result;

  result = qword_1ED32E880;
  if (!qword_1ED32E880)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF2429A8, &type metadata for ResourceNetworkActivity);
    atomic_store(result, (unint64_t *)&qword_1ED32E880);
  }
  return result;
}

unint64_t sub_1AF21B88C()
{
  unint64_t result;

  result = qword_1ED32E890;
  if (!qword_1ED32E890)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF242970, &type metadata for ResourceNetworkActivity);
    atomic_store(result, (unint64_t *)&qword_1ED32E890);
  }
  return result;
}

unint64_t sub_1AF21B8CC()
{
  unint64_t result;

  result = qword_1EEE33990;
  if (!qword_1EEE33990)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF244638, &type metadata for ResourceAccessActivity);
    atomic_store(result, (unint64_t *)&qword_1EEE33990);
  }
  return result;
}

unint64_t sub_1AF21B908(uint64_t a1)
{
  unint64_t result;

  result = sub_1AF21B92C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1AF21B92C()
{
  unint64_t result;

  result = qword_1EEE33998;
  if (!qword_1EEE33998)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF242A08, &type metadata for ResourceNetworkActivity);
    atomic_store(result, (unint64_t *)&qword_1EEE33998);
  }
  return result;
}

void sub_1AF21B968()
{
  qword_1EEE339A8 = 0x2F64636573726170;
  unk_1EEE339B0 = 0xEB00000000302E31;
}

uint64_t static ConfigurationContext.parsecdNameVersion.getter()
{
  uint64_t v0;

  if (qword_1EEE33558 != -1)
    swift_once();
  v0 = qword_1EEE339A8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t static ConfigurationContext.deviceModel.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_1AF21BAC8();
  return OUTLINED_FUNCTION_3_1(v0, v1);
}

uint64_t static ConfigurationContext.buildVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_1AF21BAC8();
  return OUTLINED_FUNCTION_3_1(v0, v1);
}

uint64_t static ConfigurationContext.productName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_1AF21BAC8();
  return OUTLINED_FUNCTION_3_1(v0, v1);
}

uint64_t static ConfigurationContext.productVersion.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_1AF21BAC8();
  return OUTLINED_FUNCTION_3_1(v0, v1);
}

uint64_t static ConfigurationContext.regionCode.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_1AF21BAC8();
  return OUTLINED_FUNCTION_3_1(v0, v1);
}

uint64_t static ConfigurationContext.modelNumber.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_1AF21BAC8();
  return OUTLINED_FUNCTION_3_1(v0, v1);
}

uint64_t sub_1AF21BAC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _BYTE v25[12];
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v0 = sub_1AF2411B0();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x1E0C80A78](v0);
  v4 = &v25[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v2);
  v6 = &v25[-v5];
  OUTLINED_FUNCTION_6_0();
  v7 = (void *)sub_1AF24124C();
  swift_bridgeObjectRelease();
  v8 = MGCopyAnswer();

  if (v8 && (v29 = v8, swift_dynamicCast()))
  {
    v9 = v28;
    if (qword_1ED330108 != -1)
      swift_once();
    v10 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED330110);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v1 + 16))(v6, v10, v0);
    v11 = sub_1AF241198();
    v12 = sub_1AF2414A4();
    v13 = v12;
    if (os_log_type_enabled(v11, v12))
    {
      v14 = OUTLINED_FUNCTION_4();
      v26 = v13;
      v15 = v14;
      v27 = OUTLINED_FUNCTION_4();
      v28 = v27;
      *(_DWORD *)v15 = 136315395;
      v29 = OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_0_2();
      *(_WORD *)(v15 + 12) = 2085;
      v16 = OUTLINED_FUNCTION_6_0();
      v29 = OUTLINED_FUNCTION_5_0(v16, v17);
      OUTLINED_FUNCTION_0_2();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AF203000, v11, (os_log_type_t)v26, "Got value of type %s for MGQuery with key %{sensitive}s", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }

    (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v6, v0);
  }
  else
  {
    if (qword_1ED330108 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v0, (uint64_t)qword_1ED330110);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v1 + 16))(v4, v18, v0);
    v19 = sub_1AF241198();
    v20 = sub_1AF2414B0();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = OUTLINED_FUNCTION_4();
      v28 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v21 = 136315395;
      v29 = OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_0_2();
      *(_WORD *)(v21 + 12) = 2085;
      v22 = OUTLINED_FUNCTION_6_0();
      v29 = OUTLINED_FUNCTION_5_0(v22, v23);
      OUTLINED_FUNCTION_0_2();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AF203000, v19, v20, "Did not get value of type %s for MGQuery with key %{sensitive}s", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }

    (*(void (**)(_BYTE *, uint64_t))(v1 + 8))(v4, v0);
    return 0;
  }
  return v9;
}

ValueMetadata *type metadata accessor for ConfigurationContext()
{
  return &type metadata for ConfigurationContext;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_1AF21BE5C()
{
  swift_bridgeObjectRetain();
  sub_1AF24133C();
  swift_bridgeObjectRetain();
  sub_1AF24133C();
  swift_bridgeObjectRelease();
}

void sub_1AF21BECC()
{
  OUTLINED_FUNCTION_0_3(&qword_1EEE33FA0);
}

void sub_1AF21BEEC()
{
  OUTLINED_FUNCTION_0_3(&qword_1EEE33F90);
}

void sub_1AF21BF18()
{
  OUTLINED_FUNCTION_0_3(&qword_1EEE33FB0);
}

void sub_1AF21BF38()
{
  OUTLINED_FUNCTION_0_3(&qword_1EEE33F80);
}

void sub_1AF21BF60()
{
  OUTLINED_FUNCTION_0_3(&qword_1EEE33FC0);
}

void sub_1AF21BF80()
{
  OUTLINED_FUNCTION_0_3(&qword_1EEE33FD0);
}

void sub_1AF21BFA0()
{
  OUTLINED_FUNCTION_0_3(&qword_1EEE33F50);
}

void sub_1AF21BFCC()
{
  OUTLINED_FUNCTION_0_3(&qword_1EEE33F60);
}

void sub_1AF21BFF8()
{
  OUTLINED_FUNCTION_0_3(&qword_1EEE33F70);
}

PegasusConfiguration::PegasusClientName_optional __swiftcall PegasusClientName.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  PegasusConfiguration::PegasusClientName_optional result;
  char v5;
  char v6;

  v2 = v1;
  v3 = sub_1AF241768();
  result.value = swift_bridgeObjectRelease();
  v5 = 0;
  v6 = 11;
  switch(v3)
  {
    case 0:
      goto LABEL_13;
    case 1:
      v5 = 1;
      goto LABEL_13;
    case 2:
      v5 = 2;
      goto LABEL_13;
    case 3:
      v5 = 3;
      goto LABEL_13;
    case 4:
      v5 = 4;
      goto LABEL_13;
    case 5:
      v5 = 5;
      goto LABEL_13;
    case 6:
      v5 = 6;
      goto LABEL_13;
    case 7:
      v5 = 7;
      goto LABEL_13;
    case 8:
      v5 = 8;
      goto LABEL_13;
    case 9:
      v5 = 9;
      goto LABEL_13;
    case 10:
      v5 = 10;
LABEL_13:
      v6 = v5;
      break;
    case 11:
      break;
    case 12:
      v6 = 12;
      break;
    case 13:
      v6 = 13;
      break;
    case 14:
      v6 = 14;
      break;
    case 15:
      v6 = 15;
      break;
    case 16:
      v6 = 16;
      break;
    case 17:
      v6 = 17;
      break;
    case 18:
      v6 = 18;
      break;
    case 19:
      v6 = 19;
      break;
    case 20:
      v6 = 20;
      break;
    case 21:
      v6 = 21;
      break;
    case 22:
      v6 = 22;
      break;
    case 23:
      v6 = 23;
      break;
    case 24:
      v6 = 24;
      break;
    case 25:
      v6 = 25;
      break;
    case 26:
      v6 = 26;
      break;
    case 27:
      v6 = 27;
      break;
    case 28:
      v6 = 28;
      break;
    default:
      v6 = 29;
      break;
  }
  *v2 = v6;
  return result;
}

void *static PegasusClientName.allCases.getter()
{
  return &unk_1E5F3AC58;
}

uint64_t sub_1AF21C184(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1AF21F8D8(*a1, *a2);
}

unint64_t sub_1AF21C194()
{
  unint64_t result;

  result = qword_1EEE339B8;
  if (!qword_1EEE339B8)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for PegasusClientName, &type metadata for PegasusClientName);
    atomic_store(result, (unint64_t *)&qword_1EEE339B8);
  }
  return result;
}

void sub_1AF21C1D0()
{
  unsigned __int8 *v0;

  sub_1AF231A64(*v0);
}

uint64_t sub_1AF21C1D8(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_1AF231DA8(a1, *v1);
}

void sub_1AF21C1E0(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_1AF231E00(a1, *v1);
}

PegasusConfiguration::PegasusClientName_optional sub_1AF21C1E8(Swift::String *a1)
{
  return PegasusClientName.init(rawValue:)(*a1);
}

uint64_t sub_1AF21C1F4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PegasusClientName.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1AF21C21C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEE339C0;
  if (!qword_1EEE339C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE339C8);
    result = MEMORY[0x1AF45A834](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EEE339C0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1AF45A828](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_1AF21C2A4(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E5F3AC58;
}

uint64_t getEnumTagSinglePayload for PegasusClientName(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xE4)
  {
    if (a2 + 28 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 28) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 29;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1D;
  v5 = v6 - 29;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PegasusClientName(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 28 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 28) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE4)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE3)
    return ((uint64_t (*)(void))((char *)&loc_1AF21C388 + 4 * byte_1AF242ACF[v4]))();
  *a1 = a2 + 28;
  return ((uint64_t (*)(void))((char *)sub_1AF21C3BC + 4 * byte_1AF242ACA[v4]))();
}

uint64_t sub_1AF21C3BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF21C3C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF21C3CCLL);
  return result;
}

uint64_t sub_1AF21C3D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF21C3E0);
  *(_BYTE *)result = a2 + 28;
  return result;
}

uint64_t sub_1AF21C3E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF21C3EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_1AF21C3F8(void (*a1)(void))
{
  uint64_t v1;
  os_unfair_lock_s *v3;

  v3 = *(os_unfair_lock_s **)(v1 + 16);
  os_unfair_lock_lock(v3);
  a1();
  os_unfair_lock_unlock(v3);
}

uint64_t URLDataSourceOutput.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_1AF219C40(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

void *URLDataSourceOutput.response.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 16);
  v2 = v1;
  return v1;
}

uint64_t URLDataSourceOutput.timingInfo.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t URLDataSourceOutput.init(_:_:_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t NSURLSession.toDataSource(onSetup:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  void *v3;
  uint64_t v7;
  _QWORD *v8;
  id v9;

  v7 = type metadata accessor for URLSessionDataSource();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v3;
  v8[3] = a1;
  v8[4] = a2;
  a3[3] = v7;
  a3[4] = &off_1E5F3C1E0;
  *a3 = v8;
  v9 = v3;
  return sub_1AF21C540(a1);
}

uint64_t type metadata accessor for URLSessionDataSource()
{
  return objc_opt_self();
}

uint64_t sub_1AF21C540(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1AF21C550@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return NSURLSession.toDataSource(onSetup:)(a1, a2, a3);
}

uint64_t dispatch thunk of URLDataSource.data(forRequest:priority:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, float a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, float);

  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, float))(**(int **)(a4 + 8) + *(_QWORD *)(a4 + 8));
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_1AF219954;
  return v13(a1, a2, a3, a4, a5);
}

uint64_t dispatch thunk of URLDataSourceConvertible.toDataSource(onSetup:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t initializeBufferWithCopyOfBuffer for UserAgent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for URLDataSourceOutput(uint64_t a1)
{
  sub_1AF219BC4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));

  return swift_bridgeObjectRelease();
}

uint64_t *initializeWithCopy for URLDataSourceOutput(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = *a2;
  v5 = a2[1];
  sub_1AF219C40(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  v6 = (void *)a2[2];
  v7 = a2[3];
  a1[2] = (uint64_t)v6;
  a1[3] = v7;
  v8 = v6;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for URLDataSourceOutput(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = *a2;
  v5 = a2[1];
  sub_1AF219C40(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_1AF219BC4(v6, v7);
  v8 = (void *)a1[2];
  v9 = (void *)a2[2];
  a1[2] = (uint64_t)v9;
  v10 = v9;

  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for URLDataSourceOutput(uint64_t a1, _OWORD *a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  sub_1AF219BC4(v4, v5);

  *(_OWORD *)(a1 + 16) = a2[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for URLDataSourceOutput(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for URLDataSourceOutput(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for URLDataSourceOutput()
{
  return &type metadata for URLDataSourceOutput;
}

uint64_t sub_1AF21C828(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 24) = a2;
  *(_QWORD *)(v4 + 32) = v3;
  *(float *)(v4 + 64) = a3;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_1AF21C848()
{
  uint64_t v0;
  __int32 v1;
  int8x16_t *v2;
  _QWORD *v3;

  v1 = *(_DWORD *)(v0 + 64);
  v2 = (int8x16_t *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v2;
  v2[1] = vextq_s8(*(int8x16_t *)(v0 + 24), *(int8x16_t *)(v0 + 24), 8uLL);
  v2[2].i32[0] = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *v3 = v0;
  v3[1] = sub_1AF21C8F0;
  return sub_1AF241774();
}

uint64_t sub_1AF21C8F0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1AF21C964()
{
  uint64_t v0;

  swift_task_dealloc();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1AF21C990(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  double v15;
  void (*v16)(id);
  uint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD aBlock[6];

  v19 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EBD8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32EC20);
  v9 = swift_allocObject();
  *(_DWORD *)(v9 + 24) = 0;
  *(_QWORD *)(v9 + 16) = 0;
  v18 = *(id *)(a2 + 16);
  v10 = (void *)sub_1AF240C04();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v11 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = v9;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v12 + v11, (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_1AF21CF24;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1AF21CD04;
  aBlock[3] = &block_descriptor;
  v13 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v14 = objc_msgSend(v18, sel_dataTaskWithRequest_completionHandler_, v10, v13);
  _Block_release(v13);

  objc_msgSend(v14, sel_set_callCompletionHandlerInline_, 1);
  *(float *)&v15 = a3;
  objc_msgSend(v14, sel_setPriority_, v15);
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 24));
  sub_1AF21CDB4((id *)(v9 + 16), v14);
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 24));
  v16 = *(void (**)(id))(v19 + 24);
  if (v16)
    v16(v14);
  objc_msgSend(v14, sel_resume);
  swift_release();

}

void sub_1AF21CBB8(uint64_t a1, unint64_t a2, void *a3, id a4, uint64_t a5)
{
  id v6;
  os_unfair_lock_s *v7;
  id *v8;
  void *v12;
  id v13;
  id v14;

  if (a4)
  {
    v6 = a4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EBD8);
    sub_1AF2413F0();
    v7 = (os_unfair_lock_s *)(a5 + 24);
    v8 = (id *)(a5 + 16);
  }
  else
  {
    v7 = (os_unfair_lock_s *)(a5 + 24);
    os_unfair_lock_lock((os_unfair_lock_t)(a5 + 24));
    v12 = *(void **)(a5 + 16);
    v8 = (id *)(a5 + 16);
    v13 = v12;
    os_unfair_lock_unlock(v7);
    if (v12)
    {
      sub_1AF21D46C();

    }
    else
    {
      sub_1AF241210();
    }
    sub_1AF21CFBC(a1, a2);
    v14 = a3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EBD8);
    sub_1AF2413FC();
  }
  os_unfair_lock_lock(v7);

  *v8 = 0;
  os_unfair_lock_unlock(v7);
}

uint64_t sub_1AF21CD04(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v6;
  void (*v7)(void *, unint64_t, void *, void *);
  id v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  id v12;

  v6 = a2;
  v7 = *(void (**)(void *, unint64_t, void *, void *))(a1 + 32);
  if (a2)
  {
    swift_retain();
    v8 = v6;
    v6 = (void *)sub_1AF240E5C();
    v10 = v9;

  }
  else
  {
    swift_retain();
    v10 = 0xF000000000000000;
  }
  v11 = a3;
  v12 = a4;
  v7(v6, v10, a3, a4);

  sub_1AF21CFA8((uint64_t)v6, v10);
  return swift_release();
}

id sub_1AF21CDB4(id *a1, void *a2)
{

  *a1 = a2;
  return a2;
}

uint64_t sub_1AF21CDF4()
{
  uint64_t v0;

  sub_1AF2192C4(*(_QWORD *)(v0 + 24));
  return v0;
}

uint64_t sub_1AF21CE18()
{
  sub_1AF21CDF4();
  return swift_deallocClassInstance();
}

uint64_t sub_1AF21CE34(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1AF219954;
  return sub_1AF21C828(a1, a2, a3);
}

void sub_1AF21CEA0(uint64_t a1)
{
  uint64_t v1;

  sub_1AF21C990(a1, *(_QWORD *)(v1 + 16), *(float *)(v1 + 32));
}

uint64_t sub_1AF21CEAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EBD8);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_1AF21CF24(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EBD8);
  sub_1AF21CBB8(a1, a2, a3, a4, *(_QWORD *)(v4 + 16));
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

uint64_t sub_1AF21CFA8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1AF219BC4(a1, a2);
  return a1;
}

uint64_t sub_1AF21CFBC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1AF219C40(a1, a2);
  return a1;
}

void sub_1AF21CFD0()
{
  qword_1EEE34000 = 0x396B636F63616570;
  *(_QWORD *)algn_1EEE34008 = 0xEB00000000323437;
}

uint64_t BiomeStreamConfig.tableName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BiomeStreamConfig.messageSchemaName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

id BiomeStreamConfig.identifier.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 40);
}

_QWORD *initializeWithCopy for BiomeStreamConfig(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = (void *)a2[4];
  v6 = (void *)a2[5];
  a1[4] = v5;
  a1[5] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = v5;
  v8 = v6;
  return a1;
}

_QWORD *assignWithCopy for BiomeStreamConfig(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[4];
  v5 = (void *)a1[4];
  a1[4] = v4;
  v6 = v4;

  v7 = (void *)a2[5];
  v8 = (void *)a1[5];
  a1[5] = v7;
  v9 = v7;

  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for BiomeStreamConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  v6 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for BiomeStreamConfig(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BiomeStreamConfig(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void sub_1AF21D248(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E528);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1AF240C88();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v13 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (__swift_getEnumTagSinglePayload(a1, 1, v9) == 1)
  {
    sub_1AF21F578(a1, (uint64_t *)&unk_1ED32E528);
    sub_1AF21E798(a2, a3, (uint64_t)v8);
    OUTLINED_FUNCTION_27();
    sub_1AF21F578((uint64_t)v8, (uint64_t *)&unk_1ED32E528);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, a1, v9);
    sub_1AF21EB20((uint64_t)v12, a2, a3);
    OUTLINED_FUNCTION_27();
  }
  OUTLINED_FUNCTION_12();
}

void sub_1AF21D358(uint64_t a1, uint64_t a2)
{
  _OWORD v3[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1AF219FD0((_OWORD *)a1, v3);
    sub_1AF21EC00(v3, a2);
    sub_1AF21F5B0(a2);
  }
  else
  {
    sub_1AF21F578(a1, &qword_1ED32F808);
    sub_1AF21E8E0(a2, v3);
    sub_1AF21F5B0(a2);
    sub_1AF21F578((uint64_t)v3, &qword_1ED32F808);
  }
}

void sub_1AF21D3DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v5[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1AF219FD0((_OWORD *)a1, v5);
    sub_1AF21EC6C(v5, a2, a3);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1AF21F578(a1, &qword_1ED32F808);
    sub_1AF21E9FC(a2, a3, v5);
    swift_bridgeObjectRelease();
    sub_1AF21F578((uint64_t)v5, &qword_1ED32F808);
  }
}

char *sub_1AF21D46C()
{
  void *v0;
  uint64_t v1;
  unint64_t v2;
  id v4;
  char *v5;

  sub_1AF21F43C(v0);
  if (v1)
  {
    v2 = sub_1AF21E398(v1);
    OUTLINED_FUNCTION_27();
    if (v2)
      return (char *)v2;
  }
  v4 = objc_msgSend(v0, sel__incompleteCurrentTaskTransactionMetrics);
  v5 = sub_1AF21D4E8();
  swift_bridgeObjectRelease();

  return v5;
}

char *sub_1AF21D4E8()
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  id v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t EnumTagSinglePayload;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  id v71;
  void *v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  double v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  id v86;
  void *v87;
  uint64_t v88;
  double v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  uint64_t v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  id v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  unsigned __int8 v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  id v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  char *result;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unsigned __int8 v132;
  uint64_t v133;
  id v134;
  void *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unsigned int v145;
  uint64_t v146;
  id v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  double v152;
  uint64_t (*v153)(uint64_t, uint64_t);
  uint64_t v154;
  id v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  char *v166;
  uint64_t v167;
  id v168;
  void *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  double v173;
  uint64_t (*v174)(uint64_t, uint64_t);
  uint64_t v175;
  id v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  char *v186;
  uint64_t v187;
  id v188;
  void *v189;
  uint64_t v190;
  double v191;
  uint64_t (*v192)(uint64_t, uint64_t);
  uint64_t v193;
  id v194;
  void *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  char v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  unint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  char *v227;
  uint64_t v228;
  char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EBA0);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_79();
  v209 = v1;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v2);
  v227 = (char *)&v209 - v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EB98);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_79();
  v217 = v5;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_7_0();
  v222 = v7;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_7_0();
  v221 = v9;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_7_0();
  v216 = v11;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_7_0();
  v215 = v13;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_7_0();
  v220 = v15;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_7_0();
  v213 = v17;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_7_0();
  v214 = v19;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v20);
  OUTLINED_FUNCTION_7_0();
  v212 = v21;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v22);
  OUTLINED_FUNCTION_7_0();
  v219 = v23;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v24);
  OUTLINED_FUNCTION_7_0();
  v210 = v25;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v26);
  OUTLINED_FUNCTION_7_0();
  v211 = v27;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v28);
  OUTLINED_FUNCTION_7_0();
  v225 = v29;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v30);
  OUTLINED_FUNCTION_7_0();
  v226 = v31;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v32);
  OUTLINED_FUNCTION_7_0();
  v223 = v33;
  OUTLINED_FUNCTION_127();
  MEMORY[0x1E0C80A78](v34);
  OUTLINED_FUNCTION_7_0();
  v224 = v35;
  OUTLINED_FUNCTION_127();
  v37 = MEMORY[0x1E0C80A78](v36);
  v39 = (char *)&v209 - v38;
  v40 = MEMORY[0x1E0C80A78](v37);
  v42 = (char *)&v209 - v41;
  v43 = MEMORY[0x1E0C80A78](v40);
  v45 = (char *)&v209 - v44;
  v46 = MEMORY[0x1E0C80A78](v43);
  v48 = (char *)&v209 - v47;
  v49 = MEMORY[0x1E0C80A78](v46);
  v51 = (char *)&v209 - v50;
  v52 = MEMORY[0x1E0C80A78](v49);
  v54 = (char *)&v209 - v53;
  v55 = MEMORY[0x1E0C80A78](v52);
  v57 = (char *)&v209 - v56;
  v58 = MEMORY[0x1E0C80A78](v55);
  v60 = (char *)&v209 - v59;
  v232 = MEMORY[0x1E0DEE9E0];
  v61 = OUTLINED_FUNCTION_4_0(v58, sel_requestStartDate);
  if (v61)
  {
    v62 = v61;
    sub_1AF240EE0();

    v63 = sub_1AF240F04();
    v64 = (uint64_t)v57;
    v65 = 0;
  }
  else
  {
    v63 = sub_1AF240F04();
    v64 = (uint64_t)v57;
    v65 = 1;
  }
  OUTLINED_FUNCTION_2_2(v64, v65);
  OUTLINED_FUNCTION_20_1((uint64_t)v57, v66, &qword_1ED32EB98);
  sub_1AF240F04();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v60, 1, v63);
  v68 = MEMORY[0x1E0DEB070];
  if ((_DWORD)EnumTagSinglePayload == 1)
  {
    OUTLINED_FUNCTION_23_0(EnumTagSinglePayload, &qword_1ED32EB98);
    OUTLINED_FUNCTION_6_1();
  }
  else
  {
    sub_1AF240E68();
    v231 = v68;
    v229 = v69;
    OUTLINED_FUNCTION_9_1((uint64_t)v60, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 8));
  }
  v218 = (unint64_t)"@\"NSURLResponse\"16@\"NSError\"24";
  sub_1AF21D3DC((uint64_t)&v229, 0xD00000000000002CLL, 0x80000001AF246E90);
  v71 = OUTLINED_FUNCTION_4_0(v70, sel_requestStartDate);
  if (v71)
  {
    v72 = v71;
    sub_1AF240EE0();

    v73 = 0;
  }
  else
  {
    v73 = 1;
  }
  OUTLINED_FUNCTION_2_2((uint64_t)v51, v73);
  sub_1AF21F4DC((uint64_t)v51, (uint64_t)v54, &qword_1ED32EB98);
  OUTLINED_FUNCTION_1_1((uint64_t)v54);
  if (v74)
  {
    sub_1AF21F578((uint64_t)v54, &qword_1ED32EB98);
    OUTLINED_FUNCTION_6_1();
    v75 = MEMORY[0x1E0DEB070];
  }
  else
  {
    sub_1AF240E68();
    v75 = MEMORY[0x1E0DEB070];
    v231 = MEMORY[0x1E0DEB070];
    v229 = v76;
    OUTLINED_FUNCTION_9_1((uint64_t)v54, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 8));
  }
  OUTLINED_FUNCTION_0_4(0xD00000000000001BLL, (uint64_t)"_kCFNTimingDataRequestStart");
  v78 = OUTLINED_FUNCTION_4_0(v77, sel_requestStartDate);
  v79 = v224;
  if (v78)
  {
    v80 = v78;
    OUTLINED_FUNCTION_25_0();

    v81 = 0;
  }
  else
  {
    v81 = 1;
  }
  OUTLINED_FUNCTION_2_2((uint64_t)v45, v81);
  sub_1AF21F4DC((uint64_t)v45, (uint64_t)v48, &qword_1ED32EB98);
  OUTLINED_FUNCTION_1_1((uint64_t)v48);
  if (v74)
  {
    sub_1AF21F578((uint64_t)v48, &qword_1ED32EB98);
    OUTLINED_FUNCTION_6_1();
  }
  else
  {
    sub_1AF240E68();
    OUTLINED_FUNCTION_26_0(v82);
    OUTLINED_FUNCTION_9_1((uint64_t)v48, v83);
  }
  v84 = (uint64_t)v227;
  OUTLINED_FUNCTION_0_4(0xD00000000000001DLL, (uint64_t)"_kCFNTimingDataTimingDataInit");
  v86 = OUTLINED_FUNCTION_4_0(v85, sel_requestEndDate);
  if (v86)
  {
    v87 = v86;
    sub_1AF240EE0();

    v88 = 0;
  }
  else
  {
    v88 = 1;
  }
  OUTLINED_FUNCTION_2_2((uint64_t)v39, v88);
  sub_1AF21F4DC((uint64_t)v39, (uint64_t)v42, &qword_1ED32EB98);
  OUTLINED_FUNCTION_1_1((uint64_t)v42);
  if (v74)
  {
    sub_1AF21F578((uint64_t)v42, &qword_1ED32EB98);
    OUTLINED_FUNCTION_6_1();
  }
  else
  {
    sub_1AF240E68();
    OUTLINED_FUNCTION_26_0(v89);
    OUTLINED_FUNCTION_9_1((uint64_t)v42, v90);
  }
  v91 = v226;
  OUTLINED_FUNCTION_8_0((uint64_t)"_kCFNTimingDataRequestEnd");
  v93 = OUTLINED_FUNCTION_4_0(v92, sel_responseStartDate);
  v94 = v225;
  if (v93)
  {
    v95 = v93;
    v96 = v223;
    sub_1AF240EE0();

    v97 = v96;
    v98 = 0;
  }
  else
  {
    v98 = 1;
    v97 = v223;
  }
  OUTLINED_FUNCTION_2_2(v97, v98);
  sub_1AF21F4DC(v97, v79, &qword_1ED32EB98);
  OUTLINED_FUNCTION_1_1(v79);
  if (v74)
  {
    sub_1AF21F578(v79, &qword_1ED32EB98);
    OUTLINED_FUNCTION_6_1();
  }
  else
  {
    sub_1AF240E68();
    v231 = v75;
    v229 = v99;
    OUTLINED_FUNCTION_9_1(v79, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 8));
  }
  OUTLINED_FUNCTION_0_4(0xD00000000000001CLL, (uint64_t)"_kCFNTimingDataResponseStart");
  v101 = OUTLINED_FUNCTION_4_0(v100, sel_responseEndDate);
  if (v101)
  {
    v102 = v101;
    OUTLINED_FUNCTION_21_0();

    v103 = 0;
  }
  else
  {
    v103 = 1;
  }
  v104 = OUTLINED_FUNCTION_2_2(v94, v103);
  OUTLINED_FUNCTION_24_0(v104, v105, &qword_1ED32EB98);
  OUTLINED_FUNCTION_1_1(v91);
  if (v74)
  {
    sub_1AF21F578(v91, &qword_1ED32EB98);
    OUTLINED_FUNCTION_6_1();
  }
  else
  {
    sub_1AF240E68();
    v231 = v75;
    v229 = v106;
    OUTLINED_FUNCTION_9_1(v91, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 8));
  }
  OUTLINED_FUNCTION_0_4(0xD00000000000001ALL, (uint64_t)"_kCFNTimingDataResponseEnd");
  v108 = OUTLINED_FUNCTION_4_0(v107, sel_isReusedConnection);
  v109 = MEMORY[0x1E0DEAFA0];
  v231 = MEMORY[0x1E0DEAFA0];
  LOBYTE(v229) = v108;
  OUTLINED_FUNCTION_3_2(0xD00000000000001FLL, (uint64_t)"_kCFNTimingDataConnectionReused");
  v111 = OUTLINED_FUNCTION_4_0(v110, sel_countOfRequestHeaderBytesSent);
  v112 = MEMORY[0x1E0DEDC60];
  OUTLINED_FUNCTION_19_0((uint64_t)v111);
  OUTLINED_FUNCTION_3_2(0xD000000000000020, (uint64_t)"_kCFNTimingDataRequestHeaderSize");
  v114 = OUTLINED_FUNCTION_4_0(v113, sel_countOfResponseHeaderBytesReceived);
  OUTLINED_FUNCTION_19_0((uint64_t)v114);
  OUTLINED_FUNCTION_3_2(0xD000000000000021, (uint64_t)"_kCFNTimingDataResponseHeaderSize");
  v116 = OUTLINED_FUNCTION_4_0(v115, sel_countOfResponseBodyBytesReceived);
  OUTLINED_FUNCTION_19_0((uint64_t)v116);
  OUTLINED_FUNCTION_3_2(0xD000000000000028, (uint64_t)"_kCFNTimingDataResponseBodyBytesReceived");
  v118 = OUTLINED_FUNCTION_4_0(v117, sel_countOfResponseBodyBytesAfterDecoding);
  OUTLINED_FUNCTION_19_0((uint64_t)v118);
  OUTLINED_FUNCTION_3_2(0xD000000000000027, (uint64_t)"_kCFNTimingDataResponseBodyBytesDecoded");
  v120 = (uint64_t)OUTLINED_FUNCTION_4_0(v119, sel_countOfRequestBodyBytesSent);
  result = (char *)OUTLINED_FUNCTION_4_0(v120, sel_countOfRequestHeaderBytesSent);
  if (__OFADD__(v120, result))
  {
    __break(1u);
    goto LABEL_92;
  }
  v231 = v112;
  v229 = &result[v120];
  OUTLINED_FUNCTION_0_4(0xD00000000000001DLL, (uint64_t)"_kCFNTimingDataTotalBytesSent");
  v123 = (uint64_t)OUTLINED_FUNCTION_4_0(v122, sel_countOfResponseBodyBytesReceived);
  result = (char *)OUTLINED_FUNCTION_4_0(v123, sel_countOfResponseHeaderBytesReceived);
  if (__OFADD__(v123, result))
  {
LABEL_92:
    __break(1u);
    return result;
  }
  v231 = v112;
  v229 = &result[v123];
  OUTLINED_FUNCTION_0_4(0xD000000000000021, (uint64_t)"_kCFNTimingDataTotalBytesReceived");
  v125 = OUTLINED_FUNCTION_16_0(v124, (SEL *)&selRef__interfaceName);
  if (v126)
  {
    v231 = MEMORY[0x1E0DEA968];
    v229 = (char *)v125;
    v230 = v126;
  }
  else
  {
    OUTLINED_FUNCTION_6_1();
  }
  v127 = v216;
  v128 = v217;
  v129 = v214;
  v130 = v211;
  sub_1AF21D3DC((uint64_t)&v229, 0xD00000000000002CLL, v218 | 0x8000000000000000);
  v132 = OUTLINED_FUNCTION_4_0(v131, sel__connectionRace);
  v231 = v109;
  LOBYTE(v229) = v132;
  OUTLINED_FUNCTION_3_2(0xD000000000000027, (uint64_t)"_kCFNTimingDataConnectionStopTimeCounts");
  v134 = OUTLINED_FUNCTION_4_0(v133, sel__connectionIdentifier);
  if (v134)
  {
    v135 = v134;
    v136 = v209;
    sub_1AF240F28();

    v137 = v136;
    v138 = sub_1AF240F40();
    v139 = v137;
    v140 = 0;
  }
  else
  {
    v138 = sub_1AF240F40();
    v137 = v209;
    v139 = v209;
    v140 = 1;
  }
  __swift_storeEnumTagSinglePayload(v139, v140, 1, v138);
  sub_1AF21F4DC(v137, v84, &qword_1ED32EBA0);
  sub_1AF240F40();
  if (__swift_getEnumTagSinglePayload(v84, 1, v138) == 1)
  {
    sub_1AF21F578(v84, &qword_1ED32EBA0);
    OUTLINED_FUNCTION_6_1();
  }
  else
  {
    v141 = sub_1AF240F10();
    v231 = MEMORY[0x1E0DEA968];
    v229 = (char *)v141;
    v230 = v142;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v138 - 8) + 8))(v84, v138);
  }
  v143 = v222;
  OUTLINED_FUNCTION_0_4(0xD00000000000001DLL, (uint64_t)"_kCFNTimingDataConnectionUUID");
  v145 = OUTLINED_FUNCTION_4_0(v144, sel__redirected);
  v231 = MEMORY[0x1E0DEE0F8];
  LODWORD(v229) = v145;
  OUTLINED_FUNCTION_3_2(0xD00000000000001CLL, (uint64_t)"_kCFNTimingDataRedirectCount");
  v147 = OUTLINED_FUNCTION_4_0(v146, sel_connectStartDate);
  if (v147)
  {
    v148 = v147;
    v149 = v210;
    OUTLINED_FUNCTION_25_0();

    v150 = v149;
    v151 = 0;
  }
  else
  {
    v151 = 1;
    v150 = v210;
  }
  OUTLINED_FUNCTION_2_2(v150, v151);
  sub_1AF21F4DC(v150, v130, &qword_1ED32EB98);
  OUTLINED_FUNCTION_1_1(v130);
  if (v74)
  {
    sub_1AF21F578(v130, &qword_1ED32EB98);
    OUTLINED_FUNCTION_6_1();
  }
  else
  {
    sub_1AF240E68();
    OUTLINED_FUNCTION_11_1(MEMORY[0x1E0DEB070], v152);
    OUTLINED_FUNCTION_9_1(v130, v153);
  }
  OUTLINED_FUNCTION_0_4(0xD00000000000001BLL, (uint64_t)"_kCFNTimingDataConnectStart");
  v155 = OUTLINED_FUNCTION_4_0(v154, sel_connectEndDate);
  if (v155)
  {
    v156 = v155;
    v157 = v212;
    OUTLINED_FUNCTION_21_0();

    v158 = v157;
    v159 = 0;
  }
  else
  {
    v159 = 1;
    v158 = v212;
  }
  v160 = v128;
  OUTLINED_FUNCTION_2_2(v158, v159);
  v161 = v158;
  v162 = v219;
  OUTLINED_FUNCTION_20_1(v161, v163, &qword_1ED32EB98);
  v164 = OUTLINED_FUNCTION_1_1(v162);
  v165 = v221;
  if (v74)
  {
    OUTLINED_FUNCTION_23_0(v164, &qword_1ED32EB98);
    OUTLINED_FUNCTION_6_1();
  }
  else
  {
    sub_1AF240E68();
    v231 = MEMORY[0x1E0DEB070];
    v229 = v166;
    OUTLINED_FUNCTION_9_1(v162, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 8));
  }
  OUTLINED_FUNCTION_8_0((uint64_t)"_kCFNTimingDataConnectEnd");
  v168 = OUTLINED_FUNCTION_4_0(v167, sel_domainLookupStartDate);
  if (v168)
  {
    v169 = v168;
    v170 = v213;
    OUTLINED_FUNCTION_25_0();

    v171 = v170;
    v172 = 0;
  }
  else
  {
    v172 = 1;
    v171 = v213;
  }
  OUTLINED_FUNCTION_2_2(v171, v172);
  sub_1AF21F4DC(v171, v129, &qword_1ED32EB98);
  OUTLINED_FUNCTION_1_1(v129);
  if (v74)
  {
    sub_1AF21F578(v129, &qword_1ED32EB98);
    OUTLINED_FUNCTION_6_1();
  }
  else
  {
    sub_1AF240E68();
    OUTLINED_FUNCTION_11_1(MEMORY[0x1E0DEB070], v173);
    OUTLINED_FUNCTION_9_1(v129, v174);
  }
  OUTLINED_FUNCTION_0_4(0xD000000000000020, (uint64_t)"_kCFNTimingDataDomainLookupStart");
  v176 = OUTLINED_FUNCTION_4_0(v175, sel_domainLookupEndDate);
  if (v176)
  {
    v177 = v176;
    v178 = v215;
    sub_1AF240EE0();

    v179 = v178;
    v180 = 0;
  }
  else
  {
    v180 = 1;
    v179 = v215;
  }
  v181 = MEMORY[0x1E0DEA968];
  OUTLINED_FUNCTION_2_2(v179, v180);
  v182 = v179;
  v183 = v220;
  OUTLINED_FUNCTION_20_1(v182, v184, &qword_1ED32EB98);
  v185 = OUTLINED_FUNCTION_1_1(v183);
  if (v74)
  {
    OUTLINED_FUNCTION_23_0(v185, &qword_1ED32EB98);
    OUTLINED_FUNCTION_6_1();
  }
  else
  {
    sub_1AF240E68();
    v231 = MEMORY[0x1E0DEB070];
    v229 = v186;
    OUTLINED_FUNCTION_9_1(v183, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 8));
  }
  OUTLINED_FUNCTION_0_4(0xD00000000000001ELL, (uint64_t)"_kCFNTimingDataDomainLookupEnd");
  v188 = OUTLINED_FUNCTION_4_0(v187, sel_fetchStartDate);
  if (v188)
  {
    v189 = v188;
    sub_1AF240EE0();

    v190 = 0;
  }
  else
  {
    v190 = 1;
  }
  OUTLINED_FUNCTION_2_2(v165, v190);
  sub_1AF21F4DC(v165, v127, &qword_1ED32EB98);
  OUTLINED_FUNCTION_1_1(v127);
  if (v74)
  {
    sub_1AF21F578(v127, &qword_1ED32EB98);
    OUTLINED_FUNCTION_6_1();
  }
  else
  {
    sub_1AF240E68();
    OUTLINED_FUNCTION_11_1(MEMORY[0x1E0DEB070], v191);
    OUTLINED_FUNCTION_9_1(v127, v192);
  }
  OUTLINED_FUNCTION_8_0((uint64_t)"_kCFNTimingDataFetchStart");
  v194 = OUTLINED_FUNCTION_4_0(v193, sel_secureConnectionStartDate);
  if (v194)
  {
    v195 = v194;
    OUTLINED_FUNCTION_21_0();

    v196 = 0;
  }
  else
  {
    v196 = 1;
  }
  v197 = MEMORY[0x1E0DEB070];
  v198 = OUTLINED_FUNCTION_2_2(v160, v196);
  OUTLINED_FUNCTION_24_0(v198, v199, &qword_1ED32EB98);
  OUTLINED_FUNCTION_1_1(v143);
  if (v74)
  {
    sub_1AF21F578(v143, &qword_1ED32EB98);
    OUTLINED_FUNCTION_6_1();
  }
  else
  {
    sub_1AF240E68();
    v231 = v197;
    v229 = v200;
    OUTLINED_FUNCTION_9_1(v143, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v63 - 8) + 8));
  }
  OUTLINED_FUNCTION_0_4(0xD000000000000024, (uint64_t)"_kCFNTimingDataSecureConnectionStart");
  v202 = OUTLINED_FUNCTION_16_0(v201, (SEL *)&selRef_networkProtocolName);
  if (v203)
  {
    v231 = v181;
    v229 = (char *)v202;
    v230 = v203;
  }
  else
  {
    OUTLINED_FUNCTION_6_1();
  }
  OUTLINED_FUNCTION_3_2(0xD000000000000022, (uint64_t)"_kCFNTimingDataNetworkProtocolName");
  v204 = sub_1AF2414F8();
  if ((v205 & 1) == 0)
  {
    v206 = v204;
    v207 = OUTLINED_FUNCTION_16_0(v204, (SEL *)&selRef_remoteAddress);
    if (v208)
    {
      v229 = (char *)v207;
      v230 = v208;
      sub_1AF24133C();
      v228 = v206;
      sub_1AF241720();
      sub_1AF24133C();
      OUTLINED_FUNCTION_27();
      v231 = v181;
      OUTLINED_FUNCTION_0_4(0xD000000000000024, (uint64_t)"_kCFNTimingDataConnectionPeerAddress");
    }
  }
  return (char *)v232;
}

unint64_t sub_1AF21E398(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t *v8;
  uint64_t *v9;
  unint64_t result;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  __int128 v16;
  unint64_t v17;
  char v18;
  uint64_t *v19;
  uint64_t *v20;
  _BYTE *v21;
  uint64_t v22;
  _BYTE *v23;
  _OWORD *v24;
  _OWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  __int128 v33;
  _OWORD v34[2];
  uint64_t v35;
  __int128 v36;
  uint64_t v37;
  _OWORD v38[2];
  _BYTE __dst[72];
  _BYTE __src[72];
  _QWORD v41[6];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32EC30);
    v2 = (_QWORD *)sub_1AF2416CC();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  sub_1AF21E760(a1, v41);
  v3 = v41[0];
  v4 = v41[3];
  v29 = (unint64_t)(v41[2] + 64) >> 6;
  v30 = v41[1];
  v5 = v41[4];
  v6 = &__src[40];
  v7 = &__dst[40];
  v8 = &v35;
  v9 = &v37;
  result = swift_bridgeObjectRetain();
  if (!v5)
    goto LABEL_6;
LABEL_5:
  v31 = (v5 - 1) & v5;
  v32 = v4;
  for (i = __clz(__rbit64(v5)) | (v4 << 6); ; i = __clz(__rbit64(v13)) + (v14 << 6))
  {
    sub_1AF21F4A0(*(_QWORD *)(v3 + 48) + 40 * i, (uint64_t)__src);
    sub_1AF208D14(*(_QWORD *)(v3 + 56) + 32 * i, (uint64_t)v6);
    memcpy(__dst, __src, sizeof(__dst));
    sub_1AF21F4A0((uint64_t)__dst, (uint64_t)v34);
    if (!swift_dynamicCast())
    {
      sub_1AF21F578((uint64_t)__dst, &qword_1ED32EC18);
      swift_bridgeObjectRelease();
      sub_1AF219FE0();
      swift_release();
      return 0;
    }
    sub_1AF208D14((uint64_t)v7, (uint64_t)v34);
    sub_1AF21F578((uint64_t)__dst, &qword_1ED32EC18);
    sub_1AF219FD0(v34, v8);
    v36 = v33;
    sub_1AF219FD0(v8, v9);
    v16 = v36;
    sub_1AF219FD0(v9, v38);
    sub_1AF219FD0(v38, &v36);
    result = sub_1AF20D23C(v16, *((uint64_t *)&v16 + 1));
    v17 = result;
    if ((v18 & 1) != 0)
    {
      v19 = v9;
      v20 = v8;
      v21 = v7;
      v22 = v3;
      v23 = v6;
      v24 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v24 = v16;
      v6 = v23;
      v3 = v22;
      v7 = v21;
      v8 = v20;
      v9 = v19;
      v25 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
      result = (unint64_t)sub_1AF219FD0(&v36, v25);
      goto LABEL_28;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    result = (unint64_t)sub_1AF219FD0(&v36, (_OWORD *)(v2[7] + 32 * result));
    v26 = v2[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
      goto LABEL_34;
    v2[2] = v28;
LABEL_28:
    v5 = v31;
    v4 = v32;
    if (v31)
      goto LABEL_5;
LABEL_6:
    v12 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_35;
    if (v12 >= v29)
      goto LABEL_31;
    v13 = *(_QWORD *)(v30 + 8 * v12);
    v14 = v4 + 1;
    if (!v13)
    {
      v14 = v4 + 2;
      if (v4 + 2 >= v29)
        goto LABEL_31;
      v13 = *(_QWORD *)(v30 + 8 * v14);
      if (!v13)
      {
        v14 = v4 + 3;
        if (v4 + 3 >= v29)
          goto LABEL_31;
        v13 = *(_QWORD *)(v30 + 8 * v14);
        if (!v13)
        {
          v14 = v4 + 4;
          if (v4 + 4 >= v29)
            goto LABEL_31;
          v13 = *(_QWORD *)(v30 + 8 * v14);
          if (!v13)
          {
            v14 = v4 + 5;
            if (v4 + 5 >= v29)
              goto LABEL_31;
            v13 = *(_QWORD *)(v30 + 8 * v14);
            if (!v13)
            {
              v15 = v4 + 6;
              while (v15 < v29)
              {
                v13 = *(_QWORD *)(v30 + 8 * v15++);
                if (v13)
                {
                  v14 = v15 - 1;
                  goto LABEL_21;
                }
              }
LABEL_31:
              sub_1AF219FE0();
              return (unint64_t)v2;
            }
          }
        }
      }
    }
LABEL_21:
    v31 = (v13 - 1) & v13;
    v32 = v14;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_1AF21E760@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v2 = -1;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v5 = v6;
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_1AF21E798@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1AF20D23C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v14 = *v4;
    *v4 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE339F0);
    sub_1AF241690();
    swift_bridgeObjectRelease();
    v10 = *(_QWORD *)(v14 + 56);
    v11 = sub_1AF240C88();
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a3, v10 + *(_QWORD *)(*(_QWORD *)(v11 - 8) + 72) * v8, v11);
    sub_1AF24169C();
    *v4 = v14;
    swift_bridgeObjectRelease();
    return __swift_storeEnumTagSinglePayload(a3, 0, 1, v11);
  }
  else
  {
    v13 = sub_1AF240C88();
    return __swift_storeEnumTagSinglePayload(a3, 1, 1, v13);
  }
}

double sub_1AF21E8E0@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  double result;
  uint64_t v9;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1AF227ED4(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    *v3 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E9F0);
    sub_1AF241690();
    sub_1AF21F5B0(*(_QWORD *)(v9 + 48) + 40 * v6);
    sub_1AF219FD0((_OWORD *)(*(_QWORD *)(v9 + 56) + 32 * v6), a2);
    sub_1AF24169C();
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

double sub_1AF21E9FC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  double result;
  uint64_t v11;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1AF20D23C(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    *v4 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EBA8);
    sub_1AF241690();
    swift_bridgeObjectRelease();
    sub_1AF219FD0((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_1AF24169C();
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1AF21EB20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_1AF21EDEC(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF21EB9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v10;

  swift_isUniquelyReferenced_nonNull_native();
  OUTLINED_FUNCTION_14_0();
  sub_1AF21EF14(a1, a2, a3, a4);
  *v4 = v10;
  return OUTLINED_FUNCTION_10_0();
}

uint64_t sub_1AF21EC00(_OWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  swift_isUniquelyReferenced_nonNull_native();
  v6 = *v2;
  *v2 = 0x8000000000000000;
  sub_1AF21F040(a1, a2);
  *v2 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF21EC6C(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_1AF21F164(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

void sub_1AF21ECE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_1AF20D23C(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E9E8);
  if ((sub_1AF241690() & 1) == 0)
    goto LABEL_5;
  v13 = sub_1AF20D23C(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    sub_1AF241798();
    __break(1u);
    return;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];

    *(_QWORD *)(v16 + 8 * v11) = a1;
    OUTLINED_FUNCTION_12();
  }
  else
  {
    sub_1AF20D380(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

uint64_t sub_1AF21EDEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_1AF20D23C(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE339F0);
  if ((sub_1AF241690() & 1) == 0)
    goto LABEL_5;
  v13 = sub_1AF20D23C(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_1AF241798();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];
    v17 = sub_1AF240C88();
    return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(v16 + *(_QWORD *)(*(_QWORD *)(v17 - 8) + 72) * v11, a1, v17);
  }
  else
  {
    sub_1AF21F280(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1AF21EF14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t result;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = sub_1AF20D23C(a3, a4);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v13 = v11;
  v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE339E8);
  if ((sub_1AF241690() & 1) == 0)
    goto LABEL_5;
  v15 = sub_1AF20D23C(a3, a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_9:
    result = sub_1AF241798();
    __break(1u);
    return result;
  }
  v13 = v15;
LABEL_5:
  v17 = *v5;
  if ((v14 & 1) != 0)
  {
    v18 = (uint64_t *)(v17[7] + 16 * v13);
    result = swift_bridgeObjectRelease();
    *v18 = a1;
    v18[1] = a2;
  }
  else
  {
    sub_1AF21F310(v13, a3, a4, a1, a2, v17);
    return swift_bridgeObjectRetain();
  }
  return result;
}

_OWORD *sub_1AF21F040(_OWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD **v3;
  _QWORD *v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  _QWORD *v13;
  _OWORD *v14;
  _OWORD *result;
  _BYTE v16[40];

  v3 = (_QWORD **)v2;
  v6 = (_QWORD *)*v2;
  v7 = sub_1AF227ED4(a2);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v9 = v7;
  v10 = v8;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E9F0);
  if ((sub_1AF241690() & 1) == 0)
    goto LABEL_5;
  v11 = sub_1AF227ED4(a2);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_9:
    result = (_OWORD *)sub_1AF241798();
    __break(1u);
    return result;
  }
  v9 = v11;
LABEL_5:
  v13 = *v3;
  if ((v10 & 1) != 0)
  {
    v14 = (_OWORD *)(v13[7] + 32 * v9);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
    return sub_1AF219FD0(a1, v14);
  }
  else
  {
    sub_1AF21F4A0(a2, (uint64_t)v16);
    return sub_1AF21F35C(v9, (uint64_t)v16, a1, v13);
  }
}

_OWORD *sub_1AF21F164(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  _OWORD *v16;
  _OWORD *result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_1AF20D23C(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EBA8);
  if ((sub_1AF241690() & 1) == 0)
    goto LABEL_5;
  v13 = sub_1AF20D23C(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = (_OWORD *)sub_1AF241798();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = (_OWORD *)(v15[7] + 32 * v11);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
    return sub_1AF219FD0(a1, v16);
  }
  else
  {
    sub_1AF21F3D4(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

uint64_t sub_1AF21F280(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = sub_1AF240C88();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, a4, v10);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

unint64_t sub_1AF21F310(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = (_QWORD *)(a6[7] + 16 * result);
  *v7 = a4;
  v7[1] = a5;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

_OWORD *sub_1AF21F35C(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
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
  result = sub_1AF219FD0(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

_OWORD *sub_1AF21F3D4(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_1AF219FD0(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void sub_1AF21F43C(void *a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(a1, sel__timingData);
  if (v1)
  {
    v2 = v1;
    sub_1AF2411F8();

  }
  OUTLINED_FUNCTION_50();
}

uint64_t sub_1AF21F4A0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

void sub_1AF21F4DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  OUTLINED_FUNCTION_50();
}

uint64_t sub_1AF21F51C(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_1AF241270();

  return v4;
}

void sub_1AF21F578(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_50();
}

uint64_t sub_1AF21F5B0(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

void OUTLINED_FUNCTION_14_0()
{
  _QWORD *v0;

  *v0 = 0x8000000000000000;
}

void OUTLINED_FUNCTION_20_1(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_1AF21F4DC(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  return sub_1AF240EE0();
}

void sub_1AF21F60C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = sub_1AF241270();
  v2 = v1;
  if (v0 != sub_1AF241270() || v2 != v3)
    OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_49();
}

uint64_t sub_1AF21F674()
{
  return 1;
}

void sub_1AF21F67C(char a1)
{
  __asm { BR              X13 }
}

uint64_t sub_1AF21F6E0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(unint64_t))((char *)sub_1AF21F72C + 4 * byte_1AF242D74[a2]))(0xD000000000000016);
}

void sub_1AF21F72C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1 != 0xD000000000000016 || v2 != ((v1 - 32) | 0x8000000000000000))
    OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_49();
}

BOOL sub_1AF21F788(char a1, char a2)
{
  return qword_1AF242E40[a1] == qword_1AF242E40[a2];
}

BOOL sub_1AF21F7AC(char a1, char a2)
{
  return qword_1AF242F88[a1] == qword_1AF242F88[a2];
}

void sub_1AF21F7D0(unsigned __int8 a1, char a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;

  v2 = 0xD000000000000014;
  v3 = 0x80000001AF246260;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0xD000000000000017;
    else
      v5 = 0xD000000000000016;
    if (v4 == 1)
      v6 = 0x80000001AF246280;
    else
      v6 = 0x80000001AF2462A0;
  }
  else
  {
    v5 = 0xD000000000000014;
    v6 = 0x80000001AF246260;
  }
  if (a2)
  {
    if (a2 == 1)
      v2 = 0xD000000000000017;
    else
      v2 = 0xD000000000000016;
    if (a2 == 1)
      v3 = 0x80000001AF246280;
    else
      v3 = 0x80000001AF2462A0;
  }
  if (v5 != v2 || v6 != v3)
    sub_1AF241744();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_49();
}

BOOL sub_1AF21F8B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a1 == a3;
}

BOOL sub_1AF21F8BC(char a1, char a2)
{
  return a1 == a2;
}

BOOL sub_1AF21F8CC(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1AF21F8D8(uint64_t a1, uint64_t a2)
{
  return sub_1AF206B5C(a1, a2, PegasusClientName.rawValue.getter);
}

void sub_1AF21F8E4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  os_unfair_lock_s *v5;
  uint64_t v6;

  v5 = *(os_unfair_lock_s **)(v2[3] + 16);
  os_unfair_lock_lock(v5);
  v6 = v2[4];
  v2[4] = a1;
  v2[5] = a2;
  sub_1AF2192C4(v6);
  swift_retain();
  os_unfair_lock_unlock(v5);
}

uint64_t sub_1AF21F934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1AF241420();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_1AF21F578(a1, (uint64_t *)&unk_1ED32E980);
  }
  else
  {
    sub_1AF241414();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1AF2413E4();
    swift_unknownObjectRelease();
  }
  v7 = OUTLINED_FUNCTION_22();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

_QWORD *sub_1AF21FA74()
{
  _QWORD *v0;
  uint64_t v1;
  _DWORD *v2;

  v0[2] = 0;
  type metadata accessor for Locker();
  v1 = swift_allocObject();
  v2 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = 0;
  v0[4] = 0;
  v0[5] = 0;
  v0[3] = v1;
  return v0;
}

uint64_t sub_1AF21FAC8()
{
  uint64_t result;

  result = sub_1AF24124C();
  qword_1EEE33A00 = result;
  return result;
}

id static NSNotificationName.PegasusConfigUpdate.getter()
{
  if (qword_1EEE33570 != -1)
    swift_once();
  OUTLINED_FUNCTION_30();
  return (id)qword_1EEE33A00;
}

void static NSNotificationName.PegasusConfigUpdate.setter(uint64_t a1)
{
  void *v2;

  if (qword_1EEE33570 != -1)
    swift_once();
  OUTLINED_FUNCTION_30();
  v2 = (void *)qword_1EEE33A00;
  qword_1EEE33A00 = a1;

}

uint64_t (*static NSNotificationName.PegasusConfigUpdate.modify())()
{
  if (qword_1EEE33570 != -1)
    swift_once();
  OUTLINED_FUNCTION_30();
  return j__swift_endAccess;
}

void ConfigurationManager.__allocating_init(defaults:context:configFactory:urlDataSource:delegate:)(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  OUTLINED_FUNCTION_22();
  ConfigurationManager.init(defaults:context:configFactory:urlDataSource:delegate:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1AF21FC98()
{
  uint64_t v0;

  return v0;
}

void ConfigurationManager.init(defaults:context:configFactory:urlDataSource:delegate:)(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[5];
  _BYTE v20[40];
  _BYTE v21[24];
  ValueMetadata *v22;
  _UNKNOWN **v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  sub_1AF2207B4(a2, (uint64_t)&v24, &qword_1ED32E4A8);
  if (*((_QWORD *)&v25 + 1))
  {
    sub_1AF220BCC(&v24, (uint64_t)v21);
  }
  else
  {
    v22 = &type metadata for ConfigContext;
    v23 = &off_1E5F3BCF0;
    sub_1AF21F578((uint64_t)&v24, &qword_1ED32E4A8);
  }
  if (qword_1ED32EAC0 != -1)
    swift_once();
  v24 = xmmword_1ED32EAD8;
  v25 = *(_OWORD *)&qword_1ED32EAE8;
  v26 = xmmword_1ED32EAF8;
  v27 = *(_OWORD *)&qword_1ED32EB08;
  if (a3)
  {
    sub_1AF219B40((uint64_t)&v24);
    v11 = a3;
  }
  else
  {
    v12 = objc_allocWithZone((Class)type metadata accessor for ConfigFactoryInternal());
    sub_1AF219B40((uint64_t)&v24);
    v11 = objc_msgSend(v12, sel_init);
  }
  sub_1AF220E94((uint64_t)v21, (uint64_t)v20);
  type metadata accessor for PARNetworkRequestFactory();
  OUTLINED_FUNCTION_22();
  v13 = a1;
  swift_unknownObjectRetain();
  v14 = sub_1AF23F4BC(a1);
  sub_1AF2207B4(a4, (uint64_t)&v17, (uint64_t *)&unk_1ED32E4B0);
  if (v18)
  {
    sub_1AF220BCC(&v17, (uint64_t)v19);
  }
  else
  {
    sub_1AF2207F4();
    sub_1AF21FF34(v19);
    sub_1AF21F578((uint64_t)&v17, (uint64_t *)&unk_1ED32E4B0);
  }
  v15 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  type metadata accessor for PegasusConfigController();
  v16 = OUTLINED_FUNCTION_22();
  sub_1AF2209B8((uint64_t)v20, (uint64_t)v14, (uint64_t)v19, v15, (uint64_t)v11, &v24, a5, a6, v16);
}

id static ConfigurationManager.defaultConfigFactory.getter()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ConfigFactoryInternal()), sel_init);
}

void sub_1AF21FF34(_QWORD *a1@<X8>)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = objc_msgSend((id)objc_opt_self(), sel_ephemeralSessionConfiguration);
  objc_msgSend(v2, sel_setWaitsForConnectivity_, 1);
  v3 = sub_1AF241270();
  sub_1AF220968(v3, v4, v2);
  v5 = objc_msgSend((id)objc_opt_self(), sel_sessionWithConfiguration_, v2);
  a1[3] = sub_1AF2207F4();
  a1[4] = &protocol witness table for NSURLSession;

  *a1 = v5;
}

id ConfigurationManager.configuration(for:forceFetch:completion:)(unint64_t a1, char a2, void (*a3)(_QWORD, _QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __n128 *inited;
  __n128 *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  __int128 v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(_QWORD, _QWORD);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E980);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF206700(a1, (uint64_t)&v41);
  v12 = v43;
  if (v43)
  {
    v39 = a3;
    v40 = a4;
    v14 = v41;
    v13 = v42;
    v15 = v45;
    v17 = v46;
    v16 = v47;
    if (v41)
    {
      v36 = v44 & 1;
      v37 = v48;
      v18 = sub_1AF241420();
      v19 = v4;
      v38 = v4;
      v20 = a2 & 1;
      v35 = *(_OWORD *)(v19 + 16);
      __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v18);
      v21 = OUTLINED_FUNCTION_22();
      *(_QWORD *)(v21 + 16) = 0;
      *(_QWORD *)(v21 + 24) = 0;
      *(_BYTE *)(v21 + 32) = v20;
      *(_OWORD *)(v21 + 40) = v35;
      *(_QWORD *)(v21 + 56) = v14;
      *(_QWORD *)(v21 + 64) = v13;
      *(_QWORD *)(v21 + 72) = v12;
      *(_BYTE *)(v21 + 80) = v36;
      *(_DWORD *)(v21 + 81) = v41;
      *(_DWORD *)(v21 + 84) = *(_DWORD *)((char *)&v41 + 3);
      *(_QWORD *)(v21 + 88) = v15;
      *(_QWORD *)(v21 + 96) = v17;
      v22 = v37;
      *(_QWORD *)(v21 + 104) = v16;
      *(_QWORD *)(v21 + 112) = v22;
      v24 = (uint64_t)v39;
      v23 = v40;
      *(_QWORD *)(v21 + 120) = v39;
      *(_QWORD *)(v21 + 128) = v23;
      swift_unknownObjectRetain();
      sub_1AF21C540(v24);
      sub_1AF21F934((uint64_t)v11, (uint64_t)&unk_1EEE33A18, v21);
      swift_release();
      return sub_1AF2204B8(a1);
    }
    sub_1AF205AF0(0, v42, v43);
    a3 = v39;
  }
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33538);
    inited = (__n128 *)swift_initStackObject();
    v27 = OUTLINED_FUNCTION_22_0(inited, (__n128)xmmword_1AF242860);
    OUTLINED_FUNCTION_2_3((uint64_t)v27, MEMORY[0x1E0DEA968], v28);
    v29 = sub_1AF241210();
    v30 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    v31 = OUTLINED_FUNCTION_19_1();
    v34 = sub_1AF220830(v31, v32, v33, v29);
    a3(v34, 1);

  }
  return 0;
}

uint64_t sub_1AF22022C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, _OWORD *a7, uint64_t a8)
{
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  _QWORD *v11;
  __int128 v13;
  _QWORD *v14;
  uint64_t v15;

  *(_QWORD *)(v8 + 192) = a8;
  *(_QWORD *)(v8 + 200) = v15;
  v9 = a7[1];
  if ((a4 & 1) != 0)
  {
    *(_OWORD *)(v8 + 80) = *a7;
    *(_OWORD *)(v8 + 96) = v9;
    v10 = a7[3];
    *(_OWORD *)(v8 + 112) = a7[2];
    *(_OWORD *)(v8 + 128) = v10;
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v8 + 208) = v11;
    *v11 = v8;
    v11[1] = sub_1AF2202E8;
    return sub_1AF20F098(v8 + 80);
  }
  else
  {
    *(_OWORD *)(v8 + 16) = *a7;
    *(_OWORD *)(v8 + 32) = v9;
    v13 = a7[3];
    *(_OWORD *)(v8 + 48) = a7[2];
    *(_OWORD *)(v8 + 64) = v13;
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v8 + 224) = v14;
    *v14 = v8;
    v14[1] = sub_1AF2203D0;
    return sub_1AF20C0F0(v8 + 16);
  }
}

uint64_t sub_1AF2202E8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[18] = v2;
  v3[19] = a1;
  v3[20] = v1;
  v3[27] = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1AF22034C()
{
  uint64_t v0;
  void (*v1)(uint64_t, _QWORD);
  uint64_t v2;

  v1 = *(void (**)(uint64_t, _QWORD))(v0 + 192);
  if (v1)
  {
    v2 = OUTLINED_FUNCTION_27_0();
    v1(v2, 0);
    OUTLINED_FUNCTION_36();
  }
  OUTLINED_FUNCTION_36();
  return OUTLINED_FUNCTION_60(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF220390()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 192))
  {
    OUTLINED_FUNCTION_28_0();
    OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_133();
  }
  OUTLINED_FUNCTION_133();
  return OUTLINED_FUNCTION_60(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF2203D0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[21] = v2;
  v3[22] = a1;
  v3[23] = v1;
  v3[29] = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1AF220434()
{
  uint64_t v0;
  void (*v1)(uint64_t, _QWORD);
  uint64_t v2;

  v1 = *(void (**)(uint64_t, _QWORD))(v0 + 192);
  if (v1)
  {
    v2 = OUTLINED_FUNCTION_27_0();
    v1(v2, 0);
    OUTLINED_FUNCTION_36();
  }
  OUTLINED_FUNCTION_36();
  return OUTLINED_FUNCTION_60(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF220478()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 192))
  {
    OUTLINED_FUNCTION_28_0();
    OUTLINED_FUNCTION_24_1();
    OUTLINED_FUNCTION_133();
  }
  OUTLINED_FUNCTION_133();
  return OUTLINED_FUNCTION_60(*(uint64_t (**)(void))(v0 + 8));
}

id sub_1AF2204B8(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t ObjectType;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[3];

  v3 = *(_QWORD *)(v1 + 24);
  ObjectType = swift_getObjectType();
  v5 = (void *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)(v3 + 8) + 8))(ObjectType);
  if (v5)
  {
    sub_1AF206700(a1, (uint64_t)v10);
    if (v10[2])
    {
      v6 = v10[0];
      if (v10[0])
      {
        v7 = (void *)sub_1AF24124C();
        OUTLINED_FUNCTION_3_3(v6);
        v8 = objc_msgSend(v5, sel_findConfigForUserAgent_, v7);
        OUTLINED_FUNCTION_36();

        return v8;
      }
      else
      {
        OUTLINED_FUNCTION_3_3(0);
      }
    }
  }
  return v5;
}

uint64_t sub_1AF22059C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  _QWORD *v5;

  OUTLINED_FUNCTION_26_1();
  v4 = *v3;
  *v5 = v4;
  *(_QWORD *)(v2 + 312) = v1;
  swift_task_dealloc();
  if (v1)
    return OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_6_2(v0, *(uint64_t (**)(void))(v4 + 8));
}

uint64_t sub_1AF2205FC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_12_1();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF220624()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  _QWORD *v5;

  OUTLINED_FUNCTION_26_1();
  v4 = *v3;
  *v5 = v4;
  *(_QWORD *)(v2 + 328) = v1;
  swift_task_dealloc();
  if (v1)
    return OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_6_2(v0, *(uint64_t (**)(void))(v4 + 8));
}

uint64_t sub_1AF220684()
{
  uint64_t v0;

  OUTLINED_FUNCTION_12_1();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

void ConfigurationManager.localCacheURLs.getter()
{
  sub_1AF20FFEC();
}

uint64_t ConfigurationManager.deinit()
{
  uint64_t v0;

  OUTLINED_FUNCTION_128();
  return v0;
}

uint64_t ConfigurationManager.__deallocating_deinit()
{
  OUTLINED_FUNCTION_128();
  return swift_deallocClassInstance();
}

id sub_1AF220704(unint64_t a1, char a2, void (*a3)(_QWORD, _QWORD), uint64_t a4)
{
  return ConfigurationManager.configuration(for:forceFetch:completion:)(a1, a2, a3, a4);
}

uint64_t sub_1AF220724(uint64_t a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1AF220784;
  return ConfigurationManager.configuration(for:forceFetch:)(a1, a2);
}

uint64_t sub_1AF220784(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_6();
  if (!v1)
    v4 = a1;
  return OUTLINED_FUNCTION_11_2(v4, *(uint64_t (**)(void))(v2 + 8));
}

void sub_1AF2207B4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_50();
}

unint64_t sub_1AF2207F4()
{
  unint64_t result;

  result = qword_1EEE33A08;
  if (!qword_1EEE33A08)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1EEE33A08);
  }
  return result;
}

id sub_1AF220830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v7;
  void *v8;
  id v9;

  v7 = (void *)sub_1AF24124C();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v8 = (void *)sub_1AF2411EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

uint64_t sub_1AF2208DC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1AF220940;
  return v6(a1);
}

uint64_t sub_1AF220940()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1AF220968(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_1AF24124C();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_set_tlsTrustPinningPolicyName_, v4);

}

void sub_1AF2209B8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, _OWORD *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  type metadata accessor for ActivityMonitor();
  swift_allocObject();
  *(_QWORD *)(a9 + 16) = sub_1AF22A764(0, 0);
  type metadata accessor for TaskCoordinator();
  swift_allocObject();
  *(_QWORD *)(a9 + 200) = sub_1AF226504();
  type metadata accessor for ConfigUsageReporter();
  swift_allocObject();
  sub_1AF213A84();
  *(_QWORD *)(a9 + 216) = v16;
  *(_QWORD *)(a9 + 232) = 0;
  swift_unknownObjectWeakInit();
  sub_1AF220E94(a1, a9 + 80);
  *(_QWORD *)(a9 + 24) = a2;
  *(_QWORD *)(a9 + 32) = &off_1E5F3C848;
  sub_1AF220E94(a3, a9 + 40);
  *(_QWORD *)(a9 + 120) = a4;
  *(_QWORD *)(a9 + 128) = a5;
  v17 = a6[1];
  *(_OWORD *)(a9 + 136) = *a6;
  *(_OWORD *)(a9 + 152) = v17;
  v18 = a6[3];
  *(_OWORD *)(a9 + 168) = a6[2];
  *(_OWORD *)(a9 + 184) = v18;
  *(_QWORD *)(a9 + 232) = a8;
  swift_unknownObjectWeakAssign();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E938);
  swift_allocObject();
  swift_retain();
  v19 = a4;
  swift_unknownObjectRetain();
  *(_QWORD *)(a9 + 240) = sub_1AF21FA74();
  type metadata accessor for ConfigTaskController();
  swift_allocObject();
  v20 = swift_retain_n();
  sub_1AF21249C(v20);
  *(_QWORD *)(a9 + 208) = v21;
  v22 = swift_allocObject();
  swift_weakInit();
  sub_1AF21F8E4((uint64_t)sub_1AF220EF8, v22);
  swift_release();
  sub_1AF20E988();
}

uint64_t sub_1AF220B78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm(v2);
  __swift_destroy_boxed_opaque_existential_1Tm(v1);
  return v0;
}

uint64_t sub_1AF220BCC(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1AF220BE4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_128();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 120))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AF220C34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_BYTE *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_QWORD *)(v1 + 48);
  v9 = *(_QWORD *)(v1 + 120);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_1AF220CD8;
  return sub_1AF22022C(a1, v4, v5, v6, v7, v8, (_OWORD *)(v1 + 56), v9);
}

uint64_t sub_1AF220CD8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t dispatch thunk of ConfigAccessProvider.hashtagImagesContext.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ConfigAccessProvider.isRefreshRequired(forConfig:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ConfigFetcher.configuration(for:forceFetch:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of ConfigFetcher.configuration(for:forceFetch:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 16) + *(_QWORD *)(a4 + 16));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1AF220DA0;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_1AF220DA0(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_6();
  return OUTLINED_FUNCTION_11_2(a1, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t type metadata accessor for ConfigurationManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for ConfigurationManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ConfigurationManager.__allocating_init(defaults:context:configFactory:urlDataSource:delegate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_1AF220E00()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AF220E24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1AF219954;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EEE33A38 + dword_1EEE33A38))(a1, v4);
}

void sub_1AF220E94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  OUTLINED_FUNCTION_50();
}

uint64_t sub_1AF220ED4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1AF220EF8()
{
  return sub_1AF20E928();
}

__n128 *OUTLINED_FUNCTION_22_0(__n128 *result, __n128 a2)
{
  result[1] = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return swift_unknownObjectRetain();
}

id OUTLINED_FUNCTION_28_0()
{
  void *v0;

  return v0;
}

uint64_t sub_1AF220F30(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t *__return_ptr, uint64_t);

  v19 = a1;
  v4 = *(_QWORD *)(a3 + 16);
  if (!v4)
    return MEMORY[0x1E0DEE9D8];
  v6 = *(_QWORD *)(sub_1AF240C88() - 8);
  v7 = a3 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  v16 = *(_QWORD *)(v6 + 72);
  swift_bridgeObjectRetain();
  v8 = MEMORY[0x1E0DEE9D8];
  while (1)
  {
    v19(&v17, v7);
    if (v3)
      break;
    v9 = v18;
    if (v18)
    {
      v10 = v17;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1AF23558C();
        v8 = v13;
      }
      v11 = *(_QWORD *)(v8 + 16);
      if (v11 >= *(_QWORD *)(v8 + 24) >> 1)
      {
        sub_1AF23558C();
        v8 = v14;
      }
      *(_QWORD *)(v8 + 16) = v11 + 1;
      v12 = v8 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v10;
      *(_QWORD *)(v12 + 40) = v9;
    }
    v7 += v16;
    if (!--v4)
    {
      swift_bridgeObjectRelease();
      return v8;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

BOOL sub_1AF22108C(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_1AF22109C()
{
  return sub_1AF2417F8();
}

uint64_t sub_1AF2210C0()
{
  sub_1AF2417EC();
  sub_1AF2417F8();
  return sub_1AF241810();
}

BOOL sub_1AF221104(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1AF22108C(*a1, *a2);
}

uint64_t sub_1AF221110()
{
  return sub_1AF2210C0();
}

uint64_t sub_1AF221118()
{
  return sub_1AF22109C();
}

uint64_t sub_1AF221120(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v1;
  v4 = OBJC_IVAR____TtC20PegasusConfiguration23ParsecURLRequestBuilder_queryItems;
  OUTLINED_FUNCTION_0_6();
  *(_QWORD *)(v1 + v4) = sub_1AF241210();
  v5 = OBJC_IVAR____TtC20PegasusConfiguration23ParsecURLRequestBuilder_httpHeader;
  *(_QWORD *)(v1 + v5) = sub_1AF241210();
  v6 = v1 + OBJC_IVAR____TtC20PegasusConfiguration23ParsecURLRequestBuilder_urlComponents;
  v7 = sub_1AF240D0C();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, a1, v7);
  v9 = sub_1AF240C94();
  sub_1AF22120C(v9);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
  return v2;
}

void sub_1AF22120C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (a1 && (v2 = *(_QWORD *)(a1 + 16)) != 0)
  {
    v3 = *(_QWORD *)(OUTLINED_FUNCTION_0_6() - 8);
    v4 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v5 = *(_QWORD *)(v3 + 72);
    OUTLINED_FUNCTION_101();
    do
    {
      sub_1AF221C4C(v4);
      v4 += v5;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_12_2();
  }
}

uint64_t sub_1AF221284()
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
  char *v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[8];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E538);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_57();
  v5 = v4 - v3;
  v6 = sub_1AF240D0C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_9();
  v10 = v8 - v9;
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v20 - v12;
  sub_1AF240CB8();
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) == 1)
  {
    sub_1AF209774(v5, &qword_1ED32E538);
    sub_1AF2220D8();
    OUTLINED_FUNCTION_8();
    *v14 = 1;
    OUTLINED_FUNCTION_15_0();
    v15 = OUTLINED_FUNCTION_105();
    OUTLINED_FUNCTION_7_2(v15);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v13, v5, v6);
    v16 = sub_1AF240CA0();
    if (v17)
    {
      v20[4] = v16;
      v20[5] = v17;
      v20[2] = 43;
      v20[3] = 0xE100000000000000;
      v20[0] = 3158565;
      v20[1] = 0xE300000000000000;
      sub_1AF208AB8();
      sub_1AF2415A0();
      v20[7] = v1;
      swift_bridgeObjectRelease();
      sub_1AF240CAC();
    }
    OUTLINED_FUNCTION_17_0(v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
    v5 = swift_allocObject();
    sub_1AF221120(v10);
    v18 = OUTLINED_FUNCTION_105();
    OUTLINED_FUNCTION_7_2(v18);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  }
  return v5;
}

uint64_t sub_1AF2214B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[6];

  v3 = sub_1AF240C58();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_11();
  if (!*(_QWORD *)(a1 + 16))
    return 0;
  v5 = sub_1AF240C4C();
  MEMORY[0x1E0C80A78](v5);
  v8[2] = v1;
  v8[4] = sub_1AF220F30((void (*)(uint64_t *__return_ptr, uint64_t))sub_1AF222114, (uint64_t)v8, a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33A50);
  sub_1AF22212C();
  v6 = sub_1AF241234();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1AF2215E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_1AF240C70();
  sub_1AF208AB8();
  v2 = sub_1AF2415AC();
  v4 = v3;
  result = swift_bridgeObjectRelease();
  if (v4)
  {
    result = sub_1AF240C7C();
    if (v6)
    {
      sub_1AF2415AC();
      v8 = v7;
      result = swift_bridgeObjectRelease();
      if (v8)
      {
        swift_bridgeObjectRetain();
        sub_1AF24133C();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_1AF24133C();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
      }
    }
  }
  *a1 = v2;
  a1[1] = v4;
  return result;
}

uint64_t sub_1AF221714@<X0>(uint64_t a1@<X8>)
{
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
  uint64_t *v15;
  uint64_t v16;
  size_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  BOOL v28;
  char v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  _BYTE *v34;
  uint64_t v35;
  char *v36;
  uint64_t result;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  size_t v44[3];
  char *v45;

  v42 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_57();
  v7 = v6 - v5;
  v8 = OUTLINED_FUNCTION_105();
  v43 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_9();
  v40 = v9 - v10;
  MEMORY[0x1E0C80A78](v11);
  v45 = (char *)&v38 - v12;
  v13 = sub_1AF240D0C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_11();
  v15 = (uint64_t *)(v1 + OBJC_IVAR____TtC20PegasusConfiguration23ParsecURLRequestBuilder_queryItems);
  OUTLINED_FUNCTION_13_0();
  v16 = *v15;
  swift_bridgeObjectRetain_n();
  v17 = sub_1AF224290(v16);
  swift_bridgeObjectRelease();
  v44[0] = v17;
  sub_1AF222058(v44);
  if (!v2)
  {
    swift_bridgeObjectRelease();
    v18 = v44[0];
    v41 = v1;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v3, v1 + OBJC_IVAR____TtC20PegasusConfiguration23ParsecURLRequestBuilder_urlComponents, v13);
    sub_1AF2214B0(v18);
    swift_release();
    sub_1AF240CAC();
    sub_1AF240CC4();
    if (__swift_getEnumTagSinglePayload(v7, 1, v8) == 1)
    {
      sub_1AF209774(v7, (uint64_t *)&unk_1ED32FF80);
      sub_1AF2220D8();
      OUTLINED_FUNCTION_8();
      *v19 = 1;
      OUTLINED_FUNCTION_15_0();
      return (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v3, v13);
    }
    v20 = v8;
    v21 = v43;
    v22 = *(void (**)(char *, uint64_t))(v43 + 32);
    v39 = v20;
    v22(v45, v7);
    v23 = sub_1AF240DF0();
    if (v24)
    {
      v25 = v23;
      v26 = v24;
      v27 = v23 == 1886680168 && v24 == 0xE400000000000000;
      if (v27
        || (OUTLINED_FUNCTION_8_1() & 1) != 0
        || (v25 == 0x7370747468 ? (v28 = v26 == 0xE500000000000000) : (v28 = 0), v28))
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v29 = OUTLINED_FUNCTION_8_1();
        swift_bridgeObjectRelease();
        if ((v29 & 1) == 0)
          goto LABEL_15;
      }
      v35 = v39;
      v36 = v45;
      OUTLINED_FUNCTION_17_0(v40, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 16));
      sub_1AF240C28();
      OUTLINED_FUNCTION_13_0();
      swift_bridgeObjectRetain();
      sub_1AF240C1C();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v36, v35);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v3, v13);
    }
LABEL_15:
    if (qword_1ED32EC08 != -1)
      swift_once();
    v30 = sub_1AF2411B0();
    __swift_project_value_buffer(v30, (uint64_t)qword_1ED330238);
    v31 = sub_1AF241198();
    v32 = sub_1AF2414B0();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_1AF203000, v31, v32, "Scheme for url is neither http nor https.", v33, 2u);
      MEMORY[0x1AF45A8C4](v33, -1, -1);
    }

    sub_1AF2220D8();
    OUTLINED_FUNCTION_8();
    *v34 = 0;
    OUTLINED_FUNCTION_15_0();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v45, v39);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v3, v13);
  }
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_1AF221B18()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1AF240D0C();
  OUTLINED_FUNCTION_86(v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1AF221B6C()
{
  sub_1AF221B18();
  return swift_deallocClassInstance();
}

uint64_t sub_1AF221B90()
{
  return type metadata accessor for ParsecURLRequestBuilder();
}

uint64_t type metadata accessor for ParsecURLRequestBuilder()
{
  uint64_t result;

  result = qword_1ED32EBB0;
  if (!qword_1ED32EBB0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1AF221BD0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1AF240D0C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_1AF221C4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E528);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_57();
  v5 = v4 - v3;
  v6 = sub_1AF240C70();
  v8 = v7;
  v9 = OUTLINED_FUNCTION_0_6();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v5, a1, v9);
  __swift_storeEnumTagSinglePayload(v5, 0, 1, v9);
  OUTLINED_FUNCTION_30();
  sub_1AF21D248(v5, v6, v8);
  swift_endAccess();
  OUTLINED_FUNCTION_12_2();
}

uint64_t sub_1AF221D14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int EnumTagSinglePayload;
  uint64_t result;
  uint64_t v23;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E528);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_9();
  v8 = v6 - v7;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v23 - v10;
  v12 = (uint64_t *)(v2 + OBJC_IVAR____TtC20PegasusConfiguration23ParsecURLRequestBuilder_queryItems);
  OUTLINED_FUNCTION_30();
  v13 = *v12;
  if (*(_QWORD *)(*v12 + 16))
  {
    OUTLINED_FUNCTION_101();
    v14 = sub_1AF20D23C(a1, a2);
    if ((v15 & 1) != 0)
    {
      v16 = v14;
      v17 = *(_QWORD *)(v13 + 56);
      v18 = OUTLINED_FUNCTION_0_6();
      (*(void (**)(char *, unint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v11, v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v18);
      v19 = (uint64_t)v11;
      v20 = 0;
    }
    else
    {
      v18 = OUTLINED_FUNCTION_0_6();
      v19 = (uint64_t)v11;
      v20 = 1;
    }
    OUTLINED_FUNCTION_3_4(v19, v20);
  }
  else
  {
    v18 = OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_3_4((uint64_t)v11, 1);
    OUTLINED_FUNCTION_101();
  }
  swift_endAccess();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_0_6();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v11, 1, v18);
  result = sub_1AF209774((uint64_t)v11, (uint64_t *)&unk_1ED32E528);
  if (EnumTagSinglePayload == 1)
  {
    OUTLINED_FUNCTION_101();
    sub_1AF240C64();
    OUTLINED_FUNCTION_3_4(v8, 0);
    OUTLINED_FUNCTION_30();
    sub_1AF21D248(v8, a1, a2);
    return swift_endAccess();
  }
  return result;
}

uint64_t sub_1AF221EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  char v10;

  v9 = v4 + OBJC_IVAR____TtC20PegasusConfiguration23ParsecURLRequestBuilder_httpHeader;
  OUTLINED_FUNCTION_30();
  if (!*(_QWORD *)(*(_QWORD *)v9 + 16))
    goto LABEL_4;
  OUTLINED_FUNCTION_101();
  sub_1AF20D23C(a1, a2);
  if ((v10 & 1) == 0)
  {
    OUTLINED_FUNCTION_27();
LABEL_4:
    swift_endAccess();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_101();
    swift_bridgeObjectRetain();
    sub_1AF21EB9C(a3, a4, a1, a2);
  }
  swift_endAccess();
  return OUTLINED_FUNCTION_27();
}

uint64_t sub_1AF221FA4(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  if (a1 < 0)
  {
    result = sub_1AF2416A8();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      OUTLINED_FUNCTION_0_6();
      v2 = sub_1AF2413D8();
      *(_QWORD *)(v2 + 16) = a1;
    }
    else
    {
      v2 = MEMORY[0x1E0DEE9D8];
    }
    OUTLINED_FUNCTION_0_6();
    return v2;
  }
  return result;
}

uint64_t sub_1AF222058(size_t *a1)
{
  uint64_t v2;
  size_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(sub_1AF240C88() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_1AF2237F0(v3);
  v4 = *(_QWORD *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_1AF222170(v6);
  *a1 = v3;
  return result;
}

unint64_t sub_1AF2220D8()
{
  unint64_t result;

  result = qword_1EEE33A48;
  if (!qword_1EEE33A48)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF24331C, &type metadata for ParsecURLRequestBuilder.URLError);
    atomic_store(result, (unint64_t *)&qword_1EEE33A48);
  }
  return result;
}

uint64_t sub_1AF222114@<X0>(uint64_t *a1@<X8>)
{
  return sub_1AF2215E0(a1);
}

unint64_t sub_1AF22212C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEE33A58;
  if (!qword_1EEE33A58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE33A50);
    result = MEMORY[0x1AF45A834](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, (unint64_t *)&qword_1EEE33A58);
  }
  return result;
}

uint64_t sub_1AF222170(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(char *, uint64_t, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t, uint64_t);
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v77;
  void (*v78)(char *, uint64_t);
  uint64_t v79;
  uint64_t v80;
  void (*v81)(char *, uint64_t, uint64_t);
  uint64_t v82;
  char *v83;
  void (*v84)(char *, uint64_t);
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t *v89;
  char *v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  BOOL v102;
  unint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  BOOL v112;
  uint64_t v113;
  char v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  BOOL v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  _QWORD *v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  unint64_t v139;
  unint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  _QWORD *v145;
  unint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  char *v153;
  char *v154;
  uint64_t v155;
  char *v156;
  char *v157;
  unint64_t v158;
  char *v159;
  char *v160;
  uint64_t v161;
  void (*v162)(char *, uint64_t, uint64_t);
  char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t *v171;
  _QWORD *v172;

  v2 = v1;
  v4 = sub_1AF240C88();
  v172 = *(_QWORD **)(v4 - 8);
  v5 = MEMORY[0x1E0C80A78](v4);
  v156 = (char *)&v147 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v5);
  v168 = (char *)&v147 - v8;
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v147 - v10;
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v147 - v13;
  v15 = MEMORY[0x1E0C80A78](v12);
  v160 = (char *)&v147 - v16;
  v17 = MEMORY[0x1E0C80A78](v15);
  v159 = (char *)&v147 - v18;
  v19 = MEMORY[0x1E0C80A78](v17);
  v153 = (char *)&v147 - v20;
  MEMORY[0x1E0C80A78](v19);
  v152 = (char *)&v147 - v21;
  v171 = a1;
  v22 = a1[1];
  result = sub_1AF241714();
  if (result >= v22)
  {
    if ((v22 & 0x8000000000000000) == 0)
    {
      if (v22)
        return sub_1AF222CD4(0, v22, 1, v171);
      return result;
    }
    goto LABEL_157;
  }
  v24 = result;
  result = sub_1AF221FA4(v22 / 2);
  v149 = result;
  v150 = v22;
  v158 = v25;
  if (v22 <= 0)
  {
LABEL_121:
    v27 = MEMORY[0x1E0DEE9D8];
    v87 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
LABEL_122:
    if (v87 < 2)
    {
LABEL_133:
      result = swift_bridgeObjectRelease();
      if (v150 >= -1)
        goto LABEL_134;
      goto LABEL_161;
    }
    v138 = *v171;
    v139 = v158;
    while (1)
    {
      v140 = v87 - 2;
      if (v87 < 2)
        break;
      if (!v138)
        goto LABEL_165;
      v141 = v27;
      v142 = v27 + 32;
      v143 = *(_QWORD *)(v27 + 32 + 16 * v140);
      v144 = *(_QWORD *)(v27 + 32 + 16 * (v87 - 1) + 8);
      result = sub_1AF222FA8(v138 + v172[9] * v143, v138 + v172[9] * *(_QWORD *)(v142 + 16 * (v87 - 1)), v138 + v172[9] * v144, v139);
      if (v2)
        goto LABEL_119;
      if (v144 < v143)
        goto LABEL_152;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_1AF2235BC(v141);
        v141 = result;
      }
      if (v140 >= *(_QWORD *)(v141 + 16))
        goto LABEL_153;
      v145 = (_QWORD *)(v141 + 32 + 16 * v140);
      *v145 = v143;
      v145[1] = v144;
      v146 = *(_QWORD *)(v141 + 16);
      if (v87 > v146)
        goto LABEL_154;
      v27 = v141;
      result = (uint64_t)memmove((void *)(v141 + 32 + 16 * (v87 - 1)), (const void *)(v141 + 32 + 16 * v87), 16 * (v146 - v87));
      *(_QWORD *)(v141 + 16) = v146 - 1;
      v87 = v146 - 1;
      if (v146 <= 2)
        goto LABEL_133;
    }
LABEL_151:
    __break(1u);
LABEL_152:
    __break(1u);
LABEL_153:
    __break(1u);
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
LABEL_160:
    __break(1u);
LABEL_161:
    __break(1u);
LABEL_162:
    __break(1u);
LABEL_163:
    __break(1u);
LABEL_164:
    __break(1u);
LABEL_165:
    __break(1u);
    return result;
  }
  v148 = v24;
  v163 = v11;
  v166 = v4;
  v26 = 0;
  v27 = MEMORY[0x1E0DEE9D8];
  v28 = v22;
  v154 = v14;
  while (1)
  {
    v29 = (uint64_t)v26;
    v30 = v26 + 1;
    v157 = v26;
    if ((uint64_t)(v26 + 1) >= v28)
    {
      v40 = (uint64_t)(v26 + 1);
      v41 = v166;
    }
    else
    {
      v169 = v28;
      v151 = v27;
      v31 = *v171;
      v32 = v172[9];
      v33 = (void (*)(char *, uint64_t, uint64_t))v172[2];
      v34 = v166;
      v33(v152, *v171 + v32 * (_QWORD)v30, v166);
      v164 = v31;
      v170 = v32;
      v33(v153, v31 + v32 * v29, v34);
      v35 = sub_1AF240C70();
      v37 = v36;
      if (v35 == sub_1AF240C70() && v37 == v38)
        LODWORD(v167) = 0;
      else
        LODWORD(v167) = sub_1AF241744();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v42 = (void (*)(char *, uint64_t))v172[1];
      v41 = v166;
      v42(v153, v166);
      result = ((uint64_t (*)(char *, uint64_t))v42)(v152, v41);
      v29 = (uint64_t)v157;
      v40 = (uint64_t)(v157 + 2);
      if ((uint64_t)(v157 + 2) < v169)
      {
        v161 = v2;
        v165 = v170 * (_QWORD)v30;
        v43 = v164;
        v44 = v170 * v40;
        while (1)
        {
          v45 = v40;
          v33(v159, v43 + v44, v41);
          v33(v160, v43 + v165, v41);
          v46 = sub_1AF240C70();
          v48 = v47;
          v50 = v46 == sub_1AF240C70() && v48 == v49;
          v51 = v50 ? 0 : sub_1AF241744();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v41 = v166;
          v42(v160, v166);
          result = ((uint64_t (*)(char *, uint64_t))v42)(v159, v41);
          if (((v167 ^ v51) & 1) != 0)
            break;
          ++v40;
          v43 += v170;
          if (v45 + 1 >= v169)
          {
            v28 = v169;
            v40 = v169;
            v2 = v161;
            v14 = v154;
            v29 = (uint64_t)v157;
            goto LABEL_25;
          }
        }
        v2 = v161;
        v14 = v154;
        v29 = (uint64_t)v157;
      }
      v28 = v169;
LABEL_25:
      v27 = v151;
      if ((v167 & 1) != 0)
      {
        if (v40 < v29)
          goto LABEL_158;
        if (v29 < v40)
        {
          v161 = v2;
          v52 = 0;
          v53 = v170 * (v40 - 1);
          v54 = v29;
          v55 = v40 * v170;
          v56 = v54;
          v57 = v54 * v170;
          do
          {
            if (v56 != v40 + v52 - 1)
            {
              v58 = v164;
              if (!v164)
                goto LABEL_164;
              v59 = v164 + v57;
              v165 = v164 + v53;
              v41 = v166;
              v167 = (char *)v172[4];
              ((void (*)(char *, uint64_t, uint64_t))v167)(v156, v164 + v57, v166);
              if (v57 < v53 || v59 >= v58 + v55)
              {
                v61 = v165;
                swift_arrayInitWithTakeFrontToBack();
              }
              else
              {
                v61 = v165;
                if (v57 != v53)
                  swift_arrayInitWithTakeBackToFront();
              }
              result = ((uint64_t (*)(uint64_t, char *, uint64_t))v167)(v61, v156, v41);
              v14 = v154;
            }
            ++v56;
            --v52;
            v53 -= v170;
            v55 -= v170;
            v57 += v170;
          }
          while (v56 < v40 + v52);
          v27 = v151;
          v2 = v161;
          v29 = (uint64_t)v157;
          v28 = v169;
        }
      }
    }
    if (v40 < v28)
    {
      if (__OFSUB__(v40, v29))
        goto LABEL_156;
      if (v40 - v29 < v148)
      {
        if (__OFADD__(v29, v148))
          goto LABEL_159;
        if (v29 + v148 >= v28)
          v62 = v28;
        else
          v62 = v29 + v148;
        if (v62 < v29)
          goto LABEL_160;
        if (v40 != v62)
        {
          v151 = v27;
          v63 = v172[9];
          v64 = (void (*)(char *, uint64_t, uint64_t))v172[2];
          v161 = v2;
          v162 = v64;
          v65 = v63 * (v40 - 1);
          v164 = v63;
          v170 = v40 * v63;
          v155 = v62;
          do
          {
            v66 = 0;
            v167 = (char *)v40;
            v165 = v65;
            while (1)
            {
              v169 = v29;
              v67 = *v171;
              v68 = v162;
              v162(v14, v170 + v66 + *v171, v41);
              v69 = v65 + v66 + v67;
              v70 = v14;
              v71 = v163;
              v68(v163, v69, v41);
              v72 = sub_1AF240C70();
              v74 = v73;
              if (v72 == sub_1AF240C70() && v74 == v75)
                break;
              v77 = sub_1AF241744();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v78 = (void (*)(char *, uint64_t))v172[1];
              v78(v71, v41);
              result = ((uint64_t (*)(char *, uint64_t))v78)(v70, v41);
              v14 = v70;
              if ((v77 & 1) == 0)
                goto LABEL_62;
              v79 = *v171;
              v65 = v165;
              if (!*v171)
                goto LABEL_162;
              v80 = v79 + v165 + v66;
              v81 = (void (*)(char *, uint64_t, uint64_t))v172[4];
              v82 = v166;
              v81(v168, v79 + v170 + v66, v166);
              swift_arrayInitWithTakeFrontToBack();
              result = ((uint64_t (*)(uint64_t, char *, uint64_t))v81)(v80, v168, v82);
              v66 -= v164;
              v29 = v169 + 1;
              v83 = v167;
              v41 = v82;
              if (v167 == (char *)(v169 + 1))
                goto LABEL_63;
            }
            swift_bridgeObjectRelease_n();
            v84 = (void (*)(char *, uint64_t))v172[1];
            v84(v71, v41);
            result = ((uint64_t (*)(char *, uint64_t))v84)(v70, v41);
            v14 = v70;
LABEL_62:
            v83 = v167;
            v65 = v165;
LABEL_63:
            v40 = (uint64_t)(v83 + 1);
            v65 += v164;
            v170 += v164;
            v29 = (uint64_t)v157;
          }
          while (v40 != v155);
          v40 = v155;
          v2 = v161;
          v27 = v151;
        }
      }
    }
    if (v40 < v29)
      goto LABEL_155;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_1AF2234C8(0, *(_QWORD *)(v27 + 16) + 1, 1, (char *)v27);
      v27 = result;
    }
    v86 = *(_QWORD *)(v27 + 16);
    v85 = *(_QWORD *)(v27 + 24);
    v87 = v86 + 1;
    v161 = v2;
    v167 = (char *)v40;
    if (v86 >= v85 >> 1)
    {
      result = (uint64_t)sub_1AF2234C8((char *)(v85 > 1), v86 + 1, 1, (char *)v27);
      v27 = result;
    }
    *(_QWORD *)(v27 + 16) = v87;
    v88 = v27 + 32;
    v89 = (uint64_t *)(v27 + 32 + 16 * v86);
    v90 = v167;
    *v89 = v29;
    v89[1] = (uint64_t)v90;
    if (v86)
      break;
    v87 = 1;
LABEL_113:
    v28 = v171[1];
    v26 = v167;
    v2 = v161;
    if ((uint64_t)v167 >= v28)
      goto LABEL_122;
  }
  while (1)
  {
    v91 = v87 - 1;
    if (v87 >= 4)
    {
      v96 = v88 + 16 * v87;
      v97 = *(_QWORD *)(v96 - 64);
      v98 = *(_QWORD *)(v96 - 56);
      v102 = __OFSUB__(v98, v97);
      v99 = v98 - v97;
      if (v102)
        goto LABEL_140;
      v101 = *(_QWORD *)(v96 - 48);
      v100 = *(_QWORD *)(v96 - 40);
      v102 = __OFSUB__(v100, v101);
      v94 = v100 - v101;
      v95 = v102;
      if (v102)
        goto LABEL_141;
      v103 = v87 - 2;
      v104 = (uint64_t *)(v88 + 16 * (v87 - 2));
      v106 = *v104;
      v105 = v104[1];
      v102 = __OFSUB__(v105, v106);
      v107 = v105 - v106;
      if (v102)
        goto LABEL_142;
      v102 = __OFADD__(v94, v107);
      v108 = v94 + v107;
      if (v102)
        goto LABEL_144;
      if (v108 >= v99)
      {
        v126 = (uint64_t *)(v88 + 16 * v91);
        v128 = *v126;
        v127 = v126[1];
        v102 = __OFSUB__(v127, v128);
        v129 = v127 - v128;
        if (v102)
          goto LABEL_150;
        v119 = v94 < v129;
        goto LABEL_102;
      }
    }
    else
    {
      if (v87 != 3)
      {
        v120 = *(_QWORD *)(v27 + 32);
        v121 = *(_QWORD *)(v27 + 40);
        v102 = __OFSUB__(v121, v120);
        v113 = v121 - v120;
        v114 = v102;
        goto LABEL_96;
      }
      v93 = *(_QWORD *)(v27 + 32);
      v92 = *(_QWORD *)(v27 + 40);
      v102 = __OFSUB__(v92, v93);
      v94 = v92 - v93;
      v95 = v102;
    }
    if ((v95 & 1) != 0)
      goto LABEL_143;
    v103 = v87 - 2;
    v109 = (uint64_t *)(v88 + 16 * (v87 - 2));
    v111 = *v109;
    v110 = v109[1];
    v112 = __OFSUB__(v110, v111);
    v113 = v110 - v111;
    v114 = v112;
    if (v112)
      goto LABEL_145;
    v115 = (uint64_t *)(v88 + 16 * v91);
    v117 = *v115;
    v116 = v115[1];
    v102 = __OFSUB__(v116, v117);
    v118 = v116 - v117;
    if (v102)
      goto LABEL_147;
    if (__OFADD__(v113, v118))
      goto LABEL_149;
    if (v113 + v118 >= v94)
    {
      v119 = v94 < v118;
LABEL_102:
      if (v119)
        v91 = v103;
      goto LABEL_104;
    }
LABEL_96:
    if ((v114 & 1) != 0)
      goto LABEL_146;
    v122 = (uint64_t *)(v88 + 16 * v91);
    v124 = *v122;
    v123 = v122[1];
    v102 = __OFSUB__(v123, v124);
    v125 = v123 - v124;
    if (v102)
      goto LABEL_148;
    if (v125 < v113)
      goto LABEL_113;
LABEL_104:
    v130 = v91 - 1;
    if (v91 - 1 >= v87)
    {
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
      goto LABEL_151;
    }
    if (!*v171)
      goto LABEL_163;
    v131 = v27;
    v132 = (uint64_t *)(v88 + 16 * v130);
    v133 = *v132;
    v134 = (_QWORD *)(v88 + 16 * v91);
    v135 = v134[1];
    v136 = v161;
    result = sub_1AF222FA8(*v171 + v172[9] * *v132, *v171 + v172[9] * *v134, *v171 + v172[9] * v135, v158);
    v161 = v136;
    if (v136)
      break;
    if (v135 < v133)
      goto LABEL_137;
    if (v91 > *(_QWORD *)(v131 + 16))
      goto LABEL_138;
    *v132 = v133;
    *(_QWORD *)(v88 + 16 * v130 + 8) = v135;
    v137 = *(_QWORD *)(v131 + 16);
    if (v91 >= v137)
      goto LABEL_139;
    v27 = v131;
    v87 = v137 - 1;
    result = (uint64_t)memmove((void *)(v88 + 16 * v91), v134 + 2, 16 * (v137 - 1 - v91));
    *(_QWORD *)(v131 + 16) = v137 - 1;
    if (v137 <= 2)
      goto LABEL_113;
  }
  v2 = v161;
LABEL_119:
  result = swift_bridgeObjectRelease();
  if (v150 < -1)
  {
    __break(1u);
    goto LABEL_121;
  }
LABEL_134:
  *(_QWORD *)(v149 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF222CD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;

  v41 = a4;
  v34 = a1;
  v37 = sub_1AF240C88();
  v42 = *(_QWORD **)(v37 - 8);
  v6 = MEMORY[0x1E0C80A78](v37);
  v39 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v32 - v9;
  result = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v32 - v12;
  v38 = a3;
  v33 = a2;
  if (a3 != a2)
  {
    v14 = v42[9];
    v35 = (void (*)(char *, uint64_t, uint64_t))v42[2];
    v36 = v14;
    v44 = v14 * (v38 - 1);
    v43 = v14 * v38;
    while (2)
    {
      v15 = 0;
      v16 = v34;
      v17 = v37;
      while (1)
      {
        v18 = *v41;
        v40 = v43 + v15;
        v19 = v35;
        v35(v13, v43 + v15 + v18, v17);
        v19(v10, v44 + v15 + v18, v17);
        v20 = sub_1AF240C70();
        v21 = v10;
        v23 = v22;
        if (v20 == sub_1AF240C70() && v23 == v24)
          break;
        v26 = sub_1AF241744();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v27 = (void (*)(char *, uint64_t))v42[1];
        v27(v21, v17);
        result = ((uint64_t (*)(char *, uint64_t))v27)(v13, v17);
        v10 = v21;
        if ((v26 & 1) != 0)
        {
          v28 = *v41;
          if (!*v41)
          {
            __break(1u);
            return result;
          }
          v29 = v28 + v44 + v15;
          v30 = (void (*)(char *, uint64_t, uint64_t))v42[4];
          v17 = v37;
          v30(v39, v28 + v43 + v15, v37);
          swift_arrayInitWithTakeFrontToBack();
          result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(v29, v39, v17);
          v15 -= v36;
          ++v16;
          v10 = v21;
          if (v38 != v16)
            continue;
        }
        goto LABEL_13;
      }
      swift_bridgeObjectRelease_n();
      v31 = (void (*)(char *, uint64_t))v42[1];
      v31(v21, v17);
      result = ((uint64_t (*)(char *, uint64_t))v31)(v13, v17);
      v10 = v21;
LABEL_13:
      v44 += v36;
      v43 += v36;
      if (++v38 != v33)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_1AF222FA8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  int64_t v22;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int64_t v29;
  uint64_t v31;
  void (*v32)(uint64_t, unint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  char v40;
  void (*v41)(uint64_t, uint64_t);
  unint64_t v42;
  BOOL v43;
  unint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  BOOL v46;
  BOOL v47;
  void (*v48)(char *, unint64_t, uint64_t);
  unint64_t v49;
  uint64_t v50;
  void (*v51)(char *, unint64_t, uint64_t);
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v58;
  void (*v59)(char *, uint64_t);
  unint64_t v60;
  BOOL v61;
  BOOL v62;
  unint64_t v63;
  uint64_t v65;
  unint64_t v66;
  void (*v67)(char *, unint64_t, uint64_t);
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t, unint64_t, uint64_t);
  char *v73;
  uint64_t v74;
  unint64_t v75;

  v8 = sub_1AF240C88();
  v9 = MEMORY[0x1E0C80A78](v8);
  v73 = (char *)&v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v9);
  v72 = (void (*)(uint64_t, unint64_t, uint64_t))((char *)&v65 - v12);
  v13 = MEMORY[0x1E0C80A78](v11);
  result = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v65 - v16;
  v74 = v18;
  v19 = *(_QWORD *)(v18 + 72);
  if (!v19)
  {
    __break(1u);
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  v20 = a2 - a1;
  if (a2 - a1 == 0x8000000000000000 && v19 == -1)
    goto LABEL_91;
  v22 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v19 == -1)
    goto LABEL_92;
  v70 = v15;
  v71 = v19;
  v24 = v20 / v19;
  v25 = v22 / v19;
  if (v20 / v19 >= v22 / v19)
  {
    result = sub_1AF2361F8(a2, v22 / v19, a4);
    v26 = a4 + v25 * v19;
    if (v25 * v19 < 1 || a1 >= a2)
      goto LABEL_22;
    v70 = -v19;
    v48 = *(void (**)(char *, unint64_t, uint64_t))(v74 + 16);
    v66 = a4;
    v67 = v48;
    v68 = a1;
    while (1)
    {
      v49 = a3;
      v75 = v26;
      v50 = v70;
      v69 = v26 + v70;
      v51 = v67;
      ((void (*)(void (*)(uint64_t, unint64_t, uint64_t)))v67)(v72);
      v52 = a2 + v50;
      v51(v73, a2 + v50, v8);
      v53 = sub_1AF240C70();
      v55 = v54;
      if (v53 == sub_1AF240C70() && v55 == v56)
        v58 = 0;
      else
        v58 = sub_1AF241744();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a3 = v49 + v70;
      v59 = *(void (**)(char *, uint64_t))(v74 + 8);
      v59(v73, v8);
      result = ((uint64_t (*)(void (*)(uint64_t, unint64_t, uint64_t), uint64_t))v59)(v72, v8);
      v60 = v68;
      if ((v58 & 1) != 0)
      {
        v61 = v49 < a2 || a3 >= a2;
        v19 = v71;
        if (v61)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else if (v49 != a2)
        {
          result = swift_arrayInitWithTakeBackToFront();
        }
        a2 = v52;
        a4 = v66;
        v26 = v75;
        goto LABEL_84;
      }
      v62 = v49 < v75 || a3 >= v75;
      v19 = v71;
      if (v62)
      {
        v63 = v69;
        result = swift_arrayInitWithTakeFrontToBack();
      }
      else
      {
        if (v49 == v75)
        {
          v26 = v69;
          goto LABEL_83;
        }
        v63 = v69;
        result = swift_arrayInitWithTakeBackToFront();
      }
      v26 = v63;
LABEL_83:
      a4 = v66;
LABEL_84:
      if (v26 <= a4 || a2 <= v60)
        goto LABEL_22;
    }
  }
  result = sub_1AF2361F8(a1, v20 / v19, a4);
  v26 = a4 + v24 * v19;
  if (v24 * v19 >= 1 && a2 < a3)
  {
    v72 = *(void (**)(uint64_t, unint64_t, uint64_t))(v74 + 16);
    v73 = v17;
    v31 = v70;
    v75 = a4 + v24 * v19;
    v69 = a3;
    while (1)
    {
      v32 = v72;
      v72((uint64_t)v17, a2, v8);
      v32(v31, a4, v8);
      v33 = v8;
      v34 = sub_1AF240C70();
      v36 = v35;
      if (v34 == sub_1AF240C70() && v36 == v37)
        break;
      v39 = v31;
      v40 = sub_1AF241744();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v41 = *(void (**)(uint64_t, uint64_t))(v74 + 8);
      v41(v39, v33);
      result = ((uint64_t (*)(char *, uint64_t))v41)(v17, v33);
      v8 = v33;
      if ((v40 & 1) == 0)
        goto LABEL_39;
      v19 = v71;
      v42 = a2 + v71;
      v43 = a1 < a2 || a1 >= v42;
      v44 = v69;
      if (!v43)
      {
        v31 = v70;
        if (a1 != a2)
          result = swift_arrayInitWithTakeBackToFront();
        v26 = v75;
        goto LABEL_49;
      }
      result = swift_arrayInitWithTakeFrontToBack();
LABEL_48:
      v26 = v75;
      v31 = v70;
LABEL_49:
      a1 += v19;
      v47 = a4 >= v26 || v42 >= v44;
      a2 = v42;
      if (v47)
        goto LABEL_16;
    }
    swift_bridgeObjectRelease_n();
    v45 = *(void (**)(uint64_t, uint64_t))(v74 + 8);
    v45(v31, v33);
    result = ((uint64_t (*)(char *, uint64_t))v45)(v17, v33);
    v8 = v33;
LABEL_39:
    v19 = v71;
    v46 = a1 < a4 || a1 >= a4 + v71;
    v44 = v69;
    if (v46)
    {
      result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (a1 != a4)
    {
      result = swift_arrayInitWithTakeBackToFront();
    }
    v42 = a2;
    a4 += v19;
    goto LABEL_48;
  }
LABEL_16:
  a2 = a1;
LABEL_22:
  v29 = v26 - a4;
  if (v19 != -1 || v29 != 0x8000000000000000)
  {
    sub_1AF2361F8(a4, v29 / v19, a2);
    return 1;
  }
LABEL_93:
  __break(1u);
  return result;
}

char *sub_1AF2234C8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33A60);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1AF2235BC(uint64_t a1)
{
  return sub_1AF2234C8(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_1AF2235D0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32ECF0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1AF236188(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1AF2364CC((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_1AF2236B0(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33A68);
  v10 = *(_QWORD *)(sub_1AF240C88() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(sub_1AF240C88() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_1AF2361F8(v18, v8, v17);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1AF236578(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

size_t sub_1AF2237F0(uint64_t a1)
{
  return sub_1AF2236B0(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t getEnumTagSinglePayload for Requestor(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 1 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 1) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ParsecURLRequestBuilder.URLError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1AF2238DC + 4 * byte_1AF243285[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1AF223910 + 4 * byte_1AF243280[v4]))();
}

uint64_t sub_1AF223910(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF223918(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF223920);
  return result;
}

uint64_t sub_1AF22392C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF223934);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1AF223938(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF223940(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1AF22394C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ParsecURLRequestBuilder.URLError()
{
  return &type metadata for ParsecURLRequestBuilder.URLError;
}

unint64_t sub_1AF22396C()
{
  unint64_t result;

  result = qword_1EEE33A70;
  if (!qword_1EEE33A70)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF2432F4, &type metadata for ParsecURLRequestBuilder.URLError);
    atomic_store(result, (unint64_t *)&qword_1EEE33A70);
  }
  return result;
}

uint64_t static DeviceContextUtil.deviceCountryCode()()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedConfiguration);
  if (!v1)
  {
    if (qword_1ED32EA58 != -1)
      swift_once();
    v5 = sub_1AF2411B0();
    __swift_project_value_buffer(v5, (uint64_t)qword_1ED3301E8);
    sub_1AF241198();
    v6 = OUTLINED_FUNCTION_7_3();
    if (OUTLINED_FUNCTION_119(v6))
    {
      *(_WORD *)OUTLINED_FUNCTION_1_2() = 0;
      OUTLINED_FUNCTION_3_5(&dword_1AF203000, v7, v8, "nil GEOCountryConfiguration received from GEOServices");
      OUTLINED_FUNCTION_1();
    }
    goto LABEL_8;
  }
  v0 = v1;
  v2 = objc_msgSend(v1, sel_countryCode);
  if (!v2)
  {
LABEL_8:

    return 0;
  }
  v3 = v2;
  v4 = sub_1AF241270();

  return v4;
}

void static DeviceContextUtil.effectiveSystemLanguage()()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  os_log_type_t v25;
  _QWORD v26[6];
  _QWORD v27[2];

  v0 = (_QWORD *)sub_1AF240F58();
  if (!v0[2])
    goto LABEL_4;
  v2 = v0[4];
  v1 = v0[5];
  swift_bridgeObjectRetain();
  v3 = OUTLINED_FUNCTION_72();
  v27[0] = 45;
  v27[1] = 0xE100000000000000;
  MEMORY[0x1E0C80A78](v3);
  v26[2] = v27;
  sub_1AF2243E8(sub_1AF224584, (uint64_t)v26, v2, v1);
  if ((v4 & 1) != 0)
  {
LABEL_4:
    swift_bridgeObjectRelease();
    if (qword_1ED32EA58 != -1)
      swift_once();
    v12 = sub_1AF2411B0();
    __swift_project_value_buffer(v12, (uint64_t)qword_1ED3301E8);
    v13 = sub_1AF241198();
    v14 = sub_1AF241498();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1AF203000, v13, v14, "No preferred languages available. Set localeId with currentLocale", v15, 2u);
      OUTLINED_FUNCTION_1();
    }

    v16 = (void *)objc_opt_self();
    v17 = sub_1AF224504(v16);
    if (v17 && (v13 = sub_1AF223D70(v17), OUTLINED_FUNCTION_72(), v13))
    {
      v18 = (void *)objc_opt_self();
      v19 = (void *)sub_1AF2413B4();
      OUTLINED_FUNCTION_27();
      v13 = objc_msgSend(v18, sel_preferredLocalizationsFromArray_, v19);

      v20 = sub_1AF2413C0();
      if (*(_QWORD *)(v20 + 16))
      {
        swift_bridgeObjectRetain();
        goto LABEL_12;
      }
      OUTLINED_FUNCTION_72();
      sub_1AF241198();
      v25 = OUTLINED_FUNCTION_7_3();
      if (OUTLINED_FUNCTION_119(v25))
      {
        *(_WORD *)OUTLINED_FUNCTION_1_2() = 0;
        v24 = "error getting effectiveSystemLanguage from NSLocale";
LABEL_15:
        OUTLINED_FUNCTION_3_5(&dword_1AF203000, v22, v23, v24);
        OUTLINED_FUNCTION_1();
      }
    }
    else
    {
      sub_1AF241198();
      v21 = OUTLINED_FUNCTION_7_3();
      if (OUTLINED_FUNCTION_119(v21))
      {
        *(_WORD *)OUTLINED_FUNCTION_1_2() = 0;
        v24 = "error getting system languages from NSLocale";
        goto LABEL_15;
      }
    }

    goto LABEL_17;
  }
  v5 = sub_1AF24136C();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  OUTLINED_FUNCTION_27();
  MEMORY[0x1AF459D9C](v5, v7, v9, v11);
LABEL_12:
  swift_bridgeObjectRelease();
LABEL_17:
  OUTLINED_FUNCTION_12_2();
}

uint64_t sub_1AF223D70(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[32];
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 16);
  v12 = MEMORY[0x1E0DEE9D8];
  sub_1AF2244E8(0, v2, 0);
  v3 = v12;
  if (v2)
  {
    for (i = a1 + 32; ; i += 32)
    {
      sub_1AF208D14(i, (uint64_t)v11);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1AF2244E8(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v12;
      }
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1AF2244E8((char *)(v5 > 1), v6 + 1, 1);
        v3 = v12;
      }
      *(_QWORD *)(v3 + 16) = v6 + 1;
      v7 = v3 + 16 * v6;
      *(_QWORD *)(v7 + 32) = v9;
      *(_QWORD *)(v7 + 40) = v10;
      if (!--v2)
        return v3;
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

void static DeviceContextUtil.localeIdentifier()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = sub_1AF240FAC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_131();
  v3 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
  sub_1AF240F64();

  sub_1AF240F4C();
  OUTLINED_FUNCTION_9_2(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  OUTLINED_FUNCTION_12_2();
}

uint64_t static DeviceContextUtil.topPreferredLanguages()()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v0 = objc_msgSend((id)objc_opt_self(), sel_preferredLanguages);
  v1 = sub_1AF2413C0();

  if (*(_QWORD *)(v1 + 16) < 4uLL)
    return v1;
  sub_1AF241750();
  swift_unknownObjectRetain_n();
  v2 = swift_dynamicCastClass();
  if (!v2)
  {
    OUTLINED_FUNCTION_27();
    v2 = MEMORY[0x1E0DEE9D8];
  }
  v3 = *(_QWORD *)(v2 + 16);
  swift_release();
  if (v3 != 3)
  {
    swift_bridgeObjectRelease();
    sub_1AF2241D4(v1, v1 + 32, 0, 7uLL);
    v4 = v6;
    goto LABEL_7;
  }
  v4 = swift_dynamicCastClass();
  OUTLINED_FUNCTION_27();
  if (!v4)
  {
    v4 = MEMORY[0x1E0DEE9D8];
LABEL_7:
    OUTLINED_FUNCTION_27();
  }
  return v4;
}

uint64_t static DeviceContextUtil.region.getter()
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
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = sub_1AF240F94();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1AF240FAC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_131();
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E460);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
  sub_1AF240F64();

  sub_1AF240FA0();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0, v5);
  sub_1AF240F88();
  OUTLINED_FUNCTION_9_2((uint64_t)v4, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  v11 = sub_1AF240F7C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11) == 1)
  {
    sub_1AF2245A0((uint64_t)v9);
    return 0;
  }
  else
  {
    v12 = sub_1AF240F70();
    OUTLINED_FUNCTION_9_2((uint64_t)v9, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8));
  }
  return v12;
}

uint64_t sub_1AF2241CC(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

void sub_1AF2241D4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  _QWORD *v8;
  size_t v9;

  v4 = a4 >> 1;
  v5 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
    __break(1u);
LABEL_10:
    __break(1u);
    return;
  }
  if (v5)
  {
    if (v5 <= 0)
    {
      v8 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32ECF0);
      v8 = (_QWORD *)swift_allocObject();
      v9 = _swift_stdlib_malloc_size(v8);
      v8[2] = v5;
      v8[3] = 2 * ((uint64_t)(v9 - 32) / 16);
    }
    if (v4 != a3)
    {
      sub_1AF2364CC(a2 + 16 * a3, v5, (unint64_t)(v8 + 4));
      return;
    }
    goto LABEL_10;
  }
}

size_t sub_1AF224290(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  size_t result;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33A68);
  v3 = *(_QWORD *)(sub_1AF240C88() - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      v9 = sub_1AF2245F0(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_1AF219FE0();
      if (v9 == v1)
        return (size_t)v6;
      __break(1u);
      return MEMORY[0x1E0DEE9D8];
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1AF2243A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4)
    return 1;
  else
    return sub_1AF241744() & 1;
}

unint64_t sub_1AF2243E8(uint64_t (*a1)(_QWORD *), uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  _QWORD v12[2];

  v5 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v5 = a3 & 0xFFFFFFFFFFFFLL;
  if (!v5)
    return 0;
  while (1)
  {
    v7 = sub_1AF241324();
    v12[0] = sub_1AF241360();
    v12[1] = v8;
    v9 = a1(v12);
    if (v4)
      break;
    v10 = v9;
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      return v7;
    if (v7 < 0x4000)
      return 0;
  }
  swift_bridgeObjectRelease();
  return v7;
}

char *sub_1AF2244E8(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1AF2235D0(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

uint64_t sub_1AF224504(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_systemLanguages);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1AF2413C0();

  return v3;
}

uint64_t sub_1AF22455C(uint64_t *a1, uint64_t *a2)
{
  return sub_1AF2243A8(*a1, a1[1], *a2, a2[1]) & 1;
}

uint64_t sub_1AF224584(uint64_t *a1)
{
  uint64_t v1;

  return sub_1AF22455C(a1, *(uint64_t **)(v1 + 16)) & 1;
}

uint64_t sub_1AF2245A0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E460);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for DeviceContextUtil()
{
  return &type metadata for DeviceContextUtil;
}

uint64_t sub_1AF2245F0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  _QWORD *v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v8 = sub_1AF240C88();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v32 - v14;
  v39 = a4;
  v18 = *(_QWORD *)(a4 + 64);
  v17 = a4 + 64;
  v16 = v18;
  v37 = v17;
  v19 = -1 << *(_BYTE *)(v17 - 32);
  if (-v19 < 64)
    v20 = ~(-1 << -(char)v19);
  else
    v20 = -1;
  v21 = v20 & v16;
  if (!a2)
  {
    v22 = 0;
    a3 = 0;
LABEL_38:
    v31 = v37;
    *a1 = v39;
    a1[1] = v31;
    a1[2] = ~v19;
    a1[3] = v22;
    a1[4] = v21;
    return a3;
  }
  if (!a3)
  {
    v22 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v34 = -1 << *(_BYTE *)(v17 - 32);
  v35 = a1;
  v22 = 0;
  v23 = 0;
  v36 = (unint64_t)(63 - v19) >> 6;
  v33 = v36 - 1;
  v38 = a3;
  if (!v21)
    goto LABEL_9;
LABEL_8:
  v24 = __clz(__rbit64(v21));
  v21 &= v21 - 1;
  v25 = v24 | (v22 << 6);
  while (1)
  {
    ++v23;
    v29 = *(_QWORD *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v12, *(_QWORD *)(v39 + 56) + v29 * v25, v8);
    v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(v15, v12, v8);
    result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2, v15, v8);
    a3 = v38;
    if (v23 == v38)
      goto LABEL_37;
    a2 += v29;
    if (v21)
      goto LABEL_8;
LABEL_9:
    v26 = v22 + 1;
    if (__OFADD__(v22, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v26 >= v36)
      goto LABEL_32;
    v27 = *(_QWORD *)(v37 + 8 * v26);
    if (!v27)
      break;
LABEL_18:
    v21 = (v27 - 1) & v27;
    v25 = __clz(__rbit64(v27)) + (v26 << 6);
    v22 = v26;
  }
  v22 += 2;
  if (v26 + 1 >= v36)
  {
    v21 = 0;
    v22 = v26;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v37 + 8 * v22);
  if (v27)
    goto LABEL_14;
  v28 = v26 + 2;
  if (v26 + 2 >= v36)
    goto LABEL_32;
  v27 = *(_QWORD *)(v37 + 8 * v28);
  if (v27)
    goto LABEL_17;
  v22 = v26 + 3;
  if (v26 + 3 >= v36)
  {
    v21 = 0;
    v22 = v26 + 2;
    goto LABEL_36;
  }
  v27 = *(_QWORD *)(v37 + 8 * v22);
  if (v27)
  {
LABEL_14:
    v26 = v22;
    goto LABEL_18;
  }
  v28 = v26 + 4;
  if (v26 + 4 >= v36)
  {
LABEL_32:
    v21 = 0;
LABEL_36:
    a3 = v23;
LABEL_37:
    v19 = v34;
    a1 = v35;
    goto LABEL_38;
  }
  v27 = *(_QWORD *)(v37 + 8 * v28);
  if (v27)
  {
LABEL_17:
    v26 = v28;
    goto LABEL_18;
  }
  while (1)
  {
    v26 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v26 >= v36)
    {
      v21 = 0;
      v22 = v33;
      goto LABEL_36;
    }
    v27 = *(_QWORD *)(v37 + 8 * v26);
    ++v28;
    if (v27)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

unint64_t KnownAggregationRecipeClient.descriptorName.getter()
{
  return OUTLINED_FUNCTION_5_3(19);
}

uint64_t KnownAggregationRecipeClient.sodaClientName.getter()
{
  return OUTLINED_FUNCTION_1_3(0x7053u);
}

uint64_t KnownAggregationRecipeClient.adHocRecipesAllowed.getter()
{
  if (qword_1EEE33520 != -1)
    swift_once();
  return byte_1EEE33FF0;
}

void KnownAggregationRecipeClient.init(rawValue:)(BOOL *a1@<X8>)
{
  sub_1AF2249A0(a1);
}

uint64_t KnownAggregationRecipeClient.rawValue.getter()
{
  return OUTLINED_FUNCTION_1_3(0x7073u);
}

void sub_1AF22493C(BOOL *a1@<X8>)
{
  KnownAggregationRecipeClient.init(rawValue:)(a1);
}

void sub_1AF224948(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = KnownAggregationRecipeClient.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_50();
}

unint64_t KnownAggregationProcessBundleId.assetContainerPath.getter()
{
  return OUTLINED_FUNCTION_5_3(61);
}

uint64_t KnownAggregationProcessBundleId.uafAssetSpecifierSuffix.getter()
{
  return 5718355;
}

void KnownAggregationProcessBundleId.init(rawValue:)(BOOL *a1@<X8>)
{
  sub_1AF2249A0(a1);
}

void sub_1AF2249A0(BOOL *a1@<X8>)
{
  uint64_t v2;

  v2 = sub_1AF2416F0();
  OUTLINED_FUNCTION_27();
  *a1 = v2 != 0;
  OUTLINED_FUNCTION_49();
}

unint64_t KnownAggregationProcessBundleId.rawValue.getter()
{
  return OUTLINED_FUNCTION_5_3(38);
}

void sub_1AF224A08(BOOL *a1@<X8>)
{
  KnownAggregationProcessBundleId.init(rawValue:)(a1);
}

void sub_1AF224A14(_QWORD *a1@<X8>)
{
  uint64_t v2;

  KnownAggregationProcessBundleId.rawValue.getter();
  *a1 = 0xD000000000000026;
  a1[1] = v2;
  OUTLINED_FUNCTION_50();
}

uint64_t KnownAggregationRecipeName.sodaRecipeDirectory.getter()
{
  unsigned __int8 *v0;
  uint64_t v2;

  if (*v0 > 1u)
  {
    v2 = 0;
  }
  else
  {
    sub_1AF241630();
    swift_bridgeObjectRelease();
    v2 = 0x6867696C746F7053;
  }
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_0_7();
  return v2;
}

uint64_t KnownAggregationRecipeName.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1AF224B58 + 4 * byte_1AF243380[*v0]))(0xD00000000000001ALL, 0x80000001AF246010);
}

unint64_t sub_1AF224B58()
{
  return 0xD000000000000016;
}

void KnownAggregationRecipeName.recipeFileName.getter()
{
  __asm { BR              X11 }
}

uint64_t sub_1AF224BE8()
{
  uint64_t v1;

  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_0_7();
  return v1;
}

uint64_t KnownAggregationRecipeName.uafAssetSpecifier.getter()
{
  char *v0;

  return *(_QWORD *)&aExtractireport[8 * *v0];
}

uint64_t KnownAggregationRecipeName.telemetryIdentifier.getter()
{
  unsigned __int8 *v0;

  return *v0 + 1;
}

PegasusConfiguration::KnownAggregationRecipeName_optional __swiftcall KnownAggregationRecipeName.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  PegasusConfiguration::KnownAggregationRecipeName_optional result;

  v2 = v1;
  v3 = sub_1AF2416F0();
  OUTLINED_FUNCTION_27();
  v4 = 4;
  if (v3 < 4)
    v4 = v3;
  *v2 = v4;
  OUTLINED_FUNCTION_49();
  return result;
}

void *static KnownAggregationRecipeName.allCases.getter()
{
  return &unk_1E5F3B550;
}

void sub_1AF224CD0(char *a1)
{
  sub_1AF21F67C(*a1);
}

void sub_1AF224CDC()
{
  sub_1AF231AF4();
}

void sub_1AF224CE4(uint64_t a1)
{
  char *v1;

  sub_1AF231C20(a1, *v1);
}

void sub_1AF224CEC()
{
  sub_1AF231FAC();
}

PegasusConfiguration::KnownAggregationRecipeName_optional sub_1AF224CF4(Swift::String *a1)
{
  return KnownAggregationRecipeName.init(rawValue:)(*a1);
}

void sub_1AF224D00(uint64_t *a1@<X8>)
{
  uint64_t v2;

  *a1 = KnownAggregationRecipeName.rawValue.getter();
  a1[1] = v2;
  OUTLINED_FUNCTION_50();
}

void sub_1AF224D20(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E5F3B550;
}

unint64_t sub_1AF224D34()
{
  unint64_t result;

  result = qword_1EEE33A78;
  if (!qword_1EEE33A78)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for KnownAggregationRecipeClient, &type metadata for KnownAggregationRecipeClient);
    atomic_store(result, (unint64_t *)&qword_1EEE33A78);
  }
  return result;
}

unint64_t sub_1AF224D74()
{
  unint64_t result;

  result = qword_1EEE33A80;
  if (!qword_1EEE33A80)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for KnownAggregationProcessBundleId, &type metadata for KnownAggregationProcessBundleId);
    atomic_store(result, (unint64_t *)&qword_1EEE33A80);
  }
  return result;
}

unint64_t sub_1AF224DB4()
{
  unint64_t result;

  result = qword_1EEE33A88;
  if (!qword_1EEE33A88)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for KnownAggregationRecipeName, &type metadata for KnownAggregationRecipeName);
    atomic_store(result, (unint64_t *)&qword_1EEE33A88);
  }
  return result;
}

unint64_t sub_1AF224DF4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEE33A90;
  if (!qword_1EEE33A90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE33A98);
    result = MEMORY[0x1AF45A834](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EEE33A90);
  }
  return result;
}

uint64_t sub_1AF224E44()
{
  return 0;
}

void type metadata accessor for KnownAggregationRecipeClient()
{
  OUTLINED_FUNCTION_103();
}

uint64_t getEnumTagSinglePayload for TaskCoordinator.TaskError(unsigned int *a1, int a2)
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

uint64_t _s20PegasusConfiguration28KnownAggregationRecipeClientOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1AF224EE8 + 4 * byte_1AF243388[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1AF224F08 + 4 * byte_1AF24338D[v4]))();
}

_BYTE *sub_1AF224EE8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1AF224F08(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1AF224F10(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1AF224F18(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1AF224F20(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1AF224F28(_DWORD *result)
{
  *result = 0;
  return result;
}

void type metadata accessor for KnownAggregationProcessBundleId()
{
  OUTLINED_FUNCTION_103();
}

uint64_t getEnumTagSinglePayload for KnownAggregationRecipeName(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for KnownAggregationRecipeName(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AF225014 + 4 * byte_1AF243397[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1AF225048 + 4 * byte_1AF243392[v4]))();
}

uint64_t sub_1AF225048(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF225050(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF225058);
  return result;
}

uint64_t sub_1AF225064(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF22506CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1AF225070(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF225078(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for KnownAggregationRecipeName()
{
  OUTLINED_FUNCTION_103();
}

uint64_t dispatch thunk of ContextProtocol.geoDeviceCountryCode.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ContextProtocol.localeIdentifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ContextProtocol.effectiveSystemLanguage.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of ContextProtocol.preferredLanguages.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of ContextProtocol.hasRequiredItemsForConfigFetch.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

ValueMetadata *type metadata accessor for ConfigContext()
{
  return &type metadata for ConfigContext;
}

uint64_t sub_1AF2250CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_1AF240FAC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
  sub_1AF240F64();

  v5 = sub_1AF240F4C();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5;
}

uint64_t sub_1AF22518C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v13;
  void (*v14)(char *);
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint8_t *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  id v34;
  char *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void (*v40)(char *);
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v1 = sub_1AF2411B0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v40 - v6;
  v44 = sub_1AF240FAC();
  v8 = *(_QWORD *)(v44 - 8);
  MEMORY[0x1E0C80A78](v44);
  v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static DeviceContextUtil.deviceCountryCode()();
  OUTLINED_FUNCTION_4_4();
  if (v0)
  {
    static DeviceContextUtil.effectiveSystemLanguage()();
    OUTLINED_FUNCTION_4_4();
    v11 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
    sub_1AF240F64();

    sub_1AF240F4C();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v44);
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v41 = v10;
    if (qword_1ED32EC08 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v1, (uint64_t)qword_1ED330238);
    v14 = *(void (**)(char *))(v2 + 16);
    v45 = v13;
    v14(v7);
    v15 = sub_1AF241198();
    v16 = sub_1AF2414A4();
    v17 = os_log_type_enabled(v15, v16);
    v42 = v8;
    v43 = v5;
    if (v17)
    {
      v18 = (uint8_t *)OUTLINED_FUNCTION_4();
      v46 = OUTLINED_FUNCTION_4();
      v40 = v14;
      *(_DWORD *)v18 = 136315138;
      v19 = static DeviceContextUtil.deviceCountryCode()();
      if (v20)
      {
        v21 = v20;
      }
      else
      {
        v19 = 7104878;
        v21 = 0xE300000000000000;
      }
      v22 = sub_1AF208AF4(v19, v21, &v46);
      OUTLINED_FUNCTION_2_5(v22);
      sub_1AF24157C();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_87(&dword_1AF203000, v15, v16, "ConfigDebug: context.geoDeviceCountryCode = %s", v18);
      OUTLINED_FUNCTION_113();
      OUTLINED_FUNCTION_1();
    }

    v23 = *(void (**)(char *, uint64_t))(v2 + 8);
    v23(v7, v1);
    ((void (*)(char *, uint64_t, uint64_t))v14)(v5, v45, v1);
    v24 = sub_1AF241198();
    v25 = sub_1AF2414A4();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)OUTLINED_FUNCTION_4();
      v46 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v26 = 136315138;
      static DeviceContextUtil.effectiveSystemLanguage()();
      if (v28)
      {
        v29 = v28;
      }
      else
      {
        v27 = 7104878;
        v29 = 0xE300000000000000;
      }
      v30 = sub_1AF208AF4(v27, v29, &v46);
      OUTLINED_FUNCTION_2_5(v30);
      sub_1AF24157C();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_87(&dword_1AF203000, v24, v25, "ConfigDebug: context.effectiveCountryCode = %s", v26);
      OUTLINED_FUNCTION_113();
      OUTLINED_FUNCTION_1();
    }

    v23(v5, v1);
    v31 = sub_1AF241198();
    v32 = sub_1AF2414A4();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)OUTLINED_FUNCTION_4();
      v46 = OUTLINED_FUNCTION_4();
      *(_DWORD *)v33 = 136315138;
      v34 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
      v35 = v41;
      sub_1AF240F64();

      v36 = sub_1AF240F4C();
      v38 = v37;
      (*(void (**)(char *, uint64_t))(v42 + 8))(v35, v44);
      v39 = sub_1AF208AF4(v36, v38, &v46);
      OUTLINED_FUNCTION_2_5(v39);
      sub_1AF24157C();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_87(&dword_1AF203000, v31, v32, "ConfigDebug: context.localeIdentifier = %s", v33);
      OUTLINED_FUNCTION_113();
      OUTLINED_FUNCTION_1();
    }

    return 0;
  }
}

BOOL sub_1AF225660()
{
  os_unfair_lock_s *v0;
  uint64_t v1;
  _BOOL8 v2;

  OUTLINED_FUNCTION_1_4();
  v2 = *(uint64_t *)(v1 + 24) > 0 || *(unsigned __int8 *)(v1 + 16) - 1 < 2;
  os_unfair_lock_unlock(v0);
  return v2;
}

BOOL sub_1AF2256AC()
{
  os_unfair_lock_s *v0;
  uint64_t v1;
  _BOOL8 v2;

  OUTLINED_FUNCTION_1_4();
  v2 = *(unsigned __int8 *)(v1 + 16) == 2;
  os_unfair_lock_unlock(v0);
  return v2;
}

void sub_1AF2256E0()
{
  _BYTE *v0;
  os_unfair_lock_s *v1;

  OUTLINED_FUNCTION_3_6();
  sub_1AF225F78(v0);
  os_unfair_lock_unlock(v1);
}

uint64_t sub_1AF225720()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1AF225738()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1AF2257C8;
  return sub_1AF24172C();
}

uint64_t sub_1AF2257C8()
{
  OUTLINED_FUNCTION_14();
  return swift_task_switch();
}

uint64_t sub_1AF225810()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 32));
}

void sub_1AF22581C(double a1)
{
  uint64_t v1;
  os_unfair_lock_s *v2;

  OUTLINED_FUNCTION_3_6();
  sub_1AF225ADC(v1, a1);
  os_unfair_lock_unlock(v2);
}

uint64_t sub_1AF22586C()
{
  return sub_1AF2417F8();
}

uint64_t sub_1AF225890()
{
  sub_1AF2417EC();
  sub_1AF2417F8();
  return sub_1AF241810();
}

uint64_t sub_1AF2258D8()
{
  sub_1AF2417EC();
  sub_1AF2417F8();
  return sub_1AF241810();
}

uint64_t sub_1AF225914()
{
  return sub_1AF2417F8();
}

uint64_t sub_1AF225938()
{
  sub_1AF2417EC();
  sub_1AF2417F8();
  return sub_1AF241810();
}

uint64_t sub_1AF22597C()
{
  return sub_1AF225938();
}

uint64_t sub_1AF225984()
{
  return sub_1AF225914();
}

BOOL sub_1AF22598C(char *a1, char *a2)
{
  return sub_1AF21F8BC(*a1, *a2);
}

void sub_1AF225998(uint64_t a1, uint64_t a2)
{
  os_unfair_lock_s *v3;
  unsigned __int8 *v4;
  os_unfair_lock_s *v5;
  char v6;

  v3 = *(os_unfair_lock_s **)(a2 + 16);
  v4 = (unsigned __int8 *)&v3[4];
  v5 = v3 + 12;
  os_unfair_lock_lock(v3 + 12);
  sub_1AF225A20(v4, a1, &v6);
  os_unfair_lock_unlock(v5);
  if (v6 != 2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E4C8);
    sub_1AF2413FC();
  }
}

unsigned __int8 *sub_1AF225A20@<X0>(unsigned __int8 *result@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  unsigned int v4;
  unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = *result;
  if (v4 >= 2)
  {
    v10 = v4 != 2;
  }
  else
  {
    v6 = result;
    sub_1AF22AC74();
    v7 = *(_QWORD *)(*((_QWORD *)v6 + 2) + 16);
    sub_1AF22ACE0(v7);
    v8 = *((_QWORD *)v6 + 2);
    *(_QWORD *)(v8 + 16) = v7 + 1;
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E4C8);
    result = (unsigned __int8 *)(*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8)
                                                                                              + 16))(v8+ ((*(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * v7, a2, v9);
    *((_QWORD *)v6 + 2) = v8;
    v10 = 2;
  }
  *a3 = v10;
  return result;
}

uint64_t sub_1AF225ADC(uint64_t a1, double a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E980);
  result = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)a1 == 1)
  {
    v8 = sub_1AF241420();
    __swift_storeEnumTagSinglePayload((uint64_t)v7, 1, 1, v8);
    v9 = swift_allocObject();
    swift_weakInit();
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = 0;
    *(_QWORD *)(v10 + 24) = 0;
    *(double *)(v10 + 32) = a2;
    *(_QWORD *)(v10 + 40) = v9;
    v11 = sub_1AF21089C((uint64_t)v7, (uint64_t)&unk_1EEE33AB0, v10);
    sub_1AF2268E8((uint64_t)v7);
    result = swift_release();
    *(_QWORD *)(a1 + 24) = v11;
  }
  return result;
}

uint64_t sub_1AF225BF4(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v5 + 48) = a5;
  *(double *)(v5 + 40) = a1;
  v6 = sub_1AF241678();
  *(_QWORD *)(v5 + 56) = v6;
  *(_QWORD *)(v5 + 64) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v5 + 72) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1AF225C58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  v1 = sub_1AF241834();
  v3 = v2;
  sub_1AF24166C();
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_1EEE33AB8 + dword_1EEE33AB8);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v4;
  *v4 = v0;
  v4[1] = sub_1AF225CEC;
  return v6(v1, v3, 0, 0, 1);
}

uint64_t sub_1AF225CEC()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  OUTLINED_FUNCTION_5_4();
  return swift_task_switch();
}

uint64_t sub_1AF225D6C()
{
  uint64_t v0;

  if ((sub_1AF241450() & 1) == 0)
  {
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      sub_1AF225DD8();
      swift_release();
    }
  }
  swift_task_dealloc();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF225DD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E4C8);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(os_unfair_lock_s **)(v0 + 16);
  v6 = v5 + 4;
  v7 = v5 + 12;
  os_unfair_lock_lock(v5 + 12);
  sub_1AF225F14(v6, &v14);
  os_unfair_lock_unlock(v7);
  v8 = *(_QWORD *)(v14 + 16);
  if (v8)
  {
    v9 = v14 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v10 = *(_QWORD *)(v2 + 72);
    v11 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    do
    {
      v11(v4, v9, v1);
      LOBYTE(v14) = 0;
      sub_1AF2413FC();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      v9 += v10;
      --v8;
    }
    while (v8);
  }
  return swift_bridgeObjectRelease();
}

_BYTE *sub_1AF225F14@<X0>(_BYTE *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;

  v3 = MEMORY[0x1E0DEE9D8];
  if (*result == 1)
  {
    v4 = result;
    *result = 2;
    result = (_BYTE *)swift_release();
    v5 = *((_QWORD *)v4 + 2);
    *((_QWORD *)v4 + 2) = v3;
    *((_QWORD *)v4 + 3) = 0;
    v3 = v5;
  }
  *a2 = v3;
  return result;
}

void sub_1AF225F78(_BYTE *a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (*a1 - 1 >= 2)
  {
    *a1 = 1;
  }
  else
  {
    if (qword_1ED32EC08 != -1)
      swift_once();
    v1 = sub_1AF2411B0();
    __swift_project_value_buffer(v1, (uint64_t)qword_1ED330238);
    v2 = sub_1AF241198();
    v3 = sub_1AF2414B0();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1AF203000, v2, v3, "Missing onRemoteRequestEnd call", v4, 2u);
      MEMORY[0x1AF45A8C4](v4, -1, -1);
    }

  }
}

uint64_t sub_1AF226068()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  os_unfair_lock_s *v5;
  unsigned __int8 *v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E4C8);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(os_unfair_lock_s **)(v0 + 16);
  v6 = (unsigned __int8 *)&v5[4];
  v7 = v5 + 12;
  os_unfair_lock_lock(v5 + 12);
  sub_1AF2261A8(v6, &v14);
  os_unfair_lock_unlock(v7);
  v8 = *(_QWORD *)(v14 + 16);
  if (v8)
  {
    v9 = v14 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v10 = *(_QWORD *)(v2 + 72);
    v11 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    do
    {
      v11(v4, v9, v1);
      LOBYTE(v14) = 1;
      sub_1AF2413FC();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      v9 += v10;
      --v8;
    }
    while (v8);
  }
  return swift_bridgeObjectRelease();
}

void sub_1AF2261A8(unsigned __int8 *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (*a1 - 1 > 1)
  {
    if (qword_1ED32EC08 != -1)
      swift_once();
    v4 = sub_1AF2411B0();
    __swift_project_value_buffer(v4, (uint64_t)qword_1ED330238);
    v5 = sub_1AF241198();
    v6 = sub_1AF2414B0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1AF203000, v5, v6, "Missing onRemoteRequestStart call", v7, 2u);
      MEMORY[0x1AF45A8C4](v7, -1, -1);
    }

  }
  else
  {
    *a1 = 3;
  }
  v9 = *((_QWORD *)a1 + 2);
  v8 = *((_QWORD *)a1 + 3);
  *((_QWORD *)a1 + 2) = MEMORY[0x1E0DEE9D8];
  if (v8)
  {
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC40);
    sub_1AF241438();
    swift_release_n();
    *((_QWORD *)a1 + 3) = 0;
  }
  *a2 = v9;
}

uint64_t sub_1AF226304()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TaskCoordinator()
{
  return objc_opt_self();
}

uint64_t destroy for TaskCoordinator.State()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for TaskCoordinator.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for TaskCoordinator.State(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for TaskCoordinator.State(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TaskCoordinator.State(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TaskCoordinator.State(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TaskCoordinator.State()
{
  return &type metadata for TaskCoordinator.State;
}

void sub_1AF2264FC(uint64_t a1)
{
  uint64_t v1;

  sub_1AF225998(a1, v1);
}

uint64_t sub_1AF226504()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E4D0);
  v1 = swift_allocObject();
  *(_DWORD *)(v1 + 48) = 0;
  v2 = MEMORY[0x1E0DEE9D8];
  *(_BYTE *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = 0;
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = 0;
  *(_QWORD *)(v0 + 16) = v1;
  return v0;
}

uint64_t sub_1AF22654C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_1AF241660();
  *(_QWORD *)(v6 + 64) = v12;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch();
}

uint64_t sub_1AF2265F0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  sub_1AF241678();
  sub_1AF226928((unint64_t *)&unk_1ED32E4D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0BA0], MEMORY[0x1E0DF0BB0]);
  sub_1AF2417A4();
  sub_1AF226928(&qword_1ED32E9D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0B60], MEMORY[0x1E0DF0B90]);
  sub_1AF241684();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_1AF226708;
  return sub_1AF2417B0();
}

uint64_t sub_1AF226708()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v3 = *(_QWORD *)(*v1 + 88);
  v4 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  *(_QWORD *)(v5 + 112) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1AF2267B4()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF2267E8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1AF22680C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1AF226838(uint64_t a1)
{
  double *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *((_QWORD *)v1 + 2);
  v5 = *((_QWORD *)v1 + 3);
  v6 = v1[4];
  v7 = *((_QWORD *)v1 + 5);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1AF2268B4;
  return sub_1AF225BF4(v6, a1, v4, v5, v7);
}

uint64_t sub_1AF2268B4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_14();
  return OUTLINED_FUNCTION_7(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1AF2268E8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E980);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AF226928(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1AF45A834](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TaskCoordinator.TaskError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1AF2269A8 + 4 * byte_1AF2436D0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1AF2269C8 + 4 * byte_1AF2436D5[v4]))();
}

_BYTE *sub_1AF2269A8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1AF2269C8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1AF2269D0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1AF2269D8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1AF2269E0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1AF2269E8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TaskCoordinator.TaskError()
{
  return &type metadata for TaskCoordinator.TaskError;
}

uint64_t storeEnumTagSinglePayload for TaskCoordinator.Status(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AF226A50 + 4 * byte_1AF2436DF[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1AF226A84 + 4 * byte_1AF2436DA[v4]))();
}

uint64_t sub_1AF226A84(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF226A8C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF226A94);
  return result;
}

uint64_t sub_1AF226AA0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF226AA8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1AF226AAC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF226AB4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TaskCoordinator.Status()
{
  return &type metadata for TaskCoordinator.Status;
}

unint64_t sub_1AF226AD4()
{
  unint64_t result;

  result = qword_1EEE33AC0;
  if (!qword_1EEE33AC0)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF24371C, &type metadata for TaskCoordinator.Status);
    atomic_store(result, (unint64_t *)&qword_1EEE33AC0);
  }
  return result;
}

unint64_t sub_1AF226B14()
{
  unint64_t result;

  result = qword_1EEE33AC8[0];
  if (!qword_1EEE33AC8[0])
  {
    result = MEMORY[0x1AF45A834](&unk_1AF2437C4, &type metadata for TaskCoordinator.TaskError);
    atomic_store(result, qword_1EEE33AC8);
  }
  return result;
}

uint64_t sub_1AF226B54()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1AF226B88()
{
  swift_getMetatypeMetadata();
  return sub_1AF2412AC();
}

BOOL sub_1AF226BB4(uint64_t a1)
{
  return a1 != 0;
}

uint64_t sub_1AF226BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x1AF45A834](&unk_1AF24390C, a3);
  return sub_1AF24175C();
}

uint64_t sub_1AF226C14(uint64_t a1)
{
  MEMORY[0x1AF45A834](&unk_1AF24390C, a1);
  return sub_1AF241390();
}

uint64_t sub_1AF226C60()
{
  MEMORY[0x1AF45A834](&unk_1AF24390C);
  return sub_1AF2413A8();
}

uint64_t sub_1AF226CB0()
{
  MEMORY[0x1AF45A834](&unk_1AF24390C);
  return sub_1AF24139C();
}

BOOL sub_1AF226D00@<W0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  _BOOL8 result;

  result = sub_1AF226BB4(*a1);
  *a2 = result;
  return result;
}

void sub_1AF226D30(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

unint64_t sub_1AF226D38()
{
  sub_1AF21AC24();
  return 0xD000000000000010;
}

uint64_t sub_1AF226D54()
{
  return sub_1AF226B88();
}

const char *sub_1AF226D5C()
{
  return "lifetime";
}

uint64_t sub_1AF226D70()
{
  sub_1AF23E658();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LifetimeSpanPrototype(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LifetimeSpanPrototype);
}

uint64_t sub_1AF226D9C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1AF226DA4(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1AF226DE4 + 4 * byte_1AF243830[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1AF226E04 + 4 * byte_1AF243835[v4]))();
}

_BYTE *sub_1AF226DE4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1AF226E04(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1AF226E0C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1AF226E14(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1AF226E1C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1AF226E24(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t type metadata accessor for LifetimeTrackingActivity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LifetimeTrackingActivity);
}

uint64_t sub_1AF226E3C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x1AF45A834](&unk_1AF243944);
  result = MEMORY[0x1AF45A834](&unk_1AF24390C, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

void sub_1AF226E80()
{
  JUMPOUT(0x1AF45A834);
}

void UserAgent.init(_:requestor:)(unint64_t a1)
{
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
  __n128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;

  Client.init(_:)(a1, (unint64_t *)&v29);
  v9 = OUTLINED_FUNCTION_1_5(v1, v2, v3, v4, v5, v6, v7, v8, v18, v20, SWORD2(v20), SBYTE6(v20), SHIBYTE(v20), v22, v25, v27, v29, v30, v31,
         v32);
  OUTLINED_FUNCTION_2_7(v9, v10, v11, v12, v13, v14, v15, v16, v19, v21, v23, v24, v26, v28, v29, *((uint64_t *)&v29 + 1), v30, v31, v32,
    v33,
    v34,
    v17,
    v35,
    v36);
  OUTLINED_FUNCTION_8_2();
}

Swift::String __swiftcall userAgentString(forClientName:forRequestor:)(Swift::String forClientName, Swift::String forRequestor)
{
  void *object;
  uint64_t v3;
  void *v4;
  Swift::String result;
  uint64_t countAndFlagsBits;

  object = forRequestor._object;
  countAndFlagsBits = forRequestor._countAndFlagsBits;
  sub_1AF21BAC8();
  sub_1AF21BAC8();
  sub_1AF21BAC8();
  sub_1AF21BAC8();
  OUTLINED_FUNCTION_4_5();
  sub_1AF24133C();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_5_5();
  sub_1AF24133C();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_5_5();
  sub_1AF24133C();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_4_5();
  sub_1AF24133C();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_4_5();
  sub_1AF24133C();
  v3 = countAndFlagsBits;
  v4 = object;
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

void sub_1AF227018()
{
  qword_1EEE334E0 = 0x6E776F6E6B6E75;
  unk_1EEE334E8 = 0xE700000000000000;
}

void sub_1AF22703C()
{
  qword_1ED32EB78 = 0x2F64636573726170;
  unk_1ED32EB80 = 0xE900000000000031;
}

void sub_1AF227064()
{
  strcpy((char *)qword_1ED32ECB0, "PegasusKit/1");
  unk_1ED32ECBD = 0;
  unk_1ED32ECBE = -5120;
}

double sub_1AF227090()
{
  double result;
  char v1;
  __int128 v2;
  unint64_t v3;
  __int128 v4;
  uint64_t v5;
  char v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v2 = xmmword_1AF2439B0;
  v3 = 0xE700000000000000;
  v1 = 0;
  UserAgent.init(_:requestor:)((uint64_t *)&v2, &v1, (uint64_t)&v4);
  result = *(double *)&v7;
  xmmword_1ED32EAD8 = v4;
  qword_1ED32EAE8 = v5;
  byte_1ED32EAF0 = v6;
  xmmword_1ED32EAF8 = v7;
  qword_1ED32EB08 = v8;
  unk_1ED32EB10 = v9;
  return result;
}

double sub_1AF227100()
{
  double result;
  char v1;
  __int128 v2;
  unint64_t v3;
  __int128 v4;
  uint64_t v5;
  char v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v2 = xmmword_1AF2439C0;
  v3 = 0xE700000000000000;
  v1 = 0;
  UserAgent.init(_:requestor:)((uint64_t *)&v2, &v1, (uint64_t)&v4);
  result = *(double *)&v7;
  xmmword_1EEE33BD0 = v4;
  qword_1EEE33BE0 = v5;
  byte_1EEE33BE8 = v6;
  xmmword_1EEE33BF0 = v7;
  qword_1EEE33C00 = v8;
  unk_1EEE33C08 = v9;
  return result;
}

uint64_t static UserAgent.unknown.getter()
{
  if (qword_1EEE33578 != -1)
    swift_once();
  OUTLINED_FUNCTION_0_8((uint64_t)&xmmword_1EEE33BD0);
  OUTLINED_FUNCTION_1_0();
  return OUTLINED_FUNCTION_3_7();
}

void UserAgent.requestor.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 24);
}

uint64_t UserAgent.init(_:requestor:)@<X0>(uint64_t *a1@<X0>, char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  Swift::String v17;
  Swift::String v18;
  Swift::String v19;
  uint64_t result;

  v5 = *a1;
  v4 = a1[1];
  v6 = (void *)a1[2];
  v7 = *a2;
  v8 = qword_1ED32ED00;
  OUTLINED_FUNCTION_163();
  if (v8 != -1)
    swift_once();
  v9 = v4 == qword_1ED32F7D0 && v6 == *(void **)algn_1ED32F7D8;
  if (v9 || (sub_1AF241744() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    if (qword_1EEE334F8 != -1)
      swift_once();
    v10 = qword_1EEE334E0;
    v11 = (void *)unk_1EEE334E8;
    OUTLINED_FUNCTION_7_5();
    if ((v7 & 1) != 0)
      goto LABEL_11;
  }
  else
  {
    OUTLINED_FUNCTION_163();
    OUTLINED_FUNCTION_4_5();
    swift_bridgeObjectRelease();
    v10 = v4;
    v11 = v6;
    if ((v7 & 1) != 0)
    {
LABEL_11:
      v12 = qword_1ED32ECA8;
      OUTLINED_FUNCTION_7_5();
      if (v12 != -1)
        swift_once();
      v13 = qword_1ED32ECB0;
      goto LABEL_18;
    }
  }
  v14 = qword_1ED32EB90;
  OUTLINED_FUNCTION_7_5();
  if (v14 != -1)
    swift_once();
  v13 = &qword_1ED32EB78;
LABEL_18:
  v16 = *v13;
  v15 = (void *)v13[1];
  swift_bridgeObjectRetain();
  v17._countAndFlagsBits = v10;
  v17._object = v11;
  v18._countAndFlagsBits = v16;
  v18._object = v15;
  v19 = userAgentString(forClientName:forRequestor:)(v17, v18);
  swift_bridgeObjectRelease();
  result = OUTLINED_FUNCTION_55();
  *(_QWORD *)a3 = v5;
  *(_QWORD *)(a3 + 8) = v4;
  *(_QWORD *)(a3 + 16) = v6;
  *(_BYTE *)(a3 + 24) = v7;
  *(Swift::String *)(a3 + 32) = v19;
  *(_QWORD *)(a3 + 48) = v10;
  *(_QWORD *)(a3 + 56) = v11;
  return result;
}

void UserAgent.init(_:requestor:)(uint64_t a1, uint64_t a2)
{
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
  __n128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;

  v2 = Client.init(_:)(a2, (uint64_t *)&v30);
  v10 = OUTLINED_FUNCTION_1_5(v2, v3, v4, v5, v6, v7, v8, v9, v19, v21, SWORD2(v21), SBYTE6(v21), SHIBYTE(v21), v23, v26, v28, v30, v31, v32,
          v33);
  OUTLINED_FUNCTION_2_7(v10, v11, v12, v13, v14, v15, v16, v17, v20, v22, v24, v25, v27, v29, v30, *((uint64_t *)&v30 + 1), v31, v32, v33,
    v34,
    v35,
    v18,
    v36,
    v37);
  OUTLINED_FUNCTION_8_2();
}

BOOL static Requestor.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Requestor.hash(into:)()
{
  return sub_1AF2417F8();
}

uint64_t Requestor.hashValue.getter()
{
  sub_1AF2417EC();
  sub_1AF2417F8();
  return sub_1AF241810();
}

unint64_t sub_1AF22745C()
{
  unint64_t result;

  result = qword_1EEE33C10;
  if (!qword_1EEE33C10)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for Requestor, &type metadata for Requestor);
    atomic_store(result, (unint64_t *)&qword_1EEE33C10);
  }
  return result;
}

uint64_t assignWithCopy for UserAgent(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for UserAgent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t storeEnumTagSinglePayload for Requestor(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1AF2275E4 + 4 * byte_1AF2439D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1AF227618 + 4 * byte_1AF2439D0[v4]))();
}

uint64_t sub_1AF227618(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF227620(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF227628);
  return result;
}

uint64_t sub_1AF227634(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF22763CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1AF227640(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF227648(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF227654()
{
  uint64_t v0;

  v0 = sub_1AF2411B0();
  __swift_allocate_value_buffer(v0, qword_1EEE33C18);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EEE33C18);
  return sub_1AF2411A4();
}

uint64_t sub_1AF2276C0()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC78);
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = 0;
  *(_DWORD *)(result + 32) = 0;
  qword_1ED32EC50 = result;
  return result;
}

void sub_1AF2276F8()
{
  uint64_t *v0;
  os_unfair_lock_s *v1;
  uint64_t v2;

  if (qword_1ED32EC58 != -1)
    swift_once();
  v0 = (uint64_t *)(qword_1ED32EC50 + 16);
  v1 = (os_unfair_lock_s *)(qword_1ED32EC50 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_1ED32EC50 + 32));
  sub_1AF209504(v0, &v2);
  os_unfair_lock_unlock(v1);
}

uint64_t static PrimaryPersonaContainerPathLookup.path(for:)()
{
  uint64_t v0;
  const char *path;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (container_query_create())
  {
    container_query_set_class();
    v0 = sub_1AF2412D0();
    xpc_string_create((const char *)(v0 + 32));
    swift_release();
    container_query_set_group_identifiers();
    swift_unknownObjectRelease();
    container_query_set_persona_unique_string();
    container_query_operation_set_flags();
    if (container_query_get_single_result())
    {
      path = (const char *)container_get_path();
      if (path)
      {
        if ((uint64_t)strlen(path) >= 1)
        {
          sub_1AF2279D0();
          v2 = sub_1AF241348();
          container_query_free();
          return v2;
        }
        sub_1AF227994();
        OUTLINED_FUNCTION_8();
        *(_OWORD *)v6 = xmmword_1AF243AB0;
        v7 = 2;
      }
      else
      {
        if (container_query_get_last_error())
        {
          if (container_error_copy_unlocalized_description())
          {
            sub_1AF241348();
            OUTLINED_FUNCTION_1_6();
          }
        }
        sub_1AF227994();
        OUTLINED_FUNCTION_8();
        *(_QWORD *)v6 = 0;
        *(_QWORD *)(v6 + 8) = 0xE000000000000000;
        v7 = 1;
      }
      *(_BYTE *)(v6 + 16) = v7;
    }
    else
    {
      if (container_query_get_last_error() && container_error_copy_unlocalized_description())
      {
        sub_1AF241348();
        OUTLINED_FUNCTION_1_6();
      }
      sub_1AF227994();
      OUTLINED_FUNCTION_8();
      *(_QWORD *)v5 = 0;
      *(_QWORD *)(v5 + 8) = 0xE000000000000000;
      *(_BYTE *)(v5 + 16) = 0;
    }
    swift_willThrow();
    return container_query_free();
  }
  else
  {
    sub_1AF227994();
    OUTLINED_FUNCTION_8();
    *(_QWORD *)v4 = 0;
    *(_QWORD *)(v4 + 8) = 0;
    *(_BYTE *)(v4 + 16) = 2;
    return swift_willThrow();
  }
}

unint64_t sub_1AF227994()
{
  unint64_t result;

  result = qword_1EEE33C30;
  if (!qword_1EEE33C30)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for PegasusConfigPathError, &type metadata for PegasusConfigPathError);
    atomic_store(result, (unint64_t *)&qword_1EEE33C30);
  }
  return result;
}

void sub_1AF2279D0()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  NSObject *oslog;

  if (container_copy_sandbox_token())
  {
    if (sandbox_extension_consume() == -1)
    {
      if (qword_1EEE33580 != -1)
        swift_once();
      v0 = sub_1AF2411B0();
      __swift_project_value_buffer(v0, (uint64_t)qword_1EEE33C18);
      v1 = sub_1AF241198();
      v2 = sub_1AF2414B0();
      if (os_log_type_enabled(v1, v2))
      {
        v3 = (uint8_t *)OUTLINED_FUNCTION_1_2();
        *(_WORD *)v3 = 0;
        _os_log_impl(&dword_1AF203000, v1, v2, "token/process not valid for extension", v3, 2u);
        OUTLINED_FUNCTION_1();
      }

    }
    JUMPOUT(0x1AF45A8C4);
  }
  if (qword_1EEE33580 != -1)
    swift_once();
  v4 = sub_1AF2411B0();
  __swift_project_value_buffer(v4, (uint64_t)qword_1EEE33C18);
  oslog = sub_1AF241198();
  v5 = sub_1AF2414B0();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_1_2();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AF203000, oslog, v5, "token not sent by container", v6, 2u);
    OUTLINED_FUNCTION_1();
  }

}

uint64_t destroy for PegasusConfigPathError(uint64_t a1)
{
  return sub_1AF219840(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s20PegasusConfiguration22PegasusConfigPathErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1AF21986C(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for PegasusConfigPathError(uint64_t a1, uint64_t a2)
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
  sub_1AF21986C(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1AF219840(v6, v7, v8);
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

uint64_t assignWithTake for PegasusConfigPathError(uint64_t a1, uint64_t a2)
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
  sub_1AF219840(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PegasusConfigPathError(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 2)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PegasusConfigPathError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1AF227CF4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_1AF227D0C(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for PegasusConfigPathError()
{
  return &type metadata for PegasusConfigPathError;
}

ValueMetadata *type metadata accessor for PrimaryPersonaContainerPathLookup()
{
  return &type metadata for PrimaryPersonaContainerPathLookup;
}

void BiomeStreamConfig.init(fileManager:descriptor:)(void *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unsigned __int8 v25;
  unsigned __int8 v26;

  v8 = sub_1AF240E2C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_2_8();
  v26 = *a2;
  v10 = v26;
  v11 = FeedbackStreamDescriptor.tableName.getter();
  v13 = v12;
  v14 = 0x80000001AF247460;
  if (!v26)
    v14 = 0x80000001AF247490;
  v23 = v11;
  v24 = v14;
  v25 = v26;
  NSFileManager.biomeStreamURL(for:)(&v25, v4);
  if (v3)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  else
  {
    sub_1AF20DC7C();
    v15 = sub_1AF240DE4();
    v22 = v13;
    v17 = v16;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v8);
    if (v10)
      v18 = 0xD000000000000028;
    else
      v18 = 0xD000000000000026;
    if (v10)
      v19 = 0x200000;
    else
      v19 = 0x20000;
    v20 = sub_1AF2097A0(v15, v17, v19, 3);
    FeedbackStreamDescriptor.rawValue.getter();
    v21 = sub_1AF24124C();
    OUTLINED_FUNCTION_40();

    *a3 = v23;
    a3[1] = v22;
    a3[2] = v18;
    a3[3] = v24;
    a3[4] = (uint64_t)v20;
    a3[5] = v21;
  }
  OUTLINED_FUNCTION_0();
}

unint64_t sub_1AF227ED4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1AF2415DC();
  return sub_1AF227F04(a1, v2);
}

unint64_t sub_1AF227F04(uint64_t a1, uint64_t a2)
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
      sub_1AF21F4A0(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1AF45A0A8](v9, a1);
      sub_1AF21F5B0((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1AF227FC8()
{
  unint64_t result;

  result = qword_1EEE33C38;
  if (!qword_1EEE33C38)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for FeedbackStreamError, &type metadata for FeedbackStreamError);
    atomic_store(result, (unint64_t *)&qword_1EEE33C38);
  }
  return result;
}

void sub_1AF228004()
{
  qword_1ED330200 = 0x6769666E6F63;
  *(_QWORD *)algn_1ED330208 = 0xE600000000000000;
}

void sub_1AF228024()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_19();
  __swift_allocate_value_buffer(v0, qword_1ED330238);
  OUTLINED_FUNCTION_3_9();
  if (qword_1ED32EAD0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1AF2411A4();
  OUTLINED_FUNCTION_49();
}

void sub_1AF2280C0(uint64_t a1)
{
  OUTLINED_FUNCTION_0_9(a1, qword_1EEE34010);
}

void sub_1AF2280D8(uint64_t a1)
{
  OUTLINED_FUNCTION_0_9(a1, qword_1ED3301E8);
}

void sub_1AF2280F0(uint64_t a1)
{
  sub_1AF228130(a1, qword_1EEE34028);
}

void sub_1AF228114(uint64_t a1)
{
  sub_1AF228130(a1, qword_1EEE34040);
}

void sub_1AF228130(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_19();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  sub_1AF2411A4();
  OUTLINED_FUNCTION_49();
}

uint64_t sub_1AF228198()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_19();
  __swift_allocate_value_buffer(v0, qword_1ED330210);
  OUTLINED_FUNCTION_3_9();
  return sub_1AF2411A4();
}

uint64_t sub_1AF2281FC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ConfigurationLogging()
{
  return objc_opt_self();
}

uint64_t sub_1AF22822C()
{
  uint64_t v0;

  v0 = sub_1AF2411B0();
  __swift_allocate_value_buffer(v0, qword_1ED330110);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED330110);
  return sub_1AF2411A4();
}

uint64_t sub_1AF2282AC()
{
  uint64_t result;

  result = sub_1AF2282D0(5u);
  byte_1EEE33FF0 = result & 1;
  return result;
}

uint64_t sub_1AF2282D0(unsigned __int8 a1)
{
  void *v1;
  uint64_t v2;
  uint64_t result;
  unsigned __int8 v4;

  sub_1AF228358(a1);
  v1 = (void *)sub_1AF24124C();
  swift_bridgeObjectRelease();
  v2 = MGCopyAnswer();

  if (!v2)
    return 0;
  result = swift_dynamicCast();
  if ((_DWORD)result)
    return v4;
  return result;
}

uint64_t sub_1AF228358(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1AF228390 + 4 * byte_1AF243BD0[a1]))(0xD000000000000015, 0x80000001AF247520);
}

uint64_t sub_1AF228390()
{
  return 0x726556646C697542;
}

uint64_t sub_1AF2283B0()
{
  return 0x4E746375646F7250;
}

uint64_t sub_1AF2283D0()
{
  return 0x54746375646F7250;
}

uint64_t sub_1AF2283F4()
{
  return 0x56746375646F7250;
}

uint64_t sub_1AF228418()
{
  return 0x6F436E6F69676552;
}

uint64_t sub_1AF228434()
{
  return 0x6C616E7265746E49;
}

uint64_t sub_1AF228458()
{
  return 0x48746375646F7250;
}

void Useragentpb_ClientID.init()(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

unint64_t Useragentpb_ClientID.init(rawValue:)@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = result < 0x12;
  *(_BYTE *)(a2 + 9) = 0;
  return result;
}

uint64_t Useragentpb_ClientID.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

unint64_t sub_1AF2284B4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return Useragentpb_ClientID.init(rawValue:)(*a1, a2);
}

uint64_t sub_1AF2284BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = Useragentpb_ClientID.rawValue.getter();
  *a1 = result;
  return result;
}

void sub_1AF2284E0()
{
  sub_1AF231B1C();
}

uint64_t sub_1AF2284EC()
{
  sub_1AF228D7C();
  return sub_1AF2410C0();
}

void sub_1AF228524()
{
  sub_1AF231E74();
}

BOOL sub_1AF228530(uint64_t a1, uint64_t *a2)
{
  return sub_1AF21F8B0(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8), *a2);
}

void sub_1AF22854C()
{
  qword_1EEE33C40 = (uint64_t)&unk_1E5F3B118;
}

uint64_t static Useragentpb_ClientID.allCases.getter()
{
  if (qword_1EEE335B8 != -1)
    swift_once();
  OUTLINED_FUNCTION_30();
  return swift_bridgeObjectRetain();
}

uint64_t static Useragentpb_ClientID.allCases.setter(uint64_t a1)
{
  if (qword_1EEE335B8 != -1)
    swift_once();
  OUTLINED_FUNCTION_30();
  qword_1EEE33C40 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static Useragentpb_ClientID.allCases.modify())()
{
  if (qword_1EEE335B8 != -1)
    swift_once();
  OUTLINED_FUNCTION_30();
  return j__swift_endAccess;
}

uint64_t sub_1AF2286A0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static Useragentpb_ClientID.allCases.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1AF2286C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  unint64_t v9;
  _QWORD *v10;
  char *v11;
  _QWORD *v12;
  char *v13;
  _QWORD *v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  char *v19;
  _QWORD *v20;
  char *v21;
  _QWORD *v22;
  char *v23;
  _QWORD *v24;
  char *v25;
  _QWORD *v26;
  char *v27;
  _QWORD *v28;
  char *v29;
  _QWORD *v30;
  char *v31;
  _QWORD *v32;
  char *v33;
  _QWORD *v34;
  char *v35;
  _QWORD *v36;
  char *v37;
  _QWORD *v38;
  char *v39;
  _QWORD *v40;
  char *v41;
  uint64_t v43;

  v0 = sub_1AF2410E4();
  __swift_allocate_value_buffer(v0, qword_1EEE33C48);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EEE33C48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33C90);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33C98);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 72);
  v4 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_1AF243C00;
  v5 = v43 + v4 + *(int *)(v1 + 48);
  *(_QWORD *)(v43 + v4) = 0;
  *(_QWORD *)v5 = "UnknownClient";
  *(_QWORD *)(v5 + 8) = 13;
  *(_BYTE *)(v5 + 16) = 2;
  v6 = *MEMORY[0x1E0D3EF08];
  v7 = sub_1AF2410CC();
  v8 = *(void (**)(void))(*(_QWORD *)(v7 - 8) + 104);
  ((void (*)(unint64_t, uint64_t, uint64_t))v8)(v5, v6, v7);
  v9 = v43 + v4 + v3 + *(int *)(v1 + 48);
  *(_QWORD *)(v43 + v4 + v3) = 1;
  *(_QWORD *)v9 = "Safari";
  *(_QWORD *)(v9 + 8) = 6;
  *(_BYTE *)(v9 + 16) = 2;
  v8();
  v10 = (_QWORD *)(v43 + v4 + 2 * v3);
  v11 = (char *)v10 + *(int *)(v1 + 48);
  *v10 = 2;
  *(_QWORD *)v11 = "Spotlight";
  *((_QWORD *)v11 + 1) = 9;
  v11[16] = 2;
  v8();
  v12 = (_QWORD *)(v43 + v4 + 3 * v3);
  v13 = (char *)v12 + *(int *)(v1 + 48);
  *v12 = 3;
  *(_QWORD *)v13 = "Lookup";
  *((_QWORD *)v13 + 1) = 6;
  v13[16] = 2;
  v8();
  v14 = (_QWORD *)(v43 + v4 + 4 * v3);
  v15 = (char *)v14 + *(int *)(v1 + 48);
  *v14 = 4;
  *(_QWORD *)v15 = "Siri";
  *((_QWORD *)v15 + 1) = 4;
  v15[16] = 2;
  v8();
  v16 = (_QWORD *)(v43 + v4 + 5 * v3);
  v17 = (char *)v16 + *(int *)(v1 + 48);
  *v16 = 5;
  *(_QWORD *)v17 = "Messages";
  *((_QWORD *)v17 + 1) = 8;
  v17[16] = 2;
  v8();
  v18 = (_QWORD *)(v43 + v4 + 6 * v3);
  v19 = (char *)v18 + *(int *)(v1 + 48);
  *v18 = 6;
  *(_QWORD *)v19 = "News";
  *((_QWORD *)v19 + 1) = 4;
  v19[16] = 2;
  v8();
  v20 = (_QWORD *)(v43 + v4 + 7 * v3);
  v21 = (char *)v20 + *(int *)(v1 + 48);
  *v20 = 7;
  *(_QWORD *)v21 = "Parsecd";
  *((_QWORD *)v21 + 1) = 7;
  v21[16] = 2;
  v8();
  v22 = (_QWORD *)(v43 + v4 + 8 * v3);
  v23 = (char *)v22 + *(int *)(v1 + 48);
  *v22 = 8;
  *(_QWORD *)v23 = "DPrivacyd";
  *((_QWORD *)v23 + 1) = 9;
  v23[16] = 2;
  v8();
  v24 = (_QWORD *)(v43 + v4 + 9 * v3);
  v25 = (char *)v24 + *(int *)(v1 + 48);
  *v24 = 9;
  *(_QWORD *)v25 = "CoreSuggestions";
  *((_QWORD *)v25 + 1) = 15;
  v25[16] = 2;
  v8();
  v26 = (_QWORD *)(v43 + v4 + 10 * v3);
  v27 = (char *)v26 + *(int *)(v1 + 48);
  *v26 = 10;
  *(_QWORD *)v27 = "FlightUtilities";
  *((_QWORD *)v27 + 1) = 15;
  v27[16] = 2;
  v8();
  v28 = (_QWORD *)(v43 + v4 + 11 * v3);
  v29 = (char *)v28 + *(int *)(v1 + 48);
  *v28 = 11;
  *(_QWORD *)v29 = "Trystero";
  *((_QWORD *)v29 + 1) = 8;
  v29[16] = 2;
  v8();
  v30 = (_QWORD *)(v43 + v4 + 12 * v3);
  v31 = (char *)v30 + *(int *)(v1 + 48);
  *v30 = 12;
  *(_QWORD *)v31 = "MapsSuggestions";
  *((_QWORD *)v31 + 1) = 15;
  v31[16] = 2;
  v8();
  v32 = (_QWORD *)(v43 + v4 + 13 * v3);
  v33 = (char *)v32 + *(int *)(v1 + 48);
  *v32 = 13;
  *(_QWORD *)v33 = "DuetExpert";
  *((_QWORD *)v33 + 1) = 10;
  v33[16] = 2;
  v8();
  v34 = (_QWORD *)(v43 + v4 + 14 * v3);
  v35 = (char *)v34 + *(int *)(v1 + 48);
  *v34 = 14;
  *(_QWORD *)v35 = "VisualIntelligence";
  *((_QWORD *)v35 + 1) = 18;
  v35[16] = 2;
  v8();
  v36 = (_QWORD *)(v43 + v4 + 15 * v3);
  v37 = (char *)v36 + *(int *)(v1 + 48);
  *v36 = 15;
  *(_QWORD *)v37 = "AMP";
  *((_QWORD *)v37 + 1) = 3;
  v37[16] = 2;
  v8();
  v38 = (_QWORD *)(v43 + v4 + 16 * v3);
  v39 = (char *)v38 + *(int *)(v1 + 48);
  *v38 = 16;
  *(_QWORD *)v39 = "Mail";
  *((_QWORD *)v39 + 1) = 4;
  v39[16] = 2;
  v8();
  v40 = (_QWORD *)(v43 + v4 + 17 * v3);
  v41 = (char *)v40 + *(int *)(v1 + 48);
  *v40 = 17;
  *(_QWORD *)v41 = "Sideband";
  *((_QWORD *)v41 + 1) = 8;
  v41[16] = 2;
  v8();
  return sub_1AF2410D8();
}

uint64_t static Useragentpb_ClientID._protobuf_nameMap.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EEE335C0 != -1)
    swift_once();
  v2 = sub_1AF2410E4();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EEE33C48);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_1AF228BC4()
{
  unint64_t result;

  result = qword_1EEE33C60;
  if (!qword_1EEE33C60)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for Useragentpb_ClientID, &type metadata for Useragentpb_ClientID);
    atomic_store(result, (unint64_t *)&qword_1EEE33C60);
  }
  return result;
}

unint64_t sub_1AF228C04()
{
  unint64_t result;

  result = qword_1EEE33C68;
  if (!qword_1EEE33C68)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for Useragentpb_ClientID, &type metadata for Useragentpb_ClientID);
    atomic_store(result, (unint64_t *)&qword_1EEE33C68);
  }
  return result;
}

unint64_t sub_1AF228C44()
{
  unint64_t result;

  result = qword_1EEE33C70;
  if (!qword_1EEE33C70)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for Useragentpb_ClientID, &type metadata for Useragentpb_ClientID);
    atomic_store(result, (unint64_t *)&qword_1EEE33C70);
  }
  return result;
}

unint64_t sub_1AF228C84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEE33C78;
  if (!qword_1EEE33C78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE33C80);
    result = MEMORY[0x1AF45A834](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EEE33C78);
  }
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for Useragentpb_ClientID(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Useragentpb_ClientID(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_1AF228D30(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1AF228D4C(uint64_t result, int a2)
{
  char v2;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  *(_BYTE *)(result + 8) = v2;
  return result;
}

ValueMetadata *type metadata accessor for Useragentpb_ClientID()
{
  return &type metadata for Useragentpb_ClientID;
}

unint64_t sub_1AF228D7C()
{
  unint64_t result;

  result = qword_1EEE33C88;
  if (!qword_1EEE33C88)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for Useragentpb_ClientID, &type metadata for Useragentpb_ClientID);
    atomic_store(result, (unint64_t *)&qword_1EEE33C88);
  }
  return result;
}

uint64_t sub_1AF228DB8(char a1)
{
  return qword_1AF243EF8[a1];
}

uint64_t sub_1AF228DCC()
{
  unsigned __int8 *v0;

  return sub_1AF228DD4(*v0);
}

uint64_t sub_1AF228DDC()
{
  return 0x6E6F697461727564;
}

uint64_t sub_1AF228DF8()
{
  return 1701869940;
}

BOOL sub_1AF228E08()
{
  char *v0;

  return sub_1AF228E10(*v0);
}

BOOL sub_1AF228E10(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  if (qword_1EEE33550 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = *(_QWORD *)(qword_1EEE33FF8 + 16);
    if (!v2)
      break;
    v3 = 0;
    while (1)
    {
      v4 = v3 + 1;
      if (__OFADD__(v3, 1))
        break;
      if (qword_1AF243EF8[*(char *)(qword_1EEE33FF8 + 32 + v3)] == qword_1AF243EF8[a1])
      {
        v5 = *(unsigned __int8 *)(qword_1EEE33FF8 + 32 + v3);
        return v5 == 41;
      }
      ++v3;
      if (v4 == v2)
        goto LABEL_7;
    }
    __break(1u);
LABEL_11:
    swift_once();
  }
LABEL_7:
  v5 = 41;
  return v5 == 41;
}

BOOL sub_1AF228EB8(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  if (qword_1EEE335D0 != -1)
    goto LABEL_11;
  while (1)
  {
    v2 = *(_QWORD *)(qword_1EEE34058 + 16);
    if (!v2)
      break;
    v3 = 0;
    while (1)
    {
      v4 = v3 + 1;
      if (__OFADD__(v3, 1))
        break;
      if (qword_1AF243EF8[*(char *)(qword_1EEE34058 + 32 + v3)] == qword_1AF243EF8[a1])
      {
        v5 = *(unsigned __int8 *)(qword_1EEE34058 + 32 + v3);
        return v5 == 41;
      }
      ++v3;
      if (v4 == v2)
        goto LABEL_7;
    }
    __break(1u);
LABEL_11:
    swift_once();
  }
LABEL_7:
  v5 = 41;
  return v5 == 41;
}

BOOL sub_1AF228F60()
{
  char *v0;

  return sub_1AF228EB8(*v0);
}

uint64_t *sub_1AF228F68()
{
  uint64_t v0;
  uint64_t *v1;

  if ((*(_BYTE *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 120)) & 1) == 0)
    sub_1AF2296D0();
  v1 = sub_1AF23E658();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_1AF228FD0()
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
  unint64_t v13;
  uint64_t v14;
  __n128 *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __n128 v23;
  uint64_t ObjectType;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  int v32;
  unint64_t v33;
  __n128 *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __n128 v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  __n128 *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __n128 v55;
  uint64_t v56;
  uint64_t v57;
  __n128 *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  __n128 v66;
  uint64_t v67;
  __n128 *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __n128 v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  __n128 *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  __n128 v90;
  __n128 v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  __n128 *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  __n128 v103;
  id v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v108;
  void (*v109)(uint64_t, uint64_t);
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(uint64_t, uint64_t, __n128);
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;

  v1 = v0;
  v2 = *(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 128));
  sub_1AF2414B0();
  v3 = sub_1AF2410F0();
  sub_1AF23E7B4(v3, v4, v5, v6);
  sub_1AF2414B0();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
  v8 = OUTLINED_FUNCTION_0_1();
  *(_OWORD *)(v8 + 16) = xmmword_1AF242860;
  v9 = *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 464) + 8);
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE339A0);
  v10 = OUTLINED_FUNCTION_15_1();
  v12 = v11;
  *(_QWORD *)(v8 + 56) = MEMORY[0x1E0DEA968];
  v13 = sub_1AF20BFF4();
  *(_QWORD *)(v8 + 64) = v13;
  *(_QWORD *)(v8 + 32) = v10;
  *(_QWORD *)(v8 + 40) = v12;
  v14 = v2;
  sub_1AF2410F0();
  swift_bridgeObjectRelease();
  sub_1AF2414B0();
  v15 = (__n128 *)OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_7(v15, v16, v17, v18, v19, v20, v21, v22, v108, v115, v120, v7, v23);
  ObjectType = swift_getObjectType();
  v109 = *(void (**)(uint64_t, uint64_t))(v9 + 16);
  v109(ObjectType, v9);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33828);
  v25 = OUTLINED_FUNCTION_14_1();
  v15[3].n128_u64[1] = MEMORY[0x1E0DEA968];
  v15[4].n128_u64[0] = v13;
  v15[2].n128_u64[0] = v25;
  v15[2].n128_u64[1] = v26;
  sub_1AF2410F0();
  OUTLINED_FUNCTION_96();
  v27 = sub_1AF2297F8();
  if ((v30 & 1) != 0)
  {
    sub_1AF2414B0();
    v82 = (__n128 *)OUTLINED_FUNCTION_0_1();
    v91 = OUTLINED_FUNCTION_4_7(v82, v83, v84, v85, v86, v87, v88, v89, (uint64_t)v109, v13, v14, v125, v90);
    v114(ObjectType, v9, v91);
    v92 = OUTLINED_FUNCTION_14_1();
    v93 = MEMORY[0x1E0DEA968];
    v81 = v119;
    v82[3].n128_u64[1] = MEMORY[0x1E0DEA968];
    v82[4].n128_u64[0] = v119;
    v82[2].n128_u64[0] = v92;
    v82[2].n128_u64[1] = v94;
    sub_1AF2410F0();
    v80 = v93;
  }
  else
  {
    v31 = v28;
    v32 = v29;
    v33 = HIDWORD(v29);
    v110 = v27;
    sub_1AF2414B0();
    v34 = (__n128 *)OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_4_7(v34, v35, v36, v37, v38, v39, v40, v41, v110, v13, v14, v125, v42);
    v43 = MEMORY[0x1E0DEB490];
    v44[7] = v45;
    v44[8] = v43;
    v44[4] = v31;
    sub_1AF2410F0();
    swift_bridgeObjectRelease();
    sub_1AF2414B0();
    v46 = (__n128 *)OUTLINED_FUNCTION_0_1();
    v47 = MEMORY[0x1E0DEE0F8];
    OUTLINED_FUNCTION_4_7(v46, v48, v49, v50, v51, v52, v53, v54, v111, v116, v121, v126, v55);
    v56 = MEMORY[0x1E0DEE168];
    *(_QWORD *)(v57 + 56) = v47;
    *(_QWORD *)(v57 + 64) = v56;
    *(_DWORD *)(v57 + 32) = v33;
    OUTLINED_FUNCTION_3_10();
    OUTLINED_FUNCTION_96();
    sub_1AF2414B0();
    v58 = (__n128 *)OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_4_7(v58, v59, v60, v61, v62, v63, v64, v65, v112, v117, v122, v127, v66);
    *(_QWORD *)(v67 + 56) = v47;
    *(_QWORD *)(v67 + 64) = v56;
    *(_DWORD *)(v67 + 32) = v32;
    OUTLINED_FUNCTION_3_10();
    OUTLINED_FUNCTION_96();
    sub_1AF2414B0();
    v68 = (__n128 *)OUTLINED_FUNCTION_0_1();
    OUTLINED_FUNCTION_4_7(v68, v69, v70, v71, v72, v73, v74, v75, v113, v118, v123, v128, v76);
    v77 = MEMORY[0x1E0DEB100];
    v78[7] = v79;
    v78[8] = v77;
    v78[4] = v114;
    sub_1AF2410F0();
    v80 = MEMORY[0x1E0DEA968];
    v81 = v119;
  }
  swift_bridgeObjectRelease();
  sub_1AF2414B0();
  v95 = (__n128 *)OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_4_7(v95, v96, v97, v98, v99, v100, v101, v102, (uint64_t)v114, v119, v124, v129, v103);
  v104 = *(id *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 472));
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33CA0);
  v105 = OUTLINED_FUNCTION_15_1();
  v95[3].n128_u64[1] = v80;
  v95[4].n128_u64[0] = v81;
  v95[2].n128_u64[0] = v105;
  v95[2].n128_u64[1] = v106;
  sub_1AF2410F0();
  swift_bridgeObjectRelease();
  sub_1AF2414B0();
  return sub_1AF2410F0();
}

uint64_t sub_1AF229428(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t inited;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA28);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AF2428C0;
  if (qword_1EEE33378 != -1)
    swift_once();
  v7 = *(void **)algn_1EEE33F88;
  *(_QWORD *)(inited + 32) = qword_1EEE33F80;
  *(_QWORD *)(inited + 40) = v7;
  v8 = OUTLINED_FUNCTION_9_3();
  swift_bridgeObjectRetain();
  *(_QWORD *)(inited + 48) = objc_msgSend(v8, sel_initWithInteger_, a1);
  if (qword_1EEE334D0 != -1)
    swift_once();
  v9 = *(_QWORD *)algn_1EEE33FB8;
  *(_QWORD *)(inited + 56) = qword_1EEE33FB0;
  *(_QWORD *)(inited + 64) = v9;
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_10_1();
  *(_QWORD *)(inited + 72) = objc_msgSend(v7, sel_initWithDouble_, a3);
  *(_QWORD *)(inited + 80) = 0xD000000000000010;
  *(_QWORD *)(inited + 88) = 0x80000001AF2476B0;
  *(_QWORD *)(inited + 96) = objc_msgSend(OUTLINED_FUNCTION_9_3(), sel_initWithUnsignedInt_, a2);
  if (qword_1EEE334B8 != -1)
    swift_once();
  v10 = *(_QWORD *)algn_1EEE33F98;
  *(_QWORD *)(inited + 104) = qword_1EEE33F90;
  *(_QWORD *)(inited + 112) = v10;
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_10_1();
  *(_QWORD *)(inited + 120) = objc_msgSend(v7, sel_initWithUnsignedInt_, HIDWORD(a2));
  sub_1AF229DF0();
  return sub_1AF241210();
}

uint64_t sub_1AF2295FC(uint64_t a1, unint64_t a2, double a3)
{
  int v3;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v6 = HIDWORD(a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1AF2428C0;
  v8 = MEMORY[0x1E0DEB490];
  *(_QWORD *)(v7 + 56) = MEMORY[0x1E0DEB418];
  *(_QWORD *)(v7 + 64) = v8;
  *(_QWORD *)(v7 + 32) = a1;
  v9 = MEMORY[0x1E0DEE0F8];
  v10 = MEMORY[0x1E0DEE168];
  *(_QWORD *)(v7 + 96) = MEMORY[0x1E0DEE0F8];
  *(_QWORD *)(v7 + 104) = v10;
  *(_DWORD *)(v7 + 72) = v3;
  *(_QWORD *)(v7 + 136) = v9;
  *(_QWORD *)(v7 + 144) = v10;
  v11 = MEMORY[0x1E0DEB070];
  *(_DWORD *)(v7 + 112) = v6;
  v12 = MEMORY[0x1E0DEB100];
  *(_QWORD *)(v7 + 176) = v11;
  *(_QWORD *)(v7 + 184) = v12;
  *(double *)(v7 + 152) = a3;
  sub_1AF23E5D0("statusCode=%{signpost.description:attribute,public}d, download=%{signpost.description:attribute}lu, upload=%{signpost.description:attribute}lu, runtime=%{signpost.description:attribute}f", 186, 2, v7);
  return swift_bridgeObjectRelease();
}

void sub_1AF2296D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((*(_BYTE *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 120)) & 1) == 0)
  {
    v2 = sub_1AF2297F8();
    if ((v5 & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
      v6 = OUTLINED_FUNCTION_0_1();
      *(_OWORD *)(v6 + 16) = xmmword_1AF242860;
      v7 = OUTLINED_FUNCTION_13_1();
      (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v7, v1);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33828);
      v8 = sub_1AF2412AC();
      v10 = v9;
      *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v6 + 64) = sub_1AF20BFF4();
      *(_QWORD *)(v6 + 32) = v8;
      *(_QWORD *)(v6 + 40) = v10;
      OUTLINED_FUNCTION_5_7((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s");
      swift_bridgeObjectRelease();
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, double))(*(_QWORD *)v0 + 568))(v3, v4, *(double *)&v2);
    }
    sub_1AF23E730();
  }
}

uint64_t sub_1AF2297C8()
{
  return sub_1AF23E748((void (*)(void))sub_1AF229DE4);
}

uint64_t sub_1AF2297F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
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
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
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
  double v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  double v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char v134;
  char v135;
  char v136;
  char v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  uint64_t v158;

  v1 = OUTLINED_FUNCTION_13_1();
  v2 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 16);
  v3 = v2(v1, v0);
  if (!v3)
    goto LABEL_7;
  v4 = (void *)v3;
  objc_opt_self();
  v5 = (void *)swift_dynamicCastObjCClass();
  if (!v5)
  {

LABEL_7:
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
    v28 = OUTLINED_FUNCTION_0_1();
    *(_OWORD *)(v28 + 16) = xmmword_1AF242860;
    v2(v1, v0);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33828);
    v29 = sub_1AF2412AC();
    v31 = v30;
    *(_QWORD *)(v28 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v28 + 64) = sub_1AF20BFF4();
    *(_QWORD *)(v28 + 32) = v29;
    *(_QWORD *)(v28 + 40) = v31;
    OUTLINED_FUNCTION_5_7((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s");
    swift_bridgeObjectRelease();
    sub_1AF23E730();
    *(double *)&result = 0.0;
    return result;
  }
  objc_msgSend(v5, sel_statusCode);
  if (!(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v0))
  {

    *(double *)&result = 0.0;
    return result;
  }
  *(_QWORD *)&v154 = 0xD000000000000021;
  *((_QWORD *)&v154 + 1) = 0x80000001AF247060;
  v6 = OUTLINED_FUNCTION_11_3();
  v14 = OUTLINED_FUNCTION_1_7(v6, v7, v8, v9, v10, v11, v12, v13, v113, v117, v123, v125, v130, v134, v138, v142, v146, v150, v154);
  v20 = OUTLINED_FUNCTION_6_4(v15, v16, v17, v18, v19, v14);
  if (v158)
    OUTLINED_FUNCTION_2_9();
  else
    OUTLINED_FUNCTION_7_6(v20, v21, v22, v23, v24, v25, v26, v27, v114, v118);
  *(_QWORD *)&v155 = 0xD00000000000001DLL;
  *((_QWORD *)&v155 + 1) = 0x80000001AF247040;
  v33 = OUTLINED_FUNCTION_11_3();
  v41 = OUTLINED_FUNCTION_1_7(v33, v34, v35, v36, v37, v38, v39, v40, v114, v118, v124, v126, v131, v135, v139, v143, v147, v151, v155);
  v47 = OUTLINED_FUNCTION_6_4(v42, v43, v44, v45, v46, v41);
  if (v158)
    OUTLINED_FUNCTION_2_9();
  else
    OUTLINED_FUNCTION_7_6(v47, v48, v49, v50, v51, v52, v53, v54, v115, v119);
  v55 = OUTLINED_FUNCTION_8_4();
  v63 = OUTLINED_FUNCTION_1_7(v55, v56, v57, v58, v59, v60, v61, v62, v115, 0xD00000000000001BLL, 0x80000001AF247100, v127, v132, v136, v140, v144, v148, v152, v156);
  v69 = OUTLINED_FUNCTION_6_4(v64, v65, v66, v67, v68, v63);
  if (v158)
  {
    if (OUTLINED_FUNCTION_2_9())
    {
      v129 = v120;
      goto LABEL_19;
    }
  }
  else
  {
    OUTLINED_FUNCTION_7_6(v69, v70, v71, v72, v73, v74, v75, v76, v116, v120);
  }
  v77 = OUTLINED_FUNCTION_8_4();
  v85 = OUTLINED_FUNCTION_1_7(v77, v78, v79, v80, v81, v82, v83, v84, v116, 0xD00000000000001BLL, 0x80000001AF246EC0, v128, v133, v137, v141, v145, v149, v153, v157);
  v91 = OUTLINED_FUNCTION_6_4(v86, v87, v88, v89, v90, v85);
  if (!v158)
  {
    OUTLINED_FUNCTION_7_6(v91, v92, v93, v94, v95, v96, v97, v98, v116, v121);
    goto LABEL_22;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_22:
    swift_bridgeObjectRelease();

    goto LABEL_23;
  }
LABEL_19:
  v99 = *(double *)&v129;
  v100 = OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_1_7(v100, v101, v102, v103, v104, v105, v106, v107, v116, 0xD00000000000001ALL, 0x80000001AF246F40, v129, v133, v137, v141, v145, v149, v153, v157);
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_6_4(v108, v109, v110, v111, v112);
  if ((OUTLINED_FUNCTION_2_9() & 1) != 0)
  {
    *(double *)&result = v122 - v99;
    return result;
  }
LABEL_23:
  *(double *)&result = 0.0;
  return result;
}

void sub_1AF229B80()
{
  void *v0;

  sub_1AF21F43C(v0);
}

uint64_t sub_1AF229B8C()
{
  return swift_initClassMetadata2();
}

id sub_1AF229BD8()
{
  void *v0;

  return objc_msgSend(v0, sel_response);
}

uint64_t sub_1AF229BFC()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_unknownObjectRelease();
}

uint64_t sub_1AF229C38()
{
  sub_1AF228F68();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NetworkSpan(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NetworkSpan);
}

uint64_t sub_1AF229C64(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32F808);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1AF229CA4(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 + 480)))
  {
    swift_unknownObjectRetain();
    if (nw_activity_is_activated())
    {
      nw_activity_complete_with_reason();
    }
    else
    {
      sub_1AF241498();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
      v3 = swift_allocObject();
      *(_OWORD *)(v3 + 16) = xmmword_1AF242860;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33CB0);
      v4 = sub_1AF2412AC();
      v6 = v5;
      *(_QWORD *)(v3 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v3 + 64) = sub_1AF20BFF4();
      *(_QWORD *)(v3 + 32) = v4;
      *(_QWORD *)(v3 + 40) = v6;
      sub_1AF2410F0();
      swift_bridgeObjectRelease();
    }
    a1 = swift_unknownObjectRelease();
  }
  return a2(a1);
}

uint64_t sub_1AF229DE4()
{
  uint64_t v0;

  return sub_1AF229CA4(*(_QWORD *)(v0 + 16), *(uint64_t (**)(uint64_t))(v0 + 24));
}

unint64_t sub_1AF229DF0()
{
  unint64_t result;

  result = qword_1ED32ECD0;
  if (!qword_1ED32ECD0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED32ECD0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return sub_1AF2412AC();
}

uint64_t FeedbackStreamDescriptor.tableName.getter()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  if (!*v0)
    return OUTLINED_FUNCTION_6_5();
  FeedbackStreamDescriptor.rawValue.getter();
  sub_1AF208AB8();
  v1 = sub_1AF241594();
  result = OUTLINED_FUNCTION_72();
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    v4 = *(_QWORD *)(v1 + 16 * v3 + 16);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_27();
    sub_1AF24133C();
    return v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t FeedbackStreamDescriptor.messageSchemaName.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000028;
  else
    return 0xD000000000000026;
}

uint64_t FeedbackStreamDescriptor.streamSegmentSize.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x200000;
  else
    return 0x20000;
}

PegasusConfiguration::FeedbackStreamDescriptor_optional __swiftcall FeedbackStreamDescriptor.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  PegasusConfiguration::FeedbackStreamDescriptor_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1AF241768();
  result.value = OUTLINED_FUNCTION_27();
  v5 = 17;
  if (v3 < 0x11)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_1AF229FC4()
{
  unsigned __int8 *v0;

  sub_1AF231B5C(*v0);
}

uint64_t sub_1AF229FCC(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_1AF231CB4(a1, *v1);
}

PegasusConfiguration::FeedbackStreamDescriptor_optional sub_1AF229FD4(Swift::String *a1)
{
  return FeedbackStreamDescriptor.init(rawValue:)(*a1);
}

uint64_t sub_1AF229FE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = FeedbackStreamDescriptor.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_1AF22A004(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E5F3B360;
}

unint64_t FeedbackStreamDescriptor.feedbackAppGroup.getter()
{
  return 0xD000000000000024;
}

PegasusConfiguration::FeedbackStreamDescriptor_optional __swiftcall FeedbackStreamDescriptor.init(tableName:)(Swift::String tableName)
{
  char *v1;
  void *object;
  uint64_t countAndFlagsBits;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  PegasusConfiguration::FeedbackStreamDescriptor_optional result;
  char v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  void *v16;
  Swift::String v17;

  object = tableName._object;
  countAndFlagsBits = tableName._countAndFlagsBits;
  v4 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33398);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_57();
  v8 = v7 - v6;
  v9 = countAndFlagsBits == 0x5F6E6F6973736573 && object == (void *)0xEB00000000736673;
  if (v9 || (OUTLINED_FUNCTION_6_5(), (sub_1AF241744() & 1) != 0))
  {
    result.value = OUTLINED_FUNCTION_72();
    v11 = 0;
  }
  else
  {
    v12 = sub_1AF240FAC();
    __swift_storeEnumTagSinglePayload(v8, 1, 1, v12);
    sub_1AF208AB8();
    sub_1AF2415B8();
    v14 = v13;
    sub_1AF209738(v8, &qword_1EEE33398);
    swift_bridgeObjectRelease();
    if ((v14 & 1) != 0)
    {
      result.value = OUTLINED_FUNCTION_72();
    }
    else
    {
      sub_1AF2412E8();
      OUTLINED_FUNCTION_1_8();
      v17._countAndFlagsBits = v15;
      v17._object = v16;
      sub_1AF24133C();
      OUTLINED_FUNCTION_72();
      result.value = FeedbackStreamDescriptor.init(rawValue:)(v17).value;
      v11 = v17._countAndFlagsBits;
      if (LOBYTE(v17._countAndFlagsBits) != 17)
        goto LABEL_12;
    }
    v11 = 17;
  }
LABEL_12:
  *v4 = v11;
  return result;
}

uint64_t FeedbackStreamDescriptor.storeFolderName.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6B63616264656566;
  else
    return 0;
}

uint64_t FeedbackStreamDescriptor.ttlInDays.getter()
{
  return 7;
}

uint64_t FeedbackStreamDescriptor.streamTTLDate.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t result;

  v0 = sub_1AF240F04();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_57();
  v4 = v3 - v2;
  sub_1AF240EEC();
  sub_1AF240EC8();
  v6 = v5;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  if ((~*(_QWORD *)&v6 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v6 <= -9.22337204e18)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (v6 >= 9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if ((unsigned __int128)(((uint64_t)v6 / 86400 - 7) * (__int128)86400) >> 64 == (86400 * ((uint64_t)v6 / 86400 - 7)) >> 63)
    return sub_1AF240EBC();
LABEL_9:
  __break(1u);
  return result;
}

uint64_t FeedbackStreamDescriptor.caName.getter()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v3;

  LOBYTE(v3) = *v0;
  FeedbackStreamDescriptor.rawValue.getter();
  OUTLINED_FUNCTION_1_8();
  sub_1AF22A3C8();
  sub_1AF241480();
  OUTLINED_FUNCTION_27();
  v1 = MEMORY[0x1AF459D9C](v3);
  OUTLINED_FUNCTION_27();
  return v1;
}

uint64_t FeedbackStreamDescriptor.caIndex.getter()
{
  char *v0;

  return qword_1AF2442B0[*v0];
}

unint64_t sub_1AF22A3C8()
{
  unint64_t result;

  result = qword_1EEE33CB8;
  if (!qword_1EEE33CB8)
  {
    result = MEMORY[0x1AF45A834](MEMORY[0x1E0DEA9A8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EEE33CB8);
  }
  return result;
}

unint64_t sub_1AF22A408()
{
  unint64_t result;

  result = qword_1ED32EC68;
  if (!qword_1ED32EC68)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for FeedbackStreamDescriptor, &type metadata for FeedbackStreamDescriptor);
    atomic_store(result, (unint64_t *)&qword_1ED32EC68);
  }
  return result;
}

unint64_t sub_1AF22A448()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEE33CC0;
  if (!qword_1EEE33CC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EEE33CC8);
    result = MEMORY[0x1AF45A834](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EEE33CC0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for FeedbackStreamDescriptor(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF0)
  {
    if (a2 + 16 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 16) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 17;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x11;
  v5 = v6 - 17;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for FeedbackStreamDescriptor(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 16 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 16) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF0)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEF)
    return ((uint64_t (*)(void))((char *)&loc_1AF22A560 + 4 * byte_1AF244106[v4]))();
  *a1 = a2 + 16;
  return ((uint64_t (*)(void))((char *)sub_1AF22A594 + 4 * byte_1AF244101[v4]))();
}

uint64_t sub_1AF22A594(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF22A59C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF22A5A4);
  return result;
}

uint64_t sub_1AF22A5B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF22A5B8);
  *(_BYTE *)result = a2 + 16;
  return result;
}

uint64_t sub_1AF22A5BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF22A5C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for FeedbackStreamError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for FeedbackStreamError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for FeedbackStreamError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for FeedbackStreamError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for FeedbackStreamError(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for FeedbackStreamError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_1AF22A718(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1AF22A730(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for FeedbackStreamError()
{
  return &type metadata for FeedbackStreamError;
}

_QWORD *sub_1AF22A764(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;

  v2[3] = 0;
  swift_unknownObjectWeakInit();
  type metadata accessor for Locker();
  v4 = swift_allocObject();
  v5 = (_DWORD *)swift_slowAlloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = 0;
  v6 = MEMORY[0x1E0DEE9E0];
  v2[4] = v4;
  v2[5] = v6;
  v2[3] = a2;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v2;
}

uint64_t sub_1AF22A7FC()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v14;

  v1 = v0;
  v14 = MEMORY[0x1E0DEE9D8];
  v2 = *(os_unfair_lock_s **)(*(_QWORD *)(v0 + 32) + 16);
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  v3 = swift_bridgeObjectRetain();
  sub_1AF22AAA8(v3, (void (*)(uint64_t, uint64_t, uint64_t))sub_1AF22AD2C);
  OUTLINED_FUNCTION_95();
  os_unfair_lock_unlock(v2);
  if (MEMORY[0x1AF45A960](v1 + 16))
  {
    v4 = *(_QWORD *)(v1 + 24);
    ObjectType = swift_getObjectType();
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24);
    v7 = swift_bridgeObjectRetain();
    v6(v7, ObjectType, v4);
    OUTLINED_FUNCTION_55();
    OUTLINED_FUNCTION_88();
  }
  v8 = *(_QWORD *)(v14 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    v9 = (uint64_t *)(v14 + 40);
    do
    {
      v10 = *v9;
      v11 = swift_getObjectType();
      v12 = *(void (**)(uint64_t, uint64_t))(v10 + 72);
      swift_unknownObjectRetain();
      v12(v11, v10);
      OUTLINED_FUNCTION_88();
      v9 += 2;
      --v8;
    }
    while (v8);
    OUTLINED_FUNCTION_95();
  }
  OUTLINED_FUNCTION_95();
  sub_1AF205B50(v1 + 16);
  swift_release();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1AF22A95C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v16;
  uint64_t v17;

  v8 = MEMORY[0x1AF45A960](a3 + 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)(a3 + 24);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v10 + 64))(ObjectType, v10);
    swift_unknownObjectRetain();
    sub_1AF22AC80((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1AF2357C8);
    v12 = *(_QWORD *)(*a4 + 16);
    sub_1AF22ACEC(v12, (uint64_t (*)(BOOL))sub_1AF2357C8);
    v13 = *a4;
    *(_QWORD *)(v13 + 16) = v12 + 1;
    v14 = v13 + 16 * v12;
    *(_QWORD *)(v14 + 32) = v9;
    *(_QWORD *)(v14 + 40) = v10;
    return swift_unknownObjectRelease();
  }
  else
  {
    sub_1AF22AD34();
    v16 = (void *)sub_1AF24151C();
    sub_1AF2414B0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_1AF242860;
    *(_QWORD *)(v17 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v17 + 64) = sub_1AF20BFF4();
    *(_QWORD *)(v17 + 32) = a1;
    *(_QWORD *)(v17 + 40) = a2;
    swift_bridgeObjectRetain();
    sub_1AF2410F0();

    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1AF22AAA8(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];

  sub_1AF21E75C(v19);
  v3 = v19[0];
  v4 = v19[1];
  v5 = v19[3];
  v6 = v19[4];
  v7 = (unint64_t)(v19[2] + 64) >> 6;
  result = swift_bridgeObjectRetain();
  if (!v6)
    goto LABEL_3;
LABEL_2:
  v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v10 = v9 | (v5 << 6);
  while (1)
  {
    v15 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v16 = *v15;
    v17 = v15[1];
    v18 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    swift_retain();
    a2(v16, v17, v18);
    swift_release();
    result = swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_2;
LABEL_3:
    v11 = v5 + 1;
    if (__OFADD__(v5, 1))
      break;
    if (v11 >= v7)
      return swift_release();
    v12 = *(_QWORD *)(v4 + 8 * v11);
    v13 = v5 + 1;
    if (!v12)
    {
      v13 = v5 + 2;
      if (v5 + 2 >= v7)
        return swift_release();
      v12 = *(_QWORD *)(v4 + 8 * v13);
      if (!v12)
      {
        v13 = v5 + 3;
        if (v5 + 3 >= v7)
          return swift_release();
        v12 = *(_QWORD *)(v4 + 8 * v13);
        if (!v12)
        {
          v13 = v5 + 4;
          if (v5 + 4 >= v7)
            return swift_release();
          v12 = *(_QWORD *)(v4 + 8 * v13);
          if (!v12)
          {
            v13 = v5 + 5;
            if (v5 + 5 >= v7)
              return swift_release();
            v12 = *(_QWORD *)(v4 + 8 * v13);
            if (!v12)
            {
              v14 = v5 + 6;
              while (v14 < v7)
              {
                v12 = *(_QWORD *)(v4 + 8 * v14++);
                if (v12)
                {
                  v13 = v14 - 1;
                  goto LABEL_18;
                }
              }
              return swift_release();
            }
          }
        }
      }
    }
LABEL_18:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v5 = v13;
  }
  __break(1u);
  return result;
}

uint64_t sub_1AF22AC28()
{
  sub_1AF22A7FC();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ActivityMonitor()
{
  return objc_opt_self();
}

uint64_t sub_1AF22AC68()
{
  return sub_1AF22AC80((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1AF235570);
}

uint64_t sub_1AF22AC74()
{
  return sub_1AF22AC80((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1AF235670);
}

uint64_t sub_1AF22AC80(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_native();
  *v1 = v3;
  if (!(_DWORD)result)
  {
    result = a1(result, *(_QWORD *)(v3 + 16) + 1, 1, v3);
    *v1 = result;
  }
  return result;
}

uint64_t sub_1AF22ACD4(uint64_t a1)
{
  return sub_1AF22ACEC(a1, (uint64_t (*)(BOOL))sub_1AF235570);
}

uint64_t sub_1AF22ACE0(uint64_t a1)
{
  return sub_1AF22ACEC(a1, (uint64_t (*)(BOOL))sub_1AF235670);
}

uint64_t sub_1AF22ACEC(uint64_t result, uint64_t (*a2)(BOOL))
{
  uint64_t v2;
  unint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)v2 + 24);
  if (result + 1 > (uint64_t)(v3 >> 1))
  {
    result = a2(v3 > 1);
    *(_QWORD *)v2 = result;
  }
  return result;
}

uint64_t sub_1AF22AD2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1AF22A95C(a1, a2, a3, *(uint64_t **)(v3 + 16));
}

unint64_t sub_1AF22AD34()
{
  unint64_t result;

  result = qword_1ED32E9B8;
  if (!qword_1ED32E9B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED32E9B8);
  }
  return result;
}

uint64_t sub_1AF22AD70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  os_unfair_lock_s *v11;

  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 56))(a3, a4);
  v10 = v9;
  v11 = *(os_unfair_lock_s **)(*(_QWORD *)(a2 + 32) + 16);
  os_unfair_lock_lock(v11);
  sub_1AF20CE14(a2, v8, v10, a1, a4);
  os_unfair_lock_unlock(v11);
  OUTLINED_FUNCTION_55();
  swift_unknownObjectRetain();
  sub_1AF22AE1C(a2, a1, a3, a4);
  return swift_unknownObjectRelease();
}

uint64_t sub_1AF22AE1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t ObjectType;

  result = MEMORY[0x1AF45A960](a1 + 16);
  if (result)
  {
    v8 = *(_QWORD *)(a1 + 24);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16))(a2, a4, ObjectType, v8);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_1AF22AE8C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA00);
    v2 = (_QWORD *)sub_1AF2416CC();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  v6 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v7 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        v8 = v7 | (v6 << 6);
      }
      else
      {
        v9 = v6 + 1;
        if (__OFADD__(v6, 1))
          goto LABEL_34;
        if (v9 >= v27)
        {
LABEL_31:
          sub_1AF219FE0();
          return;
        }
        v10 = *(_QWORD *)(v28 + 8 * v9);
        v11 = v6 + 1;
        if (!v10)
        {
          v11 = v6 + 2;
          if (v6 + 2 >= v27)
            goto LABEL_31;
          v10 = *(_QWORD *)(v28 + 8 * v11);
          if (!v10)
          {
            v11 = v6 + 3;
            if (v6 + 3 >= v27)
              goto LABEL_31;
            v10 = *(_QWORD *)(v28 + 8 * v11);
            if (!v10)
            {
              v11 = v6 + 4;
              if (v6 + 4 >= v27)
                goto LABEL_31;
              v10 = *(_QWORD *)(v28 + 8 * v11);
              if (!v10)
              {
                v12 = v6 + 5;
                if (v6 + 5 >= v27)
                  goto LABEL_31;
                v10 = *(_QWORD *)(v28 + 8 * v12);
                if (!v10)
                {
                  while (1)
                  {
                    v11 = v12 + 1;
                    if (__OFADD__(v12, 1))
                      goto LABEL_35;
                    if (v11 >= v27)
                      goto LABEL_31;
                    v10 = *(_QWORD *)(v28 + 8 * v11);
                    ++v12;
                    if (v10)
                      goto LABEL_25;
                  }
                }
                v11 = v6 + 5;
              }
            }
          }
        }
LABEL_25:
        v5 = (v10 - 1) & v10;
        v8 = __clz(__rbit64(v10)) + (v11 << 6);
        v6 = v11;
      }
      v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v8);
      v15 = *v13;
      v14 = v13[1];
      v16 = *(void **)(*(_QWORD *)(a1 + 56) + 8 * v8);
      swift_bridgeObjectRetain();
      v17 = v16;
      v18 = sub_1AF20D23C(v15, v14);
      v19 = v18;
      if ((v20 & 1) == 0)
        break;
      v21 = (uint64_t *)(v2[6] + 16 * v18);
      swift_bridgeObjectRelease();
      *v21 = v15;
      v21[1] = v14;
      v22 = v2[7];

      *(_QWORD *)(v22 + 8 * v19) = v17;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v18;
    v23 = (uint64_t *)(v2[6] + 16 * v18);
    *v23 = v15;
    v23[1] = v14;
    *(_QWORD *)(v2[7] + 8 * v18) = v17;
    v24 = v2[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_33;
    v2[2] = v26;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
}

void sub_1AF22B120(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  _OWORD v40[2];
  _OWORD v41[3];
  _OWORD v42[2];
  __int128 v43;
  _OWORD v44[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA08);
    v2 = sub_1AF2416CC();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v32 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v31 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_141();
  v7 = 0;
  if (!v5)
    goto LABEL_9;
LABEL_8:
  v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  v9 = v8 | (v7 << 6);
  while (1)
  {
    v18 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v9);
    v20 = *v18;
    v19 = v18[1];
    sub_1AF208D14(*(_QWORD *)(a1 + 56) + 32 * v9, (uint64_t)v44);
    *(_QWORD *)&v43 = v20;
    *((_QWORD *)&v43 + 1) = v19;
    v41[2] = v43;
    v42[0] = v44[0];
    v42[1] = v44[1];
    *(_QWORD *)&v41[0] = v20;
    *((_QWORD *)&v41[0] + 1) = v19;
    OUTLINED_FUNCTION_1_0();
    swift_dynamicCast();
    sub_1AF219FD0(v42, v36);
    v37 = v33;
    v38 = v34;
    v39 = v35;
    sub_1AF219FD0(v36, v40);
    v33 = v37;
    v34 = v38;
    v35 = v39;
    sub_1AF219FD0(v40, v41);
    sub_1AF219FD0(v41, &v37);
    v21 = sub_1AF2415DC();
    v22 = -1 << *(_BYTE *)(v2 + 32);
    v23 = v21 & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v6 + 8 * (v23 >> 6))) == 0)
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        v28 = v24 == v27;
        if (v24 == v27)
          v24 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v6 + 8 * v24);
        if (v29 != -1)
        {
          v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_38;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v6 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_38:
    *(_QWORD *)(v6 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    v30 = *(_QWORD *)(v2 + 48) + 40 * v25;
    *(_OWORD *)v30 = v33;
    *(_OWORD *)(v30 + 16) = v34;
    *(_QWORD *)(v30 + 32) = v35;
    sub_1AF219FD0(&v37, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v25));
    ++*(_QWORD *)(v2 + 16);
    if (v5)
      goto LABEL_8;
LABEL_9:
    v10 = v7 + 1;
    if (__OFADD__(v7, 1))
      goto LABEL_42;
    if (v10 >= v31)
      goto LABEL_40;
    v11 = *(_QWORD *)(v32 + 8 * v10);
    v12 = v7 + 1;
    if (!v11)
    {
      OUTLINED_FUNCTION_27_1();
      if (v13 == v14)
        goto LABEL_40;
      OUTLINED_FUNCTION_26_2();
      if (!v11)
      {
        OUTLINED_FUNCTION_27_1();
        if (v13 == v14)
          goto LABEL_40;
        OUTLINED_FUNCTION_26_2();
        if (!v11)
        {
          OUTLINED_FUNCTION_27_1();
          if (v13 == v14)
            goto LABEL_40;
          OUTLINED_FUNCTION_26_2();
          if (!v11)
            break;
        }
      }
    }
LABEL_28:
    v5 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
    v7 = v12;
  }
  v16 = v15 + 4;
  if (v16 >= v31)
  {
LABEL_40:
    OUTLINED_FUNCTION_85();
    sub_1AF219FE0();
    return;
  }
  v11 = *(_QWORD *)(v32 + 8 * v16);
  if (v11)
  {
    v12 = v16;
    goto LABEL_28;
  }
  while (!__OFADD__(v16, 1))
  {
    OUTLINED_FUNCTION_27_1();
    if (v13 == v14)
      goto LABEL_40;
    OUTLINED_FUNCTION_26_2();
    v16 = v17 + 1;
    if (v11)
      goto LABEL_28;
  }
LABEL_43:
  __break(1u);
}

void sub_1AF22B4B4()
{
  _BYTE *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if ((v0[81] & 1) == 0)
  {
    v2 = v0;
    v3 = sub_1AF22B694();
    v6 = MEMORY[0x1E0DEA968];
    if ((v7 & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
      v8 = OUTLINED_FUNCTION_0_1();
      *(_OWORD *)(v8 + 16) = xmmword_1AF242860;
      v9 = OUTLINED_FUNCTION_13_1();
      (*(void (**)(uint64_t, uint64_t))(v1 + 16))(v9, v1);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33828);
      v10 = OUTLINED_FUNCTION_24_2();
      v12 = v11;
      *(_QWORD *)(v8 + 56) = v6;
      *(_QWORD *)(v8 + 64) = sub_1AF20BFF4();
      *(_QWORD *)(v8 + 32) = v10;
      *(_QWORD *)(v8 + 40) = v12;
      OUTLINED_FUNCTION_7_7((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s");
      OUTLINED_FUNCTION_72();
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, double))(*(_QWORD *)v0 + 568))(v4, v5, *(double *)&v3);
    }
    OUTLINED_FUNCTION_6_6();
    OUTLINED_FUNCTION_141();
    OUTLINED_FUNCTION_31_0();
    if ((v2[81] & 1) == 0)
    {
      if (*(_QWORD *)&v2[*(_QWORD *)(*(_QWORD *)v2 + 480)])
      {
        OUTLINED_FUNCTION_14_2();
        if (nw_activity_is_activated())
        {
          OUTLINED_FUNCTION_15_2();
          nw_activity_complete_with_reason();
        }
        else
        {
          sub_1AF241498();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
          v13 = OUTLINED_FUNCTION_0_1();
          *(_OWORD *)(v13 + 16) = xmmword_1AF242860;
          OUTLINED_FUNCTION_14_2();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33CB0);
          v14 = OUTLINED_FUNCTION_24_2();
          v16 = v15;
          *(_QWORD *)(v13 + 56) = v6;
          *(_QWORD *)(v13 + 64) = sub_1AF20BFF4();
          *(_QWORD *)(v13 + 32) = v14;
          *(_QWORD *)(v13 + 40) = v16;
          sub_1AF2410F0();
          swift_bridgeObjectRelease();
        }
        swift_unknownObjectRelease();
      }
      sub_1AF2326E0();
    }
    OUTLINED_FUNCTION_29_0();
    swift_release();
    OUTLINED_FUNCTION_85();
  }
}

uint64_t sub_1AF22B694()
{
  _BYTE *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
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
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
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
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  double v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  double v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  double v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  char v159;
  char v160;
  char v161;
  char v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  uint64_t v183;

  v2 = v0;
  v3 = OUTLINED_FUNCTION_13_1();
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  v5 = v4(v3, v1);
  if (v5)
  {
    v6 = (void *)v5;
    objc_opt_self();
    v7 = (void *)swift_dynamicCastObjCClass();
    if (v7)
    {
      objc_msgSend(v7, sel_statusCode);
      if (!(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v3, v1))
      {

        *(double *)&result = 0.0;
        return result;
      }
      *(_QWORD *)&v179 = 0xD000000000000021;
      *((_QWORD *)&v179 + 1) = 0x80000001AF247060;
      v8 = OUTLINED_FUNCTION_28_1();
      v16 = OUTLINED_FUNCTION_2_10(v8, v9, v10, v11, v12, v13, v14, v15, v130, v134, v138, v142, v148, v150, v155, v159, v163, v167, v171,
              v175,
              v179);
      v24 = OUTLINED_FUNCTION_9_4(v17, v18, v19, v20, v21, v22, v23, v16);
      if (v183)
        OUTLINED_FUNCTION_1_9();
      else
        OUTLINED_FUNCTION_10_2(v24, v25, v26, v27, v28, v29, v30, v31, v131, v135, v139, v143);
      *(_QWORD *)&v180 = 0xD00000000000001DLL;
      *((_QWORD *)&v180 + 1) = 0x80000001AF247040;
      v39 = OUTLINED_FUNCTION_28_1();
      v47 = OUTLINED_FUNCTION_2_10(v39, v40, v41, v42, v43, v44, v45, v46, v131, v135, v139, v143, v149, v151, v156, v160, v164, v168, v172,
              v176,
              v180);
      v55 = OUTLINED_FUNCTION_9_4(v48, v49, v50, v51, v52, v53, v54, v47);
      if (v183)
        OUTLINED_FUNCTION_1_9();
      else
        OUTLINED_FUNCTION_10_2(v55, v56, v57, v58, v59, v60, v61, v62, v132, v136, v140, v144);
      v66 = OUTLINED_FUNCTION_11_4();
      v74 = OUTLINED_FUNCTION_2_10(v66, v67, v68, v69, v70, v71, v72, v73, v132, v136, v140, 0xD00000000000001BLL, 0x80000001AF247100, v152, v157, v161, v165, v169, v173,
              v177,
              v181);
      v82 = OUTLINED_FUNCTION_9_4(v75, v76, v77, v78, v79, v80, v81, v74);
      if (v183)
      {
        if ((OUTLINED_FUNCTION_1_9() & 1) != 0)
        {
          v154 = v145;
          goto LABEL_26;
        }
      }
      else
      {
        OUTLINED_FUNCTION_10_2(v82, v83, v84, v85, v86, v87, v88, v89, v133, v137, v141, v145);
      }
      v90 = OUTLINED_FUNCTION_11_4();
      v98 = OUTLINED_FUNCTION_2_10(v90, v91, v92, v93, v94, v95, v96, v97, v133, v137, v141, 0xD00000000000001BLL, 0x80000001AF246EC0, v153, v158, v162, v166, v170, v174,
              v178,
              v182);
      v106 = OUTLINED_FUNCTION_9_4(v99, v100, v101, v102, v103, v104, v105, v98);
      if (v183)
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
LABEL_26:
          v114 = *(double *)&v154;
          v115 = OUTLINED_FUNCTION_11_4();
          OUTLINED_FUNCTION_2_10(v115, v116, v117, v118, v119, v120, v121, v122, v133, v137, v141, 0xD00000000000001ALL, 0x80000001AF246F40, v154, v158, v162, v166, v170, v174,
            v178,
            v182);
          OUTLINED_FUNCTION_40();

          OUTLINED_FUNCTION_9_4(v123, v124, v125, v126, v127, v128, v129);
          if ((OUTLINED_FUNCTION_1_9() & 1) != 0)
          {
            *(double *)&result = v147 - v114;
            return result;
          }
          goto LABEL_30;
        }
      }
      else
      {
        OUTLINED_FUNCTION_10_2(v106, v107, v108, v109, v110, v111, v112, v113, v133, v137, v141, v146);
      }
      OUTLINED_FUNCTION_40();

LABEL_30:
      *(double *)&result = 0.0;
      return result;
    }

  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
  v32 = OUTLINED_FUNCTION_0_1();
  *(_OWORD *)(v32 + 16) = xmmword_1AF242860;
  v4(v3, v1);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33828);
  v33 = OUTLINED_FUNCTION_25_1();
  v35 = v34;
  v36 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v32 + 56) = MEMORY[0x1E0DEA968];
  v37 = sub_1AF20BFF4();
  *(_QWORD *)(v32 + 64) = v37;
  *(_QWORD *)(v32 + 32) = v33;
  *(_QWORD *)(v32 + 40) = v35;
  OUTLINED_FUNCTION_7_7((uint64_t)"UNIDENTIFIED_RESPONSE_TYPE=%{signpost.description:attribute,public}s");
  OUTLINED_FUNCTION_72();
  OUTLINED_FUNCTION_6_6();
  OUTLINED_FUNCTION_141();
  OUTLINED_FUNCTION_31_0();
  if ((v2[81] & 1) == 0)
  {
    if (*(_QWORD *)&v2[*(_QWORD *)(*(_QWORD *)v2 + 480)])
    {
      OUTLINED_FUNCTION_14_2();
      if (nw_activity_is_activated())
      {
        OUTLINED_FUNCTION_15_2();
        nw_activity_complete_with_reason();
      }
      else
      {
        sub_1AF241498();
        v63 = OUTLINED_FUNCTION_0_1();
        *(_OWORD *)(v63 + 16) = xmmword_1AF242860;
        OUTLINED_FUNCTION_14_2();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33CB0);
        v64 = OUTLINED_FUNCTION_25_1();
        *(_QWORD *)(v63 + 56) = v36;
        *(_QWORD *)(v63 + 64) = v37;
        *(_QWORD *)(v63 + 32) = v64;
        *(_QWORD *)(v63 + 40) = v65;
        sub_1AF2410F0();
        OUTLINED_FUNCTION_96();
      }
      swift_unknownObjectRelease();
    }
    sub_1AF2326E0();
  }
  OUTLINED_FUNCTION_29_0();
  swift_release();
  OUTLINED_FUNCTION_85();
  *(double *)&result = 0.0;
  return result;
}

void sub_1AF22BAE4()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
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
  char v25;
  unint64_t v26;
  char v27;

  v1 = *(os_unfair_lock_s **)(*(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 152)) + 16);
  OUTLINED_FUNCTION_141();
  os_unfair_lock_lock(v1);
  v27 = *(_BYTE *)(v0 + 41);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v5 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v1);
  OUTLINED_FUNCTION_85();
  sub_1AF2414B0();
  sub_1AF2410F0();
  sub_1AF2414B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1AF242880;
  sub_1AF20D8DC(*(_BYTE *)(v0 + 80));
  v7 = sub_1AF241648();
  v9 = v8;
  v10 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
  v11 = sub_1AF20BFF4();
  *(_QWORD *)(v6 + 64) = v11;
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v9;
  if (qword_1ED32E4F8 != -1)
    swift_once();
  v13 = qword_1ED330188;
  v12 = unk_1ED330190;
  *(_QWORD *)(v6 + 96) = v10;
  *(_QWORD *)(v6 + 104) = v11;
  *(_QWORD *)(v6 + 72) = v13;
  *(_QWORD *)(v6 + 80) = v12;
  *(_QWORD *)(v6 + 136) = v10;
  *(_QWORD *)(v6 + 144) = v11;
  v26 = v11;
  *(_QWORD *)(v6 + 112) = 0xD000000000000010;
  *(_QWORD *)(v6 + 120) = 0x80000001AF246690;
  swift_bridgeObjectRetain();
  sub_1AF2410F0();
  swift_bridgeObjectRelease();
  if ((v27 & 1) == 0)
  {
    sub_1AF2414B0();
    v14 = OUTLINED_FUNCTION_0_1();
    *(_OWORD *)(v14 + 16) = xmmword_1AF242860;
    v15 = sub_1AF241648();
    *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v14 + 64) = v11;
    *(_QWORD *)(v14 + 32) = v15;
    *(_QWORD *)(v14 + 40) = v16;
    OUTLINED_FUNCTION_3_11();
    OUTLINED_FUNCTION_96();
    if (v5)
    {
      OUTLINED_FUNCTION_1_0();
      sub_1AF2414B0();
      v17 = OUTLINED_FUNCTION_0_1();
      *(_OWORD *)(v17 + 16) = xmmword_1AF242860;
      *(_QWORD *)(v17 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33CF8);
      *(_QWORD *)(v17 + 64) = sub_1AF22D2DC(&qword_1EEE33D00, &qword_1EEE33CF8, MEMORY[0x1E0CB1B18]);
      *(_QWORD *)(v17 + 32) = v5;
      OUTLINED_FUNCTION_3_11();
      OUTLINED_FUNCTION_96();
    }
  }
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_1AF2414B0();
    v18 = OUTLINED_FUNCTION_0_1();
    *(_OWORD *)(v18 + 16) = xmmword_1AF242860;
    *(_QWORD *)(v18 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33CE8);
    *(_QWORD *)(v18 + 64) = sub_1AF22D2DC(&qword_1EEE33CF0, &qword_1EEE33CE8, MEMORY[0x1E0CB1828]);
    *(_QWORD *)(v18 + 32) = v2;
    OUTLINED_FUNCTION_3_11();
    OUTLINED_FUNCTION_96();
  }
  if (v4 >> 62)
  {
    OUTLINED_FUNCTION_163();
    v19 = sub_1AF2416B4();
  }
  else
  {
    v19 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_163();
  }
  if (v19)
  {
    if (v19 < 1)
    {
      __break(1u);
      return;
    }
    v20 = 0;
    v21 = MEMORY[0x1E0DEA968];
    do
    {
      ++v20;
      swift_unknownObjectRetain();
      sub_1AF2414B0();
      v22 = OUTLINED_FUNCTION_0_1();
      *(_OWORD *)(v22 + 16) = xmmword_1AF242860;
      swift_unknownObjectRetain();
      v23 = sub_1AF2412AC();
      *(_QWORD *)(v22 + 56) = v21;
      *(_QWORD *)(v22 + 64) = v26;
      *(_QWORD *)(v22 + 32) = v23;
      *(_QWORD *)(v22 + 40) = v24;
      sub_1AF2410F0();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
    }
    while (v19 != v20);
  }
  OUTLINED_FUNCTION_95();
  sub_1AF2414B0();
  OUTLINED_FUNCTION_19_2();
  sub_1AF2320A8();
  if ((v25 & 1) != 0)
  {
    sub_1AF2414BC();
    OUTLINED_FUNCTION_19_2();
  }
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_95();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_9();
}

uint64_t sub_1AF22BFA0()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  char v28;

  v1 = *(os_unfair_lock_s **)(*(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v1);
  v28 = *(_BYTE *)(v0 + 41);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = *(_QWORD *)(v0 + 64);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  v5 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v1);
  swift_release();
  sub_1AF2414B0();
  sub_1AF2410F0();
  sub_1AF2414B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1AF242880;
  sub_1AF20D8DC(*(_BYTE *)(v0 + 80));
  v7 = sub_1AF241648();
  v9 = v8;
  v10 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
  v11 = sub_1AF20BFF4();
  *(_QWORD *)(v6 + 64) = v11;
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v9;
  if (qword_1ED32E448 != -1)
    swift_once();
  v13 = qword_1ED330178;
  v12 = unk_1ED330180;
  *(_QWORD *)(v6 + 96) = v10;
  *(_QWORD *)(v6 + 104) = v11;
  *(_QWORD *)(v6 + 72) = v13;
  *(_QWORD *)(v6 + 80) = v12;
  *(_QWORD *)(v6 + 136) = v10;
  *(_QWORD *)(v6 + 144) = v11;
  v27 = v11;
  *(_QWORD *)(v6 + 112) = 0xD000000000000010;
  *(_QWORD *)(v6 + 120) = 0x80000001AF246690;
  swift_bridgeObjectRetain();
  sub_1AF2410F0();
  swift_bridgeObjectRelease();
  if ((v28 & 1) == 0)
  {
    sub_1AF2414B0();
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1AF242860;
    v15 = sub_1AF241648();
    *(_QWORD *)(v14 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v14 + 64) = v11;
    *(_QWORD *)(v14 + 32) = v15;
    *(_QWORD *)(v14 + 40) = v16;
    sub_1AF2410F0();
    swift_bridgeObjectRelease();
    if (v5)
    {
      swift_bridgeObjectRetain();
      sub_1AF2414B0();
      v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_1AF242860;
      *(_QWORD *)(v17 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33CF8);
      *(_QWORD *)(v17 + 64) = sub_1AF22D2DC(&qword_1EEE33D00, &qword_1EEE33CF8, MEMORY[0x1E0CB1B18]);
      *(_QWORD *)(v17 + 32) = v5;
      sub_1AF2410F0();
      swift_bridgeObjectRelease();
    }
  }
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_1AF2414B0();
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_1AF242860;
    *(_QWORD *)(v18 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33CE8);
    *(_QWORD *)(v18 + 64) = sub_1AF22D2DC(&qword_1EEE33CF0, &qword_1EEE33CE8, MEMORY[0x1E0CB1828]);
    *(_QWORD *)(v18 + 32) = v2;
    sub_1AF2410F0();
    swift_bridgeObjectRelease();
  }
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_1AF2416B4();
    v19 = result;
  }
  else
  {
    v19 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  if (v19)
  {
    if (v19 < 1)
    {
      __break(1u);
      return result;
    }
    v21 = 0;
    v22 = MEMORY[0x1E0DEA968];
    do
    {
      ++v21;
      swift_unknownObjectRetain();
      sub_1AF2414B0();
      v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_1AF242860;
      swift_unknownObjectRetain();
      v24 = sub_1AF2412AC();
      *(_QWORD *)(v23 + 56) = v22;
      *(_QWORD *)(v23 + 64) = v27;
      *(_QWORD *)(v23 + 32) = v24;
      *(_QWORD *)(v23 + 40) = v25;
      sub_1AF2410F0();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
    }
    while (v19 != v21);
  }
  swift_bridgeObjectRelease();
  sub_1AF2414B0();
  sub_1AF2410F0();
  sub_1AF23217C();
  if ((v26 & 1) != 0)
  {
    sub_1AF2414BC();
    sub_1AF2410F0();
  }
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF22C500(uint64_t a1)
{
  uint64_t result;

  switch(a1)
  {
    case 496:
      result = 15;
      break;
    case 497:
      result = 16;
      break;
    case 498:
      result = 17;
      break;
    case 499:
      result = 18;
      break;
    case 500:
      result = 19;
      break;
    case 501:
      result = 20;
      break;
    case 502:
      result = 21;
      break;
    case 503:
      result = 22;
      break;
    case 504:
      result = 23;
      break;
    case 505:
      result = 24;
      break;
    case 506:
      result = 25;
      break;
    case 507:
      result = 26;
      break;
    case 508:
      result = 27;
      break;
    case 509:
      result = 28;
      break;
    case 510:
      result = 29;
      break;
    case 511:
      result = 30;
      break;
    case 512:
      result = 31;
      break;
    case 513:
      result = 32;
      break;
    case 514:
      result = 33;
      break;
    case 515:
      result = 34;
      break;
    case 516:
      result = 35;
      break;
    case 517:
    case 518:
    case 519:
    case 520:
    case 521:
    case 522:
    case 523:
    case 524:
    case 525:
    case 526:
    case 527:
    case 528:
    case 529:
    case 530:
    case 531:
    case 532:
    case 533:
    case 534:
    case 535:
    case 536:
    case 537:
    case 538:
    case 539:
    case 540:
    case 541:
    case 542:
    case 543:
    case 544:
    case 545:
    case 546:
    case 547:
    case 548:
    case 549:
    case 559:
    case 560:
    case 561:
    case 562:
    case 563:
    case 564:
    case 565:
    case 566:
    case 567:
    case 568:
    case 569:
    case 570:
    case 571:
    case 572:
    case 573:
    case 574:
    case 578:
    case 579:
LABEL_22:
      result = 94;
      break;
    case 550:
      result = 36;
      break;
    case 551:
      result = 37;
      break;
    case 552:
      result = 38;
      break;
    case 553:
      result = 39;
      break;
    case 554:
      result = 40;
      break;
    case 555:
      result = 41;
      break;
    case 556:
      result = 42;
      break;
    case 557:
      result = 43;
      break;
    case 558:
      result = 44;
      break;
    case 575:
      result = 45;
      break;
    case 576:
      result = 46;
      break;
    case 577:
      result = 47;
      break;
    case 580:
      result = 48;
      break;
    case 581:
      result = 49;
      break;
    case 582:
      result = 50;
      break;
    case 583:
      result = 51;
      break;
    default:
      switch(a1)
      {
        case 1300:
          result = 78;
          break;
        case 1301:
          result = 79;
          break;
        case 1302:
          result = 80;
          break;
        case 1303:
          result = 81;
          break;
        case 1304:
          result = 82;
          break;
        case 1305:
          result = 83;
          break;
        case 1306:
          result = 84;
          break;
        case 1307:
          result = 85;
          break;
        case 1308:
          result = 86;
          break;
        case 1309:
          result = 87;
          break;
        case 1310:
          result = 88;
          break;
        case 1311:
          result = 89;
          break;
        case 1312:
          result = 90;
          break;
        case 1313:
          result = 91;
          break;
        case 1314:
          result = 92;
          break;
        case 1315:
          result = 93;
          break;
        default:
          result = 0;
          switch(a1)
          {
            case 0:
              return result;
            case 1:
              result = 1;
              break;
            case 2:
              result = 2;
              break;
            case 3:
              result = 3;
              break;
            case 4:
              result = 4;
              break;
            case 5:
              result = 5;
              break;
            case 6:
              result = 6;
              break;
            case 7:
            case 8:
            case 9:
              goto LABEL_22;
            case 10:
              result = 7;
              break;
            case 11:
              result = 8;
              break;
            case 12:
              result = 9;
              break;
            default:
              result = 13;
              switch(a1)
              {
                case '2':
                  result = 10;
                  break;
                case '3':
                  result = 11;
                  break;
                case '4':
                  result = 12;
                  break;
                case '5':
                  return result;
                case '6':
                  result = 14;
                  break;
                default:
                  switch(a1)
                  {
                    case 600:
                      result = 52;
                      break;
                    case 601:
                      result = 53;
                      break;
                    case 602:
                      result = 54;
                      break;
                    case 603:
                      result = 55;
                      break;
                    default:
                      switch(a1)
                      {
                        case 1000:
                          result = 71;
                          break;
                        case 1001:
                          result = 72;
                          break;
                        case 1002:
                          result = 73;
                          break;
                        case 1003:
                          result = 74;
                          break;
                        default:
                          switch(a1)
                          {
                            case 700:
                              result = 56;
                              break;
                            case 701:
                              result = 57;
                              break;
                            case 702:
                              result = 58;
                              break;
                            case 1101:
                              result = 75;
                              break;
                            case 1102:
                              result = 76;
                              break;
                            case 1200:
                              result = 77;
                              break;
                            default:
                              goto LABEL_22;
                          }
                          break;
                      }
                      break;
                  }
                  break;
              }
              break;
          }
          break;
      }
      break;
  }
  return result;
}

uint64_t sub_1AF22C91C(char a1)
{
  return qword_1AF2448E0[a1];
}

BOOL sub_1AF22C930(char *a1, char *a2)
{
  return sub_1AF21F7AC(*a1, *a2);
}

void sub_1AF22C93C()
{
  sub_1AF231B80();
}

void sub_1AF22C944()
{
  sub_1AF231CE8();
}

void sub_1AF22C94C()
{
  sub_1AF231F44();
}

uint64_t sub_1AF22C954@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_1AF22C500(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1AF22C97C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;

  result = sub_1AF22C91C(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1AF22C9A4()
{
  if (qword_1EEE334A8 != -1)
    swift_once();
  qword_1ED330178 = qword_1EEE33F60;
  unk_1ED330180 = *(_QWORD *)algn_1EEE33F68;
  return swift_bridgeObjectRetain();
}

uint64_t *sub_1AF22C9F4()
{
  if (qword_1ED32E448 != -1)
    swift_once();
  return &qword_1ED330178;
}

void sub_1AF22CA34()
{
  qword_1EEE34058 = (uint64_t)&unk_1E5F3B310;
}

void sub_1AF22CA48()
{
  qword_1ED3301C0 = (uint64_t)&unk_1E5F3B2E8;
}

uint64_t sub_1AF22CA5C(uint64_t a1)
{
  uint64_t result;

  result = 1;
  switch(a1)
  {
    case 0:
      result = 0;
      break;
    case 1:
      return result;
    case 2:
      result = 2;
      break;
    case 3:
      result = 3;
      break;
    case 4:
      result = 4;
      break;
    case 5:
      result = 5;
      break;
    case 6:
      result = 6;
      break;
    case 7:
      result = 7;
      break;
    case 8:
      result = 8;
      break;
    case 9:
      result = 9;
      break;
    case 10:
      result = 10;
      break;
    case 11:
      result = 11;
      break;
    case 12:
      result = 12;
      break;
    case 13:
      result = 13;
      break;
    case 14:
      result = 14;
      break;
    case 15:
      result = 15;
      break;
    case 16:
      result = 16;
      break;
    case 17:
      result = 17;
      break;
    case 18:
      result = 18;
      break;
    case 19:
      result = 19;
      break;
    case 20:
      result = 20;
      break;
    case 21:
      result = 21;
      break;
    case 22:
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
    case 64:
      goto LABEL_9;
    case 23:
      result = 22;
      break;
    case 24:
      result = 23;
      break;
    case 25:
      result = 24;
      break;
    case 26:
      result = 25;
      break;
    case 27:
      result = 26;
      break;
    case 28:
      result = 27;
      break;
    case 29:
      result = 28;
      break;
    case 50:
      result = 29;
      break;
    case 60:
      result = 30;
      break;
    case 61:
      result = 31;
      break;
    case 62:
      result = 32;
      break;
    case 63:
      result = 33;
      break;
    case 65:
      result = 34;
      break;
    case 66:
      result = 35;
      break;
    default:
      switch(a1)
      {
        case 100:
          result = 36;
          break;
        case 200:
          result = 37;
          break;
        case 300:
          result = 38;
          break;
        case 301:
          result = 39;
          break;
        case 400:
          result = 40;
          break;
        default:
LABEL_9:
          result = 41;
          break;
      }
      break;
  }
  return result;
}

uint64_t sub_1AF22CBF4(char a1)
{
  return qword_1AF244798[a1];
}

uint64_t sub_1AF22CC08@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_1AF22CA5C(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1AF22CC30@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;

  result = sub_1AF22CBF4(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_1AF22CC58()
{
  uint64_t v0;

  sub_1AF22C9F4();
  v0 = qword_1ED330178;
  OUTLINED_FUNCTION_1_0();
  return v0;
}

uint64_t sub_1AF22CC8C()
{
  unsigned __int8 *v0;

  return sub_1AF20D8DC(*v0);
}

uint64_t sub_1AF22CCA8()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF22CCD8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1AF22CD40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  unint64_t v14;

  sub_1AF2414B0();
  sub_1AF2410F0();
  sub_1AF22BFA0();
  sub_1AF2414B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
  v1 = OUTLINED_FUNCTION_0_1();
  *(_OWORD *)(v1 + 16) = xmmword_1AF242860;
  v2 = sub_1AF2412AC();
  v4 = v3;
  v5 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
  v6 = sub_1AF20BFF4();
  *(_QWORD *)(v1 + 64) = v6;
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v4;
  OUTLINED_FUNCTION_5_8();
  swift_bridgeObjectRelease();
  sub_1AF2414B0();
  v7 = OUTLINED_FUNCTION_0_1();
  *(_OWORD *)(v7 + 16) = xmmword_1AF242860;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33CE0);
  v8 = sub_1AF2412AC();
  *(_QWORD *)(v7 + 56) = v5;
  *(_QWORD *)(v7 + 64) = v6;
  *(_QWORD *)(v7 + 32) = v8;
  *(_QWORD *)(v7 + 40) = v9;
  OUTLINED_FUNCTION_5_8();
  swift_bridgeObjectRelease();
  sub_1AF2414B0();
  v10 = OUTLINED_FUNCTION_0_1();
  v11 = *(_QWORD *)(v0 + qword_1ED3301A8);
  *(_OWORD *)(v10 + 16) = xmmword_1AF242860;
  *(_QWORD *)(v10 + 56) = v5;
  *(_QWORD *)(v10 + 64) = v6;
  v12 = v11 == 0;
  v13 = 7562617;
  if (v12)
    v13 = 28526;
  v14 = 0xE300000000000000;
  if (v12)
    v14 = 0xE200000000000000;
  *(_QWORD *)(v10 + 32) = v13;
  *(_QWORD *)(v10 + 40) = v14;
  sub_1AF2410F0();
  OUTLINED_FUNCTION_96();
  sub_1AF2414B0();
  return sub_1AF2410F0();
}

uint64_t getEnumTagSinglePayload for ResourceAccessOutcome(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xA3)
  {
    if (a2 + 93 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 93) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 94;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x5E;
  v5 = v6 - 94;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ResourceAccessOutcome(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 93 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 93) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xA3)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xA2)
    return ((uint64_t (*)(void))((char *)&loc_1AF22D030 + 4 * byte_1AF2444EF[v4]))();
  *a1 = a2 + 93;
  return ((uint64_t (*)(void))((char *)sub_1AF22D064 + 4 * byte_1AF2444EA[v4]))();
}

uint64_t sub_1AF22D064(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF22D06C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF22D074);
  return result;
}

uint64_t sub_1AF22D080(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF22D088);
  *(_BYTE *)result = a2 + 93;
  return result;
}

uint64_t sub_1AF22D08C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF22D094(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ResourceAccessOutcome()
{
  return &type metadata for ResourceAccessOutcome;
}

uint64_t storeEnumTagSinglePayload for ResourceAccessActivity(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 40 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 40) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xD8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xD7)
    return ((uint64_t (*)(void))((char *)&loc_1AF22D0FC + 4 * byte_1AF2444F9[v4]))();
  *a1 = a2 + 40;
  return ((uint64_t (*)(void))((char *)sub_1AF22D130 + 4 * byte_1AF2444F4[v4]))();
}

uint64_t sub_1AF22D130(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF22D138(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF22D140);
  return result;
}

uint64_t sub_1AF22D14C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF22D154);
  *(_BYTE *)result = a2 + 40;
  return result;
}

uint64_t sub_1AF22D158(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF22D160(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ResourceAccessActivity()
{
  return &type metadata for ResourceAccessActivity;
}

unint64_t sub_1AF22D17C(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1AF22D1A8();
  result = sub_1AF22D1E4();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1AF22D1A8()
{
  unint64_t result;

  result = qword_1ED32E860;
  if (!qword_1ED32E860)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF24468C, &type metadata for ResourceAccessActivity);
    atomic_store(result, (unint64_t *)&qword_1ED32E860);
  }
  return result;
}

unint64_t sub_1AF22D1E4()
{
  unint64_t result;

  result = qword_1ED32E878;
  if (!qword_1ED32E878)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF244654, &type metadata for ResourceAccessActivity);
    atomic_store(result, (unint64_t *)&qword_1ED32E878);
  }
  return result;
}

unint64_t sub_1AF22D224()
{
  unint64_t result;

  result = qword_1ED32E870;
  if (!qword_1ED32E870)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF2446CC, &type metadata for ResourceAccessActivity);
    atomic_store(result, (unint64_t *)&qword_1ED32E870);
  }
  return result;
}

unint64_t sub_1AF22D264()
{
  unint64_t result;

  result = qword_1EEE33CD8;
  if (!qword_1EEE33CD8)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF24476C, &type metadata for ResourceAccessOutcome);
    atomic_store(result, (unint64_t *)&qword_1EEE33CD8);
  }
  return result;
}

unint64_t sub_1AF22D2A0()
{
  unint64_t result;

  result = qword_1ED32F800;
  if (!qword_1ED32F800)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED32F800);
  }
  return result;
}

uint64_t sub_1AF22D2DC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1AF45A834](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return sub_1AF2412AC();
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  return sub_1AF2415F4();
}

void OUTLINED_FUNCTION_29_0()
{
  os_unfair_lock_s *v0;

  os_unfair_lock_unlock(v0);
}

uint64_t FederatedIdentifier.uuid.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_5_9();
  v0 = OUTLINED_FUNCTION_13_2();
  return OUTLINED_FUNCTION_7_8(v0, v1, v2, v3);
}

uint64_t FederatedIdentifier.dateCreated.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_2_11();
  v0 = OUTLINED_FUNCTION_13_2();
  return OUTLINED_FUNCTION_7_8(v0, v1, v2, v3);
}

uint64_t type metadata accessor for FederatedIdentifier()
{
  uint64_t result;

  result = qword_1EEE333D8;
  if (!qword_1EEE333D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t FederatedIdentifier.init(uuid:dateCreated:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_5_9();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  v7 = a3 + *(int *)(OUTLINED_FUNCTION_1_10() + 20);
  v8 = OUTLINED_FUNCTION_136();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a2, v8);
}

uint64_t FederatedIdentifier.init()()
{
  sub_1AF240F34();
  OUTLINED_FUNCTION_1_10();
  return sub_1AF240EEC();
}

uint64_t FederatedIdentifier.hash(into:)()
{
  OUTLINED_FUNCTION_5_9();
  sub_1AF226928(&qword_1EEE33D08, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_2_11();
  sub_1AF226928(&qword_1EEE33D10, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  return OUTLINED_FUNCTION_12_3();
}

uint64_t static FederatedIdentifier.== infix(_:_:)()
{
  if ((sub_1AF240F1C() & 1) == 0)
    return 0;
  OUTLINED_FUNCTION_1_10();
  return sub_1AF240ED4();
}

uint64_t sub_1AF22D530(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 1684632949 && a2 == 0xE400000000000000;
  if (v3 || (sub_1AF241744() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6165724365746164 && a2 == 0xEB00000000646574)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_1AF241744();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1AF22D614()
{
  return 2;
}

uint64_t sub_1AF22D61C()
{
  return 0;
}

uint64_t sub_1AF22D628(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6165724365746164;
  else
    return 1684632949;
}

uint64_t sub_1AF22D660()
{
  char *v0;

  return sub_1AF22D628(*v0);
}

uint64_t sub_1AF22D668@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1AF22D530(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1AF22D68C()
{
  return sub_1AF22D61C();
}

uint64_t sub_1AF22D6A8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1AF22D614();
  *a1 = result;
  return result;
}

uint64_t sub_1AF22D6CC()
{
  sub_1AF22D888();
  return sub_1AF241840();
}

uint64_t sub_1AF22D6F4()
{
  sub_1AF22D888();
  return sub_1AF24184C();
}

uint64_t FederatedIdentifier.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33488);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_57();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1AF22D888();
  sub_1AF241828();
  sub_1AF240F40();
  sub_1AF226928(&qword_1EEE33390, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09B8]);
  OUTLINED_FUNCTION_15_3();
  if (!v1)
  {
    type metadata accessor for FederatedIdentifier();
    sub_1AF240F04();
    sub_1AF226928(&qword_1EEE33388, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB0890]);
    OUTLINED_FUNCTION_15_3();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_1AF22D888()
{
  unint64_t result;

  result = qword_1EEE333C0;
  if (!qword_1EEE333C0)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF244DC8, &type metadata for FederatedIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE333C0);
  }
  return result;
}

uint64_t FederatedIdentifier.hashValue.getter()
{
  sub_1AF2417EC();
  OUTLINED_FUNCTION_5_9();
  sub_1AF226928(&qword_1EEE33D08, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  OUTLINED_FUNCTION_11_5();
  OUTLINED_FUNCTION_1_10();
  OUTLINED_FUNCTION_2_11();
  sub_1AF226928(&qword_1EEE33D10, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  OUTLINED_FUNCTION_11_5();
  return sub_1AF241810();
}

uint64_t FederatedIdentifier.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v13 = sub_1AF240F04();
  v10 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_14_3();
  v12 = v4;
  v15 = sub_1AF240F40();
  v5 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_14_3();
  v14 = v6;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33D18);
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_6_7();
  v7 = type metadata accessor for FederatedIdentifier();
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_2_8();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1AF22D888();
  sub_1AF24181C();
  if (v17)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  sub_1AF226928(&qword_1EEE33D20, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09E0]);
  sub_1AF2416FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v2, v14, v15);
  sub_1AF226928(&qword_1EEE33D28, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08C0]);
  sub_1AF2416FC();
  OUTLINED_FUNCTION_9_5();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v2 + *(int *)(v7 + 20), v12, v13);
  sub_1AF22DCA4(v2, a2);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  return sub_1AF22DCE8(v2);
}

uint64_t sub_1AF22DBC0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return FederatedIdentifier.init(from:)(a1, a2);
}

uint64_t sub_1AF22DBD4(_QWORD *a1)
{
  return FederatedIdentifier.encode(to:)(a1);
}

uint64_t sub_1AF22DBF0()
{
  sub_1AF2417EC();
  sub_1AF240F40();
  sub_1AF226928(&qword_1EEE33D08, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  sub_1AF241228();
  sub_1AF240F04();
  sub_1AF226928(&qword_1EEE33D10, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  sub_1AF241228();
  return sub_1AF241810();
}

uint64_t sub_1AF22DCA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for FederatedIdentifier();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AF22DCE8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for FederatedIdentifier();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static FederatedIdentifier.< infix(_:_:)()
{
  OUTLINED_FUNCTION_1_10();
  return sub_1AF240E98();
}

BOOL sub_1AF22DD60()
{
  type metadata accessor for FederatedIdentifier();
  return (sub_1AF240E98() & 1) == 0;
}

BOOL sub_1AF22DDA4()
{
  type metadata accessor for FederatedIdentifier();
  return (sub_1AF240E98() & 1) == 0;
}

uint64_t sub_1AF22DDE8()
{
  type metadata accessor for FederatedIdentifier();
  return sub_1AF240E98();
}

unint64_t static FederatedIdentifier.keyTTLInDays.getter()
{
  return 0xD00000000000001CLL;
}

uint64_t static FederatedIdentifier.defaultTTLInMonths.getter()
{
  return 15;
}

uint64_t FederatedIdentifier.isValid(for:)(uint64_t a1)
{
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  char v35;
  uint64_t v36;
  char *v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v44 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EB98);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_57();
  v6 = v5 - v4;
  v45 = OUTLINED_FUNCTION_136();
  v43 = *(_QWORD *)(v45 - 8);
  v7 = MEMORY[0x1E0C80A78](v45);
  v42 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v41 = (char *)&v41 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33D30);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_2_8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33D38);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_57();
  v14 = v13 - v12;
  v15 = sub_1AF240D54();
  v46 = *(_QWORD *)(v15 - 8);
  v47 = v15;
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_57();
  v18 = v17 - v16;
  v19 = sub_1AF240FB8();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_6_7();
  v21 = sub_1AF241000();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_57();
  v25 = v24 - v23;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v20 + 104))(v1, *MEMORY[0x1E0CB0EF8], v19);
  sub_1AF240FC4();
  v26 = v1;
  v27 = v22;
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v26, v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v14, v25, v21);
  __swift_storeEnumTagSinglePayload(v14, 0, 1, v21);
  v28 = sub_1AF24100C();
  __swift_storeEnumTagSinglePayload(v2, 1, 1, v28);
  sub_1AF240D48();
  if (!v44 || (Config.federatedIdentifierTTLInDays.getter(), (v29 & 1) != 0))
    sub_1AF240D30();
  else
    sub_1AF240D18();
  OUTLINED_FUNCTION_1_10();
  sub_1AF240FDC();
  v30 = v45;
  if (__swift_getEnumTagSinglePayload(v6, 1, v45) == 1)
  {
    sub_1AF22E278(v6);
    if (qword_1ED32EC08 != -1)
      swift_once();
    v31 = sub_1AF2411B0();
    __swift_project_value_buffer(v31, (uint64_t)qword_1ED330238);
    v32 = sub_1AF241198();
    v33 = sub_1AF2414B0();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_1AF203000, v32, v33, "FederatedIdentifier endDate could not be computed", v34, 2u);
      OUTLINED_FUNCTION_1();
    }

    v35 = 0;
  }
  else
  {
    v36 = v43;
    v37 = v41;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 32))(v41, v6, v30);
    v38 = v42;
    sub_1AF240EEC();
    v35 = sub_1AF240E8C();
    v39 = *(void (**)(char *, uint64_t))(v36 + 8);
    v39(v38, v30);
    v39(v37, v30);
  }
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v18, v47);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v21);
  return v35 & 1;
}

uint64_t sub_1AF22E278(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EB98);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id Config.federatedIdentifierTTLInDays.getter()
{
  void *v0;
  void *v1;
  id v2;
  _OWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  void *v14;
  __int128 v15;
  uint64_t v16;
  _OWORD v17[2];

  v1 = (void *)sub_1AF24124C();
  v2 = objc_msgSend(v0, sel_valueForKey_shouldConsiderOverrides_, v1, 1);

  if (v2)
  {
    sub_1AF2415D0();
    swift_unknownObjectRelease();
    v3 = sub_1AF219FD0(&v15, v17);
    OUTLINED_FUNCTION_17_1((uint64_t)v3, v4);
    if (swift_dynamicCast())
    {
      v2 = v14;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
    }
    else
    {
      if (qword_1ED32EC08 != -1)
        swift_once();
      v5 = sub_1AF2411B0();
      v6 = __swift_project_value_buffer(v5, (uint64_t)qword_1ED330238);
      OUTLINED_FUNCTION_17_1(v6, v7);
      v8 = sub_1AF241198();
      v9 = sub_1AF2414B0();
      if (os_log_type_enabled(v8, v9))
      {
        v10 = (uint8_t *)OUTLINED_FUNCTION_4();
        v14 = (void *)OUTLINED_FUNCTION_4();
        *(_DWORD *)v10 = 136315138;
        __swift_project_boxed_opaque_existential_1(&v15, v16);
        swift_getDynamicType();
        v11 = sub_1AF241858();
        sub_1AF208AF4(v11, v12, (uint64_t *)&v14);
        sub_1AF24157C();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v15);
        _os_log_impl(&dword_1AF203000, v8, v9, "Config has FederatedIdentifier with unexpected type: %s", v10, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
      }

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v15);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
      return 0;
    }
  }
  return v2;
}

uint64_t sub_1AF22E518()
{
  return sub_1AF226928(&qword_1EEE33D40, (uint64_t (*)(uint64_t))type metadata accessor for FederatedIdentifier, (uint64_t)&protocol conformance descriptor for FederatedIdentifier);
}

uint64_t *initializeBufferWithCopyOfBuffer for FederatedIdentifier(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1AF240F40();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1AF240F04();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t destroy for FederatedIdentifier(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_1AF240F40();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_1AF240F04();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for FederatedIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1AF240F40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1AF240F04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t assignWithCopy for FederatedIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1AF240F40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1AF240F04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t initializeWithTake for FederatedIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1AF240F40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1AF240F04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for FederatedIdentifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1AF240F40();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1AF240F04();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for FederatedIdentifier()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AF22E844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = OUTLINED_FUNCTION_5_9();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_136();
    v8 = a1 + *(int *)(a3 + 20);
  }
  return __swift_getEnumTagSinglePayload(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for FederatedIdentifier()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AF22E8B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = OUTLINED_FUNCTION_5_9();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    v9 = OUTLINED_FUNCTION_136();
    v10 = a1 + *(int *)(a4 + 20);
  }
  return __swift_storeEnumTagSinglePayload(v10, a2, a2, v9);
}

uint64_t sub_1AF22E918()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1AF240F40();
  if (v1 <= 0x3F)
  {
    result = sub_1AF240F04();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for FederatedIdentifier.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1AF22E9E8 + 4 * byte_1AF244BD5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1AF22EA1C + 4 * byte_1AF244BD0[v4]))();
}

uint64_t sub_1AF22EA1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF22EA24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF22EA2CLL);
  return result;
}

uint64_t sub_1AF22EA38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF22EA40);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1AF22EA44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF22EA4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FederatedIdentifier.CodingKeys()
{
  return &type metadata for FederatedIdentifier.CodingKeys;
}

unint64_t sub_1AF22EA6C()
{
  unint64_t result;

  result = qword_1EEE33D48;
  if (!qword_1EEE33D48)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF244DA0, &type metadata for FederatedIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE33D48);
  }
  return result;
}

unint64_t sub_1AF22EAAC()
{
  unint64_t result;

  result = qword_1EEE333D0;
  if (!qword_1EEE333D0)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF244D10, &type metadata for FederatedIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE333D0);
  }
  return result;
}

unint64_t sub_1AF22EAEC()
{
  unint64_t result;

  result = qword_1EEE333C8;
  if (!qword_1EEE333C8)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF244D38, &type metadata for FederatedIdentifier.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EEE333C8);
  }
  return result;
}

uint64_t sub_1AF22EB3C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char v12;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;
  uint64_t v25;

  v1 = v0;
  v2 = sub_1AF2410B4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v4);
  v9 = (char *)&v25 - v8;
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v25 - v10;
  objc_msgSend(v1, sel_code);
  sub_1AF241090();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v9, v11, v2);
  sub_1AF2410A8();
  sub_1AF22EE78();
  v12 = OUTLINED_FUNCTION_0_11();
  OUTLINED_FUNCTION_1_11((uint64_t)v6);
  if ((v12 & 1) != 0)
  {
    OUTLINED_FUNCTION_1_11((uint64_t)v9);
    OUTLINED_FUNCTION_1_11((uint64_t)v11);
    return 59;
  }
  else
  {
    sub_1AF241084();
    v14 = OUTLINED_FUNCTION_0_11();
    OUTLINED_FUNCTION_1_11((uint64_t)v6);
    if ((v14 & 1) != 0)
    {
      OUTLINED_FUNCTION_1_11((uint64_t)v9);
      OUTLINED_FUNCTION_1_11((uint64_t)v11);
      return 60;
    }
    else
    {
      sub_1AF24109C();
      v15 = OUTLINED_FUNCTION_0_11();
      OUTLINED_FUNCTION_1_11((uint64_t)v6);
      if ((v15 & 1) != 0)
      {
        OUTLINED_FUNCTION_1_11((uint64_t)v9);
        OUTLINED_FUNCTION_1_11((uint64_t)v11);
        return 61;
      }
      else
      {
        sub_1AF241024();
        v16 = OUTLINED_FUNCTION_0_11();
        OUTLINED_FUNCTION_1_11((uint64_t)v6);
        if ((v16 & 1) != 0)
        {
          OUTLINED_FUNCTION_1_11((uint64_t)v9);
          OUTLINED_FUNCTION_1_11((uint64_t)v11);
          return 62;
        }
        else
        {
          sub_1AF241018();
          v17 = OUTLINED_FUNCTION_0_11();
          OUTLINED_FUNCTION_1_11((uint64_t)v6);
          if ((v17 & 1) != 0
            || (sub_1AF24103C(), v18 = OUTLINED_FUNCTION_0_11(), OUTLINED_FUNCTION_1_11((uint64_t)v6), (v18 & 1) != 0))
          {
            OUTLINED_FUNCTION_1_11((uint64_t)v9);
            OUTLINED_FUNCTION_1_11((uint64_t)v11);
            return 63;
          }
          else
          {
            sub_1AF241060();
            v19 = OUTLINED_FUNCTION_0_11();
            OUTLINED_FUNCTION_1_11((uint64_t)v6);
            if ((v19 & 1) != 0)
            {
              OUTLINED_FUNCTION_1_11((uint64_t)v9);
              OUTLINED_FUNCTION_1_11((uint64_t)v11);
              return 64;
            }
            else
            {
              sub_1AF241030();
              v20 = OUTLINED_FUNCTION_0_11();
              OUTLINED_FUNCTION_1_11((uint64_t)v6);
              if ((v20 & 1) != 0)
              {
                OUTLINED_FUNCTION_1_11((uint64_t)v9);
                OUTLINED_FUNCTION_1_11((uint64_t)v11);
                return 65;
              }
              else
              {
                sub_1AF241054();
                v21 = OUTLINED_FUNCTION_0_11();
                OUTLINED_FUNCTION_1_11((uint64_t)v6);
                if ((v21 & 1) != 0)
                {
                  OUTLINED_FUNCTION_1_11((uint64_t)v9);
                  OUTLINED_FUNCTION_1_11((uint64_t)v11);
                  return 66;
                }
                else
                {
                  sub_1AF241048();
                  v22 = OUTLINED_FUNCTION_0_11();
                  OUTLINED_FUNCTION_1_11((uint64_t)v6);
                  if ((v22 & 1) != 0)
                  {
                    OUTLINED_FUNCTION_1_11((uint64_t)v9);
                    OUTLINED_FUNCTION_1_11((uint64_t)v11);
                    return 67;
                  }
                  else
                  {
                    sub_1AF24106C();
                    v23 = OUTLINED_FUNCTION_0_11();
                    OUTLINED_FUNCTION_1_11((uint64_t)v6);
                    if ((v23 & 1) != 0)
                    {
                      OUTLINED_FUNCTION_1_11((uint64_t)v9);
                      OUTLINED_FUNCTION_1_11((uint64_t)v11);
                      return 68;
                    }
                    else
                    {
                      sub_1AF241078();
                      v24 = OUTLINED_FUNCTION_0_11();
                      OUTLINED_FUNCTION_1_11((uint64_t)v6);
                      OUTLINED_FUNCTION_1_11((uint64_t)v9);
                      OUTLINED_FUNCTION_1_11((uint64_t)v11);
                      if ((v24 & 1) != 0)
                        return 69;
                      else
                        return 22;
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

unint64_t sub_1AF22EE78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEE33D50;
  if (!qword_1EEE33D50)
  {
    v1 = sub_1AF2410B4();
    result = MEMORY[0x1AF45A834](MEMORY[0x1E0CB1588], v1);
    atomic_store(result, (unint64_t *)&qword_1EEE33D50);
  }
  return result;
}

PegasusConfiguration::DataVaultStorageClass_optional __swiftcall DataVaultStorageClass.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  PegasusConfiguration::DataVaultStorageClass_optional result;

  v2 = v1;
  v3 = sub_1AF2416F0();
  swift_bridgeObjectRelease();
  v4 = 3;
  if (v3 < 3)
    v4 = v3;
  *v2 = v4;
  OUTLINED_FUNCTION_49();
  return result;
}

void *static DataVaultStorageClass.allCases.getter()
{
  return &unk_1E5F3B258;
}

unint64_t DataVaultStorageClass.rawValue.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000017;
  if (*v0 != 1)
    v1 = 0xD000000000000016;
  if (*v0)
    return v1;
  else
    return 0xD000000000000014;
}

void sub_1AF22EF74(unsigned __int8 *a1, char *a2)
{
  sub_1AF21F7D0(*a1, *a2);
}

void sub_1AF22EF80()
{
  sub_1AF231BB4();
}

uint64_t sub_1AF22EF88()
{
  return sub_1AF231D10();
}

void sub_1AF22EF90()
{
  sub_1AF231EB4();
}

PegasusConfiguration::DataVaultStorageClass_optional sub_1AF22EF98(Swift::String *a1)
{
  return DataVaultStorageClass.init(rawValue:)(*a1);
}

unint64_t sub_1AF22EFA4@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result;
  unint64_t v3;

  result = DataVaultStorageClass.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_1AF22EFC8(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E5F3B258;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> DataVaultStorageClass.path(using:makeDirectory:)(NSFileManager using, Swift::Bool makeDirectory)
{
  unsigned __int8 *v2;
  NSFileManager *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unsigned __int8 v13;
  uint64_t v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  Swift::String result;
  uint64_t v19;
  _BOOL4 v20;
  unsigned __int8 v21;

  v20 = makeDirectory;
  v5 = type metadata accessor for DataVaultPathProvider();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_11();
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1AF240E2C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *v2;
  sub_1AF208F4C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
  {
    sub_1AF22F1D0((uint64_t)v8);
    sub_1AF22F210();
    OUTLINED_FUNCTION_8();
    *(_OWORD *)v14 = xmmword_1AF243AB0;
    *(_BYTE *)(v14 + 16) = 3;
    swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))((char *)v3 + *(int *)(v5 + 20), v12, v9);
    v3->super.isa = using.super.isa;
    v21 = v13;
    v15 = using.super.isa;
    sub_1AF22F24C(&v21, v20);
    sub_1AF22F8D0((uint64_t)v3);
    OUTLINED_FUNCTION_14_4();
  }
  OUTLINED_FUNCTION_0();
  result._object = v17;
  result._countAndFlagsBits = v16;
  return result;
}

uint64_t type metadata accessor for DataVaultPathProvider()
{
  uint64_t result;

  result = qword_1EEE33D88;
  if (!qword_1EEE33D88)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1AF22F1D0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1AF22F210()
{
  unint64_t result;

  result = qword_1EEE33D68;
  if (!qword_1EEE33D68)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF244F78, &type metadata for DataVaultPathError);
    atomic_store(result, (unint64_t *)&qword_1EEE33D68);
  }
  return result;
}

void sub_1AF22F24C(unsigned __int8 *a1, int a2)
{
  void **v2;
  char *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  int v13;
  void **v14;
  uint64_t v15;
  _QWORD *v16;
  char *v17;
  _QWORD *v18;
  unint64_t v19;
  const char *v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  _BYTE *v24;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void **v29;
  uint64_t v30;
  char *v31;
  int v32;
  int v33;
  _QWORD *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;

  v33 = a2;
  v34 = (_QWORD *)sub_1AF240D90();
  v5 = *(v34 - 1);
  MEMORY[0x1E0C80A78](v34);
  OUTLINED_FUNCTION_11();
  v6 = sub_1AF240E2C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v27 - v11;
  v13 = *a1;
  v14 = v2;
  v15 = v35;
  sub_1AF230028();
  if (!v15)
  {
    v30 = v5;
    v31 = v3;
    v16 = v34;
    v32 = v13;
    v35 = v6;
    sub_1AF23014C();
    v17 = v12;
    v28 = 0;
    v29 = v14;
    v27 = "com.apple.photos";
    if (v32)
    {
      v18 = v16;
      if (v32 == 1)
      {
        v19 = 0xD000000000000017;
        v20 = "coreparsec_feedbacks";
      }
      else
      {
        v19 = 0xD000000000000016;
        v20 = "coreparsec_aggregations";
      }
      v21 = (unint64_t)v20 | 0x8000000000000000;
    }
    else
    {
      v21 = 0x80000001AF246260;
      v19 = 0xD000000000000014;
      v18 = v16;
    }
    v23 = v30;
    v22 = v31;
    v36 = v19;
    v37 = v21;
    (*(void (**)(char *, _QWORD, _QWORD *))(v30 + 104))(v31, *MEMORY[0x1E0CAFD60], v18);
    sub_1AF208AB8();
    v31 = v17;
    sub_1AF240E14();
    (*(void (**)(char *, _QWORD *))(v23 + 8))(v22, v18);
    swift_bridgeObjectRelease();
    sub_1AF240DE4();
    v34 = *(_QWORD **)(v7 + 8);
    ((void (*)(char *, uint64_t))v34)(v10, v35);
    v24 = (_BYTE *)OUTLINED_FUNCTION_4();
    *v24 = 0;
    v25 = *v29;
    v26 = (void *)sub_1AF24124C();
    objc_msgSend(v25, sel_fileExistsAtPath_isDirectory_, v26, v24, v27, v28);

    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_0();
}

void sub_1AF22F4A4()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  void *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;

  if (v3)
  {
    if (!v0)
    {
      if (qword_1EEE335A8 != -1)
        swift_once();
      v18 = OUTLINED_FUNCTION_19();
      OUTLINED_FUNCTION_2_12(v18, (uint64_t)qword_1EEE34040);
      v19 = sub_1AF241198();
      v20 = sub_1AF2414B0();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)OUTLINED_FUNCTION_4();
        *(_QWORD *)(v4 - 96) = OUTLINED_FUNCTION_4();
        *(_DWORD *)v21 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v4 - 72) = OUTLINED_FUNCTION_4_10();
        sub_1AF24157C();
        OUTLINED_FUNCTION_9_6();
        _os_log_impl(&dword_1AF203000, v19, v20, "datavault path conflicts with file %s", v21, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
      }

      OUTLINED_FUNCTION_10_3();
      sub_1AF22F210();
      OUTLINED_FUNCTION_8();
      *(_QWORD *)v23 = v2;
      *(_QWORD *)(v23 + 8) = v1;
      *(_BYTE *)(v23 + 16) = 0;
      swift_willThrow();
      JUMPOUT(0x1AF22F340);
    }
    sub_1AF2412D0();
    sub_1AF2412D0();
    swift_bridgeObjectRelease();
    v5 = rootless_check_datavault_flag();
    swift_release();
    swift_release();
    if (v5)
    {
      if (qword_1EEE335A8 != -1)
        swift_once();
      v6 = OUTLINED_FUNCTION_19();
      OUTLINED_FUNCTION_2_12(v6, (uint64_t)qword_1EEE34040);
      v7 = (void *)sub_1AF241198();
      v8 = sub_1AF2414B0();
      if (OUTLINED_FUNCTION_11_6(v8))
      {
        OUTLINED_FUNCTION_4();
        *(_QWORD *)(v4 - 96) = OUTLINED_FUNCTION_4();
        OUTLINED_FUNCTION_8_5(4.8149e-34);
        v9 = OUTLINED_FUNCTION_4_10();
        OUTLINED_FUNCTION_7_9(v9);
        sub_1AF24157C();
        OUTLINED_FUNCTION_9_6();
        OUTLINED_FUNCTION_6_8(&dword_1AF203000, v10, v11, "Found invalid datavault at %s");
        OUTLINED_FUNCTION_12_4();
        OUTLINED_FUNCTION_1();
      }

      OUTLINED_FUNCTION_10_3();
      v22 = *(_QWORD *)(v4 - 152);
      *(_BYTE *)(v4 - 96) = *(_DWORD *)(v4 - 120);
      sub_1AF2305B0(v2, v1, (unsigned __int8 *)(v4 - 96));
LABEL_22:
      if (v22)
      {
        OUTLINED_FUNCTION_1_12();
        swift_bridgeObjectRelease();
        JUMPOUT(0x1AF22F344);
      }
      OUTLINED_FUNCTION_1_12();
      swift_bridgeObjectRelease();
LABEL_26:
      JUMPOUT(0x1AF22F348);
    }
  }
  else if ((*(_DWORD *)(v4 - 116) & 1) != 0)
  {
    if (qword_1EEE335A8 != -1)
      swift_once();
    v12 = OUTLINED_FUNCTION_19();
    OUTLINED_FUNCTION_2_12(v12, (uint64_t)qword_1EEE34040);
    v13 = (void *)sub_1AF241198();
    v14 = sub_1AF2414A4();
    if (OUTLINED_FUNCTION_11_6(v14))
    {
      OUTLINED_FUNCTION_4();
      *(_QWORD *)(v4 - 96) = OUTLINED_FUNCTION_4();
      OUTLINED_FUNCTION_8_5(4.8149e-34);
      v15 = OUTLINED_FUNCTION_4_10();
      OUTLINED_FUNCTION_7_9(v15);
      sub_1AF24157C();
      OUTLINED_FUNCTION_9_6();
      OUTLINED_FUNCTION_6_8(&dword_1AF203000, v16, v17, "Creating new datavault at %s");
      OUTLINED_FUNCTION_12_4();
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_10_3();
    *(_BYTE *)(v4 - 96) = *(_DWORD *)(v4 - 120);
    v22 = *(_QWORD *)(v4 - 152);
    sub_1AF2302D8(v2, v1, (unsigned __int8 *)(v4 - 96));
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_1_12();
  goto LABEL_26;
}

uint64_t sub_1AF22F8D0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DataVaultPathProvider();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1AF22F910()
{
  unint64_t result;

  result = qword_1EEE33D70;
  if (!qword_1EEE33D70)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for DataVaultStorageClass, &type metadata for DataVaultStorageClass);
    atomic_store(result, (unint64_t *)&qword_1EEE33D70);
  }
  return result;
}

unint64_t sub_1AF22F950()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEE33D78;
  if (!qword_1EEE33D78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EEE33D80);
    result = MEMORY[0x1AF45A834](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EEE33D78);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DataVaultStorageClass(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AF22F9E0 + 4 * byte_1AF244E25[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1AF22FA14 + 4 * byte_1AF244E20[v4]))();
}

uint64_t sub_1AF22FA14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF22FA1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF22FA24);
  return result;
}

uint64_t sub_1AF22FA30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF22FA38);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1AF22FA3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF22FA44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DataVaultStorageClass()
{
  return &type metadata for DataVaultStorageClass;
}

uint64_t sub_1AF22FA64(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for DataVaultPathError(uint64_t a1)
{
  return sub_1AF22FA88(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_1AF22FA88(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if (!a3)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s20PegasusConfiguration18DataVaultPathErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1AF22FA64(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for DataVaultPathError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1AF22FA64(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1AF22FA88(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for DataVaultPathError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1AF22FA88(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DataVaultPathError(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 3)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DataVaultPathError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1AF22FC00(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 2u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_1AF22FC18(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for DataVaultPathError()
{
  return &type metadata for DataVaultPathError;
}

void **sub_1AF22FC40(void **a1, void **a2, uint64_t a3)
{
  int v3;
  char *v4;
  void **v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  char *v11;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_1AF240E2C();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    v11 = v4;
    v10(v7, v8, v9);
  }
  return v5;
}

uint64_t sub_1AF22FCD4(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_1AF240E2C();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

void **sub_1AF22FD1C(void **a1, void **a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  id v10;

  v4 = *a2;
  *a1 = *a2;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_1AF240E2C();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  v10 = v4;
  v9(v6, v7, v8);
  return a1;
}

void **sub_1AF22FD88(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_1AF240E2C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

_QWORD *sub_1AF22FDF8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1AF240E2C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void **sub_1AF22FE54(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1AF240E2C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1AF22FEC0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AF22FECC(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1AF240E2C();
    return __swift_getEnumTagSinglePayload((uint64_t)a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_1AF22FF40()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_1AF22FF4C(_QWORD *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7;

  if (a3 == 0x7FFFFFFF)
  {
    *a1 = (a2 - 1);
    OUTLINED_FUNCTION_49();
  }
  else
  {
    v7 = sub_1AF240E2C();
    __swift_storeEnumTagSinglePayload((uint64_t)a1 + *(int *)(a4 + 20), a2, a2, v7);
  }
}

uint64_t sub_1AF22FFB0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1AF240E2C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1AF230028()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _QWORD v5[2];

  v0 = sub_1AF240D90();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DataVaultPathProvider();
  if (qword_1EEE335E0 != -1)
    swift_once();
  v5[0] = qword_1EEE33D58;
  v5[1] = unk_1EEE33D60;
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0CAFD60], v0);
  sub_1AF208AB8();
  swift_bridgeObjectRetain();
  sub_1AF240E14();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return swift_bridgeObjectRelease();
}

id sub_1AF23014C()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  int v8;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  id v13;
  id v14[2];

  v14[1] = *(id *)MEMORY[0x1E0C80C00];
  v1 = sub_1AF240DE4();
  v3 = v2;
  v4 = (_BYTE *)swift_slowAlloc();
  *v4 = 0;
  v5 = *v0;
  v6 = (void *)sub_1AF24124C();
  v7 = objc_msgSend(v5, sel_fileExistsAtPath_isDirectory_, v6, v4);

  v8 = *v4;
  MEMORY[0x1AF45A8C4](v4, -1, -1);
  if (v7)
  {
    if (v8)
      return (id)swift_bridgeObjectRelease();
    sub_1AF22F210();
    swift_allocError();
    *(_QWORD *)v12 = v1;
    *(_QWORD *)(v12 + 8) = v3;
    *(_BYTE *)(v12 + 16) = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v10 = (void *)sub_1AF240DA8();
    v14[0] = 0;
    v11 = objc_msgSend(v5, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v10, 1, 0, v14);

    if (v11)
      return v14[0];
    v13 = v14[0];
    sub_1AF240D6C();

  }
  return (id)swift_willThrow();
}

uint64_t sub_1AF2302D8(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  int v4;
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v4 = *a3;
  sub_1AF2411C8();
  sub_1AF2411D4();
  sub_1AF2411E0();
  sub_1AF2412D0();
  sub_1AF2412D0();
  swift_bridgeObjectRelease();
  v5 = rootless_mkdir_datavault();
  swift_release();
  swift_release();
  if (v5)
  {
    if (qword_1EEE335A8 != -1)
      swift_once();
    v6 = sub_1AF2411B0();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EEE34040);
    v7 = sub_1AF241198();
    a1 = sub_1AF2414B0();
    if (os_log_type_enabled(v7, (os_log_type_t)a1))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v17 = v9;
      *(_DWORD *)v8 = 136315138;
      v10 = 0xD000000000000017;
      v11 = 0x80000001AF246280;
      if (v4 != 1)
      {
        v10 = 0xD000000000000016;
        v11 = 0x80000001AF2462A0;
      }
      if (v4)
        v12 = v10;
      else
        v12 = 0xD000000000000014;
      if (v4)
        v13 = v11;
      else
        v13 = 0x80000001AF246260;
      sub_1AF208AF4(v12, v13, &v17);
      sub_1AF24157C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AF203000, v7, (os_log_type_t)a1, "Creating datavault for %s failed", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF45A8C4](v9, -1, -1);
      MEMORY[0x1AF45A8C4](v8, -1, -1);
    }

    v14 = MEMORY[0x1AF459C7C]();
    sub_1AF22F210();
    swift_allocError();
    *(_QWORD *)v15 = v14;
    *(_QWORD *)(v15 + 8) = 0;
    *(_BYTE *)(v15 + 16) = 2;
    swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1AF2305B0(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  int v3;
  int v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v3 = *a3;
  sub_1AF2412D0();
  sub_1AF2412D0();
  swift_bridgeObjectRelease();
  v5 = rootless_convert_to_datavault();
  swift_release();
  swift_release();
  if (v5)
  {
    if (qword_1EEE335A8 != -1)
      swift_once();
    v6 = sub_1AF2411B0();
    __swift_project_value_buffer(v6, (uint64_t)qword_1EEE34040);
    v7 = sub_1AF241198();
    a1 = sub_1AF2414B0();
    if (os_log_type_enabled(v7, (os_log_type_t)a1))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v17 = v9;
      *(_DWORD *)v8 = 136315138;
      v10 = 0xD000000000000017;
      v11 = 0x80000001AF246280;
      if (v3 != 1)
      {
        v10 = 0xD000000000000016;
        v11 = 0x80000001AF2462A0;
      }
      if (v3)
        v12 = v10;
      else
        v12 = 0xD000000000000014;
      if (v3)
        v13 = v11;
      else
        v13 = 0x80000001AF246260;
      sub_1AF208AF4(v12, v13, &v17);
      sub_1AF24157C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1AF203000, v7, (os_log_type_t)a1, "Converting datavault for %s failed", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1AF45A8C4](v9, -1, -1);
      MEMORY[0x1AF45A8C4](v8, -1, -1);
    }

    v14 = MEMORY[0x1AF459C7C]();
    sub_1AF22F210();
    swift_allocError();
    *(_QWORD *)v15 = v14;
    *(_QWORD *)(v15 + 8) = 0;
    *(_BYTE *)(v15 + 16) = 1;
    swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

void sub_1AF230858()
{
  qword_1EEE33D58 = 0x73746C756176;
  unk_1EEE33D60 = 0xE600000000000000;
}

uint64_t OUTLINED_FUNCTION_14_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_1AF230888()
{
  uint64_t inited;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32ECF0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AF244FC0;
  *(_QWORD *)(inited + 32) = 17473;
  *(_QWORD *)(inited + 40) = 0xE200000000000000;
  *(_QWORD *)(inited + 48) = 21569;
  *(_QWORD *)(inited + 56) = 0xE200000000000000;
  *(_QWORD *)(inited + 64) = 21825;
  *(_QWORD *)(inited + 72) = 0xE200000000000000;
  *(_QWORD *)(inited + 80) = 17730;
  *(_QWORD *)(inited + 88) = 0xE200000000000000;
  *(_QWORD *)(inited + 96) = 16707;
  *(_QWORD *)(inited + 104) = 0xE200000000000000;
  *(_QWORD *)(inited + 112) = 18499;
  *(_QWORD *)(inited + 120) = 0xE200000000000000;
  *(_QWORD *)(inited + 128) = 17732;
  *(_QWORD *)(inited + 136) = 0xE200000000000000;
  *(_QWORD *)(inited + 144) = 21317;
  *(_QWORD *)(inited + 152) = 0xE200000000000000;
  *(_QWORD *)(inited + 160) = 21062;
  *(_QWORD *)(inited + 168) = 0xE200000000000000;
  *(_QWORD *)(inited + 176) = 16967;
  *(_QWORD *)(inited + 184) = 0xE200000000000000;
  *(_QWORD *)(inited + 192) = 18247;
  *(_QWORD *)(inited + 200) = 0xE200000000000000;
  *(_QWORD *)(inited + 208) = 18759;
  *(_QWORD *)(inited + 216) = 0xE200000000000000;
  *(_QWORD *)(inited + 224) = 17737;
  *(_QWORD *)(inited + 232) = 0xE200000000000000;
  *(_QWORD *)(inited + 240) = 19785;
  *(_QWORD *)(inited + 248) = 0xE200000000000000;
  *(_QWORD *)(inited + 256) = 21577;
  *(_QWORD *)(inited + 264) = 0xE200000000000000;
  *(_QWORD *)(inited + 272) = 17738;
  *(_QWORD *)(inited + 280) = 0xE200000000000000;
  *(_QWORD *)(inited + 288) = 20554;
  *(_QWORD *)(inited + 296) = 0xE200000000000000;
  *(_QWORD *)(inited + 304) = 18764;
  *(_QWORD *)(inited + 312) = 0xE200000000000000;
  *(_QWORD *)(inited + 320) = 21836;
  *(_QWORD *)(inited + 328) = 0xE200000000000000;
  *(_QWORD *)(inited + 336) = 17229;
  *(_QWORD *)(inited + 344) = 0xE200000000000000;
  *(_QWORD *)(inited + 352) = 19534;
  *(_QWORD *)(inited + 360) = 0xE200000000000000;
  *(_QWORD *)(inited + 368) = 23118;
  *(_QWORD *)(inited + 376) = 0xE200000000000000;
  *(_QWORD *)(inited + 384) = 19795;
  *(_QWORD *)(inited + 392) = 0xE200000000000000;
  *(_QWORD *)(inited + 400) = 21333;
  *(_QWORD *)(inited + 408) = 0xE200000000000000;
  *(_QWORD *)(inited + 416) = 16726;
  *(_QWORD *)(inited + 424) = 0xE200000000000000;
  *(_QWORD *)(inited + 432) = 16730;
  *(_QWORD *)(inited + 440) = 0xE200000000000000;
  result = sub_1AF23C9B4(inited);
  qword_1EEE34060 = result;
  return result;
}

uint64_t sub_1AF2309A8()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32ECF0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AF244FD0;
  *(_QWORD *)(inited + 32) = 17729;
  *(_QWORD *)(inited + 40) = 0xE200000000000000;
  *(_QWORD *)(inited + 48) = 19521;
  *(_QWORD *)(inited + 56) = 0xE200000000000000;
  *(_QWORD *)(inited + 64) = 16706;
  *(_QWORD *)(inited + 72) = 0xE200000000000000;
  *(_QWORD *)(inited + 80) = 18242;
  *(_QWORD *)(inited + 88) = 0xE200000000000000;
  *(_QWORD *)(inited + 96) = 21058;
  *(_QWORD *)(inited + 104) = 0xE200000000000000;
  *(_QWORD *)(inited + 112) = 19523;
  *(_QWORD *)(inited + 120) = 0xE200000000000000;
  *(_QWORD *)(inited + 128) = 23107;
  *(_QWORD *)(inited + 136) = 0xE200000000000000;
  *(_QWORD *)(inited + 144) = 19268;
  *(_QWORD *)(inited + 152) = 0xE200000000000000;
  *(_QWORD *)(inited + 160) = 21063;
  *(_QWORD *)(inited + 168) = 0xE200000000000000;
  *(_QWORD *)(inited + 176) = 18758;
  *(_QWORD *)(inited + 184) = 0xE200000000000000;
  *(_QWORD *)(inited + 192) = 19272;
  *(_QWORD *)(inited + 200) = 0xE200000000000000;
  *(_QWORD *)(inited + 208) = 21064;
  *(_QWORD *)(inited + 216) = 0xE200000000000000;
  *(_QWORD *)(inited + 224) = 21832;
  *(_QWORD *)(inited + 232) = 0xE200000000000000;
  *(_QWORD *)(inited + 240) = 17481;
  *(_QWORD *)(inited + 248) = 0xE200000000000000;
  *(_QWORD *)(inited + 256) = 19529;
  *(_QWORD *)(inited + 264) = 0xE200000000000000;
  *(_QWORD *)(inited + 272) = 20041;
  *(_QWORD *)(inited + 280) = 0xE200000000000000;
  *(_QWORD *)(inited + 288) = 21321;
  *(_QWORD *)(inited + 296) = 0xE200000000000000;
  *(_QWORD *)(inited + 304) = 21067;
  *(_QWORD *)(inited + 312) = 0xE200000000000000;
  *(_QWORD *)(inited + 320) = 16972;
  *(_QWORD *)(inited + 328) = 0xE200000000000000;
  *(_QWORD *)(inited + 336) = 17485;
  *(_QWORD *)(inited + 344) = 0xE200000000000000;
  *(_QWORD *)(inited + 352) = 17741;
  *(_QWORD *)(inited + 360) = 0xE200000000000000;
  *(_QWORD *)(inited + 368) = 19277;
  *(_QWORD *)(inited + 376) = 0xE200000000000000;
  *(_QWORD *)(inited + 384) = 21581;
  *(_QWORD *)(inited + 392) = 0xE200000000000000;
  *(_QWORD *)(inited + 400) = 22605;
  *(_QWORD *)(inited + 408) = 0xE200000000000000;
  *(_QWORD *)(inited + 416) = 22861;
  *(_QWORD *)(inited + 424) = 0xE200000000000000;
  *(_QWORD *)(inited + 432) = 20302;
  *(_QWORD *)(inited + 440) = 0xE200000000000000;
  *(_QWORD *)(inited + 448) = 18512;
  *(_QWORD *)(inited + 456) = 0xE200000000000000;
  *(_QWORD *)(inited + 464) = 19536;
  *(_QWORD *)(inited + 472) = 0xE200000000000000;
  *(_QWORD *)(inited + 480) = 21584;
  *(_QWORD *)(inited + 488) = 0xE200000000000000;
  *(_QWORD *)(inited + 496) = 20306;
  *(_QWORD *)(inited + 504) = 0xE200000000000000;
  *(_QWORD *)(inited + 512) = 21330;
  *(_QWORD *)(inited + 520) = 0xE200000000000000;
  *(_QWORD *)(inited + 528) = 16723;
  *(_QWORD *)(inited + 536) = 0xE200000000000000;
  *(_QWORD *)(inited + 544) = 18259;
  *(_QWORD *)(inited + 552) = 0xE200000000000000;
  *(_QWORD *)(inited + 560) = 17747;
  *(_QWORD *)(inited + 568) = 0xE200000000000000;
  *(_QWORD *)(inited + 576) = 18771;
  *(_QWORD *)(inited + 584) = 0xE200000000000000;
  *(_QWORD *)(inited + 592) = 19283;
  *(_QWORD *)(inited + 600) = 0xE200000000000000;
  *(_QWORD *)(inited + 608) = 18516;
  *(_QWORD *)(inited + 616) = 0xE200000000000000;
  *(_QWORD *)(inited + 624) = 21076;
  *(_QWORD *)(inited + 632) = 0xE200000000000000;
  *(_QWORD *)(inited + 640) = 22356;
  *(_QWORD *)(inited + 648) = 0xE200000000000000;
  *(_QWORD *)(inited + 656) = 20054;
  *(_QWORD *)(inited + 664) = 0xE200000000000000;
  v1 = nullsub_1();
  if (sub_1AF2241CC(v1))
  {
    result = sub_1AF23C9B4(v1);
  }
  else
  {
    swift_bridgeObjectRelease();
    result = MEMORY[0x1E0DEE9E8];
  }
  qword_1EEE34068 = result;
  return result;
}

uint64_t sub_1AF230B88()
{
  uint64_t inited;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32ECF0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AF243DD0;
  *(_QWORD *)(inited + 32) = 28261;
  *(_QWORD *)(inited + 40) = 0xE200000000000000;
  *(_QWORD *)(inited + 48) = 24938;
  *(_QWORD *)(inited + 56) = 0xE200000000000000;
  *(_QWORD *)(inited + 64) = 29286;
  *(_QWORD *)(inited + 72) = 0xE200000000000000;
  *(_QWORD *)(inited + 80) = 25956;
  *(_QWORD *)(inited + 88) = 0xE200000000000000;
  *(_QWORD *)(inited + 96) = 29801;
  *(_QWORD *)(inited + 104) = 0xE200000000000000;
  result = sub_1AF23C9B4(inited);
  qword_1EEE34070 = result;
  return result;
}

double sub_1AF230BF8()
{
  double result;
  char v1;
  __int128 v2;
  unint64_t v3;
  __int128 v4;
  uint64_t v5;
  char v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v2 = xmmword_1AF244FE0;
  v3 = 0xE800000000000000;
  v1 = 0;
  UserAgent.init(_:requestor:)((uint64_t *)&v2, &v1, (uint64_t)&v4);
  result = *(double *)&v7;
  xmmword_1EEE34080 = v4;
  qword_1EEE34090 = v5;
  byte_1EEE34098 = v6;
  xmmword_1EEE340A0 = v7;
  qword_1EEE340B0 = v8;
  unk_1EEE340B8 = v9;
  return result;
}

Swift::Bool __swiftcall ConfigurationManager.hashtagImagesEnabled()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32E980);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1AF2204B8(5uLL);
  if (v4)
  {
    v5 = objc_msgSend(v4, sel_isEnabled);
    swift_unknownObjectRelease();
  }
  else
  {
    v5 = ConfigurationManager.isHashtagImagesEnabledByDefault()();
  }
  v6 = sub_1AF241420();
  v9 = *(_OWORD *)(v0 + 16);
  __swift_storeEnumTagSinglePayload((uint64_t)v3, 1, 1, v6);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = 0;
  *(_QWORD *)(v7 + 24) = 0;
  *(_OWORD *)(v7 + 32) = v9;
  swift_unknownObjectRetain();
  sub_1AF23150C((uint64_t)v3, (uint64_t)&unk_1EEE33DA0, v7);
  swift_release();
  return v5 & 1;
}

Swift::Bool __swiftcall ConfigurationManager.isHashtagImagesEnabledByDefault()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Bool v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  const char *v27;
  os_log_type_t v28;
  NSObject *v29;
  os_log_type_t v30;
  _DWORD *v31;
  os_log_type_t v32;
  _DWORD *v33;
  uint64_t v35;
  _QWORD v36[3];
  uint64_t v37;
  uint64_t v38;

  v1 = v0;
  if (qword_1ED32EC08 != -1)
    swift_once();
  v2 = sub_1AF2411B0();
  v3 = OUTLINED_FUNCTION_17(v2, (uint64_t)qword_1ED330238);
  v4 = sub_1AF2414A4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_4();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1AF203000, v3, v4, "Checking #images status with default table", v5, 2u);
    OUTLINED_FUNCTION_1();
  }

  v6 = *(_QWORD *)(v1 + 24);
  ObjectType = swift_getObjectType();
  (*(void (**)(_QWORD *__return_ptr, uint64_t))(*(_QWORD *)(v6 + 8) + 24))(v36, ObjectType);
  v8 = v37;
  v9 = v38;
  v10 = __swift_project_boxed_opaque_existential_1(v36, v37);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 24))(v8, v9);
  if (!v12)
  {
    if (qword_1EEE335A0 != -1)
      swift_once();
    v24 = OUTLINED_FUNCTION_17(v2, (uint64_t)qword_1EEE34028);
    v25 = sub_1AF2414B0();
    if (OUTLINED_FUNCTION_119(v25))
    {
      v26 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_WORD *)v26 = 0;
      v27 = "Failed to get effective system language";
      goto LABEL_25;
    }
LABEL_35:

LABEL_36:
    v23 = 0;
    goto LABEL_37;
  }
  v13 = v11;
  v14 = v12;
  v15 = v37;
  v16 = v38;
  v10 = __swift_project_boxed_opaque_existential_1(v36, v37);
  v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
  if (!v18)
  {
    OUTLINED_FUNCTION_72();
    if (qword_1EEE335A0 != -1)
      swift_once();
    v24 = OUTLINED_FUNCTION_17(v2, (uint64_t)qword_1EEE34028);
    v28 = sub_1AF2414B0();
    if (OUTLINED_FUNCTION_119(v28))
    {
      v26 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_WORD *)v26 = 0;
      v27 = "Failed to get country code";
LABEL_25:
      _os_log_impl(&dword_1AF203000, v24, v10, v27, v26, 2u);
      OUTLINED_FUNCTION_1();
    }
    goto LABEL_35;
  }
  v19 = v17;
  v20 = v18;
  if (qword_1EEE335E8 != -1)
    v17 = swift_once();
  v21 = OUTLINED_FUNCTION_5_10(v17, v18, qword_1EEE34060);
  if ((v21 & 1) == 0)
  {
    if (qword_1EEE335F0 != -1)
      v21 = swift_once();
    if ((OUTLINED_FUNCTION_5_10(v21, v22, qword_1EEE34068) & 1) == 0)
    {
      OUTLINED_FUNCTION_72();
      if (qword_1EEE335A0 != -1)
        swift_once();
      __swift_project_value_buffer(v2, (uint64_t)qword_1EEE34028);
      swift_bridgeObjectRetain();
      v29 = sub_1AF241198();
      v32 = sub_1AF2414A4();
      if (os_log_type_enabled(v29, v32))
      {
        v33 = (_DWORD *)OUTLINED_FUNCTION_4();
        v35 = OUTLINED_FUNCTION_4();
        *v33 = 136315138;
        swift_bridgeObjectRetain();
        sub_1AF208AF4(v19, v20, &v35);
        OUTLINED_FUNCTION_0_12();
        swift_bridgeObjectRelease_n();
        OUTLINED_FUNCTION_8_6(&dword_1AF203000, v29, v32, "#images disabled in country: %s");
        swift_arrayDestroy();
LABEL_34:
        OUTLINED_FUNCTION_1();
      }
      goto LABEL_38;
    }
  }
  OUTLINED_FUNCTION_96();
  if (qword_1EEE335F8 != -1)
    swift_once();
  if ((sub_1AF231880(v13, v14, qword_1EEE34070) & 1) == 0)
  {
    if (qword_1EEE335A0 != -1)
      swift_once();
    __swift_project_value_buffer(v2, (uint64_t)qword_1EEE34028);
    OUTLINED_FUNCTION_6_9();
    v29 = sub_1AF241198();
    v30 = sub_1AF2414A4();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (_DWORD *)OUTLINED_FUNCTION_4();
      v35 = OUTLINED_FUNCTION_4();
      *v31 = 136315138;
      OUTLINED_FUNCTION_6_9();
      sub_1AF208AF4(v13, v14, &v35);
      OUTLINED_FUNCTION_0_12();
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_8_6(&dword_1AF203000, v29, v30, "#images disabled for language: %s");
      swift_arrayDestroy();
      goto LABEL_34;
    }
LABEL_38:

    swift_bridgeObjectRelease_n();
    goto LABEL_36;
  }
  OUTLINED_FUNCTION_72();
  v23 = 1;
LABEL_37:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
  return v23;
}

uint64_t sub_1AF2312A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 80) = a4;
  return swift_task_switch();
}

uint64_t sub_1AF2312B8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  if (qword_1EEE33600 != -1)
    swift_once();
  v1 = qword_1EEE34090;
  v2 = byte_1EEE34098;
  v3 = xmmword_1EEE340A0;
  *(_QWORD *)(v0 + 88) = qword_1EEE34090;
  *(_QWORD *)(v0 + 96) = *((_QWORD *)&v3 + 1);
  v4 = qword_1EEE340B0;
  v5 = unk_1EEE340B8;
  *(_QWORD *)(v0 + 104) = unk_1EEE340B8;
  *(_OWORD *)(v0 + 16) = xmmword_1EEE34080;
  *(_QWORD *)(v0 + 32) = v1;
  *(_BYTE *)(v0 + 40) = v2;
  *(_OWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v0 + 64) = v4;
  *(_QWORD *)(v0 + 72) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 112) = v6;
  *v6 = v0;
  v6[1] = sub_1AF231388;
  return sub_1AF20C0F0(v0 + 16);
}

uint64_t sub_1AF231388()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 120) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_96();
  OUTLINED_FUNCTION_72();
  if (v0)
    return swift_task_switch();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1AF23142C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1AF231438()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AF231464()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1AF2314C4;
  v3[10] = v2;
  return swift_task_switch();
}

uint64_t sub_1AF2314C4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1AF23150C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = sub_1AF241420();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_1AF2268E8(a1);
  }
  else
  {
    sub_1AF241414();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1AF2413E4();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t ConfigurationManager.fetchHashtagImagesEnabled()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 80) = v0;
  return swift_task_switch();
}

uint64_t sub_1AF231644()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v4;
  char v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v2 = sub_1AF2204B8(5uLL);
  if (v2)
  {
    objc_msgSend(v2, sel_isEnabled);
    OUTLINED_FUNCTION_9_7();
    return (*(uint64_t (**)(uint64_t))(v1 + 8))(v0);
  }
  else
  {
    if (qword_1EEE33600 != -1)
      swift_once();
    v4 = qword_1EEE34090;
    v5 = byte_1EEE34098;
    v6 = xmmword_1EEE340A0;
    *(_QWORD *)(v1 + 88) = qword_1EEE34090;
    *(_QWORD *)(v1 + 96) = *((_QWORD *)&v6 + 1);
    v7 = qword_1EEE340B0;
    v8 = unk_1EEE340B8;
    *(_QWORD *)(v1 + 104) = unk_1EEE340B8;
    *(_OWORD *)(v1 + 16) = xmmword_1EEE34080;
    *(_QWORD *)(v1 + 32) = v4;
    *(_BYTE *)(v1 + 40) = v5;
    *(_OWORD *)(v1 + 48) = v6;
    *(_QWORD *)(v1 + 64) = v7;
    *(_QWORD *)(v1 + 72) = v8;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_6_9();
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 112) = v9;
    *v9 = v1;
    v9[1] = sub_1AF231760;
    return sub_1AF20C0F0(v1 + 16);
  }
}

uint64_t sub_1AF231760(uint64_t a1)
{
  void *v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  swift_task_dealloc();
  if (v1)
  {

    OUTLINED_FUNCTION_96();
    OUTLINED_FUNCTION_72();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_72();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v4 + 120) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_1AF231808()
{
  uint64_t v0;
  uint64_t v1;

  objc_msgSend(*(id *)(v1 + 120), sel_isEnabled);
  OUTLINED_FUNCTION_9_7();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(v0);
}

uint64_t sub_1AF23184C()
{
  uint64_t v0;
  Swift::Bool v1;

  v1 = ConfigurationManager.isHashtagImagesEnabledByDefault()();
  return (*(uint64_t (**)(Swift::Bool))(v0 + 8))(v1);
}

uint64_t sub_1AF231880(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_1AF2417EC();
    sub_1AF241300();
    v6 = sub_1AF241810();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1AF241744() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1AF241744() & 1) != 0)
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

uint64_t sub_1AF2319B4()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_1AF231A30()
{
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_13();
}

void sub_1AF231A64(uint64_t a1)
{
  sub_1AF2074A8(0, a1, (void (*)(uint64_t))PegasusClientName.rawValue.getter);
}

void sub_1AF231A88()
{
  sub_1AF231AC0();
}

void sub_1AF231AA4()
{
  sub_1AF231AC0();
}

void sub_1AF231AC0()
{
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_13();
}

void sub_1AF231AF4()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_34_0(v0);
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_13();
}

void sub_1AF231B1C()
{
  OUTLINED_FUNCTION_3_12();
  sub_1AF228BC4();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_53_0();
}

void sub_1AF231B5C(uint64_t a1)
{
  sub_1AF2074A8(0, a1, (void (*)(uint64_t))FeedbackStreamDescriptor.rawValue.getter);
}

void sub_1AF231B80()
{
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_13();
}

void sub_1AF231BB4()
{
  sub_1AF231EB4();
}

void sub_1AF231BC0()
{
  OUTLINED_FUNCTION_3_12();
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_13();
}

uint64_t sub_1AF231BE8()
{
  return sub_1AF241300();
}

uint64_t sub_1AF231C04()
{
  return sub_1AF241300();
}

void sub_1AF231C20(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1AF231C68()
{
  OUTLINED_FUNCTION_15_4();
  return OUTLINED_FUNCTION_16_2();
}

uint64_t sub_1AF231CB4(uint64_t a1, uint64_t a2)
{
  return sub_1AF231DB4(a1, a2, (void (*)(void))FeedbackStreamDescriptor.rawValue.getter);
}

void sub_1AF231CC0()
{
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_50();
}

void sub_1AF231CE8()
{
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_50();
}

uint64_t sub_1AF231D10()
{
  OUTLINED_FUNCTION_15_4();
  return OUTLINED_FUNCTION_16_2();
}

void sub_1AF231D88()
{
  sub_1AF2417F8();
  OUTLINED_FUNCTION_50();
}

uint64_t sub_1AF231DA8(uint64_t a1, uint64_t a2)
{
  return sub_1AF231DB4(a1, a2, (void (*)(void))PegasusClientName.rawValue.getter);
}

uint64_t sub_1AF231DB4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  sub_1AF241300();
  return swift_bridgeObjectRelease();
}

void sub_1AF231E00(uint64_t a1, uint64_t a2)
{
  sub_1AF2074A8(a1, a2, (void (*)(uint64_t))PegasusClientName.rawValue.getter);
}

void sub_1AF231E0C()
{
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_13();
}

uint64_t sub_1AF231E34()
{
  sub_1AF2417EC();
  sub_1AF2417F8();
  return sub_1AF241810();
}

void sub_1AF231E74()
{
  OUTLINED_FUNCTION_8_7();
  sub_1AF228BC4();
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_53_0();
}

void sub_1AF231EB4()
{
  OUTLINED_FUNCTION_8_7();
  sub_1AF241300();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_13();
}

void sub_1AF231F44()
{
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_13();
}

void sub_1AF231F78()
{
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_6_10();
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_13();
}

void sub_1AF231FAC()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_34_0(v0);
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_13();
}

void sub_1AF231FD4()
{
  sub_1AF23200C();
}

void sub_1AF231FF0()
{
  sub_1AF23200C();
}

void sub_1AF23200C()
{
  OUTLINED_FUNCTION_8_7();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_13();
}

uint64_t sub_1AF232044(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s *v2;

  OUTLINED_FUNCTION_38_0();
  os_unfair_lock_lock(v2);
  *(_QWORD *)(v1 + 48) = a1;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_96();
  os_unfair_lock_unlock(v2);
  return swift_release();
}

void sub_1AF2320A8()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  v1 = *(_BYTE *)(v0 + 80);
  v6[3] = &type metadata for ResourceNetworkActivity;
  v6[4] = &off_1E5F3C588;
  LOBYTE(v6[0]) = v1;
  v2 = *(char *)__swift_project_boxed_opaque_existential_1(v6, (uint64_t)&type metadata for ResourceNetworkActivity);
  if (qword_1EEE33550 != -1)
    goto LABEL_9;
  while (1)
  {
    v3 = *(_QWORD *)(qword_1EEE33FF8 + 16);
    if (!v3)
      break;
    v4 = 0;
    while (1)
    {
      v5 = v4 + 1;
      if (__OFADD__(v4, 1))
        break;
      if (qword_1AF245548[*(char *)(qword_1EEE33FF8 + 32 + v4)] != qword_1AF245548[v2])
      {
        ++v4;
        if (v5 != v3)
          continue;
      }
      goto LABEL_7;
    }
    __break(1u);
LABEL_9:
    swift_once();
  }
LABEL_7:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  OUTLINED_FUNCTION_47_0();
}

void sub_1AF23217C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  v1 = *(_BYTE *)(v0 + 80);
  v6[3] = &type metadata for ResourceAccessActivity;
  v6[4] = &off_1E5F3C3E0;
  LOBYTE(v6[0]) = v1;
  v2 = *(char *)__swift_project_boxed_opaque_existential_1(v6, (uint64_t)&type metadata for ResourceAccessActivity);
  if (qword_1EEE335D0 != -1)
    goto LABEL_9;
  while (1)
  {
    v3 = *(_QWORD *)(qword_1EEE34058 + 16);
    if (!v3)
      break;
    v4 = 0;
    while (1)
    {
      v5 = v4 + 1;
      if (__OFADD__(v4, 1))
        break;
      if (qword_1AF245548[*(char *)(qword_1EEE34058 + 32 + v4)] != qword_1AF245548[v2])
      {
        ++v4;
        if (v5 != v3)
          continue;
      }
      goto LABEL_7;
    }
    __break(1u);
LABEL_9:
    swift_once();
  }
LABEL_7:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  OUTLINED_FUNCTION_47_0();
}

uint64_t sub_1AF232250()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v1 = sub_1AF240F04();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + *(_QWORD *)(*(_QWORD *)v0 + 144), v1);
  sub_1AF240EB0();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_1AF232320()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t Strong;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  os_unfair_lock_s *v30;
  uint64_t v31;
  uint64_t ObjectType;
  void (*v33)(uint64_t, _UNKNOWN **, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E948);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v36 - v6;
  v9 = v0 + 24;
  v8 = *(_QWORD *)(v0 + 24);
  v37 = *(_QWORD *)(v0 + 32);
  v38 = v8;
  v10 = *(_BYTE *)(v0 + 40);
  v11 = *(_BYTE *)(v0 + 41);
  v13 = (_QWORD *)(v0 + 48);
  v12 = *(_QWORD *)(v0 + 48);
  v14 = *(_QWORD *)(v1 + 56);
  v15 = *(_QWORD *)(v1 + 64);
  v39 = *(_QWORD *)(v1 + 72);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v40 = v15;
  swift_bridgeObjectRetain();
  v41 = v12;
  sub_1AF232F68(v12);
  v16 = *(_BYTE *)(v1 + 80);
  v17 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 136);
  if ((v11 & 1) == 0 && v14)
  {
    swift_beginAccess();
    sub_1AF20CDCC(v17, (uint64_t)v7);
    v18 = sub_1AF241138();
    result = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v18);
    if ((_DWORD)result != 1)
    {
      v20 = *(_QWORD *)(v1 + 88);
      swift_bridgeObjectRetain();
      v21 = sub_1AF2414D4();
      v22 = sub_1AF232A00(v16);
      LOBYTE(v35) = v10;
      sub_1AF20CB84(v21, v20, v22, v23, 2, (uint64_t)v7, v38, v37, v35, v14);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v7, v18);
      goto LABEL_7;
    }
LABEL_15:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  sub_1AF20CDCC(v17, (uint64_t)v5);
  v24 = sub_1AF241138();
  result = __swift_getEnumTagSinglePayload((uint64_t)v5, 1, v24);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_15;
  }
  sub_1AF2414D4();
  sub_1AF232A00(v16);
  sub_1AF241108();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v5, v24);
LABEL_7:
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v26 = Strong;
    v42 = v1;
    swift_retain();
    v27 = sub_1AF2412AC();
    v29 = v28;
    v30 = *(os_unfair_lock_s **)(*(_QWORD *)(v26 + 32) + 16);
    os_unfair_lock_lock(v30);
    sub_1AF20CE14(v26, v27, v29, v1, (uint64_t)&off_1E5F3BC20);
    os_unfair_lock_unlock(v30);
    swift_bridgeObjectRelease();
    if (MEMORY[0x1AF45A960](v26 + 16))
    {
      v31 = *(_QWORD *)(v26 + 24);
      ObjectType = swift_getObjectType();
      v33 = *(void (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v31 + 16);
      v34 = swift_retain();
      v33(v34, &off_1E5F3BC20, ObjectType, v31);
      swift_release_n();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_release();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    *(_QWORD *)v9 = 0;
    *(_QWORD *)(v9 + 8) = 0;
    *(_BYTE *)(v9 + 16) = 0;
    *(_BYTE *)(v1 + 41) = 1;
    *v13 = 0;
    v13[1] = 0;
    *(_QWORD *)(v1 + 64) = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)(v1 + 72) = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    *(_BYTE *)(v1 + 81) = 1;
    return swift_weakAssign();
  }
  else
  {
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

void sub_1AF2326E0()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E948);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_17_2();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_4_11();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_163();
  OUTLINED_FUNCTION_42_0();
  sub_1AF23314C(v0);
  OUTLINED_FUNCTION_39_0();
  if ((v2 & 1) != 0 || !v1)
  {
    OUTLINED_FUNCTION_5_11();
    OUTLINED_FUNCTION_41_0();
    v18 = OUTLINED_FUNCTION_26_3();
    OUTLINED_FUNCTION_48_0(v18);
    if (!v7)
    {
      sub_1AF2414D4();
      OUTLINED_FUNCTION_9_8();
      OUTLINED_FUNCTION_28_2();
      v16 = OUTLINED_FUNCTION_44_0();
      goto LABEL_7;
    }
    __break(1u);
LABEL_17:
    __break(1u);
    return;
  }
  OUTLINED_FUNCTION_5_11();
  OUTLINED_FUNCTION_40_0();
  v6 = OUTLINED_FUNCTION_26_3();
  OUTLINED_FUNCTION_30_1(v6);
  if (v7)
    goto LABEL_17;
  OUTLINED_FUNCTION_163();
  sub_1AF2414D4();
  v8 = OUTLINED_FUNCTION_9_8();
  OUTLINED_FUNCTION_2_13(v8, v9, v10, v11, v12, v13, v14, v15, v25, v26);
  OUTLINED_FUNCTION_95();
  v16 = OUTLINED_FUNCTION_50_0();
LABEL_7:
  v17(v16);
  if (OUTLINED_FUNCTION_43_0())
  {
    OUTLINED_FUNCTION_21_1();
    sub_1AF2412AC();
    OUTLINED_FUNCTION_10_4();
    OUTLINED_FUNCTION_18_0(v19, v20, v21, v22, (uint64_t)&off_1E5F3BC20);
    os_unfair_lock_unlock(v2);
    OUTLINED_FUNCTION_96();
    if (MEMORY[0x1AF45A960](v3 + 16))
    {
      OUTLINED_FUNCTION_35_0();
      v23 = OUTLINED_FUNCTION_22_1();
      OUTLINED_FUNCTION_32_0(v23, (uint64_t)&off_1E5F3BC20);
      OUTLINED_FUNCTION_51_0();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_release();
    }
    OUTLINED_FUNCTION_52_0();
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_95();
    OUTLINED_FUNCTION_40();
    swift_release();
    OUTLINED_FUNCTION_14_5();
    *(_QWORD *)(v0 + 64) = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)(v0 + 72) = 0;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_37_0();
    OUTLINED_FUNCTION_27_2();
  }
  else
  {
    sub_1AF2320A8();
    if ((v24 & 1) != 0)
    {
      sub_1AF2414BC();
      OUTLINED_FUNCTION_20_2();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_95();
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_78();
}

void sub_1AF2328EC()
{
  sub_1AF2417F8();
  OUTLINED_FUNCTION_50();
}

void sub_1AF23290C()
{
  OUTLINED_FUNCTION_3_12();
  sub_1AF2417F8();
  OUTLINED_FUNCTION_1_13();
  OUTLINED_FUNCTION_0_13();
}

void sub_1AF23293C()
{
  sub_1AF23290C();
}

void sub_1AF232944()
{
  sub_1AF2328EC();
}

uint64_t sub_1AF23294C()
{
  if (qword_1EEE334B0 != -1)
    swift_once();
  qword_1ED330198 = qword_1EEE33F70;
  unk_1ED3301A0 = *(_QWORD *)algn_1EEE33F78;
  return swift_bridgeObjectRetain();
}

uint64_t *sub_1AF23299C()
{
  if (qword_1ED32E4E8 != -1)
    swift_once();
  return &qword_1ED330198;
}

uint64_t sub_1AF2329DC()
{
  return 0x656372756F736572;
}

uint64_t sub_1AF232A00(unsigned __int8 a1)
{
  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_1AF232A2C + 4 * byte_1AF244FF4[a1]))("unknown", 7);
}

const char *sub_1AF232A2C()
{
  return "parsecSession";
}

unint64_t sub_1AF232AAC(unint64_t result)
{
  if (result >= 9)
    return 9;
  return result;
}

uint64_t sub_1AF232ABC(uint64_t result)
{
  return result;
}

uint64_t sub_1AF232AC4()
{
  return sub_1AF231E34();
}

unint64_t sub_1AF232ACC@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_1AF232AAC(*a1);
  *a2 = result;
  return result;
}

void sub_1AF232AF4(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = sub_1AF232ABC(*v1);
  OUTLINED_FUNCTION_50();
}

uint64_t sub_1AF232B18()
{
  uint64_t v0;

  v0 = qword_1ED32EA60;
  OUTLINED_FUNCTION_1_0();
  return v0;
}

uint64_t sub_1AF232B48()
{
  uint64_t v0;

  sub_1AF23299C();
  v0 = qword_1ED330198;
  OUTLINED_FUNCTION_1_0();
  return v0;
}

uint64_t sub_1AF232B7C()
{
  unsigned __int8 *v0;

  return sub_1AF232A00(*v0);
}

uint64_t sub_1AF232B9C(uint64_t a1)
{
  uint64_t inited;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA28);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1AF242860;
  *(_QWORD *)(inited + 32) = 0x7365747962;
  *(_QWORD *)(inited + 40) = 0xE500000000000000;
  *(_QWORD *)(inited + 48) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithInteger_, a1);
  sub_1AF229DF0();
  return sub_1AF241210();
}

uint64_t sub_1AF232C3C()
{
  uint64_t *v0;

  return sub_1AF232B9C(*v0);
}

uint64_t sub_1AF232C44()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void sub_1AF232C4C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = v1;
  v3 = *v1;
  MEMORY[0x1E0C80A78](a1);
  v5 = (os_unfair_lock_s *)((char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if ((*((_BYTE *)v2 + 81) & 1) == 0)
  {
    OUTLINED_FUNCTION_24_3();
    v6 = *(_QWORD *)(v3 + 456);
    v7 = OUTLINED_FUNCTION_25_2(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    OUTLINED_FUNCTION_36_0();
    sub_1AF232044(v7);
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_1AF242860;
    OUTLINED_FUNCTION_24_3();
    v9 = OUTLINED_FUNCTION_25_2(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 16));
    OUTLINED_FUNCTION_36_0();
    v10 = MEMORY[0x1E0DEB490];
    *(_QWORD *)(v8 + 56) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(v8 + 64) = v10;
    *(_QWORD *)(v8 + 32) = v9;
    sub_1AF20C060((uint64_t)"bytesWritten=%{signpost.description:attribute,public}llu", 56, 2, v8);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_38_0();
    os_unfair_lock_lock(v5);
    if ((*((_BYTE *)v2 + 81) & 1) == 0)
      sub_1AF232320();
    os_unfair_lock_unlock(v5);
    swift_release();
  }
  OUTLINED_FUNCTION_78();
}

uint64_t sub_1AF232DA0()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;

  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 448) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 472));
}

void sub_1AF232DE4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *v1;
  if ((*((_BYTE *)v1 + 81) & 1) == 0)
    sub_1AF232C4C(a1);
  sub_1AF206EE0();
  v4 = v3;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v2 + 448) - 8) + 8))(v4 + *(_QWORD *)(*(_QWORD *)v4 + 472));
  OUTLINED_FUNCTION_49();
}

uint64_t sub_1AF232E44(uint64_t a1)
{
  sub_1AF232DE4(a1);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DiskWriteSpan(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DiskWriteSpan);
}

void type metadata accessor for DiskWriteActivity()
{
  OUTLINED_FUNCTION_103();
}

unint64_t sub_1AF232E84(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1AF232EB0();
  result = sub_1AF232EEC();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1AF232EB0()
{
  unint64_t result;

  result = qword_1ED32E800;
  if (!qword_1ED32E800)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF245108, &unk_1E5F3BEE0);
    atomic_store(result, (unint64_t *)&qword_1ED32E800);
  }
  return result;
}

unint64_t sub_1AF232EEC()
{
  unint64_t result;

  result = qword_1ED32E810;
  if (!qword_1ED32E810)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF2450D0, &unk_1E5F3BEE0);
    atomic_store(result, (unint64_t *)&qword_1ED32E810);
  }
  return result;
}

unint64_t sub_1AF232F2C()
{
  unint64_t result;

  result = qword_1ED32E808;
  if (!qword_1ED32E808)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF245148, &unk_1E5F3BEE0);
    atomic_store(result, (unint64_t *)&qword_1ED32E808);
  }
  return result;
}

void sub_1AF232F68(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (sub_1AF233324(a1))
  {
    sub_1AF2414A4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1AF242870;
    if (qword_1ED32E4E8 != -1)
      swift_once();
    v2 = qword_1ED330198;
    v3 = unk_1ED3301A0;
    v4 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    v5 = sub_1AF20BFF4();
    *(_QWORD *)(v1 + 64) = v5;
    *(_QWORD *)(v1 + 32) = v2;
    *(_QWORD *)(v1 + 40) = v3;
    sub_1AF229DF0();
    swift_bridgeObjectRetain();
    v6 = sub_1AF241204();
    *(_QWORD *)(v1 + 96) = v4;
    *(_QWORD *)(v1 + 104) = v5;
    *(_QWORD *)(v1 + 72) = v6;
    *(_QWORD *)(v1 + 80) = v7;
    sub_1AF2410F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1AF21BE5C();
    v8 = (void *)sub_1AF24124C();
    swift_bridgeObjectRelease();
    v9 = (id)sub_1AF2411EC();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
}

void sub_1AF23314C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (sub_1AF233464(a1))
  {
    sub_1AF2414A4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
    v1 = swift_allocObject();
    *(_OWORD *)(v1 + 16) = xmmword_1AF242870;
    if (qword_1ED32E4F8 != -1)
      swift_once();
    v2 = qword_1ED330188;
    v3 = unk_1ED330190;
    v4 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    v5 = sub_1AF20BFF4();
    *(_QWORD *)(v1 + 64) = v5;
    *(_QWORD *)(v1 + 32) = v2;
    *(_QWORD *)(v1 + 40) = v3;
    sub_1AF229DF0();
    swift_bridgeObjectRetain();
    v6 = sub_1AF241204();
    *(_QWORD *)(v1 + 96) = v4;
    *(_QWORD *)(v1 + 104) = v5;
    *(_QWORD *)(v1 + 72) = v6;
    *(_QWORD *)(v1 + 80) = v7;
    sub_1AF2410F0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1AF21BE5C();
    v8 = (void *)sub_1AF24124C();
    swift_bridgeObjectRelease();
    v9 = (id)sub_1AF2411EC();
    AnalyticsSendEvent();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_1AF233324(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = dynamic_cast_existential_1_unconditional((uint64_t)&unk_1E5F3BEE0);
  if (!a1)
    return 0;
  v4 = v2;
  v5 = v3;
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  swift_bridgeObjectRetain();
  v7 = v6(v4, v5);
  v9 = v8;
  v10 = sub_1AF241570();
  swift_isUniquelyReferenced_nonNull_native();
  sub_1AF21ECE8(v10, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  v13 = v12;
  sub_1AF232250();
  v14 = sub_1AF24145C();
  swift_isUniquelyReferenced_nonNull_native();
  sub_1AF21ECE8(v14, v11, v13);
  v15 = a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1AF233464(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = dynamic_cast_existential_1_unconditional((uint64_t)&type metadata for ResourceNetworkActivity);
  if (!a1)
    return 0;
  v4 = v2;
  v5 = v3;
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  swift_bridgeObjectRetain();
  v7 = v6(v4, v5);
  v9 = v8;
  v10 = sub_1AF241570();
  swift_isUniquelyReferenced_nonNull_native();
  sub_1AF21ECE8(v10, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
  v13 = v12;
  sub_1AF232250();
  v14 = sub_1AF24145C();
  swift_isUniquelyReferenced_nonNull_native();
  sub_1AF21ECE8(v14, v11, v13);
  v15 = a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1AF2335AC(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xF8)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 9;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v5 = v6 - 9;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_1AF233634(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1AF233680 + 4 * byte_1AF245002[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_1AF2336B4 + 4 * byte_1AF244FFD[v4]))();
}

uint64_t sub_1AF2336B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF2336BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1AF2336C4);
  return result;
}

uint64_t sub_1AF2336D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1AF2336D8);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_1AF2336DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1AF2336E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for DiskWriteError()
{
  OUTLINED_FUNCTION_103();
}

void type metadata accessor for BasicDiskOperationMetrics()
{
  OUTLINED_FUNCTION_103();
}

unint64_t sub_1AF23370C()
{
  unint64_t result;

  result = qword_1EEE33DB0;
  if (!qword_1EEE33DB0)
  {
    result = MEMORY[0x1AF45A834](&unk_1AF2451EC, &unk_1E5F3BD50);
    atomic_store(result, (unint64_t *)&qword_1EEE33DB0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_14_5()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t result;

  result = *(_QWORD *)(v0 + 64);
  *(_QWORD *)v2 = 0;
  *(_QWORD *)(v2 + 8) = 0;
  *(_BYTE *)(v2 + 16) = 0;
  *(_BYTE *)(v0 + 41) = 1;
  *v1 = 0;
  v1[1] = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return sub_1AF2410F0();
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_25_2@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_27_2()
{
  uint64_t v0;
  char v1;

  *(_BYTE *)(v0 + 81) = v1;
  return swift_weakAssign();
}

uint64_t OUTLINED_FUNCTION_28_2()
{
  return sub_1AF241108();
}

uint64_t OUTLINED_FUNCTION_30_1(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return sub_1AF241228();
}

void OUTLINED_FUNCTION_34_0(uint64_t a1, ...)
{
  char v1;
  va_list va;

  va_start(va, a1);
  sub_1AF231C20((uint64_t)va, v1);
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return swift_weakLoadStrong();
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return sub_1AF2417F8();
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return swift_unknownObjectRelease();
}

void Client.init(_:)(unint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v4;
  unint64_t v5;

  if (a1 >= 0x1A)
  {
    sub_1AF241780();
    __break(1u);
  }
  else
  {
    v4 = PegasusClientName.rawValue.getter();
    *a2 = a1;
    a2[1] = v4;
    a2[2] = v5;
    OUTLINED_FUNCTION_5_12();
  }
}

void sub_1AF2338EC()
{
  qword_1ED32F7D0 = 0x6E776F6E6B6E55;
  *(_QWORD *)algn_1ED32F7D8 = 0xE700000000000000;
}

void static Client.unknownClientName.getter()
{
  if (qword_1ED32ED00 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_50();
}

double sub_1AF233968()
{
  double result;

  *(_QWORD *)&result = 7;
  xmmword_1ED32EA98 = xmmword_1AF2439B0;
  qword_1ED32EAA8 = 0xE700000000000000;
  return result;
}

double sub_1AF233988()
{
  double result;

  *(_QWORD *)&result = 16;
  xmmword_1ED32F7E0 = xmmword_1AF2456B0;
  qword_1ED32F7F0 = 0xEA00000000007469;
  return result;
}

uint64_t static Client.pegasuskit.getter@<X0>(uint64_t a1@<X8>)
{
  return OUTLINED_FUNCTION_4_12(&qword_1ED32F810, (uint64_t)&xmmword_1ED32F7E0, a1);
}

double sub_1AF2339C8()
{
  double result;

  result = 0.0;
  xmmword_1ED32E500 = xmmword_1AF2439C0;
  qword_1ED32E510 = 0xE700000000000000;
  return result;
}

uint64_t static Client.unknown.getter@<X0>(uint64_t a1@<X8>)
{
  return OUTLINED_FUNCTION_4_12(&qword_1ED32E458, (uint64_t)&xmmword_1ED32E500, a1);
}

uint64_t sub_1AF233A04@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X1>, _OWORD *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;

  if (*a1 != -1)
    swift_once();
  v7 = *a2;
  *(_OWORD *)a4 = *a3;
  *(_QWORD *)(a4 + 16) = v7;
  return swift_bridgeObjectRetain();
}

double Client.init(_:)@<D0>(_BYTE *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  double result;
  __int128 v6;
  uint64_t v7;

  LOBYTE(v6) = *a1;
  PegasusClientName.rawValue.getter();
  Client.init(_:)(v3, (uint64_t *)&v6);
  v4 = v7;
  result = *(double *)&v6;
  *(_OWORD *)a2 = v6;
  *(_QWORD *)(a2 + 16) = v4;
  return result;
}

unint64_t ClientType.init(rawValue:)(unint64_t result)
{
  if (result > 0x19)
    return 0;
  return result;
}

BOOL sub_1AF233AB4(uint64_t *a1, uint64_t *a2)
{
  return sub_1AF21F8CC(*a1, *a2);
}

void sub_1AF233AC0()
{
  sub_1AF231BC0();
}

void sub_1AF233AC8()
{
  sub_1AF231D88();
}

void sub_1AF233AD0()
{
  sub_1AF231E0C();
}

unint64_t sub_1AF233AD8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = ClientType.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_1AF233B08(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void *sub_1AF233B14(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1AF2416D8();
  __break(1u);
  return result;
}

uint64_t sub_1AF233BD8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1AF233C6C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_1AF233E40(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_1AF233E40((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1AF233C6C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_1AF241354();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x1E0DEE9D8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
LABEL_6:
  v3 = sub_1AF233DDC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_1AF24163C();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_1AF2416D8();
  __break(1u);
LABEL_14:
  result = sub_1AF2416A8();
  __break(1u);
  return result;
}

_QWORD *sub_1AF233DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32EA30);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1AF233E40(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32EA30);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1AF233FD8(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1AF233F14(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1AF233F14(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1AF2416D8();
  __break(1u);
  return result;
}

char *sub_1AF233FD8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1AF2416D8();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_1AF23405C()
{
  unint64_t result;

  result = qword_1EEE33DB8;
  if (!qword_1EEE33DB8)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for ClientType, &type metadata for ClientType);
    atomic_store(result, (unint64_t *)&qword_1EEE33DB8);
  }
  return result;
}

_QWORD *assignWithCopy for Client(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for Client(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Client(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Client(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientType()
{
  return &type metadata for ClientType;
}

uint64_t SessionType.hashValue.getter()
{
  sub_1AF2417EC();
  SessionType.hash(into:)();
  return sub_1AF241810();
}

unint64_t SessionType.serverExperimentNamespace.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 8);
  if (v1 == 12)
    return 0xD00000000000001FLL;
  v2 = 0xD000000000000010;
  v3 = 0xD000000000000012;
  if (v1 != 1)
    v3 = 0;
  if (v1 != 6)
    v2 = v3;
  if (v1 == 2)
    return 0xD000000000000015;
  else
    return v2;
}

unint64_t SessionType.deviceExperimentNamespace.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = 0xD000000000000012;
  v3 = 0x4847494C544F5053;
  if (v1 != 2)
    v3 = 0;
  if (v1 != 11)
    v2 = v3;
  if (v1 == 1)
    return 0xD000000000000015;
  else
    return v2;
}

uint64_t SessionType.init(withClientIdentifier:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11[2];

  v3 = result;
  if (a2)
  {
    v3 = sub_1AF2412B8();
    v6 = v5;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_14();
    sub_1AF208AB8();
    if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
    {
      result = OUTLINED_FUNCTION_95();
      v3 = 0;
      v6 = 1;
    }
    else
    {
      OUTLINED_FUNCTION_3_14();
      if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
      {
        result = OUTLINED_FUNCTION_95();
        v3 = 0;
        v6 = 2;
      }
      else
      {
        OUTLINED_FUNCTION_3_14();
        if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
        {
          result = OUTLINED_FUNCTION_95();
          v3 = 0;
          v6 = 3;
        }
        else
        {
          OUTLINED_FUNCTION_3_14();
          if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
          {
            result = OUTLINED_FUNCTION_95();
            v3 = 0;
            v6 = 4;
          }
          else
          {
            OUTLINED_FUNCTION_3_14();
            if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
            {
              result = OUTLINED_FUNCTION_95();
              v3 = 0;
              v6 = 5;
            }
            else
            {
              OUTLINED_FUNCTION_3_14();
              if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
              {
                result = OUTLINED_FUNCTION_95();
                v3 = 0;
                v6 = 6;
              }
              else
              {
                OUTLINED_FUNCTION_3_14();
                if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                {
                  result = OUTLINED_FUNCTION_95();
                  v3 = 0;
                  v6 = 8;
                }
                else
                {
                  v11[0] = 0xD000000000000010;
                  v11[1] = 0x80000001AF245ED0;
                  if ((OUTLINED_FUNCTION_0_14() & 1) != 0
                    || (OUTLINED_FUNCTION_3_14(), (OUTLINED_FUNCTION_0_14() & 1) != 0))
                  {
                    result = OUTLINED_FUNCTION_95();
                    v3 = 0;
                    v6 = 9;
                  }
                  else
                  {
                    OUTLINED_FUNCTION_3_14();
                    if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                    {
                      result = OUTLINED_FUNCTION_95();
                      v3 = 0;
                      v6 = 10;
                    }
                    else
                    {
                      OUTLINED_FUNCTION_3_14();
                      if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                      {
                        result = OUTLINED_FUNCTION_95();
                        v3 = 0;
                        v6 = 11;
                      }
                      else
                      {
                        OUTLINED_FUNCTION_3_14();
                        if ((OUTLINED_FUNCTION_0_14() & 1) != 0
                          || (OUTLINED_FUNCTION_3_14(), (OUTLINED_FUNCTION_0_14() & 1) != 0))
                        {
                          result = OUTLINED_FUNCTION_95();
                          v3 = 0;
                          v6 = 12;
                        }
                        else
                        {
                          OUTLINED_FUNCTION_3_14();
                          if ((OUTLINED_FUNCTION_0_14() & 1) != 0
                            || (OUTLINED_FUNCTION_3_14(), (OUTLINED_FUNCTION_0_14() & 1) != 0))
                          {
                            result = OUTLINED_FUNCTION_95();
                            v3 = 0;
                            v6 = 13;
                          }
                          else
                          {
                            OUTLINED_FUNCTION_3_14();
                            if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                            {
                              result = OUTLINED_FUNCTION_95();
                              v3 = 0;
                              v6 = 15;
                            }
                            else
                            {
                              OUTLINED_FUNCTION_3_14();
                              if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                              {
                                result = OUTLINED_FUNCTION_95();
                                v3 = 0;
                                v6 = 16;
                              }
                              else
                              {
                                OUTLINED_FUNCTION_3_14();
                                if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                                {
                                  result = OUTLINED_FUNCTION_95();
                                  v3 = 0;
                                  v6 = 14;
                                }
                                else
                                {
                                  OUTLINED_FUNCTION_3_14();
                                  if ((OUTLINED_FUNCTION_0_14() & 1) != 0)
                                  {
                                    result = OUTLINED_FUNCTION_95();
                                    v3 = 0;
                                    v6 = 7;
                                  }
                                  else
                                  {
                                    if (qword_1ED32EC10 != -1)
                                      swift_once();
                                    v7 = sub_1AF2411B0();
                                    __swift_project_value_buffer(v7, (uint64_t)qword_1ED330210);
                                    swift_bridgeObjectRetain_n();
                                    v8 = sub_1AF241198();
                                    v9 = sub_1AF2414B0();
                                    if (os_log_type_enabled(v8, v9))
                                    {
                                      v10 = (uint8_t *)swift_slowAlloc();
                                      v11[0] = swift_slowAlloc();
                                      *(_DWORD *)v10 = 136446210;
                                      swift_bridgeObjectRetain();
                                      sub_1AF208AF4(v3, v6, v11);
                                      sub_1AF24157C();
                                      swift_bridgeObjectRelease_n();
                                      _os_log_impl(&dword_1AF203000, v8, v9, "Failed to get session type for %{public}s", v10, 0xCu);
                                      swift_arrayDestroy();
                                      OUTLINED_FUNCTION_1();
                                    }

                                    result = swift_bridgeObjectRelease_n();
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
          }
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }
  *a3 = v3;
  a3[1] = v6;
  return result;
}

void SessionType.clientType.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 8);
  if ((unint64_t)(v1 - 1) >= 0x10)
  {
    OUTLINED_FUNCTION_101();
    Client.init(_:)(v1, &v2);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_19_3();
}

uint64_t SessionType.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v2 = *v0;
  v1 = v0[1];
  if ((unint64_t)(v1 - 1) >= 0x10)
  {
    if (v1)
      OUTLINED_FUNCTION_101();
    else
      OUTLINED_FUNCTION_29_1();
  }
  else
  {
    sub_1AF20A01C(v2, v1);
    SessionType.biomeStreamDescriptor.getter(&v5);
    if (v5 == 17)
    {
      OUTLINED_FUNCTION_25_3();
      OUTLINED_FUNCTION_29_1();
    }
    else
    {
      v3 = OUTLINED_FUNCTION_27_3();
      OUTLINED_FUNCTION_25_3();
      return v3;
    }
  }
  return v2;
}

uint64_t SessionType.canonicalIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char v4;

  v1 = *v0;
  v2 = v0[1];
  if ((unint64_t)(v2 - 1) >= 0x10)
  {
    if (v2)
    {
      swift_bridgeObjectRetain();
      return v1;
    }
    return 0x6E776F6E6B6E753CLL;
  }
  SessionType.biomeStreamDescriptor.getter(&v4);
  if (v4 == 17)
    return 0x6E776F6E6B6E753CLL;
  return OUTLINED_FUNCTION_27_3();
}

void SessionType.biomeStreamDescriptor.getter(char *a1@<X8>)
{
  uint64_t v1;
  char v3;
  char v4;
  char v5;

  v3 = 2;
  switch(*(_QWORD *)(v1 + 8))
  {
    case 1:
      if (qword_1EEE33520 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_15();
      if (v4)
        v3 = 17;
      else
        v3 = 1;
      break;
    case 2:
      break;
    case 3:
      if (qword_1EEE33520 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_15();
      v5 = 3;
      goto LABEL_47;
    case 4:
      if (qword_1EEE33520 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_15();
      v5 = 4;
      goto LABEL_47;
    case 5:
      if (qword_1EEE33520 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_15();
      v5 = 5;
      goto LABEL_47;
    case 6:
      if (qword_1EEE33520 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_15();
      v5 = 6;
      goto LABEL_47;
    case 7:
      if (qword_1EEE33520 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_15();
      v5 = 7;
      goto LABEL_47;
    case 8:
      if (qword_1EEE33520 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_15();
      v5 = 8;
      goto LABEL_47;
    case 9:
      if (qword_1EEE33520 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_15();
      v5 = 9;
      goto LABEL_47;
    case 0xALL:
      if (qword_1EEE33520 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_15();
      v5 = 10;
      goto LABEL_47;
    case 0xBLL:
      if (qword_1EEE33520 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_15();
      v5 = 11;
      goto LABEL_47;
    case 0xCLL:
      if (qword_1EEE33520 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_15();
      v5 = 12;
      goto LABEL_47;
    case 0xDLL:
      if (qword_1EEE33520 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_15();
      v5 = 13;
      goto LABEL_47;
    case 0xELL:
      if (qword_1EEE33520 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_15();
      v5 = 14;
      goto LABEL_47;
    case 0xFLL:
      if (qword_1EEE33520 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_15();
      v5 = 15;
LABEL_47:
      if (v4)
        v3 = 17;
      else
        v3 = v5;
      break;
    case 0x10:
      if (qword_1EEE33520 != -1)
        swift_once();
      OUTLINED_FUNCTION_1_15();
      if (v4)
        v3 = 17;
      else
        v3 = 16;
      break;
    default:
      v3 = 17;
      break;
  }
  *a1 = v3;
}

BOOL SessionType.donationToBiomeIsImplemented.getter()
{
  char v1;

  SessionType.biomeStreamDescriptor.getter(&v1);
  return v1 != 17;
}

char *SessionType.allStreamDescriptors.getter()
{
  char v0;
  char *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  char v6;

  SessionType.biomeStreamDescriptor.getter(&v6);
  v0 = v6;
  if (v6 == 17)
    return (char *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC88);
  v2 = OUTLINED_FUNCTION_22();
  *(_OWORD *)(v2 + 16) = xmmword_1AF242860;
  *(_BYTE *)(v2 + 32) = v0;
  swift_bridgeObjectRetain();
  v1 = (char *)v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v1 = sub_1AF2357E4(0, 2, 1, v2);
  v4 = *((_QWORD *)v1 + 2);
  v3 = *((_QWORD *)v1 + 3);
  if (v4 >= v3 >> 1)
    v1 = sub_1AF2357E4((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v1);
  *((_QWORD *)v1 + 2) = v4 + 1;
  v1[v4 + 32] = 0;
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t Collection<>.biomeStreamDescriptors.getter()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EEE33CC8);
  sub_1AF236648();
  v0 = sub_1AF241378();
  return sub_1AF235028(v0);
}

char *sub_1AF234FE0@<X0>(char **a1@<X8>)
{
  char *result;

  result = SessionType.allStreamDescriptors.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1AF235028(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t v9;

  sub_1AF20DCC8();
  v2 = sub_1AF241474();
  v9 = v2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      v5 = a1 + i;
      sub_1AF2368E0(&v8, *(unsigned __int8 *)(v5 + 32));
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    v6 = v2;
    swift_bridgeObjectRelease();
  }
  return v6;
}

char *SessionType.init(forStream:)@<X0>(char *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = qword_1AF245990[*result];
  *a2 = 0;
  a2[1] = v2;
  return result;
}

void SessionType.init(withCanonicalIdentifier:)(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  FeedbackStreamDescriptor.init(rawValue:)(*(Swift::String *)&a1);
  if (v7 == 17)
  {
    v4 = 0;
    v5 = 17;
  }
  else
  {
    v6 = v7;
    SessionType.init(forStream:)(&v6, &v7);
    v5 = v8;
    if (v8 == 17)
      v4 = 0;
    else
      v4 = v7;
  }
  *a2 = v4;
  a2[1] = v5;
  OUTLINED_FUNCTION_19_3();
}

uint64_t sub_1AF235140()
{
  uint64_t result;

  result = sub_1AF23515C();
  qword_1EEE33DC0 = result;
  return result;
}

uint64_t sub_1AF23515C()
{
  _QWORD *v0;
  uint64_t v1;

  v0 = static FeedbackStreamDescriptor.allCases.getter();
  if (v0[2])
    __asm { BR              X8 }
  v1 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRelease();
  return v1;
}

void static SessionType.allKnownCases.getter()
{
  if (qword_1EEE33610 != -1)
    swift_once();
  OUTLINED_FUNCTION_30();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_19_3();
}

void static SessionType.allKnownCases.setter(uint64_t a1)
{
  if (qword_1EEE33610 != -1)
    swift_once();
  OUTLINED_FUNCTION_30();
  qword_1EEE33DC0 = a1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_19_3();
}

uint64_t (*static SessionType.allKnownCases.modify())()
{
  if (qword_1EEE33610 != -1)
    swift_once();
  OUTLINED_FUNCTION_30();
  return j__swift_endAccess;
}

void sub_1AF235428(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  unint64_t v16;
  uint64_t v17;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_9_9();
    if (v9 != v10)
    {
      OUTLINED_FUNCTION_31_1();
      if (v9)
      {
        __break(1u);
        goto LABEL_22;
      }
      OUTLINED_FUNCTION_11_7();
    }
  }
  else
  {
    v8 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v8 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v8;
  if (!v12)
    goto LABEL_17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33A68);
  OUTLINED_FUNCTION_0_6();
  v13 = (_QWORD *)OUTLINED_FUNCTION_6_11();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v4 || (v14 - v5 == 0x8000000000000000 ? (v15 = v4 == -1) : (v15 = 0), v15))
  {
LABEL_22:
    OUTLINED_FUNCTION_2_14();
    OUTLINED_FUNCTION_22_2();
    __break(1u);
    return;
  }
  v13[2] = v11;
  v13[3] = 2 * ((uint64_t)(v14 - v5) / v4);
LABEL_17:
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_17_3();
  if ((a1 & 1) != 0)
  {
    sub_1AF2361F8(a4 + v17, v11, v16);
    OUTLINED_FUNCTION_8_9();
  }
  else
  {
    sub_1AF235970(0, v11, v16, a4);
  }
  OUTLINED_FUNCTION_10_5();
}

void sub_1AF235570()
{
  sub_1AF2355C4();
}

void sub_1AF23558C()
{
  sub_1AF2358C4();
}

void sub_1AF2355A8()
{
  sub_1AF2355C4();
}

void sub_1AF2355C4()
{
  uint64_t v0;
  char v1;
  size_t v2;
  uint64_t v3;
  uint64_t *v4;
  char v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  OUTLINED_FUNCTION_21_2();
  if ((v5 & 1) != 0)
  {
    OUTLINED_FUNCTION_9_9();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_31_1();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_11_7();
    }
  }
  else
  {
    v6 = v3;
  }
  v9 = *(_QWORD *)(v0 + 16);
  if (v6 <= v9)
    v10 = *(_QWORD *)(v0 + 16);
  else
    v10 = v6;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(v4);
    v11 = (_QWORD *)OUTLINED_FUNCTION_22();
    v2 = _swift_stdlib_malloc_size(v11);
    v11[2] = v9;
    v11[3] = 2 * ((uint64_t)(v2 - 32) / 32);
  }
  else
  {
    v11 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v1 & 1) != 0)
  {
    OUTLINED_FUNCTION_30_2();
    OUTLINED_FUNCTION_8_9();
  }
  else
  {
    OUTLINED_FUNCTION_16_3(v2, v3, (uint64_t)(v11 + 4));
  }
  OUTLINED_FUNCTION_12_2();
}

void sub_1AF235670(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  unint64_t v16;
  uint64_t v17;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_9_9();
    if (v9 != v10)
    {
      OUTLINED_FUNCTION_31_1();
      if (v9)
      {
        __break(1u);
        goto LABEL_22;
      }
      OUTLINED_FUNCTION_11_7();
    }
  }
  else
  {
    v8 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v8 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v8;
  if (!v12)
    goto LABEL_17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33510);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E4C8);
  v13 = (_QWORD *)OUTLINED_FUNCTION_6_11();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v4 || (v14 - v5 == 0x8000000000000000 ? (v15 = v4 == -1) : (v15 = 0), v15))
  {
LABEL_22:
    OUTLINED_FUNCTION_2_14();
    OUTLINED_FUNCTION_22_2();
    __break(1u);
    return;
  }
  v13[2] = v11;
  v13[3] = 2 * ((uint64_t)(v14 - v5) / v4);
LABEL_17:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E4C8);
  OUTLINED_FUNCTION_17_3();
  if ((a1 & 1) != 0)
  {
    sub_1AF236344(a4 + v17, v11, v16);
    OUTLINED_FUNCTION_8_9();
  }
  else
  {
    sub_1AF235D70(0, v11, v16, a4);
  }
  OUTLINED_FUNCTION_10_5();
}

void sub_1AF2357C8()
{
  sub_1AF2358C4();
}

char *sub_1AF2357E4(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC88);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1AF233FD8((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1AF235FA8(0, v8, v12, a4);
  }
  return v10;
}

void sub_1AF2358C4()
{
  uint64_t v0;
  char v1;
  size_t v2;
  uint64_t v3;
  uint64_t *v4;
  char v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  OUTLINED_FUNCTION_21_2();
  if ((v5 & 1) != 0)
  {
    OUTLINED_FUNCTION_9_9();
    if (v7 != v8)
    {
      OUTLINED_FUNCTION_31_1();
      if (v7)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_11_7();
    }
  }
  else
  {
    v6 = v3;
  }
  v9 = *(_QWORD *)(v0 + 16);
  if (v6 <= v9)
    v10 = *(_QWORD *)(v0 + 16);
  else
    v10 = v6;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(v4);
    v11 = (_QWORD *)OUTLINED_FUNCTION_22();
    v2 = _swift_stdlib_malloc_size(v11);
    v11[2] = v9;
    v11[3] = 2 * ((uint64_t)(v2 - 32) / 16);
  }
  else
  {
    v11 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v1 & 1) != 0)
  {
    OUTLINED_FUNCTION_30_2();
    OUTLINED_FUNCTION_8_9();
  }
  else
  {
    OUTLINED_FUNCTION_16_3(v2, v3, (uint64_t)(v11 + 4));
  }
  OUTLINED_FUNCTION_12_2();
}

uint64_t sub_1AF235970(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_1AF240C88() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  result = sub_1AF2416D8();
  __break(1u);
  return result;
}

uint64_t sub_1AF235A90(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1AF2416D8();
  __break(1u);
  return result;
}

uint64_t sub_1AF235B84(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1AF2416D8();
  __break(1u);
  return result;
}

uint64_t sub_1AF235C78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1AF2416D8();
  __break(1u);
  return result;
}

uint64_t sub_1AF235D70(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E4C8) - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  result = sub_1AF2416D8();
  __break(1u);
  return result;
}

uint64_t sub_1AF235E94(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33DD8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1AF2416D8();
  __break(1u);
  return result;
}

char *sub_1AF235FA8(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = (char *)sub_1AF2416D8();
  __break(1u);
  return result;
}

uint64_t sub_1AF236094(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1AF2416D8();
  __break(1u);
  return result;
}

char *sub_1AF236188(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_14();
    __src = (char *)OUTLINED_FUNCTION_7_10();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_1AF2361F8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_14();
    result = OUTLINED_FUNCTION_7_10();
    __break(1u);
  }
  else if (a3 < a1 || (result = OUTLINED_FUNCTION_0_6(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    OUTLINED_FUNCTION_0_6();
    OUTLINED_FUNCTION_24_4();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_24_4();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_1AF2362C0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1AF2416D8();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

uint64_t sub_1AF236344(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_1AF2416D8();
    __break(1u);
  }
  else if (a3 < a1
         || (result = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E4C8),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E4C8);
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_1AF236448(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1AF2416D8();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_1AF2364CC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  OUTLINED_FUNCTION_2_14();
  result = OUTLINED_FUNCTION_7_10();
  __break(1u);
  return result;
}

uint64_t sub_1AF236578(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(OUTLINED_FUNCTION_0_6() - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
  }
  OUTLINED_FUNCTION_2_14();
  result = OUTLINED_FUNCTION_7_10();
  __break(1u);
  return result;
}

unint64_t sub_1AF236648()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EEE33DC8;
  if (!qword_1EEE33DC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1EEE33CC8);
    result = MEMORY[0x1AF45A834](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EEE33DC8);
  }
  return result;
}

unint64_t sub_1AF236690()
{
  unint64_t result;

  result = qword_1ED32E630[0];
  if (!qword_1ED32E630[0])
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for SessionType, &type metadata for SessionType);
    atomic_store(result, qword_1ED32E630);
  }
  return result;
}

_QWORD *assignWithCopy for SessionType(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;

  LODWORD(v4) = -1;
  if (a1[1] >= 0xFFFFFFFFuLL)
    LODWORD(v5) = -1;
  else
    v5 = a1[1];
  v6 = v5 + 1;
  if (a2[1] < 0xFFFFFFFFuLL)
    v4 = a2[1];
  v7 = v4 + 1;
  if (v6 > 1)
  {
    if (v7 <= 1)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_12:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v7 > 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SessionType(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = -1;
  if (v4 < 0xFFFFFFFF)
    v5 = v4;
  if ((v5 + 1) > 1)
    goto LABEL_9;
  v6 = *(_QWORD *)(a2 + 8);
  LODWORD(v7) = -1;
  if (v6 < 0xFFFFFFFF)
    v7 = *(_QWORD *)(a2 + 8);
  if ((v7 + 1) > 1)
  {
    swift_bridgeObjectRelease();
LABEL_9:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionType(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 > 0x7FFFFFEE && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483631);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) < 2)
    LODWORD(v3) = 0;
  if (v3 >= 0x11)
    return (v3 - 16);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SessionType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFEF)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483631;
    if (a3 >= 0x7FFFFFEF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFEF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 16;
  }
  return result;
}

uint64_t sub_1AF2368A4(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  if ((v1 + 1) >= 2)
    return v1;
  else
    return 0;
}

uint64_t sub_1AF2368C4(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_1AF2368E0(_BYTE *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t v12;

  v3 = v2;
  v5 = *v2;
  v6 = *(_QWORD *)(v5 + 40);
  swift_bridgeObjectRetain();
  sub_1AF20749C(v6, a2);
  v8 = v7 & ~(-1 << *(_BYTE *)(v5 + 32));
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    __asm { BR              X9 }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = *v3;
  *v3 = 0x8000000000000000;
  sub_1AF237328(a2, v8, isUniquelyReferenced_nonNull_native);
  *v3 = v12;
  swift_bridgeObjectRelease();
  result = 1;
  *a1 = a2;
  return result;
}

uint64_t sub_1AF236E00()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  _QWORD *v14;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33DE8);
  v2 = sub_1AF24160C();
  if (!*(_QWORD *)(v1 + 16))
    goto LABEL_25;
  v3 = 1 << *(_BYTE *)(v1 + 32);
  v14 = (_QWORD *)(v1 + 56);
  if (v3 < 64)
    v4 = ~(-1 << v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 56);
  v6 = (unint64_t)(v3 + 63) >> 6;
  swift_retain();
  if (v5)
  {
    v7 = __clz(__rbit64(v5));
    goto LABEL_20;
  }
  if (v6 > 1)
  {
    v8 = *(_QWORD *)(v1 + 64);
    v9 = 1;
    if (v8)
      goto LABEL_19;
    v9 = 2;
    if (v6 > 2)
    {
      v8 = *(_QWORD *)(v1 + 72);
      if (v8)
        goto LABEL_19;
      v9 = 3;
      if (v6 > 3)
      {
        v8 = *(_QWORD *)(v1 + 80);
        if (!v8)
        {
          v10 = 4;
          if (v6 > 4)
          {
            v8 = *(_QWORD *)(v1 + 88);
            if (v8)
            {
              v9 = 4;
              goto LABEL_19;
            }
            while (1)
            {
              v9 = v10 + 1;
              if (__OFADD__(v10, 1))
              {
                __break(1u);
                JUMPOUT(0x1AF2372E4);
              }
              if (v9 >= v6)
                break;
              v8 = v14[v9];
              ++v10;
              if (v8)
                goto LABEL_19;
            }
          }
          goto LABEL_21;
        }
LABEL_19:
        v7 = __clz(__rbit64(v8)) + (v9 << 6);
LABEL_20:
        v11 = *(unsigned __int8 *)(*(_QWORD *)(v1 + 48) + v7);
        sub_1AF2417EC();
        __asm { BR              X8 }
      }
    }
  }
LABEL_21:
  swift_release();
  v12 = 1 << *(_BYTE *)(v1 + 32);
  if (v12 > 63)
    sub_1AF2368C4(0, (unint64_t)(v12 + 63) >> 6, v14);
  else
    *v14 = -1 << v12;
  *(_QWORD *)(v1 + 16) = 0;
LABEL_25:
  result = swift_release();
  *v0 = v2;
  return result;
}

void sub_1AF237328(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  char v15;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  v15 = a1;
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if ((a3 & 1) != 0)
    {
      sub_1AF236E00();
    }
    else
    {
      if (v7 > v6)
      {
        sub_1AF23783C();
        goto LABEL_10;
      }
      sub_1AF2379D0();
    }
    v8 = *v3;
    sub_1AF20749C(*(_QWORD *)(*v3 + 40), a1);
    a2 = v9 & ~(-1 << *(_BYTE *)(v8 + 32));
    if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
      __asm { BR              X9 }
  }
LABEL_10:
  v10 = *v14;
  *(_QWORD *)(*v14 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_BYTE *)(*(_QWORD *)(v10 + 48) + a2) = v15;
  v11 = *(_QWORD *)(v10 + 16);
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
  {
    __break(1u);
    JUMPOUT(0x1AF237798);
  }
  *(_QWORD *)(v10 + 16) = v13;
}

void *sub_1AF23783C()
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
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33DE8);
  v2 = *v0;
  v3 = sub_1AF241600();
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
  if (!v12)
    goto LABEL_12;
LABEL_11:
  v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v14 | (v9 << 6); ; i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + i) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + i);
    if (v12)
      goto LABEL_11;
LABEL_12:
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
LABEL_25:
    v12 = (v17 - 1) & v17;
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_25;
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
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1AF2379D0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33DE8);
  v2 = sub_1AF24160C();
  if (!*(_QWORD *)(v1 + 16))
  {
    result = swift_release();
    goto LABEL_23;
  }
  v3 = 1 << *(_BYTE *)(v1 + 32);
  if (v3 < 64)
    v4 = ~(-1 << v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 56);
  v12 = (unint64_t)(v3 + 63) >> 6;
  swift_retain();
  if (v5)
  {
    v6 = __clz(__rbit64(v5));
    goto LABEL_20;
  }
  if (v12 > 1)
  {
    v7 = *(_QWORD *)(v1 + 64);
    v8 = 1;
    if (v7)
      goto LABEL_19;
    v8 = 2;
    if (v12 > 2)
    {
      v7 = *(_QWORD *)(v1 + 72);
      if (v7)
        goto LABEL_19;
      v8 = 3;
      if (v12 > 3)
      {
        v7 = *(_QWORD *)(v1 + 80);
        if (!v7)
        {
          v9 = 4;
          if (v12 > 4)
          {
            v7 = *(_QWORD *)(v1 + 88);
            if (v7)
            {
              v8 = 4;
              goto LABEL_19;
            }
            while (1)
            {
              v8 = v9 + 1;
              if (__OFADD__(v9, 1))
              {
                __break(1u);
                JUMPOUT(0x1AF237E7CLL);
              }
              if (v8 >= v12)
                break;
              v7 = *(_QWORD *)(v1 + 56 + 8 * v8);
              ++v9;
              if (v7)
                goto LABEL_19;
            }
          }
          goto LABEL_21;
        }
LABEL_19:
        v6 = __clz(__rbit64(v7)) + (v8 << 6);
LABEL_20:
        v10 = *(unsigned __int8 *)(*(_QWORD *)(v1 + 48) + v6);
        sub_1AF2417EC();
        __asm { BR              X8 }
      }
    }
  }
LABEL_21:
  result = swift_release_n();
LABEL_23:
  *v0 = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_14_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  sub_1AF20A01C(a1, a2);
  sub_1AF20A01C(v2, v3);
  return sub_1AF209B9C(v2, v3);
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  return sub_1AF2416A8();
}

uint64_t OUTLINED_FUNCTION_25_3()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1AF209B9C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_27_3()
{
  return FeedbackStreamDescriptor.rawValue.getter();
}

uint64_t OUTLINED_FUNCTION_30_2()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v0 + 32, v2);
}

void static PegasusConfigContainerURLProvider.containerURL<A>(using:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  __int128 v18[2];
  uint64_t v19;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  MEMORY[0x1E0C80A78](v5);
  v6 = OUTLINED_FUNCTION_0_15();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_57();
  v10 = v9 - v8;
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_57();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13 - v12, a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EBE8);
  if (swift_dynamicCast())
  {
    sub_1AF220BCC(v18, (uint64_t)v20);
    v15 = v21;
    v16 = v22;
    __swift_project_boxed_opaque_existential_1(v20, v21);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  }
  else
  {
    v19 = 0;
    memset(v18, 0, sizeof(v18));
    sub_1AF2380DC((uint64_t)v18);
    sub_1AF2276F8();
    if (!v2)
    {
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 104))(v10, *MEMORY[0x1E0CAFD60], v6);
      v17 = sub_1AF240E2C();
      OUTLINED_FUNCTION_2_15(v17);
      sub_1AF240E08();
    }
  }
}

uint64_t sub_1AF2380DC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32EBF8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t static PegasusConfigContainerURLProvider.identifier.getter()
{
  return 0xD000000000000024;
}

ValueMetadata *type metadata accessor for PegasusConfigContainerURLProvider()
{
  return &type metadata for PegasusConfigContainerURLProvider;
}

uint64_t dispatch thunk of PegasusConfigContainerURLResolver.containerURL()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void sub_1AF238160()
{
  qword_1EEE33DF0 = 0x6572615773706C41;
  *(_QWORD *)algn_1EEE33DF8 = 0xEF32566573756F68;
}

uint64_t static DataWarehouseConfig.mainFolderName.getter()
{
  return sub_1AF2382C0(&qword_1EEE33618, &qword_1EEE33DF0);
}

unint64_t static DataWarehouseConfig.databaseName.getter()
{
  return 0xD000000000000011;
}

void sub_1AF2381CC()
{
  strcpy((char *)&qword_1EEE33E00, "SchemaManifest");
  algn_1EEE33E08[7] = -18;
}

uint64_t static DataWarehouseConfig.schemaFilename.getter()
{
  return sub_1AF2382C0(&qword_1EEE33620, &qword_1EEE33E00);
}

void sub_1AF23821C()
{
  qword_1EEE33E10 = 6517604;
  *(_QWORD *)algn_1EEE33E18 = 0xE300000000000000;
}

uint64_t static DataWarehouseConfig.schemaExtension.getter()
{
  return sub_1AF2382C0(&qword_1EEE33628, &qword_1EEE33E10);
}

unint64_t static DataWarehouseConfig.Context.messageName.getter()
{
  return 0xD000000000000020;
}

void sub_1AF238274()
{
  qword_1EEE333A0 = 0x746E6F635F6D6673;
  *(_QWORD *)algn_1EEE333A8 = 0xEB00000000747865;
}

uint64_t static DataWarehouseConfig.Context.tableName.getter()
{
  return sub_1AF2382C0(&qword_1EEE333B0, &qword_1EEE333A0);
}

uint64_t sub_1AF2382C0(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  OUTLINED_FUNCTION_101();
  return v3;
}

void sub_1AF23830C()
{
  qword_1EEE33F40 = 7169651;
  *(_QWORD *)algn_1EEE33F48 = 0xE300000000000000;
}

void sub_1AF238328()
{
  qword_1EEE340C0 = 2003134838;
  *(_QWORD *)algn_1EEE340C8 = 0xE400000000000000;
}

uint64_t DataWarehouseConfig.dataWarehouseUrl.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_105();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t DataWarehouseConfig.databaseAlias.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for DataWarehouseConfig() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for DataWarehouseConfig()
{
  uint64_t result;

  result = qword_1EEE33E28;
  if (!qword_1EEE33E28)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t DataWarehouseConfig.streamDescriptor.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for DataWarehouseConfig();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 24));
  return result;
}

uint64_t DataWarehouseConfig.databaseUrl.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_7_1();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v0, *MEMORY[0x1E0CAFD68], v1);
  sub_1AF208AB8();
  sub_1AF240E20();
  OUTLINED_FUNCTION_19_4(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  return swift_bridgeObjectRelease();
}

uint64_t URL.aggregationSchemaUrl.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = OUTLINED_FUNCTION_7_1();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_57();
  v4 = v3 - v2;
  v5 = OUTLINED_FUNCTION_105();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_11();
  if (qword_1EEE33620 != -1)
    swift_once();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v1 + 104))(v4, *MEMORY[0x1E0CAFD78], v0);
  sub_1AF208AB8();
  swift_bridgeObjectRetain();
  sub_1AF240E20();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  swift_bridgeObjectRelease();
  if (qword_1EEE33628 != -1)
    swift_once();
  sub_1AF240DC0();
  return OUTLINED_FUNCTION_19_4(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
}

void DataWarehouseConfig.init(dataWarehouseUrl:streamDescriptor:fileManager:)(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  void (*v25)(void);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 v36;

  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v30 - v13;
  v15 = sub_1AF240E2C();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_57();
  v34 = v18 - v17;
  v19 = *a2;
  v32 = type metadata accessor for DataWarehouseConfig();
  v33 = a4;
  v20 = (_QWORD *)(a4 + *(int *)(v32 + 20));
  *v20 = 0x73756F6865726177;
  v20[1] = 0xE900000000000065;
  v35 = a1;
  sub_1AF2388DC(a1, (uint64_t)v12);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v15) == 1)
  {
    v36 = v19;
    NSFileManager.dataWarehouseUrl(for:)(&v36, (uint64_t)v14);
    if (v4)
    {

      OUTLINED_FUNCTION_20();
      v21 = (uint64_t)v12;
LABEL_8:
      sub_1AF22F1D0(v21);
LABEL_12:
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    v31 = 0;
    sub_1AF22F1D0((uint64_t)v12);
    v22 = v34;
  }
  else
  {
    v31 = v4;
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v14, v12, v15);
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v15);
    v22 = v34;
  }
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15) == 1)
  {
    sub_1AF22F1D0((uint64_t)v14);
    sub_1AF238D08();
    v23 = OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_14_7(v23, v24);

    v21 = v35;
    goto LABEL_8;
  }
  v25 = *(void (**)(void))(v16 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v25)(v22, v14, v15);
  if ((sub_1AF240D84() & 1) == 0)
  {
    v26 = sub_1AF240D9C();
    v28 = v27;
    sub_1AF238D08();
    OUTLINED_FUNCTION_8();
    *v29 = v26;
    v29[1] = v28;
    swift_willThrow();

    OUTLINED_FUNCTION_20();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v22, v15);
    goto LABEL_12;
  }

  OUTLINED_FUNCTION_20();
  *(_BYTE *)(v33 + *(int *)(v32 + 24)) = v19;
  v25();
LABEL_13:
  OUTLINED_FUNCTION_0();
}

uint64_t sub_1AF2388DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void NSFileManager.dataWarehouseUrl(for:)(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  void *v4;
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
  char *v18;
  int v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (**v35)(_QWORD, _QWORD, _QWORD);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  os_log_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  int v46;
  uint64_t v47;
  void *v48;
  char *v49;
  uint64_t v50[4];

  v47 = a2;
  v3 = sub_1AF240D90();
  v4 = *(void **)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_57();
  v7 = v6 - v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_57();
  v11 = v10 - v9;
  v12 = sub_1AF240E2C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v40 - v17;
  v19 = *a1;
  v20 = v49;
  sub_1AF209250(v48);
  if (v20)
  {

    OUTLINED_FUNCTION_3_15(v11, 1);
LABEL_4:
    sub_1AF22F1D0(v11);
    sub_1AF227FC8();
    v21 = OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_14_7(v21, v22);
    goto LABEL_5;
  }
  v42 = 0;
  v43 = v3;
  v46 = v19;
  v44 = v7;
  v45 = v16;
  v48 = v4;
  v49 = v18;
  OUTLINED_FUNCTION_3_15(v11, 0);
  if (__swift_getEnumTagSinglePayload(v11, 1, v12) == 1)
    goto LABEL_4;
  v23 = v13;
  v24 = (uint64_t)v49;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v49, v11, v12);
  if (qword_1ED32EC08 != -1)
    swift_once();
  v25 = sub_1AF2411B0();
  __swift_project_value_buffer(v25, (uint64_t)qword_1ED330238);
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v27 = (uint64_t)v45;
  v26(v45, v24, v12);
  v28 = sub_1AF241198();
  v29 = sub_1AF241498();
  if (os_log_type_enabled(v28, v29))
  {
    v41 = v28;
    v30 = (uint8_t *)swift_slowAlloc();
    v50[0] = swift_slowAlloc();
    *(_DWORD *)v30 = 136315138;
    sub_1AF209828();
    v31 = sub_1AF241720();
    v50[3] = sub_1AF208AF4(v31, v32, v50);
    sub_1AF24157C();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v27, v12);
    _os_log_impl(&dword_1AF203000, v41, v29, "Container URL: %s", v30, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_16_4(v27);

  v34 = v43;
  v33 = v44;
  v36 = v47;
  v35 = (void (**)(_QWORD, _QWORD, _QWORD))v48;
  if (v46 == 2)
  {
    if (qword_1EEE33618 != -1)
      swift_once();
    v50[0] = qword_1EEE33DF0;
    v50[1] = *(_QWORD *)algn_1EEE33DF8;
    v35[13](v33, *MEMORY[0x1E0CAFD78], v34);
    sub_1AF208AB8();
    OUTLINED_FUNCTION_101();
    v37 = v33;
    v38 = (uint64_t)v49;
    sub_1AF240E20();
    ((void (*)(uint64_t, uint64_t))v35[1])(v37, v34);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_16_4(v38);
    v39 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_16_4((uint64_t)v49);
    v39 = 1;
  }
  OUTLINED_FUNCTION_3_15(v36, v39);
LABEL_5:
  OUTLINED_FUNCTION_0();
}

unint64_t sub_1AF238D08()
{
  unint64_t result;

  result = qword_1EEE33E20;
  if (!qword_1EEE33E20)
  {
    result = MEMORY[0x1AF45A834](&protocol conformance descriptor for DataWarehouseConfigError, &type metadata for DataWarehouseConfigError);
    atomic_store(result, (unint64_t *)&qword_1EEE33E20);
  }
  return result;
}

uint64_t FeedbackStreamDescriptor.metricsMessageName.getter()
{
  _BYTE *v0;
  uint64_t v2;

  if (*v0 != 2)
    return 0;
  LOBYTE(v2) = 2;
  FeedbackStreamDescriptor.rawValue.getter();
  OUTLINED_FUNCTION_6_12();
  sub_1AF24133C();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_101();
  sub_1AF24133C();
  OUTLINED_FUNCTION_27();
  return v2;
}

uint64_t FeedbackStreamDescriptor.metricsTableName.getter()
{
  _BYTE *v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  unint64_t v13;

  if (*v0 != 2)
    return 0;
  v1 = FeedbackStreamDescriptor.rawValue.getter();
  v3 = v2;
  v12 = 46;
  v13 = 0xE100000000000000;
  MEMORY[0x1E0C80A78](v1);
  v11[2] = &v12;
  swift_bridgeObjectRetain();
  v4 = sub_1AF239130(0x7FFFFFFFFFFFFFFFLL, 1u, sub_1AF224584, (uint64_t)v11, v1, v3);
  swift_bridgeObjectRelease();
  sub_1AF238F3C(v4);
  v6 = v5;
  swift_bridgeObjectRelease();
  if (!v6)
    return 0;
  v7 = sub_1AF238F9C();
  v9 = v8;
  swift_bridgeObjectRelease();
  if (qword_1EEE333B8 != -1)
    swift_once();
  v12 = v7;
  v13 = v9;
  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_27();
  return v12;
}

uint64_t sub_1AF238F3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  v2 = *(_QWORD *)(a1 + 32 * v1);
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1AF238F9C()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t result;

  v0 = sub_1AF24130C();
  v1 = sub_1AF24154C();
  v2 = __OFADD__(v0, v1);
  result = v0 + v1;
  if (v2)
  {
    __break(1u);
  }
  else
  {
    MEMORY[0x1AF459DB4](result);
    sub_1AF239A64();
    sub_1AF241330();
    sub_1AF241330();
    return 0;
  }
  return result;
}

uint64_t FeedbackStreamDescriptor.metricsViewName.getter()
{
  _BYTE *v0;
  uint64_t v2;

  if (*v0 != 2)
    return 0;
  LOBYTE(v2) = 2;
  FeedbackStreamDescriptor.metricsTableName.getter();
  OUTLINED_FUNCTION_6_12();
  sub_1AF24133C();
  OUTLINED_FUNCTION_27();
  if (qword_1EEE33630 != -1)
    swift_once();
  OUTLINED_FUNCTION_101();
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_27();
  return v2;
}

uint64_t sub_1AF239130(uint64_t a1, unsigned __int8 a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  _QWORD v50[4];

  v50[3] = a4;
  if (a1 < 0)
  {
    OUTLINED_FUNCTION_2_14();
    goto LABEL_40;
  }
  v10 = OUTLINED_FUNCTION_21_3();
  *(_QWORD *)(v10 + 16) = MEMORY[0x1E0DEE9D8];
  v42 = v10 + 16;
  v47 = OUTLINED_FUNCTION_21_3();
  *(_QWORD *)(v47 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_1AF239508(v30 | (v11 << 16), v47, a2 & 1, v10);
    OUTLINED_FUNCTION_55();
    v13 = *(_QWORD *)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_36:
    swift_release();
    return v13;
  }
  v41 = a1;
  v48 = 4 * v12;
  v13 = MEMORY[0x1E0DEE9D8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_1AF241360();
    v50[1] = v17;
    v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_55();
      return v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
      v14 = OUTLINED_FUNCTION_8_10();
      goto LABEL_21;
    }
    v20 = (v15 >> 14 == v14 >> 14) & a2;
    if (v20 != 1)
    {
      if (v14 >> 14 < v15 >> 14)
        goto LABEL_38;
      v21 = OUTLINED_FUNCTION_13_3();
      v43 = v23;
      v44 = v22;
      v45 = v24;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_17_4();
        v13 = v28;
      }
      v25 = *(_QWORD *)(v13 + 16);
      if (v25 >= *(_QWORD *)(v13 + 24) >> 1)
      {
        OUTLINED_FUNCTION_17_4();
        v13 = v29;
      }
      *(_QWORD *)(v13 + 16) = v25 + 1;
      v26 = (_QWORD *)(v13 + 32 * v25);
      v26[4] = v21;
      v26[5] = v45;
      v26[6] = v44;
      v26[7] = v43;
      *(_QWORD *)v42 = v13;
    }
    v27 = OUTLINED_FUNCTION_8_10();
    v14 = v27;
    *(_QWORD *)(v47 + 16) = v27;
    if ((v20 & 1) == 0 && *(_QWORD *)(v13 + 16) == v41)
      break;
    v15 = v27;
    v16 = v27;
LABEL_21:
    if (v48 == v14 >> 14)
      goto LABEL_30;
  }
  v16 = v27;
  v15 = v27;
LABEL_30:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_55();
LABEL_35:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_36;
  }
  if (v48 >= v16 >> 14)
  {
    v31 = OUTLINED_FUNCTION_13_3();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    OUTLINED_FUNCTION_55();
    sub_1AF22AC68();
    v38 = *(_QWORD *)(*(_QWORD *)v42 + 16);
    sub_1AF22ACD4(v38);
    v13 = *(_QWORD *)v42;
    *(_QWORD *)(v13 + 16) = v38 + 1;
    v39 = (_QWORD *)(v13 + 32 * v38);
    v39[4] = v31;
    v39[5] = v33;
    v39[6] = v35;
    v39[7] = v37;
    *(_QWORD *)v42 = v13;
    goto LABEL_35;
  }
LABEL_38:
  OUTLINED_FUNCTION_2_14();
LABEL_40:
  result = sub_1AF2416A8();
  __break(1u);
  return result;
}

uint64_t sub_1AF239508(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_1AF24136C();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    sub_1AF22AC68();
    v14 = *(_QWORD *)(*(_QWORD *)(a4 + 16) + 16);
    sub_1AF22ACD4(v14);
    v15 = *(_QWORD *)(a4 + 16);
    *(_QWORD *)(v15 + 16) = v14 + 1;
    v16 = (_QWORD *)(v15 + 32 * v14);
    v16[4] = v7;
    v16[5] = v9;
    v16[6] = v11;
    v16[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_1AF2416A8();
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for DataWarehouseConfigError()
{
  return &type metadata for DataWarehouseConfigError;
}

_QWORD *initializeBufferWithCopyOfBuffer for DataWarehouseConfig(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1AF240E2C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (_QWORD *)((char *)a1 + v8);
    v11 = (_QWORD *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    *((_BYTE *)a1 + v9) = *((_BYTE *)a2 + v9);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for DataWarehouseConfig(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1AF240E2C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v6 = sub_1AF240E2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_1AF240E2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for DataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1AF240E2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  return a1;
}

uint64_t assignWithTake for DataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_1AF240E2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for DataWarehouseConfig()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AF2398E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = OUTLINED_FUNCTION_105();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for DataWarehouseConfig()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AF239964(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_105();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_1AF2399D8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1AF240E2C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for DataWarehouseConfig.Context()
{
  return &type metadata for DataWarehouseConfig.Context;
}

unint64_t sub_1AF239A64()
{
  unint64_t result;

  result = qword_1EEE33480;
  if (!qword_1EEE33480)
  {
    result = MEMORY[0x1AF45A834](MEMORY[0x1E0DEBB10], MEMORY[0x1E0DEBAF0]);
    atomic_store(result, (unint64_t *)&qword_1EEE33480);
  }
  return result;
}

uint64_t sub_1AF239AA0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1AF239AC4()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_14_7(uint64_t a1, _QWORD *a2)
{
  *a2 = 0;
  a2[1] = 0;
  return swift_willThrow();
}

double sub_1AF239AE0()
{
  void *v0;
  void *v1;
  id v2;
  double v4;
  _OWORD v5[2];
  _BYTE v6[24];
  uint64_t v7;

  if (qword_1ED32ECA0 != -1)
    swift_once();
  v1 = (void *)sub_1AF24124C();
  v2 = objc_msgSend(v0, sel_valueForKey_, v1);

  if (v2)
  {
    sub_1AF2415D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_1AF21F4DC((uint64_t)v5, (uint64_t)v6, &qword_1ED32F808);
  if (v7)
  {
    if ((swift_dynamicCast() & 1) != 0)
      return v4;
  }
  else
  {
    sub_1AF21F578((uint64_t)v6, &qword_1ED32F808);
  }
  return 0.0;
}

size_t sub_1AF239BEC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  size_t result;
  size_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v3 = sub_1AF240E38();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_18_2();
  sub_1AF24148C();
  if (v1)
    return v3;
  result = (size_t)objc_msgSend(v0, sel_seekToEndOfFile);
  if ((result & 0x8000000000000000) == 0)
  {
    v6 = result;
    v7 = mmap(0, result, 1, 1, (int)objc_msgSend(v0, sel_fileDescriptor), 0);
    if (v7)
    {
      v8 = v7;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v2, *MEMORY[0x1E0CB00D0], v3);
      v3 = MEMORY[0x1AF459904](v8, v6, v2);
    }
    else
    {
      v9 = sub_1AF241270();
      v3 = v10;
      v11 = (int)MEMORY[0x1AF459C7C]();
      v12 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
      sub_1AF220830(v9, v3, v11, 0);
      swift_willThrow();
    }
    OUTLINED_FUNCTION_35_1();
    return v3;
  }
  __break(1u);
  return result;
}

id ConfigFactoryInternal.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

double sub_1AF239D78@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_1AF227ED4(a1), (v6 & 1) != 0))
  {
    sub_1AF208D14(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void sub_1AF239DC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_1AF20D23C(a1, a2);
    if ((v3 & 1) != 0)
      swift_retain();
  }
  OUTLINED_FUNCTION_50();
}

double sub_1AF239E04@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  unint64_t v6;
  char v7;
  double result;

  if (*(_QWORD *)(a3 + 16) && (v6 = sub_1AF20D23C(a1, a2), (v7 & 1) != 0))
  {
    sub_1AF208D14(*(_QWORD *)(a3 + 56) + 32 * v6, (uint64_t)a4);
  }
  else
  {
    result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

void sub_1AF239E54()
{
  qword_1EEE340D0 = 0x446769666E6F635FLL;
  *(_QWORD *)algn_1EEE340D8 = 0xEB00000000617461;
}

void sub_1AF239E80()
{
  qword_1EEE340E0 = 0x656741726573755FLL;
  *(_QWORD *)algn_1EEE340E8 = 0xEA0000000000746ELL;
}

void sub_1AF239EA8()
{
  qword_1ED330250 = 0x755F686372616573;
  *(_QWORD *)algn_1ED330258 = 0xEA00000000006C72;
}

id ConfigFactoryInternal.load(url:userAgent:userDefaults:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v9 = OUTLINED_FUNCTION_105();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_18_2();
  type metadata accessor for ConfigInternal();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v4, a1, v9);
  v11 = a4;
  OUTLINED_FUNCTION_1_0();
  return sub_1AF239F94(v4, a2, a3, a4);
}

uint64_t type metadata accessor for ConfigInternal()
{
  return objc_opt_self();
}

id sub_1AF239F94(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_class *v4;
  objc_class *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  size_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  Class v24;
  uint64_t v25;
  uint64_t v26;

  v5 = v4;
  v10 = sub_1AF240E2C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v23 - v13;
  sub_1AF20C87C(0, &qword_1ED32EB70);
  v26 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, a1, v10);
  v15 = sub_1AF216F58((uint64_t)v14);
  v24 = v5;
  v25 = a2;
  v16 = a1;
  v18 = sub_1AF239BEC();
  v20 = v19;

  v21 = objc_allocWithZone(v24);
  v22 = sub_1AF23AF04(v18, v20, v25, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v16, v10);
  return v22;
}

void ConfigFactoryInternal.load(data:userAgent:userDefaults:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v10;

  objc_allocWithZone((Class)type metadata accessor for ConfigInternal());
  sub_1AF219C40(a1, a2);
  v10 = a5;
  OUTLINED_FUNCTION_1_0();
  sub_1AF23AF04(a1, a2, a3, a4, a5);
  OUTLINED_FUNCTION_12_2();
}

id ConfigFactoryInternal.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_89();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_1AF23A624(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  void *v4;

  sub_1AF23A668(a3);
  if (v3)
  {
    v4 = (void *)sub_1AF24124C();
    OUTLINED_FUNCTION_27();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_1AF23A668(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *a1);
  OUTLINED_FUNCTION_1_0();
  return v2;
}

BOOL sub_1AF23A6C8()
{
  return sub_1AF23BFB8(0x64656C62616E65, 0xE700000000000000) > 0;
}

BOOL sub_1AF23A6F8(uint64_t a1, uint64_t a2)
{
  return sub_1AF23BFB8(a1, a2) > 0;
}

uint64_t sub_1AF23A720(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  _BYTE v6[24];
  uint64_t v7;

  OUTLINED_FUNCTION_6_13(a1, &qword_1ED32ECE0);
  OUTLINED_FUNCTION_32_1(0xD000000000000015, 0x80000001AF2487B0, (uint64_t)v6);
  if (v7)
  {
    if (OUTLINED_FUNCTION_47())
      return v5;
    else
      return 0;
  }
  else
  {
    OUTLINED_FUNCTION_37_1(v1, &qword_1ED32F808, v2, v3);
    return 0;
  }
}

void sub_1AF23A7C0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  void *v5;
  __int128 v6;
  uint64_t v7;

  sub_1AF23B408(a1, a2, &v6);
  if (!v7)
  {
    sub_1AF21F578((uint64_t)&v6, &qword_1ED32F808);
    goto LABEL_6;
  }
  v4 = sub_1AF20C87C(0, (unint64_t *)&qword_1ED32ECD0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_6:
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return;
  }
  if (objc_msgSend(v5, sel_isKindOfClass_, swift_getObjCClassFromMetadata()))
  {
    *(_QWORD *)(a3 + 24) = v4;
    *(_QWORD *)a3 = v5;
  }
  else
  {
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;

  }
}

BOOL sub_1AF23A8CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;

  v0 = sub_1AF240F04();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_57();
  v4 = v3 - v2;
  sub_1AF240EF8();
  sub_1AF240EC8();
  v6 = v5;
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  return sub_1AF239AE0() < v6;
}

id sub_1AF23A968(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a1;
  a3();
  v6 = v5;

  if (v6)
  {
    v7 = (void *)sub_1AF24124C();
    OUTLINED_FUNCTION_27();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

uint64_t sub_1AF23A9CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_57();
  v3 = v2 - v1;
  sub_1AF23AA88(v2 - v1);
  v4 = OUTLINED_FUNCTION_105();
  if (__swift_getEnumTagSinglePayload(v3, 1, v4) == 1)
  {
    sub_1AF21F578(v3, (uint64_t *)&unk_1ED32FF80);
    return 0;
  }
  else
  {
    v5 = sub_1AF240D9C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  return v5;
}

uint64_t sub_1AF23AA88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_57();
  v5 = v4 - v3;
  if (qword_1ED32EC98 != -1)
    swift_once();
  sub_1AF23AB94(v5);
  v6 = OUTLINED_FUNCTION_105();
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) == 1)
  {
    sub_1AF21F578(v5, (uint64_t *)&unk_1ED32FF80);
    return sub_1AF23AB94(a1);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, v5, v6);
    return __swift_storeEnumTagSinglePayload(a1, 0, 1, v6);
  }
}

uint64_t sub_1AF23AB94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  OUTLINED_FUNCTION_10();
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x1E0C80A78](v3);
  v8 = (char *)v25 - v7;
  OUTLINED_FUNCTION_6_13(v6, &qword_1ED32ECE0);
  v9 = OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_32_1(v9, v10, v11);
  if (!v26)
  {
    OUTLINED_FUNCTION_28_3(v12, &qword_1ED32F808);
    goto LABEL_8;
  }
  if ((OUTLINED_FUNCTION_47() & 1) == 0)
  {
LABEL_8:
    v27 = 0;
    v28 = 0;
    goto LABEL_9;
  }
  if (v28)
  {
    swift_bridgeObjectRetain();
    if (sub_1AF24130C() < 1)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1AF240DFC();
      swift_bridgeObjectRelease();
      v13 = OUTLINED_FUNCTION_105();
      if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v13) != 1)
      {
        v23 = (uint64_t)v8;
        goto LABEL_22;
      }
      sub_1AF21F578((uint64_t)v8, (uint64_t *)&unk_1ED32FF80);
    }
  }
LABEL_9:
  v14 = OUTLINED_FUNCTION_34_1();
  sub_1AF23A7C0(v14, v15, v16);
  if (v26)
  {
    v18 = OUTLINED_FUNCTION_47();
    v19 = v25[0];
    v20 = v25[1];
    if (!v18)
    {
      v19 = 0;
      v20 = 0;
    }
  }
  else
  {
    OUTLINED_FUNCTION_28_3(v17, &qword_1ED32F808);
    v19 = 0;
    v20 = 0;
  }
  v27 = v19;
  v28 = v20;
  swift_bridgeObjectRelease();
  if (!v28)
    goto LABEL_18;
  OUTLINED_FUNCTION_1_0();
  if (sub_1AF24130C() < 1)
  {
    OUTLINED_FUNCTION_40();
    goto LABEL_18;
  }
  sub_1AF240DFC();
  OUTLINED_FUNCTION_40();
  v21 = OUTLINED_FUNCTION_105();
  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v21) != 1)
  {
    v23 = (uint64_t)v5;
LABEL_22:
    sub_1AF21F4DC(v23, a1, (uint64_t *)&unk_1ED32FF80);
    return swift_bridgeObjectRelease();
  }
  sub_1AF21F578((uint64_t)v5, (uint64_t *)&unk_1ED32FF80);
LABEL_18:
  v22 = OUTLINED_FUNCTION_105();
  __swift_storeEnumTagSinglePayload(a1, 1, 1, v22);
  return swift_bridgeObjectRelease();
}

void sub_1AF23AE18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  objc_class *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;

  v5 = (objc_class *)OUTLINED_FUNCTION_89();
  v6 = *(_QWORD *)(v2 + OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_data);
  v7 = *(_QWORD *)(v2 + OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_data + 8);
  v8 = *(void **)(v2 + OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_userDefaults);
  objc_allocWithZone(v5);
  sub_1AF219C40(v6, v7);
  v9 = v8;
  swift_bridgeObjectRetain();
  sub_1AF23AF04(v6, v7, a1, a2, v8);
  OUTLINED_FUNCTION_12_2();
}

id sub_1AF23AF04(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, id a5)
{
  char *v5;
  char *v6;
  objc_class *ObjectType;
  uint64_t v13;
  uint64_t *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  char *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v25[3];
  objc_super v26;

  v6 = v5;
  ObjectType = (objc_class *)swift_getObjectType();
  v13 = OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_userDefaults;
  *(_QWORD *)&v6[OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_userDefaults] = 0;
  v14 = (uint64_t *)&v6[OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_data];
  *v14 = a1;
  v14[1] = a2;
  v15 = &v6[OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_userAgent];
  *(_QWORD *)v15 = a3;
  *((_QWORD *)v15 + 1) = a4;
  if (a4)
  {
    v16 = v6;
    sub_1AF219C40(a1, a2);
    swift_bridgeObjectRetain();
    Client.init(_:)(a4, v25);
    v17 = v25[2];
    v18 = &v16[OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_clientName];
    *(_QWORD *)v18 = v25[1];
    *((_QWORD *)v18 + 1) = v17;
    if (a5)
    {
LABEL_3:
      v19 = *(void **)&v6[v13];
      *(_QWORD *)&v6[v13] = a5;
      a5 = a5;
      goto LABEL_8;
    }
  }
  else
  {
    *(_OWORD *)&v6[OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_clientName] = xmmword_1AF245B60;
    v20 = v6;
    sub_1AF219C40(a1, a2);
    if (a5)
      goto LABEL_3;
  }
  v21 = objc_allocWithZone(MEMORY[0x1E0C99EA0]);
  v22 = sub_1AF23C700(0xD000000000000011, 0x80000001AF246130);
  if (!v22)
    v22 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v19 = *(void **)&v6[v13];
  *(_QWORD *)&v6[v13] = v22;
LABEL_8:

  v26.receiver = v6;
  v26.super_class = ObjectType;
  v23 = objc_msgSendSuper2(&v26, sel_init);

  sub_1AF219BC4(a1, a2);
  return v23;
}

uint64_t type metadata accessor for ConfigFactoryInternal()
{
  return objc_opt_self();
}

void sub_1AF23B0C8(void *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = (void *)OUTLINED_FUNCTION_30_3();
  if (qword_1EEE33638 != -1)
    swift_once();
  v4 = (void *)sub_1AF24124C();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_userAgent + 8))
    v5 = sub_1AF24124C();
  else
    v5 = 0;
  if (qword_1EEE33640 != -1)
    swift_once();
  v6 = (id)sub_1AF24124C();
  objc_msgSend(a1, sel_encodeObject_forKey_, v5, v6);
  swift_unknownObjectRelease();

}

void sub_1AF23B240(void *a1)
{
  void *v1;
  objc_class *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v3 = (objc_class *)OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_6_13((uint64_t)v3, &qword_1EEE33E98);
  v4 = qword_1EEE33638;
  v5 = v1;
  if (v4 != -1)
    swift_once();
  v6 = (void *)OUTLINED_FUNCTION_8_11();
  OUTLINED_FUNCTION_6_13((uint64_t)v6, &qword_1ED32ECE0);
  if (qword_1EEE33640 != -1)
    swift_once();
  v7 = (void *)OUTLINED_FUNCTION_8_11();
  v8 = v7;
  if (!v6)
  {

LABEL_10:
    swift_getObjectType();
    OUTLINED_FUNCTION_12_6();
    goto LABEL_11;
  }
  if (!v7)
  {

    v8 = v5;
    goto LABEL_10;
  }
  v9 = v7;
  v10 = v6;

  v11 = v10;
  v12 = sub_1AF240E5C();
  v14 = v13;

  v15 = sub_1AF241270();
  v17 = v16;
  v18 = objc_allocWithZone(v3);
  sub_1AF23AF04(v12, v14, v15, v17, 0);

  swift_getObjectType();
  OUTLINED_FUNCTION_12_6();
LABEL_11:
  OUTLINED_FUNCTION_78();
}

void sub_1AF23B408(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v3;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _OWORD *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t inited;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  __int128 v27;
  uint64_t v28;
  _OWORD v29[2];
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (sub_1AF24130C() <= 0)
  {
LABEL_20:
    *a3 = 0u;
    a3[1] = 0u;
    return;
  }
  *(_QWORD *)&v27 = 778527074;
  *((_QWORD *)&v27 + 1) = 0xE400000000000000;
  OUTLINED_FUNCTION_38_1();
  sub_1AF24133C();
  v7 = *(void **)(v3 + OBJC_IVAR____TtC20PegasusConfiguration14ConfigInternal_userDefaults);
  if (!v7)
  {
    v12 = a3;
    v30 = 0u;
    v31 = 0u;
    goto LABEL_13;
  }
  v8 = v27;
  v9 = v7;
  v10 = (void *)sub_1AF24124C();
  v11 = objc_msgSend(v9, sel_objectForKey_, v10);

  if (v11)
  {
    sub_1AF2415D0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v29, 0, sizeof(v29));
  }
  sub_1AF21F4DC((uint64_t)v29, (uint64_t)&v30, &qword_1ED32F808);
  if (!*((_QWORD *)&v31 + 1))
  {
    v12 = a3;
LABEL_13:
    v19 = swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_28_3(v19, &qword_1ED32F808);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32ECF0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1AF242870;
    *(_QWORD *)(inited + 32) = a1;
    *(_QWORD *)(inited + 40) = a2;
    *(_QWORD *)(inited + 48) = 0x656469727265766FLL;
    *(_QWORD *)(inited + 56) = 0xE900000000000073;
    OUTLINED_FUNCTION_6_9();
    sub_1AF23C9B4(inited);
    v28 = 0;
    v21 = (void *)sub_1AF240E50();
    v22 = (void *)sub_1AF241468();
    OUTLINED_FUNCTION_27();
    _CFPropertyListCreateFiltered();

    a3 = v12;
    if (qword_1ED32EC08 != -1)
      swift_once();
    v23 = OUTLINED_FUNCTION_19();
    v24 = OUTLINED_FUNCTION_17(v23, (uint64_t)qword_1ED330238);
    v25 = sub_1AF241498();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)OUTLINED_FUNCTION_4();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1AF203000, v24, v25, "Could not parse mapped plist", v26, 2u);
      OUTLINED_FUNCTION_1();
    }

    goto LABEL_20;
  }
  sub_1AF219FD0(&v30, &v27);
  if (qword_1ED32EC08 != -1)
    swift_once();
  v13 = OUTLINED_FUNCTION_19();
  __swift_project_value_buffer(v13, (uint64_t)qword_1ED330238);
  sub_1AF208D14((uint64_t)&v27, (uint64_t)&v30);
  swift_bridgeObjectRetain();
  v14 = sub_1AF241198();
  v15 = sub_1AF2414A4();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = OUTLINED_FUNCTION_4();
    v28 = OUTLINED_FUNCTION_4();
    *(_DWORD *)v16 = 136315394;
    sub_1AF208D14((uint64_t)&v30, (uint64_t)v29);
    v17 = sub_1AF2412AC();
    *(_QWORD *)&v29[0] = sub_1AF208AF4(v17, v18, &v28);
    sub_1AF24157C();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_27_4();
    *(_WORD *)(v16 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v29[0] = sub_1AF208AF4(v8, 0xE400000000000000, &v28);
    sub_1AF24157C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1AF203000, v14, v15, "Found value: %s for key: %s from userDefaults", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_27_4();

  swift_bridgeObjectRelease_n();
  sub_1AF219FD0(&v27, a3);
}

uint64_t sub_1AF23BFB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  _BYTE v9[24];
  uint64_t v10;

  OUTLINED_FUNCTION_6_13(a1, (unint64_t *)&qword_1ED32F800);
  OUTLINED_FUNCTION_32_1(a1, a2, (uint64_t)v9);
  if (v10)
  {
    if (OUTLINED_FUNCTION_47())
      return v8;
  }
  else
  {
    OUTLINED_FUNCTION_37_1(v4, &qword_1ED32F808, v5, v6);
  }
  return 0;
}

void sub_1AF23C1C0(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  sub_1AF23B408(a1, a2, a3);
}

void sub_1AF23C2C4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _s20PegasusConfiguration21ConfigFactoryInternalCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_89();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_1AF23C384()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;
  _OWORD v19[2];
  _OWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_self();
  v1 = (void *)OUTLINED_FUNCTION_30_3();
  v18 = 0;
  v2 = objc_msgSend(v0, sel_propertyListWithData_options_format_error_, v1, 0, 0, &v18);

  v3 = v18;
  if (!v2)
  {
    v5 = v3;
    v6 = (void *)sub_1AF240D6C();

    swift_willThrow();
    if (qword_1ED32EC08 != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_19();
    v8 = (void *)OUTLINED_FUNCTION_17(v7, (uint64_t)qword_1ED330238);
    v9 = sub_1AF2414B0();
    if (OUTLINED_FUNCTION_119(v9))
    {
      *(_WORD *)OUTLINED_FUNCTION_4() = 0;
      OUTLINED_FUNCTION_3_5(&dword_1AF203000, v10, v11, "Config property list cannot be deserialized.");
      OUTLINED_FUNCTION_1();
    }

    return 0;
  }
  sub_1AF2415D0();
  swift_unknownObjectRelease();
  sub_1AF219FD0(v19, v20);
  sub_1AF208D14((uint64_t)v20, (uint64_t)v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EC90);
  if (!OUTLINED_FUNCTION_47())
  {
    if (qword_1ED32EC08 != -1)
      swift_once();
    v12 = OUTLINED_FUNCTION_19();
    v13 = (void *)OUTLINED_FUNCTION_17(v12, (uint64_t)qword_1ED330238);
    v14 = sub_1AF2414B0();
    if (OUTLINED_FUNCTION_119(v14))
    {
      *(_WORD *)OUTLINED_FUNCTION_4() = 0;
      OUTLINED_FUNCTION_3_5(&dword_1AF203000, v15, v16, "Config property list is not Dictionary");
      OUTLINED_FUNCTION_1();
    }

    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
    return 0;
  }
  v4 = v18;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  return v4;
}

void sub_1AF23C630(void *a1, uint64_t a2)
{
  id v2;
  id v3;
  void *v4;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x1E0C80C00];
  v5[0] = 0;
  if (objc_msgSend(a1, sel_seekToOffset_error_, a2, v5))
  {
    v2 = v5[0];
  }
  else
  {
    v3 = v5[0];
    v4 = (void *)sub_1AF240D6C();

    swift_willThrow();
  }
}

id sub_1AF23C700(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  if (a2)
  {
    v3 = (void *)sub_1AF24124C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

void sub_1AF23C760(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = sub_1AF240FF4();
  v31 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v26 - v6;
  if (*(_QWORD *)(a1 + 16)
    && (__swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E9C8),
        v8 = OUTLINED_FUNCTION_26_4(),
        v9 = v8,
        (v28 = *(_QWORD *)(a1 + 16)) != 0))
  {
    v10 = 0;
    v30 = v8 + 56;
    v11 = *(unsigned __int8 *)(v31 + 80);
    v26 = a1;
    v27 = a1 + ((v11 + 32) & ~v11);
    while (v10 < *(_QWORD *)(a1 + 16))
    {
      v12 = *(_QWORD *)(v31 + 72);
      v13 = *(void (**)(char *, unint64_t, uint64_t))(v31 + 16);
      v13(v7, v27 + v12 * v10, v2);
      sub_1AF209868((unint64_t *)&unk_1ED32E550, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11B8], MEMORY[0x1E0CB11D0]);
      v14 = sub_1AF24121C() & ~(-1 << *(_BYTE *)(v9 + 32));
      OUTLINED_FUNCTION_25_4();
      if ((v17 & v16) != 0)
      {
        v29 = v10;
        v19 = ~v18;
        while (1)
        {
          v13(v5, *(_QWORD *)(v9 + 48) + v14 * v12, v2);
          sub_1AF209868(&qword_1EEE33518, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB11B8], MEMORY[0x1E0CB11D8]);
          v20 = sub_1AF241240();
          v21 = *(void (**)(uint64_t))(v31 + 8);
          v22 = OUTLINED_FUNCTION_38_1();
          v21(v22);
          if ((v20 & 1) != 0)
            break;
          v14 = (v14 + 1) & v19;
          OUTLINED_FUNCTION_25_4();
          if ((v16 & v17) == 0)
          {
            a1 = v26;
            v10 = v29;
            goto LABEL_10;
          }
        }
        ((void (*)(char *, uint64_t))v21)(v7, v2);
        a1 = v26;
        v10 = v29;
      }
      else
      {
LABEL_10:
        *(_QWORD *)(v30 + 8 * v15) = v17 | v16;
        (*(void (**)(uint64_t, char *, uint64_t))(v31 + 32))(*(_QWORD *)(v9 + 48) + v14 * v12, v7, v2);
        v23 = *(_QWORD *)(v9 + 16);
        v24 = __OFADD__(v23, 1);
        v25 = v23 + 1;
        if (v24)
          goto LABEL_16;
        *(_QWORD *)(v9 + 16) = v25;
      }
      if (++v10 == v28)
        goto LABEL_14;
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_78();
  }
}

uint64_t sub_1AF23C9B4(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = MEMORY[0x1E0DEE9E8];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32ECE8);
  result = OUTLINED_FUNCTION_26_4();
  v3 = result;
  v24 = *(_QWORD *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    OUTLINED_FUNCTION_27();
    return v3;
  }
  v4 = 0;
  v5 = result + 56;
  while (v4 < *(_QWORD *)(a1 + 16))
  {
    v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    v8 = *v6;
    v7 = v6[1];
    sub_1AF2417EC();
    swift_bridgeObjectRetain();
    sub_1AF241300();
    result = sub_1AF241810();
    v9 = -1 << *(_BYTE *)(v3 + 32);
    v10 = result & ~v9;
    v11 = v10 >> 6;
    v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
    v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      v14 = *(_QWORD *)(v3 + 48);
      v15 = (_QWORD *)(v14 + 16 * v10);
      v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (result = OUTLINED_FUNCTION_14_8(), (result & 1) != 0))
      {
LABEL_11:
        result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      v17 = ~v9;
      while (1)
      {
        v10 = (v10 + 1) & v17;
        v11 = v10 >> 6;
        v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
        v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          result = OUTLINED_FUNCTION_14_8();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_11;
      }
    }
    *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
    v20 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    *v20 = v8;
    v20[1] = v7;
    v21 = *(_QWORD *)(v3 + 16);
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_27;
    *(_QWORD *)(v3 + 16) = v23;
LABEL_22:
    if (++v4 == v24)
      goto LABEL_25;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_14_8()
{
  return sub_1AF241744();
}

uint64_t OUTLINED_FUNCTION_27_4()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1Tm(v0 - 128);
}

void OUTLINED_FUNCTION_28_3(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1AF21F578(v2 - 128, a2);
}

uint64_t OUTLINED_FUNCTION_29_2()
{
  return sub_1AF24157C();
}

uint64_t OUTLINED_FUNCTION_30_3()
{
  return sub_1AF240E50();
}

uint64_t OUTLINED_FUNCTION_34_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_35_1()
{
  void *v0;
  uint64_t v1;

  sub_1AF23C630(v0, v1);
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  uint64_t v0;

  return v0;
}

void sub_1AF23CBD8()
{
  strcpy((char *)&qword_1EEE33420, "AlpsWarehouse");
  *(_WORD *)&algn_1EEE33428[6] = -4864;
}

uint64_t static LegacyDataWarehouseConfig.mainFolderName.getter()
{
  return sub_1AF23CD14(&qword_1EEE33430, &qword_1EEE33420);
}

unint64_t static LegacyDataWarehouseConfig.databaseName.getter()
{
  return 0xD000000000000011;
}

void sub_1AF23CC44()
{
  qword_1EEE33458 = 0x6568635361746144;
  unk_1EEE33460 = 0xEB0000000073616DLL;
}

uint64_t static LegacyDataWarehouseConfig.schemaSubfolderName.getter()
{
  return sub_1AF23CD14(&qword_1EEE33468, &qword_1EEE33458);
}

void sub_1AF23CC90()
{
  qword_1EEE33438 = 1852797802;
  unk_1EEE33440 = 0xE400000000000000;
}

uint64_t static LegacyDataWarehouseConfig.schemaExtension.getter()
{
  return sub_1AF23CD14(&qword_1EEE33450, &qword_1EEE33438);
}

void sub_1AF23CCCC()
{
  qword_1EEE33400 = 0x73756F6865726177;
  unk_1EEE33408 = 0xE900000000000065;
}

uint64_t static LegacyDataWarehouseConfig.databaseAlias.getter()
{
  return sub_1AF23CD14(&qword_1EEE33418, &qword_1EEE33400);
}

uint64_t sub_1AF23CD14(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t LegacyDataWarehouseConfig.dataWarehouseUrl.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_105();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t LegacyDataWarehouseConfig.streamDescriptor.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for LegacyDataWarehouseConfig();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 20));
  return result;
}

uint64_t type metadata accessor for LegacyDataWarehouseConfig()
{
  uint64_t result;

  result = qword_1EEE33470;
  if (!qword_1EEE33470)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t LegacyDataWarehouseConfig.databaseUrl.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_14_9();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v0, *MEMORY[0x1E0CAFD68], v1);
  sub_1AF208AB8();
  sub_1AF240E20();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  return swift_bridgeObjectRelease();
}

uint64_t LegacyDataWarehouseConfig.schemaFolderUrl.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_14_9();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_11();
  if (qword_1EEE33468 != -1)
    swift_once();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v0, *MEMORY[0x1E0CAFD60], v1);
  sub_1AF208AB8();
  swift_bridgeObjectRetain();
  sub_1AF240E20();
  OUTLINED_FUNCTION_11_9(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  return swift_bridgeObjectRelease();
}

uint64_t LegacyDataWarehouseConfig.contextSchemaUrl.getter@<X0>(uint64_t a1@<X8>)
{
  return URL.legacyAggregationSchemaUrl(forMessageName:)(0xD000000000000020, 0x80000001AF248590, a1);
}

uint64_t URL.legacyAggregationSchemaUrl(forMessageName:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v15 = a1;
  v16 = a2;
  v18 = a3;
  v3 = OUTLINED_FUNCTION_14_9();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_57();
  v17 = OUTLINED_FUNCTION_105();
  v14 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_9();
  v6 = v4 - v5;
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v13 - v8;
  if (qword_1EEE33468 != -1)
    swift_once();
  v19 = qword_1EEE33458;
  v20 = unk_1EEE33460;
  OUTLINED_FUNCTION_7_11();
  sub_1AF208AB8();
  swift_bridgeObjectRetain();
  sub_1AF240E20();
  OUTLINED_FUNCTION_12_7();
  swift_bridgeObjectRelease();
  v19 = v15;
  v20 = v16;
  OUTLINED_FUNCTION_7_11();
  sub_1AF240E20();
  OUTLINED_FUNCTION_12_7();
  v10 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  v11 = v17;
  v10(v6, v17);
  if (qword_1EEE33450 != -1)
    swift_once();
  sub_1AF240DC0();
  return ((uint64_t (*)(char *, uint64_t))v10)(v9, v11);
}

uint64_t LegacyDataWarehouseConfig.metricsSchemaUrl.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  if (*(_BYTE *)(v1 + *(int *)(type metadata accessor for LegacyDataWarehouseConfig() + 20)) == 2)
  {
    v7 = FeedbackStreamDescriptor.rawValue.getter();
    v8 = v3;
    swift_bridgeObjectRetain();
    sub_1AF24133C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1AF24133C();
    swift_bridgeObjectRelease();
    v4 = v7;
    v5 = v8;
  }
  else
  {
    v4 = 0;
    v5 = 0xE000000000000000;
  }
  URL.legacyAggregationSchemaUrl(forMessageName:)(v4, v5, a1);
  return swift_bridgeObjectRelease();
}

unint64_t LegacyDataWarehouseConfig.attachSQLStatementString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_105();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_11();
  sub_1AF241630();
  swift_bridgeObjectRelease();
  LegacyDataWarehouseConfig.databaseUrl.getter();
  sub_1AF209828();
  sub_1AF241720();
  sub_1AF24133C();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11_9(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_1AF24133C();
  if (qword_1EEE33418 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1AF24133C();
  swift_bridgeObjectRelease();
  return 0xD000000000000011;
}

unint64_t LegacyDataWarehouseConfig.detachSQLStatementString.getter()
{
  sub_1AF241630();
  swift_bridgeObjectRelease();
  if (qword_1EEE33418 != -1)
    swift_once();
  return 0xD000000000000019;
}

void LegacyDataWarehouseConfig.init(dataWarehouseUrl:streamDescriptor:fileManager:)(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
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
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  void (*v24)(void);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;

  v29 = a4;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_9();
  v11 = v9 - v10;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v29 - v13;
  v15 = sub_1AF240E2C();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_57();
  v19 = v18 - v17;
  v20 = *a2;
  v30 = a1;
  sub_1AF2388DC(a1, v11);
  if (__swift_getEnumTagSinglePayload(v11, 1, v15) == 1)
  {
    v31 = v20;
    NSFileManager.legacyDataWarehouseUrl(for:)(&v31, (uint64_t)v14);
    if (v4)
    {

      OUTLINED_FUNCTION_20();
      v21 = v11;
LABEL_8:
      sub_1AF22F1D0(v21);
      goto LABEL_12;
    }
    sub_1AF22F1D0(v11);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 32))(v14, v11, v15);
    __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v15);
  }
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v15) == 1)
  {
    sub_1AF22F1D0((uint64_t)v14);
    sub_1AF238D08();
    v22 = OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_6_14(v22, v23);

    v21 = v30;
    goto LABEL_8;
  }
  v24 = *(void (**)(void))(v16 + 32);
  ((void (*)(uint64_t, char *, uint64_t))v24)(v19, v14, v15);
  if ((sub_1AF240D84() & 1) != 0)
  {

    OUTLINED_FUNCTION_20();
    *(_BYTE *)(v29 + *(int *)(type metadata accessor for LegacyDataWarehouseConfig() + 20)) = v20;
    v24();
  }
  else
  {
    v25 = sub_1AF240D9C();
    v27 = v26;
    sub_1AF238D08();
    OUTLINED_FUNCTION_8();
    *v28 = v25;
    v28[1] = v27;
    swift_willThrow();

    OUTLINED_FUNCTION_20();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v19, v15);
  }
LABEL_12:
  OUTLINED_FUNCTION_0();
}

void NSFileManager.legacyDataWarehouseUrl(for:)(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  void *v4;
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
  char *v19;
  int v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  os_log_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  void *v49;
  char *v50;
  uint64_t v51[4];

  v48 = a2;
  v3 = sub_1AF240D90();
  v4 = *(void **)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_57();
  v7 = v6 - v5;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_57();
  v11 = v10 - v9;
  v12 = sub_1AF240E2C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_9();
  v16 = v14 - v15;
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v41 - v18;
  v20 = *a1;
  v21 = v50;
  sub_1AF209250(v49);
  if (v21)
  {

    OUTLINED_FUNCTION_3_15(v11, 1);
LABEL_4:
    sub_1AF22F1D0(v11);
    sub_1AF227FC8();
    v22 = OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_6_14(v22, v23);
    goto LABEL_5;
  }
  v43 = 0;
  v44 = v3;
  v47 = v20;
  v45 = v7;
  v46 = v16;
  v49 = v4;
  v50 = v19;
  OUTLINED_FUNCTION_3_15(v11, 0);
  if (__swift_getEnumTagSinglePayload(v11, 1, v12) == 1)
    goto LABEL_4;
  v24 = v13;
  v25 = (uint64_t)v50;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 32))(v50, v11, v12);
  if (qword_1ED32EC08 != -1)
    swift_once();
  v26 = sub_1AF2411B0();
  __swift_project_value_buffer(v26, (uint64_t)qword_1ED330238);
  v27 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
  v28 = v46;
  v27(v46, v25, v12);
  v29 = sub_1AF241198();
  v30 = sub_1AF241498();
  if (os_log_type_enabled(v29, v30))
  {
    v42 = v29;
    v31 = (uint8_t *)swift_slowAlloc();
    v51[0] = swift_slowAlloc();
    *(_DWORD *)v31 = 136315138;
    sub_1AF209828();
    v32 = sub_1AF241720();
    v51[3] = sub_1AF208AF4(v32, v33, v51);
    sub_1AF24157C();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v28, v12);
    _os_log_impl(&dword_1AF203000, v42, v30, "Container URL: %s", v31, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_16_4(v28);

  v35 = v44;
  v34 = v45;
  v37 = v48;
  v36 = (void (**)(_QWORD, _QWORD, _QWORD))v49;
  if (v47 == 2)
  {
    if (qword_1EEE33430 != -1)
      swift_once();
    v51[0] = qword_1EEE33420;
    v51[1] = *(_QWORD *)algn_1EEE33428;
    v36[13](v34, *MEMORY[0x1E0CAFD78], v35);
    sub_1AF208AB8();
    swift_bridgeObjectRetain();
    v38 = v34;
    v39 = (uint64_t)v50;
    sub_1AF240E20();
    ((void (*)(uint64_t, uint64_t))v36[1])(v38, v35);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_16_4(v39);
    v40 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_16_4((uint64_t)v50);
    v40 = 1;
  }
  OUTLINED_FUNCTION_3_15(v37, v40);
LABEL_5:
  OUTLINED_FUNCTION_0();
}

_QWORD *initializeBufferWithCopyOfBuffer for LegacyDataWarehouseConfig(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1AF240E2C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for LegacyDataWarehouseConfig(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1AF240E2C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for LegacyDataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1AF240E2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for LegacyDataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1AF240E2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for LegacyDataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1AF240E2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for LegacyDataWarehouseConfig(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1AF240E2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for LegacyDataWarehouseConfig()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AF23DC8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v8;

  v6 = OUTLINED_FUNCTION_105();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 0x11)
    return v8 - 16;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for LegacyDataWarehouseConfig()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1AF23DD08(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_105();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 16;
  return result;
}

uint64_t sub_1AF23DD78()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1AF240E2C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_14_9()
{
  return sub_1AF240D90();
}

uint64_t sub_1AF23DDF0()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t *sub_1AF23DE6C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  MEMORY[0x1AF45A8C4](*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 96)), -1, -1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 88));
  return v0;
}

uint64_t sub_1AF23DEBC()
{
  sub_1AF23DE6C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AtomicProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AtomicProperty);
}

void sub_1AF23DEEC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  swift_checkMetadataState();
  if (v0 <= 0x3F)
  {
    sub_1AF23ED7C();
    if (v1 <= 0x3F)
    {
      sub_1AF240F04();
      if (v2 <= 0x3F)
        swift_initClassMetadata2();
    }
  }
}

uint64_t sub_1AF23DFC8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)v0 + 88) + 24))();
}

uint64_t sub_1AF23DFF4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)v0 + 88) + 32))();
}

uint64_t sub_1AF23E020()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)v0 + 88) + 40))(*(_QWORD *)(*(_QWORD *)v0 + 80));
}

uint64_t sub_1AF23E050(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  __int128 v8[2];
  uint64_t v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  MEMORY[0x1E0C80A78](a1);
  OUTLINED_FUNCTION_9_10();
  OUTLINED_FUNCTION_17_5(v1 + *(_QWORD *)(v2 + 112), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33F28);
  if (swift_dynamicCast())
  {
    sub_1AF220BCC(v8, (uint64_t)v10);
    v4 = v11;
    v5 = v12;
    __swift_project_boxed_opaque_existential_1(v10, v11);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  }
  else
  {
    v9 = 0;
    memset(v8, 0, sizeof(v8));
    sub_1AF209774((uint64_t)v8, (uint64_t *)&unk_1EEE33F30);
    v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_1AF23E138()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = sub_1AF240F04();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_9_10();
  OUTLINED_FUNCTION_17_5(v0 + *(_QWORD *)(*(_QWORD *)v0 + 144), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16));
  sub_1AF240EB0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
}

uint64_t sub_1AF23E1F0()
{
  return sub_1AF2412AC();
}

uint64_t sub_1AF23E21C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, _QWORD);
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t Strong;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _BYTE v32[12];
  int v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[22];
  char v43;

  v1 = (uint64_t)v0;
  v2 = *v0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32E948);
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = &v32[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = MEMORY[0x1E0C80A78](v4);
  v9 = &v32[-v8];
  v37 = v2;
  v41 = *(_QWORD *)(v2 + 80);
  v10 = *(_QWORD *)(v41 - 8);
  v11 = MEMORY[0x1E0C80A78](v7);
  v13 = &v32[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v11);
  v15 = &v32[-v14];
  v35 = *(_QWORD *)(v1 + 24);
  v36 = (_QWORD *)(v1 + 24);
  v34 = *(_QWORD *)(v1 + 32);
  v33 = *(unsigned __int8 *)(v1 + 40);
  v16 = *(unsigned __int8 *)(v1 + 41);
  v17 = *(_QWORD *)(v1 + 48);
  v18 = *(_QWORD *)(v1 + 56);
  v19 = *(_QWORD *)(v1 + 64);
  v38 = *(_QWORD *)(v1 + 72);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_6_9();
  v39 = v19;
  swift_bridgeObjectRetain();
  v40 = v17;
  sub_1AF23F064(v17);
  v20 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 112);
  v21 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v10 + 16);
  if ((v16 & 1) == 0 && v18)
  {
    OUTLINED_FUNCTION_12_8((uint64_t)v15, v20, v21);
    OUTLINED_FUNCTION_2_16();
    sub_1AF20CDCC(v1, (uint64_t)v9);
    v22 = sub_1AF241138();
    result = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v22);
    if ((_DWORD)result != 1)
    {
      OUTLINED_FUNCTION_4_13();
      swift_bridgeObjectRetain();
      sub_1AF23EC9C((uint64_t)v9, v16, v35, v34, v33, v18, v10, v18);
      OUTLINED_FUNCTION_10_6();
      (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v15, v10);
      (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v9, v22);
      goto LABEL_7;
    }
LABEL_14:
    __break(1u);
    return result;
  }
  OUTLINED_FUNCTION_12_8((uint64_t)v13, v20, v21);
  OUTLINED_FUNCTION_2_16();
  sub_1AF20CDCC(v1, (uint64_t)v6);
  v24 = sub_1AF241138();
  result = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v24);
  if ((_DWORD)result == 1)
  {
    __break(1u);
    goto LABEL_14;
  }
  v25 = OUTLINED_FUNCTION_4_13();
  sub_1AF23EC2C(v25, v16, v10, v18);
  (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v13, v10);
  (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v6, v24);
LABEL_7:
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v28 = Strong;
    v29 = type metadata accessor for ActivitySpan(0, v10, v18, v27);
    sub_1AF22AD70(v1, v28, v29, (uint64_t)&off_1E5F3BC20);
    v43 = 1;
    *(_QWORD *)&v42[14] = 0;
    *(_QWORD *)&v42[6] = 0;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10_6();
    OUTLINED_FUNCTION_95();
    swift_release();
    v30 = v36;
    *v36 = 0;
    v30[1] = 0;
    *((_BYTE *)v30 + 16) = 0;
    *(_BYTE *)(v1 + 41) = v43;
    *(_OWORD *)(v1 + 42) = *(_OWORD *)v42;
    v31 = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)(v1 + 56) = *(_QWORD *)&v42[14];
    *(_QWORD *)(v1 + 64) = v31;
    *(_QWORD *)(v1 + 72) = 0;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_72();
    OUTLINED_FUNCTION_95();
    swift_unknownObjectRelease();
    *(_BYTE *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 120)) = 1;
    return swift_weakAssign();
  }
  else
  {
    if ((sub_1AF23E050(0) & 1) != 0)
    {
      sub_1AF2414BC();
      sub_1AF2410F0();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10_6();
    return OUTLINED_FUNCTION_95();
  }
}

uint64_t sub_1AF23E5D4(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  os_unfair_lock_s *v9;

  v9 = *(os_unfair_lock_s **)(*(_QWORD *)(v4 + *(_QWORD *)(*(_QWORD *)v4 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v9);
  sub_1AF23F1EC(v4, a1, a2, a3, a4);
  os_unfair_lock_unlock(v9);
  return swift_release();
}

uint64_t *sub_1AF23E658()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  if ((*((_BYTE *)v0 + *(_QWORD *)(*v0 + 120)) & 1) == 0)
    (*(void (**)(void))(v1 + 400))();
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_72();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 112));

  sub_1AF209774((uint64_t)v0 + *(_QWORD *)(*v0 + 136), &qword_1ED32E948);
  v2 = sub_1AF240F04();
  OUTLINED_FUNCTION_86(v2);
  swift_release();
  return v0;
}

uint64_t sub_1AF23E730()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t (*)(), _QWORD))(*(_QWORD *)v0 + 408))(nullsub_1, 0);
}

uint64_t sub_1AF23E748(void (*a1)(void))
{
  uint64_t v1;
  os_unfair_lock_s *v3;

  v3 = *(os_unfair_lock_s **)(*(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 152)) + 16);
  swift_retain();
  os_unfair_lock_lock(v3);
  sub_1AF23F028(v1, a1);
  os_unfair_lock_unlock(v3);
  return swift_release();
}

uint64_t sub_1AF23E7B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
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
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;

  type metadata accessor for ActivitySpan.ActivityData(0, *(_QWORD *)(*(_QWORD *)v4 + 80), *(_QWORD *)(*(_QWORD *)v4 + 88), a4);
  swift_retain();
  sub_1AF21C3F8((void (*)(void))sub_1AF23F2BC);
  swift_release();
  sub_1AF2414B0();
  OUTLINED_FUNCTION_6_15();
  sub_1AF2414B0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
  v5 = OUTLINED_FUNCTION_22();
  *(_OWORD *)(v5 + 16) = xmmword_1AF242880;
  sub_1AF23E020();
  v6 = sub_1AF241648();
  v8 = v7;
  v9 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v5 + 56) = MEMORY[0x1E0DEA968];
  v10 = sub_1AF20BFF4();
  *(_QWORD *)(v5 + 64) = v10;
  *(_QWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 40) = v8;
  v11 = v9;
  v12 = v10;
  v13 = sub_1AF23DFF4();
  *(_QWORD *)(v5 + 96) = v11;
  *(_QWORD *)(v5 + 104) = v12;
  *(_QWORD *)(v5 + 72) = v13;
  *(_QWORD *)(v5 + 80) = v14;
  v15 = sub_1AF23DFC8();
  *(_QWORD *)(v5 + 136) = v11;
  *(_QWORD *)(v5 + 144) = v12;
  *(_QWORD *)(v5 + 112) = v15;
  *(_QWORD *)(v5 + 120) = v16;
  sub_1AF2410F0();
  OUTLINED_FUNCTION_95();
  if ((v30 & 1) == 0)
  {
    sub_1AF2414B0();
    v17 = OUTLINED_FUNCTION_1_16();
    *(_OWORD *)(v17 + 16) = xmmword_1AF242860;
    v18 = sub_1AF241648();
    *(_QWORD *)(v17 + 56) = v11;
    *(_QWORD *)(v17 + 64) = v12;
    *(_QWORD *)(v17 + 32) = v18;
    *(_QWORD *)(v17 + 40) = v19;
    OUTLINED_FUNCTION_0_16();
    OUTLINED_FUNCTION_40();
    if (v32)
    {
      OUTLINED_FUNCTION_6_9();
      sub_1AF2414B0();
      v20 = OUTLINED_FUNCTION_1_16();
      *(_OWORD *)(v20 + 16) = xmmword_1AF242860;
      *(_QWORD *)(v20 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33CF8);
      *(_QWORD *)(v20 + 64) = sub_1AF22D2DC(&qword_1EEE33D00, &qword_1EEE33CF8, MEMORY[0x1E0CB1B18]);
      *(_QWORD *)(v20 + 32) = v32;
      OUTLINED_FUNCTION_0_16();
      OUTLINED_FUNCTION_40();
    }
  }
  if (v31)
  {
    swift_bridgeObjectRetain();
    sub_1AF2414B0();
    v21 = OUTLINED_FUNCTION_1_16();
    *(_OWORD *)(v21 + 16) = xmmword_1AF242860;
    *(_QWORD *)(v21 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEE33CE8);
    *(_QWORD *)(v21 + 64) = sub_1AF22D2DC(&qword_1EEE33CF0, &qword_1EEE33CE8, MEMORY[0x1E0CB1828]);
    *(_QWORD *)(v21 + 32) = v31;
    OUTLINED_FUNCTION_0_16();
    OUTLINED_FUNCTION_40();
  }
  if (v33 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_1AF2416B4();
    v22 = result;
    if (!result)
      goto LABEL_13;
  }
  else
  {
    v22 = *(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v22)
      goto LABEL_13;
  }
  if (v22 < 1)
  {
    __break(1u);
    return result;
  }
  v24 = 0;
  v25 = MEMORY[0x1E0DEA968];
  do
  {
    ++v24;
    swift_unknownObjectRetain();
    sub_1AF2414B0();
    v26 = OUTLINED_FUNCTION_22();
    *(_OWORD *)(v26 + 16) = xmmword_1AF242860;
    swift_unknownObjectRetain();
    v27 = sub_1AF2412AC();
    *(_QWORD *)(v26 + 56) = v25;
    *(_QWORD *)(v26 + 64) = v12;
    *(_QWORD *)(v26 + 32) = v27;
    *(_QWORD *)(v26 + 40) = v28;
    sub_1AF2410F0();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_55();
  }
  while (v22 != v24);
LABEL_13:
  OUTLINED_FUNCTION_13_4();
  sub_1AF2414B0();
  v29 = OUTLINED_FUNCTION_6_15();
  if ((sub_1AF23E050(v29) & 1) != 0)
  {
    sub_1AF2414BC();
    OUTLINED_FUNCTION_6_15();
  }
  OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_55();
  OUTLINED_FUNCTION_72();
  return swift_unknownObjectRelease();
}

uint64_t sub_1AF23EC2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1AF2414D4();
  (*(void (**)(uint64_t, uint64_t))(a4 + 40))(a3, a4);
  return sub_1AF241108();
}

void sub_1AF23EC9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v16 = sub_1AF2414D4();
  v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 40))(a7, a8);
  LOBYTE(v20) = a5;
  sub_1AF20CB84(v16, a2, v17, v18, v19, a1, a3, a4, v20, a6);
}

uint64_t sub_1AF23ED4C()
{
  sub_1AF23E658();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ActivitySpan(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ActivitySpan);
}

void sub_1AF23ED7C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED32E950)
  {
    sub_1AF241138();
    v0 = sub_1AF241534();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED32E950);
  }
}

uint64_t sub_1AF23EDD0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1AF23EDD8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t sub_1AF23EE10(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_1AF23EE74(uint64_t a1, __int128 *a2)
{
  __int128 v4;

  v4 = *a2;
  *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
  *(_OWORD *)a1 = v4;
  *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_1AF23EF2C(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_1AF23EF90(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 40);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1AF23EFD0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for ActivitySpan.ActivityData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ActivitySpan.ActivityData);
}

uint64_t sub_1AF23F028(uint64_t result, void (*a2)(void))
{
  if ((*(_BYTE *)(result + *(_QWORD *)(*(_QWORD *)result + 120)) & 1) == 0)
  {
    a2();
    return sub_1AF23E21C();
  }
  return result;
}

void sub_1AF23F064(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (sub_1AF23F2C4(a1))
  {
    sub_1AF2414A4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED32EA40);
    v1 = OUTLINED_FUNCTION_22();
    *(_OWORD *)(v1 + 16) = xmmword_1AF242870;
    v2 = sub_1AF23DFF4();
    v4 = v3;
    v5 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
    v6 = sub_1AF20BFF4();
    *(_QWORD *)(v1 + 64) = v6;
    *(_QWORD *)(v1 + 32) = v2;
    *(_QWORD *)(v1 + 40) = v4;
    sub_1AF229DF0();
    OUTLINED_FUNCTION_11_10();
    v7 = sub_1AF241204();
    *(_QWORD *)(v1 + 96) = v5;
    *(_QWORD *)(v1 + 104) = v6;
    *(_QWORD *)(v1 + 72) = v7;
    *(_QWORD *)(v1 + 80) = v8;
    sub_1AF2410F0();
    swift_bridgeObjectRelease();
    sub_1AF23DFC8();
    sub_1AF23DFF4();
    sub_1AF21BE5C();
    v9 = (void *)sub_1AF24124C();
    OUTLINED_FUNCTION_95();
    OUTLINED_FUNCTION_11_10();
    v10 = (id)sub_1AF2411EC();
    AnalyticsSendEvent();
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_55();
    swift_bridgeObjectRelease();

  }
}

uint64_t sub_1AF23F1EC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  *(_QWORD *)(a1 + 24) = a2;
  *(_QWORD *)(a1 + 32) = a3;
  *(_BYTE *)(a1 + 40) = a4;
  *(_BYTE *)(a1 + 41) = 0;
  *(_QWORD *)(a1 + 56) = a5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1AF23F224@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_BYTE *)(a1 + 40);
  v3 = *(_BYTE *)(a1 + 41);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 72);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 24);
  *(_BYTE *)(a2 + 16) = v2;
  *(_BYTE *)(a2 + 17) = v3;
  *(_QWORD *)(a2 + 24) = v4;
  *(_QWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 40) = v7;
  *(_QWORD *)(a2 + 48) = v6;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

id sub_1AF23F28C()
{
  uint64_t v0;

  return *(id *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 128));
}

uint64_t sub_1AF23F2A4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t sub_1AF23F2B0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t sub_1AF23F2BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1AF23F224(v1, a1);
}

uint64_t sub_1AF23F2C4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t DynamicType;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;

  v2 = v1;
  v4 = *v1;
  v5 = *(_QWORD *)(*v1 + 80);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](a1);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, (uint64_t)v2 + *(_QWORD *)(v4 + 112), v5);
  DynamicType = swift_getDynamicType();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v10 = dynamic_cast_existential_1_conditional(DynamicType);
  v12 = 0;
  if (v10 && a1)
  {
    v13 = v10;
    v14 = v11;
    v15 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 16);
    OUTLINED_FUNCTION_6_9();
    v16 = v15(v13, v14);
    v18 = v17;
    sub_1AF241384();
    v19 = sub_1AF241570();
    swift_isUniquelyReferenced_nonNull_native();
    v26 = a1;
    sub_1AF21ECE8(v19, v16, v18);
    v20 = v26;
    OUTLINED_FUNCTION_10_6();
    swift_bridgeObjectRelease();
    v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 8))(v13, v14);
    v23 = v22;
    sub_1AF23E138();
    v24 = sub_1AF24145C();
    swift_isUniquelyReferenced_nonNull_native();
    v27 = v20;
    sub_1AF21ECE8(v24, v21, v23);
    v12 = v27;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v12;
}

uint64_t dynamic_cast_existential_1_conditional(uint64_t a1)
{
  if (swift_conformsToProtocol2())
    return a1;
  else
    return 0;
}

_QWORD *sub_1AF23F4BC(id a1)
{
  _QWORD *v1;

  v1[2] = 0x6E6F6973726576;
  v1[3] = 0xE700000000000000;
  v1[4] = 1685217635;
  v1[5] = 0xE400000000000000;
  v1[6] = 49;
  v1[7] = 0xE100000000000000;
  v1[8] = 0x6C616E7265746E69;
  v1[9] = 0xE800000000000000;
  v1[10] = 1684366707;
  v1[11] = 0xE400000000000000;
  v1[12] = 0x636F6C5F69726973;
  v1[13] = 0xEB00000000656C61;
  v1[14] = 0x6C62616E655F7368;
  v1[15] = 0xEA00000000006465;
  v1[16] = 0x676E6C74616CLL;
  v1[17] = 0xE600000000000000;
  v1[18] = 0x6372736F6567;
  v1[19] = 0xE600000000000000;
  v1[20] = 0x6F6E72657375;
  v1[21] = 0xE600000000000000;
  v1[22] = 7955819;
  v1[23] = 0xE300000000000000;
  v1[24] = 7041900;
  v1[25] = 0xE300000000000000;
  v1[26] = 0x656C61636F6CLL;
  v1[27] = 0xE600000000000000;
  v1[28] = 7107429;
  v1[29] = 0xE300000000000000;
  v1[30] = 25443;
  v1[31] = 0xE200000000000000;
  v1[32] = 0x746E656761;
  v1[33] = 0xE500000000000000;
  v1[34] = 0x5255676142524150;
  v1[35] = 0xE90000000000004CLL;
  v1[36] = 0xD00000000000001FLL;
  v1[37] = 0x80000001AF248BC0;
  v1[38] = 0xD00000000000001ELL;
  v1[39] = 0x80000001AF248BE0;
  v1[40] = 0xD000000000000011;
  v1[41] = 0x80000001AF248C00;
  v1[42] = 0x6567412D72657355;
  v1[43] = 0xEA0000000000746ELL;
  if (!a1)
    a1 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1[44] = a1;
  return v1;
}

void sub_1AF23F69C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if ((a5 & 1) != 0)
  {
    OUTLINED_FUNCTION_12_9();
    sub_1AF23F6E8(v5, v6, v7, v8, v9);
  }
  else
  {
    OUTLINED_FUNCTION_12_9();
    sub_1AF23F950(v10, v11, v12, v13, v14);
  }
}

void sub_1AF23F6E8(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
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
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[3];
  char v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;

  v43 = a5;
  v44 = a4;
  v34 = a3;
  v7 = OUTLINED_FUNCTION_105();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_9();
  v11 = v9 - v10;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v33 - v13;
  v15 = *a2;
  v41 = a2[1];
  v42 = v15;
  v40 = a2[2];
  v39 = *((unsigned __int8 *)a2 + 24);
  v16 = a2[4];
  v37 = a2[5];
  v38 = v16;
  v17 = a2[6];
  v35 = a2[7];
  v36 = v17;
  v18 = a1[3];
  v19 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v18);
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v19);
  v20 = v51;
  sub_1AF2400F0(v21, (uint64_t)v14);
  swift_bridgeObjectRelease();
  if (!v20)
  {
    v22 = v44;
    type metadata accessor for ParsecURLRequestBuilder();
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v11, v14, v7);
    v23 = sub_1AF221284();
    v51 = v14;
    if (v22)
      v24 = v34;
    else
      v24 = 0;
    if (!v22)
      v22 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_1AF23FB88(v23, v24, v22);
    swift_bridgeObjectRelease();
    sub_1AF23FBEC();
    sub_1AF23FC70();
    v25 = OUTLINED_FUNCTION_21_4();
    sub_1AF23FCB8(v25, v26);
    v27 = OUTLINED_FUNCTION_21_4();
    sub_1AF23FD10(v27, v28);
    v29 = OUTLINED_FUNCTION_21_4();
    sub_1AF23FD68(v29, v30);
    v31 = OUTLINED_FUNCTION_21_4();
    sub_1AF23FFD8(v31, v32);
    sub_1AF240030();
    v45[0] = v42;
    v45[1] = v41;
    v45[2] = v40;
    v46 = v39;
    v47 = v38;
    v48 = v37;
    v49 = v36;
    v50 = v35;
    sub_1AF240090(v23, v45);
    sub_1AF221714(v43);
    sub_1AF240BE0();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v51, v7);
  }
  OUTLINED_FUNCTION_0();
}

void sub_1AF23F950(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
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
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[3];
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v36 = a5;
  v37 = a4;
  v27 = a3;
  v44 = OUTLINED_FUNCTION_105();
  v8 = *(_QWORD *)(v44 - 8);
  MEMORY[0x1E0C80A78](v44);
  OUTLINED_FUNCTION_9();
  v11 = v9 - v10;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v25 - v13;
  v15 = *a2;
  v34 = a2[1];
  v35 = v15;
  v33 = a2[2];
  v32 = *((unsigned __int8 *)a2 + 24);
  v16 = a2[4];
  v30 = a2[5];
  v31 = v16;
  v17 = a2[6];
  v28 = a2[7];
  v29 = v17;
  v19 = a1[3];
  v18 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v19);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v18);
  sub_1AF2400F0(v20, (uint64_t)v14);
  swift_bridgeObjectRelease();
  if (!v5)
  {
    v21 = v37;
    type metadata accessor for ParsecURLRequestBuilder();
    v22 = v44;
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v11, v14, v44);
    v23 = sub_1AF221284();
    v26 = v14;
    if (v21)
      v24 = v27;
    else
      v24 = 0;
    if (!v21)
      v21 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_1AF23FB88(v23, v24, v21);
    swift_bridgeObjectRelease();
    sub_1AF23FC70();
    sub_1AF23FCB8(v23, a1);
    sub_1AF23FD10(v23, a1);
    sub_1AF23FFD8(v23, a1);
    v38[0] = v35;
    v38[1] = v34;
    v38[2] = v33;
    v39 = v32;
    v40 = v31;
    v41 = v30;
    v42 = v29;
    v43 = v28;
    sub_1AF2400C0(v23, v38);
    sub_1AF221714(v36);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v26, v22);
    swift_release();
  }
  OUTLINED_FUNCTION_0();
}

void sub_1AF23FB88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if ((a2 || a3 != 0xE000000000000000) && (sub_1AF241744() & 1) == 0)
    sub_1AF221D14(*(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
  OUTLINED_FUNCTION_49();
}

void sub_1AF23FBEC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[22];
  v2 = v0[23];
  if (qword_1EEE33568 != -1)
    swift_once();
  sub_1AF221D14(v1, v2);
  sub_1AF221D14(v0[24], v0[25]);
  OUTLINED_FUNCTION_49();
}

uint64_t sub_1AF23FC70()
{
  uint64_t v0;

  v0 = sub_1AF240428();
  if (*(_QWORD *)(v0 + 16))
    sub_1AF22120C(v0);
  return swift_bridgeObjectRelease();
}

void sub_1AF23FCB8(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  OUTLINED_FUNCTION_3_16(a1, a2);
  OUTLINED_FUNCTION_7_12(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16));
  if (v4)
  {
    OUTLINED_FUNCTION_15_6();
    v6 = v6 && v5 == 0xE000000000000000;
    if (!v6 && (OUTLINED_FUNCTION_1_17() & 1) == 0)
      OUTLINED_FUNCTION_6_16(*(_QWORD *)(v2 + 208), *(_QWORD *)(v2 + 216));
    OUTLINED_FUNCTION_0_17();
  }
  else
  {
    OUTLINED_FUNCTION_12_2();
  }
}

void sub_1AF23FD10(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  OUTLINED_FUNCTION_3_16(a1, a2);
  OUTLINED_FUNCTION_7_12(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24));
  if (v4)
  {
    OUTLINED_FUNCTION_15_6();
    v6 = v6 && v5 == 0xE000000000000000;
    if (!v6 && (OUTLINED_FUNCTION_1_17() & 1) == 0)
      OUTLINED_FUNCTION_6_16(*(_QWORD *)(v2 + 224), *(_QWORD *)(v2 + 232));
    OUTLINED_FUNCTION_0_17();
  }
  else
  {
    OUTLINED_FUNCTION_12_2();
  }
}

void sub_1AF23FD68(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  id v24[2];

  v3 = v2;
  v24[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = sub_1AF2412A0();
  MEMORY[0x1E0C80A78](v5);
  v6 = a2[3];
  v7 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v6);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 32))(v6, v7);
  if (v8)
  {
    if (!*(_QWORD *)(v8 + 16))
    {
      OUTLINED_FUNCTION_0_17();
      return;
    }
    v9 = (void *)objc_opt_self();
    v10 = (void *)sub_1AF2413B4();
    swift_bridgeObjectRelease();
    v24[0] = 0;
    v11 = objc_msgSend(v9, sel_dataWithJSONObject_options_error_, v10, 0, v24);

    v12 = v24[0];
    if (v11)
    {
      v13 = sub_1AF240E5C();
      v15 = v14;

      sub_1AF241294();
      v16 = sub_1AF24127C();
      if (v17)
      {
        sub_1AF221EDC(*(_QWORD *)(v3 + 320), *(_QWORD *)(v3 + 328), v16, v17);
        OUTLINED_FUNCTION_95();
      }
      sub_1AF219BC4(v13, v15);
    }
    else
    {
      v18 = v12;
      v19 = (void *)sub_1AF240D6C();

      swift_willThrow();
      if (qword_1EEE33590 != -1)
        swift_once();
      v20 = sub_1AF2411B0();
      __swift_project_value_buffer(v20, (uint64_t)qword_1EEE34010);
      v21 = sub_1AF241198();
      v22 = sub_1AF2414B0();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)OUTLINED_FUNCTION_4();
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_1AF203000, v21, v22, "Error encoding preferred languages", v23, 2u);
        OUTLINED_FUNCTION_1();
      }

    }
  }
  OUTLINED_FUNCTION_12_2();
}

void sub_1AF23FFD8(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;

  OUTLINED_FUNCTION_3_16(a1, a2);
  OUTLINED_FUNCTION_7_12(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  if (v4)
  {
    OUTLINED_FUNCTION_15_6();
    v6 = v6 && v5 == 0xE000000000000000;
    if (!v6 && (OUTLINED_FUNCTION_1_17() & 1) == 0)
      OUTLINED_FUNCTION_6_16(*(_QWORD *)(v2 + 240), *(_QWORD *)(v2 + 248));
    OUTLINED_FUNCTION_0_17();
  }
  else
  {
    OUTLINED_FUNCTION_12_2();
  }
}

void sub_1AF240030()
{
  uint64_t v0;

  if (qword_1EEE33520 != -1)
    swift_once();
  if (byte_1EEE33FF0 == 1)
    sub_1AF221D14(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  OUTLINED_FUNCTION_50();
}

void sub_1AF240090(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  if (*a2)
    sub_1AF221EDC(*(_QWORD *)(v2 + 336), *(_QWORD *)(v2 + 344), a2[4], a2[5]);
  OUTLINED_FUNCTION_50();
}

void sub_1AF2400C0(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  if (*a2)
    sub_1AF221D14(*(_QWORD *)(v2 + 256), *(_QWORD *)(v2 + 264));
  OUTLINED_FUNCTION_50();
}

void sub_1AF2400F0(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;

  v21 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED32FF80);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_9();
  v7 = v5 - v6;
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v20 - v9;
  v11 = *(void **)(v2 + 352);
  v12 = (void *)sub_1AF24124C();
  v13 = objc_msgSend(v11, sel_stringForKey_, v12);

  if (v13)
  {
    sub_1AF241270();

    sub_1AF240DFC();
    swift_bridgeObjectRelease();
    v14 = OUTLINED_FUNCTION_105();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v14) != 1)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v21, v10, v14);
      goto LABEL_17;
    }
    sub_1AF22F1D0((uint64_t)v10);
  }
  if (a1)
  {
    v15 = sub_1AF2412C4();
    if (v16)
    {
      if (v15 == 20035 && v16 == 0xE200000000000000)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_1AF241744();
        swift_bridgeObjectRelease();
      }
    }
  }
  swift_bridgeObjectRetain();
  sub_1AF240DFC();
  swift_bridgeObjectRelease();
  v18 = OUTLINED_FUNCTION_105();
  if (__swift_getEnumTagSinglePayload(v7, 1, v18) == 1)
  {
    sub_1AF22F1D0(v7);
    sub_1AF2220D8();
    swift_allocError();
    *v19 = 1;
    swift_willThrow();
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v21, v7, v18);
  }
LABEL_17:
  OUTLINED_FUNCTION_0();
}

uint64_t sub_1AF240324()
{
  uint64_t v0;

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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_1AF2403E8()
{
  sub_1AF240324();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PARNetworkRequestFactory()
{
  return objc_opt_self();
}

uint64_t sub_1AF240428()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  unint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  _QWORD *v74;
  uint64_t result;
  char v76[8];
  uint64_t v77;
  uint64_t *v78;
  _QWORD v79[2];
  __int128 v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94[3];

  v1 = sub_1AF240C88();
  v84 = *(_QWORD *)(v1 - 8);
  v85 = v1;
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)v79 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (void *)sub_1AF24124C();
  v5 = objc_msgSend(v0, sel_stringForKey_, v4);

  if (!v5)
    return MEMORY[0x1E0DEE9D8];
  v6 = sub_1AF241270();
  v8 = v7;

  if (qword_1EEE33590 != -1)
    goto LABEL_52;
  while (1)
  {
    v9 = sub_1AF2411B0();
    v10 = __swift_project_value_buffer(v9, (uint64_t)qword_1EEE34010);
    swift_bridgeObjectRetain_n();
    v82 = v10;
    v11 = sub_1AF241198();
    v12 = sub_1AF2414C8();
    v13 = os_log_type_enabled(v11, v12);
    v14 = MEMORY[0x1E0DEE9B8];
    v83 = v3;
    if (v13)
    {
      v15 = (uint8_t *)OUTLINED_FUNCTION_4();
      v94[0] = OUTLINED_FUNCTION_4();
      *(_DWORD *)v15 = 136315138;
      swift_bridgeObjectRetain();
      v93 = sub_1AF208AF4(v6, v8, v94);
      sub_1AF24157C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1AF203000, v11, v12, "processing debug parameters %s", v15, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }

    v16 = OUTLINED_FUNCTION_20_3();
    v94[0] = 38;
    v94[1] = 0xE100000000000000;
    MEMORY[0x1E0C80A78](v16);
    v78 = v94;
    swift_bridgeObjectRetain();
    v17 = sub_1AF239130(0x7FFFFFFFFFFFFFFFLL, 1u, sub_1AF224584, (uint64_t)v76, v6, v8);
    swift_bridgeObjectRelease();
    v87 = *(_QWORD *)(v17 + 16);
    if (!v87)
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x1E0DEE9D8];
    }
    v19 = 0;
    v86 = v17 + 32;
    v6 = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)&v18 = 136315138;
    v80 = v18;
    v79[1] = v14 + 8;
    v20 = v17;
    v81 = v17;
LABEL_7:
    if (v19 < *(_QWORD *)(v20 + 16))
      break;
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    swift_once();
  }
  v88 = v19;
  v89 = v6;
  v21 = (unint64_t *)(v86 + 32 * v19);
  v22 = *v21;
  v23 = v21[1] >> 14;
  v24 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  if (v23 == *v21 >> 14)
  {
LABEL_35:
    if (v24[2] == 2)
    {
      v54 = v24;
      v55 = v24[4];
      v56 = v24[5];
      v57 = v54[6];
      v58 = v54[7];
      swift_bridgeObjectRetain();
      v6 = MEMORY[0x1AF459D9C](v55, v56, v57, v58);
      OUTLINED_FUNCTION_95();
      if (v54[2] < 2uLL)
        goto LABEL_51;
      v59 = v54[8];
      v60 = v54[9];
      v8 = v54[10];
      v61 = v54[11];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      MEMORY[0x1AF459D9C](v59, v60, v8, v61);
      OUTLINED_FUNCTION_55();
      sub_1AF240C64();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_95();
      v6 = v89;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_22_3(0, *(_QWORD *)(v6 + 16) + 1);
        v6 = v71;
      }
      v63 = *(_QWORD *)(v6 + 16);
      v62 = *(_QWORD *)(v6 + 24);
      if (v63 >= v62 >> 1)
      {
        OUTLINED_FUNCTION_22_3(v62 > 1, v63 + 1);
        v6 = v72;
      }
      *(_QWORD *)(v6 + 16) = v63 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v84 + 32))(v6+ ((*(unsigned __int8 *)(v84 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v84 + 80))+ *(_QWORD *)(v84 + 72) * v63, v3, v85);
    }
    else
    {
      swift_bridgeObjectRetain();
      v64 = sub_1AF241198();
      v65 = sub_1AF2414B0();
      if (os_log_type_enabled(v64, v65))
      {
        v66 = OUTLINED_FUNCTION_4();
        v94[0] = OUTLINED_FUNCTION_4();
        *(_DWORD *)v66 = v80;
        v67 = swift_bridgeObjectRetain();
        v68 = MEMORY[0x1AF459E8C](v67, MEMORY[0x1E0DEBAF0]);
        v70 = v69;
        swift_bridgeObjectRelease();
        *(_QWORD *)(v66 + 4) = sub_1AF208AF4(v68, v70, v94);
        OUTLINED_FUNCTION_20_3();
        OUTLINED_FUNCTION_55();
        _os_log_impl(&dword_1AF203000, v64, v65, "invalid query components: %s", (uint8_t *)v66, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
      }

      OUTLINED_FUNCTION_20_3();
      v6 = v89;
    }
    v19 = v88 + 1;
    if (v88 + 1 == v87)
    {
      swift_bridgeObjectRelease();
      return v6;
    }
    goto LABEL_7;
  }
  v25 = v21[3];
  swift_bridgeObjectRetain_n();
  v26 = v22;
  v27 = v22;
  v28 = v22;
  v92 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  do
  {
    OUTLINED_FUNCTION_9_11();
    v29 = v25;
    if (sub_1AF241558() == 61 && v30 == 0xE100000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v8 = v30;
      v32 = sub_1AF241744();
      swift_bridgeObjectRelease();
      if ((v32 & 1) == 0)
      {
        OUTLINED_FUNCTION_9_11();
        v25 = v29;
        v26 = sub_1AF241540();
        continue;
      }
    }
    if (v27 >> 14 != v26 >> 14)
    {
      if (v26 >> 14 < v27 >> 14)
        goto LABEL_53;
      v33 = sub_1AF241564();
      v90 = v35;
      v91 = v34;
      v8 = v36;
      if ((OUTLINED_FUNCTION_17_6() & 1) == 0)
      {
        OUTLINED_FUNCTION_8_12();
        v28 = v42;
      }
      OUTLINED_FUNCTION_16_5();
      if (v28 >= v38 >> 1)
      {
        sub_1AF235570();
        v37 = v43;
      }
      v92 = v37;
      v37[2] = v28 + 1;
      v39 = &v37[4 * v28];
      v40 = v91;
      v39[4] = v33;
      v39[5] = v40;
      v41 = v90;
      v39[6] = v8;
      v39[7] = v41;
    }
    v25 = v29;
    OUTLINED_FUNCTION_9_11();
    v26 = sub_1AF241540();
    v27 = v26;
    v28 = v26;
  }
  while (v23 != v26 >> 14);
  if (v23 == v27 >> 14)
  {
    OUTLINED_FUNCTION_55();
    v3 = v83;
    v20 = v81;
    v24 = v92;
LABEL_34:
    OUTLINED_FUNCTION_55();
    goto LABEL_35;
  }
  if (v23 >= v28 >> 14)
  {
    v44 = sub_1AF241564();
    v46 = v45;
    v48 = v47;
    v50 = v49;
    OUTLINED_FUNCTION_55();
    if ((OUTLINED_FUNCTION_17_6() & 1) == 0)
    {
      OUTLINED_FUNCTION_8_12();
      v28 = v73;
    }
    v20 = v81;
    OUTLINED_FUNCTION_16_5();
    v8 = v28 + 1;
    if (v28 >= v52 >> 1)
    {
      sub_1AF235570();
      v51 = v74;
    }
    v51[2] = v8;
    v53 = &v51[4 * v28];
    v24 = v51;
    v53[4] = v44;
    v53[5] = v46;
    v53[6] = v48;
    v53[7] = v50;
    v3 = v83;
    goto LABEL_34;
  }
LABEL_53:
  LODWORD(v78) = 0;
  v77 = 754;
  v76[0] = 2;
  result = sub_1AF2416A8();
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_20_3()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_22_3(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_1AF235428(a1, a2, 1, v2);
}

uint64_t sub_1AF240BE0()
{
  return MEMORY[0x1E0CADEB8]();
}

uint64_t sub_1AF240BEC()
{
  return MEMORY[0x1E0CADEC8]();
}

uint64_t sub_1AF240BF8()
{
  return MEMORY[0x1E0CADED8]();
}

uint64_t sub_1AF240C04()
{
  return MEMORY[0x1E0CADEE8]();
}

uint64_t sub_1AF240C10()
{
  return MEMORY[0x1E0CADEF0]();
}

uint64_t sub_1AF240C1C()
{
  return MEMORY[0x1E0CADEF8]();
}

uint64_t sub_1AF240C28()
{
  return MEMORY[0x1E0CADF10]();
}

uint64_t sub_1AF240C34()
{
  return MEMORY[0x1E0CADF18]();
}

uint64_t sub_1AF240C40()
{
  return MEMORY[0x1E0CADF50]();
}

uint64_t sub_1AF240C4C()
{
  return MEMORY[0x1E0CAE3A0]();
}

uint64_t sub_1AF240C58()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1AF240C64()
{
  return MEMORY[0x1E0CAE668]();
}

uint64_t sub_1AF240C70()
{
  return MEMORY[0x1E0CAE670]();
}

uint64_t sub_1AF240C7C()
{
  return MEMORY[0x1E0CAE678]();
}

uint64_t sub_1AF240C88()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_1AF240C94()
{
  return MEMORY[0x1E0CAE768]();
}

uint64_t sub_1AF240CA0()
{
  return MEMORY[0x1E0CAE790]();
}

uint64_t sub_1AF240CAC()
{
  return MEMORY[0x1E0CAE798]();
}

uint64_t sub_1AF240CB8()
{
  return MEMORY[0x1E0CAE7C8]();
}

uint64_t sub_1AF240CC4()
{
  return MEMORY[0x1E0CAE7D0]();
}

uint64_t sub_1AF240CD0()
{
  return MEMORY[0x1E0CAE7E0]();
}

uint64_t sub_1AF240CDC()
{
  return MEMORY[0x1E0CAE800]();
}

uint64_t sub_1AF240CE8()
{
  return MEMORY[0x1E0CAE810]();
}

uint64_t sub_1AF240CF4()
{
  return MEMORY[0x1E0CAE840]();
}

uint64_t sub_1AF240D00()
{
  return MEMORY[0x1E0CAE858]();
}

uint64_t sub_1AF240D0C()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1AF240D18()
{
  return MEMORY[0x1E0CAE9D0]();
}

uint64_t sub_1AF240D24()
{
  return MEMORY[0x1E0CAE9F8]();
}

uint64_t sub_1AF240D30()
{
  return MEMORY[0x1E0CAEA28]();
}

uint64_t sub_1AF240D3C()
{
  return MEMORY[0x1E0CAEA38]();
}

uint64_t sub_1AF240D48()
{
  return MEMORY[0x1E0CAEA80]();
}

uint64_t sub_1AF240D54()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1AF240D60()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1AF240D6C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1AF240D78()
{
  return MEMORY[0x1E0CAFD20]();
}

uint64_t sub_1AF240D84()
{
  return MEMORY[0x1E0CAFD30]();
}

uint64_t sub_1AF240D90()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1AF240D9C()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1AF240DA8()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1AF240DB4()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t sub_1AF240DC0()
{
  return MEMORY[0x1E0CAFE90]();
}

uint64_t sub_1AF240DCC()
{
  return MEMORY[0x1E0CAFEB8]();
}

uint64_t sub_1AF240DD8()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1AF240DE4()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1AF240DF0()
{
  return MEMORY[0x1E0CAFF80]();
}

uint64_t sub_1AF240DFC()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1AF240E08()
{
  return MEMORY[0x1E0CAFF98]();
}

uint64_t sub_1AF240E14()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_1AF240E20()
{
  return MEMORY[0x1E0CAFFE0]();
}

uint64_t sub_1AF240E2C()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1AF240E38()
{
  return MEMORY[0x1E0CB00E8]();
}

uint64_t sub_1AF240E44()
{
  return MEMORY[0x1E0CB0108]();
}

uint64_t sub_1AF240E50()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1AF240E5C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1AF240E68()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1AF240E74()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t sub_1AF240E80()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1AF240E8C()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1AF240E98()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1AF240EA4()
{
  return MEMORY[0x1E0CB0700]();
}

uint64_t sub_1AF240EB0()
{
  return MEMORY[0x1E0CB0708]();
}

uint64_t sub_1AF240EBC()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1AF240EC8()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1AF240ED4()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1AF240EE0()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1AF240EEC()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1AF240EF8()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1AF240F04()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1AF240F10()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1AF240F1C()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1AF240F28()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1AF240F34()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1AF240F40()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1AF240F4C()
{
  return MEMORY[0x1E0CB0A90]();
}

uint64_t sub_1AF240F58()
{
  return MEMORY[0x1E0CB0BD8]();
}

uint64_t sub_1AF240F64()
{
  return MEMORY[0x1E0CB0C30]();
}

uint64_t sub_1AF240F70()
{
  return MEMORY[0x1E0CB0C38]();
}

uint64_t sub_1AF240F7C()
{
  return MEMORY[0x1E0CB0C48]();
}

uint64_t sub_1AF240F88()
{
  return MEMORY[0x1E0CB0DA8]();
}

uint64_t sub_1AF240F94()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_1AF240FA0()
{
  return MEMORY[0x1E0CB0DF0]();
}

uint64_t sub_1AF240FAC()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1AF240FB8()
{
  return MEMORY[0x1E0CB0F00]();
}

uint64_t sub_1AF240FC4()
{
  return MEMORY[0x1E0CB0F20]();
}

uint64_t sub_1AF240FD0()
{
  return MEMORY[0x1E0CB0FB8]();
}

uint64_t sub_1AF240FDC()
{
  return MEMORY[0x1E0CB1068]();
}

uint64_t sub_1AF240FE8()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1AF240FF4()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1AF241000()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1AF24100C()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1AF241018()
{
  return MEMORY[0x1E0CB14E0]();
}

uint64_t sub_1AF241024()
{
  return MEMORY[0x1E0CB14E8]();
}

uint64_t sub_1AF241030()
{
  return MEMORY[0x1E0CB14F0]();
}

uint64_t sub_1AF24103C()
{
  return MEMORY[0x1E0CB1500]();
}

uint64_t sub_1AF241048()
{
  return MEMORY[0x1E0CB1510]();
}

uint64_t sub_1AF241054()
{
  return MEMORY[0x1E0CB1518]();
}

uint64_t sub_1AF241060()
{
  return MEMORY[0x1E0CB1528]();
}

uint64_t sub_1AF24106C()
{
  return MEMORY[0x1E0CB1530]();
}

uint64_t sub_1AF241078()
{
  return MEMORY[0x1E0CB1538]();
}

uint64_t sub_1AF241084()
{
  return MEMORY[0x1E0CB1540]();
}

uint64_t sub_1AF241090()
{
  return MEMORY[0x1E0CB1550]();
}

uint64_t sub_1AF24109C()
{
  return MEMORY[0x1E0CB1560]();
}

uint64_t sub_1AF2410A8()
{
  return MEMORY[0x1E0CB1568]();
}

uint64_t sub_1AF2410B4()
{
  return MEMORY[0x1E0CB1578]();
}

uint64_t sub_1AF2410C0()
{
  return MEMORY[0x1E0D3EA98]();
}

uint64_t sub_1AF2410CC()
{
  return MEMORY[0x1E0D3EF28]();
}

uint64_t sub_1AF2410D8()
{
  return MEMORY[0x1E0D3EF38]();
}

uint64_t sub_1AF2410E4()
{
  return MEMORY[0x1E0D3EF48]();
}

uint64_t sub_1AF2410F0()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1AF2410FC()
{
  return MEMORY[0x1E0DF2088]();
}

uint64_t sub_1AF241108()
{
  return MEMORY[0x1E0DF2090]();
}

uint64_t sub_1AF241114()
{
  return MEMORY[0x1E0DF20F8]();
}

uint64_t sub_1AF241120()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_1AF24112C()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_1AF241138()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1AF241144()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_1AF241150()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_1AF24115C()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_1AF241168()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_1AF241174()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_1AF241180()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_1AF24118C()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_1AF241198()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1AF2411A4()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1AF2411B0()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1AF2411BC()
{
  return MEMORY[0x1E0DF2040]();
}

uint64_t sub_1AF2411C8()
{
  return MEMORY[0x1E0DEF3F8]();
}

uint64_t sub_1AF2411D4()
{
  return MEMORY[0x1E0DEF428]();
}

uint64_t sub_1AF2411E0()
{
  return MEMORY[0x1E0DEF430]();
}

uint64_t sub_1AF2411EC()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1AF2411F8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1AF241204()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1AF241210()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1AF24121C()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1AF241228()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1AF241234()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1AF241240()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1AF24124C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1AF241258()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1AF241264()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1AF241270()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1AF24127C()
{
  return MEMORY[0x1E0CB1990]();
}

uint64_t sub_1AF241288()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1AF241294()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1AF2412A0()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1AF2412AC()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1AF2412B8()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1AF2412C4()
{
  return MEMORY[0x1E0DEA628]();
}

uint64_t sub_1AF2412D0()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1AF2412DC()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1AF2412E8()
{
  return MEMORY[0x1E0DEA668]();
}

uint64_t sub_1AF2412F4()
{
  return MEMORY[0x1E0DEA688]();
}

uint64_t sub_1AF241300()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1AF24130C()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1AF241318()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1AF241324()
{
  return MEMORY[0x1E0DEA7C8]();
}

uint64_t sub_1AF241330()
{
  return MEMORY[0x1E0DEA7F0]();
}

uint64_t sub_1AF24133C()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1AF241348()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1AF241354()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1AF241360()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1AF24136C()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1AF241378()
{
  return MEMORY[0x1E0DEAB38]();
}

uint64_t sub_1AF241384()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1AF241390()
{
  return MEMORY[0x1E0DEAD00]();
}

uint64_t sub_1AF24139C()
{
  return MEMORY[0x1E0DEAD08]();
}

uint64_t sub_1AF2413A8()
{
  return MEMORY[0x1E0DEAD10]();
}

uint64_t sub_1AF2413B4()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1AF2413C0()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1AF2413CC()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1AF2413D8()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1AF2413E4()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1AF2413F0()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1AF2413FC()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1AF241408()
{
  return MEMORY[0x1E0DF0730]();
}

uint64_t sub_1AF241414()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1AF241420()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1AF24142C()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_1AF241438()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1AF241444()
{
  return MEMORY[0x1E0DF08A8]();
}

uint64_t sub_1AF241450()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t sub_1AF24145C()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1AF241468()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1AF241474()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1AF241480()
{
  return MEMORY[0x1E0DF1FB8]();
}

uint64_t sub_1AF24148C()
{
  return MEMORY[0x1E0CB1D00]();
}

uint64_t sub_1AF241498()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1AF2414A4()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1AF2414B0()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1AF2414BC()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1AF2414C8()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1AF2414D4()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1AF2414E0()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1AF2414EC()
{
  return MEMORY[0x1E0DF22A8]();
}

uint64_t sub_1AF2414F8()
{
  return MEMORY[0x1E0CB1F90]();
}

uint64_t sub_1AF241504()
{
  return MEMORY[0x1E0CB2020]();
}

uint64_t sub_1AF241510()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_1AF24151C()
{
  return MEMORY[0x1E0DF22B8]();
}

uint64_t sub_1AF241528()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1AF241534()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1AF241540()
{
  return MEMORY[0x1E0DEBA70]();
}

uint64_t sub_1AF24154C()
{
  return MEMORY[0x1E0DEBAD8]();
}

uint64_t sub_1AF241558()
{
  return MEMORY[0x1E0DEBB48]();
}

uint64_t sub_1AF241564()
{
  return MEMORY[0x1E0DEBB58]();
}

uint64_t sub_1AF241570()
{
  return MEMORY[0x1E0CB23E0]();
}

uint64_t sub_1AF24157C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1AF241588()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1AF241594()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1AF2415A0()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1AF2415AC()
{
  return MEMORY[0x1E0CB24B0]();
}

uint64_t sub_1AF2415B8()
{
  return MEMORY[0x1E0CB2540]();
}

uint64_t sub_1AF2415C4()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_1AF2415D0()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1AF2415DC()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1AF2415E8()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1AF2415F4()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1AF241600()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1AF24160C()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1AF241618()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1AF241624()
{
  return MEMORY[0x1E0DEC280]();
}

uint64_t sub_1AF241630()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1AF24163C()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1AF241648()
{
  return MEMORY[0x1E0DEC338]();
}

uint64_t sub_1AF241654()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1AF241660()
{
  return MEMORY[0x1E0DF0B60]();
}

uint64_t sub_1AF24166C()
{
  return MEMORY[0x1E0DF0B98]();
}

uint64_t sub_1AF241678()
{
  return MEMORY[0x1E0DF0BA0]();
}

uint64_t sub_1AF241684()
{
  return MEMORY[0x1E0DEC7D0]();
}

uint64_t sub_1AF241690()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1AF24169C()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1AF2416A8()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1AF2416B4()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1AF2416C0()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1AF2416CC()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1AF2416D8()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1AF2416E4()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1AF2416F0()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1AF2416FC()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1AF241708()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1AF241714()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1AF241720()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1AF24172C()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1AF241738()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1AF241744()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1AF241750()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1AF24175C()
{
  return MEMORY[0x1E0DED788]();
}

uint64_t sub_1AF241768()
{
  return MEMORY[0x1E0DED998]();
}

uint64_t sub_1AF241774()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1AF241780()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1AF24178C()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1AF241798()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1AF2417A4()
{
  return MEMORY[0x1E0DF0EE8]();
}

uint64_t sub_1AF2417B0()
{
  return MEMORY[0x1E0DF0EF0]();
}

uint64_t sub_1AF2417BC()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1AF2417C8()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1AF2417D4()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1AF2417E0()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1AF2417EC()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1AF2417F8()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1AF241804()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1AF241810()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1AF24181C()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1AF241828()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1AF241834()
{
  return MEMORY[0x1E0DEE7C8]();
}

uint64_t sub_1AF241840()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1AF24184C()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1AF241858()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1E0C9A3F8]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x1E0C827E8]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1E0C82868]();
}

uint64_t container_get_path()
{
  return MEMORY[0x1E0C828E8]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1E0C829B8]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1E0C829C8]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1E0C829D0]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x1E0C829D8]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1E0C829E8]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1E0C829F8]();
}

uint64_t container_query_set_group_identifiers()
{
  return MEMORY[0x1E0C82A00]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x1E0C82A18]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1E0CCEDE8]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1E0CCEE00]();
}

uint64_t nw_activity_is_activated()
{
  return MEMORY[0x1E0CCEE38]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t rootless_check_datavault_flag()
{
  return MEMORY[0x1E0C85140]();
}

uint64_t rootless_convert_to_datavault()
{
  return MEMORY[0x1E0C85150]();
}

uint64_t rootless_mkdir_datavault()
{
  return MEMORY[0x1E0C85158]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

