void sub_247465440()
{
  qword_254448168 = 0x746E656D676553;
  *(_QWORD *)algn_254448170 = 0xE700000000000000;
}

uint64_t static SegmentStore.readLastRecordedSegments()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  uint64_t v8;

  v3 = sub_247487FC8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_24746550C((uint64_t)v6);
  if (!v1)
  {
    sub_247465884((uint64_t)v6, a1);
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

uint64_t sub_24746550C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void (*v14)(char *, char *, uint64_t);
  char *v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v25 = a1;
  v26 = sub_2474881C0();
  v24 = *(_QWORD *)(v26 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v2 = (char *)&v23 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254448010);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_247487FC8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v23 = (char *)&v23 - v10;
  v11 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v12 = (void *)sub_24748831C();
  v13 = objc_msgSend(v11, sel_containerURLForSecurityApplicationGroupIdentifier_, v12);

  if (!v13)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_7;
  }
  sub_247487FBC();

  v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v14(v4, v9, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_7:
    sub_2474664E4((uint64_t)v4);
    v27 = 0;
    v28 = 0xE000000000000000;
    sub_2474884C0();
    sub_247488340();
    sub_247488340();
    sub_247488340();
    v20 = v27;
    v21 = v28;
    sub_247466524();
    swift_allocError();
    *v22 = v20;
    v22[1] = v21;
    return swift_willThrow();
  }
  v15 = v23;
  v14(v23, v4, v5);
  if (qword_254448030 != -1)
    swift_once();
  sub_2474881B4();
  sub_247487FA4();
  v16 = *(void (**)(char *, uint64_t))(v24 + 8);
  v17 = v26;
  v16(v2, v26);
  sub_2474881A8();
  sub_247487FA4();
  v16(v2, v17);
  v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  v18(v9, v5);
  return ((uint64_t (*)(char *, uint64_t))v18)(v15, v5);
}

uint64_t sub_247465884@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = sub_247487FC8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254448180 != -1)
    swift_once();
  v10 = sub_24748828C();
  __swift_project_value_buffer(v10, (uint64_t)qword_254448188);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v11 = sub_247488274();
  v12 = sub_247488418();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v26 = a2;
    v14 = v13;
    v23 = swift_slowAlloc();
    v28 = v23;
    *(_DWORD *)v14 = 136315394;
    v27 = sub_247473DB8(0xD00000000000001FLL, 0x800000024748A570, &v28);
    v25 = v2;
    sub_247488478();
    *(_WORD *)(v14 + 12) = 2080;
    v24 = a1;
    sub_2474664A4(&qword_254448148, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v15 = sub_2474885B0();
    v27 = sub_247473DB8(v15, v16, &v28);
    v3 = v25;
    sub_247488478();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    _os_log_impl(&dword_247463000, v11, v12, "SegmentStore.%s from: %s", (uint8_t *)v14, 0x16u);
    v17 = v23;
    swift_arrayDestroy();
    MEMORY[0x24957C430](v17, -1, -1);
    MEMORY[0x24957C430](v14, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }

  result = sub_247487FD4();
  if (!v3)
  {
    v20 = result;
    v21 = v19;
    sub_247487F50();
    swift_allocObject();
    sub_247487F44();
    type metadata accessor for SegmentsSummary();
    sub_2474664A4((unint64_t *)&unk_2576A5CB8, (uint64_t (*)(uint64_t))type metadata accessor for SegmentsSummary, (uint64_t)&protocol conformance descriptor for SegmentsSummary);
    sub_247487F38();
    sub_247466420(v20, v21);
    return swift_release();
  }
  return result;
}

uint64_t SegmentStore.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SegmentStore.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SegmentStore()
{
  return objc_opt_self();
}

uint64_t method lookup function for SegmentStore()
{
  return swift_lookUpClassMethod();
}

_QWORD *initializeBufferWithCopyOfBuffer for SegmentStoreError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SegmentStoreError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for SegmentStoreError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for SegmentStoreError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SegmentStoreError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SegmentStoreError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SegmentStoreError()
{
  return &type metadata for SegmentStoreError;
}

void sub_247465D2C(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

BOOL sub_247465D38(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

void sub_247465D4C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_DWORD *sub_247465D58@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

uint64_t sub_247465D68(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
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
  void (*v16)(char *);
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void (*v23)(char *, uint64_t);
  void *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  os_log_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  char *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  os_log_t v47;
  void (**v48)(_QWORD, _QWORD);
  unint64_t v49;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void (*v54)(char *, uint64_t, uint64_t);
  uint64_t v55;
  char *v56;
  os_log_t v57;
  uint64_t v58;
  void (**v59)(_QWORD, _QWORD);
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  id v63[2];

  v60 = a1;
  v63[1] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = sub_247487FC8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v56 = (char *)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v57 = (os_log_t)((char *)&v51 - v8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v51 - v9;
  v11 = sub_24748828C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254448180 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v11, (uint64_t)qword_254448188);
  v16 = *(void (**)(char *))(v12 + 16);
  v55 = v15;
  v16(v14);
  v54 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v54(v10, a2, v3);
  v59 = (void (**)(_QWORD, _QWORD))v12;
  v17 = sub_247488274();
  v18 = sub_247488418();
  v19 = os_log_type_enabled(v17, v18);
  v58 = a2;
  if (v19)
  {
    v20 = swift_slowAlloc();
    v53 = (void *)swift_slowAlloc();
    v63[0] = v53;
    *(_DWORD *)v20 = 136315394;
    v62 = sub_247473DB8(0x3A5F286574697277, 0xEC000000293A6F74, (uint64_t *)v63);
    v52 = v4;
    sub_247488478();
    *(_WORD *)(v20 + 12) = 2080;
    v51 = v20 + 14;
    sub_2474664A4(&qword_254448148, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
    v21 = sub_2474885B0();
    v62 = sub_247473DB8(v21, v22, (uint64_t *)v63);
    sub_247488478();
    swift_bridgeObjectRelease();
    v23 = *(void (**)(char *, uint64_t))(v52 + 8);
    v23(v10, v3);
    _os_log_impl(&dword_247463000, v17, v18, "SegmentStore.%s to: %s", (uint8_t *)v20, 0x16u);
    v24 = v53;
    swift_arrayDestroy();
    MEMORY[0x24957C430](v24, -1, -1);
    MEMORY[0x24957C430](v20, -1, -1);
  }
  else
  {
    v23 = *(void (**)(char *, uint64_t))(v4 + 8);
    v23(v10, v3);
  }

  ((void (**)(char *, uint64_t))v59)[1](v14, v11);
  sub_247487F80();
  swift_allocObject();
  sub_247487F74();
  sub_247487F5C();
  type metadata accessor for SegmentsSummary();
  sub_2474664A4((unint64_t *)&unk_2576A5C40, (uint64_t (*)(uint64_t))type metadata accessor for SegmentsSummary, (uint64_t)&protocol conformance descriptor for SegmentsSummary);
  v25 = v61;
  v26 = sub_247487F68();
  if (!v25)
  {
    v28 = v26;
    v61 = v27;
    v29 = v3;
    v30 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    v31 = v57;
    v32 = v58;
    sub_247487FB0();
    v33 = (void *)sub_247487F98();
    v23((char *)v31, v29);
    v63[0] = 0;
    LODWORD(v31) = objc_msgSend(v30, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v33, 1, 0, v63);

    v34 = v32;
    v35 = v63[0];
    if (!(_DWORD)v31)
    {
      v36 = v35;
      v37 = (void *)sub_247487F8C();

      swift_willThrow();
      v38 = v56;
      v54(v56, v34, v29);
      MEMORY[0x24957C2F8](v37);
      MEMORY[0x24957C2F8](v37);
      v39 = sub_247488274();
      v40 = sub_247488424();
      LODWORD(v60) = v40;
      if (os_log_type_enabled(v39, v40))
      {
        v41 = swift_slowAlloc();
        v59 = (void (**)(_QWORD, _QWORD))swift_slowAlloc();
        v63[0] = v59;
        *(_DWORD *)v41 = 136315394;
        v55 = v41 + 4;
        sub_2474664A4(&qword_254448148, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
        v57 = v39;
        v42 = v56;
        v43 = sub_2474885B0();
        v62 = sub_247473DB8(v43, v44, (uint64_t *)v63);
        sub_247488478();
        swift_bridgeObjectRelease();
        v23(v42, v29);
        *(_WORD *)(v41 + 12) = 2080;
        v62 = (uint64_t)v37;
        MEMORY[0x24957C2F8](v37);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5C50);
        v45 = sub_247488328();
        v62 = sub_247473DB8(v45, v46, (uint64_t *)v63);
        sub_247488478();
        swift_bridgeObjectRelease();

        v47 = v57;
        _os_log_impl(&dword_247463000, v57, (os_log_type_t)v60, "SegmentStore.write(): Unable to create the store directory for path: %s, error: %s", (uint8_t *)v41, 0x16u);
        v48 = v59;
        swift_arrayDestroy();
        MEMORY[0x24957C430](v48, -1, -1);
        MEMORY[0x24957C430](v41, -1, -1);

      }
      else
      {

        v23(v38, v29);
      }
    }
    v49 = v61;
    sub_247487FF8();
    sub_247466420(v28, v49);
  }
  return swift_release();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_247466420(uint64_t a1, unint64_t a2)
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
    result = MEMORY[0x24957C358]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2474664A4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24957C370](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2474664E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254448010);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_247466524()
{
  unint64_t result;

  result = qword_2576A5CC8;
  if (!qword_2576A5CC8)
  {
    result = MEMORY[0x24957C370](&protocol conformance descriptor for SegmentStoreError, &type metadata for SegmentStoreError);
    atomic_store(result, (unint64_t *)&qword_2576A5CC8);
  }
  return result;
}

void type metadata accessor for SISchemaInvocationSource(uint64_t a1)
{
  sub_2474665A4(a1, &qword_2576A5CD0);
}

void type metadata accessor for ORCHSchemaORCHRequestCancellationReason(uint64_t a1)
{
  sub_2474665A4(a1, &qword_2576A5CD8);
}

void type metadata accessor for SISchemaUEIRequestStatus(uint64_t a1)
{
  sub_2474665A4(a1, (unint64_t *)&unk_2576A5CE0);
}

void sub_2474665A4(uint64_t a1, unint64_t *a2)
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

const char *SiriUserSegmentsFeatureFlag.domain.getter()
{
  return "SiriUserSegments";
}

const char *SiriUserSegmentsFeatureFlag.feature.getter()
{
  return "SegmentationTask";
}

uint64_t static SiriUserSegmentsFeatureFlag.== infix(_:_:)()
{
  return 1;
}

uint64_t SiriUserSegmentsFeatureFlag.hash(into:)()
{
  return sub_247488610();
}

void *static SiriUserSegmentsFeatureFlag.allCases.getter()
{
  return &unk_2518A94B0;
}

uint64_t SiriUserSegmentsFeatureFlag.hashValue.getter()
{
  sub_247488604();
  sub_247488610();
  return sub_24748861C();
}

uint64_t sub_2474666AC()
{
  return 1;
}

uint64_t sub_2474666B4()
{
  sub_247488604();
  sub_247488610();
  return sub_24748861C();
}

uint64_t sub_2474666F4()
{
  return sub_247488610();
}

uint64_t sub_247466718()
{
  sub_247488604();
  sub_247488610();
  return sub_24748861C();
}

unint64_t sub_247466758()
{
  unint64_t result;

  result = qword_2576A5D50;
  if (!qword_2576A5D50)
  {
    result = MEMORY[0x24957C370](&protocol conformance descriptor for SiriUserSegmentsFeatureFlag, &type metadata for SiriUserSegmentsFeatureFlag);
    atomic_store(result, (unint64_t *)&qword_2576A5D50);
  }
  return result;
}

const char *sub_24746679C()
{
  return "SiriUserSegments";
}

const char *sub_2474667B0()
{
  return "SegmentationTask";
}

unint64_t sub_2474667C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A5D58;
  if (!qword_2576A5D58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A5D60);
    result = MEMORY[0x24957C370](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2576A5D58);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24957C364](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_247466858(_QWORD *a1@<X8>)
{
  *a1 = &unk_2518A94D8;
}

uint64_t getEnumTagSinglePayload for SiriUserSegmentsFeatureFlag(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SiriUserSegmentsFeatureFlag(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_247466900 + 4 * byte_247488D70[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_247466920 + 4 * byte_247488D75[v4]))();
}

_BYTE *sub_247466900(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_247466920(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247466928(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247466930(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247466938(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247466940(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_24746694C()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriUserSegmentsFeatureFlag()
{
  return &type metadata for SiriUserSegmentsFeatureFlag;
}

uint64_t *sub_24746696C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 3, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = sub_2474880AC();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 3, v7);
    }
  }
  return a1;
}

uint64_t sub_247466A44(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 3, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_2474880AC();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  return result;
}

void *sub_247466AAC(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_2474880AC();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

void *sub_247466B60(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 3, v6);
  v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      v13 = sub_2474880AC();
      (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(a1, a2, v13);
      return a1;
    }
    sub_247468580((uint64_t)a1, &qword_2576A5D68);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_2474880AC();
  (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

void *sub_247466C6C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 3, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_2474880AC();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  }
  return a1;
}

void *sub_247466D20(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(void *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 3, v6);
  v10 = v8(a2, 3, v6);
  if (!v9)
  {
    if (!v10)
    {
      v13 = sub_2474880AC();
      (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(a1, a2, v13);
      return a1;
    }
    sub_247468580((uint64_t)a1, &qword_2576A5D68);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_2474880AC();
  (*(void (**)(void *, void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 3, v6);
  return a1;
}

uint64_t sub_247466E2C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247466E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 4)
    return v5 - 3;
  else
    return 0;
}

uint64_t sub_247466E88()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247466E94(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 3);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_247466EEC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 3, v2);
}

uint64_t sub_247466F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 3, v4);
}

uint64_t type metadata accessor for SiriFirstEnablementStatus()
{
  uint64_t result;

  result = qword_254448158;
  if (!qword_254448158)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_247466FAC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2474880AC();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

void sub_247467000()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t EnablementStatus;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v1 = v0;
  v2 = sub_247488064();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_2474880AC();
  MEMORY[0x24BDAC7A8](v3);
  EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  MEMORY[0x24BDAC7A8](EnablementStatus);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247468150(v1, (uint64_t)v6);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v8 = (char *)sub_247467128
     + 4
     * byte_247488EA0[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 3, v7)];
  __asm { BR              X10 }
}

uint64_t sub_247467128()
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

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v3, v1, v0);
  *(_QWORD *)(v7 - 96) = 0;
  *(_QWORD *)(v7 - 88) = 0xE000000000000000;
  sub_2474884C0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v7 - 96) = 0xD000000000000016;
  *(_QWORD *)(v7 - 88) = 0x800000024748A680;
  sub_247483094(v4);
  sub_24748801C();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v2);
  sub_247488340();
  swift_bridgeObjectRelease();
  sub_247488340();
  v8 = *(_QWORD *)(v7 - 96);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v0);
  return v8;
}

uint64_t sub_247467244(char a1)
{
  return *(_QWORD *)&aUnknown_3[8 * a1];
}

BOOL sub_247467264(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_247467278()
{
  sub_247488604();
  sub_247488610();
  return sub_24748861C();
}

uint64_t sub_2474672BC()
{
  return sub_247488610();
}

uint64_t sub_2474672E4()
{
  sub_247488604();
  sub_247488610();
  return sub_24748861C();
}

uint64_t sub_247467324()
{
  char *v0;

  return sub_247467244(*v0);
}

uint64_t sub_24746732C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_247468C00(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_247467350()
{
  return 0;
}

void sub_24746735C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_247467368()
{
  sub_24746810C();
  return sub_247488640();
}

uint64_t sub_247467390()
{
  sub_24746810C();
  return sub_24748864C();
}

void sub_2474673B8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t EnablementStatus;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D70);
  v19 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v17 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D78);
  v24 = *(_QWORD *)(v3 - 8);
  v25 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v22 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_2474880AC();
  v20 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v18 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D80);
  v15 = *(_QWORD *)(v6 - 8);
  v16 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D88);
  MEMORY[0x24BDAC7A8](v14);
  EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  MEMORY[0x24BDAC7A8](EnablementStatus);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D90);
  v26 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24746810C();
  sub_247488634();
  sub_247468150(v27, (uint64_t)v9);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v12 = (char *)sub_247467614
      + 4
      * byte_247488EA4[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v9, 3, v11)];
  __asm { BR              X10 }
}

uint64_t sub_247467614()
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

  v4 = *(_QWORD *)(v3 - 152);
  v5 = *(_QWORD *)(v3 - 168);
  v6 = *(_QWORD *)(v3 - 128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v5, v2, v6);
  *(_BYTE *)(v3 - 66) = 2;
  sub_2474681D8();
  v7 = *(_QWORD *)(v3 - 136);
  sub_24748858C();
  sub_247468308(&qword_2576A5DB0, MEMORY[0x24BDCE920]);
  v8 = *(_QWORD *)(v3 - 112);
  sub_2474885A4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 120) + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 104) + 8))(v1, v0);
}

uint64_t sub_2474677DC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t EnablementStatus;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  char *v26;
  _QWORD v28[14];
  uint64_t v29;
  char *v30;
  _QWORD *v31;
  uint64_t v32;

  v28[12] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5DC8);
  v28[6] = *(_QWORD *)(v3 - 8);
  v28[7] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v28[10] = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5DD0);
  v28[8] = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v28[11] = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5DD8);
  v28[4] = *(_QWORD *)(v6 - 8);
  v28[5] = v6;
  MEMORY[0x24BDAC7A8](v6);
  v28[13] = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5DE0);
  v28[2] = *(_QWORD *)(v8 - 8);
  v28[3] = v8;
  MEMORY[0x24BDAC7A8](v8);
  v28[9] = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5DE8);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  v15 = MEMORY[0x24BDAC7A8](EnablementStatus);
  v17 = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v28 - v18;
  v20 = a1[3];
  v31 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_24746810C();
  v30 = v13;
  v21 = v32;
  sub_247488628();
  if (!v21)
  {
    v28[0] = v17;
    v28[1] = v19;
    v32 = v11;
    v22 = sub_247488580();
    if (*(_QWORD *)(v22 + 16) == 1)
      __asm { BR              X10 }
    v23 = sub_2474884FC();
    swift_allocError();
    v25 = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5DF0);
    *v25 = EnablementStatus;
    v26 = v30;
    sub_24748855C();
    sub_2474884F0();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v25, *MEMORY[0x24BEE26D0], v23);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v26, v10);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
}

uint64_t sub_247467DF4()
{
  return 0;
}

uint64_t sub_247467E00()
{
  return 0;
}

void sub_247467E0C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_247467E18()
{
  sub_247468194();
  return sub_247488640();
}

uint64_t sub_247467E40()
{
  sub_247468194();
  return sub_24748864C();
}

uint64_t sub_247467E68()
{
  return 0;
}

uint64_t sub_247467E74()
{
  return 0;
}

void sub_247467E80(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_247467E8C()
{
  sub_24746821C();
  return sub_247488640();
}

uint64_t sub_247467EB4()
{
  sub_24746821C();
  return sub_24748864C();
}

uint64_t sub_247467EDC()
{
  return 1;
}

uint64_t sub_247467EE4()
{
  sub_247488604();
  sub_247488610();
  return sub_24748861C();
}

uint64_t sub_247467F24()
{
  return sub_247488610();
}

uint64_t sub_247467F48()
{
  sub_247488604();
  sub_247488610();
  return sub_24748861C();
}

uint64_t sub_247467F88@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_247468DD8(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_247467FB0()
{
  return 0;
}

void sub_247467FBC(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_247467FC8()
{
  sub_2474681D8();
  return sub_247488640();
}

uint64_t sub_247467FF0()
{
  sub_2474681D8();
  return sub_24748864C();
}

uint64_t sub_247468018()
{
  return 0;
}

uint64_t sub_247468024@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_247468050()
{
  return 0;
}

void sub_24746805C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_247468068()
{
  sub_247468260();
  return sub_247488640();
}

uint64_t sub_247468090()
{
  sub_247468260();
  return sub_24748864C();
}

uint64_t sub_2474680BC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2474677DC(a1, a2);
}

void sub_2474680D0(_QWORD *a1)
{
  sub_2474673B8(a1);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_24746810C()
{
  unint64_t result;

  result = qword_2576A5D98;
  if (!qword_2576A5D98)
  {
    result = MEMORY[0x24957C370](&unk_2474893DC, &type metadata for SiriFirstEnablementStatus.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5D98);
  }
  return result;
}

uint64_t sub_247468150(uint64_t a1, uint64_t a2)
{
  uint64_t EnablementStatus;

  EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(EnablementStatus - 8) + 16))(a2, a1, EnablementStatus);
  return a2;
}

unint64_t sub_247468194()
{
  unint64_t result;

  result = qword_2576A5DA0;
  if (!qword_2576A5DA0)
  {
    result = MEMORY[0x24957C370](&unk_24748938C, &type metadata for SiriFirstEnablementStatus.LongTermEnabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5DA0);
  }
  return result;
}

unint64_t sub_2474681D8()
{
  unint64_t result;

  result = qword_2576A5DA8;
  if (!qword_2576A5DA8)
  {
    result = MEMORY[0x24957C370]("-\tB\n,!", &type metadata for SiriFirstEnablementStatus.RecentlyEnabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5DA8);
  }
  return result;
}

unint64_t sub_24746821C()
{
  unint64_t result;

  result = qword_2576A5DB8;
  if (!qword_2576A5DB8)
  {
    result = MEMORY[0x24957C370]("}\tB\nX!", &type metadata for SiriFirstEnablementStatus.NeverEnabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5DB8);
  }
  return result;
}

unint64_t sub_247468260()
{
  unint64_t result;

  result = qword_2576A5DC0;
  if (!qword_2576A5DC0)
  {
    result = MEMORY[0x24957C370](&unk_24748929C, &type metadata for SiriFirstEnablementStatus.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5DC0);
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

uint64_t sub_2474682C4(uint64_t a1, uint64_t a2)
{
  uint64_t EnablementStatus;

  EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(EnablementStatus - 8) + 32))(a2, a1, EnablementStatus);
  return a2;
}

uint64_t sub_247468308(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2474880AC();
    result = MEMORY[0x24957C370](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_247468348(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t EnablementStatus;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;

  v4 = sub_2474880AC();
  MEMORY[0x24BDAC7A8](v4);
  EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  MEMORY[0x24BDAC7A8](EnablementStatus);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E00);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t)&v9[*(int *)(v7 + 48)];
  sub_247468150(a1, (uint64_t)v9);
  sub_247468150(a2, v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v12 = (char *)sub_247468470
      + 4
      * byte_247488EAC[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v9, 3, v11)];
  __asm { BR              X10 }
}

uint64_t sub_247468470()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  char v8;
  void (*v10)(uint64_t, uint64_t);

  sub_247468150(v0, v3);
  if (v6(v5, 3, v4))
  {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v3, v1);
    sub_247468580(v0, &qword_2576A5E00);
    v8 = 0;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v2, v5, v1);
    v8 = sub_247488088();
    v10 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v10(v2, v1);
    v10(v3, v1);
    sub_2474685BC(v0);
  }
  return v8 & 1;
}

uint64_t sub_247468580(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2474685BC(uint64_t a1)
{
  uint64_t EnablementStatus;

  EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(EnablementStatus - 8) + 8))(a1, EnablementStatus);
  return a1;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriFirstEnablementStatus.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SiriFirstEnablementStatus.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2474686E0 + 4 * byte_247488EB5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_247468714 + 4 * byte_247488EB0[v4]))();
}

uint64_t sub_247468714(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24746871C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x247468724);
  return result;
}

uint64_t sub_247468730(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x247468738);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24746873C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247468744(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247468750(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24746875C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SiriFirstEnablementStatus.CodingKeys()
{
  return &type metadata for SiriFirstEnablementStatus.CodingKeys;
}

ValueMetadata *type metadata accessor for SiriFirstEnablementStatus.UnknownCodingKeys()
{
  return &type metadata for SiriFirstEnablementStatus.UnknownCodingKeys;
}

ValueMetadata *type metadata accessor for SiriFirstEnablementStatus.NeverEnabledCodingKeys()
{
  return &type metadata for SiriFirstEnablementStatus.NeverEnabledCodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriFirstEnablementStatus.RecentlyEnabledCodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SiriFirstEnablementStatus.RecentlyEnabledCodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_247468824 + 4 * byte_247488EBA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_247468844 + 4 * byte_247488EBF[v4]))();
}

_BYTE *sub_247468824(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_247468844(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24746884C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_247468854(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24746885C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_247468864(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_247468870()
{
  return 0;
}

ValueMetadata *type metadata accessor for SiriFirstEnablementStatus.RecentlyEnabledCodingKeys()
{
  return &type metadata for SiriFirstEnablementStatus.RecentlyEnabledCodingKeys;
}

ValueMetadata *type metadata accessor for SiriFirstEnablementStatus.LongTermEnabledCodingKeys()
{
  return &type metadata for SiriFirstEnablementStatus.LongTermEnabledCodingKeys;
}

unint64_t sub_2474688A4()
{
  unint64_t result;

  result = qword_2576A5E08;
  if (!qword_2576A5E08)
  {
    result = MEMORY[0x24957C370](&unk_24748911C, &type metadata for SiriFirstEnablementStatus.RecentlyEnabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5E08);
  }
  return result;
}

unint64_t sub_2474688EC()
{
  unint64_t result;

  result = qword_2576A5E10;
  if (!qword_2576A5E10)
  {
    result = MEMORY[0x24957C370](&unk_247489274, &type metadata for SiriFirstEnablementStatus.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5E10);
  }
  return result;
}

unint64_t sub_247468934()
{
  unint64_t result;

  result = qword_2576A5E18;
  if (!qword_2576A5E18)
  {
    result = MEMORY[0x24957C370](&unk_247489194, &type metadata for SiriFirstEnablementStatus.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5E18);
  }
  return result;
}

unint64_t sub_24746897C()
{
  unint64_t result;

  result = qword_2576A5E20;
  if (!qword_2576A5E20)
  {
    result = MEMORY[0x24957C370]("E\nB\nd\"", &type metadata for SiriFirstEnablementStatus.UnknownCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5E20);
  }
  return result;
}

unint64_t sub_2474689C4()
{
  unint64_t result;

  result = qword_2576A5E28;
  if (!qword_2576A5E28)
  {
    result = MEMORY[0x24957C370](&unk_247489144, &type metadata for SiriFirstEnablementStatus.NeverEnabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5E28);
  }
  return result;
}

unint64_t sub_247468A0C()
{
  unint64_t result;

  result = qword_2576A5E30;
  if (!qword_2576A5E30)
  {
    result = MEMORY[0x24957C370](&unk_24748916C, &type metadata for SiriFirstEnablementStatus.NeverEnabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5E30);
  }
  return result;
}

unint64_t sub_247468A54()
{
  unint64_t result;

  result = qword_2576A5E38;
  if (!qword_2576A5E38)
  {
    result = MEMORY[0x24957C370](&unk_24748908C, &type metadata for SiriFirstEnablementStatus.RecentlyEnabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5E38);
  }
  return result;
}

unint64_t sub_247468A9C()
{
  unint64_t result;

  result = qword_2576A5E40;
  if (!qword_2576A5E40)
  {
    result = MEMORY[0x24957C370](&unk_2474890B4, &type metadata for SiriFirstEnablementStatus.RecentlyEnabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5E40);
  }
  return result;
}

unint64_t sub_247468AE4()
{
  unint64_t result;

  result = qword_2576A5E48;
  if (!qword_2576A5E48)
  {
    result = MEMORY[0x24957C370](&unk_24748903C, &type metadata for SiriFirstEnablementStatus.LongTermEnabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5E48);
  }
  return result;
}

unint64_t sub_247468B2C()
{
  unint64_t result;

  result = qword_2576A5E50;
  if (!qword_2576A5E50)
  {
    result = MEMORY[0x24957C370](&unk_247489064, &type metadata for SiriFirstEnablementStatus.LongTermEnabledCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5E50);
  }
  return result;
}

unint64_t sub_247468B74()
{
  unint64_t result;

  result = qword_2576A5E58;
  if (!qword_2576A5E58)
  {
    result = MEMORY[0x24957C370](&unk_2474891E4, &type metadata for SiriFirstEnablementStatus.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A5E58);
  }
  return result;
}

unint64_t sub_247468BBC()
{
  unint64_t result;

  result = qword_2576A5E60;
  if (!qword_2576A5E60)
  {
    result = MEMORY[0x24957C370](&unk_24748920C, &type metadata for SiriFirstEnablementStatus.CodingKeys);
    atomic_store(result, &qword_2576A5E60);
  }
  return result;
}

uint64_t sub_247468C00(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E776F6E6B6E75 && a2 == 0xE700000000000000;
  if (v3 || (sub_2474885BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x616E45726576656ELL && a2 == 0xEC00000064656C62 || (sub_2474885BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x796C746E65636572 && a2 == 0xEF64656C62616E45 || (sub_2474885BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6D726554676E6F6CLL && a2 == 0xEF64656C62616E45)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_2474885BC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_247468DD8(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 1716482913 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_2474885BC();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_247468E4C()
{
  return 1716482913;
}

uint64_t sub_247468E64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[8] = a2;
  v3[9] = a3;
  v3[7] = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5EC0);
  v3[10] = v4;
  v3[11] = *(_QWORD *)(v4 - 8);
  v3[12] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5EC8);
  v3[13] = v5;
  v3[14] = *(_QWORD *)(v5 - 8);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247468F08()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2474881F0();
  sub_247488010();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E80);
  sub_247488010();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v1;
  *v1 = v0;
  v1[1] = sub_247468FC4;
  return sub_2474881E4();
}

uint64_t sub_247468FC4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_247469028()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 104);
  v8 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 96);
  v6 = *(_QWORD *)(v0 + 80);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  sub_2474881CC();
  sub_247469950(&qword_2576A5ED0, &qword_2576A5EC0, MEMORY[0x24BE0C940]);
  sub_24748816C();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v1, v2, v3);
  sub_247469950(&qword_2576A5ED8, &qword_2576A5EC8, MEMORY[0x24BDFCBF0]);
  sub_247488400();
  sub_247488268();
  sub_2474883F4();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2474691B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[8] = a2;
  v3[9] = a3;
  v3[7] = a1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E70);
  v3[10] = v4;
  v3[11] = *(_QWORD *)(v4 - 8);
  v3[12] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E78);
  v3[13] = v5;
  v3[14] = *(_QWORD *)(v5 - 8);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247469254()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2474881F0();
  sub_247488010();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E80);
  sub_247488010();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v1;
  *v1 = v0;
  v1[1] = sub_247469310;
  return sub_2474881E4();
}

uint64_t sub_247469310()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_247469374()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 112);
  v6 = *(_QWORD *)(v0 + 88);
  v5 = *(_QWORD *)(v0 + 96);
  v7 = *(_QWORD *)(v0 + 80);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  sub_2474881D8();
  sub_247469950(&qword_2576A5E88, &qword_2576A5E70, MEMORY[0x24BE0C940]);
  sub_24748816C();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  sub_247469950(&qword_2576A5E90, &qword_2576A5E78, MEMORY[0x24BDFCBF0]);
  sub_247488400();
  sub_24748819C();
  sub_2474883F4();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2474694F8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247469540()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247469564(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return swift_task_switch();
}

uint64_t sub_24746957C()
{
  uint64_t v0;
  _QWORD *v1;

  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5EF0);
  sub_247469950((unint64_t *)&unk_2576A5EF8, &qword_2576A5EF0, MEMORY[0x24BDFCBE0]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_247469630;
  return sub_2474883B8();
}

uint64_t sub_247469630()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_endAccess();
  **(_QWORD **)(v2 + 48) = *(_QWORD *)(v2 + 40);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2474696AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return swift_task_switch();
}

uint64_t sub_2474696C4()
{
  uint64_t v0;
  _QWORD *v1;

  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5EA8);
  sub_247469950(&qword_2576A5EB0, &qword_2576A5EA8, MEMORY[0x24BDFCBE0]);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_247469778;
  return sub_2474883B8();
}

uint64_t sub_247469778()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 72) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_endAccess();
  **(_QWORD **)(v2 + 48) = *(_QWORD *)(v2 + 40);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2474697F4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 72);
  swift_endAccess();

  **(_QWORD **)(v0 + 48) = 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247469838(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2474698A0;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2576A5E98 + dword_2576A5E98))(a1, v1);
}

uint64_t sub_2474698A0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2474698E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_247469990;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2576A5EE0 + dword_2576A5EE0))(a1, v1);
}

uint64_t sub_247469950(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24957C370](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24746999C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 8) + *(_QWORD *)(a2 + 8));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_247469A08;
  return v7(a1, a2);
}

uint64_t sub_247469A08(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

ValueMetadata *type metadata accessor for ITunesCloudMusicSubscriptionStatusController()
{
  return &type metadata for ITunesCloudMusicSubscriptionStatusController;
}

uint64_t sub_247469A68(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5C50);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_247469AF4()
{
  return swift_task_switch();
}

uint64_t sub_247469B08()
{
  _QWORD *v0;
  id v1;
  id v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedStatusController);
  v0[16] = v1;
  v2 = objc_msgSend((id)objc_opt_self(), sel_activeAccount);
  v0[17] = v2;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_247469BF8;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_247469A68;
  v4[3] = &block_descriptor;
  v4[4] = v3;
  objc_msgSend(v1, sel_getSubscriptionStatusForUserIdentity_bypassingCache_withCompletionHandler_, v2, 0, v4);
  return swift_continuation_await();
}

uint64_t sub_247469BF8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 144) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_247469C58()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 120);

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_247469C98()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 136);
  v2 = *(void **)(v0 + 128);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_247469CE0()
{
  off_2576A5F10 = (_UNKNOWN *)MEMORY[0x24BEE4B00];
}

uint64_t sub_247469CF4(char a1)
{
  return *(_QWORD *)&aUnknown_4[8 * a1];
}

BOOL sub_247469D14(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_247469D28()
{
  sub_247488604();
  sub_247488610();
  return sub_24748861C();
}

uint64_t sub_247469D6C()
{
  return sub_247488610();
}

uint64_t sub_247469D94()
{
  sub_247488604();
  sub_247488610();
  return sub_24748861C();
}

uint64_t *sub_247469DD4@<X0>(uint64_t *result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  v2 = *result;
  if ((unint64_t)*result >= 3)
    LOBYTE(v2) = 3;
  *a2 = v2;
  return result;
}

void sub_247469DEC(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

_QWORD *sub_247469DF8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_247487EE4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    *(_QWORD *)((char *)a1 + v8) = *(_QWORD *)((char *)a2 + v8);
  }
  return a1;
}

uint64_t sub_247469E88(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_247487EE4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_247469EBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_247487EE4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_247469F20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_247487EE4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_247469F88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_247487EE4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_247469FEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_247487EE4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  return a1;
}

uint64_t sub_24746A050()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24746A05C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;

  v6 = sub_247487EE4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 3)
    return v9 - 2;
  else
    return 0;
}

uint64_t sub_24746A0D4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24746A0E0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_247487EE4();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
  return result;
}

uint64_t type metadata accessor for SiriUsageMetrics()
{
  uint64_t result;

  result = qword_2576A5F70;
  if (!qword_2576A5F70)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24746A194()
{
  uint64_t result;
  unint64_t v1;

  result = sub_247487EE4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24746A214()
{
  char *v0;

  return sub_247469CF4(*v0);
}

BOOL sub_24746A21C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (sub_247487EA8() & 1) != 0
      && *(unsigned __int8 *)(a1 + *(int *)(a3 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(a3 + 20))
      && *(_QWORD *)(a1 + *(int *)(a3 + 24)) == *(_QWORD *)(a2 + *(int *)(a3 + 24));
}

uint64_t getEnumTagSinglePayload for ProductId(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ProductId(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24746A35C + 4 * byte_247489515[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24746A390 + 4 * byte_247489510[v4]))();
}

uint64_t sub_24746A390(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24746A398(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24746A3A0);
  return result;
}

uint64_t sub_24746A3AC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24746A3B4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24746A3B8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24746A3C0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24746A3CC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24746A3D8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ProductId()
{
  return &type metadata for ProductId;
}

unint64_t sub_24746A3F4()
{
  unint64_t result;

  result = qword_2576A5FB0;
  if (!qword_2576A5FB0)
  {
    result = MEMORY[0x24957C370](&unk_247489644, &type metadata for ProductId);
    atomic_store(result, (unint64_t *)&qword_2576A5FB0);
  }
  return result;
}

uint64_t sub_24746A438@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  void (*v21)(char *, char *, uint64_t);
  char *v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v24 - v10;
  v12 = sub_2474880AC();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v24 - v17;
  sub_24746BD5C(a2, (uint64_t)v11);
  v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  if (v19(v11, 1, v12) == 1)
  {
    sub_24746BD1C((uint64_t)v11);
    return sub_24746BD5C(a1, a3);
  }
  else
  {
    v21 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
    v21(v18, v11, v12);
    sub_24746BD5C(a1, (uint64_t)v9);
    if (v19(v9, 1, v12) == 1)
    {
      sub_24746BD1C((uint64_t)v9);
      v21((char *)a3, v18, v12);
    }
    else
    {
      v21(v16, v9, v12);
      sub_24746D2A0((unint64_t *)&qword_2576A6070, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
      if ((sub_2474882F8() & 1) != 0)
        v22 = v18;
      else
        v22 = v16;
      (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(a3, v22, v12);
      v23 = *(void (**)(char *, uint64_t))(v13 + 8);
      v23(v16, v12);
      v23(v18, v12);
    }
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(a3, 0, 1, v12);
  }
}

uint64_t sub_24746A648@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  uint64_t v4;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint8_t *v25;
  char v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, _QWORD, uint64_t);
  char *v36;
  char *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  char *v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  char v69;
  void (*v70)(char *, uint64_t);
  uint64_t v71;
  void (*v72)(char *, uint64_t);
  uint64_t v73;
  void (*v74)(char *, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  BOOL v82;
  void (*v83)(char *, uint64_t);
  void (*v84)(char *, uint64_t);
  void (*v85)(char *, uint64_t);
  BOOL v86;
  void (*v87)(char *, uint64_t);
  char v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint8_t *v97;
  char *v98;
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  char *v107;
  uint64_t v108;
  _QWORD v109[5];

  v5 = v4;
  v99 = a3;
  v108 = a1;
  v105 = sub_247487F2C();
  v102 = *(_QWORD *)(v105 - 8);
  v8 = MEMORY[0x24BDAC7A8](v105);
  v101 = (char *)&v89 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v107 = (char *)&v89 - v10;
  v11 = sub_2474880C4();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v89 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_247488148();
  v103 = *(_QWORD *)(v15 - 8);
  v104 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v106 = (char *)&v89 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v89 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_2474880AC();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  result = MEMORY[0x24BDAC7A8](v22);
  if (*(_BYTE *)(v5 + 16) != 1)
  {
    if (*(_BYTE *)(v5 + 17))
      v26 = 2;
    else
      v26 = 1;
    *a4 = v26;
    return result;
  }
  v97 = v25;
  v98 = a4;
  v100 = (char *)&v89 - v24;
  sub_24746BD5C(a2, (uint64_t)v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    result = sub_24746BD1C((uint64_t)v19);
    *v98 = 0;
    return result;
  }
  v95 = v21;
  v96 = v20;
  (*(void (**)(char *, char *))(v21 + 32))(v100, v19);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BDCEF70], v11);
  v27 = v106;
  sub_2474880D0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6078);
  v29 = sub_24748813C();
  v30 = *(_QWORD *)(v29 - 8);
  v31 = *(_QWORD *)(v30 + 72);
  v32 = *(unsigned __int8 *)(v30 + 80);
  v33 = (v32 + 32) & ~v32;
  v92 = v28;
  v93 = v32 | 7;
  v94 = v33 + v31;
  v34 = swift_allocObject();
  v91 = xmmword_2474896A0;
  *(_OWORD *)(v34 + 16) = xmmword_2474896A0;
  v35 = *(void (**)(uint64_t, _QWORD, uint64_t))(v30 + 104);
  v35(v34 + v33, *MEMORY[0x24BDCF250], v29);
  sub_24746C9C8(v34);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v36 = v107;
  v37 = v27;
  sub_2474880F4();
  swift_bridgeObjectRelease();
  v38 = sub_247487F08();
  if ((v39 & 1) != 0)
  {
    v109[0] = 0;
    v109[1] = 0xE000000000000000;
    sub_2474884C0();
    swift_bridgeObjectRelease();
    v109[0] = 0xD000000000000010;
    v109[1] = 0x800000024748A730;
    sub_24746D2A0(&qword_2576A6080, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
    v60 = v105;
    sub_2474885B0();
    sub_247488340();
    swift_bridgeObjectRelease();
    v61 = v109[0];
    v62 = v109[1];
    sub_24746CC30();
    swift_allocError();
    *v63 = v61;
    v63[1] = v62;
    swift_willThrow();
    v59 = *(void (**)(char *, uint64_t))(v102 + 8);
LABEL_24:
    v54 = v95;
    v53 = v96;
    goto LABEL_25;
  }
  v90 = v38;
  if (qword_254448180 != -1)
    swift_once();
  v40 = sub_24748828C();
  v89 = __swift_project_value_buffer(v40, (uint64_t)qword_254448188);
  v41 = sub_247488274();
  v42 = sub_247488418();
  v43 = os_log_type_enabled(v41, v42);
  v44 = v101;
  if (v43)
  {
    v45 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v45 = 134217984;
    v36 = v107;
    v109[0] = v90;
    sub_247488478();
    _os_log_impl(&dword_247463000, v41, v42, "ActivitySegmentMetrics: assistant last active: %ld months ago", v45, 0xCu);
    MEMORY[0x24957C430](v45, -1, -1);
  }

  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = v91;
  v35(v46 + v33, *MEMORY[0x24BDCF220], v29);
  sub_24746C9C8(v46);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_2474880F4();
  swift_bridgeObjectRelease();
  v47 = sub_247487EF0();
  if ((v48 & 1) != 0)
  {
    v109[0] = 0;
    v109[1] = 0xE000000000000000;
    sub_2474884C0();
    swift_bridgeObjectRelease();
    strcpy((char *)v109, "day is nil in ");
    HIBYTE(v109[1]) = -18;
    sub_24746D2A0(&qword_2576A6080, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
    v60 = v105;
    sub_2474885B0();
    sub_247488340();
    swift_bridgeObjectRelease();
    v64 = v109[0];
    v65 = v109[1];
    sub_24746CC30();
    swift_allocError();
    *v66 = v64;
    v66[1] = v65;
    swift_willThrow();
    v59 = *(void (**)(char *, uint64_t))(v102 + 8);
    v59(v44, v60);
    goto LABEL_24;
  }
  v49 = v47;
  v50 = sub_247488274();
  v51 = sub_247488418();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v52 = 134217984;
    v109[0] = v49;
    sub_247488478();
    _os_log_impl(&dword_247463000, v50, v51, "ActivitySegmentMetrics: assistant last active: %ld days ago", v52, 0xCu);
    MEMORY[0x24957C430](v52, -1, -1);
  }

  v54 = v95;
  v53 = v96;
  if (v90 >= 6)
  {
    v67 = *(void (**)(char *, uint64_t))(v102 + 8);
    v68 = v105;
    v67(v44, v105);
    v67(v36, v68);
    (*(void (**)(char *, uint64_t))(v103 + 8))(v37, v104);
    result = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v100, v53);
    v69 = 3;
LABEL_30:
    *v98 = v69;
    return result;
  }
  if (v49 >= 28)
  {
    v70 = *(void (**)(char *, uint64_t))(v102 + 8);
    v71 = v105;
    v70(v44, v105);
    v70(v36, v71);
    (*(void (**)(char *, uint64_t))(v103 + 8))(v37, v104);
    result = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v100, v53);
    v69 = 4;
    goto LABEL_30;
  }
  if (v49 >= 14)
  {
    v72 = *(void (**)(char *, uint64_t))(v102 + 8);
    v73 = v105;
    v72(v44, v105);
    v72(v36, v73);
    (*(void (**)(char *, uint64_t))(v103 + 8))(v37, v104);
    result = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v100, v53);
    v69 = 5;
    goto LABEL_30;
  }
  if (v49 >= 7)
  {
    v74 = *(void (**)(char *, uint64_t))(v102 + 8);
    v75 = v105;
    v74(v44, v105);
    v74(v36, v75);
    (*(void (**)(char *, uint64_t))(v103 + 8))(v37, v104);
    result = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v100, v53);
    v69 = 6;
    goto LABEL_30;
  }
  v55 = v97;
  (*(void (**)(uint8_t *, uint64_t, uint64_t))(v95 + 16))(v97, v108, v96);
  v56 = v99;
  swift_bridgeObjectRetain();
  v57 = v56;
  v58 = v109[4];
  result = (uint64_t)sub_24746CC74(v55, v57);
  if (v58)
  {
    v59 = *(void (**)(char *, uint64_t))(v102 + 8);
    v60 = v105;
    v59(v44, v105);
LABEL_25:
    v59(v36, v60);
    (*(void (**)(char *, uint64_t))(v103 + 8))(v37, v104);
    return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v100, v53);
  }
  v76 = *(_QWORD *)(result + 16);
  v77 = v105;
  v78 = v98;
  if (v76)
  {
    v79 = 0;
    v80 = 0;
    do
    {
      v81 = *(_QWORD *)(result + 8 * v79 + 32);
      v82 = __CFADD__(v80, v81);
      v80 += v81;
      if (v82)
      {
        __break(1u);
        return result;
      }
      ++v79;
    }
    while (v76 != v79);
    if (v80 == 1)
    {
      swift_bridgeObjectRelease();
      v83 = *(void (**)(char *, uint64_t))(v102 + 8);
      v83(v101, v77);
      v83(v36, v77);
      (*(void (**)(char *, uint64_t))(v103 + 8))(v37, v104);
      result = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v100, v53);
      *v78 = 7;
      return result;
    }
    if (v80 - 4 >= 0xFFFFFFFFFFFFFFFDLL)
    {
      swift_bridgeObjectRelease();
      v85 = *(void (**)(char *, uint64_t))(v102 + 8);
      v85(v101, v77);
      v85(v36, v77);
      (*(void (**)(char *, uint64_t))(v103 + 8))(v37, v104);
      result = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v100, v53);
      *v78 = 8;
    }
    else
    {
      if (v80 < 4)
        goto LABEL_39;
      v86 = sub_24746B0E8(result);
      swift_bridgeObjectRelease();
      v87 = *(void (**)(char *, uint64_t))(v102 + 8);
      v87(v101, v77);
      v87(v36, v77);
      (*(void (**)(char *, uint64_t))(v103 + 8))(v37, v104);
      result = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v100, v53);
      if (v86)
        v88 = 10;
      else
        v88 = 9;
      *v78 = v88;
    }
  }
  else
  {
LABEL_39:
    swift_bridgeObjectRelease();
    v84 = *(void (**)(char *, uint64_t))(v102 + 8);
    v84(v101, v77);
    v84(v36, v77);
    (*(void (**)(char *, uint64_t))(v103 + 8))(v37, v104);
    result = (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v100, v53);
    *v78 = 0;
  }
  return result;
}

BOOL sub_24746B0E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    v3 = 0;
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      v5 = *(_QWORD *)(a1 + 8 * v3 + 32);
      if (v5 >= 2)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v4 = sub_2474766B0(0, v4[2] + 1, 1, v4);
        v7 = v4[2];
        v6 = v4[3];
        if (v7 >= v6 >> 1)
          v4 = sub_2474766B0((_QWORD *)(v6 > 1), v7 + 1, 1, v4);
        v4[2] = v7 + 1;
        v4[v7 + 4] = v5;
      }
      ++v3;
    }
    while (v1 != v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v8 = v4[2];
  swift_bridgeObjectRelease();
  return v8 > 2;
}

uint64_t sub_24746B1E4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
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
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(void);
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char v62;
  char *v63;
  void (*v64)(char *, uint64_t);
  char *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(void);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t result;
  unsigned int (*v83)(uint64_t, uint64_t, uint64_t);
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unsigned int v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  char *v98;
  char *v99;
  char v100;
  void (*v101)(char *, uint64_t);
  char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  char *v107;
  char v108;
  void (*v109)(char *, uint64_t);
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  char *v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  void (*v124)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v125;
  char *v126;
  char *v127;
  uint64_t v128;
  void (*v129)(void);
  uint64_t v130;
  unint64_t v131;
  unsigned int (*v132)(uint64_t, uint64_t, uint64_t);
  char *v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;

  v113 = a1;
  v112 = a3;
  v4 = type metadata accessor for SiriUsageMetrics();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v130 = (uint64_t)&v110 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v110 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v110 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v117 = (uint64_t)&v110 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v132 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))((char *)&v110 - v17);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v126 = (char *)&v110 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v110 - v20;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6068);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v122 = (uint64_t)&v110 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v121 = (uint64_t)&v110 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v116 = (uint64_t)&v110 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v115 = (uint64_t)&v110 - v29;
  v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v31 = MEMORY[0x24BDAC7A8](v30);
  v120 = (char *)&v110 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x24BDAC7A8](v31);
  v114 = (char *)&v110 - v34;
  MEMORY[0x24BDAC7A8](v33);
  v111 = (char *)&v110 - v35;
  v36 = sub_2474880AC();
  v37 = MEMORY[0x24BDAC7A8](v36);
  v39 = (char *)&v110 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = MEMORY[0x24BDAC7A8](v37);
  v118 = (char *)&v110 - v41;
  v42 = MEMORY[0x24BDAC7A8](v40);
  v127 = (char *)&v110 - v43;
  v44 = MEMORY[0x24BDAC7A8](v42);
  v125 = (char *)&v110 - v45;
  v46 = MEMORY[0x24BDAC7A8](v44);
  v123 = (char *)&v110 - v47;
  MEMORY[0x24BDAC7A8](v46);
  v135 = v48;
  v49 = *(void (**)(void))(v48 + 16);
  v133 = (char *)&v110 - v50;
  v129 = v49;
  v49();
  v51 = *(_QWORD *)(a2 + 16);
  v128 = a2;
  swift_bridgeObjectRetain();
  v134 = v4;
  v136 = v51;
  if (v51)
  {
    v52 = 0;
    v53 = v128 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v124 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 72);
    v119 = v21;
    while (1)
    {
      v131 = v52;
      sub_24746BC10(v53, (uint64_t)v21);
      v55 = v21[*(int *)(v4 + 20)];
      v56 = (uint64_t)v21;
      v57 = (uint64_t)v21;
      v58 = v4;
      v59 = v126;
      sub_24746BC10(v56, (uint64_t)v126);
      if (v55 != 1)
        break;
      v60 = *(_QWORD *)&v59[*(int *)(v58 + 24)];
      sub_24746BC54((uint64_t)v59);
      sub_24746BC10(v57, (uint64_t)v132);
      v54 = v125;
      ((void (*)(char *, char *, uint64_t))v129)(v125, v133, v36);
      v21 = (char *)v57;
      if (!v60)
        goto LABEL_4;
      v61 = v127;
      sub_247487EB4();
      sub_24746D2A0((unint64_t *)&qword_2576A6070, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
      v62 = sub_2474882EC();
      v63 = v54;
      v64 = *(void (**)(char *, uint64_t))(v135 + 8);
      v65 = v61;
      v21 = v119;
      v64(v65, v36);
      sub_24746BC54((uint64_t)v132);
      v64(v63, v36);
      v4 = v134;
      if ((v62 & 1) == 0)
      {
        v66 = v115;
        sub_24746BC90((uint64_t)v21, v115);
        v124 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
        v124(v66, 0, 1, v4);
        v67 = v131 + 1;
        goto LABEL_11;
      }
LABEL_5:
      v52 = v131 + 1;
      sub_24746BC54((uint64_t)v21);
      v53 += (uint64_t)v124;
      if (v136 == v52)
        goto LABEL_10;
    }
    sub_24746BC54((uint64_t)v59);
    sub_24746BC10(v57, (uint64_t)v132);
    v54 = v125;
    ((void (*)(char *, char *, uint64_t))v129)(v125, v133, v36);
    v21 = (char *)v57;
LABEL_4:
    sub_24746BC54((uint64_t)v132);
    (*(void (**)(char *, uint64_t))(v135 + 8))(v54, v36);
    v4 = v134;
    goto LABEL_5;
  }
LABEL_10:
  v66 = v115;
  v124 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v124(v115, 1, 1, v4);
  v67 = v136;
LABEL_11:
  v68 = v66;
  v69 = v116;
  sub_24746BCD4(v68, v116);
  v119 = *(char **)(v5 + 48);
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v119)(v69, 1, v4) == 1)
  {
    v70 = v135;
    v71 = *(char **)(v135 + 56);
    v72 = (uint64_t)v114;
    v73 = v114;
    v74 = 1;
  }
  else
  {
    v75 = v117;
    sub_24746BC90(v69, v117);
    v72 = (uint64_t)v114;
    sub_247487EB4();
    sub_24746BC54(v75);
    v70 = v135;
    v71 = *(char **)(v135 + 56);
    v73 = (char *)v72;
    v74 = 0;
  }
  v125 = v71;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v71)(v73, v74, 1, v36);
  v76 = v128;
  v77 = v129;
  v132 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v70 + 48);
  if (v132(v72, 1, v36) == 1)
  {
    sub_24746BD1C(v72);
    v78 = 1;
    v79 = v113;
    v80 = v112;
    v81 = (uint64_t)v111;
LABEL_39:
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v125)(v81, v78, 1, v36);
    sub_24746A438(v79, v81, v80);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v135 + 8))(v133, v36);
    return sub_24746BD1C(v81);
  }
  v126 = *(char **)(v70 + 32);
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v126)(v123, v72, v36);
  while (1)
  {
    v83 = v132;
    if (v67 != v136)
      break;
LABEL_20:
    v84 = v121;
    v85 = v134;
    v124(v121, 1, 1, v134);
    v67 = v136;
LABEL_21:
    v86 = v84;
    v87 = v122;
    sub_24746BCD4(v86, v122);
    v88 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v119)(v87, 1, v85);
    v89 = (uint64_t)v120;
    if (v88 == 1)
    {
      v90 = v120;
      v91 = 1;
    }
    else
    {
      v103 = v87;
      v104 = v117;
      sub_24746BC90(v103, v117);
      sub_247487EB4();
      sub_24746BC54(v104);
      v90 = (char *)v89;
      v91 = 0;
    }
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v125)(v90, v91, 1, v36);
    v105 = v135;
    v106 = v123;
    if (v83(v89, 1, v36) == 1)
    {
      sub_24746BD1C(v89);
      v81 = (uint64_t)v111;
      ((void (*)(char *, char *, uint64_t))v126)(v111, v106, v36);
      v78 = 0;
      v79 = v113;
      v80 = v112;
      goto LABEL_39;
    }
    v107 = v118;
    ((void (*)(void))v126)();
    sub_24746D2A0((unint64_t *)&qword_2576A6070, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
    v108 = sub_2474882EC();
    v109 = *(void (**)(char *, uint64_t))(v105 + 8);
    if ((v108 & 1) != 0)
    {
      v109(v106, v36);
      result = ((uint64_t (*)(char *, char *, uint64_t))v126)(v106, v107, v36);
    }
    else
    {
      result = ((uint64_t (*)(char *, uint64_t))v109)(v107, v36);
    }
    v76 = v128;
    v77 = v129;
  }
  v92 = v136;
  if (v67 > v136)
    v92 = v67;
  v131 = v92;
  while (v131 != v67)
  {
    v94 = v5;
    sub_24746BC10(v76+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v67, (uint64_t)v13);
    v95 = v134;
    v96 = v13[*(int *)(v134 + 20)];
    sub_24746BC10((uint64_t)v13, (uint64_t)v10);
    if (v96 != 1)
    {
      sub_24746BC54((uint64_t)v10);
      v93 = v130;
      sub_24746BC10((uint64_t)v13, v130);
      ((void (*)(char *, char *, uint64_t))v77)(v39, v133, v36);
LABEL_27:
      sub_24746BC54(v93);
      (*(void (**)(char *, uint64_t))(v135 + 8))(v39, v36);
      v5 = v94;
      goto LABEL_28;
    }
    v97 = *(_QWORD *)&v10[*(int *)(v95 + 24)];
    sub_24746BC54((uint64_t)v10);
    v93 = v130;
    sub_24746BC10((uint64_t)v13, v130);
    ((void (*)(char *, char *, uint64_t))v77)(v39, v133, v36);
    if (!v97)
      goto LABEL_27;
    v98 = v10;
    v99 = v127;
    sub_247487EB4();
    sub_24746D2A0((unint64_t *)&qword_2576A6070, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE948]);
    v100 = sub_2474882EC();
    v101 = *(void (**)(char *, uint64_t))(v135 + 8);
    v102 = v99;
    v10 = v98;
    v77 = v129;
    v101(v102, v36);
    sub_24746BC54(v93);
    v101(v39, v36);
    v76 = v128;
    v5 = v94;
    if ((v100 & 1) == 0)
    {
      v84 = v121;
      sub_24746BC90((uint64_t)v13, v121);
      v85 = v134;
      v124(v84, 0, 1, v134);
      ++v67;
      v83 = v132;
      goto LABEL_21;
    }
LABEL_28:
    ++v67;
    result = sub_24746BC54((uint64_t)v13);
    v83 = v132;
    if (v136 == v67)
      goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_24746BBE0()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ActivitySegmentCalculator()
{
  return objc_opt_self();
}

uint64_t sub_24746BC10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SiriUsageMetrics();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24746BC54(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SiriUsageMetrics();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24746BC90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SiriUsageMetrics();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24746BCD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6068);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24746BD1C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24746BD5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_24746BDB4(uint64_t a1@<X0>, void (*a2)(char *, uint64_t)@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, _QWORD *a5@<X8>, double a6@<D0>)
{
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
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  double v26;
  char v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  os_log_type_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  void (*v80)(char *, uint64_t);
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  uint64_t v91[2];
  uint64_t v92;

  v90 = a5;
  v81 = a4;
  v89 = a3;
  v88 = type metadata accessor for SiriUsageMetrics();
  v9 = MEMORY[0x24BDAC7A8](v88);
  v11 = (char *)&v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v87 = (uint64_t)&v79 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v83 = (uint64_t)&v79 - v14;
  v15 = sub_247487F2C();
  v84 = *(_QWORD *)(v15 - 8);
  v85 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v86 = (char *)&v79 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_2474880AC();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v79 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v19);
  v82 = (char *)&v79 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v79 - v24;
  sub_247487ED8();
  if (v26 != a6)
  {
    if (qword_254448180 != -1)
      swift_once();
    v52 = sub_24748828C();
    __swift_project_value_buffer(v52, (uint64_t)qword_254448188);
    sub_24746BC10(a1, (uint64_t)v11);
    v53 = sub_247488274();
    v54 = sub_247488418();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = (uint8_t *)swift_slowAlloc();
      v56 = swift_slowAlloc();
      v91[0] = v56;
      *(_DWORD *)v55 = 136315138;
      sub_247487EE4();
      sub_24746D2A0(&qword_2576A6098, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB8B8]);
      v57 = sub_2474885B0();
      v92 = sub_247473DB8(v57, v58, v91);
      sub_247488478();
      swift_bridgeObjectRelease();
      sub_24746BC54((uint64_t)v11);
      _os_log_impl(&dword_247463000, v53, v54, "SiriActivityWeek.init(): metrics time interval: %s is not equal to one day", v55, 0xCu);
      v59 = 1;
      swift_arrayDestroy();
      MEMORY[0x24957C430](v56, -1, -1);
      MEMORY[0x24957C430](v55, -1, -1);

      v60 = 0;
LABEL_21:
      v74 = v90;
      *v90 = v60;
      *((_BYTE *)v74 + 8) = v59;
      return;
    }
    sub_24746BC54((uint64_t)v11);
    goto LABEL_19;
  }
  sub_247487ECC();
  v80 = a2;
  v27 = sub_247488118();
  v28 = *(void (**)(char *, uint64_t))(v18 + 8);
  v28(v25, v17);
  if ((v27 & 1) == 0)
  {
    if (qword_254448180 != -1)
      swift_once();
    v61 = sub_24748828C();
    __swift_project_value_buffer(v61, (uint64_t)qword_254448188);
    v62 = a1;
    v63 = v87;
    sub_24746BC10(v62, v87);
    v64 = v21;
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v21, v89, v17);
    v53 = sub_247488274();
    v65 = v17;
    v66 = sub_247488418();
    if (os_log_type_enabled(v53, v66))
    {
      v67 = v63;
      v68 = swift_slowAlloc();
      v89 = swift_slowAlloc();
      v91[0] = v89;
      *(_DWORD *)v68 = 136315394;
      v80 = v28;
      sub_247487EE4();
      sub_24746D2A0(&qword_2576A6098, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB8B8]);
      v69 = sub_2474885B0();
      v92 = sub_247473DB8(v69, v70, v91);
      sub_247488478();
      swift_bridgeObjectRelease();
      sub_24746BC54(v67);
      *(_WORD *)(v68 + 12) = 2080;
      sub_24746D2A0((unint64_t *)&qword_2576A6090, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
      v71 = sub_2474885B0();
      v92 = sub_247473DB8(v71, v72, v91);
      sub_247488478();
      swift_bridgeObjectRelease();
      v80(v64, v65);
      _os_log_impl(&dword_247463000, v53, v66, "SiriActivityWeek.init(): metrics time interval: %s is not aligned with weekEnding date: %s", (uint8_t *)v68, 0x16u);
      v73 = v89;
      swift_arrayDestroy();
      MEMORY[0x24957C430](v73, -1, -1);
      MEMORY[0x24957C430](v68, -1, -1);
    }
    else
    {
      sub_24746BC54(v63);
      v28(v21, v65);
    }
LABEL_19:

    goto LABEL_20;
  }
  if (*(_BYTE *)(a1 + *(int *)(v88 + 20)) != 1)
  {
LABEL_20:
    v60 = 0;
    v59 = 1;
    goto LABEL_21;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6078);
  v29 = sub_24748813C();
  v30 = *(_QWORD *)(v29 - 8);
  v31 = (*(unsigned __int8 *)(v30 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 80);
  v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_2474896A0;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v30 + 104))(v32 + v31, *MEMORY[0x24BDCF220], v29);
  sub_24746C9C8(v32);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_247487EB4();
  v33 = v28;
  v34 = v86;
  v35 = v89;
  sub_2474880F4();
  swift_bridgeObjectRelease();
  v80 = v33;
  v33(v25, v17);
  v36 = sub_247487EF0();
  if ((v37 & 1) == 0)
  {
    v38 = v36;
    if (qword_254448180 != -1)
      swift_once();
    v39 = sub_24748828C();
    __swift_project_value_buffer(v39, (uint64_t)qword_254448188);
    v40 = v82;
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v82, v35, v17);
    v41 = v83;
    sub_24746BC10(a1, v83);
    v42 = sub_247488274();
    v43 = v17;
    v44 = sub_247488418();
    if (os_log_type_enabled(v42, v44))
    {
      v45 = swift_slowAlloc();
      v89 = v38;
      v46 = v45;
      v87 = swift_slowAlloc();
      v91[0] = v87;
      *(_DWORD *)v46 = 134218498;
      v92 = v89;
      sub_247488478();
      *(_WORD *)(v46 + 12) = 2080;
      sub_24746D2A0((unint64_t *)&qword_2576A6090, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
      v47 = sub_2474885B0();
      v92 = sub_247473DB8(v47, v48, v91);
      sub_247488478();
      swift_bridgeObjectRelease();
      v80(v40, v43);
      *(_WORD *)(v46 + 22) = 2048;
      v49 = *(_QWORD *)(v83 + *(int *)(v88 + 24));
      sub_24746BC54(v83);
      v92 = v49;
      sub_247488478();
      _os_log_impl(&dword_247463000, v42, v44, "SiriActivityWeek: assistant valid turn count from %ld days before %s is %lu", (uint8_t *)v46, 0x20u);
      v50 = v87;
      swift_arrayDestroy();
      MEMORY[0x24957C430](v50, -1, -1);
      v51 = v46;
      v38 = v89;
      MEMORY[0x24957C430](v51, -1, -1);

      (*(void (**)(char *, uint64_t))(v84 + 8))(v86, v85);
    }
    else
    {
      sub_24746BC54(v41);

      v80(v40, v43);
      (*(void (**)(char *, uint64_t))(v84 + 8))(v34, v85);
    }
    v60 = 0;
    v59 = 1;
    if ((v38 & 0x8000000000000000) == 0 && v38 < v81)
    {
      v59 = 0;
      v60 = *(_QWORD *)(a1 + *(int *)(v88 + 24));
    }
    goto LABEL_21;
  }
  v91[0] = 0;
  v91[1] = 0xE000000000000000;
  sub_2474884C0();
  swift_bridgeObjectRelease();
  strcpy((char *)v91, "day is nil in ");
  HIBYTE(v91[1]) = -18;
  sub_24746D2A0(&qword_2576A6080, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
  v75 = v85;
  sub_2474885B0();
  sub_247488340();
  swift_bridgeObjectRelease();
  v76 = v91[0];
  v77 = v91[1];
  sub_24746CC30();
  swift_allocError();
  *v78 = v76;
  v78[1] = v77;
  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v84 + 8))(v34, v75);
}

_QWORD *sub_24746C7AC(void (*a1)(_QWORD *__return_ptr, _QWORD), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;
  char v16;
  void (*v17)(_QWORD *__return_ptr, _QWORD);

  v4 = *(_QWORD *)(a3 + 16);
  if (!v4)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v7 = *(_QWORD *)(type metadata accessor for SiriUsageMetrics() - 8);
  v8 = a3 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  v9 = *(_QWORD *)(v7 + 72);
  swift_bridgeObjectRetain();
  v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v17 = a1;
  do
  {
    a1(&v15, v8);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10;
    }
    if ((v16 & 1) == 0)
    {
      v11 = v15;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v10 = sub_2474766B0(0, v10[2] + 1, 1, v10);
      v13 = v10[2];
      v12 = v10[3];
      if (v13 >= v12 >> 1)
        v10 = sub_2474766B0((_QWORD *)(v12 > 1), v13 + 1, 1, v10);
      v10[2] = v13 + 1;
      v10[v13 + 4] = v11;
      a1 = v17;
    }
    v8 += v9;
    --v4;
  }
  while (v4);
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_24746C90C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_247488538();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_24746C9A0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_24746C9C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_24748813C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60A0);
    v10 = sub_2474884B4();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_24746D2A0(&qword_2576A60A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2A8]);
      v14 = sub_2474882D4();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_24746D2A0(&qword_2576A60B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2C0]);
          v20 = sub_247488310();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

unint64_t sub_24746CC30()
{
  unint64_t result;

  result = qword_2576A6088;
  if (!qword_2576A6088)
  {
    result = MEMORY[0x24957C370](&unk_24748974C, &type metadata for ActivitySegmentMetricsError);
    atomic_store(result, (unint64_t *)&qword_2576A6088);
  }
  return result;
}

_QWORD *sub_24746CC74(uint8_t *a1, uint64_t a2)
{
  uint64_t v3;
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
  void (*v14)(char *, uint8_t *, uint64_t);
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void (*v36)(unint64_t, _QWORD, uint64_t);
  uint8_t *v37;
  char *v38;
  char v39;
  char v40;
  uint64_t v41;
  char v42;
  _QWORD *v43;
  unint64_t v44;
  _QWORD *v45;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint8_t *v58;
  char *v59;
  _QWORD *v60;
  unint64_t v61;
  uint64_t v62;

  v56 = a2;
  v3 = sub_247487F2C();
  v53 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v59 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2474880C4();
  v55 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v54 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_247488148();
  v51 = *(_QWORD *)(v7 - 8);
  v52 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v57 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2474880AC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254448180 != -1)
    swift_once();
  v13 = sub_24748828C();
  __swift_project_value_buffer(v13, (uint64_t)qword_254448188);
  v14 = *(void (**)(char *, uint8_t *, uint64_t))(v10 + 16);
  v58 = a1;
  v14(v12, a1, v9);
  v15 = sub_247488274();
  v16 = sub_247488418();
  v17 = os_log_type_enabled(v15, v16);
  v50 = v9;
  if (v17)
  {
    v18 = swift_slowAlloc();
    v48 = v5;
    v19 = (uint8_t *)v18;
    v20 = swift_slowAlloc();
    v49 = v3;
    v21 = v20;
    v60 = (_QWORD *)v20;
    *(_DWORD *)v19 = 136315138;
    v47 = v19 + 4;
    sub_24746D2A0((unint64_t *)&qword_2576A6090, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    v22 = sub_2474885B0();
    v62 = sub_247473DB8(v22, v23, (uint64_t *)&v60);
    sub_247488478();
    swift_bridgeObjectRelease();
    v24 = *(void (**)(char *, uint64_t))(v10 + 8);
    v24(v12, v9);
    _os_log_impl(&dword_247463000, v15, v16, "SiriActivityWeek.init() week ending: %s", v19, 0xCu);
    swift_arrayDestroy();
    v25 = v21;
    v3 = v49;
    MEMORY[0x24957C430](v25, -1, -1);
    v26 = v19;
    v5 = v48;
    MEMORY[0x24957C430](v26, -1, -1);
  }
  else
  {
    v24 = *(void (**)(char *, uint64_t))(v10 + 8);
    v24(v12, v9);
  }

  v28 = v54;
  v27 = v55;
  (*(void (**)(char *, _QWORD, uint64_t))(v55 + 104))(v54, *MEMORY[0x24BDCEF70], v5);
  v29 = v57;
  sub_2474880D0();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6078);
  v30 = sub_24748813C();
  v31 = *(_QWORD *)(v30 - 8);
  v32 = *(_QWORD *)(v31 + 72);
  v33 = (*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
  v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_2474896B0;
  v35 = v34 + v33;
  v36 = *(void (**)(unint64_t, _QWORD, uint64_t))(v31 + 104);
  v36(v35, *MEMORY[0x24BDCF230], v30);
  v36(v35 + v32, *MEMORY[0x24BDCF258], v30);
  v36(v35 + 2 * v32, *MEMORY[0x24BDCF260], v30);
  sub_24746C9C8(v34);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v37 = v58;
  v38 = v59;
  sub_247488100();
  swift_bridgeObjectRelease();
  sub_247487EFC();
  if ((v39 & 1) != 0 || (sub_247487F14(), (v40 & 1) != 0) || (v41 = sub_247487F20(), (v42 & 1) != 0))
  {
    swift_bridgeObjectRelease();
    v60 = 0;
    v61 = 0xE000000000000000;
    sub_2474884C0();
    sub_247488340();
    sub_24746D2A0(&qword_2576A6080, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
    sub_2474885B0();
    sub_247488340();
    swift_bridgeObjectRelease();
    v43 = v60;
    v44 = v61;
    sub_24746CC30();
    swift_allocError();
    *v45 = v43;
    v45[1] = v44;
    swift_willThrow();
    v24((char *)v37, v50);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v38, v3);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v29, v52);
  }
  else
  {
    MEMORY[0x24BDAC7A8](v41);
    *(&v47 - 6) = (uint8_t *)0x40F5180000000000;
    *(&v47 - 5) = (uint8_t *)v29;
    *(&v47 - 4) = (uint8_t *)v38;
    *(&v47 - 3) = v37;
    *(&v47 - 2) = (uint8_t *)7;
    v43 = sub_24746C7AC((void (*)(_QWORD *__return_ptr, _QWORD))sub_24746D280, (uint64_t)(&v47 - 8), v56);
    v24((char *)v37, v50);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v38, v3);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v29, v52);
    swift_bridgeObjectRelease();
  }
  return v43;
}

void sub_24746D280(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  sub_24746BDB4(a1, *(void (**)(char *, uint64_t))(v2 + 24), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), a2, *(double *)(v2 + 16));
}

uint64_t sub_24746D2A0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24957C370](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for ActivitySegmentMetricsError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ActivitySegmentMetricsError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ActivitySegmentMetricsError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for ActivitySegmentMetricsError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivitySegmentMetricsError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ActivitySegmentMetricsError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ActivitySegmentMetricsError()
{
  return &type metadata for ActivitySegmentMetricsError;
}

void sub_24746D41C()
{
  sub_2474884C0();
  sub_247488340();
  __asm { BR              X10 }
}

uint64_t sub_24746D4AC()
{
  uint64_t v1;

  sub_247488340();
  swift_bridgeObjectRelease();
  sub_247488340();
  type metadata accessor for NewCustomerSegment.Result();
  sub_247467000();
  sub_247488340();
  swift_bridgeObjectRelease();
  sub_247488340();
  return v1;
}

uint64_t sub_24746D5E8(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t EnablementStatus;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v4 + 80) = a2;
  *(_QWORD *)(v4 + 88) = a4;
  *(_BYTE *)(v4 + 284) = a3;
  *(_QWORD *)(v4 + 72) = a1;
  *(_QWORD *)(v4 + 96) = type metadata accessor for NewCustomerSegment.Result();
  *(_QWORD *)(v4 + 104) = swift_task_alloc();
  *(_QWORD *)(v4 + 112) = swift_task_alloc();
  *(_QWORD *)(v4 + 120) = swift_task_alloc();
  *(_QWORD *)(v4 + 128) = swift_task_alloc();
  EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  *(_QWORD *)(v4 + 136) = EnablementStatus;
  *(_QWORD *)(v4 + 144) = *(_QWORD *)(EnablementStatus - 8);
  *(_QWORD *)(v4 + 152) = swift_task_alloc();
  v6 = sub_247488064();
  *(_QWORD *)(v4 + 160) = v6;
  *(_QWORD *)(v4 + 168) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 176) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60C0);
  *(_QWORD *)(v4 + 184) = swift_task_alloc();
  *(_QWORD *)(v4 + 192) = swift_task_alloc();
  *(_QWORD *)(v4 + 200) = swift_task_alloc();
  v7 = sub_2474880AC();
  *(_QWORD *)(v4 + 208) = v7;
  *(_QWORD *)(v4 + 216) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v4 + 224) = swift_task_alloc();
  v8 = sub_24748828C();
  *(_QWORD *)(v4 + 232) = v8;
  *(_QWORD *)(v4 + 240) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v4 + 248) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24746D754()
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
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int v21;
  uint64_t v22;
  unint64_t v23;
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
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  os_log_type_t v52;
  uint64_t v53;

  if (qword_254448180 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 240);
  v1 = *(_QWORD *)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 232);
  v5 = *(_QWORD *)(v0 + 208);
  v6 = *(_QWORD *)(v0 + 216);
  v7 = *(_QWORD *)(v0 + 200);
  v9 = *(_QWORD *)(v0 + 80);
  v8 = *(_QWORD *)(v0 + 88);
  v10 = __swift_project_value_buffer(v3, (uint64_t)qword_254448188);
  *(_QWORD *)(v0 + 256) = v10;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v10, v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v9, v5);
  sub_24746EC24(v8, v7);
  v11 = sub_247488274();
  v12 = sub_247488418();
  if (os_log_type_enabled(v11, v12))
  {
    v52 = v12;
    v13 = *(_QWORD *)(v0 + 224);
    v45 = *(_QWORD *)(v0 + 216);
    v46 = *(_QWORD *)(v0 + 208);
    v48 = *(_QWORD *)(v0 + 192);
    v49 = *(_QWORD *)(v0 + 200);
    v14 = *(_QWORD *)(v0 + 168);
    v15 = *(_QWORD *)(v0 + 176);
    v16 = *(_QWORD *)(v0 + 160);
    v47 = *(_QWORD *)(v0 + 144);
    v50 = *(_QWORD *)(v0 + 136);
    v44 = *(unsigned __int8 *)(v0 + 284);
    v17 = swift_slowAlloc();
    v51 = swift_slowAlloc();
    v53 = v51;
    *(_DWORD *)v17 = 136315650;
    sub_247483094(v15);
    v18 = sub_24748801C();
    v20 = v19;
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v16);
    *(_QWORD *)(v0 + 56) = sub_247473DB8(v18, v20, &v53);
    sub_247488478();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v13, v46);
    *(_WORD *)(v17 + 12) = 1024;
    *(_DWORD *)(v0 + 280) = v44;
    sub_247488478();
    *(_WORD *)(v17 + 18) = 2080;
    sub_24746EC24(v49, v48);
    v21 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v47 + 48))(v48, 1, v50);
    v22 = *(_QWORD *)(v0 + 192);
    if (v21 == 1)
    {
      sub_247470340(*(_QWORD *)(v0 + 192), &qword_2576A60C0);
      v23 = 0xE300000000000000;
      v24 = 7104878;
    }
    else
    {
      sub_247467000();
      v24 = v29;
      v23 = v30;
      sub_24746ECB0(v22, (uint64_t (*)(_QWORD))type metadata accessor for SiriFirstEnablementStatus);
    }
    v32 = *(_QWORD *)(v0 + 240);
    v31 = *(_QWORD *)(v0 + 248);
    v33 = *(_QWORD *)(v0 + 232);
    v34 = *(_QWORD *)(v0 + 200);
    *(_QWORD *)(v0 + 64) = sub_247473DB8(v24, v23, &v53);
    sub_247488478();
    swift_bridgeObjectRelease();
    sub_247470340(v34, &qword_2576A60C0);
    _os_log_impl(&dword_247463000, v11, v52, "Starting NewCustomerSegment.calculate(now: %s, currentAssistantEnabled: %{BOOL}d, lastKnown: %s", (uint8_t *)v17, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v51, -1, -1);
    MEMORY[0x24957C430](v17, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v33);
  }
  else
  {
    v26 = *(_QWORD *)(v0 + 240);
    v25 = *(_QWORD *)(v0 + 248);
    v27 = *(_QWORD *)(v0 + 232);
    v28 = *(_QWORD *)(v0 + 200);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 216) + 8))(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 208));
    sub_247470340(v28, &qword_2576A60C0);

    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v27);
  }
  v35 = *(_QWORD *)(v0 + 184);
  v36 = *(_QWORD *)(v0 + 136);
  v37 = *(_QWORD *)(v0 + 144);
  sub_24746EC24(*(_QWORD *)(v0 + 88), v35);
  v38 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36);
  v39 = *(_QWORD *)(v0 + 184);
  v40 = *(_QWORD *)(v0 + 152);
  if (v38 == 1)
  {
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v40, 1, 3, v41);
    sub_247470340(v39, &qword_2576A60C0);
  }
  else
  {
    sub_24746ECEC(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 152), (uint64_t (*)(_QWORD))type metadata accessor for SiriFirstEnablementStatus);
  }
  v42 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 264) = v42;
  *v42 = v0;
  v42[1] = sub_24746DB8C;
  return sub_24746E1D0(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 80), *(_BYTE *)(v0 + 284), *(_QWORD *)(v0 + 152));
}

uint64_t sub_24746DB8C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 272) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24746DBF0()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  sub_24746EC6C(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 120), (uint64_t (*)(_QWORD))type metadata accessor for NewCustomerSegment.Result);
  v1 = sub_247488274();
  v2 = sub_247488418();
  if (os_log_type_enabled(v1, v2))
  {
    v12 = *(_QWORD *)(v0 + 152);
    v3 = *(_QWORD *)(v0 + 120);
    v4 = swift_slowAlloc();
    v5 = swift_slowAlloc();
    v13 = v5;
    *(_DWORD *)v4 = 136315394;
    *(_QWORD *)(v0 + 40) = sub_247473DB8(0xD000000000000031, 0x800000024748A810, &v13);
    sub_247488478();
    *(_WORD *)(v4 + 12) = 2080;
    sub_24746D41C();
    *(_QWORD *)(v0 + 48) = sub_247473DB8(v6, v7, &v13);
    sub_247488478();
    swift_bridgeObjectRelease();
    sub_24746ECB0(v3, (uint64_t (*)(_QWORD))type metadata accessor for NewCustomerSegment.Result);
    _os_log_impl(&dword_247463000, v1, v2, "Ended NewCustomerSegment.%s -> %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v5, -1, -1);
    MEMORY[0x24957C430](v4, -1, -1);

    v8 = v12;
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 152);
    v10 = *(_QWORD *)(v0 + 120);

    sub_24746ECB0(v10, (uint64_t (*)(_QWORD))type metadata accessor for NewCustomerSegment.Result);
    v8 = v9;
  }
  sub_24746ECB0(v8, (uint64_t (*)(_QWORD))type metadata accessor for SiriFirstEnablementStatus);
  sub_24746ECEC(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 72), (uint64_t (*)(_QWORD))type metadata accessor for NewCustomerSegment.Result);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24746DE58()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = *(_QWORD *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 104);
  v2 = *(_BYTE **)(v0 + 112);
  sub_24746EC6C(*(_QWORD *)(v0 + 152), (uint64_t)&v2[*(int *)(*(_QWORD *)(v0 + 96) + 20)], (uint64_t (*)(_QWORD))type metadata accessor for SiriFirstEnablementStatus);
  *v2 = 7;
  sub_24746EC6C((uint64_t)v2, v3, (uint64_t (*)(_QWORD))type metadata accessor for NewCustomerSegment.Result);
  MEMORY[0x24957C2F8](v1);
  MEMORY[0x24957C2F8](v1);
  v4 = sub_247488274();
  v5 = sub_247488418();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 272);
    v19 = *(_QWORD *)(v0 + 152);
    v17 = *(_QWORD *)(v0 + 104);
    v7 = swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v20 = v18;
    *(_DWORD *)v7 = 136315650;
    *(_QWORD *)(v0 + 16) = sub_247473DB8(0xD000000000000031, 0x800000024748A810, &v20);
    sub_247488478();
    *(_WORD *)(v7 + 12) = 2112;
    MEMORY[0x24957C2F8](v6);
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 24) = v9;
    sub_247488478();
    *v8 = v9;

    *(_WORD *)(v7 + 22) = 2080;
    sub_24746D41C();
    *(_QWORD *)(v0 + 32) = sub_247473DB8(v10, v11, &v20);
    sub_247488478();
    swift_bridgeObjectRelease();
    sub_24746ECB0(v17, (uint64_t (*)(_QWORD))type metadata accessor for NewCustomerSegment.Result);
    _os_log_impl(&dword_247463000, v4, v5, "Ended NewCustomerSegment.%s with error: %@ -> %s", (uint8_t *)v7, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60D0);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v18, -1, -1);
    MEMORY[0x24957C430](v7, -1, -1);

    v12 = v19;
  }
  else
  {
    v13 = *(void **)(v0 + 272);
    v14 = *(_QWORD *)(v0 + 152);
    v15 = *(_QWORD *)(v0 + 104);

    sub_24746ECB0(v15, (uint64_t (*)(_QWORD))type metadata accessor for NewCustomerSegment.Result);
    v12 = v14;
  }
  sub_24746ECB0(v12, (uint64_t (*)(_QWORD))type metadata accessor for SiriFirstEnablementStatus);
  sub_24746ECEC(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 72), (uint64_t (*)(_QWORD))type metadata accessor for NewCustomerSegment.Result);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24746E1D0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 32) = a2;
  *(_QWORD *)(v4 + 40) = a4;
  *(_BYTE *)(v4 + 128) = a3;
  *(_QWORD *)(v4 + 24) = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65A0);
  *(_QWORD *)(v4 + 48) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60D8);
  *(_QWORD *)(v4 + 56) = swift_task_alloc();
  v5 = sub_2474880AC();
  *(_QWORD *)(v4 + 64) = v5;
  *(_QWORD *)(v4 + 72) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 80) = swift_task_alloc();
  *(_QWORD *)(v4 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60E0);
  *(_QWORD *)(v4 + 96) = swift_task_alloc();
  return swift_task_switch();
}

void sub_24746E2A8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_BYTE *)(v0 + 128);
  v3 = *(int *)(*(_QWORD *)(v0 + 88) + 48);
  sub_24746EC6C(*(_QWORD *)(v0 + 40), v1, (uint64_t (*)(_QWORD))type metadata accessor for SiriFirstEnablementStatus);
  *(_BYTE *)(v1 + v3) = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  *(_QWORD *)(v0 + 104) = v4;
  v5 = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v0 + 112) = v5;
  v6 = (char *)sub_24746E340
     + 4 * byte_247489798[(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v1, 3, v4)];
  __asm { BR              X10 }
}

uint64_t sub_24746E340()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  uint64_t v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = *(_QWORD *)(v1 + 56);
  v4 = *(_QWORD *)(v1 + 48);
  v5 = *(_QWORD *)(v1 + 32);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 + 72) + 32);
  v6(*(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 64));
  v7 = sub_2474880C4();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v3, 1, 1, v7);
  v8 = sub_247488160();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v4, 1, 1, v8);
  v9 = sub_247481F14(v5, v3, v4);
  sub_247470340(v4, (uint64_t *)&unk_2576A65A0);
  sub_247470340(v3, &qword_2576A60D8);
  if (qword_254448180 != -1)
    swift_once();
  v12 = sub_24748828C();
  __swift_project_value_buffer(v12, (uint64_t)qword_254448188);
  v13 = sub_247488274();
  v14 = sub_247488418();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v15 = 134217984;
    *(_QWORD *)(v1 + 16) = v9;
    sub_247488478();
    _os_log_impl(&dword_247463000, v13, v14, "NewCustomerSegment - was recently enabled at previous check, %ld days ago", v15, 0xCu);
    MEMORY[0x24957C430](v15, -1, -1);
  }

  v16 = *(_QWORD *)(v1 + 80);
  if ((uint64_t)v9 <= 28)
  {
    v18 = *(_QWORD *)(v1 + 64);
    v19 = *(_QWORD *)(v1 + 24);
    v20 = v19 + *(int *)(type metadata accessor for NewCustomerSegment.Result() + 20);
    v6(v20, v16, v18);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v20, 0, 3, v0);
    v11 = 0;
  }
  else
  {
    v17 = *(_QWORD *)(v1 + 24);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 72) + 8))(*(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 64));
    v10 = v17 + *(int *)(type metadata accessor for NewCustomerSegment.Result() + 20);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(v10, 3, 3, v0);
    v11 = 7;
  }
  **(_BYTE **)(v1 + 24) = v11;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_24746E93C(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 129) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24746E998()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (*(_BYTE *)(v0 + 129) == 1)
  {
    if (qword_254448180 != -1)
      swift_once();
    v1 = sub_24748828C();
    __swift_project_value_buffer(v1, (uint64_t)qword_254448188);
    v2 = sub_247488274();
    v3 = sub_247488418();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_247463000, v2, v3, "NewCustomerSegment - never checked before, has evidence of recent onboarding.", v4, 2u);
      MEMORY[0x24957C430](v4, -1, -1);
    }
    v5 = *(_QWORD *)(v0 + 104);
    v6 = *(_QWORD *)(v0 + 112);
    v7 = *(_QWORD *)(v0 + 64);
    v8 = *(_QWORD *)(v0 + 72);
    v10 = *(_QWORD *)(v0 + 24);
    v9 = *(_QWORD *)(v0 + 32);

    v11 = v10 + *(int *)(type metadata accessor for NewCustomerSegment.Result() + 20);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v11, v9, v7);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v6 + 56))(v11, 0, 3, v5);
    v12 = 0;
  }
  else
  {
    if (qword_254448180 != -1)
      swift_once();
    v13 = sub_24748828C();
    __swift_project_value_buffer(v13, (uint64_t)qword_254448188);
    v14 = sub_247488274();
    v15 = sub_247488418();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_247463000, v14, v15, "NewCustomerSegment - never checked before, assume current enabled state is the long term status quo.", v16, 2u);
      MEMORY[0x24957C430](v16, -1, -1);
    }
    v17 = *(_QWORD *)(v0 + 104);
    v18 = *(_QWORD *)(v0 + 112);
    v19 = *(_QWORD *)(v0 + 24);

    v20 = type metadata accessor for NewCustomerSegment.Result();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v19 + *(int *)(v20 + 20), 3, 3, v17);
    v12 = 7;
  }
  **(_BYTE **)(v0 + 24) = v12;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for NewCustomerSegment.Result()
{
  uint64_t result;

  result = qword_2576A6168;
  if (!qword_2576A6168)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24746EC24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24746EC6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24746ECB0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24746ECEC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24746ED30(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v4;
  uint64_t EnablementStatus;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int v9;
  int v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v19;

  v4 = sub_2474880AC();
  MEMORY[0x24BDAC7A8](v4);
  EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  MEMORY[0x24BDAC7A8](EnablementStatus);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E00);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  v10 = *a2;
  if (v9 == 7)
  {
    if (v10 == 7)
      goto LABEL_6;
  }
  else if (v10 != 7)
  {
    sub_24747AE74(v9);
    if ((v11 & 1) != 0)
    {
LABEL_6:
      v12 = *(int *)(type metadata accessor for NewCustomerSegment.Result() + 20);
      v13 = (uint64_t)&a1[v12];
      v14 = (uint64_t)&a2[v12];
      v15 = (uint64_t)&v8[*(int *)(v6 + 48)];
      sub_24746EC6C(v13, (uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for SiriFirstEnablementStatus);
      sub_24746EC6C(v14, v15, (uint64_t (*)(_QWORD))type metadata accessor for SiriFirstEnablementStatus);
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
      v17 = (char *)&loc_24746EEA8
          + 4
          * byte_24748979C[(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v8, 3, v16)];
      __asm { BR              X10 }
    }
  }
  return 0;
}

uint64_t sub_24746EFE0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[8] = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60F8);
  v1[9] = v2;
  v1[10] = *(_QWORD *)(v2 - 8);
  v1[11] = swift_task_alloc();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6100);
  v1[12] = v3;
  v1[13] = *(_QWORD *)(v3 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A65E0);
  v1[16] = swift_task_alloc();
  v1[17] = swift_task_alloc();
  v4 = sub_24748813C();
  v1[18] = v4;
  v1[19] = *(_QWORD *)(v4 - 8);
  v1[20] = swift_task_alloc();
  v5 = sub_2474880AC();
  v1[21] = v5;
  v1[22] = *(_QWORD *)(v5 - 8);
  v1[23] = swift_task_alloc();
  v1[24] = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E80);
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24746F130()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v1 = v0[23];
  v3 = v0[19];
  v2 = v0[20];
  v4 = v0[18];
  sub_247488244();
  sub_24746FBC8();
  v5 = sub_24748822C();
  v0[27] = v5;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v2, *MEMORY[0x24BDCF220], v4);
  sub_2474826B8(-28, v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_24746FC04();
  result = sub_247488304();
  if ((result & 1) != 0)
  {
    v22 = v0[25];
    v23 = v0[24];
    v24 = v0[26];
    v7 = v0[21];
    v8 = (_QWORD *)v0[22];
    v9 = v0[16];
    v10 = v0[17];
    v11 = v0[8];
    v12 = v0[15];
    v20 = v12;
    v13 = v10 + *(int *)(v12 + 48);
    v14 = (void (*)(uint64_t, uint64_t, uint64_t))v8[4];
    v14(v10, v0[23], v7);
    v25 = v5;
    v15 = (void (*)(uint64_t, uint64_t, uint64_t))v8[2];
    v21 = v13;
    v15(v13, v11, v7);
    v16 = v9 + *(int *)(v12 + 48);
    v15(v9, v10, v7);
    v15(v16, v13, v7);
    v14(v22, v9, v7);
    v17 = (void (*)(uint64_t, uint64_t))v8[1];
    v17(v16, v7);
    v18 = v9 + *(int *)(v20 + 48);
    v14(v9, v10, v7);
    v14(v18, v21, v7);
    v14(v22 + *(int *)(v23 + 36), v18, v7);
    v17(v9, v7);
    sub_24746FC4C(v22, v24);
    v19 = (_QWORD *)swift_task_alloc();
    v0[28] = v19;
    *v19 = v0;
    v19[1] = sub_24746F3D8;
    return sub_2474691B0(v0[14], v25, v0[26]);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24746F3D8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24746F43C()
{
  uint64_t v0;
  _QWORD *v1;

  *(_BYTE *)(v0 + 260) = 0;
  sub_2474883DC();
  *(_QWORD *)(v0 + 240) = 0;
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 248) = v1;
  *v1 = v0;
  v1[1] = sub_24746F4B4;
  return sub_2474883E8();
}

uint64_t sub_24746F4B4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

void sub_24746F508()
{
  uint64_t v0;
  void *v1;
  BOOL *v2;
  uint64_t v3;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  _BOOL4 v23;
  uint64_t v24;

  v1 = *(void **)(v0 + 40);
  v2 = (BOOL *)(v0 + 260);
  v3 = *(_QWORD *)(v0 + 240);
  if (v1)
  {
    if (__OFADD__(v3++, 1))
    {
      __break(1u);
    }
    else
    {
      v5 = (void *)sub_247488184();
      if (v5)
      {
        v6 = v5;
        v7 = objc_msgSend(v5, sel_getAnyEventType);

        *v2 = v7 == 47;
        if (v7 != 47)
        {
          *(_QWORD *)(v0 + 240) = v3;
          v19 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v0 + 248) = v19;
          *v19 = v0;
          v19[1] = sub_24746F4B4;
          sub_2474883E8();
          return;
        }
        goto LABEL_6;
      }
    }
    __break(1u);
    return;
  }
LABEL_6:
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  if (qword_254448180 != -1)
    swift_once();
  v8 = sub_24748828C();
  __swift_project_value_buffer(v8, (uint64_t)qword_254448188);
  v23 = *v2;
  v9 = sub_247488274();
  v10 = sub_247488418();
  v11 = os_log_type_enabled(v9, v10);
  v12 = *(_QWORD *)(v0 + 208);
  v14 = *(_QWORD *)(v0 + 104);
  v13 = *(_QWORD *)(v0 + 112);
  v15 = *(_QWORD *)(v0 + 96);
  if (v11)
  {
    v22 = *(_QWORD *)(v0 + 112);
    v21 = *(void **)(v0 + 216);
    v16 = swift_slowAlloc();
    v20 = v14;
    v17 = swift_slowAlloc();
    v24 = v17;
    *(_DWORD *)v16 = 136315650;
    *(_QWORD *)(v0 + 48) = sub_247473DB8(0xD000000000000026, 0x800000024748A8A0, &v24);
    sub_247488478();
    *(_WORD *)(v16 + 12) = 1024;
    *(_DWORD *)(v0 + 256) = v23;
    sub_247488478();
    *(_WORD *)(v16 + 18) = 2048;
    *(_QWORD *)(v0 + 56) = v3;
    sub_247488478();
    _os_log_impl(&dword_247463000, v9, v10, "NewCustomerSegment.%s result: %{BOOL}d from %ld events", (uint8_t *)v16, 0x1Cu);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v17, -1, -1);
    MEMORY[0x24957C430](v16, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v22, v15);
  }
  else
  {

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  sub_247470340(v12, &qword_2576A5E80);
  swift_beginAccess();
  v18 = *v2;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  (*(void (**)(_BOOL8))(v0 + 8))(v18);
}

uint64_t sub_24746F884()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 208);

  sub_247470340(v1, &qword_2576A5E80);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_24746F938(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v3;
  *v3 = v1;
  v3[1] = sub_24746F984;
  return sub_24746EFE0(a1);
}

uint64_t sub_24746F984(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 32) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(_QWORD))(v4 + 8))(a1 & 1);
}

uint64_t sub_24746F9F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  uint64_t v9;

  if (qword_254448180 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 32);
  v2 = sub_24748828C();
  __swift_project_value_buffer(v2, (uint64_t)qword_254448188);
  MEMORY[0x24957C2F8](v1);
  MEMORY[0x24957C2F8](v1);
  v3 = sub_247488274();
  v4 = sub_247488424();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(void **)(v0 + 32);
  if (v5)
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    MEMORY[0x24957C2F8](v6);
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v9;
    sub_247488478();
    *v8 = v9;

    _os_log_impl(&dword_247463000, v3, v4, "Failed to check SELF events for Siri grading opt-in: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60D0);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v8, -1, -1);
    MEMORY[0x24957C430](v7, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

unint64_t sub_24746FBC8()
{
  unint64_t result;

  result = qword_2576A6108;
  if (!qword_2576A6108)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2576A6108);
  }
  return result;
}

unint64_t sub_24746FC04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A6070;
  if (!qword_2576A6070)
  {
    v1 = sub_2474880AC();
    result = MEMORY[0x24957C370](MEMORY[0x24BDCE948], v1);
    atomic_store(result, (unint64_t *)&qword_2576A6070);
  }
  return result;
}

uint64_t sub_24746FC4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_24746FC94(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t EnablementStatus;
  uint64_t v11;
  uint64_t v12;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
    v9 = *(_QWORD *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 3, v8))
    {
      EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
      memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(EnablementStatus - 8) + 64));
    }
    else
    {
      v12 = sub_2474880AC();
      (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v6, v7, v12);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 3, v8);
    }
  }
  return v3;
}

uint64_t sub_24746FD88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 48))(v2, 3, v3);
  if (!(_DWORD)result)
  {
    v5 = sub_2474880AC();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v2, v5);
  }
  return result;
}

_BYTE *sub_24746FDF4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t EnablementStatus;
  uint64_t v10;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 3, v7))
  {
    EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(EnablementStatus - 8) + 64));
  }
  else
  {
    v10 = sub_2474880AC();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v5, v6, v10);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 3, v7);
  }
  return a1;
}

_BYTE *sub_24746FEBC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_BYTE *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;
  uint64_t EnablementStatus;
  uint64_t v15;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(v5, 3, v7);
  v11 = v9(v6, 3, v7);
  if (!v10)
  {
    if (!v11)
    {
      v15 = sub_2474880AC();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v5, v6, v15);
      return a1;
    }
    sub_247470340((uint64_t)v5, &qword_2576A5D68);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(EnablementStatus - 8) + 64));
    return a1;
  }
  v12 = sub_2474880AC();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v5, v6, v12);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 3, v7);
  return a1;
}

_BYTE *sub_24746FFDC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t EnablementStatus;
  uint64_t v10;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 3, v7))
  {
    EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(EnablementStatus - 8) + 64));
  }
  else
  {
    v10 = sub_2474880AC();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v5, v6, v10);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 3, v7);
  }
  return a1;
}

_BYTE *sub_2474700A4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_BYTE *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;
  uint64_t EnablementStatus;
  uint64_t v15;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(v5, 3, v7);
  v11 = v9(v6, 3, v7);
  if (!v10)
  {
    if (!v11)
    {
      v15 = sub_2474880AC();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v5, v6, v15);
      return a1;
    }
    sub_247470340((uint64_t)v5, &qword_2576A5D68);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(EnablementStatus - 8) + 64));
    return a1;
  }
  v12 = sub_2474880AC();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v5, v6, v12);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 3, v7);
  return a1;
}

uint64_t sub_2474701C4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2474701D0(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  int v4;
  unsigned int v5;
  uint64_t EnablementStatus;

  if ((_DWORD)a2 == 248)
  {
    if (*a1 <= 7u)
      v4 = 7;
    else
      v4 = *a1;
    v5 = v4 - 7;
    if (*a1 >= 7u)
      return v5;
    else
      return 0;
  }
  else
  {
    EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(EnablementStatus - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, EnablementStatus);
  }
}

uint64_t sub_247470250()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_24747025C(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t EnablementStatus;

  v5 = result;
  if (a3 == 248)
  {
    *result = a2 + 7;
  }
  else
  {
    EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(EnablementStatus - 8)
                                                                                  + 56))(&v5[*(int *)(a4 + 20)], a2, a2, EnablementStatus);
  }
  return result;
}

uint64_t sub_2474702CC()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for SiriFirstEnablementStatus();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_247470340(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24747037C()
{
  uint64_t v0;

  v0 = sub_24748828C();
  __swift_allocate_value_buffer(v0, qword_254448188);
  __swift_project_value_buffer(v0, (uint64_t)qword_254448188);
  return sub_247488280();
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

uint64_t sub_24747043C@<X0>(NSObject *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  dispatch_semaphore_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  NSObject *v24;
  void (*v25)(char *, uint64_t);
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, NSObject *, uint64_t);
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  const char *v40;
  uint64_t result;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  char *v46;
  uint8_t *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;

  v51 = a2;
  v52 = a1;
  v45 = a4;
  v5 = sub_247488298();
  v6 = *(_QWORD *)(v5 - 8);
  v49 = v5;
  v50 = v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v46 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v48 = (char *)&v44 - v9;
  v10 = sub_2474882C8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v44 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6298);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = dispatch_semaphore_create(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A62A0);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_247489860;
  v22 = sub_2474883D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v19, 1, 1, v22);
  v23 = (_QWORD *)swift_allocObject();
  v23[2] = 0;
  v23[3] = 0;
  v23[4] = v51;
  v23[5] = a3;
  v23[6] = sub_247475E2C;
  v23[7] = v21;
  v23[8] = v20;
  swift_retain_n();
  swift_retain();
  v24 = v20;
  sub_247470A30((uint64_t)v19, (uint64_t)&unk_2576A62B0, (uint64_t)v23);
  swift_release();
  sub_2474882B0();
  sub_2474882BC();
  v25 = *(void (**)(char *, uint64_t))(v11 + 8);
  v25(v14, v10);
  v26 = v24;
  sub_247488448();
  v25(v16, v10);
  if ((sub_2474882A4() & 1) != 0)
  {
    v51 = v21;
    if (qword_254448180 != -1)
      swift_once();
    v27 = sub_24748828C();
    __swift_project_value_buffer(v27, (uint64_t)qword_254448188);
    v28 = v49;
    v29 = v50;
    v30 = *(void (**)(char *, NSObject *, uint64_t))(v50 + 16);
    v31 = v48;
    v30(v48, v52, v49);
    v32 = sub_247488274();
    v33 = sub_247488430();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v54 = v35;
      v52 = v26;
      *(_DWORD *)v34 = 136315138;
      v47 = v34 + 4;
      v30(v46, v31, v28);
      v36 = sub_247488328();
      v53 = sub_247473DB8(v36, v37, &v54);
      sub_247488478();
      swift_bridgeObjectRelease();
      v26 = v52;
      (*(void (**)(char *, uint64_t))(v50 + 8))(v31, v28);
      _os_log_impl(&dword_247463000, v32, v33, "a thread was blocked by a semaphore awaiting a Task and timed out after %s seconds", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24957C430](v35, -1, -1);
      MEMORY[0x24957C430](v34, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v28);
    }

    sub_247475F4C();
    swift_allocError();
    *v39 = 0xD00000000000002FLL;
    v40 = "timed out waiting for an async task to complete";
    goto LABEL_10;
  }
  v38 = *(_QWORD *)(v21 + 24);
  if (v38 == 2)
  {
    sub_247475F4C();
    swift_allocError();
    *v39 = 0xD000000000000028;
    v40 = "unable to extract result from async Task";
LABEL_10:
    v39[1] = (unint64_t)(v40 - 32) | 0x8000000000000000;
    swift_willThrow();

    return swift_release_n();
  }
  v42 = *(_QWORD *)(v21 + 16);
  sub_247473D90(v42, *(_QWORD *)(v21 + 24));

  result = swift_release_n();
  v43 = v45;
  *v45 = v42;
  v43[1] = v38;
  return result;
}

uint64_t sub_247470900(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t);

  v8[4] = a7;
  v8[5] = a8;
  v8[2] = a1;
  v8[3] = a6;
  v12 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v10 = (_QWORD *)swift_task_alloc();
  v8[6] = v10;
  *v10 = v8;
  v10[1] = sub_24747096C;
  return v12(a1);
}

uint64_t sub_24747096C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2474709C0()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(_QWORD *);
  uint64_t v3;
  unint64_t v4;
  _QWORD v6[2];

  v1 = *(uint64_t **)(v0 + 16);
  v2 = *(void (**)(_QWORD *))(v0 + 24);
  v3 = *v1;
  v4 = v1[1];
  v6[0] = v3;
  v6[1] = v4;
  sub_247473D90(v3, v4);
  v2(v6);
  sub_247473DA4(v3, v4);
  sub_247488454();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247470A30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2474883D0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2474883C4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_247475F90(a1, &qword_2576A6298);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2474883AC();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t static SegmentationTask.perform()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t result;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  unint64_t v22;
  uint64_t v23;
  os_log_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  os_log_t v28;
  char *v29;
  uint64_t *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;

  v30 = a1;
  v3 = sub_24748828C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_247488298();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = ((char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10->isa = (Class)60;
  (*(void (**)(NSObject *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BEE5420], v7);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v1;
  sub_24747043C(v10, (uint64_t)&unk_2576A61A8, v11, &v31);
  if (v2)
  {
    (*(void (**)(NSObject *, uint64_t))(v8 + 8))(v10, v7);
    return swift_release();
  }
  else
  {
    v29 = v6;
    (*(void (**)(NSObject *, uint64_t))(v8 + 8))(v10, v7);
    swift_release();
    v14 = v31;
    v13 = v32;
    if (qword_254448180 != -1)
      swift_once();
    v15 = v3;
    v16 = __swift_project_value_buffer(v3, (uint64_t)qword_254448188);
    v17 = v4;
    v18 = v29;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v29, v16, v15);
    sub_247473D90(v14, v13);
    sub_247473D90(v14, v13);
    v19 = sub_247488274();
    v20 = sub_247488418();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v27 = swift_slowAlloc();
      v33 = v27;
      *(_DWORD *)v21 = 136315138;
      v28 = v19;
      if (v13)
      {
        if (v13 == 1)
        {
          v22 = 0xE700000000000000;
          v23 = 0x64657070696B73;
        }
        else
        {
          v31 = 0x3A6572756C696166;
          v32 = 0xE900000000000020;
          sub_247473D90(v14, v13);
          sub_247488340();
          sub_247473DA4(v14, v13);
          v23 = v31;
          v22 = v32;
        }
      }
      else
      {
        v22 = 0xE700000000000000;
        v23 = 0x73736563637573;
      }
      v31 = sub_247473DB8(v23, v22, &v33);
      sub_247488478();
      swift_bridgeObjectRelease();
      sub_247473DA4(v14, v13);
      sub_247473DA4(v14, v13);
      v24 = v28;
      _os_log_impl(&dword_247463000, v28, v20, "SegmentationTask.perform() result: %s", v21, 0xCu);
      v25 = v27;
      swift_arrayDestroy();
      MEMORY[0x24957C430](v25, -1, -1);
      MEMORY[0x24957C430](v21, -1, -1);

      result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v29, v15);
    }
    else
    {
      sub_247473DA4(v14, v13);
      sub_247473DA4(v14, v13);

      result = (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v18, v15);
    }
    v26 = v30;
    *v30 = v14;
    v26[1] = v13;
  }
  return result;
}

uint64_t sub_247470F10(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  *(_QWORD *)(v1 + 40) = a1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 48) = v3;
  *v3 = v1;
  v3[1] = sub_247470F68;
  return static SegmentationTask.performAsync()(a1);
}

uint64_t sub_247470F68()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_247470FD4()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 56);
  v2 = *(_QWORD **)(v0 + 40);
  sub_2474884C0();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0xE000000000000000;
  sub_247488340();
  *(_QWORD *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5C50);
  sub_247488514();

  v3 = *(_QWORD *)(v0 + 24);
  *v2 = *(_QWORD *)(v0 + 16);
  v2[1] = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static SegmentationTask.performAsync()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[12] = a1;
  v2[13] = v1;
  v3 = sub_247487FC8();
  v2[14] = v3;
  v2[15] = *(_QWORD *)(v3 - 8);
  v2[16] = swift_task_alloc();
  v4 = sub_2474880AC();
  v2[17] = v4;
  v2[18] = *(_QWORD *)(v4 - 8);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24747113C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void *v8;
  id v9;
  unsigned __int16 v10;
  id v11;
  unsigned int v12;
  _QWORD *v13;
  __int16 v14;

  if ((_s16SiriUserSegments16SegmentationTaskC9isEnabledSbyFZ_0() & 1) != 0)
  {
    v1 = *(_QWORD *)(v0 + 152);
    v2 = *(_QWORD *)(v0 + 160);
    sub_247488094();
    sub_2474736C8(v1, v2);
    v3 = *(_QWORD *)(v0 + 152);
    v4 = *(_QWORD *)(v0 + 136);
    v5 = *(_QWORD *)(v0 + 128);
    v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 144) + 8);
    *(_QWORD *)(v0 + 168) = v6;
    v6(v3, v4);
    type metadata accessor for SegmentStore();
    sub_24746550C(v5);
    v8 = (void *)objc_opt_self();
    v9 = objc_msgSend(v8, sel_sharedPreferences);
    v10 = (unsigned __int16)objc_msgSend(v9, sel_assistantIsEnabled);

    v11 = objc_msgSend(v8, sel_sharedPreferences);
    v12 = objc_msgSend(v11, sel_dictationIsEnabled);

    *(_QWORD *)(v0 + 40) = &type metadata for AIMLInstrumentationStreamSource;
    *(_QWORD *)(v0 + 48) = &off_2518AA4C0;
    *(_QWORD *)(v0 + 80) = &type metadata for ITunesCloudMusicSubscriptionStatusController;
    *(_QWORD *)(v0 + 88) = &off_2518A9CE8;
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v13;
    if (v12)
      v14 = 256;
    else
      v14 = 0;
    *v13 = v0;
    v13[1] = sub_247471344;
    return sub_2474714C8(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 128), 7, v14 | v10, v0 + 16, v0 + 56);
  }
  else
  {
    *(_OWORD *)*(_QWORD *)(v0 + 96) = xmmword_247489870;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_247471344()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    v3 = v2[20];
    v4 = (void (*)(uint64_t, uint64_t))v2[21];
    v5 = v2[17];
    (*(void (**)(_QWORD, _QWORD))(v2[15] + 8))(v2[16], v2[14]);
    v4(v3, v5);
  }
  else
  {
    v6 = v2[20];
    v7 = (void (*)(uint64_t, uint64_t))v2[21];
    v8 = v2[17];
    (*(void (**)(_QWORD, _QWORD))(v2[15] + 8))(v2[16], v2[14]);
    v7(v6, v8);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v2 + 7));
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)(v2 + 2));
  }
  return swift_task_switch();
}

uint64_t sub_247471410()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = *(_QWORD **)(v0 + 96);
  *v1 = 0;
  v1[1] = 0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247471460()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2474714C8(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v7 + 232) = a6;
  *(_QWORD *)(v7 + 240) = v6;
  *(_WORD *)(v7 + 54) = a4;
  *(_QWORD *)(v7 + 216) = a3;
  *(_QWORD *)(v7 + 224) = a5;
  *(_QWORD *)(v7 + 200) = a1;
  *(_QWORD *)(v7 + 208) = a2;
  v8 = type metadata accessor for SegmentsSummary();
  *(_QWORD *)(v7 + 248) = v8;
  *(_QWORD *)(v7 + 256) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 264) = swift_task_alloc();
  *(_QWORD *)(v7 + 272) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60C0);
  *(_QWORD *)(v7 + 280) = swift_task_alloc();
  *(_QWORD *)(v7 + 288) = swift_task_alloc();
  *(_QWORD *)(v7 + 296) = type metadata accessor for NewCustomerSegment.Result();
  *(_QWORD *)(v7 + 304) = swift_task_alloc();
  *(_QWORD *)(v7 + 312) = type metadata accessor for SegmentFlagLastSeenResult();
  *(_QWORD *)(v7 + 320) = swift_task_alloc();
  *(_QWORD *)(v7 + 328) = swift_task_alloc();
  *(_QWORD *)(v7 + 336) = swift_task_alloc();
  *(_QWORD *)(v7 + 344) = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A65E0);
  *(_QWORD *)(v7 + 352) = swift_task_alloc();
  *(_QWORD *)(v7 + 360) = swift_task_alloc();
  *(_QWORD *)(v7 + 368) = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E80);
  *(_QWORD *)(v7 + 376) = swift_task_alloc();
  *(_QWORD *)(v7 + 384) = swift_task_alloc();
  v9 = sub_24748828C();
  *(_QWORD *)(v7 + 392) = v9;
  *(_QWORD *)(v7 + 400) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v7 + 408) = swift_task_alloc();
  *(_QWORD *)(v7 + 416) = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  *(_QWORD *)(v7 + 424) = swift_task_alloc();
  *(_QWORD *)(v7 + 432) = swift_task_alloc();
  *(_QWORD *)(v7 + 440) = swift_task_alloc();
  *(_QWORD *)(v7 + 448) = swift_task_alloc();
  *(_QWORD *)(v7 + 456) = swift_task_alloc();
  *(_QWORD *)(v7 + 464) = swift_task_alloc();
  *(_QWORD *)(v7 + 472) = swift_task_alloc();
  *(_QWORD *)(v7 + 480) = swift_task_alloc();
  *(_QWORD *)(v7 + 488) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6258);
  *(_QWORD *)(v7 + 496) = swift_task_alloc();
  *(_QWORD *)(v7 + 504) = swift_task_alloc();
  v10 = sub_2474880AC();
  *(_QWORD *)(v7 + 512) = v10;
  *(_QWORD *)(v7 + 520) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v7 + 528) = swift_task_alloc();
  *(_QWORD *)(v7 + 536) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24747176C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  unint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, _QWORD);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int (*v22)(uint64_t, uint64_t, uint64_t);
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36[2];

  if (qword_254448180 != -1)
    swift_once();
  v1 = v0[25];
  v2 = v0[67];
  v4 = v0[64];
  v3 = v0[65];
  v0[68] = __swift_project_value_buffer(v0[49], (uint64_t)qword_254448188);
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[69] = v5;
  v5(v2, v1, v4);
  v6 = sub_247488274();
  v7 = sub_247488418();
  v8 = os_log_type_enabled(v6, v7);
  v9 = v0[67];
  v10 = v0[64];
  if (v8)
  {
    v33 = v0[65];
    v11 = (uint8_t *)swift_slowAlloc();
    v34 = swift_slowAlloc();
    v36[0] = v34;
    *(_DWORD *)v11 = 136315138;
    sub_247475CC0((unint64_t *)&qword_2576A6090, MEMORY[0x24BDCE988]);
    v12 = sub_2474885B0();
    v0[24] = sub_247473DB8(v12, v13, v36);
    sub_247488478();
    swift_bridgeObjectRelease();
    v14 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v14(v9, v10);
    _os_log_impl(&dword_247463000, v6, v7, "SegmentationTask.perform() calculationDate: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v34, -1, -1);
    MEMORY[0x24957C430](v11, -1, -1);
  }
  else
  {
    v14 = *(void (**)(uint64_t, uint64_t))(v0[65] + 8);
    v14(v9, v10);
  }

  v0[70] = v14;
  v15 = v0[62];
  v16 = v0[26];
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v0[32] + 56);
  v17(v0[63], 1, 1, v0[31]);
  type metadata accessor for SegmentStore();
  sub_247465884(v16, v15);
  v18 = v0[62];
  v19 = v0[63];
  v17(v18, 0, 1, v0[31]);
  sub_247475C7C(v18, v19, &qword_2576A6258);
  v20 = v0[63];
  v21 = v0[31];
  v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0[32] + 48);
  v0[71] = v22;
  if (v22(v20, 1, v21))
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v0[65] + 56))(v0[61], 1, 1, v0[64]);
  else
    sub_24746BD5C(v20 + *(int *)(v21 + 28), v0[61]);
  v23 = sub_247488274();
  v24 = sub_247488418();
  if (os_log_type_enabled(v23, v24))
  {
    v26 = v0[60];
    v25 = v0[61];
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    v36[0] = v28;
    *(_DWORD *)v27 = 136315138;
    swift_beginAccess();
    sub_24746BD5C(v25, v26);
    v29 = sub_247488328();
    v0[22] = sub_247473DB8(v29, v30, v36);
    sub_247488478();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247463000, v23, v24, "SegmentationTask: initial assistantLastActive: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v28, -1, -1);
    MEMORY[0x24957C430](v27, -1, -1);
  }

  v35 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_2576A6888 + dword_2576A6888);
  v31 = (_QWORD *)swift_task_alloc();
  v0[72] = v31;
  *v31 = v0;
  v31[1] = sub_247471CDC;
  return v35(v0[25], v0[27], v0[28]);
}

uint64_t sub_247471CDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 584) = a1;
  *(_QWORD *)(v3 + 592) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_247471D4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int16 v4;
  uint64_t inited;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _DWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  void (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int (*v48)(uint64_t, uint64_t, uint64_t);
  uint64_t v49[2];

  v1 = *(_QWORD *)(v0 + 584);
  v3 = *(_QWORD *)(v0 + 480);
  v2 = *(_QWORD *)(v0 + 488);
  v4 = *(_WORD *)(v0 + 54);
  type metadata accessor for ActivitySegmentCalculator();
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 600) = inited;
  *(_BYTE *)(inited + 16) = v4 & 1;
  *(_BYTE *)(inited + 17) = HIBYTE(v4) & 1;
  swift_beginAccess();
  sub_24746B1E4(v2, v1, v3);
  swift_beginAccess();
  sub_247475C7C(v3, v2, (uint64_t *)&unk_2576A65B0);
  v6 = sub_247488274();
  v7 = sub_247488418();
  if (os_log_type_enabled(v6, v7))
  {
    v9 = *(_QWORD *)(v0 + 480);
    v8 = *(_QWORD *)(v0 + 488);
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v49[0] = v11;
    *(_DWORD *)v10 = 136315138;
    sub_24746BD5C(v8, v9);
    v12 = sub_247488328();
    *(_QWORD *)(v0 + 168) = sub_247473DB8(v12, v13, v49);
    sub_247488478();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247463000, v6, v7, "SegmentationTask: updated assistantLastActive: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v11, -1, -1);
    MEMORY[0x24957C430](v10, -1, -1);
  }

  v14 = *(_QWORD *)(v0 + 592);
  v15 = *(_QWORD *)(v0 + 584);
  v16 = *(_QWORD *)(v0 + 472);
  v17 = *(_QWORD *)(v0 + 200);
  sub_24746BD5C(*(_QWORD *)(v0 + 488), v16);
  sub_24746A648(v17, v16, v15, (char *)v49);
  *(_QWORD *)(v0 + 608) = v14;
  if (v14)
  {
    v18 = *(_QWORD *)(v0 + 488);
    sub_247475F90(*(_QWORD *)(v0 + 472), (uint64_t *)&unk_2576A65B0);
    swift_bridgeObjectRelease();
    swift_release();
    sub_247475F90(v18, (uint64_t *)&unk_2576A65B0);
    sub_247475F90(*(_QWORD *)(v0 + 504), &qword_2576A6258);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v20 = *(_QWORD *)(v0 + 544);
    v22 = *(_QWORD *)(v0 + 400);
    v21 = *(_QWORD *)(v0 + 408);
    v23 = *(_QWORD *)(v0 + 392);
    sub_247475F90(*(_QWORD *)(v0 + 472), (uint64_t *)&unk_2576A65B0);
    v24 = LOBYTE(v49[0]);
    *(_BYTE *)(v0 + 146) = v49[0];
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v21, v20, v23);
    v25 = sub_247488274();
    v26 = sub_247488418();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (_DWORD *)swift_slowAlloc();
      v49[0] = swift_slowAlloc();
      *v27 = 136315138;
      __asm { BR              X9 }
    }
    v29 = *(_QWORD *)(v0 + 400);
    v28 = *(_QWORD *)(v0 + 408);
    v30 = *(_QWORD *)(v0 + 392);

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
    sub_247488070();
    sub_247475CC0((unint64_t *)&qword_2576A6070, MEMORY[0x24BDCE948]);
    if ((sub_247488304() & 1) == 0)
    {
      __break(1u);
      JUMPOUT(0x247472574);
    }
    v48 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 568);
    v43 = *(void (**)(uint64_t, uint64_t))(v0 + 560);
    v31 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 552);
    v32 = *(_QWORD *)(v0 + 512);
    v47 = *(_QWORD *)(v0 + 504);
    v33 = *(_QWORD *)(v0 + 376);
    v34 = *(_QWORD *)(v0 + 360);
    v44 = *(_QWORD *)(v0 + 368);
    v45 = *(_QWORD *)(v0 + 384);
    v35 = *(_QWORD *)(v0 + 344);
    v36 = *(_QWORD *)(v0 + 352);
    v46 = *(_QWORD *)(v0 + 248);
    v37 = *(_QWORD *)(v0 + 200);
    v38 = v34 + *(int *)(v35 + 48);
    v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 520) + 32);
    v39(v34, *(_QWORD *)(v0 + 528), v32);
    v31(v38, v37, v32);
    v40 = v36 + *(int *)(v35 + 48);
    v31(v36, v34, v32);
    v31(v40, v38, v32);
    v39(v33, v36, v32);
    v43(v40, v32);
    v41 = v36 + *(int *)(v35 + 48);
    v39(v36, v34, v32);
    v39(v41, v38, v32);
    v39(v33 + *(int *)(v44 + 36), v41, v32);
    v43(v36, v32);
    sub_24746FC4C(v33, v45);
    if (v48(v47, 1, v46))
      (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 520) + 56))(*(_QWORD *)(v0 + 464), 1, 1, *(_QWORD *)(v0 + 512));
    else
      sub_24746BD5C(*(_QWORD *)(v0 + 504) + *(int *)(*(_QWORD *)(v0 + 248) + 32), *(_QWORD *)(v0 + 464));
    v42 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 616) = v42;
    *v42 = v0;
    v42[1] = sub_247472760;
    return sub_2474802F8(*(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 384), *(_QWORD *)(v0 + 464));
  }
}

uint64_t sub_2474725A0()
{
  uint64_t v0;

  sub_247475F90(*(_QWORD *)(v0 + 488), (uint64_t *)&unk_2576A65B0);
  sub_247475F90(*(_QWORD *)(v0 + 504), &qword_2576A6258);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247472760()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t (__cdecl *v6)();
  uint64_t v7;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 464);
  v7 = *v0;
  swift_task_dealloc();
  sub_247475F90(v2, (uint64_t *)&unk_2576A65B0);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 624) = v3;
  *v3 = v7;
  v3[1] = sub_247472818;
  v3[3] = v1 + 53;
  v6 = (uint64_t (__cdecl *)())((char *)&dword_2576A5F08 + dword_2576A5F08);
  v4 = (_QWORD *)swift_task_alloc();
  v3[4] = v4;
  *v4 = v3;
  v4[1] = sub_247473218;
  return v6();
}

uint64_t sub_247472818()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24747286C()
{
  uint64_t v0;
  unsigned int (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  unsigned int (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t EnablementStatus;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  _QWORD *v17;

  v1 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 568);
  v2 = *(_QWORD *)(v0 + 504);
  v3 = *(_QWORD *)(v0 + 248);
  *(_BYTE *)(v0 + 147) = *(_BYTE *)(v0 + 53);
  if (v1(v2, 1, v3))
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 520) + 56))(*(_QWORD *)(v0 + 456), 1, 1, *(_QWORD *)(v0 + 512));
  else
    sub_24746BD5C(v2 + *(int *)(v3 + 36), *(_QWORD *)(v0 + 456));
  v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 568);
  v5 = *(_QWORD *)(v0 + 504);
  v6 = *(_QWORD *)(v0 + 456);
  v7 = *(_QWORD *)(v0 + 248);
  sub_247478ACC(*(_QWORD *)(v0 + 384), v6, *(char **)(v0 + 328));
  sub_247475F90(v6, (uint64_t *)&unk_2576A65B0);
  if (v4(v5, 1, v7))
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 520) + 56))(*(_QWORD *)(v0 + 448), 1, 1, *(_QWORD *)(v0 + 512));
  else
    sub_24746BD5C(*(_QWORD *)(v0 + 504) + *(int *)(*(_QWORD *)(v0 + 248) + 40), *(_QWORD *)(v0 + 448));
  v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v0 + 568);
  v9 = *(_QWORD *)(v0 + 504);
  v10 = *(void (**)(char *, char *, uint64_t))(v0 + 448);
  v11 = *(_QWORD *)(v0 + 248);
  sub_2474734C4(*(_QWORD *)(v0 + 200), v10, *(_QWORD *)(v0 + 584), *(_BYTE **)(v0 + 320));
  swift_bridgeObjectRelease();
  sub_247475F90((uint64_t)v10, (uint64_t *)&unk_2576A65B0);
  if (v8(v9, 1, v11))
  {
    v12 = *(_QWORD *)(v0 + 288);
    EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(EnablementStatus - 8) + 56))(v12, 1, 1, EnablementStatus);
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 288);
    sub_247475BFC(*(_QWORD *)(v0 + 504) + *(int *)(*(_QWORD *)(v0 + 248) + 44), v14, (uint64_t (*)(_QWORD))type metadata accessor for SiriFirstEnablementStatus);
    v15 = type metadata accessor for SiriFirstEnablementStatus();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 0, 1, v15);
  }
  v16 = *(_WORD *)(v0 + 54);
  v17 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 632) = v17;
  *v17 = v0;
  v17[1] = sub_247472A6C;
  return sub_24746D5E8(*(_QWORD *)(v0 + 304), *(_QWORD *)(v0 + 200), v16 & 1, *(_QWORD *)(v0 + 288));
}

uint64_t sub_247472A6C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 288);
  swift_task_dealloc();
  sub_247475F90(v1, &qword_2576A60C0);
  return swift_task_switch();
}

uint64_t sub_247472AD4()
{
  uint64_t v0;
  char v1;
  _BYTE *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t EnablementStatus;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
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
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48[2];

  v1 = *(_BYTE *)(v0 + 147);
  v37 = *(_BYTE *)(v0 + 146);
  v40 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 552);
  v35 = *(_QWORD *)(v0 + 528);
  v36 = *(_QWORD *)(v0 + 512);
  v38 = *(_QWORD *)(v0 + 480);
  v39 = *(_QWORD *)(v0 + 488);
  v41 = *(_QWORD *)(v0 + 440);
  v42 = *(_QWORD *)(v0 + 432);
  v3 = *(_BYTE **)(v0 + 328);
  v2 = *(_BYTE **)(v0 + 336);
  v5 = *(_QWORD *)(v0 + 312);
  v4 = *(_BYTE **)(v0 + 320);
  v6 = *(_BYTE **)(v0 + 304);
  v44 = *(_QWORD *)(v0 + 296);
  v45 = *(_QWORD *)(v0 + 424);
  v7 = *(_QWORD *)(v0 + 280);
  v46 = *(_QWORD *)(v0 + 272);
  v47 = *(_QWORD *)(v0 + 264);
  v8 = *(_QWORD *)(v0 + 200);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6268);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_247489880;
  *(_BYTE *)(inited + 32) = *v2;
  *(_BYTE *)(inited + 33) = v1;
  *(_BYTE *)(inited + 34) = *v3;
  *(_BYTE *)(inited + 35) = *v4;
  *(_BYTE *)(inited + 36) = *v6;
  v43 = sub_247475AFC(inited);
  swift_setDeallocating();
  LOBYTE(v48[0]) = v37;
  v40(v35, v8, v36);
  sub_24746BD5C(v39, v38);
  sub_24746BD5C((uint64_t)&v2[*(int *)(v5 + 20)], v41);
  sub_24746BD5C((uint64_t)&v3[*(int *)(v5 + 20)], v42);
  sub_24746BD5C((uint64_t)&v4[*(int *)(v5 + 20)], v45);
  sub_247475BFC((uint64_t)&v6[*(int *)(v44 + 20)], v7, (uint64_t (*)(_QWORD))type metadata accessor for SiriFirstEnablementStatus);
  EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(EnablementStatus - 8) + 56))(v7, 0, 1, EnablementStatus);
  sub_247483308(v48, v43, v35, v38, v41, v42, v45, v7, v46);
  sub_247475BFC(v46, v47, (uint64_t (*)(_QWORD))type metadata accessor for SegmentsSummary);
  v11 = sub_247488274();
  v12 = sub_247488418();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = *(_QWORD *)(v0 + 264);
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v48[0] = v15;
    *(_DWORD *)v14 = 136315138;
    SegmentsSummary.description.getter();
    *(_QWORD *)(v0 + 152) = sub_247473DB8(v16, v17, v48);
    sub_247488478();
    swift_bridgeObjectRelease();
    sub_247475C40(v13, (uint64_t (*)(_QWORD))type metadata accessor for SegmentsSummary);
    _os_log_impl(&dword_247463000, v11, v12, "SegmentationTask ended: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v15, -1, -1);
    MEMORY[0x24957C430](v14, -1, -1);
  }
  else
  {
    sub_247475C40(*(_QWORD *)(v0 + 264), (uint64_t (*)(_QWORD))type metadata accessor for SegmentsSummary);
  }

  v18 = *(_QWORD *)(v0 + 608);
  sub_247465D68(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 208));
  if (v18)
  {
    v19 = *(_QWORD *)(v0 + 488);
    v20 = *(_QWORD *)(v0 + 384);
    v22 = *(_QWORD *)(v0 + 328);
    v21 = *(_QWORD *)(v0 + 336);
    v23 = *(_QWORD *)(v0 + 320);
    v24 = *(_QWORD *)(v0 + 304);
    v25 = *(_QWORD *)(v0 + 272);
    swift_release();
    sub_247475C40(v25, (uint64_t (*)(_QWORD))type metadata accessor for SegmentsSummary);
    sub_247475C40(v24, (uint64_t (*)(_QWORD))type metadata accessor for NewCustomerSegment.Result);
    sub_247475C40(v23, (uint64_t (*)(_QWORD))type metadata accessor for SegmentFlagLastSeenResult);
    sub_247475C40(v22, (uint64_t (*)(_QWORD))type metadata accessor for SegmentFlagLastSeenResult);
    sub_247475C40(v21, (uint64_t (*)(_QWORD))type metadata accessor for SegmentFlagLastSeenResult);
    sub_247475F90(v20, &qword_2576A5E80);
    sub_247475F90(v19, (uint64_t *)&unk_2576A65B0);
    sub_247475F90(*(_QWORD *)(v0 + 504), &qword_2576A6258);
  }
  else
  {
    v26 = *(_QWORD *)(v0 + 504);
    v27 = *(_QWORD *)(v0 + 488);
    v28 = *(_QWORD *)(v0 + 384);
    v29 = *(_QWORD *)(v0 + 328);
    v30 = *(_QWORD *)(v0 + 336);
    v31 = *(_QWORD *)(v0 + 320);
    v32 = *(_QWORD *)(v0 + 304);
    v33 = *(_QWORD *)(v0 + 272);
    swift_release();
    sub_247475C40(v33, (uint64_t (*)(_QWORD))type metadata accessor for SegmentsSummary);
    sub_247475C40(v32, (uint64_t (*)(_QWORD))type metadata accessor for NewCustomerSegment.Result);
    sub_247475C40(v31, (uint64_t (*)(_QWORD))type metadata accessor for SegmentFlagLastSeenResult);
    sub_247475C40(v29, (uint64_t (*)(_QWORD))type metadata accessor for SegmentFlagLastSeenResult);
    sub_247475C40(v30, (uint64_t (*)(_QWORD))type metadata accessor for SegmentFlagLastSeenResult);
    sub_247475F90(v28, &qword_2576A5E80);
    sub_247475F90(v27, (uint64_t *)&unk_2576A65B0);
    sub_247475F90(v26, &qword_2576A6258);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2474731BC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 24) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_2576A5F08 + dword_2576A5F08);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 32) = v2;
  *v2 = v1;
  v2[1] = sub_247473218;
  return v4();
}

uint64_t sub_247473218(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 48) = a1;
  return swift_task_switch();
}

uint64_t sub_24747328C()
{
  uint64_t v0;
  void *v1;
  id v2;
  char v3;

  v1 = *(void **)(v0 + 48);
  v2 = objc_msgSend(v1, sel_statusType);

  if ((((unint64_t)v2 - 1) & 0xFFFFFFFFFFFFFFFDLL) != 0)
    v3 = 7;
  else
    v3 = 3;
  **(_BYTE **)(v0 + 24) = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2474732EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  BOOL v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  uint64_t v9;

  if (qword_254448180 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 40);
  v2 = sub_24748828C();
  __swift_project_value_buffer(v2, (uint64_t)qword_254448188);
  MEMORY[0x24957C2F8](v1);
  MEMORY[0x24957C2F8](v1);
  v3 = sub_247488274();
  v4 = sub_247488424();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(void **)(v0 + 40);
  if (v5)
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    MEMORY[0x24957C2F8](v6);
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v9;
    sub_247488478();
    *v8 = v9;

    _os_log_impl(&dword_247463000, v3, v4, "Unable to calculate music segment: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60D0);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v8, -1, -1);
    MEMORY[0x24957C430](v7, -1, -1);

  }
  else
  {

  }
  **(_BYTE **)(v0 + 24) = 7;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2474734C4@<X0>(uint64_t a1@<X0>, void (*a2)(char *, char *, uint64_t)@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_24747F2B0(a1, a2, a3, a4);
}

uint64_t sub_2474736C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  void (*v21)(char *, uint64_t);
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t *v27;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;

  v33 = a1;
  v32 = a2;
  v2 = sub_2474880AC();
  v3 = *(_QWORD *)(v2 - 8);
  v34 = v2;
  v35 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v31 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24748813C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v30 - v13;
  v15 = sub_2474880C4();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_247488148();
  v36 = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v18, *MEMORY[0x24BDCEF70], v15);
  sub_2474880D0();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDCF220], v5);
  sub_24748810C();
  v21 = *(void (**)(char *, uint64_t))(v6 + 8);
  v22 = v8;
  v24 = v34;
  v23 = v35;
  v21(v22, v5);
  sub_24746BD5C((uint64_t)v14, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v12, 1, v24) == 1)
  {
    sub_247475F90((uint64_t)v12, (uint64_t *)&unk_2576A65B0);
    v37 = 0;
    v38 = 0xE000000000000000;
    sub_2474884C0();
    swift_bridgeObjectRelease();
    v37 = 0xD000000000000026;
    v38 = 0x800000024748A950;
    sub_247475CC0((unint64_t *)&qword_2576A6090, MEMORY[0x24BDCE988]);
    sub_2474885B0();
    sub_247488340();
    swift_bridgeObjectRelease();
    v25 = v37;
    v26 = v38;
    sub_247475D44();
    swift_allocError();
    *v27 = v25;
    v27[1] = v26;
    swift_willThrow();
  }
  else
  {
    v29 = v31;
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v31, v12, v24);
    sub_2474880E8();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v29, v24);
  }
  sub_247475F90((uint64_t)v14, (uint64_t *)&unk_2576A65B0);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v20, v39);
}

uint64_t SegmentationTask.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SegmentationTask.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t SegmentationTaskResult.description.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  if (!v1)
    return 0x73736563637573;
  if (v1 == 1)
    return 0x64657070696B73;
  sub_247488340();
  return 0x3A6572756C696166;
}

uint64_t sub_247473AF8(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_247473B08(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_247473B3C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_247473BA0;
  return v6(a1);
}

uint64_t sub_247473BA0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_247473BEC(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_247473C0C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_247473C2C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_247473C4C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_247473DB8(v6, v7, a3);
  v8 = *a1 + 8;
  sub_247488478();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_247473CBC()
{
  return swift_deallocObject();
}

uint64_t sub_247473CCC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_247473D48;
  v3[5] = a1;
  v4 = (_QWORD *)swift_task_alloc();
  v3[6] = v4;
  *v4 = v3;
  v4[1] = sub_247470F68;
  return static SegmentationTask.performAsync()(a1);
}

uint64_t sub_247473D48()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_247473D90(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 2)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_247473DA4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 2)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_247473DB8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_247473E88(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_247475DEC((uint64_t)v12, *a3);
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
      sub_247475DEC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_247473E88(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_247488484();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_247474040(a5, a6);
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
  v8 = sub_247488508();
  if (!v8)
  {
    sub_247488520();
    __break(1u);
LABEL_17:
    result = sub_247488538();
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

uint64_t sub_247474040(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2474740D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2474742AC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2474742AC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2474740D4(uint64_t a1, unint64_t a2)
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
      v3 = sub_247474248(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2474884CC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_247488520();
      __break(1u);
LABEL_10:
      v2 = sub_24748834C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_247488538();
    __break(1u);
LABEL_14:
    result = sub_247488520();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_247474248(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6290);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2474742AC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6290);
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
  result = sub_247488538();
  __break(1u);
  return result;
}

_BYTE **sub_2474743F8(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_247474408(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_247488478();
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

unint64_t sub_2474744B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_247488604();
  sub_247488334();
  v4 = sub_24748861C();
  return sub_24747451C(a1, a2, v4);
}

unint64_t sub_24747451C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2474885BC() & 1) == 0)
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
      while (!v14 && (sub_2474885BC() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2474745FC(char *a1, char a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  uint64_t *v10;
  uint64_t v12;

  v4 = *v2;
  v5 = *(_QWORD *)(v4 + 40);
  swift_bridgeObjectRetain();
  sub_24747A8BC(v5, a2);
  v7 = v6 & ~(-1 << *(_BYTE *)(v4 + 32));
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
    __asm { BR              X9 }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = *v10;
  *v10 = 0x8000000000000000;
  sub_247474D1C(a2, v7, isUniquelyReferenced_nonNull_native);
  *v10 = v12;
  swift_bridgeObjectRelease();
  result = 1;
  *a1 = a2;
  return result;
}

uint64_t sub_247474948()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  _QWORD *v15;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6278);
  v3 = sub_2474884A8();
  if (!*(_QWORD *)(v2 + 16))
    goto LABEL_25;
  v4 = 1 << *(_BYTE *)(v2 + 32);
  v15 = (_QWORD *)(v2 + 56);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v2 + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  swift_retain();
  if (v6)
  {
    v8 = __clz(__rbit64(v6));
    goto LABEL_20;
  }
  if (v7 > 1)
  {
    v9 = *(_QWORD *)(v2 + 64);
    v10 = 1;
    if (v9)
      goto LABEL_19;
    v10 = 2;
    if (v7 > 2)
    {
      v9 = *(_QWORD *)(v2 + 72);
      if (v9)
        goto LABEL_19;
      v10 = 3;
      if (v7 > 3)
      {
        v9 = *(_QWORD *)(v2 + 80);
        if (!v9)
        {
          v11 = 4;
          if (v7 > 4)
          {
            v9 = *(_QWORD *)(v2 + 88);
            if (v9)
            {
              v10 = 4;
              goto LABEL_19;
            }
            while (1)
            {
              v10 = v11 + 1;
              if (__OFADD__(v11, 1))
              {
                __break(1u);
                JUMPOUT(0x247474D00);
              }
              if (v10 >= v7)
                break;
              v9 = v15[v10];
              ++v11;
              if (v9)
                goto LABEL_19;
            }
          }
          goto LABEL_21;
        }
LABEL_19:
        v8 = __clz(__rbit64(v9)) + (v10 << 6);
LABEL_20:
        v12 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + v8);
        sub_247488604();
        __asm { BR              X8 }
      }
    }
  }
LABEL_21:
  swift_release();
  v1 = v0;
  v13 = 1 << *(_BYTE *)(v2 + 32);
  if (v13 > 63)
    bzero(v15, ((unint64_t)(v13 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v15 = -1 << v13;
  *(_QWORD *)(v2 + 16) = 0;
LABEL_25:
  result = swift_release();
  *v1 = v3;
  return result;
}

void sub_247474D1C(char a1, unint64_t a2, char a3)
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
  if (v7 <= v6 || (a3 & 1) == 0)
  {
    if ((a3 & 1) != 0)
    {
      sub_247474948();
    }
    else
    {
      if (v7 > v6)
      {
        sub_24747509C();
        goto LABEL_10;
      }
      sub_24747522C();
    }
    v8 = *v3;
    sub_24747A8BC(*(_QWORD *)(*v3 + 40), a1);
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
    JUMPOUT(0x247475048);
  }
  *(_QWORD *)(v10 + 16) = v13;
}

void *sub_24747509C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6278);
  v2 = *v0;
  v3 = sub_24748849C();
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
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
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

uint64_t sub_24747522C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6278);
  v3 = sub_2474884A8();
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
    goto LABEL_23;
  }
  v4 = 1 << *(_BYTE *)(v2 + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v4 + 63) >> 6;
  swift_retain();
  if (v6)
  {
    v7 = __clz(__rbit64(v6));
    goto LABEL_20;
  }
  if (v13 > 1)
  {
    v8 = *(_QWORD *)(v2 + 64);
    v9 = 1;
    if (v8)
      goto LABEL_19;
    v9 = 2;
    if (v13 > 2)
    {
      v8 = *(_QWORD *)(v2 + 72);
      if (v8)
        goto LABEL_19;
      v9 = 3;
      if (v13 > 3)
      {
        v8 = *(_QWORD *)(v2 + 80);
        if (!v8)
        {
          v10 = 4;
          if (v13 > 4)
          {
            v8 = *(_QWORD *)(v2 + 88);
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
                JUMPOUT(0x2474755ACLL);
              }
              if (v9 >= v13)
                break;
              v8 = *(_QWORD *)(v2 + 56 + 8 * v9);
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
        v11 = *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + v7);
        sub_247488604();
        __asm { BR              X8 }
      }
    }
  }
LABEL_21:
  result = swift_release_n();
  v1 = v0;
LABEL_23:
  *v1 = v3;
  return result;
}

uint64_t _s16SiriUserSegments16SegmentationTaskC9isEnabledSbyFZ_0()
{
  uint64_t v0;
  _QWORD *v1;
  unint64_t v2;
  char v3;
  int v4;
  char v5;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[24];
  ValueMetadata *v10;
  unint64_t v11;

  v10 = &type metadata for SiriUserSegmentsFeatureFlag;
  v11 = sub_247475D88();
  if (qword_2576A5C38 != -1)
    swift_once();
  swift_beginAccess();
  if (*((_QWORD *)off_2576A5F10 + 2))
  {
    v7 = sub_2474884D8();
    v8 = v0;
    sub_247488340();
    sub_2474884D8();
    sub_247488340();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v1 = off_2576A5F10;
    if (*((_QWORD *)off_2576A5F10 + 2))
    {
      v2 = sub_2474744B8(v7, v8);
      if ((v3 & 1) != 0)
      {
        v4 = *(unsigned __int8 *)(v1[7] + v2);
        if (v4 != 2)
        {
          v5 = v4 & 1;
          swift_endAccess();
          swift_bridgeObjectRelease();
          goto LABEL_9;
        }
      }
    }
    swift_endAccess();
    swift_bridgeObjectRelease();
  }
  v5 = sub_247488178();
LABEL_9:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
  return v5 & 1;
}

uint64_t _s16SiriUserSegments22SegmentationTaskResultO2eeoiySbAC_ACtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  if (!v3)
  {
    if (!v5)
    {
      v3 = 0;
      v6 = 1;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  if (v3 != 1)
  {
    if (v5 >= 2)
    {
      if (v2 == v4 && v3 == v5)
        v6 = 1;
      else
        v6 = sub_2474885BC();
      goto LABEL_9;
    }
LABEL_8:
    v6 = 0;
LABEL_9:
    sub_247473D90(v4, v5);
    sub_247473D90(v2, v3);
    goto LABEL_10;
  }
  if (v5 != 1)
    goto LABEL_8;
  v3 = 1;
  v6 = 1;
LABEL_10:
  sub_247473DA4(v2, v3);
  sub_247473DA4(v4, v5);
  return v6 & 1;
}

uint64_t type metadata accessor for SegmentationTask()
{
  return objc_opt_self();
}

uint64_t method lookup function for SegmentationTask()
{
  return swift_lookUpClassMethod();
}

unint64_t destroy for SegmentationTaskResult(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s16SiriUserSegments22SegmentationTaskResultOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
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

_QWORD *assignWithCopy for SegmentationTaskResult(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for SegmentationTaskResult(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SegmentationTaskResult(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SegmentationTaskResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

uint64_t sub_247475A40(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_247475A5C(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for SegmentationTaskResult()
{
  return &type metadata for SegmentationTaskResult;
}

uint64_t sub_247475A8C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  char *v4;
  char v5;
  char v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  sub_247475D00();
  result = sub_24748840C();
  v7 = result;
  if (v2)
  {
    v4 = (char *)(a1 + 32);
    do
    {
      v5 = *v4++;
      sub_2474745FC(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_247475AFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    swift_bridgeObjectRetain();
    v3 = 0;
    v4 = (char *)MEMORY[0x24BEE4AF8];
    do
    {
      v5 = *(unsigned __int8 *)(a1 + v3 + 32);
      if (v5 != 7)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v4 = sub_2474769C4(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
        v7 = *((_QWORD *)v4 + 2);
        v6 = *((_QWORD *)v4 + 3);
        if (v7 >= v6 >> 1)
          v4 = sub_2474769C4((char *)(v6 > 1), v7 + 1, 1, v4);
        *((_QWORD *)v4 + 2) = v7 + 1;
        v4[v7 + 32] = v5;
      }
      ++v3;
    }
    while (v1 != v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = (char *)MEMORY[0x24BEE4AF8];
  }
  v8 = sub_247475A8C((uint64_t)v4);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_247475BFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247475C40(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247475C7C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_247475CC0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2474880AC();
    result = MEMORY[0x24957C370](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247475D00()
{
  unint64_t result;

  result = qword_2576A6270;
  if (!qword_2576A6270)
  {
    result = MEMORY[0x24957C370](&protocol conformance descriptor for SegmentFlags, &type metadata for SegmentFlags);
    atomic_store(result, (unint64_t *)&qword_2576A6270);
  }
  return result;
}

unint64_t sub_247475D44()
{
  unint64_t result;

  result = qword_2576A6280;
  if (!qword_2576A6280)
  {
    result = MEMORY[0x24957C370](&unk_247489998, &type metadata for SegmentationTaskError);
    atomic_store(result, (unint64_t *)&qword_2576A6280);
  }
  return result;
}

unint64_t sub_247475D88()
{
  unint64_t result;

  result = qword_2576A6288;
  if (!qword_2576A6288)
  {
    result = MEMORY[0x24957C370](&protocol conformance descriptor for SiriUserSegmentsFeatureFlag, &type metadata for SiriUserSegmentsFeatureFlag);
    atomic_store(result, (unint64_t *)&qword_2576A6288);
  }
  return result;
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

uint64_t sub_247475DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_247475E2C(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *a1;
  v2 = a1[1];
  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)(v1 + 16) = *a1;
  *(_QWORD *)(v1 + 24) = v2;
  sub_2474760A8(v3, v2);
  return sub_2474760B8(v4, v5);
}

uint64_t sub_247475E68()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_247475EA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v4 = *(int **)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 64);
  v6 = swift_task_alloc();
  v7 = *(_OWORD *)(v1 + 48);
  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)v6 = v2;
  *(_QWORD *)(v6 + 8) = sub_247476200;
  *(_QWORD *)(v6 + 40) = v5;
  *(_OWORD *)(v6 + 24) = v7;
  *(_QWORD *)(v6 + 16) = a1;
  v10 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 48) = v8;
  *v8 = v6;
  v8[1] = sub_24747096C;
  return v10(a1);
}

unint64_t sub_247475F4C()
{
  unint64_t result;

  result = qword_2576A62B8;
  if (!qword_2576A62B8)
  {
    result = MEMORY[0x24957C370](&unk_24748A054, &type metadata for ConcurrencyError);
    atomic_store(result, (unint64_t *)&qword_2576A62B8);
  }
  return result;
}

uint64_t sub_247475F90(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247475FCC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_247475FF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_247476060;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2576A62C0 + dword_2576A62C0))(a1, v4);
}

uint64_t sub_247476060()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2474760A8(uint64_t a1, unint64_t a2)
{
  if (a2 != 2)
    return sub_247473D90(a1, a2);
  return a1;
}

uint64_t sub_2474760B8(uint64_t a1, unint64_t a2)
{
  if (a2 != 2)
    return sub_247473DA4(a1, a2);
  return a1;
}

_QWORD *initializeBufferWithCopyOfBuffer for SegmentationTaskError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SegmentationTaskError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for SegmentationTaskError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for SegmentationTaskError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SegmentationTaskError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SegmentationTaskError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SegmentationTaskError()
{
  return &type metadata for SegmentationTaskError;
}

uint64_t sub_247476208(unint64_t a1, SEL *a2)
{
  uint64_t v4;
  uint64_t i;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v11;

  v11 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_15;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_24748852C())
  {
    for (i = 4; ; ++i)
    {
      v6 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24957BECC](i - 4, a1) : *(id *)(a1 + 8 * i);
      v7 = v6;
      v8 = i - 3;
      if (__OFADD__(i - 4, 1))
        break;
      v9 = objc_msgSend(v6, *a2);

      if (v9)
      {
        MEMORY[0x24957BD58]();
        if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_247488394();
        sub_2474883A0();
        sub_247488388();
      }
      if (v8 == v4)
      {
        swift_bridgeObjectRelease();
        return v11;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_247476384()
{
  uint64_t v0;
  uint64_t result;

  result = v0;
  *(_DWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 16) = 0;
  return result;
}

uint64_t sub_247476394(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return v2 & 1;
  if (*(_BYTE *)(a2 + 32) == (result & 1))
    return 1;
  if (v2 == 1)
    return 0;
  v3 = 33;
  while (1)
  {
    v4 = v3 - 31;
    if (__OFADD__(v3 - 32, 1))
      break;
    v5 = *(_BYTE *)(a2 + v3) ^ result;
    if ((v5 & 1) != 0)
    {
      ++v3;
      if (v4 != v2)
        continue;
    }
    LOBYTE(v2) = v5 ^ 1;
    return v2 & 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_247476404(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_DWORD *)(a2 + 32) == (_DWORD)result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 9; ; ++i)
  {
    v4 = i - 7;
    if (__OFADD__(i - 8, 1))
      break;
    v6 = *(_DWORD *)(a2 + 4 * i) == (_DWORD)result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_247476468(unint64_t *a1)
{
  _BYTE *v1;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  int v12;
  int v13;
  char v14;
  uint64_t result;

  v3 = a1[1];
  v1[22] = sub_247476DA4(v3);
  v4 = sub_247476208(v3, (SEL *)&selRef_punchOut);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_24748852C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  v1[26] = v5 != 0;
  v6 = a1[2];
  v1[23] = sub_24747776C(v6, (SEL *)&selRef_ended) & 1;
  v1[24] = sub_247476FE8(v3) & 1;
  v1[21] = sub_2474772F8(v3) & 1;
  v7 = sub_24747759C(v6);
  v8 = sub_247476208(v6, (SEL *)&selRef_requestMitigated);
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = sub_24748852C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  v1[27] = v7 & 1 | (v9 != 0);
  v10 = *a1;
  v1[20] = sub_24747776C(*a1, (SEL *)&selRef_cancelled) & 1;
  v11 = sub_24747794C(v3);
  v1[25] = v11 & 1;
  v12 = v1[21];
  v13 = v1[27];
  if ((v1[22] & 1) != 0 || (v1[26] & 1) != 0 || v1[23])
  {
    if ((v12 | v13) != 1)
      goto LABEL_9;
LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  if (v12 & 1 | ((v1[24] & 1) == 0) | v13 & 1)
    goto LABEL_11;
LABEL_9:
  v14 = (v1[20] | v11) ^ 1;
LABEL_12:
  v1[16] = v14 & 1;
  v1[17] = sub_247477BB0(v3) & 1;
  result = sub_247477E1C(v10, v3);
  v1[18] = result & 1;
  v1[19] = result & 1 & v1[17];
  return result;
}

uint64_t sub_247476680()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ValidTurnFeatureExtractor()
{
  return objc_opt_self();
}

_QWORD *sub_2474766B0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6580);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size_0(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_247476CBC(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2474767BC(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A6590);
  v10 = *(_QWORD *)(type metadata accessor for SiriUsageMetrics() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size_0(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_247488520();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for SiriUsageMetrics() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_247478360(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

char *sub_2474769C4(char *result, int64_t a2, char a3, char *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6588);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size_0(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_247478478(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_247476ABC(char *result, int64_t a2, char a3, char *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6568);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size_0(v10);
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * v11 - 64;
      v12 = v10 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32])
          memmove(v12, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v12 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_247476F04(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_247476BB4(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    v8 = a2;
    goto LABEL_8;
  }
  v7 = *((_QWORD *)a4 + 3);
  v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2)
    goto LABEL_8;
  if (v8 + 0x4000000000000000 >= 0)
  {
    v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v8 = a2;
LABEL_8:
    v9 = *((_QWORD *)a4 + 2);
    if (v8 <= v9)
      v10 = *((_QWORD *)a4 + 2);
    else
      v10 = v8;
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      v11 = (char *)swift_allocObject();
      v12 = _swift_stdlib_malloc_size_0(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 29;
      *((_QWORD *)v11 + 2) = v9;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 2);
      v14 = v11 + 32;
      if ((v6 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)MEMORY[0x24BEE4AF8];
      v14 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[4 * v9 + 32])
          memmove(v14, a4 + 32, 4 * v9);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_2474774B4(0, v9, v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_247476CBC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_247488538();
  __break(1u);
  return result;
}

BOOL sub_247476DA4(unint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_247476208(a1, (SEL *)&selRef_uufrSaid);
  v3 = sub_247476208(a1, (SEL *)&selRef_uufrShown);
  v4 = sub_247476208(a1, (SEL *)&selRef_uufrPresented);
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_24748852C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v5)
  {
    swift_bridgeObjectRelease();
LABEL_8:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_24748852C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v6)
    goto LABEL_8;
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_24748852C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v8 != 0;
}

char *sub_247476F04(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
      return v6;
    }
  }
  result = (char *)sub_247488538();
  __break(1u);
  return result;
}

uint64_t sub_247476FE8(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  unsigned __int8 v11;
  unint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  char *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  unsigned int v21;
  unint64_t v22;
  unint64_t v23;
  int v24;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_24748852C();
    v2 = result;
    if (result)
      goto LABEL_3;
LABEL_18:
    v5 = (char *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v2)
    goto LABEL_18;
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    goto LABEL_37;
  }
  v4 = 0;
  v5 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
      v6 = (id)MEMORY[0x24957BECC](v4, a1);
    else
      v6 = *(id *)(a1 + 8 * v4 + 32);
    v7 = v6;
    v8 = objc_msgSend(v6, sel_invocation);
    if (v8
      && (v9 = v8,
          v10 = objc_msgSend(v8, sel_keyboardInvocationContext),
          v9,
          v10))
    {
      v11 = objc_msgSend(v10, sel_keyboardPresented);

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v5 = sub_247476ABC(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
      v13 = *((_QWORD *)v5 + 2);
      v12 = *((_QWORD *)v5 + 3);
      if (v13 >= v12 >> 1)
        v5 = sub_247476ABC((char *)(v12 > 1), v13 + 1, 1, v5);
      *((_QWORD *)v5 + 2) = v13 + 1;
      v5[v13 + 32] = v11;
    }
    else
    {

    }
    ++v4;
  }
  while (v2 != v4);
LABEL_19:
  swift_bridgeObjectRelease();
  v14 = sub_247476394(1, (uint64_t)v5);
  result = swift_bridgeObjectRelease();
  if (!v2)
  {
    v16 = (char *)MEMORY[0x24BEE4AF8];
LABEL_35:
    v24 = sub_247476404(11, (uint64_t)v16);
    swift_bridgeObjectRelease();
    return v14 & v24 & 1;
  }
  if (v2 >= 1)
  {
    swift_bridgeObjectRetain();
    v15 = 0;
    v16 = (char *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v17 = (id)MEMORY[0x24957BECC](v15, a1);
      else
        v17 = *(id *)(a1 + 8 * v15 + 32);
      v18 = v17;
      v19 = objc_msgSend(v17, sel_invocation);
      if (v19)
      {
        v20 = v19;
        v21 = objc_msgSend(v19, sel_invocationSource);

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v16 = sub_247476BB4(0, *((_QWORD *)v16 + 2) + 1, 1, v16, &qword_2576A6578);
        v23 = *((_QWORD *)v16 + 2);
        v22 = *((_QWORD *)v16 + 3);
        if (v23 >= v22 >> 1)
          v16 = sub_247476BB4((char *)(v22 > 1), v23 + 1, 1, v16, &qword_2576A6578);
        *((_QWORD *)v16 + 2) = v23 + 1;
        *(_DWORD *)&v16[4 * v23 + 32] = v21;
      }
      else
      {

      }
      ++v15;
    }
    while (v2 != v15);
    swift_bridgeObjectRelease();
    goto LABEL_35;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2474772F8(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  unsigned int v10;
  unint64_t v11;
  unint64_t v12;
  char v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_24748852C();
    v2 = result;
    if (result)
      goto LABEL_3;
LABEL_17:
    v5 = (char *)MEMORY[0x24BEE4AF8];
    goto LABEL_18;
  }
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v2)
    goto LABEL_17;
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  v4 = 0;
  v5 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
      v6 = (id)MEMORY[0x24957BECC](v4, a1);
    else
      v6 = *(id *)(a1 + 8 * v4 + 32);
    v7 = v6;
    v8 = objc_msgSend(v6, sel_ueiRequestCategorization);
    if (v8)
    {
      v9 = v8;
      v10 = objc_msgSend(v8, sel_requestStatus);

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v5 = sub_247476BB4(0, *((_QWORD *)v5 + 2) + 1, 1, v5, &qword_2576A6558);
      v12 = *((_QWORD *)v5 + 2);
      v11 = *((_QWORD *)v5 + 3);
      if (v12 >= v11 >> 1)
        v5 = sub_247476BB4((char *)(v11 > 1), v12 + 1, 1, v5, &qword_2576A6558);
      *((_QWORD *)v5 + 2) = v12 + 1;
      *(_DWORD *)&v5[4 * v12 + 32] = v10;
    }
    else
    {

    }
    ++v4;
  }
  while (v2 != v4);
LABEL_18:
  swift_bridgeObjectRelease();
  if (*((_QWORD *)v5 + 2))
    v13 = sub_247476404(2, (uint64_t)v5);
  else
    v13 = 1;
  swift_bridgeObjectRelease();
  return v13 & 1;
}

char *sub_2474774B4(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  result = (char *)sub_247488538();
  __break(1u);
  return result;
}

uint64_t sub_24747759C(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  char v14;

  if (!(a1 >> 62))
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_18:
    v5 = (char *)MEMORY[0x24BEE4AF8];
LABEL_19:
    swift_bridgeObjectRelease();
    v14 = sub_247476404(1, (uint64_t)v5);
    swift_bridgeObjectRelease();
    return v14 & 1;
  }
  swift_bridgeObjectRetain();
  result = sub_24748852C();
  v2 = result;
  if (!result)
    goto LABEL_18;
LABEL_3:
  if (v2 >= 1)
  {
    v4 = 0;
    v5 = (char *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x24957BECC](v4, a1);
      else
        v6 = *(id *)(a1 + 8 * v4 + 32);
      v7 = v6;
      v8 = objc_msgSend(v6, sel_requestContext);
      if (v8
        && (v9 = v8, v10 = objc_msgSend(v8, sel_cancelled), v9, v10))
      {
        v11 = objc_msgSend(v10, sel_reason);

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = sub_247476BB4(0, *((_QWORD *)v5 + 2) + 1, 1, v5, &qword_2576A6570);
        v13 = *((_QWORD *)v5 + 2);
        v12 = *((_QWORD *)v5 + 3);
        if (v13 >= v12 >> 1)
          v5 = sub_247476BB4((char *)(v12 > 1), v13 + 1, 1, v5, &qword_2576A6570);
        *((_QWORD *)v5 + 2) = v13 + 1;
        *(_DWORD *)&v5[4 * v13 + 32] = v11;
      }
      else
      {

      }
      ++v4;
    }
    while (v2 != v4);
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_24747776C(unint64_t a1, SEL *a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t i;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v14 = MEMORY[0x24BEE4AF8];
  if (!(a1 >> 62))
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v4)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    v12 = MEMORY[0x24BEE4AF8];
    if (!(MEMORY[0x24BEE4AF8] >> 62))
    {
LABEL_16:
      v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
      swift_bridgeObjectRelease();
      return v13 != 0;
    }
LABEL_20:
    swift_bridgeObjectRetain();
    v13 = sub_24748852C();
    swift_bridgeObjectRelease();
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  result = sub_24748852C();
  v4 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x24957BECC](i, a1);
      else
        v7 = *(id *)(a1 + 8 * i + 32);
      v8 = v7;
      v9 = objc_msgSend(v7, sel_requestContext);
      if (v9)
      {
        v10 = v9;
        v11 = objc_msgSend(v9, *a2);

        if (v11)
        {
          MEMORY[0x24957BD58]();
          if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_247488394();
          sub_2474883A0();
          sub_247488388();
        }
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
    v12 = v14;
    if (!(v14 >> 62))
      goto LABEL_16;
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_24747794C(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_24748852C();
    v2 = result;
    if (result)
      goto LABEL_3;
LABEL_19:
    result = swift_bridgeObjectRelease();
    v5 = (char *)MEMORY[0x24BEE4AF8];
    v14 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (!v14)
      goto LABEL_23;
    goto LABEL_20;
  }
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v2)
    goto LABEL_19;
LABEL_3:
  if (v2 < 1)
    goto LABEL_31;
  v4 = 0;
  v5 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
      v6 = (id)MEMORY[0x24957BECC](v4, a1);
    else
      v6 = *(id *)(a1 + 8 * v4 + 32);
    v7 = v6;
    v8 = objc_msgSend(v6, sel_invocation, v18, v19, v20, v21);
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, sel_invocationSource);

      v20 = sub_247488460();
      v21 = v10;
      v18 = 0x434E554F4E4E415FLL;
      v19 = 0xE900000000000045;
      sub_24747831C();
      v11 = sub_247488490();

      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v5 = sub_247476ABC(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
      v13 = *((_QWORD *)v5 + 2);
      v12 = *((_QWORD *)v5 + 3);
      if (v13 >= v12 >> 1)
        v5 = sub_247476ABC((char *)(v12 > 1), v13 + 1, 1, v5);
      *((_QWORD *)v5 + 2) = v13 + 1;
      v5[v13 + 32] = v11 & 1;
    }
    else
    {

    }
    ++v4;
  }
  while (v2 != v4);
  result = swift_bridgeObjectRelease();
  v14 = *((_QWORD *)v5 + 2);
  if (!v14)
    goto LABEL_23;
LABEL_20:
  if (v5[32] == 1)
  {
    v15 = 1;
LABEL_24:
    swift_bridgeObjectRelease();
    return v15;
  }
  if (v14 == 1)
  {
LABEL_23:
    v15 = 0;
    goto LABEL_24;
  }
  v16 = 33;
  while (1)
  {
    v17 = v16 - 31;
    if (__OFADD__(v16 - 32, 1))
      break;
    v15 = v5[v16];
    if ((v15 & 1) == 0)
    {
      ++v16;
      if (v17 != v14)
        continue;
    }
    goto LABEL_24;
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t sub_247477BB0(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_24748852C();
    v2 = result;
    if (result)
      goto LABEL_3;
LABEL_18:
    swift_bridgeObjectRelease();
    v5 = (char *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v2)
    goto LABEL_18;
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  v4 = 0;
  v5 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
      v6 = (id)MEMORY[0x24957BECC](v4, a1);
    else
      v6 = *(id *)(a1 + 8 * v4 + 32);
    v7 = v6;
    v8 = objc_msgSend(v6, sel_invocation);
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, sel_invocationSource);

      sub_247488460();
      sub_24747831C();
      v10 = sub_247488490();

      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v5 = sub_247476ABC(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
      v12 = *((_QWORD *)v5 + 2);
      v11 = *((_QWORD *)v5 + 3);
      if (v12 >= v11 >> 1)
        v5 = sub_247476ABC((char *)(v11 > 1), v12 + 1, 1, v5);
      *((_QWORD *)v5 + 2) = v12 + 1;
      v5[v12 + 32] = v10 & 1;
    }
    else
    {

    }
    ++v4;
  }
  while (v2 != v4);
  swift_bridgeObjectRelease();
LABEL_19:
  v13 = sub_247476394(1, (uint64_t)v5);
  swift_bridgeObjectRelease();
  v14 = sub_247476208(a1, (SEL *)&selRef_dictationContext);
  if (v14 >> 62)
    v15 = sub_24748852C();
  else
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  return v13 & 1 | (v15 != 0);
}

uint64_t sub_247477E1C(unint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  unsigned int v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  unsigned int v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  unint64_t v36;
  uint64_t v37;
  BOOL v38;
  char v39;
  unint64_t v40;

  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_24748852C();
    v4 = result;
  }
  else
  {
    v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v40 = a1;
  v6 = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    if (v4 < 1)
    {
      __break(1u);
      goto LABEL_60;
    }
    v7 = 0;
    v8 = (char *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((a2 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x24957BECC](v7, a2);
      else
        v9 = *(id *)(a2 + 8 * v7 + 32);
      v10 = v9;
      v11 = objc_msgSend(v9, sel_ueiRequestCategorization);
      if (v11)
      {
        v12 = v11;
        v13 = objc_msgSend(v11, sel_requestStatus);

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v8 = sub_247476BB4(0, *((_QWORD *)v8 + 2) + 1, 1, v8, &qword_2576A6558);
        v15 = *((_QWORD *)v8 + 2);
        v14 = *((_QWORD *)v8 + 3);
        if (v15 >= v14 >> 1)
          v8 = sub_247476BB4((char *)(v14 > 1), v15 + 1, 1, v8, &qword_2576A6558);
        *((_QWORD *)v8 + 2) = v15 + 1;
        *(_DWORD *)&v8[4 * v15 + 32] = v13;
      }
      else
      {

      }
      ++v7;
    }
    while (v4 != v7);
  }
  else
  {
    v8 = (char *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v39 = sub_247476404(3, (uint64_t)v8);
  swift_bridgeObjectRelease();
  v16 = v40;
  if (v40 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_24748852C();
    v17 = result;
    if (result)
    {
LABEL_20:
      if (v17 >= 1)
      {
        for (i = 0; i != v17; ++i)
        {
          if ((v40 & 0xC000000000000001) != 0)
            v19 = (id)MEMORY[0x24957BECC](i, v40);
          else
            v19 = *(id *)(v40 + 8 * i + 32);
          v20 = v19;
          v21 = objc_msgSend(v19, sel_requestContext);
          if (v21)
          {
            v22 = v21;
            v23 = objc_msgSend(v21, sel_ended);

            if (v23)
            {
              MEMORY[0x24957BD58]();
              if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                sub_247488394();
              sub_2474883A0();
              sub_247488388();
            }
          }
          else
          {

          }
        }
        v16 = v40;
        swift_bridgeObjectRelease();
        v24 = v6;
        if (!(v6 >> 62))
          goto LABEL_33;
LABEL_57:
        swift_bridgeObjectRetain();
        v25 = sub_24748852C();
        swift_bridgeObjectRelease();
        goto LABEL_34;
      }
LABEL_60:
      __break(1u);
      __break(1u);
      return result;
    }
  }
  else
  {
    v17 = *(_QWORD *)((v40 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v17)
      goto LABEL_20;
  }
  swift_bridgeObjectRelease();
  v24 = MEMORY[0x24BEE4AF8];
  if (MEMORY[0x24BEE4AF8] >> 62)
    goto LABEL_57;
LABEL_33:
  v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_34:
  swift_bridgeObjectRelease();
  if (v4)
  {
    swift_bridgeObjectRetain();
    v26 = 0;
    v27 = (char *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((a2 & 0xC000000000000001) != 0)
        v28 = (id)MEMORY[0x24957BECC](v26, a2);
      else
        v28 = *(id *)(a2 + 8 * v26 + 32);
      v29 = v28;
      v30 = objc_msgSend(v28, sel_ueiRequestCategorization);
      if (v30)
      {
        v31 = v30;
        v32 = objc_msgSend(v30, sel_requestStatus);

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v27 = sub_247476BB4(0, *((_QWORD *)v27 + 2) + 1, 1, v27, &qword_2576A6558);
        v34 = *((_QWORD *)v27 + 2);
        v33 = *((_QWORD *)v27 + 3);
        if (v34 >= v33 >> 1)
          v27 = sub_247476BB4((char *)(v33 > 1), v34 + 1, 1, v27, &qword_2576A6558);
        *((_QWORD *)v27 + 2) = v34 + 1;
        *(_DWORD *)&v27[4 * v34 + 32] = v32;
      }
      else
      {

      }
      ++v26;
    }
    while (v4 != v26);
    swift_bridgeObjectRelease();
  }
  else
  {
    v27 = (char *)MEMORY[0x24BEE4AF8];
  }
  v35 = sub_247476404(1, (uint64_t)v27);
  swift_bridgeObjectRelease();
  v36 = sub_247476208(v16, (SEL *)&selRef_partialResultGenerated);
  if (v36 >> 62)
    v37 = sub_24748852C();
  else
    v37 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  v38 = v39;
  if (!(v39 & 1 | ((v35 & 1) == 0)))
    return (v25 | v37) != 0;
  return v38;
}

unint64_t sub_24747831C()
{
  unint64_t result;

  result = qword_2576A6560;
  if (!qword_2576A6560)
  {
    result = MEMORY[0x24957C370](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2576A6560);
  }
  return result;
}

uint64_t sub_247478360(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(type metadata accessor for SiriUsageMetrics() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_247488538();
  __break(1u);
  return result;
}

char *sub_247478478(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
      return v6;
    }
  }
  result = (char *)sub_247488538();
  __break(1u);
  return result;
}

uint64_t sub_24747855C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
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
  char *v16;
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
  uint64_t result;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  char *v30;
  unint64_t v31;
  char v32;
  void (*v33)(char *, char *, uint64_t);
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  char *v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  _QWORD v62[2];
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;

  v3 = v2;
  v74 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A65E0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v71 = (char *)v62 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E80);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v67 = (char *)v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v72 = (uint64_t)v62 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_2474880AC();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v68 = (char *)v62 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v70 = (char *)v62 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v73 = (char *)v62 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)v62 - v25;
  sub_24747A2D4(a1, (uint64_t)v16, (uint64_t *)&unk_2576A65B0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    sub_24747A110((uint64_t)v16, (uint64_t *)&unk_2576A65B0);
    return sub_24747A2D4(v3, v74, &qword_2576A5E80);
  }
  else
  {
    v66 = v5;
    v28 = *(void (**)(char *, char *, uint64_t))(v18 + 32);
    v28(v26, v16, v17);
    v29 = *(int *)(v10 + 36);
    v65 = v3;
    v30 = (char *)(v3 + v29);
    v31 = sub_24746FC04();
    v32 = sub_2474882EC();
    v33 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
    v64 = v30;
    v34 = v73;
    if ((v32 & 1) != 0)
    {
      v35 = v73;
      v36 = v30;
    }
    else
    {
      v35 = v73;
      v36 = v26;
    }
    v33(v35, v36, v17);
    result = sub_247488304();
    if ((result & 1) != 0)
    {
      v37 = v26;
      v39 = v66;
      v38 = v67;
      v40 = *(int *)(v66 + 48);
      v69 = v10;
      v41 = v71;
      v62[1] = v31;
      v63 = v37;
      v42 = &v71[v40];
      ((void (*)(char *))v33)(v71);
      v33(v42, v34, v17);
      v43 = &v8[*(int *)(v39 + 48)];
      v33(v8, v41, v17);
      v33(v43, v42, v17);
      v28(v38, v8, v17);
      v44 = *(void (**)(char *, uint64_t))(v18 + 8);
      v44(v43, v17);
      v45 = *(int *)(v39 + 48);
      v46 = (uint64_t)v38;
      v47 = &v8[v45];
      v28(v8, v41, v17);
      v48 = v42;
      v49 = v69;
      v28(v47, v48, v17);
      v28(&v38[*(int *)(v49 + 36)], v47, v17);
      v44(v8, v17);
      v50 = (uint64_t)v38;
      v51 = v72;
      sub_24746FC4C(v50, v72);
      v52 = v65;
      if ((sub_2474882E0() & 1) != 0)
      {
        v33(v70, (char *)v51, v17);
      }
      else
      {
        v53 = v51 + *(int *)(v49 + 36);
        if ((sub_2474882EC() & 1) != 0)
        {
          v54 = v70;
          v55 = v53;
        }
        else
        {
          v54 = v70;
          v55 = v52;
        }
        v33(v54, (char *)v55, v17);
      }
      if ((sub_2474882EC() & 1) != 0)
      {
        v56 = v68;
      }
      else if ((sub_2474882E0() & 1) != 0)
      {
        v56 = v68;
      }
      else
      {
        v56 = v68;
      }
      ((void (*)(void))v33)();
      v57 = v66;
      v58 = v71;
      v59 = &v71[*(int *)(v66 + 48)];
      v28(v71, v70, v17);
      v28(v59, v56, v17);
      v60 = &v8[*(int *)(v57 + 48)];
      v33(v8, v58, v17);
      v33(v60, v59, v17);
      v28((char *)v46, v8, v17);
      v44(v60, v17);
      v61 = &v8[*(int *)(v57 + 48)];
      v28(v8, v58, v17);
      v28(v61, v59, v17);
      v28((char *)(v46 + *(int *)(v69 + 36)), v61, v17);
      v44(v8, v17);
      sub_24746FC4C(v46, v74);
      sub_24747A110(v72, &qword_2576A5E80);
      v44(v73, v17);
      return ((uint64_t (*)(char *, uint64_t))v44)(v63, v17);
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_247478ACC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  id v24;
  id v25;
  id v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t SeenResult;
  uint64_t result;
  char v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;

  v53 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65A0);
  MEMORY[0x24BDAC7A8](v5);
  v52 = (uint64_t)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60D8);
  MEMORY[0x24BDAC7A8](v7);
  v51 = (uint64_t)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2474880AC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v48 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v47 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v47 - v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E80);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v47 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = a1;
  sub_24747855C(a2, (uint64_t)v23);
  v24 = objc_msgSend((id)BiomeLibrary(), sel_Device);
  swift_unknownObjectRelease();
  v25 = objc_msgSend(v24, sel_Wireless);
  swift_unknownObjectRelease();
  v26 = objc_msgSend(v25, sel_Bluetooth);
  swift_unknownObjectRelease();
  sub_24747986C(v26, (uint64_t)v23, (uint64_t)sub_247478FAC, 0, (uint64_t)v20);

  v50 = a2;
  sub_24746A438((uint64_t)v20, a2, (uint64_t)v18);
  sub_24747A2D4((uint64_t)v18, (uint64_t)v15, (uint64_t *)&unk_2576A65B0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v15, 1, v9) == 1)
  {
    sub_24747A110((uint64_t)v18, (uint64_t *)&unk_2576A65B0);
    sub_24747A110((uint64_t)v20, (uint64_t *)&unk_2576A65B0);
    sub_24747A110((uint64_t)v23, &qword_2576A5E80);
    sub_24747A110((uint64_t)v15, (uint64_t *)&unk_2576A65B0);
    v39 = v53;
    v40 = v50;
    SeenResult = type metadata accessor for SegmentFlagLastSeenResult();
    result = sub_24747A2D4(v40, (uint64_t)&v39[*(int *)(SeenResult + 20)], (uint64_t *)&unk_2576A65B0);
  }
  else
  {
    v27 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
    v28 = v48;
    v27(v48, v15, v9);
    v29 = *(int *)(v21 + 36);
    v30 = v9;
    v31 = v10;
    v32 = v49 + v29;
    v33 = sub_2474880C4();
    v34 = v51;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v51, 1, 1, v33);
    v35 = sub_247488160();
    v36 = v52;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v52, 1, 1, v35);
    v37 = sub_247481F14(v32, v34, v36);
    v38 = v28;
    v44 = (uint64_t)v37;
    sub_24747A110(v52, (uint64_t *)&unk_2576A65A0);
    sub_24747A110(v51, &qword_2576A60D8);
    sub_24747A110((uint64_t)v18, (uint64_t *)&unk_2576A65B0);
    sub_24747A110((uint64_t)v20, (uint64_t *)&unk_2576A65B0);
    sub_24747A110((uint64_t)v23, &qword_2576A5E80);
    v39 = v53;
    if (v44 <= 27)
    {
      v45 = &v39[*(int *)(type metadata accessor for SegmentFlagLastSeenResult() + 20)];
      v27(v45, v38, v30);
      result = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v45, 0, 1, v30);
      v43 = 4;
      goto LABEL_5;
    }
    (*(void (**)(char *, uint64_t))(v31 + 8))(v38, v30);
    v46 = type metadata accessor for SegmentFlagLastSeenResult();
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v31 + 56))(&v39[*(int *)(v46 + 20)], 1, 1, v30);
  }
  v43 = 7;
LABEL_5:
  *v39 = v43;
  return result;
}

id sub_247478FAC(void *a1)
{
  return objc_msgSend(a1, sel_appleAudioDevice);
}

uint64_t sub_247478FC8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  id v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  _QWORD v55[3];
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
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
  uint64_t aBlock;
  uint64_t v75;
  void *v76;
  void *v77;
  void (*v78)(void *);
  uint64_t v79;

  v67 = a4;
  v64 = a3;
  v58 = a2;
  v61 = a1;
  v66 = a5;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E80);
  v63 = *(_QWORD *)(v5 - 8);
  v6 = *(_QWORD *)(v63 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v62 = (uint64_t)v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v55 - v11;
  v13 = swift_allocObject();
  v68 = v13;
  *(_QWORD *)(v13 + 16) = 0;
  v55[0] = v13 + 16;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = 0;
  v55[2] = v14 + 16;
  v15 = swift_allocObject();
  v59 = v15;
  *(_QWORD *)(v15 + 16) = 0;
  v55[1] = v15 + 16;
  v57 = v7;
  v60 = swift_allocBox();
  v17 = v16;
  v18 = sub_2474880AC();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
  v65 = v17;
  v20(v17, 1, 1, v18);
  v21 = (void *)sub_24748831C();
  sub_24747A86C(0, &qword_2576A65C0);
  v22 = *(int *)(v5 + 36);
  v23 = v58;
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v24(v12, v58 + v22, v18);
  v20((uint64_t)v12, 0, 1, v18);
  v24(v10, v23, v18);
  v20((uint64_t)v10, 0, 1, v18);
  v56 = v12;
  v25 = sub_24747A15C((uint64_t)v12, (uint64_t)v10, 0, 0, 1);
  v61 = objc_msgSend(v61, sel_publisherWithUseCase_options_, v21, v25);

  v78 = sub_247482DF0;
  v79 = 0;
  aBlock = MEMORY[0x24BDAC760];
  v75 = 1107296256;
  v76 = sub_24747A26C;
  v77 = &block_descriptor_14;
  v26 = _Block_copy(&aBlock);
  v27 = v62;
  sub_24747A2D4(v23, v62, &qword_2576A5E80);
  v28 = (*(unsigned __int8 *)(v63 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80);
  v29 = (v6 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  v30 = (v29 + 23) & 0xFFFFFFFFFFFFFFF8;
  v31 = (v30 + 15) & 0xFFFFFFFFFFFFFFF8;
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = v68;
  v33 = v32 + v28;
  v34 = v59;
  sub_24746FC4C(v27, v33);
  v35 = (uint64_t *)(v32 + v29);
  v36 = v60;
  v37 = v67;
  *v35 = v64;
  v35[1] = v37;
  *(_QWORD *)(v32 + v30) = v36;
  *(_QWORD *)(v32 + v31) = v34;
  *(_QWORD *)(v32 + ((v31 + 15) & 0xFFFFFFFFFFFFFFF8)) = v14;
  v78 = (void (*)(void *))sub_24747A7E0;
  v79 = v32;
  aBlock = MEMORY[0x24BDAC760];
  v38 = v14;
  v75 = 1107296256;
  v76 = sub_24747A644;
  v77 = &block_descriptor_20;
  v39 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v67 = v38;
  swift_retain();
  swift_release();
  v40 = v61;
  v41 = objc_msgSend(v61, sel_sinkWithCompletion_shouldContinue_, v26, v39);
  _Block_release(v39);
  _Block_release(v26);

  if (qword_254448180 != -1)
    swift_once();
  v42 = sub_24748828C();
  __swift_project_value_buffer(v42, (uint64_t)qword_254448188);
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain();
  v43 = sub_247488274();
  v44 = sub_247488418();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = swift_slowAlloc();
    v64 = swift_slowAlloc();
    aBlock = v64;
    *(_DWORD *)v45 = 136316418;
    v73 = sub_247473DB8(0xD000000000000027, 0x800000024748AE60, &aBlock);
    sub_247488478();
    *(_WORD *)(v45 + 12) = 2048;
    swift_beginAccess();
    v72 = *(_QWORD *)(v68 + 16);
    sub_247488478();
    swift_release();
    *(_WORD *)(v45 + 22) = 2080;
    v72 = sub_24747A86C(0, &qword_2576A65E8);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65F0);
    v46 = sub_247488328();
    v72 = sub_247473DB8(v46, v47, &aBlock);
    sub_247488478();
    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 32) = 2048;
    swift_beginAccess();
    v48 = *(_QWORD *)(v34 + 16);
    swift_release();
    v71 = v48;
    sub_247488478();
    swift_release();
    *(_WORD *)(v45 + 42) = 2048;
    swift_beginAccess();
    v49 = *(_QWORD *)(v67 + 16);
    swift_release();
    v70 = v49;
    sub_247488478();
    swift_release();
    *(_WORD *)(v45 + 52) = 2080;
    v50 = v65;
    swift_beginAccess();
    sub_24747A2D4(v50, (uint64_t)v56, (uint64_t *)&unk_2576A65B0);
    v51 = sub_247488328();
    v69 = sub_247473DB8(v51, v52, &aBlock);
    sub_247488478();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247463000, v43, v44, "%s Scanned %ld %s events; %ld more recent, non-matching events; %ld date out of range; result %s",
      (uint8_t *)v45,
      0x3Eu);
    v53 = v64;
    swift_arrayDestroy();
    MEMORY[0x24957C430](v53, -1, -1);
    MEMORY[0x24957C430](v45, -1, -1);

  }
  else
  {

    swift_release_n();
    swift_release();
    swift_release_n();
    swift_release_n();
    v50 = v65;
  }
  swift_beginAccess();
  sub_24747A2D4(v50, v66, (uint64_t *)&unk_2576A65B0);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24747986C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  id v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  _QWORD v55[3];
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
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
  uint64_t aBlock;
  uint64_t v75;
  void *v76;
  void *v77;
  void (*v78)(void *);
  uint64_t v79;

  v67 = a4;
  v64 = a3;
  v58 = a2;
  v61 = a1;
  v66 = a5;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E80);
  v63 = *(_QWORD *)(v5 - 8);
  v6 = *(_QWORD *)(v63 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v62 = (uint64_t)v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v55 - v11;
  v13 = swift_allocObject();
  v68 = v13;
  *(_QWORD *)(v13 + 16) = 0;
  v55[0] = v13 + 16;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = 0;
  v55[2] = v14 + 16;
  v15 = swift_allocObject();
  v59 = v15;
  *(_QWORD *)(v15 + 16) = 0;
  v55[1] = v15 + 16;
  v57 = v7;
  v60 = swift_allocBox();
  v17 = v16;
  v18 = sub_2474880AC();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
  v65 = v17;
  v20(v17, 1, 1, v18);
  v21 = (void *)sub_24748831C();
  sub_24747A86C(0, &qword_2576A65C0);
  v22 = *(int *)(v5 + 36);
  v23 = v58;
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v24(v12, v58 + v22, v18);
  v20((uint64_t)v12, 0, 1, v18);
  v24(v10, v23, v18);
  v20((uint64_t)v10, 0, 1, v18);
  v56 = v12;
  v25 = sub_24747A15C((uint64_t)v12, (uint64_t)v10, 0, 0, 1);
  v61 = objc_msgSend(v61, sel_publisherWithUseCase_options_, v21, v25);

  v78 = sub_247482DF0;
  v79 = 0;
  aBlock = MEMORY[0x24BDAC760];
  v75 = 1107296256;
  v76 = sub_24747A26C;
  v77 = &block_descriptor_0;
  v26 = _Block_copy(&aBlock);
  v27 = v62;
  sub_24747A2D4(v23, v62, &qword_2576A5E80);
  v28 = (*(unsigned __int8 *)(v63 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80);
  v29 = (v6 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  v30 = (v29 + 23) & 0xFFFFFFFFFFFFFFF8;
  v31 = (v30 + 15) & 0xFFFFFFFFFFFFFFF8;
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = v68;
  v33 = v32 + v28;
  v34 = v59;
  sub_24746FC4C(v27, v33);
  v35 = (uint64_t *)(v32 + v29);
  v36 = v60;
  v37 = v67;
  *v35 = v64;
  v35[1] = v37;
  *(_QWORD *)(v32 + v30) = v36;
  *(_QWORD *)(v32 + v31) = v34;
  *(_QWORD *)(v32 + ((v31 + 15) & 0xFFFFFFFFFFFFFFF8)) = v14;
  v78 = (void (*)(void *))sub_24747A640;
  v79 = v32;
  aBlock = MEMORY[0x24BDAC760];
  v38 = v14;
  v75 = 1107296256;
  v76 = sub_24747A644;
  v77 = &block_descriptor_8;
  v39 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v67 = v38;
  swift_retain();
  swift_release();
  v40 = v61;
  v41 = objc_msgSend(v61, sel_sinkWithCompletion_shouldContinue_, v26, v39);
  _Block_release(v39);
  _Block_release(v26);

  if (qword_254448180 != -1)
    swift_once();
  v42 = sub_24748828C();
  __swift_project_value_buffer(v42, (uint64_t)qword_254448188);
  swift_retain_n();
  swift_retain_n();
  swift_retain_n();
  swift_retain();
  v43 = sub_247488274();
  v44 = sub_247488418();
  if (os_log_type_enabled(v43, v44))
  {
    v45 = swift_slowAlloc();
    v64 = swift_slowAlloc();
    aBlock = v64;
    *(_DWORD *)v45 = 136316418;
    v73 = sub_247473DB8(0xD000000000000027, 0x800000024748AE60, &aBlock);
    sub_247488478();
    *(_WORD *)(v45 + 12) = 2048;
    swift_beginAccess();
    v72 = *(_QWORD *)(v68 + 16);
    sub_247488478();
    swift_release();
    *(_WORD *)(v45 + 22) = 2080;
    v72 = sub_24747A86C(0, &qword_2576A65C8);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65D0);
    v46 = sub_247488328();
    v72 = sub_247473DB8(v46, v47, &aBlock);
    sub_247488478();
    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 32) = 2048;
    swift_beginAccess();
    v48 = *(_QWORD *)(v34 + 16);
    swift_release();
    v71 = v48;
    sub_247488478();
    swift_release();
    *(_WORD *)(v45 + 42) = 2048;
    swift_beginAccess();
    v49 = *(_QWORD *)(v67 + 16);
    swift_release();
    v70 = v49;
    sub_247488478();
    swift_release();
    *(_WORD *)(v45 + 52) = 2080;
    v50 = v65;
    swift_beginAccess();
    sub_24747A2D4(v50, (uint64_t)v56, (uint64_t *)&unk_2576A65B0);
    v51 = sub_247488328();
    v69 = sub_247473DB8(v51, v52, &aBlock);
    sub_247488478();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247463000, v43, v44, "%s Scanned %ld %s events; %ld more recent, non-matching events; %ld date out of range; result %s",
      (uint8_t *)v45,
      0x3Eu);
    v53 = v64;
    swift_arrayDestroy();
    MEMORY[0x24957C430](v53, -1, -1);
    MEMORY[0x24957C430](v45, -1, -1);

  }
  else
  {

    swift_release_n();
    swift_release();
    swift_release_n();
    swift_release_n();
    v50 = v65;
  }
  swift_beginAccess();
  sub_24747A2D4(v50, v66, (uint64_t *)&unk_2576A65B0);
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24747A110(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24747A14C()
{
  return swift_deallocObject();
}

id sub_24747A15C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  void *v14;
  id v15;

  v10 = sub_2474880AC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  v13 = 0;
  if (v12(a1, 1, v10) != 1)
  {
    v13 = (void *)sub_24748807C();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  }
  if (v12(a2, 1, v10) == 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = (void *)sub_24748807C();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, v10);
  }
  v15 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithStartDate_endDate_maxEvents_lastN_reversed_, v13, v14, a3, a4, a5 & 1);

  return v15;
}

void sub_24747A26C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

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

uint64_t sub_24747A2D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24747A318(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t result;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  char v26;
  char v27;
  void (*v28)(char *, uint64_t);
  id v29;
  void *v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t (*v39)(void);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;

  v42 = a8;
  v39 = a4;
  v40 = a7;
  v38 = a5;
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  MEMORY[0x24BDAC7A8](v11);
  v37 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E80);
  MEMORY[0x24BDAC7A8](v41);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_2474880AC();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v36 - v20;
  v36 = swift_projectBox();
  result = swift_beginAccess();
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (v24)
  {
    __break(1u);
    goto LABEL_16;
  }
  *(_QWORD *)(a2 + 16) = v25;
  v43 = a1;
  objc_msgSend(a1, sel_timestamp);
  sub_247488004();
  sub_24746FC04();
  v26 = sub_247488304();
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
  sub_24747A2D4(a3, (uint64_t)v14, &qword_2576A5E80);
  if ((v26 & 1) != 0)
    v27 = sub_2474882EC();
  else
    v27 = 0;
  sub_24747A110((uint64_t)v14, &qword_2576A5E80);
  v28 = *(void (**)(char *, uint64_t))(v16 + 8);
  v28(v19, v15);
  if ((v27 & 1) != 0)
  {
    v29 = objc_msgSend(v43, sel_eventBody);
    if (v29)
    {
      v30 = v29;
      v31 = v39();

      if ((v31 & 1) != 0)
      {
        v32 = (uint64_t)v37;
        (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v37, v21, v15);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v16 + 56))(v32, 0, 1, v15);
        v33 = v36;
        swift_beginAccess();
        sub_24747A694(v32, v33);
        return 0;
      }
    }
  }
  else
  {
    v34 = (uint64_t *)(v42 + 16);
    v28(v21, v15);
    swift_beginAccess();
    v35 = *v34 + 1;
    if (!__OFADD__(*v34, 1))
      goto LABEL_13;
    __break(1u);
  }
  v34 = (uint64_t *)(v40 + 16);
  v28(v21, v15);
  result = swift_beginAccess();
  v35 = *v34 + 1;
  if (__OFADD__(*v34, 1))
  {
LABEL_16:
    __break(1u);
    return result;
  }
LABEL_13:
  *v34 = v35;
  return 1;
}

uint64_t sub_24747A644(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

uint64_t sub_24747A694(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t objectdestroy_4Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E80);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 24) & ~v2;
  swift_release();
  v4 = v0 + v3;
  v5 = sub_2474880AC();
  v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8);
  v6(v4, v5);
  v6(v4 + *(int *)(v1 + 36), v5);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24747A7E4(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E80) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_24747A318(a1, *(_QWORD *)(v1 + 16), v1 + v4, *(uint64_t (**)(void))(v1 + v5), *(_QWORD *)(v1 + v5 + 8), *(_QWORD *)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((((v5 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1+ ((((((v5 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8))) & 1;
}

uint64_t sub_24747A86C(uint64_t a1, unint64_t *a2)
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

void sub_24747A8BC(uint64_t a1, char a2)
{
  sub_247488604();
  __asm { BR              X10 }
}

uint64_t sub_24747A910()
{
  sub_247488334();
  swift_bridgeObjectRelease();
  return sub_24748861C();
}

uint64_t SegmentFlags.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24747AA14 + 4 * byte_247489A97[*v0]))(0xD000000000000011, 0x800000024748A3D0);
}

uint64_t sub_24747AA14()
{
  return 0x6F7473754377656ELL;
}

uint64_t sub_24747AA34()
{
  return 0x6F69746174636964;
}

uint64_t sub_24747AA50()
{
  return 7496035;
}

uint64_t sub_24747AA60()
{
  return 0x73646F50726961;
}

uint64_t sub_24747AA78()
{
  return 0x6D6F44736D6D6F63;
}

uint64_t sub_24747AA9C(uint64_t a1)
{
  return a1 + 9;
}

SiriUserSegments::SegmentFlags_optional __swiftcall SegmentFlags.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriUserSegments::SegmentFlags_optional result;
  char v5;

  v2 = v1;
  v3 = sub_247488544();
  result.value = swift_bridgeObjectRelease();
  v5 = 7;
  if (v3 < 7)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static SegmentFlags.allCases.getter()
{
  return &unk_2518A95C8;
}

void sub_24747AB18(char *a1)
{
  sub_24747AE74(*a1);
}

unint64_t sub_24747AB28()
{
  unint64_t result;

  result = qword_2576A6600;
  if (!qword_2576A6600)
  {
    result = MEMORY[0x24957C370](&protocol conformance descriptor for SegmentFlags, &type metadata for SegmentFlags);
    atomic_store(result, (unint64_t *)&qword_2576A6600);
  }
  return result;
}

void sub_24747AB6C()
{
  char *v0;

  sub_24747A8BC(0, *v0);
}

void sub_24747AB78(uint64_t a1)
{
  char *v1;

  sub_24747B3F8(a1, *v1);
}

void sub_24747AB80(uint64_t a1)
{
  char *v1;

  sub_24747A8BC(a1, *v1);
}

SiriUserSegments::SegmentFlags_optional sub_24747AB88(Swift::String *a1)
{
  return SegmentFlags.init(rawValue:)(*a1);
}

uint64_t sub_24747AB94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SegmentFlags.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24747ABB8()
{
  sub_24747AE30();
  return sub_247488364();
}

uint64_t sub_24747AC14()
{
  sub_24747AE30();
  return sub_247488358();
}

unint64_t sub_24747AC64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A6608;
  if (!qword_2576A6608)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A6610);
    result = MEMORY[0x24957C370](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2576A6608);
  }
  return result;
}

void sub_24747ACB0(_QWORD *a1@<X8>)
{
  *a1 = &unk_2518A95C8;
}

uint64_t getEnumTagSinglePayload for SegmentFlags(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SegmentFlags(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_24747AD9C + 4 * byte_247489AA3[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_24747ADD0 + 4 * byte_247489A9E[v4]))();
}

uint64_t sub_24747ADD0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24747ADD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24747ADE0);
  return result;
}

uint64_t sub_24747ADEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24747ADF4);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_24747ADF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24747AE00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24747AE0C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24747AE18(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SegmentFlags()
{
  return &type metadata for SegmentFlags;
}

unint64_t sub_24747AE30()
{
  unint64_t result;

  result = qword_2576A6618;
  if (!qword_2576A6618)
  {
    result = MEMORY[0x24957C370](&protocol conformance descriptor for SegmentFlags, &type metadata for SegmentFlags);
    atomic_store(result, (unint64_t *)&qword_2576A6618);
  }
  return result;
}

void sub_24747AE74(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_24747AEC0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_24747AF7C + 4 * byte_247489C27[a2]))(0x6F7473754377656ELL);
}

uint64_t sub_24747AF7C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6F7473754377656ELL && v1 == 0xEB0000000072656DLL)
    v2 = 1;
  else
    v2 = sub_2474885BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_24747B090(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_24747B0DC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_24747B1C0 + 4 * byte_247489C39[a2]))(0x6E776F6E6B6E75);
}

uint64_t sub_24747B1C0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6E776F6E6B6E75 && v1 == 0xE700000000000000)
    v2 = 1;
  else
    v2 = sub_2474885BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_24747B2D8(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_24747B31C()
{
  sub_247488334();
  return swift_bridgeObjectRelease();
}

void sub_24747B3F8(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_24747B43C()
{
  sub_247488334();
  return swift_bridgeObjectRelease();
}

uint64_t ActivitySegment.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24747B524 + 4 * byte_247489C56[*v0]))(0xD000000000000016, 0x800000024748A440);
}

uint64_t sub_24747B524()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_24747B53C()
{
  return 0x64656C6261736964;
}

uint64_t sub_24747B554()
{
  return 0x6F69746174636964;
}

uint64_t sub_24747B578(uint64_t a1)
{
  return a1 + 2;
}

SiriUserSegments::ActivitySegment_optional __swiftcall ActivitySegment.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriUserSegments::ActivitySegment_optional result;
  char v5;

  v2 = v1;
  v3 = sub_247488544();
  result.value = swift_bridgeObjectRelease();
  v5 = 11;
  if (v3 < 0xB)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static ActivitySegment.allCases.getter()
{
  return &unk_2518A9718;
}

void sub_24747B650(char *a1)
{
  sub_24747B090(*a1);
}

unint64_t sub_24747B660()
{
  unint64_t result;

  result = qword_2576A6620;
  if (!qword_2576A6620)
  {
    result = MEMORY[0x24957C370](&protocol conformance descriptor for ActivitySegment, &type metadata for ActivitySegment);
    atomic_store(result, (unint64_t *)&qword_2576A6620);
  }
  return result;
}

uint64_t sub_24747B6A4()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_247488604();
  sub_24747B2D8((uint64_t)v3, v1);
  return sub_24748861C();
}

void sub_24747B6E8(uint64_t a1)
{
  char *v1;

  sub_24747B2D8(a1, *v1);
}

uint64_t sub_24747B6F0()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_247488604();
  sub_24747B2D8((uint64_t)v3, v1);
  return sub_24748861C();
}

SiriUserSegments::ActivitySegment_optional sub_24747B730(Swift::String *a1)
{
  return ActivitySegment.init(rawValue:)(*a1);
}

uint64_t sub_24747B73C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = ActivitySegment.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24747B760()
{
  sub_24747B9D8();
  return sub_247488364();
}

uint64_t sub_24747B7BC()
{
  sub_24747B9D8();
  return sub_247488358();
}

unint64_t sub_24747B80C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A6628;
  if (!qword_2576A6628)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A6630);
    result = MEMORY[0x24957C370](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2576A6628);
  }
  return result;
}

void sub_24747B858(_QWORD *a1@<X8>)
{
  *a1 = &unk_2518A9718;
}

uint64_t getEnumTagSinglePayload for ActivitySegment(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivitySegment(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_24747B944 + 4 * byte_247489C66[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_24747B978 + 4 * byte_247489C61[v4]))();
}

uint64_t sub_24747B978(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24747B980(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24747B988);
  return result;
}

uint64_t sub_24747B994(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24747B99CLL);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_24747B9A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24747B9A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24747B9B4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24747B9C0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ActivitySegment()
{
  return &type metadata for ActivitySegment;
}

unint64_t sub_24747B9D8()
{
  unint64_t result;

  result = qword_2576A6638;
  if (!qword_2576A6638)
  {
    result = MEMORY[0x24957C370](&protocol conformance descriptor for ActivitySegment, &type metadata for ActivitySegment);
    atomic_store(result, (unint64_t *)&qword_2576A6638);
  }
  return result;
}

_WORD *__swift_memcpy2_1(_WORD *result, _WORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SiriEnablementState(unsigned __int16 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 65281 <= 0xFFFEFFFF)
    v2 = 2;
  else
    v2 = 4;
  if (a2 + 65281 < 0xFF0000)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 16)) - 65281;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
      return (*a1 | (v4 << 16)) - 65281;
    }
    v4 = *((unsigned __int8 *)a1 + 2);
    if (*((_BYTE *)a1 + 2))
      return (*a1 | (v4 << 16)) - 65281;
  }
LABEL_17:
  v6 = *(unsigned __int8 *)a1;
  v7 = v6 >= 2;
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriEnablementState(_WORD *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 65281 <= 0xFFFEFFFF)
    v3 = 2;
  else
    v3 = 4;
  if (a3 + 65281 < 0xFF0000)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_24747BB18 + 4 * byte_247489DF5[v4]))();
  *a1 = a2 - 255;
  return ((uint64_t (*)(void))((char *)sub_24747BB4C + 4 * byte_247489DF0[v4]))();
}

uint64_t sub_24747BB4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 2) = v1;
  return result;
}

uint64_t sub_24747BB54(uint64_t result, int a2)
{
  *(_WORD *)(result + 2) = 0;
  if (a2)
    JUMPOUT(0x24747BB5CLL);
  return result;
}

uint64_t sub_24747BB68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 2) = 0;
  if (!a2)
    JUMPOUT(0x24747BB70);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24747BB74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 2) = v1;
  return result;
}

uint64_t sub_24747BB7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 2) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriEnablementState()
{
  return &type metadata for SiriEnablementState;
}

uint64_t sub_24747BB98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_24747BBA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 8) + *(_QWORD *)(a4 + 8));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_24747BC24;
  return v11(a1, a2, a3, a4);
}

uint64_t sub_24747BC24()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24747BC6C()
{
  _QWORD *v0;

  sub_2474884C0();
  sub_247488340();
  type metadata accessor for ConversationTurn();
  sub_2474880B8();
  sub_24747BF0C();
  sub_2474885B0();
  sub_247488340();
  swift_bridgeObjectRelease();
  sub_247488340();
  if (*v0 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24748852C();
    swift_bridgeObjectRelease();
  }
  sub_2474885B0();
  sub_247488340();
  swift_bridgeObjectRelease();
  sub_247488340();
  if (v0[1] >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24748852C();
    swift_bridgeObjectRelease();
  }
  sub_2474885B0();
  sub_247488340();
  swift_bridgeObjectRelease();
  sub_247488340();
  if (v0[2] >> 62)
  {
    swift_bridgeObjectRetain();
    sub_24748852C();
    swift_bridgeObjectRelease();
  }
  sub_2474885B0();
  sub_247488340();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t type metadata accessor for ConversationTurn()
{
  uint64_t result;

  result = qword_2576A66A8;
  if (!qword_2576A66A8)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_24747BF0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A6648;
  if (!qword_2576A6648)
  {
    v1 = sub_2474880B8();
    result = MEMORY[0x24957C370](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, (unint64_t *)&qword_2576A6648);
  }
  return result;
}

uint64_t *sub_24747BF54(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = a2[2];
    a1[1] = a2[1];
    a1[2] = v6;
    v7 = *(int *)(a3 + 28);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_2474880B8();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v5;
}

uint64_t sub_24747C00C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_2474880B8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_24747C064(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 28);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_2474880B8();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *sub_24747C0F4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2474880B8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_24747C198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 28);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_2474880B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_24747C1FC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2474880B8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_24747C288()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24747C294(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2474880B8();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 28)], a2, v8);
  }
}

uint64_t sub_24747C310()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_24747C31C(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_2474880B8();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 28)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_24747C390()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2474880B8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_24747C40C()
{
  uint64_t v1;
  uint64_t v2;

  v1 = sub_247488064();
  MEMORY[0x24BDAC7A8](v1);
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  MEMORY[0x24BDAC7A8](v2);
  sub_2474884C0();
  sub_247488340();
  __asm { BR              X10 }
}

uint64_t sub_24747C508()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t SeenResult;
  uint64_t v7;
  uint64_t v8;

  sub_247488340();
  swift_bridgeObjectRelease();
  sub_247488340();
  SeenResult = type metadata accessor for SegmentFlagLastSeenResult();
  sub_24746BD5C(v3 + *(int *)(SeenResult + 20), v2);
  v7 = sub_2474880AC();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v2, 1, v7) == 1)
  {
    sub_24746BD1C(v2);
  }
  else
  {
    sub_247483094(v1);
    sub_24748801C();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v0);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v2, v7);
  }
  sub_247488340();
  swift_bridgeObjectRelease();
  sub_247488340();
  return *(_QWORD *)(v5 - 96);
}

uint64_t type metadata accessor for SegmentFlagLastSeenResult()
{
  uint64_t result;

  result = qword_2576A6740;
  if (!qword_2576A6740)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t *sub_24747C708(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_2474880AC();
    v9 = *(_QWORD *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
      memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(_BYTE *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t sub_24747C7F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_2474880AC();
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return result;
}

_BYTE *sub_24747C85C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_2474880AC();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

_BYTE *sub_24747C918(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_BYTE *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_2474880AC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(v5, 1, v7);
  v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

_BYTE *sub_24747CA20(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_2474880AC();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

_BYTE *sub_24747CADC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_BYTE *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_2474880AC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(v5, 1, v7);
  v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 40))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v5, v6, v7);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

uint64_t sub_24747CBE4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24747CBF0(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  int v4;
  unsigned int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 248)
  {
    if (*a1 <= 7u)
      v4 = 7;
    else
      v4 = *a1;
    v5 = v4 - 7;
    if (*a1 >= 7u)
      return v5;
    else
      return 0;
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v9);
  }
}

uint64_t sub_24747CC74()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_24747CC80(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 248)
  {
    *result = a2 + 7;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

void sub_24747CCF4()
{
  unint64_t v0;

  sub_24747CD68();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_24747CD68()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254448150)
  {
    sub_2474880AC();
    v0 = sub_24748846C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254448150);
  }
}

ValueMetadata *type metadata accessor for AIMLInstrumentationStreamSource()
{
  return &type metadata for AIMLInstrumentationStreamSource;
}

uint64_t sub_24747CDCC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[15] = a1;
  v2[16] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5EC0);
  v2[17] = v3;
  v2[18] = *(_QWORD *)(v3 - 8);
  v2[19] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5EC8);
  v2[20] = v4;
  v2[21] = *(_QWORD *)(v4 - 8);
  v2[22] = swift_task_alloc();
  v5 = sub_2474880AC();
  v2[23] = v5;
  v2[24] = *(_QWORD *)(v5 - 8);
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24747CE94()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void (*v9)(uint64_t, uint64_t);
  _QWORD *v10;

  v1 = v0[25];
  v2 = v0[26];
  v4 = v0[23];
  v3 = v0[24];
  sub_2474881F0();
  sub_247488244();
  sub_24747D61C(0, &qword_2576A6780);
  v5 = (void *)sub_24748822C();
  sub_24747D61C(0, &qword_2576A6788);
  v6 = (void *)sub_24748822C();
  v7 = (void *)MEMORY[0x24957BC08](v5, v6);

  sub_24747D61C(0, &qword_2576A6790);
  v8 = (void *)sub_24748822C();
  v0[27] = MEMORY[0x24957BC08](v7, v8);

  sub_247487ECC();
  sub_247488010();
  v9 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v9(v2, v4);
  sub_247487EB4();
  sub_247488010();
  v9(v1, v4);
  v10 = (_QWORD *)swift_task_alloc();
  v0[28] = v10;
  *v10 = v0;
  v10[1] = sub_24747D048;
  return sub_2474881E4();
}

uint64_t sub_24747D048()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 232) = v0;
  swift_task_dealloc();

  return swift_task_switch();
}

uint64_t sub_24747D0B4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v2 = v0[21];
  v1 = v0[22];
  v4 = v0[19];
  v3 = v0[20];
  v6 = v0[17];
  v5 = v0[18];
  v0[13] = 0;
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  sub_2474881CC();
  sub_24747D654(&qword_2576A5ED0, &qword_2576A5EC0, MEMORY[0x24BE0C940]);
  sub_24748816C();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v7 = sub_247488250();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v0[10] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5EF0);
  sub_24747D654((unint64_t *)&unk_2576A5EF8, &qword_2576A5EF0, MEMORY[0x24BDFCBE0]);
  v8 = (_QWORD *)swift_task_alloc();
  v0[30] = v8;
  *v8 = v0;
  v8[1] = sub_24747D200;
  return sub_2474883B8();
}

uint64_t sub_24747D200()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 248) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24747D264()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 256) = *(_QWORD *)(v0 + 88);
  return swift_task_switch();
}

void sub_24747D280()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;

  v1 = *(void **)(v0 + 256);
  if (v1)
  {
    v2 = *(_QWORD *)(v0 + 248);
    v3 = *(_QWORD **)(v0 + 128);
    v4 = (void *)MEMORY[0x24957C07C]();
    sub_24747D694((uint64_t)v1, v3, (_QWORD *)(v0 + 104));
    objc_autoreleasePoolPop(v4);
    if (!v2)
    {

      __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5EF0);
      sub_24747D654((unint64_t *)&unk_2576A5EF8, &qword_2576A5EF0, MEMORY[0x24BDFCBE0]);
      v9 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 240) = v9;
      *v9 = v0;
      v9[1] = sub_24747D200;
      sub_2474883B8();
    }
  }
  else
  {
    swift_release();
    if (qword_254448180 != -1)
      swift_once();
    v5 = sub_24748828C();
    __swift_project_value_buffer(v5, (uint64_t)qword_254448188);
    v6 = sub_247488274();
    v7 = sub_247488418();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v8 = 134217984;
      swift_beginAccess();
      *(_QWORD *)(v0 + 112) = *(_QWORD *)(v0 + 104);
      sub_247488478();
      _os_log_impl(&dword_247463000, v6, v7, "AIMLInstrumentationStreamSource turn count: %ld", v8, 0xCu);
      MEMORY[0x24957C430](v8, -1, -1);
    }

    __swift_destroy_boxed_opaque_existential_1(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(void))(v0 + 8))();
  }
}

uint64_t sub_24747D4F0()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 96) = *(_QWORD *)(v0 + 248);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5C50);
  swift_willThrowTypedImpl();
  return swift_task_switch();
}

uint64_t sub_24747D550()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24747D5C0()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24747D61C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24747D654(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24957C370](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24747D694(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v6 = type metadata accessor for ConversationTurn();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (unint64_t *)((char *)&v29 - v10);
  sub_24747D920((_QWORD **)((char *)&v29 - v10));
  if (qword_254448180 != -1)
    swift_once();
  v12 = sub_24748828C();
  __swift_project_value_buffer(v12, (uint64_t)qword_254448188);
  sub_24747E2B4((uint64_t)v11, (uint64_t)v9);
  v13 = sub_247488274();
  v14 = sub_247488418();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v31 = v3;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc();
    v33 = v17;
    v29 = a2;
    v30 = a3;
    *(_DWORD *)v16 = 136315138;
    v18 = sub_24747BC6C();
    v32 = sub_247473DB8(v18, v19, &v33);
    a2 = v29;
    a3 = v30;
    sub_247488478();
    swift_bridgeObjectRelease();
    sub_24747E2F8((uint64_t)v9);
    _os_log_impl(&dword_247463000, v13, v14, "AIMLInstrumentationStreamSource turn: %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v17, -1, -1);
    MEMORY[0x24957C430](v16, -1, -1);
  }
  else
  {
    sub_24747E2F8((uint64_t)v9);
  }

  v20 = __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  v21 = *v20;
  v22 = *(_QWORD *)(*v20 + 32);
  result = sub_247476468(v11);
  if (*(_BYTE *)(v22 + 16) == 1)
  {
    v24 = *(_QWORD *)(v21 + 16);
    v25 = __CFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
    {
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
    *(_QWORD *)(v21 + 16) = v26;
  }
  if (*(_BYTE *)(v22 + 19) != 1)
  {
LABEL_12:
    result = sub_24747E2F8((uint64_t)v11);
    if (!__OFADD__(*a3, 1))
    {
      ++*a3;
      return result;
    }
    __break(1u);
    goto LABEL_15;
  }
  v27 = *(_QWORD *)(v21 + 24);
  v25 = __CFADD__(v27, 1);
  v28 = v27 + 1;
  if (!v25)
  {
    *(_QWORD *)(v21 + 24) = v28;
    goto LABEL_12;
  }
LABEL_16:
  __break(1u);
  return result;
}

void *sub_24747D920@<X0>(_QWORD *a1@<X8>)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *result;
  void *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint32_t *p_align;
  unint64_t *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  id v57;
  void *v58;
  unint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  void *v64;
  id v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  void *v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  id v78;
  void *v79;
  unint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v1 = sub_247488214();
  v2 = v1;
  v90 = MEMORY[0x24BEE4AF8];
  if (v1 >> 62)
    goto LABEL_16;
  v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_24748852C())
  {
    v4 = 4;
    while (1)
    {
      v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x24957BECC](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      result = (void *)sub_247488184();
      if (!result)
        goto LABEL_95;
      v9 = result;
      v10 = objc_msgSend(result, sel_wrapAsAnyEvent);

      if (v10)
      {
        MEMORY[0x24957BD58]();
        if (*(_QWORD *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_247488394();
        sub_2474883A0();
        sub_247488388();
      }
      ++v4;
      if (v7 == v3)
      {
        swift_bridgeObjectRelease();
        v11 = v90;
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  v11 = MEMORY[0x24BEE4AF8];
LABEL_18:
  swift_bridgeObjectRelease();
  v91 = MEMORY[0x24BEE4AF8];
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    result = (void *)sub_24748852C();
    v12 = (uint64_t)result;
    if (result)
      goto LABEL_20;
LABEL_92:
    swift_bridgeObjectRelease();
    v83 = MEMORY[0x24BEE4AF8];
    v85 = MEMORY[0x24BEE4AF8];
    v84 = MEMORY[0x24BEE4AF8];
LABEL_93:
    swift_bridgeObjectRelease();
    type metadata accessor for ConversationTurn();
    result = (void *)sub_24748825C();
    *a1 = v84;
    a1[1] = v85;
    a1[2] = v83;
    return result;
  }
  v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = (void *)swift_bridgeObjectRetain();
  if (!v12)
    goto LABEL_92;
LABEL_20:
  if (v12 >= 1)
  {
    v13 = 0;
    v14 = v11 & 0xC000000000000001;
    p_align = &stru_2518AAFE8.align;
    v16 = (unint64_t *)&unk_2576A6780;
    v89 = v11;
    while (1)
    {
      v17 = v14 ? (id)MEMORY[0x24957BECC](v13, v11) : *(id *)(v11 + 8 * v13 + 32);
      v18 = v17;
      if (objc_msgSend(v17, *((SEL *)p_align + 220)) != 6)
        break;
      v19 = objc_msgSend(v18, sel_payload);
      if (v19)
      {
        v20 = sub_247487FEC();
        v22 = v21;

        v19 = (id)sub_247487FE0();
        sub_247466420(v20, v22);
      }
      v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B30]), sel_initWithData_, v19);

      v24 = objc_msgSend(v23, sel_event);
      if (v24)
        goto LABEL_33;

LABEL_23:
      if (v12 == ++v13)
      {
        swift_bridgeObjectRelease();
        v87 = v91;
        v92 = MEMORY[0x24BEE4AF8];
        swift_bridgeObjectRetain();
        v41 = 0;
        while (1)
        {
          v42 = v14 ? (id)MEMORY[0x24957BECC](v41, v11) : *(id *)(v11 + 8 * v41 + 32);
          v43 = v42;
          if (objc_msgSend(v42, *((SEL *)p_align + 220)) != 6)
            break;
          v44 = objc_msgSend(v43, sel_payload);
          if (v44)
          {
            v45 = sub_247487FEC();
            v47 = v46;

            v44 = (id)sub_247487FE0();
            sub_247466420(v45, v47);
          }
          v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B30]), sel_initWithData_, v44);

          v49 = objc_msgSend(v48, sel_event);
          if (v49)
            goto LABEL_56;

LABEL_46:
          if (v12 == ++v41)
          {
            swift_bridgeObjectRelease();
            v86 = v92;
            v93 = MEMORY[0x24BEE4AF8];
            swift_bridgeObjectRetain();
            v62 = 0;
            while (1)
            {
              v63 = v14 ? (id)MEMORY[0x24957BECC](v62, v11) : *(id *)(v11 + 8 * v62 + 32);
              v64 = v63;
              if (objc_msgSend(v63, *((SEL *)p_align + 220), v86) != 6)
                break;
              v65 = objc_msgSend(v64, sel_payload);
              if (v65)
              {
                v66 = sub_247487FEC();
                v68 = v67;

                v65 = (id)sub_247487FE0();
                sub_247466420(v66, v68);
              }
              v69 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95B30]), sel_initWithData_, v65);

              v70 = objc_msgSend(v69, sel_event);
              if (v70)
                goto LABEL_79;

LABEL_69:
              if (v12 == ++v62)
              {
                swift_bridgeObjectRelease();
                v83 = v93;
                v85 = v86;
                v84 = v87;
                goto LABEL_93;
              }
            }
            v70 = v64;
LABEL_79:
            v71 = sub_24747D61C(0, &qword_2576A6790);
            objc_msgSend(v70, *((SEL *)p_align + 220));
            v72 = sub_24748843C();
            if (!v72 || v71 != v72)
              goto LABEL_68;
            v73 = objc_msgSend(v70, sel_payload);
            if (v73)
            {
              v74 = v73;
              v75 = sub_247487FEC();
              v77 = v76;

              v78 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
              v79 = (void *)sub_247487FE0();
              v80 = v77;
              p_align = (_DWORD *)(&stru_2518AAFE8 + 24);
              sub_247466420(v75, v80);
            }
            else
            {
              v78 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
              v79 = 0;
            }
            v81 = objc_msgSend(v78, sel_initWithData_, v79);

            if (v81)
            {
              objc_opt_self();
              v82 = swift_dynamicCastObjCClass();

              if (v82)
              {
                MEMORY[0x24957BD58]();
                if (*(_QWORD *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                  sub_247488394();
                sub_2474883A0();
                sub_247488388();
              }
              else
              {

              }
            }
            else
            {
LABEL_68:

            }
            goto LABEL_69;
          }
        }
        v49 = v43;
LABEL_56:
        v50 = sub_24747D61C(0, &qword_2576A6788);
        objc_msgSend(v49, *((SEL *)p_align + 220));
        v51 = sub_24748843C();
        if (!v51 || v50 != v51)
          goto LABEL_45;
        v52 = objc_msgSend(v49, sel_payload);
        if (v52)
        {
          v53 = v52;
          v54 = sub_247487FEC();
          v56 = v55;

          v57 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          v58 = (void *)sub_247487FE0();
          v59 = v56;
          p_align = (_DWORD *)(&stru_2518AAFE8 + 24);
          sub_247466420(v54, v59);
        }
        else
        {
          v57 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          v58 = 0;
        }
        v60 = objc_msgSend(v57, sel_initWithData_, v58);

        if (v60)
        {
          objc_opt_self();
          v61 = swift_dynamicCastObjCClass();

          if (v61)
          {
            MEMORY[0x24957BD58]();
            if (*(_QWORD *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v92 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_247488394();
            sub_2474883A0();
            sub_247488388();
          }
          else
          {

          }
        }
        else
        {
LABEL_45:

        }
        goto LABEL_46;
      }
    }
    v24 = v18;
LABEL_33:
    v25 = sub_24747D61C(0, v16);
    objc_msgSend(v24, *((SEL *)p_align + 220));
    v26 = sub_24748843C();
    if (!v26 || v25 != v26)
      goto LABEL_22;
    v27 = objc_msgSend(v24, sel_payload);
    if (v27)
    {
      v28 = v27;
      v29 = v12;
      v30 = v14;
      v31 = v16;
      v32 = sub_247487FEC();
      v34 = v33;

      v35 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      v36 = (void *)sub_247487FE0();
      v37 = v32;
      v16 = v31;
      v14 = v30;
      v12 = v29;
      v11 = v89;
      v38 = v34;
      p_align = (_DWORD *)(&stru_2518AAFE8 + 24);
      sub_247466420(v37, v38);
    }
    else
    {
      v35 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      v36 = 0;
    }
    v39 = objc_msgSend(v35, sel_initWithData_, v36);

    if (v39)
    {
      objc_opt_self();
      v40 = swift_dynamicCastObjCClass();

      if (v40)
      {
        MEMORY[0x24957BD58]();
        if (*(_QWORD *)((v91 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v91 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_247488394();
        sub_2474883A0();
        sub_247488388();
      }
      else
      {

      }
    }
    else
    {
LABEL_22:

    }
    goto LABEL_23;
  }
  __break(1u);
LABEL_95:
  __break(1u);
  return result;
}

uint64_t sub_24747E2B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ConversationTurn();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24747E2F8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ConversationTurn();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24747E334()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SiriUsageMetricsTurnSink()
{
  return objc_opt_self();
}

uint64_t sub_24747E378(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  int64_t v24;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v24 = v4 + v2;
  else
    v24 = v4;
  v3 = sub_2474767BC(isUniquelyReferenced_nonNull_native, v24, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = *(_QWORD *)(v3 + 16);
  v10 = (*(_QWORD *)(v3 + 24) >> 1) - v9;
  v11 = type metadata accessor for SiriUsageMetrics();
  if (v10 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v3 + v13 + v14 * v9;
  v16 = a1 + v13;
  v17 = v14 * v8;
  v18 = v15 + v17;
  v19 = v16 + v17;
  if (v16 < v18 && v15 < v19)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = *(_QWORD *)(v3 + 16);
  v22 = __OFADD__(v21, v8);
  v23 = v21 + v8;
  if (!v22)
  {
    *(_QWORD *)(v3 + 16) = v23;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_247488538();
  __break(1u);
  return result;
}

uint64_t sub_24747E4EC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[9] = a1;
  v2[10] = a2;
  v3 = sub_247487EE4();
  v2[11] = v3;
  v2[12] = *(_QWORD *)(v3 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24747E55C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (qword_254448180 != -1)
    swift_once();
  v1 = v0[9];
  v2 = v0[14];
  v3 = v0[11];
  v4 = v0[12];
  v5 = sub_24748828C();
  __swift_project_value_buffer(v5, (uint64_t)qword_254448188);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[15] = v6;
  v6(v2, v1, v3);
  v7 = sub_247488274();
  v8 = sub_247488418();
  v9 = os_log_type_enabled(v7, v8);
  v10 = v0[14];
  v11 = v0[11];
  if (v9)
  {
    v20 = v0[12];
    v12 = swift_slowAlloc();
    v21 = swift_slowAlloc();
    v22 = v21;
    *(_DWORD *)v12 = 136315394;
    v0[7] = sub_247473DB8(0xD000000000000026, 0x800000024748AFF0, &v22);
    sub_247488478();
    *(_WORD *)(v12 + 12) = 2080;
    sub_24747F124(&qword_2576A6098, (uint64_t (*)(uint64_t))MEMORY[0x24BDCB878], MEMORY[0x24BDCB8B8]);
    v13 = sub_2474885B0();
    v0[8] = sub_247473DB8(v13, v14, &v22);
    sub_247488478();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v10, v11);
    _os_log_impl(&dword_247463000, v7, v8, "SiriMetricsCalculator.%s calculationInterval: %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v21, -1, -1);
    MEMORY[0x24957C430](v12, -1, -1);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0[12] + 8))(v0[14], v0[11]);
  }

  v15 = (_QWORD *)v0[10];
  v16 = type metadata accessor for SiriUsageMetricsTurnSink();
  v17 = (_QWORD *)swift_allocObject();
  v0[16] = v17;
  type metadata accessor for ValidTurnFeatureExtractor();
  v17[2] = 0;
  v17[3] = 0;
  swift_allocObject();
  v17[4] = sub_247476384();
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  v0[5] = v16;
  v0[6] = &off_2518AA4E0;
  v0[2] = v17;
  swift_retain();
  v18 = (_QWORD *)swift_task_alloc();
  v0[17] = v18;
  *v18 = v0;
  v18[1] = sub_24747E830;
  return sub_24747CDCC(v0[9], (uint64_t)(v0 + 2));
}

uint64_t sub_24747E830()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 144) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_24747E89C()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void (*v13)(unint64_t, uint64_t, uint64_t);
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;

  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 88);
  v18 = v2;
  v19 = *(_QWORD *)(v0 + 96);
  v5 = *(_QWORD *)(v0 + 72);
  v17 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A6590);
  v6 = type metadata accessor for SiriUsageMetrics();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 72);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_247489FA0;
  v11 = v10 + v9;
  v2(v3, v5, v4);
  v12 = *(_QWORD *)(v1 + 16);
  v13 = *(void (**)(unint64_t, uint64_t, uint64_t))(v19 + 32);
  v13(v11, v3, v4);
  *(_QWORD *)(v11 + *(int *)(v6 + 24)) = v12;
  *(_BYTE *)(v11 + *(int *)(v6 + 20)) = 1;
  v14 = v11 + v8;
  v18(v3, v17, v4);
  v15 = *(_QWORD *)(v1 + 24);
  v13(v14, v3, v4);
  *(_QWORD *)(v14 + *(int *)(v6 + 24)) = v15;
  *(_BYTE *)(v14 + *(int *)(v6 + 20)) = 2;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v10);
}

uint64_t sub_24747E9F0()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24747EA4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[6] = a2;
  v3[7] = a3;
  v3[5] = a1;
  v4 = sub_247487EE4();
  v3[8] = v4;
  v3[9] = *(_QWORD *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v5 = sub_2474880AC();
  v3[11] = v5;
  v3[12] = *(_QWORD *)(v5 - 8);
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24747EB00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  uint64_t v27;

  if (qword_254448180 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 96);
  v5 = sub_24748828C();
  __swift_project_value_buffer(v5, (uint64_t)qword_254448188);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(_QWORD *)(v0 + 136) = v6;
  v6(v2, v1, v3);
  v7 = sub_247488274();
  v8 = sub_247488418();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(_QWORD *)(v0 + 128);
  v11 = *(_QWORD *)(v0 + 88);
  if (v9)
  {
    v24 = *(_QWORD *)(v0 + 96);
    v12 = swift_slowAlloc();
    v25 = swift_slowAlloc();
    v27 = v25;
    *(_DWORD *)v12 = 136315394;
    *(_QWORD *)(v0 + 24) = sub_247473DB8(0xD000000000000020, 0x800000024748AFC0, &v27);
    sub_247488478();
    *(_WORD *)(v12 + 12) = 2080;
    sub_24747F124((unint64_t *)&qword_2576A6090, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    v13 = sub_2474885B0();
    *(_QWORD *)(v0 + 32) = sub_247473DB8(v13, v14, &v27);
    sub_247488478();
    swift_bridgeObjectRelease();
    v15 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v15(v10, v11);
    _os_log_impl(&dword_247463000, v7, v8, "SiriMetricsCalculator.%s calculationDate: %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v25, -1, -1);
    MEMORY[0x24957C430](v12, -1, -1);
  }
  else
  {
    v15 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 96) + 8);
    v15(v10, v11);
  }

  *(_QWORD *)(v0 + 144) = v15;
  v16 = *(_QWORD *)(v0 + 48);
  sub_247488070();
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
  if (v16)
  {
    *(_QWORD *)(v0 + 152) = 0;
    v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 136);
    v18 = *(_QWORD *)(v0 + 112);
    v19 = *(_QWORD *)(v0 + 104);
    v20 = *(_QWORD *)(v0 + 88);
    sub_247488070();
    v17(v19, v18, v20);
    sub_247487EC0();
    v26 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2576A6890 + dword_2576A6890);
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v21;
    *v21 = v0;
    v21[1] = sub_24747EE64;
    return v26(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 56));
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0 + 144))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 88));
    v23 = *(_QWORD *)(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v23);
  }
}

uint64_t sub_24747EE64(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 168) = v1;
  swift_task_dealloc();
  if (v1)
    swift_bridgeObjectRelease();
  else
    *(_QWORD *)(v4 + 176) = a1;
  return swift_task_switch();
}

uint64_t sub_24747EEE0()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t (*v16)(uint64_t, uint64_t);

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 144);
  v2 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 88);
  v5 = *(_QWORD *)(v0 + 64);
  v6 = *(_QWORD *)(v0 + 72);
  v7 = *(_QWORD *)(v0 + 48);
  v8 = *(_QWORD *)(v0 + 152) + 1;
  sub_24747E378(*(_QWORD *)(v0 + 176));
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v1(v2, v3);
  if (v8 == v7)
  {
    (*(void (**)(_QWORD, _QWORD))(v0 + 144))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 88));
    v9 = *(_QWORD *)(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
  }
  else
  {
    ++*(_QWORD *)(v0 + 152);
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 136);
    v12 = *(_QWORD *)(v0 + 112);
    v13 = *(_QWORD *)(v0 + 104);
    v14 = *(_QWORD *)(v0 + 88);
    sub_247488070();
    v11(v13, v12, v14);
    sub_247487EC0();
    v16 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2576A6890 + dword_2576A6890);
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v15;
    *v15 = v0;
    v15[1] = sub_24747EE64;
    return v16(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 56));
  }
}

uint64_t sub_24747F080()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 144);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 88);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
  v1(v3, v4);
  v1(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24747F124(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24957C370](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for ConcurrencyError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ConcurrencyError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ConcurrencyError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for ConcurrencyError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ConcurrencyError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ConcurrencyError(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ConcurrencyError()
{
  return &type metadata for ConcurrencyError;
}

uint64_t sub_24747F2B0@<X0>(uint64_t a1@<X0>, void (*a2)(char *, char *, uint64_t)@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  char *v21;
  uint64_t v22;
  char *v23;
  _BYTE *v24;
  uint64_t SeenResult;
  uint64_t result;
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);

  v37 = a3;
  v38 = a2;
  v35 = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60D8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2474880AC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v34 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v34 - v22;
  v34 = a1;
  sub_24747F640(v37, (uint64_t)&v34 - v22);
  sub_24746A438((uint64_t)v23, (uint64_t)v38, (uint64_t)v21);
  sub_24746BD5C((uint64_t)v21, (uint64_t)v18);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v18, 1, v11) == 1)
  {
    sub_24747FFA0((uint64_t)v21, (uint64_t *)&unk_2576A65B0);
    sub_24747FFA0((uint64_t)v23, (uint64_t *)&unk_2576A65B0);
    sub_24747FFA0((uint64_t)v18, (uint64_t *)&unk_2576A65B0);
    v24 = v35;
LABEL_3:
    SeenResult = type metadata accessor for SegmentFlagLastSeenResult();
    result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v12 + 56))(&v24[*(int *)(SeenResult + 20)], 1, 1, v11);
    *v24 = 7;
    return result;
  }
  v27 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v27(v14, v18, v11);
  v28 = sub_2474880C4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v10, 1, 1, v28);
  v29 = sub_247488160();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v7, 1, 1, v29);
  v30 = v36;
  v31 = sub_247481F14(v34, (uint64_t)v10, (uint64_t)v7);
  if (v30)
  {
    sub_24747FFA0((uint64_t)v7, (uint64_t *)&unk_2576A65A0);
    sub_24747FFA0((uint64_t)v10, &qword_2576A60D8);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    sub_24747FFA0((uint64_t)v21, (uint64_t *)&unk_2576A65B0);
    return sub_24747FFA0((uint64_t)v23, (uint64_t *)&unk_2576A65B0);
  }
  else
  {
    v38 = v27;
    v32 = (uint64_t)v31;
    sub_24747FFA0((uint64_t)v7, (uint64_t *)&unk_2576A65A0);
    sub_24747FFA0((uint64_t)v10, &qword_2576A60D8);
    sub_24747FFA0((uint64_t)v21, (uint64_t *)&unk_2576A65B0);
    sub_24747FFA0((uint64_t)v23, (uint64_t *)&unk_2576A65B0);
    v24 = v35;
    if (v32 > 27)
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      goto LABEL_3;
    }
    v33 = &v24[*(int *)(type metadata accessor for SegmentFlagLastSeenResult() + 20)];
    v38(v33, v14, v11);
    result = (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v33, 0, 1, v11);
    *v24 = 1;
  }
  return result;
}

uint64_t sub_24747F640@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
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
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(void);
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  char *v58;
  char v59;
  char *v60;
  void (*v61)(char *, uint64_t);
  char *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unsigned int (*v74)(uint64_t, uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint64_t result;
  void (*v78)(void);
  unsigned int (*v79)(uint64_t, uint64_t, uint64_t);
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  char *v93;
  char *v94;
  char v95;
  void (*v96)(char *, uint64_t);
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t (*v102)(char *, char *, uint64_t);
  char *v103;
  char v104;
  void (*v105)(char *, uint64_t);
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  unsigned int (*v117)(uint64_t, uint64_t, uint64_t);
  char *v118;
  char *v119;
  char *v120;
  char *v121;
  uint64_t v122;
  void (*v123)(void);
  uint64_t v124;
  unint64_t v125;
  unsigned int (*v126)(uint64_t, uint64_t, uint64_t);
  char *v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;

  v107 = a2;
  v3 = type metadata accessor for SiriUsageMetrics();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v124 = (uint64_t)&v106 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v106 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v106 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v111 = (uint64_t)&v106 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v126 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))((char *)&v106 - v16);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v119 = (char *)&v106 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v106 - v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6068);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v115 = (uint64_t)&v106 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v114 = (uint64_t)&v106 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v110 = (uint64_t)&v106 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v109 = (uint64_t)&v106 - v28;
  v29 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v30 = MEMORY[0x24BDAC7A8](v29);
  v113 = (char *)&v106 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v108 = (char *)&v106 - v32;
  v33 = sub_2474880AC();
  v34 = MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&v106 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = MEMORY[0x24BDAC7A8](v34);
  v120 = (char *)&v106 - v38;
  v39 = MEMORY[0x24BDAC7A8](v37);
  v121 = (char *)&v106 - v40;
  v41 = MEMORY[0x24BDAC7A8](v39);
  v118 = (char *)&v106 - v42;
  v43 = MEMORY[0x24BDAC7A8](v41);
  v116 = (char *)&v106 - v44;
  MEMORY[0x24BDAC7A8](v43);
  v129 = v45;
  v46 = *(void (**)(void))(v45 + 16);
  v127 = (char *)&v106 - v47;
  v123 = v46;
  v46();
  v48 = *(_QWORD *)(a1 + 16);
  v122 = a1;
  swift_bridgeObjectRetain();
  v128 = v3;
  v130 = v48;
  if (v48)
  {
    v49 = 0;
    v50 = v122 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v117 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 72);
    v112 = v20;
    while (1)
    {
      v125 = v49;
      sub_24746BC10(v50, (uint64_t)v20);
      v52 = v20[*(int *)(v3 + 20)];
      v53 = (uint64_t)v20;
      v54 = (uint64_t)v20;
      v55 = v3;
      v56 = v119;
      sub_24746BC10(v53, (uint64_t)v119);
      if (v52 != 2)
        break;
      v57 = *(_QWORD *)&v56[*(int *)(v55 + 24)];
      sub_24746BC54((uint64_t)v56);
      sub_24746BC10(v54, (uint64_t)v126);
      v51 = v118;
      ((void (*)(char *, char *, uint64_t))v123)(v118, v127, v33);
      v20 = (char *)v54;
      if (!v57)
        goto LABEL_4;
      v58 = v121;
      sub_247487EB4();
      sub_24746FC04();
      v59 = sub_2474882EC();
      v60 = v51;
      v61 = *(void (**)(char *, uint64_t))(v129 + 8);
      v62 = v58;
      v20 = v112;
      v61(v62, v33);
      sub_24746BC54((uint64_t)v126);
      v61(v60, v33);
      v3 = v128;
      if ((v59 & 1) == 0)
      {
        v63 = v109;
        sub_24746BC90((uint64_t)v20, v109);
        v118 = *(char **)(v4 + 56);
        ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v118)(v63, 0, 1, v3);
        v64 = v125 + 1;
        goto LABEL_11;
      }
LABEL_5:
      v49 = v125 + 1;
      sub_24746BC54((uint64_t)v20);
      v50 += (uint64_t)v117;
      if (v130 == v49)
        goto LABEL_10;
    }
    sub_24746BC54((uint64_t)v56);
    sub_24746BC10(v54, (uint64_t)v126);
    v51 = v118;
    ((void (*)(char *, char *, uint64_t))v123)(v118, v127, v33);
    v20 = (char *)v54;
LABEL_4:
    sub_24746BC54((uint64_t)v126);
    (*(void (**)(char *, uint64_t))(v129 + 8))(v51, v33);
    v3 = v128;
    goto LABEL_5;
  }
LABEL_10:
  v63 = v109;
  v118 = *(char **)(v4 + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v118)(v109, 1, 1, v3);
  v64 = v130;
LABEL_11:
  v65 = v63;
  v66 = v110;
  sub_24746BCD4(v65, v110);
  v117 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v117(v66, 1, v3) == 1)
  {
    v67 = v129;
    v68 = *(char **)(v129 + 56);
    v69 = (uint64_t)v108;
    v70 = v108;
    v71 = 1;
  }
  else
  {
    v72 = v111;
    sub_24746BC90(v66, v111);
    v69 = (uint64_t)v108;
    sub_247487EB4();
    sub_24746BC54(v72);
    v67 = v129;
    v68 = *(char **)(v129 + 56);
    v70 = (char *)v69;
    v71 = 0;
  }
  v119 = v68;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v68)(v70, v71, 1, v33);
  v73 = v122;
  v74 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v67 + 48);
  if (v74(v69, 1, v33) == 1)
  {
    sub_24747FFA0(v69, (uint64_t *)&unk_2576A65B0);
    v75 = 1;
    v76 = v107;
LABEL_39:
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v119)(v76, v75, 1, v33);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v67 + 8))(v127, v33);
  }
  v112 = *(char **)(v67 + 32);
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v112)(v116, v69, v33);
  v78 = v123;
  v79 = v74;
  v126 = v74;
  while (v64 == v130)
  {
LABEL_20:
    v80 = v114;
    v81 = v128;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v118)(v114, 1, 1, v128);
    v64 = v130;
LABEL_21:
    v82 = v80;
    v83 = v115;
    sub_24746BCD4(v82, v115);
    if (v117(v83, 1, v81) == 1)
    {
      v84 = (uint64_t)v113;
      v85 = v113;
      v86 = 1;
    }
    else
    {
      v98 = v83;
      v99 = v111;
      sub_24746BC90(v98, v111);
      v84 = (uint64_t)v113;
      sub_247487EB4();
      sub_24746BC54(v99);
      v85 = (char *)v84;
      v86 = 0;
    }
    ((void (*)(char *, uint64_t, uint64_t, uint64_t))v119)(v85, v86, 1, v33);
    v67 = v129;
    v100 = v120;
    if (v79(v84, 1, v33) == 1)
    {
      sub_24747FFA0(v84, (uint64_t *)&unk_2576A65B0);
      v76 = v107;
      ((void (*)(uint64_t, char *, uint64_t))v112)(v107, v116, v33);
      v75 = 0;
      goto LABEL_39;
    }
    v101 = v84;
    v102 = (uint64_t (*)(char *, char *, uint64_t))v112;
    ((void (*)(char *, uint64_t, uint64_t))v112)(v100, v101, v33);
    sub_24746FC04();
    v103 = v116;
    v104 = sub_2474882EC();
    v105 = *(void (**)(char *, uint64_t))(v67 + 8);
    if ((v104 & 1) != 0)
    {
      v105(v103, v33);
      result = v102(v103, v120, v33);
    }
    else
    {
      result = ((uint64_t (*)(char *, uint64_t))v105)(v120, v33);
    }
    v73 = v122;
    v78 = v123;
    v79 = v126;
  }
  v87 = v130;
  if (v64 > v130)
    v87 = v64;
  v125 = v87;
  while (v125 != v64)
  {
    v89 = v4;
    sub_24746BC10(v73+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v64, (uint64_t)v12);
    v90 = v128;
    v91 = v12[*(int *)(v128 + 20)];
    sub_24746BC10((uint64_t)v12, (uint64_t)v9);
    if (v91 != 2)
    {
      sub_24746BC54((uint64_t)v9);
      v88 = v124;
      sub_24746BC10((uint64_t)v12, v124);
      ((void (*)(char *, char *, uint64_t))v78)(v36, v127, v33);
LABEL_27:
      sub_24746BC54(v88);
      (*(void (**)(char *, uint64_t))(v129 + 8))(v36, v33);
      v4 = v89;
      goto LABEL_28;
    }
    v92 = *(_QWORD *)&v9[*(int *)(v90 + 24)];
    sub_24746BC54((uint64_t)v9);
    v88 = v124;
    sub_24746BC10((uint64_t)v12, v124);
    ((void (*)(char *, char *, uint64_t))v78)(v36, v127, v33);
    if (!v92)
      goto LABEL_27;
    v93 = v9;
    v94 = v121;
    sub_247487EB4();
    sub_24746FC04();
    v95 = sub_2474882EC();
    v96 = *(void (**)(char *, uint64_t))(v129 + 8);
    v97 = v94;
    v9 = v93;
    v78 = v123;
    v96(v97, v33);
    sub_24746BC54(v88);
    v96(v36, v33);
    v73 = v122;
    v4 = v89;
    if ((v95 & 1) == 0)
    {
      v80 = v114;
      sub_24746BC90((uint64_t)v12, v114);
      v81 = v128;
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v118)(v80, 0, 1, v128);
      ++v64;
      v79 = v126;
      goto LABEL_21;
    }
LABEL_28:
    ++v64;
    result = sub_24746BC54((uint64_t)v12);
    v79 = v126;
    if (v130 == v64)
      goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_24747FFA0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24747FFDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int (*v27)(uint64_t, uint64_t, uint64_t);
  char *v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  _QWORD v38[2];
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;

  v6 = sub_2474880AC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v39 = (char *)v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v38 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v42 = (uint64_t)v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v38 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v44 = (char *)v38 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)v38 - v21;
  result = sub_247481C84(a1, a3, (uint64_t *)&unk_2576A65B0);
  v24 = *(_QWORD *)(a2 + 16);
  if (v24)
  {
    v25 = a2 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    v43 = *(_QWORD *)(v13 + 72);
    v38[1] = a2;
    swift_bridgeObjectRetain();
    v40 = v18;
    v41 = a3;
    do
    {
      sub_247481C84(v25, (uint64_t)v22, (uint64_t *)&unk_2576A65B0);
      sub_247481C84((uint64_t)v22, (uint64_t)v18, (uint64_t *)&unk_2576A65B0);
      v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
      if (v27((uint64_t)v18, 1, v6) == 1)
      {
        sub_247481D48((uint64_t)v18, (uint64_t *)&unk_2576A65B0);
        v26 = (uint64_t)v44;
        sub_247481C84(a3, (uint64_t)v44, (uint64_t *)&unk_2576A65B0);
      }
      else
      {
        v28 = v18;
        v29 = v7;
        v30 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
        v30(v11, v28, v6);
        v31 = a3;
        v32 = v42;
        sub_247481C84(v31, v42, (uint64_t *)&unk_2576A65B0);
        if (v27(v32, 1, v6) == 1)
        {
          sub_247481D48(v32, (uint64_t *)&unk_2576A65B0);
          v26 = (uint64_t)v44;
          v30(v44, v11, v6);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v6);
        }
        else
        {
          v33 = v32;
          v34 = v39;
          v30(v39, (char *)v33, v6);
          sub_24746FC04();
          if ((sub_2474882F8() & 1) != 0)
            v35 = v11;
          else
            v35 = v34;
          v36 = (uint64_t)v44;
          (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v44, v35, v6);
          v37 = *(void (**)(char *, uint64_t))(v29 + 8);
          v37(v34, v6);
          v37(v11, v6);
          v26 = v36;
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v29 + 56))(v36, 0, 1, v6);
        }
        v7 = v29;
        v18 = v40;
        a3 = v41;
      }
      sub_247481D48((uint64_t)v22, (uint64_t *)&unk_2576A65B0);
      sub_247481D48(a3, (uint64_t *)&unk_2576A65B0);
      sub_247481D84(v26, a3);
      v25 += v43;
      --v24;
    }
    while (v24);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2474802F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  type metadata accessor for SegmentFlagLastSeenResult();
  v3[11] = swift_task_alloc();
  v4 = sub_247488064();
  v3[12] = v4;
  v3[13] = *(_QWORD *)(v4 - 8);
  v3[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  v3[17] = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E80);
  v3[18] = swift_task_alloc();
  v5 = sub_24748828C();
  v3[19] = v5;
  v3[20] = *(_QWORD *)(v5 - 8);
  v3[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247480400()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  os_log_type_t v36;
  NSObject *log;
  uint64_t v38;

  if (qword_254448180 != -1)
    swift_once();
  v2 = v0[20];
  v1 = v0[21];
  v4 = v0[18];
  v3 = v0[19];
  v5 = v0[16];
  v7 = v0[9];
  v6 = v0[10];
  v8 = __swift_project_value_buffer(v3, (uint64_t)qword_254448188);
  v0[22] = v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v8, v3);
  sub_247481C84(v7, v4, &qword_2576A5E80);
  sub_247481C84(v6, v5, (uint64_t *)&unk_2576A65B0);
  v9 = sub_247488274();
  v10 = sub_247488418();
  if (os_log_type_enabled(v9, v10))
  {
    v36 = v10;
    log = v9;
    v11 = v0[18];
    v34 = v0[16];
    v33 = v0[15];
    v12 = swift_slowAlloc();
    v35 = swift_slowAlloc();
    v38 = v35;
    *(_DWORD *)v12 = 136315394;
    v0[2] = 0;
    v0[3] = 0xE000000000000000;
    v13 = sub_2474880AC();
    sub_247488514();
    sub_247488340();
    sub_247488514();
    v0[6] = sub_247473DB8(v0[2], v0[3], &v38);
    sub_247488478();
    swift_bridgeObjectRelease();
    sub_247481D48(v11, &qword_2576A5E80);
    *(_WORD *)(v12 + 12) = 2080;
    sub_247481C84(v34, v33, (uint64_t *)&unk_2576A65B0);
    v14 = *(_QWORD *)(v13 - 8);
    v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v33, 1, v13);
    v16 = v0[15];
    if (v15 == 1)
    {
      sub_247481D48(v0[15], (uint64_t *)&unk_2576A65B0);
      v17 = 0xE300000000000000;
      v18 = 7104878;
    }
    else
    {
      v23 = v0[13];
      v24 = v0[14];
      v25 = v0[12];
      sub_247483094(v24);
      v18 = sub_24748801C();
      v17 = v26;
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v24, v25);
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v13);
    }
    v28 = v0[20];
    v27 = v0[21];
    v29 = v0[19];
    v30 = v0[16];
    v0[7] = sub_247473DB8(v18, v17, &v38);
    sub_247488478();
    swift_bridgeObjectRelease();
    sub_247481D48(v30, (uint64_t *)&unk_2576A65B0);
    _os_log_impl(&dword_247463000, log, v36, "Starting CarPlaySegment.calculate(in dateRange: %s, lastSeen: %s)", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v35, -1, -1);
    MEMORY[0x24957C430](v12, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
  }
  else
  {
    v19 = v0[20];
    v20 = v0[21];
    v21 = v0[19];
    v22 = v0[16];
    sub_247481D48(v0[18], &qword_2576A5E80);
    sub_247481D48(v22, (uint64_t *)&unk_2576A65B0);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
  }
  v31 = (_QWORD *)swift_task_alloc();
  v0[23] = v31;
  *v31 = v0;
  v31[1] = sub_2474807C8;
  return sub_2474809F8(v0[8], v0[9], v0[10]);
}

uint64_t sub_2474807C8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24748081C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v9;

  sub_247481CC8(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 88));
  v1 = sub_247488274();
  v2 = sub_247488418();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = *(_QWORD *)(v0 + 88);
    v4 = swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136315394;
    *(_QWORD *)(v0 + 32) = sub_247473DB8(0xD000000000000017, 0x800000024748B020, &v9);
    sub_247488478();
    *(_WORD *)(v4 + 12) = 2080;
    sub_24747C40C();
    *(_QWORD *)(v0 + 40) = sub_247473DB8(v6, v7, &v9);
    sub_247488478();
    swift_bridgeObjectRelease();
    sub_247481D0C(v3);
    _os_log_impl(&dword_247463000, v1, v2, "Ended CarPlaySegment.%s -> %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v5, -1, -1);
    MEMORY[0x24957C430](v4, -1, -1);
  }
  else
  {
    sub_247481D0C(*(_QWORD *)(v0 + 88));
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2474809F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65A0);
  v3[5] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60D8);
  v3[6] = swift_task_alloc();
  v4 = sub_2474880AC();
  v3[7] = v4;
  v3[8] = *(_QWORD *)(v4 - 8);
  v3[9] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v3[10] = v5;
  v3[11] = *(_QWORD *)(v5 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5E80);
  v3[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247480B20()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = v0[17];
  v2 = v0[15];
  sub_24747855C(v0[4], v1);
  v3 = objc_msgSend((id)BiomeLibrary(), sel_CarPlay);
  swift_unknownObjectRelease();
  v4 = objc_msgSend(v3, sel_Connected);
  swift_unknownObjectRelease();
  sub_247478FC8(v4, v1, (uint64_t)sub_247481C30, 0, v2);

  v5 = (_QWORD *)swift_task_alloc();
  v0[18] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_247480C2C;
  v6 = v0[17];
  v7 = v0[14];
  v5[3] = v7;
  v8 = (_QWORD *)swift_task_alloc();
  v5[4] = v8;
  *v8 = v5;
  v8[1] = sub_2474810E8;
  return sub_247481348(v7, v6);
}

uint64_t sub_247480C2C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_247480C80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t SeenResult;
  char v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 88);
  v39 = *(_QWORD *)(v0 + 64);
  v40 = *(_QWORD *)(v0 + 56);
  v6 = *(_QWORD *)(v0 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A68B0);
  v7 = *(_QWORD *)(v5 + 72);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_247489FA0;
  sub_247481C84(v6, v9 + v8, (uint64_t *)&unk_2576A65B0);
  sub_247481C84(v2, v9 + v8 + v7, (uint64_t *)&unk_2576A65B0);
  sub_24747FFDC(v1, v9, v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_247481C84(v4, v3, (uint64_t *)&unk_2576A65B0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v3, 1, v40) == 1)
  {
    v10 = *(_QWORD *)(v0 + 136);
    v12 = *(_QWORD *)(v0 + 112);
    v11 = *(_QWORD *)(v0 + 120);
    v13 = *(_QWORD *)(v0 + 96);
    sub_247481D48(*(_QWORD *)(v0 + 104), (uint64_t *)&unk_2576A65B0);
    sub_247481D48(v12, (uint64_t *)&unk_2576A65B0);
    sub_247481D48(v11, (uint64_t *)&unk_2576A65B0);
    sub_247481D48(v10, &qword_2576A5E80);
    sub_247481D48(v13, (uint64_t *)&unk_2576A65B0);
    v27 = *(_QWORD *)(v0 + 32);
    v28 = *(_QWORD *)(v0 + 16);
    SeenResult = type metadata accessor for SegmentFlagLastSeenResult();
    sub_247481C84(v27, v28 + *(int *)(SeenResult + 20), (uint64_t *)&unk_2576A65B0);
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 128);
    v15 = *(_QWORD *)(v0 + 48);
    v16 = *(_QWORD *)(v0 + 40);
    v17 = *(_QWORD *)(v0 + 24);
    v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 64) + 32);
    v18(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 56));
    v19 = v17 + *(int *)(v14 + 36);
    v20 = sub_2474880C4();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v15, 1, 1, v20);
    v21 = sub_247488160();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v16, 1, 1, v21);
    v22 = sub_247481F14(v19, v15, v16);
    v23 = *(_QWORD *)(v0 + 136);
    v25 = *(_QWORD *)(v0 + 112);
    v24 = *(_QWORD *)(v0 + 120);
    v26 = *(_QWORD *)(v0 + 104);
    v32 = *(_QWORD *)(v0 + 48);
    sub_247481D48(*(_QWORD *)(v0 + 40), (uint64_t *)&unk_2576A65A0);
    sub_247481D48(v32, &qword_2576A60D8);
    sub_247481D48(v26, (uint64_t *)&unk_2576A65B0);
    sub_247481D48(v25, (uint64_t *)&unk_2576A65B0);
    sub_247481D48(v24, (uint64_t *)&unk_2576A65B0);
    sub_247481D48(v23, &qword_2576A5E80);
    v34 = *(_QWORD *)(v0 + 64);
    v33 = *(_QWORD *)(v0 + 72);
    v35 = *(_QWORD *)(v0 + 56);
    v36 = *(_QWORD *)(v0 + 16);
    if ((uint64_t)v22 <= 29)
    {
      v37 = v36 + *(int *)(type metadata accessor for SegmentFlagLastSeenResult() + 20);
      v18(v37, v33, v35);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v34 + 56))(v37, 0, 1, v35);
      v30 = 2;
      goto LABEL_5;
    }
    (*(void (**)(_QWORD, _QWORD))(v34 + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
    v38 = type metadata accessor for SegmentFlagLastSeenResult();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v36 + *(int *)(v38 + 20), 1, 1, v35);
  }
  v30 = 7;
LABEL_5:
  **(_BYTE **)(v0 + 16) = v30;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24748108C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  *(_QWORD *)(v2 + 24) = a1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 32) = v5;
  *v5 = v2;
  v5[1] = sub_2474810E8;
  return sub_247481348(a1, a2);
}

uint64_t sub_2474810E8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_247481154()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (qword_254448180 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 40);
  v2 = sub_24748828C();
  __swift_project_value_buffer(v2, (uint64_t)qword_254448188);
  MEMORY[0x24957C2F8](v1);
  MEMORY[0x24957C2F8](v1);
  v3 = sub_247488274();
  v4 = sub_247488424();
  v5 = os_log_type_enabled(v3, v4);
  v6 = *(void **)(v0 + 40);
  if (v5)
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    MEMORY[0x24957C2F8](v6);
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v9;
    sub_247488478();
    *v8 = v9;

    _os_log_impl(&dword_247463000, v3, v4, "Failed to check SELF events for Siri in car use: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60D0);
    swift_arrayDestroy();
    MEMORY[0x24957C430](v8, -1, -1);
    MEMORY[0x24957C430](v7, -1, -1);

  }
  else
  {

  }
  v10 = *(_QWORD *)(v0 + 24);
  v11 = sub_2474880AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247481348(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[13] = a1;
  v2[14] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A68C0);
  v2[15] = v3;
  v2[16] = *(_QWORD *)(v3 - 8);
  v2[17] = swift_task_alloc();
  v2[18] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A68C8);
  v2[21] = v4;
  v2[22] = *(_QWORD *)(v4 - 8);
  v2[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_247481410()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  sub_247488244();
  v1 = sub_247481DCC(0, &qword_2576A68D0);
  sub_247481C38();
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_2474896A0;
  v3 = sub_247481DCC(0, &qword_2576A68D8);
  v0[24] = v3;
  *(_QWORD *)(v2 + 32) = v3;
  v4 = MEMORY[0x24957BC20](v1, v2);
  v0[25] = v4;
  swift_bridgeObjectRelease();
  v5 = (_QWORD *)swift_task_alloc();
  v0[26] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_247481500;
  return sub_247468E64(v0[23], v4, v0[14]);
}

uint64_t sub_247481500()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 216) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_247481564()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v4;

  v1 = v0[20];
  v2 = sub_2474880AC();
  v0[28] = v2;
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56);
  v0[29] = v3;
  v3(v1, 1, 1, v2);
  sub_2474883DC();
  v0[30] = 0;
  v0[31] = 0;
  v4 = (_QWORD *)swift_task_alloc();
  v0[32] = v4;
  *v4 = v0;
  v4[1] = sub_247481620;
  return sub_2474883E8();
}

uint64_t sub_247481620()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_247481674()
{
  char *v0;
  uint64_t v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  void (*v16)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t result;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  char *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v3 = *(void **)(v1 + 88);
  if (!v3)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 128) + 8))(*(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 120));
    if (qword_254448180 == -1)
    {
LABEL_19:
      v20 = sub_24748828C();
      __swift_project_value_buffer(v20, (uint64_t)qword_254448188);
      v21 = sub_247488274();
      v22 = sub_247488418();
      if (os_log_type_enabled(v21, v22))
      {
        v36 = *(_QWORD *)(v1 + 248);
        v45 = *(_QWORD *)(v1 + 184);
        v38 = *(void **)(v1 + 200);
        v40 = *(_QWORD *)(v1 + 176);
        v23 = *(_QWORD *)(v1 + 160);
        v42 = *(_QWORD *)(v1 + 168);
        v24 = *(_QWORD *)(v1 + 152);
        v37 = *(_QWORD *)(v1 + 240);
        v25 = swift_slowAlloc();
        v26 = swift_slowAlloc();
        v46 = v26;
        *(_DWORD *)v25 = 136315906;
        *(_QWORD *)(v1 + 64) = sub_247473DB8(0xD00000000000001ELL, 0x800000024748B040, &v46);
        sub_247488478();
        *(_WORD *)(v25 + 12) = 2048;
        *(_QWORD *)(v1 + 72) = v36;
        sub_247488478();
        *(_WORD *)(v25 + 22) = 2048;
        *(_QWORD *)(v1 + 80) = v37;
        sub_247488478();
        *(_WORD *)(v25 + 32) = 2080;
        swift_beginAccess();
        sub_247481C84(v23, v24, (uint64_t *)&unk_2576A65B0);
        v27 = sub_247488328();
        *(_QWORD *)(v1 + 96) = sub_247473DB8(v27, v28, &v46);
        sub_247488478();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_247463000, v21, v22, "%s Scanned %ld turns; %ld MHAssistantDaemonAudioBluetoothInfo events; result %s",
          (uint8_t *)v25,
          0x2Au);
        swift_arrayDestroy();
        MEMORY[0x24957C430](v26, -1, -1);
        MEMORY[0x24957C430](v25, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v45, v42);
      }
      else
      {
        v30 = *(_QWORD *)(v1 + 176);
        v29 = *(_QWORD *)(v1 + 184);
        v31 = *(_QWORD *)(v1 + 168);

        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
      }
      v32 = *(_QWORD *)(v1 + 160);
      v33 = *(_QWORD *)(v1 + 104);
      swift_beginAccess();
      sub_247481C84(v32, v33, (uint64_t *)&unk_2576A65B0);
      sub_247481D48(v32, (uint64_t *)&unk_2576A65B0);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v1 + 8))();
    }
LABEL_30:
    swift_once();
    goto LABEL_19;
  }
  v4 = *(_QWORD *)(v1 + 248);
  v5 = v4 + 1;
  if (__OFADD__(v4, 1))
    goto LABEL_24;
  v2 = sub_247488208();
  v0 = *(char **)(v1 + 240);
  v43 = (_QWORD *)v1;
  v44 = v5;
  v41 = v3;
  if (v2 >> 62)
  {
LABEL_25:
    result = sub_24748852C();
    if (__OFADD__(v0, result))
    {
      __break(1u);
      return result;
    }
    v39 = &v0[result];
    swift_bridgeObjectRetain();
    v6 = sub_24748852C();
    if (v6)
      goto LABEL_6;
    goto LABEL_27;
  }
  v6 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (__OFADD__(v0, v6))
  {
    __break(1u);
    goto LABEL_30;
  }
  v39 = &v0[v6];
  swift_bridgeObjectRetain();
  if (v6)
  {
LABEL_6:
    v7 = 0;
    while (1)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x24957BECC](v7, v2);
      else
        v8 = *(id *)(v2 + 8 * v7 + 32);
      v9 = v8;
      v10 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
LABEL_24:
        __break(1u);
        goto LABEL_25;
      }
      sub_247481DCC(0, &qword_2576A68E0);
      v11 = sub_247488190();
      if (!v11)
        goto LABEL_8;
      v12 = (void *)v11;
      objc_opt_self();
      v13 = (void *)swift_dynamicCastObjCClass();
      if (!v13)
        break;
      v0 = (char *)objc_msgSend(v13, sel_bluetoothAudioDeviceCategory);

      if ((_DWORD)v0 == 2)
      {
        v14 = v43;
        v15 = v43[28];
        v16 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v43[29];
        v18 = v43[19];
        v17 = v43[20];
        swift_bridgeObjectRelease_n();
        v19 = v41;
        sub_2474881FC();

        v16(v18, 0, 1, v15);
        sub_24747A694(v18, v17);
        goto LABEL_28;
      }
LABEL_9:
      ++v7;
      if (v10 == v6)
        goto LABEL_27;
    }

LABEL_8:
    goto LABEL_9;
  }
LABEL_27:

  swift_bridgeObjectRelease_n();
  v14 = v43;
LABEL_28:
  v14[30] = v39;
  v14[31] = v44;
  v35 = (_QWORD *)swift_task_alloc();
  v14[32] = v35;
  *v35 = v14;
  v35[1] = sub_247481620;
  return sub_2474883E8();
}

uint64_t sub_247481BC8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_247481C30()
{
  return 1;
}

uint64_t sub_247481C38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A68E8);
  if (swift_isClassType())
    v1 = v0;
  else
    v1 = 0;
  if (v1)
    v2 = (uint64_t *)&unk_2576A68F8;
  else
    v2 = (uint64_t *)&unk_2576A68F0;
  return __swift_instantiateConcreteTypeFromMangledName(v2);
}

uint64_t sub_247481C84(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247481CC8(uint64_t a1, uint64_t a2)
{
  uint64_t SeenResult;

  SeenResult = type metadata accessor for SegmentFlagLastSeenResult();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(SeenResult - 8) + 16))(a2, a1, SeenResult);
  return a2;
}

uint64_t sub_247481D0C(uint64_t a1)
{
  uint64_t SeenResult;

  SeenResult = type metadata accessor for SegmentFlagLastSeenResult();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(SeenResult - 8) + 8))(a1, SeenResult);
  return a1;
}

uint64_t sub_247481D48(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247481D84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_247481DCC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_247481E08()
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

uint64_t sub_247481E78()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88));
  return v0;
}

uint64_t sub_247481EA4()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Reference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Reference);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24957C31C](a1, v6, a5);
}

void (*sub_247481F14(uint64_t a1, uint64_t a2, uint64_t a3))(char *, uint64_t)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  void (*v43)(char *, uint64_t);
  void (*v44)(char *, uint64_t);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;

  v60 = a3;
  v63 = a2;
  v64 = a1;
  v3 = sub_247487F2C();
  v65 = *(_QWORD *)(v3 - 8);
  v66 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v68 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65A0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_247488160();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v59 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v58 = (char *)&v57 - v12;
  v13 = sub_2474880C4();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v61 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60D8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6988);
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v57 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_247488148();
  v67 = *(_QWORD *)(v22 - 8);
  v23 = MEMORY[0x24BDAC7A8](v22);
  v69 = (char *)&v57 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v70 = (char *)&v57 - v25;
  sub_247482BEC(v63, (uint64_t)v18, &qword_2576A60D8);
  v62 = v14;
  v63 = v13;
  v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  v27 = 1;
  if (v26(v18, 1, v13) != 1)
  {
    v29 = v62;
    v28 = v63;
    v30 = v61;
    (*(void (**)(char *, char *, uint64_t))(v62 + 32))(v61, v18, v63);
    sub_2474880D0();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v28);
    v27 = 0;
  }
  v31 = v67;
  v32 = v22;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v67 + 56))(v21, v27, 1, v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v21, 1, v22) == 1)
  {
    v33 = v70;
    sub_247488124();
    sub_247482C30((uint64_t)v21, &qword_2576A6988);
  }
  else
  {
    v33 = v70;
    (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v70, v21, v22);
  }
  v35 = v68;
  v34 = v69;
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v69, v33, v22);
  sub_247482BEC(v60, (uint64_t)v7, (uint64_t *)&unk_2576A65A0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_247482C30((uint64_t)v7, (uint64_t *)&unk_2576A65A0);
  }
  else
  {
    v36 = v58;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v58, v7, v8);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v59, v36, v8);
    sub_247488130();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v36, v8);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6078);
  v37 = sub_24748813C();
  v38 = *(_QWORD *)(v37 - 8);
  v39 = (*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
  v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_2474896A0;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v38 + 104))(v40 + v39, *MEMORY[0x24BDCF220], v37);
  sub_24746C9C8(v40);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_2474880F4();
  swift_bridgeObjectRelease();
  v41 = sub_247487EF0();
  if ((v42 & 1) != 0)
  {
    v71 = 0;
    v72 = 0xE000000000000000;
    sub_2474884C0();
    sub_247488340();
    sub_2474880AC();
    sub_247482C6C();
    sub_2474885B0();
    sub_247488340();
    swift_bridgeObjectRelease();
    sub_247488340();
    sub_2474885B0();
    sub_247488340();
    swift_bridgeObjectRelease();
    sub_247488340();
    v45 = v61;
    sub_2474880DC();
    v46 = v63;
    sub_247488514();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v45, v46);
    v47 = v71;
    v48 = v72;
    if (qword_254448180 != -1)
      swift_once();
    v49 = sub_24748828C();
    __swift_project_value_buffer(v49, (uint64_t)qword_254448188);
    swift_bridgeObjectRetain_n();
    v50 = sub_247488274();
    v51 = sub_247488424();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc();
      v53 = swift_slowAlloc();
      v71 = v53;
      *(_DWORD *)v52 = 136315138;
      swift_bridgeObjectRetain();
      v73 = sub_247473DB8(v47, v48, &v71);
      v31 = v67;
      sub_247488478();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_247463000, v50, v51, "%s", v52, 0xCu);
      swift_arrayDestroy();
      v54 = v53;
      v35 = v68;
      MEMORY[0x24957C430](v54, -1, -1);
      MEMORY[0x24957C430](v52, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_247482B6C();
    swift_allocError();
    *v55 = v47;
    v55[1] = v48;
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v35, v66);
    v43 = *(void (**)(char *, uint64_t))(v31 + 8);
    v43(v69, v32);
    v43(v70, v32);
  }
  else
  {
    v43 = (void (*)(char *, uint64_t))v41;
    (*(void (**)(char *, uint64_t))(v65 + 8))(v35, v66);
    v44 = *(void (**)(char *, uint64_t))(v31 + 8);
    v44(v34, v32);
    v44(v70, v32);
  }
  return v43;
}

uint64_t sub_2474826B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;

  v30 = a2;
  v3 = sub_247488064();
  v33 = *(_QWORD *)(v3 - 8);
  v34 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v32 = (uint64_t)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2474880C4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_247488148();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BDCEF70], v8);
  sub_2474880D0();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_24748810C();
  v16 = sub_2474880AC();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v7, 1, v16) == 1)
  {
    v30 = v13;
    v31 = v12;
    sub_247482C30((uint64_t)v7, (uint64_t *)&unk_2576A65B0);
    v35 = 0;
    v36 = 0xE000000000000000;
    sub_2474884C0();
    sub_247488340();
    sub_24748813C();
    sub_247488514();
    sub_247488340();
    v37 = a1;
    sub_2474885B0();
    sub_247488340();
    swift_bridgeObjectRelease();
    sub_247488340();
    v18 = v32;
    sub_247483094(v32);
    sub_24748801C();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v18, v34);
    sub_247488340();
    swift_bridgeObjectRelease();
    sub_247488340();
    v19 = v35;
    v20 = v36;
    if (qword_254448180 != -1)
      swift_once();
    v21 = sub_24748828C();
    __swift_project_value_buffer(v21, (uint64_t)qword_254448188);
    swift_bridgeObjectRetain_n();
    v22 = sub_247488274();
    v23 = sub_247488424();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v35 = v25;
      *(_DWORD *)v24 = 136315138;
      swift_bridgeObjectRetain();
      v37 = sub_247473DB8(v19, v20, &v35);
      sub_247488478();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_247463000, v22, v23, "%s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24957C430](v25, -1, -1);
      MEMORY[0x24957C430](v24, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v28 = v30;
    v27 = v31;
    sub_247482B6C();
    swift_allocError();
    *v29 = v19;
    v29[1] = v20;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v15, v27);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v30, v7, v16);
  }
}

unint64_t sub_247482B6C()
{
  unint64_t result;

  result = qword_2576A6980;
  if (!qword_2576A6980)
  {
    result = MEMORY[0x24957C370](&unk_24748A14C, &_s17CalendarDateErrorVN);
    atomic_store(result, (unint64_t *)&qword_2576A6980);
  }
  return result;
}

uint64_t sub_247482BC0()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_247482BEC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_247482C30(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_247482C6C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576A6090;
  if (!qword_2576A6090)
  {
    v1 = sub_2474880AC();
    result = MEMORY[0x24957C370](MEMORY[0x24BDCE988], v1);
    atomic_store(result, (unint64_t *)&qword_2576A6090);
  }
  return result;
}

_QWORD *_s17CalendarDateErrorVwCP(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s17CalendarDateErrorVwxx()
{
  return swift_bridgeObjectRelease();
}

_QWORD *_s17CalendarDateErrorVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *_s17CalendarDateErrorVwta(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s17CalendarDateErrorVwet(uint64_t a1, int a2)
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

uint64_t _s17CalendarDateErrorVwst(uint64_t result, int a2, int a3)
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

ValueMetadata *_s17CalendarDateErrorVMa()
{
  return &_s17CalendarDateErrorVN;
}

void sub_247482DF0(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    if (qword_254448180 != -1)
      swift_once();
    v2 = sub_24748828C();
    __swift_project_value_buffer(v2, (uint64_t)qword_254448188);
    v9 = a1;
    v3 = sub_247488274();
    v4 = sub_247488424();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = swift_slowAlloc();
      v6 = (_QWORD *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v10[0] = v7;
      *(_DWORD *)v5 = 136315394;
      sub_247473DB8(0xD000000000000027, 0x800000024748AE60, v10);
      sub_247488478();
      *(_WORD *)(v5 + 12) = 2112;
      if (objc_msgSend(v9, sel_error))
      {
        v8 = _swift_stdlib_bridgeErrorToNSError();
        sub_247488478();
      }
      else
      {
        sub_247488478();
        v8 = 0;
      }
      *v6 = v8;

      _os_log_impl(&dword_247463000, v3, v4, "%s Failure during Biome sink: %@", (uint8_t *)v5, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60D0);
      swift_arrayDestroy();
      MEMORY[0x24957C430](v6, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24957C430](v7, -1, -1);
      MEMORY[0x24957C430](v5, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_247483094@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, _QWORD, uint64_t);
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v26 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65A0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_247488160();
  v27 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v25 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_247488058();
  v5 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_247488040();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_247488028();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_247488034();
  MEMORY[0x24BDAC7A8](v16);
  (*(void (**)(char *, _QWORD))(v18 + 104))((char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x24BDCE368]);
  v19 = v12;
  v20 = v27;
  (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BDCE348], v19);
  v21 = *(void (**)(char *, _QWORD, uint64_t))(v9 + 104);
  v22 = v29;
  v21(v11, *MEMORY[0x24BDCE388], v8);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDCE3D0], v28);
  sub_247488154();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v3, 1, v22);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v25, v3, v22);
    return sub_24748804C();
  }
  return result;
}

uint64_t sub_247483308@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t EnablementStatus;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  unsigned int (*v38)(char *, uint64_t, uint64_t);
  void (*v39)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int *v69;

  v63 = a8;
  v66 = a7;
  v67 = a5;
  v58 = a6;
  v65 = a4;
  v54 = a2;
  EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  v60 = *(_QWORD *)(EnablementStatus - 8);
  v61 = EnablementStatus;
  MEMORY[0x24BDAC7A8](EnablementStatus);
  v62 = (uint64_t)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2474880AC();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v54 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v56 = (uint64_t)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v57 = (char *)&v54 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v55 = (uint64_t)&v54 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v64 = (char *)&v54 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v54 - v28;
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)&v54 - v31;
  v33 = MEMORY[0x24BDAC7A8](v30);
  v35 = (char *)&v54 - v34;
  MEMORY[0x24BDAC7A8](v33);
  v37 = (char *)&v54 - v36;
  *(_BYTE *)a9 = *a1;
  v69 = (int *)type metadata accessor for SegmentsSummary();
  v59 = a3;
  sub_247488010();
  sub_247488004();
  v68 = a9;
  *(_QWORD *)(a9 + 8) = v54;
  sub_24746BD5C(v65, (uint64_t)v35);
  v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
  if (v38(v35, 1, v14) == 1)
  {
    v39 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    v39(v37, 1, 1, v14);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v35, v14);
    sub_247488010();
    sub_247488004();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    v39 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
    v39(v37, 0, 1, v14);
  }
  sub_247481D84((uint64_t)v37, v68 + v69[7]);
  sub_24746BD5C(v67, (uint64_t)v29);
  v40 = 1;
  if (v38(v29, 1, v14) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v29, v14);
    sub_247488010();
    sub_247488004();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    v40 = 0;
  }
  v41 = 1;
  v39(v32, v40, 1, v14);
  v42 = v68;
  sub_247481D84((uint64_t)v32, v68 + v69[8]);
  v43 = v58;
  v44 = v55;
  sub_24746BD5C(v58, v55);
  if (v38((char *)v44, 1, v14) != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v17, v44, v14);
    sub_247488010();
    sub_247488004();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    v41 = 0;
  }
  v45 = 1;
  v46 = (uint64_t)v64;
  v39(v64, v41, 1, v14);
  sub_247481D84(v46, v42 + v69[9]);
  v47 = v56;
  sub_24746BD5C(v66, v56);
  v48 = v38((char *)v47, 1, v14);
  v49 = (uint64_t)v57;
  if (v48 != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v17, v47, v14);
    sub_247488010();
    sub_247488004();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    v45 = 0;
  }
  v39((char *)v49, v45, 1, v14);
  sub_247487E6C(v66, (uint64_t *)&unk_2576A65B0);
  sub_247487E6C(v43, (uint64_t *)&unk_2576A65B0);
  sub_247487E6C(v67, (uint64_t *)&unk_2576A65B0);
  sub_247487E6C(v65, (uint64_t *)&unk_2576A65B0);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v59, v14);
  sub_247481D84(v49, v42 + v69[10]);
  v50 = v63;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v60 + 48))(v63, 1, v61) == 1)
  {
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
    v52 = v62;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v62, 1, 3, v51);
    sub_247487E6C(v50, &qword_2576A60C0);
  }
  else
  {
    v52 = v62;
    sub_2474682C4(v50, v62);
  }
  return sub_2474682C4(v52, v42 + v69[11]);
}

void SegmentsSummary.activitySegment.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t SegmentsSummary.segmentFlags.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SegmentsSummary.membershipCheckedAt.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SegmentsSummary() + 24);
  v4 = sub_2474880AC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for SegmentsSummary()
{
  uint64_t result;

  result = qword_254448018;
  if (!qword_254448018)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SegmentsSummary.init(activitySegment:segmentFlags:at:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t EnablementStatus;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;

  v29 = a4;
  v30 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A60C0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v28 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v28 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v28 - v19;
  v21 = sub_2474880AC();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v28 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = *a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v24, a3, v21);
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v22 + 56);
  v25(v20, 1, 1, v21);
  v25(v18, 1, 1, v21);
  v25(v15, 1, 1, v21);
  v25(v12, 1, 1, v21);
  EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(EnablementStatus - 8) + 56))(v8, 1, 1, EnablementStatus);
  sub_247483308(&v31, v30, (uint64_t)v24, (uint64_t)v20, (uint64_t)v18, (uint64_t)v15, (uint64_t)v12, (uint64_t)v8, v29);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(a3, v21);
}

void SegmentsSummary.description.getter()
{
  unsigned __int8 *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[12];

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v12[5] = (char *)v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v12[4] = (char *)v12 - v5;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v12[3] = (char *)v12 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v12 - v8;
  v10 = sub_247488064();
  MEMORY[0x24BDAC7A8](v10);
  v12[10] = 0;
  v12[11] = 0xE000000000000000;
  sub_2474884C0();
  sub_247488340();
  v11 = *v0;
  v12[1] = v9;
  __asm { BR              X10 }
}

uint64_t sub_247483C5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  sub_247488340();
  swift_bridgeObjectRelease();
  sub_247488340();
  v5 = swift_bridgeObjectRetain();
  v6 = sub_247484178(v5);
  swift_bridgeObjectRelease();
  MEMORY[0x24957BD64](v6, MEMORY[0x24BEE0D00]);
  sub_247488340();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_247488340();
  v7 = (int *)type metadata accessor for SegmentsSummary();
  sub_247483094(v1);
  sub_24748801C();
  v8 = v0;
  v9 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v9(v1, v3);
  sub_247488340();
  swift_bridgeObjectRelease();
  sub_247488340();
  v10 = v7[7];
  *(_QWORD *)(v4 - 160) = v8;
  v11 = *(_QWORD *)(v4 - 168);
  sub_24746BD5C(v8 + v10, v11);
  v12 = sub_2474880AC();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v11, 1, v12);
  *(_QWORD *)(v4 - 128) = v9;
  *(_QWORD *)(v4 - 120) = v3;
  if (v15 == 1)
  {
    sub_247487E6C(v11, (uint64_t *)&unk_2576A65B0);
  }
  else
  {
    sub_247483094(v1);
    sub_24748801C();
    v9(v1, v3);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  }
  sub_247488340();
  swift_bridgeObjectRelease();
  sub_247488340();
  v16 = *(_QWORD *)(v4 - 160);
  v17 = *(_QWORD *)(v4 - 152);
  sub_24746BD5C(v16 + v7[8], v17);
  v18 = v14(v17, 1, v12);
  v19 = *(_QWORD *)(v4 - 144);
  if (v18 == 1)
  {
    sub_247487E6C(v17, (uint64_t *)&unk_2576A65B0);
  }
  else
  {
    sub_247483094(v1);
    sub_24748801C();
    (*(void (**)(uint64_t, _QWORD))(v4 - 128))(v1, *(_QWORD *)(v4 - 120));
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v17, v12);
  }
  sub_247488340();
  swift_bridgeObjectRelease();
  sub_247488340();
  sub_24746BD5C(v16 + v7[9], v19);
  if (v14(v19, 1, v12) == 1)
  {
    sub_247487E6C(v19, (uint64_t *)&unk_2576A65B0);
  }
  else
  {
    sub_247483094(v1);
    sub_24748801C();
    (*(void (**)(uint64_t, _QWORD))(v4 - 128))(v1, *(_QWORD *)(v4 - 120));
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v19, v12);
  }
  sub_247488340();
  swift_bridgeObjectRelease();
  sub_247488340();
  v20 = *(_QWORD *)(v4 - 136);
  sub_24746BD5C(v16 + v7[10], v20);
  if (v14(v20, 1, v12) == 1)
  {
    sub_247487E6C(v20, (uint64_t *)&unk_2576A65B0);
  }
  else
  {
    sub_247483094(v1);
    sub_24748801C();
    (*(void (**)(uint64_t, _QWORD))(v4 - 128))(v1, *(_QWORD *)(v4 - 120));
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v20, v12);
  }
  sub_247488340();
  swift_bridgeObjectRelease();
  sub_247488340();
  sub_247467000();
  sub_247488340();
  swift_bridgeObjectRelease();
  sub_247488340();
  return *(_QWORD *)(v4 - 96);
}

uint64_t sub_247484178(uint64_t a1)
{
  int64_t v1;
  uint64_t v3;
  int v4;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_247485460(0, v1, 0);
    v3 = sub_2474855E4(a1);
    if (v3 < 0 || v3 >= 1 << *(_BYTE *)(a1 + 32))
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a1 + 56 + (((unint64_t)v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    {
      if (*(_DWORD *)(a1 + 36) == v4)
        __asm { BR              X9 }
LABEL_10:
      __break(1u);
      JUMPOUT(0x2474843C0);
    }
    __break(1u);
    goto LABEL_10;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_2474843E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;

  if (a1 != a2)
  {
    if (*(_QWORD *)(a1 + 16) != *(_QWORD *)(a2 + 16))
      return 0;
    v3 = *(_QWORD *)(a1 + 56);
    v4 = 1 << *(_BYTE *)(a1 + 32);
    if (v4 < 64)
      v5 = ~(-1 << v4);
    else
      v5 = -1;
    v13 = (unint64_t)(v4 + 63) >> 6;
    if ((v5 & v3) != 0)
    {
      v6 = __clz(__rbit64(v5 & v3));
      goto LABEL_23;
    }
    if ((unint64_t)(v4 + 63) >> 6 > 1)
    {
      v7 = *(_QWORD *)(a1 + 64);
      v8 = 1;
      if (v7)
        goto LABEL_22;
      v8 = 2;
      if (v13 <= 2)
        return 1;
      v7 = *(_QWORD *)(a1 + 72);
      if (v7)
        goto LABEL_22;
      v8 = 3;
      if (v13 <= 3)
        return 1;
      v7 = *(_QWORD *)(a1 + 80);
      if (v7)
        goto LABEL_22;
      v8 = 4;
      if (v13 <= 4)
        return 1;
      v7 = *(_QWORD *)(a1 + 88);
      if (v7)
      {
LABEL_22:
        v6 = __clz(__rbit64(v7)) + (v8 << 6);
LABEL_23:
        sub_24747A8BC(*(_QWORD *)(a2 + 40), *(_BYTE *)(*(_QWORD *)(a1 + 48) + v6));
        v11 = v10 & ~(-1 << *(_BYTE *)(a2 + 32));
        if (((*(_QWORD *)(a2 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
          __asm { BR              X9 }
        return 0;
      }
      v9 = 5;
      if (v13 > 5)
      {
        v7 = *(_QWORD *)(a1 + 96);
        if (v7)
        {
          v8 = 5;
          goto LABEL_22;
        }
        while (1)
        {
          v8 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            JUMPOUT(0x247484800);
          }
          if (v8 >= v13)
            break;
          v7 = *(_QWORD *)(a1 + 56 + 8 * v8);
          ++v9;
          if (v7)
            goto LABEL_22;
        }
      }
    }
  }
  return 1;
}

uint64_t sub_247484838(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_247484870 + 4 * byte_24748A19B[a1]))(0xD000000000000013, 0x800000024748B200);
}

uint64_t sub_247484870()
{
  return 0x7974697669746361;
}

uint64_t sub_247484894()
{
  return 0x46746E656D676573;
}

BOOL sub_247484904(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_247484918()
{
  sub_247488604();
  sub_247488610();
  return sub_24748861C();
}

uint64_t sub_24748495C()
{
  return sub_247488610();
}

uint64_t sub_247484984()
{
  sub_247488604();
  sub_247488610();
  return sub_24748861C();
}

uint64_t sub_2474849C4()
{
  unsigned __int8 *v0;

  return sub_247484838(*v0);
}

uint64_t sub_2474849CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_247487B00(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2474849F0()
{
  return 0;
}

void sub_2474849FC(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_247484A08()
{
  sub_247486200();
  return sub_247488640();
}

uint64_t sub_247484A30()
{
  sub_247486200();
  return sub_24748864C();
}

uint64_t SegmentsSummary.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6990);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247486200();
  sub_247488634();
  LOBYTE(v11) = *(_BYTE *)v3;
  v12 = 0;
  sub_247486244();
  sub_2474885A4();
  if (!v2)
  {
    v11 = *(_QWORD *)(v3 + 8);
    v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A69A8);
    sub_247486310(&qword_2576A69B0, (uint64_t (*)(void))sub_247486288, MEMORY[0x24BEE1700]);
    sub_2474885A4();
    type metadata accessor for SegmentsSummary();
    LOBYTE(v11) = 2;
    sub_2474880AC();
    sub_247487E1C(&qword_2576A5DB0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_2474885A4();
    LOBYTE(v11) = 3;
    sub_247488598();
    LOBYTE(v11) = 4;
    sub_247488598();
    LOBYTE(v11) = 5;
    sub_247488598();
    LOBYTE(v11) = 6;
    sub_247488598();
    LOBYTE(v11) = 7;
    type metadata accessor for SiriFirstEnablementStatus();
    sub_247487E1C(&qword_2576A69C0, (uint64_t (*)(uint64_t))type metadata accessor for SiriFirstEnablementStatus, (uint64_t)&unk_247488F84);
    sub_2474885A4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t SegmentsSummary.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v34[2];
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t EnablementStatus;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;

  v38 = a2;
  EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
  MEMORY[0x24BDAC7A8](EnablementStatus);
  v39 = (char *)v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v40 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v41 = (char *)v34 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v34 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v34 - v12;
  v14 = sub_2474880AC();
  v44 = *(_QWORD *)(v14 - 8);
  v45 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A69C8);
  v17 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v19 = (char *)v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = type metadata accessor for SegmentsSummary();
  MEMORY[0x24BDAC7A8](v48);
  v46 = a1;
  v47 = (char *)v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_247486200();
  v21 = v49;
  sub_247488628();
  if (v21)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v46);
  v36 = v13;
  v37 = v16;
  v35 = v11;
  v49 = v17;
  v51 = 0;
  sub_2474862CC();
  sub_247488574();
  v22 = (uint64_t)v47;
  *v47 = v50;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A69A8);
  v51 = 1;
  sub_247486310(&qword_2576A69D8, (uint64_t (*)(void))sub_247486378, MEMORY[0x24BEE1720]);
  sub_247488574();
  v23 = (int *)v48;
  *(_QWORD *)(v22 + 8) = v50;
  LOBYTE(v50) = 2;
  v24 = sub_247487E1C(&qword_2576A5DF8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
  v25 = v37;
  v26 = v45;
  v34[1] = v24;
  sub_247488574();
  (*(void (**)(uint64_t, char *, uint64_t))(v44 + 32))(v22 + v23[6], v25, v26);
  LOBYTE(v50) = 3;
  v27 = (uint64_t)v36;
  sub_247488568();
  sub_247481D84(v27, v22 + v23[7]);
  LOBYTE(v50) = 4;
  v28 = (uint64_t)v35;
  sub_247488568();
  v29 = (uint64_t)v46;
  sub_247481D84(v28, v22 + v23[8]);
  LOBYTE(v50) = 5;
  v30 = (uint64_t)v41;
  sub_247488568();
  sub_247481D84(v30, v22 + v23[9]);
  LOBYTE(v50) = 6;
  v31 = (uint64_t)v40;
  sub_247488568();
  sub_247481D84(v31, v22 + v23[10]);
  LOBYTE(v50) = 7;
  sub_247487E1C(&qword_2576A69E8, (uint64_t (*)(uint64_t))type metadata accessor for SiriFirstEnablementStatus, (uint64_t)&unk_247488F5C);
  v32 = (uint64_t)v39;
  sub_247488574();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v19, v43);
  sub_2474682C4(v32, v22 + v23[11]);
  sub_2474863BC(v22, v38);
  __swift_destroy_boxed_opaque_existential_1(v29);
  return sub_247486400(v22);
}

uint64_t sub_247485430@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SegmentsSummary.init(from:)(a1, a2);
}

uint64_t sub_247485444(_QWORD *a1)
{
  return SegmentsSummary.encode(to:)(a1);
}

uint64_t sub_247485460(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_24748547C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_24748547C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6A18);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size_1(v10);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_247488538();
  __break(1u);
  return result;
}

uint64_t sub_2474855E4(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
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

int64_t sub_247485684(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t _s16SiriUserSegments0C7SummaryV2eeoiySbAC_ACtFZ_0(char *a1, uint64_t a2)
{
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
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  _BYTE *v42;
  uint64_t v43;
  char *v44;
  char v45;
  _BYTE *v46;
  uint64_t v47;
  int *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int *v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int (*v56)(uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  void (*v59)(_BYTE *, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _BYTE *v68;
  _BYTE *v69;
  char v70;
  uint64_t v71;
  unsigned int (*v72)(uint64_t, uint64_t, uint64_t);
  void (*v73)(_BYTE *, uint64_t);
  int *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int (*v78)(uint64_t, uint64_t, uint64_t);
  unsigned int v79;
  uint64_t v80;
  _BYTE *v81;
  unsigned int v82;
  _BYTE *v83;
  char v84;
  uint64_t v86;
  _BYTE *v87;
  void (*v88)(_BYTE *, uint64_t);
  int *v89;
  uint64_t v90;
  _BYTE *v91;
  _BYTE *v92;
  uint64_t v93;
  _BYTE *v94;
  uint64_t v95;
  _BYTE *v96;
  char v97;
  void (*v98)(_BYTE *, uint64_t);
  _BYTE v99[4];
  int v100;
  uint64_t v101;
  _BYTE *v102;
  _BYTE *v103;
  _BYTE *v104;
  _BYTE *v105;
  _BYTE *v106;
  _BYTE *v107;
  _BYTE *v108;
  _BYTE *v109;
  _BYTE *v110;
  _BYTE *v111;
  _BYTE *v112;
  _BYTE *v113;
  _BYTE *v114;
  _BYTE *v115;
  _BYTE *v116;
  uint64_t v117;
  int *v118;
  uint64_t v119;
  _BYTE *v120;
  uint64_t v121;
  char *v122;

  v122 = a1;
  v117 = sub_2474880AC();
  v119 = *(_QWORD *)(v117 - 8);
  MEMORY[0x24BDAC7A8](v117);
  v120 = &v99[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v121 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A6A08);
  v4 = MEMORY[0x24BDAC7A8](v121);
  v111 = &v99[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = MEMORY[0x24BDAC7A8](v4);
  v115 = &v99[-v7];
  v8 = MEMORY[0x24BDAC7A8](v6);
  v116 = &v99[-v9];
  MEMORY[0x24BDAC7A8](v8);
  v118 = (int *)&v99[-v10];
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v110 = &v99[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = MEMORY[0x24BDAC7A8](v12);
  v113 = &v99[-v15];
  v16 = MEMORY[0x24BDAC7A8](v14);
  v114 = &v99[-v17];
  v18 = MEMORY[0x24BDAC7A8](v16);
  v112 = &v99[-v19];
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = &v99[-v21];
  v23 = MEMORY[0x24BDAC7A8](v20);
  v25 = &v99[-v24];
  v26 = MEMORY[0x24BDAC7A8](v23);
  v28 = &v99[-v27];
  v29 = MEMORY[0x24BDAC7A8](v26);
  v31 = &v99[-v30];
  v32 = MEMORY[0x24BDAC7A8](v29);
  v34 = &v99[-v33];
  v35 = MEMORY[0x24BDAC7A8](v32);
  v37 = &v99[-v36];
  v38 = MEMORY[0x24BDAC7A8](v35);
  v40 = &v99[-v39];
  MEMORY[0x24BDAC7A8](v38);
  v42 = &v99[-v41];
  v43 = a2;
  v44 = v122;
  sub_24747B090(*v122);
  if ((v45 & 1) == 0)
    goto LABEL_24;
  v108 = v40;
  v109 = v42;
  v105 = v37;
  v106 = v31;
  v107 = v34;
  v103 = v22;
  v104 = v28;
  v102 = v25;
  v46 = v120;
  v47 = v121;
  if ((sub_2474843E0(*((_QWORD *)v44 + 1), *(_QWORD *)(v43 + 8)) & 1) == 0)
    goto LABEL_24;
  v48 = (int *)type metadata accessor for SegmentsSummary();
  if ((sub_247488088() & 1) == 0)
    goto LABEL_24;
  v49 = (uint64_t)v109;
  sub_24746BD5C((uint64_t)&v44[v48[7]], (uint64_t)v109);
  v50 = v48[7];
  v101 = v43;
  v51 = (uint64_t)v108;
  sub_24746BD5C(v43 + v50, (uint64_t)v108);
  v52 = v117;
  v53 = v118;
  v54 = (uint64_t)v118 + *(int *)(v47 + 48);
  sub_24746BD5C(v49, (uint64_t)v118);
  sub_24746BD5C(v51, v54);
  v55 = v119;
  v56 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v119 + 48);
  if (v56((uint64_t)v53, 1, v52) == 1)
  {
    sub_247487E6C(v51, (uint64_t *)&unk_2576A65B0);
    sub_247487E6C(v49, (uint64_t *)&unk_2576A65B0);
    if (v56(v54, 1, v52) == 1)
    {
      sub_247487E6C((uint64_t)v53, (uint64_t *)&unk_2576A65B0);
      goto LABEL_11;
    }
LABEL_9:
    v58 = (uint64_t)v53;
LABEL_23:
    sub_247487E6C(v58, &qword_2576A6A08);
    goto LABEL_24;
  }
  v57 = (uint64_t)v105;
  sub_24746BD5C((uint64_t)v53, (uint64_t)v105);
  if (v56(v54, 1, v52) == 1)
  {
    sub_247487E6C(v51, (uint64_t *)&unk_2576A65B0);
    sub_247487E6C((uint64_t)v109, (uint64_t *)&unk_2576A65B0);
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v57, v52);
    goto LABEL_9;
  }
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v55 + 32))(v46, v54, v52);
  sub_247487E1C(&qword_2576A6A10, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
  v100 = sub_247488310();
  v59 = *(void (**)(_BYTE *, uint64_t))(v55 + 8);
  v59(v46, v52);
  sub_247487E6C(v51, (uint64_t *)&unk_2576A65B0);
  sub_247487E6C((uint64_t)v109, (uint64_t *)&unk_2576A65B0);
  v59((_BYTE *)v57, v52);
  sub_247487E6C((uint64_t)v53, (uint64_t *)&unk_2576A65B0);
  if ((v100 & 1) == 0)
    goto LABEL_24;
LABEL_11:
  v60 = (uint64_t)v107;
  sub_24746BD5C((uint64_t)&v122[v48[8]], (uint64_t)v107);
  v118 = v48;
  v61 = (uint64_t)v106;
  sub_24746BD5C(v101 + v48[8], (uint64_t)v106);
  v62 = v121;
  v63 = v116;
  v64 = (uint64_t)&v116[*(int *)(v121 + 48)];
  sub_24746BD5C(v60, (uint64_t)v116);
  sub_24746BD5C(v61, v64);
  if (v56((uint64_t)v63, 1, v52) == 1)
  {
    v65 = v60;
    sub_247487E6C(v61, (uint64_t *)&unk_2576A65B0);
    v66 = v52;
    sub_247487E6C(v65, (uint64_t *)&unk_2576A65B0);
    if (v56(v64, 1, v52) != 1)
      goto LABEL_22;
    sub_247487E6C((uint64_t)v63, (uint64_t *)&unk_2576A65B0);
  }
  else
  {
    v67 = (uint64_t)v104;
    sub_24746BD5C((uint64_t)v63, (uint64_t)v104);
    if (v56(v64, 1, v52) == 1)
    {
      sub_247487E6C((uint64_t)v106, (uint64_t *)&unk_2576A65B0);
      sub_247487E6C((uint64_t)v107, (uint64_t *)&unk_2576A65B0);
      (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v67, v52);
      goto LABEL_22;
    }
    v68 = v120;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v55 + 32))(v120, v64, v52);
    sub_247487E1C(&qword_2576A6A10, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
    v69 = v68;
    v70 = sub_247488310();
    v71 = (uint64_t)v63;
    v72 = v56;
    v73 = *(void (**)(_BYTE *, uint64_t))(v55 + 8);
    v73(v69, v52);
    sub_247487E6C((uint64_t)v106, (uint64_t *)&unk_2576A65B0);
    sub_247487E6C((uint64_t)v107, (uint64_t *)&unk_2576A65B0);
    v73(v104, v52);
    v56 = v72;
    v66 = v52;
    sub_247487E6C(v71, (uint64_t *)&unk_2576A65B0);
    if ((v70 & 1) == 0)
      goto LABEL_24;
  }
  v74 = v118;
  v75 = (uint64_t)v102;
  sub_24746BD5C((uint64_t)&v122[v118[9]], (uint64_t)v102);
  v76 = (uint64_t)v103;
  sub_24746BD5C(v101 + v74[9], (uint64_t)v103);
  v63 = v115;
  v77 = (uint64_t)&v115[*(int *)(v62 + 48)];
  sub_24746BD5C(v75, (uint64_t)v115);
  sub_24746BD5C(v76, v77);
  if (v56((uint64_t)v63, 1, v66) != 1)
  {
    v81 = v112;
    sub_24746BD5C((uint64_t)v63, (uint64_t)v112);
    v82 = v56(v77, 1, v66);
    v83 = v114;
    if (v82 != 1)
    {
      v78 = v56;
      v86 = v119;
      v87 = v120;
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v119 + 32))(v120, v77, v66);
      sub_247487E1C(&qword_2576A6A10, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
      LODWORD(v117) = sub_247488310();
      v88 = *(void (**)(_BYTE *, uint64_t))(v86 + 8);
      v88(v87, v66);
      sub_247487E6C((uint64_t)v103, (uint64_t *)&unk_2576A65B0);
      sub_247487E6C(v75, (uint64_t *)&unk_2576A65B0);
      v88(v81, v66);
      sub_247487E6C((uint64_t)v63, (uint64_t *)&unk_2576A65B0);
      v80 = (uint64_t)v83;
      if ((v117 & 1) == 0)
        goto LABEL_24;
      goto LABEL_27;
    }
    sub_247487E6C((uint64_t)v103, (uint64_t *)&unk_2576A65B0);
    sub_247487E6C(v75, (uint64_t *)&unk_2576A65B0);
    (*(void (**)(_BYTE *, uint64_t))(v119 + 8))(v81, v66);
    goto LABEL_22;
  }
  v78 = v56;
  sub_247487E6C(v76, (uint64_t *)&unk_2576A65B0);
  sub_247487E6C(v75, (uint64_t *)&unk_2576A65B0);
  v79 = v56(v77, 1, v66);
  v80 = (uint64_t)v114;
  if (v79 != 1)
  {
LABEL_22:
    v58 = (uint64_t)v63;
    goto LABEL_23;
  }
  sub_247487E6C((uint64_t)v63, (uint64_t *)&unk_2576A65B0);
LABEL_27:
  v89 = v118;
  sub_24746BD5C((uint64_t)&v122[v118[10]], v80);
  v90 = v101;
  v91 = v113;
  sub_24746BD5C(v101 + v89[10], (uint64_t)v113);
  v92 = v111;
  v93 = (uint64_t)&v111[*(int *)(v47 + 48)];
  sub_24746BD5C(v80, (uint64_t)v111);
  sub_24746BD5C((uint64_t)v91, v93);
  if (v78((uint64_t)v92, 1, v66) == 1)
  {
    sub_247487E6C((uint64_t)v91, (uint64_t *)&unk_2576A65B0);
    sub_247487E6C(v80, (uint64_t *)&unk_2576A65B0);
    if (v78(v93, 1, v66) == 1)
    {
      sub_247487E6C((uint64_t)v92, (uint64_t *)&unk_2576A65B0);
LABEL_34:
      sub_247468348((uint64_t)&v122[v118[11]], v90 + v118[11]);
      return v84 & 1;
    }
    goto LABEL_32;
  }
  v94 = v110;
  sub_24746BD5C((uint64_t)v92, (uint64_t)v110);
  if (v78(v93, 1, v66) == 1)
  {
    sub_247487E6C((uint64_t)v113, (uint64_t *)&unk_2576A65B0);
    sub_247487E6C(v80, (uint64_t *)&unk_2576A65B0);
    (*(void (**)(_BYTE *, uint64_t))(v119 + 8))(v94, v66);
LABEL_32:
    v58 = (uint64_t)v92;
    goto LABEL_23;
  }
  v95 = v119;
  v96 = v120;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v119 + 32))(v120, v93, v66);
  sub_247487E1C(&qword_2576A6A10, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE958]);
  v97 = sub_247488310();
  v98 = *(void (**)(_BYTE *, uint64_t))(v95 + 8);
  v98(v96, v66);
  sub_247487E6C((uint64_t)v113, (uint64_t *)&unk_2576A65B0);
  sub_247487E6C(v80, (uint64_t *)&unk_2576A65B0);
  v98(v94, v66);
  sub_247487E6C((uint64_t)v92, (uint64_t *)&unk_2576A65B0);
  if ((v97 & 1) != 0)
    goto LABEL_34;
LABEL_24:
  v84 = 0;
  return v84 & 1;
}

unint64_t sub_247486200()
{
  unint64_t result;

  result = qword_2576A6998;
  if (!qword_2576A6998)
  {
    result = MEMORY[0x24957C370](&unk_24748A374, &type metadata for SegmentsSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A6998);
  }
  return result;
}

unint64_t sub_247486244()
{
  unint64_t result;

  result = qword_2576A69A0;
  if (!qword_2576A69A0)
  {
    result = MEMORY[0x24957C370](&protocol conformance descriptor for ActivitySegment, &type metadata for ActivitySegment);
    atomic_store(result, (unint64_t *)&qword_2576A69A0);
  }
  return result;
}

unint64_t sub_247486288()
{
  unint64_t result;

  result = qword_2576A69B8;
  if (!qword_2576A69B8)
  {
    result = MEMORY[0x24957C370](&protocol conformance descriptor for SegmentFlags, &type metadata for SegmentFlags);
    atomic_store(result, (unint64_t *)&qword_2576A69B8);
  }
  return result;
}

unint64_t sub_2474862CC()
{
  unint64_t result;

  result = qword_2576A69D0;
  if (!qword_2576A69D0)
  {
    result = MEMORY[0x24957C370](&protocol conformance descriptor for ActivitySegment, &type metadata for ActivitySegment);
    atomic_store(result, (unint64_t *)&qword_2576A69D0);
  }
  return result;
}

uint64_t sub_247486310(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A69A8);
    v8 = a2();
    result = MEMORY[0x24957C370](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_247486378()
{
  unint64_t result;

  result = qword_2576A69E0;
  if (!qword_2576A69E0)
  {
    result = MEMORY[0x24957C370](&protocol conformance descriptor for SegmentFlags, &type metadata for SegmentFlags);
    atomic_store(result, (unint64_t *)&qword_2576A69E0);
  }
  return result;
}

uint64_t sub_2474863BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SegmentsSummary();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_247486400(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SegmentsSummary();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t *initializeBufferWithCopyOfBuffer for SegmentsSummary(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t EnablementStatus;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    a1[1] = a2[1];
    v7 = a3[6];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_2474880AC();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    swift_bridgeObjectRetain();
    v12(v8, v9, v10);
    v13 = a3[7];
    v14 = (char *)v4 + v13;
    v15 = (char *)a2 + v13;
    v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    if (v16((char *)a2 + v13, 1, v10))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      v12(v14, v15, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
    }
    v19 = a3[8];
    v20 = (char *)v4 + v19;
    v21 = (char *)a2 + v19;
    if (v16((char *)a2 + v19, 1, v10))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      v12(v20, v21, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v20, 0, 1, v10);
    }
    v23 = a3[9];
    v24 = (char *)v4 + v23;
    v25 = (char *)a2 + v23;
    if (v16((char *)a2 + v23, 1, v10))
    {
      v26 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
    else
    {
      v12(v24, v25, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v24, 0, 1, v10);
    }
    v27 = a3[10];
    v28 = (char *)v4 + v27;
    v29 = (char *)a2 + v27;
    if (v16((char *)a2 + v27, 1, v10))
    {
      v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
      memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    }
    else
    {
      v12(v28, v29, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v28, 0, 1, v10);
    }
    v31 = a3[11];
    v32 = (char *)v4 + v31;
    v33 = (char *)a2 + v31;
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
    v35 = *(_QWORD *)(v34 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 3, v34))
    {
      EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
      memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(EnablementStatus - 8) + 64));
    }
    else
    {
      v12(v32, v33, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 3, v34);
    }
  }
  return v4;
}

uint64_t destroy for SegmentsSummary(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int (*v8)(uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  void (*v15)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  v4 = a1 + a2[6];
  v5 = sub_2474880AC();
  v6 = *(_QWORD *)(v5 - 8);
  v15 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v15(v4, v5);
  v7 = a1 + a2[7];
  v8 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v8(v7, 1, v5))
    v15(v7, v5);
  v9 = a1 + a2[8];
  if (!v8(v9, 1, v5))
    v15(v9, v5);
  v10 = a1 + a2[9];
  if (!v8(v10, 1, v5))
    v15(v10, v5);
  v11 = a1 + a2[10];
  if (!v8(v11, 1, v5))
    v15(v11, v5);
  v12 = a1 + a2[11];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v12, 3, v13);
  if (!(_DWORD)result)
    return ((uint64_t (*)(uint64_t, uint64_t))v15)(v12, v5);
  return result;
}

uint64_t initializeWithCopy for SegmentsSummary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void *, const void *, uint64_t);
  uint64_t v12;
  void *v13;
  const void *v14;
  unsigned int (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t EnablementStatus;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_2474880AC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(void *, const void *, uint64_t))(v10 + 16);
  swift_bridgeObjectRetain();
  v11(v7, v8, v9);
  v12 = a3[7];
  v13 = (void *)(a1 + v12);
  v14 = (const void *)(a2 + v12);
  v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v15(a2 + v12, 1, v9))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v11(v13, v14, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
  }
  v17 = a3[8];
  v18 = (void *)(a1 + v17);
  v19 = (const void *)(a2 + v17);
  if (v15(a2 + v17, 1, v9))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    v11(v18, v19, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v18, 0, 1, v9);
  }
  v21 = a3[9];
  v22 = (void *)(a1 + v21);
  v23 = (const void *)(a2 + v21);
  if (v15(a2 + v21, 1, v9))
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    v11(v22, v23, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v22, 0, 1, v9);
  }
  v25 = a3[10];
  v26 = (void *)(a1 + v25);
  v27 = (const void *)(a2 + v25);
  if (v15(a2 + v25, 1, v9))
  {
    v28 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
  }
  else
  {
    v11(v26, v27, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v26, 0, 1, v9);
  }
  v29 = a3[11];
  v30 = (void *)(a1 + v29);
  v31 = (const void *)(a2 + v29);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v33 = *(_QWORD *)(v32 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v33 + 48))(v31, 3, v32))
  {
    EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(EnablementStatus - 8) + 64));
  }
  else
  {
    v11(v30, v31, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 3, v32);
  }
  return a1;
}

uint64_t assignWithCopy for SegmentsSummary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const void *v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const void *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const void *v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(void *, uint64_t, uint64_t);
  int v43;
  int v44;
  uint64_t EnablementStatus;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2474880AC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24);
  v11(v7, v8, v9);
  v12 = a3[7];
  v13 = (void *)(a1 + v12);
  v14 = (const void *)(a2 + v12);
  v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  v16 = v15(a1 + v12, 1, v9);
  v17 = v15((uint64_t)v14, 1, v9);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v13, v14, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v13, v9);
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  v11((uint64_t)v13, (uint64_t)v14, v9);
LABEL_7:
  v19 = a3[8];
  v20 = (void *)(a1 + v19);
  v21 = (const void *)(a2 + v19);
  v22 = v15(a1 + v19, 1, v9);
  v23 = v15((uint64_t)v21, 1, v9);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v20, v21, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v20, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v20, v9);
LABEL_12:
    v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  v11((uint64_t)v20, (uint64_t)v21, v9);
LABEL_13:
  v25 = a3[9];
  v26 = (void *)(a1 + v25);
  v27 = (const void *)(a2 + v25);
  v28 = v15(a1 + v25, 1, v9);
  v29 = v15((uint64_t)v27, 1, v9);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v26, v27, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v26, 0, 1, v9);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v29)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v26, v9);
LABEL_18:
    v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    goto LABEL_19;
  }
  v11((uint64_t)v26, (uint64_t)v27, v9);
LABEL_19:
  v31 = a3[10];
  v32 = (void *)(a1 + v31);
  v33 = (const void *)(a2 + v31);
  v34 = v15(a1 + v31, 1, v9);
  v35 = v15((uint64_t)v33, 1, v9);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v32, v33, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v32, 0, 1, v9);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v35)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v32, v9);
LABEL_24:
    v36 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    goto LABEL_25;
  }
  v11((uint64_t)v32, (uint64_t)v33, v9);
LABEL_25:
  v37 = a3[11];
  v38 = (void *)(a1 + v37);
  v39 = (void *)(a2 + v37);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v41 = *(_QWORD *)(v40 - 8);
  v42 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v41 + 48);
  v43 = v42(v38, 3, v40);
  v44 = v42(v39, 3, v40);
  if (!v43)
  {
    if (!v44)
    {
      v11((uint64_t)v38, (uint64_t)v39, v9);
      return a1;
    }
    sub_247487E6C((uint64_t)v38, &qword_2576A5D68);
    goto LABEL_30;
  }
  if (v44)
  {
LABEL_30:
    EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(EnablementStatus - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v38, v39, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v38, 0, 3, v40);
  return a1;
}

uint64_t initializeWithTake for SegmentsSummary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void *, const void *, uint64_t);
  uint64_t v12;
  void *v13;
  const void *v14;
  unsigned int (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t EnablementStatus;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = sub_2474880AC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(void *, const void *, uint64_t))(v10 + 32);
  v11(v7, v8, v9);
  v12 = a3[7];
  v13 = (void *)(a1 + v12);
  v14 = (const void *)(a2 + v12);
  v15 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  if (v15(a2 + v12, 1, v9))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v11(v13, v14, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
  }
  v17 = a3[8];
  v18 = (void *)(a1 + v17);
  v19 = (const void *)(a2 + v17);
  if (v15(a2 + v17, 1, v9))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    v11(v18, v19, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v18, 0, 1, v9);
  }
  v21 = a3[9];
  v22 = (void *)(a1 + v21);
  v23 = (const void *)(a2 + v21);
  if (v15(a2 + v21, 1, v9))
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    v11(v22, v23, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v22, 0, 1, v9);
  }
  v25 = a3[10];
  v26 = (void *)(a1 + v25);
  v27 = (const void *)(a2 + v25);
  if (v15(a2 + v25, 1, v9))
  {
    v28 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
  }
  else
  {
    v11(v26, v27, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v26, 0, 1, v9);
  }
  v29 = a3[11];
  v30 = (void *)(a1 + v29);
  v31 = (const void *)(a2 + v29);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v33 = *(_QWORD *)(v32 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v33 + 48))(v31, 3, v32))
  {
    EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(EnablementStatus - 8) + 64));
  }
  else
  {
    v11(v30, v31, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 3, v32);
  }
  return a1;
}

uint64_t assignWithTake for SegmentsSummary(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const void *v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const void *v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const void *v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(void *, uint64_t, uint64_t);
  int v43;
  int v44;
  uint64_t EnablementStatus;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2474880AC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 40);
  v11(v7, v8, v9);
  v12 = a3[7];
  v13 = (void *)(a1 + v12);
  v14 = (const void *)(a2 + v12);
  v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
  v16 = v15(a1 + v12, 1, v9);
  v17 = v15((uint64_t)v14, 1, v9);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v13, v14, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v13, v9);
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  v11((uint64_t)v13, (uint64_t)v14, v9);
LABEL_7:
  v19 = a3[8];
  v20 = (void *)(a1 + v19);
  v21 = (const void *)(a2 + v19);
  v22 = v15(a1 + v19, 1, v9);
  v23 = v15((uint64_t)v21, 1, v9);
  if (v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v20, v21, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v20, 0, 1, v9);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v23)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v20, v9);
LABEL_12:
    v24 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    goto LABEL_13;
  }
  v11((uint64_t)v20, (uint64_t)v21, v9);
LABEL_13:
  v25 = a3[9];
  v26 = (void *)(a1 + v25);
  v27 = (const void *)(a2 + v25);
  v28 = v15(a1 + v25, 1, v9);
  v29 = v15((uint64_t)v27, 1, v9);
  if (v28)
  {
    if (!v29)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v26, v27, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v26, 0, 1, v9);
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (v29)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v26, v9);
LABEL_18:
    v30 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    goto LABEL_19;
  }
  v11((uint64_t)v26, (uint64_t)v27, v9);
LABEL_19:
  v31 = a3[10];
  v32 = (void *)(a1 + v31);
  v33 = (const void *)(a2 + v31);
  v34 = v15(a1 + v31, 1, v9);
  v35 = v15((uint64_t)v33, 1, v9);
  if (v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v32, v33, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v32, 0, 1, v9);
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v35)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v32, v9);
LABEL_24:
    v36 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    goto LABEL_25;
  }
  v11((uint64_t)v32, (uint64_t)v33, v9);
LABEL_25:
  v37 = a3[11];
  v38 = (void *)(a1 + v37);
  v39 = (void *)(a2 + v37);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5D68);
  v41 = *(_QWORD *)(v40 - 8);
  v42 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v41 + 48);
  v43 = v42(v38, 3, v40);
  v44 = v42(v39, 3, v40);
  if (!v43)
  {
    if (!v44)
    {
      v11((uint64_t)v38, (uint64_t)v39, v9);
      return a1;
    }
    sub_247487E6C((uint64_t)v38, &qword_2576A5D68);
    goto LABEL_30;
  }
  if (v44)
  {
LABEL_30:
    EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(EnablementStatus - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v38, v39, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v38, 0, 3, v40);
  return a1;
}

uint64_t getEnumTagSinglePayload for SegmentsSummary()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_247487664(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t EnablementStatus;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2474880AC();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      EnablementStatus = v8;
      v11 = a3[6];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
      {
        EnablementStatus = v12;
        v11 = a3[7];
      }
      else
      {
        EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
        v9 = *(_QWORD *)(EnablementStatus - 8);
        v11 = a3[11];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, EnablementStatus);
  }
}

uint64_t storeEnumTagSinglePayload for SegmentsSummary()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_247487738(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t EnablementStatus;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_2474880AC();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      EnablementStatus = v8;
      v11 = a4[6];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A65B0);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        EnablementStatus = v12;
        v11 = a4[7];
      }
      else
      {
        EnablementStatus = type metadata accessor for SiriFirstEnablementStatus();
        v9 = *(_QWORD *)(EnablementStatus - 8);
        v11 = a4[11];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, EnablementStatus);
  }
  return result;
}

void sub_2474877FC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_2474880AC();
  if (v0 <= 0x3F)
  {
    sub_24747CD68();
    if (v1 <= 0x3F)
    {
      type metadata accessor for SiriFirstEnablementStatus();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t getEnumTagSinglePayload for SegmentsSummary.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SegmentsSummary.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_247487994 + 4 * byte_24748A1A8[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_2474879C8 + 4 * byte_24748A1A3[v4]))();
}

uint64_t sub_2474879C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2474879D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2474879D8);
  return result;
}

uint64_t sub_2474879E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2474879ECLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_2474879F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2474879F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_247487A04(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_247487A10(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SegmentsSummary.CodingKeys()
{
  return &type metadata for SegmentsSummary.CodingKeys;
}

unint64_t sub_247487A2C()
{
  unint64_t result;

  result = qword_2576A69F0;
  if (!qword_2576A69F0)
  {
    result = MEMORY[0x24957C370](&unk_24748A34C, &type metadata for SegmentsSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A69F0);
  }
  return result;
}

unint64_t sub_247487A74()
{
  unint64_t result;

  result = qword_2576A69F8;
  if (!qword_2576A69F8)
  {
    result = MEMORY[0x24957C370](&unk_24748A2BC, &type metadata for SegmentsSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A69F8);
  }
  return result;
}

unint64_t sub_247487ABC()
{
  unint64_t result;

  result = qword_2576A6A00;
  if (!qword_2576A6A00)
  {
    result = MEMORY[0x24957C370](&unk_24748A2E4, &type metadata for SegmentsSummary.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576A6A00);
  }
  return result;
}

uint64_t sub_247487B00(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7974697669746361 && a2 == 0xEF746E656D676553;
  if (v3 || (sub_2474885BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x46746E656D676573 && a2 == 0xEC0000007367616CLL || (sub_2474885BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024748B200 || (sub_2474885BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024748B220 || (sub_2474885BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x800000024748B240 || (sub_2474885BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000024748B260 || (sub_2474885BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000024748B280 || (sub_2474885BC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x800000024748B2A0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v6 = sub_2474885BC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t sub_247487E1C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24957C370](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_247487E5C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_247487E6C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_247487EA8()
{
  return MEMORY[0x24BDCB820]();
}

uint64_t sub_247487EB4()
{
  return MEMORY[0x24BDCB830]();
}

uint64_t sub_247487EC0()
{
  return MEMORY[0x24BDCB840]();
}

uint64_t sub_247487ECC()
{
  return MEMORY[0x24BDCB848]();
}

uint64_t sub_247487ED8()
{
  return MEMORY[0x24BDCB868]();
}

uint64_t sub_247487EE4()
{
  return MEMORY[0x24BDCB878]();
}

uint64_t sub_247487EF0()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_247487EFC()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_247487F08()
{
  return MEMORY[0x24BDCBD38]();
}

uint64_t sub_247487F14()
{
  return MEMORY[0x24BDCBD60]();
}

uint64_t sub_247487F20()
{
  return MEMORY[0x24BDCBD70]();
}

uint64_t sub_247487F2C()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_247487F38()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_247487F44()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_247487F50()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_247487F5C()
{
  return MEMORY[0x24BDCCA58]();
}

uint64_t sub_247487F68()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_247487F74()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_247487F80()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_247487F8C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_247487F98()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_247487FA4()
{
  return MEMORY[0x24BEE6120]();
}

uint64_t sub_247487FB0()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_247487FBC()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_247487FC8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_247487FD4()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_247487FE0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_247487FEC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_247487FF8()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_247488004()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_247488010()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_24748801C()
{
  return MEMORY[0x24BDCE2F0]();
}

uint64_t sub_247488028()
{
  return MEMORY[0x24BDCE350]();
}

uint64_t sub_247488034()
{
  return MEMORY[0x24BDCE378]();
}

uint64_t sub_247488040()
{
  return MEMORY[0x24BDCE3A0]();
}

uint64_t sub_24748804C()
{
  return MEMORY[0x24BDCE3B8]();
}

uint64_t sub_247488058()
{
  return MEMORY[0x24BDCE3E8]();
}

uint64_t sub_247488064()
{
  return MEMORY[0x24BDCE448]();
}

uint64_t sub_247488070()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_24748807C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_247488088()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_247488094()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_2474880A0()
{
  return MEMORY[0x24BDCE8A8]();
}

uint64_t sub_2474880AC()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2474880B8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2474880C4()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_2474880D0()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_2474880DC()
{
  return MEMORY[0x24BDCEFB0]();
}

uint64_t sub_2474880E8()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_2474880F4()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_247488100()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_24748810C()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_247488118()
{
  return MEMORY[0x24BDCF168]();
}

uint64_t sub_247488124()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_247488130()
{
  return MEMORY[0x24BDCF1D0]();
}

uint64_t sub_24748813C()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_247488148()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_247488154()
{
  return MEMORY[0x24BDCF4C8]();
}

uint64_t sub_247488160()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_24748816C()
{
  return MEMORY[0x24BDFCAB8]();
}

uint64_t sub_247488178()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_247488184()
{
  return MEMORY[0x24BE94780]();
}

uint64_t sub_247488190()
{
  return MEMORY[0x24BE947D0]();
}

uint64_t sub_24748819C()
{
  return MEMORY[0x24BE947E8]();
}

uint64_t sub_2474881A8()
{
  return MEMORY[0x24BEE62A8]();
}

uint64_t sub_2474881B4()
{
  return MEMORY[0x24BEE6390]();
}

uint64_t sub_2474881C0()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_2474881CC()
{
  return MEMORY[0x24BDFCAF0]();
}

uint64_t sub_2474881D8()
{
  return MEMORY[0x24BDFCB00]();
}

uint64_t sub_2474881E4()
{
  return MEMORY[0x24BDFCB08]();
}

uint64_t sub_2474881F0()
{
  return MEMORY[0x24BDFCB30]();
}

uint64_t sub_2474881FC()
{
  return MEMORY[0x24BDFCB48]();
}

uint64_t sub_247488208()
{
  return MEMORY[0x24BDFCB58]();
}

uint64_t sub_247488214()
{
  return MEMORY[0x24BDFCB60]();
}

uint64_t sub_247488220()
{
  return MEMORY[0x24BDFCB80]();
}

uint64_t sub_24748822C()
{
  return MEMORY[0x24BDFCB88]();
}

uint64_t sub_247488238()
{
  return MEMORY[0x24BDFCB90]();
}

uint64_t sub_247488244()
{
  return MEMORY[0x24BDFCBA0]();
}

uint64_t sub_247488250()
{
  return MEMORY[0x24BDFCBD0]();
}

uint64_t sub_24748825C()
{
  return MEMORY[0x24BDFCC08]();
}

uint64_t sub_247488268()
{
  return MEMORY[0x24BDFCC10]();
}

uint64_t sub_247488274()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_247488280()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24748828C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_247488298()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_2474882A4()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_2474882B0()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_2474882BC()
{
  return MEMORY[0x24BEE5578]();
}

uint64_t sub_2474882C8()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_2474882D4()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2474882E0()
{
  return MEMORY[0x24BEE07D8]();
}

uint64_t sub_2474882EC()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_2474882F8()
{
  return MEMORY[0x24BEE07E8]();
}

uint64_t sub_247488304()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_247488310()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_24748831C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_247488328()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_247488334()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_247488340()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24748834C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_247488358()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_247488364()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_247488370()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_24748837C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_247488388()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_247488394()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2474883A0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2474883AC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2474883B8()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_2474883C4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2474883D0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2474883DC()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_2474883E8()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_2474883F4()
{
  return MEMORY[0x24BEE6A90]();
}

uint64_t sub_247488400()
{
  return MEMORY[0x24BEE6C08]();
}

uint64_t sub_24748840C()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_247488418()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_247488424()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_247488430()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_24748843C()
{
  return MEMORY[0x24BE948E8]();
}

uint64_t sub_247488448()
{
  return MEMORY[0x24BEE5918]();
}

uint64_t sub_247488454()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_247488460()
{
  return MEMORY[0x24BE94908]();
}

uint64_t sub_24748846C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_247488478()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_247488484()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_247488490()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_24748849C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2474884A8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2474884B4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2474884C0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2474884CC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2474884D8()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_2474884E4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2474884F0()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_2474884FC()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_247488508()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_247488514()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_247488520()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24748852C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_247488538()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_247488544()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_247488550()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_24748855C()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_247488568()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_247488574()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_247488580()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_24748858C()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_247488598()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2474885A4()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2474885B0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2474885BC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2474885C8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2474885D4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2474885E0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2474885EC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2474885F8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_247488604()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_247488610()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24748861C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_247488628()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_247488634()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_247488640()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_24748864C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x24BE0C258]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
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

