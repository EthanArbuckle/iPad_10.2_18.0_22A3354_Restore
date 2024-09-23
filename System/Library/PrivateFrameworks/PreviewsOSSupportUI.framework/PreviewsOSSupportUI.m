UVFauxPreviewAgent *_initializePreviewAgent()
{
  return objc_alloc_init(UVFauxPreviewAgent);
}

Swift::Void __swiftcall PreviewDebugOverlay.contentsUpdated()()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_messageCount);
  v2 = __OFADD__(v1, 1);
  v3 = v1 + 1;
  if (v2)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_messageCount) = v3;
    sub_22C66B638();
  }
}

void sub_22C66B638()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
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
  char *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;

  v1 = v0;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled) & 1) != 0
    || *(_BYTE *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_forceEnabled) == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255C14920);
    v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_22C683F10;
    v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_size);
    swift_beginAccess();
    v4 = *v3;
    v5 = MEMORY[0x24BEE50B0];
    *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE50B0];
    v6 = sub_22C66D260();
    *(_QWORD *)(v2 + 64) = v6;
    *(_QWORD *)(v2 + 32) = v4;
    v7 = v3[1];
    *(_QWORD *)(v2 + 96) = v5;
    *(_QWORD *)(v2 + 104) = v6;
    *(_QWORD *)(v2 + 72) = v7;
    v8 = sub_22C6835EC();
    v10 = v9;
    swift_beginAccess();
    v11 = sub_22C66D2A4();
    v12 = MEMORY[0x24BEE0D00];
    sub_22C6836F4();
    v30 = v13;
    v28 = v11;
    v29 = v11;
    v26 = v12;
    v27 = v11;
    v14 = sub_22C6836F4();
    v16 = v15;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255C14938);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_22C683F20;
    *(_QWORD *)(v17 + 32) = sub_22C683790();
    *(_QWORD *)(v17 + 40) = v18;
    *(_QWORD *)(v17 + 48) = sub_22C683790();
    *(_QWORD *)(v17 + 56) = v19;
    *(_QWORD *)(v17 + 64) = v8;
    *(_QWORD *)(v17 + 72) = v10;
    *(_QWORD *)(v17 + 80) = v14;
    *(_QWORD *)(v17 + 88) = v16;
    v20 = (char *)sub_22C66C46C();
    v21 = *(id *)&v20[OBJC_IVAR____TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView_label];

    __swift_instantiateConcreteTypeFromMangledName(&qword_255C14940);
    sub_22C66D2E8();
    sub_22C6835BC();
    swift_bridgeObjectRelease();
    v22 = (void *)sub_22C6835D4();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_setText_, v22, v26, v27, v28, v29, 1397315157, 0xE400000000000000, 0x7463656A6E495655, 0xEF656E6563536465, v17, v30);

    v23 = sub_22C66C46C();
    v24 = objc_msgSend(v23, sel_superview);

    if (v24)
    {
      v25 = sub_22C66C46C();
      objc_msgSend(v24, sel_bringSubviewToFront_, v25);

    }
  }
}

uint64_t PreviewDebugOverlay.identifier.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_identifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_22C66BA14@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_identifier);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

void sub_22C66BA68(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_identifier);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_22C66B638();
}

void PreviewDebugOverlay.identifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_identifier);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  swift_bridgeObjectRelease();
  sub_22C66B638();
}

uint64_t (*PreviewDebugOverlay.identifier.modify(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_22C66BB84;
}

double PreviewDebugOverlay.size.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_size;
  swift_beginAccess();
  return *(double *)v1;
}

__n128 sub_22C66BBCC@<Q0>(_QWORD *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 *v3;
  __n128 result;

  v3 = (__n128 *)(*a1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_size);
  swift_beginAccess();
  result = *v3;
  *a2 = *v3;
  return result;
}

void sub_22C66BC1C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *a1;
  v3 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_size);
  swift_beginAccess();
  *v4 = v2;
  v4[1] = v3;
  sub_22C66B638();
}

void PreviewDebugOverlay.size.setter(double a1, double a2)
{
  uint64_t v2;
  double *v5;

  v5 = (double *)(v2 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_size);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  sub_22C66B638();
}

uint64_t (*PreviewDebugOverlay.size.modify(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_22C66BB84;
}

void sub_22C66BD14(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_22C66B638();
}

uint64_t PreviewDebugOverlay.enabled.getter()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled) & 1) != 0)
    return 1;
  else
    return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_forceEnabled);
}

Swift::Void __swiftcall PreviewDebugOverlay.enable()()
{
  uint64_t v0;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_forceEnabled) = 1;
  sub_22C66BD80();
}

void sub_22C66BD80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[6];

  v1 = v0;
  v2 = OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled) & 1) == 0
    && *(_BYTE *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_forceEnabled) != 1)
  {
    goto LABEL_7;
  }
  v3 = sub_22C66C46C();
  v4 = objc_msgSend(v3, sel_superview);

  v5 = *(void **)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_parent);
  if (!v4
    || (sub_22C66D148(0, &qword_255C14900),
        v6 = v5,
        v7 = v4,
        v8 = sub_22C6836C4(),
        v6,
        v7,
        v7,
        (v8 & 1) == 0))
  {
    v13 = sub_22C66C46C();
    LOBYTE(v19[0]) = *(_BYTE *)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_edge);
    sub_22C66C834((char *)v19, v5);

    v14 = (void *)objc_opt_self();
    v15 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v19[4] = sub_22C66D128;
    v19[5] = v15;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 1107296256;
    v19[2] = sub_22C66C678;
    v19[3] = &block_descriptor;
    v16 = _Block_copy(v19);
    swift_release();
    v17 = objc_msgSend(v14, sel_scheduledTimerWithTimeInterval_repeats_block_, 1, v16, 1.0);
    _Block_release(v16);
    v18 = *(void **)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsTimer);
    *(_QWORD *)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsTimer) = v17;

    return;
  }
  if ((*(_BYTE *)(v1 + v2) & 1) == 0
    && (*(_BYTE *)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_forceEnabled) & 1) == 0)
  {
LABEL_7:
    v9 = sub_22C66C46C();
    objc_msgSend(v9, sel_removeFromSuperview);

    v10 = OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsTimer;
    v11 = *(void **)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsTimer);
    if (v11)
    {
      objc_msgSend(v11, sel_invalidate);
      v12 = *(void **)(v1 + v10);
    }
    else
    {
      v12 = 0;
    }
    *(_QWORD *)(v1 + v10) = 0;

    *(_QWORD *)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsSinceShown) = 0;
  }
}

void PreviewDebugOverlay.settings(_:changedValueForKey:)()
{
  uint64_t v0;
  id v1;
  unsigned __int8 v2;

  v1 = objc_msgSend((id)objc_opt_self(), sel_rootSettings);
  v2 = objc_msgSend(v1, sel_showDebugUI);

  *(_BYTE *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled) = v2;
  sub_22C66BD80();
}

BOOL static PreviewDebugOverlay.AlignmentEdge.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PreviewDebugOverlay.AlignmentEdge.hash(into:)()
{
  return sub_22C6837CC();
}

uint64_t PreviewDebugOverlay.AlignmentEdge.hashValue.getter()
{
  sub_22C6837C0();
  sub_22C6837CC();
  return sub_22C6837D8();
}

BOOL sub_22C66C168(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_22C66C180()
{
  sub_22C6837C0();
  sub_22C6837CC();
  return sub_22C6837D8();
}

uint64_t sub_22C66C1C4()
{
  return sub_22C6837CC();
}

uint64_t sub_22C66C1EC()
{
  sub_22C6837C0();
  sub_22C6837CC();
  return sub_22C6837D8();
}

_BYTE *PreviewDebugOverlay.__allocating_init(edge:parent:)(char *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return PreviewDebugOverlay.init(edge:parent:)(a1, a2);
}

_BYTE *PreviewDebugOverlay.init(edge:parent:)(char *a1, void *a2)
{
  _BYTE *v2;
  objc_class *ObjectType;
  char v6;
  _QWORD *v7;
  _QWORD *v8;
  id v9;
  id v10;
  void *v11;
  _BYTE *v12;
  id v13;
  id v14;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = *a1;
  *(_QWORD *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_messageCount] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsSinceShown] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsTimer] = 0;
  v7 = &v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_identifier];
  *v7 = 17481;
  v7[1] = 0xE200000000000000;
  v8 = &v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_size];
  *v8 = 0;
  v8[1] = 0;
  v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled] = 0;
  v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_forceEnabled] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay____lazy_storage___view] = 0;
  v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_edge] = v6;
  *(_QWORD *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_parent] = a2;
  v16.receiver = v2;
  v16.super_class = ObjectType;
  v9 = a2;
  v10 = objc_msgSendSuper2(&v16, sel_init);
  v11 = (void *)objc_opt_self();
  v12 = v10;
  v13 = objc_msgSend(v11, sel_rootSettings, v16.receiver, v16.super_class);
  objc_msgSend(v13, sel_addKeyObserver_, v12);

  v14 = objc_msgSend(v11, sel_rootSettings);
  LOBYTE(v13) = objc_msgSend(v14, sel_showDebugUI);

  v12[OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled] = (_BYTE)v13;
  sub_22C66BD80();

  return v12;
}

Swift::Void __swiftcall PreviewDebugOverlay.bringToFront()()
{
  uint64_t v0;
  void *v1;
  id v2;

  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_settingsEnabled) & 1) != 0
    || *(_BYTE *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_forceEnabled) == 1)
  {
    sub_22C66BD80();
    v1 = *(void **)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_parent);
    v2 = sub_22C66C46C();
    objc_msgSend(v1, sel_bringSubviewToFront_, v2);

  }
}

id sub_22C66C46C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay____lazy_storage___view;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay____lazy_storage___view);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay____lazy_storage___view);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PreviewDebugOverlay.OverlayView()), sel_init);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

uint64_t sub_22C66C4DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C14908);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = MEMORY[0x22E2FEF8C](a2 + 16);
  if (result)
  {
    v6 = result;
    v7 = sub_22C683694();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v4, 1, 1, v7);
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = 0;
    v8[3] = 0;
    v8[4] = v6;
    sub_22C680654((uint64_t)v4, (uint64_t)&unk_255C14918, (uint64_t)v8);
    return swift_release();
  }
  return result;
}

uint64_t sub_22C66C5B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  sub_22C68367C();
  *(_QWORD *)(v4 + 24) = sub_22C683670();
  sub_22C683658();
  return swift_task_switch();
}

uint64_t sub_22C66C624()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 16);
  result = swift_release();
  v3 = *(_QWORD *)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsSinceShown);
  v4 = __OFADD__(v3, 1);
  v5 = v3 + 1;
  if (v4)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v1 + OBJC_IVAR____TtC19PreviewsOSSupportUI19PreviewDebugOverlay_secondsSinceShown) = v5;
    sub_22C66B638();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

void sub_22C66C678(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

char *sub_22C66C6C8()
{
  char *v0;
  id v1;
  char *v2;
  id v3;
  id v4;
  char *v5;
  objc_super v7;

  *(_QWORD *)&v0[OBJC_IVAR____TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView_labelPadding] = 0x4010000000000000;
  v1 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v2 = v0;
  v3 = objc_msgSend(v1, sel_init);
  *(_QWORD *)&v2[OBJC_IVAR____TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView_label] = v3;
  v4 = v3;
  objc_msgSend(v4, sel_setAdjustsFontSizeToFitWidth_, 1);

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PreviewDebugOverlay.OverlayView();
  v5 = (char *)objc_msgSendSuper2(&v7, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v5, sel_addSubview_, *(_QWORD *)&v5[OBJC_IVAR____TtCC19PreviewsOSSupportUI19PreviewDebugOverlayP33_2167D653BE9BA0FB6EEBD3EBB5DDB07011OverlayView_label]);
  return v5;
}

void sub_22C66C834(char *a1, id a2)
{
  void *v2;
  void *v3;
  char v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;

  v3 = v2;
  v5 = *a1;
  objc_msgSend(a2, sel_addSubview_, v2);
  objc_msgSend(v2, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C148F0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_22C683F30;
  v7 = objc_msgSend(v3, sel_leadingAnchor);
  v8 = objc_msgSend(a2, sel_leadingAnchor);
  v9 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v8);

  *(_QWORD *)(v6 + 32) = v9;
  v10 = objc_msgSend(v3, sel_trailingAnchor);
  v11 = objc_msgSend(a2, sel_trailingAnchor);
  v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

  *(_QWORD *)(v6 + 40) = v12;
  v21 = v6;
  sub_22C683634();
  v13 = objc_allocWithZone(MEMORY[0x24BEBD4B8]);
  if ((v5 & 1) != 0)
  {
    v14 = objc_msgSend(v13, sel_initWithRed_green_blue_alpha_, 0.49, 0.75, 0.96, 1.0);
    objc_msgSend(v3, sel_setBackgroundColor_, v14);

    v15 = objc_msgSend(v3, sel_bottomAnchor);
    v16 = objc_msgSend(a2, sel_bottomAnchor);
  }
  else
  {
    v17 = objc_msgSend(v13, sel_initWithRed_green_blue_alpha_, 0.84, 0.51, 0.3, 1.0);
    objc_msgSend(v3, sel_setBackgroundColor_, v17);

    v15 = objc_msgSend(v3, sel_topAnchor);
    v16 = objc_msgSend(a2, sel_topAnchor);
  }
  v18 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

  MEMORY[0x22E2FE920]();
  if (*(_QWORD *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_22C683640();
  sub_22C68364C();
  sub_22C683634();
  v19 = (void *)objc_opt_self();
  sub_22C66D148(0, &qword_255C148F8);
  v20 = (id)sub_22C683628();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_activateConstraints_, v20);

}

id sub_22C66CCAC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PreviewDebugOverlay.OverlayView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id PreviewDebugOverlay.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PreviewDebugOverlay.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PreviewDebugOverlay.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_22C66CDA0()
{
  unint64_t result;

  result = qword_255C14818;
  if (!qword_255C14818)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for PreviewDebugOverlay.AlignmentEdge, &type metadata for PreviewDebugOverlay.AlignmentEdge);
    atomic_store(result, (unint64_t *)&qword_255C14818);
  }
  return result;
}

uint64_t type metadata accessor for PreviewDebugOverlay()
{
  return objc_opt_self();
}

uint64_t method lookup function for PreviewDebugOverlay()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PreviewDebugOverlay.__allocating_init(edge:parent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewDebugOverlay.AlignmentEdge(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PreviewDebugOverlay.AlignmentEdge(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22C66CF60 + 4 * byte_22C683F75[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22C66CF94 + 4 * byte_22C683F70[v4]))();
}

uint64_t sub_22C66CF94(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C66CF9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22C66CFA4);
  return result;
}

uint64_t sub_22C66CFB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22C66CFB8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22C66CFBC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C66CFC4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C66CFD0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22C66CFDC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewDebugOverlay.AlignmentEdge()
{
  return &type metadata for PreviewDebugOverlay.AlignmentEdge;
}

uint64_t type metadata accessor for PreviewDebugOverlay.OverlayView()
{
  return objc_opt_self();
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
  sub_22C66D428(a1, &qword_255C148E0);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_22C66D038(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22C66D058(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_22C66D428(a1, &qword_255C148E8);
}

BOOL sub_22C66D094(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_22C66D0A8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_22C66D0B8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2FEE6C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22C66D104()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_22C66D128(uint64_t a1)
{
  uint64_t v1;

  return sub_22C66C4DC(a1, v1);
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

uint64_t sub_22C66D148(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22C66D180()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_22C66D1AC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_22C66D218;
  return sub_22C66C5B8(a1, v4, v5, v6);
}

uint64_t sub_22C66D218()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_22C66D260()
{
  unint64_t result;

  result = qword_255C14928;
  if (!qword_255C14928)
  {
    result = MEMORY[0x22E2FEE84](MEMORY[0x24BEE5108], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_255C14928);
  }
  return result;
}

unint64_t sub_22C66D2A4()
{
  unint64_t result;

  result = qword_255C14930;
  if (!qword_255C14930)
  {
    result = MEMORY[0x22E2FEE84](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255C14930);
  }
  return result;
}

unint64_t sub_22C66D2E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255C14948;
  if (!qword_255C14948)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C14940);
    result = MEMORY[0x22E2FEE84](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_255C14948);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2FEE78](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for EntryPointType(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t sub_22C66D3BC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22C66D3DC(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
  sub_22C66D428(a1, (unint64_t *)&unk_255C14950);
}

void sub_22C66D428(uint64_t a1, unint64_t *a2)
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

PreviewsOSSupportUI::EntryPointCategory __swiftcall EntryPointCategory.init(stringLiteral:)(PreviewsOSSupportUI::EntryPointCategory stringLiteral)
{
  PreviewsOSSupportUI::EntryPointCategory *v1;

  *v1 = stringLiteral;
  return stringLiteral;
}

uint64_t EntryPointCategory.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t EntryPointCategory.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_22C6835F8();
  return swift_bridgeObjectRelease();
}

uint64_t static EntryPointCategory.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_22C6837A8();
}

uint64_t EntryPointCategory.hashValue.getter()
{
  sub_22C6837C0();
  swift_bridgeObjectRetain();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

_QWORD *sub_22C66D56C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_22C66D578()
{
  sub_22C6837C0();
  swift_bridgeObjectRetain();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C66D5D0()
{
  swift_bridgeObjectRetain();
  sub_22C6835F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C66D614()
{
  sub_22C6837C0();
  swift_bridgeObjectRetain();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C66D668()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22C66D694(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_22C6837A8();
}

void static EntryPointCategory.previewProvider.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000012;
  a1[1] = 0x800000022C686330;
}

void static EntryPointCategory.previewPreflight.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000013;
  a1[1] = 0x800000022C686350;
}

void static EntryPointCategory.complicationInstance.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000017;
  a1[1] = 0x800000022C686370;
}

void static EntryPointCategory.cFunction.getter(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "uv.cFunction");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void static EntryPointCategory.registryPreflight.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000014;
  a1[1] = 0x800000022C686390;
}

void static EntryPointCategory.registryExecution.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000014;
  a1[1] = 0x800000022C6863B0;
}

void static EntryPointCategory.noop.getter(_QWORD *a1@<X8>)
{
  *a1 = 0x706F6F6E2E7675;
  a1[1] = 0xE700000000000000;
}

void static EntryPointCategory.legacyMacStaticHosting.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000019;
  a1[1] = 0x800000022C6863D0;
}

void static EntryPointCategory.legacyMacLive.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x800000022C6863F0;
}

void static EntryPointCategory.nsPreviewHostable.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000014;
  a1[1] = 0x800000022C686410;
}

void static EntryPointCategory.previewInstance.getter(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000012;
  a1[1] = 0x800000022C686430;
}

void static EntryPointCategory.mainPreview.getter(char *a1@<X8>)
{
  strcpy(a1, "uv.mainPreview");
  a1[15] = -18;
}

void static EntryPointCategory.runningApp.getter(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "uv.runningApp");
  *(_WORD *)(a1 + 14) = -4864;
}

uint64_t AgentUpdate.Context.contentIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22C66E3B0((uint64_t (*)(_QWORD))MEMORY[0x24BE777F0], a1);
}

uint64_t AgentUpdate.Context.contentIdentifier.setter(uint64_t a1)
{
  return sub_22C66E3F8(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE777F0]);
}

uint64_t (*AgentUpdate.Context.contentIdentifier.modify())()
{
  return nullsub_1;
}

uint64_t AgentUpdate.Context.updateSeed.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for AgentUpdate.Context(0);
  return sub_22C66D98C(v1 + *(int *)(v3 + 20), a1, &qword_255C149C0);
}

uint64_t type metadata accessor for AgentUpdate.Context(uint64_t a1)
{
  return sub_22C671510(a1, (uint64_t *)&unk_255C14DF8);
}

uint64_t AgentUpdate.Context.updateSeed.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for AgentUpdate.Context(0);
  return sub_22C66DA0C(a1, v1 + *(int *)(v3 + 20), &qword_255C149C0);
}

uint64_t (*AgentUpdate.Context.updateSeed.modify())()
{
  type metadata accessor for AgentUpdate.Context(0);
  return nullsub_1;
}

uint64_t AgentUpdate.Context.setupPayload.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for AgentUpdate.Context(0);
  return sub_22C66D98C(v1 + *(int *)(v3 + 24), a1, &qword_255C149C8);
}

uint64_t sub_22C66D98C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t AgentUpdate.Context.setupPayload.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for AgentUpdate.Context(0);
  return sub_22C66DA0C(a1, v1 + *(int *)(v3 + 24), &qword_255C149C8);
}

uint64_t sub_22C66DA0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t (*AgentUpdate.Context.setupPayload.modify())()
{
  type metadata accessor for AgentUpdate.Context(0);
  return nullsub_1;
}

uint64_t AgentUpdate.Context.init(contentIdentifier:updateSeed:setupPayload:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = type metadata accessor for AgentUpdate.Context(0);
  v9 = a4 + *(int *)(v8 + 20);
  v10 = sub_22C683370();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = a4 + *(int *)(v8 + 24);
  v12 = sub_22C683394();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  v13 = sub_22C683388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a4, a1, v13);
  sub_22C66DA0C(a2, v9, &qword_255C149C0);
  return sub_22C66DA0C(a3, v11, &qword_255C149C8);
}

uint64_t AgentUpdate.entryPointCategory.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t AgentUpdate.entryPointPayload.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22C66E454(type metadata accessor for AgentUpdate, (uint64_t (*)(_QWORD))MEMORY[0x24BE76530], a1);
}

uint64_t type metadata accessor for AgentUpdate(uint64_t a1)
{
  return sub_22C671510(a1, qword_255C14D58);
}

uint64_t AgentUpdate.entryPointFrameworkPath.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for AgentUpdate(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AgentUpdate.context.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for AgentUpdate(0);
  return sub_22C66EC9C(v1 + *(int *)(v3 + 28), a1, type metadata accessor for AgentUpdate.Context);
}

uint64_t AgentUpdate.mangledFactoryName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for AgentUpdate(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AgentUpdate.mangledFactoryName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for AgentUpdate(0) + 32));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*AgentUpdate.mangledFactoryName.modify())()
{
  type metadata accessor for AgentUpdate(0);
  return nullsub_1;
}

uint64_t AgentUpdate.init(entryPointCategory:entryPointPayload:entryPointFrameworkPath:context:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  int *v13;
  _QWORD *v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;

  v11 = *a1;
  v12 = a1[1];
  v13 = (int *)type metadata accessor for AgentUpdate(0);
  v14 = (_QWORD *)((char *)a6 + v13[8]);
  *v14 = 0;
  v14[1] = 0;
  *a6 = v11;
  a6[1] = v12;
  v15 = (char *)a6 + v13[5];
  v16 = sub_22C6833F4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v15, a2, v16);
  v17 = (_QWORD *)((char *)a6 + v13[6]);
  *v17 = a3;
  v17[1] = a4;
  return sub_22C66ECE0(a5, (uint64_t)a6 + v13[7], type metadata accessor for AgentUpdate.Context);
}

uint64_t AgentUpdate.init(entryPointType:entryPointPayload:context:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  _QWORD *v12;
  _QWORD *v13;
  char *v14;
  uint64_t v15;

  v8 = a1[2];
  v7 = a1[3];
  v10 = *a1;
  v9 = a1[1];
  v11 = (int *)type metadata accessor for AgentUpdate(0);
  v12 = (_QWORD *)((char *)a4 + v11[8]);
  *a4 = 0x79726F74636166;
  a4[1] = 0xE700000000000000;
  v13 = (_QWORD *)((char *)a4 + v11[6]);
  *v13 = v8;
  v13[1] = v7;
  *v12 = v10;
  v12[1] = v9;
  v14 = (char *)a4 + v11[5];
  v15 = sub_22C6833F4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v14, a2, v15);
  return sub_22C66ECE0(a3, (uint64_t)a4 + v11[7], type metadata accessor for AgentUpdate.Context);
}

uint64_t AgentUpdate.init(contentIdentifier:entryPointType:entryPointPayload:setupPayload:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
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
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  _QWORD *v35;
  _QWORD *v36;
  _QWORD *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;

  v49 = a4;
  v57 = a1;
  v58 = a3;
  v60 = a5;
  v59 = type metadata accessor for AgentUpdate.Context(0);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = v13;
  v14 = sub_22C683388();
  v15 = *(_QWORD *)(v14 - 8);
  v47 = v14;
  v48 = v15;
  v16 = v15;
  MEMORY[0x24BDAC7A8]();
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_22C6833F4();
  v52 = *(_QWORD *)(v19 - 8);
  v53 = v19;
  MEMORY[0x24BDAC7A8]();
  v55 = *a2;
  v56 = (char *)&v45 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = a2[1];
  v21 = a2[2];
  v50 = a2[3];
  v51 = v21;
  (*(void (**)(void))(v22 + 16))();
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a1, v14);
  v23 = sub_22C683370();
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56);
  v24(v13, 1, 1, v23);
  v25 = sub_22C683394();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = (uint64_t)v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v11, a4, v25);
  v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
  v28(v11, 0, 1, v25);
  v29 = v59;
  v30 = (uint64_t)&v9[*(int *)(v59 + 20)];
  v24((char *)v30, 1, 1, v23);
  v31 = (uint64_t)&v9[*(int *)(v29 + 24)];
  v28((char *)v31, 1, 1, v25);
  v33 = v47;
  v32 = v48;
  (*(void (**)(char *, char *, uint64_t))(v48 + 32))(v9, v18, v47);
  sub_22C66DA0C((uint64_t)v46, v30, &qword_255C149C0);
  sub_22C66DA0C(v27, v31, &qword_255C149C8);
  v34 = (int *)type metadata accessor for AgentUpdate(0);
  v35 = v60;
  sub_22C66ECE0((uint64_t)v9, (uint64_t)v60 + v34[7], type metadata accessor for AgentUpdate.Context);
  v36 = (_QWORD *)((char *)v35 + v34[8]);
  *v35 = 0x79726F74636166;
  v35[1] = 0xE700000000000000;
  v37 = (_QWORD *)((char *)v35 + v34[6]);
  v38 = v50;
  *v37 = v51;
  v37[1] = v38;
  v39 = v56;
  v40 = v54;
  *v36 = v55;
  v36[1] = v40;
  v41 = (char *)v35 + v34[5];
  v43 = v52;
  v42 = v53;
  (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v41, v39, v53);
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v49, v25);
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v58, v42);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v57, v33);
}

uint64_t AgentUpdate.contentIdentifier.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for AgentUpdate(0) + 28);
  v4 = sub_22C683388();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SceneAgentConnectionContext.sceneIdentifier.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*SceneAgentConnectionContext.sceneIdentifier.modify())()
{
  return nullsub_1;
}

BOOL PreviewSceneRole.allowsAnimations.getter()
{
  _BYTE *v0;

  return (*v0 & 1) == 0;
}

PreviewsOSSupportUI::PreviewSceneRole_optional __swiftcall PreviewSceneRole.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  PreviewsOSSupportUI::PreviewSceneRole_optional result;
  char v5;

  v2 = v1;
  v3 = sub_22C683784();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

uint64_t PreviewSceneRole.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x636974617473;
  else
    return 0x646574736F68;
}

uint64_t sub_22C66E2A4(char *a1, char *a2)
{
  return sub_22C67A094(*a1, *a2);
}

uint64_t sub_22C66E2B0()
{
  return sub_22C67A108();
}

uint64_t sub_22C66E2B8()
{
  return sub_22C67A8AC();
}

uint64_t sub_22C66E2C0()
{
  return sub_22C67ACD4();
}

PreviewsOSSupportUI::PreviewSceneRole_optional sub_22C66E2C8(Swift::String *a1)
{
  return PreviewSceneRole.init(rawValue:)(*a1);
}

uint64_t sub_22C66E2D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PreviewSceneRole.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22C66E2F8()
{
  sub_22C678748();
  return sub_22C68346C();
}

uint64_t sub_22C66E340()
{
  sub_22C678748();
  return sub_22C683478();
}

uint64_t SceneUpdateContext.seed.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22C66E3B0((uint64_t (*)(_QWORD))MEMORY[0x24BE78778], a1);
}

uint64_t sub_22C66E3B0@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = a1(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v2, v4);
}

uint64_t SceneUpdateContext.seed.setter(uint64_t a1)
{
  return sub_22C66E3F8(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE78778]);
}

uint64_t sub_22C66E3F8(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v4;

  v4 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v2, a1, v4);
}

uint64_t (*SceneUpdateContext.seed.modify())()
{
  return nullsub_1;
}

uint64_t SceneUpdateContext.timing.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_22C66E454(type metadata accessor for SceneUpdateContext, (uint64_t (*)(_QWORD))MEMORY[0x24BE787B8], a1);
}

uint64_t sub_22C66E454@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v6 = v3 + *(int *)(a1(0) + 20);
  v7 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a3, v6, v7);
}

uint64_t type metadata accessor for SceneUpdateContext(uint64_t a1)
{
  return sub_22C671510(a1, qword_255C14EA0);
}

uint64_t SceneUpdateContext.timing.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SceneUpdateContext(0) + 20);
  v4 = sub_22C6832F8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*SceneUpdateContext.timing.modify())()
{
  type metadata accessor for SceneUpdateContext(0);
  return nullsub_1;
}

uint64_t SceneUpdateContext.role.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for SceneUpdateContext(0);
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 24));
  return result;
}

uint64_t SceneUpdateContext.role.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for SceneUpdateContext(0);
  *(_BYTE *)(v1 + *(int *)(result + 24)) = v2;
  return result;
}

uint64_t (*SceneUpdateContext.role.modify())()
{
  type metadata accessor for SceneUpdateContext(0);
  return nullsub_1;
}

uint64_t SceneUpdateContext.init(seed:timing:role:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X8>)
{
  char v7;
  uint64_t v8;
  uint64_t updated;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v7 = *a3;
  v8 = sub_22C6832EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a4, a1, v8);
  updated = type metadata accessor for SceneUpdateContext(0);
  v10 = a4 + *(int *)(updated + 20);
  v11 = sub_22C6832F8();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10, a2, v11);
  *(_BYTE *)(a4 + *(int *)(updated + 24)) = v7;
  return result;
}

uint64_t sub_22C66E648()
{
  sub_22C66F844(&qword_255C14FD8, (uint64_t (*)(uint64_t))MEMORY[0x24BE787B8], MEMORY[0x24BE787C8]);
  return sub_22C68346C();
}

uint64_t sub_22C66E6A8()
{
  sub_22C66F844(&qword_255C14FD8, (uint64_t (*)(uint64_t))MEMORY[0x24BE787B8], MEMORY[0x24BE787C8]);
  return sub_22C683478();
}

uint64_t sub_22C66E724()
{
  sub_22C66F844(&qword_255C14FD0, (uint64_t (*)(uint64_t))MEMORY[0x24BE78778], MEMORY[0x24BE78790]);
  return sub_22C68346C();
}

uint64_t sub_22C66E784()
{
  sub_22C66F844(&qword_255C14FD0, (uint64_t (*)(uint64_t))MEMORY[0x24BE78778], MEMORY[0x24BE78790]);
  return sub_22C683478();
}

uint64_t sub_22C66E814@<X0>(BOOL *a1@<X8>)
{
  return sub_22C672850(a1);
}

uint64_t sub_22C66E820@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_22C6785FC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22C66E844()
{
  sub_22C6784EC();
  return sub_22C68346C();
}

uint64_t sub_22C66E88C()
{
  sub_22C6784EC();
  return sub_22C683478();
}

uint64_t sub_22C66E8F0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x657461647075;
  else
    return 0x696D697263736964;
}

uint64_t sub_22C66E92C(char *a1, char *a2)
{
  return sub_22C679AA0(*a1, *a2);
}

uint64_t sub_22C66E938()
{
  return sub_22C67A174();
}

uint64_t sub_22C66E940()
{
  return sub_22C67A7D0();
}

uint64_t sub_22C66E948()
{
  return sub_22C67AE84();
}

uint64_t sub_22C66E950@<X0>(char *a1@<X8>)
{
  return sub_22C66FEF4(a1);
}

uint64_t sub_22C66E95C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22C66E8F0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22C66E984()
{
  char *v0;

  return sub_22C66E8F0(*v0);
}

uint64_t ShellToPreviewNonUIAgent.TwoWayMessage.propertyListValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  _BYTE v11[16];
  uint64_t v12;
  char v13[24];
  ValueMetadata *v14;
  unint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C149D0);
  MEMORY[0x24BDAC7A8]();
  v2 = &v11[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = type metadata accessor for AgentUpdate(0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for ShellToPreviewNonUIAgent.TwoWayMessage(0);
  MEMORY[0x24BDAC7A8]();
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = v0;
  v9 = sub_22C66EC14();
  sub_22C66EC58();
  sub_22C6833E8();
  sub_22C66EC9C(v0, (uint64_t)v8, type metadata accessor for ShellToPreviewNonUIAgent.TwoWayMessage);
  sub_22C66ECE0((uint64_t)v8, (uint64_t)v6, type metadata accessor for AgentUpdate);
  sub_22C66EC9C((uint64_t)v6, (uint64_t)v2, type metadata accessor for AgentUpdate);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  v14 = &type metadata for ShellToPreviewNonUIAgent.TwoWayMessage.Key;
  v15 = v9;
  v13[0] = 1;
  sub_22C66F844(&qword_255C149E8, type metadata accessor for AgentUpdate, (uint64_t)&protocol conformance descriptor for AgentUpdate);
  sub_22C6833A0();
  sub_22C67878C((uint64_t)v2, &qword_255C149D0);
  sub_22C66F808((uint64_t)v6, type metadata accessor for AgentUpdate);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t type metadata accessor for ShellToPreviewNonUIAgent.TwoWayMessage(uint64_t a1)
{
  return sub_22C671510(a1, (uint64_t *)&unk_255C14B70);
}

uint64_t sub_22C66EB7C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(_QWORD);
  uint64_t result;
  uint64_t v10;

  type metadata accessor for ShellToPreviewNonUIAgent.TwoWayMessage(0);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0;
  sub_22C66EC9C(a3, (uint64_t)v7, v8);
  result = sub_22C66F808((uint64_t)v7, type metadata accessor for AgentUpdate);
  *a2 = 0;
  return result;
}

uint64_t sub_22C66EC0C(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;

  return sub_22C66EB7C(a1, a2, *(_QWORD *)(v2 + 16));
}

unint64_t sub_22C66EC14()
{
  unint64_t result;

  result = qword_255C149D8;
  if (!qword_255C149D8)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C685644, &type metadata for ShellToPreviewNonUIAgent.TwoWayMessage.Key);
    atomic_store(result, (unint64_t *)&qword_255C149D8);
  }
  return result;
}

unint64_t sub_22C66EC58()
{
  unint64_t result;

  result = qword_255C149E0;
  if (!qword_255C149E0)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C685604, &type metadata for ShellToPreviewNonUIAgent.TwoWayMessage.Discriminant);
    atomic_store(result, (unint64_t *)&qword_255C149E0);
  }
  return result;
}

uint64_t sub_22C66EC9C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22C66ECE0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
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

uint64_t ShellToPreviewNonUIAgent.TwoWayMessage.init(propertyListValue:)(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  _BYTE v6[24];
  ValueMetadata *v7;
  unint64_t v8;

  v7 = &type metadata for ShellToPreviewNonUIAgent.TwoWayMessage.Key;
  v3 = sub_22C66EC14();
  v8 = v3;
  v6[0] = 0;
  sub_22C66EC58();
  sub_22C6833AC();
  if (!v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
    v7 = &type metadata for ShellToPreviewNonUIAgent.TwoWayMessage.Key;
    v8 = v3;
    v6[0] = 1;
    type metadata accessor for AgentUpdate(0);
    sub_22C66F844(&qword_255C149E8, type metadata accessor for AgentUpdate, (uint64_t)&protocol conformance descriptor for AgentUpdate);
    sub_22C6833AC();
  }
  v4 = sub_22C6833F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

uint64_t sub_22C66EE40(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22C66EE78 + 4 * byte_22C684110[a1]))(0xD000000000000012, 0x800000022C685E80);
}

uint64_t sub_22C66EE78(uint64_t a1)
{
  return a1 - 1;
}

uint64_t sub_22C66EEC8(uint64_t a1)
{
  return ShellToPreviewNonUIAgent.TwoWayMessage.init(propertyListValue:)(a1);
}

void sub_22C66EEDC(char *a1)
{
  sub_22C679F44(*a1);
}

void sub_22C66EEE8()
{
  char *v0;

  sub_22C67A1F8(*v0);
}

void sub_22C66EEF0(uint64_t a1)
{
  char *v1;

  sub_22C67AA00(a1, *v1);
}

void sub_22C66EEF8(uint64_t a1)
{
  char *v1;

  sub_22C67AAA4(a1, *v1);
}

uint64_t sub_22C66EF00@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22C678620();
  *a1 = result;
  return result;
}

uint64_t sub_22C66EF2C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22C66EE40(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22C66EF54()
{
  unsigned __int8 *v0;

  return sub_22C66EE40(*v0);
}

void sub_22C66EF5C(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F6E2B50;
}

uint64_t AgentUpdate.propertyListValue.getter()
{
  return sub_22C6833DC();
}

uint64_t sub_22C66EF98(uint64_t *a1)
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
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  _BYTE *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  char v61;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255C15020);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v48 = (uint64_t)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A08);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v46 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C15028);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v47 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v39 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C15030);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v50 = (uint64_t)&v39 - v13;
  v14 = *a1;
  v41 = a1[1];
  v42 = v14;
  v15 = (char *)&v39 + *(int *)(v12 + 48) - v13;
  *((_BYTE *)&v39 - v13) = 1;
  v16 = (int *)type metadata accessor for AgentUpdate(0);
  v17 = (char *)a1 + v16[5];
  v18 = sub_22C6833F4();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
  v20(v15, v17, v18);
  v21 = v16[7];
  v22 = (uint64_t *)((char *)a1 + v16[6]);
  v23 = *v22;
  v39 = v22[1];
  v40 = v23;
  v24 = v45;
  v25 = *(int *)(v45 + 48);
  v26 = v7;
  v49 = v7;
  v27 = (uint64_t)&v7[v25];
  *v26 = 3;
  sub_22C66EC9C((uint64_t)a1 + v21, v27, type metadata accessor for AgentUpdate.Context);
  v28 = (uint64_t *)((char *)a1 + v16[8]);
  v29 = *v28;
  v43 = v28[1];
  v44 = v29;
  v61 = 0;
  v59 = v42;
  v60 = v41;
  v30 = &v11[*(int *)(v8 + 48)];
  *v11 = 1;
  v20(v30, v15, v18);
  v31 = (uint64_t)v46;
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v46, v30, v18);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v19 + 56))(v31, 0, 1, v18);
  v58 = 1;
  v57 = 2;
  v55 = v40;
  v56 = v39;
  v32 = *(int *)(v24 + 48);
  v33 = v47;
  v34 = (uint64_t)&v47[v32];
  *v47 = 3;
  sub_22C66EC9C(v27, (uint64_t)&v33[v32], type metadata accessor for AgentUpdate.Context);
  v35 = v48;
  sub_22C66ECE0(v34, v48, type metadata accessor for AgentUpdate.Context);
  v36 = type metadata accessor for AgentUpdate.Context(0);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v35, 0, 1, v36);
  v54 = 3;
  v53 = 4;
  v51 = v44;
  v52 = v43;
  sub_22C66F780();
  sub_22C66F7C4();
  sub_22C66F844(&qword_255C14A00, type metadata accessor for AgentUpdate.Context, (uint64_t)&protocol conformance descriptor for AgentUpdate.Context);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v37 = sub_22C683430();
  sub_22C67878C(v35, &qword_255C15020);
  swift_bridgeObjectRelease();
  sub_22C67878C(v31, &qword_255C14A08);
  swift_bridgeObjectRelease();
  sub_22C67878C((uint64_t)v49, &qword_255C15028);
  sub_22C67878C(v50, &qword_255C15030);
  return v37;
}

uint64_t sub_22C66F3BC()
{
  uint64_t v0;

  return sub_22C66EF98(*(uint64_t **)(v0 + 16));
}

uint64_t AgentUpdate.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  __int128 v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char *v25;
  _BYTE v26[24];
  ValueMetadata *v27;
  unint64_t v28;
  __int128 v29;
  char *v30;

  v5 = type metadata accessor for AgentUpdate.Context(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22C6833F4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (int *)type metadata accessor for AgentUpdate(0);
  v13 = v12[8];
  v25 = a2;
  v14 = &a2[v13];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v30 = v14;
  v27 = &type metadata for AgentUpdate.Key;
  v15 = sub_22C66F780();
  v28 = v15;
  v26[0] = 0;
  sub_22C66F7C4();
  sub_22C6833AC();
  if (v2)
  {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v23 = v5;
    v24 = v7;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    v16 = *((_QWORD *)&v29 + 1);
    v17 = v25;
    *(_QWORD *)v25 = v29;
    *((_QWORD *)v17 + 1) = v16;
    v27 = &type metadata for AgentUpdate.Key;
    v28 = v15;
    v26[0] = 1;
    sub_22C6833AC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    v18 = v9;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v17[v12[5]], v11, v8);
    v27 = &type metadata for AgentUpdate.Key;
    v28 = v15;
    v26[0] = 2;
    sub_22C6833D0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    *(_OWORD *)&v17[v12[6]] = v29;
    v27 = &type metadata for AgentUpdate.Key;
    v28 = v15;
    v26[0] = 3;
    sub_22C66F844(&qword_255C14A00, type metadata accessor for AgentUpdate.Context, (uint64_t)&protocol conformance descriptor for AgentUpdate.Context);
    v19 = (uint64_t)v24;
    sub_22C6833AC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    sub_22C66ECE0(v19, (uint64_t)&v17[v12[7]], type metadata accessor for AgentUpdate.Context);
    v27 = &type metadata for AgentUpdate.Key;
    v28 = v15;
    v26[0] = 4;
    sub_22C6833D0();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a1, v8);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    v21 = v29;
    v22 = v30;
    result = swift_bridgeObjectRelease();
    *(_OWORD *)v22 = v21;
  }
  return result;
}

unint64_t sub_22C66F780()
{
  unint64_t result;

  result = qword_255C149F0;
  if (!qword_255C149F0)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C6855DC, &type metadata for AgentUpdate.Key);
    atomic_store(result, (unint64_t *)&qword_255C149F0);
  }
  return result;
}

unint64_t sub_22C66F7C4()
{
  unint64_t result;

  result = qword_255C149F8;
  if (!qword_255C149F8)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for EntryPointCategory, &type metadata for EntryPointCategory);
    atomic_store(result, (unint64_t *)&qword_255C149F8);
  }
  return result;
}

uint64_t sub_22C66F808(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22C66F844(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E2FEE84](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22C66F884()
{
  return sub_22C6833DC();
}

uint64_t sub_22C66F8B0@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  return AgentUpdate.init(propertyListValue:)(a1, a2);
}

uint64_t sub_22C66F8C4()
{
  return 1;
}

uint64_t sub_22C66F8D0()
{
  return sub_22C6835F8();
}

uint64_t sub_22C66F8F0@<X0>(BOOL *a1@<X8>)
{
  return sub_22C672850(a1);
}

void sub_22C66F8FC(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000013;
  a1[1] = 0x800000022C685F00;
}

uint64_t sub_22C66F91C()
{
  sub_22C678530();
  return sub_22C68346C();
}

uint64_t sub_22C66F964()
{
  sub_22C678530();
  return sub_22C683478();
}

uint64_t sub_22C66F9C8(char a1)
{
  return *(_QWORD *)&aDiscrimiidenti[8 * a1];
}

uint64_t sub_22C66F9E8(char *a1, char *a2)
{
  return sub_22C6798E8(*a1, *a2);
}

uint64_t sub_22C66F9F4()
{
  return sub_22C67A2CC();
}

uint64_t sub_22C66F9FC()
{
  return sub_22C67A6E8();
}

uint64_t sub_22C66FA04()
{
  return sub_22C67AF04();
}

uint64_t sub_22C66FA0C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22C6786D4();
  *a1 = result;
  return result;
}

uint64_t sub_22C66FA40@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22C66F9C8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22C66FA68()
{
  char *v0;

  return sub_22C66F9C8(*v0);
}

uint64_t ShellToPreviewNonUIAgent.XPCEndpointContext.propertyListValue.getter()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v21;
  char *v22;
  uint64_t v23;
  _BYTE v24[24];
  ValueMetadata *v25;
  unint64_t v26;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A08);
  MEMORY[0x24BDAC7A8](v1);
  v21 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A10);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22C6833F4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v22 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_22C683388();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for ShellToPreviewNonUIAgent.XPCEndpointContext(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = v0;
  v16 = sub_22C66FDA8();
  sub_22C66FDEC();
  sub_22C6833E8();
  sub_22C66EC9C(v0, (uint64_t)v15, type metadata accessor for ShellToPreviewNonUIAgent.XPCEndpointContext);
  v17 = &v15[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C14A28) + 48)];
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v22, v17, v6);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v5, v12, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v5, 0, 1, v9);
  v25 = &type metadata for ShellToPreviewNonUIAgent.XPCEndpointContext.Key;
  v26 = v16;
  v24[0] = 1;
  sub_22C66F844(&qword_255C14A30, (uint64_t (*)(uint64_t))MEMORY[0x24BE777F0], MEMORY[0x24BE777E8]);
  sub_22C6833A0();
  sub_22C67878C((uint64_t)v5, &qword_255C14A10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  v18 = (uint64_t)v21;
  v19 = v22;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v21, v22, v6);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v18, 0, 1, v6);
  v25 = &type metadata for ShellToPreviewNonUIAgent.XPCEndpointContext.Key;
  v26 = v16;
  v24[0] = 2;
  sub_22C6833A0();
  sub_22C67878C(v18, &qword_255C14A08);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v19, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
}

uint64_t type metadata accessor for ShellToPreviewNonUIAgent.XPCEndpointContext(uint64_t a1)
{
  return sub_22C671510(a1, (uint64_t *)&unk_255C14BF0);
}

uint64_t sub_22C66FD88(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;

  return sub_22C671544(a1, a2, *(_QWORD *)(v2 + 16), type metadata accessor for ShellToPreviewNonUIAgent.XPCEndpointContext);
}

unint64_t sub_22C66FDA8()
{
  unint64_t result;

  result = qword_255C14A18;
  if (!qword_255C14A18)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C6855B4, &type metadata for ShellToPreviewNonUIAgent.XPCEndpointContext.Key);
    atomic_store(result, (unint64_t *)&qword_255C14A18);
  }
  return result;
}

unint64_t sub_22C66FDEC()
{
  unint64_t result;

  result = qword_255C14A20;
  if (!qword_255C14A20)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C685574, &type metadata for ShellToPreviewNonUIAgent.XPCEndpointContext.Discriminant);
    atomic_store(result, (unint64_t *)&qword_255C14A20);
  }
  return result;
}

uint64_t ShellToPreviewNonUIAgent.XPCEndpointContext.init(propertyListValue:)(uint64_t a1)
{
  return sub_22C6716F0(a1, (uint64_t)&type metadata for ShellToPreviewNonUIAgent.XPCEndpointContext.Key, (uint64_t (*)(void))sub_22C66FDA8, (void (*)(void))sub_22C66FDEC);
}

uint64_t sub_22C66FE64(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000014;
  else
    return 0x556D726F66726570;
}

uint64_t sub_22C66FEB0(uint64_t a1)
{
  return ShellToPreviewNonUIAgent.XPCEndpointContext.init(propertyListValue:)(a1);
}

uint64_t sub_22C66FEC4(char *a1, char *a2)
{
  return sub_22C6799F0(*a1, *a2);
}

uint64_t sub_22C66FED0()
{
  return sub_22C67A334();
}

uint64_t sub_22C66FED8()
{
  return sub_22C67A768();
}

uint64_t sub_22C66FEE0()
{
  return sub_22C67AF68();
}

uint64_t sub_22C66FEE8@<X0>(char *a1@<X8>)
{
  return sub_22C66FEF4(a1);
}

uint64_t sub_22C66FEF4@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_22C683784();
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

uint64_t sub_22C66FF4C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22C66FE64(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22C66FF74()
{
  sub_22C678574();
  return sub_22C68346C();
}

uint64_t sub_22C66FFBC()
{
  sub_22C678574();
  return sub_22C683478();
}

uint64_t sub_22C670020(char a1)
{
  return *(_QWORD *)&aDiscrimiupdate[8 * a1];
}

uint64_t sub_22C670040(char *a1, char *a2)
{
  return sub_22C67996C(*a1, *a2);
}

uint64_t sub_22C67004C()
{
  return sub_22C67A3C4();
}

uint64_t sub_22C670054()
{
  return sub_22C67A728();
}

uint64_t sub_22C67005C()
{
  return sub_22C67AFF4();
}

uint64_t sub_22C670064@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22C6786D4();
  *a1 = result;
  return result;
}

uint64_t sub_22C670098@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22C670020(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22C6700C0()
{
  char *v0;

  return sub_22C670020(*v0);
}

uint64_t ShellToPreviewSceneAgent.TwoWayMessage.propertyListValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t updated;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE v28[24];
  ValueMetadata *v29;
  unint64_t v30;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A38);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149D0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  updated = type metadata accessor for SceneUpdateContext(0);
  v23 = *(_QWORD *)(updated - 8);
  v24 = updated;
  MEMORY[0x24BDAC7A8](updated);
  v25 = (uint64_t)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for AgentUpdate(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage(0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = v1;
  v18 = sub_22C670508();
  sub_22C67054C();
  v26 = a1;
  sub_22C6833E8();
  sub_22C66EC9C(v1, (uint64_t)v17, type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A50);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 48))(v17, 1, v19);
  if ((_DWORD)result != 1)
  {
    v21 = (uint64_t)&v17[*(int *)(v19 + 48)];
    sub_22C66ECE0((uint64_t)v17, (uint64_t)v14, type metadata accessor for AgentUpdate);
    v22 = v25;
    sub_22C66ECE0(v21, v25, type metadata accessor for SceneUpdateContext);
    sub_22C66EC9C((uint64_t)v14, (uint64_t)v8, type metadata accessor for AgentUpdate);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v8, 0, 1, v11);
    v29 = &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Key;
    v30 = v18;
    v28[0] = 1;
    sub_22C66F844(&qword_255C149E8, type metadata accessor for AgentUpdate, (uint64_t)&protocol conformance descriptor for AgentUpdate);
    sub_22C6833A0();
    sub_22C67878C((uint64_t)v8, &qword_255C149D0);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
    sub_22C66EC9C(v22, (uint64_t)v5, type metadata accessor for SceneUpdateContext);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v5, 0, 1, v24);
    v29 = &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Key;
    v30 = v18;
    v28[0] = 2;
    sub_22C66F844(&qword_255C14A58, type metadata accessor for SceneUpdateContext, (uint64_t)&protocol conformance descriptor for SceneUpdateContext);
    sub_22C6833A0();
    sub_22C67878C((uint64_t)v5, &qword_255C14A38);
    sub_22C66F808(v22, type metadata accessor for SceneUpdateContext);
    sub_22C66F808((uint64_t)v14, type metadata accessor for AgentUpdate);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  }
  return result;
}

uint64_t type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage(uint64_t a1)
{
  return sub_22C671510(a1, (uint64_t *)&unk_255C14C70);
}

uint64_t sub_22C670420(_BYTE *a1, BOOL *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t (*v9)(_QWORD);
  uint64_t v10;
  uint64_t result;
  int v12;
  uint64_t v13;

  v6 = type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0;
  sub_22C66EC9C(a3, (uint64_t)v8, v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A50);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v8, 1, v10);
  v12 = result;
  if ((_DWORD)result != 1)
  {
    sub_22C66F808((uint64_t)&v8[*(int *)(v10 + 48)], type metadata accessor for SceneUpdateContext);
    result = sub_22C66F808((uint64_t)v8, type metadata accessor for AgentUpdate);
  }
  *a2 = v12 == 1;
  return result;
}

uint64_t sub_22C670500(_BYTE *a1, BOOL *a2)
{
  uint64_t v2;

  return sub_22C670420(a1, a2, *(_QWORD *)(v2 + 16));
}

unint64_t sub_22C670508()
{
  unint64_t result;

  result = qword_255C14A40;
  if (!qword_255C14A40)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C68554C, &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Key);
    atomic_store(result, (unint64_t *)&qword_255C14A40);
  }
  return result;
}

unint64_t sub_22C67054C()
{
  unint64_t result;

  result = qword_255C14A48;
  if (!qword_255C14A48)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C68550C, &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Discriminant);
    atomic_store(result, (unint64_t *)&qword_255C14A48);
  }
  return result;
}

uint64_t ShellToPreviewSceneAgent.TwoWayMessage.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];
  ValueMetadata *v16;
  unint64_t v17;
  char v18;

  v5 = type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v15[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Key;
  v8 = sub_22C670508();
  v17 = v8;
  v15[0] = 0;
  sub_22C67054C();
  sub_22C6833AC();
  if (v2)
  {
    v9 = sub_22C6833F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    if ((v18 & 1) != 0)
    {
      v11 = sub_22C6833F4();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A50);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a2, 1, 1, v12);
    }
    else
    {
      v16 = &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Key;
      v17 = v8;
      v15[0] = 1;
      type metadata accessor for AgentUpdate(0);
      sub_22C66F844(&qword_255C149E8, type metadata accessor for AgentUpdate, (uint64_t)&protocol conformance descriptor for AgentUpdate);
      sub_22C6833AC();
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A50);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      v16 = &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Key;
      v17 = v8;
      v15[0] = 2;
      type metadata accessor for SceneUpdateContext(0);
      sub_22C66F844(&qword_255C14A58, type metadata accessor for SceneUpdateContext, (uint64_t)&protocol conformance descriptor for SceneUpdateContext);
      sub_22C6833AC();
      v14 = sub_22C6833F4();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(a1, v14);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 0, 1, v13);
      return sub_22C66ECE0((uint64_t)v7, a2, type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage);
    }
  }
}

uint64_t sub_22C670820(char a1)
{
  return *(_QWORD *)&aSeed_1[8 * a1];
}

uint64_t sub_22C670844@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return ShellToPreviewSceneAgent.TwoWayMessage.init(propertyListValue:)(a1, a2);
}

uint64_t sub_22C670858(char *a1, char *a2)
{
  return sub_22C679C70(*a1, *a2);
}

uint64_t sub_22C670864()
{
  return sub_22C67A42C();
}

uint64_t sub_22C67086C()
{
  return sub_22C67A86C();
}

uint64_t sub_22C670874()
{
  return sub_22C67AD3C();
}

uint64_t sub_22C67087C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22C6786D4();
  *a1 = result;
  return result;
}

uint64_t sub_22C6708B0@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22C670820(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22C6708D8()
{
  char *v0;

  return sub_22C670820(*v0);
}

void sub_22C6708E0(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F6E2D38;
}

uint64_t SceneUpdateContext.propertyListValue.getter()
{
  return sub_22C6833DC();
}

uint64_t sub_22C67091C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  char *v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t updated;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_BYTE *, uint64_t, uint64_t);
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE *v42;
  char *v43;
  _BYTE *v44;
  char *v45;
  uint64_t v46;
  char v47;
  char v48;
  char v49;
  char v50;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C15000);
  MEMORY[0x24BDAC7A8](v2);
  v45 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C15008);
  MEMORY[0x24BDAC7A8](v4);
  v43 = (char *)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C15010);
  v41 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v42 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v38 - v9;
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C15018);
  v11 = MEMORY[0x24BDAC7A8](v40);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v46 = (uint64_t)&v38 - v15;
  v39 = (char *)&v38 + *(int *)(v14 + 48) - v15;
  v16 = v39;
  *((_BYTE *)&v38 - v15) = 0;
  v38 = sub_22C6832EC();
  v17 = *(_QWORD *)(v38 - 8);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  v19 = v16;
  v20 = a1;
  v18(v19, a1, v38);
  v21 = *(int *)(v6 + 48);
  v44 = v10;
  v22 = &v10[v21];
  *v10 = 1;
  updated = type metadata accessor for SceneUpdateContext(0);
  v24 = v20 + *(int *)(updated + 20);
  v25 = sub_22C6832F8();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v26 + 16);
  v27(v22, v24, v25);
  LOBYTE(v24) = *(_BYTE *)(v20 + *(int *)(updated + 24));
  v28 = v39;
  v29 = &v13[*(int *)(v40 + 48)];
  *v13 = 0;
  v30 = v38;
  v18(v29, (uint64_t)v28, v38);
  v31 = (uint64_t)v43;
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v43, v29, v30);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v17 + 56))(v31, 0, 1, v30);
  v50 = 0;
  v32 = v42;
  v33 = *(int *)(v41 + 48);
  v34 = &v42[v33];
  *v42 = 1;
  v27(&v32[v33], (uint64_t)v22, v25);
  v35 = (uint64_t)v45;
  (*(void (**)(char *, _BYTE *, uint64_t))(v26 + 32))(v45, v34, v25);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v26 + 56))(v35, 0, 1, v25);
  v49 = 1;
  v48 = 2;
  v47 = v24;
  sub_22C670FA0();
  sub_22C66F844(&qword_255C14A68, (uint64_t (*)(uint64_t))MEMORY[0x24BE78778], (uint64_t)&protocol conformance descriptor for SceneUpdateSeed);
  sub_22C66F844(&qword_255C14A70, (uint64_t (*)(uint64_t))MEMORY[0x24BE787B8], (uint64_t)&protocol conformance descriptor for SceneUpdateTiming);
  sub_22C670FE4();
  v36 = sub_22C68343C();
  sub_22C67878C(v35, &qword_255C15000);
  sub_22C67878C(v31, &qword_255C15008);
  sub_22C67878C((uint64_t)v44, &qword_255C15010);
  sub_22C67878C(v46, &qword_255C15018);
  return v36;
}

uint64_t sub_22C670CB8()
{
  uint64_t v0;

  return sub_22C67091C(*(_QWORD *)(v0 + 16));
}

uint64_t SceneUpdateContext.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t updated;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[24];
  ValueMetadata *v24;
  unint64_t v25;
  char v26;

  v21 = a2;
  v22 = sub_22C6832F8();
  v4 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22C6832EC();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BE78778];
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = &type metadata for SceneUpdateContext.Key;
  v12 = sub_22C670FA0();
  v25 = v12;
  v23[0] = 0;
  sub_22C66F844(&qword_255C14A68, v8, (uint64_t)&protocol conformance descriptor for SceneUpdateSeed);
  sub_22C6833AC();
  if (v2)
  {
    v13 = sub_22C6833F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a1, v13);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
  }
  else
  {
    v20 = v4;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    v15 = v21;
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v21, v11, v7);
    v24 = &type metadata for SceneUpdateContext.Key;
    v25 = v12;
    v23[0] = 1;
    sub_22C66F844(&qword_255C14A70, (uint64_t (*)(uint64_t))MEMORY[0x24BE787B8], (uint64_t)&protocol conformance descriptor for SceneUpdateTiming);
    v16 = v22;
    sub_22C6833AC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    updated = type metadata accessor for SceneUpdateContext(0);
    (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v15 + *(int *)(updated + 20), v6, v16);
    v24 = &type metadata for SceneUpdateContext.Key;
    v25 = v12;
    v23[0] = 2;
    sub_22C670FE4();
    sub_22C6833AC();
    v17 = sub_22C6833F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(a1, v17);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    *(_BYTE *)(v15 + *(int *)(updated + 24)) = v26;
  }
  return result;
}

unint64_t sub_22C670FA0()
{
  unint64_t result;

  result = qword_255C14A60;
  if (!qword_255C14A60)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C6854E4, &type metadata for SceneUpdateContext.Key);
    atomic_store(result, (unint64_t *)&qword_255C14A60);
  }
  return result;
}

unint64_t sub_22C670FE4()
{
  unint64_t result;

  result = qword_255C14A78;
  if (!qword_255C14A78)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for PreviewSceneRole, &type metadata for PreviewSceneRole);
    atomic_store(result, (unint64_t *)&qword_255C14A78);
  }
  return result;
}

uint64_t sub_22C671028()
{
  return sub_22C6833DC();
}

uint64_t sub_22C671054@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return SceneUpdateContext.init(propertyListValue:)(a1, a2);
}

uint64_t sub_22C671068()
{
  sub_22C6837C0();
  sub_22C6835F8();
  return sub_22C6837D8();
}

uint64_t sub_22C6710BC()
{
  sub_22C6837C0();
  sub_22C6835F8();
  return sub_22C6837D8();
}

uint64_t sub_22C67110C@<X0>(BOOL *a1@<X8>)
{
  return sub_22C672850(a1);
}

uint64_t sub_22C671118()
{
  sub_22C6785B8();
  return sub_22C68346C();
}

uint64_t sub_22C671160()
{
  sub_22C6785B8();
  return sub_22C683478();
}

uint64_t sub_22C6711C4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22C6786D4();
  *a1 = result;
  return result;
}

uint64_t ShellToPreviewSceneAgent.XPCEndpointContext.propertyListValue.getter()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v21;
  char *v22;
  uint64_t v23;
  _BYTE v24[24];
  ValueMetadata *v25;
  unint64_t v26;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A08);
  MEMORY[0x24BDAC7A8](v1);
  v21 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A10);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22C6833F4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v22 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_22C683388();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for ShellToPreviewSceneAgent.XPCEndpointContext(0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = v0;
  v16 = sub_22C671634();
  sub_22C671678();
  sub_22C6833E8();
  sub_22C66EC9C(v0, (uint64_t)v15, type metadata accessor for ShellToPreviewSceneAgent.XPCEndpointContext);
  v17 = &v15[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C14A28) + 48)];
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v22, v17, v6);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v5, v12, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v5, 0, 1, v9);
  v25 = &type metadata for ShellToPreviewSceneAgent.XPCEndpointContext.Key;
  v26 = v16;
  v24[0] = 1;
  sub_22C66F844(&qword_255C14A30, (uint64_t (*)(uint64_t))MEMORY[0x24BE777F0], MEMORY[0x24BE777E8]);
  sub_22C6833A0();
  sub_22C67878C((uint64_t)v5, &qword_255C14A10);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  v18 = (uint64_t)v21;
  v19 = v22;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v21, v22, v6);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v18, 0, 1, v6);
  v25 = &type metadata for ShellToPreviewSceneAgent.XPCEndpointContext.Key;
  v26 = v16;
  v24[0] = 2;
  sub_22C6833A0();
  sub_22C67878C(v18, &qword_255C14A08);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v19, v6);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
}

uint64_t type metadata accessor for ShellToPreviewSceneAgent.XPCEndpointContext(uint64_t a1)
{
  return sub_22C671510(a1, (uint64_t *)&unk_255C14CF0);
}

uint64_t sub_22C671510(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22C671544(_BYTE *a1, _BYTE *a2, uint64_t a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v8 = a4(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v15 - v9;
  *a1 = 0;
  sub_22C66EC9C(a3, (uint64_t)&v15 - v9, a4);
  v11 = &v10[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C14A28) + 48)];
  v12 = sub_22C6833F4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  v13 = sub_22C683388();
  result = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v10, v13);
  *a2 = 0;
  return result;
}

uint64_t sub_22C671614(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;

  return sub_22C671544(a1, a2, *(_QWORD *)(v2 + 16), type metadata accessor for ShellToPreviewSceneAgent.XPCEndpointContext);
}

unint64_t sub_22C671634()
{
  unint64_t result;

  result = qword_255C14A80;
  if (!qword_255C14A80)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C6854BC, &type metadata for ShellToPreviewSceneAgent.XPCEndpointContext.Key);
    atomic_store(result, (unint64_t *)&qword_255C14A80);
  }
  return result;
}

unint64_t sub_22C671678()
{
  unint64_t result;

  result = qword_255C14A88;
  if (!qword_255C14A88)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C68547C, &type metadata for ShellToPreviewSceneAgent.XPCEndpointContext.Discriminant);
    atomic_store(result, (unint64_t *)&qword_255C14A88);
  }
  return result;
}

uint64_t ShellToPreviewSceneAgent.XPCEndpointContext.init(propertyListValue:)(uint64_t a1)
{
  return sub_22C6716F0(a1, (uint64_t)&type metadata for ShellToPreviewSceneAgent.XPCEndpointContext.Key, (uint64_t (*)(void))sub_22C671634, (void (*)(void))sub_22C671678);
}

uint64_t sub_22C6716F0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), void (*a4)(void))
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  _BYTE v12[24];
  uint64_t v13;
  uint64_t v14;

  v13 = a2;
  v8 = a3();
  v14 = v8;
  v12[0] = 0;
  a4();
  sub_22C6833AC();
  if (v4)
  {
    v9 = sub_22C6833F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    v13 = a2;
    v14 = v8;
    v12[0] = 1;
    sub_22C683388();
    sub_22C66F844(&qword_255C14A30, (uint64_t (*)(uint64_t))MEMORY[0x24BE777F0], MEMORY[0x24BE777E8]);
    sub_22C6833AC();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A28);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    v13 = a2;
    v14 = v8;
    v12[0] = 2;
    v11 = sub_22C6833F4();
    sub_22C6833AC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_22C67189C(uint64_t a1)
{
  return ShellToPreviewSceneAgent.XPCEndpointContext.init(propertyListValue:)(a1);
}

uint64_t sub_22C6718BC@<X0>(BOOL *a1@<X8>)
{
  return sub_22C672850(a1);
}

uint64_t sub_22C6718C8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_22C678668();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_22C6718F0(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F6E2E38;
}

uint64_t EntryPointCategory.propertyListValue.getter()
{
  return sub_22C6728F0((void (*)(void))sub_22C671920);
}

unint64_t sub_22C671920()
{
  unint64_t result;

  result = qword_255C14A90;
  if (!qword_255C14A90)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C685454, &type metadata for EntryPointCategory.Key);
    atomic_store(result, (unint64_t *)&qword_255C14A90);
  }
  return result;
}

uint64_t EntryPointCategory.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_22C6729C0(a1, (uint64_t)&type metadata for EntryPointCategory.Key, (uint64_t (*)(void))sub_22C671920, a2);
}

uint64_t sub_22C671988(uint64_t a1, uint64_t a2)
{
  return sub_22C672C90(a1, a2, (void (*)(void))sub_22C671920);
}

uint64_t sub_22C6719A4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_22C672D1C(a1, (uint64_t)&type metadata for EntryPointCategory.Key, (uint64_t (*)(void))sub_22C671920, a2);
}

uint64_t sub_22C6719D4@<X0>(BOOL *a1@<X8>)
{
  return sub_22C672850(a1);
}

uint64_t sub_22C6719E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_22C6786C0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22C671A04()
{
  sub_22C67867C();
  return sub_22C68346C();
}

uint64_t sub_22C671A4C()
{
  sub_22C67867C();
  return sub_22C683478();
}

uint64_t sub_22C671AB0(char a1)
{
  if (!a1)
    return 0x696D697263736964;
  if (a1 == 1)
    return 0xD000000000000012;
  return 0x726F77656D617266;
}

uint64_t sub_22C671B20(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_22C679CF4(*a1, *a2);
}

uint64_t sub_22C671B2C()
{
  return sub_22C67A494();
}

uint64_t sub_22C671B34()
{
  return sub_22C67A8E8();
}

uint64_t sub_22C671B3C()
{
  return sub_22C67AC20();
}

uint64_t sub_22C671B44@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22C6786D4();
  *a1 = result;
  return result;
}

uint64_t sub_22C671B78@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22C671AB0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22C671BA0()
{
  char *v0;

  return sub_22C671AB0(*v0);
}

uint64_t EntryPointType.propertyListValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _BYTE v7[24];
  ValueMetadata *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *v0;
  v2 = v0[1];
  v4 = v0[2];
  v3 = v0[3];
  v5 = sub_22C671CB8();
  sub_22C671CFC();
  sub_22C6833E8();
  v10 = v1;
  v11 = v2;
  v8 = &type metadata for EntryPointType.Key;
  v9 = v5;
  v7[0] = 1;
  swift_bridgeObjectRetain();
  sub_22C6833A0();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  v10 = v4;
  v11 = v3;
  v8 = &type metadata for EntryPointType.Key;
  v9 = v5;
  v7[0] = 2;
  sub_22C6833A0();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
}

_BYTE *sub_22C671CAC(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

unint64_t sub_22C671CB8()
{
  unint64_t result;

  result = qword_255C14A98;
  if (!qword_255C14A98)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C68542C, &type metadata for EntryPointType.Key);
    atomic_store(result, (unint64_t *)&qword_255C14A98);
  }
  return result;
}

unint64_t sub_22C671CFC()
{
  unint64_t result;

  result = qword_255C14AA0;
  if (!qword_255C14AA0)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C6853EC, &type metadata for EntryPointType.Discriminant);
    atomic_store(result, (unint64_t *)&qword_255C14AA0);
  }
  return result;
}

uint64_t EntryPointType.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[24];
  ValueMetadata *v14;
  unint64_t v15;

  v14 = &type metadata for EntryPointType.Key;
  v5 = sub_22C671CB8();
  v15 = v5;
  v13[0] = 0;
  sub_22C671CFC();
  sub_22C6833AC();
  if (v2)
  {
    v6 = sub_22C6833F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    v14 = &type metadata for EntryPointType.Key;
    v15 = v5;
    v13[0] = 1;
    sub_22C6833AC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    v14 = &type metadata for EntryPointType.Key;
    v15 = v5;
    v13[0] = 2;
    sub_22C6833AC();
    v7 = sub_22C6833F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    *a2 = v11;
    a2[1] = v12;
    a2[2] = v9;
    a2[3] = v10;
  }
  return result;
}

uint64_t sub_22C671EC0(char a1)
{
  if (!a1)
    return 0xD000000000000011;
  if (a1 == 1)
    return 0x6553657461647075;
  return 0x7961507075746573;
}

uint64_t sub_22C671F2C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return EntryPointType.init(propertyListValue:)(a1, a2);
}

uint64_t sub_22C671F40(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_22C679E24(*a1, *a2);
}

uint64_t sub_22C671F4C()
{
  return sub_22C67A54C();
}

uint64_t sub_22C671F54()
{
  return sub_22C67A978();
}

uint64_t sub_22C671F5C()
{
  return sub_22C67AB74();
}

uint64_t sub_22C671F64@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22C6786D4();
  *a1 = result;
  return result;
}

uint64_t sub_22C671F98@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22C671EC0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22C671FC0()
{
  char *v0;

  return sub_22C671EC0(*v0);
}

void sub_22C671FC8(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F6E2F68;
}

uint64_t AgentUpdate.Context.propertyListValue.getter()
{
  return sub_22C6833DC();
}

uint64_t sub_22C672004(uint64_t a1)
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
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  uint64_t (*v40)(uint64_t);
  uint64_t v41;
  _BYTE *v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE *v46;
  char *v47;
  char *v48;
  _BYTE *v49;
  _BYTE *v50;
  uint64_t v51;
  char v52;
  char v53;
  char v54;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A10);
  MEMORY[0x24BDAC7A8](v2);
  v48 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14FE8);
  v4 = MEMORY[0x24BDAC7A8](v45);
  v49 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v43 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14FF0);
  v44 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v46 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v43 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14FF8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v43 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v51 = (uint64_t)&v43 - v18;
  v19 = (char *)&v43 + *(int *)(v17 + 48) - v18;
  *((_BYTE *)&v43 - v18) = 0;
  v20 = sub_22C683388();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 16);
  v22(v19, a1, v20);
  v23 = *(int *)(v8 + 48);
  v50 = v12;
  v24 = (uint64_t)&v12[v23];
  v43 = &v12[v23];
  *v12 = 1;
  v25 = type metadata accessor for AgentUpdate.Context(0);
  sub_22C66D98C(a1 + *(int *)(v25 + 20), v24, &qword_255C149C0);
  v26 = v45;
  v27 = *(int *)(v45 + 48);
  v28 = v7;
  v47 = v7;
  v29 = (uint64_t)&v7[v27];
  *v28 = 2;
  sub_22C66D98C(a1 + *(int *)(v25 + 24), v29, &qword_255C149C8);
  v30 = &v16[*(int *)(v13 + 48)];
  *v16 = 0;
  v22(v30, (uint64_t)v19, v20);
  v31 = (uint64_t)v48;
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v48, v30, v20);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v21 + 56))(v31, 0, 1, v20);
  v54 = 0;
  v32 = (uint64_t)v43;
  v33 = *(int *)(v44 + 48);
  v34 = v46;
  v35 = (uint64_t)&v46[v33];
  *v46 = 1;
  sub_22C66D98C(v32, (uint64_t)&v34[v33], &qword_255C149C0);
  v53 = 1;
  v36 = *(int *)(v26 + 48);
  v37 = v49;
  v38 = (uint64_t)&v49[v36];
  *v49 = 2;
  sub_22C66D98C(v29, (uint64_t)&v37[v36], &qword_255C149C8);
  v52 = 2;
  sub_22C683370();
  v39 = (uint64_t (*)(uint64_t))MEMORY[0x24BE77398];
  sub_22C683394();
  v40 = (uint64_t (*)(uint64_t))MEMORY[0x24BE77A00];
  sub_22C6727B4();
  sub_22C66F844(&qword_255C14A30, (uint64_t (*)(uint64_t))MEMORY[0x24BE777F0], MEMORY[0x24BE777E8]);
  sub_22C66F844(&qword_255C14AB0, v39, MEMORY[0x24BE77390]);
  sub_22C66F844(&qword_255C14AB8, v40, MEMORY[0x24BE779E0]);
  v41 = sub_22C68343C();
  sub_22C67878C(v31, &qword_255C14A10);
  sub_22C67878C((uint64_t)v47, &qword_255C14FE8);
  sub_22C67878C((uint64_t)v50, &qword_255C14FF0);
  sub_22C67878C(v51, &qword_255C14FF8);
  sub_22C67878C(v38, &qword_255C149C8);
  sub_22C67878C(v35, &qword_255C149C0);
  return v41;
}

uint64_t sub_22C672414()
{
  uint64_t v0;

  return sub_22C672004(*(_QWORD *)(v0 + 16));
}

uint64_t AgentUpdate.Context.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  _QWORD v27[2];
  char *v28;
  char *v29;
  uint64_t v30;
  _BYTE v31[24];
  ValueMetadata *v32;
  unint64_t v33;
  uint64_t v34;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
  MEMORY[0x24BDAC7A8](v5);
  v28 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
  MEMORY[0x24BDAC7A8](v7);
  v29 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_22C683388();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for AgentUpdate.Context(0);
  v14 = a2 + *(int *)(v13 + 20);
  v15 = sub_22C683370();
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v30 = v14;
  v16(v14, 1, 1, v15);
  v17 = a2 + *(int *)(v13 + 24);
  v18 = sub_22C683394();
  v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56);
  v34 = v17;
  v19(v17, 1, 1, v18);
  v32 = &type metadata for AgentUpdate.Context.Key;
  v20 = sub_22C6727B4();
  v33 = v20;
  v31[0] = 0;
  sub_22C66F844(&qword_255C14A30, (uint64_t (*)(uint64_t))MEMORY[0x24BE777F0], MEMORY[0x24BE777E8]);
  sub_22C6833AC();
  if (v2)
  {
    v21 = sub_22C6833F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(a1, v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
    v22 = v34;
    sub_22C67878C(v30, &qword_255C149C0);
    return sub_22C67878C(v22, &qword_255C149C8);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
    v27[0] = v10;
    v27[1] = a2;
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(a2, v12, v9);
    v32 = &type metadata for AgentUpdate.Context.Key;
    v33 = v20;
    v31[0] = 1;
    sub_22C66F844(&qword_255C14AB0, (uint64_t (*)(uint64_t))MEMORY[0x24BE77398], MEMORY[0x24BE77390]);
    v23 = (uint64_t)v29;
    sub_22C6833D0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
    sub_22C66DA0C(v23, v30, &qword_255C149C0);
    v32 = &type metadata for AgentUpdate.Context.Key;
    v33 = v20;
    v31[0] = 2;
    sub_22C66F844(&qword_255C14AB8, (uint64_t (*)(uint64_t))MEMORY[0x24BE77A00], MEMORY[0x24BE779E0]);
    v24 = (uint64_t)v28;
    sub_22C6833D0();
    v26 = sub_22C6833F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 8))(a1, v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
    return sub_22C66DA0C(v24, v34, &qword_255C149C8);
  }
}

unint64_t sub_22C6727B4()
{
  unint64_t result;

  result = qword_255C14AA8;
  if (!qword_255C14AA8)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C6853C4, &type metadata for AgentUpdate.Context.Key);
    atomic_store(result, (unint64_t *)&qword_255C14AA8);
  }
  return result;
}

uint64_t sub_22C6727F8()
{
  return sub_22C6833DC();
}

uint64_t sub_22C672824@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return AgentUpdate.Context.init(propertyListValue:)(a1, a2);
}

uint64_t sub_22C672844@<X0>(BOOL *a1@<X8>)
{
  return sub_22C672850(a1);
}

uint64_t sub_22C672850@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_22C683784();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_22C67289C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_22C678718();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_22C6728C4(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F6E2FC8;
}

uint64_t SceneAgentConnectionContext.propertyListValue.getter()
{
  return sub_22C6728F0((void (*)(void))sub_22C672958);
}

uint64_t sub_22C6728F0(void (*a1)(void))
{
  a1();
  return sub_22C6833E8();
}

unint64_t sub_22C672958()
{
  unint64_t result;

  result = qword_255C14AC0;
  if (!qword_255C14AC0)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C68539C, &type metadata for SceneAgentConnectionContext.Key);
    atomic_store(result, (unint64_t *)&qword_255C14AC0);
  }
  return result;
}

uint64_t SceneAgentConnectionContext.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_22C6729C0(a1, (uint64_t)&type metadata for SceneAgentConnectionContext.Key, (uint64_t (*)(void))sub_22C672958, a2);
}

uint64_t sub_22C6729C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v11 = a2;
  v12 = a3();
  sub_22C6833AC();
  v7 = sub_22C6833F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  if (!v4)
  {
    v9 = v14;
    *a4 = v13;
    a4[1] = v9;
  }
  return result;
}

unint64_t sub_22C672A80()
{
  unint64_t result;

  result = qword_255C14AC8;
  if (!qword_255C14AC8)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for ShellToPreviewNonUIAgent, &type metadata for ShellToPreviewNonUIAgent);
    atomic_store(result, (unint64_t *)&qword_255C14AC8);
  }
  return result;
}

unint64_t sub_22C672AC8()
{
  unint64_t result;

  result = qword_255C14AD0;
  if (!qword_255C14AD0)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for ShellToPreviewSceneAgent, &type metadata for ShellToPreviewSceneAgent);
    atomic_store(result, (unint64_t *)&qword_255C14AD0);
  }
  return result;
}

unint64_t sub_22C672B10()
{
  unint64_t result;

  result = qword_255C14AD8;
  if (!qword_255C14AD8)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for EntryPointCategory, &type metadata for EntryPointCategory);
    atomic_store(result, (unint64_t *)&qword_255C14AD8);
  }
  return result;
}

uint64_t sub_22C672B54()
{
  return MEMORY[0x24BEE0D80];
}

unint64_t sub_22C672B64()
{
  unint64_t result;

  result = qword_255C14AE0;
  if (!qword_255C14AE0)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for EntryPointCategory, &type metadata for EntryPointCategory);
    atomic_store(result, (unint64_t *)&qword_255C14AE0);
  }
  return result;
}

unint64_t sub_22C672BAC()
{
  unint64_t result;

  result = qword_255C14AE8;
  if (!qword_255C14AE8)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for EntryPointCategory, &type metadata for EntryPointCategory);
    atomic_store(result, (unint64_t *)&qword_255C14AE8);
  }
  return result;
}

uint64_t sub_22C672BF0()
{
  return MEMORY[0x24BEE0D90];
}

uint64_t sub_22C672BFC()
{
  return MEMORY[0x24BEE0D88];
}

unint64_t sub_22C672C0C()
{
  unint64_t result;

  result = qword_255C14AF0;
  if (!qword_255C14AF0)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for PreviewSceneRole, &type metadata for PreviewSceneRole);
    atomic_store(result, (unint64_t *)&qword_255C14AF0);
  }
  return result;
}

uint64_t sub_22C672C50()
{
  return MEMORY[0x24BE76CB8];
}

uint64_t sub_22C672C5C()
{
  return MEMORY[0x24BE76DA8];
}

uint64_t sub_22C672C68()
{
  return MEMORY[0x24BE76520];
}

uint64_t sub_22C672C74(uint64_t a1, uint64_t a2)
{
  return sub_22C672C90(a1, a2, (void (*)(void))sub_22C672958);
}

uint64_t sub_22C672C90(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  return sub_22C6833E8();
}

uint64_t sub_22C672CF8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_22C672D1C(a1, (uint64_t)&type metadata for SceneAgentConnectionContext.Key, (uint64_t (*)(void))sub_22C672958, a2);
}

uint64_t sub_22C672D1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t (*a3)(void)@<X4>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v11 = a2;
  v12 = a3();
  sub_22C6833AC();
  v7 = sub_22C6833F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  if (!v4)
  {
    v9 = v14;
    *a4 = v13;
    a4[1] = v9;
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellToPreviewNonUIAgent()
{
  return &type metadata for ShellToPreviewNonUIAgent;
}

uint64_t *initializeBufferWithCopyOfBuffer for ShellToPreviewNonUIAgent.TwoWayMessage(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    v7 = (int *)type metadata accessor for AgentUpdate(0);
    v8 = v7[5];
    v9 = (char *)v4 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_22C6833F4();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = v7[6];
    v14 = (uint64_t *)((char *)v4 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = v7[7];
    v18 = (char *)v4 + v17;
    v19 = (char *)a2 + v17;
    v20 = sub_22C683388();
    v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
    swift_bridgeObjectRetain();
    v21(v18, v19, v20);
    v22 = type metadata accessor for AgentUpdate.Context(0);
    v23 = *(int *)(v22 + 20);
    v24 = &v18[v23];
    v25 = &v19[v23];
    v26 = sub_22C683370();
    v27 = *(_QWORD *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
    }
    v30 = *(int *)(v22 + 24);
    v31 = &v18[v30];
    v32 = &v19[v30];
    v33 = sub_22C683394();
    v34 = *(_QWORD *)(v33 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
    {
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
      memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
    }
    v36 = v7[8];
    v37 = (uint64_t *)((char *)v4 + v36);
    v38 = (uint64_t *)((char *)a2 + v36);
    v39 = v38[1];
    *v37 = *v38;
    v37[1] = v39;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for ShellToPreviewNonUIAgent.TwoWayMessage(uint64_t a1)
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

  swift_bridgeObjectRelease();
  v2 = type metadata accessor for AgentUpdate(0);
  v3 = a1 + *(int *)(v2 + 20);
  v4 = sub_22C6833F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  v5 = a1 + *(int *)(v2 + 28);
  v6 = sub_22C683388();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = type metadata accessor for AgentUpdate.Context(0);
  v8 = v5 + *(int *)(v7 + 20);
  v9 = sub_22C683370();
  v10 = *(_QWORD *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  v11 = v5 + *(int *)(v7 + 24);
  v12 = sub_22C683394();
  v13 = *(_QWORD *)(v12 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ShellToPreviewNonUIAgent.TwoWayMessage(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = (int *)type metadata accessor for AgentUpdate(0);
  v6 = v5[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_22C6833F4();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  v11 = v5[6];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = v5[7];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = sub_22C683388();
  v19 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
  swift_bridgeObjectRetain();
  v19(v16, v17, v18);
  v20 = type metadata accessor for AgentUpdate.Context(0);
  v21 = *(int *)(v20 + 20);
  v22 = &v16[v21];
  v23 = &v17[v21];
  v24 = sub_22C683370();
  v25 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  v27 = *(int *)(v20 + 24);
  v28 = &v16[v27];
  v29 = &v17[v27];
  v30 = sub_22C683394();
  v31 = *(_QWORD *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
  {
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
  }
  v33 = v5[8];
  v34 = (_QWORD *)((char *)a1 + v33);
  v35 = (_QWORD *)((char *)a2 + v33);
  v36 = v35[1];
  *v34 = *v35;
  v34[1] = v36;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ShellToPreviewNonUIAgent.TwoWayMessage(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(char *, uint64_t, uint64_t);
  int v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(char *, uint64_t, uint64_t);
  int v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  int *v39;
  _QWORD *v40;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (int *)type metadata accessor for AgentUpdate(0);
  v5 = v4[5];
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_22C6833F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 24))(v6, v7, v8);
  v9 = v4[6];
  v10 = (_QWORD *)((char *)a1 + v9);
  v11 = (_QWORD *)((char *)a2 + v9);
  *v10 = *v11;
  v10[1] = v11[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v39 = v4;
  v40 = a2;
  v12 = v4[7];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_22C683388();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  v16 = type metadata accessor for AgentUpdate.Context(0);
  v17 = *(int *)(v16 + 20);
  v18 = &v13[v17];
  v19 = &v14[v17];
  v20 = sub_22C683370();
  v21 = *(_QWORD *)(v20 - 8);
  v22 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48);
  v23 = v22(v18, 1, v20);
  v24 = v22(v19, 1, v20);
  if (v23)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v24)
  {
    (*(void (**)(char *, uint64_t))(v21 + 8))(v18, v20);
LABEL_6:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v21 + 24))(v18, v19, v20);
LABEL_7:
  v26 = *(int *)(v16 + 24);
  v27 = &v13[v26];
  v28 = &v14[v26];
  v29 = sub_22C683394();
  v30 = *(_QWORD *)(v29 - 8);
  v31 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v30 + 48);
  v32 = v31(v27, 1, v29);
  v33 = v31(v28, 1, v29);
  if (!v32)
  {
    if (!v33)
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 24))(v27, v28, v29);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v30 + 8))(v27, v29);
    goto LABEL_12;
  }
  if (v33)
  {
LABEL_12:
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
LABEL_13:
  v35 = v39[8];
  v36 = (_QWORD *)((char *)a1 + v35);
  v37 = (_QWORD *)((char *)v40 + v35);
  *v36 = *v37;
  v36[1] = v37[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for ShellToPreviewNonUIAgent.TwoWayMessage(_OWORD *a1, _OWORD *a2)
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
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  *a1 = *a2;
  v4 = (int *)type metadata accessor for AgentUpdate(0);
  v5 = v4[5];
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_22C6833F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  *(_OWORD *)((char *)a1 + v4[6]) = *(_OWORD *)((char *)a2 + v4[6]);
  v9 = v4[7];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_22C683388();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = type metadata accessor for AgentUpdate.Context(0);
  v14 = *(int *)(v13 + 20);
  v15 = &v10[v14];
  v16 = &v11[v14];
  v17 = sub_22C683370();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v15, v16, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  }
  v20 = *(int *)(v13 + 24);
  v21 = &v10[v20];
  v22 = &v11[v20];
  v23 = sub_22C683394();
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  }
  *(_OWORD *)((char *)a1 + v4[8]) = *(_OWORD *)((char *)a2 + v4[8]);
  return a1;
}

_QWORD *assignWithTake for ShellToPreviewNonUIAgent.TwoWayMessage(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
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
  int v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (*v33)(char *, uint64_t, uint64_t);
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  int *v44;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = (int *)type metadata accessor for AgentUpdate(0);
  v6 = v5[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_22C6833F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = v5[6];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  v14 = *v12;
  v13 = v12[1];
  *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  v44 = v5;
  v15 = v5[7];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = sub_22C683388();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v16, v17, v18);
  v43 = type metadata accessor for AgentUpdate.Context(0);
  v19 = *(int *)(v43 + 20);
  v20 = &v16[v19];
  v21 = &v17[v19];
  v22 = sub_22C683370();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  v25 = v24(v20, 1, v22);
  v26 = v24(v21, 1, v22);
  if (v25)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v21, v22);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v26)
  {
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
LABEL_6:
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v20, v21, v22);
LABEL_7:
  v28 = *(int *)(v43 + 24);
  v29 = &v16[v28];
  v30 = &v17[v28];
  v31 = sub_22C683394();
  v32 = *(_QWORD *)(v31 - 8);
  v33 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48);
  v34 = v33(v29, 1, v31);
  v35 = v33(v30, 1, v31);
  if (!v34)
  {
    if (!v35)
    {
      (*(void (**)(char *, char *, uint64_t))(v32 + 40))(v29, v30, v31);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v32 + 8))(v29, v31);
    goto LABEL_12;
  }
  if (v35)
  {
LABEL_12:
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v29, v30, v31);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
LABEL_13:
  v37 = v44[8];
  v38 = (_QWORD *)((char *)a1 + v37);
  v39 = (_QWORD *)((char *)a2 + v37);
  v41 = *v39;
  v40 = v39[1];
  *v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShellToPreviewNonUIAgent.TwoWayMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22C6756F0(a1, a2, a3, &qword_255C14AF8);
}

uint64_t storeEnumTagSinglePayload for ShellToPreviewNonUIAgent.TwoWayMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22C67572C(a1, a2, a3, a4, &qword_255C14AF8);
}

uint64_t sub_22C673ABC()
{
  return 0;
}

uint64_t sub_22C673AC4(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for AgentUpdate(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8);
    swift_initEnumMetadataSingleCase();
    result = 0;
    *(_DWORD *)(*(_QWORD *)(a1 - 8) + 84) = *(_DWORD *)(v4 + 84);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ShellToPreviewNonUIAgent.XPCEndpointContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22C6756F0(a1, a2, a3, &qword_255C14A28);
}

uint64_t storeEnumTagSinglePayload for ShellToPreviewNonUIAgent.XPCEndpointContext(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22C67572C(a1, a2, a3, a4, &qword_255C14A28);
}

ValueMetadata *type metadata accessor for ShellToPreviewSceneAgent()
{
  return &type metadata for ShellToPreviewSceneAgent;
}

uint64_t *initializeBufferWithCopyOfBuffer for ShellToPreviewSceneAgent.TwoWayMessage(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  void (*v47)(char *, char *, uint64_t);
  uint64_t updated;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  int *v54;
  uint64_t v55;

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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A50);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v55 = v8;
      v10 = a2[1];
      *a1 = *a2;
      a1[1] = v10;
      v11 = (int *)type metadata accessor for AgentUpdate(0);
      v12 = v11[5];
      v13 = (char *)a1 + v12;
      v14 = (char *)a2 + v12;
      v15 = sub_22C6833F4();
      v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
      swift_bridgeObjectRetain();
      v16(v13, v14, v15);
      v17 = v11[6];
      v18 = (uint64_t *)((char *)a1 + v17);
      v19 = (uint64_t *)((char *)a2 + v17);
      v20 = v19[1];
      *v18 = *v19;
      v18[1] = v20;
      v54 = v11;
      v21 = v11[7];
      v22 = (char *)a1 + v21;
      v23 = (char *)a2 + v21;
      v24 = sub_22C683388();
      v25 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16);
      swift_bridgeObjectRetain();
      v25(v22, v23, v24);
      v26 = type metadata accessor for AgentUpdate.Context(0);
      v27 = *(int *)(v26 + 20);
      v28 = &v22[v27];
      v29 = &v23[v27];
      v30 = sub_22C683370();
      v31 = *(_QWORD *)(v30 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30))
      {
        v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
        memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
      }
      v33 = *(int *)(v26 + 24);
      v34 = &v22[v33];
      v35 = &v23[v33];
      v36 = sub_22C683394();
      v37 = *(_QWORD *)(v36 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48))(v35, 1, v36))
      {
        v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
        memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v34, v35, v36);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v34, 0, 1, v36);
      }
      v39 = v54[8];
      v40 = (uint64_t *)((char *)a1 + v39);
      v41 = (uint64_t *)((char *)a2 + v39);
      v42 = v41[1];
      *v40 = *v41;
      v40[1] = v42;
      v43 = *(int *)(v7 + 48);
      v44 = (char *)a1 + v43;
      v45 = (char *)a2 + v43;
      v46 = sub_22C6832EC();
      v47 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v46 - 8) + 16);
      swift_bridgeObjectRetain();
      v47(v44, v45, v46);
      updated = type metadata accessor for SceneUpdateContext(0);
      v49 = *(int *)(updated + 20);
      v50 = &v44[v49];
      v51 = &v45[v49];
      v52 = sub_22C6832F8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v52 - 8) + 16))(v50, v51, v52);
      v44[*(int *)(updated + 24)] = v45[*(int *)(updated + 24)];
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v55 + 56))(a1, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for ShellToPreviewSceneAgent.TwoWayMessage(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
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

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A50);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
  if (!(_DWORD)result)
  {
    swift_bridgeObjectRelease();
    v4 = type metadata accessor for AgentUpdate(0);
    v5 = a1 + *(int *)(v4 + 20);
    v6 = sub_22C6833F4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
    swift_bridgeObjectRelease();
    v7 = a1 + *(int *)(v4 + 28);
    v8 = sub_22C683388();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
    v9 = type metadata accessor for AgentUpdate.Context(0);
    v10 = v7 + *(int *)(v9 + 20);
    v11 = sub_22C683370();
    v12 = *(_QWORD *)(v11 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    v13 = v7 + *(int *)(v9 + 24);
    v14 = sub_22C683394();
    v15 = *(_QWORD *)(v14 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
    swift_bridgeObjectRelease();
    v16 = a1 + *(int *)(v2 + 48);
    v17 = sub_22C6832EC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
    v18 = v16 + *(int *)(type metadata accessor for SceneUpdateContext(0) + 20);
    v19 = sub_22C6832F8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);
  }
  return result;
}

_QWORD *initializeWithCopy for ShellToPreviewSceneAgent.TwoWayMessage(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  void (*v45)(char *, char *, uint64_t);
  uint64_t updated;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  int *v52;
  uint64_t v53;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A50);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v53 = v7;
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    v9 = (int *)type metadata accessor for AgentUpdate(0);
    v10 = v9[5];
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_22C6833F4();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    v14(v11, v12, v13);
    v15 = v9[6];
    v16 = (_QWORD *)((char *)a1 + v15);
    v17 = (_QWORD *)((char *)a2 + v15);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v52 = v9;
    v19 = v9[7];
    v20 = (char *)a1 + v19;
    v21 = (char *)a2 + v19;
    v22 = sub_22C683388();
    v23 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 16);
    swift_bridgeObjectRetain();
    v23(v20, v21, v22);
    v24 = type metadata accessor for AgentUpdate.Context(0);
    v25 = *(int *)(v24 + 20);
    v26 = &v20[v25];
    v27 = &v21[v25];
    v28 = sub_22C683370();
    v29 = *(_QWORD *)(v28 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28))
    {
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
      memcpy(v26, v27, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v26, v27, v28);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v29 + 56))(v26, 0, 1, v28);
    }
    v31 = *(int *)(v24 + 24);
    v32 = &v20[v31];
    v33 = &v21[v31];
    v34 = sub_22C683394();
    v35 = *(_QWORD *)(v34 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v33, 1, v34))
    {
      v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
      memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
    }
    v37 = v52[8];
    v38 = (_QWORD *)((char *)a1 + v37);
    v39 = (_QWORD *)((char *)a2 + v37);
    v40 = v39[1];
    *v38 = *v39;
    v38[1] = v40;
    v41 = *(int *)(v6 + 48);
    v42 = (char *)a1 + v41;
    v43 = (char *)a2 + v41;
    v44 = sub_22C6832EC();
    v45 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 16);
    swift_bridgeObjectRetain();
    v45(v42, v43, v44);
    updated = type metadata accessor for SceneUpdateContext(0);
    v47 = *(int *)(updated + 20);
    v48 = &v42[v47];
    v49 = &v43[v47];
    v50 = sub_22C6832F8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 16))(v48, v49, v50);
    v42[*(int *)(updated + 24)] = v43[*(int *)(updated + 24)];
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v53 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

_QWORD *assignWithCopy for ShellToPreviewSceneAgent.TwoWayMessage(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD *, uint64_t, uint64_t);
  int v9;
  int v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int *v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(char *, uint64_t, uint64_t);
  int v50;
  int v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  _QWORD *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  void (*v65)(char *, char *, uint64_t);
  uint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t (*v77)(char *, uint64_t, uint64_t);
  int v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  _QWORD *v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t updated;
  uint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v95;
  int *v96;
  int *v97;
  uint64_t v98;
  uint64_t v99;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A50);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_22C67878C((uint64_t)a1, &qword_255C14A50);
      goto LABEL_7;
    }
    v99 = v6;
    *a1 = *a2;
    a1[1] = a2[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v32 = (int *)type metadata accessor for AgentUpdate(0);
    v33 = v32[5];
    v34 = (char *)a1 + v33;
    v35 = (char *)a2 + v33;
    v36 = sub_22C6833F4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v36 - 8) + 24))(v34, v35, v36);
    v37 = v32[6];
    v38 = (_QWORD *)((char *)a1 + v37);
    v39 = (_QWORD *)((char *)a2 + v37);
    *v38 = *v39;
    v38[1] = v39[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v97 = v32;
    v40 = v32[7];
    v41 = (char *)a1 + v40;
    v42 = (char *)a2 + v40;
    v43 = sub_22C683388();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 24))(v41, v42, v43);
    v95 = type metadata accessor for AgentUpdate.Context(0);
    v44 = *(int *)(v95 + 20);
    v45 = &v41[v44];
    v46 = &v42[v44];
    v47 = sub_22C683370();
    v48 = *(_QWORD *)(v47 - 8);
    v49 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v48 + 48);
    v50 = v49(v45, 1, v47);
    v51 = v49(v46, 1, v47);
    if (v50)
    {
      if (!v51)
      {
        (*(void (**)(char *, char *, uint64_t))(v48 + 16))(v45, v46, v47);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v48 + 56))(v45, 0, 1, v47);
        goto LABEL_19;
      }
    }
    else
    {
      if (!v51)
      {
        (*(void (**)(char *, char *, uint64_t))(v48 + 24))(v45, v46, v47);
LABEL_19:
        v72 = *(int *)(v95 + 24);
        v73 = &v41[v72];
        v74 = &v42[v72];
        v75 = sub_22C683394();
        v76 = *(_QWORD *)(v75 - 8);
        v77 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v76 + 48);
        v78 = v77(v73, 1, v75);
        v79 = v77(v74, 1, v75);
        if (v78)
        {
          v80 = v99;
          if (!v79)
          {
            (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v73, v74, v75);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v76 + 56))(v73, 0, 1, v75);
LABEL_25:
            v82 = v97[8];
            v83 = (_QWORD *)((char *)a1 + v82);
            v84 = (_QWORD *)((char *)a2 + v82);
            *v83 = *v84;
            v83[1] = v84[1];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            v85 = *(int *)(v80 + 48);
            v86 = (char *)a1 + v85;
            v87 = (char *)a2 + v85;
            v88 = sub_22C6832EC();
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v88 - 8) + 24))(v86, v87, v88);
            updated = type metadata accessor for SceneUpdateContext(0);
            v90 = *(int *)(updated + 20);
            v91 = &v86[v90];
            v92 = &v87[v90];
            v93 = sub_22C6832F8();
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v93 - 8) + 24))(v91, v92, v93);
            v86[*(int *)(updated + 24)] = v87[*(int *)(updated + 24)];
            return a1;
          }
        }
        else
        {
          v80 = v99;
          if (!v79)
          {
            (*(void (**)(char *, char *, uint64_t))(v76 + 24))(v73, v74, v75);
            goto LABEL_25;
          }
          (*(void (**)(char *, uint64_t))(v76 + 8))(v73, v75);
        }
        v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
        memcpy(v73, v74, *(_QWORD *)(*(_QWORD *)(v81 - 8) + 64));
        goto LABEL_25;
      }
      (*(void (**)(char *, uint64_t))(v48 + 8))(v45, v47);
    }
    v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v71 - 8) + 64));
    goto LABEL_19;
  }
  if (v10)
  {
LABEL_7:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v98 = v6;
  *a1 = *a2;
  a1[1] = a2[1];
  v11 = (int *)type metadata accessor for AgentUpdate(0);
  v12 = v11[5];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_22C6833F4();
  v16 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
  swift_bridgeObjectRetain();
  v16(v13, v14, v15);
  v17 = v11[6];
  v18 = (_QWORD *)((char *)a1 + v17);
  v19 = (_QWORD *)((char *)a2 + v17);
  *v18 = *v19;
  v18[1] = v19[1];
  v96 = v11;
  v20 = v11[7];
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  v23 = sub_22C683388();
  v24 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16);
  swift_bridgeObjectRetain();
  v24(v21, v22, v23);
  v25 = type metadata accessor for AgentUpdate.Context(0);
  v26 = *(int *)(v25 + 20);
  v27 = &v21[v26];
  v28 = &v22[v26];
  v29 = sub_22C683370();
  v30 = *(_QWORD *)(v29 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
  {
    v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
  }
  v52 = *(int *)(v25 + 24);
  v53 = &v21[v52];
  v54 = &v22[v52];
  v55 = sub_22C683394();
  v56 = *(_QWORD *)(v55 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v56 + 48))(v54, 1, v55))
  {
    v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
    memcpy(v53, v54, *(_QWORD *)(*(_QWORD *)(v57 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v56 + 16))(v53, v54, v55);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v56 + 56))(v53, 0, 1, v55);
  }
  v58 = v96[8];
  v59 = (_QWORD *)((char *)a1 + v58);
  v60 = (_QWORD *)((char *)a2 + v58);
  *v59 = *v60;
  v59[1] = v60[1];
  v61 = *(int *)(v98 + 48);
  v62 = (char *)a1 + v61;
  v63 = (char *)a2 + v61;
  v64 = sub_22C6832EC();
  v65 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v64 - 8) + 16);
  swift_bridgeObjectRetain();
  v65(v62, v63, v64);
  v66 = type metadata accessor for SceneUpdateContext(0);
  v67 = *(int *)(v66 + 20);
  v68 = &v62[v67];
  v69 = &v63[v67];
  v70 = sub_22C6832F8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v70 - 8) + 16))(v68, v69, v70);
  v62[*(int *)(v66 + 24)] = v63[*(int *)(v66 + 24)];
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v98);
  return a1;
}

_OWORD *initializeWithTake for ShellToPreviewSceneAgent.TwoWayMessage(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t updated;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  int *v40;
  uint64_t v41;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A50);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(_OWORD *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v41 = v7;
    *a1 = *a2;
    v8 = (int *)type metadata accessor for AgentUpdate(0);
    v9 = v8[5];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_22C6833F4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
    *(_OWORD *)((char *)a1 + v8[6]) = *(_OWORD *)((char *)a2 + v8[6]);
    v40 = v8;
    v13 = v8[7];
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = sub_22C683388();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
    v17 = type metadata accessor for AgentUpdate.Context(0);
    v18 = *(int *)(v17 + 20);
    v19 = &v14[v18];
    v20 = &v15[v18];
    v21 = sub_22C683370();
    v22 = *(_QWORD *)(v21 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
    {
      v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
      memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v19, v20, v21);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    v24 = *(int *)(v17 + 24);
    v25 = &v14[v24];
    v26 = &v15[v24];
    v27 = sub_22C683394();
    v28 = *(_QWORD *)(v27 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
    {
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v28 + 32))(v25, v26, v27);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
    }
    *(_OWORD *)((char *)a1 + v40[8]) = *(_OWORD *)((char *)a2 + v40[8]);
    v30 = *(int *)(v6 + 48);
    v31 = (char *)a1 + v30;
    v32 = (char *)a2 + v30;
    v33 = sub_22C6832EC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 32))(v31, v32, v33);
    updated = type metadata accessor for SceneUpdateContext(0);
    v35 = *(int *)(updated + 20);
    v36 = &v31[v35];
    v37 = &v32[v35];
    v38 = sub_22C6832F8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v38 - 8) + 32))(v36, v37, v38);
    v31[*(int *)(updated + 24)] = v32[*(int *)(updated + 24)];
    (*(void (**)(_OWORD *, _QWORD, uint64_t, uint64_t))(v41 + 56))(a1, 0, 1, v6);
  }
  return a1;
}

_QWORD *assignWithTake for ShellToPreviewSceneAgent.TwoWayMessage(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD *, uint64_t, uint64_t);
  int v9;
  int v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
  int *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(char *, uint64_t, uint64_t);
  int v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t (*v69)(char *, uint64_t, uint64_t);
  int v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t updated;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  uint64_t v88;
  int *v89;
  char *v90;
  char *__dst;
  int *__dsta;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A50);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_22C67878C((uint64_t)a1, &qword_255C14A50);
      goto LABEL_7;
    }
    v26 = a2[1];
    *a1 = *a2;
    a1[1] = v26;
    swift_bridgeObjectRelease();
    v27 = (int *)type metadata accessor for AgentUpdate(0);
    v28 = v27[5];
    v29 = (char *)a1 + v28;
    v30 = (char *)a2 + v28;
    v31 = sub_22C6833F4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v31 - 8) + 40))(v29, v30, v31);
    v32 = v27[6];
    v33 = (_QWORD *)((char *)a1 + v32);
    v34 = (_QWORD *)((char *)a2 + v32);
    v36 = *v34;
    v35 = v34[1];
    *v33 = v36;
    v33[1] = v35;
    swift_bridgeObjectRelease();
    __dsta = v27;
    v37 = v27[7];
    v38 = (char *)a1 + v37;
    v39 = (char *)a2 + v37;
    v40 = sub_22C683388();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v40 - 8) + 40))(v38, v39, v40);
    v88 = type metadata accessor for AgentUpdate.Context(0);
    v90 = v39;
    v41 = *(int *)(v88 + 20);
    v42 = &v38[v41];
    v43 = &v39[v41];
    v44 = sub_22C683370();
    v45 = *(_QWORD *)(v44 - 8);
    v46 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v45 + 48);
    LODWORD(v39) = v46(v42, 1, v44);
    v47 = v46(v43, 1, v44);
    if ((_DWORD)v39)
    {
      if (!v47)
      {
        (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v42, v43, v44);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v45 + 56))(v42, 0, 1, v44);
        goto LABEL_19;
      }
    }
    else
    {
      if (!v47)
      {
        (*(void (**)(char *, char *, uint64_t))(v45 + 40))(v42, v43, v44);
LABEL_19:
        v64 = *(int *)(v88 + 24);
        v65 = &v38[v64];
        v66 = &v90[v64];
        v67 = sub_22C683394();
        v68 = *(_QWORD *)(v67 - 8);
        v69 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v68 + 48);
        v70 = v69(v65, 1, v67);
        v71 = v69(v66, 1, v67);
        if (v70)
        {
          if (!v71)
          {
            (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v65, v66, v67);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v68 + 56))(v65, 0, 1, v67);
LABEL_25:
            v73 = __dsta[8];
            v74 = (_QWORD *)((char *)a1 + v73);
            v75 = (_QWORD *)((char *)a2 + v73);
            v77 = *v75;
            v76 = v75[1];
            *v74 = v77;
            v74[1] = v76;
            swift_bridgeObjectRelease();
            v78 = *(int *)(v6 + 48);
            v79 = (char *)a1 + v78;
            v80 = (char *)a2 + v78;
            v81 = sub_22C6832EC();
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v81 - 8) + 40))(v79, v80, v81);
            updated = type metadata accessor for SceneUpdateContext(0);
            v83 = *(int *)(updated + 20);
            v84 = &v79[v83];
            v85 = &v80[v83];
            v86 = sub_22C6832F8();
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v86 - 8) + 40))(v84, v85, v86);
            v79[*(int *)(updated + 24)] = v80[*(int *)(updated + 24)];
            return a1;
          }
        }
        else
        {
          if (!v71)
          {
            (*(void (**)(char *, char *, uint64_t))(v68 + 40))(v65, v66, v67);
            goto LABEL_25;
          }
          (*(void (**)(char *, uint64_t))(v68 + 8))(v65, v67);
        }
        v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
        memcpy(v65, v66, *(_QWORD *)(*(_QWORD *)(v72 - 8) + 64));
        goto LABEL_25;
      }
      (*(void (**)(char *, uint64_t))(v45 + 8))(v42, v44);
    }
    v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(v42, v43, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
    goto LABEL_19;
  }
  if (v10)
  {
LABEL_7:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v11 = (int *)type metadata accessor for AgentUpdate(0);
  v12 = v11[5];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_22C6833F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  *(_OWORD *)((char *)a1 + v11[6]) = *(_OWORD *)((char *)a2 + v11[6]);
  v89 = v11;
  v16 = v11[7];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = sub_22C683388();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  v20 = type metadata accessor for AgentUpdate.Context(0);
  v21 = *(int *)(v20 + 20);
  __dst = &v17[v21];
  v22 = &v18[v21];
  v23 = sub_22C683370();
  v24 = *(_QWORD *)(v23 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(__dst, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(__dst, v22, v23);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(__dst, 0, 1, v23);
  }
  v48 = *(int *)(v20 + 24);
  v49 = &v17[v48];
  v50 = &v18[v48];
  v51 = sub_22C683394();
  v52 = *(_QWORD *)(v51 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v52 + 48))(v50, 1, v51))
  {
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
    memcpy(v49, v50, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v49, v50, v51);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v52 + 56))(v49, 0, 1, v51);
  }
  *(_OWORD *)((char *)a1 + v89[8]) = *(_OWORD *)((char *)a2 + v89[8]);
  v54 = *(int *)(v6 + 48);
  v55 = (char *)a1 + v54;
  v56 = (char *)a2 + v54;
  v57 = sub_22C6832EC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v57 - 8) + 32))(v55, v56, v57);
  v58 = type metadata accessor for SceneUpdateContext(0);
  v59 = *(int *)(v58 + 20);
  v60 = &v55[v59];
  v61 = &v56[v59];
  v62 = sub_22C6832F8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v62 - 8) + 32))(v60, v61, v62);
  v55[*(int *)(v58 + 24)] = v56[*(int *)(v58 + 24)];
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ShellToPreviewSceneAgent.TwoWayMessage()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22C675208(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A50);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 2)
    return v5 - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ShellToPreviewSceneAgent.TwoWayMessage()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22C675264(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 1);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A50);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_22C6752B8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A50);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2);
}

uint64_t sub_22C6752F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A50);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 1, v4);
}

uint64_t sub_22C675338()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t updated;
  unint64_t v3;

  v0 = type metadata accessor for AgentUpdate(319);
  if (v1 <= 0x3F)
  {
    updated = type metadata accessor for SceneUpdateContext(319);
    if (v3 > 0x3F)
    {
      return updated;
    }
    else
    {
      swift_getTupleTypeLayout2();
      swift_initEnumMetadataSinglePayload();
      return 0;
    }
  }
  return v0;
}

uint64_t *_s19PreviewsOSSupportUI24ShellToPreviewNonUIAgentO18XPCEndpointContextOwCP_0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
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
    v6 = sub_22C683388();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C14A28) + 48);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_22C6833F4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  return a1;
}

uint64_t _s19PreviewsOSSupportUI24ShellToPreviewNonUIAgentO18XPCEndpointContextOwxx_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = sub_22C683388();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  v3 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C14A28) + 48);
  v4 = sub_22C6833F4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

uint64_t _s19PreviewsOSSupportUI24ShellToPreviewNonUIAgentO18XPCEndpointContextOwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_22C683388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C14A28) + 48);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_22C6833F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  return a1;
}

uint64_t _s19PreviewsOSSupportUI24ShellToPreviewNonUIAgentO18XPCEndpointContextOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_22C683388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C14A28) + 48);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_22C6833F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 24))(v6, v7, v8);
  return a1;
}

uint64_t _s19PreviewsOSSupportUI24ShellToPreviewNonUIAgentO18XPCEndpointContextOwtk_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_22C683388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C14A28) + 48);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_22C6833F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t _s19PreviewsOSSupportUI24ShellToPreviewNonUIAgentO18XPCEndpointContextOwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_22C683388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  v5 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C14A28) + 48);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_22C6833F4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 40))(v6, v7, v8);
  return a1;
}

uint64_t sub_22C6756F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(a1, a2, v6);
}

uint64_t sub_22C67572C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8;

  v8 = __swift_instantiateConcreteTypeFromMangledName(a5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(a1, a2, a3, v8);
}

uint64_t sub_22C675778(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v7;

  v2 = sub_22C683388();
  if (v3 <= 0x3F)
  {
    v4 = sub_22C6833F4();
    if (v5 > 0x3F)
    {
      return v4;
    }
    else
    {
      swift_getTupleTypeLayout2();
      swift_initEnumMetadataSingleCase();
      v2 = 0;
      *(_DWORD *)(*(_QWORD *)(a1 - 8) + 84) = v7;
    }
  }
  return v2;
}

_QWORD *initializeBufferWithCopyOfBuffer for EntryPointCategory(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for EntryPointCategory()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithTake for EntryPointCategory(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for EntryPointCategory()
{
  return &type metadata for EntryPointCategory;
}

uint64_t destroy for EntryPointType()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for EntryPointType(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for EntryPointType(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
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

_QWORD *assignWithTake for EntryPointType(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EntryPointType(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EntryPointType(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EntryPointType()
{
  return &type metadata for EntryPointType;
}

uint64_t *initializeBufferWithCopyOfBuffer for AgentUpdate(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
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
    v11 = sub_22C6833F4();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = a3[7];
    v15 = (uint64_t *)((char *)v4 + v13);
    v16 = (uint64_t *)((char *)a2 + v13);
    v17 = v16[1];
    *v15 = *v16;
    v15[1] = v17;
    v18 = (char *)v4 + v14;
    v19 = (char *)a2 + v14;
    v20 = sub_22C683388();
    v21 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16);
    swift_bridgeObjectRetain();
    v21(v18, v19, v20);
    v22 = type metadata accessor for AgentUpdate.Context(0);
    v23 = *(int *)(v22 + 20);
    v24 = &v18[v23];
    v25 = &v19[v23];
    v26 = sub_22C683370();
    v27 = *(_QWORD *)(v26 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
    {
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
      memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v27 + 16))(v24, v25, v26);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
    }
    v30 = *(int *)(v22 + 24);
    v31 = &v18[v30];
    v32 = &v19[v30];
    v33 = sub_22C683394();
    v34 = *(_QWORD *)(v33 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v32, 1, v33))
    {
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
      memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
    }
    v36 = a3[8];
    v37 = (uint64_t *)((char *)v4 + v36);
    v38 = (uint64_t *)((char *)a2 + v36);
    v39 = v38[1];
    *v37 = *v38;
    v37[1] = v39;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for AgentUpdate(uint64_t a1, uint64_t a2)
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

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_22C6833F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  v6 = a1 + *(int *)(a2 + 28);
  v7 = sub_22C683388();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v8 = type metadata accessor for AgentUpdate.Context(0);
  v9 = v6 + *(int *)(v8 + 20);
  v10 = sub_22C683370();
  v11 = *(_QWORD *)(v10 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  v12 = v6 + *(int *)(v8 + 24);
  v13 = sub_22C683394();
  v14 = *(_QWORD *)(v13 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AgentUpdate(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_22C6833F4();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = a3[7];
  v14 = (_QWORD *)((char *)a1 + v12);
  v15 = (_QWORD *)((char *)a2 + v12);
  v16 = v15[1];
  *v14 = *v15;
  v14[1] = v16;
  v17 = (char *)a1 + v13;
  v18 = (char *)a2 + v13;
  v19 = sub_22C683388();
  v20 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16);
  swift_bridgeObjectRetain();
  v20(v17, v18, v19);
  v21 = type metadata accessor for AgentUpdate.Context(0);
  v22 = *(int *)(v21 + 20);
  v23 = &v17[v22];
  v24 = &v18[v22];
  v25 = sub_22C683370();
  v26 = *(_QWORD *)(v25 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25))
  {
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v23, v24, v25);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
  }
  v28 = *(int *)(v21 + 24);
  v29 = &v17[v28];
  v30 = &v18[v28];
  v31 = sub_22C683394();
  v32 = *(_QWORD *)(v31 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31))
  {
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v29, v30, v31);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
  }
  v34 = a3[8];
  v35 = (_QWORD *)((char *)a1 + v34);
  v36 = (_QWORD *)((char *)a2 + v34);
  v37 = v36[1];
  *v35 = *v36;
  v35[1] = v37;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AgentUpdate(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(char *, uint64_t, uint64_t);
  int v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  int *v40;
  _QWORD *v41;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_22C6833F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[6];
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v40 = a3;
  v41 = a2;
  v13 = a3[7];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = sub_22C683388();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  v17 = type metadata accessor for AgentUpdate.Context(0);
  v18 = *(int *)(v17 + 20);
  v19 = &v14[v18];
  v20 = &v15[v18];
  v21 = sub_22C683370();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  v24 = v23(v19, 1, v21);
  v25 = v23(v20, 1, v21);
  if (v24)
  {
    if (!v25)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v21);
LABEL_6:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 24))(v19, v20, v21);
LABEL_7:
  v27 = *(int *)(v17 + 24);
  v28 = &v14[v27];
  v29 = &v15[v27];
  v30 = sub_22C683394();
  v31 = *(_QWORD *)(v30 - 8);
  v32 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v31 + 48);
  v33 = v32(v28, 1, v30);
  v34 = v32(v29, 1, v30);
  if (!v33)
  {
    if (!v34)
    {
      (*(void (**)(char *, char *, uint64_t))(v31 + 24))(v28, v29, v30);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v31 + 8))(v28, v30);
    goto LABEL_12;
  }
  if (v34)
  {
LABEL_12:
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
    memcpy(v28, v29, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v28, v29, v30);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v31 + 56))(v28, 0, 1, v30);
LABEL_13:
  v36 = v40[8];
  v37 = (_QWORD *)((char *)a1 + v36);
  v38 = (_QWORD *)((char *)v41 + v36);
  *v37 = *v38;
  v37[1] = v38[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for AgentUpdate(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_22C6833F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_22C683388();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
  v14 = type metadata accessor for AgentUpdate.Context(0);
  v15 = *(int *)(v14 + 20);
  v16 = &v11[v15];
  v17 = &v12[v15];
  v18 = sub_22C683370();
  v19 = *(_QWORD *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v16, v17, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  }
  v21 = *(int *)(v14 + 24);
  v22 = &v11[v21];
  v23 = &v12[v21];
  v24 = sub_22C683394();
  v25 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24))
  {
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v22, v23, v24);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
  }
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  return a1;
}

_QWORD *assignWithTake for AgentUpdate(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
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
  int v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t, uint64_t);
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  int *v45;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_22C6833F4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  v45 = a3;
  v16 = a3[7];
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = sub_22C683388();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  v44 = type metadata accessor for AgentUpdate.Context(0);
  v20 = *(int *)(v44 + 20);
  v21 = &v17[v20];
  v22 = &v18[v20];
  v23 = sub_22C683370();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  v26 = v25(v21, 1, v23);
  v27 = v25(v22, 1, v23);
  if (v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v21, v22, v23);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v27)
  {
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v23);
LABEL_6:
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 40))(v21, v22, v23);
LABEL_7:
  v29 = *(int *)(v44 + 24);
  v30 = &v17[v29];
  v31 = &v18[v29];
  v32 = sub_22C683394();
  v33 = *(_QWORD *)(v32 - 8);
  v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48);
  v35 = v34(v30, 1, v32);
  v36 = v34(v31, 1, v32);
  if (!v35)
  {
    if (!v36)
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 40))(v30, v31, v32);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v33 + 8))(v30, v32);
    goto LABEL_12;
  }
  if (v36)
  {
LABEL_12:
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
    memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v30, v31, v32);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
LABEL_13:
  v38 = v45[8];
  v39 = (_QWORD *)((char *)a1 + v38);
  v40 = (_QWORD *)((char *)a2 + v38);
  v42 = *v40;
  v41 = v40[1];
  *v39 = v42;
  v39[1] = v41;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AgentUpdate()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22C6766D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_22C6833F4();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = type metadata accessor for AgentUpdate.Context(0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 28);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for AgentUpdate()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22C676784(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_22C6833F4();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = type metadata accessor for AgentUpdate.Context(0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 28);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

uint64_t sub_22C676820()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_22C6833F4();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for AgentUpdate.Context(319);
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AgentUpdate.Context(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_22C683388();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_22C683370();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v15 = *(int *)(a3 + 24);
    v16 = (char *)a1 + v15;
    v17 = (char *)a2 + v15;
    v18 = sub_22C683394();
    v19 = *(_QWORD *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
  }
  return a1;
}

uint64_t destroy for AgentUpdate.Context(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v4 = sub_22C683388();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_22C683370();
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v8 = a1 + *(int *)(a2 + 24);
  v9 = sub_22C683394();
  v10 = *(_QWORD *)(v9 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  return result;
}

uint64_t initializeWithCopy for AgentUpdate.Context(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_22C683388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_22C683370();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = *(int *)(a3 + 24);
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = sub_22C683394();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t assignWithCopy for AgentUpdate.Context(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;

  v6 = sub_22C683388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_22C683370();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
LABEL_7:
  v16 = *(int *)(a3 + 24);
  v17 = (void *)(a1 + v16);
  v18 = (void *)(a2 + v16);
  v19 = sub_22C683394();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 24))(v17, v18, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t initializeWithTake for AgentUpdate.Context(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_22C683388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_22C683370();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = *(int *)(a3 + 24);
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = sub_22C683394();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  return a1;
}

uint64_t assignWithTake for AgentUpdate.Context(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void *, uint64_t, uint64_t);
  int v22;
  int v23;
  uint64_t v24;

  v6 = sub_22C683388();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_22C683370();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  v16 = *(int *)(a3 + 24);
  v17 = (void *)(a1 + v16);
  v18 = (void *)(a2 + v16);
  v19 = sub_22C683394();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  v22 = v21(v17, 1, v19);
  v23 = v21(v18, 1, v19);
  if (!v22)
  {
    if (!v23)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 40))(v17, v18, v19);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
    goto LABEL_12;
  }
  if (v23)
  {
LABEL_12:
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 32))(v17, v18, v19);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  return a1;
}

uint64_t getEnumTagSinglePayload for AgentUpdate.Context()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22C6771F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_22C683388();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for AgentUpdate.Context()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22C6772A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_22C683388();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C0);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C149C8);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_22C677348()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_22C683388();
  if (v0 <= 0x3F)
  {
    sub_22C677408(319, &qword_255C14E08, (void (*)(uint64_t))MEMORY[0x24BE77398]);
    if (v1 <= 0x3F)
    {
      sub_22C677408(319, qword_255C14E10, (void (*)(uint64_t))MEMORY[0x24BE77A00]);
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

void sub_22C677408(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_22C6836D0();
    if (!v5)
      atomic_store(v4, a2);
  }
}

_QWORD *_s19PreviewsOSSupportUI18EntryPointCategoryVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s19PreviewsOSSupportUI18EntryPointCategoryVwet_0(uint64_t a1, int a2)
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

uint64_t sub_22C6774DC(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SceneAgentConnectionContext()
{
  return &type metadata for SceneAgentConnectionContext;
}

ValueMetadata *type metadata accessor for PreviewSceneRole()
{
  return &type metadata for PreviewSceneRole;
}

_QWORD *initializeBufferWithCopyOfBuffer for SceneUpdateContext(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_22C6832EC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_22C6832F8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t destroy for SceneUpdateContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_22C6832EC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_22C6832F8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t initializeWithCopy for SceneUpdateContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_22C6832EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_22C6832F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithCopy for SceneUpdateContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_22C6832EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_22C6832F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t initializeWithTake for SceneUpdateContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_22C6832EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_22C6832F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for SceneUpdateContext(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_22C6832EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_22C6832F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_BYTE *)(a1 + *(int *)(a3 + 24)) = *(_BYTE *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneUpdateContext()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22C6778A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v14;

  v6 = sub_22C6832EC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_22C6832F8();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 2)
    return v14 - 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SceneUpdateContext()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22C677954(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_22C6832EC();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_22C6832F8();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_BYTE *)(a1 + *(int *)(a4 + 24)) = a2 + 1;
  return result;
}

uint64_t sub_22C6779F8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_22C6832EC();
  if (v1 <= 0x3F)
  {
    result = sub_22C6832F8();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneAgentConnectionContext.Key()
{
  return &type metadata for SceneAgentConnectionContext.Key;
}

ValueMetadata *type metadata accessor for AgentUpdate.Context.Key()
{
  return &type metadata for AgentUpdate.Context.Key;
}

ValueMetadata *type metadata accessor for EntryPointType.Discriminant()
{
  return &type metadata for EntryPointType.Discriminant;
}

ValueMetadata *type metadata accessor for EntryPointType.Key()
{
  return &type metadata for EntryPointType.Key;
}

ValueMetadata *type metadata accessor for EntryPointCategory.Key()
{
  return &type metadata for EntryPointCategory.Key;
}

ValueMetadata *type metadata accessor for ShellToPreviewSceneAgent.XPCEndpointContext.Discriminant()
{
  return &type metadata for ShellToPreviewSceneAgent.XPCEndpointContext.Discriminant;
}

ValueMetadata *type metadata accessor for ShellToPreviewSceneAgent.XPCEndpointContext.Key()
{
  return &type metadata for ShellToPreviewSceneAgent.XPCEndpointContext.Key;
}

ValueMetadata *type metadata accessor for SceneUpdateContext.Key()
{
  return &type metadata for SceneUpdateContext.Key;
}

ValueMetadata *type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage.Discriminant()
{
  return &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Discriminant;
}

ValueMetadata *type metadata accessor for ShellToPreviewSceneAgent.TwoWayMessage.Key()
{
  return &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Key;
}

ValueMetadata *type metadata accessor for ShellToPreviewNonUIAgent.XPCEndpointContext.Discriminant()
{
  return &type metadata for ShellToPreviewNonUIAgent.XPCEndpointContext.Discriminant;
}

uint64_t getEnumTagSinglePayload for AgentToShellMessage.Key(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s19PreviewsOSSupportUI11AgentUpdateV7ContextV3KeyOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22C677C24 + 4 * byte_22C68411A[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22C677C58 + 4 * byte_22C684115[v4]))();
}

uint64_t sub_22C677C58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C677C60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22C677C68);
  return result;
}

uint64_t sub_22C677C74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22C677C7CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22C677C80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C677C88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ShellToPreviewNonUIAgent.XPCEndpointContext.Key()
{
  return &type metadata for ShellToPreviewNonUIAgent.XPCEndpointContext.Key;
}

uint64_t getEnumTagSinglePayload for AgentUpdate.Key(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AgentUpdate.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22C677D80 + 4 * byte_22C684124[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_22C677DB4 + 4 * byte_22C68411F[v4]))();
}

uint64_t sub_22C677DB4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C677DBC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22C677DC4);
  return result;
}

uint64_t sub_22C677DD0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22C677DD8);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_22C677DDC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C677DE4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_22C677DF0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AgentUpdate.Key()
{
  return &type metadata for AgentUpdate.Key;
}

uint64_t _s19PreviewsOSSupportUI27SceneAgentConnectionContextV3KeyOwet_0(unsigned int *a1, int a2)
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

uint64_t _s19PreviewsOSSupportUI27SceneAgentConnectionContextV3KeyOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_22C677E98 + 4 * byte_22C684129[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_22C677EB8 + 4 * byte_22C68412E[v4]))();
}

_BYTE *sub_22C677E98(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_22C677EB8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22C677EC0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22C677EC8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_22C677ED0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_22C677ED8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for ShellToPreviewNonUIAgent.TwoWayMessage.Discriminant()
{
  return &type metadata for ShellToPreviewNonUIAgent.TwoWayMessage.Discriminant;
}

uint64_t _s19PreviewsOSSupportUI16PreviewSceneRoleOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22C677F40 + 4 * byte_22C684138[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22C677F74 + 4 * byte_22C684133[v4]))();
}

uint64_t sub_22C677F74(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C677F7C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22C677F84);
  return result;
}

uint64_t sub_22C677F90(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22C677F98);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22C677F9C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C677FA4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ShellToPreviewNonUIAgent.TwoWayMessage.Key()
{
  return &type metadata for ShellToPreviewNonUIAgent.TwoWayMessage.Key;
}

unint64_t sub_22C677FC4()
{
  unint64_t result;

  result = qword_255C14EE0;
  if (!qword_255C14EE0)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C68499C, &type metadata for ShellToPreviewNonUIAgent.TwoWayMessage.Key);
    atomic_store(result, (unint64_t *)&qword_255C14EE0);
  }
  return result;
}

unint64_t sub_22C67800C()
{
  unint64_t result;

  result = qword_255C14EE8;
  if (!qword_255C14EE8)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C684A3C, &type metadata for ShellToPreviewNonUIAgent.TwoWayMessage.Discriminant);
    atomic_store(result, (unint64_t *)&qword_255C14EE8);
  }
  return result;
}

uint64_t sub_22C678050()
{
  return sub_22C678464(&qword_255C14EF0, &qword_255C14EF8);
}

unint64_t sub_22C678078()
{
  unint64_t result;

  result = qword_255C14F00;
  if (!qword_255C14F00)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C684B14, &type metadata for AgentUpdate.Key);
    atomic_store(result, (unint64_t *)&qword_255C14F00);
  }
  return result;
}

unint64_t sub_22C6780C0()
{
  unint64_t result;

  result = qword_255C14F08;
  if (!qword_255C14F08)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C684BB4, &type metadata for ShellToPreviewNonUIAgent.XPCEndpointContext.Key);
    atomic_store(result, (unint64_t *)&qword_255C14F08);
  }
  return result;
}

unint64_t sub_22C678108()
{
  unint64_t result;

  result = qword_255C14F10;
  if (!qword_255C14F10)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C684C54, &type metadata for ShellToPreviewNonUIAgent.XPCEndpointContext.Discriminant);
    atomic_store(result, (unint64_t *)&qword_255C14F10);
  }
  return result;
}

unint64_t sub_22C678150()
{
  unint64_t result;

  result = qword_255C14F18;
  if (!qword_255C14F18)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C684CF4, &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Key);
    atomic_store(result, (unint64_t *)&qword_255C14F18);
  }
  return result;
}

unint64_t sub_22C678198()
{
  unint64_t result;

  result = qword_255C14F20;
  if (!qword_255C14F20)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C684D94, &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Discriminant);
    atomic_store(result, (unint64_t *)&qword_255C14F20);
  }
  return result;
}

uint64_t sub_22C6781DC()
{
  return sub_22C678464(&qword_255C14F28, &qword_255C14F30);
}

unint64_t sub_22C678204()
{
  unint64_t result;

  result = qword_255C14F38;
  if (!qword_255C14F38)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C684E6C, &type metadata for SceneUpdateContext.Key);
    atomic_store(result, (unint64_t *)&qword_255C14F38);
  }
  return result;
}

unint64_t sub_22C67824C()
{
  unint64_t result;

  result = qword_255C14F40;
  if (!qword_255C14F40)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C684F0C, &type metadata for ShellToPreviewSceneAgent.XPCEndpointContext.Key);
    atomic_store(result, (unint64_t *)&qword_255C14F40);
  }
  return result;
}

unint64_t sub_22C678294()
{
  unint64_t result;

  result = qword_255C14F48;
  if (!qword_255C14F48)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C684FAC, &type metadata for ShellToPreviewSceneAgent.XPCEndpointContext.Discriminant);
    atomic_store(result, (unint64_t *)&qword_255C14F48);
  }
  return result;
}

uint64_t sub_22C6782D8()
{
  return sub_22C678464(&qword_255C14F50, &qword_255C14F58);
}

unint64_t sub_22C678300()
{
  unint64_t result;

  result = qword_255C14F60;
  if (!qword_255C14F60)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C685084, &type metadata for EntryPointCategory.Key);
    atomic_store(result, (unint64_t *)&qword_255C14F60);
  }
  return result;
}

unint64_t sub_22C678348()
{
  unint64_t result;

  result = qword_255C14F68;
  if (!qword_255C14F68)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C685124, &type metadata for EntryPointType.Key);
    atomic_store(result, (unint64_t *)&qword_255C14F68);
  }
  return result;
}

unint64_t sub_22C678390()
{
  unint64_t result;

  result = qword_255C14F70;
  if (!qword_255C14F70)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C6851C4, &type metadata for EntryPointType.Discriminant);
    atomic_store(result, (unint64_t *)&qword_255C14F70);
  }
  return result;
}

uint64_t sub_22C6783D4()
{
  return sub_22C678464(&qword_255C14F78, &qword_255C14F80);
}

unint64_t sub_22C6783FC()
{
  unint64_t result;

  result = qword_255C14F88;
  if (!qword_255C14F88)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C68529C, &type metadata for AgentUpdate.Context.Key);
    atomic_store(result, (unint64_t *)&qword_255C14F88);
  }
  return result;
}

uint64_t sub_22C678440()
{
  return sub_22C678464(&qword_255C14F90, &qword_255C14F98);
}

uint64_t sub_22C678464(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E2FEE84](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22C6784A8()
{
  unint64_t result;

  result = qword_255C14FA0;
  if (!qword_255C14FA0)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C685374, &type metadata for SceneAgentConnectionContext.Key);
    atomic_store(result, (unint64_t *)&qword_255C14FA0);
  }
  return result;
}

unint64_t sub_22C6784EC()
{
  unint64_t result;

  result = qword_255C14FA8;
  if (!qword_255C14FA8)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C6849C4, &type metadata for ShellToPreviewNonUIAgent.TwoWayMessage.Discriminant);
    atomic_store(result, (unint64_t *)&qword_255C14FA8);
  }
  return result;
}

unint64_t sub_22C678530()
{
  unint64_t result;

  result = qword_255C14FB0;
  if (!qword_255C14FB0)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C684BDC, &type metadata for ShellToPreviewNonUIAgent.XPCEndpointContext.Discriminant);
    atomic_store(result, (unint64_t *)&qword_255C14FB0);
  }
  return result;
}

unint64_t sub_22C678574()
{
  unint64_t result;

  result = qword_255C14FB8;
  if (!qword_255C14FB8)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C684D1C, &type metadata for ShellToPreviewSceneAgent.TwoWayMessage.Discriminant);
    atomic_store(result, (unint64_t *)&qword_255C14FB8);
  }
  return result;
}

unint64_t sub_22C6785B8()
{
  unint64_t result;

  result = qword_255C14FC0;
  if (!qword_255C14FC0)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C684F34, &type metadata for ShellToPreviewSceneAgent.XPCEndpointContext.Discriminant);
    atomic_store(result, (unint64_t *)&qword_255C14FC0);
  }
  return result;
}

uint64_t sub_22C6785FC()
{
  return 0x556D726F66726570;
}

uint64_t sub_22C678620()
{
  unint64_t v0;

  v0 = sub_22C683784();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_22C678668()
{
  return 0x65756C6176;
}

unint64_t sub_22C67867C()
{
  unint64_t result;

  result = qword_255C14FC8;
  if (!qword_255C14FC8)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C68514C, &type metadata for EntryPointType.Discriminant);
    atomic_store(result, (unint64_t *)&qword_255C14FC8);
  }
  return result;
}

uint64_t sub_22C6786C0()
{
  return 0x646564616F6CLL;
}

uint64_t sub_22C6786D4()
{
  unint64_t v0;

  v0 = sub_22C683784();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_22C678718()
{
  return 0x656449656E656373;
}

uint64_t sub_22C67873C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(_QWORD *)(v2 + 24);
  *a2 = *(_QWORD *)(v2 + 16);
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

unint64_t sub_22C678748()
{
  unint64_t result;

  result = qword_255C14FE0;
  if (!qword_255C14FE0)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for PreviewSceneRole, &type metadata for PreviewSceneRole);
    atomic_store(result, (unint64_t *)&qword_255C14FE0);
  }
  return result;
}

uint64_t sub_22C67878C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void UIScene.setPreviewSceneActionHandler(_:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];

  v5 = (void *)sub_22C6835D4();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v8[4] = sub_22C678974;
  v8[5] = v6;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_22C67897C;
  v8[3] = &block_descriptor_0;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_release();
  objc_msgSend(v2, sel_uv_registerActionHandlerForKey_handler_, v5, v7);
  _Block_release(v7);

}

BOOL sub_22C6788EC(void *a1, void (*a2)(uint64_t))
{
  uint64_t v4;
  id v5;

  sub_22C683334();
  v4 = swift_dynamicCastClass();
  if (v4)
  {
    v5 = a1;
    a2(v4);

  }
  return v4 != 0;
}

uint64_t sub_22C678950()
{
  swift_release();
  return swift_deallocObject();
}

BOOL sub_22C678974(void *a1)
{
  uint64_t v1;

  return sub_22C6788EC(a1, *(void (**)(uint64_t))(v1 + 16));
}

uint64_t sub_22C67897C(uint64_t a1, void *a2)
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

id UIScene.sendPreviewSceneAction(_:)(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_uv_sendSceneAction_, a1);
}

id UIScene.previewAgentDisplaysUI.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_uv_previewAgentDisplaysUI);
}

void static CATransaction.afterCommit(on:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22C678D6C(a1, a2, a3, (uint64_t)&unk_24F6E41D8, (uint64_t)sub_22C678D00, (uint64_t)&block_descriptor_1, 2u);
}

uint64_t sub_22C678A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
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
  _QWORD aBlock[6];

  v26 = a2;
  v27 = a3;
  v24 = a1;
  v28 = sub_22C68358C();
  v31 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_22C6835B0();
  v29 = *(_QWORD *)(v5 - 8);
  v30 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22C683418();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = sub_22C683598();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C67971C();
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BEE5480], v11);
  v25 = sub_22C6836B8();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v24, v8);
  v15 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v16 + v15, (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  v17 = (_QWORD *)(v16 + ((v10 + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  v18 = v27;
  *v17 = v26;
  v17[1] = v18;
  aBlock[4] = sub_22C678EE8;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22C678D04;
  aBlock[3] = &block_descriptor_33;
  v19 = _Block_copy(aBlock);
  swift_retain();
  sub_22C6835A4();
  v32 = MEMORY[0x24BEE4AF8];
  sub_22C679828();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C15060);
  sub_22C679870();
  v20 = v28;
  sub_22C683700();
  v21 = (void *)v25;
  MEMORY[0x22E2FE9B0](0, v7, v4, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v31 + 8))(v4, v20);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v30);
  return swift_release();
}

uint64_t sub_22C678D08(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
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

void static CATransaction.afterSynchronize(on:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22C678D6C(a1, a2, a3, (uint64_t)&unk_24F6E4228, (uint64_t)sub_22C678EE8, (uint64_t)&block_descriptor_6, 5u);
}

void sub_22C678D6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  unsigned int v20;
  _QWORD aBlock[6];

  v20 = a7;
  v19 = a6;
  v11 = sub_22C683418();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (void *)objc_opt_self();
  objc_msgSend(v14, sel_activate);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v11);
  v15 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v16 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v16 + v15, (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v11);
  v17 = (_QWORD *)(v16 + ((v13 + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v17 = a2;
  v17[1] = a3;
  aBlock[4] = a5;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22C678D04;
  aBlock[3] = v19;
  v18 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_addCommitHandler_forPhase_, v18, v20);
  _Block_release(v18);
}

uint64_t static CATransaction.afterCommit()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C15038);
  return sub_22C683484();
}

uint64_t static CATransaction.afterSynchronize()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C15038);
  return sub_22C683484();
}

{
  _QWORD *v0;
  uint64_t v1;

  v0[2] = sub_22C68367C();
  v0[3] = sub_22C683670();
  v0[4] = sub_22C683658();
  v0[5] = v1;
  return swift_task_switch();
}

uint64_t sub_22C679040()
{
  uint64_t v0;
  _QWORD *v1;

  objc_msgSend((id)objc_opt_self(), sel_activate);
  *(_QWORD *)(v0 + 48) = sub_22C683670();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  *v1 = v0;
  v1[1] = sub_22C6790EC;
  return sub_22C68379C();
}

uint64_t sub_22C6790EC()
{
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_22C679140()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_22C679170(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD aBlock[6];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C15048);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (void *)objc_opt_self();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v7 + v6, (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  aBlock[4] = sub_22C67968C;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22C678D04;
  aBlock[3] = &block_descriptor_13;
  v8 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(v5, sel_addCommitHandler_forPhase_, v8, 5);
  _Block_release(v8);
}

uint64_t sub_22C6792B0(uint64_t (*a1)())
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t (**v13)();
  void *v14;
  _QWORD aBlock[6];

  v2 = sub_22C683418();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)aBlock - v7;
  swift_retain();
  sub_22C683400();
  v9 = (void *)objc_opt_self();
  objc_msgSend(v9, sel_activate);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  v10 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v11 = (v4 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v12 + v10, v6, v2);
  v13 = (uint64_t (**)())(v12 + v11);
  *v13 = sub_22C6796D0;
  v13[1] = a1;
  aBlock[4] = sub_22C678D00;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22C678D04;
  aBlock[3] = &block_descriptor_27;
  v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_addCommitHandler_forPhase_, v14, 2);
  _Block_release(v14);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_22C67946C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  _QWORD aBlock[6];

  v2 = sub_22C683418();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)aBlock - v7;
  swift_retain();
  sub_22C683400();
  v9 = (void *)objc_opt_self();
  objc_msgSend(v9, sel_activate);
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  v10 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v11 = (v4 + v10 + 7) & 0xFFFFFFFFFFFFFFF8;
  v12 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v12 + v10, v6, v2);
  v13 = (_QWORD *)(v12 + v11);
  *v13 = sub_22C6798E4;
  v13[1] = a1;
  aBlock[4] = sub_22C678EE8;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22C678D04;
  aBlock[3] = &block_descriptor_20;
  v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_addCommitHandler_forPhase_, v14, 5);
  _Block_release(v14);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
}

uint64_t sub_22C679628()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C15048);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_22C67968C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C15048);
  return sub_22C683664();
}

uint64_t sub_22C6796D8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t *v3;

  v1 = *(_QWORD *)(sub_22C683418() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (uint64_t *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_22C678A38(v0 + v2, *v3, v3[1]);
}

unint64_t sub_22C67971C()
{
  unint64_t result;

  result = qword_255C15050;
  if (!qword_255C15050)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255C15050);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_22C683418();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22C6797D4()
{
  sub_22C683418();
  return sub_22C68340C();
}

unint64_t sub_22C679828()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255C15058;
  if (!qword_255C15058)
  {
    v1 = sub_22C68358C();
    result = MEMORY[0x22E2FEE84](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_255C15058);
  }
  return result;
}

unint64_t sub_22C679870()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255C15068;
  if (!qword_255C15068)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C15060);
    result = MEMORY[0x22E2FEE84](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255C15068);
  }
  return result;
}

uint64_t sub_22C6798E8(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aDiscrimiidenti_0[8 * a1] == *(_QWORD *)&aDiscrimiidenti_0[8 * a2]
    && *(_QWORD *)&aDiscrimiidenti_0[8 * a1 + 24] == *(_QWORD *)&aDiscrimiidenti_0[8 * a2 + 24])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_22C6837A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_22C67996C(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aDiscrimiupdate_0[8 * a1] == *(_QWORD *)&aDiscrimiupdate_0[8 * a2]
    && *(_QWORD *)&aSceneconnant_0[8 * a1 + 8] == *(_QWORD *)&aSceneconnant_0[8 * a2 + 8])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_22C6837A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_22C6799F0(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000014;
  else
    v3 = 0x556D726F66726570;
  if (v2)
    v4 = 0xED00006574616470;
  else
    v4 = 0x800000022C685F30;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000014;
  else
    v5 = 0x556D726F66726570;
  if ((a2 & 1) != 0)
    v6 = 0x800000022C685F30;
  else
    v6 = 0xED00006574616470;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_22C6837A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22C679AA0(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x657461647075;
  else
    v3 = 0x696D697263736964;
  if (v2)
    v4 = 0xEC000000746E616ELL;
  else
    v4 = 0xE600000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x657461647075;
  else
    v5 = 0x696D697263736964;
  if ((a2 & 1) != 0)
    v6 = 0xE600000000000000;
  else
    v6 = 0xEC000000746E616ELL;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_22C6837A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22C679B44(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000014;
  else
    v3 = 0xD000000000000015;
  if (v2)
    v4 = 0x800000022C686040;
  else
    v4 = 0x800000022C686060;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000014;
  else
    v5 = 0xD000000000000015;
  if ((a2 & 1) != 0)
    v6 = 0x800000022C686060;
  else
    v6 = 0x800000022C686040;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_22C6837A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22C679BEC(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aPreferenupdate[8 * a1] == *(_QWORD *)&aPreferenupdate[8 * a2]
    && *(_QWORD *)&aPreferenupdate[8 * a1 + 24] == *(_QWORD *)&aPreferenupdate[8 * a2 + 24])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_22C6837A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_22C679C70(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aSeed_2[8 * a1] == *(_QWORD *)&aSeed_2[8 * a2] && qword_22C685C38[a1] == qword_22C685C38[a2])
    v3 = 1;
  else
    v3 = sub_22C6837A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_22C679CF4(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0xD000000000000012;
    else
      v3 = 0x726F77656D617266;
    if (v2 == 1)
      v4 = 0x800000022C685EE0;
    else
      v4 = 0xED0000687461506BLL;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0xD000000000000012;
      else
        v6 = 0x726F77656D617266;
      if (v5 == 1)
        v7 = 0x800000022C685EE0;
      else
        v7 = 0xED0000687461506BLL;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xEC000000746E616ELL;
    v3 = 0x696D697263736964;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xEC000000746E616ELL;
  if (v3 != 0x696D697263736964)
  {
LABEL_21:
    v8 = sub_22C6837A8();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22C679E24(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xD000000000000011;
  v3 = 0x800000022C685F80;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0x6553657461647075;
    else
      v5 = 0x7961507075746573;
    if (v4 == 1)
      v6 = 0xEA00000000006465;
    else
      v6 = 0xEC00000064616F6CLL;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0xD000000000000011;
  v6 = 0x800000022C685F80;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v2 = 0x6553657461647075;
    else
      v2 = 0x7961507075746573;
    if (v7 == 1)
      v3 = 0xEA00000000006465;
    else
      v3 = 0xEC00000064616F6CLL;
  }
LABEL_15:
  if (v5 == v2 && v6 == v3)
    v8 = 1;
  else
    v8 = sub_22C6837A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_22C679F44(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_22C679F90(uint64_t a1, unsigned __int8 a2, uint64_t a3)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_22C679FF8 + 4 * byte_22C685715[a2]))(a3 - 1);
}

uint64_t sub_22C679FF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;

  if (a1 == a3 - 1 && v3 == 0x800000022C685EA0)
    v4 = 1;
  else
    v4 = sub_22C6837A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_22C67A094(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 0x636974617473;
  else
    v2 = 0x646574736F68;
  if ((a2 & 1) != 0)
    v3 = 0x636974617473;
  else
    v3 = 0x646574736F68;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_22C6837A8();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_22C67A108()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67A174()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

void sub_22C67A1F8(char a1)
{
  sub_22C6837C0();
  __asm { BR              X10 }
}

uint64_t sub_22C67A250()
{
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67A2CC()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67A334()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67A3C4()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67A42C()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67A494()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67A54C()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67A5FC()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67A664()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67A6E8()
{
  sub_22C6835F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C67A728()
{
  sub_22C6835F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C67A768()
{
  sub_22C6835F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C67A7D0()
{
  sub_22C6835F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C67A82C()
{
  sub_22C6835F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C67A86C()
{
  sub_22C6835F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C67A8AC()
{
  sub_22C6835F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C67A8E8()
{
  sub_22C6835F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C67A978()
{
  sub_22C6835F8();
  return swift_bridgeObjectRelease();
}

void sub_22C67AA00(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_22C67AA44()
{
  sub_22C6835F8();
  return swift_bridgeObjectRelease();
}

void sub_22C67AAA4(uint64_t a1, char a2)
{
  sub_22C6837C0();
  __asm { BR              X10 }
}

uint64_t sub_22C67AAF8()
{
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67AB74()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67AC20()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67ACD4()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67AD3C()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67ADA0()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67AE04()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67AE84()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67AF04()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67AF68()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67AFF4()
{
  sub_22C6837C0();
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

void sub_22C67B058(_BYTE *a1@<X8>)
{
  char v2;

  AgentToShellMessage.messageType.getter();
  *a1 = v2;
}

void AgentToShellMessage.messageType.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;

  v1 = type metadata accessor for AgentToShellMessage(0);
  MEMORY[0x24BDAC7A8](v1);
  sub_22C67B1A4(v0, (uint64_t)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = (char *)sub_22C67B100 + 4 * byte_22C685729[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_22C67B100()
{
  uint64_t v0;

  sub_22C66F808(v0, type metadata accessor for SceneUpdateHandshake);
  return 0;
}

uint64_t type metadata accessor for AgentToShellMessage(uint64_t a1)
{
  return sub_22C671510(a1, qword_255C15150);
}

uint64_t sub_22C67B1A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AgentToShellMessage(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for SceneUpdateHandshake(uint64_t a1)
{
  return sub_22C671510(a1, qword_255C151E0);
}

void AgentToShellMessage.fenceHandle.getter()
{
  uint64_t v0;
  uint64_t updated;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;

  updated = type metadata accessor for SceneUpdateHandshake(0);
  MEMORY[0x24BDAC7A8](updated);
  v2 = type metadata accessor for AgentToShellMessage(0);
  MEMORY[0x24BDAC7A8](v2);
  sub_22C67B1A4(v0, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (char *)sub_22C67B2C0 + 4 * byte_22C68572E[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void *sub_22C67B2C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  sub_22C66ECE0(v2, v1, type metadata accessor for SceneUpdateHandshake);
  v3 = *(void **)(v1 + *(int *)(v0 + 24));
  v4 = v3;
  sub_22C66F808(v1, type metadata accessor for SceneUpdateHandshake);
  return v3;
}

void AgentToShellMessage.payload.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t updated;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD v13[6];

  v1 = v0;
  v2 = sub_22C6833F4();
  v13[4] = *(_QWORD *)(v2 - 8);
  v13[5] = v2;
  MEMORY[0x24BDAC7A8](v2);
  v13[3] = (char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_22C683358();
  v13[2] = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_22C683328();
  v13[1] = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  updated = type metadata accessor for SceneUpdateHandshake(0);
  MEMORY[0x24BDAC7A8](updated);
  v7 = type metadata accessor for AgentToShellMessage(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A08);
  v11 = MEMORY[0x24BDAC7A8](v10);
  MEMORY[0x24BDAC7A8](v11);
  sub_22C67B1A4(v1, (uint64_t)v9);
  v12 = (char *)sub_22C67B534 + 4 * byte_22C685733[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_22C67B534()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 - 96);
  v2 = *(_QWORD *)(v1 - 88);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v0, 1, 1, v2);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v0, 1, v2))
  {
    v4 = 0;
  }
  else
  {
    v5 = *(_QWORD *)(v1 - 104);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v5, v0, v2);
    v4 = sub_22C6833C4();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_22C67878C(v0, &qword_255C14A08);
  return v4;
}

void sub_22C67B7B4(char *a1)
{
  AgentToShellMessage.init(messageType:fenceHandle:payload:)(*a1);
}

void AgentToShellMessage.init(messageType:fenceHandle:payload:)(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = sub_22C6832EC();
  MEMORY[0x24BDAC7A8](v2);
  v6 = sub_22C683328();
  MEMORY[0x24BDAC7A8](v6);
  v7 = type metadata accessor for AgentToShellMessage(0);
  v3 = MEMORY[0x24BDAC7A8](v7);
  v4 = MEMORY[0x24BDAC7A8](v3);
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_22C6833F4();
  MEMORY[0x24BDAC7A8](v5);
  sub_22C6833B8();
  __asm { BR              X10 }
}

uint64_t sub_22C67B948()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t updated;

  *(_QWORD *)(v5 - 96) = &type metadata for AgentToShellMessage.Key;
  v6 = sub_22C67C9B8();
  *(_QWORD *)(v5 - 88) = v6;
  *(_BYTE *)(v5 - 120) = 0;
  sub_22C66F844(&qword_255C15088, (uint64_t (*)(uint64_t))MEMORY[0x24BE78818], (uint64_t)&protocol conformance descriptor for PreviewPreferences);
  v7 = *(_QWORD *)(v5 - 72);
  sub_22C6833AC();
  if (v7)
  {

    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 - 144) + 8))(v3, *(_QWORD *)(v5 - 136));
    return __swift_destroy_boxed_opaque_existential_1(v5 - 120);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1(v5 - 120);
    *(_QWORD *)(v5 - 96) = &type metadata for AgentToShellMessage.Key;
    *(_QWORD *)(v5 - 88) = v6;
    *(_BYTE *)(v5 - 120) = 1;
    sub_22C66F844(&qword_255C14A68, (uint64_t (*)(uint64_t))MEMORY[0x24BE78778], (uint64_t)&protocol conformance descriptor for SceneUpdateSeed);
    sub_22C6833AC();
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 - 144) + 8))(v3, *(_QWORD *)(v5 - 136));
    __swift_destroy_boxed_opaque_existential_1(v5 - 120);
    (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v5 - 176) + 32))(v2, v1, *(_QWORD *)(v5 - 160));
    updated = type metadata accessor for SceneUpdateHandshake(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 184) + 32))(v2 + *(int *)(updated + 20), v0, v4);
    *(_QWORD *)(v2 + *(int *)(updated + 24)) = *(_QWORD *)(v5 - 128);
    swift_storeEnumTagMultiPayload();
    return sub_22C66ECE0(v2, *(_QWORD *)(v5 - 168), type metadata accessor for AgentToShellMessage);
  }
}

void AgentToShellMessage.payloadDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t updated;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v1 = sub_22C683358();
  MEMORY[0x24BDAC7A8](v1);
  v7 = sub_22C683328();
  MEMORY[0x24BDAC7A8](v7);
  updated = type metadata accessor for SceneUpdateHandshake(0);
  MEMORY[0x24BDAC7A8](updated);
  v3 = type metadata accessor for AgentToShellMessage(0);
  MEMORY[0x24BDAC7A8](v3);
  sub_22C67B1A4(v0, (uint64_t)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = (char *)sub_22C67BF54 + 4 * byte_22C68573D[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_22C67BF54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_22C66ECE0(v1, v0, type metadata accessor for SceneUpdateHandshake);
  *(_QWORD *)(v2 - 96) = 0;
  *(_QWORD *)(v2 - 88) = 0xE000000000000000;
  sub_22C683718();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 - 96) = 0x203A7366657270;
  *(_QWORD *)(v2 - 88) = 0xE700000000000000;
  sub_22C66F844(&qword_255C15098, (uint64_t (*)(uint64_t))MEMORY[0x24BE78818], MEMORY[0x24BE78828]);
  sub_22C683790();
  sub_22C683604();
  swift_bridgeObjectRelease();
  sub_22C683604();
  sub_22C6832EC();
  sub_22C66F844(&qword_255C150A0, (uint64_t (*)(uint64_t))MEMORY[0x24BE78778], MEMORY[0x24BE78798]);
  sub_22C683790();
  sub_22C683604();
  swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(v2 - 96);
  sub_22C66F808(v0, type metadata accessor for SceneUpdateHandshake);
  return v3;
}

uint64_t sub_22C67C1A4()
{
  sub_22C66F844(&qword_255C15090, type metadata accessor for AgentToShellMessage, (uint64_t)&protocol conformance descriptor for AgentToShellMessage);
  return sub_22C6832C8();
}

BOOL static ShellToAgentMessage.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t ShellToAgentMessage.hash(into:)()
{
  return sub_22C6837CC();
}

uint64_t ShellToAgentMessage.hashValue.getter()
{
  sub_22C6837C0();
  sub_22C6837CC();
  return sub_22C6837D8();
}

void sub_22C67C25C(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t ShellToAgentMessage.messageType.getter(char a1)
{
  return a1 & 1;
}

uint64_t sub_22C67C270()
{
  return 0;
}

uint64_t ShellToAgentMessage.fenceHandle.getter()
{
  return 0;
}

uint64_t ShellToAgentMessage.payload.getter()
{
  return 0;
}

uint64_t sub_22C67C288@<X0>(char *a1@<X0>, void *a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_22C67D1D4(*a1, a2);
  if (!v3)
    *a3 = result & 1;
  return result;
}

uint64_t ShellToAgentMessage.init(messageType:fenceHandle:payload:)(char a1, void *a2)
{
  return sub_22C67D1D4(a1 & 1, a2) & 1;
}

uint64_t sub_22C67C2D4()
{
  return 0;
}

uint64_t ShellToAgentMessage.payloadDescription.getter()
{
  return 0;
}

uint64_t sub_22C67C2EC()
{
  sub_22C67E65C();
  return sub_22C6832C8();
}

uint64_t AgentToShellMessage.MessageType.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22C67C354 + 4 * byte_22C685742[a1]))(0xD000000000000011, 0x800000022C685FD0);
}

uint64_t sub_22C67C354()
{
  return 0x6148657461647075;
}

unint64_t sub_22C67C378()
{
  return 0xD000000000000010;
}

uint64_t sub_22C67C394()
{
  return 0x5A74736575716572;
}

uint64_t sub_22C67C3B4()
{
  uint64_t v0;

  return v0 + 6;
}

uint64_t sub_22C67C3CC(char a1)
{
  return *(_QWORD *)&aPreferenupdate[8 * a1];
}

uint64_t sub_22C67C3EC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = AgentToShellMessage.MessageType.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == AgentToShellMessage.MessageType.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_22C6837A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_22C67C474()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_22C6837C0();
  AgentToShellMessage.MessageType.rawValue.getter(v1);
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67C4D4()
{
  unsigned __int8 *v0;

  AgentToShellMessage.MessageType.rawValue.getter(*v0);
  sub_22C6835F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C67C514()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_22C6837C0();
  AgentToShellMessage.MessageType.rawValue.getter(v1);
  sub_22C6835F8();
  swift_bridgeObjectRelease();
  return sub_22C6837D8();
}

uint64_t sub_22C67C570@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s19PreviewsOSSupportUI19AgentToShellMessageO0G4TypeO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_22C67C59C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = AgentToShellMessage.MessageType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22C67C5C4(char *a1, char *a2)
{
  return sub_22C679BEC(*a1, *a2);
}

uint64_t sub_22C67C5D0()
{
  return sub_22C67A5FC();
}

uint64_t sub_22C67C5D8()
{
  return sub_22C67A82C();
}

uint64_t sub_22C67C5E0()
{
  return sub_22C67ADA0();
}

uint64_t sub_22C67C5E8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22C67E614();
  *a1 = result;
  return result;
}

uint64_t sub_22C67C614@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22C67C3CC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22C67C63C()
{
  char *v0;

  return sub_22C67C3CC(*v0);
}

uint64_t sub_22C67C644(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_BYTE *, uint64_t, uint64_t);
  char *v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  char *v35;
  uint64_t v36;
  _BYTE *v37;
  char *v38;
  _BYTE *v39;
  char *v40;
  uint64_t v41;
  char v42;
  char v43;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C15008);
  MEMORY[0x24BDAC7A8](v2);
  v40 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C15238);
  MEMORY[0x24BDAC7A8](v4);
  v38 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C15240);
  v36 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v37 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v35 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C15248);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v41 = (uint64_t)&v35 - v16;
  v35 = (char *)&v35 + *(int *)(v15 + 48) - v16;
  v17 = v35;
  *((_BYTE *)&v35 - v16) = 0;
  v18 = sub_22C683328();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v20(v17, a1, v18);
  v21 = *(int *)(v6 + 48);
  v39 = v10;
  v22 = &v10[v21];
  *v10 = 1;
  v23 = a1 + *(int *)(type metadata accessor for SceneUpdateHandshake(0) + 20);
  v24 = sub_22C6832EC();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v25 + 16);
  v26(v22, v23, v24);
  v27 = &v14[*(int *)(v11 + 48)];
  *v14 = 0;
  v20(v27, (uint64_t)v35, v18);
  v28 = (uint64_t)v38;
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v38, v27, v18);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v19 + 56))(v28, 0, 1, v18);
  v43 = 0;
  v29 = v37;
  v30 = *(int *)(v36 + 48);
  v31 = &v37[v30];
  *v37 = 1;
  v26(&v29[v30], (uint64_t)v22, v24);
  v32 = (uint64_t)v40;
  (*(void (**)(char *, _BYTE *, uint64_t))(v25 + 32))(v40, v31, v24);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v25 + 56))(v32, 0, 1, v24);
  v42 = 1;
  sub_22C67C9B8();
  sub_22C66F844(&qword_255C15088, (uint64_t (*)(uint64_t))MEMORY[0x24BE78818], (uint64_t)&protocol conformance descriptor for PreviewPreferences);
  sub_22C66F844(&qword_255C14A68, (uint64_t (*)(uint64_t))MEMORY[0x24BE78778], (uint64_t)&protocol conformance descriptor for SceneUpdateSeed);
  v33 = sub_22C683448();
  sub_22C67878C(v32, &qword_255C15008);
  sub_22C67878C(v28, &qword_255C15238);
  sub_22C67878C((uint64_t)v39, &qword_255C15240);
  sub_22C67878C(v41, &qword_255C15248);
  return v33;
}

uint64_t sub_22C67C9A8(_BYTE *a1, uint64_t a2)
{
  return sub_22C67CA54(a1, a2, 2, (uint64_t (*)(_QWORD))MEMORY[0x24BE78860]);
}

unint64_t sub_22C67C9B8()
{
  unint64_t result;

  result = qword_255C15078;
  if (!qword_255C15078)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C685BF4, &type metadata for AgentToShellMessage.Key);
    atomic_store(result, (unint64_t *)&qword_255C15078);
  }
  return result;
}

uint64_t sub_22C67C9FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14A08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22C67CA44(_BYTE *a1, uint64_t a2)
{
  return sub_22C67CA54(a1, a2, 0, (uint64_t (*)(_QWORD))MEMORY[0x24BE78818]);
}

uint64_t sub_22C67CA54(_BYTE *a1, uint64_t a2, char a3, uint64_t (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)(v4 + 16);
  *a1 = a3;
  v7 = a4(0);
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a2, v6, v7);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 56))(a2, 0, 1, v7);
}

uint64_t sub_22C67CAB8()
{
  uint64_t v0;

  return sub_22C67C644(*(_QWORD *)(v0 + 16));
}

uint64_t SceneUpdateHandshake.init(preferences:updateSeed:fenceHandle:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t updated;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v8 = sub_22C683328();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a4, a1, v8);
  updated = type metadata accessor for SceneUpdateHandshake(0);
  v10 = a4 + *(int *)(updated + 20);
  v11 = sub_22C6832EC();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10, a2, v11);
  *(_QWORD *)(a4 + *(int *)(updated + 24)) = a3;
  return result;
}

PreviewsOSSupportUI::ShellToAgentMessage::MessageType_optional __swiftcall ShellToAgentMessage.MessageType.init(rawValue:)(Swift::String rawValue)
{
  uint64_t v1;
  PreviewsOSSupportUI::ShellToAgentMessage::MessageType_optional v2;

  v1 = sub_22C683784();
  swift_bridgeObjectRelease();
  if (v1 == 1)
    v2.value = PreviewsOSSupportUI_ShellToAgentMessage_MessageType_requestPreferredSize;
  else
    v2.value = PreviewsOSSupportUI_ShellToAgentMessage_MessageType_unknownDefault;
  if (v1)
    return v2;
  else
    return 0;
}

unint64_t ShellToAgentMessage.MessageType.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000014;
  else
    return 0xD000000000000015;
}

uint64_t sub_22C67CBE0(char *a1, char *a2)
{
  return sub_22C679B44(*a1, *a2);
}

uint64_t sub_22C67CBEC()
{
  return sub_22C67A664();
}

uint64_t sub_22C67CBF4()
{
  sub_22C6835F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22C67CC54()
{
  return sub_22C67AE04();
}

uint64_t sub_22C67CC5C@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_22C683784();
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

void sub_22C67CCB8(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  if (*v1)
    v2 = 0xD000000000000014;
  else
    v2 = 0xD000000000000015;
  v3 = 0x800000022C686040;
  if (*v1)
    v3 = 0x800000022C686060;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t SceneUpdateHandshake.preferences.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_22C683328();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t SceneUpdateHandshake.updateSeed.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SceneUpdateHandshake(0) + 20);
  v4 = sub_22C6832EC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

void *SceneUpdateHandshake.fenceHandle.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for SceneUpdateHandshake(0) + 24));
  v2 = v1;
  return v1;
}

uint64_t SceneUpdateHandshake.timing.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;

  v3 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for SceneUpdateHandshake(0) + 24));
  v4 = sub_22C6832F8();
  v5 = (unsigned int *)MEMORY[0x24BE787A8];
  if (v3)
    v5 = (unsigned int *)MEMORY[0x24BE787B0];
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v4 - 8) + 104))(a1, *v5, v4);
}

uint64_t PreviewPreferences.propertyListValue.getter()
{
  sub_22C683310();
  return sub_22C6833B8();
}

uint64_t PreviewPreferences.init(propertyListValue:)(uint64_t a1)
{
  uint64_t v2;

  sub_22C6833C4();
  sub_22C683304();
  v2 = sub_22C6833F4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_22C67CE90()
{
  sub_22C683310();
  return sub_22C6833B8();
}

uint64_t sub_22C67CEB4(uint64_t a1)
{
  uint64_t v2;

  sub_22C6833C4();
  sub_22C683304();
  v2 = sub_22C6833F4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_22C67CF14()
{
  sub_22C66F844(&qword_255C15228, (uint64_t (*)(uint64_t))MEMORY[0x24BE78860], MEMORY[0x24BE78870]);
  return sub_22C68346C();
}

uint64_t sub_22C67CF74()
{
  sub_22C66F844(&qword_255C15228, (uint64_t (*)(uint64_t))MEMORY[0x24BE78860], MEMORY[0x24BE78870]);
  return sub_22C683478();
}

uint64_t sub_22C67CFF0()
{
  return sub_22C67D060();
}

uint64_t sub_22C67D014()
{
  return sub_22C67D060();
}

uint64_t sub_22C67D028()
{
  return sub_22C67D060();
}

uint64_t sub_22C67D03C()
{
  return sub_22C67D060();
}

uint64_t sub_22C67D060()
{
  sub_22C6837C0();
  sub_22C6835F8();
  return sub_22C6837D8();
}

uint64_t sub_22C67D0AC()
{
  return sub_22C6835F8();
}

uint64_t sub_22C67D0D0()
{
  return sub_22C6835F8();
}

uint64_t sub_22C67D0F4()
{
  return sub_22C6835F8();
}

uint64_t sub_22C67D108()
{
  return sub_22C6835F8();
}

uint64_t sub_22C67D11C()
{
  return sub_22C67D18C();
}

uint64_t sub_22C67D130()
{
  return sub_22C67D18C();
}

uint64_t sub_22C67D144()
{
  return sub_22C67D18C();
}

uint64_t sub_22C67D168()
{
  return sub_22C67D18C();
}

uint64_t sub_22C67D18C()
{
  sub_22C6837C0();
  sub_22C6835F8();
  return sub_22C6837D8();
}

uint64_t sub_22C67D1D4(char a1, void *a2)
{
  swift_bridgeObjectRelease();
  sub_22C67E65C();
  sub_22C6832BC();

  return a1 & 1;
}

uint64_t _s19PreviewsOSSupportUI19AgentToShellMessageO0G4TypeO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_22C683784();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_22C67D2B8()
{
  return sub_22C66F844(&qword_255C150A8, type metadata accessor for AgentToShellMessage, (uint64_t)&protocol conformance descriptor for AgentToShellMessage);
}

unint64_t sub_22C67D2E8()
{
  unint64_t result;

  result = qword_255C150B0;
  if (!qword_255C150B0)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for AgentToShellMessage.MessageType, &type metadata for AgentToShellMessage.MessageType);
    atomic_store(result, (unint64_t *)&qword_255C150B0);
  }
  return result;
}

unint64_t sub_22C67D330()
{
  unint64_t result;

  result = qword_255C150B8;
  if (!qword_255C150B8)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for ShellToAgentMessage, &type metadata for ShellToAgentMessage);
    atomic_store(result, (unint64_t *)&qword_255C150B8);
  }
  return result;
}

unint64_t sub_22C67D378()
{
  unint64_t result;

  result = qword_255C150C0;
  if (!qword_255C150C0)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for ShellToAgentMessage, &type metadata for ShellToAgentMessage);
    atomic_store(result, (unint64_t *)&qword_255C150C0);
  }
  return result;
}

unint64_t sub_22C67D3C0()
{
  unint64_t result;

  result = qword_255C150C8;
  if (!qword_255C150C8)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for ShellToAgentMessage.MessageType, &type metadata for ShellToAgentMessage.MessageType);
    atomic_store(result, (unint64_t *)&qword_255C150C8);
  }
  return result;
}

unint64_t sub_22C67D408()
{
  unint64_t result;

  result = qword_255C150D0;
  if (!qword_255C150D0)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for AgentToShellMessage.MessageType, &type metadata for AgentToShellMessage.MessageType);
    atomic_store(result, (unint64_t *)&qword_255C150D0);
  }
  return result;
}

unint64_t sub_22C67D450()
{
  unint64_t result;

  result = qword_255C150D8;
  if (!qword_255C150D8)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for ShellToAgentMessage.MessageType, &type metadata for ShellToAgentMessage.MessageType);
    atomic_store(result, (unint64_t *)&qword_255C150D8);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for AgentToShellMessage(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t updated;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v18 = sub_22C683358();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(a1, a2, v18);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v19 = sub_22C683328();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(a1, a2, v19);
      v20 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C15070) + 48);
      v21 = *(void **)((char *)a2 + v20);
      *(uint64_t *)((char *)a1 + v20) = (uint64_t)v21;
      v22 = v21;
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = sub_22C683328();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      updated = type metadata accessor for SceneUpdateHandshake(0);
      v10 = *(int *)(updated + 20);
      v11 = (char *)a1 + v10;
      v12 = (char *)a2 + v10;
      v13 = sub_22C6832EC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
      v14 = *(int *)(updated + 24);
      v15 = *(void **)((char *)a2 + v14);
      *(uint64_t *)((char *)a1 + v14) = (uint64_t)v15;
      v16 = v15;
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void destroy for AgentToShellMessage(uint64_t a1)
{
  int EnumCaseMultiPayload;
  uint64_t v3;
  uint64_t updated;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v8 = sub_22C683358();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
  }
  else
  {
    if (EnumCaseMultiPayload == 1)
    {
      v9 = sub_22C683328();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
      v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C15070) + 48);
    }
    else
    {
      if (EnumCaseMultiPayload)
        return;
      v3 = sub_22C683328();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      updated = type metadata accessor for SceneUpdateHandshake(0);
      v5 = a1 + *(int *)(updated + 20);
      v6 = sub_22C6832EC();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
      v7 = *(int *)(updated + 24);
    }

  }
}

char *initializeWithCopy for AgentToShellMessage(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t updated;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v16 = sub_22C683358();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(a1, a2, v16);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v17 = sub_22C683328();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(a1, a2, v17);
    v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C15070) + 48);
    v19 = *(void **)&a2[v18];
    *(_QWORD *)&a1[v18] = v19;
    v20 = v19;
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_22C683328();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    updated = type metadata accessor for SceneUpdateHandshake(0);
    v9 = *(int *)(updated + 20);
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = sub_22C6832EC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    v13 = *(int *)(updated + 24);
    v14 = *(void **)&a2[v13];
    *(_QWORD *)&a1[v13] = v14;
    v15 = v14;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithCopy for AgentToShellMessage(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t updated;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;

  if (a1 != a2)
  {
    sub_22C66F808((uint64_t)a1, type metadata accessor for AgentToShellMessage);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v16 = sub_22C683358();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(a1, a2, v16);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v17 = sub_22C683328();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(a1, a2, v17);
      v18 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255C15070) + 48);
      v19 = *(void **)&a2[v18];
      *(_QWORD *)&a1[v18] = v19;
      v20 = v19;
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_22C683328();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      updated = type metadata accessor for SceneUpdateHandshake(0);
      v9 = *(int *)(updated + 20);
      v10 = &a1[v9];
      v11 = &a2[v9];
      v12 = sub_22C6832EC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
      v13 = *(int *)(updated + 24);
      v14 = *(void **)&a2[v13];
      *(_QWORD *)&a1[v13] = v14;
      v15 = v14;
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

char *initializeWithTake for AgentToShellMessage(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t updated;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 2)
  {
    v13 = sub_22C683358();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a1, a2, v13);
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 1)
  {
    v14 = sub_22C683328();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a1, a2, v14);
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C15070);
    *(_QWORD *)&a1[*(int *)(v15 + 48)] = *(_QWORD *)&a2[*(int *)(v15 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_22C683328();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    updated = type metadata accessor for SceneUpdateHandshake(0);
    v9 = *(int *)(updated + 20);
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = sub_22C6832EC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
    *(_QWORD *)&a1[*(int *)(updated + 24)] = *(_QWORD *)&a2[*(int *)(updated + 24)];
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

char *assignWithTake for AgentToShellMessage(char *a1, char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t updated;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 != a2)
  {
    sub_22C66F808((uint64_t)a1, type metadata accessor for AgentToShellMessage);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 2)
    {
      v13 = sub_22C683358();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a1, a2, v13);
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 1)
    {
      v14 = sub_22C683328();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a1, a2, v14);
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C15070);
      *(_QWORD *)&a1[*(int *)(v15 + 48)] = *(_QWORD *)&a2[*(int *)(v15 + 48)];
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_22C683328();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      updated = type metadata accessor for SceneUpdateHandshake(0);
      v9 = *(int *)(updated + 20);
      v10 = &a1[v9];
      v11 = &a2[v9];
      v12 = sub_22C6832EC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
      *(_QWORD *)&a1[*(int *)(updated + 24)] = *(_QWORD *)&a2[*(int *)(updated + 24)];
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for AgentToShellMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for AgentToShellMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_22C67DD0C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_22C67DD1C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  result = type metadata accessor for SceneUpdateHandshake(319);
  if (v1 <= 0x3F)
  {
    v5 = *(_QWORD *)(result - 8) + 64;
    result = sub_22C683328();
    if (v2 <= 0x3F)
    {
      swift_getTupleTypeLayout2();
      v6 = &v4;
      result = sub_22C683358();
      if (v3 <= 0x3F)
      {
        v7 = *(_QWORD *)(result - 8) + 64;
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellToAgentMessage()
{
  return &type metadata for ShellToAgentMessage;
}

uint64_t storeEnumTagSinglePayload for AgentToShellMessage.MessageType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22C67DE30 + 4 * byte_22C68574C[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_22C67DE64 + 4 * byte_22C685747[v4]))();
}

uint64_t sub_22C67DE64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C67DE6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22C67DE74);
  return result;
}

uint64_t sub_22C67DE80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22C67DE88);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_22C67DE8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C67DE94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AgentToShellMessage.MessageType()
{
  return &type metadata for AgentToShellMessage.MessageType;
}

uint64_t _s19PreviewsOSSupportUI19ShellToAgentMessageOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22C67DEFC + 4 * byte_22C685756[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22C67DF30 + 4 * byte_22C685751[v4]))();
}

uint64_t sub_22C67DF30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C67DF38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22C67DF40);
  return result;
}

uint64_t sub_22C67DF4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22C67DF54);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22C67DF58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C67DF60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ShellToAgentMessage.MessageType()
{
  return &type metadata for ShellToAgentMessage.MessageType;
}

uint64_t *initializeBufferWithCopyOfBuffer for SceneUpdateHandshake(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_22C683328();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_22C6832EC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = *(int *)(a3 + 24);
    v13 = *(void **)((char *)a2 + v12);
    *(uint64_t *)((char *)a1 + v12) = (uint64_t)v13;
    v14 = v13;
  }
  return a1;
}

void destroy for SceneUpdateHandshake(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_22C683328();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_22C6832EC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);

}

uint64_t initializeWithCopy for SceneUpdateHandshake(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v6 = sub_22C683328();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_22C6832EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = *(void **)(a2 + v11);
  *(_QWORD *)(a1 + v11) = v12;
  v13 = v12;
  return a1;
}

uint64_t assignWithCopy for SceneUpdateHandshake(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v6 = sub_22C683328();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_22C6832EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = *(void **)(a1 + v11);
  v13 = *(void **)(a2 + v11);
  *(_QWORD *)(a1 + v11) = v13;
  v14 = v13;

  return a1;
}

uint64_t initializeWithTake for SceneUpdateHandshake(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_22C683328();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_22C6832EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t assignWithTake for SceneUpdateHandshake(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = sub_22C683328();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_22C6832EC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = *(void **)(a1 + v11);
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);

  return a1;
}

uint64_t getEnumTagSinglePayload for SceneUpdateHandshake()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22C67E310(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  int v15;

  v6 = sub_22C683328();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_22C6832EC();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  v15 = v14 - 1;
  if (v15 < 0)
    v15 = -1;
  return (v15 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneUpdateHandshake()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22C67E3D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = sub_22C683328();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = sub_22C6832EC();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = a2;
  return result;
}

uint64_t sub_22C67E474()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_22C683328();
  if (v1 <= 0x3F)
  {
    result = sub_22C6832EC();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for AgentToShellMessage.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22C67E54C + 4 * byte_22C685760[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22C67E580 + 4 * byte_22C68575B[v4]))();
}

uint64_t sub_22C67E580(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C67E588(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22C67E590);
  return result;
}

uint64_t sub_22C67E59C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22C67E5A4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22C67E5A8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22C67E5B0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AgentToShellMessage.Key()
{
  return &type metadata for AgentToShellMessage.Key;
}

unint64_t sub_22C67E5D0()
{
  unint64_t result;

  result = qword_255C15220;
  if (!qword_255C15220)
  {
    result = MEMORY[0x22E2FEE84](&unk_22C685BCC, &type metadata for AgentToShellMessage.Key);
    atomic_store(result, (unint64_t *)&qword_255C15220);
  }
  return result;
}

uint64_t sub_22C67E614()
{
  unint64_t v0;

  v0 = sub_22C683784();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

unint64_t sub_22C67E65C()
{
  unint64_t result;

  result = qword_255C15230;
  if (!qword_255C15230)
  {
    result = MEMORY[0x22E2FEE84](&protocol conformance descriptor for ShellToAgentMessage, &type metadata for ShellToAgentMessage);
    atomic_store(result, (unint64_t *)&qword_255C15230);
  }
  return result;
}

uint64_t SceneMessenger.send<A>(message:expecting:timeout:)()
{
  sub_22C683490();
  return sub_22C683484();
}

uint64_t sub_22C67E738(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *a2;
  v8 = swift_allocObject();
  v9 = v7 + *MEMORY[0x24BE78770];
  *(_QWORD *)(v8 + 16) = *(_QWORD *)v9;
  *(_OWORD *)(v8 + 24) = *(_OWORD *)(v9 + 8);
  *(_QWORD *)(v8 + 40) = *(_QWORD *)(v9 + 24);
  *(_QWORD *)(v8 + 48) = a5;
  *(_QWORD *)(v8 + 56) = a1;
  swift_retain();
  sub_22C6832E0();
  return swift_release();
}

uint64_t sub_22C67E7EC(uint64_t a1)
{
  uint64_t v1;

  return sub_22C67E738(a1, *(uint64_t **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 16));
}

uint64_t sub_22C67E7F8(void *a1, char a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  uint64_t v16;

  v15 = *a3;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a4;
  *(_QWORD *)(v16 + 24) = a5;
  *(_QWORD *)(v16 + 32) = *(_QWORD *)(v15 + *MEMORY[0x24BE76BF8]);
  *(_QWORD *)(v16 + 40) = a6;
  *(_QWORD *)(v16 + 48) = a7;
  *(_QWORD *)(v16 + 56) = a8;
  *(_QWORD *)(v16 + 64) = a1;
  *(_BYTE *)(v16 + 72) = a2 & 1;
  sub_22C67F484(a1, a2 & 1);
  sub_22C6834A8();
  return swift_release();
}

uint64_t sub_22C67E8B4(id a1, char a2)
{
  id v3;

  if ((a2 & 1) != 0)
  {
    v3 = a1;
    return swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRetain();
    return sub_22C683460();
  }
}

uint64_t SceneMessenger.send(message:timeout:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C15038);
  return sub_22C683484();
}

uint64_t sub_22C67E9B0()
{
  swift_retain();
  sub_22C6832E0();
  return swift_release();
}

uint64_t sub_22C67EA04()
{
  return sub_22C67E9B0();
}

void sub_22C67EA10(id a1, char a2)
{
  id v4;

  if ((a2 & 1) != 0)
    v4 = a1;
  sub_22C68349C();
  sub_22C67F3E4(a1, a2 & 1);
}

uint64_t SceneMessageResponder.reply<A>(payload:)()
{
  sub_22C683454();
  sub_22C68334C();
  return swift_bridgeObjectRelease();
}

void SceneMessageResponder.reply<A>(result:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void **v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C15250);
  v7 = sub_22C6837E4();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (void **)((char *)&v12 - v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v12 - v8, a1, v7);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = *v9;
    sub_22C683340();

  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v4 + 32))(v6, v9, a2);
    sub_22C683454();
    sub_22C68334C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, a2);
  }
}

uint64_t PreviewPreferences.InterfaceOrientation.previewOrientation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  unsigned int *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  int v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_22C68331C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x24BE78800])
  {
    v9 = (unsigned int *)MEMORY[0x24BE77290];
LABEL_7:
    v11 = *v9;
    v12 = sub_22C683364();
    v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104);
    v14 = a1;
    v15 = v11;
    return v13(v14, v15, v12);
  }
  v10 = v8;
  if (v8 == *MEMORY[0x24BE787F8])
  {
    v9 = (unsigned int *)MEMORY[0x24BE77288];
    goto LABEL_7;
  }
  if (v8 == *MEMORY[0x24BE787E8])
  {
    v9 = (unsigned int *)MEMORY[0x24BE77278];
    goto LABEL_7;
  }
  v17 = *MEMORY[0x24BE787F0];
  v12 = sub_22C683364();
  v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104);
  if (v10 != v17)
  {
    v13(a1, *MEMORY[0x24BE77290], v12);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v15 = *MEMORY[0x24BE77280];
  v14 = a1;
  return v13(v14, v15, v12);
}

uint64_t PreviewInterfaceOrientation.previewOrientation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  unsigned int *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  int v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_22C6834E4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x24BDC6F18])
  {
    v9 = (unsigned int *)MEMORY[0x24BE77290];
LABEL_7:
    v11 = *v9;
    v12 = sub_22C683364();
    v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104);
    v14 = a1;
    v15 = v11;
    return v13(v14, v15, v12);
  }
  v10 = v8;
  if (v8 == *MEMORY[0x24BDC6F10])
  {
    v9 = (unsigned int *)MEMORY[0x24BE77288];
    goto LABEL_7;
  }
  if (v8 == *MEMORY[0x24BDC6F00])
  {
    v9 = (unsigned int *)MEMORY[0x24BE77278];
    goto LABEL_7;
  }
  v17 = *MEMORY[0x24BDC6F08];
  v12 = sub_22C683364();
  v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104);
  if (v10 != v17)
  {
    v13(a1, *MEMORY[0x24BE77290], v12);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v15 = *MEMORY[0x24BE77280];
  v14 = a1;
  return v13(v14, v15, v12);
}

uint64_t PreviewTraits.Orientation.previewPreferencesOrientation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  unsigned int *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  int v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_22C683364();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 == *MEMORY[0x24BE77290])
  {
    v9 = (unsigned int *)MEMORY[0x24BE78800];
LABEL_7:
    v11 = *v9;
    v12 = sub_22C68331C();
    v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104);
    v14 = a1;
    v15 = v11;
    return v13(v14, v15, v12);
  }
  v10 = v8;
  if (v8 == *MEMORY[0x24BE77288])
  {
    v9 = (unsigned int *)MEMORY[0x24BE787F8];
    goto LABEL_7;
  }
  if (v8 == *MEMORY[0x24BE77278])
  {
    v9 = (unsigned int *)MEMORY[0x24BE787E8];
    goto LABEL_7;
  }
  v17 = *MEMORY[0x24BE77280];
  v12 = sub_22C68331C();
  v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 104);
  if (v10 != v17)
  {
    v13(a1, *MEMORY[0x24BE78800], v12);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v15 = *MEMORY[0x24BE787F0];
  v14 = a1;
  return v13(v14, v15, v12);
}

uint64_t InterfaceOrientation.previewOrientation.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char v11;
  void (*v12)(char *, uint64_t);
  unsigned int *v13;
  char v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  v2 = v1;
  v4 = sub_22C683580();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v21 - v9;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v21 - v9, v2, v4);
  sub_22C683574();
  sub_22C67F2C8();
  v11 = sub_22C6835C8();
  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  if ((v11 & 1) != 0)
  {
    v12(v10, v4);
  }
  else
  {
    sub_22C683568();
    v14 = sub_22C6835C8();
    v12(v8, v4);
    if ((v14 & 1) != 0)
    {
      v12(v10, v4);
      v13 = (unsigned int *)MEMORY[0x24BE77288];
      goto LABEL_10;
    }
    sub_22C683550();
    v15 = sub_22C6835C8();
    v12(v8, v4);
    if ((v15 & 1) != 0)
    {
      v12(v10, v4);
      v13 = (unsigned int *)MEMORY[0x24BE77278];
      goto LABEL_10;
    }
    sub_22C68355C();
    v16 = sub_22C6835C8();
    v12(v8, v4);
    v17 = ((uint64_t (*)(char *, uint64_t))v12)(v10, v4);
    if ((v16 & 1) != 0)
    {
      v13 = (unsigned int *)MEMORY[0x24BE77280];
      goto LABEL_10;
    }
    MEMORY[0x24BDAC7A8](v17);
    sub_22C683424();
  }
  v13 = (unsigned int *)MEMORY[0x24BE77290];
LABEL_10:
  v18 = *v13;
  v19 = sub_22C683364();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(a1, v18, v19);
}

unint64_t sub_22C67F2C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255C15258;
  if (!qword_255C15258)
  {
    v1 = sub_22C683580();
    result = MEMORY[0x22E2FEE84](MEMORY[0x24BDEF518], v1);
    atomic_store(result, (unint64_t *)&qword_255C15258);
  }
  return result;
}

uint64_t sub_22C67F310()
{
  sub_22C683718();
  sub_22C683604();
  sub_22C683580();
  sub_22C68373C();
  sub_22C683604();
  return 0;
}

uint64_t sub_22C67F3AC()
{
  return sub_22C67F310();
}

uint64_t PreviewSourceContentCategory.contentCategory.getter()
{
  sub_22C6834FC();
  return sub_22C68337C();
}

void sub_22C67F3D8(void *a1, char a2)
{
  sub_22C67EA10(a1, a2 & 1);
}

void sub_22C67F3E4(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

uint64_t sub_22C67F3F0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22C67F414(void *a1, char a2)
{
  uint64_t v2;

  return sub_22C67E7F8(a1, a2 & 1, *(uint64_t **)(v2 + 56), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

uint64_t sub_22C67F428()
{
  uint64_t v0;

  sub_22C67F450(*(id *)(v0 + 64), *(_BYTE *)(v0 + 72));
  return swift_deallocObject();
}

void sub_22C67F450(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

uint64_t sub_22C67F45C()
{
  uint64_t v0;

  return sub_22C67E8B4(*(id *)(v0 + 64), *(_BYTE *)(v0 + 72));
}

id sub_22C67F484(id a1, char a2)
{
  if ((a2 & 1) != 0)
    return a1;
  else
    return (id)swift_bridgeObjectRetain();
}

uint64_t PreviewViewShim.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22C67F49C(v1, a1);
}

uint64_t sub_22C67F49C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t PreviewViewShim.init<A>(body:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t *boxed_opaque_existential_1;

  a4[3] = a2;
  a4[4] = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a4);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(boxed_opaque_existential_1, a1, a2);
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

uint64_t Preview.init<A>(with:_:traits:body:arguments:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, void (*a6)(uint64_t)@<X6>, uint64_t a7@<X8>, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v22 = a4;
  v23 = a7;
  v25 = a2;
  v26 = a3;
  v24 = a1;
  v10 = sub_22C683508();
  MEMORY[0x24BDAC7A8](v10);
  v11 = sub_22C6834D8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C15260);
  MEMORY[0x24BDAC7A8](v15);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BDC6EE8], v11);
  sub_22C6834F0();
  v16 = sub_22C6834C0();
  v17 = MEMORY[0x24BDAC7A8](v16);
  a6(v17);
  v18 = (_QWORD *)swift_allocObject();
  v19 = v22;
  v18[2] = a8;
  v18[3] = v19;
  v18[4] = a5;
  swift_retain();
  sub_22C6834CC();
  sub_22C683514();
  sub_22C67F83C();
  sub_22C683520();
  return swift_release();
}

uint64_t sub_22C67F754@<X0>(void (*a1)(_QWORD *__return_ptr)@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t *boxed_opaque_existential_1;
  __int128 v10;
  _QWORD v11[3];
  __int128 v12;

  a1(v11);
  v10 = v12;
  v3 = v12;
  v4 = __swift_project_boxed_opaque_existential_1(v11, v12);
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v7);
  *(_OWORD *)(a2 + 24) = v10;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)a2);
  (*(void (**)(uint64_t *, char *, uint64_t))(v5 + 32))(boxed_opaque_existential_1, v7, v3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

uint64_t sub_22C67F80C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22C67F830@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_22C67F754(*(void (**)(_QWORD *__return_ptr))(v1 + 24), a1);
}

unint64_t sub_22C67F83C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255C15268;
  if (!qword_255C15268)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255C15260);
    result = MEMORY[0x22E2FEE84](MEMORY[0x24BDC6E80], v1);
    atomic_store(result, (unint64_t *)&qword_255C15268);
  }
  return result;
}

uint64_t initializeWithCopy for PreviewViewShim(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for PreviewViewShim(uint64_t *a1, uint64_t *a2)
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

uint64_t assignWithTake for PreviewViewShim(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewViewShim(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PreviewViewShim(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PreviewViewShim()
{
  return &type metadata for PreviewViewShim;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

double static CGAffineTransform.transform(from:to:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  __int128 v4;
  double result;
  _OWORD v6[2];
  __int128 v7;

  sub_22C67FC20(a1, a2, (double *)v6);
  v4 = v6[1];
  *a3 = v6[0];
  a3[1] = v4;
  result = *(double *)&v7;
  a3[2] = v7;
  return result;
}

void CGAffineTransform.integralTransform.getter(double *a1@<X8>)
{
  double *v1;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v3 = CGRound(*v1);
  v4 = CGRound(v1[1]);
  v5 = CGRound(v1[2]);
  v6 = CGRound(v1[3]);
  v7 = CGRound(v1[4]);
  v8 = CGRound(v1[5]);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  a1[5] = v8;
}

void sub_22C67FC20(uint64_t a1@<X0>, uint64_t a2@<X1>, double *a3@<X8>)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double b;
  double c;
  double d;
  double tx;
  double ty;
  CGAffineTransform v16;

  if (a1 == a2)
  {
    v4 = 0.0;
    v5 = 1.0;
    v6 = 0.0;
    v7 = 1.0;
    v8 = 0.0;
    v9 = 0.0;
  }
  else
  {
    BSDegreesToRadians();
    CGAffineTransformMakeRotation(&v16, v10);
    b = v16.b;
    c = v16.c;
    d = v16.d;
    tx = v16.tx;
    ty = v16.ty;
    v5 = CGRound(v16.a);
    v4 = CGRound(b);
    v6 = CGRound(c);
    v7 = CGRound(d);
    v8 = CGRound(tx);
    v9 = CGRound(ty);
  }
  *a3 = v5;
  a3[1] = v4;
  a3[2] = v6;
  a3[3] = v7;
  a3[4] = v8;
  a3[5] = v9;
}

double CGRound(double a1)
{
  return round(a1);
}

id CounterRotationViewController.contentView.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView);
}

uint64_t CounterRotationViewController.contentOrientation.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentOrientation);
}

id CounterRotationViewController.__allocating_init(contentView:contentOrientation:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView] = a1;
  *(_QWORD *)&v5[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentOrientation] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_initWithNibName_bundle_, 0, 0);
}

id CounterRotationViewController.init(contentView:contentOrientation:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_class *ObjectType;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView] = a1;
  *(_QWORD *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentOrientation] = a2;
  v7.receiver = v2;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_initWithNibName_bundle_, 0, 0);
}

Swift::Void __swiftcall CounterRotationViewController.viewDidLoad()()
{
  char *v0;
  id v1;
  void *v2;
  objc_super v3;

  v3.receiver = v0;
  v3.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v3, sel_viewDidLoad);
  v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_addSubview_, *(_QWORD *)&v0[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView]);

  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall CounterRotationViewController.viewWillLayoutSubviews()()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = v0;
  v12.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v12, sel_viewWillLayoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView];
  v2 = objc_msgSend(v0, sel_view);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, sel_bounds);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    objc_msgSend(v1, sel_setFrame_, v5, v7, v9, v11);
  }
  else
  {
    __break(1u);
  }
}

id sub_22C68010C()
{
  void *v0;
  id v1;
  id v2;
  id v3;

  v1 = objc_msgSend(v0, sel_containerView);
  objc_opt_self();
  v2 = (id)swift_dynamicCastObjCClass();
  if (!v2)
  {

    v3 = objc_msgSend(v0, sel_containerView);
    v2 = objc_msgSend(v3, sel_window);

  }
  return v2;
}

void sub_22C6801A4(uint64_t a1, char *a2, _OWORD *a3)
{
  void *v4;
  __int128 v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _OWORD v10[3];

  v4 = *(void **)&a2[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView];
  v5 = a3[1];
  v10[0] = *a3;
  v10[1] = v5;
  v10[2] = a3[2];
  objc_msgSend(v4, sel_setTransform_, v10);
  v6 = objc_msgSend(a2, sel_view);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, sel_setNeedsLayout);

    v8 = objc_msgSend(a2, sel_view);
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, sel_layoutIfNeeded);

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_22C680260(uint64_t a1)
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

id CounterRotationViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_22C6835D4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void CounterRotationViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CounterRotationViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void _s19PreviewsOSSupportUI29CounterRotationViewControllerC18viewWillTransition2to4withySo6CGSizeV_So06UIViewgJ11Coordinator_ptF_0(void *a1)
{
  char *v1;
  char *v2;
  id v4;
  void *v5;
  id v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  char *v14;
  void *v15;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v2 = v1;
  swift_getObjectType();
  v4 = sub_22C68010C();
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_windowScene);

    if (v6)
    {
      v7 = objc_msgSend(v6, sel_interfaceOrientation);

      sub_22C67FC20((uint64_t)v7, *(_QWORD *)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentOrientation], (double *)&v21);
      v8 = v21;
      v9 = v22;
      v10 = v23;
      if (objc_msgSend(a1, sel_isAnimated))
      {
        v11 = swift_allocObject();
        v12 = v22;
        *(_OWORD *)(v11 + 24) = v21;
        *(_QWORD *)(v11 + 16) = v2;
        *(_OWORD *)(v11 + 40) = v12;
        *(_OWORD *)(v11 + 56) = v23;
        *(_QWORD *)&v20 = sub_22C680630;
        *((_QWORD *)&v20 + 1) = v11;
        *(_QWORD *)&v18 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v18 + 1) = 1107296256;
        *(_QWORD *)&v19 = sub_22C680260;
        *((_QWORD *)&v19 + 1) = &block_descriptor_2;
        v13 = _Block_copy(&v18);
        v14 = v2;
        swift_release();
        objc_msgSend(a1, sel_animateAlongsideTransition_completion_, v13, 0);
        _Block_release(v13);
      }
      else
      {
        v15 = *(void **)&v2[OBJC_IVAR____TtC19PreviewsOSSupportUI29CounterRotationViewController_contentView];
        v18 = v8;
        v19 = v9;
        v20 = v10;
        objc_msgSend(v15, sel_setTransform_, &v18);
        v16 = objc_msgSend(v2, sel_view);
        if (v16)
        {
          v17 = v16;
          objc_msgSend(v16, sel_setNeedsLayout);

        }
        else
        {
          __break(1u);
        }
      }
    }
  }
}

uint64_t type metadata accessor for CounterRotationViewController()
{
  return objc_opt_self();
}

uint64_t method lookup function for CounterRotationViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CounterRotationViewController.__allocating_init(contentView:contentOrientation:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_22C68060C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_22C680630(uint64_t a1)
{
  uint64_t v1;

  sub_22C6801A4(a1, *(char **)(v1 + 16), (_OWORD *)(v1 + 24));
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

uint64_t sub_22C680654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_22C683694();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_22C683688();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_22C6831D0(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22C683658();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_22C680798()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for UVAgentSceneRegistry()), sel_init);
  qword_255C152A8 = (uint64_t)result;
  return result;
}

id UVAgentSceneRegistry.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static UVAgentSceneRegistry.shared.getter()
{
  if (qword_255C147C0 != -1)
    swift_once();
  return (id)qword_255C152A8;
}

uint64_t static UVAgentSceneRegistry.deliverScene(_:forIdentifier:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v17;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14908);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_22C683694();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  sub_22C68367C();
  v12 = a1;
  swift_bridgeObjectRetain();
  v13 = sub_22C683670();
  v14 = (_QWORD *)swift_allocObject();
  v15 = MEMORY[0x24BEE6930];
  v14[2] = v13;
  v14[3] = v15;
  v14[4] = v4;
  v14[5] = v12;
  v14[6] = a2;
  v14[7] = a3;
  sub_22C680654((uint64_t)v10, (uint64_t)&unk_255C152B8, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_22C68092C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[3] = a6;
  v7[4] = a7;
  v7[2] = a5;
  sub_22C68367C();
  v7[5] = sub_22C683670();
  sub_22C683658();
  return swift_task_switch();
}

uint64_t sub_22C68099C()
{
  uint64_t v0;

  swift_release();
  if (qword_255C147C0 != -1)
    swift_once();
  sub_22C680A98(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22C680A0C(uint64_t a1)
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

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v9 = v1[6];
  v8 = v1[7];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_22C6832B4;
  return sub_22C68092C(a1, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_22C680A98(void *a1, uint64_t a2, unint64_t a3)
{
  void (*v3)(uint64_t *);
  void (*v4)(uint64_t *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  id v36;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v39;
  _QWORD v40[2];
  void *v41;
  void (*v42)(uint64_t *);
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46[3];

  v4 = v3;
  v8 = sub_22C683544();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v40 - v13;
  v15 = (uint64_t *)((char *)v3 + OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_sceneHandlers);
  swift_beginAccess();
  v16 = *v15;
  if (*(_QWORD *)(*v15 + 16))
  {
    swift_bridgeObjectRetain();
    v17 = sub_22C681D98(a2, a3);
    if ((v18 & 1) != 0)
    {
      v19 = a2;
      v20 = *(_QWORD *)(v16 + 56) + 16 * v17;
      v21 = *(_QWORD *)(v20 + 8);
      v42 = *(void (**)(uint64_t *))v20;
      swift_endAccess();
      swift_retain();
      swift_bridgeObjectRelease();
      sub_22C68352C();
      swift_bridgeObjectRetain_n();
      v22 = sub_22C683538();
      v23 = sub_22C6836A0();
      if (os_log_type_enabled(v22, v23))
      {
        v44 = v8;
        v24 = swift_slowAlloc();
        v43 = v9;
        v25 = (uint8_t *)v24;
        v26 = swift_slowAlloc();
        v41 = a1;
        v27 = v26;
        v46[0] = v26;
        v40[1] = v21;
        *(_DWORD *)v25 = 136446210;
        swift_bridgeObjectRetain();
        v45 = sub_22C681758(v19, a3, v46);
        sub_22C6836DC();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_22C669000, v22, v23, "UVAgentSceneRegistry received scene for %{public}s; will fulfill stored request",
          v25,
          0xCu);
        swift_arrayDestroy();
        v28 = v27;
        a1 = v41;
        MEMORY[0x22E2FEF08](v28, -1, -1);
        MEMORY[0x22E2FEF08](v25, -1, -1);

        (*(void (**)(char *, uint64_t))(v43 + 8))(v14, v44);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
      }
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v39 = sub_22C681EEC(v19, a3);
      swift_endAccess();
      swift_bridgeObjectRelease();
      sub_22C6832A4(v39);
      v46[0] = (uint64_t)a1;
      v42(v46);
      return swift_release();
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  sub_22C68352C();
  swift_bridgeObjectRetain_n();
  v29 = sub_22C683538();
  v30 = sub_22C6836A0();
  if (os_log_type_enabled(v29, v30))
  {
    v44 = v8;
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v42 = v4;
    v33 = v32;
    v46[0] = v32;
    v43 = v9;
    *(_DWORD *)v31 = 136446210;
    swift_bridgeObjectRetain();
    v45 = sub_22C681758(a2, a3, v46);
    sub_22C6836DC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22C669000, v29, v30, "UVAgentSceneRegistry received scene for %{public}s; no request yet, will store scene",
      v31,
      0xCu);
    swift_arrayDestroy();
    v34 = v33;
    v4 = v42;
    MEMORY[0x22E2FEF08](v34, -1, -1);
    MEMORY[0x22E2FEF08](v31, -1, -1);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v12, v44);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  v35 = (uint64_t *)((char *)v4 + OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_scenes);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v36 = a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v45 = *v35;
  *v35 = 0x8000000000000000;
  sub_22C68298C((uint64_t)v36, a2, a3, isUniquelyReferenced_nonNull_native);
  *v35 = v45;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_endAccess();
}

void UVAgentSceneRegistry.requestScene(for:handler:)(uint64_t a1, unint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  void (*v4)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  void *v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(_QWORD);
  uint64_t v34;
  uint64_t *v35;
  char isUniquelyReferenced_nonNull_native;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(_QWORD);
  uint64_t v44;
  uint64_t v45[3];

  v9 = sub_22C683544();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v38 - v14;
  v43 = v4;
  v16 = (uint64_t *)((char *)v4 + OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_scenes);
  swift_beginAccess();
  v17 = *v16;
  if (*(_QWORD *)(*v16 + 16))
  {
    swift_bridgeObjectRetain();
    v18 = sub_22C681D98(a1, a2);
    if ((v19 & 1) != 0)
    {
      v42 = v10;
      v20 = *(void **)(*(_QWORD *)(v17 + 56) + 8 * v18);
      swift_endAccess();
      v21 = v20;
      swift_bridgeObjectRelease();
      sub_22C68352C();
      swift_bridgeObjectRetain_n();
      v22 = sub_22C683538();
      v23 = sub_22C6836A0();
      if (os_log_type_enabled(v22, v23))
      {
        v43 = a3;
        v24 = swift_slowAlloc();
        v40 = v9;
        v25 = (uint8_t *)v24;
        v26 = swift_slowAlloc();
        v41 = a4;
        v27 = v26;
        v45[0] = v26;
        v39 = v21;
        *(_DWORD *)v25 = 136446210;
        swift_bridgeObjectRetain();
        v44 = sub_22C681758(a1, a2, v45);
        a3 = v43;
        v21 = v39;
        sub_22C6836DC();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_22C669000, v22, v23, "UVAgentSceneRegistry request for %{public}s; will fulfill with stored scene",
          v25,
          0xCu);
        swift_arrayDestroy();
        MEMORY[0x22E2FEF08](v27, -1, -1);
        MEMORY[0x22E2FEF08](v25, -1, -1);

        (*(void (**)(char *, uint64_t))(v42 + 8))(v15, v40);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v42 + 8))(v15, v9);
      }
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v37 = (void *)sub_22C681E20(a1, a2);
      swift_endAccess();
      swift_bridgeObjectRelease();

      a3(v21);
      return;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  sub_22C68352C();
  swift_bridgeObjectRetain_n();
  v28 = sub_22C683538();
  v29 = sub_22C6836A0();
  if (os_log_type_enabled(v28, v29))
  {
    v41 = a4;
    v30 = (uint8_t *)swift_slowAlloc();
    v31 = swift_slowAlloc();
    v40 = v9;
    v32 = v31;
    v45[0] = v31;
    v42 = v10;
    *(_DWORD *)v30 = 136446210;
    swift_bridgeObjectRetain();
    v44 = sub_22C681758(a1, a2, v45);
    a4 = v41;
    sub_22C6836DC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_22C669000, v28, v29, "UVAgentSceneRegistry request for %{public}s; no scene yet, will store request",
      v30,
      0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E2FEF08](v32, -1, -1);
    MEMORY[0x22E2FEF08](v30, -1, -1);

    (*(void (**)(char *, uint64_t))(v42 + 8))(v13, v40);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
  }
  v33 = v43;
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = a3;
  *(_QWORD *)(v34 + 24) = a4;
  v35 = (uint64_t *)((char *)v33 + OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_sceneHandlers);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v44 = *v35;
  *v35 = 0x8000000000000000;
  sub_22C682AE8((uint64_t)sub_22C681DFC, v34, a1, a2, isUniquelyReferenced_nonNull_native);
  *v35 = v44;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
}

id UVAgentSceneRegistry.init()()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  objc_super v4;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v0[OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_scenes] = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v0[OBJC_IVAR____TtC19PreviewsOSSupportUI20UVAgentSceneRegistry_sceneHandlers] = v2;
  v4.receiver = v0;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, sel_init);
}

id UVAgentSceneRegistry.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22C6816A8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_22C68170C;
  return v6(a1);
}

uint64_t sub_22C68170C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_22C681758(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_22C681828(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22C683190((uint64_t)v12, *a3);
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
      sub_22C683190((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_22C681828(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_22C6836E8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_22C6819E0(a5, a6);
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
  v8 = sub_22C683730();
  if (!v8)
  {
    sub_22C683748();
    __break(1u);
LABEL_17:
    result = sub_22C683778();
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

uint64_t sub_22C6819E0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_22C681A74(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_22C681C4C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_22C681C4C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22C681A74(uint64_t a1, unint64_t a2)
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
      v3 = sub_22C681BE8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_22C683724();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_22C683748();
      __break(1u);
LABEL_10:
      v2 = sub_22C683610();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_22C683778();
    __break(1u);
LABEL_14:
    result = sub_22C683748();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_22C681BE8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C15308);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22C681C4C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255C15308);
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
  result = sub_22C683778();
  __break(1u);
  return result;
}

unint64_t sub_22C681D98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_22C6837C0();
  sub_22C6835F8();
  v4 = sub_22C6837D8();
  return sub_22C682D40(a1, a2, v4);
}

uint64_t sub_22C681DFC(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_22C681E20(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_22C681D98(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_22C682E20();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_22C6825E4(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_22C681EEC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_22C681D98(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_22C682FD0();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 16 * v6);
  sub_22C6827B8(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_22C681FD0(uint64_t a1, char a2)
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C15300);
  v38 = a2;
  v6 = sub_22C68376C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_22C6837C0();
    sub_22C6835F8();
    result = sub_22C6837D8();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_22C6822DC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  _QWORD *v36;
  __int128 v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C15310);
  v6 = a2;
  v7 = sub_22C68376C();
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v22 = v21 | (v14 << 6);
      }
      else
      {
        v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35)
          goto LABEL_33;
        v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          v14 = v23 + 1;
          if (v23 + 1 >= v35)
            goto LABEL_33;
          v24 = v36[v14];
          if (!v24)
          {
            v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v6 & 1) != 0)
              {
                v34 = 1 << *(_BYTE *)(v5 + 32);
                if (v34 >= 64)
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v34;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                v14 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_40;
                if (v14 >= v35)
                  goto LABEL_33;
                v24 = v36[v14];
                ++v25;
                if (v24)
                  goto LABEL_30;
              }
            }
            v14 = v25;
          }
        }
LABEL_30:
        v11 = (v24 - 1) & v24;
        v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      v30 = 16 * v22;
      v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v30);
      v33 = *v31;
      v32 = v31[1];
      v37 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_retain();
      }
      sub_22C6837C0();
      sub_22C6835F8();
      result = sub_22C6837D8();
      v15 = -1 << *(_BYTE *)(v8 + 32);
      v16 = result & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v28 = v17 == v27;
          if (v17 == v27)
            v17 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v12 + 8 * v17);
        }
        while (v29 == -1);
        v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }
      *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = 16 * v18;
      v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
      *v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(_QWORD *)(v8 + 56) + v19) = v37;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
  *v3 = v8;
  return result;
}

unint64_t sub_22C6825E4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_22C68370C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_22C6837C0();
        swift_bridgeObjectRetain();
        sub_22C6835F8();
        v9 = sub_22C6837D8();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_22C6827B8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_22C68370C();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_22C6837C0();
        swift_bridgeObjectRetain();
        sub_22C6835F8();
        v9 = sub_22C6837D8();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_22C68298C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_22C681D98(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_22C682E20();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_22C681FD0(v15, a4 & 1);
  v20 = sub_22C681D98(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_22C6837B4();
  __break(1u);
}

uint64_t sub_22C682AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_22C681D98(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_22C682FD0();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_release();
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_22C6822DC(v17, a5 & 1);
  v23 = sub_22C681D98(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_22C6837B4();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for UVAgentSceneRegistry()
{
  return objc_opt_self();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_22C682CB4(uint64_t a1)
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

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v9 = v1[6];
  v8 = v1[7];
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_22C66D218;
  return sub_22C68092C(a1, v4, v5, v6, v7, v9, v8);
}

unint64_t sub_22C682D40(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_22C6837A8() & 1) == 0)
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
      while (!v14 && (sub_22C6837A8() & 1) == 0);
    }
  }
  return v6;
}

id sub_22C682E20()
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C15300);
  v2 = *v0;
  v3 = sub_22C683760();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
      goto LABEL_28;
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
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22C682FD0()
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
  __int128 v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255C15310);
  v2 = *v0;
  v3 = sub_22C683760();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
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
      goto LABEL_28;
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
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v16) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_22C683190(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22C6831D0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255C14908);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22C683210()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22C683234(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22C66D218;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255C15318 + dword_255C15318))(a1, v4);
}

uint64_t sub_22C6832A4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_22C6832BC()
{
  return MEMORY[0x24BE78728]();
}

uint64_t sub_22C6832C8()
{
  return MEMORY[0x24BE78730]();
}

uint64_t sub_22C6832D4()
{
  return MEMORY[0x24BE78738]();
}

uint64_t sub_22C6832E0()
{
  return MEMORY[0x24BE78758]();
}

uint64_t sub_22C6832EC()
{
  return MEMORY[0x24BE78778]();
}

uint64_t sub_22C6832F8()
{
  return MEMORY[0x24BE787B8]();
}

uint64_t sub_22C683304()
{
  return MEMORY[0x24BE787D8]();
}

uint64_t sub_22C683310()
{
  return MEMORY[0x24BE787E0]();
}

uint64_t sub_22C68331C()
{
  return MEMORY[0x24BE78808]();
}

uint64_t sub_22C683328()
{
  return MEMORY[0x24BE78818]();
}

uint64_t sub_22C683334()
{
  return MEMORY[0x24BE78830]();
}

uint64_t sub_22C683340()
{
  return MEMORY[0x24BE78840]();
}

uint64_t sub_22C68334C()
{
  return MEMORY[0x24BE78848]();
}

uint64_t sub_22C683358()
{
  return MEMORY[0x24BE78860]();
}

uint64_t sub_22C683364()
{
  return MEMORY[0x24BE77298]();
}

uint64_t sub_22C683370()
{
  return MEMORY[0x24BE77398]();
}

uint64_t sub_22C68337C()
{
  return MEMORY[0x24BE77568]();
}

uint64_t sub_22C683388()
{
  return MEMORY[0x24BE777F0]();
}

uint64_t sub_22C683394()
{
  return MEMORY[0x24BE77A00]();
}

uint64_t sub_22C6833A0()
{
  return MEMORY[0x24BE764C0]();
}

uint64_t sub_22C6833AC()
{
  return MEMORY[0x24BE764C8]();
}

uint64_t sub_22C6833B8()
{
  return MEMORY[0x24BE764E0]();
}

uint64_t sub_22C6833C4()
{
  return MEMORY[0x24BE764E8]();
}

uint64_t sub_22C6833D0()
{
  return MEMORY[0x24BE764F0]();
}

uint64_t sub_22C6833DC()
{
  return MEMORY[0x24BE76500]();
}

uint64_t sub_22C6833E8()
{
  return MEMORY[0x24BE76510]();
}

uint64_t sub_22C6833F4()
{
  return MEMORY[0x24BE76530]();
}

uint64_t sub_22C683400()
{
  return MEMORY[0x24BE76588]();
}

uint64_t sub_22C68340C()
{
  return MEMORY[0x24BE76598]();
}

uint64_t sub_22C683418()
{
  return MEMORY[0x24BE765A0]();
}

uint64_t sub_22C683424()
{
  return MEMORY[0x24BE76728]();
}

uint64_t sub_22C683430()
{
  return MEMORY[0x24BE76830]();
}

uint64_t sub_22C68343C()
{
  return MEMORY[0x24BE76840]();
}

uint64_t sub_22C683448()
{
  return MEMORY[0x24BE76848]();
}

uint64_t sub_22C683454()
{
  return MEMORY[0x24BE769B8]();
}

uint64_t sub_22C683460()
{
  return MEMORY[0x24BE769C0]();
}

uint64_t sub_22C68346C()
{
  return MEMORY[0x24BE769C8]();
}

uint64_t sub_22C683478()
{
  return MEMORY[0x24BE769D0]();
}

uint64_t sub_22C683484()
{
  return MEMORY[0x24BE76B48]();
}

uint64_t sub_22C683490()
{
  return MEMORY[0x24BE76B98]();
}

uint64_t sub_22C68349C()
{
  return MEMORY[0x24BE76BC0]();
}

uint64_t sub_22C6834A8()
{
  return MEMORY[0x24BE76BC8]();
}

uint64_t sub_22C6834B4()
{
  return MEMORY[0x24BE76BE8]();
}

uint64_t sub_22C6834C0()
{
  return MEMORY[0x24BDC6DD0]();
}

uint64_t sub_22C6834CC()
{
  return MEMORY[0x24BDC6E48]();
}

uint64_t sub_22C6834D8()
{
  return MEMORY[0x24BDC6EF8]();
}

uint64_t sub_22C6834E4()
{
  return MEMORY[0x24BDC6F20]();
}

uint64_t sub_22C6834F0()
{
  return MEMORY[0x24BDEADC0]();
}

uint64_t sub_22C6834FC()
{
  return MEMORY[0x24BDC6F28]();
}

uint64_t sub_22C683508()
{
  return MEMORY[0x24BDC6F30]();
}

uint64_t sub_22C683514()
{
  return MEMORY[0x24BDC6F50]();
}

uint64_t sub_22C683520()
{
  return MEMORY[0x24BDC6F58]();
}

uint64_t sub_22C68352C()
{
  return MEMORY[0x24BE76C80]();
}

uint64_t sub_22C683538()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22C683544()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22C683550()
{
  return MEMORY[0x24BDEF4E8]();
}

uint64_t sub_22C68355C()
{
  return MEMORY[0x24BDEF4F0]();
}

uint64_t sub_22C683568()
{
  return MEMORY[0x24BDEF4F8]();
}

uint64_t sub_22C683574()
{
  return MEMORY[0x24BDEF500]();
}

uint64_t sub_22C683580()
{
  return MEMORY[0x24BDEF508]();
}

uint64_t sub_22C68358C()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_22C683598()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_22C6835A4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_22C6835B0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22C6835BC()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_22C6835C8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22C6835D4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22C6835E0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22C6835EC()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_22C6835F8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22C683604()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22C683610()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22C68361C()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_22C683628()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_22C683634()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22C683640()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_22C68364C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_22C683658()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_22C683664()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_22C683670()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_22C68367C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_22C683688()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_22C683694()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_22C6836A0()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_22C6836AC()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_22C6836B8()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_22C6836C4()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_22C6836D0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22C6836DC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22C6836E8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22C6836F4()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_22C683700()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22C68370C()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_22C683718()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22C683724()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22C683730()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22C68373C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_22C683748()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22C683754()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_22C683760()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_22C68376C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_22C683778()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22C683784()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_22C683790()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22C68379C()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_22C6837A8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22C6837B4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_22C6837C0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22C6837CC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22C6837D8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22C6837E4()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t BSDegreesToRadians()
{
  return MEMORY[0x24BE0BAE0]();
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t UVLog()
{
  return MEMORY[0x24BE78720]();
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

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

