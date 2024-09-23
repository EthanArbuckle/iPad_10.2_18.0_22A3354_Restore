@implementation SummaryHostingView.Coordinator

- (id)viewControllerForCoordinator:(id)a3
{
  id v4;
  _TtCV14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770418SummaryHostingView11Coordinator *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_2267AB0B4();

  return v6;
}

- (void)summaryCoordinatorDidInvalidateSize:(id)a3
{
  id v4;
  _TtCV14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770418SummaryHostingView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2267AB178(v4);

}

- (void)summaryCoordinator:(id)a3 disclosureArrowDidChange:(BOOL)a4
{
  id v5;
  _TtCV14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770418SummaryHostingView11Coordinator *v6;

  v5 = a3;
  v6 = self;
  sub_2267AB21C();

}

- (void)summaryCoordinator:(id)a3 outputButtonDidChange:(BOOL)a4
{
  id v5;
  _TtCV14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770418SummaryHostingView11Coordinator *v6;

  v5 = a3;
  v6 = self;
  sub_2267AB350();

}

- (void)showActionOutputPickerAllowingShortcutInput:(BOOL)a3 variableProvider:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  _TtCV14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770418SummaryHostingView11Coordinator *v10;

  v8 = _Block_copy(a5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v8;
  swift_unknownObjectRetain();
  v10 = self;
  sub_2267AB4FC(a3, (uint64_t)a4, (uint64_t)sub_2266E3D04, v9);
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
  uint64_t v15;
  id v16;
  _TtCV14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770418SummaryHostingView11Coordinator *v17;

  v10 = _Block_copy(a4);
  v11 = _Block_copy(a5);
  v12 = _Block_copy(a6);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v10;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v11;
  if (v12)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v12;
    v12 = sub_2266E5704;
  }
  else
  {
    v15 = 0;
  }
  v16 = a3;
  v17 = self;
  sub_2267AB6C4(v16, (uint64_t)sub_2266E3CFC, v13, (uint64_t)sub_2266E5704, v14, (uint64_t)v12, v15);
  sub_22666DCBC((uint64_t)v12);

  swift_release();
  swift_release();
}

- (void)showVariableEditorWithOptions:(id)a3 fromSourceRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _TtCV14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770418SummaryHostingView11Coordinator *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = self;
  sub_2267ABA3C(v9, x, y, width, height);

}

- (void)showParameterEditingHint:(id)a3
{
  _TtCV14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770418SummaryHostingView11Coordinator *v4;

  if (a3)
    sub_22688E220();
  v4 = self;
  sub_2267AC36C();

  swift_bridgeObjectRelease();
}

- (_TtCV14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770418SummaryHostingView11Coordinator)init
{
  sub_2266B8448();
}

- (void).cxx_destruct
{
  sub_2267B17A8((uint64_t)self+ OBJC_IVAR____TtCV14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770418SummaryHostingView11Coordinator_view);
}

@end
