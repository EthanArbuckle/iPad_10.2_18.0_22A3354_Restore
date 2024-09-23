@implementation SiriSharedUIFeedbackController

- (BOOL)isProvidingFeedback
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___SiriSharedUIFeedbackController_isProvidingFeedback;
  swift_beginAccess();
  return *v2;
}

- (void)setIsProvidingFeedback:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___SiriSharedUIFeedbackController_isProvidingFeedback;
  swift_beginAccess();
  *v4 = a3;
}

- (SiriSharedUIFeedbackController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = sub_1DE13095C();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (SiriSharedUIFeedbackController *)SiriSharedUIFeedbackController.init(nibName:bundle:)(v5, v7, a4);
}

- (SiriSharedUIFeedbackController)initWithCoder:(id)a3
{
  id v4;
  SiriSharedUIFeedbackController *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SiriSharedUIFeedbackController_feedbackController) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SiriSharedUIFeedbackController_evaluationResult) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR___SiriSharedUIFeedbackController_isProvidingFeedback) = 0;
  v4 = a3;

  result = (SiriSharedUIFeedbackController *)sub_1DE130BFC();
  __break(1u);
  return result;
}

- (void)userDidReportConcernWithModel:(id)a3
{
  SiriSharedUIFeedbackModel *v4;
  SiriSharedUIFeedbackController *v5;

  v4 = (SiriSharedUIFeedbackModel *)a3;
  v5 = self;
  SiriSharedUIFeedbackController.userDidReportConcern(with:)(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___SiriSharedUIFeedbackController_feedbackController));

}

@end
