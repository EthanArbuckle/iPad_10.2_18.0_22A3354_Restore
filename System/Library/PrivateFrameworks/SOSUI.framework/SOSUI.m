id _PositionAnimation(void *a1, double a2, float a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;

  v5 = (void *)MEMORY[0x24BDE56C0];
  v6 = a1;
  objc_msgSend(v5, "animation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValues:", v6);

  objc_msgSend(v7, "setKeyPath:", CFSTR("position"));
  objc_msgSend(v7, "setCalculationMode:", *MEMORY[0x24BDE5840]);
  objc_msgSend(v7, "setDuration:", a2);
  *(float *)&v8 = a3;
  objc_msgSend(v7, "setRepeatCount:", v8);
  return v7;
}

uint64_t sub_2454F4E60()
{
  uint64_t v0;

  v0 = sub_245513CF4();
  __swift_allocate_value_buffer(v0, qword_257483030);
  __swift_project_value_buffer(v0, (uint64_t)qword_257483030);
  return sub_245513CE8();
}

uint64_t sub_2454F4ED8()
{
  uint64_t v0;

  if (qword_25747F110 != -1)
    swift_once();
  v0 = sub_245513CF4();
  return __swift_project_value_buffer(v0, (uint64_t)qword_257483030);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
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

unint64_t sub_2454F4F98(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  id v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v8 = sub_245513CF4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v29 = a1;
  v13 = (void *)sub_245513D18();
  v14 = (unint64_t)objc_msgSend(v12, sel_BOOLForKey_, v13);

  v15 = sub_2454F4ED8();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v15, v8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v16 = sub_245513CDC();
  v17 = sub_245513DE4();
  if (os_log_type_enabled(v16, v17))
  {
    v27 = v14;
    v28 = v8;
    v18 = swift_slowAlloc();
    v26 = swift_slowAlloc();
    v31 = v26;
    *(_DWORD *)v18 = 136315906;
    swift_bridgeObjectRetain();
    v30 = sub_245503804(a3, a4, &v31);
    sub_245513E44();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2080;
    v19 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
    v20 = objc_msgSend(v19, sel_bundleIdentifier);

    if (v20)
    {
      v21 = sub_245513D24();
      v23 = v22;

    }
    else
    {
      v23 = 0x8000000245516600;
      v21 = 0xD000000000000011;
    }
    v30 = sub_245503804(v21, v23, &v31);
    sub_245513E44();
    swift_bridgeObjectRelease();
    *(_WORD *)(v18 + 22) = 2080;
    swift_bridgeObjectRetain();
    v30 = sub_245503804(v29, a2, &v31);
    sub_245513E44();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 32) = 1024;
    v14 = v27;
    LODWORD(v30) = v27;
    sub_245513E44();
    _os_log_impl(&dword_2454F2000, v16, v17, "using %s default from %s.%s: %{BOOL}d", (uint8_t *)v18, 0x26u);
    v24 = v26;
    swift_arrayDestroy();
    MEMORY[0x249536E80](v24, -1, -1);
    MEMORY[0x249536E80](v18, -1, -1);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v28);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v14;
}

uint64_t sub_2454F530C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v11;
  unint64_t v12;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747E4E0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_245513CC4();
  v5 = sub_245513CD0();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(a1, v4, v5);
  sub_245504434((uint64_t)v4, &qword_25747E4E0);
  v11 = 0;
  v12 = 0xE000000000000000;
  sub_245513E68();
  swift_bridgeObjectRelease();
  v11 = 0xD000000000000019;
  v12 = 0x8000000245516620;
  sub_245513D78();
  v7 = v11;
  v8 = v12;
  sub_245503E84();
  swift_allocError();
  *v9 = v7;
  v9[1] = v8;
  return swift_willThrow();
}

id SOSUIWebRTCView.state.getter()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_state);
  swift_beginAccess();
  return *v1;
}

void sub_2454F5550(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_state);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t sub_2454F55A0@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0xA0))();
  *a2 = result;
  return result;
}

void sub_2454F55E0(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_state);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t variable initialization expression of SOSUIWebRTCView.webView()
{
  return 0;
}

void *SOSUIWebRTCView.webView.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_2454F5738(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t sub_2454F5788@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0xB8))();
  *a2 = result;
  return result;
}

void sub_2454F57C8(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t variable initialization expression of SOSUIWebRTCView.delegate()
{
  return 0;
}

uint64_t SOSUIWebRTCView.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_delegate;
  swift_beginAccess();
  return MEMORY[0x249536EF8](v1);
}

uint64_t SOSUIWebRTCView.delegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*SOSUIWebRTCView.delegate.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x249536EF8](v5);
  return sub_2454F59D8;
}

void sub_2454F59D8(void **a1, char a2)
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

uint64_t variable initialization expression of SOSUIWebRTCView.rtcRPC()
{
  return 0;
}

unint64_t variable initialization expression of SOSUIWebRTCView.enableTrickleWhipKey()
{
  return 0xD000000000000016;
}

unint64_t variable initialization expression of SOSUIWebRTCView.webViewIsInspectableKey()
{
  return 0xD00000000000001FLL;
}

unint64_t variable initialization expression of SOSUIWebRTCView.enableDebugDataChannel()
{
  return 0xD00000000000001BLL;
}

unint64_t variable initialization expression of SOSUIWebRTCView.originUrlString()
{
  return 0xD000000000000017;
}

uint64_t variable initialization expression of SOSUIWebRTCView.blankUrlString()
{
  return 0x6C623A74756F6261;
}

id SOSUIWebRTCView.__allocating_init(frame:delegate:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return SOSUIWebRTCView.init(frame:delegate:)(a1, a2, a3, a4);
}

id SOSUIWebRTCView.init(frame:delegate:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  id v16;
  objc_super v18;

  *(_QWORD *)&v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC] = 0;
  v9 = &v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_enableTrickleWhipKey];
  *(_QWORD *)v9 = 0xD000000000000016;
  *((_QWORD *)v9 + 1) = 0x8000000245516640;
  v10 = &v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webViewIsInspectableKey];
  *(_QWORD *)v10 = 0xD00000000000001FLL;
  *((_QWORD *)v10 + 1) = 0x8000000245516660;
  v11 = &v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_enableDebugDataChannel];
  *(_QWORD *)v11 = 0xD00000000000001BLL;
  *((_QWORD *)v11 + 1) = 0x8000000245516680;
  v12 = &v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_originUrlString];
  *(_QWORD *)v12 = 0xD000000000000017;
  *((_QWORD *)v12 + 1) = 0x80000002455166A0;
  v13 = &v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_blankUrlString];
  *(_QWORD *)v13 = 0x6C623A74756F6261;
  *((_QWORD *)v13 + 1) = 0xEB000000006B6E61;
  v14 = &v4[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_onNavigationFinished];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  type metadata accessor for SOSUIWebRTCState();
  v15 = v4;
  *(_QWORD *)&v15[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_state] = SOSUIWebRTCState.__allocating_init()();

  v18.receiver = v15;
  v18.super_class = (Class)type metadata accessor for SOSUIWebRTCView();
  v16 = objc_msgSendSuper2(&v18, sel_initWithFrame_, a1, a2, a3, a4);
  sub_2454F61C4();
  swift_unknownObjectRelease();

  return v16;
}

uint64_t variable initialization expression of SOSUIWebRTCView.onNavigationFinished()
{
  return 0;
}

id SOSUIWebRTCView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SOSUIWebRTCView.init(coder:)(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  objc_super v14;

  *(_QWORD *)&v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC] = 0;
  v3 = &v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_enableTrickleWhipKey];
  *(_QWORD *)v3 = 0xD000000000000016;
  *((_QWORD *)v3 + 1) = 0x8000000245516640;
  v4 = &v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webViewIsInspectableKey];
  *(_QWORD *)v4 = 0xD00000000000001FLL;
  *((_QWORD *)v4 + 1) = 0x8000000245516660;
  v5 = &v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_enableDebugDataChannel];
  *(_QWORD *)v5 = 0xD00000000000001BLL;
  *((_QWORD *)v5 + 1) = 0x8000000245516680;
  v6 = &v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_originUrlString];
  *(_QWORD *)v6 = 0xD000000000000017;
  *((_QWORD *)v6 + 1) = 0x80000002455166A0;
  v7 = &v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_blankUrlString];
  *(_QWORD *)v7 = 0x6C623A74756F6261;
  *((_QWORD *)v7 + 1) = 0xEB000000006B6E61;
  v8 = &v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_onNavigationFinished];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  type metadata accessor for SOSUIWebRTCState();
  v9 = v1;
  *(_QWORD *)&v9[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_state] = SOSUIWebRTCState.__allocating_init()();

  v14.receiver = v9;
  v14.super_class = (Class)type metadata accessor for SOSUIWebRTCView();
  v10 = objc_msgSendSuper2(&v14, sel_initWithCoder_, a1);
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    sub_2454F61C4();

  }
  return v11;
}

id SOSUIWebRTCView.__deallocating_deinit()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id *v10;
  id result;
  id v12;
  id v13;
  objc_class *v14;
  uint64_t v15;
  objc_super v16;

  v1 = v0;
  v2 = sub_245513CF4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2454F4ED8();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_245513CDC();
  v8 = sub_245513DF0();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2454F2000, v7, v8, "SOSUIWebRTCView.deinit", v9, 2u);
    MEMORY[0x249536E80](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = (id *)&v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView];
  swift_beginAccess();
  result = *v10;
  if (*v10)
  {
    v12 = objc_msgSend(result, sel_configuration);
    v13 = objc_msgSend(v12, sel_userContentController);

    objc_msgSend(v13, sel_removeAllScriptMessageHandlers);
    v14 = (objc_class *)type metadata accessor for SOSUIWebRTCView();
    v16.receiver = v1;
    v16.super_class = v14;
    return objc_msgSendSuper2(&v16, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2454F61C4()
{
  char *v0;
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  void **v12;
  void *v13;
  id v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  os_log_type_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747E540);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_245513CF4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v27 - v9;
  v11 = sub_2454F78B8();
  v12 = (void **)&v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webView];
  swift_beginAccess();
  v13 = *v12;
  *v12 = v11;

  v14 = objc_msgSend((id)objc_opt_self(), sel_authorizationStatusForMediaType_, *MEMORY[0x24BDB1D50]);
  v15 = sub_2454F4ED8();
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  if (v14 == (id)3)
  {
    v16(v10, v15, v4);
    v17 = sub_245513CDC();
    v18 = sub_245513E14();
    if (!os_log_type_enabled(v17, v18))
    {
      v8 = v10;
      goto LABEL_8;
    }
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_2454F2000, v17, v18, "SOSUIWebRTCView: has camera permission", v19, 2u);
    v8 = v10;
    goto LABEL_6;
  }
  v16(v8, v15, v4);
  v17 = sub_245513CDC();
  v20 = sub_245513E14();
  if (os_log_type_enabled(v17, v20))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_2454F2000, v17, v20, "SOSUIWebRTCView: denied camera permission", v19, 2u);
LABEL_6:
    MEMORY[0x249536E80](v19, -1, -1);
  }
LABEL_8:

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v21 = sub_245513DD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v3, 1, 1, v21);
  sub_245513DC0();
  v22 = v1;
  v23 = sub_245513DB4();
  v24 = (_QWORD *)swift_allocObject();
  v25 = MEMORY[0x24BEE6930];
  v24[2] = v23;
  v24[3] = v25;
  v24[4] = v22;
  sub_2454F6568((uint64_t)v3, (uint64_t)&unk_25747EBA0, (uint64_t)v24);
  return swift_release();
}

uint64_t sub_2454F647C()
{
  _QWORD *v0;
  _QWORD *v1;

  v0[2] = sub_245513DC0();
  v0[3] = sub_245513DB4();
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = v1;
  *v1 = v0;
  v1[1] = sub_2454F64E0;
  return sub_2454F669C();
}

uint64_t sub_2454F64E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454F6568(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_245513DD8();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_245513DCC();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_245504434(a1, &qword_25747E540);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_245513D9C();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_2454F669C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[6] = v0;
  v2 = sub_245513CF4();
  v1[7] = v2;
  v1[8] = *(_QWORD *)(v2 - 8);
  v1[9] = swift_task_alloc();
  sub_245513DC0();
  v1[10] = sub_245513DB4();
  v1[11] = sub_245513D9C();
  v1[12] = v3;
  return swift_task_switch();
}

uint64_t sub_2454F6730()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD *v5;

  sub_2454F7D24();
  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v0 + 48)) + 0xB8))();
  if (result)
  {
    v2 = result;
    v3 = *(void **)(v0 + 48);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25747E788);
    v4 = v3;
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 104) = v5;
    *v5 = v0;
    v5[1] = sub_2454F6824;
    return sub_245510A14(v2, (uint64_t)v3, (uint64_t)&type metadata for SOSUIWebRTCMessage);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2454F6824(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 112) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 120) = a1;
  return swift_task_switch();
}

uint64_t sub_2454F6898()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  int *v8;
  _QWORD *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t);

  v1 = *(_QWORD *)(v0 + 48);
  v2 = OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC) = *(_QWORD *)(v0 + 120);

  v4 = *(void **)(v1 + v2);
  *(_QWORD *)(v0 + 128) = v4;
  if (v4)
  {
    type metadata accessor for SOSUIWebRTCView();
    sub_245504284();
    v5 = v4;
    v6 = sub_2455118B8();
    *(_QWORD *)(v0 + 136) = v6;
    v7 = sub_2455118C4();
    *(_QWORD *)(v0 + 144) = v7;
    v8 = *(int **)((*MEMORY[0x24BEE4EA0] & *v5) + 0xF8);
    v21 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t))((char *)v8 + *v8);
    v9 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v9;
    *v9 = v0;
    v9[1] = sub_2454F6AA4;
    return v21(v0 + 16, 0x74617453636E7973, 0xE900000000000065, v6, v7);
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 72);
    v12 = *(_QWORD *)(v0 + 56);
    v13 = *(_QWORD *)(v0 + 64);
    swift_release();
    v14 = sub_2454F4ED8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, v14, v12);
    v15 = sub_245513CDC();
    v16 = sub_245513DFC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_2454F2000, v15, v16, "SOSUIWebRTCView.sharedSetup: failed to initialize RPC", v17, 2u);
      MEMORY[0x249536E80](v17, -1, -1);
    }
    v19 = *(_QWORD *)(v0 + 64);
    v18 = *(_QWORD *)(v0 + 72);
    v20 = *(_QWORD *)(v0 + 56);

    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2454F6AA4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 160) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    sub_245504434(v2 + 16, &qword_25747E568);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_2454F6B34()
{
  uint64_t v0;
  _QWORD *v1;
  char v2;
  int *v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD);

  v1 = *(_QWORD **)(v0 + 48);
  v2 = sub_2454F4F98(*(_QWORD *)((char *)v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_enableDebugDataChannel), *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_enableDebugDataChannel + 8), 0xD000000000000012, 0x8000000245516B10);
  v3 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x250);
  v6 = (uint64_t (*)(_QWORD))((char *)v3 + *v3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 168) = v4;
  *v4 = v0;
  v4[1] = sub_2454F6BE0;
  return v6(v2 & 1);
}

uint64_t sub_2454F6BE0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2454F6C40()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 128);
  swift_release();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454F6C84()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454F6CC0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 128);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454F6D20()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 128);
  swift_release();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SOSUIWebRTCView.reset()()
{
  _QWORD *v0;
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void (*v21)(char *, uint64_t);
  id v22;
  _QWORD *v23;
  void *v24;
  uint64_t (*v25)(void);
  void *v26;
  void *v27;
  id v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  id v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  void (*v59)(char *, uint64_t, uint64_t);
  uint64_t v60;
  uint64_t v61;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747E540);
  MEMORY[0x24BDAC7A8](v2);
  v58 = (char *)&v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_245513C40();
  v54 = *(_QWORD *)(v4 - 8);
  v55 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v53 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_245513CD0();
  v56 = *(_QWORD *)(v6 - 8);
  v57 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v52 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v61 = (uint64_t)&v51 - v9;
  v10 = sub_245513CF4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v51 - v15;
  v17 = sub_2454F4ED8();
  v59 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v59(v16, v17, v10);
  v18 = sub_245513CDC();
  v19 = sub_245513DE4();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_2454F2000, v18, v19, "SOSUIWebRTCView.reset: resetting view", v20, 2u);
    MEMORY[0x249536E80](v20, -1, -1);
  }

  v21 = *(void (**)(char *, uint64_t))(v11 + 8);
  v21(v16, v10);
  type metadata accessor for SOSUIWebRTCState();
  v22 = SOSUIWebRTCState.__allocating_init()();
  v23 = (_QWORD *)MEMORY[0x24BEE4EA0];
  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x278))();

  v24 = *(void **)((char *)v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC);
  *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC) = 0;

  v25 = *(uint64_t (**)(void))((*v23 & *v1) + 0xB8);
  v26 = (void *)v25();
  if (!v26)
  {
    __break(1u);
    goto LABEL_11;
  }
  v27 = v26;
  v28 = objc_msgSend(v26, sel_configuration);

  v29 = objc_msgSend(v28, sel_userContentController);
  objc_msgSend(v29, sel_removeAllScriptMessageHandlers);

  v59(v14, v17, v10);
  v30 = sub_245513CDC();
  v31 = sub_245513DE4();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_2454F2000, v30, v31, "SOSUIWebRTCView.reset: unloading page", v32, 2u);
    MEMORY[0x249536E80](v32, -1, -1);
  }

  v21(v14, v10);
  v33 = v61;
  v34 = v60;
  v35 = sub_2454F530C(v61);
  if (!v34)
  {
    v36 = ((uint64_t (*)(uint64_t))v25)(v35);
    if (v36)
    {
      v37 = (void *)v36;
      v39 = v56;
      v38 = v57;
      (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v52, v33, v57);
      v40 = v53;
      sub_245513C28();
      v41 = (void *)sub_245513C10();
      (*(void (**)(char *, uint64_t))(v54 + 8))(v40, v55);
      v42 = objc_msgSend(v37, sel_loadRequest_, v41);

      v43 = sub_245513DD8();
      v44 = v33;
      v45 = (uint64_t)v58;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56))(v58, 1, 1, v43);
      sub_245513DC0();
      v46 = v1;
      v47 = v42;
      v48 = sub_245513DB4();
      v49 = (_QWORD *)swift_allocObject();
      v50 = MEMORY[0x24BEE6930];
      v49[2] = v48;
      v49[3] = v50;
      v49[4] = v46;
      v49[5] = v42;
      sub_2454F6568(v45, (uint64_t)&unk_25747E550, (uint64_t)v49);
      swift_release();

      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v44, v38);
      return;
    }
LABEL_11:
    __break(1u);
  }
}

uint64_t sub_2454F7218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5[2] = a4;
  v5[3] = a5;
  v6 = sub_245513CF4();
  v5[4] = v6;
  v5[5] = *(_QWORD *)(v6 - 8);
  v5[6] = swift_task_alloc();
  v5[7] = swift_task_alloc();
  v5[8] = swift_task_alloc();
  v5[9] = sub_245513DC0();
  v5[10] = sub_245513DB4();
  v5[11] = sub_245513D9C();
  v5[12] = v7;
  return swift_task_switch();
}

uint64_t sub_2454F72CC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  _QWORD *v16;

  v1 = v0[8];
  v2 = v0[4];
  v3 = v0[5];
  v4 = sub_2454F4ED8();
  v0[13] = v4;
  v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[14] = v5;
  v5(v1, v4, v2);
  v6 = sub_245513CDC();
  v7 = sub_245513DE4();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2454F2000, v6, v7, "SOSUIWebRTCView.reset: waiting for unload", v8, 2u);
    MEMORY[0x249536E80](v8, -1, -1);
  }
  v9 = v0[8];
  v10 = v0[4];
  v11 = v0[5];
  v13 = v0[2];
  v12 = v0[3];

  v14 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[15] = v14;
  v14(v9, v10);
  v0[16] = sub_245513DB4();
  v15 = swift_task_alloc();
  v0[17] = v15;
  *(_QWORD *)(v15 + 16) = v13;
  *(_QWORD *)(v15 + 24) = v12;
  v16 = (_QWORD *)swift_task_alloc();
  v0[18] = v16;
  *v16 = v0;
  v16[1] = sub_2454F7438;
  return sub_245513FE8();
}

uint64_t sub_2454F7438()
{
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2454F74A0()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 112))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 32));
  v1 = sub_245513CDC();
  v2 = sub_245513DE4();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2454F2000, v1, v2, "SOSUIWebRTCView.reset: sharedsetup", v3, 2u);
    MEMORY[0x249536E80](v3, -1, -1);
  }
  v4 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
  v5 = *(_QWORD *)(v0 + 56);
  v6 = *(_QWORD *)(v0 + 32);

  v4(v5, v6);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 152) = v7;
  *v7 = v0;
  v7[1] = sub_2454F7588;
  return sub_2454F669C();
}

uint64_t sub_2454F7588()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2454F75E8()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 112);
  v3 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 32);
  swift_release();
  v2(v3, v1, v4);
  v5 = sub_245513CDC();
  v6 = sub_245513DE4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2454F2000, v5, v6, "SOSUIWebRTCView.reset: after sharedsetup", v7, 2u);
    MEMORY[0x249536E80](v7, -1, -1);
  }
  v8 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
  v9 = *(_QWORD *)(v0 + 48);
  v10 = *(_QWORD *)(v0 + 32);

  v8(v9, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454F76EC()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454F7748(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void (**v11)(void *);
  uint64_t v12;
  id v13;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EB88);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a3;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v11 = (void (**)(void *))(a2 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_onNavigationFinished);
  v12 = *(_QWORD *)(a2 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_onNavigationFinished);
  *v11 = sub_245505860;
  v11[1] = (void (*)(void *))v10;
  v13 = a3;
  return sub_245503F0C(v12);
}

id sub_2454F78B8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  id v11;
  id result;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;

  v1 = v0;
  v2 = sub_245513CF4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2454F4ED8();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_245513CDC();
  v8 = sub_245513E14();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2454F2000, v7, v8, "SOSUIWebRTCView.createWebView: creating web view", v9, 2u);
    MEMORY[0x249536E80](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFA920]), sel_init);
  objc_msgSend(v10, sel_setAllowsInlineMediaPlayback_, 1);
  objc_msgSend(v10, sel_setMediaTypesRequiringUserActionForPlayback_, 0);
  v11 = objc_msgSend(v10, sel_preferences);
  objc_msgSend(v11, sel__setEnumeratingAllNetworkInterfacesEnabled_, 1);

  objc_msgSend(v10, sel__setCanShowWhileLocked_, 1);
  result = objc_msgSend(v10, sel_defaultWebpagePreferences);
  if (result)
  {
    v13 = result;
    objc_msgSend(result, sel_setLockdownModeEnabled_, 0);

    v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDFA918]), sel_initWithFrame_configuration_, v10, 0.0, 0.0, 0.0, 0.0);
    objc_msgSend(v14, sel_setUIDelegate_, v1);
    objc_msgSend(v14, sel_setNavigationDelegate_, v1);
    objc_msgSend(v14, sel_setInspectable_, sub_2454F4F98(*(_QWORD *)&v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webViewIsInspectableKey], *(_QWORD *)&v1[OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_webViewIsInspectableKey + 8], 0xD000000000000015, 0x8000000245516AF0) & 1);
    objc_msgSend(v1, sel_addSubview_, v14);
    objc_msgSend(v14, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v15 = objc_msgSend(v14, sel_leadingAnchor);
    v16 = objc_msgSend(v1, sel_leadingAnchor);
    v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

    objc_msgSend(v17, sel_setActive_, 1);
    v18 = objc_msgSend(v14, sel_trailingAnchor);
    v19 = objc_msgSend(v1, sel_trailingAnchor);
    v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

    objc_msgSend(v20, sel_setActive_, 1);
    v21 = objc_msgSend(v14, sel_topAnchor);
    v22 = objc_msgSend(v1, sel_topAnchor);
    v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v22);

    objc_msgSend(v23, sel_setActive_, 1);
    v24 = objc_msgSend(v14, sel_bottomAnchor);
    v25 = objc_msgSend(v1, sel_bottomAnchor);
    v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

    objc_msgSend(v26, sel_setActive_, 1);
    v27 = objc_msgSend(v14, sel_scrollView);
    objc_msgSend(v27, sel_setContentInsetAdjustmentBehavior_, 2);

    return v14;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2454F7D24()
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
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t ObjCClassFromMetadata;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void (*v19)(char *, char *, uint64_t);
  char *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void (*v29)(uint64_t, uint64_t);
  _QWORD v30[4];
  uint64_t v31;

  v0 = sub_245513D54();
  MEMORY[0x24BDAC7A8](v0);
  v30[1] = (char *)v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747E4E0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245513CD0();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v31 = (uint64_t)v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v30 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v30 - v12;
  type metadata accessor for SOSUIWebRTCView();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v15 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v16 = (void *)sub_245513D18();
  v17 = (void *)sub_245513D18();
  v18 = objc_msgSend(v15, sel_URLForResource_withExtension_, v16, v17);

  if (!v18)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_8;
  }
  sub_245513CB8();

  v19 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v19(v4, v11, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v20 = v13;
  v19(v13, v4, v5);
  v22 = v30[2];
  v21 = (_QWORD *)v30[3];
  v23 = sub_2454F530C(v31);
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v20, v5);

    return;
  }
  v24 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v21) + 0xB8))(v23);
  if (v24)
  {
    v25 = (void *)v24;
    sub_245513D48();
    sub_245513D0C();
    v26 = (void *)sub_245513D18();
    swift_bridgeObjectRelease();
    v27 = (void *)sub_245513CAC();
    v28 = objc_msgSend(v25, sel_loadHTMLString_baseURL_, v26, v27);

    v29 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
    v29(v31, v5);
    v29((uint64_t)v20, v5);
    return;
  }
LABEL_9:
  __break(1u);
}

uint64_t SOSUIWebRTCView.webView(_:requestMediaCapturePermissionFor:initiatedByFrame:type:decisionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  return a5(1);
}

Swift::Void __swiftcall SOSUIWebRTCView.webView(_:didFinish:)(WKWebView *_, WKNavigation_optional didFinish)
{
  uint64_t v2;
  void (*v3)(Class);
  Class isa;

  v3 = *(void (**)(Class))(v2 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_onNavigationFinished);
  if (v3)
  {
    isa = didFinish.value.super.isa;
    if (didFinish.value.super.isa)
    {
      swift_retain();
      v3(isa);
      sub_245503F0C((uint64_t)v3);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t SOSUIWebRTCView.webView(_:didReceive:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, _QWORD))
{
  _QWORD *v3;
  void *v6;
  uint64_t v7;

  v6 = (void *)(*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v3) + 0xD0))();
  if (v6)
  {
    v7 = (uint64_t)objc_msgSend(v6, sel_serverAuthenticationChallengeWithChallenge_, a2);
    swift_unknownObjectRelease();
  }
  else
  {
    v7 = 1;
  }
  return a3(v7, 0);
}

uint64_t SOSUIWebRTCView.webView(_:decidePolicyFor:decisionHandler:)(uint64_t a1, void *a2, void (*a3)(_QWORD))
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  char v29;
  uint64_t v30;
  void (*v31)(_QWORD);

  v31 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747E4E0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_245513C40();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_245513CD0();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v30 - v16;
  v18 = objc_msgSend(a2, sel_request);
  sub_245513C1C();

  sub_245513C34();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v6, 1, v11) == 1)
  {
    sub_245504434((uint64_t)v6, &qword_25747E4E0);
    return ((uint64_t (*)(_QWORD))v31)(0);
  }
  v20 = v31;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v6, v11);
  v21 = sub_245513CA0();
  v23 = v30;
  if (v21 == *(_QWORD *)(v30 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_originUrlString)
    && v22 == *(_QWORD *)(v30 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_originUrlString + 8))
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
    goto LABEL_12;
  }
  v25 = sub_245513FF4();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  if ((v25 & 1) != 0)
  {
LABEL_12:
    v27 = *(void (**)(char *, uint64_t))(v12 + 8);
    v27(v15, v11);
    goto LABEL_13;
  }
  if (sub_245513CA0() == *(_QWORD *)(v23 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_blankUrlString)
    && v26 == *(_QWORD *)(v23 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_blankUrlString + 8))
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v29 = sub_245513FF4();
  swift_bridgeObjectRelease();
  v27 = *(void (**)(char *, uint64_t))(v12 + 8);
  v27(v15, v11);
  if ((v29 & 1) == 0)
  {
    v28 = 0;
    goto LABEL_14;
  }
LABEL_13:
  v28 = 1;
LABEL_14:
  v20(v28);
  return ((uint64_t (*)(char *, uint64_t))v27)(v17, v11);
}

void sub_2454F86FC()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;

  v1 = v0;
  v2 = sub_245513CF4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v1, sel_window);

  if (!v6)
  {
    v7 = sub_2454F4ED8();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
    v8 = sub_245513CDC();
    v9 = sub_245513DFC();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2454F2000, v8, v9, "SOSUIWebRTCView.verifyAttachment: WKWebView must be attached to a window to function properly", v10, 2u);
      MEMORY[0x249536E80](v10, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

unint64_t sub_2454F881C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747EB78);
  v2 = sub_245513EBC();
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
    sub_24550579C(v6, (uint64_t)&v15, &qword_25747EB80);
    v7 = v15;
    v8 = v16;
    result = sub_245505384(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_245503FE8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_2454F8950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  v7 = sub_245513CF4();
  v6[9] = v7;
  v6[10] = *(_QWORD *)(v7 - 8);
  v6[11] = swift_task_alloc();
  sub_245513DC0();
  v6[12] = sub_245513DB4();
  v6[13] = sub_245513D9C();
  v6[14] = v8;
  return swift_task_switch();
}

uint64_t sub_2454F89EC()
{
  uint64_t v0;
  _QWORD *v1;
  int *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  _OWORD *v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;

  v1 = *(_QWORD **)(*(_QWORD *)(v0 + 64) + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_rtcRPC);
  *(_QWORD *)(v0 + 120) = v1;
  if (v1)
  {
    v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0xF8);
    v21 = (int *)((char *)v2 + *v2);
    v1;
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v3;
    *v3 = v0;
    v3[1] = sub_2454F8C64;
    return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v21)(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 88);
    v6 = *(_QWORD *)(v0 + 72);
    v7 = *(_QWORD *)(v0 + 80);
    swift_release();
    v8 = sub_2454F4ED8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v8, v6);
    swift_bridgeObjectRetain_n();
    v9 = sub_245513CDC();
    v10 = sub_245513DFC();
    v11 = os_log_type_enabled(v9, v10);
    v13 = *(_QWORD *)(v0 + 80);
    v12 = *(_QWORD *)(v0 + 88);
    v14 = *(_QWORD *)(v0 + 72);
    v15 = *(_QWORD *)(v0 + 40);
    if (v11)
    {
      v16 = *(_QWORD *)(v0 + 32);
      v22 = *(_QWORD *)(v0 + 72);
      v20 = *(_QWORD *)(v0 + 88);
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v23 = v18;
      *(_DWORD *)v17 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 16) = sub_245503804(v16, v15, &v23);
      sub_245513E44();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2454F2000, v9, v10, "SOSUIWebRTCView: RPC call %s made before RPC has been initialized", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249536E80](v18, -1, -1);
      MEMORY[0x249536E80](v17, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v20, v22);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    }
    v19 = *(_OWORD **)(v0 + 24);
    *v19 = 0u;
    v19[1] = 0u;
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2454F8C64()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2454F8CC4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 120);
  swift_release();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454F8D08()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 120);
  swift_release();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SOSUIWebRTCView.pauseVideo()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  sub_245513DC0();
  v1[7] = sub_245513DB4();
  v1[8] = sub_245513D9C();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_2454F8DB8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;

  v1 = MEMORY[0x24BEE4AF8];
  v2 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 80) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v3;
  *v3 = v0;
  v3[1] = sub_2454F8E4C;
  return sub_2454F8950(v0 + 16, 0x6469566573756170, 0xEA00000000006F65, v1, v2);
}

uint64_t sub_2454F8E4C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    sub_245504434(v2 + 16, &qword_25747E568);
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_2454F8ECC()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454F8F00()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454F905C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_245513DC0();
  v2[4] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454F90C8()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_245505A30;
  return SOSUIWebRTCView.pauseVideo()();
}

uint64_t SOSUIWebRTCView.pauseVideo(pausedString:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[17] = a2;
  v3[18] = v2;
  v3[16] = a1;
  sub_245513DC0();
  v3[19] = sub_245513DB4();
  v3[20] = sub_245513D9C();
  v3[21] = v4;
  return swift_task_switch();
}

uint64_t sub_2454F91A0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  unint64_t v5;
  _QWORD *v6;

  v1 = v0[16];
  v2 = v0[17];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747E578);
  v3 = swift_allocObject();
  v0[22] = v3;
  *(_OWORD *)(v3 + 16) = xmmword_2455149E0;
  strcpy((char *)(v3 + 32), "pausedString");
  *(_BYTE *)(v3 + 45) = 0;
  *(_WORD *)(v3 + 46) = -5120;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747E580);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2455149E0;
  strcpy((char *)(inited + 32), "pausedString");
  *(_BYTE *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v1;
  *(_QWORD *)(inited + 56) = v2;
  swift_bridgeObjectRetain();
  v5 = sub_2454F881C(inited);
  v0[23] = v5;
  v6 = (_QWORD *)swift_task_alloc();
  v0[24] = v6;
  *v6 = v0;
  v6[1] = sub_2454F92D0;
  return sub_2454F8950((uint64_t)(v0 + 12), 0x6469566573756170, 0xEA00000000006F65, v3, v5);
}

uint64_t sub_2454F92D0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 200) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    sub_245504434(v2 + 96, &qword_25747E568);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_2454F9360()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454F9394()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454F950C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_245513DC0();
  v3[5] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454F957C()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;

  v1 = (void *)v0[4];
  v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  v3 = sub_245513D24();
  v5 = v4;
  v0[7] = v4;
  v6 = v1;
  v7 = (_QWORD *)swift_task_alloc();
  v0[8] = v7;
  *v7 = v0;
  v7[1] = sub_2454F9610;
  return SOSUIWebRTCView.pauseVideo(pausedString:)(v3, v5);
}

uint64_t sub_2454F9610()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*v1 + 32);
  v3 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v3 + 48);
  if (v0)
  {
    v5 = (void *)sub_245513C94();

    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(v3 + 48), 0);
  }
  _Block_release(*(const void **)(v3 + 48));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t SOSUIWebRTCView.unpauseVideo()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  sub_245513DC0();
  v1[7] = sub_245513DB4();
  v1[8] = sub_245513D9C();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_2454F9724()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;

  sub_2454F86FC();
  v1 = MEMORY[0x24BEE4AF8];
  v2 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 80) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v3;
  *v3 = v0;
  v3[1] = sub_2454F97C4;
  return sub_2454F8950(v0 + 16, 0x5665737561706E75, 0xEC0000006F656469, v1, v2);
}

uint64_t sub_2454F97C4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    sub_245504434(v2 + 16, &qword_25747E568);
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_2454F9960(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_245513DC0();
  v2[4] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454F99CC()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_245505A30;
  return SOSUIWebRTCView.unpauseVideo()();
}

uint64_t SOSUIWebRTCView.useFrontCamera()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  sub_245513DC0();
  v1[7] = sub_245513DB4();
  v1[8] = sub_245513D9C();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_2454F9AA0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;

  sub_2454F86FC();
  v1 = MEMORY[0x24BEE4AF8];
  v2 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 80) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v3;
  *v3 = v0;
  v3[1] = sub_2454F97C4;
  return sub_2454F8950(v0 + 16, 0x746E6F7246657375, 0xEE006172656D6143, v1, v2);
}

uint64_t sub_2454F9C60(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_245513DC0();
  v2[4] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454F9CCC()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_245505A30;
  return SOSUIWebRTCView.useFrontCamera()();
}

uint64_t SOSUIWebRTCView.useRearCamera()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  sub_245513DC0();
  v1[7] = sub_245513DB4();
  v1[8] = sub_245513D9C();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_2454F9DA0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;

  sub_2454F86FC();
  v1 = MEMORY[0x24BEE4AF8];
  v2 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 80) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v3;
  *v3 = v0;
  v3[1] = sub_2454F97C4;
  return sub_2454F8950(v0 + 16, 0x4372616552657375, 0xED00006172656D61, v1, v2);
}

uint64_t sub_2454F9F60(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_245513DC0();
  v2[4] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454F9FCC()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_245505A30;
  return SOSUIWebRTCView.useRearCamera()();
}

uint64_t SOSUIWebRTCView.startVideoPreview()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  sub_245513DC0();
  v1[7] = sub_245513DB4();
  v1[8] = sub_245513D9C();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_2454FA0A0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;

  sub_2454F86FC();
  v1 = MEMORY[0x24BEE4AF8];
  v2 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 80) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v3;
  *v3 = v0;
  v3[1] = sub_2454F97C4;
  return sub_2454F8950(v0 + 16, 0xD000000000000011, 0x80000002455166C0, v1, v2);
}

uint64_t sub_2454FA258(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_245513DC0();
  v2[4] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FA2C4()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_245505A30;
  return SOSUIWebRTCView.startVideoPreview()();
}

uint64_t SOSUIWebRTCView.startVideoPreview(cameraFacing:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[16] = a1;
  v2[17] = v1;
  sub_245513DC0();
  v2[18] = sub_245513DB4();
  v2[19] = sub_245513D9C();
  v2[20] = v3;
  return swift_task_switch();
}

uint64_t sub_2454FA398()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  unint64_t v4;
  _QWORD *v5;

  v1 = v0[16];
  sub_2454F86FC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747E578);
  v2 = swift_allocObject();
  v0[21] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2455149E0;
  strcpy((char *)(v2 + 32), "cameraFacing");
  *(_BYTE *)(v2 + 45) = 0;
  *(_WORD *)(v2 + 46) = -5120;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747E580);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2455149E0;
  strcpy((char *)(inited + 32), "cameraFacing");
  *(_BYTE *)(inited + 45) = 0;
  *(_WORD *)(inited + 46) = -5120;
  *(_QWORD *)(inited + 72) = &type metadata for SOSUIWebRTCCameraFacing;
  *(_QWORD *)(inited + 48) = v1;
  v4 = sub_2454F881C(inited);
  v0[22] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[23] = v5;
  *v5 = v0;
  v5[1] = sub_2454FA4BC;
  return sub_2454F8950((uint64_t)(v0 + 12), 0xD000000000000011, 0x80000002455166C0, v2, v4);
}

uint64_t sub_2454FA4BC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 192) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    sub_245504434(v2 + 96, &qword_25747E568);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_2454FA678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_245513DC0();
  v3[5] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FA6E8()
{
  uint64_t *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[4];
  v2 = (const void *)v0[3];
  swift_release();
  v0[6] = (uint64_t)_Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[7] = (uint64_t)v4;
  *v4 = v0;
  v4[1] = sub_245505A34;
  return SOSUIWebRTCView.startVideoPreview(cameraFacing:)(v0[2]);
}

uint64_t SOSUIWebRTCView.startVideoStream(endpoint:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  int *v6;
  _QWORD *v7;
  int *v9;

  v3[2] = sub_245513DC0();
  v3[3] = sub_245513DB4();
  v6 = *(int **)((*MEMORY[0x24BEE4EA0] & *v2) + 0x1C0);
  v9 = (int *)((char *)v6 + *v6);
  v7 = (_QWORD *)swift_task_alloc();
  v3[4] = v7;
  *v7 = v3;
  v7[1] = sub_2454F64E0;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, unint64_t))v9)(a1, a2, 0, 0xE000000000000000);
}

uint64_t sub_2454FA934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  v3[5] = sub_245513DC0();
  v3[6] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FA9A8()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int *v7;
  _QWORD *v8;
  int *v10;

  v1 = (const void *)v0[3];
  v2 = (void *)v0[4];
  swift_release();
  v0[7] = _Block_copy(v1);
  v3 = sub_245513D24();
  v5 = v4;
  v0[8] = v4;
  v6 = v2;
  v0[9] = sub_245513DB4();
  v7 = *(int **)((*MEMORY[0x24BEE4EA0] & *v6) + 0x1C0);
  v10 = (int *)((char *)v7 + *v7);
  v8 = (_QWORD *)swift_task_alloc();
  v0[10] = v8;
  *v8 = v0;
  v8[1] = sub_2454FAA70;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, unint64_t))v10)(v3, v5, 0, 0xE000000000000000);
}

uint64_t sub_2454FAA70()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FAAF8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(void **)(v0 + 32);
  swift_release();

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);
  _Block_release(*(const void **)(v0 + 56));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454FAB5C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = *(void **)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(void **)(v0 + 32);
  swift_release();

  swift_bridgeObjectRelease();
  v4 = (void *)sub_245513C94();

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  _Block_release(*(const void **)(v0 + 56));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SOSUIWebRTCView.startVideoStream(endpoint:token:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  int *v10;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v5[2] = sub_245513DC0();
  v5[3] = sub_245513DB4();
  v10 = *(int **)((*MEMORY[0x24BEE4EA0] & *v4) + 0x1C8);
  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v10 + *v10);
  v11 = (_QWORD *)swift_task_alloc();
  v5[4] = v11;
  *v11 = v5;
  v11[1] = sub_2454FAC9C;
  return v13(a1, a2, a3, a4, 1);
}

uint64_t sub_2454FAC9C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = v0;
  swift_task_dealloc();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FAD24()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454FAD58()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454FAEC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = sub_245513DC0();
  v4[7] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FAF38()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  int *v10;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = (const void *)v0[4];
  v2 = (void *)v0[5];
  swift_release();
  v0[8] = _Block_copy(v1);
  v3 = sub_245513D24();
  v5 = v4;
  v0[9] = v4;
  v6 = sub_245513D24();
  v8 = v7;
  v0[10] = v7;
  v9 = v2;
  v0[11] = sub_245513DB4();
  v10 = *(int **)((*MEMORY[0x24BEE4EA0] & *v9) + 0x1C8);
  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))((char *)v10 + *v10);
  v11 = (_QWORD *)swift_task_alloc();
  v0[12] = v11;
  *v11 = v0;
  v11[1] = sub_2454FB020;
  return v13(v3, v5, v6, v8, 1);
}

uint64_t sub_2454FB020()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FB0A8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(void **)(v0 + 40);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);
  _Block_release(*(const void **)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454FB114()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = *(void **)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = *(void **)(v0 + 40);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_245513C94();

  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);
  _Block_release(*(const void **)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SOSUIWebRTCView.startVideoStream(endpoint:token:trickle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v6 + 248) = a4;
  *(_QWORD *)(v6 + 256) = v5;
  *(_BYTE *)(v6 + 320) = a5;
  *(_QWORD *)(v6 + 232) = a2;
  *(_QWORD *)(v6 + 240) = a3;
  *(_QWORD *)(v6 + 224) = a1;
  sub_245513DC0();
  *(_QWORD *)(v6 + 264) = sub_245513DB4();
  *(_QWORD *)(v6 + 272) = sub_245513D9C();
  *(_QWORD *)(v6 + 280) = v7;
  return swift_task_switch();
}

uint64_t sub_2454FB21C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v11 = *(_BYTE *)(v0 + 320);
  v1 = *(_QWORD *)(v0 + 248);
  v2 = *(_QWORD *)(v0 + 232);
  v9 = *(_QWORD *)(v0 + 224);
  v10 = *(_QWORD *)(v0 + 240);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747E578);
  v3 = swift_allocObject();
  *(_QWORD *)(v0 + 288) = v3;
  *(_OWORD *)(v3 + 16) = xmmword_2455149F0;
  *(_QWORD *)(v3 + 32) = 0x746E696F70646E65;
  *(_QWORD *)(v3 + 40) = 0xE800000000000000;
  *(_QWORD *)(v3 + 48) = 0x6E656B6F74;
  *(_QWORD *)(v3 + 56) = 0xE500000000000000;
  *(_QWORD *)(v3 + 64) = 0x656C6B63697274;
  *(_QWORD *)(v3 + 72) = 0xE700000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747E580);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2455149F0;
  *(_QWORD *)(inited + 32) = 0x746E696F70646E65;
  *(_QWORD *)(inited + 40) = 0xE800000000000000;
  v5 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v9;
  *(_QWORD *)(inited + 56) = v2;
  *(_QWORD *)(inited + 72) = v5;
  *(_QWORD *)(inited + 80) = 0x6E656B6F74;
  *(_QWORD *)(inited + 88) = 0xE500000000000000;
  *(_QWORD *)(inited + 96) = v10;
  *(_QWORD *)(inited + 104) = v1;
  *(_QWORD *)(inited + 120) = v5;
  *(_QWORD *)(inited + 128) = 0x656C6B63697274;
  *(_QWORD *)(inited + 136) = 0xE700000000000000;
  *(_QWORD *)(inited + 168) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 144) = v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v6 = sub_2454F881C(inited);
  *(_QWORD *)(v0 + 296) = v6;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 304) = v7;
  *v7 = v0;
  v7[1] = sub_2454FB3D0;
  return sub_2454F8950(v0 + 192, 0xD000000000000010, 0x80000002455166E0, v3, v6);
}

uint64_t sub_2454FB3D0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 312) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    sub_245504434(v2 + 192, &qword_25747E568);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_2454FB460()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454FB494()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454FB624(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 32) = a4;
  *(_QWORD *)(v5 + 40) = a5;
  *(_BYTE *)(v5 + 88) = a3;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  sub_245513DC0();
  *(_QWORD *)(v5 + 48) = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FB698()
{
  uint64_t v0;
  void *v1;
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;

  v1 = *(void **)(v0 + 40);
  v2 = *(const void **)(v0 + 32);
  swift_release();
  *(_QWORD *)(v0 + 56) = _Block_copy(v2);
  v3 = sub_245513D24();
  v5 = v4;
  *(_QWORD *)(v0 + 64) = v4;
  v6 = sub_245513D24();
  v8 = v7;
  *(_QWORD *)(v0 + 72) = v7;
  v9 = v1;
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v10;
  *v10 = v0;
  v10[1] = sub_2454FB758;
  return SOSUIWebRTCView.startVideoStream(endpoint:token:trickle:)(v3, v5, v6, v8, *(_BYTE *)(v0 + 88));
}

uint64_t sub_2454FB758()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*v1 + 40);
  v3 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v3 + 56);
  if (v0)
  {
    v5 = (void *)sub_245513C94();

    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(v3 + 56), 0);
  }
  _Block_release(*(const void **)(v3 + 56));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t SOSUIWebRTCView.endVideoStream()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  sub_245513DC0();
  v1[7] = sub_245513DB4();
  v1[8] = sub_245513D9C();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_2454FB880()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;

  v1 = MEMORY[0x24BEE4AF8];
  v2 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 80) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v3;
  *v3 = v0;
  v3[1] = sub_2454F97C4;
  return sub_2454F8950(v0 + 16, 0x6F65646956646E65, 0xEE006D6165727453, v1, v2);
}

uint64_t sub_2454FBA38(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_245513DC0();
  v2[4] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FBAA4()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_245505A30;
  return SOSUIWebRTCView.endVideoStream()();
}

uint64_t SOSUIWebRTCView.flipCamera()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  sub_245513DC0();
  v1[7] = sub_245513DB4();
  v1[8] = sub_245513D9C();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_2454FBB78()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;

  sub_2454F86FC();
  v1 = MEMORY[0x24BEE4AF8];
  v2 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 80) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v3;
  *v3 = v0;
  v3[1] = sub_2454F8E4C;
  return sub_2454F8950(v0 + 16, 0x656D614370696C66, 0xEA00000000006172, v1, v2);
}

uint64_t sub_2454FBD30(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_245513DC0();
  v2[4] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FBD9C()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_2454FBE04;
  return SOSUIWebRTCView.flipCamera()();
}

uint64_t sub_2454FBE04()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*v1 + 24);
  v3 = *v1;
  swift_task_dealloc();

  v4 = *(_QWORD *)(v3 + 40);
  if (v0)
  {
    v5 = (void *)sub_245513C94();

    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(v3 + 40), 0);
  }
  _Block_release(*(const void **)(v3 + 40));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t SOSUIWebRTCView.torchOn()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  sub_245513DC0();
  v1[7] = sub_245513DB4();
  v1[8] = sub_245513D9C();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_2454FBF10()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;

  sub_2454F86FC();
  v1 = MEMORY[0x24BEE4AF8];
  v2 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 80) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v3;
  *v3 = v0;
  v3[1] = sub_2454F97C4;
  return sub_2454F8950(v0 + 16, 0x6E4F6863726F74, 0xE700000000000000, v1, v2);
}

uint64_t sub_2454FC0C4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_245513DC0();
  v2[4] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FC130()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_245505A30;
  return SOSUIWebRTCView.torchOn()();
}

uint64_t SOSUIWebRTCView.torchOff()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  sub_245513DC0();
  v1[7] = sub_245513DB4();
  v1[8] = sub_245513D9C();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_2454FC204()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;

  sub_2454F86FC();
  v1 = MEMORY[0x24BEE4AF8];
  v2 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 80) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v3;
  *v3 = v0;
  v3[1] = sub_2454F97C4;
  return sub_2454F8950(v0 + 16, 0x66664F6863726F74, 0xE800000000000000, v1, v2);
}

uint64_t sub_2454FC3B8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_245513DC0();
  v2[4] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FC424()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_245505A30;
  return SOSUIWebRTCView.torchOff()();
}

uint64_t SOSUIWebRTCView.toggleTorch()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  sub_245513DC0();
  v1[7] = sub_245513DB4();
  v1[8] = sub_245513D9C();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_2454FC4F8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;

  sub_2454F86FC();
  v1 = MEMORY[0x24BEE4AF8];
  v2 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 80) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v3;
  *v3 = v0;
  v3[1] = sub_2454F97C4;
  return sub_2454F8950(v0 + 16, 0x6F54656C67676F74, 0xEB00000000686372, v1, v2);
}

uint64_t sub_2454FC6B4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_245513DC0();
  v2[4] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FC720()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_245505A30;
  return SOSUIWebRTCView.toggleTorch()();
}

uint64_t SOSUIWebRTCView.setZoomLevel(zoom:)(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 136) = v1;
  *(double *)(v2 + 128) = a1;
  sub_245513DC0();
  *(_QWORD *)(v2 + 144) = sub_245513DB4();
  *(_QWORD *)(v2 + 152) = sub_245513D9C();
  *(_QWORD *)(v2 + 160) = v3;
  return swift_task_switch();
}

uint64_t sub_2454FC7F8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  unint64_t v4;
  _QWORD *v5;

  v1 = v0[16];
  sub_2454F86FC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747E578);
  v2 = swift_allocObject();
  v0[21] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2455149E0;
  *(_QWORD *)(v2 + 32) = 1836019578;
  *(_QWORD *)(v2 + 40) = 0xE400000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747E580);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2455149E0;
  *(_QWORD *)(inited + 32) = 1836019578;
  *(_QWORD *)(inited + 40) = 0xE400000000000000;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE13C8];
  *(_QWORD *)(inited + 48) = v1;
  v4 = sub_2454F881C(inited);
  v0[22] = v4;
  v5 = (_QWORD *)swift_task_alloc();
  v0[23] = v5;
  *v5 = v0;
  v5[1] = sub_2454FC914;
  return sub_2454F8950((uint64_t)(v0 + 12), 0x4C6D6F6F5A746573, 0xEC0000006C657665, v2, v4);
}

uint64_t sub_2454FC914()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 192) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    sub_245504434(v2 + 96, &qword_25747E568);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_2454FC9A4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454FC9D8()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454FCB4C(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 24) = a1;
  *(_QWORD *)(v3 + 32) = a2;
  *(double *)(v3 + 16) = a3;
  sub_245513DC0();
  *(_QWORD *)(v3 + 40) = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FCBBC()
{
  uint64_t v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = *(void **)(v0 + 32);
  v2 = *(const void **)(v0 + 24);
  swift_release();
  *(_QWORD *)(v0 + 48) = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  *v4 = v0;
  v4[1] = sub_2454FCC28;
  return SOSUIWebRTCView.setZoomLevel(zoom:)(*(double *)(v0 + 16));
}

uint64_t sub_2454FCC28()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*v1 + 32);
  v3 = *v1;
  swift_task_dealloc();

  v4 = *(_QWORD *)(v3 + 48);
  if (v0)
  {
    v5 = (void *)sub_245513C94();

    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(v3 + 48), 0);
  }
  _Block_release(*(const void **)(v3 + 48));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t SOSUIWebRTCView.endVideoPreview()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  sub_245513DC0();
  v1[7] = sub_245513DB4();
  v1[8] = sub_245513D9C();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_2454FCD34()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;

  v1 = MEMORY[0x24BEE4AF8];
  v2 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 80) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v3;
  *v3 = v0;
  v3[1] = sub_2454F97C4;
  return sub_2454F8950(v0 + 16, 0x6F65646956646E65, 0xEF77656976657250, v1, v2);
}

uint64_t sub_2454FCEEC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_245513DC0();
  v2[4] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FCF58()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_245505A30;
  return SOSUIWebRTCView.endVideoPreview()();
}

uint64_t SOSUIWebRTCView.getCapabilities()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[15] = v0;
  sub_245513DC0();
  v1[16] = sub_245513DB4();
  v1[17] = sub_245513D9C();
  v1[18] = v2;
  return swift_task_switch();
}

uint64_t sub_2454FD02C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;

  v1 = MEMORY[0x24BEE4AF8];
  v2 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 152) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 160) = v3;
  *v3 = v0;
  v3[1] = sub_2454FD0C8;
  return sub_2454F8950(v0 + 16, 0x6261706143746567, 0xEF73656974696C69, v1, v2);
}

uint64_t sub_2454FD0C8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 168) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_2454FD134()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  id v3;
  uint64_t v4;

  swift_release();
  sub_24550579C(v0 + 16, v0 + 80, &qword_25747E568);
  if (*(_QWORD *)(v0 + 104))
  {
    sub_245503FE8((_OWORD *)(v0 + 80), (_OWORD *)(v0 + 48));
    v1 = type metadata accessor for SOSUIWebtRTCCapabilities();
    v2 = sub_245503FF8();
    sub_245512BAC(v1, v0 + 48, v1, v2, v0 + 112);
    v3 = *(id *)(v0 + 112);
    if (!v3)
      v3 = sub_24550A87C(0);
    __swift_destroy_boxed_opaque_existential_0(v0 + 48);
    v4 = v0 + 16;
  }
  else
  {
    sub_245504434(v0 + 80, &qword_25747E568);
    type metadata accessor for SOSUIWebtRTCCapabilities();
    v3 = sub_24550A87C(0);
    v4 = v0 + 16;
  }
  sub_245504434(v4, &qword_25747E568);
  return (*(uint64_t (**)(id))(v0 + 8))(v3);
}

uint64_t sub_2454FD244()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454FD3A0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_245513DC0();
  v2[4] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FD40C()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_2454FD474;
  return SOSUIWebRTCView.getCapabilities()();
}

uint64_t sub_2454FD474(void *a1)
{
  void *v1;
  uint64_t *v2;
  void *v3;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;

  v3 = v1;
  v5 = *(void **)(*v2 + 24);
  v6 = *v2;
  swift_task_dealloc();

  v7 = *(void (***)(_QWORD, _QWORD, _QWORD))(v6 + 40);
  if (v3)
  {
    v8 = (void *)sub_245513C94();

    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v8);
    _Block_release(v7);
  }
  else
  {
    ((void (**)(_QWORD, void *, _QWORD))v7)[2](v7, a1, 0);
    _Block_release(v7);

  }
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t SOSUIWebRTCView.configure(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[16] = a1;
  v2[17] = v1;
  sub_245513DC0();
  v2[18] = sub_245513DB4();
  v2[19] = sub_245513D9C();
  v2[20] = v3;
  return swift_task_switch();
}

uint64_t sub_2454FD59C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  unint64_t v12;
  _QWORD *v13;

  v1 = v0[16];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747E578);
  v2 = swift_allocObject();
  v0[21] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2455149E0;
  *(_QWORD *)(v2 + 32) = 0x736E6F6974706FLL;
  *(_QWORD *)(v2 + 40) = 0xE700000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747E580);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2455149E0;
  *(_QWORD *)(inited + 32) = 0x736E6F6974706FLL;
  *(_QWORD *)(inited + 40) = 0xE700000000000000;
  *(_QWORD *)(inited + 72) = &type metadata for SOSUIWebRTCConfiguration;
  v4 = swift_allocObject();
  *(_QWORD *)(inited + 48) = v4;
  v5 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v4 + 32) = v5;
  v6 = *(_OWORD *)(v1 + 80);
  v8 = *(_OWORD *)(v1 + 32);
  v7 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v4 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v4 + 96) = v6;
  *(_OWORD *)(v4 + 48) = v8;
  *(_OWORD *)(v4 + 64) = v7;
  v10 = *(_OWORD *)(v1 + 112);
  v9 = *(_OWORD *)(v1 + 128);
  v11 = *(_OWORD *)(v1 + 96);
  *(_BYTE *)(v4 + 160) = *(_BYTE *)(v1 + 144);
  *(_OWORD *)(v4 + 128) = v10;
  *(_OWORD *)(v4 + 144) = v9;
  *(_OWORD *)(v4 + 112) = v11;
  sub_245504084(v1);
  v12 = sub_2454F881C(inited);
  v0[22] = v12;
  v13 = (_QWORD *)swift_task_alloc();
  v0[23] = v13;
  *v13 = v0;
  v13[1] = sub_2454FC914;
  return sub_2454F8950((uint64_t)(v0 + 12), 0x72756769666E6F63, 0xE900000000000065, v2, v12);
}

uint64_t SOSUIWebRTCView.setPoorConnectionThreshold(_:)(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 328) = v1;
  *(double *)(v2 + 320) = a1;
  sub_245513DC0();
  *(_QWORD *)(v2 + 336) = sub_245513DB4();
  *(_QWORD *)(v2 + 344) = sub_245513D9C();
  *(_QWORD *)(v2 + 352) = v3;
  return swift_task_switch();
}

uint64_t sub_2454FD778()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD **)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 320);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_BYTE *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 112);
  v7 = *(_BYTE *)(v0 + 120);
  v8 = *(_QWORD *)(v0 + 96);
  v9 = *(_BYTE *)(v0 + 104);
  v10 = *(_QWORD *)(v0 + 80);
  v11 = *(_BYTE *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 64);
  v13 = *(_BYTE *)(v0 + 72);
  v14 = *(_QWORD *)(v0 + 48);
  v15 = *(_BYTE *)(v0 + 56);
  v16 = *(_QWORD *)(v0 + 32);
  v17 = *(_BYTE *)(v0 + 40);
  *(_BYTE *)(v0 + 400) = 0;
  *(_BYTE *)(v0 + 424) = v17;
  *(_BYTE *)(v0 + 376) = v15;
  *(_BYTE *)(v0 + 384) = v13;
  *(_BYTE *)(v0 + 392) = v11;
  *(_BYTE *)(v0 + 432) = v9;
  *(_BYTE *)(v0 + 408) = v7;
  *(_BYTE *)(v0 + 416) = v4;
  *(_QWORD *)(v0 + 168) = v2;
  *(_BYTE *)(v0 + 176) = 0;
  *(_QWORD *)(v0 + 184) = v16;
  *(_BYTE *)(v0 + 192) = v17;
  *(_QWORD *)(v0 + 200) = v14;
  *(_BYTE *)(v0 + 208) = v15;
  *(_QWORD *)(v0 + 216) = v12;
  *(_BYTE *)(v0 + 224) = v13;
  *(_QWORD *)(v0 + 232) = v10;
  *(_BYTE *)(v0 + 240) = v11;
  *(_QWORD *)(v0 + 248) = v8;
  *(_BYTE *)(v0 + 256) = v9;
  *(_QWORD *)(v0 + 264) = v6;
  *(_BYTE *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v5;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 416);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v19;
  *v19 = v0;
  v19[1] = sub_2454FD8C8;
  return v21(v0 + 168);
}

uint64_t sub_2454FD8C8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 368) = v0;
  swift_task_dealloc();
  if (!v0)
    sub_2455040AC(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_2454FDA60(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 328) = a1;
  *(_QWORD *)(v3 + 336) = a2;
  *(double *)(v3 + 320) = a3;
  *(_QWORD *)(v3 + 344) = sub_245513DC0();
  *(_QWORD *)(v3 + 352) = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FDAD4()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = (const void *)v0[41];
  v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  v3 = v2;
  v0[46] = sub_245513DB4();
  v0[47] = sub_245513D9C();
  v0[48] = v4;
  return swift_task_switch();
}

uint64_t sub_2454FDB54()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD **)(v0 + 336);
  v2 = *(_QWORD *)(v0 + 320);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_BYTE *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 112);
  v7 = *(_BYTE *)(v0 + 120);
  v8 = *(_QWORD *)(v0 + 96);
  v9 = *(_BYTE *)(v0 + 104);
  v10 = *(_QWORD *)(v0 + 80);
  v11 = *(_BYTE *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 64);
  v13 = *(_BYTE *)(v0 + 72);
  v14 = *(_QWORD *)(v0 + 48);
  v15 = *(_BYTE *)(v0 + 56);
  v16 = *(_QWORD *)(v0 + 32);
  v17 = *(_BYTE *)(v0 + 40);
  *(_BYTE *)(v0 + 432) = 0;
  *(_BYTE *)(v0 + 456) = v17;
  *(_BYTE *)(v0 + 408) = v15;
  *(_BYTE *)(v0 + 416) = v13;
  *(_BYTE *)(v0 + 424) = v11;
  *(_BYTE *)(v0 + 464) = v9;
  *(_BYTE *)(v0 + 440) = v7;
  *(_BYTE *)(v0 + 448) = v4;
  *(_QWORD *)(v0 + 168) = v2;
  *(_BYTE *)(v0 + 176) = 0;
  *(_QWORD *)(v0 + 184) = v16;
  *(_BYTE *)(v0 + 192) = v17;
  *(_QWORD *)(v0 + 200) = v14;
  *(_BYTE *)(v0 + 208) = v15;
  *(_QWORD *)(v0 + 216) = v12;
  *(_BYTE *)(v0 + 224) = v13;
  *(_QWORD *)(v0 + 232) = v10;
  *(_BYTE *)(v0 + 240) = v11;
  *(_QWORD *)(v0 + 248) = v8;
  *(_BYTE *)(v0 + 256) = v9;
  *(_QWORD *)(v0 + 264) = v6;
  *(_BYTE *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v5;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 448);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v19;
  *v19 = v0;
  v19[1] = sub_2454FDCA4;
  return v21(v0 + 168);
}

uint64_t sub_2454FDCA4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 400) = v0;
  swift_task_dealloc();
  if (!v0)
    sub_2455040AC(v2 + 16);
  return swift_task_switch();
}

uint64_t SOSUIWebRTCView.setPoorConnectionGracePeriod(_:)(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 328) = v1;
  *(double *)(v2 + 320) = a1;
  sub_245513DC0();
  *(_QWORD *)(v2 + 336) = sub_245513DB4();
  *(_QWORD *)(v2 + 344) = sub_245513D9C();
  *(_QWORD *)(v2 + 352) = v3;
  return swift_task_switch();
}

uint64_t sub_2454FDD80()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD **)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 320);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_BYTE *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 112);
  v7 = *(_BYTE *)(v0 + 120);
  v8 = *(_QWORD *)(v0 + 96);
  v9 = *(_BYTE *)(v0 + 104);
  v10 = *(_QWORD *)(v0 + 80);
  v11 = *(_BYTE *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 64);
  v13 = *(_BYTE *)(v0 + 72);
  v14 = *(_QWORD *)(v0 + 48);
  v15 = *(_BYTE *)(v0 + 56);
  v16 = *(_QWORD *)(v0 + 16);
  v17 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 400) = v17;
  *(_BYTE *)(v0 + 424) = 0;
  *(_BYTE *)(v0 + 376) = v15;
  *(_BYTE *)(v0 + 384) = v13;
  *(_BYTE *)(v0 + 392) = v11;
  *(_BYTE *)(v0 + 432) = v9;
  *(_BYTE *)(v0 + 408) = v7;
  *(_BYTE *)(v0 + 416) = v4;
  *(_QWORD *)(v0 + 168) = v16;
  *(_BYTE *)(v0 + 176) = v17;
  *(_QWORD *)(v0 + 184) = v2;
  *(_BYTE *)(v0 + 192) = 0;
  *(_QWORD *)(v0 + 200) = v14;
  *(_BYTE *)(v0 + 208) = v15;
  *(_QWORD *)(v0 + 216) = v12;
  *(_BYTE *)(v0 + 224) = v13;
  *(_QWORD *)(v0 + 232) = v10;
  *(_BYTE *)(v0 + 240) = v11;
  *(_QWORD *)(v0 + 248) = v8;
  *(_BYTE *)(v0 + 256) = v9;
  *(_QWORD *)(v0 + 264) = v6;
  *(_BYTE *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v5;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 416);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v19;
  *v19 = v0;
  v19[1] = sub_2454FD8C8;
  return v21(v0 + 168);
}

uint64_t sub_2454FDFFC(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 328) = a1;
  *(_QWORD *)(v3 + 336) = a2;
  *(double *)(v3 + 320) = a3;
  *(_QWORD *)(v3 + 344) = sub_245513DC0();
  *(_QWORD *)(v3 + 352) = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FE070()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = (const void *)v0[41];
  v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  v3 = v2;
  v0[46] = sub_245513DB4();
  v0[47] = sub_245513D9C();
  v0[48] = v4;
  return swift_task_switch();
}

uint64_t sub_2454FE0F0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD **)(v0 + 336);
  v2 = *(_QWORD *)(v0 + 320);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_BYTE *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 112);
  v7 = *(_BYTE *)(v0 + 120);
  v8 = *(_QWORD *)(v0 + 96);
  v9 = *(_BYTE *)(v0 + 104);
  v10 = *(_QWORD *)(v0 + 80);
  v11 = *(_BYTE *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 64);
  v13 = *(_BYTE *)(v0 + 72);
  v14 = *(_QWORD *)(v0 + 48);
  v15 = *(_BYTE *)(v0 + 56);
  v16 = *(_QWORD *)(v0 + 16);
  v17 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 432) = v17;
  *(_BYTE *)(v0 + 456) = 0;
  *(_BYTE *)(v0 + 408) = v15;
  *(_BYTE *)(v0 + 416) = v13;
  *(_BYTE *)(v0 + 424) = v11;
  *(_BYTE *)(v0 + 464) = v9;
  *(_BYTE *)(v0 + 440) = v7;
  *(_BYTE *)(v0 + 448) = v4;
  *(_QWORD *)(v0 + 168) = v16;
  *(_BYTE *)(v0 + 176) = v17;
  *(_QWORD *)(v0 + 184) = v2;
  *(_BYTE *)(v0 + 192) = 0;
  *(_QWORD *)(v0 + 200) = v14;
  *(_BYTE *)(v0 + 208) = v15;
  *(_QWORD *)(v0 + 216) = v12;
  *(_BYTE *)(v0 + 224) = v13;
  *(_QWORD *)(v0 + 232) = v10;
  *(_BYTE *)(v0 + 240) = v11;
  *(_QWORD *)(v0 + 248) = v8;
  *(_BYTE *)(v0 + 256) = v9;
  *(_QWORD *)(v0 + 264) = v6;
  *(_BYTE *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v5;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 448);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v19;
  *v19 = v0;
  v19[1] = sub_2454FDCA4;
  return v21(v0 + 168);
}

uint64_t SOSUIWebRTCView.setIceRestartTimeout(_:)(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 328) = v1;
  *(double *)(v2 + 320) = a1;
  sub_245513DC0();
  *(_QWORD *)(v2 + 336) = sub_245513DB4();
  *(_QWORD *)(v2 + 344) = sub_245513D9C();
  *(_QWORD *)(v2 + 352) = v3;
  return swift_task_switch();
}

uint64_t sub_2454FE2B0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD **)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 320);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_BYTE *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 112);
  v7 = *(_BYTE *)(v0 + 120);
  v8 = *(_QWORD *)(v0 + 96);
  v9 = *(_BYTE *)(v0 + 104);
  v10 = *(_QWORD *)(v0 + 80);
  v11 = *(_BYTE *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 64);
  v13 = *(_BYTE *)(v0 + 72);
  v14 = *(_QWORD *)(v0 + 32);
  v15 = *(_BYTE *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 16);
  v17 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 400) = v17;
  *(_BYTE *)(v0 + 424) = v15;
  *(_BYTE *)(v0 + 376) = 0;
  *(_BYTE *)(v0 + 384) = v13;
  *(_BYTE *)(v0 + 392) = v11;
  *(_BYTE *)(v0 + 432) = v9;
  *(_BYTE *)(v0 + 408) = v7;
  *(_BYTE *)(v0 + 416) = v4;
  *(_QWORD *)(v0 + 168) = v16;
  *(_BYTE *)(v0 + 176) = v17;
  *(_QWORD *)(v0 + 184) = v14;
  *(_BYTE *)(v0 + 192) = v15;
  *(_QWORD *)(v0 + 200) = v2;
  *(_BYTE *)(v0 + 208) = 0;
  *(_QWORD *)(v0 + 216) = v12;
  *(_BYTE *)(v0 + 224) = v13;
  *(_QWORD *)(v0 + 232) = v10;
  *(_BYTE *)(v0 + 240) = v11;
  *(_QWORD *)(v0 + 248) = v8;
  *(_BYTE *)(v0 + 256) = v9;
  *(_QWORD *)(v0 + 264) = v6;
  *(_BYTE *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v5;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 416);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v19;
  *v19 = v0;
  v19[1] = sub_2454FD8C8;
  return v21(v0 + 168);
}

uint64_t sub_2454FE52C(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 328) = a1;
  *(_QWORD *)(v3 + 336) = a2;
  *(double *)(v3 + 320) = a3;
  *(_QWORD *)(v3 + 344) = sub_245513DC0();
  *(_QWORD *)(v3 + 352) = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FE5A0()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = (const void *)v0[41];
  v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  v3 = v2;
  v0[46] = sub_245513DB4();
  v0[47] = sub_245513D9C();
  v0[48] = v4;
  return swift_task_switch();
}

uint64_t sub_2454FE620()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD **)(v0 + 336);
  v2 = *(_QWORD *)(v0 + 320);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_BYTE *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 112);
  v7 = *(_BYTE *)(v0 + 120);
  v8 = *(_QWORD *)(v0 + 96);
  v9 = *(_BYTE *)(v0 + 104);
  v10 = *(_QWORD *)(v0 + 80);
  v11 = *(_BYTE *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 64);
  v13 = *(_BYTE *)(v0 + 72);
  v14 = *(_QWORD *)(v0 + 32);
  v15 = *(_BYTE *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 16);
  v17 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 432) = v17;
  *(_BYTE *)(v0 + 456) = v15;
  *(_BYTE *)(v0 + 408) = 0;
  *(_BYTE *)(v0 + 416) = v13;
  *(_BYTE *)(v0 + 424) = v11;
  *(_BYTE *)(v0 + 464) = v9;
  *(_BYTE *)(v0 + 440) = v7;
  *(_BYTE *)(v0 + 448) = v4;
  *(_QWORD *)(v0 + 168) = v16;
  *(_BYTE *)(v0 + 176) = v17;
  *(_QWORD *)(v0 + 184) = v14;
  *(_BYTE *)(v0 + 192) = v15;
  *(_QWORD *)(v0 + 200) = v2;
  *(_BYTE *)(v0 + 208) = 0;
  *(_QWORD *)(v0 + 216) = v12;
  *(_BYTE *)(v0 + 224) = v13;
  *(_QWORD *)(v0 + 232) = v10;
  *(_BYTE *)(v0 + 240) = v11;
  *(_QWORD *)(v0 + 248) = v8;
  *(_BYTE *)(v0 + 256) = v9;
  *(_QWORD *)(v0 + 264) = v6;
  *(_BYTE *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v5;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 448);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v19;
  *v19 = v0;
  v19[1] = sub_2454FDCA4;
  return v21(v0 + 168);
}

uint64_t SOSUIWebRTCView.setIceRestartRetryCount(_:)(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 328) = v1;
  *(double *)(v2 + 320) = a1;
  sub_245513DC0();
  *(_QWORD *)(v2 + 336) = sub_245513DB4();
  *(_QWORD *)(v2 + 344) = sub_245513D9C();
  *(_QWORD *)(v2 + 352) = v3;
  return swift_task_switch();
}

uint64_t sub_2454FE7E0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD **)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 320);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_BYTE *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 112);
  v7 = *(_BYTE *)(v0 + 120);
  v8 = *(_QWORD *)(v0 + 96);
  v9 = *(_BYTE *)(v0 + 104);
  v10 = *(_QWORD *)(v0 + 80);
  v11 = *(_BYTE *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 48);
  v13 = *(_BYTE *)(v0 + 56);
  v14 = *(_QWORD *)(v0 + 32);
  v15 = *(_BYTE *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 16);
  v17 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 400) = v17;
  *(_BYTE *)(v0 + 424) = v15;
  *(_BYTE *)(v0 + 376) = v13;
  *(_BYTE *)(v0 + 384) = 0;
  *(_BYTE *)(v0 + 392) = v11;
  *(_BYTE *)(v0 + 432) = v9;
  *(_BYTE *)(v0 + 408) = v7;
  *(_BYTE *)(v0 + 416) = v4;
  *(_QWORD *)(v0 + 168) = v16;
  *(_BYTE *)(v0 + 176) = v17;
  *(_QWORD *)(v0 + 184) = v14;
  *(_BYTE *)(v0 + 192) = v15;
  *(_QWORD *)(v0 + 200) = v12;
  *(_BYTE *)(v0 + 208) = v13;
  *(_QWORD *)(v0 + 216) = v2;
  *(_BYTE *)(v0 + 224) = 0;
  *(_QWORD *)(v0 + 232) = v10;
  *(_BYTE *)(v0 + 240) = v11;
  *(_QWORD *)(v0 + 248) = v8;
  *(_BYTE *)(v0 + 256) = v9;
  *(_QWORD *)(v0 + 264) = v6;
  *(_BYTE *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v5;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 416);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v19;
  *v19 = v0;
  v19[1] = sub_2454FD8C8;
  return v21(v0 + 168);
}

uint64_t sub_2454FEA5C(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 328) = a1;
  *(_QWORD *)(v3 + 336) = a2;
  *(double *)(v3 + 320) = a3;
  *(_QWORD *)(v3 + 344) = sub_245513DC0();
  *(_QWORD *)(v3 + 352) = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FEAD0()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = (const void *)v0[41];
  v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  v3 = v2;
  v0[46] = sub_245513DB4();
  v0[47] = sub_245513D9C();
  v0[48] = v4;
  return swift_task_switch();
}

uint64_t sub_2454FEB50()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD **)(v0 + 336);
  v2 = *(_QWORD *)(v0 + 320);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_BYTE *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 112);
  v7 = *(_BYTE *)(v0 + 120);
  v8 = *(_QWORD *)(v0 + 96);
  v9 = *(_BYTE *)(v0 + 104);
  v10 = *(_QWORD *)(v0 + 80);
  v11 = *(_BYTE *)(v0 + 88);
  v12 = *(_QWORD *)(v0 + 48);
  v13 = *(_BYTE *)(v0 + 56);
  v14 = *(_QWORD *)(v0 + 32);
  v15 = *(_BYTE *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 16);
  v17 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 432) = v17;
  *(_BYTE *)(v0 + 456) = v15;
  *(_BYTE *)(v0 + 408) = v13;
  *(_BYTE *)(v0 + 416) = 0;
  *(_BYTE *)(v0 + 424) = v11;
  *(_BYTE *)(v0 + 464) = v9;
  *(_BYTE *)(v0 + 440) = v7;
  *(_BYTE *)(v0 + 448) = v4;
  *(_QWORD *)(v0 + 168) = v16;
  *(_BYTE *)(v0 + 176) = v17;
  *(_QWORD *)(v0 + 184) = v14;
  *(_BYTE *)(v0 + 192) = v15;
  *(_QWORD *)(v0 + 200) = v12;
  *(_BYTE *)(v0 + 208) = v13;
  *(_QWORD *)(v0 + 216) = v2;
  *(_BYTE *)(v0 + 224) = 0;
  *(_QWORD *)(v0 + 232) = v10;
  *(_BYTE *)(v0 + 240) = v11;
  *(_QWORD *)(v0 + 248) = v8;
  *(_BYTE *)(v0 + 256) = v9;
  *(_QWORD *)(v0 + 264) = v6;
  *(_BYTE *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v5;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 448);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v19;
  *v19 = v0;
  v19[1] = sub_2454FDCA4;
  return v21(v0 + 168);
}

uint64_t SOSUIWebRTCView.setMinimumBitrate(_:)(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 328) = v1;
  *(double *)(v2 + 320) = a1;
  sub_245513DC0();
  *(_QWORD *)(v2 + 336) = sub_245513DB4();
  *(_QWORD *)(v2 + 344) = sub_245513D9C();
  *(_QWORD *)(v2 + 352) = v3;
  return swift_task_switch();
}

uint64_t sub_2454FED10()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD **)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 320);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_BYTE *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 112);
  v7 = *(_BYTE *)(v0 + 120);
  v8 = *(_QWORD *)(v0 + 96);
  v9 = *(_BYTE *)(v0 + 104);
  v10 = *(_QWORD *)(v0 + 64);
  v11 = *(_BYTE *)(v0 + 72);
  v12 = *(_QWORD *)(v0 + 48);
  v13 = *(_BYTE *)(v0 + 56);
  v14 = *(_QWORD *)(v0 + 32);
  v15 = *(_BYTE *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 16);
  v17 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 400) = v17;
  *(_BYTE *)(v0 + 424) = v15;
  *(_BYTE *)(v0 + 376) = v13;
  *(_BYTE *)(v0 + 384) = v11;
  *(_BYTE *)(v0 + 392) = 0;
  *(_BYTE *)(v0 + 432) = v9;
  *(_BYTE *)(v0 + 408) = v7;
  *(_BYTE *)(v0 + 416) = v4;
  *(_QWORD *)(v0 + 168) = v16;
  *(_BYTE *)(v0 + 176) = v17;
  *(_QWORD *)(v0 + 184) = v14;
  *(_BYTE *)(v0 + 192) = v15;
  *(_QWORD *)(v0 + 200) = v12;
  *(_BYTE *)(v0 + 208) = v13;
  *(_QWORD *)(v0 + 216) = v10;
  *(_BYTE *)(v0 + 224) = v11;
  *(_QWORD *)(v0 + 232) = v2;
  *(_BYTE *)(v0 + 240) = 0;
  *(_QWORD *)(v0 + 248) = v8;
  *(_BYTE *)(v0 + 256) = v9;
  *(_QWORD *)(v0 + 264) = v6;
  *(_BYTE *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v5;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 416);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v19;
  *v19 = v0;
  v19[1] = sub_2454FD8C8;
  return v21(v0 + 168);
}

uint64_t sub_2454FEF8C(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 328) = a1;
  *(_QWORD *)(v3 + 336) = a2;
  *(double *)(v3 + 320) = a3;
  *(_QWORD *)(v3 + 344) = sub_245513DC0();
  *(_QWORD *)(v3 + 352) = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FF000()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = (const void *)v0[41];
  v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  v3 = v2;
  v0[46] = sub_245513DB4();
  v0[47] = sub_245513D9C();
  v0[48] = v4;
  return swift_task_switch();
}

uint64_t sub_2454FF080()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD **)(v0 + 336);
  v2 = *(_QWORD *)(v0 + 320);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_BYTE *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 112);
  v7 = *(_BYTE *)(v0 + 120);
  v8 = *(_QWORD *)(v0 + 96);
  v9 = *(_BYTE *)(v0 + 104);
  v10 = *(_QWORD *)(v0 + 64);
  v11 = *(_BYTE *)(v0 + 72);
  v12 = *(_QWORD *)(v0 + 48);
  v13 = *(_BYTE *)(v0 + 56);
  v14 = *(_QWORD *)(v0 + 32);
  v15 = *(_BYTE *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 16);
  v17 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 432) = v17;
  *(_BYTE *)(v0 + 456) = v15;
  *(_BYTE *)(v0 + 408) = v13;
  *(_BYTE *)(v0 + 416) = v11;
  *(_BYTE *)(v0 + 424) = 0;
  *(_BYTE *)(v0 + 464) = v9;
  *(_BYTE *)(v0 + 440) = v7;
  *(_BYTE *)(v0 + 448) = v4;
  *(_QWORD *)(v0 + 168) = v16;
  *(_BYTE *)(v0 + 176) = v17;
  *(_QWORD *)(v0 + 184) = v14;
  *(_BYTE *)(v0 + 192) = v15;
  *(_QWORD *)(v0 + 200) = v12;
  *(_BYTE *)(v0 + 208) = v13;
  *(_QWORD *)(v0 + 216) = v10;
  *(_BYTE *)(v0 + 224) = v11;
  *(_QWORD *)(v0 + 232) = v2;
  *(_BYTE *)(v0 + 240) = 0;
  *(_QWORD *)(v0 + 248) = v8;
  *(_BYTE *)(v0 + 256) = v9;
  *(_QWORD *)(v0 + 264) = v6;
  *(_BYTE *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v5;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 448);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v19;
  *v19 = v0;
  v19[1] = sub_2454FDCA4;
  return v21(v0 + 168);
}

uint64_t SOSUIWebRTCView.setMaximumBitrate(_:)(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 328) = v1;
  *(double *)(v2 + 320) = a1;
  sub_245513DC0();
  *(_QWORD *)(v2 + 336) = sub_245513DB4();
  *(_QWORD *)(v2 + 344) = sub_245513D9C();
  *(_QWORD *)(v2 + 352) = v3;
  return swift_task_switch();
}

uint64_t sub_2454FF240()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD **)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 320);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_BYTE *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 112);
  v7 = *(_BYTE *)(v0 + 120);
  v8 = *(_QWORD *)(v0 + 80);
  v9 = *(_BYTE *)(v0 + 88);
  v10 = *(_QWORD *)(v0 + 64);
  v11 = *(_BYTE *)(v0 + 72);
  v12 = *(_QWORD *)(v0 + 48);
  v13 = *(_BYTE *)(v0 + 56);
  v14 = *(_QWORD *)(v0 + 32);
  v15 = *(_BYTE *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 16);
  v17 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 400) = v17;
  *(_BYTE *)(v0 + 424) = v15;
  *(_BYTE *)(v0 + 376) = v13;
  *(_BYTE *)(v0 + 384) = v11;
  *(_BYTE *)(v0 + 392) = v9;
  *(_BYTE *)(v0 + 432) = 0;
  *(_BYTE *)(v0 + 408) = v7;
  *(_BYTE *)(v0 + 416) = v4;
  *(_QWORD *)(v0 + 168) = v16;
  *(_BYTE *)(v0 + 176) = v17;
  *(_QWORD *)(v0 + 184) = v14;
  *(_BYTE *)(v0 + 192) = v15;
  *(_QWORD *)(v0 + 200) = v12;
  *(_BYTE *)(v0 + 208) = v13;
  *(_QWORD *)(v0 + 216) = v10;
  *(_BYTE *)(v0 + 224) = v11;
  *(_QWORD *)(v0 + 232) = v8;
  *(_BYTE *)(v0 + 240) = v9;
  *(_QWORD *)(v0 + 248) = v2;
  *(_BYTE *)(v0 + 256) = 0;
  *(_QWORD *)(v0 + 264) = v6;
  *(_BYTE *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v5;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 416);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v19;
  *v19 = v0;
  v19[1] = sub_2454FD8C8;
  return v21(v0 + 168);
}

uint64_t sub_2454FF4BC(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 328) = a1;
  *(_QWORD *)(v3 + 336) = a2;
  *(double *)(v3 + 320) = a3;
  *(_QWORD *)(v3 + 344) = sub_245513DC0();
  *(_QWORD *)(v3 + 352) = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FF530()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = (const void *)v0[41];
  v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  v3 = v2;
  v0[46] = sub_245513DB4();
  v0[47] = sub_245513D9C();
  v0[48] = v4;
  return swift_task_switch();
}

uint64_t sub_2454FF5B0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD **)(v0 + 336);
  v2 = *(_QWORD *)(v0 + 320);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_BYTE *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 112);
  v7 = *(_BYTE *)(v0 + 120);
  v8 = *(_QWORD *)(v0 + 80);
  v9 = *(_BYTE *)(v0 + 88);
  v10 = *(_QWORD *)(v0 + 64);
  v11 = *(_BYTE *)(v0 + 72);
  v12 = *(_QWORD *)(v0 + 48);
  v13 = *(_BYTE *)(v0 + 56);
  v14 = *(_QWORD *)(v0 + 32);
  v15 = *(_BYTE *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 16);
  v17 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 432) = v17;
  *(_BYTE *)(v0 + 456) = v15;
  *(_BYTE *)(v0 + 408) = v13;
  *(_BYTE *)(v0 + 416) = v11;
  *(_BYTE *)(v0 + 424) = v9;
  *(_BYTE *)(v0 + 464) = 0;
  *(_BYTE *)(v0 + 440) = v7;
  *(_BYTE *)(v0 + 448) = v4;
  *(_QWORD *)(v0 + 168) = v16;
  *(_BYTE *)(v0 + 176) = v17;
  *(_QWORD *)(v0 + 184) = v14;
  *(_BYTE *)(v0 + 192) = v15;
  *(_QWORD *)(v0 + 200) = v12;
  *(_BYTE *)(v0 + 208) = v13;
  *(_QWORD *)(v0 + 216) = v10;
  *(_BYTE *)(v0 + 224) = v11;
  *(_QWORD *)(v0 + 232) = v8;
  *(_BYTE *)(v0 + 240) = v9;
  *(_QWORD *)(v0 + 248) = v2;
  *(_BYTE *)(v0 + 256) = 0;
  *(_QWORD *)(v0 + 264) = v6;
  *(_BYTE *)(v0 + 272) = v7;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v5;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 448);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v19;
  *v19 = v0;
  v19[1] = sub_2454FDCA4;
  return v21(v0 + 168);
}

uint64_t SOSUIWebRTCView.setPausedString(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[80] = v2;
  v3[79] = a2;
  v3[78] = a1;
  sub_245513DC0();
  v3[81] = sub_245513DB4();
  v3[82] = sub_245513D9C();
  v3[83] = v4;
  return swift_task_switch();
}

uint64_t sub_2454FF778()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  int *v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t (*v24)(uint64_t);

  v1 = *(_QWORD *)(v0 + 632);
  v22 = *(_QWORD *)(v0 + 624);
  v23 = *(_QWORD **)(v0 + 640);
  sub_24550752C(v0 + 320);
  v21 = *(_QWORD *)(v0 + 320);
  *(_QWORD *)(v0 + 672) = v21;
  v2 = *(_BYTE *)(v0 + 328);
  v20 = *(_QWORD *)(v0 + 336);
  *(_QWORD *)(v0 + 680) = v20;
  v3 = *(_BYTE *)(v0 + 344);
  v19 = *(_QWORD *)(v0 + 352);
  *(_QWORD *)(v0 + 688) = v19;
  v4 = *(_BYTE *)(v0 + 360);
  v18 = *(_QWORD *)(v0 + 368);
  *(_QWORD *)(v0 + 696) = v18;
  v5 = *(_BYTE *)(v0 + 376);
  v17 = *(_QWORD *)(v0 + 384);
  *(_QWORD *)(v0 + 704) = v17;
  v6 = *(_BYTE *)(v0 + 392);
  v15 = *(_QWORD *)(v0 + 400);
  *(_QWORD *)(v0 + 712) = v15;
  v7 = *(_BYTE *)(v0 + 408);
  v13 = *(_QWORD *)(v0 + 416);
  *(_QWORD *)(v0 + 720) = v13;
  v8 = *(_BYTE *)(v0 + 424);
  v16 = *(_BYTE *)(v0 + 448);
  *(_BYTE *)(v0 + 161) = v16;
  v14 = *(_QWORD *)(v0 + 456);
  *(_QWORD *)(v0 + 728) = v14;
  v9 = *(_BYTE *)(v0 + 464);
  *(_BYTE *)(v0 + 872) = v2;
  *(_BYTE *)(v0 + 808) = v3;
  *(_BYTE *)(v0 + 816) = v4;
  *(_BYTE *)(v0 + 824) = v5;
  *(_BYTE *)(v0 + 832) = v6;
  *(_BYTE *)(v0 + 840) = v7;
  *(_BYTE *)(v0 + 848) = v8;
  *(_BYTE *)(v0 + 856) = v9;
  swift_bridgeObjectRetain();
  sub_2455040AC(v0 + 320);
  *(_BYTE *)(v0 + 800) = v2;
  *(_BYTE *)(v0 + 864) = v3;
  *(_BYTE *)(v0 + 792) = v4;
  *(_BYTE *)(v0 + 784) = v5;
  *(_BYTE *)(v0 + 752) = v6;
  *(_BYTE *)(v0 + 760) = v7;
  *(_BYTE *)(v0 + 768) = v8;
  *(_BYTE *)(v0 + 776) = v9;
  *(_QWORD *)(v0 + 472) = v21;
  *(_BYTE *)(v0 + 480) = v2;
  *(_QWORD *)(v0 + 488) = v20;
  *(_BYTE *)(v0 + 496) = v3;
  *(_QWORD *)(v0 + 504) = v19;
  *(_BYTE *)(v0 + 512) = v4;
  *(_QWORD *)(v0 + 520) = v18;
  *(_BYTE *)(v0 + 528) = v5;
  *(_QWORD *)(v0 + 536) = v17;
  *(_BYTE *)(v0 + 544) = v6;
  *(_QWORD *)(v0 + 552) = v15;
  *(_BYTE *)(v0 + 560) = v7;
  *(_QWORD *)(v0 + 568) = v13;
  *(_BYTE *)(v0 + 576) = *(_BYTE *)(v0 + 768);
  *(_QWORD *)(v0 + 584) = v22;
  *(_QWORD *)(v0 + 592) = v1;
  *(_BYTE *)(v0 + 600) = v16;
  *(_QWORD *)(v0 + 608) = v14;
  *(_BYTE *)(v0 + 616) = *(_BYTE *)(v0 + 776);
  v10 = *(int **)((*MEMORY[0x24BEE4EA0] & *v23) + 0x210);
  v24 = (uint64_t (*)(uint64_t))((char *)v10 + *v10);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 736) = v11;
  *v11 = v0;
  v11[1] = sub_2454FF990;
  return v24(v0 + 472);
}

uint64_t sub_2454FF990()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 744) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2454FF9FC()
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
  char v11;
  uint64_t v12;

  v12 = *(_QWORD *)(v0 + 728);
  v11 = *(_BYTE *)(v0 + 161);
  v1 = *(_QWORD *)(v0 + 720);
  v2 = *(_QWORD *)(v0 + 712);
  v3 = *(_QWORD *)(v0 + 704);
  v4 = *(_QWORD *)(v0 + 696);
  v5 = *(_QWORD *)(v0 + 688);
  v6 = *(_QWORD *)(v0 + 680);
  v7 = *(_QWORD *)(v0 + 672);
  v8 = *(_QWORD *)(v0 + 632);
  v9 = *(_QWORD *)(v0 + 624);
  swift_release();
  *(_QWORD *)(v0 + 16) = v7;
  *(_BYTE *)(v0 + 24) = *(_BYTE *)(v0 + 872);
  *(_QWORD *)(v0 + 32) = v6;
  *(_BYTE *)(v0 + 40) = *(_BYTE *)(v0 + 808);
  *(_QWORD *)(v0 + 48) = v5;
  *(_BYTE *)(v0 + 56) = *(_BYTE *)(v0 + 816);
  *(_QWORD *)(v0 + 64) = v4;
  *(_BYTE *)(v0 + 72) = *(_BYTE *)(v0 + 824);
  *(_QWORD *)(v0 + 80) = v3;
  *(_BYTE *)(v0 + 88) = *(_BYTE *)(v0 + 832);
  *(_QWORD *)(v0 + 96) = v2;
  *(_BYTE *)(v0 + 104) = *(_BYTE *)(v0 + 840);
  *(_QWORD *)(v0 + 112) = v1;
  *(_BYTE *)(v0 + 120) = *(_BYTE *)(v0 + 848);
  *(_QWORD *)(v0 + 128) = v9;
  *(_QWORD *)(v0 + 136) = v8;
  *(_BYTE *)(v0 + 144) = v11;
  *(_QWORD *)(v0 + 152) = v12;
  *(_BYTE *)(v0 + 160) = *(_BYTE *)(v0 + 856);
  sub_2455040AC(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454FFAFC()
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
  char v11;
  uint64_t v12;

  v12 = *(_QWORD *)(v0 + 728);
  v11 = *(_BYTE *)(v0 + 161);
  v1 = *(_QWORD *)(v0 + 720);
  v2 = *(_QWORD *)(v0 + 712);
  v3 = *(_QWORD *)(v0 + 704);
  v4 = *(_QWORD *)(v0 + 696);
  v5 = *(_QWORD *)(v0 + 688);
  v6 = *(_QWORD *)(v0 + 680);
  v7 = *(_QWORD *)(v0 + 672);
  v8 = *(_QWORD *)(v0 + 632);
  v9 = *(_QWORD *)(v0 + 624);
  swift_release();
  *(_QWORD *)(v0 + 168) = v7;
  *(_BYTE *)(v0 + 176) = *(_BYTE *)(v0 + 872);
  *(_QWORD *)(v0 + 184) = v6;
  *(_BYTE *)(v0 + 192) = *(_BYTE *)(v0 + 808);
  *(_QWORD *)(v0 + 200) = v5;
  *(_BYTE *)(v0 + 208) = *(_BYTE *)(v0 + 816);
  *(_QWORD *)(v0 + 216) = v4;
  *(_BYTE *)(v0 + 224) = *(_BYTE *)(v0 + 824);
  *(_QWORD *)(v0 + 232) = v3;
  *(_BYTE *)(v0 + 240) = *(_BYTE *)(v0 + 832);
  *(_QWORD *)(v0 + 248) = v2;
  *(_BYTE *)(v0 + 256) = *(_BYTE *)(v0 + 840);
  *(_QWORD *)(v0 + 264) = v1;
  *(_BYTE *)(v0 + 272) = *(_BYTE *)(v0 + 848);
  *(_QWORD *)(v0 + 280) = v9;
  *(_QWORD *)(v0 + 288) = v8;
  *(_BYTE *)(v0 + 296) = v11;
  *(_QWORD *)(v0 + 304) = v12;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 856);
  sub_2455040AC(v0 + 168);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2454FFD2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_245513DC0();
  v3[5] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2454FFD9C()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;

  v1 = (void *)v0[4];
  v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  v3 = sub_245513D24();
  v5 = v4;
  v0[7] = v4;
  v6 = v1;
  v7 = (_QWORD *)swift_task_alloc();
  v0[8] = v7;
  *v7 = v0;
  v7[1] = sub_2455059FC;
  return SOSUIWebRTCView.setPausedString(_:)(v3, v5);
}

uint64_t SOSUIWebRTCView.setDebugConnection(_:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 320) = v1;
  *(_BYTE *)(v2 + 161) = a1;
  sub_245513DC0();
  *(_QWORD *)(v2 + 328) = sub_245513DB4();
  *(_QWORD *)(v2 + 336) = sub_245513D9C();
  *(_QWORD *)(v2 + 344) = v3;
  return swift_task_switch();
}

uint64_t sub_2454FFEA0()
{
  uint64_t v0;
  _QWORD *v1;
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  int *v19;
  _QWORD *v20;
  uint64_t (*v22)(uint64_t);

  v1 = *(_QWORD **)(v0 + 320);
  v2 = *(_BYTE *)(v0 + 161);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 112);
  v6 = *(_BYTE *)(v0 + 120);
  v7 = *(_QWORD *)(v0 + 96);
  v8 = *(_BYTE *)(v0 + 104);
  v9 = *(_QWORD *)(v0 + 80);
  v10 = *(_BYTE *)(v0 + 88);
  v11 = *(_QWORD *)(v0 + 64);
  v12 = *(_BYTE *)(v0 + 72);
  v13 = *(_QWORD *)(v0 + 48);
  v14 = *(_BYTE *)(v0 + 56);
  v15 = *(_QWORD *)(v0 + 32);
  v16 = *(_BYTE *)(v0 + 40);
  v17 = *(_QWORD *)(v0 + 16);
  v18 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 392) = v18;
  *(_BYTE *)(v0 + 416) = v16;
  *(_BYTE *)(v0 + 368) = v14;
  *(_BYTE *)(v0 + 376) = v12;
  *(_BYTE *)(v0 + 384) = v10;
  *(_BYTE *)(v0 + 424) = v8;
  *(_BYTE *)(v0 + 400) = v6;
  *(_BYTE *)(v0 + 408) = v4;
  *(_QWORD *)(v0 + 168) = v17;
  *(_BYTE *)(v0 + 176) = v18;
  *(_QWORD *)(v0 + 184) = v15;
  *(_BYTE *)(v0 + 192) = v16;
  *(_QWORD *)(v0 + 200) = v13;
  *(_BYTE *)(v0 + 208) = v14;
  *(_QWORD *)(v0 + 216) = v11;
  *(_BYTE *)(v0 + 224) = v12;
  *(_QWORD *)(v0 + 232) = v9;
  *(_BYTE *)(v0 + 240) = v10;
  *(_QWORD *)(v0 + 248) = v7;
  *(_BYTE *)(v0 + 256) = v8;
  *(_QWORD *)(v0 + 264) = v5;
  *(_BYTE *)(v0 + 272) = v6;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v2;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 408);
  v19 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v22 = (uint64_t (*)(uint64_t))((char *)v19 + *v19);
  v20 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 352) = v20;
  *v20 = v0;
  v20[1] = sub_2454FFFF4;
  return v22(v0 + 168);
}

uint64_t sub_2454FFFF4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 360) = v0;
  swift_task_dealloc();
  if (!v0)
    sub_2455040AC(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_245500060()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245500094()
{
  uint64_t v0;

  swift_release();
  sub_2455040AC(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245500200(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 320) = a2;
  *(_QWORD *)(v3 + 328) = a3;
  *(_BYTE *)(v3 + 161) = a1;
  *(_QWORD *)(v3 + 336) = sub_245513DC0();
  *(_QWORD *)(v3 + 344) = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_245500274()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = (const void *)v0[40];
  v2 = (void *)v0[41];
  swift_release();
  v0[44] = _Block_copy(v1);
  v3 = v2;
  v0[45] = sub_245513DB4();
  v0[46] = sub_245513D9C();
  v0[47] = v4;
  return swift_task_switch();
}

uint64_t sub_2455002F4()
{
  uint64_t v0;
  _QWORD *v1;
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  int *v19;
  _QWORD *v20;
  uint64_t (*v22)(uint64_t);

  v1 = *(_QWORD **)(v0 + 328);
  v2 = *(_BYTE *)(v0 + 161);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 112);
  v6 = *(_BYTE *)(v0 + 120);
  v7 = *(_QWORD *)(v0 + 96);
  v8 = *(_BYTE *)(v0 + 104);
  v9 = *(_QWORD *)(v0 + 80);
  v10 = *(_BYTE *)(v0 + 88);
  v11 = *(_QWORD *)(v0 + 64);
  v12 = *(_BYTE *)(v0 + 72);
  v13 = *(_QWORD *)(v0 + 48);
  v14 = *(_BYTE *)(v0 + 56);
  v15 = *(_QWORD *)(v0 + 32);
  v16 = *(_BYTE *)(v0 + 40);
  v17 = *(_QWORD *)(v0 + 16);
  v18 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 424) = v18;
  *(_BYTE *)(v0 + 448) = v16;
  *(_BYTE *)(v0 + 400) = v14;
  *(_BYTE *)(v0 + 408) = v12;
  *(_BYTE *)(v0 + 416) = v10;
  *(_BYTE *)(v0 + 456) = v8;
  *(_BYTE *)(v0 + 432) = v6;
  *(_BYTE *)(v0 + 440) = v4;
  *(_QWORD *)(v0 + 168) = v17;
  *(_BYTE *)(v0 + 176) = v18;
  *(_QWORD *)(v0 + 184) = v15;
  *(_BYTE *)(v0 + 192) = v16;
  *(_QWORD *)(v0 + 200) = v13;
  *(_BYTE *)(v0 + 208) = v14;
  *(_QWORD *)(v0 + 216) = v11;
  *(_BYTE *)(v0 + 224) = v12;
  *(_QWORD *)(v0 + 232) = v9;
  *(_BYTE *)(v0 + 240) = v10;
  *(_QWORD *)(v0 + 248) = v7;
  *(_BYTE *)(v0 + 256) = v8;
  *(_QWORD *)(v0 + 264) = v5;
  *(_BYTE *)(v0 + 272) = v6;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v2;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 440);
  v19 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v22 = (uint64_t (*)(uint64_t))((char *)v19 + *v19);
  v20 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 384) = v20;
  *v20 = v0;
  v20[1] = sub_245500448;
  return v22(v0 + 168);
}

uint64_t sub_245500448()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 392) = v0;
  swift_task_dealloc();
  if (!v0)
    sub_2455040AC(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_2455004B4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 352);
  v2 = *(void **)(v0 + 328);
  swift_release();

  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);
  _Block_release(*(const void **)(v0 + 352));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245500504()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = *(void **)(v0 + 392);
  v2 = *(_QWORD *)(v0 + 352);
  v3 = *(void **)(v0 + 328);
  swift_release();
  sub_2455040AC(v0 + 16);

  v4 = (void *)sub_245513C94();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  _Block_release(*(const void **)(v0 + 352));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SOSUIWebRTCView.setVideoPreference(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[40] = a1;
  v2[41] = v1;
  sub_245513DC0();
  v2[42] = sub_245513DB4();
  v2[43] = sub_245513D9C();
  v2[44] = v3;
  return swift_task_switch();
}

uint64_t sub_2455005F0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v2 = *(_QWORD *)(v0 + 320);
  v1 = *(_QWORD **)(v0 + 328);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_BYTE *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 96);
  v7 = *(_BYTE *)(v0 + 104);
  v8 = *(_QWORD *)(v0 + 80);
  v9 = *(_BYTE *)(v0 + 88);
  v10 = *(_QWORD *)(v0 + 64);
  v11 = *(_BYTE *)(v0 + 72);
  v12 = *(_QWORD *)(v0 + 48);
  v13 = *(_BYTE *)(v0 + 56);
  v14 = *(_QWORD *)(v0 + 32);
  v15 = *(_BYTE *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 16);
  v17 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 400) = v17;
  *(_BYTE *)(v0 + 424) = v15;
  *(_BYTE *)(v0 + 376) = v13;
  *(_BYTE *)(v0 + 384) = v11;
  *(_BYTE *)(v0 + 392) = v9;
  *(_BYTE *)(v0 + 432) = v7;
  *(_BYTE *)(v0 + 408) = 0;
  *(_BYTE *)(v0 + 416) = v4;
  *(_QWORD *)(v0 + 168) = v16;
  *(_BYTE *)(v0 + 176) = v17;
  *(_QWORD *)(v0 + 184) = v14;
  *(_BYTE *)(v0 + 192) = v15;
  *(_QWORD *)(v0 + 200) = v12;
  *(_BYTE *)(v0 + 208) = v13;
  *(_QWORD *)(v0 + 216) = v10;
  *(_BYTE *)(v0 + 224) = v11;
  *(_QWORD *)(v0 + 232) = v8;
  *(_BYTE *)(v0 + 240) = v9;
  *(_QWORD *)(v0 + 248) = v6;
  *(_BYTE *)(v0 + 256) = v7;
  *(_QWORD *)(v0 + 264) = v2;
  *(_BYTE *)(v0 + 272) = 0;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v5;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 416);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v19;
  *v19 = v0;
  v19[1] = sub_2454FD8C8;
  return v21(v0 + 168);
}

uint64_t sub_245500864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[41] = a2;
  v3[42] = a3;
  v3[40] = a1;
  v3[43] = sub_245513DC0();
  v3[44] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_2455008D8()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = (const void *)v0[41];
  v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  v3 = v2;
  v0[46] = sub_245513DB4();
  v0[47] = sub_245513D9C();
  v0[48] = v4;
  return swift_task_switch();
}

uint64_t sub_245500958()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD **)(v0 + 336);
  v2 = *(_QWORD *)(v0 + 320);
  sub_24550752C(v0 + 16);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_BYTE *)(v0 + 160);
  v5 = *(_BYTE *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 96);
  v7 = *(_BYTE *)(v0 + 104);
  v8 = *(_QWORD *)(v0 + 80);
  v9 = *(_BYTE *)(v0 + 88);
  v10 = *(_QWORD *)(v0 + 64);
  v11 = *(_BYTE *)(v0 + 72);
  v12 = *(_QWORD *)(v0 + 48);
  v13 = *(_BYTE *)(v0 + 56);
  v14 = *(_QWORD *)(v0 + 32);
  v15 = *(_BYTE *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 16);
  v17 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 432) = v17;
  *(_BYTE *)(v0 + 456) = v15;
  *(_BYTE *)(v0 + 408) = v13;
  *(_BYTE *)(v0 + 416) = v11;
  *(_BYTE *)(v0 + 424) = v9;
  *(_BYTE *)(v0 + 464) = v7;
  *(_BYTE *)(v0 + 440) = 0;
  *(_BYTE *)(v0 + 448) = v4;
  *(_QWORD *)(v0 + 168) = v16;
  *(_BYTE *)(v0 + 176) = v17;
  *(_QWORD *)(v0 + 184) = v14;
  *(_BYTE *)(v0 + 192) = v15;
  *(_QWORD *)(v0 + 200) = v12;
  *(_BYTE *)(v0 + 208) = v13;
  *(_QWORD *)(v0 + 216) = v10;
  *(_BYTE *)(v0 + 224) = v11;
  *(_QWORD *)(v0 + 232) = v8;
  *(_BYTE *)(v0 + 240) = v9;
  *(_QWORD *)(v0 + 248) = v6;
  *(_BYTE *)(v0 + 256) = v7;
  *(_QWORD *)(v0 + 264) = v2;
  *(_BYTE *)(v0 + 272) = 0;
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v5;
  *(_QWORD *)(v0 + 304) = v3;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 448);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v19;
  *v19 = v0;
  v19[1] = sub_2454FDCA4;
  return v21(v0 + 168);
}

uint64_t SOSUIWebRTCView.setFrameRate(_:)(double a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 328) = v1;
  *(double *)(v2 + 320) = a1;
  sub_245513DC0();
  *(_QWORD *)(v2 + 336) = sub_245513DB4();
  *(_QWORD *)(v2 + 344) = sub_245513D9C();
  *(_QWORD *)(v2 + 352) = v3;
  return swift_task_switch();
}

uint64_t sub_245500B14()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD **)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 320);
  sub_24550752C(v0 + 16);
  v3 = *(_BYTE *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_BYTE *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 96);
  v7 = *(_BYTE *)(v0 + 104);
  v8 = *(_QWORD *)(v0 + 80);
  v9 = *(_BYTE *)(v0 + 88);
  v10 = *(_QWORD *)(v0 + 64);
  v11 = *(_BYTE *)(v0 + 72);
  v12 = *(_QWORD *)(v0 + 48);
  v13 = *(_BYTE *)(v0 + 56);
  v14 = *(_QWORD *)(v0 + 32);
  v15 = *(_BYTE *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 16);
  v17 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 400) = v17;
  *(_BYTE *)(v0 + 424) = v15;
  *(_BYTE *)(v0 + 376) = v13;
  *(_BYTE *)(v0 + 384) = v11;
  *(_BYTE *)(v0 + 392) = v9;
  *(_BYTE *)(v0 + 432) = v7;
  *(_BYTE *)(v0 + 408) = v5;
  *(_BYTE *)(v0 + 416) = 0;
  *(_QWORD *)(v0 + 168) = v16;
  *(_BYTE *)(v0 + 176) = v17;
  *(_QWORD *)(v0 + 184) = v14;
  *(_BYTE *)(v0 + 192) = v15;
  *(_QWORD *)(v0 + 200) = v12;
  *(_BYTE *)(v0 + 208) = v13;
  *(_QWORD *)(v0 + 216) = v10;
  *(_BYTE *)(v0 + 224) = v11;
  *(_QWORD *)(v0 + 232) = v8;
  *(_BYTE *)(v0 + 240) = v9;
  *(_QWORD *)(v0 + 248) = v6;
  *(_BYTE *)(v0 + 256) = v7;
  *(_QWORD *)(v0 + 264) = v4;
  *(_BYTE *)(v0 + 272) = *(_BYTE *)(v0 + 408);
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v3;
  *(_QWORD *)(v0 + 304) = v2;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 416);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v19;
  *v19 = v0;
  v19[1] = sub_245500C64;
  return v21(v0 + 168);
}

uint64_t sub_245500C64()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 368) = v0;
  swift_task_dealloc();
  if (!v0)
    sub_2455040AC(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_245500CD0()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245500D04()
{
  uint64_t v0;

  swift_release();
  sub_2455040AC(v0 + 16);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245500E70(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 328) = a1;
  *(_QWORD *)(v3 + 336) = a2;
  *(double *)(v3 + 320) = a3;
  *(_QWORD *)(v3 + 344) = sub_245513DC0();
  *(_QWORD *)(v3 + 352) = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_245500EE4()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = (const void *)v0[41];
  v2 = (void *)v0[42];
  swift_release();
  v0[45] = _Block_copy(v1);
  v3 = v2;
  v0[46] = sub_245513DB4();
  v0[47] = sub_245513D9C();
  v0[48] = v4;
  return swift_task_switch();
}

uint64_t sub_245500F64()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  int *v18;
  _QWORD *v19;
  uint64_t (*v21)(uint64_t);

  v1 = *(_QWORD **)(v0 + 336);
  v2 = *(_QWORD *)(v0 + 320);
  sub_24550752C(v0 + 16);
  v3 = *(_BYTE *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_BYTE *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 96);
  v7 = *(_BYTE *)(v0 + 104);
  v8 = *(_QWORD *)(v0 + 80);
  v9 = *(_BYTE *)(v0 + 88);
  v10 = *(_QWORD *)(v0 + 64);
  v11 = *(_BYTE *)(v0 + 72);
  v12 = *(_QWORD *)(v0 + 48);
  v13 = *(_BYTE *)(v0 + 56);
  v14 = *(_QWORD *)(v0 + 32);
  v15 = *(_BYTE *)(v0 + 40);
  v16 = *(_QWORD *)(v0 + 16);
  v17 = *(_BYTE *)(v0 + 24);
  *(_BYTE *)(v0 + 432) = v17;
  *(_BYTE *)(v0 + 456) = v15;
  *(_BYTE *)(v0 + 408) = v13;
  *(_BYTE *)(v0 + 416) = v11;
  *(_BYTE *)(v0 + 424) = v9;
  *(_BYTE *)(v0 + 464) = v7;
  *(_BYTE *)(v0 + 440) = v5;
  *(_BYTE *)(v0 + 448) = 0;
  *(_QWORD *)(v0 + 168) = v16;
  *(_BYTE *)(v0 + 176) = v17;
  *(_QWORD *)(v0 + 184) = v14;
  *(_BYTE *)(v0 + 192) = v15;
  *(_QWORD *)(v0 + 200) = v12;
  *(_BYTE *)(v0 + 208) = v13;
  *(_QWORD *)(v0 + 216) = v10;
  *(_BYTE *)(v0 + 224) = v11;
  *(_QWORD *)(v0 + 232) = v8;
  *(_BYTE *)(v0 + 240) = v9;
  *(_QWORD *)(v0 + 248) = v6;
  *(_BYTE *)(v0 + 256) = v7;
  *(_QWORD *)(v0 + 264) = v4;
  *(_BYTE *)(v0 + 272) = *(_BYTE *)(v0 + 440);
  *(_OWORD *)(v0 + 280) = *(_OWORD *)(v0 + 128);
  *(_BYTE *)(v0 + 296) = v3;
  *(_QWORD *)(v0 + 304) = v2;
  *(_BYTE *)(v0 + 312) = *(_BYTE *)(v0 + 448);
  v18 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x210);
  v21 = (uint64_t (*)(uint64_t))((char *)v18 + *v18);
  v19 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 392) = v19;
  *v19 = v0;
  v19[1] = sub_2455010B4;
  return v21(v0 + 168);
}

uint64_t sub_2455010B4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 400) = v0;
  swift_task_dealloc();
  if (!v0)
    sub_2455040AC(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_245501120()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 360);
  v2 = *(void **)(v0 + 336);
  swift_release();

  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);
  _Block_release(*(const void **)(v0 + 360));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245501170()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = *(void **)(v0 + 400);
  v2 = *(_QWORD *)(v0 + 360);
  v3 = *(void **)(v0 + 336);
  swift_release();
  sub_2455040AC(v0 + 16);

  v4 = (void *)sub_245513C94();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v4);

  _Block_release(*(const void **)(v0 + 360));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t SOSUIWebRTCView.goToError(retryable:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 128) = v1;
  *(_BYTE *)(v2 + 192) = a1;
  sub_245513DC0();
  *(_QWORD *)(v2 + 136) = sub_245513DB4();
  *(_QWORD *)(v2 + 144) = sub_245513D9C();
  *(_QWORD *)(v2 + 152) = v3;
  return swift_task_switch();
}

uint64_t sub_245501260()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t inited;
  unint64_t v4;
  _QWORD *v5;

  v1 = *(_BYTE *)(v0 + 192);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747E578);
  v2 = swift_allocObject();
  *(_QWORD *)(v0 + 160) = v2;
  *(_OWORD *)(v2 + 16) = xmmword_2455149E0;
  *(_QWORD *)(v2 + 32) = 0x6C62617972746572;
  *(_QWORD *)(v2 + 40) = 0xE900000000000065;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747E580);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2455149E0;
  *(_QWORD *)(inited + 32) = 0x6C62617972746572;
  *(_QWORD *)(inited + 40) = 0xE900000000000065;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 48) = v1;
  v4 = sub_2454F881C(inited);
  *(_QWORD *)(v0 + 168) = v4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v5;
  *v5 = v0;
  v5[1] = sub_245501378;
  return sub_2454F8950(v0 + 96, 0x6F7272456F546F67, 0xE900000000000072, v2, v4);
}

uint64_t sub_245501378()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 184) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    sub_245504434(v2 + 96, &qword_25747E568);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_245501408()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24550143C()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2455015B0(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = a3;
  *(_BYTE *)(v3 + 56) = a1;
  sub_245513DC0();
  *(_QWORD *)(v3 + 32) = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_245501620()
{
  uint64_t v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = *(void **)(v0 + 24);
  v2 = *(const void **)(v0 + 16);
  swift_release();
  *(_QWORD *)(v0 + 40) = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v4;
  *v4 = v0;
  v4[1] = sub_245505A30;
  return SOSUIWebRTCView.goToError(retryable:)(*(_BYTE *)(v0 + 56));
}

uint64_t SOSUIWebRTCView.networkInterfacesDidChange()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[6] = v0;
  sub_245513DC0();
  v1[7] = sub_245513DB4();
  v1[8] = sub_245513D9C();
  v1[9] = v2;
  return swift_task_switch();
}

uint64_t sub_2455016FC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;

  v1 = MEMORY[0x24BEE4AF8];
  v2 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)(v0 + 80) = v2;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v3;
  *v3 = v0;
  v3[1] = sub_2454F97C4;
  return sub_2454F8950(v0 + 16, 0xD00000000000001ALL, 0x8000000245516700, v1, v2);
}

uint64_t sub_2455018AC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[2] = a1;
  v2[3] = a2;
  sub_245513DC0();
  v2[4] = sub_245513DB4();
  sub_245513D9C();
  return swift_task_switch();
}

uint64_t sub_245501918()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[3];
  v2 = (const void *)v0[2];
  swift_release();
  v0[5] = _Block_copy(v2);
  v3 = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[6] = v4;
  *v4 = v0;
  v4[1] = sub_245505A30;
  return SOSUIWebRTCView.networkInterfacesDidChange()();
}

uint64_t sub_245501980(uint64_t a1)
{
  _QWORD *v1;
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
  uint64_t (*v21)(uint64_t);
  uint64_t result;
  _QWORD v23[5];
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = sub_245513CF4();
  v4 = *(_QWORD *)(v3 - 8);
  v26 = v3;
  v27 = v4;
  v5 = MEMORY[0x24BDAC7A8](v3);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v23[1] = (char *)v23 - v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v23[2] = (char *)v23 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v23[3] = (char *)v23 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v23[4] = (char *)v23 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v21 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0xD0);
  v24 = v1;
  result = v21(v20);
  if (result)
  {
    v28 = a1;
    v25 = result;
    __asm { BR              X10 }
  }
  return result;
}

id SOSUIWebRTCView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void SOSUIWebRTCView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_245503540(_QWORD *a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & *v1) + 0x278))(*a1);
}

uint64_t sub_245503560(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_245505A10;
  return v6();
}

uint64_t sub_2455035B4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_245505A10;
  return v7();
}

uint64_t sub_245503608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_245513DD8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_245513DCC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_245504434(a1, &qword_25747E540);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_245513D9C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_245503754(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2455037B8;
  return v6(a1);
}

uint64_t sub_2455037B8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_245503804(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2455038D4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2455059BC((uint64_t)v12, *a3);
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
      sub_2455059BC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2455038D4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_245513E50();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_245503A8C(a5, a6);
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
  v8 = sub_245513E98();
  if (!v8)
  {
    sub_245513EA4();
    __break(1u);
LABEL_17:
    result = sub_245513EC8();
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

uint64_t sub_245503A8C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_245503B20(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_245503CF8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_245503CF8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_245503B20(uint64_t a1, unint64_t a2)
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
      v3 = sub_245503C94(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_245513E74();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_245513EA4();
      __break(1u);
LABEL_10:
      v2 = sub_245513D84();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_245513EC8();
    __break(1u);
LABEL_14:
    result = sub_245513EA4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_245503C94(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25747F0D0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_245503CF8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25747F0D0);
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
  result = sub_245513EC8();
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249536DFC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_245503E84()
{
  unint64_t result;

  result = qword_25747E4E8;
  if (!qword_25747E4E8)
  {
    result = MEMORY[0x249536E14](&unk_245514A18, &type metadata for WebRTCError);
    atomic_store(result, (unint64_t *)&qword_25747E4E8);
  }
  return result;
}

uint64_t type metadata accessor for SOSUIWebRTCView()
{
  return objc_opt_self();
}

uint64_t sub_245503EE8(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_245503F0C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_245503F1C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_245503F50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_245503FA0;
  return sub_2454F7218((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_245503FA0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_OWORD *sub_245503FE8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_245503FF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25747E608;
  if (!qword_25747E608)
  {
    v1 = type metadata accessor for SOSUIWebtRTCCapabilities();
    result = MEMORY[0x249536E14](&protocol conformance descriptor for SOSUIWebtRTCCapabilities, v1);
    atomic_store(result, (unint64_t *)&qword_25747E608);
  }
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

uint64_t sub_245504060()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_245504084(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2455040AC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

void sub_2455040D4(unint64_t a1)
{
  switch(a1 >> 61)
  {
    case 0uLL:
      goto LABEL_3;
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      a1 &= 0x1FFFFFFFFFFFFFFFuLL;
LABEL_3:

      break;
    default:
      return;
  }
}

unint64_t sub_245504104(unint64_t result)
{
  switch(result >> 61)
  {
    case 0uLL:
      goto LABEL_3;
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
      result &= 0x1FFFFFFFFFFFFFFFuLL;
LABEL_3:
      result = (unint64_t)(id)result;
      break;
    default:
      return result;
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for WebRTCError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for WebRTCError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for WebRTCError(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for WebRTCError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WebRTCError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WebRTCError(uint64_t result, int a2, int a3)
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

uint64_t sub_245504268()
{
  return 0;
}

ValueMetadata *type metadata accessor for WebRTCError()
{
  return &type metadata for WebRTCError;
}

unint64_t sub_245504284()
{
  unint64_t result;

  result = qword_25747E790;
  if (!qword_25747E790)
  {
    result = MEMORY[0x249536E14](&unk_245514FE4, &type metadata for SOSUIWebRTCMessage);
    atomic_store(result, (unint64_t *)&qword_25747E790);
  }
  return result;
}

uint64_t sub_2455042CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25747E798 + dword_25747E798))(v2, v3);
}

uint64_t sub_245504334()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_25747E7A8 + dword_25747E7A8))(v2, v3, v4);
}

uint64_t sub_2455043B0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_25747E7B8 + dword_25747E7B8))(a1, v4, v5, v6);
}

uint64_t sub_245504434(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_245504470()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245504494(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25747E7C8 + dword_25747E7C8))(a1, v4);
}

uint64_t sub_245504508()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = *(_BYTE *)(v0 + 16);
  v4 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_25747E7D8 + dword_25747E7D8))(v2, v4, v3);
}

uint64_t sub_245504580()
{
  double *v0;
  uint64_t v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = *((_QWORD *)v0 + 3);
  v4 = *((_QWORD *)v0 + 4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_25747E7F8 + dword_25747E7F8))(v3, v4, v2);
}

uint64_t sub_2455045F8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_25747E818 + dword_25747E818))(v2, v3, v4);
}

uint64_t sub_245504670()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = *(_BYTE *)(v0 + 16);
  v4 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(char, uint64_t, uint64_t))((char *)&dword_25747E838 + dword_25747E838))(v2, v4, v3);
}

uint64_t sub_2455046E8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_25747E858 + dword_25747E858))(v2, v3, v4);
}

uint64_t sub_245504760()
{
  double *v0;
  uint64_t v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = *((_QWORD *)v0 + 3);
  v4 = *((_QWORD *)v0 + 4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_25747E878 + dword_25747E878))(v3, v4, v2);
}

uint64_t sub_2455047D8()
{
  double *v0;
  uint64_t v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = *((_QWORD *)v0 + 3);
  v4 = *((_QWORD *)v0 + 4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_25747E898 + dword_25747E898))(v3, v4, v2);
}

uint64_t sub_245504850()
{
  double *v0;
  uint64_t v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = *((_QWORD *)v0 + 3);
  v4 = *((_QWORD *)v0 + 4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_25747E8B8 + dword_25747E8B8))(v3, v4, v2);
}

uint64_t sub_2455048C8()
{
  double *v0;
  uint64_t v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = *((_QWORD *)v0 + 3);
  v4 = *((_QWORD *)v0 + 4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_25747E8D8 + dword_25747E8D8))(v3, v4, v2);
}

uint64_t sub_245504940()
{
  double *v0;
  uint64_t v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = *((_QWORD *)v0 + 3);
  v4 = *((_QWORD *)v0 + 4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_25747E8F8 + dword_25747E8F8))(v3, v4, v2);
}

uint64_t sub_2455049B8()
{
  double *v0;
  uint64_t v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = *((_QWORD *)v0 + 3);
  v4 = *((_QWORD *)v0 + 4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_25747E918 + dword_25747E918))(v3, v4, v2);
}

uint64_t sub_245504A30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25747E938 + dword_25747E938))(v2, v3);
}

uint64_t sub_245504AA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25747E958 + dword_25747E958))(v2, v3);
}

uint64_t sub_245504B10()
{
  double *v0;
  uint64_t v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = *((_QWORD *)v0 + 3);
  v4 = *((_QWORD *)v0 + 4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, double))((char *)&dword_25747E978 + dword_25747E978))(v3, v4, v2);
}

uint64_t sub_245504B88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25747E998 + dword_25747E998))(v2, v3);
}

uint64_t sub_245504BF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25747E9B8 + dword_25747E9B8))(v2, v3);
}

uint64_t sub_245504C68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25747E9D8 + dword_25747E9D8))(v2, v3);
}

uint64_t sub_245504CD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_245503FA0;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25747E9F8 + dword_25747E9F8))(v2, v3);
}

uint64_t sub_245504D48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25747EA18 + dword_25747EA18))(v2, v3);
}

uint64_t sub_245504DB4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_245504DF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = *(_BYTE *)(v0 + 32);
  v6 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 48);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, char, uint64_t, uint64_t))((char *)&dword_25747EA38 + dword_25747EA38))(v2, v3, v4, v6, v5);
}

uint64_t sub_245504E78()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_245504EB4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v5 = v0[4];
  v4 = v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_25747EA58 + dword_25747EA58))(v2, v3, v5, v4);
}

uint64_t sub_245504F38()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_25747EA78 + dword_25747EA78))(v2, v3, v4);
}

uint64_t objectdestroy_93Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));

  return swift_deallocObject();
}

uint64_t sub_245504FDC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_25747EA98 + dword_25747EA98))(v2, v3, v4);
}

uint64_t sub_245505054()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25747EAB8 + dword_25747EAB8))(v2, v3);
}

uint64_t sub_2455050C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25747EAD8 + dword_25747EAD8))(v2, v3);
}

uint64_t sub_245505134()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25747EAF8 + dword_25747EAF8))(v2, v3);
}

uint64_t sub_2455051A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25747EB18 + dword_25747EB18))(v2, v3);
}

uint64_t objectdestroy_153Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_245505248()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_25747EB38 + dword_25747EB38))(v2, v3, v4);
}

uint64_t objectdestroy_73Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_2455052EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_245505A10;
  return ((uint64_t (*)(uint64_t, uint64_t))((char *)&dword_25747EB58 + dword_25747EB58))(v2, v3);
}

uint64_t objectdestroy_77Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_245505384(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_245514060();
  sub_245513D6C();
  v4 = sub_245514078();
  return sub_2455053E8(a1, a2, v4);
}

unint64_t sub_2455053E8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_245513FF4() & 1) == 0)
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
      while (!v14 && (sub_245513FF4() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2455054C8(void *a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  void (*v30)(void);
  char v31;
  uint64_t v32;
  uint64_t v33;

  v33 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747E4E0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_245513C40();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_245513CD0();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v32 - v17;
  v19 = objc_msgSend(a1, sel_request);
  sub_245513C1C();

  sub_245513C34();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v7, 1, v12) == 1)
  {
    sub_245504434((uint64_t)v7, &qword_25747E4E0);
    return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, 0);
  }
  v21 = a3;
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v7, v12);
  v22 = sub_245513CA0();
  v24 = v33;
  if (v22 == *(_QWORD *)(v33 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_originUrlString)
    && v23 == *(_QWORD *)(v33 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_originUrlString + 8))
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
    goto LABEL_12;
  }
  v26 = sub_245513FF4();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  if ((v26 & 1) != 0)
  {
LABEL_12:
    v28 = *(void (**)(char *, uint64_t))(v13 + 8);
    v28(v16, v12);
    v29 = v21;
    goto LABEL_13;
  }
  if (sub_245513CA0() == *(_QWORD *)(v24 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_blankUrlString)
    && v27 == *(_QWORD *)(v24 + OBJC_IVAR____TtC5SOSUI15SOSUIWebRTCView_blankUrlString + 8))
  {
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  v31 = sub_245513FF4();
  swift_bridgeObjectRelease();
  v28 = *(void (**)(char *, uint64_t))(v13 + 8);
  v28(v16, v12);
  v29 = v21;
  if ((v31 & 1) == 0)
  {
    v30 = *(void (**)(void))(v21 + 16);
    goto LABEL_14;
  }
LABEL_13:
  v30 = *(void (**)(void))(v29 + 16);
LABEL_14:
  v30();
  return ((uint64_t (*)(char *, uint64_t))v28)(v18, v12);
}

uint64_t sub_24550578C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_24550579C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2455057E0(uint64_t a1)
{
  uint64_t v1;

  return sub_2454F7748(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_2455057E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EB88);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_245505860(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  id v5;
  id v6;
  char v7;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747EB88);
  v4 = *(void **)(v2 + 16);
  if (v4)
  {
    sub_245505908();
    v5 = a1;
    v6 = v4;
    v7 = sub_245513E20();

    if ((v7 & 1) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25747EB88);
      sub_245513DA8();
    }
  }
}

unint64_t sub_245505908()
{
  unint64_t result;

  result = qword_25747EB90;
  if (!qword_25747EB90)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_25747EB90);
  }
  return result;
}

uint64_t sub_245505944()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_245505970()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_245505A10;
  return sub_2454F647C();
}

uint64_t sub_2455059BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

Swift::String __swiftcall SOSUIWebRTCStateName.getValue()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  Swift::String result;

  v1 = v0;
  v2 = (void *)0xE900000000000064;
  v3 = 0x6564616F6C746F6ELL;
  switch(v1)
  {
    case 0:
      break;
    case 1:
      v2 = (void *)0xE800000000000000;
      v3 = 0x646F6F676C6C6163;
      break;
    case 2:
      v3 = 0x737561706C6C6163;
      v2 = (void *)0xEA00000000006465;
      break;
    case 3:
      v2 = (void *)0xE800000000000000;
      v3 = 0x726F6F706C6C6163;
      break;
    case 4:
      v2 = (void *)0xE400000000000000;
      v3 = 1701602409;
      break;
    case 5:
      v2 = (void *)0xE700000000000000;
      v3 = 0x77656976657270;
      break;
    case 6:
      v2 = (void *)0xEA0000000000726FLL;
      v3 = 0x7272656C61746166;
      break;
    case 7:
      v2 = (void *)0xEA0000000000676ELL;
      v3 = 0x697463656E6E6F63;
      break;
    case 8:
      v2 = (void *)0xE500000000000000;
      v3 = 0x6465646E65;
      break;
    default:
      v3 = sub_245514024();
      __break(1u);
      break;
  }
  result._object = v2;
  result._countAndFlagsBits = v3;
  return result;
}

uint64_t SOSUIWebRTCStateName.encode(to:)(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24551409C();
  SOSUIWebRTCStateName.getValue()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_245514018();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
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

uint64_t SOSUIWebRTCStateName.init(from:)(_QWORD *a1)
{
  return sub_24550AE10(a1);
}

unint64_t SOSUIWebRTCStateName.init(rawValue:)(unint64_t a1)
{
  return sub_24550B280(a1);
}

BOOL sub_245505C98(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_245505CB0()
{
  return sub_24551406C();
}

unint64_t sub_245505CDC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_24550B280(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_245505D0C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_245505D18@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_24550AE10(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_245505D40(_QWORD *a1)
{
  _BYTE v2[24];
  uint64_t v3;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24551409C();
  SOSUIWebRTCStateName.getValue()();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v2, v3);
  sub_245514018();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
}

uint64_t sub_245505DF0(uint64_t a1)
{
  uint64_t result;

  if (!a1)
    return 1919251317;
  if (a1 == 1)
    return 0x6D6E6F7269766E65;
  result = sub_245514024();
  __break(1u);
  return result;
}

uint64_t SOSUIWebRTCCameraFacing.encode(to:)(_QWORD *a1, unint64_t a2)
{
  uint64_t result;
  _BYTE v4[24];
  uint64_t v5;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24551409C();
  if (a2 > 1)
  {
    result = sub_245514024();
    __break(1u);
  }
  else
  {
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v4, v5);
    sub_245514018();
    swift_bridgeObjectRelease();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  }
  return result;
}

uint64_t SOSUIWebRTCCameraFacing.init(from:)(_QWORD *a1)
{
  return sub_24550B290(a1);
}

BOOL SOSUIWebRTCCameraFacing.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

_QWORD *sub_245505F90@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 1 && *result != 0;
  *(_QWORD *)a2 = *result == 1;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_245505FC0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_24550B290(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_245505FE8(_QWORD *a1)
{
  unint64_t *v1;

  return SOSUIWebRTCCameraFacing.encode(to:)(a1, *v1);
}

uint64_t SOSUIWebRTCVideoPreference.encode(to:)(_QWORD *a1, uint64_t a2)
{
  uint64_t result;
  _BYTE v4[24];
  uint64_t v5;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24551409C();
  if (!a2 || a2 == 2 || a2 == 1)
  {
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v4, v5);
    sub_245514018();
    swift_bridgeObjectRelease();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  }
  else
  {
    result = sub_245514024();
    __break(1u);
  }
  return result;
}

uint64_t SOSUIWebRTCVideoPreference.init(from:)(_QWORD *a1)
{
  return sub_24550B4C4(a1);
}

unint64_t SOSUIWebRTCVideoPreference.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

uint64_t sub_24550613C()
{
  sub_245514060();
  sub_24551406C();
  return sub_245514078();
}

uint64_t sub_245506180()
{
  sub_245514060();
  sub_24551406C();
  return sub_245514078();
}

uint64_t *sub_2455061C0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_2455061DC@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_24550B4C4(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_245506204(_QWORD *a1)
{
  uint64_t *v1;

  return SOSUIWebRTCVideoPreference.encode(to:)(a1, *v1);
}

id SOSUIWebRTCState.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t SOSUIWebRTCState.init()()
{
  uint64_t ObjectType;
  uint64_t v1;

  ObjectType = swift_getObjectType();
  v1 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, double))(ObjectType + 152))(0, 0, 0, 0, 0, 1, 0, 0, 1.0);
  swift_deallocPartialClassInstance();
  return v1;
}

id SOSUIWebRTCState.__allocating_init(state:connected:connecting:cameraExists:cameraActive:cameraFacing:zoomLevel:torch:error:)(uint64_t a1, char a2, char a3, char a4, char a5, uint64_t a6, char a7, uint64_t a8, double a9)
{
  objc_class *v9;
  _BYTE *v19;
  objc_super v21;

  v19 = objc_allocWithZone(v9);
  *(_QWORD *)&v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_state] = a1;
  v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connected] = a2;
  v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connecting] = a3;
  v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraExists] = a4;
  v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraActive] = a5;
  *(_QWORD *)&v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraFacing] = a6;
  *(double *)&v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_zoomLevel] = a9;
  v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_torch] = a7;
  *(_QWORD *)&v19[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_error] = a8;
  v21.receiver = v19;
  v21.super_class = v9;
  return objc_msgSendSuper2(&v21, sel_init);
}

id SOSUIWebRTCState.init(state:connected:connecting:cameraExists:cameraActive:cameraFacing:zoomLevel:torch:error:)(uint64_t a1, char a2, char a3, char a4, char a5, uint64_t a6, char a7, uint64_t a8, double a9)
{
  _BYTE *v9;
  objc_super v11;

  *(_QWORD *)&v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_state] = a1;
  v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connected] = a2;
  v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connecting] = a3;
  v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraExists] = a4;
  v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraActive] = a5;
  *(_QWORD *)&v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraFacing] = a6;
  *(double *)&v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_zoomLevel] = a9;
  v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_torch] = a7;
  *(_QWORD *)&v9[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_error] = a8;
  v11.receiver = v9;
  v11.super_class = (Class)type metadata accessor for SOSUIWebRTCState();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t SOSUIWebRTCState.state.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_state);
}

uint64_t SOSUIWebRTCState.connected.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connected);
}

uint64_t SOSUIWebRTCState.connecting.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connecting);
}

uint64_t SOSUIWebRTCState.cameraExists.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraExists);
}

uint64_t SOSUIWebRTCState.cameraActive.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraActive);
}

uint64_t SOSUIWebRTCState.cameraFacing.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraFacing);
}

double SOSUIWebRTCState.zoomLevel.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_zoomLevel);
}

uint64_t SOSUIWebRTCState.torch.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_torch);
}

void *SOSUIWebRTCState.error.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_error);
  v2 = v1;
  return v1;
}

uint64_t sub_245506564(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_245506594 + 4 * byte_245514AA9[a1]))(0x6574617473, 0xE500000000000000);
}

uint64_t sub_245506594()
{
  return 0x657463656E6E6F63;
}

uint64_t sub_2455065B0()
{
  return 0x697463656E6E6F63;
}

uint64_t sub_2455065CC()
{
  return 0x78456172656D6163;
}

uint64_t sub_2455065EC()
{
  return 0x63416172656D6163;
}

uint64_t sub_24550660C()
{
  return 0x61466172656D6163;
}

uint64_t sub_24550662C()
{
  return 0x6576654C6D6F6F7ALL;
}

uint64_t sub_24550664C()
{
  return 0x6863726F74;
}

uint64_t sub_24550665C()
{
  return 0x726F727265;
}

BOOL sub_24550666C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_245506684()
{
  return sub_24551406C();
}

uint64_t sub_2455066B0()
{
  unsigned __int8 *v0;

  return sub_245506564(*v0);
}

uint64_t sub_2455066B8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24550B9A8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2455066DC()
{
  return 0;
}

void sub_2455066E8(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_2455066F4()
{
  sub_24550B764();
  return sub_2455140B4();
}

uint64_t sub_24550671C()
{
  sub_24550B764();
  return sub_2455140C0();
}

id SOSUIWebRTCState.__deallocating_deinit()
{
  return sub_24550AAB8(type metadata accessor for SOSUIWebRTCState);
}

uint64_t SOSUIWebRTCState.encode(to:)(_QWORD *a1)
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

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EC58);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24550B764();
  sub_2455140A8();
  v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_state);
  HIBYTE(v10) = 0;
  sub_24550B7A8();
  sub_245513FD0();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_245513FAC();
    LOBYTE(v11) = 2;
    sub_245513FAC();
    LOBYTE(v11) = 3;
    sub_245513FAC();
    LOBYTE(v11) = 4;
    sub_245513FAC();
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraFacing);
    HIBYTE(v10) = 5;
    sub_24550B7EC();
    sub_245513FD0();
    LOBYTE(v11) = 6;
    sub_245513FB8();
    LOBYTE(v11) = 7;
    sub_245513FAC();
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_error);
    HIBYTE(v10) = 8;
    type metadata accessor for SOSUIWebRTCErrorMessage();
    sub_2455102C4(&qword_25747EC70, type metadata accessor for SOSUIWebRTCErrorMessage, (uint64_t)&protocol conformance descriptor for SOSUIWebRTCErrorMessage);
    sub_245513F94();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

char *SOSUIWebRTCState.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return SOSUIWebRTCState.init(from:)(a1);
}

char *SOSUIWebRTCState.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v16;
  char *v17;
  uint64_t v18;
  _QWORD *v19;
  objc_super v20;
  char v21;
  uint64_t v22;

  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EC78);
  v4 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v19 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_24550B764();
  v8 = v1;
  v17 = v6;
  sub_245514090();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    type metadata accessor for SOSUIWebRTCState();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v9 = v4;
    v21 = 0;
    sub_24550B850();
    v10 = v17;
    v11 = v18;
    sub_245513F4C();
    *(_QWORD *)&v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_state] = v22;
    LOBYTE(v22) = 1;
    v12 = sub_245513F28();
    v13 = (uint64_t)v19;
    v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connected] = v12 & 1;
    LOBYTE(v22) = 2;
    v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_connecting] = sub_245513F28() & 1;
    LOBYTE(v22) = 3;
    v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraExists] = sub_245513F28() & 1;
    LOBYTE(v22) = 4;
    v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraActive] = sub_245513F28() & 1;
    v21 = 5;
    sub_24550B894();
    sub_245513F4C();
    *(_QWORD *)&v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_cameraFacing] = v22;
    LOBYTE(v22) = 6;
    sub_245513F34();
    *(_QWORD *)&v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_zoomLevel] = v14;
    LOBYTE(v22) = 7;
    v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_torch] = sub_245513F28() & 1;
    type metadata accessor for SOSUIWebRTCErrorMessage();
    v21 = 8;
    sub_2455102C4(&qword_25747EC90, type metadata accessor for SOSUIWebRTCErrorMessage, (uint64_t)&protocol conformance descriptor for SOSUIWebRTCErrorMessage);
    sub_245513F10();
    *(_QWORD *)&v8[OBJC_IVAR____TtC5SOSUI16SOSUIWebRTCState_error] = v22;

    v16 = (objc_class *)type metadata accessor for SOSUIWebRTCState();
    v20.receiver = v8;
    v20.super_class = v16;
    v8 = (char *)objc_msgSendSuper2(&v20, sel_init);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v10, v11);
    __swift_destroy_boxed_opaque_existential_0(v13);
  }
  return v8;
}

uint64_t sub_245506E10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 168))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_245506E3C()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0xA0))();
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.poorConnectionThreshold()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.poorConnectionThreshold.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t SOSUIWebRTCConfiguration.poorConnectionThreshold.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)v2 = result;
  *(_BYTE *)(v2 + 8) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.poorConnectionThreshold.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.poorConnectionGracePeriod()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.poorConnectionGracePeriod.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t SOSUIWebRTCConfiguration.poorConnectionGracePeriod.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = result;
  *(_BYTE *)(v2 + 24) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.poorConnectionGracePeriod.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.iceRestartTimeout()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.iceRestartTimeout.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t SOSUIWebRTCConfiguration.iceRestartTimeout.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = result;
  *(_BYTE *)(v2 + 40) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.iceRestartTimeout.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.iceRestartRetryCount()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.iceRestartRetryCount.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t SOSUIWebRTCConfiguration.iceRestartRetryCount.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = result;
  *(_BYTE *)(v2 + 56) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.iceRestartRetryCount.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.minimumBitrate()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.minimumBitrate.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 64);
}

uint64_t SOSUIWebRTCConfiguration.minimumBitrate.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 64) = result;
  *(_BYTE *)(v2 + 72) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.minimumBitrate.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.maximumBitrate()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.maximumBitrate.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t SOSUIWebRTCConfiguration.maximumBitrate.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 80) = result;
  *(_BYTE *)(v2 + 88) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.maximumBitrate.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.videoPreference()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.videoPreference.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 96);
}

uint64_t SOSUIWebRTCConfiguration.videoPreference.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 96) = result;
  *(_BYTE *)(v2 + 104) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.videoPreference.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.pausedString()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.pausedString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 112);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SOSUIWebRTCConfiguration.pausedString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 112) = a1;
  *(_QWORD *)(v2 + 120) = a2;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.pausedString.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.debugConnection()
{
  return 2;
}

uint64_t SOSUIWebRTCConfiguration.debugConnection.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 128);
}

uint64_t SOSUIWebRTCConfiguration.debugConnection.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 128) = result;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.debugConnection.modify())()
{
  return nullsub_1;
}

uint64_t variable initialization expression of SOSUIWebRTCConfiguration.frameRate()
{
  return 0;
}

uint64_t SOSUIWebRTCConfiguration.frameRate.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 136);
}

uint64_t SOSUIWebRTCConfiguration.frameRate.setter(uint64_t result, char a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 136) = result;
  *(_BYTE *)(v2 + 144) = a2 & 1;
  return result;
}

uint64_t (*SOSUIWebRTCConfiguration.frameRate.modify())()
{
  return nullsub_1;
}

uint64_t sub_2455070D8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_245507114 + 4 * byte_245514AB2[a1]))(0xD000000000000017, 0x80000002455172C0);
}

uint64_t sub_245507114()
{
  uint64_t v0;

  return v0 + 8;
}

uint64_t sub_245507158()
{
  return 0x426D756D696E696DLL;
}

uint64_t sub_245507188()
{
  return 0x6572506F65646976;
}

uint64_t sub_2455071AC()
{
  return 0x7453646573756170;
}

uint64_t sub_2455071CC()
{
  return 0x6E6F436775626564;
}

uint64_t sub_2455071F0()
{
  return 0x746152656D617266;
}

uint64_t sub_24550720C()
{
  unsigned __int8 *v0;

  return sub_2455070D8(*v0);
}

uint64_t sub_245507214@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24550BDA0(a1, a2);
  *a3 = result;
  return result;
}

void sub_245507238(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_245507244()
{
  sub_24550B8D8();
  return sub_2455140B4();
}

uint64_t sub_24550726C()
{
  sub_24550B8D8();
  return sub_2455140C0();
}

uint64_t SOSUIWebRTCConfiguration.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];
  char v11[16];
  _BYTE v12[16];

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EC98);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24550B8D8();
  sub_2455140A8();
  v11[0] = 0;
  sub_245513F88();
  if (!v2)
  {
    v11[0] = 1;
    sub_245513F88();
    v11[0] = 2;
    sub_245513F88();
    v11[0] = 3;
    sub_245513F88();
    v11[0] = 4;
    sub_245513F88();
    v11[0] = 5;
    sub_245513F88();
    sub_24550B91C(v3 + 96, (uint64_t)v12);
    sub_24550B91C((uint64_t)v12, (uint64_t)v11);
    v10[15] = 6;
    sub_24550B964();
    sub_245513F94();
    v11[0] = 7;
    sub_245513F70();
    v11[0] = 8;
    sub_245513F7C();
    v11[0] = 9;
    sub_245513F88();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_24550752C(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
  *(_QWORD *)(a1 + 16) = 0;
  *(_BYTE *)(a1 + 24) = 1;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 1;
  *(_QWORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 56) = 1;
  *(_QWORD *)(a1 + 64) = 0;
  *(_BYTE *)(a1 + 72) = 1;
  *(_QWORD *)(a1 + 80) = 0;
  *(_BYTE *)(a1 + 88) = 1;
  *(_QWORD *)(a1 + 96) = 0;
  *(_BYTE *)(a1 + 104) = 1;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0;
  *(_BYTE *)(a1 + 128) = 2;
  *(_QWORD *)(a1 + 136) = 0;
  *(_BYTE *)(a1 + 144) = 1;
}

double SOSUIWebRTCConfiguration.init(from:)@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[9];
  char v10;

  sub_24550C230(a1, (uint64_t)v9);
  if (!v2)
  {
    v5 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_OWORD *)(a2 + 128) = v9[8];
    *(_BYTE *)(a2 + 144) = v10;
    v6 = v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(_OWORD *)(a2 + 48) = v6;
    v7 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v7;
    result = *(double *)v9;
    v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
  }
  return result;
}

double sub_245507620@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v9[9];
  char v10;

  sub_24550C230(a1, (uint64_t)v9);
  if (!v2)
  {
    v5 = v9[7];
    *(_OWORD *)(a2 + 96) = v9[6];
    *(_OWORD *)(a2 + 112) = v5;
    *(_OWORD *)(a2 + 128) = v9[8];
    *(_BYTE *)(a2 + 144) = v10;
    v6 = v9[3];
    *(_OWORD *)(a2 + 32) = v9[2];
    *(_OWORD *)(a2 + 48) = v6;
    v7 = v9[5];
    *(_OWORD *)(a2 + 64) = v9[4];
    *(_OWORD *)(a2 + 80) = v7;
    result = *(double *)v9;
    v8 = v9[1];
    *(_OWORD *)a2 = v9[0];
    *(_OWORD *)(a2 + 16) = v8;
  }
  return result;
}

uint64_t sub_245507690(_QWORD *a1)
{
  return SOSUIWebRTCConfiguration.encode(to:)(a1);
}

uint64_t SOSUIWebRTCErrorMessage.error.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_error);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SOSUIWebRTCErrorMessage.errorCode.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_errorCode);
}

uint64_t SOSUIWebRTCErrorMessage.stack.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_stack);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SOSUIWebRTCErrorMessage.lastState.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_lastState);
}

uint64_t SOSUIWebRTCErrorMessage.retryable.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_retryable);
}

uint64_t SOSUIWebRTCErrorMessage.description.getter()
{
  sub_245513E68();
  sub_245513D78();
  sub_245513FDC();
  sub_245513D78();
  swift_bridgeObjectRelease();
  sub_245513D78();
  swift_bridgeObjectRetain();
  sub_245513D78();
  swift_bridgeObjectRelease();
  sub_245513D78();
  SOSUIWebRTCStateName.getValue()();
  sub_245513D78();
  swift_bridgeObjectRelease();
  sub_245513D78();
  sub_245513D78();
  swift_bridgeObjectRelease();
  sub_245513D78();
  swift_bridgeObjectRetain();
  sub_245513D78();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_2455079D4()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_245507A00 + 4 * byte_245514ABC[*v0]))(0x726F727265, 0xE500000000000000);
}

uint64_t sub_245507A00()
{
  return 0x646F43726F727265;
}

uint64_t sub_245507A54@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24550CE04(a1, a2);
  *a3 = result;
  return result;
}

void sub_245507A78(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_245507A84()
{
  sub_24550CA14();
  return sub_2455140B4();
}

uint64_t sub_245507AAC()
{
  sub_24550CA14();
  return sub_2455140C0();
}

id SOSUIWebRTCErrorMessage.__deallocating_deinit()
{
  return sub_24550AAB8(type metadata accessor for SOSUIWebRTCErrorMessage);
}

uint64_t SOSUIWebRTCErrorMessage.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE v10[16];
  uint64_t v11;
  char v12;
  char v13;
  char v14;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747ECD8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24550CA14();
  sub_2455140A8();
  v14 = 0;
  sub_245513FA0();
  if (!v2)
  {
    v13 = 1;
    sub_245513FC4();
    v12 = 2;
    sub_245513FA0();
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_lastState);
    v10[15] = 3;
    sub_24550B7A8();
    sub_245513FD0();
    v10[14] = 4;
    sub_245513FAC();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

id SOSUIWebRTCErrorMessage.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return SOSUIWebRTCErrorMessage.init(from:)(a1);
}

id SOSUIWebRTCErrorMessage.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  objc_class *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  objc_super v23;
  char v24;
  uint64_t v25;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747ECE0);
  v4 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v22 = a1;
  v8 = __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_24550CA14();
  v9 = v1;
  v10 = v8;
  sub_245514090();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);

    type metadata accessor for SOSUIWebRTCErrorMessage();
    swift_deallocPartialClassInstance();
  }
  else
  {
    LOBYTE(v25) = 0;
    v11 = v21;
    v12 = sub_245513F1C();
    v14 = (uint64_t *)&v9[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_error];
    *v14 = v12;
    v14[1] = v15;
    LOBYTE(v25) = 1;
    *(_QWORD *)&v9[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_errorCode] = sub_245513F40();
    LOBYTE(v25) = 2;
    v16 = sub_245513F1C();
    v17 = (uint64_t *)&v9[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_stack];
    *v17 = v16;
    v17[1] = v18;
    v24 = 3;
    sub_24550B850();
    sub_245513F4C();
    *(_QWORD *)&v9[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_lastState] = v25;
    LOBYTE(v25) = 4;
    v9[OBJC_IVAR____TtC5SOSUI23SOSUIWebRTCErrorMessage_retryable] = sub_245513F28() & 1;

    v19 = (objc_class *)type metadata accessor for SOSUIWebRTCErrorMessage();
    v23.receiver = v9;
    v23.super_class = v19;
    v10 = objc_msgSendSuper2(&v23, sel_init);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v11);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);
  }
  return v10;
}

uint64_t sub_245507FD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 128))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_245508000()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x78))();
}

uint64_t SOSUIWebRTCQualityMessage.bitrate.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_bitrate);
}

uint64_t SOSUIWebRTCQualityMessage.availableBitrate.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_availableBitrate);
}

uint64_t SOSUIWebRTCQualityMessage.packetLoss.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_packetLoss);
}

uint64_t SOSUIWebRTCQualityMessage.currentRoundTripTime.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_currentRoundTripTime);
}

uint64_t SOSUIWebRTCQualityMessage.framesPerSecond.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_framesPerSecond);
}

uint64_t SOSUIWebRTCQualityMessage.jitter.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_jitter);
}

uint64_t SOSUIWebRTCQualityMessage.connectionPoor.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_connectionPoor);
}

uint64_t SOSUIWebRTCQualityMessage.bytesSent.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_bytesSent);
}

uint64_t sub_2455080F0(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_245508124 + 4 * byte_245514AC1[a1]))(0x65746172746962, 0xE700000000000000);
}

unint64_t sub_245508124()
{
  return 0xD000000000000010;
}

uint64_t sub_245508140()
{
  return 0x6F4C74656B636170;
}

unint64_t sub_24550815C()
{
  return 0xD000000000000014;
}

uint64_t sub_24550817C()
{
  return 0x655073656D617266;
}

uint64_t sub_2455081A0()
{
  return 0x72657474696ALL;
}

uint64_t sub_2455081B4()
{
  return 0x697463656E6E6F63;
}

uint64_t sub_2455081D8()
{
  return 0x6E65537365747962;
}

uint64_t sub_2455081F4()
{
  unsigned __int8 *v0;

  return sub_2455080F0(*v0);
}

uint64_t sub_2455081FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24550D02C(a1, a2);
  *a3 = result;
  return result;
}

void sub_245508220(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_24550822C()
{
  sub_24550CA78();
  return sub_2455140B4();
}

uint64_t sub_245508254()
{
  sub_24550CA78();
  return sub_2455140C0();
}

id SOSUIWebRTCQualityMessage.__deallocating_deinit()
{
  return sub_24550AAB8(type metadata accessor for SOSUIWebRTCQualityMessage);
}

uint64_t SOSUIWebRTCQualityMessage.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747ED28);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24550CA78();
  sub_2455140A8();
  v8[15] = 0;
  sub_245513F88();
  if (!v1)
  {
    v8[14] = 1;
    sub_245513F88();
    v8[13] = 2;
    sub_245513F88();
    v8[12] = 3;
    sub_245513F88();
    v8[11] = 4;
    sub_245513F88();
    v8[10] = 5;
    sub_245513F88();
    v8[9] = 6;
    sub_245513F7C();
    v8[8] = 7;
    sub_245513F88();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

char *SOSUIWebRTCQualityMessage.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return SOSUIWebRTCQualityMessage.init(from:)(a1);
}

char *SOSUIWebRTCQualityMessage.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char v14;
  uint64_t v15;
  char *v16;
  char v17;
  uint64_t v18;
  char *v19;
  char v20;
  uint64_t v21;
  char *v22;
  char v23;
  uint64_t v24;
  char *v25;
  char v26;
  uint64_t v27;
  char *v28;
  char v29;
  uint64_t v30;
  char *v32;
  char v33;
  objc_class *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  _QWORD *v38;
  objc_super v39;
  char v40;

  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747ED30);
  v4 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v38 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_24550CA78();
  v8 = v1;
  v36 = v6;
  sub_245514090();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v38);
    type metadata accessor for SOSUIWebRTCQualityMessage();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v40 = 0;
    v9 = v36;
    v10 = v37;
    v11 = sub_245513F04();
    v12 = (uint64_t)v38;
    v13 = &v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_bitrate];
    *(_QWORD *)v13 = v11;
    v13[8] = v14 & 1;
    v40 = 1;
    v15 = sub_245513F04();
    v16 = &v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_availableBitrate];
    *(_QWORD *)v16 = v15;
    v16[8] = v17 & 1;
    v40 = 2;
    v18 = sub_245513F04();
    v19 = &v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_packetLoss];
    *(_QWORD *)v19 = v18;
    v19[8] = v20 & 1;
    v40 = 3;
    v21 = sub_245513F04();
    v22 = &v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_currentRoundTripTime];
    *(_QWORD *)v22 = v21;
    v22[8] = v23 & 1;
    v40 = 4;
    v24 = sub_245513F04();
    v25 = &v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_framesPerSecond];
    *(_QWORD *)v25 = v24;
    v25[8] = v26 & 1;
    v40 = 5;
    v27 = sub_245513F04();
    v28 = &v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_jitter];
    *(_QWORD *)v28 = v27;
    v28[8] = v29 & 1;
    v40 = 6;
    v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_connectionPoor] = sub_245513EF8();
    v40 = 7;
    v30 = sub_245513F04();
    v32 = &v8[OBJC_IVAR____TtC5SOSUI25SOSUIWebRTCQualityMessage_bytesSent];
    *(_QWORD *)v32 = v30;
    v32[8] = v33 & 1;

    v34 = (objc_class *)type metadata accessor for SOSUIWebRTCQualityMessage();
    v39.receiver = v8;
    v39.super_class = v34;
    v8 = (char *)objc_msgSendSuper2(&v39, sel_init);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v10);
    __swift_destroy_boxed_opaque_existential_0(v12);
  }
  return v8;
}

uint64_t sub_245508860@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 152))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_24550888C()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x90))();
}

uint64_t SOSUIWebRTCLogMessage.level.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_level);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SOSUIWebRTCLogMessage.message.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message);
  swift_bridgeObjectRetain();
  return v1;
}

BOOL sub_245508934(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24550894C()
{
  _BYTE *v0;

  if (*v0)
    return 0x6567617373656DLL;
  else
    return 0x6C6576656CLL;
}

uint64_t sub_245508984@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24550D3C0(a1, a2);
  *a3 = result;
  return result;
}

void sub_2455089A8(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2455089B4()
{
  sub_24550CADC();
  return sub_2455140B4();
}

uint64_t sub_2455089DC()
{
  sub_24550CADC();
  return sub_2455140C0();
}

id SOSUIWebRTCLogMessage.__deallocating_deinit()
{
  return sub_24550AAB8(type metadata accessor for SOSUIWebRTCLogMessage);
}

uint64_t sub_245508A24()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t SOSUIWebRTCLogMessage.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747ED48);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24550CADC();
  sub_2455140A8();
  v8[15] = 0;
  sub_245513FA0();
  if (!v1)
  {
    v8[14] = 1;
    sub_245513FA0();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

id SOSUIWebRTCLogMessage.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return SOSUIWebRTCLogMessage.init(from:)(a1);
}

id SOSUIWebRTCLogMessage.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  objc_class *v19;
  uint64_t v20;
  char *v21;
  objc_super v22;
  char v23;

  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747ED50);
  v4 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24550CADC();
  v21 = v1;
  v8 = v7;
  sub_245514090();
  if (v2)
  {
    v11 = v21;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);

    type metadata accessor for SOSUIWebRTCLogMessage();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v23 = 0;
    v9 = v20;
    v10 = sub_245513F1C();
    v13 = v21;
    v14 = (uint64_t *)&v21[OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_level];
    *v14 = v10;
    v14[1] = v15;
    v23 = 1;
    v16 = sub_245513F1C();
    v17 = (uint64_t *)&v13[OBJC_IVAR____TtC5SOSUI21SOSUIWebRTCLogMessage_message];
    *v17 = v16;
    v17[1] = v18;

    v19 = (objc_class *)type metadata accessor for SOSUIWebRTCLogMessage();
    v22.receiver = v13;
    v22.super_class = v19;
    v8 = objc_msgSendSuper2(&v22, sel_init);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v9);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v8;
}

uint64_t sub_245508DB8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 104))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_245508DE4()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x60))();
}

uint64_t SOSUIWebRTCConnectionInfoMessage.addresses.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_245508E2C()
{
  return 1;
}

uint64_t sub_245508E3C()
{
  return 0x6573736572646461;
}

uint64_t sub_245508E58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6573736572646461 && a2 == 0xE900000000000073)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_245513FF4();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_245508EF8(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_245508F04()
{
  sub_24550CB40();
  return sub_2455140B4();
}

uint64_t sub_245508F2C()
{
  sub_24550CB40();
  return sub_2455140C0();
}

id SOSUIWebRTCConnectionInfoMessage.__deallocating_deinit()
{
  return sub_24550AAB8(type metadata accessor for SOSUIWebRTCConnectionInfoMessage);
}

uint64_t SOSUIWebRTCConnectionInfoMessage.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747ED60);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24550CB40();
  sub_2455140A8();
  v9[1] = *(_QWORD *)(v2 + OBJC_IVAR____TtC5SOSUI32SOSUIWebRTCConnectionInfoMessage_addresses);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747ED68);
  sub_24550CBC8(&qword_25747ED70, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
  sub_245513FD0();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

char *SOSUIWebRTCConnectionInfoMessage.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return SOSUIWebRTCConnectionInfoMessage.init(from:)(a1);
}

char *SOSUIWebRTCConnectionInfoMessage.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  objc_class *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;
  uint64_t v17;

  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747ED78);
  v3 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24550CB40();
  v6 = v1;
  v13 = v5;
  v7 = v15;
  sub_245514090();
  if (v7)
  {

    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    type metadata accessor for SOSUIWebRTCConnectionInfoMessage();
    swift_deallocPartialClassInstance();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25747ED68);
    sub_24550CBC8(&qword_25747ED80, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    v8 = v14;
    v9 = v13;
    sub_245513F4C();
    *(_QWORD *)&v6[OBJC_IVAR____TtC5SOSUI32SOSUIWebRTCConnectionInfoMessage_addresses] = v17;

    v11 = (objc_class *)type metadata accessor for SOSUIWebRTCConnectionInfoMessage();
    v16.receiver = v6;
    v16.super_class = v11;
    v6 = (char *)objc_msgSendSuper2(&v16, sel_init);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v8);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v6;
}

uint64_t sub_24550929C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 96))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_2455092C8()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x58))();
}

uint64_t sub_245509300()
{
  return 0;
}

uint64_t sub_24550930C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_245509338()
{
  sub_24550CCF4();
  return sub_2455140B4();
}

uint64_t sub_245509360()
{
  sub_24550CCF4();
  return sub_2455140C0();
}

uint64_t sub_245509388()
{
  sub_245514060();
  sub_24551406C();
  return sub_245514078();
}

uint64_t sub_2455093CC()
{
  sub_245514060();
  sub_24551406C();
  return sub_245514078();
}

uint64_t sub_24550940C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_245509444 + 4 * byte_245514AC9[*v0]))(0x73654D6574617473, 0xEC00000065676173);
}

uint64_t sub_245509444()
{
  return 0x73654D726F727265;
}

uint64_t sub_245509458()
{
  return 0x4D7974696C617571;
}

uint64_t sub_24550947C()
{
  return 0x74736F4C6C6C6163;
}

uint64_t sub_2455094A0()
{
  return 0x617373654D676F6CLL;
}

unint64_t sub_2455094BC()
{
  return 0xD000000000000010;
}

uint64_t sub_2455094D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24550D4A8(a1, a2);
  *a3 = result;
  return result;
}

void sub_2455094FC(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_245509508()
{
  sub_24550CC28();
  return sub_2455140B4();
}

uint64_t sub_245509530()
{
  sub_24550CC28();
  return sub_2455140C0();
}

uint64_t sub_245509558()
{
  return 0x697463656E6E6F63;
}

uint64_t sub_24550957C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x697463656E6E6F63 && a2 == 0xEE006F666E496E6FLL)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_245513FF4();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_245509634()
{
  sub_24550CC6C();
  return sub_2455140B4();
}

uint64_t sub_24550965C()
{
  sub_24550CC6C();
  return sub_2455140C0();
}

uint64_t sub_245509684()
{
  return 0x726F727265;
}

uint64_t sub_245509698@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_245513FF4();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_245509724()
{
  sub_24550CD7C();
  return sub_2455140B4();
}

uint64_t sub_24550974C()
{
  sub_24550CD7C();
  return sub_2455140C0();
}

uint64_t sub_245509774()
{
  return sub_24551406C();
}

uint64_t sub_245509798()
{
  return 6778732;
}

uint64_t sub_2455097A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 6778732 && a2 == 0xE300000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_245513FF4();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24550982C()
{
  sub_24550CCB0();
  return sub_2455140B4();
}

uint64_t sub_245509854()
{
  sub_24550CCB0();
  return sub_2455140C0();
}

uint64_t sub_24550987C()
{
  return 0x7974696C617571;
}

uint64_t sub_245509894@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x7974696C617571 && a2 == 0xE700000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_245513FF4();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_245509928()
{
  sub_24550CD38();
  return sub_2455140B4();
}

uint64_t sub_245509950()
{
  sub_24550CD38();
  return sub_2455140C0();
}

uint64_t sub_245509978()
{
  return 0x6574617473;
}

uint64_t sub_24550998C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6574617473 && a2 == 0xE500000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_245513FF4();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_245509A18()
{
  sub_24550CDC0();
  return sub_2455140B4();
}

uint64_t sub_245509A40()
{
  sub_24550CDC0();
  return sub_2455140C0();
}

void sub_245509A68(_QWORD *a1, uint64_t a2)
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
  _QWORD v15[15];
  uint64_t v16;
  uint64_t v17;

  v17 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747ED88);
  v15[11] = *(_QWORD *)(v3 - 8);
  v15[12] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v15[10] = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747ED90);
  v15[8] = *(_QWORD *)(v5 - 8);
  v15[9] = v5;
  MEMORY[0x24BDAC7A8](v5);
  v15[7] = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747ED98);
  v15[2] = *(_QWORD *)(v7 - 8);
  v15[3] = v7;
  MEMORY[0x24BDAC7A8](v7);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EDA0);
  v15[5] = *(_QWORD *)(v8 - 8);
  v15[6] = v8;
  MEMORY[0x24BDAC7A8](v8);
  v15[4] = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EDA8);
  v15[0] = *(_QWORD *)(v10 - 8);
  v15[1] = v10;
  MEMORY[0x24BDAC7A8](v10);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EDB0);
  MEMORY[0x24BDAC7A8](v11);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EDB8);
  v15[13] = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v13 = (char *)v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24550CC28();
  v15[14] = v13;
  v14 = v17;
  sub_2455140A8();
  __asm { BR              X10 }
}

void sub_245509CA0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)(v4 - 72) = 0;
  sub_24550CDC0();
  v5 = v0;
  v7 = *(_QWORD *)(v4 - 112);
  v6 = *(_QWORD *)(v4 - 104);
  sub_245513F64();
  *(_QWORD *)(v4 - 72) = v5;
  type metadata accessor for SOSUIWebRTCState();
  sub_2455102C4(&qword_25747EDD8, type metadata accessor for SOSUIWebRTCState, (uint64_t)&protocol conformance descriptor for SOSUIWebRTCState);
  sub_245513FD0();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 120) + 8))(v7, v6);
  sub_2455040D4((unint64_t)v0);
}

void sub_24550A01C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v1 - 72) = 3;
  sub_24550CCF4();
  v3 = *(_QWORD *)(v1 - 112);
  v2 = *(_QWORD *)(v1 - 104);
  sub_245513F64();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 208) + 8))(v0, *(_QWORD *)(v1 - 200));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 120) + 8))(v3, v2);
  JUMPOUT(0x245509FF8);
}

uint64_t sub_24550A078@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = sub_24550D7A4(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_24550A0A0(_QWORD *a1)
{
  uint64_t *v1;

  sub_245509A68(a1, *v1);
}

uint64_t sub_24550A0B8()
{
  return 0x654D646564616F6CLL;
}

uint64_t sub_24550A0DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x654D646564616F6CLL && a2 == 0xED00006567617373)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_245513FF4();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24550A194()
{
  sub_24550DFD4();
  return sub_2455140B4();
}

uint64_t sub_24550A1BC()
{
  sub_24550DFD4();
  return sub_2455140C0();
}

uint64_t sub_24550A1E4()
{
  sub_24550E018();
  return sub_2455140B4();
}

uint64_t sub_24550A20C()
{
  sub_24550E018();
  return sub_2455140C0();
}

uint64_t sub_24550A234(_QWORD *a1)
{
  return sub_24550E05C(a1);
}

uint64_t sub_24550A248(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EDE0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EDE8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24550DFD4();
  sub_2455140A8();
  sub_24550E018();
  sub_245513F64();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

id sub_24550A384(double a1, double a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(double *)&v5[OBJC_IVAR____TtC5SOSUI23SOSUIWebtRTCDoubleRange_min] = a1;
  *(double *)&v5[OBJC_IVAR____TtC5SOSUI23SOSUIWebtRTCDoubleRange_max] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

double SOSUIWebtRTCDoubleRange.min.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC5SOSUI23SOSUIWebtRTCDoubleRange_min);
}

double SOSUIWebtRTCDoubleRange.max.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC5SOSUI23SOSUIWebtRTCDoubleRange_max);
}

void SOSUIWebtRTCDoubleRange.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_24550A458()
{
  _BYTE *v0;

  if (*v0)
    return 7889261;
  else
    return 7235949;
}

uint64_t sub_24550A47C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2455101F4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24550A4A0()
{
  sub_24550E2D8();
  return sub_2455140B4();
}

uint64_t sub_24550A4C8()
{
  sub_24550E2D8();
  return sub_2455140C0();
}

id SOSUIWebtRTCDoubleRange.__deallocating_deinit()
{
  return sub_24550AAB8(type metadata accessor for SOSUIWebtRTCDoubleRange);
}

uint64_t SOSUIWebtRTCDoubleRange.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EE00);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24550E2D8();
  sub_2455140A8();
  v8[15] = 0;
  sub_245513FB8();
  if (!v1)
  {
    v8[14] = 1;
    sub_245513FB8();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

char *SOSUIWebtRTCDoubleRange.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return SOSUIWebtRTCDoubleRange.init(from:)(a1);
}

char *SOSUIWebtRTCDoubleRange.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  objc_class *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  objc_super v19;
  char v20;

  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EE08);
  v4 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v18 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_24550E2D8();
  v8 = v1;
  v16 = v6;
  sub_245514090();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
    type metadata accessor for SOSUIWebtRTCDoubleRange();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v20 = 0;
    v9 = v16;
    v10 = v17;
    sub_245513F34();
    *(_QWORD *)&v8[OBJC_IVAR____TtC5SOSUI23SOSUIWebtRTCDoubleRange_min] = v11;
    v20 = 1;
    sub_245513F34();
    *(_QWORD *)&v8[OBJC_IVAR____TtC5SOSUI23SOSUIWebtRTCDoubleRange_max] = v13;

    v14 = (objc_class *)type metadata accessor for SOSUIWebtRTCDoubleRange();
    v19.receiver = v8;
    v19.super_class = v14;
    v8 = (char *)objc_msgSendSuper2(&v19, sel_init);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v10);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  }
  return v8;
}

uint64_t sub_24550A818@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 112))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t sub_24550A844()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x68))();
}

id sub_24550A87C(uint64_t a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(_QWORD *)&v3[OBJC_IVAR____TtC5SOSUI24SOSUIWebtRTCCapabilities_zoom] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

void *SOSUIWebtRTCCapabilities.zoom.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC5SOSUI24SOSUIWebtRTCCapabilities_zoom);
  v2 = v1;
  return v1;
}

void SOSUIWebtRTCCapabilities.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_24550A94C()
{
  sub_245514060();
  sub_24551406C();
  return sub_245514078();
}

uint64_t sub_24550A98C()
{
  sub_245514060();
  sub_24551406C();
  return sub_245514078();
}

uint64_t sub_24550A9C8()
{
  return 1836019578;
}

uint64_t sub_24550A9D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 1836019578 && a2 == 0xE400000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_245513FF4();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24550AA5C()
{
  sub_24550E33C();
  return sub_2455140B4();
}

uint64_t sub_24550AA84()
{
  sub_24550E33C();
  return sub_2455140C0();
}

id SOSUIWebtRTCCapabilities.__deallocating_deinit()
{
  return sub_24550AAB8(type metadata accessor for SOSUIWebtRTCCapabilities);
}

id sub_24550AAB8(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t SOSUIWebtRTCCapabilities.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EE18);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24550E33C();
  sub_2455140A8();
  v9[1] = *(_QWORD *)(v2 + OBJC_IVAR____TtC5SOSUI24SOSUIWebtRTCCapabilities_zoom);
  type metadata accessor for SOSUIWebtRTCDoubleRange();
  sub_2455102C4(&qword_25747EE20, type metadata accessor for SOSUIWebtRTCDoubleRange, (uint64_t)&protocol conformance descriptor for SOSUIWebtRTCDoubleRange);
  sub_245513F94();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id SOSUIWebtRTCCapabilities.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return SOSUIWebtRTCCapabilities.init(from:)(a1);
}

id SOSUIWebtRTCCapabilities.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *v12;
  _QWORD v13[2];
  objc_super v14;
  uint64_t v15;

  v13[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EE28);
  v3 = *(_QWORD *)(v13[0] - 8);
  MEMORY[0x24BDAC7A8](v13[0]);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24550E33C();
  v7 = v1;
  v8 = v6;
  v9 = v13[1];
  sub_245514090();
  if (v9)
  {

    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    type metadata accessor for SOSUIWebtRTCCapabilities();
    swift_deallocPartialClassInstance();
  }
  else
  {
    type metadata accessor for SOSUIWebtRTCDoubleRange();
    sub_2455102C4(&qword_25747EE30, type metadata accessor for SOSUIWebtRTCDoubleRange, (uint64_t)&protocol conformance descriptor for SOSUIWebtRTCDoubleRange);
    v10 = v13[0];
    sub_245513F10();
    *(_QWORD *)&v7[OBJC_IVAR____TtC5SOSUI24SOSUIWebtRTCCapabilities_zoom] = v15;

    v12 = (objc_class *)type metadata accessor for SOSUIWebtRTCCapabilities();
    v14.receiver = v7;
    v14.super_class = v12;
    v8 = objc_msgSendSuper2(&v14, sel_init);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v10);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v8;
}

uint64_t sub_24550AE10(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  uint64_t v15;

  v3 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245514084();
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1(v14, v15);
    v4 = sub_24551400C();
    v7 = v4;
    v8 = v5;
    v9 = v4 == 0x646F6F676C6C6163 && v5 == 0xE800000000000000;
    if (v9 || (sub_245513FF4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v3 = 1;
LABEL_11:
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
      return v3;
    }
    if (v7 == 0x737561706C6C6163 && v8 == 0xEA00000000006465 || (sub_245513FF4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v3 = 2;
      goto LABEL_11;
    }
    if (v7 == 0x726F6F706C6C6163 && v8 == 0xE800000000000000 || (sub_245513FF4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v3 = 3;
      goto LABEL_11;
    }
    if (v7 == 1701602409 && v8 == 0xE400000000000000 || (sub_245513FF4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v3 = 4;
      goto LABEL_11;
    }
    if (v7 == 0x77656976657270 && v8 == 0xE700000000000000 || (sub_245513FF4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v3 = 5;
      goto LABEL_11;
    }
    if (v7 == 0x7272656C61746166 && v8 == 0xEA0000000000726FLL || (sub_245513FF4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v3 = 6;
      goto LABEL_11;
    }
    if (v7 == 0x697463656E6E6F63 && v8 == 0xEA0000000000676ELL || (sub_245513FF4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v3 = 7;
      goto LABEL_11;
    }
    if (v7 == 0x6465646E65 && v8 == 0xE500000000000000)
    {
      swift_bridgeObjectRelease();
LABEL_40:
      v3 = 8;
      goto LABEL_11;
    }
    v10 = sub_245513FF4();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      goto LABEL_40;
    v11 = sub_245513E8C();
    swift_allocError();
    v13 = v12;
    v3 = (uint64_t)__swift_project_boxed_opaque_existential_1(v14, v15);
    sub_245514000();
    sub_245513E80();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v13, *MEMORY[0x24BEE26D8], v11);
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

unint64_t sub_24550B280(unint64_t result)
{
  if (result > 8)
    return 0;
  return result;
}

uint64_t sub_24550B290(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  uint64_t v15;

  v3 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245514084();
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1(v14, v15);
    v4 = sub_24551400C();
    v7 = v4;
    v8 = v5;
    v9 = v4 == 1919251317 && v5 == 0xE400000000000000;
    if (v9 || (sub_245513FF4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v3 = 0;
LABEL_12:
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
      return v3;
    }
    if (v7 == 0x6D6E6F7269766E65 && v8 == 0xEB00000000746E65)
    {
      swift_bridgeObjectRelease();
LABEL_17:
      v3 = 1;
      goto LABEL_12;
    }
    v10 = sub_245513FF4();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      goto LABEL_17;
    v11 = sub_245513E8C();
    swift_allocError();
    v13 = v12;
    v3 = (uint64_t)__swift_project_boxed_opaque_existential_1(v14, v15);
    sub_245514000();
    sub_245513E80();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v13, *MEMORY[0x24BEE26D8], v11);
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

uint64_t sub_24550B4C4(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  uint64_t v15;

  v3 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245514084();
  if (!v1)
  {
    __swift_project_boxed_opaque_existential_1(v14, v15);
    v4 = sub_24551400C();
    v7 = v4;
    v8 = v5;
    v9 = v4 == 0x6E6F69746F6DLL && v5 == 0xE600000000000000;
    if (v9 || (sub_245513FF4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v3 = 0;
LABEL_11:
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
      return v3;
    }
    if (v7 == 0x6C6961746564 && v8 == 0xE600000000000000 || (sub_245513FF4() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v3 = 1;
      goto LABEL_11;
    }
    if (v7 == 0x6465636E616C6162 && v8 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease();
LABEL_20:
      v3 = 2;
      goto LABEL_11;
    }
    v10 = sub_245513FF4();
    swift_bridgeObjectRelease();
    if ((v10 & 1) != 0)
      goto LABEL_20;
    v11 = sub_245513E8C();
    swift_allocError();
    v13 = v12;
    v3 = (uint64_t)__swift_project_boxed_opaque_existential_1(v14, v15);
    sub_245514000();
    sub_245513E80();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v13, *MEMORY[0x24BEE26D8], v11);
    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

uint64_t type metadata accessor for SOSUIWebRTCState()
{
  return objc_opt_self();
}

unint64_t sub_24550B764()
{
  unint64_t result;

  result = qword_25747F1A0;
  if (!qword_25747F1A0)
  {
    result = MEMORY[0x249536E14](&unk_245516494, &type metadata for SOSUIWebRTCState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F1A0);
  }
  return result;
}

unint64_t sub_24550B7A8()
{
  unint64_t result;

  result = qword_25747EC60;
  if (!qword_25747EC60)
  {
    result = MEMORY[0x249536E14](&protocol conformance descriptor for SOSUIWebRTCStateName, &type metadata for SOSUIWebRTCStateName);
    atomic_store(result, (unint64_t *)&qword_25747EC60);
  }
  return result;
}

unint64_t sub_24550B7EC()
{
  unint64_t result;

  result = qword_25747EC68;
  if (!qword_25747EC68)
  {
    result = MEMORY[0x249536E14](&protocol conformance descriptor for SOSUIWebRTCCameraFacing, &type metadata for SOSUIWebRTCCameraFacing);
    atomic_store(result, (unint64_t *)&qword_25747EC68);
  }
  return result;
}

uint64_t type metadata accessor for SOSUIWebRTCErrorMessage()
{
  return objc_opt_self();
}

unint64_t sub_24550B850()
{
  unint64_t result;

  result = qword_25747EC80;
  if (!qword_25747EC80)
  {
    result = MEMORY[0x249536E14](&protocol conformance descriptor for SOSUIWebRTCStateName, &type metadata for SOSUIWebRTCStateName);
    atomic_store(result, (unint64_t *)&qword_25747EC80);
  }
  return result;
}

unint64_t sub_24550B894()
{
  unint64_t result;

  result = qword_25747EC88;
  if (!qword_25747EC88)
  {
    result = MEMORY[0x249536E14](&protocol conformance descriptor for SOSUIWebRTCCameraFacing, &type metadata for SOSUIWebRTCCameraFacing);
    atomic_store(result, (unint64_t *)&qword_25747EC88);
  }
  return result;
}

unint64_t sub_24550B8D8()
{
  unint64_t result;

  result = qword_25747F1A8;
  if (!qword_25747F1A8)
  {
    result = MEMORY[0x249536E14](&unk_245516444, &type metadata for SOSUIWebRTCConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F1A8);
  }
  return result;
}

uint64_t sub_24550B91C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747ECA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_24550B964()
{
  unint64_t result;

  result = qword_25747ECA8;
  if (!qword_25747ECA8)
  {
    result = MEMORY[0x249536E14](&protocol conformance descriptor for SOSUIWebRTCVideoPreference, &type metadata for SOSUIWebRTCVideoPreference);
    atomic_store(result, (unint64_t *)&qword_25747ECA8);
  }
  return result;
}

uint64_t sub_24550B9A8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6574617473 && a2 == 0xE500000000000000;
  if (v2 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x657463656E6E6F63 && a2 == 0xE900000000000064 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x697463656E6E6F63 && a2 == 0xEA0000000000676ELL || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x78456172656D6163 && a2 == 0xEC00000073747369 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x63416172656D6163 && a2 == 0xEC00000065766974 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x61466172656D6163 && a2 == 0xEC000000676E6963 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6576654C6D6F6F7ALL && a2 == 0xE90000000000006CLL || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6863726F74 && a2 == 0xE500000000000000 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x726F727265 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    v6 = sub_245513FF4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

uint64_t sub_24550BDA0(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000017 && a2 == 0x80000002455172C0 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000019 && a2 == 0x80000002455172E0 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000245517300 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000245517320 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x426D756D696E696DLL && a2 == 0xEE00657461727469 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x426D756D6978616DLL && a2 == 0xEE00657461727469 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6572506F65646976 && a2 == 0xEF65636E65726566 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x7453646573756170 && a2 == 0xEC000000676E6972 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6E6F436775626564 && a2 == 0xEF6E6F697463656ELL || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0x746152656D617266 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else
  {
    v5 = sub_245513FF4();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 9;
    else
      return 10;
  }
}

uint64_t sub_24550C230@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  char v11;
  char v12;
  uint64_t v13;
  char v14;
  char v15;
  int v16;
  int v17;
  int v18;
  char v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  _QWORD *v52;
  char v53;
  char v54;
  char v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;
  char v61;
  uint64_t v62;
  unsigned __int8 v63;
  _BYTE v64[7];
  uint64_t v65;
  char v66;
  _BYTE v67[7];
  uint64_t v68;
  char v69;
  _BYTE v70[7];
  uint64_t v71;
  char v72;
  _BYTE v73[7];
  uint64_t v74;
  char v75;
  _BYTE v76[7];
  uint64_t v77;
  char v78;
  _BYTE v79[7];
  uint64_t v80;
  char v81;
  _BYTE v82[7];
  uint64_t v83;
  uint64_t v84;
  char v85;
  _BYTE v86[7];
  uint64_t v87;
  char v88;
  char v89;
  _BYTE v90[7];
  _BYTE v91[7];
  char v92;
  _BYTE v93[7];
  char v94;
  _BYTE v95[7];
  char v96;
  _BYTE v97[7];
  char v98;
  _BYTE v99[7];
  char v100;
  _BYTE v101[7];
  char v102;
  _BYTE v103[7];
  char v104;
  uint64_t v105;

  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EFE0);
  v5 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = 1;
  v102 = 1;
  v100 = 1;
  v98 = 1;
  v96 = 1;
  v94 = 1;
  v92 = 1;
  v89 = 1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24550B8D8();
  v48 = v7;
  sub_245514090();
  v52 = a1;
  if (v2)
  {
    v105 = v2;
    v51 = 0;
    v50 = 2;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v52);
    v62 = 0;
    v63 = v104;
    *(_DWORD *)v64 = *(_DWORD *)v103;
    *(_DWORD *)&v64[3] = *(_DWORD *)&v103[3];
    v65 = 0;
    v66 = v102;
    *(_DWORD *)v67 = *(_DWORD *)v101;
    *(_DWORD *)&v67[3] = *(_DWORD *)&v101[3];
    v68 = 0;
    v69 = v100;
    *(_DWORD *)&v70[3] = *(_DWORD *)&v99[3];
    *(_DWORD *)v70 = *(_DWORD *)v99;
    v71 = 0;
    v72 = v98;
    *(_DWORD *)v73 = *(_DWORD *)v97;
    *(_DWORD *)&v73[3] = *(_DWORD *)&v97[3];
    v74 = 0;
    v75 = v96;
    *(_DWORD *)v76 = *(_DWORD *)v95;
    *(_DWORD *)&v76[3] = *(_DWORD *)&v95[3];
    v77 = 0;
    v78 = v94;
    *(_DWORD *)&v79[3] = *(_DWORD *)&v93[3];
    *(_DWORD *)v79 = *(_DWORD *)v93;
    v80 = 0;
    v81 = v92;
    *(_DWORD *)&v82[3] = *(_DWORD *)&v91[3];
    *(_DWORD *)v82 = *(_DWORD *)v91;
    v83 = v51;
    v84 = 0;
    v85 = v50;
    *(_DWORD *)v86 = *(_DWORD *)v90;
    *(_DWORD *)&v86[3] = *(_DWORD *)&v90[3];
    v87 = 0;
    v88 = v89;
    return sub_2455040AC((uint64_t)&v62);
  }
  else
  {
    v8 = v5;
    LOBYTE(v62) = 0;
    v9 = sub_245513F04();
    v12 = v11;
    v47 = v9;
    v104 = v11 & 1;
    LOBYTE(v62) = 1;
    v13 = sub_245513F04();
    v15 = v14;
    v46 = v13;
    v102 = v14 & 1;
    LOBYTE(v62) = 2;
    v45 = sub_245513F04();
    v100 = v16 & 1;
    LOBYTE(v62) = 3;
    v44 = v16;
    v43 = sub_245513F04();
    v98 = v17 & 1;
    LOBYTE(v62) = 4;
    v18 = v17;
    v42 = sub_245513F04();
    v41 = v18;
    v96 = v19 & 1;
    LOBYTE(v62) = 5;
    LOBYTE(v18) = v19;
    v40 = sub_245513F04();
    v94 = v20 & 1;
    v61 = 6;
    v21 = v20;
    sub_245510300();
    sub_245513F10();
    v39 = v21;
    v22 = v62;
    v38 = v63;
    v92 = v63;
    LOBYTE(v62) = 7;
    v23 = sub_245513EEC();
    v25 = v24;
    v51 = v23;
    LOBYTE(v62) = 8;
    swift_bridgeObjectRetain();
    v26 = sub_245513EF8();
    v105 = 0;
    v50 = v26;
    v37 = v25;
    v61 = 9;
    v36 = sub_245513F04();
    v105 = 0;
    v28 = v27;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v48, v49);
    v89 = v28 & 1;
    v60 = v12 & 1;
    v59 = v15 & 1;
    v58 = v44 & 1;
    v57 = v41 & 1;
    v56 = v18 & 1;
    v55 = v39 & 1;
    v54 = v38;
    v53 = v28 & 1;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v52);
    v29 = v47;
    v62 = v47;
    v63 = v104;
    *(_DWORD *)v64 = *(_DWORD *)v103;
    *(_DWORD *)&v64[3] = *(_DWORD *)&v103[3];
    v65 = v46;
    v66 = v102;
    *(_DWORD *)v67 = *(_DWORD *)v101;
    *(_DWORD *)&v67[3] = *(_DWORD *)&v101[3];
    v68 = v45;
    v69 = v100;
    *(_DWORD *)&v70[3] = *(_DWORD *)&v99[3];
    *(_DWORD *)v70 = *(_DWORD *)v99;
    v71 = v43;
    v72 = v98;
    *(_DWORD *)v73 = *(_DWORD *)v97;
    *(_DWORD *)&v73[3] = *(_DWORD *)&v97[3];
    v74 = v42;
    v75 = v96;
    *(_DWORD *)v76 = *(_DWORD *)v95;
    *(_DWORD *)&v76[3] = *(_DWORD *)&v95[3];
    v30 = v40;
    v77 = v40;
    v78 = v94;
    *(_DWORD *)&v79[3] = *(_DWORD *)&v93[3];
    *(_DWORD *)v79 = *(_DWORD *)v93;
    v80 = v22;
    v81 = v92;
    *(_DWORD *)&v82[3] = *(_DWORD *)&v91[3];
    *(_DWORD *)v82 = *(_DWORD *)v91;
    v31 = v51;
    v32 = v36;
    v33 = v37;
    v83 = v51;
    v84 = v37;
    v34 = v50;
    v85 = v50;
    *(_DWORD *)v86 = *(_DWORD *)v90;
    *(_DWORD *)&v86[3] = *(_DWORD *)&v90[3];
    v87 = v36;
    v88 = v89;
    result = sub_2455040AC((uint64_t)&v62);
    *(_QWORD *)a2 = v29;
    *(_BYTE *)(a2 + 8) = v60;
    *(_QWORD *)(a2 + 16) = v46;
    *(_BYTE *)(a2 + 24) = v59;
    *(_QWORD *)(a2 + 32) = v45;
    *(_BYTE *)(a2 + 40) = v58;
    *(_QWORD *)(a2 + 48) = v43;
    *(_BYTE *)(a2 + 56) = v57;
    *(_QWORD *)(a2 + 64) = v42;
    *(_BYTE *)(a2 + 72) = v56;
    *(_QWORD *)(a2 + 80) = v30;
    *(_BYTE *)(a2 + 88) = v55;
    *(_QWORD *)(a2 + 96) = v22;
    *(_BYTE *)(a2 + 104) = v54;
    *(_QWORD *)(a2 + 112) = v31;
    *(_QWORD *)(a2 + 120) = v33;
    *(_BYTE *)(a2 + 128) = v34;
    *(_QWORD *)(a2 + 136) = v32;
    *(_BYTE *)(a2 + 144) = v53;
  }
  return result;
}

unint64_t sub_24550CA14()
{
  unint64_t result;

  result = qword_25747F1B0;
  if (!qword_25747F1B0)
  {
    result = MEMORY[0x249536E14](&unk_2455163F4, &type metadata for SOSUIWebRTCErrorMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F1B0);
  }
  return result;
}

uint64_t type metadata accessor for SOSUIWebRTCQualityMessage()
{
  return objc_opt_self();
}

unint64_t sub_24550CA78()
{
  unint64_t result;

  result = qword_25747F1B8;
  if (!qword_25747F1B8)
  {
    result = MEMORY[0x249536E14](&unk_2455163A4, &type metadata for SOSUIWebRTCQualityMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F1B8);
  }
  return result;
}

uint64_t type metadata accessor for SOSUIWebRTCLogMessage()
{
  return objc_opt_self();
}

unint64_t sub_24550CADC()
{
  unint64_t result;

  result = qword_25747F1C0;
  if (!qword_25747F1C0)
  {
    result = MEMORY[0x249536E14](&unk_245516354, &type metadata for SOSUIWebRTCLogMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F1C0);
  }
  return result;
}

uint64_t type metadata accessor for SOSUIWebRTCConnectionInfoMessage()
{
  return objc_opt_self();
}

unint64_t sub_24550CB40()
{
  unint64_t result;

  result = qword_25747F1C8;
  if (!qword_25747F1C8)
  {
    result = MEMORY[0x249536E14](&unk_245516304, &type metadata for SOSUIWebRTCConnectionInfoMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F1C8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249536E08](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24550CBC8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25747ED68);
    v8 = a2;
    result = MEMORY[0x249536E14](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24550CC28()
{
  unint64_t result;

  result = qword_25747F1D0;
  if (!qword_25747F1D0)
  {
    result = MEMORY[0x249536E14](&unk_2455162B4, &type metadata for SOSUIWebRTCMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F1D0);
  }
  return result;
}

unint64_t sub_24550CC6C()
{
  unint64_t result;

  result = qword_25747F1D8;
  if (!qword_25747F1D8)
  {
    result = MEMORY[0x249536E14](&unk_245516264, &type metadata for SOSUIWebRTCMessage.ConnectedMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F1D8);
  }
  return result;
}

unint64_t sub_24550CCB0()
{
  unint64_t result;

  result = qword_25747F1E0;
  if (!qword_25747F1E0)
  {
    result = MEMORY[0x249536E14](&unk_245516214, &type metadata for SOSUIWebRTCMessage.LogMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F1E0);
  }
  return result;
}

unint64_t sub_24550CCF4()
{
  unint64_t result;

  result = qword_25747F1E8;
  if (!qword_25747F1E8)
  {
    result = MEMORY[0x249536E14](&unk_2455161C4, &type metadata for SOSUIWebRTCMessage.CallLostMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F1E8);
  }
  return result;
}

unint64_t sub_24550CD38()
{
  unint64_t result;

  result = qword_25747F1F0;
  if (!qword_25747F1F0)
  {
    result = MEMORY[0x249536E14](&unk_245516174, &type metadata for SOSUIWebRTCMessage.QualityMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F1F0);
  }
  return result;
}

unint64_t sub_24550CD7C()
{
  unint64_t result;

  result = qword_25747F1F8;
  if (!qword_25747F1F8)
  {
    result = MEMORY[0x249536E14](&unk_245516124, &type metadata for SOSUIWebRTCMessage.ErrorMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F1F8);
  }
  return result;
}

unint64_t sub_24550CDC0()
{
  unint64_t result;

  result = qword_25747F200;
  if (!qword_25747F200)
  {
    result = MEMORY[0x249536E14](&unk_2455160D4, &type metadata for SOSUIWebRTCMessage.StateMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F200);
  }
  return result;
}

uint64_t sub_24550CE04(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x726F727265 && a2 == 0xE500000000000000;
  if (v2 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x646F43726F727265 && a2 == 0xE900000000000065 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6B63617473 && a2 == 0xE500000000000000 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746174537473616CLL && a2 == 0xE900000000000065 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C62617972746572 && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_245513FF4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_24550D02C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x65746172746962 && a2 == 0xE700000000000000;
  if (v2 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000245517180 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6F4C74656B636170 && a2 == 0xEA00000000007373 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000002455171A0 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x655073656D617266 && a2 == 0xEF646E6F63655372 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x72657474696ALL && a2 == 0xE600000000000000 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x697463656E6E6F63 && a2 == 0xEE00726F6F506E6FLL || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6E65537365747962 && a2 == 0xE900000000000074)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v6 = sub_245513FF4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t sub_24550D3C0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6C6576656CLL && a2 == 0xE500000000000000;
  if (v2 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6567617373656DLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_245513FF4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_24550D4A8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x73654D6574617473 && a2 == 0xEC00000065676173;
  if (v2 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73654D726F727265 && a2 == 0xEC00000065676173 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4D7974696C617571 && a2 == 0xEE00656761737365 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x74736F4C6C6C6163 && a2 == 0xEF6567617373654DLL || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x617373654D676F6CLL && a2 == 0xEA00000000006567 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000010 && a2 == 0x8000000245517340)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_245513FF4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_24550D7A4(_QWORD *a1)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v24[9];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  char *v35;

  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EF88);
  v27 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v33 = (char *)v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EF90);
  v26 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v31 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EF98);
  v24[5] = *(_QWORD *)(v4 - 8);
  v24[6] = v4;
  MEMORY[0x24BDAC7A8](v4);
  v29 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EFA0);
  v24[7] = *(_QWORD *)(v6 - 8);
  v24[8] = v6;
  MEMORY[0x24BDAC7A8](v6);
  v30 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EFA8);
  v24[3] = *(_QWORD *)(v8 - 8);
  v24[4] = v8;
  MEMORY[0x24BDAC7A8](v8);
  v28 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EFB0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EFB8);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1[3];
  v34 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_24550CC28();
  v19 = v35;
  sub_245514090();
  if (!v19)
  {
    v35 = v13;
    v24[1] = v11;
    v24[2] = v10;
    v20 = sub_245513F58();
    if (*(_QWORD *)(v20 + 16) == 1)
      __asm { BR              X10 }
    v18 = sub_245513E8C();
    swift_allocError();
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25747EF80);
    *v22 = &type metadata for SOSUIWebRTCMessage;
    sub_245513EE0();
    sub_245513E80();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v22, *MEMORY[0x24BEE26D0], v18);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v34);
  return v18;
}

unint64_t sub_24550DFD4()
{
  unint64_t result;

  result = qword_25747F208;
  if (!qword_25747F208)
  {
    result = MEMORY[0x249536E14](&unk_245516084, &type metadata for SOSUIWebRTCInternalMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F208);
  }
  return result;
}

unint64_t sub_24550E018()
{
  unint64_t result;

  result = qword_25747F210;
  if (!qword_25747F210)
  {
    result = MEMORY[0x249536E14](&unk_245516034, &type metadata for SOSUIWebRTCInternalMessage.LoadedMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F210);
  }
  return result;
}

uint64_t sub_24550E05C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EF70);
  v2 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EF78);
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24550DFD4();
  v8 = v23;
  sub_245514090();
  if (v8)
    goto LABEL_7;
  v20 = a1;
  v23 = v5;
  v10 = v21;
  v9 = v22;
  if (*(_QWORD *)(sub_245513F58() + 16) != 1)
  {
    v14 = sub_245513E8C();
    swift_allocError();
    v16 = v15;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25747EF80);
    *v16 = &type metadata for SOSUIWebRTCInternalMessage;
    sub_245513EE0();
    sub_245513E80();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x24BEE26D0], v14);
    swift_willThrow();
    v17 = v23;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v7, v9);
    a1 = v20;
LABEL_7:
    v13 = (uint64_t)a1;
    return __swift_destroy_boxed_opaque_existential_0(v13);
  }
  sub_24550E018();
  v11 = v4;
  sub_245513ED4();
  v12 = v23;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v10);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
  v13 = (uint64_t)v20;
  return __swift_destroy_boxed_opaque_existential_0(v13);
}

uint64_t type metadata accessor for SOSUIWebtRTCDoubleRange()
{
  return objc_opt_self();
}

unint64_t sub_24550E2D8()
{
  unint64_t result;

  result = qword_25747F218;
  if (!qword_25747F218)
  {
    result = MEMORY[0x249536E14](&unk_245515FE4, &type metadata for SOSUIWebtRTCDoubleRange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25747F218);
  }
  return result;
}

uint64_t type metadata accessor for SOSUIWebtRTCCapabilities()
{
  return objc_opt_self();
}

unint64_t sub_24550E33C()
{
  unint64_t result;

  result = qword_25747F220[0];
  if (!qword_25747F220[0])
  {
    result = MEMORY[0x249536E14](&unk_245515F94, &type metadata for SOSUIWebtRTCCapabilities.CodingKeys);
    atomic_store(result, qword_25747F220);
  }
  return result;
}

unint64_t sub_24550E384()
{
  unint64_t result;

  result = qword_25747EE38;
  if (!qword_25747EE38)
  {
    result = MEMORY[0x249536E14](&protocol conformance descriptor for SOSUIWebRTCStateName, &type metadata for SOSUIWebRTCStateName);
    atomic_store(result, (unint64_t *)&qword_25747EE38);
  }
  return result;
}

unint64_t sub_24550E3CC()
{
  unint64_t result;

  result = qword_25747EE40;
  if (!qword_25747EE40)
  {
    result = MEMORY[0x249536E14](&protocol conformance descriptor for SOSUIWebRTCCameraFacing, &type metadata for SOSUIWebRTCCameraFacing);
    atomic_store(result, (unint64_t *)&qword_25747EE40);
  }
  return result;
}

unint64_t sub_24550E414()
{
  unint64_t result;

  result = qword_25747EE48;
  if (!qword_25747EE48)
  {
    result = MEMORY[0x249536E14](&protocol conformance descriptor for SOSUIWebRTCVideoPreference, &type metadata for SOSUIWebRTCVideoPreference);
    atomic_store(result, (unint64_t *)&qword_25747EE48);
  }
  return result;
}

unint64_t sub_24550E45C()
{
  unint64_t result;

  result = qword_25747EE50;
  if (!qword_25747EE50)
  {
    result = MEMORY[0x249536E14](&unk_245515034, &type metadata for SOSUIWebRTCInternalMessage);
    atomic_store(result, (unint64_t *)&qword_25747EE50);
  }
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCStateName()
{
  return &type metadata for SOSUIWebRTCStateName;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCCameraFacing()
{
  return &type metadata for SOSUIWebRTCCameraFacing;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCVideoPreference()
{
  return &type metadata for SOSUIWebRTCVideoPreference;
}

uint64_t initializeBufferWithCopyOfBuffer for SOSUIWebRTCConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SOSUIWebRTCConfiguration()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SOSUIWebRTCConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v3 = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v3;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  v4 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v4;
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  v5 = *(_QWORD *)(a2 + 136);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = v5;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SOSUIWebRTCConfiguration(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *a2;
  *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)a1 = v4;
  v5 = a2[2];
  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  v6 = a2[4];
  *(_BYTE *)(a1 + 40) = *((_BYTE *)a2 + 40);
  *(_QWORD *)(a1 + 32) = v6;
  v7 = a2[6];
  *(_BYTE *)(a1 + 56) = *((_BYTE *)a2 + 56);
  *(_QWORD *)(a1 + 48) = v7;
  v8 = a2[8];
  *(_BYTE *)(a1 + 72) = *((_BYTE *)a2 + 72);
  *(_QWORD *)(a1 + 64) = v8;
  v9 = a2[10];
  *(_BYTE *)(a1 + 88) = *((_BYTE *)a2 + 88);
  *(_QWORD *)(a1 + 80) = v9;
  v10 = a2[12];
  *(_BYTE *)(a1 + 104) = *((_BYTE *)a2 + 104);
  *(_QWORD *)(a1 + 96) = v10;
  *(_QWORD *)(a1 + 112) = a2[14];
  *(_QWORD *)(a1 + 120) = a2[15];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 128) = *((_BYTE *)a2 + 128);
  v11 = a2[17];
  *(_BYTE *)(a1 + 144) = *((_BYTE *)a2 + 144);
  *(_QWORD *)(a1 + 136) = v11;
  return a1;
}

__n128 __swift_memcpy145_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t assignWithTake for SOSUIWebRTCConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v4 = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v4;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  v5 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  return a1;
}

uint64_t getEnumTagSinglePayload for SOSUIWebRTCConfiguration(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 145))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 120);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SOSUIWebRTCConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 144) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 145) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 145) = 0;
    if (a2)
      *(_QWORD *)(result + 120) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCConfiguration()
{
  return &type metadata for SOSUIWebRTCConfiguration;
}

unint64_t *initializeBufferWithCopyOfBuffer for SOSUIWebRTCMessage(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  sub_245504104(*a2);
  *a1 = v3;
  return a1;
}

void destroy for SOSUIWebRTCMessage(unint64_t *a1)
{
  sub_2455040D4(*a1);
}

unint64_t *assignWithCopy for SOSUIWebRTCMessage(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  sub_245504104(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_2455040D4(v4);
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

unint64_t *assignWithTake for SOSUIWebRTCMessage(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_2455040D4(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for SOSUIWebRTCMessage(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7B && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 123);
  v3 = (((*(_QWORD *)a1 >> 57) >> 4) | (8 * ((*(_QWORD *)a1 >> 57) & 8 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7A)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for SOSUIWebRTCMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7A)
  {
    *(_QWORD *)result = a2 - 123;
    if (a3 >= 0x7B)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7B)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 3) & 0xF | (16 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_24550E9C0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 61;
  if (v1 <= 4)
    return v1;
  else
    return (*a1 >> 3) + 5;
}

_QWORD *sub_24550E9DC(_QWORD *result)
{
  *result &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_24550E9EC(unint64_t *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  if (a2 < 5)
  {
    v2 = *result & 0xFFFFFFFFFFFFFF8;
    v3 = a2 << 61;
  }
  else
  {
    v2 = 8 * (a2 - 5);
    v3 = 0xA000000000000000;
  }
  *result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage()
{
  return &type metadata for SOSUIWebRTCMessage;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCInternalMessage()
{
  return &type metadata for SOSUIWebRTCInternalMessage;
}

ValueMetadata *type metadata accessor for SOSUIWebtRTCCapabilities.CodingKeys()
{
  return &type metadata for SOSUIWebtRTCCapabilities.CodingKeys;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebtRTCDoubleRange.CodingKeys()
{
  return &type metadata for SOSUIWebtRTCDoubleRange.CodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCInternalMessage.CodingKeys()
{
  return &type metadata for SOSUIWebRTCInternalMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCInternalMessage.LoadedMessageCodingKeys()
{
  return &type metadata for SOSUIWebRTCInternalMessage.LoadedMessageCodingKeys;
}

uint64_t getEnumTagSinglePayload for SOSUIWebRTCMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SOSUIWebRTCMessage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24550EB78 + 4 * byte_245514AF0[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_24550EBAC + 4 * byte_245514AEB[v4]))();
}

uint64_t sub_24550EBAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24550EBB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24550EBBCLL);
  return result;
}

uint64_t sub_24550EBC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24550EBD0);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_24550EBD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24550EBDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage.CodingKeys()
{
  return &type metadata for SOSUIWebRTCMessage.CodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage.StateMessageCodingKeys()
{
  return &type metadata for SOSUIWebRTCMessage.StateMessageCodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage.ErrorMessageCodingKeys()
{
  return &type metadata for SOSUIWebRTCMessage.ErrorMessageCodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage.QualityMessageCodingKeys()
{
  return &type metadata for SOSUIWebRTCMessage.QualityMessageCodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage.CallLostMessageCodingKeys()
{
  return &type metadata for SOSUIWebRTCMessage.CallLostMessageCodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage.LogMessageCodingKeys()
{
  return &type metadata for SOSUIWebRTCMessage.LogMessageCodingKeys;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCMessage.ConnectedMessageCodingKeys()
{
  return &type metadata for SOSUIWebRTCMessage.ConnectedMessageCodingKeys;
}

uint64_t _s5SOSUI26SOSUIWebRTCInternalMessageOwet_0(unsigned int *a1, int a2)
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

uint64_t _s5SOSUI26SOSUIWebRTCInternalMessageOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24550ECE8 + 4 * byte_245514AF5[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24550ED08 + 4 * byte_245514AFA[v4]))();
}

_BYTE *sub_24550ECE8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24550ED08(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24550ED10(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24550ED18(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24550ED20(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24550ED28(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCConnectionInfoMessage.CodingKeys()
{
  return &type metadata for SOSUIWebRTCConnectionInfoMessage.CodingKeys;
}

uint64_t _s5SOSUI23SOSUIWebtRTCDoubleRangeC10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s5SOSUI23SOSUIWebtRTCDoubleRangeC10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24550EE20 + 4 * byte_245514B04[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24550EE54 + 4 * byte_245514AFF[v4]))();
}

uint64_t sub_24550EE54(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24550EE5C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24550EE64);
  return result;
}

uint64_t sub_24550EE70(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24550EE78);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24550EE7C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24550EE84(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24550EE90(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24550EE98(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCLogMessage.CodingKeys()
{
  return &type metadata for SOSUIWebRTCLogMessage.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SOSUIWebRTCQualityMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SOSUIWebRTCQualityMessage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24550EF90 + 4 * byte_245514B0E[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_24550EFC4 + 4 * byte_245514B09[v4]))();
}

uint64_t sub_24550EFC4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24550EFCC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24550EFD4);
  return result;
}

uint64_t sub_24550EFE0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24550EFE8);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_24550EFEC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24550EFF4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCQualityMessage.CodingKeys()
{
  return &type metadata for SOSUIWebRTCQualityMessage.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SOSUIWebRTCErrorMessage.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SOSUIWebRTCErrorMessage.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24550F0EC + 4 * byte_245514B18[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24550F120 + 4 * byte_245514B13[v4]))();
}

uint64_t sub_24550F120(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24550F128(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24550F130);
  return result;
}

uint64_t sub_24550F13C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24550F144);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_24550F148(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24550F150(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCErrorMessage.CodingKeys()
{
  return &type metadata for SOSUIWebRTCErrorMessage.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SOSUIWebRTCConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SOSUIWebRTCConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_24550F248 + 4 * byte_245514B22[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_24550F27C + 4 * byte_245514B1D[v4]))();
}

uint64_t sub_24550F27C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24550F284(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24550F28CLL);
  return result;
}

uint64_t sub_24550F298(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24550F2A0);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_24550F2A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24550F2AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCConfiguration.CodingKeys()
{
  return &type metadata for SOSUIWebRTCConfiguration.CodingKeys;
}

uint64_t getEnumTagSinglePayload for SOSUIWebRTCState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SOSUIWebRTCState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24550F3A4 + 4 * byte_245514B2C[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_24550F3D8 + 4 * byte_245514B27[v4]))();
}

uint64_t sub_24550F3D8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24550F3E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24550F3E8);
  return result;
}

uint64_t sub_24550F3F4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24550F3FCLL);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_24550F400(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24550F408(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_24550F414(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SOSUIWebRTCState.CodingKeys()
{
  return &type metadata for SOSUIWebRTCState.CodingKeys;
}

unint64_t sub_24550F430()
{
  unint64_t result;

  result = qword_2574805B0[0];
  if (!qword_2574805B0[0])
  {
    result = MEMORY[0x249536E14](&unk_2455154BC, &type metadata for SOSUIWebRTCState.CodingKeys);
    atomic_store(result, qword_2574805B0);
  }
  return result;
}

unint64_t sub_24550F478()
{
  unint64_t result;

  result = qword_2574807C0[0];
  if (!qword_2574807C0[0])
  {
    result = MEMORY[0x249536E14](&unk_245515574, &type metadata for SOSUIWebRTCConfiguration.CodingKeys);
    atomic_store(result, qword_2574807C0);
  }
  return result;
}

unint64_t sub_24550F4C0()
{
  unint64_t result;

  result = qword_2574809D0[0];
  if (!qword_2574809D0[0])
  {
    result = MEMORY[0x249536E14](&unk_24551562C, &type metadata for SOSUIWebRTCErrorMessage.CodingKeys);
    atomic_store(result, qword_2574809D0);
  }
  return result;
}

unint64_t sub_24550F508()
{
  unint64_t result;

  result = qword_257480BE0[0];
  if (!qword_257480BE0[0])
  {
    result = MEMORY[0x249536E14](&unk_2455156E4, &type metadata for SOSUIWebRTCQualityMessage.CodingKeys);
    atomic_store(result, qword_257480BE0);
  }
  return result;
}

unint64_t sub_24550F550()
{
  unint64_t result;

  result = qword_257480DF0;
  if (!qword_257480DF0)
  {
    result = MEMORY[0x249536E14](&unk_24551579C, &type metadata for SOSUIWebRTCLogMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257480DF0);
  }
  return result;
}

unint64_t sub_24550F598()
{
  unint64_t result;

  result = qword_257481000[0];
  if (!qword_257481000[0])
  {
    result = MEMORY[0x249536E14](&unk_245515854, &type metadata for SOSUIWebRTCConnectionInfoMessage.CodingKeys);
    atomic_store(result, qword_257481000);
  }
  return result;
}

unint64_t sub_24550F5E0()
{
  unint64_t result;

  result = qword_257481210[0];
  if (!qword_257481210[0])
  {
    result = MEMORY[0x249536E14](&unk_24551590C, &type metadata for SOSUIWebRTCMessage.ConnectedMessageCodingKeys);
    atomic_store(result, qword_257481210);
  }
  return result;
}

unint64_t sub_24550F628()
{
  unint64_t result;

  result = qword_257481420[0];
  if (!qword_257481420[0])
  {
    result = MEMORY[0x249536E14](&unk_2455159C4, &type metadata for SOSUIWebRTCMessage.LogMessageCodingKeys);
    atomic_store(result, qword_257481420);
  }
  return result;
}

unint64_t sub_24550F670()
{
  unint64_t result;

  result = qword_257481730[0];
  if (!qword_257481730[0])
  {
    result = MEMORY[0x249536E14](&unk_245515ACC, &type metadata for SOSUIWebRTCMessage.QualityMessageCodingKeys);
    atomic_store(result, qword_257481730);
  }
  return result;
}

unint64_t sub_24550F6B8()
{
  unint64_t result;

  result = qword_257481940[0];
  if (!qword_257481940[0])
  {
    result = MEMORY[0x249536E14](&unk_245515B84, &type metadata for SOSUIWebRTCMessage.ErrorMessageCodingKeys);
    atomic_store(result, qword_257481940);
  }
  return result;
}

unint64_t sub_24550F700()
{
  unint64_t result;

  result = qword_257481B50[0];
  if (!qword_257481B50[0])
  {
    result = MEMORY[0x249536E14](&unk_245515C3C, &type metadata for SOSUIWebRTCMessage.StateMessageCodingKeys);
    atomic_store(result, qword_257481B50);
  }
  return result;
}

unint64_t sub_24550F748()
{
  unint64_t result;

  result = qword_257481D60[0];
  if (!qword_257481D60[0])
  {
    result = MEMORY[0x249536E14](&unk_245515CF4, &type metadata for SOSUIWebRTCMessage.CodingKeys);
    atomic_store(result, qword_257481D60);
  }
  return result;
}

unint64_t sub_24550F790()
{
  unint64_t result;

  result = qword_257482070[0];
  if (!qword_257482070[0])
  {
    result = MEMORY[0x249536E14](&unk_245515DFC, &type metadata for SOSUIWebRTCInternalMessage.CodingKeys);
    atomic_store(result, qword_257482070);
  }
  return result;
}

unint64_t sub_24550F7D8()
{
  unint64_t result;

  result = qword_257482280[0];
  if (!qword_257482280[0])
  {
    result = MEMORY[0x249536E14](&unk_245515EB4, &type metadata for SOSUIWebtRTCDoubleRange.CodingKeys);
    atomic_store(result, qword_257482280);
  }
  return result;
}

unint64_t sub_24550F820()
{
  unint64_t result;

  result = qword_257482490[0];
  if (!qword_257482490[0])
  {
    result = MEMORY[0x249536E14](&unk_245515F6C, &type metadata for SOSUIWebtRTCCapabilities.CodingKeys);
    atomic_store(result, qword_257482490);
  }
  return result;
}

unint64_t sub_24550F868()
{
  unint64_t result;

  result = qword_2574825A0;
  if (!qword_2574825A0)
  {
    result = MEMORY[0x249536E14](&unk_245515EDC, &type metadata for SOSUIWebtRTCCapabilities.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574825A0);
  }
  return result;
}

unint64_t sub_24550F8B0()
{
  unint64_t result;

  result = qword_2574825A8[0];
  if (!qword_2574825A8[0])
  {
    result = MEMORY[0x249536E14](&unk_245515F04, &type metadata for SOSUIWebtRTCCapabilities.CodingKeys);
    atomic_store(result, qword_2574825A8);
  }
  return result;
}

unint64_t sub_24550F8F8()
{
  unint64_t result;

  result = qword_257482630;
  if (!qword_257482630)
  {
    result = MEMORY[0x249536E14](&unk_245515E24, &type metadata for SOSUIWebtRTCDoubleRange.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257482630);
  }
  return result;
}

unint64_t sub_24550F940()
{
  unint64_t result;

  result = qword_257482638[0];
  if (!qword_257482638[0])
  {
    result = MEMORY[0x249536E14](&unk_245515E4C, &type metadata for SOSUIWebtRTCDoubleRange.CodingKeys);
    atomic_store(result, qword_257482638);
  }
  return result;
}

unint64_t sub_24550F988()
{
  unint64_t result;

  result = qword_2574826C0;
  if (!qword_2574826C0)
  {
    result = MEMORY[0x249536E14](&unk_245515D1C, &type metadata for SOSUIWebRTCInternalMessage.LoadedMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574826C0);
  }
  return result;
}

unint64_t sub_24550F9D0()
{
  unint64_t result;

  result = qword_2574826C8[0];
  if (!qword_2574826C8[0])
  {
    result = MEMORY[0x249536E14](&unk_245515D44, &type metadata for SOSUIWebRTCInternalMessage.LoadedMessageCodingKeys);
    atomic_store(result, qword_2574826C8);
  }
  return result;
}

unint64_t sub_24550FA18()
{
  unint64_t result;

  result = qword_257482750;
  if (!qword_257482750)
  {
    result = MEMORY[0x249536E14](&unk_245515D6C, &type metadata for SOSUIWebRTCInternalMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257482750);
  }
  return result;
}

unint64_t sub_24550FA60()
{
  unint64_t result;

  result = qword_257482758[0];
  if (!qword_257482758[0])
  {
    result = MEMORY[0x249536E14](&unk_245515D94, &type metadata for SOSUIWebRTCInternalMessage.CodingKeys);
    atomic_store(result, qword_257482758);
  }
  return result;
}

unint64_t sub_24550FAA8()
{
  unint64_t result;

  result = qword_2574827E0;
  if (!qword_2574827E0)
  {
    result = MEMORY[0x249536E14](&unk_245515BAC, &type metadata for SOSUIWebRTCMessage.StateMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_2574827E0);
  }
  return result;
}

unint64_t sub_24550FAF0()
{
  unint64_t result;

  result = qword_2574827E8[0];
  if (!qword_2574827E8[0])
  {
    result = MEMORY[0x249536E14](&unk_245515BD4, &type metadata for SOSUIWebRTCMessage.StateMessageCodingKeys);
    atomic_store(result, qword_2574827E8);
  }
  return result;
}

unint64_t sub_24550FB38()
{
  unint64_t result;

  result = qword_257482870;
  if (!qword_257482870)
  {
    result = MEMORY[0x249536E14](&unk_245515AF4, &type metadata for SOSUIWebRTCMessage.ErrorMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257482870);
  }
  return result;
}

unint64_t sub_24550FB80()
{
  unint64_t result;

  result = qword_257482878;
  if (!qword_257482878)
  {
    result = MEMORY[0x249536E14](&unk_245515B1C, &type metadata for SOSUIWebRTCMessage.ErrorMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257482878);
  }
  return result;
}

unint64_t sub_24550FBC8()
{
  unint64_t result;

  result = qword_257482900;
  if (!qword_257482900)
  {
    result = MEMORY[0x249536E14](&unk_245515A3C, &type metadata for SOSUIWebRTCMessage.QualityMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257482900);
  }
  return result;
}

unint64_t sub_24550FC10()
{
  unint64_t result;

  result = qword_257482908[0];
  if (!qword_257482908[0])
  {
    result = MEMORY[0x249536E14](&unk_245515A64, &type metadata for SOSUIWebRTCMessage.QualityMessageCodingKeys);
    atomic_store(result, qword_257482908);
  }
  return result;
}

unint64_t sub_24550FC58()
{
  unint64_t result;

  result = qword_257482990;
  if (!qword_257482990)
  {
    result = MEMORY[0x249536E14](&unk_2455159EC, &type metadata for SOSUIWebRTCMessage.CallLostMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257482990);
  }
  return result;
}

unint64_t sub_24550FCA0()
{
  unint64_t result;

  result = qword_257482998[0];
  if (!qword_257482998[0])
  {
    result = MEMORY[0x249536E14](&unk_245515A14, &type metadata for SOSUIWebRTCMessage.CallLostMessageCodingKeys);
    atomic_store(result, qword_257482998);
  }
  return result;
}

unint64_t sub_24550FCE8()
{
  unint64_t result;

  result = qword_257482A20;
  if (!qword_257482A20)
  {
    result = MEMORY[0x249536E14](&unk_245515934, &type metadata for SOSUIWebRTCMessage.LogMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257482A20);
  }
  return result;
}

unint64_t sub_24550FD30()
{
  unint64_t result;

  result = qword_257482A28[0];
  if (!qword_257482A28[0])
  {
    result = MEMORY[0x249536E14](&unk_24551595C, &type metadata for SOSUIWebRTCMessage.LogMessageCodingKeys);
    atomic_store(result, qword_257482A28);
  }
  return result;
}

unint64_t sub_24550FD78()
{
  unint64_t result;

  result = qword_257482AB0;
  if (!qword_257482AB0)
  {
    result = MEMORY[0x249536E14](&unk_24551587C, &type metadata for SOSUIWebRTCMessage.ConnectedMessageCodingKeys);
    atomic_store(result, (unint64_t *)&qword_257482AB0);
  }
  return result;
}

unint64_t sub_24550FDC0()
{
  unint64_t result;

  result = qword_257482AB8[0];
  if (!qword_257482AB8[0])
  {
    result = MEMORY[0x249536E14](&unk_2455158A4, &type metadata for SOSUIWebRTCMessage.ConnectedMessageCodingKeys);
    atomic_store(result, qword_257482AB8);
  }
  return result;
}

unint64_t sub_24550FE08()
{
  unint64_t result;

  result = qword_257482B40;
  if (!qword_257482B40)
  {
    result = MEMORY[0x249536E14](&unk_245515C64, &type metadata for SOSUIWebRTCMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257482B40);
  }
  return result;
}

unint64_t sub_24550FE50()
{
  unint64_t result;

  result = qword_257482B48[0];
  if (!qword_257482B48[0])
  {
    result = MEMORY[0x249536E14](&unk_245515C8C, &type metadata for SOSUIWebRTCMessage.CodingKeys);
    atomic_store(result, qword_257482B48);
  }
  return result;
}

unint64_t sub_24550FE98()
{
  unint64_t result;

  result = qword_257482BD0;
  if (!qword_257482BD0)
  {
    result = MEMORY[0x249536E14](&unk_2455157C4, &type metadata for SOSUIWebRTCConnectionInfoMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257482BD0);
  }
  return result;
}

unint64_t sub_24550FEE0()
{
  unint64_t result;

  result = qword_257482BD8[0];
  if (!qword_257482BD8[0])
  {
    result = MEMORY[0x249536E14](&unk_2455157EC, &type metadata for SOSUIWebRTCConnectionInfoMessage.CodingKeys);
    atomic_store(result, qword_257482BD8);
  }
  return result;
}

unint64_t sub_24550FF28()
{
  unint64_t result;

  result = qword_257482C60;
  if (!qword_257482C60)
  {
    result = MEMORY[0x249536E14](&unk_24551570C, &type metadata for SOSUIWebRTCLogMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257482C60);
  }
  return result;
}

unint64_t sub_24550FF70()
{
  unint64_t result;

  result = qword_257482C68[0];
  if (!qword_257482C68[0])
  {
    result = MEMORY[0x249536E14](&unk_245515734, &type metadata for SOSUIWebRTCLogMessage.CodingKeys);
    atomic_store(result, qword_257482C68);
  }
  return result;
}

unint64_t sub_24550FFB8()
{
  unint64_t result;

  result = qword_257482CF0;
  if (!qword_257482CF0)
  {
    result = MEMORY[0x249536E14](&unk_245515654, &type metadata for SOSUIWebRTCQualityMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257482CF0);
  }
  return result;
}

unint64_t sub_245510000()
{
  unint64_t result;

  result = qword_257482CF8[0];
  if (!qword_257482CF8[0])
  {
    result = MEMORY[0x249536E14](&unk_24551567C, &type metadata for SOSUIWebRTCQualityMessage.CodingKeys);
    atomic_store(result, qword_257482CF8);
  }
  return result;
}

unint64_t sub_245510048()
{
  unint64_t result;

  result = qword_257482D80;
  if (!qword_257482D80)
  {
    result = MEMORY[0x249536E14](&unk_24551559C, &type metadata for SOSUIWebRTCErrorMessage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257482D80);
  }
  return result;
}

unint64_t sub_245510090()
{
  unint64_t result;

  result = qword_257482D88[0];
  if (!qword_257482D88[0])
  {
    result = MEMORY[0x249536E14](&unk_2455155C4, &type metadata for SOSUIWebRTCErrorMessage.CodingKeys);
    atomic_store(result, qword_257482D88);
  }
  return result;
}

unint64_t sub_2455100D8()
{
  unint64_t result;

  result = qword_257482E10;
  if (!qword_257482E10)
  {
    result = MEMORY[0x249536E14](&unk_2455154E4, &type metadata for SOSUIWebRTCConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257482E10);
  }
  return result;
}

unint64_t sub_245510120()
{
  unint64_t result;

  result = qword_257482E18[0];
  if (!qword_257482E18[0])
  {
    result = MEMORY[0x249536E14](&unk_24551550C, &type metadata for SOSUIWebRTCConfiguration.CodingKeys);
    atomic_store(result, qword_257482E18);
  }
  return result;
}

unint64_t sub_245510168()
{
  unint64_t result;

  result = qword_257482EA0;
  if (!qword_257482EA0)
  {
    result = MEMORY[0x249536E14](&unk_24551542C, &type metadata for SOSUIWebRTCState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257482EA0);
  }
  return result;
}

unint64_t sub_2455101B0()
{
  unint64_t result;

  result = qword_257482EA8[0];
  if (!qword_257482EA8[0])
  {
    result = MEMORY[0x249536E14](&unk_245515454, &type metadata for SOSUIWebRTCState.CodingKeys);
    atomic_store(result, qword_257482EA8);
  }
  return result;
}

uint64_t sub_2455101F4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 7235949 && a2 == 0xE300000000000000;
  if (v2 || (sub_245513FF4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7889261 && a2 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_245513FF4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2455102C4(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2();
    result = MEMORY[0x249536E14](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_245510300()
{
  unint64_t result;

  result = qword_25747EFE8;
  if (!qword_25747EFE8)
  {
    result = MEMORY[0x249536E14](&protocol conformance descriptor for SOSUIWebRTCVideoPreference, &type metadata for SOSUIWebRTCVideoPreference);
    atomic_store(result, (unint64_t *)&qword_25747EFE8);
  }
  return result;
}

uint64_t sub_245510370@<X0>(uint64_t *a1@<X8>)
{
  return sub_245508DB8(a1);
}

uint64_t sub_245510390()
{
  return sub_245508DE4();
}

uint64_t sub_2455103A4()
{
  return sub_2455104E8(&qword_25747EFF0);
}

void sub_2455103B0(void *a1)
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

}

void (*sub_245510404(_QWORD *a1))(id **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = qword_25747EFF0;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x249536EF8](v5);
  return sub_245510474;
}

void sub_245510474(id **a1, char a2)
{
  id *v3;
  id v4;

  v3 = *a1;
  v4 = (*a1)[3];
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {

    swift_endAccess();
  }
  else
  {
    swift_endAccess();

  }
  free(v3);
}

uint64_t sub_2455104DC()
{
  return sub_2455104E8(&qword_25747EFF8);
}

uint64_t sub_2455104E8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *a1;
  swift_beginAccess();
  return MEMORY[0x249536EF8](v2);
}

uint64_t sub_24551052C()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_245510584(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = qword_25747EFF8;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x249536EF8](v5);
  return sub_2454F59D8;
}

uint64_t sub_2455105F4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + qword_25747F020);
  swift_beginAccess();
  v2 = *v1;
  sub_24550578C(*v1);
  return v2;
}

uint64_t sub_24551064C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + qword_25747F020);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_245503F0C(v6);
}

uint64_t (*sub_2455106A8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2455106EC()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + qword_25747F028);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_245510730(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + qword_25747F028);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_245510778())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2455107C0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t (*v6)(uint64_t, uint64_t);

  v6 = *(uint64_t (**)(uint64_t, uint64_t))((*MEMORY[0x24BEE4EA0] & *v2) + 0x88);
  swift_retain();
  return v6(a1, a2);
}

void (*sub_245510820(uint64_t a1, void *a2))(void)
{
  return sub_24551339C(a2);
}

uint64_t sub_245510828@<X0>(id a1@<X1>, uint64_t a2@<X0>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  id v9;
  _BYTE v11[32];

  v9 = objc_msgSend(a1, sel_body);
  sub_245513E5C();
  swift_unknownObjectRelease();
  sub_245512BAC(a2, (uint64_t)v11, a3, a4, a5);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
}

void sub_2455108B8(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  sub_24551339C(v7);

}

void sub_24551091C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(v0 + qword_25747F020);
  *v1 = 0;
  v1[1] = 0;
  *(_BYTE *)(v0 + qword_25747F028) = 0;
  type metadata accessor for SOSUIWebRTCRPC.LoadedListener();
}

id sub_24551096C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 16) = v1;
  *(_QWORD *)(v2 - 8) = a1;
  return objc_msgSendSuper2((objc_super *)(v2 - 16), sel_init);
}

void sub_24551098C()
{
  sub_24551091C();
}

void sub_2455109AC()
{
  type metadata accessor for SOSUIWebRTCRPC.LoadedListener();
}

id sub_2455109E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 16) = v1;
  *(_QWORD *)(v2 - 8) = a1;
  return objc_msgSendSuper2((objc_super *)(v2 - 16), sel_dealloc);
}

uint64_t sub_245510A00(uint64_t a1)
{
  return sub_245503F0C(*(_QWORD *)(a1 + qword_25747F020));
}

uint64_t sub_245510A14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  uint64_t v4;
  _QWORD *v8;

  objc_allocWithZone(v3);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_245510A84;
  return sub_245510AD8(a1, a2, a3);
}

uint64_t sub_245510A84(uint64_t a1)
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

uint64_t sub_245510AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[28] = a3;
  v4[29] = v3;
  v4[26] = a1;
  v4[27] = a2;
  v5 = *MEMORY[0x24BEE4EA0];
  v4[30] = *v3;
  v4[31] = v5;
  v6 = sub_245513CF4();
  v4[32] = v6;
  v4[33] = *(_QWORD *)(v6 - 8);
  v4[34] = swift_task_alloc();
  v4[35] = swift_task_alloc();
  v4[36] = swift_task_alloc();
  v4[37] = swift_task_alloc();
  v4[38] = sub_245513DC0();
  v4[39] = sub_245513DB4();
  v4[40] = sub_245513D9C();
  v4[41] = v7;
  return swift_task_switch();
}

void sub_245510BB0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v0[28];
  v1 = v0[29];
  v3 = (_QWORD *)(v0[30] & v0[31]);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v4 = v1 + qword_25747F008;
  strcpy((char *)(v1 + qword_25747F008), "webRTCParent");
  *(_BYTE *)(v4 + 13) = 0;
  *(_WORD *)(v4 + 14) = -5120;
  v5 = (_QWORD *)(v1 + qword_25747F010);
  *v5 = 0xD000000000000012;
  v5[1] = 0x8000000245517400;
  v6 = v1 + qword_25747F018;
  strcpy((char *)(v1 + qword_25747F018), "WebRTCClient");
  *(_BYTE *)(v6 + 13) = 0;
  *(_WORD *)(v6 + 14) = -5120;
  *(_BYTE *)(v1 + qword_25747F040) = 1;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)(v1 + qword_25747F000) = v2;
  v7 = v3[11];
  v9 = v3[12];
  v8 = v3[13];
  v0[2] = v3[10];
  v0[3] = v7;
  v0[4] = v9;
  v0[5] = v8;
  type metadata accessor for SOSUIWebRTCRPC();
}

void sub_245510D24(objc_class *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  objc_class *v13;
  void *v14;
  objc_super *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void (*v21)(_QWORD, _QWORD, _QWORD);
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  Class super_class;
  Class v26;
  id receiver;
  objc_class *v28;

  v15[12].receiver = v14;
  v15[12].super_class = a1;
  v19 = objc_msgSendSuper2(v15 + 12, sel_init);
  v15[21].receiver = v19;
  v19;
  v20 = sub_2454F4ED8();
  v15[21].super_class = (Class)v20;
  v21 = *(void (**)(_QWORD, _QWORD, _QWORD))(a10 + 16);
  v15[22].receiver = v21;
  v21(a11, v20, a13);
  v22 = sub_245513CDC();
  v23 = sub_245513E14();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_2454F2000, v22, v23, "SOSUIWebRTCRPC.init: waiting for web client connection", v24, 2u);
    MEMORY[0x249536E80](v24, -1, -1);
  }
  super_class = v15[18].super_class;
  receiver = v15[16].receiver;
  v26 = v15[16].super_class;

  v28 = (objc_class *)*((_QWORD *)v26 + 1);
  v15[22].super_class = v28;
  ((void (*)(Class, id))v28)(super_class, receiver);
  v15[5].receiver = v16;
  v15[5].super_class = v17;
  v15[6].receiver = v18;
  v15[6].super_class = v13;
  type metadata accessor for SOSUIWebRTCRPC.LoadedListener();
}

uint64_t sub_245510E18(objc_class *a1)
{
  void *v1;
  _QWORD *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  int *v14;
  _QWORD *v15;
  void *v17;
  uint64_t (*v18)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t);
  uint64_t v19;

  v3 = objc_msgSend(objc_allocWithZone(a1), sel_init);
  v2[46] = v3;
  v4 = objc_msgSend(v1, sel_configuration);
  v5 = objc_msgSend(v4, sel_userContentController);

  v2[47] = qword_25747F010;
  v6 = v3;
  swift_bridgeObjectRetain();
  v7 = (void *)sub_245513D18();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_addScriptMessageHandler_name_, v6, v7);

  v8 = objc_msgSend(v1, sel_configuration);
  v9 = objc_msgSend(v8, sel_userContentController);

  v10 = v17;
  swift_bridgeObjectRetain();
  v11 = (void *)sub_245513D18();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_addScriptMessageHandler_name_, v10, v11);

  v12 = MEMORY[0x24BEE4AF8];
  v13 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
  v2[48] = v13;
  v14 = *(int **)((*MEMORY[0x24BEE4EA0] & *v10) + 0xF8);
  v2[49] = v14;
  v18 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t))((char *)v14 + *v14);
  v15 = (_QWORD *)swift_task_alloc();
  v2[50] = v15;
  *v15 = v2;
  v15[1] = sub_245511004;
  return v18(v19, 0x4364694474736F68, 0xEE007463656E6E6FLL, v12, v13);
}

uint64_t sub_245511004()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 408) = v0;
  swift_task_dealloc();
  if (!v0)
    sub_245504434(v2 + 48, &qword_25747E568);
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_24551108C()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t *v21;

  v1 = *(_QWORD *)(v0 + 344);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 352);
  v3 = *(_QWORD *)(v0 + 288);
  v4 = *(_QWORD *)(v0 + 256);
  swift_release();
  v2(v3, v1, v4);
  v5 = sub_245513CDC();
  v6 = sub_245513E14();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2454F2000, v5, v6, "SOSUIWebRTCRPC.init: web client already loaded", v7, 2u);
    MEMORY[0x249536E80](v7, -1, -1);
  }
  v8 = *(void (**)(uint64_t, uint64_t))(v0 + 360);
  v9 = *(_QWORD *)(v0 + 288);
  v10 = *(_QWORD *)(v0 + 256);
  v11 = *(void **)(v0 + 208);

  v8(v9, v10);
  v12 = objc_msgSend(v11, sel_configuration);
  v13 = objc_msgSend(v12, sel_userContentController);

  swift_bridgeObjectRetain();
  v14 = (void *)sub_245513D18();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_removeScriptMessageHandlerForName_, v14);

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 352))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 256));
  v15 = sub_245513CDC();
  v16 = sub_245513E14();
  v17 = os_log_type_enabled(v15, v16);
  v18 = *(void **)(v0 + 368);
  v19 = *(void **)(v0 + 336);
  v20 = *(void **)(v0 + 208);
  if (v17)
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_2454F2000, v15, v16, "SOSUIWebRTCRPC.init: web client connected", v21, 2u);
    MEMORY[0x249536E80](v21, -1, -1);

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 360))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 256));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 336));
}

uint64_t sub_2455112FC()
{
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_245511364()
{
  _QWORD *v0;
  int *v1;
  uint64_t v2;
  unint64_t v3;
  _QWORD *v4;
  int *v6;

  v1 = (int *)v0[49];
  v2 = MEMORY[0x24BEE4AF8];
  v3 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
  v0[55] = v3;
  v6 = (int *)((char *)v1 + *v1);
  v4 = (_QWORD *)swift_task_alloc();
  v0[56] = v4;
  *v4 = v0;
  v4[1] = sub_245511414;
  return ((uint64_t (*)(_QWORD *, uint64_t, unint64_t, uint64_t, unint64_t))v6)(v0 + 14, 0x4364694474736F68, 0xEE007463656E6E6FLL, v2, v3);
}

uint64_t sub_245511414()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;

  v2 = *v1;
  *(_QWORD *)(*v1 + 456) = v0;
  swift_task_dealloc();
  if (v0)
  {
    v3 = *(void **)(v2 + 336);
    swift_bridgeObjectRelease();

  }
  else
  {
    sub_245504434(v2 + 112, &qword_25747E568);
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_2455114A4()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  os_log_type_t v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t *v8;

  v1 = *(void **)(v0 + 408);
  swift_release();

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 352))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 256));
  v2 = sub_245513CDC();
  v3 = sub_245513E14();
  v4 = os_log_type_enabled(v2, v3);
  v5 = *(void **)(v0 + 368);
  v6 = *(void **)(v0 + 336);
  v7 = *(void **)(v0 + 208);
  if (v4)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2454F2000, v2, v3, "SOSUIWebRTCRPC.init: web client connected", v8, 2u);
    MEMORY[0x249536E80](v8, -1, -1);

    swift_unknownObjectRelease();
  }
  else
  {

    swift_unknownObjectRelease();
  }
  (*(void (**)(_QWORD, _QWORD))(v0 + 360))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 256));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 336));
}

uint64_t sub_2455115F4()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  _QWORD *v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t (*v19)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t);

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 352))(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 256));
  v1 = sub_245513CDC();
  v2 = sub_245513E14();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2454F2000, v1, v2, "SOSUIWebRTCRPC.init: web client not loaded, waiting for load", v3, 2u);
    MEMORY[0x249536E80](v3, -1, -1);
  }
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 360);
  v4 = *(_QWORD **)(v0 + 368);
  v6 = *(_QWORD *)(v0 + 272);
  v7 = *(_QWORD *)(v0 + 256);

  v8 = v5(v6, v7);
  if (((*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v4) + 0x98))(v8) & 1) != 0)
  {
    v9 = *(int **)(v0 + 392);
    v10 = MEMORY[0x24BEE4AF8];
    v11 = sub_2454F881C(MEMORY[0x24BEE4AF8]);
    *(_QWORD *)(v0 + 440) = v11;
    v19 = (uint64_t (*)(uint64_t, uint64_t, unint64_t, uint64_t, unint64_t))((char *)v9 + *v9);
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 448) = v12;
    *v12 = v0;
    v12[1] = sub_245511414;
    return v19(v0 + 112, 0x4364694474736F68, 0xEE007463656E6E6FLL, v10, v11);
  }
  else
  {
    v14 = *(_QWORD *)(v0 + 368);
    v15 = *(_QWORD *)(v0 + 336);
    v16 = *(_QWORD *)(v0 + 208);
    *(_QWORD *)(v0 + 416) = sub_245513DB4();
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 424) = v17;
    v17[2] = v14;
    v17[3] = v16;
    v17[4] = v15;
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 432) = v18;
    *v18 = v0;
    v18[1] = sub_2455112FC;
    return sub_245513FE8();
  }
}

uint64_t sub_24551180C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(v0 + 408);
  v2 = *(void **)(v0 + 368);
  v3 = *(void **)(v0 + 336);

  swift_release();
  swift_unknownObjectRelease();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2455118B8()
{
  return MEMORY[0x24BEE4AF8];
}

unint64_t sub_2455118C4()
{
  return sub_2454F881C(MEMORY[0x24BEE4AF8]);
}

uint64_t sub_2455118D0(uint64_t a1, _QWORD *a2, void *a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t (*)(), uint64_t);
  id v15;
  id v16;
  uint64_t v18;

  v8 = *MEMORY[0x24BEE4EA0] & *a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EB88);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = *(_QWORD *)(v8 + 80);
  *(_OWORD *)(v13 + 24) = *(_OWORD *)(v8 + 88);
  *(_QWORD *)(v13 + 40) = *(_QWORD *)(v8 + 104);
  *(_QWORD *)(v13 + 48) = a3;
  *(_QWORD *)(v13 + 56) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  v14 = *(void (**)(uint64_t (*)(), uint64_t))((*MEMORY[0x24BEE4EA0] & *a2) + 0xB0);
  v15 = a3;
  v16 = a4;
  v14(sub_245513B94, v13);
  return swift_release();
}

uint64_t sub_245511A0C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;

  v2 = sub_245513CF4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2454F4ED8();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_245513CDC();
  v8 = sub_245513E14();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2454F2000, v7, v8, "SOSUIWebRTCRPC.init: received load message", v9, 2u);
    MEMORY[0x249536E80](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v10 = objc_msgSend(a1, sel_configuration);
  v11 = objc_msgSend(v10, sel_userContentController);

  v12 = (void *)sub_245513D18();
  objc_msgSend(v11, sel_removeScriptMessageHandlerForName_, v12);

  __swift_instantiateConcreteTypeFromMangledName(&qword_25747EB88);
  return sub_245513DA8();
}

void sub_245511BA4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  char *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  __int128 v18;
  _OWORD v19[3];

  v1 = v0;
  v2 = *v0;
  v3 = *MEMORY[0x24BEE4EA0];
  v4 = sub_245513CF4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2454F4ED8();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9 = sub_245513CDC();
  v10 = sub_245513DF0();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2454F2000, v9, v10, "SOSUIWebRTCRPC.deinit", v11, 2u);
    MEMORY[0x249536E80](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v12 = (char *)v1 + qword_25747EFF0;
  swift_beginAccess();
  v13 = (void *)MEMORY[0x249536EF8](v12);
  if (v13)
  {
    v14 = v13;
    v15 = objc_msgSend(v13, sel_configuration);

    v16 = objc_msgSend(v15, sel_userContentController);
    swift_bridgeObjectRetain();
    v17 = (void *)sub_245513D18();
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_removeScriptMessageHandlerForName_, v17);

  }
  v18 = *(_OWORD *)((v3 & v2) + 0x60);
  v19[0] = *(_OWORD *)((v3 & v2) + 0x50);
  v19[1] = v18;
  type metadata accessor for SOSUIWebRTCRPC();
}

id sub_245511D74(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = v1;
  *(_QWORD *)(v2 - 112) = a1;
  return objc_msgSendSuper2((objc_super *)(v2 - 120), sel_dealloc);
}

void sub_245511DA8(void *a1)
{
  id v1;

  v1 = a1;
  sub_245511BA4();
}

uint64_t sub_245511DCC()
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_245511E40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[10] = a5;
  v6[11] = v5;
  v6[8] = a3;
  v6[9] = a4;
  v6[6] = a1;
  v6[7] = a2;
  v7 = sub_245513CF4();
  v6[12] = v7;
  v6[13] = *(_QWORD *)(v7 - 8);
  v6[14] = swift_task_alloc();
  v6[15] = swift_task_alloc();
  sub_245513DC0();
  v6[16] = sub_245513DB4();
  v6[17] = sub_245513D9C();
  v6[18] = v8;
  return swift_task_switch();
}

uint64_t sub_245511EEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _OWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 72);
  sub_245513E68();
  swift_bridgeObjectRelease();
  v25 = 0x206E7275746572;
  v26 = 0xE700000000000000;
  swift_bridgeObjectRetain();
  sub_245513D78();
  swift_bridgeObjectRelease();
  sub_245513D78();
  sub_245513D78();
  sub_245513D78();
  *(_QWORD *)(v0 + 16) = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25747ED68);
  sub_2455136B8();
  sub_245513D00();
  sub_245513D78();
  swift_bridgeObjectRelease();
  sub_245513D78();
  v6 = v25;
  v5 = v26;
  *(_QWORD *)(v0 + 152) = v25;
  *(_QWORD *)(v0 + 160) = v5;
  v7 = sub_2454F4ED8();
  *(_QWORD *)(v0 + 168) = v7;
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 176) = v8;
  v8(v1, v7, v2);
  swift_bridgeObjectRetain_n();
  v9 = sub_245513CDC();
  v10 = sub_245513E14();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = *(_QWORD *)(v0 + 104);
    v23 = *(_QWORD *)(v0 + 96);
    v24 = *(_QWORD *)(v0 + 120);
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v25 = v13;
    *(_DWORD *)v12 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 40) = sub_245503804(v6, v5, &v25);
    sub_245513E44();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2454F2000, v9, v10, "SOSUIWebRTCRPC.rpcCall:argumentNames:arguments: making rpc call %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x249536E80](v13, -1, -1);
    MEMORY[0x249536E80](v12, -1, -1);

    v14 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v14(v24, v23);
  }
  else
  {
    v15 = *(_QWORD *)(v0 + 120);
    v16 = *(_QWORD *)(v0 + 96);
    v17 = *(_QWORD *)(v0 + 104);
    swift_bridgeObjectRelease_n();

    v14 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
    v14(v15, v16);
  }
  *(_QWORD *)(v0 + 184) = v14;
  v18 = *(_QWORD **)(v0 + 88);
  *(_QWORD *)(v0 + 192) = sub_245512F74(*(_QWORD *)(v0 + 80));
  v19 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v18) + 0xA8))();
  *(_QWORD *)(v0 + 200) = v19;
  if (v19)
  {
    *(_QWORD *)(v0 + 208) = objc_msgSend((id)objc_opt_self(), sel_pageWorld);
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v20;
    *v20 = v0;
    v20[1] = sub_2455122A8;
    return sub_245513E2C();
  }
  else
  {
    v22 = *(_OWORD **)(v0 + 48);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    *v22 = 0u;
    v22[1] = 0u;
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2455122A8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = *v1;
  *(_QWORD *)(*v1 + 224) = v0;
  swift_task_dealloc();
  v3 = *(void **)(v2 + 200);
  v4 = *(void **)(v2 + 208);
  if (v0)
  {

    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();

  }
  return swift_task_switch();
}

uint64_t sub_24551234C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245512390()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;

  v1 = *(void **)(v0 + 224);
  v2 = *(_QWORD *)(v0 + 168);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 176);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 96);
  swift_release();
  v3(v4, v2, v5);
  v6 = v1;
  swift_bridgeObjectRetain();
  v7 = v1;
  v8 = sub_245513CDC();
  v9 = sub_245513E14();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(void **)(v0 + 224);
    v11 = *(_QWORD *)(v0 + 152);
    v12 = *(_QWORD *)(v0 + 160);
    v24 = *(_QWORD *)(v0 + 112);
    v25 = *(void (**)(uint64_t, uint64_t))(v0 + 184);
    v23 = *(_QWORD *)(v0 + 96);
    v13 = swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v26 = v22;
    *(_DWORD *)v13 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 24) = sub_245503804(v11, v12, &v26);
    sub_245513E44();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2112;
    v15 = v10;
    v16 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 32) = v16;
    sub_245513E44();
    *v14 = v16;

    _os_log_impl(&dword_2454F2000, v8, v9, "SOSUIWebRTCRPC.rpcCall:argumentNames:arguments: making rpc call %s failed, error: %@", (uint8_t *)v13, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25747F068);
    swift_arrayDestroy();
    MEMORY[0x249536E80](v14, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x249536E80](v22, -1, -1);
    MEMORY[0x249536E80](v13, -1, -1);

    v25(v24, v23);
  }
  else
  {
    v17 = *(void **)(v0 + 224);
    v18 = *(void (**)(uint64_t, uint64_t))(v0 + 184);
    v19 = *(_QWORD *)(v0 + 112);
    v20 = *(_QWORD *)(v0 + 96);
    swift_bridgeObjectRelease_n();

    v18(v19, v20);
  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_245512628()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v0 = sub_245513CF4();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_245513D54();
  MEMORY[0x24BDAC7A8](v1);
  sub_245513C88();
  swift_allocObject();
  sub_245513C7C();
  v2 = sub_245513C70();
  v4 = v3;
  sub_245513704(v2, v3);
  sub_245513D48();
  v5 = sub_245513D3C();
  sub_245513748(v2, v4);
  sub_245513748(v2, v4);
  swift_release();
  return v5;
}

uint64_t sub_245512824(uint64_t a1, void *a2)
{
  return sub_24551378C(a2);
}

void sub_24551282C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  sub_24551378C(v7);

}

void sub_245512890()
{
  sub_2455139CC();
}

uint64_t sub_2455128B0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  _BYTE v26[15];
  _BYTE v27[32];

  v2 = sub_245513CF4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = &v26[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v4);
  v8 = &v26[-v7];
  v9 = sub_245513D54();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = &v26[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_2455059BC(a1, (uint64_t)v27);
  if (swift_dynamicCast())
  {
    sub_245513D48();
    v13 = sub_245513D30();
    v15 = v14;
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);
    if (v15 >> 60 != 15)
    {
      sub_245513C64();
      swift_allocObject();
      sub_245513C58();
      sub_245513BC8();
      sub_245513C4C();
      v24 = 0;
      swift_release();
      sub_2455139F8(v13, v15);
      goto LABEL_11;
    }
    v16 = sub_2454F4ED8();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v6, v16, v2);
    v17 = sub_245513CDC();
    v18 = sub_245513E14();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_2454F2000, v17, v18, "decodeJson: unable to access json data", v19, 2u);
      MEMORY[0x249536E80](v19, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v6, v2);
  }
  else
  {
    v20 = sub_2454F4ED8();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v8, v20, v2);
    v21 = sub_245513CDC();
    v22 = sub_245513E14();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_2454F2000, v21, v22, "decodeJson: malformed json", v23, 2u);
      MEMORY[0x249536E80](v23, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v8, v2);
  }
  v24 = 1;
LABEL_11:
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
  return v24;
}

uint64_t sub_245512BAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v52[32];

  v47 = a1;
  v48 = a4;
  v51 = a2;
  v49 = a5;
  v6 = sub_245513CF4();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v43 - v11;
  v50 = a3;
  v13 = sub_245513E38();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v43 - v15;
  v17 = sub_245513D54();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v43 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2455059BC(v51, (uint64_t)v52);
  if (swift_dynamicCast())
  {
    v44 = v16;
    v45 = v12;
    v46 = v14;
    v21 = v6;
    v51 = v13;
    sub_245513D48();
    v22 = sub_245513D30();
    v24 = v23;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    if (v24 >> 60 == 15)
    {
      v25 = sub_2454F4ED8();
      v26 = v7;
      v27 = v45;
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v45, v25, v21);
      v28 = sub_245513CDC();
      v29 = sub_245513E14();
      v30 = os_log_type_enabled(v28, v29);
      v31 = v50;
      if (v30)
      {
        v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_2454F2000, v28, v29, "decodeJson: unable to access json data", v32, 2u);
        MEMORY[0x249536E80](v32, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v26 + 8))(v27, v21);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v49, 1, 1, v31);
    }
    else
    {
      sub_245513C64();
      swift_allocObject();
      sub_245513C58();
      v38 = v44;
      v39 = v50;
      sub_245513C4C();
      v40 = v51;
      v41 = v46;
      swift_release();
      sub_2455139F8(v22, v24);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v38, 0, 1, v39);
      (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v49, v38, v40);
    }
  }
  else
  {
    v33 = v50;
    v34 = sub_2454F4ED8();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v34, v6);
    v35 = sub_245513CDC();
    v36 = sub_245513E14();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_2454F2000, v35, v36, "decodeJson: malformed json", v37, 2u);
      MEMORY[0x249536E80](v37, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v49, 1, 1, v33);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v52);
}

uint64_t sub_245512F74(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t i;
  BOOL v12;
  unint64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  int64_t v26;
  __int128 v27;
  unint64_t v28;
  _BYTE v29[32];
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  char v33[32];
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[2];
  uint64_t v38;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25747EB78);
  result = sub_245513EB0();
  v3 = (_QWORD *)result;
  v4 = 0;
  v5 = *(_QWORD *)(a1 + 64);
  v25 = a1 + 64;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v5;
  v26 = (unint64_t)(v6 + 63) >> 6;
  v9 = result + 64;
  if ((v7 & v5) == 0)
    goto LABEL_5;
LABEL_4:
  v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v10 | (v4 << 6); ; i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v16 = *v15;
    v17 = v15[1];
    sub_2455059BC(*(_QWORD *)(a1 + 56) + 32 * i, (uint64_t)v29);
    swift_bridgeObjectRetain();
    sub_2455059BC((uint64_t)v29, (uint64_t)&v34);
    if (swift_dynamicCast())
    {
      swift_bridgeObjectRelease();
      sub_2455059BC((uint64_t)v29, (uint64_t)v37);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v37);
LABEL_19:
      sub_2455059BC((uint64_t)v29, (uint64_t)v36);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
LABEL_20:
      sub_2455059BC((uint64_t)v29, (uint64_t)&v27);
      goto LABEL_21;
    }
    sub_2455059BC((uint64_t)v29, (uint64_t)v37);
    sub_245503FE8(v37, &v34);
    if ((swift_dynamicCast() & 1) != 0)
      goto LABEL_19;
    sub_2455059BC((uint64_t)v29, (uint64_t)v36);
    sub_245503FE8(v36, &v34);
    if ((swift_dynamicCast() & 1) != 0)
      goto LABEL_20;
    sub_2455059BC((uint64_t)v29, (uint64_t)v33);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25747F0E0);
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_245513AFC(&v30, (uint64_t)&v34);
      __swift_project_boxed_opaque_existential_1(&v34, v35);
      v21 = sub_245512628();
      if (v22)
      {
        *((_QWORD *)&v31 + 1) = MEMORY[0x24BEE0D00];
        *(_QWORD *)&v30 = v21;
        *((_QWORD *)&v30 + 1) = v22;
        sub_245503FE8(&v30, &v27);
      }
      else
      {
        v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF8]), sel_init);
        v28 = sub_245513AC0();
        *(_QWORD *)&v27 = v24;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)&v34);
    }
    else
    {
      v32 = 0;
      v30 = 0u;
      v31 = 0u;
      sub_245504434((uint64_t)&v30, &qword_25747F0E8);
      v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF8]), sel_init);
      v28 = sub_245513AC0();
      *(_QWORD *)&v27 = v23;
    }
LABEL_21:
    if (v38)
    {
      swift_bridgeObjectRelease();
      swift_release();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
      return (uint64_t)v3;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
    *(_QWORD *)(v9 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v18 = (_QWORD *)(v3[6] + 16 * i);
    *v18 = v16;
    v18[1] = v17;
    result = (uint64_t)sub_245503FE8(&v27, (_OWORD *)(v3[7] + 32 * i));
    v19 = v3[2];
    v12 = __OFADD__(v19, 1);
    v20 = v19 + 1;
    if (v12)
    {
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    v3[2] = v20;
    if (v8)
      goto LABEL_4;
LABEL_5:
    v12 = __OFADD__(v4++, 1);
    if (v12)
      goto LABEL_39;
    if (v4 >= v26)
      return (uint64_t)v3;
    v13 = *(_QWORD *)(v25 + 8 * v4);
    if (!v13)
      break;
LABEL_15:
    v8 = (v13 - 1) & v13;
  }
  v14 = v4 + 1;
  if (v4 + 1 >= v26)
    return (uint64_t)v3;
  v13 = *(_QWORD *)(v25 + 8 * v14);
  if (v13)
    goto LABEL_14;
  v14 = v4 + 2;
  if (v4 + 2 >= v26)
    return (uint64_t)v3;
  v13 = *(_QWORD *)(v25 + 8 * v14);
  if (v13)
    goto LABEL_14;
  v14 = v4 + 3;
  if (v4 + 3 >= v26)
    return (uint64_t)v3;
  v13 = *(_QWORD *)(v25 + 8 * v14);
  if (v13)
  {
LABEL_14:
    v4 = v14;
    goto LABEL_15;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v26)
      return (uint64_t)v3;
    v13 = *(_QWORD *)(v25 + 8 * v4);
    ++v14;
    if (v13)
      goto LABEL_15;
  }
LABEL_40:
  __break(1u);
  return result;
}

void (*sub_24551339C(void *a1))(void)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD *v17;
  uint64_t v18;
  void (*result)(void);
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[4];

  v2 = v1;
  v4 = sub_245513CF4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v27 - v9;
  v11 = objc_msgSend(a1, sel_body);
  sub_245513E5C();
  swift_unknownObjectRelease();
  LOBYTE(a1) = sub_2455128B0((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
  v12 = sub_2454F4ED8();
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  if ((a1 & 1) != 0)
  {
    v13(v8, v12, v4);
    v21 = sub_245513CDC();
    v22 = sub_245513E14();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v29[0] = v24;
      *(_DWORD *)v23 = 136315138;
      LOBYTE(v28) = 1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25747F0F8);
      v25 = sub_245513D60();
      v28 = sub_245503804(v25, v26, v29);
      sub_245513E44();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2454F2000, v21, v22, "SOSUIWebRTCRPC.LoadedListener: unhandled message %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x249536E80](v24, -1, -1);
      MEMORY[0x249536E80](v23, -1, -1);
    }

    return (void (*)(void))(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    v13(v10, v12, v4);
    v14 = sub_245513CDC();
    v15 = sub_245513E14();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2454F2000, v14, v15, "SOSUIWebRTCRPC.LoadedListener: web client loaded message received", v16, 2u);
      MEMORY[0x249536E80](v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    v17 = (_QWORD *)MEMORY[0x24BEE4EA0];
    v18 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v2) + 0xA0))(1);
    result = (void (*)(void))(*(uint64_t (**)(uint64_t))((*v17 & *v2) + 0x80))(v18);
    if (result)
    {
      v20 = (uint64_t)result;
      result();
      return (void (*)(void))sub_245503F0C(v20);
    }
  }
  return result;
}

void type metadata accessor for SOSUIWebRTCRPC.LoadedListener()
{
  JUMPOUT(0x249536DCCLL);
}

void type metadata accessor for SOSUIWebRTCRPC()
{
  JUMPOUT(0x249536DCCLL);
}

uint64_t sub_2455136AC(uint64_t a1)
{
  uint64_t v1;

  return sub_2455118D0(a1, *(_QWORD **)(v1 + 16), *(void **)(v1 + 24), *(void **)(v1 + 32));
}

unint64_t sub_2455136B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25747F060;
  if (!qword_25747F060)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25747ED68);
    result = MEMORY[0x249536E14](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_25747F060);
  }
  return result;
}

uint64_t sub_245513704(uint64_t a1, unint64_t a2)
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

uint64_t sub_245513748(uint64_t a1, unint64_t a2)
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

uint64_t sub_24551378C(void *a1)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v3 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *v1);
  v4 = sub_245513CF4();
  v24 = *(_QWORD *)(v4 - 8);
  v25 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v3[10];
  v8 = sub_245513E38();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v24 - v11;
  v13 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v24 - v14;
  sub_245510828(a1, *(_QWORD *)((char *)v1 + qword_25747F000), v7, v3[12], (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, v7) == 1)
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    v16 = sub_2454F4ED8();
    v18 = v24;
    v17 = v25;
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v6, v16, v25);
    v19 = sub_245513CDC();
    v20 = sub_245513E14();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_2454F2000, v19, v20, "SOSUIWebRTCRPC.userContentController:didReceive: failed to decode message", v21, 2u);
      MEMORY[0x249536E80](v21, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v18 + 8))(v6, v17);
  }
  else
  {
    v23 = (*(uint64_t (**)(char *, char *, uint64_t))(v13 + 32))(v15, v12, v7);
    if ((*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0xC0))(v23))
    {
      (*(void (**)(char *, _QWORD))(v3[13] + 16))(v15, v3[11]);
      swift_unknownObjectRelease();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v7);
  }
}

void sub_2455139CC()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2455139F8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_245513748(a1, a2);
  return a1;
}

uint64_t sub_245513A10()
{
  return swift_initClassMetadata2();
}

uint64_t sub_245513A78()
{
  return swift_initClassMetadata2();
}

unint64_t sub_245513AC0()
{
  unint64_t result;

  result = qword_25747F0F0;
  if (!qword_25747F0F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25747F0F0);
  }
  return result;
}

uint64_t sub_245513AFC(__int128 *a1, uint64_t a2)
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

uint64_t sub_245513B14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25747EB88);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_245513B94()
{
  uint64_t v0;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25747EB88);
  return sub_245511A0C(*(void **)(v0 + 48));
}

unint64_t sub_245513BC8()
{
  unint64_t result;

  result = qword_25747F100;
  if (!qword_25747F100)
  {
    result = MEMORY[0x249536E14](&unk_24551509C, &type metadata for SOSUIWebRTCInternalMessage);
    atomic_store(result, (unint64_t *)&qword_25747F100);
  }
  return result;
}

uint64_t sub_245513C10()
{
  return MEMORY[0x24BDCB030]();
}

uint64_t sub_245513C1C()
{
  return MEMORY[0x24BDCB068]();
}

uint64_t sub_245513C28()
{
  return MEMORY[0x24BDCB070]();
}

uint64_t sub_245513C34()
{
  return MEMORY[0x24BDCB088]();
}

uint64_t sub_245513C40()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_245513C4C()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_245513C58()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_245513C64()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_245513C70()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_245513C7C()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_245513C88()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_245513C94()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_245513CA0()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_245513CAC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_245513CB8()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_245513CC4()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_245513CD0()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_245513CDC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_245513CE8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_245513CF4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_245513D00()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_245513D0C()
{
  return MEMORY[0x24BDCF870]();
}

uint64_t sub_245513D18()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_245513D24()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_245513D30()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_245513D3C()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_245513D48()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_245513D54()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_245513D60()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_245513D6C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_245513D78()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_245513D84()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_245513D90()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_245513D9C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_245513DA8()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_245513DB4()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_245513DC0()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_245513DCC()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_245513DD8()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_245513DE4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_245513DF0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_245513DFC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_245513E08()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_245513E14()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_245513E20()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_245513E2C()
{
  return MEMORY[0x24BEE6430]();
}

uint64_t sub_245513E38()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_245513E44()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_245513E50()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_245513E5C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_245513E68()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_245513E74()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_245513E80()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_245513E8C()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_245513E98()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_245513EA4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_245513EB0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_245513EBC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_245513EC8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_245513ED4()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_245513EE0()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_245513EEC()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_245513EF8()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_245513F04()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_245513F10()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_245513F1C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_245513F28()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_245513F34()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_245513F40()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_245513F4C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_245513F58()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_245513F64()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_245513F70()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_245513F7C()
{
  return MEMORY[0x24BEE3430]();
}

uint64_t sub_245513F88()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_245513F94()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_245513FA0()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_245513FAC()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_245513FB8()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_245513FC4()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_245513FD0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_245513FDC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_245513FE8()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_245513FF4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_245514000()
{
  return MEMORY[0x24BEE3A50]();
}

uint64_t sub_24551400C()
{
  return MEMORY[0x24BEE3A58]();
}

uint64_t sub_245514018()
{
  return MEMORY[0x24BEE3AF0]();
}

uint64_t sub_245514024()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_245514030()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24551403C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_245514048()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_245514054()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_245514060()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24551406C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_245514078()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_245514084()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_245514090()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_24551409C()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_2455140A8()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2455140B4()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2455140C0()
{
  return MEMORY[0x24BEE4A10]();
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BEBE6A8]();
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

