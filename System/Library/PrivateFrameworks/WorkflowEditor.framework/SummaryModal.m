@implementation SummaryModal

- (_TtC14WorkflowEditor12SummaryModal)init
{
  SummaryModal.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4;
  _TtC14WorkflowEditor12SummaryModal *v5;

  v4 = a3;
  v5 = self;
  SummaryModal.presentationControllerDidDismiss(_:)((UIPresentationController)v5);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditor12SummaryModal *v8;
  UIModalPresentationStyle v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = SummaryModal.adaptivePresentationStyle(for:traitCollection:)((UIPresentationController)v8, (UITraitCollection)v7);

  return v9;
}

@end
