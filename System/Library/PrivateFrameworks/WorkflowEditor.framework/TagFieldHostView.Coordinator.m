@implementation TagFieldHostView.Coordinator

- (void)showActionOutputPickerAllowingShortcutInput:(BOOL)a3 variableProvider:(id)a4 completionHandler:(id)a5
{
  void *v6;
  _TtCV14WorkflowEditor16TagFieldHostView11Coordinator *v7;

  v6 = _Block_copy(a5);
  *(_QWORD *)(swift_allocObject() + 16) = v6;
  swift_unknownObjectRetain();
  v7 = self;
  sub_2266FE678();
  swift_unknownObjectRelease();

  swift_release();
}

- (void)revealAction:(id)a3 preScrollHandler:(id)a4 goBackHandler:(id)a5 scrolledAwayHandler:(id)a6
{
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _TtCV14WorkflowEditor16TagFieldHostView11Coordinator *v16;
  uint64_t v17;
  uint64_t v18;

  v10 = _Block_copy(a4);
  v11 = _Block_copy(a5);
  v12 = _Block_copy(a6);
  *(_QWORD *)(swift_allocObject() + 16) = v10;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v11;
  if (v12)
  {
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v12;
    v12 = sub_2266E5704;
  }
  else
  {
    v14 = 0;
  }
  v15 = a3;
  v16 = self;
  sub_2266FE80C(v15, v17, v18, (uint64_t)sub_2266E3CFC, v13, (uint64_t)v12, v14);
  sub_22666DCBC((uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)showParameterEditingHint:(id)a3
{
  _TtCV14WorkflowEditor16TagFieldHostView11Coordinator *v4;

  if (a3)
    sub_22688E220();
  v4 = self;
  sub_2266FEC88();

  swift_bridgeObjectRelease();
}

- (_TtCV14WorkflowEditor16TagFieldHostView11Coordinator)init
{
  sub_2266B8448();
}

- (void).cxx_destruct
{
  sub_2266FFD28((uint64_t)self + OBJC_IVAR____TtCV14WorkflowEditor16TagFieldHostView11Coordinator_hostView);
}

@end
