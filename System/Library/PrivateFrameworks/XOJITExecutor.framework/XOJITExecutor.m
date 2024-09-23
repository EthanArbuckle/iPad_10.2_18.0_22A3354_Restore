__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24B2B9134(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24B2B9154(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for orc_rt_CWrapperFunctionResult(uint64_t a1)
{
  sub_24B2B91F4(a1, &qword_257966E28);
}

void sub_24B2B9190()
{
  qword_257967218 = MEMORY[0x24BDACF78];
}

void sub_24B2B91A4()
{
  qword_257967220 = MEMORY[0x24BDACF90];
}

void sub_24B2B91B8()
{
  qword_257967228 = MEMORY[0x24BDACFA0];
}

void sub_24B2B91CC()
{
  qword_257967230 = MEMORY[0x24BDACFF8];
}

void type metadata accessor for orc_rt_CWrapperFunctionResultDataUnion(uint64_t a1)
{
  sub_24B2B91F4(a1, (unint64_t *)&unk_257966E30);
}

void sub_24B2B91F4(uint64_t a1, unint64_t *a2)
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

uint64_t XOJITExecutor.JITDylibHandle.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t XOJITExecutor.JITDylibHandle.rawValue.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*XOJITExecutor.JITDylibHandle.rawValue.modify())()
{
  return nullsub_1;
}

BOOL static XOJITExecutor.JITDylibHandle.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

BOOL static XOJITExecutor.TerminationResult.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void XOJITExecutor.TerminationResult.hash(into:)()
{
  sub_24B2C2E8C();
  OUTLINED_FUNCTION_30();
}

uint64_t XOJITExecutor.TerminationResult.hashValue.getter()
{
  sub_24B2C2E80();
  sub_24B2C2E8C();
  return sub_24B2C2E98();
}

uint64_t sub_24B2B92FC()
{
  sub_24B2C2E80();
  sub_24B2C2E8C();
  return sub_24B2C2E98();
}

uint64_t sub_24B2B933C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_22();
  return swift_deallocClassInstance();
}

uint64_t sub_24B2B9358()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0;
  *(_BYTE *)(v0 + 32) = 1;
  *(_QWORD *)(v0 + 40) = OUTLINED_FUNCTION_27();
  return v0;
}

uint64_t sub_24B2B9380()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_24B2B93A4()
{
  sub_24B2B9380();
  return swift_deallocClassInstance();
}

void sub_24B2B93C4()
{
  uint64_t v0;
  dispatch_semaphore_t v1;

  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  *(_BYTE *)(v0 + 40) = 1;
  v1 = OUTLINED_FUNCTION_27();
  *(_QWORD *)(v0 + 56) = 0;
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 48) = v1;
  *(_BYTE *)(v0 + 72) = 1;
  *(_QWORD *)(v0 + 80) = OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_30();
}

uint64_t sub_24B2B9404()
{
  uint64_t v0;

  v0 = sub_24B2C2CE8();
  __swift_allocate_value_buffer(v0, qword_257967238);
  __swift_project_value_buffer(v0, (uint64_t)qword_257967238);
  return sub_24B2C2CDC();
}

void XOJITExecutor.__allocating_init(connection:)(uint64_t a1)
{
  OUTLINED_FUNCTION_7();
  XOJITExecutor.init(connection:)(a1);
  OUTLINED_FUNCTION_30();
}

void XOJITExecutor.init(connection:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;

  v2 = v1;
  sub_24B2C2DC0();
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_20();
  sub_24B2C2DB4();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_44();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_25();
  *(_QWORD *)(v2 + 16) = 0;
  sub_24B2B9868();
  OUTLINED_FUNCTION_38();
  sub_24B2BC6D0(&qword_257966EA8, v3, MEMORY[0x24BEE5698]);
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_51(&qword_257966EB8);
  sub_24B2C2E20();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_15();
  *(_QWORD *)(v2 + 24) = sub_24B2C2DF0();
  sub_24B2C2DA8();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_15();
  *(_QWORD *)(v2 + 32) = sub_24B2C2DF0();
  *(_QWORD *)(v2 + 40) = dispatch_group_create();
  OUTLINED_FUNCTION_38();
  sub_24B2C2E20();
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_15();
  *(_QWORD *)(v2 + 48) = sub_24B2C2DF0();
  type metadata accessor for XOJITExecutor.ActiveRunWrapper();
  *(_QWORD *)(v2 + 56) = sub_24B2C2D54();
  *(_QWORD *)(v2 + 64) = 0;
  *(_QWORD *)(v2 + 72) = 0;
  *(_QWORD *)(v2 + 80) = 0;
  *(_QWORD *)(v2 + 88) = OUTLINED_FUNCTION_27();
  *(_WORD *)(v2 + 112) = 0;
  type metadata accessor for XOJITExecutor.ActiveRunProgram();
  v4 = OUTLINED_FUNCTION_7();
  sub_24B2B93C4();
  *(_QWORD *)(v2 + 120) = v4;
  *(_QWORD *)(v2 + 16) = a1;
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_13();
  xojit_xpcmemmgr_create();
  *(_QWORD *)(v2 + 96) = v5;
  xojit_dylibmgr_create();
  *(_QWORD *)(v2 + 104) = v6;
  v7 = *(_xpc_connection_s **)(v2 + 16);
  if (!v7)
  {
    __break(1u);
    goto LABEL_9;
  }
  xpc_connection_set_target_queue(v7, *(dispatch_queue_t *)(v2 + 24));
  v8 = *(_xpc_connection_s **)(v2 + 16);
  if (!v8)
  {
LABEL_9:
    __break(1u);
    return;
  }
  v9 = OUTLINED_FUNCTION_47((uint64_t)sub_24B2B9ABC);
  swift_unknownObjectRetain();
  OUTLINED_FUNCTION_24();
  swift_release();
  xpc_connection_set_event_handler(v8, v9);
  _Block_release(v9);
  OUTLINED_FUNCTION_13();
  if (qword_257966DF0 != -1)
    swift_once();
  v10 = OUTLINED_FUNCTION_26();
  __swift_project_value_buffer(v10, (uint64_t)qword_257967238);
  v11 = OUTLINED_FUNCTION_49();
  v12 = sub_24B2C2D90();
  if (OUTLINED_FUNCTION_29(v12))
  {
    v13 = (uint8_t *)OUTLINED_FUNCTION_3();
    *(_WORD *)v13 = 0;
    OUTLINED_FUNCTION_14(&dword_24B2B8000, v11, (os_log_type_t)v9, "----- created instance -----", v13);
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_6();
}

unint64_t sub_24B2B9868()
{
  unint64_t result;

  result = qword_257966EA0;
  if (!qword_257966EA0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257966EA0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD1C19C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD1C1A8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for XOJITExecutor.ActiveRunWrapper()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for XOJITExecutor.ActiveRunProgram()
{
  return objc_opt_self();
}

_xpc_connection_s *sub_24B2B996C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  _xpc_connection_s *result;
  uint64_t v5;
  char v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v3 = MEMORY[0x24BD1C2F8]();
  if (qword_257966DE0 != -1)
    swift_once();
  if (qword_257967228 != v3)
  {
    v13 = 2;
    return (_xpc_connection_s *)sub_24B2BA16C(&v13);
  }
  swift_unknownObjectRetain();
  v5 = sub_24B2BA4DC(6516847, 0xE300000000000000, a1);
  if ((v6 & 1) == 0 && v5 <= 1)
  {
    if (v5)
    {
      sub_24B2BA744(a1);
      if (v8)
      {
        swift_bridgeObjectRelease();
        result = *(_xpc_connection_s **)(v1 + 16);
        if (result)
        {
          xpc_connection_cancel(result);
          v11 = 1;
          v7 = &v11;
          goto LABEL_9;
        }
        goto LABEL_19;
      }
    }
    else
    {
      sub_24B2BA5A0(a1);
      if (v9)
      {
        swift_bridgeObjectRelease();
        result = *(_xpc_connection_s **)(v1 + 16);
        if (result)
        {
          xpc_connection_cancel(result);
          v10 = 1;
          v7 = &v10;
          goto LABEL_9;
        }
        goto LABEL_20;
      }
    }
    return (_xpc_connection_s *)swift_unknownObjectRelease();
  }
  result = *(_xpc_connection_s **)(v1 + 16);
  if (result)
  {
    xpc_connection_cancel(result);
    v12 = 1;
    v7 = &v12;
LABEL_9:
    sub_24B2BA16C(v7);
    return (_xpc_connection_s *)OUTLINED_FUNCTION_43();
  }
  __break(1u);
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_24B2B9ABC(uint64_t a1)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t XOJITExecutor.deinit()
{
  uint64_t v0;
  std::mutex *v1;
  std::mutex *v2;
  uint64_t result;

  if (*(_QWORD *)(v0 + 16))
  {
    result = sub_24B2C2E50();
    __break(1u);
  }
  else
  {
    v1 = *(std::mutex **)(v0 + 104);
    if (v1)
      xojit_dylibmgr_destroy(v1);
    v2 = *(std::mutex **)(v0 + 96);
    if (v2)
      xojit_xpcmemmgr_destroy(v2);
    OUTLINED_FUNCTION_48();

    swift_bridgeObjectRelease();
    sub_24B2BC0FC(*(_QWORD *)(v0 + 72));

    swift_release();
    return v0;
  }
  return result;
}

uint64_t XOJITExecutor.__deallocating_deinit()
{
  XOJITExecutor.deinit();
  return swift_deallocClassInstance();
}

Swift::Void __swiftcall XOJITExecutor.disconnect()()
{
  NSObject *v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  _xpc_connection_s *isa;
  os_log_type_t v5;
  uint8_t *v6;
  NSObject *oslog;

  if (qword_257966DF0 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_26();
  __swift_project_value_buffer(v1, (uint64_t)qword_257967238);
  OUTLINED_FUNCTION_49();
  v2 = OUTLINED_FUNCTION_50();
  if (os_log_type_enabled(v0, v2))
  {
    v3 = (uint8_t *)OUTLINED_FUNCTION_3();
    *(_WORD *)v3 = 0;
    OUTLINED_FUNCTION_14(&dword_24B2B8000, v0, v2, "deleting executor -- cancelling connection", v3);
    OUTLINED_FUNCTION_1();
  }

  isa = v0[2].isa;
  if (isa)
  {
    xpc_connection_cancel(isa);
    sub_24B2C2D9C();
    v0[2].isa = 0;
    swift_unknownObjectRelease();
    oslog = sub_24B2C2CD0();
    v5 = sub_24B2C2D84();
    if (os_log_type_enabled(oslog, v5))
    {
      v6 = (uint8_t *)OUTLINED_FUNCTION_3();
      *(_WORD *)v6 = 0;
      OUTLINED_FUNCTION_14(&dword_24B2B8000, oslog, v5, "deleting executor -- connection destroyed", v6);
      OUTLINED_FUNCTION_1();
    }

  }
  else
  {
    __break(1u);
  }
}

_xpc_connection_s *XOJITExecutor.start(terminationHandler:)(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int is_sandboxed;
  char *v11;
  char v12;
  int v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _xpc_connection_s *result;
  os_log_type_t v24;
  uint8_t *v25;
  void *v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  xpc_object_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  int v37;
  int v38;
  char v39;

  v3 = v2;
  v4 = *(_QWORD *)(v2 + 80);
  if (*(_QWORD *)(v2 + 72))
  {
    v33 = *(_QWORD *)(v2 + 72);
    v34 = OUTLINED_FUNCTION_7();
    *(_QWORD *)(v34 + 16) = v33;
    *(_QWORD *)(v34 + 24) = v4;
    sub_24B2BC10C(v33);
    result = (_xpc_connection_s *)sub_24B2BC0FC((uint64_t)sub_24B2BC170);
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  sub_24B2BC10C(0);
  sub_24B2BC0FC(0);
  v7 = (_QWORD *)OUTLINED_FUNCTION_7();
  v7[2] = a1;
  v7[3] = a2;
  v7[4] = v3;
  v8 = *(_QWORD *)(v3 + 72);
  v9 = *(_QWORD *)(v3 + 80);
  *(_QWORD *)(v3 + 72) = sub_24B2BC144;
  *(_QWORD *)(v3 + 80) = v7;
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_24();
  sub_24B2BC0FC(v8);
  is_sandboxed = xojit_executor_is_sandboxed();
  if (is_sandboxed)
  {
    if (is_sandboxed == -1)
    {
      v35 = 3;
      v11 = &v35;
      return (_xpc_connection_s *)sub_24B2BA16C(v11);
    }
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  *(_BYTE *)(v3 + 113) = v12;
  v13 = xojit_executor_use_oopjit();
  if (v13)
  {
    if (v13 == -1)
    {
      v36 = 3;
      v11 = &v36;
      return (_xpc_connection_s *)sub_24B2BA16C(v11);
    }
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  *(_BYTE *)(v3 + 112) = v14;
  if (qword_257966DF0 != -1)
    swift_once();
  v15 = OUTLINED_FUNCTION_26();
  v16 = __swift_project_value_buffer(v15, (uint64_t)qword_257967238);
  OUTLINED_FUNCTION_24();
  v17 = sub_24B2C2CD0();
  v18 = sub_24B2C2D84();
  if (OUTLINED_FUNCTION_33(v18))
  {
    v19 = swift_slowAlloc();
    *(_DWORD *)v19 = 67109376;
    v38 = *(unsigned __int8 *)(v3 + 112);
    sub_24B2C2E14();
    *(_WORD *)(v19 + 8) = 1024;
    v37 = *(unsigned __int8 *)(v3 + 113);
    sub_24B2C2E14();
    OUTLINED_FUNCTION_19();
    _os_log_impl(&dword_24B2B8000, v17, (os_log_type_t)v9, "use OOP-JIT: %{BOOL}d, sandboxed: %{BOOL}d", (uint8_t *)v19, 0xEu);
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_19();
  v20 = sub_24B2C2CD0();
  v21 = sub_24B2C2D84();
  if (OUTLINED_FUNCTION_33(v21))
  {
    v22 = (uint8_t *)OUTLINED_FUNCTION_3();
    *(_WORD *)v22 = 0;
    OUTLINED_FUNCTION_14(&dword_24B2B8000, v20, (os_log_type_t)v9, "starting executor", v22);
    OUTLINED_FUNCTION_1();
  }

  result = *(_xpc_connection_s **)(v3 + 16);
  if (!result)
    goto LABEL_31;
  xpc_connection_resume(result);
  sub_24B2C2CD0();
  v24 = OUTLINED_FUNCTION_50();
  if (OUTLINED_FUNCTION_29(v24))
  {
    v25 = (uint8_t *)OUTLINED_FUNCTION_3();
    *(_WORD *)v25 = 0;
    OUTLINED_FUNCTION_14(&dword_24B2B8000, v16, (os_log_type_t)v20, "sending connect message", v25);
    OUTLINED_FUNCTION_1();
  }

  if (qword_257966E20 != -1)
    swift_once();
  if (qword_257966E10 != -1)
    swift_once();
  v26 = (void *)qword_257967280;
  v27 = *(_BYTE *)(v3 + 112);
  v28 = *(_BYTE *)(v3 + 113);
  v29 = *(_QWORD *)(v3 + 96);
  v30 = *(_QWORD *)(v3 + 104);
  v31 = sub_24B2C2D60();
  v32 = xojit_create_setup_message((std::string::value_type *)(v31 + 32), v26, v27, v28, (uint64_t)sub_24B2BBE84, v3, v29, v30);
  swift_release();
  if (!v32)
  {
    v39 = 3;
    v11 = &v39;
    return (_xpc_connection_s *)sub_24B2BA16C(v11);
  }
  result = *(_xpc_connection_s **)(v3 + 16);
  if (result)
  {
    xpc_connection_send_message(result, v32);
    return (_xpc_connection_s *)OUTLINED_FUNCTION_13();
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_24B2BA12C(char *a1, void (*a2)(char *))
{
  char v3;

  v3 = *a1;
  a2(&v3);
  return sub_24B2C2E08();
}

uint64_t sub_24B2BA16C(char *a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  _QWORD v9[6];

  v2 = v1;
  v3 = *a1;
  v4 = *(NSObject **)(v2 + 48);
  v5 = OUTLINED_FUNCTION_7();
  *(_QWORD *)(v5 + 16) = v2;
  *(_BYTE *)(v5 + 24) = v3;
  v6 = OUTLINED_FUNCTION_7();
  *(_QWORD *)(v6 + 16) = sub_24B2BC3A4;
  *(_QWORD *)(v6 + 24) = v5;
  v9[4] = sub_24B2BC170;
  v9[5] = v6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_24B2BBF78;
  v9[3] = &block_descriptor_12;
  v7 = _Block_copy(v9);
  swift_retain();
  OUTLINED_FUNCTION_23();
  swift_release();
  dispatch_sync(v4, v7);
  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  OUTLINED_FUNCTION_19();
  result = swift_release();
  if ((v4 & 1) != 0)
    __break(1u);
  return result;
}

Swift::Void __swiftcall XOJITExecutor.waitForTermination()()
{
  sub_24B2C2DFC();
  OUTLINED_FUNCTION_30();
}

Swift::Void __swiftcall XOJITExecutor.handleRunProgramOnMainThread()()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;

  v4 = v0;
  v5 = sub_24B2C2D3C();
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_20();
  sub_24B2B9868();
  *v1 = sub_24B2C2DCC();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BEE5610], v5);
  v6 = sub_24B2C2D48();
  (*(void (**)(uint64_t *, uint64_t))(v2 + 8))(v1, v5);
  if ((v6 & 1) == 0)
  {
    __break(1u);
LABEL_8:
    swift_once();
    goto LABEL_4;
  }
  xojit_executor_set_run_program_on_main_thread(v4, (uint64_t)sub_24B2BA4D8);
  v3 = *(_QWORD *)(v4 + 120);
  v6 = *(id *)(v3 + 48);
  sub_24B2C2DFC();

  if ((*(_BYTE *)(v3 + 40) & 1) != 0)
  {
    __break(1u);
    return;
  }
  v4 = *(_QWORD *)(v3 + 16);
  v5 = *(_QWORD *)(v3 + 24);
  v1 = *(uint64_t **)(v3 + 32);
  if (qword_257966DF0 != -1)
    goto LABEL_8;
LABEL_4:
  v7 = OUTLINED_FUNCTION_26();
  __swift_project_value_buffer(v7, (uint64_t)qword_257967238);
  OUTLINED_FUNCTION_49();
  v8 = OUTLINED_FUNCTION_50();
  if (os_log_type_enabled(v6, v8))
  {
    v9 = (uint8_t *)OUTLINED_FUNCTION_3();
    *(_WORD *)v9 = 0;
    OUTLINED_FUNCTION_14(&dword_24B2B8000, v6, v8, "Running main", v9);
    OUTLINED_FUNCTION_1();
  }

  *(_QWORD *)(v3 + 56) = __xojit_run_wrapper((uint64_t (*)(uint64_t, uint64_t))v4, v5, (uint64_t)v1);
  *(_QWORD *)(v3 + 64) = v10;
  *(_BYTE *)(v3 + 72) = 0;
  v11 = *(id *)(v3 + 80);
  sub_24B2C2E08();

}

void sub_24B2BA444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  id v6;
  id v7;

  if (a1)
  {
    v5 = *(_QWORD *)(a1 + 120);
    *(_QWORD *)(v5 + 16) = a2;
    *(_QWORD *)(v5 + 24) = a3;
    *(_QWORD *)(v5 + 32) = a4;
    *(_BYTE *)(v5 + 40) = 0;
    v6 = *(id *)(v5 + 48);
    swift_retain();
    sub_24B2C2E08();

    v7 = *(id *)(*(_QWORD *)(a1 + 120) + 80);
    sub_24B2C2DFC();

    if ((*(_BYTE *)(*(_QWORD *)(a1 + 120) + 72) & 1) == 0)
    {
      swift_release();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_24B2BA4DC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t value;

  v4 = sub_24B2C2D60();
  v5 = xpc_dictionary_get_value(a3, (const char *)(v4 + 32));
  swift_release();
  if (!v5)
    return 0;
  v6 = MEMORY[0x24BD1C2F8](v5);
  if (qword_257966DE8 != -1)
    swift_once();
  if (v6 == qword_257967230)
    value = xpc_uint64_get_value(v5);
  else
    value = 0;
  OUTLINED_FUNCTION_43();
  return value;
}

unint64_t sub_24B2BA5A0(void *a1)
{
  unint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void *v12;

  v2 = 0xD00000000000001DLL;
  v3 = OUTLINED_FUNCTION_21(6582383);
  if ((v4 & 1) == 0)
  {
    v5 = v3;
    v6 = OUTLINED_FUNCTION_21(7431539);
    if ((v7 & 1) == 0)
    {
      v8 = v6;
      v9 = OUTLINED_FUNCTION_21(6775156);
      if ((v10 & 1) == 0)
      {
        v11 = v9;
        sub_24B2BB210(6714722, 0xE300000000000000, a1, &qword_257966DD8, &qword_257967220);
        if (v12)
        {
          switch(v5)
          {
            case 0uLL:
              OUTLINED_FUNCTION_10();
              return 0xD00000000000002DLL;
            case 1uLL:
              goto LABEL_11;
            case 2uLL:
              sub_24B2BAF98(v8, v12);
              goto LABEL_11;
            case 3uLL:
              sub_24B2BB048(v11, v8, (uint64_t)v12);
LABEL_11:
              OUTLINED_FUNCTION_10();
              v2 = 0;
              break;
            default:
              OUTLINED_FUNCTION_16();
              sub_24B2C2E2C();
              OUTLINED_FUNCTION_46();
              sub_24B2C2E5C();
              OUTLINED_FUNCTION_34();
              OUTLINED_FUNCTION_10();
              OUTLINED_FUNCTION_42();
              v2 = 0xD000000000000013;
              break;
          }
        }
      }
    }
  }
  return v2;
}

uint64_t sub_24B2BA744(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
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
  size_t v23;
  size_t v24;
  uint64_t result;
  size_t v26;
  uint64_t v27;
  char v28;
  void *v29;
  uint64_t v30;
  vm_prot_t v31;
  mem_entry_name_port_t right;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  void *v37;
  size_t v38;
  size_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  unint64_t aBlock;
  unint64_t v52;
  uint64_t (*v53)(uint64_t);
  void *v54;
  _xpc_connection_s *(*v55)();
  _QWORD *v56;

  v5 = 0xD00000000000001DLL;
  v6 = sub_24B2C2D18();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_25();
  v8 = OUTLINED_FUNCTION_44();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_9();
  v10 = sub_24B2BA4DC(25705, 0xE200000000000000, a1);
  if ((v12 & 1) != 0)
    return 0xD000000000000024;
  v13 = v10;
  OUTLINED_FUNCTION_18(0x7370756F7267, 0xE600000000000000, v11, &qword_257966DD0, &qword_257967218);
  if (!v14)
    return 0xD000000000000028;
  v50 = v14;
  OUTLINED_FUNCTION_18(0x7365736162, 0xE500000000000000, v15, &qword_257966DD0, &qword_257967218);
  if (!v16)
  {
    OUTLINED_FUNCTION_0();
    return 0xD000000000000027;
  }
  v49 = v16;
  OUTLINED_FUNCTION_18(0x73657A6973, 0xE500000000000000, v17, &qword_257966DD0, &qword_257967218);
  if (!v18)
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2();
    return 0xD000000000000027;
  }
  v48 = v18;
  OUTLINED_FUNCTION_18(0x73656372756F73, 0xE700000000000000, v19, &qword_257966DD0, &qword_257967218);
  if (!v20)
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_5();
    return 0xD000000000000029;
  }
  v47 = v20;
  OUTLINED_FUNCTION_18(24929, 0xE200000000000000, v21, &qword_257966DD8, &qword_257967220);
  if (!v22)
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_8();
    return 0xD000000000000024;
  }
  v44 = v13;
  v45 = v1;
  v46 = v22;
  v23 = OUTLINED_FUNCTION_40();
  if (OUTLINED_FUNCTION_35() != v23)
  {
    OUTLINED_FUNCTION_13();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_4();
    return 0xD00000000000001ELL;
  }
  if (OUTLINED_FUNCTION_35() != v23)
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_8();
    OUTLINED_FUNCTION_4();
    return 0xD00000000000001ELL;
  }
  v24 = v23;
  if (xpc_array_get_count(v47) != v23)
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_4();
    return 0xD000000000000020;
  }
  result = OUTLINED_FUNCTION_7();
  v42 = result;
  *(_QWORD *)(result + 16) = -1;
  if ((v23 & 0x8000000000000000) == 0)
  {
    if (v23)
    {
      if ((uint64_t)xpc_array_get_count(v50) < 1)
      {
LABEL_47:
        OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_2();
        OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_4();
        return 0xD00000000000001ELL;
      }
      else
      {
        v26 = 0;
        v38 = v24 - 1;
        while (1)
        {
          if (!xpc_array_get_value(v50, v26))
            goto LABEL_47;
          v43 = v26;
          v27 = MEMORY[0x24BD1C2F8]();
          if (qword_257966DE8 != -1)
            swift_once();
          if (v27 != qword_257967230)
          {
            OUTLINED_FUNCTION_6();
            goto LABEL_47;
          }
          v28 = OUTLINED_FUNCTION_36();
          OUTLINED_FUNCTION_6();
          if (v43 >= (uint64_t)OUTLINED_FUNCTION_40()
            || !xpc_array_get_value(v49, v43))
          {
            goto LABEL_49;
          }
          if (MEMORY[0x24BD1C2F8]() != qword_257967230)
          {
            OUTLINED_FUNCTION_6();
LABEL_49:
            OUTLINED_FUNCTION_11();
            OUTLINED_FUNCTION_0();
            OUTLINED_FUNCTION_13();
            OUTLINED_FUNCTION_5();
            OUTLINED_FUNCTION_8();
            OUTLINED_FUNCTION_4();
            return v5;
          }
          v40 = (void *)OUTLINED_FUNCTION_36();
          OUTLINED_FUNCTION_6();
          if (v43 >= (uint64_t)OUTLINED_FUNCTION_40()
            || !xpc_array_get_value(v48, v43))
          {
            goto LABEL_51;
          }
          if (MEMORY[0x24BD1C2F8]() != qword_257967230)
            break;
          v39 = OUTLINED_FUNCTION_36();
          OUTLINED_FUNCTION_6();
          if (!xpc_array_get_value(v47, v43))
          {
            OUTLINED_FUNCTION_11();
            OUTLINED_FUNCTION_0();
            OUTLINED_FUNCTION_2();
            OUTLINED_FUNCTION_5();
            OUTLINED_FUNCTION_8();
            OUTLINED_FUNCTION_4();
            return 0xD000000000000018;
          }
          v29 = *(void **)(v42 + 16);
          if (v40 < v29)
            v29 = v40;
          *(_QWORD *)(v42 + 16) = v29;
          v30 = MEMORY[0x24BD1C2F8]();
          if (v30 == sub_24B2C2CF4())
          {
            if (v43 >= (uint64_t)OUTLINED_FUNCTION_35() || !xpc_array_get_string(v47, v43))
            {
              OUTLINED_FUNCTION_11();
              OUTLINED_FUNCTION_10();
              OUTLINED_FUNCTION_0();
              OUTLINED_FUNCTION_2();
              OUTLINED_FUNCTION_5();
              OUTLINED_FUNCTION_6();
              OUTLINED_FUNCTION_4();
              return 0xD000000000000017;
            }
            sub_24B2C2D78();
            sub_24B2BB2EC(v40, v39);
            v35 = v34;
            swift_bridgeObjectRelease();
            if (v35)
            {
              sub_24B2C2E2C();
              swift_bridgeObjectRelease();
              aBlock = 0xD000000000000019;
              v52 = 0x800000024B2C42F0;
              sub_24B2C2D6C();
              OUTLINED_FUNCTION_0();
              OUTLINED_FUNCTION_2();
              OUTLINED_FUNCTION_5();
              OUTLINED_FUNCTION_8();
              OUTLINED_FUNCTION_4();
              goto LABEL_56;
            }
          }
          else
          {
            v31 = sub_24B2BB2A8(v28);
            right = xpc_mach_send_get_right();
            sub_24B2BB568((mach_vm_address_t)v40, v39, v31, right);
            if (v33)
            {
              sub_24B2C2E2C();
              swift_bridgeObjectRelease();
              aBlock = 0xD00000000000001DLL;
              v52 = 0x800000024B2C42B0;
              sub_24B2C2D6C();
              OUTLINED_FUNCTION_0();
              OUTLINED_FUNCTION_2();
              OUTLINED_FUNCTION_5();
              OUTLINED_FUNCTION_8();
              OUTLINED_FUNCTION_4();
LABEL_56:
              swift_bridgeObjectRelease();
              v5 = aBlock;
              OUTLINED_FUNCTION_11();
              OUTLINED_FUNCTION_10();
              return v5;
            }
          }
          OUTLINED_FUNCTION_10();
          if (v38 == v43)
            goto LABEL_45;
          v26 = v43 + 1;
          if (v43 + 1 >= (uint64_t)xpc_array_get_count(v50))
            goto LABEL_47;
        }
        OUTLINED_FUNCTION_6();
LABEL_51:
        OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_0();
        OUTLINED_FUNCTION_2();
        OUTLINED_FUNCTION_13();
        OUTLINED_FUNCTION_8();
        OUTLINED_FUNCTION_4();
      }
    }
    else
    {
LABEL_45:
      v41 = *(_QWORD *)(v45 + 40);
      v36 = (_QWORD *)OUTLINED_FUNCTION_7();
      v36[2] = v46;
      v36[3] = v45;
      v36[4] = v42;
      v36[5] = v44;
      v55 = sub_24B2BC7C8;
      v56 = v36;
      aBlock = MEMORY[0x24BDAC760];
      v52 = 1107296256;
      v53 = sub_24B2BB834;
      v54 = &block_descriptor_27;
      v37 = _Block_copy(&aBlock);
      swift_unknownObjectRetain();
      OUTLINED_FUNCTION_23();
      OUTLINED_FUNCTION_24();
      sub_24B2C2D24();
      sub_24B2BC6D0(&qword_2579671A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      OUTLINED_FUNCTION_41();
      OUTLINED_FUNCTION_51((unint64_t *)&unk_2579671B0);
      sub_24B2C2E20();
      MEMORY[0x24BD1BD34](v41, v2, v3, v37);
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_8();
      _Block_release(v37);
      OUTLINED_FUNCTION_4();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v3, v6);
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v8);
      OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_19();
      return 0;
    }
    return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_24B2BAF98(uint64_t a1, void *a2)
{
  uint64_t result;
  const void *bytes_ptr;
  size_t length;
  uint64_t v6;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257967198);
  result = sub_24B2C2DD8();
  if (v7)
  {
    swift_unknownObjectRetain();
    OUTLINED_FUNCTION_23();
    bytes_ptr = xpc_data_get_bytes_ptr(a2);
    length = xpc_data_get_length(a2);
    if (bytes_ptr)
      v6 = (uint64_t)bytes_ptr + length;
    else
      v6 = 0;
    sub_24B2BB964(bytes_ptr, v6, v7);
    swift_release_n();
    return OUTLINED_FUNCTION_43();
  }
  return result;
}

uint64_t sub_24B2BB048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)();
  _QWORD *v25;

  v5 = v3;
  v9 = *(_QWORD *)(sub_24B2C2D18() - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_9();
  v10 = OUTLINED_FUNCTION_44();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v5 + 32);
  v19 = *(_QWORD *)(v5 + 40);
  v20 = v14;
  v15 = (_QWORD *)OUTLINED_FUNCTION_7();
  v15[2] = a3;
  v15[3] = a1;
  v15[4] = a2;
  v15[5] = v5;
  v24 = sub_24B2BC6C4;
  v25 = v15;
  v22 = MEMORY[0x24BDAC760];
  v23 = 1107296256;
  v16 = OUTLINED_FUNCTION_47((uint64_t)sub_24B2BB834);
  swift_unknownObjectRetain();
  swift_retain();
  sub_24B2C2D24();
  v21 = MEMORY[0x24BEE4AF8];
  sub_24B2BC6D0(&qword_2579671A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_51((unint64_t *)&unk_2579671B0);
  sub_24B2C2E20();
  MEMORY[0x24BD1BD34](v19, v13, v4, v16);
  _Block_release(v16);
  OUTLINED_FUNCTION_45(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  return swift_release();
}

void sub_24B2BB210(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v8;
  xpc_object_t v9;
  uint64_t v10;

  v8 = sub_24B2C2D60();
  v9 = xpc_dictionary_get_value(a3, (const char *)(v8 + 32));
  swift_release();
  if (v9)
  {
    v10 = MEMORY[0x24BD1C2F8](v9);
    if (*a4 != -1)
      swift_once();
    if (v10 != *a5)
      OUTLINED_FUNCTION_10();
  }
  OUTLINED_FUNCTION_32();
}

uint64_t sub_24B2BB2A8(char a1)
{
  uint64_t v1;

  if ((a1 & 1) == 0)
  {
    if ((a1 & 2) != 0)
    {
      v1 = 2;
      if ((a1 & 4) == 0)
        return v1;
    }
    else
    {
      v1 = 0;
      if ((a1 & 4) == 0)
        return v1;
    }
    return v1 | 4;
  }
  if ((a1 & 2) == 0)
  {
    v1 = 1;
    if ((a1 & 4) == 0)
      return v1;
    return v1 | 4;
  }
  v1 = 3;
  if ((a1 & 4) != 0)
    return v1 | 4;
  return v1;
}

uint64_t sub_24B2BB2EC(void *a1, size_t a2)
{
  uint64_t v2;
  int v5;
  uint64_t result;
  int v7;
  void *v8;
  uint64_t v9;
  int v10;
  int v11;
  _QWORD v12[2];

  sub_24B2C2D60();
  v5 = sub_24B2C2D00();
  result = swift_release();
  if (v5 == -1)
  {
    OUTLINED_FUNCTION_16();
    sub_24B2C2E2C();
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_37();
    goto LABEL_8;
  }
  if (qword_257966E10 != -1)
    result = swift_once();
  if (!qword_257967280)
  {
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  if (a2 % qword_257967280)
  {
    OUTLINED_FUNCTION_16();
    sub_24B2C2E2C();
    OUTLINED_FUNCTION_34();
    sub_24B2C2E5C();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_42();
LABEL_8:
    sub_24B2C2D6C();
    return v12[0];
  }
  if ((a2 & 0x8000000000000000) != 0)
    goto LABEL_24;
  if (*(_BYTE *)(v2 + 112))
    v7 = 5;
  else
    v7 = 3;
  v8 = mmap(a1, a2, v7, 18, v5, 0);
  v9 = close(v5);
  if (v8 == (void *)-1)
  {
    v11 = MEMORY[0x24BD1BC5C](v9);
    result = (uint64_t)strerror(v11);
    if (result)
    {
      sub_24B2C2D78();
      strcpy((char *)v12, "mmap failed: ");
      HIWORD(v12[1]) = -4864;
      OUTLINED_FUNCTION_34();
      goto LABEL_22;
    }
    goto LABEL_25;
  }
  if ((*(_BYTE *)(v2 + 112) & 1) != 0 || !mprotect(v8, a2, 5))
    return 0;
  v10 = MEMORY[0x24BD1BC5C]();
  result = (uint64_t)strerror(v10);
  if (result)
  {
    sub_24B2C2D78();
    OUTLINED_FUNCTION_16();
    sub_24B2C2E2C();
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_37();
    sub_24B2C2D6C();
LABEL_22:
    swift_bridgeObjectRelease();
    return v12[0];
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_24B2BB568(mach_vm_address_t a1, mach_vm_size_t size, vm_prot_t max_protection, mem_entry_name_port_t object)
{
  mach_vm_address_t address[3];

  address[2] = *MEMORY[0x24BDAC8D0];
  if (qword_257966E10 != -1)
    swift_once();
  if (!qword_257967280)
    __break(1u);
  if (size % qword_257967280)
  {
    address[1] = 0xE000000000000000;
    sub_24B2C2E2C();
    sub_24B2C2D6C();
    sub_24B2C2E5C();
    sub_24B2C2D6C();
    OUTLINED_FUNCTION_42();
    sub_24B2C2D6C();
    return 0;
  }
  else
  {
    address[0] = a1;
    if (mach_vm_map(*MEMORY[0x24BDAEC58], address, size, 0, 0x4000, object, 0, 0, max_protection, max_protection, 2u))
    {
      return 0xD000000000000022;
    }
    else
    {
      return 0;
    }
  }
}

_xpc_connection_s *sub_24B2BB708(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v8;
  void *v9;
  unint64_t *bytes_ptr;
  size_t length;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  xpc_object_t empty;
  _xpc_connection_s *result;

  v8 = (uint64_t *)(a3 + 16);
  v9 = (void *)swift_unknownObjectRetain();
  bytes_ptr = (unint64_t *)xpc_data_get_bytes_ptr(v9);
  length = xpc_data_get_length(a1);
  v12 = *(_QWORD *)(a2 + 96);
  swift_beginAccess();
  if (bytes_ptr)
    v13 = length;
  else
    v13 = 0;
  v14 = xojit_xpcmemmgr_run_finalize_actions(v12, *(_QWORD *)(a3 + 16), bytes_ptr, v13);
  swift_unknownObjectRelease();
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "opc", 1uLL);
  xpc_dictionary_set_uint64(empty, "id", a4);
  if (v14)
  {
    xpc_dictionary_set_string(empty, "err", v14);
  }
  else
  {
    swift_beginAccess();
    xpc_dictionary_set_uint64(empty, "fa", *v8);
  }
  result = *(_xpc_connection_s **)(a2 + 16);
  if (result)
  {
    xpc_connection_send_message(result, empty);
    return (_xpc_connection_s *)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24B2BB834(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24B2BB860@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t *v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v11;

  v5 = (uint64_t *)(a1 + 56);
  swift_beginAccess();
  v6 = sub_24B2BC3D4(a2);
  v7 = 0;
  if ((v8 & 1) != 0)
  {
    v9 = v6;
    swift_isUniquelyReferenced_nonNull_native();
    v11 = *v5;
    *v5 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257967190);
    sub_24B2C2E38();
    v7 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v9);
    type metadata accessor for XOJITExecutor.ActiveRunWrapper();
    sub_24B2C2E44();
    *v5 = v11;
    swift_bridgeObjectRelease();
  }
  *a3 = v7;
  return swift_endAccess();
}

void sub_24B2BB964(const void *a1, uint64_t a2, uint64_t a3)
{
  size_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  unint64_t v15;
  size_t v16;
  id v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _BYTE __dst[8];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v5 = a2 - (_QWORD)a1;
    if (a2 - (uint64_t)a1 > 8)
    {
      v6 = (unint64_t)malloc(a2 - (_QWORD)a1);
      v7 = v6;
      v19 = v6 >> 16;
      v20 = v6 >> 8;
      v18 = v6 >> 24;
      v8 = HIDWORD(v6);
      v9 = v6 >> 40;
      v10 = HIWORD(v6);
      v11 = HIBYTE(v6);
      memcpy((void *)v6, a1, v5);
      v13 = v19;
      v12 = v20;
      v14 = v18;
      v15 = v11;
      goto LABEL_9;
    }
  }
  else
  {
    v5 = 0;
  }
  if (v5 <= 7)
    v16 = 8 - v5;
  else
    v16 = 0;
  bzero(&__dst[v5], v16);
  memcpy(__dst, a1, v5);
  v7 = __dst[0];
  v12 = __dst[1];
  v13 = __dst[2];
  v14 = __dst[3];
  LOBYTE(v8) = __dst[4];
  LOBYTE(v9) = __dst[5];
  LOBYTE(v10) = __dst[6];
  v15 = __dst[7];
LABEL_9:
  *(_QWORD *)(a3 + 16) = ((unint64_t)v10 << 48) | (v15 << 56) | ((unint64_t)v9 << 40) | ((unint64_t)v8 << 32) | ((unint64_t)v14 << 24) | ((unint64_t)v13 << 16) | ((unint64_t)v12 << 8) | v7;
  *(_QWORD *)(a3 + 24) = v5;
  *(_BYTE *)(a3 + 32) = 0;
  v17 = *(id *)(a3 + 40);
  sub_24B2C2E08();

}

void sub_24B2BBAD8(void *a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t a4)
{
  void *v8;
  const void *bytes_ptr;
  size_t length;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  size_t v14;
  _QWORD *v15;
  xpc_object_t empty;
  _xpc_connection_s *v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v8 = (void *)swift_unknownObjectRetain();
  bytes_ptr = xpc_data_get_bytes_ptr(v8);
  length = xpc_data_get_length(a1);
  if (bytes_ptr)
    v11 = length;
  else
    v11 = 0;
  v12 = __xojit_run_wrapper(a2, (uint64_t)bytes_ptr, v11);
  v14 = v13;
  swift_unknownObjectRelease();
  v18[0] = v12;
  v18[1] = v14;
  if (orc_rt_CWrapperFunctionResultGetOutOfBandError(v18))
  {
    sub_24B2C2D78();
    swift_bridgeObjectRelease();
LABEL_11:
    orc_rt_DisposeCWrapperFunctionResult((uint64_t)v18);
    return;
  }
  v15 = orc_rt_CWrapperFunctionResultData(v18);
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "opc", 0);
  xpc_dictionary_set_uint64(empty, "opd", 2uLL);
  xpc_dictionary_set_uint64(empty, "tag", 0);
  xpc_dictionary_set_uint64(empty, "seq", a3);
  if (v14)
  {
    if (v15)
      xpc_dictionary_set_data(empty, "buf", v15, v14);
  }
  v17 = *(_xpc_connection_s **)(a4 + 16);
  if (v17)
  {
    xpc_connection_send_message(v17, empty);
    swift_unknownObjectRelease();
    goto LABEL_11;
  }
  __break(1u);
}

void sub_24B2BBC40()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;

  v3 = sub_24B2C2D3C();
  OUTLINED_FUNCTION_28();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_9();
  v4 = *(void **)(v0 + 48);
  *v1 = v4;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BEE5610], v3);
  v5 = v4;
  LOBYTE(v4) = sub_24B2C2D48();
  OUTLINED_FUNCTION_45(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  if ((v4 & 1) != 0)
  {
    v6 = *(_QWORD *)(v0 + 64);
    if (v6 != -1)
    {
      *(_QWORD *)(v0 + 64) = v6 + 1;
      OUTLINED_FUNCTION_32();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_24B2BBCD8(uint64_t a1, uint64_t a2, const void *a3, size_t a4)
{
  uint64_t v7;
  uint64_t v8;

  swift_retain();
  sub_24B2BBD38(a2, a3, a4);
  v8 = v7;
  swift_release();
  return v8;
}

void sub_24B2BBD38(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v3;
  uint64_t v7;
  xpc_object_t empty;
  _xpc_connection_s *v9;
  id v10;
  uint64_t v11;

  type metadata accessor for XOJITExecutor.ActiveRunWrapper();
  v7 = OUTLINED_FUNCTION_7();
  sub_24B2B9358();
  sub_24B2C2DD8();
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "opc", 0);
  xpc_dictionary_set_uint64(empty, "opd", 3uLL);
  xpc_dictionary_set_uint64(empty, "tag", a1);
  xpc_dictionary_set_uint64(empty, "seq", v11);
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  xpc_dictionary_set_data(empty, "buf", a2, a3);
  v9 = *(_xpc_connection_s **)(v3 + 16);
  if (!v9)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  xpc_connection_send_message(v9, empty);
  v10 = *(id *)(v7 + 40);
  sub_24B2C2DFC();

  if ((*(_BYTE *)(v7 + 32) & 1) == 0)
  {
    OUTLINED_FUNCTION_19();
    swift_unknownObjectRelease();
    return;
  }
LABEL_7:
  __break(1u);
}

uint64_t sub_24B2BBE88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  sub_24B2BBC40();
  v3 = v2;
  swift_beginAccess();
  v4 = swift_retain();
  sub_24B2BC4A0(v4, v3);
  result = swift_endAccess();
  *a1 = v3;
  return result;
}

uint64_t sub_24B2BBF08(uint64_t a1, char a2)
{
  void (*v3)(char *);
  _QWORD *v4;
  uint64_t v5;
  char v7;

  v4 = (_QWORD *)(a1 + 72);
  v3 = *(void (**)(char *))(a1 + 72);
  if (v3)
  {
    v7 = a2;
    swift_retain();
    v3(&v7);
    sub_24B2BC0FC((uint64_t)v3);
    v5 = *(_QWORD *)(a1 + 72);
  }
  else
  {
    v5 = 0;
  }
  *v4 = 0;
  v4[1] = 0;
  return sub_24B2BC0FC(v5);
}

uint64_t sub_24B2BBF78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_24B2BBF98()
{
  qword_257967250 = 0x34366D7261;
  *(_QWORD *)algn_257967258 = 0xE500000000000000;
}

void sub_24B2BBFB8()
{
  qword_257967260 = 7565161;
  *(_QWORD *)algn_257967268 = 0xE300000000000000;
}

void sub_24B2BBFD4()
{
  qword_257967270 = 825110834;
  *(_QWORD *)algn_257967278 = 0xE400000000000000;
}

void sub_24B2BBFF0()
{
  qword_257967280 = *MEMORY[0x24BDB03C8];
}

void sub_24B2BC008()
{
  qword_257967288 = 0x656C707061;
  unk_257967290 = 0xE500000000000000;
}

uint64_t sub_24B2BC028()
{
  uint64_t result;

  if (qword_257966DF8 != -1)
    result = swift_once();
  if (qword_257966E18 != -1)
    result = swift_once();
  if (qword_257966E00 != -1)
    result = swift_once();
  if (qword_257966E08 != -1)
    result = swift_once();
  qword_257967298 = 0xD000000000000013;
  unk_2579672A0 = 0x800000024B2C3FA0;
  return result;
}

uint64_t sub_24B2BC0FC(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_24B2BC10C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_24B2BC11C()
{
  OUTLINED_FUNCTION_39();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24B2BC144(char *a1)
{
  uint64_t v1;

  return sub_24B2BA12C(a1, *(void (**)(char *))(v1 + 16));
}

uint64_t sub_24B2BC150()
{
  OUTLINED_FUNCTION_39();
  return swift_deallocObject();
}

void sub_24B2BC170()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_30();
}

unint64_t sub_24B2BC190()
{
  unint64_t result;

  result = qword_257966EC0;
  if (!qword_257966EC0)
  {
    result = MEMORY[0x24BD1C1B4](&protocol conformance descriptor for XOJITExecutor.TerminationResult, &type metadata for XOJITExecutor.TerminationResult);
    atomic_store(result, (unint64_t *)&qword_257966EC0);
  }
  return result;
}

uint64_t type metadata accessor for XOJITExecutor()
{
  return objc_opt_self();
}

uint64_t method lookup function for XOJITExecutor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XOJITExecutor.__allocating_init(connection:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

ValueMetadata *type metadata accessor for XOJITExecutor.JITDylibHandle()
{
  return &type metadata for XOJITExecutor.JITDylibHandle;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for XOJITExecutor.TerminationResult(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for XOJITExecutor.TerminationResult(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24B2BC2F0 + 4 * byte_24B2C3459[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24B2BC324 + 4 * byte_24B2C3454[v4]))();
}

uint64_t sub_24B2BC324(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B2BC32C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24B2BC334);
  return result;
}

uint64_t sub_24B2BC340(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24B2BC348);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24B2BC34C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B2BC354(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B2BC360(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24B2BC368(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for XOJITExecutor.TerminationResult()
{
  return &type metadata for XOJITExecutor.TerminationResult;
}

uint64_t sub_24B2BC380()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24B2BC3A4()
{
  uint64_t v0;

  return sub_24B2BBF08(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_24B2BC3B0()
{
  return OUTLINED_FUNCTION_17();
}

uint64_t sub_24B2BC3BC@<X0>(uint64_t *a1@<X8>)
{
  return sub_24B2BBE88(a1);
}

unint64_t sub_24B2BC3D4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24B2C2E74();
  return sub_24B2BC404(a1, v2);
}

unint64_t sub_24B2BC404(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_24B2BC4A0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  swift_isUniquelyReferenced_nonNull_native();
  v6 = *v2;
  *v2 = 0x8000000000000000;
  sub_24B2BC50C(a1, a2);
  *v2 = v6;
  return swift_bridgeObjectRelease();
}

unint64_t sub_24B2BC50C(uint64_t a1, uint64_t a2)
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
  uint64_t v14;
  unint64_t result;

  v3 = (_QWORD **)v2;
  v6 = (_QWORD *)*v2;
  v7 = sub_24B2BC3D4(a2);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v9 = v7;
  v10 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257967190);
  if ((sub_24B2C2E38() & 1) == 0)
    goto LABEL_5;
  v11 = sub_24B2BC3D4(a2);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_9:
    result = sub_24B2C2E68();
    __break(1u);
    return result;
  }
  v9 = v11;
LABEL_5:
  v13 = *v3;
  if ((v10 & 1) == 0)
    return sub_24B2BC608(v9, a2, a1, v13);
  v14 = v13[7];
  result = swift_release();
  *(_QWORD *)(v14 + 8 * v9) = a1;
  return result;
}

unint64_t sub_24B2BC608(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a4[6] + 8 * result) = a2;
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
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

uint64_t sub_24B2BC68C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_24B2BB860(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_24B2BC6A4()
{
  OUTLINED_FUNCTION_48();
  swift_release();
  OUTLINED_FUNCTION_22();
  return swift_deallocObject();
}

void sub_24B2BC6C4()
{
  uint64_t v0;

  sub_24B2BBAD8(*(void **)(v0 + 16), *(uint64_t (**)(uint64_t, uint64_t))(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

void sub_24B2BC6D0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x24BD1C1B4](a3, v5), a1);
  }
  OUTLINED_FUNCTION_30();
}

void sub_24B2BC70C(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x24BD1C1B4](MEMORY[0x24BEE12C8], v3), a1);
  }
  OUTLINED_FUNCTION_30();
}

uint64_t orc_rt_CWrapperFunctionResultGetOutOfBandError(_QWORD *a1)
{
  if (a1[1])
    return 0;
  else
    return *a1;
}

_QWORD *orc_rt_CWrapperFunctionResultData(_QWORD *result)
{
  if (result[1] >= 9uLL)
    return (_QWORD *)*result;
  return result;
}

void orc_rt_DisposeCWrapperFunctionResult(uint64_t a1)
{
  unint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 9)
  {
    v2 = *(void **)a1;
LABEL_3:
    free(v2);
    return;
  }
  if (!v1)
  {
    v2 = *(void **)a1;
    if (v2)
      goto LABEL_3;
  }
}

uint64_t sub_24B2BC798()
{
  return OUTLINED_FUNCTION_17();
}

uint64_t sub_24B2BC7A4()
{
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_39();
  swift_release();
  OUTLINED_FUNCTION_22();
  return swift_deallocObject();
}

_xpc_connection_s *sub_24B2BC7C8()
{
  uint64_t v0;

  return sub_24B2BB708(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_1()
{
  JUMPOUT(0x24BD1C220);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_12()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(v0, v3, v2);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_unknownObjectRelease();
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_17()
{
  return swift_deallocObject();
}

void OUTLINED_FUNCTION_18(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  void *v5;

  sub_24B2BB210(a1, a2, v5, a4, a5);
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_21(uint64_t a1)
{
  void *v1;

  return sub_24B2BA4DC(a1, 0xE300000000000000, v1);
}

uint64_t OUTLINED_FUNCTION_22()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_24B2C2CE8();
}

dispatch_semaphore_t OUTLINED_FUNCTION_27()
{
  return dispatch_semaphore_create(0);
}

BOOL OUTLINED_FUNCTION_29(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

BOOL OUTLINED_FUNCTION_33(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_24B2C2D6C();
}

size_t OUTLINED_FUNCTION_35()
{
  void *v0;

  return xpc_array_get_count(v0);
}

uint64_t OUTLINED_FUNCTION_36()
{
  void *v0;

  return xpc_uint64_get_value(v0);
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_24B2C2D24();
}

uint64_t OUTLINED_FUNCTION_39()
{
  return swift_release();
}

size_t OUTLINED_FUNCTION_40()
{
  void *v0;

  return xpc_array_get_count(v0);
}

uint64_t OUTLINED_FUNCTION_41()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_44()
{
  return sub_24B2C2D30();
}

uint64_t OUTLINED_FUNCTION_45@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRelease();
}

void *OUTLINED_FUNCTION_47@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 112) = a1;
  *(_QWORD *)(v2 - 104) = v1;
  return _Block_copy((const void *)(v2 - 128));
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_49()
{
  return sub_24B2C2CD0();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return sub_24B2C2D84();
}

void OUTLINED_FUNCTION_51(unint64_t *a1)
{
  uint64_t *v1;

  sub_24B2BC70C(a1, v1);
}

void `anonymous namespace'::LogManager::~LogManager(void **this)
{
  os_release(*this);
}

char *xojit_xpcmemmgr_run_finalize_actions(uint64_t a1, unint64_t a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void **v8;
  char *v9;
  char *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  char **v15;
  char **v16;
  void **v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void **v22;
  void **v23;
  uint64_t v24;
  char **v25;
  unint64_t v26;
  char *v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint8x8_t v47;
  char *v48;
  char *v49;
  unint64_t v50;
  unint64_t v51;
  void *v52;
  _QWORD *v53;
  _QWORD *v54;
  unint64_t v55;
  _QWORD *v56;
  float v57;
  float v58;
  _BOOL8 v59;
  unint64_t v60;
  unint64_t v61;
  int8x8_t prime;
  void *v63;
  void *v64;
  uint64_t v65;
  _QWORD *v66;
  unint64_t v67;
  uint8x8_t v68;
  unint64_t v69;
  uint8x8_t v70;
  uint64_t v71;
  _QWORD *v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  _QWORD *v77;
  unint64_t v78;
  uint64_t v79;
  char *v81;
  void *v82;
  unint64_t v85;
  _QWORD v86[3];
  uint64_t v87[2];
  char *v88;
  char **v89;
  unint64_t v90;
  char *__s1[2];
  __int128 v92;
  void *__p[2];
  __int128 v94;
  void **v95[6];

  v88 = 0;
  v89 = 0;
  v90 = 0;
  if (a4 >= 8)
  {
    v5 = a1;
    v6 = *a3;
    v87[0] = (uint64_t)(a3 + 1);
    v87[1] = a4 - 8;
    if (v6)
    {
      if (v6 >> 58)
LABEL_161:
        abort();
      __p[0] = &v90;
      __s1[0] = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::AllocationActionsPair>>(v6);
      __s1[1] = __s1[0];
      *(char **)&v92 = __s1[0];
      *((_QWORD *)&v92 + 1) = &__s1[0][64 * v7];
      std::vector<__orc_rt::AllocationActionsPair>::__swap_out_circular_buffer((uint64_t *)&v88, __s1);
      std::__split_buffer<__orc_rt::AllocationActionsPair>::~__split_buffer((uint64_t)__s1);
      v8 = __p;
      while (1)
      {
        *(_OWORD *)__p = 0u;
        v94 = 0u;
        *(_OWORD *)__s1 = 0u;
        v92 = 0u;
        if (!__orc_rt::SPSSerializationTraits<__orc_rt::SPSTuple<__orc_rt::SPSExecutorAddr,__orc_rt::SPSSequence<char>>,__orc_rt::WrapperFunctionCall,void>::deserialize((uint64_t)v87, __s1)|| !__orc_rt::SPSSerializationTraits<__orc_rt::SPSTuple<__orc_rt::SPSExecutorAddr,__orc_rt::SPSSequence<char>>,__orc_rt::WrapperFunctionCall,void>::deserialize((uint64_t)v87, v8))
        {
          break;
        }
        v85 = v6;
        v9 = __s1[0];
        v10 = __s1[1];
        v4 = *((_QWORD *)&v92 + 1);
        v11 = (void *)v92;
        __s1[1] = 0;
        v92 = 0uLL;
        v12 = __p[0];
        v13 = __p[1];
        v14 = v94;
        v15 = v89;
        if ((unint64_t)v89 >= v90)
        {
          v17 = v8;
          v18 = ((char *)v89 - v88) >> 6;
          v19 = v18 + 1;
          if ((unint64_t)(v18 + 1) >> 58)
            goto LABEL_161;
          v20 = v90 - (_QWORD)v88;
          if ((uint64_t)(v90 - (_QWORD)v88) >> 5 > v19)
            v19 = v20 >> 5;
          if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFC0)
            v21 = 0x3FFFFFFFFFFFFFFLL;
          else
            v21 = v19;
          v95[4] = (void **)&v90;
          v22 = (void **)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::AllocationActionsPair>>(v21);
          v23 = &v22[8 * v18];
          v95[0] = v22;
          v95[1] = v23;
          v95[3] = &v22[8 * v24];
          *v23 = v9;
          v23[1] = v10;
          v23[2] = v11;
          v23[3] = (void *)v4;
          v23[4] = v12;
          v23[5] = v13;
          v23[6] = 0;
          *((_OWORD *)v23 + 3) = v14;
          v95[2] = v23 + 8;
          std::vector<__orc_rt::AllocationActionsPair>::__swap_out_circular_buffer((uint64_t *)&v88, v95);
          v16 = v89;
          std::__split_buffer<__orc_rt::AllocationActionsPair>::~__split_buffer((uint64_t)v95);
          v8 = v17;
        }
        else
        {
          *v89 = __s1[0];
          v15[1] = v10;
          v15[2] = (char *)v11;
          v15[3] = (char *)v4;
          v15[4] = (char *)v12;
          v15[5] = (char *)v13;
          v16 = v15 + 8;
          *((_OWORD *)v15 + 3) = v14;
        }
        v89 = v16;
        v6 = v85 - 1;
        if (v85 == 1)
        {
          v25 = (char **)v88;
          v26 = v90;
          v5 = a1;
          goto LABEL_24;
        }
      }
      if (__p[1])
        operator delete(__p[1]);
      if (__s1[1])
        operator delete(__s1[1]);
      goto LABEL_22;
    }
    v26 = 0;
    v16 = 0;
    v25 = 0;
LABEL_24:
    v86[0] = v25;
    v86[1] = v16;
    v86[2] = v26;
    v89 = 0;
    v90 = 0;
    v88 = 0;
    __s1[0] = 0;
    __s1[1] = 0;
    *(_QWORD *)&v92 = 0;
    if (v25 != v16)
    {
      v28 = 0;
      v4 = 0x7FFFFFFFFFFFFFFLL;
      while (1)
      {
        if (*v25)
        {
          __orc_rt::WrapperFunctionCall::runWithSPSRet<__orc_rt::SPSEmpty,__orc_rt::SPSEmpty>((uint64_t *)v95, (uint64_t)v25);
          v29 = (unint64_t)v95[0] & 0xFFFFFFFFFFFFFFFELL;
          if (((unint64_t)v95[0] & 0xFFFFFFFFFFFFFFFELL) != 0)
          {
            __orc_rt::Error::assertIsChecked(1);
            __orc_rt::Error::assertIsChecked(1);
            v48 = __s1[0];
            if (__s1[0] != v28)
            {
              do
              {
                v49 = v28 - 32;
                __orc_rt::WrapperFunctionCall::runWithSPSRet<__orc_rt::SPSEmpty,__orc_rt::SPSEmpty>(v87, (uint64_t)(v28 - 32));
                v50 = v87[0] & 0xFFFFFFFFFFFFFFFELL;
                v51 = v87[0] & 0xFFFFFFFFFFFFFFFELL | ((v87[0] & 0xFFFFFFFFFFFFFFFELL) == 0);
                v87[0] = v51;
                if (v50
                  && (*(unsigned int (**)(unint64_t, void *))(*(_QWORD *)v50 + 24))(v50, &_MergedGlobals))
                {
                  v87[0] = 1;
                  (*(void (**)(unint64_t))(*(_QWORD *)v50 + 8))(v50);
                  v51 = 1;
                }
                __orc_rt::Error::assertIsChecked(v51);
                v52 = (void *)*((_QWORD *)v28 - 3);
                if (v52)
                {
                  *((_QWORD *)v28 - 2) = v52;
                  operator delete(v52);
                }
                __s1[1] = v28 - 32;
                v28 -= 32;
              }
              while (v49 != v48);
            }
            __orc_rt::Error::assertIsChecked(1);
            goto LABEL_141;
          }
          __orc_rt::Error::assertIsChecked((unint64_t)v95[0] | 1);
        }
        if (v25[4])
        {
          if ((unint64_t)v28 >= (unint64_t)v92)
          {
            v30 = (v28 - __s1[0]) >> 5;
            if ((unint64_t)(v30 + 1) >> 59)
              goto LABEL_161;
            v31 = (uint64_t)(v92 - (unint64_t)__s1[0]) >> 4;
            if (v31 <= v30 + 1)
              v31 = v30 + 1;
            if ((unint64_t)v92 - (unint64_t)__s1[0] >= 0x7FFFFFFFFFFFFFE0)
              v32 = 0x7FFFFFFFFFFFFFFLL;
            else
              v32 = v31;
            if (v32)
            {
              if (v32 >> 59)
                goto LABEL_162;
              v33 = (char *)operator new(32 * v32);
            }
            else
            {
              v33 = 0;
            }
            v34 = &v33[32 * v30];
            v35 = &v33[32 * v32];
            std::construct_at[abi:nn180100]<__orc_rt::WrapperFunctionCall,__orc_rt::WrapperFunctionCall const&,__orc_rt::WrapperFunctionCall*>(v34, v25 + 4);
            v36 = __s1[0];
            v37 = __s1[1];
            if (__s1[1] == __s1[0])
            {
              __s1[0] = v34;
              *(_QWORD *)&v92 = v35;
            }
            else
            {
              v38 = 0;
              do
              {
                v39 = &v34[v38];
                v40 = &v37[v38];
                *((_QWORD *)v39 - 4) = *(_QWORD *)&v37[v38 - 32];
                *((_QWORD *)v39 - 3) = 0;
                *((_QWORD *)v39 - 2) = 0;
                *((_QWORD *)v39 - 1) = 0;
                *(_OWORD *)(v39 - 24) = *(_OWORD *)&v37[v38 - 24];
                *((_QWORD *)v39 - 1) = *(_QWORD *)&v37[v38 - 8];
                *((_QWORD *)v40 - 3) = 0;
                *((_QWORD *)v40 - 2) = 0;
                *((_QWORD *)v40 - 1) = 0;
                v38 -= 32;
              }
              while (&v37[v38] != v36);
              v37 = __s1[0];
              v41 = __s1[1];
              __s1[0] = &v34[v38];
              *(_QWORD *)&v92 = v35;
              while (v41 != v37)
              {
                v42 = (void *)*((_QWORD *)v41 - 3);
                if (v42)
                {
                  *((_QWORD *)v41 - 2) = v42;
                  operator delete(v42);
                }
                v41 -= 32;
              }
            }
            v28 = v34 + 32;
            v5 = a1;
            if (v37)
              operator delete(v37);
          }
          else
          {
            std::construct_at[abi:nn180100]<__orc_rt::WrapperFunctionCall,__orc_rt::WrapperFunctionCall const&,__orc_rt::WrapperFunctionCall*>(v28, v25 + 4);
            v28 += 32;
          }
          __s1[1] = v28;
        }
        v25 += 8;
        if (v25 == v16)
          goto LABEL_57;
      }
    }
    v28 = 0;
LABEL_57:
    std::mutex::lock((std::mutex *)v5);
    v43 = 0x9DDFEA08EB382D69 * (((8 * a2) + 8) ^ HIDWORD(a2));
    v44 = 0x9DDFEA08EB382D69 * (HIDWORD(a2) ^ (v43 >> 47) ^ v43);
    v45 = 0x9DDFEA08EB382D69 * (v44 ^ (v44 >> 47));
    v46 = *(_QWORD *)(v5 + 112);
    if (v46)
    {
      v47 = (uint8x8_t)vcnt_s8((int8x8_t)v46);
      v47.i16[0] = vaddlv_u8(v47);
      if (v47.u32[0] > 1uLL)
      {
        v4 = 0x9DDFEA08EB382D69 * (v44 ^ (v44 >> 47));
        if (v45 >= v46)
          v4 = v45 % v46;
      }
      else
      {
        v4 = (v46 - 1) & v45;
      }
      v53 = *(_QWORD **)(*(_QWORD *)(v5 + 104) + 8 * v4);
      if (v53)
      {
        v54 = (_QWORD *)*v53;
        if (*v53)
        {
          do
          {
            v55 = v54[1];
            if (v55 == v45)
            {
              if (v54[2] == a2)
                goto LABEL_138;
            }
            else
            {
              if (v47.u32[0] > 1uLL)
              {
                if (v55 >= v46)
                  v55 %= v46;
              }
              else
              {
                v55 &= v46 - 1;
              }
              if (v55 != v4)
                break;
            }
            v54 = (_QWORD *)*v54;
          }
          while (v54);
        }
      }
    }
    v56 = (_QWORD *)(v5 + 120);
    v54 = operator new(0x30uLL);
    *v54 = 0;
    v54[1] = v45;
    v54[2] = a2;
    v54[3] = 0;
    v54[4] = 0;
    v54[5] = 0;
    v57 = (float)(unint64_t)(*(_QWORD *)(v5 + 128) + 1);
    v58 = *(float *)(v5 + 136);
    if (v46 && (float)(v58 * (float)v46) >= v57)
    {
LABEL_128:
      v75 = *(_QWORD *)(v5 + 104);
      v76 = *(_QWORD **)(v75 + 8 * v4);
      if (v76)
      {
        *v54 = *v76;
      }
      else
      {
        v77 = (_QWORD *)*v56;
        *v54 = *v56;
        *v56 = v54;
        *(_QWORD *)(v75 + 8 * v4) = v56;
        if (!v77)
          goto LABEL_137;
        v78 = v77[1];
        if ((v46 & (v46 - 1)) != 0)
        {
          if (v78 >= v46)
            v78 %= v46;
        }
        else
        {
          v78 &= v46 - 1;
        }
        v76 = (_QWORD *)(*(_QWORD *)(v5 + 104) + 8 * v78);
      }
      *v76 = v54;
LABEL_137:
      ++*(_QWORD *)(v5 + 128);
LABEL_138:
      if (v54[3])
      {
        std::vector<__orc_rt::WrapperFunctionCall>::__clear[abi:nn180100](v54 + 3);
        operator delete((void *)v54[3]);
        v28 = __s1[1];
      }
      v79 = v92;
      v54[3] = __s1[0];
      v54[4] = v28;
      v54[5] = v79;
      __s1[1] = 0;
      *(_QWORD *)&v92 = 0;
      __s1[0] = 0;
      std::mutex::unlock((std::mutex *)v5);
      v29 = 0;
LABEL_141:
      __orc_rt::Error::assertIsChecked(1);
      v95[0] = (void **)__s1;
      std::vector<__orc_rt::WrapperFunctionCall>::__destroy_vector::operator()[abi:nn180100](v95);
      __s1[0] = (char *)v86;
      std::vector<__orc_rt::AllocationActionsPair>::__destroy_vector::operator()[abi:nn180100]((void ***)__s1);
      if (!v29)
      {
        v27 = 0;
LABEL_149:
        __orc_rt::Error::assertIsChecked(1);
        goto LABEL_150;
      }
      __orc_rt::Error::assertIsChecked(1);
      if (((*(uint64_t (**)(unint64_t, void *))(*(_QWORD *)v29 + 24))(v29, &_MergedGlobals) & 1) != 0)
      {
        (*(void (**)(char **__return_ptr, unint64_t))(*(_QWORD *)v29 + 40))(__s1, v29);
        (*(void (**)(unint64_t))(*(_QWORD *)v29 + 8))(v29);
        if (SBYTE7(v92) < 0)
        {
          v81 = __s1[0];
          v27 = strdup(__s1[0]);
          operator delete(v81);
          v29 = 1;
          goto LABEL_148;
        }
        v29 = 1;
      }
      else
      {
        __s1[0] = 0;
        __s1[1] = 0;
        *(_QWORD *)&v92 = 0;
      }
      v27 = strdup((const char *)__s1);
LABEL_148:
      __orc_rt::Error::assertIsChecked(v29);
      goto LABEL_149;
    }
    v59 = 1;
    if (v46 >= 3)
      v59 = (v46 & (v46 - 1)) != 0;
    v60 = v59 | (2 * v46);
    v61 = vcvtps_u32_f32(v57 / v58);
    if (v60 <= v61)
      prime = (int8x8_t)v61;
    else
      prime = (int8x8_t)v60;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
      v46 = *(_QWORD *)(v5 + 112);
    }
    if (*(_QWORD *)&prime > v46)
      goto LABEL_94;
    if (*(_QWORD *)&prime < v46)
    {
      v69 = vcvtps_u32_f32((float)*(unint64_t *)(v5 + 128) / *(float *)(v5 + 136));
      if (v46 < 3 || (v70 = (uint8x8_t)vcnt_s8((int8x8_t)v46), v70.i16[0] = vaddlv_u8(v70), v70.u32[0] > 1uLL))
      {
        v69 = std::__next_prime(v69);
      }
      else
      {
        v71 = 1 << -(char)__clz(v69 - 1);
        if (v69 >= 2)
          v69 = v71;
      }
      if (*(_QWORD *)&prime <= v69)
        prime = (int8x8_t)v69;
      if (*(_QWORD *)&prime >= v46)
      {
        v46 = *(_QWORD *)(v5 + 112);
      }
      else
      {
        if (prime)
        {
LABEL_94:
          if (*(_QWORD *)&prime >> 61)
LABEL_162:
            std::__throw_bad_array_new_length[abi:nn180100]();
          v63 = operator new(8 * *(_QWORD *)&prime);
          v64 = *(void **)(v5 + 104);
          *(_QWORD *)(v5 + 104) = v63;
          if (v64)
            operator delete(v64);
          v65 = 0;
          *(int8x8_t *)(v5 + 112) = prime;
          do
            *(_QWORD *)(*(_QWORD *)(v5 + 104) + 8 * v65++) = 0;
          while (*(_QWORD *)&prime != v65);
          v66 = (_QWORD *)*v56;
          if (*v56)
          {
            v67 = v66[1];
            v68 = (uint8x8_t)vcnt_s8(prime);
            v68.i16[0] = vaddlv_u8(v68);
            if (v68.u32[0] > 1uLL)
            {
              if (v67 >= *(_QWORD *)&prime)
                v67 %= *(_QWORD *)&prime;
            }
            else
            {
              v67 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*(_QWORD *)(v5 + 104) + 8 * v67) = v56;
            v72 = (_QWORD *)*v66;
            if (*v66)
            {
              do
              {
                v73 = v72[1];
                if (v68.u32[0] > 1uLL)
                {
                  if (v73 >= *(_QWORD *)&prime)
                    v73 %= *(_QWORD *)&prime;
                }
                else
                {
                  v73 &= *(_QWORD *)&prime - 1;
                }
                if (v73 != v67)
                {
                  v74 = *(_QWORD *)(v5 + 104);
                  if (!*(_QWORD *)(v74 + 8 * v73))
                  {
                    *(_QWORD *)(v74 + 8 * v73) = v66;
                    goto LABEL_119;
                  }
                  *v66 = *v72;
                  *v72 = **(_QWORD **)(*(_QWORD *)(v5 + 104) + 8 * v73);
                  **(_QWORD **)(*(_QWORD *)(v5 + 104) + 8 * v73) = v72;
                  v72 = v66;
                }
                v73 = v67;
LABEL_119:
                v66 = v72;
                v72 = (_QWORD *)*v72;
                v67 = v73;
              }
              while (v72);
            }
          }
          v46 = (unint64_t)prime;
          goto LABEL_123;
        }
        v82 = *(void **)(v5 + 104);
        *(_QWORD *)(v5 + 104) = 0;
        if (v82)
          operator delete(v82);
        v46 = 0;
        *(_QWORD *)(v5 + 112) = 0;
      }
    }
LABEL_123:
    if ((v46 & (v46 - 1)) != 0)
    {
      if (v45 >= v46)
        v4 = v45 % v46;
      else
        v4 = v45;
    }
    else
    {
      v4 = (v46 - 1) & v45;
    }
    goto LABEL_128;
  }
LABEL_22:
  v27 = strdup("Failed to deserialize allocation actions");
LABEL_150:
  __s1[0] = (char *)&v88;
  std::vector<__orc_rt::AllocationActionsPair>::__destroy_vector::operator()[abi:nn180100]((void ***)__s1);
  return v27;
}

unint64_t __xojit_executor_write_mem(unint64_t *a1, unint64_t a2)
{
  NSObject *v4;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  int64x2_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  const void **v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  int64x2_t v33;
  char *v34;
  const void **v35;
  const void **v36;
  const void **v37;
  void *v38;
  uint64_t *v40;
  unint64_t v41;
  void *v42[2];
  _QWORD v43[2];
  uint64_t v44;
  void *__p;
  uint64_t v46;
  uint64_t v47;
  uint8_t buf[8];
  int64x2_t v49;
  char *v50;
  _QWORD *v51;

  v4 = qword_257967440;
  if (os_log_type_enabled((os_log_t)qword_257967440, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_24B2B8000, v4, OS_LOG_TYPE_DEBUG, "write_mem", buf, 2u);
  }
  v42[0] = 0;
  v42[1] = 0;
  v43[0] = 0;
  v5 = a2 - 8;
  if (a2 >= 8)
  {
    v6 = *a1;
    v40 = (uint64_t *)(a1 + 1);
    v41 = v5;
    if (!v6)
      return v6;
    if (v6 >> 59)
LABEL_41:
      abort();
    v51 = v43;
    v7 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::RemoteSymbolLookupSetElement>>(v6);
    v9 = vdupq_n_s64((unint64_t)v42[1]);
    v42[0] = v7;
    v42[1] = v7;
    v49 = v9;
    v10 = (char *)v43[0];
    v43[0] = &v7[32 * v8];
    v50 = v10;
    *(_QWORD *)buf = v9.i64[0];
    std::__split_buffer<std::pair<__orc_rt::ExecutorAddr,std::vector<char>>>::~__split_buffer((uint64_t)buf);
    v11 = 0;
    while (1)
    {
      __p = 0;
      v46 = 0;
      v47 = 0;
      if (v41 < 8)
        break;
      v12 = *v40++;
      v41 -= 8;
      v44 = v12;
      v13 = __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::vector<char>,void>::deserialize((uint64_t)&v40, (unint64_t *)&__p);
      v14 = __p;
      if (!v13)
      {
        if (__p)
          operator delete(__p);
        break;
      }
      v15 = v44;
      v17 = v46;
      v16 = v47;
      v18 = v42[1];
      if (v42[1] >= (void *)v43[0])
      {
        v20 = ((char *)v42[1] - (char *)v42[0]) >> 5;
        v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 59)
          goto LABEL_41;
        v22 = v43[0] - (unint64_t)v42[0];
        if ((uint64_t)(v43[0] - (unint64_t)v42[0]) >> 4 > v21)
          v21 = v22 >> 4;
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFE0)
          v23 = 0x7FFFFFFFFFFFFFFLL;
        else
          v23 = v21;
        v51 = v43;
        v24 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::RemoteSymbolLookupSetElement>>(v23);
        v25 = &v24[32 * v20];
        *(_QWORD *)buf = v24;
        v49.i64[0] = (uint64_t)v25;
        v50 = &v24[32 * v26];
        *(_QWORD *)v25 = v15;
        *((_QWORD *)v25 + 1) = v14;
        *((_QWORD *)v25 + 2) = 0;
        *((_QWORD *)v25 + 3) = v16;
        *((_QWORD *)v25 + 2) = v17;
        v19 = (const void **)(v25 + 32);
        v49.i64[1] = (uint64_t)(v25 + 32);
        v28 = (char *)v42[0];
        v27 = (char *)v42[1];
        v29 = (char *)v49.i64[0];
        if (v42[1] == v42[0])
        {
          v33 = vdupq_n_s64((unint64_t)v42[1]);
        }
        else
        {
          v30 = 0;
          do
          {
            v31 = &v29[v30];
            v32 = &v27[v30];
            *((_QWORD *)v31 - 4) = *(_QWORD *)&v27[v30 - 32];
            *((_QWORD *)v31 - 3) = 0;
            *((_QWORD *)v31 - 2) = 0;
            *((_QWORD *)v31 - 1) = 0;
            *(_OWORD *)(v31 - 24) = *(_OWORD *)&v27[v30 - 24];
            *((_QWORD *)v31 - 1) = *(_QWORD *)&v27[v30 - 8];
            *((_QWORD *)v32 - 3) = 0;
            *((_QWORD *)v32 - 2) = 0;
            *((_QWORD *)v32 - 1) = 0;
            v30 -= 32;
          }
          while (&v27[v30] != v28);
          v33 = *(int64x2_t *)v42;
          v19 = (const void **)v49.i64[1];
          v29 += v30;
        }
        v42[0] = v29;
        v42[1] = v19;
        v49 = v33;
        v34 = (char *)v43[0];
        v43[0] = v50;
        v50 = v34;
        *(_QWORD *)buf = v33.i64[0];
        std::__split_buffer<std::pair<__orc_rt::ExecutorAddr,std::vector<char>>>::~__split_buffer((uint64_t)buf);
      }
      else
      {
        *(_QWORD *)v42[1] = v44;
        v18[1] = v14;
        v19 = (const void **)(v18 + 4);
        v18[2] = v17;
        v18[3] = v16;
      }
      v42[1] = v19;
      if (++v11 == v6)
      {
        v35 = (const void **)v42[0];
        if (v42[0] != v19)
        {
          do
          {
            memcpy((void *)*v35, v35[1], (_BYTE *)v35[2] - (_BYTE *)v35[1]);
            v35 += 4;
          }
          while (v35 != v19);
          v6 = 0;
          goto LABEL_31;
        }
        v6 = 0;
        if (v19)
          goto LABEL_32;
        return v6;
      }
    }
  }
  __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)buf, "Could not deserialize arguments");
  v6 = *(_QWORD *)buf;
LABEL_31:
  v19 = (const void **)v42[0];
  if (v42[0])
  {
LABEL_32:
    v36 = (const void **)v42[1];
    v37 = v19;
    if (v42[1] != v19)
    {
      do
      {
        v38 = (void *)*(v36 - 3);
        if (v38)
        {
          *(v36 - 2) = v38;
          operator delete(v38);
        }
        v36 -= 4;
      }
      while (v36 != v19);
      v37 = (const void **)v42[0];
    }
    v42[1] = v19;
    operator delete(v37);
  }
  return v6;
}

char *__orc_rt::WrapperFunctionResult::createOutOfBandError(__orc_rt::WrapperFunctionResult *this, const char *__s)
{
  size_t v4;
  char *v5;
  char *result;

  v4 = strlen(__s);
  v5 = (char *)malloc_type_malloc(v4 + 1, 0xBD88B51uLL);
  result = strcpy(v5, __s);
  *(_QWORD *)this = result;
  *((_QWORD *)this + 1) = 0;
  return result;
}

uint64_t __xojit_executor_epc_run_as_main()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = qword_257967440;
  if (os_log_type_enabled((os_log_t)qword_257967440, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v2 = 0;
    _os_log_debug_impl(&dword_24B2B8000, v0, OS_LOG_TYPE_DEBUG, "runAsMain", v2, 2u);
  }
  return 0;
}

uint64_t __xojit_executor_epc_run_as_void()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = qword_257967440;
  if (os_log_type_enabled((os_log_t)qword_257967440, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v2 = 0;
    _os_log_debug_impl(&dword_24B2B8000, v0, OS_LOG_TYPE_DEBUG, "runAsVoid", v2, 2u);
  }
  return 0;
}

uint64_t __xojit_executor_epc_run_as_int()
{
  NSObject *v0;
  uint8_t v2[16];

  v0 = qword_257967440;
  if (os_log_type_enabled((os_log_t)qword_257967440, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v2 = 0;
    _os_log_debug_impl(&dword_24B2B8000, v0, OS_LOG_TYPE_DEBUG, "runAsInt", v2, 2u);
  }
  return 0;
}

void xojit_executor_set_run_program_on_main_thread(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  std::exception_ptr v7;

  v2 = qword_257967448;
  if (!qword_257967448
    || (std::mutex::lock((std::mutex *)(qword_257967448 + 24)), (*(_BYTE *)(v2 + 136) & 1) != 0)
    || (v7.__ptr_ = 0, v5 = *(_QWORD *)(v2 + 16), std::exception_ptr::~exception_ptr(&v7), v5))
  {
    v6 = std::__throw_future_error[abi:nn180100]();
    __xojit_executor_run_program_on_main_thread(v6);
  }
  else
  {
    *(_QWORD *)(v2 + 144) = a1;
    *(_QWORD *)(v2 + 152) = a2;
    *(_DWORD *)(v2 + 136) |= 5u;
    std::condition_variable::notify_all((std::condition_variable *)(v2 + 88));
    std::mutex::unlock((std::mutex *)(v2 + 24));
  }
}

uint64_t __xojit_executor_run_program_on_main_thread(_QWORD *a1, unint64_t a2)
{
  const std::exception_ptr *p_exception;
  std::__assoc_sub_state *v3;
  unsigned int state;
  unint64_t *p_shared_owners;
  unint64_t v8;
  void *ptr;
  std::__assoc_sub_state_vtbl *v10;
  uint64_t (*shared_owners)(std::__assoc_sub_state_vtbl *, _QWORD, _QWORD *, unint64_t);
  unint64_t v12;
  std::unique_lock<std::mutex>::mutex_type *m;
  uint64_t v14;
  std::unique_lock<std::mutex>::mutex_type *v15;
  std::exception_ptr v17;
  std::exception_ptr v18;
  std::unique_lock<std::mutex> __lk;

  v3 = (std::__assoc_sub_state *)qword_257967448;
  if (!qword_257967448
    || (p_exception = (const std::exception_ptr *)(qword_257967448 + 24),
        std::mutex::lock((std::mutex *)(qword_257967448 + 24)),
        state = v3->__state_,
        (state & 2) != 0))
  {
    std::__throw_future_error[abi:nn180100]();
LABEL_16:
    std::exception_ptr::exception_ptr(&v18, p_exception);
    v17.__ptr_ = &v18;
    std::rethrow_exception(v17);
    return __xojit_executor_run_program_wrapper();
  }
  p_shared_owners = (unint64_t *)&v3->__shared_owners_;
  do
    v8 = __ldxr(p_shared_owners);
  while (__stxr(v8 + 1, p_shared_owners));
  v3->__state_ = state | 2;
  std::mutex::unlock(&v3->__mut_);
  __lk.__m_ = &v3->__mut_;
  __lk.__owns_ = 1;
  std::mutex::lock(&v3->__mut_);
  std::__assoc_sub_state::__sub_wait(v3, &__lk);
  p_exception = &v3->__exception_;
  ptr = v3->__exception_.__ptr_;
  v18.__ptr_ = 0;
  std::exception_ptr::~exception_ptr(&v18);
  if (ptr)
    goto LABEL_16;
  v10 = v3[1].__vftable;
  shared_owners = (uint64_t (*)(std::__assoc_sub_state_vtbl *, _QWORD, _QWORD *, unint64_t))v3[1].__shared_owners_;
  if (__lk.__owns_)
    std::mutex::unlock(__lk.__m_);
  do
    v12 = __ldaxr(p_shared_owners);
  while (__stlxr(v12 - 1, p_shared_owners));
  if (!v12)
    ((void (*)(std::__assoc_sub_state *))v3->__on_zero_shared)(v3);
  if (a2 < 8)
  {
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&__lk, "Could not serialize result");
    m = __lk.__m_;
  }
  else
  {
    m = (std::unique_lock<std::mutex>::mutex_type *)shared_owners(v10, *a1, a1 + 1, a2 - 8);
  }
  v14 = operator new();
  *(_QWORD *)(v14 + 16) = 0;
  *(_QWORD *)(v14 + 24) = 850045863;
  *(_OWORD *)(v14 + 32) = 0u;
  *(_OWORD *)(v14 + 48) = 0u;
  *(_OWORD *)(v14 + 64) = 0u;
  *(_QWORD *)(v14 + 80) = 0;
  *(_QWORD *)(v14 + 88) = 1018212795;
  *(_OWORD *)(v14 + 96) = 0u;
  *(_OWORD *)(v14 + 112) = 0u;
  *(_OWORD *)(v14 + 124) = 0u;
  *(_QWORD *)v14 = &off_251C387F8;
  *(_QWORD *)(v14 + 8) = 0;
  v15 = (std::unique_lock<std::mutex>::mutex_type *)qword_257967448;
  qword_257967448 = v14;
  __lk.__m_ = v15;
  std::promise<std::pair<void *,orc_rt_CWrapperFunctionResult (*)(void *,unsigned long long,char const*,unsigned long)>>::~promise((uint64_t *)&__lk);
  return (uint64_t)m;
}

uint64_t __xojit_executor_run_program_wrapper(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  unint64_t v5;
  int64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  int64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  char *v28;
  char *v29;
  uint64_t *v30;
  NSObject *v31;
  const void **v32;
  const void **v33;
  int64_t v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  char *v39;
  uint64_t v40;
  int64x2_t v41;
  unint64_t v43;
  size_t v44;
  void *v45;
  char *v46;
  void *v47;
  int64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  unint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  uint64_t v56;
  int64x2_t v57;
  unint64_t v58;
  uint64_t *v59;
  uint64_t *v60;
  int64_t v61;
  unint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  char *v75;
  __objc2_meth_list **p_opt_class_meths;
  const char *v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  char *v81;
  uint64_t v82;
  uint8_t *v83;
  NSObject *v84;
  void *v85;
  uint64_t (*v86)(_QWORD, char *);
  NSObject *v87;
  int v88;
  NSObject *v89;
  uint64_t v90;
  NSObject *v91;
  char *v92;
  _QWORD *v93;
  _QWORD *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint8_t buf[16];
  void *v99[2];
  __int128 v100;
  void *__p[2];
  char *v102;
  void *v103[2];
  _QWORD v104[2];
  _BYTE v105[24];
  unint64_t v106;
  _QWORD *v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v4 = qword_257967440;
  if (os_log_type_enabled((os_log_t)qword_257967440, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B2B8000, v4, OS_LOG_TYPE_DEFAULT, "__xojit_executor_run_program_wrapper", buf, 2u);
  }
  v102 = 0;
  v100 = 0u;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)buf = 0u;
  *(_OWORD *)v99 = 0u;
  *(_QWORD *)v105 = a1;
  *(_QWORD *)&v105[8] = a2;
  if (!__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::deserialize((uint64_t)v105, (std::string *)buf)|| !__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::deserialize((uint64_t)v105, (std::string *)&v99[1])|| *(_QWORD *)&v105[8] < 8uLL)
  {
LABEL_43:
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)v105, "Could not deserialize arguments for wrapper function call");
    goto LABEL_44;
  }
  v5 = **(_QWORD **)v105;
  *(_QWORD *)v105 += 8;
  *(_QWORD *)&v105[8] -= 8;
  if (v5 > (v102 - (char *)__p[0]) >> 4)
  {
    if (v5 >> 60)
      goto LABEL_142;
    v6 = (char *)__p[1] - (char *)__p[0];
    v7 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v5);
    v8 = &v7[v6 & 0xFFFFFFFFFFFFFFF0];
    v10 = &v7[16 * v9];
    v12 = (char *)__p[0];
    v11 = (char *)__p[1];
    v13 = v8;
    if (__p[1] != __p[0])
    {
      do
      {
        *((_OWORD *)v13 - 1) = *((_OWORD *)v11 - 1);
        v13 -= 16;
        v11 -= 16;
      }
      while (v11 != v12);
      v11 = (char *)__p[0];
    }
    __p[0] = v13;
    __p[1] = v8;
    v102 = v10;
    if (v11)
      operator delete(v11);
  }
  if (v5)
  {
    v14 = 0;
    do
    {
      v15 = *(_QWORD *)&v105[8] - 8;
      if (*(_QWORD *)&v105[8] < 8uLL)
        goto LABEL_43;
      v16 = **(_QWORD **)v105;
      v17 = v15 >= **(_QWORD **)v105;
      v18 = v15 - **(_QWORD **)v105;
      if (!v17)
        goto LABEL_43;
      v19 = *(_QWORD *)v105 + 8;
      *(_QWORD *)v105 += 8 + v16;
      *(_QWORD *)&v105[8] = v18;
      v20 = __p[1];
      if (__p[1] >= v102)
      {
        v22 = ((char *)__p[1] - (char *)__p[0]) >> 4;
        v23 = v22 + 1;
        if ((unint64_t)(v22 + 1) >> 60)
          goto LABEL_142;
        v24 = v102 - (char *)__p[0];
        if ((v102 - (char *)__p[0]) >> 3 > v23)
          v23 = v24 >> 3;
        if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF0)
          v25 = 0xFFFFFFFFFFFFFFFLL;
        else
          v25 = v23;
        if (v25)
          v25 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v25);
        else
          v26 = 0;
        v27 = (uint64_t *)(v25 + 16 * v22);
        *v27 = v19;
        v27[1] = v16;
        v29 = (char *)__p[0];
        v28 = (char *)__p[1];
        v30 = v27;
        if (__p[1] != __p[0])
        {
          do
          {
            *((_OWORD *)v30 - 1) = *((_OWORD *)v28 - 1);
            v30 -= 2;
            v28 -= 16;
          }
          while (v28 != v29);
          v28 = (char *)__p[0];
        }
        v21 = v27 + 2;
        __p[0] = v30;
        __p[1] = v27 + 2;
        v102 = (char *)(v25 + 16 * v26);
        if (v28)
          operator delete(v28);
      }
      else
      {
        *(_QWORD *)__p[1] = v19;
        v20[1] = v16;
        v21 = v20 + 2;
      }
      __p[1] = v21;
    }
    while (++v14 != v5);
  }
  v31 = qword_257967440;
  if (os_log_type_enabled((os_log_t)qword_257967440, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v105 = 0;
    _os_log_impl(&dword_24B2B8000, v31, OS_LOG_TYPE_DEFAULT, "__xojit_executor_run_program_wrapper -- CB", v105, 2u);
  }
  v103[0] = 0;
  v103[1] = 0;
  v104[0] = 0;
  v32 = (const void **)__p[0];
  v33 = (const void **)__p[1];
  v34 = (char *)__p[1] - (char *)__p[0];
  if (__p[1] != __p[0])
  {
    if (v34 < 0)
      goto LABEL_142;
    v107 = v104;
    v35 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorAddr>>(v34 >> 4);
    v38 = v103[0];
    v37 = v103[1];
    if (v103[1] == v103[0])
    {
      v41 = vdupq_n_s64((unint64_t)v103[1]);
      v39 = v35;
    }
    else
    {
      v39 = v35;
      do
      {
        v40 = *--v37;
        *v37 = 0;
        *((_QWORD *)v39 - 1) = v40;
        v39 -= 8;
      }
      while (v37 != v38);
      v41 = *(int64x2_t *)v103;
    }
    v103[0] = v39;
    v103[1] = v35;
    *(int64x2_t *)&v105[8] = v41;
    v43 = v104[0];
    v104[0] = &v35[8 * v36];
    v106 = v43;
    *(_QWORD *)v105 = v41.i64[0];
    std::__split_buffer<std::unique_ptr<char []>>::~__split_buffer((uint64_t)v105);
    v32 = (const void **)__p[0];
    v33 = (const void **)__p[1];
  }
  for (; v32 != v33; v32 += 2)
  {
    v44 = (size_t)v32[1] + 1;
    v45 = (void *)operator new[]();
    bzero(v45, v44);
    v46 = (char *)v103[1];
    if (v103[1] >= (void *)v104[0])
    {
      v48 = ((char *)v103[1] - (char *)v103[0]) >> 3;
      if ((unint64_t)(v48 + 1) >> 61)
        goto LABEL_142;
      v49 = (uint64_t)(v104[0] - (unint64_t)v103[0]) >> 2;
      if (v49 <= v48 + 1)
        v49 = v48 + 1;
      if (v104[0] - (unint64_t)v103[0] >= 0x7FFFFFFFFFFFFFF8)
        v50 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v50 = v49;
      v107 = v104;
      if (v50)
        v50 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorAddr>>(v50);
      else
        v51 = 0;
      v52 = (_QWORD *)(v50 + 8 * v48);
      v53 = v50 + 8 * v51;
      v106 = v53;
      *v52 = v45;
      v47 = v52 + 1;
      *(_QWORD *)&v105[16] = v52 + 1;
      v55 = v103[0];
      v54 = v103[1];
      if (v103[1] == v103[0])
      {
        v57 = vdupq_n_s64((unint64_t)v103[1]);
      }
      else
      {
        do
        {
          v56 = *--v54;
          *v54 = 0;
          *--v52 = v56;
        }
        while (v54 != v55);
        v57 = *(int64x2_t *)v103;
        v47 = *(void **)&v105[16];
        v53 = v106;
      }
      v103[0] = v52;
      v103[1] = v47;
      *(int64x2_t *)&v105[8] = v57;
      v58 = v104[0];
      v104[0] = v53;
      v106 = v58;
      *(_QWORD *)v105 = v57.i64[0];
      std::__split_buffer<std::unique_ptr<char []>>::~__split_buffer((uint64_t)v105);
    }
    else
    {
      *(_QWORD *)v103[1] = v45;
      v47 = v46 + 8;
    }
    v103[1] = v47;
    memcpy(*((void **)v47 - 1), *v32, (size_t)v32[1]);
    *((_BYTE *)v32[1] + *((_QWORD *)v103[1] - 1)) = 0;
  }
  v59 = (uint64_t *)v103[0];
  v60 = (uint64_t *)v103[1];
  v61 = ((char *)v103[1] - (char *)v103[0]) >> 3;
  v62 = v61 + 1;
  if (v61 == -1)
  {
    v63 = 0;
    v64 = 0;
  }
  else
  {
    if (v62 >> 61)
      goto LABEL_142;
    v63 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorAddr>>(v62);
    v64 = &v63[8 * v65];
    v59 = (uint64_t *)v103[0];
    v60 = (uint64_t *)v103[1];
  }
  if (v59 == v60)
  {
    v68 = v63;
  }
  else
  {
    v66 = v63;
    do
    {
      v67 = *v59;
      if (v66 >= v64)
      {
        v69 = (v66 - v63) >> 3;
        v70 = v69 + 1;
        if ((unint64_t)(v69 + 1) >> 61)
          goto LABEL_142;
        if ((v64 - v63) >> 2 > v70)
          v70 = (v64 - v63) >> 2;
        if ((unint64_t)(v64 - v63) >= 0x7FFFFFFFFFFFFFF8)
          v71 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v71 = v70;
        if (v71)
          v71 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorAddr>>(v71);
        else
          v72 = 0;
        v73 = (char *)(v71 + 8 * v69);
        *(_QWORD *)v73 = v67;
        v68 = v73 + 8;
        while (v66 != v63)
        {
          v74 = *((_QWORD *)v66 - 1);
          v66 -= 8;
          *((_QWORD *)v73 - 1) = v74;
          v73 -= 8;
        }
        v64 = (char *)(v71 + 8 * v72);
        if (v63)
          operator delete(v63);
        v63 = v73;
      }
      else
      {
        *(_QWORD *)v66 = v67;
        v68 = v66 + 8;
      }
      ++v59;
      v66 = v68;
    }
    while (v59 != v60);
  }
  if (v68 < v64)
  {
    *(_QWORD *)v68 = 0;
    v75 = v68 + 8;
    p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___OS_xpc_object + 48);
    v77 = (const char *)&v99[1];
    goto LABEL_113;
  }
  v78 = (v68 - v63) >> 3;
  v79 = v78 + 1;
  p_opt_class_meths = &OBJC_PROTOCOL___OS_xpc_object.opt_class_meths;
  v77 = (const char *)&v99[1];
  if ((unint64_t)(v78 + 1) >> 61)
LABEL_142:
    abort();
  if ((v64 - v63) >> 2 > v79)
    v79 = (v64 - v63) >> 2;
  if ((unint64_t)(v64 - v63) >= 0x7FFFFFFFFFFFFFF8)
    v80 = 0x1FFFFFFFFFFFFFFFLL;
  else
    v80 = v79;
  if (v80)
    v80 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorAddr>>(v80);
  v81 = (char *)(v80 + 8 * v78);
  *(_QWORD *)v81 = 0;
  v75 = v81 + 8;
  while (v68 != v63)
  {
    v82 = *((_QWORD *)v68 - 1);
    v68 -= 8;
    *((_QWORD *)v81 - 1) = v82;
    v81 -= 8;
  }
  if (v63)
    operator delete(v63);
  v63 = v81;
LABEL_113:
  if (SHIBYTE(v99[0]) >= 0)
    v83 = buf;
  else
    v83 = *(uint8_t **)buf;
  if (v100 < 0)
    v77 = (const char *)v99[1];
  v84 = p_opt_class_meths[136];
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v105 = 136315650;
    *(_QWORD *)&v105[4] = v83;
    *(_WORD *)&v105[12] = 2080;
    *(_QWORD *)&v105[14] = v77;
    *(_WORD *)&v105[22] = 1024;
    LODWORD(v106) = ((unint64_t)(v75 - v63) >> 3) - 1;
    _os_log_impl(&dword_24B2B8000, v84, OS_LOG_TYPE_DEFAULT, "__xojit_executor_run_program %s %s %d", v105, 0x1Cu);
  }
  v85 = dlopen((const char *)v83, 1);
  if (v85)
  {
    v86 = (uint64_t (*)(_QWORD, char *))dlsym(v85, v77);
    v87 = p_opt_class_meths[136];
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v105 = 134217984;
      *(_QWORD *)&v105[4] = v86;
      _os_log_impl(&dword_24B2B8000, v87, OS_LOG_TYPE_DEFAULT, "  Main = %p", v105, 0xCu);
    }
    if (v86)
    {
      v88 = v86(((unint64_t)(v75 - v63) >> 3) - 1, v63);
      v89 = p_opt_class_meths[136];
      if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v105 = 67109120;
        *(_DWORD *)&v105[4] = v88;
        _os_log_impl(&dword_24B2B8000, v89, OS_LOG_TYPE_DEFAULT, "  Result = %d", v105, 8u);
      }
      v90 = v88;
      goto LABEL_132;
    }
    v91 = p_opt_class_meths[136];
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
      goto LABEL_130;
  }
  else
  {
    v91 = p_opt_class_meths[136];
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
LABEL_130:
      v92 = dlerror();
      *(_DWORD *)v105 = 136315138;
      *(_QWORD *)&v105[4] = v92;
      _os_log_impl(&dword_24B2B8000, v91, OS_LOG_TYPE_DEFAULT, "%s", v105, 0xCu);
    }
  }
  v90 = -1;
LABEL_132:
  if (v63)
    operator delete(v63);
  v93 = v103[0];
  if (v103[0])
  {
    v94 = v103[1];
    v95 = v103[0];
    if (v103[1] != v103[0])
    {
      do
      {
        v97 = *--v94;
        v96 = v97;
        *v94 = 0;
        if (v97)
          MEMORY[0x24BD1BEE4](v96, 0x1000C8077774924);
      }
      while (v94 != v93);
      v95 = v103[0];
    }
    v103[1] = v93;
    operator delete(v95);
  }
  *(_QWORD *)v105 = v90;
  *(_QWORD *)&v105[8] = 8;
LABEL_44:
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (SHIBYTE(v100) < 0)
    operator delete(v99[1]);
  if (SHIBYTE(v99[0]) < 0)
    operator delete(*(void **)buf);
  return *(_QWORD *)v105;
}

uint64_t __xojit_run_wrapper(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a2, a3);
}

uint64_t llvm_orc_registerJITLoaderGDBAllocAction(uint64_t *a1, unint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  _QWORD *v7;
  uint64_t v9;
  __orc_rt::Error *v10;

  if (a2 < 8 || a2 == 16 || (a2 & 0xFFFFFFFFFFFFFFF8) == 8)
  {
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&v9, "Could not deserialize arguments for wrapper function call");
  }
  else
  {
    v2 = *a1;
    v3 = *((unsigned __int8 *)a1 + 16);
    v4 = a1[1] - *a1;
    v5 = operator new();
    *(_QWORD *)(v5 + 16) = v2;
    *(_QWORD *)(v5 + 24) = v4;
    *(_QWORD *)(v5 + 8) = 0;
    if ((v6 & 1) == 0
    {
      __cxa_atexit((void (*)(void *))MEMORY[0x24BEDB380], &appendJITDebugDescriptor(char const*,unsigned long)::JITDebugLock, &dword_24B2B8000);
    }
    std::mutex::lock(&appendJITDebugDescriptor(char const*,unsigned long)::JITDebugLock);
    v7 = off_2579671D0;
    *(_QWORD *)v5 = off_2579671D0;
    if (v7)
      v7[1] = v5;
    off_2579671D0 = (_UNKNOWN *)v5;
    *(_QWORD *)algn_2579671C8 = v5;
    dword_2579671C4 = 1;
    std::mutex::unlock(&appendJITDebugDescriptor(char const*,unsigned long)::JITDebugLock);
    if (v3)
      __jit_debug_register_code();
    __orc_rt::Error::assertIsChecked(1);
    v10 = 0;
    __orc_rt::detail::ResultSerializer<__orc_rt::SPSError,__orc_rt::Error>::serialize((__orc_rt::WrapperFunctionResult *)&v9, (uint64_t *)&v10);
    __orc_rt::Error::assertIsChecked((uint64_t)v10);
    __orc_rt::Error::assertIsChecked(1);
  }
  return v9;
}

uint64_t xojit_executor_is_sandboxed()
{
  getpid();
  return sandbox_check();
}

uint64_t xojit_executor_use_oopjit()
{
  return 1;
}

xpc_object_t xojit_create_setup_message(std::string::value_type *__s, void *a2, char a3, char a4, uint64_t a5, unint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  char **v14;
  char *v15;
  char v16;
  uint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint8x8_t v22;
  unint64_t v23;
  unsigned __int8 **v24;
  unsigned __int8 *i;
  unint64_t v26;
  uint64_t v27;
  float v28;
  _BOOL8 v29;
  unint64_t v30;
  unint64_t v31;
  int8x8_t prime;
  void *v33;
  void *v34;
  uint64_t v35;
  _QWORD **v36;
  unint64_t v37;
  uint8x8_t v38;
  unint64_t v39;
  uint8x8_t v40;
  uint64_t v41;
  _QWORD *j;
  unint64_t v43;
  _QWORD *v44;
  unsigned __int8 **v45;
  unint64_t v46;
  void *v47;
  _BYTE *v48;
  _BYTE *v49;
  _QWORD *v50;
  _QWORD *v51;
  void *v52;
  _BYTE *v53;
  _BYTE *v54;
  _QWORD *v55;
  void *v56;
  std::string::size_type size;
  _QWORD *v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  std::string::size_type v65;
  void *v66;
  void *v67;
  void **v68;
  unint64_t v69;
  void **v70;
  void **v71;
  unint64_t v72;
  _QWORD *v73;
  xpc_object_t empty;
  unint64_t v75;
  void **v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v84;
  unint64_t v85;
  void **v86;
  void **v87;
  void *v88;
  void **v89;
  void **v90;
  void *v91;
  char *v92;
  char *v93;
  void *v94;
  void *v95;
  void **v99;
  unint64_t v100;
  void *v101[2];
  uint64_t v102;
  std::string v103;
  void *v104;
  void *v105[2];
  void *v106[2];
  int v107;
  void *__p[2];
  void *v109[2];
  float v110;
  _QWORD v111[42];

  v111[40] = *MEMORY[0x24BDAC8D0];
  memset(&v103, 0, sizeof(v103));
  *(_OWORD *)v105 = 0u;
  *(_OWORD *)v106 = 0u;
  v107 = 1065353216;
  *(_OWORD *)__p = 0u;
  *(_OWORD *)v109 = 0u;
  v110 = 1.0;
  std::string::__assign_external(&v103, __s);
  v13 = 0;
  v104 = a2;
  v111[0] = "__llvm_orc_SimpleRemoteEPC_dispatch_fn";
  v111[1] = a5;
  v111[2] = "__llvm_orc_SimpleRemoteEPC_dispatch_ctx";
  v111[3] = a6;
  v111[4] = "__xojit_xpcmemmgr_instance";
  v111[5] = a7;
  v111[6] = "__xojit_xpcmemmgr_acquire_slab";
  v111[7] = xojit_xpcmemmgr_acquire_slab;
  v111[8] = "__xojit_xpcmemmgr_release_slab";
  v111[9] = xojit_xpcmemmgr_release_slab;
  v111[10] = "__xojit_xpcmemmgr_deallocate";
  v111[11] = xojit_xpcmemmgr_deallocate;
  v111[12] = "__xojit_xpcmemmgr_make_read_only";
  v111[13] = xojit_xpcmemmgr_make_read_only;
  v111[14] = "__xojit_xpcmemmgr_apply_sandbox_extension";
  v111[15] = xojit_xpcmemmgr_apply_sandbox_extension;
  v111[16] = "__xojit_memaccess_write_uint8s";
  v111[17] = xojit_memaccess_write_uints_wrapper<unsigned char>;
  v111[18] = "__xojit_memaccess_write_uint16s";
  v111[19] = xojit_memaccess_write_uints_wrapper<unsigned short>;
  v111[20] = "__xojit_memaccess_write_uint32s";
  v111[21] = xojit_memaccess_write_uints_wrapper<unsigned int>;
  v111[22] = "__xojit_memaccess_write_uint64s";
  v111[23] = xojit_memaccess_write_uints_wrapper<unsigned long long>;
  v111[24] = "__xojit_memaccess_write_buffers";
  v111[25] = xojit_memaccess_write_buffers_wrapper;
  v111[26] = "__llvm_orc_SimpleExecutorDylibManager_Instance";
  v111[27] = a8;
  v111[28] = "__llvm_orc_SimpleExecutorDylibManager_open_wrapper";
  v111[29] = xojit_dylibmgr_dlopen_wrapper;
  v111[30] = "__llvm_orc_SimpleExecutorDylibManager_lookup_wrapper";
  v111[31] = xojit_dylibmgr_dlsym_wrapper;
  v111[32] = "__llvm_orc_bootstrap_run_as_main_wrapper";
  v111[33] = __xojit_executor_epc_run_as_main;
  v111[34] = "__llvm_orc_bootstrap_run_as_void_function_wrapper";
  v111[35] = __xojit_executor_epc_run_as_void;
  v111[36] = "__llvm_orc_bootstrap_run_as_int_function_wrapper";
  v111[37] = __xojit_executor_epc_run_as_int;
  v111[38] = "_llvm_orc_registerJITLoaderGDBAllocAction";
  v111[39] = llvm_orc_registerJITLoaderGDBAllocAction;
  do
  {
    v14 = (char **)&v111[2 * v13];
    v15 = v14[1];
    std::string::basic_string[abi:nn180100]<0>(v101, *v14);
    v16 = HIBYTE(v102);
    if (v102 >= 0)
      v17 = (uint64_t *)v101;
    else
      v17 = (uint64_t *)v101[0];
    if (v102 >= 0)
      v18 = HIBYTE(v102);
    else
      v18 = (unint64_t)v101[1];
    v19 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v17, v18);
    v20 = v19;
    v21 = (unint64_t)__p[1];
    if (__p[1])
    {
      v22 = (uint8x8_t)vcnt_s8((int8x8_t)__p[1]);
      v22.i16[0] = vaddlv_u8(v22);
      v23 = v22.u32[0];
      if (v22.u32[0] > 1uLL)
      {
        a6 = v19;
        if ((void *)v19 >= __p[1])
          a6 = v19 % (unint64_t)__p[1];
      }
      else
      {
        a6 = ((unint64_t)__p[1] - 1) & v19;
      }
      v24 = (unsigned __int8 **)*((_QWORD *)__p[0] + a6);
      if (v24)
      {
        for (i = *v24; i; i = *(unsigned __int8 **)i)
        {
          v26 = *((_QWORD *)i + 1);
          if (v26 == v20)
          {
            if (std::equal_to<std::string>::operator()[abi:nn180100](i + 16, (unsigned __int8 *)v101))
              goto LABEL_80;
          }
          else
          {
            if (v23 > 1)
            {
              if (v26 >= v21)
                v26 %= v21;
            }
            else
            {
              v26 &= v21 - 1;
            }
            if (v26 != a6)
              break;
          }
        }
      }
    }
    i = (unsigned __int8 *)operator new(0x30uLL);
    *(_QWORD *)i = 0;
    *((_QWORD *)i + 1) = v20;
    *((_OWORD *)i + 1) = *(_OWORD *)v101;
    v27 = v102;
    v101[0] = 0;
    v101[1] = 0;
    v102 = 0;
    *((_QWORD *)i + 4) = v27;
    *((_QWORD *)i + 5) = 0;
    v28 = (float)((unint64_t)v109[1] + 1);
    if (!v21 || (float)(v110 * (float)v21) < v28)
    {
      v29 = (v21 & (v21 - 1)) != 0;
      if (v21 < 3)
        v29 = 1;
      v30 = v29 | (2 * v21);
      v31 = vcvtps_u32_f32(v28 / v110);
      if (v30 <= v31)
        prime = (int8x8_t)v31;
      else
        prime = (int8x8_t)v30;
      if (*(_QWORD *)&prime == 1)
      {
        prime = (int8x8_t)2;
      }
      else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
      {
        prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
        v21 = (unint64_t)__p[1];
      }
      if (*(_QWORD *)&prime > v21)
        goto LABEL_36;
      if (*(_QWORD *)&prime < v21)
      {
        v39 = vcvtps_u32_f32((float)(unint64_t)v109[1] / v110);
        if (v21 < 3 || (v40 = (uint8x8_t)vcnt_s8((int8x8_t)v21), v40.i16[0] = vaddlv_u8(v40), v40.u32[0] > 1uLL))
        {
          v39 = std::__next_prime(v39);
        }
        else
        {
          v41 = 1 << -(char)__clz(v39 - 1);
          if (v39 >= 2)
            v39 = v41;
        }
        if (*(_QWORD *)&prime <= v39)
          prime = (int8x8_t)v39;
        if (*(_QWORD *)&prime >= v21)
        {
          v21 = (unint64_t)__p[1];
        }
        else
        {
          if (prime)
          {
LABEL_36:
            if (*(_QWORD *)&prime >> 61)
              std::__throw_bad_array_new_length[abi:nn180100]();
            v33 = operator new(8 * *(_QWORD *)&prime);
            v34 = __p[0];
            __p[0] = v33;
            if (v34)
              operator delete(v34);
            v35 = 0;
            __p[1] = (void *)prime;
            do
              *((_QWORD *)__p[0] + v35++) = 0;
            while (*(_QWORD *)&prime != v35);
            v36 = (_QWORD **)v109[0];
            if (v109[0])
            {
              v37 = *((_QWORD *)v109[0] + 1);
              v38 = (uint8x8_t)vcnt_s8(prime);
              v38.i16[0] = vaddlv_u8(v38);
              if (v38.u32[0] > 1uLL)
              {
                if (v37 >= *(_QWORD *)&prime)
                  v37 %= *(_QWORD *)&prime;
              }
              else
              {
                v37 &= *(_QWORD *)&prime - 1;
              }
              *((_QWORD *)__p[0] + v37) = v109;
              for (j = *v36; j; v37 = v43)
              {
                v43 = j[1];
                if (v38.u32[0] > 1uLL)
                {
                  if (v43 >= *(_QWORD *)&prime)
                    v43 %= *(_QWORD *)&prime;
                }
                else
                {
                  v43 &= *(_QWORD *)&prime - 1;
                }
                if (v43 != v37)
                {
                  if (!*((_QWORD *)__p[0] + v43))
                  {
                    *((_QWORD *)__p[0] + v43) = v36;
                    goto LABEL_61;
                  }
                  *v36 = (_QWORD *)*j;
                  *j = **((_QWORD **)__p[0] + v43);
                  **((_QWORD **)__p[0] + v43) = j;
                  j = v36;
                }
                v43 = v37;
LABEL_61:
                v36 = (_QWORD **)j;
                j = (_QWORD *)*j;
              }
            }
            v21 = (unint64_t)prime;
            goto LABEL_65;
          }
          v47 = __p[0];
          __p[0] = 0;
          if (v47)
            operator delete(v47);
          v21 = 0;
          __p[1] = 0;
        }
      }
LABEL_65:
      if ((v21 & (v21 - 1)) != 0)
      {
        if (v20 >= v21)
          a6 = v20 % v21;
        else
          a6 = v20;
      }
      else
      {
        a6 = (v21 - 1) & v20;
      }
    }
    v44 = __p[0];
    v45 = (unsigned __int8 **)*((_QWORD *)__p[0] + a6);
    if (v45)
    {
      *(_QWORD *)i = *v45;
LABEL_78:
      *v45 = i;
      goto LABEL_79;
    }
    *(void **)i = v109[0];
    v109[0] = i;
    v44[a6] = v109;
    if (*(_QWORD *)i)
    {
      v46 = *(_QWORD *)(*(_QWORD *)i + 8);
      if ((v21 & (v21 - 1)) != 0)
      {
        if (v46 >= v21)
          v46 %= v21;
      }
      else
      {
        v46 &= v21 - 1;
      }
      v45 = (unsigned __int8 **)((char *)__p[0] + 8 * v46);
      goto LABEL_78;
    }
LABEL_79:
    ++v109[1];
    v16 = HIBYTE(v102);
LABEL_80:
    *((_QWORD *)i + 5) = v15;
    if (v16 < 0)
      operator delete(v101[0]);
    ++v13;
  }
  while (v13 != 20);
  v48 = operator new(1uLL);
  *v48 = a4;
  v49 = v48 + 1;
  std::string::basic_string[abi:nn180100]<0>(v101, "IsSandboxed");
  v50 = std::__hash_table<std::__hash_value_type<std::string,std::vector<char>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<char>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<char>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<char>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t *)v105, (uint64_t)v101, (uint64_t)v101);
  v51 = v50;
  v52 = (void *)v50[5];
  if (v52)
  {
    v51[6] = v52;
    operator delete(v52);
  }
  v51[5] = v48;
  v51[6] = v49;
  v51[7] = v49;
  if (SHIBYTE(v102) < 0)
    operator delete(v101[0]);
  v53 = operator new(1uLL);
  *v53 = a3;
  v54 = v53 + 1;
  std::string::basic_string[abi:nn180100]<0>(v101, "UseOOPJIT");
  v55 = std::__hash_table<std::__hash_value_type<std::string,std::vector<char>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<char>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<char>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<char>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t *)v105, (uint64_t)v101, (uint64_t)v101);
  v56 = (void *)v55[5];
  if (v56)
  {
    v55[6] = v56;
    operator delete(v56);
  }
  v55[5] = v53;
  v55[6] = v54;
  v55[7] = v54;
  if (SHIBYTE(v102) < 0)
    operator delete(v101[0]);
  size = HIBYTE(v103.__r_.__value_.__r.__words[2]);
  if ((v103.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = v103.__r_.__value_.__l.__size_;
  v58 = v106[0];
  v59 = v109[0];
  if (v106[0])
  {
    v60 = 8;
    do
    {
      v61 = *((unsigned __int8 *)v58 + 39);
      if ((v61 & 0x80u) != 0)
        v61 = v58[3];
      v62 = v58[6] - v58[5] + 8;
      if (v58[6] == v58[5])
        v62 = 8;
      v60 += v61 + v62 + 8;
      v58 = (_QWORD *)*v58;
    }
    while (v58);
  }
  else
  {
    v60 = 8;
  }
  v63 = 8;
  if (v109[0])
  {
    do
    {
      v64 = *((unsigned __int8 *)v59 + 39);
      if ((v64 & 0x80u) != 0)
        v64 = v59[3];
      v63 += v64 + 16;
      v59 = (_QWORD *)*v59;
    }
    while (v59);
  }
  v65 = size + v60 + v63;
  v66 = (void *)(v65 + 16);
  if (v65 + 16 < 9)
    v67 = 0;
  else
    v67 = malloc_type_malloc(v65 + 16, 0xB91D0188uLL);
  v101[0] = v67;
  v101[1] = v66;
  v68 = v101;
  if ((unint64_t)v66 > 8)
    v68 = (void **)v67;
  v99 = v68;
  v100 = (unint64_t)v66;
  if (!__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::serialize(&v99, (uint64_t)&v103))
    goto LABEL_151;
  v69 = v100;
  if (v100 < 8)
    goto LABEL_151;
  v70 = v99;
  *v99 = v104;
  if ((v69 & 0xFFFFFFFFFFFFFFF8) == 8)
    goto LABEL_151;
  v70[1] = v106[1];
  v71 = v70 + 2;
  v72 = v69 - 16;
  v99 = v71;
  v100 = v72;
  v73 = v106[0];
  if (!v106[0])
  {
LABEL_141:
    if (v72 >= 8)
    {
      *v71 = v109[1];
      ++v99;
      v100 -= 8;
      v84 = v109[0];
      if (v109[0])
      {
        empty = 0;
        while (__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::serialize(&v99, (uint64_t)(v84 + 2)))
        {
          v85 = v100 - 8;
          if (v100 < 8)
            break;
          v86 = v99;
          *v99 = (void *)v84[5];
          v99 = v86 + 1;
          v100 = v85;
          v84 = (_QWORD *)*v84;
          if (!v84)
            goto LABEL_147;
        }
      }
      else
      {
LABEL_147:
        empty = xpc_dictionary_create_empty();
        xpc_dictionary_set_uint64(empty, "opd", 0);
        xpc_dictionary_set_uint64(empty, "seq", 0);
        xpc_dictionary_set_uint64(empty, "tag", 0);
        if (v101[1] <= (void *)8)
          v87 = v101;
        else
          v87 = (void **)v101[0];
        xpc_dictionary_set_data(empty, "buf", v87, (size_t)v101[1]);
      }
      goto LABEL_152;
    }
LABEL_151:
    empty = 0;
    goto LABEL_152;
  }
  while (1)
  {
    empty = 0;
    if (!__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::serialize(&v99, (uint64_t)(v73 + 2)))break;
    v75 = v100;
    v72 = v100 - 8;
    if (v100 < 8)
      break;
    v76 = v99;
    *v99 = (void *)(v73[6] - v73[5]);
    v71 = v76 + 1;
    v99 = v71;
    v100 = v72;
    v78 = v73[5];
    v77 = v73[6];
    if (v78 == v77 || v72 == 0)
    {
      if (v78 != v77)
        goto LABEL_151;
    }
    else
    {
      v80 = 0;
      do
      {
        v81 = v78 + v80 + 1;
        *((_BYTE *)v71 + v80) = *(_BYTE *)(v78 + v80);
        v82 = v80 + 1;
      }
      while (v81 != v77 && v75 - 9 != v80++);
      v71 = (void **)((char *)v71 + v82);
      v72 = v75 - v82 - 8;
      v99 = v71;
      v100 = v72;
      if (v81 != v77)
        goto LABEL_151;
    }
    v73 = (_QWORD *)*v73;
    if (!v73)
      goto LABEL_141;
  }
LABEL_152:
  if (v101[1] >= (void *)9)
  {
    v88 = v101[0];
    goto LABEL_156;
  }
  if (!v101[1])
  {
    v88 = v101[0];
    if (v101[0])
LABEL_156:
      free(v88);
  }
  v89 = (void **)v109[0];
  if (v109[0])
  {
    do
    {
      v90 = (void **)*v89;
      if (*((char *)v89 + 39) < 0)
        operator delete(v89[2]);
      operator delete(v89);
      v89 = v90;
    }
    while (v90);
  }
  v91 = __p[0];
  __p[0] = 0;
  if (v91)
    operator delete(v91);
  v92 = (char *)v106[0];
  if (v106[0])
  {
    do
    {
      v93 = *(char **)v92;
      v94 = (void *)*((_QWORD *)v92 + 5);
      if (v94)
      {
        *((_QWORD *)v92 + 6) = v94;
        operator delete(v94);
      }
      if (v92[39] < 0)
        operator delete(*((void **)v92 + 2));
      operator delete(v92);
      v92 = v93;
    }
    while (v93);
  }
  v95 = v105[0];
  v105[0] = 0;
  if (v95)
    operator delete(v95);
  if (SHIBYTE(v103.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v103.__r_.__value_.__l.__data_);
  return empty;
}

uint64_t xojit_xpcmemmgr_acquire_slab(const char *a1, unint64_t a2)
{
  mach_vm_size_t v2;
  uint64_t v3;
  mach_vm_address_t v4;
  mach_vm_address_t v5;
  uint64_t v6;
  char v7;
  unsigned __int8 v8;
  uint64_t v10;
  mach_vm_address_t address;
  unsigned __int8 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a2 < 8 || (a2 & 0xFFFFFFFFFFFFFFF8) == 8)
  {
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&v10, "Could not deserialize arguments for wrapper function call");
  }
  else
  {
    v2 = *((_QWORD *)a1 + 1);
    address = 0;
    if (mach_vm_map(*MEMORY[0x24BDAEC58], &address, v2, 0, 1, 0, 0, 0, 0, 7, 2u))
    {
      v3 = operator new();
      std::string::basic_string[abi:nn180100]<0>((_QWORD *)(v3 + 8), "mach_vm_map failed");
      *(_QWORD *)v3 = off_251C387B8;
      v4 = v3 & 0xFFFFFFFFFFFFFFFELL;
      __orc_rt::Error::assertIsChecked(1);
      v5 = 0;
      v6 = 253;
      v7 = 3;
    }
    else
    {
      v6 = 0;
      v4 = address;
      v7 = 2;
      v5 = address;
    }
    v12 = v7;
    address = v4;
    __orc_rt::detail::ResultSerializer<__orc_rt::SPSExpected<__orc_rt::SPSExecutorAddr>,__orc_rt::Expected<__orc_rt::ExecutorAddr>>::serialize((__orc_rt::WrapperFunctionResult *)&v10, (uint64_t *)&address);
    v8 = v12;
    __orc_rt::Expected<__orc_rt::ExecutorAddr>::assertIsChecked(v12);
    if ((v8 & 1) != 0 && address)
      (*(void (**)(mach_vm_address_t))(*(_QWORD *)address + 8))(address);
    __orc_rt::Expected<__orc_rt::ExecutorAddr>::assertIsChecked(v6);
    if ((v6 & 1) != 0 && v5)
      (*(void (**)(mach_vm_address_t))(*(_QWORD *)v5 + 8))(v5);
  }
  return v10;
}

uint64_t xojit_xpcmemmgr_release_slab(const char *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  if (a2 < 8 || (a2 & 0xFFFFFFFFFFFFFFF8) == 8)
  {
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&v3, "Could not deserialize arguments for wrapper function call");
  }
  else
  {
    __orc_rt::Error::assertIsChecked(1);
    v4 = 0;
    __orc_rt::detail::ResultSerializer<__orc_rt::SPSError,__orc_rt::Error>::serialize((__orc_rt::WrapperFunctionResult *)&v3, &v4);
    __orc_rt::Error::assertIsChecked(v4);
    __orc_rt::Error::assertIsChecked(1);
  }
  return v3;
}

void **xojit_xpcmemmgr_deallocate(const char *a1, unint64_t a2)
{
  std::mutex *v3;
  unint64_t v4;
  const char *v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  void **v22;
  unint64_t v23;
  char *v24;
  char *v25;
  int8x8_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint8x8_t v30;
  unint64_t v31;
  void **v32;
  char *v33;
  unint64_t v34;
  void **v35;
  unint64_t v36;
  char *v37;
  char *v38;
  char *v39;
  void **v40;
  char *v41;
  __int128 v42;
  char *v43;
  int8x8_t v44;
  uint64_t v45;
  unint64_t v46;
  uint8x8_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  void **v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  std::mutex *v64;
  void **v65;
  __orc_rt::Error *v66;
  uint64_t v67;

  if (a2 < 8 || (a2 & 0xFFFFFFFFFFFFFFF8) == 8)
  {
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&v65, "Could not deserialize arguments for wrapper function call");
    return v65;
  }
  v3 = *(std::mutex **)a1;
  v4 = *((_QWORD *)a1 + 1);
  if (!v4)
  {
    std::mutex::lock(*(std::mutex **)a1);
    v58 = 0;
    v7 = 0;
LABEL_107:
    v22 = 0;
    goto LABEL_108;
  }
  v64 = *(std::mutex **)a1;
  if (v4 >> 61)
LABEL_116:
    abort();
  v5 = a1 + 16;
  v6 = a2 - 16;
  v7 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorAddr>>(v4);
  v8 = 0;
  v10 = &v7[8 * v9];
  v11 = v7;
  do
  {
    v12 = v6 >= 8;
    v6 -= 8;
    if (!v12)
    {
      __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&v65, "Could not deserialize arguments for wrapper function call");
      if (v7)
        operator delete(v7);
      return v65;
    }
    v14 = *(_QWORD *)v5;
    v5 += 8;
    v13 = v14;
    if (v11 >= v10)
    {
      v15 = (v11 - v7) >> 3;
      v16 = v15 + 1;
      if ((unint64_t)(v15 + 1) >> 61)
        goto LABEL_116;
      if ((v10 - v7) >> 2 > v16)
        v16 = (v10 - v7) >> 2;
      if ((unint64_t)(v10 - v7) >= 0x7FFFFFFFFFFFFFF8)
        v17 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v17 = v16;
      if (v17)
        v17 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorAddr>>(v17);
      else
        v18 = 0;
      v19 = (char *)(v17 + 8 * v15);
      *(_QWORD *)v19 = v13;
      v20 = v19 + 8;
      while (v11 != v7)
      {
        v21 = *((_QWORD *)v11 - 1);
        v11 -= 8;
        *((_QWORD *)v19 - 1) = v21;
        v19 -= 8;
      }
      v10 = (char *)(v17 + 8 * v18);
      if (v7)
        operator delete(v7);
      v7 = v19;
      v11 = v20;
    }
    else
    {
      *(_QWORD *)v11 = v13;
      v11 += 8;
    }
    ++v8;
  }
  while (v8 != v4);
  v3 = v64;
  std::mutex::lock(v64);
  if (v7 == v11)
  {
    v58 = 0;
    v4 = 0;
    goto LABEL_107;
  }
  v4 = 0;
  v22 = 0;
  v23 = 0;
  v24 = &v64[1].__m_.__opaque[48];
  v25 = v7;
  do
  {
    v26 = *(int8x8_t *)&v3[1].__m_.__opaque[40];
    if (!*(_QWORD *)&v26)
      goto LABEL_105;
    v27 = 0x9DDFEA08EB382D69 * ((8 * *(_QWORD *)v25 + 8) ^ HIDWORD(*(_QWORD *)v25));
    v28 = 0x9DDFEA08EB382D69 * (HIDWORD(*(_QWORD *)v25) ^ (v27 >> 47) ^ v27);
    v29 = 0x9DDFEA08EB382D69 * (v28 ^ (v28 >> 47));
    v30 = (uint8x8_t)vcnt_s8(v26);
    v30.i16[0] = vaddlv_u8(v30);
    if (v30.u32[0] > 1uLL)
    {
      v31 = v29;
      if (v29 >= *(_QWORD *)&v26)
        v31 = v29 % *(_QWORD *)&v26;
    }
    else
    {
      v31 = v29 & (*(_QWORD *)&v26 - 1);
    }
    v32 = *(void ***)(*(_QWORD *)&v64[1].__m_.__opaque[32] + 8 * v31);
    if (!v32 || (v33 = (char *)*v32) == 0)
    {
LABEL_105:
      v61 = operator new();
      std::string::basic_string[abi:nn180100]<0>((_QWORD *)(v61 + 8), "Invalid address passed to deallocate");
      *(_QWORD *)v61 = off_251C387B8;
      v58 = v61 | 1;
      v3 = v64;
LABEL_108:
      std::mutex::unlock(v3);
      goto LABEL_109;
    }
    while (1)
    {
      v34 = *((_QWORD *)v33 + 1);
      if (v34 == v29)
        break;
      if (v30.u32[0] > 1uLL)
      {
        if (v34 >= *(_QWORD *)&v26)
          v34 %= *(_QWORD *)&v26;
      }
      else
      {
        v34 &= *(_QWORD *)&v26 - 1;
      }
      if (v34 != v31)
        goto LABEL_105;
LABEL_45:
      v33 = *(char **)v33;
      if (!v33)
        goto LABEL_105;
    }
    if (*((_QWORD *)v33 + 2) != *(_QWORD *)v25)
      goto LABEL_45;
    v35 = (void **)(v33 + 24);
    if ((unint64_t)v22 < v23)
    {
      *v22 = 0;
      v22[1] = 0;
      v22[2] = 0;
      *(_OWORD *)v22 = *(_OWORD *)(v33 + 24);
      v22[2] = (void *)*((_QWORD *)v33 + 5);
      *v35 = 0;
      *((_QWORD *)v33 + 4) = 0;
      *((_QWORD *)v33 + 5) = 0;
      v22 += 3;
      goto LABEL_64;
    }
    v36 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)((uint64_t)v22 - v4) >> 3) + 1;
    if (v36 > 0xAAAAAAAAAAAAAAALL)
      goto LABEL_116;
    if (0x5555555555555556 * ((uint64_t)(v23 - v4) >> 3) > v36)
      v36 = 0x5555555555555556 * ((uint64_t)(v23 - v4) >> 3);
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v23 - v4) >> 3) >= 0x555555555555555)
      v36 = 0xAAAAAAAAAAAAAAALL;
    if (v36 > 0xAAAAAAAAAAAAAAALL)
      std::__throw_bad_array_new_length[abi:nn180100]();
    v62 = 3 * v36;
    v63 = v24;
    v37 = (char *)operator new(24 * v36);
    v38 = &v37[8 * ((uint64_t)((uint64_t)v22 - v4) >> 3)];
    v39 = v37;
    *((_QWORD *)v38 + 1) = 0;
    *((_QWORD *)v38 + 2) = 0;
    *(_OWORD *)v38 = *(_OWORD *)(v33 + 24);
    *((_QWORD *)v38 + 2) = *((_QWORD *)v33 + 5);
    *((_QWORD *)v33 + 3) = 0;
    *((_QWORD *)v33 + 4) = 0;
    *((_QWORD *)v33 + 5) = 0;
    if (v22 == (void **)v4)
    {
      v35 = (void **)(v33 + 24);
      v41 = &v37[8 * ((uint64_t)((uint64_t)v22 - v4) >> 3)];
    }
    else
    {
      v40 = v22;
      v41 = &v37[8 * ((uint64_t)((uint64_t)v22 - v4) >> 3)];
      do
      {
        *((_QWORD *)v41 - 3) = 0;
        *((_QWORD *)v41 - 2) = 0;
        v41 -= 24;
        *((_QWORD *)v41 + 2) = 0;
        v42 = *(_OWORD *)(v40 - 3);
        v40 -= 3;
        *(_OWORD *)v41 = v42;
        *((_QWORD *)v41 + 2) = v40[2];
        *v40 = 0;
        v40[1] = 0;
        v40[2] = 0;
      }
      while (v40 != (void **)v4);
      do
      {
        v22 -= 3;
        v65 = v22;
        std::vector<__orc_rt::WrapperFunctionCall>::__destroy_vector::operator()[abi:nn180100](&v65);
      }
      while (v22 != (void **)v4);
      v35 = (void **)(v33 + 24);
    }
    v43 = &v39[8 * v62];
    v22 = (void **)(v38 + 24);
    if (v4)
    {
      operator delete((void *)v4);
      v35 = (void **)(v33 + 24);
    }
    v4 = (unint64_t)v41;
    v24 = v63;
    v23 = (unint64_t)v43;
LABEL_64:
    v44 = *(int8x8_t *)&v64[1].__m_.__opaque[40];
    v45 = *(_QWORD *)v33;
    v46 = *((_QWORD *)v33 + 1);
    v47 = (uint8x8_t)vcnt_s8(v44);
    v47.i16[0] = vaddlv_u8(v47);
    if (v47.u32[0] > 1uLL)
    {
      if (v46 >= *(_QWORD *)&v44)
        v46 %= *(_QWORD *)&v44;
    }
    else
    {
      v46 &= *(_QWORD *)&v44 - 1;
    }
    v48 = *(_QWORD *)&v64[1].__m_.__opaque[32];
    v49 = *(char **)(v48 + 8 * v46);
    do
    {
      v50 = v49;
      v49 = *(char **)v49;
    }
    while (v49 != v33);
    if (v50 == v24)
      goto LABEL_81;
    v51 = *((_QWORD *)v50 + 1);
    if (v47.u32[0] > 1uLL)
    {
      if (v51 >= *(_QWORD *)&v44)
        v51 %= *(_QWORD *)&v44;
    }
    else
    {
      v51 &= *(_QWORD *)&v44 - 1;
    }
    if (v51 == v46)
    {
LABEL_83:
      if (v45)
      {
        v52 = *(_QWORD *)(v45 + 8);
        goto LABEL_85;
      }
    }
    else
    {
LABEL_81:
      if (!v45)
        goto LABEL_82;
      v52 = *(_QWORD *)(v45 + 8);
      if (v47.u32[0] > 1uLL)
      {
        v53 = *(_QWORD *)(v45 + 8);
        if (v52 >= *(_QWORD *)&v44)
          v53 = v52 % *(_QWORD *)&v44;
      }
      else
      {
        v53 = v52 & (*(_QWORD *)&v44 - 1);
      }
      if (v53 != v46)
      {
LABEL_82:
        *(_QWORD *)(v48 + 8 * v46) = 0;
        v45 = *(_QWORD *)v33;
        goto LABEL_83;
      }
LABEL_85:
      if (v47.u32[0] > 1uLL)
      {
        if (v52 >= *(_QWORD *)&v44)
          v52 %= *(_QWORD *)&v44;
      }
      else
      {
        v52 &= *(_QWORD *)&v44 - 1;
      }
      if (v52 != v46)
      {
        *(_QWORD *)(*(_QWORD *)&v64[1].__m_.__opaque[32] + 8 * v52) = v50;
        v45 = *(_QWORD *)v33;
      }
    }
    *(_QWORD *)v50 = v45;
    *(_QWORD *)v33 = 0;
    v3 = v64;
    --v64[2].__m_.__sig;
    v65 = v35;
    std::vector<__orc_rt::WrapperFunctionCall>::__destroy_vector::operator()[abi:nn180100](&v65);
    operator delete(v33);
    v25 += 8;
  }
  while (v25 != v11);
  std::mutex::unlock(v64);
  if ((void **)v4 != v22)
  {
    v54 = v22;
    do
    {
      v56 = (uint64_t)*(v54 - 3);
      v55 = (uint64_t)*(v54 - 2);
      v54 -= 3;
      while (v56 != v55)
      {
        __orc_rt::WrapperFunctionCall::runWithSPSRet<__orc_rt::SPSEmpty,__orc_rt::SPSEmpty>(&v67, v55 - 32);
        v57 = v67 & 0xFFFFFFFFFFFFFFFELL;
        v58 = v67 & 0xFFFFFFFFFFFFFFFELL | ((v67 & 0xFFFFFFFFFFFFFFFELL) == 0);
        v67 = v58;
        if (v57)
          goto LABEL_109;
        __orc_rt::Error::assertIsChecked(v58);
        v59 = (uint64_t)*(v22 - 2);
        v60 = *(void **)(v59 - 24);
        if (v60)
        {
          *(_QWORD *)(v59 - 16) = v60;
          operator delete(v60);
        }
        v55 = v59 - 32;
        *(v22 - 2) = (void *)(v59 - 32);
        v56 = (uint64_t)*(v22 - 3);
      }
      v65 = v54;
      std::vector<__orc_rt::WrapperFunctionCall>::__destroy_vector::operator()[abi:nn180100](&v65);
      v22 = v54;
    }
    while ((void **)v4 != v54);
  }
  v58 = 0;
  v22 = (void **)v4;
LABEL_109:
  if (v4)
  {
    while (v22 != (void **)v4)
    {
      v22 -= 3;
      v65 = v22;
      std::vector<__orc_rt::WrapperFunctionCall>::__destroy_vector::operator()[abi:nn180100](&v65);
    }
    operator delete((void *)v4);
  }
  if (v7)
    operator delete(v7);
  __orc_rt::Error::assertIsChecked(1);
  v66 = (__orc_rt::Error *)(v58 & 0xFFFFFFFFFFFFFFFELL);
  __orc_rt::detail::ResultSerializer<__orc_rt::SPSError,__orc_rt::Error>::serialize((__orc_rt::WrapperFunctionResult *)&v65, (uint64_t *)&v66);
  __orc_rt::Error::assertIsChecked((uint64_t)v66);
  __orc_rt::Error::assertIsChecked(1);
  return v65;
}

uint64_t xojit_xpcmemmgr_make_read_only(const char *a1)
{
  return 0;
}

std::string::size_type xojit_xpcmemmgr_apply_sandbox_extension(const char *a1, unint64_t a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  unint64_t v5;
  int *v6;
  char *v7;
  size_t v8;
  std::string *v9;
  std::string::size_type v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *__p[2];
  __int128 v16;
  std::string buf;
  uint64_t v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)__p = 0u;
  v16 = 0u;
  if (a2 > 7
    && (v2 = *(void **)a1,
        buf.__r_.__value_.__r.__words[0] = (std::string::size_type)(a1 + 8),
        buf.__r_.__value_.__l.__size_ = a2 - 8,
        __p[0] = v2,
        __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::deserialize((uint64_t)&buf, (std::string *)&__p[1])))
  {
    v3 = qword_257967440;
    if (os_log_type_enabled((os_log_t)qword_257967440, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_24B2B8000, v3, OS_LOG_TYPE_DEFAULT, "Consuming sandbox extension", (uint8_t *)&buf, 2u);
    }
    std::mutex::lock((std::mutex *)__p[0]);
    v4 = sandbox_extension_consume();
    if (v4 == -1)
    {
      std::string::basic_string[abi:nn180100]<0>(&buf, "Error applying sandbox extension: ");
      v6 = __error();
      v7 = strerror(*v6);
      v8 = strlen(v7);
      v9 = std::string::append(&buf, v7, v8);
      v10 = v9->__r_.__value_.__r.__words[0];
      v18[0] = v9->__r_.__value_.__l.__size_;
      *(uint64_t *)((char *)v18 + 7) = *(std::string::size_type *)((char *)&v9->__r_.__value_.__r.__words[1] + 7);
      v11 = HIBYTE(v9->__r_.__value_.__r.__words[2]);
      v9->__r_.__value_.__l.__size_ = 0;
      v9->__r_.__value_.__r.__words[2] = 0;
      v9->__r_.__value_.__r.__words[0] = 0;
      v12 = operator new();
      v13 = v18[0];
      *(_QWORD *)(v12 + 8) = v10;
      *(_QWORD *)(v12 + 16) = v13;
      *(_QWORD *)(v12 + 23) = *(uint64_t *)((char *)v18 + 7);
      *(_QWORD *)v12 = off_251C387B8;
      *(_BYTE *)(v12 + 31) = v11;
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
      v5 = v12 & 0xFFFFFFFFFFFFFFFELL;
    }
    else
    {
      v5 = 0;
      *((_QWORD *)__p[0] + 18) = v4;
    }
    std::mutex::unlock((std::mutex *)__p[0]);
    __orc_rt::Error::assertIsChecked(1);
    v18[0] = v5;
    __orc_rt::detail::ResultSerializer<__orc_rt::SPSError,__orc_rt::Error>::serialize((__orc_rt::WrapperFunctionResult *)&buf, v18);
    __orc_rt::Error::assertIsChecked(v18[0]);
    __orc_rt::Error::assertIsChecked(1);
  }
  else
  {
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&buf, "Could not deserialize arguments for wrapper function call");
  }
  if (SHIBYTE(v16) < 0)
    operator delete(__p[1]);
  return buf.__r_.__value_.__r.__words[0];
}

uint64_t xojit_memaccess_write_uints_wrapper<unsigned char>(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t *v17;
  unint64_t v18;
  char v19;
  char *v20;
  char v21;
  char *v22;
  _QWORD v24[2];

  v3 = a2 - 8;
  if (a2 < 8)
  {
    v6 = 0;
  }
  else
  {
    v4 = a1 + 1;
    v5 = *a1;
    if (!*a1)
    {
      v6 = 0;
LABEL_33:
      v24[0] = 0;
      v24[1] = 0;
      if (v6)
        goto LABEL_30;
      return v24[0];
    }
    if (v5 >> 60)
LABEL_35:
      abort();
    v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(*a1);
    v7 = 0;
    v9 = &v6[16 * v8];
    v10 = v6;
    while (v3 > 8)
    {
      v11 = *v4;
      v2 = v2 & 0xFFFFFFFFFFFFFF00 | *((unsigned __int8 *)v4 + 8);
      if (v10 >= v9)
      {
        v12 = (v10 - v6) >> 4;
        v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 60)
          goto LABEL_35;
        if ((v9 - v6) >> 3 > v13)
          v13 = (v9 - v6) >> 3;
        if ((unint64_t)(v9 - v6) >= 0x7FFFFFFFFFFFFFF0)
          v14 = 0xFFFFFFFFFFFFFFFLL;
        else
          v14 = v13;
        if (v14)
          v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v14);
        else
          v15 = 0;
        v16 = (unint64_t *)(v14 + 16 * v12);
        *v16 = v11;
        v16[1] = v2;
        v17 = v16;
        while (v10 != v6)
        {
          v18 = *((_QWORD *)v10 - 2);
          v10 -= 16;
          v19 = v10[8];
          *(v17 - 2) = v18;
          v17 -= 2;
          *((_BYTE *)v17 + 8) = v19;
        }
        v9 = (char *)(v14 + 16 * v15);
        v10 = (char *)(v16 + 2);
        if (v6)
          operator delete(v6);
        v6 = (char *)v17;
      }
      else
      {
        *(_QWORD *)v10 = v11;
        *((_QWORD *)v10 + 1) = v2;
        v10 += 16;
      }
      v4 = (unint64_t *)((char *)v4 + 9);
      v3 -= 9;
      if (++v7 == v5)
      {
        if (v6 != v10)
        {
          v20 = v6;
          do
          {
            v21 = v20[8];
            v22 = *(char **)v20;
            v20 += 16;
            *v22 = v21;
          }
          while (v20 != v10);
        }
        goto LABEL_33;
      }
    }
  }
  __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)v24, "Could not deserialize arguments for wrapper function call");
  if (v6)
LABEL_30:
    operator delete(v6);
  return v24[0];
}

uint64_t xojit_memaccess_write_uints_wrapper<unsigned short>(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t *v17;
  unint64_t v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  _WORD *v22;
  _QWORD v24[2];

  v3 = a2 - 8;
  if (a2 < 8)
  {
    v6 = 0;
  }
  else
  {
    v4 = a1 + 1;
    v5 = *a1;
    if (!*a1)
    {
      v6 = 0;
LABEL_34:
      v24[0] = 0;
      v24[1] = 0;
      if (v6)
        goto LABEL_31;
      return v24[0];
    }
    if (v5 >> 60)
LABEL_36:
      abort();
    v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(*a1);
    v7 = 0;
    v9 = &v6[16 * v8];
    v10 = v6;
    while (v3 >= 8 && (v3 & 0xFFFFFFFFFFFFFFFELL) != 8)
    {
      v11 = *v4;
      v2 = v2 & 0xFFFFFFFFFFFF0000 | *((unsigned __int16 *)v4 + 4);
      if (v10 >= v9)
      {
        v12 = (v10 - v6) >> 4;
        v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 60)
          goto LABEL_36;
        if ((v9 - v6) >> 3 > v13)
          v13 = (v9 - v6) >> 3;
        if ((unint64_t)(v9 - v6) >= 0x7FFFFFFFFFFFFFF0)
          v14 = 0xFFFFFFFFFFFFFFFLL;
        else
          v14 = v13;
        if (v14)
          v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v14);
        else
          v15 = 0;
        v16 = (unint64_t *)(v14 + 16 * v12);
        *v16 = v11;
        v16[1] = v2;
        v17 = v16;
        while (v10 != v6)
        {
          v18 = *((_QWORD *)v10 - 2);
          v10 -= 16;
          v19 = *((_WORD *)v10 + 4);
          *(v17 - 2) = v18;
          v17 -= 2;
          *((_WORD *)v17 + 4) = v19;
        }
        v9 = (char *)(v14 + 16 * v15);
        v10 = (char *)(v16 + 2);
        if (v6)
          operator delete(v6);
        v6 = (char *)v17;
      }
      else
      {
        *(_QWORD *)v10 = v11;
        *((_QWORD *)v10 + 1) = v2;
        v10 += 16;
      }
      v4 = (unint64_t *)((char *)v4 + 10);
      v3 -= 10;
      if (++v7 == v5)
      {
        if (v6 != v10)
        {
          v20 = v6;
          do
          {
            v21 = *((_WORD *)v20 + 4);
            v22 = *(_WORD **)v20;
            v20 += 16;
            *v22 = v21;
          }
          while (v20 != v10);
        }
        goto LABEL_34;
      }
    }
  }
  __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)v24, "Could not deserialize arguments for wrapper function call");
  if (v6)
LABEL_31:
    operator delete(v6);
  return v24[0];
}

uint64_t xojit_memaccess_write_uints_wrapper<unsigned int>(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t *v17;
  unint64_t v18;
  int v19;
  char *v20;
  int v21;
  _DWORD *v22;
  _QWORD v24[2];

  v3 = a2 - 8;
  if (a2 < 8)
  {
    v6 = 0;
  }
  else
  {
    v4 = a1 + 1;
    v5 = *a1;
    if (!*a1)
    {
      v6 = 0;
LABEL_34:
      v24[0] = 0;
      v24[1] = 0;
      if (v6)
        goto LABEL_31;
      return v24[0];
    }
    if (v5 >> 60)
LABEL_36:
      abort();
    v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(*a1);
    v7 = 0;
    v9 = &v6[16 * v8];
    v10 = v6;
    while (v3 >= 8 && (v3 & 0xFFFFFFFFFFFFFFFCLL) != 8)
    {
      v11 = *v4;
      v2 = v2 & 0xFFFFFFFF00000000 | *((unsigned int *)v4 + 2);
      if (v10 >= v9)
      {
        v12 = (v10 - v6) >> 4;
        v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 60)
          goto LABEL_36;
        if ((v9 - v6) >> 3 > v13)
          v13 = (v9 - v6) >> 3;
        if ((unint64_t)(v9 - v6) >= 0x7FFFFFFFFFFFFFF0)
          v14 = 0xFFFFFFFFFFFFFFFLL;
        else
          v14 = v13;
        if (v14)
          v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v14);
        else
          v15 = 0;
        v16 = (unint64_t *)(v14 + 16 * v12);
        *v16 = v11;
        v16[1] = v2;
        v17 = v16;
        while (v10 != v6)
        {
          v18 = *((_QWORD *)v10 - 2);
          v10 -= 16;
          v19 = *((_DWORD *)v10 + 2);
          *(v17 - 2) = v18;
          v17 -= 2;
          *((_DWORD *)v17 + 2) = v19;
        }
        v9 = (char *)(v14 + 16 * v15);
        v10 = (char *)(v16 + 2);
        if (v6)
          operator delete(v6);
        v6 = (char *)v17;
      }
      else
      {
        *(_QWORD *)v10 = v11;
        *((_QWORD *)v10 + 1) = v2;
        v10 += 16;
      }
      v4 = (unint64_t *)((char *)v4 + 12);
      v3 -= 12;
      if (++v7 == v5)
      {
        if (v6 != v10)
        {
          v20 = v6;
          do
          {
            v21 = *((_DWORD *)v20 + 2);
            v22 = *(_DWORD **)v20;
            v20 += 16;
            *v22 = v21;
          }
          while (v20 != v10);
        }
        goto LABEL_34;
      }
    }
  }
  __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)v24, "Could not deserialize arguments for wrapper function call");
  if (v6)
LABEL_31:
    operator delete(v6);
  return v24[0];
}

uint64_t xojit_memaccess_write_uints_wrapper<unsigned long long>(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD v23[2];

  v2 = a2 - 8;
  if (a2 < 8)
  {
    v5 = 0;
  }
  else
  {
    v3 = (uint64_t *)(a1 + 1);
    v4 = *a1;
    if (!*a1)
    {
      v5 = 0;
LABEL_36:
      v23[0] = 0;
      v23[1] = 0;
      if (v5)
        goto LABEL_33;
      return v23[0];
    }
    if (v4 >> 60)
LABEL_38:
      abort();
    v5 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(*a1);
    v6 = 0;
    v8 = &v5[16 * v7];
    v9 = v5;
    while (v2 >= 8 && (v2 & 0xFFFFFFFFFFFFFFF8) != 8)
    {
      v10 = *v3;
      v11 = v3[1];
      if (v9 >= v8)
      {
        v12 = (v9 - v5) >> 4;
        v13 = v12 + 1;
        if ((unint64_t)(v12 + 1) >> 60)
          goto LABEL_38;
        if ((v8 - v5) >> 3 > v13)
          v13 = (v8 - v5) >> 3;
        if ((unint64_t)(v8 - v5) >= 0x7FFFFFFFFFFFFFF0)
          v14 = 0xFFFFFFFFFFFFFFFLL;
        else
          v14 = v13;
        if (v14)
          v14 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v14);
        else
          v15 = 0;
        v16 = (_QWORD *)(v14 + 16 * v12);
        *v16 = v10;
        v16[1] = v11;
        if (v9 == v5)
        {
          v18 = (char *)(v14 + 16 * v12);
        }
        else
        {
          v17 = v14 + 16 * v12;
          do
          {
            v18 = (char *)(v17 - 16);
            *(_OWORD *)(v17 - 16) = *((_OWORD *)v9 - 1);
            v9 -= 16;
            v17 -= 16;
          }
          while (v9 != v5);
        }
        v8 = (char *)(v14 + 16 * v15);
        v9 = (char *)(v16 + 2);
        if (v5)
          operator delete(v5);
        v5 = v18;
      }
      else
      {
        *(_QWORD *)v9 = v10;
        *((_QWORD *)v9 + 1) = v11;
        v9 += 16;
      }
      v3 += 2;
      v2 -= 16;
      if (++v6 == v4)
      {
        if (v5 != v9)
        {
          v19 = v5;
          do
          {
            v21 = *(_QWORD **)v19;
            v20 = *((_QWORD *)v19 + 1);
            v19 += 16;
            *v21 = v20;
          }
          while (v19 != v9);
        }
        goto LABEL_36;
      }
    }
  }
  __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)v23, "Could not deserialize arguments for wrapper function call");
  if (v5)
LABEL_33:
    operator delete(v5);
  return v23[0];
}

uint64_t xojit_memaccess_write_buffers_wrapper(const char *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  const char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  unint64_t v10;
  BOOL v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  __int128 v20;
  char *v21;
  char *v22;
  _QWORD v24[2];

  v2 = a2 - 8;
  if (a2 < 8)
  {
    v5 = 0;
  }
  else
  {
    v4 = a1 + 8;
    v3 = *(_QWORD *)a1;
    if (!*(_QWORD *)a1)
    {
      v5 = 0;
LABEL_38:
      v24[0] = 0;
      v24[1] = 0;
      if (v5)
        goto LABEL_35;
      return v24[0];
    }
    if (v3 > 0xAAAAAAAAAAAAAAALL)
LABEL_40:
      abort();
    v5 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::BufferWrite>>(*(_QWORD *)a1);
    v6 = 0;
    v8 = &v5[24 * v7];
    v9 = v5;
    while (v2 >= 8)
    {
      if ((v2 & 0xFFFFFFFFFFFFFFF8) == 8)
        break;
      v10 = *((_QWORD *)v4 + 1);
      v11 = v2 - 16 >= v10;
      v2 = v2 - 16 - v10;
      if (!v11)
        break;
      v14 = *(_QWORD *)v4;
      v12 = v4 + 16;
      v13 = v14;
      if (v9 >= v8)
      {
        v15 = 0xAAAAAAAAAAAAAAABLL * ((v9 - v5) >> 3) + 1;
        if (v15 > 0xAAAAAAAAAAAAAAALL)
          goto LABEL_40;
        if (0x5555555555555556 * ((v8 - v5) >> 3) > v15)
          v15 = 0x5555555555555556 * ((v8 - v5) >> 3);
        if (0xAAAAAAAAAAAAAAABLL * ((v8 - v5) >> 3) >= 0x555555555555555)
          v16 = 0xAAAAAAAAAAAAAAALL;
        else
          v16 = v15;
        if (v16)
          v16 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::BufferWrite>>(v16);
        else
          v17 = 0;
        v18 = (_QWORD *)(v16 + 8 * ((v9 - v5) >> 3));
        *v18 = v13;
        v18[1] = v12;
        v18[2] = v10;
        if (v9 == v5)
        {
          v21 = (char *)(v16 + 8 * ((v9 - v5) >> 3));
        }
        else
        {
          v19 = v16 + 8 * ((v9 - v5) >> 3);
          do
          {
            v20 = *(_OWORD *)(v9 - 24);
            v21 = (char *)(v19 - 24);
            *(_QWORD *)(v19 - 8) = *((_QWORD *)v9 - 1);
            *(_OWORD *)(v19 - 24) = v20;
            v9 -= 24;
            v19 -= 24;
          }
          while (v9 != v5);
        }
        v8 = (char *)(v16 + 24 * v17);
        v9 = (char *)(v18 + 3);
        if (v5)
          operator delete(v5);
        v5 = v21;
      }
      else
      {
        *(_QWORD *)v9 = v13;
        *((_QWORD *)v9 + 1) = v12;
        *((_QWORD *)v9 + 2) = v10;
        v9 += 24;
      }
      v4 = &v12[v10];
      if (++v6 == v3)
      {
        if (v5 != v9)
        {
          v22 = v5;
          do
          {
            memcpy(*(void **)v22, *((const void **)v22 + 1), *((_QWORD *)v22 + 2));
            v22 += 24;
          }
          while (v22 != v9);
        }
        goto LABEL_38;
      }
    }
  }
  __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)v24, "Could not deserialize arguments for wrapper function call");
  if (v5)
LABEL_35:
    operator delete(v5);
  return v24[0];
}

uint64_t xojit_dylibmgr_dlopen_wrapper(const char *a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void **v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  _QWORD v24[6];
  uint64_t v25;
  void *__p[2];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  memset(&v24[2], 0, 32);
  if (a2 >= 8
    && (v2 = *(_QWORD *)a1,
        __p[0] = (void *)(a1 + 8),
        __p[1] = (void *)(a2 - 8),
        v24[2] = v2,
        __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::deserialize((uint64_t)__p, (std::string *)&v24[3]))&& __p[1] > (void *)7)
  {
    v25 = *(_QWORD *)__p[0];
    v3 = v24[2];
    v27 = v24[5];
    *(_OWORD *)__p = *(_OWORD *)&v24[3];
    memset(&v24[3], 0, 24);
    if (SHIBYTE(v27) < 0)
    {
      if (__p[1])
        v4 = (void **)__p[0];
      else
        v4 = 0;
    }
    else if (HIBYTE(v27))
    {
      v4 = __p;
    }
    else
    {
      v4 = 0;
    }
    v5 = dlopen((const char *)v4, 8);
    if (v5)
    {
      v6 = v5;
      std::mutex::lock((std::mutex *)v24[2]);
      v8 = *(_QWORD **)(v24[2] + 72);
      v7 = *(_QWORD *)(v24[2] + 80);
      if ((unint64_t)v8 >= v7)
      {
        v13 = *(_QWORD **)(v24[2] + 64);
        v14 = v8 - v13;
        v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 61)
          abort();
        v16 = v7 - (_QWORD)v13;
        if (v16 >> 2 > v15)
          v15 = v16 >> 2;
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8)
          v17 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v17 = v15;
        if (v17)
        {
          if (v17 >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v18 = (char *)operator new(8 * v17);
        }
        else
        {
          v18 = 0;
        }
        v19 = &v18[8 * v14];
        *(_QWORD *)v19 = v6;
        v9 = v19 + 8;
        if (v8 != v13)
        {
          do
          {
            v20 = *--v8;
            *((_QWORD *)v19 - 1) = v20;
            v19 -= 8;
          }
          while (v8 != v13);
          v8 = *(_QWORD **)(v3 + 64);
        }
        *(_QWORD *)(v3 + 64) = v19;
        *(_QWORD *)(v3 + 72) = v9;
        *(_QWORD *)(v3 + 80) = &v18[8 * v17];
        if (v8)
          operator delete(v8);
      }
      else
      {
        *v8 = v6;
        v9 = v8 + 1;
      }
      *(_QWORD *)(v3 + 72) = v9;
      std::mutex::unlock((std::mutex *)v3);
      v12 = 2;
    }
    else
    {
      v10 = dlerror();
      v11 = operator new();
      std::string::basic_string[abi:nn180100]<0>((_QWORD *)(v11 + 8), v10);
      *(_QWORD *)v11 = off_251C387B8;
      v6 = (void *)(v11 & 0xFFFFFFFFFFFFFFFELL);
      __orc_rt::Error::assertIsChecked(1);
      v12 = 255;
    }
    if (SHIBYTE(v27) < 0)
      operator delete(__p[0]);
    LOBYTE(__p[1]) = v12 & 1 | 2;
    v21 = v12 & 0xFFFFFFFD;
    __p[0] = v6;
    __orc_rt::detail::ResultSerializer<__orc_rt::SPSExpected<__orc_rt::SPSExecutorAddr>,__orc_rt::Expected<__orc_rt::ExecutorAddr>>::serialize((__orc_rt::WrapperFunctionResult *)v24, (uint64_t *)__p);
    v22 = (char)__p[1];
    __orc_rt::Expected<__orc_rt::ExecutorAddr>::assertIsChecked(LOBYTE(__p[1]));
    if ((v22 & 1) != 0 && __p[0])
      (*(void (**)(void *))(*(_QWORD *)__p[0] + 8))(__p[0]);
    __orc_rt::Expected<__orc_rt::ExecutorAddr>::assertIsChecked(v21);
  }
  else
  {
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)v24, "Could not deserialize arguments for wrapper function call");
  }
  if (SHIBYTE(v24[5]) < 0)
    operator delete((void *)v24[3]);
  return v24[0];
}

uint64_t xojit_dylibmgr_dlsym_wrapper(const char *a1, unint64_t a2)
{
  unint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v8;
  int64x2_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  std::string::size_type v13;
  char v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  __int128 v27;
  int64x2_t v28;
  uint64_t v29;
  void *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  unint64_t v34;
  char *v35;
  char *v36;
  const char *v37;
  void *v38;
  void *v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char *v49;
  _WORD *v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  char v58;
  unint64_t v59;
  std::string *v60;
  int v61;
  const std::string::value_type *v62;
  std::string::size_type v63;
  std::string *v64;
  std::string::size_type v65;
  const std::string::value_type *v66;
  std::string::size_type v67;
  uint64_t v68;
  std::string *v69;
  int v70;
  const std::string::value_type *v71;
  std::string::size_type v72;
  std::string *v73;
  std::string::size_type v74;
  std::string *v75;
  std::string::size_type v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  __int128 v80;
  char *v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  char v85;
  unint64_t v86;
  size_t v87;
  uint64_t v88;
  __int128 *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  unint64_t v93;
  unint64_t v94;
  BOOL v95;
  unint64_t v96;
  __int128 v97;
  __int128 v98;
  _OWORD v99[2];
  _BYTE v100[32];
  void *__p;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  unint64_t v105;
  _QWORD v106[3];
  char v107;
  const char *v108;
  __int128 v109;
  char v110;
  std::string v111;
  char v112;
  __int128 v113;
  uint64_t v114;

  v114 = *MEMORY[0x24BDAC8D0];
  v98 = 0u;
  memset(v99, 0, 24);
  if (a2 < 8)
    goto LABEL_93;
  *(_QWORD *)&v98 = *(_QWORD *)a1;
  if ((a2 & 0xFFFFFFFFFFFFFFF8) == 8)
    goto LABEL_93;
  *((_QWORD *)&v98 + 1) = *((_QWORD *)a1 + 1);
  if ((a2 & 0xFFFFFFFFFFFFFFF8) == 0x10)
    goto LABEL_93;
  v2 = *((_QWORD *)a1 + 2);
  v108 = a1 + 24;
  *(_QWORD *)&v109 = a2 - 24;
  if (v2)
  {
    if (v2 >> 59)
LABEL_161:
      abort();
    __p = &v99[1];
    v3 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::RemoteSymbolLookupSetElement>>(v2);
    v5 = *((_QWORD *)&v99[0] + 1);
    v6 = *(_QWORD *)&v99[0];
    if (*((_QWORD *)&v99[0] + 1) == *(_QWORD *)&v99[0])
    {
      v9 = vdupq_n_s64(*((unint64_t *)&v99[0] + 1));
      v7 = v3;
    }
    else
    {
      v7 = v3;
      do
      {
        v8 = *(_OWORD *)(v5 - 32);
        *((_QWORD *)v7 - 2) = *(_QWORD *)(v5 - 16);
        *((_OWORD *)v7 - 2) = v8;
        *(_QWORD *)(v5 - 24) = 0;
        *(_QWORD *)(v5 - 16) = 0;
        *(_QWORD *)(v5 - 32) = 0;
        *(v7 - 8) = *(_BYTE *)(v5 - 8);
        v7 -= 32;
        v5 -= 32;
      }
      while (v5 != v6);
      v9 = (int64x2_t)v99[0];
    }
    *(_QWORD *)&v99[0] = v7;
    *((_QWORD *)&v99[0] + 1) = v3;
    *(int64x2_t *)&v100[8] = v9;
    v10 = *(_QWORD *)&v99[1];
    *(_QWORD *)&v99[1] = &v3[32 * v4];
    *(_QWORD *)&v100[24] = v10;
    *(_QWORD *)v100 = v9.i64[0];
    std::__split_buffer<__orc_rt::RemoteSymbolLookupSetElement>::~__split_buffer((uint64_t)v100);
    v11 = 0;
    while (1)
    {
      memset(&v111, 0, sizeof(v111));
      if (!__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::deserialize((uint64_t)&v108, &v111)|| !(_QWORD)v109)
      {
        break;
      }
      v12 = *v108++;
      *(_QWORD *)&v109 = v109 - 1;
      v112 = v12;
      v106[0] = v111.__r_.__value_.__l.__size_;
      v13 = v111.__r_.__value_.__r.__words[0];
      *(_QWORD *)((char *)v106 + 7) = *(std::string::size_type *)((char *)&v111.__r_.__value_.__r.__words[1] + 7);
      v14 = HIBYTE(v111.__r_.__value_.__r.__words[2]);
      memset(&v111, 0, sizeof(v111));
      v15 = *((_QWORD *)&v99[0] + 1);
      if (*((_QWORD *)&v99[0] + 1) >= *(_QWORD *)&v99[1])
      {
        v17 = (uint64_t)(*((_QWORD *)&v99[0] + 1) - *(_QWORD *)&v99[0]) >> 5;
        v18 = v17 + 1;
        if ((unint64_t)(v17 + 1) >> 59)
          goto LABEL_161;
        v19 = *(_QWORD *)&v99[1] - *(_QWORD *)&v99[0];
        if ((uint64_t)(*(_QWORD *)&v99[1] - *(_QWORD *)&v99[0]) >> 4 > v18)
          v18 = v19 >> 4;
        if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFE0)
          v20 = 0x7FFFFFFFFFFFFFFLL;
        else
          v20 = v18;
        __p = &v99[1];
        v21 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::RemoteSymbolLookupSetElement>>(v20);
        v23 = &v21[32 * v17];
        *(_QWORD *)v23 = v13;
        *((_QWORD *)v23 + 1) = v106[0];
        *(_QWORD *)(v23 + 15) = *(_QWORD *)((char *)v106 + 7);
        v23[23] = v14;
        v106[0] = 0;
        *(_QWORD *)((char *)v106 + 7) = 0;
        v23[24] = v12;
        v24 = *((_QWORD *)&v99[0] + 1);
        v25 = *(_QWORD *)&v99[0];
        if (*((_QWORD *)&v99[0] + 1) == *(_QWORD *)&v99[0])
        {
          v28 = vdupq_n_s64(*((unint64_t *)&v99[0] + 1));
          v26 = &v21[32 * v17];
        }
        else
        {
          v26 = &v21[32 * v17];
          do
          {
            v27 = *(_OWORD *)(v24 - 32);
            *((_QWORD *)v26 - 2) = *(_QWORD *)(v24 - 16);
            *((_OWORD *)v26 - 2) = v27;
            *(_QWORD *)(v24 - 24) = 0;
            *(_QWORD *)(v24 - 16) = 0;
            *(_QWORD *)(v24 - 32) = 0;
            *(v26 - 8) = *(_BYTE *)(v24 - 8);
            v26 -= 32;
            v24 -= 32;
          }
          while (v24 != v25);
          v28 = (int64x2_t)v99[0];
        }
        v16 = v23 + 32;
        *(_QWORD *)&v99[0] = v26;
        *((_QWORD *)&v99[0] + 1) = v23 + 32;
        *(int64x2_t *)&v100[8] = v28;
        v29 = *(_QWORD *)&v99[1];
        *(_QWORD *)&v99[1] = &v21[32 * v22];
        *(_QWORD *)&v100[24] = v29;
        *(_QWORD *)v100 = v28.i64[0];
        std::__split_buffer<__orc_rt::RemoteSymbolLookupSetElement>::~__split_buffer((uint64_t)v100);
      }
      else
      {
        **((_QWORD **)&v99[0] + 1) = v13;
        *(_QWORD *)(v15 + 8) = v106[0];
        *(_QWORD *)(v15 + 15) = *(_QWORD *)((char *)v106 + 7);
        *(_BYTE *)(v15 + 23) = v14;
        v106[0] = 0;
        *(_QWORD *)((char *)v106 + 7) = 0;
        *(_BYTE *)(v15 + 24) = v12;
        v16 = (char *)(v15 + 32);
      }
      *((_QWORD *)&v99[0] + 1) = v16;
      if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v111.__r_.__value_.__l.__data_);
      if (++v11 == v2)
        goto LABEL_31;
    }
    if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v111.__r_.__value_.__l.__data_);
LABEL_93:
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&v97, "Could not deserialize arguments for wrapper function call");
    goto LABEL_94;
  }
LABEL_31:
  v30 = (void *)*((_QWORD *)&v98 + 1);
  v32 = (uint64_t *)*((_QWORD *)&v99[0] + 1);
  v31 = *(uint64_t **)&v99[0];
  v106[0] = *(_QWORD *)&v99[0];
  *(_OWORD *)&v106[1] = *(_OWORD *)((char *)v99 + 8);
  memset(v99, 0, 24);
  v33 = v32;
  if (v31 == v32)
  {
    v34 = 0;
    v40 = 0;
    v36 = 0;
LABEL_96:
    *(_QWORD *)&v109 = v40;
    *((_QWORD *)&v109 + 1) = v34;
    v58 = 2;
    v59 = (unint64_t)v36;
    goto LABEL_119;
  }
  v34 = 0;
  v35 = 0;
  v36 = 0;
  while (1)
  {
    if (*((char *)v31 + 23) < 0)
    {
      if (!v31[1])
      {
LABEL_42:
        if (*((_BYTE *)v31 + 24))
        {
          v68 = operator new();
          std::string::basic_string[abi:nn180100]<0>((_QWORD *)(v68 + 8), "Required address for empty symbol");
          *(_QWORD *)v68 = off_251C387B8;
          v59 = v68 & 0xFFFFFFFFFFFFFFFELL;
          v108 = (const char *)(v68 & 0xFFFFFFFFFFFFFFFELL);
          __orc_rt::Error::assertIsChecked(1);
          goto LABEL_116;
        }
        if ((unint64_t)v35 >= v34)
        {
          v41 = (v35 - v36) >> 4;
          v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 60)
            goto LABEL_161;
          if ((uint64_t)(v34 - (_QWORD)v36) >> 3 > v42)
            v42 = (uint64_t)(v34 - (_QWORD)v36) >> 3;
          if (v34 - (unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0)
            v43 = 0xFFFFFFFFFFFFFFFLL;
          else
            v43 = v42;
          if (v43)
            v43 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v43);
          else
            v44 = 0;
          v49 = (char *)(v43 + 16 * v41);
          *(_QWORD *)v49 = 0;
          *((_QWORD *)v49 + 1) = 0;
          if (v35 != v36)
          {
            v50 = (_WORD *)(v43 + 16 * v41);
            do
            {
              v53 = *((_QWORD *)v35 - 2);
              v35 -= 16;
              v54 = *((_WORD *)v35 + 4);
              *((_QWORD *)v50 - 2) = v53;
              v50 -= 8;
              v50[4] = v54;
            }
            while (v35 != v36);
            goto LABEL_85;
          }
          goto LABEL_86;
        }
LABEL_54:
        v40 = v35 + 16;
        *(_QWORD *)v35 = 0;
        *((_QWORD *)v35 + 1) = 0;
        goto LABEL_89;
      }
      v37 = (const char *)*v31;
    }
    else
    {
      v37 = (const char *)v31;
      if (!*((_BYTE *)v31 + 23))
        goto LABEL_42;
    }
    if (*v37 != 95)
      break;
    v38 = dlsym(v30, v37 + 1);
    if (!v38)
    {
      if (*((_BYTE *)v31 + 24))
      {
        v69 = (std::string *)std::string::basic_string[abi:nn180100]<0>(&v111, "symbol ");
        v70 = *((char *)v31 + 23);
        if (v70 >= 0)
          v71 = (const std::string::value_type *)v31;
        else
          v71 = (const std::string::value_type *)*v31;
        if (v70 >= 0)
          v72 = *((unsigned __int8 *)v31 + 23);
        else
          v72 = v31[1];
        v73 = std::string::append(v69, v71, v72);
        v74 = v73->__r_.__value_.__r.__words[2];
        *(_OWORD *)v100 = *(_OWORD *)&v73->__r_.__value_.__l.__data_;
        *(_QWORD *)&v100[16] = v74;
        v73->__r_.__value_.__l.__size_ = 0;
        v73->__r_.__value_.__r.__words[2] = 0;
        v73->__r_.__value_.__r.__words[0] = 0;
        v66 = " not found";
        v67 = 10;
        goto LABEL_112;
      }
      if ((unint64_t)v35 >= v34)
      {
        v47 = (v35 - v36) >> 4;
        v48 = v47 + 1;
        if ((unint64_t)(v47 + 1) >> 60)
          goto LABEL_161;
        if ((uint64_t)(v34 - (_QWORD)v36) >> 3 > v48)
          v48 = (uint64_t)(v34 - (_QWORD)v36) >> 3;
        if (v34 - (unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0)
          v43 = 0xFFFFFFFFFFFFFFFLL;
        else
          v43 = v48;
        if (v43)
          v43 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v43);
        else
          v44 = 0;
        v49 = (char *)(v43 + 16 * v47);
        *(_QWORD *)v49 = 0;
        *((_QWORD *)v49 + 1) = 0;
        if (v35 != v36)
        {
          v50 = (_WORD *)(v43 + 16 * v47);
          do
          {
            v55 = *((_QWORD *)v35 - 2);
            v35 -= 16;
            v56 = *((_WORD *)v35 + 4);
            *((_QWORD *)v50 - 2) = v55;
            v50 -= 8;
            v50[4] = v56;
          }
          while (v35 != v36);
LABEL_85:
          v35 = v36;
          v36 = (char *)v50;
LABEL_87:
          v34 = v43 + 16 * v44;
          v40 = v49 + 16;
          if (v35)
            operator delete(v35);
          goto LABEL_89;
        }
LABEL_86:
        v36 = v49;
        goto LABEL_87;
      }
      goto LABEL_54;
    }
    v39 = v38;
    if ((unint64_t)v35 >= v34)
    {
      v45 = (v35 - v36) >> 4;
      v46 = v45 + 1;
      if ((unint64_t)(v45 + 1) >> 60)
        goto LABEL_161;
      if ((uint64_t)(v34 - (_QWORD)v36) >> 3 > v46)
        v46 = (uint64_t)(v34 - (_QWORD)v36) >> 3;
      if (v34 - (unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0)
        v43 = 0xFFFFFFFFFFFFFFFLL;
      else
        v43 = v46;
      if (v43)
        v43 = (unint64_t)std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(v43);
      else
        v44 = 0;
      v49 = (char *)(v43 + 16 * v45);
      *(_QWORD *)v49 = v39;
      *((_WORD *)v49 + 4) = 4096;
      if (v35 != v36)
      {
        v50 = (_WORD *)(v43 + 16 * v45);
        do
        {
          v51 = *((_QWORD *)v35 - 2);
          v35 -= 16;
          v52 = *((_WORD *)v35 + 4);
          *((_QWORD *)v50 - 2) = v51;
          v50 -= 8;
          v50[4] = v52;
        }
        while (v35 != v36);
        goto LABEL_85;
      }
      goto LABEL_86;
    }
    *(_QWORD *)v35 = v38;
    *((_WORD *)v35 + 4) = 4096;
    v40 = v35 + 16;
LABEL_89:
    v31 += 4;
    v35 = v40;
    if (v31 == v33)
      goto LABEL_96;
  }
  v60 = (std::string *)std::string::basic_string[abi:nn180100]<0>(&v111, "lookup called on ");
  v61 = *((char *)v31 + 23);
  if (v61 >= 0)
    v62 = (const std::string::value_type *)v31;
  else
    v62 = (const std::string::value_type *)*v31;
  if (v61 >= 0)
    v63 = *((unsigned __int8 *)v31 + 23);
  else
    v63 = v31[1];
  v64 = std::string::append(v60, v62, v63);
  v65 = v64->__r_.__value_.__r.__words[2];
  *(_OWORD *)v100 = *(_OWORD *)&v64->__r_.__value_.__l.__data_;
  *(_QWORD *)&v100[16] = v65;
  v64->__r_.__value_.__l.__size_ = 0;
  v64->__r_.__value_.__r.__words[2] = 0;
  v64->__r_.__value_.__r.__words[0] = 0;
  v66 = ", but symbol does notstart with an '_'";
  v67 = 38;
LABEL_112:
  v75 = std::string::append((std::string *)v100, v66, v67);
  v76 = v75->__r_.__value_.__r.__words[0];
  *(_QWORD *)&v113 = v75->__r_.__value_.__l.__size_;
  *(_QWORD *)((char *)&v113 + 7) = *(std::string::size_type *)((char *)&v75->__r_.__value_.__r.__words[1] + 7);
  v77 = HIBYTE(v75->__r_.__value_.__r.__words[2]);
  v75->__r_.__value_.__l.__size_ = 0;
  v75->__r_.__value_.__r.__words[2] = 0;
  v75->__r_.__value_.__r.__words[0] = 0;
  v78 = operator new();
  v79 = v113;
  *(_QWORD *)(v78 + 8) = v76;
  *(_QWORD *)(v78 + 16) = v79;
  *(_QWORD *)(v78 + 23) = *(_QWORD *)((char *)&v113 + 7);
  *(_QWORD *)v78 = off_251C387B8;
  *(_BYTE *)(v78 + 31) = v77;
  v110 = -1;
  v59 = v78 & 0xFFFFFFFFFFFFFFFELL;
  v108 = (const char *)(v78 & 0xFFFFFFFFFFFFFFFELL);
  __orc_rt::Error::assertIsChecked(1);
  if ((v100[23] & 0x80000000) != 0)
    operator delete(*(void **)v100);
  if (SHIBYTE(v111.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v111.__r_.__value_.__l.__data_);
LABEL_116:
  if (v36)
    operator delete(v36);
  v58 = -1;
LABEL_119:
  *(_QWORD *)v100 = v106;
  std::vector<__orc_rt::RemoteSymbolLookupSetElement>::__destroy_vector::operator()[abi:nn180100]((void ***)v100);
  v110 = v58 & 0xFD;
  if ((v58 & 1) == 0)
  {
    v80 = v109;
    v108 = 0;
    v109 = 0uLL;
    memset(v106, 0, sizeof(v106));
    v107 = 0;
    v112 = 0;
    v100[0] = 1;
    *(_QWORD *)&v100[8] = v59;
    *(_OWORD *)&v100[16] = v80;
    memset(&v111, 0, sizeof(v111));
    v102 = 0;
    v103 = 0;
    v81 = (char *)&v113 + 1;
    v82 = v80;
    __p = 0;
    goto LABEL_127;
  }
  v108 = 0;
  v107 = v58 & 1;
  v106[0] = 0;
  v100[0] = 0;
  memset(&v100[8], 0, 24);
  v112 = v58 & 1;
  v111.__r_.__value_.__r.__words[0] = 0;
  v83 = v59 & 0xFFFFFFFFFFFFFFFELL;
  if ((v59 & 0xFFFFFFFFFFFFFFFELL) != 0
    && (*(unsigned int (**)(unint64_t, void *))(*(_QWORD *)v83 + 24))(v59 & 0xFFFFFFFFFFFFFFFELL, &_MergedGlobals))
  {
    (*(void (**)(void **__return_ptr, unint64_t))(*(_QWORD *)v83 + 40))(&__p, v59 & 0xFFFFFFFFFFFFFFFELL);
    (*(void (**)(unint64_t))(*(_QWORD *)v83 + 8))(v59 & 0xFFFFFFFFFFFFFFFELL);
    v84 = 1;
  }
  else
  {
    v84 = v59 | 1;
    __p = 0;
    v102 = 0;
    v103 = 0;
  }
  __orc_rt::Error::assertIsChecked(v84);
  v85 = v100[0];
  v81 = (char *)&v113 + 1;
  if (!v100[0])
  {
    v88 = HIBYTE(v103);
    if (v103 < 0)
      v88 = v102;
    v86 = v88 + 8;
LABEL_133:
    v87 = v86 + 1;
    if (v86 + 1 >= 9)
      goto LABEL_134;
    *(_QWORD *)&v113 = 0;
    *((_QWORD *)&v113 + 1) = v86 + 1;
    if (v86 != -1)
    {
      v89 = &v113;
      goto LABEL_137;
    }
    goto LABEL_151;
  }
  v82 = *(_QWORD *)&v100[16];
  v59 = *(_QWORD *)&v100[8];
LABEL_127:
  if (v59 != v82)
  {
    v86 = 10 * ((v82 - v59 - 16) >> 4) + 18;
    v85 = 1;
    goto LABEL_133;
  }
  v86 = 8;
  v87 = 9;
LABEL_134:
  v89 = (__int128 *)malloc_type_malloc(v87, 0xB91D0188uLL);
  v81 = (char *)v89 + 1;
  *(_QWORD *)&v113 = v89;
  *((_QWORD *)&v113 + 1) = v87;
  v85 = v100[0];
LABEL_137:
  *(_BYTE *)v89 = v85;
  v104 = v81;
  v105 = v86;
  if (!v100[0])
  {
    if (__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::serialize(&v104, (uint64_t)&__p))
      goto LABEL_148;
    goto LABEL_151;
  }
  if (v86 < 8)
    goto LABEL_151;
  *(_QWORD *)((char *)v89 + 1) = (uint64_t)(*(_QWORD *)&v100[16] - *(_QWORD *)&v100[8]) >> 4;
  v105 = v86 - 8;
  v91 = *(_QWORD *)&v100[16];
  v90 = *(_QWORD *)&v100[8];
  if (*(_QWORD *)&v100[8] == *(_QWORD *)&v100[16])
    goto LABEL_148;
  if (v86 - 8 < 8)
  {
LABEL_151:
    __orc_rt::WrapperFunctionResult::createOutOfBandError((__orc_rt::WrapperFunctionResult *)&v97, "Error serializing arguments to blob in call");
    if (*((_QWORD *)&v113 + 1) > 8uLL || !*((_QWORD *)&v113 + 1) && (_QWORD)v113)
      free((void *)v113);
    goto LABEL_155;
  }
  v92 = (char *)v89 + 9;
  v93 = v86 - 18;
  while (1)
  {
    *(_QWORD *)v92 = *(_QWORD *)v90;
    if (v93 == -2 || (v92[8] = *(_BYTE *)(v90 + 9), v93 == -1))
    {
      v96 = 0;
      goto LABEL_150;
    }
    v92[9] = *(_BYTE *)(v90 + 8);
    v90 += 16;
    if (v90 == v91)
      break;
    v92 += 10;
    v94 = v93 - 10;
    v95 = v93 >= 8;
    v93 -= 10;
    if (!v95)
    {
      v96 = v94 + 10;
LABEL_150:
      v105 = v96;
      goto LABEL_151;
    }
  }
  v105 = v93;
LABEL_148:
  v97 = v113;
LABEL_155:
  if (SHIBYTE(v103) < 0)
    operator delete(__p);
  if (*(_QWORD *)&v100[8])
  {
    *(_QWORD *)&v100[16] = *(_QWORD *)&v100[8];
    operator delete(*(void **)&v100[8]);
  }
  __orc_rt::Expected<std::vector<__orc_rt::ExecutorSymbolDef>>::~Expected((uint64_t)&v111);
  __orc_rt::Expected<std::vector<__orc_rt::ExecutorSymbolDef>>::~Expected((uint64_t)v106);
  __orc_rt::Expected<std::vector<__orc_rt::ExecutorSymbolDef>>::~Expected((uint64_t)&v108);
LABEL_94:
  *(_QWORD *)v100 = v99;
  std::vector<__orc_rt::RemoteSymbolLookupSetElement>::__destroy_vector::operator()[abi:nn180100]((void ***)v100);
  return v97;
}

double xojit_dylibmgr_create()
{
  uint64_t v0;
  double result;

  v0 = operator new();
  *(_QWORD *)v0 = 850045863;
  result = 0.0;
  *(_OWORD *)(v0 + 8) = 0u;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  return result;
}

std::mutex *xojit_dylibmgr_destroy(std::mutex *this)
{
  std::mutex *v1;
  void *sig;

  if (this)
  {
    v1 = this;
    sig = (void *)this[1].__m_.__sig;
    if (sig)
    {
      *(_QWORD *)v1[1].__m_.__opaque = sig;
      operator delete(sig);
    }
    std::mutex::~mutex(v1);
    JUMPOUT(0x24BD1BEFCLL);
  }
  return this;
}

double xojit_xpcmemmgr_create()
{
  uint64_t v0;
  double result;

  v0 = operator new();
  result = 0.0;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 128) = 0u;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_QWORD *)v0 = 850045863;
  *(_OWORD *)(v0 + 8) = 0u;
  *(_OWORD *)(v0 + 24) = 0u;
  *(_OWORD *)(v0 + 40) = 0u;
  *(_OWORD *)(v0 + 56) = 0u;
  *(_OWORD *)(v0 + 72) = 0u;
  *(_QWORD *)(v0 + 88) = 0;
  *(_DWORD *)(v0 + 96) = 1065353216;
  *(_OWORD *)(v0 + 120) = 0u;
  *(_OWORD *)(v0 + 104) = 0u;
  *(_DWORD *)(v0 + 136) = 1065353216;
  *(_QWORD *)(v0 + 144) = 0;
  return result;
}

std::mutex *xojit_xpcmemmgr_destroy(std::mutex *this)
{
  std::mutex *v1;
  char *v2;
  char *v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *sig;
  void **v8;

  if (this)
  {
    v1 = this;
    v2 = *(char **)&this[1].__m_.__opaque[48];
    if (v2)
    {
      do
      {
        v3 = *(char **)v2;
        v8 = (void **)(v2 + 24);
        std::vector<__orc_rt::WrapperFunctionCall>::__destroy_vector::operator()[abi:nn180100](&v8);
        operator delete(v2);
        v2 = v3;
      }
      while (v3);
    }
    v4 = *(void **)&v1[1].__m_.__opaque[32];
    *(_QWORD *)&v1[1].__m_.__opaque[32] = 0;
    if (v4)
      operator delete(v4);
    v5 = *(_QWORD **)&v1[1].__m_.__opaque[8];
    if (v5)
    {
      do
      {
        v6 = (_QWORD *)*v5;
        operator delete(v5);
        v5 = v6;
      }
      while (v6);
    }
    sig = (void *)v1[1].__m_.__sig;
    v1[1].__m_.__sig = 0;
    if (sig)
      operator delete(sig);
    std::mutex::~mutex(v1);
    JUMPOUT(0x24BD1BEFCLL);
  }
  return this;
}

void __orc_rt::WrapperFunctionCall::runWithSPSRet<__orc_rt::SPSEmpty,__orc_rt::SPSEmpty>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (*(uint64_t (**)(_QWORD, _QWORD))a2)(*(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8));
  v5 = (void *)v3;
  if (v4)
  {
    if (v4 > 8)
    {
      v6 = 0;
LABEL_6:
      *a1 = v6;
      free(v5);
      return;
    }
  }
  else if (v3)
  {
    v7 = operator new();
    std::string::basic_string[abi:nn180100]<0>((_QWORD *)(v7 + 8), (char *)v5);
    *(_QWORD *)v7 = off_251C387B8;
    v6 = v7 | 1;
    goto LABEL_6;
  }
  *a1 = 0;
}

void __orc_rt::StringError::~StringError(void **this)
{
  *this = off_251C387B8;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

{
  *this = off_251C387B8;
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
  JUMPOUT(0x24BD1BEFCLL);
}

void *__orc_rt::RTTIExtends<__orc_rt::StringError,__orc_rt::ErrorInfoBase>::dynamicClassID()
{
  return &unk_257967439;
}

uint64_t __orc_rt::RTTIExtends<__orc_rt::StringError,__orc_rt::ErrorInfoBase>::isA(uint64_t a1, void *a2)
{
  _BOOL4 v3;

  v3 = a2 == &_MergedGlobals || a2 == &__orc_rt::RTTIRoot::ID;
  return a2 == &unk_257967439 || v3;
}

void __orc_rt::StringError::toString(__orc_rt::StringError *this@<X0>, std::string *a2@<X8>)
{
  if (*((char *)this + 31) < 0)
  {
    std::string::__init_copy_ctor_external(a2, *((const std::string::value_type **)this + 1), *((_QWORD *)this + 2));
  }
  else
  {
    *(_OWORD *)&a2->__r_.__value_.__l.__data_ = *(_OWORD *)((char *)this + 8);
    a2->__r_.__value_.__r.__words[2] = *((_QWORD *)this + 3);
  }
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      abort();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
  abort();
}

uint64_t __orc_rt::Error::assertIsChecked(uint64_t this)
{
  if (this != 1)
  {
    fwrite("Error must be checked prior to destruction.\n", 0x2CuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    abort();
  }
  return this;
}

_QWORD *std::construct_at[abi:nn180100]<__orc_rt::WrapperFunctionCall,__orc_rt::WrapperFunctionCall const&,__orc_rt::WrapperFunctionCall*>(_QWORD *a1, _QWORD *a2)
{
  _BYTE *v3;
  _BYTE *v4;
  size_t v5;
  char *v6;
  char *v7;

  *a1 = *a2;
  a1[1] = 0;
  a1[2] = 0;
  a1[3] = 0;
  v4 = (_BYTE *)a2[1];
  v3 = (_BYTE *)a2[2];
  v5 = v3 - v4;
  if (v3 != v4)
  {
    if (v3 - v4 < 0)
      abort();
    v6 = (char *)operator new(v3 - v4);
    a1[1] = v6;
    a1[2] = v6;
    v7 = &v6[v5];
    a1[3] = &v6[v5];
    memmove(v6, v4, v5);
    a1[2] = v7;
  }
  return a1;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](uint64_t *a1, unint64_t a2)
{
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
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  unint64_t v52;
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
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v72;
  unint64_t v73;

  if (a2 > 0x20)
  {
    if (a2 <= 0x40)
    {
      v5 = *(uint64_t *)((char *)a1 + a2 - 16);
      v6 = *a1 - 0x3C5A37A36834CED9 * (v5 + a2);
      v8 = a1[2];
      v7 = a1[3];
      v9 = __ROR8__(v6 + v7, 52);
      v10 = v6 + a1[1];
      v11 = __ROR8__(v10, 7);
      v12 = v10 + v8;
      v13 = *(uint64_t *)((char *)a1 + a2 - 32) + v8;
      v14 = *(uint64_t *)((char *)a1 + a2 - 8) + v7;
      v15 = __ROR8__(v14 + v13, 52);
      v16 = v11 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v5 + a2), 37) + v9;
      v17 = __ROR8__(v13, 37);
      v18 = *(uint64_t *)((char *)a1 + a2 - 24) + v13;
      v19 = __ROR8__(v18, 7);
      v20 = v16 + __ROR8__(v12, 31);
      v21 = v18 + v5;
      v22 = v21 + v14;
      v23 = 0x9AE16A3B2F90404FLL;
      v24 = 0xC3A5C85C97CB3127 * (v22 + v20) - 0x651E95C4D06FBFB1 * (v12 + v7 + v17 + v19 + v15 + __ROR8__(v21, 31));
      v25 = v20 - 0x3C5A37A36834CED9 * (v24 ^ (v24 >> 47));
      return (v25 ^ (v25 >> 47)) * v23;
    }
    v4 = 0x9DDFEA08EB382D69;
    v32 = *(uint64_t *)((char *)a1 + a2 - 48);
    v33 = *(uint64_t *)((char *)a1 + a2 - 40);
    v34 = *(uint64_t *)((char *)a1 + a2 - 24);
    v36 = *(uint64_t *)((char *)a1 + a2 - 64);
    v35 = *(uint64_t *)((char *)a1 + a2 - 56);
    v37 = *(uint64_t *)((char *)a1 + a2 - 16);
    v38 = *(uint64_t *)((char *)a1 + a2 - 8);
    v39 = v35 + v37;
    v40 = 0x9DDFEA08EB382D69
        * (v34 ^ ((0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))) >> 47) ^ (0x9DDFEA08EB382D69 * (v34 ^ (v32 + a2))));
    v41 = 0x9DDFEA08EB382D69 * (v40 ^ (v40 >> 47));
    v42 = v32 + v35 + v36 + a2;
    v43 = v42 + v33;
    v44 = __ROR8__(v42, 44) + v36 + a2 + __ROR8__(v36 + a2 + v33 - 0x622015F714C7D297 * (v40 ^ (v40 >> 47)), 21);
    v45 = v35 + v37 + *(uint64_t *)((char *)a1 + a2 - 32) - 0x4B6D499041670D8DLL;
    v46 = v34 + v37 + v45;
    v47 = __ROR8__(v46, 44);
    v48 = v46 + v38;
    v49 = v47 + v45 + __ROR8__(v45 + v33 + v38, 21);
    v51 = *a1;
    v50 = a1 + 4;
    v52 = v51 - 0x4B6D499041670D8DLL * v33;
    v53 = -(uint64_t)((a2 - 1) & 0xFFFFFFFFFFFFFFC0);
    do
    {
      v54 = *(v50 - 3);
      v55 = v52 + v43 + v39 + v54;
      v56 = v50[2];
      v57 = v50[3];
      v58 = v50[1];
      v39 = v58 + v43 - 0x4B6D499041670D8DLL * __ROR8__(v39 + v44 + v56, 42);
      v59 = v41 + v48;
      v60 = *(v50 - 2);
      v61 = *(v50 - 1);
      v62 = *(v50 - 4) - 0x4B6D499041670D8DLL * v44;
      v63 = v62 + v48 + v61;
      v64 = v62 + v54 + v60;
      v43 = v64 + v61;
      v65 = __ROR8__(v64, 44) + v62;
      v66 = (0xB492B66FBE98F273 * __ROR8__(v55, 37)) ^ v49;
      v52 = 0xB492B66FBE98F273 * __ROR8__(v59, 33);
      v44 = v65 + __ROR8__(v63 + v66, 21);
      v67 = v52 + v49 + *v50;
      v48 = v58 + v56 + v67 + v57;
      v49 = __ROR8__(v58 + v56 + v67, 44) + v67 + __ROR8__(v39 + v60 + v67 + v57, 21);
      v50 += 8;
      v41 = v66;
      v53 += 64;
    }
    while (v53);
    v68 = v52
        - 0x622015F714C7D297
        * ((0x9DDFEA08EB382D69
          * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) ^ ((0x9DDFEA08EB382D69 * (v49 ^ ((0x9DDFEA08EB382D69 * (v49 ^ v44)) >> 47) ^ (0x9DDFEA08EB382D69 * (v49 ^ v44)))) >> 47));
    v69 = 0x9DDFEA08EB382D69
        * (v68 ^ (v66
                - 0x4B6D499041670D8DLL * (v39 ^ (v39 >> 47))
                - 0x622015F714C7D297
                * ((0x9DDFEA08EB382D69
                  * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) ^ ((0x9DDFEA08EB382D69 * (v48 ^ ((0x9DDFEA08EB382D69 * (v48 ^ v43)) >> 47) ^ (0x9DDFEA08EB382D69 * (v48 ^ v43)))) >> 47))));
    v70 = 0x9DDFEA08EB382D69 * (v68 ^ (v69 >> 47) ^ v69);
    goto LABEL_13;
  }
  if (a2 > 0x10)
  {
    v26 = a1[1];
    v27 = 0xB492B66FBE98F273 * *a1;
    v28 = __ROR8__(0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8), 30) + __ROR8__(v27 - v26, 43);
    v29 = v27 + a2 + __ROR8__(v26 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(uint64_t *)((char *)a1 + a2 - 8);
    v23 = 0x9DDFEA08EB382D69;
    v30 = 0x9DDFEA08EB382D69 * ((v28 - 0x3C5A37A36834CED9 * *(uint64_t *)((char *)a1 + a2 - 16)) ^ v29);
    v31 = v29 ^ (v30 >> 47) ^ v30;
LABEL_8:
    v25 = 0x9DDFEA08EB382D69 * v31;
    return (v25 ^ (v25 >> 47)) * v23;
  }
  if (a2 < 9)
  {
    if (a2 >= 4)
    {
      v72 = *(unsigned int *)((char *)a1 + a2 - 4);
      v23 = 0x9DDFEA08EB382D69;
      v73 = 0x9DDFEA08EB382D69 * (((8 * *(_DWORD *)a1) + a2) ^ v72);
      v31 = v72 ^ (v73 >> 47) ^ v73;
      goto LABEL_8;
    }
    v4 = 0x9AE16A3B2F90404FLL;
    if (!a2)
      return v4;
    v70 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                   * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
LABEL_13:
    v4 *= v70 ^ (v70 >> 47);
    return v4;
  }
  v2 = *(uint64_t *)((char *)a1 + a2 - 8);
  v3 = __ROR8__(v2 + a2, a2);
  return (0x9DDFEA08EB382D69
        * ((0x9DDFEA08EB382D69
          * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) ^ ((0x9DDFEA08EB382D69 * (v3 ^ ((0x9DDFEA08EB382D69 * (v3 ^ *a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v3 ^ *a1)))) >> 47))) ^ v2;
}

void std::vector<__orc_rt::WrapperFunctionCall>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;
  void *v4;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 32)
  {
    v4 = *(void **)(i - 24);
    if (v4)
    {
      *(_QWORD *)(i - 16) = v4;
      operator delete(v4);
    }
  }
  a1[1] = v2;
}

void std::vector<__orc_rt::WrapperFunctionCall>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<__orc_rt::WrapperFunctionCall>::__clear[abi:nn180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<__orc_rt::AllocationActionsPair>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 8;
        std::__destroy_at[abi:nn180100]<__orc_rt::AllocationActionsPair,0>(v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:nn180100]<__orc_rt::AllocationActionsPair,0>(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[1];
  if (v3)
  {
    a1[2] = v3;
    operator delete(v3);
  }
}

void std::__assoc_state<std::pair<void *,orc_rt_CWrapperFunctionResult (*)(void *,unsigned long long,char const*,unsigned long)>>::~__assoc_state(uint64_t a1)
{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
}

{
  std::exception_ptr *v2;

  *(_QWORD *)a1 = MEMORY[0x24BEDB850] + 16;
  v2 = (std::exception_ptr *)(a1 + 16);
  std::condition_variable::~condition_variable((std::condition_variable *)(a1 + 88));
  std::mutex::~mutex((std::mutex *)(a1 + 24));
  std::exception_ptr::~exception_ptr(v2);
  std::__shared_count::~__shared_count((std::__shared_count *)a1);
  JUMPOUT(0x24BD1BEFCLL);
}

uint64_t std::__assoc_state<std::pair<void *,orc_rt_CWrapperFunctionResult (*)(void *,unsigned long long,char const*,unsigned long)>>::__on_zero_shared(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
}

uint64_t *std::promise<std::pair<void *,orc_rt_CWrapperFunctionResult (*)(void *,unsigned long long,char const*,unsigned long)>>::~promise(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  const std::error_category *v7;
  _BYTE v8[32];
  std::exception_ptr v9;

  v2 = *a1;
  if (v2)
  {
    if ((*(_BYTE *)(v2 + 136) & 1) == 0)
    {
      v9.__ptr_ = 0;
      v3 = *(_QWORD *)(v2 + 16);
      std::exception_ptr::~exception_ptr(&v9);
      v2 = *a1;
      if (!v3 && *(uint64_t *)(v2 + 8) >= 1)
      {
        v7 = std::future_category();
        MEMORY[0x24BD1BE60](v8, 4, v7);
        abort();
      }
    }
    v4 = (unint64_t *)(v2 + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 16))(v2);
  }
  return a1;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  unint64_t v6;
  std::string *v7;
  std::string::size_type size;
  unint64_t v9;
  unint64_t v10;

  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = this->__r_.__value_.__r.__words[2];
    v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    v6 = HIBYTE(v10);
    v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v7 = this;
    if (__n > 0x16)
    {
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0)
    this->__r_.__value_.__l.__size_ = __n;
  else
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return std::string::__assign_external(this, __s, v4);
}

uint64_t __orc_rt::detail::ResultSerializer<__orc_rt::SPSExpected<__orc_rt::SPSExecutorAddr>,__orc_rt::Expected<__orc_rt::ExecutorAddr>>::serialize(__orc_rt::WrapperFunctionResult *a1, uint64_t *a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char v12;
  char *v13;
  _QWORD *v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  void *__p;
  unint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  __int128 v22;

  v3 = *((_BYTE *)a2 + 8);
  *((_BYTE *)a2 + 8) = v3 & 0xFD;
  if ((v3 & 1) == 0)
  {
    v4 = *a2;
    v16 = 1;
    __orc_rt::Expected<__orc_rt::ExecutorAddr>::assertIsChecked(0);
    v5 = 0;
    v17 = v4;
    __p = 0;
    v6 = 9;
    v19 = 0;
    v20 = 0;
LABEL_11:
    v11 = (char *)malloc_type_malloc(v6, 0xB91D0188uLL);
    *(_QWORD *)&v22 = v11;
    *((_QWORD *)&v22 + 1) = v6;
    v12 = v16;
    goto LABEL_12;
  }
  v7 = *a2;
  *a2 = 0;
  v16 = 0;
  v17 = 0;
  v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
  if ((v7 & 0xFFFFFFFFFFFFFFFELL) != 0
    && (*(unsigned int (**)(unint64_t, void *))(*(_QWORD *)v8 + 24))(v7 & 0xFFFFFFFFFFFFFFFELL, &_MergedGlobals))
  {
    (*(void (**)(void **__return_ptr, unint64_t))(*(_QWORD *)v8 + 40))(&__p, v7 & 0xFFFFFFFFFFFFFFFELL);
    (*(void (**)(unint64_t))(*(_QWORD *)v8 + 8))(v7 & 0xFFFFFFFFFFFFFFFELL);
    v9 = 1;
  }
  else
  {
    v9 = v7 | 1;
    __p = 0;
    v19 = 0;
    v20 = 0;
  }
  __orc_rt::Error::assertIsChecked(v9);
  v10 = HIBYTE(v20);
  if (v20 < 0)
    v10 = v19;
  v6 = v10 + 9;
  if (v10 <= 0xFFFFFFFFFFFFFFF6)
  {
    v4 = 0;
    v5 = 1;
    goto LABEL_11;
  }
  v4 = 0;
  *(_QWORD *)&v22 = 0;
  *((_QWORD *)&v22 + 1) = v10 + 9;
  v5 = 1;
  if (v10 == -9)
    goto LABEL_21;
  v12 = 0;
  v11 = 0;
LABEL_12:
  v13 = (char *)&v22;
  if (v6 > 8)
    v13 = v11;
  *v13 = v12;
  v14 = v13 + 1;
  v21[0] = v14;
  v21[1] = v6 - 1;
  if (v16)
  {
    if (v6 - 1 >= 8)
    {
      *v14 = v17;
LABEL_18:
      *(_OWORD *)a1 = v22;
      goto LABEL_25;
    }
  }
  else if (__orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::serialize(v21, (uint64_t)&__p))
  {
    goto LABEL_18;
  }
LABEL_21:
  __orc_rt::WrapperFunctionResult::createOutOfBandError(a1, "Error serializing arguments to blob in call");
  if (*((_QWORD *)&v22 + 1) > 8uLL || !*((_QWORD *)&v22 + 1) && (_QWORD)v22)
    free((void *)v22);
LABEL_25:
  if (SHIBYTE(v20) < 0)
    operator delete(__p);
  result = __orc_rt::Expected<__orc_rt::ExecutorAddr>::assertIsChecked(v5);
  if ((v3 & 1) != 0)
  {
    if (v4)
      return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  }
  return result;
}

BOOL __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::serialize(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  int v5;
  BOOL v6;
  char *v7;
  uint64_t v8;
  _BOOL8 v9;
  BOOL v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  if (a1[1] < 8uLL)
    return 0;
  v2 = *(unsigned __int8 *)(a2 + 23);
  if ((v2 & 0x80u) != 0)
    v2 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)*a1 = v2;
  v3 = (_BYTE *)(*a1 + 8);
  v4 = a1[1] - 8;
  *a1 = v3;
  a1[1] = v4;
  v5 = *(char *)(a2 + 23);
  v6 = v5 < 0;
  if (v5 >= 0)
    v7 = (char *)a2;
  else
    v7 = *(char **)a2;
  if (v6)
    v8 = *(_QWORD *)(a2 + 8);
  else
    v8 = *(unsigned __int8 *)(a2 + 23);
  v9 = v8 == 0;
  if (v8)
    v10 = v4 == 0;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = v8 - 1;
    do
    {
      v12 = *v7++;
      *v3 = v12;
      v3 = (_BYTE *)(*a1 + 1);
      v13 = a1[1] - 1;
      *a1 = v3;
      a1[1] = v13;
      v9 = v11 == 0;
      if (!v11)
        break;
      --v11;
    }
    while (v13);
  }
  return v9;
}

uint64_t __orc_rt::Expected<__orc_rt::ExecutorAddr>::assertIsChecked(uint64_t result)
{
  if ((result & 2) != 0)
  {
    fwrite("Expected<T> must be checked before access or destruction.\n", 0x3AuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    abort();
  }
  return result;
}

uint64_t __orc_rt::detail::ResultSerializer<__orc_rt::SPSError,__orc_rt::Error>::serialize(__orc_rt::WrapperFunctionResult *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  char *v6;
  unint64_t v7;
  uint64_t v8;
  __int128 *v9;
  char v10;
  char v12;
  void *__p;
  unint64_t v14;
  uint64_t v15;
  _QWORD v16[2];
  __int128 v17;

  __orc_rt::Error::assertIsChecked(1);
  v4 = *a2;
  *a2 = 1;
  v5 = v4 & 0xFFFFFFFFFFFFFFFELL;
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 0)
  {
    v12 = 1;
    __orc_rt::Error::assertIsChecked(1);
    if ((*(unsigned int (**)(unint64_t, void *))(*(_QWORD *)v5 + 24))(v5, &_MergedGlobals))
    {
      (*(void (**)(void **__return_ptr, unint64_t))(*(_QWORD *)v5 + 40))(&__p, v5);
      (*(void (**)(unint64_t))(*(_QWORD *)v5 + 8))(v5);
      v5 = 1;
    }
    else
    {
      __p = 0;
      v14 = 0;
      v15 = 0;
    }
    __orc_rt::Error::assertIsChecked(v5);
    v6 = (char *)&v17 + 1;
    v7 = HIBYTE(v15);
    if (v15 < 0)
      v7 = v14;
    v8 = v7 + 9;
    if (v7 > 0xFFFFFFFFFFFFFFF6)
    {
      *(_QWORD *)&v17 = 0;
      *((_QWORD *)&v17 + 1) = v7 + 9;
      if (v7 == -9)
        goto LABEL_17;
      v9 = &v17;
      v10 = 1;
    }
    else
    {
      v9 = (__int128 *)malloc_type_malloc(v7 + 9, 0xB91D0188uLL);
      v6 = (char *)v9 + 1;
      *(_QWORD *)&v17 = v9;
      *((_QWORD *)&v17 + 1) = v8;
      v10 = 1;
    }
  }
  else
  {
    v12 = 0;
    v14 = 0;
    v15 = 0;
    __p = 0;
    v6 = (char *)&v17 + 1;
    v10 = 0;
    v17 = xmmword_24B2C36A0;
    v9 = &v17;
    v8 = 1;
  }
  *(_BYTE *)v9 = v10;
  v16[0] = v6;
  v16[1] = v8 - 1;
  if (!v12
    || __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::serialize(v16, (uint64_t)&__p))
  {
    *(_OWORD *)a1 = v17;
    goto LABEL_21;
  }
LABEL_17:
  __orc_rt::WrapperFunctionResult::createOutOfBandError(a1, "Error serializing arguments to blob in call");
  if (*((_QWORD *)&v17 + 1) > 8uLL || !*((_QWORD *)&v17 + 1) && (_QWORD)v17)
    free((void *)v17);
LABEL_21:
  if (SHIBYTE(v15) < 0)
    operator delete(__p);
  return __orc_rt::Error::assertIsChecked(1);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorAddr>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(8 * a1);
}

BOOL __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::string,void>::deserialize(uint64_t a1, std::string *this)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  std::string::size_type v7;
  uint64_t v8;
  std::string::value_type v9;
  _BOOL8 v10;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = v2 >= 8;
  v4 = v2 - 8;
  if (!v3)
    return 0;
  v7 = **(_QWORD **)a1;
  *(_QWORD *)a1 += 8;
  *(_QWORD *)(a1 + 8) = v4;
  std::string::reserve(this, v7);
  if (!v7)
    return 1;
  do
  {
    v8 = *(_QWORD *)(a1 + 8);
    v10 = v8 != 0;
    if (!v8)
      break;
    v9 = *(_BYTE *)(*(_QWORD *)a1)++;
    *(_QWORD *)(a1 + 8) = v8 - 1;
    std::string::push_back(this, v9);
    --v7;
  }
  while (v7);
  return v10;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::BufferWrite>>(unint64_t a1)
{
  if (a1 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(24 * a1);
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::RemoteSymbolLookupSetElement>>(unint64_t a1)
{
  if (a1 >> 59)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(32 * a1);
}

uint64_t std::__split_buffer<__orc_rt::RemoteSymbolLookupSetElement>::~__split_buffer(uint64_t a1)
{
  void **v2;
  void **v3;
  void **v4;

  v3 = *(void ***)(a1 + 8);
  v2 = *(void ***)(a1 + 16);
  if (v2 != v3)
  {
    do
    {
      v4 = v2 - 4;
      *(_QWORD *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v4);
        v4 = *(void ***)(a1 + 16);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::vector<__orc_rt::RemoteSymbolLookupSetElement>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  void **v1;
  void **v2;
  void **v4;
  void *v5;

  v1 = *a1;
  v2 = (void **)**a1;
  if (v2)
  {
    v4 = (void **)v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        if (*((char *)v4 - 9) < 0)
          operator delete(*(v4 - 4));
        v4 -= 4;
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

uint64_t __orc_rt::Expected<std::vector<__orc_rt::ExecutorSymbolDef>>::~Expected(uint64_t a1)
{
  void *v2;

  __orc_rt::Expected<__orc_rt::ExecutorAddr>::assertIsChecked(*(unsigned __int8 *)(a1 + 24));
  v2 = *(void **)a1;
  if ((*(_BYTE *)(a1 + 24) & 1) != 0)
  {
    *(_QWORD *)a1 = 0;
    if (v2)
      (*(void (**)(void *))(*(_QWORD *)v2 + 8))(v2);
  }
  else if (v2)
  {
    *(_QWORD *)(a1 + 8) = v2;
    operator delete(v2);
  }
  return a1;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::ExecutorSymbolDef>>(unint64_t a1)
{
  if (a1 >> 60)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(16 * a1);
}

_QWORD *std::string::basic_string[abi:nn180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    abort();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

uint64_t *std::vector<__orc_rt::AllocationActionsPair>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
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

  v3 = *result;
  v2 = result[1];
  v4 = a2[1];
  if (v2 != *result)
  {
    v5 = 0;
    do
    {
      v6 = v4 + v5;
      v7 = v2 + v5;
      *(_QWORD *)(v6 - 64) = *(_QWORD *)(v2 + v5 - 64);
      *(_QWORD *)(v6 - 56) = 0;
      *(_QWORD *)(v6 - 48) = 0;
      *(_QWORD *)(v6 - 40) = 0;
      *(_OWORD *)(v6 - 56) = *(_OWORD *)(v2 + v5 - 56);
      v8 = *(_QWORD *)(v2 + v5 - 32);
      *(_QWORD *)(v6 - 40) = *(_QWORD *)(v2 + v5 - 40);
      *(_QWORD *)(v7 - 48) = 0;
      *(_QWORD *)(v7 - 40) = 0;
      *(_QWORD *)(v7 - 56) = 0;
      *(_QWORD *)(v6 - 16) = 0;
      *(_QWORD *)(v6 - 8) = 0;
      *(_QWORD *)(v6 - 32) = v8;
      *(_QWORD *)(v6 - 24) = 0;
      *(_OWORD *)(v6 - 24) = *(_OWORD *)(v2 + v5 - 24);
      *(_QWORD *)(v6 - 8) = *(_QWORD *)(v2 + v5 - 8);
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v5 -= 64;
    }
    while (v2 + v5 != v3);
    v4 += v5;
  }
  a2[1] = v4;
  v9 = *result;
  *result = v4;
  a2[1] = v9;
  v10 = result[1];
  result[1] = a2[2];
  a2[2] = v10;
  v11 = result[2];
  result[2] = a2[3];
  a2[3] = v11;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<__orc_rt::AllocationActionsPair>>(unint64_t a1)
{
  if (a1 >> 58)
    std::__throw_bad_array_new_length[abi:nn180100]();
  return operator new(a1 << 6);
}

uint64_t std::__split_buffer<__orc_rt::AllocationActionsPair>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 64;
    std::__destroy_at[abi:nn180100]<__orc_rt::AllocationActionsPair,0>((_QWORD *)(i - 64));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t __orc_rt::SPSSerializationTraits<__orc_rt::SPSTuple<__orc_rt::SPSExecutorAddr,__orc_rt::SPSSequence<char>>,__orc_rt::WrapperFunctionCall,void>::deserialize(uint64_t a1, _QWORD *a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v6;
  int v7;
  void *v8;
  __int128 v9;
  void *v10;
  __int128 v12;
  void *__p;
  __int128 v14;

  __p = 0;
  v14 = 0uLL;
  v2 = *(_QWORD *)(a1 + 8);
  v3 = v2 >= 8;
  v4 = v2 - 8;
  if (!v3)
    return 0;
  v6 = **(_QWORD **)a1;
  *(_QWORD *)a1 += 8;
  *(_QWORD *)(a1 + 8) = v4;
  v7 = __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::vector<char>,void>::deserialize(a1, (unint64_t *)&__p);
  v8 = __p;
  if (!v7)
  {
    if (__p)
      operator delete(__p);
    return 0;
  }
  v9 = v14;
  *a2 = v6;
  v10 = (void *)a2[1];
  if (v10)
  {
    a2[2] = v10;
    v12 = v9;
    operator delete(v10);
    v9 = v12;
  }
  a2[1] = v8;
  *((_OWORD *)a2 + 1) = v9;
  return 1;
}

uint64_t __orc_rt::SPSSerializationTraits<__orc_rt::SPSSequence<char>,std::vector<char>,void>::deserialize(uint64_t a1, unint64_t *a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  size_t v7;
  unint64_t v8;
  char *v9;
  _BYTE *v10;
  char *v11;
  _BYTE *v12;
  char *v13;
  char v14;
  uint64_t i;
  uint64_t v16;
  char v17;
  unint64_t v18;
  _BYTE *v19;
  _BYTE *v20;
  unint64_t v21;
  _BYTE *v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  char *v26;
  char *v27;
  _BYTE *v28;
  _BYTE *v29;
  char v30;
  _BOOL8 v31;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = v2 >= 8;
  v4 = v2 - 8;
  if (!v3)
    return 0;
  v7 = **(_QWORD **)a1;
  *(_QWORD *)a1 += 8;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *a2;
  if (a2[2] - *a2 < v7)
  {
    if ((v7 & 0x8000000000000000) != 0)
LABEL_35:
      abort();
    v9 = (char *)a2[1];
    v10 = operator new(v7);
    v11 = &v9[(_QWORD)v10 - v8];
    v12 = v11;
    if (v9 != (char *)v8)
    {
      v13 = &v9[~v8];
      do
      {
        v14 = *--v9;
        (v13--)[(_QWORD)v10] = v14;
      }
      while (v9 != (char *)v8);
      v12 = v10;
    }
    *a2 = (unint64_t)v12;
    a2[1] = (unint64_t)v11;
    a2[2] = (unint64_t)&v10[v7];
    if (v8)
      operator delete((void *)v8);
  }
  if (!v7)
    return 1;
  for (i = 0; i != v7; ++i)
  {
    v16 = *(_QWORD *)(a1 + 8);
    v31 = v16 != 0;
    if (!v16)
      break;
    v17 = *(_BYTE *)(*(_QWORD *)a1)++;
    *(_QWORD *)(a1 + 8) = v16 - 1;
    v19 = (_BYTE *)a2[1];
    v18 = a2[2];
    if ((unint64_t)v19 >= v18)
    {
      v21 = *a2;
      v22 = &v19[-*a2];
      v23 = (unint64_t)(v22 + 1);
      if ((uint64_t)(v22 + 1) < 0)
        goto LABEL_35;
      v24 = v18 - v21;
      if (2 * v24 > v23)
        v23 = 2 * v24;
      if (v24 >= 0x3FFFFFFFFFFFFFFFLL)
        v25 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v25 = v23;
      if (v25)
        v26 = (char *)operator new(v25);
      else
        v26 = 0;
      v27 = &v22[(_QWORD)v26];
      v28 = &v22[(_QWORD)v26];
      *v28 = v17;
      v20 = v28 + 1;
      if (v19 != (_BYTE *)v21)
      {
        v29 = &v19[~v21];
        do
        {
          v30 = *--v19;
          (v29--)[(_QWORD)v26] = v30;
        }
        while (v19 != (_BYTE *)v21);
        v19 = (_BYTE *)*a2;
        v27 = v26;
      }
      *a2 = (unint64_t)v27;
      a2[1] = (unint64_t)v20;
      a2[2] = (unint64_t)&v26[v25];
      if (v19)
        operator delete(v19);
    }
    else
    {
      *v19 = v17;
      v20 = v19 + 1;
    }
    a2[1] = (unint64_t)v20;
  }
  return v31;
}

uint64_t std::__split_buffer<std::pair<__orc_rt::ExecutorAddr,std::vector<char>>>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != v3)
  {
    *(_QWORD *)(a1 + 16) = v2 - 32;
    v4 = *(void **)(v2 - 24);
    if (v4)
    {
      *(_QWORD *)(v2 - 16) = v4;
      operator delete(v4);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 32;
    }
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

uint64_t std::__throw_future_error[abi:nn180100]()
{
  std::__libcpp_verbose_abort("future_error was thrown in -fno-exceptions mode");
  return std::__split_buffer<std::unique_ptr<char []>>::~__split_buffer();
}

uint64_t std::__split_buffer<std::unique_ptr<char []>>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 8;
    v4 = *(_QWORD *)(i - 8);
    *(_QWORD *)(i - 8) = 0;
    if (v4)
      MEMORY[0x24BD1BEE4](v4, 0x1000C8077774924);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

BOOL std::equal_to<std::string>::operator()[abi:nn180100](unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  BOOL v12;
  BOOL v13;
  _BOOL8 v14;

  v2 = a1[23];
  if ((v2 & 0x80u) == 0)
    v3 = a1[23];
  else
    v3 = *((_QWORD *)a1 + 1);
  v4 = a2[23];
  v5 = (char)v4;
  if ((v4 & 0x80u) != 0)
    v4 = *((_QWORD *)a2 + 1);
  if (v3 != v4)
    return 0;
  if (v5 < 0)
    a2 = *(unsigned __int8 **)a2;
  if ((v2 & 0x80) != 0)
    return memcmp(*(const void **)a1, a2, *((_QWORD *)a1 + 1)) == 0;
  if (!a1[23])
    return 1;
  v6 = v2 - 1;
  do
  {
    v8 = *a1++;
    v7 = v8;
    v10 = *a2++;
    v9 = v10;
    v12 = v6-- != 0;
    v13 = v7 == v9;
    v14 = v7 == v9;
  }
  while (v13 && v12);
  return v14;
}

void *std::__hash_table<std::__hash_value_type<std::string,std::vector<char>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<char>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<char>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<char>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  int v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  void **v15;
  void *i;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  int8x8_t prime;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  uint8x8_t v31;
  unint64_t v32;
  uint8x8_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  unint64_t v39;
  void *v41;

  v7 = *(char *)(a2 + 23);
  if (v7 >= 0)
    v8 = (uint64_t *)a2;
  else
    v8 = *(uint64_t **)a2;
  if (v7 >= 0)
    v9 = *(unsigned __int8 *)(a2 + 23);
  else
    v9 = *(_QWORD *)(a2 + 8);
  v10 = std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:nn180100](v8, v9);
  v11 = v10;
  v12 = a1[1];
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      v3 = v10;
      if (v10 >= v12)
        v3 = v10 % v12;
    }
    else
    {
      v3 = (v12 - 1) & v10;
    }
    v15 = *(void ***)(*a1 + 8 * v3);
    if (v15)
    {
      for (i = *v15; i; i = *(void **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v11)
        {
          if (std::equal_to<std::string>::operator()[abi:nn180100]((unsigned __int8 *)i + 16, (unsigned __int8 *)a2))
            return i;
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12)
              v17 %= v12;
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v3)
            break;
        }
      }
    }
  }
  v18 = a1 + 2;
  i = operator new(0x40uLL);
  *(_QWORD *)i = 0;
  *((_QWORD *)i + 1) = v11;
  *((_OWORD *)i + 1) = *(_OWORD *)a3;
  v19 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *((_QWORD *)i + 4) = v19;
  *((_QWORD *)i + 5) = 0;
  *((_QWORD *)i + 6) = 0;
  *((_QWORD *)i + 7) = 0;
  v20 = (float)(unint64_t)(a1[3] + 1);
  v21 = *((float *)a1 + 8);
  if (!v12 || (float)(v21 * (float)v12) < v20)
  {
    v22 = 1;
    if (v12 >= 3)
      v22 = (v12 & (v12 - 1)) != 0;
    v23 = v22 | (2 * v12);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      prime = (int8x8_t)v24;
    else
      prime = (int8x8_t)v23;
    if (*(_QWORD *)&prime == 1)
    {
      prime = (int8x8_t)2;
    }
    else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
    {
      prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
    }
    v12 = a1[1];
    if (*(_QWORD *)&prime > v12)
      goto LABEL_36;
    if (*(_QWORD *)&prime < v12)
    {
      v32 = vcvtps_u32_f32((float)(unint64_t)a1[3] / *((float *)a1 + 8));
      if (v12 < 3 || (v33 = (uint8x8_t)vcnt_s8((int8x8_t)v12), v33.i16[0] = vaddlv_u8(v33), v33.u32[0] > 1uLL))
      {
        v32 = std::__next_prime(v32);
      }
      else
      {
        v34 = 1 << -(char)__clz(v32 - 1);
        if (v32 >= 2)
          v32 = v34;
      }
      if (*(_QWORD *)&prime <= v32)
        prime = (int8x8_t)v32;
      if (*(_QWORD *)&prime >= v12)
      {
        v12 = a1[1];
      }
      else
      {
        if (prime)
        {
LABEL_36:
          if (*(_QWORD *)&prime >> 61)
            std::__throw_bad_array_new_length[abi:nn180100]();
          v26 = operator new(8 * *(_QWORD *)&prime);
          v27 = (void *)*a1;
          *a1 = (uint64_t)v26;
          if (v27)
            operator delete(v27);
          v28 = 0;
          a1[1] = (uint64_t)prime;
          do
            *(_QWORD *)(*a1 + 8 * v28++) = 0;
          while (*(_QWORD *)&prime != v28);
          v29 = (_QWORD *)*v18;
          if (*v18)
          {
            v30 = v29[1];
            v31 = (uint8x8_t)vcnt_s8(prime);
            v31.i16[0] = vaddlv_u8(v31);
            if (v31.u32[0] > 1uLL)
            {
              if (v30 >= *(_QWORD *)&prime)
                v30 %= *(_QWORD *)&prime;
            }
            else
            {
              v30 &= *(_QWORD *)&prime - 1;
            }
            *(_QWORD *)(*a1 + 8 * v30) = v18;
            v35 = (_QWORD *)*v29;
            if (*v29)
            {
              do
              {
                v36 = v35[1];
                if (v31.u32[0] > 1uLL)
                {
                  if (v36 >= *(_QWORD *)&prime)
                    v36 %= *(_QWORD *)&prime;
                }
                else
                {
                  v36 &= *(_QWORD *)&prime - 1;
                }
                if (v36 != v30)
                {
                  if (!*(_QWORD *)(*a1 + 8 * v36))
                  {
                    *(_QWORD *)(*a1 + 8 * v36) = v29;
                    goto LABEL_61;
                  }
                  *v29 = *v35;
                  *v35 = **(_QWORD **)(*a1 + 8 * v36);
                  **(_QWORD **)(*a1 + 8 * v36) = v35;
                  v35 = v29;
                }
                v36 = v30;
LABEL_61:
                v29 = v35;
                v35 = (_QWORD *)*v35;
                v30 = v36;
              }
              while (v35);
            }
          }
          v12 = (unint64_t)prime;
          goto LABEL_65;
        }
        v41 = (void *)*a1;
        *a1 = 0;
        if (v41)
          operator delete(v41);
        v12 = 0;
        a1[1] = 0;
      }
    }
LABEL_65:
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v3 = v11 % v12;
      else
        v3 = v11;
    }
    else
    {
      v3 = (v12 - 1) & v11;
    }
  }
  v37 = *a1;
  v38 = *(_QWORD **)(*a1 + 8 * v3);
  if (v38)
  {
    *(_QWORD *)i = *v38;
LABEL_78:
    *v38 = i;
    goto LABEL_79;
  }
  *(_QWORD *)i = *v18;
  *v18 = i;
  *(_QWORD *)(v37 + 8 * v3) = v18;
  if (*(_QWORD *)i)
  {
    v39 = *(_QWORD *)(*(_QWORD *)i + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v39 >= v12)
        v39 %= v12;
    }
    else
    {
      v39 &= v12 - 1;
    }
    v38 = (_QWORD *)(*a1 + 8 * v39);
    goto LABEL_78;
  }
LABEL_79:
  ++a1[3];
  return i;
}

uint64_t _GLOBAL__sub_I_XOJITExecutor_cpp()
{
  uint64_t v0;

  qword_257967440 = (uint64_t)os_log_create("com.apple.XOJIT", "Instance");
  v0 = operator new();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 850045863;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_QWORD *)(v0 + 80) = 0;
  *(_QWORD *)(v0 + 88) = 1018212795;
  *(_QWORD *)v0 = &off_251C387F8;
  *(_QWORD *)(v0 + 8) = 0;
  *(_OWORD *)(v0 + 96) = 0u;
  *(_OWORD *)(v0 + 112) = 0u;
  *(_OWORD *)(v0 + 124) = 0u;
  qword_257967448 = v0;
}

uint64_t sub_24B2C2CD0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24B2C2CDC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24B2C2CE8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24B2C2CF4()
{
  return MEMORY[0x24BEE6488]();
}

uint64_t sub_24B2C2D00()
{
  return MEMORY[0x24BEE5358]();
}

uint64_t sub_24B2C2D0C()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_24B2C2D18()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_24B2C2D24()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_24B2C2D30()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_24B2C2D3C()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_24B2C2D48()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_24B2C2D54()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_24B2C2D60()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_24B2C2D6C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24B2C2D78()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_24B2C2D84()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_24B2C2D90()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_24B2C2D9C()
{
  return MEMORY[0x24BEE5658]();
}

uint64_t sub_24B2C2DA8()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_24B2C2DB4()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_24B2C2DC0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_24B2C2DCC()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_24B2C2DD8()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_24B2C2DE4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_24B2C2DF0()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_24B2C2DFC()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_24B2C2E08()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_24B2C2E14()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24B2C2E20()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_24B2C2E2C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_24B2C2E38()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_24B2C2E44()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_24B2C2E50()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_24B2C2E5C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_24B2C2E68()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_24B2C2E74()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_24B2C2E80()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24B2C2E8C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24B2C2E98()
{
  return MEMORY[0x24BEE4328]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

std::exception_ptr *__cdecl std::exception_ptr::exception_ptr(std::exception_ptr *this, const std::exception_ptr *a2)
{
  return (std::exception_ptr *)MEMORY[0x24BEDAB18](this, a2);
}

void std::exception_ptr::~exception_ptr(std::exception_ptr *this)
{
  MEMORY[0x24BEDAB20](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x24BEDAC08](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

void std::string::reserve(std::string *this, std::string::size_type __requested_capacity)
{
  MEMORY[0x24BEDACB8](this, __requested_capacity);
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
  MEMORY[0x24BEDACC8](this, __c);
}

std::future_error *__cdecl std::future_error::future_error(std::future_error *this, std::error_code __ec)
{
  return (std::future_error *)MEMORY[0x24BEDAD78](this, *(_QWORD *)&__ec.__val_, __ec.__cat_);
}

void std::__shared_count::~__shared_count(std::__shared_count *this)
{
  MEMORY[0x24BEDAFF8](this);
}

const std::error_category *std::future_category(void)
{
  return (const std::error_category *)MEMORY[0x24BEDB080]();
}

void std::__assoc_sub_state::__sub_wait(std::__assoc_sub_state *this, std::unique_lock<std::mutex> *__lk)
{
  MEMORY[0x24BEDB0C0](this, __lk);
}

void std::condition_variable::notify_all(std::condition_variable *this)
{
  MEMORY[0x24BEDB0F8](this);
}

void std::condition_variable::~condition_variable(std::condition_variable *this)
{
  MEMORY[0x24BEDB118](this);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x24BEDB1B8](__format);
}

void std::mutex::lock(std::mutex *this)
{
  MEMORY[0x24BEDB368](this);
}

void std::mutex::unlock(std::mutex *this)
{
  MEMORY[0x24BEDB370](this);
}

void std::mutex::~mutex(std::mutex *this)
{
  MEMORY[0x24BEDB380](this);
}

void std::rethrow_exception(std::exception_ptr a1)
{
  MEMORY[0x24BEDB6A8](a1.__ptr_);
}

uint64_t operator delete[]()
{
  return off_251C380D8();
}

void operator delete(void *__p)
{
  off_251C380E0(__p);
}

uint64_t operator delete()
{
  return off_251C380E8();
}

uint64_t operator new[]()
{
  return off_251C380F0();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_251C380F8(__sz);
}

uint64_t operator new()
{
  return off_251C38100();
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x24BDAC7B0](lpfunc, obj, lpdso_handle);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x24BDAEC88](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAEFC8](a1, a2, *(_QWORD *)&a3);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

uint64_t sandbox_check()
{
  return MEMORY[0x24BDAFBD8]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x24BDAFF00](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x24BDB0688](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

uint64_t xpc_mach_send_get_right()
{
  return MEMORY[0x24BDB0AA8]();
}

