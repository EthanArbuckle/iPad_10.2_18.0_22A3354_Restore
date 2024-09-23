@implementation FilePickerParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditor32FilePickerParameterSummaryEditor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22678A748((uint64_t)v8, v7);

}

- (void)beginEditingNewArrayElementFromPresentationAnchor:(id)a3
{
  id v4;
  _TtC14WorkflowEditor32FilePickerParameterSummaryEditor *v5;

  v4 = a3;
  v5 = self;
  sub_22678A7B0(v4);

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14WorkflowEditor32FilePickerParameterSummaryEditor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_226838290((uint64_t)&unk_25587B7D0, v5);
}

- (_TtC14WorkflowEditor32FilePickerParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditor32FilePickerParameterSummaryEditor *)sub_22678B62C(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor32FilePickerParameterSummaryEditor_modal));
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4;
  _TtC14WorkflowEditor32FilePickerParameterSummaryEditor *v5;

  v4 = a3;
  v5 = self;
  sub_22678B798(v4);

}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC14WorkflowEditor32FilePickerParameterSummaryEditor *v8;

  sub_22688B6E8();
  v6 = sub_22688E34C();
  v7 = a3;
  v8 = self;
  sub_22678B898(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC14WorkflowEditor32FilePickerParameterSummaryEditor *v5;

  v4 = a3;
  v5 = self;
  sub_22678B9F4();

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditor32FilePickerParameterSummaryEditor *v8;
  int64_t v9;
  int64_t v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22678BA50();
  v10 = v9;

  return v10;
}

@end
