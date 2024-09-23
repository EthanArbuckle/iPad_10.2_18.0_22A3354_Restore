uint64_t sub_1921BFFF0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 56) = v0;
  return swift_task_switch();
}

void sub_1921C0008(uint64_t a1)
{
  os_unfair_lock_s *v2;

  if (qword_1ECFD72B8 != -1)
    swift_once();
  v2 = (os_unfair_lock_s *)(qword_1ECFD7328 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_1ECFD7328 + 16));
  qword_1EE2514A0 = a1;
  os_unfair_lock_unlock(v2);
}

uint64_t RTCReportingInitWithSessionInfoDict(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  RTCReporting *v8;
  _QWORD *v9;
  _QWORD v11[5];

  v8 = [RTCReporting alloc];
  if (a4)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __RTCReportingInitWithSessionInfoDict_block_invoke;
    v11[3] = &unk_1E2EB2CB8;
    v11[4] = a4;
    v9 = v11;
  }
  else
  {
    v9 = 0;
  }
  return (uint64_t)-[RTCReporting initWithSessionInfo:userInfo:frameworksToCheck:aggregationBlock:](v8, "initWithSessionInfo:userInfo:frameworksToCheck:aggregationBlock:", a1, a2, a3, v9);
}

uint64_t sub_1921C0188()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 56) + 320) = 2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1921C019C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_1921DBB98();
  __break(1u);
  return result;
}

BOOL sub_1921C0378()
{
  uint64_t v0;

  return *(_BYTE *)(v0 + 320) == 0;
}

void static _RTCReportingS.newHierarchyTokenFromParentToken(_:)(void *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[2];
  __int128 v17;
  uint64_t v18;
  _OWORD v19[2];

  sub_1921DB850();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_10();
  if (!a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1ECFD6EB8);
    v6 = OUTLINED_FUNCTION_21_0();
    v7 = MEMORY[0x1E0DEA968];
    *(_OWORD *)(v6 + 16) = xmmword_1921DE060;
    *(_QWORD *)(v6 + 56) = v7;
    *(_QWORD *)(v6 + 32) = 0x6E656B6F74;
    *(_QWORD *)(v6 + 40) = 0xE500000000000000;
    sub_1921DB844();
    v8 = sub_1921DB820();
    v10 = v9;
    v11 = OUTLINED_FUNCTION_38_1();
    v12(v11);
    *(_QWORD *)(v6 + 64) = v8;
    *(_QWORD *)(v6 + 72) = v10;
    *(_QWORD *)(v6 + 88) = v7;
    *(_QWORD *)(v6 + 96) = 0x6C6576656CLL;
    *(_QWORD *)(v6 + 104) = 0xE500000000000000;
    *(_QWORD *)(v6 + 152) = MEMORY[0x1E0DEB418];
    *(_QWORD *)(v6 + 120) = v7;
    *(_QWORD *)(v6 + 128) = 1;
    sub_1921C90C0(0, (unint64_t *)&unk_1ECFD7210);
    sub_1921DBA0C();
    goto LABEL_16;
  }
  objc_opt_self();
  if (!swift_dynamicCastObjCClass())
  {
LABEL_16:
    OUTLINED_FUNCTION_42_1();
    return;
  }
  *(_QWORD *)&v17 = 0x6E656B6F74;
  *((_QWORD *)&v17 + 1) = 0xE500000000000000;
  v2 = a1;
  sub_1921DBBE0();
  v3 = OUTLINED_FUNCTION_49_1();
  swift_unknownObjectRelease();
  if (!v3)
  {

    goto LABEL_16;
  }
  sub_1921DBAD8();
  swift_unknownObjectRelease();
  sub_1921C86E8(&v17, v19);
  *(_QWORD *)&v16[0] = 0x6C6576656CLL;
  *((_QWORD *)&v16[0] + 1) = 0xE500000000000000;
  v4 = MEMORY[0x1E0DEA968];
  sub_1921DBBE0();
  v5 = OUTLINED_FUNCTION_49_1();
  swift_unknownObjectRelease();
  if (v5)
  {
    sub_1921DBAD8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
  }
  sub_1921C86F8((uint64_t)v16, (uint64_t)&v17, &qword_1ECFD7320);
  if (!v18)
  {

    sub_1921C6C0C((uint64_t)&v17, &qword_1ECFD7320);
LABEL_15:
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    goto LABEL_16;
  }
  v13 = MEMORY[0x1E0DEB418];
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_15;
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_1ECFD6EB8);
  v14 = OUTLINED_FUNCTION_21_0();
  *(_OWORD *)(v14 + 16) = xmmword_1921DE060;
  *(_QWORD *)(v14 + 56) = v4;
  *(_QWORD *)(v14 + 32) = 0x6E656B6F74;
  *(_QWORD *)(v14 + 40) = 0xE500000000000000;
  sub_1921C9084((uint64_t)v19, v14 + 64);
  *(_QWORD *)(v14 + 120) = v4;
  *(_QWORD *)(v14 + 96) = 0x6C6576656CLL;
  *(_QWORD *)(v14 + 104) = 0xE500000000000000;
  if (!__OFADD__(v15, 1))
  {
    *(_QWORD *)(v14 + 152) = v13;
    *(_QWORD *)(v14 + 128) = v15 + 1;
    sub_1921C90C0(0, (unint64_t *)&unk_1ECFD7210);
    sub_1921DBA0C();

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    goto LABEL_16;
  }
  __break(1u);
}

uint64_t sub_1921C06BC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_8_0();
  if (!v0)
  {
    OUTLINED_FUNCTION_47();
    swift_unknownObjectRelease();
  }
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1921C07DC(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_1921C0800()
{
  uint64_t v0;
  uint64_t v2;
  __int128 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_75(&v3);
  if (v4)
  {
    if ((OUTLINED_FUNCTION_38_0() & 1) == 0)
    {
      OUTLINED_FUNCTION_35_0();
      return 0;
    }
    v0 = v2;
    OUTLINED_FUNCTION_75(&v3);
    OUTLINED_FUNCTION_35_0();
    if (v4)
    {
      if ((OUTLINED_FUNCTION_38_0() & 1) != 0)
        return v0;
      return 0;
    }
  }
  else
  {
    OUTLINED_FUNCTION_35_0();
  }
  sub_1921C3940((uint64_t)&v3, &qword_1ECFD7320);
  return 0;
}

uint64_t sub_1921C08C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  xpc_object_t v12;
  _QWORD *v13;
  uint64_t v14;
  char v15;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v1 + 184);
  if (v2 && *(_BYTE *)(v1 + 320))
  {
    v3 = *(_QWORD *)(v1 + 176);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72C8);
    v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7310);
    v5 = *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80);
    v6 = (v5 + 32) & ~v5;
    v7 = OUTLINED_FUNCTION_74();
    *(_OWORD *)(v7 + 16) = xmmword_1921DDD20;
    v8 = (_QWORD *)(v7 + v6);
    v9 = (_QWORD *)(v7 + v6 + *(int *)(v4 + 48));
    swift_bridgeObjectRetain();
    v10 = MessageKeys.sessionID.unsafeMutableAddressor();
    v11 = v10[1];
    *v8 = *v10;
    v8[1] = v11;
    *v9 = v3;
    v9[1] = v2;
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_41();
    v12 = RTCXPCDictionary.init(dictionaryLiteral:)(v7);
    *(_QWORD *)(v0 + 64) = XPCMessage.init(ty:payload:)(1u, v12);
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 72) = v13;
    v14 = OUTLINED_FUNCTION_20_0(v13, (uint64_t)sub_1921C06BC);
    return XPCConnection.sendWithReply(_:)(v14, v15);
  }
  else
  {
    *(_BYTE *)(v1 + 320) = 2;
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

void static _RTCReportingS.sendOneMessage(sessionInfo:userInfo:category:type:payload:)(uint64_t a1, uint64_t a2, __int16 a3, __int16 a4, uint64_t a5)
{
  objc_class *v5;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;

  v11 = objc_allocWithZone(v5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  _RTCReportingS.init(sessionInfo:userInfo:frameworksToCheck:)(a1, a2, 0);
  if (v12)
  {
    v13 = v12;
    OUTLINED_FUNCTION_58_0();
    v14 = swift_allocObject();
    *(_WORD *)(v14 + 16) = a3;
    *(_WORD *)(v14 + 18) = a4;
    *(_QWORD *)(v14 + 24) = a5;
    *(_QWORD *)(v14 + 32) = v13;
    OUTLINED_FUNCTION_86();
    v15 = v13;
    _RTCReportingS.startConfiguration(completionHandler:)(sub_1921C10D4, v14);

    swift_release();
  }
  else
  {
    if (qword_1ECFD73A0 != -1)
      swift_once();
    v16 = sub_1921DB874();
    __swift_project_value_buffer(v16, (uint64_t)qword_1ECFD7368);
    v17 = sub_1921DB85C();
    v18 = sub_1921DBA30();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1921BE000, v17, v18, "failed to create session for sendOneMessage", v19, 2u);
      MEMORY[0x194024230](v19, -1, -1);
    }

  }
}

uint64_t type metadata accessor for Session()
{
  uint64_t result;

  result = qword_1ECFD7390;
  if (!qword_1ECFD7390)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1921C0CC4(uint64_t a1)
{
  uint64_t result;
  unsigned __int16 v2;

  switch(a1)
  {
    case 0:
      result = 19795;
      break;
    case 1:
      result = 20035;
      break;
    case 2:
      result = 5521742;
      break;
    case 3:
      result = 20308;
      break;
    case 4:
      result = 21330;
      break;
    case 5:
      result = 19271;
      break;
    case 6:
      result = 19779;
      break;
    case 7:
      result = 17238;
      break;
    case 8:
      result = 22100;
      break;
    case 9:
      result = 21065;
      break;
    case 10:
      result = 18259;
      break;
    case 11:
      result = 21580;
      break;
    case 12:
      result = 1096307535;
      break;
    case 13:
      result = 0x4D41434B48;
      break;
    case 14:
      result = 0x534C482D4D43;
      break;
    case 15:
      result = 0x53424152432D4D43;
      break;
    case 16:
      result = 0x53425550564544;
      break;
    case 17:
      result = 0x534F45444956;
      break;
    case 18:
      result = 0x54455353414C424DLL;
      break;
    case 19:
      result = 16707;
      break;
    case 20:
      result = 4282189;
      break;
    case 21:
      result = 16979;
      break;
    case 22:
      result = 20545;
      break;
    case 23:
      result = 19282;
      break;
    case 24:
      result = 1280332353;
      break;
    case 25:
      v2 = 17481;
      goto LABEL_43;
    case 26:
      result = 1196577875;
      break;
    case 27:
      result = 21844;
      break;
    case 28:
      result = 22350;
      break;
    case 29:
      result = 18755;
      break;
    case 30:
      result = 1413566532;
      break;
    case 31:
      result = 5524567;
      break;
    case 32:
      result = 21074;
      break;
    case 33:
      result = 5264215;
      break;
    case 34:
      result = 1279611464;
      break;
    case 35:
      result = 0x6C6F6F74637472;
      break;
    case 36:
      result = 0x4C444F2D4D43;
      break;
    case 37:
      result = 16708;
      break;
    case 38:
      result = 4473923;
      break;
    case 39:
      v2 = 21582;
LABEL_43:
      result = v2 | 0x530000u;
      break;
    case 40:
      result = 5657156;
      break;
    case 41:
      result = 4407892;
      break;
    case 42:
      result = 5850443;
      break;
    case 43:
      result = 5457744;
      break;
    case 44:
      result = 5390926;
      break;
    case 45:
      result = 5723214;
      break;
    case 46:
      result = 0x4C4D2D4D43;
      break;
    case 47:
      result = 1263685463;
      break;
    case 48:
      result = 1161973583;
      break;
    case 49:
      result = 5263171;
      break;
    case 50:
      result = 21062;
      break;
    case 51:
      result = 4932429;
      break;
    case 52:
      result = 5394497;
      break;
    case 53:
      result = 0x46502D4D43;
      break;
    case 54:
      result = 0x5041432D4D43;
      break;
    case 55:
      result = 0x322D544C57;
      break;
    case 56:
      result = 1280329811;
      break;
    case 57:
      result = 5522771;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t sub_1921C1080(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void sub_1921C10D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 32);
  sub_1921C10E4(a1, *(_WORD *)(v1 + 16), *(_WORD *)(v1 + 18), *(Swift::OpaquePointer_optional *)&v2);
}

void sub_1921C10E4(uint64_t a1, Swift::UInt16 category, Swift::UInt16 type, Swift::OpaquePointer_optional payload)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  NSObject *oslog;
  uint64_t v18;

  if (a1)
  {
    v7 = v6;
    _RTCReportingS.sendMessage(category:type:payload:)(category, type, *(Swift::OpaquePointer_optional *)(&v6 - 1));
    if (v8)
    {
      if (qword_1ECFD73A0 != -1)
        swift_once();
      v9 = sub_1921DB874();
      __swift_project_value_buffer(v9, (uint64_t)qword_1ECFD7368);
      v10 = v8;
      v11 = v8;
      oslog = sub_1921DB85C();
      v12 = sub_1921DBA30();
      if (os_log_type_enabled(oslog, v12))
      {
        v13 = (uint8_t *)swift_slowAlloc();
        v14 = swift_slowAlloc();
        v18 = v14;
        *(_DWORD *)v13 = 136446210;
        swift_getErrorValue();
        v15 = sub_1921DBC1C();
        sub_1921CACB8(v15, v16, &v18);
        sub_1921DBA90();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1921BE000, oslog, v12, "sendOneMessage failed: %{public}s", v13, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x194024230](v14, -1, -1);
        MEMORY[0x194024230](v13, -1, -1);

      }
      else
      {

      }
    }
  }
}

uint64_t sub_1921C12E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_24_0();
}

uint64_t Session.__deallocating_deinit()
{
  Session.deinit();
  return swift_defaultActor_deallocate();
}

uint64_t *Session.deinit()
{
  uint64_t *v0;
  char *v1;
  uint64_t v2;
  void (*v3)(char *, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_1921CC1EC(v0[26], v0[27], v0[28], v0[29]);
  swift_release();
  sub_1921C1508(v0[41]);
  v1 = (char *)v0 + OBJC_IVAR____TtC12RTCReporting7Session_baseTime;
  v2 = OUTLINED_FUNCTION_64();
  v3 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3((char *)v0 + OBJC_IVAR____TtC12RTCReporting7Session_obfuscatedBaseTime, v2);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1921C1440()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_unknownObjectRelease();
  v1 = *(_QWORD *)(v0 + 592);
  v2 = *(_QWORD *)(v0 + 576);
  swift_unknownObjectRelease();
  sub_1921C1508(v2);
  sub_1921C1508(v1);
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_43_0();
  OUTLINED_FUNCTION_59();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 448));
}

uint64_t sub_1921C1508(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1921C1518()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1921C1584(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  unint64_t i;
  int64_t v19;
  _QWORD *v20;
  unint64_t v21;
  int64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v41 = *(_QWORD *)(type metadata accessor for EventValue() - 8);
  OUTLINED_FUNCTION_74_0();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_10();
  v7 = v6 - v5;
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6EA0);
  v42 = a2;
  v9 = sub_1921DBB80();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_40;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v40 = v8 + 64;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  else
    v12 = -1;
  v13 = v12 & *(_QWORD *)(v8 + 64);
  v38 = v2;
  v39 = (unint64_t)(v11 + 63) >> 6;
  v14 = v9 + 64;
  result = OUTLINED_FUNCTION_83();
  v16 = 0;
  if (!v13)
    goto LABEL_7;
LABEL_6:
  v17 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v17 | (v16 << 6); ; i = __clz(__rbit64(v21)) + (v16 << 6))
  {
    v23 = (uint64_t *)(*(_QWORD *)(v8 + 48) + 16 * i);
    v25 = *v23;
    v24 = v23[1];
    v26 = *(_QWORD *)(v41 + 72);
    v27 = *(_QWORD *)(v8 + 56) + v26 * i;
    if ((v42 & 1) != 0)
    {
      sub_1921C852C(v27, v7);
    }
    else
    {
      sub_1921C78F8(v27, v7);
      swift_bridgeObjectRetain();
    }
    sub_1921DBC64();
    sub_1921DB958();
    result = sub_1921DBC88();
    v28 = -1 << *(_BYTE *)(v10 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6))) == 0)
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v28) >> 6;
      while (++v30 != v33 || (v32 & 1) == 0)
      {
        v34 = v30 == v33;
        if (v30 == v33)
          v30 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v14 + 8 * v30);
        if (v35 != -1)
        {
          v31 = __clz(__rbit64(~v35)) + (v30 << 6);
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    v31 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v14 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(_QWORD *)(v14 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v31;
    v36 = (_QWORD *)(*(_QWORD *)(v10 + 48) + 16 * v31);
    *v36 = v25;
    v36[1] = v24;
    result = sub_1921C852C(v7, *(_QWORD *)(v10 + 56) + v26 * v31);
    ++*(_QWORD *)(v10 + 16);
    if (v13)
      goto LABEL_6;
LABEL_7:
    v19 = v16 + 1;
    if (__OFADD__(v16, 1))
      goto LABEL_42;
    if (v19 >= v39)
    {
      OUTLINED_FUNCTION_55();
      v3 = v38;
      v20 = (_QWORD *)(v8 + 64);
      goto LABEL_35;
    }
    v20 = (_QWORD *)(v8 + 64);
    v21 = *(_QWORD *)(v40 + 8 * v19);
    ++v16;
    if (!v21)
    {
      v16 = v19 + 1;
      if (v19 + 1 >= v39)
        goto LABEL_33;
      v21 = *(_QWORD *)(v40 + 8 * v16);
      if (!v21)
        break;
    }
LABEL_18:
    v13 = (v21 - 1) & v21;
  }
  v22 = v19 + 2;
  if (v22 < v39)
  {
    v21 = *(_QWORD *)(v40 + 8 * v22);
    if (!v21)
    {
      while (1)
      {
        v16 = v22 + 1;
        if (__OFADD__(v22, 1))
          goto LABEL_43;
        if (v16 >= v39)
          goto LABEL_33;
        v21 = *(_QWORD *)(v40 + 8 * v16);
        ++v22;
        if (v21)
          goto LABEL_18;
      }
    }
    v16 = v22;
    goto LABEL_18;
  }
LABEL_33:
  OUTLINED_FUNCTION_55();
  v3 = v38;
LABEL_35:
  if ((v42 & 1) != 0)
  {
    v37 = 1 << *(_BYTE *)(v8 + 32);
    if (v37 >= 64)
      sub_1921CAC9C(0, (unint64_t)(v37 + 63) >> 6, v20);
    else
      *v20 = -1 << v37;
    *(_QWORD *)(v8 + 16) = 0;
  }
LABEL_40:
  result = OUTLINED_FUNCTION_55();
  *v3 = v10;
  return result;
}

uint64_t sub_1921C18C4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_1921C190C(uint64_t a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7298);
  return sub_1921C194C(a1);
}

uint64_t sub_1921C194C(uint64_t a1)
{
  _QWORD *v3;

  if (MEMORY[0x194024464]() == MEMORY[0x1E0C81310])
  {
    sub_1921DA830();
    swift_allocError();
    *v3 = a1;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7298);
    return sub_1921DB9AC();
  }
  else
  {
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7298);
    return sub_1921DB9B8();
  }
}

void sub_1921C19F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v1 + 344);
  v3 = __OFSUB__(v2, 1);
  v4 = v2 - 1;
  if (v3)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + 344) = v4;
    v5 = *(void (**)(uint64_t))(v1 + 328);
    if (v5)
    {
      if (v4)
      {
        swift_retain();
      }
      else
      {
        v6 = swift_retain();
        v5(v6);
        sub_1921D05B4(0, 0);
      }
      swift_unknownObjectRelease();
      swift_release();
      sub_1921C1508((uint64_t)v5);
    }
    else
    {
      swift_unknownObjectRelease();
      OUTLINED_FUNCTION_69();
    }
    OUTLINED_FUNCTION_41_0();
    swift_task_dealloc();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_40_0();
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_9_0(*(uint64_t (**)(void))(v0 + 8));
  }
}

uint64_t sub_1921C1ADC(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v2 + 64) = v1;
  *(_QWORD *)(v2 + 72) = *v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7348);
  *(_QWORD *)(v2 + 80) = OUTLINED_FUNCTION_60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72B0);
  *(_QWORD *)(v2 + 88) = OUTLINED_FUNCTION_7_1();
  *(_QWORD *)(v2 + 96) = OUTLINED_FUNCTION_11_0();
  *(_QWORD *)(v2 + 104) = type metadata accessor for EventValue();
  *(_QWORD *)(v2 + 112) = OUTLINED_FUNCTION_7_1();
  *(_QWORD *)(v2 + 120) = OUTLINED_FUNCTION_11_0();
  v4 = OUTLINED_FUNCTION_64();
  *(_QWORD *)(v2 + 128) = v4;
  *(_QWORD *)(v2 + 136) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 144) = OUTLINED_FUNCTION_7_1();
  v5 = OUTLINED_FUNCTION_11_0();
  v6 = *a1;
  *(_QWORD *)(v2 + 152) = v5;
  *(_QWORD *)(v2 + 160) = v6;
  *(_BYTE *)(v2 + 25) = *((_BYTE *)a1 + 8);
  return OUTLINED_FUNCTION_1_1();
}

void _RTCReportingS.startConfiguration(completionHandler:)(void (*a1)(_QWORD), uint64_t a2)
{
  NSObject *v2;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD v13[5];

  v5 = OUTLINED_FUNCTION_66();
  v6 = (char *)v2 + OBJC_IVAR____RTCReportingS_userInfo;
  v7 = OUTLINED_FUNCTION_24_1();
  if (*(_QWORD *)(*(_QWORD *)v6 + 16))
  {
    if (qword_1ECFD72B8 != -1)
      v7 = swift_once();
    MEMORY[0x1E0C80A78](v7);
    v13[2] = v2;
    v13[3] = v5;
    if ((sub_1921D3534((void (*)(uint64_t *__return_ptr))sub_1921C2558, (uint64_t)v13, v8) & 1) == 0)
    {
      OUTLINED_FUNCTION_46_1(OBJC_IVAR____RTCReportingS_lock);
      sub_1921C3C84(v2, (uint64_t)a1, a2, v5);
      OUTLINED_FUNCTION_77_0();
      return;
    }
  }
  else
  {
    if (qword_1ECFD7288 != -1)
      swift_once();
    if (byte_1ECFD7558 == 1)
    {
      if (qword_1ECFD73A0 != -1)
        swift_once();
      v9 = OUTLINED_FUNCTION_61();
      __swift_project_value_buffer(v9, (uint64_t)qword_1ECFD7368);
      v10 = OUTLINED_FUNCTION_75_0();
      v11 = sub_1921DBA30();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = (uint8_t *)OUTLINED_FUNCTION_10_0();
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_1921BE000, v10, v11, "RTCReporting incorrectly configured with empty userInfo", v12, 2u);
        OUTLINED_FUNCTION_6_1();
      }

    }
  }
  if (a1)
  {
    swift_retain();
    a1(0);
    sub_1921C1508((uint64_t)a1);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _RTCReportingS.sendMessage(category:type:payload:)(Swift::UInt16 category, Swift::UInt16 type, Swift::OpaquePointer_optional payload)
{
  void *rawValue;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *dictionary;
  Swift::OpaquePointer_optional v44;

  rawValue = payload.value._rawValue;
  dictionary = (void *)sub_1921DB8E0();
  LOWORD(v40) = category;
  v12 = OUTLINED_FUNCTION_82((uint64_t)dictionary, 0xD000000000000012, v6, v7, v8, v9, v10, v11, v40);
  sub_1921C205C((uint64_t)v12);
  LOWORD(v41) = type;
  v21 = OUTLINED_FUNCTION_32_1(v13, v14, v15, v16, v17, v18, v19, v20, v41);
  sub_1921C205C((uint64_t)v21);
  if (rawValue)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72A8);
    v42 = (uint64_t)rawValue;
  }
  else
  {
    v42 = 0;
  }
  v22 = swift_bridgeObjectRetain();
  v30 = OUTLINED_FUNCTION_82(v22, v23, v24, v25, v26, v27, v28, v29, v42);
  sub_1921C205C((uint64_t)v30);
  v39 = OUTLINED_FUNCTION_32_1(v31, v32, v33, v34, v35, v36, v37, v38, 0);
  sub_1921C205C((uint64_t)v39);
  v44.value._rawValue = dictionary;
  _RTCReportingS.sendMessage(dictionary:)(v44);
  swift_bridgeObjectRelease();
}

void sub_1921C205C(uint64_t a1)
{
  _OWORD *v1;
  _OWORD v2[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1921C86E8((_OWORD *)a1, v2);
    sub_1921C20D8();
    OUTLINED_FUNCTION_24();
  }
  else
  {
    OUTLINED_FUNCTION_46(a1);
    OUTLINED_FUNCTION_37();
    sub_1921D01C4(v1);
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_46((uint64_t)v2);
  }
}

uint64_t sub_1921C20D8()
{
  _QWORD *v0;
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  OUTLINED_FUNCTION_27_1();
  v1 = (_OWORD *)OUTLINED_FUNCTION_16_1();
  sub_1921C2110(v1, v2, v3);
  *v0 = v5;
  return OUTLINED_FUNCTION_15_1();
}

_OWORD *sub_1921C2110(_OWORD *a1, uint64_t a2, uint64_t a3)
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
  v9 = sub_1921C85A8();
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7230);
  if ((sub_1921DBB44() & 1) == 0)
    goto LABEL_5;
  v13 = sub_1921C85A8();
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = (_OWORD *)sub_1921DBBF8();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = (_OWORD *)(v15[7] + 32 * v11);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    return sub_1921C86E8(a1, v16);
  }
  else
  {
    sub_1921C222C(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

_OWORD *sub_1921C222C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
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
  result = sub_1921C86E8(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _RTCReportingS.sendMessage(dictionary:)(Swift::OpaquePointer_optional dictionary)
{
  char *v1;
  void *rawValue;
  uint64_t ObjectType;
  char *v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  uint64_t v11;
  os_unfair_lock_s *v12;
  _BYTE *v13;
  _QWORD v14[5];

  rawValue = dictionary.value._rawValue;
  ObjectType = swift_getObjectType();
  v4 = &v1[OBJC_IVAR____RTCReportingS_messageSentDelegate];
  swift_beginAccess();
  v5 = (void *)MEMORY[0x1940242D8](v4);
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v5, sel_respondsToSelector_, sel_didSendMessageForReportingClient_event_) & 1) != 0)
    {
      v7 = v1;
      if (rawValue)
      {
        sub_1921D5A2C((uint64_t)rawValue);
        v8 = (void *)sub_1921DB8B0();
      }
      else
      {
        v8 = 0;
      }
      objc_msgSend(v6, sel_didSendMessageForReportingClient_event_, v1, v8);

      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();

      if (!rawValue)
        goto LABEL_12;
      goto LABEL_7;
    }
    v5 = (void *)swift_unknownObjectRelease();
  }
  if (!rawValue)
  {
LABEL_12:
    sub_1921D7CA0();
    OUTLINED_FUNCTION_33_0();
    *v13 = 1;
    swift_willThrow();
    return;
  }
LABEL_7:
  if (qword_1ECFD7278 != -1)
    v5 = (void *)swift_once();
  MEMORY[0x1E0C80A78](v5);
  v14[2] = ObjectType;
  sub_1921D34C4((_QWORD *(*)(uint64_t *__return_ptr))sub_1921C24E8, (uint64_t)v14, v9);
  v11 = v10;
  v12 = (os_unfair_lock_s *)(*(_QWORD *)&v1[OBJC_IVAR____RTCReportingS_lock] + 16);
  os_unfair_lock_lock(v12);
  sub_1921C5C60((uint64_t)rawValue, v1, v11, ObjectType);
  os_unfair_lock_unlock(v12);
}

_QWORD *sub_1921C2490@<X0>(uint64_t a1@<X0>, _QWORD *(*a2)(uint64_t *__return_ptr)@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  _QWORD *result;

  result = sub_1921C24B8(a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

_QWORD *sub_1921C24B8(uint64_t a1, _QWORD *(*a2)(uint64_t *__return_ptr))
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;

  result = a2(&v4);
  if (!v2)
    return (_QWORD *)v4;
  return result;
}

void sub_1921C24E8(_QWORD *a1@<X8>)
{
  *a1 = qword_1EE251750;
}

uint64_t sub_1921C24F8@<X0>(uint64_t a1@<X0>, void (*a2)(uint64_t *__return_ptr)@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_1921C2524(a1, a2);
  if (!v3)
    *a3 = result & 1;
  return result;
}

uint64_t sub_1921C2524(uint64_t a1, void (*a2)(uint64_t *__return_ptr))
{
  uint64_t v2;
  char v3;
  uint64_t var1;

  a2(&var1);
  if (!v2)
    v3 = var1;
  return v3 & 1;
}

void sub_1921C2558(char *a1@<X8>)
{
  uint64_t v1;

  sub_1921C2570(*(_QWORD *)(v1 + 16), a1);
}

void sub_1921C2570(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  os_unfair_lock_s *v11;
  char v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;

  v6 = qword_1ECFD7268 + 1;
  if (__OFADD__(qword_1ECFD7268, 1))
  {
    __break(1u);
LABEL_15:
    swift_once();
    goto LABEL_4;
  }
  v2 = v3;
  ++qword_1ECFD7268;
  if (qword_1EE2514A0 >= v6)
  {
    if (qword_1ECFD73A0 != -1)
      swift_once();
    v13 = sub_1921DB874();
    __swift_project_value_buffer(v13, (uint64_t)qword_1ECFD7368);
    v14 = sub_1921DB85C();
    v15 = sub_1921DBA24();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc();
      *(_DWORD *)v16 = 134349312;
      sub_1921DBA90();
      *(_WORD *)(v16 + 12) = 2050;
      sub_1921DBA90();
      _os_log_impl(&dword_1921BE000, v14, v15, "active session count now %{public}ld/%{public}ld", (uint8_t *)v16, 0x16u);
      MEMORY[0x194024230](v16, -1, -1);
    }

    v12 = 0;
    goto LABEL_13;
  }
  v4 = a1;
  if (qword_1ECFD73A0 != -1)
    goto LABEL_15;
LABEL_4:
  v7 = sub_1921DB874();
  __swift_project_value_buffer(v7, (uint64_t)qword_1ECFD7368);
  v8 = sub_1921DB85C();
  v9 = sub_1921DBA30();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v10 = 134349056;
    sub_1921DBA90();
    _os_log_impl(&dword_1921BE000, v8, v9, "RTCReporting session limit (%{public}ld) exceeded", v10, 0xCu);
    MEMORY[0x194024230](v10, -1, -1);
  }

  v11 = (os_unfair_lock_s *)(*(_QWORD *)(v4 + OBJC_IVAR____RTCReportingS_lock) + 16);
  os_unfair_lock_lock(v11);
  *(_BYTE *)(v4 + OBJC_IVAR____RTCReportingS_completelyDisabled) = 1;
  if (!v2)
  {
    os_unfair_lock_unlock(v11);
    v12 = 1;
LABEL_13:
    *a2 = v12;
    return;
  }
  os_unfair_lock_unlock(v11);
  __break(1u);
}

uint64_t sub_1921C2800(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int EnumTagSinglePayload;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t result;
  uint64_t (*v32)(int, void *);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t (*v39)(int, void *);
  uint64_t v40;
  uint64_t v41;
  int v42;

  v4 = *v2;
  v3 = v4;
  *(_QWORD *)(v4 + 568) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_release();
    OUTLINED_FUNCTION_47();
    goto LABEL_16;
  }
  v5 = *(_QWORD *)(v4 + 488);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_28_0(v5);
  if (OUTLINED_FUNCTION_51_0() == 1)
  {
    sub_1921C3940(*(_QWORD *)(v4 + 488), (uint64_t *)&unk_1ECFD72F0);
  }
  else
  {
    v6 = *(uint64_t **)(v4 + 488);
    v7 = OUTLINED_FUNCTION_68();
    if ((_DWORD)v7 == 8)
    {
      v8 = *v6;
      v9 = v6[1];
      sub_1921D1EAC();
      OUTLINED_FUNCTION_33_0();
      *v10 = v8;
      v10[1] = v9;
LABEL_15:
      swift_willThrow();
      OUTLINED_FUNCTION_47();
LABEL_16:
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v23 = *(unsigned __int8 *)(v4 + 113);
      v24 = *(_QWORD *)(v3 + 448);
      swift_bridgeObjectRelease();
      swift_release();
      OUTLINED_FUNCTION_4_1();
      swift_release();
      sub_1921C1508(*(_QWORD *)(v24 + 328));
      if (v23 == 1)
      {
        v25 = *(_QWORD *)(v3 + 448);
        OUTLINED_FUNCTION_45_0(v25 + OBJC_IVAR____TtC12RTCReporting7Session_baseTime);
        OUTLINED_FUNCTION_45_0(v25 + OBJC_IVAR____TtC12RTCReporting7Session_obfuscatedBaseTime);
      }
      OUTLINED_FUNCTION_62();
      swift_defaultActor_destroy();
      OUTLINED_FUNCTION_57();
      swift_deallocPartialClassInstance();
      OUTLINED_FUNCTION_17_0();
      OUTLINED_FUNCTION_36_0();
      OUTLINED_FUNCTION_40_0();
      OUTLINED_FUNCTION_27_0();
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_43_0();
      swift_task_dealloc();
      OUTLINED_FUNCTION_46_0();
      __asm { BR              X0 }
    }
    OUTLINED_FUNCTION_71(v7, (uint64_t (*)(_QWORD))type metadata accessor for XPCObject);
  }
  v11 = *(_QWORD *)(v4 + 528);
  v12 = *(_QWORD *)(v4 + 480);
  OUTLINED_FUNCTION_28_0(v12);
  if (__swift_getEnumTagSinglePayload(v12, 1, v11) == 1)
  {
    sub_1921C3940(*(_QWORD *)(v4 + 480), (uint64_t *)&unk_1ECFD72F0);
LABEL_14:
    sub_1921D1EAC();
    OUTLINED_FUNCTION_33_0();
    *v22 = 0;
    v22[1] = 0;
    goto LABEL_15;
  }
  v13 = *(_QWORD *)(v4 + 528);
  v14 = *(_QWORD **)(v4 + 480);
  if (swift_getEnumCaseMultiPayload() != 8)
  {
    sub_1921C793C((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for XPCObject);
    goto LABEL_14;
  }
  v15 = *(_QWORD *)(v4 + 472);
  v16 = *(_QWORD *)(v4 + 448);
  v17 = v14[1];
  *(_QWORD *)(v16 + 176) = *v14;
  *(_QWORD *)(v16 + 184) = v17;
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)MessageKeys.allowed.unsafeMutableAddressor();
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_28_0(v15);
  OUTLINED_FUNCTION_50_0();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v15, 1, v13);
  v20 = MEMORY[0x1E0C809B0];
  v21 = MEMORY[0x1E0DEE9E8];
  if (EnumTagSinglePayload == 1)
  {
    sub_1921C3940(*(_QWORD *)(v4 + 472), (uint64_t *)&unk_1ECFD72F0);
LABEL_23:
    v32 = 0;
    v28 = 0;
    *(_QWORD *)(*(_QWORD *)(v4 + 448) + 160) = v21;
    goto LABEL_24;
  }
  v27 = OUTLINED_FUNCTION_68();
  if ((_DWORD)v27 != 11)
  {
    OUTLINED_FUNCTION_71(v27, (uint64_t (*)(_QWORD))type metadata accessor for XPCObject);
    goto LABEL_23;
  }
  OUTLINED_FUNCTION_65();
  *(_QWORD *)(v4 + 432) = sub_1921DBA00();
  v28 = OUTLINED_FUNCTION_21_0();
  *(_QWORD *)(v28 + 16) = v4 + 432;
  v29 = OUTLINED_FUNCTION_21_0();
  *(_QWORD *)(v29 + 16) = sub_1921D2BA0;
  *(_QWORD *)(v29 + 24) = v28;
  *(_QWORD *)(v4 + 360) = sub_1921D2BAC;
  *(_QWORD *)(v4 + 368) = v29;
  *(_QWORD *)(v4 + 328) = v20;
  *(_QWORD *)(v4 + 336) = 1107296256;
  *(_QWORD *)(v4 + 344) = sub_1921D06EC;
  *(_QWORD *)(v4 + 352) = &block_descriptor_28;
  v30 = _Block_copy((const void *)(v4 + 328));
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_72();
  swift_unknownObjectRelease();
  _Block_release(v30);
  OUTLINED_FUNCTION_58();
  result = OUTLINED_FUNCTION_56();
  if ((v18 & 1) != 0)
  {
    __break(1u);
    goto LABEL_36;
  }
  *(_QWORD *)(*(_QWORD *)(v4 + 448) + 160) = *(_QWORD *)(v4 + 432);
  v32 = sub_1921D2BA0;
  v20 = MEMORY[0x1E0C809B0];
LABEL_24:
  *(_QWORD *)(v4 + 584) = v28;
  *(_QWORD *)(v4 + 576) = v32;
  v33 = *(_QWORD *)(v4 + 528);
  v34 = *(_QWORD *)(v4 + 464);
  MessageKeys.denied.unsafeMutableAddressor();
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_28_0(v34);
  OUTLINED_FUNCTION_50_0();
  if (__swift_getEnumTagSinglePayload(v34, 1, v33) == 1)
  {
    sub_1921C3940(*(_QWORD *)(v4 + 464), (uint64_t *)&unk_1ECFD72F0);
LABEL_30:
    v39 = 0;
    v36 = 0;
    *(_QWORD *)(*(_QWORD *)(v4 + 448) + 168) = v21;
    goto LABEL_31;
  }
  v35 = OUTLINED_FUNCTION_68();
  if ((_DWORD)v35 != 11)
  {
    OUTLINED_FUNCTION_71(v35, (uint64_t (*)(_QWORD))type metadata accessor for XPCObject);
    goto LABEL_30;
  }
  OUTLINED_FUNCTION_65();
  *(_QWORD *)(v4 + 440) = sub_1921DBA00();
  v36 = OUTLINED_FUNCTION_21_0();
  *(_QWORD *)(v36 + 16) = v4 + 440;
  v37 = OUTLINED_FUNCTION_21_0();
  *(_QWORD *)(v37 + 16) = sub_1921D1EF4;
  *(_QWORD *)(v37 + 24) = v36;
  *(_QWORD *)(v4 + 408) = sub_1921D1F1C;
  *(_QWORD *)(v4 + 416) = v37;
  *(_QWORD *)(v4 + 376) = v20;
  *(_QWORD *)(v4 + 384) = 1107296256;
  *(_QWORD *)(v4 + 392) = sub_1921D06EC;
  *(_QWORD *)(v4 + 400) = &block_descriptor;
  v38 = _Block_copy((const void *)(v4 + 376));
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_72();
  swift_unknownObjectRelease();
  _Block_release(v38);
  OUTLINED_FUNCTION_58();
  result = OUTLINED_FUNCTION_56();
  if ((v34 & 1) != 0)
  {
LABEL_36:
    __break(1u);
    return result;
  }
  *(_QWORD *)(*(_QWORD *)(v4 + 448) + 168) = *(_QWORD *)(v4 + 440);
  v39 = sub_1921D1EF4;
LABEL_31:
  *(_QWORD *)(v4 + 600) = v36;
  *(_QWORD *)(v4 + 592) = v39;
  v40 = *(_QWORD *)(v4 + 448);
  v41 = *(_QWORD *)(v4 + 456);
  OUTLINED_FUNCTION_28_0(v41);
  v42 = OUTLINED_FUNCTION_51_0();
  sub_1921C3940(v41, (uint64_t *)&unk_1ECFD72F0);
  *(_BYTE *)(v40 + 320) = v42 == 1;
  OUTLINED_FUNCTION_46_0();
  return swift_task_switch();
}

void *XPCObject.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *result;
  BOOL value;
  int64_t v21;
  uint64_t v22;
  double v23;
  int64_t v24;
  void *v25;
  size_t length;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_33();
  v8 = (uint64_t *)(v6 - v7);
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (uint64_t *)((char *)&v34 - v11);
  MEMORY[0x1E0C80A78](v10);
  v14 = (uint64_t *)((char *)&v34 - v13);
  if (!a1)
    return (void *)__swift_storeEnumTagSinglePayload(a2, 1, 1, v4);
  v15 = swift_unknownObjectRetain();
  v16 = MEMORY[0x194024464](v15);
  if (v16 == MEMORY[0x1E0C81350])
  {
    OUTLINED_FUNCTION_0_3();
    OUTLINED_FUNCTION_37();
LABEL_26:
    swift_storeEnumTagMultiPayload();
LABEL_27:
    sub_1921C93BC((uint64_t)v14, a2);
    return (void *)OUTLINED_FUNCTION_5_2();
  }
  v17 = v16;
  if (v16 == MEMORY[0x1E0C812E0] || v16 == MEMORY[0x1E0C81308])
  {
LABEL_35:
    OUTLINED_FUNCTION_6_2();
    *v14 = a1;
    OUTLINED_FUNCTION_37();
    goto LABEL_26;
  }
  if (v16 == MEMORY[0x1E0C812D0])
  {
    value = xpc_BOOL_get_value(a1);
    OUTLINED_FUNCTION_0_3();
    *(_BYTE *)v14 = value;
    OUTLINED_FUNCTION_37();
    goto LABEL_26;
  }
  if (v16 == MEMORY[0x1E0C81328])
  {
    v21 = xpc_int64_get_value(a1);
    OUTLINED_FUNCTION_0_3();
    *v14 = v21;
    OUTLINED_FUNCTION_37();
    goto LABEL_26;
  }
  if (v16 == MEMORY[0x1E0C81398])
  {
    v22 = xpc_uint64_get_value(a1);
    OUTLINED_FUNCTION_0_3();
    *v14 = v22;
    OUTLINED_FUNCTION_37();
    goto LABEL_26;
  }
  if (v16 == MEMORY[0x1E0C81300])
  {
    v23 = xpc_double_get_value(a1);
    OUTLINED_FUNCTION_0_3();
    *(double *)v14 = v23;
    OUTLINED_FUNCTION_37();
    goto LABEL_26;
  }
  if (v16 == MEMORY[0x1E0C812F0])
  {
    v24 = xpc_date_get_value(a1);
    OUTLINED_FUNCTION_0_3();
    *v14 = v24;
    OUTLINED_FUNCTION_37();
    goto LABEL_26;
  }
  if (v16 == MEMORY[0x1E0C812E8])
  {
    result = (void *)xpc_data_get_bytes_ptr(a1);
    if (result)
    {
      v25 = result;
      length = xpc_data_get_length(a1);
      v27 = MEMORY[0x1940236C0](v25, length);
      v29 = v28;
      OUTLINED_FUNCTION_0_3();
      *v12 = v27;
      v12[1] = v29;
      swift_storeEnumTagMultiPayload();
      v30 = (uint64_t)v12;
LABEL_32:
      sub_1921C93BC(v30, (uint64_t)v14);
      goto LABEL_27;
    }
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if (v16 == MEMORY[0x1E0C81390])
  {
    result = (void *)xpc_string_get_string_ptr(a1);
    if (result)
    {
      v31 = sub_1921DB970();
      v33 = v32;
      OUTLINED_FUNCTION_0_3();
      *v8 = v31;
      v8[1] = v33;
      swift_storeEnumTagMultiPayload();
      v30 = (uint64_t)v8;
      goto LABEL_32;
    }
    goto LABEL_39;
  }
  if (v16 != MEMORY[0x1E0C813A0])
  {
    if (v16 != MEMORY[0x1E0C81388])
    {
      v18 = MEMORY[0x1E0C812C8];
      OUTLINED_FUNCTION_6_2();
      if (v17 != v18 && v17 != MEMORY[0x1E0C812F8])
      {
        OUTLINED_FUNCTION_6_2();
        return (void *)__swift_storeEnumTagSinglePayload(a2, 1, 1, v4);
      }
      *v14 = a1;
      OUTLINED_FUNCTION_37();
      goto LABEL_26;
    }
    goto LABEL_35;
  }
  result = (void *)xpc_uuid_get_bytes(a1);
  if (result)
  {
    sub_1921DB82C();
    OUTLINED_FUNCTION_0_3();
    OUTLINED_FUNCTION_37();
    goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

void *RTCXPCDictionary.subscript.getter@<X0>(void *a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4;
  xpc_object_t v5;

  v4 = sub_1921DB94C();
  v5 = xpc_dictionary_get_value(a1, (const char *)(v4 + 32));
  OUTLINED_FUNCTION_55();
  return XPCObject.init(_:)(v5, a2);
}

_QWORD *sub_1921C3270()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t *v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  const char *v14;
  uint64_t v15;
  os_log_type_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double *v22;
  double *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double *v28;
  double *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *result;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  _BYTE *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  void (*v65)(uint64_t, uint64_t);
  char v66;

  v2 = (uint64_t *)(v0 + 64);
  if (*(_BYTE *)(*(_QWORD *)(v0 + 64) + 320) != 1)
  {
LABEL_18:
    OUTLINED_FUNCTION_41_0();
    swift_task_dealloc();
    OUTLINED_FUNCTION_17_0();
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_40_0();
    OUTLINED_FUNCTION_27_0();
    OUTLINED_FUNCTION_19_0();
    OUTLINED_FUNCTION_26_0();
    __asm { BR              X0 }
  }
  v3 = *(_BYTE *)(v0 + 25);
  v4 = Event.category.getter();
  v5 = *(_QWORD *)(v0 + 64);
  if ((v6 & 1) == 0)
  {
    v7 = v4;
    v8 = *(_QWORD *)(v5 + 160);
    if (*(_QWORD *)(v8 + 16))
    {
      if (!sub_1921D0994(v4, v8))
      {
        if (qword_1ECFD7040 != -1)
          swift_once();
        v15 = OUTLINED_FUNCTION_61();
        __swift_project_value_buffer(v15, (uint64_t)qword_1ECFD7540);
        v11 = sub_1921DB85C();
        v16 = sub_1921DBA24();
        if (OUTLINED_FUNCTION_44_0(v16))
        {
          v13 = (uint8_t *)OUTLINED_FUNCTION_13_0();
          *(_DWORD *)v13 = 134349056;
          *(_QWORD *)(v0 + 48) = v7;
          sub_1921DBA90();
          v14 = "dropping event with category %{public}ld due to allowlist";
LABEL_16:
          OUTLINED_FUNCTION_52_0(&dword_1921BE000, v11, v1, v14, v13);
          OUTLINED_FUNCTION_6_1();
        }
        goto LABEL_17;
      }
      v5 = *v2;
    }
    v9 = *(_QWORD *)(v5 + 168);
    if (*(_QWORD *)(v9 + 16))
    {
      if (sub_1921D0994(v7, v9))
      {
        if (qword_1ECFD7040 != -1)
          swift_once();
        v10 = OUTLINED_FUNCTION_61();
        __swift_project_value_buffer(v10, (uint64_t)qword_1ECFD7540);
        v11 = sub_1921DB85C();
        v12 = sub_1921DBA24();
        if (OUTLINED_FUNCTION_44_0(v12))
        {
          v13 = (uint8_t *)OUTLINED_FUNCTION_13_0();
          *(_DWORD *)v13 = 134349056;
          *(_QWORD *)(v0 + 56) = v7;
          sub_1921DBA90();
          v14 = "dropping event with category %{public}ld due to denylist";
          goto LABEL_16;
        }
LABEL_17:

        goto LABEL_18;
      }
      v5 = *v2;
    }
  }
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 160);
  *(_BYTE *)(v0 + 24) = v3;
  if (*(_BYTE *)(v5 + 200) != 1)
  {
    swift_bridgeObjectRetain();
    goto LABEL_26;
  }
  v18 = qword_1ECFD7288;
  swift_bridgeObjectRetain();
  if (v18 != -1)
    goto LABEL_32;
  while (1)
  {
    if ((byte_1ECFD7558 & 1) != 0)
    {
      v19 = *(_QWORD *)(v0 + 136);
      v20 = *(_QWORD *)(v0 + 144);
      v21 = *(_QWORD *)(v0 + 128);
      v22 = *(double **)(v0 + 112);
      v23 = *(double **)(v0 + 96);
      sub_1921DB7FC();
      sub_1921C39B0(v22);
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v20, v21);
      sub_1921C39B0(v23);
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_48_0();
      sub_1921C6CBC();
      OUTLINED_FUNCTION_39_0();
      OUTLINED_FUNCTION_78();
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_32_0();
      sub_1921C6CBC();
      OUTLINED_FUNCTION_39_0();
      OUTLINED_FUNCTION_78();
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_31_0();
      OUTLINED_FUNCTION_39_0();
      sub_1921C793C((uint64_t)v22, (uint64_t (*)(_QWORD))type metadata accessor for EventValue);
    }
    else
    {
      v24 = *(_QWORD *)(v0 + 144);
      v25 = *(_QWORD *)(v0 + 152);
      v27 = *(_QWORD *)(v0 + 128);
      v26 = *(_QWORD *)(v0 + 136);
      v28 = *(double **)(v0 + 120);
      v29 = *(double **)(v0 + 96);
      sub_1921DB7FC();
      sub_1921DB7D8();
      v65 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
      v65(v24, v27);
      sub_1921DB808();
      sub_1921C39B0(v28);
      sub_1921C39B0(v29);
      OUTLINED_FUNCTION_14_0((uint64_t)v29, 0, 1);
      OUTLINED_FUNCTION_48_0();
      sub_1921C6CBC();
      OUTLINED_FUNCTION_29_0();
      OUTLINED_FUNCTION_54();
      OUTLINED_FUNCTION_14_0((uint64_t)v29, 0, 1);
      OUTLINED_FUNCTION_32_0();
      sub_1921C6CBC();
      OUTLINED_FUNCTION_29_0();
      OUTLINED_FUNCTION_54();
      OUTLINED_FUNCTION_14_0((uint64_t)v29, 0, 1);
      OUTLINED_FUNCTION_31_0();
      OUTLINED_FUNCTION_29_0();
      sub_1921C793C((uint64_t)v28, (uint64_t (*)(_QWORD))type metadata accessor for EventValue);
      v65(v25, v27);
    }
LABEL_26:
    v30 = *(_QWORD *)(v0 + 64);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72C8);
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7310);
    v32 = *(_QWORD *)(v31 - 8);
    v33 = *(_QWORD *)(v32 + 72);
    v34 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
    v35 = swift_allocObject();
    *(_OWORD *)(v35 + 16) = xmmword_1921DDD10;
    v36 = (_QWORD *)(v35 + v34);
    v37 = (_QWORD *)((char *)v36 + *(int *)(v31 + 48));
    v38 = (uint64_t *)MessageKeys.payload.unsafeMutableAddressor();
    v40 = *v38;
    v39 = v38[1];
    *v36 = v40;
    v36[1] = v39;
    v66 = *(_BYTE *)(v0 + 24);
    swift_bridgeObjectRetain();
    sub_1921C7100();
    *v37 = v41;
    OUTLINED_FUNCTION_63();
    swift_storeEnumTagMultiPayload();
    v42 = (_QWORD *)((char *)v36 + v33);
    result = MessageKeys.sessionID.unsafeMutableAddressor();
    v44 = result[1];
    *v42 = *result;
    v42[1] = v44;
    v45 = *(_QWORD *)(v30 + 184);
    if (!v45)
    {
      __break(1u);
      return result;
    }
    v46 = *(_QWORD *)(v0 + 64);
    v47 = (_QWORD *)((char *)v42 + *(int *)(v31 + 48));
    *v47 = *(_QWORD *)(v46 + 176);
    v47[1] = v45;
    OUTLINED_FUNCTION_16_0();
    v48 = (_QWORD *)((char *)v36 + 2 * v33);
    v49 = (char *)v48 + *(int *)(v31 + 48);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_53_0();
    v50 = (uint64_t *)MessageKeys.realtime.unsafeMutableAddressor();
    v52 = *v50;
    v51 = v50[1];
    *v48 = v52;
    v48[1] = v51;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *v49 = v66;
    swift_storeEnumTagMultiPayload();
    *(_QWORD *)(v0 + 168) = RTCXPCDictionary.init(dictionaryLiteral:)(v35);
    v53 = *(_QWORD *)(v46 + 344);
    v54 = __OFADD__(v53, 1);
    v55 = v53 + 1;
    if (!v54)
      break;
    __break(1u);
LABEL_32:
    swift_once();
  }
  v56 = *(_QWORD *)(v0 + 64);
  *(_QWORD *)(v46 + 344) = v55;
  v57 = *(_QWORD *)(v56 + 312);
  if (v57)
  {
    *(_QWORD *)(v0 + 176) = v57;
    OUTLINED_FUNCTION_70();
    v58 = (_QWORD *)OUTLINED_FUNCTION_11_0();
    *(_QWORD *)(v0 + 184) = v58;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72E0);
    *v58 = v0;
    v58[1] = sub_1921D0778;
    OUTLINED_FUNCTION_26_0();
    return (_QWORD *)sub_1921DB9F4();
  }
  else
  {
    v59 = OUTLINED_FUNCTION_37_0();
    OUTLINED_FUNCTION_42_0(v59);
    v60 = (_QWORD *)OUTLINED_FUNCTION_21_0();
    OUTLINED_FUNCTION_15_0(v60);
    v61 = OUTLINED_FUNCTION_67();
    v62 = OUTLINED_FUNCTION_73(v61, (uint64_t)&unk_1EE251678);
    v63 = OUTLINED_FUNCTION_76(v62);
    sub_1921D05A4(v63);
    v64 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 200) = v64;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72E0);
    *v64 = v0;
    v64[1] = sub_1921C12E8;
    OUTLINED_FUNCTION_26_0();
    return (_QWORD *)sub_1921DB9E8();
  }
}

void sub_1921C3940(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_21(v2);
  OUTLINED_FUNCTION_38();
}

uint64_t sub_1921C3968(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1921C39B0@<X0>(double *a1@<X8>)
{
  uint64_t v2;
  double v3;

  v2 = getTimeIntervalSince1970(Date:)();
  v3 = (double)v2;
  if (!v2)
    v3 = -1.0;
  *a1 = v3;
  type metadata accessor for EventValue();
  return swift_storeEnumTagMultiPayload();
}

uint64_t getTimeIntervalSince1970(Date:)()
{
  uint64_t result;
  double v1;

  result = sub_1921DB7F0();
  if (v1 < 0.0 || (*(_QWORD *)&v1 & 0x7FF0000000000000) == 0x7FF0000000000000)
    return 0;
  if (v1 <= -9.22337204e18)
  {
    __break(1u);
  }
  else if (v1 < 9.22337204e18)
  {
    return (uint64_t)v1;
  }
  __break(1u);
  return result;
}

void *MessageKeys.realtime.unsafeMutableAddressor()
{
  return &static MessageKeys.realtime;
}

void *MessageKeys.sessionID.unsafeMutableAddressor()
{
  return &static MessageKeys.sessionID;
}

uint64_t sub_1921C3A7C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_20();
  v24 = v2;
  v25 = v3;
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72B0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_10();
  v8 = v7 - v6;
  v9 = OUTLINED_FUNCTION_1_0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_25_0();
  MEMORY[0x1E0C80A78]();
  v12 = (char *)&v23 - v11;
  v13 = *v1;
  if (*v5 != -1)
    swift_once();
  if (!*(_QWORD *)(v13 + 16))
  {
    OUTLINED_FUNCTION_12_0(v8, 1);
LABEL_9:
    sub_1921C3940(v8, &qword_1ECFD72B0);
    return 0;
  }
  swift_bridgeObjectRetain();
  v14 = sub_1921C85A8();
  if ((v15 & 1) != 0)
  {
    sub_1921C78F8(*(_QWORD *)(v13 + 56) + *(_QWORD *)(v10 + 72) * v14, v8);
    v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  OUTLINED_FUNCTION_12_0(v8, v16);
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload(v8, 1, v9) == 1)
    goto LABEL_9;
  v18 = OUTLINED_FUNCTION_42();
  sub_1921C852C(v18, v19);
  v20 = OUTLINED_FUNCTION_37();
  sub_1921C78F8(v20, v21);
  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result != 2)
  {
    if ((_DWORD)result != 1)
    {
      sub_1921C793C((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for EventValue);
      sub_1921C793C((uint64_t)v0, (uint64_t (*)(_QWORD))type metadata accessor for EventValue);
      return 0;
    }
    v17 = *v0;
LABEL_15:
    sub_1921C793C((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for EventValue);
    return v17;
  }
  v17 = *v0;
  if ((v17 & 0x8000000000000000) == 0)
    goto LABEL_15;
  __break(1u);
  return result;
}

uint64_t Event.category.getter()
{
  return OUTLINED_FUNCTION_23_0();
}

void *MessageKeys.payload.unsafeMutableAddressor()
{
  return &static MessageKeys.payload;
}

void sub_1921C3C84(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  NSObject *v20;
  os_log_type_t v21;
  BOOL v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  NSObject *v28;
  os_log_type_t v29;
  BOOL v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  int v39;
  char v40;
  int v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char v46;
  int v47;
  int v48;
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
  os_log_type_t v64;
  uint8_t *v65;
  unint64_t v66;
  unint64_t v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unint64_t v82;
  int v83;
  char v84;
  char v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  int v91;
  BOOL v92;
  int v93;
  unint64_t v94;
  char v95;
  char v96;
  NSObject *v97;
  os_log_type_t v98;
  uint8_t *v99;
  uint64_t v100;
  NSObject *v101;
  char v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  NSObject *v137;
  _BYTE v138[32];
  _OWORD v139[2];
  char v140;
  __int128 v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  __int128 v145;
  char v146;
  char v147;

  v132 = a4;
  v133 = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7348);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v118 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1921DB874();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v118 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v137 = a1;
  v14 = (uint64_t *)((char *)a1 + OBJC_IVAR____RTCReportingS_userInfo);
  swift_beginAccess();
  sub_1921C6C70(*v14, &v145);
  swift_endAccess();
  sub_1921C6C44((uint64_t)&v145, (uint64_t)&v141, &qword_1ECFD7320);
  if (v142)
  {
    sub_1921C86E8(&v141, v139);
    sub_1921C9084((uint64_t)v139, (uint64_t)v138);
    if ((swift_dynamicCast() & 1) == 0)
    {
      v143 = 0;
      v144 = 0;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
    v131 = (char *)v143;
    v136 = v144;
  }
  else
  {
    v136 = 0;
    v131 = 0;
  }
  sub_1921C6C0C((uint64_t)&v145, &qword_1ECFD7320);
  swift_beginAccess();
  sub_1921C6C70(*v14, &v145);
  swift_endAccess();
  sub_1921C6C44((uint64_t)&v145, (uint64_t)&v141, &qword_1ECFD7320);
  v134 = a2;
  v135 = v10;
  if (v142)
  {
    sub_1921C86E8(&v141, v139);
    sub_1921C9084((uint64_t)v139, (uint64_t)v138);
    if ((swift_dynamicCast() & 1) == 0)
    {
      v143 = 0;
      v144 = 0;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
    v16 = v143;
    v15 = v144;
  }
  else
  {
    v15 = 0;
    v16 = 0;
  }
  sub_1921C6C0C((uint64_t)&v145, &qword_1ECFD7320);
  if (!v15)
  {
    v16 = 0;
    v15 = 0xE000000000000000;
  }
  v17 = *(uint64_t *)((char *)&v137->isa + OBJC_IVAR____RTCReportingS_sessionInfo);
  sub_1921C6C70(v17, &v145);
  sub_1921C6C44((uint64_t)&v145, (uint64_t)&v141, &qword_1ECFD7320);
  if (v142)
  {
    sub_1921C86E8(&v141, v139);
    sub_1921C9084((uint64_t)v139, (uint64_t)v138);
    v18 = swift_dynamicCast();
    if ((v18 & 1) == 0)
      v143 = 0;
    LOBYTE(v144) = v18 ^ 1;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
    v130 = v143;
    v19 = v144;
  }
  else
  {
    v130 = 0;
    v19 = 1;
  }
  sub_1921C6C0C((uint64_t)&v145, &qword_1ECFD7320);
  if (v136)
  {
    if ((v19 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (qword_1ECFD73A0 != -1)
        swift_once();
      __swift_project_value_buffer(v135, (uint64_t)qword_1ECFD7368);
      v20 = sub_1921DB85C();
      v21 = sub_1921DBA3C();
      v22 = os_log_type_enabled(v20, v21);
      v23 = v134;
      if (v22)
      {
        v24 = (uint8_t *)OUTLINED_FUNCTION_10_0();
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_1921BE000, v20, v21, "invalid or missing clientType", v24, 2u);
        MEMORY[0x194024230](v24, -1, -1);
      }

      if (v23)
      {
        v25 = sub_1921DB9DC();
        __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v25);
        v26 = (_QWORD *)swift_allocObject();
        v26[2] = 0;
        v26[3] = 0;
        v26[4] = v23;
        v26[5] = v133;
        swift_retain();
        v27 = &unk_1EE251870;
LABEL_32:
        v34 = (uint64_t)v9;
LABEL_33:
        sub_1921D41CC(v34, (uint64_t)v27, (uint64_t)v26);
        swift_release();
        return;
      }
      return;
    }
    v90 = *((_BYTE *)&v137->isa + OBJC_IVAR____RTCReportingS_configured) == 1;
    v129 = v4;
    v128 = v9;
    if (v90)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_1921C6C70(*v14, &v145);
      swift_endAccess();
      sub_1921C6C44((uint64_t)&v145, (uint64_t)&v141, &qword_1ECFD7320);
      v127 = v11;
      if (v142)
      {
        sub_1921C86E8(&v141, v139);
        sub_1921C9084((uint64_t)v139, (uint64_t)v138);
        v35 = swift_dynamicCast();
        v36 = v135;
        if ((v35 & 1) == 0)
        {
          v143 = 0;
          v144 = 0;
        }
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
        v37 = v143;
        v38 = v144;
      }
      else
      {
        v38 = 0;
        v37 = 0;
        v36 = v135;
      }
      sub_1921C6C0C((uint64_t)&v145, &qword_1ECFD7320);
      if (v38)
        v42 = v37;
      else
        v42 = 63;
      if (!v38)
        v38 = 0xE100000000000000;
      swift_beginAccess();
      sub_1921C6C70(*v14, &v145);
      swift_endAccess();
      sub_1921C6C44((uint64_t)&v145, (uint64_t)&v141, &qword_1ECFD7320);
      if (v142)
      {
        v43 = v38;
        sub_1921C86E8(&v141, v139);
        sub_1921C9084((uint64_t)v139, (uint64_t)v138);
        if ((swift_dynamicCast() & 1) == 0)
        {
          v143 = 0;
          v144 = 0;
        }
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
        v45 = v143;
        v44 = v144;
      }
      else
      {
        v43 = v38;
        v44 = 0;
        v45 = 0;
      }
      sub_1921C6C0C((uint64_t)&v145, &qword_1ECFD7320);
      if (!v44)
      {
        v45 = 63;
        v44 = 0xE100000000000000;
      }
      if (qword_1ECFD73A0 != -1)
        swift_once();
      v49 = __swift_project_value_buffer(v36, (uint64_t)qword_1ECFD7368);
      (*(void (**)(char *, uint64_t, uint64_t))(v127 + 16))(v13, v49, v36);
      v50 = swift_allocObject();
      v119 = v42;
      *(_QWORD *)(v50 + 16) = v42;
      *(_QWORD *)(v50 + 24) = v43;
      v51 = swift_allocObject();
      *(_QWORD *)(v51 + 16) = v45;
      *(_QWORD *)(v51 + 24) = v44;
      v126 = v43;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v137 = sub_1921DB85C();
      LODWORD(v136) = sub_1921DBA30();
      v52 = swift_allocObject();
      v120 = v45;
      v132 = v52;
      *(_BYTE *)(v52 + 16) = 34;
      v53 = swift_allocObject();
      *(_BYTE *)(v53 + 16) = 8;
      v54 = swift_allocObject();
      v131 = v13;
      v55 = v54;
      *(_QWORD *)(v54 + 16) = sub_1921D8C2C;
      *(_QWORD *)(v54 + 24) = v50;
      v56 = swift_allocObject();
      *(_QWORD *)(v56 + 16) = sub_1921D8C68;
      *(_QWORD *)(v56 + 24) = v55;
      v57 = swift_allocObject();
      *(_BYTE *)(v57 + 16) = 34;
      v58 = swift_allocObject();
      *(_BYTE *)(v58 + 16) = 8;
      v59 = swift_allocObject();
      v124 = v44;
      v60 = v59;
      *(_QWORD *)(v59 + 16) = sub_1921D8F9C;
      *(_QWORD *)(v59 + 24) = v51;
      v61 = swift_allocObject();
      *(_QWORD *)(v61 + 16) = sub_1921D8F30;
      *(_QWORD *)(v61 + 24) = v60;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7228);
      v62 = swift_allocObject();
      *(_OWORD *)(v62 + 16) = xmmword_1921DE050;
      v63 = v132;
      *(_QWORD *)(v62 + 32) = sub_1921D8C38;
      *(_QWORD *)(v62 + 40) = v63;
      *(_QWORD *)(v62 + 48) = sub_1921D8F3C;
      *(_QWORD *)(v62 + 56) = v53;
      *(_QWORD *)(v62 + 64) = sub_1921D8C70;
      *(_QWORD *)(v62 + 72) = v56;
      *(_QWORD *)(v62 + 80) = sub_1921D8F3C;
      *(_QWORD *)(v62 + 88) = v57;
      *(_QWORD *)(v62 + 96) = sub_1921D8F3C;
      *(_QWORD *)(v62 + 104) = v58;
      *(_QWORD *)(v62 + 112) = sub_1921D8F34;
      *(_QWORD *)(v62 + 120) = v61;
      v125 = v50;
      swift_retain();
      v121 = v55;
      swift_retain();
      v130 = v51;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      v123 = v57;
      swift_retain();
      v122 = v58;
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      v64 = v136;
      if (os_log_type_enabled(v137, (os_log_type_t)v136))
      {
        v65 = (uint8_t *)OUTLINED_FUNCTION_10_0();
        v136 = swift_slowAlloc();
        *(_QWORD *)&v145 = v136;
        *(_WORD *)v65 = 514;
        v65[2] = 34;
        swift_release();
        v66 = v124;
        v65[3] = 8;
        swift_release();
        v67 = v126;
        swift_bridgeObjectRetain();
        *(_QWORD *)&v141 = sub_1921CACB8(v119, v67, (uint64_t *)&v145);
        sub_1921DBA90();
        swift_release();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease_n();
        v65[12] = 34;
        swift_release();
        v65[13] = 8;
        swift_release();
        swift_bridgeObjectRetain();
        *(_QWORD *)&v141 = sub_1921CACB8(v120, v66, (uint64_t *)&v145);
        sub_1921DBA90();
        swift_release();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease_n();
        v68 = v137;
        _os_log_impl(&dword_1921BE000, v137, v64, "attempting to re-configure session (%{public}s:%{public}s) after initial configuration", v65, 0x16u);
        v69 = v136;
        swift_arrayDestroy();
        MEMORY[0x194024230](v69, -1, -1);
        MEMORY[0x194024230](v65, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_release();
      }
      (*(void (**)(char *, uint64_t))(v127 + 8))(v131, v135);
      v70 = v134;
      v71 = (uint64_t)v128;
      if (v134)
      {
        v72 = sub_1921DB9DC();
        __swift_storeEnumTagSinglePayload(v71, 1, 1, v72);
        v26 = (_QWORD *)swift_allocObject();
        v26[2] = 0;
        v26[3] = 0;
        v26[4] = v70;
        v26[5] = v133;
        swift_retain();
        v27 = &unk_1EE251890;
        v34 = v71;
        goto LABEL_33;
      }
      return;
    }
    v125 = v16;
    v39 = 1;
    *((_BYTE *)&v137->isa + OBJC_IVAR____RTCReportingS_configured) = 1;
    sub_1921C6C70(v17, &v145);
    sub_1921C6C44((uint64_t)&v145, (uint64_t)&v141, &qword_1ECFD7320);
    if (v142)
    {
      sub_1921C86E8(&v141, v139);
      sub_1921C9084((uint64_t)v139, (uint64_t)v138);
      v40 = swift_dynamicCast();
      if ((v40 & 1) == 0)
        LOWORD(v143) = 0;
      BYTE2(v143) = v40 ^ 1;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
      v41 = (unsigned __int16)v143;
      v39 = BYTE2(v143);
    }
    else
    {
      v41 = 0;
    }
    sub_1921C6C0C((uint64_t)&v145, &qword_1ECFD7320);
    if (v39)
      v41 = 0;
    sub_1921C6C70(v17, &v145);
    sub_1921C6C44((uint64_t)&v145, (uint64_t)&v141, &qword_1ECFD7320);
    LODWORD(v124) = v41;
    if (v142)
    {
      sub_1921C86E8(&v141, v139);
      sub_1921C9084((uint64_t)v139, (uint64_t)v138);
      v46 = swift_dynamicCast();
      if ((v46 & 1) == 0)
        LODWORD(v143) = 0;
      BYTE4(v143) = v46 ^ 1;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
      v47 = v143;
      v48 = BYTE4(v143);
    }
    else
    {
      v47 = 0;
      v48 = 1;
    }
    sub_1921C6C0C((uint64_t)&v145, &qword_1ECFD7320);
    v146 = 0;
    if (v48)
      v47 = 0;
    v147 = 0;
    v140 = 1;
    sub_1921C6C70(v17, &v145);
    sub_1921C6C44((uint64_t)&v145, (uint64_t)&v141, &qword_1ECFD7320);
    if (v142)
    {
      sub_1921C86E8(&v141, v139);
      sub_1921C9084((uint64_t)v139, (uint64_t)v138);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72A8);
      if (!swift_dynamicCast())
        sub_1921DB8F8();
      v73 = sub_1921C0800();
      v74 = v76;
      v75 = v77;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
      sub_1921C6C0C((uint64_t)&v145, &qword_1ECFD7320);
      if (v75)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v73 = 0;
        v74 = 0;
      }
    }
    else
    {
      sub_1921C6C0C((uint64_t)&v145, &qword_1ECFD7320);
      v73 = 0;
      v74 = 0;
      v75 = 0;
    }
    sub_1921C6C70(v17, &v145);
    sub_1921C6C44((uint64_t)&v145, (uint64_t)&v141, &qword_1ECFD7320);
    v121 = v15;
    v119 = v74;
    if (v142)
    {
      sub_1921C86E8(&v141, v139);
      sub_1921C9084((uint64_t)v139, (uint64_t)v138);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v143 = 0;
        v144 = 0;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
      v79 = v143;
      v78 = v144;
    }
    else
    {
      v78 = 0;
      v79 = 0;
    }
    sub_1921C6C0C((uint64_t)&v145, &qword_1ECFD7320);
    if (v78)
      swift_bridgeObjectRelease();
    else
      v79 = 0;
    sub_1921C6C70(v17, &v145);
    sub_1921C6C44((uint64_t)&v145, (uint64_t)&v141, &qword_1ECFD7320);
    if (v142)
    {
      sub_1921C86E8(&v141, v139);
      sub_1921C9084((uint64_t)v139, (uint64_t)v138);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v143 = 0;
        v144 = 0;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
      v81 = v143;
      v80 = v144;
    }
    else
    {
      v80 = 0;
      v81 = 0;
    }
    sub_1921C6C0C((uint64_t)&v145, &qword_1ECFD7320);
    if (v80)
      swift_bridgeObjectRelease();
    else
      v81 = 0;
    sub_1921C6C70(v17, &v145);
    sub_1921C6C44((uint64_t)&v145, (uint64_t)&v141, &qword_1ECFD7320);
    LODWORD(v123) = v47;
    if (v142)
    {
      sub_1921C86E8(&v141, v139);
      sub_1921C9084((uint64_t)v139, (uint64_t)v138);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v143 = 0;
        v144 = 0;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
      v82 = v144;
      v126 = v143;
    }
    else
    {
      v82 = 0;
      v126 = 0;
    }
    sub_1921C6C0C((uint64_t)&v145, &qword_1ECFD7320);
    if (v82)
      swift_bridgeObjectRelease();
    else
      v126 = 0;
    sub_1921C6C70(v17, &v145);
    sub_1921C6C44((uint64_t)&v145, (uint64_t)&v141, &qword_1ECFD7320);
    v122 = v73;
    if (v142)
    {
      sub_1921C86E8(&v141, v139);
      sub_1921C9084((uint64_t)v139, (uint64_t)v138);
      if ((swift_dynamicCast() & 1) == 0)
        LOBYTE(v143) = 2;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
      v83 = v143;
    }
    else
    {
      v83 = 2;
    }
    sub_1921C6C0C((uint64_t)&v145, &qword_1ECFD7320);
    if (v83 != 2)
      v146 = v83 & 1;
    sub_1921C6C70(v17, &v145);
    sub_1921C6C44((uint64_t)&v145, (uint64_t)&v141, &qword_1ECFD7320);
    if (v142)
    {
      sub_1921C86E8(&v141, v139);
      sub_1921C9084((uint64_t)v139, (uint64_t)v138);
      v84 = swift_dynamicCast();
      if ((v84 & 1) == 0)
        v143 = 0;
      LOBYTE(v144) = v84 ^ 1;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
      v127 = v143;
      v85 = v144;
    }
    else
    {
      v127 = 0;
      v85 = 1;
    }
    sub_1921C6C0C((uint64_t)&v145, &qword_1ECFD7320);
    v118 = v81;
    if ((v85 & 1) != 0)
      v127 = 0;
    else
      v140 = 0;
    v86 = v80;
    v120 = v79;
    if (getprogname())
    {
      v88 = sub_1921DB970();
      v89 = v87;
      v90 = v88 == 0x64786F62646E6173 && v87 == 0xE800000000000000;
      v91 = v90;
      if (v90
        || (sub_1921DBBBC() & 1) != 0
        || (v88 == 0x6C6F6F74637472 ? (v92 = v89 == 0xE700000000000000) : (v92 = 0),
            v92 || (sub_1921DBBBC() & 1) != 0))
      {
        sub_1921C6C70(v17, &v145);
        sub_1921C6C44((uint64_t)&v145, (uint64_t)&v141, &qword_1ECFD7320);
        if (v142)
        {
          sub_1921C86E8(&v141, v139);
          sub_1921C9084((uint64_t)v139, (uint64_t)v138);
          if ((swift_dynamicCast() & 1) == 0)
            LOBYTE(v143) = 2;
          __swift_destroy_boxed_opaque_existential_0((uint64_t)v139);
          v93 = v143;
        }
        else
        {
          v93 = 2;
        }
        sub_1921C6C0C((uint64_t)&v145, &qword_1ECFD7320);
        if (v93 != 2)
          v147 = v93 & 1;
        if (v91)
        {
          v94 = v82;
          swift_bridgeObjectRelease();
LABEL_146:
          if (qword_1ECFD73A0 != -1)
            swift_once();
          __swift_project_value_buffer(v135, (uint64_t)qword_1ECFD7368);
          v97 = sub_1921DB85C();
          v98 = sub_1921DBA48();
          if (os_log_type_enabled(v97, v98))
          {
            v99 = (uint8_t *)OUTLINED_FUNCTION_10_0();
            *(_WORD *)v99 = 0;
            _os_log_impl(&dword_1921BE000, v97, v98, "overriding eager=YES for sandboxd", v99, 2u);
            MEMORY[0x194024230](v99, -1, -1);
          }

          v95 = 1;
          v147 = 1;
          goto LABEL_152;
        }
      }
      v94 = v82;
      v96 = sub_1921DBBBC();
      swift_bridgeObjectRelease();
      if ((v96 & 1) != 0)
        goto LABEL_146;
      v95 = v147;
    }
    else
    {
      v94 = v82;
      v95 = 0;
    }
LABEL_152:
    v100 = swift_bridgeObjectRetain();
    v101 = v137;
    sub_1921CA1C8(v100);
    swift_bridgeObjectRelease();
    v102 = v146;
    LOBYTE(v141) = v140;
    v103 = v94;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v104 = v86;
    swift_bridgeObjectRetain();
    v105 = (uint64_t)v128;
    sub_1921DB9C4();
    v106 = sub_1921DB9DC();
    __swift_storeEnumTagSinglePayload(v105, 0, 1, v106);
    v107 = v75;
    v108 = swift_allocObject();
    *(_QWORD *)(v108 + 16) = 0;
    *(_QWORD *)(v108 + 24) = 0;
    v109 = v131;
    *(_QWORD *)(v108 + 32) = v130;
    *(_QWORD *)(v108 + 40) = v109;
    v110 = v125;
    *(_QWORD *)(v108 + 48) = v136;
    *(_QWORD *)(v108 + 56) = v110;
    *(_QWORD *)(v108 + 64) = v121;
    *(_WORD *)(v108 + 72) = v124;
    *(_DWORD *)(v108 + 76) = v123;
    v111 = v119;
    *(_QWORD *)(v108 + 80) = v122;
    *(_QWORD *)(v108 + 88) = v111;
    v112 = v120;
    *(_QWORD *)(v108 + 96) = v107;
    *(_QWORD *)(v108 + 104) = v112;
    v113 = v118;
    *(_QWORD *)(v108 + 112) = v78;
    *(_QWORD *)(v108 + 120) = v113;
    v114 = v126;
    *(_QWORD *)(v108 + 128) = v104;
    *(_QWORD *)(v108 + 136) = v114;
    *(_QWORD *)(v108 + 144) = v103;
    *(_BYTE *)(v108 + 152) = v102;
    *(_BYTE *)(v108 + 153) = v95;
    *(_DWORD *)(v108 + 154) = v145;
    *(_WORD *)(v108 + 158) = WORD2(v145);
    *(_QWORD *)(v108 + 160) = v127;
    *(_BYTE *)(v108 + 168) = v141;
    *(_QWORD *)(v108 + 176) = v101;
    v115 = v134;
    v116 = v133;
    *(_QWORD *)(v108 + 184) = v134;
    *(_QWORD *)(v108 + 192) = v116;
    *(_QWORD *)(v108 + 200) = v132;
    sub_1921CA1B8(v115);
    v117 = v101;
    sub_1921D4E4C(v105, (uint64_t)&unk_1EE251880, v108);
    swift_release();
    sub_1921C6C0C(v105, &qword_1ECFD7348);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRelease();
  if (qword_1ECFD73A0 != -1)
    swift_once();
  __swift_project_value_buffer(v135, (uint64_t)qword_1ECFD7368);
  v28 = sub_1921DB85C();
  v29 = sub_1921DBA3C();
  v30 = os_log_type_enabled(v28, v29);
  v31 = v134;
  if (v30)
  {
    v32 = (uint8_t *)OUTLINED_FUNCTION_10_0();
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_1921BE000, v28, v29, "invalid or missing clientName", v32, 2u);
    MEMORY[0x194024230](v32, -1, -1);
  }

  if (v31)
  {
    v33 = sub_1921DB9DC();
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v33);
    v26 = (_QWORD *)swift_allocObject();
    v26[2] = 0;
    v26[3] = 0;
    v26[4] = v31;
    v26[5] = v133;
    swift_retain();
    v27 = &unk_1EE251860;
    goto LABEL_32;
  }
}

uint64_t sub_1921C5550(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  char v25;
  unint64_t v26;
  uint64_t v27;
  _BOOL8 v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  char v32;
  _QWORD *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t result;
  _QWORD v43[2];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v10 = type metadata accessor for EventValue();
  v47 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x1E0C80A78](v10);
  v45 = (uint64_t)v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v11);
  v44 = (uint64_t)v43 - v14;
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)v43 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6E98);
  MEMORY[0x1E0C80A78](v17);
  v19 = (_QWORD *)((char *)v43 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1921C6F58(a1, a2, a3, &v46);
  v43[1] = a1;
  swift_bridgeObjectRetain();
  v43[0] = a3;
  swift_retain();
  sub_1921C5874((uint64_t)v19);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6E90);
  while (1)
  {
    if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v20) == 1)
    {
      swift_release();
      swift_bridgeObjectRelease();
      sub_1921D88E8();
      return swift_release();
    }
    v21 = (uint64_t)v19 + *(int *)(v20 + 48);
    v22 = *v19;
    v23 = v19[1];
    sub_1921C852C(v21, (uint64_t)v16);
    v24 = *(_QWORD **)a5;
    v26 = sub_1921C85A8();
    v27 = v24[2];
    v28 = (v25 & 1) == 0;
    v29 = v27 + v28;
    if (__OFADD__(v27, v28))
      break;
    v30 = v25;
    if (v24[3] >= v29)
    {
      if ((a4 & 1) == 0)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7350);
        sub_1921DBB50();
      }
    }
    else
    {
      sub_1921C1584(v29, a4 & 1);
      v31 = sub_1921C85A8();
      if ((v30 & 1) != (v32 & 1))
        goto LABEL_17;
      v26 = v31;
    }
    v33 = *(_QWORD **)a5;
    if ((v30 & 1) != 0)
    {
      v34 = *(_QWORD *)(v47 + 72) * v26;
      v35 = v33[7] + v34;
      v36 = v45;
      sub_1921C78F8(v35, v45);
      v37 = v44;
      sub_1921C78F8(v36, v44);
      sub_1921C5C24(v36);
      sub_1921C5C24((uint64_t)v16);
      swift_bridgeObjectRelease();
      sub_1921C7018(v37, *(_QWORD *)(*(_QWORD *)a5 + 56) + v34);
    }
    else
    {
      v33[(v26 >> 6) + 8] |= 1 << v26;
      v38 = (_QWORD *)(v33[6] + 16 * v26);
      *v38 = v22;
      v38[1] = v23;
      sub_1921C852C((uint64_t)v16, v33[7] + *(_QWORD *)(v47 + 72) * v26);
      v39 = v33[2];
      v40 = __OFADD__(v39, 1);
      v41 = v39 + 1;
      if (v40)
        goto LABEL_16;
      v33[2] = v41;
    }
    sub_1921C5874((uint64_t)v19);
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6E90);
    a4 = 1;
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  result = sub_1921DBBF8();
  __break(1u);
  return result;
}

uint64_t sub_1921C5874@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;
  int64_t v31;
  int64_t v32;
  void (*v33)(uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  int64_t v44;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7340);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72A0);
  v6 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (uint64_t *)((char *)&v39 - v9);
  v12 = *v1;
  v11 = v1[1];
  v14 = v1[2];
  v13 = v1[3];
  v15 = v13;
  v16 = v1[4];
  v40 = v5;
  if (v16)
  {
    v43 = v8;
    v44 = v13;
    v41 = v14;
    v42 = v11;
    v17 = v3;
    v18 = a1;
    v19 = (v16 - 1) & v16;
    v20 = __clz(__rbit64(v16)) | (v13 << 6);
LABEL_3:
    v21 = *(_QWORD *)(v12 + 56);
    v22 = (uint64_t *)(*(_QWORD *)(v12 + 48) + 16 * v20);
    v23 = v12;
    v24 = *v22;
    v25 = v22[1];
    v26 = v21 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for EventValue() - 8) + 72) * v20;
    v3 = v17;
    sub_1921C78F8(v26, (uint64_t)v10 + *(int *)(v17 + 48));
    *v10 = v24;
    v10[1] = v25;
    __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v17);
    v12 = v23;
    swift_bridgeObjectRetain();
    a1 = v18;
    v11 = v42;
    v8 = v43;
    v14 = v41;
    goto LABEL_25;
  }
  v27 = v13 + 1;
  if (__OFADD__(v13, 1))
  {
    __break(1u);
LABEL_23:
    v15 = v9;
    goto LABEL_24;
  }
  v28 = (unint64_t)(v14 + 64) >> 6;
  if (v27 < v28)
  {
    v29 = *(_QWORD *)(v11 + 8 * v27);
    if (v29)
    {
LABEL_7:
      v41 = v14;
      v42 = v11;
      v17 = v3;
      v43 = v8;
      v44 = v27;
      v18 = a1;
      v19 = (v29 - 1) & v29;
      v20 = __clz(__rbit64(v29)) + (v27 << 6);
      goto LABEL_3;
    }
    v30 = v13 + 2;
    v15 = v13 + 1;
    if (v13 + 2 < v28)
    {
      v29 = *(_QWORD *)(v11 + 8 * v30);
      if (v29)
      {
LABEL_10:
        v27 = v30;
        goto LABEL_7;
      }
      v15 = v13 + 2;
      if (v13 + 3 < v28)
      {
        v29 = *(_QWORD *)(v11 + 8 * (v13 + 3));
        if (v29)
        {
          v27 = v13 + 3;
          goto LABEL_7;
        }
        v30 = v13 + 4;
        v15 = v13 + 3;
        if (v13 + 4 < v28)
        {
          v29 = *(_QWORD *)(v11 + 8 * v30);
          if (v29)
            goto LABEL_10;
          v27 = v13 + 5;
          v15 = v13 + 4;
          if (v13 + 5 < v28)
          {
            v29 = *(_QWORD *)(v11 + 8 * v27);
            if (v29)
              goto LABEL_7;
            v9 = v28 - 1;
            v31 = v13 + 6;
            while (v31 < v28)
            {
              v29 = *(_QWORD *)(v11 + 8 * v31++);
              if (v29)
              {
                v27 = v31 - 1;
                goto LABEL_7;
              }
            }
            goto LABEL_23;
          }
        }
      }
    }
  }
LABEL_24:
  v44 = v15;
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v3);
  v19 = 0;
LABEL_25:
  *v1 = v12;
  v1[1] = v11;
  v32 = v44;
  v1[2] = v14;
  v1[3] = v32;
  v1[4] = v19;
  v33 = (void (*)(uint64_t))v1[5];
  sub_1921C86F8((uint64_t)v10, (uint64_t)v8, &qword_1ECFD72A0);
  v34 = 1;
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v3) != 1)
  {
    v35 = (uint64_t)v8;
    v36 = (uint64_t)v40;
    sub_1921C86F8(v35, (uint64_t)v40, &qword_1ECFD7340);
    v33(v36);
    sub_1921C6C0C(v36, &qword_1ECFD7340);
    v34 = 0;
  }
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6E90);
  return __swift_storeEnumTagSinglePayload(a1, v34, 1, v37);
}

uint64_t sub_1921C5B88@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v4 = (uint64_t)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7340) + 48);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6E90);
  result = sub_1921C5BE8((uint64_t)a2 + *(int *)(v5 + 48), *a1, a1[1], v4);
  *a2 = result;
  a2[1] = v7;
  return result;
}

uint64_t sub_1921C5BE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1921C78F8(a4, a1);
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_1921C5C24(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1921C5C60(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  int v18;
  char v19;
  int v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char isUniquelyReferenced_nonNull_native;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  _QWORD *v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  char v53;
  unint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  void *v78;
  void *v79;
  unint64_t v80;
  char v81;
  unsigned __int16 v82;
  unint64_t v83;
  char v84;
  uint64_t v85;
  id v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  id v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  unint64_t v102;
  _BYTE v103[32];
  _OWORD v104[2];
  uint64_t v105;
  char v106;
  __int128 v107;
  uint64_t v108;
  _OWORD v109[2];
  uint64_t v110;

  v94 = a3;
  v99 = sub_1921DB874();
  v98 = *(_QWORD *)(v99 - 8);
  MEMORY[0x1E0C80A78](v99);
  v97 = (char *)&v94 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7348);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v94 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72B0);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v94 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (uint64_t *)((char *)&v94 - v15);
  sub_1921C6C70(a1, v109);
  sub_1921C6C44((uint64_t)v109, (uint64_t)&v107, &qword_1ECFD7320);
  v96 = a4;
  v95 = v10;
  if (v108)
  {
    sub_1921C86E8(&v107, v104);
    sub_1921C9084((uint64_t)v104, (uint64_t)v103);
    v17 = swift_dynamicCast();
    if ((v17 & 1) == 0)
      LOWORD(v105) = 0;
    BYTE2(v105) = v17 ^ 1;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v104);
    LODWORD(v101) = (unsigned __int16)v105;
    v18 = BYTE2(v105);
  }
  else
  {
    LODWORD(v101) = 0;
    v18 = 1;
  }
  sub_1921C6C0C((uint64_t)v109, &qword_1ECFD7320);
  sub_1921C6C70(a1, v109);
  sub_1921C6C44((uint64_t)v109, (uint64_t)&v107, &qword_1ECFD7320);
  v102 = (unint64_t)a2;
  if (v108)
  {
    sub_1921C86E8(&v107, v104);
    sub_1921C9084((uint64_t)v104, (uint64_t)v103);
    v19 = swift_dynamicCast();
    if ((v19 & 1) == 0)
      LOWORD(v105) = 0;
    BYTE2(v105) = v19 ^ 1;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v104);
    LODWORD(v100) = (unsigned __int16)v105;
    v20 = BYTE2(v105);
  }
  else
  {
    LODWORD(v100) = 0;
    v20 = 1;
  }
  sub_1921C6C0C((uint64_t)v109, &qword_1ECFD7320);
  sub_1921C6C70(a1, v109);
  sub_1921C6C44((uint64_t)v109, (uint64_t)&v107, &qword_1ECFD7320);
  if (v108)
  {
    sub_1921C86E8(&v107, v104);
    sub_1921C9084((uint64_t)v104, (uint64_t)v103);
    v21 = swift_dynamicCast();
    if ((v21 & 1) == 0)
      v105 = 0;
    v106 = v21 ^ 1;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v104);
    v22 = v105;
    v23 = v106;
  }
  else
  {
    v22 = 0;
    v23 = 1;
  }
  sub_1921C6C0C((uint64_t)v109, &qword_1ECFD7320);
  sub_1921C6C70(a1, v109);
  sub_1921C6C44((uint64_t)v109, (uint64_t)&v107, &qword_1ECFD7320);
  if (v108)
  {
    sub_1921C86E8(&v107, v104);
    sub_1921C9084((uint64_t)v104, (uint64_t)v103);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72A8);
    if ((swift_dynamicCast() & 1) == 0)
      v105 = 0;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v104);
    v24 = v105;
  }
  else
  {
    v24 = 0;
  }
  sub_1921C6C0C((uint64_t)v109, &qword_1ECFD7320);
  if (!v24)
    v24 = sub_1921DB8F8();
  if (((v18 | v20) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_1921D7CA0();
    swift_allocError();
    *v25 = 1;
    swift_willThrow();
    return;
  }
  v26 = v110;
  v27 = sub_1921C8148(v24);
  if (v26)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v28 = v27;
  v29 = *(_QWORD *)(v102 + OBJC_IVAR____RTCReportingS_extraFields);
  if (v29)
  {
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)&v109[0] = v28;
    sub_1921C5550(v29, (uint64_t)sub_1921C5B88, 0, isUniquelyReferenced_nonNull_native, (uint64_t)v109);
    v28 = *(_QWORD *)&v109[0];
    swift_bridgeObjectRelease();
  }
  v31 = v101;
  v110 = 0;
  *(_QWORD *)&v104[0] = v28;
  BYTE8(v104[0]) = (v22 == 1) & ~v23;
  v32 = qword_1ECFD7248;
  swift_bridgeObjectRetain();
  if (v32 != -1)
    swift_once();
  *v16 = v31;
  v33 = type metadata accessor for EventValue();
  swift_storeEnumTagMultiPayload();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v33);
  sub_1921C6C44((uint64_t)v16, (uint64_t)v14, &qword_1ECFD72B0);
  swift_bridgeObjectRetain();
  sub_1921C6CBC();
  sub_1921C6C0C((uint64_t)v16, &qword_1ECFD72B0);
  if (qword_1ECFD7250 != -1)
    swift_once();
  *v16 = v100;
  swift_storeEnumTagMultiPayload();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v33);
  sub_1921C6C44((uint64_t)v16, (uint64_t)v14, &qword_1ECFD72B0);
  swift_bridgeObjectRetain();
  sub_1921C6CBC();
  sub_1921C6C0C((uint64_t)v16, &qword_1ECFD72B0);
  v34 = v102;
  if ((*(_BYTE *)(v102 + OBJC_IVAR____RTCReportingS_completelyDisabled) & 1) != 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1ECFD73A0 != -1)
      swift_once();
    v35 = v99;
    v36 = __swift_project_value_buffer(v99, (uint64_t)qword_1ECFD7368);
    v37 = v98;
    v38 = v97;
    (*(void (**)(char *, uint64_t, uint64_t))(v98 + 16))(v97, v36, v35);
    v39 = (id)v34;
    v40 = sub_1921DB85C();
    v41 = sub_1921DBA18();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      v43 = swift_slowAlloc();
      *(_QWORD *)&v109[0] = v43;
      *(_DWORD *)v42 = 136315138;
      if (*(_QWORD *)((char *)v39 + OBJC_IVAR____RTCReportingS_generatedSessionID + 8))
      {
        v44 = *(_QWORD *)((char *)v39 + OBJC_IVAR____RTCReportingS_generatedSessionID);
        v45 = *(_QWORD *)((char *)v39 + OBJC_IVAR____RTCReportingS_generatedSessionID + 8);
      }
      else
      {
        v45 = 0xE100000000000000;
        v44 = 63;
      }
      swift_bridgeObjectRetain();
      *(_QWORD *)&v107 = sub_1921CACB8(v44, v45, (uint64_t *)v109);
      sub_1921DBA90();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1921BE000, v40, v41, "dropping message to inactive session(%s)", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x194024230](v43, -1, -1);
      MEMORY[0x194024230](v42, -1, -1);

      (*(void (**)(char *, uint64_t))(v98 + 8))(v97, v35);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v37 + 8))(v38, v35);
    }
    return;
  }
  v46 = (_BYTE *)OBJC_IVAR____RTCReportingS_sentEventCount;
  *v16 = *(_QWORD *)(v102 + OBJC_IVAR____RTCReportingS_sentEventCount);
  swift_storeEnumTagMultiPayload();
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v33);
  sub_1921C6C44((uint64_t)v16, (uint64_t)v14, &qword_1ECFD72B0);
  sub_1921C6CBC();
  sub_1921C6C0C((uint64_t)v16, &qword_1ECFD72B0);
  v47 = *(_QWORD *)&v46[v34];
  v48 = __CFADD__(v47, 1);
  v49 = v47 + 1;
  if (v48)
  {
    __break(1u);
    goto LABEL_95;
  }
  *(_QWORD *)&v46[v34] = v49;
  v16 = *(_QWORD **)(v34 + OBJC_IVAR____RTCReportingS_session);
  if (v16)
  {
    swift_retain();
    swift_bridgeObjectRelease();
    v50 = *(void **)(v34 + OBJC_IVAR____RTCReportingS_legacyAVCSupport);
    if (!v50)
    {
      swift_bridgeObjectRelease();
      v28 = *(_QWORD *)&v104[0];
      LOBYTE(v34) = BYTE8(v104[0]);
      goto LABEL_92;
    }
    v14 = v50;
    sub_1921D5A2C(v24);
    v51 = (void *)sub_1921DB8B0();
    swift_bridgeObjectRelease();
    v28 = *(_QWORD *)&v104[0];
    v34 = BYTE8(v104[0]);
    *(_QWORD *)&v109[0] = *(_QWORD *)&v104[0];
    BYTE8(v109[0]) = BYTE8(v104[0]);
    v52 = Event.category.getter();
    if ((v53 & 1) != 0)
      v54 = 0;
    else
      v54 = v52;
    if ((v54 & 0x8000000000000000) != 0 || v54 >= 0x10000)
      goto LABEL_100;
    *(_QWORD *)&v109[0] = v28;
    BYTE8(v109[0]) = v34;
    v55 = Event.type.getter();
    if ((v56 & 1) != 0)
    {
      LOWORD(v55) = 0;
    }
    else if ((v55 & 0x8000000000000000) != 0 || v55 >= 0x10000)
    {
      goto LABEL_100;
    }
    objc_msgSend(v14, sel_invokeAWDAdaptorForPayload_category_type_, v51, (unsigned __int16)v54, (unsigned __int16)v55, v94);

    if (qword_1ECFD7288 == -1)
    {
LABEL_76:
      if (byte_1ECFD7558 == 1)
      {
        v101 = v14;
        swift_bridgeObjectRetain();
        v100 = sub_1921DB928();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        v78 = (void *)sub_1921DB928();
        swift_bridgeObjectRelease();
        v57 = sub_1921D5A2C(v24);
        swift_bridgeObjectRelease();
        v79 = (void *)sub_1921DB8B0();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v109[0] = v28;
        BYTE8(v109[0]) = v34;
        v80 = Event.category.getter();
        if ((v81 & 1) != 0)
        {
          v82 = 0;
        }
        else
        {
          v82 = v80;
          if ((v80 & 0x8000000000000000) != 0 || v80 >= 0x10000)
            goto LABEL_100;
        }
        *(_QWORD *)&v109[0] = v28;
        BYTE8(v109[0]) = v34;
        v83 = Event.type.getter();
        if ((v84 & 1) != 0)
        {
          LOWORD(v83) = 0;
        }
        else if ((v83 & 0x8000000000000000) != 0 || v83 >= 0x10000)
        {
          goto LABEL_100;
        }
        v85 = *(_QWORD *)&v46[v102];
        if (v85)
        {
          v87 = (void *)v100;
          v86 = v101;
          objc_msgSend(v101, sel_sendPowerLogEventForClient_serviceName_payload_category_type_eventNumber_, v100, v78, v79, v82, (unsigned __int16)v83, v85 - 1);

          goto LABEL_92;
        }
        __break(1u);
        goto LABEL_97;
      }
      swift_bridgeObjectRelease();

LABEL_92:
      v88 = v96;
      v89 = (uint64_t)v95;
      sub_1921DB9C4();
      v90 = sub_1921DB9DC();
      __swift_storeEnumTagSinglePayload(v89, 0, 1, v90);
      v91 = swift_allocObject();
      *(_QWORD *)(v91 + 16) = 0;
      *(_QWORD *)(v91 + 24) = 0;
      *(_QWORD *)(v91 + 32) = v16;
      *(_QWORD *)(v91 + 40) = v28;
      *(_BYTE *)(v91 + 48) = v34;
      v92 = (void *)v102;
      *(_QWORD *)(v91 + 56) = v102;
      *(_QWORD *)(v91 + 64) = v88;
      swift_retain();
      v93 = v92;
      sub_1921D4E4C(v89, (uint64_t)&unk_1EE251850, v91);
      swift_release();
      swift_release();
      sub_1921C6C0C(v89, &qword_1ECFD7348);
      return;
    }
LABEL_95:
    swift_once();
    goto LABEL_76;
  }
  swift_bridgeObjectRelease();
  if (qword_1ECFD7288 != -1)
    swift_once();
  v46 = &unk_1ECFD7000;
  v34 = (unint64_t)&unk_1ECFD7000;
  v57 = v99;
  if ((byte_1ECFD7558 & 1) != 0)
  {
    if (qword_1ECFD73A0 == -1)
    {
LABEL_56:
      __swift_project_value_buffer(v57, (uint64_t)qword_1ECFD7368);
      v58 = sub_1921DB85C();
      v59 = sub_1921DBA30();
      if (os_log_type_enabled(v58, v59))
      {
        v60 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v60 = 0;
        _os_log_impl(&dword_1921BE000, v58, v59, "event sent to session with incomplete configuration - caching as a workaround", v60, 2u);
        MEMORY[0x194024230](v60, -1, -1);
      }

      goto LABEL_59;
    }
LABEL_97:
    swift_once();
    goto LABEL_56;
  }
LABEL_59:
  v61 = (char *)(v102 + OBJC_IVAR____RTCReportingS_earlyCachedEvents);
  swift_beginAccess();
  v62 = MEMORY[0x1E0DEE9D8];
  if (!*(_QWORD *)v61)
  {
    *(_QWORD *)v61 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRelease();
  }
  v63 = *(_QWORD *)&v104[0];
  v64 = BYTE8(v104[0]);
  swift_beginAccess();
  if (!*(_QWORD *)v61)
  {
    __break(1u);
    goto LABEL_99;
  }
  swift_bridgeObjectRetain();
  sub_1921C6FD0();
  v65 = *(char **)(*(_QWORD *)v61 + 16);
  sub_1921C6F94(v65);
  v66 = *(_QWORD *)v61;
  *(_QWORD *)(v66 + 16) = v65 + 1;
  v67 = v66 + 16 * (_QWORD)v65;
  *(_QWORD *)(v67 + 32) = v63;
  *(_BYTE *)(v67 + 40) = v64;
  swift_endAccess();
  v68 = *(_QWORD *)v61;
  if (!*(_QWORD *)v61)
  {
LABEL_99:
    __break(1u);
    swift_bridgeObjectRelease();
    __break(1u);
LABEL_100:
    sub_1921DBB68();
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v69 = *(_QWORD *)(v68 + 16);
  swift_bridgeObjectRelease();
  v70 = v69 <= v94;
  v71 = v99;
  if (!v70)
  {
    if (*(_QWORD *)(v34 + 928) != -1)
      swift_once();
    __swift_project_value_buffer(v71, (uint64_t)qword_1ECFD7368);
    v72 = sub_1921DB85C();
    v73 = sub_1921DBA3C();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v74 = 0;
      _os_log_impl(&dword_1921BE000, v72, v73, "too many events sent to unconfigured session", v74, 2u);
      MEMORY[0x194024230](v74, -1, -1);
    }

    if (v46[1368] == 1)
    {
      v75 = sub_1921DB85C();
      v76 = sub_1921DBA30();
      if (os_log_type_enabled(v75, v76))
      {
        v77 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v77 = 0;
        _os_log_impl(&dword_1921BE000, v75, v76, "dumping early event cache buffer - too large", v77, 2u);
        MEMORY[0x194024230](v77, -1, -1);
      }

    }
    *(_QWORD *)v61 = v62;
    swift_bridgeObjectRelease();
  }
}

void sub_1921C6C0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_38();
}

void sub_1921C6C44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_57_0(a1, a2, a3);
  OUTLINED_FUNCTION_80(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_38();
}

void sub_1921C6C70(uint64_t a1@<X2>, _OWORD *a2@<X8>)
{
  unint64_t v4;
  char v5;

  if (*(_QWORD *)(a1 + 16) && (v4 = sub_1921C85A8(), (v5 & 1) != 0))
  {
    sub_1921C9084(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)a2);
  }
  else
  {
    *a2 = 0u;
    a2[1] = 0u;
    OUTLINED_FUNCTION_38();
  }
}

void sub_1921C6CBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_35();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72B0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v4);
  v5 = OUTLINED_FUNCTION_27();
  if (__swift_getEnumTagSinglePayload(v5, 1, v6) == 1)
  {
    OUTLINED_FUNCTION_44(v0);
    OUTLINED_FUNCTION_37();
    sub_1921D0084(v7);
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_44(v1);
  }
  else
  {
    sub_1921C852C(v0, v2);
    sub_1921C6D78();
    OUTLINED_FUNCTION_24();
  }
  OUTLINED_FUNCTION_13();
}

uint64_t sub_1921C6D78()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  OUTLINED_FUNCTION_27_1();
  v1 = OUTLINED_FUNCTION_16_1();
  sub_1921C6DB0(v1, v2, v3);
  *v0 = v5;
  return OUTLINED_FUNCTION_15_1();
}

uint64_t sub_1921C6DB0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v9 = sub_1921C85A8();
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7350);
  if ((sub_1921DBB44() & 1) == 0)
    goto LABEL_5;
  v13 = sub_1921C85A8();
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_1921DBBF8();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];
    v17 = v16 + *(_QWORD *)(*(_QWORD *)(type metadata accessor for EventValue() - 8) + 72) * v11;
    return sub_1921C7018(a1, v17);
  }
  else
  {
    sub_1921C6ED0(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1921C6ED0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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
  v10 = type metadata accessor for EventValue();
  result = sub_1921C852C(a4, v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

uint64_t sub_1921C6F58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = -1 << *(_BYTE *)(a1 + 32);
  *a4 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64)
    v8 = ~(-1 << -(char)v4);
  else
    v8 = -1;
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

char *sub_1921C6F94(char *result)
{
  uint64_t *v1;
  unint64_t v2;

  v2 = *(_QWORD *)(*v1 + 24);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    result = sub_1921C9404((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *v1 = (uint64_t)result;
  }
  return result;
}

char *sub_1921C6FD0()
{
  uint64_t *v0;
  uint64_t v1;
  char *result;

  v1 = *v0;
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)result)
  {
    result = sub_1921C9404(result, *(_QWORD *)(v1 + 16) + 1, 1, v1);
    *v0 = (uint64_t)result;
  }
  return result;
}

uint64_t sub_1921C7018(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void *assignWithTake for EventValue(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_1921C793C((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for EventValue);
    if (swift_getEnumCaseMultiPayload() == 5)
    {
      v6 = sub_1921DB850();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void sub_1921C7100()
{
  uint64_t *v0;
  _QWORD *v1;
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
  xpc_object_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  unint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;
  uint64_t v40;
  int64_t v41;
  uint64_t v42;
  xpc_object_t v43;
  uint64_t v44;
  uint64_t v45;

  OUTLINED_FUNCTION_20();
  v44 = v2;
  v45 = v3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72F0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_10();
  v7 = v6 - v5;
  v8 = OUTLINED_FUNCTION_1_0();
  v42 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_10();
  v11 = v10 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72A0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v38 - v14;
  v16 = *v0;
  v17 = RTCXPCDictionary.init()();
  v40 = v16 + 64;
  v43 = v17;
  OUTLINED_FUNCTION_31();
  v20 = v19 & v18;
  v41 = (unint64_t)(v21 + 63) >> 6;
  v39 = v41 - 1;
  OUTLINED_FUNCTION_41();
  v22 = 0;
  if (!v20)
    goto LABEL_4;
LABEL_2:
  v23 = __clz(__rbit64(v20));
  v20 &= v20 - 1;
  v24 = v23 | (v22 << 6);
  while (2)
  {
    v25 = *(_QWORD *)(v16 + 56);
    v26 = (_QWORD *)(*(_QWORD *)(v16 + 48) + 16 * v24);
    v27 = v26[1];
    *v1 = *v26;
    v1[1] = v27;
    v28 = v25 + *(_QWORD *)(v42 + 72) * v24;
    v29 = OUTLINED_FUNCTION_16();
    sub_1921C78F8(v28, (uint64_t)v1 + *(int *)(v29 + 48));
    __swift_storeEnumTagSinglePayload((uint64_t)v1, 0, 1, v29);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1921C79E4((uint64_t)v1, (uint64_t)v15);
      v36 = OUTLINED_FUNCTION_16();
      if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v36) == 1)
      {
        swift_release();
        return;
      }
      sub_1921C852C((uint64_t)&v15[*(int *)(v36 + 48)], v11);
      sub_1921C741C();
      v37 = type metadata accessor for XPCObject();
      __swift_storeEnumTagSinglePayload(v7, 0, 1, v37);
      RTCXPCDictionary.subscript.setter(v7);
      sub_1921C793C(v11, (uint64_t (*)(_QWORD))type metadata accessor for EventValue);
      if (v20)
        goto LABEL_2;
LABEL_4:
      v30 = v22 + 1;
      if (__OFADD__(v22, 1))
      {
        __break(1u);
        goto LABEL_27;
      }
      if (v30 < v41)
      {
        v31 = *(_QWORD *)(v40 + 8 * v30);
        if (v31)
          goto LABEL_7;
        v32 = v22 + 2;
        ++v22;
        if (v30 + 1 < v41)
        {
          v31 = *(_QWORD *)(v40 + 8 * v32);
          if (v31)
            goto LABEL_10;
          v22 = v30 + 1;
          if (v30 + 2 < v41)
          {
            v31 = *(_QWORD *)(v40 + 8 * (v30 + 2));
            if (v31)
            {
              v30 += 2;
              goto LABEL_7;
            }
            v32 = v30 + 3;
            v22 = v30 + 2;
            if (v30 + 3 < v41)
              break;
          }
        }
      }
LABEL_21:
      v33 = OUTLINED_FUNCTION_16();
      OUTLINED_FUNCTION_29((uint64_t)v1, v34, v35, v33);
      v20 = 0;
    }
    v31 = *(_QWORD *)(v40 + 8 * v32);
    if (v31)
    {
LABEL_10:
      v30 = v32;
LABEL_7:
      v20 = (v31 - 1) & v31;
      v24 = __clz(__rbit64(v31)) + (v30 << 6);
      v22 = v30;
      continue;
    }
    break;
  }
  while (1)
  {
    v30 = v32 + 1;
    if (__OFADD__(v32, 1))
      break;
    if (v30 >= v41)
    {
      v22 = v39;
      goto LABEL_21;
    }
    v31 = *(_QWORD *)(v40 + 8 * v30);
    ++v32;
    if (v31)
      goto LABEL_7;
  }
LABEL_27:
  __break(1u);
}

void sub_1921C741C()
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
  _QWORD v9[8];

  OUTLINED_FUNCTION_20();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72F0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_34();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72A0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_33();
  MEMORY[0x1E0C80A78](v3);
  v9[6] = type metadata accessor for XPCObject();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_10();
  v5 = OUTLINED_FUNCTION_1_0();
  v9[5] = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_26();
  MEMORY[0x1E0C80A78](v6);
  sub_1921C78F8(v0, (uint64_t)v9 - v7);
  v8 = (char *)&loc_1921C7528 + dword_1921CE43C[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_1921C7538()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *v0 = *v1;
  v0[1] = v2;
  OUTLINED_FUNCTION_19();
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1921C78F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1921C793C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_21(v2);
  OUTLINED_FUNCTION_38();
}

uint64_t destroy for EventValue(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 6:
    case 7:
      result = swift_bridgeObjectRelease();
      break;
    case 5:
      v3 = sub_1921DB850();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1921C79E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t RTCXPCDictionary.subscript.setter(uint64_t a1)
{
  void **v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72F0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_10();
  v6 = v5 - v4;
  v7 = *v1;
  sub_1921C7E34(a1, v5 - v4, (uint64_t *)&unk_1ECFD72F0);
  v8 = OUTLINED_FUNCTION_63();
  if (__swift_getEnumTagSinglePayload(v6, 1, v8) == 1)
  {
    sub_1921C7DF8(v6, (uint64_t *)&unk_1ECFD72F0);
    v9 = 0;
  }
  else
  {
    XPCObject.obj.getter();
    v9 = v10;
    sub_1921C7B34(v6);
  }
  v11 = OUTLINED_FUNCTION_13_2();
  swift_bridgeObjectRelease();
  xpc_dictionary_set_value(v7, (const char *)(v11 + 32), v9);
  swift_unknownObjectRelease();
  sub_1921C7DF8(a1, (uint64_t *)&unk_1ECFD72F0);
  return swift_release();
}

uint64_t sub_1921C7B34(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for XPCObject(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 10:
    case 11:
    case 12:
      result = swift_unknownObjectRelease();
      break;
    case 7:
      result = sub_1921D97E4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
      break;
    case 8:
      result = swift_bridgeObjectRelease();
      break;
    case 9:
      v3 = sub_1921DB850();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1921C7C08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for XPCObject()
{
  uint64_t result;

  result = qword_1ECFD7300;
  if (!qword_1ECFD7300)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t *initializeWithCopy for XPCObject(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 0xAu:
    case 0xBu:
    case 0xCu:
      *a1 = *a2;
      swift_unknownObjectRetain();
      goto LABEL_7;
    case 7u:
      v7 = *a2;
      v6 = a2[1];
      sub_1921D9AE0(v7, v6);
      *a1 = v7;
      a1[1] = v6;
      goto LABEL_7;
    case 8u:
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 9u:
      v9 = sub_1921DB850();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
LABEL_7:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t sub_1921C7DF8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1921C7E34(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void XPCObject.obj.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;

  v1 = sub_1921DB850();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_10();
  sub_1921C7C08(v0, v4 - v3);
  v5 = (char *)&loc_1921C7F1C + dword_1921D91EC[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_1921C7F2C()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_1921C8148(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  _BOOL8 v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  int64_t v45;
  uint64_t result;
  int64_t v47;
  uint64_t v48;
  int64_t v49;
  _OWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  unint64_t v54;
  int64_t v55;
  uint64_t v56;
  __int128 v57;
  _OWORD v58[2];
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v2 = v1;
  v52 = *(_QWORD *)(type metadata accessor for EventValue() - 8);
  OUTLINED_FUNCTION_74_0();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_33();
  v7 = v5 - v6;
  MEMORY[0x1E0C80A78](v8);
  v10 = (int64_t *)((char *)&v47 - v9);
  v11 = sub_1921DB8E0();
  v48 = a1 + 64;
  OUTLINED_FUNCTION_62_0();
  v14 = v13 & v12;
  v49 = (unint64_t)(v15 + 63) >> 6;
  v50 = v58;
  v53 = &v61;
  v47 = v49 - 1;
  v51 = a1;
  OUTLINED_FUNCTION_86();
  v16 = 0;
  if (!v14)
    goto LABEL_4;
LABEL_2:
  v17 = __clz(__rbit64(v14));
  v18 = (v14 - 1) & v14;
  v19 = v17 | (v16 << 6);
LABEL_3:
  v20 = *(_QWORD *)(v51 + 56);
  v21 = (_QWORD *)(*(_QWORD *)(v51 + 48) + 16 * v19);
  v22 = v21[1];
  *(_QWORD *)&v57 = *v21;
  *((_QWORD *)&v57 + 1) = v22;
  sub_1921C9084(v20 + 32 * v19, (uint64_t)v50);
  OUTLINED_FUNCTION_86();
  while (1)
  {
    sub_1921C86F8((uint64_t)&v57, (uint64_t)&v59, &qword_1ECFD7318);
    v25 = v60;
    if (!v60)
      goto LABEL_38;
    v26 = v59;
    sub_1921C86E8(v53, &v57);
    sub_1921C8724((uint64_t)&v57, v10);
    if (v2)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v57);
      swift_bridgeObjectRelease();
LABEL_38:
      swift_release();
      return v11;
    }
    v54 = v18;
    v55 = v16;
    v56 = 0;
    v27 = v10;
    sub_1921C852C((uint64_t)v10, v7);
    swift_isUniquelyReferenced_nonNull_native();
    v62 = v11;
    v28 = OUTLINED_FUNCTION_69_0();
    v30 = *(_QWORD *)(v11 + 16);
    v31 = (v29 & 1) == 0;
    v7 = v30 + v31;
    if (__OFADD__(v30, v31))
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    v32 = v28;
    v33 = v29;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7350);
    if ((sub_1921DBB44() & 1) != 0)
    {
      v34 = OUTLINED_FUNCTION_69_0();
      if ((v33 & 1) != (v35 & 1))
        goto LABEL_43;
      v32 = v34;
    }
    v11 = v62;
    if ((v33 & 1) != 0)
    {
      v36 = OUTLINED_FUNCTION_45_1();
      sub_1921C7018(v36, v37);
    }
    else
    {
      OUTLINED_FUNCTION_71_0(v62 + 8 * (v32 >> 6));
      v39 = (_QWORD *)(v38 + 16 * v32);
      *v39 = v26;
      v39[1] = v25;
      v40 = OUTLINED_FUNCTION_45_1();
      sub_1921C852C(v40, v41);
      v42 = *(_QWORD *)(v11 + 16);
      v43 = __OFADD__(v42, 1);
      v44 = v42 + 1;
      if (v43)
        goto LABEL_40;
      *(_QWORD *)(v11 + 16) = v44;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v57);
    v10 = v27;
    v16 = v55;
    v2 = v56;
    v14 = v54;
    if (v54)
      goto LABEL_2;
LABEL_4:
    v23 = v16 + 1;
    if (__OFADD__(v16, 1))
      goto LABEL_41;
    if (v23 < v49)
    {
      v24 = *(_QWORD *)(v48 + 8 * v23);
      if (v24)
        goto LABEL_7;
      v16 += 2;
      if (v23 + 1 >= v49)
      {
        v16 = v23;
        goto LABEL_12;
      }
      v24 = *(_QWORD *)(v48 + 8 * v16);
      if (v24)
      {
        ++v23;
LABEL_7:
        v18 = (v24 - 1) & v24;
        v19 = __clz(__rbit64(v24)) + (v23 << 6);
        v16 = v23;
        goto LABEL_3;
      }
      if (v23 + 2 < v49)
        break;
    }
LABEL_12:
    v18 = 0;
    memset(v58, 0, sizeof(v58));
    v57 = 0u;
  }
  v24 = *(_QWORD *)(v48 + 8 * (v23 + 2));
  if (v24)
  {
    v23 += 2;
    goto LABEL_7;
  }
  v45 = v23 + 3;
  if (v23 + 3 >= v49)
  {
    v16 = v23 + 2;
    goto LABEL_12;
  }
  v24 = *(_QWORD *)(v48 + 8 * v45);
  if (v24)
  {
    v23 += 3;
    goto LABEL_7;
  }
  while (1)
  {
    v23 = v45 + 1;
    if (__OFADD__(v45, 1))
      break;
    if (v23 >= v49)
    {
      v16 = v47;
      goto LABEL_12;
    }
    v24 = *(_QWORD *)(v48 + 8 * v23);
    ++v45;
    if (v24)
      goto LABEL_7;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  result = sub_1921DBBF8();
  __break(1u);
  return result;
}

uint64_t sub_1921C852C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EventValue();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for EventValue()
{
  uint64_t result;

  result = qword_1ECFD7330;
  if (!qword_1ECFD7330)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_1921C85A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1921DBC64();
  sub_1921DB958();
  sub_1921DBC88();
  v0 = OUTLINED_FUNCTION_42();
  return sub_1921C8608(v0, v1, v2);
}

unint64_t sub_1921C8608(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1921DBBBC() & 1) == 0)
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
      while (!v14 && (sub_1921DBBBC() & 1) == 0);
    }
  }
  return v6;
}

_OWORD *sub_1921C86E8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1921C86F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_57_0(a1, a2, a3);
  OUTLINED_FUNCTION_80(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_38();
}

uint64_t sub_1921C8724@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t v53;
  int64_t v54;
  unint64_t v55;
  uint64_t *v56;
  unint64_t v57;
  char v58;
  unint64_t v59;
  char v60;
  char v61;
  unint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t **v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  int64_t v73;
  void *v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  _QWORD v86[2];
  uint64_t v87;
  int64_t v88;
  _OWORD *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  _BYTE *v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  __int128 v99;
  _OWORD v100[2];
  __int128 v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  _BYTE v105[40];
  id v106;

  v5 = type metadata accessor for EventValue();
  v95 = *(_QWORD *)(v5 - 8);
  OUTLINED_FUNCTION_74_0();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_33();
  v97 = v7 - v8;
  v10 = MEMORY[0x1E0C80A78](v9);
  v94 = (char *)v86 - v11;
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v86 - v12;
  v92 = (uint64_t *)sub_1921DB784();
  v91 = *(v92 - 1);
  OUTLINED_FUNCTION_74_0();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_10();
  v96 = v16 - v15;
  v17 = sub_1921DB850();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_10();
  v21 = v20 - v19;
  sub_1921C9084(a1, (uint64_t)v105);
  v22 = OUTLINED_FUNCTION_5_1();
  if ((_DWORD)v22)
  {
    v23 = *((_QWORD *)&v101 + 1);
    *a2 = v101;
    a2[1] = v23;
LABEL_12:
    swift_storeEnumTagMultiPayload();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v105);
  }
  v93 = a2;
  v90 = v5;
  OUTLINED_FUNCTION_51_1(v22, &qword_1ECFD7270);
  if (OUTLINED_FUNCTION_5_1())
  {
    v24 = v101;
    if (*MEMORY[0x1E0C9AE50] && (_QWORD)v101 == *MEMORY[0x1E0C9AE50])
    {

      *v93 = 1;
      goto LABEL_12;
    }
    v25 = *MEMORY[0x1E0C9AE40];

    if (v25 && v24 == v25)
    {
      *(_BYTE *)OUTLINED_FUNCTION_94() = 0;
      goto LABEL_12;
    }
  }
  if (OUTLINED_FUNCTION_5_1() || (v27 = v2, OUTLINED_FUNCTION_5_1()))
  {
    OUTLINED_FUNCTION_41_1();
    goto LABEL_12;
  }
  v28 = MEMORY[0x1E0DEE9B8] + 8;
  if (OUTLINED_FUNCTION_5_1())
  {
    v29 = (_QWORD *)OUTLINED_FUNCTION_94();
    *v29 = v30;
    goto LABEL_12;
  }
  v31 = OUTLINED_FUNCTION_11_1();
  if ((_DWORD)v31)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v18 + 32))(v93, v21, v17);
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_51_1(v31, &qword_1ECFD7048);
  v32 = OUTLINED_FUNCTION_11_1();
  if ((_DWORD)v32)
  {
    v33 = v106;
    v34 = (uint64_t)objc_msgSend(v106, sel_count);
    v35 = sub_1921D8310(0, v34 & ~(v34 >> 63), 0, MEMORY[0x1E0DEE9D8]);
    sub_1921DBA84();
    sub_1921DB778();
    v36 = v95;
    if (v103)
    {
      while (1)
      {
        sub_1921C86E8(&v101, &v99);
        sub_1921C8724(&v99);
        if (v2)
          break;
        v38 = *(_QWORD *)(v35 + 16);
        v37 = *(_QWORD *)(v35 + 24);
        if (v38 >= v37 >> 1)
          v35 = sub_1921D8310(v37 > 1, v38 + 1, 1, v35);
        *(_QWORD *)(v35 + 16) = v38 + 1;
        sub_1921C852C((uint64_t)v13, v35+ ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))+ *(_QWORD *)(v36 + 72) * v38);
        OUTLINED_FUNCTION_50_1();
        sub_1921DB778();
        if (!v103)
          goto LABEL_64;
      }

      OUTLINED_FUNCTION_50_1();
      OUTLINED_FUNCTION_25_1();
      swift_bridgeObjectRelease();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v105);
    }
LABEL_64:
    OUTLINED_FUNCTION_25_1();

    *(_QWORD *)OUTLINED_FUNCTION_94() = v35;
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_51_1(v32, (unint64_t *)&unk_1ECFD7210);
  v39 = OUTLINED_FUNCTION_11_1();
  if (!(_DWORD)v39)
  {
    OUTLINED_FUNCTION_51_1(v39, &qword_1ECFD6EA8);
    if (OUTLINED_FUNCTION_11_1())
    {
      v74 = (void *)v101;
      if (objc_msgSend((id)v101, sel_respondsToSelector_, sel_description))
      {
        v75 = objc_msgSend(v74, sel_description);
        v76 = sub_1921DB934();
        v78 = v77;

        v79 = (_QWORD *)OUTLINED_FUNCTION_94();
        *v79 = v76;
        v79[1] = v78;
        goto LABEL_12;
      }

    }
    v80 = (_QWORD *)OUTLINED_FUNCTION_38_1();
    __swift_project_boxed_opaque_existential_0(v80, v81);
    *(_QWORD *)&v101 = swift_getDynamicType();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE2514B0);
    v82 = sub_1921DB940();
    v84 = v83;
    sub_1921D89F4();
    OUTLINED_FUNCTION_33_0();
    *v85 = v82;
    v85[1] = v84;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v105);
  }
  *(_QWORD *)&v101 = 0;
  v40 = (uint64_t *)&v101;
  v86[1] = v106;
  sub_1921DB8BC();
  v41 = v101;
  if (!(_QWORD)v101)
    goto LABEL_77;
  v104 = sub_1921DB8E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6E88);
  sub_1921DB8EC();
  v42 = 0;
  v91 = v41;
  v87 = v41 + 64;
  OUTLINED_FUNCTION_62_0();
  v45 = v44 & v43;
  v46 = v104;
  v89 = v100;
  v92 = &v102;
  v88 = (unint64_t)(v47 + 63) >> 6;
  v86[0] = v88 - 1;
  OUTLINED_FUNCTION_93();
  if (!v45)
    goto LABEL_31;
LABEL_29:
  v48 = __clz(__rbit64(v45));
  v49 = (v45 - 1) & v45;
  v50 = v48 | (v42 << 6);
LABEL_30:
  v51 = *(_QWORD *)(v91 + 56);
  v52 = (_QWORD *)(*(_QWORD *)(v91 + 48) + 16 * v50);
  v53 = v52[1];
  *(_QWORD *)&v99 = *v52;
  *((_QWORD *)&v99 + 1) = v53;
  sub_1921C9084(v51 + 32 * v50, (uint64_t)v89);
  OUTLINED_FUNCTION_54_0();
  while (1)
  {
    sub_1921C86F8((uint64_t)&v99, (uint64_t)&v101, &qword_1ECFD7318);
    v56 = (uint64_t *)*((_QWORD *)&v101 + 1);
    if (!*((_QWORD *)&v101 + 1))
    {
      v104 = v46;
      OUTLINED_FUNCTION_70_0();
      OUTLINED_FUNCTION_97();
      *v40 = v46;
      goto LABEL_12;
    }
    v40 = (uint64_t *)v101;
    sub_1921C86E8(v92, &v99);
    sub_1921C8724(&v99);
    if (v27)
    {
      v104 = v46;
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_70_0();
      OUTLINED_FUNCTION_50_1();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_97();
      return __swift_destroy_boxed_opaque_existential_0((uint64_t)v105);
    }
    v96 = v49;
    sub_1921C852C(v28, v97);
    swift_isUniquelyReferenced_nonNull_native();
    v98 = v46;
    v57 = OUTLINED_FUNCTION_43();
    if (__OFADD__(*(_QWORD *)(v46 + 16), (v58 & 1) == 0))
    {
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
      goto LABEL_76;
    }
    v59 = v57;
    v60 = v58;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7350);
    v61 = sub_1921DBB44();
    v28 = v95;
    if ((v61 & 1) != 0)
    {
      v62 = OUTLINED_FUNCTION_43();
      if ((v60 & 1) != (v63 & 1))
        goto LABEL_78;
      v59 = v62;
    }
    v46 = v98;
    if ((v60 & 1) != 0)
    {
      v64 = OUTLINED_FUNCTION_95();
      sub_1921C7018(v64, v65);
    }
    else
    {
      OUTLINED_FUNCTION_71_0(v98 + 8 * (v59 >> 6));
      v67 = (uint64_t **)(v66 + 16 * v59);
      *v67 = v40;
      v67[1] = v56;
      v68 = OUTLINED_FUNCTION_95();
      sub_1921C852C(v68, v69);
      v70 = *(_QWORD *)(v46 + 16);
      v71 = __OFADD__(v70, 1);
      v72 = v70 + 1;
      if (v71)
        goto LABEL_74;
      *(_QWORD *)(v46 + 16) = v72;
      OUTLINED_FUNCTION_54_0();
    }
    v27 = 0;
    OUTLINED_FUNCTION_93();
    v45 = v96;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_50_1();
    if (v45)
      goto LABEL_29;
LABEL_31:
    v54 = v42 + 1;
    if (__OFADD__(v42, 1))
      goto LABEL_75;
    if (v54 < v88)
    {
      v55 = *(_QWORD *)(v87 + 8 * v54);
      if (v55)
        goto LABEL_34;
      v42 += 2;
      if (v54 + 1 >= v88)
      {
        v42 = v54;
        goto LABEL_39;
      }
      v55 = *(_QWORD *)(v87 + 8 * v42);
      if (v55)
      {
        ++v54;
LABEL_34:
        v49 = (v55 - 1) & v55;
        v50 = __clz(__rbit64(v55)) + (v54 << 6);
        v42 = v54;
        goto LABEL_30;
      }
      if (v54 + 2 < v88)
        break;
    }
LABEL_39:
    v49 = 0;
    memset(v100, 0, sizeof(v100));
    v99 = 0u;
  }
  v55 = *(_QWORD *)(v87 + 8 * (v54 + 2));
  if (v55)
  {
    v54 += 2;
    goto LABEL_34;
  }
  v73 = v54 + 3;
  if (v54 + 3 >= v88)
  {
    v42 = v54 + 2;
    goto LABEL_39;
  }
  v55 = *(_QWORD *)(v87 + 8 * v73);
  if (v55)
  {
    v54 += 3;
    goto LABEL_34;
  }
  while (1)
  {
    v54 = v73 + 1;
    if (__OFADD__(v73, 1))
      break;
    if (v54 >= v88)
    {
      v42 = v86[0];
      goto LABEL_39;
    }
    v55 = *(_QWORD *)(v87 + 8 * v54);
    ++v73;
    if (v55)
      goto LABEL_34;
  }
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  result = sub_1921DBBF8();
  __break(1u);
  return result;
}

uint64_t sub_1921C9084(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1921C90C0(uint64_t a1, unint64_t *a2)
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

xpc_object_t RTCXPCDictionary.init(dictionaryLiteral:)(uint64_t a1)
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
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  char *v48;
  xpc_object_t empty;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72F0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_33();
  v5 = v3 - v4;
  MEMORY[0x1E0C80A78](v6);
  v48 = (char *)&v40 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7310);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_33();
  v47 = (_QWORD *)(v10 - v11);
  v13 = MEMORY[0x1E0C80A78](v12);
  v46 = (uint64_t *)((char *)&v40 - v14);
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (uint64_t *)((char *)&v40 - v16);
  MEMORY[0x1E0C80A78](v15);
  v19 = (uint64_t *)((char *)&v40 - v18);
  empty = xpc_dictionary_create_empty();
  v20 = *(_QWORD *)(a1 + 16);
  if (v20)
  {
    v40 = a1;
    v41 = v5;
    v44 = v19;
    v45 = v8;
    v43 = (uint64_t)v19 + *(int *)(v8 + 48);
    v21 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v42 = *(_QWORD *)(v9 + 72);
    v22 = (uint64_t)v48;
    do
    {
      sub_1921C7E34(v21, (uint64_t)v19, &qword_1ECFD7310);
      v23 = v45;
      v24 = (uint64_t)v17 + *(int *)(v45 + 48);
      v26 = *v19;
      v25 = v19[1];
      *v17 = v26;
      v17[1] = v25;
      sub_1921C93BC(v43, v24);
      v27 = *(int *)(v23 + 48);
      v28 = v46;
      v29 = (uint64_t)v46 + v27;
      *v46 = v26;
      v28[1] = v25;
      sub_1921C7C08(v24, (uint64_t)v28 + v27);
      v30 = *(int *)(v23 + 48);
      v31 = v47;
      v32 = (uint64_t)v47 + v30;
      *v47 = v26;
      v31[1] = v25;
      sub_1921C7C08(v24, (uint64_t)v31 + v30);
      sub_1921C93BC(v32, v22);
      v33 = OUTLINED_FUNCTION_63();
      OUTLINED_FUNCTION_5_2();
      v34 = v22;
      v35 = v41;
      sub_1921C7E34(v34, v41, (uint64_t *)&unk_1ECFD72F0);
      LODWORD(v33) = __swift_getEnumTagSinglePayload(v35, 1, v33);
      swift_bridgeObjectRetain();
      if ((_DWORD)v33 == 1)
      {
        OUTLINED_FUNCTION_12_2();
        v36 = 0;
      }
      else
      {
        XPCObject.obj.getter();
        v36 = v37;
        sub_1921C7B34(v35);
      }
      v38 = sub_1921DB94C();
      swift_bridgeObjectRelease();
      xpc_dictionary_set_value(empty, (const char *)(v38 + 32), v36);
      swift_unknownObjectRelease();
      v22 = (uint64_t)v48;
      OUTLINED_FUNCTION_12_2();
      swift_release();
      sub_1921C7DF8((uint64_t)v17, &qword_1ECFD7310);
      sub_1921C7B34(v29);
      v21 += v42;
      --v20;
      v19 = v44;
    }
    while (v20);
  }
  swift_bridgeObjectRelease();
  return empty;
}

uint64_t sub_1921C93BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

char *sub_1921C9404(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_1ECFD7050);
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
  if ((v5 & 1) != 0)
  {
    sub_1921C94F0((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1921C019C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_1921C94F0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1921DBB98();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t RTCReportingSendMessageWithError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, CFErrorRef *a5)
{
  void *v10;
  uint64_t v11;
  const __CFAllocator *v12;
  CFIndex v13;
  id v15;

  if (!a1)
    return 0;
  v10 = (void *)MEMORY[0x194023DEC]();
  v15 = 0;
  v11 = objc_msgSend(a1, "sendMessageWithCategory:type:payload:error:", a2, a3, a4, &v15);
  if (a5)
  {
    *a5 = 0;
    if (v15)
    {
      v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v13 = objc_msgSend(v15, "code");
      *a5 = CFErrorCreate(v12, CFSTR("RTCReportingErrorDomain"), v13, (CFDictionaryRef)objc_msgSend(v15, "userInfo"));
    }
  }
  objc_autoreleasePoolPop(v10);
  return v11;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x194024188]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(a1, 0, 1, v1);
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_0_2(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return swift_unknownObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  uint64_t v0;

  return v0;
}

uint64_t *OUTLINED_FUNCTION_32_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return &a9;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_1921DBAC0();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_63()
{
  return type metadata accessor for XPCObject();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_22(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return type metadata accessor for EventValue();
}

uint64_t OUTLINED_FUNCTION_37()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return 0x64696C61766E693CLL;
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

uint64_t OUTLINED_FUNCTION_3_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_storeEnumTagSinglePayload(v0, 0, 1, v2);
  return sub_1921C3968(v0, v1);
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x1Cu);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return sub_1921DBAB4();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_12()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_7_2()
{
  _xpc_connection_s *v0;
  void *v1;

  xpc_connection_set_event_handler(v0, v1);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xEu);
}

void OUTLINED_FUNCTION_6_1()
{
  JUMPOUT(0x194024230);
}

uint64_t OUTLINED_FUNCTION_25(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return swift_unknownObjectRetain();
}

_QWORD *initializeWithCopy for EventValue(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
      goto LABEL_6;
    case 5u:
      v7 = sub_1921DB850();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      goto LABEL_6;
    case 6u:
    case 7u:
      *a1 = *a2;
      swift_bridgeObjectRetain();
LABEL_6:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t OUTLINED_FUNCTION_39()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_39_0()
{
  uint64_t v0;
  uint64_t *v1;

  sub_1921C3940(v0, v1);
}

id OUTLINED_FUNCTION_39_1()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_31_0()
{
  sub_1921C6CBC();
}

uint64_t OUTLINED_FUNCTION_31_1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_16()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  _QWORD *v0;
  uint64_t v1;

  *v0 = 0x8000000000000000;
  return v1;
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_27()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_27_1()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  uint64_t v0;

  return RTCXPCDictionary.subscript.setter(v0);
}

uint64_t OUTLINED_FUNCTION_10_2(uint64_t a1)
{
  return RTCXPCDictionary.subscript.setter(a1);
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_35_1()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_18_1(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 288) + 8))(*(_QWORD *)(v0 - 248), *(_QWORD *)(v0 - 280));
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_1921DB910();
}

void *OUTLINED_FUNCTION_28_0@<X0>(uint64_t a1@<X8>)
{
  void *v1;

  return RTCXPCDictionary.subscript.getter(v1, a1);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_13_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return sub_1921DB94C();
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return sub_1921DBACC();
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return swift_allocError();
}

void OUTLINED_FUNCTION_33_1(id a1)
{

}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  uint64_t *v0;

  return sub_1921CC1EC(v0[26], v0[27], v0[28], v0[29]);
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return swift_retain();
}

unint64_t OUTLINED_FUNCTION_4_3()
{
  return sub_1921C85A8();
}

uint64_t OUTLINED_FUNCTION_21(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_21_1(os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_14_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __swift_storeEnumTagSinglePayload(a1, a2, a3, v3);
  return sub_1921C3968(v4, v5);
}

void OUTLINED_FUNCTION_23()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_14_1()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1921D97E4(v1, v0);
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_38_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_44(uint64_t a1)
{
  uint64_t *v1;

  sub_1921C3940(a1, v1);
}

BOOL OUTLINED_FUNCTION_44_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_44_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return sub_1921DB9DC();
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_dynamicCast();
}

char *OUTLINED_FUNCTION_11_2(uint64_t a1, uint64_t a2)
{
  return sub_1921D9760(a1, a2);
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_1921DB910();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_17_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return swift_task_dealloc();
}

_QWORD *OUTLINED_FUNCTION_41_1()
{
  uint64_t v0;
  _QWORD *result;

  result = *(_QWORD **)(v0 - 272);
  *result = *(_QWORD *)(v0 - 176);
  return result;
}

uint64_t OUTLINED_FUNCTION_9()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_55()
{
  return swift_release();
}

void *OUTLINED_FUNCTION_9_1@<X0>(uint64_t a1@<X8>, uint64_t a2, char aBlock, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  a5 = a1;
  a6 = v6;
  return _Block_copy(&aBlock);
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return sub_1921C3A7C();
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return sub_1921C78F8(v3 + *(_QWORD *)(*(_QWORD *)(a1 - 8) + 72) * v2, v1);
}

uint64_t OUTLINED_FUNCTION_15_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  a1[2] = v2;
  a1[3] = v3;
  a1[4] = v2;
  a1[5] = v1;
  a1[6] = v4;
  return swift_retain_n();
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  return swift_bridgeObjectRelease();
}

xpc_object_t OUTLINED_FUNCTION_15_2(uint64_t a1)
{
  void *v1;

  return xpc_dictionary_get_value(v1, (const char *)(a1 + 32));
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_1921DBAA8();
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 80) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_1(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_12_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  uint64_t v0;
  uint64_t *v1;

  return sub_1921C7DF8(v0, v1);
}

uint64_t OUTLINED_FUNCTION_30()
{
  return sub_1921DBBD4();
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_61()
{
  return sub_1921DB874();
}

uint64_t OUTLINED_FUNCTION_19()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  uint64_t v0;

  return sub_1921C1508(v0);
}

uint64_t OUTLINED_FUNCTION_45_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_45_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

void OUTLINED_FUNCTION_29_0()
{
  uint64_t *v0;
  uint64_t v1;

  sub_1921C3940(v1, v0);
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_46(uint64_t a1)
{
  uint64_t *v1;

  sub_1921C3940(a1, v1);
}

void OUTLINED_FUNCTION_46_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(v1 + a1) + 16));
}

unint64_t OUTLINED_FUNCTION_43()
{
  return sub_1921C85A8();
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_43_1(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t log)
{
  os_log_type_t v10;
  uint8_t *v11;

  _os_log_impl(a1, log, v10, a4, v11, 2u);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void OUTLINED_FUNCTION_47_0(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
  a1[1] = 0xE700000000000000;
}

void OUTLINED_FUNCTION_47_1()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

id OUTLINED_FUNCTION_49_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, (SEL)(v2 + 3606), v1);
}

uint64_t sub_1921CA1B8(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1921CA1C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = v1;
  os_unfair_lock_assert_owner((const os_unfair_lock *)(*(_QWORD *)(v2 + OBJC_IVAR____RTCReportingS_lock) + 16));
  v4 = sub_1921C8148(a1);
  v5 = sub_1921CA404(v4);
  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(v5 + 16))
  {
    swift_release();
    v5 = 0;
  }
  *(_QWORD *)(v2 + OBJC_IVAR____RTCReportingS_extraFields) = v5;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1921CA404(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  unint64_t v4;
  unint64_t *v5;
  uint64_t v6;
  unint64_t *v7;
  _QWORD v9[2];

  v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  v4 = (unint64_t)((1 << v3) + 63) >> 6;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    v5 = (_QWORD *)((char *)v9 - ((8 * v4 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_1921CAC9C(0, v4, v5);
    v6 = sub_1921CA560(v5, v4, v2);
    if (v1)
      swift_willThrow();
    else
      return v6;
  }
  else
  {
    v7 = (unint64_t *)swift_slowAlloc();
    sub_1921CAC9C(0, v4, v7);
    v2 = sub_1921CA560(v7, v4, v2);
    MEMORY[0x194024230](v7, -1, -1);
  }
  return v2;
}

uint64_t sub_1921CA560(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  uint64_t v28[2];
  int64_t v29;

  v25 = a2;
  v26 = a1;
  v5 = type metadata accessor for EventValue();
  v6 = *(_QWORD *)(v5 - 8);
  result = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = 0;
  v10 = 0;
  v11 = a3 + 64;
  v12 = 1 << *(_BYTE *)(a3 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(a3 + 64);
  v29 = (unint64_t)(v12 + 63) >> 6;
  while (v14)
  {
    v15 = __clz(__rbit64(v14));
    v14 &= v14 - 1;
    v16 = v15 | (v10 << 6);
LABEL_17:
    v20 = *(_QWORD *)(a3 + 56);
    v21 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v16);
    v22 = v21[1];
    v28[0] = *v21;
    v28[1] = v22;
    sub_1921C78F8(v20 + *(_QWORD *)(v6 + 72) * v16, (uint64_t)v9);
    swift_bridgeObjectRetain();
    v23 = sub_1921CA788(v28, (uint64_t)v9);
    sub_1921C5C24((uint64_t)v9);
    result = swift_bridgeObjectRelease();
    if (v3)
      return result;
    if ((v23 & 1) != 0)
    {
      *(unint64_t *)((char *)v26 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v17 = __OFADD__(v27++, 1);
      if (v17)
        goto LABEL_30;
    }
  }
  v17 = __OFADD__(v10++, 1);
  if (v17)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v10 >= v29)
    return sub_1921CA960(v26, v25, v27, (_QWORD *)a3);
  v18 = *(_QWORD *)(v11 + 8 * v10);
  if (v18)
  {
LABEL_16:
    v14 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v10 << 6);
    goto LABEL_17;
  }
  v19 = v10 + 1;
  if (v10 + 1 >= v29)
    return sub_1921CA960(v26, v25, v27, (_QWORD *)a3);
  v18 = *(_QWORD *)(v11 + 8 * v19);
  if (v18)
    goto LABEL_15;
  v19 = v10 + 2;
  if (v10 + 2 >= v29)
    return sub_1921CA960(v26, v25, v27, (_QWORD *)a3);
  v18 = *(_QWORD *)(v11 + 8 * v19);
  if (v18)
    goto LABEL_15;
  v19 = v10 + 3;
  if (v10 + 3 >= v29)
    return sub_1921CA960(v26, v25, v27, (_QWORD *)a3);
  v18 = *(_QWORD *)(v11 + 8 * v19);
  if (v18)
  {
LABEL_15:
    v10 = v19;
    goto LABEL_16;
  }
  while (1)
  {
    v10 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v10 >= v29)
      return sub_1921CA960(v26, v25, v27, (_QWORD *)a3);
    v18 = *(_QWORD *)(v11 + 8 * v10);
    ++v19;
    if (v18)
      goto LABEL_16;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1921CA788(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v19;
  _QWORD v21[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7340);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (_QWORD *)((char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = (_QWORD *)((char *)v21 - v9);
  v12 = *a1;
  v11 = a1[1];
  v13 = (char *)v21 + *(int *)(v8 + 48) - v9;
  *v10 = v12;
  v10[1] = v11;
  sub_1921C78F8(a2, (uint64_t)v13);
  if (v12 == 0x4E746E65696C635FLL && v11 == 0xEB00000000656D61)
  {
    v19 = (uint64_t)v7 + *(int *)(v4 + 48);
    *v7 = 0x4E746E65696C635FLL;
    v7[1] = v11;
    sub_1921C78F8((uint64_t)v13, v19);
    goto LABEL_12;
  }
  v15 = sub_1921DBBBC();
  v16 = (uint64_t)v7 + *(int *)(v4 + 48);
  *v7 = v12;
  v7[1] = v11;
  sub_1921C78F8((uint64_t)v13, v16);
  v17 = 0;
  if ((v15 & 1) == 0)
  {
    if (v12 != 0x656369767265735FLL || v11 != 0xEC000000656D614ELL)
    {
      v17 = sub_1921DBBBC() ^ 1;
      goto LABEL_13;
    }
LABEL_12:
    v17 = 0;
  }
LABEL_13:
  swift_bridgeObjectRetain_n();
  sub_1921C6C0C((uint64_t)v7, &qword_1ECFD7340);
  sub_1921C6C0C((uint64_t)v10, &qword_1ECFD7340);
  return v17 & 1;
}

uint64_t sub_1921CA960(unint64_t *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v40;
  uint64_t v41;
  unint64_t *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v42 = a1;
  v7 = type metadata accessor for EventValue();
  v45 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x1E0C80A78](v7);
  MEMORY[0x1E0C80A78](v8);
  v44 = (char *)&v40 - v10;
  if (!a3)
    return MEMORY[0x1E0DEE9E0];
  if (a4[2] == a3)
  {
    swift_retain();
    return (uint64_t)a4;
  }
  v43 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6EA0);
  result = sub_1921DBB8C();
  v12 = result;
  v41 = a2;
  if (a2 < 1)
    v13 = 0;
  else
    v13 = *v42;
  v14 = 0;
  v15 = result + 64;
  v16 = v43;
  v17 = (uint64_t)v44;
  while (1)
  {
    if (v13)
    {
      v18 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v46 = v14;
      v19 = v18 | (v14 << 6);
    }
    else
    {
      v20 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_40;
      if (v20 >= v41)
        return v12;
      v21 = v42[v20];
      v22 = v14 + 1;
      if (!v21)
      {
        v22 = v14 + 2;
        if (v14 + 2 >= v41)
          return v12;
        v21 = v42[v22];
        if (!v21)
        {
          v22 = v14 + 3;
          if (v14 + 3 >= v41)
            return v12;
          v21 = v42[v22];
          if (!v21)
          {
            v23 = v14 + 4;
            if (v14 + 4 >= v41)
              return v12;
            v21 = v42[v23];
            if (!v21)
            {
              while (1)
              {
                v22 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v22 >= v41)
                  return v12;
                v21 = v42[v22];
                ++v23;
                if (v21)
                  goto LABEL_24;
              }
            }
            v22 = v14 + 4;
          }
        }
      }
LABEL_24:
      v13 = (v21 - 1) & v21;
      v46 = v22;
      v19 = __clz(__rbit64(v21)) + (v22 << 6);
    }
    v24 = a4[7];
    v25 = a4;
    v26 = (uint64_t *)(a4[6] + 16 * v19);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v45 + 72);
    sub_1921C78F8(v24 + v29 * v19, v17);
    sub_1921C852C(v17, v16);
    sub_1921DBC64();
    swift_bridgeObjectRetain();
    sub_1921DB958();
    result = sub_1921DBC88();
    v30 = -1 << *(_BYTE *)(v12 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6))) == 0)
      break;
    v33 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    v16 = v43;
LABEL_34:
    *(_QWORD *)(v15 + ((v33 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v33;
    v38 = (_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v33);
    *v38 = v28;
    v38[1] = v27;
    result = sub_1921C852C(v16, *(_QWORD *)(v12 + 56) + v33 * v29);
    ++*(_QWORD *)(v12 + 16);
    if (__OFSUB__(a3--, 1))
      goto LABEL_39;
    a4 = v25;
    v14 = v46;
    if (!a3)
      return v12;
  }
  v34 = 0;
  v35 = (unint64_t)(63 - v30) >> 6;
  v16 = v43;
  while (++v32 != v35 || (v34 & 1) == 0)
  {
    v36 = v32 == v35;
    if (v32 == v35)
      v32 = 0;
    v34 |= v36;
    v37 = *(_QWORD *)(v15 + 8 * v32);
    if (v37 != -1)
    {
      v33 = __clz(__rbit64(~v37)) + (v32 << 6);
      goto LABEL_34;
    }
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

uint64_t sub_1921CAC9C(uint64_t result, uint64_t a2, _QWORD *a3)
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

uint64_t sub_1921CACB8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_1921CAD84(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1921C9084((uint64_t)v12, *a3);
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
      sub_1921C9084((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    OUTLINED_FUNCTION_18_0();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1921CAD84(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_1921D1920((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1921DBA9C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_1921D19E4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_1921DBB2C();
    if (!v8)
    {
      result = sub_1921DBB68();
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

void sub_1921CAED8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7348);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(a1 + OBJC_IVAR____RTCReportingS_terminated) & 1) == 0)
  {
    sub_1921CB1EC();
    v5 = *(_QWORD *)(a1 + OBJC_IVAR____RTCReportingS_session);
    if (v5)
    {
      swift_retain();
      sub_1921DB9C4();
      v6 = sub_1921DB9DC();
      __swift_storeEnumTagSinglePayload((uint64_t)v4, 0, 1, v6);
      v7 = (_QWORD *)swift_allocObject();
      v7[2] = 0;
      v7[3] = 0;
      v7[4] = v5;
      swift_retain();
      sub_1921D4E4C((uint64_t)v4, (uint64_t)&unk_1EE2517E8, (uint64_t)v7);
      swift_release();
      swift_release();
      sub_1921C6C0C((uint64_t)v4, &qword_1ECFD7348);
    }
  }
}

id _RTCReportingS.__deallocating_deinit()
{
  char *v0;
  objc_class *v1;
  os_unfair_lock_s *v2;
  objc_super v4;

  v1 = (objc_class *)OUTLINED_FUNCTION_66();
  v2 = *(os_unfair_lock_s **)&v0[OBJC_IVAR____RTCReportingS_lock];
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  sub_1921CAED8((uint64_t)v0);
  os_unfair_lock_unlock(v2 + 4);
  swift_release();
  v4.receiver = v0;
  v4.super_class = v1;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

void sub_1921CB0A4()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint64_t v3;

  if (__OFSUB__(qword_1ECFD7268, 1))
  {
    __break(1u);
  }
  else
  {
    --qword_1ECFD7268;
    if (qword_1ECFD73A0 == -1)
      goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v0 = sub_1921DB874();
  __swift_project_value_buffer(v0, (uint64_t)qword_1ECFD7368);
  v1 = sub_1921DB85C();
  v2 = sub_1921DBA24();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = swift_slowAlloc();
    *(_DWORD *)v3 = 134349312;
    sub_1921DBA90();
    *(_WORD *)(v3 + 12) = 2050;
    sub_1921DBA90();
    _os_log_impl(&dword_1921BE000, v1, v2, "active session count now %{public}ld/%{public}ld", (uint8_t *)v3, 0x16u);
    MEMORY[0x194024230](v3, -1, -1);
  }

}

void sub_1921CB1EC()
{
  os_unfair_lock_s *v0;

  if (qword_1ECFD72B8 != -1)
    swift_once();
  v0 = (os_unfair_lock_s *)(qword_1ECFD7328 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_1ECFD7328 + 16));
  sub_1921CB0A4();
  os_unfair_lock_unlock(v0);
}

void _RTCReportingS.init(sessionInfo:userInfo:frameworksToCheck:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)OUTLINED_FUNCTION_63_0();
  swift_bridgeObjectRelease();
  v6 = (void *)OUTLINED_FUNCTION_63_0();
  OUTLINED_FUNCTION_50_0();
  if (a3)
  {
    v7 = (void *)sub_1921DB988();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v3, sel_initWithSessionInfo_userInfo_frameworksToCheck_aggregationBlock_, v5, v6, v7, 0);

  OUTLINED_FUNCTION_42_1();
}

id _RTCReportingS.init(sessionInfo:userInfo:frameworksToCheck:aggregationBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BYTE *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v17;
  objc_class *ObjectType;
  objc_super v22;

  ObjectType = (objc_class *)swift_getObjectType();
  OUTLINED_FUNCTION_35_0();
  v5 = (uint64_t *)&v4[OBJC_IVAR____RTCReportingS_messageLoggingBlock];
  *v5 = 0;
  v5[1] = 0;
  v17 = (uint64_t)&v4[OBJC_IVAR____RTCReportingS_messageSentDelegate];
  swift_unknownObjectWeakInit();
  v6 = OBJC_IVAR____RTCReportingS_lock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7388);
  v7 = OUTLINED_FUNCTION_21_0();
  *(_DWORD *)(v7 + 16) = 0;
  *(_QWORD *)&v4[v6] = v7;
  *(_QWORD *)&v4[OBJC_IVAR____RTCReportingS_session] = 0;
  v4[OBJC_IVAR____RTCReportingS_configured] = 0;
  v8 = OBJC_IVAR____RTCReportingS_connectionManager;
  v9 = qword_1ECFD7358;
  v10 = v4;
  if (v9 != -1)
    swift_once();
  *(_QWORD *)&v4[v8] = qword_1ECFD7568;
  v11 = &v10[OBJC_IVAR____RTCReportingS_generatedSessionID];
  *v11 = 0;
  v11[1] = 0;
  v12 = OBJC_IVAR____RTCReportingS_deprecatedPeriodic;
  *(_QWORD *)&v10[OBJC_IVAR____RTCReportingS_deprecatedPeriodic] = 0;
  v13 = OBJC_IVAR____RTCReportingS_legacyAVCSupport;
  *(_QWORD *)&v10[OBJC_IVAR____RTCReportingS_legacyAVCSupport] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____RTCReportingS_earlyCachedEvents] = 0;
  v10[OBJC_IVAR____RTCReportingS_completelyDisabled] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____RTCReportingS_extraFields] = 0;
  v10[OBJC_IVAR____RTCReportingS_terminated] = 0;
  *(_QWORD *)&v10[OBJC_IVAR____RTCReportingS_sentEventCount] = 0;
  swift_retain();
  if ((sub_1921CC1A8() & 1) != 0)
  {
    *(_QWORD *)&v10[OBJC_IVAR____RTCReportingS_sessionInfo] = a1;
    v14 = MEMORY[0x1E0DEE9E0];
    if (a2)
      v14 = a2;
    *(_QWORD *)&v10[OBJC_IVAR____RTCReportingS_userInfo] = v14;

    v22.receiver = v10;
    v22.super_class = ObjectType;
    v15 = objc_msgSendSuper2(&v22, sel_init);
    sub_1921C1508(a4);
  }
  else
  {
    sub_1921C1508(a4);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1921C1508(*v5);
    sub_1921C07DC(v17);
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_35_0();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v15;
}

const char *MessageKeys.allowed.unsafeMutableAddressor()
{
  return "allowed";
}

const char *MessageKeys.denied.unsafeMutableAddressor()
{
  return "denied";
}

uint64_t sub_1921CB6AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  BOOL *v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  xpc_object_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  char v50;
  _OWORD *v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v63;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;

  v10 = (_QWORD *)v8;
  *(_QWORD *)(v9 + 448) = v8;
  sub_1921D1E64(a7, v9 + 224);
  v67 = *(_QWORD *)(v9 + 248);
  v57 = *(_QWORD *)(v9 + 288);
  v58 = *(_QWORD *)(v9 + 296);
  v59 = *(_QWORD *)(v9 + 304);
  v14 = *(_QWORD *)(v9 + 312);
  v15 = *(_BYTE *)(v9 + 320);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72F0);
  *(_QWORD *)(v9 + 456) = OUTLINED_FUNCTION_22_0();
  *(_QWORD *)(v9 + 464) = OUTLINED_FUNCTION_22_0();
  *(_QWORD *)(v9 + 472) = OUTLINED_FUNCTION_22_0();
  *(_QWORD *)(v9 + 480) = OUTLINED_FUNCTION_22_0();
  *(_QWORD *)(v9 + 488) = OUTLINED_FUNCTION_22_0();
  v66 = (_QWORD *)OUTLINED_FUNCTION_22_0();
  *(_QWORD *)(v9 + 496) = v66;
  v16 = OUTLINED_FUNCTION_64();
  *(_QWORD *)(v9 + 504) = v16;
  *(_QWORD *)(v9 + 512) = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v9 + 520) = OUTLINED_FUNCTION_60();
  swift_defaultActor_initialize();
  *(_QWORD *)(v8 + 176) = 0;
  *(_QWORD *)(v8 + 184) = 0;
  if (qword_1ECFD7358 != -1)
    swift_once();
  *(_QWORD *)(v8 + 192) = sub_1921CC240();
  *(_QWORD *)(v8 + 208) = 0;
  *(_QWORD *)(v8 + 216) = 0;
  *(_QWORD *)(v8 + 224) = 0;
  *(_QWORD *)(v8 + 232) = 1;
  *(_QWORD *)(v8 + 312) = 0;
  *(_OWORD *)(v8 + 240) = 0u;
  *(_OWORD *)(v8 + 256) = 0u;
  *(_OWORD *)(v8 + 272) = 0u;
  *(_OWORD *)(v8 + 288) = 0u;
  *(_BYTE *)(v8 + 304) = 0;
  *(_QWORD *)(v8 + 336) = 0;
  *(_QWORD *)(v8 + 344) = 0;
  *(_QWORD *)(v8 + 328) = 0;
  v17 = sub_1921CC1A8();
  *(_BYTE *)(v9 + 113) = v17 & 1;
  if ((v17 & 1) != 0)
  {
    v56 = v15;
    *(_QWORD *)(v8 + 112) = a3;
    *(_QWORD *)(v8 + 120) = a4;
    *(_QWORD *)(v8 + 128) = a5;
    *(_QWORD *)(v8 + 136) = a6;
    *(_QWORD *)(v8 + 144) = a1;
    *(_QWORD *)(v8 + 152) = a2;
    *(_BYTE *)(v8 + 200) = a8 & 1;
    sub_1921DB7FC();
    OUTLINED_FUNCTION_77(v8 + OBJC_IVAR____TtC12RTCReporting7Session_baseTime);
    getTimeIntervalSince1970(Date:)();
    sub_1921DB7E4();
    OUTLINED_FUNCTION_77(v8 + OBJC_IVAR____TtC12RTCReporting7Session_obfuscatedBaseTime);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72C8);
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7310);
    v19 = *(_QWORD *)(v18 - 8);
    v20 = *(_QWORD *)(v19 + 72);
    v21 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
    v63 = OUTLINED_FUNCTION_74();
    *(_OWORD *)(v63 + 16) = xmmword_1921DDD00;
    v22 = (_QWORD *)(v63 + v21);
    v23 = (_QWORD *)((char *)v22 + *(int *)(v18 + 48));
    v24 = MessageKeys.clientName.unsafeMutableAddressor();
    v25 = *((_QWORD *)v24 + 1);
    *v22 = *(_QWORD *)v24;
    v22[1] = v25;
    *v23 = a3;
    v23[1] = a4;
    v26 = OUTLINED_FUNCTION_63();
    *(_QWORD *)(v9 + 528) = v26;
    OUTLINED_FUNCTION_16_0();
    v27 = (_QWORD *)((char *)v22 + v20);
    v28 = (_QWORD *)((char *)v22 + v20 + *(int *)(v18 + 48));
    OUTLINED_FUNCTION_41();
    v29 = v26;
    swift_bridgeObjectRetain();
    v30 = MessageKeys.serviceName.unsafeMutableAddressor();
    v31 = v30[1];
    *v27 = *v30;
    v27[1] = v31;
    v32 = v10[17];
    *v28 = v10[16];
    v28[1] = v32;
    OUTLINED_FUNCTION_16_0();
    v33 = (_QWORD *)((char *)v22 + 2 * v20);
    v34 = (_QWORD *)((char *)v33 + *(int *)(v18 + 48));
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_53_0();
    v35 = MessageKeys.clientType.unsafeMutableAddressor();
    v36 = v35[1];
    *v33 = *v35;
    v33[1] = v36;
    v37 = v10[19];
    *v34 = v10[18];
    v34[1] = v37;
    OUTLINED_FUNCTION_16_0();
    v38 = (_QWORD *)((char *)v22 + 3 * v20);
    v39 = (BOOL *)v38 + *(int *)(v18 + 48);
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_53_0();
    v40 = MessageKeys.legacyClient.unsafeMutableAddressor();
    v41 = v40[1];
    *v38 = *v40;
    v38[1] = v41;
    *v39 = v67 != 1;
    OUTLINED_FUNCTION_30_0();
    v42 = (_QWORD *)((char *)v22 + 4 * v20);
    OUTLINED_FUNCTION_41();
    v43 = MessageKeys.realtime.unsafeMutableAddressor();
    v44 = v43[1];
    *v42 = *v43;
    v42[1] = v44;
    sub_1921D1E64(a7, v9 + 16);
    *((_BYTE *)v42 + *(int *)(v18 + 48)) = (*(_QWORD *)(v9 + 40) != 1) & *(_BYTE *)(v9 + 96);
    OUTLINED_FUNCTION_30_0();
    OUTLINED_FUNCTION_18_0();
    v45 = RTCXPCDictionary.init(dictionaryLiteral:)(v63);
    *(_QWORD *)(v9 + 536) = v45;
    *(_QWORD *)(v9 + 424) = v45;
    sub_1921D1E64(a7, v9 + 120);
    v46 = *(_QWORD *)(v9 + 144);
    if (v46)
    {
      if (v46 == 1)
      {
LABEL_13:
        *(_QWORD *)(v9 + 544) = v10[24];
        OUTLINED_FUNCTION_70();
        swift_unknownObjectRetain();
        *(_QWORD *)(v9 + 552) = XPCMessage.init(ty:payload:)(0, v45);
        v48 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v9 + 560) = v48;
        v49 = OUTLINED_FUNCTION_20_0(v48, (uint64_t)sub_1921C2800);
        return XPCConnection.sendWithReply(_:)(v49, v50);
      }
      v47 = *(_QWORD *)(v9 + 136);
      v65 = *(_QWORD *)(v9 + 128);
      OUTLINED_FUNCTION_18_0();
      MessageKeys.hierarchyToken.unsafeMutableAddressor();
      *v66 = v47;
      v66[1] = v46;
      OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_0_1((uint64_t)v66);
      OUTLINED_FUNCTION_41();
      RTCXPCDictionary.subscript.setter((uint64_t)v66);
      MessageKeys.hierarchyLevel.unsafeMutableAddressor();
      OUTLINED_FUNCTION_41();
      swift_bridgeObjectRelease();
      *v66 = v65;
      swift_storeEnumTagMultiPayload();
      __swift_storeEnumTagSinglePayload((uint64_t)v66, 0, 1, v29);
      RTCXPCDictionary.subscript.setter((uint64_t)v66);
    }
    OUTLINED_FUNCTION_41();
    sub_1921CC14C(a7, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1921CC3A0);
    OUTLINED_FUNCTION_50_0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v58)
    {
      MessageKeys.samplingUUID.unsafeMutableAddressor();
      *v66 = v57;
      v66[1] = v58;
      OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_0_1((uint64_t)v66);
      OUTLINED_FUNCTION_10_1();
    }
    if ((v59 & 0x100) != 0)
    {
      MessageKeys.eager.unsafeMutableAddressor();
      *(_BYTE *)v66 = 1;
      OUTLINED_FUNCTION_30_0();
      OUTLINED_FUNCTION_0_1((uint64_t)v66);
      OUTLINED_FUNCTION_10_1();
    }
    sub_1921CC14C(a7, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1921CC1EC);
    if ((v56 & 1) == 0)
    {
      MessageKeys.overrideSampling.unsafeMutableAddressor();
      *v66 = v14;
      swift_storeEnumTagMultiPayload();
      OUTLINED_FUNCTION_0_1((uint64_t)v66);
      OUTLINED_FUNCTION_10_1();
    }
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_50_0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1921CC14C(a7, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1921CC1EC);
  sub_1921D1EAC();
  OUTLINED_FUNCTION_33_0();
  *v52 = xmmword_1921DDCF0;
  swift_willThrow();
  v53 = *(unsigned __int8 *)(v9 + 113);
  v54 = *(_QWORD *)(v9 + 448);
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_4_1();
  swift_release();
  sub_1921C1508(*(_QWORD *)(v54 + 328));
  if (v53 == 1)
  {
    v55 = *(_QWORD *)(v9 + 448);
    OUTLINED_FUNCTION_45_0(v55 + OBJC_IVAR____TtC12RTCReporting7Session_baseTime);
    OUTLINED_FUNCTION_45_0(v55 + OBJC_IVAR____TtC12RTCReporting7Session_obfuscatedBaseTime);
  }
  OUTLINED_FUNCTION_62();
  swift_defaultActor_destroy();
  OUTLINED_FUNCTION_57();
  swift_deallocPartialClassInstance();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_43_0();
  OUTLINED_FUNCTION_59();
  return (*(uint64_t (**)(void))(v9 + 8))();
}

void *XPCMessage.init(ty:payload:)(unsigned __int8 a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  xpc_object_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72F0);
  OUTLINED_FUNCTION_3_0();
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v15 - v8;
  swift_unknownObjectRetain();
  v10 = xpc_int64_create(a1);
  XPCObject.init(_:)(v10, (uint64_t)v9);
  sub_1921CBEC0((uint64_t)v9, (uint64_t)v7);
  v11 = OUTLINED_FUNCTION_63();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v11) == 1)
  {
    sub_1921CBE80((uint64_t)v7);
    v12 = 0;
  }
  else
  {
    XPCObject.obj.getter();
    v12 = v13;
    sub_1921C7B34((uint64_t)v7);
  }
  xpc_dictionary_set_value(a2, "type", v12);
  swift_unknownObjectRelease();
  sub_1921CBE80((uint64_t)v9);
  swift_unknownObjectRelease();
  return a2;
}

uint64_t sub_1921CBE80(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1921CBEC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1921CBF08(uint64_t a1)
{
  uint64_t v1;

  return sub_1921CBF18(a1, *(_xpc_connection_s **)(v1 + 16), *(void **)(v1 + 24), *(unsigned __int8 *)(v1 + 32), *(NSObject **)(v1 + 40));
}

uint64_t sub_1921CBF18(uint64_t a1, _xpc_connection_s *a2, void *a3, uint64_t a4, NSObject *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD aBlock[6];

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7298);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)aBlock - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  aBlock[4] = sub_1921C190C;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1921C18C4;
  aBlock[3] = &block_descriptor_8;
  v14 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  swift_release();
  xpc_connection_send_message_with_reply(a2, a3, a5, v14);
  _Block_release(v14);
  return swift_unknownObjectRelease();
}

uint64_t sub_1921CC06C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = *(_BYTE *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(_QWORD *)(v2 + 40);
  v6 = swift_task_alloc();
  *(_QWORD *)(v0 + 40) = v6;
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v6 + 24) = v3;
  *(_BYTE *)(v6 + 32) = v1;
  *(_QWORD *)(v6 + 40) = v5;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v7;
  *v7 = v0;
  v7[1] = sub_1921C1518;
  return sub_1921DBBC8();
}

uint64_t XPCConnection.sendWithReply(_:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 64) = a2;
  *(_QWORD *)(v3 + 24) = a1;
  *(_QWORD *)(v3 + 32) = v2;
  return swift_task_switch();
}

uint64_t sub_1921CC14C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 96);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), v4);
  return a1;
}

uint64_t sub_1921CC1A8()
{
  uint64_t v0;
  int v1;
  char v2;

  v1 = *(unsigned __int8 *)(v0 + 40);
  if (v1 == 2)
  {
    v2 = sub_1921D2F2C();
    *(_BYTE *)(v0 + 40) = v2 & 1;
  }
  else
  {
    v2 = v1 & 1;
  }
  return v2 & 1;
}

uint64_t sub_1921CC1EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1921CC240()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(os_unfair_lock_s **)(v0 + 32);
  swift_retain();
  sub_1921D34C4((_QWORD *(*)(uint64_t *__return_ptr))sub_1921CC29C, v0, v1);
  v3 = v2;
  swift_release();
  return v3;
}

uint64_t sub_1921CC29C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1921CC2B4(v1, a1);
}

uint64_t sub_1921CC2B4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  void *v5;
  uint64_t v6;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    goto LABEL_4;
  v5 = *(void **)(a1 + 16);
  type metadata accessor for XPCConnection();
  swift_allocObject();
  *(_QWORD *)(a1 + 24) = XPCConnection.init(machService:targetQ:listen:delegate:)(0xD000000000000017, 0x80000001921DD3F0, v5, 0, 0, 0);
  result = swift_release();
  v6 = *(_QWORD *)(a1 + 24);
  if (!v6)
    goto LABEL_5;
  swift_beginAccess();
  *(_QWORD *)(v6 + 32) = &off_1E2EB2650;
  swift_unknownObjectWeakAssign();
  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
LABEL_4:
    *a2 = result;
    return swift_retain();
  }
  else
  {
LABEL_5:
    __break(1u);
  }
  return result;
}

uint64_t sub_1921CC3A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4 != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

void *MessageKeys.legacyClient.unsafeMutableAddressor()
{
  return &static MessageKeys.legacyClient;
}

void *MessageKeys.serviceName.unsafeMutableAddressor()
{
  return &static MessageKeys.serviceName;
}

void *MessageKeys.clientType.unsafeMutableAddressor()
{
  return &static MessageKeys.clientType;
}

const char *MessageKeys.clientName.unsafeMutableAddressor()
{
  return "cn";
}

uint64_t destroy for Event()
{
  return swift_bridgeObjectRelease();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
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

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x194024194](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

void *RTCReportingStartConfiguration(void *result, uint64_t a2)
{
  _QWORD v2[5];

  if (result)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __RTCReportingStartConfiguration_block_invoke;
    v2[3] = &unk_1E2EB2CE0;
    v2[4] = a2;
    return (void *)objc_msgSend(result, "startConfigurationWithCompletionHandler:", v2);
  }
  return result;
}

void *RTCReportingSetMessageBlock(void *result, uint64_t a2)
{
  _QWORD v2[5];

  if (result)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __RTCReportingSetMessageBlock_block_invoke;
    v2[3] = &unk_1E2EB2D08;
    v2[4] = a2;
    return (void *)objc_msgSend(result, "setMessageLoggingBlock:", v2);
  }
  return result;
}

void sub_1921CC5D4(uint64_t a1)
{
  uint64_t v1;

  sub_1921CC5DC(a1, *(_QWORD *)(v1 + 16));
}

void sub_1921CC5DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_1921DB988();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

Swift::Void __swiftcall changeSessionLimit(newLimit:)(Swift::Int newLimit)
{
  type metadata accessor for _RTCReportingS();
  sub_1921C0008(newLimit);
  OUTLINED_FUNCTION_38();
}

uint64_t type metadata accessor for _RTCReportingS()
{
  return objc_opt_self();
}

uint64_t _RTCReportingS.messageLoggingBlock.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____RTCReportingS_messageLoggingBlock);
  OUTLINED_FUNCTION_24_1();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_1921C1508(v6);
}

const char *MessageKeys.hierarchyToken.unsafeMutableAddressor()
{
  return "hktn";
}

const char *MessageKeys.hierarchyLevel.unsafeMutableAddressor()
{
  return "hlvl";
}

void sub_1921CD0CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 216), 8);
  _Unwind_Resume(a1);
}

void __createAWDAdaptorInstance_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB34D0]), "initWithPath:", CFSTR("/System/Library/PrivateFrameworks/AVConference.framework/Frameworks/GKSPerformance.framework"));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1921BE000, v4, OS_LOG_TYPE_DEFAULT, "loading AWDAdaptor bundle", v6, 2u);
    }
    if ((objc_msgSend(v3, "isLoaded") & 1) == 0)
      objc_msgSend(v3, "load");
    createAWDAdaptorInstance_awdAdaptorClass = objc_msgSend(v3, "classNamed:", CFSTR("AWDAdaptor"));

  }
  else
  {
    createAWDAdaptorInstance_awdAdaptorClass = 0;
    v5 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __createAWDAdaptorInstance_block_invoke_cold_1(v5);
  }
}

RTCReporting *RTCReportingInitWithSessionInfo(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return -[RTCReporting initWithSessionInfo:userInfo:frameworksToCheck:aggregationBlock:]([RTCReporting alloc], "initWithSessionInfo:userInfo:frameworksToCheck:aggregationBlock:", a1, a2, a3, 0);
}

void *RTCReportingFetchStatesWithUserInfo(void *result, uint64_t a2, uint64_t a3)
{
  _QWORD v3[5];

  if (result)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __RTCReportingFetchStatesWithUserInfo_block_invoke;
    v3[3] = &unk_1E2EB2CE0;
    v3[4] = a3;
    return (void *)objc_msgSend(result, "fetchReportingStatesWithUserInfo:fetchComplete:", a2, v3);
  }
  return result;
}

id RTCReportingCreateHierarchyTokenFromParentToken(uint64_t a1)
{
  return +[RTCReporting newSecureHierarchyTokenFromParentToken:](RTCReporting, "newSecureHierarchyTokenFromParentToken:", a1);
}

void *RTCReportingUpdateSharedDataWithDictionary(void *a1, const char *a2)
{
  if (a1)
    return (void *)objc_msgSend(a1, "updateSharedDataWithDictionary:", a2);
  return a1;
}

void *RTCReportingUpdateSharedDataForKey(void *a1, const char *a2, uint64_t a3)
{
  if (a1)
    return (void *)objc_msgSend(a1, "updateSharedDataForKey:value:", a2, a3);
  return a1;
}

uint64_t RTCReportingSendMessageWithDictionary(void *a1, uint64_t a2, CFErrorRef *a3)
{
  void *v6;
  uint64_t v7;
  const __CFAllocator *v8;
  CFIndex v9;
  id v11;

  if (!a1)
    return 0;
  v6 = (void *)MEMORY[0x194023DEC]();
  v11 = 0;
  v7 = objc_msgSend(a1, "sendMessageWithDictionary:error:", a2, &v11);
  if (a3)
  {
    *a3 = 0;
    if (v11)
    {
      v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v9 = objc_msgSend(v11, "code");
      *a3 = CFErrorCreate(v8, CFSTR("RTCReportingErrorDomain"), v9, (CFDictionaryRef)objc_msgSend(v11, "userInfo"));
    }
  }
  objc_autoreleasePoolPop(v6);
  return v7;
}

uint64_t RTCReportingSendOneMessageWithDictionary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, CFErrorRef *a6)
{
  void *v12;
  uint64_t v13;
  const __CFAllocator *v14;
  CFIndex v15;
  id v17;

  v12 = (void *)MEMORY[0x194023DEC]();
  v17 = 0;
  v13 = +[RTCReporting sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:](RTCReporting, "sendOneMessageWithSessionInfo:userInfo:category:type:payload:error:", a1, a2, a3, a4, a5, &v17);
  if (a6)
  {
    *a6 = 0;
    if (v17)
    {
      v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v15 = objc_msgSend(v17, "code");
      *a6 = CFErrorCreate(v14, CFSTR("RTCReportingErrorDomain"), v15, (CFDictionaryRef)objc_msgSend(v17, "userInfo"));
    }
  }
  objc_autoreleasePoolPop(v12);
  return v13;
}

uint64_t RTCReportingCreateEphemeralSessionWithSessionInfo(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  void *v6;
  uint64_t v7;
  const __CFAllocator *v8;
  CFIndex v9;
  id v11;

  v6 = (void *)MEMORY[0x194023DEC]();
  v11 = 0;
  v7 = objc_msgSend((id)+[RTCReporting createEphemeralSessionWithSessionInfo:userInfo:error:](RTCReporting, "createEphemeralSessionWithSessionInfo:userInfo:error:", a1, a2, &v11), "copy");
  if (a3)
  {
    *a3 = 0;
    if (v11)
    {
      v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v9 = objc_msgSend(v11, "code");
      *a3 = CFErrorCreate(v8, CFSTR("RTCReportingErrorDomain"), v9, (CFDictionaryRef)objc_msgSend(v11, "userInfo"));
    }
  }
  objc_autoreleasePoolPop(v6);
  return v7;
}

uint64_t RTCReportingCloseEphemeralSessionWithSessionId(uint64_t a1)
{
  return +[RTCReporting closeEphemeralSessiontWithSessionId:](RTCReporting, "closeEphemeralSessiontWithSessionId:", a1);
}

void *RTCReportingFlushMessages(void *a1, const char *a2)
{
  if (a1)
    return (void *)objc_msgSend(a1, "flushMessages");
  return a1;
}

void *RTCReportingFlushMessagesWithCompletion(void *result, uint64_t a2)
{
  _QWORD v2[5];

  if (result)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __RTCReportingFlushMessagesWithCompletion_block_invoke;
    v2[3] = &unk_1E2EB2D30;
    v2[4] = a2;
    return (void *)objc_msgSend(result, "flushMessagesWithCompletion:", v2);
  }
  return result;
}

void *RTCReportingUploadLogWithArray(void *a1, const char *a2)
{
  if (a1)
    return (void *)objc_msgSend(a1, "uploadDataArray:completionHandler:", a2, 0);
  return a1;
}

uint64_t EventValue.init(integerLiteral:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1921CE4A4(a1, a2);
}

uint64_t EventValue.init(floatLiteral:)@<X0>(double *a1@<X8>, double a2@<D0>)
{
  *a1 = a2;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_40();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t EventValue.init(arrayLiteral:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1921CE4A4(a1, a2);
}

uint64_t sub_1921CE4A4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_39();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t EventValue.init(dictionaryLiteral:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = sub_1921CE4FC(a1);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_40();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1921CE4FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6EA0);
    v1 = sub_1921DBB8C();
  }
  else
  {
    v1 = MEMORY[0x1E0DEE9E0];
  }
  v4 = v1;
  v2 = swift_bridgeObjectRetain();
  sub_1921CF6C8(v2, 1, &v4);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t _s12RTCReporting10EventValueO13stringLiteralACSS_tcfC_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_40();
  return OUTLINED_FUNCTION_0_0();
}

void EventValue.init<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
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
  void (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  int64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  int64_t v63;

  OUTLINED_FUNCTION_20();
  v1 = v0;
  v3 = v2;
  v61 = v4;
  v55 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 8) + 24) + 16);
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_49();
  v7 = MEMORY[0x1E0C80A78](v6);
  v54 = (char *)&v52 - v8;
  v9 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_33();
  v53 = v10 - v11;
  OUTLINED_FUNCTION_32();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_48();
  v56 = v13;
  OUTLINED_FUNCTION_32();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_48();
  v59 = v15;
  OUTLINED_FUNCTION_32();
  v17 = MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v52 - v18;
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_48();
  v58 = v20;
  OUTLINED_FUNCTION_32();
  v22 = MEMORY[0x1E0C80A78](v21);
  v24 = (char *)&v52 - v23;
  v25 = MEMORY[0x1E0C80A78](v22);
  v27 = (char *)&v52 - v26;
  MEMORY[0x1E0C80A78](v25);
  v29 = (char *)&v52 - v28;
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v60 = v3;
  v30((char *)&v52 - v28, v3, v1);
  LOBYTE(v3) = OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_11((uint64_t)v27);
  v57 = v9;
  if ((v3 & 1) == 0)
  {
    v32 = (uint64_t)v27;
    goto LABEL_7;
  }
  v31 = OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0((uint64_t)v27);
  if (v31 <= 64)
    goto LABEL_8;
  OUTLINED_FUNCTION_11((uint64_t)v24);
  v63 = 0x8000000000000000;
  if ((OUTLINED_FUNCTION_2_1() & 1) != 0)
  {
    if (OUTLINED_FUNCTION_5_0() < 64)
    {
LABEL_26:
      v47 = OUTLINED_FUNCTION_7_0();
      OUTLINED_FUNCTION_4_0((uint64_t)v24);
      if (v47 < v63)
        goto LABEL_33;
      goto LABEL_8;
    }
LABEL_22:
    sub_1921CEA74();
    v45 = v58;
    OUTLINED_FUNCTION_8();
    v46 = OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_4_0(v45);
    OUTLINED_FUNCTION_4_0((uint64_t)v24);
    if ((v46 & 1) != 0)
      goto LABEL_33;
LABEL_8:
    v33 = OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_11((uint64_t)v19);
    if (v33 < 65)
    {
      v34 = OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_4_0((uint64_t)v19);
      if (v34 != 64 || (OUTLINED_FUNCTION_2_1() & 1) != 0)
        goto LABEL_19;
    }
    else
    {
      OUTLINED_FUNCTION_4_0((uint64_t)v19);
    }
    v35 = v59;
    OUTLINED_FUNCTION_11(v59);
    v63 = 0x7FFFFFFFFFFFFFFFLL;
    v36 = OUTLINED_FUNCTION_2_1();
    v37 = OUTLINED_FUNCTION_5_0();
    if ((v36 & 1) != 0)
    {
      if (v37 > 64)
      {
        sub_1921CEA74();
        v38 = v58;
        OUTLINED_FUNCTION_8();
        v39 = OUTLINED_FUNCTION_28();
        OUTLINED_FUNCTION_4_0(v38);
        v40 = v35;
LABEL_18:
        OUTLINED_FUNCTION_4_0(v40);
        if ((v39 & 1) == 0)
          goto LABEL_19;
        __break(1u);
        goto LABEL_32;
      }
    }
    else if (v37 > 63)
    {
      v62 = 0x7FFFFFFFFFFFFFFFLL;
      v41 = v58;
      OUTLINED_FUNCTION_50(v58, v35, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v57 + 32));
      sub_1921CEA74();
      v35 = v56;
      OUTLINED_FUNCTION_8();
      v39 = OUTLINED_FUNCTION_28();
      OUTLINED_FUNCTION_4_0(v35);
      v40 = v41;
      goto LABEL_18;
    }
    OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_4_0(v35);
LABEL_19:
    v42 = OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_4_0((uint64_t)v29);
    OUTLINED_FUNCTION_4_0(v60);
    *v61 = v42;
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_39();
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_6_0();
    return;
  }
  v43 = OUTLINED_FUNCTION_2_1();
  v44 = OUTLINED_FUNCTION_5_0();
  if ((v43 & 1) == 0)
  {
    if (v44 < 64)
      goto LABEL_26;
    v32 = (uint64_t)v24;
LABEL_7:
    OUTLINED_FUNCTION_4_0(v32);
    goto LABEL_8;
  }
  if (v44 > 64)
    goto LABEL_22;
  swift_getAssociatedConformanceWitness();
  sub_1921DBBD4();
  v48 = v58;
  sub_1921DBBA4();
  v49 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_4_0(v48);
  v35 = v53;
  OUTLINED_FUNCTION_50(v53, (uint64_t)v24, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v57 + 32));
  if ((v49 & 1) == 0)
  {
    v50 = v63;
    v51 = OUTLINED_FUNCTION_7_0();
    OUTLINED_FUNCTION_4_0(v35);
    if (v51 < v50)
      goto LABEL_33;
    goto LABEL_8;
  }
LABEL_32:
  OUTLINED_FUNCTION_4_0(v35);
LABEL_33:
  __break(1u);
}

{
  char v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char *v4;
  uint64_t *v5;
  uint64_t *v6;
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
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t AssociatedTypeWitness;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;

  OUTLINED_FUNCTION_20();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = *(_QWORD *)(v7 + 8);
  v39 = *(_QWORD *)(*(_QWORD *)(v8 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_49();
  v10 = MEMORY[0x1E0C80A78](v9);
  v38 = (char *)&v34 - v11;
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_33();
  v14 = v12 - v13;
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_48();
  v40 = v16;
  OUTLINED_FUNCTION_32();
  v18 = MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v34 - v19;
  MEMORY[0x1E0C80A78](v18);
  v22 = (char *)&v34 - v21;
  v41 = v4;
  v42 = v23;
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
  v24((char *)&v34 - v21, (uint64_t)v4, v2);
  if ((OUTLINED_FUNCTION_2_1() & 1) != 0)
  {
    v0 = v8;
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_30();
    v24 = (void (*)(char *, uint64_t, uint64_t))v8;
    sub_1921DBBA4();
    v25 = sub_1921DB91C();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v20, v2);
    if ((v25 & 1) == 0)
      goto LABEL_16;
  }
  if (OUTLINED_FUNCTION_5_0() < 64)
  {
LABEL_15:
    v32 = OUTLINED_FUNCTION_7_0();
    v33 = *(void (**)(char *, uint64_t))(v42 + 8);
    v33(v22, v2);
    v33(v41, v2);
    *v6 = v32;
    OUTLINED_FUNCTION_1_0();
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_6_0();
    return;
  }
  v35 = v14;
  v36 = v6;
  v24((char *)v40, (uint64_t)v22, v2);
  v43 = -1;
  v26 = OUTLINED_FUNCTION_2_1();
  v27 = OUTLINED_FUNCTION_5_0();
  if ((v26 & 1) == 0)
  {
    if (v27 < 65)
    {
      v28 = v40;
      OUTLINED_FUNCTION_7_0();
      v6 = v36;
      goto LABEL_14;
    }
LABEL_10:
    sub_1921CEE70();
    OUTLINED_FUNCTION_8();
    v28 = v40;
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_18();
    v6 = v36;
    if ((v0 & 1) != 0)
      goto LABEL_16;
    goto LABEL_14;
  }
  if (v27 > 64)
    goto LABEL_10;
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_30();
  sub_1921DBBA4();
  v28 = v40;
  sub_1921DB904();
  OUTLINED_FUNCTION_18();
  v29 = v43;
  v30 = v35;
  ((void (*)(uint64_t, uint64_t, uint64_t))v8)(v35, v28, v2);
  v6 = v36;
  if ((v0 & 1) == 0)
  {
    OUTLINED_FUNCTION_22(v30);
    goto LABEL_14;
  }
  v31 = sub_1921DBAB4();
  OUTLINED_FUNCTION_22(v30);
  if (v29 >= v31)
  {
LABEL_14:
    OUTLINED_FUNCTION_22(v28);
    goto LABEL_15;
  }
LABEL_16:
  OUTLINED_FUNCTION_45();
  sub_1921DBB68();
  __break(1u);
}

{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t v10;

  OUTLINED_FUNCTION_35();
  v2 = v1;
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_50(v7 - v6, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
  sub_1921CEF5C();
  sub_1921DB8A4();
  v8 = OUTLINED_FUNCTION_42();
  v9(v8);
  *v2 = v10;
  OUTLINED_FUNCTION_1_0();
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_13();
}

unint64_t sub_1921CEA74()
{
  unint64_t result;

  result = qword_1EE2515A0;
  if (!qword_1EE2515A0)
  {
    result = MEMORY[0x1940241A0](MEMORY[0x1E0DEDCA0], MEMORY[0x1E0DEDC60]);
    atomic_store(result, (unint64_t *)&qword_1EE2515A0);
  }
  return result;
}

unint64_t sub_1921CEE70()
{
  unint64_t result;

  result = qword_1EE2515A8;
  if (!qword_1EE2515A8)
  {
    result = MEMORY[0x1940241A0](MEMORY[0x1E0DEE1C8], MEMORY[0x1E0DEE190]);
    atomic_store(result, (unint64_t *)&qword_1EE2515A8);
  }
  return result;
}

unint64_t sub_1921CEF5C()
{
  unint64_t result;

  result = qword_1EE2515B0;
  if (!qword_1EE2515B0)
  {
    result = MEMORY[0x1940241A0](MEMORY[0x1E0DEB078], MEMORY[0x1E0DEB070]);
    atomic_store(result, (unint64_t *)&qword_1EE2515B0);
  }
  return result;
}

uint64_t _s12RTCReporting10EventValueO14BOOLeanLiteralACSb_tcfC_0@<X0>(char a1@<W0>, _BYTE *a2@<X8>)
{
  *a2 = a1;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_40();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t EventValue.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_1921DB850();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_39();
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1921CF00C@<X0>(double *a1@<X0>, double *a2@<X8>)
{
  return EventValue.init(floatLiteral:)(a2, *a1);
}

uint64_t sub_1921CF014(_QWORD *a1)
{
  return EventValue.init(stringLiteral:)(*a1, a1[1]);
}

uint64_t sub_1921CF020(unsigned __int8 *a1)
{
  return EventValue.init(BOOLeanLiteral:)(*a1);
}

uint64_t sub_1921CF028@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return EventValue.init(integerLiteral:)(*a1, a2);
}

void sub_1921CF038()
{
  OUTLINED_FUNCTION_47_0(&qword_1ECFD7238);
}

uint64_t static Event.Keys.category.getter()
{
  return sub_1921CF0B0(&qword_1ECFD7248, &qword_1ECFD7238);
}

void sub_1921CF074()
{
  OUTLINED_FUNCTION_47_0(&qword_1ECFD7258);
}

uint64_t static Event.Keys.type.getter()
{
  return sub_1921CF0B0(&qword_1ECFD7250, &qword_1ECFD7258);
}

uint64_t sub_1921CF0B0(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t Event.dict.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Event.isRealtime.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 8);
}

uint64_t Event.isRealtime.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 8) = result;
  return result;
}

uint64_t (*Event.isRealtime.modify())()
{
  return nullsub_1;
}

uint64_t Event.type.getter()
{
  return OUTLINED_FUNCTION_23_0();
}

uint64_t Event.init(dictionaryLiteral:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  result = sub_1921CE4FC(a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

RTCReporting::Event __swiftcall Event.init(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;
  RTCReporting::Event result;

  *(Swift::OpaquePointer *)v1 = a1;
  *(_BYTE *)(v1 + 8) = 0;
  result.dict = a1;
  return result;
}

RTCReporting::Event __swiftcall Event.init(category:type:)(Swift::UInt64 category, Swift::UInt64 type)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::UInt64 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  Swift::Bool v15;
  uint64_t v16;
  RTCReporting::Event result;

  v5 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72B0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_25_0();
  MEMORY[0x1E0C80A78](v7);
  v9 = (Swift::UInt64 *)((char *)&v16 - v8);
  *(_BYTE *)(v5 + 8) = 0;
  OUTLINED_FUNCTION_1_0();
  *(_QWORD *)v5 = sub_1921DB8F8();
  if (qword_1ECFD7248 != -1)
    swift_once();
  *v9 = category;
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_12_0((uint64_t)v9, 0);
  v10 = OUTLINED_FUNCTION_37();
  sub_1921D02E8(v10, v11, &qword_1ECFD72B0);
  swift_bridgeObjectRetain();
  sub_1921C6CBC();
  OUTLINED_FUNCTION_44((uint64_t)v9);
  if (qword_1ECFD7250 != -1)
    swift_once();
  *v9 = type;
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_12_0((uint64_t)v9, 0);
  v12 = OUTLINED_FUNCTION_37();
  sub_1921D02E8(v12, v13, &qword_1ECFD72B0);
  swift_bridgeObjectRetain();
  sub_1921C6CBC();
  OUTLINED_FUNCTION_46((uint64_t)v9);
  result.dict._rawValue = v14;
  result.isRealtime = v15;
  return result;
}

void Event.subscript.setter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_35();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72B0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v2);
  v3 = OUTLINED_FUNCTION_27();
  sub_1921D02E8(v3, v1, &qword_1ECFD72B0);
  sub_1921C6CBC();
  sub_1921C3940(v0, &qword_1ECFD72B0);
  OUTLINED_FUNCTION_13();
}

uint64_t Event.subscript.getter()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_QWORD *)(*(_QWORD *)v0 + 16))
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_43();
    if ((v1 & 1) != 0)
    {
      v2 = OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_15(v2);
      v3 = OUTLINED_FUNCTION_52();
    }
    else
    {
      OUTLINED_FUNCTION_1_0();
      v3 = OUTLINED_FUNCTION_9();
    }
    __swift_storeEnumTagSinglePayload(v3, v4, v5, v6);
    return swift_bridgeObjectRelease();
  }
  else
  {
    OUTLINED_FUNCTION_1_0();
    v7 = OUTLINED_FUNCTION_9();
    return __swift_storeEnumTagSinglePayload(v7, v8, v9, v10);
  }
}

uint64_t sub_1921CF420()
{
  swift_bridgeObjectRetain();
  Event.subscript.getter();
  return swift_bridgeObjectRelease();
}

void sub_1921CF488(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72B0);
  MEMORY[0x1E0C80A78](v2);
  sub_1921D02E8(a1, (uint64_t)&v4 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1ECFD72B0);
  swift_bridgeObjectRetain();
  Event.subscript.setter();
}

void (*Event.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
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

  v7 = malloc(0x30uLL);
  *a1 = v7;
  v7[1] = a3;
  v7[2] = v3;
  *v7 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72B0);
  v7[3] = OUTLINED_FUNCTION_53();
  v7[4] = OUTLINED_FUNCTION_53();
  v7[5] = OUTLINED_FUNCTION_53();
  if (*(_QWORD *)(*(_QWORD *)v3 + 16))
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_43();
    if ((v8 & 1) != 0)
    {
      v9 = OUTLINED_FUNCTION_1_0();
      OUTLINED_FUNCTION_15(v9);
      v10 = OUTLINED_FUNCTION_52();
    }
    else
    {
      OUTLINED_FUNCTION_1_0();
      v10 = OUTLINED_FUNCTION_9();
    }
    __swift_storeEnumTagSinglePayload(v10, v11, v12, v13);
    OUTLINED_FUNCTION_24();
  }
  else
  {
    OUTLINED_FUNCTION_1_0();
    v14 = OUTLINED_FUNCTION_9();
    __swift_storeEnumTagSinglePayload(v14, v15, v16, v17);
  }
  return sub_1921CF604;
}

void sub_1921CF604(uint64_t a1, char a2)
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD **)a1;
  sub_1921D02E8(*(_QWORD *)(*(_QWORD *)a1 + 40), *(_QWORD *)(*(_QWORD *)a1 + 32), &qword_1ECFD72B0);
  v4 = (void *)v3[4];
  v5 = (void *)v3[5];
  v6 = (void *)v3[3];
  if ((a2 & 1) != 0)
  {
    v7 = OUTLINED_FUNCTION_42();
    sub_1921D02E8(v7, v8, &qword_1ECFD72B0);
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_51();
    sub_1921C3940((uint64_t)v4, &qword_1ECFD72B0);
  }
  else
  {
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_51();
  }
  sub_1921C3940((uint64_t)v5, &qword_1ECFD72B0);
  free(v5);
  free(v4);
  free(v6);
  free(v3);
}

void sub_1921CF6C8(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  char v20;
  unint64_t v21;
  uint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  char v25;
  unint64_t v26;
  char v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  void *v33;
  id v34;
  _QWORD v35[3];
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;

  v40 = a3;
  v6 = type metadata accessor for EventValue();
  v39 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6E90);
  v10 = MEMORY[0x1E0C80A78](v9);
  v13 = (_QWORD *)((char *)v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = *(_QWORD *)(a1 + 16);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v35[1] = v3;
  v35[2] = a1;
  v38 = (uint64_t)v13 + *(int *)(v10 + 48);
  v15 = a1 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  v36 = *(_QWORD *)(v11 + 72);
  swift_bridgeObjectRetain();
  v37 = v13;
  while (1)
  {
    sub_1921D02E8(v15, (uint64_t)v13, &qword_1ECFD6E90);
    v16 = *v13;
    v17 = v13[1];
    v43 = *v13;
    v44 = v17;
    v18 = (uint64_t)v8;
    sub_1921C852C(v38, (uint64_t)v8);
    v19 = (_QWORD *)*v40;
    v21 = sub_1921C85A8();
    v22 = v19[2];
    v23 = (v20 & 1) == 0;
    v24 = v22 + v23;
    if (__OFADD__(v22, v23))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_1921DBBF8();
      __break(1u);
      goto LABEL_20;
    }
    v25 = v20;
    if (v19[3] < v24)
      break;
    if ((a2 & 1) != 0)
    {
      if ((v20 & 1) != 0)
        goto LABEL_14;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7350);
      sub_1921DBB50();
      if ((v25 & 1) != 0)
        goto LABEL_14;
    }
LABEL_10:
    v28 = (_QWORD *)*v40;
    *(_QWORD *)(*v40 + 8 * (v21 >> 6) + 64) |= 1 << v21;
    v29 = (_QWORD *)(v28[6] + 16 * v21);
    *v29 = v16;
    v29[1] = v17;
    v8 = (char *)v18;
    sub_1921C852C(v18, v28[7] + *(_QWORD *)(v39 + 72) * v21);
    v30 = v28[2];
    v31 = __OFADD__(v30, 1);
    v32 = v30 + 1;
    if (v31)
      goto LABEL_18;
    v28[2] = v32;
    v13 = v37;
    v15 += v36;
    a2 = 1;
    if (!--v14)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_1921C1584(v24, a2 & 1);
  v26 = sub_1921C85A8();
  if ((v25 & 1) != (v27 & 1))
    goto LABEL_19;
  v21 = v26;
  if ((v25 & 1) == 0)
    goto LABEL_10;
LABEL_14:
  v33 = (void *)swift_allocError();
  swift_willThrow();
  v45 = v33;
  v34 = v33;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72E0);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_1921C793C(v18, (uint64_t (*)(_QWORD))type metadata accessor for EventValue);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_20:
  v41 = 0;
  v42 = 0xE000000000000000;
  sub_1921DBB14();
  sub_1921DB964();
  sub_1921DBB38();
  sub_1921DB964();
  sub_1921DBB74();
  __break(1u);
}

uint64_t sub_1921CFA70()
{
  return MEMORY[0x1E0DEB0F0];
}

void sub_1921CFA7C()
{
  sub_1921CFAE8(&qword_1EE2515B8);
}

uint64_t sub_1921CFAA0()
{
  return MEMORY[0x1E0DEA9F0];
}

uint64_t sub_1921CFAAC()
{
  return MEMORY[0x1E0DEAFD0];
}

uint64_t sub_1921CFAB8()
{
  return MEMORY[0x1E0DEDCD0];
}

void sub_1921CFAC4()
{
  sub_1921CFAE8(&qword_1EE2515C0);
}

void sub_1921CFAE8(unint64_t *a1)
{
  uint64_t v2;

  if (!*a1)
  {
    type metadata accessor for EventValue();
    v2 = OUTLINED_FUNCTION_39();
    atomic_store(MEMORY[0x1940241A0](v2), a1);
  }
  OUTLINED_FUNCTION_38();
}

uint64_t sub_1921CFB20()
{
  return MEMORY[0x1E0DEAA00];
}

uint64_t sub_1921CFB2C()
{
  return MEMORY[0x1E0DEA9F8];
}

uint64_t sub_1921CFB38()
{
  return 0;
}

uint64_t *initializeBufferWithCopyOfBuffer for EventValue(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 5u:
        v9 = sub_1921DB850();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
        goto LABEL_8;
      case 6u:
      case 7u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
LABEL_8:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

_QWORD *assignWithCopy for EventValue(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_1921C793C((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for EventValue);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_7;
      case 5u:
        v6 = sub_1921DB850();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
        goto LABEL_7;
      case 6u:
      case 7u:
        *a1 = *a2;
        swift_bridgeObjectRetain();
LABEL_7:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *initializeWithTake for EventValue(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 5)
  {
    v6 = sub_1921DB850();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_1921CFE20()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1921CFE30()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1921DB850();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Event(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Event(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for Event(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for Event(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 9))
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

uint64_t storeEnumTagSinglePayload for Event(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 9) = 1;
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
    *(_BYTE *)(result + 9) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Event()
{
  return &type metadata for Event;
}

ValueMetadata *type metadata accessor for Event.Keys()
{
  return &type metadata for Event.Keys;
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1ECFD7360)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1ECFD7360);
  }
}

uint64_t sub_1921D0084@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_1921C85A8();
  v6 = v5;
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v11 = *v2;
    *v2 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7350);
    sub_1921DBB44();
    swift_bridgeObjectRelease();
    v7 = *(_QWORD *)(v11 + 56);
    v8 = type metadata accessor for EventValue();
    sub_1921C852C(v7 + *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72) * v4, a1);
    sub_1921DBB5C();
    *v2 = v11;
    swift_bridgeObjectRelease();
    return __swift_storeEnumTagSinglePayload(a1, 0, 1, v8);
  }
  else
  {
    v10 = type metadata accessor for EventValue();
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v10);
  }
}

double sub_1921D01C4@<D0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  char v6;
  double result;
  uint64_t v8;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_1921C85A8();
  v6 = v5;
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v8 = *v2;
    *v2 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7230);
    sub_1921DBB44();
    swift_bridgeObjectRelease();
    sub_1921C86E8((_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v4), a1);
    sub_1921DBB5C();
    *v2 = v8;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

void sub_1921D02E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_38();
}

uint64_t OUTLINED_FUNCTION_40()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_42()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void OUTLINED_FUNCTION_51()
{
  sub_1921C6CBC();
}

uint64_t OUTLINED_FUNCTION_52()
{
  uint64_t v0;

  return v0;
}

void *OUTLINED_FUNCTION_53()
{
  size_t v0;

  return malloc(v0);
}

uint64_t sub_1921D0390()
{
  uint64_t v0;

  v0 = sub_1921DB874();
  __swift_allocate_value_buffer(v0, qword_1ECFD7540);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ECFD7540);
  return sub_1921DB868();
}

BOOL sub_1921D0404(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1921D0414()
{
  return sub_1921DBC70();
}

uint64_t sub_1921D0438()
{
  sub_1921DBC64();
  sub_1921DBC70();
  return sub_1921DBC88();
}

BOOL sub_1921D047C(char *a1, char *a2)
{
  return sub_1921D0404(*a1, *a2);
}

uint64_t sub_1921D0488()
{
  return sub_1921D0438();
}

uint64_t sub_1921D0490()
{
  return sub_1921D0414();
}

uint64_t sub_1921D0498()
{
  sub_1921DBC64();
  sub_1921DBC70();
  return sub_1921DBC88();
}

unint64_t sub_1921D04D8(uint64_t a1, uint64_t a2)
{
  unint64_t v2;

  v2 = 0xD000000000000015;
  if (!a2)
    return 0xD000000000000016;
  if (a2 != 1)
  {
    sub_1921DBB14();
    swift_bridgeObjectRelease();
    sub_1921DB964();
    return 0xD000000000000020;
  }
  return v2;
}

unint64_t sub_1921D059C()
{
  uint64_t *v0;

  return sub_1921D04D8(*v0, v0[1]);
}

uint64_t sub_1921D05A4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 312) = a1;
  return swift_release();
}

uint64_t sub_1921D05B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 328);
  *(_QWORD *)(v2 + 328) = a1;
  *(_QWORD *)(v2 + 336) = a2;
  return sub_1921C1508(v3);
}

uint64_t Session.__allocating_init(clientType:clientName:serviceName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;

  *(_QWORD *)(v6 + 24) = 0;
  *(_QWORD *)(v6 + 32) = 0;
  *(_QWORD *)(v6 + 16) = 0;
  *(_QWORD *)(v6 + 40) = 1;
  OUTLINED_FUNCTION_62();
  *(_OWORD *)(v6 + 48) = 0u;
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_OWORD *)(v6 + 96) = 0u;
  *(_BYTE *)(v6 + 112) = 0;
  swift_allocObject();
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 120) = v13;
  *v13 = v6;
  v13[1] = sub_1921D0698;
  return sub_1921CB6AC(a1, a2, a3, a4, a5, a6, v6 + 16, 1);
}

uint64_t sub_1921D0698(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_1921D06EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  char v6;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

uint64_t sub_1921D073C(int a1, xpc_object_t xint)
{
  int64_t value;
  uint64_t v4;

  value = xpc_int64_get_value(xint);
  sub_1921D1F58(&v4, value);
  return 1;
}

uint64_t sub_1921D0778()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc();
  sub_1921D1914(*(id *)(v1 + 32), *(_BYTE *)(v1 + 40));
  return OUTLINED_FUNCTION_24_0();
}

uint64_t sub_1921D07D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = v0[8];
  swift_release();
  v2 = *(_QWORD *)(v1 + 312);
  if (v2)
  {
    v0[22] = v2;
    OUTLINED_FUNCTION_70();
    v3 = (_QWORD *)OUTLINED_FUNCTION_11_0();
    v0[23] = v3;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72E0);
    *v3 = v0;
    v3[1] = sub_1921D0778;
    return sub_1921DB9F4();
  }
  else
  {
    v5 = OUTLINED_FUNCTION_37_0();
    OUTLINED_FUNCTION_42_0(v5);
    v6 = (_QWORD *)OUTLINED_FUNCTION_21_0();
    OUTLINED_FUNCTION_15_0(v6);
    v7 = OUTLINED_FUNCTION_67();
    v8 = OUTLINED_FUNCTION_73(v7, (uint64_t)&unk_1EE251678);
    v9 = OUTLINED_FUNCTION_76(v8);
    sub_1921D05A4(v9);
    v10 = (_QWORD *)swift_task_alloc();
    v0[25] = v10;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72E0);
    *v10 = v0;
    v10[1] = sub_1921C12E8;
    return sub_1921DB9E8();
  }
}

uint64_t sub_1921D0918()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_36_0();
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_43_0();
  OUTLINED_FUNCTION_59();
  return OUTLINED_FUNCTION_9_0(*(uint64_t (**)(void))(v0 + 8));
}

BOOL sub_1921D0994(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 result;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v4 = sub_1921DBC58();
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = v4 & ~v5;
  v7 = a2 + 56;
  if (((*(_QWORD *)(a2 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(a2 + 48);
  if (*(_QWORD *)(v8 + 8 * v6) == a1)
    return 1;
  v10 = ~v5;
  v11 = (v6 + 1) & v10;
  if (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
    return 0;
  do
  {
    v12 = *(_QWORD *)(v8 + 8 * v11);
    result = v12 == a1;
    if (v12 == a1)
      break;
    v11 = (v11 + 1) & v10;
  }
  while (((*(_QWORD *)(v7 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0);
  return result;
}

uint64_t sub_1921D0A5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[3] = a4;
  v5[4] = a5;
  v6 = sub_1921DB874();
  v5[5] = v6;
  v5[6] = *(_QWORD *)(v6 - 8);
  v5[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1921D0AC0()
{
  _QWORD *v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  char v4;

  v1 = (void *)v0[4];
  OUTLINED_FUNCTION_67();
  v0[8] = XPCMessage.init(ty:payload:)(2u, v1);
  v2 = (_QWORD *)swift_task_alloc();
  v0[9] = v2;
  v3 = OUTLINED_FUNCTION_20_0(v2, (uint64_t)sub_1921D0B30);
  return XPCConnection.sendWithReply(_:)(v3, v4);
}

uint64_t sub_1921D0B30()
{
  uint64_t v0;

  OUTLINED_FUNCTION_8_0();
  if (!v0)
  {
    OUTLINED_FUNCTION_47();
    swift_unknownObjectRelease();
  }
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_1921D0B8C()
{
  uint64_t v0;

  sub_1921D05A4(0);
  OUTLINED_FUNCTION_17_0();
  return OUTLINED_FUNCTION_9_0(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1921D0BC8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  swift_unknownObjectRelease();
  if (qword_1ECFD7040 != -1)
    swift_once();
  v1 = v0 + 3;
  v3 = v0[6];
  v2 = v0[7];
  v4 = v0[5];
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_1ECFD7540);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  swift_retain_n();
  v6 = sub_1921DB85C();
  v7 = sub_1921DBA30();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = *v1;
    v9 = (uint8_t *)OUTLINED_FUNCTION_13_0();
    v16 = OUTLINED_FUNCTION_55_0();
    *(_DWORD *)v9 = 136315138;
    if (*(_QWORD *)(v8 + 184))
    {
      v10 = *(_QWORD *)(*v1 + 176);
      v11 = *(_QWORD *)(v8 + 184);
    }
    else
    {
      v11 = 0xE100000000000000;
      v10 = 63;
    }
    swift_bridgeObjectRetain();
    v0[2] = sub_1921CACB8(v10, v11, &v16);
    sub_1921DBA90();
    swift_bridgeObjectRelease();
    swift_release_n();
    OUTLINED_FUNCTION_52_0(&dword_1921BE000, v6, v7, "session %s received error during send - marking as disabled", v9);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_6_1();
  }
  v13 = v0[6];
  v12 = v0[7];
  v14 = v0[5];
  swift_release_n();

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  *(_BYTE *)(v0[3] + 320) = 0;
  swift_willThrow();
  sub_1921D05A4(0);
  OUTLINED_FUNCTION_17_0();
  OUTLINED_FUNCTION_46_0();
  __asm { BR              X0 }
}

uint64_t sub_1921D0DE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = sub_1921DB9DC();
  if (__swift_getEnumTagSinglePayload(a1, 1, v5) == 1)
  {
    sub_1921C3940(a1, &qword_1ECFD7348);
  }
  else
  {
    sub_1921DB9D0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1921DB9A0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1921D0F0C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;

  swift_unknownObjectRelease();
  if (qword_1ECFD7040 != -1)
    swift_once();
  v1 = *(void **)(v0 + 80);
  v2 = OUTLINED_FUNCTION_61();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ECFD7540);
  v3 = v1;
  v4 = v1;
  v5 = sub_1921DB85C();
  v6 = sub_1921DBA30();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_13_0();
    v11 = OUTLINED_FUNCTION_55_0();
    *(_DWORD *)v7 = 136446210;
    swift_getErrorValue();
    v8 = sub_1921DBC1C();
    *(_QWORD *)(v0 + 48) = sub_1921CACB8(v8, v9, &v11);
    sub_1921DBA90();
    OUTLINED_FUNCTION_35_0();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_52_0(&dword_1921BE000, v5, v6, "failed to send session end: %{public}s", v7);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_6_1();
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();

  *(_BYTE *)(*(_QWORD *)(v0 + 56) + 320) = 2;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void Session.unownedExecutor.getter()
{
  OUTLINED_FUNCTION_49_0();
}

void sub_1921D10D4()
{
  Session.unownedExecutor.getter();
}

_BYTE **sub_1921D10EC(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_1921D10FC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1921D111C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_1921CACB8(v6, v7, a3);
  v8 = *a1 + 8;
  sub_1921DBA90();
  result = OUTLINED_FUNCTION_35_0();
  *a1 = v8;
  return result;
}

uint64_t OUTLINED_FUNCTION_62()
{
  return type metadata accessor for Session();
}

uint64_t sub_1921D1190()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1921DB814();
  if (v1 <= 0x3F)
    return swift_updateClassMetadata2();
  return result;
}

uint64_t method lookup function for Session()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Session.end()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 384) + *(_QWORD *)(*(_QWORD *)v0 + 384));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1921D12CC;
  return OUTLINED_FUNCTION_25(v4);
}

uint64_t sub_1921D12CC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_12();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_1921D1308(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_1921D1390(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1921D13DC + 4 * byte_1921DDD55[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1921D1410 + 4 * byte_1921DDD50[v4]))();
}

uint64_t sub_1921D1410(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1921D1418(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1921D1420);
  return result;
}

uint64_t sub_1921D142C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1921D1434);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1921D1438(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1921D1440(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1921D144C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1921D1454(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for Session.State()
{
  OUTLINED_FUNCTION_49_0();
}

uint64_t sub_1921D1468(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1921D1498()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1921D14D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_WORD *)a1 = *(_WORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v5;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_WORD *)(a1 + 80) = *(_WORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1921D1564(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_WORD *)a1 = *(_WORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
  v4 = *(_QWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = v4;
  return a1;
}

void *__swift_memcpy97_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x61uLL);
}

uint64_t sub_1921D1650(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)a1 = *(_WORD *)a2;
  *(_DWORD *)(a1 + 4) = *(_DWORD *)(a2 + 4);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_BYTE *)(a1 + 81) = *(_BYTE *)(a2 + 81);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 96) = *(_BYTE *)(a2 + 96);
  return a1;
}

uint64_t sub_1921D16EC(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 97))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 24);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1921D1740(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 96) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 97) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 97) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

void type metadata accessor for LegacyConfig()
{
  OUTLINED_FUNCTION_49_0();
}

unint64_t sub_1921D17C0()
{
  unint64_t result;

  result = qword_1EE251660;
  if (!qword_1EE251660)
  {
    result = MEMORY[0x1940241A0](&unk_1921DDF14, &unk_1E2EB28B8);
    atomic_store(result, &qword_1EE251660);
  }
  return result;
}

unint64_t sub_1921D17FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ECFD7220;
  if (!qword_1ECFD7220)
  {
    v1 = type metadata accessor for Session();
    result = MEMORY[0x1940241A0](&protocol conformance descriptor for Session, v1);
    atomic_store(result, (unint64_t *)&qword_1ECFD7220);
  }
  return result;
}

uint64_t sub_1921D183C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1921D1870(uint64_t a1)
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
  v7 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1921D18F0;
  return sub_1921D0A5C(a1, v4, v5, v6, v7);
}

uint64_t sub_1921D18F0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_12();
  return OUTLINED_FUNCTION_25(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1921D1914(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

void *sub_1921D1920(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1921DBB98();
  __break(1u);
  return result;
}

uint64_t sub_1921D19E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1921D1A78(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_1921D1C4C(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_1921D1C4C((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1921D1A78(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_1921DB97C();
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
  v3 = sub_1921D1BE8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_1921DBB20();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_1921DBB98();
  __break(1u);
LABEL_14:
  result = sub_1921DBB68();
  __break(1u);
  return result;
}

_QWORD *sub_1921D1BE8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6EB0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1921D1C4C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6EB0);
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
    sub_1921D1DE4(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1921D1D20(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1921D1D20(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1921DBB98();
  __break(1u);
  return result;
}

char *sub_1921D1DE4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1921DBB98();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_1921D1E64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD72D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1921D1EAC()
{
  unint64_t result;

  result = qword_1EE2514C8;
  if (!qword_1EE2514C8)
  {
    result = MEMORY[0x1940241A0](&unk_1921DDFA0, &type metadata for Session.SessionError);
    atomic_store(result, (unint64_t *)&qword_1EE2514C8);
  }
  return result;
}

uint64_t sub_1921D1EE8()
{
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_1921D1EF4(int a1, void *a2)
{
  return sub_1921D073C(a1, a2) & 1;
}

uint64_t sub_1921D1F10()
{
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_1921D1F1C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_1921D1F40()
{
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_1921D1F4C()
{
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_1921D1F58(uint64_t *a1, uint64_t a2)
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
  v7 = sub_1921DBC58();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    *v3 = 0x8000000000000000;
    sub_1921D22D0(a2, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v14;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(v6 + 48);
  if (*(_QWORD *)(v10 + 8 * v9) != a2)
  {
    v11 = ~v8;
    do
    {
      v9 = (v9 + 1) & v11;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v10 + 8 * v9) != a2);
  }
  result = 0;
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_1921D2050()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE2516E0);
  result = sub_1921DBB08();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v7 = (uint64_t *)(v2 + 56);
    v6 = *(_QWORD *)(v2 + 56);
    v8 = 1 << *(_BYTE *)(v2 + 32);
    v27 = -1 << v8;
    v28 = v1;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & v6;
    v29 = 1 << *(_BYTE *)(v2 + 32);
    v11 = (unint64_t)(v8 + 63) >> 6;
    v12 = result + 56;
    if ((v9 & v6) == 0)
      goto LABEL_7;
LABEL_6:
    v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (i = v13 | (v5 << 6); ; i = __clz(__rbit64(v16)) + (v5 << 6))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
      result = sub_1921DBC58();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6))) == 0)
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          v25 = v21 == v24;
          if (v21 == v24)
            v21 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v21);
          if (v26 != -1)
          {
            v22 = __clz(__rbit64(~v26)) + (v21 << 6);
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
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v12 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v12 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v22) = v18;
      ++*(_QWORD *)(v4 + 16);
      if (v10)
        goto LABEL_6;
LABEL_7:
      v15 = v5 + 1;
      if (__OFADD__(v5, 1))
        goto LABEL_38;
      if (v15 >= v11)
        goto LABEL_32;
      v16 = v7[v15];
      ++v5;
      if (!v16)
      {
        v5 = v15 + 1;
        if (v15 + 1 >= v11)
          goto LABEL_32;
        v16 = v7[v5];
        if (!v16)
        {
          v5 = v15 + 2;
          if (v15 + 2 >= v11)
            goto LABEL_32;
          v16 = v7[v5];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v11)
            {
LABEL_32:
              if (v29 > 63)
                sub_1921CAC9C(0, v11, (_QWORD *)(v2 + 56));
              else
                *v7 = v27;
              v1 = v28;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v16 = v7[v17];
            if (!v16)
            {
              while (1)
              {
                v5 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_39;
                if (v5 >= v11)
                  goto LABEL_32;
                v16 = v7[v5];
                ++v17;
                if (v16)
                  goto LABEL_20;
              }
            }
            v5 = v17;
          }
        }
      }
LABEL_20:
      v10 = (v16 - 1) & v16;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1921D22D0(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
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
    sub_1921D2050();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_1921D23F0();
      goto LABEL_14;
    }
    sub_1921D2584();
  }
  v8 = *v3;
  result = sub_1921DBC58();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      result = sub_1921DBBEC();
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
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

void *sub_1921D23F0()
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE2516E0);
  v2 = *v0;
  v3 = sub_1921DBAFC();
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
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * i) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
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

uint64_t sub_1921D2584()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EE2516E0);
  result = sub_1921DBB08();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
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
  if (!v9)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (i = v12 | (v5 << 6); ; i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
    result = sub_1921DBC58();
    v18 = -1 << *(_BYTE *)(v4 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6))) == 0)
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v20);
        if (v25 != -1)
        {
          v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v21) = v17;
    ++*(_QWORD *)(v4 + 16);
    if (v9)
      goto LABEL_6;
LABEL_7:
    v14 = v5 + 1;
    if (__OFADD__(v5, 1))
      goto LABEL_36;
    if (v14 >= v10)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      v5 = v14 + 1;
      if (v14 + 1 >= v10)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v5);
      if (!v15)
      {
        v5 = v14 + 2;
        if (v14 + 2 >= v10)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v5);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v9 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v10)
  {
LABEL_32:
    result = swift_release();
    v1 = v26;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v5 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v5 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v5 >= v10)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v5);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t destroy for Session.SessionError(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

void _s12RTCReporting7SessionC12SessionErrorOwCP_0(uint64_t a1, uint64_t a2)
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
  OUTLINED_FUNCTION_38();
}

_QWORD *assignWithCopy for Session.SessionError(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for Session.SessionError(uint64_t a1, uint64_t a2)
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

uint64_t getEnumTagSinglePayload for Session.SessionError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Session.SessionError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_1921D29FC(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1921D2A14(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for Session.SessionError()
{
  return &type metadata for Session.SessionError;
}

uint64_t sub_1921D2A44(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1921D2A78()
{
  return swift_bridgeObjectRelease();
}

_QWORD *sub_1921D2A80(_QWORD *a1, _QWORD *a2)
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

uint64_t sub_1921D2ADC(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1921D2B14(uint64_t a1, int a2)
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

uint64_t sub_1921D2B54(uint64_t result, int a2, int a3)
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

void type metadata accessor for LegacyHierarchyToken()
{
  OUTLINED_FUNCTION_49_0();
}

uint64_t OUTLINED_FUNCTION_20_0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return swift_task_dealloc();
}

unint64_t OUTLINED_FUNCTION_42_0(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return sub_1921D17FC();
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

void OUTLINED_FUNCTION_52_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_54()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1921C78F8(v0, v1);
}

uint64_t OUTLINED_FUNCTION_55_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_57()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_58()
{
  return swift_isEscapingClosureAtFileLocation();
}

uint64_t OUTLINED_FUNCTION_59()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return sub_1921DB814();
}

size_t OUTLINED_FUNCTION_65()
{
  xpc_object_t *v0;

  return xpc_array_get_count(*v0);
}

uint64_t OUTLINED_FUNCTION_67()
{
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_68()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_69()
{
  return swift_release();
}

void OUTLINED_FUNCTION_71(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  sub_1921C793C(v2, a2);
}

BOOL OUTLINED_FUNCTION_72()
{
  void *v0;
  void *v1;

  return xpc_array_apply(v0, v1);
}

uint64_t OUTLINED_FUNCTION_73(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return sub_1921D0DE4(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_74()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_75(_OWORD *a1@<X8>)
{
  uint64_t v1;

  sub_1921C6C70(v1, a1);
}

uint64_t OUTLINED_FUNCTION_76(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 192) = a1;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_77(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_78()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1921C78F8(v0, v1);
}

uint64_t sub_1921D2CF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = sub_1921DB880();
  v14 = *(_QWORD *)(v1 - 8);
  v15 = v1;
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1921DBA60();
  v4 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1921DBA54();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1921DB898();
  MEMORY[0x1E0C80A78](v8);
  sub_1921D3404();
  sub_1921DB88C();
  v16 = MEMORY[0x1E0DEE9D8];
  sub_1921D3440();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7380);
  sub_1921D3480();
  sub_1921DBAE4();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DEF8D8], v13);
  v10 = v14;
  v9 = v15;
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v3, *MEMORY[0x1E0DEF520], v15);
  sub_1921DBA78();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v3, v9);
  *(_QWORD *)(v0 + 16) = sub_1921DBA6C();
  *(_QWORD *)(v0 + 24) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7388);
  v11 = swift_allocObject();
  *(_DWORD *)(v11 + 16) = 0;
  *(_QWORD *)(v0 + 32) = v11;
  *(_BYTE *)(v0 + 40) = 2;
  return v0;
}

uint64_t sub_1921D2F2C()
{
  SecTaskRef v0;
  NSObject *v1;
  __CFString *v2;
  CFTypeRef v3;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  unsigned __int8 v15;

  v0 = SecTaskCreateFromSelf(0);
  if (!v0)
  {
    if (qword_1EE2514D8 != -1)
      swift_once();
    if (byte_1EE2514D0 != 1)
      return 0;
    if (qword_1EE2514B8 != -1)
      swift_once();
    v5 = sub_1921DB874();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EE2524F0);
    v1 = sub_1921DB85C();
    v6 = sub_1921DBA30();
    if (os_log_type_enabled(v1, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1921BE000, v1, v6, "unable to validate task XPC authorization", v7, 2u);
      MEMORY[0x194024230](v7, -1, -1);
    }
    goto LABEL_27;
  }
  v1 = v0;
  v2 = (__CFString *)sub_1921DB928();
  v3 = SecTaskCopyValueForEntitlement((SecTaskRef)v1, v2, 0);

  if (v3)
  {
    swift_unknownObjectRetain();
    if (swift_dynamicCast())
    {
      swift_unknownObjectRelease();

      return v15;
    }
    if (qword_1EE2514D8 != -1)
      swift_once();
    if (byte_1EE2514D0 == 1)
    {
      if (qword_1EE2514B8 != -1)
        swift_once();
      v12 = sub_1921DB874();
      __swift_project_value_buffer(v12, (uint64_t)qword_1EE2524F0);
      v9 = sub_1921DB85C();
      v13 = sub_1921DBA30();
      if (os_log_type_enabled(v9, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_1921BE000, v9, v13, "XPC authorization entitlement is invalid", v14, 2u);
        MEMORY[0x194024230](v14, -1, -1);
        swift_unknownObjectRelease();
        goto LABEL_26;
      }

    }
    swift_unknownObjectRelease();
    return 0;
  }
  if (qword_1EE2514D8 != -1)
    swift_once();
  if (byte_1EE2514D0 != 1)
    goto LABEL_27;
  if (qword_1EE2514B8 != -1)
    swift_once();
  v8 = sub_1921DB874();
  __swift_project_value_buffer(v8, (uint64_t)qword_1EE2524F0);
  v9 = sub_1921DB85C();
  v10 = sub_1921DBA30();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1921BE000, v9, v10, "XPC authorization entitlement not available", v11, 2u);
    MEMORY[0x194024230](v11, -1, -1);
  }
LABEL_26:

LABEL_27:
  return 0;
}

uint64_t sub_1921D32C0()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  byte_1EE2514D0 = result;
  return result;
}

uint64_t sub_1921D32E4()
{
  uint64_t v0;

  v0 = sub_1921DB874();
  __swift_allocate_value_buffer(v0, qword_1EE2524F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EE2524F0);
  return sub_1921DB868();
}

uint64_t sub_1921D3360()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_1921D338C()
{
  sub_1921D3360();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ConnectionManager()
{
  return objc_opt_self();
}

uint64_t sub_1921D33CC()
{
  uint64_t result;

  type metadata accessor for ConnectionManager();
  swift_allocObject();
  result = sub_1921D2CF8();
  qword_1ECFD7568 = result;
  return result;
}

unint64_t sub_1921D3404()
{
  unint64_t result;

  result = qword_1ECFD73B8;
  if (!qword_1ECFD73B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ECFD73B8);
  }
  return result;
}

unint64_t sub_1921D3440()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ECFD73B0;
  if (!qword_1ECFD73B0)
  {
    v1 = sub_1921DBA54();
    result = MEMORY[0x1940241A0](MEMORY[0x1E0DEF828], v1);
    atomic_store(result, (unint64_t *)&qword_1ECFD73B0);
  }
  return result;
}

unint64_t sub_1921D3480()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ECFD73A8;
  if (!qword_1ECFD73A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ECFD7380);
    result = MEMORY[0x1940241A0](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ECFD73A8);
  }
  return result;
}

void sub_1921D34C4(_QWORD *(*a1)(uint64_t *__return_ptr), uint64_t a2, os_unfair_lock_s *a3)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3 + 4;
  os_unfair_lock_lock(a3 + 4);
  sub_1921C2490(v5, a1, &v6);
  os_unfair_lock_unlock(v4);
}

uint64_t sub_1921D3534(void (*a1)(uint64_t *__return_ptr), uint64_t a2, os_unfair_lock_s *a3)
{
  uint64_t v3;
  os_unfair_lock_s *v5;
  uint64_t v6;
  char v7;
  char v9;

  v5 = a3 + 4;
  os_unfair_lock_lock(a3 + 4);
  sub_1921C24F8(v6, a1, &v9);
  os_unfair_lock_unlock(v5);
  if (!v3)
    v7 = v9;
  return v7 & 1;
}

void sub_1921D35A8(_QWORD *(*a1)(uint64_t *__return_ptr), uint64_t a2, os_unfair_lock_s *a3)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3 + 4;
  os_unfair_lock_lock(a3 + 4);
  sub_1921D89B4(v5, a1, &v6);
  os_unfair_lock_unlock(v4);
}

void sub_1921D3618()
{
  sub_1921DBB14();
  swift_bridgeObjectRelease();
  sub_1921DB964();
  OUTLINED_FUNCTION_88();
}

void sub_1921D3690()
{
  sub_1921D3618();
}

void _RTCReportingS.messageLoggingBlock.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_24_1();
  v0 = OUTLINED_FUNCTION_38_1();
  sub_1921CA1B8(v0);
  OUTLINED_FUNCTION_38_1();
  OUTLINED_FUNCTION_88();
}

uint64_t sub_1921D3768(uint64_t a1)
{
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v2 = sub_1921DB934();
  v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_1921D37BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = (id)sub_1921DB928();
  (*(void (**)(uint64_t, id))(a3 + 16))(a3, v4);

}

uint64_t sub_1921D37FC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(_QWORD *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____RTCReportingS_messageLoggingBlock);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_1921D8018;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_1921CA1B8(v4);
}

uint64_t sub_1921D3890(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_1921D7FE8;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____RTCReportingS_messageLoggingBlock);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_1921CA1B8(v3);
  return sub_1921C1508(v8);
}

uint64_t (*_RTCReportingS.messageLoggingBlock.modify())()
{
  OUTLINED_FUNCTION_24_1();
  return j__swift_endAccess;
}

uint64_t _RTCReportingS.messageSentDelegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____RTCReportingS_messageSentDelegate;
  OUTLINED_FUNCTION_24_1();
  return MEMORY[0x1940242D8](v1);
}

uint64_t _RTCReportingS.messageSentDelegate.setter()
{
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_38_1();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

uint64_t sub_1921D3A8C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR____RTCReportingS_messageSentDelegate;
  swift_beginAccess();
  result = MEMORY[0x1940242D8](v3);
  *a2 = result;
  return result;
}

uint64_t sub_1921D3AE0()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

void (*_RTCReportingS.messageSentDelegate.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____RTCReportingS_messageSentDelegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  OUTLINED_FUNCTION_24_1();
  v3[3] = MEMORY[0x1940242D8](v5);
  return sub_1921D3BA0;
}

void sub_1921D3BA0(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_1921D3C0C()
{
  uint64_t v0;

  v0 = sub_1921DB874();
  __swift_allocate_value_buffer(v0, qword_1ECFD7368);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ECFD7368);
  return sub_1921DB868();
}

uint64_t sub_1921D3C88()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  byte_1ECFD7558 = result;
  return result;
}

uint64_t sub_1921D3CAC()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7388);
  result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_1ECFD7328 = result;
  return result;
}

uint64_t sub_1921D3CE0()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7388);
  result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_1ECFD7280 = result;
  return result;
}

unint64_t sub_1921D3D14()
{
  return 0xD000000000000016;
}

uint64_t sub_1921D3D30(char a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t inited;
  uint64_t v4;

  if ((a1 & 1) != 0)
    v1 = 0xD000000000000011;
  else
    v1 = 0xD000000000000016;
  if ((a1 & 1) != 0)
    v2 = 0x80000001921DD7E0;
  else
    v2 = 0x80000001921DD800;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6E70);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1921DDD20;
  *(_QWORD *)(inited + 32) = sub_1921DB934();
  *(_QWORD *)(inited + 40) = v4;
  *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(inited + 48) = v1;
  *(_QWORD *)(inited + 56) = v2;
  return sub_1921DB8F8();
}

uint64_t sub_1921D3DF4(uint64_t a1)
{
  unsigned int v1;

  if (a1 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (a1)
    return v1;
  else
    return 0;
}

uint64_t sub_1921D3E0C(char a1)
{
  return a1 & 1;
}

BOOL sub_1921D3E14(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1921D3E20(*a1, *a2);
}

BOOL sub_1921D3E20(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_1921D3E30()
{
  return sub_1921D3E38();
}

uint64_t sub_1921D3E38()
{
  sub_1921DBC64();
  sub_1921DBC7C();
  return sub_1921DBC88();
}

uint64_t sub_1921D3E7C()
{
  return sub_1921D3E84();
}

uint64_t sub_1921D3E84()
{
  return sub_1921DBC7C();
}

uint64_t sub_1921D3EA8()
{
  return sub_1921D3EB0();
}

uint64_t sub_1921D3EB0()
{
  sub_1921DBC64();
  sub_1921DBC7C();
  return sub_1921DBC88();
}

uint64_t sub_1921D3EF0@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_1921D3DF4(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_1921D3F18@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;

  result = sub_1921D3E0C(*v1);
  *a1 = result;
  return result;
}

unint64_t sub_1921D3F40()
{
  sub_1921D3D14();
  return 0xD000000000000016;
}

uint64_t sub_1921D3F5C()
{
  sub_1921D7F08();
  sub_1921D7F44();
  return sub_1921DB70C();
}

uint64_t sub_1921D3FA0()
{
  char *v0;

  return sub_1921D3D30(*v0);
}

uint64_t sub_1921D3FA8()
{
  sub_1921D7ECC();
  return sub_1921DBC10();
}

uint64_t sub_1921D3FD0()
{
  sub_1921D7ECC();
  sub_1921D7F08();
  sub_1921D7F44();
  return sub_1921DBC04();
}

void _RTCReportingS.__allocating_init(sessionInfo:userInfo:frameworksToCheck:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_99();
  _RTCReportingS.init(sessionInfo:userInfo:frameworksToCheck:)(a1, a2, a3);
}

id _RTCReportingS.__allocating_init(sessionInfo:userInfo:frameworksToCheck:aggregationBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_99();
  return _RTCReportingS.init(sessionInfo:userInfo:frameworksToCheck:aggregationBlock:)(a1, a2, a3, a4);
}

void sub_1921D40B8(uint64_t a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4, uint64_t a5, double a6)
{
  void *v11;
  uint64_t v12;
  id v13;

  if (!a1)
  {
    v11 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v12 = 0;
    goto LABEL_6;
  }
  v11 = (void *)sub_1921DB8B0();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v12 = sub_1921DB8B0();
LABEL_6:
  v13 = (id)v12;
  (*(void (**)(uint64_t, void *, _QWORD, _QWORD, double))(a5 + 16))(a5, v11, a2, a3, a6);

}

uint64_t sub_1921D4188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_1921D41A0()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 16))(0);
  return OUTLINED_FUNCTION_25(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1921D41CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1921DB9DC();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_1921C6C0C(a1, &qword_1ECFD7348);
  }
  else
  {
    sub_1921DB9D0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1921DB9A0();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1921D4310(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_1921D4328(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1921D4358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  *(_QWORD *)(v8 + 224) = v16;
  *(_QWORD *)(v8 + 232) = v17;
  *(_OWORD *)(v8 + 208) = v15;
  *(_QWORD *)(v8 + 192) = a8;
  *(_QWORD *)(v8 + 200) = v14;
  *(_QWORD *)(v8 + 176) = a6;
  *(_QWORD *)(v8 + 184) = a7;
  *(_QWORD *)(v8 + 160) = a4;
  *(_QWORD *)(v8 + 168) = a5;
  *(_WORD *)(v8 + 114) = *(_WORD *)v14;
  *(_DWORD *)(v8 + 116) = *(_DWORD *)(v14 + 4);
  v9 = *(_OWORD *)(v14 + 24);
  *(_OWORD *)(v8 + 240) = *(_OWORD *)(v14 + 8);
  *(_OWORD *)(v8 + 256) = v9;
  v10 = *(_OWORD *)(v14 + 56);
  *(_OWORD *)(v8 + 272) = *(_OWORD *)(v14 + 40);
  *(_OWORD *)(v8 + 288) = v10;
  v11 = *(_QWORD *)(v14 + 72);
  *(_BYTE *)(v8 + 113) = *(_BYTE *)(v14 + 80);
  *(_BYTE *)(v8 + 376) = *(_BYTE *)(v14 + 81);
  v12 = *(_QWORD *)(v14 + 88);
  *(_QWORD *)(v8 + 304) = v11;
  *(_QWORD *)(v8 + 312) = v12;
  *(_BYTE *)(v8 + 377) = *(_BYTE *)(v14 + 96);
  return swift_task_switch();
}

uint64_t sub_1921D43DC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v1 = *(_BYTE *)(v0 + 376);
  v3 = *(_QWORD *)(v0 + 304);
  v2 = *(_QWORD *)(v0 + 312);
  v19 = *(_OWORD *)(v0 + 272);
  v20 = *(_OWORD *)(v0 + 288);
  v17 = *(_OWORD *)(v0 + 240);
  v18 = *(_OWORD *)(v0 + 256);
  v4 = *(unsigned __int16 *)(v0 + 114);
  v21 = *(_QWORD *)(v0 + 200);
  v5 = *(_BYTE *)(v0 + 377) & 1;
  v6 = *(_BYTE *)(v0 + 113) & 1;
  v7 = *(unsigned int *)(v0 + 116);
  *(_QWORD *)(v0 + 320) = sub_1921C0CC4(*(_QWORD *)(v0 + 160));
  *(_QWORD *)(v0 + 328) = v8;
  *(_QWORD *)(v0 + 16) = v4 | (v7 << 32);
  *(_OWORD *)(v0 + 24) = v17;
  *(_OWORD *)(v0 + 40) = v18;
  *(_OWORD *)(v0 + 56) = v19;
  *(_OWORD *)(v0 + 72) = v20;
  *(_QWORD *)(v0 + 88) = v3;
  *(_QWORD *)(v0 + 96) = v6 & 0xFFFFFFFFFFFFFEFFLL | ((unint64_t)(v1 & 1) << 8);
  *(_QWORD *)(v0 + 104) = v2;
  *(_BYTE *)(v0 + 112) = v5;
  type metadata accessor for Session();
  swift_allocObject();
  OUTLINED_FUNCTION_54_0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1921C1080(v21);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v9;
  *v9 = v0;
  v9[1] = sub_1921D4528;
  v10 = OUTLINED_FUNCTION_38_1();
  return sub_1921CB6AC(v10, v11, v12, v13, v14, v15, v0 + 16, 1);
}

uint64_t sub_1921D4528(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_47_1();
  *v4 = *v2;
  *(_QWORD *)(v5 + 344) = a1;
  *(_QWORD *)(v5 + 352) = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_24_0();
}

uint64_t sub_1921D4584()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 344);
  *(_QWORD *)(v0 + 360) = *(_QWORD *)(v1 + 176);
  *(_QWORD *)(v0 + 368) = *(_QWORD *)(v1 + 184);
  swift_bridgeObjectRetain();
  *(_BYTE *)(v0 + 378) = sub_1921C0378();
  OUTLINED_FUNCTION_56_0();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_1921D45D0()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  void (*v11)(_QWORD);
  __int128 v12;
  __int128 v13;

  v1 = *(_BYTE *)(v0 + 378);
  v3 = *(_QWORD *)(v0 + 344);
  v2 = *(_QWORD *)(v0 + 352);
  v12 = *(_OWORD *)(v0 + 320);
  v13 = *(_OWORD *)(v0 + 360);
  v4 = *(_QWORD *)(v0 + 232);
  v5 = *(_QWORD *)(v0 + 208);
  v6 = *(os_unfair_lock_s **)(v5 + OBJC_IVAR____RTCReportingS_lock);
  v7 = swift_task_alloc();
  *(_QWORD *)(v7 + 16) = v5;
  *(_OWORD *)(v7 + 24) = v13;
  *(_QWORD *)(v7 + 40) = v3;
  *(_BYTE *)(v7 + 48) = v1;
  *(_OWORD *)(v7 + 56) = v12;
  *(_QWORD *)(v7 + 72) = v4;
  v8 = OUTLINED_FUNCTION_91();
  *(_QWORD *)(v8 + 16) = sub_1921D8D00;
  *(_QWORD *)(v8 + 24) = v7;
  os_unfair_lock_lock(v6 + 4);
  (*(void (**)(void))(v8 + 16))();
  OUTLINED_FUNCTION_77_0();
  if (v2)
    return OUTLINED_FUNCTION_35_1();
  v10 = *(_QWORD *)(v0 + 216);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_35_0();
  swift_task_dealloc();
  swift_task_dealloc();
  if (v10)
  {
    v11 = *(void (**)(_QWORD))(v0 + 216);
    OUTLINED_FUNCTION_70();
    v11(MEMORY[0x1E0DEE9D8]);
    OUTLINED_FUNCTION_79();
    sub_1921C1508((uint64_t)v11);
  }
  else
  {
    OUTLINED_FUNCTION_79();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1921D4708()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  os_log_type_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD);

  OUTLINED_FUNCTION_60_0();
  swift_bridgeObjectRelease();
  if (qword_1ECFD73A0 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_61();
  v2 = (void *)__swift_project_value_buffer(v1, (uint64_t)qword_1ECFD7368);
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_78_0();
  v3 = OUTLINED_FUNCTION_67_0();
  if (OUTLINED_FUNCTION_64_0(v3))
  {
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_20_1(4.8149e-34);
    v4 = sub_1921DBC1C();
    *(_QWORD *)(v0 + 152) = OUTLINED_FUNCTION_89(v4, v5, v6, v7);
    OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_35_0();
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_44_1(&dword_1921BE000, v8, v9, "failed to configure legacy session: %s");
    OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_6_1();
  }
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_13_1();

  v10 = *(void (**)(_QWORD))(v0 + 216);
  if (v10)
  {
    OUTLINED_FUNCTION_70();
    v10(0);
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_19_1();
  }
  else
  {
    OUTLINED_FUNCTION_23();
  }
  return OUTLINED_FUNCTION_2_2(*(uint64_t (**)(void))(v0 + 8));
}

void sub_1921D4864(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  BOOL v19;
  char v20;
  BOOL v21;
  char v22;
  BOOL v23;
  id v24;
  id v25;
  void *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;

  v33 = a8;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7348);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = &a1[OBJC_IVAR____RTCReportingS_generatedSessionID];
  *v18 = a2;
  v18[1] = a3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[OBJC_IVAR____RTCReportingS_session] = a4;
  swift_release();
  a1[OBJC_IVAR____RTCReportingS_completelyDisabled] = a5;
  v19 = a6 == 17238 && a7 == 0xE200000000000000;
  if (v19
    || ((v20 = sub_1921DBBBC(), a6 == 21580) ? (v21 = a7 == 0xE200000000000000) : (v21 = 0),
        !v21 ? (v22 = 0) : (v22 = 1),
        (v20 & 1) != 0
     || (v22 & 1) != 0
     || (sub_1921DBBBC() & 1) != 0
     || (a6 == 0x4D41434B48 ? (v23 = a7 == 0xE500000000000000) : (v23 = 0), v23 || (sub_1921DBBBC() & 1) != 0)))
  {
    v24 = objc_allocWithZone((Class)RTCReportingAVCLegacySupport);
    swift_retain();
    v25 = objc_msgSend(v24, sel_init);
    v26 = *(void **)&a1[OBJC_IVAR____RTCReportingS_legacyAVCSupport];
    *(_QWORD *)&a1[OBJC_IVAR____RTCReportingS_legacyAVCSupport] = v25;

  }
  else
  {
    swift_retain();
  }
  v27 = (uint64_t *)&a1[OBJC_IVAR____RTCReportingS_earlyCachedEvents];
  swift_beginAccess();
  v28 = *v27;
  if (*v27)
  {
    *v27 = 0;
    sub_1921DB9C4();
    v29 = sub_1921DB9DC();
    __swift_storeEnumTagSinglePayload((uint64_t)v17, 0, 1, v29);
    v30 = (_QWORD *)swift_allocObject();
    v30[2] = 0;
    v30[3] = 0;
    v30[4] = v28;
    v30[5] = a1;
    v30[6] = v33;
    v31 = a1;
    sub_1921D4E4C((uint64_t)v17, (uint64_t)&unk_1EE2518A0, (uint64_t)v30);
    swift_release();
    sub_1921C6C0C((uint64_t)v17, &qword_1ECFD7348);
  }
}

uint64_t sub_1921D4AD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 72) = a4;
  *(_QWORD *)(v5 + 80) = a5;
  return swift_task_switch();
}

uint64_t sub_1921D4AEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  char v8;
  _QWORD *v9;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v0 + 88) = v2;
  if (!v2)
    return OUTLINED_FUNCTION_9_0(*(uint64_t (**)(void))(v0 + 8));
  v3 = *(_QWORD *)(v0 + 80);
  v4 = OBJC_IVAR____RTCReportingS_session;
  *(_QWORD *)(v0 + 96) = OBJC_IVAR____RTCReportingS_session;
  *(_QWORD *)(v0 + 104) = 0;
  v5 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v0 + 112) = v5;
  v6 = *(_QWORD *)(v3 + v4);
  *(_QWORD *)(v0 + 120) = v6;
  result = swift_bridgeObjectRetain();
  if (v6)
  {
    v8 = *(_BYTE *)(result + 40);
    *(_QWORD *)(v0 + 40) = v5;
    *(_BYTE *)(v0 + 48) = v8;
    OUTLINED_FUNCTION_54_0();
    OUTLINED_FUNCTION_70();
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v9;
    *v9 = v0;
    v9[1] = sub_1921D4BA8;
    return sub_1921C1ADC((uint64_t *)(v0 + 40));
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1921D4BA8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_56_0();
  return OUTLINED_FUNCTION_24_0();
}

uint64_t sub_1921D4C1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _QWORD *v10;

  v1 = *(_QWORD *)(v0 + 104) + 1;
  if (v1 == *(_QWORD *)(v0 + 88))
  {
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    *(_QWORD *)(v0 + 104) = v1;
    v3 = *(_QWORD *)(v0 + 96);
    v4 = *(_QWORD *)(v0 + 80);
    v5 = *(_QWORD *)(v0 + 72) + 16 * v1;
    v7 = *(_QWORD *)(v5 + 32);
    v6 = v5 + 32;
    result = v7;
    *(_QWORD *)(v0 + 112) = v7;
    v8 = *(_QWORD *)(v4 + v3);
    *(_QWORD *)(v0 + 120) = v8;
    if (v8)
    {
      v9 = *(_BYTE *)(v6 + 8);
      *(_QWORD *)(v0 + 40) = result;
      *(_BYTE *)(v0 + 48) = v9;
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_70();
      v10 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 128) = v10;
      *v10 = v0;
      v10[1] = sub_1921D4BA8;
      return sub_1921C1ADC((uint64_t *)(v0 + 40));
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_1921D4CE4()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_60_0();
  swift_bridgeObjectRelease();
  if (qword_1ECFD73A0 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_61();
  v2 = __swift_project_value_buffer(v1, (uint64_t)qword_1ECFD7368);
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_78_0();
  v3 = OUTLINED_FUNCTION_67_0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_10_0();
    *(_DWORD *)v4 = 136315138;
    swift_getErrorValue();
    v5 = OUTLINED_FUNCTION_96();
    *(_QWORD *)(v0 + 64) = OUTLINED_FUNCTION_89(v5, v6, v7, v8);
    OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_35_0();
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_23();
    _os_log_impl(&dword_1921BE000, v2, v3, "error sending deferred-from-unconfigured events: %s", v4, 0xCu);
    OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_6_1();
  }
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_23();

  return OUTLINED_FUNCTION_2_2(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1921D4E4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  sub_1921D8188(a1, 0, 0, 0, 1, 0, 0);
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1921DB9A0();
    swift_unknownObjectRelease();
  }
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = a3;
  return swift_task_create();
}

uint64_t _RTCReportingS.fetchReportingStates(userInfo:fetchComplete:)(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  char *v3;
  char *v4;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  os_unfair_lock_s *v11;
  uint64_t result;
  uint64_t v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[6];

  v4 = v3;
  swift_getObjectType();
  v8 = *(os_unfair_lock_s **)&v4[OBJC_IVAR____RTCReportingS_lock];
  v18[2] = v4;
  v18[3] = a1;
  sub_1921D34C4((_QWORD *(*)(uint64_t *__return_ptr))sub_1921D7C34, (uint64_t)v18, v8);
  v10 = v9;
  if (!*(_QWORD *)(v9 + 16))
  {
    OUTLINED_FUNCTION_50_0();
    v14 = (_QWORD *)OUTLINED_FUNCTION_21_0();
    v14[2] = a2;
    v14[3] = a3;
    v14[4] = v4;
    OUTLINED_FUNCTION_81();
    v15 = v4;
    _RTCReportingS.startConfiguration(completionHandler:)(sub_1921D7C7C, (uint64_t)v14);
    return OUTLINED_FUNCTION_55();
  }
  v11 = v8 + 4;
  os_unfair_lock_lock(v11);
  sub_1921D5230(v10, v4);
  os_unfair_lock_unlock(v11);
  result = OUTLINED_FUNCTION_50_0();
  if (!a2)
    return result;
  if (*(_QWORD *)&v4[OBJC_IVAR____RTCReportingS_session])
  {
    if (v4[OBJC_IVAR____RTCReportingS_completelyDisabled] != 1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6E50);
      v16 = OUTLINED_FUNCTION_21_0();
      v17 = MEMORY[0x1E0DEA968];
      *(_OWORD *)(v16 + 16) = xmmword_1921DDD20;
      *(_QWORD *)(v16 + 56) = v17;
      *(_QWORD *)(v16 + 32) = 120;
      *(_QWORD *)(v16 + 40) = 0xE100000000000000;
      OUTLINED_FUNCTION_81();
      a2(v16);
      swift_bridgeObjectRelease();
      return OUTLINED_FUNCTION_19_1();
    }
    OUTLINED_FUNCTION_70();
    v13 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_70();
    v13 = MEMORY[0x1E0DEE9D8];
  }
  a2(v13);
  return OUTLINED_FUNCTION_19_1();
}

uint64_t sub_1921D50E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(a1 + OBJC_IVAR____RTCReportingS_userInfo);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a2;
  *a3 = v6;
  return swift_bridgeObjectRetain();
}

void sub_1921D5150(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a2)
  {
    if (*(_QWORD *)(a4 + OBJC_IVAR____RTCReportingS_session))
    {
      if (*(_BYTE *)(a4 + OBJC_IVAR____RTCReportingS_completelyDisabled) != 1)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6E50);
        v6 = swift_allocObject();
        v7 = MEMORY[0x1E0DEA968];
        *(_OWORD *)(v6 + 16) = xmmword_1921DDD20;
        *(_QWORD *)(v6 + 56) = v7;
        *(_QWORD *)(v6 + 32) = 120;
        *(_QWORD *)(v6 + 40) = 0xE100000000000000;
        sub_1921CA1B8((uint64_t)a2);
        a2(v6);
        swift_bridgeObjectRelease();
        goto LABEL_9;
      }
      swift_retain();
      v5 = 0;
    }
    else
    {
      swift_retain();
      v5 = MEMORY[0x1E0DEE9D8];
    }
    a2(v5);
LABEL_9:
    sub_1921C1508((uint64_t)a2);
  }
}

uint64_t sub_1921D5230(uint64_t a1, char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  uint64_t v27;
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;

  v3 = v2;
  v6 = sub_1921DB874();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1921C6C70(a1, &v42);
  if (!v43)
  {
    sub_1921C6C0C((uint64_t)&v42, &qword_1ECFD7320);
    goto LABEL_12;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    v18 = 0;
    goto LABEL_21;
  }
  v44 = v7;
  v11 = v40;
  v10 = v41;
  v12 = (uint64_t *)&a2[OBJC_IVAR____RTCReportingS_userInfo];
  swift_beginAccess();
  sub_1921C6C70(*v12, &v42);
  swift_endAccess();
  if (v43)
  {
    v13 = MEMORY[0x1E0DEA968];
    if ((swift_dynamicCast() & 1) != 0)
    {
      v38 = v6;
      v39 = v2;
      v15 = v40;
      v14 = v41;
      if (v11 == v40 && v10 == v41)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v17 = sub_1921DBBBC();
        swift_bridgeObjectRelease();
        if ((v17 & 1) == 0)
        {
          v43 = v13;
          *(_QWORD *)&v42 = v15;
          *((_QWORD *)&v42 + 1) = v14;
          swift_beginAccess();
          sub_1921C205C((uint64_t)&v42);
          swift_endAccess();
          v18 = 1;
          goto LABEL_19;
        }
        swift_bridgeObjectRelease();
      }
      v18 = 0;
LABEL_19:
      v6 = v38;
      v3 = v39;
      goto LABEL_20;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1921C6C0C((uint64_t)&v42, &qword_1ECFD7320);
  }
  v18 = 0;
LABEL_20:
  v7 = v44;
LABEL_21:
  sub_1921C6C70(a1, &v42);
  if (!v43)
  {
    sub_1921C6C0C((uint64_t)&v42, &qword_1ECFD7320);
LABEL_32:
    if (!v18)
      goto LABEL_50;
    goto LABEL_39;
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_32;
  v44 = v7;
  v20 = v40;
  v19 = v41;
  v21 = (uint64_t *)&a2[OBJC_IVAR____RTCReportingS_userInfo];
  swift_beginAccess();
  sub_1921C6C70(*v21, &v42);
  swift_endAccess();
  if (!v43)
  {
    swift_bridgeObjectRelease();
    sub_1921C6C0C((uint64_t)&v42, &qword_1ECFD7320);
    goto LABEL_38;
  }
  v22 = MEMORY[0x1E0DEA968];
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_38;
  }
  v38 = v6;
  v39 = v3;
  v24 = v40;
  v23 = v41;
  if (v20 == v40 && v19 == v41)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_37;
  }
  v26 = sub_1921DBBBC();
  swift_bridgeObjectRelease();
  if ((v26 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_37:
    v6 = v38;
    v3 = v39;
LABEL_38:
    v7 = v44;
    if (!v18)
      goto LABEL_50;
    goto LABEL_39;
  }
  v43 = v22;
  *(_QWORD *)&v42 = v24;
  *((_QWORD *)&v42 + 1) = v23;
  swift_beginAccess();
  sub_1921C205C((uint64_t)&v42);
  swift_endAccess();
  v6 = v38;
  v3 = v39;
  v7 = v44;
LABEL_39:
  if (qword_1ECFD7288 != -1)
    swift_once();
  if (byte_1ECFD7558 == 1)
  {
    if (qword_1ECFD73A0 != -1)
      swift_once();
    v27 = __swift_project_value_buffer(v6, (uint64_t)qword_1ECFD7368);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v27, v6);
    v28 = a2;
    v29 = sub_1921DB85C();
    v30 = sub_1921DBA30();
    if (os_log_type_enabled(v29, v30))
    {
      v44 = v7;
      v38 = v6;
      v39 = v3;
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      *(_QWORD *)&v42 = v32;
      *(_DWORD *)v31 = 136446210;
      if (*(_QWORD *)&v28[OBJC_IVAR____RTCReportingS_generatedSessionID + 8])
      {
        v33 = *(_QWORD *)&v28[OBJC_IVAR____RTCReportingS_generatedSessionID];
        v34 = *(_QWORD *)&v28[OBJC_IVAR____RTCReportingS_generatedSessionID + 8];
      }
      else
      {
        v34 = 0xE100000000000000;
        v33 = 63;
      }
      swift_bridgeObjectRetain();
      v40 = sub_1921CACB8(v33, v34, (uint64_t *)&v42);
      sub_1921DBA90();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1921BE000, v29, v30, "tried to change identifiers for existing session: %{public}s", v31, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x194024230](v32, -1, -1);
      MEMORY[0x194024230](v31, -1, -1);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v9, v38);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
  }
LABEL_50:
  swift_beginAccess();
  v35 = swift_bridgeObjectRetain();
  sub_1921CA1C8(v35);
  return swift_bridgeObjectRelease();
}

Swift::String __swiftcall _RTCReportingS.getReportingSessionID()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  Swift::String result;
  uint64_t v4;

  sub_1921D35A8((_QWORD *(*)(uint64_t *__return_ptr))sub_1921D7C88, (uint64_t)&v4, *(os_unfair_lock_s **)(v0 + OBJC_IVAR____RTCReportingS_lock));
  OUTLINED_FUNCTION_88();
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t sub_1921D5998@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = (uint64_t *)(a1 + OBJC_IVAR____RTCReportingS_generatedSessionID);
  v3 = *(_QWORD *)(a1 + OBJC_IVAR____RTCReportingS_generatedSessionID + 8);
  if (v3)
  {
    v4 = *v2;
    v5 = v3;
  }
  else
  {
    v4 = 0;
    v5 = 0xE000000000000000;
  }
  *a2 = v4;
  a2[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1921D5A2C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
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
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE251840);
    v2 = sub_1921DBB8C();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
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
  if (!v5)
    goto LABEL_9;
LABEL_8:
  v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  v10 = v9 | (v8 << 6);
  while (1)
  {
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v17 = *v15;
    v16 = v15[1];
    sub_1921C9084(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(_QWORD *)&v39 = v17;
    *((_QWORD *)&v39 + 1) = v16;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v17;
    *((_QWORD *)&v37[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1921C86E8(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_1921C86E8(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_1921C86E8(v36, v37);
    sub_1921C86E8(v37, &v33);
    result = sub_1921DBAF0();
    v18 = -1 << *(_BYTE *)(v2 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v6 + 8 * (v19 >> 6))) == 0)
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        v24 = v20 == v23;
        if (v20 == v23)
          v20 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v20);
        if (v25 != -1)
        {
          v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    v21 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v6 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(_QWORD *)(v6 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    v26 = *(_QWORD *)(v2 + 48) + 40 * v21;
    *(_OWORD *)v26 = v29;
    *(_OWORD *)(v26 + 16) = v30;
    *(_QWORD *)(v26 + 32) = v31;
    result = (uint64_t)sub_1921C86E8(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v21));
    ++*(_QWORD *)(v2 + 16);
    if (v5)
      goto LABEL_8;
LABEL_9:
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
      goto LABEL_38;
    if (v11 >= v27)
      goto LABEL_36;
    v12 = *(_QWORD *)(v28 + 8 * v11);
    v13 = v8 + 1;
    if (!v12)
    {
      v13 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_36;
      v12 = *(_QWORD *)(v28 + 8 * v13);
      if (!v12)
      {
        v13 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_36;
        v12 = *(_QWORD *)(v28 + 8 * v13);
        if (!v12)
        {
          v13 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_36;
          v12 = *(_QWORD *)(v28 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_24:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v8 = v13;
  }
  v14 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_36:
    swift_release();
    sub_1921D88E8();
    return v2;
  }
  v12 = *(_QWORD *)(v28 + 8 * v14);
  if (v12)
  {
    v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v27)
      goto LABEL_36;
    v12 = *(_QWORD *)(v28 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_24;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1921D5DEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD *v8;

  *(_QWORD *)(v7 + 72) = a7;
  *(_QWORD *)(v7 + 40) = a5;
  *(_BYTE *)(v7 + 48) = a6;
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v7 + 80) = v8;
  *v8 = v7;
  v8[1] = sub_1921D5E48;
  return sub_1921C1ADC((uint64_t *)(v7 + 40));
}

uint64_t sub_1921D5E48()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  OUTLINED_FUNCTION_47_1();
  v2 = *v1;
  *v3 = v2;
  *(_QWORD *)(v4 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    return OUTLINED_FUNCTION_25(*(uint64_t (**)(void))(v2 + 8));
  OUTLINED_FUNCTION_56_0();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_1921D5E98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  os_log_type_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  os_unfair_lock_s *v33;
  uint64_t v34;
  uint64_t v35;

  OUTLINED_FUNCTION_60_0();
  a21 = v23;
  a22 = v24;
  a20 = v22;
  if (qword_1ECFD73A0 != -1)
    swift_once();
  v25 = OUTLINED_FUNCTION_61();
  v26 = (void *)__swift_project_value_buffer(v25, (uint64_t)qword_1ECFD7368);
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_39_1();
  OUTLINED_FUNCTION_78_0();
  v27 = OUTLINED_FUNCTION_67_0();
  if (OUTLINED_FUNCTION_64_0(v27))
  {
    OUTLINED_FUNCTION_10_0();
    a10 = OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_20_1(4.8751e-34);
    v28 = OUTLINED_FUNCTION_96();
    *(_QWORD *)(v22 + 64) = sub_1921CACB8(v28, v29, &a10);
    OUTLINED_FUNCTION_40_1();
    OUTLINED_FUNCTION_35_0();
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_13_1();
    OUTLINED_FUNCTION_44_1(&dword_1921BE000, v30, v31, "failed to send legacy message: %{public}s");
    OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_6_1();
  }
  OUTLINED_FUNCTION_13_1();
  OUTLINED_FUNCTION_13_1();

  v32 = *(_QWORD *)(v22 + 72);
  v33 = *(os_unfair_lock_s **)(v32 + OBJC_IVAR____RTCReportingS_lock);
  v34 = OUTLINED_FUNCTION_91();
  *(_QWORD *)(v34 + 16) = v32;
  v35 = OUTLINED_FUNCTION_91();
  *(_QWORD *)(v35 + 16) = sub_1921D89DC;
  *(_QWORD *)(v35 + 24) = v34;
  os_unfair_lock_lock(v33 + 4);
  (*(void (**)(void))(v35 + 16))();
  OUTLINED_FUNCTION_77_0();

  swift_task_dealloc();
  swift_task_dealloc();
  return OUTLINED_FUNCTION_2_2(*(uint64_t (**)(void))(v22 + 8));
}

Swift::Void __swiftcall _RTCReportingS.flushMessages()()
{
  uint64_t v0;
  os_unfair_lock_s *v1;

  OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_90(*(os_unfair_lock_s **)(v0 + OBJC_IVAR____RTCReportingS_lock));
  sub_1921D614C(v0);
  OUTLINED_FUNCTION_21_1(v1);
}

void sub_1921D614C(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (!*(_QWORD *)(a1 + OBJC_IVAR____RTCReportingS_session))
  {
    if (qword_1ECFD73A0 != -1)
      swift_once();
    v1 = sub_1921DB874();
    __swift_project_value_buffer(v1, (uint64_t)qword_1ECFD7368);
    v2 = sub_1921DB85C();
    v3 = sub_1921DBA30();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1921BE000, v2, v3, "attempted to flush unconfigured session", v4, 2u);
      MEMORY[0x194024230](v4, -1, -1);
    }

  }
}

void _RTCReportingS.flushMessages(completion:)(uint64_t a1, uint64_t a2)
{
  sub_1921D6F68(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1921D6270);
}

void sub_1921D6270(uint64_t a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  void *v14;
  _BYTE *v15;
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7348);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + OBJC_IVAR____RTCReportingS_session);
  if (v9)
  {
    if ((*(_BYTE *)(a1 + OBJC_IVAR____RTCReportingS_completelyDisabled) & 1) != 0)
    {
      if (!a2)
        return;
      swift_retain();
      sub_1921CA1B8((uint64_t)a2);
      ((void (*)(_QWORD))a2)(0);
      swift_release();
      goto LABEL_11;
    }
    if (a2)
    {
      swift_retain();
      sub_1921CA1B8((uint64_t)a2);
      sub_1921DB9C4();
      v17 = sub_1921DB9DC();
      __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v17);
      v18 = (_QWORD *)swift_allocObject();
      v18[2] = 0;
      v18[3] = 0;
      v18[4] = v9;
      v18[5] = a2;
      v18[6] = a3;
      swift_retain();
      sub_1921CA1B8((uint64_t)a2);
      sub_1921D4E4C((uint64_t)v8, (uint64_t)&unk_1EE251838, (uint64_t)v18);
      swift_release();
      sub_1921C1508((uint64_t)a2);
      swift_release();
      sub_1921C6C0C((uint64_t)v8, &qword_1ECFD7348);
    }
  }
  else
  {
    if (qword_1ECFD73A0 != -1)
      swift_once();
    v10 = sub_1921DB874();
    __swift_project_value_buffer(v10, (uint64_t)qword_1ECFD7368);
    v11 = sub_1921DB85C();
    v12 = sub_1921DBA30();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1921BE000, v11, v12, "attempted to flush unconfigured session", v13, 2u);
      MEMORY[0x194024230](v13, -1, -1);
    }

    if (a2)
    {
      sub_1921D7CA0();
      v14 = (void *)swift_allocError();
      *v15 = 1;
      swift_retain();
      v16 = (void *)sub_1921DB760();
      a2();

LABEL_11:
      sub_1921C1508((uint64_t)a2);
    }
  }
}

uint64_t sub_1921D64F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return swift_task_switch();
}

uint64_t sub_1921D6514()
{
  swift_retain();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_1921D654C()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(_QWORD);
  uint64_t v3;
  uint64_t v4;

  v2 = *(void (**)(_QWORD))(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = OUTLINED_FUNCTION_21_0();
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v1;
  if (*(_QWORD *)(v3 + 344))
  {
    OUTLINED_FUNCTION_83();
    swift_retain();
    sub_1921D05B4((uint64_t)sub_1921D88C8, v4);
  }
  else
  {
    OUTLINED_FUNCTION_83();
    v2(0);
  }
  OUTLINED_FUNCTION_79();
  OUTLINED_FUNCTION_69();
  return OUTLINED_FUNCTION_9_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t static _RTCReportingS.getPersistentIdentifierForDNU(_:)()
{
  return 0;
}

uint64_t static _RTCReportingS.createEphemeralSession(sessionInfo:userInfo:)()
{
  return 0;
}

Swift::Void __swiftcall _RTCReportingS.updateSharedData(dictionary:)(Swift::OpaquePointer dictionary)
{
  uint64_t v1;
  os_log_type_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *loga;
  NSObject *log;

  if (qword_1ECFD73A0 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_61();
  __swift_project_value_buffer(v1, (uint64_t)qword_1ECFD7368);
  loga = OUTLINED_FUNCTION_75_0();
  v2 = sub_1921DBA3C();
  if (OUTLINED_FUNCTION_59_0(v2, v3, v4, v5, v6, v7, v8, v9, v16, loga))
  {
    *(_WORD *)OUTLINED_FUNCTION_10_0() = 0;
    OUTLINED_FUNCTION_43_1(&dword_1921BE000, v10, v11, "updateSharedData is deprecated", v12, v13, v14, v15, v17, log);
    OUTLINED_FUNCTION_6_1();
  }
  OUTLINED_FUNCTION_33_1(log);
}

Swift::Void __swiftcall _RTCReportingS.updateSharedData(key:value:)(Swift::String key, NSObject value)
{
  uint64_t v2;
  os_log_type_t v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *loga;
  NSObject *log;

  if (qword_1ECFD73A0 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_61();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ECFD7368);
  loga = OUTLINED_FUNCTION_75_0();
  v3 = sub_1921DBA3C();
  if (OUTLINED_FUNCTION_59_0(v3, v4, v5, v6, v7, v8, v9, v10, v17, loga))
  {
    *(_WORD *)OUTLINED_FUNCTION_10_0() = 0;
    OUTLINED_FUNCTION_43_1(&dword_1921BE000, v11, v12, "updateSharedData is deprecated", v13, v14, v15, v16, v18, log);
    OUTLINED_FUNCTION_6_1();
  }
  OUTLINED_FUNCTION_33_1(log);
}

void sub_1921D696C()
{
  char *v0;
  os_unfair_lock_s *v1;

  v1 = (os_unfair_lock_s *)(*(_QWORD *)&v0[OBJC_IVAR____RTCReportingS_lock] + 16);
  os_unfair_lock_lock(v1);
  sub_1921D69BC(v0);
  os_unfair_lock_unlock(v1);
}

void sub_1921D69BC(char *a1)
{
  uint64_t v1;
  id v3;
  char *v4;
  id v5;
  void *v6;
  _QWORD v7[4];

  v1 = OBJC_IVAR____RTCReportingS_deprecatedPeriodic;
  if (!*(_QWORD *)&a1[OBJC_IVAR____RTCReportingS_deprecatedPeriodic])
  {
    v7[3] = swift_getObjectType();
    v7[0] = a1;
    v3 = objc_allocWithZone((Class)RTCReportingAVCDeprecatedPeriodic);
    v4 = a1;
    v5 = sub_1921D7BCC(v7);
    v6 = *(void **)&a1[v1];
    *(_QWORD *)&a1[v1] = v5;

  }
}

Swift::Void __swiftcall _RTCReportingS.startLogTimer(interval:reportingMultiplier:category:type:)(Swift::Int32 interval, Swift::Int32 reportingMultiplier, Swift::UInt16 category, Swift::UInt16 type)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v7 = *(_QWORD *)&reportingMultiplier;
  v8 = *(_QWORD *)&interval;
  sub_1921D696C();
  v9 = *(void **)(v4 + OBJC_IVAR____RTCReportingS_deprecatedPeriodic);
  if (v9)
    objc_msgSend(v9, sel_startLogTimerWithInterval_reportingMultiplier_category_type_, v8, v7, category, type);
  else
    __break(1u);
}

Swift::Void __swiftcall _RTCReportingS.stopLogTimer()()
{
  uint64_t v0;
  void *v1;

  sub_1921D696C();
  v1 = *(void **)(v0 + OBJC_IVAR____RTCReportingS_deprecatedPeriodic);
  if (v1)
    objc_msgSend(v1, sel_stopLogTimer);
  else
    __break(1u);
}

void _RTCReportingS.registerPeriodicTask(module:needToUpdate:needToReport:serviceBlock:)(uint64_t a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[6];

  sub_1921D696C();
  v11 = *(void **)(v5 + OBJC_IVAR____RTCReportingS_deprecatedPeriodic);
  if (v11)
  {
    v14[4] = a4;
    v14[5] = a5;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 1107296256;
    v14[2] = sub_1921D6C50;
    v14[3] = &block_descriptor_0;
    v12 = _Block_copy(v14);
    v13 = v11;
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_registerPeriodicTaskForModule_needToUpdate_needToReport_serviceBlock_, a1, a2 & 1, a3 & 1, v12);
    _Block_release(v12);

  }
  else
  {
    __break(1u);
  }
}

void sub_1921D6C50(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

Swift::Void __swiftcall _RTCReportingS.unregisterPeriodicTask(module:)(Swift::UInt32 module)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)&module;
  sub_1921D696C();
  v3 = *(void **)(v1 + OBJC_IVAR____RTCReportingS_deprecatedPeriodic);
  if (v3)
    objc_msgSend(v3, sel_unregisterPeriodTaskForModule_, v2);
  else
    __break(1u);
}

uint64_t _s12RTCReporting01_A1SC10uploadFile3URL17completionHandlerSbSo5NSURLC_ySb_So7NSErrorCSgtcSgtF_0(uint64_t a1, void (*a2)(_QWORD, _QWORD))
{
  if (a2)
  {
    swift_retain();
    a2(0, 0);
    OUTLINED_FUNCTION_19_1();
  }
  return OUTLINED_FUNCTION_53_1();
}

void _RTCReportingS.terminateSession(completion:)(uint64_t a1, uint64_t a2)
{
  sub_1921D6F68(a1, a2, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_1921D6FD4);
}

void sub_1921D6F68(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  os_unfair_lock_s *v4;
  uint64_t v8;

  v8 = OUTLINED_FUNCTION_66();
  OUTLINED_FUNCTION_46_1(OBJC_IVAR____RTCReportingS_lock);
  a3(v3, a1, a2, v8);
  os_unfair_lock_unlock(v4);
}

void sub_1921D6FD4(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint8_t *v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;

  v7 = sub_1921DB874();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7348);
  MEMORY[0x1E0C80A78](v11);
  v40 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1[OBJC_IVAR____RTCReportingS_terminated] & 1) != 0)
  {
    v39 = a2;
    if (qword_1ECFD73A0 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v7, (uint64_t)qword_1ECFD7368);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v13, v7);
    v14 = a1;
    v15 = sub_1921DB85C();
    v16 = sub_1921DBA30();
    if (os_log_type_enabled(v15, v16))
    {
      v37 = a3;
      v38 = v3;
      v17 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v42 = v36;
      *(_DWORD *)v17 = 136315138;
      if (*(_QWORD *)&v14[OBJC_IVAR____RTCReportingS_generatedSessionID + 8])
      {
        v18 = *(_QWORD *)&v14[OBJC_IVAR____RTCReportingS_generatedSessionID];
        v19 = *(_QWORD *)&v14[OBJC_IVAR____RTCReportingS_generatedSessionID + 8];
      }
      else
      {
        v19 = 0xE100000000000000;
        v18 = 63;
      }
      swift_bridgeObjectRetain();
      v41 = sub_1921CACB8(v18, v19, &v42);
      sub_1921DBA90();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1921BE000, v15, v16, "attempted to terminate already-ended session %s", v17, 0xCu);
      v32 = v36;
      swift_arrayDestroy();
      MEMORY[0x194024230](v32, -1, -1);
      MEMORY[0x194024230](v17, -1, -1);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      a3 = v37;
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }
    v33 = v39;
    v21 = (uint64_t)v40;
    if (v39)
    {
      swift_retain();
      sub_1921DB9C4();
      v34 = sub_1921DB9DC();
      __swift_storeEnumTagSinglePayload(v21, 0, 1, v34);
      v35 = (_QWORD *)swift_allocObject();
      v35[2] = 0;
      v35[3] = 0;
      v35[4] = v33;
      v35[5] = a3;
      swift_retain();
      sub_1921D4E4C(v21, (uint64_t)&unk_1EE251828, (uint64_t)v35);
      swift_release();
      v31 = v33;
      goto LABEL_20;
    }
  }
  else
  {
    v20 = *(_QWORD *)&a1[OBJC_IVAR____RTCReportingS_session];
    if (v20)
    {
      a1[OBJC_IVAR____RTCReportingS_terminated] = 1;
      swift_retain();
      sub_1921CB1EC();
      v21 = (uint64_t)v40;
      sub_1921DB9C4();
      v22 = sub_1921DB9DC();
      __swift_storeEnumTagSinglePayload(v21, 0, 1, v22);
      v23 = (_QWORD *)swift_allocObject();
      v23[2] = 0;
      v23[3] = 0;
      v23[4] = v20;
      v23[5] = a2;
      v23[6] = a3;
      swift_retain();
      sub_1921CA1B8(a2);
      sub_1921D4E4C(v21, (uint64_t)&unk_1EE251818, (uint64_t)v23);
      swift_release();
      swift_release();
LABEL_21:
      sub_1921C6C0C(v21, &qword_1ECFD7348);
      return;
    }
    if (qword_1ECFD73A0 != -1)
      swift_once();
    __swift_project_value_buffer(v7, (uint64_t)qword_1ECFD7368);
    v24 = sub_1921DB85C();
    v25 = sub_1921DBA30();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = a3;
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_1921BE000, v24, v25, "attempted to terminate session that never started", v27, 2u);
      v28 = v27;
      a3 = v26;
      MEMORY[0x194024230](v28, -1, -1);
    }

    v21 = (uint64_t)v40;
    if (a2)
    {
      swift_retain();
      sub_1921DB9C4();
      v29 = sub_1921DB9DC();
      __swift_storeEnumTagSinglePayload(v21, 0, 1, v29);
      v30 = (_QWORD *)swift_allocObject();
      v30[2] = 0;
      v30[3] = 0;
      v30[4] = a2;
      v30[5] = a3;
      swift_retain();
      sub_1921D4E4C(v21, (uint64_t)&unk_1EE251808, (uint64_t)v30);
      swift_release();
      v31 = a2;
LABEL_20:
      sub_1921C1508(v31);
      goto LABEL_21;
    }
  }
}

uint64_t sub_1921D74D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_1921D74EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = a4;
  *(_QWORD *)(v5 + 24) = a5;
  return swift_task_switch();
}

uint64_t sub_1921D7504()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  return OUTLINED_FUNCTION_25(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1921D752C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v7;

  v6[2] = a5;
  v6[3] = a6;
  v7 = (_QWORD *)swift_task_alloc();
  v6[4] = v7;
  *v7 = v6;
  v7[1] = sub_1921D7578;
  return sub_1921BFFF0();
}

uint64_t sub_1921D7578()
{
  OUTLINED_FUNCTION_47_1();
  swift_task_dealloc();
  OUTLINED_FUNCTION_56_0();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_1921D75B8()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(v0 + 16);
  if (v1)
  {
    v2 = OUTLINED_FUNCTION_70();
    v1(v2);
    OUTLINED_FUNCTION_19_1();
  }
  return OUTLINED_FUNCTION_9_0(*(uint64_t (**)(void))(v0 + 8));
}

void static _RTCReportingS.updateEarlyCacheLimit(newLimit:)(uint64_t a1)
{
  os_unfair_lock_s *v1;

  if (qword_1ECFD7278 != -1)
    swift_once();
  OUTLINED_FUNCTION_90((os_unfair_lock_s *)qword_1ECFD7280);
  sub_1921D76F8(a1);
  OUTLINED_FUNCTION_21_1(v1);
}

void sub_1921D76F8(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  qword_1EE251750 = a1;
  if (qword_1ECFD73A0 != -1)
    swift_once();
  v1 = sub_1921DB874();
  __swift_project_value_buffer(v1, (uint64_t)qword_1ECFD7368);
  v2 = sub_1921DB85C();
  v3 = sub_1921DBA24();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v4 = 134217984;
    sub_1921DBA90();
    _os_log_impl(&dword_1921BE000, v2, v3, "updating eventCache limit to %ld based on client request", v4, 0xCu);
    MEMORY[0x194024230](v4, -1, -1);
  }

}

uint64_t sub_1921D783C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1921D8F40;
  return sub_1921BFFF0();
}

id static _RTCReportingS._privacyLogs()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSString *v4;
  NSString *v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v16[2];

  v16[1] = *(id *)MEMORY[0x1E0C80C00];
  v1 = sub_1921DB7C0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_33();
  MEMORY[0x1E0C80A78](v3);
  v4 = (NSString *)sub_1921DB928();
  v5 = NSHomeDirectoryForUser(v4);

  if (v5)
  {
    sub_1921DB934();

  }
  sub_1921DB790();
  swift_bridgeObjectRelease();
  sub_1921DB7A8();
  v6 = *(void (**)(uint64_t))(v2 + 8);
  v7 = OUTLINED_FUNCTION_38_1();
  v6(v7);
  v8 = sub_1921DB7B4();
  if (v0)
  {

LABEL_8:
    v13 = (id)MEMORY[0x1E0DEE9D8];
    goto LABEL_9;
  }
  if ((v8 & 1) == 0)
    goto LABEL_8;
  v9 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v10 = (void *)sub_1921DB79C();
  v16[0] = 0;
  v11 = objc_msgSend(v9, sel_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_, v10, 0, 0, v16);

  v12 = v16[0];
  if (!v11)
  {
    v13 = v16[0];
    sub_1921DB76C();

    swift_willThrow();
    OUTLINED_FUNCTION_84();
    return v13;
  }
  v13 = (id)sub_1921DB994();
  v14 = v12;

LABEL_9:
  OUTLINED_FUNCTION_84();
  return v13;
}

id _RTCReportingS.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_99(), sel_init);
}

void _RTCReportingS.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1921D7BCC(_QWORD *a1)
{
  void *v1;
  id v3;

  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  v3 = objc_msgSend(v1, sel_initWithSession_, sub_1921DBBB0());
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

uint64_t sub_1921D7C34@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1921D50E4(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1921D7C4C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();

  OUTLINED_FUNCTION_58_0();
  return swift_deallocObject();
}

void sub_1921D7C7C(uint64_t a1)
{
  uint64_t v1;

  sub_1921D5150(a1, *(void (**)(uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_1921D7C88@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1921D5998(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_1921D7CA0()
{
  unint64_t result;

  result = qword_1ECFD6E80;
  if (!qword_1ECFD6E80)
  {
    result = MEMORY[0x1940241A0](&unk_1921DE198, &type metadata for _RTCReportingS.Error);
    atomic_store(result, (unint64_t *)&qword_1ECFD6E80);
  }
  return result;
}

uint64_t sub_1921D7CDC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_58_0();
  return swift_deallocObject();
}

uint64_t method lookup function for _RTCReportingS()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of _RTCReportingS.__allocating_init(sessionInfo:userInfo:frameworksToCheck:aggregationBlock:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t getEnumTagSinglePayload for _RTCReportingS.Error(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for _RTCReportingS.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1921D7DFC + 4 * byte_1921DE075[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1921D7E30 + 4 * byte_1921DE070[v4]))();
}

uint64_t sub_1921D7E30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1921D7E38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1921D7E40);
  return result;
}

uint64_t sub_1921D7E4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1921D7E54);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1921D7E58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1921D7E60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1921D7E6C(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for _RTCReportingS.Error()
{
  return &type metadata for _RTCReportingS.Error;
}

unint64_t sub_1921D7E90()
{
  unint64_t result;

  result = qword_1EE2517D8;
  if (!qword_1EE2517D8)
  {
    result = MEMORY[0x1940241A0](&unk_1921DE170, &type metadata for _RTCReportingS.Error);
    atomic_store(result, &qword_1EE2517D8);
  }
  return result;
}

unint64_t sub_1921D7ECC()
{
  unint64_t result;

  result = qword_1ECFD6E60;
  if (!qword_1ECFD6E60)
  {
    result = MEMORY[0x1940241A0](&unk_1921DE0B8, &type metadata for _RTCReportingS.Error);
    atomic_store(result, (unint64_t *)&qword_1ECFD6E60);
  }
  return result;
}

unint64_t sub_1921D7F08()
{
  unint64_t result;

  result = qword_1ECFD6E68;
  if (!qword_1ECFD6E68)
  {
    result = MEMORY[0x1940241A0](&unk_1921DE0F8, &type metadata for _RTCReportingS.Error);
    atomic_store(result, (unint64_t *)&qword_1ECFD6E68);
  }
  return result;
}

unint64_t sub_1921D7F44()
{
  unint64_t result;

  result = qword_1ECFD6E78;
  if (!qword_1ECFD6E78)
  {
    result = MEMORY[0x1940241A0](MEMORY[0x1E0DEDCB0], MEMORY[0x1E0DEDC60]);
    atomic_store(result, (unint64_t *)&qword_1ECFD6E78);
  }
  return result;
}

uint64_t sub_1921D7F80()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1921D7FA4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1921D7FB0(char a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(v2 + 16) + 16))(*(_QWORD *)(v2 + 16), a1 & 1, a2);
}

uint64_t sub_1921D7FC8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_1921D7FD8(uint64_t a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4, double a5)
{
  uint64_t v5;

  sub_1921D40B8(a1, a2, a3, a4, *(_QWORD *)(v5 + 16), a5);
}

void sub_1921D7FE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1921D37BC(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_1921D7FE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(_QWORD *);
  _QWORD v5[2];

  v3 = *(uint64_t (**)(_QWORD *))(v2 + 16);
  v5[0] = a1;
  v5[1] = a2;
  return v3(v5);
}

void sub_1921D8018(_QWORD *a1)
{
  uint64_t v1;

  (*(void (**)(_QWORD, _QWORD))(v1 + 16))(*a1, a1[1]);
  OUTLINED_FUNCTION_38();
}

uint64_t sub_1921D803C()
{
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_52_1();
  OUTLINED_FUNCTION_58_0();
  return swift_deallocObject();
}

uint64_t sub_1921D805C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = swift_task_alloc();
  v2 = (_QWORD *)OUTLINED_FUNCTION_8_1(v1);
  *v2 = v0;
  v2[1] = sub_1921D8F40;
  return sub_1921D783C();
}

_QWORD *sub_1921D80C4(uint64_t a1, _QWORD *(*a2)(uint64_t *__return_ptr))
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;

  result = a2(&v4);
  if (!v2)
    return (_QWORD *)v4;
  return result;
}

uint64_t sub_1921D80FC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1921D8160;
  return v6(a1);
}

uint64_t sub_1921D8160()
{
  uint64_t v0;

  OUTLINED_FUNCTION_12();
  return OUTLINED_FUNCTION_25(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1921D8188(uint64_t a1, char a2, char a3, char a4, char a5, char a6, char a7)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t result;
  unsigned __int8 v19;
  uint64_t v20;

  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7348);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1921C6C44(a1, (uint64_t)v16, &qword_1ECFD7348);
  v17 = sub_1921DB9DC();
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v17) == 1)
  {
    sub_1921C6C0C((uint64_t)v16, &qword_1ECFD7348);
    result = 0;
    if ((a2 & 1) == 0)
      goto LABEL_3;
  }
  else
  {
    v19 = sub_1921DB9D0();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
    result = v19;
    if ((a2 & 1) == 0)
    {
LABEL_3:
      if ((a3 & 1) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  result |= 0x100uLL;
  if ((a3 & 1) != 0)
  {
LABEL_4:
    result |= 0x400uLL;
    if ((a4 & 1) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  if ((a4 & 1) == 0)
  {
LABEL_5:
    if ((a5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  result |= 0x800uLL;
  if ((a5 & 1) != 0)
LABEL_6:
    result |= 0x1000uLL;
LABEL_7:
  if ((a6 & 1) != 0)
    result |= 0x2000uLL;
  if ((a7 & 1) != 0)
    return result | 0x4000;
  return result;
}

uint64_t sub_1921D82C8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_8_1(v0);
  v2 = OUTLINED_FUNCTION_31_1(v1);
  return OUTLINED_FUNCTION_17_1(v2, v3, v4, v5);
}

uint64_t sub_1921D8310(char a1, int64_t a2, char a3, uint64_t a4)
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
  uint64_t v17;
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
        goto LABEL_24;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD6E58);
  v10 = *(_QWORD *)(type metadata accessor for EventValue() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_24:
    result = sub_1921DBB68();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for EventValue() - 8) + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    sub_1921D8600(a4 + v17, v8, v18);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1921D84E0(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_1921D84E0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(type metadata accessor for EventValue() - 8);
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
  result = sub_1921DBB98();
  __break(1u);
  return result;
}

uint64_t sub_1921D8600(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_1921DBB98();
    __break(1u);
  }
  else if (a3 < a1
         || (result = type metadata accessor for EventValue(),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    type metadata accessor for EventValue();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_1921D8700()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_12_1();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_8_1(v0);
  v2 = OUTLINED_FUNCTION_0_2(v1);
  return sub_1921D74EC(v2, v3, v4, v5, v6);
}

uint64_t sub_1921D8754()
{
  uint64_t v0;

  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_52_1();
  if (*(_QWORD *)(v0 + 40))
    swift_release();
  OUTLINED_FUNCTION_65_0();
  return swift_deallocObject();
}

uint64_t sub_1921D8780()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_68_0();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_8_1(v0);
  v2 = OUTLINED_FUNCTION_18_1(v1);
  return sub_1921D752C(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_1921D87D8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_12_1();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_8_1(v0);
  v2 = OUTLINED_FUNCTION_0_2(v1);
  return sub_1921D74D4(v2, v3, v4, v5, v6);
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1921D8850()
{
  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_52_1();
  swift_release();
  OUTLINED_FUNCTION_65_0();
  return swift_deallocObject();
}

uint64_t sub_1921D8874()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_68_0();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_8_1(v0);
  v2 = OUTLINED_FUNCTION_18_1(v1);
  return sub_1921D64F8(v2, v3, v4, v5, v6, v7);
}

void sub_1921D88C8()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 16))(0);
  OUTLINED_FUNCTION_38();
}

uint64_t sub_1921D88E8()
{
  return swift_release();
}

uint64_t sub_1921D88F0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_22_1();
  OUTLINED_FUNCTION_52_1();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1921D8924(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v9 = *(_QWORD *)(v1 + 56);
  v10 = swift_task_alloc();
  v11 = (_QWORD *)OUTLINED_FUNCTION_8_1(v10);
  *v11 = v2;
  v11[1] = sub_1921D18F0;
  return sub_1921D5DEC(a1, v4, v5, v6, v7, v8, v9);
}

_QWORD *sub_1921D89B4@<X0>(uint64_t a1@<X0>, _QWORD *(*a2)(uint64_t *__return_ptr)@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  _QWORD *result;
  uint64_t v6;

  result = sub_1921D80C4(a1, a2);
  if (!v3)
  {
    *a3 = result;
    a3[1] = v6;
  }
  return result;
}

void sub_1921D89DC()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____RTCReportingS_completelyDisabled) = 1;
}

unint64_t sub_1921D89F4()
{
  unint64_t result;

  result = qword_1EE2514A8;
  if (!qword_1EE2514A8)
  {
    result = MEMORY[0x1940241A0](&unk_1921DE23C, &type metadata for LegacyClientError);
    atomic_store(result, (unint64_t *)&qword_1EE2514A8);
  }
  return result;
}

uint64_t sub_1921D8A34()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_12_1();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_8_1(v0);
  v2 = OUTLINED_FUNCTION_0_2(v1);
  return sub_1921D4188(v2, v3, v4, v5, v6);
}

uint64_t sub_1921D8A8C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_12_1();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_8_1(v0);
  v2 = OUTLINED_FUNCTION_0_2(v1);
  return sub_1921D4310(v2, v3, v4, v5, v6);
}

uint64_t sub_1921D8AE0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_22_1();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (*(_QWORD *)(v0 + 184))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1921D8B48(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;

  v13 = v1[2];
  v4 = v1[4];
  v12 = v1[3];
  v5 = v1[5];
  v6 = v1[6];
  v7 = v1[7];
  v8 = v1[8];
  v9 = swift_task_alloc();
  v10 = (_QWORD *)OUTLINED_FUNCTION_8_1(v9);
  *v10 = v2;
  v10[1] = sub_1921D8F40;
  return sub_1921D4358(a1, v13, v12, v4, v5, v6, v7, v8);
}

uint64_t sub_1921D8C08()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1921D8C2C()
{
  uint64_t v0;

  return sub_1921D4328(*(_QWORD *)(v0 + 16));
}

_BYTE **sub_1921D8C38(_BYTE **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1921D10EC(a1, a2, a3, *(_BYTE *)(v3 + 16));
}

uint64_t sub_1921D8C44()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1921D8C68()
{
  uint64_t v0;

  return sub_1921D10FC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_1921D8C70(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  return sub_1921D111C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t objectdestroy_63Tm()
{
  OUTLINED_FUNCTION_22_1();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1921D8CAC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_12_1();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_8_1(v0);
  v2 = OUTLINED_FUNCTION_0_2(v1);
  return sub_1921D4310(v2, v3, v4, v5, v6);
}

void sub_1921D8D00()
{
  uint64_t v0;

  sub_1921D4864(*(_BYTE **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
}

uint64_t sub_1921D8D28()
{
  uint64_t v0;

  OUTLINED_FUNCTION_22_1();
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_65_0();
  return swift_deallocObject();
}

uint64_t sub_1921D8D50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_1921D8F40;
  *(_OWORD *)(v2 + 72) = v3;
  OUTLINED_FUNCTION_56_0();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_1921D8DA4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_8_1(v0);
  v2 = OUTLINED_FUNCTION_31_1(v1);
  return OUTLINED_FUNCTION_17_1(v2, v3, v4, v5);
}

_QWORD *initializeBufferWithCopyOfBuffer for LegacyClientError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for LegacyClientError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for LegacyClientError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for LegacyClientError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for LegacyClientError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for LegacyClientError(uint64_t result, int a2, int a3)
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

uint64_t OUTLINED_FUNCTION_53_1()
{
  return 0;
}

ValueMetadata *type metadata accessor for LegacyClientError()
{
  return &type metadata for LegacyClientError;
}

uint64_t OUTLINED_FUNCTION_20_1(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_getErrorValue();
}

uint64_t OUTLINED_FUNCTION_40_1()
{
  return sub_1921DBA90();
}

uint64_t OUTLINED_FUNCTION_50_1()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0(v0 - 224);
}

uint64_t OUTLINED_FUNCTION_51_1(uint64_t a1, unint64_t *a2)
{
  return sub_1921C90C0(0, a2);
}

uint64_t OUTLINED_FUNCTION_52_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_57_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

BOOL OUTLINED_FUNCTION_59_0(os_log_type_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_log_t oslog)
{
  return os_log_type_enabled(oslog, a1);
}

uint64_t OUTLINED_FUNCTION_63_0()
{
  return sub_1921DB8B0();
}

BOOL OUTLINED_FUNCTION_64_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_65_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_66()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_67_0()
{
  return sub_1921DBA30();
}

unint64_t OUTLINED_FUNCTION_69_0()
{
  return sub_1921C85A8();
}

void OUTLINED_FUNCTION_70_0()
{
  uint64_t v0;

}

void OUTLINED_FUNCTION_71_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 64) |= v1;
}

uint64_t OUTLINED_FUNCTION_72_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_75_0()
{
  return sub_1921DB85C();
}

void OUTLINED_FUNCTION_77_0()
{
  os_unfair_lock_s *v0;

  os_unfair_lock_unlock(v0);
}

uint64_t OUTLINED_FUNCTION_78_0()
{
  return sub_1921DB85C();
}

uint64_t OUTLINED_FUNCTION_79()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_80@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_81()
{
  uint64_t v0;

  return sub_1921CA1B8(v0);
}

uint64_t *OUTLINED_FUNCTION_82(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return &a9;
}

uint64_t OUTLINED_FUNCTION_83()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_86()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_89(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  return sub_1921CACB8(a1, a2, (uint64_t *)va);
}

void OUTLINED_FUNCTION_90(os_unfair_lock_s *a1@<X8>)
{
  os_unfair_lock_lock(a1 + 4);
}

uint64_t OUTLINED_FUNCTION_91()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_94()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 272);
}

uint64_t OUTLINED_FUNCTION_95()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 240);
}

uint64_t OUTLINED_FUNCTION_96()
{
  return sub_1921DBC1C();
}

uint64_t OUTLINED_FUNCTION_97()
{
  return swift_release();
}

id OUTLINED_FUNCTION_99()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

BOOL static XPCObject.== infix(_:_:)()
{
  void *v0;
  xpc_object_t v1;
  _BOOL8 v2;

  XPCObject.obj.getter();
  XPCObject.obj.getter();
  v0 = (void *)OUTLINED_FUNCTION_37();
  v2 = xpc_equal(v0, v1);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v2;
}

uint64_t RTCXPCDictionary.keys.getter(void *a1)
{
  int64_t count;
  char *v3;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  char *v11;
  _QWORD aBlock[6];
  char *v13;

  count = xpc_dictionary_get_count(a1);
  v3 = (char *)MEMORY[0x1E0DEE9D8];
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || count > *((_QWORD *)v3 + 3) >> 1)
  {
    if (*((_QWORD *)v3 + 2) <= count)
      v5 = count;
    else
      v5 = *((_QWORD *)v3 + 2);
    v3 = sub_1921D9828(isUniquelyReferenced_nonNull_native, v5, 0, v3);
  }
  v13 = v3;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = &v13;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = sub_1921D9930;
  *(_QWORD *)(v7 + 24) = v6;
  aBlock[4] = sub_1921D1F1C;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1921D06EC;
  aBlock[3] = &block_descriptor_1;
  v8 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_dictionary_apply(a1, v8);
  _Block_release(v8);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = OUTLINED_FUNCTION_55();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v11 = v13;
    swift_release();
    return (uint64_t)v11;
  }
  return result;
}

uint64_t sub_1921D9404(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = sub_1921DB970();
  v6 = v5;
  sub_1921D9E90();
  v7 = *(char **)(*a3 + 16);
  sub_1921D9ED8(v7);
  v8 = *a3;
  *(_QWORD *)(v8 + 16) = v7 + 1;
  v9 = v8 + 16 * (_QWORD)v7;
  *(_QWORD *)(v9 + 32) = v4;
  *(_QWORD *)(v9 + 40) = v6;
  return 1;
}

void (*RTCXPCDictionary.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1, char a2)
{
  uint64_t v3;
  _QWORD *v7;
  size_t v8;
  void *v9;
  uint64_t v10;
  xpc_object_t v11;

  v7 = malloc(0x28uLL);
  *a1 = v7;
  v7[1] = a3;
  v7[2] = v3;
  *v7 = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72F0) - 8) + 64);
  v7[3] = malloc(v8);
  v9 = malloc(v8);
  v7[4] = v9;
  OUTLINED_FUNCTION_37();
  v10 = sub_1921DB94C();
  v11 = OUTLINED_FUNCTION_15_2(v10);
  swift_release();
  XPCObject.init(_:)(v11, (uint64_t)v9);
  return sub_1921D951C;
}

void sub_1921D951C(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 24);
  v4 = *(void **)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    sub_1921C7E34(*(_QWORD *)(*(_QWORD *)a1 + 32), (uint64_t)v3, (uint64_t *)&unk_1ECFD72F0);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10_2((uint64_t)v3);
    sub_1921C7DF8((uint64_t)v4, (uint64_t *)&unk_1ECFD72F0);
  }
  else
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_10_2((uint64_t)v4);
  }
  free(v4);
  free(v3);
  free(v2);
}

Swift::Bool __swiftcall RTCXPCDictionary.contains(key:)(Swift::String key)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  xpc_object_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72F0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_10();
  v4 = v3 - v2;
  v5 = OUTLINED_FUNCTION_13_2();
  v6 = OUTLINED_FUNCTION_15_2(v5);
  OUTLINED_FUNCTION_55();
  XPCObject.init(_:)(v6, v4);
  v7 = OUTLINED_FUNCTION_63();
  LOBYTE(v6) = __swift_getEnumTagSinglePayload(v4, 1, v7) != 1;
  sub_1921C7DF8(v4, (uint64_t *)&unk_1ECFD72F0);
  return (char)v6;
}

xpc_object_t sub_1921D9674@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  xpc_object_t result;

  result = RTCXPCDictionary.init(dictionaryLiteral:)(a1);
  *a2 = result;
  return result;
}

xpc_object_t sub_1921D9698(uint64_t a1, uint64_t a2)
{
  uint64_t bytes;
  __int16 v4;
  char v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  bytes = a1;
  v4 = a2;
  v5 = BYTE2(a2);
  v6 = BYTE3(a2);
  v7 = BYTE4(a2);
  v8 = BYTE5(a2);
  return xpc_data_create(&bytes, BYTE6(a2));
}

char *sub_1921D9760(uint64_t a1, uint64_t a2)
{
  char *result;
  char *v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  size_t v10;

  result = (char *)sub_1921DB718();
  v5 = result;
  if (result)
  {
    result = (char *)sub_1921DB730();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v5 += a1 - (_QWORD)result;
  }
  v6 = __OFSUB__(a2, a1);
  v7 = a2 - a1;
  if (v6)
  {
    __break(1u);
    goto LABEL_13;
  }
  v8 = sub_1921DB724();
  if (v8 >= v7)
    v9 = v7;
  else
    v9 = v8;
  if (v5)
    v10 = v9;
  else
    v10 = 0;
  return (char *)xpc_data_create(v5, v10);
}

uint64_t sub_1921D97E4(uint64_t a1, unint64_t a2)
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

char *sub_1921D9828(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE2518B8);
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
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1921D9924()
{
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_1921D9930(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1921D9404(a1, a2, *(uint64_t **)(v2 + 16));
}

uint64_t sub_1921D9938()
{
  return OUTLINED_FUNCTION_2();
}

uint64_t *initializeBufferWithCopyOfBuffer for XPCObject(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
        *a1 = *a2;
        swift_unknownObjectRetain();
        goto LABEL_9;
      case 7u:
        v9 = *a2;
        v8 = a2[1];
        sub_1921D9AE0(v9, v8);
        *a1 = v9;
        a1[1] = v8;
        goto LABEL_9;
      case 8u:
        v10 = a2[1];
        *a1 = *a2;
        a1[1] = v10;
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 9u:
        v11 = sub_1921DB850();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_1921D9AE0(uint64_t a1, unint64_t a2)
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

uint64_t *assignWithCopy for XPCObject(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_1921C7B34((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 0xAu:
      case 0xBu:
      case 0xCu:
        *a1 = *a2;
        swift_unknownObjectRetain();
        goto LABEL_8;
      case 7u:
        v7 = *a2;
        v6 = a2[1];
        sub_1921D9AE0(v7, v6);
        *a1 = v7;
        a1[1] = v6;
        goto LABEL_8;
      case 8u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 9u:
        v8 = sub_1921DB850();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
LABEL_8:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

void *initializeWithTake for XPCObject(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 9)
  {
    v6 = sub_1921DB850();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for XPCObject(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_1921C7B34((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 9)
    {
      v6 = sub_1921DB850();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1921D9DD8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1921DB850();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for RTCXPCDictionary()
{
  return &type metadata for RTCXPCDictionary;
}

char *sub_1921D9E90()
{
  char **v0;
  char *v1;
  char *result;

  v1 = *v0;
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)result)
  {
    result = sub_1921D9828(result, *((_QWORD *)v1 + 2) + 1, 1, v1);
    *v0 = result;
  }
  return result;
}

char *sub_1921D9ED8(char *result)
{
  char **v1;
  unint64_t v2;

  v2 = *((_QWORD *)*v1 + 3);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    result = sub_1921D9828((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *v1 = result;
  }
  return result;
}

void static MessageKeys.clientName.getter()
{
  OUTLINED_FUNCTION_0_4();
}

void static MessageKeys.serviceName.getter()
{
  OUTLINED_FUNCTION_0_4();
}

void static MessageKeys.clientType.getter()
{
  OUTLINED_FUNCTION_0_4();
}

void static MessageKeys.legacyClient.getter()
{
  OUTLINED_FUNCTION_0_4();
}

void static MessageKeys.payload.getter()
{
  OUTLINED_FUNCTION_0_4();
}

void static MessageKeys.sessionID.getter()
{
  OUTLINED_FUNCTION_0_4();
}

void static MessageKeys.realtime.getter()
{
  OUTLINED_FUNCTION_0_4();
}

void static MessageKeys.hierarchyLevel.getter()
{
  OUTLINED_FUNCTION_1_3();
}

void static MessageKeys.hierarchyToken.getter()
{
  OUTLINED_FUNCTION_1_3();
}

const char *MessageKeys.samplingUUID.unsafeMutableAddressor()
{
  return "suuid";
}

uint64_t static MessageKeys.samplingUUID.getter()
{
  return 0x6469757573;
}

const char *MessageKeys.eager.unsafeMutableAddressor()
{
  return "eager";
}

uint64_t static MessageKeys.eager.getter()
{
  return 0x7265676165;
}

uint64_t static MessageKeys.allowed.getter()
{
  return 0x6465776F6C6C61;
}

uint64_t static MessageKeys.denied.getter()
{
  return 0x6465696E6564;
}

const char *MessageKeys.overrideSampling.unsafeMutableAddressor()
{
  return "orsf";
}

void static MessageKeys.overrideSampling.getter()
{
  OUTLINED_FUNCTION_1_3();
}

ValueMetadata *type metadata accessor for MessageKeys()
{
  return &type metadata for MessageKeys;
}

uint64_t XPCError.description.getter(void *a1)
{
  if (xpc_dictionary_get_string(a1, "XPCErrorDescription"))
    return sub_1921DB970();
  else
    return OUTLINED_FUNCTION_1_4();
}

uint64_t XPCError.errorDescription.getter(void *a1)
{
  if (xpc_dictionary_get_string(a1, "XPCErrorDescription"))
    return sub_1921DB970();
  else
    return OUTLINED_FUNCTION_1_4();
}

uint64_t sub_1921DA050()
{
  void **v0;

  return XPCError.errorDescription.getter(*v0);
}

uint64_t sub_1921DA058()
{
  void **v0;

  return XPCError.description.getter(*v0);
}

uint64_t XPCIncomingConnection.auditToken.getter()
{
  xpc_connection_get_audit_token();
  return 0;
}

void *XPCIncomingConnection.entitlementValue(forKey:)@<X0>(uint64_t a1@<X8>)
{
  void *v2;

  sub_1921DB94C();
  v2 = (void *)xpc_connection_copy_entitlement_value();
  swift_release();
  return XPCObject.init(_:)(v2, a1);
}

void XPCIncomingConnection.makeConnection(targetQ:delegate:)(void *a1, uint64_t a2, uint64_t a3, _xpc_connection_s *a4)
{
  type metadata accessor for XPCConnection();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_6_3();
  swift_unknownObjectRetain();
  XPCConnection.init(conn:targetQ:delegate:)(a4, a1, a2, a3);
  OUTLINED_FUNCTION_13();
}

void XPCConnection.__allocating_init(conn:targetQ:delegate:)(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4)
{
  OUTLINED_FUNCTION_2_3();
  XPCConnection.init(conn:targetQ:delegate:)(a1, a2, a3, a4);
  OUTLINED_FUNCTION_13();
}

uint64_t type metadata accessor for XPCConnection()
{
  return objc_opt_self();
}

uint64_t XPCConnection.conn.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t XPCConnection.delegate.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x1940242D8](v0 + 24);
}

uint64_t XPCConnection.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  OUTLINED_FUNCTION_0_5();
  *(_QWORD *)(v2 + 32) = a2;
  swift_unknownObjectWeakAssign();
  return OUTLINED_FUNCTION_5_3();
}

void (*XPCConnection.delegate.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x1940242D8](v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  v3[3] = v4;
  v3[4] = v5;
  return sub_1921DA2F4;
}

void sub_1921DA2F4(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 32) = *(_QWORD *)(*(_QWORD *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t XPCConnection.__allocating_init(machService:targetQ:listen:delegate:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;

  v12 = OUTLINED_FUNCTION_2_3();
  XPCConnection.init(machService:targetQ:listen:delegate:)(a1, a2, a3, a4, a5, a6);
  return v12;
}

_QWORD *XPCConnection.init(machService:targetQ:listen:delegate:)(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _xpc_connection_s *mach_service;
  NSObject *v14;
  _xpc_connection_s *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6[4] = 0;
  swift_unknownObjectWeakInit();
  if ((a4 & 1) != 0)
    v10 = 1;
  else
    v10 = 2;
  v11 = sub_1921DB94C();
  v12 = a3;
  swift_bridgeObjectRelease();
  mach_service = xpc_connection_create_mach_service((const char *)(v11 + 32), v12, v10);

  swift_release();
  OUTLINED_FUNCTION_0_5();
  v6[4] = a6;
  swift_unknownObjectWeakAssign();
  v6[2] = mach_service;
  v6[5] = v12;
  v14 = v12;
  v15 = (_xpc_connection_s *)OUTLINED_FUNCTION_6_3();
  xpc_connection_set_target_queue(v15, v14);
  OUTLINED_FUNCTION_9_1((uint64_t)sub_1921C18C4, v17, MEMORY[0x1E0C809B0], 1107296256, v18, v19);
  OUTLINED_FUNCTION_4_2();
  swift_release();
  OUTLINED_FUNCTION_7_2();
  _Block_release(v12);
  xpc_connection_activate(mach_service);
  OUTLINED_FUNCTION_5_3();

  OUTLINED_FUNCTION_47();
  return v6;
}

uint64_t sub_1921DA528(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;

  swift_beginAccess();
  result = MEMORY[0x1940242D8](v1 + 24);
  if (result)
  {
    v4 = *(_QWORD *)(v1 + 32);
    v5 = MEMORY[0x194024464](a1);
    v6 = MEMORY[0x1E0C81310];
    ObjectType = swift_getObjectType();
    v8 = 16;
    if (v5 == v6)
      v8 = 8;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + v8))(a1, ObjectType, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

_QWORD *XPCConnection.init(conn:targetQ:delegate:)(_xpc_connection_s *a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  NSObject *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4[4] = 0;
  swift_unknownObjectWeakInit();
  v4[2] = a1;
  OUTLINED_FUNCTION_0_5();
  v4[4] = a4;
  swift_unknownObjectWeakAssign();
  v4[5] = a2;
  OUTLINED_FUNCTION_6_3();
  v8 = a2;
  xpc_connection_set_target_queue(a1, v8);
  OUTLINED_FUNCTION_9_1((uint64_t)sub_1921C18C4, v10, MEMORY[0x1E0C809B0], 1107296256, v11, v12);
  OUTLINED_FUNCTION_4_2();
  swift_release();
  OUTLINED_FUNCTION_7_2();
  _Block_release(a2);
  xpc_connection_activate(a1);
  OUTLINED_FUNCTION_5_3();

  OUTLINED_FUNCTION_47();
  return v4;
}

void XPCConnection.send(_:)(xpc_object_t message)
{
  uint64_t v1;

  xpc_connection_send_message(*(xpc_connection_t *)(v1 + 16), message);
}

uint64_t sub_1921DA6F8()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1921DA704()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Bool __swiftcall OS_xpc_object.isError()()
{
  return MEMORY[0x194024464]() == MEMORY[0x1E0C81310];
}

uint64_t XPCConnection.auditToken.getter()
{
  xpc_connection_get_audit_token();
  return 0;
}

uint64_t XPCConnection.remoteUID.getter()
{
  uint64_t v0;

  return xpc_connection_get_euid(*(xpc_connection_t *)(v0 + 16));
}

uint64_t XPCConnection.deinit()
{
  uint64_t v0;

  xpc_connection_cancel(*(xpc_connection_t *)(v0 + 16));
  OUTLINED_FUNCTION_47();
  sub_1921C07DC(v0 + 24);

  return v0;
}

uint64_t XPCConnection.__deallocating_deinit()
{
  XPCConnection.deinit();
  return swift_deallocClassInstance();
}

Swift::OpaquePointer __swiftcall OS_xpc_object.type()()
{
  JUMPOUT(0x194024464);
}

unint64_t sub_1921DA830()
{
  unint64_t result;

  result = qword_1ECFD7208;
  if (!qword_1ECFD7208)
  {
    result = MEMORY[0x1940241A0](&protocol conformance descriptor for XPCError, &type metadata for XPCError);
    atomic_store(result, (unint64_t *)&qword_1ECFD7208);
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCError()
{
  return &type metadata for XPCError;
}

ValueMetadata *type metadata accessor for XPCIncomingConnection()
{
  return &type metadata for XPCIncomingConnection;
}

uint64_t sub_1921DA88C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFD7298);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

RTCUtility::XPCMessage::MessageType_optional __swiftcall XPCMessage.MessageType.init(rawValue:)(Swift::Int64 rawValue)
{
  if ((unint64_t)rawValue >= 5)
    LOBYTE(rawValue) = 5;
  return (RTCUtility::XPCMessage::MessageType_optional)rawValue;
}

uint64_t XPCMessage.MessageType.rawValue.getter(uint64_t result)
{
  return result;
}

uint64_t sub_1921DA91C()
{
  return sub_1921DA924();
}

uint64_t sub_1921DA924()
{
  sub_1921DBC64();
  sub_1921DBC7C();
  return sub_1921DBC88();
}

uint64_t sub_1921DA968()
{
  return sub_1921DA970();
}

uint64_t sub_1921DA970()
{
  return sub_1921DBC7C();
}

uint64_t sub_1921DA994()
{
  return sub_1921DA99C();
}

uint64_t sub_1921DA99C()
{
  sub_1921DBC64();
  sub_1921DBC7C();
  return sub_1921DBC88();
}

RTCUtility::XPCMessage::MessageType_optional sub_1921DA9DC@<W0>(Swift::Int64 *a1@<X0>, RTCUtility::XPCMessage::MessageType_optional *a2@<X8>)
{
  RTCUtility::XPCMessage::MessageType_optional result;

  result.value = XPCMessage.MessageType.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_1921DAA04@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;

  result = XPCMessage.MessageType.rawValue.getter(*v1);
  *a1 = result;
  return result;
}

uint64_t XPCMessage.ty.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

void XPCMessage.init(fromXPC:)()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72F0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v0);
  OUTLINED_FUNCTION_10();
  swift_getObjectType();
  OS_xpc_object.type()();
}

uint64_t sub_1921DAA80(uint64_t a1)
{
  Swift::Int64 *v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;

  if (a1 == MEMORY[0x1E0C812F8])
  {
    v3 = (void *)swift_unknownObjectRetain();
    v4 = xpc_dictionary_get_value(v3, "type");
    XPCObject.init(_:)(v4, (uint64_t)v1);
    OUTLINED_FUNCTION_3_3();
    v5 = OUTLINED_FUNCTION_63();
    if (__swift_getEnumTagSinglePayload((uint64_t)v1, 1, v5) == 1)
    {
      OUTLINED_FUNCTION_3_3();
      sub_1921CBE80((uint64_t)v1);
      return 0;
    }
    if (swift_getEnumCaseMultiPayload() != 3)
    {
      OUTLINED_FUNCTION_3_3();
      sub_1921C7B34((uint64_t)v1);
      return 0;
    }
    if (XPCMessage.MessageType.init(rawValue:)(*v1).value != RTCUtility_XPCMessage_MessageType_unknownDefault)
      return v2;
  }
  OUTLINED_FUNCTION_3_3();
  return 0;
}

uint64_t XPCMessage.description.getter(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  xpc_object_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  void *v33;
  uint64_t v34;

  v34 = OUTLINED_FUNCTION_63();
  MEMORY[0x1E0C80A78](v34);
  OUTLINED_FUNCTION_10();
  isUniquelyReferenced_nonNull_native = v3 - v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFD72F0);
  OUTLINED_FUNCTION_3_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_10();
  v8 = v7 - v6;
  sub_1921DBB38();
  sub_1921DB964();
  v33 = a1;
  v9 = RTCXPCDictionary.keys.getter(a1);
  v10 = *(_QWORD *)(v9 + 16);
  if (v10)
  {
    v11 = (uint64_t *)(v9 + 40);
    v12 = MEMORY[0x1E0DEE9E0];
    v32 = v8;
    while (1)
    {
      v14 = *(v11 - 1);
      v13 = *v11;
      v15 = (const char *)(sub_1921DB94C() + 32);
      swift_bridgeObjectRetain();
      v16 = xpc_dictionary_get_value(v33, v15);
      swift_release();
      XPCObject.init(_:)(v16, v8);
      if (__swift_getEnumTagSinglePayload(v8, 1, v34) == 1)
        break;
      sub_1921C93BC(v8, isUniquelyReferenced_nonNull_native);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v17 = OUTLINED_FUNCTION_4_3();
      if (__OFADD__(*(_QWORD *)(v12 + 16), (v18 & 1) == 0))
      {
        __break(1u);
LABEL_15:
        __break(1u);
        break;
      }
      v19 = v17;
      v20 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE2518C8);
      if ((sub_1921DBB44() & 1) != 0)
      {
        v21 = OUTLINED_FUNCTION_4_3();
        if ((v20 & 1) != (v22 & 1))
          goto LABEL_17;
        v19 = v21;
      }
      if ((v20 & 1) != 0)
      {
        v23 = OUTLINED_FUNCTION_0_6();
        sub_1921DAE4C(v23, v24);
      }
      else
      {
        *(_QWORD *)(v12 + 8 * (v19 >> 6) + 64) |= 1 << v19;
        v25 = (_QWORD *)(*(_QWORD *)(v12 + 48) + 16 * v19);
        *v25 = v14;
        v25[1] = v13;
        v26 = OUTLINED_FUNCTION_0_6();
        sub_1921C93BC(v26, v27);
        v28 = *(_QWORD *)(v12 + 16);
        v29 = __OFADD__(v28, 1);
        v30 = v28 + 1;
        if (v29)
          goto LABEL_15;
        *(_QWORD *)(v12 + 16) = v30;
        swift_bridgeObjectRetain();
      }
      v11 += 2;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      --v10;
      v8 = v32;
      if (!v10)
        goto LABEL_13;
    }
    __break(1u);
LABEL_17:
    result = sub_1921DBBF8();
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    sub_1921DB8D4();
    swift_bridgeObjectRelease();
    sub_1921DB964();
    swift_bridgeObjectRelease();
    sub_1921DB964();
    return 0;
  }
  return result;
}

uint64_t sub_1921DAE40()
{
  void **v0;

  return XPCMessage.description.getter(*v0);
}

uint64_t sub_1921DAE4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for XPCObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_1921DAE94()
{
  unint64_t result;

  result = qword_1EE2518D0;
  if (!qword_1EE2518D0)
  {
    result = MEMORY[0x1940241A0](&protocol conformance descriptor for XPCMessage.MessageType, &type metadata for XPCMessage.MessageType);
    atomic_store(result, (unint64_t *)&qword_1EE2518D0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for XPCMessage(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for XPCMessage()
{
  return swift_unknownObjectRelease();
}

uint64_t assignWithCopy for XPCMessage(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for XPCMessage(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRelease();
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

ValueMetadata *type metadata accessor for XPCMessage()
{
  return &type metadata for XPCMessage;
}

uint64_t getEnumTagSinglePayload for XPCMessage.MessageType(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFC)
  {
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
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCMessage.MessageType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1921DB078 + 4 * byte_1921DE61D[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1921DB0AC + 4 * byte_1921DE618[v4]))();
}

uint64_t sub_1921DB0AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1921DB0B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1921DB0BCLL);
  return result;
}

uint64_t sub_1921DB0C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1921DB0D0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1921DB0D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1921DB0DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for XPCMessage.MessageType()
{
  return &type metadata for XPCMessage.MessageType;
}

void __createAWDAdaptorInstance_block_invoke_cold_1(os_log_t log)
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = CFSTR("/System/Library/PrivateFrameworks/AVConference.framework/Frameworks/GKSPerformance.framework");
  _os_log_error_impl(&dword_1921BE000, log, OS_LOG_TYPE_ERROR, "invokeAWDAdaptorForReporter unable to find AWDAdaptor at %@", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_3();
}

uint64_t sub_1921DB70C()
{
  return MEMORY[0x1E0CAE700]();
}

uint64_t sub_1921DB718()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1921DB724()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1921DB730()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1921DB73C()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1921DB748()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1921DB754()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1921DB760()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1921DB76C()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1921DB778()
{
  return MEMORY[0x1E0CAFB50]();
}

uint64_t sub_1921DB784()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1921DB790()
{
  return MEMORY[0x1E0CAFDD8]();
}

uint64_t sub_1921DB79C()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1921DB7A8()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t sub_1921DB7B4()
{
  return MEMORY[0x1E0CAFEA8]();
}

uint64_t sub_1921DB7C0()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1921DB7CC()
{
  return MEMORY[0x1E0CB0248]();
}

uint64_t sub_1921DB7D8()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1921DB7E4()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1921DB7F0()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1921DB7FC()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1921DB808()
{
  return MEMORY[0x1E0CB0828]();
}

uint64_t sub_1921DB814()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1921DB820()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1921DB82C()
{
  return MEMORY[0x1E0CB0970]();
}

uint64_t sub_1921DB838()
{
  return MEMORY[0x1E0CB0978]();
}

uint64_t sub_1921DB844()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1921DB850()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1921DB85C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1921DB868()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1921DB874()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1921DB880()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1921DB88C()
{
  return MEMORY[0x1E0DEF570]();
}

uint64_t sub_1921DB898()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1921DB8A4()
{
  return MEMORY[0x1E0DE9DF0]();
}

uint64_t sub_1921DB8B0()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1921DB8BC()
{
  return MEMORY[0x1E0CB17E8]();
}

uint64_t sub_1921DB8C8()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1921DB8D4()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1921DB8E0()
{
  return MEMORY[0x1E0DE9E58]();
}

uint64_t sub_1921DB8EC()
{
  return MEMORY[0x1E0DE9E60]();
}

uint64_t sub_1921DB8F8()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1921DB904()
{
  return MEMORY[0x1E0DEA3B8]();
}

uint64_t sub_1921DB910()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1921DB91C()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_1921DB928()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1921DB934()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1921DB940()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1921DB94C()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1921DB958()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1921DB964()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1921DB970()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1921DB97C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1921DB988()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1921DB994()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1921DB9A0()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1921DB9AC()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1921DB9B8()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1921DB9C4()
{
  return MEMORY[0x1E0DF06F8]();
}

uint64_t sub_1921DB9D0()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1921DB9DC()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1921DB9E8()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_1921DB9F4()
{
  return MEMORY[0x1E0DF0878]();
}

uint64_t sub_1921DBA00()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1921DBA0C()
{
  return MEMORY[0x1E0CB1CB0]();
}

uint64_t sub_1921DBA18()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1921DBA24()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1921DBA30()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1921DBA3C()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1921DBA48()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1921DBA54()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1921DBA60()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1921DBA6C()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1921DBA78()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1921DBA84()
{
  return MEMORY[0x1E0CB1FF0]();
}

uint64_t sub_1921DBA90()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1921DBA9C()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1921DBAA8()
{
  return MEMORY[0x1E0DEBD70]();
}

uint64_t sub_1921DBAB4()
{
  return MEMORY[0x1E0DEBDF8]();
}

uint64_t sub_1921DBAC0()
{
  return MEMORY[0x1E0DEBE00]();
}

uint64_t sub_1921DBACC()
{
  return MEMORY[0x1E0DEBE10]();
}

uint64_t sub_1921DBAD8()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1921DBAE4()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1921DBAF0()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1921DBAFC()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1921DBB08()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1921DBB14()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1921DBB20()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1921DBB2C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1921DBB38()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1921DBB44()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1921DBB50()
{
  return MEMORY[0x1E0DECAF8]();
}

uint64_t sub_1921DBB5C()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1921DBB68()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1921DBB74()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1921DBB80()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1921DBB8C()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1921DBB98()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1921DBBA4()
{
  return MEMORY[0x1E0DED5C0]();
}

uint64_t sub_1921DBBB0()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1921DBBBC()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1921DBBC8()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1921DBBD4()
{
  return MEMORY[0x1E0DED9E8]();
}

uint64_t sub_1921DBBE0()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1921DBBEC()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1921DBBF8()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1921DBC04()
{
  return MEMORY[0x1E0CB2620]();
}

uint64_t sub_1921DBC10()
{
  return MEMORY[0x1E0CB2640]();
}

uint64_t sub_1921DBC1C()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1921DBC28()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1921DBC34()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1921DBC40()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1921DBC4C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1921DBC58()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1921DBC64()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1921DBC70()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1921DBC7C()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1921DBC88()
{
  return MEMORY[0x1E0DEDF40]();
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1E0CB2C08](userName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE20]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C85E10]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x1E0C85F78]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

uid_t xpc_connection_get_euid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C85FF0](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

xpc_object_t xpc_date_create(int64_t interval)
{
  return (xpc_object_t)MEMORY[0x1E0C861B8](interval);
}

int64_t xpc_date_get_value(xpc_object_t xdate)
{
  return MEMORY[0x1E0C861D0](xdate);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1E0C863D0](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86628]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C867B0](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1E0C867E0](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1E0C867F8](xuuid);
}

