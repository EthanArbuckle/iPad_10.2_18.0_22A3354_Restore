uint64_t type metadata accessor for ApplicationContext()
{
  return objc_opt_self();
}

uint64_t static ApplicationContext.shared.getter()
{
  uint64_t v0;

  if (qword_255D9AC30)
  {
    v0 = qword_255D9AC30;
  }
  else
  {
    type metadata accessor for ApplicationContext();
    v0 = swift_allocObject();
    sub_22D8B61B0();
    qword_255D9AC30 = v0;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v0;
}

id AppInstallUtil.isAppInstalled.getter(unsigned __int8 a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25[2];

  v1 = a1;
  v2 = sub_22D8B6D80();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v21 - v5;
  if (v1 >= 3)
    v7 = 0xD000000000000010;
  else
    v7 = 0xD000000000000015;
  if (v1 >= 3)
    v8 = 0x800000022D8BD330;
  else
    v8 = 0x800000022D8BD2A0;
  v9 = objc_allocWithZone(MEMORY[0x24BDC1540]);
  v10 = sub_22D8728A8(v7, v8, 1);
  v11 = objc_msgSend(v10, sel_applicationState);
  v12 = objc_msgSend(v11, sel_isInstalled);

  if (qword_255D9A380 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v2, (uint64_t)qword_255D9B2E0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v13, v2);
  v14 = sub_22D8B6D68();
  v15 = sub_22D8B6F9C();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    v25[0] = v22;
    *(_DWORD *)v16 = 136315394;
    v23 = v3;
    v24 = sub_22D8755FC(v7, v8, v25);
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    if ((_DWORD)v12)
      v17 = 0x454C4C4154534E49;
    else
      v17 = 0x54534E4920544F4ELL;
    if ((_DWORD)v12)
      v18 = 0xE900000000000044;
    else
      v18 = 0xED000044454C4C41;
    v24 = sub_22D8755FC(v17, v18, v25);
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v14, v15, "ClockTimerAppUtil: LSApplicationRecord: %s – %s", (uint8_t *)v16, 0x16u);
    v19 = v22;
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v19, -1, -1);
    MEMORY[0x22E31A4BC](v16, -1, -1);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v2);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return v12;
}

id sub_22D8728A8(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_22D8B6E04();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_22D8B5B74();

    swift_willThrow();
  }
  return v6;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t UsoTask.alarmEntity.getter()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v6;
  uint64_t v7;
  _BYTE v8[32];
  _BYTE v9[24];
  uint64_t v10;
  _BYTE v11[32];

  sub_22D8B64E0();
  sub_22D872D08((uint64_t)v11, (uint64_t)v9);
  if (v10)
  {
    sub_22D872D08((uint64_t)v9, (uint64_t)v8);
    sub_22D8B65E8();
    if (swift_dynamicCast())
      goto LABEL_17;
    sub_22D8B65C4();
    if (swift_dynamicCast())
      goto LABEL_17;
    sub_22D8B65D0();
    if (swift_dynamicCast())
      goto LABEL_17;
    sub_22D8B6660();
    if (swift_dynamicCast())
    {
      swift_retain();
      sub_22D8B6384();
      swift_release();
      v0 = v6;
      if (v6)
      {
        swift_release();
        sub_22D8A3A4C((uint64_t)v11);
LABEL_19:
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
        goto LABEL_26;
      }
      goto LABEL_12;
    }
    sub_22D8B6708();
    if (swift_dynamicCast())
      goto LABEL_17;
    sub_22D8B684C();
    if (swift_dynamicCast())
      goto LABEL_17;
    sub_22D8B6600();
    if (swift_dynamicCast())
    {
LABEL_12:
      swift_retain();
      sub_22D8B67A4();
LABEL_18:
      swift_release_n();
      sub_22D8A3A4C((uint64_t)v11);
      v0 = v7;
      goto LABEL_19;
    }
    sub_22D8B6654();
    if (swift_dynamicCast()
      || (sub_22D8B65DC(), swift_dynamicCast())
      || (sub_22D8B65F4(), swift_dynamicCast()))
    {
LABEL_17:
      swift_retain();
      sub_22D8B6384();
      goto LABEL_18;
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
  }
  if (qword_255D9A388 != -1)
    swift_once();
  v1 = sub_22D8B6D80();
  __swift_project_value_buffer(v1, (uint64_t)qword_255D9B378);
  v2 = sub_22D8B6D68();
  v3 = sub_22D8B6FB4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22D86F000, v2, v3, "Parse entity: failed to parse task with unknown task. Returning nil entity", v4, 2u);
    MEMORY[0x22E31A4BC](v4, -1, -1);
  }

  sub_22D8A3A4C((uint64_t)v11);
  v0 = 0;
LABEL_26:
  sub_22D8A3A4C((uint64_t)v9);
  return v0;
}

uint64_t sub_22D872D08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B0E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E31A3F0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isMultiTimerEnabled()()
{
  return sub_22D872DC0(3, "Multi-timer on iOS FeatureFlag is enabled!");
}

uint64_t sub_22D872DC0(char a1, const char *a2)
{
  char v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _BYTE v10[24];
  ValueMetadata *v11;
  unint64_t v12;

  v11 = &type metadata for Features;
  v12 = sub_22D872ED4();
  v10[0] = a1;
  v4 = sub_22D8B61D4();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  if ((v4 & 1) != 0)
  {
    if (qword_255D9A2E0 != -1)
      swift_once();
    v5 = sub_22D8B6D80();
    __swift_project_value_buffer(v5, (uint64_t)qword_255D9A7C0);
    v6 = sub_22D8B6D68();
    v7 = sub_22D8B6FC0();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_22D86F000, v6, v7, a2, v8, 2u);
      MEMORY[0x22E31A4BC](v8, -1, -1);
    }

  }
  return v4 & 1;
}

unint64_t sub_22D872ED4()
{
  unint64_t result;

  result = qword_255D9A7D8;
  if (!qword_255D9A7D8)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B7B9C, &type metadata for Features);
    atomic_store(result, (unint64_t *)&qword_255D9A7D8);
  }
  return result;
}

unint64_t sub_22D872F18()
{
  unint64_t result;

  result = qword_255D9A7E0;
  if (!qword_255D9A7E0)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B7B74, &type metadata for Features);
    atomic_store(result, (unint64_t *)&qword_255D9A7E0);
  }
  return result;
}

const char *sub_22D872F5C()
{
  _BYTE *v0;

  if (*v0 == 5)
    return "Siri";
  else
    return "SiriTime";
}

uint64_t sub_22D872F8C()
{
  unsigned __int8 *v0;

  return sub_22D87F758(*v0);
}

uint64_t getEnumTagSinglePayload for HALAlarmDeviceContext(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

id UsoEntity_common_Duration.valueInSeconds.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id result;
  uint64_t v13;
  double v14;
  unint64_t v15;
  float v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  double v22;
  double v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  double v28;
  char *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  double v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  char *v40;
  unsigned int v41;
  unint64_t v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B3A8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v39 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_22D8B657C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v43 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v40 = (char *)&v39 - v7;
  v8 = sub_22D8B6504();
  if (!v8)
    goto LABEL_39;
  v9 = v8;
  if (!(v8 >> 62))
  {
    if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_4;
    goto LABEL_38;
  }
  if (!sub_22D8B71C4())
  {
LABEL_38:
    swift_bridgeObjectRelease();
LABEL_39:
    if (qword_255D9A390 != -1)
      swift_once();
    v35 = sub_22D8B6D80();
    __swift_project_value_buffer(v35, (uint64_t)qword_255D9B390);
    v36 = sub_22D8B6D68();
    v37 = sub_22D8B6FC0();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_22D86F000, v36, v37, "DurationComponents is nil or empty!", v38, 2u);
      MEMORY[0x22E31A4BC](v38, -1, -1);
    }

    return objc_msgSend((id)objc_opt_self(), sel_defaultDuration);
  }
LABEL_4:
  v10 = sub_22D8A3A8C(v9);
  swift_bridgeObjectRelease();
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    result = (id)sub_22D8B71C4();
    v11 = (uint64_t)result;
    if (result)
      goto LABEL_6;
    return (id)swift_bridgeObjectRelease_n();
  }
  v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = (id)swift_bridgeObjectRetain();
  if (!v11)
    return (id)swift_bridgeObjectRelease_n();
LABEL_6:
  v45 = v11 - 1;
  if (v11 >= 1)
  {
    v13 = 0;
    v44 = v10 & 0xC000000000000001;
    v41 = *MEMORY[0x24BEA0858];
    v14 = 0.0;
    v42 = v10;
    if ((v10 & 0xC000000000000001) == 0)
      goto LABEL_9;
LABEL_8:
    MEMORY[0x22E319D0C](v13, v10);
    while (1)
    {
      if (!sub_22D8B6444())
      {
        if (qword_255D9A390 != -1)
          swift_once();
        v18 = sub_22D8B6D80();
        __swift_project_value_buffer(v18, (uint64_t)qword_255D9B390);
        v19 = sub_22D8B6D68();
        v20 = sub_22D8B6FC0();
        if (os_log_type_enabled(v19, v20))
        {
          v21 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_22D86F000, v19, v20, "Value is nil in the DurationComponent, use SiriTimeTimerConstants.minimumDuration as the default value", v21, 2u);
          MEMORY[0x22E31A4BC](v21, -1, -1);
        }

        objc_msgSend((id)objc_opt_self(), sel_minimumDuration);
        v23 = v22;
        goto LABEL_25;
      }
      sub_22D8B6390();
      swift_release();
      v15 = sub_22D873668(0.0, 1.0, 0.1, 0.3);
      if ((v15 & 0x100000000) != 0)
      {
        if (qword_255D9A390 != -1)
          swift_once();
        v24 = sub_22D8B6D80();
        __swift_project_value_buffer(v24, (uint64_t)qword_255D9B390);
        v25 = sub_22D8B6D68();
        v26 = sub_22D8B6FC0();
        if (os_log_type_enabled(v25, v26))
        {
          v27 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v27 = 0;
          _os_log_impl(&dword_22D86F000, v25, v26, "Failed to resolve parse to quantity value, use SiriTimeTimerConstants.minimumDuration as the default value", v27, 2u);
          MEMORY[0x22E31A4BC](v27, -1, -1);
        }

        objc_msgSend((id)objc_opt_self(), sel_minimumDuration);
        v23 = v28;
        swift_release();
LABEL_25:
        swift_release();
        v14 = v14 + v23;
        goto LABEL_33;
      }
      v16 = *(float *)&v15;
      if (!sub_22D8B67EC())
        break;
      sub_22D8B6468();
      swift_release();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
        goto LABEL_27;
      v17 = v40;
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v40, v2, v3);
LABEL_32:
      v34 = sub_22D87411C();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v17, v3);
      swift_release();
      swift_release();
      v14 = v14 + v34 * v16;
LABEL_33:
      if (v45 == v13)
        return (id)swift_bridgeObjectRelease_n();
      ++v13;
      if (v44)
        goto LABEL_8;
LABEL_9:
      swift_retain();
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
LABEL_27:
    v29 = v2;
    sub_22D8740E0((uint64_t)v2, &qword_255D9B3A8);
    if (qword_255D9A390 != -1)
      swift_once();
    v30 = sub_22D8B6D80();
    __swift_project_value_buffer(v30, (uint64_t)qword_255D9B390);
    v31 = sub_22D8B6D68();
    v32 = sub_22D8B6FB4();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_22D86F000, v31, v32, "DurationComponent is underspecified and is missing a Unit, using Minute as default unit", v33, 2u);
      MEMORY[0x22E31A4BC](v33, -1, -1);
    }

    v17 = v43;
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v43, v41, v3);
    v2 = v29;
    v10 = v42;
    goto LABEL_32;
  }
  __break(1u);
  return result;
}

unint64_t sub_22D873668(float a1, float a2, float a3, float a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  int v29;
  float v30;
  char *v31;
  int v32;
  int v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char *v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  char v42;
  char v43;
  float v44;
  char v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE *v56;
  float v57;
  float v58;
  float v59;
  void *v60;
  float v61;
  float v62;
  float v64;
  int v65;
  void (*v66)(char *, uint64_t);
  uint64_t v67;
  char *v68;
  char *v69;
  _QWORD v70[2];
  uint64_t v71;
  uint64_t v72;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE00);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_22D8B64A4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v67 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v68 = (char *)&v67 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE08);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_22D8B6474();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v67 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v69 = (char *)&v67 - v25;
  sub_22D8B6480();
  sub_22D8B65A0();
  if (v71)
  {
    sub_22D8B6468();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
    {
      swift_release();
      sub_22D8740E0((uint64_t)v19, &qword_255D9AE08);
      goto LABEL_4;
    }
    v31 = v69;
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v69, v19, v20);
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v24, v31, v20);
    v32 = (*(uint64_t (**)(char *, uint64_t))(v21 + 88))(v24, v20);
    if (v32 == *MEMORY[0x24BEA0400])
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
      swift_release();
      LOBYTE(v29) = 0;
      v30 = 1000000000.0;
      goto LABEL_70;
    }
    v33 = v32;
    if (v32 == *MEMORY[0x24BEA03F8])
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
      swift_release();
      LOBYTE(v29) = 0;
      v30 = 12.0;
      goto LABEL_70;
    }
    if (v32 == *MEMORY[0x24BEA0418])
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
      swift_release();
      LOBYTE(v29) = 0;
      v30 = 1000.0;
      goto LABEL_70;
    }
    if (v32 == *MEMORY[0x24BEA0420])
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
      swift_release();
      LOBYTE(v29) = 0;
      v30 = 1.0e12;
      goto LABEL_70;
    }
    if (v32 == *MEMORY[0x24BEA03B8])
    {
      v57 = a2 * 0.5;
      v58 = a1 * 0.5;
LABEL_52:
      v59 = v58 + v57;
      MEMORY[0x22E319BC8](10.0);
      sub_22D8B5BB0();
      v60 = (void *)sub_22D8B7008();
      sub_22D8B6F60();
      v62 = v61;
      swift_release();

      a1 = roundf(v59 * v62) / v62;
      (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
      goto LABEL_53;
    }
    if (v32 == *MEMORY[0x24BEA0410])
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
      swift_release();
      LOBYTE(v29) = 0;
      v30 = 1000000.0;
      goto LABEL_70;
    }
    if (v32 == *MEMORY[0x24BEA03E0])
    {
      (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
      swift_release();
      LOBYTE(v29) = 0;
      v30 = 100000.0;
      goto LABEL_70;
    }
    if (v32 != *MEMORY[0x24BEA03C8])
    {
      if (v32 == *MEMORY[0x24BEA03F0])
      {
        v58 = a2 * a3;
        v64 = 1.0 - a3;
LABEL_74:
        v57 = v64 * a1;
        goto LABEL_52;
      }
      if (v32 != *MEMORY[0x24BEA03D0])
      {
        if (v32 == *MEMORY[0x24BEA03C0])
        {
          (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
          swift_release();
          LOBYTE(v29) = 0;
          v30 = 10000.0;
          goto LABEL_70;
        }
        if (v32 != *MEMORY[0x24BEA03E8])
        {
          if (v32 == *MEMORY[0x24BEA0408])
          {
            (*(void (**)(char *, uint64_t))(v21 + 8))(v69, v20);
            swift_release();
            LOBYTE(v29) = 0;
            v30 = 100.0;
            goto LABEL_70;
          }
          if (v32 == *MEMORY[0x24BEA03B0])
          {
            (*(void (**)(char *, uint64_t))(v21 + 8))(v69, v20);
            swift_release();
            LOBYTE(v29) = 0;
            v30 = 10000000.0;
            goto LABEL_70;
          }
          v65 = *MEMORY[0x24BEA03D8];
          v66 = *(void (**)(char *, uint64_t))(v21 + 8);
          v66(v69, v20);
          swift_release();
          if (v33 != v65)
          {
            v66(v24, v20);
            goto LABEL_69;
          }
LABEL_53:
          LOBYTE(v29) = 0;
          v30 = a1;
          goto LABEL_70;
        }
        v58 = a2 * a4;
        v64 = 1.0 - a4;
        goto LABEL_74;
      }
    }
    (*(void (**)(char *, uint64_t))(v21 + 8))(v31, v20);
    swift_release();
    LOBYTE(v29) = 0;
    v30 = a2;
    goto LABEL_70;
  }
LABEL_4:
  sub_22D8B64D4();
  sub_22D8B65A0();
  if (v71)
  {
    v26 = sub_22D8B64C8();
    v28 = v27;
    swift_release();
    if ((v28 & 1) == 0)
    {
      LOBYTE(v29) = 0;
      v30 = (float)v26;
      goto LABEL_70;
    }
LABEL_69:
    v30 = 0.0;
    LOBYTE(v29) = 1;
    goto LABEL_70;
  }
  sub_22D8B64BC();
  sub_22D8B65A0();
  if (v71)
  {
    sub_22D8B6468();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
    {
      sub_22D8740E0((uint64_t)v10, &qword_255D9AE00);
      goto LABEL_31;
    }
    v39 = v68;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v68, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v15, *MEMORY[0x24BEA0558], v11);
    sub_22D8919D8();
    sub_22D8B6E94();
    sub_22D8B6E94();
    if (v71 == v70[0] && v72 == v70[1])
    {
      swift_bridgeObjectRelease_n();
      v40 = *(void (**)(char *, uint64_t))(v12 + 8);
      v40(v15, v11);
      v40(v39, v11);
    }
    else
    {
      v45 = sub_22D8B73F8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v46 = *(void (**)(char *, uint64_t))(v12 + 8);
      v46(v15, v11);
      v46(v39, v11);
      if ((v45 & 1) == 0)
      {
LABEL_31:
        v47 = sub_22D8B64B0();
        if (v48)
        {
          v49 = v48;
          LODWORD(v70[0]) = 0;
          MEMORY[0x24BDAC7A8](v47);
          *(&v67 - 2) = (uint64_t)v70;
          if ((v51 & 0x1000000000000000) != 0 || !(v49 & 0x2000000000000000 | v50 & 0x1000000000000000))
          {
            sub_22D8B7110();
            swift_release();
            swift_bridgeObjectRelease();
            v53 = v71;
          }
          else if ((v49 & 0x2000000000000000) != 0)
          {
            v71 = v50;
            v72 = v49 & 0xFFFFFFFFFFFFFFLL;
            v53 = (v50 > 0x20u || ((0x100003E01uLL >> v50) & 1) == 0)
               && (v56 = (_BYTE *)_swift_stdlib_strtof_clocale()) != 0
               && *v56 == 0;
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            if ((v50 & 0x1000000000000000) != 0)
              v52 = (_BYTE *)((v49 & 0xFFFFFFFFFFFFFFFLL) + 32);
            else
              v52 = (_BYTE *)sub_22D8B7170();
            sub_22D89196C(v52, (BOOL *)&v71);
            v53 = v71;
            swift_release();
            swift_bridgeObjectRelease();
          }
          if (v53)
            v30 = *(float *)v70;
          else
            v30 = 0.0;
          LOBYTE(v29) = v53 ^ 1;
          goto LABEL_70;
        }
LABEL_68:
        swift_release();
        goto LABEL_69;
      }
    }
    swift_release();
    LOBYTE(v29) = 0;
    v30 = 0.01;
    goto LABEL_70;
  }
  sub_22D8B66F0();
  sub_22D8B65A0();
  if (!v71)
  {
    sub_22D8B67E0();
    sub_22D8B65A0();
    if (!v71)
      goto LABEL_69;
    if (sub_22D8B6444())
    {
      if (sub_22D8B6450())
      {
        sub_22D8B6390();
        v54 = sub_22D873668(a1, a2, 0.1, 0.3);
        swift_release();
        if ((v54 & 0x100000000) == 0)
        {
          swift_retain();
          sub_22D8B6390();
          swift_release();
          v55 = sub_22D873668(a1, a2, 0.1, 0.3);
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          if ((v55 & 0x100000000) == 0)
          {
            LOBYTE(v29) = 0;
            v30 = *(float *)&v54 * *(float *)&v55;
            goto LABEL_70;
          }
          goto LABEL_69;
        }
        swift_release();
        swift_release();
      }
      else
      {
        swift_release();
      }
    }
    goto LABEL_68;
  }
  v34 = sub_22D8B66D8();
  if ((v35 & 1) != 0 || (v36 = v34, v37 = sub_22D8B66E4(), (v38 & 1) != 0))
  {
    v30 = 0.0;
    v29 = 1;
  }
  else
  {
    if (!v37)
      goto LABEL_68;
    v29 = 0;
    v30 = (float)v36 / (float)v37;
  }
  v41 = sub_22D8B66CC();
  v43 = v42;
  swift_release();
  if ((v43 & 1) == 0)
  {
    v44 = v30;
    if (v29)
      v44 = 0.0;
    v30 = v44 + (float)v41;
    LOBYTE(v29) = 0;
  }
LABEL_70:
  LOBYTE(v71) = v29;
  return LODWORD(v30) | ((unint64_t)v29 << 32);
}

uint64_t sub_22D8740E0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

double sub_22D87411C()
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  void (*v34)(char *, uint64_t, uint64_t);
  int v35;
  double result;
  void (*v37)(char *, uint64_t, double);
  uint64_t v38;
  char *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, char *, uint64_t);
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char v65;
  char v66;
  void (*v67)(char *, uint64_t);
  char *v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t);
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  __int128 v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A900);
  MEMORY[0x24BDAC7A8](v1);
  v81 = (char *)&v73 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_22D8B5B5C();
  v86 = *(_QWORD *)(v3 - 8);
  v87 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v76 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v91 = (char *)&v73 - v6;
  v7 = sub_22D8B5BF8();
  v8 = *(_QWORD *)(v7 - 8);
  v88 = v7;
  v89 = v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v75 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v85 = (char *)&v73 - v11;
  v12 = sub_22D8B5C7C();
  v79 = *(_QWORD *)(v12 - 8);
  v80 = v12;
  MEMORY[0x24BDAC7A8](v12);
  *(_QWORD *)&v77 = (char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_22D8B5D0C();
  v83 = *(_QWORD *)(v14 - 8);
  v84 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v82 = (char *)&v73 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B3B8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v90 = (uint64_t)&v73 - v24;
  v25 = sub_22D8B657C();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v73 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x24BDAC7A8](v27);
  v78 = (char *)&v73 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v73 - v32;
  v34 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 16);
  v34((char *)&v73 - v32, v0, v25);
  v35 = (*(uint64_t (**)(char *, uint64_t))(v26 + 88))(v33, v25);
  result = 1.0;
  if (v35 != *MEMORY[0x24BEA0860])
  {
    if (v35 == *MEMORY[0x24BEA0858])
      return 60.0;
    if (v35 == *MEMORY[0x24BEA0828])
      return 86400.0;
    if (v35 == *MEMORY[0x24BEA0830])
      return 3600.0;
    v37 = *(void (**)(char *, uint64_t, double))(v26 + 8);
    v37(v33, v25, 1.0);
    sub_22D8A523C((uint64_t)v18);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
    {
      sub_22D8740E0((uint64_t)v18, &qword_255D9B3B8);
      if (qword_255D9A390 != -1)
        swift_once();
      v38 = sub_22D8B6D80();
      __swift_project_value_buffer(v38, (uint64_t)qword_255D9B390);
      v39 = v78;
      v34(v78, v0, v25);
      v40 = sub_22D8B6D68();
      v41 = sub_22D8B6FB4();
      if (os_log_type_enabled(v40, v41))
      {
        v42 = (uint8_t *)swift_slowAlloc();
        v43 = swift_slowAlloc();
        v93 = v43;
        v91 = (char *)v37;
        *(_DWORD *)v42 = 136315138;
        v34(v29, (uint64_t)v39, v25);
        v44 = sub_22D8B6E28();
        v92 = sub_22D8755FC(v44, v45, &v93);
        sub_22D8B7044();
        swift_bridgeObjectRelease();
        ((void (*)(char *, uint64_t))v91)(v39, v25);
        _os_log_impl(&dword_22D86F000, v40, v41, "Unexpected duration unit %s. Using zero for this component.", v42, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E31A4BC](v43, -1, -1);
        MEMORY[0x22E31A4BC](v42, -1, -1);
      }
      else
      {
        ((void (*)(char *, uint64_t))v37)(v39, v25);
      }

    }
    else
    {
      v46 = *(int *)(v19 + 48);
      v47 = sub_22D8B5D00();
      v48 = *(_QWORD *)(v47 - 8);
      v49 = *(void (**)(uint64_t, char *, uint64_t))(v48 + 32);
      v50 = v90;
      v49(v90, v18, v47);
      v74 = *(_QWORD *)&v18[v46];
      *(_QWORD *)(v50 + v46) = v74;
      v51 = v77;
      sub_22D8B5C58();
      v52 = v82;
      sub_22D8B5C64();
      (*(void (**)(uint64_t, uint64_t))(v79 + 8))(v51, v80);
      v53 = v85;
      sub_22D8B5BE0();
      v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE90);
      v55 = *(unsigned __int8 *)(v48 + 80);
      v56 = (v55 + 32) & ~v55;
      v79 = v56 + *(_QWORD *)(v48 + 72);
      v80 = v54;
      v78 = (char *)(v55 | 7);
      v57 = swift_allocObject();
      v77 = xmmword_22D8B7E30;
      *(_OWORD *)(v57 + 16) = xmmword_22D8B7E30;
      (*(void (**)(char *, uint64_t, uint64_t))(v48 + 16))(v23, v50, v47);
      v49(v57 + v56, v23, v47);
      sub_22D8A597C(v57);
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      sub_22D8B5CA0();
      swift_bridgeObjectRelease();
      v58 = (uint64_t)v81;
      sub_22D8B5CD0();
      v59 = v88;
      v60 = v89;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v89 + 48))(v58, 1, v88) == 1)
      {
        sub_22D8740E0(v58, &qword_255D9A900);
        (*(void (**)(char *, uint64_t))(v86 + 8))(v91, v87);
      }
      else
      {
        v61 = v75;
        (*(void (**)(char *, uint64_t, uint64_t))(v60 + 32))(v75, v58, v59);
        v62 = swift_allocObject();
        *(_OWORD *)(v62 + 16) = v77;
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v48 + 104))(v62 + v56, *MEMORY[0x24BDCF260], v47);
        sub_22D8A597C(v62);
        swift_setDeallocating();
        swift_arrayDestroy();
        swift_deallocClassInstance();
        v63 = v76;
        sub_22D8B5C94();
        swift_bridgeObjectRelease();
        v64 = sub_22D8B5B20();
        v66 = v65;
        v67 = *(void (**)(char *, uint64_t))(v86 + 8);
        v68 = v63;
        v69 = v87;
        v67(v68, v87);
        v70 = *(void (**)(char *, uint64_t))(v89 + 8);
        v71 = v61;
        v72 = v88;
        v70(v71, v88);
        if ((v66 & 1) == 0)
        {
          v67(v91, v69);
          v70(v53, v72);
          (*(void (**)(char *, uint64_t))(v83 + 8))(v52, v84);
          sub_22D8740E0(v90, &qword_255D9A8B8);
          return (double)v74 * (double)v64;
        }
        v59 = v72;
        v60 = v89;
        v67(v91, v69);
      }
      (*(void (**)(char *, uint64_t))(v60 + 8))(v53, v59);
      (*(void (**)(char *, uint64_t))(v83 + 8))(v52, v84);
      sub_22D8740E0(v90, &qword_255D9A8B8);
    }
    return 0.0;
  }
  return result;
}

id INIntent.withEndpointId.getter()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v8;
  _QWORD v9[4];
  _QWORD v10[4];

  v8 = v0;
  v1 = objc_msgSend(v0, sel__metadata);

  if (!v1)
  {
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA2F0]), sel_init);
    objc_msgSend(v0, sel__setMetadata_, v2);

  }
  v3 = objc_msgSend(v0, sel__metadata);
  if (v3)
  {
    v4 = v3;
    sub_22D8B5EBC();
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    sub_22D8B6090();
    __swift_project_boxed_opaque_existential_1(v9, v9[3]);
    sub_22D8B6084();
    if (v5)
    {
      v6 = (void *)sub_22D8B6E04();
      swift_bridgeObjectRelease();
    }
    else
    {
      v6 = 0;
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
    objc_msgSend(v4, sel_setEndpointId_, v6);

  }
  return v8;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

id INIntent.withIntentId.getter()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v9;

  v9 = v0;
  v1 = objc_msgSend(v0, sel__metadata);

  if (!v1)
  {
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA2F0]), sel_init);
    objc_msgSend(v0, sel__setMetadata_, v2);

  }
  v3 = objc_msgSend(v0, sel__metadata);
  if (v3)
  {
    v4 = v3;
    sub_22D8B6AD4();
    v5 = (void *)sub_22D8B6AC8();
    if (v5)
    {
      sub_22D8B6ABC();
      swift_release();
      sub_22D8B5E2C();
      v7 = v6;
      swift_release();
      if (v7)
      {
        v5 = (void *)sub_22D8B6E04();
        swift_bridgeObjectRelease();
      }
      else
      {
        v5 = 0;
      }
    }
    objc_msgSend(v4, sel_setIntentId_, v5);

  }
  return v9;
}

uint64_t SiriTimeDeviceResolutionService.init()@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = sub_22D8B6CCC();
  result = sub_22D8B6CB4();
  v4 = MEMORY[0x24BEA9118];
  a1[3] = v2;
  a1[4] = v4;
  *a1 = result;
  return result;
}

uint64_t initializeWithCopy for SiriTimeDeviceContextProvider(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t SiriTimeDeviceContextProvider.init(sharedContext:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_22D874D04(a1, a2);
}

uint64_t sub_22D874D04(__int128 *a1, uint64_t a2)
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

uint64_t type metadata accessor for SiriTimeMeasurement()
{
  uint64_t result;

  result = qword_255D9B520;
  if (!qword_255D9B520)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t SiriTimeMeasurement.init(_:log:startTime:)@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v21 = a3;
  v7 = sub_22D8B5C40();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (int *)type metadata accessor for SiriTimeMeasurement();
  *(_OWORD *)(a4 + v11[7]) = xmmword_22D8B7E40;
  *(_QWORD *)(a4 + v11[8]) = 0x7FEFFFFFFFFFFFFFLL;
  v12 = v11[9];
  sub_22D8B5C34();
  v13 = objc_allocWithZone(MEMORY[0x24BE95C78]);
  v14 = (void *)sub_22D8B5C1C();
  v15 = objc_msgSend(v13, sel_initWithNSUUID_, v14);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  *(_QWORD *)(a4 + v12) = v15;
  *(_BYTE *)(a4 + 8) = a1;
  v16 = a4 + v11[6];
  v17 = sub_22D8B6D80();
  v18 = *(_QWORD *)(v17 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v16, a2, v17);
  *(_QWORD *)a4 = v21;
  sub_22D8A9578();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(a2, v17);
}

uint64_t initializeWithCopy for SiriTimeMeasurement(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_22D8B6D80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[7];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = *(_QWORD *)(v12 + 8);
  if (v13 <= 2)
  {
    *(_OWORD *)v11 = *(_OWORD *)v12;
  }
  else
  {
    *(_QWORD *)v11 = *(_QWORD *)v12;
    *(_QWORD *)(v11 + 8) = v13;
    swift_bridgeObjectRetain();
  }
  v14 = a3[9];
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  v15 = *(void **)(a2 + v14);
  *(_QWORD *)(a1 + v14) = v15;
  v16 = v15;
  return a1;
}

void destroy for SiriTimeMeasurement(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + a2[6];
  v5 = sub_22D8B6D80();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  if (*(_QWORD *)(a1 + a2[7] + 8) >= 3uLL)
    swift_bridgeObjectRelease();

}

Swift::Void __swiftcall SiriTimeMeasurement.logDelta()()
{
  uint64_t *v0;
  int *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  double v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = (int *)type metadata accessor for SiriTimeMeasurement();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_22D8B6D80();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = mach_absolute_time();
  if (qword_255D9A3B8 != -1)
    swift_once();
  if (v8 < *v0)
  {
    __break(1u);
    goto LABEL_12;
  }
  if (!HIDWORD(qword_255D9B4A8))
  {
LABEL_12:
    __break(1u);
    return;
  }
  v9 = (double)(v8 - *v0) * (double)(qword_255D9B4A8 / HIDWORD(qword_255D9B4A8)) / 1000000.0;
  sub_22D8A9AF4();
  v10 = (char *)v0 + v1[7];
  v11 = *((_QWORD *)v10 + 1);
  if (v11 != 2 && *(double *)((char *)v0 + v1[8]) < v9)
  {
    v12 = *(_QWORD *)v10;
    sub_22D893628(*(_QWORD *)v10, *((_QWORD *)v10 + 1));
    sub_22D8A9F34(v12, v11, 0, 0);
    sub_22D8AA3A0(v12, v11);
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, (char *)v0 + v1[6], v4);
  sub_22D875348((uint64_t)v0, (uint64_t)v3);
  v13 = sub_22D8B6D68();
  v14 = sub_22D8B6FC0();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v28 = v16;
    *(_DWORD *)v15 = 136315394;
    v17 = SiriTimeMeasurement.LogDescription.rawValue.getter(v3[8]);
    v19 = sub_22D8755FC(v17, v18, &v28);
    v26 = v4;
    v27 = v19;
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    sub_22D8758C0((uint64_t)v3);
    *(_WORD *)(v15 + 12) = 2080;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B4B0);
    v20 = swift_allocObject();
    v21 = MEMORY[0x24BEE13C8];
    *(_OWORD *)(v20 + 16) = xmmword_22D8B7E30;
    v22 = MEMORY[0x24BEE1448];
    *(_QWORD *)(v20 + 56) = v21;
    *(_QWORD *)(v20 + 64) = v22;
    *(double *)(v20 + 32) = v9;
    v23 = sub_22D8B6E1C();
    v27 = sub_22D8755FC(v23, v24, &v28);
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v13, v14, "SiriTime external dependency \"%s\": %s ms", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v16, -1, -1);
    MEMORY[0x22E31A4BC](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v26);
  }
  else
  {
    sub_22D8758C0((uint64_t)v3);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_22D875348(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SiriTimeMeasurement();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t SiriTimeMeasurement.LogDescription.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D8753C8 + 4 * byte_22D8B95B4[a1]))(0xD000000000000015, 0x800000022D8BDBA0);
}

unint64_t sub_22D8753C8()
{
  return 0xD000000000000018;
}

uint64_t sub_22D8755B4()
{
  uint64_t v0;

  return v0 + 4;
}

uint64_t sub_22D8755D8()
{
  return 0x203A746163626F42;
}

uint64_t sub_22D8755FC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_22D8756CC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22D875884((uint64_t)v12, *a3);
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
      sub_22D875884((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_22D8756CC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_22D8B7050();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_22D8758FC(a5, a6);
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
  v8 = sub_22D8B7170();
  if (!v8)
  {
    sub_22D8B71AC();
    __break(1u);
LABEL_17:
    result = sub_22D8B71F4();
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

uint64_t sub_22D875884(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22D8758C0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SiriTimeMeasurement();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D8758FC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_22D875990(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_22D87F358(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_22D87F358(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22D875990(uint64_t a1, unint64_t a2)
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
      v3 = sub_22D87F2F4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_22D8B7134();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_22D8B71AC();
      __break(1u);
LABEL_10:
      v2 = sub_22D8B6E7C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_22D8B71F4();
    __break(1u);
LABEL_14:
    result = sub_22D8B71AC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_22D875B04(unint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v2 = sub_22D8B70BC();
    if (v2)
      goto LABEL_3;
    return MEMORY[0x24BEE4AF8];
  }
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_3:
  if (v2 <= 0)
  {
    v3 = (uint64_t *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B350);
    v3 = (uint64_t *)swift_allocObject();
    v4 = _swift_stdlib_malloc_size(v3);
    v5 = v4 - 32;
    if (v4 < 32)
      v5 = v4 - 25;
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  v6 = sub_22D87C788((uint64_t)&v8, v3 + 4, v2, a1);
  result = sub_22D89ED90();
  if (v6 == v2)
    return (uint64_t)v3;
  __break(1u);
  return result;
}

uint64_t NLContextUpdate.set(undoDirectInvocation:)(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AD18);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_22D8B6198();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v3, a1, v4);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  return sub_22D8B5FC4();
}

uint64_t PunchOutApp.toResponseFrameworkCommandAction()@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  int v43;
  uint64_t v44;
  uint8_t *v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  uint8_t *v49;
  void *v50;
  uint64_t v51;
  uint8_t *v52;
  uint8_t *v53;
  int v54;
  void *v55;
  uint64_t v56;
  id v57[2];

  v57[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = sub_22D8B5C40();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_22D8B5BA4();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  PunchOutApp.url.getter(a1);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_22D88CB18((uint64_t)v10);
    if (qword_255D9A3D0 != -1)
      swift_once();
    v15 = sub_22D8B6D80();
    __swift_project_value_buffer(v15, (uint64_t)qword_255D9F738);
    v16 = sub_22D8B6D68();
    v17 = sub_22D8B6FB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = (void *)swift_slowAlloc();
      v57[0] = v19;
      *(_DWORD *)v18 = 136315138;
      LOBYTE(v56) = a1;
      v20 = sub_22D8B6E28();
      v56 = sub_22D8755FC(v20, v21, (uint64_t *)v57);
      sub_22D8B7044();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D86F000, v16, v17, "Error creating URL for punchout for app %s", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v19, -1, -1);
      MEMORY[0x22E31A4BC](v18, -1, -1);
    }

  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v10, v11);
    v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
    v23 = (void *)sub_22D8B5B80();
    objc_msgSend(v22, sel_setPunchOutUri_, v23);

    v24 = v22;
    sub_22D8B5C34();
    sub_22D8B5C10();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v25 = (void *)sub_22D8B6E04();
    swift_bridgeObjectRelease();
    objc_msgSend(v24, sel_setAceId_, v25);

    v26 = objc_msgSend(v24, sel_dictionary);
    if (v26)
    {
      v27 = v26;
      v28 = (void *)objc_opt_self();
      v57[0] = 0;
      v29 = objc_msgSend(v28, sel_dataWithPropertyList_format_options_error_, v27, 200, 0, v57);
      v30 = v57[0];
      if (v29)
      {
        v31 = sub_22D8B5BC8();
        v33 = v32;

        sub_22D8B5BBC();
        sub_22D8B6B58();
        sub_22D8762DC(v31, v33);

        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
        v34 = sub_22D8B6B64();
        return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(a2, 0, 1, v34);
      }
      v36 = v30;
      v37 = (void *)sub_22D8B5B74();

      swift_willThrow();
      if (qword_255D9A3D0 != -1)
        swift_once();
      v38 = sub_22D8B6D80();
      __swift_project_value_buffer(v38, (uint64_t)qword_255D9F738);
      v39 = v37;
      v40 = v37;
      v41 = sub_22D8B6D68();
      v42 = sub_22D8B6FB4();
      v43 = v42;
      if (os_log_type_enabled(v41, v42))
      {
        v44 = swift_slowAlloc();
        v54 = v43;
        v45 = (uint8_t *)v44;
        v55 = (void *)swift_slowAlloc();
        v56 = (uint64_t)v37;
        v57[0] = v55;
        v53 = v45;
        *(_DWORD *)v45 = 136315138;
        v52 = v45 + 4;
        v46 = v37;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A838);
        v47 = sub_22D8B6E28();
        v56 = sub_22D8755FC(v47, v48, (uint64_t *)v57);
        sub_22D8B7044();
        swift_bridgeObjectRelease();

        v49 = v53;
        _os_log_impl(&dword_22D86F000, v41, (os_log_type_t)v54, "Error generating ACE punch out command: %s", v53, 0xCu);
        v50 = v55;
        swift_arrayDestroy();
        MEMORY[0x22E31A4BC](v50, -1, -1);
        MEMORY[0x22E31A4BC](v49, -1, -1);

      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);

    }
  }
  v51 = sub_22D8B6B64();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(a2, 1, 1, v51);
}

uint64_t sub_22D8762DC(uint64_t a1, unint64_t a2)
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

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isTimerBobcatLocaleExpansionEnabled()()
{
  return sub_22D872DC0(4, "TimerBobcat locale expansion FeatureFlag is enabled!");
}

unint64_t sub_22D876330()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255D9BA28;
  if (!qword_255D9BA28)
  {
    v1 = sub_22D8B5F34();
    result = MEMORY[0x22E31A408](MEMORY[0x24BE97710], v1);
    atomic_store(result, (unint64_t *)&qword_255D9BA28);
  }
  return result;
}

uint64_t Siri_Nlu_External_UserParse.firstUsoTask.getter()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void (*v18)(char *, unint64_t, uint64_t);
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;

  v0 = sub_22D8B62DC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v40 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_22D8B6288();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8A0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22D8B61E0();
  v42 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v39 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v41 = (char *)&v36 - v13;
  v14 = sub_22D8B61EC();
  v15 = *(_QWORD *)(v14 + 16);
  if (v15)
  {
    v36 = v1;
    v37 = v0;
    v38 = v10;
    v16 = v14 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v17 = *(_QWORD *)(v4 + 72);
    v18 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    while (1)
    {
      v18(v6, v16, v3);
      if ((sub_22D8B6228() & 1) != 0)
        break;
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      v16 += v17;
      if (!--v15)
      {
        v19 = 1;
        goto LABEL_8;
      }
    }
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v6, v3);
    v19 = 0;
LABEL_8:
    v0 = v37;
    v10 = v38;
    v1 = v36;
  }
  else
  {
    v19 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v9, v19, 1, v3);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) != 1)
  {
    v20 = v40;
    sub_22D8B6258();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    v21 = v39;
    sub_22D8B62B8();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v20, v0);
    v23 = v41;
    v22 = v42;
    (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v41, v21, v10);
    sub_22D8B636C();
    v30 = MEMORY[0x22E318FC8]();
    v31 = v30;
    if (v30 >> 62)
    {
      if (sub_22D8B71C4())
        goto LABEL_21;
    }
    else if (*(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_21:
      if ((v31 & 0xC000000000000001) != 0)
      {
        v28 = MEMORY[0x22E319D0C](0, v31);
        goto LABEL_24;
      }
      if (*(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v28 = *(_QWORD *)(v31 + 32);
        swift_retain();
LABEL_24:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v10);
        swift_release();
        return v28;
      }
      __break(1u);
      goto LABEL_32;
    }
    swift_bridgeObjectRelease();
    if (qword_255D9A308 == -1)
    {
LABEL_27:
      v32 = sub_22D8B6D80();
      __swift_project_value_buffer(v32, (uint64_t)qword_255D9A888);
      v33 = sub_22D8B6D68();
      v34 = sub_22D8B6FB4();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_22D86F000, v33, v34, "NLToSiriKitIntentConverter userStartUSOGraph has no tasks. Returning nil intent", v35, 2u);
        MEMORY[0x22E31A4BC](v35, -1, -1);
      }

      swift_release();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v10);
      return 0;
    }
LABEL_32:
    swift_once();
    goto LABEL_27;
  }
  sub_22D8740E0((uint64_t)v9, &qword_255D9A8A0);
  if (qword_255D9A308 != -1)
    swift_once();
  v24 = sub_22D8B6D80();
  __swift_project_value_buffer(v24, (uint64_t)qword_255D9A888);
  v25 = sub_22D8B6D68();
  v26 = sub_22D8B6FB4();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_22D86F000, v25, v26, "Failed to parse userParse. Returning nil intent", v27, 2u);
    MEMORY[0x22E31A4BC](v27, -1, -1);
  }

  return 0;
}

uint64_t *SiriReferenceResolutionResolver.shared.unsafeMutableAddressor()
{
  if (qword_255D9A3A0 != -1)
    swift_once();
  return &static SiriReferenceResolutionResolver.shared;
}

uint64_t SiriReferenceResolutionResolver.hasReference(usoEntity:)(uint64_t result)
{
  _QWORD *v1;
  char v2;

  if (result)
  {
    __swift_project_boxed_opaque_existential_1(v1, v1[3]);
    swift_retain();
    v2 = sub_22D8B6C00();
    swift_release();
    return v2 & 1;
  }
  return result;
}

uint64_t UsoEntity_common_DateTime.toDateTimeWithMeridiemSetByUser()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE68);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_22D8B64F8();
  if (!sub_22D8B6AA4())
  {
    v5 = sub_22D8B6A38();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v2, 1, 1, v5);
    goto LABEL_6;
  }
  sub_22D8B6A44();
  swift_release();
  v4 = sub_22D8B6A38();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4) == 1)
  {
LABEL_6:
    sub_22D8740E0((uint64_t)v2, &qword_255D9AE68);
    return v3;
  }
  sub_22D8740E0((uint64_t)v2, &qword_255D9AE68);
  if (sub_22D8B6AA4())
  {
    sub_22D8B69FC();
    swift_release();
  }
  return v3;
}

uint64_t static DateTimeInferenceUtils.inferDateTime(from:anchorDate:)(uint64_t a1, uint64_t a2)
{
  return sub_22D876A04(a1, 0, a2);
}

uint64_t sub_22D876A04(uint64_t a1, int a2, uint64_t a3)
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  char *v49;
  unsigned int (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  char v56;
  void (*v57)(char *, uint64_t);
  NSObject *v58;
  os_log_type_t v59;
  _BOOL4 v60;
  uint64_t v61;
  uint64_t v62;
  uint8_t *v63;
  char *v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(char *);
  char *v74;
  int *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  id v79;
  void *v80;
  id v81;
  unsigned int *v82;
  char *v83;
  char *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  NSObject *v89;
  os_log_type_t v90;
  uint8_t *v91;
  uint64_t v92;
  char v93;
  char v94;
  void (*v95)(char *, uint64_t);
  NSObject *v96;
  os_log_type_t v97;
  _BOOL4 v98;
  uint8_t *v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  NSObject *v104;
  os_log_type_t v105;
  uint8_t *v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  uint64_t v112;
  unint64_t v113;
  char v114;
  NSObject *v115;
  os_log_type_t v116;
  uint8_t *v117;
  uint64_t v118;
  char v119;
  char v120;
  uint64_t v121;
  unint64_t v122;
  uint64_t v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  char *v129;
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
  char *v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  char *v150;
  char *v151;
  uint64_t v152;
  uint64_t v153;
  char *v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  int v158;
  uint64_t v159;
  uint64_t v160;
  char *v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  char *v165;
  uint64_t v166;
  char *v167;
  char *v168;
  uint64_t v169;
  uint64_t v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  _QWORD v177[4];

  v159 = a3;
  v158 = a2;
  v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A930);
  v126 = *(_QWORD *)(v131 - 8);
  v4 = MEMORY[0x24BDAC7A8](v131);
  v125 = (char *)&v123 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v163 = (char *)&v123 - v6;
  v156 = sub_22D8B6924();
  v155 = *(_QWORD *)(v156 - 8);
  MEMORY[0x24BDAC7A8](v156);
  v157 = (char *)&v123 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v153 = sub_22D8B6930();
  v152 = *(_QWORD *)(v153 - 8);
  MEMORY[0x24BDAC7A8](v153);
  v154 = (char *)&v123 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v135 = sub_22D8B6948();
  v134 = *(_QWORD *)(v135 - 8);
  MEMORY[0x24BDAC7A8](v135);
  v161 = (char *)&v123 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v149 = sub_22D8B6954();
  v148 = *(_QWORD *)(v149 - 8);
  MEMORY[0x24BDAC7A8](v149);
  v151 = (char *)&v123 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_22D8B5D24();
  MEMORY[0x24BDAC7A8](v11);
  v150 = (char *)&v123 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v144 = sub_22D8B5C40();
  v143 = *(_QWORD *)(v144 - 8);
  MEMORY[0x24BDAC7A8](v144);
  v141 = (char *)&v123 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v166 = sub_22D8B6D80();
  v145 = *(_QWORD *)(v166 - 8);
  MEMORY[0x24BDAC7A8](v166);
  v142 = (char *)&v123 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v140 = type metadata accessor for SiriTimeMeasurement();
  MEMORY[0x24BDAC7A8](v140);
  v162 = (uint64_t)&v123 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v133 = sub_22D8B6918();
  v132 = *(_QWORD *)(v133 - 8);
  MEMORY[0x24BDAC7A8](v133);
  v167 = (char *)&v123 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_22D8B5D00();
  v130 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v129 = (char *)&v123 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v139 = sub_22D8B5C7C();
  v138 = *(_QWORD *)(v139 - 8);
  v19 = MEMORY[0x24BDAC7A8](v139);
  v147 = (char *)&v123 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v146 = (char *)&v123 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v165 = (char *)&v123 - v23;
  v137 = sub_22D8B6990();
  v136 = *(_QWORD *)(v137 - 8);
  MEMORY[0x24BDAC7A8](v137);
  v25 = (char *)&v123 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v164 = sub_22D8B5D0C();
  v160 = *(_QWORD *)(v164 - 8);
  MEMORY[0x24BDAC7A8](v164);
  v168 = (char *)&v123 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A938);
  MEMORY[0x24BDAC7A8](v27);
  v29 = (char *)&v123 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_22D8B5B5C();
  v31 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v33 = (char *)&v123 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A900);
  v35 = MEMORY[0x24BDAC7A8](v34);
  v128 = (char *)&v123 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = MEMORY[0x24BDAC7A8](v35);
  v39 = (char *)&v123 - v38;
  MEMORY[0x24BDAC7A8](v37);
  v41 = (char *)&v123 - v40;
  v172 = sub_22D8B5BF8();
  v170 = *(_QWORD *)(v172 - 8);
  v42 = MEMORY[0x24BDAC7A8](v172);
  MEMORY[0x24BDAC7A8](v42);
  v171 = (char *)&v123 - v44;
  v169 = a1;
  if (!a1)
  {
    if (qword_255D9A310 != -1)
      swift_once();
    __swift_project_value_buffer(v166, (uint64_t)qword_255D9A8E8);
    v46 = sub_22D8B6D68();
    v47 = sub_22D8B6FC0();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v48 = 0;
      _os_log_impl(&dword_22D86F000, v46, v47, "Can NOT infer dateTime from nil.", v48, 2u);
      MEMORY[0x22E31A4BC](v48, -1, -1);
    }

    return 0;
  }
  v127 = v43;
  if (!v159)
  {
    v45 = v170;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v170 + 56))(v41, 1, 1, v172);
    swift_retain();
    goto LABEL_12;
  }
  swift_retain();
  DateTime.dateComponentsIn24HourClock(shouldUseInferredMeridiem:)(1, (uint64_t)v29);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30) == 1)
  {
    sub_22D8740E0((uint64_t)v29, &qword_255D9A938);
    v45 = v170;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v170 + 56))(v41, 1, 1, v172);
LABEL_12:
    if (qword_255D9A318 != -1)
      swift_once();
    v51 = __swift_project_value_buffer(v34, (uint64_t)qword_255D9F6D0);
    sub_22D8782E4(v51, (uint64_t)v39);
    v50 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v45 + 48);
    v52 = v172;
    if (v50(v39, 1, v172) == 1)
    {
      sub_22D8740E0((uint64_t)v39, &qword_255D9A900);
      sub_22D8B5BEC();
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v171, v39, v52);
    }
    sub_22D8740E0((uint64_t)v41, &qword_255D9A900);
    goto LABEL_18;
  }
  (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v33, v29, v30);
  v49 = v168;
  sub_22D8B5CE8();
  sub_22D8B5CC4();
  (*(void (**)(char *, uint64_t))(v160 + 8))(v49, v164);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v30);
  v45 = v170;
  v50 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v170 + 48);
  if (v50(v41, 1, v172) == 1)
    goto LABEL_12;
  v52 = v172;
  (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v171, v41, v172);
LABEL_18:
  v124 = v17;
  if (qword_255D9AC30)
  {
    v53 = qword_255D9AC30;
  }
  else
  {
    type metadata accessor for ApplicationContext();
    v53 = swift_allocObject();
    sub_22D8B61B0();
    qword_255D9AC30 = v53;
    swift_retain();
    swift_release();
  }
  sub_22D87832C(v53 + 16, (uint64_t)v177);
  swift_retain();
  swift_release();
  sub_22D8B6984();
  v54 = v168;
  sub_22D8B5CE8();
  __swift_project_boxed_opaque_existential_1(v177, v177[3]);
  v55 = v165;
  sub_22D8B5ED4();
  sub_22D889284(MEMORY[0x24BEE4AF8]);
  v56 = sub_22D8B6978();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v138 + 8))(v55, v139);
  v57 = *(void (**)(char *, uint64_t))(v160 + 8);
  v57(v54, v164);
  (*(void (**)(char *, uint64_t))(v136 + 8))(v25, v137);
  if ((v56 & 1) != 0)
  {
    if (qword_255D9A310 != -1)
      swift_once();
    __swift_project_value_buffer(v166, (uint64_t)qword_255D9A8E8);
    v58 = sub_22D8B6D68();
    v59 = sub_22D8B6FC0();
    v60 = os_log_type_enabled(v58, v59);
    v61 = v124;
    v62 = (uint64_t)v128;
    if (v60)
    {
      v63 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_22D86F000, v58, v59, "witching hours active; moving referenceDate back by 1 day", v63, 2u);
      MEMORY[0x22E31A4BC](v63, -1, -1);
    }

    v64 = v168;
    sub_22D8B5CE8();
    v65 = v130;
    v66 = v129;
    (*(void (**)(char *, _QWORD, uint64_t))(v130 + 104))(v129, *MEMORY[0x24BDCF220], v61);
    v67 = v171;
    sub_22D8B5CDC();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v66, v61);
    v57(v64, v164);
    if (v50((char *)v62, 1, v52) == 1)
    {
      sub_22D8740E0(v62, &qword_255D9A900);
    }
    else
    {
      v68 = v170;
      (*(void (**)(char *, uint64_t))(v170 + 8))(v67, v52);
      (*(void (**)(char *, uint64_t, uint64_t))(v68 + 32))(v67, v62, v52);
    }
  }
  sub_22D8B690C();
  if (qword_255D9AC30)
  {
    v69 = qword_255D9AC30;
  }
  else
  {
    type metadata accessor for ApplicationContext();
    v69 = swift_allocObject();
    sub_22D8B61B0();
    qword_255D9AC30 = v69;
    swift_retain();
    swift_release();
  }
  sub_22D87832C(v69 + 16, (uint64_t)&v175);
  swift_retain();
  swift_release();
  if (qword_255D9A310 != -1)
    swift_once();
  v70 = v166;
  v71 = __swift_project_value_buffer(v166, (uint64_t)qword_255D9A8E8);
  v72 = v145;
  v73 = *(void (**)(char *))(v145 + 16);
  v74 = v142;
  v164 = v71;
  v73(v142);
  v160 = mach_absolute_time();
  v75 = (int *)v140;
  v76 = v162;
  *(_OWORD *)(v162 + *(int *)(v140 + 28)) = xmmword_22D8B7E40;
  *(_QWORD *)(v76 + v75[8]) = 0x7FEFFFFFFFFFFFFFLL;
  v77 = v75[9];
  v78 = v141;
  sub_22D8B5C34();
  v79 = objc_allocWithZone(MEMORY[0x24BE95C78]);
  v80 = (void *)sub_22D8B5C1C();
  v81 = objc_msgSend(v79, sel_initWithNSUUID_, v80);

  (*(void (**)(char *, uint64_t))(v143 + 8))(v78, v144);
  *(_QWORD *)(v76 + v77) = v81;
  *(_BYTE *)(v76 + 8) = 27;
  ((void (*)(uint64_t, char *, uint64_t))v73)(v76 + v75[6], v74, v70);
  *(_QWORD *)v76 = v160;
  sub_22D8A9578();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v74, v70);
  __swift_project_boxed_opaque_existential_1(&v175, v176);
  sub_22D8B5ED4();
  __swift_project_boxed_opaque_existential_1(&v175, v176);
  sub_22D8B5ED4();
  __swift_project_boxed_opaque_existential_1(&v175, v176);
  sub_22D8B5ED4();
  sub_22D8B5D18();
  (*(void (**)(char *, _QWORD, uint64_t))(v148 + 104))(v151, *MEMORY[0x24BE93A10], v149);
  sub_22D8B5CE8();
  (*(void (**)(uint64_t, char *, uint64_t))(v170 + 16))(v127, v171, v172);
  sub_22D8B696C();
  swift_allocObject();
  sub_22D8B6960();
  v82 = (unsigned int *)MEMORY[0x24BE93988];
  if ((v158 & 1) == 0)
    v82 = (unsigned int *)MEMORY[0x24BE93980];
  (*(void (**)(char *, _QWORD, uint64_t))(v152 + 104))(v154, *v82, v153);
  (*(void (**)(char *, _QWORD, uint64_t))(v155 + 104))(v157, *MEMORY[0x24BE93970], v156);
  sub_22D889284(MEMORY[0x24BEE4AF8]);
  v83 = v161;
  sub_22D8B693C();
  v84 = v163;
  sub_22D8B6900();
  SiriTimeMeasurement.logDelta()();
  v85 = v126;
  v86 = v125;
  v87 = v131;
  (*(void (**)(char *, char *, uint64_t))(v126 + 16))(v125, v84, v131);
  if ((*(unsigned int (**)(char *, uint64_t))(v85 + 88))(v86, v87) == *MEMORY[0x24BE93670])
  {
    (*(void (**)(char *, uint64_t))(v85 + 96))(v86, v87);
    v88 = *(_QWORD *)v86;
    swift_retain_n();
    v89 = sub_22D8B6D68();
    v90 = sub_22D8B6FC0();
    if (os_log_type_enabled(v89, v90))
    {
      v91 = (uint8_t *)swift_slowAlloc();
      v92 = swift_slowAlloc();
      v174 = v92;
      *(_DWORD *)v91 = 136315138;
      if (sub_22D8B6AA4())
      {
        v93 = sub_22D8B69F0();
        swift_release();
        v94 = v93 & 1;
      }
      else
      {
        v94 = 2;
      }
      LOBYTE(v173) = v94;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A948);
      v112 = sub_22D8B6E28();
      v173 = sub_22D8755FC(v112, v113, &v174);
      sub_22D8B7044();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D86F000, v89, v90, "[DateTimeInferenceUtils.infer] Inference recommended meridiemSetByUser = %s", v91, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v92, -1, -1);
      MEMORY[0x22E31A4BC](v91, -1, -1);

      v103 = v172;
      v83 = v161;
    }
    else
    {

      swift_release_n();
      v103 = v172;
    }
    if (sub_22D8B6AA4() || v159 && sub_22D8B6AA4())
    {
      sub_22D8B69F0();
      swift_release();
    }
    if (sub_22D8B6AA4())
    {
      v114 = sub_22D8B69F0();
      swift_release();
      if ((v114 & 1) == 0 && sub_22D8B6AA4())
      {
        sub_22D8B69FC();
        swift_release();
      }
      swift_retain_n();
      v115 = sub_22D8B6D68();
      v116 = sub_22D8B6FC0();
      if (os_log_type_enabled(v115, v116))
      {
        v117 = (uint8_t *)swift_slowAlloc();
        v118 = swift_slowAlloc();
        v174 = v118;
        *(_DWORD *)v117 = 136315138;
        if (sub_22D8B6AA4())
        {
          v119 = sub_22D8B69F0();
          swift_release();
          v120 = v119 & 1;
        }
        else
        {
          v120 = 2;
        }
        LOBYTE(v173) = v120;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A948);
        v121 = sub_22D8B6E28();
        v173 = sub_22D8755FC(v121, v122, &v174);
        sub_22D8B7044();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22D86F000, v115, v116, "[DateTimeInferenceUtils.infer] Returning with meridiemSetByUser = %s", v117, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E31A4BC](v118, -1, -1);
        MEMORY[0x22E31A4BC](v117, -1, -1);
        swift_release();

        swift_release();
        (*(void (**)(char *, uint64_t))(v85 + 8))(v163, v131);
        (*(void (**)(char *, uint64_t))(v134 + 8))(v161, v135);
        sub_22D8758C0(v162);
        (*(void (**)(char *, uint64_t))(v132 + 8))(v167, v133);
        (*(void (**)(char *, uint64_t))(v170 + 8))(v171, v172);
        goto LABEL_71;
      }
      swift_release();
      swift_release_n();

    }
    else
    {
      if (sub_22D8B6AA4())
      {
        sub_22D8B69FC();
        swift_release();
      }
      swift_release();
    }
    swift_release();
    (*(void (**)(char *, uint64_t))(v85 + 8))(v163, v131);
    (*(void (**)(char *, uint64_t))(v134 + 8))(v83, v135);
    sub_22D8758C0(v162);
    (*(void (**)(char *, uint64_t))(v132 + 8))(v167, v133);
    (*(void (**)(char *, uint64_t))(v170 + 8))(v171, v103);
LABEL_71:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v175);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v177);
    return v88;
  }
  v95 = *(void (**)(char *, uint64_t))(v85 + 8);
  v95(v86, v87);
  swift_retain_n();
  v96 = sub_22D8B6D68();
  v97 = sub_22D8B6FB4();
  v98 = os_log_type_enabled(v96, v97);
  v168 = (char *)v95;
  if (v98)
  {
    v99 = (uint8_t *)swift_slowAlloc();
    v100 = swift_slowAlloc();
    v174 = v100;
    *(_DWORD *)v99 = 136315138;
    v101 = sub_22D8B6A74();
    v173 = sub_22D8755FC(v101, v102, &v174);
    sub_22D8B7044();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v96, v97, "Not confident when inferring alarm time, dateTime = %s", v99, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v100, -1, -1);
    MEMORY[0x22E31A4BC](v99, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  swift_retain_n();
  v104 = sub_22D8B6D68();
  v105 = sub_22D8B6FB4();
  if (os_log_type_enabled(v104, v105))
  {
    v106 = (uint8_t *)swift_slowAlloc();
    v107 = swift_slowAlloc();
    v174 = v107;
    *(_DWORD *)v106 = 136315138;
    v173 = sub_22D8B6A80();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A940);
    v108 = sub_22D8B7020();
    v110 = v109;
    swift_release();
    v173 = sub_22D8755FC(v108, v110, &v174);
    sub_22D8B7044();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v104, v105, "%s", v106, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v107, -1, -1);
    MEMORY[0x22E31A4BC](v106, -1, -1);
    swift_release();
  }
  else
  {
    swift_release_n();
  }

  swift_release();
  ((void (*)(char *, uint64_t))v168)(v163, v131);
  (*(void (**)(char *, uint64_t))(v134 + 8))(v161, v135);
  sub_22D8758C0(v162);
  (*(void (**)(char *, uint64_t))(v132 + 8))(v167, v133);
  (*(void (**)(char *, uint64_t))(v170 + 8))(v171, v172);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v175);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v177);
  return 0;
}

uint64_t sub_22D8782E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A900);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D87832C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

INDateComponentsRange_optional __swiftcall DateTime.asTimePoint(shouldUseInferredMeridiem:insertToEndTime:)(Swift::Bool shouldUseInferredMeridiem, Swift::Bool insertToEndTime)
{
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
  uint64_t v16;
  char *v17;
  INDateComponentsRange v18;
  uint64_t v19;
  objc_class *v20;
  objc_class *v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  objc_class *v28;
  _QWORD *v29;
  uint8_t *v30;
  id v31;
  void *v32;
  void *v33;
  char v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  Swift::Bool v38;
  id v39;
  void *v40;
  char *v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  void (*v44)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  id v53;
  objc_class *v54;
  id v55;
  id v56;
  objc_class *v57;
  NSObject *v58;
  objc_class *v59;
  os_log_type_t v60;
  uint8_t *v61;
  _QWORD *v62;
  objc_class *v63;
  id v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  _BOOL4 v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  _BOOL4 v72;
  char *v73;
  char *v74;
  objc_class *v75;
  uint64_t v76;
  uint64_t v77[2];
  INDateComponentsRange_optional result;

  v3 = v2;
  v68 = insertToEndTime;
  v72 = shouldUseInferredMeridiem;
  v77[1] = *MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A938);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v65 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v74 = (char *)&v65 - v11;
  v12 = sub_22D8B5B5C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v73 = (char *)&v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v65 - v16;
  v18.super.isa = DateTime.asDateComponentsRange()().super.isa;
  if (qword_255D9A358 != -1)
    swift_once();
  v19 = sub_22D8B6D80();
  v20 = (objc_class *)__swift_project_value_buffer(v19, (uint64_t)qword_255D9AE50);
  v21 = v18.super.isa;
  v75 = v20;
  v22 = sub_22D8B6D68();
  v23 = sub_22D8B6FC0();
  v24 = os_log_type_enabled(v22, v23);
  v69 = v10;
  if (v24)
  {
    v25 = swift_slowAlloc();
    v67 = v3;
    v26 = (uint8_t *)v25;
    v27 = swift_slowAlloc();
    v70 = v13;
    v71 = v12;
    v66 = (_QWORD *)v27;
    *(_DWORD *)v26 = 138412290;
    v77[0] = (uint64_t)v21;
    v28 = v21;
    sub_22D8B7044();
    v29 = v66;
    *v66 = v21;

    _os_log_impl(&dword_22D86F000, v22, v23, "Got inferred dateTime.asDateComponentsRange(): %@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE78);
    swift_arrayDestroy();
    v13 = v70;
    v12 = v71;
    MEMORY[0x22E31A4BC](v29, -1, -1);
    v30 = v26;
    v3 = v67;
    MEMORY[0x22E31A4BC](v30, -1, -1);

  }
  else
  {

  }
  v31 = -[objc_class allDay](v21, sel_allDay);
  if (v31)
  {
    v32 = v31;
    sub_22D878E44();
    v33 = (void *)sub_22D8B6FD8();
    v34 = sub_22D8B6FF0();

    if ((v34 & 1) != 0)
    {
      v35 = sub_22D8B6D68();
      v36 = sub_22D8B6FC0();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_22D86F000, v35, v36, "User didn't mention a time point, mentioned a day.", v37, 2u);
        MEMORY[0x22E31A4BC](v37, -1, -1);

LABEL_23:
        v53 = 0;
        goto LABEL_24;
      }

      goto LABEL_22;
    }

  }
  v39 = -[objc_class startDateComponents](v21, sel_startDateComponents);
  if (!v39)
  {
    v43 = (uint64_t)v74;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v74, 1, 1, v12);
    goto LABEL_17;
  }
  v40 = v39;
  v41 = v73;
  sub_22D8B5A9C();

  v42 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v43 = (uint64_t)v74;
  v42(v74, v41, v12);
  v44 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v44(v43, 0, 1, v12);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v43, 1, v12) == 1)
  {
LABEL_17:
    sub_22D8740E0(v43, &qword_255D9A938);
    swift_retain_n();
    v47 = sub_22D8B6D68();
    v48 = sub_22D8B6FC0();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      v50 = swift_slowAlloc();
      v76 = v3;
      v77[0] = v50;
      *(_DWORD *)v49 = 136315138;
      sub_22D8B6AB0();
      v75 = v21;
      sub_22D879430(&qword_255D9AE70, (uint64_t (*)(uint64_t))MEMORY[0x24BE942A8], MEMORY[0x24BE942D8]);
      v51 = sub_22D8B7314();
      v76 = sub_22D8755FC(v51, v52, v77);
      sub_22D8B7044();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D86F000, v47, v48, "Failed to get startDateComponents from inferred dateTime: %s", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v50, -1, -1);
      MEMORY[0x22E31A4BC](v49, -1, -1);

      goto LABEL_23;
    }

    swift_release_n();
LABEL_22:

    goto LABEL_23;
  }
  v42(v17, (char *)v43, v12);
  if ((sub_22D878E80(v3, v72) & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
    goto LABEL_22;
  }
  v45 = (uint64_t)v69;
  if (v68)
  {
    v44((uint64_t)v69, 1, 1, v12);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v7, v17, v12);
    v46 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v69, v17, v12);
    v46 = 1;
    v44(v45, 0, 1, v12);
  }
  v44((uint64_t)v7, v46, 1, v12);
  v55 = -[objc_class recurrenceRule](v21, sel_recurrenceRule);
  v56 = objc_allocWithZone(MEMORY[0x24BDD9C98]);
  v53 = sub_22D879470(v45, (uint64_t)v7, v55);
  v57 = (objc_class *)v53;
  v58 = sub_22D8B6D68();
  v59 = v21;
  v60 = sub_22D8B6FC0();
  if (os_log_type_enabled(v58, v60))
  {
    v75 = (objc_class *)v17;
    v70 = v13;
    v71 = v12;
    v61 = (uint8_t *)swift_slowAlloc();
    v62 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v61 = 138412290;
    if (v57)
    {
      v77[0] = (uint64_t)v57;
      v63 = v57;
      sub_22D8B7044();
      v64 = v53;
    }
    else
    {
      v77[0] = 0;
      sub_22D8B7044();
      v64 = 0;
    }
    *v62 = v64;

    _os_log_impl(&dword_22D86F000, v58, v60, "Transformed in asTimePoint() to 24 Hour date time: %@", v61, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE78);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v62, -1, -1);
    MEMORY[0x22E31A4BC](v61, -1, -1);
    v57 = v59;
    v13 = v70;
    v12 = v71;
    v17 = (char *)v75;
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
LABEL_24:
  v54 = (objc_class *)v53;
  result.value.super.isa = v54;
  result.is_nil = v38;
  return result;
}

INDateComponentsRange __swiftcall DateTime.asDateComponentsRange()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[3];
  uint64_t v29;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A908);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_22D8B5D24();
  v26 = *(_QWORD *)(v3 - 8);
  v27 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22D8B5D0C();
  v24 = *(_QWORD *)(v6 - 8);
  v25 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_22D8B5C7C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v24 - v14;
  if (qword_255D9AC30)
  {
    v16 = qword_255D9AC30;
  }
  else
  {
    type metadata accessor for ApplicationContext();
    v16 = swift_allocObject();
    sub_22D8B61B0();
    qword_255D9AC30 = v16;
    swift_retain();
    swift_release();
  }
  sub_22D87832C(v16 + 16, (uint64_t)v28);
  swift_retain();
  swift_release();
  __swift_project_boxed_opaque_existential_1(v28, v29);
  sub_22D8B5ED4();
  sub_22D8B5C64();
  v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v15, v9);
  __swift_project_boxed_opaque_existential_1(v28, v29);
  sub_22D8B5ED4();
  sub_22D8B5C70();
  v17(v13, v9);
  v19 = v26;
  v18 = v27;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v2, 1, v27) == 1)
  {
    sub_22D8B5D18();
    sub_22D8740E0((uint64_t)v2, &qword_255D9A908);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v5, v2, v18);
  }
  v20 = v25;
  v21 = v24;
  v22 = sub_22D8B6A8C();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v18);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v20);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  return (INDateComponentsRange)v22;
}

unint64_t sub_22D878E44()
{
  unint64_t result;

  result = qword_255D9A970;
  if (!qword_255D9A970)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255D9A970);
  }
  return result;
}

uint64_t sub_22D878E80(uint64_t a1, char a2)
{
  char v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v21;

  if (!sub_22D8B6AA4())
  {
    if (qword_255D9A358 != -1)
      swift_once();
    v12 = sub_22D8B6D80();
    __swift_project_value_buffer(v12, (uint64_t)qword_255D9AE50);
    v13 = sub_22D8B6D68();
    v14 = sub_22D8B6FC0();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_22D86F000, v13, v14, "adjustHour(in:inferMeridiem:) Can not find time in inferred dateTime.", v15, 2u);
      MEMORY[0x22E31A4BC](v15, -1, -1);
    }

    return 0;
  }
  sub_22D879228(a2 & 1);
  if ((v3 & 1) != 0)
  {
    if (qword_255D9A358 != -1)
      swift_once();
    v16 = sub_22D8B6D80();
    __swift_project_value_buffer(v16, (uint64_t)qword_255D9AE50);
    v17 = sub_22D8B6D68();
    v18 = sub_22D8B6FC0();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_22D86F000, v17, v18, "adjustHour(in:inferMeridiem:) Can not find hour in inferred dateTime.", v19, 2u);
      MEMORY[0x22E31A4BC](v19, -1, -1);
      swift_release();

    }
    else
    {

      swift_release();
    }
    return 0;
  }
  sub_22D8B5AD8();
  if (qword_255D9A358 != -1)
    swift_once();
  v4 = sub_22D8B6D80();
  __swift_project_value_buffer(v4, (uint64_t)qword_255D9AE50);
  swift_retain_n();
  v5 = sub_22D8B6D68();
  v6 = sub_22D8B6FC0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v21 = v8;
    *(_DWORD *)v7 = 136315394;
    sub_22D8B6A14();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE88);
    v9 = sub_22D8B6E28();
    sub_22D8755FC(v9, v10, &v21);
    sub_22D8B7044();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2048;
    sub_22D8B7044();
    _os_log_impl(&dword_22D86F000, v5, v6, "adjustHour(in:inferMeridiem:), original hour = %s, fixed hour = %ld", (uint8_t *)v7, 0x16u);
    v11 = 1;
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v8, -1, -1);
    MEMORY[0x22E31A4BC](v7, -1, -1);
    swift_release();

  }
  else
  {

    swift_release_n();
    return 1;
  }
  return v11;
}

uint64_t sub_22D879228(int a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  BOOL v17;
  _QWORD v19[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE68);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_22D8B6A38();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v19 - v10;
  v12 = sub_22D8B6A14();
  if ((v13 & 1) == 0 && ((sub_22D8B69F0() | a1) & 1) != 0 && v12 && (unint64_t)(v12 - 13) >= 0xB)
  {
    if (v12 == 24)
      return 0;
    sub_22D8B6A44();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {
      sub_22D8740E0((uint64_t)v4, &qword_255D9AE68);
      return v12;
    }
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v11, v4, v5);
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x24BE93F70], v5);
    sub_22D879430(&qword_255D9AE80, (uint64_t (*)(uint64_t))MEMORY[0x24BE93F78], MEMORY[0x24BE93F88]);
    sub_22D8B6E94();
    sub_22D8B6E94();
    v15 = v19[0];
    v14 = v19[1];
    v16 = *(void (**)(char *, uint64_t))(v6 + 8);
    v16(v9, v5);
    v16(v11, v5);
    if (v14 == v15)
    {
      if (v12 == 12)
        return v12;
      v17 = __OFADD__(v12, 12);
      v12 += 12;
      if (!v17)
        return v12;
      __break(1u);
    }
    if (v12 == 12)
      return 0;
  }
  return v12;
}

uint64_t sub_22D879430(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E31A408](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id sub_22D879470(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(uint64_t, uint64_t, uint64_t);
  void *v11;
  void *v12;
  id v13;

  v4 = v3;
  v8 = sub_22D8B5B5C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  v11 = 0;
  if (v10(a1, 1, v8) != 1)
  {
    v11 = (void *)sub_22D8B5A90();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  }
  if (v10(a2, 1, v8) == 1)
  {
    v12 = 0;
  }
  else
  {
    v12 = (void *)sub_22D8B5A90();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a2, v8);
  }
  v13 = objc_msgSend(v4, sel_initWithStartDateComponents_endDateComponents_recurrenceRule_, v11, v12, a3);

  return v13;
}

uint64_t UsoEntity_common_Alarm.relativeOffsetInMinutes.getter()
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int (*v28)(uint64_t, uint64_t, uint64_t);
  char v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int (*v38)(uint64_t, uint64_t, uint64_t);
  uint64_t v39;
  char *v40;
  void (*v41)(char *, uint64_t);
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  _QWORD v54[2];
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v0 = sub_22D8B6798();
  v59 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v55 = (char *)v54 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B458);
  MEMORY[0x24BDAC7A8](v57);
  v60 = (char *)v54 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B460);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v56 = (uint64_t)v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v58 = (char *)v54 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v61 = (uint64_t)v54 - v8;
  v9 = sub_22D8B6528();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B468);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B470);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)v54 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)v54 - v23;
  v62 = sub_22D8B6444();
  if (!v62)
    return 0;
  if (!sub_22D8B6444() || (v54[0] = v0, v25 = sub_22D8B642C(), swift_release(), !v25))
  {
LABEL_35:
    swift_release();
    return 0;
  }
  v54[1] = v25;
  v26 = sub_22D8B6534();
  swift_release();
  if (v26)
  {
    if (sub_22D8B6534())
    {
      sub_22D8B6468();
      swift_release();
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v24, 1, 1, v9);
    }
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v22, *MEMORY[0x24BEA06E8], v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v22, 0, 1, v9);
    v27 = (uint64_t)&v15[*(int *)(v13 + 48)];
    sub_22D88AE10((uint64_t)v24, (uint64_t)v15, &qword_255D9B470);
    sub_22D88AE10((uint64_t)v22, v27, &qword_255D9B470);
    v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    if (v28((uint64_t)v15, 1, v9) == 1)
    {
      sub_22D8740E0((uint64_t)v22, &qword_255D9B470);
      sub_22D8740E0((uint64_t)v24, &qword_255D9B470);
      if (v28(v27, 1, v9) == 1)
      {
        sub_22D8740E0((uint64_t)v15, &qword_255D9B470);
        goto LABEL_17;
      }
LABEL_14:
      sub_22D8740E0((uint64_t)v15, &qword_255D9B468);
      goto LABEL_34;
    }
    sub_22D88AE10((uint64_t)v15, (uint64_t)v19, &qword_255D9B470);
    if (v28(v27, 1, v9) == 1)
    {
      sub_22D8740E0((uint64_t)v22, &qword_255D9B470);
      sub_22D8740E0((uint64_t)v24, &qword_255D9B470);
      (*(void (**)(char *, uint64_t))(v10 + 8))(v19, v9);
      goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v12, v27, v9);
    sub_22D879430(&qword_255D9B480, (uint64_t (*)(uint64_t))MEMORY[0x24BEA06F0], MEMORY[0x24BEA0700]);
    v29 = sub_22D8B6DF8();
    v30 = *(void (**)(char *, uint64_t))(v10 + 8);
    v30(v12, v9);
    sub_22D8740E0((uint64_t)v22, &qword_255D9B470);
    sub_22D8740E0((uint64_t)v24, &qword_255D9B470);
    v30(v19, v9);
    sub_22D8740E0((uint64_t)v15, &qword_255D9B470);
    if ((v29 & 1) == 0)
      goto LABEL_34;
  }
LABEL_17:
  v31 = sub_22D8B6438();
  swift_release();
  if (!v31)
    goto LABEL_28;
  if (sub_22D8B6438())
  {
    v32 = v61;
    sub_22D8B6468();
    swift_release();
    v33 = v54[0];
    v35 = v59;
    v34 = (uint64_t)v60;
  }
  else
  {
    v35 = v59;
    v32 = v61;
    v33 = v54[0];
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v59 + 56))(v61, 1, 1, v54[0]);
    v34 = (uint64_t)v60;
  }
  v36 = (uint64_t)v58;
  (*(void (**)(char *, _QWORD, uint64_t))(v35 + 104))(v58, *MEMORY[0x24BEA1EA0], v33);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v35 + 56))(v36, 0, 1, v33);
  v37 = v34 + *(int *)(v57 + 48);
  sub_22D88AE10(v32, v34, &qword_255D9B460);
  sub_22D88AE10(v36, v37, &qword_255D9B460);
  v38 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48);
  if (v38(v34, 1, v33) == 1)
  {
    sub_22D8740E0(v36, &qword_255D9B460);
    sub_22D8740E0(v32, &qword_255D9B460);
    if (v38(v37, 1, v33) == 1)
    {
      sub_22D8740E0(v34, &qword_255D9B460);
      goto LABEL_28;
    }
    goto LABEL_26;
  }
  v39 = v56;
  sub_22D88AE10(v34, v56, &qword_255D9B460);
  if (v38(v37, 1, v33) == 1)
  {
    sub_22D8740E0(v36, &qword_255D9B460);
    sub_22D8740E0(v32, &qword_255D9B460);
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v39, v33);
LABEL_26:
    sub_22D8740E0(v34, &qword_255D9B458);
LABEL_34:
    swift_release();
    goto LABEL_35;
  }
  v40 = v55;
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 32))(v55, v37, v33);
  sub_22D879430(&qword_255D9B478, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1EB0], MEMORY[0x24BEA1EC0]);
  LODWORD(v62) = sub_22D8B6DF8();
  v41 = *(void (**)(char *, uint64_t))(v35 + 8);
  v41(v40, v33);
  sub_22D8740E0(v36, &qword_255D9B460);
  sub_22D8740E0(v61, &qword_255D9B460);
  v41((char *)v39, v33);
  sub_22D8740E0(v34, &qword_255D9B460);
  if ((v62 & 1) == 0)
    goto LABEL_34;
LABEL_28:
  UsoEntity_common_Duration.valueInSeconds.getter();
  v43 = v42;
  objc_msgSend((id)objc_opt_self(), sel_minimumDuration);
  if (v44 >= v43)
    goto LABEL_34;
  if (qword_255D9A3B0 != -1)
  {
    v62 = 0x404E000000000000;
    swift_once();
  }
  v45 = sub_22D8B6D80();
  __swift_project_value_buffer(v45, (uint64_t)qword_255D9B440);
  v46 = sub_22D8B6D68();
  v47 = sub_22D8B6FC0();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    v49 = swift_slowAlloc();
    v64 = v49;
    *(_DWORD *)v48 = 136315138;
    v50 = sub_22D8B6F54();
    v63 = sub_22D8755FC(v50, v51, &v64);
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v46, v47, "Got UsoEntity_common_Alarm relativeOffsetInMinutes (from now): %s", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v49, -1, -1);
    MEMORY[0x22E31A4BC](v48, -1, -1);
  }

  v52 = sub_22D8B6F48();
  swift_release();
  swift_release();
  return v52;
}

uint64_t static DateTimeInferenceUtils.defaultAnchorDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A900);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255D9A318 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v2, (uint64_t)qword_255D9F6D0);
  sub_22D8782E4(v5, (uint64_t)v4);
  v6 = sub_22D8B5BF8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v4, 1, v6) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v4, v6);
  sub_22D8740E0((uint64_t)v4, &qword_255D9A900);
  return sub_22D8B5BEC();
}

uint64_t Bool.number.getter()
{
  sub_22D878E44();
  return sub_22D8B6FCC();
}

uint64_t SirikitApp.init(app:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[3];
  uint64_t v40;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B318);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_22D8B5C7C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255D9AC30)
  {
    v9 = qword_255D9AC30;
  }
  else
  {
    type metadata accessor for ApplicationContext();
    v9 = swift_allocObject();
    sub_22D8B61B0();
    qword_255D9AC30 = v9;
    swift_retain();
    swift_release();
  }
  sub_22D87832C(v9 + 16, (uint64_t)v39);
  swift_retain();
  swift_release();
  __swift_project_boxed_opaque_existential_1(v39, v40);
  v10 = sub_22D8B5F04();
  sub_22D87832C((uint64_t)v39, (uint64_t)v38);
  if ((v10 & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
    sub_22D87832C((uint64_t)v39, (uint64_t)v37);
LABEL_7:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
LABEL_8:
    sub_22D8B6B40();
    swift_allocObject();
    sub_22D8B6B34();
    sub_22D8B6BC4();
    if (v12)
    {
      sub_22D8B6E34();
      swift_bridgeObjectRelease();
      v13 = sub_22D8B6B64();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v4, 0, 1, v13);
    }
    else
    {
      v14 = sub_22D8B6B64();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v4, 1, 1, v14);
    }
    sub_22D8B6B28();
    swift_release();
    sub_22D8740E0((uint64_t)v4, &qword_255D9B318);
    sub_22D8B6B1C();
    swift_release();
    swift_bridgeObjectRelease();
    v15 = sub_22D8B6B4C();
    swift_release();
    goto LABEL_12;
  }
  __swift_project_boxed_opaque_existential_1(v38, v38[3]);
  v11 = sub_22D8B5EC8();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v38);
  sub_22D87832C((uint64_t)v39, (uint64_t)v37);
  if ((v11 & 1) != 0)
    goto LABEL_7;
  __swift_project_boxed_opaque_existential_1(v37, v37[3]);
  v17 = sub_22D8B5EF8();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
  if ((v17 & 1) != 0)
    goto LABEL_8;
  v18 = (void *)sub_22D8B6030();
  if (v18)
  {
    v19 = v18;
    v20 = objc_msgSend(v18, sel_appNameMap);

    if (v20)
    {
      v21 = sub_22D8B6DD4();

      __swift_project_boxed_opaque_existential_1(v39, v40);
      sub_22D8B5ED4();
      v22 = (void *)objc_opt_self();
      sub_22D8B5C4C();
      v23 = (void *)sub_22D8B6E04();
      swift_bridgeObjectRelease();
      v24 = objc_msgSend(v22, sel_getFallbackLocales_includingNonSiriLocales_, v23, 1);

      v25 = sub_22D8B6EB8();
      MEMORY[0x24BDAC7A8](v26);
      *(&v34 - 2) = v25;
      sub_22D8A0C10(v21, sub_22D8A0EEC);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
  }
  if (qword_255D9A380 != -1)
    swift_once();
  v27 = sub_22D8B6D80();
  __swift_project_value_buffer(v27, (uint64_t)qword_255D9B2E0);
  swift_retain_n();
  v28 = sub_22D8B6D68();
  v29 = sub_22D8B6FB4();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    v31 = swift_slowAlloc();
    v35 = a1;
    v36 = v31;
    *(_DWORD *)v30 = 136315138;
    sub_22D8B6BD0();
    sub_22D8A0EA4();
    v32 = sub_22D8B7314();
    v35 = sub_22D8755FC(v32, v33, &v36);
    sub_22D8B7044();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v28, v29, "Could not get app info from App object: %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v31, -1, -1);
    MEMORY[0x22E31A4BC](v30, -1, -1);

    swift_release();
  }
  else
  {

    swift_release_n();
  }
  v15 = 0;
LABEL_12:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v39);
  return v15;
}

uint64_t sub_22D87A4F0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(_QWORD, _QWORD, _QWORD);
  uint64_t v29;

  if (qword_255D9A3F0 != -1)
    swift_once();
  v2 = v0[11];
  v1 = v0[12];
  v3 = v0[10];
  v4 = v0[7];
  v5 = (void *)v0[5];
  v6 = sub_22D8B6D80();
  __swift_project_value_buffer(v6, (uint64_t)qword_255D9B9C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v7 = v5;
  v8 = sub_22D8B6D68();
  v9 = sub_22D8B6FC0();
  v10 = os_log_type_enabled(v8, v9);
  v12 = v0[11];
  v11 = v0[12];
  v13 = v0[10];
  if (v10)
  {
    v14 = (void *)v0[5];
    v26 = v0[11];
    v15 = swift_slowAlloc();
    v27 = swift_slowAlloc();
    v29 = v27;
    *(_DWORD *)v15 = 136315394;
    v25 = v13;
    v16 = objc_msgSend(v14, sel_patternId);
    v17 = sub_22D8B6E10();
    v19 = v18;

    v0[2] = sub_22D8755FC(v17, v19, &v29);
    sub_22D8B7044();
    swift_bridgeObjectRelease();

    *(_WORD *)(v15 + 12) = 2080;
    sub_22D8B60B4();
    v20 = sub_22D8B6E28();
    v0[3] = sub_22D8755FC(v20, v21, &v29);
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v11, v25);
    _os_log_impl(&dword_22D86F000, v8, v9, "generatePatternOutput #Response output for pattern %s, dialogPhase: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v27, -1, -1);
    MEMORY[0x22E31A4BC](v15, -1, -1);
  }
  else
  {
    v22 = (void *)v0[5];

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }

  sub_22D8B5FF4();
  swift_allocObject();
  v0[13] = sub_22D8B5FE8();
  v28 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))((int)*MEMORY[0x24BE97F00] + MEMORY[0x24BE97F00]);
  v23 = (_QWORD *)swift_task_alloc();
  v0[14] = v23;
  *v23 = v0;
  v23[1] = sub_22D87A8AC;
  return v28(v0[4], v0[5], v0[7]);
}

uint64_t sub_22D87A7D0()
{
  uint64_t v0;
  void *v1;

  swift_release();
  v1 = (void *)sub_22D8B5B68();
  sub_22D8A9F34((uint64_t)v1, 0, 0, 0x80u);

  SiriTimeMeasurement.logDelta()();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D87A858()
{
  uint64_t v0;

  SiriTimeMeasurement.logDelta()();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D87A8AC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t OutputGenerationManifest.generatePatternOutput(result:measure:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  v4[8] = sub_22D8B5F34();
  v4[9] = swift_task_alloc();
  v5 = sub_22D8B6114();
  v4[10] = v5;
  v4[11] = *(_QWORD *)(v5 - 8);
  v4[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22D87A9A0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 112);
  sub_22D87C298(v0 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v4 = sub_22D87B568(v2, v1, v3, (void (*)(_OWORD *__return_ptr, id *, uint64_t, uint64_t))sub_22D87CA44, (uint64_t (*)(BOOL, unint64_t, uint64_t, uint64_t, __n128))sub_22D883E94);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  if (qword_255D9A370 != -1)
    swift_once();
  v5 = sub_22D8B6D80();
  __swift_project_value_buffer(v5, (uint64_t)qword_255D9B078);
  swift_bridgeObjectRetain_n();
  v6 = sub_22D8B6D68();
  v7 = sub_22D8B6FC0();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v15 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = swift_bridgeObjectRetain();
    v11 = MEMORY[0x22E319A90](v10, &type metadata for HALTimerDeviceContext);
    v13 = v12;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 120) = sub_22D8755FC(v11, v13, &v15);
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22D86F000, v6, v7, "fetchTimerContexts() got firing timers context: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v9, -1, -1);
    MEMORY[0x22E31A4BC](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v4);
}

uint64_t sub_22D87ABD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;

  swift_bridgeObjectRelease();
  v1 = *(_QWORD *)(v0 + 104);
  *(_QWORD *)(v0 + 200) = v1;
  sub_22D87C298(v0 + 16);
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = *(_QWORD *)(v0 + 176);
    v3 = sub_22D8B6CB4();
    v4 = MEMORY[0x24BEA9118];
    *(_QWORD *)(v0 + 80) = v2;
    *(_QWORD *)(v0 + 88) = v4;
    *(_QWORD *)(v0 + 56) = v3;
    v5 = swift_task_alloc();
    *(_QWORD *)(v0 + 208) = v5;
    *(_QWORD *)(v5 + 16) = v0 + 56;
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B0A8);
    *v6 = v0;
    v6[1] = sub_22D87B1CC;
    return sub_22D8B7320();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_255D9A370 != -1)
      swift_once();
    v8 = sub_22D8B6D80();
    __swift_project_value_buffer(v8, (uint64_t)qword_255D9B078);
    v9 = sub_22D8B6D68();
    v10 = sub_22D8B6FB4();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_22D86F000, v9, v10, "Failed to fetch device units for alarm contexts", v11, 2u);
      MEMORY[0x22E31A4BC](v11, -1, -1);
    }

    return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
  }
}

uint64_t sub_22D87ADA0()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;

  v1 = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v0 + 152) = v1;
  v2 = sub_22D89A64C(v1);
  *(_QWORD *)(v0 + 160) = v2;
  *(_QWORD *)(v0 + 168) = 0;
  v3 = sub_22D8B6CCC();
  *(_QWORD *)(v0 + 176) = v3;
  *(_QWORD *)(v0 + 16) = sub_22D8B6CB4();
  v4 = MEMORY[0x24BEA9118];
  *(_QWORD *)(v0 + 40) = v3;
  *(_QWORD *)(v0 + 48) = v4;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v5;
    *(_QWORD *)(v5 + 16) = v0 + 16;
    *(_QWORD *)(v5 + 24) = v2;
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B0A0);
    *v6 = v0;
    v6[1] = sub_22D87B170;
    return sub_22D8B7320();
  }
  v7 = sub_22D889578(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 200) = v7;
  sub_22D87C298(v0 + 16);
  if (*(_QWORD *)(v7 + 16))
  {
    v8 = *(_QWORD *)(v0 + 176);
    v9 = sub_22D8B6CB4();
    *(_QWORD *)(v0 + 80) = v8;
    *(_QWORD *)(v0 + 88) = v4;
    *(_QWORD *)(v0 + 56) = v9;
    v10 = swift_task_alloc();
    *(_QWORD *)(v0 + 208) = v10;
    *(_QWORD *)(v10 + 16) = v0 + 56;
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B0A8);
    *v11 = v0;
    v11[1] = sub_22D87B1CC;
    return sub_22D8B7320();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_255D9A370 != -1)
    swift_once();
  v13 = sub_22D8B6D80();
  __swift_project_value_buffer(v13, (uint64_t)qword_255D9B078);
  v14 = sub_22D8B6D68();
  v15 = sub_22D8B6FB4();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_22D86F000, v14, v15, "Failed to fetch device units for alarm contexts", v16, 2u);
    MEMORY[0x22E31A4BC](v16, -1, -1);
  }

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
}

uint64_t sub_22D87B04C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t SiriTimeDeviceContextProvider.fetchTimerContexts()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 128) = v0;
  return swift_task_switch();
}

uint64_t sub_22D87B0C0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[16];
  v2 = swift_task_alloc();
  v0[17] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[18] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B098);
  *v3 = v0;
  v3[1] = sub_22D87B04C;
  return sub_22D8B7320();
}

uint64_t sub_22D87B170()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D87B1CC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D87B228(unint64_t a1)
{
  return sub_22D89DB7C(a1, "Fetching timer context for %ld devices", "Fetching timerContexts: got nil context array");
}

uint64_t sub_22D87B23C(unint64_t a1, uint64_t a2, const char *a3, const char *a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;

  if (a1)
  {
    v6 = a1 >> 62;
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      if (sub_22D8B71C4())
        goto LABEL_4;
    }
    else
    {
      v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v7)
      {
LABEL_4:
        if (qword_255D9A370 != -1)
          swift_once();
        v8 = sub_22D8B6D80();
        __swift_project_value_buffer(v8, (uint64_t)qword_255D9B078);
        swift_bridgeObjectRetain_n();
        v9 = sub_22D8B6D68();
        v10 = sub_22D8B6FC0();
        if (os_log_type_enabled(v9, v10))
        {
          v11 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v11 = 134217984;
          if (v6)
          {
            swift_bridgeObjectRetain();
            sub_22D8B71C4();
            swift_bridgeObjectRelease();
          }
          swift_bridgeObjectRelease();
          sub_22D8B7044();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22D86F000, v9, v10, a3, v11, 0xCu);
          MEMORY[0x22E31A4BC](v11, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        goto LABEL_19;
      }
    }
    swift_bridgeObjectRelease();
  }
  if (qword_255D9A370 != -1)
    swift_once();
  v12 = sub_22D8B6D80();
  __swift_project_value_buffer(v12, (uint64_t)qword_255D9B078);
  v13 = sub_22D8B6D68();
  v14 = sub_22D8B6FB4();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_22D86F000, v13, v14, a4, v15, 2u);
    MEMORY[0x22E31A4BC](v15, -1, -1);
  }

LABEL_19:
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B108);
  return sub_22D8B6F24();
}

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t objectdestroyTm_0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D87B568(unint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_OWORD *__return_ptr, id *, uint64_t, uint64_t), uint64_t (*a5)(BOOL, unint64_t, uint64_t, uint64_t, __n128))
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  __n128 v17;
  uint64_t v18;
  uint64_t (*v20)(BOOL, unint64_t, uint64_t, uint64_t, __n128);
  __int128 v24;
  __n128 v25;
  _OWORD v26[2];
  id v27;

  if (a1 >> 62)
    goto LABEL_19;
  v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v8; v8 = sub_22D8B71C4())
  {
    v20 = a5;
    v9 = MEMORY[0x24BEE4AF8];
    for (i = 4; ; ++i)
    {
      a5 = (uint64_t (*)(BOOL, unint64_t, uint64_t, uint64_t, __n128))(i - 4);
      v12 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x22E319D0C](i - 4, a1) : *(id *)(a1 + 8 * i);
      v13 = v12;
      v14 = i - 3;
      if (__OFADD__(a5, 1))
        break;
      v27 = v12;
      a4(v26, &v27, a2, a3);
      if (v5)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return v9;
      }

      if (*(_QWORD *)&v26[0])
      {
        v25 = (__n128)v26[0];
        v24 = v26[1];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v9 = ((uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))v20)(0, *(_QWORD *)(v9 + 16) + 1, 1, v9);
        v16 = *(_QWORD *)(v9 + 16);
        v15 = *(_QWORD *)(v9 + 24);
        v17 = v25;
        if (v16 >= v15 >> 1)
        {
          v18 = v20(v15 > 1, v16 + 1, 1, v9, v25);
          v17 = v25;
          v9 = v18;
        }
        *(_QWORD *)(v9 + 16) = v16 + 1;
        v11 = v9 + 32 * v16;
        *(__n128 *)(v11 + 32) = v17;
        *(_OWORD *)(v11 + 48) = v24;
      }
      if (v14 == v8)
      {
        swift_bridgeObjectRelease();
        return v9;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_22D87B74C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t SiriTimeDeviceResolutionService.resolveDevicesAsync(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v1;
  return swift_task_switch();
}

uint64_t sub_22D87B7C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  unint64_t v6;

  v1 = *(_QWORD *)(v0 + 24);
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = *(_QWORD *)(v0 + 32);
    v3 = swift_task_alloc();
    *(_QWORD *)(v0 + 40) = v3;
    *(_QWORD *)(v3 + 16) = v2;
    *(_QWORD *)(v3 + 24) = v1;
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 48) = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B0A0);
    *v4 = v0;
    v4[1] = sub_22D87B74C;
    return sub_22D8B7320();
  }
  else
  {
    v6 = sub_22D889578(MEMORY[0x24BEE4AF8]);
    return (*(uint64_t (**)(unint64_t))(v0 + 8))(v6);
  }
}

uint64_t sub_22D87B8A0(uint64_t a1, char *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  char *v24;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;

  v3 = v2;
  v6 = sub_22D8B5C40();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  sub_22D89DB30(&qword_255D9B0F8, MEMORY[0x24BDCEA88]);
  swift_bridgeObjectRetain();
  v30 = a2;
  v11 = sub_22D8B6DEC();
  v12 = -1 << *(_BYTE *)(v10 + 32);
  v13 = v11 & ~v12;
  v14 = v10;
  v15 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v26 = v2;
    v27 = a1;
    v28 = ~v12;
    v16 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v29 = v16;
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v16 + 16);
    while (1)
    {
      v19 = v14;
      v20 = v18;
      v18(v9, *(_QWORD *)(v14 + 48) + v17 * v13, v6);
      sub_22D89DB30(&qword_255D9B118, MEMORY[0x24BDCEA98]);
      v21 = sub_22D8B6DF8();
      v22 = *(void (**)(char *, uint64_t))(v29 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v13 = (v13 + 1) & v28;
      v14 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v15 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v26;
        a1 = v27;
        v7 = v29;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v30, v6);
    v20(v27, *(_QWORD *)(*v26 + 48) + v17 * v13, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v24 = v30;
    v18(v9, v30, v6);
    v31 = *v3;
    *v3 = 0x8000000000000000;
    sub_22D87BC84((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *v3 = v31;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

void sub_22D87BAF4(uint64_t a1, unint64_t a2, char a3, uint64_t *a4, unint64_t *a5)
{
  uint64_t *v5;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  id v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v9 = *(_QWORD *)(*v5 + 16);
  v10 = *(_QWORD *)(*v5 + 24);
  if (v10 > v9 && (a3 & 1) != 0)
    goto LABEL_14;
  v11 = v9 + 1;
  if ((a3 & 1) != 0)
  {
    sub_22D89C360(v11, a4);
  }
  else
  {
    if (v10 > v9)
    {
      sub_22D89CEA4(a4);
      goto LABEL_14;
    }
    sub_22D89D268(v11, a4);
  }
  v12 = *v5;
  v13 = sub_22D8B6FE4();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_22D89DBD8(0, a5);
    v15 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
    v16 = sub_22D8B6FF0();

    if ((v16 & 1) != 0)
    {
LABEL_13:
      sub_22D8B741C();
      __break(1u);
    }
    else
    {
      v17 = ~v14;
      while (1)
      {
        a2 = (a2 + 1) & v17;
        if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v18 = *(id *)(*(_QWORD *)(v12 + 48) + 8 * a2);
        v19 = sub_22D8B6FF0();

        if ((v19 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v20 + 48) + 8 * a2) = a1;
  v21 = *(_QWORD *)(v20 + 16);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (v22)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v23;
}

uint64_t sub_22D87BC84(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_22D8B5C40();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_22D89C5F8();
  }
  else
  {
    if (v11 > v10)
    {
      sub_22D89D044();
      goto LABEL_12;
    }
    sub_22D89D4DC();
  }
  v12 = *v3;
  sub_22D89DB30(&qword_255D9B0F8, MEMORY[0x24BDCEA88]);
  v13 = sub_22D8B6DEC();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_22D89DB30(&qword_255D9B118, MEMORY[0x24BDCEA98]);
      v18 = sub_22D8B6DF8();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_22D8B741C();
  __break(1u);
  return result;
}

uint64_t sub_22D87BE78(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B198);
  return sub_22D87BEBC(a1);
}

uint64_t sub_22D87BEBC(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v22;

  if (*(_QWORD *)(a1 + 16))
  {
    if (qword_255D9A378 != -1)
      swift_once();
    v2 = sub_22D8B6D80();
    __swift_project_value_buffer(v2, (uint64_t)qword_255D9B128);
    swift_bridgeObjectRetain_n();
    v3 = sub_22D8B6D68();
    v4 = sub_22D8B6FC0();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v22 = v6;
      *(_DWORD *)v5 = 136315138;
      sub_22D8B5C40();
      v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
      sub_22D8B6C9C();
      sub_22D879430(&qword_255D9B0F8, v7, MEMORY[0x24BDCEA88]);
      swift_bridgeObjectRetain();
      v8 = sub_22D8B6DE0();
      v10 = v9;
      swift_bridgeObjectRelease();
      sub_22D8755FC(v8, v10, (uint64_t *)&v22);
      sub_22D8B7044();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D86F000, v3, v4, "Find candidate devices: %s", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v6, -1, -1);
      MEMORY[0x22E31A4BC](v5, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v22 = a1;
    swift_bridgeObjectRetain();
  }
  else
  {
    if (qword_255D9A378 != -1)
      swift_once();
    v11 = sub_22D8B6D80();
    __swift_project_value_buffer(v11, (uint64_t)qword_255D9B128);
    swift_bridgeObjectRetain_n();
    v12 = sub_22D8B6D68();
    v13 = sub_22D8B6FB4();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v22 = v15;
      *(_DWORD *)v14 = 136315138;
      v16 = sub_22D8B5C40();
      v17 = swift_bridgeObjectRetain();
      v18 = MEMORY[0x22E319A90](v17, v16);
      v20 = v19;
      swift_bridgeObjectRelease();
      sub_22D8755FC(v18, v20, (uint64_t *)&v22);
      sub_22D8B7044();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D86F000, v12, v13, "SiriTimeDeviceResolutionService.resolveDevice() found no device with ids %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v15, -1, -1);
      MEMORY[0x22E31A4BC](v14, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v22 = sub_22D889578(MEMORY[0x24BEE4AF8]);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B198);
  return sub_22D8B6F24();
}

uint64_t sub_22D87C298(uint64_t a1)
{
  destroy for SiriTimeDeviceResolutionService();
  return a1;
}

uint64_t sub_22D87C2CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];

  v17 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B188);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  sub_22D8B6D50();
  v6 = (void *)sub_22D8B6D44();
  if (qword_255D9A378 != -1)
    swift_once();
  v7 = sub_22D8B6D80();
  __swift_project_value_buffer(v7, (uint64_t)qword_255D9B128);
  v8 = sub_22D8B6D68();
  v9 = sub_22D8B6FC0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_22D86F000, v8, v9, "Fetching deviceCapabilities.", v10, 2u);
    MEMORY[0x22E31A4BC](v10, -1, -1);
  }

  sub_22D87832C(a2, (uint64_t)v19);
  v16 = v19[4];
  __swift_project_boxed_opaque_existential_1(v19, v19[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B350);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_22D8B7AC0;
  *(_QWORD *)(v11 + 32) = v6;
  v18 = v11;
  sub_22D8B6ED0();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v3);
  v12 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v13 + v12, (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  v14 = v6;
  sub_22D8B6CE4();
  swift_release();
  swift_bridgeObjectRelease();

  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
}

uint64_t sub_22D87C500()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B188);
  return sub_22D87C540();
}

uint64_t sub_22D87C540()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  if (qword_255D9A378 != -1)
    swift_once();
  v0 = sub_22D8B6D80();
  __swift_project_value_buffer(v0, (uint64_t)qword_255D9B128);
  swift_bridgeObjectRetain_n();
  v1 = sub_22D8B6D68();
  v2 = sub_22D8B6FC0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    v4 = swift_slowAlloc();
    v12 = v4;
    *(_DWORD *)v3 = 136315138;
    sub_22D8B6C9C();
    v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEA90E0];
    sub_22D8B6D08();
    sub_22D879430(&qword_255D9B190, v5, MEMORY[0x24BEE5BD8]);
    swift_bridgeObjectRetain();
    v6 = sub_22D8B6DE0();
    v8 = v7;
    swift_bridgeObjectRelease();
    sub_22D8755FC(v6, v8, &v12);
    sub_22D8B7044();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v1, v2, "Got capabilitesMap: %s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v4, -1, -1);
    MEMORY[0x22E31A4BC](v3, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v9 = swift_bridgeObjectRetain();
  v10 = sub_22D875B04(v9);
  swift_bridgeObjectRelease();
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B188);
  return sub_22D8B6F24();
}

uint64_t sub_22D87C788(uint64_t result, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t *v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;

  v4 = a4;
  v6 = a2;
  v7 = (_QWORD *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    result = sub_22D8B7188();
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v4 = result | 0x8000000000000000;
    if (v6)
      goto LABEL_3;
LABEL_36:
    v11 = 0;
    a3 = 0;
LABEL_45:
    *v7 = v4;
    v7[1] = v8;
    v7[2] = v9;
    v7[3] = v11;
    v7[4] = v10;
    return a3;
  }
  v19 = -1 << *(_BYTE *)(a4 + 32);
  v8 = a4 + 64;
  v20 = ~v19;
  v21 = -v19;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  else
    v22 = -1;
  v10 = v22 & *(_QWORD *)(a4 + 64);
  v9 = v20;
  if (!a2)
    goto LABEL_36;
LABEL_3:
  if (!a3)
  {
    v11 = 0;
    goto LABEL_45;
  }
  if (a3 < 0)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v23 = v9;
  v11 = 0;
  v12 = 0;
  v24 = (unint64_t)(v9 + 64) >> 6;
  while ((v4 & 0x8000000000000000) != 0)
  {
    if (!sub_22D8B71A0())
    {
      a3 = v12;
LABEL_44:
      v9 = v23;
      goto LABEL_45;
    }
    sub_22D8B6C9C();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v15 = v25;
    result = swift_unknownObjectRelease();
    if (!v25)
      goto LABEL_43;
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
      goto LABEL_44;
  }
  if (v10)
  {
    v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    v14 = v13 | (v11 << 6);
    goto LABEL_7;
  }
  v16 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_47;
  }
  if (v16 >= v24)
    goto LABEL_39;
  v17 = *(_QWORD *)(v8 + 8 * v16);
  if (v17)
    goto LABEL_23;
  v11 += 2;
  if (v16 + 1 >= v24)
  {
    v10 = 0;
    v11 = v16;
    goto LABEL_43;
  }
  v17 = *(_QWORD *)(v8 + 8 * v11);
  if (v17)
  {
LABEL_16:
    v16 = v11;
LABEL_23:
    v10 = (v17 - 1) & v17;
    v14 = __clz(__rbit64(v17)) + (v16 << 6);
    v11 = v16;
LABEL_7:
    result = (uint64_t)*(id *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    v15 = result;
    if (!result)
      goto LABEL_43;
    goto LABEL_8;
  }
  v18 = v16 + 2;
  if (v16 + 2 >= v24)
    goto LABEL_39;
  v17 = *(_QWORD *)(v8 + 8 * v18);
  if (v17)
  {
LABEL_22:
    v16 = v18;
    goto LABEL_23;
  }
  v11 = v16 + 3;
  if (v16 + 3 >= v24)
  {
    v10 = 0;
    v11 = v16 + 2;
    goto LABEL_43;
  }
  v17 = *(_QWORD *)(v8 + 8 * v11);
  if (v17)
    goto LABEL_16;
  v18 = v16 + 4;
  if (v16 + 4 >= v24)
  {
LABEL_39:
    v10 = 0;
LABEL_43:
    a3 = v12;
    goto LABEL_44;
  }
  v17 = *(_QWORD *)(v8 + 8 * v18);
  if (v17)
    goto LABEL_22;
  while (1)
  {
    v16 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v16 >= v24)
    {
      v10 = 0;
      v11 = v24 - 1;
      goto LABEL_43;
    }
    v17 = *(_QWORD *)(v8 + 8 * v16);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_48:
  __break(1u);
  return result;
}

void sub_22D87CA44(void **a1@<X0>, NSObject *a2@<X1>, unint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  id v20;
  void *v21;
  void (*v22)(char *, char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint8_t *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  id v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  char *v55;
  unint64_t v56;
  char v57;
  id v58;
  id v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  NSObject *v66;
  uint64_t v67;
  os_log_type_t v68;
  uint64_t v69;
  uint64_t v70;
  uint8_t *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  void (*v75)(char *, uint64_t);
  void (*v76)(_QWORD *, uint64_t);
  _OWORD *v77;
  id v78;
  id v79;
  NSObject *v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  uint64_t v84;
  _QWORD *v85;
  NSObject *v86;
  NSObject *v87;
  id v88;
  NSObject *v89;
  os_log_type_t v90;
  uint8_t *v91;
  id v92;
  char *v93;
  _QWORD *v94;
  uint64_t v95;
  id v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _OWORD *v107;
  NSObject *v108;
  NSObject *v109;
  os_log_type_t v110;
  uint8_t *v111;
  _QWORD *v112;
  NSObject *v113;
  uint64_t v114;
  uint8_t *v115;
  uint8_t *v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  NSObject *v122;
  char *v123;
  _OWORD *v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  uint64_t v128;
  char *v129;

  v121 = a3;
  v122 = a2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A800);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v115 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22D8B5C40();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v123 = (char *)&v115 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v115 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v115 - v17;
  v19 = *a1;
  v20 = objc_msgSend(v19, sel_identifier);
  if (!v20)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
    goto LABEL_8;
  }
  v21 = v20;
  v129 = v18;
  sub_22D8B5C28();

  v22 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v22(v9, v16, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
LABEL_8:
    sub_22D8740E0((uint64_t)v9, &qword_255D9A800);
    if (qword_255D9A370 != -1)
      swift_once();
    v42 = sub_22D8B6D80();
    __swift_project_value_buffer(v42, (uint64_t)qword_255D9B078);
    v43 = v19;
    v44 = sub_22D8B6D68();
    v45 = sub_22D8B6FB4();
    if (os_log_type_enabled(v44, v45))
    {
      v124 = a4;
      v46 = (uint8_t *)swift_slowAlloc();
      v129 = (char *)swift_slowAlloc();
      *(_QWORD *)&v127 = v129;
      *(_DWORD *)v46 = 136315138;
      v123 = (char *)(v46 + 4);
      v47 = v43;
      v48 = objc_msgSend(v47, sel_description);
      v49 = sub_22D8B6E10();
      v51 = v50;

      *(_QWORD *)&v125 = sub_22D8755FC(v49, v51, (uint64_t *)&v127);
      sub_22D8B7044();

      a4 = v124;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D86F000, v44, v45, "Device had invalid UUID for fetched timers: %s", v46, 0xCu);
      v52 = (uint64_t)v129;
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v52, -1, -1);
      MEMORY[0x22E31A4BC](v46, -1, -1);

    }
    else
    {

    }
    *a4 = 0u;
    a4[1] = 0u;
    return;
  }
  v23 = v10;
  v24 = v11;
  v124 = a4;
  v22(v129, v9, v10);
  v25 = v4;
  if (qword_255D9A370 != -1)
    swift_once();
  v26 = sub_22D8B6D80();
  v27 = __swift_project_value_buffer(v26, (uint64_t)qword_255D9B078);
  v28 = v19;
  v29 = sub_22D8B6D68();
  v30 = sub_22D8B6FC0();
  v31 = os_log_type_enabled(v29, v30);
  v118 = v28;
  if (v31)
  {
    v32 = (uint8_t *)swift_slowAlloc();
    v117 = swift_slowAlloc();
    *(_QWORD *)&v127 = v117;
    v119 = v24;
    *(_DWORD *)v32 = 136315138;
    v115 = v32 + 4;
    v116 = v32;
    v33 = v28;
    v34 = objc_msgSend(v33, sel_description);
    v35 = v27;
    v36 = sub_22D8B6E10();
    v120 = v23;
    v38 = v37;

    v25 = v4;
    v39 = v36;
    v27 = v35;
    *(_QWORD *)&v125 = sub_22D8755FC(v39, v38, (uint64_t *)&v127);
    v24 = v119;
    sub_22D8B7044();

    v23 = v120;
    swift_bridgeObjectRelease();
    v40 = v116;
    _os_log_impl(&dword_22D86F000, v29, v30, "Searching timer from device context %s", v116, 0xCu);
    v41 = v117;
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v41, -1, -1);
    MEMORY[0x22E31A4BC](v40, -1, -1);

  }
  else
  {

  }
  v53 = (uint64_t)v129;
  v54 = v122;
  v55 = v123;
  if (v122[2].isa && (v56 = sub_22D8AF2A4((uint64_t)v129), (v57 & 1) != 0))
  {
    v58 = *((id *)v54[7].isa + v56);
    v59 = objc_msgSend(v118, sel_serializedContextByKey);
    if (v59)
    {
      v60 = v59;
      v61 = sub_22D8B6DD4();

      v62 = sub_22D8B6E10();
      if (*(_QWORD *)(v61 + 16) && (v64 = sub_22D8AF240(v62, v63), (v65 & 1) != 0))
      {
        sub_22D875884(*(_QWORD *)(v61 + 56) + 32 * v64, (uint64_t)&v125);
      }
      else
      {
        v125 = 0u;
        v126 = 0u;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v119 = v24;
      v120 = v23;
      if (*((_QWORD *)&v126 + 1))
      {
        v123 = (char *)v25;
        sub_22D87D920(&v125, &v127);
        v78 = objc_allocWithZone(MEMORY[0x24BE09160]);
        __swift_project_boxed_opaque_existential_1(&v127, v128);
        v79 = objc_msgSend(v78, sel_initWithSerializedBackingStore_, sub_22D8B73EC());
        swift_unknownObjectRelease();
        v80 = v79;
        v81 = sub_22D8B6D68();
        v82 = sub_22D8B6FC0();
        if (os_log_type_enabled(v81, v82))
        {
          v83 = (uint8_t *)swift_slowAlloc();
          v84 = swift_slowAlloc();
          v122 = v27;
          v85 = (_QWORD *)v84;
          *(_DWORD *)v83 = 138412290;
          *(_QWORD *)&v125 = v80;
          v86 = v80;
          v118 = v58;
          v87 = v86;
          sub_22D8B7044();
          *v85 = v80;

          v58 = v118;
          _os_log_impl(&dword_22D86F000, v81, v82, "fetchTimerContexts() timerSnapshot = %@", v83, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE78);
          swift_arrayDestroy();
          MEMORY[0x22E31A4BC](v85, -1, -1);
          MEMORY[0x22E31A4BC](v83, -1, -1);
        }
        else
        {

          v81 = v80;
        }
        v94 = v124;
        v95 = v120;

        v96 = -[NSObject timersByID](v80, sel_timersByID);
        if (v96)
        {
          v97 = v96;
          sub_22D89DBD8(0, (unint64_t *)&qword_255D9ACE0);
          sub_22D89DB30(&qword_255D9B0F8, MEMORY[0x24BDCEA88]);
          v98 = sub_22D8B6DD4();

          if (*(_QWORD *)(v98 + 16))
          {
            v99 = swift_bridgeObjectRetain();
            sub_22D89B69C(v99, (unint64_t *)&qword_255D9ACE0, 0x24BE09158, &qword_255D9B100, &qword_255D9ACE8);
            v101 = v100;
            v102 = v58;
            v103 = v121;
            swift_bridgeObjectRetain();
            v104 = sub_22D899A34(v102, v103);
            v106 = v105;

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();

            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v127);
            (*(void (**)(char *, uint64_t))(v119 + 8))(v129, v95);
            *v94 = v102;
            v94[1] = v101;
            v94[2] = v104;
            v94[3] = v106;
            return;
          }
          swift_bridgeObjectRelease();
        }
        v108 = v58;
        v109 = sub_22D8B6D68();
        v110 = sub_22D8B6FC0();
        if (os_log_type_enabled(v109, v110))
        {
          v111 = (uint8_t *)swift_slowAlloc();
          v112 = (_QWORD *)swift_slowAlloc();
          v122 = v109;
          *(_DWORD *)v111 = 138412290;
          *(_QWORD *)&v125 = v108;
          v113 = v108;
          v94 = v124;
          v109 = v122;
          sub_22D8B7044();
          *v112 = v108;

          _os_log_impl(&dword_22D86F000, v109, v110, "Didn't find any timers on device: %@", v111, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE78);
          swift_arrayDestroy();
          MEMORY[0x22E31A4BC](v112, -1, -1);
          MEMORY[0x22E31A4BC](v111, -1, -1);
        }
        else
        {

          v80 = v108;
        }
        v114 = (uint64_t)v129;

        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v127);
        (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v114, v120);
        *(_OWORD *)v94 = 0u;
        *((_OWORD *)v94 + 1) = 0u;
      }
      else
      {
        sub_22D8740E0((uint64_t)&v125, &qword_255D9B0E8);
        v88 = v58;
        v89 = sub_22D8B6D68();
        v90 = sub_22D8B6FB4();
        if (os_log_type_enabled(v89, v90))
        {
          v91 = (uint8_t *)swift_slowAlloc();
          v123 = (char *)swift_slowAlloc();
          *(_DWORD *)v91 = 138412290;
          *(_QWORD *)&v127 = v88;
          v92 = v88;
          v53 = (uint64_t)v129;
          sub_22D8B7044();
          v93 = v123;
          *(_QWORD *)v123 = v88;

          _os_log_impl(&dword_22D86F000, v89, v90, "Failed to get timer snapshot data from %@", v91, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE78);
          swift_arrayDestroy();
          MEMORY[0x22E31A4BC]((char *)v93, -1, -1);
          MEMORY[0x22E31A4BC](v91, -1, -1);
        }
        else
        {

        }
        v107 = v124;

        (*(void (**)(uint64_t, uint64_t))(v119 + 8))(v53, v120);
        *v107 = 0u;
        v107[1] = 0u;
      }
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v55, v53, v23);
    v66 = sub_22D8B6D68();
    v67 = v24;
    v68 = sub_22D8B6FB4();
    if (os_log_type_enabled(v66, v68))
    {
      v69 = swift_slowAlloc();
      v123 = (char *)v25;
      v70 = v23;
      v71 = (uint8_t *)v69;
      v72 = swift_slowAlloc();
      *(_QWORD *)&v127 = v72;
      *(_DWORD *)v71 = 136315138;
      v122 = (v71 + 4);
      sub_22D89DB30(&qword_255D9B0F0, MEMORY[0x24BDCEAB8]);
      v73 = sub_22D8B7314();
      *(_QWORD *)&v125 = sub_22D8755FC(v73, v74, (uint64_t *)&v127);
      sub_22D8B7044();
      swift_bridgeObjectRelease();
      v75 = *(void (**)(char *, uint64_t))(v67 + 8);
      v75(v55, v70);
      _os_log_impl(&dword_22D86F000, v66, v68, "Unable to find device for fetched timers: %s", v71, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v72, -1, -1);
      MEMORY[0x22E31A4BC](v71, -1, -1);

      v75(v129, v70);
    }
    else
    {

      v76 = *(void (**)(_QWORD *, uint64_t))(v67 + 8);
      v76(v55, v23);
      v76((_QWORD *)v53, v23);
    }
    v77 = v124;
    *v124 = 0u;
    v77[1] = 0u;
  }
}

unint64_t sub_22D87D710(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, unint64_t, uint64_t);
  char v17;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  unint64_t *v21;
  uint64_t v22;

  v21 = a4;
  v22 = a5;
  v6 = v5;
  v19 = a1;
  v20 = a3;
  v8 = a3(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - v10;
  v12 = -1 << *(_BYTE *)(v6 + 32);
  v13 = a2 & ~v12;
  if (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v14 = ~v12;
    v15 = *(_QWORD *)(v9 + 72);
    v16 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    do
    {
      v16(v11, *(_QWORD *)(v6 + 48) + v15 * v13, v8);
      sub_22D879430(v21, v20, v22);
      v17 = sub_22D8B6DF8();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      if ((v17 & 1) != 0)
        break;
      v13 = (v13 + 1) & v14;
    }
    while (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

unint64_t sub_22D87D840(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_22D8B73F8() & 1) == 0)
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
      while (!v14 && (sub_22D8B73F8() & 1) == 0);
    }
  }
  return v6;
}

_OWORD *sub_22D87D920(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_22D87D930(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_22D89DBD8(255, a2);
    result = MEMORY[0x22E31A408](MEMORY[0x24BEE5BD8], v4);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *initializeWithCopy for HALAlarmDeviceContext(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  v6 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
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

uint64_t initializeBufferWithCopyOfBuffer for HALAlarmDeviceContext(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for HALAlarmDeviceContext(id *a1)
{

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t destroy for SiriTimeDeviceContextProvider(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1Tm(a1);
}

uint64_t sub_22D87DA3C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v1 = MEMORY[0x24BEE4B08];
    v16 = MEMORY[0x24BEE4B08];
    swift_bridgeObjectRetain();
    sub_22D8B70B0();
    if (sub_22D8B70D4())
    {
      sub_22D88FFD0();
      do
      {
        swift_dynamicCast();
        if ((objc_msgSend(v15, sel_isFiring) & 1) != 0)
        {
          v2 = v16;
          v3 = *(_QWORD *)(v16 + 16);
          if (*(_QWORD *)(v16 + 24) <= v3)
          {
            sub_22D89C354(v3 + 1);
            v2 = v16;
          }
          result = sub_22D8B6FE4();
          v5 = v2 + 56;
          v6 = -1 << *(_BYTE *)(v2 + 32);
          v7 = result & ~v6;
          v8 = v7 >> 6;
          if (((-1 << v7) & ~*(_QWORD *)(v2 + 56 + 8 * (v7 >> 6))) != 0)
          {
            v9 = __clz(__rbit64((-1 << v7) & ~*(_QWORD *)(v2 + 56 + 8 * (v7 >> 6)))) | v7 & 0x7FFFFFFFFFFFFFC0;
          }
          else
          {
            v10 = 0;
            v11 = (unint64_t)(63 - v6) >> 6;
            do
            {
              if (++v8 == v11 && (v10 & 1) != 0)
              {
                __break(1u);
                return result;
              }
              v12 = v8 == v11;
              if (v8 == v11)
                v8 = 0;
              v10 |= v12;
              v13 = *(_QWORD *)(v5 + 8 * v8);
            }
            while (v13 == -1);
            v9 = __clz(__rbit64(~v13)) + (v8 << 6);
          }
          *(_QWORD *)(v5 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
          *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v9) = v15;
          ++*(_QWORD *)(v2 + 16);
        }
        else
        {

        }
      }
      while (sub_22D8B70D4());
      v1 = v16;
    }
    swift_release();
  }
  else
  {
    v14 = swift_bridgeObjectRetain();
    return (uint64_t)sub_22D88FA60(v14);
  }
  return v1;
}

uint64_t static DirectInvocationUtils.isQuickStopDirectInvocation(_:)()
{
  uint64_t v0;
  char v2;

  if (sub_22D8B6180() == 0xD00000000000003ALL && v0 == 0x800000022D8BE4C0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v2 = sub_22D8B73F8();
    swift_bridgeObjectRelease();
    return v2 & 1;
  }
}

uint64_t sub_22D87DF74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9A2C8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9A2C8);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t DialogExecutionResult.generateOutput(dialogPhase:context:measure:sessionID:responseViewId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v9[11] = a8;
  v9[12] = v8;
  v9[9] = a6;
  v9[10] = a7;
  v9[7] = a4;
  v9[8] = a5;
  v9[5] = a2;
  v9[6] = a3;
  v9[4] = a1;
  v10 = sub_22D8B6114();
  v9[13] = v10;
  v9[14] = *(_QWORD *)(v10 - 8);
  v9[15] = swift_task_alloc();
  v11 = sub_22D8B5F34();
  v9[16] = v11;
  v9[17] = *(_QWORD *)(v11 - 8);
  v9[18] = swift_task_alloc();
  v9[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22D87E0AC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  _QWORD *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t (*v41)(_QWORD, uint64_t, _QWORD);
  uint64_t v42;

  if (qword_255D9A2C0 != -1)
    swift_once();
  v1 = v0[19];
  v2 = v0[16];
  v3 = v0[17];
  v4 = (void *)v0[12];
  v5 = v0[5];
  v6 = sub_22D8B6D80();
  __swift_project_value_buffer(v6, (uint64_t)qword_255D9A2C8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v7(v1, v5, v2);
  v8 = v4;
  v9 = sub_22D8B6D68();
  v10 = sub_22D8B6FC0();
  v11 = os_log_type_enabled(v9, v10);
  v12 = v0[19];
  if (v11)
  {
    v38 = v0[17];
    v36 = v0[18];
    v37 = v0[16];
    v13 = (void *)v0[12];
    v14 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    v42 = v39;
    *(_DWORD *)v14 = 136315394;
    v15 = objc_msgSend(v13, sel_catId);
    v16 = sub_22D8B6E10();
    v18 = v17;

    v0[2] = sub_22D8755FC(v16, v18, &v42);
    sub_22D8B7044();
    swift_bridgeObjectRelease();

    *(_WORD *)(v14 + 12) = 2080;
    v7(v36, v12, v37);
    v19 = sub_22D8B6E28();
    v0[3] = sub_22D8755FC(v19, v20, &v42);
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v12, v37);
    _os_log_impl(&dword_22D86F000, v9, v10, "#Response 2.0 dialog-only generation for catId=%s, dialogPhase=%s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v39, -1, -1);
    MEMORY[0x22E31A4BC](v14, -1, -1);
  }
  else
  {
    v21 = v0[16];
    v22 = v0[17];
    v23 = (void *)v0[12];

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v12, v21);
  }

  v24 = v0[15];
  v25 = (void *)v0[12];
  v40 = v0[11];
  v27 = v0[9];
  v26 = v0[10];
  v28 = v0[8];
  v30 = v0[5];
  v29 = v0[6];
  sub_22D8B5FF4();
  swift_allocObject();
  v0[20] = sub_22D8B5FE8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B350);
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_22D8B7AC0;
  *(_QWORD *)(v31 + 32) = v25;
  v42 = v31;
  sub_22D8B6ED0();
  v32 = v42;
  v0[21] = v42;
  v33 = v25;
  static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(v30, v29, v28, v27, v26, v40, 0, v24);
  v41 = (uint64_t (*)(_QWORD, uint64_t, _QWORD))((int)*MEMORY[0x24BE97F08] + MEMORY[0x24BE97F08]);
  v34 = (_QWORD *)swift_task_alloc();
  v0[22] = v34;
  *v34 = v0;
  v34[1] = sub_22D87E41C;
  return v41(v0[4], v32, v0[15]);
}

uint64_t sub_22D87E41C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 112);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 120);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 104);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_22D87E4AC()
{
  uint64_t v0;

  SiriTimeMeasurement.logDelta()();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t DialogExecutionResult.generateOutput(dialogPhase:context:resultModel:measure:sessionID:responseViewId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v9[22] = v13;
  v9[23] = v8;
  v9[20] = a7;
  v9[21] = a8;
  v9[18] = a5;
  v9[19] = a6;
  v9[16] = a3;
  v9[17] = a4;
  v9[14] = a1;
  v9[15] = a2;
  v10 = sub_22D8B6114();
  v9[24] = v10;
  v9[25] = *(_QWORD *)(v10 - 8);
  v9[26] = swift_task_alloc();
  v11 = sub_22D8B5F34();
  v9[27] = v11;
  v9[28] = *(_QWORD *)(v11 - 8);
  v9[29] = swift_task_alloc();
  v9[30] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22D87E5B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  os_log_type_t type;
  unint64_t typea;
  uint64_t (*typeb)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v44;

  sub_22D87F4A4(*(_QWORD *)(v0 + 136), v0 + 56);
  if (*(_QWORD *)(v0 + 80))
  {
    sub_22D874D04((__int128 *)(v0 + 56), v0 + 16);
    if (qword_255D9A2C0 != -1)
      swift_once();
    v1 = *(_QWORD *)(v0 + 240);
    v2 = *(_QWORD *)(v0 + 216);
    v3 = *(_QWORD *)(v0 + 224);
    v4 = *(void **)(v0 + 184);
    v5 = *(_QWORD *)(v0 + 120);
    v6 = sub_22D8B6D80();
    __swift_project_value_buffer(v6, (uint64_t)qword_255D9A2C8);
    v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
    v7(v1, v5, v2);
    v8 = v4;
    v9 = sub_22D8B6D68();
    v10 = sub_22D8B6FC0();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *(_QWORD *)(v0 + 240);
    if (v11)
    {
      v39 = *(_QWORD *)(v0 + 224);
      v37 = *(_QWORD *)(v0 + 232);
      v38 = *(_QWORD *)(v0 + 216);
      type = v10;
      v13 = *(void **)(v0 + 184);
      v14 = swift_slowAlloc();
      v40 = swift_slowAlloc();
      v44 = v40;
      *(_DWORD *)v14 = 136315394;
      v15 = objc_msgSend(v13, sel_catId);
      v16 = sub_22D8B6E10();
      v18 = v17;

      *(_QWORD *)(v0 + 96) = sub_22D8755FC(v16, v18, &v44);
      sub_22D8B7044();
      swift_bridgeObjectRelease();

      *(_WORD *)(v14 + 12) = 2080;
      v7(v37, v12, v38);
      v19 = sub_22D8B6E28();
      *(_QWORD *)(v0 + 104) = sub_22D8755FC(v19, v20, &v44);
      sub_22D8B7044();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v12, v38);
      _os_log_impl(&dword_22D86F000, v9, type, "#Response 2.0 dialog/snippet generation for catId=%s, dialogPhase=%s", (uint8_t *)v14, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v40, -1, -1);
      MEMORY[0x22E31A4BC](v14, -1, -1);
    }
    else
    {
      v23 = *(_QWORD *)(v0 + 216);
      v24 = *(_QWORD *)(v0 + 224);
      v25 = *(void **)(v0 + 184);

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v12, v23);
    }

    v26 = *(_QWORD *)(v0 + 208);
    v27 = *(void **)(v0 + 184);
    typea = *(_QWORD *)(v0 + 176);
    v29 = *(_QWORD *)(v0 + 160);
    v28 = *(_QWORD *)(v0 + 168);
    v30 = *(_QWORD *)(v0 + 152);
    v32 = *(_QWORD *)(v0 + 120);
    v31 = *(_QWORD *)(v0 + 128);
    sub_22D8B5FF4();
    swift_allocObject();
    *(_QWORD *)(v0 + 248) = sub_22D8B5FE8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B350);
    v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_22D8B7AC0;
    *(_QWORD *)(v33 + 32) = v27;
    v44 = v33;
    sub_22D8B6ED0();
    v34 = v44;
    *(_QWORD *)(v0 + 256) = v44;
    v35 = v27;
    static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(v32, v31, v30, v29, v28, typea, 0, v26);
    typeb = (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))((int)*MEMORY[0x24BE97EE0] + MEMORY[0x24BE97EE0]);
    v36 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 264) = v36;
    *v36 = v0;
    v36[1] = sub_22D87E9AC;
    return typeb(*(_QWORD *)(v0 + 112), v0 + 16, v34, *(_QWORD *)(v0 + 208));
  }
  else
  {
    sub_22D87F4EC(v0 + 56);
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 272) = v21;
    *v21 = v0;
    v21[1] = sub_22D87EA94;
    return DialogExecutionResult.generateOutput(dialogPhase:context:measure:sessionID:responseViewId:)(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 176));
  }
}

uint64_t sub_22D87E9AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 200);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 208);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 192);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_22D87EA3C()
{
  uint64_t v0;

  SiriTimeMeasurement.logDelta()();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D87EA94()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t DialogExecutionResult.generateConversationOutput(dialogPhase:context:conversationModel:measure:sessionID:responseViewId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v9[12] = v13;
  v9[13] = v8;
  v9[10] = a7;
  v9[11] = a8;
  v9[8] = a5;
  v9[9] = a6;
  v9[6] = a3;
  v9[7] = a4;
  v9[4] = a1;
  v9[5] = a2;
  v10 = sub_22D8B6114();
  v9[14] = v10;
  v9[15] = *(_QWORD *)(v10 - 8);
  v9[16] = swift_task_alloc();
  v11 = sub_22D8B5F34();
  v9[17] = v11;
  v9[18] = *(_QWORD *)(v11 - 8);
  v9[19] = swift_task_alloc();
  v9[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22D87EBA0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  _QWORD *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t (*v41)(_QWORD, _QWORD, uint64_t, _QWORD);
  uint64_t v42;

  if (qword_255D9A2C0 != -1)
    swift_once();
  v1 = v0[20];
  v2 = v0[17];
  v3 = v0[18];
  v4 = (void *)v0[13];
  v5 = v0[5];
  v6 = sub_22D8B6D80();
  __swift_project_value_buffer(v6, (uint64_t)qword_255D9A2C8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v7(v1, v5, v2);
  v8 = v4;
  v9 = sub_22D8B6D68();
  v10 = sub_22D8B6FC0();
  v11 = os_log_type_enabled(v9, v10);
  v12 = v0[20];
  if (v11)
  {
    v38 = v0[18];
    v36 = v0[19];
    v37 = v0[17];
    v13 = (void *)v0[13];
    v14 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    v42 = v39;
    *(_DWORD *)v14 = 136315394;
    v15 = objc_msgSend(v13, sel_catId);
    v16 = sub_22D8B6E10();
    v18 = v17;

    v0[2] = sub_22D8755FC(v16, v18, &v42);
    sub_22D8B7044();
    swift_bridgeObjectRelease();

    *(_WORD *)(v14 + 12) = 2080;
    v7(v36, v12, v37);
    v19 = sub_22D8B6E28();
    v0[3] = sub_22D8755FC(v19, v20, &v42);
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v12, v37);
    _os_log_impl(&dword_22D86F000, v9, v10, "#Response 2.0 dialog/snippet conversation space generation for catId=%s, dialogPhase=%s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v39, -1, -1);
    MEMORY[0x22E31A4BC](v14, -1, -1);
  }
  else
  {
    v21 = v0[17];
    v22 = v0[18];
    v23 = (void *)v0[13];

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v12, v21);
  }

  v24 = v0[16];
  v25 = (void *)v0[13];
  v40 = v0[12];
  v27 = v0[10];
  v26 = v0[11];
  v28 = v0[9];
  v30 = v0[5];
  v29 = v0[6];
  sub_22D8B5FF4();
  swift_allocObject();
  v0[21] = sub_22D8B5FE8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B350);
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_22D8B7AC0;
  *(_QWORD *)(v31 + 32) = v25;
  v42 = v31;
  sub_22D8B6ED0();
  v32 = v42;
  v0[22] = v42;
  v33 = v25;
  static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(v30, v29, v28, v27, v26, v40, 0, v24);
  v41 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, _QWORD))((int)*MEMORY[0x24BE97EF0] + MEMORY[0x24BE97EF0]);
  v34 = (_QWORD *)swift_task_alloc();
  v0[23] = v34;
  *v34 = v0;
  v34[1] = sub_22D87EF14;
  return v41(v0[4], v0[7], v32, v0[16]);
}

uint64_t sub_22D87EF14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 120);
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 128);
  v3 = *(_QWORD *)(*(_QWORD *)v0 + 112);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return swift_task_switch();
}

uint64_t sub_22D87EFA4()
{
  uint64_t v0;

  SiriTimeMeasurement.logDelta()();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t Output.generateFlow()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];

  v5 = *(_QWORD *)(a1 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
  v7 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v8 + v7, (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  sub_22D8B60A8();
  sub_22D8B5DB4();
  swift_allocObject();
  v11[1] = sub_22D8B5DA8();
  v9 = sub_22D8B5DF0();
  swift_release();
  return v9;
}

uint64_t sub_22D87F120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_22D87F13C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *boxed_opaque_existential_1;
  __int128 v5;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v5 = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v1 + 24) = v5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)v1);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(boxed_opaque_existential_1, v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t variable initialization expression of HALAlarmDeviceContext.remoteExecutionId()
{
  return 0;
}

uint64_t variable initialization expression of SiriTimeMeasurement.timingErrorLoggingSubtype()
{
  return 0;
}

double variable initialization expression of SiriTimeMeasurement.timingBreachThresholdInMilliseconds()
{
  return 1.79769313e308;
}

id variable initialization expression of SiriTimeMeasurement.currentPerfContextId()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v8;

  v0 = sub_22D8B5C40();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D8B5C34();
  v4 = objc_allocWithZone(MEMORY[0x24BE95C78]);
  v5 = (void *)sub_22D8B5C1C();
  v6 = objc_msgSend(v4, sel_initWithNSUUID_, v5);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v6;
}

uint64_t variable initialization expression of SiriTimerSnippetModel.directInvocationUri()
{
  return 0;
}

uint64_t variable initialization expression of SiriTimerSnippetModel.directInvocationPayload()
{
  return 0;
}

uint64_t _s16SiriTimeInternal05ClockB12SnippetModelV11punchoutURL10Foundation0H0VSgvpfi_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = sub_22D8B5BA4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

uint64_t variable initialization expression of SiriTimerSnippetModel.label()
{
  return 0;
}

uint64_t variable initialization expression of SiriTimerSnippetModel.duration()
{
  return 0;
}

uint64_t variable initialization expression of SiriTimerSnippetModel.remainingTime()
{
  return 0;
}

uint64_t variable initialization expression of SiriTimerSnippetModel.state()
{
  return 0;
}

_QWORD *sub_22D87F2F4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A458);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22D87F358(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A458);
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
  result = sub_22D8B71F4();
  __break(1u);
  return result;
}

uint64_t sub_22D87F4A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A438);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D87F4EC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A438);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D87F52C()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_22D87F584(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v1 + 16) - 8) + 80);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_22D87F604;
  *(_OWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = v1 + ((v6 + 32) & ~v6);
  return swift_task_switch();
}

uint64_t sub_22D87F604()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
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

uint64_t sub_22D87F6C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9A7C0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9A7C0);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_22D87F758(unsigned __int8 a1)
{
  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_22D87F784 + 4 * byte_22D8B7AD0[a1]))("timer_RF", 8);
}

const char *sub_22D87F784()
{
  return "confirmations_RF";
}

const char *sub_22D87F7EC()
{
  return "sleep_timers_tvOS";
}

const char *sub_22D87F814()
{
  return "clock_smart";
}

BOOL sub_22D87F834(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22D87F848()
{
  sub_22D8B7434();
  sub_22D8B7440();
  return sub_22D8B744C();
}

uint64_t sub_22D87F88C()
{
  return sub_22D8B7440();
}

uint64_t sub_22D87F8B4()
{
  sub_22D8B7434();
  sub_22D8B7440();
  return sub_22D8B744C();
}

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isTimerResponseFrameworkEnabled()()
{
  return sub_22D87F950(0, "TimerResponseFramework FeatureFlag enabled: %{BOOL}d");
}

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isCrossDeviceEnabled()()
{
  return 0;
}

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isSuggestionHintsEnabled()()
{
  return sub_22D872DC0(6, "SuggestionHints FeatureFlag is enabled!");
}

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isAlarmSmartEnabled()()
{
  return sub_22D87FA9C(8, "alarm_smart FeatureFlag enabled: %{BOOL}d");
}

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isSleepTimersEnabled()()
{
  return 0;
}

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isWeekOfYearEnabled()()
{
  return sub_22D87F950(9, "WeekOfYear FeatureFlag enabled: %{BOOL}d");
}

uint64_t sub_22D87F950(char a1, const char *a2)
{
  char v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  int v10[6];
  ValueMetadata *v11;
  unint64_t v12;

  v11 = &type metadata for Features;
  v12 = sub_22D872ED4();
  LOBYTE(v10[0]) = a1;
  v4 = sub_22D8B61D4();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  if (qword_255D9A2E0 != -1)
    swift_once();
  v5 = sub_22D8B6D80();
  __swift_project_value_buffer(v5, (uint64_t)qword_255D9A7C0);
  v6 = sub_22D8B6D68();
  v7 = sub_22D8B6FC0();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v8 = 67109120;
    v10[0] = v4 & 1;
    sub_22D8B7044();
    _os_log_impl(&dword_22D86F000, v6, v7, a2, v8, 8u);
    MEMORY[0x22E31A4BC](v8, -1, -1);
  }

  return v4 & 1;
}

Swift::Bool __swiftcall SiriTimeFeatureFlagsImpl.isClockSmartEnabled()()
{
  return sub_22D87FA9C(10, "clock_smart FeatureFlag enabled: %{BOOL}d");
}

uint64_t sub_22D87FA9C(char a1, const char *a2)
{
  char v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  int v11[6];
  ValueMetadata *v12;
  unint64_t v13;

  v12 = &type metadata for Features;
  v13 = sub_22D872ED4();
  LOBYTE(v11[0]) = a1;
  v4 = sub_22D8B61D4();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
  if ((v4 & 1) != 0)
    v5 = _s16SiriTimeInternal0aB16FeatureFlagsImplV19isTimerSmartEnabledSbyF_0();
  else
    v5 = 0;
  if (qword_255D9A2E0 != -1)
    swift_once();
  v6 = sub_22D8B6D80();
  __swift_project_value_buffer(v6, (uint64_t)qword_255D9A7C0);
  v7 = sub_22D8B6D68();
  v8 = sub_22D8B6FC0();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v9 = 67109120;
    v11[0] = v5 & 1;
    sub_22D8B7044();
    _os_log_impl(&dword_22D86F000, v7, v8, a2, v9, 8u);
    MEMORY[0x22E31A4BC](v9, -1, -1);
  }

  return v5 & 1;
}

uint64_t _s16SiriTimeInternal0aB16FeatureFlagsImplV39isConfirmationsResponseFrameworkEnabledSbyF_0()
{
  char v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  int v6[6];
  ValueMetadata *v7;
  unint64_t v8;

  v7 = &type metadata for Features;
  v8 = sub_22D872ED4();
  LOBYTE(v6[0]) = 1;
  v0 = sub_22D8B61D4();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  if (qword_255D9A2E0 != -1)
    swift_once();
  v1 = sub_22D8B6D80();
  __swift_project_value_buffer(v1, (uint64_t)qword_255D9A7C0);
  v2 = sub_22D8B6D68();
  v3 = sub_22D8B6FC0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v4 = 67109120;
    v6[0] = v0 & 1;
    sub_22D8B7044();
    _os_log_impl(&dword_22D86F000, v2, v3, "ResponseFrameworkConfirmations FeatureFlag enabled: %{BOOL}d", v4, 8u);
    MEMORY[0x22E31A4BC](v4, -1, -1);
  }

  return v0 & 1;
}

ValueMetadata *type metadata accessor for SiriTimeFeatureFlagsImpl()
{
  return &type metadata for SiriTimeFeatureFlagsImpl;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Features(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Features(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D87FE24 + 4 * byte_22D8B7AE0[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_22D87FE58 + 4 * byte_22D8B7ADB[v4]))();
}

uint64_t sub_22D87FE58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D87FE60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D87FE68);
  return result;
}

uint64_t sub_22D87FE74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D87FE7CLL);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_22D87FE80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D87FE88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D87FE94(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22D87FEA0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Features()
{
  return &type metadata for Features;
}

uint64_t sub_22D87FEBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9A7E8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9A7E8);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t String.toDismissSnoozeId.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v4 = sub_22D8B5A48();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A800);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D8B5C04();
  v11 = sub_22D8B5C40();
  v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v10, 1, v11);
  sub_22D88031C((uint64_t)v10);
  if (v12 != 1)
  {
LABEL_5:
    if (qword_255D9A2E8 != -1)
      swift_once();
    v19 = sub_22D8B6D80();
    __swift_project_value_buffer(v19, (uint64_t)qword_255D9A7E8);
    v20 = sub_22D8B6D68();
    v21 = sub_22D8B6FC0();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_22D86F000, v20, v21, "[toDismissSnoozeId] Alarm/Timer ID is already a UUID - not modifying", v22, 2u);
      MEMORY[0x22E31A4BC](v22, -1, -1);
    }

    swift_bridgeObjectRetain();
    return a1;
  }
  *(_QWORD *)&v30 = a1;
  *((_QWORD *)&v30 + 1) = a2;
  v13 = sub_22D88035C();
  v14 = MEMORY[0x22E319C58](61, 0xE100000000000000, 0x7FFFFFFFFFFFFFFFLL, 1, MEMORY[0x24BEE0D00], v13);
  if (*(_QWORD *)(v14 + 16) == 2)
  {
    v29 = *(_OWORD *)(v14 + 64);
    v15 = *(_QWORD *)(v14 + 80);
    v16 = *(_QWORD *)(v14 + 88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v30 = v29;
    v31 = v15;
    v32 = v16;
    sub_22D8B5A30();
    sub_22D8803A0();
    a1 = sub_22D8B7068();
    v18 = v17;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    swift_bridgeObjectRelease();
    if (v18)
      return a1;
    __break(1u);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  if (qword_255D9A2E8 != -1)
    swift_once();
  v23 = sub_22D8B6D80();
  __swift_project_value_buffer(v23, (uint64_t)qword_255D9A7E8);
  swift_bridgeObjectRetain_n();
  v24 = sub_22D8B6D68();
  v25 = sub_22D8B6FB4();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    *(_QWORD *)&v30 = v27;
    *(_DWORD *)v26 = 136315138;
    swift_bridgeObjectRetain();
    v33 = sub_22D8755FC(a1, a2, (uint64_t *)&v30);
    sub_22D8B7044();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22D86F000, v24, v25, "Bad alarm/timer identifier: %s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v27, -1, -1);
    MEMORY[0x22E31A4BC](v26, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t sub_22D88031C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A800);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_22D88035C()
{
  unint64_t result;

  result = qword_255D9A808;
  if (!qword_255D9A808)
  {
    result = MEMORY[0x22E31A408](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255D9A808);
  }
  return result;
}

unint64_t sub_22D8803A0()
{
  unint64_t result;

  result = qword_255D9A810;
  if (!qword_255D9A810)
  {
    result = MEMORY[0x22E31A408](MEMORY[0x24BEE1E38], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_255D9A810);
  }
  return result;
}

uint64_t sub_22D8803E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9A818);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9A818);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t static DialogActBuilder.buildPromptValueDialogActFrom(_:forDomain:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v51 = a2;
  v52 = a3;
  v53 = a4;
  v50 = sub_22D8B62AC();
  v5 = *(_QWORD *)(v50 - 8);
  v6 = MEMORY[0x24BDAC7A8](v50);
  v8 = (char *)&v45 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v45 - v9;
  v11 = sub_22D8B61E0();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v45 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A830);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B350);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_22D8B7AC0;
  *(_QWORD *)(v21 + 32) = a1;
  v55 = v21;
  sub_22D8B6ED0();
  v22 = v55;
  v23 = sub_22D8B63F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v20, 1, 1, v23);
  swift_retain();
  v24 = MEMORY[0x22E318F98](v22, v20);
  swift_bridgeObjectRelease();
  sub_22D880B14((uint64_t)v20);
  sub_22D8B6378();
  v45 = v15;
  v46 = v11;
  v47 = v10;
  v48 = v8;
  v49 = v5;
  if (qword_255D9A2F0 != -1)
    swift_once();
  v25 = v17;
  v26 = sub_22D8B6D80();
  __swift_project_value_buffer(v26, (uint64_t)qword_255D9A818);
  v27 = v52;
  swift_bridgeObjectRetain_n();
  v28 = v24;
  swift_retain_n();
  v29 = sub_22D8B6D68();
  v30 = sub_22D8B6FC0();
  v31 = v12;
  if (os_log_type_enabled(v29, v30))
  {
    v32 = swift_slowAlloc();
    v33 = swift_slowAlloc();
    v55 = v33;
    *(_DWORD *)v32 = 136315394;
    swift_bridgeObjectRetain();
    v54 = sub_22D8755FC(v51, v27, &v55);
    sub_22D8B7044();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v32 + 12) = 2080;
    v54 = v28;
    sub_22D8B68D0();
    sub_22D88134C();
    v34 = sub_22D8B7314();
    v54 = sub_22D8755FC(v34, v35, &v55);
    sub_22D8B7044();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v29, v30, "#%sNLContextUpdateFactory sending SystemPrompted dialog act with graph: %s", (uint8_t *)v32, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v33, -1, -1);
    MEMORY[0x22E31A4BC](v32, -1, -1);

  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  v37 = v49;
  v36 = v50;
  v38 = v46;
  v39 = v47;
  v40 = v48;
  v41 = v45;
  sub_22D8B62A0();
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v41, v25, v38);
  sub_22D8B6294();
  v42 = v53;
  sub_22D8B630C();
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v40, v39, v36);
  sub_22D8B6300();
  swift_release();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v39, v36);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v25, v38);
  v43 = sub_22D8B6318();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v42, 0, 1, v43);
}

uint64_t sub_22D880B14(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A830);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static DialogActBuilder.buildPromptConfirmationDialogActFrom(_:forDomain:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v56;
  char *v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77[2];

  v73 = a3;
  v71 = a2;
  v75 = a4;
  v63 = sub_22D8B621C();
  v70 = *(_QWORD *)(v63 - 8);
  v5 = MEMORY[0x24BDAC7A8](v63);
  v69 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v64 = (char *)&v56 - v7;
  v62 = sub_22D8B6288();
  v68 = *(_QWORD *)(v62 - 8);
  v8 = MEMORY[0x24BDAC7A8](v62);
  v65 = (char *)&v56 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v67 = (char *)&v56 - v10;
  v72 = sub_22D8B6360();
  v66 = *(_QWORD *)(v72 - 8);
  v11 = MEMORY[0x24BDAC7A8](v72);
  v13 = (char *)&v56 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v56 - v14;
  v16 = sub_22D8B61E0();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v56 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v56 - v21;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A830);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v56 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B350);
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_22D8B7AC0;
  *(_QWORD *)(v26 + 32) = a1;
  v77[0] = v26;
  sub_22D8B6ED0();
  v27 = v77[0];
  v28 = sub_22D8B63F0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v25, 1, 1, v28);
  swift_retain();
  v29 = MEMORY[0x22E318F98](v27, v25);
  swift_bridgeObjectRelease();
  sub_22D880B14((uint64_t)v25);
  v74 = v29;
  sub_22D8B6378();
  v57 = v20;
  v58 = v13;
  v59 = v22;
  v60 = v17;
  v61 = v16;
  v30 = v15;
  v31 = v63;
  if (qword_255D9A2F0 != -1)
    swift_once();
  v32 = sub_22D8B6D80();
  __swift_project_value_buffer(v32, (uint64_t)qword_255D9A818);
  v33 = a1;
  swift_retain_n();
  v34 = v73;
  swift_bridgeObjectRetain_n();
  v35 = sub_22D8B6D68();
  v36 = sub_22D8B6FC0();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = swift_slowAlloc();
    v38 = swift_slowAlloc();
    v77[0] = v38;
    *(_DWORD *)v37 = 136315394;
    swift_bridgeObjectRetain();
    v76 = sub_22D8755FC(v71, v34, v77);
    sub_22D8B7044();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v37 + 12) = 2080;
    v76 = v33;
    sub_22D8B639C();
    swift_retain();
    v39 = sub_22D8B6E28();
    v76 = sub_22D8755FC(v39, v40, v77);
    sub_22D8B7044();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v35, v36, "#%sNLContextUpdateFactory sending SystemOffered dialog act with graph: %s", (uint8_t *)v37, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v38, -1, -1);
    MEMORY[0x22E31A4BC](v37, -1, -1);

  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
  }
  v41 = v31;
  v43 = v69;
  v42 = v70;
  v45 = v61;
  v44 = v62;
  v47 = v67;
  v46 = v68;
  v48 = v72;
  v49 = v57;
  sub_22D8B6354();
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v49, v59, v45);
  sub_22D8B6348();
  sub_22D8B627C();
  v50 = v30;
  v51 = v66;
  (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v58, v50, v48);
  sub_22D8B6270();
  v52 = v64;
  sub_22D8B6210();
  (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v65, v47, v44);
  sub_22D8B6204();
  v53 = v75;
  sub_22D8B630C();
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v43, v52, v41);
  sub_22D8B62F4();
  swift_release();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v52, v41);
  (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v44);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v72);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v59, v61);
  v54 = sub_22D8B6318();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v54 - 8) + 56))(v53, 0, 1, v54);
}

unint64_t sub_22D88134C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255D9A840;
  if (!qword_255D9A840)
  {
    v1 = sub_22D8B68D0();
    result = MEMORY[0x22E31A408](MEMORY[0x24BEA3548], v1);
    atomic_store(result, (unint64_t *)&qword_255D9A840);
  }
  return result;
}

ValueMetadata *type metadata accessor for DialogActBuilder()
{
  return &type metadata for DialogActBuilder;
}

uint64_t SiriTimeAppBundleId.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D8813E4
                                                                     + 4 * asc_22D8B7C00[a1]))(0xD000000000000015, 0x800000022D8BD2A0);
}

uint64_t sub_22D8813E4()
{
  uint64_t v0;

  return v0 - 29;
}

unint64_t sub_22D881460()
{
  return 0xD000000000000035;
}

void sub_22D881488(char *a1)
{
  sub_22D8A1CD8(*a1);
}

uint64_t sub_22D881494()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_22D8B7434();
  sub_22D8A26B0((uint64_t)v3, v1);
  return sub_22D8B744C();
}

void sub_22D8814D8(uint64_t a1)
{
  char *v1;

  sub_22D8A26B0(a1, *v1);
}

uint64_t sub_22D8814E0()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_22D8B7434();
  sub_22D8A26B0((uint64_t)v3, v1);
  return sub_22D8B744C();
}

uint64_t sub_22D881520@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s16SiriTimeInternal0aB11AppBundleIdO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_22D88154C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = SiriTimeAppBundleId.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s16SiriTimeInternal0aB11AppBundleIdO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_22D8B7200();
  swift_bridgeObjectRelease();
  if (v0 >= 9)
    return 9;
  else
    return v0;
}

unint64_t sub_22D8815C0()
{
  unint64_t result;

  result = qword_255D9A848;
  if (!qword_255D9A848)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for SiriTimeAppBundleId, &type metadata for SiriTimeAppBundleId);
    atomic_store(result, (unint64_t *)&qword_255D9A848);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SiriTimeAppBundleId(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SiriTimeAppBundleId(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D8816E0 + 4 * byte_22D8B7C0E[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_22D881714 + 4 * byte_22D8B7C09[v4]))();
}

uint64_t sub_22D881714(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D88171C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D881724);
  return result;
}

uint64_t sub_22D881730(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D881738);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_22D88173C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D881744(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeAppBundleId()
{
  return &type metadata for SiriTimeAppBundleId;
}

uint64_t sub_22D881760()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9A850);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9A850);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t static HALDeviceContext.remoteExecutionId(for:from:)(void *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v4 = sub_22D8B6C90();
  result = 0;
  if (v4 > 1999)
  {
    if (v4 != 2000 && v4 != 3000)
      return result;
  }
  else if (v4)
  {
    if (v4 != 1000)
      return result;
  }
  else
  {
    if (qword_255D9A3A8 != -1)
      swift_once();
    v6 = sub_22D8B6D80();
    __swift_project_value_buffer(v6, (uint64_t)qword_255D9B418);
    v7 = sub_22D8B6D68();
    v8 = sub_22D8B6FC0();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_22D86F000, v7, v8, "Device proximity is 'unknown'. Assuming device is remote for indeterminate proximity state. This needs to be fixed by an upstream component from Time Domains.", v9, 2u);
      MEMORY[0x22E31A4BC](v9, -1, -1);
    }

  }
  if ((sub_22D881AF0((uint64_t)a1, a2) & 1) != 0)
    return 0;
  if (qword_255D9A2F8 != -1)
    swift_once();
  v10 = sub_22D8B6D80();
  __swift_project_value_buffer(v10, (uint64_t)qword_255D9A850);
  v11 = a1;
  v12 = sub_22D8B6D68();
  v13 = sub_22D8B6FC0();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v20 = v15;
    *(_DWORD *)v14 = 136315394;
    v16 = sub_22D8B6C78();
    sub_22D8755FC(v16, v17, &v20);
    sub_22D8B7044();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    v18 = sub_22D8B6C84();
    sub_22D8755FC(v18, v19, &v20);
    sub_22D8B7044();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v12, v13, "Remote device %s doesn't support intent handling. Will send ace command to remote assistant %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v15, -1, -1);
    MEMORY[0x22E31A4BC](v14, -1, -1);

  }
  else
  {

  }
  return sub_22D8B6C84();
}

uint64_t sub_22D881AF0(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  id v13;
  char v14;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_22D8B71C4())
  {
    v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v5 = (id)MEMORY[0x22E319D0C](0, a2);
LABEL_5:
      v6 = v5;
      sub_22D8B6C9C();
      v7 = sub_22D8B6FF0();

      if ((v7 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1)
        goto LABEL_18;
      if (v4)
        break;
      v4 = 5;
      while (1)
      {
        v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
          break;
        v13 = *(id *)(a2 + 8 * v4);
        v14 = sub_22D8B6FF0();

        if ((v14 & 1) != 0)
          goto LABEL_6;
        ++v4;
        if (v12 == v3)
          goto LABEL_18;
      }
      __break(1u);
    }
    v9 = 1;
    while (1)
    {
      MEMORY[0x22E319D0C](v9, a2);
      v10 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v11 = sub_22D8B6FF0();
      swift_unknownObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_6;
      ++v9;
      if (v10 == v3)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t HALDeviceContext.shouldDismissSilently.getter(uint64_t a1, uint64_t a2)
{
  return sub_22D881C88(a1, a2, DeviceUnit.shouldDismissSilently.getter);
}

uint64_t HALDeviceContext.shouldPromptForConfirmation.getter(uint64_t a1, uint64_t a2)
{
  return sub_22D881C88(a1, a2, DeviceUnit.shouldPromptForConfirmation.getter);
}

uint64_t HALDeviceContext.isRemote.getter(uint64_t a1, uint64_t a2)
{
  return sub_22D881C88(a1, a2, DeviceUnit.isRemote.getter);
}

uint64_t sub_22D881C88(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  void *v4;

  v4 = (void *)(*(uint64_t (**)(void))(a2 + 8))();
  LOBYTE(a3) = a3();

  return a3 & 1;
}

BOOL HALDeviceContext.isLocal.getter(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = (void *)(*(uint64_t (**)(void))(a2 + 8))();
  sub_22D8B6C90();
  v3 = sub_22D8B6D5C();
  v4 = sub_22D8B6D5C();

  return v3 == v4;
}

uint64_t HALDeviceContext.isCommunal.getter(uint64_t a1, uint64_t a2)
{
  void *v2;
  char v3;

  v2 = (void *)(*(uint64_t (**)(void))(a2 + 8))();
  v3 = _s27SiriVirtualDeviceResolution0C4UnitC0A12TimeInternalE10isCommunalSbvg_0();

  return v3 & 1;
}

uint64_t HALDeviceContext.remoteDevice.getter(uint64_t a1, uint64_t a2)
{
  uint64_t (*v4)(void);
  void *v5;
  char v6;

  v4 = *(uint64_t (**)(void))(a2 + 8);
  v5 = (void *)v4();
  v6 = DeviceUnit.isRemote.getter();

  if ((v6 & 1) != 0)
    return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
  else
    return 0;
}

void *sub_22D881DAC()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  if ((sub_22D881DE4(*v0) & 1) == 0)
    return 0;
  v2 = v1;
  return v1;
}

uint64_t sub_22D881DE4(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v1 = a1;
  v2 = sub_22D8B6C90();
  v3 = 1;
  if (v2 <= 1999)
  {
    if (v2)
    {
      if (v2 != 1000)
LABEL_7:
        v3 = 0;
    }
    else
    {
      if (qword_255D9A3A8 != -1)
        swift_once();
      v4 = sub_22D8B6D80();
      __swift_project_value_buffer(v4, (uint64_t)qword_255D9B418);
      v5 = sub_22D8B6D68();
      v6 = sub_22D8B6FC0();
      if (os_log_type_enabled(v5, v6))
      {
        v7 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_22D86F000, v5, v6, "Device proximity is 'unknown'. Assuming device is remote for indeterminate proximity state. This needs to be fixed by an upstream component from Time Domains.", v7, 2u);
        MEMORY[0x22E31A4BC](v7, -1, -1);
      }

      v3 = 1;
      v1 = v5;
    }
  }
  else if (v2 != 2000 && v2 != 3000)
  {
    goto LABEL_7;
  }

  return v3;
}

uint64_t sub_22D881F0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9A868);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9A868);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

BOOL static TemporalEntityMatching.MatchResult.LabelMatchType.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t TemporalEntityMatching.MatchResult.LabelMatchType.hash(into:)()
{
  return sub_22D8B7440();
}

uint64_t TemporalEntityMatching.MatchResult.LabelMatchType.hashValue.getter()
{
  sub_22D8B7434();
  sub_22D8B7440();
  return sub_22D8B744C();
}

BOOL static TemporalEntityMatching.MatchResult.== infix(_:_:)(char a1, char a2)
{
  if (a1 == 5)
    return a2 == 5;
  if (a2 == 5)
    return 0;
  return a1 == a2;
}

BOOL sub_22D882058(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2;
  int v3;

  v2 = *a1;
  v3 = *a2;
  if (v2 == 5)
    return v3 == 5;
  if (v3 == 5)
    return 0;
  return v2 == v3;
}

uint64_t static TemporalEntityMatching.matchLabel(intentsSearchTitle:entityTitle:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t matched;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (a2)
  {
    if (a4)
    {
      swift_bridgeObjectRetain();
      matched = _s16SiriTimeInternal22TemporalEntityMatchingO10matchLabel18intentsSearchTitle06entityK0AC11MatchResultOSS_SStFZ_0(a1, a2, a3, a4);
      swift_bridgeObjectRelease();
      return matched;
    }
    else
    {
      v12 = HIBYTE(a2) & 0xF;
      if ((a2 & 0x2000000000000000) == 0)
        v12 = a1 & 0xFFFFFFFFFFFFLL;
      if (v12)
      {
        v13 = qword_255D9A300;
        swift_bridgeObjectRetain();
        if (v13 != -1)
          swift_once();
        v14 = sub_22D8B6D80();
        __swift_project_value_buffer(v14, (uint64_t)qword_255D9A868);
        swift_bridgeObjectRetain();
        v15 = sub_22D8B6D68();
        v16 = sub_22D8B6F9C();
        if (os_log_type_enabled(v15, v16))
        {
          v17 = (uint8_t *)swift_slowAlloc();
          v18 = swift_slowAlloc();
          v19 = v18;
          *(_DWORD *)v17 = 136315138;
          swift_bridgeObjectRetain();
          sub_22D8755FC(a1, a2, &v19);
          sub_22D8B7044();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_22D86F000, v15, v16, "Title doesn't match: MTTimer – nil, SiriTimer - %s", v17, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22E31A4BC](v18, -1, -1);
          MEMORY[0x22E31A4BC](v17, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        return 5;
      }
      else
      {
        return 0;
      }
    }
  }
  else
  {
    v10 = HIBYTE(a4) & 0xF;
    if ((a4 & 0x2000000000000000) == 0)
      v10 = a3 & 0xFFFFFFFFFFFFLL;
    v11 = v10 != 0;
    return a4 && v11;
  }
}

uint64_t _s16SiriTimeInternal22TemporalEntityMatchingO10matchLabel18intentsSearchTitle06entityK0AC11MatchResultOSS_SStFZ_0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _BOOL4 v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  _BOOL4 v37;
  char v38;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;

  v8 = sub_22D8B5A48();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = a1;
  v57 = a2;
  sub_22D8B5A24();
  v12 = sub_22D88035C();
  v13 = sub_22D8B705C();
  v15 = v14;
  v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v11, v8);
  v56 = a3;
  v57 = a4;
  sub_22D8B5A24();
  v17 = sub_22D8B705C();
  v19 = v18;
  v16(v11, v8);
  v20 = HIBYTE(v15) & 0xF;
  v49 = v13 & 0xFFFFFFFFFFFFLL;
  v50 = v20;
  if ((v15 & 0x2000000000000000) == 0)
    v20 = v13 & 0xFFFFFFFFFFFFLL;
  v53 = v20;
  if (v20)
  {
    v56 = v17;
    v57 = v19;
    v54 = v13;
    v55 = v15;
    if ((sub_22D8B7080() & 1) != 0)
    {
      v56 = v17;
      v57 = v19;
      v54 = v13;
      v55 = v15;
      v21 = sub_22D8B7074() != 0;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (2 * v21);
    }
    else
    {
      v56 = v13;
      v57 = v15;
      v54 = v17;
      v55 = v19;
      v45[0] = v12;
      if ((sub_22D8B7080() & 1) != 0)
        goto LABEL_40;
      v51 = v17;
      v52 = v13;
      v56 = 0;
      v57 = 0xE000000000000000;
      v47 = v17 & 0xFFFFFFFFFFFFLL;
      v48 = HIBYTE(v19) & 0xF;
      if ((v19 & 0x2000000000000000) != 0)
        v24 = HIBYTE(v19) & 0xF;
      else
        v24 = v17 & 0xFFFFFFFFFFFFLL;
      if (v24)
      {
        v45[1] = (v19 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v46 = v19 & 0xFFFFFFFFFFFFFFLL;
        swift_bridgeObjectRetain();
        for (i = 0; i < v24; i += v27)
        {
          if ((v19 & 0x1000000000000000) != 0)
          {
            sub_22D8B711C();
          }
          else
          {
            if ((v19 & 0x2000000000000000) != 0)
            {
              v54 = v51;
              v55 = v46;
            }
            else if ((v51 & 0x1000000000000000) == 0)
            {
              sub_22D8B7170();
            }
            sub_22D8B717C();
          }
          v27 = v26;
          sub_22D8B5A24();
          v28 = sub_22D8B5A3C();
          v16(v11, v8);
          if ((v28 & 1) == 0)
            sub_22D8B6E40();
        }
        swift_bridgeObjectRelease();
        v46 = v56;
        v47 = v57;
      }
      else
      {
        v46 = 0;
        v47 = 0xE000000000000000;
      }
      v56 = 0;
      v57 = 0xE000000000000000;
      v48 = v15 & 0xFFFFFFFFFFFFFFLL;
      swift_bridgeObjectRetain();
      v29 = 0;
      do
      {
        if ((v15 & 0x1000000000000000) != 0)
        {
          sub_22D8B711C();
        }
        else
        {
          if ((v15 & 0x2000000000000000) != 0)
          {
            v54 = v52;
            v55 = v48;
          }
          else if ((v52 & 0x1000000000000000) == 0)
          {
            sub_22D8B7170();
          }
          sub_22D8B717C();
        }
        v31 = v30;
        sub_22D8B5A24();
        v32 = sub_22D8B5A3C();
        v16(v11, v8);
        if ((v32 & 1) == 0)
          sub_22D8B6E40();
        v29 += v31;
      }
      while (v29 < v53);
      swift_bridgeObjectRelease();
      v33 = v56;
      v34 = v57;
      v36 = v46;
      v35 = v47;
      v56 = v46;
      v57 = v47;
      v54 = v33;
      v55 = v34;
      if ((sub_22D8B7080() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v56 = v36;
        v57 = v35;
        v54 = v33;
        v55 = v34;
        v37 = sub_22D8B7074() != 0;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return (2 * v37);
      }
      v56 = v33;
      v57 = v34;
      v54 = v36;
      v55 = v35;
      v38 = sub_22D8B7080();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v38 & 1) != 0)
      {
LABEL_40:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 3;
      }
      if (qword_255D9A300 != -1)
        swift_once();
      v40 = sub_22D8B6D80();
      __swift_project_value_buffer(v40, (uint64_t)qword_255D9A868);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v41 = sub_22D8B6D68();
      v42 = sub_22D8B6F9C();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = swift_slowAlloc();
        v44 = swift_slowAlloc();
        v56 = v44;
        *(_DWORD *)v43 = 136315394;
        swift_bridgeObjectRetain();
        v54 = sub_22D8755FC(v51, v19, &v56);
        sub_22D8B7044();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v43 + 12) = 2080;
        swift_bridgeObjectRetain();
        v54 = sub_22D8755FC(v52, v15, &v56);
        sub_22D8B7044();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_22D86F000, v41, v42, "Titles don't match: MTTimer – %s, SiriTimer - %s", (uint8_t *)v43, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x22E31A4BC](v44, -1, -1);
        MEMORY[0x22E31A4BC](v43, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      return 5;
    }
  }
  else
  {
    v23 = HIBYTE(v19) & 0xF;
    if ((v19 & 0x2000000000000000) == 0)
      v23 = v17 & 0xFFFFFFFFFFFFLL;
    v22 = v23 != 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v22;
}

unint64_t sub_22D882924()
{
  unint64_t result;

  result = qword_255D9A880;
  if (!qword_255D9A880)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for TemporalEntityMatching.MatchResult.LabelMatchType, &type metadata for TemporalEntityMatching.MatchResult.LabelMatchType);
    atomic_store(result, (unint64_t *)&qword_255D9A880);
  }
  return result;
}

ValueMetadata *type metadata accessor for TemporalEntityMatching()
{
  return &type metadata for TemporalEntityMatching;
}

uint64_t getEnumTagSinglePayload for TemporalEntityMatching.MatchResult(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  BOOL v7;
  unsigned int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
  {
    v6 = *a1;
    v7 = v6 >= 5;
    v8 = v6 - 5;
    if (!v7)
      v8 = -1;
    if (v8 + 1 >= 2)
      return v8;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 5;
    if (a2 + 5 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_22D8829C8 + 4 * byte_22D8B7D30[v4]))();
  }
}

uint64_t storeEnumTagSinglePayload for TemporalEntityMatching.MatchResult(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 5;
  if (a3 + 5 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xFB)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_22D882A70 + 4 * byte_22D8B7D3A[v5]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_22D882AA4 + 4 * byte_22D8B7D35[v5]))();
}

uint64_t sub_22D882AA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D882AAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D882AB4);
  return result;
}

uint64_t sub_22D882AC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D882AC8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_22D882ACC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D882AD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D882AE0(unsigned __int8 *a1)
{
  unsigned int v1;

  v1 = *a1;
  if (v1 >= 5)
    return v1 - 4;
  else
    return 0;
}

_BYTE *sub_22D882AF4(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 4;
  return result;
}

ValueMetadata *type metadata accessor for TemporalEntityMatching.MatchResult()
{
  return &type metadata for TemporalEntityMatching.MatchResult;
}

uint64_t getEnumTagSinglePayload for TemporalEntityMatching.MatchResult.LabelMatchType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TemporalEntityMatching.MatchResult.LabelMatchType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D882BF0 + 4 * byte_22D8B7D44[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_22D882C24 + 4 * byte_22D8B7D3F[v4]))();
}

uint64_t sub_22D882C24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D882C2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D882C34);
  return result;
}

uint64_t sub_22D882C40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D882C48);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_22D882C4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D882C54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TemporalEntityMatching.MatchResult.LabelMatchType()
{
  return &type metadata for TemporalEntityMatching.MatchResult.LabelMatchType;
}

uint64_t sub_22D882C70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9A888);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9A888);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t SIRINLUUserDialogAct.firstUsoTask.getter()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16[2];

  v0 = sub_22D8B6408();
  if (v0 >> 62)
  {
    swift_bridgeObjectRetain();
    v1 = sub_22D8B71C4();
    swift_bridgeObjectRelease();
    if (v1)
    {
LABEL_3:
      if ((v0 & 0xC000000000000001) != 0)
      {
        v1 = MEMORY[0x22E319D0C](0, v0);
      }
      else
      {
        if (!*(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_19:
          swift_once();
LABEL_7:
          v2 = sub_22D8B6D80();
          __swift_project_value_buffer(v2, (uint64_t)qword_255D9A888);
          swift_retain_n();
          v3 = sub_22D8B6D68();
          v4 = sub_22D8B6FC0();
          if (os_log_type_enabled(v3, v4))
          {
            v5 = swift_slowAlloc();
            v6 = swift_slowAlloc();
            v16[0] = v6;
            *(_DWORD *)v5 = 136315394;
            v7 = sub_22D8B68E8();
            sub_22D8755FC(v7, v8, v16);
            sub_22D8B7044();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v5 + 12) = 2080;
            v9 = sub_22D8B68DC();
            sub_22D8755FC(v9, v10, v16);
            sub_22D8B7044();
            swift_release_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_22D86F000, v3, v4, "NLv4TranslationParse: Input is entity=%s verb=%s", (uint8_t *)v5, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x22E31A4BC](v6, -1, -1);
            MEMORY[0x22E31A4BC](v5, -1, -1);

          }
          else
          {

            swift_release_n();
          }
          return v1;
        }
        v1 = *(_QWORD *)(v0 + 32);
        swift_retain();
      }
      swift_bridgeObjectRelease();
      if (qword_255D9A308 == -1)
        goto LABEL_7;
      goto LABEL_19;
    }
  }
  else
  {
    v1 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v1)
      goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  if (qword_255D9A308 != -1)
    swift_once();
  v12 = sub_22D8B6D80();
  __swift_project_value_buffer(v12, (uint64_t)qword_255D9A888);
  v13 = sub_22D8B6D68();
  v14 = sub_22D8B6FB4();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_22D86F000, v13, v14, "NLv4TranslationParse: No tasks in input?", v15, 2u);
    MEMORY[0x22E31A4BC](v15, -1, -1);
  }

  return 0;
}

uint64_t static Siri_Nlu_External_SystemDialogAct.buildDisambiguationDialogActFrom(_:includeBinaryPrompt:)@<X0>(unint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  unint64_t v35;
  __int128 v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[2];
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  char *v87;
  __int128 v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;

  v73 = a2;
  v5 = sub_22D8B621C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v68 = (char *)v67 - v10;
  v11 = sub_22D8B633C();
  v80 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v72 = (char *)v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v79 = (char *)v67 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A830);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v67 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_22D8B61E0();
  MEMORY[0x24BDAC7A8](v18);
  v85 = (char *)v67 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_22D8B62DC();
  v93 = *(_QWORD *)(v20 - 8);
  v94 = v20;
  v21 = MEMORY[0x24BDAC7A8](v20);
  v83 = (char *)v67 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v86 = (char *)v67 - v23;
  v95 = sub_22D8B6288();
  v92 = *(_QWORD *)(v95 - 8);
  v24 = MEMORY[0x24BDAC7A8](v95);
  v67[1] = (char *)v67 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v87 = (char *)v67 - v27;
  MEMORY[0x24BDAC7A8](v26);
  v84 = (char *)v67 - v28;
  v29 = sub_22D8B6318();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v78 = (char *)v67 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D8B630C();
  v91 = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_22D8B71C4();
    v32 = result;
  }
  else
  {
    v32 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
  }
  v76 = v11;
  v77 = a3;
  v75 = v29;
  v74 = v30;
  v71 = v5;
  v70 = v6;
  v69 = v9;
  if (v32)
  {
    if (v32 < 1)
    {
      __break(1u);
      return result;
    }
    v34 = 0;
    v35 = MEMORY[0x24BEE4AF8];
    v89 = v91 & 0xC000000000000001;
    *((_QWORD *)&v36 + 1) = 3;
    v88 = xmmword_22D8B7AC0;
    *(_QWORD *)&v36 = 136315138;
    v82 = v36;
    v81 = MEMORY[0x24BEE4AD8] + 8;
    v37 = v86;
    v38 = v84;
    v90 = v32;
    do
    {
      if (v89)
      {
        v39 = MEMORY[0x22E319D0C](v34, v91);
      }
      else
      {
        v39 = *(_QWORD *)(v91 + 8 * v34 + 32);
        swift_retain();
      }
      sub_22D8B627C();
      sub_22D8B62D0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B350);
      v40 = swift_allocObject();
      *(_OWORD *)(v40 + 16) = v88;
      *(_QWORD *)(v40 + 32) = v39;
      v97 = v40;
      sub_22D8B6ED0();
      v41 = v38;
      v42 = v37;
      v43 = v97;
      swift_retain();
      sub_22D8B63E4();
      v44 = sub_22D8B63F0();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v17, 0, 1, v44);
      MEMORY[0x22E318F98](v43, v17);
      swift_bridgeObjectRelease();
      sub_22D8740E0((uint64_t)v17, &qword_255D9A830);
      sub_22D8B6378();
      swift_release();
      sub_22D8B62C4();
      (*(void (**)(char *, char *, uint64_t))(v93 + 16))(v83, v42, v94);
      sub_22D8B6264();
      (*(void (**)(char *, char *, uint64_t))(v92 + 16))(v87, v41, v95);
      v38 = v41;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v35 = sub_22D883C60(0, *(_QWORD *)(v35 + 16) + 1, 1, v35, &qword_255D9A8E0, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C828]);
      v46 = *(_QWORD *)(v35 + 16);
      v45 = *(_QWORD *)(v35 + 24);
      if (v46 >= v45 >> 1)
        v35 = sub_22D883C60(v45 > 1, v46 + 1, 1, v35, &qword_255D9A8E0, (uint64_t (*)(_QWORD))MEMORY[0x24BE9C828]);
      *(_QWORD *)(v35 + 16) = v46 + 1;
      v47 = v92;
      v48 = v95;
      (*(void (**)(unint64_t, char *, uint64_t))(v92 + 32))(v35+ ((*(unsigned __int8 *)(v47 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v47 + 80))+ *(_QWORD *)(v92 + 72) * v46, v87, v95);
      swift_release();
      v37 = v86;
      (*(void (**)(char *, uint64_t))(v93 + 8))(v86, v94);
      (*(void (**)(char *, uint64_t))(v47 + 8))(v38, v48);
      ++v34;
    }
    while (v90 != v34);
  }
  else
  {
    v35 = MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v49 = v79;
  sub_22D8B6330();
  swift_bridgeObjectRetain();
  sub_22D8B6324();
  v50 = v76;
  (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v72, v49, v76);
  v51 = v78;
  sub_22D8B62E8();
  if ((v73 & 1) != 0)
  {
    v52 = v68;
    sub_22D8B6210();
    sub_22D8B627C();
    sub_22D8B6204();
    v53 = v70;
    v54 = v71;
    (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v69, v52, v71);
    sub_22D8B62F4();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v54);
  }
  if (qword_255D9A308 != -1)
    swift_once();
  v55 = sub_22D8B6D80();
  __swift_project_value_buffer(v55, (uint64_t)qword_255D9A888);
  swift_bridgeObjectRetain_n();
  v56 = sub_22D8B6D68();
  v57 = sub_22D8B6FC0();
  if (os_log_type_enabled(v56, v57))
  {
    v58 = swift_slowAlloc();
    v59 = swift_slowAlloc();
    v97 = v59;
    *(_DWORD *)v58 = 134218242;
    v96 = *(_QWORD *)(v35 + 16);
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    *(_WORD *)(v58 + 12) = 2080;
    v60 = swift_bridgeObjectRetain();
    v61 = MEMORY[0x22E319A90](v60, v95);
    v63 = v62;
    swift_bridgeObjectRelease();
    v96 = sub_22D8755FC(v61, v63, &v97);
    v51 = v78;
    sub_22D8B7044();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v56, v57, "#NLContextUpdateFactory sending SystemGaveOptions dialog act with %ld choices: %s", (uint8_t *)v58, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v59, -1, -1);
    MEMORY[0x22E31A4BC](v58, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  (*(void (**)(char *, uint64_t))(v80 + 8))(v79, v50);
  v64 = v74;
  v65 = v77;
  v66 = v75;
  (*(void (**)(uint64_t, char *, uint64_t))(v74 + 32))(v77, v51, v75);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v64 + 56))(v65, 0, 1, v66);
}

uint64_t sub_22D883C4C(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_22D883C60(a1, a2, a3, a4, &qword_255D9A8D8, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900]);
}

uint64_t sub_22D883C60(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_22D8B71AC();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_22D8842DC(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

_QWORD *sub_22D883E6C(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_22D883EA8(a1, a2, a3, a4, &qword_255D9A8D0);
}

uint64_t sub_22D883E80(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_22D883C60(a1, a2, a3, a4, &qword_255D9A8C8, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

_QWORD *sub_22D883E94(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_22D883EA8(a1, a2, a3, a4, &qword_255D9A8C0);
}

_QWORD *sub_22D883EA8(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v6 = (char)result;
  if ((a3 & 1) == 0)
  {
    v8 = a2;
    goto LABEL_8;
  }
  v7 = a4[3];
  v8 = v7 >> 1;
  if ((uint64_t)(v7 >> 1) >= a2)
    goto LABEL_8;
  if (v8 + 0x4000000000000000 >= 0)
  {
    v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v8 = a2;
LABEL_8:
    v9 = a4[2];
    if (v8 <= v9)
      v10 = a4[2];
    else
      v10 = v8;
    if (v10)
    {
      __swift_instantiateConcreteTypeFromMangledName(a5);
      v11 = (_QWORD *)swift_allocObject();
      v12 = _swift_stdlib_malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 1;
      v11[2] = v9;
      v11[3] = 2 * (v13 >> 5);
      v14 = v11 + 4;
      if ((v6 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v14 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[4 * v9 + 4])
          memmove(v14, a4 + 4, 32 * v9);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_22D8843F4(0, v9, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_22D883FC0(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B0);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_22D8B71AC();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8) - 8);
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
    sub_22D8844E0(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

_QWORD *sub_22D8841D0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8A8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
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
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_22D8845FC(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_22D8842DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_22D8B71F4();
  __break(1u);
  return result;
}

uint64_t sub_22D8843F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  result = sub_22D8B71F4();
  __break(1u);
  return result;
}

uint64_t sub_22D8844E0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8) - 8);
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
  result = sub_22D8B71F4();
  __break(1u);
  return result;
}

uint64_t sub_22D8845FC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  result = sub_22D8B71F4();
  __break(1u);
  return result;
}

uint64_t sub_22D8846F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9A8E8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9A8E8);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_22D884780()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A900);
  __swift_allocate_value_buffer(v0, qword_255D9F6D0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F6D0);
  v2 = sub_22D8B5BF8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
}

uint64_t static DateTimeInferenceUtils.dateComponents(forDateTime:)()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v13;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A908);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A910);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22D8B6A98();
  v7 = sub_22D8B6AA4();
  v8 = sub_22D8B5D0C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = sub_22D8B5D24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v2, 1, 1, v9);
  sub_22D8B5B50();
  if (v6)
  {
    swift_retain();
    sub_22D8B69B4();
    swift_release();
    sub_22D8B5AF0();
    swift_retain();
    sub_22D8B69C0();
    swift_release();
    sub_22D8B5B08();
    swift_retain();
    sub_22D8B69A8();
    swift_release();
  }
  else
  {
    sub_22D8B5AF0();
    sub_22D8B5B08();
  }
  sub_22D8B5AB4();
  if (v7)
  {
    swift_retain();
    sub_22D8B6A08();
    v11 = v10;
    swift_release();
    if ((v11 & 1) != 0)
      sub_22D8B6A14();
    sub_22D8B5AD8();
    swift_retain();
    sub_22D8B6A20();
    swift_release();
  }
  else
  {
    sub_22D8B5AD8();
  }
  sub_22D8B5B14();
  swift_release();
  return swift_release();
}

uint64_t static DateTimeInferenceUtils.inferDateTimeRange(from:anchorDate:)(uint64_t a1, uint64_t a2)
{
  return sub_22D876A04(a1, 1, a2);
}

uint64_t static DateTimeInferenceUtils.simpleTimeResolution(forDateComponents:meridiemSetByUser:allowNearest:referenceDate:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, int a3@<W2>, char *a4@<X3>, uint64_t a5@<X8>)
{
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
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
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  NSObject *v94;
  os_log_type_t v95;
  _BOOL4 v96;
  uint8_t *v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  char *v102;
  void (*v104)(_QWORD);
  char *v105;
  _QWORD *v106;
  unsigned int *v107;
  _DWORD *v108;
  uint64_t v109;
  unsigned int (*v110)(char *, uint64_t, uint64_t);
  char *v111;
  uint64_t v112;
  void (**v113)(char *, _QWORD, uint64_t);
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  char *v120;
  void (*v121)(char *, uint64_t);
  uint64_t v122;
  void (*v123)(_QWORD);
  char *v124;
  int v125;
  void (**v126)(char *, _QWORD, uint64_t);
  char *v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  char *v132;
  uint64_t v133;
  char *v134;
  char *v135;
  uint64_t v136;
  void (**v137)(char *, _QWORD, uint64_t);
  uint64_t v138;
  _QWORD *v139;
  char *v140;
  char *v141;
  NSObject *v142;
  os_log_type_t v143;
  uint8_t *v144;
  void (*v145)(char *, uint64_t, uint64_t);
  char *v146;
  char *v147;
  NSObject *v148;
  os_log_type_t v149;
  uint8_t *v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  char *v155;
  char *v156;
  unint64_t v157;
  unint64_t v158;
  NSObject *v159;
  os_log_type_t v160;
  uint8_t *v161;
  uint64_t v162;
  uint64_t v163;
  unint64_t v164;
  NSObject *v165;
  os_log_type_t v166;
  uint8_t *v167;
  uint64_t v168;
  uint64_t v169;
  unint64_t v170;
  char *v171;
  uint64_t v172;
  char *v173;
  uint64_t v174;
  char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  char *v179;
  void (*v180)(uint64_t, char *, uint64_t);
  char *v181;
  NSObject *v182;
  os_log_type_t v183;
  uint8_t *v184;
  uint64_t v185;
  uint64_t v186;
  unint64_t v187;
  _QWORD *v188;
  void (*v189)(char *, uint64_t);
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  char *v193;
  char *v194;
  NSObject *v195;
  os_log_type_t v196;
  uint8_t *v197;
  uint64_t v198;
  uint64_t v199;
  unint64_t v200;
  void (*v201)(char *, uint64_t);
  unint64_t v202;
  unint64_t v203;
  char *v204;
  char *v205;
  uint64_t v206;
  char *v207;
  uint64_t v208;
  uint64_t v209;
  char *v210;
  void (*v211)(char *, char *, uint64_t);
  char *v212;
  NSObject *v213;
  os_log_type_t v214;
  uint8_t *v215;
  uint64_t v216;
  uint64_t v217;
  unint64_t v218;
  char *v219;
  char *v220;
  unint64_t v221;
  unint64_t v222;
  unint64_t v223;
  void (*v224)(char *, uint64_t);
  NSObject *v225;
  os_log_type_t v226;
  uint8_t *v227;
  uint64_t v228;
  uint64_t v229;
  unint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  char *v234;
  NSObject *v235;
  os_log_type_t v236;
  uint8_t *v237;
  uint64_t v238;
  uint64_t v239;
  unint64_t v240;
  uint64_t v241;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v243;
  unint64_t v244;
  NSObject *v245;
  os_log_type_t v246;
  uint8_t *v247;
  uint64_t v248;
  uint64_t v249;
  unint64_t v250;
  uint64_t v251;
  uint64_t v252;
  char *v253;
  uint64_t v254;
  char *v255;
  uint64_t v256;
  uint64_t v257;
  char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  char *v265;
  char *v266;
  NSObject *v267;
  os_log_type_t v268;
  _BOOL4 v269;
  uint8_t *v270;
  uint64_t v271;
  uint64_t v272;
  unint64_t v273;
  uint64_t v274;
  char *v275;
  unint64_t v276;
  unint64_t v277;
  unint64_t v278;
  NSObject *v279;
  os_log_type_t v280;
  uint8_t *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  unint64_t v285;
  unint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  void (*v294)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v295;
  NSObject *v296;
  os_log_type_t v297;
  uint8_t *v298;
  uint64_t v299;
  uint64_t v300;
  unint64_t v301;
  char *v302;
  unsigned int (*v303)(uint64_t, uint64_t, uint64_t);
  uint64_t v304;
  NSObject *v305;
  os_log_type_t v306;
  uint8_t *v307;
  uint64_t v308;
  char *v309;
  uint64_t v310;
  unint64_t v311;
  char *v312;
  void (*v313)(uint64_t, char *, uint64_t);
  uint64_t v314;
  uint64_t (*v315)(char *, uint64_t);
  char *v316;
  uint64_t v317;
  char *v318;
  char *v319;
  char *v320;
  char *v321;
  char *v322;
  char *v323;
  char *v324;
  char *v325;
  char *v326;
  char *v327;
  char *v328;
  char *v329;
  char *v330;
  char *v331;
  char *v332;
  char *v333;
  char *v334;
  char *v335;
  uint64_t v336;
  uint64_t v337;
  char *v338;
  char *v339;
  char *v340;
  char *v341;
  uint64_t v342;
  char *v343;
  void (*v344)(char *, uint64_t, uint64_t);
  char *v345;
  uint64_t v346;
  uint64_t v347;
  int v348;
  char *v349;
  uint64_t v350;
  char *v351;
  uint64_t v352;
  void (*v353)(char *, uint64_t);
  char *v354;
  void (*v355)(char *, char *, uint64_t);
  uint64_t v356;
  uint64_t v357;
  char *v358;
  void (*v359)(_QWORD);
  _QWORD *v360;
  uint64_t v361;
  void (**v362)(char *, _QWORD, uint64_t);
  uint64_t v363;
  char *v364;
  char *v365;
  int v366;
  char *v367;
  char *v368;
  uint64_t v369;
  char *v370;
  uint64_t v371;
  uint64_t v372;
  _QWORD *v373;
  char *v374;
  uint64_t v375;
  uint64_t v376;
  char *v377;
  uint64_t v378;
  uint64_t v379;
  char *v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  unint64_t v386;

  v380 = a4;
  v348 = a3;
  v366 = a2;
  v372 = a5;
  v371 = sub_22D8B5CAC();
  v363 = *(_QWORD *)(v371 - 8);
  MEMORY[0x24BDAC7A8](v371);
  v370 = (char *)&v317 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v369 = sub_22D8B5CB8();
  v362 = *(void (***)(char *, _QWORD, uint64_t))(v369 - 8);
  MEMORY[0x24BDAC7A8](v369);
  v368 = (char *)&v317 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v378 = sub_22D8B5C88();
  v376 = *(_QWORD *)(v378 - 8);
  MEMORY[0x24BDAC7A8](v378);
  v367 = (char *)&v317 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v360 = (_QWORD *)sub_22D8B5D00();
  v359 = (void (*)(_QWORD))*(v360 - 1);
  MEMORY[0x24BDAC7A8](v360);
  v358 = (char *)&v317 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v337 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A900);
  v10 = MEMORY[0x24BDAC7A8](v337);
  v347 = (uint64_t)&v317 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v336 = (uint64_t)&v317 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v346 = (uint64_t)&v317 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v352 = (uint64_t)&v317 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v324 = (char *)&v317 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v339 = (char *)&v317 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v327 = (char *)&v317 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v334 = (char *)&v317 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v333 = (char *)&v317 - v27;
  v28 = MEMORY[0x24BDAC7A8](v26);
  v354 = (char *)&v317 - v29;
  v30 = MEMORY[0x24BDAC7A8](v28);
  v340 = (char *)&v317 - v31;
  v32 = MEMORY[0x24BDAC7A8](v30);
  v350 = (uint64_t)&v317 - v33;
  MEMORY[0x24BDAC7A8](v32);
  v35 = (char *)&v317 - v34;
  v36 = sub_22D8B5BF8();
  v37 = *(_QWORD *)(v36 - 8);
  v38 = MEMORY[0x24BDAC7A8](v36);
  v338 = (char *)&v317 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = MEMORY[0x24BDAC7A8](v38);
  v320 = (char *)&v317 - v41;
  v42 = MEMORY[0x24BDAC7A8](v40);
  v318 = (char *)&v317 - v43;
  v44 = MEMORY[0x24BDAC7A8](v42);
  v319 = (char *)&v317 - v45;
  v46 = MEMORY[0x24BDAC7A8](v44);
  v330 = (char *)&v317 - v47;
  v48 = MEMORY[0x24BDAC7A8](v46);
  v328 = (char *)&v317 - v49;
  v50 = MEMORY[0x24BDAC7A8](v48);
  v329 = (char *)&v317 - v51;
  v52 = MEMORY[0x24BDAC7A8](v50);
  v323 = (char *)&v317 - v53;
  v54 = MEMORY[0x24BDAC7A8](v52);
  v321 = (char *)&v317 - v55;
  v56 = MEMORY[0x24BDAC7A8](v54);
  v322 = (char *)&v317 - v57;
  v58 = MEMORY[0x24BDAC7A8](v56);
  v335 = (char *)&v317 - v59;
  v60 = MEMORY[0x24BDAC7A8](v58);
  v325 = (char *)&v317 - v61;
  v62 = MEMORY[0x24BDAC7A8](v60);
  v326 = (char *)&v317 - v63;
  v64 = MEMORY[0x24BDAC7A8](v62);
  v343 = (char *)&v317 - v65;
  v66 = MEMORY[0x24BDAC7A8](v64);
  v349 = (char *)&v317 - v67;
  v68 = MEMORY[0x24BDAC7A8](v66);
  v70 = (char *)&v317 - v69;
  v71 = MEMORY[0x24BDAC7A8](v68);
  v331 = (char *)&v317 - v72;
  v73 = MEMORY[0x24BDAC7A8](v71);
  v332 = (char *)&v317 - v74;
  v75 = MEMORY[0x24BDAC7A8](v73);
  v365 = (char *)&v317 - v76;
  MEMORY[0x24BDAC7A8](v75);
  v78 = (char *)&v317 - v77;
  v357 = sub_22D8B5D0C();
  v356 = *(_QWORD *)(v357 - 8);
  MEMORY[0x24BDAC7A8](v357);
  v80 = (char *)&v317 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_22D8B5B5C();
  v82 = *(_QWORD *)(v81 - 8);
  v83 = MEMORY[0x24BDAC7A8](v81);
  v345 = (char *)&v317 - ((v84 + 15) & 0xFFFFFFFFFFFFFFF0);
  v85 = MEMORY[0x24BDAC7A8](v83);
  v351 = (char *)&v317 - v86;
  MEMORY[0x24BDAC7A8](v85);
  v88 = (char *)&v317 - v87;
  v344 = *(void (**)(char *, uint64_t, uint64_t))(v82 + 16);
  v344((char *)&v317 - v87, a1, v81);
  sub_22D8B5AF0();
  sub_22D8B5B08();
  sub_22D8B5AB4();
  v89 = sub_22D8B5ACC();
  if ((v90 & 1) != 0)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v37 + 56))(v372, 1, 1, v36);
    return (*(uint64_t (**)(char *, uint64_t))(v82 + 8))(v88, v81);
  }
  v364 = v35;
  v317 = v89;
  v341 = v70;
  v373 = (_QWORD *)v37;
  v374 = v88;
  v377 = v80;
  sub_22D8B5CE8();
  if (qword_255D9A310 != -1)
    swift_once();
  v91 = sub_22D8B6D80();
  v92 = __swift_project_value_buffer(v91, (uint64_t)qword_255D9A8E8);
  v93 = v373;
  v355 = (void (*)(char *, char *, uint64_t))v373[2];
  v355(v78, v380, v36);
  v375 = v92;
  v94 = sub_22D8B6D68();
  v95 = sub_22D8B6FA8();
  v96 = os_log_type_enabled(v94, v95);
  v379 = v36;
  v361 = v81;
  v342 = v82;
  if (v96)
  {
    v97 = (uint8_t *)swift_slowAlloc();
    v98 = swift_slowAlloc();
    v385 = v98;
    *(_DWORD *)v97 = 136315138;
    sub_22D879430(&qword_255D9A920, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
    v99 = sub_22D8B7314();
    v384 = sub_22D8755FC(v99, v100, &v385);
    v101 = (uint64_t)v364;
    v36 = v379;
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    v353 = (void (*)(char *, uint64_t))v93[1];
    v353(v78, v36);
    _os_log_impl(&dword_22D86F000, v94, v95, "simpleDateTimeResolution: Using referenceDate %s", v97, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v98, -1, -1);
    MEMORY[0x22E31A4BC](v97, -1, -1);

    v102 = v365;
  }
  else
  {
    v353 = (void (*)(char *, uint64_t))v93[1];
    v353(v78, v36);

    v102 = v365;
    v101 = (uint64_t)v364;
  }
  v104 = v359;
  v105 = v358;
  v106 = v360;
  (*((void (**)(char *, _QWORD, _QWORD *))v359 + 13))(v358, *MEMORY[0x24BDCF260], v360);
  sub_22D8B5CDC();
  (*((void (**)(char *, _QWORD *))v104 + 1))(v105, v106);
  v107 = (unsigned int *)MEMORY[0x24BDCF0B0];
  v108 = (_DWORD *)MEMORY[0x24BDCF068];
  if ((v366 & 1) != 0)
  {
    v109 = v350;
    sub_22D8782E4(v101, v350);
    v110 = (unsigned int (*)(char *, uint64_t, uint64_t))v93[6];
    if (v110((char *)v109, 1, v36) != 1)
    {
      v360 = (_QWORD *)v93[4];
      ((void (*)(char *, uint64_t, uint64_t))v360)(v102, v109, v36);
      v111 = v367;
      (*(void (**)(char *, _QWORD, uint64_t))(v376 + 104))(v367, *MEMORY[0x24BDCF018], v378);
      v112 = *v107;
      v113 = v362;
      v114 = v368;
      v115 = v369;
      v362[13](v368, v112, v369);
      v116 = *v108;
      v117 = v363;
      v118 = v370;
      v119 = v371;
      (*(void (**)(char *, uint64_t, uint64_t))(v363 + 104))(v370, v116, v371);
      v120 = v340;
      sub_22D8B5CF4();
      v121 = *(void (**)(char *, uint64_t))(v117 + 8);
      v122 = v379;
      v121(v118, v119);
      ((void (*)(char *, uint64_t))v113[1])(v114, v115);
      v109 = (uint64_t)v120;
      (*(void (**)(char *, uint64_t))(v376 + 8))(v111, v378);
      if (v110(v120, 1, v122) != 1)
      {
        v179 = v332;
        v180 = (void (*)(uint64_t, char *, uint64_t))v360;
        ((void (*)(char *, char *, uint64_t))v360)(v332, v120, v122);
        v181 = v331;
        v355(v331, v179, v122);
        v182 = sub_22D8B6D68();
        v183 = sub_22D8B6FA8();
        if (os_log_type_enabled(v182, v183))
        {
          v184 = (uint8_t *)swift_slowAlloc();
          v185 = swift_slowAlloc();
          v385 = v185;
          *(_DWORD *)v184 = 136315138;
          sub_22D879430(&qword_255D9A920, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
          v186 = sub_22D8B7314();
          v384 = sub_22D8755FC(v186, v187, &v385);
          v188 = v373;
          v122 = v379;
          sub_22D8B7044();
          swift_bridgeObjectRelease();
          v189 = v353;
          v353(v181, v122);
          _os_log_impl(&dword_22D86F000, v182, v183, "simpleDateTimeResolution: exact match: %s", v184, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x22E31A4BC](v185, -1, -1);
          MEMORY[0x22E31A4BC](v184, -1, -1);

          v189(v365, v122);
          sub_22D8740E0((uint64_t)v364, &qword_255D9A900);
          (*(void (**)(char *, uint64_t))(v356 + 8))(v377, v357);
          v190 = v372;
          v191 = v361;
          v192 = v342;
        }
        else
        {

          v201 = v353;
          v353(v181, v122);
          v201(v365, v122);
          sub_22D8740E0((uint64_t)v364, &qword_255D9A900);
          (*(void (**)(char *, uint64_t))(v356 + 8))(v377, v357);
          v190 = v372;
          v191 = v361;
          v192 = v342;
          v188 = v373;
        }
        v180(v190, v179, v122);
        ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v188[7])(v190, 0, 1, v122);
        return (*(uint64_t (**)(char *, uint64_t))(v192 + 8))(v374, v191);
      }
      v353(v365, v122);
      v108 = (_DWORD *)MEMORY[0x24BDCF068];
      v107 = (unsigned int *)MEMORY[0x24BDCF0B0];
    }
    sub_22D8740E0(v109, &qword_255D9A900);
  }
  v123 = *(void (**)(_QWORD))(v376 + 104);
  v124 = v367;
  LODWORD(v350) = *MEMORY[0x24BDCF020];
  v359 = v123;
  v123(v367);
  v125 = *v107;
  v126 = v362;
  v127 = (char *)v362[13];
  v128 = v368;
  LODWORD(v360) = v125;
  v129 = v369;
  v365 = v127;
  ((void (*)(char *))v127)(v368);
  v130 = v363;
  v131 = *(char **)(v363 + 104);
  v132 = v370;
  LODWORD(v340) = *v108;
  v133 = v371;
  v358 = v131;
  ((void (*)(char *))v131)(v370);
  v134 = v354;
  v135 = v377;
  sub_22D8B5CF4();
  v136 = (uint64_t)v134;
  v363 = *(_QWORD *)(v130 + 8);
  ((void (*)(char *, uint64_t))v363)(v132, v133);
  v137 = (void (**)(char *, _QWORD, uint64_t))v126[1];
  v138 = v379;
  v362 = v137;
  ((void (*)(char *, uint64_t))v137)(v128, v129);
  v139 = v373;
  v376 = *(_QWORD *)(v376 + 8);
  ((void (*)(char *, uint64_t))v376)(v124, v378);
  v140 = (char *)v139[6];
  if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v140)(v136, 1, v138) == 1)
  {
    v141 = v135;
    sub_22D8740E0(v136, &qword_255D9A900);
    v142 = sub_22D8B6D68();
    v143 = sub_22D8B6FA8();
    if (os_log_type_enabled(v142, v143))
    {
      v144 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v144 = 0;
      _os_log_impl(&dword_22D86F000, v142, v143, "simpleDateTimeResolution: unable to find next matching date for date components", v144, 2u);
      MEMORY[0x22E31A4BC](v144, -1, -1);
    }

    sub_22D8740E0((uint64_t)v364, &qword_255D9A900);
    (*(void (**)(char *, uint64_t))(v356 + 8))(v141, v357);
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v139[7])(v372, 1, 1, v138);
    return (*(uint64_t (**)(char *, uint64_t))(v342 + 8))(v374, v361);
  }
  else
  {
    v145 = (void (*)(char *, uint64_t, uint64_t))v139[4];
    v146 = v341;
    v145(v341, v136, v138);
    v147 = v349;
    v355(v349, v146, v138);
    v148 = sub_22D8B6D68();
    v149 = sub_22D8B6FA8();
    if (os_log_type_enabled(v148, v149))
    {
      v150 = (uint8_t *)swift_slowAlloc();
      v151 = swift_slowAlloc();
      v385 = v151;
      *(_DWORD *)v150 = 136315138;
      sub_22D879430(&qword_255D9A920, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
      v152 = sub_22D8B7314();
      v384 = sub_22D8755FC(v152, v153, &v385);
      v139 = v373;
      v138 = v379;
      sub_22D8B7044();
      swift_bridgeObjectRelease();
      v353(v147, v138);
      _os_log_impl(&dword_22D86F000, v148, v149, "simpleDateTimeResolution: nextMatching: %s", v150, 0xCu);
      swift_arrayDestroy();
      v154 = v151;
      v155 = v380;
      MEMORY[0x22E31A4BC](v154, -1, -1);
      MEMORY[0x22E31A4BC](v150, -1, -1);

      v156 = v351;
    }
    else
    {
      v353(v147, v138);

      v156 = v351;
      v155 = v380;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8D8);
    v157 = (*((unsigned __int8 *)v139 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v139 + 80);
    v331 = (char *)v139[9];
    v158 = swift_allocObject();
    *(_OWORD *)(v158 + 16) = xmmword_22D8B7E30;
    v349 = (char *)v157;
    v355((char *)(v158 + v157), v341, v138);
    v386 = v158;
    v354 = v140;
    v332 = (char *)v145;
    if ((v366 & 1) != 0)
      goto LABEL_52;
    v344(v156, (uint64_t)v374, v361);
    if (__OFADD__(v317, 12))
    {
      __break(1u);
      goto LABEL_96;
    }
    sub_22D8B5AD8();
    v159 = sub_22D8B6D68();
    v160 = sub_22D8B6FA8();
    if (os_log_type_enabled(v159, v160))
    {
      v161 = (uint8_t *)swift_slowAlloc();
      v162 = swift_slowAlloc();
      v385 = v162;
      *(_DWORD *)v161 = 136315138;
      swift_beginAccess();
      sub_22D879430(&qword_255D9A918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
      v163 = sub_22D8B7314();
      v384 = sub_22D8755FC(v163, v164, &v385);
      sub_22D8B7044();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D86F000, v159, v160, "simpleDateTimeResolution: using components for nextMatchingOffset: %s", v161, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v162, -1, -1);
      MEMORY[0x22E31A4BC](v161, -1, -1);
    }

    v165 = sub_22D8B6D68();
    v166 = sub_22D8B6FA8();
    if (os_log_type_enabled(v165, v166))
    {
      v167 = (uint8_t *)swift_slowAlloc();
      v168 = swift_slowAlloc();
      v385 = v168;
      *(_DWORD *)v167 = 136315138;
      swift_beginAccess();
      sub_22D879430(&qword_255D9A918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
      v169 = sub_22D8B7314();
      v384 = sub_22D8755FC(v169, v170, &v385);
      sub_22D8B7044();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D86F000, v165, v166, "simpleDateTimeResolution: using components for nextMatchingOffset: %s", v167, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v168, -1, -1);
      MEMORY[0x22E31A4BC](v167, -1, -1);
    }

    v138 = v379;
    swift_beginAccess();
    v171 = v367;
    v172 = v378;
    ((void (*)(char *, _QWORD, uint64_t))v359)(v367, v350, v378);
    v173 = v368;
    v174 = v369;
    ((void (*)(char *, _QWORD, uint64_t))v365)(v368, v360, v369);
    v175 = v370;
    v176 = v371;
    ((void (*)(char *, _QWORD, uint64_t))v358)(v370, v340, v371);
    v177 = (uint64_t)v333;
    sub_22D8B5CF4();
    ((void (*)(char *, uint64_t))v363)(v175, v176);
    ((void (*)(char *, uint64_t))v362)(v173, v174);
    ((void (*)(char *, uint64_t))v376)(v171, v172);
    v140 = v354;
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v354)(v177, 1, v138) != 1)
    {
      v193 = v343;
      v145 = (void (*)(char *, uint64_t, uint64_t))v332;
      ((void (*)(char *, uint64_t, uint64_t))v332)(v343, v177, v138);
      v194 = v326;
      v355(v326, v193, v138);
      v195 = sub_22D8B6D68();
      v196 = sub_22D8B6FA8();
      if (os_log_type_enabled(v195, v196))
      {
        v197 = (uint8_t *)swift_slowAlloc();
        v198 = swift_slowAlloc();
        v384 = v198;
        *(_DWORD *)v197 = 136315138;
        sub_22D879430(&qword_255D9A920, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
        v199 = sub_22D8B7314();
        v382 = sub_22D8755FC(v199, v200, &v384);
        v145 = (void (*)(char *, uint64_t, uint64_t))v332;
        v138 = v379;
        sub_22D8B7044();
        swift_bridgeObjectRelease();
        v353(v194, v138);
        _os_log_impl(&dword_22D86F000, v195, v196, "simpleDateTimeResolution: nextMatchingOffset: %s", v197, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E31A4BC](v198, -1, -1);
        MEMORY[0x22E31A4BC](v197, -1, -1);
      }
      else
      {
        v353(v194, v138);
      }

      v155 = v325;
      v355(v325, v343, v138);
      v158 = v386;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
        goto LABEL_36;
      goto LABEL_98;
    }
    sub_22D8740E0(v177, &qword_255D9A900);
    v178 = (uint64_t)v334;
    v145 = (void (*)(char *, uint64_t, uint64_t))v332;
    v139 = v373;
    while (1)
    {
      sub_22D8782E4((uint64_t)v364, v178);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v140)(v178, 1, v138) == 1)
      {
        sub_22D8740E0(v178, &qword_255D9A900);
      }
      else
      {
        v145(v335, v178, v138);
        v204 = v367;
        ((void (*)(char *, _QWORD, uint64_t))v359)(v367, *MEMORY[0x24BDCF018], v378);
        v205 = v368;
        v206 = v369;
        ((void (*)(char *, _QWORD, uint64_t))v365)(v368, v360, v369);
        v207 = v370;
        v208 = v371;
        ((void (*)(char *, _QWORD, uint64_t))v358)(v370, v340, v371);
        v209 = (uint64_t)v327;
        sub_22D8B5CF4();
        ((void (*)(char *, uint64_t))v363)(v207, v208);
        ((void (*)(char *, uint64_t))v362)(v205, v206);
        ((void (*)(char *, uint64_t))v376)(v204, v378);
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v354)(v209, 1, v138) == 1)
        {
          v353(v335, v138);
          sub_22D8740E0(v209, &qword_255D9A900);
          v156 = v351;
        }
        else
        {
          v210 = v322;
          v211 = (void (*)(char *, char *, uint64_t))v332;
          ((void (*)(char *, uint64_t, uint64_t))v332)(v322, v209, v138);
          v212 = v321;
          v355(v321, v210, v138);
          v213 = sub_22D8B6D68();
          v214 = sub_22D8B6FA8();
          if (os_log_type_enabled(v213, v214))
          {
            v215 = (uint8_t *)swift_slowAlloc();
            v216 = swift_slowAlloc();
            v384 = v216;
            *(_DWORD *)v215 = 136315138;
            sub_22D879430(&qword_255D9A920, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
            v217 = sub_22D8B7314();
            v382 = sub_22D8755FC(v217, v218, &v384);
            v139 = v373;
            v138 = v379;
            sub_22D8B7044();
            swift_bridgeObjectRelease();
            v353(v212, v138);
            _os_log_impl(&dword_22D86F000, v213, v214, "simpleDateTimeResolution: exact match: %s", v215, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x22E31A4BC](v216, -1, -1);
            MEMORY[0x22E31A4BC](v215, -1, -1);
          }
          else
          {
            v353(v212, v138);
          }

          v219 = v335;
          v156 = v351;
          v220 = v323;
          v355(v323, v210, v138);
          v221 = v386;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v221 = sub_22D883C4C(0, *(_QWORD *)(v221 + 16) + 1, 1, v221);
          v223 = *(_QWORD *)(v221 + 16);
          v222 = *(_QWORD *)(v221 + 24);
          if (v223 >= v222 >> 1)
            v221 = sub_22D883C4C(v222 > 1, v223 + 1, 1, v221);
          *(_QWORD *)(v221 + 16) = v223 + 1;
          v211(&v349[v221 + v223 * (_QWORD)v331], v220, v138);
          v386 = v221;
          v224 = v353;
          v353(v210, v138);
          v224(v219, v138);
        }
      }
      v155 = v380;
      (*(void (**)(char *, uint64_t))(v342 + 8))(v156, v361);
LABEL_52:
      if ((v348 & 1) == 0)
        break;
      v225 = sub_22D8B6D68();
      v226 = sub_22D8B6FA8();
      if (os_log_type_enabled(v225, v226))
      {
        v227 = (uint8_t *)swift_slowAlloc();
        v228 = swift_slowAlloc();
        v384 = v228;
        *(_DWORD *)v227 = 136315138;
        swift_beginAccess();
        sub_22D879430(&qword_255D9A918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
        v229 = sub_22D8B7314();
        v382 = sub_22D8755FC(v229, v230, &v384);
        v138 = v379;
        sub_22D8B7044();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22D86F000, v225, v226, "simpleDateTimeResolution: using components for previousMatching: %s", v227, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E31A4BC](v228, -1, -1);
        MEMORY[0x22E31A4BC](v227, -1, -1);
      }

      swift_beginAccess();
      v156 = v367;
      v231 = v378;
      ((void (*)(char *, _QWORD, uint64_t))v359)(v367, v350, v378);
      v158 = (unint64_t)v370;
      LODWORD(v351) = *MEMORY[0x24BDCF070];
      v232 = v371;
      ((void (*)(char *))v358)(v370);
      v140 = v368;
      v145 = (void (*)(char *, uint64_t, uint64_t))v369;
      ((void (*)(char *, _QWORD, uint64_t))v365)(v368, v360, v369);
      v233 = (uint64_t)v339;
      sub_22D8B5CF4();
      ((void (*)(char *, void (*)(char *, uint64_t, uint64_t)))v362)(v140, v145);
      ((void (*)(unint64_t, uint64_t))v363)(v158, v232);
      ((void (*)(char *, uint64_t))v376)(v156, v231);
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v354)(v233, 1, v138) == 1)
      {
        sub_22D8740E0(v233, &qword_255D9A900);
        v139 = v373;
        v155 = v380;
      }
      else
      {
        v140 = v329;
        v145 = (void (*)(char *, uint64_t, uint64_t))v332;
        ((void (*)(char *, uint64_t, uint64_t))v332)(v329, v233, v138);
        v234 = v328;
        v355(v328, v140, v138);
        v235 = sub_22D8B6D68();
        v236 = sub_22D8B6FA8();
        if (os_log_type_enabled(v235, v236))
        {
          v237 = (uint8_t *)swift_slowAlloc();
          v238 = swift_slowAlloc();
          v384 = v238;
          v156 = (char *)v145;
          *(_DWORD *)v237 = 136315138;
          sub_22D879430(&qword_255D9A920, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
          v239 = sub_22D8B7314();
          v382 = sub_22D8755FC(v239, v240, &v384);
          v139 = v373;
          sub_22D8B7044();
          swift_bridgeObjectRelease();
          v353(v234, v379);
          _os_log_impl(&dword_22D86F000, v235, v236, "simpleDateTimeResolution: previousMatching: %s", v237, 0xCu);
          swift_arrayDestroy();
          v241 = v238;
          v138 = v379;
          MEMORY[0x22E31A4BC](v241, -1, -1);
          MEMORY[0x22E31A4BC](v237, -1, -1);

          v158 = (unint64_t)v330;
        }
        else
        {
          v353(v234, v138);

          v158 = (unint64_t)v330;
          v139 = v373;
        }
        v355((char *)v158, v140, v138);
        v157 = v386;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v155 = v380;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
LABEL_96:
          v157 = sub_22D883C4C(0, *(_QWORD *)(v157 + 16) + 1, 1, v157);
        v244 = *(_QWORD *)(v157 + 16);
        v243 = *(_QWORD *)(v157 + 24);
        if (v244 >= v243 >> 1)
          v157 = sub_22D883C4C(v243 > 1, v244 + 1, 1, v157);
        *(_QWORD *)(v157 + 16) = v244 + 1;
        v145(&v349[v157 + v244 * (_QWORD)v331], v158, v138);
        v386 = v157;
        v353(v140, v138);
      }
      if ((v366 & 1) != 0)
        break;
      v344(v345, (uint64_t)v374, v361);
      if (!__OFADD__(v317, 12))
      {
        sub_22D8B5AD8();
        v245 = sub_22D8B6D68();
        v246 = sub_22D8B6FA8();
        if (os_log_type_enabled(v245, v246))
        {
          v247 = (uint8_t *)swift_slowAlloc();
          v248 = swift_slowAlloc();
          v384 = v248;
          *(_DWORD *)v247 = 136315138;
          swift_beginAccess();
          sub_22D879430(&qword_255D9A918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
          v249 = sub_22D8B7314();
          v382 = sub_22D8755FC(v249, v250, &v384);
          sub_22D8B7044();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22D86F000, v245, v246, "simpleDateTimeResolution: using components for otherPrevious: %s", v247, 0xCu);
          swift_arrayDestroy();
          v251 = v248;
          v138 = v379;
          MEMORY[0x22E31A4BC](v251, -1, -1);
          MEMORY[0x22E31A4BC](v247, -1, -1);
        }

        v252 = v351;
        swift_beginAccess();
        v253 = v367;
        v254 = v378;
        ((void (*)(char *, _QWORD, uint64_t))v359)(v367, v350, v378);
        v255 = v370;
        v256 = v252;
        v257 = v371;
        ((void (*)(char *, uint64_t, uint64_t))v358)(v370, v256, v371);
        v258 = v368;
        v259 = v369;
        ((void (*)(char *, _QWORD, uint64_t))v365)(v368, v360, v369);
        v260 = (uint64_t)v324;
        sub_22D8B5CF4();
        ((void (*)(char *, uint64_t))v362)(v258, v259);
        v261 = v257;
        v262 = v260;
        ((void (*)(char *, uint64_t))v363)(v255, v261);
        ((void (*)(char *, uint64_t))v376)(v253, v254);
        if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v354)(v260, 1, v138) == 1)
        {
          sub_22D8740E0(v260, &qword_255D9A900);
          v263 = v361;
          v264 = v342;
          v155 = v380;
        }
        else
        {
          v265 = v319;
          ((void (*)(char *, uint64_t, uint64_t))v332)(v319, v262, v138);
          v266 = v318;
          v355(v318, v265, v138);
          v267 = sub_22D8B6D68();
          v268 = sub_22D8B6FA8();
          v269 = os_log_type_enabled(v267, v268);
          v263 = v361;
          v264 = v342;
          if (v269)
          {
            v270 = (uint8_t *)swift_slowAlloc();
            v271 = swift_slowAlloc();
            v384 = v271;
            *(_DWORD *)v270 = 136315138;
            v378 = (uint64_t)(v270 + 4);
            sub_22D879430(&qword_255D9A920, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
            v272 = sub_22D8B7314();
            v382 = sub_22D8755FC(v272, v273, &v384);
            v138 = v379;
            sub_22D8B7044();
            swift_bridgeObjectRelease();
            v353(v266, v138);
            _os_log_impl(&dword_22D86F000, v267, v268, "simpleDateTimeResolution: otherPreviousOffset: %s", v270, 0xCu);
            swift_arrayDestroy();
            v274 = v271;
            v155 = v380;
            MEMORY[0x22E31A4BC](v274, -1, -1);
            MEMORY[0x22E31A4BC](v270, -1, -1);

            v275 = v320;
          }
          else
          {
            v353(v266, v138);

            v275 = v320;
            v155 = v380;
          }
          v355(v275, v265, v138);
          v276 = v386;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v276 = sub_22D883C4C(0, *(_QWORD *)(v276 + 16) + 1, 1, v276);
          v278 = *(_QWORD *)(v276 + 16);
          v277 = *(_QWORD *)(v276 + 24);
          if (v278 >= v277 >> 1)
            v276 = sub_22D883C4C(v277 > 1, v278 + 1, 1, v276);
          *(_QWORD *)(v276 + 16) = v278 + 1;
          ((void (*)(char *, char *, uint64_t))v332)(&v349[v276 + v278 * (_QWORD)v331], v275, v138);
          v386 = v276;
          v353(v265, v138);
        }
        (*(void (**)(char *, uint64_t))(v264 + 8))(v345, v263);
        v139 = v373;
        break;
      }
      __break(1u);
LABEL_98:
      v158 = sub_22D883C4C(0, *(_QWORD *)(v158 + 16) + 1, 1, v158);
LABEL_36:
      v139 = v373;
      v203 = *(_QWORD *)(v158 + 16);
      v202 = *(_QWORD *)(v158 + 24);
      if (v203 >= v202 >> 1)
        v158 = sub_22D883C4C(v202 > 1, v203 + 1, 1, v158);
      *(_QWORD *)(v158 + 16) = v203 + 1;
      v145(&v349[v158 + v203 * (_QWORD)v331], (uint64_t)v155, v138);
      v386 = v158;
      v353(v343, v138);
      v178 = (uint64_t)v334;
    }
    swift_bridgeObjectRetain_n();
    v279 = sub_22D8B6D68();
    v280 = sub_22D8B6FA8();
    if (os_log_type_enabled(v279, v280))
    {
      v281 = (uint8_t *)swift_slowAlloc();
      v282 = swift_slowAlloc();
      v384 = v282;
      *(_DWORD *)v281 = 136315138;
      v283 = swift_bridgeObjectRetain();
      v284 = MEMORY[0x22E319A90](v283, v138);
      v286 = v285;
      swift_bridgeObjectRelease();
      v382 = sub_22D8755FC(v284, v286, &v384);
      v139 = v373;
      sub_22D8B7044();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D86F000, v279, v280, "simpleDateTimeResolution: Found matches for inferred time: %s", v281, 0xCu);
      swift_arrayDestroy();
      v287 = v282;
      v155 = v380;
      MEMORY[0x22E31A4BC](v287, -1, -1);
      MEMORY[0x22E31A4BC](v281, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v288 = v361;
    v289 = v352;
    v290 = swift_beginAccess();
    v291 = v386;
    MEMORY[0x24BDAC7A8](v290);
    *(&v317 - 2) = (uint64_t)v155;
    v382 = v291;
    swift_bridgeObjectRetain_n();
    sub_22D887B68((uint64_t (*)(char *, char *))sub_22D889210, (uint64_t)(&v317 - 4));
    swift_bridgeObjectRelease();
    v292 = v382;
    swift_bridgeObjectRelease();
    v293 = v379;
    if (*(_QWORD *)(v292 + 16))
    {
      v355((char *)v289, &v349[v292], v379);
      v294 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v139[7];
      v294(v289, 0, 1, v293);
    }
    else
    {
      v294 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v139[7];
      v294(v289, 1, 1, v379);
    }
    swift_release();
    v295 = v346;
    sub_22D8782E4(v289, v346);
    v296 = sub_22D8B6D68();
    v297 = sub_22D8B6FA8();
    if (os_log_type_enabled(v296, v297))
    {
      v298 = (uint8_t *)swift_slowAlloc();
      v299 = swift_slowAlloc();
      v382 = v299;
      *(_DWORD *)v298 = 136315138;
      sub_22D8782E4(v295, v336);
      v300 = sub_22D8B6E28();
      v383 = sub_22D8755FC(v300, v301, &v382);
      v293 = v379;
      sub_22D8B7044();
      swift_bridgeObjectRelease();
      v289 = v352;
      sub_22D8740E0(v295, &qword_255D9A900);
      _os_log_impl(&dword_22D86F000, v296, v297, "simpleDateTimeResolution: Selecting date for inference: %s", v298, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v299, -1, -1);
      MEMORY[0x22E31A4BC](v298, -1, -1);
    }
    else
    {
      sub_22D8740E0(v295, &qword_255D9A900);
    }

    v302 = v377;
    v303 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v354;
    v304 = v347;
    sub_22D8782E4(v289, v347);
    if (v303(v304, 1, v293) == 1)
    {
      sub_22D8740E0(v304, &qword_255D9A900);
      v305 = sub_22D8B6D68();
      v306 = sub_22D8B6FA8();
      if (os_log_type_enabled(v305, v306))
      {
        v307 = (uint8_t *)swift_slowAlloc();
        v308 = swift_slowAlloc();
        v383 = v308;
        *(_DWORD *)v307 = 136315138;
        v309 = v374;
        swift_beginAccess();
        sub_22D879430(&qword_255D9A918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
        v310 = sub_22D8B7314();
        v381 = sub_22D8755FC(v310, v311, &v383);
        v293 = v379;
        sub_22D8B7044();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22D86F000, v305, v306, "simpleDateTimeResolution: No matches found for %s", v307, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E31A4BC](v308, -1, -1);
        MEMORY[0x22E31A4BC](v307, -1, -1);

        sub_22D8740E0(v352, &qword_255D9A900);
        v353(v341, v293);
        sub_22D8740E0((uint64_t)v364, &qword_255D9A900);
        (*(void (**)(char *, uint64_t))(v356 + 8))(v377, v357);
      }
      else
      {

        sub_22D8740E0(v289, &qword_255D9A900);
        v353(v341, v293);
        sub_22D8740E0((uint64_t)v364, &qword_255D9A900);
        (*(void (**)(char *, uint64_t))(v356 + 8))(v377, v357);
        v309 = v374;
      }
      v294(v372, 1, 1, v293);
      v315 = *(uint64_t (**)(char *, uint64_t))(v342 + 8);
      v316 = v309;
    }
    else
    {
      sub_22D8740E0(v289, &qword_255D9A900);
      v353(v341, v293);
      sub_22D8740E0((uint64_t)v364, &qword_255D9A900);
      (*(void (**)(char *, uint64_t))(v356 + 8))(v302, v357);
      v312 = v338;
      v313 = (void (*)(uint64_t, char *, uint64_t))v332;
      ((void (*)(char *, uint64_t, uint64_t))v332)(v338, v304, v293);
      v314 = v372;
      v313(v372, v312, v293);
      v294(v314, 0, 1, v293);
      v315 = *(uint64_t (**)(char *, uint64_t))(v342 + 8);
      v316 = v374;
    }
    return v315(v316, v288);
  }
}

uint64_t sub_22D887B68(uint64_t (*a1)(char *, char *), uint64_t a2)
{
  _QWORD **v2;
  _QWORD *v5;
  uint64_t result;

  sub_22D8B5BF8();
  v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = (_QWORD *)sub_22D8891FC(v5);
  result = sub_22D887C00(a1, a2);
  *v2 = v5;
  return result;
}

uint64_t sub_22D887C00(uint64_t (*a1)(char *, char *), uint64_t a2)
{
  uint64_t *v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  char *v42;
  _QWORD *v43;
  uint64_t v44;
  char *v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  BOOL v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  BOOL v91;
  uint64_t v92;
  char v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  BOOL v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char *v110;
  char *v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  unint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  void (*v123)(char *, uint64_t, uint64_t);
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  char v128;
  char v129;
  void (*v130)(char *, uint64_t);
  uint64_t v131;
  char *v132;
  void (*v133)(char *, uint64_t, uint64_t);
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  unint64_t v139;
  void (*v140)(char *, uint64_t);
  void (*v141)(char *, uint64_t);
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char *v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  char *v149;
  char *v150;
  char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  char *v156;
  char *v157;
  uint64_t v158;
  uint64_t v159;
  char *v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t *v164;
  uint64_t (*v165)(char *, char *);
  uint64_t v166;
  _QWORD *v167;

  v165 = a1;
  v166 = a2;
  v3 = sub_22D8B5BF8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v157 = (char *)&v142 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v160 = (char *)&v142 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v142 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v142 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v142 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v142 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v142 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v142 - v24;
  v164 = v2;
  v26 = v2[1];
  result = sub_22D8B7308();
  if (result >= v26)
  {
    if (v26 < 0)
      goto LABEL_146;
    if (v26)
      return sub_22D888794(0, v26, 1, v165, v166);
  }
  else
  {
    v146 = result;
    if (v26 >= 0)
      v28 = v26;
    else
      v28 = v26 + 1;
    if (v26 > -2)
    {
      v167 = (_QWORD *)v4;
      v147 = v25;
      if (v26 < 2)
      {
        v31 = (_QWORD *)v4;
        v33 = MEMORY[0x24BEE4AF8];
        v161 = MEMORY[0x24BEE4AF8]
             + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
        if (v26 != 1)
        {
          v66 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
          v35 = (char *)MEMORY[0x24BEE4AF8];
          v36 = v162;
          goto LABEL_110;
        }
        v145 = v23;
        v150 = v20;
        v151 = v17;
        v155 = v14;
        v156 = v11;
        v148 = MEMORY[0x24BEE4AF8];
      }
      else
      {
        v145 = v23;
        v150 = v20;
        v151 = v17;
        v155 = v14;
        v156 = v11;
        v29 = v28 >> 1;
        v30 = sub_22D8B6EE8();
        v31 = (_QWORD *)v4;
        *(_QWORD *)(v30 + 16) = v29;
        v32 = *(unsigned __int8 *)(v4 + 80);
        v148 = v30;
        v161 = v30 + ((v32 + 32) & ~v32);
      }
      v34 = 0;
      v35 = (char *)MEMORY[0x24BEE4AF8];
      v163 = v3;
      v36 = v162;
      while (1)
      {
        v37 = v34;
        if (v34 + 1 >= v26)
        {
          v47 = v34 + 1;
        }
        else
        {
          v158 = v26;
          v38 = *v164;
          v39 = v31[9];
          v154 = v34 + 1;
          v40 = (void (*)(char *, uint64_t, uint64_t))v31[2];
          v41 = v34;
          v42 = v147;
          v43 = v31;
          v40(v147, v38 + v39 * (v34 + 1), v3);
          v152 = v38;
          v159 = v39;
          v44 = v38 + v39 * v41;
          v45 = v145;
          v40(v145, v44, v3);
          LODWORD(v162) = v165(v42, v45);
          if (v36)
          {
            v141 = (void (*)(char *, uint64_t))v43[1];
            v141(v45, v3);
            v141(v42, v3);
            goto LABEL_124;
          }
          v149 = v35;
          v46 = (void (*)(char *, uint64_t))v43[1];
          v46(v45, v3);
          v46(v42, v3);
          v47 = v41 + 2;
          v26 = v158;
          v37 = v41;
          if (v41 + 2 < v158)
          {
            v144 = v41;
            v48 = v152;
            v153 = v159 * v47;
            v154 *= v159;
            while (1)
            {
              v49 = v47;
              v50 = v150;
              v40(v150, v48 + v153, v3);
              v51 = v151;
              v40(v151, v48 + v154, v3);
              v52 = v3;
              v53 = v165(v50, v51);
              v46(v51, v52);
              v46(v50, v52);
              if (((v162 ^ v53) & 1) != 0)
                break;
              v47 = v49 + 1;
              v26 = v158;
              v48 += v159;
              v3 = v163;
              if (v158 == v49 + 1)
              {
                v47 = v158;
                v37 = v144;
                goto LABEL_23;
              }
            }
            v3 = v163;
            v47 = v49;
            v37 = v144;
            v26 = v158;
          }
LABEL_23:
          v35 = v149;
          v31 = v167;
          if ((v162 & 1) != 0)
          {
            if (v47 < v37)
              goto LABEL_150;
            if (v37 < v47)
            {
              v54 = 0;
              v55 = v159 * (v47 - 1);
              v56 = v47 * v159;
              v57 = v37;
              v144 = v37;
              v58 = v37 * v159;
              do
              {
                if (v57 != v47 + v54 - 1)
                {
                  v162 = v36;
                  v60 = v152;
                  if (!v152)
                    goto LABEL_153;
                  v61 = v47;
                  v62 = v152 + v58;
                  v154 = v152 + v55;
                  v153 = v31[4];
                  ((void (*)(char *, uint64_t, uint64_t))v153)(v157, v152 + v58, v163);
                  if (v58 < v55 || v62 >= v60 + v56)
                  {
                    v59 = v154;
                    v3 = v163;
                    swift_arrayInitWithTakeFrontToBack();
                  }
                  else
                  {
                    v3 = v163;
                    v59 = v154;
                    if (v58 != v55)
                      swift_arrayInitWithTakeBackToFront();
                  }
                  ((void (*)(uint64_t, char *, uint64_t))v153)(v59, v157, v3);
                  v31 = v167;
                  v36 = v162;
                  v47 = v61;
                }
                ++v57;
                --v54;
                v55 -= v159;
                v56 -= v159;
                v58 += v159;
              }
              while (v57 < v47 + v54);
              v35 = v149;
              v37 = v144;
              v26 = v158;
            }
          }
        }
        if (v47 >= v26)
          goto LABEL_46;
        if (__OFSUB__(v47, v37))
          goto LABEL_147;
        if (v47 - v37 >= v146)
        {
LABEL_46:
          if (v47 < v37)
            goto LABEL_145;
          goto LABEL_47;
        }
        if (__OFADD__(v37, v146))
          goto LABEL_148;
        v63 = v37 + v146 >= v26 ? v26 : v37 + v146;
        if (v63 < v37)
          break;
        if (v47 == v63)
          goto LABEL_46;
        v162 = v36;
        v149 = v35;
        v116 = (char *)v31[2];
        v152 = v31[9];
        v153 = (uint64_t)v116;
        v117 = v152 * (v47 - 1);
        v118 = v47 * v152;
        v144 = v37;
        v143 = v63;
        do
        {
          v158 = v47;
          v119 = 0;
          v154 = v118;
          while (1)
          {
            v159 = v37;
            v120 = *v164;
            v121 = v118 + v119 + *v164;
            v122 = v155;
            v123 = (void (*)(char *, uint64_t, uint64_t))v153;
            ((void (*)(char *, uint64_t, uint64_t))v153)(v155, v121, v3);
            v124 = v117;
            v125 = v117 + v119 + v120;
            v126 = v156;
            v123(v156, v125, v3);
            v127 = v162;
            v128 = v165(v122, v126);
            v162 = v127;
            if (v127)
            {
              v140 = (void (*)(char *, uint64_t))v167[1];
              v140(v126, v3);
              v140(v122, v3);
              swift_bridgeObjectRelease();
              goto LABEL_125;
            }
            v129 = v128;
            v130 = (void (*)(char *, uint64_t))v167[1];
            v130(v126, v3);
            v130(v122, v3);
            if ((v129 & 1) == 0)
              break;
            v131 = *v164;
            if (!*v164)
              goto LABEL_152;
            v117 = v124;
            v118 = v154;
            v132 = (char *)(v131 + v124 + v119);
            v133 = (void (*)(char *, uint64_t, uint64_t))v167[4];
            v133(v160, v131 + v154 + v119, v163);
            swift_arrayInitWithTakeFrontToBack();
            v3 = v163;
            v133(v132, (uint64_t)v160, v163);
            v119 -= v152;
            v37 = v159 + 1;
            if (v158 == v159 + 1)
              goto LABEL_104;
          }
          v117 = v124;
          v118 = v154;
LABEL_104:
          v47 = v158 + 1;
          v117 += v152;
          v118 += v152;
          v37 = v144;
        }
        while (v158 + 1 != v143);
        v47 = v143;
        v35 = v149;
        v36 = v162;
        if (v143 < v144)
          goto LABEL_145;
LABEL_47:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v35 = sub_22D888FE4(0, *((_QWORD *)v35 + 2) + 1, 1, v35);
        v65 = *((_QWORD *)v35 + 2);
        v64 = *((_QWORD *)v35 + 3);
        v66 = v65 + 1;
        v158 = v47;
        if (v65 >= v64 >> 1)
          v35 = sub_22D888FE4((char *)(v64 > 1), v65 + 1, 1, v35);
        *((_QWORD *)v35 + 2) = v66;
        v67 = v35 + 32;
        v68 = &v35[16 * v65 + 32];
        v69 = v158;
        *(_QWORD *)v68 = v37;
        *((_QWORD *)v68 + 1) = v69;
        if (v65)
        {
LABEL_52:
          v70 = v66 - 1;
          if (v66 >= 4)
          {
            v75 = &v67[16 * v66];
            v76 = *((_QWORD *)v75 - 8);
            v77 = *((_QWORD *)v75 - 7);
            v81 = __OFSUB__(v77, v76);
            v78 = v77 - v76;
            if (v81)
              goto LABEL_130;
            v80 = *((_QWORD *)v75 - 6);
            v79 = *((_QWORD *)v75 - 5);
            v81 = __OFSUB__(v79, v80);
            v73 = v79 - v80;
            v74 = v81;
            if (v81)
              goto LABEL_131;
            v82 = v66 - 2;
            v83 = &v67[16 * v66 - 32];
            v85 = *(_QWORD *)v83;
            v84 = *((_QWORD *)v83 + 1);
            v81 = __OFSUB__(v84, v85);
            v86 = v84 - v85;
            if (v81)
              goto LABEL_133;
            v81 = __OFADD__(v73, v86);
            v87 = v73 + v86;
            if (v81)
              goto LABEL_136;
            if (v87 >= v78)
            {
              v105 = &v67[16 * v70];
              v107 = *(_QWORD *)v105;
              v106 = *((_QWORD *)v105 + 1);
              v81 = __OFSUB__(v106, v107);
              v108 = v106 - v107;
              if (v81)
                goto LABEL_140;
              v98 = v73 < v108;
            }
            else
            {
LABEL_65:
              if ((v74 & 1) != 0)
                goto LABEL_132;
              v82 = v66 - 2;
              v88 = &v67[16 * v66 - 32];
              v90 = *(_QWORD *)v88;
              v89 = *((_QWORD *)v88 + 1);
              v91 = __OFSUB__(v89, v90);
              v92 = v89 - v90;
              v93 = v91;
              if (v91)
                goto LABEL_135;
              v94 = &v67[16 * v70];
              v96 = *(_QWORD *)v94;
              v95 = *((_QWORD *)v94 + 1);
              v81 = __OFSUB__(v95, v96);
              v97 = v95 - v96;
              if (v81)
                goto LABEL_138;
              if (__OFADD__(v92, v97))
                goto LABEL_139;
              if (v92 + v97 < v73)
                goto LABEL_77;
              v98 = v73 < v97;
            }
            if (v98)
              v70 = v82;
          }
          else
          {
            if (v66 == 3)
            {
              v72 = *((_QWORD *)v35 + 4);
              v71 = *((_QWORD *)v35 + 5);
              v81 = __OFSUB__(v71, v72);
              v73 = v71 - v72;
              v74 = v81;
              goto LABEL_65;
            }
            v99 = *((_QWORD *)v35 + 4);
            v100 = *((_QWORD *)v35 + 5);
            v81 = __OFSUB__(v100, v99);
            v92 = v100 - v99;
            v93 = v81;
LABEL_77:
            if ((v93 & 1) != 0)
              goto LABEL_134;
            v101 = &v67[16 * v70];
            v103 = *(_QWORD *)v101;
            v102 = *((_QWORD *)v101 + 1);
            v81 = __OFSUB__(v102, v103);
            v104 = v102 - v103;
            if (v81)
              goto LABEL_137;
            if (v104 < v92)
              goto LABEL_94;
          }
          v109 = v70 - 1;
          if (v70 - 1 >= v66)
          {
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
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
            break;
          }
          if (!*v164)
            goto LABEL_151;
          v110 = v35;
          v111 = &v67[16 * v109];
          v112 = *(_QWORD *)v111;
          v113 = &v67[16 * v70];
          v114 = *((_QWORD *)v113 + 1);
          sub_22D888A40(*v164 + v167[9] * *(_QWORD *)v111, *v164 + v167[9] * *(_QWORD *)v113, *v164 + v167[9] * v114, v161, (uint64_t (*)(_QWORD, _QWORD))v165, v166);
          if (v36)
            goto LABEL_124;
          if (v114 < v112)
            goto LABEL_127;
          if (v70 > *((_QWORD *)v110 + 2))
            goto LABEL_128;
          *(_QWORD *)v111 = v112;
          *(_QWORD *)&v67[16 * v109 + 8] = v114;
          v115 = *((_QWORD *)v110 + 2);
          if (v70 >= v115)
            goto LABEL_129;
          v35 = v110;
          v66 = v115 - 1;
          memmove(&v67[16 * v70], v113 + 16, 16 * (v115 - 1 - v70));
          *((_QWORD *)v35 + 2) = v115 - 1;
          if (v115 <= 2)
            goto LABEL_94;
          goto LABEL_52;
        }
        v66 = 1;
LABEL_94:
        v3 = v163;
        v26 = v164[1];
        v34 = v158;
        v31 = v167;
        if (v158 >= v26)
        {
          v33 = v148;
LABEL_110:
          v148 = v33;
          if (v66 >= 2)
          {
            v134 = *v164;
            do
            {
              v135 = v66 - 2;
              if (v66 < 2)
                goto LABEL_141;
              if (!v134)
                goto LABEL_154;
              v136 = *(_QWORD *)&v35[16 * v135 + 32];
              v137 = *(_QWORD *)&v35[16 * v66 + 24];
              sub_22D888A40(v134 + v167[9] * v136, v134 + v167[9] * *(_QWORD *)&v35[16 * v66 + 16], v134 + v167[9] * v137, v161, (uint64_t (*)(_QWORD, _QWORD))v165, v166);
              if (v36)
                break;
              if (v137 < v136)
                goto LABEL_142;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v35 = sub_22D8891E8((uint64_t)v35);
              if (v135 >= *((_QWORD *)v35 + 2))
                goto LABEL_143;
              v138 = &v35[16 * v135 + 32];
              *(_QWORD *)v138 = v136;
              *((_QWORD *)v138 + 1) = v137;
              v139 = *((_QWORD *)v35 + 2);
              if (v66 > v139)
                goto LABEL_144;
              memmove(&v35[16 * v66 + 16], &v35[16 * v66 + 32], 16 * (v139 - v66));
              *((_QWORD *)v35 + 2) = v139 - 1;
              v66 = v139 - 1;
            }
            while (v139 > 2);
          }
LABEL_124:
          swift_bridgeObjectRelease();
LABEL_125:
          *(_QWORD *)(v148 + 16) = 0;
          return swift_bridgeObjectRelease();
        }
      }
      __break(1u);
LABEL_150:
      __break(1u);
LABEL_151:
      __break(1u);
LABEL_152:
      __break(1u);
LABEL_153:
      __break(1u);
LABEL_154:
      __break(1u);
    }
    result = sub_22D8B71AC();
    __break(1u);
  }
  return result;
}

uint64_t sub_22D888794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(char *, char *), uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t, uint64_t);
  char v28;
  char v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t);
  char *v41;
  uint64_t v42;
  uint64_t (*v43)(char *, char *);
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v43 = a4;
  v44 = a5;
  v8 = sub_22D8B5BF8();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v46 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v41 = (char *)&v35 - v12;
  result = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v35 - v14;
  v37 = a2;
  if (a3 != a2)
  {
    v17 = *(_QWORD *)(v15 + 72);
    v47 = v15;
    v18 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    v39 = v17;
    v40 = v18;
    v49 = v17 * a3;
    v50 = v17 * (a3 - 1);
    v19 = v41;
    v36 = a1;
    v38 = (char *)&v35 - v14;
    while (2)
    {
      v20 = 0;
      v21 = a1;
      v22 = v51;
      v42 = a3;
      while (1)
      {
        v45 = v21;
        v24 = *v48;
        v25 = v8;
        v26 = v8;
        v27 = v40;
        v40(v16, v49 + v20 + *v48, v25);
        v27(v19, v50 + v20 + v24, v26);
        v28 = v43(v16, v19);
        v51 = v22;
        if (v22)
        {
          v34 = *(void (**)(char *, uint64_t))(v47 + 8);
          v34(v19, v26);
          return ((uint64_t (*)(char *, uint64_t))v34)(v16, v26);
        }
        v29 = v28;
        v30 = *(void (**)(char *, uint64_t))(v47 + 8);
        v30(v19, v26);
        result = ((uint64_t (*)(char *, uint64_t))v30)(v16, v26);
        v8 = v26;
        if ((v29 & 1) == 0)
          break;
        v22 = v51;
        v31 = *v48;
        if (!*v48)
        {
          __break(1u);
          return result;
        }
        v32 = v31 + v50 + v20;
        v33 = *(void (**)(char *, uint64_t, uint64_t))(v47 + 32);
        v33(v46, v31 + v49 + v20, v26);
        swift_arrayInitWithTakeFrontToBack();
        result = ((uint64_t (*)(uint64_t, char *, uint64_t))v33)(v32, v46, v26);
        v16 = v38;
        v20 -= v39;
        v21 = v45 + 1;
        v19 = v41;
        v23 = v42;
        if (v42 == v45 + 1)
          goto LABEL_10;
      }
      v23 = v42;
      v16 = v38;
      v22 = v51;
LABEL_10:
      v51 = v22;
      a3 = v23 + 1;
      v50 += v39;
      v49 += v39;
      a1 = v36;
      if (a3 != v37)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_22D888A40(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t (*a5)(_QWORD, _QWORD), uint64_t a6)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v31;
  void (*v32)(char *, unint64_t, uint64_t);
  char v33;
  char v34;
  void (*v35)(char *, uint64_t);
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v41;
  void (*v42)(_QWORD, unint64_t, uint64_t);
  unint64_t v43;
  void (*v44)(_QWORD, unint64_t, uint64_t);
  uint64_t v45;
  unint64_t v46;
  void (*v47)(_QWORD, _QWORD, _QWORD);
  char v48;
  char v49;
  uint64_t v50;
  unint64_t v51;
  void (*v52)(_QWORD, _QWORD);
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  void (*v56)(char *, uint64_t);
  void (*v57)(_QWORD, _QWORD);
  uint64_t result;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  void (*v62)(_QWORD, unint64_t, uint64_t);
  uint64_t v63;
  void (*v64)(_QWORD, _QWORD, _QWORD);
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(_QWORD, _QWORD);
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;

  v7 = v6;
  v68 = a6;
  v69 = a5;
  v12 = sub_22D8B5BF8();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v59 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v21 = (char *)&v59 - v20;
  v70 = v22;
  v23 = *(_QWORD *)(v22 + 72);
  if (!v23)
  {
    __break(1u);
LABEL_68:
    __break(1u);
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  if (a2 - a1 == 0x8000000000000000 && v23 == -1)
    goto LABEL_68;
  v24 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v23 == -1)
    goto LABEL_69;
  v25 = (uint64_t)(a2 - a1) / v23;
  v73 = a1;
  v72 = a4;
  v26 = v24 / v23;
  if (v25 >= v24 / v23)
  {
    if ((v26 & 0x8000000000000000) == 0)
    {
      v28 = a3;
      v29 = v26 * v23;
      v63 = v19;
      v64 = v18;
      if (a4 < a2 || a2 + v29 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v39 = a4 + v29;
      v71 = a4 + v29;
      v73 = a2;
      if (v29 >= 1 && a1 < a2)
      {
        v41 = -v23;
        v42 = *(void (**)(_QWORD, unint64_t, uint64_t))(v70 + 16);
        v61 = a1;
        v62 = v42;
        v59 = v41;
        v60 = a4;
        v65 = v12;
        while (1)
        {
          v43 = v7;
          v44 = v62;
          v45 = v63;
          v62(v63, v39 + v41, v12);
          v66 = a2;
          v46 = a2 + v41;
          v47 = v64;
          v44(v64, a2 + v41, v12);
          v48 = v69(v45, v47);
          v67 = v43;
          if (v43)
            break;
          v49 = v48;
          v50 = v12;
          v51 = v28 + v41;
          v52 = *(void (**)(_QWORD, _QWORD))(v70 + 8);
          v52(v47, v50);
          v52(v45, v50);
          if ((v49 & 1) != 0)
          {
            if (v28 < v66 || v28 + v41 >= v66)
            {
              v51 = v28 + v41;
              swift_arrayInitWithTakeFrontToBack();
              v7 = v67;
            }
            else
            {
              v7 = v67;
              v51 = v28 + v41;
              if (v28 != v66)
                swift_arrayInitWithTakeBackToFront();
            }
            v41 = v59;
            v54 = v60;
            v73 += v59;
            v55 = v61;
          }
          else
          {
            v53 = v71;
            v71 += v41;
            if (v28 < v53 || v51 >= v53)
            {
              swift_arrayInitWithTakeFrontToBack();
              v46 = v66;
              v7 = v67;
            }
            else
            {
              v7 = v67;
              if (v28 != v53)
                swift_arrayInitWithTakeBackToFront();
              v46 = v66;
            }
            v54 = v60;
            v55 = v61;
            v41 = v59;
          }
          v39 = v71;
          if (v71 > v54)
          {
            a2 = v46;
            v28 = v51;
            v12 = v65;
            if (v46 > v55)
              continue;
          }
          goto LABEL_66;
        }
        v57 = *(void (**)(_QWORD, _QWORD))(v70 + 8);
        v57(v47, v12);
        v57(v45, v12);
      }
      goto LABEL_66;
    }
  }
  else
  {
    v67 = a3;
    if ((v25 & 0x8000000000000000) == 0)
    {
      v27 = v25 * v23;
      if (a4 < a1 || a1 + v27 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a1)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v66 = a4 + v27;
      v71 = a4 + v27;
      if (v27 >= 1 && a2 < v67)
      {
        v64 = *(void (**)(_QWORD, _QWORD, _QWORD))(v70 + 16);
        while (1)
        {
          v31 = v23;
          v32 = (void (*)(char *, unint64_t, uint64_t))v64;
          v64(v21, a2, v12);
          v32(v17, a4, v12);
          v33 = v69(v21, v17);
          if (v6)
            break;
          v34 = v33;
          v35 = *(void (**)(char *, uint64_t))(v70 + 8);
          v35(v17, v12);
          v35(v21, v12);
          v36 = v73;
          if ((v34 & 1) != 0)
          {
            v23 = v31;
            v37 = a2 + v31;
            if (v73 < a2 || v73 >= v37)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v73 == a2)
            {
              v36 = a2;
            }
            else
            {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          else
          {
            v23 = v31;
            v38 = v72 + v31;
            if (v73 < v72 || v73 >= v38)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v73 != v72)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v72 = v38;
            v37 = a2;
          }
          v73 = v36 + v23;
          a4 = v72;
          if (v72 < v66)
          {
            a2 = v37;
            if (v37 < v67)
              continue;
          }
          goto LABEL_66;
        }
        v56 = *(void (**)(char *, uint64_t))(v70 + 8);
        v56(v17, v12);
        v56(v21, v12);
      }
LABEL_66:
      sub_22D8890DC(&v73, &v72, (uint64_t *)&v71);
      return 1;
    }
  }
LABEL_70:
  result = sub_22D8B71F4();
  __break(1u);
  return result;
}

char *sub_22D888FE4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A928);
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

uint64_t sub_22D8890DC(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = sub_22D8B5BF8();
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = sub_22D8B71F4();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_22D8891E8(uint64_t a1)
{
  return sub_22D888FE4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_22D8891FC(_QWORD *a1)
{
  return sub_22D88F1C0(0, a1[2], 0, a1);
}

BOOL sub_22D889210()
{
  double v0;
  double v1;
  double v2;

  sub_22D8B5BD4();
  v1 = fabs(v0);
  sub_22D8B5BD4();
  return v1 < fabs(v2);
}

ValueMetadata *type metadata accessor for DateTimeInferenceUtils()
{
  return &type metadata for DateTimeInferenceUtils;
}

unint64_t sub_22D889284(uint64_t a1)
{
  return sub_22D8892A8(a1, &qword_255D9A9C8, &qword_255D9A9D0, (uint64_t (*)(char *))sub_22D8AF1A4, (uint64_t (*)(_QWORD))MEMORY[0x24BE94110]);
}

unint64_t sub_22D8892A8(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(char *), uint64_t (*a5)(_QWORD))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t result;
  char v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD v29[2];
  uint64_t (*v30)(_QWORD);
  uint64_t (*v31)(char *);

  v30 = a5;
  v31 = a4;
  v8 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v12 = sub_22D8B71E8();
  v13 = (_QWORD *)v12;
  v14 = *(_QWORD *)(a1 + 16);
  if (!v14)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v13;
  }
  v15 = *(int *)(v8 + 48);
  v16 = a1;
  v17 = v12 + 64;
  v18 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v29[1] = v16;
  v19 = v16 + v18;
  v20 = *(_QWORD *)(v9 + 72);
  swift_retain();
  while (1)
  {
    sub_22D88AE10(v19, (uint64_t)v11, a2);
    result = v31(v11);
    if ((v22 & 1) != 0)
      break;
    v23 = result;
    *(_QWORD *)(v17 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v24 = v13[6];
    v25 = v30(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v24 + *(_QWORD *)(*(_QWORD *)(v25 - 8) + 72) * v23, v11, v25);
    *(_QWORD *)(v13[7] + 8 * v23) = *(_QWORD *)&v11[v15];
    v26 = v13[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
      goto LABEL_11;
    v13[2] = v28;
    v19 += v20;
    if (!--v14)
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

unint64_t sub_22D889444(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A9B8);
  v2 = sub_22D8B71E8();
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
    sub_22D88AE10(v6, (uint64_t)&v15, &qword_255D9A9C0);
    v7 = v15;
    v8 = v16;
    result = sub_22D8AF240(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_22D87D920(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_22D889578(uint64_t a1)
{
  return sub_22D8892A8(a1, &qword_255D9A9A8, &qword_255D9A9B0, (uint64_t (*)(char *))sub_22D8AF2A4, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t sub_22D88959C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9A950);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9A950);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

SiriTimeInternal::ButtonOption_optional __swiftcall ButtonOption.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  SiriTimeInternal::ButtonOption_optional v2;

  v1 = sub_22D8B7200();
  swift_bridgeObjectRelease();
  if (v1 == 1)
    v2.value = SiriTimeInternal_ButtonOption_cancel;
  else
    v2.value = SiriTimeInternal_ButtonOption_unknownDefault;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t ButtonOption.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6C65636E6163;
  else
    return 7562617;
}

uint64_t sub_22D8896A8(char *a1, char *a2)
{
  return sub_22D8A1948(*a1, *a2);
}

uint64_t sub_22D8896B4()
{
  return sub_22D8A1EE8();
}

uint64_t sub_22D8896BC()
{
  return sub_22D8A24F8();
}

uint64_t sub_22D8896C4()
{
  return sub_22D8A2814();
}

uint64_t sub_22D8896CC@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_22D8B7200();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_22D889728@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = ButtonOption.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t static DirectInvocationUtils.siriKitConfirmationResponse(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  unsigned int *v21;
  char v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;

  v2 = sub_22D8B6180();
  v4 = v3;
  v5 = (void *)sub_22D8B5E74();
  v6 = objc_msgSend(v5, sel_identifier);

  v7 = sub_22D8B6E10();
  v9 = v8;

  if (v2 == v7 && v4 == v9)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  v11 = sub_22D8B73F8();
  swift_bridgeObjectRelease();
  if ((v11 & 1) != 0)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    if (qword_255D9A320 != -1)
      swift_once();
    v17 = sub_22D8B6D80();
    __swift_project_value_buffer(v17, (uint64_t)qword_255D9A950);
    v18 = sub_22D8B6D68();
    v19 = sub_22D8B6FC0();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_22D86F000, v18, v19, "User selected SiriKit confirm action", v20, 2u);
      MEMORY[0x22E31A4BC](v20, -1, -1);
    }

    v21 = (unsigned int *)MEMORY[0x24BE98400];
    goto LABEL_22;
  }
  v12 = (void *)sub_22D8B5E68();
  v13 = objc_msgSend(v12, sel_identifier);

  v14 = sub_22D8B6E10();
  v16 = v15;

  if (v2 != v14 || v4 != v16)
  {
    v22 = sub_22D8B73F8();
    swift_bridgeObjectRelease();
    if ((v22 & 1) != 0)
      goto LABEL_16;
    v35 = (void *)sub_22D8B5E5C();
    v36 = objc_msgSend(v35, sel_identifier);

    v37 = sub_22D8B6E10();
    v39 = v38;

    if (v2 != v37 || v4 != v39)
    {
      v40 = sub_22D8B73F8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v40 & 1) == 0)
      {
        v33 = sub_22D8B6078();
        v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56);
        v31 = a1;
        v32 = 1;
        return v30(v31, v32, 1, v33);
      }
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
LABEL_16:
  swift_bridgeObjectRelease();
LABEL_17:
  if (qword_255D9A320 != -1)
    swift_once();
  v23 = sub_22D8B6D80();
  __swift_project_value_buffer(v23, (uint64_t)qword_255D9A950);
  v24 = sub_22D8B6D68();
  v25 = sub_22D8B6FC0();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_22D86F000, v24, v25, "User selected SiriKit cancel/reject action", v26, 2u);
    MEMORY[0x22E31A4BC](v26, -1, -1);
  }

  v21 = (unsigned int *)MEMORY[0x24BE983F8];
LABEL_22:
  v27 = *v21;
  v28 = sub_22D8B6078();
  v29 = *(_QWORD *)(v28 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v29 + 104))(a1, v27, v28);
  v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56);
  v31 = a1;
  v32 = 0;
  v33 = v28;
  return v30(v31, v32, 1, v33);
}

SiriTimeInternal::DirectInvocationUtils::Timer::URI_optional __swiftcall DirectInvocationUtils.Timer.URI.init(rawValue:)(Swift::String rawValue)
{
  return (SiriTimeInternal::DirectInvocationUtils::Timer::URI_optional)sub_22D88A6C8();
}

uint64_t DirectInvocationUtils.Timer.URI.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D889B28 + 4 * byte_22D8B7E70[a1]))(0xD000000000000031, 0x800000022D8BD400);
}

uint64_t sub_22D889B28()
{
  uint64_t v0;

  return v0 + 10;
}

void sub_22D889B88(char *a1)
{
  sub_22D8A12D8(*a1);
}

void sub_22D889B94()
{
  char *v0;

  sub_22D8A1F5C(*v0);
}

void sub_22D889B9C(uint64_t a1)
{
  char *v1;

  sub_22D8A21F0(a1, *v1);
}

void sub_22D889BA4(uint64_t a1)
{
  char *v1;

  sub_22D8A29C0(a1, *v1);
}

uint64_t sub_22D889BAC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22D88A6C8();
  *a1 = result;
  return result;
}

uint64_t sub_22D889BE0@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = DirectInvocationUtils.Timer.URI.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

SiriTimeInternal::DirectInvocationUtils::Timer::UserInfoKey_optional __swiftcall DirectInvocationUtils.Timer.UserInfoKey.init(rawValue:)(Swift::String rawValue)
{
  return (SiriTimeInternal::DirectInvocationUtils::Timer::UserInfoKey_optional)sub_22D88A70C();
}

uint64_t DirectInvocationUtils.Timer.UserInfoKey.rawValue.getter(char a1)
{
  return *(_QWORD *)&aVerb_1[8 * a1];
}

uint64_t sub_22D889C44(char *a1, char *a2)
{
  return sub_22D8A145C(*a1, *a2);
}

uint64_t sub_22D889C50(uint64_t a1, uint64_t a2)
{
  return sub_22D88A088(a1, a2, (void (*)(_BYTE *, uint64_t))sub_22D8A22AC);
}

uint64_t sub_22D889C5C()
{
  return sub_22D8A22AC();
}

uint64_t sub_22D889C64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22D88A0E4(a1, a2, a3, (void (*)(_BYTE *, uint64_t))sub_22D8A22AC);
}

uint64_t sub_22D889C70@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22D88A70C();
  *a1 = result;
  return result;
}

uint64_t sub_22D889CA4@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = DirectInvocationUtils.Timer.UserInfoKey.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t static DirectInvocationUtils.Timer.makeReformedAlarmInvocation(hour:minute:label:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t inited;
  uint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v13[2];
  __int128 v14;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A968);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22D8B82B0;
  v9 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 32) = 1651664246;
  *(_QWORD *)(inited + 40) = 0xE400000000000000;
  *(_QWORD *)(inited + 48) = 0x657461657263;
  *(_QWORD *)(inited + 56) = 0xE600000000000000;
  *(_QWORD *)(inited + 72) = v9;
  *(_QWORD *)(inited + 80) = 1920298856;
  v10 = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 88) = 0xE400000000000000;
  *(_QWORD *)(inited + 96) = a1;
  *(_QWORD *)(inited + 120) = v10;
  *(_QWORD *)(inited + 128) = 0x6574756E696DLL;
  *(_QWORD *)(inited + 168) = v10;
  *(_QWORD *)(inited + 136) = 0xE600000000000000;
  *(_QWORD *)(inited + 144) = a2;
  sub_22D889444(inited);
  if (a4)
  {
    v15 = v9;
    *(_QWORD *)&v14 = a3;
    *((_QWORD *)&v14 + 1) = a4;
    sub_22D87D920(&v14, v13);
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_22D88A598(v13, 0x6C6562616CLL, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  return sub_22D8B6174();
}

SiriTimeInternal::DirectInvocationUtils::Alarm::URI_optional __swiftcall DirectInvocationUtils.Alarm.URI.init(rawValue:)(Swift::String rawValue)
{
  return (SiriTimeInternal::DirectInvocationUtils::Alarm::URI_optional)sub_22D88A6C8();
}

uint64_t DirectInvocationUtils.Alarm.URI.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D889E70 + 4 * byte_22D8B7E76[a1]))(0xD000000000000031, 0x800000022D8BD5B0);
}

uint64_t sub_22D889E70()
{
  uint64_t v0;

  return v0 + 10;
}

void sub_22D889ED0(char *a1)
{
  sub_22D8A14E0(*a1);
}

void sub_22D889EDC()
{
  char *v0;

  sub_22D8A2044(*v0);
}

void sub_22D889EE4(uint64_t a1)
{
  char *v1;

  sub_22D8A22EC(a1, *v1);
}

void sub_22D889EEC(uint64_t a1)
{
  char *v1;

  sub_22D8A28DC(a1, *v1);
}

uint64_t sub_22D889EF4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22D88A6C8();
  *a1 = result;
  return result;
}

uint64_t sub_22D889F28@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = DirectInvocationUtils.Alarm.URI.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

SiriTimeInternal::DirectInvocationUtils::Alarm::UserInfoKey_optional __swiftcall DirectInvocationUtils.Alarm.UserInfoKey.init(rawValue:)(Swift::String rawValue)
{
  return (SiriTimeInternal::DirectInvocationUtils::Alarm::UserInfoKey_optional)sub_22D88A70C();
}

uint64_t DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D889FA4 + 4 * byte_22D8B7E7C[a1]))(0xD000000000000012, 0x800000022D8BD6D0);
}

uint64_t sub_22D889FA4()
{
  return 1651664246;
}

uint64_t sub_22D889FB4()
{
  return 0x72506E6F74747562;
}

uint64_t sub_22D889FD8()
{
  return 0x64496D72616C61;
}

uint64_t sub_22D889FF0()
{
  return 0x6953656C646E6168;
}

uint64_t sub_22D88A014()
{
  return 0x6C6562616CLL;
}

uint64_t sub_22D88A028()
{
  return 0x706D6F4365746164;
}

uint64_t sub_22D88A04C()
{
  return 1920298856;
}

uint64_t sub_22D88A05C()
{
  return 0x6574756E696DLL;
}

void sub_22D88A070(char *a1)
{
  sub_22D8A1664(*a1);
}

uint64_t sub_22D88A07C(uint64_t a1, uint64_t a2)
{
  return sub_22D88A088(a1, a2, (void (*)(_BYTE *, uint64_t))sub_22D8A23A8);
}

uint64_t sub_22D88A088(uint64_t a1, uint64_t a2, void (*a3)(_BYTE *, uint64_t))
{
  unsigned __int8 *v3;
  uint64_t v5;
  _BYTE v7[72];

  v5 = *v3;
  sub_22D8B7434();
  a3(v7, v5);
  return sub_22D8B744C();
}

void sub_22D88A0D0(uint64_t a1)
{
  char *v1;

  sub_22D8A23A8(a1, *v1);
}

uint64_t sub_22D88A0D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22D88A0E4(a1, a2, a3, (void (*)(_BYTE *, uint64_t))sub_22D8A23A8);
}

uint64_t sub_22D88A0E4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_BYTE *, uint64_t))
{
  unsigned __int8 *v4;
  uint64_t v6;
  _BYTE v8[72];

  v6 = *v4;
  sub_22D8B7434();
  a4(v8, v6);
  return sub_22D8B744C();
}

uint64_t sub_22D88A128@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22D88A70C();
  *a1 = result;
  return result;
}

uint64_t sub_22D88A15C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = DirectInvocationUtils.Alarm.UserInfoKey.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t static DirectInvocationUtils.Alarm.reformToTimer(duration:label:)(uint64_t a1, unint64_t a2)
{
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v15[2];
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A968);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22D8B82C0;
  *(_QWORD *)(inited + 32) = 1651664246;
  *(_QWORD *)(inited + 40) = 0xE400000000000000;
  v5 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = 0x657461657263;
  *(_QWORD *)(inited + 56) = 0xE600000000000000;
  *(_QWORD *)(inited + 72) = v5;
  *(_QWORD *)(inited + 80) = 0x6E6F697461727564;
  *(_QWORD *)(inited + 88) = 0xE800000000000000;
  v6 = sub_22D8B6F48();
  *(_QWORD *)(inited + 120) = sub_22D878E44();
  *(_QWORD *)(inited + 96) = v6;
  sub_22D889444(inited);
  if (a2)
  {
    v7 = HIBYTE(a2) & 0xF;
    if ((a2 & 0x2000000000000000) == 0)
      v7 = a1 & 0xFFFFFFFFFFFFLL;
    if (v7)
    {
      swift_bridgeObjectRetain();
      sub_22D88A750(1);
      swift_bridgeObjectRelease();
      v8 = sub_22D8B7038();
      v10 = v9;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_22D88A7D8(1uLL, a1, a2);
      v12 = v11;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v15[0] = v8;
      *((_QWORD *)&v15[0] + 1) = v10;
      v17 = v12;
      sub_22D88A874();
      swift_bridgeObjectRetain();
      sub_22D8B6E64();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v18 = v5;
      *(_QWORD *)&v16 = v8;
      *((_QWORD *)&v16 + 1) = v10;
      sub_22D87D920(&v16, v15);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_22D88A598(v15, 0x6C6562616CLL, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
    }
  }
  return sub_22D8B6174();
}

unint64_t static DirectInvocationUtils.Alarm.handleVerbActionPayload(verbStr:alarmId:handleSilently:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t inited;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A968);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22D8B82B0;
  *(_QWORD *)(inited + 32) = 1651664246;
  *(_QWORD *)(inited + 40) = 0xE400000000000000;
  v11 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  *(_QWORD *)(inited + 72) = v11;
  *(_QWORD *)(inited + 80) = 0x64496D72616C61;
  *(_QWORD *)(inited + 88) = 0xE700000000000000;
  *(_QWORD *)(inited + 96) = a3;
  *(_QWORD *)(inited + 104) = a4;
  *(_QWORD *)(inited + 120) = v11;
  strcpy((char *)(inited + 128), "handleSilently");
  *(_BYTE *)(inited + 143) = -18;
  *(_QWORD *)(inited + 168) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 144) = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_22D889444(inited);
}

unint64_t static DirectInvocationUtils.Alarm.buttonPressPayload(verbStr:isConfirm:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t inited;
  uint64_t v8;

  if ((a3 & 1) != 0)
    v5 = 7562617;
  else
    v5 = 0x6C65636E6163;
  if ((a3 & 1) != 0)
    v6 = 0xE300000000000000;
  else
    v6 = 0xE600000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A968);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22D8B82C0;
  *(_QWORD *)(inited + 32) = 1651664246;
  *(_QWORD *)(inited + 40) = 0xE400000000000000;
  v8 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  *(_QWORD *)(inited + 72) = v8;
  strcpy((char *)(inited + 80), "buttonPressed");
  *(_QWORD *)(inited + 120) = v8;
  *(_WORD *)(inited + 94) = -4864;
  *(_QWORD *)(inited + 96) = v5;
  *(_QWORD *)(inited + 104) = v6;
  swift_bridgeObjectRetain();
  return sub_22D889444(inited);
}

_OWORD *sub_22D88A598(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_22D8AF240(a2, a3);
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
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
        return sub_22D87D920(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_22D8AF6A0();
      goto LABEL_7;
    }
    sub_22D8AF33C(v15, a4 & 1);
    v21 = sub_22D8AF240(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_22D8AF638(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_22D8B7428();
  __break(1u);
  return result;
}

uint64_t sub_22D88A6C8()
{
  unint64_t v0;

  v0 = sub_22D8B7200();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

uint64_t sub_22D88A70C()
{
  unint64_t v0;

  v0 = sub_22D8B7200();
  swift_bridgeObjectRelease();
  if (v0 >= 9)
    return 9;
  else
    return v0;
}

uint64_t sub_22D88A750(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_22D8B6E58();
    return sub_22D8B6E88();
  }
  return result;
}

unint64_t sub_22D88A7D8(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_22D8B6E58();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_22D8B6E88();
  }
  __break(1u);
  return result;
}

unint64_t sub_22D88A874()
{
  unint64_t result;

  result = qword_255D9A978;
  if (!qword_255D9A978)
  {
    result = MEMORY[0x22E31A408](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_255D9A978);
  }
  return result;
}

unint64_t sub_22D88A8BC()
{
  unint64_t result;

  result = qword_255D9A980;
  if (!qword_255D9A980)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for ButtonOption, &type metadata for ButtonOption);
    atomic_store(result, (unint64_t *)&qword_255D9A980);
  }
  return result;
}

unint64_t sub_22D88A904()
{
  unint64_t result;

  result = qword_255D9A988;
  if (!qword_255D9A988)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for DirectInvocationUtils.Timer.URI, &type metadata for DirectInvocationUtils.Timer.URI);
    atomic_store(result, (unint64_t *)&qword_255D9A988);
  }
  return result;
}

unint64_t sub_22D88A94C()
{
  unint64_t result;

  result = qword_255D9A990;
  if (!qword_255D9A990)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for DirectInvocationUtils.Timer.UserInfoKey, &type metadata for DirectInvocationUtils.Timer.UserInfoKey);
    atomic_store(result, (unint64_t *)&qword_255D9A990);
  }
  return result;
}

unint64_t sub_22D88A994()
{
  unint64_t result;

  result = qword_255D9A998;
  if (!qword_255D9A998)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for DirectInvocationUtils.Alarm.URI, &type metadata for DirectInvocationUtils.Alarm.URI);
    atomic_store(result, (unint64_t *)&qword_255D9A998);
  }
  return result;
}

unint64_t sub_22D88A9DC()
{
  unint64_t result;

  result = qword_255D9A9A0;
  if (!qword_255D9A9A0)
  {
    atomic_store(result, (unint64_t *)&qword_255D9A9A0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ButtonOption(unsigned __int8 *a1, unsigned int a2)
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
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ButtonOption(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D88AAFC + 4 * byte_22D8B7E8A[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22D88AB30 + 4 * byte_22D8B7E85[v4]))();
}

uint64_t sub_22D88AB30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D88AB38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D88AB40);
  return result;
}

uint64_t sub_22D88AB4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D88AB54);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22D88AB58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D88AB60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_22D88AB6C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ButtonOption()
{
  return &type metadata for ButtonOption;
}

ValueMetadata *type metadata accessor for DirectInvocationUtils()
{
  return &type metadata for DirectInvocationUtils;
}

ValueMetadata *type metadata accessor for DirectInvocationUtils.Timer()
{
  return &type metadata for DirectInvocationUtils.Timer;
}

ValueMetadata *type metadata accessor for DirectInvocationUtils.Timer.URI()
{
  return &type metadata for DirectInvocationUtils.Timer.URI;
}

ValueMetadata *type metadata accessor for DirectInvocationUtils.Timer.UserInfoKey()
{
  return &type metadata for DirectInvocationUtils.Timer.UserInfoKey;
}

ValueMetadata *type metadata accessor for DirectInvocationUtils.Alarm()
{
  return &type metadata for DirectInvocationUtils.Alarm;
}

uint64_t getEnumTagSinglePayload for ClockTimeSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s16SiriTimeInternal21DirectInvocationUtilsO5TimerO3URIOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_22D88ACC4 + 4 * byte_22D8B7E94[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_22D88ACF8 + 4 * byte_22D8B7E8F[v4]))();
}

uint64_t sub_22D88ACF8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D88AD00(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D88AD08);
  return result;
}

uint64_t sub_22D88AD14(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D88AD1CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_22D88AD20(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D88AD28(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DirectInvocationUtils.Alarm.URI()
{
  return &type metadata for DirectInvocationUtils.Alarm.URI;
}

uint64_t _s16SiriTimeInternal21DirectInvocationUtilsO5TimerO11UserInfoKeyOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D88AD90 + 4 * byte_22D8B7E9E[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_22D88ADC4 + 4 * byte_22D8B7E99[v4]))();
}

uint64_t sub_22D88ADC4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D88ADCC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D88ADD4);
  return result;
}

uint64_t sub_22D88ADE0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D88ADE8);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_22D88ADEC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D88ADF4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DirectInvocationUtils.Alarm.UserInfoKey()
{
  return &type metadata for DirectInvocationUtils.Alarm.UserInfoKey;
}

uint64_t sub_22D88AE10(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_22D88AE5C()
{
  strcpy((char *)&static SiriClockSnippetModels.bundleName, "ClockUIPlugin");
  unk_255D9F6F6 = -4864;
}

uint64_t *SiriClockSnippetModels.bundleName.unsafeMutableAddressor()
{
  if (qword_255D9A328 != -1)
    swift_once();
  return &static SiriClockSnippetModels.bundleName;
}

uint64_t static SiriClockSnippetModels.bundleName.getter()
{
  uint64_t v0;

  if (qword_255D9A328 != -1)
    swift_once();
  v0 = static SiriClockSnippetModels.bundleName;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_22D88AF28()
{
  return 1;
}

uint64_t sub_22D88AF3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22D88E914(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_22D88AF64()
{
  return 0;
}

void sub_22D88AF70(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_22D88AF7C()
{
  sub_22D88B364();
  return sub_22D8B7470();
}

uint64_t sub_22D88AFA4()
{
  sub_22D88B364();
  return sub_22D8B747C();
}

uint64_t sub_22D88AFCC()
{
  sub_22D8B7434();
  sub_22D8B7440();
  return sub_22D8B744C();
}

uint64_t sub_22D88B00C()
{
  return sub_22D8B7440();
}

uint64_t sub_22D88B030()
{
  sub_22D8B7434();
  sub_22D8B7440();
  return sub_22D8B744C();
}

uint64_t sub_22D88B070@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22D88E9B0(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_22D88B098()
{
  sub_22D88B3A8();
  return sub_22D8B7470();
}

uint64_t sub_22D88B0C0()
{
  sub_22D88B3A8();
  return sub_22D8B747C();
}

uint64_t SiriClockSnippetModels.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A9D8);
  v3 = *(_QWORD *)(v2 - 8);
  v19 = v2;
  v20 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for ClockTimeSnippetModel(0);
  MEMORY[0x24BDAC7A8](v18);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for SiriClockSnippetModels(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A9E0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D88B364();
  sub_22D8B7464();
  sub_22D88CC60(v17, (uint64_t)v10, type metadata accessor for SiriClockSnippetModels);
  sub_22D88B72C((uint64_t)v10, (uint64_t)v7, type metadata accessor for ClockTimeSnippetModel);
  sub_22D88B3A8();
  sub_22D8B72A8();
  sub_22D879430(&qword_255D9A9F8, type metadata accessor for ClockTimeSnippetModel, (uint64_t)&protocol conformance descriptor for ClockTimeSnippetModel);
  v15 = v19;
  sub_22D8B72F0();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v15);
  sub_22D88B3EC((uint64_t)v7);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t type metadata accessor for ClockTimeSnippetModel(uint64_t a1)
{
  return sub_22D88B330(a1, (uint64_t *)&unk_255D9AB80);
}

uint64_t type metadata accessor for SiriClockSnippetModels(uint64_t a1)
{
  return sub_22D88B330(a1, (uint64_t *)&unk_255D9AB18);
}

uint64_t sub_22D88B330(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_22D88B364()
{
  unint64_t result;

  result = qword_255D9A9E8;
  if (!qword_255D9A9E8)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B877C, &type metadata for SiriClockSnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9A9E8);
  }
  return result;
}

unint64_t sub_22D88B3A8()
{
  unint64_t result;

  result = qword_255D9A9F0;
  if (!qword_255D9A9F0)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B872C, &type metadata for SiriClockSnippetModels.TimeViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9A9F0);
  }
  return result;
}

uint64_t sub_22D88B3EC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ClockTimeSnippetModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t SiriClockSnippetModels.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;

  v23 = a2;
  v24 = type metadata accessor for SiriClockSnippetModels(0);
  MEMORY[0x24BDAC7A8](v24);
  v25 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA00);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA08);
  v8 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D88B364();
  v28 = v10;
  v11 = v27;
  sub_22D8B7458();
  if (!v11)
  {
    v12 = v7;
    v22 = v5;
    v13 = v4;
    v27 = v8;
    v15 = (uint64_t)v25;
    v14 = v26;
    if (*(_QWORD *)(sub_22D8B7284() + 16) == 1)
    {
      sub_22D88B3A8();
      sub_22D8B7218();
      v16 = v27;
      type metadata accessor for ClockTimeSnippetModel(0);
      sub_22D879430(&qword_255D9AA18, type metadata accessor for ClockTimeSnippetModel, (uint64_t)&protocol conformance descriptor for ClockTimeSnippetModel);
      sub_22D8B7278();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v13);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v28, v14);
      sub_22D88B72C(v15, v23, type metadata accessor for SiriClockSnippetModels);
    }
    else
    {
      v17 = sub_22D8B7164();
      swift_allocError();
      v19 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA10);
      *v19 = v24;
      sub_22D8B7224();
      sub_22D8B7158();
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x24BEE26D0], v17);
      swift_willThrow();
      v20 = v27;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v20 + 8))(v28, v14);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_22D88B72C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_22D88B770()
{
  uint64_t v0;

  if (qword_255D9A328 != -1)
    swift_once();
  v0 = static SiriClockSnippetModels.bundleName;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_22D88B7D0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SiriClockSnippetModels.init(from:)(a1, a2);
}

uint64_t sub_22D88B7E4(_QWORD *a1)
{
  return SiriClockSnippetModels.encode(to:)(a1);
}

uint64_t ClockTimeSnippetModel.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ClockTimeSnippetModel.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ClockTimeSnippetModel.id.modify())()
{
  return nullsub_1;
}

uint64_t ClockTimeSnippetModel.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ClockTimeSnippetModel(0) + 20);
  v4 = sub_22D8B5BF8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t ClockTimeSnippetModel.date.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for ClockTimeSnippetModel(0) + 20);
  v4 = sub_22D8B5BF8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*ClockTimeSnippetModel.date.modify())()
{
  type metadata accessor for ClockTimeSnippetModel(0);
  return nullsub_1;
}

uint64_t property wrapper backing initializer of ClockTimeSnippetModel.currentTimeStaticTitle()
{
  return sub_22D8B5D48();
}

uint64_t ClockTimeSnippetModel.currentTimeStaticTitle.getter()
{
  uint64_t v1;

  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  sub_22D8B5D60();
  return v1;
}

uint64_t ClockTimeSnippetModel.currentTimeStaticTitle.setter()
{
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  return sub_22D8B5D6C();
}

uint64_t (*ClockTimeSnippetModel.currentTimeStaticTitle.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  v2[4] = sub_22D8B5D54();
  return sub_22D88BA48;
}

uint64_t ClockTimeSnippetModel.timeDescriptiveAbsolute.getter()
{
  uint64_t v1;

  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  sub_22D8B5D60();
  return v1;
}

uint64_t ClockTimeSnippetModel.timeDescriptiveAbsolute.setter()
{
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  return sub_22D8B5D6C();
}

uint64_t (*ClockTimeSnippetModel.timeDescriptiveAbsolute.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  v2[4] = sub_22D8B5D54();
  return sub_22D88BA48;
}

uint64_t property wrapper backing initializer of ClockTimeSnippetModel.locale(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_22D8B5C7C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  sub_22D8B5D48();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t ClockTimeSnippetModel.locale.getter()
{
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
  return sub_22D8B5D60();
}

uint64_t ClockTimeSnippetModel.locale.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_22D8B5C7C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
  sub_22D8B5D6C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

uint64_t (*ClockTimeSnippetModel.locale.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for ClockTimeSnippetModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
  v2[4] = sub_22D8B5D54();
  return sub_22D88BA48;
}

void sub_22D88BD44(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t ClockTimeSnippetModel.punchoutURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for ClockTimeSnippetModel(0) + 36);
  return sub_22D88BDA4(v3, a1);
}

uint64_t sub_22D88BDA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ClockTimeSnippetModel.punchoutURL.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for ClockTimeSnippetModel(0) + 36);
  return sub_22D88BE1C(a1, v3);
}

uint64_t sub_22D88BE1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*ClockTimeSnippetModel.punchoutURL.modify())()
{
  type metadata accessor for ClockTimeSnippetModel(0);
  return nullsub_1;
}

uint64_t ClockTimeSnippetModel.init(id:date:currentTimeStaticTitle:timeDescriptiveAbsolute:locale:punchoutURL:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X7>, _QWORD *a9@<X8>, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  char *v27;
  void (*v28)(char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v37 = a7;
  v38 = a8;
  v34 = a5;
  v35 = a6;
  v33 = a4;
  v31 = a3;
  v39 = a10;
  v14 = sub_22D8B5C7C();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v30 - v19;
  v21 = type metadata accessor for ClockTimeSnippetModel(0);
  v36 = (uint64_t)a9 + *(int *)(v21 + 36);
  v22 = v36;
  v23 = sub_22D8B5BA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v22, 1, 1, v23);
  *a9 = a1;
  a9[1] = a2;
  v24 = (char *)a9 + *(int *)(v21 + 20);
  v25 = sub_22D8B5BF8();
  v32 = *(_QWORD *)(v25 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v24, a3, v25);
  v40 = v33;
  v41 = v34;
  sub_22D8B5D48();
  v40 = v35;
  v41 = v37;
  sub_22D8B5D48();
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v27 = v38;
  v26(v20, (uint64_t)v38, v14);
  v26(v18, (uint64_t)v20, v14);
  sub_22D8B5D48();
  v28 = *(void (**)(char *, uint64_t))(v15 + 8);
  v28(v20, v14);
  v28(v27, v14);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v31, v25);
  return sub_22D88BE1C(v39, v36);
}

uint64_t sub_22D88C078(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D88C0B0 + 4 * byte_22D8B82D0[a1]))(0xD000000000000016, 0x800000022D8BE530);
}

uint64_t sub_22D88C0B0()
{
  return 25705;
}

uint64_t sub_22D88C0BC()
{
  return 1702125924;
}

uint64_t sub_22D88C0CC(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_22D88C0E4()
{
  return 0x656C61636F6CLL;
}

uint64_t sub_22D88C0F8()
{
  return 0x74756F68636E7570;
}

uint64_t sub_22D88C118()
{
  unsigned __int8 *v0;

  return sub_22D88C078(*v0);
}

uint64_t sub_22D88C120@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22D88EA28(a1, a2);
  *a3 = result;
  return result;
}

void sub_22D88C144(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_22D88C150()
{
  sub_22D88C44C();
  return sub_22D8B7470();
}

uint64_t sub_22D88C178()
{
  sub_22D88C44C();
  return sub_22D8B747C();
}

uint64_t ClockTimeSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  char v12;
  char v13;
  char v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA30);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D88C44C();
  sub_22D8B7464();
  v14 = 0;
  sub_22D8B72C0();
  if (!v1)
  {
    type metadata accessor for ClockTimeSnippetModel(0);
    v13 = 1;
    sub_22D8B5BF8();
    sub_22D879430(&qword_255D9AA40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE920]);
    sub_22D8B72F0();
    v12 = 2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
    sub_22D88CB58(&qword_255D9AA48, MEMORY[0x24BEAD370]);
    sub_22D8B72F0();
    v11 = 3;
    sub_22D8B72F0();
    v10 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
    sub_22D88CBBC(&qword_255D9AA50, MEMORY[0x24BEAD370]);
    sub_22D8B72F0();
    v9 = 5;
    sub_22D8B5BA4();
    sub_22D879430(&qword_255D9AA68, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
    sub_22D8B72B4();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_22D88C44C()
{
  unint64_t result;

  result = qword_255D9AA38;
  if (!qword_255D9AA38)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B86DC, &type metadata for ClockTimeSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9AA38);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E31A3FC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t ClockTimeSnippetModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  int *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  int *v47;
  uint64_t *v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  char v65;
  char v66;
  char v67;
  char v68;
  char v69;
  char v70;

  v49 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
  MEMORY[0x24BDAC7A8](v3);
  v50 = (char *)&v47 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
  v53 = *(_QWORD *)(v5 - 8);
  v54 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v51 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  v55 = *(_QWORD *)(v7 - 8);
  v56 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v52 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v59 = (char *)&v47 - v10;
  v11 = sub_22D8B5BF8();
  v57 = *(_QWORD *)(v11 - 8);
  v58 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA70);
  v14 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v16 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for ClockTimeSnippetModel(0);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (uint64_t *)((char *)&v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v21 = (char *)v20 + *(int *)(v18 + 36);
  v22 = sub_22D8B5BA4();
  v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56);
  v62 = (uint64_t)v21;
  v23(v21, 1, 1, v22);
  v24 = a1[3];
  v63 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v24);
  sub_22D88C44C();
  v61 = v16;
  v25 = v64;
  sub_22D8B7458();
  if (v25)
  {
    v29 = v62;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v63);
    return sub_22D88CB18(v29);
  }
  else
  {
    v64 = v22;
    v26 = v14;
    v47 = (int *)v17;
    v48 = v20;
    v70 = 0;
    v27 = v59;
    v28 = sub_22D8B726C();
    v30 = (char *)v48;
    *v48 = v28;
    *((_QWORD *)v30 + 1) = v31;
    v69 = 1;
    sub_22D879430(&qword_255D9AA78, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE960]);
    v32 = v13;
    v33 = v58;
    sub_22D8B7278();
    v34 = v47;
    (*(void (**)(char *, char *, uint64_t))(v57 + 32))(&v30[v47[5]], v32, v33);
    v68 = 2;
    sub_22D88CB58(&qword_255D9AA80, MEMORY[0x24BEAD380]);
    v35 = v27;
    v36 = v56;
    sub_22D8B7278();
    v37 = v35;
    v38 = *(void (**)(char *, char *, uint64_t))(v55 + 32);
    v38(&v30[v34[6]], v37, v36);
    v67 = 3;
    v39 = v52;
    sub_22D8B7278();
    v38(&v30[v47[7]], v39, v36);
    v66 = 4;
    sub_22D88CBBC(&qword_255D9AA88, MEMORY[0x24BEAD380]);
    v40 = v51;
    v41 = v54;
    sub_22D8B7278();
    (*(void (**)(char *, char *, uint64_t))(v53 + 32))(&v30[v47[8]], v40, v41);
    v65 = 5;
    sub_22D879430(&qword_255D9AA90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
    v42 = (uint64_t)v50;
    v43 = v60;
    sub_22D8B7260();
    v44 = v62;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v61, v43);
    sub_22D88BE1C(v42, v44);
    v45 = v48;
    sub_22D88CC60((uint64_t)v48, v49, type metadata accessor for ClockTimeSnippetModel);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v63);
    return sub_22D88B3EC((uint64_t)v45);
  }
}

uint64_t sub_22D88CB18(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D88CB58(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  _QWORD v6[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D9AA20);
    v6[0] = MEMORY[0x24BEE0D38];
    v6[1] = MEMORY[0x24BEE0D08];
    result = MEMORY[0x22E31A408](a2, v5, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22D88CBBC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D9AA28);
    v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8];
    v7[0] = sub_22D879430(&qword_255D9AA58, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEE8]);
    v7[1] = sub_22D879430(&qword_255D9AA60, v6, MEMORY[0x24BDCEEC8]);
    result = MEMORY[0x22E31A408](a2, v5, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22D88CC60(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22D88CCA4()
{
  return sub_22D879430(&qword_255D9AA98, type metadata accessor for SiriClockSnippetModels, (uint64_t)&protocol conformance descriptor for SiriClockSnippetModels);
}

uint64_t sub_22D88CCD0()
{
  return sub_22D879430(&qword_255D9AAA0, type metadata accessor for SiriClockSnippetModels, (uint64_t)"}L\n\"Lz");
}

uint64_t sub_22D88CCFC()
{
  return sub_22D879430(&qword_255D9AA18, type metadata accessor for ClockTimeSnippetModel, (uint64_t)&protocol conformance descriptor for ClockTimeSnippetModel);
}

uint64_t sub_22D88CD28()
{
  return sub_22D879430(&qword_255D9A9F8, type metadata accessor for ClockTimeSnippetModel, (uint64_t)&protocol conformance descriptor for ClockTimeSnippetModel);
}

uint64_t sub_22D88CD54()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_22D88CD60@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22D88CD6C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ClockTimeSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_22D88CD80(_QWORD *a1)
{
  return ClockTimeSnippetModel.encode(to:)(a1);
}

char *initializeBufferWithCopyOfBuffer for SiriClockSnippetModels(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  char *v4;
  int v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = (char *)a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v28 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = (char *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    v7 = (int *)type metadata accessor for ClockTimeSnippetModel(0);
    v8 = v7[5];
    v9 = &v4[v8];
    v10 = (char *)a2 + v8;
    v11 = sub_22D8B5BF8();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = v7[6];
    v14 = &v4[v13];
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
    v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
    v17(v14, v15, v16);
    v17(&v4[v7[7]], (char *)a2 + v7[7], v16);
    v18 = v7[8];
    v19 = &v4[v18];
    v20 = (char *)a2 + v18;
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    v22 = v7[9];
    v23 = &v4[v22];
    v24 = (char *)a2 + v22;
    v25 = sub_22D8B5BA4();
    v26 = *(_QWORD *)(v25 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
    {
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
      memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
    }
  }
  return v4;
}

uint64_t destroy for SiriClockSnippetModels(uint64_t a1)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  swift_bridgeObjectRelease();
  v2 = (int *)type metadata accessor for ClockTimeSnippetModel(0);
  v3 = a1 + v2[5];
  v4 = sub_22D8B5BF8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = a1 + v2[6];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(a1 + v2[7], v6);
  v8 = a1 + v2[8];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = a1 + v2[9];
  v11 = sub_22D8B5BA4();
  v12 = *(_QWORD *)(v11 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  return result;
}

char *initializeWithCopy for SiriClockSnippetModels(char *a1, char *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v4 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v4;
  v5 = (int *)type metadata accessor for ClockTimeSnippetModel(0);
  v6 = v5[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_22D8B5BF8();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = v5[6];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  v15(v12, v13, v14);
  v15(&a1[v5[7]], &a2[v5[7]], v14);
  v16 = v5[8];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  v20 = v5[9];
  v21 = &a1[v20];
  v22 = &a2[v20];
  v23 = sub_22D8B5BA4();
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  return a1;
}

char *assignWithCopy for SiriClockSnippetModels(char *a1, char *a2)
{
  int *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  uint64_t v25;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (int *)type metadata accessor for ClockTimeSnippetModel(0);
  v5 = v4[5];
  v6 = &a1[v5];
  v7 = &a2[v5];
  v8 = sub_22D8B5BF8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 24))(v6, v7, v8);
  v9 = v4[6];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24);
  v13(v10, v11, v12);
  v13(&a1[v4[7]], &a2[v4[7]], v12);
  v14 = v4[8];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(v15, v16, v17);
  v18 = v4[9];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = sub_22D8B5BA4();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  LODWORD(v16) = v23(v19, 1, v21);
  v24 = v23(v20, 1, v21);
  if (!(_DWORD)v16)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 24))(v19, v20, v21);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
    goto LABEL_6;
  }
  if (v24)
  {
LABEL_6:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  return a1;
}

char *initializeWithTake for SiriClockSnippetModels(char *a1, char *a2)
{
  int *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = (int *)type metadata accessor for ClockTimeSnippetModel(0);
  v5 = v4[5];
  v6 = &a1[v5];
  v7 = &a2[v5];
  v8 = sub_22D8B5BF8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  v9 = v4[6];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32);
  v13(v10, v11, v12);
  v13(&a1[v4[7]], &a2[v4[7]], v12);
  v14 = v4[8];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  v18 = v4[9];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v21 = sub_22D8B5BA4();
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  return a1;
}

char *assignWithTake for SiriClockSnippetModels(char *a1, char *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  int v25;
  uint64_t v26;

  v4 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v4;
  swift_bridgeObjectRelease();
  v5 = (int *)type metadata accessor for ClockTimeSnippetModel(0);
  v6 = v5[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_22D8B5BF8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = v5[6];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40);
  v14(v11, v12, v13);
  v14(&a1[v5[7]], &a2[v5[7]], v13);
  v15 = v5[8];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v16, v17, v18);
  v19 = v5[9];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v22 = sub_22D8B5BA4();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  LODWORD(v17) = v24(v20, 1, v22);
  v25 = v24(v21, 1, v22);
  if (!(_DWORD)v17)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v20, v21, v22);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
    goto LABEL_6;
  }
  if (v25)
  {
LABEL_6:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v21, v22);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriClockSnippetModels()
{
  type metadata accessor for ClockTimeSnippetModel(0);
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for SiriClockSnippetModels()
{
  type metadata accessor for ClockTimeSnippetModel(0);
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22D88D780()
{
  return 0;
}

uint64_t sub_22D88D788(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for ClockTimeSnippetModel(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8);
    swift_initEnumMetadataSingleCase();
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

char *initializeBufferWithCopyOfBuffer for ClockTimeSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  char *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = (char *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v28 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = (char *)(v28 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_22D8B5BF8();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = &v4[v13];
    v15 = (char *)a2 + v13;
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
    v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
    v17(v14, v15, v16);
    v17(&v4[a3[7]], (char *)a2 + a3[7], v16);
    v18 = a3[8];
    v19 = &v4[v18];
    v20 = (char *)a2 + v18;
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    v22 = a3[9];
    v23 = &v4[v22];
    v24 = (char *)a2 + v22;
    v25 = sub_22D8B5BA4();
    v26 = *(_QWORD *)(v25 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
    {
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
      memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
    }
  }
  return v4;
}

uint64_t destroy for ClockTimeSnippetModel(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = a1 + a2[5];
  v5 = sub_22D8B5BF8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + a2[6];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(a1 + a2[7], v7);
  v9 = a1 + a2[8];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = a1 + a2[9];
  v12 = sub_22D8B5BA4();
  v13 = *(_QWORD *)(v12 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  return result;
}

char *initializeWithCopy for ClockTimeSnippetModel(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  v7 = a3[5];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_22D8B5BF8();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
  v16(v13, v14, v15);
  v16(&a1[a3[7]], &a2[a3[7]], v15);
  v17 = a3[8];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  v21 = a3[9];
  v22 = &a1[v21];
  v23 = &a2[v21];
  v24 = sub_22D8B5BA4();
  v25 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  return a1;
}

char *assignWithCopy for ClockTimeSnippetModel(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(char *, uint64_t, uint64_t);
  int v25;
  uint64_t v26;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_22D8B5BF8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24);
  v14(v11, v12, v13);
  v14(&a1[a3[7]], &a2[a3[7]], v13);
  v15 = a3[8];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 24))(v16, v17, v18);
  v19 = a3[9];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v22 = sub_22D8B5BA4();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  LODWORD(v17) = v24(v20, 1, v22);
  v25 = v24(v21, 1, v22);
  if (!(_DWORD)v17)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 24))(v20, v21, v22);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
    goto LABEL_6;
  }
  if (v25)
  {
LABEL_6:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  return a1;
}

char *initializeWithTake for ClockTimeSnippetModel(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = a3[5];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_22D8B5BF8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[6];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32);
  v14(v11, v12, v13);
  v14(&a1[a3[7]], &a2[a3[7]], v13);
  v15 = a3[8];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v16, v17, v18);
  v19 = a3[9];
  v20 = &a1[v19];
  v21 = &a2[v19];
  v22 = sub_22D8B5BA4();
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v21, v22);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  return a1;
}

char *assignWithTake for ClockTimeSnippetModel(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *, uint64_t, uint64_t);
  int v26;
  uint64_t v27;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_22D8B5BF8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  v15 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 40);
  v15(v12, v13, v14);
  v15(&a1[a3[7]], &a2[a3[7]], v14);
  v16 = a3[8];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  v20 = a3[9];
  v21 = &a1[v20];
  v22 = &a2[v20];
  v23 = sub_22D8B5BA4();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  LODWORD(v18) = v25(v21, 1, v23);
  v26 = v25(v22, 1, v23);
  if (!(_DWORD)v18)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 40))(v21, v22, v23);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_6;
  }
  if (v26)
  {
LABEL_6:
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClockTimeSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_22D8B5BF8();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = a3[5];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
      {
        v10 = v12;
        v11 = a3[6];
      }
      else
      {
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
        v9 = *(_QWORD *)(v13 - 8);
        if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
        {
          v10 = v13;
          v11 = a3[8];
        }
        else
        {
          v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
          v9 = *(_QWORD *)(v10 - 8);
          v11 = a3[9];
        }
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ClockTimeSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_22D8B5BF8();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = a4[5];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v12;
        v11 = a4[6];
      }
      else
      {
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA28);
        v9 = *(_QWORD *)(v13 - 8);
        if (*(_DWORD *)(v9 + 84) == a3)
        {
          v10 = v13;
          v11 = a4[8];
        }
        else
        {
          v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
          v9 = *(_QWORD *)(v10 - 8);
          v11 = a4[9];
        }
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_22D88E314()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  sub_22D8B5BF8();
  if (v0 <= 0x3F)
  {
    sub_22D88E40C();
    if (v1 <= 0x3F)
    {
      sub_22D88E460(319, &qword_255D9AB98, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEAD360]);
      if (v2 <= 0x3F)
      {
        sub_22D88E460(319, (unint64_t *)&qword_255D9ABA0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
        if (v3 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

void sub_22D88E40C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255D9AB90)
  {
    v0 = sub_22D8B5D78();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255D9AB90);
  }
}

void sub_22D88E460(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t storeEnumTagSinglePayload for ClockTimeSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_22D88E504 + 4 * byte_22D8B82DB[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_22D88E538 + 4 * byte_22D8B82D6[v4]))();
}

uint64_t sub_22D88E538(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D88E540(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D88E548);
  return result;
}

uint64_t sub_22D88E554(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D88E55CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_22D88E560(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D88E568(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ClockTimeSnippetModel.CodingKeys()
{
  return &type metadata for ClockTimeSnippetModel.CodingKeys;
}

ValueMetadata *type metadata accessor for SiriClockSnippetModels.CodingKeys()
{
  return &type metadata for SiriClockSnippetModels.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriTimeEventSender.Attribute(unsigned int *a1, int a2)
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

uint64_t _s16SiriTimeInternal22SiriClockSnippetModelsO10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22D88E630 + 4 * byte_22D8B82E0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22D88E650 + 4 * byte_22D8B82E5[v4]))();
}

_BYTE *sub_22D88E630(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22D88E650(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22D88E658(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22D88E660(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22D88E668(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22D88E670(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SiriClockSnippetModels.TimeViewCodingKeys()
{
  return &type metadata for SiriClockSnippetModels.TimeViewCodingKeys;
}

unint64_t sub_22D88E690()
{
  unint64_t result;

  result = qword_255D9ABE0;
  if (!qword_255D9ABE0)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B8544, &type metadata for SiriClockSnippetModels.TimeViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9ABE0);
  }
  return result;
}

unint64_t sub_22D88E6D8()
{
  unint64_t result;

  result = qword_255D9ABE8;
  if (!qword_255D9ABE8)
  {
    result = MEMORY[0x22E31A408]("eJ\n\" x", &type metadata for SiriClockSnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9ABE8);
  }
  return result;
}

unint64_t sub_22D88E720()
{
  unint64_t result;

  result = qword_255D9ABF0;
  if (!qword_255D9ABF0)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B86B4, &type metadata for ClockTimeSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9ABF0);
  }
  return result;
}

unint64_t sub_22D88E768()
{
  unint64_t result;

  result = qword_255D9ABF8;
  if (!qword_255D9ABF8)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B8624, &type metadata for ClockTimeSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9ABF8);
  }
  return result;
}

unint64_t sub_22D88E7B0()
{
  unint64_t result;

  result = qword_255D9AC00;
  if (!qword_255D9AC00)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B864C, &type metadata for ClockTimeSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9AC00);
  }
  return result;
}

unint64_t sub_22D88E7F8()
{
  unint64_t result;

  result = qword_255D9AC08;
  if (!qword_255D9AC08)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B84B4, &type metadata for SiriClockSnippetModels.TimeViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9AC08);
  }
  return result;
}

unint64_t sub_22D88E840()
{
  unint64_t result;

  result = qword_255D9AC10;
  if (!qword_255D9AC10)
  {
    result = MEMORY[0x22E31A408]("MK\n\"dy", &type metadata for SiriClockSnippetModels.TimeViewCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9AC10);
  }
  return result;
}

unint64_t sub_22D88E888()
{
  unint64_t result;

  result = qword_255D9AC18;
  if (!qword_255D9AC18)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B856C, &type metadata for SiriClockSnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9AC18);
  }
  return result;
}

unint64_t sub_22D88E8D0()
{
  unint64_t result;

  result = qword_255D9AC20;
  if (!qword_255D9AC20)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B8594, &type metadata for SiriClockSnippetModels.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9AC20);
  }
  return result;
}

uint64_t sub_22D88E914(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x77656956656D6974 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_22D8B73F8();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_22D88E998()
{
  return 0x77656956656D6974;
}

uint64_t sub_22D88E9B0(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_22D8B73F8();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_22D88EA1C()
{
  return 12383;
}

uint64_t sub_22D88EA28(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v3 || (sub_22D8B73F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000 || (sub_22D8B73F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000022D8BE530 || (sub_22D8B73F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000022D8BE550 || (sub_22D8B73F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000 || (sub_22D8B73F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x74756F68636E7570 && a2 == 0xEB000000004C5255)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_22D8B73F8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t HALAlarmDeviceContext.alarms.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HALAlarmDeviceContext.remoteExecutionId.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  return a3;
}

uint64_t HALAlarmDeviceContext.remoteExecutionId.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*HALAlarmDeviceContext.remoteExecutionId.modify())()
{
  return nullsub_1;
}

uint64_t HALAlarmDeviceContext.firingAlarms.getter(uint64_t a1, uint64_t a2)
{
  return sub_22D88F50C(a2);
}

id sub_22D88ECF4()
{
  id *v0;

  return *v0;
}

uint64_t Array<A>.firingDevices()(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __int128 v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  v2 = (uint64_t *)(swift_bridgeObjectRetain() + 56);
  v3 = MEMORY[0x24BEE4AF8];
  do
  {
    v14 = *(_OWORD *)(v2 - 3);
    v5 = *(v2 - 1);
    v4 = *v2;
    swift_bridgeObjectRetain();
    v6 = (id)v14;
    v7 = swift_bridgeObjectRetain();
    v8 = sub_22D88F50C(v7);
    if ((v8 & 0xC000000000000001) != 0)
      v9 = sub_22D8B70BC();
    else
      v9 = *(_QWORD *)(v8 + 16);
    swift_bridgeObjectRelease();
    if (v9)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_22D88F168(0, *(_QWORD *)(v3 + 16) + 1, 1);
      v11 = *(_QWORD *)(v3 + 16);
      v10 = *(_QWORD *)(v3 + 24);
      if (v11 >= v10 >> 1)
        sub_22D88F168(v10 > 1, v11 + 1, 1);
      *(_QWORD *)(v3 + 16) = v11 + 1;
      v12 = v3 + 32 * v11;
      *(_OWORD *)(v12 + 32) = v14;
      *(_QWORD *)(v12 + 48) = v5;
      *(_QWORD *)(v12 + 56) = v4;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

    }
    v2 += 4;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  __int128 v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  v2 = (uint64_t *)(swift_bridgeObjectRetain() + 56);
  v3 = MEMORY[0x24BEE4AF8];
  do
  {
    v14 = *(_OWORD *)(v2 - 3);
    v5 = *(v2 - 1);
    v4 = *v2;
    swift_bridgeObjectRetain();
    v6 = (id)v14;
    v7 = swift_bridgeObjectRetain();
    v8 = sub_22D87DA3C(v7);
    if ((v8 & 0xC000000000000001) != 0)
      v9 = sub_22D8B70BC();
    else
      v9 = *(_QWORD *)(v8 + 16);
    swift_bridgeObjectRelease();
    if (v9)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_22D88F194(0, *(_QWORD *)(v3 + 16) + 1, 1);
      v11 = *(_QWORD *)(v3 + 16);
      v10 = *(_QWORD *)(v3 + 24);
      if (v11 >= v10 >> 1)
        sub_22D88F194(v10 > 1, v11 + 1, 1);
      *(_QWORD *)(v3 + 16) = v11 + 1;
      v12 = v3 + 32 * v11;
      *(_OWORD *)(v12 + 32) = v14;
      *(_QWORD *)(v12 + 48) = v5;
      *(_QWORD *)(v12 + 56) = v4;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

    }
    v2 += 4;
    --v1;
  }
  while (v1);
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t *sub_22D88EE74(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  unint64_t v4;
  size_t v5;
  unint64_t *v6;
  void *v7;
  _QWORD v9[2];

  v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  v4 = (unint64_t)((1 << v3) + 63) >> 6;
  v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    v6 = sub_22D88EFD0((_QWORD *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, v2);
    swift_release();
    if (v1)
      swift_willThrow();
  }
  else
  {
    v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    v6 = sub_22D88EFD0((unint64_t *)v7, v4, v2);
    swift_release();
    MEMORY[0x22E31A4BC](v7, -1, -1);
  }
  return v6;
}

unint64_t *sub_22D88EFD0(unint64_t *result, uint64_t a2, uint64_t a3)
{
  unint64_t *v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  v4 = result;
  v5 = 0;
  v6 = 0;
  v7 = a3 + 56;
  v8 = 1 << *(_BYTE *)(a3 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a3 + 56);
  v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v13 = v12 | (v6 << 6);
      goto LABEL_5;
    }
    v14 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v14 >= v11)
      goto LABEL_24;
    v15 = *(_QWORD *)(v7 + 8 * v14);
    ++v6;
    if (!v15)
    {
      v6 = v14 + 1;
      if (v14 + 1 >= v11)
        goto LABEL_24;
      v15 = *(_QWORD *)(v7 + 8 * v6);
      if (!v15)
      {
        v6 = v14 + 2;
        if (v14 + 2 >= v11)
          goto LABEL_24;
        v15 = *(_QWORD *)(v7 + 8 * v6);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v10 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v6 << 6);
LABEL_5:
    result = (unint64_t *)objc_msgSend(*(id *)(*(_QWORD *)(a3 + 48) + 8 * v13), sel_isFiring);
    if ((_DWORD)result)
    {
      *(unint64_t *)((char *)v4 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      if (__OFADD__(v5++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        return (unint64_t *)sub_22D88FD5C(v4, a2, v5, a3);
      }
    }
  }
  v16 = v14 + 3;
  if (v16 >= v11)
    goto LABEL_24;
  v15 = *(_QWORD *)(v7 + 8 * v16);
  if (v15)
  {
    v6 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v6 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v6 >= v11)
      goto LABEL_24;
    v15 = *(_QWORD *)(v7 + 8 * v6);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_22D88F168(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_22D88F3A0(a1, a2, a3, *v3, &qword_255D9A8D0);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_22D88F194(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_22D88F3A0(a1, a2, a3, *v3, &qword_255D9A8C0);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_22D88F1C0(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8D8);
  v10 = *(_QWORD *)(sub_22D8B5BF8() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_22D8B5BF8() - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_22D8B71F4();
  __break(1u);
  return result;
}

uint64_t sub_22D88F3A0(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 1;
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 5);
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[32 * v9])
      memmove(v14, v15, 32 * v9);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[32 * v9] || v14 >= &v15[32 * v9])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_32:
  result = sub_22D8B71F4();
  __break(1u);
  return result;
}

uint64_t sub_22D88F50C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v1 = MEMORY[0x24BEE4B08];
    v16 = MEMORY[0x24BEE4B08];
    swift_bridgeObjectRetain();
    sub_22D8B70B0();
    if (sub_22D8B70D4())
    {
      sub_22D88F81C();
      do
      {
        swift_dynamicCast();
        if ((objc_msgSend(v15, sel_isFiring) & 1) != 0)
        {
          v2 = v16;
          v3 = *(_QWORD *)(v16 + 16);
          if (*(_QWORD *)(v16 + 24) <= v3)
          {
            sub_22D89C348(v3 + 1);
            v2 = v16;
          }
          result = sub_22D8B6FE4();
          v5 = v2 + 56;
          v6 = -1 << *(_BYTE *)(v2 + 32);
          v7 = result & ~v6;
          v8 = v7 >> 6;
          if (((-1 << v7) & ~*(_QWORD *)(v2 + 56 + 8 * (v7 >> 6))) != 0)
          {
            v9 = __clz(__rbit64((-1 << v7) & ~*(_QWORD *)(v2 + 56 + 8 * (v7 >> 6)))) | v7 & 0x7FFFFFFFFFFFFFC0;
          }
          else
          {
            v10 = 0;
            v11 = (unint64_t)(63 - v6) >> 6;
            do
            {
              if (++v8 == v11 && (v10 & 1) != 0)
              {
                __break(1u);
                return result;
              }
              v12 = v8 == v11;
              if (v8 == v11)
                v8 = 0;
              v10 |= v12;
              v13 = *(_QWORD *)(v5 + 8 * v8);
            }
            while (v13 == -1);
            v9 = __clz(__rbit64(~v13)) + (v8 << 6);
          }
          *(_QWORD *)(v5 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
          *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v9) = v15;
          ++*(_QWORD *)(v2 + 16);
        }
        else
        {

        }
      }
      while (sub_22D8B70D4());
      v1 = v16;
    }
    swift_release();
  }
  else
  {
    v14 = swift_bridgeObjectRetain();
    return (uint64_t)sub_22D88EE74(v14);
  }
  return v1;
}

uint64_t assignWithCopy for HALAlarmDeviceContext(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for HALAlarmDeviceContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t storeEnumTagSinglePayload for HALAlarmDeviceContext(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HALAlarmDeviceContext()
{
  return &type metadata for HALAlarmDeviceContext;
}

unint64_t sub_22D88F81C()
{
  unint64_t result;

  result = qword_255D9AC28;
  if (!qword_255D9AC28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255D9AC28);
  }
  return result;
}

uint64_t ApplicationContext.deviceState.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22D87832C(v1 + 16, a1);
}

uint64_t ApplicationContext.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return v0;
}

uint64_t ApplicationContext.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t HALTimerDeviceContext.timers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t HALTimerDeviceContext.remoteExecutionId.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_bridgeObjectRetain();
  return a3;
}

uint64_t HALTimerDeviceContext.firingTimers.getter(uint64_t a1, uint64_t a2)
{
  return sub_22D87DA3C(a2);
}

unint64_t *sub_22D88FA60(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  unint64_t v4;
  size_t v5;
  unint64_t *v6;
  void *v7;
  _QWORD v9[2];

  v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  v4 = (unint64_t)((1 << v3) + 63) >> 6;
  v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    v6 = sub_22D88FBBC((_QWORD *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, v2);
    swift_release();
    if (v1)
      swift_willThrow();
  }
  else
  {
    v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    v6 = sub_22D88FBBC((unint64_t *)v7, v4, v2);
    swift_release();
    MEMORY[0x22E31A4BC](v7, -1, -1);
  }
  return v6;
}

unint64_t *sub_22D88FBBC(unint64_t *result, uint64_t a2, uint64_t a3)
{
  unint64_t *v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  v4 = result;
  v5 = 0;
  v6 = 0;
  v7 = a3 + 56;
  v8 = 1 << *(_BYTE *)(a3 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a3 + 56);
  v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v13 = v12 | (v6 << 6);
      goto LABEL_5;
    }
    v14 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v14 >= v11)
      goto LABEL_24;
    v15 = *(_QWORD *)(v7 + 8 * v14);
    ++v6;
    if (!v15)
    {
      v6 = v14 + 1;
      if (v14 + 1 >= v11)
        goto LABEL_24;
      v15 = *(_QWORD *)(v7 + 8 * v6);
      if (!v15)
      {
        v6 = v14 + 2;
        if (v14 + 2 >= v11)
          goto LABEL_24;
        v15 = *(_QWORD *)(v7 + 8 * v6);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v10 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v6 << 6);
LABEL_5:
    result = (unint64_t *)objc_msgSend(*(id *)(*(_QWORD *)(a3 + 48) + 8 * v13), sel_isFiring);
    if ((_DWORD)result)
    {
      *(unint64_t *)((char *)v4 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      if (__OFADD__(v5++, 1))
      {
        __break(1u);
LABEL_24:
        swift_retain();
        return (unint64_t *)sub_22D88FD68(v4, a2, v5, a3, &qword_255D9ACE8);
      }
    }
  }
  v16 = v14 + 3;
  if (v16 >= v11)
    goto LABEL_24;
  v15 = *(_QWORD *)(v7 + 8 * v16);
  if (v15)
  {
    v6 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v6 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v6 >= v11)
      goto LABEL_24;
    v15 = *(_QWORD *)(v7 + 8 * v6);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_22D88FD5C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22D88FD68(a1, a2, a3, a4, &qword_255D9ACF0);
}

uint64_t sub_22D88FD68(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  unint64_t *v29;

  v5 = a4;
  if (!a3)
  {
    v10 = MEMORY[0x24BEE4B08];
LABEL_36:
    swift_release();
    return v10;
  }
  v6 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v5;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  result = sub_22D8B7104();
  v10 = result;
  v29 = a1;
  if (a2 < 1)
    v11 = 0;
  else
    v11 = *a1;
  v12 = 0;
  v13 = result + 56;
  while (1)
  {
    if (v11)
    {
      v14 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
      goto LABEL_39;
    if (v16 >= a2)
      goto LABEL_36;
    v17 = v29[v16];
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= a2)
        goto LABEL_36;
      v17 = v29[v12];
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= a2)
          goto LABEL_36;
        v17 = v29[v12];
        if (!v17)
          break;
      }
    }
LABEL_23:
    v11 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v5 + 48) + 8 * v15);
    result = sub_22D8B6FE4();
    v20 = -1 << *(_BYTE *)(v10 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v13 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v13 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        v27 = *(_QWORD *)(v13 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v13 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(_QWORD *)(*(_QWORD *)(v10 + 48) + 8 * v23) = v19;
    ++*(_QWORD *)(v10 + 16);
    if (__OFSUB__(v6--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v6)
      goto LABEL_36;
  }
  v18 = v16 + 3;
  if (v18 >= a2)
    goto LABEL_36;
  v17 = v29[v18];
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
    if (v12 >= a2)
      goto LABEL_36;
    v17 = v29[v12];
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for HALTimerDeviceContext()
{
  return &type metadata for HALTimerDeviceContext;
}

unint64_t sub_22D88FFD0()
{
  unint64_t result;

  result = qword_255D9ACE0;
  if (!qword_255D9ACE0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255D9ACE0);
  }
  return result;
}

uint64_t sub_22D89000C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9ACF8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9ACF8);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t NLContextUpdate.add(nluSystemDialogAct:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v2 = sub_22D8B5FAC();
  if (v2)
  {
    if (*(_QWORD *)(v2 + 16))
    {
      if (qword_255D9A330 != -1)
        swift_once();
      v3 = sub_22D8B6D80();
      __swift_project_value_buffer(v3, (uint64_t)qword_255D9ACF8);
      swift_bridgeObjectRetain();
      v4 = sub_22D8B6D68();
      v5 = sub_22D8B6FB4();
      if (os_log_type_enabled(v4, v5))
      {
        v6 = (uint8_t *)swift_slowAlloc();
        v7 = swift_slowAlloc();
        v18 = v7;
        *(_DWORD *)v6 = 136315138;
        v8 = sub_22D8B6318();
        v9 = swift_bridgeObjectRetain();
        v10 = MEMORY[0x22E319A90](v9, v8);
        v12 = v11;
        swift_bridgeObjectRelease();
        sub_22D8755FC(v10, v12, &v18);
        sub_22D8B7044();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22D86F000, v4, v5, "Attempted to set additional SDA on NLContextUpdate. This is unsupported and the last-in SDA will be used. Dropping previous SDA: %s", v6, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E31A4BC](v7, -1, -1);
        MEMORY[0x22E31A4BC](v6, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AD10);
  v13 = sub_22D8B6318();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_22D8B7E30;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 16))(v16 + v15, a1, v13);
  return sub_22D8B5FB8();
}

uint64_t sub_22D8902FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9AD20);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9AD20);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t SiriTimeCrossDeviceAnalytics.init(action:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_22D8B6D2C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
}

void SiriTimeCrossDeviceAnalytics.logSharedAnalyticsStarted(selectedDevice:)(void *a1)
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
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  char *v27;
  uint64_t v28;
  _QWORD *v29;
  char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[4];

  v47 = a1;
  v1 = sub_22D8B6C24();
  v48 = *(_QWORD *)(v1 - 8);
  v49 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v46 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AD38);
  MEMORY[0x24BDAC7A8](v3);
  v41 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = sub_22D8B6D2C();
  v5 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22D8B6D38();
  v44 = *(_QWORD *)(v8 - 8);
  v45 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v43 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A800);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_22D8B5C40();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v39 - v18;
  sub_22D8B5EBC();
  __swift_project_boxed_opaque_existential_1(v50, v50[3]);
  sub_22D8B609C();
  if (v20)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v50);
    sub_22D8B5C04();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) != 1)
    {
      v25 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
      v39 = v19;
      v25(v19, v12, v13);
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v42, v40);
      v26 = sub_22D8B6D20();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v41, 1, 1, v26);
      v27 = v43;
      sub_22D8B6D14();
      sub_22D8B6CCC();
      v42 = sub_22D8B6CC0();
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AD40);
      v29 = v46;
      v30 = &v46[*(int *)(v28 + 64)];
      __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B350);
      v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = xmmword_22D8B7AC0;
      v32 = v47;
      *(_QWORD *)(v31 + 32) = v47;
      v50[0] = v31;
      sub_22D8B6ED0();
      *v29 = v50[0];
      v29[1] = 0;
      v34 = v44;
      v33 = v45;
      v35 = v27;
      (*(void (**)(char *, char *, uint64_t))(v44 + 16))(v30, v27, v45);
      v37 = v48;
      v36 = v49;
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(v48 + 104))(v29, *MEMORY[0x24BEA9040], v49);
      v38 = v32;
      sub_22D8B6CA8();
      swift_release();
      (*(void (**)(_QWORD *, uint64_t))(v37 + 8))(v29, v36);
      (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v33);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v39, v13);
      return;
    }
    sub_22D88031C((uint64_t)v12);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v50);
  }
  if (qword_255D9A338 != -1)
    swift_once();
  v21 = sub_22D8B6D80();
  __swift_project_value_buffer(v21, (uint64_t)qword_255D9AD20);
  v22 = sub_22D8B6D68();
  v23 = sub_22D8B6FB4();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_22D86F000, v22, v23, "DismissAlarm.logSharedAnalyticsStarted(selectedDevice:) returning - request UUID missing or invalid", v24, 2u);
    MEMORY[0x22E31A4BC](v24, -1, -1);
  }

}

void SiriTimeCrossDeviceAnalytics.logSharedAnalyticsEnded(result:)(uint64_t a1)
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
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[4];

  v42 = a1;
  v1 = sub_22D8B6C24();
  v44 = *(_QWORD *)(v1 - 8);
  v45 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v43 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AD38);
  MEMORY[0x24BDAC7A8](v3);
  v37 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = sub_22D8B6D2C();
  v5 = *(_QWORD *)(v36 - 8);
  MEMORY[0x24BDAC7A8](v36);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22D8B6D38();
  v40 = *(_QWORD *)(v8 - 8);
  v41 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v39 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A800);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_22D8B5C40();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v35 - v18;
  sub_22D8B5EBC();
  __swift_project_boxed_opaque_existential_1(v46, v46[3]);
  sub_22D8B609C();
  if (v20)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
    sub_22D8B5C04();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v38, v36);
      v25 = sub_22D8B6D20();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v37, 1, 1, v25);
      v26 = v39;
      sub_22D8B6D14();
      sub_22D8B6CCC();
      sub_22D8B6CC0();
      v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AD48);
      v28 = v43;
      v29 = &v43[*(int *)(v27 + 48)];
      v31 = v40;
      v30 = v41;
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v43, v26, v41);
      v32 = sub_22D8B6C18();
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v29, v42, v32);
      v34 = v44;
      v33 = v45;
      (*(void (**)(char *, _QWORD, uint64_t))(v44 + 104))(v28, *MEMORY[0x24BEA9010], v45);
      sub_22D8B6CA8();
      swift_release();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v28, v33);
      (*(void (**)(char *, uint64_t))(v31 + 8))(v26, v30);
      (*(void (**)(char *, uint64_t))(v14 + 8))(v19, v13);
      return;
    }
    sub_22D88031C((uint64_t)v12);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v46);
  }
  if (qword_255D9A338 != -1)
    swift_once();
  v21 = sub_22D8B6D80();
  __swift_project_value_buffer(v21, (uint64_t)qword_255D9AD20);
  v22 = sub_22D8B6D68();
  v23 = sub_22D8B6FB4();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_22D86F000, v22, v23, "DismissAlarm.logSharedAnalyticsEnded(result:) returning - request UUID missing or invalid", v24, 2u);
    MEMORY[0x22E31A4BC](v24, -1, -1);
  }

}

uint64_t initializeBufferWithCopyOfBuffer for SiriTimeCrossDeviceAnalytics(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_22D8B6D2C();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for SiriTimeCrossDeviceAnalytics(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_22D8B6D2C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for SiriTimeCrossDeviceAnalytics(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_22D8B6D2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for SiriTimeCrossDeviceAnalytics(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_22D8B6D2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for SiriTimeCrossDeviceAnalytics(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_22D8B6D2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for SiriTimeCrossDeviceAnalytics(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_22D8B6D2C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTimeCrossDeviceAnalytics()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22D890DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_22D8B6D2C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for SiriTimeCrossDeviceAnalytics()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22D890E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_22D8B6D2C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for SiriTimeCrossDeviceAnalytics()
{
  uint64_t result;

  result = qword_255D9ADA8;
  if (!qword_255D9ADA8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22D890EB4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22D8B6D2C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t DeviceState.isPhoneOrPad.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char v6;
  char v7;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22D8B5EEC();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, a1);
  if ((v6 & 1) != 0)
    v7 = 1;
  else
    v7 = sub_22D8B5EE0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, a1);
  return v7 & 1;
}

BOOL static DecideAction.PromptExpectation.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t DecideAction.PromptExpectation.hash(into:)()
{
  return sub_22D8B7440();
}

uint64_t DecideAction.PromptExpectation.hashValue.getter()
{
  sub_22D8B7434();
  sub_22D8B7440();
  return sub_22D8B744C();
}

unint64_t sub_22D891048()
{
  unint64_t result;

  result = qword_255D9ADE0;
  if (!qword_255D9ADE0)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for DecideAction.PromptExpectation, &type metadata for DecideAction.PromptExpectation);
    atomic_store(result, (unint64_t *)&qword_255D9ADE0);
  }
  return result;
}

ValueMetadata *type metadata accessor for DecideAction()
{
  return &type metadata for DecideAction;
}

uint64_t getEnumTagSinglePayload for DecideAction.PromptExpectation(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DecideAction.PromptExpectation(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D891178 + 4 * byte_22D8B88B5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22D8911AC + 4 * asc_22D8B88B0[v4]))();
}

uint64_t sub_22D8911AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8911B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D8911BCLL);
  return result;
}

uint64_t sub_22D8911C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D8911D0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22D8911D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8911DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DecideAction.PromptExpectation()
{
  return &type metadata for DecideAction.PromptExpectation;
}

uint64_t DeviceUnit.dialogType.getter()
{
  _s27SiriVirtualDeviceResolution0C4UnitC0A12TimeInternalE10isCommunalSbvg_0();
  sub_22D8B6C90();
  return sub_22D8B6E34();
}

uint64_t DeviceUnit.room.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22D891314(MEMORY[0x24BEA90D0], a1);
}

uint64_t DeviceUnit.deviceName.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22D891314(MEMORY[0x24BEA90C8], a1);
}

uint64_t sub_22D891314@<X0>(void (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;

  a1();
  if (v3)
  {
    sub_22D8B6E34();
    swift_bridgeObjectRelease();
    v4 = sub_22D8B6B64();
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
    v6 = a2;
    v7 = 0;
  }
  else
  {
    v4 = sub_22D8B6B64();
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
    v6 = a2;
    v7 = 1;
  }
  return v5(v6, v7, 1, v4);
}

void PunchOutApp.url.getter(char a1)
{
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v3 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v3);
  __asm { BR              X10 }
}

uint64_t sub_22D891434()
{
  return sub_22D8B5B98();
}

uint64_t sub_22D89146C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void *)objc_opt_self();
  v3 = (void *)sub_22D8B6E04();
  v4 = objc_msgSend(v2, sel_mtURLForScheme_, v3);

  if (v4)
  {
    sub_22D8B5B8C();

    v5 = sub_22D8B5BA4();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v1, 0, 1, v5);
  }
  else
  {
    v6 = sub_22D8B5BA4();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v1, 1, 1, v6);
  }
  return sub_22D8916C0(v1, v0);
}

uint64_t sub_22D8916C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void *static PunchOutApp.allCases.getter()
{
  return &unk_24F95BC30;
}

uint64_t PunchOutApp.rawValue.getter(char a1)
{
  return *(_QWORD *)&aSleep_2[8 * a1];
}

uint64_t sub_22D891738(char *a1, char *a2)
{
  return sub_22D8A19DC(*a1, *a2);
}

uint64_t sub_22D891744()
{
  return sub_22D8A212C();
}

uint64_t sub_22D89174C()
{
  return sub_22D8A2544();
}

uint64_t sub_22D891754()
{
  return sub_22D8A27B0();
}

uint64_t sub_22D89175C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s16SiriTimeInternal11PunchOutAppO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_22D891788@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = PunchOutApp.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_22D8917B0(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F95BC58;
}

uint64_t _s16SiriTimeInternal11PunchOutAppO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_22D8B7200();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

unint64_t sub_22D89180C()
{
  unint64_t result;

  result = qword_255D9ADE8;
  if (!qword_255D9ADE8)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for PunchOutApp, &type metadata for PunchOutApp);
    atomic_store(result, (unint64_t *)&qword_255D9ADE8);
  }
  return result;
}

unint64_t sub_22D891854()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255D9ADF0;
  if (!qword_255D9ADF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D9ADF8);
    result = MEMORY[0x22E31A408](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_255D9ADF0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for PunchOutApp(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D8918EC + 4 * byte_22D8B8965[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_22D891920 + 4 * asc_22D8B8960[v4]))();
}

uint64_t sub_22D891920(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D891928(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D891930);
  return result;
}

uint64_t sub_22D89193C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D891944);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_22D891948(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D891950(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PunchOutApp()
{
  return &type metadata for PunchOutApp;
}

_BYTE *sub_22D89196C@<X0>(_BYTE *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  BOOL v7;

  v3 = *result;
  v4 = v3 > 0x20;
  v5 = (1 << v3) & 0x100003E01;
  v6 = v4 || v5 == 0;
  v7 = v6 && (result = (_BYTE *)_swift_stdlib_strtof_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

unint64_t sub_22D8919D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255D9AE10;
  if (!qword_255D9AE10)
  {
    v1 = sub_22D8B64A4();
    result = MEMORY[0x22E31A408](MEMORY[0x24BEA0580], v1);
    atomic_store(result, (unint64_t *)&qword_255D9AE10);
  }
  return result;
}

uint64_t sub_22D891A20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9AE18);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9AE18);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_22D891AB0()
{
  qword_255D9AE30 = 0x656D695469726953;
  *(_QWORD *)algn_255D9AE38 = 0xE800000000000000;
}

uint64_t sub_22D891AD4()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  uint64_t result;
  char v8;

  v0 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v1 = objc_msgSend(v0, sel_processName);

  v2 = sub_22D8B6E10();
  v4 = v3;

  if (v2 == 0x747365746378 && v4 == 0xE600000000000000)
  {
    result = swift_bridgeObjectRelease();
    v8 = 0;
  }
  else
  {
    v6 = sub_22D8B73F8();
    result = swift_bridgeObjectRelease();
    v8 = v6 ^ 1;
  }
  byte_255D9F6F8 = v8 & 1;
  return result;
}

uint64_t static BarbaraWalters.stopThePresses(for:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t (**v2)(_QWORD, _QWORD);
  _QWORD *v3;

  v1 = a1[3];
  v2 = (uint64_t (**)(_QWORD, _QWORD))a1[4];
  v3 = __swift_project_boxed_opaque_existential_1(a1, v1);
  return sub_22D893258((uint64_t)v3, v1, v2);
}

void sub_22D891BDC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (qword_255D9A340 != -1)
    swift_once();
  v13 = sub_22D8B6D80();
  __swift_project_value_buffer(v13, (uint64_t)qword_255D9AE18);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v14 = sub_22D8B6D68();
  v15 = sub_22D8B6FC0();
  if (os_log_type_enabled(v14, v15))
  {
    v18 = a6;
    v16 = swift_slowAlloc();
    v17 = swift_slowAlloc();
    v19 = v17;
    *(_DWORD *)v16 = 136315906;
    swift_bridgeObjectRetain();
    sub_22D8755FC(a2, a3, &v19);
    sub_22D8B7044();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_22D8755FC(a4, a5, &v19);
    sub_22D8B7044();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_22D8755FC(v18, a7, &v19);
    sub_22D8B7044();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v16 + 32) = 1024;
    sub_22D8B7044();
    _os_log_impl(&dword_22D86F000, v14, v15, "SiriTime#%s#%s did AutoBugCapture for %s: %{BOOL}d", (uint8_t *)v16, 0x26u);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v17, -1, -1);
    MEMORY[0x22E31A4BC](v16, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

uint64_t static BarbaraWalters.tryReport<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  _QWORD *v4;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v4[3] = a2;
  v4[4] = a3;
  v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  v4[5] = v6;
  *v6 = v4;
  v6[1] = sub_22D891EE8;
  return v8(a1);
}

uint64_t sub_22D891EE8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_22D891F54()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v1 = *(void **)(v0 + 48);
  *(_QWORD *)(v0 + 16) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A838);
  v3 = sub_22D8B73E0();
  if (v3)
  {
    v4 = (void *)v3;

  }
  else
  {
    v4 = (void *)swift_allocError();
    *v5 = *(_QWORD *)(v0 + 16);
  }
  v7 = *(_QWORD *)(v0 + 24);
  v6 = *(_QWORD *)(v0 + 32);
  v8 = (void *)sub_22D8B5B68();

  swift_bridgeObjectRetain();
  sub_22D8A9F34(v7, v6, (uint64_t)v8, 0x73u);
  swift_bridgeObjectRelease();

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static BarbaraWalters.logAndReturnError<A>(context:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;

  v10 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v13(v12, v14, v15);
  v16 = sub_22D8B73E0();
  if (v16)
  {
    v17 = (void *)v16;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, a4);
  }
  else
  {
    v17 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v18, v12, a4);
  }
  v19 = (void *)sub_22D8B5B68();

  swift_bridgeObjectRetain();
  sub_22D8A9F34(a1, a2, (uint64_t)v19, 0x73u);

  swift_bridgeObjectRelease();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v13)(a5, a3, a4);
}

uint64_t ABCReport.type.getter(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D8921B0
                                                                     + 4 * byte_22D8B8AC0[a4 >> 4]))(0xD000000000000013, 0x800000022D8BE620);
}

uint64_t sub_22D8921B0()
{
  return 0x676E696D6954;
}

uint64_t sub_22D8921C4()
{
  return 0x746E4972656D6954;
}

uint64_t sub_22D892228()
{
  return 0x646E5572656D6954;
}

uint64_t sub_22D892254()
{
  return 0x656C646E61686E55;
}

uint64_t sub_22D892278()
{
  return 0x6E65646E65706544;
}

uint64_t sub_22D892294()
{
  return 0x614C676F6C616944;
}

uint64_t ABCReport.subType.getter(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_22D8922F8 + 4 * byte_22D8B8ACB[a4 >> 4]))(0x656C646E61686E55, 0xEE00657372615064);
}

uint64_t sub_22D8922F8@<X0>(char a1@<W8>)
{
  if (!a1)
    return 0x45726567616E614DLL;
  if (a1 == 1)
    return 0xD000000000000018;
  return 0x726F727245;
}

unint64_t sub_22D89235C@<X0>(uint64_t a1@<X8>)
{
  unint64_t v1;

  v1 = 0xD000000000000019;
  if (a1)
    v1 = 0xD00000000000001BLL;
  if (a1 == 1)
    return 0xD00000000000001CLL;
  else
    return v1;
}

uint64_t sub_22D8923B4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D8923EC
                                                                     + 4 * byte_22D8B8AD6[a4 & 0xF]))(0xD000000000000015, 0x800000022D8BE660);
}

uint64_t sub_22D8923EC()
{
  return 0x496E776F6E6B6E55;
}

uint64_t sub_22D892474()
{
  return 0x6465746365707845;
}

uint64_t sub_22D892498()
{
  return 0x656C646E61686E55;
}

uint64_t sub_22D8924BC@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v4 = a1 | a2;
  if (!(v4 | v2))
    return 0x61437463656A624FLL;
  if (v2 == 1 && v4 == 0)
    return v3;
  return v3 - 8;
}

unint64_t TimingErrorSubType.typeDescription.getter(uint64_t a1, uint64_t a2)
{
  unint64_t v2;

  v2 = 0xD000000000000019;
  if (a2)
    v2 = 0xD00000000000001BLL;
  if (a2 == 1)
    return 0xD00000000000001CLL;
  else
    return v2;
}

uint64_t UnhandledAbortSubtype.typeDescription.getter(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D8925C4 + 4 * byte_22D8B8ADB[a4]))(0xD000000000000015, 0x800000022D8BE660);
}

uint64_t sub_22D8925C4()
{
  return 0x496E776F6E6B6E55;
}

uint64_t sub_22D8925E8()
{
  return 0x6465746365707845;
}

uint64_t sub_22D89260C()
{
  return 0x656C646E61686E55;
}

uint64_t sub_22D892630@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a1 | v2;
  v5 = v4 | a2;
  if (a2 == 1 && v4 == 0)
    v6 = v3 + 8;
  else
    v6 = v3;
  if (v5)
    return v6;
  else
    return 0x61437463656A624FLL;
}

uint64_t DialogLayerErrorSubType.typeDescription.getter(uint64_t a1, char a2)
{
  if (!a2)
    return 0x65736E6F70736552;
  if (a2 == 1)
    return 0xD000000000000011;
  return 0x726F727245656341;
}

uint64_t ErrorSubType.typeDescription.getter(uint64_t a1, char a2)
{
  if (!a2)
    return 0x45726567616E614DLL;
  if (a2 == 1)
    return 0xD000000000000018;
  return 0x726F727245;
}

void ABCReport.context.getter(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  __asm { BR              X11 }
}

uint64_t sub_22D8927C8()
{
  uint64_t v0;
  unsigned __int8 v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  sub_22D8935EC((uint64_t)v2, v0, v3, v1, (uint64_t (*)(void))sub_22D893628, (uint64_t (*)(void))sub_22D89363C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))sub_22D89359C, sub_22D894008);
  v4 = ErrorSubType.context.getter(v2, v0);
  sub_22D8935EC((uint64_t)v2, v0, v3, v1, (uint64_t (*)(void))sub_22D893524, (uint64_t (*)(void))sub_22D893538, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))sub_22D89354C, sub_22D894004);
  return v4;
}

unint64_t TimingErrorSubType.context.getter(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  result = 0xD000000000000037;
  if (a2)
  {
    if (a2 == 1)
    {
      return 0xD000000000000033;
    }
    else
    {
      sub_22D8B7128();
      sub_22D8B6E70();
      sub_22D8B6E70();
      return 0;
    }
  }
  return result;
}

void UnhandledAbortSubtype.context.getter(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  __asm { BR              X10 }
}

unint64_t sub_22D892A44()
{
  sub_22D8B7128();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE48);
  sub_22D8B6E28();
  sub_22D8B6E70();
  swift_bridgeObjectRelease();
  sub_22D8B6E70();
  return 0xD000000000000019;
}

uint64_t DialogLayerErrorSubType.context.getter(void *a1, uint64_t a2)
{
  return sub_22D892F0C(a1, a2, (void (*)(void))sub_22D894008, (void (*)(void *, uint64_t))sub_22D894004);
}

uint64_t ErrorSubType.context.getter(void *a1, uint64_t a2)
{
  return sub_22D892F0C(a1, a2, (void (*)(void))sub_22D89363C, (void (*)(void *, uint64_t))sub_22D893538);
}

uint64_t sub_22D892F0C(void *a1, uint64_t a2, void (*a3)(void), void (*a4)(void *, uint64_t))
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;

  a3();
  v7 = objc_msgSend(a1, sel_underlyingErrors);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A838);
  v9 = sub_22D8B6EB8();

  v10 = *(_QWORD *)(v9 + 16);
  swift_bridgeObjectRelease();
  sub_22D8B7128();
  swift_bridgeObjectRelease();
  if (v10)
  {
    v11 = objc_msgSend(a1, sel_domain);
    sub_22D8B6E10();

    sub_22D8B6E70();
    swift_bridgeObjectRelease();
    sub_22D8B6E70();
    objc_msgSend(a1, sel_code);
    sub_22D8B7314();
    sub_22D8B6E70();
    swift_bridgeObjectRelease();
    sub_22D8B6E70();
    v12 = objc_msgSend(a1, sel_underlyingErrors);
    a4(a1, a2);
    v13 = sub_22D8B6EB8();

    MEMORY[0x22E319A90](v13, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = objc_msgSend(a1, sel_domain);
    sub_22D8B6E10();

    sub_22D8B6E70();
    swift_bridgeObjectRelease();
    sub_22D8B6E70();
    objc_msgSend(a1, sel_code);
    a4(a1, a2);
    sub_22D8B7314();
  }
  sub_22D8B6E70();
  swift_bridgeObjectRelease();
  return 0x206E69616D6F44;
}

uint64_t sub_22D8931D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return ABCReport.type.getter(a1, a2, a3, *(_BYTE *)(v3 + 24));
}

uint64_t sub_22D8931E0()
{
  uint64_t v0;

  return ABCReport.subType.getter(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

void sub_22D8931F0()
{
  uint64_t v0;

  ABCReport.context.getter(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

unint64_t sub_22D893200(uint64_t a1)
{
  uint64_t v1;

  return TimingErrorSubType.typeDescription.getter(a1, *(_QWORD *)(v1 + 8));
}

unint64_t sub_22D893208()
{
  uint64_t *v0;

  return TimingErrorSubType.context.getter(*v0, v0[1]);
}

uint64_t sub_22D893210(uint64_t a1)
{
  uint64_t v1;

  return ErrorSubType.typeDescription.getter(a1, *(_BYTE *)(v1 + 8));
}

uint64_t sub_22D893218()
{
  uint64_t v0;

  return ErrorSubType.context.getter(*(void **)v0, *(unsigned __int8 *)(v0 + 8));
}

uint64_t sub_22D893224()
{
  uint64_t v0;

  return UnhandledAbortSubtype.typeDescription.getter(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

void sub_22D893234()
{
  uint64_t v0;

  UnhandledAbortSubtype.context.getter(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_22D893244(uint64_t a1)
{
  uint64_t v1;

  return DialogLayerErrorSubType.typeDescription.getter(a1, *(_BYTE *)(v1 + 8));
}

uint64_t sub_22D89324C()
{
  uint64_t v0;

  return DialogLayerErrorSubType.context.getter(*(void **)v0, *(unsigned __int8 *)(v0 + 8));
}

uint64_t sub_22D893258(uint64_t a1, uint64_t a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  if (qword_255D9A350 != -1)
    swift_once();
  if (byte_255D9F6F8 == 1)
  {
    v21 = v5;
    if (qword_255D9A340 != -1)
      swift_once();
    v8 = sub_22D8B6D80();
    __swift_project_value_buffer(v8, (uint64_t)qword_255D9AE18);
    v9 = sub_22D8B6D68();
    v10 = sub_22D8B6FB4();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_22D86F000, v9, v10, "SiriTime initiating AutoBugCapture report...", v11, 2u);
      MEMORY[0x22E31A4BC](v11, -1, -1);
    }

    v24 = a3[1](a2, a3);
    v13 = v12;
    v23 = a3[2](a2, a3);
    v15 = v14;
    v22 = a3[3](a2, a3);
    v17 = v16;
    if (qword_255D9A348 != -1)
      swift_once();
    sub_22D8B6B10();
    swift_allocObject();
    swift_bridgeObjectRetain();
    sub_22D8B6B04();
    v18 = (_QWORD *)swift_allocObject();
    v19 = v23;
    v18[2] = v24;
    v18[3] = v13;
    v18[4] = v19;
    v18[5] = v15;
    v18[6] = v22;
    v18[7] = v17;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_22D8B6AF8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    v5 = v21;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, a2);
}

uint64_t sub_22D893524(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 2)
    return swift_bridgeObjectRelease();
  return result;
}

void sub_22D893538(id a1, unsigned __int8 a2)
{
  if (a2 <= 2u)

}

void sub_22D89354C(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  if (a4 == 3)
  {
    swift_bridgeObjectRelease();

  }
  else if (a4 == 2 || a4 == 1)
  {
    swift_bridgeObjectRelease();
  }
}

id sub_22D89359C(uint64_t a1, uint64_t a2, void *a3, char a4)
{
  id result;

  if (a4 == 3)
  {
    swift_bridgeObjectRetain();
    return a3;
  }
  else if (a4 == 2 || a4 == 1)
  {
    return (id)swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_22D8935EC(uint64_t result, uint64_t a2, uint64_t a3, unsigned __int8 a4, uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(uint64_t, uint64_t, uint64_t, _QWORD), uint64_t (*a8)(void))
{
  switch(a4 >> 4)
  {
    case 0:
      result = a5();
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 9:
      result = a6();
      break;
    case 7:
      result = a7(result, a2, a3, a4 & 0xF);
      break;
    case 8:
      result = a8();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22D893628(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 2)
    return swift_bridgeObjectRetain();
  return result;
}

id sub_22D89363C(id result, unsigned __int8 a2)
{
  if (a2 <= 2u)
    return result;
  return result;
}

ValueMetadata *type metadata accessor for BarbaraWalters()
{
  return &type metadata for BarbaraWalters;
}

uint64_t destroy for ABCReport(uint64_t a1)
{
  return sub_22D8935EC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24), (uint64_t (*)(void))sub_22D893524, (uint64_t (*)(void))sub_22D893538, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))sub_22D89354C, sub_22D894004);
}

uint64_t initializeWithCopy for ABCReport(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_22D8935EC(*(_QWORD *)a2, v4, v5, v6, (uint64_t (*)(void))sub_22D893628, (uint64_t (*)(void))sub_22D89363C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))sub_22D89359C, sub_22D894008);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for ABCReport(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_22D8935EC(*(_QWORD *)a2, v4, v5, v6, (uint64_t (*)(void))sub_22D893628, (uint64_t (*)(void))sub_22D89363C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))sub_22D89359C, sub_22D894008);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_22D8935EC(v7, v8, v9, v10, (uint64_t (*)(void))sub_22D893524, (uint64_t (*)(void))sub_22D893538, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))sub_22D89354C, sub_22D894004);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ABCReport(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_22D8935EC(v5, v7, v6, v8, (uint64_t (*)(void))sub_22D893524, (uint64_t (*)(void))sub_22D893538, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))sub_22D89354C, sub_22D894004);
  return a1;
}

uint64_t getEnumTagSinglePayload for ABCReport(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x16 && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 22);
  v3 = ((*(unsigned __int8 *)(a1 + 24) >> 4) & 0xFFFFFFEF | (16 * ((*(unsigned __int8 *)(a1 + 24) >> 3) & 1))) ^ 0x1F;
  if (v3 >= 0x15)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ABCReport(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x15)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 22;
    if (a3 >= 0x16)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0x16)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = 0;
      *(_BYTE *)(result + 24) = 8 * (((-a2 & 0x10) != 0) - 2 * a2);
    }
  }
  return result;
}

uint64_t sub_22D8938FC(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 24);
  if (v1 <= 0x9F)
    return v1 >> 4;
  else
    return (*(_DWORD *)a1 + 10);
}

uint64_t sub_22D893918(uint64_t result)
{
  *(_BYTE *)(result + 24) &= 0xFu;
  return result;
}

uint64_t sub_22D893928(uint64_t result, unsigned int a2)
{
  if (a2 < 0xA)
  {
    *(_BYTE *)(result + 24) = *(_BYTE *)(result + 24) & 7 | (16 * a2);
  }
  else
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 10;
    *(_BYTE *)(result + 24) = -96;
  }
  return result;
}

ValueMetadata *type metadata accessor for ABCReport()
{
  return &type metadata for ABCReport;
}

unint64_t destroy for TimingErrorSubType(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s16SiriTimeInternal18TimingErrorSubTypeOwCP_0(uint64_t a1, uint64_t a2)
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

_QWORD *assignWithCopy for TimingErrorSubType(_QWORD *a1, _QWORD *a2)
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

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for TimingErrorSubType(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for TimingErrorSubType(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for TimingErrorSubType(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_22D893B88(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_22D893BA0(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for TimingErrorSubType()
{
  return &type metadata for TimingErrorSubType;
}

uint64_t initializeBufferWithCopyOfBuffer for ErrorSubType(uint64_t a1, uint64_t a2)
{
  id v3;
  unsigned __int8 v4;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_22D89363C(*(id *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

void destroy for ErrorSubType(uint64_t a1)
{
  sub_22D893538(*(id *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t *assignWithCopy for ErrorSubType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_22D893EC0(a1, a2, a3, (void (*)(_QWORD, _QWORD))sub_22D89363C, (void (*)(uint64_t, uint64_t))sub_22D893538);
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for ErrorSubType(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  unsigned __int8 v5;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_22D893538(v4, v5);
  return a1;
}

uint64_t sub_22D893C90(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_22D893C98(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ErrorSubType()
{
  return &type metadata for ErrorSubType;
}

void destroy for UnhandledAbortSubtype(uint64_t a1)
{
  sub_22D89354C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t initializeWithCopy for UnhandledAbortSubtype(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_22D89359C(*(_QWORD *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for UnhandledAbortSubtype(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_22D89359C(*(_QWORD *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(void **)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_22D89354C(v7, v8, v9, v10);
  return a1;
}

uint64_t assignWithTake for UnhandledAbortSubtype(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(void **)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_22D89354C(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for UnhandledAbortSubtype(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UnhandledAbortSubtype(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 252;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_22D893E68(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 3u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_22D893E80(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 4;
  if (a2 >= 4)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 4;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for UnhandledAbortSubtype()
{
  return &type metadata for UnhandledAbortSubtype;
}

uint64_t *assignWithCopy for DialogLayerErrorSubType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_22D893EC0(a1, a2, a3, (void (*)(_QWORD, _QWORD))sub_22D894008, (void (*)(uint64_t, uint64_t))sub_22D894004);
}

uint64_t *sub_22D893EC0(uint64_t *a1, uint64_t *a2, uint64_t a3, void (*a4)(_QWORD, _QWORD), void (*a5)(uint64_t, uint64_t))
{
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  uint64_t v10;

  v7 = *a2;
  v8 = *((_BYTE *)a2 + 8);
  a4(*a2, v8);
  v9 = *a1;
  *a1 = v7;
  v10 = *((unsigned __int8 *)a1 + 8);
  *((_BYTE *)a1 + 8) = v8;
  a5(v9, v10);
  return a1;
}

uint64_t _s16SiriTimeInternal12ErrorSubTypeOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s16SiriTimeInternal12ErrorSubTypeOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for DialogLayerErrorSubType()
{
  return &type metadata for DialogLayerErrorSubType;
}

uint64_t sub_22D893FB0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_22D893FE4(uint64_t a1)
{
  uint64_t v1;

  sub_22D891BDC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

Swift::String __swiftcall String.labelCapitalization()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  Swift::String result;

  v2 = v1;
  v3 = v0;
  swift_bridgeObjectRetain();
  sub_22D88A750(1);
  swift_bridgeObjectRelease();
  v4 = sub_22D8B7038();
  v6 = v5;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22D88A7D8(1uLL, v3, v2);
  swift_bridgeObjectRelease();
  sub_22D88A874();
  swift_bridgeObjectRetain();
  sub_22D8B6E64();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = v4;
  v8 = v6;
  result._object = v8;
  result._countAndFlagsBits = v7;
  return result;
}

id String.toINSpeakableString.getter()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDDA1A0]);
  swift_bridgeObjectRetain();
  v1 = (void *)sub_22D8B6E04();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithSpokenPhrase_, v1);

  return v2;
}

uint64_t DateTime.asDate()@<X0>(uint64_t a1@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v15;

  v2 = sub_22D8B5D0C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A938);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_22D8B5B5C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  DateTime.dateComponentsIn24HourClock(shouldUseInferredMeridiem:)(1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_22D8740E0((uint64_t)v8, &qword_255D9A938);
    v13 = sub_22D8B5BF8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a1, 1, 1, v13);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    sub_22D8B5CE8();
    sub_22D8B5CC4();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
}

uint64_t sub_22D89432C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9AE50);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9AE50);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t UsoEntity_common_RecurringDateTime.toDateTimeWithMeridiemSetByUser()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE68);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_22D8B6810();
  if (!sub_22D8B6AA4())
  {
    v5 = sub_22D8B6A38();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v2, 1, 1, v5);
    goto LABEL_6;
  }
  sub_22D8B6A44();
  swift_release();
  v4 = sub_22D8B6A38();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4) == 1)
  {
LABEL_6:
    sub_22D8740E0((uint64_t)v2, &qword_255D9AE68);
    return v3;
  }
  sub_22D8740E0((uint64_t)v2, &qword_255D9AE68);
  if (sub_22D8B6AA4())
  {
    sub_22D8B69FC();
    swift_release();
  }
  return v3;
}

uint64_t TerminalElement.DateTimeValue.toDateTimeWithMeridiemSetByUser()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE68);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_22D8B63A8();
  if (!sub_22D8B6AA4())
  {
    v5 = sub_22D8B6A38();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v2, 1, 1, v5);
    goto LABEL_6;
  }
  sub_22D8B6A44();
  swift_release();
  v4 = sub_22D8B6A38();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4) == 1)
  {
LABEL_6:
    sub_22D8740E0((uint64_t)v2, &qword_255D9AE68);
    return v3;
  }
  sub_22D8740E0((uint64_t)v2, &qword_255D9AE68);
  if (sub_22D8B6AA4())
  {
    sub_22D8B69FC();
    swift_release();
  }
  return v3;
}

uint64_t TerminalElement.Time.toDateTimeWithMeridiemSetByUser()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE68);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v7 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_22D8946FC();
  if (!v3)
    return v3;
  if (!sub_22D8B6AA4())
  {
    v5 = sub_22D8B6A38();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v2, 1, 1, v5);
    goto LABEL_7;
  }
  sub_22D8B6A44();
  swift_release();
  v4 = sub_22D8B6A38();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v2, 1, v4) == 1)
  {
LABEL_7:
    sub_22D8740E0((uint64_t)v2, &qword_255D9AE68);
    return v3;
  }
  sub_22D8740E0((uint64_t)v2, &qword_255D9AE68);
  if (sub_22D8B6AA4())
  {
    sub_22D8B69FC();
    swift_release();
  }
  return v3;
}

uint64_t sub_22D8946FC()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  void (*v21)(char *, uint64_t, uint64_t);
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void (*v41)(unint64_t, _QWORD, uint64_t);
  char v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  char *v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  void (*v64)(char *, uint64_t);
  void (*v65)(char *, uint64_t);
  uint64_t v66;
  uint64_t v68;
  uint64_t v69;
  uint8_t *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  os_log_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;

  v76 = sub_22D8B5B5C();
  v80 = *(_QWORD *)(v76 - 8);
  v1 = MEMORY[0x24BDAC7A8](v76);
  v71 = (char *)&v70 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v85 = (char *)&v70 - v3;
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A900);
  MEMORY[0x24BDAC7A8](v77);
  v78 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_22D8B5BF8();
  v5 = *(_QWORD *)(v82 - 8);
  v6 = MEMORY[0x24BDAC7A8](v82);
  v73 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v70 - v8;
  v10 = sub_22D8B5D0C();
  v74 = *(_QWORD *)(v10 - 8);
  v75 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v83 = (char *)&v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_22D8B63C0();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v70 - v17;
  if (qword_255D9A358 != -1)
    swift_once();
  v19 = sub_22D8B6D80();
  v20 = __swift_project_value_buffer(v19, (uint64_t)qword_255D9AE50);
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v72 = v0;
  v21(v18, v0, v12);
  v79 = v20;
  v22 = sub_22D8B6D68();
  v23 = sub_22D8B6FC0();
  v24 = os_log_type_enabled(v22, v23);
  v84 = v5;
  v81 = v9;
  if (v24)
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v87 = v26;
    *(_DWORD *)v25 = 136315138;
    v70 = v25 + 4;
    v21(v16, (uint64_t)v18, v12);
    v27 = sub_22D8B6E28();
    v86 = sub_22D8755FC(v27, v28, &v87);
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    _os_log_impl(&dword_22D86F000, v22, v23, "TerminalElement.Time converting to DateTime: %s", v25, 0xCu);
    swift_arrayDestroy();
    v29 = v26;
    v9 = v81;
    MEMORY[0x22E31A4BC](v29, -1, -1);
    v30 = v25;
    v5 = v84;
    MEMORY[0x22E31A4BC](v30, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
  }

  v31 = v83;
  sub_22D8B5CE8();
  v32 = v82;
  v33 = (uint64_t)v78;
  if (qword_255D9A318 != -1)
    swift_once();
  v34 = __swift_project_value_buffer(v77, (uint64_t)qword_255D9F6D0);
  sub_22D8782E4(v34, v33);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v33, 1, v32) == 1)
  {
    sub_22D8740E0(v33, &qword_255D9A900);
    sub_22D8B5BEC();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v9, v33, v32);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE90);
  v35 = sub_22D8B5D00();
  v36 = *(_QWORD *)(v35 - 8);
  v37 = *(_QWORD *)(v36 + 72);
  v38 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  v39 = swift_allocObject();
  *(_OWORD *)(v39 + 16) = xmmword_22D8B82B0;
  v40 = v39 + v38;
  v41 = *(void (**)(unint64_t, _QWORD, uint64_t))(v36 + 104);
  v41(v40, *MEMORY[0x24BDCF240], v35);
  v41(v40 + v37, *MEMORY[0x24BDCF250], v35);
  v41(v40 + 2 * v37, *MEMORY[0x24BDCF220], v35);
  sub_22D8A597C(v39);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  sub_22D8B5CA0();
  swift_bridgeObjectRelease();
  sub_22D8B5AA8();
  if ((v42 & 1) != 0 || (sub_22D8B5AFC(), (v43 & 1) != 0) || (v44 = sub_22D8B5AE4(), (v45 & 1) != 0))
  {
    v56 = v84;
    v57 = v73;
    (*(void (**)(char *, char *, uint64_t))(v84 + 16))(v73, v9, v32);
    v58 = sub_22D8B6D68();
    v59 = sub_22D8B6FB4();
    if (os_log_type_enabled(v58, v59))
    {
      v60 = (uint8_t *)swift_slowAlloc();
      v61 = swift_slowAlloc();
      v87 = v61;
      *(_DWORD *)v60 = 136315138;
      sub_22D879430(&qword_255D9A920, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], MEMORY[0x24BDCE988]);
      v62 = sub_22D8B7314();
      v86 = sub_22D8755FC(v62, v63, &v87);
      sub_22D8B7044();
      swift_bridgeObjectRelease();
      v64 = *(void (**)(char *, uint64_t))(v84 + 8);
      v64(v57, v32);
      _os_log_impl(&dword_22D86F000, v58, v59, "Unable to parse date from defaultAnchorDate: %s", v60, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v61, -1, -1);
      MEMORY[0x22E31A4BC](v60, -1, -1);

      (*(void (**)(char *, uint64_t))(v80 + 8))(v85, v76);
      v64(v81, v32);
      (*(void (**)(char *, uint64_t))(v74 + 8))(v83, v75);
    }
    else
    {

      v65 = *(void (**)(char *, uint64_t))(v56 + 8);
      v65(v57, v32);
      (*(void (**)(char *, uint64_t))(v80 + 8))(v85, v76);
      v65(v9, v32);
      (*(void (**)(char *, uint64_t))(v74 + 8))(v31, v75);
    }
    return 0;
  }
  else
  {
    v78 = (char *)v44;
    v46 = v80;
    v47 = v71;
    v48 = v76;
    (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v71, v85, v76);
    v49 = sub_22D8B6D68();
    v50 = sub_22D8B6FC0();
    if (os_log_type_enabled(v49, v50))
    {
      v79 = v49;
      v51 = (uint8_t *)swift_slowAlloc();
      v52 = swift_slowAlloc();
      v87 = v52;
      *(_DWORD *)v51 = 136315138;
      sub_22D879430(&qword_255D9A918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
      v53 = sub_22D8B7314();
      v86 = sub_22D8755FC(v53, v54, &v87);
      v31 = v83;
      sub_22D8B7044();
      swift_bridgeObjectRelease();
      v55 = *(void (**)(char *, uint64_t))(v80 + 8);
      v55(v47, v48);
      v49 = v79;
      _os_log_impl(&dword_22D86F000, v79, v50, "Extracted date components from anchor: %s", v51, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v52, -1, -1);
      MEMORY[0x22E31A4BC](v51, -1, -1);
    }
    else
    {
      v55 = *(void (**)(char *, uint64_t))(v46 + 8);
      v55(v47, v48);
    }

    v69 = v74;
    v68 = v75;
    sub_22D8B69D8();
    swift_allocObject();
    sub_22D8B69CC();
    sub_22D8B63B4();
    sub_22D8B6AB0();
    swift_allocObject();
    v66 = sub_22D8B699C();
    v55(v85, v48);
    (*(void (**)(char *, uint64_t))(v84 + 8))(v81, v82);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v31, v68);
  }
  return v66;
}

uint64_t DateTime.dateComponentsIn24HourClock(shouldUseInferredMeridiem:)@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint8_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  os_log_type_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  char v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t result;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  int v89;
  char *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96[4];

  v89 = a1;
  v93 = a2;
  v3 = sub_22D8B6A38();
  v88 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v86 = (char *)&v78 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v78 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A908);
  MEMORY[0x24BDAC7A8](v8);
  v90 = (char *)&v78 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A910);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v78 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_22D8B5B5C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v78 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE68);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v87 = (char *)&v78 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v78 - v20;
  v91 = v2;
  if (!sub_22D8B6AA4())
  {
    if (qword_255D9A358 != -1)
      swift_once();
    v25 = sub_22D8B6D80();
    __swift_project_value_buffer(v25, (uint64_t)qword_255D9AE50);
    v26 = sub_22D8B6D68();
    v27 = sub_22D8B6FC0();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v28 = 0;
      _os_log_impl(&dword_22D86F000, v26, v27, "dateComponentsIn24HourClock: Can NOT get time from inferred dateTime.", v28, 2u);
      MEMORY[0x22E31A4BC](v28, -1, -1);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v93, 1, 1, v13);
  }
  v82 = v7;
  v84 = v3;
  v92 = v16;
  v22 = sub_22D8B6A20();
  if ((v23 & 1) != 0)
  {
    if (qword_255D9A358 != -1)
      swift_once();
    v29 = sub_22D8B6D80();
    __swift_project_value_buffer(v29, (uint64_t)qword_255D9AE50);
    v30 = sub_22D8B6D68();
    v31 = sub_22D8B6FC0();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = v14;
      v33 = v13;
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_22D86F000, v30, v31, "dateComponentsIn24HourClock: Inferring 0 for undefined minutes", v34, 2u);
      v35 = v34;
      v13 = v33;
      v14 = v32;
      MEMORY[0x22E31A4BC](v35, -1, -1);
    }

    v24 = 0;
  }
  else
  {
    v24 = v22;
  }
  v36 = sub_22D8B6A14();
  if ((v37 & 1) != 0)
  {
    if (qword_255D9A358 != -1)
      swift_once();
    v52 = sub_22D8B6D80();
    __swift_project_value_buffer(v52, (uint64_t)qword_255D9AE50);
    v53 = sub_22D8B6D68();
    v54 = sub_22D8B6FB4();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v55 = 0;
      _os_log_impl(&dword_22D86F000, v53, v54, "dateComponentsIn24HourClock: Can't parse inferred dateTime, inferred dateTime has no valid hour/minute.", v55, 2u);
      MEMORY[0x22E31A4BC](v55, -1, -1);
      swift_release();

    }
    else
    {

      swift_release();
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v93, 1, 1, v13);
  }
  v38 = v36;
  v85 = v24;
  if (qword_255D9A358 != -1)
    swift_once();
  v39 = sub_22D8B6D80();
  v40 = __swift_project_value_buffer(v39, (uint64_t)qword_255D9AE50);
  swift_retain_n();
  v81 = v40;
  v41 = sub_22D8B6D68();
  v42 = sub_22D8B6FC0();
  v43 = os_log_type_enabled(v41, v42);
  v83 = v38;
  if (v43)
  {
    v44 = swift_slowAlloc();
    v79 = v14;
    v45 = v44;
    v78 = swift_slowAlloc();
    v96[0] = v78;
    *(_DWORD *)v45 = 134218754;
    v95 = v38;
    v80 = v13;
    sub_22D8B7044();
    *(_WORD *)(v45 + 12) = 2048;
    v95 = v85;
    sub_22D8B7044();
    *(_WORD *)(v45 + 22) = 2080;
    v46 = v42;
    sub_22D8B6A44();
    v47 = sub_22D8B7020();
    v49 = v48;
    sub_22D8740E0((uint64_t)v21, &qword_255D9AE68);
    v95 = sub_22D8755FC(v47, v49, v96);
    v13 = v80;
    sub_22D8B7044();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 32) = 1024;
    LOBYTE(v47) = sub_22D8B69F0();
    swift_release();
    LODWORD(v95) = v47 & 1;
    sub_22D8B7044();
    swift_release();
    _os_log_impl(&dword_22D86F000, v41, v46, "dateComponentsIn24HourClock: Hour = %ld, minute = %ld, meridiem = %s, meridiemSetByUser = %{BOOL}d", (uint8_t *)v45, 0x26u);
    v50 = v78;
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v50, -1, -1);
    v51 = v45;
    v14 = v79;
    MEMORY[0x22E31A4BC](v51, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v56 = v92;
  v57 = sub_22D8B5D0C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v12, 1, 1, v57);
  v58 = sub_22D8B5D24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v90, 1, 1, v58);
  sub_22D8B5B50();
  if (sub_22D8B6A98())
  {
    sub_22D8B69C0();
    if ((v59 & 1) == 0)
      sub_22D8B5B08();
    sub_22D8B69A8();
    if ((v60 & 1) == 0)
      sub_22D8B5AB4();
    sub_22D8B69B4();
    if ((v61 & 1) == 0)
      sub_22D8B5AF0();
    swift_release();
  }
  sub_22D8B5B14();
  if ((sub_22D8B69F0() & 1) == 0 && (v89 & 1) == 0 || !v83 || (unint64_t)(v83 - 13) <= 0xA || v83 == 24)
    goto LABEL_34;
  v70 = v87;
  sub_22D8B6A44();
  v71 = (uint64_t)v70;
  v72 = v88;
  v73 = v84;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v88 + 48))(v71, 1, v84) == 1)
  {
    sub_22D8740E0(v71, &qword_255D9AE68);
LABEL_34:
    sub_22D8B5AD8();
    goto LABEL_35;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v72 + 32))(v82, v71, v73);
  v74 = v86;
  (*(void (**)(char *, _QWORD, uint64_t))(v72 + 104))(v86, *MEMORY[0x24BE93F70], v73);
  sub_22D879430(&qword_255D9AE80, (uint64_t (*)(uint64_t))MEMORY[0x24BE93F78], MEMORY[0x24BE93F88]);
  sub_22D8B6E94();
  sub_22D8B6E94();
  v75 = v96[0];
  v76 = v95;
  v77 = *(void (**)(char *, uint64_t))(v72 + 8);
  v77(v74, v73);
  if (v75 == v76 && v83 != 12)
  {
    result = v83 + 12;
    if (__OFADD__(v83, 12))
    {
      __break(1u);
      return result;
    }
  }
  sub_22D8B5AD8();
  v77(v82, v84);
LABEL_35:
  v62 = sub_22D8B6D68();
  v63 = sub_22D8B6FC0();
  if (os_log_type_enabled(v62, v63))
  {
    v64 = (uint8_t *)swift_slowAlloc();
    v65 = swift_slowAlloc();
    v96[0] = v65;
    *(_DWORD *)v64 = 136315138;
    swift_beginAccess();
    sub_22D879430(&qword_255D9A918, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
    v66 = sub_22D8B7314();
    v94 = sub_22D8755FC(v66, v67, v96);
    v56 = v92;
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v62, v63, "dateComponentsIn24HourClock: Got dateComponents: %s", v64, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v65, -1, -1);
    MEMORY[0x22E31A4BC](v64, -1, -1);
    swift_release();

  }
  else
  {

    swift_release();
  }
  swift_beginAccess();
  v69 = v93;
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 16))(v93, v56, v13);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(v69, 0, 1, v13);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v56, v13);
}

INDateComponentsRange_optional __swiftcall DateTime.toINAlarmSearchDateTime(isTimeRange:)(Swift::Bool isTimeRange)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  INDateComponentsRange_optional v17;
  uint64_t v18;

  if (isTimeRange)
  {
    if (qword_255D9A358 != -1)
      swift_once();
    v1 = sub_22D8B6D80();
    __swift_project_value_buffer(v1, (uint64_t)qword_255D9AE50);
    swift_retain_n();
    v2 = sub_22D8B6D68();
    v3 = sub_22D8B6FC0();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      v5 = swift_slowAlloc();
      v18 = v5;
      *(_DWORD *)v4 = 136315138;
      if (sub_22D8B6A80())
      {
        v6 = sub_22D8B6A5C();
        v8 = v7;
        swift_release();
      }
      else
      {
        v6 = 0;
        v8 = 0xE000000000000000;
      }
      sub_22D8755FC(v6, v8, &v18);
      sub_22D8B7044();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D86F000, v2, v3, "Found time range info from SiriInference: %s", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v5, -1, -1);
      MEMORY[0x22E31A4BC](v4, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v17.value = DateTime.asDateComponentsRange()();
  }
  else
  {
    if (qword_255D9A358 != -1)
      swift_once();
    v9 = sub_22D8B6D80();
    __swift_project_value_buffer(v9, (uint64_t)qword_255D9AE50);
    swift_retain_n();
    v10 = sub_22D8B6D68();
    v11 = sub_22D8B6FC0();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v18 = v13;
      *(_DWORD *)v12 = 136315138;
      if (sub_22D8B6AA4())
      {
        v14 = sub_22D8B69E4();
        v16 = v15;
        swift_release();
      }
      else
      {
        v14 = 0;
        v16 = 0xE000000000000000;
      }
      sub_22D8755FC(v14, v16, &v18);
      sub_22D8B7044();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D86F000, v10, v11, "Found time point info from SiriInference: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v13, -1, -1);
      MEMORY[0x22E31A4BC](v12, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    return DateTime.asTimePoint(shouldUseInferredMeridiem:insertToEndTime:)(0, 0);
  }
  return v17;
}

Swift::Bool __swiftcall DateTime.isValidForReformationFromTimer()()
{
  uint64_t v0;
  char v1;
  char v2;

  v0 = sub_22D8B6AA4();
  if (v0)
  {
    sub_22D8B6A14();
    v2 = v1;
    swift_release();
    LOBYTE(v0) = (v2 & 1) == 0;
  }
  return v0;
}

uint64_t DateTime.Time.dateComponents()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A908);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A910);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22D8B5D0C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = sub_22D8B5D24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v2, 1, 1, v7);
  sub_22D879228(0);
  sub_22D8B6A20();
  sub_22D8B6A2C();
  return sub_22D8B5B50();
}

uint64_t sub_22D896044()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9AE98);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9AE98);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t YesNoSearchWindowStrategy.__allocating_init(manifest:responseGenerator:rejectionOutputProducer:cancellationOutputProducer:nlv3ActionForInput:nlv3ParseConfirmation:promptPatternExecutionProducer:)(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;

  v18 = swift_allocObject();
  v19 = v18 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_manifest;
  v20 = sub_22D8B6114();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19, a1, v20);
  sub_22D874D04(a2, v18 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_responseGenerator);
  v21 = (_QWORD *)(v18 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_rejectionOutputProducer);
  *v21 = a3;
  v21[1] = a4;
  v22 = (_QWORD *)(v18 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_cancellationOutputProducer);
  *v22 = a5;
  v22[1] = a6;
  v23 = (_QWORD *)(v18 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_nlv3ActionForInput);
  *v23 = a7;
  v23[1] = a8;
  v24 = (_QWORD *)(v18 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_nlv3ParseConfirmation);
  *v24 = a9;
  v24[1] = a10;
  v25 = (_QWORD *)(v18 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_promptPatternExecutionProducer);
  *v25 = a11;
  v25[1] = a12;
  return v18;
}

uint64_t YesNoSearchWindowStrategy.init(manifest:responseGenerator:rejectionOutputProducer:cancellationOutputProducer:nlv3ActionForInput:nlv3ParseConfirmation:promptPatternExecutionProducer:)(uint64_t a1, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;

  v19 = v12 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_manifest;
  v20 = sub_22D8B6114();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19, a1, v20);
  sub_22D874D04(a2, v12 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_responseGenerator);
  v21 = (_QWORD *)(v12 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_rejectionOutputProducer);
  *v21 = a3;
  v21[1] = a4;
  v22 = (_QWORD *)(v12 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_cancellationOutputProducer);
  *v22 = a5;
  v22[1] = a6;
  v23 = (_QWORD *)(v12 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_nlv3ActionForInput);
  *v23 = a7;
  v23[1] = a8;
  v24 = (_QWORD *)(v12 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_nlv3ParseConfirmation);
  *v24 = a9;
  v24[1] = a10;
  v25 = (_QWORD *)(v12 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_promptPatternExecutionProducer);
  *v25 = a11;
  v25[1] = a12;
  return v12;
}

uint64_t YesNoSearchWindowStrategy.makePromptForYesNoResponse()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_22D896334()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  v3 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)(v0 + 24)
                                    + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_promptPatternExecutionProducer)
                         + *(_QWORD *)(*(_QWORD *)(v0 + 24)
                                     + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_promptPatternExecutionProducer));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_22D896398;
  return v3();
}

uint64_t sub_22D896398(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 40) = a1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_22D89640C()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_responseGenerator), *(_QWORD *)(*(_QWORD *)(v0 + 24)+ OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_responseGenerator+ 24));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v1;
  *v1 = v0;
  v1[1] = sub_22D8964A0;
  return sub_22D8B606C();
}

uint64_t sub_22D8964A0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D896504()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D896538()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t YesNoSearchWindowStrategy.actionForInput(_:)@<X0>(uint64_t a1@<X8>)
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  int v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(char *, uint64_t);
  char *v43;
  uint64_t v44;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char v59;
  void (*v60)(char *, uint64_t);
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(char *, uint64_t);
  uint64_t v66;
  void (*v67)(char *, uint64_t);
  unint64_t v68;
  uint64_t v69;
  void (*v70)(char *, unint64_t, uint64_t);
  char *v71;
  uint64_t v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(char *, uint64_t);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  void (*v96)(char *, unint64_t, uint64_t);
  char *v97;
  uint64_t v98;
  char v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  void (*v107)(char *, unint64_t, uint64_t);
  char v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  void (*v118)(char *, uint64_t);
  uint64_t v119;
  char v120;
  uint64_t v121;
  char *v122;
  char *v123;
  char *v124;
  char *v125;
  char *v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  char *v134;
  char *v135;
  uint64_t v136;
  char *v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;

  v143 = a1;
  v133 = sub_22D8B6198();
  v136 = *(_QWORD *)(v133 - 8);
  v1 = MEMORY[0x24BDAC7A8](v133);
  v125 = (char *)&v121 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v135 = (char *)&v121 - v3;
  v4 = sub_22D8B6288();
  v139 = *(_QWORD *)(v4 - 8);
  v140 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v124 = (char *)&v121 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v134 = (char *)&v121 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v137 = (char *)&v121 - v9;
  v130 = sub_22D8B61F8();
  v127 = *(_QWORD *)(v130 - 8);
  v10 = MEMORY[0x24BDAC7A8](v130);
  v123 = (char *)&v121 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v126 = (char *)&v121 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v138 = (char *)&v121 - v14;
  v129 = sub_22D8B61C8();
  v131 = *(_QWORD *)(v129 - 8);
  MEMORY[0x24BDAC7A8](v129);
  v132 = (char *)&v121 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_22D8B61A4();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v121 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v121 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v121 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)&v121 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)&v121 - v30;
  v141 = sub_22D8B68F4();
  v32 = *(_QWORD *)(v141 - 8);
  MEMORY[0x24BDAC7A8](v141);
  v34 = (char *)&v121 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D8B615C();
  v35 = v16;
  v36 = (*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v31, v16);
  if (v36 != *MEMORY[0x24BE98E08])
  {
    v37 = v29;
    v38 = v138;
    v122 = v23;
    v39 = v139;
    v128 = v31;
    if (v36 == *MEMORY[0x24BE98E90])
    {
      v31 = v128;
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v128, v35);
      (*(void (**)(char *, uint64_t))(v17 + 96))(v20, v35);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AEF0);
      swift_release();
      goto LABEL_5;
    }
    if (v36 == *MEMORY[0x24BE98E88])
    {
      v46 = v122;
      v47 = v128;
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v122, v128, v35);
      v48 = v35;
      (*(void (**)(char *, uint64_t))(v17 + 96))(v46, v35);
      v49 = v133;
      (*(void (**)(char *, char *, uint64_t))(v136 + 16))(v135, v46, v133);
      v50 = sub_22D8B6180();
      v52 = v51;
      v53 = (void *)sub_22D8B5E5C();
      v54 = objc_msgSend(v53, sel_identifier);

      v55 = sub_22D8B6E10();
      v57 = v56;

      if (v50 == v55 && v52 == v57)
      {
        swift_bridgeObjectRelease_n();
LABEL_16:
        sub_22D8B5F58();
        v60 = *(void (**)(char *, uint64_t))(v136 + 8);
        v60(v135, v49);
        v60(v122, v49);
        return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v47, v48);
      }
      v59 = sub_22D8B73F8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v59 & 1) != 0)
        goto LABEL_16;
      v78 = v49;
      v79 = v17;
      v80 = *(void (**)(char *, uint64_t))(v136 + 8);
      v80(v135, v78);
      v81 = sub_22D8B6180();
      v83 = v82;
      v84 = (void *)sub_22D8B5E74();
      v85 = objc_msgSend(v84, sel_identifier);

      v86 = sub_22D8B6E10();
      v88 = v87;

      if (v81 == v86 && v83 == v88)
      {
        v17 = v79;
        v89 = v133;
        v90 = v122;
LABEL_26:
        swift_bridgeObjectRelease_n();
        goto LABEL_33;
      }
      v91 = sub_22D8B73F8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v91 & 1) != 0)
      {
        v17 = v79;
        v89 = v133;
        v90 = v122;
LABEL_33:
        v80(v90, v89);
        (*(void (**)(char *, uint64_t))(v17 + 8))(v47, v48);
        return sub_22D8B5F64();
      }
      (*(void (**)(char *, char *, uint64_t))(v136 + 32))(v125, v122, v133);
      v109 = sub_22D8B6180();
      v111 = v110;
      v112 = (void *)sub_22D8B5E68();
      v113 = objc_msgSend(v112, sel_identifier);

      v114 = sub_22D8B6E10();
      v116 = v115;

      if (v109 == v114 && v111 == v116)
      {
        v90 = v125;
        v17 = v79;
        v89 = v133;
        goto LABEL_26;
      }
      v120 = sub_22D8B73F8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v17 = v79;
      v89 = v133;
      if ((v120 & 1) != 0)
      {
        v90 = v125;
        goto LABEL_33;
      }
      v80(v125, v133);
      v35 = v48;
      goto LABEL_61;
    }
    if (v36 == *MEMORY[0x24BE98E10])
    {
      v58 = v128;
      (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v26, v128, v35);
      (*(void (**)(char *, uint64_t))(v17 + 96))(v26, v35);
      objc_opt_self();
      if (swift_dynamicCastObjCClass())
      {
        sub_22D8B5F58();
        swift_unknownObjectRelease();
        v42 = *(uint64_t (**)(char *, uint64_t))(v17 + 8);
        v43 = v58;
LABEL_62:
        v44 = v35;
        return v42(v43, v44);
      }
      objc_opt_self();
      if (swift_dynamicCastObjCClass() || (objc_opt_self(), swift_dynamicCastObjCClass()))
      {
        (*(void (**)(char *, uint64_t))(v17 + 8))(v58, v35);
        swift_unknownObjectRelease();
        return sub_22D8B5F64();
      }
      swift_unknownObjectRelease();
LABEL_61:
      sub_22D8B5F70();
      v42 = *(uint64_t (**)(char *, uint64_t))(v17 + 8);
      v43 = v128;
      goto LABEL_62;
    }
    if (v36 != *MEMORY[0x24BE98E98])
      goto LABEL_61;
    v61 = v37;
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v37, v128, v35);
    v141 = v17;
    v142 = v35;
    (*(void (**)(char *, uint64_t))(v17 + 96))(v61, v35);
    v62 = v132;
    v63 = v129;
    (*(void (**)(char *, char *, uint64_t))(v131 + 32))(v132, v61, v129);
    sub_22D8B61BC();
    v64 = sub_22D8B61EC();
    v65 = *(void (**)(char *, uint64_t))(v127 + 8);
    v65(v38, v130);
    v66 = *(_QWORD *)(v64 + 16);
    if (v66)
    {
      v67 = v65;
      v68 = v64 + ((*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80));
      v69 = *(_QWORD *)(v39 + 72);
      v70 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 16);
      swift_bridgeObjectRetain();
      v71 = v137;
      v72 = v140;
      while (1)
      {
        v70(v71, v68, v72);
        v73 = sub_22D8B6234();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v71, v72);
        if ((v73 & 1) != 0)
          break;
        v68 += v69;
        if (!--v66)
        {
          swift_bridgeObjectRelease_n();
          v63 = v129;
          v74 = v130;
          v75 = v140;
          v76 = v39;
          v62 = v132;
          v77 = v126;
          v65 = v67;
          goto LABEL_35;
        }
      }
      swift_bridgeObjectRelease_n();
      sub_22D8B5F64();
      (*(void (**)(char *, uint64_t))(v131 + 8))(v132, v129);
      return (*(uint64_t (**)(char *, uint64_t))(v141 + 8))(v128, v142);
    }
    swift_bridgeObjectRelease();
    v75 = v140;
    v76 = v39;
    v74 = v130;
    v77 = v126;
LABEL_35:
    sub_22D8B61BC();
    v92 = sub_22D8B61EC();
    v65(v77, v74);
    v93 = *(_QWORD *)(v92 + 16);
    if (v93)
    {
      v138 = (char *)v65;
      v94 = v92 + ((*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80));
      v95 = *(_QWORD *)(v76 + 72);
      v96 = *(void (**)(char *, unint64_t, uint64_t))(v76 + 16);
      swift_bridgeObjectRetain();
      v97 = v134;
      v98 = v140;
      while (1)
      {
        v96(v97, v94, v98);
        v99 = sub_22D8B6240();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v97, v98);
        if ((v99 & 1) != 0)
          break;
        v94 += v95;
        if (!--v93)
        {
          swift_bridgeObjectRelease_n();
          v75 = v140;
          v76 = v39;
          v62 = v132;
          v100 = v123;
          v101 = v124;
          v74 = v130;
          v65 = (void (*)(char *, uint64_t))v138;
          goto LABEL_42;
        }
      }
      swift_bridgeObjectRelease_n();
      sub_22D8B5F64();
      v117 = v132;
      v118 = *(void (**)(char *, uint64_t))(v131 + 8);
    }
    else
    {
      swift_bridgeObjectRelease();
      v100 = v123;
      v101 = v124;
LABEL_42:
      sub_22D8B61BC();
      v102 = sub_22D8B61EC();
      v65(v100, v74);
      v103 = *(_QWORD *)(v102 + 16);
      if (v103)
      {
        v104 = v63;
        v105 = v102 + ((*(unsigned __int8 *)(v76 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v76 + 80));
        v106 = *(_QWORD *)(v76 + 72);
        v107 = *(void (**)(char *, unint64_t, uint64_t))(v76 + 16);
        swift_bridgeObjectRetain();
        while (1)
        {
          v107(v101, v105, v75);
          v108 = sub_22D8B624C();
          (*(void (**)(char *, uint64_t))(v76 + 8))(v101, v75);
          if ((v108 & 1) != 0)
            break;
          v105 += v106;
          if (!--v103)
          {
            swift_bridgeObjectRelease_n();
            v62 = v132;
            v63 = v104;
            goto LABEL_52;
          }
        }
        swift_bridgeObjectRelease_n();
        sub_22D8B5F58();
        v117 = v132;
        v118 = *(void (**)(char *, uint64_t))(v131 + 8);
        v119 = v104;
        goto LABEL_55;
      }
      swift_bridgeObjectRelease();
LABEL_52:
      sub_22D8B5F70();
      v118 = *(void (**)(char *, uint64_t))(v131 + 8);
      v117 = v62;
    }
    v119 = v63;
LABEL_55:
    v118(v117, v119);
    return (*(uint64_t (**)(char *, uint64_t))(v141 + 8))(v128, v142);
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v20, v31, v16);
  (*(void (**)(char *, uint64_t))(v17 + 96))(v20, v16);
LABEL_5:
  v40 = v142;
  v41 = v141;
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v34, v20, v141);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v31, v35);
  (*(void (**)(char *))(v40 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_nlv3ActionForInput))(v34);
  v42 = *(uint64_t (**)(char *, uint64_t))(v32 + 8);
  v43 = v34;
  v44 = v41;
  return v42(v43, v44);
}

uint64_t YesNoSearchWindowStrategy.parseConfirmationResponse(input:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v4 = sub_22D8B6198();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  v3[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AF00);
  v3[9] = swift_task_alloc();
  v5 = sub_22D8B6288();
  v3[10] = v5;
  v3[11] = *(_QWORD *)(v5 - 8);
  v3[12] = swift_task_alloc();
  v3[13] = swift_task_alloc();
  v6 = sub_22D8B61F8();
  v3[14] = v6;
  v3[15] = *(_QWORD *)(v6 - 8);
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  v7 = sub_22D8B61C8();
  v3[18] = v7;
  v3[19] = *(_QWORD *)(v7 - 8);
  v3[20] = swift_task_alloc();
  v8 = sub_22D8B61A4();
  v3[21] = v8;
  v3[22] = *(_QWORD *)(v8 - 8);
  v3[23] = swift_task_alloc();
  v3[24] = swift_task_alloc();
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  v3[27] = swift_task_alloc();
  v9 = sub_22D8B68F4();
  v3[28] = v9;
  v3[29] = *(_QWORD *)(v9 - 8);
  v3[30] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22D89722C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
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
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
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
  unsigned int *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t, uint64_t);
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
  void (*v60)(uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, unint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(uint64_t, uint64_t);
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  void (*v101)(uint64_t, unint64_t, uint64_t);
  uint64_t v102;
  uint64_t v103;
  char v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unsigned int *v109;
  uint64_t v110;
  NSObject *v111;
  os_log_type_t v112;
  uint8_t *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  NSObject *v121;
  os_log_type_t v122;
  uint8_t *v123;
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
  uint64_t (*v134)(_QWORD, _QWORD);
  uint64_t v135;
  void (*v136)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 216);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 176);
  sub_22D8B615C();
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v1, v2);
  if (v4 == *MEMORY[0x24BE98E08])
  {
    v6 = *(_QWORD *)(v0 + 176);
    v5 = *(_QWORD *)(v0 + 184);
    v7 = *(_QWORD *)(v0 + 168);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 16))(v5, *(_QWORD *)(v0 + 216), v7);
    (*(void (**)(uint64_t, uint64_t))(v6 + 96))(v5, v7);
LABEL_5:
    v11 = *(_QWORD *)(v0 + 216);
    v12 = *(_QWORD *)(v0 + 176);
    v13 = *(_QWORD *)(v0 + 168);
    v14 = *(_QWORD *)(v0 + 32);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 232) + 32))(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 224));
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    v134 = (uint64_t (*)(_QWORD, _QWORD))(**(int **)(v14
                                                             + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_nlv3ParseConfirmation)
                                                  + *(_QWORD *)(v14
                                                              + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_nlv3ParseConfirmation));
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 248) = v15;
    *v15 = v0;
    v15[1] = sub_22D897CF8;
    return v134(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 240));
  }
  if (v4 == *MEMORY[0x24BE98E90])
  {
    v9 = *(_QWORD *)(v0 + 176);
    v8 = *(_QWORD *)(v0 + 184);
    v10 = *(_QWORD *)(v0 + 168);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 16))(v8, *(_QWORD *)(v0 + 216), v10);
    (*(void (**)(uint64_t, uint64_t))(v9 + 96))(v8, v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AEF0);
    swift_release();
    goto LABEL_5;
  }
  if (v4 == *MEMORY[0x24BE98E88])
  {
    v17 = *(_QWORD *)(v0 + 192);
    v18 = *(_QWORD *)(v0 + 168);
    v19 = *(_QWORD *)(v0 + 176);
    v20 = *(_QWORD *)(v0 + 64);
    v21 = *(_QWORD *)(v0 + 40);
    v22 = *(_QWORD *)(v0 + 48);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v19 + 16))(v17, *(_QWORD *)(v0 + 216), v18);
    (*(void (**)(uint64_t, uint64_t))(v19 + 96))(v17, v18);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v20, v17, v21);
    v23 = sub_22D8B6180();
    v25 = v24;
    v26 = (void *)sub_22D8B5E74();
    v27 = objc_msgSend(v26, sel_identifier);

    v28 = sub_22D8B6E10();
    v30 = v29;

    if (v23 == v28 && v25 == v30)
    {
      swift_bridgeObjectRelease_n();
LABEL_14:
      v40 = *(_QWORD *)(v0 + 192);
      v132 = *(_QWORD *)(v0 + 176);
      v133 = *(_QWORD *)(v0 + 168);
      v135 = *(_QWORD *)(v0 + 216);
      v42 = *(_QWORD *)(v0 + 64);
      v41 = *(_QWORD *)(v0 + 72);
      v44 = *(_QWORD *)(v0 + 40);
      v43 = *(_QWORD *)(v0 + 48);
      v45 = *MEMORY[0x24BE98400];
      v46 = sub_22D8B6078();
      v47 = *(_QWORD *)(v46 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 104))(v41, v45, v46);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v47 + 56))(v41, 0, 1, v46);
      sub_22D8B6150();
      v48 = *(void (**)(uint64_t, uint64_t))(v43 + 8);
      v48(v42, v44);
      v48(v40, v44);
      v49 = *(void (**)(uint64_t, uint64_t))(v132 + 8);
LABEL_53:
      v128 = v133;
      v127 = v135;
      goto LABEL_54;
    }
    v39 = sub_22D8B73F8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v39 & 1) != 0)
      goto LABEL_14;
    v69 = *(_QWORD *)(v0 + 192);
    v70 = *(_QWORD *)(v0 + 56);
    v71 = *(_QWORD *)(v0 + 40);
    v72 = *(_QWORD *)(v0 + 48);
    v73 = *(void (**)(uint64_t, uint64_t))(v72 + 8);
    v73(*(_QWORD *)(v0 + 64), v71);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 32))(v70, v69, v71);
    v74 = sub_22D8B6180();
    v76 = v75;
    v77 = (void *)sub_22D8B5E68();
    v78 = objc_msgSend(v77, sel_identifier);

    v79 = sub_22D8B6E10();
    v81 = v80;

    if (v74 == v79 && v76 == v81)
    {
      swift_bridgeObjectRelease_n();
LABEL_28:
      v86 = *(_QWORD *)(v0 + 176);
      v133 = *(_QWORD *)(v0 + 168);
      v135 = *(_QWORD *)(v0 + 216);
      v87 = *(_QWORD *)(v0 + 72);
      v88 = *(_QWORD *)(v0 + 56);
      v89 = *(_QWORD *)(v0 + 40);
      v90 = v73;
      v91 = *MEMORY[0x24BE983F8];
      v92 = sub_22D8B6078();
      v93 = *(_QWORD *)(v92 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v93 + 104))(v87, v91, v92);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v93 + 56))(v87, 0, 1, v92);
      sub_22D8B6150();
      v90(v88, v89);
LABEL_52:
      v49 = *(void (**)(uint64_t, uint64_t))(v86 + 8);
      goto LABEL_53;
    }
    v85 = sub_22D8B73F8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v85 & 1) != 0)
      goto LABEL_28;
    v73(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 40));
    goto LABEL_44;
  }
  if (v4 != *MEMORY[0x24BE98E10])
  {
    if (v4 == *MEMORY[0x24BE98E98])
    {
      v50 = *(_QWORD *)(v0 + 208);
      v51 = *(_QWORD *)(v0 + 168);
      v52 = *(_QWORD *)(v0 + 176);
      v54 = *(_QWORD *)(v0 + 152);
      v53 = *(_QWORD *)(v0 + 160);
      v56 = *(_QWORD *)(v0 + 136);
      v55 = *(_QWORD *)(v0 + 144);
      v57 = *(_QWORD *)(v0 + 112);
      v58 = *(_QWORD *)(v0 + 120);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v52 + 16))(v50, *(_QWORD *)(v0 + 216), v51);
      (*(void (**)(uint64_t, uint64_t))(v52 + 96))(v50, v51);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 32))(v53, v50, v55);
      sub_22D8B61BC();
      v59 = sub_22D8B61EC();
      v60 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
      v60(v56, v57);
      v61 = *(_QWORD *)(v59 + 16);
      if (v61)
      {
        v136 = v60;
        v62 = *(_QWORD *)(v0 + 88);
        v63 = v59 + ((*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80));
        v64 = *(_QWORD *)(v62 + 72);
        v65 = *(void (**)(uint64_t, unint64_t, uint64_t))(v62 + 16);
        swift_bridgeObjectRetain();
        while (1)
        {
          v66 = *(_QWORD *)(v0 + 104);
          v67 = *(_QWORD *)(v0 + 80);
          v65(v66, v63, v67);
          v68 = sub_22D8B6234();
          (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v66, v67);
          if ((v68 & 1) != 0)
            break;
          v63 += v64;
          if (!--v61)
          {
            swift_bridgeObjectRelease_n();
            v60 = v136;
            goto LABEL_30;
          }
        }
        v86 = *(_QWORD *)(v0 + 176);
        v133 = *(_QWORD *)(v0 + 168);
        v135 = *(_QWORD *)(v0 + 216);
        v105 = *(_QWORD *)(v0 + 152);
        v106 = *(_QWORD *)(v0 + 160);
        v107 = *(_QWORD *)(v0 + 144);
        v108 = *(_QWORD *)(v0 + 72);
        swift_bridgeObjectRelease_n();
        v109 = (unsigned int *)MEMORY[0x24BE98400];
      }
      else
      {
        swift_bridgeObjectRelease();
LABEL_30:
        v94 = *(_QWORD *)(v0 + 128);
        v95 = *(_QWORD *)(v0 + 112);
        sub_22D8B61BC();
        v96 = sub_22D8B61EC();
        v60(v94, v95);
        v97 = *(_QWORD *)(v96 + 16);
        if (!v97)
        {
          swift_bridgeObjectRelease();
LABEL_38:
          if (qword_255D9A360 != -1)
            swift_once();
          v110 = sub_22D8B6D80();
          __swift_project_value_buffer(v110, (uint64_t)qword_255D9AE98);
          v111 = sub_22D8B6D68();
          v112 = sub_22D8B6FA8();
          if (os_log_type_enabled(v111, v112))
          {
            v113 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v113 = 0;
            _os_log_impl(&dword_22D86F000, v111, v112, "Unable to parse a confirmation response from the given USO parse", v113, 2u);
            MEMORY[0x22E31A4BC](v113, -1, -1);
          }
          v34 = *(_QWORD *)(v0 + 216);
          v35 = *(_QWORD *)(v0 + 168);
          v114 = *(_QWORD *)(v0 + 176);
          v116 = *(_QWORD *)(v0 + 152);
          v115 = *(_QWORD *)(v0 + 160);
          v117 = *(_QWORD *)(v0 + 144);
          v118 = *(_QWORD *)(v0 + 72);

          v119 = sub_22D8B6078();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v119 - 8) + 56))(v118, 1, 1, v119);
          sub_22D8B6150();
          (*(void (**)(uint64_t, uint64_t))(v116 + 8))(v115, v117);
          v49 = *(void (**)(uint64_t, uint64_t))(v114 + 8);
          goto LABEL_49;
        }
        v98 = *(_QWORD *)(v0 + 88);
        v99 = v96 + ((*(unsigned __int8 *)(v98 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v98 + 80));
        v100 = *(_QWORD *)(v98 + 72);
        v101 = *(void (**)(uint64_t, unint64_t, uint64_t))(v98 + 16);
        swift_bridgeObjectRetain();
        while (1)
        {
          v102 = *(_QWORD *)(v0 + 96);
          v103 = *(_QWORD *)(v0 + 80);
          v101(v102, v99, v103);
          v104 = sub_22D8B6240();
          (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v102, v103);
          if ((v104 & 1) != 0)
            break;
          v99 += v100;
          if (!--v97)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_38;
          }
        }
        v86 = *(_QWORD *)(v0 + 176);
        v133 = *(_QWORD *)(v0 + 168);
        v135 = *(_QWORD *)(v0 + 216);
        v105 = *(_QWORD *)(v0 + 152);
        v106 = *(_QWORD *)(v0 + 160);
        v107 = *(_QWORD *)(v0 + 144);
        v108 = *(_QWORD *)(v0 + 72);
        swift_bridgeObjectRelease_n();
        v109 = (unsigned int *)MEMORY[0x24BE983F8];
      }
      v129 = *v109;
      v130 = sub_22D8B6078();
      v131 = *(_QWORD *)(v130 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v131 + 104))(v108, v129, v130);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v131 + 56))(v108, 0, 1, v130);
      sub_22D8B6150();
      (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v106, v107);
      goto LABEL_52;
    }
    goto LABEL_44;
  }
  v31 = *(_QWORD *)(v0 + 200);
  v32 = *(_QWORD *)(v0 + 168);
  v33 = *(_QWORD *)(v0 + 176);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v33 + 16))(v31, *(_QWORD *)(v0 + 216), v32);
  (*(void (**)(uint64_t, uint64_t))(v33 + 96))(v31, v32);
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v34 = *(_QWORD *)(v0 + 216);
    v35 = *(_QWORD *)(v0 + 168);
    v36 = *(_QWORD *)(v0 + 176);
    v37 = *(_QWORD *)(v0 + 72);
    v38 = (unsigned int *)MEMORY[0x24BE98400];
  }
  else
  {
    objc_opt_self();
    if (!swift_dynamicCastObjCClass())
    {
      swift_unknownObjectRelease();
LABEL_44:
      if (qword_255D9A360 != -1)
        swift_once();
      v120 = sub_22D8B6D80();
      __swift_project_value_buffer(v120, (uint64_t)qword_255D9AE98);
      v121 = sub_22D8B6D68();
      v122 = sub_22D8B6FA8();
      if (os_log_type_enabled(v121, v122))
      {
        v123 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v123 = 0;
        _os_log_impl(&dword_22D86F000, v121, v122, "Unable to parse a confirmation response from the given parse", v123, 2u);
        MEMORY[0x22E31A4BC](v123, -1, -1);
      }
      v34 = *(_QWORD *)(v0 + 216);
      v35 = *(_QWORD *)(v0 + 168);
      v124 = *(_QWORD *)(v0 + 176);
      v125 = *(_QWORD *)(v0 + 72);

      v126 = sub_22D8B6078();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v126 - 8) + 56))(v125, 1, 1, v126);
      sub_22D8B6150();
      v49 = *(void (**)(uint64_t, uint64_t))(v124 + 8);
      goto LABEL_49;
    }
    v34 = *(_QWORD *)(v0 + 216);
    v35 = *(_QWORD *)(v0 + 168);
    v36 = *(_QWORD *)(v0 + 176);
    v37 = *(_QWORD *)(v0 + 72);
    v38 = (unsigned int *)MEMORY[0x24BE983F8];
  }
  v82 = *v38;
  v83 = sub_22D8B6078();
  v84 = *(_QWORD *)(v83 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 104))(v37, v82, v83);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v84 + 56))(v37, 0, 1, v83);
  sub_22D8B6150();
  swift_unknownObjectRelease();
  v49 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
LABEL_49:
  v127 = v34;
  v128 = v35;
LABEL_54:
  v49(v127, v128);
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

uint64_t sub_22D897CF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 240);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 224);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 232);
  *(_QWORD *)(*(_QWORD *)v1 + 256) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return swift_task_switch();
}

uint64_t sub_22D897D78()
{
  uint64_t v0;

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

uint64_t sub_22D897E60()
{
  uint64_t v0;

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

uint64_t YesNoSearchWindowStrategy.makeConfirmationRejectedResponse()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_22D897F60()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  v3 = (uint64_t (*)(_QWORD))(**(int **)(v0[3]
                                                 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_rejectionOutputProducer)
                                      + *(_QWORD *)(v0[3]
                                                  + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_rejectionOutputProducer));
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_22D8985F4;
  return v3(v0[2]);
}

uint64_t YesNoSearchWindowStrategy.makeFlowCancelledResponse()(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_22D897FE4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (*v3)(_QWORD);

  v3 = (uint64_t (*)(_QWORD))(**(int **)(v0[3]
                                                 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_cancellationOutputProducer)
                                      + *(_QWORD *)(v0[3]
                                                  + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_cancellationOutputProducer));
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_22D898050;
  return v3(v0[2]);
}

uint64_t sub_22D898050()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t YesNoSearchWindowStrategy.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_manifest;
  v2 = sub_22D8B6114();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_responseGenerator);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t YesNoSearchWindowStrategy.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_manifest;
  v2 = sub_22D8B6114();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + OBJC_IVAR____TtC16SiriTimeInternal25YesNoSearchWindowStrategy_responseGenerator);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_22D898214(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_22D898230(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22D8985F0;
  return YesNoSearchWindowStrategy.parseConfirmationResponse(input:)(a1, a2);
}

uint64_t sub_22D898290()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_22D8985B0(&qword_255D9B040, (uint64_t)&protocol conformance descriptor for YesNoSearchWindowStrategy);
  *v1 = v0;
  v1[1] = sub_22D87F604;
  return sub_22D8B5D84();
}

uint64_t sub_22D89830C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_22D8985B0(&qword_255D9B040, (uint64_t)&protocol conformance descriptor for YesNoSearchWindowStrategy);
  *v1 = v0;
  v1[1] = sub_22D8985F0;
  return sub_22D8B5D90();
}

uint64_t sub_22D898388()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_22D8985B0(&qword_255D9B040, (uint64_t)&protocol conformance descriptor for YesNoSearchWindowStrategy);
  *v1 = v0;
  v1[1] = sub_22D8985F0;
  return sub_22D8B5D9C();
}

uint64_t sub_22D898404(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_22D89841C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_22D898434()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_22D8985F0;
  return sub_22D8B5DC0();
}

uint64_t sub_22D8984B0()
{
  return sub_22D8985B0(qword_255D9AF18, (uint64_t)"yK\n\"4t");
}

uint64_t type metadata accessor for YesNoSearchWindowStrategy()
{
  uint64_t result;

  result = qword_255D9AF88;
  if (!qword_255D9AF88)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22D898510()
{
  return MEMORY[0x24BE98D10];
}

uint64_t sub_22D89851C()
{
  return type metadata accessor for YesNoSearchWindowStrategy();
}

uint64_t sub_22D898524()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22D8B6114();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_22D8985B0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for YesNoSearchWindowStrategy();
    result = MEMORY[0x22E31A408](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22D8985F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9B048);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9B048);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t static ResponseDisambigUtils.windowingResponse(for:)()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  const char *v4;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    if (qword_255D9A368 != -1)
      swift_once();
    v0 = sub_22D8B6D80();
    __swift_project_value_buffer(v0, (uint64_t)qword_255D9B048);
    v1 = sub_22D8B6D68();
    v2 = sub_22D8B6FC0();
    if (!os_log_type_enabled(v1, v2))
      goto LABEL_7;
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    v4 = "ResponseDisambigUtils.windowingResponse(userDialogAct:) User accepted the task, will reprompt.";
LABEL_6:
    _os_log_impl(&dword_22D86F000, v1, v2, v4, v3, 2u);
    MEMORY[0x22E31A4BC](v3, -1, -1);
LABEL_7:

    return sub_22D8B612C();
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    if (qword_255D9A368 != -1)
      swift_once();
    v6 = sub_22D8B6D80();
    __swift_project_value_buffer(v6, (uint64_t)qword_255D9B048);
    v7 = sub_22D8B6D68();
    v8 = sub_22D8B6FC0();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_22D86F000, v7, v8, "ResponseDisambigUtils.windowingResponse(userDialogAct:) User rejected the task, will go to next page.", v9, 2u);
      MEMORY[0x22E31A4BC](v9, -1, -1);
    }

    return sub_22D8B6120();
  }
  else
  {
    objc_opt_self();
    if (!swift_dynamicCastObjCClass())
    {
      if (qword_255D9A368 != -1)
        swift_once();
      v14 = sub_22D8B6D80();
      __swift_project_value_buffer(v14, (uint64_t)qword_255D9B048);
      v1 = sub_22D8B6D68();
      v2 = sub_22D8B6FC0();
      if (!os_log_type_enabled(v1, v2))
        goto LABEL_7;
      v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v3 = 0;
      v4 = "ResponseDisambigUtils.windowingResponse(userDialogAct:) User made no confirmation choice – continue the task.";
      goto LABEL_6;
    }
    if (qword_255D9A368 != -1)
      swift_once();
    v10 = sub_22D8B6D80();
    __swift_project_value_buffer(v10, (uint64_t)qword_255D9B048);
    v11 = sub_22D8B6D68();
    v12 = sub_22D8B6FC0();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_22D86F000, v11, v12, "ResponseDisambigUtils.windowingResponse(userDialogAct:) User cancelled the task.", v13, 2u);
      MEMORY[0x22E31A4BC](v13, -1, -1);
    }

    return sub_22D8B6138();
  }
}

uint64_t static ResponseDisambigUtils.windowingResponse(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  char v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char *v24;
  char v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v4 = sub_22D8B6288();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v41 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v41 - v11;
  v13 = *(_QWORD *)(a1 + 16);
  if (v13)
  {
    v42 = v10;
    v44 = a2;
    v45 = a1;
    v14 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v46 = *(_QWORD *)(v5 + 72);
    v15 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v16 = v14;
    v43 = v13;
    v17 = v13;
    while (1)
    {
      v15(v12, v16, v4);
      v18 = sub_22D8B6234();
      v19 = *(void (**)(char *, uint64_t))(v5 + 8);
      v19(v12, v4);
      if ((v18 & 1) != 0)
        break;
      v16 += v46;
      if (!--v17)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        v20 = v14;
        v21 = v43;
        v22 = v43;
        do
        {
          v15(v9, v20, v4);
          v23 = sub_22D8B6240();
          v19(v9, v4);
          if ((v23 & 1) != 0)
          {
            swift_bridgeObjectRelease();
            if (qword_255D9A368 != -1)
              swift_once();
            v33 = sub_22D8B6D80();
            __swift_project_value_buffer(v33, (uint64_t)qword_255D9B048);
            v34 = sub_22D8B6D68();
            v35 = sub_22D8B6FC0();
            if (os_log_type_enabled(v34, v35))
            {
              v36 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v36 = 0;
              _os_log_impl(&dword_22D86F000, v34, v35, "ResponseDisambigUtils.windowingResponse(usoParse:) User rejected the task, will go to next page.", v36, 2u);
              MEMORY[0x22E31A4BC](v36, -1, -1);
            }

            return sub_22D8B6120();
          }
          v20 += v46;
          --v22;
        }
        while (v22);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        v24 = v42;
        while (1)
        {
          v15(v24, v14, v4);
          v25 = sub_22D8B624C();
          v19(v24, v4);
          if ((v25 & 1) != 0)
            break;
          v14 += v46;
          if (!--v21)
          {
            swift_bridgeObjectRelease();
            goto LABEL_12;
          }
        }
        swift_bridgeObjectRelease();
        if (qword_255D9A368 != -1)
          swift_once();
        v37 = sub_22D8B6D80();
        __swift_project_value_buffer(v37, (uint64_t)qword_255D9B048);
        v38 = sub_22D8B6D68();
        v39 = sub_22D8B6FC0();
        if (os_log_type_enabled(v38, v39))
        {
          v40 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v40 = 0;
          _os_log_impl(&dword_22D86F000, v38, v39, "ResponseDisambigUtils.windowingResponse(usoParse:) User cancelled/rejected the task, will cancel the request.", v40, 2u);
          MEMORY[0x22E31A4BC](v40, -1, -1);
        }

        return sub_22D8B6138();
      }
    }
    swift_bridgeObjectRelease();
    if (qword_255D9A368 != -1)
      swift_once();
    v31 = sub_22D8B6D80();
    __swift_project_value_buffer(v31, (uint64_t)qword_255D9B048);
    v27 = sub_22D8B6D68();
    v28 = sub_22D8B6FC0();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      v30 = "ResponseDisambigUtils.windowingResponse(usoParse:) User accepted the task, will reprompt.";
      goto LABEL_20;
    }
  }
  else
  {
LABEL_12:
    if (qword_255D9A368 != -1)
      swift_once();
    v26 = sub_22D8B6D80();
    __swift_project_value_buffer(v26, (uint64_t)qword_255D9B048);
    v27 = sub_22D8B6D68();
    v28 = sub_22D8B6FC0();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      v30 = "ResponseDisambigUtils.windowingResponse(usoParse:) User made no confirmation choice – continue the task.";
LABEL_20:
      _os_log_impl(&dword_22D86F000, v27, v28, v30, v29, 2u);
      MEMORY[0x22E31A4BC](v29, -1, -1);
    }
  }

  return sub_22D8B612C();
}

uint64_t static ResponseDisambigUtils.parseWindowActionFromInput<A>(input:windowInputType:items:choiceSelector:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v7[11] = a6;
  v7[12] = a7;
  v7[9] = a4;
  v7[10] = a5;
  v7[7] = a2;
  v7[8] = a3;
  v7[6] = a1;
  v8 = sub_22D8B6144();
  v7[13] = v8;
  v7[14] = *(_QWORD *)(v8 - 8);
  v7[15] = swift_task_alloc();
  v7[16] = swift_task_alloc();
  v9 = sub_22D8B6168();
  v7[17] = v9;
  v7[18] = *(_QWORD *)(v9 - 8);
  v7[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22D898F0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  _QWORD *v34;
  uint64_t v36;
  uint64_t v37;
  char v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint8_t *v42;
  uint8_t *v43;
  uint64_t (*v44)(_QWORD, _QWORD);
  uint64_t v45;

  if (qword_255D9A368 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 56);
  v5 = sub_22D8B6D80();
  *(_QWORD *)(v0 + 160) = __swift_project_value_buffer(v5, (uint64_t)qword_255D9B048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v4, v3);
  v6 = sub_22D8B6D68();
  v7 = sub_22D8B6FC0();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(_QWORD *)(v0 + 144);
  v10 = *(_QWORD *)(v0 + 152);
  v11 = *(_QWORD *)(v0 + 136);
  if (v8)
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v45 = swift_slowAlloc();
    v13 = v45;
    *(_DWORD *)v12 = 136315138;
    sub_22D879430(&qword_255D9B070, (uint64_t (*)(uint64_t))MEMORY[0x24BE98DD0], MEMORY[0x24BE98DE0]);
    v14 = sub_22D8B7314();
    *(_QWORD *)(v0 + 40) = sub_22D8755FC(v14, v15, &v45);
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v11);
    _os_log_impl(&dword_22D86F000, v6, v7, "ResponseDisambigUtils.parseWindowActionFromInput(input:items:): %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v13, -1, -1);
    MEMORY[0x22E31A4BC](v12, -1, -1);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v9 + 8))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 136));
  }

  v16 = *(_QWORD *)(v0 + 120);
  v17 = *(_QWORD *)(v0 + 104);
  v18 = *(_QWORD *)(v0 + 112);
  (*(void (**)(_QWORD, _QWORD, uint64_t))(v18 + 16))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 64), v17);
  sub_22D8B612C();
  sub_22D879430(&qword_255D9B068, (uint64_t (*)(uint64_t))MEMORY[0x24BE98CE0], MEMORY[0x24BE98CE8]);
  v19 = sub_22D8B6DF8();
  v20 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  v20(v16, v17);
  if ((v19 & 1) != 0)
  {
    v21 = *(_QWORD *)(v0 + 96);
    v22 = *(_QWORD *)(v0 + 72);
    v20(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 104));
    if (MEMORY[0x22E319ACC](v22, v21) != 1)
    {
      v44 = (uint64_t (*)(_QWORD, _QWORD))(**(int **)(v0 + 80) + *(_QWORD *)(v0 + 80));
      v34 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 168) = v34;
      *v34 = v0;
      v34[1] = sub_22D8994E0;
      return v44(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 72));
    }
    v23 = sub_22D8B6D68();
    v24 = sub_22D8B6FC0();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_22D86F000, v23, v24, "ResponseDisambigUtils.parseWindowActionFromInput: Only single item and user indicated positive response – .complete", v25, 2u);
      MEMORY[0x22E31A4BC](v25, -1, -1);
    }
    v26 = *(_QWORD *)(v0 + 72);

    *(_QWORD *)(v0 + 32) = v26;
    sub_22D8B6F0C();
    sub_22D8B6018();
  }
  else
  {
    v27 = *(_QWORD *)(v0 + 120);
    v28 = *(_QWORD *)(v0 + 104);
    sub_22D8B6120();
    v29 = sub_22D8B6DF8();
    v20(v27, v28);
    v30 = *(_QWORD *)(v0 + 128);
    if ((v29 & 1) != 0)
    {
      v20(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 104));
      v31 = sub_22D8B6D68();
      v32 = sub_22D8B6FC0();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_22D86F000, v31, v32, "ResponseDisambigUtils.parseWindowActionFromInput: determineInputType(input:) returned .proceedWithNextWindow", v33, 2u);
        MEMORY[0x22E31A4BC](v33, -1, -1);
      }

      sub_22D8B6F0C();
      sub_22D8B600C();
    }
    else
    {
      v36 = *(_QWORD *)(v0 + 120);
      v37 = *(_QWORD *)(v0 + 104);
      sub_22D8B6138();
      v38 = sub_22D8B6DF8();
      v20(v36, v37);
      v20(v30, v37);
      v39 = sub_22D8B6D68();
      v40 = sub_22D8B6FC0();
      v41 = os_log_type_enabled(v39, v40);
      if ((v38 & 1) != 0)
      {
        if (v41)
        {
          v42 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v42 = 0;
          _os_log_impl(&dword_22D86F000, v39, v40, "ResponseDisambigUtils.parseWindowActionFromInput: determineInputType(input:) returned .cancel", v42, 2u);
          MEMORY[0x22E31A4BC](v42, -1, -1);
        }

        sub_22D8B6F0C();
        sub_22D8B6024();
      }
      else
      {
        if (v41)
        {
          v43 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v43 = 0;
          _os_log_impl(&dword_22D86F000, v39, v40, "ResponseDisambigUtils.parseWindowActionFromInput: determineInputType(input:) returned unknown or .unsupported – .repeatWindow", v43, 2u);
          MEMORY[0x22E31A4BC](v43, -1, -1);
        }

        sub_22D8B6F0C();
        sub_22D8B6000();
      }
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8994E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 176) = a1;
  *(_QWORD *)(v3 + 184) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D89954C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  v1 = *(_QWORD *)(v0 + 176);
  if (!v1)
    goto LABEL_4;
  *(_QWORD *)(v0 + 16) = v1;
  v2 = sub_22D8B6F0C();
  MEMORY[0x22E31A408](MEMORY[0x24BEE12E0], v2);
  if ((sub_22D8B6F84() & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_4:
    v3 = sub_22D8B6D68();
    v4 = sub_22D8B6FC0();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_22D86F000, v3, v4, "ResponseDisambigUtils.parseWindowActionFromInput: TimerSearch returned empty results – .repeatWindow", v5, 2u);
      MEMORY[0x22E31A4BC](v5, -1, -1);
    }

    sub_22D8B6F0C();
    goto LABEL_18;
  }
  v6 = MEMORY[0x22E319ACC](v1, *(_QWORD *)(v0 + 96));
  if (v6 != 1)
  {
    if (v6)
    {
      swift_bridgeObjectRelease();
      v7 = sub_22D8B6D68();
      v8 = sub_22D8B6FC0();
      if (os_log_type_enabled(v7, v8))
      {
        v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v9 = 0;
        v10 = "ResponseDisambigUtils.parseWindowActionFromInput: TimerSearch returned multiple results – .repeatWindow";
        goto LABEL_16;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      v7 = sub_22D8B6D68();
      v8 = sub_22D8B6FB4();
      if (os_log_type_enabled(v7, v8))
      {
        v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v9 = 0;
        v10 = "ResponseDisambigUtils.parseWindowActionFromInput: TimerSearch returned empty result. This shouldn't be a p"
              "ossible codepath to execute.";
LABEL_16:
        _os_log_impl(&dword_22D86F000, v7, v8, v10, v9, 2u);
        MEMORY[0x22E31A4BC](v9, -1, -1);
      }
    }

LABEL_18:
    sub_22D8B6000();
    goto LABEL_19;
  }
  v11 = sub_22D8B6D68();
  v12 = sub_22D8B6FC0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_22D86F000, v11, v12, "ResponseDisambigUtils.parseWindowActionFromInput: TimerSearch returned single result – .complete", v13, 2u);
    MEMORY[0x22E31A4BC](v13, -1, -1);
  }
  v14 = *(_QWORD *)(v0 + 176);

  *(_QWORD *)(v0 + 24) = v14;
  sub_22D8B6018();
  swift_bridgeObjectRelease();
LABEL_19:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D899808()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static ResponseDisambigUtils.calculateWindow<A>(windowItems:allItems:windowSize:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  v10 = sub_22D8B702C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v22 - v13;
  v15 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3 < 1)
    return 0;
  v25 = a5;
  v26 = a1;
  v24 = a3;
  v28 = a2;
  v18 = sub_22D8B6F0C();
  MEMORY[0x22E31A408](MEMORY[0x24BEE12E0], v18);
  v19 = sub_22D8B6F84();
  result = 0;
  if ((v19 & 1) != 0)
    return result;
  v23 = a2;
  v28 = v26;
  sub_22D8B6F78();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1, a4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v14, a4);
  v27 = v23;
  sub_22D8B6F90();
  if (v29 == 1)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, a4);
    return 0;
  }
  v21 = v28;
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, a4);
  return v21 / v24;
}

ValueMetadata *type metadata accessor for ResponseDisambigUtils()
{
  return &type metadata for ResponseDisambigUtils;
}

uint64_t sub_22D899A34(void *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;

  v4 = sub_22D8B6C90();
  result = 0;
  if (v4 > 1999)
  {
    if (v4 != 2000 && v4 != 3000)
      return result;
  }
  else if (v4)
  {
    if (v4 != 1000)
      return result;
  }
  else
  {
    if (qword_255D9A3A8 != -1)
      swift_once();
    v6 = sub_22D8B6D80();
    __swift_project_value_buffer(v6, (uint64_t)qword_255D9B418);
    v7 = sub_22D8B6D68();
    v8 = sub_22D8B6FC0();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_22D86F000, v7, v8, "Device proximity is 'unknown'. Assuming device is remote for indeterminate proximity state. This needs to be fixed by an upstream component from Time Domains.", v9, 2u);
      MEMORY[0x22E31A4BC](v9, -1, -1);
    }

  }
  if ((sub_22D881AF0((uint64_t)a1, a2) & 1) != 0)
    return 0;
  if (qword_255D9A2F8 != -1)
    swift_once();
  v10 = sub_22D8B6D80();
  __swift_project_value_buffer(v10, (uint64_t)qword_255D9A850);
  v11 = a1;
  v12 = sub_22D8B6D68();
  v13 = sub_22D8B6FC0();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v15 = swift_slowAlloc();
    v20 = v15;
    *(_DWORD *)v14 = 136315394;
    v16 = sub_22D8B6C78();
    sub_22D8755FC(v16, v17, &v20);
    sub_22D8B7044();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    v18 = sub_22D8B6C84();
    sub_22D8755FC(v18, v19, &v20);
    sub_22D8B7044();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v12, v13, "Remote device %s doesn't support intent handling. Will send ace command to remote assistant %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v15, -1, -1);
    MEMORY[0x22E31A4BC](v14, -1, -1);

  }
  else
  {

  }
  return sub_22D8B6C84();
}

uint64_t sub_22D899D34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9B078);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9B078);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t SiriTimeDeviceContextProvider.fetchAlarmContexts()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 128) = v0;
  return swift_task_switch();
}

uint64_t sub_22D899DDC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[16];
  v2 = swift_task_alloc();
  v0[17] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[18] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B098);
  *v3 = v0;
  v3[1] = sub_22D899E8C;
  return sub_22D8B7320();
}

uint64_t sub_22D899E8C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D899EE8()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;

  v1 = *(_QWORD *)(v0 + 96);
  *(_QWORD *)(v0 + 152) = v1;
  v2 = sub_22D89A64C(v1);
  *(_QWORD *)(v0 + 160) = v2;
  *(_QWORD *)(v0 + 168) = 0;
  v3 = sub_22D8B6CCC();
  *(_QWORD *)(v0 + 176) = v3;
  *(_QWORD *)(v0 + 16) = sub_22D8B6CB4();
  v4 = MEMORY[0x24BEA9118];
  *(_QWORD *)(v0 + 40) = v3;
  *(_QWORD *)(v0 + 48) = v4;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v5;
    *(_QWORD *)(v5 + 16) = v0 + 16;
    *(_QWORD *)(v5 + 24) = v2;
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B0A0);
    *v6 = v0;
    v6[1] = sub_22D89A194;
    return sub_22D8B7320();
  }
  v7 = sub_22D889578(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 200) = v7;
  sub_22D87C298(v0 + 16);
  if (*(_QWORD *)(v7 + 16))
  {
    v8 = *(_QWORD *)(v0 + 176);
    v9 = sub_22D8B6CB4();
    *(_QWORD *)(v0 + 80) = v8;
    *(_QWORD *)(v0 + 88) = v4;
    *(_QWORD *)(v0 + 56) = v9;
    v10 = swift_task_alloc();
    *(_QWORD *)(v0 + 208) = v10;
    *(_QWORD *)(v10 + 16) = v0 + 56;
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B0A8);
    *v11 = v0;
    v11[1] = sub_22D89A3B8;
    return sub_22D8B7320();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_255D9A370 != -1)
    swift_once();
  v13 = sub_22D8B6D80();
  __swift_project_value_buffer(v13, (uint64_t)qword_255D9B078);
  v14 = sub_22D8B6D68();
  v15 = sub_22D8B6FB4();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_22D86F000, v14, v15, "Failed to fetch device units for alarm contexts", v16, 2u);
    MEMORY[0x22E31A4BC](v16, -1, -1);
  }

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
}

uint64_t sub_22D89A194()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D89A1F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;

  swift_bridgeObjectRelease();
  v1 = *(_QWORD *)(v0 + 104);
  *(_QWORD *)(v0 + 200) = v1;
  sub_22D87C298(v0 + 16);
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = *(_QWORD *)(v0 + 176);
    v3 = sub_22D8B6CB4();
    v4 = MEMORY[0x24BEA9118];
    *(_QWORD *)(v0 + 80) = v2;
    *(_QWORD *)(v0 + 88) = v4;
    *(_QWORD *)(v0 + 56) = v3;
    v5 = swift_task_alloc();
    *(_QWORD *)(v0 + 208) = v5;
    *(_QWORD *)(v5 + 16) = v0 + 56;
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B0A8);
    *v6 = v0;
    v6[1] = sub_22D89A3B8;
    return sub_22D8B7320();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_255D9A370 != -1)
      swift_once();
    v8 = sub_22D8B6D80();
    __swift_project_value_buffer(v8, (uint64_t)qword_255D9B078);
    v9 = sub_22D8B6D68();
    v10 = sub_22D8B6FB4();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_22D86F000, v9, v10, "Failed to fetch device units for alarm contexts", v11, 2u);
      MEMORY[0x22E31A4BC](v11, -1, -1);
    }

    return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
  }
}

uint64_t sub_22D89A3B8()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D89A414()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 112);
  sub_22D87C298(v0 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v4 = sub_22D87B568(v2, v1, v3, (void (*)(_OWORD *__return_ptr, id *, uint64_t, uint64_t))sub_22D89A960, (uint64_t (*)(BOOL, unint64_t, uint64_t, uint64_t, __n128))sub_22D883E6C);
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  if (qword_255D9A370 != -1)
    swift_once();
  v5 = sub_22D8B6D80();
  __swift_project_value_buffer(v5, (uint64_t)qword_255D9B078);
  swift_bridgeObjectRetain_n();
  v6 = sub_22D8B6D68();
  v7 = sub_22D8B6FC0();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v15 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = swift_bridgeObjectRetain();
    v11 = MEMORY[0x22E319A90](v10, &type metadata for HALAlarmDeviceContext);
    v13 = v12;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 120) = sub_22D8755FC(v11, v13, &v15);
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22D86F000, v6, v7, "fetchAlarmContexts() got firing alarms context: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v9, -1, -1);
    MEMORY[0x22E31A4BC](v8, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v4);
}

unint64_t sub_22D89A64C(unint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  char *v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD v25[2];
  unint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A800);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22D8B5C40();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v30 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v27 = (char *)v25 - v11;
  if (a1 >> 62)
    goto LABEL_21;
  v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v12; v12 = sub_22D8B71C4())
  {
    v25[1] = v2;
    v29 = a1 & 0xC000000000000001;
    v13 = MEMORY[0x24BEE4AF8];
    v14 = 4;
    v26 = a1;
    v28 = v12;
    while (1)
    {
      v15 = v29 ? (id)MEMORY[0x22E319D0C](v14 - 4, a1) : *(id *)(a1 + 8 * v14);
      v2 = v15;
      v16 = v14 - 3;
      if (__OFADD__(v14 - 4, 1))
        break;
      v17 = objc_msgSend(v15, sel_identifier);
      if (v17)
      {
        v18 = v17;
        sub_22D8B5C28();

        v19 = 0;
      }
      else
      {
        v19 = 1;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, v19, 1, v7);

      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
      {
        sub_22D8740E0((uint64_t)v6, &qword_255D9A800);
      }
      else
      {
        v20 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
        v21 = v27;
        v20(v27, v6, v7);
        v20(v30, v21, v7);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v13 = sub_22D883E80(0, *(_QWORD *)(v13 + 16) + 1, 1, v13);
        v23 = *(_QWORD *)(v13 + 16);
        v22 = *(_QWORD *)(v13 + 24);
        if (v23 >= v22 >> 1)
          v13 = sub_22D883E80(v22 > 1, v23 + 1, 1, v13);
        *(_QWORD *)(v13 + 16) = v23 + 1;
        v20((char *)(v13+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v23), v30, v7);
        a1 = v26;
      }
      ++v14;
      if (v16 == v28)
      {
        swift_bridgeObjectRelease();
        return v13;
      }
    }
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_22D89A928(uint64_t a1)
{
  uint64_t v1;

  return sub_22D89B988(a1, *(_QWORD *)(v1 + 16), &qword_255D9B108, MEMORY[0x24BE08C10], (uint64_t)&unk_24F95D918, (uint64_t)sub_22D89DDE0);
}

void sub_22D89A960(void **a1@<X0>, uint8_t *a2@<X1>, _QWORD *a3@<X2>, uint8_t **a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint8_t *v17;
  void *v18;
  id v19;
  void *v20;
  void (*v21)(char *, char *, uint64_t);
  _QWORD *v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  _BOOL4 v28;
  uint8_t *v29;
  id v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  os_log_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  id v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  __int128 v51;
  uint8_t **v52;
  uint8_t *v53;
  unint64_t v54;
  char v55;
  uint8_t *v56;
  id v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  char v63;
  NSObject *v64;
  os_log_type_t v65;
  _QWORD *v66;
  os_log_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  void (*v72)(os_log_t, _QWORD *);
  void (*v73)(os_log_t, _QWORD *);
  id v74;
  id v75;
  NSObject *v76;
  NSObject *v77;
  os_log_type_t v78;
  NSObject *v79;
  uint8_t *v80;
  NSObject *v81;
  NSObject *v82;
  _QWORD *v83;
  id v84;
  NSObject *v85;
  os_log_type_t v86;
  uint8_t *v87;
  uint64_t v88;
  _QWORD *v89;
  id v90;
  id v91;
  _QWORD *v92;
  id v93;
  id v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint8_t *v98;
  uint8_t *v99;
  uint8_t *v100;
  unint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  uint8_t *v104;
  uint8_t *v105;
  uint8_t **v106;
  uint8_t **v107;
  NSObject *v108;
  NSObject *v109;
  os_log_type_t v110;
  uint8_t *v111;
  NSObject *v112;
  _QWORD *v113;
  uint8_t *v114;
  os_log_t v115;
  uint8_t **v116;
  uint8_t *v117;
  uint64_t v118;
  uint8_t *v119;
  uint64_t v120;
  _QWORD *v121;
  id v122;
  _QWORD *v123;
  uint64_t v124;
  uint8_t *v125;
  os_log_t v126;
  uint8_t *v127;
  uint8_t **v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  uint64_t v132;

  v123 = a3;
  v125 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A800);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v119 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_22D8B5C40();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v126 = (os_log_t)((char *)&v119 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v119 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (uint8_t *)&v119 - v16;
  v18 = *a1;
  v19 = objc_msgSend(v18, sel_identifier);
  v128 = a4;
  if (!v19)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    goto LABEL_8;
  }
  v20 = v19;
  v127 = v17;
  sub_22D8B5C28();

  v21 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v21(v8, v15, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  v124 = v10;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
LABEL_8:
    sub_22D8740E0((uint64_t)v8, &qword_255D9A800);
    if (qword_255D9A370 != -1)
      swift_once();
    v40 = sub_22D8B6D80();
    __swift_project_value_buffer(v40, (uint64_t)qword_255D9B078);
    v41 = v18;
    v42 = sub_22D8B6D68();
    v43 = sub_22D8B6FB4();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v45 = swift_slowAlloc();
      *(_QWORD *)&v131 = v45;
      *(_DWORD *)v44 = 136315138;
      v127 = v44 + 4;
      v46 = v41;
      v47 = objc_msgSend(v46, sel_description);
      v48 = sub_22D8B6E10();
      v50 = v49;

      *(_QWORD *)&v129 = sub_22D8755FC(v48, v50, (uint64_t *)&v131);
      sub_22D8B7044();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D86F000, v42, v43, "Device had invalid UUID for fetched alarms: %s", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v45, -1, -1);
      MEMORY[0x22E31A4BC](v44, -1, -1);

    }
    else
    {

    }
    v51 = 0uLL;
    v52 = v128;
    goto LABEL_25;
  }
  v22 = (_QWORD *)v9;
  v21((char *)v127, v8, v9);
  if (qword_255D9A370 != -1)
    swift_once();
  v23 = sub_22D8B6D80();
  v24 = __swift_project_value_buffer(v23, (uint64_t)qword_255D9B078);
  v25 = v18;
  v26 = sub_22D8B6D68();
  v27 = sub_22D8B6FC0();
  v28 = os_log_type_enabled(v26, v27);
  v122 = v25;
  if (v28)
  {
    v29 = (uint8_t *)swift_slowAlloc();
    v120 = swift_slowAlloc();
    *(_QWORD *)&v131 = v120;
    *(_DWORD *)v29 = 136315138;
    v119 = v29 + 4;
    v30 = v25;
    v31 = objc_msgSend(v30, sel_description);
    v32 = sub_22D8B6E10();
    v121 = v22;
    v34 = v33;

    *(_QWORD *)&v129 = sub_22D8755FC(v32, v34, (uint64_t *)&v131);
    sub_22D8B7044();

    v35 = v121;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v26, v27, "Searching alarm from device context %s", v29, 0xCu);
    v36 = v120;
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v36, -1, -1);
    MEMORY[0x22E31A4BC](v29, -1, -1);

    v38 = v126;
    v37 = (uint64_t)v127;
  }
  else
  {

    v38 = v126;
    v37 = (uint64_t)v127;
    v35 = v22;
  }
  v39 = v124;
  v53 = v125;
  if (!*((_QWORD *)v125 + 2) || (v54 = sub_22D8AF2A4(v37), (v55 & 1) == 0))
  {
    (*(void (**)(os_log_t, uint64_t, _QWORD *))(v39 + 16))(v38, v37, v35);
    v64 = sub_22D8B6D68();
    v65 = sub_22D8B6FB4();
    if (os_log_type_enabled(v64, v65))
    {
      v66 = v35;
      v67 = v38;
      v68 = (uint8_t *)swift_slowAlloc();
      v69 = swift_slowAlloc();
      *(_QWORD *)&v131 = v69;
      *(_DWORD *)v68 = 136315138;
      sub_22D89DB30(&qword_255D9B0F0, MEMORY[0x24BDCEAB8]);
      v70 = sub_22D8B7314();
      *(_QWORD *)&v129 = sub_22D8755FC(v70, v71, (uint64_t *)&v131);
      sub_22D8B7044();
      swift_bridgeObjectRelease();
      v72 = *(void (**)(os_log_t, _QWORD *))(v124 + 8);
      v72(v67, v66);
      _os_log_impl(&dword_22D86F000, v64, v65, "Unable to find device for fetched alarms: %s", v68, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v69, -1, -1);
      MEMORY[0x22E31A4BC](v68, -1, -1);

      v72((os_log_t)v127, v66);
    }
    else
    {

      v73 = *(void (**)(os_log_t, _QWORD *))(v39 + 8);
      v73(v38, v35);
      v73((os_log_t)v37, v35);
    }
    v52 = v128;
    v51 = 0uLL;
LABEL_25:
    *(_OWORD *)v52 = v51;
    *((_OWORD *)v52 + 1) = v51;
    return;
  }
  v126 = v24;
  v56 = (uint8_t *)*(id *)(*((_QWORD *)v53 + 7) + 8 * v54);
  v57 = objc_msgSend(v122, sel_serializedContextByKey);
  if (v57)
  {
    v58 = v57;
    v59 = sub_22D8B6DD4();

    v60 = sub_22D8B6E10();
    if (*(_QWORD *)(v59 + 16) && (v62 = sub_22D8AF240(v60, v61), (v63 & 1) != 0))
    {
      sub_22D875884(*(_QWORD *)(v59 + 56) + 32 * v62, (uint64_t)&v129);
    }
    else
    {
      v129 = 0u;
      v130 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v130 + 1))
    {
      sub_22D87D920(&v129, &v131);
      v74 = objc_allocWithZone(MEMORY[0x24BE09148]);
      __swift_project_boxed_opaque_existential_1(&v131, v132);
      v75 = objc_msgSend(v74, sel_initWithSerializedBackingStore_, sub_22D8B73EC());
      swift_unknownObjectRelease();
      v76 = v75;
      v77 = sub_22D8B6D68();
      v78 = sub_22D8B6FC0();
      if (os_log_type_enabled(v77, v78))
      {
        v79 = v76;
        v80 = (uint8_t *)swift_slowAlloc();
        v121 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v80 = 138412290;
        *(_QWORD *)&v129 = v76;
        v81 = v76;
        v125 = v56;
        v82 = v81;
        sub_22D8B7044();
        v83 = v121;
        *v121 = v79;

        v76 = v79;
        v56 = v125;
        _os_log_impl(&dword_22D86F000, v77, v78, "fetchAlarmContexts() alarmSnapshot = %@", v80, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE78);
        swift_arrayDestroy();
        MEMORY[0x22E31A4BC](v83, -1, -1);
        MEMORY[0x22E31A4BC](v80, -1, -1);
      }
      else
      {

        v77 = v76;
      }
      v93 = v122;

      v94 = -[NSObject alarmsByID](v76, sel_alarmsByID);
      if (v94)
      {
        v95 = v94;
        sub_22D89DBD8(0, (unint64_t *)&qword_255D9AC28);
        sub_22D89DB30(&qword_255D9B0F8, MEMORY[0x24BDCEA88]);
        v96 = sub_22D8B6DD4();

        if (*(_QWORD *)(v96 + 16))
        {
          v97 = swift_bridgeObjectRetain();
          sub_22D89B69C(v97, (unint64_t *)&qword_255D9AC28, 0x24BE09140, &qword_255D9B110, &qword_255D9ACF0);
          v99 = v98;
          v100 = v56;
          v101 = (unint64_t)v123;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v102 = sub_22D899A34(v100, v101);
          v103 = v35;
          v105 = v104;

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v131);
          (*(void (**)(uint8_t *, _QWORD *))(v124 + 8))(v127, v103);
          v106 = v128;
          *v128 = v100;
          v106[1] = v99;
          v106[2] = (uint8_t *)v102;
          v106[3] = v105;
          return;
        }
        swift_bridgeObjectRelease();
      }
      v108 = v93;
      v109 = sub_22D8B6D68();
      v110 = sub_22D8B6FC0();
      v126 = v109;
      if (os_log_type_enabled(v109, v110))
      {
        v111 = (uint8_t *)swift_slowAlloc();
        v123 = (_QWORD *)swift_slowAlloc();
        v125 = v111;
        *(_DWORD *)v111 = 138412290;
        *(_QWORD *)&v129 = v108;
        v112 = v108;
        sub_22D8B7044();
        v113 = v123;
        *v123 = v108;

        v114 = v125;
        v115 = v126;
        _os_log_impl(&dword_22D86F000, v126, v110, "Didn't find any alarms on device: %@", v125, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE78);
        swift_arrayDestroy();
        MEMORY[0x22E31A4BC](v113, -1, -1);
        MEMORY[0x22E31A4BC](v114, -1, -1);
        v117 = v127;
        v116 = v128;
        v118 = v124;
      }
      else
      {

        v76 = v108;
        v117 = v127;
        v116 = v128;
        v118 = v124;
        v115 = v126;
      }

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v131);
      (*(void (**)(uint8_t *, _QWORD *))(v118 + 8))(v117, v35);
      *(_OWORD *)v116 = 0u;
      *((_OWORD *)v116 + 1) = 0u;
    }
    else
    {
      v125 = v56;
      sub_22D8740E0((uint64_t)&v129, &qword_255D9B0E8);
      v84 = v122;
      v85 = sub_22D8B6D68();
      v86 = sub_22D8B6FB4();
      if (os_log_type_enabled(v85, v86))
      {
        v87 = (uint8_t *)swift_slowAlloc();
        v88 = swift_slowAlloc();
        v126 = v85;
        v89 = (_QWORD *)v88;
        *(_DWORD *)v87 = 138412290;
        *(_QWORD *)&v131 = v84;
        v90 = v84;
        v121 = v35;
        v91 = v90;
        v39 = v124;
        sub_22D8B7044();
        *v89 = v84;
        v92 = v89;
        v85 = v126;

        v35 = v121;
        v37 = (uint64_t)v127;
        _os_log_impl(&dword_22D86F000, v85, v86, "Failed to get snapshot data from %@", v87, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE78);
        swift_arrayDestroy();
        MEMORY[0x22E31A4BC](v92, -1, -1);
        MEMORY[0x22E31A4BC](v87, -1, -1);
      }
      else
      {

      }
      v107 = v128;

      (*(void (**)(uint64_t, _QWORD *))(v39 + 8))(v37, v35);
      *(_OWORD *)v107 = 0u;
      *((_OWORD *)v107 + 1) = 0u;
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_22D89B69C(uint64_t a1, unint64_t *a2, uint64_t a3, unint64_t *a4, uint64_t *a5)
{
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  id v21[2];

  sub_22D89DBD8(0, a2);
  sub_22D87D930(a4, a2);
  v10 = 0;
  v21[1] = (id)sub_22D8B6F6C();
  v11 = a1 + 64;
  v12 = 1 << *(_BYTE *)(a1 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(a1 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v10 << 6);
      goto LABEL_5;
    }
    v18 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v18 >= v15)
      goto LABEL_23;
    v19 = *(_QWORD *)(v11 + 8 * v18);
    ++v10;
    if (!v19)
    {
      v10 = v18 + 1;
      if (v18 + 1 >= v15)
        goto LABEL_23;
      v19 = *(_QWORD *)(v11 + 8 * v10);
      if (!v19)
      {
        v10 = v18 + 2;
        if (v18 + 2 >= v15)
          goto LABEL_23;
        v19 = *(_QWORD *)(v11 + 8 * v10);
        if (!v19)
        {
          v10 = v18 + 3;
          if (v18 + 3 >= v15)
            goto LABEL_23;
          v19 = *(_QWORD *)(v11 + 8 * v10);
          if (!v19)
            break;
        }
      }
    }
LABEL_22:
    v14 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v10 << 6);
LABEL_5:
    sub_22D89C9DC(v21, *(id *)(*(_QWORD *)(a1 + 56) + 8 * v17), a2, a3, a5);

  }
  v20 = v18 + 4;
  if (v20 >= v15)
  {
LABEL_23:
    swift_release();
    return;
  }
  v19 = *(_QWORD *)(v11 + 8 * v20);
  if (v19)
  {
    v10 = v20;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v10 >= v15)
      goto LABEL_23;
    v19 = *(_QWORD *)(v11 + 8 * v10);
    ++v20;
    if (v19)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
}

uint64_t SiriTimeDeviceContextProvider.isNothingPlaying.getter()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_22D89B878()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[2];
  v2 = swift_task_alloc();
  v0[3] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[4] = v3;
  *v3 = v0;
  v3[1] = sub_22D89B920;
  return sub_22D8B7320();
}

uint64_t sub_22D89B920()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D89B97C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(unsigned __int8 *)(v0 + 40));
}

uint64_t sub_22D89B988(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD v16[3];
  _QWORD v17[5];

  v16[1] = a5;
  v16[2] = a6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(a3);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  sub_22D87832C(a2, (uint64_t)v17);
  v16[0] = v17[4];
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B0E0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22D8B7E30;
  *(_QWORD *)(inited + 32) = sub_22D8B6E10();
  *(_QWORD *)(inited + 40) = v12;
  sub_22D8A5BE4(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v8);
  v13 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v14 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v14 + v13, (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  sub_22D8B6BDC();
  swift_release();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
}

void sub_22D89BB14(unint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  unint64_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  id v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD *v31;
  NSObject *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  if (!a1)
  {
    if (qword_255D9A370 != -1)
      swift_once();
    v8 = sub_22D8B6D80();
    __swift_project_value_buffer(v8, (uint64_t)qword_255D9B078);
    v9 = sub_22D8B6D68();
    v10 = sub_22D8B6FB4();
    if (!os_log_type_enabled(v9, v10))
      goto LABEL_24;
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    v12 = "SharedContextProvider#fetchDeviceContexts Got nil context array, returning nil...";
    goto LABEL_23;
  }
  if (qword_255D9A370 != -1)
LABEL_39:
    swift_once();
  v2 = sub_22D8B6D80();
  __swift_project_value_buffer(v2, (uint64_t)qword_255D9B078);
  swift_bridgeObjectRetain_n();
  v3 = sub_22D8B6D68();
  v4 = sub_22D8B6FC0();
  v5 = a1 >> 62;
  if (os_log_type_enabled(v3, v4))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v6 = 134217984;
    if (v5)
    {
      swift_bridgeObjectRetain();
      v7 = sub_22D8B71C4();
      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)&v38 = v7;
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v3, v4, "SharedContextProvider#fetchDeviceContexts Got media context for %ld devices...", v6, 0xCu);
    MEMORY[0x22E31A4BC](v6, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!v5)
  {
    v13 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v13)
      goto LABEL_14;
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  v13 = sub_22D8B71C4();
  if (!v13)
  {
LABEL_21:
    swift_bridgeObjectRelease();
    v9 = sub_22D8B6D68();
    v10 = sub_22D8B6FB4();
    if (!os_log_type_enabled(v9, v10))
    {
LABEL_24:

      LOBYTE(v38) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B0D8);
      sub_22D8B6F24();
      return;
    }
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    v12 = "Not found primary device in deviceContexts";
LABEL_23:
    _os_log_impl(&dword_22D86F000, v9, v10, v12, v11, 2u);
    MEMORY[0x22E31A4BC](v11, -1, -1);
    goto LABEL_24;
  }
LABEL_14:
  v14 = 4;
  while (1)
  {
    if ((a1 & 0xC000000000000001) != 0)
      v15 = (id)MEMORY[0x22E319D0C](v14 - 4, a1);
    else
      v15 = *(id *)(a1 + 8 * v14);
    v16 = v15;
    v17 = v14 - 3;
    if (__OFADD__(v14 - 4, 1))
    {
      __break(1u);
      goto LABEL_39;
    }
    if (objc_msgSend(v15, sel_proximity) == (id)4000)
      break;

    ++v14;
    if (v17 == v13)
      goto LABEL_21;
  }
  swift_bridgeObjectRelease();
  v18 = objc_msgSend(v16, sel_serializedContextByKey);
  if (v18)
  {
    v19 = v18;
    v20 = sub_22D8B6DD4();

    v21 = sub_22D8B6E10();
    if (*(_QWORD *)(v20 + 16) && (v23 = sub_22D8AF240(v21, v22), (v24 & 1) != 0))
    {
      sub_22D875884(*(_QWORD *)(v20 + 56) + 32 * v23, (uint64_t)&v36);
    }
    else
    {
      v36 = 0u;
      v37 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v37 + 1))
    {
      sub_22D87D920(&v36, &v38);
      v25 = objc_allocWithZone(MEMORY[0x24BE09210]);
      __swift_project_boxed_opaque_existential_1(&v38, v39);
      v26 = objc_msgSend(v25, sel_initWithSerializedBackingStore_, sub_22D8B73EC());
      swift_unknownObjectRelease();
      v27 = v26;
      v28 = sub_22D8B6D68();
      v29 = sub_22D8B6FA8();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        v31 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v30 = 138412290;
        *(_QWORD *)&v36 = v27;
        v32 = v27;
        sub_22D8B7044();
        *v31 = v27;

        _os_log_impl(&dword_22D86F000, v28, v29, "SharedContextProvider#fetchDeviceContexts serializedContextSnapshots: %@", v30, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE78);
        swift_arrayDestroy();
        MEMORY[0x22E31A4BC](v31, -1, -1);
        MEMORY[0x22E31A4BC](v30, -1, -1);
      }
      else
      {

        v28 = v27;
      }

      LOBYTE(v36) = -[NSObject playbackState](v27, sel_playbackState) != (id)1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B0D8);
      sub_22D8B6F24();

      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v38);
    }
    else
    {
      sub_22D8740E0((uint64_t)&v36, &qword_255D9B0E8);
      v33 = sub_22D8B6D68();
      v34 = sub_22D8B6FC0();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_22D86F000, v33, v34, "SharedContextProvider#fetchDeviceContexts no playback state found for media context", v35, 2u);
        MEMORY[0x22E31A4BC](v35, -1, -1);
      }

      LOBYTE(v38) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B0D8);
      sub_22D8B6F24();

    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_22D89C170()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_22D89C1CC;
  v2[16] = v0;
  return swift_task_switch();
}

uint64_t sub_22D89C1CC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_22D89C21C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_22D89DDFC;
  v2[16] = v0;
  return swift_task_switch();
}

uint64_t sub_22D89C278()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_22D89C290()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[2];
  v2 = swift_task_alloc();
  v0[3] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[4] = v3;
  *v3 = v0;
  v3[1] = sub_22D89B920;
  return sub_22D8B7320();
}

uint64_t sub_22D89C338(uint64_t a1)
{
  uint64_t v1;

  return sub_22D89DFC0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_22D89C340(uint64_t a1)
{
  uint64_t v1;

  return sub_22D87C2CC(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_22D89C348(uint64_t a1)
{
  return sub_22D89C360(a1, &qword_255D9ACF0);
}

uint64_t sub_22D89C354(uint64_t a1)
{
  return sub_22D89C360(a1, &qword_255D9ACE8);
}

uint64_t sub_22D89C360(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_22D8B70EC();
  v6 = v5;
  if (*(_QWORD *)(v4 + 16))
  {
    v30 = v2;
    v7 = 1 << *(_BYTE *)(v4 + 32);
    v8 = (_QWORD *)(v4 + 56);
    if (v7 < 64)
      v9 = ~(-1 << v7);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v4 + 56);
    v11 = (unint64_t)(v7 + 63) >> 6;
    v12 = v5 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v11)
          goto LABEL_33;
        v19 = v8[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v11)
            goto LABEL_33;
          v19 = v8[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v11)
              goto LABEL_33;
            v19 = v8[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v11)
              {
LABEL_33:
                swift_release();
                v3 = v30;
                v29 = 1 << *(_BYTE *)(v4 + 32);
                if (v29 > 63)
                  bzero((void *)(v4 + 56), ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v8 = -1 << v29;
                *(_QWORD *)(v4 + 16) = 0;
                break;
              }
              v19 = v8[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v11)
                    goto LABEL_33;
                  v19 = v8[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v17);
      result = sub_22D8B6FE4();
      v22 = -1 << *(_BYTE *)(v6 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          v28 = *(_QWORD *)(v12 + 8 * v24);
        }
        while (v28 == -1);
        v15 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release();
  *v3 = v6;
  return result;
}

uint64_t sub_22D89C5F8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_22D8B5C40();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B120);
  v6 = sub_22D8B70EC();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v34)
          goto LABEL_33;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_33;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_33;
            v19 = v35[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v34)
              {
LABEL_33:
                swift_release();
                v1 = v33;
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 > 63)
                  bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v35[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v34)
                    goto LABEL_33;
                  v19 = v35[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v36 + 72);
      v23 = *(_QWORD *)(v5 + 48) + v22 * v17;
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v23, v2);
      sub_22D89DB30(&qword_255D9B0F8, MEMORY[0x24BDCEA88]);
      result = sub_22D8B6DEC();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_38;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v22, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

unint64_t sub_22D89C95C(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_22D8B6FE4();
  result = sub_22D8B70A4();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_22D89C9DC(_QWORD *a1, void *a2, unint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t *v5;
  uint64_t *v8;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  char v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  char isUniquelyReferenced_nonNull_native;
  id v31;
  uint64_t v32;
  id v33;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v8 = v5;
  v11 = *v5;
  if ((*v5 & 0xC000000000000001) != 0)
  {
    if (v11 < 0)
      v12 = *v5;
    else
      v12 = v11 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v13 = a2;
    v14 = sub_22D8B70C8();

    if (v14)
    {
      swift_bridgeObjectRelease();

      sub_22D89DBD8(0, a3);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v36;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_22D8B70BC();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v26 = sub_22D89CCA4(v12, result + 1, a5, a3);
    v37 = v26;
    v27 = *(_QWORD *)(v26 + 16);
    if (*(_QWORD *)(v26 + 24) <= v27)
    {
      v32 = v27 + 1;
      v33 = v13;
      sub_22D89C360(v32, a5);
      v28 = v37;
    }
    else
    {
      v28 = v26;
      v29 = v13;
    }
    sub_22D89C95C((uint64_t)v13, v28);
    *v8 = v28;
    swift_bridgeObjectRelease();
    *a1 = v13;
  }
  else
  {
    swift_bridgeObjectRetain();
    v16 = sub_22D8B6FE4();
    v17 = -1 << *(_BYTE *)(v11 + 32);
    v18 = v16 & ~v17;
    if (((*(_QWORD *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) != 0)
    {
      sub_22D89DBD8(0, a3);
      v19 = *(id *)(*(_QWORD *)(v11 + 48) + 8 * v18);
      v20 = sub_22D8B6FF0();

      if ((v20 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v24 = *(void **)(*(_QWORD *)(*v5 + 48) + 8 * v18);
        *a1 = v24;
        v25 = v24;
        return 0;
      }
      v21 = ~v17;
      while (1)
      {
        v18 = (v18 + 1) & v21;
        if (((*(_QWORD *)(v11 + 56 + ((v18 >> 3) & 0xFFFFFFFFFFFFF8)) >> v18) & 1) == 0)
          break;
        v22 = *(id *)(*(_QWORD *)(v11 + 48) + 8 * v18);
        v23 = sub_22D8B6FF0();

        if ((v23 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v38 = *v5;
    *v5 = 0x8000000000000000;
    v31 = a2;
    sub_22D87BAF4((uint64_t)v31, v18, isUniquelyReferenced_nonNull_native, a5, a3);
    *v5 = v38;
    swift_bridgeObjectRelease();
    *a1 = v31;
  }
  return 1;
}

uint64_t sub_22D89CCA4(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(a3);
    v6 = sub_22D8B70F8();
    v19 = v6;
    sub_22D8B70B0();
    if (sub_22D8B70D4())
    {
      sub_22D89DBD8(0, a4);
      do
      {
        swift_dynamicCast();
        v6 = v19;
        v13 = *(_QWORD *)(v19 + 16);
        if (*(_QWORD *)(v19 + 24) <= v13)
        {
          sub_22D89C360(v13 + 1, a3);
          v6 = v19;
        }
        result = sub_22D8B6FE4();
        v8 = v6 + 56;
        v9 = -1 << *(_BYTE *)(v6 + 32);
        v10 = result & ~v9;
        v11 = v10 >> 6;
        if (((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6))) != 0)
        {
          v12 = __clz(__rbit64((-1 << v10) & ~*(_QWORD *)(v6 + 56 + 8 * (v10 >> 6)))) | v10 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v14 = 0;
          v15 = (unint64_t)(63 - v9) >> 6;
          do
          {
            if (++v11 == v15 && (v14 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v16 = v11 == v15;
            if (v11 == v15)
              v11 = 0;
            v14 |= v16;
            v17 = *(_QWORD *)(v8 + 8 * v11);
          }
          while (v17 == -1);
          v12 = __clz(__rbit64(~v17)) + (v11 << 6);
        }
        *(_QWORD *)(v8 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
        *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v12) = v18;
        ++*(_QWORD *)(v6 + 16);
      }
      while (sub_22D8B70D4());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v6;
}

id sub_22D89CEA4(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_22D8B70E0();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 56);
  v7 = v3 + 56;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 56);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_28;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
      {
        v10 = v19 + 2;
        if (v19 + 2 >= v14)
          goto LABEL_28;
        v20 = *(_QWORD *)(v7 + 8 * v10);
        if (!v20)
          break;
      }
    }
LABEL_27:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    result = v18;
  }
  v21 = v19 + 3;
  if (v21 >= v14)
    goto LABEL_28;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_22D89D044()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = sub_22D8B5C40();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B120);
  v6 = *v0;
  v7 = sub_22D8B70E0();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_22D89D268(uint64_t a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
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
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;

  v3 = v2;
  v4 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v5 = sub_22D8B70EC();
  v6 = v5;
  if (!*(_QWORD *)(v4 + 16))
  {
    result = swift_release();
LABEL_35:
    *v3 = v6;
    return result;
  }
  v29 = v2;
  v7 = 1 << *(_BYTE *)(v4 + 32);
  v8 = v4 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v4 + 56);
  v11 = (unint64_t)(v7 + 63) >> 6;
  v12 = v5 + 56;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v14 << 6);
      goto LABEL_24;
    }
    v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v18 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v14;
    if (!v19)
    {
      v14 = v18 + 1;
      if (v18 + 1 >= v11)
        goto LABEL_33;
      v19 = *(_QWORD *)(v8 + 8 * v14);
      if (!v19)
      {
        v14 = v18 + 2;
        if (v18 + 2 >= v11)
          goto LABEL_33;
        v19 = *(_QWORD *)(v8 + 8 * v14);
        if (!v19)
          break;
      }
    }
LABEL_23:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v14 << 6);
LABEL_24:
    v21 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v17);
    result = sub_22D8B6FE4();
    v22 = -1 << *(_BYTE *)(v6 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        v28 = *(_QWORD *)(v12 + 8 * v24);
      }
      while (v28 == -1);
      v15 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v15) = v21;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v11)
  {
LABEL_33:
    result = swift_release_n();
    v3 = v29;
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v14 = v20;
    goto LABEL_23;
  }
  while (1)
  {
    v14 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v14 >= v11)
      goto LABEL_33;
    v19 = *(_QWORD *)(v8 + 8 * v14);
    ++v20;
    if (v19)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_22D89D4DC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_22D8B5C40();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B120);
  v7 = sub_22D8B70EC();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_24;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_33;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_33;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_24:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_22D89DB30(&qword_255D9B0F8, MEMORY[0x24BDCEA88]);
    result = sub_22D8B6DEC();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v33)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v32 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_22D89D7FC(uint64_t a1)
{
  uint64_t v1;

  return sub_22D89B988(a1, *(_QWORD *)(v1 + 16), &qword_255D9B108, MEMORY[0x24BE08C48], (uint64_t)&unk_24F95D8F0, (uint64_t)sub_22D87B228);
}

uint64_t sub_22D89D834(uint64_t a1)
{
  uint64_t v1;

  return sub_22D89B988(a1, *(_QWORD *)(v1 + 16), &qword_255D9B0D8, MEMORY[0x24BE08C30], (uint64_t)&unk_24F95D8C8, (uint64_t)sub_22D89DAF0);
}

uint64_t *assignWithCopy for SiriTimeDeviceContextProvider(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
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

uint64_t assignWithTake for SiriTimeDeviceContextProvider(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTimeDeviceContextProvider(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriTimeDeviceContextProvider(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeDeviceContextProvider()
{
  return &type metadata for SiriTimeDeviceContextProvider;
}

uint64_t sub_22D89DAE4()
{
  return objectdestroyTm(&qword_255D9B0D8);
}

void sub_22D89DAF0(unint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B0D8);
  sub_22D89BB14(a1);
}

uint64_t sub_22D89DB30(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_22D8B5C40();
    result = MEMORY[0x22E31A408](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22D89DB70()
{
  return objectdestroyTm(&qword_255D9B108);
}

uint64_t sub_22D89DB7C(unint64_t a1, const char *a2, const char *a3)
{
  uint64_t v3;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255D9B108) - 8) + 80);
  return sub_22D87B23C(a1, v3 + ((v7 + 16) & ~v7), a2, a3);
}

uint64_t sub_22D89DBD8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22D89DC10(uint64_t a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;

  v2 = sub_22D8B5C40();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A800);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a1 + 16);
  sub_22D89DB30(&qword_255D9B0F8, MEMORY[0x24BDCEA88]);
  v18 = sub_22D8B6F6C();
  if (v12)
  {
    v13 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v17 = *(_QWORD *)(v3 + 72);
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    while (1)
    {
      v14(v11, v13, v2);
      v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
      v15(v11, 0, 1, v2);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v11, 1, v2) == 1)
        break;
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v11, v2);
      sub_22D87B8A0((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v13 += v17;
      if (!--v12)
        goto LABEL_7;
    }
  }
  else
  {
    v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
LABEL_7:
    v15(v11, 1, 1, v2);
  }
  return v18;
}

uint64_t sub_22D89DDD4()
{
  return objectdestroyTm(&qword_255D9B108);
}

uint64_t sub_22D89DDE0(unint64_t a1)
{
  return sub_22D89DB7C(a1, "Fetching alarm context for %ld devices", "Fetching alarmContexts: got nil context array");
}

uint64_t sub_22D89DE04()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t SiriTimeDeviceResolutionService.devicesCapableOfIntentHandling.getter()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_22D89DE24()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[3];
  v2 = swift_task_alloc();
  v0[4] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[5] = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B0A8);
  *v3 = v0;
  v3[1] = sub_22D89DED4;
  return sub_22D8B7320();
}

uint64_t sub_22D89DED4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D89DF30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9B128);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9B128);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_22D89DFC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  _QWORD v14[5];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B198);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  sub_22D87832C(a2, (uint64_t)v14);
  v13 = v14[4];
  __swift_project_boxed_opaque_existential_1(v14, v14[3]);
  v9 = swift_bridgeObjectRetain();
  sub_22D89DC10(v9);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v10 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)&v14[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  swift_bridgeObjectRetain();
  sub_22D8B6CD8();
  swift_release();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
}

uint64_t SiriTimeDeviceResolutionService.targetingDevices()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[7] = v0;
  v2 = sub_22D8B6C3C();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v3 = sub_22D8B6C60();
  v1[11] = v3;
  v1[12] = *(_QWORD *)(v3 - 8);
  v1[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22D89E19C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  sub_22D8B6C54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B158);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_22D8B7E30;
  sub_22D8B6C30();
  v0[2] = v1;
  sub_22D879430(&qword_255D9B160, (uint64_t (*)(uint64_t))MEMORY[0x24BEA9068], MEMORY[0x24BEA9078]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B168);
  sub_22D89ECD0();
  sub_22D8B7098();
  sub_22D8B6C48();
  if (qword_255D9A378 != -1)
    swift_once();
  v2 = sub_22D8B6D80();
  v0[14] = __swift_project_value_buffer(v2, (uint64_t)qword_255D9B128);
  v3 = sub_22D8B6D68();
  v4 = sub_22D8B6FC0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_22D86F000, v3, v4, "targetingDevices() Begin resolving targetable devices", v5, 2u);
    MEMORY[0x22E31A4BC](v5, -1, -1);
  }
  v7 = v0[12];
  v6 = v0[13];
  v8 = v0[11];
  v9 = (_QWORD *)v0[7];

  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B178);
  v10 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v11 = swift_allocObject();
  v0[15] = v11;
  *(_OWORD *)(v11 + 16) = xmmword_22D8B7E30;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v7 + 16))(v11 + v10, v6, v8);
  v12 = (_QWORD *)swift_task_alloc();
  v0[16] = v12;
  *v12 = v0;
  v12[1] = sub_22D89E3EC;
  return sub_22D8B6CFC();
}

uint64_t sub_22D89E3EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 136) = a1;
  *(_QWORD *)(v3 + 144) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_22D89E460()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  _BOOL4 v3;
  unint64_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  swift_bridgeObjectRetain_n();
  v1 = sub_22D8B6D68();
  v2 = sub_22D8B6FC0();
  v3 = os_log_type_enabled(v1, v2);
  v4 = *(_QWORD *)(v0 + 136);
  if (v3)
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v18 = v6;
    *(_DWORD *)v5 = 136315138;
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      v7 = sub_22D8B71C4();
      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v8 = *(_QWORD *)(v0 + 96);
    v16 = *(_QWORD *)(v0 + 88);
    v17 = *(_QWORD *)(v0 + 104);
    *(_QWORD *)(v0 + 40) = v7;
    v9 = sub_22D8B7314();
    *(_QWORD *)(v0 + 48) = sub_22D8755FC(v9, v10, &v18);
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22D86F000, v1, v2, "targetingDevices() found targetable device count: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v6, -1, -1);
    MEMORY[0x22E31A4BC](v5, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v17, v16);
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 96);
    v11 = *(_QWORD *)(v0 + 104);
    v13 = *(_QWORD *)(v0 + 88);

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }
  v14 = *(_QWORD *)(v0 + 136);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v14);
}

uint64_t sub_22D89E66C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v1 = *(void **)(v0 + 144);
  swift_bridgeObjectRelease();
  v2 = v1;
  v3 = v1;
  v4 = sub_22D8B6D68();
  v5 = sub_22D8B6FB4();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 144);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    *(_DWORD *)v7 = 136315138;
    v17 = v8;
    *(_QWORD *)(v0 + 24) = v6;
    v9 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A838);
    v10 = sub_22D8B6E28();
    *(_QWORD *)(v0 + 32) = sub_22D8755FC(v10, v11, &v17);
    sub_22D8B7044();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22D86F000, v4, v5, "Error fetching targeting accessories from #hal: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v8, -1, -1);
    MEMORY[0x22E31A4BC](v7, -1, -1);
  }
  else
  {
    v12 = *(void **)(v0 + 144);

  }
  v14 = *(_QWORD *)(v0 + 96);
  v13 = *(_QWORD *)(v0 + 104);
  v15 = *(_QWORD *)(v0 + 88);

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
}

uint64_t SiriTimeDeviceResolutionService.currentLocalDevice()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = v0;
  return swift_task_switch();
}

uint64_t sub_22D89E864()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 32), *(_QWORD *)(*(_QWORD *)(v0 + 32) + 24));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v1;
  *v1 = v0;
  v1[1] = sub_22D89E8D8;
  return sub_22D8B6CF0();
}

uint64_t sub_22D89E8D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 48) = a1;
  *(_QWORD *)(v3 + 56) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D89E944()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(v0 + 48);
  if (v1 >> 62)
    goto LABEL_21;
  v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; v2 = sub_22D8B71C4())
  {
    v3 = *(_QWORD *)(v0 + 48);
    v4 = v1 & 0xC000000000000001;
    if ((v1 & 0xC000000000000001) == 0)
    {
      v5 = *(id *)(v3 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v5 = (id)MEMORY[0x22E319D0C](0, v3);
LABEL_5:
      v1 = (unint64_t)v5;
      sub_22D8B6C90();
      v6 = sub_22D8B6D5C();
      if (v6 == sub_22D8B6D5C())
      {
LABEL_6:
        swift_bridgeObjectRelease_n();
        return (*(uint64_t (**)(unint64_t))(v0 + 8))(v1);
      }

      if (v2 == 1)
        goto LABEL_18;
      if (v4)
        break;
      v4 = *(_QWORD *)(v0 + 48);
      v11 = 5;
      while (1)
      {
        v12 = v11 - 3;
        if (__OFADD__(v11 - 4, 1))
          break;
        v1 = (unint64_t)*(id *)(v4 + 8 * v11);
        sub_22D8B6C90();
        v13 = sub_22D8B6D5C();
        if (v13 == sub_22D8B6D5C())
          goto LABEL_6;

        ++v11;
        if (v12 == v2)
          goto LABEL_18;
      }
      __break(1u);
    }
    v7 = 1;
    while (1)
    {
      v8 = MEMORY[0x22E319D0C](v7, *(_QWORD *)(v0 + 48));
      v9 = v7 + 1;
      if (__OFADD__(v7, 1))
        break;
      v1 = v8;
      sub_22D8B6C90();
      v10 = sub_22D8B6D5C();
      if (v10 == sub_22D8B6D5C())
        goto LABEL_6;
      swift_unknownObjectRelease();
      ++v7;
      if (v9 == v2)
        goto LABEL_18;
    }
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease_n();
  v1 = 0;
  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v1);
}

uint64_t sub_22D89EADC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;

  if (qword_255D9A378 != -1)
    swift_once();
  v1 = *(void **)(v0 + 56);
  v2 = sub_22D8B6D80();
  __swift_project_value_buffer(v2, (uint64_t)qword_255D9B128);
  v3 = v1;
  v4 = v1;
  v5 = sub_22D8B6D68();
  v6 = sub_22D8B6FB4();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 56);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v15 = v10;
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)(v0 + 16) = v8;
    v11 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A838);
    v12 = sub_22D8B6E28();
    *(_QWORD *)(v0 + 24) = sub_22D8755FC(v12, v13, &v15);
    sub_22D8B7044();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22D86F000, v5, v6, "Unable to get devicesWithProximity: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v10, -1, -1);
    MEMORY[0x22E31A4BC](v9, -1, -1);

  }
  else
  {

  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

unint64_t sub_22D89ECD0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255D9B170;
  if (!qword_255D9B170)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D9B168);
    result = MEMORY[0x22E31A408](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255D9B170);
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeDeviceResolutionService()
{
  return &type metadata for SiriTimeDeviceResolutionService;
}

uint64_t sub_22D89ED2C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B188);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_22D89ED90()
{
  return swift_release();
}

uint64_t sub_22D89ED98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B198);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

id SASTButtonItem.init(label:commands:)()
{
  id v0;
  id v1;
  void *v2;
  id v3;
  void *v4;

  v0 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  objc_msgSend(v0, sel_setCentered_, 1);
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE815D8]), sel_init);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D9B200);
  v2 = (void *)sub_22D8B6EAC();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setCommands_, v2);

  objc_msgSend(v0, sel_setAction_, v1);
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE818B8]), sel_init);
  v4 = (void *)sub_22D8B6E04();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setText_, v4);

  objc_msgSend(v0, sel_setDecoratedLabel_, v3);
  return v0;
}

uint64_t NoOpFlow.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t NoOpFlow.init()()
{
  uint64_t v0;

  return v0;
}

uint64_t NoOpFlow.on(input:)()
{
  return 0;
}

uint64_t NoOpFlow.execute()(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_22D89EF8C()
{
  uint64_t v0;

  sub_22D8B5FA0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t NoOpFlow.execute(completion:)()
{
  type metadata accessor for NoOpFlow();
  sub_22D89F034();
  return sub_22D8B5DFC();
}

uint64_t type metadata accessor for NoOpFlow()
{
  return objc_opt_self();
}

unint64_t sub_22D89F034()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255D9B218[0];
  if (!qword_255D9B218[0])
  {
    v1 = type metadata accessor for NoOpFlow();
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for NoOpFlow, v1);
    atomic_store(result, qword_255D9B218);
  }
  return result;
}

uint64_t NoOpFlow.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t NoOpFlow.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_22D89F090()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_22D89C1CC;
  return sub_22D8B5E14();
}

uint64_t sub_22D89F0F8()
{
  type metadata accessor for NoOpFlow();
  return sub_22D8B5DFC();
}

uint64_t sub_22D89F150(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_22D89F168()
{
  type metadata accessor for NoOpFlow();
  return sub_22D8B5E20();
}

uint64_t sub_22D89F190()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9B2E0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9B2E0);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t AppInstallUtil.Domain.appTypeToInstall.getter(unsigned __int8 a1)
{
  if (a1 >= 3u)
    return 0x68746C616568;
  else
    return 0x6B636F6C63;
}

uint64_t AppInstallUtil.Domain.rawValue.getter(char a1)
{
  return *(_QWORD *)&aClock_2[8 * a1];
}

uint64_t sub_22D89F270(char *a1, char *a2)
{
  return sub_22D8A18E4(*a1, *a2);
}

uint64_t sub_22D89F27C()
{
  return sub_22D8A2194();
}

uint64_t sub_22D89F284()
{
  return sub_22D8A24CC();
}

uint64_t sub_22D89F28C()
{
  return sub_22D8A2884();
}

uint64_t sub_22D89F294@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s16SiriTimeInternal14AppInstallUtilV6DomainO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_22D89F2C0@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = AppInstallUtil.Domain.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void AppInstallUtil.installOrOpenURL(installOnly:)(char a1, unsigned __int8 a2)
{
  if ((a1 & 1) != 0)
  {
    if (a2 < 3u)
    {
LABEL_3:
      sub_22D89F32C(0);
      return;
    }
    sub_22D89F32C(5);
  }
  else
  {
    if (a2 < 3u)
      goto LABEL_3;
    sub_22D8B5B98();
  }
}

void sub_22D89F32C(char a1)
{
  sub_22D8B7128();
  swift_bridgeObjectRelease();
  __asm { BR              X10 }
}

uint64_t sub_22D89F3B8()
{
  sub_22D8B6E70();
  swift_bridgeObjectRelease();
  sub_22D8B5B98();
  return swift_bridgeObjectRelease();
}

uint64_t AppInstallUtil.appStorePunchout(installOnly:)@<X0>(char a1@<W0>, unsigned __int8 a2@<W1>, uint64_t a3@<X8>)
{
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
  char *v16;
  char v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  int v39;
  uint64_t v40;
  uint8_t *v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  uint8_t *v45;
  void *v46;
  uint64_t v47;
  uint8_t *v48;
  uint8_t *v49;
  int v50;
  void *v51;
  uint64_t v52;
  id v53[2];

  v53[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = sub_22D8B5C40();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_22D8B5BA4();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    if (a2 >= 3u)
      v17 = 5;
    else
      v17 = 0;
    goto LABEL_7;
  }
  if (a2 < 3u)
  {
    v17 = 0;
LABEL_7:
    sub_22D89F32C(v17);
    goto LABEL_9;
  }
  sub_22D8B5B98();
LABEL_9:
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_22D8740E0((uint64_t)v12, &qword_255D9B300);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
    v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
    v19 = (void *)sub_22D8B5B80();
    objc_msgSend(v18, sel_setPunchOutUri_, v19);

    v20 = v18;
    sub_22D8B5C34();
    sub_22D8B5C10();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v21 = (void *)sub_22D8B6E04();
    swift_bridgeObjectRelease();
    objc_msgSend(v20, sel_setAceId_, v21);

    v22 = objc_msgSend(v20, sel_dictionary);
    if (v22)
    {
      v23 = v22;
      v24 = (void *)objc_opt_self();
      v53[0] = 0;
      v25 = objc_msgSend(v24, sel_dataWithPropertyList_format_options_error_, v23, 200, 0, v53);
      v26 = v53[0];
      if (v25)
      {
        v27 = sub_22D8B5BC8();
        v29 = v28;

        sub_22D8B5BBC();
        sub_22D8B6B58();
        sub_22D8762DC(v27, v29);

        (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
        v30 = sub_22D8B6B64();
        return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(a3, 0, 1, v30);
      }
      v32 = v26;
      v33 = (void *)sub_22D8B5B74();

      swift_willThrow();
      if (qword_255D9A380 != -1)
        swift_once();
      v34 = sub_22D8B6D80();
      __swift_project_value_buffer(v34, (uint64_t)qword_255D9B2E0);
      v35 = v33;
      v36 = v33;
      v37 = sub_22D8B6D68();
      v38 = sub_22D8B6FB4();
      v39 = v38;
      if (os_log_type_enabled(v37, v38))
      {
        v40 = swift_slowAlloc();
        v50 = v39;
        v41 = (uint8_t *)v40;
        v51 = (void *)swift_slowAlloc();
        v52 = (uint64_t)v33;
        v53[0] = v51;
        v49 = v41;
        *(_DWORD *)v41 = 136315138;
        v48 = v41 + 4;
        v42 = v33;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A838);
        v43 = sub_22D8B6E28();
        v52 = sub_22D8755FC(v43, v44, (uint64_t *)v53);
        sub_22D8B7044();
        swift_bridgeObjectRelease();

        v45 = v49;
        _os_log_impl(&dword_22D86F000, v37, (os_log_type_t)v50, "Error generating ACE punch out command: %s", v49, 0xCu);
        v46 = v51;
        swift_arrayDestroy();
        MEMORY[0x22E31A4BC](v46, -1, -1);
        MEMORY[0x22E31A4BC](v45, -1, -1);

      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);

    }
  }
  v47 = sub_22D8B6B64();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(a3, 1, 1, v47);
}

uint64_t AppInstallDialogOutputUtil.init(domain:fallbackCAT:)@<X0>(char a1@<W0>, __int128 *a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  *a3 = a1;
  result = sub_22D874D04(a2, (uint64_t)(a3 + 8));
  a3[48] = a1;
  return result;
}

uint64_t AppInstallDialogOutputUtil.makeLaunchAppView()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
  v1[3] = swift_task_alloc();
  v2 = sub_22D8B5BA4();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22D89FA98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v9;

  if (**(unsigned __int8 **)(v0 + 16) > 2u)
  {
    sub_22D8B5B98();
  }
  else
  {
    sub_22D8B7128();
    swift_bridgeObjectRelease();
    sub_22D8B6E70();
    sub_22D8B5B98();
    swift_bridgeObjectRelease();
  }
  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_22D8740E0(v3, &qword_255D9B300);
    if (qword_255D9A380 != -1)
      swift_once();
    v4 = sub_22D8B6D80();
    __swift_project_value_buffer(v4, (uint64_t)qword_255D9B2E0);
    v5 = sub_22D8B6D68();
    v6 = sub_22D8B6FB4();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_22D86F000, v5, v6, "AlarmButtonFactory.makeLaunchAppView returned invalid URL for sleep punchout URL", v7, 2u);
      MEMORY[0x22E31A4BC](v7, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x24BEE4AF8]);
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v2 + 32))(*(_QWORD *)(v0 + 48), v3, v1);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v9;
    *v9 = v0;
    v9[1] = sub_22D89FCC8;
    return sub_22D89FDE4(MEMORY[0x24BEE4AF8], *(_QWORD *)(v0 + 48));
  }
}

uint64_t sub_22D89FCC8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 64) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_22D89FD3C()
{
  uint64_t v0;
  uint64_t v1;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
  v1 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_22D89FD94()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D89FDE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v4 = sub_22D8B5F88();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B330);
  v3[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B318);
  v3[9] = swift_task_alloc();
  v5 = sub_22D8B6048();
  v3[10] = v5;
  v3[11] = *(_QWORD *)(v5 - 8);
  v3[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22D89FEB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(_QWORD, BOOL, _QWORD, uint64_t, uint64_t);

  v1 = v0[9];
  v2 = v0[4];
  v3 = *(_QWORD *)(v2 + 32);
  v4 = *(_QWORD *)(v2 + 40);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 8), v3);
  v5 = AppInstallUtil.isAppInstalled.getter(*(_BYTE *)v2);
  sub_22D8B6E34();
  swift_bridgeObjectRelease();
  v6 = sub_22D8B6B64();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v1, 0, 1, v6);
  v9 = (uint64_t (*)(_QWORD, BOOL, _QWORD, uint64_t, uint64_t))(**(int **)(v4 + 8) + *(_QWORD *)(v4 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  v0[13] = v7;
  *v7 = v0;
  v7[1] = sub_22D89FFCC;
  return v9(v0[12], (v5 & 1) == 0, v0[9], v3, v4);
}

uint64_t sub_22D89FFCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  sub_22D8740E0(v2, &qword_255D9B318);
  return swift_task_switch();
}

uint64_t sub_22D8A0044()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v1 = sub_22D8B603C();
  v2 = *(_QWORD *)(v1 + 16);
  v3 = sub_22D8B6060();
  v4 = *(_QWORD *)(v3 - 8);
  if (v2)
  {
    (*(void (**)(_QWORD, unint64_t, uint64_t))(v4 + 16))(*(_QWORD *)(v0 + 64), v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80)), v3);
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  v6 = *(_QWORD *)(v0 + 64);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56))(v6, v5, 1, v3);
  swift_bridgeObjectRelease();
  v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v3);
  v8 = *(_QWORD *)(v0 + 64);
  if (v7 == 1)
  {
    sub_22D8740E0(*(_QWORD *)(v0 + 64), &qword_255D9B330);
    if (qword_255D9A380 != -1)
      swift_once();
    v9 = sub_22D8B6D80();
    __swift_project_value_buffer(v9, (uint64_t)qword_255D9B2E0);
    v10 = sub_22D8B6D68();
    v11 = sub_22D8B6FB4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_22D86F000, v10, v11, "AppInstallDialogOutputUtil.makeOpenAppButtonViews failed to get button text from template", v12, 2u);
      MEMORY[0x22E31A4BC](v12, -1, -1);
    }
    v13 = *(_QWORD *)(v0 + 16);

    if (v13)
      v14 = v13;
    else
      v14 = MEMORY[0x24BEE4AF8];
    if (v14 >> 62)
    {
      sub_22D8A1250();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v23 = sub_22D8B71B8();
      swift_bridgeObjectRelease_n();
      v14 = v23;
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_22D8B7404();
      swift_bridgeObjectRelease();
      sub_22D8A1250();
    }
  }
  else
  {
    v16 = *(_QWORD *)(v0 + 48);
    v15 = *(_QWORD *)(v0 + 56);
    v17 = *(_QWORD *)(v0 + 40);
    v18 = *(_QWORD *)(v0 + 16);
    sub_22D8B6054();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v8, v3);
    sub_22D8B5F7C();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    v19 = sub_22D8A0408();
    swift_bridgeObjectRelease();
    if (v18)
      v20 = v18;
    else
      v20 = MEMORY[0x24BEE4AF8];
    if (v20 >> 62)
    {
      sub_22D8A1250();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v21 = sub_22D8B71B8();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_22D8B7404();
      sub_22D8A1250();
      v21 = v20;
    }
    swift_bridgeObjectRelease();
    sub_22D8A076C(v19);
    v14 = v21;
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v14);
}

uint64_t sub_22D8A03AC()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8A0408()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81888]), sel_init);
  v1 = (void *)sub_22D8B6E04();
  objc_msgSend(v0, sel_setText_, v1);

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
  v3 = (void *)sub_22D8B5B80();
  objc_msgSend(v2, sel_setPunchOutUri_, v3);

  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B350);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22D8B7AC0;
  *(_QWORD *)(v4 + 32) = v2;
  sub_22D8B6ED0();
  v5 = v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D9B200);
  v6 = (void *)sub_22D8B6EAC();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_setCommands_, v6);

  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_22D8B7AC0;
  *(_QWORD *)(v7 + 32) = v0;
  v9 = v7;
  sub_22D8B6ED0();

  return v9;
}

uint64_t sub_22D8A0578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  void (*v15)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v16;
  _QWORD *v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v21;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B318);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a5[2];
  if (!v11)
    return 0;
  v12 = a5[4] == a1 && a5[5] == a2;
  if (v12 || (result = sub_22D8B73F8(), (result & 1) != 0))
  {
LABEL_7:
    sub_22D8B6BB8();
    swift_allocObject();
    sub_22D8B6BAC();
    sub_22D8B6E34();
    v14 = sub_22D8B6B64();
    v15 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
    v15(v10, 0, 1, v14);
    sub_22D8B6B94();
    swift_release();
    sub_22D8740E0((uint64_t)v10, &qword_255D9B318);
    sub_22D8B6E34();
    v15(v10, 0, 1, v14);
    sub_22D8B6B88();
    swift_release();
    sub_22D8740E0((uint64_t)v10, &qword_255D9B318);
    v16 = sub_22D8B6BA0();
    swift_release();
    return v16;
  }
  if (v11 == 1)
    return 0;
  v17 = a5 + 7;
  for (i = 1; ; ++i)
  {
    v19 = i + 1;
    if (__OFADD__(i, 1))
      break;
    if (*(v17 - 1) == a1 && *v17 == a2)
      goto LABEL_7;
    result = sub_22D8B73F8();
    if ((result & 1) != 0)
      goto LABEL_7;
    v16 = 0;
    v17 += 2;
    if (v19 == v11)
      return v16;
  }
  __break(1u);
  return result;
}

uint64_t sub_22D8A076C(unint64_t a1)
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
    v3 = sub_22D8B71C4();
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
    v5 = sub_22D8B71C4();
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
    v4 = MEMORY[0x22E319D18](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_22D8A0A18(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_22D8B71C4();
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
    return sub_22D8B6ED0();
  }
  __break(1u);
  return result;
}

void (*sub_22D8A0924(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_22D8A09A4(v6, a2, a3);
  return sub_22D8A0978;
}

void sub_22D8A0978(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_22D8A09A4(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x22E319D0C](a2, a3);
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
    return sub_22D8A0A10;
  }
  __break(1u);
  return result;
}

void sub_22D8A0A10(id *a1)
{

}

uint64_t sub_22D8A0A18(unint64_t a1, uint64_t a2, unint64_t a3)
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
    v7 = sub_22D8B71C4();
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
    v10 = sub_22D8B71C4();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_22D8A128C();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B340);
          v12 = sub_22D8A0924(v16, i, a3);
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
    sub_22D8A1250();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_22D8B71F4();
  __break(1u);
  return result;
}

uint64_t sub_22D8A0C10(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;

  v24 = MEMORY[0x24BEE4AF8];
  v22 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v23 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (v6)
  {
    v9 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v10 = v9 | (v8 << 6);
LABEL_22:
    v14 = 16 * v10;
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 48) + v14);
    v16 = *v15;
    v17 = v15[1];
    v18 = (uint64_t *)(*(_QWORD *)(a1 + 56) + v14);
    v19 = *v18;
    v20 = v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v21 = a2(v16, v17, v19, v20);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if (v21)
    {
      MEMORY[0x22E319A6C](result);
      if (*(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_22D8B6EDC();
      sub_22D8B6EF4();
      result = sub_22D8B6ED0();
    }
  }
  v11 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_28;
  }
  if (v11 >= v23)
    goto LABEL_26;
  v12 = *(_QWORD *)(v22 + 8 * v11);
  ++v8;
  if (v12)
    goto LABEL_21;
  v8 = v11 + 1;
  if (v11 + 1 >= v23)
    goto LABEL_26;
  v12 = *(_QWORD *)(v22 + 8 * v8);
  if (v12)
    goto LABEL_21;
  v8 = v11 + 2;
  if (v11 + 2 >= v23)
    goto LABEL_26;
  v12 = *(_QWORD *)(v22 + 8 * v8);
  if (v12)
    goto LABEL_21;
  v8 = v11 + 3;
  if (v11 + 3 >= v23)
    goto LABEL_26;
  v12 = *(_QWORD *)(v22 + 8 * v8);
  if (v12)
  {
LABEL_21:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v8 << 6);
    goto LABEL_22;
  }
  v13 = v11 + 4;
  if (v13 >= v23)
  {
LABEL_26:
    swift_release();
    return v24;
  }
  v12 = *(_QWORD *)(v22 + 8 * v13);
  if (v12)
  {
    v8 = v13;
    goto LABEL_21;
  }
  while (1)
  {
    v8 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v8 >= v23)
      goto LABEL_26;
    v12 = *(_QWORD *)(v22 + 8 * v8);
    ++v13;
    if (v12)
      goto LABEL_21;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t _s16SiriTimeInternal14AppInstallUtilV6DomainO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_22D8B7200();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

unint64_t sub_22D8A0EA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255D9B320;
  if (!qword_255D9B320)
  {
    v1 = sub_22D8B6BD0();
    result = MEMORY[0x22E31A408](MEMORY[0x24BE90BD0], v1);
    atomic_store(result, (unint64_t *)&qword_255D9B320);
  }
  return result;
}

uint64_t sub_22D8A0EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_22D8A0578(a1, a2, a3, a4, *(_QWORD **)(v4 + 16));
}

unint64_t sub_22D8A0EF8()
{
  unint64_t result;

  result = qword_255D9B328;
  if (!qword_255D9B328)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for AppInstallUtil.Domain, &type metadata for AppInstallUtil.Domain);
    atomic_store(result, (unint64_t *)&qword_255D9B328);
  }
  return result;
}

ValueMetadata *type metadata accessor for AppInstallUtil()
{
  return &type metadata for AppInstallUtil;
}

uint64_t _s16SiriTimeInternal14AppInstallUtilV6DomainOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s16SiriTimeInternal14AppInstallUtilV6DomainOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D8A1030 + 4 * byte_22D8B8E1E[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22D8A1064 + 4 * byte_22D8B8E19[v4]))();
}

uint64_t sub_22D8A1064(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8A106C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D8A1074);
  return result;
}

uint64_t sub_22D8A1080(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D8A1088);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22D8A108C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8A1094(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppInstallUtil.Domain()
{
  return &type metadata for AppInstallUtil.Domain;
}

uint64_t destroy for AppInstallDialogOutputUtil(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1Tm(a1 + 8);
}

uint64_t initializeWithCopy for AppInstallDialogOutputUtil(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 32) = v4;
  (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1 + 8, a2 + 8);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t assignWithCopy for AppInstallDialogOutputUtil(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 8), (uint64_t *)(a2 + 8));
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AppInstallDialogOutputUtil(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 8);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppInstallDialogOutputUtil(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppInstallDialogOutputUtil(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppInstallDialogOutputUtil()
{
  return &type metadata for AppInstallDialogOutputUtil;
}

unint64_t sub_22D8A1250()
{
  unint64_t result;

  result = qword_255D9B338;
  if (!qword_255D9B338)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255D9B338);
  }
  return result;
}

unint64_t sub_22D8A128C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255D9B348;
  if (!qword_255D9B348)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D9B340);
    result = MEMORY[0x22E31A408](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_255D9B348);
  }
  return result;
}

void sub_22D8A12D8(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_22D8A1324(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))((char *)sub_22D8A13A4 + 4 * byte_22D8B8F56[a2]))(v2 + 10);
}

uint64_t sub_22D8A13A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == v1 + 10 && v2 == 0x800000022D8BD440)
    v3 = 1;
  else
    v3 = sub_22D8B73F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_22D8A145C(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aVerb_2[8 * a1] == *(_QWORD *)&aVerb_2[8 * a2] && qword_22D8B9298[a1] == qword_22D8B9298[a2])
    v3 = 1;
  else
    v3 = sub_22D8B73F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_22D8A14E0(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_22D8A152C(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))((char *)sub_22D8A15AC + 4 * byte_22D8B8F62[a2]))(v2 + 10);
}

uint64_t sub_22D8A15AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == v1 + 10 && v2 == 0x800000022D8BD5F0)
    v3 = 1;
  else
    v3 = sub_22D8B73F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_22D8A1664(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_22D8A16B0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_22D8A1798 + 4 * byte_22D8B8F71[a2]))(1651664246);
}

uint64_t sub_22D8A1798(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 1651664246 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_22D8B73F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_22D8A18E4(char a1, char a2)
{
  char v2;

  if (*(_QWORD *)&aClock_3[8 * a1] == *(_QWORD *)&aClock_3[8 * a2])
    v2 = 1;
  else
    v2 = sub_22D8B73F8();
  swift_bridgeObjectRelease_n();
  return v2 & 1;
}

uint64_t sub_22D8A1948(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x6C65636E6163;
  else
    v3 = 7562617;
  if (v2)
    v4 = 0xE300000000000000;
  else
    v4 = 0xE600000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x6C65636E6163;
  else
    v5 = 7562617;
  if ((a2 & 1) != 0)
    v6 = 0xE600000000000000;
  else
    v6 = 0xE300000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_22D8B73F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22D8A19DC(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aSleep_3[8 * a1] == *(_QWORD *)&aSleep_3[8 * a2] && qword_22D8B9308[a1] == qword_22D8B9308[a2])
    v3 = 1;
  else
    v3 = sub_22D8B73F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_22D8A1A60(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_22D8A1AAC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_22D8A1B9C + 4 * byte_22D8B8F83[a2]))(0x54746E6572727543);
}

uint64_t sub_22D8A1B9C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x54746E6572727543 && v1 == 0xEB000000006B7361)
    v2 = 1;
  else
    v2 = sub_22D8B73F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_22D8A1CD8(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_22D8A1D28(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))((char *)sub_22D8A1DE8 + 4 * byte_22D8B8F95[a2]))(v2 - 29);
}

uint64_t sub_22D8A1DE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == v1 - 29 && v2 == 0x800000022D8BD2C0)
    v3 = 1;
  else
    v3 = sub_22D8B73F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_22D8A1EE8()
{
  sub_22D8B7434();
  sub_22D8B6E4C();
  swift_bridgeObjectRelease();
  return sub_22D8B744C();
}

void sub_22D8A1F5C(char a1)
{
  sub_22D8B7434();
  __asm { BR              X10 }
}

uint64_t sub_22D8A1FB8()
{
  sub_22D8B6E4C();
  swift_bridgeObjectRelease();
  return sub_22D8B744C();
}

void sub_22D8A2044(char a1)
{
  sub_22D8B7434();
  __asm { BR              X10 }
}

uint64_t sub_22D8A20A0()
{
  sub_22D8B6E4C();
  swift_bridgeObjectRelease();
  return sub_22D8B744C();
}

uint64_t sub_22D8A212C()
{
  sub_22D8B7434();
  sub_22D8B6E4C();
  swift_bridgeObjectRelease();
  return sub_22D8B744C();
}

uint64_t sub_22D8A2194()
{
  sub_22D8B7434();
  sub_22D8B6E4C();
  swift_bridgeObjectRelease();
  return sub_22D8B744C();
}

void sub_22D8A21F0(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_22D8A2238()
{
  sub_22D8B6E4C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D8A22AC()
{
  sub_22D8B6E4C();
  return swift_bridgeObjectRelease();
}

void sub_22D8A22EC(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_22D8A2334()
{
  sub_22D8B6E4C();
  return swift_bridgeObjectRelease();
}

void sub_22D8A23A8(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_22D8A23EC()
{
  sub_22D8B6E4C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D8A24CC()
{
  sub_22D8B6E4C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D8A24F8()
{
  sub_22D8B6E4C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D8A2544()
{
  sub_22D8B6E4C();
  return swift_bridgeObjectRelease();
}

void sub_22D8A2584(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_22D8A25CC()
{
  sub_22D8B6E4C();
  return swift_bridgeObjectRelease();
}

void sub_22D8A26B0(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_22D8A26F8()
{
  sub_22D8B6E4C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D8A27B0()
{
  sub_22D8B7434();
  sub_22D8B6E4C();
  swift_bridgeObjectRelease();
  return sub_22D8B744C();
}

uint64_t sub_22D8A2814()
{
  sub_22D8B7434();
  sub_22D8B6E4C();
  swift_bridgeObjectRelease();
  return sub_22D8B744C();
}

uint64_t sub_22D8A2884()
{
  sub_22D8B7434();
  sub_22D8B6E4C();
  swift_bridgeObjectRelease();
  return sub_22D8B744C();
}

void sub_22D8A28DC(uint64_t a1, char a2)
{
  sub_22D8B7434();
  __asm { BR              X10 }
}

uint64_t sub_22D8A2934()
{
  sub_22D8B6E4C();
  swift_bridgeObjectRelease();
  return sub_22D8B744C();
}

void sub_22D8A29C0(uint64_t a1, char a2)
{
  sub_22D8B7434();
  __asm { BR              X10 }
}

uint64_t sub_22D8A2A18()
{
  sub_22D8B6E4C();
  swift_bridgeObjectRelease();
  return sub_22D8B744C();
}

uint64_t SiriTimeEventSender.TaskType.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D8A2AE4 + 4 * byte_22D8B8FDD[a1]))(0xD000000000000014, 0x800000022D8BD750);
}

uint64_t sub_22D8A2AE4()
{
  return 0x54746E6572727543;
}

uint64_t sub_22D8A2B04()
{
  return 0x616572436F646E55;
}

unint64_t sub_22D8A2B3C()
{
  return 0xD000000000000013;
}

uint64_t sub_22D8A2B9C()
{
  uint64_t v0;

  return v0 + 2;
}

void sub_22D8A2BB4(char *a1)
{
  sub_22D8A1A60(*a1);
}

uint64_t sub_22D8A2BC0()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_22D8B7434();
  sub_22D8A2584((uint64_t)v3, v1);
  return sub_22D8B744C();
}

void sub_22D8A2C04(uint64_t a1)
{
  char *v1;

  sub_22D8A2584(a1, *v1);
}

uint64_t sub_22D8A2C0C()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_22D8B7434();
  sub_22D8A2584((uint64_t)v3, v1);
  return sub_22D8B744C();
}

uint64_t sub_22D8A2C4C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s16SiriTimeInternal0aB11EventSenderO8TaskTypeO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_22D8A2C78@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = SiriTimeEventSender.TaskType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t SiriTimeEventSender.ReasonDescription.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D8A2CE0 + 4 * byte_22D8B8FE6[a1]))(0xD000000000000020, 0x800000022D8BD7F0);
}

uint64_t sub_22D8A2CE0()
{
  uint64_t v0;

  return v0 - 4;
}

uint64_t sub_22D8A2E88(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = SiriTimeEventSender.ReasonDescription.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == SiriTimeEventSender.ReasonDescription.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_22D8B73F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22D8A2F10()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_22D8B7434();
  SiriTimeEventSender.ReasonDescription.rawValue.getter(v1);
  sub_22D8B6E4C();
  swift_bridgeObjectRelease();
  return sub_22D8B744C();
}

uint64_t sub_22D8A2F70()
{
  unsigned __int8 *v0;

  SiriTimeEventSender.ReasonDescription.rawValue.getter(*v0);
  sub_22D8B6E4C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D8A2FB0()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_22D8B7434();
  SiriTimeEventSender.ReasonDescription.rawValue.getter(v1);
  sub_22D8B6E4C();
  swift_bridgeObjectRelease();
  return sub_22D8B744C();
}

uint64_t sub_22D8A300C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s16SiriTimeInternal0aB11EventSenderO17ReasonDescriptionO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_22D8A3038@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = SiriTimeEventSender.ReasonDescription.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

BOOL SiriTimeEventSender.Attribute.init(rawValue:)()
{
  uint64_t v0;

  v0 = sub_22D8B7200();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

uint64_t sub_22D8A30B8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_22D8B7200();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_22D8A3108@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = _s16SiriTimeInternal0aB11EventSenderO9AttributeO8rawValueSSvg_0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void static SiriTimeEventSender.sendEvent(activityType:taskType:reason:attribute:description:)(uint64_t a1, char a2, uint64_t a3, int a4, int a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _DWORD v12[2];
  _QWORD v13[4];

  v12[0] = a4;
  v12[1] = a5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B358);
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_22D8B5F40();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D8B5E38();
  __swift_project_boxed_opaque_existential_1(v13, v13[3]);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  __asm { BR              X10 }
}

uint64_t sub_22D8A3234()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_22D8B5EB0();
  sub_22D8A35AC(v1, v0);
  v3 = swift_allocObject();
  *(_BYTE *)(v3 + 16) = *(_DWORD *)(v2 - 128) & 1;
  *(_BYTE *)(v3 + 17) = *(_DWORD *)(v2 - 124);
  sub_22D8B5E98();
  sub_22D8B5E44();
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1Tm(v2 - 120);
}

uint64_t sub_22D8A33A8(uint64_t a1, char a2, unsigned __int8 a3)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    result = sub_22D8B5E8C();
  if (a3 != 26)
  {
    SiriTimeEventSender.ReasonDescription.rawValue.getter(a3);
    return sub_22D8B5E80();
  }
  return result;
}

uint64_t sub_22D8A3418()
{
  sub_22D8B7434();
  sub_22D8B6E4C();
  return sub_22D8B744C();
}

uint64_t sub_22D8A3470()
{
  sub_22D8B7434();
  sub_22D8B6E4C();
  return sub_22D8B744C();
}

uint64_t sub_22D8A34CC()
{
  return sub_22D8B6E4C();
}

uint64_t _s16SiriTimeInternal0aB11EventSenderO9AttributeO8rawValueSSvg_0()
{
  return 0x72726F4369726953;
}

uint64_t _s16SiriTimeInternal0aB11EventSenderO8TaskTypeO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_22D8B7200();
  swift_bridgeObjectRelease();
  if (v0 >= 9)
    return 9;
  else
    return v0;
}

uint64_t _s16SiriTimeInternal0aB11EventSenderO17ReasonDescriptionO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_22D8B7410();
  swift_bridgeObjectRelease();
  if (v0 >= 0x1A)
    return 26;
  else
    return v0;
}

uint64_t sub_22D8A35AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B358);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D8A35F4()
{
  return swift_deallocObject();
}

uint64_t sub_22D8A3604(uint64_t a1)
{
  uint64_t v1;

  return sub_22D8A33A8(a1, *(_BYTE *)(v1 + 16), *(_BYTE *)(v1 + 17));
}

unint64_t sub_22D8A3614()
{
  unint64_t result;

  result = qword_255D9B360;
  if (!qword_255D9B360)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for SiriTimeEventSender.TaskType, &type metadata for SiriTimeEventSender.TaskType);
    atomic_store(result, (unint64_t *)&qword_255D9B360);
  }
  return result;
}

unint64_t sub_22D8A365C()
{
  unint64_t result;

  result = qword_255D9B368;
  if (!qword_255D9B368)
  {
    result = MEMORY[0x22E31A408]("aM\n\"Xq", &type metadata for SiriTimeEventSender.ReasonDescription);
    atomic_store(result, (unint64_t *)&qword_255D9B368);
  }
  return result;
}

unint64_t sub_22D8A36A4()
{
  unint64_t result;

  result = qword_255D9B370;
  if (!qword_255D9B370)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for SiriTimeEventSender.Attribute, &type metadata for SiriTimeEventSender.Attribute);
    atomic_store(result, (unint64_t *)&qword_255D9B370);
  }
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeEventSender()
{
  return &type metadata for SiriTimeEventSender;
}

uint64_t storeEnumTagSinglePayload for SiriTimeEventSender.TaskType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D8A3744 + 4 * byte_22D8B900E[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_22D8A3778 + 4 * byte_22D8B9009[v4]))();
}

uint64_t sub_22D8A3778(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8A3780(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D8A3788);
  return result;
}

uint64_t sub_22D8A3794(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D8A379CLL);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_22D8A37A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8A37A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeEventSender.TaskType()
{
  return &type metadata for SiriTimeEventSender.TaskType;
}

uint64_t getEnumTagSinglePayload for SiriTimeEventSender.ReasonDescription(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xE7)
    goto LABEL_17;
  if (a2 + 25 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 25) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 25;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 25;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 25;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x1A;
  v8 = v6 - 26;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriTimeEventSender.ReasonDescription(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 25 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 25) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xE7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xE6)
    return ((uint64_t (*)(void))((char *)&loc_22D8A38A0 + 4 * byte_22D8B9018[v4]))();
  *a1 = a2 + 25;
  return ((uint64_t (*)(void))((char *)sub_22D8A38D4 + 4 * byte_22D8B9013[v4]))();
}

uint64_t sub_22D8A38D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8A38DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D8A38E4);
  return result;
}

uint64_t sub_22D8A38F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D8A38F8);
  *(_BYTE *)result = a2 + 25;
  return result;
}

uint64_t sub_22D8A38FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8A3904(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeEventSender.ReasonDescription()
{
  return &type metadata for SiriTimeEventSender.ReasonDescription;
}

uint64_t storeEnumTagSinglePayload for SiriTimeEventSender.Attribute(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22D8A3960 + 4 * byte_22D8B901D[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22D8A3980 + 4 * byte_22D8B9022[v4]))();
}

_BYTE *sub_22D8A3960(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22D8A3980(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22D8A3988(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22D8A3990(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22D8A3998(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22D8A39A0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeEventSender.Attribute()
{
  return &type metadata for SiriTimeEventSender.Attribute;
}

uint64_t sub_22D8A39BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9B378);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9B378);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_22D8A3A4C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B0E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D8A3A8C(unint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v9 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
LABEL_16:
    swift_bridgeObjectRetain();
    v2 = sub_22D8B71C4();
    if (v2)
      goto LABEL_3;
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      for (i = 4; ; ++i)
      {
        v4 = i - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          MEMORY[0x22E319D0C](i - 4, a1);
          v5 = i - 3;
          if (__OFADD__(v4, 1))
            goto LABEL_15;
        }
        else
        {
          swift_retain();
          v5 = i - 3;
          if (__OFADD__(v4, 1))
          {
LABEL_15:
            __break(1u);
            goto LABEL_16;
          }
        }
        swift_getKeyPath();
        swift_retain();
        swift_getAtKeyPath();
        swift_release();
        v6 = swift_release_n();
        if (v8)
        {
          MEMORY[0x22E319A6C](v6);
          if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_22D8B6EDC();
          sub_22D8B6EF4();
          sub_22D8B6ED0();
        }
        if (v5 == v2)
        {
          swift_bridgeObjectRelease();
          return v9;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

unint64_t sub_22D8A3C3C(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B3B8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
  v7 = *(_QWORD *)(v24 - 8);
  v8 = MEMORY[0x24BDAC7A8](v24);
  v23 = (uint64_t)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v21 = (uint64_t)&v20 - v10;
  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    v11 = sub_22D8B71C4();
    if (v11)
      goto LABEL_3;
  }
  else
  {
    v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11)
    {
LABEL_3:
      v20 = v2;
      v22 = a1 & 0xC000000000000001;
      v12 = MEMORY[0x24BEE4AF8];
      v13 = 4;
      v14 = a1;
      while (1)
      {
        v2 = v13 - 4;
        if (v22)
        {
          a1 = MEMORY[0x22E319D0C](v13 - 4, a1);
          v15 = v13 - 3;
          if (__OFADD__(v2, 1))
            goto LABEL_18;
        }
        else
        {
          a1 = *(_QWORD *)(a1 + 8 * v13);
          swift_retain();
          v15 = v13 - 3;
          if (__OFADD__(v2, 1))
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        UsoEntity_common_DurationComponent.componentValue.getter(v6);
        swift_release();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v6, 1, v24) == 1)
        {
          sub_22D8740E0((uint64_t)v6, &qword_255D9B3B8);
        }
        else
        {
          v16 = v21;
          sub_22D8A58FC((uint64_t)v6, v21);
          sub_22D8A58FC(v16, v23);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v12 = sub_22D883FC0(0, *(_QWORD *)(v12 + 16) + 1, 1, v12);
          v18 = *(_QWORD *)(v12 + 16);
          v17 = *(_QWORD *)(v12 + 24);
          if (v18 >= v17 >> 1)
            v12 = sub_22D883FC0(v17 > 1, v18 + 1, 1, v12);
          *(_QWORD *)(v12 + 16) = v18 + 1;
          sub_22D8A58FC(v23, v12+ ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))+ *(_QWORD *)(v7 + 72) * v18);
        }
        a1 = v14;
        ++v13;
        if (v15 == v11)
        {
          swift_bridgeObjectRelease();
          return v12;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_22D8A3ED0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9B390);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9B390);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

id UsoEntity_common_DurationComponent.valueInSeconds.getter()
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  if (sub_22D8B6444())
  {
    sub_22D8B6390();
    swift_release();
    if ((sub_22D873668(0.0, 1.0, 0.1, 0.3) & 0x100000000) != 0)
    {
      if (qword_255D9A390 != -1)
        swift_once();
      v5 = sub_22D8B6D80();
      __swift_project_value_buffer(v5, (uint64_t)qword_255D9B390);
      v6 = sub_22D8B6D68();
      v7 = sub_22D8B6FC0();
      if (os_log_type_enabled(v6, v7))
      {
        v8 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_22D86F000, v6, v7, "Failed to resolve parse to quantity value, use SiriTimeTimerConstants.minimumDuration as the default value", v8, 2u);
        MEMORY[0x22E31A4BC](v8, -1, -1);
      }

      objc_msgSend((id)objc_opt_self(), sel_minimumDuration);
      return (id)swift_release();
    }
    else
    {
      sub_22D8A56D8();
      return (id)swift_release();
    }
  }
  else
  {
    if (qword_255D9A390 != -1)
      swift_once();
    v1 = sub_22D8B6D80();
    __swift_project_value_buffer(v1, (uint64_t)qword_255D9B390);
    v2 = sub_22D8B6D68();
    v3 = sub_22D8B6FC0();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_22D86F000, v2, v3, "Value is nil in the DurationComponent, use SiriTimeTimerConstants.minimumDuration as the default value", v4, 2u);
      MEMORY[0x22E31A4BC](v4, -1, -1);
    }

    return objc_msgSend((id)objc_opt_self(), sel_minimumDuration);
  }
}

uint64_t UsoEntity_common_Duration.dateComponents(direction:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X8>)
{
  uint64_t v3;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, _QWORD, uint64_t);
  char *v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  unint64_t v54;
  unint64_t v55;
  int v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  char *v61;
  int v62;
  int v63;
  uint64_t v64;
  void (*v65)(char *, _QWORD, uint64_t);
  unsigned int v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;

  v68 = a1;
  v3 = sub_22D8B5D00();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v61 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v41 - v7;
  v9 = sub_22D8B6798();
  v69 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A908);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A910);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (uint64_t)&v41 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_22D8B5B5C();
  v58 = *(_QWORD *)(v18 - 8);
  v59 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v70 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_22D8B6504();
  if (v20)
  {
    v21 = v20;
    if (v20 >> 62)
      goto LABEL_67;
    if (*(_QWORD *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      do
      {
        v22 = sub_22D8B5D0C();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v17, 1, 1, v22);
        v23 = sub_22D8B5D24();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v14, 1, 1, v23);
        sub_22D8B5B50();
        v24 = sub_22D8A3A8C(v21);
        swift_bridgeObjectRelease();
        v25 = sub_22D8A3C3C(v24);
        swift_bridgeObjectRelease();
        v14 = *(char **)(v25 + 16);
        if (!v14)
        {
LABEL_65:
          swift_bridgeObjectRelease();
          return (*(uint64_t (**)(unint64_t, char *, uint64_t))(v58 + 32))(a2, v70, v59);
        }
        v55 = a2;
        v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
        v26 = *(_QWORD *)(v67 - 8);
        a2 = v25 + ((*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80));
        v27 = *(_QWORD *)(v26 + 72);
        v66 = *MEMORY[0x24BEA1EA8];
        v28 = *(void (**)(char *, _QWORD, uint64_t))(v69 + 104);
        v64 = v27;
        v65 = v28;
        v63 = *MEMORY[0x24BDCF228];
        v62 = *MEMORY[0x24BDCF240];
        v60 = *MEMORY[0x24BDCF250];
        v57 = *MEMORY[0x24BDCF220];
        v56 = *MEMORY[0x24BDCF230];
        v53 = *MEMORY[0x24BDCF258];
        v52 = *MEMORY[0x24BDCF260];
        v51 = *MEMORY[0x24BDCF278];
        v50 = *MEMORY[0x24BDCF200];
        v49 = *MEMORY[0x24BDCF268];
        v48 = *MEMORY[0x24BDCF1F8];
        v47 = *MEMORY[0x24BDCF1E8];
        v46 = *MEMORY[0x24BDCF208];
        v45 = *MEMORY[0x24BDCF1D8];
        v44 = *MEMORY[0x24BDCF280];
        v43 = *MEMORY[0x24BDCF288];
        v42 = *MEMORY[0x24BDCF1F0];
        v54 = v25;
        swift_bridgeObjectRetain();
        while (1)
        {
          v65(v11, v66, v9);
          sub_22D879430(&qword_255D9B3B0, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1EB0], MEMORY[0x24BEA1EC8]);
          sub_22D8B6E94();
          sub_22D8B6E94();
          if (v73 == v71 && v74 == v72)
          {
            swift_bridgeObjectRelease_n();
            (*(void (**)(char *, uint64_t))(v69 + 8))(v11, v9);
          }
          else
          {
            v17 = sub_22D8B73F8();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v69 + 8))(v11, v9);
            if ((v17 & 1) == 0)
            {
              v30 = v61;
              (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v61, a2, v3);
              v31 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v30, v3);
              if (v31 != v63)
              {
                if (v31 != v62)
                {
                  if (v31 != v60)
                  {
                    if (v31 != v57)
                    {
                      if (v31 != v56)
                      {
                        if (v31 != v53)
                        {
                          if (v31 != v52)
                          {
                            if (v31 != v51)
                            {
                              if (v31 != v50)
                              {
                                if (v31 != v49)
                                {
                                  if (v31 != v48)
                                  {
                                    if (v31 != v47)
                                    {
                                      if (v31 != v46)
                                      {
                                        if (v31 != v45)
                                        {
                                          if (v31 != v44 && v31 != v43 && v31 != v42)
                                            (*(void (**)(char *, uint64_t))(v4 + 8))(v61, v3);
                                          goto LABEL_7;
                                        }
                                        goto LABEL_59;
                                      }
LABEL_57:
                                      sub_22D8B5A84();
                                      goto LABEL_7;
                                    }
LABEL_55:
                                    sub_22D8B5A60();
                                    goto LABEL_7;
                                  }
LABEL_53:
                                  sub_22D8B5A6C();
                                  goto LABEL_7;
                                }
LABEL_51:
                                sub_22D8B5B38();
                                goto LABEL_7;
                              }
LABEL_49:
                              sub_22D8B5A78();
                              goto LABEL_7;
                            }
LABEL_47:
                            sub_22D8B5B44();
                            goto LABEL_7;
                          }
LABEL_45:
                          sub_22D8B5B2C();
                          goto LABEL_7;
                        }
LABEL_43:
                        sub_22D8B5B14();
                        goto LABEL_7;
                      }
LABEL_41:
                      sub_22D8B5AD8();
                      goto LABEL_7;
                    }
LABEL_39:
                    sub_22D8B5AB4();
                    goto LABEL_7;
                  }
LABEL_37:
                  sub_22D8B5B08();
                  goto LABEL_7;
                }
LABEL_35:
                sub_22D8B5AF0();
                goto LABEL_7;
              }
              goto LABEL_6;
            }
          }
          v32 = *(_QWORD *)(a2 + *(int *)(v67 + 48));
          v21 = -v32;
          if (__OFSUB__(0, v32))
            break;
          (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v8, a2, v3);
          v33 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v8, v3);
          if (v33 != v63)
          {
            if (v33 != v62)
            {
              if (v33 != v60)
              {
                if (v33 != v57)
                {
                  if (v33 != v56)
                  {
                    if (v33 != v53)
                    {
                      if (v33 != v52)
                      {
                        if (v33 != v51)
                        {
                          if (v33 != v50)
                          {
                            if (v33 != v49)
                            {
                              if (v33 != v48)
                              {
                                if (v33 != v47)
                                {
                                  if (v33 != v46)
                                  {
                                    if (v33 != v45)
                                    {
                                      if (v33 != v44 && v33 != v43 && v33 != v42)
                                        (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v3);
                                      goto LABEL_7;
                                    }
LABEL_59:
                                    sub_22D8B5A54();
                                    goto LABEL_7;
                                  }
                                  goto LABEL_57;
                                }
                                goto LABEL_55;
                              }
                              goto LABEL_53;
                            }
                            goto LABEL_51;
                          }
                          goto LABEL_49;
                        }
                        goto LABEL_47;
                      }
                      goto LABEL_45;
                    }
                    goto LABEL_43;
                  }
                  goto LABEL_41;
                }
                goto LABEL_39;
              }
              goto LABEL_37;
            }
            goto LABEL_35;
          }
LABEL_6:
          sub_22D8B5AC0();
LABEL_7:
          a2 += v64;
          if (!--v14)
          {
            swift_bridgeObjectRelease();
            a2 = v55;
            goto LABEL_65;
          }
        }
        __break(1u);
LABEL_67:
        ;
      }
      while (sub_22D8B71C4());
    }
    swift_bridgeObjectRelease();
  }
  if (qword_255D9A390 != -1)
    swift_once();
  v35 = sub_22D8B6D80();
  __swift_project_value_buffer(v35, (uint64_t)qword_255D9B390);
  v36 = sub_22D8B6D68();
  v37 = sub_22D8B6FC0();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v38 = 0;
    _os_log_impl(&dword_22D86F000, v36, v37, "DurationComponents is nil or empty!", v38, 2u);
    MEMORY[0x22E31A4BC](v38, -1, -1);
  }

  v39 = sub_22D8B5D0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v17, 1, 1, v39);
  v40 = sub_22D8B5D24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v14, 1, 1, v40);
  return sub_22D8B5B50();
}

uint64_t UsoEntity_common_DurationComponent.componentValue.getter@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  char *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  __n128 v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  char *v33;

  v33 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B3B8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v32 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v30 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B3A8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_22D8B657C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!sub_22D8B67EC())
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
    goto LABEL_6;
  }
  sub_22D8B6468();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
LABEL_6:
    v17 = &qword_255D9B3A8;
    v18 = (uint64_t)v12;
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v16, v12, v13);
  sub_22D8A523C((uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    v17 = &qword_255D9B3B8;
    v18 = (uint64_t)v3;
LABEL_7:
    sub_22D8740E0(v18, v17);
    v19 = 1;
    v20 = v33;
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v20, v19, 1, v4);
  }
  v22 = *(int *)(v4 + 48);
  v23 = sub_22D8B5D00();
  v31 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32);
  v31(v9, v3, v23);
  *(_QWORD *)&v9[v22] = *(_QWORD *)&v3[v22];
  if (!sub_22D8B6444())
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    goto LABEL_16;
  }
  sub_22D8B6390();
  swift_release();
  v24 = sub_22D873668(0.0, 1.0, 0.1, 0.3);
  swift_release();
  result = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  if ((v24 & 0x100000000) != 0)
  {
LABEL_16:
    v26 = 1;
    goto LABEL_17;
  }
  if ((~(_DWORD)v24 & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  v25.n128_u32[0] = v24;
  if (*(float *)&v24 <= -9.2234e18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (*(float *)&v24 < 9.2234e18)
  {
    v26 = (uint64_t)*(float *)&v24;
LABEL_17:
    v27 = *(int *)(v4 + 48);
    v29 = v31;
    v28 = v32;
    ((void (*)(char *, char *, uint64_t, __n128))v31)(v32, v9, v23, v25);
    v20 = v33;
    v29(v33, v28, v23);
    v19 = 0;
    *(_QWORD *)&v20[v27] = v26;
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v20, v19, 1, v4);
  }
LABEL_20:
  __break(1u);
  return result;
}

uint64_t DateComponents.update(with:value:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  uint64_t v7;

  v2 = sub_22D8B5D00();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if ((_DWORD)result == *MEMORY[0x24BDCF228])
    return sub_22D8B5AC0();
  if ((_DWORD)result == *MEMORY[0x24BDCF240])
    return sub_22D8B5AF0();
  if ((_DWORD)result == *MEMORY[0x24BDCF250])
    return sub_22D8B5B08();
  if ((_DWORD)result == *MEMORY[0x24BDCF220])
    return sub_22D8B5AB4();
  if ((_DWORD)result == *MEMORY[0x24BDCF230])
    return sub_22D8B5AD8();
  if ((_DWORD)result == *MEMORY[0x24BDCF258])
    return sub_22D8B5B14();
  if ((_DWORD)result == *MEMORY[0x24BDCF260])
    return sub_22D8B5B2C();
  if ((_DWORD)result == *MEMORY[0x24BDCF278])
    return sub_22D8B5B44();
  if ((_DWORD)result == *MEMORY[0x24BDCF200])
    return sub_22D8B5A78();
  if ((_DWORD)result == *MEMORY[0x24BDCF268])
    return sub_22D8B5B38();
  if ((_DWORD)result == *MEMORY[0x24BDCF1F8])
    return sub_22D8B5A6C();
  if ((_DWORD)result == *MEMORY[0x24BDCF1E8])
    return sub_22D8B5A60();
  if ((_DWORD)result == *MEMORY[0x24BDCF208])
    return sub_22D8B5A84();
  if ((_DWORD)result == *MEMORY[0x24BDCF1D8])
    return sub_22D8B5A54();
  if ((_DWORD)result != *MEMORY[0x24BDCF280]
    && (_DWORD)result != *MEMORY[0x24BDCF288]
    && (_DWORD)result != *MEMORY[0x24BDCF1F0])
  {
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

uint64_t sub_22D8A523C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v2 = v1;
  v4 = sub_22D8B657C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x24BEA0818])
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(a1, 1, 1, v9);
  }
  v11 = v8;
  if (v8 == *MEMORY[0x24BEA0808])
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
    v13 = *(int *)(v12 + 48);
    v14 = *MEMORY[0x24BDCF1E8];
    v15 = sub_22D8B5D00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(a1, v14, v15);
    v16 = 2;
LABEL_24:
    *(_QWORD *)(a1 + v13) = v16;
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a1, 0, 1, v12);
  }
  if (v8 == *MEMORY[0x24BEA0840])
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
    v13 = *(int *)(v12 + 48);
    v17 = (unsigned int *)MEMORY[0x24BDCF240];
LABEL_23:
    v22 = *v17;
    v23 = sub_22D8B5D00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(a1, v22, v23);
    v16 = 1;
    goto LABEL_24;
  }
  if (v8 == *MEMORY[0x24BEA0868])
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
    v13 = *(int *)(v12 + 48);
    v18 = *MEMORY[0x24BDCF240];
    v19 = sub_22D8B5D00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(a1, v18, v19);
    v16 = 100;
    goto LABEL_24;
  }
  if (v8 == *MEMORY[0x24BEA0860])
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
    v13 = *(int *)(v12 + 48);
    v17 = (unsigned int *)MEMORY[0x24BDCF260];
    goto LABEL_23;
  }
  if (v8 == *MEMORY[0x24BEA0820])
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
    v13 = *(int *)(v12 + 48);
    v17 = (unsigned int *)MEMORY[0x24BDCF268];
    goto LABEL_23;
  }
  if (v8 == *MEMORY[0x24BEA0858])
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
    v13 = *(int *)(v12 + 48);
    v17 = (unsigned int *)MEMORY[0x24BDCF258];
    goto LABEL_23;
  }
  if (v8 == *MEMORY[0x24BEA0828])
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
    v13 = *(int *)(v12 + 48);
    v17 = (unsigned int *)MEMORY[0x24BDCF220];
    goto LABEL_23;
  }
  if (v8 == *MEMORY[0x24BEA0830])
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
    v13 = *(int *)(v12 + 48);
    v17 = (unsigned int *)MEMORY[0x24BDCF230];
    goto LABEL_23;
  }
  if (v8 == *MEMORY[0x24BEA0810])
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
    v13 = *(int *)(v12 + 48);
    v20 = *MEMORY[0x24BDCF1D8];
    v21 = sub_22D8B5D00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(a1, v20, v21);
    v16 = 1000000;
    goto LABEL_24;
  }
  if (v8 == *MEMORY[0x24BEA0848])
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
    v13 = *(int *)(v12 + 48);
    v17 = (unsigned int *)MEMORY[0x24BDCF250];
    goto LABEL_23;
  }
  if (v8 == *MEMORY[0x24BEA0850])
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
    v13 = *(int *)(v12 + 48);
    v24 = *MEMORY[0x24BDCF240];
    v25 = sub_22D8B5D00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(a1, v24, v25);
    v16 = 10;
    goto LABEL_24;
  }
  v26 = *MEMORY[0x24BEA0838];
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
  if (v11 == v26)
  {
    v28 = *(int *)(v27 + 48);
    v29 = *MEMORY[0x24BDCF1E8];
    v30 = v27;
    v31 = sub_22D8B5D00();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 104))(a1, v29, v31);
    *(_QWORD *)(a1 + v28) = 1;
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(a1, 0, 1, v30);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(a1, 1, 1);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

double sub_22D8A56D8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  double v14;
  uint64_t v16;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B3A8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_22D8B657C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v16 - v8;
  if (sub_22D8B67EC())
  {
    sub_22D8B6468();
    swift_release();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
      v7 = v9;
      goto LABEL_10;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  }
  sub_22D8740E0((uint64_t)v2, &qword_255D9B3A8);
  if (qword_255D9A390 != -1)
    swift_once();
  v10 = sub_22D8B6D80();
  __swift_project_value_buffer(v10, (uint64_t)qword_255D9B390);
  v11 = sub_22D8B6D68();
  v12 = sub_22D8B6FB4();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_22D86F000, v11, v12, "DurationComponent is underspecified and is missing a Unit, using Minute as default unit", v13, 2u);
    MEMORY[0x22E31A4BC](v13, -1, -1);
  }

  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x24BEA0858], v3);
LABEL_10:
  v14 = sub_22D87411C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  return v14;
}

uint64_t sub_22D8A58FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A8B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D8A5944@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_22D8B63D8();
  *a1 = v3;
  return result;
}

uint64_t sub_22D8A597C(uint64_t a1)
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

  v2 = sub_22D8B5D00();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B3C0);
    v10 = sub_22D8B7104();
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
      sub_22D879430(&qword_255D9B3C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2A8]);
      v14 = sub_22D8B6DEC();
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
          sub_22D879430(&qword_255D9B3D0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF290], MEMORY[0x24BDCF2C0]);
          v20 = sub_22D8B6DF8();
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

uint64_t sub_22D8A5BE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B3D8);
    v3 = sub_22D8B7104();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_22D8B7434();
      swift_bridgeObjectRetain();
      sub_22D8B6E4C();
      result = sub_22D8B744C();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = sub_22D8B73F8(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = sub_22D8B73F8();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_22D8A5D84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9B3E0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9B3E0);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_22D8A5E14()
{
  uint64_t v0;
  uint64_t result;

  v0 = sub_22D8B6BF4();
  result = sub_22D8B6BE8();
  qword_255D9F718 = v0;
  unk_255D9F720 = MEMORY[0x24BEA54A0];
  static SiriReferenceResolutionResolver.shared = result;
  return result;
}

uint64_t static SiriReferenceResolutionResolver.shared.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_255D9A3A0 != -1)
    swift_once();
  return sub_22D8A5EA4((uint64_t)&static SiriReferenceResolutionResolver.shared, a1);
}

uint64_t sub_22D8A5EA4(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void SiriReferenceResolutionResolver.resolveReferenceEntity(referenceEntity:)(NSObject *a1@<X0>, uint64_t a2@<X8>)
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  int *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  void (*v29)(char *);
  uint64_t v30;
  uint64_t v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  uint64_t *v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void **v41;
  void *v42;
  id v43;
  id v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  void (*v66)(char *, uint64_t);
  uint64_t v67;
  void *v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  void (*v72)(char *, uint64_t);
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  void (*v83)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _QWORD *v93;
  void **v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  os_log_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103[2];

  v99 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B3F8);
  MEMORY[0x24BDAC7A8](v3);
  v80 = (char *)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = sub_22D8B6D98();
  v81 = *(_QWORD *)(v79 - 8);
  v5 = MEMORY[0x24BDAC7A8](v79);
  v78 = (char *)&v77 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v85 = (char *)&v77 - v7;
  v8 = sub_22D8B6DC8();
  v86 = *(_QWORD *)(v8 - 8);
  v87 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v82 = (char *)&v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v89 = (char *)&v77 - v11;
  v97 = sub_22D8B6DA4();
  v95 = *(_QWORD *)(v97 - 8);
  MEMORY[0x24BDAC7A8](v97);
  v93 = (uint64_t *)((char *)&v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B400);
  v13 = MEMORY[0x24BDAC7A8](v96);
  v94 = (void **)((char *)&v77 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v13);
  v100 = (uint64_t)&v77 - v15;
  v16 = sub_22D8B5C40();
  v90 = *(_QWORD *)(v16 - 8);
  v91 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v77 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_22D8B6D80();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v77 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = (int *)type metadata accessor for SiriTimeMeasurement();
  MEMORY[0x24BDAC7A8](v23);
  v25 = (uint64_t *)((char *)&v77 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  v26 = sub_22D8B6DBC();
  v27 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56);
  v88 = a2;
  v83 = v27;
  v84 = v26;
  ((void (*)(uint64_t, uint64_t, uint64_t))v27)(a2, 1, 1);
  if (qword_255D9A398 != -1)
    swift_once();
  v28 = __swift_project_value_buffer(v19, (uint64_t)qword_255D9B3E0);
  v29 = *(void (**)(char *))(v20 + 16);
  v92 = v28;
  v29(v22);
  v30 = mach_absolute_time();
  *(_OWORD *)((char *)v25 + v23[7]) = xmmword_22D8B7E40;
  *(uint64_t *)((char *)v25 + v23[8]) = 0x7FEFFFFFFFFFFFFFLL;
  v31 = v23[9];
  sub_22D8B5C34();
  v32 = objc_allocWithZone(MEMORY[0x24BE95C78]);
  v101 = v25;
  v33 = v32;
  v34 = (void *)sub_22D8B5C1C();
  v35 = objc_msgSend(v33, sel_initWithNSUUID_, v34);

  (*(void (**)(char *, uint64_t))(v90 + 8))(v18, v91);
  *(uint64_t *)((char *)v101 + v31) = (uint64_t)v35;
  v36 = v101;
  *((_BYTE *)v101 + 8) = 31;
  ((void (*)(char *, char *, uint64_t))v29)((char *)v36 + v23[6], v22, v19);
  *v36 = v30;
  sub_22D8A9578();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  __swift_project_boxed_opaque_existential_1(v98, v98[3]);
  v37 = v93;
  *v93 = v99;
  v38 = v95;
  v39 = v97;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v95 + 104))(v37, *MEMORY[0x24BEA59D0], v97);
  swift_retain();
  v40 = v100;
  sub_22D8B6C0C();
  (*(void (**)(_QWORD *, uint64_t))(v38 + 8))(v37, v39);
  SiriTimeMeasurement.logDelta()();
  v41 = v94;
  sub_22D88AE10(v40, (uint64_t)v94, &qword_255D9B400);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v42 = *v41;
    v43 = v42;
    v44 = v42;
    v45 = sub_22D8B6D68();
    v46 = sub_22D8B6FB4();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v102 = (uint64_t)v42;
      v103[0] = v48;
      *(_DWORD *)v47 = 136315138;
      v49 = v42;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A838);
      v50 = sub_22D8B6E28();
      v102 = sub_22D8755FC(v50, v51, v103);
      v36 = v101;
      sub_22D8B7044();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_22D86F000, v45, v46, "Resolve reference from SRR was unsuccessful: %s", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v48, -1, -1);
      MEMORY[0x22E31A4BC](v47, -1, -1);
    }
    else
    {

    }
    v68 = (void *)sub_22D8B5B68();
    sub_22D8A9F34((uint64_t)v68, 1, 0, 0x90u);

    sub_22D8740E0(v40, &qword_255D9B400);
    sub_22D8758C0((uint64_t)v36);

  }
  else
  {
    v53 = v86;
    v52 = v87;
    v54 = v89;
    (*(void (**)(char *, void **, uint64_t))(v86 + 32))(v89, v41, v87);
    v55 = v82;
    (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v82, v54, v52);
    if ((*(unsigned int (**)(char *, uint64_t))(v53 + 88))(v55, v52) == *MEMORY[0x24BEA5AA8])
    {
      (*(void (**)(char *, uint64_t))(v53 + 96))(v55, v52);
      v56 = v81;
      v57 = v85;
      v58 = v79;
      (*(void (**)(char *, char *, uint64_t))(v81 + 32))(v85, v55, v79);
      v59 = v78;
      (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v78, v57, v58);
      v60 = sub_22D8B6D68();
      v61 = sub_22D8B6FC0();
      if (os_log_type_enabled(v60, v61))
      {
        v99 = v60;
        v62 = (uint8_t *)swift_slowAlloc();
        v63 = swift_slowAlloc();
        v103[0] = v63;
        *(_DWORD *)v62 = 136315138;
        sub_22D8A6E3C();
        v64 = sub_22D8B7314();
        v102 = sub_22D8755FC(v64, v65, v103);
        v36 = v101;
        sub_22D8B7044();
        swift_bridgeObjectRelease();
        v66 = *(void (**)(char *, uint64_t))(v81 + 8);
        v66(v59, v58);
        v60 = v99;
        _os_log_impl(&dword_22D86F000, v99, v61, "Resolve reference from SRR was successful with resolved entity match: %s", v62, 0xCu);
        swift_arrayDestroy();
        v67 = v63;
        v54 = v89;
        MEMORY[0x22E31A4BC](v67, -1, -1);
        MEMORY[0x22E31A4BC](v62, -1, -1);
      }
      else
      {
        v66 = *(void (**)(char *, uint64_t))(v56 + 8);
        v66(v59, v58);
      }

      v74 = (uint64_t)v80;
      v75 = v85;
      sub_22D8B6D8C();
      v66(v75, v58);
      (*(void (**)(char *, uint64_t))(v53 + 8))(v54, v52);
      sub_22D8740E0(v100, &qword_255D9B400);
      sub_22D8758C0((uint64_t)v36);
      v76 = v88;
      sub_22D8740E0(v88, &qword_255D9B3F8);
      v83(v74, 0, 1, v84);
      sub_22D8A6DF4(v74, v76);
    }
    else
    {
      v69 = sub_22D8B6D68();
      v70 = sub_22D8B6FC0();
      if (os_log_type_enabled(v69, v70))
      {
        v71 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v71 = 0;
        _os_log_impl(&dword_22D86F000, v69, v70, "Resolve reference from SRR was successful but returned ambiguous or empty matches", v71, 2u);
        MEMORY[0x22E31A4BC](v71, -1, -1);
      }

      v72 = *(void (**)(char *, uint64_t))(v53 + 8);
      v72(v54, v52);
      sub_22D8740E0(v40, &qword_255D9B400);
      sub_22D8758C0((uint64_t)v36);
      v73 = v88;
      sub_22D8740E0(v88, &qword_255D9B3F8);
      v83(v73, 1, 1, v84);
      v72(v55, v52);
    }
  }
}

uint64_t SiriReferenceResolutionResolver.getAlarmEntityFromDateTime()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v17;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B3F8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_22D8B66FC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D8B6888();
  swift_allocObject();
  sub_22D8B687C();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEA1800], v3);
  sub_22D8B6768();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_22D8B6864();
  swift_allocObject();
  v7 = sub_22D8B6858();
  swift_retain();
  sub_22D8B6594();
  swift_release();
  v8 = MEMORY[0x22E3190B8](v7);
  if (!v8)
  {
    if (qword_255D9A398 != -1)
      swift_once();
    v11 = sub_22D8B6D80();
    __swift_project_value_buffer(v11, (uint64_t)qword_255D9B3E0);
    v12 = sub_22D8B6D68();
    v13 = sub_22D8B6FC0();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_22D86F000, v12, v13, "Creation of was common_DateTime entity was unsuccessful", v14, 2u);
      MEMORY[0x22E31A4BC](v14, -1, -1);
      swift_release();
      swift_release();

    }
    else
    {

      swift_release();
      swift_release();
    }
    return 0;
  }
  SiriReferenceResolutionResolver.resolveReferenceEntity(referenceEntity:)(v8, (uint64_t)v2);
  v9 = sub_22D8B6DBC();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v2, 1, v9) == 1)
  {
    swift_release();
    swift_release();
    swift_release();
    sub_22D8740E0((uint64_t)v2, &qword_255D9B3F8);
    return 0;
  }
  v15 = RREntity.alarmEntity()();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v2, v9);
  return v15;
}

uint64_t RREntity.alarmEntity()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B410);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D8B6DB0();
  sub_22D8B66C0();
  sub_22D8B65A0();
  swift_release();
  if (!v22)
    return 0;
  if (!sub_22D8B6690() || (v3 = sub_22D8B6A68(), swift_release(), !v3) || (v4 = sub_22D8B6AA4(), swift_release(), !v4))
  {
LABEL_15:
    swift_release();
    return 0;
  }
  v5 = sub_22D8B6A14();
  if ((v6 & 1) != 0 || (v7 = v5, v8 = sub_22D8B6A20(), (v9 & 1) != 0))
  {
    swift_release();
    goto LABEL_15;
  }
  v10 = v8;
  if (qword_255D9A398 != -1)
    swift_once();
  v11 = sub_22D8B6D80();
  __swift_project_value_buffer(v11, (uint64_t)qword_255D9B3E0);
  v12 = sub_22D8B6D68();
  v13 = sub_22D8B6FC0();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_22D86F000, v12, v13, "Creating a UsoEntity_common_Alarm instance from returned SRR result", v14, 2u);
    MEMORY[0x22E31A4BC](v14, -1, -1);
  }

  sub_22D8B6684();
  swift_allocObject();
  v15 = sub_22D8B6678();
  v16 = sub_22D8B6564();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = (unsigned int *)MEMORY[0x24BEA0788];
  if (v7 >= 12)
    v18 = (unsigned int *)MEMORY[0x24BEA0790];
  (*(void (**)(char *, _QWORD, uint64_t))(v17 + 104))(v2, *v18, v16);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v2, 0, 1, v16);
  if (sub_22D8B66B4())
  {
    v19 = sub_22D8B6540();
    swift_release();
  }
  else
  {
    v19 = 0;
  }
  sub_22D8A6E84(v7, v10, (uint64_t)v2, v19);
  swift_release();
  sub_22D8740E0((uint64_t)v2, &qword_255D9B410);
  sub_22D8B666C();
  swift_release();
  MEMORY[0x22E3190B8](v15);
  sub_22D8B645C();
  sub_22D8B65A0();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v22;
}

uint64_t sub_22D8A6DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B3F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_22D8A6E3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255D9B408;
  if (!qword_255D9B408)
  {
    v1 = sub_22D8B6D98();
    result = MEMORY[0x22E31A408](MEMORY[0x24BEA5590], v1);
    atomic_store(result, (unint64_t *)&qword_255D9B408);
  }
  return result;
}

uint64_t sub_22D8A6E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;
  char v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;

  v23 = a4;
  v24 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B410);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22D8B6564();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D8B672C();
  swift_allocObject();
  v11 = sub_22D8B6720();
  sub_22D8B6714();
  swift_allocObject();
  sub_22D8B6720();
  sub_22D8B6714();
  sub_22D8B68C4();
  swift_allocObject();
  sub_22D8B68B8();
  swift_retain();
  sub_22D8B6894();
  v22[1] = v11;
  swift_release();
  swift_retain();
  sub_22D8B68AC();
  swift_release();
  sub_22D88AE10(v24, (uint64_t)v6, &qword_255D9B410);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_22D8740E0((uint64_t)v6, &qword_255D9B410);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
    sub_22D8B6780();
    swift_allocObject();
    sub_22D8B6774();
    sub_22D8B6768();
    swift_retain();
    sub_22D8B68A0();
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  v12 = v23;
  sub_22D8B675C();
  swift_allocObject();
  v13 = sub_22D8B6750();
  swift_retain();
  sub_22D8B6744();
  swift_release();
  if (v12)
  {
    sub_22D8B663C();
    swift_allocObject();
    swift_retain();
    sub_22D8B6630();
    if (sub_22D8B6414())
    {
      sub_22D8B64C8();
      v15 = v14;
      swift_release();
      if ((v15 & 1) == 0)
      {
        swift_allocObject();
        sub_22D8B6720();
        sub_22D8B6714();
        swift_retain();
        sub_22D8B660C();
        swift_release_n();
      }
    }
    if (sub_22D8B6420())
    {
      v16 = sub_22D8B6504();
      swift_release();
      if (v16)
      {
        sub_22D8B64C8();
        v18 = v17;
        swift_release();
        if ((v18 & 1) == 0)
        {
          swift_allocObject();
          sub_22D8B6720();
          sub_22D8B6714();
          sub_22D8B6840();
          swift_allocObject();
          sub_22D8B6834();
          swift_retain();
          sub_22D8B6828();
          swift_release();
          swift_retain();
          sub_22D8B6618();
          swift_release();
          swift_release_n();
        }
      }
    }
    if (sub_22D8B642C())
    {
      sub_22D8B64C8();
      v20 = v19;
      swift_release();
      if ((v20 & 1) == 0)
      {
        swift_allocObject();
        sub_22D8B6720();
        sub_22D8B6714();
        swift_retain();
        sub_22D8B6624();
        swift_release_n();
      }
    }
    swift_retain();
    sub_22D8B6738();
    swift_release();
    swift_release_n();
  }
  swift_release();
  swift_release();
  swift_release();
  return v13;
}

ValueMetadata *type metadata accessor for SiriReferenceResolutionResolver()
{
  return &type metadata for SiriReferenceResolutionResolver;
}

uint64_t DeviceUnit.isRemote.getter()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v0 = sub_22D8B6C90();
  result = 1;
  if (v0 <= 1999)
  {
    if (v0)
    {
      if (v0 == 1000)
        return result;
      return 0;
    }
    if (qword_255D9A3A8 != -1)
      swift_once();
    v2 = sub_22D8B6D80();
    __swift_project_value_buffer(v2, (uint64_t)qword_255D9B418);
    v3 = sub_22D8B6D68();
    v4 = sub_22D8B6FC0();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_22D86F000, v3, v4, "Device proximity is 'unknown'. Assuming device is remote for indeterminate proximity state. This needs to be fixed by an upstream component from Time Domains.", v5, 2u);
      MEMORY[0x22E31A4BC](v5, -1, -1);
    }

    return 1;
  }
  else if (v0 != 2000 && v0 != 3000)
  {
    return 0;
  }
  return result;
}

uint64_t DeviceUnit.shouldDismissSilently.getter()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  const char *v5;
  uint64_t v6;
  os_log_type_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v0 = sub_22D8B6C90();
  if (v0 <= 1999)
  {
    if (v0 && v0 != 1000)
      goto LABEL_20;
    if (qword_255D9A3A8 != -1)
      swift_once();
    v6 = sub_22D8B6D80();
    __swift_project_value_buffer(v6, (uint64_t)qword_255D9B418);
    v2 = sub_22D8B6D68();
    v7 = sub_22D8B6FC0();
    if (!os_log_type_enabled(v2, v7))
      goto LABEL_25;
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    v8 = "Firing alarm/timer is on far/unknown device: will dismiss with dialog.";
LABEL_24:
    _os_log_impl(&dword_22D86F000, v2, v7, v8, v4, 2u);
    v11 = 0;
LABEL_31:
    MEMORY[0x22E31A4BC](v4, -1, -1);
    goto LABEL_33;
  }
  if (v0 == 2000 || v0 == 3000)
  {
    if ((_s27SiriVirtualDeviceResolution0C4UnitC0A12TimeInternalE10isCommunalSbvg_0() & 1) == 0)
    {
      if (qword_255D9A3A8 != -1)
        swift_once();
      v12 = sub_22D8B6D80();
      __swift_project_value_buffer(v12, (uint64_t)qword_255D9B418);
      v2 = sub_22D8B6D68();
      v3 = sub_22D8B6FC0();
      if (os_log_type_enabled(v2, v3))
      {
        v4 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v4 = 0;
        v5 = "Firing alarm/timer is on nearby device: will dismiss silently with no dialog.";
        goto LABEL_30;
      }
LABEL_32:
      v11 = 1;
      goto LABEL_33;
    }
    if (qword_255D9A3A8 != -1)
      swift_once();
    v9 = sub_22D8B6D80();
    __swift_project_value_buffer(v9, (uint64_t)qword_255D9B418);
    v2 = sub_22D8B6D68();
    v7 = sub_22D8B6FC0();
    if (!os_log_type_enabled(v2, v7))
      goto LABEL_25;
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    v8 = "Firing alarm/timer is on nearby communal device: will dismiss with dialog.";
    goto LABEL_24;
  }
  if (v0 == 4000)
  {
    if (qword_255D9A3A8 != -1)
      swift_once();
    v1 = sub_22D8B6D80();
    __swift_project_value_buffer(v1, (uint64_t)qword_255D9B418);
    v2 = sub_22D8B6D68();
    v3 = sub_22D8B6FC0();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      v5 = "Firing alarm/timer is on local device: will dismiss them silently with no dialog.";
LABEL_30:
      _os_log_impl(&dword_22D86F000, v2, v3, v5, v4, 2u);
      v11 = 1;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
LABEL_20:
  if (qword_255D9A3A8 != -1)
    swift_once();
  v10 = sub_22D8B6D80();
  __swift_project_value_buffer(v10, (uint64_t)qword_255D9B418);
  v2 = sub_22D8B6D68();
  v7 = sub_22D8B6FB4();
  if (os_log_type_enabled(v2, v7))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    v8 = "Firing alarm/timer is on unhandled proximity device. This is a programming error and needs to be handled. Defau"
         "lting to non-silent dismissal.";
    goto LABEL_24;
  }
LABEL_25:
  v11 = 0;
LABEL_33:

  return v11;
}

uint64_t DeviceUnit.shouldPromptForConfirmation.getter()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  const char *v5;
  uint64_t v6;
  os_log_type_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v0 = sub_22D8B6C90();
  if (v0 <= 1999)
  {
    if (!v0 || v0 == 1000)
    {
      if (qword_255D9A3A8 != -1)
        swift_once();
      v6 = sub_22D8B6D80();
      __swift_project_value_buffer(v6, (uint64_t)qword_255D9B418);
      v2 = sub_22D8B6D68();
      v7 = sub_22D8B6FC0();
      if (os_log_type_enabled(v2, v7))
      {
        v4 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v4 = 0;
        v8 = "Firing alarm/timer is not near local device: will require confirmation";
LABEL_25:
        _os_log_impl(&dword_22D86F000, v2, v7, v8, v4, 2u);
        v10 = 1;
        goto LABEL_26;
      }
LABEL_27:
      v10 = 1;
      goto LABEL_28;
    }
LABEL_21:
    if (qword_255D9A3A8 != -1)
      swift_once();
    v11 = sub_22D8B6D80();
    __swift_project_value_buffer(v11, (uint64_t)qword_255D9B418);
    v2 = sub_22D8B6D68();
    v7 = sub_22D8B6FB4();
    if (os_log_type_enabled(v2, v7))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      v8 = "Firing alarm/timer reported unhandled proximity: will require confirmation – This is an error for an unhandle"
           "d proximity case";
      goto LABEL_25;
    }
    goto LABEL_27;
  }
  if (v0 != 2000 && v0 != 3000)
  {
    if (v0 == 4000)
    {
      if (qword_255D9A3A8 != -1)
        swift_once();
      v1 = sub_22D8B6D80();
      __swift_project_value_buffer(v1, (uint64_t)qword_255D9B418);
      v2 = sub_22D8B6D68();
      v3 = sub_22D8B6FC0();
      if (os_log_type_enabled(v2, v3))
      {
        v4 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v4 = 0;
        v5 = "Firing alarm/timer is on local device: will skip confirmation";
LABEL_19:
        _os_log_impl(&dword_22D86F000, v2, v3, v5, v4, 2u);
        v10 = 0;
LABEL_26:
        MEMORY[0x22E31A4BC](v4, -1, -1);
        goto LABEL_28;
      }
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (qword_255D9A3A8 != -1)
    swift_once();
  v9 = sub_22D8B6D80();
  __swift_project_value_buffer(v9, (uint64_t)qword_255D9B418);
  v2 = sub_22D8B6D68();
  v3 = sub_22D8B6FC0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    v5 = "Firing alarm/timer is on nearby device: will skip confirmation";
    goto LABEL_19;
  }
LABEL_20:
  v10 = 0;
LABEL_28:

  return v10;
}

BOOL DeviceUnit.isLocal.getter()
{
  uint64_t v0;

  sub_22D8B6C90();
  v0 = sub_22D8B6D5C();
  return v0 == sub_22D8B6D5C();
}

uint64_t sub_22D8A7A98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9B418);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9B418);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_22D8A7B28()
{
  return DeviceUnit.shouldDismissSilently.getter() & 1;
}

uint64_t sub_22D8A7B4C()
{
  return DeviceUnit.shouldPromptForConfirmation.getter() & 1;
}

uint64_t sub_22D8A7B70()
{
  return DeviceUnit.isRemote.getter() & 1;
}

BOOL sub_22D8A7B94()
{
  uint64_t v0;

  sub_22D8B6C90();
  v0 = sub_22D8B6D5C();
  return v0 == sub_22D8B6D5C();
}

uint64_t sub_22D8A7BCC()
{
  return _s27SiriVirtualDeviceResolution0C4UnitC0A12TimeInternalE10isCommunalSbvg_0() & 1;
}

BOOL TipKitSiriTimeSource.init(rawValue:)()
{
  return sub_22D8A7CA4();
}

unint64_t TipKitSiriTimeSource.rawValue.getter()
{
  return 0xD000000000000026;
}

uint64_t sub_22D8A7C18()
{
  return sub_22D8A7D1C();
}

uint64_t sub_22D8A7C34()
{
  return sub_22D8B6E4C();
}

uint64_t sub_22D8A7C50()
{
  return sub_22D8A7DA0();
}

uint64_t sub_22D8A7C6C@<X0>(BOOL *a1@<X8>)
{
  return sub_22D8A7DF4(a1);
}

void sub_22D8A7C78(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000026;
  a1[1] = 0x800000022D8BDB50;
}

BOOL TipKitSiriTimeContext.init(rawValue:)()
{
  return sub_22D8A7CA4();
}

BOOL sub_22D8A7CA4()
{
  uint64_t v0;

  v0 = sub_22D8B7200();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

unint64_t TipKitSiriTimeContext.rawValue.getter()
{
  return 0xD000000000000014;
}

uint64_t sub_22D8A7D00()
{
  return sub_22D8A7D1C();
}

uint64_t sub_22D8A7D1C()
{
  sub_22D8B7434();
  sub_22D8B6E4C();
  return sub_22D8B744C();
}

uint64_t sub_22D8A7D68()
{
  return sub_22D8B6E4C();
}

uint64_t sub_22D8A7D84()
{
  return sub_22D8A7DA0();
}

uint64_t sub_22D8A7DA0()
{
  sub_22D8B7434();
  sub_22D8B6E4C();
  return sub_22D8B744C();
}

uint64_t sub_22D8A7DE8@<X0>(BOOL *a1@<X8>)
{
  return sub_22D8A7DF4(a1);
}

uint64_t sub_22D8A7DF4@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_22D8B7200();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_22D8A7E40(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000014;
  a1[1] = 0x800000022D8BDB80;
}

unint64_t sub_22D8A7E68()
{
  unint64_t result;

  result = qword_255D9B430;
  if (!qword_255D9B430)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for TipKitSiriTimeSource, &type metadata for TipKitSiriTimeSource);
    atomic_store(result, (unint64_t *)&qword_255D9B430);
  }
  return result;
}

unint64_t sub_22D8A7EB0()
{
  unint64_t result;

  result = qword_255D9B438;
  if (!qword_255D9B438)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for TipKitSiriTimeContext, &type metadata for TipKitSiriTimeContext);
    atomic_store(result, (unint64_t *)&qword_255D9B438);
  }
  return result;
}

ValueMetadata *type metadata accessor for TipKitSiriTimeSource()
{
  return &type metadata for TipKitSiriTimeSource;
}

uint64_t _s16SiriTimeInternal20TipKitSiriTimeSourceOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22D8A7F48 + 4 * byte_22D8B93E0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22D8A7F68 + 4 * byte_22D8B93E5[v4]))();
}

_BYTE *sub_22D8A7F48(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22D8A7F68(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22D8A7F70(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22D8A7F78(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22D8A7F80(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22D8A7F88(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for TipKitSiriTimeContext()
{
  return &type metadata for TipKitSiriTimeContext;
}

ValueMetadata *type metadata accessor for TipKitDonationService()
{
  return &type metadata for TipKitDonationService;
}

uint64_t sub_22D8A7FB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9B440);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9B440);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t UsoEntity_common_Alarm.eligibleForTimerReformation.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  const char *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint64_t result;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t, uint64_t);
  int v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t);
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  uint64_t v73;
  os_log_type_t v74;
  _BOOL4 v75;
  uint8_t *v76;
  uint64_t v77;
  int v78;
  unsigned int v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint8_t *v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  __int128 v95;
  __int128 v96;
  _OWORD v97[2];

  v93 = sub_22D8B657C();
  v0 = *(_QWORD *)(v93 - 8);
  MEMORY[0x24BDAC7A8](v93);
  v2 = (char *)&v77 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B488);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B3A8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v77 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (unint64_t)&v77 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v92 = (char *)&v77 - v13;
  v14 = (void *)UsoEntity_common_Alarm.relativeOffsetInMinutes.getter();
  if (!v14
    || (v15 = v14,
        objc_msgSend(v14, sel_doubleValue),
        v17 = v16,
        v15,
        v18 = (void *)objc_opt_self(),
        objc_msgSend(v18, sel_minimumDuration),
        v19 >= v17))
  {
    if (qword_255D9A3B0 != -1)
      swift_once();
    v26 = sub_22D8B6D80();
    __swift_project_value_buffer(v26, (uint64_t)qword_255D9B440);
    v22 = sub_22D8B6D68();
    v23 = sub_22D8B6FC0();
    if (!os_log_type_enabled(v22, v23))
      goto LABEL_14;
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    v25 = "UsoEntity_common_Alarm.eligibleForTimerReformation = false (no valid relative duration)";
LABEL_12:
    v27 = v22;
    v28 = v23;
LABEL_13:
    _os_log_impl(&dword_22D86F000, v27, v28, v25, v24, 2u);
    MEMORY[0x22E31A4BC](v24, -1, -1);
LABEL_14:

    return 0;
  }
  objc_msgSend(v18, sel_maxReformationDuration);
  if (v20 < v17)
  {
    if (qword_255D9A3B0 != -1)
      swift_once();
    v21 = sub_22D8B6D80();
    __swift_project_value_buffer(v21, (uint64_t)qword_255D9B440);
    v22 = sub_22D8B6D68();
    v23 = sub_22D8B6FC0();
    if (!os_log_type_enabled(v22, v23))
      goto LABEL_14;
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    v25 = "UsoEntity_common_Alarm.eligibleForTimerReformation = false (maxReformationDuration)";
    goto LABEL_12;
  }
  v87 = v3;
  v30 = sub_22D8B6450();
  v90 = v0;
  v91 = v5;
  v84 = v9;
  v89 = v12;
  v83 = v2;
  if (!v30 || (v31 = sub_22D8B6420(), swift_release(), !v31))
  {
    v34 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_36;
  }
  if (v31 >> 62)
  {
    swift_bridgeObjectRetain();
    v32 = sub_22D8B71C4();
    if (v32)
      goto LABEL_19;
  }
  else
  {
    v32 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v32)
    {
LABEL_19:
      if (v32 < 1)
      {
        __break(1u);
LABEL_79:
        swift_bridgeObjectRetain();
        result = sub_22D8B71C4();
        v51 = result;
        if (result)
          goto LABEL_49;
        goto LABEL_80;
      }
      v33 = 0;
      v34 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        if ((v31 & 0xC000000000000001) != 0)
        {
          v35 = MEMORY[0x22E319D0C](v33, v31);
        }
        else
        {
          v35 = *(_QWORD *)(v31 + 8 * v33 + 32);
          swift_retain();
        }
        v94 = v35;
        sub_22D8A8C20((uint64_t)&v95);
        swift_release();
        if (*((_QWORD *)&v96 + 1))
        {
          sub_22D87D920(&v95, v97);
          sub_22D87D920(v97, &v95);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v34 = sub_22D8841D0(0, v34[2] + 1, 1, v34);
          v37 = v34[2];
          v36 = v34[3];
          if (v37 >= v36 >> 1)
            v34 = sub_22D8841D0((_QWORD *)(v36 > 1), v37 + 1, 1, v34);
          v34[2] = v37 + 1;
          sub_22D87D920(&v95, &v34[4 * v37 + 4]);
        }
        else
        {
          sub_22D8740E0((uint64_t)&v95, &qword_255D9B0E8);
        }
        ++v33;
      }
      while (v32 != v33);
      goto LABEL_35;
    }
  }
  v34 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_35:
  swift_bridgeObjectRelease_n();
LABEL_36:
  if (qword_255D9A3B0 != -1)
    swift_once();
  v38 = sub_22D8B6D80();
  v39 = __swift_project_value_buffer(v38, (uint64_t)qword_255D9B440);
  swift_bridgeObjectRetain_n();
  v40 = sub_22D8B6D68();
  v41 = sub_22D8B6FA8();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = swift_slowAlloc();
    v88 = v39;
    v43 = (uint8_t *)v42;
    v44 = swift_slowAlloc();
    *(_QWORD *)&v97[0] = v44;
    *(_DWORD *)v43 = 136315138;
    v86 = v43 + 4;
    v45 = swift_bridgeObjectRetain();
    v46 = MEMORY[0x22E319A90](v45, MEMORY[0x24BEE4AD8] + 8);
    v48 = v47;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v95 = sub_22D8755FC(v46, v48, (uint64_t *)v97);
    sub_22D8B7044();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22D86F000, v40, v41, "UsoEntity_common_Alarm.eligibleForTimerReformation – recurrenceDateTimes: %s", v43, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v44, -1, -1);
    v39 = v88;
    MEMORY[0x22E31A4BC](v43, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v9 = v92;
  v49 = v34[2];
  swift_bridgeObjectRelease();
  if (v49)
  {
    v22 = sub_22D8B6D68();
    v23 = sub_22D8B6FC0();
    if (!os_log_type_enabled(v22, v23))
      goto LABEL_14;
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    v25 = "UsoEntity_common_Alarm.eligibleForTimerReformation = false (day recurrences found)";
    goto LABEL_12;
  }
  v88 = v39;
  if (!sub_22D8B6450()
    || (v50 = sub_22D8B681C(), swift_release(), !v50)
    || (v12 = sub_22D8B6504(), swift_release(), !v12))
  {
    v54 = (uint8_t *)MEMORY[0x24BEE4AF8];
LABEL_82:
    v73 = *((_QWORD *)v54 + 2);
    swift_bridgeObjectRelease();
    v22 = sub_22D8B6D68();
    v74 = sub_22D8B6FC0();
    v75 = os_log_type_enabled(v22, v74);
    if (v73)
    {
      if (!v75)
        goto LABEL_14;
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      v28 = v74;
      v25 = "UsoEntity_common_Alarm.eligibleForTimerReformation = false (period recurrences found)";
      v27 = v22;
      goto LABEL_13;
    }
    if (v75)
    {
      v76 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v76 = 0;
      _os_log_impl(&dword_22D86F000, v22, v74, "UsoEntity_common_Alarm.eligibleForTimerReformation = true", v76, 2u);
      MEMORY[0x22E31A4BC](v76, -1, -1);
    }

    return 1;
  }
  if (v12 >> 62)
    goto LABEL_79;
  v51 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v51)
  {
LABEL_80:
    v54 = (uint8_t *)MEMORY[0x24BEE4AF8];
LABEL_81:
    swift_bridgeObjectRelease_n();
    goto LABEL_82;
  }
LABEL_49:
  if (v51 >= 1)
  {
    v52 = 0;
    v53 = v12 & 0xC000000000000001;
    v79 = *MEMORY[0x24BEA0828];
    v54 = (uint8_t *)MEMORY[0x24BEE4AF8];
    v82 = v12;
    v81 = v51;
    v80 = v12 & 0xC000000000000001;
    while (1)
    {
      if (v53)
        MEMORY[0x22E319D0C](v52, v12);
      else
        swift_retain();
      sub_22D8B63D8();
      if (!*(_QWORD *)&v97[0])
        goto LABEL_69;
      v55 = sub_22D8B67EC();
      if (v55)
        break;
LABEL_68:
      swift_release();
LABEL_69:
      v95 = 0u;
      v96 = 0u;
LABEL_70:
      swift_release();
      if (*((_QWORD *)&v96 + 1))
      {
        sub_22D87D920(&v95, v97);
        sub_22D87D920(v97, &v95);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v54 = (uint8_t *)sub_22D8841D0(0, *((_QWORD *)v54 + 2) + 1, 1, v54);
        v72 = *((_QWORD *)v54 + 2);
        v71 = *((_QWORD *)v54 + 3);
        if (v72 >= v71 >> 1)
          v54 = (uint8_t *)sub_22D8841D0((_QWORD *)(v71 > 1), v72 + 1, 1, v54);
        *((_QWORD *)v54 + 2) = v72 + 1;
        sub_22D87D920(&v95, &v54[32 * v72 + 32]);
      }
      else
      {
        sub_22D8740E0((uint64_t)&v95, &qword_255D9B0E8);
      }
      if (v51 == ++v52)
        goto LABEL_81;
    }
    v86 = v54;
    v85 = v55;
    sub_22D8B6468();
    v56 = v90;
    v57 = (uint64_t)v9;
    v58 = v89;
    v59 = v93;
    (*(void (**)(unint64_t, _QWORD, uint64_t))(v90 + 104))(v89, v79, v93);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v56 + 56))(v58, 0, 1, v59);
    v60 = (uint64_t)v91;
    v61 = (uint64_t)&v91[*(int *)(v87 + 48)];
    sub_22D88AE10(v57, (uint64_t)v91, &qword_255D9B3A8);
    sub_22D88AE10(v58, v61, &qword_255D9B3A8);
    v62 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v56 + 48);
    if (v62(v60, 1, v59) == 1)
    {
      sub_22D8740E0(v58, &qword_255D9B3A8);
      sub_22D8740E0(v57, &qword_255D9B3A8);
      v63 = v62(v61, 1, v93);
      v9 = (char *)v57;
      v12 = v82;
      v51 = v81;
      v54 = v86;
      if (v63 == 1)
      {
        sub_22D8740E0((uint64_t)v91, &qword_255D9B3A8);
        v53 = v80;
        goto LABEL_66;
      }
    }
    else
    {
      v64 = (uint64_t)v84;
      sub_22D88AE10(v60, (uint64_t)v84, &qword_255D9B3A8);
      if (v62(v61, 1, v93) != 1)
      {
        v65 = v90;
        v66 = v83;
        v67 = v64;
        v68 = v93;
        (*(void (**)(char *, uint64_t, uint64_t))(v90 + 32))(v83, v61, v93);
        sub_22D879430(&qword_255D9B490, (uint64_t (*)(uint64_t))MEMORY[0x24BEA0870], MEMORY[0x24BEA0880]);
        v78 = sub_22D8B6DF8();
        v69 = *(void (**)(char *, uint64_t))(v65 + 8);
        v69(v66, v68);
        sub_22D8740E0(v89, &qword_255D9B3A8);
        v9 = v92;
        sub_22D8740E0((uint64_t)v92, &qword_255D9B3A8);
        v69((char *)v67, v68);
        sub_22D8740E0(v60, &qword_255D9B3A8);
        v12 = v82;
        v51 = v81;
        v53 = v80;
        v54 = v86;
        if ((v78 & 1) != 0)
        {
LABEL_66:
          v70 = sub_22D8B6444();
          swift_release();
          if (!v70)
          {
            *((_QWORD *)&v96 + 1) = sub_22D8B6588();
            swift_release();
            *(_QWORD *)&v95 = v85;
            goto LABEL_70;
          }
        }
LABEL_67:
        swift_release();
        goto LABEL_68;
      }
      sub_22D8740E0(v89, &qword_255D9B3A8);
      v9 = v92;
      sub_22D8740E0((uint64_t)v92, &qword_255D9B3A8);
      (*(void (**)(uint64_t, uint64_t))(v90 + 8))(v64, v93);
      v12 = v82;
      v51 = v81;
      v54 = v86;
    }
    sub_22D8740E0((uint64_t)v91, &qword_255D9B488);
    v53 = v80;
    goto LABEL_67;
  }
  __break(1u);
  return result;
}

uint64_t sub_22D8A8C20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  char *v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  char *v29;
  uint64_t *boxed_opaque_existential_1;
  char v31;
  char *v32;
  char v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  void (*v36)(uint64_t *, char *, uint64_t);
  int v37;
  char *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B498);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22D8B66A8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v38 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v40 = (char *)&v34 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v39 = (char *)&v34 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v34 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v34 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v46 = (char *)&v34 - v20;
  result = sub_22D8B63D8();
  if (!v44)
    goto LABEL_12;
  v41 = v1;
  if (sub_22D8B6540())
  {
    v22 = sub_22D8B6438();
    swift_release();
    if (v22)
    {
      *(_QWORD *)(a1 + 24) = sub_22D8B65AC();
      result = swift_release();
      *(_QWORD *)a1 = v22;
      return result;
    }
  }
  if (!sub_22D8B6504())
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    goto LABEL_11;
  }
  sub_22D8B6468();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
LABEL_11:
    swift_release();
    result = sub_22D8740E0((uint64_t)v5, &qword_255D9B498);
    goto LABEL_12;
  }
  v23 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v23(v46, v5, v6);
  v24 = *MEMORY[0x24BEA1588];
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 104);
  v35(v19, v24, v6);
  v25 = sub_22D879430(&qword_255D9B4A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEA1598], MEMORY[0x24BEA15A8]);
  sub_22D8B6E94();
  v34 = v25;
  sub_22D8B6E94();
  v36 = (void (*)(uint64_t *, char *, uint64_t))v23;
  if (v44 == v42 && v45 == v43)
    v37 = 1;
  else
    v37 = sub_22D8B73F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v26 = *(void (**)(char *, uint64_t))(v7 + 8);
  v26(v19, v6);
  v27 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v28 = v46;
  v27(v16, v46, v6);
  if ((v37 & 1) != 0)
    goto LABEL_18;
  v35(v39, *MEMORY[0x24BEA1580], v6);
  sub_22D8B6E94();
  sub_22D8B6E94();
  if (v44 != v42 || v45 != v43)
  {
    v31 = sub_22D8B73F8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v26(v39, v6);
    v26(v16, v6);
    v29 = v40;
    v28 = v46;
    v27(v40, v46, v6);
    if ((v31 & 1) != 0)
      goto LABEL_19;
    v32 = v38;
    v35(v38, *MEMORY[0x24BEA1590], v6);
    sub_22D8B6E94();
    sub_22D8B6E94();
    if (v44 == v42 && v45 == v43)
    {
      swift_bridgeObjectRelease_n();
      v26(v32, v6);
      v28 = v46;
      goto LABEL_19;
    }
    v33 = sub_22D8B73F8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v26(v32, v6);
    v26(v29, v6);
    v28 = v46;
    if ((v33 & 1) != 0)
      goto LABEL_20;
    v26(v46, v6);
    result = swift_release();
LABEL_12:
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    return result;
  }
  swift_bridgeObjectRelease_n();
  v26(v39, v6);
  v28 = v46;
LABEL_18:
  v26(v16, v6);
  v29 = v40;
  v27(v40, v28, v6);
LABEL_19:
  v26(v29, v6);
LABEL_20:
  *(_QWORD *)(a1 + 24) = v6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a1);
  v36(boxed_opaque_existential_1, v28, v6);
  return swift_release();
}

uint64_t sub_22D8A9160(unsigned __int8 a1)
{
  return ((uint64_t (*)(_QWORD, _QWORD))((char *)nullsub_2 + 4 * byte_22D8B9590[a1]))(0, 0);
}

uint64_t sub_22D8A918C()
{
  return 0x64644172656D6954;
}

uint64_t sub_22D8A91A4()
{
  return 0x6C654472656D6954;
}

uint64_t sub_22D8A91C8()
{
  return 0x73694472656D6954;
}

uint64_t sub_22D8A92B8()
{
  return 0x6F6E536D72616C41;
}

void sub_22D8A92DC()
{
  JUMPOUT(0x22D8A92F0);
}

uint64_t sub_22D8A9318()
{
  return 0x737365536576694CLL;
}

uint64_t sub_22D8A9340(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = SiriTimeMeasurement.LogDescription.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == SiriTimeMeasurement.LogDescription.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_22D8B73F8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22D8A93C8()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_22D8B7434();
  SiriTimeMeasurement.LogDescription.rawValue.getter(v1);
  sub_22D8B6E4C();
  swift_bridgeObjectRelease();
  return sub_22D8B744C();
}

uint64_t sub_22D8A9428()
{
  unsigned __int8 *v0;

  SiriTimeMeasurement.LogDescription.rawValue.getter(*v0);
  sub_22D8B6E4C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D8A9468()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_22D8B7434();
  SiriTimeMeasurement.LogDescription.rawValue.getter(v1);
  sub_22D8B6E4C();
  swift_bridgeObjectRelease();
  return sub_22D8B744C();
}

uint64_t sub_22D8A94C4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s16SiriTimeInternal0aB11MeasurementV14LogDescriptionO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_22D8A94F0@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = SiriTimeMeasurement.LogDescription.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

double sub_22D8A9518()
{
  double result;
  mach_timebase_info v1[2];

  v1[1] = *(mach_timebase_info *)MEMORY[0x24BDAC8D0];
  v1[0] = 0;
  mach_timebase_info(v1);
  result = *(double *)v1;
  qword_255D9B4A8 = (uint64_t)v1[0];
  return result;
}

void sub_22D8A9578()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B568);
  MEMORY[0x24BDAC7A8]();
  __asm { BR              X9 }
}

void sub_22D8A95E8(unsigned __int8 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;

  sub_22D8A9160(a1);
  if (v4)
  {
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94BF8]), sel_init);
    if (!v5)
    {
      swift_bridgeObjectRelease();
      return;
    }
    *(_QWORD *)(v3 - 56) = v5;
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94C10]), sel_init);
    if (v6)
    {
      *(_QWORD *)(v3 - 64) = v6;
      v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94BE8]), sel_init);
      if (v7)
      {
        v8 = v7;
        objc_msgSend(*(id *)(v3 - 64), sel_setDomainExecutionType_, 1028);
        objc_msgSend(*(id *)(v3 - 56), sel_setStartedOrChanged_, *(_QWORD *)(v3 - 64));
        objc_msgSend(*(id *)(v3 - 56), sel_setContextId_, *(_QWORD *)(v2 + *(int *)(type metadata accessor for SiriTimeMeasurement() + 36)));
        objc_msgSend(v8, sel_setFlowDomainExecutionContext_, *(_QWORD *)(v3 - 56));
        sub_22D8B5EB0();
        v9 = v8;
        v10 = sub_22D8B5EA4();
        v11 = sub_22D8B6F3C();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v1, 1, 1, v11);
        v12 = (_QWORD *)swift_allocObject();
        v12[2] = 0;
        v12[3] = 0;
        v12[4] = v10;
        swift_retain();
        sub_22D8A9964(v1, (uint64_t)&unk_255D9B578, (uint64_t)v12);

        swift_release();
        swift_release();
        sub_22D8740E0(v1, &qword_255D9B568);
        return;
      }
      swift_bridgeObjectRelease();

      v13 = *(void **)(v3 - 64);
    }
    else
    {
      swift_bridgeObjectRelease();
      v13 = *(void **)(v3 - 56);
    }

  }
}

uint64_t SiriTimeMeasurement.setBreachThreshold(_:logSubtype:)(uint64_t a1, unint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;

  v7 = type metadata accessor for SiriTimeMeasurement();
  v8 = (uint64_t *)(v3 + *(int *)(v7 + 28));
  v9 = *v8;
  v10 = v8[1];
  sub_22D893628(a1, a2);
  result = sub_22D8AA3A0(v9, v10);
  *v8 = a1;
  v8[1] = a2;
  *(double *)(v3 + *(int *)(v7 + 32)) = a3;
  return result;
}

uint64_t sub_22D8A9878(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 56) = a4;
  return swift_task_switch();
}

uint64_t sub_22D8A9890()
{
  _QWORD *v0;
  _QWORD *v1;

  sub_22D8B5E38();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[8] = v1;
  *v1 = v0;
  v1[1] = sub_22D8A9910;
  return sub_22D8B5E50();
}

uint64_t sub_22D8A9910()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D8A9964(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];

  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B568);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D8AABA8(a1, (uint64_t)v7);
  v8 = sub_22D8B6F3C();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_22D8740E0((uint64_t)v7, &qword_255D9B568);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v10 = sub_22D8B6F18();
      v12 = v11;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_22D8B6F30();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v10 = 0;
  v12 = 0;
LABEL_6:
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  if (v12 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v10;
    v15[3] = v12;
  }
  return swift_task_create();
}

void sub_22D8A9AF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unsigned int v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  id v15;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B568);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(unsigned __int8 *)(v0 + 8);
  if (v4 < 0x1B || ((1 << v4) & 0x9F8000000) == 0)
  {
    sub_22D8A9160(v4);
    if (v5)
    {
      v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94BF8]), sel_init);
      if (v6)
      {
        v15 = v6;
        v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94C00]), sel_init);
        if (v7)
        {
          v14 = v7;
          v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94BE8]), sel_init);
          if (v8)
          {
            v9 = v8;
            objc_msgSend(v14, sel_setExists_, 1);
            objc_msgSend(v15, sel_setEnded_, v14);
            objc_msgSend(v15, sel_setContextId_, *(_QWORD *)(v0 + *(int *)(type metadata accessor for SiriTimeMeasurement() + 36)));
            objc_msgSend(v9, sel_setFlowDomainExecutionContext_, v15);
            sub_22D8B5EB0();
            v10 = v9;
            v11 = sub_22D8B5EA4();
            v12 = sub_22D8B6F3C();
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v3, 1, 1, v12);
            v13 = (_QWORD *)swift_allocObject();
            v13[2] = 0;
            v13[3] = 0;
            v13[4] = v11;
            swift_retain();
            sub_22D8A9964((uint64_t)v3, (uint64_t)&unk_255D9B598, (uint64_t)v13);

            swift_release();
            swift_release();
            sub_22D8740E0((uint64_t)v3, &qword_255D9B568);
          }
          else
          {
            swift_bridgeObjectRelease();

          }
        }
        else
        {
          swift_bridgeObjectRelease();

        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
}

uint64_t sub_22D8A9D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 56) = a4;
  return swift_task_switch();
}

uint64_t sub_22D8A9D80()
{
  _QWORD *v0;
  _QWORD *v1;

  sub_22D8B5E38();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[8] = v1;
  *v1 = v0;
  v1[1] = sub_22D8A9E00;
  return sub_22D8B5E50();
}

uint64_t sub_22D8A9E00()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D8A9E54()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8A9E84(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_22D8A9EE8;
  return v6(a1);
}

uint64_t sub_22D8A9EE8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_22D8A9F34(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;

  sub_22D8AAC84(a1, a2, a3, a4, (uint64_t (*)(void))sub_22D893628, (uint64_t (*)(void))sub_22D89363C, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))sub_22D89359C, sub_22D894008);
  if (qword_255D9A350 != -1)
    swift_once();
  if (byte_255D9F6F8 == 1)
  {
    if (qword_255D9A340 != -1)
      swift_once();
    v8 = sub_22D8B6D80();
    __swift_project_value_buffer(v8, (uint64_t)qword_255D9AE18);
    v9 = sub_22D8B6D68();
    v10 = sub_22D8B6FB4();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_22D86F000, v9, v10, "SiriTime initiating AutoBugCapture report...", v11, 2u);
      MEMORY[0x22E31A4BC](v11, -1, -1);
    }

    ABCReport.type.getter(a1, a2, a3, a4);
    ABCReport.subType.getter(a1, a2, a3, a4);
    __asm { BR              X9 }
  }
  return sub_22D8AAC84(a1, a2, a3, a4, (uint64_t (*)(void))sub_22D893524, (uint64_t (*)(void))sub_22D893538, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))sub_22D89354C, sub_22D894004);
}

uint64_t sub_22D8AA3A0(uint64_t a1, unint64_t a2)
{
  if (a2 != 2)
    return sub_22D893524(a1, a2);
  return a1;
}

uint64_t _s16SiriTimeInternal0aB11MeasurementV14LogDescriptionO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_22D8B7410();
  swift_bridgeObjectRelease();
  if (v0 >= 0x24)
    return 36;
  else
    return v0;
}

unint64_t sub_22D8AA404()
{
  unint64_t result;

  result = qword_255D9B4B8;
  if (!qword_255D9B4B8)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for SiriTimeMeasurement.LogDescription, &type metadata for SiriTimeMeasurement.LogDescription);
    atomic_store(result, (unint64_t *)&qword_255D9B4B8);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for SiriTimeMeasurement(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_QWORD *)a1 = *a2;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    v7 = a3[6];
    v8 = a1 + v7;
    v9 = (uint64_t)a2 + v7;
    v10 = sub_22D8B6D80();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[7];
    v12 = (char *)v4 + v11;
    v13 = (uint64_t)a2 + v11;
    v14 = *(_QWORD *)(v13 + 8);
    if (v14 <= 2)
    {
      *(_OWORD *)v12 = *(_OWORD *)v13;
    }
    else
    {
      *(_QWORD *)v12 = *(_QWORD *)v13;
      *((_QWORD *)v12 + 1) = v14;
      swift_bridgeObjectRetain();
    }
    v16 = a3[9];
    *(_QWORD *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    v17 = *(void **)((char *)a2 + v16);
    *(_QWORD *)((char *)v4 + v16) = v17;
    v18 = v17;
  }
  return v4;
}

uint64_t assignWithCopy for SiriTimeMeasurement(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_22D8B6D80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[7];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  v13 = *(_QWORD *)(a1 + v10 + 8);
  v14 = *(_QWORD *)(a2 + v10 + 8);
  if (v13 == 2)
  {
    if (v14 > 2)
      goto LABEL_8;
    goto LABEL_11;
  }
  if (v14 == 2)
  {
    sub_22D8AA674((uint64_t)v11);
    goto LABEL_11;
  }
  if (v13 >= 2)
  {
    if (v14 >= 2)
    {
      *v11 = *v12;
      v11[1] = v12[1];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    sub_22D8740E0((uint64_t)v11, &qword_255D9B4C0);
    goto LABEL_11;
  }
  if (v14 < 2)
  {
LABEL_11:
    *(_OWORD *)v11 = *(_OWORD *)v12;
    goto LABEL_12;
  }
LABEL_8:
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
LABEL_12:
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  v15 = a3[9];
  v16 = *(void **)(a2 + v15);
  v17 = *(void **)(a1 + v15);
  *(_QWORD *)(a1 + v15) = v16;
  v18 = v16;

  return a1;
}

uint64_t sub_22D8AA674(uint64_t a1)
{
  destroy for TimingErrorSubType(a1);
  return a1;
}

uint64_t initializeWithTake for SiriTimeMeasurement(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_22D8B6D80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for SiriTimeMeasurement(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_22D8B6D80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[7];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  v13 = *(_QWORD *)(a1 + v10 + 8);
  v14 = *(_QWORD *)(a2 + v10 + 8);
  if (v13 != 2)
  {
    if (v14 == 2)
    {
      sub_22D8AA674((uint64_t)v11);
    }
    else if (v13 >= 2)
    {
      if (v14 >= 2)
      {
        *v11 = *v12;
        v11[1] = v14;
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
      sub_22D8740E0((uint64_t)v11, &qword_255D9B4C0);
    }
  }
  *(_OWORD *)v11 = *(_OWORD *)v12;
LABEL_8:
  v15 = a3[9];
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  v16 = *(void **)(a1 + v15);
  *(_QWORD *)(a1 + v15) = *(_QWORD *)(a2 + v15);

  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTimeMeasurement()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22D8AA848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_22D8B6D80();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 24), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 36));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriTimeMeasurement()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22D8AA8D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_22D8B6D80();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 24), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 36)) = (a2 - 1);
  return result;
}

uint64_t sub_22D8AA950()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22D8B6D80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SiriTimeMeasurement.LogDescription(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xDD)
    goto LABEL_17;
  if (a2 + 35 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 35) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 35;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 35;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 35;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x24;
  v8 = v6 - 36;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SiriTimeMeasurement.LogDescription(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 35 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 35) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xDD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xDC)
    return ((uint64_t (*)(void))((char *)&loc_22D8AAAC4 + 4 * byte_22D8B960C[v4]))();
  *a1 = a2 + 35;
  return ((uint64_t (*)(void))((char *)sub_22D8AAAF8 + 4 * byte_22D8B9607[v4]))();
}

uint64_t sub_22D8AAAF8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8AAB00(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D8AAB08);
  return result;
}

uint64_t sub_22D8AAB14(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D8AAB1CLL);
  *(_BYTE *)result = a2 + 35;
  return result;
}

uint64_t sub_22D8AAB20(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8AAB28(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriTimeMeasurement.LogDescription()
{
  return &type metadata for SiriTimeMeasurement.LogDescription;
}

uint64_t sub_22D8AAB48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22D8985F0;
  v3[7] = v2;
  return swift_task_switch();
}

uint64_t sub_22D8AABA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B568);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D8AABF0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D8AAC14(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22D87F604;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255D9B580 + dword_255D9B580))(a1, v4);
}

uint64_t sub_22D8AAC84(uint64_t result, uint64_t a2, uint64_t a3, unsigned __int8 a4, uint64_t (*a5)(void), uint64_t (*a6)(void), uint64_t (*a7)(uint64_t, uint64_t, uint64_t, _QWORD), uint64_t (*a8)(void))
{
  switch(a4 >> 4)
  {
    case 0:
      result = a5();
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 9:
      result = a6();
      break;
    case 7:
      result = a7(result, a2, a3, a4 & 0xF);
      break;
    case 8:
      result = a8();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22D8AACC0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22D8AACF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22D87F604;
  v3[7] = v2;
  return swift_task_switch();
}

void sub_22D8AAD5C()
{
  strcpy((char *)&static SiriTimePluginModel.bundleName, "TimerUIPlugin");
  unk_255D9F736 = -4864;
}

uint64_t *SiriTimePluginModel.bundleName.unsafeMutableAddressor()
{
  if (qword_255D9A3C0 != -1)
    swift_once();
  return &static SiriTimePluginModel.bundleName;
}

uint64_t static SiriTimePluginModel.bundleName.getter()
{
  uint64_t v0;

  if (qword_255D9A3C0 != -1)
    swift_once();
  v0 = static SiriTimePluginModel.bundleName;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t SiriTimePluginModel.snippetHidden(for:idiom:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  uint64_t v6;

  v0 = sub_22D8B6AEC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEA8968], v0);
  v4 = sub_22D8B6AE0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4 & 1;
}

uint64_t sub_22D8AAEC8(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6C655372656D6974;
  else
    return 0x6C754D72656D6974;
}

BOOL sub_22D8AAF10(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_22D8AAF30()
{
  char *v0;

  return sub_22D8AAEC8(*v0);
}

uint64_t sub_22D8AAF38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22D8AF9D8(a1, a2);
  *a3 = result;
  return result;
}

void sub_22D8AAF5C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_22D8AAF68()
{
  sub_22D8AB3A8();
  return sub_22D8B7470();
}

uint64_t sub_22D8AAF90()
{
  sub_22D8AB3A8();
  return sub_22D8B747C();
}

uint64_t sub_22D8AAFB8()
{
  sub_22D8AB430();
  return sub_22D8B7470();
}

uint64_t sub_22D8AAFE0()
{
  sub_22D8AB430();
  return sub_22D8B747C();
}

uint64_t sub_22D8AB008()
{
  sub_22D8AB3EC();
  return sub_22D8B7470();
}

uint64_t sub_22D8AB030()
{
  sub_22D8AB3EC();
  return sub_22D8B747C();
}

uint64_t SiriTimePluginModel.encode(to:)(_QWORD *a1)
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
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B5A0);
  v24 = *(_QWORD *)(v2 - 8);
  v25 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v23 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for TimerSelectorModel(0);
  MEMORY[0x24BDAC7A8](v22);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B5A8);
  v20 = *(_QWORD *)(v6 - 8);
  v21 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for SiriTimePluginModel(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B5B0);
  v26 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D8AB3A8();
  sub_22D8B7464();
  sub_22D88CC60(v27, (uint64_t)v11, type metadata accessor for SiriTimePluginModel);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_22D88B72C((uint64_t)v11, (uint64_t)v5, type metadata accessor for TimerSelectorModel);
    v30 = 1;
    sub_22D8AB3EC();
    v15 = v23;
    sub_22D8B72A8();
    sub_22D879430(&qword_255D9B5C8, type metadata accessor for TimerSelectorModel, (uint64_t)&protocol conformance descriptor for TimerSelectorModel);
    v16 = v25;
    sub_22D8B72F0();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v15, v16);
    sub_22D8AFD0C((uint64_t)v5, type metadata accessor for TimerSelectorModel);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v14, v12);
  }
  else
  {
    v18 = *v11;
    v29 = 0;
    sub_22D8AB430();
    sub_22D8B72A8();
    v28 = v18;
    sub_22D8AB474();
    v19 = v21;
    sub_22D8B72F0();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v8, v19);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v12);
    return swift_bridgeObjectRelease();
  }
}

uint64_t type metadata accessor for TimerSelectorModel(uint64_t a1)
{
  return sub_22D88B330(a1, qword_255D9B878);
}

uint64_t type metadata accessor for SiriTimePluginModel(uint64_t a1)
{
  return sub_22D88B330(a1, qword_255D9B740);
}

unint64_t sub_22D8AB3A8()
{
  unint64_t result;

  result = qword_255D9B5B8;
  if (!qword_255D9B5B8)
  {
    result = MEMORY[0x22E31A408](&unk_22D8BA0D8, &type metadata for SiriTimePluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B5B8);
  }
  return result;
}

unint64_t sub_22D8AB3EC()
{
  unint64_t result;

  result = qword_255D9B5C0;
  if (!qword_255D9B5C0)
  {
    result = MEMORY[0x22E31A408](&unk_22D8BA088, &type metadata for SiriTimePluginModel.TimerSelectorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B5C0);
  }
  return result;
}

unint64_t sub_22D8AB430()
{
  unint64_t result;

  result = qword_255D9B5D0;
  if (!qword_255D9B5D0)
  {
    result = MEMORY[0x22E31A408]("\tG\n\"\\d", &type metadata for SiriTimePluginModel.TimerMultiCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B5D0);
  }
  return result;
}

unint64_t sub_22D8AB474()
{
  unint64_t result;

  result = qword_255D9B5D8;
  if (!qword_255D9B5D8)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for TimerSnippetModel, &type metadata for TimerSnippetModel);
    atomic_store(result, (unint64_t *)&qword_255D9B5D8);
  }
  return result;
}

uint64_t SiriTimePluginModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;

  v39 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B5E0);
  v4 = *(_QWORD *)(v3 - 8);
  v42 = v3;
  v43 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v46 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B5E8);
  v40 = *(_QWORD *)(v6 - 8);
  v41 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v45 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B5F0);
  v44 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for SiriTimePluginModel(0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v36 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v36 - v18;
  v20 = a1[3];
  v47 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v20);
  sub_22D8AB3A8();
  v21 = v48;
  sub_22D8B7458();
  if (v21)
    goto LABEL_10;
  v36 = v17;
  v37 = v19;
  v38 = v14;
  v22 = v45;
  v23 = v46;
  v48 = v11;
  v24 = sub_22D8B7284();
  if (*(_QWORD *)(v24 + 16) != 1)
  {
    v29 = sub_22D8B7164();
    swift_allocError();
    v31 = v30;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA10);
    *v31 = v48;
    sub_22D8B7224();
    sub_22D8B7158();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v29 - 8) + 104))(v31, *MEMORY[0x24BEE26D0], v29);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v10, v8);
LABEL_10:
    v27 = (uint64_t)v47;
    return __swift_destroy_boxed_opaque_existential_1Tm(v27);
  }
  if ((*(_BYTE *)(v24 + 32) & 1) != 0)
  {
    v51 = 1;
    sub_22D8AB3EC();
    sub_22D8B7218();
    type metadata accessor for TimerSelectorModel(0);
    sub_22D879430(&qword_255D9B5F8, type metadata accessor for TimerSelectorModel, (uint64_t)&protocol conformance descriptor for TimerSelectorModel);
    v25 = (uint64_t)v38;
    v26 = v42;
    sub_22D8B7278();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v23, v26);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v10, v8);
    v27 = (uint64_t)v47;
    swift_storeEnumTagMultiPayload();
    v28 = v25;
  }
  else
  {
    v50 = 0;
    sub_22D8AB430();
    sub_22D8B7218();
    sub_22D8AB954();
    v33 = v41;
    sub_22D8B7278();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v22, v33);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v10, v8);
    v27 = (uint64_t)v47;
    v34 = v36;
    *v36 = v49;
    swift_storeEnumTagMultiPayload();
    v28 = (uint64_t)v34;
  }
  v35 = (uint64_t)v37;
  sub_22D88B72C(v28, (uint64_t)v37, type metadata accessor for SiriTimePluginModel);
  sub_22D88B72C(v35, v39, type metadata accessor for SiriTimePluginModel);
  return __swift_destroy_boxed_opaque_existential_1Tm(v27);
}

unint64_t sub_22D8AB954()
{
  unint64_t result;

  result = qword_255D9B600;
  if (!qword_255D9B600)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for TimerSnippetModel, &type metadata for TimerSnippetModel);
    atomic_store(result, (unint64_t *)&qword_255D9B600);
  }
  return result;
}

uint64_t sub_22D8AB998()
{
  uint64_t v0;

  if (qword_255D9A3C0 != -1)
    swift_once();
  v0 = static SiriTimePluginModel.bundleName;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_22D8AB9F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  uint64_t v6;

  v0 = sub_22D8B6AEC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEA8968], v0);
  v4 = sub_22D8B6AE0();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v4 & 1;
}

uint64_t sub_22D8ABA94@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SiriTimePluginModel.init(from:)(a1, a2);
}

uint64_t sub_22D8ABAA8(_QWORD *a1)
{
  return SiriTimePluginModel.encode(to:)(a1);
}

uint64_t TimerSnippetModel.timers.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*TimerSnippetModel.timers.modify())()
{
  return nullsub_1;
}

_QWORD *TimerSnippetModel.init(from:)(_QWORD *a1)
{
  return sub_22D8AFAE0(a1);
}

uint64_t TimerSnippetModel.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B608);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D8AFC2C();
  sub_22D8B7464();
  v9[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B618);
  sub_22D8AFE5C(&qword_255D9B620, &qword_255D9B628, (uint64_t)&protocol conformance descriptor for SiriTimerSnippetModel, MEMORY[0x24BEE12A0]);
  sub_22D8B72F0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_22D8ABC38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22D8B1D10(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_22D8ABC60()
{
  sub_22D8AFC2C();
  return sub_22D8B7470();
}

uint64_t sub_22D8ABC88()
{
  sub_22D8AFC2C();
  return sub_22D8B747C();
}

_QWORD *sub_22D8ABCB0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_22D8AFAE0(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_22D8ABCD8(_QWORD *a1)
{
  uint64_t *v1;

  return TimerSnippetModel.encode(to:)(a1, *v1);
}

uint64_t SiriTimerSnippetModel.timerIdentifier.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriTimerSnippetModel.timerIdentifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SiriTimerSnippetModel.timerIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.directInvocationUri.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriTimerSnippetModel.directInvocationUri.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*SiriTimerSnippetModel.directInvocationUri.modify())()
{
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.directInvocationPayload.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t SiriTimerSnippetModel.directInvocationPayload.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 32) = a1;
  return result;
}

uint64_t (*SiriTimerSnippetModel.directInvocationPayload.modify())()
{
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.punchoutURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for SiriTimerSnippetModel(0);
  return sub_22D88AE10(v1 + *(int *)(v3 + 28), a1, &qword_255D9B300);
}

uint64_t SiriTimerSnippetModel.punchoutURL.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 28);
  return sub_22D88BE1C(a1, v3);
}

uint64_t (*SiriTimerSnippetModel.punchoutURL.modify())()
{
  type metadata accessor for SiriTimerSnippetModel(0);
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.label.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SiriTimerSnippetModel.label.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 32));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*SiriTimerSnippetModel.label.modify())()
{
  type metadata accessor for SiriTimerSnippetModel(0);
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.duration.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 36));
}

uint64_t SiriTimerSnippetModel.duration.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;

  result = type metadata accessor for SiriTimerSnippetModel(0);
  v6 = v2 + *(int *)(result + 36);
  *(_QWORD *)v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*SiriTimerSnippetModel.duration.modify())()
{
  type metadata accessor for SiriTimerSnippetModel(0);
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.remainingTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 40));
}

uint64_t SiriTimerSnippetModel.remainingTime.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;

  result = type metadata accessor for SiriTimerSnippetModel(0);
  v6 = v2 + *(int *)(result + 40);
  *(_QWORD *)v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*SiriTimerSnippetModel.remainingTime.modify())()
{
  type metadata accessor for SiriTimerSnippetModel(0);
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.state.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for SiriTimerSnippetModel(0) + 44));
}

uint64_t SiriTimerSnippetModel.state.setter(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;

  result = type metadata accessor for SiriTimerSnippetModel(0);
  v6 = v2 + *(int *)(result + 44);
  *(_QWORD *)v6 = a1;
  *(_BYTE *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*SiriTimerSnippetModel.state.modify())()
{
  type metadata accessor for SiriTimerSnippetModel(0);
  return nullsub_1;
}

uint64_t SiriTimerSnippetModel.init(timerIdentifier:directInvocation:label:duration:remainingTime:state:punchoutURL:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, char a10, uint64_t a11, unsigned __int8 a12, uint64_t a13)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v27;
  char *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(char *, uint64_t, uint64_t);
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t result;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  int v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;

  v57 = a8;
  v56 = a7;
  v54 = a5;
  v55 = a6;
  v52 = a13;
  v53 = a4;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AD18);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v44 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v44 - v21;
  v23 = (int *)type metadata accessor for SiriTimerSnippetModel(0);
  a9[3] = 0;
  a9[4] = 0;
  a9[2] = 0;
  v24 = (uint64_t)a9 + v23[7];
  v25 = sub_22D8B5BA4();
  v26 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56);
  v50 = v24;
  v26(v24, 1, 1, v25);
  v27 = (_QWORD *)((char *)a9 + v23[8]);
  *v27 = 0;
  v27[1] = 0;
  v28 = (char *)a9 + v23[9];
  *(_QWORD *)v28 = 0;
  v49 = v28;
  v28[8] = 1;
  v29 = (char *)a9 + v23[10];
  *(_QWORD *)v29 = 0;
  v46 = v29;
  v29[8] = 1;
  v30 = (char *)a9 + v23[11];
  *(_QWORD *)v30 = 0;
  v30[8] = 1;
  *a9 = a1;
  a9[1] = a2;
  v51 = a3;
  sub_22D88AE10(a3, (uint64_t)v22, &qword_255D9AD18);
  v31 = sub_22D8B6198();
  v32 = *(_QWORD *)(v31 - 8);
  v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48);
  v34 = v33(v22, 1, v31);
  v45 = v32;
  if (v34 == 1)
  {
    sub_22D8740E0((uint64_t)v22, &qword_255D9AD18);
    v35 = 0;
    v36 = 0;
  }
  else
  {
    v35 = sub_22D8B6180();
    v36 = v37;
    (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v31);
  }
  v48 = a12;
  v47 = a11;
  swift_bridgeObjectRelease();
  a9[2] = v35;
  a9[3] = v36;
  v38 = v51;
  sub_22D88AE10(v51, (uint64_t)v20, &qword_255D9AD18);
  if (v33(v20, 1, v31) == 1)
  {
    sub_22D8740E0(v38, &qword_255D9AD18);
    sub_22D8740E0((uint64_t)v20, &qword_255D9AD18);
    v39 = 0;
  }
  else
  {
    v39 = sub_22D8B618C();
    sub_22D8740E0(v38, &qword_255D9AD18);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v20, v31);
  }
  swift_bridgeObjectRelease();
  a9[4] = v39;
  sub_22D88BE1C(v52, v50);
  result = swift_bridgeObjectRelease();
  v41 = v54;
  *v27 = v53;
  v27[1] = v41;
  v42 = v49;
  *v49 = v55;
  *((_BYTE *)v42 + 8) = v56 & 1;
  v43 = v46;
  *v46 = v57;
  *((_BYTE *)v43 + 8) = a10 & 1;
  *(_QWORD *)v30 = v47;
  v30[8] = v48 & 1;
  return result;
}

uint64_t SiriTimerSnippetModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t *v19;
  char *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  char *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v32;
  unint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t *v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  char v46;
  uint64_t v47;
  _QWORD *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  char v68;
  char v69;
  char v70;
  char v71;
  char v72;
  char v73;
  char v74;

  v59 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B630);
  MEMORY[0x24BDAC7A8](v3);
  v56 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B638);
  v57 = *(_QWORD *)(v5 - 8);
  v58 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v55 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
  MEMORY[0x24BDAC7A8](v7);
  v60 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B640);
  v61 = *(_QWORD *)(v9 - 8);
  v62 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (int *)type metadata accessor for SiriTimerSnippetModel(0);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (uint64_t *)((char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15[3] = 0;
  v15[4] = 0;
  v15[2] = 0;
  v16 = (char *)v15 + *(int *)(v13 + 28);
  v17 = sub_22D8B5BA4();
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v64 = (uint64_t)v16;
  v18(v16, 1, 1, v17);
  v19 = (uint64_t *)((char *)v15 + v12[8]);
  *v19 = 0;
  v19[1] = 0;
  v65 = v15;
  v66 = v19;
  v20 = (char *)v15 + v12[9];
  *(_QWORD *)v20 = 0;
  v20[8] = 1;
  v21 = (uint64_t *)((char *)v15 + v12[10]);
  *v21 = 0;
  *((_BYTE *)v21 + 8) = 1;
  v22 = (uint64_t *)((char *)v15 + v12[11]);
  *v22 = 0;
  *((_BYTE *)v22 + 8) = 1;
  v23 = a1[3];
  v63 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v23);
  sub_22D8AFC84();
  v24 = v67;
  sub_22D8B7458();
  if (v24)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v63);
    v30 = v64;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_22D8740E0(v30, &qword_255D9B300);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v25 = v20;
    v67 = v21;
    v54 = v22;
    v26 = v61;
    v74 = 0;
    v27 = (uint64_t *)v11;
    v28 = sub_22D8B7230();
    if (v29)
      v32 = v28;
    else
      v32 = 0;
    v33 = 0xE000000000000000;
    if (v29)
      v33 = v29;
    v34 = v65;
    *v65 = v32;
    v34[1] = v33;
    v73 = 1;
    v35 = sub_22D8B7230();
    v36 = v66;
    v34[2] = v35;
    v34[3] = v37;
    v72 = 3;
    *v36 = sub_22D8B7230();
    v36[1] = v38;
    v71 = 4;
    *(_QWORD *)v25 = sub_22D8B7248();
    v25[8] = v39 & 1;
    v70 = 5;
    v40 = sub_22D8B7248();
    v41 = v67;
    *v67 = v40;
    *((_BYTE *)v41 + 8) = v42 & 1;
    v69 = 6;
    v43 = sub_22D8B7254();
    v44 = v64;
    v45 = v54;
    *v54 = v43;
    *((_BYTE *)v45 + 8) = v46 & 1;
    v68 = 7;
    sub_22D879430(&qword_255D9AA90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB10]);
    v47 = (uint64_t)v60;
    sub_22D8B7260();
    v67 = v27;
    sub_22D88BE1C(v47, v44);
    v48 = v63;
    __swift_project_boxed_opaque_existential_1(v63, v63[3]);
    sub_22D8AFCC8();
    v49 = v56;
    sub_22D8B7458();
    v51 = v57;
    v50 = v58;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v49, 0, 1, v58);
    v52 = (uint64_t)v55;
    (*(void (**)(char *, char *, uint64_t))(v51 + 32))(v55, v49, v50);
    v53 = sub_22D8AC964(v52);
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v52, v50);
    (*(void (**)(uint64_t *, uint64_t))(v26 + 8))(v67, v62);
    swift_bridgeObjectRelease();
    v34[4] = v53;
    sub_22D88CC60((uint64_t)v34, v59, type metadata accessor for SiriTimerSnippetModel);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v48);
    return sub_22D8AFD0C((uint64_t)v34, type metadata accessor for SiriTimerSnippetModel);
  }
}

uint64_t sub_22D8AC964(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  _QWORD *v17;
  char v18;
  char v19;
  unint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  _QWORD *v29;
  char isUniquelyReferenced_nonNull_native;
  char v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  _QWORD *v41;
  char v42;
  char v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v46;
  char v47;
  unint64_t v48;
  char v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, char *, uint64_t);
  char *v54;
  uint64_t v55;
  _QWORD *v56;
  char v57;
  char v58;
  unint64_t v59;
  uint64_t v60;
  _BOOL8 v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  _QWORD *v67;
  char v68;
  char v69;
  uint64_t v70;
  _BOOL8 v71;
  uint64_t v72;
  char v73;
  unint64_t v74;
  char v75;
  _QWORD *v76;
  uint64_t *v77;
  _QWORD *v78;
  uint64_t v79;
  BOOL v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  _OWORD *v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t result;
  _QWORD v93[2];
  char *v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  _QWORD *v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  uint64_t v105;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B630);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v93 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B638);
  v97 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v94 = (char *)v93 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = (_QWORD *)sub_22D889444(MEMORY[0x24BEE4AF8]);
  v96 = v5;
  v7 = sub_22D8B7284();
  v8 = *(_QWORD *)(v7 + 16);
  if (!v8)
  {
LABEL_62:
    swift_bridgeObjectRelease();
    return (uint64_t)v100;
  }
  v95 = v4;
  v93[1] = v7;
  v9 = (_BYTE *)(v7 + 56);
  v98 = a1;
  while (1)
  {
    v11 = *((_QWORD *)v9 - 3);
    v12 = *((_QWORD *)v9 - 2);
    v13 = *((_QWORD *)v9 - 1);
    v14 = *v9;
    *(_QWORD *)&v103 = v11;
    *((_QWORD *)&v103 + 1) = v12;
    v104 = v13;
    LOBYTE(v105) = v14;
    swift_bridgeObjectRetain();
    v15 = sub_22D8B7254();
    if ((v16 & 1) == 0)
      break;
    *(_QWORD *)&v103 = v11;
    *((_QWORD *)&v103 + 1) = v12;
    v104 = v13;
    LOBYTE(v105) = v14;
    v27 = sub_22D8B7248();
    if ((v28 & 1) == 0)
    {
      v105 = MEMORY[0x24BEE13C8];
      *(_QWORD *)&v103 = v27;
      sub_22D87D920(&v103, &v102);
      v29 = v100;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v101 = v29;
      v20 = sub_22D8AF240(v11, v12);
      v32 = v29[2];
      v33 = (v31 & 1) == 0;
      v34 = v32 + v33;
      if (__OFADD__(v32, v33))
        goto LABEL_66;
      v35 = v31;
      if (v29[3] >= v34)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_22D8AF6A0();
      }
      else
      {
        sub_22D8AF33C(v34, isUniquelyReferenced_nonNull_native);
        v36 = sub_22D8AF240(v11, v12);
        if ((v35 & 1) != (v37 & 1))
          goto LABEL_73;
        v20 = v36;
      }
      v76 = v101;
      v100 = v101;
      if ((v35 & 1) == 0)
      {
        v101[(v20 >> 6) + 8] |= 1 << v20;
        v88 = (uint64_t *)(v100[6] + 16 * v20);
        *v88 = v11;
        v88[1] = v12;
        sub_22D87D920(&v102, (_OWORD *)(v100[7] + 32 * v20));
        v78 = v100;
        v89 = v100[2];
        v80 = __OFADD__(v89, 1);
        v81 = v89 + 1;
        if (v80)
          goto LABEL_71;
        goto LABEL_61;
      }
      goto LABEL_3;
    }
    *(_QWORD *)&v103 = v11;
    *((_QWORD *)&v103 + 1) = v12;
    v104 = v13;
    LOBYTE(v105) = v14;
    v38 = sub_22D8B7230();
    if (v39)
    {
      v105 = MEMORY[0x24BEE0D00];
      *(_QWORD *)&v103 = v38;
      *((_QWORD *)&v103 + 1) = v39;
      sub_22D87D920(&v103, &v102);
      v41 = v100;
      v42 = swift_isUniquelyReferenced_nonNull_native();
      v101 = v41;
      v20 = sub_22D8AF240(v11, v12);
      v44 = v41[2];
      v45 = (v43 & 1) == 0;
      v46 = v44 + v45;
      if (__OFADD__(v44, v45))
        goto LABEL_64;
      v47 = v43;
      if (v41[3] >= v46)
      {
        if ((v42 & 1) == 0)
          sub_22D8AF6A0();
      }
      else
      {
        sub_22D8AF33C(v46, v42);
        v48 = sub_22D8AF240(v11, v12);
        if ((v47 & 1) != (v49 & 1))
          goto LABEL_73;
        v20 = v48;
      }
      v76 = v101;
      v100 = v101;
      if ((v47 & 1) == 0)
      {
        v101[(v20 >> 6) + 8] |= 1 << v20;
        v82 = (uint64_t *)(v100[6] + 16 * v20);
        *v82 = v11;
        v82[1] = v12;
        sub_22D87D920(&v102, (_OWORD *)(v100[7] + 32 * v20));
        v78 = v100;
        v83 = v100[2];
        v80 = __OFADD__(v83, 1);
        v81 = v83 + 1;
        if (v80)
          goto LABEL_69;
        goto LABEL_61;
      }
LABEL_3:
      v10 = (_OWORD *)(v76[7] + 32 * v20);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
      sub_22D87D920(&v102, v10);
LABEL_4:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    *(_QWORD *)&v103 = v11;
    *((_QWORD *)&v103 + 1) = v12;
    v104 = v13;
    LOBYTE(v105) = v14;
    v40 = sub_22D8B723C();
    if (v40 != 2)
    {
      v105 = MEMORY[0x24BEE1328];
      LOBYTE(v103) = v40 & 1;
      sub_22D87D920(&v103, &v102);
      v67 = v100;
      v68 = swift_isUniquelyReferenced_nonNull_native();
      v101 = v67;
      v20 = sub_22D8AF240(v11, v12);
      v70 = v67[2];
      v71 = (v69 & 1) == 0;
      v72 = v70 + v71;
      if (__OFADD__(v70, v71))
        goto LABEL_67;
      v73 = v69;
      if (v67[3] >= v72)
      {
        if ((v68 & 1) == 0)
          sub_22D8AF6A0();
      }
      else
      {
        sub_22D8AF33C(v72, v68);
        v74 = sub_22D8AF240(v11, v12);
        if ((v73 & 1) != (v75 & 1))
          goto LABEL_73;
        v20 = v74;
      }
      v76 = v101;
      v100 = v101;
      if ((v73 & 1) == 0)
      {
        v101[(v20 >> 6) + 8] |= 1 << v20;
        v90 = (uint64_t *)(v100[6] + 16 * v20);
        *v90 = v11;
        v90[1] = v12;
        sub_22D87D920(&v102, (_OWORD *)(v100[7] + 32 * v20));
        v78 = v100;
        v91 = v100[2];
        v80 = __OFADD__(v91, 1);
        v81 = v91 + 1;
        if (v80)
          goto LABEL_72;
        goto LABEL_61;
      }
      goto LABEL_3;
    }
    v99 = v8;
    *(_QWORD *)&v103 = v11;
    *((_QWORD *)&v103 + 1) = v12;
    v104 = v13;
    LOBYTE(v105) = v14;
    sub_22D8AFCC8();
    v50 = v95;
    v51 = v96;
    sub_22D8B7218();
    v52 = v97;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v97 + 56))(v50, 0, 1, v51);
    v53 = *(void (**)(char *, char *, uint64_t))(v52 + 32);
    v54 = v94;
    v53(v94, v50, v51);
    v55 = sub_22D8AC964(v54);
    v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B958);
    *(_QWORD *)&v103 = v55;
    sub_22D87D920(&v103, &v102);
    v56 = v100;
    v57 = swift_isUniquelyReferenced_nonNull_native();
    v101 = v56;
    v59 = sub_22D8AF240(v11, v12);
    v60 = v56[2];
    v61 = (v58 & 1) == 0;
    v62 = v60 + v61;
    if (__OFADD__(v60, v61))
      goto LABEL_65;
    v63 = v58;
    v64 = v51;
    if (v56[3] >= v62)
    {
      v8 = v99;
      if ((v57 & 1) == 0)
        sub_22D8AF6A0();
    }
    else
    {
      sub_22D8AF33C(v62, v57);
      v65 = sub_22D8AF240(v11, v12);
      v8 = v99;
      if ((v63 & 1) != (v66 & 1))
        goto LABEL_73;
      v59 = v65;
    }
    v100 = v101;
    if ((v63 & 1) != 0)
    {
      v84 = (_OWORD *)(v101[7] + 32 * v59);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v84);
      sub_22D87D920(&v102, v84);
    }
    else
    {
      v101[(v59 >> 6) + 8] |= 1 << v59;
      v85 = (uint64_t *)(v100[6] + 16 * v59);
      *v85 = v11;
      v85[1] = v12;
      sub_22D87D920(&v102, (_OWORD *)(v100[7] + 32 * v59));
      v86 = v100[2];
      v80 = __OFADD__(v86, 1);
      v87 = v86 + 1;
      if (v80)
        goto LABEL_70;
      v100[2] = v87;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v97 + 8))(v94, v64);
LABEL_5:
    v9 += 32;
    if (!--v8)
      goto LABEL_62;
  }
  v105 = MEMORY[0x24BEE1768];
  *(_QWORD *)&v103 = v15;
  sub_22D87D920(&v103, &v102);
  v17 = v100;
  v18 = swift_isUniquelyReferenced_nonNull_native();
  v101 = v17;
  v20 = sub_22D8AF240(v11, v12);
  v21 = v17[2];
  v22 = (v19 & 1) == 0;
  v23 = v21 + v22;
  if (!__OFADD__(v21, v22))
  {
    v24 = v19;
    if (v17[3] >= v23)
    {
      if ((v18 & 1) == 0)
        sub_22D8AF6A0();
    }
    else
    {
      sub_22D8AF33C(v23, v18);
      v25 = sub_22D8AF240(v11, v12);
      if ((v24 & 1) != (v26 & 1))
        goto LABEL_73;
      v20 = v25;
    }
    v76 = v101;
    v100 = v101;
    if ((v24 & 1) != 0)
      goto LABEL_3;
    v101[(v20 >> 6) + 8] |= 1 << v20;
    v77 = (uint64_t *)(v100[6] + 16 * v20);
    *v77 = v11;
    v77[1] = v12;
    sub_22D87D920(&v102, (_OWORD *)(v100[7] + 32 * v20));
    v78 = v100;
    v79 = v100[2];
    v80 = __OFADD__(v79, 1);
    v81 = v79 + 1;
    if (v80)
      goto LABEL_68;
LABEL_61:
    v78[2] = v81;
    swift_bridgeObjectRetain();
    goto LABEL_4;
  }
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
LABEL_66:
  __break(1u);
LABEL_67:
  __break(1u);
LABEL_68:
  __break(1u);
LABEL_69:
  __break(1u);
LABEL_70:
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  result = sub_22D8B7428();
  __break(1u);
  return result;
}

uint64_t SiriTimerSnippetModel.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  int *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  __int128 v25;
  char v26;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B658);
  v22 = *(_QWORD *)(v3 - 8);
  v23 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B660);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D8AFC84();
  sub_22D8B7464();
  LOBYTE(v25) = 0;
  v10 = v24;
  sub_22D8B72C0();
  if (v10)
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v24 = v5;
  v21 = v7;
  v25 = *(_OWORD *)(v1 + 16);
  v26 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B668);
  sub_22D8AFD48(&qword_255D9B670, &qword_255D9B668, MEMORY[0x24BEE0D08]);
  sub_22D8B72F0();
  v12 = (int *)type metadata accessor for SiriTimerSnippetModel(0);
  v25 = *(_OWORD *)(v1 + v12[8]);
  v26 = 3;
  sub_22D8B72F0();
  v13 = (uint64_t *)(v1 + v12[9]);
  v14 = *v13;
  LOBYTE(v13) = *((_BYTE *)v13 + 8);
  *(_QWORD *)&v25 = v14;
  BYTE8(v25) = (_BYTE)v13;
  v26 = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B678);
  sub_22D8AFD48(&qword_255D9B680, &qword_255D9B678, MEMORY[0x24BEE13D8]);
  sub_22D8B72F0();
  v15 = (uint64_t *)(v1 + v12[10]);
  v16 = *v15;
  LOBYTE(v15) = *((_BYTE *)v15 + 8);
  *(_QWORD *)&v25 = v16;
  BYTE8(v25) = (_BYTE)v15;
  v26 = 5;
  sub_22D8B72F0();
  v17 = (uint64_t *)(v1 + v12[11]);
  v18 = *v17;
  LOBYTE(v17) = *((_BYTE *)v17 + 8);
  *(_QWORD *)&v25 = v18;
  BYTE8(v25) = (_BYTE)v17;
  v26 = 6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AE88);
  sub_22D8AFD48(&qword_255D9B688, &qword_255D9AE88, MEMORY[0x24BEE1770]);
  sub_22D8B72F0();
  LOBYTE(v25) = 7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
  sub_22D8AFD9C();
  sub_22D8B72F0();
  v19 = *(_QWORD *)(v1 + 32);
  if (v19)
  {
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_22D8AFCC8();
    v20 = (uint64_t)v24;
    sub_22D8B7464();
    sub_22D8AD7E8(v20, v19);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v23);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v9, v6);
}

uint64_t sub_22D8AD7E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = a1;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B658);
  v27 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v26 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = a2 + 64;
  v6 = 1 << *(_BYTE *)(a2 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a2 + 64);
  v30 = (unint64_t)(v6 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  v29 = MEMORY[0x24BEE4AD8] + 8;
  while (v8)
  {
    v11 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v12 = v11 | (v10 << 6);
LABEL_23:
    v16 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v12);
    v17 = *v16;
    v18 = v16[1];
    if (*(_QWORD *)(a2 + 16))
    {
      swift_bridgeObjectRetain_n();
      v19 = sub_22D8AF240(v17, v18);
      if ((v20 & 1) != 0)
      {
        sub_22D875884(*(_QWORD *)(a2 + 56) + 32 * v19, (uint64_t)&v40);
      }
      else
      {
        v40 = 0u;
        v41 = 0u;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      v40 = 0u;
      v41 = 0u;
      swift_bridgeObjectRetain();
    }
    sub_22D88AE10((uint64_t)&v40, (uint64_t)&v36, &qword_255D9B0E8);
    if (v39)
    {
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_34;
      v36 = v17;
      v37 = v18;
      v38 = 0;
      LOBYTE(v39) = 1;
      sub_22D8B72C0();
      if (v2)
      {
        swift_bridgeObjectRelease();
LABEL_65:
        sub_22D8740E0((uint64_t)&v40, &qword_255D9B0E8);
        swift_bridgeObjectRelease();
        return swift_release();
      }
      sub_22D8740E0((uint64_t)&v40, &qword_255D9B0E8);
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
    }
    else
    {
      sub_22D8740E0((uint64_t)&v36, &qword_255D9B0E8);
LABEL_34:
      sub_22D88AE10((uint64_t)&v40, (uint64_t)&v36, &qword_255D9B0E8);
      if (v39)
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v36 = v17;
          v37 = v18;
          v38 = 0;
          LOBYTE(v39) = 1;
          sub_22D8B72E4();
          if (v2)
            goto LABEL_65;
          goto LABEL_5;
        }
      }
      else
      {
        sub_22D8740E0((uint64_t)&v36, &qword_255D9B0E8);
      }
      sub_22D88AE10((uint64_t)&v40, (uint64_t)&v36, &qword_255D9B0E8);
      if (v39)
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v36 = v17;
          v37 = v18;
          v38 = 0;
          LOBYTE(v39) = 1;
          sub_22D8B72D8();
          if (v2)
            goto LABEL_65;
          goto LABEL_5;
        }
      }
      else
      {
        sub_22D8740E0((uint64_t)&v36, &qword_255D9B0E8);
      }
      sub_22D88AE10((uint64_t)&v40, (uint64_t)&v36, &qword_255D9B0E8);
      if (!v39)
      {
        sub_22D8740E0((uint64_t)&v36, &qword_255D9B0E8);
        goto LABEL_48;
      }
      if ((swift_dynamicCast() & 1) != 0)
      {
        v36 = v17;
        v37 = v18;
        v38 = 0;
        LOBYTE(v39) = 1;
        sub_22D8B72CC();
        if (v2)
          goto LABEL_65;
LABEL_5:
        sub_22D8740E0((uint64_t)&v40, &qword_255D9B0E8);
        result = swift_bridgeObjectRelease();
      }
      else
      {
LABEL_48:
        sub_22D88AE10((uint64_t)&v40, (uint64_t)&v36, &qword_255D9B0E8);
        if (v39)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B958);
          if ((swift_dynamicCast() & 1) == 0)
            goto LABEL_53;
          v21 = v5;
          v28 = v32;
          v36 = v17;
          v37 = v18;
          v38 = 0;
          LOBYTE(v39) = 1;
          sub_22D8AFCC8();
          v22 = v26;
          v23 = v31;
          sub_22D8B72A8();
          swift_bridgeObjectRelease();
          sub_22D8AD7E8(v22, v28);
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v27 + 8))(v22, v23);
          result = sub_22D8740E0((uint64_t)&v40, &qword_255D9B0E8);
          if (v2)
            return swift_release();
          v5 = v21;
        }
        else
        {
          sub_22D8740E0((uint64_t)&v36, &qword_255D9B0E8);
LABEL_53:
          sub_22D88AE10((uint64_t)&v40, (uint64_t)&v36, &qword_255D9B0E8);
          if (!v39)
          {
            sub_22D8740E0((uint64_t)&v36, &qword_255D9B0E8);
            goto LABEL_58;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B950);
          if ((swift_dynamicCast() & 1) != 0)
          {
            v24 = v32;
            v32 = v17;
            v33 = v18;
            v34 = 0;
            v35 = 1;
            sub_22D8B729C();
            swift_bridgeObjectRelease();
            sub_22D8ADE98((uint64_t)&v36, v24);
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v36);
            result = sub_22D8740E0((uint64_t)&v40, &qword_255D9B0E8);
            if (v2)
              return swift_release();
          }
          else
          {
LABEL_58:
            v36 = v17;
            v37 = v18;
            v38 = 0;
            LOBYTE(v39) = 1;
            sub_22D8B72FC();
            sub_22D8740E0((uint64_t)&v40, &qword_255D9B0E8);
            result = swift_bridgeObjectRelease();
            if (v2)
              return swift_release();
          }
        }
      }
    }
  }
  if (__OFADD__(v10++, 1))
  {
    __break(1u);
    goto LABEL_68;
  }
  if (v10 >= v30)
    return swift_release();
  v14 = *(_QWORD *)(v5 + 8 * v10);
  if (v14)
  {
LABEL_22:
    v8 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v10 << 6);
    goto LABEL_23;
  }
  v15 = v10 + 1;
  if (v10 + 1 >= v30)
    return swift_release();
  v14 = *(_QWORD *)(v5 + 8 * v15);
  if (v14)
    goto LABEL_21;
  v15 = v10 + 2;
  if (v10 + 2 >= v30)
    return swift_release();
  v14 = *(_QWORD *)(v5 + 8 * v15);
  if (v14)
    goto LABEL_21;
  v15 = v10 + 3;
  if (v10 + 3 >= v30)
    return swift_release();
  v14 = *(_QWORD *)(v5 + 8 * v15);
  if (v14)
    goto LABEL_21;
  v15 = v10 + 4;
  if (v10 + 4 >= v30)
    return swift_release();
  v14 = *(_QWORD *)(v5 + 8 * v15);
  if (v14)
    goto LABEL_21;
  v15 = v10 + 5;
  if (v10 + 5 >= v30)
    return swift_release();
  v14 = *(_QWORD *)(v5 + 8 * v15);
  if (v14)
  {
LABEL_21:
    v10 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v10 >= v30)
      return swift_release();
    v14 = *(_QWORD *)(v5 + 8 * v10);
    ++v15;
    if (v14)
      goto LABEL_22;
  }
LABEL_68:
  __break(1u);
  return result;
}

uint64_t sub_22D8ADE98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t result;
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
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _BYTE v23[40];
  uint64_t v24;
  _BYTE v25[32];

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B658);
  result = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a2 + 16);
  if (!v11)
    return result;
  v20 = result;
  v21 = v10;
  v19 = v8;
  v12 = a2 + 32;
  v22 = a2;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_22D875884(v12, (uint64_t)v25);
    sub_22D875884((uint64_t)v25, (uint64_t)v23);
    if (!swift_dynamicCast())
      break;
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
    sub_22D8B73A4();
    if (v3)
    {
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
    swift_bridgeObjectRelease();
LABEL_5:
    v12 += 32;
    if (!--v11)
      return swift_bridgeObjectRelease();
  }
  sub_22D875884((uint64_t)v25, (uint64_t)v23);
  if (swift_dynamicCast())
  {
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
    v13 = v3;
    sub_22D8B73C8();
    goto LABEL_4;
  }
  sub_22D875884((uint64_t)v25, (uint64_t)v23);
  if (swift_dynamicCast())
  {
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
    v13 = v3;
    sub_22D8B73BC();
    goto LABEL_4;
  }
  sub_22D875884((uint64_t)v25, (uint64_t)v23);
  if (swift_dynamicCast())
  {
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
    v13 = v3;
    sub_22D8B73B0();
LABEL_4:
    v3 = v13;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
    if (v13)
      return swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  sub_22D875884((uint64_t)v25, (uint64_t)v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B958);
  if (swift_dynamicCast())
  {
    v14 = v24;
    v15 = *(_QWORD *)(a1 + 24);
    v18 = *(_QWORD *)(a1 + 32);
    __swift_mutable_project_boxed_opaque_existential_1(a1, v15);
    sub_22D8AFCC8();
    v16 = v21;
    sub_22D8B738C();
    sub_22D8AD7E8(v16, v14);
    if (v3)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v20);
      goto LABEL_23;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v16, v20);
    goto LABEL_21;
  }
  sub_22D875884((uint64_t)v25, (uint64_t)v23);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B950);
  if (!swift_dynamicCast())
  {
    __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
    sub_22D8B73D4();
    if (v3)
      goto LABEL_23;
    goto LABEL_21;
  }
  v17 = v24;
  __swift_mutable_project_boxed_opaque_existential_1(a1, *(_QWORD *)(a1 + 24));
  sub_22D8B7398();
  sub_22D8ADE98(v23, v17);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v23);
LABEL_21:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
    goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v23);
LABEL_23:
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
  return swift_bridgeObjectRelease();
}

_QWORD *sub_22D8AE2E0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  char v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  __int128 v26;
  uint64_t v27;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B630);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B638);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if ((sub_22D8B7374() & 1) == 0)
  {
    v25 = v8;
    v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a1, a1[3]);
      v11 = sub_22D8B7344();
      if (v12)
      {
        v27 = MEMORY[0x24BEE0D00];
        *(_QWORD *)&v26 = v11;
        *((_QWORD *)&v26 + 1) = v12;
      }
      else
      {
        __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a1, a1[3]);
        v13 = sub_22D8B7368();
        if ((v14 & 1) == 0)
        {
          v15 = MEMORY[0x24BEE1768];
LABEL_14:
          v27 = v15;
          *(_QWORD *)&v26 = v13;
          goto LABEL_22;
        }
        __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a1, a1[3]);
        v13 = sub_22D8B735C();
        if ((v16 & 1) == 0)
        {
          v15 = MEMORY[0x24BEE13C8];
          goto LABEL_14;
        }
        __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a1, a1[3]);
        v17 = sub_22D8B7350();
        if (v17 == 2)
        {
          __swift_mutable_project_boxed_opaque_existential_1((uint64_t)a1, a1[3]);
          sub_22D8AFCC8();
          sub_22D8B732C();
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
          v18 = v25;
          (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v25, v4, v5);
          v19 = sub_22D8AC964(v18);
          v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B958);
          *(_QWORD *)&v26 = v19;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v9 = sub_22D8841D0(0, v9[2] + 1, 1, v9);
          v21 = v9[2];
          v20 = v9[3];
          if (v21 >= v20 >> 1)
            v9 = sub_22D8841D0((_QWORD *)(v20 > 1), v21 + 1, 1, v9);
          v9[2] = v21 + 1;
          sub_22D87D920(&v26, &v9[4 * v21 + 4]);
          (*(void (**)(char *, uint64_t))(v6 + 8))(v18, v5);
          goto LABEL_5;
        }
        v27 = MEMORY[0x24BEE1328];
        LOBYTE(v26) = v17 & 1;
      }
LABEL_22:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v9 = sub_22D8841D0(0, v9[2] + 1, 1, v9);
      v23 = v9[2];
      v22 = v9[3];
      if (v23 >= v22 >> 1)
        v9 = sub_22D8841D0((_QWORD *)(v22 > 1), v23 + 1, 1, v9);
      v9[2] = v23 + 1;
      sub_22D87D920(&v26, &v9[4 * v23 + 4]);
LABEL_5:
      __swift_project_boxed_opaque_existential_1(a1, a1[3]);
      if ((sub_22D8B7374() & 1) != 0)
        return v9;
    }
  }
  return (_QWORD *)MEMORY[0x24BEE4AF8];
}

uint64_t sub_22D8AE848(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22D8AE880 + 4 * byte_22D8B9720[a1]))(0xD000000000000013, 0x800000022D8BEC10);
}

uint64_t sub_22D8AE880()
{
  return 0x65644972656D6974;
}

uint64_t sub_22D8AE8A4(uint64_t a1)
{
  return a1 + 4;
}

uint64_t sub_22D8AE8BC()
{
  return 0x6C6562616CLL;
}

uint64_t sub_22D8AE8D0()
{
  return 0x6E6F697461727564;
}

uint64_t sub_22D8AE8E8()
{
  return 0x6E696E69616D6572;
}

uint64_t sub_22D8AE90C()
{
  return 0x6574617473;
}

uint64_t sub_22D8AE920()
{
  return 0x74756F68636E7570;
}

uint64_t sub_22D8AE940()
{
  unsigned __int8 *v0;

  return sub_22D8AE848(*v0);
}

uint64_t sub_22D8AE948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22D8B1DA0(a1, a2);
  *a3 = result;
  return result;
}

void sub_22D8AE96C(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_22D8AE978()
{
  sub_22D8AFC84();
  return sub_22D8B7470();
}

uint64_t sub_22D8AE9A0()
{
  sub_22D8AFC84();
  return sub_22D8B747C();
}

uint64_t sub_22D8AE9C8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return SiriTimerSnippetModel.init(from:)(a1, a2);
}

uint64_t sub_22D8AE9DC(_QWORD *a1)
{
  return SiriTimerSnippetModel.encode(to:)(a1);
}

uint64_t sub_22D8AE9F0()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22D8AEA1C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(_QWORD *)(a3 + 16) = 0;
  *(_BYTE *)(a3 + 24) = 1;
  return result;
}

uint64_t sub_22D8AEA30()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_22D8AEA3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;

  result = sub_22D8B7314();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = a1;
  *(_BYTE *)(a2 + 24) = 0;
  return result;
}

uint64_t sub_22D8AEA94()
{
  sub_22D8AFCC8();
  return sub_22D8B7470();
}

uint64_t sub_22D8AEABC()
{
  sub_22D8AFCC8();
  return sub_22D8B747C();
}

uint64_t TimerSelectorModel.timers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TimerSelectorModel.timers.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*TimerSelectorModel.timers.modify())()
{
  return nullsub_1;
}

uint64_t property wrapper backing initializer of TimerSelectorModel.header()
{
  return sub_22D8B5D48();
}

uint64_t TimerSelectorModel.header.getter()
{
  uint64_t v1;

  type metadata accessor for TimerSelectorModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  sub_22D8B5D60();
  return v1;
}

uint64_t TimerSelectorModel.header.setter()
{
  type metadata accessor for TimerSelectorModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  return sub_22D8B5D6C();
}

void (*TimerSelectorModel.header.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  type metadata accessor for TimerSelectorModel(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  v2[4] = sub_22D8B5D54();
  return sub_22D88BD44;
}

uint64_t TimerSelectorModel.init(timers:header:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = a1;
  type metadata accessor for TimerSelectorModel(0);
  return sub_22D8B5D48();
}

uint64_t sub_22D8AECA8(char a1)
{
  if ((a1 & 1) != 0)
    return 0x726564616568;
  else
    return 0x7372656D6974;
}

uint64_t sub_22D8AECD0()
{
  char *v0;

  return sub_22D8AECA8(*v0);
}

uint64_t sub_22D8AECD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_22D8B20E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_22D8AECFC()
{
  sub_22D8AFE18();
  return sub_22D8B7470();
}

uint64_t sub_22D8AED24()
{
  sub_22D8AFE18();
  return sub_22D8B747C();
}

uint64_t TimerSelectorModel.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[8];
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B698);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D8AFE18();
  sub_22D8B7464();
  v11 = *v3;
  v10[7] = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B618);
  sub_22D8AFE5C(&qword_255D9B620, &qword_255D9B628, (uint64_t)&protocol conformance descriptor for SiriTimerSnippetModel, MEMORY[0x24BEE12A0]);
  sub_22D8B72F0();
  if (!v2)
  {
    type metadata accessor for TimerSelectorModel(0);
    v10[6] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
    sub_22D88CB58(&qword_255D9AA48, MEMORY[0x24BEAD370]);
    sub_22D8B72F0();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t TimerSelectorModel.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
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
  char *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _QWORD *v23;
  char v24;
  char v25;
  uint64_t v26;

  v19 = a2;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  v18 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B6A8);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TimerSelectorModel(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D8AFE18();
  v21 = v7;
  v11 = (uint64_t)v23;
  sub_22D8B7458();
  if (v11)
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  v12 = v5;
  v23 = a1;
  v13 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B618);
  v25 = 0;
  sub_22D8AFE5C(&qword_255D9B6B0, &qword_255D9B6B8, (uint64_t)"YN\n\"8k", MEMORY[0x24BEE12D0]);
  v14 = v22;
  v15 = v21;
  sub_22D8B7278();
  v17 = v26;
  *(_QWORD *)v10 = v26;
  v24 = 1;
  sub_22D88CB58(&qword_255D9AA80, MEMORY[0x24BEAD380]);
  sub_22D8B7278();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v14);
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(&v10[*(int *)(v8 + 20)], v4, v13);
  sub_22D88CC60((uint64_t)v10, v19, type metadata accessor for TimerSelectorModel);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v23);
  return sub_22D8AFD0C((uint64_t)v10, type metadata accessor for TimerSelectorModel);
}

uint64_t sub_22D8AF17C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TimerSelectorModel.init(from:)(a1, a2);
}

uint64_t sub_22D8AF190(_QWORD *a1)
{
  return TimerSelectorModel.encode(to:)(a1);
}

unint64_t sub_22D8AF1A8(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_22D8B6A50();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BE94110];
  sub_22D879430(&qword_255D9B970, (uint64_t (*)(uint64_t))MEMORY[0x24BE94110], MEMORY[0x24BE94120]);
  v3 = sub_22D8B6DEC();
  return sub_22D87D710(a1, v3, v2, &qword_255D9B978, MEMORY[0x24BE94128]);
}

unint64_t sub_22D8AF240(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_22D8B7434();
  sub_22D8B6E4C();
  v4 = sub_22D8B744C();
  return sub_22D87D840(a1, a2, v4);
}

unint64_t sub_22D8AF2A4(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_22D8B5C40();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  sub_22D879430(&qword_255D9B0F8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v3 = sub_22D8B6DEC();
  return sub_22D87D710(a1, v3, v2, &qword_255D9B118, MEMORY[0x24BDCEA98]);
}

uint64_t sub_22D8AF33C(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A9B8);
  v6 = sub_22D8B71DC();
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
        sub_22D87D920(v24, v35);
      }
      else
      {
        sub_22D875884((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_22D8B7434();
      sub_22D8B6E4C();
      result = sub_22D8B744C();
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
      result = (uint64_t)sub_22D87D920(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

_OWORD *sub_22D8AF638(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_22D87D920(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_22D8AF6A0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A9B8);
  v2 = *v0;
  v3 = sub_22D8B71D0();
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
    sub_22D875884(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_22D87D920(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

_OWORD *sub_22D8AF884@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, _OWORD *a5@<X8>)
{
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _OWORD *result;
  unint64_t v22;
  char v23;

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v14 = sub_22D8AF240(a2, a3);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a4 & 1) != 0)
    {
LABEL_7:
      v20 = *v6;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        sub_22D87D920((_OWORD *)(v20[7] + 32 * v14), a5);
        return sub_22D87D920(a1, (_OWORD *)(v20[7] + 32 * v14));
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a4 & 1) == 0)
    {
      sub_22D8AF6A0();
      goto LABEL_7;
    }
    sub_22D8AF33C(v17, a4 & 1);
    v22 = sub_22D8AF240(a2, a3);
    if ((v18 & 1) == (v23 & 1))
    {
      v14 = v22;
      v20 = *v6;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_22D8AF638(v14, a2, a3, a1, v20);
      *a5 = 0u;
      a5[1] = 0u;
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_22D8B7428();
  __break(1u);
  return result;
}

uint64_t sub_22D8AF9D8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6C754D72656D6974 && a2 == 0xEA00000000006974;
  if (v3 || (sub_22D8B73F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C655372656D6974 && a2 == 0xED0000726F746365)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_22D8B73F8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

_QWORD *sub_22D8AFAE0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B968);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22D8AFC2C();
  sub_22D8B7458();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B618);
    sub_22D8AFE5C(&qword_255D9B6B0, &qword_255D9B6B8, (uint64_t)"YN\n\"8k", MEMORY[0x24BEE12D0]);
    sub_22D8B7278();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (_QWORD *)v9[1];
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_22D8AFC2C()
{
  unint64_t result;

  result = qword_255D9B610;
  if (!qword_255D9B610)
  {
    result = MEMORY[0x22E31A408]("YG\n\"dd", &type metadata for TimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B610);
  }
  return result;
}

uint64_t type metadata accessor for SiriTimerSnippetModel(uint64_t a1)
{
  return sub_22D88B330(a1, qword_255D9B7D0);
}

unint64_t sub_22D8AFC84()
{
  unint64_t result;

  result = qword_255D9B648;
  if (!qword_255D9B648)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9F98, &type metadata for SiriTimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B648);
  }
  return result;
}

unint64_t sub_22D8AFCC8()
{
  unint64_t result;

  result = qword_255D9B650;
  if (!qword_255D9B650)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9F48, &type metadata for JSONCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B650);
  }
  return result;
}

uint64_t sub_22D8AFD0C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22D8AFD48(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3;
    result = MEMORY[0x22E31A408](MEMORY[0x24BEE4AA8], v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22D8AFD9C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_255D9B690;
  if (!qword_255D9B690)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D9B300);
    v2 = sub_22D879430(&qword_255D9AA68, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAE0]);
    result = MEMORY[0x22E31A408](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_255D9B690);
  }
  return result;
}

unint64_t sub_22D8AFE18()
{
  unint64_t result;

  result = qword_255D9B6A0;
  if (!qword_255D9B6A0)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9EF8, &type metadata for TimerSelectorModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B6A0);
  }
  return result;
}

uint64_t sub_22D8AFE5C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D9B618);
    v10 = sub_22D879430(a2, type metadata accessor for SiriTimerSnippetModel, a3);
    result = MEMORY[0x22E31A408](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22D8AFEE0()
{
  return sub_22D879430(&qword_255D9B6C0, type metadata accessor for SiriTimePluginModel, (uint64_t)&protocol conformance descriptor for SiriTimePluginModel);
}

uint64_t sub_22D8AFF0C()
{
  return sub_22D879430(&qword_255D9B6C8, type metadata accessor for SiriTimePluginModel, (uint64_t)&protocol conformance descriptor for SiriTimePluginModel);
}

uint64_t sub_22D8AFF40()
{
  return sub_22D879430(&qword_255D9B5F8, type metadata accessor for TimerSelectorModel, (uint64_t)&protocol conformance descriptor for TimerSelectorModel);
}

uint64_t sub_22D8AFF6C()
{
  return sub_22D879430(&qword_255D9B5C8, type metadata accessor for TimerSelectorModel, (uint64_t)&protocol conformance descriptor for TimerSelectorModel);
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriTimePluginModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    if (EnumCaseMultiPayload == 1)
    {
      v7 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      swift_bridgeObjectRetain();
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for SiriTimePluginModel(uint64_t a1)
{
  int EnumCaseMultiPayload;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  result = swift_bridgeObjectRelease();
  if (EnumCaseMultiPayload == 1)
  {
    v4 = a1 + *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return result;
}

_QWORD *initializeWithCopy for SiriTimePluginModel(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  *a1 = *a2;
  if (EnumCaseMultiPayload == 1)
  {
    v5 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    swift_bridgeObjectRetain();
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_QWORD *assignWithCopy for SiriTimePluginModel(_QWORD *a1, _QWORD *a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_22D8AFD0C((uint64_t)a1, type metadata accessor for SiriTimePluginModel);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    *a1 = *a2;
    if (EnumCaseMultiPayload == 1)
    {
      v5 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
      v6 = (char *)a1 + v5;
      v7 = (char *)a2 + v5;
      swift_bridgeObjectRetain();
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
    }
    else
    {
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_QWORD *initializeWithTake for SiriTimePluginModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    *a1 = *a2;
    v6 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_QWORD *assignWithTake for SiriTimePluginModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_22D8AFD0C((uint64_t)a1, type metadata accessor for SiriTimePluginModel);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      *a1 = *a2;
      v6 = *(int *)(type metadata accessor for TimerSelectorModel(0) + 20);
      v7 = (char *)a1 + v6;
      v8 = (char *)a2 + v6;
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTimePluginModel(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for SiriTimePluginModel(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_22D8B03F8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_22D8B0408()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for TimerSelectorModel(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TimerSnippetModel()
{
  return &type metadata for TimerSnippetModel;
}

uint64_t *initializeBufferWithCopyOfBuffer for SiriTimerSnippetModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  char *__dst;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a3[7];
    __dst = (char *)a1 + v9;
    v10 = (char *)a2 + v9;
    a1[4] = a2[4];
    v11 = sub_22D8B5BA4();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
      memcpy(__dst, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(__dst, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(__dst, 0, 1, v11);
    }
    v16 = a3[8];
    v17 = a3[9];
    v18 = (uint64_t *)((char *)v4 + v16);
    v19 = (uint64_t *)((char *)a2 + v16);
    v20 = v19[1];
    *v18 = *v19;
    v18[1] = v20;
    v21 = (char *)v4 + v17;
    v22 = (char *)a2 + v17;
    *(_QWORD *)v21 = *(_QWORD *)v22;
    v21[8] = v22[8];
    v23 = a3[10];
    v24 = a3[11];
    v25 = (char *)v4 + v23;
    v26 = (char *)a2 + v23;
    *(_QWORD *)v25 = *(_QWORD *)v26;
    v25[8] = v26[8];
    v27 = (char *)v4 + v24;
    v28 = (char *)a2 + v24;
    *(_QWORD *)v27 = *(_QWORD *)v28;
    v27[8] = v28[8];
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for SiriTimerSnippetModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_22D8B5BA4();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SiriTimerSnippetModel(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  char *__dst;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  a1[4] = a2[4];
  v8 = a3[7];
  __dst = (char *)a1 + v8;
  v9 = (char *)a2 + v8;
  v10 = sub_22D8B5BA4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
    memcpy(__dst, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(__dst, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(__dst, 0, 1, v10);
  }
  v14 = a3[8];
  v15 = a3[9];
  v16 = (_QWORD *)((char *)a1 + v14);
  v17 = (_QWORD *)((char *)a2 + v14);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  v19 = (char *)a1 + v15;
  v20 = (char *)a2 + v15;
  *(_QWORD *)v19 = *(_QWORD *)v20;
  v19[8] = v20[8];
  v21 = a3[10];
  v22 = a3[11];
  v23 = (char *)a1 + v21;
  v24 = (char *)a2 + v21;
  *(_QWORD *)v23 = *(_QWORD *)v24;
  v23[8] = v24[8];
  v25 = (char *)a1 + v22;
  v26 = (char *)a2 + v22;
  *(_QWORD *)v25 = *(_QWORD *)v26;
  v25[8] = v26[8];
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SiriTimerSnippetModel(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;

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
  v6 = a3[7];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_22D8B5BA4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  v15 = a3[8];
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = a3[9];
  v19 = (char *)a1 + v18;
  v20 = (char *)a2 + v18;
  v21 = *(_QWORD *)v20;
  v19[8] = v20[8];
  *(_QWORD *)v19 = v21;
  v22 = a3[10];
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  LOBYTE(v21) = v24[8];
  *(_QWORD *)v23 = *(_QWORD *)v24;
  v23[8] = v21;
  v25 = a3[11];
  v26 = (char *)a1 + v25;
  v27 = (char *)a2 + v25;
  v28 = *(_QWORD *)v27;
  v26[8] = v27[8];
  *(_QWORD *)v26 = v28;
  return a1;
}

uint64_t initializeWithTake for SiriTimerSnippetModel(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  void *v8;
  const void *v9;
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

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v7 = a3[7];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_22D8B5BA4();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  v14 = a1 + v13;
  v15 = a2 + v13;
  *(_BYTE *)(v14 + 8) = *(_BYTE *)(v15 + 8);
  *(_QWORD *)v14 = *(_QWORD *)v15;
  v16 = a3[10];
  v17 = a3[11];
  v18 = a1 + v16;
  v19 = a2 + v16;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  *(_QWORD *)v18 = *(_QWORD *)v19;
  v20 = a1 + v17;
  v21 = a2 + v17;
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *(_BYTE *)(v20 + 8) = *(_BYTE *)(v21 + 8);
  return a1;
}

_QWORD *assignWithTake for SiriTimerSnippetModel(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  v8 = a3[7];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_22D8B5BA4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v9, v10, v11);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v12 + 8))(v9, v11);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  v17 = a3[8];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  v22 = a3[9];
  v23 = a3[10];
  v24 = (char *)a1 + v22;
  v25 = (char *)a2 + v22;
  *(_QWORD *)v24 = *(_QWORD *)v25;
  v24[8] = v25[8];
  v26 = (char *)a1 + v23;
  v27 = (char *)a2 + v23;
  *(_QWORD *)v26 = *(_QWORD *)v27;
  v26[8] = v27[8];
  v28 = a3[11];
  v29 = (char *)a1 + v28;
  v30 = (char *)a2 + v28;
  *(_QWORD *)v29 = *(_QWORD *)v30;
  v29[8] = v30[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for SiriTimerSnippetModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22D8B0CF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for SiriTimerSnippetModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22D8B0D84(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B300);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

void sub_22D8B0DFC()
{
  unint64_t v0;

  sub_22D8B0E94();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_22D8B0E94()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255D9ABA0)
  {
    sub_22D8B5BA4();
    v0 = sub_22D8B702C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255D9ABA0);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for TimerSelectorModel(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    swift_bridgeObjectRetain();
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  }
  return a1;
}

uint64_t destroy for TimerSelectorModel(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for TimerSelectorModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  swift_bridgeObjectRetain();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithCopy for TimerSelectorModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_QWORD *initializeWithTake for TimerSelectorModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for TimerSelectorModel(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for TimerSelectorModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22D8B1174(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for TimerSelectorModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_22D8B1200(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9AA20);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

void sub_22D8B1278()
{
  unint64_t v0;

  sub_22D88E40C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

ValueMetadata *type metadata accessor for TimerSelectorModel.CodingKeys()
{
  return &type metadata for TimerSelectorModel.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SiriTimerSnippetModel.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SiriTimerSnippetModel.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D8B13E4 + 4 * byte_22D8B972D[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_22D8B1418 + 4 * byte_22D8B9728[v4]))();
}

uint64_t sub_22D8B1418(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8B1420(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D8B1428);
  return result;
}

uint64_t sub_22D8B1434(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D8B143CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_22D8B1440(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8B1448(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriTimerSnippetModel.CodingKeys()
{
  return &type metadata for SiriTimerSnippetModel.CodingKeys;
}

uint64_t destroy for JSONCodingKeys()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for JSONCodingKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for JSONCodingKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithTake for JSONCodingKeys(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for JSONCodingKeys(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 25))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for JSONCodingKeys(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
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
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for JSONCodingKeys()
{
  return &type metadata for JSONCodingKeys;
}

ValueMetadata *type metadata accessor for TimerSnippetModel.CodingKeys()
{
  return &type metadata for TimerSnippetModel.CodingKeys;
}

uint64_t _s16SiriTimeInternal18TimerSelectorModelV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D8B1644 + 4 * byte_22D8B9737[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22D8B1678 + 4 * byte_22D8B9732[v4]))();
}

uint64_t sub_22D8B1678(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8B1680(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D8B1688);
  return result;
}

uint64_t sub_22D8B1694(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D8B169CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22D8B16A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8B16A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SiriTimePluginModel.CodingKeys()
{
  return &type metadata for SiriTimePluginModel.CodingKeys;
}

ValueMetadata *type metadata accessor for SiriTimePluginModel.TimerMultiCodingKeys()
{
  return &type metadata for SiriTimePluginModel.TimerMultiCodingKeys;
}

uint64_t _s16SiriTimeInternal17TimerSnippetModelV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22D8B1714 + 4 * byte_22D8B973C[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22D8B1734 + 4 * byte_22D8B9741[v4]))();
}

_BYTE *sub_22D8B1714(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22D8B1734(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22D8B173C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22D8B1744(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22D8B174C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22D8B1754(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SiriTimePluginModel.TimerSelectorCodingKeys()
{
  return &type metadata for SiriTimePluginModel.TimerSelectorCodingKeys;
}

unint64_t sub_22D8B1774()
{
  unint64_t result;

  result = qword_255D9B8B0;
  if (!qword_255D9B8B0)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9AE8, &type metadata for SiriTimePluginModel.TimerSelectorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B8B0);
  }
  return result;
}

unint64_t sub_22D8B17BC()
{
  unint64_t result;

  result = qword_255D9B8B8;
  if (!qword_255D9B8B8)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9BA0, &type metadata for SiriTimePluginModel.TimerMultiCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B8B8);
  }
  return result;
}

unint64_t sub_22D8B1804()
{
  unint64_t result;

  result = qword_255D9B8C0;
  if (!qword_255D9B8C0)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9C58, &type metadata for SiriTimePluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B8C0);
  }
  return result;
}

unint64_t sub_22D8B184C()
{
  unint64_t result;

  result = qword_255D9B8C8;
  if (!qword_255D9B8C8)
  {
    result = MEMORY[0x22E31A408]("!J\n\"<g", &type metadata for TimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B8C8);
  }
  return result;
}

unint64_t sub_22D8B1894()
{
  unint64_t result;

  result = qword_255D9B8D0;
  if (!qword_255D9B8D0)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9E18, &type metadata for SiriTimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B8D0);
  }
  return result;
}

unint64_t sub_22D8B18DC()
{
  unint64_t result;

  result = qword_255D9B8D8;
  if (!qword_255D9B8D8)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9ED0, &type metadata for TimerSelectorModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B8D8);
  }
  return result;
}

unint64_t sub_22D8B1924()
{
  unint64_t result;

  result = qword_255D9B8E0;
  if (!qword_255D9B8E0)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9E40, &type metadata for TimerSelectorModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B8E0);
  }
  return result;
}

unint64_t sub_22D8B196C()
{
  unint64_t result;

  result = qword_255D9B8E8;
  if (!qword_255D9B8E8)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9E68, &type metadata for TimerSelectorModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B8E8);
  }
  return result;
}

unint64_t sub_22D8B19B4()
{
  unint64_t result;

  result = qword_255D9B8F0;
  if (!qword_255D9B8F0)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9D38, &type metadata for JSONCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B8F0);
  }
  return result;
}

unint64_t sub_22D8B19FC()
{
  unint64_t result;

  result = qword_255D9B8F8;
  if (!qword_255D9B8F8)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9D60, &type metadata for JSONCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B8F8);
  }
  return result;
}

unint64_t sub_22D8B1A44()
{
  unint64_t result;

  result = qword_255D9B900;
  if (!qword_255D9B900)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9D88, &type metadata for SiriTimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B900);
  }
  return result;
}

unint64_t sub_22D8B1A8C()
{
  unint64_t result;

  result = qword_255D9B908;
  if (!qword_255D9B908)
  {
    result = MEMORY[0x22E31A408]("II\n\"\\f", &type metadata for SiriTimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B908);
  }
  return result;
}

unint64_t sub_22D8B1AD4()
{
  unint64_t result;

  result = qword_255D9B910;
  if (!qword_255D9B910)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9C80, &type metadata for TimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B910);
  }
  return result;
}

unint64_t sub_22D8B1B1C()
{
  unint64_t result;

  result = qword_255D9B918;
  if (!qword_255D9B918)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9CA8, &type metadata for TimerSnippetModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B918);
  }
  return result;
}

unint64_t sub_22D8B1B64()
{
  unint64_t result;

  result = qword_255D9B920;
  if (!qword_255D9B920)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9B10, &type metadata for SiriTimePluginModel.TimerMultiCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B920);
  }
  return result;
}

unint64_t sub_22D8B1BAC()
{
  unint64_t result;

  result = qword_255D9B928;
  if (!qword_255D9B928)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9B38, &type metadata for SiriTimePluginModel.TimerMultiCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B928);
  }
  return result;
}

unint64_t sub_22D8B1BF4()
{
  unint64_t result;

  result = qword_255D9B930;
  if (!qword_255D9B930)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9A58, &type metadata for SiriTimePluginModel.TimerSelectorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B930);
  }
  return result;
}

unint64_t sub_22D8B1C3C()
{
  unint64_t result;

  result = qword_255D9B938;
  if (!qword_255D9B938)
  {
    result = MEMORY[0x22E31A408]("yL\n\"8j", &type metadata for SiriTimePluginModel.TimerSelectorCodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B938);
  }
  return result;
}

unint64_t sub_22D8B1C84()
{
  unint64_t result;

  result = qword_255D9B940;
  if (!qword_255D9B940)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9BC8, &type metadata for SiriTimePluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B940);
  }
  return result;
}

unint64_t sub_22D8B1CCC()
{
  unint64_t result;

  result = qword_255D9B948;
  if (!qword_255D9B948)
  {
    result = MEMORY[0x22E31A408](&unk_22D8B9BF0, &type metadata for SiriTimePluginModel.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_255D9B948);
  }
  return result;
}

uint64_t sub_22D8B1D10(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x7372656D6974 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_22D8B73F8();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_22D8B1D8C()
{
  return 0x7372656D6974;
}

uint64_t sub_22D8B1DA0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x65644972656D6974 && a2 == 0xEF7265696669746ELL;
  if (v3 || (sub_22D8B73F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x800000022D8BEC10 || (sub_22D8B73F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000022D8BEC30 || (sub_22D8B73F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C6562616CLL && a2 == 0xE500000000000000 || (sub_22D8B73F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6E6F697461727564 && a2 == 0xE800000000000000 || (sub_22D8B73F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6E696E69616D6572 && a2 == 0xED0000656D695467 || (sub_22D8B73F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6574617473 && a2 == 0xE500000000000000 || (sub_22D8B73F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x74756F68636E7570 && a2 == 0xEB000000004C5255)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v6 = sub_22D8B73F8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t sub_22D8B20E4(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x7372656D6974 && a2 == 0xE600000000000000;
  if (v3 || (sub_22D8B73F8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726564616568 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_22D8B73F8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
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

uint64_t sub_22D8B21E4()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 40))
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_22D8B2220()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9B980);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9B980);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t UnsupportedAppNotInstalledFlow.init(domain:patternExecutor:legacyBuilder:)@<X0>(char a1@<W0>, __int128 *a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  sub_22D874D04(a2, a4);
  *(_BYTE *)(a4 + 40) = a1;
  return sub_22D874D04(a3, a4 + 48);
}

uint64_t UnsupportedAppNotInstalledFlow.on(input:)()
{
  return 1;
}

uint64_t UnsupportedAppNotInstalledFlow.execute(completion:)()
{
  sub_22D8B233C();
  return sub_22D8B5DFC();
}

unint64_t sub_22D8B233C()
{
  unint64_t result;

  result = qword_255D9B998;
  if (!qword_255D9B998)
  {
    result = MEMORY[0x22E31A408](&protocol conformance descriptor for UnsupportedAppNotInstalledFlow, &type metadata for UnsupportedAppNotInstalledFlow);
    atomic_store(result, (unint64_t *)&qword_255D9B998);
  }
  return result;
}

uint64_t UnsupportedAppNotInstalledFlow.execute()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2[14] = a1;
  v2[15] = v1;
  v3 = sub_22D8B6114();
  v2[16] = v3;
  v2[17] = *(_QWORD *)(v3 - 8);
  v2[18] = swift_task_alloc();
  v4 = sub_22D8B5FDC();
  v2[19] = v4;
  v2[20] = *(_QWORD *)(v4 - 8);
  v2[21] = swift_task_alloc();
  v5 = sub_22D8B5C40();
  v2[22] = v5;
  v2[23] = *(_QWORD *)(v5 - 8);
  v2[24] = swift_task_alloc();
  v6 = sub_22D8B6D80();
  v2[25] = v6;
  v2[26] = *(_QWORD *)(v6 - 8);
  v2[27] = swift_task_alloc();
  v2[28] = type metadata accessor for SiriTimeMeasurement();
  v2[29] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B318);
  v2[30] = swift_task_alloc();
  v7 = sub_22D8B5F34();
  v2[31] = v7;
  v2[32] = *(_QWORD *)(v7 - 8);
  v2[33] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22D8B24C8()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t);
  uint64_t (*v38)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t);

  if (qword_255D9A3C8 != -1)
    swift_once();
  v1 = __swift_project_value_buffer(v0[25], (uint64_t)qword_255D9B980);
  v0[34] = v1;
  v2 = sub_22D8B6D68();
  v3 = sub_22D8B6FC0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_22D86F000, v2, v3, "In UnsupportedClockAppNotInstalledFlow.execute()", v4, 2u);
    MEMORY[0x22E31A4BC](v4, -1, -1);
  }
  v5 = v0[15];

  v6 = *(unsigned __int8 *)(v5 + 40);
  sub_22D8B5F10();
  if (qword_255D9AC30)
  {
    v7 = qword_255D9AC30;
  }
  else
  {
    type metadata accessor for ApplicationContext();
    v7 = swift_allocObject();
    sub_22D8B61B0();
    qword_255D9AC30 = v7;
    swift_retain();
    swift_release();
  }
  v8 = v0[30];
  sub_22D8B6B7C();
  sub_22D87832C(v7 + 16, (uint64_t)(v0 + 2));
  swift_retain();
  swift_release();
  v9 = sub_22D8B6B70();
  v0[35] = v9;
  v10 = AppInstallUtil.isAppInstalled.getter(v6);
  AppInstallUtil.appStorePunchout(installOnly:)((v10 & 1) == 0, v6, v8);
  if ((_s16SiriTimeInternal0aB16FeatureFlagsImplV39isConfirmationsResponseFrameworkEnabledSbyF_0() & 1) != 0)
  {
    v11 = v0[29];
    v36 = v0[30];
    v12 = v0[27];
    v13 = (int *)v0[28];
    v14 = v0[25];
    v15 = v0[24];
    v30 = v0[23];
    v31 = v0[22];
    v33 = v0[26];
    v34 = v0[15];
    v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16);
    v16(v12, v1, v14);
    v32 = mach_absolute_time();
    *(_OWORD *)(v11 + v13[7]) = xmmword_22D8B7E40;
    *(_QWORD *)(v11 + v13[8]) = 0x7FEFFFFFFFFFFFFFLL;
    v35 = v9;
    v17 = v13[9];
    sub_22D8B5C34();
    v18 = objc_allocWithZone(MEMORY[0x24BE95C78]);
    v19 = (void *)sub_22D8B5C1C();
    v20 = objc_msgSend(v18, sel_initWithNSUUID_, v19);

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v15, v31);
    *(_QWORD *)(v11 + v17) = v20;
    *(_BYTE *)(v11 + 8) = 30;
    v16(v11 + v13[6], v12, v14);
    *(_QWORD *)v11 = v32;
    sub_22D8A9578();
    (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v12, v14);
    sub_22D87832C(v34, (uint64_t)(v0 + 7));
    v21 = v0[10];
    v22 = v0[11];
    __swift_project_boxed_opaque_existential_1(v0 + 7, v21);
    v23 = swift_task_alloc();
    v0[36] = v23;
    *(_QWORD *)(v23 + 16) = v36;
    *(_QWORD *)(v23 + 24) = v35;
    v37 = (uint64_t (*)(uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(**(int **)(v22 + 8)
                                                                                             + *(_QWORD *)(v22 + 8));
    v24 = (_QWORD *)swift_task_alloc();
    v0[37] = v24;
    *v24 = v0;
    v24[1] = sub_22D8B288C;
    return v37(sub_22D8B3204, v23, v21, v22);
  }
  else
  {
    v26 = (_QWORD *)v0[15];
    v27 = v26[9];
    v28 = v26[10];
    __swift_project_boxed_opaque_existential_1(v26 + 6, v27);
    v38 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(**(int **)(v28 + 8)
                                                                                     + *(_QWORD *)(v28 + 8));
    v29 = (_QWORD *)swift_task_alloc();
    v0[42] = v29;
    *v29 = v0;
    v29[1] = sub_22D8B2B24;
    return v38(v0[14], v6, v9, v0[33], v27, v28);
  }
}

uint64_t sub_22D8B288C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 304) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 312) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D8B290C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[33];
  v2 = v0[21];
  v3 = v0[18];
  sub_22D8B5FD0();
  static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(v1, v2, 0, 0, 0, 0, 0, v3);
  v4 = (_QWORD *)swift_task_alloc();
  v0[40] = (uint64_t)v4;
  *v4 = v0;
  v4[1] = sub_22D8B29A4;
  return PatternExecutionResult.generateFlow(manifest:measure:)(v0[18], v0[29]);
}

uint64_t sub_22D8B29A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 136);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 144);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 128);
  *(_QWORD *)(*(_QWORD *)v1 + 328) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

uint64_t sub_22D8B2A20()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(v0 + 312);
  v2 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 168);
  v5 = *(_QWORD *)(v0 + 152);
  sub_22D8B5F94();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  swift_release();
  sub_22D8758C0(v2);
  v6 = *(_QWORD *)(v0 + 240);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 256) + 8))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 248));
  sub_22D8B31C4(v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8B2B24()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 344) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D8B2B88()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  v1 = *(_QWORD *)(v0 + 240);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 256) + 8))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 248));
  sub_22D8B31C4(v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8B2C38()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_22D8758C0(*(_QWORD *)(v0 + 232));
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  v1 = *(void **)(v0 + 304);
  v2 = v1;
  v3 = v1;
  v4 = sub_22D8B6D68();
  v5 = sub_22D8B6FB4();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    *(_DWORD *)v6 = 136315138;
    v13 = v7;
    *(_QWORD *)(v0 + 96) = v1;
    v8 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A838);
    v9 = sub_22D8B6E28();
    *(_QWORD *)(v0 + 104) = sub_22D8755FC(v9, v10, &v13);
    sub_22D8B7044();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22D86F000, v4, v5, "Error executing DialogEngine: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v7, -1, -1);
    MEMORY[0x22E31A4BC](v6, -1, -1);

  }
  else
  {

  }
  sub_22D8B5FA0();
  swift_release();
  v11 = *(_QWORD *)(v0 + 240);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 256) + 8))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 248));
  sub_22D8B31C4(v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8B2E74()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v1 = *(void **)(v0 + 344);
  v2 = v1;
  v3 = v1;
  v4 = sub_22D8B6D68();
  v5 = sub_22D8B6FB4();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    *(_DWORD *)v6 = 136315138;
    v13 = v7;
    *(_QWORD *)(v0 + 96) = v1;
    v8 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A838);
    v9 = sub_22D8B6E28();
    *(_QWORD *)(v0 + 104) = sub_22D8755FC(v9, v10, &v13);
    sub_22D8B7044();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22D86F000, v4, v5, "Error executing DialogEngine: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v7, -1, -1);
    MEMORY[0x22E31A4BC](v6, -1, -1);

  }
  else
  {

  }
  sub_22D8B5FA0();
  swift_release();
  v11 = *(_QWORD *)(v0 + 240);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 256) + 8))(*(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 248));
  sub_22D8B31C4(v11);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8B309C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B318);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D8B33F8(a2, (uint64_t)v6);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(a1, v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, v7, v8);
  v9 = *(_QWORD *)(a1 + 24);
  v10 = *(_QWORD *)(a1 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(a1, v9);
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 40);
  v12 = swift_retain();
  return v11(v12, v9, v10);
}

uint64_t sub_22D8B3170(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_22D87F604;
  return UnsupportedAppNotInstalledFlow.execute()(a1);
}

uint64_t sub_22D8B31C4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B318);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D8B3204(uint64_t a1)
{
  uint64_t v1;

  return sub_22D8B309C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t destroy for UnsupportedAppNotInstalledFlow(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return __swift_destroy_boxed_opaque_existential_1Tm(a1 + 48);
}

uint64_t initializeWithCopy for UnsupportedAppNotInstalledFlow(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v5 = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 72) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 48, a2 + 48);
  return a1;
}

uint64_t assignWithCopy for UnsupportedAppNotInstalledFlow(uint64_t a1, uint64_t a2)
{
  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 48), (uint64_t *)(a2 + 48));
  return a1;
}

__n128 __swift_memcpy88_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for UnsupportedAppNotInstalledFlow(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v5;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  return a1;
}

uint64_t getEnumTagSinglePayload for UnsupportedAppNotInstalledFlow(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UnsupportedAppNotInstalledFlow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
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
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UnsupportedAppNotInstalledFlow()
{
  return &type metadata for UnsupportedAppNotInstalledFlow;
}

uint64_t sub_22D8B33F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B318);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static SiriTimeLog.logger(category:)()
{
  swift_bridgeObjectRetain();
  return sub_22D8B6D74();
}

uint64_t static SiriTimeLog.osLogObject(category:)()
{
  sub_22D8B34FC();
  swift_bridgeObjectRetain();
  return sub_22D8B7014();
}

unint64_t sub_22D8B34FC()
{
  unint64_t result;

  result = qword_255D9B9B8;
  if (!qword_255D9B9B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255D9B9B8);
  }
  return result;
}

uint64_t sub_22D8B3538()
{
  uint64_t v0;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9F738);
  __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return sub_22D8B6D74();
}

uint64_t sub_22D8B35B8()
{
  uint64_t v0;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, static SiriTimeLog.clockFlow);
  __swift_project_value_buffer(v0, (uint64_t)static SiriTimeLog.clockFlow);
  return sub_22D8B6D74();
}

uint64_t SiriTimeLog.clockFlow.unsafeMutableAddressor()
{
  return sub_22D8B3700(qword_255D9A3D8, (uint64_t)static SiriTimeLog.clockFlow);
}

uint64_t static SiriTimeLog.clockFlow.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22D8B375C(qword_255D9A3D8, (uint64_t)static SiriTimeLog.clockFlow, a1);
}

uint64_t sub_22D8B3668()
{
  uint64_t v0;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, static SiriTimeLog.suggestions);
  __swift_project_value_buffer(v0, (uint64_t)static SiriTimeLog.suggestions);
  return sub_22D8B6D74();
}

uint64_t SiriTimeLog.suggestions.unsafeMutableAddressor()
{
  return sub_22D8B3700(&qword_254063190, (uint64_t)static SiriTimeLog.suggestions);
}

uint64_t sub_22D8B3700(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_22D8B6D80();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static SiriTimeLog.suggestions.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22D8B375C(&qword_254063190, (uint64_t)static SiriTimeLog.suggestions, a1);
}

uint64_t sub_22D8B375C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_22D8B6D80();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_22D8B37C4()
{
  uint64_t result;

  sub_22D8B34FC();
  result = sub_22D8B7014();
  static SiriTimeLog.siriTimeFrameworkOSLogObject = result;
  return result;
}

uint64_t *SiriTimeLog.siriTimeFrameworkOSLogObject.unsafeMutableAddressor()
{
  if (qword_255D9A3E8 != -1)
    swift_once();
  return &static SiriTimeLog.siriTimeFrameworkOSLogObject;
}

id static SiriTimeLog.siriTimeFrameworkOSLogObject.getter()
{
  if (qword_255D9A3E8 != -1)
    swift_once();
  return (id)static SiriTimeLog.siriTimeFrameworkOSLogObject;
}

ValueMetadata *type metadata accessor for SiriTimeLog()
{
  return &type metadata for SiriTimeLog;
}

uint64_t PatternExecutionResult.generateFlowPatternResponse(phase:contextUpdate:measure:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  v6 = sub_22D8B6114();
  v5[7] = v6;
  v5[8] = *(_QWORD *)(v6 - 8);
  v5[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22D8B3920()
{
  uint64_t *v0;
  _QWORD *v1;

  static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(v0[3], v0[4], 0, 0, 0, 0, 0, v0[9]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[10] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_22D8B3990;
  return PatternExecutionResult.generateFlow(manifest:measure:)(v0[9], v0[5]);
}

uint64_t sub_22D8B3990(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  *(_QWORD *)(*(_QWORD *)v1 + 88) = a1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return swift_task_switch();
}

uint64_t sub_22D8B3A08()
{
  uint64_t v0;

  sub_22D8B5F94();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8B3A54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9B9C0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9B9C0);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t PatternExecutionResult.generatePatternOutput(manifest:measure:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v7;
  *v7 = v4;
  v7[1] = sub_22D87F604;
  return OutputGenerationManifest.generatePatternOutput(result:measure:)(a1, v3, a3);
}

uint64_t PatternExecutionResult.generateStandardPatternOutput(phase:contextUpdate:measure:dismissAssistant:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 + 40) = a4;
  *(_QWORD *)(v6 + 48) = v5;
  *(_BYTE *)(v6 + 96) = a5;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a3;
  *(_QWORD *)(v6 + 16) = a1;
  v7 = sub_22D8B6114();
  *(_QWORD *)(v6 + 56) = v7;
  *(_QWORD *)(v6 + 64) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v6 + 72) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22D8B3BBC()
{
  uint64_t v0;
  _QWORD *v1;

  static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), 0, 0, 0, 0, *(unsigned __int8 *)(v0 + 96), *(_QWORD *)(v0 + 72));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = sub_22D8B3C30;
  return OutputGenerationManifest.generatePatternOutput(result:measure:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 40));
}

uint64_t sub_22D8B3C30()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*v1 + 72);
  v3 = *(_QWORD *)(*v1 + 56);
  v4 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  *(_QWORD *)(v5 + 88) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_22D8B3CD0()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PatternExecutionResult.generateStandardPatternResponse(phase:contextUpdate:measure:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[12] = a4;
  v5[13] = v4;
  v5[10] = a2;
  v5[11] = a3;
  v5[9] = a1;
  v6 = sub_22D8B6114();
  v5[14] = v6;
  v5[15] = *(_QWORD *)(v6 - 8);
  v5[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22D8B3D6C()
{
  uint64_t *v0;
  _QWORD *v1;

  static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(v0[10], v0[11], 0, 0, 0, 0, 0, v0[16]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[17] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_22D8B3DE4;
  return OutputGenerationManifest.generatePatternOutput(result:measure:)((uint64_t)(v0 + 2), v0[13], v0[12]);
}

uint64_t sub_22D8B3DE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 128);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 112);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 120);
  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return swift_task_switch();
}

uint64_t sub_22D8B3E64()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  sub_22D874D04((__int128 *)(v0 + 16), v1);
  *(_BYTE *)(v1 + 40) = 0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8B3EA8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  void *v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;

  if (qword_255D9A3F0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 144);
  v2 = sub_22D8B6D80();
  __swift_project_value_buffer(v2, (uint64_t)qword_255D9B9C0);
  v3 = v1;
  v4 = v1;
  v5 = sub_22D8B6D68();
  v6 = sub_22D8B6FB4();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 144);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v16 = v10;
    *(_DWORD *)v9 = 136315138;
    *(_QWORD *)(v0 + 56) = v8;
    v11 = v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255D9A838);
    v12 = sub_22D8B6E28();
    *(_QWORD *)(v0 + 64) = sub_22D8755FC(v12, v13, &v16);
    sub_22D8B7044();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_22D86F000, v5, v6, "Failed to generate #Response response: %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v10, -1, -1);
    MEMORY[0x22E31A4BC](v9, -1, -1);
  }
  else
  {

  }
  v14 = *(_QWORD *)(v0 + 72);
  *(_QWORD *)v14 = *(_QWORD *)(v0 + 144);
  *(_BYTE *)(v14 + 40) = 1;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PatternExecutionResult.generateFlow(manifest:measure:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v3[8] = sub_22D8B5F34();
  v3[9] = swift_task_alloc();
  v4 = sub_22D8B6114();
  v3[10] = v4;
  v3[11] = *(_QWORD *)(v4 - 8);
  v3[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22D8B4128()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  os_log_type_t type;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30[5];

  if (qword_255D9A3F0 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = *(void **)(v0 + 56);
  v6 = sub_22D8B6D80();
  __swift_project_value_buffer(v6, (uint64_t)qword_255D9B9C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v1, v4);
  v7 = v5;
  v8 = sub_22D8B6D68();
  v9 = sub_22D8B6FC0();
  v10 = os_log_type_enabled(v8, v9);
  v12 = *(_QWORD *)(v0 + 88);
  v11 = *(_QWORD *)(v0 + 96);
  v13 = *(_QWORD *)(v0 + 80);
  if (v10)
  {
    v14 = *(void **)(v0 + 56);
    v28 = *(_QWORD *)(v0 + 88);
    v15 = swift_slowAlloc();
    v29 = swift_slowAlloc();
    v30[0] = v29;
    *(_DWORD *)v15 = 136315394;
    v16 = objc_msgSend(v14, sel_patternId);
    v17 = sub_22D8B6E10();
    type = v9;
    v19 = v18;

    *(_QWORD *)(v0 + 24) = sub_22D8755FC(v17, v19, v30);
    sub_22D8B7044();
    swift_bridgeObjectRelease();

    *(_WORD *)(v15 + 12) = 2080;
    sub_22D8B60B4();
    v20 = sub_22D8B6E28();
    *(_QWORD *)(v0 + 32) = sub_22D8755FC(v20, v21, v30);
    sub_22D8B7044();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v11, v13);
    _os_log_impl(&dword_22D86F000, v8, type, "generateFlowPatternResponse #Response flow response for pattern %s, dialogPhase: %s", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E31A4BC](v29, -1, -1);
    MEMORY[0x22E31A4BC](v15, -1, -1);
  }
  else
  {
    v22 = *(void **)(v0 + 56);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
  }

  sub_22D8B60A8();
  v23 = sub_22D8B5FF4();
  swift_allocObject();
  v24 = sub_22D8B5FE8();
  v30[3] = v23;
  v30[4] = MEMORY[0x24BE97F18];
  v30[0] = v24;
  sub_22D8B5DD8();
  swift_allocObject();
  *(_QWORD *)(v0 + 16) = sub_22D8B5DCC();
  v25 = sub_22D8B5DE4();
  SiriTimeMeasurement.logDelta()();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v25);
}

uint64_t PatternExecutionResult.generateFlow(phase:contextUpdate:measure:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v5 = sub_22D8B6114();
  v4[6] = v5;
  v4[7] = *(_QWORD *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_22D8B44CC()
{
  uint64_t *v0;
  _QWORD *v1;

  static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)(v0[2], v0[3], 0, 0, 0, 0, 0, v0[8]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[9] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_22D8B453C;
  return PatternExecutionResult.generateFlow(manifest:measure:)(v0[8], v0[4]);
}

uint64_t sub_22D8B453C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v3 = *(_QWORD *)(*v1 + 64);
  v4 = *(_QWORD *)(*v1 + 48);
  v5 = *(_QWORD *)(*v1 + 56);
  v7 = *v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v7 + 8))(a1);
}

uint64_t static OutputGenerationManifest.defaultManifest(for:contextUpdate:sessionID:responseViewId:dismissAssistant:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, unint64_t a6@<X5>, int a7@<W6>, uint64_t a8@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  _BYTE *v32;
  void (*v33)(_BYTE *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  _BYTE *v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  _BOOL4 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  _BYTE *v66;
  uint64_t v67;
  char v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  _BYTE *v75;
  unint64_t v76;
  NSObject *v77;
  os_log_type_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  _BYTE *v93;
  uint64_t (*v94)(uint64_t, uint64_t, uint64_t);
  unint64_t v95;
  NSObject *v96;
  os_log_type_t v97;
  int v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t, uint64_t);
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  _BYTE *v110;
  uint64_t v111;
  uint64_t v112;
  _BYTE v114[12];
  int v115;
  _BYTE *v116;
  _BYTE *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t (*v122)(uint64_t, uint64_t, uint64_t);
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  unint64_t v128;
  uint64_t v129[4];
  uint64_t v130;

  LODWORD(v118) = a7;
  v127 = a4;
  v128 = a6;
  v119 = a2;
  v120 = a5;
  v124 = a3;
  v121 = a8;
  v9 = sub_22D8B6D80();
  v10 = *(_QWORD *)(v9 - 8);
  v125 = v9;
  v126 = v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v117 = &v114[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = MEMORY[0x24BDAC7A8](v11);
  v116 = &v114[-v14];
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = &v114[-v16];
  MEMORY[0x24BDAC7A8](v15);
  v19 = &v114[-v18];
  v20 = sub_22D8B5F34();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = &v114[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = &v114[-v26];
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = &v114[-v29];
  MEMORY[0x24BDAC7A8](v28);
  v32 = &v114[-v31];
  v122 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 16);
  v123 = a1;
  v122((uint64_t)&v114[-v31], a1, v20);
  sub_22D8B5F28();
  sub_22D876330();
  LOBYTE(a1) = sub_22D8B6DF8();
  v33 = *(void (**)(_BYTE *, uint64_t))(v21 + 8);
  v33(v30, v20);
  if ((a1 & 1) != 0)
  {
    v118 = (uint64_t)v30;
    v33(v32, v20);
    if (qword_255D9A3F8 != -1)
      swift_once();
    v34 = v125;
    v35 = __swift_project_value_buffer(v125, (uint64_t)qword_255D9BA10);
    v36 = v126;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v126 + 16))(v19, v35, v34);
    v37 = v128;
    swift_bridgeObjectRetain_n();
    v38 = v127;
    swift_bridgeObjectRetain_n();
    v39 = sub_22D8B6D68();
    v40 = sub_22D8B6FC0();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = swift_slowAlloc();
      v117 = (_BYTE *)swift_slowAlloc();
      v129[0] = (uint64_t)v117;
      *(_DWORD *)v41 = 136315394;
      if (v38)
        v42 = v124;
      else
        v42 = 7104878;
      if (v38)
        v43 = v127;
      else
        v43 = 0xE300000000000000;
      swift_bridgeObjectRetain();
      v130 = sub_22D8755FC(v42, v43, v129);
      sub_22D8B7044();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v41 + 12) = 2080;
      v44 = v120;
      if (v128)
        v45 = v120;
      else
        v45 = 7104878;
      if (v128)
        v46 = v128;
      else
        v46 = 0xE300000000000000;
      swift_bridgeObjectRetain();
      v47 = v45;
      v38 = v127;
      v130 = sub_22D8755FC(v47, v46, v129);
      v37 = v128;
      sub_22D8B7044();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D86F000, v39, v40, "Creating manifest for clarification dialog phase with listenAfterSpeaking = true, sessionID %s, responseViewId %s", (uint8_t *)v41, 0x16u);
      v48 = v117;
      swift_arrayDestroy();
      MEMORY[0x22E31A4BC](v48, -1, -1);
      v49 = v41;
      v50 = v124;
      MEMORY[0x22E31A4BC](v49, -1, -1);

      (*(void (**)(_BYTE *, uint64_t))(v126 + 8))(v19, v125);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      (*(void (**)(_BYTE *, uint64_t))(v36 + 8))(v19, v34);
      v44 = v120;
      v50 = v124;
    }
    v67 = v122(v118, v123, v20);
    MEMORY[0x24BDAC7A8](v67);
    *(_QWORD *)&v114[-48] = v119;
    *(_QWORD *)&v114[-40] = v50;
    *(_QWORD *)&v114[-32] = v38;
    *(_QWORD *)&v114[-24] = v44;
    *(_QWORD *)&v114[-16] = v37;
  }
  else
  {
    sub_22D8B5F1C();
    v51 = sub_22D8B6DF8();
    v33(v30, v20);
    if ((v51 & 1) != 0)
    {
      v118 = (uint64_t)v30;
      v33(v32, v20);
      if (qword_255D9A3F8 != -1)
        swift_once();
      v52 = v125;
      v53 = __swift_project_value_buffer(v125, (uint64_t)qword_255D9BA10);
      v54 = v126;
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v126 + 16))(v17, v53, v52);
      v55 = v128;
      swift_bridgeObjectRetain_n();
      v56 = v127;
      swift_bridgeObjectRetain_n();
      v57 = sub_22D8B6D68();
      v58 = sub_22D8B6FC0();
      v59 = os_log_type_enabled(v57, v58);
      v60 = v124;
      if (v59)
      {
        v61 = swift_slowAlloc();
        v117 = (_BYTE *)swift_slowAlloc();
        v129[0] = (uint64_t)v117;
        *(_DWORD *)v61 = 136315394;
        if (v56)
          v62 = v60;
        else
          v62 = 7104878;
        if (!v56)
          v56 = 0xE300000000000000;
        swift_bridgeObjectRetain();
        v130 = sub_22D8755FC(v62, v56, v129);
        sub_22D8B7044();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v61 + 12) = 2080;
        v63 = v120;
        if (v128)
          v64 = v120;
        else
          v64 = 7104878;
        if (v128)
          v65 = v128;
        else
          v65 = 0xE300000000000000;
        swift_bridgeObjectRetain();
        v130 = sub_22D8755FC(v64, v65, v129);
        v55 = v128;
        sub_22D8B7044();
        swift_bridgeObjectRelease_n();
        v60 = v124;
        v56 = v127;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_22D86F000, v57, v58, "Creating manifest for confirmation dialog phase with listenAfterSpeaking = true, sessionID %s, responseViewId %s", (uint8_t *)v61, 0x16u);
        v66 = v117;
        swift_arrayDestroy();
        MEMORY[0x22E31A4BC](v66, -1, -1);
        MEMORY[0x22E31A4BC](v61, -1, -1);

        (*(void (**)(_BYTE *, uint64_t))(v126 + 8))(v17, v125);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(_BYTE *, uint64_t))(v54 + 8))(v17, v52);
        v63 = v120;
      }
      v71 = v122(v118, v123, v20);
      MEMORY[0x24BDAC7A8](v71);
      *(_QWORD *)&v114[-48] = v119;
      *(_QWORD *)&v114[-40] = v60;
      *(_QWORD *)&v114[-32] = v56;
      *(_QWORD *)&v114[-24] = v63;
      *(_QWORD *)&v114[-16] = v55;
    }
    else
    {
      sub_22D8B5F10();
      v68 = sub_22D8B6DF8();
      v33(v30, v20);
      v33(v32, v20);
      v69 = v127;
      if ((v68 & 1) == 0 || (v118 & 1) == 0)
        goto LABEL_60;
      if (qword_255D9AC30)
      {
        v70 = qword_255D9AC30;
      }
      else
      {
        type metadata accessor for ApplicationContext();
        v70 = swift_allocObject();
        sub_22D8B61B0();
        qword_255D9AC30 = v70;
        swift_retain();
        swift_release();
      }
      sub_22D87832C(v70 + 16, (uint64_t)v129);
      swift_retain();
      swift_release();
      __swift_project_boxed_opaque_existential_1(v129, v129[3]);
      v72 = sub_22D8B5EF8();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v129);
      if ((v72 & 1) != 0)
      {
        if (qword_255D9A3F8 != -1)
          swift_once();
        v73 = v125;
        v74 = __swift_project_value_buffer(v125, (uint64_t)qword_255D9BA10);
        v75 = v116;
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v126 + 16))(v116, v74, v73);
        v122((uint64_t)v27, v123, v20);
        v76 = v128;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        v77 = sub_22D8B6D68();
        v78 = sub_22D8B6FC0();
        v79 = v78;
        if (os_log_type_enabled(v77, v78))
        {
          v80 = swift_slowAlloc();
          LODWORD(v117) = v79;
          v81 = v80;
          v118 = swift_slowAlloc();
          v129[0] = v118;
          *(_DWORD *)v81 = 136315650;
          v122((uint64_t)v30, (uint64_t)v27, v20);
          v82 = sub_22D8B6E28();
          v130 = sub_22D8755FC(v82, v83, v129);
          sub_22D8B7044();
          swift_bridgeObjectRelease();
          v33(v27, v20);
          *(_WORD *)(v81 + 12) = 2080;
          v84 = v124;
          if (v127)
            v85 = v124;
          else
            v85 = 7104878;
          if (v127)
            v86 = v127;
          else
            v86 = 0xE300000000000000;
          swift_bridgeObjectRetain();
          v130 = sub_22D8755FC(v85, v86, v129);
          sub_22D8B7044();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v81 + 22) = 2080;
          v87 = v120;
          if (v128)
            v88 = v120;
          else
            v88 = 7104878;
          if (v128)
            v89 = v128;
          else
            v89 = 0xE300000000000000;
          swift_bridgeObjectRetain();
          v130 = sub_22D8755FC(v88, v89, v129);
          v76 = v128;
          sub_22D8B7044();
          swift_bridgeObjectRelease_n();
          v69 = v127;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22D86F000, v77, (os_log_type_t)v117, "Using default dialog manifest with assistant dismissal for %s with session ID %s, responseViewId %s", (uint8_t *)v81, 0x20u);
          v90 = v118;
          swift_arrayDestroy();
          MEMORY[0x22E31A4BC](v90, -1, -1);
          MEMORY[0x22E31A4BC](v81, -1, -1);

          (*(void (**)(_BYTE *, uint64_t))(v126 + 8))(v116, v125);
        }
        else
        {
          v33(v27, v20);

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          (*(void (**)(_BYTE *, uint64_t))(v126 + 8))(v75, v73);
          v87 = v120;
          v84 = v124;
        }
        v112 = v122((uint64_t)v30, v123, v20);
        MEMORY[0x24BDAC7A8](v112);
        *(_QWORD *)&v114[-48] = v119;
        *(_QWORD *)&v114[-40] = v84;
        *(_QWORD *)&v114[-32] = v69;
        *(_QWORD *)&v114[-24] = v87;
        *(_QWORD *)&v114[-16] = v76;
      }
      else
      {
LABEL_60:
        if (qword_255D9A3F8 != -1)
          swift_once();
        v91 = v125;
        v92 = __swift_project_value_buffer(v125, (uint64_t)qword_255D9BA10);
        v93 = v117;
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v126 + 16))(v117, v92, v91);
        v94 = v122;
        v122((uint64_t)v24, v123, v20);
        v95 = v128;
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain_n();
        v96 = sub_22D8B6D68();
        v97 = sub_22D8B6FC0();
        v98 = v97;
        if (os_log_type_enabled(v96, v97))
        {
          v99 = swift_slowAlloc();
          v115 = v98;
          v100 = v99;
          v116 = (_BYTE *)swift_slowAlloc();
          v129[0] = (uint64_t)v116;
          *(_DWORD *)v100 = 136315650;
          v94((uint64_t)v30, (uint64_t)v24, v20);
          v101 = sub_22D8B6E28();
          v130 = sub_22D8755FC(v101, v102, v129);
          v118 = (uint64_t)v30;
          sub_22D8B7044();
          swift_bridgeObjectRelease();
          v33(v24, v20);
          *(_WORD *)(v100 + 12) = 2080;
          v103 = v124;
          if (v127)
            v104 = v124;
          else
            v104 = 7104878;
          if (v127)
            v105 = v127;
          else
            v105 = 0xE300000000000000;
          swift_bridgeObjectRetain();
          v130 = sub_22D8755FC(v104, v105, v129);
          sub_22D8B7044();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v100 + 22) = 2080;
          v106 = v94;
          v107 = v120;
          if (v128)
            v108 = v120;
          else
            v108 = 7104878;
          if (v128)
            v109 = v128;
          else
            v109 = 0xE300000000000000;
          swift_bridgeObjectRetain();
          v130 = sub_22D8755FC(v108, v109, v129);
          v30 = (_BYTE *)v118;
          v95 = v128;
          sub_22D8B7044();
          swift_bridgeObjectRelease_n();
          v69 = v127;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_22D86F000, v96, (os_log_type_t)v115, "Using default dialog manifest for %s with session ID %s, responseViewId %s", (uint8_t *)v100, 0x20u);
          v110 = v116;
          swift_arrayDestroy();
          MEMORY[0x22E31A4BC](v110, -1, -1);
          MEMORY[0x22E31A4BC](v100, -1, -1);

          (*(void (**)(_BYTE *, uint64_t))(v126 + 8))(v117, v125);
        }
        else
        {
          v33(v24, v20);

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          (*(void (**)(_BYTE *, uint64_t))(v126 + 8))(v93, v125);
          v106 = v94;
          v107 = v120;
          v103 = v124;
        }
        v111 = v106((uint64_t)v30, v123, v20);
        MEMORY[0x24BDAC7A8](v111);
        *(_QWORD *)&v114[-48] = v119;
        *(_QWORD *)&v114[-40] = v103;
        *(_QWORD *)&v114[-32] = v69;
        *(_QWORD *)&v114[-24] = v107;
        *(_QWORD *)&v114[-16] = v95;
      }
    }
  }
  return sub_22D8B60C0();
}

uint64_t sub_22D8B54A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_22D8B6D80();
  __swift_allocate_value_buffer(v0, qword_255D9BA10);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9BA10);
  if (qword_255D9A3D0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255D9F738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_22D8B5530(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D9BA30);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22D8B5F4C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D8B60FC();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BE97960], v6);
  sub_22D8B60CC();
  v10 = sub_22D8B5FDC();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v5, a2, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v5, 0, 1, v10);
  sub_22D8B60E4();
  swift_bridgeObjectRetain();
  sub_22D8B6108();
  swift_bridgeObjectRetain();
  return sub_22D8B60D8();
}

uint64_t sub_22D8B568C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D9BA30);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D8B60FC();
  v6 = sub_22D8B5FDC();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_22D8B60E4();
  swift_bridgeObjectRetain();
  sub_22D8B6108();
  swift_bridgeObjectRetain();
  return sub_22D8B60D8();
}

uint64_t sub_22D8B578C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D9BA30);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22D8B5FDC();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_22D8B60E4();
  swift_bridgeObjectRetain();
  sub_22D8B6108();
  swift_bridgeObjectRetain();
  sub_22D8B60D8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9B350);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_22D8B7AC0;
  *(_QWORD *)(v8 + 32) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81890]), sel_init);
  v10[1] = v8;
  sub_22D8B6ED0();
  return sub_22D8B60F0();
}

uint64_t sub_22D8B58E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255D9BA30);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22D8B5FDC();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  sub_22D8B60E4();
  swift_bridgeObjectRetain();
  sub_22D8B6108();
  swift_bridgeObjectRetain();
  return sub_22D8B60D8();
}

uint64_t sub_22D8B59E0(uint64_t a1)
{
  return sub_22D8B5A10(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22D8B58E8);
}

uint64_t sub_22D8B59EC(uint64_t a1)
{
  return sub_22D8B5A10(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22D8B578C);
}

uint64_t sub_22D8B59F8(uint64_t a1)
{
  return sub_22D8B5A10(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22D8B568C);
}

uint64_t sub_22D8B5A04(uint64_t a1)
{
  return sub_22D8B5A10(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22D8B5530);
}

uint64_t sub_22D8B5A10(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_22D8B5A24()
{
  return MEMORY[0x24BDCB620]();
}

uint64_t sub_22D8B5A30()
{
  return MEMORY[0x24BDCB660]();
}

uint64_t sub_22D8B5A3C()
{
  return MEMORY[0x24BDCB710]();
}

uint64_t sub_22D8B5A48()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_22D8B5A54()
{
  return MEMORY[0x24BDCBC38]();
}

uint64_t sub_22D8B5A60()
{
  return MEMORY[0x24BDCBC50]();
}

uint64_t sub_22D8B5A6C()
{
  return MEMORY[0x24BDCBC68]();
}

uint64_t sub_22D8B5A78()
{
  return MEMORY[0x24BDCBC78]();
}

uint64_t sub_22D8B5A84()
{
  return MEMORY[0x24BDCBC90]();
}

uint64_t sub_22D8B5A90()
{
  return MEMORY[0x24BDCBCA0]();
}

uint64_t sub_22D8B5A9C()
{
  return MEMORY[0x24BDCBCC0]();
}

uint64_t sub_22D8B5AA8()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_22D8B5AB4()
{
  return MEMORY[0x24BDCBCE0]();
}

uint64_t sub_22D8B5AC0()
{
  return MEMORY[0x24BDCBCF0]();
}

uint64_t sub_22D8B5ACC()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_22D8B5AD8()
{
  return MEMORY[0x24BDCBD10]();
}

uint64_t sub_22D8B5AE4()
{
  return MEMORY[0x24BDCBD18]();
}

uint64_t sub_22D8B5AF0()
{
  return MEMORY[0x24BDCBD28]();
}

uint64_t sub_22D8B5AFC()
{
  return MEMORY[0x24BDCBD38]();
}

uint64_t sub_22D8B5B08()
{
  return MEMORY[0x24BDCBD48]();
}

uint64_t sub_22D8B5B14()
{
  return MEMORY[0x24BDCBD68]();
}

uint64_t sub_22D8B5B20()
{
  return MEMORY[0x24BDCBD70]();
}

uint64_t sub_22D8B5B2C()
{
  return MEMORY[0x24BDCBD78]();
}

uint64_t sub_22D8B5B38()
{
  return MEMORY[0x24BDCBD88]();
}

uint64_t sub_22D8B5B44()
{
  return MEMORY[0x24BDCBD98]();
}

uint64_t sub_22D8B5B50()
{
  return MEMORY[0x24BDCBDA8]();
}

uint64_t sub_22D8B5B5C()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_22D8B5B68()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_22D8B5B74()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_22D8B5B80()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_22D8B5B8C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_22D8B5B98()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_22D8B5BA4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_22D8B5BB0()
{
  return MEMORY[0x24BDCDB38]();
}

uint64_t sub_22D8B5BBC()
{
  return MEMORY[0x24BDCDCA8]();
}

uint64_t sub_22D8B5BC8()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_22D8B5BD4()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_22D8B5BE0()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_22D8B5BEC()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_22D8B5BF8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_22D8B5C04()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_22D8B5C10()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_22D8B5C1C()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_22D8B5C28()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_22D8B5C34()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_22D8B5C40()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_22D8B5C4C()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_22D8B5C58()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_22D8B5C64()
{
  return MEMORY[0x24BDCEE50]();
}

uint64_t sub_22D8B5C70()
{
  return MEMORY[0x24BDCEE68]();
}

uint64_t sub_22D8B5C7C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_22D8B5C88()
{
  return MEMORY[0x24BDCF028]();
}

uint64_t sub_22D8B5C94()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_22D8B5CA0()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_22D8B5CAC()
{
  return MEMORY[0x24BDCF078]();
}

uint64_t sub_22D8B5CB8()
{
  return MEMORY[0x24BDCF0B8]();
}

uint64_t sub_22D8B5CC4()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_22D8B5CD0()
{
  return MEMORY[0x24BDCF150]();
}

uint64_t sub_22D8B5CDC()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_22D8B5CE8()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_22D8B5CF4()
{
  return MEMORY[0x24BDCF1C0]();
}

uint64_t sub_22D8B5D00()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_22D8B5D0C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_22D8B5D18()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_22D8B5D24()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_22D8B5D30()
{
  return MEMORY[0x24BEAA5D8]();
}

uint64_t _s16SiriTimeInternal0aB16FeatureFlagsImplV19isTimerSmartEnabledSbyF_0()
{
  return MEMORY[0x24BEAB4E0]();
}

uint64_t sub_22D8B5D48()
{
  return MEMORY[0x24BEAD338]();
}

uint64_t sub_22D8B5D54()
{
  return MEMORY[0x24BEAD340]();
}

uint64_t sub_22D8B5D60()
{
  return MEMORY[0x24BEAD348]();
}

uint64_t sub_22D8B5D6C()
{
  return MEMORY[0x24BEAD350]();
}

uint64_t sub_22D8B5D78()
{
  return MEMORY[0x24BEAD360]();
}

uint64_t sub_22D8B5D84()
{
  return MEMORY[0x24BE95FA0]();
}

uint64_t sub_22D8B5D90()
{
  return MEMORY[0x24BE95FB0]();
}

uint64_t sub_22D8B5D9C()
{
  return MEMORY[0x24BE95FC0]();
}

uint64_t sub_22D8B5DA8()
{
  return MEMORY[0x24BE960B8]();
}

uint64_t sub_22D8B5DB4()
{
  return MEMORY[0x24BE960C8]();
}

uint64_t sub_22D8B5DC0()
{
  return MEMORY[0x24BE96600]();
}

uint64_t sub_22D8B5DCC()
{
  return MEMORY[0x24BE96AC0]();
}

uint64_t sub_22D8B5DD8()
{
  return MEMORY[0x24BE96AD0]();
}

uint64_t sub_22D8B5DE4()
{
  return MEMORY[0x24BE96B00]();
}

uint64_t sub_22D8B5DF0()
{
  return MEMORY[0x24BE96E78]();
}

uint64_t sub_22D8B5DFC()
{
  return MEMORY[0x24BE96E98]();
}

uint64_t sub_22D8B5E08()
{
  return MEMORY[0x24BE96EA0]();
}

uint64_t sub_22D8B5E14()
{
  return MEMORY[0x24BE96EC0]();
}

uint64_t sub_22D8B5E20()
{
  return MEMORY[0x24BE96ED0]();
}

uint64_t sub_22D8B5E2C()
{
  return MEMORY[0x24BE96F28]();
}

uint64_t sub_22D8B5E38()
{
  return MEMORY[0x24BE96FC0]();
}

uint64_t sub_22D8B5E44()
{
  return MEMORY[0x24BE96FE8]();
}

uint64_t sub_22D8B5E50()
{
  return MEMORY[0x24BE96FF0]();
}

uint64_t sub_22D8B5E5C()
{
  return MEMORY[0x24BE97278]();
}

uint64_t sub_22D8B5E68()
{
  return MEMORY[0x24BE97280]();
}

uint64_t sub_22D8B5E74()
{
  return MEMORY[0x24BE97288]();
}

uint64_t sub_22D8B5E80()
{
  return MEMORY[0x24BE97340]();
}

uint64_t sub_22D8B5E8C()
{
  return MEMORY[0x24BE97358]();
}

uint64_t sub_22D8B5E98()
{
  return MEMORY[0x24BE97360]();
}

uint64_t sub_22D8B5EA4()
{
  return MEMORY[0x24BE97380]();
}

uint64_t sub_22D8B5EB0()
{
  return MEMORY[0x24BE97398]();
}

uint64_t sub_22D8B5EBC()
{
  return MEMORY[0x24BE973E0]();
}

uint64_t sub_22D8B5EC8()
{
  return MEMORY[0x24BE97540]();
}

uint64_t sub_22D8B5ED4()
{
  return MEMORY[0x24BE97550]();
}

uint64_t sub_22D8B5EE0()
{
  return MEMORY[0x24BE975D8]();
}

uint64_t sub_22D8B5EEC()
{
  return MEMORY[0x24BE975E8]();
}

uint64_t sub_22D8B5EF8()
{
  return MEMORY[0x24BE975F0]();
}

uint64_t sub_22D8B5F04()
{
  return MEMORY[0x24BE97608]();
}

uint64_t sub_22D8B5F10()
{
  return MEMORY[0x24BE976A8]();
}

uint64_t sub_22D8B5F1C()
{
  return MEMORY[0x24BE976B8]();
}

uint64_t sub_22D8B5F28()
{
  return MEMORY[0x24BE976C0]();
}

uint64_t sub_22D8B5F34()
{
  return MEMORY[0x24BE97700]();
}

uint64_t sub_22D8B5F40()
{
  return MEMORY[0x24BE97890]();
}

uint64_t sub_22D8B5F4C()
{
  return MEMORY[0x24BE97968]();
}

uint64_t sub_22D8B5F58()
{
  return MEMORY[0x24BE97AA8]();
}

uint64_t sub_22D8B5F64()
{
  return MEMORY[0x24BE97AB0]();
}

uint64_t sub_22D8B5F70()
{
  return MEMORY[0x24BE97AB8]();
}

uint64_t sub_22D8B5F7C()
{
  return MEMORY[0x24BE97C70]();
}

uint64_t sub_22D8B5F88()
{
  return MEMORY[0x24BE97C78]();
}

uint64_t sub_22D8B5F94()
{
  return MEMORY[0x24BE97D48]();
}

uint64_t sub_22D8B5FA0()
{
  return MEMORY[0x24BE97D58]();
}

uint64_t sub_22D8B5FAC()
{
  return MEMORY[0x24BE97DC0]();
}

uint64_t sub_22D8B5FB8()
{
  return MEMORY[0x24BE97DC8]();
}

uint64_t sub_22D8B5FC4()
{
  return MEMORY[0x24BE97DD8]();
}

uint64_t sub_22D8B5FD0()
{
  return MEMORY[0x24BE97E50]();
}

uint64_t sub_22D8B5FDC()
{
  return MEMORY[0x24BE97E58]();
}

uint64_t sub_22D8B5FE8()
{
  return MEMORY[0x24BE97F28]();
}

uint64_t sub_22D8B5FF4()
{
  return MEMORY[0x24BE97F30]();
}

uint64_t sub_22D8B6000()
{
  return MEMORY[0x24BE97F40]();
}

uint64_t sub_22D8B600C()
{
  return MEMORY[0x24BE97F48]();
}

uint64_t sub_22D8B6018()
{
  return MEMORY[0x24BE97F58]();
}

uint64_t sub_22D8B6024()
{
  return MEMORY[0x24BE97F60]();
}

uint64_t sub_22D8B6030()
{
  return MEMORY[0x24BE97F80]();
}

uint64_t sub_22D8B603C()
{
  return MEMORY[0x24BE97FD8]();
}

uint64_t sub_22D8B6048()
{
  return MEMORY[0x24BE97FE0]();
}

uint64_t sub_22D8B6054()
{
  return MEMORY[0x24BE98180]();
}

uint64_t sub_22D8B6060()
{
  return MEMORY[0x24BE98188]();
}

uint64_t sub_22D8B606C()
{
  return MEMORY[0x24BE98288]();
}

uint64_t sub_22D8B6078()
{
  return MEMORY[0x24BE98408]();
}

uint64_t sub_22D8B6084()
{
  return MEMORY[0x24BE98590]();
}

uint64_t sub_22D8B6090()
{
  return MEMORY[0x24BE985E8]();
}

uint64_t sub_22D8B609C()
{
  return MEMORY[0x24BE985F0]();
}

uint64_t sub_22D8B60A8()
{
  return MEMORY[0x24BE986D0]();
}

uint64_t sub_22D8B60B4()
{
  return MEMORY[0x24BE98800]();
}

uint64_t sub_22D8B60C0()
{
  return MEMORY[0x24BE98808]();
}

uint64_t sub_22D8B60CC()
{
  return MEMORY[0x24BE98830]();
}

uint64_t sub_22D8B60D8()
{
  return MEMORY[0x24BE98848]();
}

uint64_t sub_22D8B60E4()
{
  return MEMORY[0x24BE98868]();
}

uint64_t sub_22D8B60F0()
{
  return MEMORY[0x24BE98888]();
}

uint64_t sub_22D8B60FC()
{
  return MEMORY[0x24BE98898]();
}

uint64_t sub_22D8B6108()
{
  return MEMORY[0x24BE988A0]();
}

uint64_t sub_22D8B6114()
{
  return MEMORY[0x24BE988E0]();
}

uint64_t sub_22D8B6120()
{
  return MEMORY[0x24BE98CC8]();
}

uint64_t sub_22D8B612C()
{
  return MEMORY[0x24BE98CD0]();
}

uint64_t sub_22D8B6138()
{
  return MEMORY[0x24BE98CD8]();
}

uint64_t sub_22D8B6144()
{
  return MEMORY[0x24BE98CE0]();
}

uint64_t sub_22D8B6150()
{
  return MEMORY[0x24BE98D28]();
}

uint64_t sub_22D8B615C()
{
  return MEMORY[0x24BE98DC0]();
}

uint64_t sub_22D8B6168()
{
  return MEMORY[0x24BE98DD0]();
}

uint64_t sub_22D8B6174()
{
  return MEMORY[0x24BE98E28]();
}

uint64_t sub_22D8B6180()
{
  return MEMORY[0x24BE98E30]();
}

uint64_t sub_22D8B618C()
{
  return MEMORY[0x24BE98E38]();
}

uint64_t sub_22D8B6198()
{
  return MEMORY[0x24BE98E40]();
}

uint64_t sub_22D8B61A4()
{
  return MEMORY[0x24BE98EA8]();
}

uint64_t sub_22D8B61B0()
{
  return MEMORY[0x24BE98EE0]();
}

uint64_t sub_22D8B61BC()
{
  return MEMORY[0x24BE99040]();
}

uint64_t sub_22D8B61C8()
{
  return MEMORY[0x24BE99050]();
}

uint64_t sub_22D8B61D4()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_22D8B61E0()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t sub_22D8B61EC()
{
  return MEMORY[0x24BE9C3E8]();
}

uint64_t sub_22D8B61F8()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t sub_22D8B6204()
{
  return MEMORY[0x24BE9C6D0]();
}

uint64_t sub_22D8B6210()
{
  return MEMORY[0x24BE9C6D8]();
}

uint64_t sub_22D8B621C()
{
  return MEMORY[0x24BE9C6E0]();
}

uint64_t sub_22D8B6228()
{
  return MEMORY[0x24BE9C710]();
}

uint64_t sub_22D8B6234()
{
  return MEMORY[0x24BE9C720]();
}

uint64_t sub_22D8B6240()
{
  return MEMORY[0x24BE9C728]();
}

uint64_t sub_22D8B624C()
{
  return MEMORY[0x24BE9C740]();
}

uint64_t sub_22D8B6258()
{
  return MEMORY[0x24BE9C768]();
}

uint64_t sub_22D8B6264()
{
  return MEMORY[0x24BE9C770]();
}

uint64_t sub_22D8B6270()
{
  return MEMORY[0x24BE9C7A0]();
}

uint64_t sub_22D8B627C()
{
  return MEMORY[0x24BE9C820]();
}

uint64_t sub_22D8B6288()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_22D8B6294()
{
  return MEMORY[0x24BE9CAD8]();
}

uint64_t sub_22D8B62A0()
{
  return MEMORY[0x24BE9CAE8]();
}

uint64_t sub_22D8B62AC()
{
  return MEMORY[0x24BE9CAF0]();
}

uint64_t sub_22D8B62B8()
{
  return MEMORY[0x24BE9CB10]();
}

uint64_t sub_22D8B62C4()
{
  return MEMORY[0x24BE9CB18]();
}

uint64_t sub_22D8B62D0()
{
  return MEMORY[0x24BE9CB20]();
}

uint64_t sub_22D8B62DC()
{
  return MEMORY[0x24BE9CB28]();
}

uint64_t sub_22D8B62E8()
{
  return MEMORY[0x24BE9CCD0]();
}

uint64_t sub_22D8B62F4()
{
  return MEMORY[0x24BE9CD40]();
}

uint64_t sub_22D8B6300()
{
  return MEMORY[0x24BE9CD58]();
}

uint64_t sub_22D8B630C()
{
  return MEMORY[0x24BE9CD68]();
}

uint64_t sub_22D8B6318()
{
  return MEMORY[0x24BE9CD70]();
}

uint64_t sub_22D8B6324()
{
  return MEMORY[0x24BE9CF00]();
}

uint64_t sub_22D8B6330()
{
  return MEMORY[0x24BE9CF08]();
}

uint64_t sub_22D8B633C()
{
  return MEMORY[0x24BE9CF10]();
}

uint64_t sub_22D8B6348()
{
  return MEMORY[0x24BE9D0E0]();
}

uint64_t sub_22D8B6354()
{
  return MEMORY[0x24BE9D0E8]();
}

uint64_t sub_22D8B6360()
{
  return MEMORY[0x24BE9D0F0]();
}

uint64_t sub_22D8B636C()
{
  return MEMORY[0x24BE9E018]();
}

uint64_t sub_22D8B6378()
{
  return MEMORY[0x24BE9E028]();
}

uint64_t sub_22D8B6384()
{
  return MEMORY[0x24BE9EB40]();
}

uint64_t sub_22D8B6390()
{
  return MEMORY[0x24BE9F768]();
}

uint64_t sub_22D8B639C()
{
  return MEMORY[0x24BE9FA18]();
}

uint64_t sub_22D8B63A8()
{
  return MEMORY[0x24BE93088]();
}

uint64_t sub_22D8B63B4()
{
  return MEMORY[0x24BE93090]();
}

uint64_t sub_22D8B63C0()
{
  return MEMORY[0x24BE9FCD0]();
}

uint64_t sub_22D8B63CC()
{
  return MEMORY[0x24BE9FE58]();
}

uint64_t sub_22D8B63D8()
{
  return MEMORY[0x24BE9FE70]();
}

uint64_t sub_22D8B63E4()
{
  return MEMORY[0x24BE9FF70]();
}

uint64_t sub_22D8B63F0()
{
  return MEMORY[0x24BE9FF78]();
}

uint64_t sub_22D8B63FC()
{
  return MEMORY[0x24BE9FFC8]();
}

uint64_t sub_22D8B6408()
{
  return MEMORY[0x24BE9FFD0]();
}

uint64_t sub_22D8B6414()
{
  return MEMORY[0x24BEA0210]();
}

uint64_t sub_22D8B6420()
{
  return MEMORY[0x24BEA0220]();
}

uint64_t sub_22D8B642C()
{
  return MEMORY[0x24BEA0230]();
}

uint64_t sub_22D8B6438()
{
  return MEMORY[0x24BEA0238]();
}

uint64_t sub_22D8B6444()
{
  return MEMORY[0x24BEA02F0]();
}

uint64_t sub_22D8B6450()
{
  return MEMORY[0x24BEA02F8]();
}

uint64_t sub_22D8B645C()
{
  return MEMORY[0x24BEA0308]();
}

uint64_t sub_22D8B6468()
{
  return MEMORY[0x24BEA03A8]();
}

uint64_t sub_22D8B6474()
{
  return MEMORY[0x24BEA0428]();
}

uint64_t sub_22D8B6480()
{
  return MEMORY[0x24BEA0450]();
}

uint64_t sub_22D8B648C()
{
  return MEMORY[0x24BEA0510]();
}

uint64_t sub_22D8B6498()
{
  return MEMORY[0x24BEA0550]();
}

uint64_t sub_22D8B64A4()
{
  return MEMORY[0x24BEA0568]();
}

uint64_t sub_22D8B64B0()
{
  return MEMORY[0x24BEA0588]();
}

uint64_t sub_22D8B64BC()
{
  return MEMORY[0x24BEA0590]();
}

uint64_t sub_22D8B64C8()
{
  return MEMORY[0x24BEA0598]();
}

uint64_t sub_22D8B64D4()
{
  return MEMORY[0x24BEA05A0]();
}

uint64_t sub_22D8B64E0()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_22D8B64EC()
{
  return MEMORY[0x24BEA06B0]();
}

uint64_t sub_22D8B64F8()
{
  return MEMORY[0x24BE930C8]();
}

uint64_t sub_22D8B6504()
{
  return MEMORY[0x24BEA06D0]();
}

uint64_t sub_22D8B6510()
{
  return MEMORY[0x24BEA06D8]();
}

uint64_t sub_22D8B651C()
{
  return MEMORY[0x24BEA06E0]();
}

uint64_t sub_22D8B6528()
{
  return MEMORY[0x24BEA06F0]();
}

uint64_t sub_22D8B6534()
{
  return MEMORY[0x24BEA0708]();
}

uint64_t sub_22D8B6540()
{
  return MEMORY[0x24BEA0710]();
}

uint64_t sub_22D8B654C()
{
  return MEMORY[0x24BEA0720]();
}

uint64_t sub_22D8B6558()
{
  return MEMORY[0x24BEA0738]();
}

uint64_t sub_22D8B6564()
{
  return MEMORY[0x24BEA0798]();
}

uint64_t sub_22D8B6570()
{
  return MEMORY[0x24BEA0800]();
}

uint64_t sub_22D8B657C()
{
  return MEMORY[0x24BEA0870]();
}

uint64_t sub_22D8B6588()
{
  return MEMORY[0x24BEA0888]();
}

uint64_t sub_22D8B6594()
{
  return MEMORY[0x24BEA0968]();
}

uint64_t sub_22D8B65A0()
{
  return MEMORY[0x24BEA0990]();
}

uint64_t sub_22D8B65AC()
{
  return MEMORY[0x24BEA09F0]();
}

uint64_t sub_22D8B65B8()
{
  return MEMORY[0x24BEA0B28]();
}

uint64_t sub_22D8B65C4()
{
  return MEMORY[0x24BEA0CD0]();
}

uint64_t sub_22D8B65D0()
{
  return MEMORY[0x24BEA0CD8]();
}

uint64_t sub_22D8B65DC()
{
  return MEMORY[0x24BEA0CE8]();
}

uint64_t sub_22D8B65E8()
{
  return MEMORY[0x24BEA0CF0]();
}

uint64_t sub_22D8B65F4()
{
  return MEMORY[0x24BEA0D50]();
}

uint64_t sub_22D8B6600()
{
  return MEMORY[0x24BEA0D78]();
}

uint64_t sub_22D8B660C()
{
  return MEMORY[0x24BEA0DA0]();
}

uint64_t sub_22D8B6618()
{
  return MEMORY[0x24BEA0DB0]();
}

uint64_t sub_22D8B6624()
{
  return MEMORY[0x24BEA0DB8]();
}

uint64_t sub_22D8B6630()
{
  return MEMORY[0x24BEA0DC8]();
}

uint64_t sub_22D8B663C()
{
  return MEMORY[0x24BEA0DD0]();
}

uint64_t sub_22D8B6648()
{
  return MEMORY[0x24BEA0E90]();
}

uint64_t sub_22D8B6654()
{
  return MEMORY[0x24BEA0F30]();
}

uint64_t sub_22D8B6660()
{
  return MEMORY[0x24BEA0F68]();
}

uint64_t sub_22D8B666C()
{
  return MEMORY[0x24BEA0FD0]();
}

uint64_t sub_22D8B6678()
{
  return MEMORY[0x24BEA0FD8]();
}

uint64_t sub_22D8B6684()
{
  return MEMORY[0x24BEA0FE0]();
}

uint64_t sub_22D8B6690()
{
  return MEMORY[0x24BE930D8]();
}

uint64_t sub_22D8B669C()
{
  return MEMORY[0x24BEA1578]();
}

uint64_t sub_22D8B66A8()
{
  return MEMORY[0x24BEA1598]();
}

uint64_t sub_22D8B66B4()
{
  return MEMORY[0x24BEA15C8]();
}

uint64_t sub_22D8B66C0()
{
  return MEMORY[0x24BEA15E0]();
}

uint64_t sub_22D8B66CC()
{
  return MEMORY[0x24BEA1740]();
}

uint64_t sub_22D8B66D8()
{
  return MEMORY[0x24BEA1748]();
}

uint64_t sub_22D8B66E4()
{
  return MEMORY[0x24BEA1750]();
}

uint64_t sub_22D8B66F0()
{
  return MEMORY[0x24BEA1758]();
}

uint64_t sub_22D8B66FC()
{
  return MEMORY[0x24BEA1808]();
}

uint64_t sub_22D8B6708()
{
  return MEMORY[0x24BEA1900]();
}

uint64_t sub_22D8B6714()
{
  return MEMORY[0x24BEA1948]();
}

uint64_t sub_22D8B6720()
{
  return MEMORY[0x24BEA1968]();
}

uint64_t sub_22D8B672C()
{
  return MEMORY[0x24BEA1970]();
}

uint64_t sub_22D8B6738()
{
  return MEMORY[0x24BEA1D08]();
}

uint64_t sub_22D8B6744()
{
  return MEMORY[0x24BEA1D10]();
}

uint64_t sub_22D8B6750()
{
  return MEMORY[0x24BEA1D20]();
}

uint64_t sub_22D8B675C()
{
  return MEMORY[0x24BEA1D28]();
}

uint64_t sub_22D8B6768()
{
  return MEMORY[0x24BEA1D78]();
}

uint64_t sub_22D8B6774()
{
  return MEMORY[0x24BEA1D88]();
}

uint64_t sub_22D8B6780()
{
  return MEMORY[0x24BEA1D90]();
}

uint64_t sub_22D8B678C()
{
  return MEMORY[0x24BEA1E98]();
}

uint64_t sub_22D8B6798()
{
  return MEMORY[0x24BEA1EB0]();
}

uint64_t sub_22D8B67A4()
{
  return MEMORY[0x24BEA2048]();
}

uint64_t sub_22D8B67B0()
{
  return MEMORY[0x24BEA2050]();
}

uint64_t sub_22D8B67BC()
{
  return MEMORY[0x24BEA2068]();
}

uint64_t sub_22D8B67C8()
{
  return MEMORY[0x24BEA21B8]();
}

uint64_t sub_22D8B67D4()
{
  return MEMORY[0x24BEA21C0]();
}

uint64_t sub_22D8B67E0()
{
  return MEMORY[0x24BEA21C8]();
}

uint64_t sub_22D8B67EC()
{
  return MEMORY[0x24BEA2460]();
}

uint64_t sub_22D8B67F8()
{
  return MEMORY[0x24BEA2468]();
}

uint64_t sub_22D8B6804()
{
  return MEMORY[0x24BEA2480]();
}

uint64_t sub_22D8B6810()
{
  return MEMORY[0x24BE930F0]();
}

uint64_t sub_22D8B681C()
{
  return MEMORY[0x24BEA2488]();
}

uint64_t sub_22D8B6828()
{
  return MEMORY[0x24BEA2590]();
}

uint64_t sub_22D8B6834()
{
  return MEMORY[0x24BEA25A0]();
}

uint64_t sub_22D8B6840()
{
  return MEMORY[0x24BEA25A8]();
}

uint64_t sub_22D8B684C()
{
  return MEMORY[0x24BEA26F0]();
}

uint64_t sub_22D8B6858()
{
  return MEMORY[0x24BEA2B10]();
}

uint64_t sub_22D8B6864()
{
  return MEMORY[0x24BEA2B18]();
}

uint64_t sub_22D8B6870()
{
  return MEMORY[0x24BEA2BC8]();
}

uint64_t sub_22D8B687C()
{
  return MEMORY[0x24BEA2BE0]();
}

uint64_t sub_22D8B6888()
{
  return MEMORY[0x24BEA2BE8]();
}

uint64_t sub_22D8B6894()
{
  return MEMORY[0x24BEA2F18]();
}

uint64_t sub_22D8B68A0()
{
  return MEMORY[0x24BEA2F20]();
}

uint64_t sub_22D8B68AC()
{
  return MEMORY[0x24BEA2F28]();
}

uint64_t sub_22D8B68B8()
{
  return MEMORY[0x24BEA2F38]();
}

uint64_t sub_22D8B68C4()
{
  return MEMORY[0x24BEA2F40]();
}

uint64_t sub_22D8B68D0()
{
  return MEMORY[0x24BEA3538]();
}

uint64_t sub_22D8B68DC()
{
  return MEMORY[0x24BEA3638]();
}

uint64_t sub_22D8B68E8()
{
  return MEMORY[0x24BEA3640]();
}

uint64_t sub_22D8B68F4()
{
  return MEMORY[0x24BEA3710]();
}

uint64_t sub_22D8B6900()
{
  return MEMORY[0x24BE937E8]();
}

uint64_t sub_22D8B690C()
{
  return MEMORY[0x24BE937F0]();
}

uint64_t sub_22D8B6918()
{
  return MEMORY[0x24BE937F8]();
}

uint64_t sub_22D8B6924()
{
  return MEMORY[0x24BE93978]();
}

uint64_t sub_22D8B6930()
{
  return MEMORY[0x24BE93998]();
}

uint64_t sub_22D8B693C()
{
  return MEMORY[0x24BE939A0]();
}

uint64_t sub_22D8B6948()
{
  return MEMORY[0x24BE939B8]();
}

uint64_t sub_22D8B6954()
{
  return MEMORY[0x24BE93A20]();
}

uint64_t sub_22D8B6960()
{
  return MEMORY[0x24BE93A38]();
}

uint64_t sub_22D8B696C()
{
  return MEMORY[0x24BE93A40]();
}

uint64_t sub_22D8B6978()
{
  return MEMORY[0x24BE93A50]();
}

uint64_t sub_22D8B6984()
{
  return MEMORY[0x24BE93A58]();
}

uint64_t sub_22D8B6990()
{
  return MEMORY[0x24BE93A60]();
}

uint64_t sub_22D8B699C()
{
  return MEMORY[0x24BE93D80]();
}

uint64_t sub_22D8B69A8()
{
  return MEMORY[0x24BE93E78]();
}

uint64_t sub_22D8B69B4()
{
  return MEMORY[0x24BE93E80]();
}

uint64_t sub_22D8B69C0()
{
  return MEMORY[0x24BE93E88]();
}

uint64_t sub_22D8B69CC()
{
  return MEMORY[0x24BE93E98]();
}

uint64_t sub_22D8B69D8()
{
  return MEMORY[0x24BE93EE8]();
}

uint64_t sub_22D8B69E4()
{
  return MEMORY[0x24BE93F28]();
}

uint64_t sub_22D8B69F0()
{
  return MEMORY[0x24BE93F38]();
}

uint64_t sub_22D8B69FC()
{
  return MEMORY[0x24BE93F40]();
}

uint64_t sub_22D8B6A08()
{
  return MEMORY[0x24BE93F48]();
}

uint64_t sub_22D8B6A14()
{
  return MEMORY[0x24BE93F50]();
}

uint64_t sub_22D8B6A20()
{
  return MEMORY[0x24BE93F58]();
}

uint64_t sub_22D8B6A2C()
{
  return MEMORY[0x24BE93F60]();
}

uint64_t sub_22D8B6A38()
{
  return MEMORY[0x24BE93F78]();
}

uint64_t sub_22D8B6A44()
{
  return MEMORY[0x24BE93F90]();
}

uint64_t sub_22D8B6A50()
{
  return MEMORY[0x24BE94110]();
}

uint64_t sub_22D8B6A5C()
{
  return MEMORY[0x24BE94130]();
}

uint64_t sub_22D8B6A68()
{
  return MEMORY[0x24BE94160]();
}

uint64_t sub_22D8B6A74()
{
  return MEMORY[0x24BE94190]();
}

uint64_t sub_22D8B6A80()
{
  return MEMORY[0x24BE941A0]();
}

uint64_t sub_22D8B6A8C()
{
  return MEMORY[0x24BE941E8]();
}

uint64_t sub_22D8B6A98()
{
  return MEMORY[0x24BE941F8]();
}

uint64_t sub_22D8B6AA4()
{
  return MEMORY[0x24BE94200]();
}

uint64_t sub_22D8B6AB0()
{
  return MEMORY[0x24BE942A8]();
}

uint64_t sub_22D8B6ABC()
{
  return MEMORY[0x24BE990E0]();
}

uint64_t sub_22D8B6AC8()
{
  return MEMORY[0x24BEA87F0]();
}

uint64_t sub_22D8B6AD4()
{
  return MEMORY[0x24BEA8810]();
}

uint64_t sub_22D8B6AE0()
{
  return MEMORY[0x24BEA8958]();
}

uint64_t sub_22D8B6AEC()
{
  return MEMORY[0x24BEA89B0]();
}

uint64_t sub_22D8B6AF8()
{
  return MEMORY[0x24BEA8DD8]();
}

uint64_t sub_22D8B6B04()
{
  return MEMORY[0x24BEA8DE0]();
}

uint64_t sub_22D8B6B10()
{
  return MEMORY[0x24BEA8DE8]();
}

uint64_t sub_22D8B6B1C()
{
  return MEMORY[0x24BE928B0]();
}

uint64_t sub_22D8B6B28()
{
  return MEMORY[0x24BE928C0]();
}

uint64_t sub_22D8B6B34()
{
  return MEMORY[0x24BE928D8]();
}

uint64_t sub_22D8B6B40()
{
  return MEMORY[0x24BE928E0]();
}

uint64_t sub_22D8B6B4C()
{
  return MEMORY[0x24BE928E8]();
}

uint64_t sub_22D8B6B58()
{
  return MEMORY[0x24BE929A8]();
}

uint64_t sub_22D8B6B64()
{
  return MEMORY[0x24BE929C8]();
}

uint64_t sub_22D8B6B70()
{
  return MEMORY[0x24BE92A38]();
}

uint64_t sub_22D8B6B7C()
{
  return MEMORY[0x24BE92B00]();
}

uint64_t sub_22D8B6B88()
{
  return MEMORY[0x24BE92B30]();
}

uint64_t sub_22D8B6B94()
{
  return MEMORY[0x24BE92B38]();
}

uint64_t sub_22D8B6BA0()
{
  return MEMORY[0x24BE92B40]();
}

uint64_t sub_22D8B6BAC()
{
  return MEMORY[0x24BE92B50]();
}

uint64_t sub_22D8B6BB8()
{
  return MEMORY[0x24BE92B58]();
}

uint64_t sub_22D8B6BC4()
{
  return MEMORY[0x24BE90B90]();
}

uint64_t sub_22D8B6BD0()
{
  return MEMORY[0x24BE90BB8]();
}

uint64_t sub_22D8B6BDC()
{
  return MEMORY[0x24BE93020]();
}

uint64_t sub_22D8B6BE8()
{
  return MEMORY[0x24BEA54A8]();
}

uint64_t sub_22D8B6BF4()
{
  return MEMORY[0x24BEA54B0]();
}

uint64_t sub_22D8B6C00()
{
  return MEMORY[0x24BEA54E8]();
}

uint64_t sub_22D8B6C0C()
{
  return MEMORY[0x24BEA54F8]();
}

uint64_t sub_22D8B6C18()
{
  return MEMORY[0x24BEA9028]();
}

uint64_t sub_22D8B6C24()
{
  return MEMORY[0x24BEA9048]();
}

uint64_t sub_22D8B6C30()
{
  return MEMORY[0x24BEA9058]();
}

uint64_t sub_22D8B6C3C()
{
  return MEMORY[0x24BEA9068]();
}

uint64_t sub_22D8B6C48()
{
  return MEMORY[0x24BEA9080]();
}

uint64_t sub_22D8B6C54()
{
  return MEMORY[0x24BEA9088]();
}

uint64_t sub_22D8B6C60()
{
  return MEMORY[0x24BEA9090]();
}

uint64_t _s27SiriVirtualDeviceResolution0C4UnitC0A12TimeInternalE10isCommunalSbvg_0()
{
  return MEMORY[0x24BEA90A0]();
}

uint64_t sub_22D8B6C78()
{
  return MEMORY[0x24BEA90B0]();
}

uint64_t sub_22D8B6C84()
{
  return MEMORY[0x24BEA90B8]();
}

uint64_t sub_22D8B6C90()
{
  return MEMORY[0x24BEA90D8]();
}

uint64_t sub_22D8B6C9C()
{
  return MEMORY[0x24BEA90E0]();
}

uint64_t sub_22D8B6CA8()
{
  return MEMORY[0x24BEA90F0]();
}

uint64_t sub_22D8B6CB4()
{
  return MEMORY[0x24BEA9108]();
}

uint64_t sub_22D8B6CC0()
{
  return MEMORY[0x24BEA9110]();
}

uint64_t sub_22D8B6CCC()
{
  return MEMORY[0x24BEA9120]();
}

uint64_t sub_22D8B6CD8()
{
  return MEMORY[0x24BEA9150]();
}

uint64_t sub_22D8B6CE4()
{
  return MEMORY[0x24BEA9158]();
}

uint64_t sub_22D8B6CF0()
{
  return MEMORY[0x24BEA9170]();
}

uint64_t sub_22D8B6CFC()
{
  return MEMORY[0x24BEA9180]();
}

uint64_t sub_22D8B6D08()
{
  return MEMORY[0x24BEA91A0]();
}

uint64_t sub_22D8B6D14()
{
  return MEMORY[0x24BEA91B0]();
}

uint64_t sub_22D8B6D20()
{
  return MEMORY[0x24BEA91C8]();
}

uint64_t sub_22D8B6D2C()
{
  return MEMORY[0x24BEA9250]();
}

uint64_t sub_22D8B6D38()
{
  return MEMORY[0x24BEA9260]();
}

uint64_t sub_22D8B6D44()
{
  return MEMORY[0x24BEA92E0]();
}

uint64_t sub_22D8B6D50()
{
  return MEMORY[0x24BEA92E8]();
}

uint64_t sub_22D8B6D5C()
{
  return MEMORY[0x24BEA92F8]();
}

uint64_t sub_22D8B6D68()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22D8B6D74()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_22D8B6D80()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22D8B6D8C()
{
  return MEMORY[0x24BEA5578]();
}

uint64_t sub_22D8B6D98()
{
  return MEMORY[0x24BEA5580]();
}

uint64_t sub_22D8B6DA4()
{
  return MEMORY[0x24BEA59D8]();
}

uint64_t sub_22D8B6DB0()
{
  return MEMORY[0x24BEA5A68]();
}

uint64_t sub_22D8B6DBC()
{
  return MEMORY[0x24BEA5A70]();
}

uint64_t sub_22D8B6DC8()
{
  return MEMORY[0x24BEA5AD0]();
}

uint64_t sub_22D8B6DD4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_22D8B6DE0()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_22D8B6DEC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_22D8B6DF8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22D8B6E04()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22D8B6E10()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22D8B6E1C()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_22D8B6E28()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22D8B6E34()
{
  return MEMORY[0x24BE92C48]();
}

uint64_t sub_22D8B6E40()
{
  return MEMORY[0x24BEE0AA0]();
}

uint64_t sub_22D8B6E4C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22D8B6E58()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_22D8B6E64()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_22D8B6E70()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22D8B6E7C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22D8B6E88()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_22D8B6E94()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_22D8B6EA0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_22D8B6EAC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_22D8B6EB8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22D8B6EC4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_22D8B6ED0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22D8B6EDC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_22D8B6EE8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_22D8B6EF4()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_22D8B6F00()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_22D8B6F0C()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_22D8B6F18()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_22D8B6F24()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_22D8B6F30()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_22D8B6F3C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_22D8B6F48()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_22D8B6F54()
{
  return MEMORY[0x24BEE1388]();
}

uint64_t sub_22D8B6F60()
{
  return MEMORY[0x24BDCFC78]();
}

uint64_t sub_22D8B6F6C()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_22D8B6F78()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_22D8B6F84()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_22D8B6F90()
{
  return MEMORY[0x24BEE1A00]();
}

uint64_t sub_22D8B6F9C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_22D8B6FA8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_22D8B6FB4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22D8B6FC0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_22D8B6FCC()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_22D8B6FD8()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_22D8B6FE4()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_22D8B6FF0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_22D8B6FFC()
{
  return MEMORY[0x24BDD02D8]();
}

uint64_t sub_22D8B7008()
{
  return MEMORY[0x24BDD02E8]();
}

uint64_t sub_22D8B7014()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_22D8B7020()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_22D8B702C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22D8B7038()
{
  return MEMORY[0x24BEE1D60]();
}

uint64_t sub_22D8B7044()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22D8B7050()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22D8B705C()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_22D8B7068()
{
  return MEMORY[0x24BDD0570]();
}

uint64_t sub_22D8B7074()
{
  return MEMORY[0x24BDD05C8]();
}

uint64_t sub_22D8B7080()
{
  return MEMORY[0x24BDD05D0]();
}

uint64_t sub_22D8B708C()
{
  return MEMORY[0x24BEE5E68]();
}

uint64_t sub_22D8B7098()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22D8B70A4()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_22D8B70B0()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_22D8B70BC()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_22D8B70C8()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_22D8B70D4()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_22D8B70E0()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_22D8B70EC()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_22D8B70F8()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_22D8B7104()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_22D8B7110()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_22D8B711C()
{
  return MEMORY[0x24BEE2508]();
}

uint64_t sub_22D8B7128()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22D8B7134()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22D8B7140()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_22D8B714C()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_22D8B7158()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_22D8B7164()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_22D8B7170()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22D8B717C()
{
  return MEMORY[0x24BEE2840]();
}

uint64_t sub_22D8B7188()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_22D8B7194()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_22D8B71A0()
{
  return MEMORY[0x24BEE2F20]();
}

uint64_t sub_22D8B71AC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22D8B71B8()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_22D8B71C4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22D8B71D0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_22D8B71DC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_22D8B71E8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22D8B71F4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22D8B7200()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_22D8B720C()
{
  return MEMORY[0x24BEE32B0]();
}

uint64_t sub_22D8B7218()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_22D8B7224()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_22D8B7230()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_22D8B723C()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_22D8B7248()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_22D8B7254()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_22D8B7260()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_22D8B726C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_22D8B7278()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_22D8B7284()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_22D8B7290()
{
  return MEMORY[0x24BEE33D8]();
}

uint64_t sub_22D8B729C()
{
  return MEMORY[0x24BEE3400]();
}

uint64_t sub_22D8B72A8()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_22D8B72B4()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_22D8B72C0()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_22D8B72CC()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_22D8B72D8()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_22D8B72E4()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_22D8B72F0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_22D8B72FC()
{
  return MEMORY[0x24BEE3518]();
}

uint64_t sub_22D8B7308()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_22D8B7314()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22D8B7320()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_22D8B732C()
{
  return MEMORY[0x24BEE35C8]();
}

uint64_t sub_22D8B7338()
{
  return MEMORY[0x24BEE35D0]();
}

uint64_t sub_22D8B7344()
{
  return MEMORY[0x24BEE35E8]();
}

uint64_t sub_22D8B7350()
{
  return MEMORY[0x24BEE35F0]();
}

uint64_t sub_22D8B735C()
{
  return MEMORY[0x24BEE35F8]();
}

uint64_t sub_22D8B7368()
{
  return MEMORY[0x24BEE3600]();
}

uint64_t sub_22D8B7374()
{
  return MEMORY[0x24BEE3668]();
}

uint64_t sub_22D8B7380()
{
  return MEMORY[0x24BEE3670]();
}

uint64_t sub_22D8B738C()
{
  return MEMORY[0x24BEE3718]();
}

uint64_t sub_22D8B7398()
{
  return MEMORY[0x24BEE3720]();
}

uint64_t sub_22D8B73A4()
{
  return MEMORY[0x24BEE3758]();
}

uint64_t sub_22D8B73B0()
{
  return MEMORY[0x24BEE3760]();
}

uint64_t sub_22D8B73BC()
{
  return MEMORY[0x24BEE3768]();
}

uint64_t sub_22D8B73C8()
{
  return MEMORY[0x24BEE3778]();
}

uint64_t sub_22D8B73D4()
{
  return MEMORY[0x24BEE37D0]();
}

uint64_t sub_22D8B73E0()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_22D8B73EC()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_22D8B73F8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22D8B7404()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_22D8B7410()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_22D8B741C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_22D8B7428()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_22D8B7434()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22D8B7440()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22D8B744C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22D8B7458()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_22D8B7464()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_22D8B7470()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_22D8B747C()
{
  return MEMORY[0x24BEE4A10]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x24BEE4B50]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initEnumMetadataSingleCase()
{
  return MEMORY[0x24BEE4E38]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

