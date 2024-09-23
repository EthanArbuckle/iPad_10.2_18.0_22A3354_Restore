uint64_t sub_1C2F97110()
{
  unint64_t v0;

  v0 = sub_1C2FC9C78();
  OUTLINED_FUNCTION_22();
  if (v0 >= 8)
    return 8;
  else
    return v0;
}

void *sub_1C2F97154()
{
  return &unk_1E7CDEE60;
}

uint64_t sub_1C2F97160(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1C2F9719C + 4 * byte_1C2FCA5E0[a1]))(0xD000000000000015, 0x80000001C2FCAEE0);
}

uint64_t sub_1C2F9719C()
{
  uint64_t v0;

  return v0 + 12;
}

uint64_t sub_1C2F9721C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1C2FC1544(*a1, *a2);
}

uint64_t sub_1C2F97228()
{
  unsigned __int8 *v0;

  return sub_1C2F97230(*v0);
}

uint64_t sub_1C2F97230(unsigned __int8 a1)
{
  sub_1C2FC9D08();
  sub_1C2F97160(a1);
  sub_1C2FC9A20();
  swift_bridgeObjectRelease();
  return sub_1C2FC9D14();
}

void sub_1C2F97290()
{
  sub_1C2FC9D08();
  OUTLINED_FUNCTION_9();
  sub_1C2FC9D14();
  OUTLINED_FUNCTION_56();
}

uint64_t sub_1C2F972C0(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_1C2F972E8(a1, *v1);
}

uint64_t sub_1C2F972C8()
{
  return sub_1C2FC9A20();
}

uint64_t sub_1C2F972E8(uint64_t a1, unsigned __int8 a2)
{
  sub_1C2F97160(a2);
  sub_1C2FC9A20();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2F97328(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_1C2F97330(a1, *v1);
}

uint64_t sub_1C2F97330(uint64_t a1, unsigned __int8 a2)
{
  sub_1C2FC9D08();
  sub_1C2F97160(a2);
  sub_1C2FC9A20();
  swift_bridgeObjectRelease();
  return sub_1C2FC9D14();
}

void sub_1C2F9738C()
{
  sub_1C2FC9D08();
  OUTLINED_FUNCTION_9();
  sub_1C2FC9D14();
  OUTLINED_FUNCTION_56();
}

uint64_t sub_1C2F973B8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1C2F973F4 + 4 * byte_1C2FCA5E8[a1]))(0xD00000000000001CLL, 0x80000001C2FCB000);
}

uint64_t sub_1C2F973F4()
{
  uint64_t v0;

  return v0 + 23;
}

uint64_t sub_1C2F97448@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1C2F97110();
  *a1 = result;
  return result;
}

void sub_1C2F97474(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;

  *a1 = sub_1C2F97160(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_31();
}

void sub_1C2F97498(_QWORD *a1@<X8>)
{
  *a1 = &unk_1E7CDEE60;
}

void sub_1C2F974A8()
{
  qword_1ED7AF648 = 0x6E6F6973726576;
  unk_1ED7AF650 = 0xE700000000000000;
}

void sub_1C2F974CC()
{
  qword_1ED7AF658 = 0x656C61636F6CLL;
  unk_1ED7AF660 = 0xE600000000000000;
}

id sub_1C2F974EC()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  v1 = (void *)sub_1C2FC99E4();
  v2 = objc_msgSend(v0, sel_retrieveAssetSet_usages_, v1, 0);

  return v2;
}

void sub_1C2F97578(uint64_t a1, uint64_t a2)
{
  sub_1C2F975E0(a2);
  OUTLINED_FUNCTION_31();
}

void sub_1C2F97598(uint64_t a1, uint64_t a2)
{
  sub_1C2F99228(a2);
  OUTLINED_FUNCTION_31();
}

void sub_1C2F975B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1C2F997A4(a2, a3, a4);
  OUTLINED_FUNCTION_31();
}

uint64_t sub_1C2F975E0(uint64_t a1)
{
  uint64_t v1;
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
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_10();
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v14 - v7;
  v9 = OUTLINED_FUNCTION_59();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v9);
  sub_1C2F9BD98((uint64_t)v8, (uint64_t)v6, &qword_1ED7AE750);
  v10 = v1 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_currentSessionId;
  OUTLINED_FUNCTION_34();
  sub_1C2F9B9D0((uint64_t)v6, v10);
  swift_endAccess();
  v11 = sub_1C2F976F8();
  OUTLINED_FUNCTION_41(v11);
  v12 = sub_1C2F98748();
  return OUTLINED_FUNCTION_41(v12);
}

uint64_t sub_1C2F976F8()
{
  uint64_t v0;
  void *v1;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1C3BD04B0]();
  sub_1C2F9774C(v0, &v3);
  objc_autoreleasePoolPop(v1);
  return v3;
}

void sub_1C2F9774C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  v3 = v2;
  if (qword_1ED7AF028 != -1)
    swift_once();
  v6 = sub_1C2FC98F4();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ED7AF6F8);
  v7 = sub_1C2FC98E8();
  v8 = sub_1C2FC9B04();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1C2F94000, v7, v8, "Requesting asset factors for logging from Trial client", v9, 2u);
    MEMORY[0x1C3BD0834](v9, -1, -1);
  }

  v10 = objc_msgSend((id)objc_opt_self(), sel_clientWithIdentifier_, 115);
  v19 = MEMORY[0x1E0DEE9D8];
  sub_1C2F9A93C();
  v12 = v11;
  v13 = *(_QWORD *)(v11 + 16);
  if (v13)
  {
    v18 = a2;
    v14 = 0;
    while (1)
    {
      v15 = *(unsigned __int8 *)(v12 + v14 + 32);
      v16 = (void *)MEMORY[0x1C3BD04B0]();
      sub_1C2F97920(v10, v15, a1, &v19);
      if (v3)
        break;
      v3 = 0;
      ++v14;
      objc_autoreleasePoolPop(v16);
      if (v13 == v14)
      {

        swift_bridgeObjectRelease();
        v17 = v19;
        a2 = v18;
        goto LABEL_11;
      }
    }
    objc_autoreleasePoolPop(v16);
    __break(1u);
  }
  else
  {

    swift_bridgeObjectRelease();
    v17 = MEMORY[0x1E0DEE9D8];
LABEL_11:
    *a2 = v17;
  }
}

void sub_1C2F97920(void *a1, int a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = v4;
  sub_1C2F97160(a2);
  v8 = (void *)sub_1C2FC99E4();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(a1, sel_factorLevelsWithNamespaceName_, v8);

  sub_1C2F9BD28(0, &qword_1ED7AF030);
  v10 = sub_1C2FC9ABC();

  if (!(v10 >> 62))
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v11)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease();
    return;
  }
LABEL_12:
  swift_bridgeObjectRetain();
  v11 = sub_1C2FC9C54();
  swift_bridgeObjectRelease();
  if (!v11)
    goto LABEL_10;
LABEL_3:
  v12 = 4;
  while (1)
  {
    if ((v10 & 0xC000000000000001) != 0)
      v13 = (id)MEMORY[0x1C3BD02AC](v12 - 4, v10);
    else
      v13 = *(id *)(v10 + 8 * v12);
    v14 = v13;
    v15 = v12 - 3;
    if (__OFADD__(v12 - 4, 1))
    {
      __break(1u);
      goto LABEL_12;
    }
    v16 = (void *)MEMORY[0x1C3BD04B0]();
    sub_1C2F97AB0(v14, a2, a3, a4);
    if (v5)
      break;
    v5 = 0;
    objc_autoreleasePoolPop(v16);

    ++v12;
    if (v15 == v11)
      goto LABEL_10;
  }
  objc_autoreleasePoolPop(v16);
  __break(1u);
}

void sub_1C2F97AB0(void *a1, int a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  NSObject *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  char *v29;
  int v30;
  uint64_t v31;
  id v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  id v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  NSObject *v71;
  id v72;
  id v73;
  uint64_t v74;
  unint64_t v75;
  void *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  char *v82;
  uint64_t v83;
  int v84;
  os_log_t v85;
  void (*v86)(char *);
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  int v91;
  uint64_t v92;
  unint64_t v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;

  v90 = a4;
  v91 = a2;
  v8 = sub_1C2FC98F4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v82 - v14;
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v82 - v16;
  v18 = objc_msgSend(a1, sel_level);
  if (!v18)
  {
    __break(1u);
    goto LABEL_60;
  }
  v4 = (unint64_t)v18;
  v6 = (uint64_t)-[NSObject directoryValue](v18, sel_directoryValue);

  if (!v6)
  {
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  v19 = sub_1C2F9BA18((void *)v6, (SEL *)&selRef_path);
  if (!v20)
    return;
  v6 = v19;
  v4 = (unint64_t)v20;
  swift_bridgeObjectRelease();
  v21 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v21 = v6 & 0xFFFFFFFFFFFFLL;
  if (!v21)
    return;
  v22 = objc_msgSend(a1, sel_level);
  if (!v22)
    goto LABEL_61;
  v4 = (unint64_t)v22;
  v6 = (uint64_t)-[NSObject metadata](v22, sel_metadata);

  if (!v6)
  {
LABEL_62:
    __break(1u);
LABEL_63:

    __break(1u);
    goto LABEL_64;
  }
  v99 = v8;
  v89 = v5;
  if (qword_1ED7AEFD0 != -1)
    swift_once();
  v94 = xmmword_1ED7AF648;
  swift_bridgeObjectRetain_n();
  v23 = objc_msgSend((id)v6, sel___swift_objectForKeyedSubscript_, sub_1C2FC9CB4());
  swift_unknownObjectRelease();

  if (v23)
  {
    sub_1C2FC9BD0();
    swift_unknownObjectRelease();
  }
  else
  {
    v94 = 0u;
    v95 = 0u;
  }
  v24 = v99;
  sub_1C2F9BD98((uint64_t)&v94, (uint64_t)&v96, &qword_1ED7AEF88);
  if (v98)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v25 = v93;
      v88 = v92;
      swift_bridgeObjectRelease();
      if (qword_1ED7AF028 != -1)
        swift_once();
      v26 = v99;
      v27 = __swift_project_value_buffer(v99, (uint64_t)qword_1ED7AF6F8);
      v86 = *(void (**)(char *))(v9 + 16);
      v87 = v27;
      v86(v15);
      v28 = a1;
      swift_bridgeObjectRetain_n();
      v29 = (char *)v28;
      v4 = sub_1C2FC98E8();
      v30 = sub_1C2FC9B04();
      if (!os_log_type_enabled((os_log_t)v4, (os_log_type_t)v30))
      {

        swift_bridgeObjectRelease_n();
        v40 = *(void (**)(char *, uint64_t))(v9 + 8);
        v40(v15, v26);
        v36 = v88;
LABEL_31:
        sub_1C2F99EE0(v36, v25);
        v50 = v49;
        swift_bridgeObjectRelease();
        if (!v50)
        {
          v55 = v99;
          ((void (*)(char *, uint64_t, uint64_t))v86)(v12, v87, v99);
          v4 = v29;
          v56 = sub_1C2FC98E8();
          v57 = sub_1C2FC9B10();
          if (os_log_type_enabled(v56, v57))
          {
            v58 = swift_slowAlloc();
            v59 = swift_slowAlloc();
            *(_QWORD *)&v94 = v59;
            *(_DWORD *)v58 = 136315394;
            v60 = sub_1C2F97160(v91);
            v96 = sub_1C2FC4294(v60, v61, (uint64_t *)&v94);
            sub_1C2FC9BA0();
            swift_bridgeObjectRelease();
            *(_WORD *)(v58 + 12) = 2080;
            v62 = objc_msgSend((id)v4, sel_factor);
            if (!v62)
            {
LABEL_68:

              __break(1u);
              return;
            }
            v96 = sub_1C2F9BA18(v62, (SEL *)&selRef_name);
            v97 = v63;
            __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF00);
            v64 = sub_1C2FC99FC();
            v96 = sub_1C2FC4294(v64, v65, (uint64_t *)&v94);
            sub_1C2FC9BA0();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1C2F94000, v56, v57, "Failed to find version for namespace %s and asset %s", (uint8_t *)v58, 0x16u);
            swift_arrayDestroy();
            MEMORY[0x1C3BD0834](v59, -1, -1);
            MEMORY[0x1C3BD0834](v58, -1, -1);

            v66 = v12;
            v67 = v99;
          }
          else
          {

            v66 = v12;
            v67 = v55;
          }
          v40(v66, v67);
          return;
        }
        v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A3D0]), sel_init);
        if (!v51)
        {
          v68 = sub_1C2FC98E8();
          v69 = sub_1C2FC9B10();
          if (os_log_type_enabled(v68, v69))
          {
            v70 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v70 = 0;
            _os_log_impl(&dword_1C2F94000, v68, v69, "Failed to create an event for asset", v70, 2u);
            MEMORY[0x1C3BD0834](v70, -1, -1);

            return;
          }
          goto LABEL_58;
        }
        v52 = v51;
        v53 = objc_msgSend(v29, sel_factor);
        if (v53)
        {
          sub_1C2F9BA18(v53, (SEL *)&selRef_name);
          if (v54)
          {
            v4 = sub_1C2FC99E4();
            swift_bridgeObjectRelease();
          }
          else
          {
            v4 = 0;
          }
          objc_msgSend(v52, sel_setAssetName_, v4);

          objc_msgSend(v52, sel_setAssetVersion_, v50);
          v71 = objc_msgSend(v29, sel_level);
          if (v71)
          {
            v4 = (unint64_t)v71;
            v72 = -[NSObject metadata](v71, sel_metadata);

            if (v72)
            {
              if (qword_1ED7AF048 != -1)
                swift_once();
              v94 = xmmword_1ED7AF658;
              swift_bridgeObjectRetain_n();
              v73 = objc_msgSend(v72, sel___swift_objectForKeyedSubscript_, sub_1C2FC9CB4());
              swift_unknownObjectRelease();

              if (v73)
              {
                sub_1C2FC9BD0();
                swift_unknownObjectRelease();
              }
              else
              {
                v94 = 0u;
                v95 = 0u;
              }
              sub_1C2F9BD98((uint64_t)&v94, (uint64_t)&v96, &qword_1ED7AEF88);
              if (v98)
              {
                if ((swift_dynamicCast() & 1) != 0)
                {
                  v74 = v92;
                  v75 = v93;
                  swift_bridgeObjectRelease();
                  v96 = v74;
                  v97 = v75;
                  *(_QWORD *)&v94 = 95;
                  *((_QWORD *)&v94 + 1) = 0xE100000000000000;
                  v92 = 45;
                  v93 = 0xE100000000000000;
                  sub_1C2F9B864();
                  sub_1C2FC9BC4();
                  swift_bridgeObjectRelease();
                  v76 = (void *)objc_opt_self();
                  v77 = (void *)sub_1C2FC99E4();
                  swift_bridgeObjectRelease();
                  v78 = objc_msgSend(v76, sel_convertLanguageCodeToSchemaLocale_, v77);

LABEL_57:
                  objc_msgSend(v52, sel_setAssetLocale_, v78);
                  v79 = sub_1C2F97160(v91);
                  sub_1C2F9BA74(v79, v80, v52, (SEL *)&selRef_setTrialNamespace_);
                  v68 = v52;
                  v81 = v90;
                  MEMORY[0x1C3BD0138]();
                  sub_1C2FBD7D4(*(_QWORD *)((*v81 & 0xFFFFFFFFFFFFF8) + 0x10));
                  sub_1C2FC9AEC();
                  sub_1C2FC9AD4();
LABEL_58:

                  return;
                }
                swift_bridgeObjectRelease();
              }
              else
              {
                swift_bridgeObjectRelease();
                sub_1C2F9BD60((uint64_t)&v96, &qword_1ED7AEF88);
              }
              v78 = 0;
              goto LABEL_57;
            }
            goto LABEL_67;
          }
LABEL_66:
          __break(1u);
LABEL_67:
          __break(1u);
          goto LABEL_68;
        }
LABEL_65:
        __break(1u);
        goto LABEL_66;
      }
      v84 = v30;
      v85 = (os_log_t)v4;
      v31 = swift_slowAlloc();
      v83 = swift_slowAlloc();
      *(_QWORD *)&v94 = v83;
      *(_DWORD *)v31 = 136315650;
      v32 = objc_msgSend(v29, sel_factor);
      v17 = v29;
      if (v32)
      {
        v96 = sub_1C2F9BA18(v32, (SEL *)&selRef_name);
        v97 = v33;
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF00);
        v34 = sub_1C2FC99FC();
        v96 = sub_1C2FC4294(v34, v35, (uint64_t *)&v94);
        sub_1C2FC9BA0();
        v82 = v29;

        swift_bridgeObjectRelease();
        *(_WORD *)(v31 + 12) = 2080;
        swift_bridgeObjectRetain();
        v36 = v88;
        v96 = sub_1C2FC4294(v88, v25, (uint64_t *)&v94);
        sub_1C2FC9BA0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v31 + 22) = 2080;
        v37 = sub_1C2F97160(v91);
        v96 = sub_1C2FC4294(v37, v38, (uint64_t *)&v94);
        sub_1C2FC9BA0();
        swift_bridgeObjectRelease();
        v4 = (unint64_t)v85;
        _os_log_impl(&dword_1C2F94000, v85, (os_log_type_t)v84, "Found asset=%s, version=%s, namespace=%s", (uint8_t *)v31, 0x20u);
        v39 = v83;
        swift_arrayDestroy();
        MEMORY[0x1C3BD0834](v39, -1, -1);
        MEMORY[0x1C3BD0834](v31, -1, -1);

        v40 = *(void (**)(char *, uint64_t))(v9 + 8);
        v40(v15, v99);
        v29 = v82;
        goto LABEL_31;
      }
LABEL_64:

      swift_bridgeObjectRelease();
      __break(1u);
      goto LABEL_65;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1C2F9BD60((uint64_t)&v96, &qword_1ED7AEF88);
  }
  if (qword_1ED7AF028 != -1)
    swift_once();
  v41 = __swift_project_value_buffer(v24, (uint64_t)qword_1ED7AF6F8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v17, v41, v24);
  v6 = a1;
  v4 = sub_1C2FC98E8();
  v42 = sub_1C2FC9B10();
  if (os_log_type_enabled((os_log_t)v4, v42))
  {
    v43 = (uint8_t *)swift_slowAlloc();
    v44 = swift_slowAlloc();
    *(_QWORD *)&v94 = v44;
    *(_DWORD *)v43 = 136315138;
    v45 = objc_msgSend((id)v6, sel_factor);
    if (v45)
    {
      v96 = sub_1C2F9BA18(v45, (SEL *)&selRef_name);
      v97 = v46;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF00);
      v47 = sub_1C2FC99FC();
      v96 = sub_1C2FC4294(v47, v48, (uint64_t *)&v94);
      sub_1C2FC9BA0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C2F94000, (os_log_t)v4, v42, "Failed to find the version for asset: %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BD0834](v44, -1, -1);
      MEMORY[0x1C3BD0834](v43, -1, -1);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v17, v99);
      return;
    }
    goto LABEL_63;
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v17, v24);
}

uint64_t sub_1C2F98748()
{
  id v0;
  id v1;
  NSObject *p_superclass;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  char v25;
  void *v26;
  id v27;
  os_log_type_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  id v35;
  os_log_type_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  unint64_t v43;
  char v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  char v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
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
  void *v68;
  uint64_t v69;
  os_log_type_t v70;
  _DWORD *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  os_log_type_t v77;
  _DWORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  os_log_type_t v83;
  _DWORD *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  os_log_type_t v89;
  _DWORD *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v96;
  int v97;
  NSObject *log;
  void *v99;
  _QWORD *v100;
  unint64_t v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;

  v106 = MEMORY[0x1E0DEE9D8];
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A5E8]), sel_init);
  p_superclass = &OBJC_METACLASS____TtC14SiriMessageBus28ImmutableConversationSession.superclass;
  v3 = &loc_1C2FCA000;
  if (!v1)
  {
    if (qword_1ED7AF028 != -1)
      swift_once();
    v69 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v69, (uint64_t)qword_1ED7AF6F8);
    OUTLINED_FUNCTION_44();
    v70 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_3(v70))
    {
      v71 = (_DWORD *)OUTLINED_FUNCTION_1();
      v72 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_62(v72);
      *v71 = 136315138;
      v73 = OUTLINED_FUNCTION_2((uint64_t)"com.apple.siri.tts");
      OUTLINED_FUNCTION_14(v73);
      OUTLINED_FUNCTION_4(&dword_1C2F94000, v74, v75, "Failed to create SELF asset set for %s");
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }
    goto LABEL_70;
  }
  v4 = v1;
  v5 = (void *)0x80000001C2FCB090;
  sub_1C2F9BA74(0xD000000000000015, 0x80000001C2FCB090, v1, (SEL *)&selRef_setAssetSetName_);
  v6 = (uint64_t)sub_1C2F974EC();
  OUTLINED_FUNCTION_22();
  if (!v6)
  {
    if (qword_1ED7AF028 != -1)
      swift_once();
    v76 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v76, (uint64_t)qword_1ED7AF6F8);
    OUTLINED_FUNCTION_44();
    v77 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_3(v77))
    {
      v78 = (_DWORD *)OUTLINED_FUNCTION_1();
      v79 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_62(v79);
      *v78 = 136315138;
      v80 = OUTLINED_FUNCTION_2((uint64_t)"com.apple.siri.tts");
      OUTLINED_FUNCTION_14(v80);
      OUTLINED_FUNCTION_4(&dword_1C2F94000, v81, v82, "Failed to create UAF asset set for %s");
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    return v106;
  }
  if (qword_1ED7AF028 != -1)
    goto LABEL_74;
LABEL_4:
  v7 = OUTLINED_FUNCTION_7();
  __swift_project_value_buffer(v7, (uint64_t)qword_1ED7AF6F8);
  OUTLINED_FUNCTION_44();
  v8 = OUTLINED_FUNCTION_54();
  if (OUTLINED_FUNCTION_3(v8))
  {
    v9 = OUTLINED_FUNCTION_1();
    v105 = OUTLINED_FUNCTION_1();
    *(_DWORD *)v9 = v3[245];
    *(_QWORD *)(v9 + 4) = sub_1C2FC4294(0xD000000000000015, 0x80000001C2FCB090, &v105);
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_4(&dword_1C2F94000, v10, v11, "Created UAFAssetSet for %s");
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_0();
  }

  v12 = sub_1C2F9B8B8((void *)v6);
  if (v12)
  {
    v13 = (unint64_t)sub_1C2F9B584(v12);
    OUTLINED_FUNCTION_22();
    if ((v13 & 0x8000000000000000) != 0 || (v13 & 0x4000000000000000) != 0)
    {
      swift_retain();
      v5 = (void *)sub_1C2FC9C54();
      OUTLINED_FUNCTION_53();
    }
    else
    {
      v5 = *(void **)(v13 + 16);
    }
    v99 = v5;
    if (!v5)
    {
      OUTLINED_FUNCTION_53();
      OUTLINED_FUNCTION_28();
      v89 = OUTLINED_FUNCTION_26();
      if (OUTLINED_FUNCTION_3(v89))
      {
        v90 = (_DWORD *)OUTLINED_FUNCTION_1();
        v91 = OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_62(v91);
        *v90 = v3[245];
        v92 = OUTLINED_FUNCTION_2((uint64_t)"com.apple.siri.tts");
        OUTLINED_FUNCTION_14(v92);
        OUTLINED_FUNCTION_4(&dword_1C2F94000, v93, v94, "Asset set: %s has returned empty assets when getAssets() is called.");
LABEL_65:
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }
      goto LABEL_66;
    }
    v96 = v6;
    v103 = 0;
    v101 = v13 & 0xC000000000000001;
    v6 = 4;
    v97 = v3[245];
    v3 = v5;
    v100 = (_QWORD *)v13;
    while (1)
    {
      v5 = (void *)(v6 - 4);
      if (v101)
        v14 = (id)MEMORY[0x1C3BD02AC](v6 - 4, v13);
      else
        v14 = *(id *)(v13 + 8 * v6);
      v15 = v14;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        swift_once();
        goto LABEL_4;
      }
      v104 = v6 - 3;
      v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A5E0]), sel_init);
      if (v16)
        break;
      v27 = v15;
      OUTLINED_FUNCTION_28();
      v28 = OUTLINED_FUNCTION_43();
      if (OUTLINED_FUNCTION_21(v28))
      {
        v29 = OUTLINED_FUNCTION_1();
        v105 = OUTLINED_FUNCTION_1();
        *(_DWORD *)v29 = v97;
        v30 = objc_msgSend(v27, sel_name);
        sub_1C2FC99F0();
        v32 = v31;

        v33 = OUTLINED_FUNCTION_57();
        *(_QWORD *)(v29 + 4) = sub_1C2FC4294(v33, v32, v34);

        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_5(&dword_1C2F94000, p_superclass, (os_log_type_t)v15, "Failed to create a SELF asset: %s");
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
      }

LABEL_44:
      ++v6;
      if ((void *)v104 == v99)
      {
LABEL_59:
        OUTLINED_FUNCTION_53();
        v6 = v96;
        goto LABEL_67;
      }
    }
    if (__OFADD__(v103++, 1))
      goto LABEL_73;
    v18 = v16;
    v19 = OUTLINED_FUNCTION_50((uint64_t)v16, sel_name);
    sub_1C2FC99F0();
    OUTLINED_FUNCTION_65();
    v20 = OUTLINED_FUNCTION_36();
    sub_1C2F9BA74(v20, v21, v18, (SEL *)&selRef_setAssetName_);
    v23 = OUTLINED_FUNCTION_50(v22, sel_metadata);
    p_superclass = sub_1C2FC999C();

    v102 = v15;
    if (!p_superclass[2].isa)
    {
      OUTLINED_FUNCTION_11();
      v35 = v15;
      OUTLINED_FUNCTION_28();
      v36 = OUTLINED_FUNCTION_54();
      if (os_log_type_enabled(v23, v36))
      {
        v37 = OUTLINED_FUNCTION_1();
        v105 = OUTLINED_FUNCTION_1();
        *(_DWORD *)v37 = 136315394;
        *(_QWORD *)(v37 + 4) = sub_1C2FC4294(0xD000000000000015, 0x80000001C2FCB090, &v105);
        swift_bridgeObjectRelease();
        *(_WORD *)(v37 + 12) = 2080;
        v38 = objc_msgSend(v35, sel_name);
        sub_1C2FC99F0();
        v40 = v39;

        v41 = OUTLINED_FUNCTION_57();
        *(_QWORD *)(v37 + 14) = sub_1C2FC4294(v41, v40, v42);

        OUTLINED_FUNCTION_55();
        OUTLINED_FUNCTION_39(&dword_1C2F94000, v23, v36, "ORCHAssetSetsReported: Asset set: %s, asset: %s has empty metadata.", (uint8_t *)v37);
        OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_0();
      }

LABEL_43:
      objc_msgSend(v4, sel_addAssets_, v18, v96);

      v13 = (unint64_t)v100;
      if (v103 == 5)
        goto LABEL_59;
      goto LABEL_44;
    }
    v24 = sub_1C2FC4980();
    if ((v25 & 1) != 0)
    {
      OUTLINED_FUNCTION_24();
      v26 = (void *)OUTLINED_FUNCTION_64();
      v24 = OUTLINED_FUNCTION_25();
    }
    else
    {
      v26 = 0;
    }
    OUTLINED_FUNCTION_58(v24, sel_setAssetVersion_);

    if (!p_superclass[2].isa)
      goto LABEL_34;
    v43 = sub_1C2FC4980();
    if ((v44 & 1) == 0)
      goto LABEL_34;
    v45 = (uint64_t *)((char *)p_superclass[7].isa + 16 * v43);
    v47 = *v45;
    v46 = v45[1];
    swift_bridgeObjectRetain();
    if (!v46)
      goto LABEL_34;
    if (v47 == 16717 && v46 == 0xE200000000000000)
    {
      OUTLINED_FUNCTION_22();
    }
    else
    {
      OUTLINED_FUNCTION_52();
      v49 = sub_1C2FC9CA8();
      OUTLINED_FUNCTION_22();
      if ((v49 & 1) == 0)
      {
LABEL_34:
        OUTLINED_FUNCTION_11();
LABEL_35:
        v50 = v15;
        p_superclass = v18;
        v51 = v50;
        v52 = p_superclass;
        OUTLINED_FUNCTION_28();
        v53 = OUTLINED_FUNCTION_54();
        if (OUTLINED_FUNCTION_3(v53))
        {
          v54 = OUTLINED_FUNCTION_1();
          v105 = OUTLINED_FUNCTION_1();
          *(_DWORD *)v54 = 136315650;
          OUTLINED_FUNCTION_2((uint64_t)"com.apple.siri.tts");
          sub_1C2FC9BA0();
          v55 = swift_bridgeObjectRelease();
          *(_WORD *)(v54 + 12) = 2080;
          v56 = OUTLINED_FUNCTION_50(v55, sel_name);
          log = v50;
          v57 = sub_1C2FC99F0();
          v59 = v58;

          v60 = sub_1C2FC4294(v57, v59, &v105);
          OUTLINED_FUNCTION_49(v60);
          sub_1C2FC9BA0();

          OUTLINED_FUNCTION_55();
          *(_WORD *)(v54 + 22) = 2080;
          v61 = sub_1C2F9BAC8(v52);
          if (v62)
          {
            v63 = v62;
          }
          else
          {
            v61 = 0;
            v63 = 0xE000000000000000;
          }
          v64 = sub_1C2FC4294(v61, v63, &v105);
          OUTLINED_FUNCTION_49(v64);
          sub_1C2FC9BA0();

          OUTLINED_FUNCTION_22();
          _os_log_impl(&dword_1C2F94000, log, (os_log_type_t)p_superclass, "ORCHAssetSetsReported: Asset set: %s, asset: %s, version: %s ", (uint8_t *)v54, 0x20u);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_0();
        }

        goto LABEL_43;
      }
    }
    sub_1C2FC1BE4(0x7265567465737341, 0xEC0000006E6F6973, (uint64_t)p_superclass);
    v66 = v65;
    v67 = OUTLINED_FUNCTION_11();
    if (v66)
    {
      v68 = (void *)OUTLINED_FUNCTION_64();
      v67 = OUTLINED_FUNCTION_25();
    }
    else
    {
      v68 = 0;
    }
    OUTLINED_FUNCTION_58(v67, sel_setAssetVersion_);

    goto LABEL_35;
  }
  OUTLINED_FUNCTION_28();
  v83 = OUTLINED_FUNCTION_26();
  if (OUTLINED_FUNCTION_3(v83))
  {
    v84 = (_DWORD *)OUTLINED_FUNCTION_1();
    v85 = OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_62(v85);
    *v84 = v3[245];
    v86 = OUTLINED_FUNCTION_2((uint64_t)"com.apple.siri.tts");
    OUTLINED_FUNCTION_14(v86);
    OUTLINED_FUNCTION_4(&dword_1C2F94000, v87, v88, "There are no assets for asset set: %s");
    goto LABEL_65;
  }
LABEL_66:

LABEL_67:
  v0 = v4;
  MEMORY[0x1C3BD0138]();
  if (*(_QWORD *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1C2FC9AE0();
  OUTLINED_FUNCTION_52();
  sub_1C2FC9AEC();
  sub_1C2FC9AD4();

LABEL_70:
  return v106;
}

void sub_1C2F99228(uint64_t a1)
{
  uint64_t v1;
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
  char *v25;
  uint64_t v26;
  void (*v27)(_QWORD, _QWORD, _QWORD);
  uint64_t v28;
  void (*v29)(_QWORD, _QWORD, _QWORD);
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  _BOOL4 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t EnumTagSinglePayload;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
  char *v45;
  char v46;
  void (*v47)(char *, uint64_t);
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(_QWORD, _QWORD, _QWORD);
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66[3];
  uint64_t v67;

  v63 = OUTLINED_FUNCTION_7();
  v60 = *(_QWORD *)(v63 - 8);
  MEMORY[0x1E0C80A78](v63);
  OUTLINED_FUNCTION_23();
  v64 = v4 - v3;
  v5 = OUTLINED_FUNCTION_59();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_8();
  v61 = v7;
  OUTLINED_FUNCTION_37();
  MEMORY[0x1E0C80A78](v8);
  v58 = (char *)&v55 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEFF0);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_23();
  v14 = v13 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_8();
  v57 = v16;
  OUTLINED_FUNCTION_37();
  v18 = MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v55 - v19;
  v21 = MEMORY[0x1E0C80A78](v18);
  v23 = (char *)&v55 - v22;
  MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v55 - v24;
  v65 = v1;
  v26 = v1 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_currentSessionId;
  OUTLINED_FUNCTION_34();
  v62 = v6;
  v27 = *(void (**)(_QWORD, _QWORD, _QWORD))(v6 + 16);
  v59 = a1;
  v28 = a1;
  v29 = v27;
  v27(v25, v28, v5);
  OUTLINED_FUNCTION_66((uint64_t)v25, 0);
  v30 = v14 + *(int *)(v10 + 48);
  sub_1C2F9B940(v26, v14);
  OUTLINED_FUNCTION_40((uint64_t)v25);
  OUTLINED_FUNCTION_32(v14);
  if (v31)
  {
    sub_1C2F9BD60((uint64_t)v25, &qword_1ED7AE750);
    OUTLINED_FUNCTION_32(v30);
    if (v31)
    {
      sub_1C2F9BD60(v14, &qword_1ED7AE750);
LABEL_17:
      OUTLINED_FUNCTION_66((uint64_t)v20, 1);
      OUTLINED_FUNCTION_34();
      sub_1C2F9B9D0((uint64_t)v20, v26);
      swift_endAccess();
      OUTLINED_FUNCTION_61(OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetsForLogging);
      OUTLINED_FUNCTION_61(OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetSetsForLogging);
      goto LABEL_20;
    }
    goto LABEL_9;
  }
  sub_1C2F9B940(v14, (uint64_t)v23);
  OUTLINED_FUNCTION_32(v30);
  if (v31)
  {
    sub_1C2F9BD60((uint64_t)v25, &qword_1ED7AE750);
    (*(void (**)(char *, uint64_t))(v62 + 8))(v23, v5);
LABEL_9:
    sub_1C2F9BD60(v14, &qword_1ED7AEFF0);
    v49 = v60;
    goto LABEL_10;
  }
  v43 = v62;
  v44 = *(void (**)(char *, uint64_t, uint64_t))(v62 + 32);
  v56 = v29;
  v45 = v58;
  v44(v58, v30, v5);
  sub_1C2F9B994((unint64_t *)&unk_1ED7AF078, MEMORY[0x1E0CB09D0]);
  v46 = sub_1C2FC99D8();
  v47 = *(void (**)(char *, uint64_t))(v43 + 8);
  v48 = v45;
  v29 = v56;
  v47(v48, v5);
  sub_1C2F9BD60((uint64_t)v25, &qword_1ED7AE750);
  v47(v23, v5);
  v49 = v60;
  sub_1C2F9BD60(v14, &qword_1ED7AE750);
  if ((v46 & 1) != 0)
    goto LABEL_17;
LABEL_10:
  if (qword_1ED7AF028 != -1)
    swift_once();
  v32 = v63;
  v33 = __swift_project_value_buffer(v63, (uint64_t)qword_1ED7AF6F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v49 + 16))(v64, v33, v32);
  v29(v61, v59, v5);
  swift_retain_n();
  v34 = sub_1C2FC98E8();
  v35 = sub_1C2FC9B10();
  v36 = os_log_type_enabled(v34, v35);
  v37 = v62;
  if (v36)
  {
    v38 = OUTLINED_FUNCTION_1();
    v60 = OUTLINED_FUNCTION_1();
    v66[0] = v60;
    *(_DWORD *)v38 = 136315394;
    v39 = v57;
    OUTLINED_FUNCTION_40(v26);
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v39, 1, v5);
    if ((_DWORD)EnumTagSinglePayload)
    {
      OUTLINED_FUNCTION_35(EnumTagSinglePayload, &qword_1ED7AE750);
      v41 = 0xE300000000000000;
      v42 = 7104878;
    }
    else
    {
      v50 = ((uint64_t (*)(char *, uint64_t, uint64_t))v29)(v58, v39, v5);
      OUTLINED_FUNCTION_35(v50, &qword_1ED7AE750);
      v42 = sub_1C2FC89E8();
      v41 = v51;
      OUTLINED_FUNCTION_42();
    }
    v67 = sub_1C2FC4294(v42, v41, v66);
    OUTLINED_FUNCTION_51();
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_11();
    *(_WORD *)(v38 + 12) = 2080;
    sub_1C2F9B994((unint64_t *)&unk_1ED7AE740, MEMORY[0x1E0CB09F0]);
    v52 = v61;
    v53 = sub_1C2FC9C9C();
    v67 = sub_1C2FC4294(v53, v54, v66);
    sub_1C2FC9BA0();
    OUTLINED_FUNCTION_11();
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v52, v5);
    OUTLINED_FUNCTION_39(&dword_1C2F94000, v34, v35, "currentSessionId: %s is not the same as sessionId: %s", (uint8_t *)v38);
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_42();

  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v64, v63);
LABEL_20:
  OUTLINED_FUNCTION_27();
}

void sub_1C2F997A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
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
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  void (*v38)(uint64_t, uint64_t);
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t EnumTagSinglePayload;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t, uint64_t);
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v67 = a3;
  v65 = a2;
  v5 = OUTLINED_FUNCTION_7();
  v76 = *(_QWORD *)(v5 - 8);
  v77 = v5;
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_23();
  v8 = v7 - v6;
  v9 = OUTLINED_FUNCTION_59();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_8();
  v75 = v11;
  OUTLINED_FUNCTION_37();
  MEMORY[0x1E0C80A78](v12);
  v66 = (char *)&v65 - v13;
  OUTLINED_FUNCTION_37();
  MEMORY[0x1E0C80A78](v14);
  v70 = (uint64_t)&v65 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEFF0);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_23();
  v20 = v19 - v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_8();
  v69 = v22;
  OUTLINED_FUNCTION_37();
  v24 = MEMORY[0x1E0C80A78](v23);
  v26 = (char *)&v65 - v25;
  MEMORY[0x1E0C80A78](v24);
  v28 = (char *)&v65 - v27;
  v73 = v3;
  v29 = v3 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_currentSessionId;
  OUTLINED_FUNCTION_34();
  v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16);
  v71 = a1;
  v72 = v30;
  OUTLINED_FUNCTION_45((uint64_t)v28, a1, v30);
  __swift_storeEnumTagSinglePayload((uint64_t)v28, 0, 1, v9);
  v31 = v20 + *(int *)(v16 + 48);
  v68 = v29;
  sub_1C2F9B940(v29, v20);
  OUTLINED_FUNCTION_40((uint64_t)v28);
  OUTLINED_FUNCTION_33(v20);
  v74 = v10;
  if (!v35)
  {
    sub_1C2F9B940(v20, (uint64_t)v26);
    OUTLINED_FUNCTION_33(v31);
    if (!v35)
    {
      v36 = v70;
      OUTLINED_FUNCTION_45(v70, v31, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32));
      sub_1C2F9B994((unint64_t *)&unk_1ED7AF078, MEMORY[0x1E0CB09D0]);
      v37 = sub_1C2FC99D8();
      v38 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
      v38(v36, v9);
      sub_1C2F9BD60((uint64_t)v28, &qword_1ED7AE750);
      v38((uint64_t)v26, v9);
      v32 = v76;
      v33 = v77;
      sub_1C2F9BD60(v20, &qword_1ED7AE750);
      v34 = v73;
      if ((v37 & 1) == 0)
        goto LABEL_16;
      goto LABEL_11;
    }
    sub_1C2F9BD60((uint64_t)v28, &qword_1ED7AE750);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v26, v9);
    v32 = v76;
    v33 = v77;
LABEL_9:
    sub_1C2F9BD60(v20, &qword_1ED7AEFF0);
    goto LABEL_16;
  }
  sub_1C2F9BD60((uint64_t)v28, &qword_1ED7AE750);
  OUTLINED_FUNCTION_33(v31);
  v32 = v76;
  v33 = v77;
  if (!v35)
    goto LABEL_9;
  sub_1C2F9BD60(v20, &qword_1ED7AE750);
  v34 = v73;
LABEL_11:
  v39 = *(_QWORD *)(v34 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetsForLogging);
  if (v39)
  {
    if (v39 >> 62)
    {
      OUTLINED_FUNCTION_24();
      v40 = sub_1C2FC9C54();
    }
    else
    {
      v40 = *(_QWORD *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
      OUTLINED_FUNCTION_24();
    }
    v41 = (uint64_t)v66;
    if (v40)
    {
      swift_bridgeObjectRetain();
      v42 = OUTLINED_FUNCTION_52();
      sub_1C2FA5274(v42, v43);
      OUTLINED_FUNCTION_22();
      OUTLINED_FUNCTION_25();
    }
    else
    {
      OUTLINED_FUNCTION_25();
      if (qword_1ED7AF028 != -1)
        swift_once();
      __swift_project_value_buffer(v33, (uint64_t)qword_1ED7AF6F8);
      OUTLINED_FUNCTION_45(v41, v71, v72);
      v59 = v67;
      swift_bridgeObjectRetain_n();
      v60 = sub_1C2FC98E8();
      v61 = sub_1C2FC9B10();
      if (os_log_type_enabled(v60, v61))
      {
        v62 = OUTLINED_FUNCTION_1();
        v77 = OUTLINED_FUNCTION_1();
        v79 = v77;
        *(_DWORD *)v62 = 136315394;
        sub_1C2F9B994(qword_1ED7AE740, MEMORY[0x1E0CB09F0]);
        v63 = OUTLINED_FUNCTION_48();
        v78 = OUTLINED_FUNCTION_60(v63, v64);
        OUTLINED_FUNCTION_51();
        OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_6();
        *(_WORD *)(v62 + 12) = 2080;
        swift_bridgeObjectRetain();
        v78 = sub_1C2FC4294(v65, v59, &v79);
        sub_1C2FC9BA0();
        swift_bridgeObjectRelease_n();
        OUTLINED_FUNCTION_39(&dword_1C2F94000, v60, v61, "Failed to find any assets for instrumentation, for sessionId: %s and requestId: %s", (uint8_t *)v62);
        OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_0();
      }
      OUTLINED_FUNCTION_6();

      OUTLINED_FUNCTION_46();
    }
    goto LABEL_24;
  }
LABEL_16:
  if (qword_1ED7AF028 != -1)
    swift_once();
  v44 = __swift_project_value_buffer(v33, (uint64_t)qword_1ED7AF6F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v8, v44, v33);
  OUTLINED_FUNCTION_45(v75, v71, v72);
  swift_retain_n();
  v45 = v33;
  v46 = sub_1C2FC98E8();
  v47 = sub_1C2FC9B10();
  if (os_log_type_enabled(v46, v47))
  {
    v73 = v8;
    v48 = OUTLINED_FUNCTION_1();
    v79 = OUTLINED_FUNCTION_1();
    *(_DWORD *)v48 = 136315394;
    v49 = v69;
    OUTLINED_FUNCTION_40(v68);
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v49, 1, v9);
    if ((_DWORD)EnumTagSinglePayload)
    {
      OUTLINED_FUNCTION_35(EnumTagSinglePayload, &qword_1ED7AE750);
      v51 = 0xE300000000000000;
      v52 = 7104878;
    }
    else
    {
      v55 = v72(v70, v49, v9);
      OUTLINED_FUNCTION_35(v55, &qword_1ED7AE750);
      v52 = sub_1C2FC89E8();
      v51 = v56;
      OUTLINED_FUNCTION_6();
    }
    v78 = sub_1C2FC4294(v52, v51, &v79);
    sub_1C2FC9BA0();
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_11();
    *(_WORD *)(v48 + 12) = 2080;
    sub_1C2F9B994(qword_1ED7AE740, MEMORY[0x1E0CB09F0]);
    v57 = OUTLINED_FUNCTION_48();
    v78 = OUTLINED_FUNCTION_60(v57, v58);
    sub_1C2FC9BA0();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_39(&dword_1C2F94000, v46, v47, "currentSessionId: %s is not the same as sessionId: %s", (uint8_t *)v48);
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_47();
  v53 = OUTLINED_FUNCTION_52();
  v54(v53);

  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v8, v45);
LABEL_24:
  OUTLINED_FUNCTION_27();
}

void sub_1C2F99EE0(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD *v3;
  unint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  os_log_type_t v21;
  uint8_t *v22;
  unint64_t v23;
  unint64_t v24;
  unsigned __int8 v25;
  BOOL v26;
  unint64_t v27;
  uint64_t v28;
  unsigned __int8 *v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  SEL *v41;
  uint64_t v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  _DWORD *v52;
  uint64_t v53;
  uint64_t v54;
  unsigned __int8 v55;
  uint64_t v56;
  unsigned __int8 *v57;
  unsigned int v58;
  uint64_t v59;
  unsigned __int8 v60;
  uint64_t v61;
  uint64_t v62;
  unsigned __int8 *v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  os_log_type_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v74 = a1;
  v75 = a2;
  sub_1C2F9B864();
  v3 = (_QWORD *)sub_1C2FC9BB8();
  v4 = v3[2];
  if (v4 <= 1)
  {
    OUTLINED_FUNCTION_13();
    if (qword_1ED7AF028 != -1)
      swift_once();
    v5 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_15(v5, (uint64_t)qword_1ED7AF6F8);
    sub_1C2FC98E8();
    v6 = OUTLINED_FUNCTION_26();
    if (os_log_type_enabled(v2, v6))
    {
      v7 = (uint8_t *)OUTLINED_FUNCTION_1();
      v74 = OUTLINED_FUNCTION_1();
      *(_DWORD *)v7 = 136315138;
      v8 = swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_18(v8, v9, v10, v11);
      OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_30();
      _os_log_impl(&dword_1C2F94000, v2, v6, "The assertVersion=%s doesn't follow semantic version scheme", v7, 0xCu);
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    goto LABEL_18;
  }
  v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A508]), sel_init);
  if (!v12)
  {
    OUTLINED_FUNCTION_13();
    if (qword_1ED7AF028 != -1)
      swift_once();
    v20 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v20, (uint64_t)qword_1ED7AF6F8);
    OUTLINED_FUNCTION_44();
    v21 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_3(v21))
    {
      v22 = (uint8_t *)OUTLINED_FUNCTION_1();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_1C2F94000, v2, (os_log_type_t)&v74, "Failed to create SISchemaVersion", v22, 2u);
      OUTLINED_FUNCTION_0();
    }
    goto LABEL_95;
  }
  if (v3[2])
  {
    v2 = v12;
    v13 = v3[4];
    v14 = v3[5];
    v15 = HIBYTE(v14) & 0xF;
    v16 = v13 & 0xFFFFFFFFFFFFLL;
    if ((v14 & 0x2000000000000000) != 0)
      v17 = HIBYTE(v14) & 0xF;
    else
      v17 = v13 & 0xFFFFFFFFFFFFLL;
    if (!v17)
      goto LABEL_89;
    if ((v14 & 0x1000000000000000) == 0)
    {
      if ((v14 & 0x2000000000000000) == 0)
      {
        if ((v13 & 0x1000000000000000) != 0)
        {
          v18 = (unsigned __int8 *)((v14 & 0xFFFFFFFFFFFFFFFLL) + 32);
        }
        else
        {
          OUTLINED_FUNCTION_36();
          v18 = (unsigned __int8 *)sub_1C2FC9C24();
        }
        v19 = sub_1C2F9AE44(v18, v16, 10);
        LOBYTE(v15) = BYTE4(v19) & 1;
        v13 = (unint64_t)v19;
LABEL_50:
        if ((v15 & 1) == 0)
          goto LABEL_51;
LABEL_89:
        OUTLINED_FUNCTION_13();
        if (qword_1ED7AF028 == -1)
          goto LABEL_90;
        goto LABEL_99;
      }
      v74 = v3[4];
      v75 = v14 & 0xFFFFFFFFFFFFFFLL;
      v23 = v13 >> 8;
      v24 = v13 >> 16;
      if (v13 == 43)
      {
        if (v15)
        {
          if (v15 != 1)
          {
            v13 = (BYTE1(v13) - 48);
            if (v13 <= 9)
            {
              if (v15 == 2)
                goto LABEL_49;
              if ((v24 - 48) <= 9u)
              {
                v13 = 10 * (_DWORD)v13 + (v24 - 48);
                v28 = v15 - 3;
                if (v15 != 3)
                {
                  v29 = (unsigned __int8 *)&v74 + 3;
                  while (1)
                  {
                    v30 = *v29 - 48;
                    if (v30 > 9)
                      goto LABEL_46;
                    v31 = 10 * v13;
                    if ((v31 & 0xFFFFFFFF00000000) != 0)
                      goto LABEL_46;
                    v13 = v31 + v30;
                    if (__CFADD__((_DWORD)v31, v30))
                      goto LABEL_46;
                    LOBYTE(v15) = 0;
                    ++v29;
                    if (!--v28)
                      goto LABEL_50;
                  }
                }
                goto LABEL_49;
              }
            }
            goto LABEL_46;
          }
          goto LABEL_100;
        }
      }
      else
      {
        if (v13 != 45)
        {
          if (v15)
          {
            v13 = (v13 - 48);
            if (v13 <= 9)
            {
              if (v15 == 1)
                goto LABEL_49;
              v55 = v23 - 48;
              if (v55 <= 9u)
              {
                v13 = 10 * (_DWORD)v13 + v55;
                v56 = v15 - 2;
                if (v15 != 2)
                {
                  v57 = (unsigned __int8 *)&v74 + 2;
                  while (1)
                  {
                    v58 = *v57 - 48;
                    if (v58 > 9)
                      goto LABEL_46;
                    v59 = 10 * v13;
                    if ((v59 & 0xFFFFFFFF00000000) != 0)
                      goto LABEL_46;
                    v13 = v59 + v58;
                    if (__CFADD__((_DWORD)v59, v58))
                      goto LABEL_46;
                    LOBYTE(v15) = 0;
                    ++v57;
                    if (!--v56)
                      goto LABEL_50;
                  }
                }
                goto LABEL_49;
              }
            }
          }
LABEL_46:
          v13 = 0;
LABEL_47:
          LOBYTE(v15) = 1;
          goto LABEL_50;
        }
        if (v15)
        {
          if (v15 != 1)
          {
            v25 = BYTE1(v13) - 48;
            if ((BYTE1(v13) - 48) <= 9u)
            {
              v13 = 0;
              v26 = v25 == 0;
              v27 = -v25;
              if (!v26)
                goto LABEL_47;
              if (v15 == 2)
              {
                LOBYTE(v15) = 0;
                v13 = v27;
                goto LABEL_50;
              }
              v60 = v24 - 48;
              if (v60 <= 9u)
              {
                v61 = 10 * v27;
                if ((v61 & 0xFFFFFFFF00000000) == 0)
                {
                  v13 = v61 - v60;
                  if (v61 >= v60)
                  {
                    v62 = v15 - 3;
                    if (v15 != 3)
                    {
                      v63 = (unsigned __int8 *)&v74 + 3;
                      while (1)
                      {
                        v64 = *v63 - 48;
                        if (v64 > 9)
                          goto LABEL_46;
                        v65 = 10 * v13;
                        if ((v65 & 0xFFFFFFFF00000000) != 0)
                          goto LABEL_46;
                        v13 = v65 - v64;
                        if (v65 < v64)
                          goto LABEL_46;
                        LOBYTE(v15) = 0;
                        ++v63;
                        if (!--v62)
                          goto LABEL_50;
                      }
                    }
LABEL_49:
                    LOBYTE(v15) = 0;
                    goto LABEL_50;
                  }
                }
              }
            }
            goto LABEL_46;
          }
LABEL_100:
          v13 = 0;
          goto LABEL_50;
        }
        __break(1u);
      }
      __break(1u);
      goto LABEL_103;
    }
  }
  else
  {
    __break(1u);
  }
  OUTLINED_FUNCTION_24();
  v66 = OUTLINED_FUNCTION_36();
  v13 = sub_1C2F9AD60(v66, v67, 10);
  OUTLINED_FUNCTION_25();
  if ((v13 & 0x100000000) != 0)
    goto LABEL_89;
LABEL_51:
  if (v3[2] < 2uLL)
  {
    __break(1u);
LABEL_99:
    swift_once();
LABEL_90:
    v68 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_15(v68, (uint64_t)qword_1ED7AF6F8);
    sub_1C2FC98E8();
    v69 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_21(v69))
    {
      OUTLINED_FUNCTION_1();
      v74 = OUTLINED_FUNCTION_1();
      v70 = OUTLINED_FUNCTION_29(4.8149e-34);
      OUTLINED_FUNCTION_18(v70, v71, v72, v73);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_30();
      v48 = "Failed to convert major version to UInt for version=%s";
      goto LABEL_92;
    }
    goto LABEL_94;
  }
  v32 = v3[6];
  v33 = v3[7];
  swift_bridgeObjectRetain();
  v34 = sub_1C2F9A6E0(v32, v33);
  if ((v34 & 0x100000000) != 0)
  {
    OUTLINED_FUNCTION_13();
    if (qword_1ED7AF028 != -1)
      swift_once();
    v42 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_15(v42, (uint64_t)qword_1ED7AF6F8);
    sub_1C2FC98E8();
    v43 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_21(v43))
    {
      OUTLINED_FUNCTION_1();
      v74 = OUTLINED_FUNCTION_1();
      v44 = OUTLINED_FUNCTION_29(4.8149e-34);
      OUTLINED_FUNCTION_18(v44, v45, v46, v47);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_30();
      v48 = "Failed to convert minor version to UInt for version=%s";
LABEL_92:
      OUTLINED_FUNCTION_5(&dword_1C2F94000, v13, (os_log_type_t)v3, v48);
      OUTLINED_FUNCTION_12();
LABEL_93:
      OUTLINED_FUNCTION_0();
    }
LABEL_94:

    OUTLINED_FUNCTION_46();
LABEL_95:

    goto LABEL_96;
  }
  v35 = v34;
  if (v4 < 3)
  {
LABEL_57:
    -[NSObject setMajor:](v2, sel_setMajor_, v13);
    -[NSObject setMinor:](v2, sel_setMinor_, v35);
    if (v4 != 4)
    {
      OUTLINED_FUNCTION_13();
      goto LABEL_96;
    }
    if (v3[2] >= 4uLL)
    {
      OUTLINED_FUNCTION_24();
      OUTLINED_FUNCTION_13();
      v39 = OUTLINED_FUNCTION_36();
      sub_1C2F9BA74(v39, v40, v2, v41);
      goto LABEL_96;
    }
    goto LABEL_104;
  }
  if (v3[2] >= 3uLL)
  {
    v36 = v3[8];
    v37 = v3[9];
    swift_bridgeObjectRetain();
    v38 = sub_1C2F9A6E0(v36, v37);
    if ((v38 & 0x100000000) != 0)
    {
      if (qword_1ED7AF028 == -1)
        goto LABEL_66;
      goto LABEL_105;
    }
    -[NSObject setPatch:](v2, sel_setPatch_, v38);
    goto LABEL_57;
  }
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
LABEL_105:
  swift_once();
LABEL_66:
  v49 = OUTLINED_FUNCTION_7();
  v50 = __swift_project_value_buffer(v49, (uint64_t)qword_1ED7AF6F8);
  swift_bridgeObjectRetain();
  sub_1C2FC98E8();
  v51 = OUTLINED_FUNCTION_43();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = (_DWORD *)OUTLINED_FUNCTION_1();
    v74 = OUTLINED_FUNCTION_1();
    *v52 = 136315138;
    v53 = v3[8];
    v54 = v3[9];
    swift_bridgeObjectRetain();
    sub_1C2FC4294(v53, v54, &v74);
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_46();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_5(&dword_1C2F94000, v50, v51, "Malformed value for patch=%s");
    OUTLINED_FUNCTION_12();
    goto LABEL_93;
  }

LABEL_18:
  OUTLINED_FUNCTION_46();
LABEL_96:
  OUTLINED_FUNCTION_20();
}

unint64_t sub_1C2F9A6E0(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unint64_t v8;
  char v9;
  int v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 *v23;
  unsigned int v24;
  uint64_t v25;
  _QWORD v26[2];
  char v27;

  v3 = HIBYTE(a2) & 0xF;
  v4 = a1 & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease();
    v21 = 0;
    LOBYTE(v20) = 1;
    return v21 | ((unint64_t)v20 << 32);
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((a1 & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)sub_1C2FC9C24();
      v7 = sub_1C2F9AE44(v6, v4, 10);
      LODWORD(v8) = (_DWORD)v7;
      v27 = BYTE4(v7) & 1;
      v9 = BYTE4(v7) & 1;
      goto LABEL_38;
    }
    v26[0] = a1;
    v26[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    v10 = a1;
    if (a1 == 43)
    {
      if (v3)
      {
        if (v3 != 1)
        {
          LODWORD(v8) = (BYTE1(a1) - 48);
          if (v8 <= 9)
          {
            v15 = v3 - 2;
            if (v15)
            {
              v16 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                v17 = *v16 - 48;
                if (v17 > 9)
                  goto LABEL_35;
                v18 = 10 * v8;
                if ((v18 & 0xFFFFFFFF00000000) != 0)
                  goto LABEL_35;
                LODWORD(v8) = v18 + v17;
                if (__CFADD__((_DWORD)v18, v17))
                  goto LABEL_35;
                v9 = 0;
                ++v16;
                if (!--v15)
                  goto LABEL_38;
              }
            }
            goto LABEL_37;
          }
        }
        goto LABEL_35;
      }
    }
    else
    {
      if (a1 != 45)
      {
        if (v3)
        {
          LODWORD(v8) = (a1 - 48);
          if (v8 <= 9)
          {
            v19 = v3 - 1;
            if (v19)
            {
              v23 = (unsigned __int8 *)v26 + 1;
              while (1)
              {
                v24 = *v23 - 48;
                if (v24 > 9)
                  goto LABEL_35;
                v25 = 10 * v8;
                if ((v25 & 0xFFFFFFFF00000000) != 0)
                  goto LABEL_35;
                LODWORD(v8) = v25 + v24;
                if (__CFADD__((_DWORD)v25, v24))
                  goto LABEL_35;
                v9 = 0;
                ++v23;
                if (!--v19)
                  goto LABEL_38;
              }
            }
            goto LABEL_37;
          }
        }
        goto LABEL_35;
      }
      if (v3)
      {
        if (v3 != 1 && (BYTE1(a1) - 48) <= 9u)
        {
          v10 = 0;
          LODWORD(v8) = -(BYTE1(a1) - 48);
          if (BYTE1(a1) == 48)
          {
            v11 = v3 - 2;
            if (v11)
            {
              v12 = (unsigned __int8 *)v26 + 2;
              while (1)
              {
                v13 = *v12 - 48;
                if (v13 > 9)
                  goto LABEL_35;
                v14 = 10 * v8;
                if ((v14 & 0xFFFFFFFF00000000) != 0)
                  goto LABEL_35;
                LODWORD(v8) = v14 - v13;
                if (v14 < v13)
                  goto LABEL_35;
                v9 = 0;
                ++v12;
                if (!--v11)
                  goto LABEL_38;
              }
            }
LABEL_37:
            v9 = 0;
            goto LABEL_38;
          }
LABEL_53:
          v9 = 1;
          LODWORD(v8) = v10;
          goto LABEL_38;
        }
LABEL_35:
        LODWORD(v8) = 0;
        v9 = 1;
LABEL_38:
        swift_bridgeObjectRelease();
        LODWORD(v20) = v9 & 1;
        goto LABEL_39;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_53;
  }
  v8 = sub_1C2F9AD60(a1, a2, 10);
  swift_bridgeObjectRelease();
  v20 = HIDWORD(v8) & 1;
LABEL_39:
  v21 = v8;
  if ((_DWORD)v20)
    v21 = 0;
  return v21 | ((unint64_t)v20 << 32);
}

void sub_1C2F9A93C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unsigned int v3;
  unint64_t v5;
  unint64_t v6;

  if (*(_BYTE *)(v0 + 33) == 1)
  {
    v1 = 0;
    v2 = MEMORY[0x1E0DEE9D8];
    do
    {
      v3 = byte_1E7CDEE60[v1 + 32];
      if (v3 > 7 || ((1 << v3) & 0x8C) == 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_1C2F9B730(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v6 = *(_QWORD *)(v2 + 16);
        v5 = *(_QWORD *)(v2 + 24);
        if (v6 >= v5 >> 1)
          sub_1C2F9B730((char *)(v5 > 1), v6 + 1, 1);
        *(_QWORD *)(v2 + 16) = v6 + 1;
        *(_BYTE *)(v2 + v6 + 32) = v3;
      }
      ++v1;
    }
    while (v1 != 8);
    swift_bridgeObjectRelease();
  }
  OUTLINED_FUNCTION_19();
}

uint64_t sub_1C2F9AA50()
{
  uint64_t v0;

  swift_release();
  sub_1C2F9BD60(v0 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_currentSessionId, &qword_1ED7AE750);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetSetObserverProvider);
  return v0;
}

uint64_t sub_1C2F9AACC()
{
  sub_1C2F9AA50();
  return swift_deallocClassInstance();
}

uint64_t sub_1C2F9AAF0()
{
  return type metadata accessor for AssetInstrumentationLogger();
}

uint64_t type metadata accessor for AssetInstrumentationLogger()
{
  uint64_t result;

  result = qword_1ED7AEAB8;
  if (!qword_1ED7AEAB8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1C2F9AB30()
{
  unint64_t v0;

  sub_1C2F9ABDC();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_1C2F9ABDC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED7AE758)
  {
    sub_1C2FC8A0C();
    v0 = sub_1C2FC9B94();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED7AE758);
  }
}

_QWORD *sub_1C2F9AC30@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1C2F9AC3C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

void sub_1C2F9AC48(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  *a2 = sub_1C2FBD6C0(*a1, *v2);
  OUTLINED_FUNCTION_31();
}

uint64_t sub_1C2F9AC70(uint64_t *a1)
{
  return sub_1C2FBD6C8(*a1);
}

BOOL sub_1C2F9AC78(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1C2FBD6D8(*a1, *v1);
}

BOOL sub_1C2F9AC84(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1C2FBD6E4(*a1, *v1);
}

BOOL sub_1C2F9AC90(uint64_t *a1, uint64_t *a2)
{
  return sub_1C2FC1538(*a1, *a2);
}

void *sub_1C2F9AC9C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1C2FC9C6C();
  __break(1u);
  return result;
}

uint64_t sub_1C2F9AD60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_1C2FC9A80();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_1C2F9B0C4();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_1C2FC9C24();
  }
LABEL_7:
  v11 = sub_1C2F9AE44(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11 | ((((unint64_t)v11 >> 32) & 1) << 32);
}

unsigned __int8 *sub_1C2F9AE44(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  unsigned __int8 v13;
  unint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  unint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned int v28;
  unsigned int v29;
  char v30;
  unint64_t v31;
  unsigned __int8 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          v8 = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v24 = v21 + v22;
            v8 = v23 + v24;
            if (__CFADD__((_DWORD)v23, v24))
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          v28 = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v32 = v29 + v30;
            v28 = v31 + v32;
            if (__CFADD__((_DWORD)v31, v32))
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          v8 = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v15 = v10 + v11;
            v8 = v14 - v15;
            if (v14 < v15)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1C2F9B0C4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_1C2F9B120();
  v4 = sub_1C2F9B154(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1C2F9B120()
{
  return sub_1C2FC9A8C();
}

uint64_t sub_1C2F9B154(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    sub_1C2F9B298(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      sub_1C2FC4778(v9, 0);
      v12 = v11;
      sub_1C2F9B384(v16, v11 + 32, v10, a1, a2, a3, a4);
      v14 = v13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v14 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v12 = MEMORY[0x1E0DEE9D8];
    }
    v15 = MEMORY[0x1C3BD00A8](v12 + 32, *(_QWORD *)(v12 + 16));
    swift_release();
    return v15;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x1C3BD00A8);
LABEL_9:
      sub_1C2FC9C24();
      goto LABEL_12;
    }
    v16[0] = a3;
    v16[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1C3BD00A8]((char *)v16 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

void sub_1C2F9B298(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v7 = a1;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((a1 & 0xC) == 4 << v8)
  {
    sub_1C2FC47D8(a1, a3, a4);
    v7 = v10;
  }
  if ((a2 & 0xC) == v9)
  {
    sub_1C2FC47D8(a2, a3, a4);
    a2 = v11;
    if ((a4 & 0x1000000000000000) == 0)
      return;
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return;
  }
  v12 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v12 = a3 & 0xFFFFFFFFFFFFLL;
  if (v12 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v12 >= a2 >> 16)
  {
    sub_1C2FC9A5C();
    return;
  }
  __break(1u);
}

void sub_1C2F9B384(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v28;
  unint64_t v29;
  _QWORD v30[2];

  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v11 = a4;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v29 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = a4;
LABEL_33:
    *a1 = a4;
    a1[1] = a5;
    a1[2] = a6;
    a1[3] = a7;
    a1[4] = v11;
    return;
  }
  v13 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v23 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v24 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v25 = v16;
  v28 = a3 - 1;
  v11 = a4;
  while (1)
  {
    v17 = v11;
    if ((v11 & 0xC) == v15)
      sub_1C2FC47D8(v11, a6, a7);
    if (v17 >> 14 < v29 || v17 >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      v21 = sub_1C2FC9A68();
    }
    else
    {
      v19 = v17 >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v30[0] = a6;
        v30[1] = v24;
        v21 = *((_BYTE *)v30 + v19);
      }
      else
      {
        v20 = v23;
        if ((a6 & 0x1000000000000000) == 0)
          v20 = sub_1C2FC9C24();
        v21 = *(_BYTE *)(v20 + v19);
      }
    }
    if ((v11 & 0xC) == v15)
    {
      sub_1C2FC47D8(v11, a6, a7);
      v11 = v22;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        v11 = (v11 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v25 <= v11 >> 16)
      goto LABEL_35;
    v11 = sub_1C2FC9A44();
LABEL_31:
    *(_BYTE *)(a2 + v13) = v21;
    if (v28 != v13)
    {
      ++v13;
      if (v10 != v11 >> 14)
        continue;
    }
    goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

_QWORD *sub_1C2F9B584(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF5A0);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = (2 * ((uint64_t)(v4 - 32) / 8)) | 1;
  v5 = sub_1C2F9BB28(&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1C2F9BD20();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

void sub_1C2F9B66C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEF70);
    v3 = (_QWORD *)swift_allocObject();
    v4 = _swift_stdlib_malloc_size(v3);
    v3[2] = v1;
    v3[3] = 2 * ((uint64_t)(v4 - 32) / 16);
    sub_1C2F9BDF8(&v7, v3 + 4, v1, a1);
    v6 = v5;
    OUTLINED_FUNCTION_24();
    sub_1C2F9BD20();
    if (v6 != v1)
      __break(1u);
  }
  OUTLINED_FUNCTION_20();
}

char *sub_1C2F9B730(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1C2F9B74C(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_1C2F9B74C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF040);
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
    sub_1C2FBDFAC(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C2F9AC9C(v13, v8, v12);
  }
  swift_release();
  return v10;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BD0798]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1C2F9B864()
{
  unint64_t result;

  result = qword_1ED7AF4B8;
  if (!qword_1ED7AF4B8)
  {
    result = MEMORY[0x1C3BD07B0](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED7AF4B8);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1C2F9B8B8(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_assets);
  if (!v1)
    return 0;
  v2 = v1;
  sub_1C2F9BD28(0, &qword_1ED7AF038);
  v3 = sub_1C2FC999C();

  return v3;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1C2F9B940(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void sub_1C2F9B994(unint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  if (!*a1)
  {
    v4 = sub_1C2FC8A0C();
    atomic_store(MEMORY[0x1C3BD07B0](a2, v4), a1);
  }
  OUTLINED_FUNCTION_31();
}

uint64_t sub_1C2F9B9D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2F9BA18(void *a1, SEL *a2)
{
  id v3;

  v3 = objc_msgSend(a1, *a2);

  if (v3)
  {
    sub_1C2FC99F0();
    OUTLINED_FUNCTION_65();
  }
  return OUTLINED_FUNCTION_36();
}

void sub_1C2F9BA74(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6;

  v6 = (id)sub_1C2FC99E4();
  OUTLINED_FUNCTION_25();
  objc_msgSend(a3, *a4, v6);

}

uint64_t sub_1C2F9BAC8(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_assetVersion);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_1C2FC99F0();

  return v3;
}

_QWORD *sub_1C2F9BB28(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
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
  void *v20;
  id v21;

  v5 = result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
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
    return (_QWORD *)v10;
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
    v20 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = v20;
    if (v13 == v10)
    {
      v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    result = v20;
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

uint64_t sub_1C2F9BD20()
{
  return swift_release();
}

uint64_t sub_1C2F9BD28(uint64_t a1, unint64_t *a2)
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

void sub_1C2F9BD60(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_31();
}

void sub_1C2F9BD98(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  OUTLINED_FUNCTION_31();
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

void sub_1C2F9BDF8(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
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

  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
LABEL_37:
    *a1 = a4;
    a1[1] = v6;
    a1[2] = ~v7;
    a1[3] = v12;
    a1[4] = v9;
    OUTLINED_FUNCTION_19();
    return;
  }
  if (!a3)
  {
    v12 = 0;
    goto LABEL_37;
  }
  if (a3 < 0)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
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
    if (v13 == a3)
    {
      swift_bridgeObjectRetain();
      goto LABEL_37;
    }
    v11 += 2;
    swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_39;
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
    goto LABEL_37;
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
LABEL_40:
  __break(1u);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TrialAssetNamespaces(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF9)
  {
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
    v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v5 = v6 - 8;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for TrialAssetNamespaces(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C2F9C0C0 + 4 * byte_1C2FCA5F2[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_1C2F9C0F4 + 4 * byte_1C2FCA5ED[v4]))();
}

uint64_t sub_1C2F9C0F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2F9C0FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C2F9C104);
  return result;
}

uint64_t sub_1C2F9C110(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C2F9C118);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_1C2F9C11C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2F9C124(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C2F9C130(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1C2F9C13C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TrialAssetNamespaces()
{
  return &type metadata for TrialAssetNamespaces;
}

unint64_t sub_1C2F9C158()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF7DB7C0;
  if (!qword_1EF7DB7C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF7DB7C8);
    result = MEMORY[0x1C3BD07B0](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EF7DB7C0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BD07A4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1C2F9C1E4()
{
  unint64_t result;

  result = qword_1EF7DB7D0;
  if (!qword_1EF7DB7D0)
  {
    result = MEMORY[0x1C3BD07B0](&unk_1C2FCA768, &type metadata for TrialAssetNamespaces);
    atomic_store(result, (unint64_t *)&qword_1EF7DB7D0);
  }
  return result;
}

void OUTLINED_FUNCTION_0()
{
  JUMPOUT(0x1C3BD0834);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1C2FC4294(0xD000000000000015, a1 | 0x8000000000000000, (uint64_t *)(v1 - 104));
}

BOOL OUTLINED_FUNCTION_3(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_7()
{
  return sub_1C2FC98F4();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return sub_1C2FC9A20();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 4) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v4;
  uint64_t v5;
  va_list va;

  va_start(va, a4);
  return sub_1C2FC4294(v5, v4, (uint64_t *)va);
}

BOOL OUTLINED_FUNCTION_21(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_1C2FC9B10();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_1C2FC98E8();
}

uint64_t OUTLINED_FUNCTION_29(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_32(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_33(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_35(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1C2F9BD60(v2, a2);
}

uint64_t OUTLINED_FUNCTION_36()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_38()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_39(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_40(uint64_t a1)
{
  uint64_t v1;

  return sub_1C2F9B940(a1, v1);
}

uint64_t OUTLINED_FUNCTION_41(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + v1) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_42()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_43()
{
  return sub_1C2FC9B10();
}

uint64_t OUTLINED_FUNCTION_44()
{
  return sub_1C2FC98E8();
}

uint64_t OUTLINED_FUNCTION_45@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return sub_1C2FC9C9C();
}

uint64_t OUTLINED_FUNCTION_49(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = a1;
  return v1 - 112;
}

id OUTLINED_FUNCTION_50(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_51()
{
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_52()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_53()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_54()
{
  return sub_1C2FC9B04();
}

uint64_t OUTLINED_FUNCTION_55()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_57()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_58(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_59()
{
  return sub_1C2FC8A0C();
}

uint64_t OUTLINED_FUNCTION_60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1C2FC4294(a1, a2, (uint64_t *)(v2 - 112));
}

uint64_t OUTLINED_FUNCTION_61@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + a1) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_62(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_64()
{
  return sub_1C2FC99E4();
}

void OUTLINED_FUNCTION_65()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_66(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void sub_1C2F9C5BC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_1C2F9C624();
  sub_1C2FC97D4();
  sub_1C2F9C660(a2, a3, a4);
}

unint64_t sub_1C2F9C624()
{
  unint64_t result;

  result = qword_1ED7AEDD0;
  if (!qword_1ED7AEDD0)
  {
    result = MEMORY[0x1C3BD07B0](&unk_1C2FCAB90, &type metadata for Logger);
    atomic_store(result, (unint64_t *)&qword_1ED7AEDD0);
  }
  return result;
}

void sub_1C2F9C660(uint64_t a1, uint64_t a2, void *a3)
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
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
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
  uint64_t v29[2];

  v4 = sub_1C2FC8A0C();
  v26 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_23();
  v7 = v6 - v5;
  v8 = OUTLINED_FUNCTION_3_0();
  v28 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_23();
  v11 = v10 - v9;
  swift_getObjectType();
  v29[0] = sub_1C2FC975C();
  v29[1] = v12;
  OUTLINED_FUNCTION_8_0();
  swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF3F8);
  OUTLINED_FUNCTION_7_0();
  sub_1C2FC9A2C();
  OUTLINED_FUNCTION_25();
  sub_1C2F9C624();
  v27 = v11;
  sub_1C2FC97E0();
  OUTLINED_FUNCTION_25();
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v13 = sub_1C2FC98F4();
  __swift_project_value_buffer(v13, (uint64_t)qword_1ED7AF5F0);
  v14 = a3;
  swift_unknownObjectRetain_n();
  v15 = v14;
  v16 = sub_1C2FC98E8();
  v17 = sub_1C2FC9B28();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = swift_slowAlloc();
    v29[0] = swift_slowAlloc();
    *(_DWORD *)v18 = 136315650;
    sub_1C2FC95B8();
    sub_1C2F9D47C((unint64_t *)&unk_1ED7AE740, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
    v19 = sub_1C2FC9C9C();
    v21 = v20;
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v7, v4);
    sub_1C2FC4294(v19, v21, v29);
    OUTLINED_FUNCTION_2_0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 12) = 2082;
    v22 = sub_1C2FC9D80();
    sub_1C2FC4294(v22, v23, v29);
    sub_1C2FC9BA0();

    OUTLINED_FUNCTION_25();
    *(_WORD *)(v18 + 22) = 2082;
    v24 = sub_1C2FC975C();
    sub_1C2FC4294(v24, v25, v29);
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_6_0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2F94000, v16, v17, "Posting messageId: %s of type %{public}s to bridge %{public}s", (uint8_t *)v18, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_6_0();
  sub_1C2FC972C();
  sub_1C2FC97D4();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v8);
  OUTLINED_FUNCTION_27();
}

void sub_1C2F9CA40(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t aBlock;
  uint64_t v62;
  uint64_t (*v63)(uint64_t);
  void *v64;
  uint64_t (*v65)();
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;

  v57 = a5;
  v58 = a6;
  v56 = (void *)a4;
  v9 = sub_1C2FC990C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_23();
  v13 = v12 - v11;
  v52 = sub_1C2FC993C();
  v55 = *(_QWORD *)(v52 - 8);
  MEMORY[0x1E0C80A78](v52);
  OUTLINED_FUNCTION_23();
  v54 = v15 - v14;
  v60 = OUTLINED_FUNCTION_3_0();
  v53 = *(_QWORD *)(v60 - 8);
  v16 = *(_QWORD *)(v53 + 64);
  v17 = MEMORY[0x1E0C80A78](v60);
  v18 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v59 = (char *)&v45 - v19;
  swift_getObjectType();
  if (dynamic_cast_existential_1_conditional(a1))
  {
    v47 = v20;
    swift_getObjectType();
    v50 = v13;
    swift_unknownObjectRetain();
    v49 = v9;
    v51 = v10;
    v48 = a2;
    aBlock = sub_1C2FC975C();
    v62 = v21;
    OUTLINED_FUNCTION_8_0();
    v46 = a3;
    v67 = sub_1C2FBE234(a3);
    v68 = v22;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF00);
    OUTLINED_FUNCTION_7_0();
    sub_1C2FC9A2C();
    swift_bridgeObjectRelease();
    sub_1C2F9C624();
    v23 = v59;
    sub_1C2FC97E0();
    swift_bridgeObjectRelease();
    swift_getObjectType();
    v47 = sub_1C2FC969C();
    v24 = v53;
    v25 = v60;
    (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v18, v23, v60);
    v26 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
    v27 = (v16 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
    v28 = (v27 + 23) & 0xFFFFFFFFFFFFFFF8;
    v29 = (v28 + 15) & 0xFFFFFFFFFFFFFFF8;
    v30 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v24 + 32))(v30 + v26, v18, v25);
    v31 = (uint64_t *)(v30 + v27);
    v32 = v48;
    *v31 = a1;
    v31[1] = v32;
    v33 = v46;
    *(_QWORD *)(v30 + v28) = v46;
    v35 = v56;
    v34 = v57;
    *(_QWORD *)(v30 + v29) = v56;
    v36 = (uint64_t *)(v30 + ((v29 + 15) & 0xFFFFFFFFFFFFFFF8));
    v37 = v58;
    *v36 = v34;
    v36[1] = v37;
    v65 = sub_1C2F9D3EC;
    v66 = v30;
    aBlock = MEMORY[0x1E0C809B0];
    v62 = 1107296256;
    v63 = sub_1C2FA8FF0;
    v64 = &block_descriptor;
    v38 = _Block_copy(&aBlock);
    swift_unknownObjectRetain();
    v39 = v33;
    v40 = v35;
    sub_1C2F9D46C(v34);
    v41 = v54;
    sub_1C2FC9924();
    v67 = MEMORY[0x1E0DEE9D8];
    sub_1C2F9D47C(qword_1ED7AEEF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF10);
    sub_1C2F9D4BC();
    v43 = v49;
    v42 = v50;
    sub_1C2FC9BDC();
    v44 = (void *)v47;
    MEMORY[0x1C3BD0204](0, v41, v42, v38);
    _Block_release(v38);
    swift_unknownObjectRelease();

    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v42, v43);
    (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v41, v52);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v59, v60);
    swift_release();
    OUTLINED_FUNCTION_27();
  }
  else
  {
    sub_1C2F9CF00(a1, a2, a3, (uint64_t)v56, v57, v58);
  }
}

uint64_t sub_1C2F9CE70(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  sub_1C2F9C624();
  sub_1C2FC97D4();
  return sub_1C2F9CF00(a2, a3, a4, a5, a6, a7);
}

uint64_t sub_1C2F9CF00(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
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
  char *v26;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[2];
  uint64_t v36;
  uint64_t v37;

  v31 = a5;
  v32 = a6;
  v30 = a4;
  v7 = sub_1C2FC98DC();
  v33 = *(_QWORD *)(v7 - 8);
  v34 = v7;
  MEMORY[0x1E0C80A78](v7);
  v29 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v9 = sub_1C2FC98F4();
  __swift_project_value_buffer(v9, (uint64_t)qword_1ED7AF5F0);
  v10 = a3;
  swift_unknownObjectRetain_n();
  v11 = v10;
  v12 = sub_1C2FC98E8();
  v13 = sub_1C2FC9B04();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v28 = swift_slowAlloc();
    v35[0] = v28;
    *(_DWORD *)v14 = 136315650;
    v36 = sub_1C2FBE234(v11);
    v37 = v15;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF00);
    v16 = sub_1C2FC99FC();
    v36 = sub_1C2FC4294(v16, v17, v35);
    sub_1C2FC9BA0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    v36 = sub_1C2FBE240(v11);
    v37 = v18;
    v19 = sub_1C2FC99FC();
    v36 = sub_1C2FC4294(v19, v20, v35);
    sub_1C2FC9BA0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 22) = 2080;
    swift_getObjectType();
    v21 = sub_1C2FC975C();
    v36 = sub_1C2FC4294(v21, v22, v35);
    sub_1C2FC9BA0();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2F94000, v12, v13, "Forwarding ace command %s with aceId: %s to bridge: %s", (uint8_t *)v14, 0x20u);
    v23 = v28;
    swift_arrayDestroy();
    MEMORY[0x1C3BD0834](v23, -1, -1);
    MEMORY[0x1C3BD0834](v14, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  swift_getObjectType();
  v36 = sub_1C2FC975C();
  v37 = v24;
  sub_1C2FC9A2C();
  v35[0] = sub_1C2FBE234(v11);
  v35[1] = v25;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF00);
  sub_1C2FC99FC();
  sub_1C2FC9A2C();
  swift_bridgeObjectRelease();
  sub_1C2F9C624();
  v26 = v29;
  sub_1C2FC97E0();
  swift_bridgeObjectRelease();
  sub_1C2FC9768();
  sub_1C2FC97D4();
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v26, v34);
}

uint64_t dynamic_cast_existential_1_conditional(uint64_t a1)
{
  if (swift_conformsToProtocol2())
    return a1;
  else
    return 0;
}

uint64_t sub_1C2F9D340()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v1 = OUTLINED_FUNCTION_3_0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_unknownObjectRelease();

  if (*(_QWORD *)(v0 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8)))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C2F9D3EC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_3_0() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  v4 = (v3 + 23) & 0xFFFFFFFFFFFFFFF8;
  return sub_1C2F9CE70(v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + v3 + 8), *(void **)(v0 + v4), *(_QWORD *)(v0 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((((v4 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((((v4 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
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

uint64_t sub_1C2F9D46C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1C2F9D47C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1C3BD07B0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1C2F9D4BC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED7AEF20;
  if (!qword_1ED7AEF20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1ED7AEF10);
    result = MEMORY[0x1C3BD07B0](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED7AEF20);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return sub_1C2FC98DC();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_unknownObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return sub_1C2FC99FC();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return sub_1C2FC9A2C();
}

uint64_t sub_1C2F9D53C(uint64_t a1)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF480);
  *(_QWORD *)(v1 + 24) = sub_1C2FC99A8();
  *(_BYTE *)(v1 + 32) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF4E0);
  *(_QWORD *)(v1 + 40) = OUTLINED_FUNCTION_20_0();
  *(_QWORD *)(v1 + 48) = OUTLINED_FUNCTION_20_0();
  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_1C2F9D5D0(void *a1)
{
  uint64_t v1;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  id v43;
  NSObject *v44;
  os_log_type_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  void (*v58)(uint64_t, uint64_t, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(uint64_t, uint64_t, uint64_t);
  id v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t, uint64_t);
  _QWORD v75[3];
  int v76;
  os_log_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
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
  _QWORD *v94;
  uint64_t v95;
  uint64_t aBlock[7];
  uint64_t v97;

  v3 = sub_1C2FC990C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_1_0();
  v89 = v5;
  v6 = OUTLINED_FUNCTION_33_0();
  v87 = *(_QWORD *)(v6 - 8);
  v88 = v6;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_1_0();
  v86 = v8;
  v84 = OUTLINED_FUNCTION_3_0();
  v94 = *(_QWORD **)(v84 - 8);
  v9 = v94[8];
  MEMORY[0x1E0C80A78](v84);
  OUTLINED_FUNCTION_48_0();
  v83 = v10;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_47_0();
  v82 = v12;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_47_0();
  v93 = v14;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_47_0();
  v92 = v16;
  v17 = sub_1C2FC95DC();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)v75 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1C2FC8A0C();
  v22 = *(_QWORD *)(v21 - 8);
  v90 = v21;
  v91 = v22;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v23);
  OUTLINED_FUNCTION_1_0();
  v25 = v24;
  aBlock[0] = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF3F8);
  v95 = sub_1C2FC99FC();
  v85 = v1;
  if ((*(_BYTE *)(v1 + 32) & 1) == 0)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v37 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v37, (uint64_t)qword_1ED7AF5F0);
    v27 = a1;
    OUTLINED_FUNCTION_11_0();
    v28 = sub_1C2FC98E8();
    v38 = sub_1C2FC9B10();
    if (OUTLINED_FUNCTION_23_0(v38))
    {
      v30 = (uint8_t *)OUTLINED_FUNCTION_1();
      v94 = (_QWORD *)OUTLINED_FUNCTION_1();
      aBlock[0] = (uint64_t)v94;
      *(_DWORD *)v30 = 136315394;
      OUTLINED_FUNCTION_11_0();
      v39 = OUTLINED_FUNCTION_9_0();
      OUTLINED_FUNCTION_29_0(v39);
      OUTLINED_FUNCTION_27_0();
      OUTLINED_FUNCTION_18_0();
      OUTLINED_FUNCTION_8_1();
      sub_1C2F9D47C((unint64_t *)&unk_1ED7AE740, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_19_0();
      v40 = OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_25_0(v40);
      OUTLINED_FUNCTION_24_0();

      OUTLINED_FUNCTION_17_0();
      v36 = "MessageBus was not started rejected posting message type %s, message id: %s";
LABEL_11:
      OUTLINED_FUNCTION_39(&dword_1C2F94000, v28, (os_log_type_t)v9, v36, v30);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0();
    }
    goto LABEL_12;
  }
  if ((sub_1C2FC9594() & 1) != 0)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v26 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v26, (uint64_t)qword_1ED7AF5F0);
    v27 = a1;
    OUTLINED_FUNCTION_11_0();
    v28 = sub_1C2FC98E8();
    v29 = sub_1C2FC9B10();
    if (OUTLINED_FUNCTION_23_0(v29))
    {
      v30 = (uint8_t *)OUTLINED_FUNCTION_1();
      v94 = (_QWORD *)OUTLINED_FUNCTION_1();
      aBlock[0] = (uint64_t)v94;
      *(_DWORD *)v30 = 136315394;
      OUTLINED_FUNCTION_11_0();
      v31 = OUTLINED_FUNCTION_9_0();
      OUTLINED_FUNCTION_29_0(v31);
      OUTLINED_FUNCTION_27_0();
      OUTLINED_FUNCTION_18_0();
      OUTLINED_FUNCTION_8_1();
      sub_1C2F9D47C((unint64_t *)&unk_1ED7AE740, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      v32 = OUTLINED_FUNCTION_4_0();
      v34 = v33;
      OUTLINED_FUNCTION_19_0();
      v35 = sub_1C2FC4294(v32, v34, aBlock);
      OUTLINED_FUNCTION_25_0(v35);
      OUTLINED_FUNCTION_24_0();

      swift_bridgeObjectRelease();
      v36 = "Ignoring posting again message type: %s with msgId: %s back to the bus";
      goto LABEL_11;
    }
LABEL_12:

    OUTLINED_FUNCTION_46();
    return 0;
  }
  v80 = v3;
  sub_1C2FC95A0();
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v79 = v4;
  v42 = OUTLINED_FUNCTION_7();
  __swift_project_value_buffer(v42, (uint64_t)qword_1ED7AF5F0);
  v43 = a1;
  swift_bridgeObjectRetain_n();
  v81 = v43;
  v44 = sub_1C2FC98E8();
  v45 = sub_1C2FC9B28();
  v46 = v45;
  if (os_log_type_enabled(v44, v45))
  {
    v47 = OUTLINED_FUNCTION_1();
    v78 = OUTLINED_FUNCTION_1();
    aBlock[0] = v78;
    *(_DWORD *)v47 = 136446722;
    v77 = v44;
    OUTLINED_FUNCTION_11_0();
    v48 = OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_29_0(v48);
    v75[1] = v49 + 8;
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_18_0();
    *(_WORD *)(v47 + 12) = 2082;
    v75[0] = v47 + 14;
    v75[2] = v17;
    v50 = v81;
    sub_1C2FC95B8();
    sub_1C2F9D47C((unint64_t *)&unk_1ED7AE740, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
    OUTLINED_FUNCTION_4_0();
    v76 = v46;
    (*(void (**)(uint64_t, uint64_t))(v91 + 8))(v25, v25);
    v51 = OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_25_0(v51);
    sub_1C2FC9BA0();

    OUTLINED_FUNCTION_17_0();
    *(_WORD *)(v47 + 22) = 2080;
    sub_1C2FC95AC();
    sub_1C2FC95D0();
    OUTLINED_FUNCTION_36_0((uint64_t)v20, *(uint64_t (**)(uint64_t, _QWORD))(v18 + 8));
    v97 = OUTLINED_FUNCTION_10_0();
    sub_1C2FC9BA0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2F94000, v77, (os_log_type_t)v76, "Posting message type: %{public}s with msgId: %{public}s source: %s to the message bus", (uint8_t *)v47, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }

  v52 = v81;
  OUTLINED_FUNCTION_46();
  sub_1C2F9C624();
  v53 = v92;
  sub_1C2FC97EC();
  v54 = v93;
  OUTLINED_FUNCTION_49_0();
  sub_1C2FC97E0();
  swift_bridgeObjectRelease();
  v56 = v84;
  v55 = v85;
  v95 = *(_QWORD *)(v85 + 16);
  v57 = v94;
  v58 = (void (*)(uint64_t, uint64_t, uint64_t))v94[2];
  v59 = v82;
  v58(v82, v53, v84);
  v60 = v83;
  v58(v83, v54, v56);
  v61 = *((unsigned __int8 *)v57 + 80);
  v62 = (v61 + 16) & ~v61;
  v63 = (v9 + v61 + v62) & ~v61;
  v64 = (v9 + v63 + 7) & 0xFFFFFFFFFFFFFFF8;
  v65 = swift_allocObject();
  v66 = v65 + v62;
  v67 = (void (*)(uint64_t, uint64_t, uint64_t))v57[4];
  v67(v66, v59, v56);
  v67(v65 + v63, v60, v56);
  *(_QWORD *)(v65 + v64) = v55;
  v68 = v81;
  *(_QWORD *)(v65 + ((v64 + 15) & 0xFFFFFFFFFFFFFFF8)) = v81;
  aBlock[4] = (uint64_t)sub_1C2FA0350;
  aBlock[5] = v65;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_1C2FA8FF0;
  aBlock[3] = (uint64_t)&block_descriptor_6;
  v69 = _Block_copy(aBlock);
  v70 = v68;
  swift_retain();
  v71 = v86;
  sub_1C2FC9924();
  v97 = MEMORY[0x1E0DEE9D8];
  sub_1C2F9D47C((unint64_t *)&unk_1ED7AEEF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF10);
  sub_1C2F9D4BC();
  v72 = v89;
  sub_1C2FC9BDC();
  MEMORY[0x1C3BD0204](0, v71, v72, v69);
  _Block_release(v69);
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_41_0(v72, v73);
  (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v71, v88);
  v74 = (void (*)(uint64_t, uint64_t))v94[1];
  v74(v93, v56);
  v74(v92, v56);
  swift_release();
  return 1;
}

uint64_t sub_1C2F9DF08(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_1C2F9C624();
  sub_1C2FC97D4();
  sub_1C2FC97D4();
  return sub_1C2F9DFA0(a4);
}

uint64_t sub_1C2F9DFA0(void *a1)
{
  uint64_t v1;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint8_t *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
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
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void (*v70)(uint64_t, uint64_t);
  uint64_t (*v71)(uint64_t, _QWORD);
  uint64_t (*v72)(uint64_t, uint64_t);
  uint64_t v73;
  uint64_t (*v74)(uint64_t, _QWORD);
  uint64_t v76;
  char *v77;
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
  uint64_t ObjectType;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  uint64_t v97;
  uint64_t aBlock;
  uint64_t v99;
  uint64_t (*v100)(uint64_t);
  void *v101;
  void (*v102)();
  uint64_t v103;
  uint64_t v104;

  v87 = sub_1C2FC990C();
  v86 = *(_QWORD *)(v87 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_1_0();
  v85 = v4;
  v84 = OUTLINED_FUNCTION_33_0();
  v83 = *(_QWORD *)(v84 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_1_0();
  v82 = v6;
  v94 = sub_1C2FC8A0C();
  v92 = *(void **)(v94 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_1_0();
  v78 = v8;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF78);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_1_0();
  *(_QWORD *)&v96 = v10;
  v91 = OUTLINED_FUNCTION_3_0();
  v90 = *(_QWORD *)(v91 - 8);
  v11 = *(_QWORD *)(v90 + 64);
  MEMORY[0x1E0C80A78](v91);
  OUTLINED_FUNCTION_48_0();
  v81 = v12;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_47_0();
  v95 = v14;
  OUTLINED_FUNCTION_21_0();
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v76 - v16;
  ObjectType = swift_getObjectType();
  aBlock = ObjectType;
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF3F8);
  v18 = sub_1C2FC99FC();
  v20 = v19;
  v21 = sub_1C2F9C624();
  OUTLINED_FUNCTION_16_0();
  v89 = v21;
  OUTLINED_FUNCTION_49_0();
  sub_1C2FC97E0();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_5_0();
  v22 = *(_QWORD *)(v1 + 40);
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_11_0();
  v23 = sub_1C2FC1C2C(v18, v20, v22);
  OUTLINED_FUNCTION_7_1();
  swift_bridgeObjectRelease();
  if (!v23)
  {
    v104 = MEMORY[0x1E0DEE9D8];
    v97 = MEMORY[0x1E0DEE9E8];
    v101 = (void *)sub_1C2FC95C4();
    aBlock = (uint64_t)a1;
    v24 = a1;
    v25 = v96;
    sub_1C2FC9D2C();
    v26 = sub_1C2FC9D44();
    __swift_storeEnumTagSinglePayload(v25, 0, 1, v26);
    sub_1C2F9E978(v25, &v97, &v104);
    sub_1C2FA0198(v25);
    swift_bridgeObjectRelease();
    v23 = v104;
    OUTLINED_FUNCTION_34();
    v27 = swift_bridgeObjectRetain();
    sub_1C2FC5260(v27, v18, v20);
    swift_endAccess();
  }
  OUTLINED_FUNCTION_7_1();
  v93 = *(_QWORD *)(v23 + 16);
  if (v93)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v77 = v17;
    v28 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v28, (uint64_t)qword_1ED7AF5F0);
    v29 = a1;
    v30 = sub_1C2FC98E8();
    v31 = sub_1C2FC9B04();
    v32 = os_log_type_enabled(v30, v31);
    v92 = v29;
    if (v32)
    {
      v33 = (uint8_t *)OUTLINED_FUNCTION_1();
      *(_QWORD *)&v96 = OUTLINED_FUNCTION_1();
      aBlock = v96;
      *(_DWORD *)v33 = 136315138;
      v94 = (uint64_t)(v33 + 4);
      v34 = objc_msgSend(v29, sel_debugDescription);
      v35 = sub_1C2FC99F0();
      v37 = v36;

      v104 = sub_1C2FC4294(v35, v37, &aBlock);
      sub_1C2FC9BA0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1C2F94000, v30, v31, "Posting following message to bus %s", v33, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    v52 = 0;
    v78 = v11 + 7;
    v79 = v23;
    do
    {
      v96 = *(_OWORD *)(v23 + 16 * v52 + 32);
      v53 = v96;
      swift_getObjectType();
      v54 = dynamic_cast_existential_1_conditional(v53);
      v55 = *((_QWORD *)&v96 + 1);
      if (v54)
      {
        swift_getObjectType();
        swift_unknownObjectRetain_n();
        aBlock = sub_1C2FC975C();
        v99 = v56;
        sub_1C2FC9A2C();
        v104 = ObjectType;
        sub_1C2FC99FC();
        sub_1C2FC9A2C();
        OUTLINED_FUNCTION_17_0();
        v57 = v95;
        sub_1C2FC97E0();
        OUTLINED_FUNCTION_17_0();
        swift_getObjectType();
        v94 = sub_1C2FC969C();
        v58 = v90;
        v59 = v81;
        OUTLINED_FUNCTION_45_0(v81, v57, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v90 + 16));
        v60 = (*(unsigned __int8 *)(v58 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
        v61 = (v78 + v60) & 0xFFFFFFFFFFFFFFF8;
        v62 = swift_allocObject();
        OUTLINED_FUNCTION_45_0(v62 + v60, v59, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v58 + 32));
        *(_OWORD *)(v62 + v61) = v96;
        v63 = v92;
        *(_QWORD *)(v62 + ((v61 + 23) & 0xFFFFFFFFFFFFFFF8)) = v92;
        v102 = sub_1C2FA0250;
        v103 = v62;
        aBlock = MEMORY[0x1E0C809B0];
        v99 = 1107296256;
        v100 = sub_1C2FA8FF0;
        v101 = &block_descriptor_0;
        v64 = _Block_copy(&aBlock);
        v65 = v63;
        swift_unknownObjectRetain();
        v66 = v82;
        sub_1C2FC9924();
        v104 = MEMORY[0x1E0DEE9D8];
        sub_1C2F9D47C((unint64_t *)&unk_1ED7AEEF0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF10);
        sub_1C2F9D4BC();
        v67 = v85;
        v68 = v87;
        sub_1C2FC9BDC();
        v69 = (void *)v94;
        MEMORY[0x1C3BD0204](0, v66, v67, v64);
        _Block_release(v64);
        OUTLINED_FUNCTION_35_0();

        OUTLINED_FUNCTION_44_0();
        v70(v67, v68);
        OUTLINED_FUNCTION_44_0();
        OUTLINED_FUNCTION_36_0(v66, v71);
        v72 = *(uint64_t (**)(uint64_t, uint64_t))(v58 + 8);
        v23 = v79;
        OUTLINED_FUNCTION_41_0(v95, v72);
        OUTLINED_FUNCTION_35_0();
        swift_release();
      }
      else
      {
        v73 = swift_unknownObjectRetain();
        sub_1C2F9C660(v73, v55, v92);
        OUTLINED_FUNCTION_35_0();
      }
      ++v52;
    }
    while (v93 != v52);
    OUTLINED_FUNCTION_25();
    v17 = v77;
  }
  else
  {
    OUTLINED_FUNCTION_25();
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v38 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v38, (uint64_t)qword_1ED7AF5F0);
    v39 = a1;
    v40 = sub_1C2FC98E8();
    v41 = sub_1C2FC9B28();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = OUTLINED_FUNCTION_1();
      v43 = OUTLINED_FUNCTION_1();
      v44 = v78;
      *(_QWORD *)&v96 = v43;
      aBlock = v43;
      *(_DWORD *)v42 = 136446466;
      v45 = sub_1C2FC9D80();
      v104 = sub_1C2FC4294(v45, v46, &aBlock);
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_11();
      *(_WORD *)(v42 + 12) = 2082;
      sub_1C2FC95B8();
      sub_1C2F9D47C((unint64_t *)&unk_1ED7AE740, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      v47 = v94;
      v48 = sub_1C2FC9C9C();
      v49 = v47;
      v51 = v50;
      (*((void (**)(uint64_t, uint64_t))v92 + 1))(v44, v49);
      v104 = sub_1C2FC4294(v48, v51, &aBlock);
      OUTLINED_FUNCTION_24_0();

      OUTLINED_FUNCTION_39_0();
      OUTLINED_FUNCTION_39(&dword_1C2F94000, v40, v41, "There is no bridge that registered to consume message type %{public}s and message id: %{public}s", (uint8_t *)v42);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0();
    }

  }
  sub_1C2FC97D4();
  OUTLINED_FUNCTION_44_0();
  return OUTLINED_FUNCTION_36_0((uint64_t)v17, v74);
}

uint64_t sub_1C2F9E978(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t ObjectType;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45[5];

  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF78);
  OUTLINED_FUNCTION_15_0();
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v39 - v12;
  v14 = sub_1C2FC9D44();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *(_QWORD *)(*a2 + 16);
  result = OUTLINED_FUNCTION_5_0();
  if (v18 != *(_QWORD *)(*(_QWORD *)(v4 + 24) + 16))
  {
    sub_1C2FA0150(a1, (uint64_t)v13);
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v14) == 1)
    {
      return sub_1C2FA0198((uint64_t)v13);
    }
    else
    {
      OUTLINED_FUNCTION_45_0((uint64_t)v17, (uint64_t)v13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 32));
      v45[2] = sub_1C2FC9D38();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF90);
      v20 = sub_1C2FC99FC();
      v22 = v21;
      OUTLINED_FUNCTION_5_0();
      v23 = *(_QWORD *)(v4 + 48);
      swift_bridgeObjectRetain();
      v24 = sub_1C2FC1C2C(v20, v22, v23);
      OUTLINED_FUNCTION_17_0();
      swift_bridgeObjectRelease();
      if (v24)
      {
        v40 = v17;
        v41 = v15;
        v42 = v14;
        v43 = v11;
        v44 = v24;
        v25 = *(_QWORD *)(v24 + 16);
        if (v25)
        {
          v26 = (uint64_t *)(v44 + 40);
          do
          {
            v27 = *(v26 - 1);
            v28 = *v26;
            v29 = *a2;
            ObjectType = swift_getObjectType();
            swift_unknownObjectRetain();
            v31 = OUTLINED_FUNCTION_22_0();
            LOBYTE(v29) = sub_1C2F9EC78(v31, v32, v29);
            OUTLINED_FUNCTION_11();
            if ((v29 & 1) != 0)
            {
              swift_unknownObjectRelease();
            }
            else
            {
              v33 = (_QWORD *)*a3;
              swift_unknownObjectRetain();
              isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              *a3 = (uint64_t)v33;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                v33 = OUTLINED_FUNCTION_14_0();
                *a3 = (uint64_t)v33;
              }
              v36 = v33[2];
              v35 = v33[3];
              if (v36 >= v35 >> 1)
              {
                v33 = sub_1C2FBD854((_QWORD *)(v35 > 1), v36 + 1, 1, (uint64_t)v33);
                *a3 = (uint64_t)v33;
              }
              sub_1C2FBFE44(v36, v27, a3, ObjectType, v28);
              *a3 = (uint64_t)v33;
              v37 = OUTLINED_FUNCTION_22_0();
              sub_1C2F9F6DC(v45, v37, v38);
              swift_unknownObjectRelease();
              swift_bridgeObjectRelease();
            }
            v26 += 2;
            --v25;
          }
          while (v25);
        }
        swift_bridgeObjectRelease();
        v11 = v43;
        v17 = v40;
        v15 = v41;
      }
      sub_1C2FC9D20();
      sub_1C2F9E978(v11, a2, a3);
      sub_1C2FA0198((uint64_t)v11);
      return OUTLINED_FUNCTION_41_0((uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
    }
  }
  return result;
}

uint64_t sub_1C2F9EC78(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_1C2FC9D08();
    sub_1C2FC9A20();
    v6 = sub_1C2FC9D14();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1C2FC9CA8() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1C2FC9CA8() & 1) != 0)
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

void sub_1C2F9EDAC()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  NSObject *oslog;

  if (*(_BYTE *)(v0 + 32) == 1)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v1 = OUTLINED_FUNCTION_7();
    oslog = OUTLINED_FUNCTION_38_0(v1, (uint64_t)qword_1ED7AF5F0);
    v2 = sub_1C2FC9B28();
    if (os_log_type_enabled(oslog, v2))
    {
      v3 = (uint8_t *)OUTLINED_FUNCTION_1();
      *(_WORD *)v3 = 0;
      OUTLINED_FUNCTION_46_0(&dword_1C2F94000, oslog, v2, "MessageBus was already started before", v3);
      OUTLINED_FUNCTION_0();
    }

  }
  else
  {
    v4 = v0;
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v5 = OUTLINED_FUNCTION_7();
    v6 = OUTLINED_FUNCTION_38_0(v5, (uint64_t)qword_1ED7AF5F0);
    v7 = sub_1C2FC9B28();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)OUTLINED_FUNCTION_1();
      *(_WORD *)v8 = 0;
      OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v6, v7, "MessageBus was started", v8);
      OUTLINED_FUNCTION_0();
    }

    *(_BYTE *)(v4 + 32) = 1;
  }
}

uint64_t sub_1C2F9EF18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
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
  NSObject *v31;
  os_log_type_t v32;
  int v33;
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
  uint64_t v45;
  uint64_t v46;
  uint64_t result;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  char v61;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  char v67;
  unint64_t v68;
  char v69;
  unint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  BOOL v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  os_log_type_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  _QWORD *v87;
  uint64_t v88[3];
  uint64_t v89[3];

  if (*(_BYTE *)(v2 + 32) == 1)
  {
    if (qword_1ED7AEDB0 != -1)
LABEL_39:
      swift_once();
    v3 = OUTLINED_FUNCTION_7();
    v4 = OUTLINED_FUNCTION_38_0(v3, (uint64_t)qword_1ED7AF5F0);
    v5 = sub_1C2FC9B10();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)OUTLINED_FUNCTION_1();
      *(_WORD *)v6 = 0;
      OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v4, v5, "Cannot register bridge after message bus was started", v6);
      OUTLINED_FUNCTION_0();
    }

    return 0;
  }
  v7 = v2;
  ObjectType = swift_getObjectType();
  v11 = sub_1C2FC975C();
  v13 = v12;
  OUTLINED_FUNCTION_5_0();
  v14 = *(_QWORD *)(v7 + 24);
  OUTLINED_FUNCTION_16_0();
  sub_1C2FC1C30(v11, v13, v14);
  v16 = v15;
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_7_1();
  swift_unknownObjectRelease();
  if (v16)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v17 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v17, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_26_0();
    v18 = sub_1C2FC98E8();
    v19 = sub_1C2FC9B10();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)OUTLINED_FUNCTION_1();
      v89[0] = OUTLINED_FUNCTION_1();
      *(_DWORD *)v20 = 136315138;
      v21 = sub_1C2FC975C();
      v88[0] = OUTLINED_FUNCTION_40_0(v21, v22, v23, v24, v25, v26, v27, v28, v77, v78, v80, v83);
      sub_1C2FC9BA0();
      OUTLINED_FUNCTION_30_0();
      OUTLINED_FUNCTION_11();
      _os_log_impl(&dword_1C2F94000, v18, v19, "Bridge: %s is already register message types, ignore this register", v20, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_30_0();
    return 0;
  }
  v84 = ObjectType;
  v29 = sub_1C2FC9738();
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v30 = OUTLINED_FUNCTION_7();
  __swift_project_value_buffer(v30, (uint64_t)qword_1ED7AF5F0);
  OUTLINED_FUNCTION_26_0();
  swift_bridgeObjectRetain_n();
  v31 = sub_1C2FC98E8();
  v32 = sub_1C2FC9B04();
  v33 = v32;
  v85 = v29;
  if (os_log_type_enabled(v31, v32))
  {
    v34 = OUTLINED_FUNCTION_1();
    v89[0] = OUTLINED_FUNCTION_1();
    *(_DWORD *)v34 = 136315394;
    LODWORD(v80) = v33;
    OUTLINED_FUNCTION_16_0();
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF3F8);
    v36 = MEMORY[0x1C3BD015C](v29, v35);
    v38 = v37;
    swift_bridgeObjectRelease();
    sub_1C2FC4294(v36, v38, v89);
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_7_1();
    *(_WORD *)(v34 + 12) = 2080;
    v39 = OUTLINED_FUNCTION_43_0();
    v88[0] = OUTLINED_FUNCTION_40_0(v39, v40, v41, v42, v43, v44, v45, v46, v77, v78, v80, ObjectType);
    sub_1C2FC9BA0();
    OUTLINED_FUNCTION_30_0();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_39(&dword_1C2F94000, v31, v81, "registering messages %s to consume by bridge %s", (uint8_t *)v34);
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_46();
  v48 = OUTLINED_FUNCTION_43_0();
  v50 = v49;
  OUTLINED_FUNCTION_34();
  v51 = swift_unknownObjectRetain();
  sub_1C2FC526C(v51, a2, v48, v50);
  swift_endAccess();
  OUTLINED_FUNCTION_25();
  v82 = *(_QWORD *)(v29 + 16);
  if (!v82)
  {
LABEL_36:
    OUTLINED_FUNCTION_7_1();
    return 1;
  }
  v79 = a2;
  v52 = (_QWORD *)(v7 + 48);
  OUTLINED_FUNCTION_5_0();
  v53 = 0;
  v86 = v52;
  while (1)
  {
    v88[0] = *(_QWORD *)(v29 + 8 * v53 + 32);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF3F8);
    v54 = sub_1C2FC99FC();
    v56 = v55;
    v57 = *v52;
    v58 = *(_QWORD *)(*v52 + 16);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_16_0();
    if (v58)
    {
      v59 = sub_1C2FC4980();
      v60 = MEMORY[0x1E0DEE9D8];
      if ((v61 & 1) != 0)
      {
        v60 = *(_QWORD *)(*(_QWORD *)(v57 + 56) + 8 * v59);
        swift_bridgeObjectRetain();
      }
    }
    else
    {
      v60 = MEMORY[0x1E0DEE9D8];
    }
    OUTLINED_FUNCTION_39_0();
    OUTLINED_FUNCTION_7_1();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v88[0] = v60;
    v63 = (_QWORD *)v60;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v63 = OUTLINED_FUNCTION_14_0();
      v88[0] = (uint64_t)v63;
    }
    v65 = v63[2];
    v64 = v63[3];
    if (v65 >= v64 >> 1)
    {
      v63 = sub_1C2FBD854((_QWORD *)(v64 > 1), v65 + 1, 1, (uint64_t)v63);
      v88[0] = (uint64_t)v63;
    }
    sub_1C2FBFE44(v65, a1, v88, ObjectType, v79);
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_34();
    swift_isUniquelyReferenced_nonNull_native();
    v87 = (_QWORD *)*v86;
    *v86 = 0x8000000000000000;
    v66 = OUTLINED_FUNCTION_42_0();
    if (__OFADD__(v87[2], (v67 & 1) == 0))
    {
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v68 = v66;
    v69 = v67;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF548);
    if ((sub_1C2FC9C30() & 1) != 0)
      break;
LABEL_31:
    if ((v69 & 1) != 0)
    {
      v72 = v87[7];
      swift_bridgeObjectRelease();
      *(_QWORD *)(v72 + 8 * v68) = v63;
    }
    else
    {
      v87[(v68 >> 6) + 8] |= 1 << v68;
      v73 = (uint64_t *)(v87[6] + 16 * v68);
      *v73 = v54;
      v73[1] = v56;
      *(_QWORD *)(v87[7] + 8 * v68) = v63;
      v74 = v87[2];
      v75 = __OFADD__(v74, 1);
      v76 = v74 + 1;
      if (v75)
        goto LABEL_38;
      v87[2] = v76;
      swift_bridgeObjectRetain();
    }
    ++v53;
    v52 = v86;
    *v86 = v87;
    OUTLINED_FUNCTION_39_0();
    OUTLINED_FUNCTION_11();
    swift_endAccess();
    ObjectType = v84;
    v29 = v85;
    if (v82 == v53)
      goto LABEL_36;
  }
  v70 = OUTLINED_FUNCTION_42_0();
  if ((v69 & 1) == (v71 & 1))
  {
    v68 = v70;
    goto LABEL_31;
  }
  result = sub_1C2FC9CCC();
  __break(1u);
  return result;
}

uint64_t sub_1C2F9F628()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1C2F9F65C()
{
  sub_1C2F9F628();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Broker()
{
  return objc_opt_self();
}

uint64_t sub_1C2F9F69C(void (*a1)(void))
{
  a1();
  return sub_1C2FC9D80();
}

uint64_t sub_1C2F9F6C0(uint64_t result, uint64_t a2, _QWORD *a3)
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

uint64_t sub_1C2F9F6DC(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_1C2FC9D08();
  swift_bridgeObjectRetain();
  sub_1C2FC9A20();
  v8 = sub_1C2FC9D14();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1C2FC9CA8() & 1) != 0)
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
      if (v19 || (sub_1C2FC9CA8() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1C2F9FB60(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1C2F9F888()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
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
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF60);
  v3 = sub_1C2FC9BF4();
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
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
      v18 = *v17;
      v19 = v17[1];
      sub_1C2FC9D08();
      sub_1C2FC9A20();
      result = sub_1C2FC9D14();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          v26 = v22 == v25;
          if (v22 == v25)
            v22 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
      *v28 = v18;
      v28[1] = v19;
      ++*(_QWORD *)(v4 + 16);
      if (v7)
        goto LABEL_6;
LABEL_7:
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_38;
      if (v14 >= v8)
        goto LABEL_32;
      v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        v11 = v14 + 1;
        if (v14 + 1 >= v8)
          goto LABEL_32;
        v15 = v30[v11];
        if (!v15)
        {
          v11 = v14 + 2;
          if (v14 + 2 >= v8)
            goto LABEL_32;
          v15 = v30[v11];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              v1 = v0;
              v29 = 1 << *(_BYTE *)(v2 + 32);
              if (v29 > 63)
                sub_1C2F9F6C0(0, (unint64_t)(v29 + 63) >> 6, v30);
              else
                *v30 = -1 << v29;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_39;
                if (v11 >= v8)
                  goto LABEL_32;
                v15 = v30[v11];
                ++v16;
                if (v15)
                  goto LABEL_20;
              }
            }
            v11 = v16;
          }
        }
      }
LABEL_20:
      v7 = (v15 - 1) & v15;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1C2F9FB60(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_1C2F9F888();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_1C2F9FCF8();
      goto LABEL_22;
    }
    sub_1C2F9FEA8();
  }
  v11 = *v4;
  sub_1C2FC9D08();
  sub_1C2FC9A20();
  result = sub_1C2FC9D14();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_1C2FC9CA8(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_1C2FC9CC0();
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
          result = sub_1C2FC9CA8();
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

void *sub_1C2F9FCF8()
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
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF60);
  v2 = *v0;
  v3 = sub_1C2FC9BE8();
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
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v21 = v20[1];
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * i);
    *v22 = *v20;
    v22[1] = v21;
    result = (void *)swift_bridgeObjectRetain();
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1C2F9FEA8()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
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
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF60);
  v3 = sub_1C2FC9BF4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
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
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    sub_1C2FC9D08();
    swift_bridgeObjectRetain();
    sub_1C2FC9A20();
    result = sub_1C2FC9D14();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_36;
    if (v14 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v11);
      if (!v15)
      {
        v11 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v11);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v8 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1C2FA0150(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2FA0198(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF78);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C2FA01D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_32_0();
  v3 = (((v2 + v1 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v4 + 8))(v0 + v1);
  swift_unknownObjectRelease();

  return swift_deallocObject();
}

void sub_1C2FA0250()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_3_0() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_1C2F9C5BC(v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + v3 + 8), *(void **)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFF8)));
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

uint64_t sub_1C2FA02B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  v1 = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_32_0();
  v5 = (v3 + v2 + v4) & ~v2;
  v6 = (((v3 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
  v8(v0 + v4, v1);
  v8(v0 + v5, v1);
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_1C2FA0350()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_3_0() - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 16) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);
  return sub_1C2F9DF08(v0 + v3, v0 + ((v4 + v2 + v3) & ~v2), *(_QWORD *)(v0 + ((v4 + ((v4 + v2 + v3) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v0 + ((((v4 + ((v4 + v2 + v3) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8)));
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return sub_1C2FC9C9C();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2080;
  return sub_1C2FC95B8();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1C2FC4294(*(_QWORD *)(v1 - 160), v0, (uint64_t *)(v1 - 152));
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1C2FC4294(v0, v1, (uint64_t *)(v2 - 152));
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_bridgeObjectRetain();
}

_QWORD *OUTLINED_FUNCTION_14_0()
{
  uint64_t v0;

  return sub_1C2FBD854(0, *(_QWORD *)(v0 + 16) + 1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 192) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return sub_1C2FC99A8();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return sub_1C2FC975C();
}

BOOL OUTLINED_FUNCTION_23_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_25_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return swift_unknownObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_29_0(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return swift_unknownObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return sub_1C2FC993C();
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_36_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 256));
}

uint64_t OUTLINED_FUNCTION_38_0(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_1C2FC98E8();
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_40_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  return sub_1C2FC4294(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_41_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

unint64_t OUTLINED_FUNCTION_42_0()
{
  return sub_1C2FC4980();
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return sub_1C2FC975C();
}

uint64_t OUTLINED_FUNCTION_45_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void OUTLINED_FUNCTION_46_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t sub_1C2FA05D8()
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
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  OUTLINED_FUNCTION_30_1();
  v1 = v0;
  v31 = v2;
  v4 = v3;
  v25 = v3;
  v6 = v5;
  v8 = v7;
  v30 = sub_1C2FC9B40();
  MEMORY[0x1E0C80A78](v30);
  OUTLINED_FUNCTION_1_0();
  v9 = sub_1C2FC9B58();
  v28 = *(_QWORD *)(v9 - 8);
  v29 = v9;
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_1_0();
  v27 = v10;
  v11 = sub_1C2FC993C();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_1_0();
  v12 = (uint64_t *)(v0 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionState);
  OUTLINED_FUNCTION_6_1();
  sub_1C2FA3108(&qword_1ED7AF438, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EE08], MEMORY[0x1E0D9EE18]);
  v13 = MEMORY[0x1E0DEE9D8];
  v14 = OUTLINED_FUNCTION_13_0();
  v15 = OUTLINED_FUNCTION_13_0();
  *v12 = v14;
  v12[1] = v15;
  v16 = OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_snapshots;
  *(_QWORD *)(v1 + v16) = sub_1C2FC99A8();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_snapshotRequestIds) = v13;
  v17 = (_QWORD *)(v1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_assistantId);
  *v17 = v8;
  v17[1] = v6;
  v18 = v1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionId;
  v19 = sub_1C2FC8A0C();
  v26 = *(_QWORD *)(v19 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v18, v4, v19);
  v20 = v1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionType;
  v21 = sub_1C2FC9720();
  v24 = *(_QWORD *)(v21 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))(v20, v31, v21);
  sub_1C2F9BD28(0, &qword_1ED7AEF50);
  swift_bridgeObjectRetain();
  sub_1C2FC9C00();
  swift_bridgeObjectRelease();
  sub_1C2FC9A2C();
  swift_bridgeObjectRelease();
  sub_1C2FC9930();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v28 + 104))(v27, *MEMORY[0x1E0DEF8D8], v29);
  sub_1C2FA3108(qword_1ED7AEF40, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810], MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEF30);
  sub_1C2FA2EF0();
  sub_1C2FC9BDC();
  v22 = sub_1C2FC9B7C();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v31, v21);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v19);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_syncQueue) = v22;
  return v1;
}

uint64_t sub_1C2FA0914(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t result;
  _QWORD aBlock[6];
  _BYTE v11[32];

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_31_0();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_24_1();
  v4 = *(NSObject **)(v1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_syncQueue);
  sub_1C2FA3740(a1, (uint64_t)v11);
  OUTLINED_FUNCTION_16_1();
  v5 = (*(unsigned __int8 *)(v2 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v1;
  sub_1C2FA383C((uint64_t)v11, v6 + 24);
  OUTLINED_FUNCTION_23_1(v6 + v5);
  v7 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v7 + 16) = sub_1C2FA39B8;
  *(_QWORD *)(v7 + 24) = v6;
  aBlock[4] = sub_1C2FA3CE0;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C2FA9034;
  aBlock[3] = &block_descriptor_53;
  v8 = _Block_copy(aBlock);
  OUTLINED_FUNCTION_12_0();
  swift_retain();
  swift_release();
  dispatch_sync(v4, v8);
  _Block_release(v8);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_18_1();
  result = swift_release();
  if ((v4 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_1C2FA0A7C()
{
  swift_beginAccess();
  sub_1C2FC6438();
  return swift_endAccess();
}

void sub_1C2FA0AE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_syncQueue);
  v4 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = a1;
  v5 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v5 + 16) = sub_1C2FA3940;
  *(_QWORD *)(v5 + 24) = v4;
  OUTLINED_FUNCTION_15_1((uint64_t)sub_1C2FA9034, MEMORY[0x1E0C809B0], 1107296256, v6, v7);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_35_1();
  if ((v3 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_2_1();
}

#error "1C2FA0BFC: call analysis failed (funcsize=21)"

void sub_1C2FA0C18()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEF88);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_26_1();
}

uint64_t sub_1C2FA0C68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = (uint64_t *)(a1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionState);
  swift_beginAccess();
  v7 = *v5;
  v6 = v5[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C2FC72C0(a2, v7, v6, a3);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C2FA0D08()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEFE8);
  OUTLINED_FUNCTION_8_2();
  return v1;
}

uint64_t sub_1C2FA0D68@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C2FC7410();
  v3 = v2;
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

void sub_1C2FA0E0C()
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
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  dispatch_queue_t v20;
  _QWORD v21[6];
  _BYTE v22[32];

  OUTLINED_FUNCTION_30_1();
  v18 = v1;
  v19 = v2;
  v4 = v3;
  v5 = OUTLINED_FUNCTION_10_1();
  v6 = *(_QWORD *)(v5 - 8);
  v17 = v5;
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x1E0C80A78]();
  v8 = OUTLINED_FUNCTION_6_1();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(dispatch_queue_t *)(v0 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_syncQueue);
  sub_1C2FA3740(v4, (uint64_t)v22);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v18, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v19, v5);
  v12 = (*(unsigned __int8 *)(v9 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v13 = (v10 + *(unsigned __int8 *)(v6 + 80) + v12) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v0;
  sub_1C2FA383C((uint64_t)v22, v14 + 24);
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v14 + v12, v11, v8);
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v14 + v13, (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v17);
  v15 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v15 + 16) = sub_1C2FA3884;
  *(_QWORD *)(v15 + 24) = v14;
  v21[4] = sub_1C2FA3CE0;
  v21[5] = v15;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 1107296256;
  v21[2] = sub_1C2FA9034;
  v21[3] = &block_descriptor_33;
  v16 = _Block_copy(v21);
  OUTLINED_FUNCTION_12_0();
  swift_retain();
  swift_release();
  dispatch_sync(v20, v16);
  _Block_release(v16);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_18_1();
  swift_release();
  if ((v16 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FA1014()
{
  swift_beginAccess();
  sub_1C2FC7764();
  return swift_endAccess();
}

void sub_1C2FA1084()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  OUTLINED_FUNCTION_30_1();
  v3 = v2;
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_31_0();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_24_1();
  v4 = *(NSObject **)(v0 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_syncQueue);
  OUTLINED_FUNCTION_16_1();
  v5 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v0;
  *(_QWORD *)(v6 + 24) = v3;
  OUTLINED_FUNCTION_23_1(v6 + v5);
  v7 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v7 + 16) = sub_1C2FA3710;
  *(_QWORD *)(v7 + 24) = v6;
  v9[4] = sub_1C2FA3CE0;
  v9[5] = v7;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1C2FA9034;
  v9[3] = &block_descriptor_23;
  v8 = _Block_copy(v9);
  OUTLINED_FUNCTION_12_0();
  swift_bridgeObjectRetain();
  swift_retain();
  OUTLINED_FUNCTION_25_1();
  dispatch_sync(v4, v8);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_18_1();
  swift_release();
  if ((v3 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

#error "1C2FA1208: call analysis failed (funcsize=26)"

void sub_1C2FA1228()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7DBB78);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_26_1();
}

uint64_t sub_1C2FA1278@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v5 = (uint64_t *)(a1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionState);
  swift_beginAccess();
  v6 = *v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = sub_1C2FC81D0(a2, v6);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a3 = v7;
  return result;
}

void sub_1C2FA1314()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEF88);
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_26_1();
}

uint64_t sub_1C2FA1360@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v5 = a1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionState;
  result = swift_beginAccess();
  v7 = *(_QWORD *)(v5 + 8);
  if (*(_QWORD *)(v7 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1C2FC49E0(a2);
    if ((v9 & 1) != 0)
    {
      sub_1C2FA30CC(*(_QWORD *)(v7 + 56) + 32 * v8, (uint64_t)a3);
    }
    else
    {
      *a3 = 0u;
      a3[1] = 0u;
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void sub_1C2FA1424()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEFE8);
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_26_1();
}

uint64_t sub_1C2FA1474@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C2FC828C();
  v3 = v2;
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a1 = v3;
  return result;
}

void sub_1C2FA1510(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = v2;
  v6 = *(_QWORD *)(v3 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_syncQueue);
  v7 = (_QWORD *)OUTLINED_FUNCTION_34_0();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  v8 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v8 + 16) = sub_1C2FA31A8;
  *(_QWORD *)(v8 + 24) = v7;
  OUTLINED_FUNCTION_15_1((uint64_t)sub_1C2FA9034, MEMORY[0x1E0C809B0], 1107296256, v9, v10);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_35_1();
  if ((v6 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_2_1();
}

uint64_t sub_1C2FA15F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  __objc2_class **p_superclass;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  char *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39[3];

  v5 = a1;
  v6 = (uint64_t *)(a1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionState);
  swift_beginAccess();
  v8 = *v6;
  v7 = v6[1];
  v9 = (uint64_t *)(v5 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_snapshots);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10 = sub_1C2FA31B8(v8, v7, a2, a3);
  swift_endAccess();
  sub_1C2FA3624(v10);
  p_superclass = &OBJC_METACLASS____TtC14SiriMessageBus28ImmutableConversationSession.superclass;
  v12 = MEMORY[0x1E0DEE9B8];
  if (!v10)
    goto LABEL_8;
  if (qword_1ED7AEDB0 != -1)
    goto LABEL_26;
  while (1)
  {
    v13 = sub_1C2FC98F4();
    __swift_project_value_buffer(v13, (uint64_t)qword_1ED7AF5F0);
    swift_bridgeObjectRetain_n();
    v14 = sub_1C2FC98E8();
    v15 = sub_1C2FC9B10();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v39[0] = v17;
      *(_DWORD *)v16 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C2FC4294(a2, a3, v39);
      v12 = MEMORY[0x1E0DEE9B8];
      sub_1C2FC9BA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C2F94000, v14, v15, "Overwrote snapshot %s", v16, 0xCu);
      swift_arrayDestroy();
      v18 = v17;
      p_superclass = (__objc2_class **)(&OBJC_METACLASS____TtC14SiriMessageBus28ImmutableConversationSession + 8);
      MEMORY[0x1C3BD0834](v18, -1, -1);
      MEMORY[0x1C3BD0834](v16, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v19 = (uint64_t)p_superclass[216] + v5;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v20 = sub_1C2FA3250(v19, a2, a3);
    v21 = *(_QWORD *)(*(_QWORD *)v19 + 16);
    if (v21 < v20)
      break;
    sub_1C2FA3528(v20, v21);
    swift_endAccess();
LABEL_8:
    v22 = (char *)p_superclass[216] + v5;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_1C2FBD778();
    v23 = *(_QWORD **)(*(_QWORD *)v22 + 16);
    sub_1C2FBD800(v23);
    v24 = *(_QWORD *)v22;
    *(_QWORD *)(v24 + 16) = (char *)v23 + 1;
    v25 = v24 + 16 * (_QWORD)v23;
    v37 = a2;
    *(_QWORD *)(v25 + 32) = a2;
    *(_QWORD *)(v25 + 40) = a3;
    result = swift_endAccess();
    if (*(_QWORD *)(*(_QWORD *)v22 + 16) < 6uLL)
      return result;
    a2 = v12 + 8;
    while (1)
    {
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v27 = sub_1C2FC98F4();
      __swift_project_value_buffer(v27, (uint64_t)qword_1ED7AF5F0);
      swift_bridgeObjectRetain_n();
      v28 = sub_1C2FC98E8();
      v29 = sub_1C2FC9B04();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = swift_slowAlloc();
        v12 = swift_slowAlloc();
        v39[0] = v12;
        *(_DWORD *)v30 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v30 + 4) = sub_1C2FC4294(v37, a3, v39);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1C2F94000, v28, v29, "Reached max count, removing snapshot %s", (uint8_t *)v30, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C3BD0834](v12, -1, -1);
        MEMORY[0x1C3BD0834](v30, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      swift_beginAccess();
      v31 = *(_QWORD **)v22;
      p_superclass = *(__objc2_class ***)(*(_QWORD *)v22 + 16);
      if (!p_superclass)
        break;
      v12 = v31[5];
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
      if (!(_DWORD)isUniquelyReferenced_nonNull_native || (unint64_t)p_superclass - 1 > v31[3] >> 1)
        v31 = sub_1C2FBD870(isUniquelyReferenced_nonNull_native, (int64_t)p_superclass, 1, (uint64_t)v31);
      swift_arrayDestroy();
      v33 = v31[2];
      if (!v33)
        goto LABEL_28;
      memmove(v31 + 4, v31 + 6, 16 * v33 - 16);
      v31[2] = v33 - 1;
      *(_QWORD *)v22 = v31;
      swift_endAccess();
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v34 = sub_1C2FC4980();
      v5 = v35;
      swift_bridgeObjectRelease();
      v36 = 0;
      if ((v5 & 1) != 0)
      {
        swift_isUniquelyReferenced_nonNull_native();
        v38 = *v9;
        *v9 = 0x8000000000000000;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF528);
        sub_1C2FC9C30();
        v5 = v38;
        swift_bridgeObjectRelease();
        v36 = *(_QWORD *)(*(_QWORD *)(v38 + 56) + 16 * v34);
        sub_1C2FC9C3C();
        *v9 = v38;
        swift_bridgeObjectRelease();
      }
      swift_endAccess();
      swift_bridgeObjectRelease();
      result = sub_1C2FA3624(v36);
      if (*(_QWORD *)(*(_QWORD *)v22 + 16) <= 5uLL)
        return result;
    }
    __break(1u);
LABEL_26:
    swift_once();
  }
  __break(1u);
LABEL_28:
  result = sub_1C2FC9C6C();
  __break(1u);
  return result;
}

void sub_1C2FA1C38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = v2;
  v6 = *(_QWORD *)(v3 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_syncQueue);
  v7 = (_QWORD *)OUTLINED_FUNCTION_34_0();
  v7[2] = v3;
  v7[3] = a1;
  v7[4] = a2;
  v8 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v8 + 16) = sub_1C2FA314C;
  *(_QWORD *)(v8 + 24) = v7;
  OUTLINED_FUNCTION_15_1((uint64_t)sub_1C2FA9034, MEMORY[0x1E0C809B0], 1107296256, v9, v10);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_25_1();
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_35_1();
  if ((v6 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_2_1();
}

void sub_1C2FA1D20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  _QWORD *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[3];

  v5 = a1;
  v6 = (uint64_t *)(a1 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_snapshots);
  swift_beginAccess();
  v7 = *v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1C2FC1C74(a2, a3, v7);
  v9 = v8;
  v11 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v9)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v30 = v11;
    v12 = sub_1C2FC98F4();
    __swift_project_value_buffer(v12, (uint64_t)qword_1ED7AF5F0);
    swift_bridgeObjectRetain_n();
    v13 = sub_1C2FC98E8();
    v14 = sub_1C2FC9B04();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v29 = v5;
      v16 = swift_slowAlloc();
      v31[0] = v16;
      *(_DWORD *)v15 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C2FC4294(a2, a3, v31);
      sub_1C2FC9BA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C2F94000, v13, v14, "Restoring to snapshot %s", v15, 0xCu);
      swift_arrayDestroy();
      v17 = v16;
      v5 = v29;
      MEMORY[0x1C3BD0834](v17, -1, -1);
      MEMORY[0x1C3BD0834](v15, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v23 = (_QWORD *)(v5 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionState);
    swift_beginAccess();
    *v23 = v9;
    v23[1] = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v24 = sub_1C2FC98E8();
    v25 = sub_1C2FC9B04();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_1C2F94000, v24, v25, "Clearing all existing snapshots.", v26, 2u);
      MEMORY[0x1C3BD0834](v26, -1, -1);
    }

    v27 = MEMORY[0x1E0DEE9D8];
    *v6 = sub_1C2FC99A8();
    swift_bridgeObjectRelease();
    v28 = (_QWORD *)(v5 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_snapshotRequestIds);
    swift_beginAccess();
    *v28 = v27;
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v18 = sub_1C2FC98F4();
    __swift_project_value_buffer(v18, (uint64_t)qword_1ED7AF5F0);
    swift_bridgeObjectRetain_n();
    v19 = sub_1C2FC98E8();
    v20 = sub_1C2FC9B10();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v31[0] = v22;
      *(_DWORD *)v21 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C2FC4294(a2, a3, v31);
      sub_1C2FC9BA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C2F94000, v19, v20, "Cannot restore. There is no snapshot %s", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1C3BD0834](v22, -1, -1);
      MEMORY[0x1C3BD0834](v21, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_1C2FA21BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = v1;
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v4 = sub_1C2FC98F4();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED7AF5F0);
  v5 = sub_1C2FC98E8();
  v6 = sub_1C2FC9B04();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1C2F94000, v5, v6, "Creating an immutable snapshot of ConversationSession", v7, 2u);
    MEMORY[0x1C3BD0834](v7, -1, -1);
  }

  v8 = (uint64_t *)(v2 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionState);
  swift_beginAccess();
  v10 = *v8;
  v9 = v8[1];
  v11 = type metadata accessor for ImmutableConversationSession();
  v12 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v12 + 16) = v10;
  *(_QWORD *)(v12 + 24) = v9;
  a1[3] = v11;
  a1[4] = sub_1C2FA3108(&qword_1ED7AF318, v13, (uint64_t (*)(uint64_t))type metadata accessor for ImmutableConversationSession, (uint64_t)&unk_1C2FCA8E0);
  *a1 = v12;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1C2FA2314()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = sub_1C2FC8A0C();
  OUTLINED_FUNCTION_21_1(v1);
  swift_bridgeObjectRelease();
  v2 = sub_1C2FC9720();
  OUTLINED_FUNCTION_21_1(v2);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1C2FA23C0()
{
  sub_1C2FA2314();
  return swift_deallocClassInstance();
}

uint64_t sub_1C2FA23E4()
{
  return type metadata accessor for ConversationSession();
}

uint64_t type metadata accessor for ConversationSession()
{
  uint64_t result;

  result = qword_1ED7AF0F0;
  if (!qword_1ED7AF0F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1C2FA2424()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1C2FC8A0C();
  if (v1 <= 0x3F)
  {
    result = sub_1C2FC9720();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t sub_1C2FA24D4@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2FA2538(&OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionId, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0998], a1);
}

uint64_t sub_1C2FA24E8()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*v0 + OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_assistantId);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1C2FA2524@<X0>(uint64_t a1@<X8>)
{
  return sub_1C2FA2538(&OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionType, (uint64_t (*)(_QWORD))MEMORY[0x1E0D9EE78], a1);
}

uint64_t sub_1C2FA2538@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;

  v5 = *v3 + *a1;
  v6 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a3, v5, v6);
}

void sub_1C2FA257C()
{
  sub_1C2FA0C18();
}

uint64_t sub_1C2FA259C()
{
  return sub_1C2FA0D08();
}

void sub_1C2FA25BC()
{
  sub_1C2FA0E0C();
}

void sub_1C2FA25DC()
{
  sub_1C2FA1084();
}

uint64_t sub_1C2FA25FC(uint64_t a1)
{
  return sub_1C2FA0914(a1);
}

void sub_1C2FA261C(uint64_t a1)
{
  sub_1C2FA0AE4(a1);
}

void sub_1C2FA263C()
{
  sub_1C2FA1228();
}

void sub_1C2FA265C()
{
  sub_1C2FA1314();
}

void sub_1C2FA267C()
{
  sub_1C2FA1424();
}

void sub_1C2FA269C(uint64_t a1, uint64_t a2)
{
  sub_1C2FA1510(a1, a2);
}

void sub_1C2FA26BC(uint64_t a1, uint64_t a2)
{
  sub_1C2FA1C38(a1, a2);
}

uint64_t sub_1C2FA26DC@<X0>(uint64_t *a1@<X8>)
{
  return sub_1C2FA21BC(a1);
}

double sub_1C2FA26FC@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_1C2FC72C0(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

void sub_1C2FA2704()
{
  sub_1C2FC7410();
}

uint64_t sub_1C2FA270C(uint64_t a1)
{
  uint64_t v1;

  return sub_1C2FC81D0(a1, *(_QWORD *)(v1 + 16));
}

double sub_1C2FA2714@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  double result;

  v4 = *(_QWORD *)(v2 + 24);
  if (*(_QWORD *)(v4 + 16) && (sub_1C2FC49E0(a1), (v6 & 1) != 0))
  {
    sub_1C2FA30CC(*(_QWORD *)(v4 + 56) + 32 * v5, (uint64_t)a2);
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

void sub_1C2FA2764()
{
  sub_1C2FC828C();
}

uint64_t sub_1C2FA276C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7DBB68);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (void *)objc_opt_self();
  v8 = *(_QWORD *)(v1 + 24);
  v18 = *(id *)(v1 + 16);
  v19 = v8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9 = sub_1C2FC9CB4();
  v18 = 0;
  v10 = objc_msgSend(v7, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v9, 1, &v18);
  swift_unknownObjectRelease();
  v11 = v18;
  if (v10)
  {
    v12 = (void *)sub_1C2FC8994();
    v17 = v4;
    v14 = v13;

    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_1C2FA2F58();
    sub_1C2FC9D5C();
    v18 = v12;
    v19 = v14;
    sub_1C2FA3090();
    sub_1C2FC9C90();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v3);
    return sub_1C2FA2FD0((uint64_t)v12, v14);
  }
  else
  {
    v16 = v11;
    sub_1C2FC8988();

    return swift_willThrow();
  }
}

uint64_t sub_1C2FA2950(_QWORD *a1)
{
  uint64_t v2;

  OUTLINED_FUNCTION_29_1();
  v2 = swift_allocObject();
  sub_1C2FA2994(a1);
  return v2;
}

uint64_t sub_1C2FA2994(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v6;
  __int128 v7;
  _QWORD v8[4];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7DBB40);
  MEMORY[0x1E0C80A78](v4);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1C2FA2F58();
  sub_1C2FC9D50();
  if (!v2)
  {
    sub_1C2FA2F94();
    sub_1C2FC9C84();
    sub_1C2F9BD28(0, &qword_1EF7DBB58);
    sub_1C2FC9B34();
    if (v8[3])
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        OUTLINED_FUNCTION_19_1();
        OUTLINED_FUNCTION_7_2();
        *(_OWORD *)(v1 + 16) = v7;
        goto LABEL_4;
      }
    }
    else
    {
      sub_1C2FA3014((uint64_t)v8);
    }
    sub_1C2FA3054();
    swift_allocError();
    *v6 = 0xD000000000000023;
    v6[1] = 0x80000001C2FCB500;
    swift_willThrow();
    OUTLINED_FUNCTION_19_1();
    OUTLINED_FUNCTION_7_2();
  }
  type metadata accessor for ImmutableConversationSession();
  swift_deallocPartialClassInstance();
LABEL_4:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

BOOL sub_1C2FA2BA4()
{
  uint64_t v0;

  v0 = sub_1C2FC9C78();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

BOOL sub_1C2FA2BE8()
{
  return sub_1C2FA2BA4();
}

uint64_t sub_1C2FA2C00()
{
  return 1;
}

uint64_t sub_1C2FA2C08()
{
  return 0;
}

uint64_t sub_1C2FA2C14()
{
  return 0x536E6F6973736573;
}

BOOL sub_1C2FA2C44@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_1C2FA2BA4();
  *a1 = result;
  return result;
}

uint64_t sub_1C2FA2C74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1C2FA2C14();
  *a1 = result;
  a1[1] = v3;
  return result;
}

BOOL sub_1C2FA2C9C@<W0>(_BYTE *a1@<X8>)
{
  _BOOL8 result;

  result = sub_1C2FA2BE8();
  *a1 = result;
  return result;
}

uint64_t sub_1C2FA2CC4()
{
  return sub_1C2FA2C08();
}

uint64_t sub_1C2FA2CDC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1C2FA2C00();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1C2FA2D04()
{
  sub_1C2FA2F58();
  return sub_1C2FC9D68();
}

uint64_t sub_1C2FA2D2C()
{
  sub_1C2FA2F58();
  return sub_1C2FC9D74();
}

uint64_t sub_1C2FA2D64()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_29_1();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ImmutableConversationSession()
{
  return objc_opt_self();
}

double sub_1C2FA2DB0@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_1C2FA26FC(a1, a2);
}

void sub_1C2FA2DD0()
{
  sub_1C2FA2704();
}

uint64_t sub_1C2FA2DF0(uint64_t a1)
{
  return sub_1C2FA270C(a1);
}

double sub_1C2FA2E10@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_1C2FA2714(a1, a2);
}

void sub_1C2FA2E30()
{
  sub_1C2FA2764();
}

uint64_t sub_1C2FA2E50@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_1C2FA2950(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_1C2FA2E78(_QWORD *a1)
{
  return sub_1C2FA276C(a1);
}

uint64_t sub_1C2FA2E98(uint64_t a1, uint64_t a2)
{
  return sub_1C2FA3108(qword_1ED7AF328, a2, (uint64_t (*)(uint64_t))type metadata accessor for ImmutableConversationSession, (uint64_t)&unk_1C2FCA8B8);
}

uint64_t sub_1C2FA2EC4(uint64_t a1, uint64_t a2)
{
  return sub_1C2FA3108(&qword_1ED7AF320, a2, (uint64_t (*)(uint64_t))type metadata accessor for ImmutableConversationSession, (uint64_t)&unk_1C2FCA890);
}

unint64_t sub_1C2FA2EF0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED7AEF38;
  if (!qword_1ED7AEF38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED7AEF30);
    result = MEMORY[0x1C3BD07B0](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ED7AEF38);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1C2FA2F58()
{
  unint64_t result;

  result = qword_1EF7DBB48;
  if (!qword_1EF7DBB48)
  {
    result = MEMORY[0x1C3BD07B0](&unk_1C2FCAB28, &type metadata for ImmutableConversationSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF7DBB48);
  }
  return result;
}

unint64_t sub_1C2FA2F94()
{
  unint64_t result;

  result = qword_1EF7DBB50;
  if (!qword_1EF7DBB50)
  {
    result = MEMORY[0x1C3BD07B0](MEMORY[0x1E0CB0378], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EF7DBB50);
  }
  return result;
}

uint64_t sub_1C2FA2FD0(uint64_t a1, unint64_t a2)
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

uint64_t sub_1C2FA3014(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEF88);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1C2FA3054()
{
  unint64_t result;

  result = qword_1EF7DBB60;
  if (!qword_1EF7DBB60)
  {
    result = MEMORY[0x1C3BD07B0](&unk_1C2FCAAE8, &type metadata for ImmutableConversationSession.SessionStateDecodingError);
    atomic_store(result, (unint64_t *)&qword_1EF7DBB60);
  }
  return result;
}

unint64_t sub_1C2FA3090()
{
  unint64_t result;

  result = qword_1EF7DBB70;
  if (!qword_1EF7DBB70)
  {
    result = MEMORY[0x1C3BD07B0](MEMORY[0x1E0CB0350], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EF7DBB70);
  }
  return result;
}

uint64_t sub_1C2FA30CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C2FA3108(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x1C3BD07B0](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1C2FA314C()
{
  uint64_t *v0;

  sub_1C2FA1D20(v0[2], v0[3], v0[4]);
}

void sub_1C2FA315C()
{
  uint64_t v0;

  sub_1C2FA9018(*(void (**)(void))(v0 + 16));
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

uint64_t objectdestroyTm()
{
  OUTLINED_FUNCTION_20_1();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1C2FA31A8()
{
  uint64_t *v0;

  return sub_1C2FA15F8(v0[2], v0[3], v0[4]);
}

uint64_t sub_1C2FA31B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  uint64_t v12;

  v5 = v4;
  swift_isUniquelyReferenced_nonNull_native();
  v12 = *v4;
  *v4 = 0x8000000000000000;
  v10 = sub_1C2FA340C(a1, a2, a3, a4);
  *v5 = v12;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1C2FA3250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v22;

  v4 = *(_QWORD **)a1;
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v5)
  {
    v8 = 0;
    goto LABEL_28;
  }
  v7 = 0;
  v8 = 0;
  while (1)
  {
    result = v4[v7 + 4];
    if (result == a2 && v4[v7 + 5] == a3)
      break;
    result = sub_1C2FC9CA8();
    if ((result & 1) != 0)
      break;
    ++v8;
    v7 += 2;
    if (v5 == v8)
    {
      v8 = v4[2];
      goto LABEL_28;
    }
  }
  v11 = v8 + 1;
  if (__OFADD__(v8, 1))
    goto LABEL_33;
  v12 = v4[2];
  if (v11 == v12)
  {
LABEL_28:
    swift_bridgeObjectRelease();
    return v8;
  }
  while (v11 < v12)
  {
    v13 = &v4[v7];
    result = v4[v7 + 6];
    if (result != a2 || v4[v7 + 7] != a3)
    {
      result = sub_1C2FC9CA8();
      if ((result & 1) == 0)
      {
        if (v11 != v8)
        {
          if (v8 >= v12)
            goto LABEL_31;
          v15 = &v4[2 * v8 + 4];
          v16 = v15[1];
          v22 = *v15;
          v17 = v13[6];
          v18 = v13[7];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v4 = sub_1C2FA3650((uint64_t)v4);
          v19 = &v4[2 * v8];
          v19[4] = v17;
          v19[5] = v18;
          result = swift_bridgeObjectRelease();
          if (v11 >= v4[2])
            goto LABEL_32;
          v20 = &v4[v7];
          v20[6] = v22;
          v20[7] = v16;
          result = swift_bridgeObjectRelease();
          *(_QWORD *)a1 = v4;
        }
        if (__OFADD__(v8++, 1))
          goto LABEL_30;
      }
    }
    ++v11;
    v12 = v4[2];
    v7 += 2;
    if (v11 == v12)
      goto LABEL_28;
  }
  __break(1u);
LABEL_30:
  __break(1u);
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_1C2FA340C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t result;

  v5 = v4;
  v10 = *v4;
  v11 = sub_1C2FC4980();
  if (__OFADD__(*(_QWORD *)(v10 + 16), (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v13 = v11;
  v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF528);
  if ((sub_1C2FC9C30() & 1) == 0)
    goto LABEL_5;
  v15 = sub_1C2FC4980();
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_9:
    result = sub_1C2FC9CCC();
    __break(1u);
    return result;
  }
  v13 = v15;
LABEL_5:
  v17 = *v5;
  if ((v14 & 1) != 0)
  {
    v18 = (uint64_t *)(*(_QWORD *)(v17 + 56) + 16 * v13);
    result = *v18;
    *v18 = a1;
    v18[1] = a2;
  }
  else
  {
    sub_1C2FC5B10(v13, a3, a4, a1, a2, v17);
    swift_bridgeObjectRetain();
    return 0;
  }
  return result;
}

uint64_t sub_1C2FA3528(uint64_t result, int64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v6 = result;
  v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_1C2FBD870(isUniquelyReferenced_nonNull_native, v11, 1, (uint64_t)v4);
  }
  v12 = (char *)&v4[2 * v6 + 4];
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_16;
  v13 = v4[2];
  if (__OFSUB__(v13, a2))
    goto LABEL_22;
  result = (uint64_t)sub_1C2FBE08C((char *)&v4[2 * a2 + 4], v13 - a2, v12);
  v14 = v4[2];
  v15 = __OFADD__(v14, v8);
  v16 = v14 - v7;
  if (!v15)
  {
    v4[2] = v16;
LABEL_16:
    *(_QWORD *)v2 = v4;
    return result;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_1C2FA3624(uint64_t result)
{
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *sub_1C2FA3650(uint64_t a1)
{
  return sub_1C2FBD870(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_1C2FA3664@<X0>(_QWORD *a1@<X8>)
{
  return sub_1C2FA1474(a1);
}

uint64_t sub_1C2FA367C@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1C2FA1360(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1C2FA3694@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1C2FA1278(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1C2FA36AC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_10_1() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  OUTLINED_FUNCTION_20_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_32_1(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_1C2FA3710()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_10_1() - 8) + 80);
  return sub_1C2FA11C0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v0 + ((v1 + 32) & ~v1));
}

uint64_t sub_1C2FA3740(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEF88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2FA3788()
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

  OUTLINED_FUNCTION_30_1();
  v1 = *(_QWORD *)(OUTLINED_FUNCTION_6_1() - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = OUTLINED_FUNCTION_10_1();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  OUTLINED_FUNCTION_20_1();
  if (*(_QWORD *)(v0 + 48))
    __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  v7 = (v2 + 56) & ~v2;
  v8 = (v7 + v3 + v6) & ~v6;
  OUTLINED_FUNCTION_32_1(v0 + v7, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v8, v4);
  return swift_deallocObject();
}

uint64_t sub_1C2FA383C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEF88);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2FA3884()
{
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_10_1();
  return sub_1C2FA1014();
}

uint64_t sub_1C2FA38E8@<X0>(_QWORD *a1@<X8>)
{
  return sub_1C2FA0D68(a1);
}

uint64_t sub_1C2FA3904@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1C2FA0C68(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1C2FA3920()
{
  OUTLINED_FUNCTION_20_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_29_1();
  return swift_deallocObject();
}

uint64_t sub_1C2FA3940()
{
  uint64_t v0;

  return sub_1C2FA0BC4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1C2FA394C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_6_1() - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  OUTLINED_FUNCTION_20_1();
  if (*(_QWORD *)(v0 + 48))
    __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  OUTLINED_FUNCTION_32_1(v0 + ((v2 + 56) & ~v2), *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_1C2FA39B8()
{
  OUTLINED_FUNCTION_6_1();
  return sub_1C2FA0A7C();
}

_QWORD *initializeBufferWithCopyOfBuffer for ImmutableConversationSession.SessionStateDecodingError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ImmutableConversationSession.SessionStateDecodingError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ImmutableConversationSession.SessionStateDecodingError(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for ImmutableConversationSession.SessionStateDecodingError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ImmutableConversationSession.SessionStateDecodingError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ImmutableConversationSession.SessionStateDecodingError(uint64_t result, int a2, int a3)
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

uint64_t sub_1C2FA3B18()
{
  return 0;
}

ValueMetadata *type metadata accessor for ImmutableConversationSession.SessionStateDecodingError()
{
  return &type metadata for ImmutableConversationSession.SessionStateDecodingError;
}

uint64_t getEnumTagSinglePayload for ImmutableConversationSession.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ImmutableConversationSession.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1C2FA3BC4 + 4 * asc_1C2FCA810[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1C2FA3BE4 + 4 * byte_1C2FCA815[v4]))();
}

_BYTE *sub_1C2FA3BC4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1C2FA3BE4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C2FA3BEC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C2FA3BF4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C2FA3BFC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C2FA3C04(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ImmutableConversationSession.CodingKeys()
{
  return &type metadata for ImmutableConversationSession.CodingKeys;
}

unint64_t sub_1C2FA3C24()
{
  unint64_t result;

  result = qword_1EF7DBB80;
  if (!qword_1EF7DBB80)
  {
    result = MEMORY[0x1C3BD07B0](&unk_1C2FCAAC0, &type metadata for ImmutableConversationSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF7DBB80);
  }
  return result;
}

unint64_t sub_1C2FA3C64()
{
  unint64_t result;

  result = qword_1EF7DBB88;
  if (!qword_1EF7DBB88)
  {
    result = MEMORY[0x1C3BD07B0](&unk_1C2FCA9F8, &type metadata for ImmutableConversationSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF7DBB88);
  }
  return result;
}

unint64_t sub_1C2FA3CA4()
{
  unint64_t result;

  result = qword_1EF7DBB90;
  if (!qword_1EF7DBB90)
  {
    result = MEMORY[0x1C3BD07B0](&unk_1C2FCAA20, &type metadata for ImmutableConversationSession.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF7DBB90);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return swift_isEscapingClosureAtFileLocation();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return sub_1C2FC9708();
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return sub_1C2FC9B64();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return sub_1C2FC9798();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return sub_1C2FC99A8();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return swift_release();
}

void *OUTLINED_FUNCTION_15_1@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  a4 = a1;
  a5 = v5;
  return _Block_copy(&a2);
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v0, v1);
}

void OUTLINED_FUNCTION_17_1()
{
  NSObject *v0;
  void *v1;

  dispatch_sync(v0, v1);
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1C2FA2FD0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_21_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return sub_1C2FC9B64();
}

uint64_t OUTLINED_FUNCTION_23_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return swift_release();
}

void OUTLINED_FUNCTION_28_0()
{
  const void *v0;

  _Block_release(v0);
}

uint64_t OUTLINED_FUNCTION_29_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_32_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_35_1()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

void sub_1C2FA3EF4()
{
  qword_1ED7AF668 = 0x426567617373654DLL;
  unk_1ED7AF670 = 0xEA00000000007375;
}

void sub_1C2FA3F1C()
{
  qword_1ED7AF678 = 0x737465737341;
  unk_1ED7AF680 = 0xE600000000000000;
}

uint64_t sub_1C2FA3F3C()
{
  uint64_t result;

  sub_1C2FA41B0();
  if (qword_1ED7AF050 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  result = sub_1C2FC9B88();
  qword_1ED7AF608 = result;
  return result;
}

uint64_t *sub_1C2FA3FD0()
{
  if (qword_1ED7AEDC0 != -1)
    swift_once();
  return &qword_1ED7AF608;
}

uint64_t sub_1C2FA4010()
{
  uint64_t result;

  sub_1C2FA41B0();
  if (qword_1ED7AEFD8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  result = sub_1C2FC9B88();
  qword_1ED7AF628 = result;
  return result;
}

uint64_t sub_1C2FA40A4(uint64_t a1)
{
  return sub_1C2FA40EC(a1, qword_1ED7AF5F0, &qword_1ED7AEDC0, (id *)&qword_1ED7AF608);
}

uint64_t sub_1C2FA40C8(uint64_t a1)
{
  return sub_1C2FA40EC(a1, qword_1ED7AF6F8, qword_1ED7AF3E8, (id *)&qword_1ED7AF628);
}

uint64_t sub_1C2FA40EC(uint64_t a1, uint64_t *a2, _QWORD *a3, id *a4)
{
  uint64_t v7;
  id v8;

  v7 = sub_1C2FC98F4();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (*a3 != -1)
    swift_once();
  v8 = *a4;
  return sub_1C2FC9900();
}

id sub_1C2FA4174()
{
  sub_1C2FA3FD0();
  return (id)qword_1ED7AF608;
}

uint64_t sub_1C2FA4194()
{
  return sub_1C2FC97E0();
}

unint64_t sub_1C2FA41B0()
{
  unint64_t result;

  result = qword_1ED7AEF58;
  if (!qword_1ED7AEF58)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED7AEF58);
  }
  return result;
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

uint64_t sub_1C2FA422C()
{
  uint64_t result;

  type metadata accessor for MessageBusInstrumentationUtil();
  swift_allocObject();
  result = sub_1C2FA4264();
  qword_1ED7AF5D8 = result;
  return result;
}

uint64_t sub_1C2FA4264()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = objc_msgSend((id)objc_opt_self(), sel_sharedStream);
  sub_1C2FC9870();
  swift_allocObject();
  *(_QWORD *)(v0 + 24) = sub_1C2FC9864();
  return v0;
}

void sub_1C2FA42C8(uint8_t *a1, uint64_t a2, uint8_t *a3, uint64_t a4, char a5, char a6, int a7, int a8, unsigned __int8 a9)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _WORD *v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  uint8_t *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  os_log_type_t v53;
  _BOOL4 v54;
  uint64_t v55;
  _WORD *v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  uint64_t v58;
  os_log_type_t v59;
  _WORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  os_log_type_t v64;
  _WORD *v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  uint64_t v67;
  os_log_type_t v68;
  _WORD *v69;
  uint64_t v70;
  char *v71;
  NSObject *v72;
  uint64_t v73;
  uint64_t v74;
  uint8_t *v75;
  uint64_t v76;
  int v77;
  int v78;

  v75 = a3;
  v77 = a7;
  v78 = a8;
  v76 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_10();
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v70 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v70 - v17;
  v19 = OUTLINED_FUNCTION_59();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v70 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v70 - v24;
  sub_1C2F9B940((uint64_t)a1, (uint64_t)v18);
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v19) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v25, v18, v19);
    sub_1C2F9BD28(0, (unint64_t *)&unk_1ED7AF4E8);
    v73 = v20;
    (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v23, v25, v19);
    v30 = sub_1C2FA497C((uint64_t)v23);
    v31 = OUTLINED_FUNCTION_26_2(objc_allocWithZone(MEMORY[0x1E0D99FE8]));
    if (v31)
    {
      v32 = v31;
      v72 = v30;
      objc_msgSend(v31, sel_setOrchestratorSessionId_, v30);
      v33 = objc_msgSend(v32, sel_setRequestType_, a4);
      if ((a5 & 1) != 0)
        LODWORD(v34) = 2;
      else
        LODWORD(v34) = 1;
      v35 = OUTLINED_FUNCTION_31_1((uint64_t)v33, sel_setSiriUODEnabled_);
      if ((a6 & 1) != 0)
        v34 = 2;
      else
        v34 = v34;
      OUTLINED_FUNCTION_31_1((uint64_t)v35, sel_setSiriAsrMode_);
      objc_msgSend(v32, sel_setSiriNlMode_, v34);
      v36 = OUTLINED_FUNCTION_26_2(objc_allocWithZone(MEMORY[0x1E0D99F70]));
      if (v36)
      {
        v37 = v36;
        v71 = v25;
        objc_msgSend(v36, sel_setIsNLServerFallbackDisabled_, v77 & 1);
        objc_msgSend(v37, sel_setIsDomainServerFallbackDisabled_, v78 & 1);
        OUTLINED_FUNCTION_31_1((uint64_t)objc_msgSend(v32, sel_setNlv3DeprecationFlags_, v37), sel_setIsAssistantEngineRequest_);
        v38 = OUTLINED_FUNCTION_26_2(objc_allocWithZone(MEMORY[0x1E0D99FB8]));
        if (v38)
        {
          v39 = v38;
          objc_msgSend(v38, sel_setStartedOrChanged_, v32);
          v41 = v74;
          v40 = v75;
          v42 = *(NSObject **)(v74 + 24);
          v43 = (void *)OUTLINED_FUNCTION_13_1();
          if (v43)
          {
            v44 = v43;
            objc_msgSend(v43, sel_setRequestContext_, v39);
            objc_msgSend(*(id *)(v41 + 16), sel_emitMessage_, v44);
            v45 = (void *)sub_1C2FC9834();
            if (!v45
              || (v46 = v45,
                  v47 = objc_msgSend(v45, sel_captureSnapshot),
                  v46,
                  !v47))
            {
              OUTLINED_FUNCTION_25_2();
              OUTLINED_FUNCTION_32_1((uint64_t)v71, v66);

              OUTLINED_FUNCTION_15_2();
              return;
            }
            v48 = objc_msgSend((id)objc_opt_self(), sel_context);
            if (!v48)
            {
              __break(1u);
              return;
            }
            v49 = v48;
            sub_1C2FC89DC();
            if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v19) == 1)
            {
              v50 = 0;
              v51 = v73;
            }
            else
            {
              v50 = (void *)sub_1C2FC89F4();
              v51 = v73;
              OUTLINED_FUNCTION_32_1((uint64_t)v16, *(uint64_t (**)(uint64_t, uint64_t))(v73 + 8));
            }
            OUTLINED_FUNCTION_29_2(v47, sel_logWithEventContext_requestIdentifier_, (uint64_t)v49);
            OUTLINED_FUNCTION_15_2();

            v57 = *(uint64_t (**)(uint64_t, uint64_t))(v51 + 8);
          }
          else
          {
            if (qword_1ED7AEDB0 != -1)
              swift_once();
            v67 = OUTLINED_FUNCTION_7();
            OUTLINED_FUNCTION_38_0(v67, (uint64_t)qword_1ED7AF5F0);
            v68 = OUTLINED_FUNCTION_43();
            if (OUTLINED_FUNCTION_6_2(v68))
            {
              v69 = (_WORD *)OUTLINED_FUNCTION_1_2();
              OUTLINED_FUNCTION_9_1(v69);
              OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v42, (os_log_type_t)v41, "The Orchestration SELF event wrapper failed to build", v40);
              OUTLINED_FUNCTION_0();
            }
            OUTLINED_FUNCTION_15_2();

            OUTLINED_FUNCTION_25_2();
          }
          v61 = (uint64_t)v71;
        }
        else
        {
          v62 = (uint64_t)v71;
          if (qword_1ED7AEDB0 != -1)
            swift_once();
          v63 = OUTLINED_FUNCTION_7();
          OUTLINED_FUNCTION_38_0(v63, (uint64_t)qword_1ED7AF5F0);
          v64 = OUTLINED_FUNCTION_43();
          if (OUTLINED_FUNCTION_6_2(v64))
          {
            v65 = (_WORD *)OUTLINED_FUNCTION_1_2();
            OUTLINED_FUNCTION_9_1(v65);
            OUTLINED_FUNCTION_46_0(&dword_1C2F94000, a9, (os_log_type_t)a4, "Failed to create the RequestContext message for start of request", (uint8_t *)0x1F34D2000);
            OUTLINED_FUNCTION_0();
          }
          OUTLINED_FUNCTION_15_2();

          OUTLINED_FUNCTION_25_2();
          v61 = v62;
        }
LABEL_33:
        OUTLINED_FUNCTION_32_1(v61, v57);
        return;
      }
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v58 = OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_38_0(v58, (uint64_t)qword_1ED7AF5F0);
      v59 = OUTLINED_FUNCTION_43();
      if (OUTLINED_FUNCTION_6_2(v59))
      {
        v60 = (_WORD *)OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_9_1(v60);
        OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v34, (os_log_type_t)a4, "Failed to create the nlClassicDeprecationFlags message", (uint8_t *)0x1F34D2000);
        OUTLINED_FUNCTION_0();
      }
      OUTLINED_FUNCTION_15_2();

      OUTLINED_FUNCTION_25_2();
    }
    else
    {
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v52 = OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_38_0(v52, (uint64_t)qword_1ED7AF5F0);
      v53 = OUTLINED_FUNCTION_43();
      v54 = OUTLINED_FUNCTION_6_2(v53);
      v55 = v73;
      if (v54)
      {
        v56 = (_WORD *)OUTLINED_FUNCTION_1_2();
        OUTLINED_FUNCTION_9_1(v56);
        OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v30, (os_log_type_t)a4, "Failed to create the RequestStarted message", (uint8_t *)0x1F34D2000);
        OUTLINED_FUNCTION_0();
      }

      v57 = *(uint64_t (**)(uint64_t, uint64_t))(v55 + 8);
    }
    v61 = (uint64_t)v25;
    goto LABEL_33;
  }
  sub_1C2FA5C58((uint64_t)v18);
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v26 = OUTLINED_FUNCTION_7();
  v27 = OUTLINED_FUNCTION_38_0(v26, (uint64_t)qword_1ED7AF5F0);
  v28 = sub_1C2FC9B10();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_9_1(v29);
    OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v27, v28, "Starting a request without a sessinId", a1);
    OUTLINED_FUNCTION_0();
  }

}

id sub_1C2FA497C(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_1C2FC89F4();
  v4 = objc_msgSend(v2, sel_initWithNSUUID_, v3);

  v5 = sub_1C2FC8A0C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

void sub_1C2FA49F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  os_log_type_t v17;
  _WORD *v18;
  uint64_t v19;
  uint64_t v20;
  os_log_type_t v21;
  _WORD *v22;
  uint64_t v23;
  uint64_t v24;
  os_log_type_t v25;
  _WORD *v26;
  NSObject *v27;
  NSObject *v28;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v1);
  v3 = (uint8_t *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99FC8]), sel_init);
  if (!v4)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v16 = OUTLINED_FUNCTION_7();
    v28 = OUTLINED_FUNCTION_38_0(v16, (uint64_t)qword_1ED7AF5F0);
    v17 = sub_1C2FC9B10();
    if (OUTLINED_FUNCTION_11_1(v28))
    {
      v18 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_14_2(v18);
      OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v28, v17, "Failed to create the message for end of request", (uint8_t *)v0);
      OUTLINED_FUNCTION_0();
    }
    goto LABEL_26;
  }
  v28 = v4;
  -[NSObject setExists:](v4, sel_setExists_, 1);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99FB8]), sel_init);
  if (!v5)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v19 = OUTLINED_FUNCTION_7();
    v20 = OUTLINED_FUNCTION_38_0(v19, (uint64_t)qword_1ED7AF5F0);
    v21 = OUTLINED_FUNCTION_23_2(v20);
    if (OUTLINED_FUNCTION_11_1(v27))
    {
      v22 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_14_2(v22);
      OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v27, v21, "Failed to create the RequestContext message for end of request", (uint8_t *)v0);
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_19_2();
    goto LABEL_26;
  }
  v6 = v5;
  v7 = OUTLINED_FUNCTION_13_1();
  if (!v7)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v23 = OUTLINED_FUNCTION_7();
    v24 = OUTLINED_FUNCTION_38_0(v23, (uint64_t)qword_1ED7AF5F0);
    v25 = OUTLINED_FUNCTION_23_2(v24);
    if (os_log_type_enabled(v27, v25))
    {
      v26 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_9_1(v26);
      OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v27, v25, "The Orchestration SELF event wrapper failed to build", v3);
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_19_2();
    goto LABEL_25;
  }
  v8 = (void *)v7;
  objc_msgSend(v6, sel_setEnded_, v28);
  OUTLINED_FUNCTION_22_2(v8, sel_setRequestContext_);
  objc_msgSend(*(id *)(v0 + 16), sel_emitMessage_, v8);
  v9 = (void *)sub_1C2FC9834();
  if (!v9
    || (v10 = v9,
        v11 = objc_msgSend(v9, sel_captureSnapshot),
        v10,
        !v11))
  {

LABEL_25:
LABEL_26:
    OUTLINED_FUNCTION_8_3(v28);
    return;
  }
  v12 = objc_msgSend((id)objc_opt_self(), sel_context);
  if (v12)
  {
    v13 = v12;
    OUTLINED_FUNCTION_30_2();
    v14 = OUTLINED_FUNCTION_59();
    v15 = 0;
    if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v14) != 1)
    {
      v15 = (void *)sub_1C2FC89F4();
      (*(void (**)(uint8_t *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v3, v14);
    }
    OUTLINED_FUNCTION_29_2(v11, sel_logWithEventContext_requestIdentifier_, (uint64_t)v13);

    OUTLINED_FUNCTION_17_2();
    OUTLINED_FUNCTION_16_2();
  }
  else
  {
    __break(1u);
  }
}

void sub_1C2FA4D88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1C2FA4DC0(a1, a2, a3, a4, (Class *)0x1E0D9A000, (SEL *)&selRef_setResultCandidate_, "The ResultCandidate received event wasn't created");
}

void sub_1C2FA4DA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1C2FA4DC0(a1, a2, a3, a4, (Class *)0x1E0D9A008, (SEL *)&selRef_setResultSelected_, "The ResultCandidate selected event wasn't created");
}

void sub_1C2FA4DC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, Class *a5, SEL *a6, char *a7)
{
  uint64_t v7;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  os_log_type_t v22;
  _WORD *v23;
  uint64_t v24;
  os_log_type_t v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  _WORD *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  NSObject *v45;

  v10 = v7;
  v11 = objc_msgSend(objc_allocWithZone(*a5), sel_init);
  if (!v11)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v21 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_38_0(v21, (uint64_t)qword_1ED7AF5F0);
    v22 = OUTLINED_FUNCTION_10_2();
    if (OUTLINED_FUNCTION_11_1(v43))
    {
      v23 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_14_2(v23);
      OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v43, v22, a7, (uint8_t *)v7);
      OUTLINED_FUNCTION_0();
    }
    goto LABEL_12;
  }
  v12 = v11;
  objc_msgSend(v11, sel_setExists_, 1);
  v13 = *(_QWORD *)(v7 + 24);
  v14 = (void *)sub_1C2FC984C();
  if (v14)
  {
    v44 = (uint64_t)v14;
    OUTLINED_FUNCTION_22_2(v14, *a6);
    OUTLINED_FUNCTION_28_1(*(id *)(v10 + 16), sel_emitMessage_, v15, v16, v17, v18, v19, v20, v41, v44);

LABEL_12:
    OUTLINED_FUNCTION_7_3(v43);
    return;
  }
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v24 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_38_0(v24, (uint64_t)qword_1ED7AF5F0);
  v25 = OUTLINED_FUNCTION_10_2();
  if (OUTLINED_FUNCTION_5_2(v25, v26, v27, v28, v29, v30, v31, v32, v41, v43))
  {
    v40 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_9_1(v40);
    OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v45, (os_log_type_t)v13, "The Orchestration SELF event wrapper failed to build", (uint8_t *)a7);
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_12_1(0, v33, v34, v35, v36, v37, v38, v39, v42, v45);
  OUTLINED_FUNCTION_7_3(v12);
}

void sub_1C2FA4F74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  NSObject *v5;
  uint8_t *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  os_log_type_t v19;
  _WORD *v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t v23;
  _WORD *v24;
  NSObject *v25;
  NSObject *v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99FA8]), sel_init);
  if (!v5)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v18 = OUTLINED_FUNCTION_7();
    v26 = OUTLINED_FUNCTION_38_0(v18, (uint64_t)qword_1ED7AF5F0);
    v19 = sub_1C2FC9B10();
    if (OUTLINED_FUNCTION_11_1(v26))
    {
      v20 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_14_2(v20);
      OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v26, v19, "The request canclled event wasn't created", (uint8_t *)v0);
      OUTLINED_FUNCTION_0();
    }
    goto LABEL_21;
  }
  v26 = v5;
  -[NSObject setReason:](v5, sel_setReason_, 2);
  v6 = *(uint8_t **)(v0 + 24);
  v7 = OUTLINED_FUNCTION_13_1();
  if (!v7)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v21 = OUTLINED_FUNCTION_7();
    v22 = OUTLINED_FUNCTION_38_0(v21, (uint64_t)qword_1ED7AF5F0);
    v23 = OUTLINED_FUNCTION_23_2(v22);
    if (OUTLINED_FUNCTION_11_1(v25))
    {
      v24 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_14_2(v24);
      OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v25, v23, "The Orchestration SELF event wrapper failed to build", v6);
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_19_2();
LABEL_21:
    OUTLINED_FUNCTION_8_3(v26);
    return;
  }
  v8 = (void *)v7;
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99FB8]), sel_init);
  v10 = v9;
  v25 = v9;
  if (v9)
  {
    -[NSObject setCancelled:](v9, sel_setCancelled_, v26);
    v10 = v25;
  }
  objc_msgSend(v8, sel_setRequestContext_, v10, v25);
  objc_msgSend(*(id *)(v1 + 16), sel_emitMessage_, v8);
  v11 = (void *)sub_1C2FC9834();
  if (v11
    && (v12 = v11,
        v13 = objc_msgSend(v11, sel_captureSnapshot),
        v12,
        v13))
  {
    v14 = objc_msgSend((id)objc_opt_self(), sel_context);
    if (v14)
    {
      v15 = v14;
      OUTLINED_FUNCTION_30_2();
      v16 = OUTLINED_FUNCTION_59();
      v17 = 0;
      if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v16) != 1)
      {
        v17 = (void *)sub_1C2FC89F4();
        (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v4, v16);
      }
      OUTLINED_FUNCTION_29_2(v13, sel_logWithEventContext_requestIdentifier_, (uint64_t)v15);

      OUTLINED_FUNCTION_17_2();
      OUTLINED_FUNCTION_19_2();
      OUTLINED_FUNCTION_16_2();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {

    OUTLINED_FUNCTION_17_2();
    OUTLINED_FUNCTION_8_3(v25);
  }
}

void sub_1C2FA5274(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint8_t *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  os_log_type_t v27;
  _WORD *v28;
  uint64_t v29;
  os_log_type_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  _WORD *v45;
  uint64_t v46;
  os_log_type_t v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  uint8_t *v62;
  uint64_t v63;
  os_log_type_t v64;
  int v65;
  int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  uint8_t *v79;
  uint64_t v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  id v97;
  NSObject *v98;
  NSObject *v99;
  NSObject *v100;

  v4 = v2;
  v7 = *(uint8_t **)(v2 + 24);
  v8 = OUTLINED_FUNCTION_21_2();
  if (!v8)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v26 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_38_0(v26, (uint64_t)qword_1ED7AF5F0);
    v27 = OUTLINED_FUNCTION_10_2();
    if (OUTLINED_FUNCTION_11_1(v96))
    {
      v28 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_14_2(v28);
      OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v96, v27, "The Orchestration SELF Assets event wrapper failed to build", v7);
      OUTLINED_FUNCTION_0();
    }
    goto LABEL_28;
  }
  v9 = (void *)v8;
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99EE0]), sel_init);
  if (v10)
  {
    v11 = v10;
    v12 = OUTLINED_FUNCTION_21_2();
    if (v12)
    {
      v13 = (void *)v12;
      v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D99ED8]), sel_init);
      if (v14)
      {
        v97 = v14;
        sub_1C2FA5BF0(a1, v11, &qword_1ED7AF4F8, 0x1E0D9A3D0, (SEL *)&selRef_setAssets_);
        objc_msgSend(v9, sel_setAvailableAssets_, v11);
        v15 = *(void **)(v4 + 16);
        OUTLINED_FUNCTION_22_2(v15, sel_emitMessage_);
        if (a2)
        {
          sub_1C2FA5BF0(a2, v97, &qword_1ED7AF500, 0x1E0D9A5E8, (SEL *)&selRef_setUafAssetSets_);
          OUTLINED_FUNCTION_28_1(v13, sel_setAssetSetsReported_, v16, v17, v18, v19, v20, v21, v92, (uint64_t)v97);
          if (qword_1ED7AEDB0 != -1)
            swift_once();
          v22 = OUTLINED_FUNCTION_7();
          v23 = OUTLINED_FUNCTION_38_0(v22, (uint64_t)qword_1ED7AF5F0);
          v24 = sub_1C2FC9B04();
          if (os_log_type_enabled(v23, v24))
          {
            v25 = (uint8_t *)OUTLINED_FUNCTION_1_2();
            *(_WORD *)v25 = 0;
            OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v23, v24, "ORCHAssetSetsReported event is being emitted now", v25);
            OUTLINED_FUNCTION_0();
          }

          objc_msgSend(v15, sel_emitMessage_, v13);
LABEL_28:
          OUTLINED_FUNCTION_7_3(v96);
          return;
        }
        if (qword_1ED7AEDB0 != -1)
          swift_once();
        v80 = OUTLINED_FUNCTION_7();
        v81 = OUTLINED_FUNCTION_38_0(v80, (uint64_t)qword_1ED7AF5F0);
        v82 = sub_1C2FC9B28();
        if (os_log_type_enabled(v81, v82))
        {
          v83 = (uint8_t *)OUTLINED_FUNCTION_1_2();
          *(_WORD *)v83 = 0;
          OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v81, v82, "No asset sets, so assetSetsReported event is not being emitted", v83);
          OUTLINED_FUNCTION_0();
        }

        OUTLINED_FUNCTION_12_1(v84, v85, v86, v87, v88, v89, v90, v91, v92, v97);
      }
      else
      {
        if (qword_1ED7AEDB0 != -1)
          swift_once();
        v63 = OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_38_0(v63, (uint64_t)qword_1ED7AF5F0);
        v64 = OUTLINED_FUNCTION_10_2();
        if (OUTLINED_FUNCTION_5_2(v64, v65, v66, v67, v68, v69, v70, v71, v92, v96))
        {
          v79 = (uint8_t *)OUTLINED_FUNCTION_1_2();
          *(_WORD *)v79 = 0;
          OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v100, (os_log_type_t)v7, "Failed to create message to report asset sets", v79);
          OUTLINED_FUNCTION_0();
        }
        OUTLINED_FUNCTION_12_1(0, v72, v73, v74, v75, v76, v77, v78, v95, v100);

      }
    }
    else
    {
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v46 = OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_38_0(v46, (uint64_t)qword_1ED7AF5F0);
      v47 = OUTLINED_FUNCTION_10_2();
      if (OUTLINED_FUNCTION_5_2(v47, v48, v49, v50, v51, v52, v53, v54, v92, v96))
      {
        v62 = (uint8_t *)OUTLINED_FUNCTION_1_2();
        *(_WORD *)v62 = 0;
        OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v99, (os_log_type_t)v7, "The Orchestration SELF AssetSets event wrapper failed to build", v62);
        OUTLINED_FUNCTION_0();
      }
      OUTLINED_FUNCTION_12_1(0, v55, v56, v57, v58, v59, v60, v61, v94, v99);

    }
    OUTLINED_FUNCTION_7_3(v11);
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v29 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_38_0(v29, (uint64_t)qword_1ED7AF5F0);
    v30 = OUTLINED_FUNCTION_10_2();
    if (OUTLINED_FUNCTION_5_2(v30, v31, v32, v33, v34, v35, v36, v37, v92, v96))
    {
      v45 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_9_1(v45);
      OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v98, (os_log_type_t)v7, "Failed to create message to report assets", v3);
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_12_1(0, v38, v39, v40, v41, v42, v43, v44, v93, v98);
    OUTLINED_FUNCTION_7_3(v9);
  }
}

void sub_1C2FA5728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v9 = sub_1C2FC9828();
  if (v9)
  {
    v14 = (id)v9;
    objc_msgSend(*(id *)(v4 + 16), sel_emitMessage_);

  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v10 = OUTLINED_FUNCTION_7();
    v11 = __swift_project_value_buffer(v10, (uint64_t)qword_1ED7AF5F0);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    sub_1C2FC98E8();
    v12 = OUTLINED_FUNCTION_43();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v15 = swift_slowAlloc();
      *(_DWORD *)v13 = 136315394;
      swift_bridgeObjectRetain();
      sub_1C2FC4294(a1, a2, &v15);
      sub_1C2FC9BA0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v13 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_1C2FC4294(a3, a4, &v15);
      sub_1C2FC9BA0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1C2F94000, v11, v12, "Unable to logRequestSubRequestLink for rootRequestId=%s and childRequestId=%s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
}

void sub_1C2FA597C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint8_t *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_log_type_t v21;
  _WORD *v22;
  uint64_t v23;
  os_log_type_t v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  _WORD *v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  id v44;
  NSObject *v45;

  v6 = v5;
  v8 = *(uint8_t **)(v5 + 24);
  v9 = sub_1C2FC9840();
  if (!v9)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v20 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_38_0(v20, (uint64_t)qword_1ED7AF5F0);
    v21 = OUTLINED_FUNCTION_10_2();
    if (OUTLINED_FUNCTION_11_1(v43))
    {
      v22 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_14_2(v22);
      OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v43, v21, "Could not build wrapper when logging logChildRequestStarted", v8);
      OUTLINED_FUNCTION_0();
    }
    goto LABEL_14;
  }
  v10 = v9;
  v11 = sub_1C2FC9858();
  if (v11)
  {
    v12 = (void *)v11;
    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A038]), sel_init);
    objc_msgSend(v13, sel_setSubRequestType_, a5);
    v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D9A030]), sel_init);
    if (v44)
      objc_msgSend(v44, sel_setSubRequestId_, v12);
    objc_msgSend(v44, sel_setStartedOrChanged_, v13);
    OUTLINED_FUNCTION_28_1(v10, sel_setSubRequestContext_, v14, v15, v16, v17, v18, v19, v41, (uint64_t)v44);
    OUTLINED_FUNCTION_22_2(*(id *)(v6 + 16), sel_emitMessage_);

LABEL_14:
    v40 = v43;
    goto LABEL_15;
  }
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v23 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_38_0(v23, (uint64_t)qword_1ED7AF5F0);
  v24 = OUTLINED_FUNCTION_10_2();
  if (OUTLINED_FUNCTION_5_2(v24, v25, v26, v27, v28, v29, v30, v31, v41, v43))
  {
    v39 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_9_1(v39);
    OUTLINED_FUNCTION_46_0(&dword_1C2F94000, v45, (os_log_type_t)v8, "The subRequestId is not a valid UUID, will not emit for logChildRequestStarted", (uint8_t *)v6);
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_12_1(0, v32, v33, v34, v35, v36, v37, v38, v42, v45);
  v40 = v10;
LABEL_15:

}

uint64_t sub_1C2FA5B8C()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_1C2FA5BB0()
{
  sub_1C2FA5B8C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MessageBusInstrumentationUtil()
{
  return objc_opt_self();
}

void sub_1C2FA5BF0(uint64_t a1, void *a2, unint64_t *a3, uint64_t a4, SEL *a5)
{
  id v7;

  sub_1C2F9BD28(0, a3);
  v7 = (id)sub_1C2FC9AB0();
  objc_msgSend(a2, *a5, v7);

}

uint64_t sub_1C2FA5C58(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_slowAlloc();
}

BOOL OUTLINED_FUNCTION_5_2(os_log_type_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t oslog)
{
  return os_log_type_enabled(oslog, a1);
}

BOOL OUTLINED_FUNCTION_6_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_7_3(id a1)
{

}

void OUTLINED_FUNCTION_8_3(id a1)
{

}

_WORD *OUTLINED_FUNCTION_9_1(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return sub_1C2FC9B10();
}

BOOL OUTLINED_FUNCTION_11_1(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

void OUTLINED_FUNCTION_12_1(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return sub_1C2FC984C();
}

_WORD *OUTLINED_FUNCTION_14_2(_WORD *result)
{
  *result = 0;
  return result;
}

void OUTLINED_FUNCTION_15_2()
{
  uint64_t v0;

}

void OUTLINED_FUNCTION_17_2()
{
  uint64_t v0;

}

void OUTLINED_FUNCTION_19_2()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_21_2()
{
  return sub_1C2FC984C();
}

id OUTLINED_FUNCTION_22_2(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_23_2(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 80) = a1;
  return sub_1C2FC9B10();
}

id OUTLINED_FUNCTION_26_2(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

id OUTLINED_FUNCTION_28_1(id a1, SEL a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return objc_msgSend(a1, a2, a10);
}

id OUTLINED_FUNCTION_29_2(id a1, SEL a2, uint64_t a3)
{
  uint64_t v3;

  return objc_msgSend(a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_30_2()
{
  return sub_1C2FC89DC();
}

id OUTLINED_FUNCTION_31_1(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_1C2FA5DB8(void *a1)
{
  swift_unownedRetainStrong();
  LOBYTE(a1) = sub_1C2F9D5D0(a1);
  swift_release();
  return a1 & 1;
}

uint64_t sub_1C2FA5DF8()
{
  swift_unownedRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MessagePublisher()
{
  return objc_opt_self();
}

uint64_t sub_1C2FA5E3C(void *a1)
{
  return sub_1C2FA5DB8(a1) & 1;
}

void sub_1C2FA5E60()
{
  _DWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  id v3;
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
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_42_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_31_2();
  v3 = objc_allocWithZone((Class)sub_1C2FC8C04());
  if (sub_1C2FC8BF8())
  {
    OUTLINED_FUNCTION_45_1();
    v4 = OUTLINED_FUNCTION_36_1(OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil);
    OUTLINED_FUNCTION_17_3(v4);
    OUTLINED_FUNCTION_27_1((uint64_t)v0);
    OUTLINED_FUNCTION_59_0(OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils);
    OUTLINED_FUNCTION_57_0();
    OUTLINED_FUNCTION_35_2();
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_32_2(v1);
    OUTLINED_FUNCTION_15_3();
    v5 = OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_29_3(v5, v6, v7, v8, v9, v10, v11, v12, 0);
    OUTLINED_FUNCTION_64_0();
    OUTLINED_FUNCTION_61_0();
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v13 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_4_2(v13, (uint64_t)qword_1ED7AF5F0);
    sub_1C2FC98E8();
    v14 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_21(v14))
    {
      OUTLINED_FUNCTION_1();
      v15 = OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_48_1(v15);
      *v0 = 136315138;
      v16 = OUTLINED_FUNCTION_18_2();
      v18 = OUTLINED_FUNCTION_16_3(v16, v17, &v21);
      OUTLINED_FUNCTION_9_2(v18);
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_1_3(&dword_1C2F94000, v19, v20, "Failed to create StartTextRequestMessage for request Id: %s");
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_14_3();
  }
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_27();
}

void sub_1C2FA600C()
{
  _DWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  id v4;
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
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_69();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_34_1();
  v4 = objc_allocWithZone((Class)sub_1C2FC8E98());
  if (sub_1C2FC8E38())
  {
    OUTLINED_FUNCTION_45_1();
    v5 = OUTLINED_FUNCTION_36_1(OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil);
    OUTLINED_FUNCTION_17_3(v5);
    OUTLINED_FUNCTION_27_1((uint64_t)v0);
    OUTLINED_FUNCTION_59_0(OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils);
    OUTLINED_FUNCTION_57_0();
    OUTLINED_FUNCTION_35_2();
    OUTLINED_FUNCTION_67();
    OUTLINED_FUNCTION_32_2(v2);
    OUTLINED_FUNCTION_15_3();
    v6 = OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_29_3(v6, v7, v8, v9, v10, v11, v12, v13, 1u);
    OUTLINED_FUNCTION_64_0();
    OUTLINED_FUNCTION_61_0();
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v14 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_4_2(v14, (uint64_t)qword_1ED7AF5F0);
    sub_1C2FC98E8();
    v15 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_21(v15))
    {
      OUTLINED_FUNCTION_1();
      v16 = OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_48_1(v16);
      *v0 = 136315138;
      v17 = OUTLINED_FUNCTION_18_2();
      v19 = OUTLINED_FUNCTION_16_3(v17, v18, &v22);
      OUTLINED_FUNCTION_9_2(v19);
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_1_3(&dword_1C2F94000, v20, v21, "Failed to create StartRootTextRequestMessage for request Id: %s");
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_14_3();
  }
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FA61E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9)
{
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
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;

  v31 = a7;
  v32 = a8;
  v29 = a4;
  v30 = a5;
  v33 = a9;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7DBB98);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF410);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *MEMORY[0x1E0D9E640];
  v22 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v20, v21, v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v20, 0, 1, v22);
  sub_1C2FC8E74();
  swift_bridgeObjectRetain();
  sub_1C2FC8E50();
  v23 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v17, v29, v23);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v23);
  sub_1C2FC8E8C();
  swift_bridgeObjectRetain();
  sub_1C2FC8E80();
  v24 = sub_1C2FC95F4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v14, v31, v24);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v24);
  sub_1C2FC8E5C();
  v25 = v32;
  sub_1C2FC8E68();
  v26 = sub_1C2FC9624();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v11, v33, v26);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v26);
  return sub_1C2FC8E44();
}

void sub_1C2FA6468(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_72(a1, a2, a3, a4, a5, a6, a7, a8, "Failed to create MUXTextBasedResultCandidateMessage for request Id: %s");
  OUTLINED_FUNCTION_58_0();
}

uint64_t sub_1C2FA64A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v21[3];
  id v22;

  v21[1] = a5;
  v21[2] = a7;
  v22 = a9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *MEMORY[0x1E0D9E640];
  v17 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v15, v16, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  sub_1C2FC91E0();
  swift_bridgeObjectRetain();
  sub_1C2FC91C8();
  v18 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v12, a4, v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v18);
  sub_1C2FC91F8();
  swift_bridgeObjectRetain();
  sub_1C2FC91EC();
  if (qword_1ED7AEFC8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1C2FC91BC();
  swift_bridgeObjectRetain();
  sub_1C2FC9204();
  v19 = v22;
  return sub_1C2FC91D4();
}

void sub_1C2FA6698()
{
  _DWORD *v0;
  _DWORD *v1;
  id v2;
  void *v3;
  uint64_t v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = v0;
  OUTLINED_FUNCTION_44_1();
  v2 = objc_allocWithZone((Class)sub_1C2FC9138());
  v3 = (void *)sub_1C2FC90CC();
  if (v3)
  {
    OUTLINED_FUNCTION_24_2();
    if (qword_1ED7AEFC8 != -1)
      swift_once();
    OUTLINED_FUNCTION_52_0(&qword_1ED7AF630);

  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v4 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_4_2(v4, (uint64_t)qword_1ED7AF5F0);
    sub_1C2FC98E8();
    v5 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_21(v5))
    {
      OUTLINED_FUNCTION_1();
      v10 = OUTLINED_FUNCTION_2_2();
      *v1 = 136315138;
      v6 = OUTLINED_FUNCTION_18_2();
      OUTLINED_FUNCTION_16_3(v6, v7, &v10);
      OUTLINED_FUNCTION_10_3();
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_1_3(&dword_1C2F94000, v8, v9, "Failed to create MUXTextBasedResultSelectedMessage for request Id: %s");
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_14_3();
  }
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_37_0();
}

uint64_t sub_1C2FA684C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v21 = a5;
  v22 = a7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF490);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *MEMORY[0x1E0D9E640];
  v18 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v16, v17, v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
  sub_1C2FC9114();
  swift_bridgeObjectRetain();
  sub_1C2FC90E4();
  v19 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v13, a4, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v19);
  sub_1C2FC912C();
  swift_bridgeObjectRetain();
  sub_1C2FC9120();
  if (qword_1ED7AEFC8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1C2FC9108();
  sub_1C2FC90F0();
  sub_1C2FC90FC();
  sub_1C2FA8A8C(v22, (uint64_t)v10);
  return sub_1C2FC90D8();
}

void sub_1C2FA6A70()
{
  OUTLINED_FUNCTION_62_0();
  OUTLINED_FUNCTION_58_0();
}

void sub_1C2FA6AA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  id v14;
  void *v15;
  uint64_t v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v13 = v10;
  OUTLINED_FUNCTION_68();
  v14 = objc_allocWithZone((Class)sub_1C2FC93E4());
  v15 = (void *)sub_1C2FC9384();
  if (v15)
  {
    OUTLINED_FUNCTION_24_2();
    sub_1C2FA4D88(v12, v11, a9, a10);

  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v16 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_4_2(v16, (uint64_t)qword_1ED7AF5F0);
    sub_1C2FC98E8();
    v17 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_21(v17))
    {
      OUTLINED_FUNCTION_1();
      v18 = OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_48_1(v18);
      *v13 = 136315138;
      v19 = OUTLINED_FUNCTION_18_2();
      OUTLINED_FUNCTION_16_3(v19, v20, &v23);
      OUTLINED_FUNCTION_10_3();
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_1_3(&dword_1C2F94000, v21, v22, "Failed to create TextBasedTRPCandidateForPlannerMessage for request Id: %s");
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_14_3();
  }
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_41_1();
}

uint64_t sub_1C2FA6C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v11;
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
  uint64_t v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v25[1] = a5;
  v26 = a7;
  v25[0] = a4;
  v27 = a11;
  v28 = a8;
  v29 = a10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF490);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *MEMORY[0x1E0D9E640];
  v21 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v19, v20, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v21);
  sub_1C2FC93A8();
  swift_bridgeObjectRetain();
  sub_1C2FC9390();
  v22 = sub_1C2FC8A0C();
  (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v16, v25[0], v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v22);
  sub_1C2FC93CC();
  swift_bridgeObjectRetain();
  sub_1C2FC93C0();
  v23 = sub_1C2FC9798();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v13, v26, v23);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v23);
  sub_1C2FC93B4();
  swift_bridgeObjectRetain();
  sub_1C2FC93D8();
  swift_bridgeObjectRetain();
  return sub_1C2FC939C();
}

BOOL sub_1C2FA6E54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1C2FA7DA8(a1, a2, a3, a4, a5, (uint64_t (*)(_QWORD))MEMORY[0x1E0D9CCD8], (uint64_t)sub_1C2FA8A04, (uint64_t (*)(uint64_t, _QWORD *))MEMORY[0x1E0D9CCD0], "Failed to create ResultSelectedMessage for request Id: %s");
}

void sub_1C2FA6E98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7)
{
  uint64_t v7;
  uint64_t v8;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_68();
  v11 = objc_allocWithZone((Class)sub_1C2FC94D4());
  v12 = (void *)sub_1C2FC948C();
  v13 = v12;
  if (v12)
  {
    sub_1C2F9D5D0(v12);
    sub_1C2FA4DA4(v8, v7, a6, (uint64_t)a7);

  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v14 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_4_2(v14, (uint64_t)qword_1ED7AF5F0);
    sub_1C2FC98E8();
    v15 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_21(v15))
    {
      OUTLINED_FUNCTION_1();
      v20 = OUTLINED_FUNCTION_2_2();
      *a7 = 136315138;
      v16 = OUTLINED_FUNCTION_18_2();
      OUTLINED_FUNCTION_16_3(v16, v17, &v20);
      OUTLINED_FUNCTION_10_3();
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_1_3(&dword_1C2F94000, v18, v19, "Failed to create StoppedListeningForTextContinuationForPlannerMessage for request Id: %s");
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_14_3();
  }
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_37_0();
}

uint64_t sub_1C2FA7024(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];

  v18[0] = a5;
  v18[1] = a7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *MEMORY[0x1E0D9E640];
  v15 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  sub_1C2FC94A4();
  swift_bridgeObjectRetain();
  sub_1C2FC9498();
  v16 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v10, a4, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v16);
  sub_1C2FC94C8();
  swift_bridgeObjectRetain();
  sub_1C2FC94BC();
  swift_bridgeObjectRetain();
  return sub_1C2FC94B0();
}

uint64_t sub_1C2FA71B8(uint64_t a1)
{
  uint64_t *v1;

  return sub_1C2FA7024(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

void sub_1C2FA71CC()
{
  uint8_t *v0;
  uint64_t v1;
  uint8_t *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;

  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_42_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_31_2();
  v5 = objc_allocWithZone((Class)sub_1C2FC903C());
  if (sub_1C2FC8BF8())
  {
    OUTLINED_FUNCTION_45_1();
    v6 = OUTLINED_FUNCTION_36_1(OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil);
    OUTLINED_FUNCTION_17_3(v6);
    v17 = OUTLINED_FUNCTION_27_1((uint64_t)v2);
    v16 = AFShouldRunAsrOnServerForUOD();
    OUTLINED_FUNCTION_28_2();
    v7 = *(_QWORD *)(v3 + OBJC_IVAR___SRDRequestDispatcherInternal_siriInputLocale);
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_25_3();
    OUTLINED_FUNCTION_66_0();
    OUTLINED_FUNCTION_28_2();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_15_3();
    OUTLINED_FUNCTION_40_1();
    sub_1C2FA42C8(v2, v1, v0, 4, v17, v16, v7 & 1, v5 & 1, 0);
    OUTLINED_FUNCTION_64_0();
    OUTLINED_FUNCTION_61_0();
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v8 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_4_2(v8, (uint64_t)qword_1ED7AF5F0);
    sub_1C2FC98E8();
    v9 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_21(v9))
    {
      OUTLINED_FUNCTION_1();
      v10 = OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_48_1(v10);
      *(_DWORD *)v2 = 136315138;
      v11 = OUTLINED_FUNCTION_18_2();
      v13 = OUTLINED_FUNCTION_16_3(v11, v12, &v18);
      OUTLINED_FUNCTION_9_2(v13);
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_1_3(&dword_1C2F94000, v14, v15, "Failed to create StartDirectActionRequestMessage for request Id: %s");
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_14_3();
  }
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_27();
}

void sub_1C2FA73C8()
{
  uint64_t v0;
  void *v1;
  void *v2;
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
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  id v23;
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_30_1();
  v2 = v1;
  v25 = v3;
  v24 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF410);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_23();
  v8 = v7 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_23();
  v12 = v11 - v10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_55_0();
  v14 = *MEMORY[0x1E0D9E640];
  v15 = OUTLINED_FUNCTION_65_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v0, v14, v15);
  OUTLINED_FUNCTION_49_1();
  __swift_storeEnumTagSinglePayload(v16, v17, v18, v15);
  sub_1C2FC8A90();
  swift_bridgeObjectRetain();
  sub_1C2FC8A6C();
  v19 = OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_56_0();
  v20(v12, v24, v19);
  OUTLINED_FUNCTION_60_0(v12);
  sub_1C2FC8AA8();
  swift_bridgeObjectRetain();
  sub_1C2FC8A9C();
  v21 = sub_1C2FC95F4();
  OUTLINED_FUNCTION_56_0();
  v22(v8, v25, v21);
  OUTLINED_FUNCTION_60_0(v8);
  sub_1C2FC8A78();
  v23 = v2;
  sub_1C2FC8A84();
  OUTLINED_FUNCTION_27();
}

void sub_1C2FA754C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_72(a1, a2, a3, a4, a5, a6, a7, a8, "Failed to create MUXDirectActionResultCandidateMessage for request Id: %s");
  OUTLINED_FUNCTION_58_0();
}

void sub_1C2FA7588(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, const char *a12)
{
  uint64_t v12;
  _DWORD *v13;
  os_log_type_t v14;
  uint64_t v15;
  id v16;
  uint64_t (*v17)(uint64_t, char *);
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_12_2();
  v16 = objc_allocWithZone((Class)OUTLINED_FUNCTION_46_1());
  v18 = (void *)OUTLINED_FUNCTION_50_0((uint64_t)v16, v17);
  if (v18)
  {
    OUTLINED_FUNCTION_24_2();
    if (qword_1ED7AEFC8 != -1)
      swift_once();
    sub_1C2FA4D88(v12, v15, qword_1ED7AF630, *(uint64_t *)algn_1ED7AF638);

  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v19 = OUTLINED_FUNCTION_7();
    v20 = __swift_project_value_buffer(v19, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v21 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_21(v21))
    {
      OUTLINED_FUNCTION_1();
      v22 = OUTLINED_FUNCTION_2_2();
      *v13 = 136315138;
      OUTLINED_FUNCTION_16_0();
      sub_1C2FC4294(v12, v15, &v22);
      OUTLINED_FUNCTION_73();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_8_4(&dword_1C2F94000, v20, v14, a12);
      OUTLINED_FUNCTION_53_0();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
  }
  OUTLINED_FUNCTION_43_1();
}

uint64_t sub_1C2FA7744(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[4];

  v20[1] = a5;
  v20[2] = a7;
  v20[3] = a9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *MEMORY[0x1E0D9E640];
  v17 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v15, v16, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v17);
  sub_1C2FC9360();
  swift_bridgeObjectRetain();
  sub_1C2FC9348();
  v18 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v12, a4, v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v18);
  sub_1C2FC9378();
  swift_bridgeObjectRetain();
  sub_1C2FC936C();
  if (qword_1ED7AEFC8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1C2FC933C();
  swift_bridgeObjectRetain();
  sub_1C2FC9330();
  swift_bridgeObjectRetain();
  return sub_1C2FC9354();
}

void sub_1C2FA7934()
{
  _DWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _DWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = v0;
  OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_44_1();
  v4 = objc_allocWithZone((Class)sub_1C2FC91B0());
  v5 = (void *)sub_1C2FC9144();
  if (v5)
  {
    OUTLINED_FUNCTION_24_2();
    if (qword_1ED7AEFC8 != -1)
      swift_once();
    sub_1C2FA4D88(v2, v1, qword_1ED7AF630, *(uint64_t *)algn_1ED7AF638);

  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v6 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_4_2(v6, (uint64_t)qword_1ED7AF5F0);
    sub_1C2FC98E8();
    v7 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_21(v7))
    {
      OUTLINED_FUNCTION_1();
      v8 = OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_48_1(v8);
      *v3 = 136315138;
      v9 = OUTLINED_FUNCTION_18_2();
      OUTLINED_FUNCTION_16_3(v9, v10, &v13);
      OUTLINED_FUNCTION_10_3();
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_1_3(&dword_1C2F94000, v11, v12, "Failed to create DirectActionResultCandidateMessage for request Id: %s");
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_14_3();
  }
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_41_1();
}

uint64_t sub_1C2FA7AFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v27 = a7;
  v28 = a8;
  v25 = a4;
  v26 = a5;
  v29 = a10;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF490);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *MEMORY[0x1E0D9E640];
  v20 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v18, v19, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  sub_1C2FC9180();
  swift_bridgeObjectRetain();
  sub_1C2FC9168();
  v21 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v15, v25, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v21);
  sub_1C2FC91A4();
  swift_bridgeObjectRetain();
  sub_1C2FC9198();
  if (qword_1ED7AEFC8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1C2FC915C();
  swift_bridgeObjectRetain();
  sub_1C2FC9150();
  swift_bridgeObjectRetain();
  sub_1C2FC9174();
  v22 = sub_1C2FC9798();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v12, v29, v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v22);
  return sub_1C2FC918C();
}

BOOL sub_1C2FA7D64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1C2FA7DA8(a1, a2, a3, a4, a5, MEMORY[0x1E0D9E128], (uint64_t)sub_1C2FA8A04, MEMORY[0x1E0D9E120], "Failed to create MUXTextBasedResultSelectedMessage for request Id: %s");
}

BOOL sub_1C2FA7DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(_QWORD), uint64_t a7, uint64_t (*a8)(uint64_t, _QWORD *), const char *a9)
{
  _DWORD *v9;
  _DWORD *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v21[9];
  uint64_t v22;

  v13 = v9;
  v21[2] = a1;
  v21[3] = a2;
  v21[4] = a3;
  v21[5] = a4;
  v21[6] = a5;
  v21[7] = OUTLINED_FUNCTION_44_1();
  v14 = objc_allocWithZone((Class)a6(0));
  v15 = (void *)a8(a7, v21);
  if (v15)
  {
    OUTLINED_FUNCTION_24_2();
    if (qword_1ED7AEFC8 != -1)
      swift_once();
    OUTLINED_FUNCTION_52_0(&qword_1ED7AF630);

  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v16 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_4_2(v16, (uint64_t)qword_1ED7AF5F0);
    sub_1C2FC98E8();
    v17 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_21(v17))
    {
      OUTLINED_FUNCTION_1();
      v22 = OUTLINED_FUNCTION_2_2();
      *v13 = 136315138;
      v18 = swift_bridgeObjectRetain();
      v21[8] = OUTLINED_FUNCTION_16_3(v18, v19, &v22);
      OUTLINED_FUNCTION_73();
      OUTLINED_FUNCTION_13_2();
      OUTLINED_FUNCTION_8_4(&dword_1C2F94000, v14, (os_log_type_t)a7, a9);
      OUTLINED_FUNCTION_53_0();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_14_3();
  }
  return v15 != 0;
}

void sub_1C2FA7F88()
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

  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_68();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_34_1();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_23();
  v6 = v5 - v4;
  v7 = *MEMORY[0x1E0D9E640];
  v8 = OUTLINED_FUNCTION_65_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 104))(v6, v7, v8);
  OUTLINED_FUNCTION_49_1();
  __swift_storeEnumTagSinglePayload(v9, v10, v11, v8);
  sub_1C2FC8B50();
  swift_bridgeObjectRetain();
  sub_1C2FC8B20();
  v12 = OUTLINED_FUNCTION_59();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v1, v0, v12);
  OUTLINED_FUNCTION_49_1();
  __swift_storeEnumTagSinglePayload(v13, v14, v15, v12);
  sub_1C2FC8B68();
  swift_bridgeObjectRetain();
  sub_1C2FC8B5C();
  if (qword_1ED7AEFC8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1C2FC8B44();
  sub_1C2FC8B2C();
  sub_1C2FC8B38();
  OUTLINED_FUNCTION_27();
}

void sub_1C2FA8104()
{
  uint64_t v0;
  uint8_t *v1;
  uint8_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void (*v14)(uint8_t *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  void *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint8_t *v23;
  uint64_t v24;

  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_69();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_23();
  v23 = (uint8_t *)(v9 - v8);
  v10 = objc_allocWithZone((Class)sub_1C2FC9270());
  v11 = (void *)sub_1C2FC9210();
  v12 = v11;
  if (v11)
  {
    sub_1C2F9D5D0(v11);
    v13 = OUTLINED_FUNCTION_59();
    OUTLINED_FUNCTION_56_0();
    v14(v23, v6, v13);
    v22 = OUTLINED_FUNCTION_27_1((uint64_t)v23);
    v21 = AFShouldRunAsrOnServerForUOD();
    OUTLINED_FUNCTION_28_2();
    v15 = *(_QWORD *)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_siriInputLocale);
    OUTLINED_FUNCTION_71();
    OUTLINED_FUNCTION_25_3();
    OUTLINED_FUNCTION_66_0();
    OUTLINED_FUNCTION_28_2();
    swift_bridgeObjectRetain();
    LOBYTE(v13) = OUTLINED_FUNCTION_25_3();
    swift_bridgeObjectRelease();
    sub_1C2FA42C8(v23, v4, v2, 3, v22, v21, v15 & 1, v13 & 1, 0);

    sub_1C2FA5C58((uint64_t)v23);
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v16 = OUTLINED_FUNCTION_7();
    v17 = (void *)__swift_project_value_buffer(v16, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v18 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_21(v18))
    {
      OUTLINED_FUNCTION_1();
      v24 = OUTLINED_FUNCTION_2_2();
      *(_DWORD *)v2 = 136315138;
      swift_bridgeObjectRetain();
      sub_1C2FC4294(v4, (uint64_t)v2, &v24);
      OUTLINED_FUNCTION_10_3();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_1_3(&dword_1C2F94000, v19, v20, "Failed to create StartCorrectedSpeechRequestMessage for request Id: %s");
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
  }
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FA83E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;

  v27 = a5;
  v28 = a7;
  v26 = a4;
  v29 = a10;
  v30 = a8;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF410);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *MEMORY[0x1E0D9E640];
  v20 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v18, v19, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  sub_1C2FC924C();
  swift_bridgeObjectRetain();
  sub_1C2FC921C();
  v21 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v15, v26, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v21);
  sub_1C2FC9264();
  swift_bridgeObjectRetain();
  sub_1C2FC9258();
  v22 = sub_1C2FC95F4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v12, v28, v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v22);
  sub_1C2FC9228();
  swift_bridgeObjectRetain();
  sub_1C2FC9234();
  v23 = v29;
  return sub_1C2FC9240();
}

void sub_1C2FA8604()
{
  OUTLINED_FUNCTION_62_0();
  OUTLINED_FUNCTION_58_0();
}

void sub_1C2FA8638()
{
  uint64_t v0;
  _DWORD *v1;
  uint64_t v2;
  id v3;
  uint64_t (*v4)(uint64_t, char *);
  void *v5;
  uint64_t v6;
  void *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_12_2();
  v3 = objc_allocWithZone((Class)OUTLINED_FUNCTION_46_1());
  v5 = (void *)OUTLINED_FUNCTION_50_0((uint64_t)v3, v4);
  if (v5)
  {
    OUTLINED_FUNCTION_24_2();
    if (qword_1ED7AEFC8 != -1)
      swift_once();
    sub_1C2FA4D88(v0, v2, qword_1ED7AF630, *(uint64_t *)algn_1ED7AF638);

  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v6 = OUTLINED_FUNCTION_7();
    v7 = (void *)__swift_project_value_buffer(v6, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v8 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_21(v8))
    {
      OUTLINED_FUNCTION_1();
      v9 = OUTLINED_FUNCTION_2_2();
      OUTLINED_FUNCTION_48_1(v9);
      *v1 = 136315138;
      OUTLINED_FUNCTION_16_0();
      v10 = sub_1C2FC4294(v0, v2, &v13);
      OUTLINED_FUNCTION_9_2(v10);
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_1_3(&dword_1C2F94000, v11, v12, "Failed to create TextBasedResultCandidateMessage for request Id: %s");
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
  }
  OUTLINED_FUNCTION_43_1();
}

void sub_1C2FA87DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
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
  void (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  OUTLINED_FUNCTION_30_1();
  v45 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF490);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v24);
  OUTLINED_FUNCTION_55_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v25);
  OUTLINED_FUNCTION_23();
  v28 = v27 - v26;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v29);
  OUTLINED_FUNCTION_34_1();
  v30 = *MEMORY[0x1E0D9E640];
  v31 = OUTLINED_FUNCTION_65_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 104))(v22, v30, v31);
  OUTLINED_FUNCTION_49_1();
  __swift_storeEnumTagSinglePayload(v32, v33, v34, v31);
  sub_1C2FC906C();
  OUTLINED_FUNCTION_71();
  sub_1C2FC9060();
  v35 = OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_56_0();
  v36(v28, v45, v35);
  OUTLINED_FUNCTION_49_1();
  __swift_storeEnumTagSinglePayload(v37, v38, v39, v35);
  sub_1C2FC9090();
  swift_bridgeObjectRetain();
  sub_1C2FC9084();
  if (qword_1ED7AEFC8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1C2FC9054();
  OUTLINED_FUNCTION_16_0();
  sub_1C2FC909C();
  v40 = sub_1C2FC9798();
  OUTLINED_FUNCTION_56_0();
  v41(v21, a21, v40);
  OUTLINED_FUNCTION_49_1();
  __swift_storeEnumTagSinglePayload(v42, v43, v44, v40);
  sub_1C2FC9078();
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FA89B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_38_1();
  return sub_1C2FA6C24(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10, v11);
}

void sub_1C2FA89D8(uint64_t a1)
{
  uint64_t v1;

  sub_1C2FA61E4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(void **)(v1 + 64), *(_QWORD *)(v1 + 72));
  OUTLINED_FUNCTION_54_0();
}

void sub_1C2FA8A0C()
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
  void *v9;

  OUTLINED_FUNCTION_47_1();
  sub_1C2FA83E4(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_54_0();
}

void sub_1C2FA8A28()
{
  sub_1C2FA7F88();
}

void sub_1C2FA8A48(uint64_t a1)
{
  sub_1C2FA8AE0(a1, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1C2FA7744);
}

uint64_t sub_1C2FA8A54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_38_1();
  return sub_1C2FA7AFC(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10);
}

uint64_t sub_1C2FA8A78(uint64_t a1)
{
  uint64_t *v1;

  return sub_1C2FA684C(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_1C2FA8A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF490);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1C2FA8AD4(uint64_t a1)
{
  sub_1C2FA8AE0(a1, (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1C2FA64A4);
}

void sub_1C2FA8AE0(uint64_t a1, void (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], v2[8], v2[9], v2[10]);
  OUTLINED_FUNCTION_54_0();
}

#error "1C2FA8B24: call analysis failed (funcsize=7)"

void sub_1C2FA8B30()
{
  sub_1C2FA73C8();
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_8_4(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t OUTLINED_FUNCTION_9_2(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_14_3()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_15_3()
{
  return sub_1C2FC987C();
}

uint64_t OUTLINED_FUNCTION_16_3(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  return sub_1C2FC4294(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_17_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_24_2()
{
  void *v0;

  return sub_1C2F9D5D0(v0);
}

uint64_t OUTLINED_FUNCTION_25_3()
{
  return sub_1C2FC987C();
}

uint64_t OUTLINED_FUNCTION_26_3()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_27_1(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
  return AFDeviceSupportsSiriUOD();
}

_QWORD *OUTLINED_FUNCTION_28_2()
{
  _QWORD *v0;

  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

void OUTLINED_FUNCTION_29_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9)
{
  char v9;
  uint8_t *v10;
  uint64_t v11;
  uint8_t *v12;
  char v13;
  uint64_t v14;

  sub_1C2FA42C8(v12, v11, v10, 2, *(_DWORD *)(v14 - 196), 0, v13 & 1, v9 & 1, a9);
}

uint64_t OUTLINED_FUNCTION_31_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v7 - 160) = v6;
  *(_QWORD *)(v7 - 152) = v4;
  *(_QWORD *)(v7 - 144) = v5;
  *(_QWORD *)(v7 - 136) = v3;
  *(_QWORD *)(v7 - 128) = v2;
  *(_QWORD *)(v7 - 120) = v1;
  *(_QWORD *)(v7 - 112) = v0;
  return 0;
}

uint64_t OUTLINED_FUNCTION_32_2(_QWORD *a1)
{
  uint64_t v1;

  __swift_project_boxed_opaque_existential_1(a1, v1);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_35_2()
{
  return sub_1C2FC987C();
}

uint64_t OUTLINED_FUNCTION_36_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 192) = *(_QWORD *)(v1 + a1);
  return sub_1C2FC8A0C();
}

__n128 OUTLINED_FUNCTION_38_1()
{
  uint64_t v0;

  return *(__n128 *)(v0 + 72);
}

uint64_t OUTLINED_FUNCTION_40_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_44_1()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_45_1()
{
  void *v0;

  return sub_1C2F9D5D0(v0);
}

uint64_t OUTLINED_FUNCTION_46_1()
{
  uint64_t (*v0)(_QWORD);

  return v0(0);
}

uint64_t OUTLINED_FUNCTION_48_1(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_50_0(uint64_t a1, uint64_t (*a2)(uint64_t, char *), ...)
{
  va_list va;

  va_start(va, a2);
  return a2(a1, va);
}

BOOL OUTLINED_FUNCTION_51_0()
{
  uint64_t v0;

  return v0 != 0;
}

void OUTLINED_FUNCTION_52_0(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  sub_1C2FA4DA4(v2, v1, *a1, a1[1]);
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_57_0()
{
  return swift_bridgeObjectRetain();
}

_QWORD *OUTLINED_FUNCTION_59_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 184) = v2;
  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + a1), *(_QWORD *)(v1 + a1 + 24));
}

uint64_t OUTLINED_FUNCTION_60_0(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_61_0()
{
  uint64_t v0;

  return sub_1C2FA5C58(v0);
}

void OUTLINED_FUNCTION_62_0()
{
  sub_1C2FA8638();
}

BOOL OUTLINED_FUNCTION_63()
{
  uint64_t v0;

  return v0 != 0;
}

void OUTLINED_FUNCTION_64_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_65_0()
{
  return sub_1C2FC95DC();
}

uint64_t OUTLINED_FUNCTION_66_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_67()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_71()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_72(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, const char *a9@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_1C2FA7588(a1, a2, a3, a4, a5, a6, a7, a8, v11, v10, v9, a9);
}

uint64_t OUTLINED_FUNCTION_73()
{
  return sub_1C2FC9BA0();
}

uint64_t sub_1C2FA8FF0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = OUTLINED_FUNCTION_12_0();
  v1(v2);
  return swift_release();
}

void sub_1C2FA9018(void (*a1)(void))
{
  a1();
  OUTLINED_FUNCTION_31();
}

void sub_1C2FA9034(uint64_t a1)
{
  (*(void (**)(void))(a1 + 32))();
  OUTLINED_FUNCTION_31();
}

void sub_1C2FA9050()
{
  qword_1ED7AF630 = 48;
  *(_QWORD *)algn_1ED7AF638 = 0xE100000000000000;
}

uint64_t sub_1C2FA9068(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3 = (_QWORD *)(v2 + OBJC_IVAR___SRDRequestDispatcherInternal_siriInputLocale);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

void RequestDispatcher.__allocating_init(requestDispatcherServiceHelper:bridgeConnectionListeners:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;
  _QWORD *v6;

  v5 = objc_allocWithZone(v2);
  OUTLINED_FUNCTION_371();
  OUTLINED_FUNCTION_367();
  v6 = (_QWORD *)sub_1C2FC97BC();
  sub_1C2FBE2F4(a1, a2, v6);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  OUTLINED_FUNCTION_361();
}

void RequestDispatcher.init(requestDispatcherServiceHelper:bridgeConnectionListeners:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_371();
  OUTLINED_FUNCTION_367();
  sub_1C2FC97BC();
  v0 = OUTLINED_FUNCTION_158();
  sub_1C2FBE2F4(v0, v1, v2);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  OUTLINED_FUNCTION_361();
}

uint64_t sub_1C2FA91E0(uint64_t a1, _QWORD *a2)
{
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;

  swift_getObjectType();
  sub_1C2F9C624();
  sub_1C2FC97D4();
  v3 = AFDeviceSupportsSiriUOD();
  v4 = AFDeviceSupportsHybridUOD();
  v5 = AFOfflineDictationCapable();
  v6 = AFDeviceSupportsBobble();
  v7 = AFIsInternalInstall();
  v8 = AFDeviceSupportsMedoc();
  sub_1C2FC98C4();
  v9 = sub_1C2FC98B8();
  sub_1C2FC98A0();
  sub_1C2FA92FC(a2, v3, v4, v5, v6, v7, v8, v9 & 1);
  sub_1C2FAA9D4();
  return swift_bridgeObjectRelease();
}

char *sub_1C2FA92FC(_QWORD *a1, char a2, char a3, char a4, char a5, char a6, char a7, char a8)
{
  char v8;
  char v10;
  char *v14;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char v84;

  v8 = a8;
  v10 = a5;
  if ((a2 & 1) != 0 || (a3 & 1) != 0)
  {
    v14 = sub_1C2FBD980(0, 1, 1, MEMORY[0x1E0DEE9D8]);
    v18 = *((_QWORD *)v14 + 2);
    v17 = *((_QWORD *)v14 + 3);
    v84 = a6;
    if (v18 >= v17 >> 1)
      v14 = sub_1C2FBD980((char *)(v17 > 1), v18 + 1, 1, (uint64_t)v14);
    v19 = sub_1C2FC8A3C();
    sub_1C2FBFF94(qword_1ED7AF098, (void (*)(uint64_t))MEMORY[0x1E0D03968]);
    *((_QWORD *)v14 + 2) = v18 + 1;
    v20 = &v14[40 * v18];
    *((_QWORD *)v20 + 4) = 19534;
    *((_QWORD *)v20 + 5) = 0xE200000000000000;
    *((_QWORD *)v20 + 6) = v19;
    *((_QWORD *)v20 + 7) = v21;
    v20[64] = 0;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    if ((sub_1C2FC981C() & 1) == 0)
      goto LABEL_13;
    v23 = *((_QWORD *)v14 + 2);
    v22 = *((_QWORD *)v14 + 3);
    if (v23 >= v22 >> 1)
      v14 = sub_1C2FBD980((char *)(v22 > 1), v23 + 1, 1, (uint64_t)v14);
    v24 = sub_1C2FC8A30();
    sub_1C2FBFF94(qword_1ED7AF5B0, (void (*)(uint64_t))MEMORY[0x1E0D03960]);
    *((_QWORD *)v14 + 2) = v23 + 1;
    v25 = &v14[40 * v23];
    *((_QWORD *)v25 + 4) = 0x726574756F524C4ELL;
    *((_QWORD *)v25 + 5) = 0xE800000000000000;
    *((_QWORD *)v25 + 6) = v24;
    *((_QWORD *)v25 + 7) = v26;
    v25[64] = 0;
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    if ((sub_1C2FC9804() & 1) != 0)
    {
      v28 = *((_QWORD *)v14 + 2);
      v27 = *((_QWORD *)v14 + 3);
      v8 = a8;
      if (v28 >= v27 >> 1)
        v14 = sub_1C2FBD980((char *)(v27 > 1), v28 + 1, 1, (uint64_t)v14);
      v10 = a5;
      v29 = sub_1C2FC98D0();
      sub_1C2FBFF94(&qword_1EF7DBC38, (void (*)(uint64_t))MEMORY[0x1E0D87BE8]);
      *((_QWORD *)v14 + 2) = v28 + 1;
      v30 = &v14[40 * v28];
      *((_QWORD *)v30 + 4) = 0xD000000000000010;
      *((_QWORD *)v30 + 5) = 0x80000001C2FCC4B0;
      *((_QWORD *)v30 + 6) = v29;
      *((_QWORD *)v30 + 7) = v31;
      v30[64] = 0;
    }
    else
    {
LABEL_13:
      v8 = a8;
      v10 = a5;
    }
    v33 = *((_QWORD *)v14 + 2);
    v32 = *((_QWORD *)v14 + 3);
    v34 = v33 + 1;
    if (v33 >= v32 >> 1)
      v14 = sub_1C2FBD980((char *)(v32 > 1), v33 + 1, 1, (uint64_t)v14);
    v35 = sub_1C2FC97B0();
    sub_1C2FBFF94(&qword_1ED7AF4A0, (void (*)(uint64_t))MEMORY[0x1E0D98898]);
    *((_QWORD *)v14 + 2) = v34;
    v36 = &v14[40 * v33];
    *((_QWORD *)v36 + 4) = 0x53454D4D4F50;
    *((_QWORD *)v36 + 5) = 0xE600000000000000;
    *((_QWORD *)v36 + 6) = v35;
    *((_QWORD *)v36 + 7) = v37;
    v36[64] = 0;
    if ((a2 & 1) != 0)
    {
      v38 = *((_QWORD *)v14 + 3);
      v39 = v33 + 2;
      if (v34 >= v38 >> 1)
        v14 = sub_1C2FBD980((char *)(v38 > 1), v33 + 2, 1, (uint64_t)v14);
      v40 = sub_1C2FC8A18();
      sub_1C2FBFF94(&qword_1ED7AF088, (void (*)(uint64_t))MEMORY[0x1E0D98470]);
      *((_QWORD *)v14 + 2) = v39;
      v41 = &v14[40 * v34];
      *((_QWORD *)v41 + 4) = 0x6C66726574747542;
      *((_QWORD *)v41 + 5) = 0xE900000000000079;
      *((_QWORD *)v41 + 6) = v40;
      *((_QWORD *)v41 + 7) = v42;
      v41[64] = 0;
    }
    if ((a7 & 1) != 0)
    {
      v44 = *((_QWORD *)v14 + 2);
      v43 = *((_QWORD *)v14 + 3);
      v45 = v44 + 1;
      if (v44 >= v43 >> 1)
        v14 = sub_1C2FBD980((char *)(v43 > 1), v44 + 1, 1, (uint64_t)v14);
      v46 = sub_1C2FC98AC();
      sub_1C2FBFF94(qword_1ED7AF4A8, (void (*)(uint64_t))MEMORY[0x1E0D87BD0]);
      *((_QWORD *)v14 + 2) = v45;
      v47 = &v14[40 * v44];
      *((_QWORD *)v47 + 4) = 0xD000000000000011;
      *((_QWORD *)v47 + 5) = 0x80000001C2FCC490;
      *((_QWORD *)v47 + 6) = v46;
      *((_QWORD *)v47 + 7) = v48;
      v47[64] = 0;
      v49 = *((_QWORD *)v14 + 3);
      v50 = v44 + 2;
      if (v45 >= v49 >> 1)
        v14 = sub_1C2FBD980((char *)(v49 > 1), v44 + 2, 1, (uint64_t)v14);
      v51 = sub_1C2FC8A24();
      sub_1C2FBFF94(&qword_1ED7AF090, (void (*)(uint64_t))MEMORY[0x1E0DA7A20]);
      *((_QWORD *)v14 + 2) = v50;
      v52 = &v14[40 * v45];
      *((_QWORD *)v52 + 4) = 18773;
      *((_QWORD *)v52 + 5) = 0xE200000000000000;
      *((_QWORD *)v52 + 6) = v51;
      *((_QWORD *)v52 + 7) = v53;
      v52[64] = 1;
    }
    a6 = v84;
  }
  else
  {
    v14 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v54 = sub_1C2FA9B50(a6 & 1);
  if (v54)
  {
    v56 = v54;
    v57 = v55;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v14 = sub_1C2FBD980(0, *((_QWORD *)v14 + 2) + 1, 1, (uint64_t)v14);
    v59 = *((_QWORD *)v14 + 2);
    v58 = *((_QWORD *)v14 + 3);
    if (v59 >= v58 >> 1)
      v14 = sub_1C2FBD980((char *)(v58 > 1), v59 + 1, 1, (uint64_t)v14);
    *((_QWORD *)v14 + 2) = v59 + 1;
    v60 = &v14[40 * v59];
    *((_QWORD *)v60 + 4) = 5526357;
    *((_QWORD *)v60 + 5) = 0xE300000000000000;
    *((_QWORD *)v60 + 6) = v56;
    *((_QWORD *)v60 + 7) = v57;
    v60[64] = 0;
  }
  if ((a2 & 1) != 0 || (a4 & 1) != 0 || (a3 & 1) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v14 = sub_1C2FBD980(0, *((_QWORD *)v14 + 2) + 1, 1, (uint64_t)v14);
    v62 = *((_QWORD *)v14 + 2);
    v61 = *((_QWORD *)v14 + 3);
    if (v62 >= v61 >> 1)
      v14 = sub_1C2FBD980((char *)(v61 > 1), v62 + 1, 1, (uint64_t)v14);
    v63 = sub_1C2FC9990();
    sub_1C2FBFF94(&qword_1ED7AEFE0, (void (*)(uint64_t))MEMORY[0x1E0CF21C8]);
    *((_QWORD *)v14 + 2) = v62 + 1;
    v64 = &v14[40 * v62];
    *((_QWORD *)v64 + 4) = 5395265;
    *((_QWORD *)v64 + 5) = 0xE300000000000000;
    *((_QWORD *)v64 + 6) = v63;
    *((_QWORD *)v64 + 7) = v65;
    v64[64] = 0;
  }
  if ((v10 & 1) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v14 = sub_1C2FBD980(0, *((_QWORD *)v14 + 2) + 1, 1, (uint64_t)v14);
    v67 = *((_QWORD *)v14 + 2);
    v66 = *((_QWORD *)v14 + 3);
    if (v67 >= v66 >> 1)
      v14 = sub_1C2FBD980((char *)(v66 > 1), v67 + 1, 1, (uint64_t)v14);
    v68 = sub_1C2FC97A4();
    sub_1C2FBFF94(&qword_1ED7AF058, (void (*)(uint64_t))MEMORY[0x1E0D98450]);
    *((_QWORD *)v14 + 2) = v67 + 1;
    v69 = &v14[40 * v67];
    *((_QWORD *)v69 + 4) = 0x65727574736547;
    *((_QWORD *)v69 + 5) = 0xE700000000000000;
    *((_QWORD *)v69 + 6) = v68;
    *((_QWORD *)v69 + 7) = v70;
    v69[64] = 0;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v14 = sub_1C2FBD980(0, *((_QWORD *)v14 + 2) + 1, 1, (uint64_t)v14);
  v72 = *((_QWORD *)v14 + 2);
  v71 = *((_QWORD *)v14 + 3);
  v73 = v72 + 1;
  if (v72 >= v71 >> 1)
    v14 = sub_1C2FBD980((char *)(v71 > 1), v72 + 1, 1, (uint64_t)v14);
  v74 = sub_1C2FC8A48();
  sub_1C2FBFF94(&qword_1ED7AF0A8, (void (*)(uint64_t))MEMORY[0x1E0D9C860]);
  *((_QWORD *)v14 + 2) = v73;
  v75 = &v14[40 * v72];
  strcpy(v75 + 32, "Conversation");
  v75[45] = 0;
  *((_WORD *)v75 + 23) = -5120;
  *((_QWORD *)v75 + 6) = v74;
  *((_QWORD *)v75 + 7) = v76;
  v75[64] = 0;
  if ((v8 & 1) != 0)
  {
    v77 = *((_QWORD *)v14 + 3);
    v78 = v72 + 2;
    if (v73 >= v77 >> 1)
      v14 = sub_1C2FBD980((char *)(v77 > 1), v72 + 2, 1, (uint64_t)v14);
    v79 = sub_1C2FC98C4();
    sub_1C2FBFF94(qword_1ED7AF5C0, (void (*)(uint64_t))MEMORY[0x1E0D87BE0]);
    *((_QWORD *)v14 + 2) = v78;
    v80 = &v14[40 * v73];
    *((_QWORD *)v80 + 4) = 0x657261727543;
    *((_QWORD *)v80 + 5) = 0xE600000000000000;
    *((_QWORD *)v80 + 6) = v79;
    *((_QWORD *)v80 + 7) = v81;
    v80[64] = 0;
  }
  return v14;
}

id sub_1C2FA9AE0()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_1C2FC99E4();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithPath_, v1);

  return v2;
}

uint64_t sub_1C2FA9B50(char a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t ObjCClassMetadata;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  os_log_type_t v14;
  uint8_t *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  const char *v20;

  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v2 = sub_1C2FC98F4();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ED7AF5F0);
  v3 = sub_1C2FC98E8();
  v4 = sub_1C2FC9B28();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C2F94000, v3, v4, "Attempting to load the USTBridge framework.", v5, 2u);
    MEMORY[0x1C3BD0834](v5, -1, -1);
  }

  if ((a1 & 1) == 0)
  {
    v7 = sub_1C2FC98E8();
    v14 = sub_1C2FC9B28();
    if (os_log_type_enabled(v7, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      v16 = "Not loading USTBridge in an external build.";
LABEL_16:
      _os_log_impl(&dword_1C2F94000, v7, v14, v16, v15, 2u);
      MEMORY[0x1C3BD0834](v15, -1, -1);
    }
LABEL_23:
    v10 = 0;
    goto LABEL_24;
  }
  sub_1C2F9BD28(0, &qword_1ED7AF510);
  v6 = sub_1C2FA9AE0();
  if (!v6)
  {
    v7 = sub_1C2FC98E8();
    v14 = sub_1C2FC9B10();
    if (os_log_type_enabled(v7, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      v16 = "Can't locate the USTBridge framework.";
      goto LABEL_16;
    }
    goto LABEL_23;
  }
  v7 = v6;
  if (!-[NSObject principalClass](v6, sel_principalClass))
  {
    v17 = sub_1C2FC98E8();
    v18 = sub_1C2FC9B10();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      v20 = "USTBridge bundle didn't have a principal class.";
LABEL_21:
      _os_log_impl(&dword_1C2F94000, v17, v18, v20, v19, 2u);
      MEMORY[0x1C3BD0834](v19, -1, -1);
    }
LABEL_22:

    goto LABEL_23;
  }
  ObjCClassMetadata = swift_getObjCClassMetadata();
  v9 = dynamic_cast_existential_1_conditional(ObjCClassMetadata);
  if (!v9)
  {
    v17 = sub_1C2FC98E8();
    v18 = sub_1C2FC9B10();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      v20 = "USTBridge's principal class had unexpected type.";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  v10 = v9;
  v11 = sub_1C2FC98E8();
  v12 = sub_1C2FC9B28();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1C2F94000, v11, v12, "Successfully loaded the USTBridge class.", v13, 2u);
    MEMORY[0x1C3BD0834](v13, -1, -1);
  }

LABEL_24:
  return v10;
}

void sub_1C2FA9EA0()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
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
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  unint64_t v28;
  char v29;
  char v30;
  unint64_t v31;
  char v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  unsigned __int8 *v39;
  __int128 v40;
  unint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  _QWORD *v53;
  unint64_t v54;
  char v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  uint8_t *v81;
  NSObject *v82;
  os_log_type_t v83;
  uint64_t v84;
  _QWORD *v85;
  int64_t v86;
  char v87;
  uint64_t v88;
  _BOOL8 v89;
  int64_t v90;
  char v91;
  uint64_t v92;
  _QWORD *v93;
  int64_t v94;
  char v95;
  uint64_t v96;
  _BOOL8 v97;
  int64_t v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t (*v102)(uint64_t, _QWORD);
  _QWORD v103[6];
  _QWORD *v104;
  uint64_t v105;
  __int128 v106;
  uint64_t v107;
  unint64_t v108;
  unsigned int v109;
  uint64_t v110;
  char *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  NSObject *v117;
  unint64_t v118;
  _QWORD *v119;
  unint64_t v120;
  uint64_t v121;
  int64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  unint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;

  OUTLINED_FUNCTION_30_1();
  v107 = v0;
  v2 = v1;
  v4 = v3;
  v116 = sub_1C2FC9B40();
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v5);
  v115 = (char *)v103 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1C2FC9B58();
  v113 = *(_QWORD *)(v7 - 8);
  v114 = v7;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v8);
  v112 = (char *)v103 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v10);
  v111 = (char *)v103 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_196(v12, (uint64_t)&v126);
  v103[1] = v13;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_85(v15);
  v103[3] = v4;
  v16 = *(_QWORD *)(v4 + 16);
  v17 = MEMORY[0x1E0DEE9D8];
  sub_1C2FBDA74(0, v16, 0, MEMORY[0x1E0DEE9D8]);
  swift_bridgeObjectRelease();
  v122 = v16;
  v119 = sub_1C2FBD88C(0, v16, 0, v17, &qword_1ED7AF580, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_1C2FBDB68, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1C2FBE008);
  if (v2 >> 62)
    goto LABEL_52;
  v18 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_33_1();
  while (1)
  {
    v19 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    if (!v18)
      break;
    v120 = v2 & 0xC000000000000001;
    v20 = 4;
    v118 = v2;
    while (1)
    {
      v21 = v120 ? (id)MEMORY[0x1C3BD02AC](v20 - 4, v2) : *(id *)(v2 + 8 * v20);
      v22 = v21;
      if (__OFADD__(v20 - 4, 1))
        break;
      v121 = v20 - 3;
      v23 = objc_msgSend(v21, sel_bridgeName);
      v24 = sub_1C2FC99F0();
      v26 = v25;

      v27 = v22;
      swift_isUniquelyReferenced_nonNull_native();
      v126 = (uint64_t)v19;
      v28 = sub_1C2FC4980();
      if (__OFADD__(v19[2], (v29 & 1) == 0))
        goto LABEL_50;
      v2 = v28;
      v30 = v29;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF558);
      if ((sub_1C2FC9C30() & 1) != 0)
      {
        v31 = sub_1C2FC4980();
        if ((v30 & 1) != (v32 & 1))
        {
          sub_1C2FC9CCC();
          __break(1u);
          return;
        }
        v2 = v31;
      }
      v19 = (_QWORD *)v126;
      if ((v30 & 1) != 0)
      {
        v33 = (_QWORD *)v126;
        v34 = *(_QWORD *)(v126 + 56);

        *(_QWORD *)(v34 + 8 * v2) = v27;
        v19 = v33;
      }
      else
      {
        OUTLINED_FUNCTION_275(v126 + 8 * (v2 >> 6));
        v35 = (uint64_t *)(v19[6] + 16 * v2);
        *v35 = v24;
        v35[1] = v26;
        *(_QWORD *)(v19[7] + 8 * v2) = v27;
        v36 = v19[2];
        v37 = __OFADD__(v36, 1);
        v38 = v36 + 1;
        if (v37)
          goto LABEL_51;
        v19[2] = v38;
        OUTLINED_FUNCTION_152();
      }

      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_336();
      ++v20;
      v2 = v118;
      if (v121 == v18)
        goto LABEL_18;
    }
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
LABEL_52:
    OUTLINED_FUNCTION_33_1();
    v18 = sub_1C2FC9C54();
  }
LABEL_18:
  v104 = v19;
  OUTLINED_FUNCTION_17_0();
  v103[0] = sub_1C2F9C624();
  sub_1C2FC97EC();
  if (!v122)
    goto LABEL_48;
  v110 = sub_1C2F9BD28(0, &qword_1ED7AEF50);
  OUTLINED_FUNCTION_333(OBJC_IVAR___SRDRequestDispatcherInternal_messagePublisher);
  OUTLINED_FUNCTION_332(OBJC_IVAR___SRDRequestDispatcherInternal_serviceHelper);
  v105 = OBJC_IVAR___SRDRequestDispatcherInternal_sessionsManager;
  v109 = *MEMORY[0x1E0DEF8D8];
  v39 = (unsigned __int8 *)(swift_bridgeObjectRetain() + 64);
  *(_QWORD *)&v40 = 136315138;
  v106 = v40;
  v103[5] = MEMORY[0x1E0DEE9B8] + 8;
  OUTLINED_FUNCTION_331(0x80000001C2FCC400);
  do
  {
    v42 = *((_QWORD *)v39 - 2);
    v41 = *((_QWORD *)v39 - 1);
    v43 = *v39;
    v44 = qword_1ED7AEDB0;
    OUTLINED_FUNCTION_20_2();
    if (v44 != -1)
      swift_once();
    v45 = OUTLINED_FUNCTION_7();
    v46 = __swift_project_value_buffer(v45, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v47 = OUTLINED_FUNCTION_198();
    v48 = OUTLINED_FUNCTION_119(v46);
    v117 = v46;
    v118 = v41;
    v121 = v42;
    LODWORD(v120) = v43;
    if (v48)
    {
      v49 = OUTLINED_FUNCTION_1();
      v126 = OUTLINED_FUNCTION_1();
      *(_DWORD *)v49 = v106;
      OUTLINED_FUNCTION_152();
      *(_QWORD *)(v49 + 4) = OUTLINED_FUNCTION_268();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v46, v47, "Creating Bridge: %s...", (uint8_t *)v49);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
    v126 = 0;
    v127 = 0xE000000000000000;
    sub_1C2FC9C00();
    swift_bridgeObjectRelease();
    v126 = 0xD00000000000001DLL;
    v127 = v108;
    OUTLINED_FUNCTION_296();
    sub_1C2FC9A2C();
    sub_1C2FC9930();
    LOBYTE(v50) = (_BYTE)v112;
    (*(void (**)(char *, _QWORD, uint64_t))(v113 + 104))(v112, v109, v114);
    v126 = MEMORY[0x1E0DEE9D8];
    sub_1C2FBFF94(qword_1ED7AEF40, (void (*)(uint64_t))MEMORY[0x1E0DEF810]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEF30);
    sub_1C2FBF9F0(&qword_1ED7AEF38, &qword_1ED7AEF30);
    sub_1C2FC9BDC();
    v51 = (id)sub_1C2FC9B7C();
    if ((_DWORD)v120)
    {
      OUTLINED_FUNCTION_13();
      if (dynamic_cast_existential_1_conditional(v121))
      {
        if (v104[2])
        {
          v50 = v52;
          OUTLINED_FUNCTION_152();
          OUTLINED_FUNCTION_296();
          v53 = v104;
          v54 = sub_1C2FC4980();
          if ((v55 & 1) != 0)
          {
            v56 = *(id *)(v53[7] + 8 * v54);
            OUTLINED_FUNCTION_13();
            v57 = v107;
            OUTLINED_FUNCTION_256();
            v59 = *(_QWORD *)(v57 + v58);
            v129 = type metadata accessor for MessagePublisher();
            sub_1C2FBFF94(&qword_1ED7AF0B0, (void (*)(uint64_t))type metadata accessor for MessagePublisher);
            v130 = v60;
            v126 = v59;
            OUTLINED_FUNCTION_253();
            OUTLINED_FUNCTION_207();
            v62 = *(_QWORD *)(v57 + v61);
            v124 = type metadata accessor for SessionsManager();
            sub_1C2FBFF94(&qword_1ED7AF0B8, (void (*)(uint64_t))type metadata accessor for SessionsManager);
            v125 = v63;
            v123 = v62;
            v64 = v56;
            swift_retain();
            swift_unknownObjectRetain();
            v51 = v51;
            swift_retain();
            OUTLINED_FUNCTION_296();
            sub_1C2FC9690();
            swift_unknownObjectRetain();
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              v93 = (_QWORD *)OUTLINED_FUNCTION_240();
              v119 = sub_1C2FBD88C(v93, v94, v95, v96, &qword_1ED7AF580, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_1C2FBDB68, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1C2FBE008);
            }
            v66 = v119[2];
            v65 = v119[3];
            if (v66 >= v65 >> 1)
            {
              v97 = OUTLINED_FUNCTION_239(v65);
              v119 = sub_1C2FBD88C((_QWORD *)v97, v98, v99, v100, &qword_1ED7AF580, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_1C2FBDB68, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1C2FBE008);
            }
            v67 = *(_QWORD *)(*(_QWORD *)(v50 + 8) + 8);
            v119[2] = v66 + 1;
            OUTLINED_FUNCTION_315(v67);

            goto LABEL_38;
          }
          OUTLINED_FUNCTION_13();
        }
        OUTLINED_FUNCTION_152();
        v82 = v117;
        sub_1C2FC98E8();
        v83 = OUTLINED_FUNCTION_43();
        if (OUTLINED_FUNCTION_6_2(v83))
        {
          v84 = OUTLINED_FUNCTION_1();
          v126 = OUTLINED_FUNCTION_1();
          *(_DWORD *)v84 = v106;
          OUTLINED_FUNCTION_152();
          *(_QWORD *)(v84 + 4) = OUTLINED_FUNCTION_268();
          OUTLINED_FUNCTION_26_3();
          OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v82, (os_log_type_t)v50, "Could not find XpcConnectionListener for Bridge: %s", (uint8_t *)v84);
          OUTLINED_FUNCTION_12();
          OUTLINED_FUNCTION_0();
        }

        OUTLINED_FUNCTION_46();
      }
      else
      {
        OUTLINED_FUNCTION_13();
        v79 = sub_1C2FC98E8();
        v80 = sub_1C2FC9B1C();
        if (OUTLINED_FUNCTION_46_2(v79))
        {
          v81 = (uint8_t *)OUTLINED_FUNCTION_1();
          *(_WORD *)v81 = 0;
          _os_log_impl(&dword_1C2F94000, v79, v80, "isXPCListening set but bridge does not implement required interface", v81, 2u);
          OUTLINED_FUNCTION_0();
        }

      }
    }
    else
    {
      v68 = v107;
      OUTLINED_FUNCTION_256();
      v70 = *(_QWORD *)(v68 + v69);
      v129 = type metadata accessor for MessagePublisher();
      sub_1C2FBFF94(&qword_1ED7AF0B0, (void (*)(uint64_t))type metadata accessor for MessagePublisher);
      v130 = v71;
      v126 = v70;
      OUTLINED_FUNCTION_253();
      OUTLINED_FUNCTION_207();
      v73 = *(_QWORD *)(v68 + v72);
      v124 = type metadata accessor for SessionsManager();
      sub_1C2FBFF94(&qword_1ED7AF0B8, (void (*)(uint64_t))type metadata accessor for SessionsManager);
      v125 = v74;
      v123 = v73;
      v51 = v51;
      OUTLINED_FUNCTION_12_0();
      swift_unknownObjectRetain();
      swift_retain();
      v75 = v118;
      sub_1C2FC96A8();
      OUTLINED_FUNCTION_13();
      swift_unknownObjectRetain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v85 = (_QWORD *)OUTLINED_FUNCTION_240();
        v119 = sub_1C2FBD88C(v85, v86, v87, v88, &qword_1ED7AF580, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_1C2FBDB68, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1C2FBE008);
      }
      v77 = v119[2];
      v76 = v119[3];
      if (v77 >= v76 >> 1)
      {
        v89 = OUTLINED_FUNCTION_239(v76);
        v119 = sub_1C2FBD88C((_QWORD *)v89, v90, v91, v92, &qword_1ED7AF580, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_1C2FBDB68, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1C2FBE008);
      }
      v78 = *(_QWORD *)(v75 + 8);
      v119[2] = v77 + 1;
      OUTLINED_FUNCTION_315(v78);
    }
LABEL_38:

    v39 += 40;
    --v122;
  }
  while (v122);
  swift_bridgeObjectRelease();
LABEL_48:
  OUTLINED_FUNCTION_204((uint64_t)&v128);
  sub_1C2FC97D4();
  v101 = OUTLINED_FUNCTION_150();
  OUTLINED_FUNCTION_36_0(v101, v102);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_27();
}

void sub_1C2FAA9D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);

  OUTLINED_FUNCTION_30_1();
  v0 = OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_77();
  sub_1C2F9C624();
  sub_1C2FC97EC();
  sub_1C2FA9EA0();
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = (uint64_t *)(v1 + 40);
    do
    {
      v4 = *v3;
      v5 = swift_unknownObjectRetain();
      sub_1C2FAAAF0(v5, v4);
      swift_unknownObjectRelease();
      v3 += 2;
      --v2;
    }
    while (v2);
  }
  OUTLINED_FUNCTION_13();
  sub_1C2FC97D4();
  sub_1C2F9EDAC();
  v6 = OUTLINED_FUNCTION_158();
  v7(v6);
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FAAAF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  _BOOL8 v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  char v34;
  uint64_t *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  _BOOL8 v58;
  unint64_t v59;
  char v60;
  unint64_t v61;
  char v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t result;
  _QWORD *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v86;
  _QWORD *v87;
  uint64_t v88[3];
  uint64_t v89;

  v3 = v2;
  if (qword_1ED7AEDB0 != -1)
    goto LABEL_51;
  while (1)
  {
    v5 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v5, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_136();
    v6 = sub_1C2FC98E8();
    v7 = sub_1C2FC9B04();
    if (OUTLINED_FUNCTION_88(v6))
    {
      v8 = (uint8_t *)OUTLINED_FUNCTION_1();
      v89 = OUTLINED_FUNCTION_1();
      *(_DWORD *)v8 = 136315138;
      swift_getObjectType();
      v9 = OUTLINED_FUNCTION_375();
      v11 = OUTLINED_FUNCTION_60(v9, v10);
      OUTLINED_FUNCTION_318(v11);
      sub_1C2FC9BA0();
      OUTLINED_FUNCTION_30_0();
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v6, v7, "About to register bridge %s to message bus...", v8);
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_30_0();
    if ((sub_1C2F9EF18(a1, a2) & 1) == 0)
    {
      OUTLINED_FUNCTION_136();
      v66 = OUTLINED_FUNCTION_290();
      v71 = sub_1C2FC9B10();
      if (OUTLINED_FUNCTION_119(v66))
      {
        v72 = (uint8_t *)OUTLINED_FUNCTION_1();
        v89 = OUTLINED_FUNCTION_1();
        *(_DWORD *)v72 = 136315138;
        swift_getObjectType();
        v73 = OUTLINED_FUNCTION_375();
        v75 = OUTLINED_FUNCTION_60(v73, v74);
        OUTLINED_FUNCTION_318(v75);
        sub_1C2FC9BA0();
        OUTLINED_FUNCTION_30_0();
        OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v66, v71, "Unable to register %s Bridge...", v72);
        OUTLINED_FUNCTION_12();
LABEL_44:
        OUTLINED_FUNCTION_0();
      }
LABEL_45:

      return OUTLINED_FUNCTION_30_0();
    }
    swift_getObjectType();
    v12 = sub_1C2FC969C();
    v13 = v12;
    v80 = *(_QWORD *)(v12 + 16);
    if (!v80)
    {
LABEL_40:
      OUTLINED_FUNCTION_327();
      OUTLINED_FUNCTION_136();
      v66 = OUTLINED_FUNCTION_290();
      v67 = sub_1C2FC9B28();
      if (OUTLINED_FUNCTION_119(v66))
      {
        v68 = (uint8_t *)OUTLINED_FUNCTION_1();
        v88[0] = OUTLINED_FUNCTION_1();
        *(_DWORD *)v68 = 136446210;
        v69 = OUTLINED_FUNCTION_375();
        OUTLINED_FUNCTION_288(v69, v70);
        OUTLINED_FUNCTION_171();
        OUTLINED_FUNCTION_30_0();
        OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v66, v67, "%{public}s Bridge was registered to the MessageBus", v68);
        OUTLINED_FUNCTION_12();
        goto LABEL_44;
      }
      goto LABEL_45;
    }
    v14 = (_QWORD *)(v3 + OBJC_IVAR___SRDRequestDispatcherInternal_aceCommandDispatcher);
    v79 = v12 + 32;
    OUTLINED_FUNCTION_5_0();
    v15 = 0;
    v84 = a1;
    v77 = v14;
    v78 = v13;
LABEL_7:
    if (v15 >= *(_QWORD *)(v13 + 16))
      goto LABEL_48;
    v16 = (uint64_t *)(v79 + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    OUTLINED_FUNCTION_11_0();
    v83 = v18;
    v19 = sub_1C2FC9744();
    v20 = *v14;
    v81 = v15;
    if (*(_QWORD *)(*v14 + 16))
    {
      OUTLINED_FUNCTION_11_0();
      OUTLINED_FUNCTION_303();
      v21 = sub_1C2FC4980();
      if ((v22 & 1) != 0)
      {
        v3 = *(_QWORD *)(*(_QWORD *)(v20 + 56) + 8 * v21);
        OUTLINED_FUNCTION_152();
        OUTLINED_FUNCTION_22();
        OUTLINED_FUNCTION_11();
        goto LABEL_13;
      }
      OUTLINED_FUNCTION_22();
      OUTLINED_FUNCTION_11();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF480);
    v3 = sub_1C2FC99A8();
LABEL_13:
    v82 = v17;
    v23 = *(_QWORD *)(v19 + 16);
    if (!v23)
      break;
    v24 = (uint64_t *)(v19 + 40);
    while (1)
    {
      v26 = *(v24 - 1);
      v25 = *v24;
      swift_unknownObjectRetain();
      OUTLINED_FUNCTION_83();
      swift_isUniquelyReferenced_nonNull_native();
      v88[0] = v3;
      v27 = sub_1C2FC4980();
      v29 = *(_QWORD *)(v3 + 16);
      v30 = (v28 & 1) == 0;
      a1 = v29 + v30;
      if (__OFADD__(v29, v30))
        break;
      v31 = v27;
      v32 = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF538);
      a1 = v84;
      if ((OUTLINED_FUNCTION_359() & 1) != 0)
      {
        v33 = sub_1C2FC4980();
        if ((v32 & 1) != (v34 & 1))
          goto LABEL_52;
        v31 = v33;
      }
      v3 = v88[0];
      v86 = v23;
      if ((v32 & 1) != 0)
      {
        v35 = (uint64_t *)(*(_QWORD *)(v88[0] + 56) + 16 * v31);
        *v35 = v84;
        v35[1] = a2;
        OUTLINED_FUNCTION_336();
        OUTLINED_FUNCTION_136();
        OUTLINED_FUNCTION_20_2();
        swift_unknownObjectRetain_n();
        v36 = OUTLINED_FUNCTION_290();
        v37 = sub_1C2FC9B10();
        if (OUTLINED_FUNCTION_88(v36))
        {
          v38 = OUTLINED_FUNCTION_1();
          v88[0] = OUTLINED_FUNCTION_1();
          *(_DWORD *)v38 = 136315650;
          swift_getObjectType();
          v39 = sub_1C2FC975C();
          *(_QWORD *)(v38 + 4) = OUTLINED_FUNCTION_288(v39, v40);
          OUTLINED_FUNCTION_30_0();
          OUTLINED_FUNCTION_22();
          *(_WORD *)(v38 + 12) = 2080;
          OUTLINED_FUNCTION_83();
          *(_QWORD *)(v38 + 14) = OUTLINED_FUNCTION_110(v26, v41, v88);
          OUTLINED_FUNCTION_26_3();
          *(_WORD *)(v38 + 22) = 2080;
          v42 = sub_1C2FC975C();
          *(_QWORD *)(v38 + 24) = OUTLINED_FUNCTION_288(v42, v43);
          OUTLINED_FUNCTION_30_0();
          OUTLINED_FUNCTION_22();
          _os_log_impl(&dword_1C2F94000, v36, v37, "There is already a bridge: %s consuming %s. Replacing with %s", (uint8_t *)v38, 0x20u);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_0();
        }

        OUTLINED_FUNCTION_30_0();
        OUTLINED_FUNCTION_46();
        swift_unknownObjectRelease_n();
      }
      else
      {
        OUTLINED_FUNCTION_275(v88[0] + 8 * (v31 >> 6));
        v44 = (uint64_t *)(*(_QWORD *)(v88[0] + 48) + 16 * v31);
        *v44 = v26;
        v44[1] = v25;
        v45 = (uint64_t *)(*(_QWORD *)(v3 + 56) + 16 * v31);
        *v45 = v84;
        v45[1] = a2;
        v46 = *(_QWORD *)(v3 + 16);
        v47 = __OFADD__(v46, 1);
        v48 = v46 + 1;
        if (v47)
          goto LABEL_47;
        *(_QWORD *)(v3 + 16) = v48;
        OUTLINED_FUNCTION_83();
        OUTLINED_FUNCTION_336();
      }
      OUTLINED_FUNCTION_136();
      OUTLINED_FUNCTION_83();
      v49 = OUTLINED_FUNCTION_290();
      v50 = sub_1C2FC9B04();
      if (OUTLINED_FUNCTION_88(v49))
      {
        v51 = OUTLINED_FUNCTION_1();
        v88[0] = OUTLINED_FUNCTION_1();
        *(_DWORD *)v51 = 136315394;
        v52 = sub_1C2FC975C();
        *(_QWORD *)(v51 + 4) = OUTLINED_FUNCTION_288(v52, v53);
        OUTLINED_FUNCTION_30_0();
        OUTLINED_FUNCTION_11();
        *(_WORD *)(v51 + 12) = 2080;
        OUTLINED_FUNCTION_83();
        *(_QWORD *)(v51 + 14) = OUTLINED_FUNCTION_110(v26, v54, v88);
        OUTLINED_FUNCTION_26_3();
        OUTLINED_FUNCTION_39(&dword_1C2F94000, v49, v50, "Registered bridge:%s for command:%s", (uint8_t *)v51);
        OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_30_0();
      v24 += 2;
      v23 = v86 - 1;
      if (v86 == 1)
        goto LABEL_28;
    }
    __break(1u);
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
LABEL_51:
    swift_once();
  }
LABEL_28:
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v3 + 16))
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_13();
    v14 = v77;
    v13 = v78;
LABEL_39:
    v15 = v81 + 1;
    if (v81 + 1 == v80)
      goto LABEL_40;
    goto LABEL_7;
  }
  v14 = v77;
  OUTLINED_FUNCTION_347();
  swift_isUniquelyReferenced_nonNull_native();
  v87 = (_QWORD *)*v77;
  *v77 = 0x8000000000000000;
  v55 = sub_1C2FC4980();
  v57 = v87[2];
  v58 = (v56 & 1) == 0;
  a1 = v57 + v58;
  v13 = v78;
  if (__OFADD__(v57, v58))
    goto LABEL_49;
  v59 = v55;
  v60 = v56;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF540);
  a1 = v84;
  if ((OUTLINED_FUNCTION_359() & 1) == 0)
    goto LABEL_33;
  v61 = sub_1C2FC4980();
  if ((v60 & 1) == (v62 & 1))
  {
    v59 = v61;
LABEL_33:
    if ((v60 & 1) != 0)
    {
      *(_QWORD *)(v87[7] + 8 * v59) = v3;
    }
    else
    {
      OUTLINED_FUNCTION_275((uint64_t)&v87[v59 >> 6]);
      v63 = (_QWORD *)(v87[6] + 16 * v59);
      *v63 = v83;
      v63[1] = v82;
      *(_QWORD *)(v87[7] + 8 * v59) = v3;
      v64 = v87[2];
      v47 = __OFADD__(v64, 1);
      v65 = v64 + 1;
      if (v47)
        goto LABEL_50;
      v87[2] = v65;
      OUTLINED_FUNCTION_71();
    }
    *v77 = v87;
    swift_bridgeObjectRelease();
    swift_endAccess();
    OUTLINED_FUNCTION_39_0();
    OUTLINED_FUNCTION_11();
    goto LABEL_39;
  }
LABEL_52:
  result = sub_1C2FC9CCC();
  __break(1u);
  return result;
}

uint64_t sub_1C2FAB438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v11)(uint64_t);

  v11 = a5;
  v5 = sub_1C2FC98DC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2F9C624();
  sub_1C2FC97D4();
  sub_1C2FC97D4();
  v9 = sub_1C2FC97E0();
  v11(v9);
  sub_1C2FC97D4();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_1C2FAB594()
{
  char v0;
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
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t (**v18)();
  uint64_t v19;
  _QWORD v20[2];
  uint64_t v21;
  NSObject *v22;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)();
  uint64_t v28;
  uint64_t v29;

  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_102();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_43_2();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_97();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_96();
  v20[1] = v20;
  v29 = MEMORY[0x1E0DEE9D8];
  v23[2] = &v29;
  v24 = v1;
  sub_1C2F9C624();
  OUTLINED_FUNCTION_28_3();
  v21 = v2;
  OUTLINED_FUNCTION_6_3();
  sub_1C2FC97E0();
  v22 = *(NSObject **)(v1 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  OUTLINED_FUNCTION_26_4(v5, v3);
  OUTLINED_FUNCTION_26_4(v4, v2);
  v12 = *(unsigned __int8 *)(v7 + 80);
  v13 = (v12 + 16) & ~v12;
  v14 = (v6 + v12 + v13) & ~v12;
  v15 = (v6 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = swift_allocObject();
  OUTLINED_FUNCTION_26_4(v16 + v13, v5);
  OUTLINED_FUNCTION_26_4(v16 + v14, v4);
  v17 = (_QWORD *)(v16 + v15);
  *v17 = 0x28736E69616D6F64;
  v17[1] = 0xE900000000000029;
  v18 = (uint64_t (**)())(v16 + ((v15 + 23) & 0xFFFFFFFFFFFFFFF8));
  *v18 = sub_1C2FBEB18;
  v18[1] = (uint64_t (*)())v23;
  v19 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v19 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v19 + 24) = v16;
  v27 = sub_1C2FBEB2C;
  v28 = v19;
  v25 = MEMORY[0x1E0C809B0];
  v26 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_32_3();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v22);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v21);
  OUTLINED_FUNCTION_12_3(v3);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v0 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FAB7E8(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;

  swift_beginAccess();
  v2 = swift_bridgeObjectRetain();
  v3 = sub_1C2F9B668(v2);
  swift_bridgeObjectRelease();
  *a1 = v3;
  return swift_bridgeObjectRelease();
}

void sub_1C2FAB8A8()
{
  char v0;
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
  _QWORD *v13;
  uint64_t v14;
  NSObject *v15;

  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_102();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_43_2();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_97();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_96();
  sub_1C2F9C624();
  OUTLINED_FUNCTION_28_3();
  OUTLINED_FUNCTION_189();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v15 = *(NSObject **)(v1 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  v11 = *(_QWORD *)(v6 + 16);
  OUTLINED_FUNCTION_26_4(v5, v3);
  OUTLINED_FUNCTION_26_4(v4, v2);
  OUTLINED_FUNCTION_30_3();
  v12 = swift_allocObject();
  OUTLINED_FUNCTION_26_4(v12 + v11, v5);
  OUTLINED_FUNCTION_26_4((uint64_t)&type metadata for Logger + v12, v4);
  OUTLINED_FUNCTION_35_3((unint64_t *)(v12 + v2));
  OUTLINED_FUNCTION_324(v13);
  v14 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v14 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v14 + 24) = v12;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_32_3();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v15);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v2);
  OUTLINED_FUNCTION_12_3(v3);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v0 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FABAA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v5 = (uint64_t *)(a1 + OBJC_IVAR___SRDRequestDispatcherInternal_aceCommandDispatcher);
  result = swift_beginAccess();
  v7 = *v5;
  if (*(_QWORD *)(v7 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v8 = sub_1C2FC4980();
    if ((v9 & 1) != 0)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v8);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v11 = sub_1C2F9B668(v10);
      swift_bridgeObjectRelease();
      *a4 = v11;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1C2FABBF0()
{
  char v0;
  NSObject *v1;
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
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)();
  uint64_t v38;
  char v39;

  OUTLINED_FUNCTION_30_1();
  v26 = v1;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_81();
  MEMORY[0x1E0C80A78](v13);
  v25 = (uint64_t)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v15);
  v28 = (uint64_t)&v25 - v16;
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_96();
  v39 = 0;
  v29 = v1;
  v30 = v8;
  v31 = v6;
  v32 = &v39;
  v33 = v12;
  v34 = v10;
  v18 = sub_1C2F9C624();
  v19 = v2;
  v27 = v2;
  OUTLINED_FUNCTION_190();
  v20 = v28;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v26 = *(NSObject **)((char *)&v26->isa + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  OUTLINED_FUNCTION_41_2(v3, v19);
  v21 = v25;
  OUTLINED_FUNCTION_41_2(v25, v20);
  OUTLINED_FUNCTION_29_4();
  v22 = swift_allocObject();
  OUTLINED_FUNCTION_27_2(v22);
  OUTLINED_FUNCTION_41_2(v4 + v18, v21);
  OUTLINED_FUNCTION_35_3((unint64_t *)((char *)&type metadata for Logger + v4));
  OUTLINED_FUNCTION_181(v23);
  v24 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v24 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v24 + 24) = v4;
  v37 = sub_1C2FC0008;
  v38 = v24;
  v35 = MEMORY[0x1E0C809B0];
  v36 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_32_3();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v26);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v28);
  OUTLINED_FUNCTION_12_3(v27);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v0 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FABE10(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4, uint64_t a5, uint64_t a6)
{
  uint64_t *v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v9 = (uint64_t *)(a1 + OBJC_IVAR___SRDRequestDispatcherInternal_aceCommandDispatcher);
  result = swift_beginAccess();
  v11 = *v9;
  if (*(_QWORD *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = sub_1C2FC4980();
    if ((v13 & 1) != 0)
    {
      v14 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v12);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_1C2FC1C30(a5, a6, v14);
      v16 = v15;
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if (v16)
        result = swift_unknownObjectRelease();
      *a4 = v16 != 0;
    }
    else
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_1C2FABFA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
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
  uint64_t v18;
  uint64_t v19;
  dispatch_queue_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t);
  char *v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  void (*v32)(unint64_t, char *, uint64_t);
  uint64_t *v33;
  uint64_t (**v34)();
  uint64_t (*v35)();
  uint64_t v36;
  void *v37;
  void (*v38)(uint64_t, uint64_t);
  char isEscapingClosureAtFileLocation;
  ValueMetadata *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)();
  uint64_t v46;
  dispatch_queue_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)();
  uint64_t v54;

  OUTLINED_FUNCTION_30_1();
  v2 = v0;
  v47 = v3;
  v5 = v4;
  v7 = v6;
  v8 = OUTLINED_FUNCTION_3_0();
  v48 = *(_QWORD *)(v8 - 8);
  v9 = *(_QWORD *)(v48 + 64);
  v10 = MEMORY[0x1E0C80A78](v8);
  v50 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v42 - v12;
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_95();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_47_0();
  v16 = v15;
  v17 = sub_1C2FBE29C(v7, (SEL *)&selRef_encodedClassName);
  v49 = v17;
  if (v18)
  {
    v19 = v18;
    v42 = (uint64_t)&v42;
    MEMORY[0x1E0C80A78](v17);
    v45 = (uint64_t (*)())(&v42 - 8);
    *(&v42 - 6) = v2;
    *(&v42 - 5) = (uint64_t)v7;
    v20 = v47;
    *(&v42 - 4) = v5;
    *(&v42 - 3) = (uint64_t)v20;
    v21 = sub_1C2F9C624();
    v46 = v16;
    OUTLINED_FUNCTION_28_3();
    v40 = &type metadata for Logger;
    v41 = v21;
    OUTLINED_FUNCTION_6_3();
    v22 = v2;
    v23 = v49;
    v43 = v19;
    sub_1C2FC97E0();
    v47 = *(dispatch_queue_t *)(v22 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
    v24 = v48;
    v25 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 16);
    v25(v13, v16, v8);
    v26 = v50;
    v25(v50, v1, v8);
    v27 = (*(unsigned __int8 *)(v24 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
    OUTLINED_FUNCTION_257();
    v44 = v1;
    v29 = v28 & 0xFFFFFFFFFFFFFFF8;
    v30 = swift_allocObject();
    v31 = v30 + v27;
    v32 = *(void (**)(unint64_t, char *, uint64_t))(v24 + 32);
    v32(v31, v13, v8);
    v32((unint64_t)&v7[v30], v26, v8);
    v33 = (uint64_t *)(v30 + v9);
    *v33 = v23;
    v33[1] = v43;
    v34 = (uint64_t (**)())(v30 + v29);
    v35 = v45;
    *v34 = sub_1C2FBEB8C;
    v34[1] = v35;
    v36 = OUTLINED_FUNCTION_1_1();
    *(_QWORD *)(v36 + 16) = sub_1C2FBEB24;
    *(_QWORD *)(v36 + 24) = v30;
    v53 = sub_1C2FC0008;
    v54 = v36;
    v51 = MEMORY[0x1E0C809B0];
    v52 = 1107296256;
    v37 = OUTLINED_FUNCTION_104((uint64_t)sub_1C2FA9034);
    swift_bridgeObjectRetain();
    swift_retain();
    OUTLINED_FUNCTION_68_0();
    dispatch_sync(v47, v37);
    _Block_release(v37);
    v38 = *(void (**)(uint64_t, uint64_t))(v24 + 8);
    v38(v44, v8);
    v38(v46, v8);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    OUTLINED_FUNCTION_17_0();
    swift_release();
    OUTLINED_FUNCTION_135();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      OUTLINED_FUNCTION_27();
      return;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1C2FAC2B8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)();
  uint64_t v24;

  result = sub_1C2FBE29C(a2, (SEL *)&selRef_groupIdentifier);
  if (!v11)
  {
    __break(1u);
    goto LABEL_14;
  }
  v12 = result;
  v13 = v11;
  v14 = (uint64_t *)(a1 + OBJC_IVAR___SRDRequestDispatcherInternal_aceCommandDispatcher);
  swift_beginAccess();
  v15 = *v14;
  swift_bridgeObjectRetain();
  v16 = sub_1C2FC1C2C(v12, v13, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v16)
  {
    result = sub_1C2FBE29C(a2, (SEL *)&selRef_encodedClassName);
    if (v17)
    {
      sub_1C2FC1C30(result, v17, v16);
      v19 = v18;
      v21 = v20;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v19)
      {
        sub_1C2F9CA40(v19, v21, a2, a5, a3, a4);
        return swift_unknownObjectRelease();
      }
      if (a3)
      {
        v24 = swift_allocObject();
        *(_QWORD *)(v24 + 16) = a3;
        *(_QWORD *)(v24 + 24) = a4;
        v23 = sub_1C2FC0008;
        goto LABEL_11;
      }
LABEL_10:
      v23 = 0;
      goto LABEL_11;
    }
LABEL_14:
    __break(1u);
    return result;
  }
  if (!a3)
    goto LABEL_10;
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = a3;
  *(_QWORD *)(v22 + 24) = a4;
  v23 = sub_1C2FBEB2C;
LABEL_11:
  sub_1C2F9D46C(a3);
  sub_1C2FAC584();
  return sub_1C2FBFE5C((uint64_t)v23);
}

void sub_1C2FAC52C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_1C2FC897C();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

void sub_1C2FAC584()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  void (*v2)(uint64_t);
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;

  OUTLINED_FUNCTION_30_1();
  v2 = v1;
  v4 = v3;
  v5 = OUTLINED_FUNCTION_59();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_157();
  if (v2)
  {
    v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D87FE8]), sel_init);
    OUTLINED_FUNCTION_309();
    v8 = sub_1C2FC89E8();
    v10 = v9;
    OUTLINED_FUNCTION_194(v0, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    sub_1C2FBE24C(v8, v10, v7);
    v11 = v7;
    sub_1C2FBE29C(v4, (SEL *)&selRef_aceId);
    if (v12)
    {
      v13 = (void *)sub_1C2FC99E4();
      OUTLINED_FUNCTION_17_0();
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(v11, sel_setRefId_, v13);

    v14 = (void *)objc_opt_self();
    v15 = v11;
    v16 = objc_msgSend(v14, sel_errorWithCode_, 2000);
    v17 = OUTLINED_FUNCTION_348();
    v2(v17);

  }
  OUTLINED_FUNCTION_27();
}

void sub_1C2FAC6C0()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
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
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)();
  uint64_t v38;

  OUTLINED_FUNCTION_30_1();
  v25 = v6;
  v26 = v7;
  v23 = v8;
  v24 = v9;
  v22 = v10;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_81();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_43_2();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v13);
  v28 = (uint64_t)&v21 - v14;
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_64_1();
  sub_1C2FC97F8();
  v29 = v1;
  v30 = v22;
  v31 = v23;
  v32 = v24;
  v33 = v25;
  v34 = v26;
  v16 = v2;
  v27 = v2;
  OUTLINED_FUNCTION_28_3();
  OUTLINED_FUNCTION_189();
  v17 = v28;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v26 = *(NSObject **)(v1 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  OUTLINED_FUNCTION_41_2(v4, v16);
  OUTLINED_FUNCTION_41_2(v3, v17);
  OUTLINED_FUNCTION_29_4();
  v18 = swift_allocObject();
  OUTLINED_FUNCTION_27_2(v18);
  OUTLINED_FUNCTION_41_2(v5 + v16, v3);
  OUTLINED_FUNCTION_35_3((unint64_t *)((char *)&type metadata for Logger + v5));
  OUTLINED_FUNCTION_181(v19);
  v20 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v20 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v20 + 24) = v5;
  v37 = sub_1C2FC0008;
  v38 = v20;
  v35 = MEMORY[0x1E0C809B0];
  v36 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_32_3();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v26);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v28);
  OUTLINED_FUNCTION_12_3(v27);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v0 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

void sub_1C2FAC96C()
{
  void *v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  os_log_type_t v15;
  _DWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;

  OUTLINED_FUNCTION_30_1();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  OUTLINED_FUNCTION_222();
  OUTLINED_FUNCTION_178();
  if (v8)
  {
    MEMORY[0x1E0C80A78](v8);
    OUTLINED_FUNCTION_340();
    *(_QWORD *)(v10 - 32) = v9;
    *(_QWORD *)(v10 - 24) = v7;
    *(_QWORD *)(v10 - 16) = v5;
    *(_QWORD *)(v10 - 8) = v3;
    v11 = objc_allocWithZone((Class)sub_1C2FC8AFC());
    OUTLINED_FUNCTION_69_0();
    v12 = (void *)sub_1C2FC8AB4();
    if (v12)
    {
      v13 = v12;
      OUTLINED_FUNCTION_202(v12);
      OUTLINED_FUNCTION_158();
      sub_1C2FA4F74();
      OUTLINED_FUNCTION_124();

    }
    else
    {
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v21 = OUTLINED_FUNCTION_7();
      v22 = __swift_project_value_buffer(v21, (uint64_t)qword_1ED7AF5F0);
      OUTLINED_FUNCTION_20_2();
      sub_1C2FC98E8();
      v23 = OUTLINED_FUNCTION_43();
      if (OUTLINED_FUNCTION_21(v23))
      {
        v24 = (uint8_t *)OUTLINED_FUNCTION_1();
        v25 = OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_48_1(v25);
        *(_DWORD *)v24 = 136315138;
        OUTLINED_FUNCTION_24();
        v26 = OUTLINED_FUNCTION_73_0();
        OUTLINED_FUNCTION_9_2(v26);
        OUTLINED_FUNCTION_26_3();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v22, v1, "Failed to create CancelRequestMessage for request Id: %s", v24);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_124();
    }
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v14 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v14, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v15 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_14_4(v15))
    {
      v16 = (_DWORD *)OUTLINED_FUNCTION_1();
      v17 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_300(v17);
      *v16 = 136315138;
      OUTLINED_FUNCTION_33_1();
      v18 = OUTLINED_FUNCTION_50_1();
      OUTLINED_FUNCTION_61_1(v18);
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_21_3(&dword_1C2F94000, v19, v20, "No active session for assistantId: %s cannot post CancelRequest message");
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
  }
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FACC0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
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
  _QWORD v19[2];

  v19[1] = a7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *MEMORY[0x1E0D9E640];
  v15 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  sub_1C2FC8AD8();
  swift_bridgeObjectRetain();
  sub_1C2FC8AC0();
  v16 = a4 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId;
  v17 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v10, v16, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v17);
  sub_1C2FC8AF0();
  swift_bridgeObjectRetain();
  sub_1C2FC8AE4();
  return sub_1C2FC8ACC();
}

void sub_1C2FACDA8()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
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
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)();
  uint64_t v35;

  OUTLINED_FUNCTION_30_1();
  v25 = v5;
  v21 = v6;
  v22 = v7;
  v20 = v8;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_81();
  MEMORY[0x1E0C80A78](v9);
  v23 = (uint64_t)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_96();
  v24 = v2;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v19 - v13;
  sub_1C2F9C624();
  sub_1C2FC97F8();
  v27 = v1;
  v28 = v20;
  v29 = v21;
  v30 = v22;
  v31 = v25;
  v26 = v14;
  OUTLINED_FUNCTION_34_2();
  OUTLINED_FUNCTION_200();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v25 = *(NSObject **)(v1 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  OUTLINED_FUNCTION_41_2(v3, (uint64_t)v14);
  v15 = v23;
  OUTLINED_FUNCTION_41_2(v23, v2);
  OUTLINED_FUNCTION_29_4();
  v16 = swift_allocObject();
  OUTLINED_FUNCTION_27_2(v16);
  OUTLINED_FUNCTION_41_2((uint64_t)&v14[v4], v15);
  OUTLINED_FUNCTION_35_3((unint64_t *)((char *)&type metadata for Logger + v4));
  OUTLINED_FUNCTION_181(v17);
  v18 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v18 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v18 + 24) = v4;
  v34 = sub_1C2FC0008;
  v35 = v18;
  v32 = MEMORY[0x1E0C809B0];
  v33 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_32_3();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v25);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v24);
  OUTLINED_FUNCTION_12_3((uint64_t)v26);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v0 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

void sub_1C2FACFEC()
{
  void *v0;
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  os_log_type_t v22;
  _DWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;

  OUTLINED_FUNCTION_30_1();
  v4 = v3;
  v6 = v5;
  OUTLINED_FUNCTION_222();
  OUTLINED_FUNCTION_178();
  if (v7)
  {
    v8 = v7;
    OUTLINED_FUNCTION_140((_QWORD *)(v1 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker), *(_QWORD *)(v1 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker + 24));
    v9 = sub_1C2FC9810();
    MEMORY[0x1E0C80A78](v9);
    OUTLINED_FUNCTION_340();
    *(_QWORD *)(v10 - 32) = v8;
    *(_QWORD *)(v10 - 24) = v6;
    *(_QWORD *)(v10 - 16) = v4;
    if ((v11 & 1) != 0)
    {
      v12 = objc_allocWithZone((Class)sub_1C2FC8E2C());
      OUTLINED_FUNCTION_69_0();
      v13 = (void *)sub_1C2FC8E20();
      if (!v13)
      {
        if (qword_1ED7AEDB0 != -1)
          swift_once();
        v14 = OUTLINED_FUNCTION_7();
        v15 = __swift_project_value_buffer(v14, (uint64_t)qword_1ED7AF5F0);
        OUTLINED_FUNCTION_20_2();
        sub_1C2FC98E8();
        v16 = OUTLINED_FUNCTION_43();
        if (OUTLINED_FUNCTION_21(v16))
        {
          v17 = (uint8_t *)OUTLINED_FUNCTION_1();
          v18 = OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_48_1(v18);
          *(_DWORD *)v17 = 136315138;
          OUTLINED_FUNCTION_24();
          v19 = OUTLINED_FUNCTION_73_0();
          OUTLINED_FUNCTION_9_2(v19);
          OUTLINED_FUNCTION_26_3();
          v20 = "Failed to create RootRequestCompletedMessage for request Id: %s";
          goto LABEL_19;
        }

        OUTLINED_FUNCTION_124();
        goto LABEL_21;
      }
    }
    else
    {
      v28 = objc_allocWithZone((Class)sub_1C2FC8BEC());
      OUTLINED_FUNCTION_69_0();
      v13 = (void *)sub_1C2FC8BE0();
      if (!v13)
      {
        if (qword_1ED7AEDB0 != -1)
          swift_once();
        v29 = OUTLINED_FUNCTION_7();
        v15 = __swift_project_value_buffer(v29, (uint64_t)qword_1ED7AF5F0);
        OUTLINED_FUNCTION_20_2();
        sub_1C2FC98E8();
        v30 = OUTLINED_FUNCTION_43();
        if (OUTLINED_FUNCTION_21(v30))
        {
          v17 = (uint8_t *)OUTLINED_FUNCTION_1();
          v31 = OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_48_1(v31);
          *(_DWORD *)v17 = 136315138;
          OUTLINED_FUNCTION_24();
          v32 = OUTLINED_FUNCTION_73_0();
          OUTLINED_FUNCTION_9_2(v32);
          OUTLINED_FUNCTION_26_3();
          v20 = "Failed to create RequestCompletedMessage for request Id: %s";
LABEL_19:
          OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v15, v2, v20, v17);
          OUTLINED_FUNCTION_12();
          OUTLINED_FUNCTION_0();
        }

        OUTLINED_FUNCTION_46();
        goto LABEL_23;
      }
    }
    sub_1C2F9D5D0(v13);

    OUTLINED_FUNCTION_158();
    sub_1C2FA49F8();
LABEL_23:
    OUTLINED_FUNCTION_124();
    goto LABEL_24;
  }
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v21 = OUTLINED_FUNCTION_7();
  __swift_project_value_buffer(v21, (uint64_t)qword_1ED7AF5F0);
  OUTLINED_FUNCTION_20_2();
  sub_1C2FC98E8();
  v22 = OUTLINED_FUNCTION_26();
  if (OUTLINED_FUNCTION_14_4(v22))
  {
    v23 = (_DWORD *)OUTLINED_FUNCTION_1();
    v24 = OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_300(v24);
    *v23 = 136315138;
    OUTLINED_FUNCTION_33_1();
    v25 = OUTLINED_FUNCTION_50_1();
    OUTLINED_FUNCTION_61_1(v25);
    OUTLINED_FUNCTION_26_3();
    OUTLINED_FUNCTION_21_3(&dword_1C2F94000, v26, v27, "No active session for assistantId: %s cannot post RequestCompleted message");
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_0();
  }

LABEL_21:
  OUTLINED_FUNCTION_46();
LABEL_24:
  OUTLINED_FUNCTION_27();
}

void sub_1C2FAD39C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void (*a21)(uint64_t),void (*a22)(uint64_t, uint64_t))
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  void (*v28)(uint64_t);
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
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  uint64_t v42;

  OUTLINED_FUNCTION_30_1();
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v42 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v36);
  OUTLINED_FUNCTION_77();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v37);
  OUTLINED_FUNCTION_286();
  v38 = *MEMORY[0x1E0D9E640];
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_343();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 104))(v24, v38, v23);
  OUTLINED_FUNCTION_125(v24);
  v28(v24);
  OUTLINED_FUNCTION_147();
  v26(v34, v32);
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_343();
  v40 = OUTLINED_FUNCTION_158();
  v41(v40);
  OUTLINED_FUNCTION_125(v22);
  a21(v22);
  OUTLINED_FUNCTION_11_0();
  a22(v42, v30);
  OUTLINED_FUNCTION_27();
}

void sub_1C2FAD4C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
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
  _QWORD *v54;
  uint64_t v55;
  _QWORD v56[3];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
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
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)();
  uint64_t v77;

  OUTLINED_FUNCTION_30_1();
  a19 = v24;
  a20 = v25;
  v26 = v21;
  v60 = v27;
  v58 = v28;
  v57 = v29;
  v56[2] = v30;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v56[1] = a21;
  v39 = OUTLINED_FUNCTION_161();
  v40 = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_331(*(_QWORD *)(v40 - 8));
  v42 = *(_QWORD *)(v41 + 64);
  MEMORY[0x1E0C80A78](v43);
  OUTLINED_FUNCTION_52_1((uint64_t)v56 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v44);
  OUTLINED_FUNCTION_78();
  MEMORY[0x1E0C80A78](v45);
  OUTLINED_FUNCTION_52_1((uint64_t)v56 - v46);
  MEMORY[0x1E0C80A78](v47);
  OUTLINED_FUNCTION_95();
  v63 = v26;
  v64 = v38;
  v65 = v36;
  v66 = v34;
  OUTLINED_FUNCTION_271();
  v67 = v32;
  v68 = v48;
  v69 = v57;
  v70 = v58;
  v71 = v60;
  OUTLINED_FUNCTION_256();
  v72 = v49;
  v73 = v39;
  sub_1C2F9C624();
  v61 = v22;
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_123();
  v50 = v62;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v51 = OUTLINED_FUNCTION_221(*(_QWORD *)(v26 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  OUTLINED_FUNCTION_33_2(v51, v22);
  v52 = v59;
  OUTLINED_FUNCTION_33_2(v59, v50);
  OUTLINED_FUNCTION_257();
  v53 = swift_allocObject();
  OUTLINED_FUNCTION_33_2(v53 + 16, v23);
  OUTLINED_FUNCTION_33_2(v53 + v38, v52);
  OUTLINED_FUNCTION_118((unint64_t *)(v53 + v42));
  OUTLINED_FUNCTION_285(v54);
  v55 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v55 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v55 + 24) = v53;
  v76 = sub_1C2FC0008;
  v77 = v55;
  v74 = MEMORY[0x1E0C809B0];
  v75 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_106((uint64_t)&a16);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_12_3(v62);
  OUTLINED_FUNCTION_12_3(v61);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v40 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FAD784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
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

  v22 = a5;
  v23 = a1;
  v21 = a10;
  v14 = sub_1C2FC95F4();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2FAD884();
  if (a8)
    v18 = sub_1C2FC9AF8();
  else
    v18 = 0;
  sub_1C2FADB20(a2, a3, a4, v22, (uint64_t)v17, v18, a9 & 1, v21, v20, v21, SHIDWORD(v21), v22, v23, v24, v25, v26, v27, v28, v29,
    v30,
    v31);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

void sub_1C2FAD884()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);

  OUTLINED_FUNCTION_30_1();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF410);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_157();
  OUTLINED_FUNCTION_348();
  sub_1C2FC95E8();
  v5 = OUTLINED_FUNCTION_370();
  OUTLINED_FUNCTION_350(v0, 1, v5);
  if (v6)
  {
    sub_1C2F9BD60(v0, (uint64_t *)&unk_1ED7AF410);
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_7();
    v8 = __swift_project_value_buffer(v7, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v9 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_66_1(v9))
    {
      v10 = (uint8_t *)OUTLINED_FUNCTION_1();
      v11 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_281(v11);
      *(_DWORD *)v10 = 136315138;
      OUTLINED_FUNCTION_16_0();
      v12 = OUTLINED_FUNCTION_162();
      OUTLINED_FUNCTION_180(v12);
      OUTLINED_FUNCTION_251();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v8, v1, "Unknown input origin %s, using default .homeButton", v10);
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_351(v3, *MEMORY[0x1E0D9E7C8], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 104));
  }
  else
  {
    v13 = OUTLINED_FUNCTION_293();
    OUTLINED_FUNCTION_351(v13, v14, v15);
  }
  OUTLINED_FUNCTION_27();
}

void sub_1C2FADB20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, int a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  int v27;
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
  uint64_t v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  void (*v52)(uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  _QWORD *v61;
  uint64_t v62;
  uint8_t *v63;
  _QWORD *v64;
  uint64_t v65;
  uint8_t *v66;
  uint8_t *v67;
  uint8_t *v68;
  uint64_t v69;
  int v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  os_log_type_t v81;
  uint64_t v82;
  os_log_type_t v83;
  _DWORD *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  os_log_type_t v90;
  uint8_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  void (*v99)(void);
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  os_log_type_t v104;
  _DWORD *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  _QWORD v112[3];
  int v113;
  char v114;
  NSObject *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  int v126;
  uint64_t v127;
  uint8_t *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint8_t *v132;
  uint64_t v133;
  uint64_t v134[8];

  OUTLINED_FUNCTION_30_1();
  a20 = v23;
  a21 = v24;
  v127 = v26;
  v128 = v25;
  v126 = v27;
  v124 = v28;
  v125 = v29;
  v131 = v30;
  v32 = v31;
  v34 = v33;
  OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_343();
  v121 = v35;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v36);
  v120 = (char *)v112 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v119 = OUTLINED_FUNCTION_33_0();
  v118 = *(_QWORD *)(v119 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v38);
  OUTLINED_FUNCTION_85((uint64_t)v112 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v40);
  OUTLINED_FUNCTION_1_0();
  v132 = v41;
  v42 = OUTLINED_FUNCTION_59();
  v43 = *(_QWORD *)(v42 - 8);
  MEMORY[0x1E0C80A78](v42);
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_85(v44);
  OUTLINED_FUNCTION_219((uint64_t)&a15);
  MEMORY[0x1E0C80A78](v45);
  OUTLINED_FUNCTION_47_0();
  v47 = v46;
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_282();
  MEMORY[0x1E0C80A78](v48);
  OUTLINED_FUNCTION_76();
  v129 = v34;
  v130 = v21;
  v133 = v32;
  sub_1C2FC231C();
  if (v49)
  {
    v50 = v49;
    v122 = v43;
    v123 = v42;
    OUTLINED_FUNCTION_248();
    v51 = OUTLINED_FUNCTION_142();
    OUTLINED_FUNCTION_163();
    if ((v51 & 1) != 0)
    {
      v112[2] = v22;
      v117 = v50;
      v52 = *(void (**)(uint64_t))(v122 + 16);
      v115 = v47;
      v53 = OUTLINED_FUNCTION_293();
      v54 = v123;
      v52(v53);
      v55 = v130;
      v116 = *(_QWORD *)(v130 + OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil);
      v56 = OUTLINED_FUNCTION_293();
      v112[1] = v52;
      v52(v56);
      OUTLINED_FUNCTION_49_1();
      __swift_storeEnumTagSinglePayload(v57, v58, v59, v54);
      v60 = AFDeviceSupportsSiriUOD();
      v113 = OUTLINED_FUNCTION_342(v60, (uint64_t)&a11);
      v61 = (_QWORD *)(v55 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils);
      OUTLINED_FUNCTION_140((_QWORD *)(v55 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils), *(_QWORD *)(v55 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils + 24));
      OUTLINED_FUNCTION_152();
      v62 = v131;
      v63 = v128;
      sub_1C2FC987C();
      OUTLINED_FUNCTION_13();
      OUTLINED_FUNCTION_140(v61, v61[3]);
      OUTLINED_FUNCTION_91();
      sub_1C2FC987C();
      OUTLINED_FUNCTION_121();
      v64 = (_QWORD *)(v55 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker);
      OUTLINED_FUNCTION_140((_QWORD *)(v55 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker), *(_QWORD *)(v55 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker + 24));
      v65 = (uint64_t)v115;
      v66 = v63;
      LOBYTE(v111) = sub_1C2FC9810() & 1;
      v67 = v132;
      v68 = (uint8_t *)OUTLINED_FUNCTION_292();
      sub_1C2FA42C8(v68, v69, v66, 1, v114, v113, v70, v71, v111);
      OUTLINED_FUNCTION_362(v72, &qword_1ED7AE750);
      OUTLINED_FUNCTION_140(v64, v64[3]);
      OUTLINED_FUNCTION_296();
      v73 = sub_1C2FC9810();
      v74 = MEMORY[0x1E0C80A78](v73);
      v75 = v133;
      v112[-10] = v129;
      v112[-9] = v75;
      v112[-8] = v65;
      v112[-7] = v62;
      v76 = v124;
      v112[-6] = v66;
      v112[-5] = v76;
      v112[-4] = v125;
      LOBYTE(v112[-3]) = v126 & 1;
      v111 = v127;
      if ((v74 & 1) != 0)
      {
        v77 = objc_allocWithZone((Class)sub_1C2FC8F94());
        OUTLINED_FUNCTION_69_0();
        v78 = (char *)sub_1C2FC8F28();
        if (!v78)
        {
          v79 = v122;
          if (qword_1ED7AEDB0 != -1)
            swift_once();
          v80 = OUTLINED_FUNCTION_7();
          __swift_project_value_buffer(v80, (uint64_t)qword_1ED7AF5F0);
          OUTLINED_FUNCTION_20_2();
          sub_1C2FC98E8();
          v81 = OUTLINED_FUNCTION_26();
          if (!OUTLINED_FUNCTION_14_4(v81))
          {

            OUTLINED_FUNCTION_224();
            OUTLINED_FUNCTION_46();
LABEL_30:
            OUTLINED_FUNCTION_41_0(v65, *(uint64_t (**)(uint64_t, uint64_t))(v79 + 8));
            goto LABEL_31;
          }
LABEL_27:
          v105 = (_DWORD *)OUTLINED_FUNCTION_1();
          v106 = OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_301(v106);
          *v105 = 136315138;
          OUTLINED_FUNCTION_91();
          v108 = OUTLINED_FUNCTION_127(v131, v107, v134);
          OUTLINED_FUNCTION_62_1(v108);
          OUTLINED_FUNCTION_26_3();
          OUTLINED_FUNCTION_21_3(&dword_1C2F94000, v109, v110, "Failed to create StartSpeechRequestMessage for request Id: %s");
          OUTLINED_FUNCTION_12();
          OUTLINED_FUNCTION_0();
        }
      }
      else
      {
        v95 = objc_allocWithZone((Class)sub_1C2FC8D6C());
        OUTLINED_FUNCTION_69_0();
        v78 = (char *)sub_1C2FC8D00();
        if (!v78)
        {
          v79 = v122;
          if (qword_1ED7AEDB0 != -1)
            swift_once();
          v103 = OUTLINED_FUNCTION_7();
          __swift_project_value_buffer(v103, (uint64_t)qword_1ED7AF5F0);
          OUTLINED_FUNCTION_20_2();
          sub_1C2FC98E8();
          v104 = OUTLINED_FUNCTION_26();
          if (OUTLINED_FUNCTION_14_4(v104))
            goto LABEL_27;

          OUTLINED_FUNCTION_46();
LABEL_29:
          swift_release();
          goto LABEL_30;
        }
      }
      v96 = v130;
      sub_1C2F9D5D0(v78);

      v97 = *(_QWORD *)(v96 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger);
      v79 = v122;
      if ((*(_BYTE *)(v97 + 32) & 1) != 0 || (OUTLINED_FUNCTION_169(), v98))
      {
        v133 = *(_QWORD *)(v97 + 16);
        OUTLINED_FUNCTION_204((uint64_t)&a16);
        OUTLINED_FUNCTION_207();
        v99();
        OUTLINED_FUNCTION_149();
        OUTLINED_FUNCTION_94();
        v100 = swift_allocObject();
        v101 = OUTLINED_FUNCTION_199(v100);
        OUTLINED_FUNCTION_45_0(v101, v96, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v79 + 32));
        v102 = &v78[v62];
        *(_QWORD *)v102 = v131;
        *((_QWORD *)v102 + 1) = v66;
        v134[4] = (uint64_t)sub_1C2FBF664;
        v134[5] = (uint64_t)v78;
        v134[0] = MEMORY[0x1E0C809B0];
        v134[1] = 1107296256;
        OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA8FF0);
        OUTLINED_FUNCTION_91();
        OUTLINED_FUNCTION_12_0();
        sub_1C2FC9924();
        v134[6] = MEMORY[0x1E0DEE9D8];
        sub_1C2FBFF94(qword_1ED7AEEF0, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
        OUTLINED_FUNCTION_141();
        OUTLINED_FUNCTION_132(&qword_1ED7AEF20);
        OUTLINED_FUNCTION_297();
        OUTLINED_FUNCTION_133();
        OUTLINED_FUNCTION_321();
      }
      goto LABEL_29;
    }
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v89 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_38_0(v89, (uint64_t)qword_1ED7AF5F0);
    v90 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_119(v47))
    {
      v91 = (uint8_t *)OUTLINED_FUNCTION_1();
      v133 = OUTLINED_FUNCTION_1();
      v134[0] = v133;
      v117 = v50;
      *(_DWORD *)v91 = 136315138;
      v132 = v91 + 4;
      OUTLINED_FUNCTION_248();
      v92 = OUTLINED_FUNCTION_269();
      OUTLINED_FUNCTION_163();
      v94 = OUTLINED_FUNCTION_127(v92, v93, v134);
      OUTLINED_FUNCTION_255(v94);
      OUTLINED_FUNCTION_171();
      OUTLINED_FUNCTION_121();
      OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v47, v90, "Current session is not of type %s, cannot start speech request", v91);
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_135();
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v82 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_212(v82, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v83 = OUTLINED_FUNCTION_365();
    if (OUTLINED_FUNCTION_14_4(v83))
    {
      v84 = (_DWORD *)OUTLINED_FUNCTION_1();
      v134[0] = OUTLINED_FUNCTION_1();
      *v84 = 136315138;
      OUTLINED_FUNCTION_83();
      v86 = OUTLINED_FUNCTION_110(v129, v85, v134);
      OUTLINED_FUNCTION_89(v86);
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_21_3(&dword_1C2F94000, v87, v88, "No active session for assistantId: %s cannot start speech request");
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
  }
LABEL_31:
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FAE478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, void *a10)
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t result;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;

  v29 = a5;
  v30 = a7;
  v28 = a4;
  v31 = a10;
  v32 = a9;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF410);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *MEMORY[0x1E0D9E640];
  v20 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v18, v19, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  sub_1C2FC8F64();
  swift_bridgeObjectRetain();
  sub_1C2FC8F40();
  v21 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v15, v28, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v21);
  sub_1C2FC8F88();
  swift_bridgeObjectRetain();
  sub_1C2FC8F7C();
  v22 = sub_1C2FC95F4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v12, v30, v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v22);
  sub_1C2FC8F4C();
  swift_retain();
  v23 = v31;
  sub_1C2FC8F70();
  result = sub_1C2FC8F34();
  if (v23)
  {
    v25 = objc_allocWithZone((Class)sub_1C2FC9684());
    v26 = v23;
    sub_1C2FC9678();
    return sub_1C2FC8F58();
  }
  return result;
}

uint64_t sub_1C2FAE6CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, void *a10)
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t result;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;

  v29 = a5;
  v30 = a7;
  v28 = a4;
  v31 = a10;
  v32 = a9;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF410);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *MEMORY[0x1E0D9E640];
  v20 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v18, v19, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  sub_1C2FC8D3C();
  swift_bridgeObjectRetain();
  sub_1C2FC8D18();
  v21 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v15, v28, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v21);
  sub_1C2FC8D60();
  swift_bridgeObjectRetain();
  sub_1C2FC8D54();
  v22 = sub_1C2FC95F4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v12, v30, v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v22);
  sub_1C2FC8D24();
  swift_retain();
  v23 = v31;
  sub_1C2FC8D48();
  result = sub_1C2FC8D0C();
  if (v23)
  {
    v25 = objc_allocWithZone((Class)sub_1C2FC9684());
    v26 = v23;
    sub_1C2FC9678();
    return sub_1C2FC8D30();
  }
  return result;
}

void sub_1C2FAE920()
{
  char v0;
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
  _QWORD *v13;
  uint64_t v14;
  NSObject *v15;

  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_102();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_43_2();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_97();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_96();
  sub_1C2F9C624();
  OUTLINED_FUNCTION_28_3();
  OUTLINED_FUNCTION_189();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v15 = *(NSObject **)(v1 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  v11 = *(_QWORD *)(v6 + 16);
  OUTLINED_FUNCTION_26_4(v5, v3);
  OUTLINED_FUNCTION_26_4(v4, v2);
  OUTLINED_FUNCTION_30_3();
  v12 = swift_allocObject();
  OUTLINED_FUNCTION_26_4(v12 + v11, v5);
  OUTLINED_FUNCTION_26_4((uint64_t)&type metadata for Logger + v12, v4);
  OUTLINED_FUNCTION_35_3((unint64_t *)(v12 + v2));
  OUTLINED_FUNCTION_324(v13);
  v14 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v14 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v14 + 24) = v12;
  OUTLINED_FUNCTION_104((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v15);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v2);
  OUTLINED_FUNCTION_12_3(v3);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v0 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FAEB1C(_BYTE *a1)
{
  uint64_t result;

  result = sub_1C2FAEBB0();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1C2FAEBB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v1 = OUTLINED_FUNCTION_93();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_55_0();
  v3 = OUTLINED_FUNCTION_348();
  if (sub_1C2FC2294(v3))
  {
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v0, *MEMORY[0x1E0D9EE68], v1);
    OUTLINED_FUNCTION_158();
    v4 = sub_1C2FC15BC();
    OUTLINED_FUNCTION_32_1(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
    swift_release();
  }
  else
  {
    v4 = 0;
  }
  return v4 & 1;
}

void sub_1C2FAEC8C()
{
  char v0;
  NSObject *v1;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  char *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)();
  uint64_t v43;

  OUTLINED_FUNCTION_30_1();
  v31 = v1;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = OUTLINED_FUNCTION_3_0();
  v15 = OUTLINED_FUNCTION_101(v14);
  MEMORY[0x1E0C80A78](v15);
  v29 = (uint64_t)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v17);
  v33 = (uint64_t)&v28 - v18;
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)&v28 - v20;
  v34 = v1;
  v35 = v13;
  v36 = v11;
  v37 = v9;
  v38 = v7;
  v39 = v5;
  sub_1C2F9C624();
  v32 = v21;
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_123();
  v22 = v33;
  OUTLINED_FUNCTION_17_4();
  v31 = *(NSObject **)((char *)&v31->isa + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  v23 = *(_QWORD *)(v30 + 16);
  OUTLINED_FUNCTION_26_4(v2, (uint64_t)v21);
  v24 = v29;
  OUTLINED_FUNCTION_26_4(v29, v22);
  OUTLINED_FUNCTION_48_2();
  v25 = swift_allocObject();
  OUTLINED_FUNCTION_26_4(v25 + v23, v2);
  OUTLINED_FUNCTION_26_4((uint64_t)&v21[v25], v24);
  OUTLINED_FUNCTION_183((unint64_t *)(v25 + v22));
  OUTLINED_FUNCTION_181(v26);
  v27 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v27 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v27 + 24) = v25;
  v42 = sub_1C2FC0008;
  v43 = v27;
  v40 = MEMORY[0x1E0C809B0];
  v41 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_135();
  OUTLINED_FUNCTION_109(v31);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_12_3(v33);
  OUTLINED_FUNCTION_12_3((uint64_t)v32);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v0 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

void sub_1C2FAEF78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;

  if ((a5 & 2) != 0)
  {
    MEMORY[0x1E0C80A78](a1);
    v6 = objc_allocWithZone((Class)sub_1C2FC966C());
    OUTLINED_FUNCTION_69_0();
    v7 = (void *)sub_1C2FC9630();
    if (v7)
    {
      v8 = v7;
      sub_1C2F9D5D0(v7);

    }
    else
    {
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v9 = OUTLINED_FUNCTION_7();
      v10 = __swift_project_value_buffer(v9, (uint64_t)qword_1ED7AF5F0);
      OUTLINED_FUNCTION_20_2();
      sub_1C2FC98E8();
      v11 = OUTLINED_FUNCTION_43();
      if (OUTLINED_FUNCTION_119(v10))
      {
        v12 = (uint8_t *)OUTLINED_FUNCTION_1();
        v14 = OUTLINED_FUNCTION_1();
        *(_DWORD *)v12 = 136315138;
        OUTLINED_FUNCTION_11_0();
        OUTLINED_FUNCTION_160(a1, v13, &v14);
        OUTLINED_FUNCTION_112();
        OUTLINED_FUNCTION_26_3();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v10, v11, "Cannot create PrewarmNLMessage for assistantId: %s", v12);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_46();
    }
  }
}

uint64_t sub_1C2FAF140()
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
  uint64_t v11;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF468);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *MEMORY[0x1E0D9E640];
  v7 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  sub_1C2FC9660();
  swift_bridgeObjectRetain();
  sub_1C2FC963C();
  swift_bridgeObjectRetain();
  sub_1C2FC9648();
  v8 = *MEMORY[0x1E0D9EE68];
  v9 = sub_1C2FC9720();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v2, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v9);
  return sub_1C2FC9654();
}

void sub_1C2FAF2C0()
{
  char v0;
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
  uint64_t (**v16)();
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[12];

  OUTLINED_FUNCTION_30_1();
  v7 = v1;
  v9 = v8;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_102();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_43_2();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_97();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_96();
  v19[2] = v7;
  v19[3] = v9;
  sub_1C2F9C624();
  OUTLINED_FUNCTION_28_3();
  OUTLINED_FUNCTION_189();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v18 = *(NSObject **)(v7 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  v14 = *(_QWORD *)(v6 + 16);
  OUTLINED_FUNCTION_26_4(v5, v3);
  OUTLINED_FUNCTION_26_4(v4, v2);
  OUTLINED_FUNCTION_30_3();
  v15 = swift_allocObject();
  OUTLINED_FUNCTION_26_4(v15 + v14, v5);
  OUTLINED_FUNCTION_26_4((uint64_t)&type metadata for Logger + v15, v4);
  OUTLINED_FUNCTION_35_3((unint64_t *)(v15 + v2));
  *v16 = sub_1C2FBEC54;
  v16[1] = (uint64_t (*)())v19;
  v17 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v17 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v17 + 24) = v15;
  v19[9] = sub_1C2FC0008;
  v19[10] = v17;
  v19[5] = MEMORY[0x1E0C809B0];
  v19[6] = 1107296256;
  OUTLINED_FUNCTION_104((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v18);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v2);
  OUTLINED_FUNCTION_12_3(v3);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v0 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FAF4AC(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v11[2];
  char v12;

  v11[1] = a1;
  v3 = sub_1C2FC9798();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(a2, sel_assistantId);
  v11[0] = sub_1C2FC99F0();

  v8 = objc_msgSend(a2, sel_languageCode);
  sub_1C2FC99F0();

  objc_msgSend(a2, sel_understandingOnDevice);
  sub_1C2FBE29C(a2, (SEL *)&selRef_sharedUserId);
  if (!v9)
  {
    sub_1C2FC978C();
    sub_1C2FC9780();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  objc_msgSend(a2, sel_clientAuditToken);
  v12 = 0;
  sub_1C2FAF68C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_1C2FAF68C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  int v5;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t (*v56)(uint64_t, _QWORD);
  uint64_t v57;
  os_log_type_t v58;
  _BOOL4 v59;
  _DWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66[3];
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89[8];

  OUTLINED_FUNCTION_30_1();
  v76 = v2;
  v71 = v3;
  v72 = v4;
  v75 = v5;
  v73 = v6;
  v74 = v7;
  v9 = v8;
  v11 = v10;
  v70 = OUTLINED_FUNCTION_138();
  v69 = *(_QWORD *)(v70 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v12);
  v68 = (char *)v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = OUTLINED_FUNCTION_33_0();
  v66[2] = *(_QWORD *)(v67 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_85((uint64_t)v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF490);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_76();
  v17 = OUTLINED_FUNCTION_93();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = OUTLINED_FUNCTION_59();
  v22 = OUTLINED_FUNCTION_316(v21);
  v24 = *(_QWORD *)(v23 + 64);
  MEMORY[0x1E0C80A78](v22);
  OUTLINED_FUNCTION_85((uint64_t)v66 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v25);
  v27 = (char *)v66 - v26;
  OUTLINED_FUNCTION_92();
  (*(void (**)(char *, _QWORD, uint64_t))(v18 + 104))(v20, *MEMORY[0x1E0D9EE68], v17);
  OUTLINED_FUNCTION_348();
  sub_1C2FC2748();
  v28 = OUTLINED_FUNCTION_273();
  v29 = v9;
  v30 = v0;
  v31(v28);
  v32 = v71;
  OUTLINED_FUNCTION_11_0();
  v33 = v72;
  sub_1C2FC9774();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_49_1();
  __swift_storeEnumTagSinglePayload(v34, v35, v36, v37);
  v38 = v0 + OBJC_IVAR___SRDRequestDispatcherInternal_sessionUserId;
  OUTLINED_FUNCTION_347();
  sub_1C2FBF76C(v1, v38);
  swift_endAccess();
  v39 = v73;
  OUTLINED_FUNCTION_303();
  v40 = v74;
  sub_1C2FA9068(v74, v39);
  v80 = v11;
  v81 = v29;
  v79 = v27;
  v82 = v27;
  v83 = v40;
  v84 = v39;
  v85 = v75;
  v86 = v33;
  v87 = v32;
  v88 = v76;
  v41 = objc_allocWithZone((Class)sub_1C2FC8BD4());
  v42 = sub_1C2FC8B74();
  if (v42)
  {
    v43 = (void *)v42;
    v44 = *(_QWORD *)(v30 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger);
    v45 = v78;
    v46 = v77;
    if ((*(_BYTE *)(v44 + 32) & 1) != 0 || (OUTLINED_FUNCTION_169(), v47))
    {
      v76 = *(_QWORD *)(v44 + 16);
      v48 = v66[0];
      OUTLINED_FUNCTION_232(v66[0], (uint64_t)v79, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v46 + 16));
      v49 = (*(unsigned __int8 *)(v46 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80);
      v50 = swift_allocObject();
      *(_QWORD *)(v50 + 16) = v44;
      OUTLINED_FUNCTION_232(v50 + v49, v48, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v46 + 32));
      v89[4] = (uint64_t)sub_1C2FBF82C;
      v89[5] = v50;
      v89[0] = MEMORY[0x1E0C809B0];
      v89[1] = 1107296256;
      v51 = OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA8FF0);
      OUTLINED_FUNCTION_12_0();
      v52 = v66[1];
      OUTLINED_FUNCTION_323();
      v89[6] = MEMORY[0x1E0DEE9D8];
      sub_1C2FBFF94(qword_1ED7AEEF0, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
      OUTLINED_FUNCTION_141();
      OUTLINED_FUNCTION_132(&qword_1ED7AEF20);
      OUTLINED_FUNCTION_297();
      v53 = (uint64_t)v68;
      sub_1C2FC9BDC();
      MEMORY[0x1C3BD0204](0, v52, v53, v51);
      OUTLINED_FUNCTION_82();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_41_0(v53, v54);
      v55 = OUTLINED_FUNCTION_188();
      OUTLINED_FUNCTION_36_0(v55, v56);
      OUTLINED_FUNCTION_244();
    }
    sub_1C2F9D5D0(v43);

  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v57 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v57, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v58 = OUTLINED_FUNCTION_26();
    v59 = OUTLINED_FUNCTION_14_4(v58);
    v46 = v77;
    if (v59)
    {
      v60 = (_DWORD *)OUTLINED_FUNCTION_1();
      v61 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_301(v61);
      *v60 = 136315138;
      OUTLINED_FUNCTION_147();
      v63 = OUTLINED_FUNCTION_165(v11, v62, v89);
      OUTLINED_FUNCTION_62_1(v63);
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_21_3(&dword_1C2F94000, v64, v65, "Cannot create SessionStartedMessage for assistantId: %s");
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
    v45 = v78;
  }
  (*(void (**)(char *, uint64_t))(v46 + 8))(v79, v45);
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FAFBFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;

  v27 = a7;
  v25 = a4;
  v26 = a5;
  v28 = a8;
  v29 = a10;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF490);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *MEMORY[0x1E0D9E640];
  v20 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v18, v19, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v20);
  sub_1C2FC8BB0();
  swift_bridgeObjectRetain();
  sub_1C2FC8B80();
  v21 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v15, v25, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v21);
  sub_1C2FC8BC8();
  swift_bridgeObjectRetain();
  sub_1C2FC8B8C();
  sub_1C2FC8BA4();
  swift_bridgeObjectRetain();
  sub_1C2FC9774();
  v22 = sub_1C2FC9798();
  __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, v22);
  sub_1C2FC8BBC();
  return sub_1C2FC8B98();
}

void sub_1C2FAFE08()
{
  char v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
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
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)();
  uint64_t v30;

  OUTLINED_FUNCTION_30_1();
  v23 = v1;
  v8 = v7;
  v10 = v9;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_81();
  MEMORY[0x1E0C80A78](v11);
  v21 = (uint64_t)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_192();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_338();
  v25 = v10;
  v26 = v8;
  sub_1C2F9C624();
  v15 = v6;
  v24 = v6;
  OUTLINED_FUNCTION_28_3();
  OUTLINED_FUNCTION_189();
  v22 = v3;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v23 = *(NSObject **)((char *)&v23->isa + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  v16 = *(_QWORD *)(v2 + 16);
  OUTLINED_FUNCTION_26_4(v4, v15);
  v17 = v21;
  OUTLINED_FUNCTION_26_4(v21, v3);
  OUTLINED_FUNCTION_47_2();
  v18 = swift_allocObject();
  OUTLINED_FUNCTION_26_4(v18 + v16, v4);
  OUTLINED_FUNCTION_26_4(v18 + v15, v17);
  OUTLINED_FUNCTION_35_3((unint64_t *)((char *)&type metadata for Logger + v18));
  OUTLINED_FUNCTION_324(v19);
  v20 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v20 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v20 + 24) = v18;
  v29 = sub_1C2FC0008;
  v30 = v20;
  v27 = MEMORY[0x1E0C809B0];
  v28 = 1107296256;
  OUTLINED_FUNCTION_104((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v23);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v22);
  OUTLINED_FUNCTION_12_3(v24);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v0 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB001C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF570);
  v0 = sub_1C2FC9720();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1C2FCACB0;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v1 + 104))(v3 + v2, *MEMORY[0x1E0D9EE68], v0);
  sub_1C2FB0164();
  swift_setDeallocating();
  return sub_1C2FBD734();
}

void sub_1C2FB0164()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  int v3;
  NSObject *v4;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
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
  NSObject *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t);
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  int64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  os_log_type_t v87;
  _DWORD *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  uint64_t v109;
  os_log_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116[6];
  uint64_t v117;

  OUTLINED_FUNCTION_30_1();
  LODWORD(v114) = v2;
  v108 = v3;
  v110 = v4;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = OUTLINED_FUNCTION_7();
  v111 = *(_QWORD *)(v11 - 8);
  v112 = v11;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_98();
  v13 = OUTLINED_FUNCTION_138();
  v104 = *(_QWORD *)(v13 - 8);
  v105 = v13;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_1_0();
  v103 = v15;
  v16 = OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_316(v16);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_1_0();
  v102 = v18;
  v107 = OUTLINED_FUNCTION_59();
  v101 = *(_QWORD *)(v107 - 8);
  MEMORY[0x1E0C80A78](v107);
  v99 = v19;
  v100 = (uint64_t)&v94 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = OUTLINED_FUNCTION_93();
  v115 = *(_QWORD *)(v20 - 8);
  OUTLINED_FUNCTION_15_0();
  v22 = MEMORY[0x1E0C80A78](v21);
  v24 = (char *)&v94 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x1E0C80A78](v22);
  v27 = (char *)&v94 - v26;
  MEMORY[0x1E0C80A78](v25);
  v29 = (char *)&v94 - v28;
  v106 = v0;
  v30 = v10;
  v31 = v10;
  v32 = v8;
  v109 = *(_QWORD *)(v0 + OBJC_IVAR___SRDRequestDispatcherInternal_sessionsManager);
  v33 = sub_1C2FC2294(v31);
  v113 = v6;
  if (v33)
  {
    v34 = v33;
    if (v6)
    {
      v95 = v30;
      v35 = *(_QWORD *)(v6 + 16);
      v97 = v1;
      v36 = v112;
      v96 = v8;
      v98 = v33;
      v114 = OBJC_IVAR____TtC14SiriMessageBus7Session_conversationSession;
      if (!v35)
      {
LABEL_8:
        if (qword_1ED7AEDB0 != -1)
          swift_once();
        v40 = __swift_project_value_buffer(v36, (uint64_t)qword_1ED7AF5F0);
        v41 = v111;
        v42 = v97;
        OUTLINED_FUNCTION_45_0((uint64_t)v97, v40, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v111 + 16));
        swift_retain_n();
        OUTLINED_FUNCTION_20_2();
        OUTLINED_FUNCTION_20_2();
        sub_1C2FC98E8();
        v43 = OUTLINED_FUNCTION_43();
        if (OUTLINED_FUNCTION_306((os_log_type_t)v43))
        {
          v108 = v43;
          v110 = v42;
          v44 = OUTLINED_FUNCTION_1();
          v106 = OUTLINED_FUNCTION_1();
          v116[0] = v106;
          *(_DWORD *)v44 = 136315906;
          v45 = sub_1C2FC9714();
          v47 = OUTLINED_FUNCTION_374(v45, v46);
          OUTLINED_FUNCTION_180(v47);
          OUTLINED_FUNCTION_307();
          OUTLINED_FUNCTION_349();
          OUTLINED_FUNCTION_11();
          v109 = v44;
          *(_WORD *)(v44 + 12) = 2080;
          if (v35)
          {
            v48 = v113 + ((*(unsigned __int8 *)(v115 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v115 + 80));
            v114 = *(_QWORD *)(v115 + 72);
            v49 = *(void (**)(uint64_t))(v115 + 16);
            swift_bridgeObjectRetain();
            v50 = (_QWORD *)MEMORY[0x1E0DEE9D8];
            do
            {
              v51 = OUTLINED_FUNCTION_292();
              v49(v51);
              v52 = sub_1C2FC9714();
              v54 = v53;
              (*(void (**)(char *, uint64_t))(v115 + 8))(v27, v20);
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              {
                v58 = (_QWORD *)OUTLINED_FUNCTION_240();
                v50 = sub_1C2FBD88C(v58, v59, v60, (uint64_t)v50, &qword_1ED7AEF70, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_1C2FBDC7C, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1C2FBE08C);
              }
              v56 = v50[2];
              v55 = v50[3];
              if (v56 >= v55 >> 1)
                v50 = sub_1C2FBD88C((_QWORD *)(v55 > 1), v56 + 1, 1, (uint64_t)v50, &qword_1ED7AEF70, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_1C2FBDC7C, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1C2FBE08C);
              v50[2] = v56 + 1;
              v57 = &v50[2 * v56];
              v57[4] = v52;
              v57[5] = v54;
              v48 += v114;
              --v35;
            }
            while (v35);
            OUTLINED_FUNCTION_247();
          }
          else
          {
            v50 = (_QWORD *)MEMORY[0x1E0DEE9D8];
          }
          v117 = (uint64_t)v50;
          v80 = v109;
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7DBC28);
          sub_1C2FBF9F0(&qword_1EF7DBC30, &qword_1EF7DBC28);
          sub_1C2FC99CC();
          OUTLINED_FUNCTION_7_1();
          v81 = OUTLINED_FUNCTION_293();
          v117 = sub_1C2FC4294(v81, v82, v83);
          sub_1C2FC9BA0();
          OUTLINED_FUNCTION_46();
          OUTLINED_FUNCTION_11();
          *(_WORD *)(v80 + 22) = 2080;
          sub_1C2FBFF94(qword_1ED7AE740, (void (*)(uint64_t))MEMORY[0x1E0CB0998]);
          v84 = sub_1C2FC9C9C();
          v117 = OUTLINED_FUNCTION_374(v84, v85);
          OUTLINED_FUNCTION_307();
          OUTLINED_FUNCTION_349();
          OUTLINED_FUNCTION_11();
          *(_WORD *)(v80 + 32) = 2080;
          OUTLINED_FUNCTION_24();
          v117 = OUTLINED_FUNCTION_99(v95, v86, v116);
          sub_1C2FC9BA0();
          OUTLINED_FUNCTION_26_3();
          _os_log_impl(&dword_1C2F94000, v110, (os_log_type_t)v108, "Current session type: %s is different from given types: %s not ending sessionId: %s for assistantId: %s", (uint8_t *)v80, 0x2Au);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_0();
        }

        OUTLINED_FUNCTION_46();
        OUTLINED_FUNCTION_46();
        swift_release_n();
        (*(void (**)(NSObject *, uint64_t))(v41 + 8))(v42, v36);
        goto LABEL_40;
      }
      v37 = v6 + ((*(unsigned __int8 *)(v115 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v115 + 80));
      v38 = *(_QWORD *)(v115 + 72);
      sub_1C2FBFF94(&qword_1ED7AF450, (void (*)(uint64_t))MEMORY[0x1E0D9EE78]);
      OUTLINED_FUNCTION_24();
      v39 = v35;
      while (1)
      {
        v34 = v20;
        if ((sub_1C2FC99D8() & 1) != 0)
          break;
        v37 += v38;
        if (!--v39)
        {
          OUTLINED_FUNCTION_241();
          v36 = v112;
          OUTLINED_FUNCTION_360();
          goto LABEL_8;
        }
      }
      OUTLINED_FUNCTION_241();
      OUTLINED_FUNCTION_360();
    }
    v68 = v34;
    if ((v108 & 1) != 0)
    {
      v69 = v115;
      (*(void (**)(char *, _QWORD, uint64_t))(v115 + 104))(v29, *MEMORY[0x1E0D9EE68], v20);
      v70 = OUTLINED_FUNCTION_142();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v29, v20);
      if ((v70 & 1) != 0)
      {
        v71 = *(_QWORD *)(v106 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger);
        if ((*(_BYTE *)(v71 + 32) & 1) != 0 || *(_BYTE *)(v71 + 33) == 1)
        {
          v115 = *(_QWORD *)(v71 + 16);
          v72 = v101;
          v73 = v100;
          OUTLINED_FUNCTION_45_0(v100, v68 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v101 + 16));
          v74 = (*(unsigned __int8 *)(v72 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80);
          v75 = swift_allocObject();
          *(_QWORD *)(v75 + 16) = v71;
          OUTLINED_FUNCTION_45_0(v75 + v74, v73, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v72 + 32));
          v116[4] = (uint64_t)sub_1C2FBF760;
          v116[5] = v75;
          v116[0] = MEMORY[0x1E0C809B0];
          v116[1] = 1107296256;
          OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA8FF0);
          OUTLINED_FUNCTION_12_0();
          sub_1C2FC9924();
          v117 = MEMORY[0x1E0DEE9D8];
          sub_1C2FBFF94(qword_1ED7AEEF0, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
          OUTLINED_FUNCTION_141();
          OUTLINED_FUNCTION_132(&qword_1ED7AEF20);
          OUTLINED_FUNCTION_297();
          sub_1C2FC9BDC();
          OUTLINED_FUNCTION_321();
        }
      }
    }
    sub_1C2FC2920();
    OUTLINED_FUNCTION_80();
  }
  else if ((v114 & 1) != 0 && v113)
  {
    v61 = v115;
    (*(void (**)(char *, _QWORD, uint64_t))(v115 + 104))(v24, *MEMORY[0x1E0D9EE68], v20);
    v62 = *(_QWORD *)(v113 + 16);
    if (v62)
    {
      v63 = v112;
      v64 = v32;
      v65 = v61;
      v66 = v113 + ((*(unsigned __int8 *)(v61 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v61 + 80));
      v67 = *(_QWORD *)(v65 + 72);
      sub_1C2FBFF94(&qword_1ED7AF450, (void (*)(uint64_t))MEMORY[0x1E0D9EE78]);
      OUTLINED_FUNCTION_303();
      while ((sub_1C2FC99D8() & 1) == 0)
      {
        v66 += v67;
        if (!--v62)
          goto LABEL_35;
      }
      OUTLINED_FUNCTION_201();
      v76 = OUTLINED_FUNCTION_241();
      MEMORY[0x1E0C80A78](v76);
      *(&v94 - 2) = v30;
      *(&v94 - 1) = v64;
      v77 = objc_allocWithZone((Class)sub_1C2FC96F0());
      v78 = (void *)sub_1C2FC96C0();
      if (v78)
      {
        v79 = v78;
        sub_1C2F9D5D0(v78);

      }
      else
      {
        if (qword_1ED7AEDB0 != -1)
          swift_once();
        __swift_project_value_buffer(v63, (uint64_t)qword_1ED7AF5F0);
        OUTLINED_FUNCTION_20_2();
        sub_1C2FC98E8();
        v87 = OUTLINED_FUNCTION_26();
        if (OUTLINED_FUNCTION_14_4(v87))
        {
          v88 = (_DWORD *)OUTLINED_FUNCTION_1();
          v89 = OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_301(v89);
          *v88 = 136315138;
          OUTLINED_FUNCTION_147();
          v91 = OUTLINED_FUNCTION_165(v30, v90, v116);
          OUTLINED_FUNCTION_62_1(v91);
          OUTLINED_FUNCTION_26_3();
          OUTLINED_FUNCTION_21_3(&dword_1C2F94000, v92, v93, "Cannot create CancelPrewarmNLMessage for assistantId: %s");
          OUTLINED_FUNCTION_12();
          OUTLINED_FUNCTION_0();
        }

        OUTLINED_FUNCTION_46();
      }
    }
    else
    {
      OUTLINED_FUNCTION_303();
LABEL_35:
      OUTLINED_FUNCTION_201();
      OUTLINED_FUNCTION_241();
    }
  }
LABEL_40:
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB0C40()
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
  uint64_t v11;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF468);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *MEMORY[0x1E0D9E640];
  v7 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v5, v6, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v7);
  sub_1C2FC96E4();
  swift_bridgeObjectRetain();
  sub_1C2FC96CC();
  v8 = *MEMORY[0x1E0D9EE68];
  v9 = sub_1C2FC9720();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v2, v8, v9);
  __swift_storeEnumTagSinglePayload((uint64_t)v2, 0, 1, v9);
  return sub_1C2FC96D8();
}

void sub_1C2FB0D9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  _BYTE *v42;
  uint64_t v43;
  void (**v44)();
  uint64_t v45;
  _BYTE v46[24];
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  _QWORD v52[20];

  OUTLINED_FUNCTION_30_1();
  a19 = v24;
  a20 = v25;
  v33 = OUTLINED_FUNCTION_44_2(v26, v27, v28, v29, v30, v31, v32);
  v34 = OUTLINED_FUNCTION_3_0();
  v48 = *(_QWORD *)(v34 - 8);
  OUTLINED_FUNCTION_105();
  MEMORY[0x1E0C80A78](v35);
  v47 = &v46[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v36);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v37);
  v51 = &v46[-v38];
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v39);
  OUTLINED_FUNCTION_37_1();
  v50 = v20;
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_123();
  v40 = v51;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v49 = *(_QWORD *)(v23 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  v41 = *(_QWORD *)(v48 + 16);
  OUTLINED_FUNCTION_33_2(v21, v20);
  v42 = v47;
  OUTLINED_FUNCTION_33_2((uint64_t)v47, (uint64_t)v40);
  OUTLINED_FUNCTION_23_3();
  v43 = swift_allocObject();
  OUTLINED_FUNCTION_33_2(v43 + v41, v21);
  OUTLINED_FUNCTION_33_2(v43 + v23, (uint64_t)v42);
  OUTLINED_FUNCTION_118((unint64_t *)(v43 + v33));
  *v44 = sub_1C2FBEC7C;
  v44[1] = (void (*)())v52;
  v45 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v45 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v45 + 24) = v43;
  v52[16] = sub_1C2FC0008;
  v52[17] = v45;
  v52[12] = MEMORY[0x1E0C809B0];
  v52[13] = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_106((uint64_t)&a18);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_12_3((uint64_t)v51);
  OUTLINED_FUNCTION_12_3(v50);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v34 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB0FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v20 = a8;
  v12 = sub_1C2FC95F4();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2FAD884();
  sub_1C2FB10AC(a2, a3, a4, a5, (uint64_t)v15, v20, v16, v17, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29,
    v30,
    v31);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

void sub_1C2FB10AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, int a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint8_t *v26;
  uint8_t *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t (*v51)(char *, uint64_t, uint64_t);
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint8_t *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  char *v61;
  uint64_t (*v62)(char *, uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  _QWORD *v68;
  char v69;
  char v70;
  int v71;
  int v72;
  uint64_t v73;
  char *v74;
  uint8_t *v75;
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
  uint8_t *v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  void *v92;
  char *v93;
  char *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  uint64_t v97;
  os_log_type_t v98;
  uint8_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  os_log_type_t v103;
  uint8_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  os_log_type_t v109;
  _BOOL4 v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  uint64_t (*v119)(char *, uint64_t, uint64_t);
  int v120;
  char v121;
  uint64_t v122;
  uint8_t *v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  uint8_t *v136;
  uint64_t v137;
  char *v138;
  uint64_t v139[6];
  uint64_t v140;

  OUTLINED_FUNCTION_30_1();
  a20 = v22;
  a21 = v23;
  v133 = v24;
  v134 = v25;
  v27 = v26;
  v135 = v28;
  v30 = v29;
  v32 = v31;
  v33 = OUTLINED_FUNCTION_138();
  v129 = *(_QWORD *)(v33 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v34);
  v128 = (char *)&v119 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = OUTLINED_FUNCTION_33_0();
  v126 = *(_QWORD *)(v36 - 8);
  v127 = v36;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v37);
  v125 = (char *)&v119 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v39);
  OUTLINED_FUNCTION_1_0();
  v136 = v40;
  v41 = OUTLINED_FUNCTION_59();
  v42 = *(_QWORD *)(v41 - 8);
  MEMORY[0x1E0C80A78](v41);
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_85(v43);
  OUTLINED_FUNCTION_219((uint64_t)&a18);
  MEMORY[0x1E0C80A78](v44);
  v138 = (char *)&v119 - v45;
  v46 = OUTLINED_FUNCTION_93();
  MEMORY[0x1E0C80A78](v46);
  OUTLINED_FUNCTION_98();
  v131 = v21;
  v137 = v32;
  v47 = v30;
  sub_1C2FC231C();
  if (v48)
  {
    v123 = v27;
    v132 = v42;
    v130 = v41;
    v49 = v48;
    OUTLINED_FUNCTION_265();
    v50 = OUTLINED_FUNCTION_233();
    OUTLINED_FUNCTION_328();
    if ((v50 & 1) != 0)
    {
      v122 = v33;
      v51 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v132 + 16);
      v52 = v138;
      v53 = v130;
      v54 = v51(v138, v49 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId, v130);
      MEMORY[0x1E0C80A78](v54);
      OUTLINED_FUNCTION_276();
      *(_QWORD *)(v55 - 64) = v137;
      *(_QWORD *)(v55 - 56) = v47;
      v56 = v135;
      *(_QWORD *)(v55 - 48) = v52;
      *(_QWORD *)(v55 - 40) = v56;
      v57 = v123;
      v58 = v133;
      *(_QWORD *)(v55 - 32) = v123;
      *(_QWORD *)(v55 - 24) = v58;
      *(_QWORD *)(v55 - 16) = v134;
      v59 = objc_allocWithZone((Class)sub_1C2FC8C88());
      OUTLINED_FUNCTION_69_0();
      v60 = sub_1C2FC8BF8();
      if (v60)
      {
        v61 = (char *)v60;
        v137 = v49;
        v62 = v51;
        v63 = v131;
        v133 = *(_QWORD *)(v131 + OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil);
        v119 = v62;
        v62((char *)v136, (uint64_t)v52, v53);
        OUTLINED_FUNCTION_49_1();
        __swift_storeEnumTagSinglePayload(v64, v65, v66, v53);
        v67 = AFDeviceSupportsSiriUOD();
        v120 = OUTLINED_FUNCTION_342(v67, (uint64_t)&a15);
        v68 = (_QWORD *)(v63 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils);
        OUTLINED_FUNCTION_140((_QWORD *)(v63 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils), *(_QWORD *)(v63 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils + 24));
        v134 = v61;
        OUTLINED_FUNCTION_33_1();
        v69 = sub_1C2FC987C();
        OUTLINED_FUNCTION_17_0();
        OUTLINED_FUNCTION_140(v68, v68[3]);
        OUTLINED_FUNCTION_91();
        LOBYTE(v61) = sub_1C2FC987C();
        OUTLINED_FUNCTION_121();
        OUTLINED_FUNCTION_140((_QWORD *)(v63 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker), *(_QWORD *)(v63 + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker + 24));
        OUTLINED_FUNCTION_273();
        v70 = sub_1C2FC9810();
        v71 = v69 & 1;
        v72 = v61 & 1;
        v73 = v133;
        v74 = v134;
        v75 = v136;
        sub_1C2FA42C8(v136, v56, v57, 5, v121, v120, v71, v72, v70 & 1);
        sub_1C2F9BD60((uint64_t)v75, &qword_1ED7AE750);
        v76 = OUTLINED_FUNCTION_313();
        v77 = v73;
        sub_1C2FA5728(v76, v78, v79, v80);
        v81 = OUTLINED_FUNCTION_313();
        sub_1C2FA597C(v81, v82, v83, v84, 1);
        sub_1C2F9D5D0(v74);
        v85 = *(_QWORD *)(v63 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger);
        v86 = v57;
        v87 = v56;
        if ((*(_BYTE *)(v85 + 32) & 1) != 0 || (OUTLINED_FUNCTION_169(), v88))
        {
          v136 = *(uint8_t **)(v85 + 16);
          v89 = v124;
          v118 = v138;
          v116 = v130;
          OUTLINED_FUNCTION_216((uint64_t)&a13);
          v117 = v132;
          OUTLINED_FUNCTION_149();
          OUTLINED_FUNCTION_94();
          v90 = swift_allocObject();
          *(_QWORD *)(v90 + 16) = v85;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v117 + 32))(v90 + v77, v89, v116);
          v91 = (uint64_t *)&v74[v90];
          *v91 = v87;
          v91[1] = (uint64_t)v86;
          v139[4] = (uint64_t)sub_1C2FBF664;
          v139[5] = v90;
          v139[0] = MEMORY[0x1E0C809B0];
          v139[1] = 1107296256;
          v92 = OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA8FF0);
          OUTLINED_FUNCTION_12_0();
          OUTLINED_FUNCTION_71();
          v93 = v125;
          OUTLINED_FUNCTION_323();
          v140 = MEMORY[0x1E0DEE9D8];
          sub_1C2FBFF94(qword_1ED7AEEF0, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
          OUTLINED_FUNCTION_141();
          OUTLINED_FUNCTION_132(&qword_1ED7AEF20);
          OUTLINED_FUNCTION_297();
          v94 = v128;
          OUTLINED_FUNCTION_133();
          MEMORY[0x1C3BD0204](0, v93, v94, v92);
          _Block_release(v92);
          v95 = OUTLINED_FUNCTION_249();
          OUTLINED_FUNCTION_194(v95, v96);
          OUTLINED_FUNCTION_279();
          OUTLINED_FUNCTION_278();

          OUTLINED_FUNCTION_124();
        }
        else
        {
          OUTLINED_FUNCTION_278();

          v116 = v130;
          v117 = v132;
          v118 = v138;
        }
        (*(void (**)(char *, uint64_t))(v117 + 8))(v118, v116);
      }
      else
      {
        if (qword_1ED7AEDB0 != -1)
          swift_once();
        v108 = OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_212(v108, (uint64_t)qword_1ED7AF5F0);
        OUTLINED_FUNCTION_20_2();
        sub_1C2FC98E8();
        v109 = OUTLINED_FUNCTION_26();
        v110 = OUTLINED_FUNCTION_14_4(v109);
        v111 = v132;
        if (v110)
        {
          OUTLINED_FUNCTION_1();
          v112 = OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_301(v112);
          OUTLINED_FUNCTION_59_1(4.8149e-34);
          v140 = OUTLINED_FUNCTION_87(v135, v113, v139);
          sub_1C2FC9BA0();
          OUTLINED_FUNCTION_26_3();
          OUTLINED_FUNCTION_21_3(&dword_1C2F94000, v114, v115, "Failed to create StartLocalRequestMessage for request Id: %s");
          OUTLINED_FUNCTION_12();
          OUTLINED_FUNCTION_0();
        }

        OUTLINED_FUNCTION_46();
        swift_release();
        (*(void (**)(char *, uint64_t))(v111 + 8))(v52, v53);
      }
    }
    else
    {
      v137 = v49;
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v102 = OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_38_0(v102, (uint64_t)qword_1ED7AF5F0);
      v103 = OUTLINED_FUNCTION_26();
      if (os_log_type_enabled(v30, v103))
      {
        v104 = (uint8_t *)OUTLINED_FUNCTION_1();
        v138 = (char *)OUTLINED_FUNCTION_1();
        v139[0] = (uint64_t)v138;
        *(_DWORD *)v104 = 136315138;
        v136 = v104 + 4;
        OUTLINED_FUNCTION_265();
        v105 = OUTLINED_FUNCTION_356();
        OUTLINED_FUNCTION_328();
        v107 = OUTLINED_FUNCTION_170(v105, v106, v139);
        OUTLINED_FUNCTION_180(v107);
        OUTLINED_FUNCTION_251();
        OUTLINED_FUNCTION_7_1();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v30, v103, "Current session is not of type %s, cannot start local request", v104);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_278();
    }
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v97 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v97, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v98 = OUTLINED_FUNCTION_365();
    if (OUTLINED_FUNCTION_88(v30))
    {
      v99 = (uint8_t *)OUTLINED_FUNCTION_1();
      v139[0] = OUTLINED_FUNCTION_1();
      *(_DWORD *)v99 = 136315138;
      OUTLINED_FUNCTION_24();
      v101 = OUTLINED_FUNCTION_99(v137, v100, v139);
      OUTLINED_FUNCTION_89(v101);
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v30, v98, "No active session for assistantId: %s cannot start local request", v99);
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
  }
  OUTLINED_FUNCTION_27();
}

void sub_1C2FB1998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,__int128 a21,uint64_t a22,uint64_t a23)
{
  char v23;
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
  int v37;
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
  void (**v50)();
  uint64_t v51;
  _QWORD v52[2];
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[7];

  OUTLINED_FUNCTION_30_1();
  a19 = v28;
  a20 = v29;
  OUTLINED_FUNCTION_203(v30, v31, v32, v33, v34, v35, v36);
  v57 = v37;
  v56 = v38;
  v54 = v39;
  OUTLINED_FUNCTION_341(v40, (uint64_t)v74);
  v58 = a23;
  OUTLINED_FUNCTION_332(a22);
  v55 = a21;
  v53 = OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_100();
  MEMORY[0x1E0C80A78](v41);
  OUTLINED_FUNCTION_52_1((uint64_t)v52 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v42);
  OUTLINED_FUNCTION_78();
  MEMORY[0x1E0C80A78](v43);
  OUTLINED_FUNCTION_52_1((uint64_t)v52 - v44);
  MEMORY[0x1E0C80A78](v45);
  OUTLINED_FUNCTION_64_1();
  OUTLINED_FUNCTION_54_1();
  v63 = v25;
  v64 = v27;
  v65 = v52[1];
  v66 = v54;
  OUTLINED_FUNCTION_207();
  v67 = v46;
  v68 = v57;
  OUTLINED_FUNCTION_223();
  v69 = v55;
  OUTLINED_FUNCTION_271();
  v70 = v48;
  v71 = v47;
  v72 = v53;
  v60 = v24;
  OUTLINED_FUNCTION_34_2();
  OUTLINED_FUNCTION_200();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_57_1(*(_QWORD *)(v25 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  OUTLINED_FUNCTION_72_0((uint64_t)&a14);
  OUTLINED_FUNCTION_22_3();
  v49 = swift_allocObject();
  OUTLINED_FUNCTION_27_2(v49);
  OUTLINED_FUNCTION_41_2((uint64_t)&type metadata for Logger + v25, v24);
  OUTLINED_FUNCTION_35_3((unint64_t *)(v25 + v26));
  *v50 = sub_1C2FBEC90;
  v50[1] = (void (*)())&v62;
  v51 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v51 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v51 + 24) = v25;
  v74[3] = sub_1C2FC0008;
  v74[4] = v51;
  v73 = MEMORY[0x1E0C809B0];
  v74[0] = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_32_3();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v59);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v61);
  OUTLINED_FUNCTION_12_3(v60);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v23 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB1C38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD v15[2];
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v16 = a6;
  v17 = a4;
  v18 = a5;
  v19 = a1;
  v15[0] = a10;
  v15[1] = a3;
  v10 = sub_1C2FC95F4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2FAD884();
  if (a9)
    sub_1C2FC9AF8();
  sub_1C2FB1E7C();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

void sub_1C2FB1E7C()
{
  uint64_t v0;
  NSObject *v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
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
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t, uint64_t);
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  OUTLINED_FUNCTION_30_1();
  v2 = v1;
  v45 = v3;
  v46 = v4;
  v6 = v5;
  v8 = v7;
  v47 = v9;
  v10 = OUTLINED_FUNCTION_93();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_236();
  if (v12)
  {
    v44 = v2;
    v13 = *MEMORY[0x1E0D9EE68];
    v43 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 104);
    v43(v0, v13, v10);
    v14 = OUTLINED_FUNCTION_142();
    v15 = OUTLINED_FUNCTION_312();
    if ((v14 & 1) != 0)
    {
      MEMORY[0x1E0C80A78](v15);
      OUTLINED_FUNCTION_354();
      *(_QWORD *)(v16 - 80) = v17;
      *(_QWORD *)(v16 - 72) = v47;
      *(_QWORD *)(v16 - 64) = v8;
      *(_BYTE *)(v16 - 56) = v6 & 1;
      *(_QWORD *)(v16 - 48) = v45;
      *(_QWORD *)(v16 - 40) = v46;
      *(_QWORD *)(v16 - 32) = v44;
      *(_QWORD *)(v16 - 24) = v18;
      *(_QWORD *)(v16 - 16) = v20;
      *(_QWORD *)(v16 - 8) = v19;
      v21 = objc_allocWithZone((Class)sub_1C2FC9024());
      OUTLINED_FUNCTION_69_0();
      v22 = (void *)sub_1C2FC8FA0();
      if (v22)
      {
        v23 = v22;
        OUTLINED_FUNCTION_330(v22);
        OUTLINED_FUNCTION_108();

        goto LABEL_21;
      }
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v37 = OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_212(v37, (uint64_t)qword_1ED7AF5F0);
      OUTLINED_FUNCTION_20_2();
      sub_1C2FC98E8();
      v38 = OUTLINED_FUNCTION_43();
      if (OUTLINED_FUNCTION_46_2(v14))
      {
        v39 = (uint8_t *)OUTLINED_FUNCTION_1();
        v40 = OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_300(v40);
        *(_DWORD *)v39 = 136315138;
        OUTLINED_FUNCTION_83();
        v42 = OUTLINED_FUNCTION_110(v47, v41, &v48);
        OUTLINED_FUNCTION_62_1(v42);
        OUTLINED_FUNCTION_26_3();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v14, v38, "Failed to create StartTestSpeechRequestMessage for request Id: %s", v39);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_46();
    }
    else
    {
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v30 = OUTLINED_FUNCTION_7();
      v31 = OUTLINED_FUNCTION_38_0(v30, (uint64_t)qword_1ED7AF5F0);
      v32 = sub_1C2FC9B10();
      if (OUTLINED_FUNCTION_88(v31))
      {
        v33 = (uint8_t *)OUTLINED_FUNCTION_1();
        v48 = OUTLINED_FUNCTION_1();
        *(_DWORD *)v33 = 136315138;
        v43(v0, v13, v10);
        v34 = OUTLINED_FUNCTION_269();
        OUTLINED_FUNCTION_312();
        v36 = OUTLINED_FUNCTION_127(v34, v35, &v48);
        OUTLINED_FUNCTION_254(v36);
        OUTLINED_FUNCTION_171();
        OUTLINED_FUNCTION_121();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v31, v32, "Current session is not of type %s, cannot start test speech request", v33);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

    }
    swift_release();
    goto LABEL_21;
  }
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v24 = OUTLINED_FUNCTION_7();
  __swift_project_value_buffer(v24, (uint64_t)qword_1ED7AF5F0);
  OUTLINED_FUNCTION_20_2();
  OUTLINED_FUNCTION_20_2();
  sub_1C2FC98E8();
  v25 = OUTLINED_FUNCTION_26();
  if (OUTLINED_FUNCTION_14_4(v25))
  {
    v26 = (uint8_t *)OUTLINED_FUNCTION_1();
    v27 = OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_300(v27);
    *(_DWORD *)v26 = 136315394;
    OUTLINED_FUNCTION_33_1();
    v28 = OUTLINED_FUNCTION_50_1();
    OUTLINED_FUNCTION_164(v28);
    OUTLINED_FUNCTION_26_3();
    OUTLINED_FUNCTION_283();
    OUTLINED_FUNCTION_91();
    OUTLINED_FUNCTION_127(v47, v29, &v48);
    OUTLINED_FUNCTION_65_1();
    OUTLINED_FUNCTION_26_3();
    OUTLINED_FUNCTION_39(&dword_1C2F94000, v2, (os_log_type_t)v11, "No active session for assistantId: %s cannot start test speech request for request id: %s", v26);
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_46();
LABEL_21:
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB2358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
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
  uint64_t result;
  id v27;
  id v28;
  _QWORD v29[2];
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v30 = a7;
  v29[0] = a4;
  v29[1] = a5;
  v34 = a12;
  v35 = a11;
  v33 = a10;
  v31 = a8;
  v32 = a9;
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF410);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v19);
  v21 = (char *)v29 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *MEMORY[0x1E0D9E640];
  v23 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v21, v22, v23);
  __swift_storeEnumTagSinglePayload((uint64_t)v21, 0, 1, v23);
  sub_1C2FC8FE8();
  swift_bridgeObjectRetain();
  sub_1C2FC8FB8();
  v24 = sub_1C2FC8A0C();
  (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v18, v29[0], v24);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v24);
  sub_1C2FC9018();
  swift_bridgeObjectRetain();
  sub_1C2FC900C();
  sub_1C2FC9000();
  v25 = sub_1C2FC95F4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v15, v31, v25);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v25);
  sub_1C2FC8FC4();
  swift_retain();
  sub_1C2FC8FF4();
  swift_bridgeObjectRetain();
  sub_1C2FC8FAC();
  swift_bridgeObjectRetain();
  result = sub_1C2FC8FD0();
  if (a13)
  {
    v27 = objc_allocWithZone((Class)sub_1C2FC9684());
    v28 = a13;
    sub_1C2FC9678();
    return sub_1C2FC8FDC();
  }
  return result;
}

void sub_1C2FB25D8()
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
  void (**v28)();
  uint64_t v29;
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)();
  uint64_t v48;

  OUTLINED_FUNCTION_30_1();
  v33 = v0;
  v30[2] = v4;
  v30[1] = v5;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = OUTLINED_FUNCTION_3_0();
  v32 = *(_QWORD *)(v16 - 8);
  OUTLINED_FUNCTION_105();
  MEMORY[0x1E0C80A78](v17);
  v31 = (uint64_t)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v19);
  v35 = (uint64_t)v30 - v20;
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v21);
  OUTLINED_FUNCTION_95();
  v37 = v0;
  v38 = v15;
  v39 = v13;
  v40 = v11;
  v41 = v9;
  v42 = v7;
  OUTLINED_FUNCTION_272();
  v43 = v23;
  v44 = v22;
  sub_1C2F9C624();
  v34 = v1;
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_123();
  v24 = v35;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v33 = *(NSObject **)((char *)&v33->isa + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  v25 = *(_QWORD *)(v32 + 16);
  OUTLINED_FUNCTION_33_2(v2, v1);
  v26 = v31;
  OUTLINED_FUNCTION_33_2(v31, v24);
  OUTLINED_FUNCTION_23_3();
  v27 = swift_allocObject();
  OUTLINED_FUNCTION_33_2(v27 + v25, v2);
  OUTLINED_FUNCTION_33_2(v27 + v9, v26);
  OUTLINED_FUNCTION_118((unint64_t *)(v27 + v7));
  *v28 = sub_1C2FBECD4;
  v28[1] = (void (*)())&v36;
  v29 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v29 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v29 + 24) = v27;
  v47 = sub_1C2FC0008;
  v48 = v29;
  v45 = MEMORY[0x1E0C809B0];
  v46 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_109(v33);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_12_3(v35);
  OUTLINED_FUNCTION_12_3(v34);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v16 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

void sub_1C2FB2844()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  id v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  os_log_type_t v40;
  uint8_t *v41;
  _QWORD *v42;
  id v43;
  uint64_t v44;
  os_log_type_t v45;
  _DWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[2];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;

  OUTLINED_FUNCTION_30_1();
  v2 = v1;
  v54 = v4;
  v55 = (char *)v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_185();
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v51 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_344();
  if (v17)
  {
    v51[1] = v17;
    v52 = v0;
    v18 = *(void (**)(char *, uint64_t, uint64_t))(v0 + 16);
    v53 = v13;
    v18(v16, v17 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId, v13);
    sub_1C2F9BD28(0, (unint64_t *)&unk_1EF7DBC18);
    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CFEA20]), sel_init);
    v20 = v2;
    v21 = sub_1C2FB2D6C(v2, v2, v19, 1, 0.0);
    if (v21)
    {
      v22 = v21;
      MEMORY[0x1E0C80A78](v21);
      OUTLINED_FUNCTION_276();
      *(_QWORD *)(v23 - 64) = v12;
      *(_QWORD *)(v23 - 56) = v10;
      v24 = v54;
      v25 = (uint64_t)v55;
      *(_QWORD *)(v23 - 48) = v16;
      *(_QWORD *)(v23 - 40) = v25;
      *(_QWORD *)(v23 - 32) = v8;
      *(_QWORD *)(v23 - 24) = v6;
      *(_QWORD *)(v23 - 16) = v24;
      *(_QWORD *)(v23 - 8) = v26;
      v27 = objc_allocWithZone((Class)sub_1C2FC8CF4());
      OUTLINED_FUNCTION_69_0();
      v28 = (void *)sub_1C2FC8C94();
      if (!v28)
      {
        if (qword_1ED7AEDB0 != -1)
          swift_once();
        v44 = OUTLINED_FUNCTION_7();
        __swift_project_value_buffer(v44, (uint64_t)qword_1ED7AF5F0);
        OUTLINED_FUNCTION_20_2();
        sub_1C2FC98E8();
        v45 = OUTLINED_FUNCTION_26();
        if (OUTLINED_FUNCTION_14_4(v45))
        {
          v46 = (_DWORD *)OUTLINED_FUNCTION_1();
          v57 = OUTLINED_FUNCTION_1();
          *v46 = 136315138;
          OUTLINED_FUNCTION_16_0();
          v56 = OUTLINED_FUNCTION_170(v25, v47, &v57);
          OUTLINED_FUNCTION_171();
          OUTLINED_FUNCTION_26_3();
          OUTLINED_FUNCTION_21_3(&dword_1C2F94000, v48, v49, "Failed to create AsrResultCandidateMessage for request Id: %s");
          OUTLINED_FUNCTION_12();
          OUTLINED_FUNCTION_0();
        }

        OUTLINED_FUNCTION_46();
        OUTLINED_FUNCTION_182();

        v30 = OUTLINED_FUNCTION_249();
        goto LABEL_21;
      }
      v29 = v28;
      OUTLINED_FUNCTION_372(v28);
      OUTLINED_FUNCTION_182();

      v30 = OUTLINED_FUNCTION_249();
    }
    else
    {
      v55 = v16;
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v38 = OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_212(v38, (uint64_t)qword_1ED7AF5F0);
      v39 = v20;
      sub_1C2FC98E8();
      v40 = OUTLINED_FUNCTION_26();
      if (OUTLINED_FUNCTION_119(v8))
      {
        v41 = (uint8_t *)OUTLINED_FUNCTION_1();
        v42 = (_QWORD *)OUTLINED_FUNCTION_1();
        *(_DWORD *)v41 = 138412290;
        v57 = (uint64_t)v39;
        v43 = v39;
        OUTLINED_FUNCTION_112();
        *v42 = v2;

        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v8, v40, "Failed to create SpeechPackage for recognition: %@", v41);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF5D0);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_182();
      v31 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
      v30 = (uint64_t)v55;
    }
    v50 = v53;
LABEL_21:
    v31(v30, v50);
    goto LABEL_22;
  }
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v32 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_212(v32, (uint64_t)qword_1ED7AF5F0);
  OUTLINED_FUNCTION_20_2();
  OUTLINED_FUNCTION_20_2();
  sub_1C2FC98E8();
  v33 = OUTLINED_FUNCTION_26();
  if (OUTLINED_FUNCTION_14_4(v33))
  {
    v34 = OUTLINED_FUNCTION_1();
    v35 = OUTLINED_FUNCTION_1();
    OUTLINED_FUNCTION_300(v35);
    *(_DWORD *)v34 = 136315394;
    OUTLINED_FUNCTION_83();
    v56 = OUTLINED_FUNCTION_110(v12, v36, &v57);
    OUTLINED_FUNCTION_65_1();
    OUTLINED_FUNCTION_26_3();
    *(_WORD *)(v34 + 12) = 2080;
    OUTLINED_FUNCTION_147();
    v56 = OUTLINED_FUNCTION_165((uint64_t)v55, v37, &v57);
    OUTLINED_FUNCTION_65_1();
    OUTLINED_FUNCTION_26_3();
    OUTLINED_FUNCTION_39(&dword_1C2F94000, v8, (os_log_type_t)v6, "No active session for assistantId: %s cannot post test result candidate for request id: %s", (uint8_t *)v34);
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_46();
LABEL_22:
  OUTLINED_FUNCTION_27();
}

id sub_1C2FB2D6C(void *a1, void *a2, void *a3, char a4, double a5)
{
  id v8;

  v8 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRecognition_rawRecognition_audioAnalytics_isFinal_utteranceStart_, a1, a2, a3, a4 & 1, a5);

  return v8;
}

uint64_t sub_1C2FB2DF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
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
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v26 = a5;
  v27 = a7;
  v24 = a2;
  v25 = a4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF490);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *MEMORY[0x1E0D9E640];
  v19 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v17, v18, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
  sub_1C2FC8CC4();
  swift_bridgeObjectRetain();
  sub_1C2FC8CAC();
  v20 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v14, v25, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v20);
  sub_1C2FC8CE8();
  swift_bridgeObjectRetain();
  sub_1C2FC8CDC();
  swift_bridgeObjectRetain();
  sub_1C2FC8CA0();
  v21 = a9;
  sub_1C2FC8CB8();
  sub_1C2FC978C();
  v22 = sub_1C2FC9798();
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v22);
  return sub_1C2FC8CD0();
}

void sub_1C2FB2FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  NSObject *v20;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (**v47)();
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)();
  uint64_t v65;

  OUTLINED_FUNCTION_30_1();
  a19 = v24;
  a20 = v25;
  v52 = v20;
  v49 = v26;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v37 = OUTLINED_FUNCTION_3_0();
  v51 = *(_QWORD *)(v37 - 8);
  OUTLINED_FUNCTION_105();
  MEMORY[0x1E0C80A78](v38);
  v50 = (uint64_t)&v49 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v39);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v40);
  v54 = (uint64_t)&v49 - v41;
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v42);
  OUTLINED_FUNCTION_95();
  v56 = v20;
  v57 = v36;
  v58 = v34;
  v59 = v32;
  v60 = v30;
  v61 = v28;
  OUTLINED_FUNCTION_335((uint64_t)&a17);
  v53 = v21;
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_123();
  v43 = v54;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v52 = *(NSObject **)((char *)&v52->isa + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  v44 = *(_QWORD *)(v51 + 16);
  OUTLINED_FUNCTION_33_2(v22, v21);
  v45 = v50;
  OUTLINED_FUNCTION_33_2(v50, v43);
  OUTLINED_FUNCTION_23_3();
  v46 = swift_allocObject();
  OUTLINED_FUNCTION_33_2(v46 + v44, v22);
  OUTLINED_FUNCTION_33_2(v46 + v32, v45);
  OUTLINED_FUNCTION_118((unint64_t *)(v46 + v30));
  *v47 = sub_1C2FBECFC;
  v47[1] = (void (*)())&v55;
  v48 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v48 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v48 + 24) = v46;
  v64 = sub_1C2FC0008;
  v65 = v48;
  v62 = MEMORY[0x1E0C809B0];
  v63 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_109(v52);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_12_3(v54);
  OUTLINED_FUNCTION_12_3(v53);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v37 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

void sub_1C2FB324C()
{
  os_log_type_t v0;
  os_log_type_t v1;
  os_log_type_t v2;
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
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_30_1();
  v2 = v0;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  OUTLINED_FUNCTION_222();
  OUTLINED_FUNCTION_178();
  if (v11)
  {
    MEMORY[0x1E0C80A78](v11);
    OUTLINED_FUNCTION_355();
    *(_QWORD *)(v13 - 48) = v12;
    *(_QWORD *)(v13 - 40) = v10;
    *(_QWORD *)(v13 - 32) = v8;
    *(_QWORD *)(v13 - 24) = v6;
    *(_QWORD *)(v13 - 16) = v4;
    v14 = objc_allocWithZone((Class)sub_1C2FC8B14());
    v15 = (void *)OUTLINED_FUNCTION_329();
    if (v15)
    {
      v16 = v15;
      OUTLINED_FUNCTION_202(v15);
      OUTLINED_FUNCTION_80();

    }
    else
    {
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v23 = OUTLINED_FUNCTION_7();
      v24 = __swift_project_value_buffer(v23, (uint64_t)qword_1ED7AF5F0);
      OUTLINED_FUNCTION_20_2();
      sub_1C2FC98E8();
      v25 = OUTLINED_FUNCTION_43();
      if (OUTLINED_FUNCTION_21(v25))
      {
        v26 = (uint8_t *)OUTLINED_FUNCTION_1();
        v27 = OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_48_1(v27);
        *(_DWORD *)v26 = 136315138;
        OUTLINED_FUNCTION_11_0();
        v28 = OUTLINED_FUNCTION_115();
        OUTLINED_FUNCTION_9_2(v28);
        OUTLINED_FUNCTION_26_3();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v24, v1, "Failed to create ResultSelectedMessage for request Id: %s", v26);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_80();
    }
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v17 = OUTLINED_FUNCTION_7();
    v18 = __swift_project_value_buffer(v17, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v19 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_66_1(v19))
    {
      v20 = OUTLINED_FUNCTION_1();
      v21 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_281(v21);
      *(_DWORD *)v20 = 136315394;
      OUTLINED_FUNCTION_33_1();
      v22 = OUTLINED_FUNCTION_50_1();
      OUTLINED_FUNCTION_146(v22);
      OUTLINED_FUNCTION_26_3();
      *(_WORD *)(v20 + 12) = 2080;
      OUTLINED_FUNCTION_11_0();
      OUTLINED_FUNCTION_115();
      OUTLINED_FUNCTION_65_1();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_39(&dword_1C2F94000, v18, v2, "No active session for assistantId: %s cannot post test result selected for request id: %s", (uint8_t *)v20);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_46();
  }
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB352C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[2];

  v18[0] = a5;
  v18[1] = a7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *MEMORY[0x1E0D9E640];
  v15 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  sub_1C2FC8B50();
  swift_bridgeObjectRetain();
  sub_1C2FC8B20();
  v16 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v10, a4, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v16);
  sub_1C2FC8B68();
  swift_bridgeObjectRetain();
  sub_1C2FC8B5C();
  swift_bridgeObjectRetain();
  sub_1C2FC8B44();
  return sub_1C2FC8B2C();
}

void sub_1C2FB36C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (**v48)();
  uint64_t v49;
  _QWORD v50[3];
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)();
  uint64_t v68;

  OUTLINED_FUNCTION_30_1();
  a19 = v26;
  a20 = v27;
  v29 = v28;
  v53 = v30;
  v51 = v31;
  v50[2] = v32;
  OUTLINED_FUNCTION_341(v33, (uint64_t)&a16);
  v50[0] = OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_81();
  MEMORY[0x1E0C80A78](v34);
  OUTLINED_FUNCTION_191();
  v52 = v35;
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v36);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v37);
  v55 = (uint64_t)v50 - v38;
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v39);
  v40 = OUTLINED_FUNCTION_64_1();
  OUTLINED_FUNCTION_54_1();
  v57 = v21;
  v58 = v25;
  OUTLINED_FUNCTION_272();
  v59 = v42;
  v60 = v41;
  v61 = v51;
  v62 = v53;
  v63 = v29;
  v64 = v50[0];
  v43 = v23;
  v54 = v23;
  OUTLINED_FUNCTION_34_2();
  OUTLINED_FUNCTION_200();
  v44 = v55;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v53 = *(NSObject **)(v21 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  v45 = *(_QWORD *)(v22 + 16);
  OUTLINED_FUNCTION_26_4(v24, v43);
  v46 = v52;
  OUTLINED_FUNCTION_26_4(v52, v44);
  OUTLINED_FUNCTION_47_2();
  v47 = swift_allocObject();
  OUTLINED_FUNCTION_26_4(v47 + v45, v24);
  OUTLINED_FUNCTION_26_4(v47 + v40, v46);
  OUTLINED_FUNCTION_35_3((unint64_t *)((char *)&type metadata for Logger + v47));
  *v48 = sub_1C2FBED30;
  v48[1] = (uint64_t (*)())&v56;
  v49 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v49 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v49 + 24) = v47;
  v67 = sub_1C2FC0008;
  v68 = v49;
  v65 = MEMORY[0x1E0C809B0];
  v66 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_32_3();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v53);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v55);
  OUTLINED_FUNCTION_12_3(v54);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v20 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB3924()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_1C2FC95F4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2FAD884();
  sub_1C2FB3A74();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1C2FB39FC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t))
{
  id v8;
  uint64_t v9;

  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_280();
  sub_1C2FC99F0();
  v8 = a1;
  v9 = OUTLINED_FUNCTION_299();
  a6(v9);

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_327();
  return OUTLINED_FUNCTION_145();
}

void sub_1C2FB3A74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint8_t *v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t *v8;
  uint8_t *v9;
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
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint8_t *v40;
  unint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  void *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint8_t *v50;
  uint64_t v51;
  int v52;
  int v53;
  uint64_t v54;
  os_log_type_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  os_log_type_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint8_t *v74;
  id v75;
  uint8_t *v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint8_t *v89;
  uint8_t *v90;
  char *v91;
  uint64_t v92[6];
  uint64_t v93;

  OUTLINED_FUNCTION_30_1();
  v85 = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v12);
  v84 = (uint64_t)&v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = OUTLINED_FUNCTION_138();
  v82 = *(_QWORD *)(v14 - 8);
  v83 = v14;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v15);
  v81 = (char *)&v76 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = OUTLINED_FUNCTION_33_0();
  v79 = *(_QWORD *)(v17 - 8);
  v80 = v17;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v18);
  v78 = (char *)&v76 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_343();
  v90 = v20;
  OUTLINED_FUNCTION_105();
  MEMORY[0x1E0C80A78](v21);
  v77 = (uint64_t)&v76 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v22);
  v91 = (char *)&v76 - v23;
  v24 = OUTLINED_FUNCTION_93();
  v25 = *(NSObject **)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  OUTLINED_FUNCTION_76();
  v87 = v0;
  v89 = (uint8_t *)v11;
  sub_1C2FC231C();
  if (v26)
  {
    v88 = v1;
    v86 = v7;
    v76 = v5;
    v27 = v26;
    OUTLINED_FUNCTION_246();
    v28 = OUTLINED_FUNCTION_142();
    OUTLINED_FUNCTION_311();
    if ((v28 & 1) != 0)
    {
      v29 = v91;
      v30 = v88;
      v31 = (*((uint64_t (**)(char *, uint64_t, uint64_t))v90 + 2))(v91, v27 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId, v88);
      MEMORY[0x1E0C80A78](v31);
      *(&v76 - 6) = v89;
      *(&v76 - 5) = v9;
      v32 = v86;
      *(&v76 - 4) = (uint8_t *)v29;
      *(&v76 - 3) = (uint8_t *)v32;
      v33 = v76;
      v74 = v76;
      v75 = v85;
      v34 = objc_allocWithZone((Class)sub_1C2FC9414());
      OUTLINED_FUNCTION_69_0();
      v35 = (void *)sub_1C2FC8BF8();
      if (v35)
      {
        v89 = (uint8_t *)v27;
        v36 = v87;
        v85 = v35;
        sub_1C2F9D5D0(v35);
        v37 = *(_QWORD *)(v36 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger);
        if ((*(_BYTE *)(v37 + 32) & 1) != 0 || (OUTLINED_FUNCTION_169(), v38))
        {
          v39 = v77;
          OUTLINED_FUNCTION_314(v77);
          v40 = v90;
          v41 = (v90[80] + 24) & ~(unint64_t)v90[80];
          v42 = swift_allocObject();
          *(_QWORD *)(v42 + 16) = v37;
          (*((void (**)(unint64_t, uint64_t, uint64_t))v40 + 4))(v42 + v41, v39, v88);
          v43 = (_QWORD *)(v42 + ((v2 + v41 + 7) & 0xFFFFFFFFFFFFFFF8));
          *v43 = v86;
          v43[1] = v33;
          v92[4] = (uint64_t)sub_1C2FBF664;
          v92[5] = v42;
          v92[0] = MEMORY[0x1E0C809B0];
          v92[1] = 1107296256;
          v44 = OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA8FF0);
          OUTLINED_FUNCTION_12_0();
          OUTLINED_FUNCTION_71();
          v45 = v78;
          OUTLINED_FUNCTION_323();
          v93 = MEMORY[0x1E0DEE9D8];
          sub_1C2FBFF94(qword_1ED7AEEF0, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
          OUTLINED_FUNCTION_141();
          OUTLINED_FUNCTION_132(&qword_1ED7AEF20);
          OUTLINED_FUNCTION_297();
          v46 = (uint64_t)v81;
          sub_1C2FC9BDC();
          MEMORY[0x1C3BD0204](0, v45, v46, v44);
          _Block_release(v44);
          OUTLINED_FUNCTION_32_1(v46, *(uint64_t (**)(uint64_t, uint64_t))(v82 + 8));
          OUTLINED_FUNCTION_279();
          OUTLINED_FUNCTION_244();
        }
        v47 = v87;
        v83 = *(_QWORD *)(v87 + OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil);
        v48 = v84;
        OUTLINED_FUNCTION_314(v84);
        OUTLINED_FUNCTION_125(v48);
        LODWORD(v82) = AFDeviceSupportsSiriUOD();
        LODWORD(v81) = AFShouldRunAsrOnServerForUOD();
        v49 = (_QWORD *)(v47 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils);
        OUTLINED_FUNCTION_140((_QWORD *)(v47 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils), *(_QWORD *)(v47 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils + 24));
        OUTLINED_FUNCTION_71();
        sub_1C2FC987C();
        OUTLINED_FUNCTION_39_0();
        OUTLINED_FUNCTION_140(v49, v49[3]);
        OUTLINED_FUNCTION_71();
        sub_1C2FC987C();
        OUTLINED_FUNCTION_39_0();
        LOBYTE(v74) = 0;
        v50 = (uint8_t *)OUTLINED_FUNCTION_158();
        sub_1C2FA42C8(v50, v51, v33, 1, v82, (char)v81, v52, v53, v74);
        OUTLINED_FUNCTION_310();

        sub_1C2F9BD60(v48, &qword_1ED7AE750);
        (*((void (**)(char *, uint64_t))v90 + 1))(v91, v88);
      }
      else
      {
        if (qword_1ED7AEDB0 != -1)
          swift_once();
        v68 = OUTLINED_FUNCTION_7();
        __swift_project_value_buffer(v68, (uint64_t)qword_1ED7AF5F0);
        OUTLINED_FUNCTION_20_2();
        sub_1C2FC98E8();
        v69 = OUTLINED_FUNCTION_26();
        if (OUTLINED_FUNCTION_14_4(v69))
        {
          OUTLINED_FUNCTION_1();
          v70 = OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_301(v70);
          OUTLINED_FUNCTION_59_1(4.8149e-34);
          v93 = OUTLINED_FUNCTION_87(v86, v71, v92);
          sub_1C2FC9BA0();
          OUTLINED_FUNCTION_26_3();
          OUTLINED_FUNCTION_21_3(&dword_1C2F94000, v72, v73, "Failed to create StartRemoteServerRequestMessage for request Id: %s");
          OUTLINED_FUNCTION_12();
          OUTLINED_FUNCTION_0();
        }

        OUTLINED_FUNCTION_46();
        OUTLINED_FUNCTION_108();
        (*((void (**)(char *, uint64_t))v90 + 1))(v91, v30);
      }
    }
    else
    {
      v89 = (uint8_t *)v27;
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v61 = OUTLINED_FUNCTION_7();
      v62 = OUTLINED_FUNCTION_38_0(v61, (uint64_t)qword_1ED7AF5F0);
      v63 = sub_1C2FC9B10();
      if (os_log_type_enabled(v62, v63))
      {
        v64 = (uint8_t *)OUTLINED_FUNCTION_1();
        v91 = (char *)OUTLINED_FUNCTION_1();
        v92[0] = (uint64_t)v91;
        *(_DWORD *)v64 = 136315138;
        v90 = v64 + 4;
        OUTLINED_FUNCTION_246();
        v65 = OUTLINED_FUNCTION_269();
        OUTLINED_FUNCTION_311();
        v67 = OUTLINED_FUNCTION_87(v65, v66, v92);
        OUTLINED_FUNCTION_255(v67);
        OUTLINED_FUNCTION_129();
        OUTLINED_FUNCTION_39_0();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v62, v63, "Current session is not of type %s, cannot start remote server request", v64);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_310();
    }
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v54 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_212(v54, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v55 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_88(v25))
    {
      v56 = OUTLINED_FUNCTION_1();
      v92[0] = OUTLINED_FUNCTION_1();
      *(_DWORD *)v56 = 136315394;
      OUTLINED_FUNCTION_24();
      v58 = OUTLINED_FUNCTION_99((uint64_t)v89, v57, v92);
      OUTLINED_FUNCTION_319(v58);
      sub_1C2FC9BA0();
      OUTLINED_FUNCTION_26_3();
      *(_WORD *)(v56 + 12) = 2080;
      OUTLINED_FUNCTION_71();
      v60 = OUTLINED_FUNCTION_87(v7, v59, v92);
      OUTLINED_FUNCTION_320(v60);
      OUTLINED_FUNCTION_154();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_39(&dword_1C2F94000, v25, v55, "No active session for assistantId: %s cannot start remote server request for request id: %s", (uint8_t *)v56);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_46();
  }
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB432C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v22 = a5;
  v23 = a7;
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF410);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *MEMORY[0x1E0D9E640];
  v18 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v16, v17, v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v18);
  sub_1C2FC8A90();
  swift_bridgeObjectRetain();
  sub_1C2FC8A6C();
  v19 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v13, a4, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v19);
  sub_1C2FC8AA8();
  swift_bridgeObjectRetain();
  sub_1C2FC8A9C();
  v20 = sub_1C2FC95F4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v10, v23, v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v20);
  return sub_1C2FC8A78();
}

void sub_1C2FB4520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  char v20;
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
  _QWORD *v39;
  uint64_t v40;
  _QWORD v41[10];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)();
  uint64_t v47;

  OUTLINED_FUNCTION_30_1();
  a19 = v24;
  a20 = v25;
  v41[2] = OUTLINED_FUNCTION_60_1(v26, v27, v28, v29, v30, v31, v32);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_100();
  MEMORY[0x1E0C80A78](v33);
  OUTLINED_FUNCTION_52_1((uint64_t)v41 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v34);
  OUTLINED_FUNCTION_78();
  MEMORY[0x1E0C80A78](v35);
  OUTLINED_FUNCTION_52_1((uint64_t)v41 - v36);
  MEMORY[0x1E0C80A78](v37);
  OUTLINED_FUNCTION_64_1();
  OUTLINED_FUNCTION_54_1();
  OUTLINED_FUNCTION_53_1();
  v42 = v21;
  OUTLINED_FUNCTION_34_2();
  OUTLINED_FUNCTION_200();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_57_1(*(_QWORD *)(v22 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  OUTLINED_FUNCTION_72_0((uint64_t)&a16);
  OUTLINED_FUNCTION_22_3();
  v38 = swift_allocObject();
  OUTLINED_FUNCTION_27_2(v38);
  OUTLINED_FUNCTION_41_2((uint64_t)&type metadata for Logger + v22, v21);
  OUTLINED_FUNCTION_35_3((unint64_t *)(v22 + v23));
  OUTLINED_FUNCTION_285(v39);
  v40 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v40 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v40 + 24) = v22;
  v46 = sub_1C2FC0008;
  v47 = v40;
  v44 = MEMORY[0x1E0C809B0];
  v45 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_32_3();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v41[8]);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v43);
  OUTLINED_FUNCTION_12_3(v42);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v20 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB4724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
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

  v20 = a1;
  v21 = a8;
  v19 = a5;
  v13 = sub_1C2FC95F4();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v18 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2FAD884();
  sub_1C2FB480C(a2, a3, a4, v19, (uint64_t)v16, v21, a9, a10, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

void sub_1C2FB480C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint8_t *v30;
  uint64_t v31;
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
  char *v43;
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
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  _BOOL4 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint8_t *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  id v90;
  void *v91;
  uint64_t v92;
  id v93;
  void *v94;
  id v95;
  void *v96;
  id v97;
  uint64_t v98;
  uint8_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void (*v113)(uint64_t, uint64_t);
  uint64_t (*v114)(uint64_t, _QWORD);
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  char v120;
  _QWORD *v121;
  uint8_t *v122;
  uint64_t v123;
  uint8_t *v124;
  int v125;
  int v126;
  uint64_t v127;
  void (*v128)(uint64_t, uint64_t);
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  os_log_type_t v132;
  _BOOL4 v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  os_log_type_t v140;
  _BOOL4 v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  os_log_type_t v148;
  _BOOL4 v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  os_log_type_t v157;
  _BOOL4 v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t *v164;
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
  void *v178;
  uint64_t v179;
  void *v180;
  void *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint8_t *v189;
  uint8_t *v190;
  uint64_t v191;
  uint64_t v192[6];
  uint64_t v193;
  uint64_t v194[4];

  OUTLINED_FUNCTION_30_1();
  a19 = v21;
  a20 = v22;
  v181 = v23;
  v178 = v24;
  v177 = v25;
  v180 = v26;
  v191 = v27;
  v187 = v28;
  v30 = v29;
  v32 = v31;
  v179 = OUTLINED_FUNCTION_161();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v33);
  OUTLINED_FUNCTION_122((uint64_t)&v166 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
  v35 = sub_1C2FC990C();
  OUTLINED_FUNCTION_196(v35, (uint64_t)&a12);
  v174 = v36;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v37);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_333(v38);
  v172 = OUTLINED_FUNCTION_33_0();
  v171 = *(_QWORD *)(v172 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v39);
  OUTLINED_FUNCTION_85((uint64_t)&v166 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF490);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v41);
  v43 = (char *)&v166 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = OUTLINED_FUNCTION_10_1();
  v184 = *(_QWORD *)(v44 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v45);
  OUTLINED_FUNCTION_1_0();
  v185 = v46;
  v47 = OUTLINED_FUNCTION_59();
  v48 = *(_QWORD *)(v47 - 8);
  MEMORY[0x1E0C80A78](v47);
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_85(v49);
  OUTLINED_FUNCTION_219((uint64_t)v194);
  MEMORY[0x1E0C80A78](v50);
  OUTLINED_FUNCTION_47_0();
  v188 = v51;
  v52 = OUTLINED_FUNCTION_93();
  MEMORY[0x1E0C80A78](v52);
  OUTLINED_FUNCTION_98();
  v186 = v20;
  v189 = (uint8_t *)v32;
  v190 = v30;
  OUTLINED_FUNCTION_344();
  if (v53)
  {
    v176 = v44;
    v182 = v48;
    v54 = v53;
    OUTLINED_FUNCTION_264();
    v55 = OUTLINED_FUNCTION_233();
    OUTLINED_FUNCTION_325();
    v183 = v54;
    if ((v55 & 1) != 0)
    {
      v56 = v182;
      v57 = v188;
      v58 = v47;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v182 + 16))(v188, v54 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId, v47);
      v59 = v186 + OBJC_IVAR___SRDRequestDispatcherInternal_sessionUserId;
      OUTLINED_FUNCTION_5_0();
      sub_1C2FA8A8C(v59, (uint64_t)v43);
      OUTLINED_FUNCTION_350((uint64_t)v43, 1, v176);
      if (v60)
      {
        sub_1C2F9BD60((uint64_t)v43, &qword_1ED7AF490);
        if (qword_1ED7AEDB0 != -1)
          swift_once();
        v61 = OUTLINED_FUNCTION_7();
        v62 = __swift_project_value_buffer(v61, (uint64_t)qword_1ED7AF5F0);
        OUTLINED_FUNCTION_20_2();
        OUTLINED_FUNCTION_20_2();
        sub_1C2FC98E8();
        v63 = OUTLINED_FUNCTION_43();
        if (OUTLINED_FUNCTION_6_2(v63))
        {
          v64 = OUTLINED_FUNCTION_1();
          v192[0] = OUTLINED_FUNCTION_1();
          *(_DWORD *)v64 = 136315394;
          OUTLINED_FUNCTION_71();
          v193 = OUTLINED_FUNCTION_87((uint64_t)v189, v65, v192);
          OUTLINED_FUNCTION_228();
          OUTLINED_FUNCTION_26_3();
          *(_WORD *)(v64 + 12) = 2080;
          OUTLINED_FUNCTION_147();
          v193 = OUTLINED_FUNCTION_165(v187, v66, v192);
          sub_1C2FC9BA0();
          OUTLINED_FUNCTION_26_3();
          OUTLINED_FUNCTION_39(&dword_1C2F94000, v62, (os_log_type_t)v52, "sessionUserId is not set for assistantId: %s during request: %s", (uint8_t *)v64);
          OUTLINED_FUNCTION_38();
          OUTLINED_FUNCTION_0();
        }

        OUTLINED_FUNCTION_46();
        OUTLINED_FUNCTION_46();
        OUTLINED_FUNCTION_90();
        v128 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
      }
      else
      {
        v167 = v47;
        v82 = v185;
        v83 = OUTLINED_FUNCTION_358(v185, (uint64_t)v43, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v184 + 32));
        MEMORY[0x1E0C80A78](v83);
        OUTLINED_FUNCTION_276();
        v85 = (uint64_t)v189;
        v84 = v190;
        *(_QWORD *)(v86 - 64) = v189;
        *(_QWORD *)(v86 - 56) = v84;
        v87 = v187;
        *(_QWORD *)(v86 - 48) = v57;
        *(_QWORD *)(v86 - 40) = v87;
        v88 = v191;
        v89 = v180;
        *(_QWORD *)(v86 - 32) = v191;
        *(_QWORD *)(v86 - 24) = v89;
        *(_QWORD *)(v86 - 16) = v181;
        v90 = objc_allocWithZone((Class)sub_1C2FC94EC());
        OUTLINED_FUNCTION_69_0();
        v91 = (void *)sub_1C2FC8BF8();
        if (v91)
        {
          v181 = v91;
          MEMORY[0x1E0C80A78](v91);
          *(&v166 - 10) = v85;
          *(&v166 - 9) = (uint64_t)v84;
          *(&v166 - 8) = v57;
          *(&v166 - 7) = v87;
          v92 = v177;
          *(&v166 - 6) = v88;
          *(&v166 - 5) = v92;
          *(&v166 - 4) = (uint64_t)v178;
          *(&v166 - 3) = v82;
          v165 = v179;
          v93 = objc_allocWithZone((Class)sub_1C2FC90A8());
          OUTLINED_FUNCTION_69_0();
          v94 = (void *)sub_1C2FC9048();
          if (v94)
          {
            v180 = v94;
            MEMORY[0x1E0C80A78](v94);
            OUTLINED_FUNCTION_193();
            v95 = objc_allocWithZone((Class)sub_1C2FC8C70());
            OUTLINED_FUNCTION_69_0();
            v96 = (void *)sub_1C2FC8C10();
            v178 = v96;
            if (v96)
            {
              MEMORY[0x1E0C80A78](v96);
              OUTLINED_FUNCTION_193();
              v97 = objc_allocWithZone((Class)sub_1C2FC8B14());
              v98 = OUTLINED_FUNCTION_329();
              if (v98)
              {
                v99 = (uint8_t *)v98;
                v100 = v186;
                sub_1C2F9D5D0(v181);
                sub_1C2F9D5D0(v180);
                sub_1C2F9D5D0(v178);
                v190 = v99;
                sub_1C2F9D5D0(v99);
                v101 = *(_QWORD *)(v100 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger);
                v102 = v167;
                if ((*(_BYTE *)(v101 + 32) & 1) != 0 || (OUTLINED_FUNCTION_169(), v60))
                {
                  v189 = *(uint8_t **)(v101 + 16);
                  v103 = v169;
                  OUTLINED_FUNCTION_345(v169);
                  v104 = (*(unsigned __int8 *)(v56 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80);
                  v105 = (v168 + v104 + 7) & 0xFFFFFFFFFFFFFFF8;
                  v106 = swift_allocObject();
                  *(_QWORD *)(v106 + 16) = v101;
                  OUTLINED_FUNCTION_232(v106 + v104, v103, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v56 + 32));
                  v107 = (_QWORD *)(v106 + v105);
                  *v107 = v187;
                  v107[1] = v88;
                  v192[4] = (uint64_t)sub_1C2FBF664;
                  v192[5] = v106;
                  v192[0] = MEMORY[0x1E0C809B0];
                  v192[1] = 1107296256;
                  v108 = OUTLINED_FUNCTION_175((uint64_t)sub_1C2FA8FF0);
                  OUTLINED_FUNCTION_12_0();
                  OUTLINED_FUNCTION_71();
                  v109 = v170;
                  sub_1C2FC9924();
                  v193 = MEMORY[0x1E0DEE9D8];
                  sub_1C2FBFF94(qword_1ED7AEEF0, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
                  OUTLINED_FUNCTION_141();
                  OUTLINED_FUNCTION_132(&qword_1ED7AEF20);
                  OUTLINED_FUNCTION_366();
                  v110 = v173;
                  v111 = v175;
                  sub_1C2FC9BDC();
                  v101 = (uint64_t)v189;
                  MEMORY[0x1C3BD0204](0, v109, v110, v108);
                  _Block_release(v108);
                  v112 = OUTLINED_FUNCTION_188();
                  v113(v112, v111);
                  OUTLINED_FUNCTION_44_0();
                  OUTLINED_FUNCTION_36_0(v109, v114);
                  OUTLINED_FUNCTION_304();
                }
                v115 = v186;
                v189 = *(uint8_t **)(v186 + OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil);
                OUTLINED_FUNCTION_360();
                OUTLINED_FUNCTION_345(v101);
                OUTLINED_FUNCTION_49_1();
                __swift_storeEnumTagSinglePayload(v116, v117, v118, v102);
                v119 = AFDeviceSupportsSiriUOD();
                v120 = OUTLINED_FUNCTION_342(v119, (uint64_t)&a17);
                v121 = (_QWORD *)(v115 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils);
                OUTLINED_FUNCTION_140((_QWORD *)(v115 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils), *(_QWORD *)(v115 + OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils + 24));
                OUTLINED_FUNCTION_91();
                OUTLINED_FUNCTION_277();
                sub_1C2FC987C();
                OUTLINED_FUNCTION_121();
                OUTLINED_FUNCTION_140(v121, v121[3]);
                OUTLINED_FUNCTION_91();
                OUTLINED_FUNCTION_217();
                sub_1C2FC987C();
                OUTLINED_FUNCTION_121();
                LOBYTE(v165) = 0;
                OUTLINED_FUNCTION_204((uint64_t)&a13);
                OUTLINED_FUNCTION_217();
                sub_1C2FA42C8(v122, v123, v124, 2, v179, v120, v125, v126, v165);
                OUTLINED_FUNCTION_90();
                OUTLINED_FUNCTION_231();
                OUTLINED_FUNCTION_131();
                OUTLINED_FUNCTION_151((uint64_t)&a16);

                OUTLINED_FUNCTION_362(v127, &qword_1ED7AE750);
                OUTLINED_FUNCTION_36_0(v185, *(uint64_t (**)(uint64_t, _QWORD))(v184 + 8));
                OUTLINED_FUNCTION_237();
                v129 = v188;
                v130 = v167;
                goto LABEL_53;
              }
              v58 = v167;
              if (qword_1ED7AEDB0 != -1)
                swift_once();
              v156 = OUTLINED_FUNCTION_7();
              __swift_project_value_buffer(v156, (uint64_t)qword_1ED7AF5F0);
              OUTLINED_FUNCTION_20_2();
              sub_1C2FC98E8();
              v157 = OUTLINED_FUNCTION_26();
              v158 = OUTLINED_FUNCTION_14_4(v157);
              v82 = v185;
              if (v158)
              {
                OUTLINED_FUNCTION_1();
                v159 = OUTLINED_FUNCTION_1();
                OUTLINED_FUNCTION_230(v159);
                OUTLINED_FUNCTION_59_1(4.8149e-34);
                v161 = OUTLINED_FUNCTION_87(v87, v160, v192);
                OUTLINED_FUNCTION_51_1(v161);
                OUTLINED_FUNCTION_26_3();
                OUTLINED_FUNCTION_21_3(&dword_1C2F94000, v162, v163, "Failed to create ResultSelectedMessage for request Id: %s");
                OUTLINED_FUNCTION_12();
                OUTLINED_FUNCTION_0();
              }

              OUTLINED_FUNCTION_46();
              OUTLINED_FUNCTION_90();
              OUTLINED_FUNCTION_231();
              OUTLINED_FUNCTION_131();
              v164 = &a16;
            }
            else
            {
              if (qword_1ED7AEDB0 != -1)
                swift_once();
              v147 = OUTLINED_FUNCTION_7();
              __swift_project_value_buffer(v147, (uint64_t)qword_1ED7AF5F0);
              OUTLINED_FUNCTION_20_2();
              sub_1C2FC98E8();
              v148 = OUTLINED_FUNCTION_26();
              v149 = OUTLINED_FUNCTION_14_4(v148);
              v58 = v167;
              v82 = v185;
              if (v149)
              {
                OUTLINED_FUNCTION_1();
                v150 = OUTLINED_FUNCTION_1();
                OUTLINED_FUNCTION_230(v150);
                OUTLINED_FUNCTION_59_1(4.8149e-34);
                v152 = OUTLINED_FUNCTION_87(v87, v151, v192);
                OUTLINED_FUNCTION_51_1(v152);
                OUTLINED_FUNCTION_26_3();
                OUTLINED_FUNCTION_21_3(&dword_1C2F94000, v153, v154, "Failed to create ExecuteNLOnServerMessage for request Id: %s");
                OUTLINED_FUNCTION_12();
                OUTLINED_FUNCTION_0();
              }

              OUTLINED_FUNCTION_46();
              OUTLINED_FUNCTION_90();
              OUTLINED_FUNCTION_231();
              v164 = &a18;
            }
            v155 = (void *)*(v164 - 32);
          }
          else
          {
            if (qword_1ED7AEDB0 != -1)
              swift_once();
            v139 = OUTLINED_FUNCTION_7();
            __swift_project_value_buffer(v139, (uint64_t)qword_1ED7AF5F0);
            OUTLINED_FUNCTION_20_2();
            sub_1C2FC98E8();
            v140 = OUTLINED_FUNCTION_26();
            v141 = OUTLINED_FUNCTION_14_4(v140);
            v58 = v167;
            v82 = v185;
            if (v141)
            {
              OUTLINED_FUNCTION_1();
              v142 = OUTLINED_FUNCTION_1();
              OUTLINED_FUNCTION_230(v142);
              OUTLINED_FUNCTION_59_1(4.8149e-34);
              v144 = OUTLINED_FUNCTION_87(v87, v143, v192);
              OUTLINED_FUNCTION_51_1(v144);
              OUTLINED_FUNCTION_26_3();
              OUTLINED_FUNCTION_21_3(&dword_1C2F94000, v145, v146, "Failed to create TextBasedResultCandidateMessage for request Id: %s");
              OUTLINED_FUNCTION_12();
              OUTLINED_FUNCTION_0();
            }

            OUTLINED_FUNCTION_46();
            OUTLINED_FUNCTION_90();
            v155 = v181;
          }

        }
        else
        {
          if (qword_1ED7AEDB0 != -1)
            swift_once();
          v131 = OUTLINED_FUNCTION_7();
          __swift_project_value_buffer(v131, (uint64_t)qword_1ED7AF5F0);
          OUTLINED_FUNCTION_20_2();
          sub_1C2FC98E8();
          v132 = OUTLINED_FUNCTION_26();
          v133 = OUTLINED_FUNCTION_14_4(v132);
          v58 = v167;
          if (v133)
          {
            OUTLINED_FUNCTION_1();
            v134 = OUTLINED_FUNCTION_1();
            OUTLINED_FUNCTION_230(v134);
            OUTLINED_FUNCTION_59_1(4.8149e-34);
            v136 = OUTLINED_FUNCTION_87(v87, v135, v192);
            OUTLINED_FUNCTION_51_1(v136);
            OUTLINED_FUNCTION_26_3();
            OUTLINED_FUNCTION_21_3(&dword_1C2F94000, v137, v138, "Failed to create StartRemoteServerTextRequestMessage for request Id: %s");
            OUTLINED_FUNCTION_12();
            OUTLINED_FUNCTION_0();
          }

          OUTLINED_FUNCTION_46();
          OUTLINED_FUNCTION_90();
        }
        OUTLINED_FUNCTION_36_0(v82, *(uint64_t (**)(uint64_t, _QWORD))(v184 + 8));
        OUTLINED_FUNCTION_237();
      }
      v129 = v57;
      v130 = v58;
LABEL_53:
      v128(v129, v130);
      goto LABEL_54;
    }
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v75 = OUTLINED_FUNCTION_7();
    v76 = OUTLINED_FUNCTION_38_0(v75, (uint64_t)qword_1ED7AF5F0);
    v77 = sub_1C2FC9B10();
    if (os_log_type_enabled(v76, v77))
    {
      v78 = (uint8_t *)OUTLINED_FUNCTION_1();
      v191 = OUTLINED_FUNCTION_1();
      v192[0] = v191;
      *(_DWORD *)v78 = 136315138;
      v189 = v78 + 4;
      v190 = v78;
      OUTLINED_FUNCTION_264();
      v79 = OUTLINED_FUNCTION_356();
      OUTLINED_FUNCTION_325();
      v81 = OUTLINED_FUNCTION_99(v79, v80, v192);
      OUTLINED_FUNCTION_235(v81);
      OUTLINED_FUNCTION_251();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v76, v77, "Current session is not of type %s, cannot start server text request request", v190);
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_90();
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v67 = OUTLINED_FUNCTION_7();
    v68 = __swift_project_value_buffer(v67, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v69 = OUTLINED_FUNCTION_43();
    v70 = OUTLINED_FUNCTION_6_2(v69);
    v71 = (uint64_t)v189;
    if (v70)
    {
      v72 = OUTLINED_FUNCTION_1();
      v192[0] = OUTLINED_FUNCTION_1();
      *(_DWORD *)v72 = 136315394;
      OUTLINED_FUNCTION_147();
      v194[0] = OUTLINED_FUNCTION_165(v71, v73, v192);
      OUTLINED_FUNCTION_228();
      OUTLINED_FUNCTION_26_3();
      *(_WORD *)(v72 + 12) = 2080;
      OUTLINED_FUNCTION_83();
      v194[0] = OUTLINED_FUNCTION_110(v187, v74, v192);
      OUTLINED_FUNCTION_228();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_39(&dword_1C2F94000, v68, (os_log_type_t)v52, "No active session for assistantId: %s cannot start remote server text request for request id: %s", (uint8_t *)v72);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_46();
  }
LABEL_54:
  OUTLINED_FUNCTION_27();
}

void sub_1C2FB57C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
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
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  OUTLINED_FUNCTION_30_1();
  v4 = v3;
  v17 = v5;
  v16 = v6;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF410);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_34_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_77();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_157();
  v10 = *MEMORY[0x1E0D9E640];
  v11 = OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_351(v0, v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104));
  OUTLINED_FUNCTION_60_0(v0);
  sub_1C2FC8A90();
  OUTLINED_FUNCTION_71();
  sub_1C2FC8A6C();
  v12 = OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_358(v1, v16, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16));
  OUTLINED_FUNCTION_295(v1);
  sub_1C2FC8AA8();
  OUTLINED_FUNCTION_152();
  sub_1C2FC8A9C();
  v13 = OUTLINED_FUNCTION_370();
  OUTLINED_FUNCTION_358(v2, v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16));
  OUTLINED_FUNCTION_295(v2);
  sub_1C2FC8A78();
  if (v4)
  {
    v14 = objc_allocWithZone((Class)OUTLINED_FUNCTION_298());
    v15 = v4;
    sub_1C2FC9678();
    sub_1C2FC8A84();
  }
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB5950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[3];
  uint64_t v24;

  v23[1] = a5;
  v23[2] = a7;
  v23[0] = a4;
  v24 = a9;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF490);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *MEMORY[0x1E0D9E640];
  v19 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v17, v18, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
  sub_1C2FC906C();
  swift_bridgeObjectRetain();
  sub_1C2FC9060();
  v20 = sub_1C2FC8A0C();
  (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v14, v23[0], v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v20);
  sub_1C2FC9090();
  swift_bridgeObjectRetain();
  sub_1C2FC9084();
  if (qword_1ED7AEFC8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1C2FC9054();
  swift_bridgeObjectRetain();
  sub_1C2FC909C();
  v21 = sub_1C2FC9798();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v11, v24, v21);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v21);
  return sub_1C2FC9078();
}

uint64_t sub_1C2FB5BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
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
  _QWORD v21[2];

  v21[1] = a5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF420);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *MEMORY[0x1E0D9E640];
  v16 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v16);
  sub_1C2FC8C4C();
  swift_bridgeObjectRetain();
  sub_1C2FC8C1C();
  v17 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v11, a4, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v17);
  sub_1C2FC8C64();
  swift_bridgeObjectRetain();
  sub_1C2FC8C58();
  if (qword_1ED7AEFC8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1C2FC8C34();
  sub_1C2FC8C40();
  v18 = *MEMORY[0x1E0D9ED50];
  v19 = sub_1C2FC96B4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v8, v18, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v19);
  return sub_1C2FC8C28();
}

uint64_t sub_1C2FB5E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *MEMORY[0x1E0D9E640];
  v12 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v10, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  sub_1C2FC8B50();
  swift_bridgeObjectRetain();
  sub_1C2FC8B20();
  v13 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v7, a4, v13);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v13);
  sub_1C2FC8B68();
  swift_bridgeObjectRetain();
  sub_1C2FC8B5C();
  if (qword_1ED7AEFC8 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_1C2FC8B44();
  return sub_1C2FC8B2C();
}

void sub_1C2FB5FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  char v20;
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
  _QWORD *v39;
  uint64_t v40;
  _QWORD v41[10];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)();
  uint64_t v47;

  OUTLINED_FUNCTION_30_1();
  a19 = v24;
  a20 = v25;
  v41[2] = OUTLINED_FUNCTION_60_1(v26, v27, v28, v29, v30, v31, v32);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_100();
  MEMORY[0x1E0C80A78](v33);
  OUTLINED_FUNCTION_52_1((uint64_t)v41 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v34);
  OUTLINED_FUNCTION_78();
  MEMORY[0x1E0C80A78](v35);
  OUTLINED_FUNCTION_52_1((uint64_t)v41 - v36);
  MEMORY[0x1E0C80A78](v37);
  OUTLINED_FUNCTION_64_1();
  OUTLINED_FUNCTION_54_1();
  OUTLINED_FUNCTION_53_1();
  v42 = v21;
  OUTLINED_FUNCTION_34_2();
  OUTLINED_FUNCTION_200();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_57_1(*(_QWORD *)(v22 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  OUTLINED_FUNCTION_72_0((uint64_t)&a16);
  OUTLINED_FUNCTION_22_3();
  v38 = swift_allocObject();
  OUTLINED_FUNCTION_27_2(v38);
  OUTLINED_FUNCTION_41_2((uint64_t)&type metadata for Logger + v22, v21);
  OUTLINED_FUNCTION_35_3((unint64_t *)(v22 + v23));
  OUTLINED_FUNCTION_285(v39);
  v40 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v40 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v40 + 24) = v22;
  v46 = sub_1C2FC0008;
  v47 = v40;
  v44 = MEMORY[0x1E0C809B0];
  v45 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_32_3();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v41[8]);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v43);
  OUTLINED_FUNCTION_12_3(v42);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v20 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB61CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char v20;
  uint64_t v21;
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

  v27 = a5;
  v28 = a8;
  v25 = a9;
  v26 = a4;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF490);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1C2FC95F4();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v25 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2FAD884();
  v20 = *(_BYTE *)(a1 + OBJC_IVAR___SRDRequestDispatcherInternal_isMUXEnabled);
  v21 = sub_1C2FC9798();
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v21);
  LOBYTE(v23) = v20;
  sub_1C2FB6414(a2, a3, v26, v27, (uint64_t)v19, v28, v25, a10, v23, (uint64_t)v15, 0, v24, v25, v26, v27, v28, v29, v30, v31,
    v32,
    v33);
  sub_1C2F9BD60((uint64_t)v15, &qword_1ED7AF490);
  return (*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t sub_1C2FB6330(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, void (*a8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))
{
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
  id v21;
  id v22;
  uint64_t v24;

  v24 = OUTLINED_FUNCTION_206();
  v11 = v10;
  v12 = sub_1C2FC99F0();
  v14 = v13;
  v15 = sub_1C2FC99F0();
  v17 = v16;
  v18 = sub_1C2FC99F0();
  v20 = v19;
  v21 = a7;
  v22 = a1;
  a8(v24, v11, v12, v14, v15, v17, v18, v20, v21);

  OUTLINED_FUNCTION_247();
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_121();
  return swift_bridgeObjectRelease();
}

void sub_1C2FB6414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
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
  char *v55;
  uint64_t v56;
  os_log_type_t v57;
  _BOOL4 v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  NSObject *v64;
  uint64_t v65;
  os_log_type_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  char v70;
  os_log_type_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  id v76;
  id v77;
  id v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  _DWORD *v86;
  _DWORD *v87;
  uint64_t v88;
  _DWORD *v89;
  void (*v90)(uint64_t);
  NSObject *v91;
  os_log_type_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
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
  char v110;
  char v111;
  void (*v112)(uint64_t, NSObject *);
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char v123;
  uint64_t v124;
  char *v125;
  uint64_t v126;
  char *v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  const void *v131;
  uint64_t v132;
  uint64_t (*v133)(uint64_t, uint64_t);
  uint64_t v134;
  uint64_t (*v135)(uint64_t, _QWORD);
  void (*v136)(uint64_t, NSObject *);
  uint64_t v137;
  uint64_t v138;
  void (*v139)(char *, uint64_t, uint64_t);
  uint64_t v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  NSObject *v158;
  uint64_t v159;
  NSObject *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164[4];
  uint64_t (*v165)();
  char *v166;
  uint64_t v167;
  uint64_t v168;

  OUTLINED_FUNCTION_30_1();
  a19 = v24;
  a20 = v25;
  v160 = v21;
  v151 = v26;
  v147 = v27;
  v146 = v28;
  v152 = v29;
  v162 = v30;
  v163 = v31;
  v33 = v32;
  v35 = v34;
  v143 = OUTLINED_FUNCTION_138();
  v142 = *(_QWORD *)(v143 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v36);
  v141 = (char *)&v138 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_196(v38, (uint64_t)&v168);
  v140 = v39;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v40);
  OUTLINED_FUNCTION_1_0();
  v42 = OUTLINED_FUNCTION_284(v41);
  OUTLINED_FUNCTION_196(v42, (uint64_t)&a16);
  OUTLINED_FUNCTION_331(v43);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v44);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_85(v45);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF490);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v46);
  OUTLINED_FUNCTION_34_1();
  v47 = OUTLINED_FUNCTION_10_1();
  v154 = *(_QWORD *)(v47 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v48);
  v156 = (uint64_t)&v138 - ((v49 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = OUTLINED_FUNCTION_59();
  v51 = *(_QWORD *)(v50 - 8);
  MEMORY[0x1E0C80A78](v50);
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_85(v52);
  OUTLINED_FUNCTION_219((uint64_t)&v166);
  MEMORY[0x1E0C80A78](v53);
  v55 = (char *)&v138 - v54;
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v56 = OUTLINED_FUNCTION_7();
  v153 = __swift_project_value_buffer(v56, (uint64_t)qword_1ED7AF5F0);
  OUTLINED_FUNCTION_44();
  v57 = OUTLINED_FUNCTION_198();
  v58 = OUTLINED_FUNCTION_6_2(v57);
  v158 = v47;
  v159 = v33;
  if (v58)
  {
    v59 = (uint8_t *)OUTLINED_FUNCTION_1();
    v60 = OUTLINED_FUNCTION_1();
    v144 = v51;
    v157 = v55;
    v164[0] = v60;
    *(_DWORD *)v59 = 136315138;
    OUTLINED_FUNCTION_270();
    v63 = OUTLINED_FUNCTION_357(142, v61, v62);
    OUTLINED_FUNCTION_177(v63);
    sub_1C2FC9BA0();
    OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v21, v22, "%s", v59);
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_0();
  }

  v64 = v160;
  v155 = v35;
  sub_1C2FBD220();
  v161 = v65;
  if (v65)
  {
    v139 = *(void (**)(char *, uint64_t, uint64_t))(v51 + 16);
    v139(v55, v161 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId, v50);
    v66 = v64;
    OUTLINED_FUNCTION_5_0();
    v67 = OUTLINED_FUNCTION_292();
    sub_1C2FA8A8C(v67, v68);
    v69 = v158;
    OUTLINED_FUNCTION_350(v23, 1, (uint64_t)v158);
    if (!v70)
    {
      OUTLINED_FUNCTION_45(v156, v23, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v154 + 32));
      __swift_project_boxed_opaque_existential_1((Class *)((char *)&v64->isa + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker), *(uint64_t *)((char *)&v64[3].isa + OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker));
      v75 = sub_1C2FC9810();
      v76 = objc_allocWithZone((Class)OUTLINED_FUNCTION_298());
      OUTLINED_FUNCTION_272();
      v78 = v77;
      v79 = (void *)sub_1C2FC9678();
      if ((v75 & 1) != 0)
      {
        v80 = v149;
        v81 = v148;
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v149 + 104))(v148, *MEMORY[0x1E0D9EB38], v150);
        OUTLINED_FUNCTION_353();
        sub_1C2FA600C();
        v83 = v82;
        OUTLINED_FUNCTION_194(v81, *(uint64_t (**)(uint64_t, uint64_t))(v80 + 8));
        if ((v83 & 1) != 0)
        {
          v151 = v79;
          v157 = v55;
          v84 = v145;
          OUTLINED_FUNCTION_309();
          v85 = sub_1C2FC89E8();
          v87 = v86;
          v88 = v50;
          v89 = v87;
          v90 = *(void (**)(uint64_t))(v51 + 8);
          v152 = v88;
          v90(v84);
          OUTLINED_FUNCTION_20_2();
          OUTLINED_FUNCTION_20_2();
          v91 = v153;
          sub_1C2FC98E8();
          v92 = OUTLINED_FUNCTION_198();
          if (OUTLINED_FUNCTION_21(v92))
          {
            v93 = OUTLINED_FUNCTION_1();
            v144 = v51;
            v94 = v85;
            v95 = v93;
            v164[0] = OUTLINED_FUNCTION_1();
            v153 = (uint64_t)v90;
            *(_DWORD *)v95 = 136315394;
            OUTLINED_FUNCTION_91();
            v97 = OUTLINED_FUNCTION_127(v94, v96, v164);
            OUTLINED_FUNCTION_238(v97);
            OUTLINED_FUNCTION_24_0();
            OUTLINED_FUNCTION_26_3();
            *(_WORD *)(v95 + 12) = 2080;
            OUTLINED_FUNCTION_24();
            v167 = OUTLINED_FUNCTION_99(v159, v98, v164);
            OUTLINED_FUNCTION_24_0();
            OUTLINED_FUNCTION_26_3();
            OUTLINED_FUNCTION_39(&dword_1C2F94000, v91, v66, "minting synthesized trpId : %s for text request: %s", (uint8_t *)v95);
            OUTLINED_FUNCTION_38();
            OUTLINED_FUNCTION_0();
          }

          OUTLINED_FUNCTION_46();
          OUTLINED_FUNCTION_46();
          v23 = v159;
          v114 = v156;
          v115 = (uint64_t)v157;
          v64 = v160;
          sub_1C2FA6AA4(v155, v162, (uint64_t)v157, v159, v163, v156, v146, v147, v85, (uint64_t)v89);
          if ((v116 & 1) == 0)
          {
            OUTLINED_FUNCTION_151((uint64_t)&a17);
            OUTLINED_FUNCTION_121();
            OUTLINED_FUNCTION_148();
            OUTLINED_FUNCTION_237();
            v136(v114, v158);
            v120 = v115;
            goto LABEL_34;
          }
          v117 = OUTLINED_FUNCTION_296();
          sub_1C2FA6E98(v117, v118, v115, v23, v163, v85, v89);
          v101 = v119;
          OUTLINED_FUNCTION_121();
          OUTLINED_FUNCTION_151((uint64_t)&a17);
          v55 = (char *)v115;
          if ((v101 & 1) == 0)
          {
            OUTLINED_FUNCTION_148();
            OUTLINED_FUNCTION_128();
            v120 = v115;
LABEL_34:
            ((void (*)(uint64_t, uint64_t))v90)(v120, v152);
            goto LABEL_23;
          }
          goto LABEL_29;
        }

        goto LABEL_21;
      }
      v99 = v162;
      OUTLINED_FUNCTION_217();
      OUTLINED_FUNCTION_353();
      sub_1C2FA5E60();
      v101 = v100;

      if ((v101 & 1) != 0)
      {
        if ((a21 & 1) == 0)
        {
          OUTLINED_FUNCTION_117();
          v121 = v99;
          v122 = v156;
          sub_1C2FA6A70();
          if ((v123 & 1) == 0)
          {
            OUTLINED_FUNCTION_148();
            OUTLINED_FUNCTION_237();
            v113 = v122;
            goto LABEL_22;
          }
          v152 = v50;
          if (!sub_1C2FA6E54(v23, v121, (uint64_t)v55, v101, v163))
          {
LABEL_36:
            OUTLINED_FUNCTION_148();
            OUTLINED_FUNCTION_128();
            (*(void (**)(char *, uint64_t))(v51 + 8))(v55, v152);
            goto LABEL_23;
          }
LABEL_29:
          if (((*(_BYTE **)((char *)&v64->isa + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger))[32] & 1) != 0
            || (OUTLINED_FUNCTION_169(), v70))
          {
            OUTLINED_FUNCTION_204((uint64_t)&a11);
            v137 = v152;
            OUTLINED_FUNCTION_216((uint64_t)&v165);
            OUTLINED_FUNCTION_149();
            OUTLINED_FUNCTION_94();
            v124 = swift_allocObject();
            v125 = v55;
            v126 = OUTLINED_FUNCTION_199(v124);
            OUTLINED_FUNCTION_45_0(v126, v101, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 32));
            v127 = &v55[v23];
            v128 = v163;
            *(_QWORD *)v127 = v159;
            *((_QWORD *)v127 + 1) = v128;
            v165 = sub_1C2FBF664;
            v166 = v55;
            v164[0] = MEMORY[0x1E0C809B0];
            v164[1] = 1107296256;
            v129 = OUTLINED_FUNCTION_175((uint64_t)sub_1C2FA8FF0);
            OUTLINED_FUNCTION_11_0();
            OUTLINED_FUNCTION_12_0();
            OUTLINED_FUNCTION_308();
            v167 = MEMORY[0x1E0DEE9D8];
            sub_1C2FBFF94(qword_1ED7AEEF0, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
            OUTLINED_FUNCTION_141();
            OUTLINED_FUNCTION_132(&qword_1ED7AEF20);
            OUTLINED_FUNCTION_366();
            OUTLINED_FUNCTION_133();
            v130 = OUTLINED_FUNCTION_368();
            MEMORY[0x1C3BD0204](v130);
            v131 = v129;
            v55 = v125;
            _Block_release(v131);
            v132 = OUTLINED_FUNCTION_188();
            OUTLINED_FUNCTION_194(v132, v133);
            v134 = OUTLINED_FUNCTION_150();
            OUTLINED_FUNCTION_36_0(v134, v135);
            OUTLINED_FUNCTION_148();
            OUTLINED_FUNCTION_124();
          }
          else
          {
            OUTLINED_FUNCTION_148();
            v137 = v152;
          }
          OUTLINED_FUNCTION_128();
          (*(void (**)(char *, uint64_t))(v51 + 8))(v55, v137);
          goto LABEL_23;
        }
        v102 = OUTLINED_FUNCTION_117();
        sub_1C2FA6468(v102, v103, v104, v105, v106, v107, v108, v109);
        if ((v110 & 1) != 0)
        {
          v152 = v50;
          OUTLINED_FUNCTION_217();
          sub_1C2FA6698();
          if ((v111 & 1) == 0)
            goto LABEL_36;
          goto LABEL_29;
        }
      }
LABEL_21:
      OUTLINED_FUNCTION_148();
      v112 = *(void (**)(uint64_t, NSObject *))(v154 + 8);
      v113 = v156;
LABEL_22:
      v112(v113, v158);
      (*(void (**)(char *, uint64_t))(v51 + 8))(v55, v50);
      goto LABEL_23;
    }
    v157 = v55;
    sub_1C2F9BD60(v23, &qword_1ED7AF490);
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v71 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_14_4(v71))
    {
      v72 = OUTLINED_FUNCTION_1();
      v164[0] = OUTLINED_FUNCTION_1();
      *(_DWORD *)v72 = 136315394;
      OUTLINED_FUNCTION_16_0();
      v167 = OUTLINED_FUNCTION_170(v155, v73, v164);
      sub_1C2FC9BA0();
      OUTLINED_FUNCTION_26_3();
      *(_WORD *)(v72 + 12) = 2080;
      OUTLINED_FUNCTION_83();
      v167 = OUTLINED_FUNCTION_110(v159, v74, v164);
      OUTLINED_FUNCTION_307();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_39(&dword_1C2F94000, v69, (os_log_type_t)v55, "sessionUserId is not set for assistantId: %s during request: %s", (uint8_t *)v72);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_148();

    (*(void (**)(char *, uint64_t))(v51 + 8))(v157, v50);
  }
LABEL_23:
  OUTLINED_FUNCTION_27();
}

void sub_1C2FB6E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
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
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD v50[4];
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)();
  uint64_t v73;
  uint64_t v74;

  OUTLINED_FUNCTION_30_1();
  a19 = v27;
  a20 = v28;
  v30 = v29;
  v55 = v31;
  v54 = v32;
  v53 = v33;
  v51 = v34;
  v50[2] = v35;
  OUTLINED_FUNCTION_341(v36, (uint64_t)&v74);
  v52 = a22;
  v50[3] = a21;
  v50[1] = OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_100();
  MEMORY[0x1E0C80A78](v37);
  OUTLINED_FUNCTION_52_1((uint64_t)v50 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v38);
  OUTLINED_FUNCTION_78();
  MEMORY[0x1E0C80A78](v39);
  OUTLINED_FUNCTION_52_1((uint64_t)v50 - v40);
  MEMORY[0x1E0C80A78](v41);
  OUTLINED_FUNCTION_64_1();
  OUTLINED_FUNCTION_54_1();
  v58 = v23;
  v59 = v26;
  OUTLINED_FUNCTION_253();
  v60 = v43;
  v61 = v42;
  v62 = v51;
  v63 = v53;
  v64 = v54;
  v65 = v55;
  OUTLINED_FUNCTION_256();
  v66 = v30;
  v67 = v44;
  OUTLINED_FUNCTION_207();
  v68 = v46;
  v69 = v45;
  v56 = v24;
  OUTLINED_FUNCTION_34_2();
  OUTLINED_FUNCTION_200();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_57_1(*(_QWORD *)(v23 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  OUTLINED_FUNCTION_72_0((uint64_t)&a16);
  OUTLINED_FUNCTION_22_3();
  v47 = swift_allocObject();
  OUTLINED_FUNCTION_27_2(v47);
  OUTLINED_FUNCTION_41_2((uint64_t)&type metadata for Logger + v23, v24);
  OUTLINED_FUNCTION_35_3((unint64_t *)(v23 + v25));
  OUTLINED_FUNCTION_285(v48);
  v49 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v49 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v49 + 24) = v23;
  v72 = sub_1C2FC0008;
  v73 = v49;
  v70 = MEMORY[0x1E0C809B0];
  v71 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_32_3();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v55);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v57);
  OUTLINED_FUNCTION_12_3(v56);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v22 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB70D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
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
  void *v30;
  uint64_t v31;

  v22 = a5;
  v23 = a8;
  v20 = a9;
  v21 = a4;
  v14 = sub_1C2FC95F4();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2FAD884();
  LOBYTE(v19) = *(_BYTE *)(a1 + OBJC_IVAR___SRDRequestDispatcherInternal_isMUXEnabled);
  sub_1C2FB7304(a2, a3, v21, v22, (uint64_t)v17, v23, v20, a10, a11, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28,
    v29,
    v30,
    v31);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

void sub_1C2FB7304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,unsigned __int8 a22)
{
  NSObject *v22;
  uint64_t v23;
  os_log_type_t v24;
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
  char *v50;
  uint64_t v51;
  os_log_type_t v52;
  _BOOL4 v53;
  uint64_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  void (*v63)(void);
  id v64;
  id v65;
  void *v66;
  char v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  NSObject *v72;
  os_log_type_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t (*v114)(uint64_t, uint64_t);
  uint64_t v115;
  uint64_t (*v116)(uint64_t, _QWORD);
  void (*v117)(uint64_t, uint64_t);
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
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
  NSObject *v135;
  uint64_t v136;
  uint64_t v137[6];
  uint64_t v138;

  OUTLINED_FUNCTION_30_1();
  a19 = v25;
  a20 = v26;
  v134 = v27;
  v135 = v22;
  v127 = v28;
  v128 = v29;
  v126 = v30;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v125 = OUTLINED_FUNCTION_138();
  v124 = *(_QWORD *)(v125 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v37);
  v123 = (char *)&v118 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_196(v39, (uint64_t)&a15);
  v122 = v40;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v41);
  OUTLINED_FUNCTION_85((uint64_t)&v118 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF490);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v43);
  v132 = (uint64_t)&v118 - ((v44 + 15) & 0xFFFFFFFFFFFFFFF0);
  v133 = OUTLINED_FUNCTION_10_1();
  v131 = *(_QWORD *)(v133 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v45);
  OUTLINED_FUNCTION_55_0();
  v136 = OUTLINED_FUNCTION_59();
  v46 = *(_QWORD *)(v136 - 8);
  MEMORY[0x1E0C80A78](v136);
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_85(v47);
  OUTLINED_FUNCTION_219((uint64_t)&a11);
  MEMORY[0x1E0C80A78](v48);
  v50 = (char *)&v118 - v49;
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v51 = OUTLINED_FUNCTION_7();
  v129 = __swift_project_value_buffer(v51, (uint64_t)qword_1ED7AF5F0);
  OUTLINED_FUNCTION_44();
  v52 = OUTLINED_FUNCTION_198();
  v53 = OUTLINED_FUNCTION_6_2(v52);
  v130 = v23;
  if (v53)
  {
    v54 = OUTLINED_FUNCTION_1();
    v119 = v46;
    v118 = v50;
    v55 = (uint8_t *)v54;
    v137[0] = OUTLINED_FUNCTION_1();
    *(_DWORD *)v55 = 136315138;
    OUTLINED_FUNCTION_270();
    v58 = OUTLINED_FUNCTION_357(135, v56, v57);
    OUTLINED_FUNCTION_177(v58);
    OUTLINED_FUNCTION_129();
    OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v22, v24, "%s", v55);
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_0();
  }

  v59 = v135;
  sub_1C2FBD220();
  if (v60)
  {
    v61 = v60;
    v62 = a21;
    OUTLINED_FUNCTION_332(*(_QWORD *)(v46 + 16));
    v63();
    v64 = objc_allocWithZone((Class)OUTLINED_FUNCTION_298());
    v65 = v62;
    v66 = (void *)sub_1C2FC9678();
    v119 = v36;
    OUTLINED_FUNCTION_258();
    sub_1C2FA71CC();
    v68 = v67;

    if ((v68 & 1) != 0)
    {
      v69 = (uint64_t)v59 + OBJC_IVAR___SRDRequestDispatcherInternal_sessionUserId;
      OUTLINED_FUNCTION_5_0();
      v70 = v132;
      sub_1C2FA8A8C(v69, v132);
      OUTLINED_FUNCTION_350(v70, 1, v133);
      if (v71)
      {
        v134 = v34;
        v135 = v61;
        sub_1C2F9BD60(v70, &qword_1ED7AF490);
        OUTLINED_FUNCTION_20_2();
        OUTLINED_FUNCTION_20_2();
        v72 = sub_1C2FC98E8();
        v73 = sub_1C2FC9B10();
        if (OUTLINED_FUNCTION_119(v72))
        {
          v74 = OUTLINED_FUNCTION_1();
          v137[0] = OUTLINED_FUNCTION_1();
          *(_DWORD *)v74 = 136315394;
          OUTLINED_FUNCTION_71();
          v76 = OUTLINED_FUNCTION_87(v119, v75, v137);
          OUTLINED_FUNCTION_238(v76);
          OUTLINED_FUNCTION_154();
          OUTLINED_FUNCTION_26_3();
          *(_WORD *)(v74 + 12) = 2080;
          OUTLINED_FUNCTION_11_0();
          v138 = OUTLINED_FUNCTION_160(v134, v77, v137);
          OUTLINED_FUNCTION_154();
          OUTLINED_FUNCTION_26_3();
          OUTLINED_FUNCTION_39(&dword_1C2F94000, v72, v73, "sessionUserId is not set for assistantId: %s during request: %s", (uint8_t *)v74);
          OUTLINED_FUNCTION_38();
          OUTLINED_FUNCTION_0();
        }
        OUTLINED_FUNCTION_46();
        OUTLINED_FUNCTION_46();
        swift_release();

        goto LABEL_24;
      }
      v78 = a22;
      v79 = v130;
      v80 = OUTLINED_FUNCTION_158();
      v81(v80);
      if ((v78 & 1) != 0)
      {
        v82 = OUTLINED_FUNCTION_130();
        sub_1C2FA754C(v82, v83, v84, v85, v86, v87, v88, v89);
        if ((v90 & 1) == 0 || (OUTLINED_FUNCTION_258(), !sub_1C2FA7D64(v91, v92, v93, v94, v95)))
        {
LABEL_23:
          OUTLINED_FUNCTION_124();
          OUTLINED_FUNCTION_337();
          v117(v79, v133);
LABEL_24:
          OUTLINED_FUNCTION_242();
          goto LABEL_25;
        }
      }
      else
      {
        OUTLINED_FUNCTION_130();
        sub_1C2FA7934();
        if ((v96 & 1) == 0)
          goto LABEL_23;
        OUTLINED_FUNCTION_258();
        if (!sub_1C2FA6E54(v97, v98, v99, v100, v101))
          goto LABEL_23;
      }
      v102 = *(_QWORD *)(v78 + OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger);
      if ((*(_BYTE *)(v102 + 32) & 1) != 0 || (OUTLINED_FUNCTION_169(), v71))
      {
        v135 = v61;
        v103 = v32;
        v134 = *(_QWORD *)(v102 + 16);
        v104 = v120;
        OUTLINED_FUNCTION_216((uint64_t)&a9);
        OUTLINED_FUNCTION_149();
        OUTLINED_FUNCTION_271();
        v106 = (v105 + v79 + 7) & 0xFFFFFFFFFFFFFFF8;
        v107 = swift_allocObject();
        v108 = OUTLINED_FUNCTION_199(v107);
        OUTLINED_FUNCTION_232(v108, v104, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v46 + 32));
        v109 = (uint64_t *)(v70 + v106);
        *v109 = v34;
        v109[1] = v103;
        v137[4] = (uint64_t)sub_1C2FBF664;
        v137[5] = v70;
        v137[0] = MEMORY[0x1E0C809B0];
        v137[1] = 1107296256;
        v110 = OUTLINED_FUNCTION_175((uint64_t)sub_1C2FA8FF0);
        OUTLINED_FUNCTION_12_0();
        OUTLINED_FUNCTION_11_0();
        v111 = v121;
        sub_1C2FC9924();
        v138 = MEMORY[0x1E0DEE9D8];
        sub_1C2FBFF94(qword_1ED7AEEF0, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
        OUTLINED_FUNCTION_141();
        OUTLINED_FUNCTION_132(&qword_1ED7AEF20);
        OUTLINED_FUNCTION_366();
        v112 = (uint64_t)v123;
        v113 = v130;
        sub_1C2FC9BDC();
        MEMORY[0x1C3BD0204](0, v111, v112, v110);
        _Block_release(v110);
        OUTLINED_FUNCTION_44_0();
        OUTLINED_FUNCTION_32_1(v112, v114);
        OUTLINED_FUNCTION_44_0();
        v115 = v111;
        v79 = v113;
        OUTLINED_FUNCTION_36_0(v115, v116);
        swift_release();
      }
      goto LABEL_23;
    }
    OUTLINED_FUNCTION_242();
    OUTLINED_FUNCTION_124();
  }
LABEL_25:
  OUTLINED_FUNCTION_27();
}

void sub_1C2FB79D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,__int128 a21,uint64_t a22)
{
  char v22;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (**v48)();
  uint64_t v49;
  _QWORD v50[2];
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  __int128 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[5];

  OUTLINED_FUNCTION_30_1();
  a19 = v27;
  a20 = v28;
  OUTLINED_FUNCTION_203(v29, v30, v31, v32, v33, v34, v35);
  v56 = v36;
  v54 = v37;
  v52 = v38;
  OUTLINED_FUNCTION_341(v39, (uint64_t)v72);
  OUTLINED_FUNCTION_333(a22);
  v53 = a21;
  v51 = OUTLINED_FUNCTION_161();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_100();
  MEMORY[0x1E0C80A78](v40);
  OUTLINED_FUNCTION_52_1((uint64_t)v50 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v41);
  OUTLINED_FUNCTION_78();
  MEMORY[0x1E0C80A78](v42);
  OUTLINED_FUNCTION_52_1((uint64_t)v50 - v43);
  MEMORY[0x1E0C80A78](v44);
  OUTLINED_FUNCTION_64_1();
  OUTLINED_FUNCTION_54_1();
  v61 = v24;
  v62 = v26;
  v63 = v50[1];
  v64 = v52;
  OUTLINED_FUNCTION_271();
  v65 = v46;
  v66 = v45;
  OUTLINED_FUNCTION_223();
  v67 = v53;
  v68 = v55;
  v69 = v51;
  v58 = v23;
  OUTLINED_FUNCTION_34_2();
  OUTLINED_FUNCTION_200();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_57_1(*(_QWORD *)(v24 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  OUTLINED_FUNCTION_72_0((uint64_t)&a14);
  OUTLINED_FUNCTION_22_3();
  v47 = swift_allocObject();
  OUTLINED_FUNCTION_27_2(v47);
  OUTLINED_FUNCTION_41_2((uint64_t)&type metadata for Logger + v24, v23);
  OUTLINED_FUNCTION_35_3((unint64_t *)(v24 + v25));
  *v48 = sub_1C2FBEDCC;
  v48[1] = (void (*)())&v60;
  v49 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v49 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v49 + 24) = v24;
  v72[1] = sub_1C2FC0008;
  v72[2] = v49;
  v70 = MEMORY[0x1E0C809B0];
  v71 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_32_3();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v57);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v59);
  OUTLINED_FUNCTION_12_3(v58);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v22 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB7C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
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
  void *v30;

  v23 = a1;
  v24 = a8;
  v21 = a4;
  v22 = a5;
  v20 = a9;
  v14 = sub_1C2FC95F4();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2FAD884();
  sub_1C2FB7E5C(a2, a3, v21, v22, (uint64_t)v17, v24, v20, a10, a11, a12, v19, v20, v21, v22, v23, v24, v25, v26, v27,
    v28,
    v29,
    v30);
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
}

void sub_1C2FB7E5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22)
{
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  os_log_type_t v26;
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
  NSObject *v55;
  Class v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  os_log_type_t v64;
  _BOOL4 v65;
  uint8_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t);
  void (*v79)(uint64_t, uint64_t, NSObject *);
  uint64_t v80;
  NSObject *v81;
  uint8_t *v82;
  uint8_t *v83;
  uint64_t v84;
  NSObject *v85;
  char v86;
  os_log_type_t v87;
  uint8_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  os_log_type_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  os_log_type_t v97;
  uint8_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  char v105;
  id v106;
  id v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  void (*v112)(uint64_t, NSObject *);
  uint64_t v113;
  void (*v114)(uint64_t, NSObject *);
  NSObject *v115;
  uint64_t v116;
  char v117;
  char v118;
  uint64_t v119;
  char v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  BOOL v126;
  uint64_t v127;
  uint64_t (*v128)(uint64_t, _QWORD);
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  char v135;
  char v136;
  NSObject *v137;
  uint64_t v138;
  _DWORD *v139;
  _DWORD *v140;
  void (*v141)(uint64_t, NSObject *);
  os_log_type_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t (*v149)(uint64_t, _QWORD);
  uint8_t *v150;
  char v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char v158;
  char v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  _QWORD *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t (*v166)(uint64_t, uint64_t);
  uint64_t v167;
  uint64_t (*v168)(uint64_t, _QWORD);
  uint64_t v169;
  Class v170;
  uint64_t v171;
  _QWORD v172[2];
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  NSObject *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void (*v187)(uint64_t, NSObject *);
  Class isa;
  uint64_t v189;
  uint64_t v190;
  NSObject *v191;
  uint64_t v192;
  uint64_t v193;
  NSObject *v194;
  Class v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint8_t *v199;
  uint64_t v200;
  uint64_t v201[3];
  _QWORD v202[3];
  uint64_t v203;
  uint64_t v204[4];

  OUTLINED_FUNCTION_30_1();
  a19 = v24;
  a20 = v25;
  v26 = v22;
  OUTLINED_FUNCTION_252(v27, v28, v29, (uint64_t)&a16);
  v186 = v30;
  v196 = v31;
  v200 = v32;
  v34 = v33;
  v36 = v35;
  v37 = OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_196(v37, (uint64_t)&v203);
  v176 = v38;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v39);
  OUTLINED_FUNCTION_1_0();
  v175 = v40;
  v41 = OUTLINED_FUNCTION_33_0();
  OUTLINED_FUNCTION_196(v41, (uint64_t)v202);
  v174 = v42;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v43);
  OUTLINED_FUNCTION_1_0();
  v180 = OUTLINED_FUNCTION_284(v44);
  v179 = *(_QWORD *)(v180 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v45);
  OUTLINED_FUNCTION_85((uint64_t)v172 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF7DBC08);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v47);
  OUTLINED_FUNCTION_122((uint64_t)v172 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0));
  v185 = sub_1C2FC9618();
  v182 = *(_QWORD *)(v185 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v49);
  OUTLINED_FUNCTION_85((uint64_t)v172 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF490);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v51);
  OUTLINED_FUNCTION_122((uint64_t)v172 - ((v52 + 15) & 0xFFFFFFFFFFFFFFF0));
  v194 = sub_1C2FC9798();
  isa = v194[-1].isa;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v53);
  v190 = (uint64_t)v172 - ((v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = OUTLINED_FUNCTION_59();
  v56 = v55[-1].isa;
  MEMORY[0x1E0C80A78](v55);
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_85(v57);
  OUTLINED_FUNCTION_219((uint64_t)v201);
  MEMORY[0x1E0C80A78](v58);
  v193 = (uint64_t)v172 - v59;
  v197 = OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_282();
  MEMORY[0x1E0C80A78](v60);
  v62 = (char *)v172 - ((v61 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v63 = OUTLINED_FUNCTION_7();
  v198 = __swift_project_value_buffer(v63, (uint64_t)qword_1ED7AF5F0);
  OUTLINED_FUNCTION_44();
  v64 = OUTLINED_FUNCTION_198();
  v65 = OUTLINED_FUNCTION_119(v22);
  v191 = v55;
  v199 = (uint8_t *)v22;
  if (v65)
  {
    v66 = (uint8_t *)OUTLINED_FUNCTION_1();
    v67 = OUTLINED_FUNCTION_1();
    v195 = v56;
    v201[0] = v67;
    *(_DWORD *)v66 = 136315138;
    OUTLINED_FUNCTION_270();
    v70 = OUTLINED_FUNCTION_357(114, v68, v69);
    OUTLINED_FUNCTION_177(v70);
    sub_1C2FC9BA0();
    OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v22, v64, "%s", v66);
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_0();
  }

  v71 = v200;
  v192 = v36;
  sub_1C2FC231C();
  if (!v72)
  {
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_305();
    v92 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_14_4(v92))
    {
      v93 = OUTLINED_FUNCTION_1();
      v94 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_230(v94);
      *(_DWORD *)v93 = 136315394;
      OUTLINED_FUNCTION_83();
      v204[0] = OUTLINED_FUNCTION_110(v192, v95, v201);
      OUTLINED_FUNCTION_65_1();
      OUTLINED_FUNCTION_26_3();
      *(_WORD *)(v93 + 12) = 2080;
      OUTLINED_FUNCTION_147();
      v204[0] = OUTLINED_FUNCTION_165(v71, v96, v201);
      OUTLINED_FUNCTION_65_1();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_39(&dword_1C2F94000, v55, v26, "No active session for assistantId: %s cannot start correction speech request for request id: %s", (uint8_t *)v93);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_46();
    goto LABEL_46;
  }
  v73 = v72;
  v173 = v34;
  v74 = *MEMORY[0x1E0D9EE68];
  v75 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 104);
  v76 = v197;
  v75(v62, v74, v197);
  v77 = sub_1C2FC15BC();
  v78 = *(void (**)(char *, uint64_t))(v23 + 8);
  v78(v62, v76);
  if ((v77 & 1) == 0)
  {
    OUTLINED_FUNCTION_305();
    v97 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_88(v77))
    {
      v98 = (uint8_t *)OUTLINED_FUNCTION_1();
      v200 = OUTLINED_FUNCTION_1();
      v201[0] = v200;
      v199 = v98;
      *(_DWORD *)v98 = 136315138;
      v198 = (uint64_t)(v98 + 4);
      v99 = v197;
      v75(v62, v74, v197);
      v100 = sub_1C2FC9714();
      v78(v62, v99);
      v102 = OUTLINED_FUNCTION_110(v100, v101, v201);
      OUTLINED_FUNCTION_235(v102);
      OUTLINED_FUNCTION_129();
      OUTLINED_FUNCTION_247();
      OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v77, v97, "Current session is not of type %s, cannot start correction speech request", v199);
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_167();
    goto LABEL_46;
  }
  v197 = v73;
  v195 = v56;
  v79 = (void (*)(uint64_t, uint64_t, NSObject *))*((_QWORD *)v56 + 2);
  v80 = v193;
  v81 = v191;
  v79(v193, v73 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId, v191);
  v82 = v199;
  v83 = &v199[OBJC_IVAR___SRDRequestDispatcherInternal_sessionUserId];
  OUTLINED_FUNCTION_5_0();
  v84 = v189;
  sub_1C2FA8A8C((uint64_t)v83, v189);
  v85 = v194;
  OUTLINED_FUNCTION_350(v84, 1, (uint64_t)v194);
  if (v86)
  {
    sub_1C2F9BD60(v84, &qword_1ED7AF490);
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_305();
    v87 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_14_4(v87))
    {
      v88 = (uint8_t *)OUTLINED_FUNCTION_1();
      v89 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_230(v89);
      *(_DWORD *)v88 = 136315394;
      OUTLINED_FUNCTION_83();
      v203 = OUTLINED_FUNCTION_110(v192, v90, v201);
      OUTLINED_FUNCTION_65_1();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_283();
      OUTLINED_FUNCTION_71();
      v203 = OUTLINED_FUNCTION_87(v71, v91, v201);
      OUTLINED_FUNCTION_65_1();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_39(&dword_1C2F94000, v85, (os_log_type_t)v84, "sessionUserId is not set for assistantId: %s during request: %s", v88);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_205();

    v113 = OUTLINED_FUNCTION_274();
    v115 = v81;
    goto LABEL_45;
  }
  v172[1] = v79;
  v103 = a22;
  OUTLINED_FUNCTION_272();
  OUTLINED_FUNCTION_45(v190, v84, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v104 + 32));
  __swift_project_boxed_opaque_existential_1(&v82[OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker], *(_QWORD *)&v82[OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker + 24]);
  v105 = sub_1C2FC9810();
  v106 = objc_allocWithZone((Class)OUTLINED_FUNCTION_298());
  v107 = v103;
  v108 = sub_1C2FC9678();
  v109 = (void *)v108;
  if ((v105 & 1) == 0)
  {
    v116 = v71;
    v110 = v196;
    sub_1C2FA8104();
    v118 = v117;

    if ((v118 & 1) != 0)
    {
      OUTLINED_FUNCTION_245();
      v119 = v190;
      sub_1C2FA8604();
      if ((v120 & 1) != 0)
      {
        v121 = OUTLINED_FUNCTION_245();
        v126 = sub_1C2FA6E54(v121, v122, v123, v124, v125);
        v81 = v191;
        if (v126)
          goto LABEL_36;
        OUTLINED_FUNCTION_167();
        v127 = OUTLINED_FUNCTION_150();
LABEL_33:
        OUTLINED_FUNCTION_186(v127, v128);
        OUTLINED_FUNCTION_337();
LABEL_44:
        v113 = v80;
        v115 = v81;
        goto LABEL_45;
      }
      OUTLINED_FUNCTION_167();
      v148 = OUTLINED_FUNCTION_150();
    }
    else
    {
      OUTLINED_FUNCTION_205();
      v148 = OUTLINED_FUNCTION_334();
    }
    OUTLINED_FUNCTION_186(v148, v149);
    v113 = OUTLINED_FUNCTION_274();
    v115 = v191;
LABEL_45:
    v114(v113, v115);
    goto LABEL_46;
  }
  MEMORY[0x1E0C80A78](v108);
  OUTLINED_FUNCTION_360();
  sub_1C2FC9600();
  OUTLINED_FUNCTION_350((uint64_t)v106, 1, v185);
  v110 = v196;
  if (v86)
  {

    OUTLINED_FUNCTION_205();
    OUTLINED_FUNCTION_186(v190, *((uint64_t (**)(uint64_t, _QWORD))isa + 1));
    v111 = OUTLINED_FUNCTION_274();
    v112(v111, v81);
    sub_1C2F9BD60((uint64_t)v106, (uint64_t *)&unk_1EF7DBC08);
    goto LABEL_46;
  }
  v129 = v182;
  v130 = v181;
  OUTLINED_FUNCTION_45(v181, (uint64_t)v106, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v182 + 32));
  v131 = v178;
  OUTLINED_FUNCTION_45(v178, v130, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v129 + 16));
  v132 = v179;
  v133 = v180;
  OUTLINED_FUNCTION_351(v131, *MEMORY[0x1E0D9EB60], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v179 + 104));
  v134 = v109;
  sub_1C2FA600C();
  v136 = v135;

  (*(void (**)(uint64_t, uint64_t))(v132 + 8))(v131, v133);
  if ((v136 & 1) == 0)
  {

    swift_release();
    OUTLINED_FUNCTION_36_0(v130, *(uint64_t (**)(uint64_t, _QWORD))(v129 + 8));
    v127 = OUTLINED_FUNCTION_334();
    goto LABEL_33;
  }
  v189 = (uint64_t)v134;
  v137 = v177;
  OUTLINED_FUNCTION_309();
  v138 = sub_1C2FC89E8();
  v140 = v139;
  OUTLINED_FUNCTION_337();
  v187 = v141;
  v141((uint64_t)v137, v81);
  OUTLINED_FUNCTION_20_2();
  OUTLINED_FUNCTION_20_2();
  OUTLINED_FUNCTION_305();
  v142 = OUTLINED_FUNCTION_198();
  if (OUTLINED_FUNCTION_21(v142))
  {
    v143 = OUTLINED_FUNCTION_1();
    v201[0] = OUTLINED_FUNCTION_1();
    *(_DWORD *)v143 = 136315394;
    OUTLINED_FUNCTION_33_1();
    v144 = OUTLINED_FUNCTION_292();
    v203 = sub_1C2FC4294(v144, v145, v146);
    OUTLINED_FUNCTION_154();
    OUTLINED_FUNCTION_26_3();
    *(_WORD *)(v143 + 12) = 2080;
    OUTLINED_FUNCTION_91();
    v203 = OUTLINED_FUNCTION_127(v200, v147, v201);
    sub_1C2FC9BA0();
    OUTLINED_FUNCTION_26_3();
    OUTLINED_FUNCTION_39(&dword_1C2F94000, v137, (os_log_type_t)v134, "minting synthesized trpId : %s for text request: %s", (uint8_t *)v143);
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_46();
  v171 = v138;
  v116 = v193;
  v150 = v199;
  sub_1C2FA6AA4(v192, v173, v193, v200, v110, v190, v183, v184, v171, (uint64_t)v140);
  if ((v151 & 1) != 0)
  {
    OUTLINED_FUNCTION_277();
    sub_1C2FA6E98(v152, v153, v154, v155, v156, v157, v140);
    v159 = v158;
    OUTLINED_FUNCTION_131();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_32_1(v181, *(uint64_t (**)(uint64_t, uint64_t))(v182 + 8));
    v80 = v116;
    v82 = v150;
    v119 = v190;
    if ((v159 & 1) != 0)
    {
LABEL_36:
      v160 = *(_QWORD *)&v82[OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger];
      if ((*(_BYTE *)(v160 + 32) & 1) != 0 || (OUTLINED_FUNCTION_169(), v86))
      {
        v199 = *(uint8_t **)(v160 + 16);
        OUTLINED_FUNCTION_204((uint64_t)v204);
        OUTLINED_FUNCTION_216((uint64_t)&v199);
        v170 = v195;
        OUTLINED_FUNCTION_149();
        OUTLINED_FUNCTION_94();
        v161 = swift_allocObject();
        v162 = OUTLINED_FUNCTION_199(v161);
        OUTLINED_FUNCTION_232(v162, v119, *((uint64_t (**)(uint64_t, uint64_t, uint64_t))v170 + 4));
        v163 = (_QWORD *)(v116 + v80);
        *v163 = v200;
        v163[1] = v110;
        v202[1] = sub_1C2FBF664;
        v202[2] = v116;
        v201[0] = MEMORY[0x1E0C809B0];
        v201[1] = 1107296256;
        OUTLINED_FUNCTION_175((uint64_t)sub_1C2FA8FF0);
        OUTLINED_FUNCTION_91();
        OUTLINED_FUNCTION_12_0();
        OUTLINED_FUNCTION_308();
        v203 = MEMORY[0x1E0DEE9D8];
        sub_1C2FBFF94(qword_1ED7AEEF0, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
        OUTLINED_FUNCTION_141();
        OUTLINED_FUNCTION_132(&qword_1ED7AEF20);
        OUTLINED_FUNCTION_366();
        v80 = v193;
        sub_1C2FC9BDC();
        v164 = OUTLINED_FUNCTION_368();
        MEMORY[0x1C3BD0204](v164);
        OUTLINED_FUNCTION_82();
        v165 = OUTLINED_FUNCTION_188();
        OUTLINED_FUNCTION_41_0(v165, v166);
        v167 = OUTLINED_FUNCTION_150();
        OUTLINED_FUNCTION_36_0(v167, v168);
        OUTLINED_FUNCTION_167();
        v119 = v190;
        swift_release();
      }
      else
      {
        OUTLINED_FUNCTION_167();
        v170 = v195;
      }
      OUTLINED_FUNCTION_186(v119, *((uint64_t (**)(uint64_t, _QWORD))isa + 1));
      v114 = (void (*)(uint64_t, NSObject *))*((_QWORD *)v170 + 1);
      goto LABEL_44;
    }
    OUTLINED_FUNCTION_167();
    OUTLINED_FUNCTION_186(v119, *((uint64_t (**)(uint64_t, _QWORD))isa + 1));
    v169 = v116;
  }
  else
  {
    OUTLINED_FUNCTION_131();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_205();
    OUTLINED_FUNCTION_32_1(v181, *(uint64_t (**)(uint64_t, uint64_t))(v182 + 8));
    OUTLINED_FUNCTION_186(v190, *((uint64_t (**)(uint64_t, _QWORD))isa + 1));
    v169 = v116;
  }
  v187(v169, v81);
LABEL_46:
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB8D0C()
{
  swift_bridgeObjectRetain();
  return sub_1C2FC960C();
}

void sub_1C2FB8D50()
{
  char v0;
  NSObject *v1;
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
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)();
  uint64_t v26;

  OUTLINED_FUNCTION_30_1();
  v20 = v1;
  v5 = OUTLINED_FUNCTION_3_0();
  v6 = OUTLINED_FUNCTION_101(v5);
  MEMORY[0x1E0C80A78](v6);
  v18 = (uint64_t)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v8);
  v22 = (uint64_t)&v17 - v9;
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_153();
  v21 = v2;
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_123();
  v11 = v22;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v20 = *(NSObject **)((char *)&v20->isa + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  v12 = *(_QWORD *)(v19 + 16);
  OUTLINED_FUNCTION_26_4(v3, v2);
  v13 = v18;
  OUTLINED_FUNCTION_26_4(v18, v11);
  OUTLINED_FUNCTION_48_2();
  v14 = swift_allocObject();
  OUTLINED_FUNCTION_26_4(v14 + v12, v3);
  OUTLINED_FUNCTION_26_4(v14 + v2, v13);
  OUTLINED_FUNCTION_183((unint64_t *)(v14 + v11));
  OUTLINED_FUNCTION_181(v15);
  v16 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v16 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v16 + 24) = v14;
  v25 = sub_1C2FC0008;
  v26 = v16;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_135();
  OUTLINED_FUNCTION_109(v20);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_12_3(v22);
  OUTLINED_FUNCTION_12_3(v21);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v0 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

void sub_1C2FB8F78()
{
  os_log_type_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;

  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_185();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_267(v3, *MEMORY[0x1E0D9EE70]);
  OUTLINED_FUNCTION_208();
  OUTLINED_FUNCTION_243();
  OUTLINED_FUNCTION_210();
  objc_allocWithZone((Class)sub_1C2FC9324());
  v4 = (void *)sub_1C2FC92DC();
  if (v4)
  {
    v5 = v4;
    OUTLINED_FUNCTION_372(v4);

  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v6 = OUTLINED_FUNCTION_7();
    v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v8 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_66_1(v8))
    {
      v9 = (uint8_t *)OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_209(4.8149e-34);
      v10 = OUTLINED_FUNCTION_162();
      OUTLINED_FUNCTION_9_2(v10);
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v7, v0, "Cannot create StartSpeechDictationSessionMessage for assistantId: %s", v9);
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
  }
  OUTLINED_FUNCTION_263();
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB9160(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD v18[4];

  v18[3] = a7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *MEMORY[0x1E0D9E640];
  v15 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  sub_1C2FC930C();
  swift_bridgeObjectRetain();
  sub_1C2FC92E8();
  v16 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v10, a4, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v16);
  sub_1C2FC9318();
  swift_bridgeObjectRetain();
  sub_1C2FC92F4();
  return sub_1C2FC9300();
}

void sub_1C2FB92E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  _BYTE *v42;
  uint64_t v43;
  void (**v44)();
  uint64_t v45;
  _BYTE v46[24];
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  _QWORD v52[20];

  OUTLINED_FUNCTION_30_1();
  a19 = v24;
  a20 = v25;
  v33 = OUTLINED_FUNCTION_44_2(v26, v27, v28, v29, v30, v31, v32);
  v34 = OUTLINED_FUNCTION_3_0();
  v48 = *(_QWORD *)(v34 - 8);
  OUTLINED_FUNCTION_105();
  MEMORY[0x1E0C80A78](v35);
  v47 = &v46[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v36);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v37);
  v51 = &v46[-v38];
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v39);
  OUTLINED_FUNCTION_37_1();
  v50 = v20;
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_123();
  v40 = v51;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v49 = *(_QWORD *)(v23 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  v41 = *(_QWORD *)(v48 + 16);
  OUTLINED_FUNCTION_33_2(v21, v20);
  v42 = v47;
  OUTLINED_FUNCTION_33_2((uint64_t)v47, (uint64_t)v40);
  OUTLINED_FUNCTION_23_3();
  v43 = swift_allocObject();
  OUTLINED_FUNCTION_33_2(v43 + v41, v21);
  OUTLINED_FUNCTION_33_2(v43 + v23, (uint64_t)v42);
  OUTLINED_FUNCTION_118((unint64_t *)(v43 + v33));
  *v44 = sub_1C2FBEE14;
  v44[1] = (void (*)())v52;
  v45 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v45 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v45 + 24) = v43;
  v52[16] = sub_1C2FC0008;
  v52[17] = v45;
  v52[12] = MEMORY[0x1E0C809B0];
  v52[13] = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_106((uint64_t)&a18);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_12_3((uint64_t)v51);
  OUTLINED_FUNCTION_12_3(v50);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v34 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB9514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD v13[2];

  v13[0] = a5;
  v13[1] = a8;
  v8 = sub_1C2FC95F4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_1C2FAD884();
  swift_bridgeObjectRelease();
  sub_1C2FB96CC();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

#error "1C2FB9694: call analysis failed (funcsize=50)"

void sub_1C2FB96CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  void (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
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

  OUTLINED_FUNCTION_30_1();
  v45 = v1;
  v46 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v11);
  v13 = (uint8_t *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = OUTLINED_FUNCTION_59();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_77();
  OUTLINED_FUNCTION_273();
  sub_1C2FC231C();
  if (v16)
  {
    v47 = v0;
    v17 = v10;
    v18 = v6;
    v19 = v4;
    v20 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
    v44 = v16;
    v20(v47, v16 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId, v14);
    v20((uint64_t)v13, v47, v14);
    OUTLINED_FUNCTION_125((uint64_t)v13);
    sub_1C2FA42C8(v13, v18, v19, 6, 0, 0, 0, 0, 0);
    OUTLINED_FUNCTION_362(v21, &qword_1ED7AE750);
    MEMORY[0x1E0C80A78](v22);
    *(&v44 - 8) = v17;
    *(&v44 - 7) = v8;
    v23 = v47;
    *(&v44 - 6) = v47;
    *(&v44 - 5) = v18;
    v24 = v45;
    *(&v44 - 4) = (uint64_t)v19;
    *(&v44 - 3) = v24;
    v43 = v46;
    objc_allocWithZone((Class)sub_1C2FC92D0());
    v25 = (void *)sub_1C2FC927C();
    if (v25)
    {
      v26 = v25;
      OUTLINED_FUNCTION_330(v25);
      OUTLINED_FUNCTION_304();

      v27 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
      v28 = v23;
    }
    else
    {
      v46 = v18;
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v36 = OUTLINED_FUNCTION_7();
      v37 = __swift_project_value_buffer(v36, (uint64_t)qword_1ED7AF5F0);
      OUTLINED_FUNCTION_20_2();
      sub_1C2FC98E8();
      v38 = OUTLINED_FUNCTION_43();
      if (OUTLINED_FUNCTION_46_2(v37))
      {
        v39 = (uint8_t *)OUTLINED_FUNCTION_1();
        v40 = OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_48_1(v40);
        *(_DWORD *)v39 = 136315138;
        OUTLINED_FUNCTION_91();
        v42 = OUTLINED_FUNCTION_127(v46, v41, &v49);
        OUTLINED_FUNCTION_9_2(v42);
        OUTLINED_FUNCTION_26_3();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v37, v38, "Failed to create StartSpeechDictationRequestMessage for requestId %s", v39);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_304();
      v27 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
      v28 = v47;
    }
    OUTLINED_FUNCTION_194(v28, v27);
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v29 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v29, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_20_2();
    v30 = sub_1C2FC98E8();
    v31 = sub_1C2FC9B1C();
    if (OUTLINED_FUNCTION_6_2(v31))
    {
      v32 = v6;
      v33 = OUTLINED_FUNCTION_1();
      v49 = OUTLINED_FUNCTION_1();
      *(_DWORD *)v33 = 136315394;
      OUTLINED_FUNCTION_147();
      v48 = OUTLINED_FUNCTION_165(v10, v34, &v49);
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_26_3();
      *(_WORD *)(v33 + 12) = 2080;
      OUTLINED_FUNCTION_91();
      v48 = OUTLINED_FUNCTION_127(v32, v35, &v49);
      OUTLINED_FUNCTION_24_0();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_39(&dword_1C2F94000, v30, (os_log_type_t)v0, "No active session for assistantId: %s cannot start speech dictation request for request id: %s", (uint8_t *)v33);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_46();
  }
  OUTLINED_FUNCTION_27();
}

void sub_1C2FB9B10()
{
  char v0;
  NSObject *v1;
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
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)();
  uint64_t v26;

  OUTLINED_FUNCTION_30_1();
  v20 = v1;
  v5 = OUTLINED_FUNCTION_3_0();
  v6 = OUTLINED_FUNCTION_101(v5);
  MEMORY[0x1E0C80A78](v6);
  v18 = (uint64_t)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v8);
  v22 = (uint64_t)&v17 - v9;
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_153();
  v21 = v2;
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_123();
  v11 = v22;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v20 = *(NSObject **)((char *)&v20->isa + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  v12 = *(_QWORD *)(v19 + 16);
  OUTLINED_FUNCTION_26_4(v3, v2);
  v13 = v18;
  OUTLINED_FUNCTION_26_4(v18, v11);
  OUTLINED_FUNCTION_48_2();
  v14 = swift_allocObject();
  OUTLINED_FUNCTION_26_4(v14 + v12, v3);
  OUTLINED_FUNCTION_26_4(v14 + v2, v13);
  OUTLINED_FUNCTION_183((unint64_t *)(v14 + v11));
  OUTLINED_FUNCTION_181(v15);
  v16 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v16 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v16 + 24) = v14;
  v25 = sub_1C2FC0008;
  v26 = v16;
  v23 = MEMORY[0x1E0C809B0];
  v24 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_135();
  OUTLINED_FUNCTION_109(v20);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_12_3(v22);
  OUTLINED_FUNCTION_12_3(v21);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v0 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB9D38(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t))
{
  id v8;
  uint64_t v9;

  OUTLINED_FUNCTION_206();
  OUTLINED_FUNCTION_280();
  v8 = a1;
  v9 = OUTLINED_FUNCTION_299();
  a6(v9);

  OUTLINED_FUNCTION_13();
  return OUTLINED_FUNCTION_145();
}

void sub_1C2FB9D98()
{
  os_log_type_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;

  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_185();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_92();
  OUTLINED_FUNCTION_267(v3, *MEMORY[0x1E0D9EE58]);
  OUTLINED_FUNCTION_208();
  OUTLINED_FUNCTION_243();
  OUTLINED_FUNCTION_210();
  objc_allocWithZone((Class)sub_1C2FC9480());
  v4 = (void *)sub_1C2FC9438();
  if (v4)
  {
    v5 = v4;
    OUTLINED_FUNCTION_372(v4);

  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v6 = OUTLINED_FUNCTION_7();
    v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v8 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_66_1(v8))
    {
      v9 = (uint8_t *)OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_209(4.8149e-34);
      v10 = OUTLINED_FUNCTION_162();
      OUTLINED_FUNCTION_9_2(v10);
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v7, v0, "Cannot create StartUnderstandingDictationSessionMessage for assistantId: %s", v9);
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
  }
  OUTLINED_FUNCTION_263();
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FB9F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _DWORD v18[4];

  v18[3] = a7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *MEMORY[0x1E0D9E640];
  v15 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  sub_1C2FC9468();
  swift_bridgeObjectRetain();
  sub_1C2FC9444();
  v16 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v10, a4, v16);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v16);
  sub_1C2FC9474();
  swift_bridgeObjectRetain();
  sub_1C2FC9450();
  return sub_1C2FC945C();
}

void sub_1C2FBA108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  _BYTE *v42;
  uint64_t v43;
  void (**v44)();
  uint64_t v45;
  _BYTE v46[24];
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  _QWORD v52[20];

  OUTLINED_FUNCTION_30_1();
  a19 = v24;
  a20 = v25;
  v33 = OUTLINED_FUNCTION_44_2(v26, v27, v28, v29, v30, v31, v32);
  v34 = OUTLINED_FUNCTION_3_0();
  v48 = *(_QWORD *)(v34 - 8);
  OUTLINED_FUNCTION_105();
  MEMORY[0x1E0C80A78](v35);
  v47 = &v46[-((v22 + 15) & 0xFFFFFFFFFFFFFFF0)];
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v36);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v37);
  v51 = &v46[-v38];
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v39);
  OUTLINED_FUNCTION_37_1();
  v50 = v20;
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_123();
  v40 = v51;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v49 = *(_QWORD *)(v23 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  v41 = *(_QWORD *)(v48 + 16);
  OUTLINED_FUNCTION_33_2(v21, v20);
  v42 = v47;
  OUTLINED_FUNCTION_33_2((uint64_t)v47, (uint64_t)v40);
  OUTLINED_FUNCTION_23_3();
  v43 = swift_allocObject();
  OUTLINED_FUNCTION_33_2(v43 + v41, v21);
  OUTLINED_FUNCTION_33_2(v43 + v23, (uint64_t)v42);
  OUTLINED_FUNCTION_118((unint64_t *)(v43 + v33));
  *v44 = sub_1C2FBEE60;
  v44[1] = (void (*)())v52;
  v45 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v45 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v45 + 24) = v43;
  v52[16] = sub_1C2FC0008;
  v52[17] = v45;
  v52[12] = MEMORY[0x1E0C809B0];
  v52[13] = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_106((uint64_t)&a18);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_12_3((uint64_t)v51);
  OUTLINED_FUNCTION_12_3(v50);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v34 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FBA334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD v13[2];

  v13[1] = a8;
  v8 = sub_1C2FC95F4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C2FAD884();
  sub_1C2FBA4C8();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1C2FBA418()
{
  void (*v0)(uint64_t);
  void (*v1)(uint64_t);
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;

  OUTLINED_FUNCTION_30_1();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  OUTLINED_FUNCTION_206();
  sub_1C2FC99F0();
  sub_1C2FC99F0();
  v6 = v3;
  v7 = v5;
  v8 = OUTLINED_FUNCTION_273();
  v1(v8);

  OUTLINED_FUNCTION_327();
  OUTLINED_FUNCTION_247();
  return swift_bridgeObjectRelease();
}

void sub_1C2FBA4C8()
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
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  void (*v41)(uint64_t);
  uint64_t v42;
  uint64_t v43;

  OUTLINED_FUNCTION_30_1();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v42 = v8;
  v9 = OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_282();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_76();
  OUTLINED_FUNCTION_236();
  if (v11)
  {
    v40 = *MEMORY[0x1E0D9EE58];
    v41 = *(void (**)(uint64_t))(v0 + 104);
    v41(v1);
    v12 = OUTLINED_FUNCTION_142();
    v13 = OUTLINED_FUNCTION_163();
    if ((v12 & 1) != 0)
    {
      MEMORY[0x1E0C80A78](v13);
      OUTLINED_FUNCTION_355();
      *(_QWORD *)(v15 - 48) = v14;
      *(_QWORD *)(v15 - 40) = v42;
      *(_QWORD *)(v15 - 32) = v7;
      *(_QWORD *)(v15 - 24) = v5;
      *(_QWORD *)(v15 - 16) = v3;
      v16 = objc_allocWithZone((Class)sub_1C2FC942C());
      OUTLINED_FUNCTION_69_0();
      v17 = (void *)sub_1C2FC927C();
      if (v17)
      {
        v18 = v17;
        OUTLINED_FUNCTION_330(v17);
        OUTLINED_FUNCTION_108();

        goto LABEL_21;
      }
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v34 = OUTLINED_FUNCTION_7();
      v35 = __swift_project_value_buffer(v34, (uint64_t)qword_1ED7AF5F0);
      OUTLINED_FUNCTION_20_2();
      sub_1C2FC98E8();
      v36 = OUTLINED_FUNCTION_43();
      if (OUTLINED_FUNCTION_46_2(v35))
      {
        v37 = (uint8_t *)OUTLINED_FUNCTION_1();
        v43 = OUTLINED_FUNCTION_1();
        *(_DWORD *)v37 = 136315138;
        OUTLINED_FUNCTION_83();
        v39 = OUTLINED_FUNCTION_110(v42, v38, &v43);
        OUTLINED_FUNCTION_89(v39);
        OUTLINED_FUNCTION_26_3();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v35, v36, "Failed to create StartUnderstandingDictationRequestMessage for requestId %s", v37);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_46();
    }
    else
    {
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v25 = OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_212(v25, (uint64_t)qword_1ED7AF5F0);
      OUTLINED_FUNCTION_20_2();
      v26 = sub_1C2FC98E8();
      v27 = sub_1C2FC9B10();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = OUTLINED_FUNCTION_1();
        v43 = OUTLINED_FUNCTION_1();
        *(_DWORD *)v28 = 136315394;
        ((void (*)(uint64_t, _QWORD, uint64_t))v41)(v1, v40, v9);
        v29 = OUTLINED_FUNCTION_269();
        OUTLINED_FUNCTION_163();
        v31 = OUTLINED_FUNCTION_127(v29, v30, &v43);
        OUTLINED_FUNCTION_319(v31);
        OUTLINED_FUNCTION_24_0();
        OUTLINED_FUNCTION_121();
        *(_WORD *)(v28 + 12) = 2080;
        OUTLINED_FUNCTION_24();
        v33 = OUTLINED_FUNCTION_99(v42, v32, &v43);
        OUTLINED_FUNCTION_320(v33);
        OUTLINED_FUNCTION_24_0();
        OUTLINED_FUNCTION_26_3();
        OUTLINED_FUNCTION_39(&dword_1C2F94000, v26, v27, "Current session type is not of type %s, cannot start understanding dictation request for requestId: %s", (uint8_t *)v28);
        OUTLINED_FUNCTION_38();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_46();
    }
    swift_release();
    goto LABEL_21;
  }
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v19 = OUTLINED_FUNCTION_7();
  v20 = __swift_project_value_buffer(v19, (uint64_t)qword_1ED7AF5F0);
  OUTLINED_FUNCTION_20_2();
  OUTLINED_FUNCTION_20_2();
  sub_1C2FC98E8();
  v21 = OUTLINED_FUNCTION_43();
  if (OUTLINED_FUNCTION_46_2(v20))
  {
    v22 = OUTLINED_FUNCTION_1();
    v43 = OUTLINED_FUNCTION_1();
    *(_DWORD *)v22 = 136315394;
    OUTLINED_FUNCTION_33_1();
    v23 = OUTLINED_FUNCTION_50_1();
    OUTLINED_FUNCTION_164(v23);
    OUTLINED_FUNCTION_26_3();
    *(_WORD *)(v22 + 12) = 2080;
    OUTLINED_FUNCTION_91();
    OUTLINED_FUNCTION_127(v42, v24, &v43);
    OUTLINED_FUNCTION_65_1();
    OUTLINED_FUNCTION_26_3();
    OUTLINED_FUNCTION_39(&dword_1C2F94000, v20, v21, "No active session for assistantId: %s cannot start understanding dictation request for request id: %s", (uint8_t *)v22);
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_46();
  OUTLINED_FUNCTION_46();
LABEL_21:
  OUTLINED_FUNCTION_27();
}

void sub_1C2FBA9DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
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
  id v17;
  uint64_t v18;
  uint64_t v19;

  OUTLINED_FUNCTION_30_1();
  v4 = v3;
  v19 = v5;
  v18 = v6;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF410);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_77();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_286();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_55_0();
  v10 = *MEMORY[0x1E0D9E640];
  v11 = OUTLINED_FUNCTION_65_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v0, v10, v11);
  OUTLINED_FUNCTION_49_1();
  __swift_storeEnumTagSinglePayload(v12, v13, v14, v11);
  sub_1C2FC92AC();
  OUTLINED_FUNCTION_83();
  sub_1C2FC9288();
  v15 = OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_351(v2, v18, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16));
  OUTLINED_FUNCTION_60_0(v2);
  sub_1C2FC92C4();
  OUTLINED_FUNCTION_33_1();
  sub_1C2FC92B8();
  v16 = OUTLINED_FUNCTION_370();
  OUTLINED_FUNCTION_351(v1, v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16));
  OUTLINED_FUNCTION_60_0(v1);
  sub_1C2FC9294();
  v17 = v4;
  sub_1C2FC92A0();
  OUTLINED_FUNCTION_27();
}

void sub_1C2FBAB50()
{
  char v0;
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
  uint64_t (**v18)();
  uint64_t v19;
  NSObject *v20;
  _QWORD v21[12];

  OUTLINED_FUNCTION_30_1();
  v7 = v1;
  v9 = v8;
  v11 = v10;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_102();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_43_2();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_97();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_96();
  v21[2] = v7;
  v21[3] = v11;
  v21[4] = v9;
  sub_1C2F9C624();
  OUTLINED_FUNCTION_28_3();
  OUTLINED_FUNCTION_189();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v20 = *(NSObject **)(v7 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  v16 = *(_QWORD *)(v6 + 16);
  OUTLINED_FUNCTION_26_4(v5, v3);
  OUTLINED_FUNCTION_26_4(v4, v2);
  OUTLINED_FUNCTION_30_3();
  v17 = swift_allocObject();
  OUTLINED_FUNCTION_26_4(v17 + v16, v5);
  OUTLINED_FUNCTION_26_4((uint64_t)&type metadata for Logger + v17, v4);
  OUTLINED_FUNCTION_35_3((unint64_t *)(v17 + v2));
  *v18 = sub_1C2FBEE9C;
  v18[1] = (uint64_t (*)())v21;
  v19 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v19 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v19 + 24) = v17;
  v21[9] = sub_1C2FC0008;
  v21[10] = v19;
  v21[5] = MEMORY[0x1E0C809B0];
  v21[6] = 1107296256;
  OUTLINED_FUNCTION_104((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v20);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v2);
  OUTLINED_FUNCTION_12_3(v3);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v0 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FBAD44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void (*v6)(unint64_t, _QWORD, uint64_t);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF570);
  v0 = sub_1C2FC9720();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1C2FCACC0;
  v5 = v4 + v3;
  v6 = *(void (**)(unint64_t, _QWORD, uint64_t))(v1 + 104);
  v6(v5, *MEMORY[0x1E0D9EE70], v0);
  v6(v5 + v2, *MEMORY[0x1E0D9EE58], v0);
  sub_1C2FB0164();
  swift_setDeallocating();
  return sub_1C2FBD734();
}

void sub_1C2FBAE88()
{
  char v0;
  NSObject *v1;
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
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)();
  uint64_t v37;

  OUTLINED_FUNCTION_30_1();
  v27 = v1;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = OUTLINED_FUNCTION_3_0();
  v15 = OUTLINED_FUNCTION_101(v14);
  MEMORY[0x1E0C80A78](v15);
  v25 = (uint64_t)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_192();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_95();
  v29 = v1;
  v30 = v13;
  v31 = v11;
  v32 = v9;
  v33 = v7;
  v19 = sub_1C2F9C624();
  v28 = v3;
  OUTLINED_FUNCTION_190();
  v26 = v2;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v27 = *(NSObject **)((char *)&v27->isa + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  OUTLINED_FUNCTION_41_2(v4, v3);
  v20 = v25;
  OUTLINED_FUNCTION_41_2(v25, v2);
  OUTLINED_FUNCTION_29_4();
  v21 = swift_allocObject();
  OUTLINED_FUNCTION_27_2(v21);
  OUTLINED_FUNCTION_41_2(v5 + v19, v20);
  OUTLINED_FUNCTION_35_3((unint64_t *)((char *)&type metadata for Logger + v5));
  OUTLINED_FUNCTION_181(v22);
  v23 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v23 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v23 + 24) = v5;
  v36 = sub_1C2FC0008;
  v37 = v23;
  v34 = MEMORY[0x1E0C809B0];
  v35 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_32_3();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v27);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v26);
  OUTLINED_FUNCTION_12_3(v28);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v0 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FBB09C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v7 = OUTLINED_FUNCTION_206();
  v9 = v8;
  v10 = sub_1C2FC99F0();
  v12 = v11;
  v13 = a1;
  a5(v7, v9, v10, v12);

  OUTLINED_FUNCTION_17_0();
  return swift_bridgeObjectRelease();
}

void sub_1C2FBB118()
{
  os_log_type_t v0;
  os_log_type_t v1;
  os_log_type_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_30_1();
  v2 = v0;
  OUTLINED_FUNCTION_222();
  OUTLINED_FUNCTION_178();
  if (v3)
  {
    MEMORY[0x1E0C80A78](v3);
    v4 = objc_allocWithZone((Class)sub_1C2FC8EB0());
    OUTLINED_FUNCTION_69_0();
    v5 = (void *)sub_1C2FC8BE0();
    if (v5)
    {
      v6 = v5;
      OUTLINED_FUNCTION_202(v5);
      OUTLINED_FUNCTION_80();

    }
    else
    {
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v13 = OUTLINED_FUNCTION_7();
      v14 = __swift_project_value_buffer(v13, (uint64_t)qword_1ED7AF5F0);
      OUTLINED_FUNCTION_20_2();
      sub_1C2FC98E8();
      v15 = OUTLINED_FUNCTION_43();
      if (OUTLINED_FUNCTION_21(v15))
      {
        v16 = (uint8_t *)OUTLINED_FUNCTION_1();
        v17 = OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_48_1(v17);
        *(_DWORD *)v16 = 136315138;
        OUTLINED_FUNCTION_11_0();
        v18 = OUTLINED_FUNCTION_115();
        OUTLINED_FUNCTION_9_2(v18);
        OUTLINED_FUNCTION_26_3();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v14, v1, "Failed to create a PauseDictationRequestMessage for requestId %s", v16);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_80();
    }
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_7();
    v8 = __swift_project_value_buffer(v7, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v9 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_66_1(v9))
    {
      v10 = OUTLINED_FUNCTION_1();
      v11 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_281(v11);
      *(_DWORD *)v10 = 136315394;
      OUTLINED_FUNCTION_33_1();
      v12 = OUTLINED_FUNCTION_50_1();
      OUTLINED_FUNCTION_146(v12);
      OUTLINED_FUNCTION_26_3();
      *(_WORD *)(v10 + 12) = 2080;
      OUTLINED_FUNCTION_11_0();
      OUTLINED_FUNCTION_115();
      OUTLINED_FUNCTION_65_1();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_39(&dword_1C2F94000, v8, v2, "No active session for assistantId: %s, cannot pause dictation recognition for requestId: %s", (uint8_t *)v10);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_46();
  }
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FBB3FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *MEMORY[0x1E0D9E640];
  v12 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v10, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  sub_1C2FC954C();
  swift_bridgeObjectRetain();
  sub_1C2FC9540();
  v13 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v7, a4, v13);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v13);
  sub_1C2FC9564();
  swift_bridgeObjectRetain();
  return sub_1C2FC9558();
}

void sub_1C2FBB574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
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
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  _QWORD v60[5];
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
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void (*v77)();
  uint64_t v78;

  OUTLINED_FUNCTION_30_1();
  a19 = v26;
  a20 = v27;
  v62 = v22;
  OUTLINED_FUNCTION_252(v28, v29, v30, (uint64_t)&a13);
  v60[1] = v31;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  OUTLINED_FUNCTION_332(a22);
  v40 = a21;
  v41 = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_331(*(_QWORD *)(v41 - 8));
  OUTLINED_FUNCTION_105();
  MEMORY[0x1E0C80A78](v42);
  OUTLINED_FUNCTION_191();
  v61 = v43;
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v44);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v45);
  v64 = (uint64_t)v60 - v46;
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v47);
  OUTLINED_FUNCTION_95();
  v65 = v22;
  v66 = v39;
  v67 = v37;
  v68 = v35;
  OUTLINED_FUNCTION_256();
  v69 = v33;
  v70 = v48;
  v71 = v60[2];
  v72 = v60[3];
  v73 = v60[4];
  v74 = v40;
  OUTLINED_FUNCTION_335((uint64_t)&a9);
  v49 = v23;
  v63 = v23;
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_123();
  v51 = v50 | 0x8000000000000000;
  v52 = v64;
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  v53 = OUTLINED_FUNCTION_221(*(_QWORD *)(v62 + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue));
  OUTLINED_FUNCTION_33_2(v53, v49);
  v54 = v61;
  OUTLINED_FUNCTION_33_2(v61, v52);
  v55 = (v25 + 48) & 0xFFFFFFFFFFFFFFDFLL;
  v56 = (v25 + v55 + 7) & 0xFFFFFFFFFFFFFFF8;
  v57 = swift_allocObject();
  OUTLINED_FUNCTION_33_2(v57 + 16, v24);
  OUTLINED_FUNCTION_33_2(v57 + v55, v54);
  v58 = (_QWORD *)(v57 + v56);
  *v58 = 0xD00000000000005ALL;
  v58[1] = v51;
  OUTLINED_FUNCTION_285((_QWORD *)(v57 + ((v56 + 23) & 0xFFFFFFFFFFFFFFF8)));
  v59 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v59 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v59 + 24) = v57;
  v77 = sub_1C2FC0008;
  v78 = v59;
  v75 = MEMORY[0x1E0C809B0];
  v76 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_106((uint64_t)&a16);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_12_3(v64);
  OUTLINED_FUNCTION_12_3(v63);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v41 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

void sub_1C2FBB934()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[3];
  uint64_t v29;

  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_178();
  if (v8)
  {
    v28[1] = v28;
    MEMORY[0x1E0C80A78](v8);
    OUTLINED_FUNCTION_354();
    *(_QWORD *)(v9 - 80) = v10;
    *(_QWORD *)(v9 - 72) = v6;
    *(_QWORD *)(v9 - 64) = v0;
    *(_QWORD *)(v9 - 56) = v1;
    *(_QWORD *)(v9 - 48) = v7;
    *(_QWORD *)(v9 - 40) = v2;
    *(_QWORD *)(v9 - 32) = v5;
    *(_QWORD *)(v9 - 24) = v11;
    *(_QWORD *)(v9 - 16) = v12;
    v13 = objc_allocWithZone((Class)sub_1C2FC8F1C());
    OUTLINED_FUNCTION_69_0();
    v14 = (void *)sub_1C2FC8EBC();
    if (v14)
    {
      v15 = v14;
      OUTLINED_FUNCTION_202(v14);
      OUTLINED_FUNCTION_108();

    }
    else
    {
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v22 = OUTLINED_FUNCTION_7();
      v23 = __swift_project_value_buffer(v22, (uint64_t)qword_1ED7AF5F0);
      OUTLINED_FUNCTION_20_2();
      sub_1C2FC98E8();
      v24 = OUTLINED_FUNCTION_43();
      if (OUTLINED_FUNCTION_21(v24))
      {
        v25 = (uint8_t *)OUTLINED_FUNCTION_1();
        v29 = OUTLINED_FUNCTION_1();
        *(_DWORD *)v25 = 136315138;
        OUTLINED_FUNCTION_71();
        v27 = OUTLINED_FUNCTION_87(v6, v26, &v29);
        OUTLINED_FUNCTION_61_1(v27);
        OUTLINED_FUNCTION_26_3();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v23, v3, "Failed to create a ResumeDictationRequestMessage for requestId %s", v25);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_108();
    }
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v16 = OUTLINED_FUNCTION_7();
    v17 = __swift_project_value_buffer(v16, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v18 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_66_1(v18))
    {
      v19 = OUTLINED_FUNCTION_1();
      v20 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_281(v20);
      *(_DWORD *)v19 = 136315394;
      OUTLINED_FUNCTION_33_1();
      OUTLINED_FUNCTION_50_1();
      OUTLINED_FUNCTION_114();
      OUTLINED_FUNCTION_26_3();
      *(_WORD *)(v19 + 12) = 2080;
      OUTLINED_FUNCTION_11_0();
      v28[2] = OUTLINED_FUNCTION_160(v6, v21, &v29);
      OUTLINED_FUNCTION_114();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_39(&dword_1C2F94000, v17, v4, "No active session for assistantId: %s, cannot resume dictation recognition for requestId: %s", (uint8_t *)v19);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_46();
  }
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FBBC40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v22[6];

  v22[1] = a5;
  v22[2] = a7;
  v22[0] = a4;
  v22[4] = a12;
  v22[5] = a11;
  v22[3] = a9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *MEMORY[0x1E0D9E640];
  v19 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v17, v18, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v19);
  sub_1C2FC8EF8();
  swift_bridgeObjectRetain();
  sub_1C2FC8ED4();
  v20 = sub_1C2FC8A0C();
  (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v14, v22[0], v20);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 0, 1, v20);
  sub_1C2FC8F10();
  swift_bridgeObjectRetain();
  sub_1C2FC8F04();
  swift_bridgeObjectRetain();
  sub_1C2FC8EC8();
  swift_bridgeObjectRetain();
  sub_1C2FC8EE0();
  swift_bridgeObjectRetain();
  return sub_1C2FC8EEC();
}

void sub_1C2FBBE14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,__int128 a21,__int128 a22,__int128 a23,uint64_t a24)
{
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
  unint64_t v53;
  uint64_t v54;
  void (**v55)();
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
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
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)();
  uint64_t v82;

  OUTLINED_FUNCTION_30_1();
  a19 = v28;
  a20 = v29;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v60 = a24;
  v59 = a23;
  v58 = a22;
  v57 = a21;
  v40 = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_333(*(_QWORD *)(v40 - 8));
  OUTLINED_FUNCTION_105();
  MEMORY[0x1E0C80A78](v41);
  OUTLINED_FUNCTION_191();
  v62 = v42;
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v43);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v44);
  OUTLINED_FUNCTION_47_0();
  v64 = v45;
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v46);
  OUTLINED_FUNCTION_95();
  v66 = v24;
  v67 = v39;
  v68 = v37;
  v69 = v35;
  v70 = v33;
  v71 = v31;
  OUTLINED_FUNCTION_207();
  v72 = v48;
  v73 = v47;
  OUTLINED_FUNCTION_253();
  v74 = v49;
  v75 = v57;
  v76 = v58;
  v77 = v59;
  v78 = v60;
  sub_1C2F9C624();
  v63 = v25;
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_123();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_17_4();
  OUTLINED_FUNCTION_33_2(v26, v25);
  OUTLINED_FUNCTION_33_2(v62, v64);
  v50 = *(unsigned __int8 *)(v61 + 80);
  v51 = (v50 + 16) & ~v50;
  v52 = (v27 + v50 + v51) & ~v50;
  v53 = (v27 + v52 + 7) & 0xFFFFFFFFFFFFFFF8;
  v54 = swift_allocObject();
  OUTLINED_FUNCTION_33_2(v54 + v51, v26);
  OUTLINED_FUNCTION_33_2(v54 + v52, v62);
  OUTLINED_FUNCTION_183((unint64_t *)(v54 + v53));
  *v55 = sub_1C2FBEF20;
  v55[1] = (void (*)())&v65;
  v56 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v56 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v56 + 24) = v54;
  v81 = sub_1C2FC0008;
  v82 = v56;
  v79 = MEMORY[0x1E0C809B0];
  v80 = 1107296256;
  OUTLINED_FUNCTION_16_4((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_106((uint64_t)&a12);
  OUTLINED_FUNCTION_82();
  OUTLINED_FUNCTION_12_3(v64);
  OUTLINED_FUNCTION_12_3(v63);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v40 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

void sub_1C2FBC2C4()
{
  os_log_type_t v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;

  OUTLINED_FUNCTION_30_1();
  OUTLINED_FUNCTION_143();
  OUTLINED_FUNCTION_178();
  if (v3)
  {
    v19[1] = v19;
    v19[0] = v3;
    MEMORY[0x1E0C80A78](v3);
    v4 = objc_allocWithZone((Class)sub_1C2FC8E14());
    OUTLINED_FUNCTION_69_0();
    v5 = (void *)sub_1C2FC8D78();
    if (v5)
    {
      v6 = v5;
      OUTLINED_FUNCTION_202(v5);
      swift_release();

    }
    else
    {
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v13 = OUTLINED_FUNCTION_7();
      v14 = __swift_project_value_buffer(v13, (uint64_t)qword_1ED7AF5F0);
      OUTLINED_FUNCTION_20_2();
      sub_1C2FC98E8();
      v15 = OUTLINED_FUNCTION_43();
      if (OUTLINED_FUNCTION_21(v15))
      {
        v16 = (uint8_t *)OUTLINED_FUNCTION_1();
        v20 = OUTLINED_FUNCTION_1();
        *(_DWORD *)v16 = 136315138;
        OUTLINED_FUNCTION_71();
        v18 = OUTLINED_FUNCTION_87(v2, v17, &v20);
        OUTLINED_FUNCTION_61_1(v18);
        OUTLINED_FUNCTION_26_3();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v14, v0, "Failed to create a VoiceCommandContextMessage for requestId %s", v16);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_108();
    }
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_7();
    v8 = __swift_project_value_buffer(v7, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v9 = OUTLINED_FUNCTION_43();
    if (OUTLINED_FUNCTION_66_1(v9))
    {
      v10 = OUTLINED_FUNCTION_1();
      v11 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_281(v11);
      *(_DWORD *)v10 = 136315394;
      OUTLINED_FUNCTION_33_1();
      OUTLINED_FUNCTION_50_1();
      OUTLINED_FUNCTION_114();
      OUTLINED_FUNCTION_26_3();
      *(_WORD *)(v10 + 12) = 2080;
      OUTLINED_FUNCTION_11_0();
      v19[2] = OUTLINED_FUNCTION_160(v2, v12, &v20);
      OUTLINED_FUNCTION_114();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_39(&dword_1C2F94000, v8, v1, "No active session for assistantId: %s, cannot send voice command context for requestId: %s", (uint8_t *)v10);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_46();
  }
  OUTLINED_FUNCTION_27();
}

uint64_t sub_1C2FBC5F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17)
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[6];
  id v28;
  id v29;

  v27[0] = a4;
  v27[1] = a5;
  v28 = a13;
  v29 = a14;
  v27[5] = a11;
  v27[3] = a7;
  v27[4] = a12;
  v27[2] = a9;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)v27 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = *MEMORY[0x1E0D9E640];
  v24 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v22, v23, v24);
  __swift_storeEnumTagSinglePayload((uint64_t)v22, 0, 1, v24);
  sub_1C2FC8DE4();
  swift_bridgeObjectRetain();
  sub_1C2FC8DA8();
  v25 = sub_1C2FC8A0C();
  (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v19, v27[0], v25);
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v25);
  sub_1C2FC8DFC();
  swift_bridgeObjectRetain();
  sub_1C2FC8DF0();
  swift_bridgeObjectRetain();
  sub_1C2FC8D9C();
  swift_bridgeObjectRetain();
  sub_1C2FC8DB4();
  swift_bridgeObjectRetain();
  sub_1C2FC8DC0();
  if (v28)
    objc_msgSend(v28, sel_BOOLValue);
  sub_1C2FC8DD8();
  if (v29)
    objc_msgSend(v29, sel_BOOLValue);
  sub_1C2FC8DCC();
  if (a15)
    objc_msgSend(a15, sel_BOOLValue);
  sub_1C2FC8D90();
  if (a16)
    objc_msgSend(a16, sel_BOOLValue);
  sub_1C2FC8D84();
  if (a17)
    objc_msgSend(a17, sel_BOOLValue);
  return sub_1C2FC8E08();
}

void sub_1C2FBC874()
{
  char v0;
  NSObject *v1;
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
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)();
  uint64_t v30;

  OUTLINED_FUNCTION_30_1();
  v23 = v1;
  v8 = v7;
  v10 = v9;
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_81();
  MEMORY[0x1E0C80A78](v11);
  v21 = (uint64_t)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_39_1();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_10_4();
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_192();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_338();
  v25 = v10;
  v26 = v8;
  sub_1C2F9C624();
  v15 = v6;
  v24 = v6;
  OUTLINED_FUNCTION_28_3();
  OUTLINED_FUNCTION_189();
  v22 = v3;
  OUTLINED_FUNCTION_17_4();
  v23 = *(NSObject **)((char *)&v23->isa + OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue);
  v16 = *(_QWORD *)(v2 + 16);
  OUTLINED_FUNCTION_26_4(v4, v15);
  v17 = v21;
  OUTLINED_FUNCTION_26_4(v21, v3);
  OUTLINED_FUNCTION_47_2();
  v18 = swift_allocObject();
  OUTLINED_FUNCTION_26_4(v18 + v16, v4);
  OUTLINED_FUNCTION_26_4(v18 + v15, v17);
  OUTLINED_FUNCTION_35_3((unint64_t *)((char *)&type metadata for Logger + v18));
  OUTLINED_FUNCTION_324(v19);
  v20 = OUTLINED_FUNCTION_1_1();
  *(_QWORD *)(v20 + 16) = sub_1C2FBEB24;
  *(_QWORD *)(v20 + 24) = v18;
  v29 = sub_1C2FC0008;
  v30 = v20;
  v27 = MEMORY[0x1E0C809B0];
  v28 = 1107296256;
  OUTLINED_FUNCTION_104((uint64_t)sub_1C2FA9034);
  OUTLINED_FUNCTION_40_2();
  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_71_0(v23);
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_12_3(v22);
  OUTLINED_FUNCTION_12_3(v24);
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_15_4();
  OUTLINED_FUNCTION_38_2();
  if ((v0 & 1) != 0)
    __break(1u);
  else
    OUTLINED_FUNCTION_27();
}

void sub_1C2FBCAE8()
{
  NSObject *v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  os_log_type_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_30_1();
  v2 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_185();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_34_1();
  OUTLINED_FUNCTION_158();
  sub_1C2FC231C();
  if (v4)
  {
    MEMORY[0x1E0C80A78](v4);
    v5 = objc_allocWithZone((Class)sub_1C2FC9534());
    OUTLINED_FUNCTION_69_0();
    v6 = (void *)sub_1C2FC94F8();
    if (v6)
    {
      v7 = v6;
      sub_1C2F9D5D0(v6);
      OUTLINED_FUNCTION_135();

    }
    else
    {
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      __swift_project_value_buffer((uint64_t)v2, (uint64_t)qword_1ED7AF5F0);
      OUTLINED_FUNCTION_20_2();
      sub_1C2FC98E8();
      v17 = OUTLINED_FUNCTION_26();
      if (OUTLINED_FUNCTION_119(v2))
      {
        v18 = (uint8_t *)OUTLINED_FUNCTION_1();
        v19 = OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_48_1(v19);
        *(_DWORD *)v18 = 136315138;
        OUTLINED_FUNCTION_24();
        v20 = OUTLINED_FUNCTION_73_0();
        OUTLINED_FUNCTION_9_2(v20);
        OUTLINED_FUNCTION_26_3();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v2, v17, "Failed to create a AnnounceNotificationHandlingStateUpdatedMessage for assistantId %s", v18);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_135();
    }
    goto LABEL_15;
  }
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v8 = __swift_project_value_buffer((uint64_t)v2, (uint64_t)qword_1ED7AF5F0);
  OUTLINED_FUNCTION_45((uint64_t)v0, v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16));
  OUTLINED_FUNCTION_20_2();
  sub_1C2FC98E8();
  v9 = OUTLINED_FUNCTION_43();
  if (!OUTLINED_FUNCTION_306(v9))
  {

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_32_1((uint64_t)v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
LABEL_15:
    OUTLINED_FUNCTION_27();
    return;
  }
  v21 = v9;
  v10 = OUTLINED_FUNCTION_1();
  v22 = OUTLINED_FUNCTION_1();
  *(_DWORD *)v10 = 136315394;
  OUTLINED_FUNCTION_24();
  v11 = OUTLINED_FUNCTION_73_0();
  OUTLINED_FUNCTION_319(v11);
  sub_1C2FC9BA0();
  OUTLINED_FUNCTION_26_3();
  *(_WORD *)(v10 + 12) = 2080;
  v12 = (id)AFExternalNotificationRequestHandlerStateGetName();
  if (v12)
  {
    v13 = v12;
    v14 = sub_1C2FC99F0();

    v16 = OUTLINED_FUNCTION_87(v14, v15, &v22);
    OUTLINED_FUNCTION_320(v16);
    sub_1C2FC9BA0();
    OUTLINED_FUNCTION_39_0();
    OUTLINED_FUNCTION_39(&dword_1C2F94000, v0, v21, "No active session for assistantId: %s, cannot update announce notification handling state: %s", (uint8_t *)v10);
    OUTLINED_FUNCTION_38();
    OUTLINED_FUNCTION_0();
  }
  __break(1u);
}

uint64_t sub_1C2FBCE64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *MEMORY[0x1E0D9E640];
  v12 = sub_1C2FC95DC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v10, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
  sub_1C2FC951C();
  swift_bridgeObjectRetain();
  sub_1C2FC9510();
  v13 = sub_1C2FC8A0C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v7, a4, v13);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v13);
  sub_1C2FC9528();
  return sub_1C2FC9504();
}

void sub_1C2FBCFD0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  os_log_type_t v11;
  uint8_t *v12;

  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v4 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_212(v4, (uint64_t)qword_1ED7AF5F0);
  v5 = a3;
  v6 = sub_1C2FC98E8();
  v7 = sub_1C2FC9B04();
  if (OUTLINED_FUNCTION_119(v6))
  {
    v8 = OUTLINED_FUNCTION_1();
    v9 = (_QWORD *)OUTLINED_FUNCTION_1();
    *(_DWORD *)v8 = 138412546;
    v10 = v5;
    OUTLINED_FUNCTION_251();
    *v9 = v5;

    *(_WORD *)(v8 + 12) = 1024;
    sub_1C2FC9BA0();
    _os_log_impl(&dword_1C2F94000, v6, v7, "Received MultiUserInfo command: %@, isRMVEnabled=%{BOOL}d", (uint8_t *)v8, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF5D0);
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_0();
  }

  sub_1C2FC98E8();
  v11 = OUTLINED_FUNCTION_26();
  if (os_log_type_enabled(v6, v11))
  {
    v12 = (uint8_t *)OUTLINED_FUNCTION_1();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1C2F94000, v6, v11, "Ignoring MultiUserInfo on this device platform", v12, 2u);
    OUTLINED_FUNCTION_0();
  }

}

void sub_1C2FBD220()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  OUTLINED_FUNCTION_30_1();
  v2 = v1;
  v4 = v3;
  v5 = OUTLINED_FUNCTION_93();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_98();
  sub_1C2FC231C();
  if (v6)
  {
    OUTLINED_FUNCTION_266();
    v7 = OUTLINED_FUNCTION_233();
    OUTLINED_FUNCTION_326();
    if ((v7 & 1) == 0)
    {
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v8 = OUTLINED_FUNCTION_7();
      v9 = OUTLINED_FUNCTION_38_0(v8, (uint64_t)qword_1ED7AF5F0);
      v10 = sub_1C2FC9B10();
      if (os_log_type_enabled(v9, v10))
      {
        v11 = (uint8_t *)OUTLINED_FUNCTION_1();
        v21 = OUTLINED_FUNCTION_1();
        *(_DWORD *)v11 = 136315138;
        OUTLINED_FUNCTION_266();
        v12 = OUTLINED_FUNCTION_356();
        OUTLINED_FUNCTION_326();
        v14 = OUTLINED_FUNCTION_170(v12, v13, &v21);
        OUTLINED_FUNCTION_254(v14);
        sub_1C2FC9BA0();
        OUTLINED_FUNCTION_7_1();
        OUTLINED_FUNCTION_25_4(&dword_1C2F94000, v9, v10, "Current session is not of type %s, cannot start speech request", v11);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_124();
    }
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v15 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v15, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v16 = OUTLINED_FUNCTION_365();
    if (os_log_type_enabled(v0, v16))
    {
      v17 = (uint8_t *)OUTLINED_FUNCTION_1();
      v18 = OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_48_1(v18);
      *(_DWORD *)v17 = 136315394;
      OUTLINED_FUNCTION_33_1();
      v19 = sub_1C2FC4294(v4, v2, &v21);
      OUTLINED_FUNCTION_319(v19);
      sub_1C2FC9BA0();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_283();
      OUTLINED_FUNCTION_24();
      v20 = OUTLINED_FUNCTION_73_0();
      OUTLINED_FUNCTION_320(v20);
      sub_1C2FC9BA0();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_39(&dword_1C2F94000, v0, v16, "No active session for assistantId: %s cannot start a request for request id: %s", v17);
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_46();
  }
  OUTLINED_FUNCTION_27();
}

id RequestDispatcher.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void RequestDispatcher.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void RequestDispatcher.__deallocating_deinit()
{
  void *v0;
  objc_super v1;

  v1.receiver = v0;
  v1.super_class = (Class)type metadata accessor for RequestDispatcher();
  objc_msgSendSuper2(&v1, sel_dealloc);
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_1C2FBD6C0(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t sub_1C2FBD6C8(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

BOOL sub_1C2FBD6D8(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1C2FBD6E4(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

uint64_t sub_1C2FBD6F0(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1C2FBD700(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1C2FBD734()
{
  sub_1C2FC9720();
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

void sub_1C2FBD778()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *isUniquelyReferenced_nonNull_native;

  v1 = *v0;
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native)
    *v0 = (uint64_t)sub_1C2FBD88C(isUniquelyReferenced_nonNull_native, *(_QWORD *)(v1 + 16) + 1, 1, v1, &qword_1ED7AEF70, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_1C2FBDC7C, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1C2FBE08C);
  OUTLINED_FUNCTION_31();
}

uint64_t sub_1C2FBD7D4(uint64_t result)
{
  _QWORD *v1;

  if (result + 1 > *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
    return sub_1C2FC9AE0();
  return result;
}

_QWORD *sub_1C2FBD800(_QWORD *result)
{
  uint64_t *v1;
  unint64_t v2;

  v2 = *(_QWORD *)(*v1 + 24);
  if ((uint64_t)result + 1 > (uint64_t)(v2 >> 1))
  {
    result = sub_1C2FBD88C((_QWORD *)(v2 > 1), (int64_t)result + 1, 1, *v1, &qword_1ED7AEF70, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_1C2FBDC7C, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1C2FBE08C);
    *v1 = (uint64_t)result;
  }
  return result;
}

_QWORD *sub_1C2FBD854(_QWORD *a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_1C2FBD88C(a1, a2, a3, a4, &qword_1ED7AF580, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_1C2FBDB68, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1C2FBE008);
}

_QWORD *sub_1C2FBD870(_QWORD *a1, int64_t a2, char a3, uint64_t a4)
{
  return sub_1C2FBD88C(a1, a2, a3, a4, &qword_1ED7AEF70, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_1C2FBDC7C, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1C2FBE08C);
}

_QWORD *sub_1C2FBD88C(_QWORD *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD, uint64_t, _QWORD *, uint64_t), void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  char v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  _QWORD *v17;

  v10 = (char)result;
  if ((a3 & 1) != 0)
  {
    v11 = *(_QWORD *)(a4 + 24);
    v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v12 = a2;
    }
  }
  else
  {
    v12 = a2;
  }
  v13 = *(_QWORD *)(a4 + 16);
  if (v12 <= v13)
    v14 = *(_QWORD *)(a4 + 16);
  else
    v14 = v12;
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v15 = (_QWORD *)swift_allocObject();
    v16 = _swift_stdlib_malloc_size(v15);
    v15[2] = v13;
    v15[3] = 2 * ((uint64_t)(v16 - 32) / 16);
  }
  else
  {
    v15 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v17 = v15 + 4;
  if ((v10 & 1) != 0)
  {
    a7(a4 + 32, v13, v17);
    *(_QWORD *)(a4 + 16) = 0;
    OUTLINED_FUNCTION_22();
  }
  else
  {
    a6(0, v13, v17, a4);
  }
  return v15;
}

char *sub_1C2FBD980(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF590);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1C2FBE0EC((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C2FBDD70(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_1C2FBDA74(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF588);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1C2FBE174((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C2FBDE8C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1C2FBDB68(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF480);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1C2FC9C6C();
  __break(1u);
  return result;
}

uint64_t sub_1C2FBDC7C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_1C2FC9C6C();
  __break(1u);
  return result;
}

uint64_t sub_1C2FBDD70(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF4D8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1C2FC9C6C();
  __break(1u);
  return result;
}

uint64_t sub_1C2FBDE8C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 56 * a1 + 32;
    v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF4D0);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1C2FC9C6C();
  __break(1u);
  return result;
}

char *sub_1C2FBDFAC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    OUTLINED_FUNCTION_291();
    __src = (char *)OUTLINED_FUNCTION_197();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

char *sub_1C2FBE008(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C2FC9C6C();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_1C2FBE08C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_291();
    __src = (char *)OUTLINED_FUNCTION_197();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_1C2FBE0EC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C2FC9C6C();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

char *sub_1C2FBE174(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C2FC9C6C();
    __break(1u);
  }
  else if (__dst != __src || &__src[56 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 56 * a2);
  }
  return __src;
}

_BYTE **sub_1C2FBE200(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_1C2FBE210()
{
  return sub_1C2FC9BA0();
}

uint64_t sub_1C2FBE234(void *a1)
{
  return sub_1C2FBE29C(a1, (SEL *)&selRef_encodedClassName);
}

uint64_t sub_1C2FBE240(void *a1)
{
  return sub_1C2FBE29C(a1, (SEL *)&selRef_aceId);
}

void sub_1C2FBE24C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_1C2FC99E4();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setAceId_, v4);

}

uint64_t sub_1C2FBE29C(void *a1, SEL *a2)
{
  id v2;
  void *v3;

  v2 = objc_msgSend(a1, *a2);
  if (v2)
  {
    v3 = v2;
    sub_1C2FC99F0();

  }
  return OUTLINED_FUNCTION_293();
}

char *sub_1C2FBE2F4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  void *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  char *v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  char *v53;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  __int128 aBlock;
  uint64_t (*v76)(uint64_t);
  void *v77;
  uint64_t (*v78)();
  uint64_t v79;
  __int128 v80[2];
  _QWORD v81[5];

  v62 = a2;
  v5 = *a3;
  v70 = sub_1C2FC990C();
  v69 = *(_QWORD *)(v70 - 8);
  MEMORY[0x1E0C80A78](v70);
  v68 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1C2FC9B40();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1C2FC9B58();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = sub_1C2FC993C();
  v65 = *(_QWORD *)(v66 - 8);
  MEMORY[0x1E0C80A78](v66);
  v73 = (char *)&v55 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_1C2FC98DC();
  v63 = *(_QWORD *)(v67 - 8);
  v13 = MEMORY[0x1E0C80A78](v67);
  v60 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v13);
  v72 = (char *)&v55 - v16;
  v59 = v17;
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v55 - v18;
  v81[3] = v5;
  v81[4] = MEMORY[0x1E0DA4558];
  v61 = a3;
  v81[0] = a3;
  v20 = sub_1C2F9C624();
  v64 = v19;
  v71 = v20;
  sub_1C2FC97EC();
  if (qword_1ED7AE820 != -1)
    swift_once();
  v58 = qword_1ED7AF5D8;
  swift_retain_n();
  swift_unknownObjectRetain();
  v56 = AFDeviceSupportsSiriUOD();
  v55 = AFShouldRunAsrOnServerForUOD();
  v21 = type metadata accessor for UAFAssetSetObserverProvider();
  v22 = swift_allocObject();
  v77 = (void *)v21;
  v78 = (uint64_t (*)())&off_1E7CE09C8;
  *(_QWORD *)&aBlock = v22;
  type metadata accessor for AssetInstrumentationLogger();
  v23 = swift_allocObject();
  v57 = a1;
  v24 = v23;
  sub_1C2F9BD28(0, &qword_1ED7AEF50);
  sub_1C2FC9918();
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0DEF8D8], v8);
  *(_QWORD *)&v80[0] = MEMORY[0x1E0DEE9D8];
  sub_1C2FBFF94(qword_1ED7AEF40, (void (*)(uint64_t))MEMORY[0x1E0DEF810]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEF30);
  sub_1C2FBF9F0(&qword_1ED7AEF38, &qword_1ED7AEF30);
  sub_1C2FC9BDC();
  *(_QWORD *)(v24 + 16) = sub_1C2FC9B7C();
  v25 = v24 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_currentSessionId;
  v26 = sub_1C2FC8A0C();
  __swift_storeEnumTagSinglePayload(v25, 1, 1, v26);
  *(_QWORD *)(v24 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetsForLogging) = 0;
  *(_QWORD *)(v24 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetSetsForLogging) = 0;
  v27 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  v28 = (void *)sub_1C2FC99E4();
  v29 = objc_msgSend(v27, sel_retrieveAssetSet_usages_, v28, 0);

  *(_QWORD *)(v24 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_uafAssetSet) = v29;
  v30 = v58;
  *(_QWORD *)(v24 + 24) = v58;
  *(_BYTE *)(v24 + 32) = v56;
  *(_BYTE *)(v24 + 33) = v55;
  sub_1C2FBFEBC(&aBlock, v24 + OBJC_IVAR____TtC14SiriMessageBus26AssetInstrumentationLogger_assetSetObserverProvider);
  v31 = (void *)objc_opt_self();
  v32 = objc_msgSend(v31, sel_sharedPreferences);
  v33 = objc_msgSend(v31, sel_sharedPreferences);
  sub_1C2FC9888();
  swift_allocObject();
  v34 = sub_1C2FC9894();
  LOBYTE(v29) = sub_1C2FC98A0();
  v35 = (char *)objc_allocWithZone((Class)type metadata accessor for RequestDispatcher());
  v36 = (uint64_t)v61;
  swift_retain();
  v37 = (char *)sub_1C2FBFA24(a1, v30, v24, v32, v34, v36, v29 & 1, v35);
  v38 = v72;
  sub_1C2FC97EC();
  v39 = *(void **)&v37[OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue];
  v40 = v63;
  v41 = v60;
  v42 = v67;
  (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v60, v38, v67);
  sub_1C2FBFFC8((uint64_t)v81, (uint64_t)v80);
  v43 = (*(unsigned __int8 *)(v40 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
  v44 = (v59 + v43 + 7) & 0xFFFFFFFFFFFFFFF8;
  v45 = (v44 + 47) & 0xFFFFFFFFFFFFFFF8;
  v46 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v40 + 32))(v46 + v43, v41, v42);
  sub_1C2FBFEBC(v80, v46 + v44);
  *(_QWORD *)(v46 + v45) = v62;
  *(_QWORD *)(v46 + ((v45 + 15) & 0xFFFFFFFFFFFFFFF8)) = v37;
  v78 = sub_1C2FBFF50;
  v79 = v46;
  *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v76 = sub_1C2FA8FF0;
  v77 = &block_descriptor_387;
  v47 = _Block_copy(&aBlock);
  v48 = v39;
  v49 = v73;
  sub_1C2FC9924();
  v74 = MEMORY[0x1E0DEE9D8];
  sub_1C2FBFF94(qword_1ED7AEEF0, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF10);
  sub_1C2FBF9F0(&qword_1ED7AEF20, (uint64_t *)&unk_1ED7AEF10);
  v50 = v68;
  v51 = v70;
  sub_1C2FC9BDC();
  MEMORY[0x1C3BD0204](0, v49, v50, v47);
  _Block_release(v47);

  (*(void (**)(char *, uint64_t))(v69 + 8))(v50, v51);
  (*(void (**)(char *, uint64_t))(v65 + 8))(v49, v66);
  v52 = *(void (**)(char *, uint64_t))(v40 + 8);
  v52(v72, v42);
  swift_release();
  v53 = v64;
  sub_1C2FC97D4();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v81);
  v52(v53, v42);
  return v37;
}

uint64_t sub_1C2FBEB18()
{
  uint64_t v0;

  return sub_1C2FAB7E8(*(uint64_t **)(v0 + 16));
}

void sub_1C2FBEB2C()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_31();
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

uint64_t sub_1C2FBEB60()
{
  uint64_t v0;

  return sub_1C2FABAA4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(uint64_t **)(v0 + 40));
}

uint64_t sub_1C2FBEB74()
{
  uint64_t v0;

  return sub_1C2FABE10(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(BOOL **)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
}

uint64_t sub_1C2FBEB8C()
{
  uint64_t v0;

  return sub_1C2FAC2B8(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

void sub_1C2FBEBA4()
{
  sub_1C2FBEC20((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1C2FAC96C);
}

void sub_1C2FBEBB8()
{
  sub_1C2FBEEBC();
}

void sub_1C2FBEBCC()
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

  v1 = OUTLINED_FUNCTION_173();
  sub_1C2FAD784(v1, v2, v3, v4, v5, v6, v7, v8, *(_BYTE *)(v0 + 80), *(_QWORD *)(v0 + 88));
  OUTLINED_FUNCTION_58_0();
}

uint64_t sub_1C2FBEC00()
{
  uint64_t v0;

  return sub_1C2FAEB1C(*(_BYTE **)(v0 + 16));
}

void sub_1C2FBEC14()
{
  sub_1C2FBEC20((void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1C2FAEF78);
}

void sub_1C2FBEC20(void (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  a1(v1[3], v1[4], v1[5], v1[6], v1[7]);
  OUTLINED_FUNCTION_31();
}

uint64_t sub_1C2FBEC54()
{
  uint64_t v0;

  return sub_1C2FAF4AC(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1C2FBEC64()
{
  return sub_1C2FB001C();
}

void sub_1C2FBEC7C()
{
  sub_1C2FBEE6C();
}

void sub_1C2FBEC90()
{
  uint64_t v0;

  sub_1C2FB1C38(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(unsigned __int8 *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88));
  OUTLINED_FUNCTION_346();
}

void sub_1C2FBECD4()
{
  OUTLINED_FUNCTION_195();
  sub_1C2FB2844();
  OUTLINED_FUNCTION_31();
}

void sub_1C2FBECFC()
{
  sub_1C2FB324C();
  OUTLINED_FUNCTION_31();
}

uint64_t sub_1C2FBED30()
{
  OUTLINED_FUNCTION_173();
  return sub_1C2FB3924();
}

void sub_1C2FBED48()
{
  sub_1C2FBED68();
}

void sub_1C2FBED5C()
{
  sub_1C2FBED68();
}

void sub_1C2FBED68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);

  OUTLINED_FUNCTION_287();
  v3(v0, v1, v2);
  OUTLINED_FUNCTION_58_0();
}

void sub_1C2FBED9C()
{
  uint64_t v0;
  __n128 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = OUTLINED_FUNCTION_287();
  sub_1C2FB70D0(v2, v3, v4, v5, v6, v7, v8, v9, v1.n128_i64[0], v1.n128_i64[1], *(_QWORD *)(v0 + 96));
  OUTLINED_FUNCTION_58_0();
}

void sub_1C2FBEDCC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = OUTLINED_FUNCTION_173();
  sub_1C2FB7C58(v1, v2, v3, v4, v5, v6, v7, v8, v0[10], v0[11], v0[12], v0[13]);
  OUTLINED_FUNCTION_346();
}

void sub_1C2FBEE00()
{
  sub_1C2FBEE34();
}

void sub_1C2FBEE14()
{
  sub_1C2FBEE6C();
}

void sub_1C2FBEE28()
{
  sub_1C2FBEE34();
}

void sub_1C2FBEE34()
{
  uint64_t v0;
  void (*v1)(uint64_t);

  v0 = OUTLINED_FUNCTION_317();
  v1(v0);
  OUTLINED_FUNCTION_31();
}

void sub_1C2FBEE60()
{
  sub_1C2FBEE6C();
}

void sub_1C2FBEE6C()
{
  uint64_t v0;
  void (*v1)(uint64_t);

  v0 = OUTLINED_FUNCTION_173();
  v1(v0);
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_1C2FBEE9C()
{
  return sub_1C2FBAD44();
}

void sub_1C2FBEEB0()
{
  sub_1C2FBEEBC();
}

void sub_1C2FBEEBC()
{
  uint64_t v0;
  void (*v1)(uint64_t);

  v0 = OUTLINED_FUNCTION_317();
  v1(v0);
  OUTLINED_FUNCTION_31();
}

void sub_1C2FBEEE4()
{
  OUTLINED_FUNCTION_195();
  sub_1C2FBB934();
  OUTLINED_FUNCTION_58_0();
}

void sub_1C2FBEF20()
{
  OUTLINED_FUNCTION_195();
  sub_1C2FBC2C4();
}

void sub_1C2FBEF74()
{
  sub_1C2FBCAE8();
  OUTLINED_FUNCTION_31();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);

  v1 = OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_32_0();
  v5 = (v3 + v2 + v4) & ~v2;
  v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v7(v0 + v4, v1);
  v7(v0 + v5, v1);
  OUTLINED_FUNCTION_376();
  OUTLINED_FUNCTION_217();
  return OUTLINED_FUNCTION_144();
}

uint64_t sub_1C2FBF01C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_3_0() - 8);
  v2 = *(unsigned __int8 *)(v1 + 80);
  v3 = (v2 + 16) & ~v2;
  v4 = *(_QWORD *)(v1 + 64);
  v5 = (v4 + v2 + v3) & ~v2;
  return sub_1C2FAB438(v0 + v3, v0 + v5, *(_QWORD *)(v0 + ((v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8), *(void (**)(uint64_t))(v0 + ((((v4 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t type metadata accessor for RequestDispatcher()
{
  uint64_t result;

  result = qword_1ED7AF0D8;
  if (!qword_1ED7AF0D8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1C2FBF0B8()
{
  return type metadata accessor for RequestDispatcher();
}

void sub_1C2FBF0C0()
{
  unint64_t v0;

  sub_1C2FBF538();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for RequestDispatcher()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RequestDispatcher.__allocating_init(requestDispatcherServiceHelper:bridgeConnectionListeners:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 264))();
}

uint64_t dispatch thunk of RequestDispatcher.domains()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x138))();
}

uint64_t dispatch thunk of RequestDispatcher.commands(forDomain:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x140))();
}

uint64_t dispatch thunk of RequestDispatcher.implementsCommand(_:forDomain:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x148))();
}

uint64_t dispatch thunk of RequestDispatcher.handleCommand(_:executionContextInfo:reply:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x150))();
}

uint64_t dispatch thunk of RequestDispatcher.cancelRequest(withAssistantId:requestId:reason:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x160))();
}

uint64_t dispatch thunk of RequestDispatcher.requestCompleted(withAssistantId:requestId:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x170))();
}

uint64_t dispatch thunk of RequestDispatcher.startSpeechRequest(withAssistantId:requestId:inputOrigin:location:asrOnServer:requestContextData:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x180))();
}

uint64_t dispatch thunk of RequestDispatcher.sessionExists(forAssistantId:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x190))();
}

uint64_t dispatch thunk of RequestDispatcher.prewarm(withAssistantId:languageCode:prewarmOptions:sharedUserId:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of RequestDispatcher.startSession(withConfiguration:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of RequestDispatcher.endSession(withAssistantId:withDelay:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of RequestDispatcher.startLocalRequest(withAssistantId:requestId:inputOrigin:requestContextData:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of RequestDispatcher.startTestSpeechRequest(withAssistantId:requestId:enableASR:inputOrigin:location:jitContext:overrideModelPath:requestContextData:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of RequestDispatcher.postTestResultCandidate(withAssistantId:requestId:rcId:recognitionSausage:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of RequestDispatcher.postTestResultSelected(withAssistantId:requestId:rcId:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x200))();
}

uint64_t dispatch thunk of RequestDispatcher.startUnderstandingOnServerRequest(withAssistantId:requestId:inputOrigin:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x210))();
}

uint64_t dispatch thunk of RequestDispatcher.startUnderstandingOnServerTextRequest(withAssistantId:requestId:inputOrigin:utterance:requestContextData:)(uint64_t a1)
{
  return OUTLINED_FUNCTION_213(a1);
}

uint64_t dispatch thunk of RequestDispatcher.startTextRequest(withAssistantId:requestId:inputOrigin:utterance:requestContextData:)(uint64_t a1)
{
  return OUTLINED_FUNCTION_213(a1);
}

uint64_t dispatch thunk of RequestDispatcher.startDirectActionRequest(withAssistantId:requestId:inputOrigin:directAction:requestExecutionParameters:requestContextData:)(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_211(a1, a2);
}

uint64_t dispatch thunk of RequestDispatcher.startCorrectionSpeechRequest(withAssistantId:requestId:inputOrigin:utterance:previousUtterance:requestContextData:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x250))();
}

uint64_t dispatch thunk of RequestDispatcher.startSpeechDictationSession(withAssistantId:languageCode:recognitionOnDevice:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x260))();
}

uint64_t dispatch thunk of RequestDispatcher.startSpeechDictationRequest(withAssistantId:requestId:inputOrigin:dictationOptions:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x270))();
}

uint64_t dispatch thunk of RequestDispatcher.startUnderstandingDictationSession(withAssistantId:languageCode:understandingOnDevice:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x280))();
}

uint64_t dispatch thunk of RequestDispatcher.startUnderstandingDictationRequest(withAssistantId:requestId:inputOrigin:dictationOptions:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x290))();
}

uint64_t dispatch thunk of RequestDispatcher.endDictationSession(withAssistantId:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A0))();
}

uint64_t dispatch thunk of RequestDispatcher.pauseDictationRecognition(withAssistantId:requestId:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2A8))();
}

uint64_t dispatch thunk of RequestDispatcher.resumeDictationRecognition(withAssistantId:requestId:prefixText:postfixText:selectedText:)(uint64_t a1, uint64_t a2)
{
  return OUTLINED_FUNCTION_211(a1, a2);
}

uint64_t dispatch thunk of RequestDispatcher.updateVoiceCommandContext(withAssistantId:requestId:prefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2C8))();
}

uint64_t dispatch thunk of RequestDispatcher.announceNotificationHandlingStateUpdated(withAssistantId:toState:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2D8))();
}

uint64_t dispatch thunk of RequestDispatcher.sendMultiUserInfo(withDeviceAssistantId:multiUserInfo:isRMVEnabled:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x2E8))();
}

void sub_1C2FBF538()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED7AF498)
  {
    sub_1C2FC9798();
    v0 = sub_1C2FC9B94();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED7AF498);
  }
}

uint64_t sub_1C2FBF58C(uint64_t a1)
{
  uint64_t *v1;

  return sub_1C2FBCE64(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1C2FBF598()
{
  uint64_t v0;
  __n128 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = OUTLINED_FUNCTION_261();
  return sub_1C2FBC5F8(v2, v3, v4, v5, v6, v7, v8, v9, v1.n128_i64[0], v1.n128_i64[1], *(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96), *(void **)(v0 + 104), *(void **)(v0 + 112), *(void **)(v0 + 120), *(void **)(v0 + 128), *(void **)(v0 + 136));
}

void sub_1C2FBF5D4()
{
  uint64_t v0;
  __n128 v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = OUTLINED_FUNCTION_261();
  sub_1C2FBBC40(v2, v3, v4, v5, v6, v7, v8, v9, v1.n128_i64[0], v1.n128_i64[1], *(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96));
  OUTLINED_FUNCTION_58_0();
}

uint64_t sub_1C2FBF5FC(uint64_t a1)
{
  uint64_t *v1;

  return sub_1C2FBB3FC(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1C2FBF60C()
{
  return sub_1C2FBF624();
}

uint64_t sub_1C2FBF618()
{
  return sub_1C2FBF64C();
}

uint64_t sub_1C2FBF624()
{
  uint64_t (*v0)(void);

  OUTLINED_FUNCTION_260();
  return v0();
}

uint64_t sub_1C2FBF640()
{
  return sub_1C2FBF64C();
}

uint64_t sub_1C2FBF64C()
{
  uint64_t (*v0)(void);

  OUTLINED_FUNCTION_262();
  return v0();
}

uint64_t sub_1C2FBF668()
{
  return sub_1C2FB8D0C();
}

uint64_t sub_1C2FBF678()
{
  return sub_1C2FBF624();
}

void sub_1C2FBF684()
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

  OUTLINED_FUNCTION_322();
  sub_1C2FB5950(v0, v1, v2, v3, v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_1C2FBF6A8(uint64_t a1)
{
  return sub_1C2FBF6C0(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1C2FB5BAC);
}

uint64_t sub_1C2FBF6B4(uint64_t a1)
{
  return sub_1C2FBF6C0(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1C2FB5E00);
}

uint64_t sub_1C2FBF6C0(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_1C2FBF6D8(uint64_t a1)
{
  uint64_t *v1;

  return sub_1C2FB432C(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

uint64_t sub_1C2FBF6EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_260();
  return sub_1C2FB352C(v0, v1, v2, v3, v4, v5, v6);
}

void sub_1C2FBF6FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  OUTLINED_FUNCTION_322();
  sub_1C2FB2DF0(v0, v1, v2, v3, v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_54_0();
}

void sub_1C2FBF71C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  OUTLINED_FUNCTION_262();
  sub_1C2FB2358(v1, v2, v3, v4, v5, v6, v7, *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96), *(void **)(v0 + 104));
  OUTLINED_FUNCTION_346();
}

uint64_t sub_1C2FBF754()
{
  return sub_1C2FB0C40();
}

uint64_t sub_1C2FBF760()
{
  return sub_1C2FBF838((uint64_t (*)(_QWORD, uint64_t))sub_1C2F97598);
}

uint64_t sub_1C2FBF76C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF490);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_1C2FBF7B4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;

  OUTLINED_FUNCTION_262();
  sub_1C2FAFBFC(v1, v2, v3, v4, v5, v6, v7, v0[8], v0[9], v0[10]);
  OUTLINED_FUNCTION_54_0();
}

uint64_t objectdestroy_354Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_227();
  swift_release();
  OUTLINED_FUNCTION_32_1(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_1C2FBF82C()
{
  return sub_1C2FBF838((uint64_t (*)(_QWORD, uint64_t))sub_1C2F97578);
}

uint64_t sub_1C2FBF838(uint64_t (*a1)(_QWORD, uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_59() - 8) + 80);
  return a1(*(_QWORD *)(v1 + 16), v1 + ((v2 + 24) & ~v2));
}

uint64_t sub_1C2FBF874()
{
  return sub_1C2FAF140();
}

void sub_1C2FBF880()
{
  sub_1C2FBF930();
}

uint64_t objectdestroy_313Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_227();
  swift_release();
  OUTLINED_FUNCTION_32_1(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_376();
  OUTLINED_FUNCTION_217();
  return OUTLINED_FUNCTION_144();
}

void sub_1C2FBF8F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_250();
  sub_1C2F975B8(*(_QWORD *)(v0 + 16), v0 + v1, *(_QWORD *)(v0 + v2), *(_QWORD *)(v0 + v2 + 8));
}

void sub_1C2FBF924()
{
  sub_1C2FBF930();
}

void sub_1C2FBF930()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);

  OUTLINED_FUNCTION_260();
  v2(v0, v1);
  OUTLINED_FUNCTION_54_0();
}

uint64_t sub_1C2FBF960(uint64_t a1)
{
  return sub_1C2FBF9A8(a1, MEMORY[0x1E0D9E4E0], MEMORY[0x1E0D9E4D8], MEMORY[0x1E0D9E4F0], MEMORY[0x1E0D9E4E8]);
}

uint64_t sub_1C2FBF984(uint64_t a1)
{
  return sub_1C2FBF9A8(a1, MEMORY[0x1E0D9D658], MEMORY[0x1E0D9D650], MEMORY[0x1E0D9D668], MEMORY[0x1E0D9D660]);
}

#error "1C2FBF9D4: call analysis failed (funcsize=14)"

uint64_t sub_1C2FBF9E0(uint64_t a1)
{
  uint64_t *v1;

  return sub_1C2FACC0C(a1, v1[2], v1[3], v1[4], v1[5], v1[6], v1[7]);
}

void sub_1C2FBF9F0(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_363();
  }
  OUTLINED_FUNCTION_31();
}

id sub_1C2FBFA24(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, int a7, char *a8)
{
  uint64_t v11;
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  objc_class *v31;
  id v32;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  int v41;
  objc_super v42;
  uint64_t v43;
  _QWORD v44[5];
  _QWORD v45[6];

  v35 = a8;
  v41 = a7;
  v39 = a3;
  v40 = a4;
  v37 = a1;
  v38 = a2;
  v11 = sub_1C2FC9B40();
  v12 = (void (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v11);
  v13 = sub_1C2FC9B58();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1C2FC993C();
  MEMORY[0x1E0C80A78](v17);
  v45[3] = sub_1C2FC97C8();
  v45[4] = MEMORY[0x1E0DA4558];
  v45[0] = a6;
  v44[3] = sub_1C2FC9888();
  v44[4] = MEMORY[0x1E0DA46C8];
  v44[0] = a5;
  v36 = OBJC_IVAR___SRDRequestDispatcherInternal_rdmbQueue;
  sub_1C2F9BD28(0, &qword_1ED7AEF50);
  v18 = a8;
  sub_1C2FC9930();
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x1E0DEF8D8], v13);
  v43 = MEMORY[0x1E0DEE9D8];
  sub_1C2FBFF94(qword_1ED7AEF40, v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEF30);
  sub_1C2FBF9F0(&qword_1ED7AEF38, &qword_1ED7AEF30);
  sub_1C2FC9BDC();
  v19 = (void *)sub_1C2FC9B7C();
  *(_QWORD *)&v35[v36] = v19;
  v20 = OBJC_IVAR___SRDRequestDispatcherInternal_aceCommandDispatcher;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF4C8);
  *(_QWORD *)&v18[v20] = sub_1C2FC99A8();
  v21 = (uint64_t)&v18[OBJC_IVAR___SRDRequestDispatcherInternal_sessionUserId];
  v22 = sub_1C2FC9798();
  __swift_storeEnumTagSinglePayload(v21, 1, 1, v22);
  v23 = &v18[OBJC_IVAR___SRDRequestDispatcherInternal_siriInputLocale];
  *(_QWORD *)v23 = 0;
  *((_QWORD *)v23 + 1) = 0;
  v24 = v38;
  *(_QWORD *)&v18[OBJC_IVAR___SRDRequestDispatcherInternal_serviceHelper] = v37;
  *(_QWORD *)&v18[OBJC_IVAR___SRDRequestDispatcherInternal_instrumentationUtil] = v24;
  *(_QWORD *)&v18[OBJC_IVAR___SRDRequestDispatcherInternal_assetLogger] = v39;
  type metadata accessor for Broker();
  swift_allocObject();
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  v25 = v19;
  v26 = sub_1C2F9D53C((uint64_t)v25);
  *(_QWORD *)&v18[OBJC_IVAR___SRDRequestDispatcherInternal_broker] = v26;
  type metadata accessor for MessagePublisher();
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v26;
  *(_QWORD *)&v18[OBJC_IVAR___SRDRequestDispatcherInternal_messagePublisher] = v27;
  type metadata accessor for SessionsManager();
  v28 = v25;
  swift_unownedRetain();
  swift_retain();
  *(_QWORD *)&v18[OBJC_IVAR___SRDRequestDispatcherInternal_sessionsManager] = sub_1C2FC1D38((uint64_t)v28);
  v29 = v40;
  *(_QWORD *)&v18[OBJC_IVAR___SRDRequestDispatcherInternal_afPreferences] = v40;
  sub_1C2FBFFC8((uint64_t)v44, (uint64_t)&v18[OBJC_IVAR___SRDRequestDispatcherInternal_serverFallbackDisablingUtils]);
  sub_1C2FBFFC8((uint64_t)v45, (uint64_t)&v18[OBJC_IVAR___SRDRequestDispatcherInternal_featureChecker]);
  v18[OBJC_IVAR___SRDRequestDispatcherInternal_isMUXEnabled] = v41;
  v30 = v29;

  v31 = (objc_class *)type metadata accessor for RequestDispatcher();
  v42.receiver = v18;
  v42.super_class = v31;
  v32 = objc_msgSendSuper2(&v42, sel_init);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  return v32;
}

uint64_t sub_1C2FBFE44(uint64_t result, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;

  v5 = *a3;
  *(_QWORD *)(v5 + 16) = result + 1;
  v6 = v5 + 16 * result;
  *(_QWORD *)(v6 + 32) = a2;
  *(_QWORD *)(v6 + 40) = a5;
  return result;
}

uint64_t sub_1C2FBFE5C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1C2FBFE6C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1C2FBFE90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1C2FAC52C(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1C2FBFE98()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C2FBFEBC(__int128 *a1, uint64_t a2)
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

uint64_t sub_1C2FBFED4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_32_0();
  v3 = (v2 + v1 + 7) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(uint64_t))(v4 + 8))(v0 + v1);
  __swift_destroy_boxed_opaque_existential_1(v0 + v3);
  swift_bridgeObjectRelease();

  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_1C2FBFF50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_250();
  return sub_1C2FA91E0(v0 + v1, (_QWORD *)(v0 + v2));
}

void sub_1C2FBFF94(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_363();
  }
  OUTLINED_FUNCTION_31();
}

void sub_1C2FBFFC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  OUTLINED_FUNCTION_31();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_isEscapingClosureAtFileLocation();
}

uint64_t OUTLINED_FUNCTION_12_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

BOOL OUTLINED_FUNCTION_14_4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_15_4()
{
  return swift_release();
}

void *OUTLINED_FUNCTION_16_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = a1;
  *(_QWORD *)(v2 - 120) = v1;
  return _Block_copy((const void *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_17_4()
{
  return sub_1C2FC97E0();
}

uint64_t OUTLINED_FUNCTION_19_3()
{
  return sub_1C2FC97EC();
}

void OUTLINED_FUNCTION_21_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_25_4(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_26_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_27_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(a1 + v4, v3, v1);
}

uint64_t OUTLINED_FUNCTION_28_3()
{
  return sub_1C2FC97EC();
}

uint64_t OUTLINED_FUNCTION_32_3()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_33_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_34_2()
{
  return sub_1C2FC97EC();
}

void OUTLINED_FUNCTION_35_3(unint64_t *a1@<X8>)
{
  uint64_t v1;
  unint64_t v2;

  *a1 = v1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
  a1[1] = v2;
}

unint64_t OUTLINED_FUNCTION_37_1()
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

  *(_QWORD *)(v6 - 224) = v3;
  *(_QWORD *)(v6 - 216) = v4;
  *(_QWORD *)(v6 - 208) = v2;
  *(_QWORD *)(v6 - 200) = v1;
  v7 = *(_QWORD *)(v6 - 296);
  *(_QWORD *)(v6 - 192) = v0;
  *(_QWORD *)(v6 - 184) = v7;
  v8 = *(_QWORD *)(v6 - 264);
  *(_QWORD *)(v6 - 176) = *(_QWORD *)(v6 - 288);
  *(_QWORD *)(v6 - 168) = v8;
  *(_QWORD *)(v6 - 160) = v5;
  return sub_1C2F9C624();
}

uint64_t OUTLINED_FUNCTION_38_2()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_40_2()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_41_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_44_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  *(_QWORD *)(v7 - 264) = a7;
  *(_QWORD *)(v7 - 288) = a6;
  *(_QWORD *)(v7 - 296) = a5;
  return swift_getObjectType();
}

BOOL OUTLINED_FUNCTION_46_2(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_50_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1C2FC4294(v1, v0, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_51_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 120) = a1;
  return sub_1C2FC9BA0();
}

void OUTLINED_FUNCTION_52_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

void OUTLINED_FUNCTION_53_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v3 - 240) = v1;
  *(_QWORD *)(v3 - 232) = v2;
  v4 = *(_QWORD *)(v3 - 328);
  *(_QWORD *)(v3 - 224) = *(_QWORD *)(v3 - 344);
  *(_QWORD *)(v3 - 216) = v4;
  v5 = *(_QWORD *)(v3 - 304);
  *(_QWORD *)(v3 - 208) = *(_QWORD *)(v3 - 320);
  *(_QWORD *)(v3 - 200) = v5;
  v6 = *(_QWORD *)(v3 - 288);
  *(_QWORD *)(v3 - 192) = *(_QWORD *)(v3 - 296);
  *(_QWORD *)(v3 - 184) = v6;
  v7 = *(_QWORD *)(v3 - 312);
  *(_QWORD *)(v3 - 176) = v0;
  *(_QWORD *)(v3 - 168) = v7;
  *(_QWORD *)(v3 - 160) = *(_QWORD *)(v3 - 336);
}

uint64_t OUTLINED_FUNCTION_54_1()
{
  return sub_1C2FC97F8();
}

uint64_t OUTLINED_FUNCTION_57_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v1 - 256) = a1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v5, v4, v2);
}

uint64_t OUTLINED_FUNCTION_59_1(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_60_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  *(_QWORD *)(v7 - 288) = a7;
  *(_QWORD *)(v7 - 296) = a6;
  *(_QWORD *)(v7 - 304) = a5;
  *(_QWORD *)(v7 - 320) = a4;
  *(_QWORD *)(v7 - 328) = a3;
  *(_QWORD *)(v7 - 344) = a2;
  *(_QWORD *)(v7 - 312) = *(_QWORD *)(v7 + 16);
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_61_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_62_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return sub_1C2FC9BA0();
}

unint64_t OUTLINED_FUNCTION_64_1()
{
  return sub_1C2F9C624();
}

uint64_t OUTLINED_FUNCTION_65_1()
{
  return sub_1C2FC9BA0();
}

BOOL OUTLINED_FUNCTION_66_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_68_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_71_0(NSObject *a1)
{
  void *v1;

  dispatch_sync(a1, v1);
}

uint64_t OUTLINED_FUNCTION_72_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD, uint64_t, uint64_t);

  return v3(*(_QWORD *)(a1 - 256), v2, v1);
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1C2FC4294(v1, v0, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_80()
{
  return swift_release();
}

void OUTLINED_FUNCTION_82()
{
  const void *v0;

  _Block_release(v0);
}

uint64_t OUTLINED_FUNCTION_83()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_85(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_87(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1C2FC4294(a1, v3, a3);
}

BOOL OUTLINED_FUNCTION_88(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_89(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_90()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_91()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_92()
{
  sub_1C2FB0164();
}

uint64_t OUTLINED_FUNCTION_93()
{
  return sub_1C2FC9720();
}

uint64_t OUTLINED_FUNCTION_99(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1C2FC4294(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_101(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 240) = *(_QWORD *)(result - 8);
  return result;
}

void *OUTLINED_FUNCTION_104@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = a1;
  *(_QWORD *)(v2 - 112) = v1;
  return _Block_copy((const void *)(v2 - 136));
}

void OUTLINED_FUNCTION_106(uint64_t a1@<X8>)
{
  void *v1;

  dispatch_sync(*(dispatch_queue_t *)(a1 - 256), v1);
}

uint64_t OUTLINED_FUNCTION_108()
{
  return swift_release();
}

void OUTLINED_FUNCTION_109(NSObject *a1)
{
  void *v1;

  dispatch_sync(a1, v1);
}

uint64_t OUTLINED_FUNCTION_110(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1C2FC4294(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_112()
{
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_114()
{
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_115()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1C2FC4294(v1, v0, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_117()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 240);
}

void OUTLINED_FUNCTION_118(unint64_t *a1@<X8>)
{
  uint64_t v1;
  unint64_t v2;

  *a1 = v1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
  a1[1] = v2;
}

BOOL OUTLINED_FUNCTION_119(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_121()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_122@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_124()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_125(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_127(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1C2FC4294(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_128()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 248) + 8))(*(_QWORD *)(v0 - 232), *(_QWORD *)(v0 - 216));
}

uint64_t OUTLINED_FUNCTION_129()
{
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_130()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 328);
}

void OUTLINED_FUNCTION_131()
{
  uint64_t v0;

}

void OUTLINED_FUNCTION_132(_QWORD *a1)
{
  uint64_t *v1;

  sub_1C2FBF9F0(a1, v1);
}

uint64_t OUTLINED_FUNCTION_133()
{
  return sub_1C2FC9BDC();
}

uint64_t OUTLINED_FUNCTION_135()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_136()
{
  return swift_unknownObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_138()
{
  return sub_1C2FC990C();
}

_QWORD *OUTLINED_FUNCTION_140(_QWORD *a1, uint64_t a2)
{
  return __swift_project_boxed_opaque_existential_1(a1, a2);
}

uint64_t OUTLINED_FUNCTION_141()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_142()
{
  return sub_1C2FC15BC();
}

uint64_t OUTLINED_FUNCTION_144()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_145()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_146(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_147()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_148()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_150()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_151(uint64_t a1@<X8>)
{

}

uint64_t OUTLINED_FUNCTION_152()
{
  return swift_bridgeObjectRetain();
}

unint64_t OUTLINED_FUNCTION_153()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v6 - 192) = v0;
  *(_QWORD *)(v6 - 184) = v1;
  *(_QWORD *)(v6 - 176) = v3;
  *(_QWORD *)(v6 - 168) = v5;
  *(_QWORD *)(v6 - 160) = v4;
  *(_BYTE *)(v6 - 152) = v2;
  return sub_1C2F9C624();
}

uint64_t OUTLINED_FUNCTION_154()
{
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_158()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_160(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1C2FC4294(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_161()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_162()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1C2FC4294(v1, v0, (uint64_t *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_163()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_164(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_165(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1C2FC4294(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_167()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_170(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1C2FC4294(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_171()
{
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_173()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

void *OUTLINED_FUNCTION_175@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = a1;
  *(_QWORD *)(v2 - 144) = v1;
  return _Block_copy((const void *)(v2 - 168));
}

uint64_t OUTLINED_FUNCTION_177(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = a1;
  return v1 - 112;
}

void OUTLINED_FUNCTION_178()
{
  sub_1C2FC231C();
}

uint64_t OUTLINED_FUNCTION_180(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

void OUTLINED_FUNCTION_181(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v1;
  a1[1] = v2 - 208;
}

uint64_t OUTLINED_FUNCTION_182()
{
  return swift_release();
}

void OUTLINED_FUNCTION_183(unint64_t *a1@<X8>)
{
  uint64_t v1;
  unint64_t v2;

  *a1 = v1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
  a1[1] = v2;
}

uint64_t OUTLINED_FUNCTION_186@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 224));
}

uint64_t OUTLINED_FUNCTION_188()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_190()
{
  return sub_1C2FC97EC();
}

uint64_t OUTLINED_FUNCTION_193()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_194@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_195()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t OUTLINED_FUNCTION_196@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_197()
{
  return sub_1C2FC9C6C();
}

uint64_t OUTLINED_FUNCTION_198()
{
  return sub_1C2FC9B04();
}

uint64_t OUTLINED_FUNCTION_199(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(a1 + 16) = v1;
  return a1 + v2;
}

uint64_t OUTLINED_FUNCTION_201()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 152) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_202(void *a1)
{
  return sub_1C2F9D5D0(a1);
}

void OUTLINED_FUNCTION_203(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  *(_QWORD *)(v7 - 304) = a7;
  *(_QWORD *)(v7 - 312) = a6;
}

uint64_t OUTLINED_FUNCTION_204@<X0>(uint64_t a1@<X8>)
{
  return *(_QWORD *)(a1 - 256);
}

uint64_t OUTLINED_FUNCTION_205()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_206()
{
  return sub_1C2FC99F0();
}

void OUTLINED_FUNCTION_208()
{
  sub_1C2FC2748();
}

uint64_t OUTLINED_FUNCTION_209(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_210()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 144) = v2;
  *(_QWORD *)(v5 - 136) = v1;
  *(_QWORD *)(v5 - 128) = v0;
  *(_QWORD *)(v5 - 120) = v4;
  *(_QWORD *)(v5 - 112) = v3;
  *(_BYTE *)(v5 - 104) = *(_DWORD *)(v5 - 180);
  return 0;
}

uint64_t OUTLINED_FUNCTION_211(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, a2);
}

uint64_t OUTLINED_FUNCTION_212(uint64_t a1, uint64_t a2)
{
  return __swift_project_value_buffer(a1, a2);
}

uint64_t OUTLINED_FUNCTION_213(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);

  return v1(a1);
}

uint64_t OUTLINED_FUNCTION_216@<X0>(uint64_t a1@<X8>)
{
  return (*(uint64_t (**)(void))(a1 - 256))();
}

void OUTLINED_FUNCTION_219(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 - 256) = v1;
}

uint64_t OUTLINED_FUNCTION_221@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 280) = a1;
  return v1;
}

void OUTLINED_FUNCTION_223()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 - 304);
  *(_QWORD *)(v1 - 208) = *(_QWORD *)(v1 - 312);
  *(_QWORD *)(v1 - 200) = v2;
  *(_QWORD *)(v1 - 192) = v0;
}

uint64_t OUTLINED_FUNCTION_224()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_228()
{
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_230(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 168) = result;
  return result;
}

void OUTLINED_FUNCTION_231()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_232@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_233()
{
  return sub_1C2FC15BC();
}

uint64_t OUTLINED_FUNCTION_234()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_235(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = a1;
  return v1 - 112;
}

void OUTLINED_FUNCTION_236()
{
  sub_1C2FC231C();
}

uint64_t OUTLINED_FUNCTION_238(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 120) = a1;
  return v1 - 120;
}

BOOL OUTLINED_FUNCTION_239@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_240()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_241()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_242()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 176));
}

uint64_t OUTLINED_FUNCTION_243()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_244()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_245()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_246()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(v2, v3, v0);
}

uint64_t OUTLINED_FUNCTION_247()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_248()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(v1, v3, v0);
}

uint64_t OUTLINED_FUNCTION_249()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_251()
{
  return sub_1C2FC9BA0();
}

void OUTLINED_FUNCTION_252(uint64_t a1@<X5>, uint64_t a2@<X6>, uint64_t a3@<X7>, uint64_t a4@<X8>)
{
  uint64_t v4;

  *(_QWORD *)(a4 - 256) = a3;
  *(_QWORD *)(v4 - 312) = a2;
  *(_QWORD *)(v4 - 320) = a1;
}

uint64_t OUTLINED_FUNCTION_254(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_255(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

__n128 OUTLINED_FUNCTION_261()
{
  uint64_t v0;

  return *(__n128 *)(v0 + 72);
}

uint64_t OUTLINED_FUNCTION_263()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 176) + 8))(v0, *(_QWORD *)(v1 - 168));
}

uint64_t OUTLINED_FUNCTION_264()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_265()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(v3, v0, v1);
}

uint64_t OUTLINED_FUNCTION_266()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v2, v0, v1);
}

uint64_t OUTLINED_FUNCTION_267(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 104))(v2, a2, v4);
}

uint64_t OUTLINED_FUNCTION_268()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1C2FC4294(v0, v1, (uint64_t *)(v2 - 128));
}

uint64_t OUTLINED_FUNCTION_269()
{
  return sub_1C2FC9714();
}

uint64_t OUTLINED_FUNCTION_273()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_274()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_275(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 64) |= v1;
}

uint64_t OUTLINED_FUNCTION_278()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_279()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 248) + 8))(v0, *(_QWORD *)(v1 - 240));
}

uint64_t OUTLINED_FUNCTION_280()
{
  return sub_1C2FC99F0();
}

uint64_t OUTLINED_FUNCTION_281(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = result;
  return result;
}

void OUTLINED_FUNCTION_283()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2080;
}

uint64_t OUTLINED_FUNCTION_284@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return sub_1C2FC9624();
}

void OUTLINED_FUNCTION_285(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v1;
  a1[1] = v2 - 256;
}

__n128 OUTLINED_FUNCTION_287()
{
  __n128 *v0;

  return v0[5];
}

uint64_t OUTLINED_FUNCTION_288(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1C2FC4294(a1, a2, (uint64_t *)(v2 - 136));
}

uint64_t OUTLINED_FUNCTION_290()
{
  return sub_1C2FC98E8();
}

uint64_t OUTLINED_FUNCTION_292()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_293()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_295(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_296()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_297()
{
  uint64_t v0;

  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_298()
{
  return sub_1C2FC9684();
}

uint64_t OUTLINED_FUNCTION_299()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_300(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_301(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 144) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_303()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_304()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_305()
{
  return sub_1C2FC98E8();
}

BOOL OUTLINED_FUNCTION_306(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_307()
{
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_308()
{
  return sub_1C2FC9924();
}

uint64_t OUTLINED_FUNCTION_309()
{
  return sub_1C2FC8A00();
}

uint64_t OUTLINED_FUNCTION_310()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_311()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_312()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_313()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_314(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, _QWORD, uint64_t);
  uint64_t v3;

  return v2(a1, *(_QWORD *)(v3 - 152), v1);
}

uint64_t OUTLINED_FUNCTION_315@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = a1;
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_316(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = result;
  *(_QWORD *)(v1 - 264) = *(_QWORD *)(result - 8);
  return result;
}

uint64_t OUTLINED_FUNCTION_317()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t OUTLINED_FUNCTION_318(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = a1;
  return v1 - 136;
}

uint64_t OUTLINED_FUNCTION_319(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_320(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

void OUTLINED_FUNCTION_321()
{
  JUMPOUT(0x1C3BD0204);
}

uint64_t OUTLINED_FUNCTION_323()
{
  return sub_1C2FC9924();
}

void OUTLINED_FUNCTION_324(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *a1 = v1;
  a1[1] = v2 - 192;
}

uint64_t OUTLINED_FUNCTION_325()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(v2, v0);
}

uint64_t OUTLINED_FUNCTION_326()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_327()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_328()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_329()
{
  return sub_1C2FC8B08();
}

uint64_t OUTLINED_FUNCTION_330(void *a1)
{
  return sub_1C2F9D5D0(a1);
}

void OUTLINED_FUNCTION_331(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 288) = a1;
}

void OUTLINED_FUNCTION_332(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 336) = a1;
}

void OUTLINED_FUNCTION_333(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 328) = a1;
}

uint64_t OUTLINED_FUNCTION_334()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 256);
}

unint64_t OUTLINED_FUNCTION_335@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 160) = *(_QWORD *)(a1 - 256);
  return sub_1C2F9C624();
}

uint64_t OUTLINED_FUNCTION_336()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_338()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 176) = v0;
  *(_QWORD *)(v2 - 168) = v1;
}

void OUTLINED_FUNCTION_341(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_342@<X0>(int a1@<W0>, uint64_t a2@<X8>)
{
  *(_DWORD *)(a2 - 256) = a1;
  return AFShouldRunAsrOnServerForUOD();
}

void OUTLINED_FUNCTION_344()
{
  sub_1C2FC231C();
}

uint64_t OUTLINED_FUNCTION_345(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v1, v3);
}

uint64_t OUTLINED_FUNCTION_347()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_348()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_349()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_351@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_356()
{
  return sub_1C2FC9714();
}

uint64_t OUTLINED_FUNCTION_357(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_1C2FC4294(a1 & 0xFFFFFFFFFFFFLL | 0xD000000000000000, a2, a3);
}

uint64_t OUTLINED_FUNCTION_358@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_359()
{
  return sub_1C2FC9C30();
}

void OUTLINED_FUNCTION_362(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_1C2F9BD60(v2, a2);
}

void OUTLINED_FUNCTION_363()
{
  JUMPOUT(0x1C3BD07B0);
}

uint64_t OUTLINED_FUNCTION_365()
{
  return sub_1C2FC9B1C();
}

uint64_t OUTLINED_FUNCTION_366()
{
  uint64_t v0;

  return v0 - 120;
}

uint64_t OUTLINED_FUNCTION_367()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_368()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_370()
{
  return sub_1C2FC95F4();
}

uint64_t OUTLINED_FUNCTION_371()
{
  return sub_1C2FC97C8();
}

uint64_t OUTLINED_FUNCTION_372(void *a1)
{
  return sub_1C2F9D5D0(a1);
}

uint64_t OUTLINED_FUNCTION_374(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1C2FC4294(a1, a2, (uint64_t *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_375()
{
  return sub_1C2FC975C();
}

uint64_t OUTLINED_FUNCTION_376()
{
  return swift_bridgeObjectRelease();
}

BOOL sub_1C2FC1538(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1C2FC1544(unsigned __int8 a1, unsigned __int8 a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v3 = sub_1C2F97160(a1);
  v5 = v4;
  if (v3 == sub_1C2F97160(a2) && v5 == v6)
    v8 = 1;
  else
    v8 = OUTLINED_FUNCTION_0_1();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1C2FC15BC()
{
  char v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_1C2FC9720();
  sub_1C2F9D47C((unint64_t *)&unk_1ED7AF458, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EE78], MEMORY[0x1E0D9EE90]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_3_2();
  if (v5 == v3 && v6 == v4)
    v1 = 1;
  else
    v1 = OUTLINED_FUNCTION_0_1();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_1C2FC1668(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
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
  _QWORD *v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t *v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;

  v4 = v3;
  v42 = a3;
  v7 = sub_1C2FC89D0();
  v40 = *(_QWORD *)(v7 - 8);
  v41 = v7;
  v8 = MEMORY[0x1E0C80A78](v7);
  v38 = (uint64_t)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v39 = (char *)v35 - v10;
  v11 = sub_1C2FC9720();
  v12 = *(_QWORD *)(v11 - 8);
  v36 = v11;
  v37 = v12;
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1C2FC8A0C();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId;
  sub_1C2FC8A00();
  v20 = v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_lastAccessedTime;
  sub_1C2FC89C4();
  v21 = (_QWORD *)(v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_assistantId);
  *v21 = a1;
  v21[1] = a2;
  v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
  v35[0] = v19;
  v35[1] = v15;
  OUTLINED_FUNCTION_1_4((uint64_t)v18, v19, v22);
  v23 = v36;
  OUTLINED_FUNCTION_1_4((uint64_t)v14, v42, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16));
  type metadata accessor for ConversationSession();
  swift_allocObject();
  swift_bridgeObjectRetain();
  *(_QWORD *)(v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_conversationSession) = sub_1C2FA05D8();
  swift_beginAccess();
  v24 = v40;
  v25 = v38;
  v26 = v20;
  v27 = v23;
  v28 = v41;
  OUTLINED_FUNCTION_1_4(v38, v26, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 16));
  v29 = (uint64_t)v39;
  sub_1C2FC89A0();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v28);
  OUTLINED_FUNCTION_1_4(v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_expirationTime, v29, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 32));
  (*(void (**)(char *, _QWORD, uint64_t))(v37 + 104))(v14, *MEMORY[0x1E0D9EE68], v27);
  LOBYTE(v16) = sub_1C2FC15BC();
  OUTLINED_FUNCTION_2_3((uint64_t)v14);
  if ((v16 & 1) != 0)
  {
    v43 = 0;
    v44 = 0xE000000000000000;
    sub_1C2FC9C00();
    swift_bridgeObjectRelease();
    v43 = 0xD00000000000002ALL;
    v44 = 0x80000001C2FCC5E0;
    sub_1C2F9D47C(qword_1ED7AE740, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
    sub_1C2FC9C9C();
    sub_1C2FC9A2C();
    swift_bridgeObjectRelease();
    v30 = v44;
    v31 = (unint64_t *)(v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_transactionName);
    *v31 = v43;
    v31[1] = v30;
    sub_1C2FC9A08();
    v32 = os_transaction_create();
    OUTLINED_FUNCTION_2_3(v42);
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_2_3(v42);
    v32 = 0;
    v33 = (_QWORD *)(v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_transactionName);
    *v33 = 0;
    v33[1] = 0xE000000000000000;
  }
  *(_QWORD *)(v4 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionTransaction) = v32;
  return v4;
}

uint64_t sub_1C2FC19D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v1 = v0 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId;
  v2 = sub_1C2FC8A0C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_4_4();
  swift_unknownObjectRelease();
  v3 = v0 + OBJC_IVAR____TtC14SiriMessageBus7Session_lastAccessedTime;
  v4 = sub_1C2FC89D0();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v0 + OBJC_IVAR____TtC14SiriMessageBus7Session_expirationTime, v4);
  swift_release();
  return v0;
}

uint64_t sub_1C2FC1A9C()
{
  sub_1C2FC19D8();
  return swift_deallocClassInstance();
}

uint64_t OUTLINED_FUNCTION_61_2()
{
  return type metadata accessor for Session();
}

uint64_t type metadata accessor for Session()
{
  uint64_t result;

  result = qword_1ED7AEDD8;
  if (!qword_1ED7AEDD8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1C2FC1B00()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1C2FC8A0C();
  if (v1 <= 0x3F)
  {
    result = sub_1C2FC89D0();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_1C2FC9CA8();
}

uint64_t OUTLINED_FUNCTION_1_4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return sub_1C2FC9A98();
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return swift_bridgeObjectRelease();
}

void sub_1C2FC1BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    OUTLINED_FUNCTION_69_1();
    if ((v3 & 1) != 0)
      OUTLINED_FUNCTION_303();
  }
  OUTLINED_FUNCTION_31();
}

void sub_1C2FC1C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    OUTLINED_FUNCTION_69_1();
    if ((v3 & 1) != 0)
      swift_unknownObjectRetain();
  }
  OUTLINED_FUNCTION_31();
}

void sub_1C2FC1C74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    OUTLINED_FUNCTION_69_1();
    if ((v3 & 1) != 0)
    {
      OUTLINED_FUNCTION_11_0();
      OUTLINED_FUNCTION_303();
    }
  }
  OUTLINED_FUNCTION_31();
}

void sub_1C2FC1CC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16))
  {
    OUTLINED_FUNCTION_69_1();
    if ((v3 & 1) != 0)
      swift_bridgeObjectRetain();
  }
  OUTLINED_FUNCTION_31();
}

uint64_t sub_1C2FC1CF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16) && (sub_1C2FC4980(), (v3 & 1) != 0))
    return swift_retain();
  else
    return 0;
}

uint64_t sub_1C2FC1D38(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  uint64_t v6;

  sub_1C2FC1DA4();
  v3 = v2;
  sub_1C2FC1F04();
  v5 = v4;
  type metadata accessor for SessionsManager();
  v6 = OUTLINED_FUNCTION_367();
  sub_1C2FC2064(a1, v3, v5);
  return v6;
}

void sub_1C2FC1DA4()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;

  v1 = objc_allocWithZone(MEMORY[0x1E0C99EA0]);
  v2 = OUTLINED_FUNCTION_76_0(0xD000000000000013, (uint64_t)"com.apple.assistant");
  if (v2)
  {
    v3 = v2;
    v4 = OUTLINED_FUNCTION_24_3();
    v5 = (uint64_t)OUTLINED_FUNCTION_33_3(v4);

    if (v5 >= 1)
    {
      v6 = OUTLINED_FUNCTION_24_3();
      OUTLINED_FUNCTION_47_3(v6);

      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v7 = OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_38_0(v7, (uint64_t)qword_1ED7AF5F0);
      v8 = OUTLINED_FUNCTION_79_0();
      if (OUTLINED_FUNCTION_6_2(v8))
      {
        v9 = (uint8_t *)OUTLINED_FUNCTION_1();
        *(_DWORD *)v9 = 134218240;
        OUTLINED_FUNCTION_22_4();
        OUTLINED_FUNCTION_17_5();
        OUTLINED_FUNCTION_39(&dword_1C2F94000, 0x80000001C2FCC950, (os_log_type_t)v5, "session expiration changed from default: %ld to: %ld seconds", v9);
        OUTLINED_FUNCTION_0();
      }

    }
  }
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_49_2();
}

void sub_1C2FC1F04()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;

  v1 = objc_allocWithZone(MEMORY[0x1E0C99EA0]);
  v2 = OUTLINED_FUNCTION_76_0(0xD000000000000013, (uint64_t)"com.apple.assistant");
  if (v2)
  {
    v3 = v2;
    v4 = OUTLINED_FUNCTION_24_3();
    v5 = (uint64_t)OUTLINED_FUNCTION_33_3(v4);

    if (v5 >= 1)
    {
      v6 = OUTLINED_FUNCTION_24_3();
      OUTLINED_FUNCTION_47_3(v6);

      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v7 = OUTLINED_FUNCTION_7();
      OUTLINED_FUNCTION_38_0(v7, (uint64_t)qword_1ED7AF5F0);
      v8 = OUTLINED_FUNCTION_79_0();
      if (OUTLINED_FUNCTION_6_2(v8))
      {
        v9 = (uint8_t *)OUTLINED_FUNCTION_1();
        *(_DWORD *)v9 = 134218240;
        OUTLINED_FUNCTION_22_4();
        OUTLINED_FUNCTION_17_5();
        OUTLINED_FUNCTION_39(&dword_1C2F94000, 0x80000001C2FCC920, (os_log_type_t)v5, "session end expiration delay changed from default: %ld to: %ld seconds", v9);
        OUTLINED_FUNCTION_0();
      }

    }
  }
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_49_2();
}

uint64_t sub_1C2FC2064(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_61_2();
  *(_QWORD *)(v3 + 40) = sub_1C2FC99A8();
  OUTLINED_FUNCTION_59();
  sub_1C2FC5D94(&qword_1ED7AF070, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  *(_QWORD *)(v3 + 48) = sub_1C2FC99A8();
  v7 = v3 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_nextExpirationTaskTimeCheck;
  v8 = OUTLINED_FUNCTION_34_3();
  __swift_storeEnumTagSinglePayload(v7, 1, 1, v8);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_expirationScheduleTask) = 0;
  swift_weakInit();
  *(_QWORD *)(v3 + 32) = a1;
  swift_weakAssign();
  OUTLINED_FUNCTION_124();
  *(double *)(v3 + 16) = a2;
  *(double *)(v3 + 24) = a3;
  return v3;
}

uint64_t sub_1C2FC216C()
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF470);
  return sub_1C2FC9B64();
}

double sub_1C2FC21CC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v5;
  uint64_t v6;
  double result;
  uint64_t v8;

  OUTLINED_FUNCTION_34();
  if (*(_QWORD *)(*(_QWORD *)(v2 + 48) + 16))
  {
    OUTLINED_FUNCTION_303();
    sub_1C2FC4B0C(a1);
    if ((v5 & 1) != 0)
    {
      OUTLINED_FUNCTION_68_1();
      OUTLINED_FUNCTION_11();
      v6 = *(_QWORD *)(a1 + OBJC_IVAR____TtC14SiriMessageBus7Session_conversationSession);
      swift_retain();
      swift_release();
      *(_QWORD *)(a2 + 24) = type metadata accessor for ConversationSession();
      sub_1C2FC5D94(&qword_1ED7AF0E8, (uint64_t (*)(uint64_t))type metadata accessor for ConversationSession, (uint64_t)&unk_1C2FCA938);
      *(_QWORD *)(a2 + 32) = v8;
      *(_QWORD *)a2 = v6;
      return result;
    }
    OUTLINED_FUNCTION_11();
  }
  *(_QWORD *)(a2 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

uint64_t sub_1C2FC2294(uint64_t a1)
{
  uint64_t v1;
  char v3;

  OUTLINED_FUNCTION_34();
  if (!*(_QWORD *)(*(_QWORD *)(v1 + 40) + 16))
    return 0;
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_303();
  sub_1C2FC4980();
  if ((v3 & 1) != 0)
    OUTLINED_FUNCTION_68_1();
  else
    a1 = 0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_11();
  return a1;
}

void sub_1C2FC231C()
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
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21[3];
  uint64_t v22;

  OUTLINED_FUNCTION_73_1();
  v4 = OUTLINED_FUNCTION_34_3();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_41_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_34();
  v7 = *(_QWORD *)(v0 + 40);
  OUTLINED_FUNCTION_24();
  swift_bridgeObjectRetain();
  v8 = sub_1C2FC1CF8(v2, v1, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
    sub_1C2FC89C4();
    v9 = v8 + OBJC_IVAR____TtC14SiriMessageBus7Session_lastAccessedTime;
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_71_1(v9);
    swift_endAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v9, v4);
    sub_1C2FC89A0();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    v10 = v8 + OBJC_IVAR____TtC14SiriMessageBus7Session_expirationTime;
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_71_1(v10);
    swift_endAccess();
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v11 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v11, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    OUTLINED_FUNCTION_62_2();
    v12 = sub_1C2FC98E8();
    v13 = sub_1C2FC9B04();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = OUTLINED_FUNCTION_1();
      v21[0] = OUTLINED_FUNCTION_1();
      *(_DWORD *)v14 = 136315394;
      OUTLINED_FUNCTION_59();
      sub_1C2FC5D94((unint64_t *)&unk_1ED7AE740, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      v15 = sub_1C2FC9C9C();
      v22 = sub_1C2FC4294(v15, v16, v21);
      sub_1C2FC9BA0();
      OUTLINED_FUNCTION_47();
      OUTLINED_FUNCTION_11();
      *(_WORD *)(v14 + 12) = 2080;
      OUTLINED_FUNCTION_24();
      v22 = OUTLINED_FUNCTION_58_1();
      sub_1C2FC9BA0();
      OUTLINED_FUNCTION_26_3();
      OUTLINED_FUNCTION_39(&dword_1C2F94000, v12, v13, "Extending session id: %s for assistant id: %s", (uint8_t *)v14);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_47();
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v17 = OUTLINED_FUNCTION_7();
    v18 = __swift_project_value_buffer(v17, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_20_2();
    sub_1C2FC98E8();
    v19 = OUTLINED_FUNCTION_79_0();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)OUTLINED_FUNCTION_1();
      v21[0] = OUTLINED_FUNCTION_1();
      *(_DWORD *)v20 = 136315138;
      OUTLINED_FUNCTION_24();
      v22 = OUTLINED_FUNCTION_58_1();
      sub_1C2FC9BA0();
      OUTLINED_FUNCTION_26_3();
      _os_log_impl(&dword_1C2F94000, v18, v19, "Cannot find session for assistant id: %s", v20, 0xCu);
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
  }
  OUTLINED_FUNCTION_27();
}

void sub_1C2FC2748()
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_23_4();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = OUTLINED_FUNCTION_34_3();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1C2FC9720();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_18_3();
  OUTLINED_FUNCTION_82_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v13 + 16));
  OUTLINED_FUNCTION_61_2();
  OUTLINED_FUNCTION_367();
  swift_bridgeObjectRetain();
  v14 = sub_1C2FC1668(v5, v3, v1);
  OUTLINED_FUNCTION_34();
  v15 = *(_QWORD *)(*(_QWORD *)(v0 + 40) + 16);
  OUTLINED_FUNCTION_34();
  swift_bridgeObjectRetain();
  v16 = swift_retain();
  sub_1C2FC5330(v16, v5, v3, (void (*)(uint64_t))sub_1C2FC5870);
  OUTLINED_FUNCTION_30_4();
  swift_bridgeObjectRelease();
  v17 = v14 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId;
  OUTLINED_FUNCTION_34();
  v18 = swift_retain();
  sub_1C2FC5374(v18, v17);
  OUTLINED_FUNCTION_30_4();
  if (!v15)
  {
    v19 = v14 + OBJC_IVAR____TtC14SiriMessageBus7Session_expirationTime;
    OUTLINED_FUNCTION_34();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v19, v8);
    sub_1C2FC3D08();
    v20 = OUTLINED_FUNCTION_348();
    v21(v20);
  }
  OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_77_0();
  (*(void (**)(uint64_t, uint64_t))(v22 + 16))(v7, v17);
  swift_release();
  OUTLINED_FUNCTION_3_3();
}

void sub_1C2FC2920()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  double v4;
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
  uint64_t v23;
  char *v24;
  void *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  os_log_type_t v34;
  _WORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  os_log_type_t v51;
  _WORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t);
  uint64_t v56;
  uint64_t v57;
  char *v58;
  NSObject *v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  const char *v65;
  os_log_type_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  os_log_type_t v71;
  _WORD *v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t);
  uint64_t v76;
  void (*v77)(char *, char *, uint64_t);
  double v78;
  double v79;
  os_log_type_t v80;
  uint64_t v81;
  void (*v82)(char *, uint64_t, uint64_t);
  uint64_t v83;
  double v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92[6];

  OUTLINED_FUNCTION_23_4();
  v1 = v0;
  v3 = v2;
  v84 = v4;
  v6 = v5;
  v8 = v7;
  v89 = sub_1C2FC9720();
  v87 = *(_QWORD *)(v89 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_31_3();
  v85 = (char *)(v10 - v11);
  MEMORY[0x1E0C80A78](v12);
  v88 = (char *)&v82 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF060);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = OUTLINED_FUNCTION_34_3();
  v83 = *(_QWORD *)(v17 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_31_3();
  v21 = v19 - v20;
  MEMORY[0x1E0C80A78](v22);
  v24 = (char *)&v82 - v23;
  OUTLINED_FUNCTION_34();
  v25 = *(void **)(v1 + 40);
  OUTLINED_FUNCTION_152();
  OUTLINED_FUNCTION_11_0();
  v86 = v8;
  v26 = sub_1C2FC1CF8(v8, v6, (uint64_t)v25);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v90 = v26;
  if (!v26)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v33 = OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_38_0(v33, (uint64_t)qword_1ED7AF5F0);
    v34 = OUTLINED_FUNCTION_26();
    if (OUTLINED_FUNCTION_3(v34))
    {
      v35 = (_WORD *)OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_9_1(v35);
      OUTLINED_FUNCTION_4_5(&dword_1C2F94000, v36, v37, "Cannot find current session to end");
      OUTLINED_FUNCTION_0();
    }

    goto LABEL_48;
  }
  v27 = COERCE_DOUBLE(swift_weakLoadStrong());
  if (v27 == 0.0)
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v49 = OUTLINED_FUNCTION_7();
    v50 = (void *)OUTLINED_FUNCTION_38_0(v49, (uint64_t)qword_1ED7AF5F0);
    v51 = sub_1C2FC9B28();
    if (OUTLINED_FUNCTION_3(v51))
    {
      v52 = (_WORD *)OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_9_1(v52);
      OUTLINED_FUNCTION_4_5(&dword_1C2F94000, v53, v54, "Broker is already deallocated so we just remove sessions");
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_59();
    v55 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998];
    OUTLINED_FUNCTION_61_2();
    sub_1C2FC5D94(&qword_1ED7AF070, v55, MEMORY[0x1E0CB09C8]);
    v56 = sub_1C2FC99A8();
    OUTLINED_FUNCTION_34();
    *(_QWORD *)(v1 + 48) = v56;
    swift_bridgeObjectRelease();
    v57 = sub_1C2FC99A8();
    swift_release();
    *(_QWORD *)(v1 + 40) = v57;
    swift_bridgeObjectRelease();
    goto LABEL_48;
  }
  if ((v3 & 1) != 0 || v84 <= 0.0)
  {
    v84 = v27;
    v38 = v90;
    v39 = *(void (**)(char *, uint64_t, uint64_t))(v87 + 16);
    v39(v88, *(_QWORD *)(v90 + OBJC_IVAR____TtC14SiriMessageBus7Session_conversationSession)+ OBJC_IVAR____TtC14SiriMessageBus19ConversationSession_sessionType, v89);
    v40 = v38 + OBJC_IVAR____TtC14SiriMessageBus7Session_sessionId;
    OUTLINED_FUNCTION_34();
    sub_1C2FC5080(v40);
    OUTLINED_FUNCTION_30_4();
    OUTLINED_FUNCTION_124();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_152();
    sub_1C2FC4F78();
    OUTLINED_FUNCTION_30_4();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_124();
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v41 = OUTLINED_FUNCTION_7();
    v42 = __swift_project_value_buffer(v41, (uint64_t)qword_1ED7AF5F0);
    OUTLINED_FUNCTION_14_5();
    OUTLINED_FUNCTION_62_2();
    OUTLINED_FUNCTION_62_2();
    v83 = v42;
    v43 = sub_1C2FC98E8();
    v44 = sub_1C2FC9B04();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = OUTLINED_FUNCTION_1();
      v92[0] = OUTLINED_FUNCTION_1();
      *(_DWORD *)v45 = 136315650;
      OUTLINED_FUNCTION_59();
      v82 = v39;
      sub_1C2FC5D94((unint64_t *)&unk_1ED7AE740, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      v46 = sub_1C2FC9C9C();
      v91 = sub_1C2FC4294(v46, v47, v92);
      sub_1C2FC9BA0();
      OUTLINED_FUNCTION_47();
      swift_bridgeObjectRelease();
      *(_WORD *)(v45 + 12) = 2080;
      OUTLINED_FUNCTION_152();
      v91 = sub_1C2FC4294(v86, v6, v92);
      sub_1C2FC9BA0();
      OUTLINED_FUNCTION_15_5();
      *(_WORD *)(v45 + 22) = 2048;
      v48 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 16);
      swift_release();
      v91 = v48;
      sub_1C2FC9BA0();
      swift_release();
      _os_log_impl(&dword_1C2F94000, v43, v44, "Remove session id: %s for assistantId: %s, reminding sessions: %ld", (uint8_t *)v45, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_47();
    OUTLINED_FUNCTION_47();
    v58 = v85;
    v59 = v89;
    v39(v85, (uint64_t)v88, v89);
    v60 = (*(uint64_t (**)(char *, NSObject *))(v87 + 88))(v58, v59);
    if ((_DWORD)v60 == *MEMORY[0x1E0D9EE68])
    {
      MEMORY[0x1E0C80A78](v60);
      OUTLINED_FUNCTION_11_2();
      objc_allocWithZone((Class)sub_1C2FC8A60());
      v61 = sub_1C2FC8A54();
      if (!v61)
      {
        OUTLINED_FUNCTION_14_5();
        OUTLINED_FUNCTION_63_0();
        v62 = OUTLINED_FUNCTION_26();
        if (OUTLINED_FUNCTION_14_4(v62))
        {
          v63 = (uint8_t *)OUTLINED_FUNCTION_1();
          v92[0] = OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_8_5(4.8149e-34);
          v64 = OUTLINED_FUNCTION_26_5();
          OUTLINED_FUNCTION_7_4(v64);
          OUTLINED_FUNCTION_15_5();
          v65 = "Cannot create SessionEndedMessage for assistantId: %s";
          goto LABEL_46;
        }
        goto LABEL_49;
      }
LABEL_33:
      v59 = v61;
      sub_1C2F9D5D0(v61);
      swift_release();
LABEL_47:

      OUTLINED_FUNCTION_167();
      (*(void (**)(char *, uint64_t))(v87 + 8))(v88, v89);
      goto LABEL_48;
    }
    if ((_DWORD)v60 == *MEMORY[0x1E0D9EE70])
    {
      MEMORY[0x1E0C80A78](v60);
      OUTLINED_FUNCTION_11_2();
      objc_allocWithZone((Class)sub_1C2FC90C0());
      v61 = sub_1C2FC8A54();
      if (v61)
        goto LABEL_33;
      OUTLINED_FUNCTION_14_5();
      OUTLINED_FUNCTION_63_0();
      v66 = OUTLINED_FUNCTION_26();
      if (OUTLINED_FUNCTION_14_4(v66))
      {
        v63 = (uint8_t *)OUTLINED_FUNCTION_1();
        v92[0] = OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_8_5(4.8149e-34);
        v67 = OUTLINED_FUNCTION_26_5();
        OUTLINED_FUNCTION_7_4(v67);
        OUTLINED_FUNCTION_15_5();
        v65 = "Cannot create EndSpeechDictationSessionMessage for assistantId %s";
        goto LABEL_46;
      }
    }
    else
    {
      if ((_DWORD)v60 != *MEMORY[0x1E0D9EE58])
      {
        OUTLINED_FUNCTION_63_0();
        v71 = OUTLINED_FUNCTION_26();
        if (OUTLINED_FUNCTION_3(v71))
        {
          v72 = (_WORD *)OUTLINED_FUNCTION_1();
          OUTLINED_FUNCTION_9_1(v72);
          OUTLINED_FUNCTION_4_5(&dword_1C2F94000, v73, v74, "Cannot post end session message for unknown session type");
          OUTLINED_FUNCTION_0();
        }
        swift_release();

        OUTLINED_FUNCTION_167();
        v75 = *(void (**)(char *, uint64_t))(v87 + 8);
        v76 = v89;
        v75(v88, v89);
        v75(v58, v76);
        goto LABEL_48;
      }
      MEMORY[0x1E0C80A78](v60);
      OUTLINED_FUNCTION_11_2();
      objc_allocWithZone((Class)sub_1C2FC93FC());
      v61 = sub_1C2FC8A54();
      if (v61)
        goto LABEL_33;
      OUTLINED_FUNCTION_14_5();
      OUTLINED_FUNCTION_63_0();
      v80 = OUTLINED_FUNCTION_26();
      if (OUTLINED_FUNCTION_14_4(v80))
      {
        v63 = (uint8_t *)OUTLINED_FUNCTION_1();
        v92[0] = OUTLINED_FUNCTION_1();
        OUTLINED_FUNCTION_8_5(4.8149e-34);
        v81 = OUTLINED_FUNCTION_26_5();
        OUTLINED_FUNCTION_7_4(v81);
        OUTLINED_FUNCTION_15_5();
        v65 = "Cannot create EndUnderstandingDictationSessionMessage for assistantId %s";
LABEL_46:
        _os_log_impl(&dword_1C2F94000, v59, (os_log_type_t)&v82, v65, v63, 0xCu);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_0();
      }
    }
LABEL_49:
    swift_release();
    OUTLINED_FUNCTION_46();
    goto LABEL_47;
  }
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v28 = OUTLINED_FUNCTION_7();
  __swift_project_value_buffer(v28, (uint64_t)qword_1ED7AF5F0);
  OUTLINED_FUNCTION_14_5();
  v29 = sub_1C2FC98E8();
  v30 = sub_1C2FC9B04();
  v31 = v30;
  if (os_log_type_enabled(v29, v30))
  {
    v32 = OUTLINED_FUNCTION_1();
    v89 = OUTLINED_FUNCTION_1();
    v92[0] = v89;
    *(_DWORD *)v32 = 136315394;
    v87 = v32 + 4;
    OUTLINED_FUNCTION_152();
    v91 = sub_1C2FC4294(v86, v6, v92);
    LODWORD(v88) = v31;
    sub_1C2FC9BA0();
    OUTLINED_FUNCTION_15_5();
    *(_WORD *)(v32 + 12) = 2048;
    v91 = *(_QWORD *)&v84;
    sub_1C2FC9BA0();
    OUTLINED_FUNCTION_39(&dword_1C2F94000, v29, (os_log_type_t)v88, "Asked to endSession for assistantId: %s with a delay of %f seconds, so not ending it now", (uint8_t *)v32);
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_46();
  v68 = v83;
  sub_1C2FC89C4();
  sub_1C2FC89A0();
  OUTLINED_FUNCTION_56_1(v21);
  v69 = v90 + OBJC_IVAR____TtC14SiriMessageBus7Session_expirationTime;
  OUTLINED_FUNCTION_34();
  (*(void (**)(uint64_t, char *, uint64_t))(v68 + 40))(v69, v24, v17);
  OUTLINED_FUNCTION_30_4();
  v70 = v1 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_nextExpirationTaskTimeCheck;
  OUTLINED_FUNCTION_34();
  sub_1C2FC51D8(v70, (uint64_t)v16);
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17))
  {
    sub_1C2FC5220((uint64_t)v16);
  }
  else
  {
    v77 = *(void (**)(char *, char *, uint64_t))(v68 + 16);
    v77(v24, v16, v17);
    sub_1C2FC5220((uint64_t)v16);
    v77((char *)v21, (char *)v69, v17);
    sub_1C2FC89B8();
    v79 = v78;
    OUTLINED_FUNCTION_56_1(v21);
    OUTLINED_FUNCTION_56_1((uint64_t)v24);
    if (v79 > 0.0)
    {
      swift_release();
      OUTLINED_FUNCTION_167();
      goto LABEL_48;
    }
  }
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_expirationScheduleTask))
  {
    swift_retain();
    sub_1C2FC996C();
    swift_release();
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v24, v69, v17);
  sub_1C2FC3D08();
  swift_release();
  OUTLINED_FUNCTION_167();
  OUTLINED_FUNCTION_56_1((uint64_t)v24);
LABEL_48:
  OUTLINED_FUNCTION_3_3();
}

void sub_1C2FC34C4()
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

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AE750);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_23();
  v4 = v3 - v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF400);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_18_3();
  v6 = *MEMORY[0x1E0D9E640];
  v7 = sub_1C2FC95DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v0, v6, v7);
  __swift_storeEnumTagSinglePayload(v0, 0, 1, v7);
  sub_1C2FC957C();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_348();
  sub_1C2FC9570();
  v8 = OUTLINED_FUNCTION_59();
  OUTLINED_FUNCTION_70(v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16));
  __swift_storeEnumTagSinglePayload(v4, 0, 1, v8);
  sub_1C2FC9588();
  OUTLINED_FUNCTION_16_2();
}

void sub_1C2FC35DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v15;
  uint64_t Strong;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  __int128 v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  int64_t v28;
  char *v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int64_t v42;
  double v43;
  double v44;
  void (*v45)(uint64_t, uint64_t);
  char *v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  void *v50;
  os_log_type_t v51;
  _WORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  os_log_type_t v57;
  _WORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[2];
  __int128 v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  int64_t v70;
  int64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74[8];

  OUTLINED_FUNCTION_23_4();
  v2 = v0;
  v3 = OUTLINED_FUNCTION_34_3();
  v64 = *(_QWORD *)(v3 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_41_3();
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v62 - v7;
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v62 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF060);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_23();
  v14 = v13 - v12;
  __swift_storeEnumTagSinglePayload(v13 - v12, 1, 1, v3);
  v15 = v2 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_nextExpirationTaskTimeCheck;
  OUTLINED_FUNCTION_34();
  sub_1C2FC5D3C(v14, v15, &qword_1ED7AF060);
  swift_endAccess();
  *(_QWORD *)(v2 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_expirationScheduleTask) = 0;
  swift_release();
  OUTLINED_FUNCTION_34();
  if (*(_QWORD *)(*(_QWORD *)(v2 + 40) + 16))
  {
    Strong = swift_weakLoadStrong();
    swift_release();
    if (Strong)
    {
      v62[0] = v2 + 40;
      v17 = *(double *)(v2 + 16);
      sub_1C2FC89C4();
      v65 = v8;
      sub_1C2FC89A0();
      v18 = *(_QWORD *)(v2 + 40);
      v19 = *(_QWORD *)(v18 + 64);
      v69 = v18 + 64;
      v20 = 1 << *(_BYTE *)(v18 + 32);
      v21 = -1;
      if (v20 < 64)
        v21 = ~(-1 << v20);
      v22 = v21 & v19;
      v70 = (unint64_t)(v20 + 63) >> 6;
      v72 = v18;
      swift_bridgeObjectRetain();
      v23 = 0;
      *(_QWORD *)&v24 = 136315394;
      v63 = v24;
      v62[1] = MEMORY[0x1E0DEE9B8] + 8;
      v25 = v64;
      v67 = v1;
      v68 = v10;
      while (1)
      {
        if (v22)
        {
          v26 = __clz(__rbit64(v22));
          v22 &= v22 - 1;
          v27 = v26 | (v23 << 6);
        }
        else
        {
          v28 = v23 + 1;
          if (__OFADD__(v23, 1))
          {
            __break(1u);
LABEL_49:
            __break(1u);
            goto LABEL_50;
          }
          v29 = v65;
          if (v28 >= v70)
            goto LABEL_35;
          v30 = *(_QWORD *)(v69 + 8 * v28);
          ++v23;
          if (!v30)
          {
            v23 = v28 + 1;
            if (v28 + 1 >= v70)
              goto LABEL_35;
            v30 = *(_QWORD *)(v69 + 8 * v23);
            if (!v30)
            {
              v23 = v28 + 2;
              if (v28 + 2 >= v70)
                goto LABEL_35;
              v30 = *(_QWORD *)(v69 + 8 * v23);
              if (!v30)
              {
                v31 = v28 + 3;
                if (v31 >= v70)
                {
LABEL_35:
                  swift_release();
                  if (*(_QWORD *)(*(_QWORD *)v62[0] + 16))
                    sub_1C2FC3D08();
                  v48 = *(void (**)(char *, uint64_t))(v25 + 8);
                  v48(v29, v3);
                  v48(v10, v3);
                  goto LABEL_47;
                }
                v30 = *(_QWORD *)(v69 + 8 * v31);
                if (!v30)
                {
                  while (1)
                  {
                    v23 = v31 + 1;
                    if (__OFADD__(v31, 1))
                      goto LABEL_49;
                    if (v23 >= v70)
                      goto LABEL_35;
                    v30 = *(_QWORD *)(v69 + 8 * v23);
                    ++v31;
                    if (v30)
                      goto LABEL_21;
                  }
                }
                v23 = v31;
              }
            }
          }
LABEL_21:
          v22 = (v30 - 1) & v30;
          v27 = __clz(__rbit64(v30)) + (v23 << 6);
        }
        v32 = *(_QWORD *)(v72 + 56);
        v33 = (uint64_t *)(*(_QWORD *)(v72 + 48) + 16 * v27);
        v34 = v33[1];
        v73 = *v33;
        v35 = *(_QWORD *)(v32 + 8 * v27) + OBJC_IVAR____TtC14SiriMessageBus7Session_expirationTime;
        OUTLINED_FUNCTION_34();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16))(v1, v35, v3);
        OUTLINED_FUNCTION_16_0();
        swift_retain();
        if ((sub_1C2FC89AC() & 1) != 0)
        {
          v71 = v23;
          if (qword_1ED7AEDB0 != -1)
            swift_once();
          v36 = OUTLINED_FUNCTION_7();
          __swift_project_value_buffer(v36, (uint64_t)qword_1ED7AF5F0);
          OUTLINED_FUNCTION_20_2();
          OUTLINED_FUNCTION_62_2();
          v37 = sub_1C2FC98E8();
          v38 = sub_1C2FC9B28();
          if (os_log_type_enabled(v37, v38))
          {
            v39 = OUTLINED_FUNCTION_1();
            v66 = OUTLINED_FUNCTION_1();
            v74[0] = v66;
            *(_DWORD *)v39 = v63;
            OUTLINED_FUNCTION_59();
            sub_1C2FC5D94(qword_1ED7AE740, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
            v40 = sub_1C2FC9C9C();
            *(_QWORD *)(v39 + 4) = sub_1C2FC4294(v40, v41, v74);
            OUTLINED_FUNCTION_47();
            OUTLINED_FUNCTION_11();
            *(_WORD *)(v39 + 12) = 2080;
            OUTLINED_FUNCTION_16_0();
            *(_QWORD *)(v39 + 14) = sub_1C2FC4294(v73, v34, v74);
            OUTLINED_FUNCTION_26_3();
            OUTLINED_FUNCTION_39(&dword_1C2F94000, v37, v38, "Session id: %s for assistant Id: %s is expired", (uint8_t *)v39);
            swift_arrayDestroy();
            OUTLINED_FUNCTION_0();
          }

          OUTLINED_FUNCTION_46();
          OUTLINED_FUNCTION_47();
          sub_1C2FC2920();
          OUTLINED_FUNCTION_108();
          swift_bridgeObjectRelease();
          v45 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
          v1 = v67;
          v10 = v68;
          v23 = v71;
LABEL_33:
          v45(v1, v3);
        }
        else
        {
          v42 = v23;
          swift_bridgeObjectRelease();
          sub_1C2FC89B8();
          v44 = v43;
          OUTLINED_FUNCTION_108();
          v45 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
          if (v44 <= 0.0 || v44 >= v17)
            goto LABEL_33;
          v47 = v65;
          v45((uint64_t)v65, v3);
          (*(void (**)(char *, uint64_t, uint64_t))(v25 + 32))(v47, v1, v3);
          v17 = v44;
          v23 = v42;
        }
      }
    }
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v55 = OUTLINED_FUNCTION_7();
    v56 = (void *)OUTLINED_FUNCTION_38_0(v55, (uint64_t)qword_1ED7AF5F0);
    v57 = sub_1C2FC9B28();
    if (OUTLINED_FUNCTION_3(v57))
    {
      v58 = (_WORD *)OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_9_1(v58);
      OUTLINED_FUNCTION_4_5(&dword_1C2F94000, v59, v60, "Broker does not exist anymore so just remove all sessions");
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_61_2();
    *(_QWORD *)(v2 + 40) = sub_1C2FC99A8();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_59();
    sub_1C2FC5D94(&qword_1ED7AF070, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    v61 = sub_1C2FC99A8();
    OUTLINED_FUNCTION_34();
    *(_QWORD *)(v2 + 48) = v61;
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
LABEL_50:
      swift_once();
    v49 = OUTLINED_FUNCTION_7();
    v50 = (void *)OUTLINED_FUNCTION_38_0(v49, (uint64_t)qword_1ED7AF5F0);
    v51 = sub_1C2FC9B04();
    if (OUTLINED_FUNCTION_3(v51))
    {
      v52 = (_WORD *)OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_9_1(v52);
      OUTLINED_FUNCTION_4_5(&dword_1C2F94000, v53, v54, "No active sessions nothing to do...");
      OUTLINED_FUNCTION_0();
    }

  }
LABEL_47:
  OUTLINED_FUNCTION_3_3();
}

void sub_1C2FC3D08()
{
  uint64_t v0;
  double v1;
  double v2;
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[5];
  uint64_t v32;

  OUTLINED_FUNCTION_23_4();
  v2 = v1;
  v27 = v3;
  v4 = sub_1C2FC9954();
  v28 = *(_QWORD *)(v4 - 8);
  v29 = v4;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_31_3();
  v8 = v6 - v7;
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v27 - v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF060);
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_31_3();
  v15 = v13 - v14;
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v27 - v17;
  sub_1C2FC990C();
  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v19);
  OUTLINED_FUNCTION_23();
  v31[4] = sub_1C2FC41AC;
  v32 = v0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 1107296256;
  v31[2] = sub_1C2FC3F9C;
  v31[3] = &block_descriptor_3;
  _Block_copy(v31);
  v30 = MEMORY[0x1E0DEE9D8];
  OUTLINED_FUNCTION_72_1(qword_1ED7AEEF0, v20, MEMORY[0x1E0DEF510]);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AEF10);
  sub_1C2F9D4BC();
  sub_1C2FC9BDC();
  sub_1C2FC9978();
  OUTLINED_FUNCTION_367();
  v21 = sub_1C2FC9960();
  swift_release();
  *(_QWORD *)(v0 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_expirationScheduleTask) = v21;
  swift_retain();
  OUTLINED_FUNCTION_124();
  v22 = OUTLINED_FUNCTION_34_3();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v18, v27, v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, v22);
  sub_1C2FC5D68((uint64_t)v18, v15, &qword_1ED7AF060);
  v23 = v0 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_nextExpirationTaskTimeCheck;
  OUTLINED_FUNCTION_34();
  sub_1C2FC5D3C(v15, v23, &qword_1ED7AF060);
  OUTLINED_FUNCTION_30_4();
  sub_1C2FC9948();
  MEMORY[0x1C3BD0018](v8, v2);
  v24 = v29;
  v25 = *(void (**)(uint64_t))(v28 + 8);
  v26 = OUTLINED_FUNCTION_348();
  v25(v26);
  sub_1C2FC9B4C();
  OUTLINED_FUNCTION_108();
  ((void (*)(char *, uint64_t))v25)(v11, v24);
  OUTLINED_FUNCTION_3_3();
}

uint64_t sub_1C2FC3F9C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1C2FC3FC8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1C2FC5220(v0 + OBJC_IVAR____TtC14SiriMessageBus15SessionsManager_nextExpirationTaskTimeCheck);
  swift_release();
  swift_weakDestroy();
  return v0;
}

uint64_t sub_1C2FC4024()
{
  sub_1C2FC3FC8();
  return swift_deallocClassInstance();
}

uint64_t sub_1C2FC4048()
{
  return type metadata accessor for SessionsManager();
}

uint64_t type metadata accessor for SessionsManager()
{
  uint64_t result;

  result = qword_1ED7AF0C0;
  if (!qword_1ED7AF0C0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1C2FC4088()
{
  unint64_t v0;

  sub_1C2FC4138();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_1C2FC4138()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED7AF068)
  {
    sub_1C2FC89D0();
    v0 = sub_1C2FC9B94();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED7AF068);
  }
}

uint64_t sub_1C2FC418C()
{
  return sub_1C2FC216C();
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

id sub_1C2FC41C8(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  if (a2)
  {
    v3 = (void *)sub_1C2FC99E4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

uint64_t sub_1C2FC4228(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_1C2FC4294(v6, v7, a3);
  v8 = *a1 + 8;
  sub_1C2FC9BA0();
  result = OUTLINED_FUNCTION_11();
  *a1 = v8;
  return result;
}

uint64_t sub_1C2FC4294(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  OUTLINED_FUNCTION_73_1();
  v6 = sub_1C2FC435C(v12, 0, 0, 1, v4, v3);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1C2FA30CC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = v4;
    v12[1] = v3;
    v10 = *a3;
    if (*a3)
    {
      sub_1C2FA30CC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    OUTLINED_FUNCTION_24();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1C2FC435C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_1C2FC44B0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1C2FC9BAC();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_1C2FC4574(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_1C2FC9C24();
    if (!v8)
    {
      result = sub_1C2FC9C48();
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

void *sub_1C2FC44B0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1C2FC9C6C();
  __break(1u);
  return result;
}

uint64_t sub_1C2FC4574(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1C2FC4608(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_1C2FC482C(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_1C2FC482C((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C2FC4608(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_1C2FC9A38();
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
  sub_1C2FC4778(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_1C2FC9C0C();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return v4;
  }
  sub_1C2FC9C6C();
  __break(1u);
LABEL_14:
  result = sub_1C2FC9C48();
  __break(1u);
  return result;
}

void sub_1C2FC4778(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF598);
    v4 = (_QWORD *)swift_allocObject();
    v5 = _swift_stdlib_malloc_size(v4);
    v4[2] = a1;
    v4[3] = 2 * v5 - 64;
  }
  OUTLINED_FUNCTION_31();
}

void sub_1C2FC47D8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v4 = sub_1C2FC9A74();
    OUTLINED_FUNCTION_52_2(v4);
  }
  else
  {
    v3 = MEMORY[0x1C3BD00E4](15, a1 >> 16);
    OUTLINED_FUNCTION_52_2(v3);
  }
  OUTLINED_FUNCTION_31();
}

char *sub_1C2FC482C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF598);
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
    sub_1C2FC4900(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C2F9AC9C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1C2FC4900(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1C2FC9C6C();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_1C2FC4980()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_73_1();
  sub_1C2FC9D08();
  sub_1C2FC9A20();
  v2 = sub_1C2FC9D14();
  return sub_1C2FC4BA4(v1, v0, v2);
}

void sub_1C2FC49E0(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  OUTLINED_FUNCTION_6_1();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EE08];
  sub_1C2FC5D94(&qword_1ED7AF438, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EE08], MEMORY[0x1E0D9EE18]);
  v3 = sub_1C2FC99C0();
  sub_1C2FC4C84(a1, v3, v2, (unint64_t *)&unk_1ED7AF440, MEMORY[0x1E0D9EE20]);
}

void sub_1C2FC4A74(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_1C2FC9798();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EF80];
  sub_1C2FC5D94(&qword_1EF7DBC50, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EF80], MEMORY[0x1E0D9EF90]);
  v3 = sub_1C2FC99C0();
  sub_1C2FC4C84(a1, v3, v2, &qword_1EF7DBC58, MEMORY[0x1E0D9EF98]);
}

void sub_1C2FC4B0C(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_1C2FC8A0C();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998];
  sub_1C2FC5D94(&qword_1ED7AF070, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v3 = sub_1C2FC99C0();
  sub_1C2FC4C84(a1, v3, v2, (unint64_t *)&unk_1ED7AF078, MEMORY[0x1E0CB09D0]);
}

unint64_t sub_1C2FC4BA4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1C2FC9CA8() & 1) == 0)
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
      while (!v14 && (sub_1C2FC9CA8() & 1) == 0);
    }
  }
  return v6;
}

void sub_1C2FC4C84(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
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
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  unint64_t *v20;
  uint64_t v21;

  v20 = a4;
  v21 = a5;
  v6 = v5;
  v18 = a1;
  v19 = a3;
  v8 = a3(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78]();
  v11 = (char *)&v18 - v10;
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
      sub_1C2FC5D94(v20, v19, v21);
      v17 = sub_1C2FC99D8();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      if ((v17 & 1) != 0)
        break;
      v13 = (v13 + 1) & v14;
    }
    while (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  OUTLINED_FUNCTION_27();
}

void sub_1C2FC4DAC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _OWORD *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_32_4();
  sub_1C2FC49E0(v1);
  OUTLINED_FUNCTION_55_1();
  if ((v4 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_48_3();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF520);
    OUTLINED_FUNCTION_43_3();
    v5 = OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_39_2(v5);
    sub_1C2FC5D2C((_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v2), v3);
    OUTLINED_FUNCTION_72_1(&qword_1ED7AF438, v6, MEMORY[0x1E0D9EE18]);
    sub_1C2FC9C3C();
    *v0 = v7;
    swift_bridgeObjectRelease();
  }
  else
  {
    *v3 = 0u;
    v3[1] = 0u;
    OUTLINED_FUNCTION_38_3();
  }
}

void sub_1C2FC4E90()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_32_4();
  sub_1C2FC4A74(v1);
  OUTLINED_FUNCTION_55_1();
  if ((v4 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_48_3();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7DBC48);
    OUTLINED_FUNCTION_43_3();
    v5 = sub_1C2FC9798();
    OUTLINED_FUNCTION_39_2(v5);
    sub_1C2FC5D68(*(_QWORD *)(v7 + 56) + 32 * v2, (uint64_t)v3, &qword_1ED7AEF88);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEF88);
    OUTLINED_FUNCTION_72_1(&qword_1EF7DBC50, v6, MEMORY[0x1E0D9EF90]);
    sub_1C2FC9C3C();
    *v0 = v7;
    swift_bridgeObjectRelease();
  }
  else
  {
    *v3 = 0;
    v3[1] = 0;
    v3[2] = 0;
    v3[3] = 1;
  }
  OUTLINED_FUNCTION_38_3();
}

uint64_t sub_1C2FC4F78()
{
  uint64_t *v0;
  uint64_t *v1;
  unint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  uint64_t v7;

  v1 = v0;
  swift_bridgeObjectRetain();
  v2 = sub_1C2FC4980();
  v4 = v3;
  swift_bridgeObjectRelease();
  if ((v4 & 1) == 0)
    return 0;
  swift_isUniquelyReferenced_nonNull_native();
  v7 = *v1;
  *v1 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF530);
  sub_1C2FC9C30();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v2);
  type metadata accessor for Session();
  sub_1C2FC9C3C();
  *v1 = v7;
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1C2FC5080(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  swift_bridgeObjectRetain();
  sub_1C2FC4B0C(a1);
  v5 = v4;
  LOBYTE(a1) = v6;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  swift_isUniquelyReferenced_nonNull_native();
  v12 = *v2;
  *v2 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF518);
  sub_1C2FC9C30();
  v7 = *(_QWORD *)(v12 + 48);
  v8 = sub_1C2FC8A0C();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998];
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * v5, v8);
  v10 = *(_QWORD *)(*(_QWORD *)(v12 + 56) + 8 * v5);
  type metadata accessor for Session();
  sub_1C2FC5D94(&qword_1ED7AF070, v9, MEMORY[0x1E0CB09C8]);
  sub_1C2FC9C3C();
  *v2 = v12;
  swift_bridgeObjectRelease();
  return v10;
}

void sub_1C2FC51BC()
{
  sub_1C2FC34C4();
}

uint64_t sub_1C2FC51D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF060);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C2FC5220(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF060);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C2FC5260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1C2FC5330(a1, a2, a3, (void (*)(uint64_t))sub_1C2FC53E0);
}

uint64_t sub_1C2FC526C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  OUTLINED_FUNCTION_44_3();
  v6 = OUTLINED_FUNCTION_29_5();
  sub_1C2FC54D0(v6, v7, v8, a4);
  *v4 = v10;
  return OUTLINED_FUNCTION_5_4();
}

uint64_t sub_1C2FC52B4(uint64_t a1, uint64_t a2)
{
  return sub_1C2FC52CC(a1, a2, (void (*)(uint64_t))sub_1C2FC55FC);
}

uint64_t sub_1C2FC52C0(uint64_t a1, uint64_t a2)
{
  return sub_1C2FC52CC(a1, a2, (void (*)(uint64_t))sub_1C2FC5724);
}

uint64_t sub_1C2FC52CC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v7;

  swift_isUniquelyReferenced_nonNull_native();
  v7 = *v3;
  *v3 = 0x8000000000000000;
  v5 = OUTLINED_FUNCTION_348();
  a3(v5);
  *v3 = v7;
  return OUTLINED_FUNCTION_5_4();
}

uint64_t sub_1C2FC5330(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v8;

  OUTLINED_FUNCTION_44_3();
  v6 = OUTLINED_FUNCTION_29_5();
  a4(v6);
  *v4 = v8;
  return OUTLINED_FUNCTION_5_4();
}

uint64_t sub_1C2FC5374(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  swift_isUniquelyReferenced_nonNull_native();
  v6 = *v2;
  *v2 = 0x8000000000000000;
  sub_1C2FC5984(a1, a2);
  *v2 = v6;
  return swift_bridgeObjectRelease();
}

void sub_1C2FC53E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD **v3;
  unint64_t v7;
  char v8;
  char v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  char v13;
  _QWORD *v14;
  uint64_t v15;

  sub_1C2FC4980();
  OUTLINED_FUNCTION_75();
  if (v9)
  {
    __break(1u);
    goto LABEL_9;
  }
  v10 = v7;
  v11 = v8;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF548);
  if ((OUTLINED_FUNCTION_81_0() & 1) == 0)
    goto LABEL_5;
  v12 = sub_1C2FC4980();
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_9:
    sub_1C2FC9CCC();
    __break(1u);
    return;
  }
  v10 = v12;
LABEL_5:
  v14 = *v3;
  if ((v11 & 1) != 0)
  {
    v15 = v14[7];
    swift_bridgeObjectRelease();
    *(_QWORD *)(v15 + 8 * v10) = a1;
    OUTLINED_FUNCTION_16_2();
  }
  else
  {
    sub_1C2FC5AC8(v10, a2, a3, a1, v14);
    swift_bridgeObjectRetain();
  }
}

uint64_t sub_1C2FC54D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t result;

  v5 = v4;
  v10 = *v4;
  v11 = sub_1C2FC4980();
  if (__OFADD__(*(_QWORD *)(v10 + 16), (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v13 = v11;
  v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF538);
  if ((sub_1C2FC9C30() & 1) == 0)
    goto LABEL_5;
  v15 = sub_1C2FC4980();
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_9:
    result = sub_1C2FC9CCC();
    __break(1u);
    return result;
  }
  v13 = v15;
LABEL_5:
  v17 = *v5;
  if ((v14 & 1) != 0)
  {
    v18 = (uint64_t *)(*(_QWORD *)(v17 + 56) + 16 * v13);
    result = swift_unknownObjectRelease();
    *v18 = a1;
    v18[1] = a2;
  }
  else
  {
    sub_1C2FC5B10(v13, a3, a4, a1, a2, v17);
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_1C2FC55FC(_OWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;

  v6 = *(_QWORD *)(OUTLINED_FUNCTION_6_1() - 8);
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_18_3();
  sub_1C2FC49E0(a2);
  OUTLINED_FUNCTION_75();
  if (v9)
  {
    __break(1u);
    goto LABEL_9;
  }
  v10 = v7;
  v11 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF520);
  if ((OUTLINED_FUNCTION_81_0() & 1) == 0)
    goto LABEL_5;
  sub_1C2FC49E0(a2);
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_9:
    sub_1C2FC9CCC();
    __break(1u);
    return;
  }
  v10 = v12;
LABEL_5:
  v14 = *v2;
  if ((v11 & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v14 + 56) + 32 * v10);
    OUTLINED_FUNCTION_27();
    sub_1C2FC5D2C(v15, v16);
  }
  else
  {
    OUTLINED_FUNCTION_70(v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
    sub_1C2FC5B2C(v10, v3, a1, v14);
    OUTLINED_FUNCTION_27();
  }
}

void sub_1C2FC5724(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD **v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;

  v3 = (_QWORD **)v2;
  v6 = sub_1C2FC9798();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (_QWORD *)*v2;
  sub_1C2FC4A74(a2);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  v13 = v11;
  v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF7DBC48);
  if ((sub_1C2FC9C30() & 1) == 0)
    goto LABEL_5;
  sub_1C2FC4A74(a2);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_10:
    sub_1C2FC9CCC();
    __break(1u);
    return;
  }
  v13 = v15;
LABEL_5:
  v17 = *v3;
  if ((v14 & 1) != 0)
  {
    sub_1C2FC5D3C(a1, v17[7] + 32 * v13, &qword_1ED7AEF88);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    sub_1C2FC5BC0(v13, (uint64_t)v9, a1, v17);
  }
}

uint64_t sub_1C2FC5870(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v9 = sub_1C2FC4980();
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF530);
  if ((sub_1C2FC9C30() & 1) == 0)
    goto LABEL_5;
  v13 = sub_1C2FC4980();
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_1C2FC9CCC();
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
    sub_1C2FC5AC8(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1C2FC5984(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD **v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;

  v3 = (_QWORD **)v2;
  v6 = sub_1C2FC8A0C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (_QWORD *)*v2;
  sub_1C2FC4B0C(a2);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  v13 = v11;
  v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF518);
  if ((sub_1C2FC9C30() & 1) == 0)
    goto LABEL_5;
  sub_1C2FC4B0C(a2);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_10:
    result = sub_1C2FC9CCC();
    __break(1u);
    return result;
  }
  v13 = v15;
LABEL_5:
  v17 = *v3;
  if ((v14 & 1) != 0)
  {
    v18 = v17[7];
    result = swift_release();
    *(_QWORD *)(v18 + 8 * v13) = a1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    return sub_1C2FC5C68(v13, (uint64_t)v9, a1, v17);
  }
  return result;
}

unint64_t sub_1C2FC5AC8(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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

unint64_t sub_1C2FC5B10(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t result;
  uint64_t v7;
  uint64_t v8;
  char v9;

  result = OUTLINED_FUNCTION_10_5(a1, a2, a3, a4, a5, a6);
  if (v9)
    __break(1u);
  else
    *(_QWORD *)(v7 + 16) = v8;
  return result;
}

_OWORD *sub_1C2FC5B2C(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD *result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  OUTLINED_FUNCTION_73_1();
  *(_QWORD *)(v9 + 8 * (v8 >> 6) + 64) |= 1 << v8;
  v10 = *(_QWORD *)(v9 + 48);
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_77_0();
  (*(void (**)(uint64_t, uint64_t))(v11 + 32))(v10 + *(_QWORD *)(v11 + 72) * v5, v4);
  result = sub_1C2FC5D2C(a3, (_OWORD *)(*(_QWORD *)(a4 + 56) + 32 * v5));
  v13 = *(_QWORD *)(a4 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(a4 + 16) = v15;
  return result;
}

void sub_1C2FC5BC0(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_1C2FC9798();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  sub_1C2FC5D68(a3, a4[7] + 32 * a1, &qword_1ED7AEF88);
  v10 = a4[2];
  v11 = __OFADD__(v10, 1);
  v12 = v10 + 1;
  if (v11)
    __break(1u);
  else
    a4[2] = v12;
}

uint64_t sub_1C2FC5C68(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_1C2FC8A0C();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

double sub_1C2FC5D00@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1C2FC21CC(*(_QWORD *)(v1 + 24), a1);
}

_OWORD *sub_1C2FC5D2C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1C2FC5D3C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_59_2(a1, a2, a3);
  OUTLINED_FUNCTION_77_0();
  OUTLINED_FUNCTION_82_0(v3, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 40));
  OUTLINED_FUNCTION_31();
}

void sub_1C2FC5D68(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_59_2(a1, a2, a3);
  OUTLINED_FUNCTION_77_0();
  OUTLINED_FUNCTION_82_0(v3, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 32));
  OUTLINED_FUNCTION_31();
}

void sub_1C2FC5D94(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x1C3BD07B0](a3, v5), a1);
  }
  OUTLINED_FUNCTION_31();
}

void OUTLINED_FUNCTION_4_5(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7_4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 152) = a1;
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_8_5(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

unint64_t OUTLINED_FUNCTION_10_5(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;

  *(_QWORD *)(a6 + 8 * (result >> 6) + 64) |= 1 << result;
  v6 = (_QWORD *)(*(_QWORD *)(a6 + 48) + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = (_QWORD *)(*(_QWORD *)(a6 + 56) + 16 * result);
  *v7 = a4;
  v7[1] = a5;
  return result;
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_14_5()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_15_5()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_17_5()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2048;
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_22_4()
{
  return sub_1C2FC9BA0();
}

uint64_t OUTLINED_FUNCTION_24_3()
{
  return sub_1C2FC99E4();
}

uint64_t OUTLINED_FUNCTION_26_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1C2FC4294(v1, v0, (uint64_t *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_29_5()
{
  _QWORD *v0;
  uint64_t v1;

  *v0 = 0x8000000000000000;
  return v1;
}

uint64_t OUTLINED_FUNCTION_30_4()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_32_4()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_33_3(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_integerForKey_, a1);
}

uint64_t OUTLINED_FUNCTION_34_3()
{
  return sub_1C2FC89D0();
}

uint64_t OUTLINED_FUNCTION_39_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v3 + *(_QWORD *)(*(_QWORD *)(a1 - 8) + 72) * v1, v2);
}

uint64_t OUTLINED_FUNCTION_43_3()
{
  return sub_1C2FC9C30();
}

uint64_t OUTLINED_FUNCTION_44_3()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

id OUTLINED_FUNCTION_47_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  return objc_msgSend(v1, (SEL)(v2 + 712), a1);
}

void OUTLINED_FUNCTION_48_3()
{
  _QWORD *v0;

  *v0 = 0x8000000000000000;
}

unint64_t OUTLINED_FUNCTION_52_2(uint64_t a1)
{
  char v1;

  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t OUTLINED_FUNCTION_55_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_56_1(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_58_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1C2FC4294(v1, v0, (uint64_t *)(v2 - 136));
}

uint64_t OUTLINED_FUNCTION_59_2(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_62_2()
{
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_63_0()
{
  return sub_1C2FC98E8();
}

uint64_t OUTLINED_FUNCTION_68_1()
{
  return swift_retain();
}

unint64_t OUTLINED_FUNCTION_69_1()
{
  return sub_1C2FC4980();
}

uint64_t OUTLINED_FUNCTION_70@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_71_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

void OUTLINED_FUNCTION_72_1(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t);

  sub_1C2FC5D94(a1, v3, a3);
}

id OUTLINED_FUNCTION_76_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1C2FC41C8(a1, (a2 - 32) | 0x8000000000000000);
}

uint64_t OUTLINED_FUNCTION_79_0()
{
  return sub_1C2FC9B28();
}

uint64_t OUTLINED_FUNCTION_81_0()
{
  return sub_1C2FC9C30();
}

uint64_t OUTLINED_FUNCTION_82_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t destroy for SessionStateHolder()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void _s14SiriMessageBus18SessionStateHolderVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_303();
  OUTLINED_FUNCTION_31();
}

_QWORD *assignWithCopy for SessionStateHolder(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *assignWithTake for SessionStateHolder(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SessionStateHolder(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SessionStateHolder(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SessionStateHolder()
{
  return &type metadata for SessionStateHolder;
}

void sub_1C2FC62D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _OWORD v5[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1C2FC5D2C((_OWORD *)a1, v5);
    sub_1C2FC52B4((uint64_t)v5, a2);
    v3 = sub_1C2FC9708();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a2, v3);
  }
  else
  {
    sub_1C2F9BD60(a1, &qword_1ED7AEF88);
    sub_1C2FC4DAC();
    v4 = sub_1C2FC9708();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a2, v4);
    sub_1C2F9BD60((uint64_t)v5, &qword_1ED7AEF88);
  }
}

void sub_1C2FC6380(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE v5[32];

  if (*(_QWORD *)(a1 + 24) == 1)
  {
    sub_1C2F9BD60(a1, (uint64_t *)&unk_1EF7DBC60);
    sub_1C2FC4E90();
    v3 = sub_1C2FC9798();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a2, v3);
    sub_1C2F9BD60((uint64_t)v5, (uint64_t *)&unk_1EF7DBC60);
  }
  else
  {
    sub_1C2F9BD98(a1, (uint64_t)v5, &qword_1ED7AEF88);
    sub_1C2FC52C0((uint64_t)v5, a2);
    v4 = sub_1C2FC9798();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a2, v4);
  }
}

void sub_1C2FC6438()
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
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  _QWORD v15[4];
  _QWORD v16[4];

  OUTLINED_FUNCTION_30_1();
  v4 = v3;
  v6 = v5;
  v7 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_24_4();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_17_6();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_22_5();
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v8 = OUTLINED_FUNCTION_7();
  __swift_project_value_buffer(v8, (uint64_t)qword_1ED7AF5F0);
  OUTLINED_FUNCTION_31_4(v2, v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16));
  v9 = sub_1C2FC98E8();
  v10 = sub_1C2FC9B04();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_1();
    v16[0] = OUTLINED_FUNCTION_1();
    *(_DWORD *)v11 = 136315138;
    v12 = sub_1C2FC96FC();
    v15[0] = OUTLINED_FUNCTION_60(v12, v13);
    sub_1C2FC9BA0();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_194(v2, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
    _os_log_impl(&dword_1C2F94000, v9, v10, "Updating shared value for key: %s", v11, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_194(v2, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));

  memset(v16, 0, sizeof(v16));
  v14(v1, v4, v7);
  sub_1C2FA3740((uint64_t)v16, (uint64_t)v15);
  sub_1C2FC62D4((uint64_t)v15, v1);
  sub_1C2F9BD60((uint64_t)v16, &qword_1ED7AEF88);
  v14(v1, v4, v7);
  sub_1C2FA3740(v6, (uint64_t)v16);
  sub_1C2FC62D4((uint64_t)v16, v1);
  OUTLINED_FUNCTION_27();
}

void sub_1C2FC6658(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  _QWORD *v20;
  uint64_t isUniquelyReferenced_nonNull_native;
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
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint64_t v42;
  uint8_t *v43;
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
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  unint64_t v60;
  char v61;
  _QWORD *v62;
  _OWORD *v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char v67;
  _QWORD *v68;
  void (*v69)(uint64_t, uint64_t);
  _QWORD *v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint8_t *v81;
  uint8_t *v82;
  uint64_t v83;
  uint8_t *v84;
  uint8_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  char v112;
  unint64_t v113;
  char v114;
  _QWORD *v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  char v119;
  _QWORD *v120;
  void (*v121)(uint64_t, uint64_t);
  _QWORD *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint8_t *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint8_t *v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  char *v148;
  _QWORD *v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  uint64_t v153;
  uint64_t v154[6];

  OUTLINED_FUNCTION_30_1();
  a19 = v22;
  a20 = v23;
  v24 = v20;
  v26 = v25;
  v27 = OUTLINED_FUNCTION_6_1();
  v28 = *(_QWORD *)(v27 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  OUTLINED_FUNCTION_18_4();
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v145 = (uint64_t)&v132 - v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF430);
  OUTLINED_FUNCTION_15_0();
  v30 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v32 = (uint64_t)&v132 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v30);
  v146 = (char *)&v132 - v33;
  OUTLINED_FUNCTION_37();
  MEMORY[0x1E0C80A78](v34);
  v148 = (char *)&v132 - v35;
  OUTLINED_FUNCTION_37();
  MEMORY[0x1E0C80A78](v36);
  v141 = (uint64_t)&v132 - v37;
  if (qword_1ED7AEDB0 == -1)
    goto LABEL_2;
LABEL_95:
  swift_once();
LABEL_2:
  v38 = OUTLINED_FUNCTION_7();
  __swift_project_value_buffer(v38, (uint64_t)qword_1ED7AF5F0);
  OUTLINED_FUNCTION_36_2();
  v39 = sub_1C2FC98E8();
  v40 = sub_1C2FC9B04();
  v41 = os_log_type_enabled(v39, v40);
  v42 = MEMORY[0x1E0DEE9B8];
  v142 = isUniquelyReferenced_nonNull_native;
  v144 = v32;
  v147 = v27;
  if (v41)
  {
    v43 = (uint8_t *)OUTLINED_FUNCTION_1();
    v154[0] = OUTLINED_FUNCTION_1();
    *(_DWORD *)v43 = 136315138;
    v143 = v43 + 4;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEF88);
    sub_1C2FC5D94(&qword_1ED7AF438, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EE08], MEMORY[0x1E0D9EE18]);
    v44 = sub_1C2FC99B4();
    v46 = v45;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v152 = sub_1C2FC4294(v44, v46, v154);
    sub_1C2FC9BA0();
    OUTLINED_FUNCTION_16_5();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1C2F94000, v39, v40, "Updating shared value for keys: %s", v43, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_16_5();
  v140 = v26;
  sub_1C2FC8524(v26);
  v48 = v47;
  v137 = v47 + 64;
  v49 = v24[1];
  OUTLINED_FUNCTION_4_6();
  v138 = v50;
  v133 = (uint8_t *)(v50 - 1);
  v135 = v51;
  swift_bridgeObjectRetain();
  v134 = v49;
  swift_bridgeObjectRetain();
  v139 = v48;
  swift_retain();
  v143 = 0;
  v136 = v42 + 8;
  v52 = v145;
  v53 = (uint64_t)v148;
  if (!v26)
  {
LABEL_23:
    v81 = v143 + 1;
    if (__OFADD__(v143, 1))
      goto LABEL_91;
    if ((uint64_t)v81 < v138)
    {
      if (*(_QWORD *)(v137 + 8 * (_QWORD)v81))
      {
LABEL_26:
        v75 = isUniquelyReferenced_nonNull_native;
        OUTLINED_FUNCTION_32_5();
        v77 = v83 + ((_QWORD)v82 << 6);
        v143 = v82;
        goto LABEL_22;
      }
      v84 = v143 + 2;
      ++v143;
      if ((uint64_t)(v81 + 1) < v138)
      {
        if (*(_QWORD *)(v137 + 8 * (_QWORD)v84))
          goto LABEL_26;
        v143 = v81 + 1;
        if ((uint64_t)(v81 + 2) < v138)
        {
          if (*(_QWORD *)(v137 + 8 * (_QWORD)(v81 + 2)))
            goto LABEL_26;
          v143 = v81 + 2;
          if ((uint64_t)(v81 + 3) < v138)
          {
            if (*(_QWORD *)(v137 + 8 * (_QWORD)(v81 + 3)))
              goto LABEL_26;
            v85 = v81 + 4;
            v143 = v81 + 3;
            if ((uint64_t)(v81 + 4) < v138)
            {
              if (*(_QWORD *)(v137 + 8 * (_QWORD)v85))
                goto LABEL_26;
              while (1)
              {
                v86 = (uint64_t)(v85 + 1);
                if (__OFADD__(v85, 1))
                {
                  __break(1u);
                  goto LABEL_97;
                }
                if (v86 >= v138)
                  break;
                ++v85;
                if (*(_QWORD *)(v137 + 8 * v86))
                  goto LABEL_26;
              }
              v143 = v133;
            }
          }
        }
      }
    }
    v87 = OUTLINED_FUNCTION_47_4();
    OUTLINED_FUNCTION_44_4(v53, v88, v89, v87);
    v26 = 0;
    goto LABEL_42;
  }
  while (1)
  {
    v75 = isUniquelyReferenced_nonNull_native;
    OUTLINED_FUNCTION_42_2();
    v77 = v76 | ((_QWORD)v143 << 6);
LABEL_22:
    v78 = v139;
    v53 = (uint64_t)v148;
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v148, *(_QWORD *)(v139 + 48) + *(_QWORD *)(v28 + 72) * v77, v147);
    v79 = *(_QWORD *)(v78 + 56) + 32 * v77;
    v80 = OUTLINED_FUNCTION_47_4();
    sub_1C2FA3740(v79, v53 + *(int *)(v80 + 48));
    OUTLINED_FUNCTION_35_4(v53, 0);
    isUniquelyReferenced_nonNull_native = v75;
LABEL_42:
    v90 = v53;
    v91 = v141;
    sub_1C2F9BD98(v90, v141, &qword_1ED7AF430);
    v92 = OUTLINED_FUNCTION_47_4();
    if (__swift_getEnumTagSinglePayload(v91, 1, v92) == 1)
      break;
    sub_1C2F9BD98(v91 + *(int *)(v92 + 48), (uint64_t)v154, &qword_1ED7AEF88);
    v27 = v147;
    OUTLINED_FUNCTION_6_4(v52, v91, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 32));
    OUTLINED_FUNCTION_49_3();
    if (v153)
    {
      OUTLINED_FUNCTION_13_3(&v152);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v149 = (_QWORD *)*v24;
      *v24 = 0x8000000000000000;
      OUTLINED_FUNCTION_51_2();
      OUTLINED_FUNCTION_26_6();
      if (__OFADD__(v56, v57))
      {
        __break(1u);
LABEL_90:
        __break(1u);
LABEL_91:
        __break(1u);
LABEL_92:
        __break(1u);
LABEL_93:
        __break(1u);
LABEL_94:
        __break(1u);
        goto LABEL_95;
      }
      v58 = v54;
      v32 = v55;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF520);
      v59 = sub_1C2FC9C30();
      isUniquelyReferenced_nonNull_native = v142;
      if ((v59 & 1) != 0)
      {
        sub_1C2FC49E0(v145);
        if ((v32 & 1) != (v61 & 1))
          goto LABEL_98;
        v58 = v60;
      }
      v62 = v149;
      if ((v32 & 1) != 0)
      {
        v63 = (_OWORD *)(v149[7] + 32 * v58);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v63);
        sub_1C2FC5D2C(&v150, v63);
      }
      else
      {
        OUTLINED_FUNCTION_275((uint64_t)&v149[v58 >> 6]);
        OUTLINED_FUNCTION_6_4(v62[6] + *(_QWORD *)(v28 + 72) * v58, v145, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 16));
        sub_1C2FC5D2C(&v150, (_OWORD *)(v62[7] + 32 * v58));
        v71 = v62[2];
        v72 = __OFADD__(v71, 1);
        v73 = v71 + 1;
        if (v72)
          goto LABEL_93;
        v62[2] = v73;
        v62 = v149;
      }
      *v24 = v62;
      swift_bridgeObjectRelease();
      v52 = v145;
      OUTLINED_FUNCTION_194(v145, *(uint64_t (**)(uint64_t, uint64_t))(v28 + 8));
      v32 = v144;
    }
    else
    {
      OUTLINED_FUNCTION_8_6((uint64_t)&v152);
      OUTLINED_FUNCTION_303();
      OUTLINED_FUNCTION_51_2();
      v65 = v64;
      v67 = v66;
      OUTLINED_FUNCTION_11();
      if ((v67 & 1) != 0)
      {
        swift_isUniquelyReferenced_nonNull_native();
        v149 = (_QWORD *)*v24;
        v68 = v149;
        *v24 = 0x8000000000000000;
        v32 = v68[3];
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF520);
        OUTLINED_FUNCTION_34_4();
        v69 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
        v69(v149[6] + *(_QWORD *)(v28 + 72) * v65, v27);
        v70 = v149;
        OUTLINED_FUNCTION_13_3((_OWORD *)(v149[7] + 32 * v65));
        sub_1C2FC5D94(&qword_1ED7AF438, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EE08], MEMORY[0x1E0D9EE18]);
        sub_1C2FC9C3C();
        *v24 = v70;
        swift_bridgeObjectRelease();
      }
      else
      {
        v150 = 0u;
        v151 = 0u;
        v69 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
      }
      v74 = v145;
      v69(v145, v27);
      v52 = v74;
      OUTLINED_FUNCTION_8_6((uint64_t)&v150);
    }
    v53 = (uint64_t)v148;
    OUTLINED_FUNCTION_8_6((uint64_t)v154);
    if (!v26)
      goto LABEL_23;
  }
  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_9_3();
  swift_release_n();
  v143 = (uint8_t *)(v140 + 64);
  v93 = v24[1];
  OUTLINED_FUNCTION_4_6();
  v145 = v94;
  v137 = v94 - 1;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_38_4((uint64_t)&a16);
  v138 = v93;
  OUTLINED_FUNCTION_303();
  v95 = 0;
  v141 = MEMORY[0x1E0DEE9B8] + 8;
  v96 = (uint64_t)v146;
  v27 = v147;
  if (v26)
  {
LABEL_44:
    OUTLINED_FUNCTION_42_2();
    v148 = v97;
    v99 = v98 | ((_QWORD)v97 << 6);
LABEL_45:
    v100 = v140;
    OUTLINED_FUNCTION_6_4(v32, *(_QWORD *)(v140 + 48) + *(_QWORD *)(v28 + 72) * v99, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 16));
    sub_1C2FA3740(*(_QWORD *)(v100 + 56) + 32 * v99, v32 + *(int *)(v92 + 48));
    v101 = 0;
    v96 = (uint64_t)v146;
    goto LABEL_52;
  }
  while (2)
  {
    v102 = (uint64_t)(v95 + 1);
    if (__OFADD__(v95, 1))
      goto LABEL_92;
    if (v102 >= v145)
    {
      v148 = v95;
LABEL_51:
      OUTLINED_FUNCTION_43_4();
LABEL_52:
      OUTLINED_FUNCTION_35_4(v32, v101);
      sub_1C2F9BD98(v32, v96, &qword_1ED7AF430);
      if (__swift_getEnumTagSinglePayload(v96, 1, v92) == 1)
      {
        OUTLINED_FUNCTION_9_3();
        OUTLINED_FUNCTION_9_3();
        swift_release();
        OUTLINED_FUNCTION_27();
        return;
      }
      sub_1C2F9BD98(v96 + *(int *)(v92 + 48), (uint64_t)v154, &qword_1ED7AEF88);
      OUTLINED_FUNCTION_6_4(isUniquelyReferenced_nonNull_native, v96, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 32));
      OUTLINED_FUNCTION_49_3();
      if (v153)
      {
        OUTLINED_FUNCTION_13_3(&v152);
        v105 = swift_isUniquelyReferenced_nonNull_native();
        v106 = isUniquelyReferenced_nonNull_native;
        isUniquelyReferenced_nonNull_native = v105;
        v149 = (_QWORD *)v24[1];
        v24[1] = 0x8000000000000000;
        sub_1C2FC49E0(v106);
        OUTLINED_FUNCTION_26_6();
        if (__OFADD__(v109, v110))
          goto LABEL_90;
        v111 = v107;
        v32 = v108;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF520);
        v112 = sub_1C2FC9C30();
        isUniquelyReferenced_nonNull_native = v142;
        if ((v112 & 1) != 0)
        {
          OUTLINED_FUNCTION_21_4();
          if ((v32 & 1) != (v114 & 1))
            goto LABEL_98;
          v111 = v113;
        }
        v115 = v149;
        if ((v32 & 1) != 0)
        {
          __swift_destroy_boxed_opaque_existential_1(v149[7] + 32 * v111);
          OUTLINED_FUNCTION_15_6(&v150);
        }
        else
        {
          OUTLINED_FUNCTION_46_3((uint64_t)&v149[v111 >> 6]);
          OUTLINED_FUNCTION_6_4(v123 + *(_QWORD *)(v28 + 72) * v111, isUniquelyReferenced_nonNull_native, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 16));
          sub_1C2FC5D2C(&v150, (_OWORD *)(v115[7] + 32 * v111));
          v124 = v115[2];
          v72 = __OFADD__(v124, 1);
          v125 = v124 + 1;
          if (v72)
            goto LABEL_94;
          v115[2] = v125;
          v115 = v149;
        }
        v24[1] = v115;
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_194(isUniquelyReferenced_nonNull_native, *(uint64_t (**)(uint64_t, uint64_t))(v28 + 8));
        v32 = v144;
        v96 = (uint64_t)v146;
      }
      else
      {
        OUTLINED_FUNCTION_50_2((uint64_t)&v152);
        OUTLINED_FUNCTION_303();
        OUTLINED_FUNCTION_21_4();
        v117 = v116;
        v119 = v118;
        OUTLINED_FUNCTION_11();
        if ((v119 & 1) != 0)
        {
          swift_isUniquelyReferenced_nonNull_native();
          v149 = (_QWORD *)v24[1];
          v120 = v149;
          v24[1] = 0x8000000000000000;
          v32 = v120[3];
          __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF520);
          OUTLINED_FUNCTION_34_4();
          v121 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
          v121(v149[6] + *(_QWORD *)(v28 + 72) * v117, v27);
          v122 = v149;
          OUTLINED_FUNCTION_13_3((_OWORD *)(v149[7] + 32 * v117));
          sub_1C2FC5D94(&qword_1ED7AF438, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EE08], MEMORY[0x1E0D9EE18]);
          sub_1C2FC9C3C();
          v24[1] = v122;
          swift_bridgeObjectRelease();
        }
        else
        {
          v150 = 0u;
          v151 = 0u;
          v121 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
        }
        v121(isUniquelyReferenced_nonNull_native, v27);
        OUTLINED_FUNCTION_50_2((uint64_t)&v150);
        v96 = (uint64_t)v146;
      }
      OUTLINED_FUNCTION_50_2((uint64_t)v154);
      v95 = v148;
      if (v26)
        goto LABEL_44;
      continue;
    }
    break;
  }
  if (*(_QWORD *)&v143[8 * v102])
    goto LABEL_49;
  v126 = (uint64_t)(v95 + 2);
  if ((uint64_t)(v95 + 2) >= v145)
  {
    OUTLINED_FUNCTION_43_4();
LABEL_73:
    v148 = v127;
    goto LABEL_52;
  }
  if (*(_QWORD *)&v143[8 * v126])
    goto LABEL_49;
  v128 = v95 + 3;
  if (v102 + 2 >= v145)
    goto LABEL_85;
  if (*(_QWORD *)&v143[8 * (_QWORD)v128])
    goto LABEL_49;
  v126 = v102 + 3;
  if (v102 + 3 >= v145)
  {
    OUTLINED_FUNCTION_43_4();
    v148 = v131;
    goto LABEL_52;
  }
  if (*(_QWORD *)&v143[8 * v126])
    goto LABEL_49;
  v129 = v102 + 4;
  if (v102 + 4 >= v145)
  {
LABEL_85:
    v148 = (char *)v126;
    goto LABEL_51;
  }
  if (*(_QWORD *)&v143[8 * v129])
  {
LABEL_49:
    OUTLINED_FUNCTION_32_5();
    v99 = v104 + ((_QWORD)v103 << 6);
    v148 = v103;
    goto LABEL_45;
  }
  while (1)
  {
    v130 = v129 + 1;
    if (__OFADD__(v129, 1))
      break;
    if (v130 >= v145)
    {
      OUTLINED_FUNCTION_43_4();
      v127 = (char *)v137;
      goto LABEL_73;
    }
    ++v129;
    if (*(_QWORD *)&v143[8 * v130])
      goto LABEL_49;
  }
LABEL_97:
  __break(1u);
LABEL_98:
  sub_1C2FC9CCC();
  __break(1u);
}

double sub_1C2FC72C0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _OWORD *a4@<X8>)
{
  uint64_t v8;
  char v9;
  double result;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  char v16;
  _OWORD v17[2];

  if (*(_QWORD *)(a2 + 16) && (sub_1C2FC49E0(a1), (v9 & 1) != 0))
  {
    sub_1C2FA30CC(*(_QWORD *)(a2 + 56) + 32 * v8, (uint64_t)v17);
    OUTLINED_FUNCTION_15_6(v17);
  }
  else
  {
    if (qword_1ED7AEDB0 != -1)
      swift_once();
    v11 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v11, (uint64_t)qword_1ED7AF5F0);
    v12 = sub_1C2FC98E8();
    v13 = sub_1C2FC9B28();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)OUTLINED_FUNCTION_1();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1C2F94000, v12, v13, "Could not find key in user-specific session data. Falling back to shared space", v14, 2u);
      OUTLINED_FUNCTION_0();
    }

    if (*(_QWORD *)(a3 + 16) && (sub_1C2FC49E0(a1), (v16 & 1) != 0))
    {
      sub_1C2FA30CC(*(_QWORD *)(a3 + 56) + 32 * v15, (uint64_t)a4);
    }
    else
    {
      result = 0.0;
      *a4 = 0u;
      a4[1] = 0u;
    }
  }
  return result;
}

void sub_1C2FC7410()
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
  _QWORD *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t);
  _OWORD v36[2];
  _OWORD v37[2];

  OUTLINED_FUNCTION_30_1();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = OUTLINED_FUNCTION_6_1();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_8();
  v34 = v9;
  OUTLINED_FUNCTION_37();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_22_5();
  v10 = *(_QWORD *)(v6 + 16);
  if (!v10)
  {
LABEL_25:
    OUTLINED_FUNCTION_27();
    return;
  }
  v11 = v6 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  v33 = *(_QWORD *)(v8 + 72);
  v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
  swift_bridgeObjectRetain();
  v12 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  v31 = v2;
  v32 = v4;
  while (1)
  {
    OUTLINED_FUNCTION_30_5(v0, v11);
    if (*(_QWORD *)(v4 + 16) && (sub_1C2FC49E0(v0), (v14 & 1) != 0))
    {
      sub_1C2FA30CC(*(_QWORD *)(v4 + 56) + 32 * v13, (uint64_t)v37);
      sub_1C2FC5D2C(v37, v36);
    }
    else
    {
      if (qword_1ED7AEDB0 != -1)
        swift_once();
      v15 = OUTLINED_FUNCTION_7();
      __swift_project_value_buffer(v15, (uint64_t)qword_1ED7AF5F0);
      v16 = sub_1C2FC98E8();
      v17 = sub_1C2FC9B28();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)OUTLINED_FUNCTION_1();
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_1C2F94000, v16, v17, "Could not find key in user-specific session data. Falling back to shared space", v18, 2u);
        OUTLINED_FUNCTION_0();
      }

      if (!*(_QWORD *)(v2 + 16) || (sub_1C2FC49E0(v0), (v20 & 1) == 0))
      {
        memset(v36, 0, sizeof(v36));
        OUTLINED_FUNCTION_194(v0, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
        sub_1C2F9BD60((uint64_t)v36, &qword_1ED7AEF88);
        goto LABEL_23;
      }
      OUTLINED_FUNCTION_29_6(*(_QWORD *)(v2 + 56) + 32 * v19);
    }
    OUTLINED_FUNCTION_41_4();
    OUTLINED_FUNCTION_6_4(v34, v0, v35);
    OUTLINED_FUNCTION_29_6((uint64_t)v37);
    swift_isUniquelyReferenced_nonNull_native();
    sub_1C2FC49E0(v34);
    if (__OFADD__(v12[2], (v22 & 1) == 0))
      break;
    v23 = v21;
    v24 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF520);
    v4 = v32;
    if ((sub_1C2FC9C30() & 1) != 0)
    {
      sub_1C2FC49E0(v34);
      if ((v24 & 1) != (v26 & 1))
        goto LABEL_28;
      v23 = v25;
    }
    if ((v24 & 1) != 0)
    {
      __swift_destroy_boxed_opaque_existential_1(v12[7] + 32 * v23);
      OUTLINED_FUNCTION_15_6(v36);
    }
    else
    {
      OUTLINED_FUNCTION_275((uint64_t)&v12[v23 >> 6]);
      OUTLINED_FUNCTION_30_5(v12[6] + v23 * v33, v34);
      sub_1C2FC5D2C(v36, (_OWORD *)(v12[7] + 32 * v23));
      v27 = v12[2];
      v28 = __OFADD__(v27, 1);
      v29 = v27 + 1;
      if (v28)
        goto LABEL_27;
      v12[2] = v29;
    }
    swift_bridgeObjectRelease();
    v30 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v30(v34, v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    v30(v0, v7);
    v2 = v31;
LABEL_23:
    v11 += v33;
    if (!--v10)
    {
      swift_bridgeObjectRelease();
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  sub_1C2FC9CCC();
  __break(1u);
}

void sub_1C2FC7764()
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
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  NSObject *v16;
  os_log_type_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];

  OUTLINED_FUNCTION_30_1();
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = OUTLINED_FUNCTION_10_1();
  v34 = *(_QWORD *)(v9 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_76();
  v10 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_24_4();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_8();
  v32 = v11;
  OUTLINED_FUNCTION_37();
  MEMORY[0x1E0C80A78]();
  v13 = (char *)&v26 - v12;
  if (qword_1ED7AEDB0 != -1)
    swift_once();
  v14 = OUTLINED_FUNCTION_7();
  __swift_project_value_buffer(v14, (uint64_t)qword_1ED7AF5F0);
  v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
  v33 = v6;
  OUTLINED_FUNCTION_31_4((uint64_t)v13, v6, v15);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 16))(v2, v4, v9);
  v16 = sub_1C2FC98E8();
  v17 = sub_1C2FC9B04();
  v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    v19 = OUTLINED_FUNCTION_1();
    v27 = v18;
    v20 = v19;
    v28 = OUTLINED_FUNCTION_1();
    v36[0] = v28;
    *(_DWORD *)v20 = 136315394;
    v29 = v8;
    v21 = sub_1C2FC96FC();
    v35 = OUTLINED_FUNCTION_60(v21, v22);
    v30 = v0;
    sub_1C2FC9BA0();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_194((uint64_t)v13, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    *(_WORD *)(v20 + 12) = 2080;
    sub_1C2FC5D94(&qword_1ED7AF488, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EF80], MEMORY[0x1E0D9EFA0]);
    v23 = sub_1C2FC9C9C();
    v35 = OUTLINED_FUNCTION_60(v23, v24);
    sub_1C2FC9BA0();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_20_3();
    _os_log_impl(&dword_1C2F94000, v16, (os_log_type_t)v27, "Updating value for key: %s userId: %s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_194((uint64_t)v13, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_20_3();

  v25 = v32;
  v31(v32, v33, v10);
  sub_1C2FA3740(v8, (uint64_t)v36);
  sub_1C2FC62D4((uint64_t)v36, v25);
  OUTLINED_FUNCTION_27();
}

void sub_1C2FC79EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  unint64_t v56;
  int64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  unint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  char v72;
  void (*v73)(uint64_t, char *);
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  uint64_t v78;
  uint64_t v79;
  int64_t v80;
  uint64_t v81;
  uint64_t v82;
  os_log_t v83;
  uint64_t v84;
  int64_t v85;
  uint64_t v86;
  uint64_t v87;
  int64_t v88;
  uint64_t v89;
  _QWORD *v90;
  _OWORD v91[2];
  __int128 v92;
  uint64_t v93;
  uint64_t v94[5];

  OUTLINED_FUNCTION_30_1();
  a19 = v24;
  a20 = v25;
  v26 = v20;
  v28 = v27;
  v30 = v29;
  v87 = OUTLINED_FUNCTION_6_1();
  v31 = *(_QWORD *)(v87 - 8);
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_76();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF430);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_17_6();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_22_5();
  v88 = *(_QWORD *)(OUTLINED_FUNCTION_10_1() - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78]();
  v33 = (char *)&v79 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ED7AEDB0 == -1)
    goto LABEL_2;
LABEL_51:
  swift_once();
LABEL_2:
  v34 = OUTLINED_FUNCTION_7();
  __swift_project_value_buffer(v34, (uint64_t)qword_1ED7AF5F0);
  OUTLINED_FUNCTION_6_4((uint64_t)v33, (uint64_t)v28, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v88 + 16));
  OUTLINED_FUNCTION_36_2();
  v35 = sub_1C2FC98E8();
  v36 = sub_1C2FC9B04();
  LODWORD(v85) = v36;
  v37 = os_log_type_enabled(v35, v36);
  v38 = MEMORY[0x1E0DEE9B8];
  v86 = v30;
  v89 = v23;
  if (v37)
  {
    v39 = OUTLINED_FUNCTION_1();
    v84 = OUTLINED_FUNCTION_1();
    v94[0] = v84;
    *(_DWORD *)v39 = 136315394;
    v82 = v39 + 4;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AEF88);
    sub_1C2FC5D94(&qword_1ED7AF438, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EE08], MEMORY[0x1E0D9EE18]);
    v40 = sub_1C2FC99B4();
    v83 = v35;
    v42 = v41;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v92 = sub_1C2FC4294(v40, v42, v94);
    sub_1C2FC9BA0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v39 + 12) = 2080;
    sub_1C2FC5D94(&qword_1ED7AF488, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EF80], MEMORY[0x1E0D9EFA0]);
    v43 = sub_1C2FC9C9C();
    *(_QWORD *)&v92 = sub_1C2FC4294(v43, v44, v94);
    sub_1C2FC9BA0();
    OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_194((uint64_t)v33, *(uint64_t (**)(uint64_t, uint64_t))(v88 + 8));
    _os_log_impl(&dword_1C2F94000, v83, (os_log_type_t)v85, "Updating values for keys: %s userId: %s", (uint8_t *)v39, 0x16u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_16_5();
  OUTLINED_FUNCTION_194((uint64_t)v33, *(uint64_t (**)(uint64_t, uint64_t))(v88 + 8));

  v45 = v38;
  v46 = *(_QWORD *)(v30 + 64);
  v84 = v30 + 64;
  v47 = *(_QWORD *)(v26 + 8);
  v48 = 1 << *(_BYTE *)(v30 + 32);
  v49 = -1;
  if (v48 < 64)
    v49 = ~(-1 << v48);
  v50 = v49 & v46;
  v85 = (unint64_t)(v48 + 63) >> 6;
  v80 = v85 - 1;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_38_4((uint64_t)&a18);
  v81 = v47;
  OUTLINED_FUNCTION_303();
  v88 = 0;
  v28 = &unk_1ED7AF428;
  v83 = v45 + 1;
  v33 = (char *)v87;
  if (v50)
  {
LABEL_7:
    v51 = __clz(__rbit64(v50));
    v50 &= v50 - 1;
    v52 = v51 | (v88 << 6);
LABEL_8:
    OUTLINED_FUNCTION_33_4(v21, *(_QWORD *)(v30 + 48) + *(_QWORD *)(v31 + 72) * v52, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 16));
    v53 = *(_QWORD *)(v30 + 56) + 32 * v52;
    v54 = OUTLINED_FUNCTION_141();
    sub_1C2FA3740(v53, v21 + *(int *)(v54 + 48));
    __swift_storeEnumTagSinglePayload(v21, 0, 1, v54);
    goto LABEL_30;
  }
  while (1)
  {
    v55 = v88 + 1;
    if (__OFADD__(v88, 1))
      goto LABEL_49;
    if (v55 < v85)
    {
      v56 = *(_QWORD *)(v84 + 8 * v55);
      if (v56)
        goto LABEL_12;
      v57 = v88 + 2;
      ++v88;
      if (v55 + 1 < v85)
      {
        v56 = *(_QWORD *)(v84 + 8 * v57);
        if (v56)
          goto LABEL_15;
        v88 = v55 + 1;
        if (v55 + 2 < v85)
        {
          v56 = *(_QWORD *)(v84 + 8 * (v55 + 2));
          if (v56)
          {
            v55 += 2;
            goto LABEL_12;
          }
          v88 = v55 + 2;
          if (v55 + 3 < v85)
          {
            v56 = *(_QWORD *)(v84 + 8 * (v55 + 3));
            if (v56)
            {
              v55 += 3;
              goto LABEL_12;
            }
            v57 = v55 + 4;
            v88 = v55 + 3;
            if (v55 + 4 < v85)
              break;
          }
        }
      }
    }
LABEL_29:
    v58 = OUTLINED_FUNCTION_141();
    OUTLINED_FUNCTION_44_4(v21, v59, v60, v58);
    v50 = 0;
LABEL_30:
    sub_1C2F9BD98(v21, v22, &qword_1ED7AF430);
    v61 = OUTLINED_FUNCTION_141();
    if (__swift_getEnumTagSinglePayload(v22, 1, v61) == 1)
    {
      OUTLINED_FUNCTION_9_3();
      OUTLINED_FUNCTION_9_3();
      swift_release();
      OUTLINED_FUNCTION_27();
      return;
    }
    sub_1C2F9BD98(v22 + *(int *)(v61 + 48), (uint64_t)v94, &qword_1ED7AEF88);
    OUTLINED_FUNCTION_33_4(v23, v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 32));
    sub_1C2FA3740((uint64_t)v94, (uint64_t)&v92);
    if (v93)
    {
      OUTLINED_FUNCTION_13_3(&v92);
      swift_isUniquelyReferenced_nonNull_native();
      v28 = *(_QWORD **)v26;
      v90 = *(_QWORD **)v26;
      *(_QWORD *)v26 = 0x8000000000000000;
      OUTLINED_FUNCTION_21_4();
      OUTLINED_FUNCTION_26_6();
      v33 = (char *)(v64 + v65);
      if (__OFADD__(v64, v65))
      {
        __break(1u);
LABEL_49:
        __break(1u);
LABEL_50:
        __break(1u);
        goto LABEL_51;
      }
      v23 = v62;
      v30 = v63;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF520);
      OUTLINED_FUNCTION_45_2();
      v66 = sub_1C2FC9C30();
      v33 = (char *)v87;
      if ((v66 & 1) != 0)
      {
        sub_1C2FC49E0(v89);
        if ((v30 & 1) != (v68 & 1))
          goto LABEL_53;
        v23 = v67;
      }
      v28 = v90;
      if ((v30 & 1) != 0)
      {
        __swift_destroy_boxed_opaque_existential_1(v90[7] + 32 * v23);
        OUTLINED_FUNCTION_15_6(v91);
      }
      else
      {
        OUTLINED_FUNCTION_46_3((uint64_t)&v90[v23 >> 6]);
        OUTLINED_FUNCTION_33_4(v75 + *(_QWORD *)(v31 + 72) * v23, v89, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 16));
        sub_1C2FC5D2C(v91, (_OWORD *)(v28[7] + 32 * v23));
        v76 = v28[2];
        v77 = __OFADD__(v76, 1);
        v78 = v76 + 1;
        if (v77)
          goto LABEL_50;
        v28[2] = v78;
        v28 = v90;
      }
      *(_QWORD *)v26 = v28;
      swift_bridgeObjectRelease();
      v23 = v89;
      (*(void (**)(uint64_t, char *))(v31 + 8))(v89, v33);
      v30 = v86;
    }
    else
    {
      OUTLINED_FUNCTION_8_6((uint64_t)&v92);
      OUTLINED_FUNCTION_303();
      OUTLINED_FUNCTION_21_4();
      v70 = v69;
      v72 = v71;
      OUTLINED_FUNCTION_11();
      if ((v72 & 1) != 0)
      {
        swift_isUniquelyReferenced_nonNull_native();
        v90 = *(_QWORD **)v26;
        *(_QWORD *)v26 = 0x8000000000000000;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF520);
        OUTLINED_FUNCTION_45_2();
        v33 = (char *)v87;
        sub_1C2FC9C30();
        v73 = *(void (**)(uint64_t, char *))(v31 + 8);
        v73(v90[6] + *(_QWORD *)(v31 + 72) * v70, v33);
        v74 = v90;
        OUTLINED_FUNCTION_13_3((_OWORD *)(v90[7] + 32 * v70));
        sub_1C2FC5D94(&qword_1ED7AF438, (uint64_t (*)(uint64_t))MEMORY[0x1E0D9EE08], MEMORY[0x1E0D9EE18]);
        sub_1C2FC9C3C();
        *(_QWORD *)v26 = v74;
        swift_bridgeObjectRelease();
      }
      else
      {
        memset(v91, 0, sizeof(v91));
        v73 = *(void (**)(uint64_t, char *))(v31 + 8);
      }
      v23 = v89;
      v73(v89, v33);
      OUTLINED_FUNCTION_8_6((uint64_t)v91);
    }
    OUTLINED_FUNCTION_8_6((uint64_t)v94);
    v28 = &unk_1ED7AF428;
    if (v50)
      goto LABEL_7;
  }
  v56 = *(_QWORD *)(v84 + 8 * v57);
  if (v56)
  {
LABEL_15:
    v55 = v57;
LABEL_12:
    v50 = (v56 - 1) & v56;
    v52 = __clz(__rbit64(v56)) + (v55 << 6);
    v88 = v55;
    goto LABEL_8;
  }
  while (1)
  {
    v55 = v57 + 1;
    if (__OFADD__(v57, 1))
      break;
    if (v55 >= v85)
    {
      v88 = v80;
      goto LABEL_29;
    }
    v56 = *(_QWORD *)(v84 + 8 * v55);
    ++v57;
    if (v56)
      goto LABEL_12;
  }
  __break(1u);
LABEL_53:
  sub_1C2FC9CCC();
  __break(1u);
}

uint64_t sub_1C2FC81D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  _OWORD v10[2];
  uint64_t v11;

  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x1E0DEE9E0];
  sub_1C2FC9774();
  if (*(_QWORD *)(a2 + 16) && (sub_1C2FC49E0(a1), (v8 & 1) != 0))
    sub_1C2FA30CC(*(_QWORD *)(a2 + 56) + 32 * v7, (uint64_t)v10);
  else
    memset(v10, 0, sizeof(v10));
  sub_1C2FC6380((uint64_t)v10, (uint64_t)v6);
  return v11;
}

void sub_1C2FC828C()
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
  uint64_t (*v11)(uint64_t);
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(unint64_t, uint64_t, uint64_t);
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void (*v33)(unint64_t, uint64_t, uint64_t);
  uint64_t v34;
  _QWORD *v35;
  _OWORD v36[2];
  _BYTE v37[32];

  OUTLINED_FUNCTION_30_1();
  v3 = v2;
  v5 = v4;
  v6 = OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_24_4();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_18_4();
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v30 - v9;
  sub_1C2FC5D94(&qword_1ED7AF438, v11, MEMORY[0x1E0D9EE18]);
  v12 = (_QWORD *)sub_1C2FC99A8();
  v13 = *(_QWORD *)(v5 + 16);
  if (!v13)
  {
LABEL_17:
    OUTLINED_FUNCTION_27();
    return;
  }
  v14 = v5;
  v15 = v5 + ((*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80));
  v16 = *(_QWORD *)(v0 + 72);
  v17 = *(void (**)(unint64_t, uint64_t, uint64_t))(v0 + 16);
  v30 = v14;
  swift_bridgeObjectRetain();
  v31 = v10;
  v32 = v3;
  v33 = v17;
  v34 = v16;
  while (1)
  {
    v17((unint64_t)v10, v15, v6);
    if (!*(_QWORD *)(v3 + 16) || (OUTLINED_FUNCTION_51_2(), (v19 & 1) == 0))
    {
      (*(void (**)(char *, uint64_t))(v0 + 8))(v10, v6);
      goto LABEL_15;
    }
    OUTLINED_FUNCTION_29_6(*(_QWORD *)(v3 + 56) + 32 * v18);
    OUTLINED_FUNCTION_41_4();
    v17(v1, (uint64_t)v10, v6);
    OUTLINED_FUNCTION_29_6((uint64_t)v37);
    swift_isUniquelyReferenced_nonNull_native();
    v35 = v12;
    sub_1C2FC49E0(v1);
    if (__OFADD__(v12[2], (v21 & 1) == 0))
      break;
    v22 = v20;
    v23 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7AF520);
    if ((sub_1C2FC9C30() & 1) != 0)
    {
      OUTLINED_FUNCTION_21_4();
      if ((v23 & 1) != (v25 & 1))
        goto LABEL_20;
      v22 = v24;
    }
    v12 = v35;
    if ((v23 & 1) != 0)
    {
      __swift_destroy_boxed_opaque_existential_1(v35[7] + 32 * v22);
      OUTLINED_FUNCTION_15_6(v36);
    }
    else
    {
      OUTLINED_FUNCTION_275((uint64_t)&v35[v22 >> 6]);
      v33(v12[6] + v22 * v34, v1, v6);
      sub_1C2FC5D2C(v36, (_OWORD *)(v12[7] + 32 * v22));
      v26 = v12[2];
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (v27)
        goto LABEL_19;
      v12[2] = v28;
      v12 = v35;
    }
    swift_bridgeObjectRelease();
    v29 = *(void (**)(uint64_t, uint64_t))(v0 + 8);
    v29(v1, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    v10 = v31;
    v29((uint64_t)v31, v6);
    v3 = v32;
    v17 = v33;
    v16 = v34;
LABEL_15:
    v15 += v16;
    if (!--v13)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  sub_1C2FC9CCC();
  __break(1u);
}

void sub_1C2FC8524(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t i;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  _OWORD v28[2];
  uint64_t v29;

  v2 = sub_1C2FC9708();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7AF560);
  v6 = sub_1C2FC9C60();
  v7 = (_QWORD *)v6;
  v8 = 0;
  v29 = a1;
  v11 = *(_QWORD *)(a1 + 64);
  v10 = a1 + 64;
  v9 = v11;
  v12 = 1 << *(_BYTE *)(v10 - 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v9;
  v26 = v10;
  v27 = (unint64_t)(v12 + 63) >> 6;
  v15 = v6 + 64;
  if ((v13 & v9) == 0)
    goto LABEL_5;
LABEL_4:
  v16 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  for (i = v16 | (v8 << 6); ; i = __clz(__rbit64(v19)) + (v8 << 6))
  {
    v21 = *(_QWORD *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v29 + 48) + v21, v2);
    memset(v28, 0, sizeof(v28));
    *(_QWORD *)(v15 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v7[6] + v21, v5, v2);
    sub_1C2F9BD98((uint64_t)v28, v7[7] + 32 * i, &qword_1ED7AEF88);
    v22 = v7[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v7[2] = v24;
    if (v14)
      goto LABEL_4;
LABEL_5:
    v18 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_24;
    if (v18 >= v27)
      return;
    v19 = *(_QWORD *)(v26 + 8 * v18);
    ++v8;
    if (!v19)
    {
      v8 = v18 + 1;
      if (v18 + 1 >= v27)
        return;
      v19 = *(_QWORD *)(v26 + 8 * v8);
      if (!v19)
      {
        v8 = v18 + 2;
        if (v18 + 2 >= v27)
          return;
        v19 = *(_QWORD *)(v26 + 8 * v8);
        if (!v19)
          break;
      }
    }
LABEL_18:
    v14 = (v19 - 1) & v19;
  }
  v20 = v18 + 3;
  if (v20 >= v27)
    return;
  v19 = *(_QWORD *)(v26 + 8 * v20);
  if (v19)
  {
    v8 = v20;
    goto LABEL_18;
  }
  while (1)
  {
    v8 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v8 >= v27)
      return;
    v19 = *(_QWORD *)(v26 + 8 * v8);
    ++v20;
    if (v19)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
}

uint64_t OUTLINED_FUNCTION_6_4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void OUTLINED_FUNCTION_8_6(uint64_t a1)
{
  uint64_t *v1;

  sub_1C2F9BD60(a1, v1);
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return swift_bridgeObjectRelease();
}

_OWORD *OUTLINED_FUNCTION_13_3(_OWORD *a1)
{
  uint64_t v1;

  return sub_1C2FC5D2C(a1, (_OWORD *)(v1 - 192));
}

_OWORD *OUTLINED_FUNCTION_15_6(_OWORD *a1)
{
  _OWORD *v1;

  return sub_1C2FC5D2C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_16_5()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_20_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 128) + 8))(v1, v0);
}

void OUTLINED_FUNCTION_21_4()
{
  uint64_t v0;

  sub_1C2FC49E0(v0);
}

uint64_t OUTLINED_FUNCTION_29_6(uint64_t a1)
{
  uint64_t v1;

  return sub_1C2FA30CC(a1, v1 - 144);
}

uint64_t OUTLINED_FUNCTION_30_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 160))(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_31_4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 152) = a3;
  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_33_4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_34_4()
{
  return sub_1C2FC9C30();
}

uint64_t OUTLINED_FUNCTION_35_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_36_2()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_38_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 - 256) = v1;
  return swift_bridgeObjectRetain();
}

_OWORD *OUTLINED_FUNCTION_41_4()
{
  uint64_t v0;

  return sub_1C2FC5D2C((_OWORD *)(v0 - 144), (_OWORD *)(v0 - 112));
}

uint64_t OUTLINED_FUNCTION_44_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_45_2()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_46_3(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 64) |= v1;
}

uint64_t OUTLINED_FUNCTION_47_4()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_49_3()
{
  uint64_t v0;

  return sub_1C2FA3740(v0 - 128, v0 - 160);
}

void OUTLINED_FUNCTION_50_2(uint64_t a1)
{
  uint64_t *v1;

  sub_1C2F9BD60(a1, v1);
}

void OUTLINED_FUNCTION_51_2()
{
  uint64_t v0;

  sub_1C2FC49E0(v0);
}

uint64_t sub_1C2FC8944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t sub_1C2FC894C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for UAFAssetSetObserverProvider()
{
  return objc_opt_self();
}

uint64_t sub_1C2FC897C()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1C2FC8988()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1C2FC8994()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1C2FC89A0()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1C2FC89AC()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1C2FC89B8()
{
  return MEMORY[0x1E0CB0830]();
}

uint64_t sub_1C2FC89C4()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1C2FC89D0()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1C2FC89DC()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1C2FC89E8()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1C2FC89F4()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1C2FC8A00()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1C2FC8A0C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1C2FC8A18()
{
  return MEMORY[0x1E0D98470]();
}

uint64_t sub_1C2FC8A24()
{
  return MEMORY[0x1E0DA7A20]();
}

uint64_t sub_1C2FC8A30()
{
  return MEMORY[0x1E0D03960]();
}

uint64_t sub_1C2FC8A3C()
{
  return MEMORY[0x1E0D03968]();
}

uint64_t sub_1C2FC8A48()
{
  return MEMORY[0x1E0D9C860]();
}

uint64_t sub_1C2FC8A54()
{
  return MEMORY[0x1E0D9CA18]();
}

uint64_t sub_1C2FC8A60()
{
  return MEMORY[0x1E0D9CA20]();
}

uint64_t sub_1C2FC8A6C()
{
  return MEMORY[0x1E0D9CA38]();
}

uint64_t sub_1C2FC8A78()
{
  return MEMORY[0x1E0D9CA40]();
}

uint64_t sub_1C2FC8A84()
{
  return MEMORY[0x1E0D9CA48]();
}

uint64_t sub_1C2FC8A90()
{
  return MEMORY[0x1E0D9CA50]();
}

uint64_t sub_1C2FC8A9C()
{
  return MEMORY[0x1E0D9CA58]();
}

uint64_t sub_1C2FC8AA8()
{
  return MEMORY[0x1E0D9CA60]();
}

uint64_t sub_1C2FC8AB4()
{
  return MEMORY[0x1E0D9CAD0]();
}

uint64_t sub_1C2FC8AC0()
{
  return MEMORY[0x1E0D9CAE0]();
}

uint64_t sub_1C2FC8ACC()
{
  return MEMORY[0x1E0D9CAE8]();
}

uint64_t sub_1C2FC8AD8()
{
  return MEMORY[0x1E0D9CAF0]();
}

uint64_t sub_1C2FC8AE4()
{
  return MEMORY[0x1E0D9CAF8]();
}

uint64_t sub_1C2FC8AF0()
{
  return MEMORY[0x1E0D9CB00]();
}

uint64_t sub_1C2FC8AFC()
{
  return MEMORY[0x1E0D9CB08]();
}

uint64_t sub_1C2FC8B08()
{
  return MEMORY[0x1E0D9CCD0]();
}

uint64_t sub_1C2FC8B14()
{
  return MEMORY[0x1E0D9CCD8]();
}

uint64_t sub_1C2FC8B20()
{
  return MEMORY[0x1E0D9CCF0]();
}

uint64_t sub_1C2FC8B2C()
{
  return MEMORY[0x1E0D9CCF8]();
}

uint64_t sub_1C2FC8B38()
{
  return MEMORY[0x1E0D9CD00]();
}

uint64_t sub_1C2FC8B44()
{
  return MEMORY[0x1E0D9CD08]();
}

uint64_t sub_1C2FC8B50()
{
  return MEMORY[0x1E0D9CD10]();
}

uint64_t sub_1C2FC8B5C()
{
  return MEMORY[0x1E0D9CD18]();
}

uint64_t sub_1C2FC8B68()
{
  return MEMORY[0x1E0D9CD20]();
}

uint64_t sub_1C2FC8B74()
{
  return MEMORY[0x1E0D9CD40]();
}

uint64_t sub_1C2FC8B80()
{
  return MEMORY[0x1E0D9CD50]();
}

uint64_t sub_1C2FC8B8C()
{
  return MEMORY[0x1E0D9CD58]();
}

uint64_t sub_1C2FC8B98()
{
  return MEMORY[0x1E0D9CD60]();
}

uint64_t sub_1C2FC8BA4()
{
  return MEMORY[0x1E0D9CD68]();
}

uint64_t sub_1C2FC8BB0()
{
  return MEMORY[0x1E0D9CD70]();
}

uint64_t sub_1C2FC8BBC()
{
  return MEMORY[0x1E0D9CD78]();
}

uint64_t sub_1C2FC8BC8()
{
  return MEMORY[0x1E0D9CD80]();
}

uint64_t sub_1C2FC8BD4()
{
  return MEMORY[0x1E0D9CD88]();
}

uint64_t sub_1C2FC8BE0()
{
  return MEMORY[0x1E0D9CF48]();
}

uint64_t sub_1C2FC8BEC()
{
  return MEMORY[0x1E0D9CF50]();
}

uint64_t sub_1C2FC8BF8()
{
  return MEMORY[0x1E0D9CF60]();
}

uint64_t sub_1C2FC8C04()
{
  return MEMORY[0x1E0D9CF68]();
}

uint64_t sub_1C2FC8C10()
{
  return MEMORY[0x1E0D9CF88]();
}

uint64_t sub_1C2FC8C1C()
{
  return MEMORY[0x1E0D9CF90]();
}

uint64_t sub_1C2FC8C28()
{
  return MEMORY[0x1E0D9CF98]();
}

uint64_t sub_1C2FC8C34()
{
  return MEMORY[0x1E0D9CFA0]();
}

uint64_t sub_1C2FC8C40()
{
  return MEMORY[0x1E0D9CFA8]();
}

uint64_t sub_1C2FC8C4C()
{
  return MEMORY[0x1E0D9CFB8]();
}

uint64_t sub_1C2FC8C58()
{
  return MEMORY[0x1E0D9CFC0]();
}

uint64_t sub_1C2FC8C64()
{
  return MEMORY[0x1E0D9CFC8]();
}

uint64_t sub_1C2FC8C70()
{
  return MEMORY[0x1E0D9CFD0]();
}

uint64_t sub_1C2FC8C7C()
{
  return MEMORY[0x1E0D9D240]();
}

uint64_t sub_1C2FC8C88()
{
  return MEMORY[0x1E0D9D248]();
}

uint64_t sub_1C2FC8C94()
{
  return MEMORY[0x1E0D9D290]();
}

uint64_t sub_1C2FC8CA0()
{
  return MEMORY[0x1E0D9D298]();
}

uint64_t sub_1C2FC8CAC()
{
  return MEMORY[0x1E0D9D2A0]();
}

uint64_t sub_1C2FC8CB8()
{
  return MEMORY[0x1E0D9D2A8]();
}

uint64_t sub_1C2FC8CC4()
{
  return MEMORY[0x1E0D9D2B0]();
}

uint64_t sub_1C2FC8CD0()
{
  return MEMORY[0x1E0D9D2B8]();
}

uint64_t sub_1C2FC8CDC()
{
  return MEMORY[0x1E0D9D2C0]();
}

uint64_t sub_1C2FC8CE8()
{
  return MEMORY[0x1E0D9D2C8]();
}

uint64_t sub_1C2FC8CF4()
{
  return MEMORY[0x1E0D9D2D0]();
}

uint64_t sub_1C2FC8D00()
{
  return MEMORY[0x1E0D9D498]();
}

uint64_t sub_1C2FC8D0C()
{
  return MEMORY[0x1E0D9D4A0]();
}

uint64_t sub_1C2FC8D18()
{
  return MEMORY[0x1E0D9D4A8]();
}

uint64_t sub_1C2FC8D24()
{
  return MEMORY[0x1E0D9D4B0]();
}

uint64_t sub_1C2FC8D30()
{
  return MEMORY[0x1E0D9D4B8]();
}

uint64_t sub_1C2FC8D3C()
{
  return MEMORY[0x1E0D9D4C0]();
}

uint64_t sub_1C2FC8D48()
{
  return MEMORY[0x1E0D9D4C8]();
}

uint64_t sub_1C2FC8D54()
{
  return MEMORY[0x1E0D9D4D0]();
}

uint64_t sub_1C2FC8D60()
{
  return MEMORY[0x1E0D9D4D8]();
}

uint64_t sub_1C2FC8D6C()
{
  return MEMORY[0x1E0D9D4E8]();
}

uint64_t sub_1C2FC8D78()
{
  return MEMORY[0x1E0D9D590]();
}

uint64_t sub_1C2FC8D84()
{
  return MEMORY[0x1E0D9D598]();
}

uint64_t sub_1C2FC8D90()
{
  return MEMORY[0x1E0D9D5A0]();
}

uint64_t sub_1C2FC8D9C()
{
  return MEMORY[0x1E0D9D5A8]();
}

uint64_t sub_1C2FC8DA8()
{
  return MEMORY[0x1E0D9D5B0]();
}

uint64_t sub_1C2FC8DB4()
{
  return MEMORY[0x1E0D9D5B8]();
}

uint64_t sub_1C2FC8DC0()
{
  return MEMORY[0x1E0D9D5C0]();
}

uint64_t sub_1C2FC8DCC()
{
  return MEMORY[0x1E0D9D5C8]();
}

uint64_t sub_1C2FC8DD8()
{
  return MEMORY[0x1E0D9D5D0]();
}

uint64_t sub_1C2FC8DE4()
{
  return MEMORY[0x1E0D9D5D8]();
}

uint64_t sub_1C2FC8DF0()
{
  return MEMORY[0x1E0D9D5E0]();
}

uint64_t sub_1C2FC8DFC()
{
  return MEMORY[0x1E0D9D5E8]();
}

uint64_t sub_1C2FC8E08()
{
  return MEMORY[0x1E0D9D5F0]();
}

uint64_t sub_1C2FC8E14()
{
  return MEMORY[0x1E0D9D5F8]();
}

uint64_t sub_1C2FC8E20()
{
  return MEMORY[0x1E0D9D648]();
}

uint64_t sub_1C2FC8E2C()
{
  return MEMORY[0x1E0D9D670]();
}

uint64_t sub_1C2FC8E38()
{
  return MEMORY[0x1E0D9D698]();
}

uint64_t sub_1C2FC8E44()
{
  return MEMORY[0x1E0D9D6A0]();
}

uint64_t sub_1C2FC8E50()
{
  return MEMORY[0x1E0D9D6A8]();
}

uint64_t sub_1C2FC8E5C()
{
  return MEMORY[0x1E0D9D6B0]();
}

uint64_t sub_1C2FC8E68()
{
  return MEMORY[0x1E0D9D6B8]();
}

uint64_t sub_1C2FC8E74()
{
  return MEMORY[0x1E0D9D6C0]();
}

uint64_t sub_1C2FC8E80()
{
  return MEMORY[0x1E0D9D6C8]();
}

uint64_t sub_1C2FC8E8C()
{
  return MEMORY[0x1E0D9D6D0]();
}

uint64_t sub_1C2FC8E98()
{
  return MEMORY[0x1E0D9D6D8]();
}

uint64_t sub_1C2FC8EA4()
{
  return MEMORY[0x1E0D9D758]();
}

uint64_t sub_1C2FC8EB0()
{
  return MEMORY[0x1E0D9D760]();
}

uint64_t sub_1C2FC8EBC()
{
  return MEMORY[0x1E0D9D9D0]();
}

uint64_t sub_1C2FC8EC8()
{
  return MEMORY[0x1E0D9D9D8]();
}

uint64_t sub_1C2FC8ED4()
{
  return MEMORY[0x1E0D9D9E0]();
}

uint64_t sub_1C2FC8EE0()
{
  return MEMORY[0x1E0D9D9E8]();
}

uint64_t sub_1C2FC8EEC()
{
  return MEMORY[0x1E0D9D9F0]();
}

uint64_t sub_1C2FC8EF8()
{
  return MEMORY[0x1E0D9D9F8]();
}

uint64_t sub_1C2FC8F04()
{
  return MEMORY[0x1E0D9DA00]();
}

uint64_t sub_1C2FC8F10()
{
  return MEMORY[0x1E0D9DA08]();
}

uint64_t sub_1C2FC8F1C()
{
  return MEMORY[0x1E0D9DA10]();
}

uint64_t sub_1C2FC8F28()
{
  return MEMORY[0x1E0D9DA30]();
}

uint64_t sub_1C2FC8F34()
{
  return MEMORY[0x1E0D9DA38]();
}

uint64_t sub_1C2FC8F40()
{
  return MEMORY[0x1E0D9DA40]();
}

uint64_t sub_1C2FC8F4C()
{
  return MEMORY[0x1E0D9DA48]();
}

uint64_t sub_1C2FC8F58()
{
  return MEMORY[0x1E0D9DA50]();
}

uint64_t sub_1C2FC8F64()
{
  return MEMORY[0x1E0D9DA58]();
}

uint64_t sub_1C2FC8F70()
{
  return MEMORY[0x1E0D9DA60]();
}

uint64_t sub_1C2FC8F7C()
{
  return MEMORY[0x1E0D9DA68]();
}

uint64_t sub_1C2FC8F88()
{
  return MEMORY[0x1E0D9DA70]();
}

uint64_t sub_1C2FC8F94()
{
  return MEMORY[0x1E0D9DA80]();
}

uint64_t sub_1C2FC8FA0()
{
  return MEMORY[0x1E0D9DA90]();
}

uint64_t sub_1C2FC8FAC()
{
  return MEMORY[0x1E0D9DA98]();
}

uint64_t sub_1C2FC8FB8()
{
  return MEMORY[0x1E0D9DAA0]();
}

uint64_t sub_1C2FC8FC4()
{
  return MEMORY[0x1E0D9DAA8]();
}

uint64_t sub_1C2FC8FD0()
{
  return MEMORY[0x1E0D9DAB0]();
}

uint64_t sub_1C2FC8FDC()
{
  return MEMORY[0x1E0D9DAB8]();
}

uint64_t sub_1C2FC8FE8()
{
  return MEMORY[0x1E0D9DAC0]();
}

uint64_t sub_1C2FC8FF4()
{
  return MEMORY[0x1E0D9DAC8]();
}

uint64_t sub_1C2FC9000()
{
  return MEMORY[0x1E0D9DAD0]();
}

uint64_t sub_1C2FC900C()
{
  return MEMORY[0x1E0D9DAD8]();
}

uint64_t sub_1C2FC9018()
{
  return MEMORY[0x1E0D9DAE0]();
}

uint64_t sub_1C2FC9024()
{
  return MEMORY[0x1E0D9DAE8]();
}

uint64_t sub_1C2FC9030()
{
  return MEMORY[0x1E0D9DC48]();
}

uint64_t sub_1C2FC903C()
{
  return MEMORY[0x1E0D9DC50]();
}

uint64_t sub_1C2FC9048()
{
  return MEMORY[0x1E0D9DC58]();
}

uint64_t sub_1C2FC9054()
{
  return MEMORY[0x1E0D9DC60]();
}

uint64_t sub_1C2FC9060()
{
  return MEMORY[0x1E0D9DC68]();
}

uint64_t sub_1C2FC906C()
{
  return MEMORY[0x1E0D9DC70]();
}

uint64_t sub_1C2FC9078()
{
  return MEMORY[0x1E0D9DC78]();
}

uint64_t sub_1C2FC9084()
{
  return MEMORY[0x1E0D9DC80]();
}

uint64_t sub_1C2FC9090()
{
  return MEMORY[0x1E0D9DC88]();
}

uint64_t sub_1C2FC909C()
{
  return MEMORY[0x1E0D9DC90]();
}

uint64_t sub_1C2FC90A8()
{
  return MEMORY[0x1E0D9DCA0]();
}

uint64_t sub_1C2FC90B4()
{
  return MEMORY[0x1E0D9DCB0]();
}

uint64_t sub_1C2FC90C0()
{
  return MEMORY[0x1E0D9DCB8]();
}

uint64_t sub_1C2FC90CC()
{
  return MEMORY[0x1E0D9DD28]();
}

uint64_t sub_1C2FC90D8()
{
  return MEMORY[0x1E0D9DD30]();
}

uint64_t sub_1C2FC90E4()
{
  return MEMORY[0x1E0D9DD38]();
}

uint64_t sub_1C2FC90F0()
{
  return MEMORY[0x1E0D9DD40]();
}

uint64_t sub_1C2FC90FC()
{
  return MEMORY[0x1E0D9DD48]();
}

uint64_t sub_1C2FC9108()
{
  return MEMORY[0x1E0D9DD50]();
}

uint64_t sub_1C2FC9114()
{
  return MEMORY[0x1E0D9DD58]();
}

uint64_t sub_1C2FC9120()
{
  return MEMORY[0x1E0D9DD60]();
}

uint64_t sub_1C2FC912C()
{
  return MEMORY[0x1E0D9DD68]();
}

uint64_t sub_1C2FC9138()
{
  return MEMORY[0x1E0D9DD70]();
}

uint64_t sub_1C2FC9144()
{
  return MEMORY[0x1E0D9DE18]();
}

uint64_t sub_1C2FC9150()
{
  return MEMORY[0x1E0D9DE20]();
}

uint64_t sub_1C2FC915C()
{
  return MEMORY[0x1E0D9DE28]();
}

uint64_t sub_1C2FC9168()
{
  return MEMORY[0x1E0D9DE30]();
}

uint64_t sub_1C2FC9174()
{
  return MEMORY[0x1E0D9DE38]();
}

uint64_t sub_1C2FC9180()
{
  return MEMORY[0x1E0D9DE40]();
}

uint64_t sub_1C2FC918C()
{
  return MEMORY[0x1E0D9DE48]();
}

uint64_t sub_1C2FC9198()
{
  return MEMORY[0x1E0D9DE50]();
}

uint64_t sub_1C2FC91A4()
{
  return MEMORY[0x1E0D9DE58]();
}

uint64_t sub_1C2FC91B0()
{
  return MEMORY[0x1E0D9DE60]();
}

uint64_t sub_1C2FC91BC()
{
  return MEMORY[0x1E0D9DE88]();
}

uint64_t sub_1C2FC91C8()
{
  return MEMORY[0x1E0D9DE90]();
}

uint64_t sub_1C2FC91D4()
{
  return MEMORY[0x1E0D9DE98]();
}

uint64_t sub_1C2FC91E0()
{
  return MEMORY[0x1E0D9DEA0]();
}

uint64_t sub_1C2FC91EC()
{
  return MEMORY[0x1E0D9DEA8]();
}

uint64_t sub_1C2FC91F8()
{
  return MEMORY[0x1E0D9DEB0]();
}

uint64_t sub_1C2FC9204()
{
  return MEMORY[0x1E0D9DEB8]();
}

uint64_t sub_1C2FC9210()
{
  return MEMORY[0x1E0D9DFA0]();
}

uint64_t sub_1C2FC921C()
{
  return MEMORY[0x1E0D9DFA8]();
}

uint64_t sub_1C2FC9228()
{
  return MEMORY[0x1E0D9DFB0]();
}

uint64_t sub_1C2FC9234()
{
  return MEMORY[0x1E0D9DFB8]();
}

uint64_t sub_1C2FC9240()
{
  return MEMORY[0x1E0D9DFC0]();
}

uint64_t sub_1C2FC924C()
{
  return MEMORY[0x1E0D9DFC8]();
}

uint64_t sub_1C2FC9258()
{
  return MEMORY[0x1E0D9DFD0]();
}

uint64_t sub_1C2FC9264()
{
  return MEMORY[0x1E0D9DFD8]();
}

uint64_t sub_1C2FC9270()
{
  return MEMORY[0x1E0D9DFE0]();
}

uint64_t sub_1C2FC927C()
{
  return MEMORY[0x1E0D9DFE8]();
}

uint64_t sub_1C2FC9288()
{
  return MEMORY[0x1E0D9DFF0]();
}

uint64_t sub_1C2FC9294()
{
  return MEMORY[0x1E0D9DFF8]();
}

uint64_t sub_1C2FC92A0()
{
  return MEMORY[0x1E0D9E000]();
}

uint64_t sub_1C2FC92AC()
{
  return MEMORY[0x1E0D9E008]();
}

uint64_t sub_1C2FC92B8()
{
  return MEMORY[0x1E0D9E010]();
}

uint64_t sub_1C2FC92C4()
{
  return MEMORY[0x1E0D9E018]();
}

uint64_t sub_1C2FC92D0()
{
  return MEMORY[0x1E0D9E020]();
}

uint64_t sub_1C2FC92DC()
{
  return MEMORY[0x1E0D9E028]();
}

uint64_t sub_1C2FC92E8()
{
  return MEMORY[0x1E0D9E030]();
}

uint64_t sub_1C2FC92F4()
{
  return MEMORY[0x1E0D9E038]();
}

uint64_t sub_1C2FC9300()
{
  return MEMORY[0x1E0D9E040]();
}

uint64_t sub_1C2FC930C()
{
  return MEMORY[0x1E0D9E048]();
}

uint64_t sub_1C2FC9318()
{
  return MEMORY[0x1E0D9E050]();
}

uint64_t sub_1C2FC9324()
{
  return MEMORY[0x1E0D9E058]();
}

uint64_t sub_1C2FC9330()
{
  return MEMORY[0x1E0D9E180]();
}

uint64_t sub_1C2FC933C()
{
  return MEMORY[0x1E0D9E188]();
}

uint64_t sub_1C2FC9348()
{
  return MEMORY[0x1E0D9E190]();
}

uint64_t sub_1C2FC9354()
{
  return MEMORY[0x1E0D9E198]();
}

uint64_t sub_1C2FC9360()
{
  return MEMORY[0x1E0D9E1A0]();
}

uint64_t sub_1C2FC936C()
{
  return MEMORY[0x1E0D9E1A8]();
}

uint64_t sub_1C2FC9378()
{
  return MEMORY[0x1E0D9E1B0]();
}

uint64_t sub_1C2FC9384()
{
  return MEMORY[0x1E0D9E1C0]();
}

uint64_t sub_1C2FC9390()
{
  return MEMORY[0x1E0D9E1C8]();
}

uint64_t sub_1C2FC939C()
{
  return MEMORY[0x1E0D9E1D0]();
}

uint64_t sub_1C2FC93A8()
{
  return MEMORY[0x1E0D9E1D8]();
}

uint64_t sub_1C2FC93B4()
{
  return MEMORY[0x1E0D9E1E0]();
}

uint64_t sub_1C2FC93C0()
{
  return MEMORY[0x1E0D9E1E8]();
}

uint64_t sub_1C2FC93CC()
{
  return MEMORY[0x1E0D9E1F0]();
}

uint64_t sub_1C2FC93D8()
{
  return MEMORY[0x1E0D9E1F8]();
}

uint64_t sub_1C2FC93E4()
{
  return MEMORY[0x1E0D9E208]();
}

uint64_t sub_1C2FC93F0()
{
  return MEMORY[0x1E0D9E218]();
}

uint64_t sub_1C2FC93FC()
{
  return MEMORY[0x1E0D9E220]();
}

uint64_t sub_1C2FC9408()
{
  return MEMORY[0x1E0D9E258]();
}

uint64_t sub_1C2FC9414()
{
  return MEMORY[0x1E0D9E260]();
}

uint64_t sub_1C2FC9420()
{
  return MEMORY[0x1E0D9E298]();
}

uint64_t sub_1C2FC942C()
{
  return MEMORY[0x1E0D9E2A0]();
}

uint64_t sub_1C2FC9438()
{
  return MEMORY[0x1E0D9E2A8]();
}

uint64_t sub_1C2FC9444()
{
  return MEMORY[0x1E0D9E2B0]();
}

uint64_t sub_1C2FC9450()
{
  return MEMORY[0x1E0D9E2B8]();
}

uint64_t sub_1C2FC945C()
{
  return MEMORY[0x1E0D9E2C0]();
}

uint64_t sub_1C2FC9468()
{
  return MEMORY[0x1E0D9E2C8]();
}

uint64_t sub_1C2FC9474()
{
  return MEMORY[0x1E0D9E2D0]();
}

uint64_t sub_1C2FC9480()
{
  return MEMORY[0x1E0D9E2D8]();
}

uint64_t sub_1C2FC948C()
{
  return MEMORY[0x1E0D9E320]();
}

uint64_t sub_1C2FC9498()
{
  return MEMORY[0x1E0D9E328]();
}

uint64_t sub_1C2FC94A4()
{
  return MEMORY[0x1E0D9E330]();
}

uint64_t sub_1C2FC94B0()
{
  return MEMORY[0x1E0D9E338]();
}

uint64_t sub_1C2FC94BC()
{
  return MEMORY[0x1E0D9E340]();
}

uint64_t sub_1C2FC94C8()
{
  return MEMORY[0x1E0D9E348]();
}

uint64_t sub_1C2FC94D4()
{
  return MEMORY[0x1E0D9E358]();
}

uint64_t sub_1C2FC94E0()
{
  return MEMORY[0x1E0D9E360]();
}

uint64_t sub_1C2FC94EC()
{
  return MEMORY[0x1E0D9E368]();
}

uint64_t sub_1C2FC94F8()
{
  return MEMORY[0x1E0D9E4A0]();
}

uint64_t sub_1C2FC9504()
{
  return MEMORY[0x1E0D9E4A8]();
}

uint64_t sub_1C2FC9510()
{
  return MEMORY[0x1E0D9E4B0]();
}

uint64_t sub_1C2FC951C()
{
  return MEMORY[0x1E0D9E4B8]();
}

uint64_t sub_1C2FC9528()
{
  return MEMORY[0x1E0D9E4C0]();
}

uint64_t sub_1C2FC9534()
{
  return MEMORY[0x1E0D9E4C8]();
}

uint64_t sub_1C2FC9540()
{
  return MEMORY[0x1E0D9E4D8]();
}

uint64_t sub_1C2FC954C()
{
  return MEMORY[0x1E0D9E4E0]();
}

uint64_t sub_1C2FC9558()
{
  return MEMORY[0x1E0D9E4E8]();
}

uint64_t sub_1C2FC9564()
{
  return MEMORY[0x1E0D9E4F0]();
}

uint64_t sub_1C2FC9570()
{
  return MEMORY[0x1E0D9E510]();
}

uint64_t sub_1C2FC957C()
{
  return MEMORY[0x1E0D9E518]();
}

uint64_t sub_1C2FC9588()
{
  return MEMORY[0x1E0D9E520]();
}

uint64_t sub_1C2FC9594()
{
  return MEMORY[0x1E0D9E600]();
}

uint64_t sub_1C2FC95A0()
{
  return MEMORY[0x1E0D9E608]();
}

uint64_t sub_1C2FC95AC()
{
  return MEMORY[0x1E0D9E610]();
}

uint64_t sub_1C2FC95B8()
{
  return MEMORY[0x1E0D9E618]();
}

uint64_t sub_1C2FC95C4()
{
  return MEMORY[0x1E0D9E620]();
}

uint64_t sub_1C2FC95D0()
{
  return MEMORY[0x1E0D9E660]();
}

uint64_t sub_1C2FC95DC()
{
  return MEMORY[0x1E0D9E670]();
}

uint64_t sub_1C2FC95E8()
{
  return MEMORY[0x1E0D9E7D8]();
}

uint64_t sub_1C2FC95F4()
{
  return MEMORY[0x1E0D9E7E0]();
}

uint64_t sub_1C2FC9600()
{
  return MEMORY[0x1E0D9EB40]();
}

uint64_t sub_1C2FC960C()
{
  return MEMORY[0x1E0D9EB48]();
}

uint64_t sub_1C2FC9618()
{
  return MEMORY[0x1E0D9EB50]();
}

uint64_t sub_1C2FC9624()
{
  return MEMORY[0x1E0D9EB68]();
}

uint64_t sub_1C2FC9630()
{
  return MEMORY[0x1E0D9EB78]();
}

uint64_t sub_1C2FC963C()
{
  return MEMORY[0x1E0D9EB80]();
}

uint64_t sub_1C2FC9648()
{
  return MEMORY[0x1E0D9EB88]();
}

uint64_t sub_1C2FC9654()
{
  return MEMORY[0x1E0D9EB90]();
}

uint64_t sub_1C2FC9660()
{
  return MEMORY[0x1E0D9EB98]();
}

uint64_t sub_1C2FC966C()
{
  return MEMORY[0x1E0D9EBA0]();
}

uint64_t sub_1C2FC9678()
{
  return MEMORY[0x1E0D9EC88]();
}

uint64_t sub_1C2FC9684()
{
  return MEMORY[0x1E0D9ECB0]();
}

uint64_t sub_1C2FC9690()
{
  return MEMORY[0x1E0D9ECC8]();
}

uint64_t sub_1C2FC969C()
{
  return MEMORY[0x1E0D9ECD8]();
}

uint64_t sub_1C2FC96A8()
{
  return MEMORY[0x1E0D9ECE0]();
}

uint64_t sub_1C2FC96B4()
{
  return MEMORY[0x1E0D9ED60]();
}

uint64_t sub_1C2FC96C0()
{
  return MEMORY[0x1E0D9ED78]();
}

uint64_t sub_1C2FC96CC()
{
  return MEMORY[0x1E0D9ED80]();
}

uint64_t sub_1C2FC96D8()
{
  return MEMORY[0x1E0D9ED88]();
}

uint64_t sub_1C2FC96E4()
{
  return MEMORY[0x1E0D9ED90]();
}

uint64_t sub_1C2FC96F0()
{
  return MEMORY[0x1E0D9ED98]();
}

uint64_t sub_1C2FC96FC()
{
  return MEMORY[0x1E0D9EE00]();
}

uint64_t sub_1C2FC9708()
{
  return MEMORY[0x1E0D9EE08]();
}

uint64_t sub_1C2FC9714()
{
  return MEMORY[0x1E0D9EE60]();
}

uint64_t sub_1C2FC9720()
{
  return MEMORY[0x1E0D9EE78]();
}

uint64_t sub_1C2FC972C()
{
  return MEMORY[0x1E0D9EF38]();
}

uint64_t sub_1C2FC9738()
{
  return MEMORY[0x1E0D9EF40]();
}

uint64_t sub_1C2FC9744()
{
  return MEMORY[0x1E0D9EF48]();
}

uint64_t sub_1C2FC9750()
{
  return MEMORY[0x1E0D9EF50]();
}

uint64_t sub_1C2FC975C()
{
  return MEMORY[0x1E0D9EF58]();
}

uint64_t sub_1C2FC9768()
{
  return MEMORY[0x1E0D9EF60]();
}

uint64_t sub_1C2FC9774()
{
  return MEMORY[0x1E0D9EF68]();
}

uint64_t sub_1C2FC9780()
{
  return MEMORY[0x1E0D9EF70]();
}

uint64_t sub_1C2FC978C()
{
  return MEMORY[0x1E0D9EF78]();
}

uint64_t sub_1C2FC9798()
{
  return MEMORY[0x1E0D9EF80]();
}

uint64_t sub_1C2FC97A4()
{
  return MEMORY[0x1E0D98450]();
}

uint64_t sub_1C2FC97B0()
{
  return MEMORY[0x1E0D98898]();
}

uint64_t sub_1C2FC97BC()
{
  return MEMORY[0x1E0DA4560]();
}

uint64_t sub_1C2FC97C8()
{
  return MEMORY[0x1E0DA4568]();
}

uint64_t sub_1C2FC97D4()
{
  return MEMORY[0x1E0DA4570]();
}

uint64_t sub_1C2FC97E0()
{
  return MEMORY[0x1E0DA4578]();
}

uint64_t sub_1C2FC97EC()
{
  return MEMORY[0x1E0DA4580]();
}

uint64_t sub_1C2FC97F8()
{
  return MEMORY[0x1E0DA4588]();
}

uint64_t sub_1C2FC9804()
{
  return MEMORY[0x1E0DA4598]();
}

uint64_t sub_1C2FC9810()
{
  return MEMORY[0x1E0DA45A0]();
}

uint64_t sub_1C2FC981C()
{
  return MEMORY[0x1E0DA45A8]();
}

uint64_t sub_1C2FC9828()
{
  return MEMORY[0x1E0DA45E8]();
}

uint64_t sub_1C2FC9834()
{
  return MEMORY[0x1E0DA45F0]();
}

uint64_t sub_1C2FC9840()
{
  return MEMORY[0x1E0DA45F8]();
}

uint64_t sub_1C2FC984C()
{
  return MEMORY[0x1E0DA4600]();
}

uint64_t sub_1C2FC9858()
{
  return MEMORY[0x1E0DA4608]();
}

uint64_t sub_1C2FC9864()
{
  return MEMORY[0x1E0DA4610]();
}

uint64_t sub_1C2FC9870()
{
  return MEMORY[0x1E0DA4618]();
}

uint64_t sub_1C2FC987C()
{
  return MEMORY[0x1E0DA4658]();
}

uint64_t sub_1C2FC9888()
{
  return MEMORY[0x1E0DA46D0]();
}

uint64_t sub_1C2FC9894()
{
  return MEMORY[0x1E0DA46D8]();
}

uint64_t sub_1C2FC98A0()
{
  return MEMORY[0x1E0DA46F8]();
}

uint64_t sub_1C2FC98AC()
{
  return MEMORY[0x1E0D87BD0]();
}

uint64_t sub_1C2FC98B8()
{
  return MEMORY[0x1E0D87BD8]();
}

uint64_t sub_1C2FC98C4()
{
  return MEMORY[0x1E0D87BE0]();
}

uint64_t sub_1C2FC98D0()
{
  return MEMORY[0x1E0D87BE8]();
}

uint64_t sub_1C2FC98DC()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1C2FC98E8()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1C2FC98F4()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1C2FC9900()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1C2FC990C()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1C2FC9918()
{
  return MEMORY[0x1E0DEF570]();
}

uint64_t sub_1C2FC9924()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1C2FC9930()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1C2FC993C()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1C2FC9948()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1C2FC9954()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1C2FC9960()
{
  return MEMORY[0x1E0DEF708]();
}

uint64_t sub_1C2FC996C()
{
  return MEMORY[0x1E0DEF710]();
}

uint64_t sub_1C2FC9978()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t sub_1C2FC9984()
{
  return MEMORY[0x1E0DEF758]();
}

uint64_t sub_1C2FC9990()
{
  return MEMORY[0x1E0CF21C8]();
}

uint64_t sub_1C2FC999C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1C2FC99A8()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1C2FC99B4()
{
  return MEMORY[0x1E0DE9E90]();
}

uint64_t sub_1C2FC99C0()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1C2FC99CC()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1C2FC99D8()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1C2FC99E4()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1C2FC99F0()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1C2FC99FC()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1C2FC9A08()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1C2FC9A14()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1C2FC9A20()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1C2FC9A2C()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1C2FC9A38()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1C2FC9A44()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1C2FC9A50()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1C2FC9A5C()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1C2FC9A68()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1C2FC9A74()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1C2FC9A80()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1C2FC9A8C()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1C2FC9A98()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1C2FC9AA4()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1C2FC9AB0()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1C2FC9ABC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1C2FC9AC8()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1C2FC9AD4()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1C2FC9AE0()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1C2FC9AEC()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1C2FC9AF8()
{
  return MEMORY[0x1E0D9EFF0]();
}

uint64_t sub_1C2FC9B04()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1C2FC9B10()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1C2FC9B1C()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1C2FC9B28()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1C2FC9B34()
{
  return MEMORY[0x1E0CB1E98]();
}

uint64_t sub_1C2FC9B40()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1C2FC9B4C()
{
  return MEMORY[0x1E0DEF848]();
}

uint64_t sub_1C2FC9B58()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1C2FC9B64()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1C2FC9B70()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1C2FC9B7C()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1C2FC9B88()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1C2FC9B94()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1C2FC9BA0()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1C2FC9BAC()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1C2FC9BB8()
{
  return MEMORY[0x1E0CB2410]();
}

uint64_t sub_1C2FC9BC4()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1C2FC9BD0()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1C2FC9BDC()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1C2FC9BE8()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1C2FC9BF4()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1C2FC9C00()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1C2FC9C0C()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1C2FC9C18()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1C2FC9C24()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1C2FC9C30()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1C2FC9C3C()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1C2FC9C48()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1C2FC9C54()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1C2FC9C60()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1C2FC9C6C()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1C2FC9C78()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1C2FC9C84()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1C2FC9C90()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1C2FC9C9C()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1C2FC9CA8()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1C2FC9CB4()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1C2FC9CC0()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1C2FC9CCC()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1C2FC9CD8()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1C2FC9CE4()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1C2FC9CF0()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1C2FC9CFC()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1C2FC9D08()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C2FC9D14()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1C2FC9D20()
{
  return MEMORY[0x1E0DEDF78]();
}

uint64_t sub_1C2FC9D2C()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t sub_1C2FC9D38()
{
  return MEMORY[0x1E0DEDF90]();
}

uint64_t sub_1C2FC9D44()
{
  return MEMORY[0x1E0DEE000]();
}

uint64_t sub_1C2FC9D50()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1C2FC9D5C()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1C2FC9D68()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1C2FC9D74()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1C2FC9D80()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AFDeviceSupportsBobble()
{
  return MEMORY[0x1E0CFE3F8]();
}

uint64_t AFDeviceSupportsHybridUOD()
{
  return MEMORY[0x1E0CFE418]();
}

uint64_t AFDeviceSupportsMedoc()
{
  return MEMORY[0x1E0CFE420]();
}

uint64_t AFDeviceSupportsSiriUOD()
{
  return MEMORY[0x1E0CFE460]();
}

uint64_t AFExternalNotificationRequestHandlerStateGetName()
{
  return MEMORY[0x1E0CFE4A0]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x1E0CFE4D0]();
}

uint64_t AFOfflineDictationCapable()
{
  return MEMORY[0x1E0CFE580]();
}

uint64_t AFShouldRunAsrOnServerForUOD()
{
  return MEMORY[0x1E0CFE610]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
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

uint64_t swift_unownedRelease()
{
  return MEMORY[0x1E0DEEF60]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x1E0DEEF68]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x1E0DEEF70]();
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

