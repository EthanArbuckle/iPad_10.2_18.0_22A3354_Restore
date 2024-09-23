@implementation DynamicResolveParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditor36DynamicResolveParameterSummaryEditor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22681B08C((uint64_t)v8, v7);

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14WorkflowEditor36DynamicResolveParameterSummaryEditor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_226838290((uint64_t)&unk_255881530, v5);
}

- (_TtC14WorkflowEditor36DynamicResolveParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditor36DynamicResolveParameterSummaryEditor *)sub_22681B734(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor36DynamicResolveParameterSummaryEditor_presentedViewController));
}

- (void)parameterValuePickerViewControllerDidCancel:(id)a3
{
  id v4;
  _TtC14WorkflowEditor36DynamicResolveParameterSummaryEditor *v5;

  v4 = a3;
  v5 = self;
  sub_22681B824((uint64_t)v5);

}

- (void)parameterValuePickerViewController:(id)a3 didFinishWithParameterState:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditor36DynamicResolveParameterSummaryEditor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22681B890((uint64_t)v8, (uint64_t)a4);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC14WorkflowEditor36DynamicResolveParameterSummaryEditor *v5;

  v4 = a3;
  v5 = self;
  sub_22681B8F8((uint64_t)v5);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditor36DynamicResolveParameterSummaryEditor *v8;
  int64_t v9;
  int64_t v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22681B964((uint64_t)v8, v7);
  v10 = v9;

  return v10;
}

@end
