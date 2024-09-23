@implementation PXSurveyQuestionsMultipleAnswerSelectionController

- (PXSurveyQuestionsMultipleAnswerSelectionController)initWithTitle:(id)a3 message:(id)a4 reasons:(id)a5 currentlySelectedReasons:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  PXSurveyQuestionsMultipleAnswerSelectionTableViewController *v17;
  PXSurveyQuestionsMultipleAnswerSelectionController *v18;
  objc_super v20;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[PXSurveyQuestionsMultipleAnswerSelectionTableViewController initWithTitle:message:reasons:currentlySelectedReasons:completion:]([PXSurveyQuestionsMultipleAnswerSelectionTableViewController alloc], "initWithTitle:message:reasons:currentlySelectedReasons:completion:", v16, v15, v14, v13, v12);

  v20.receiver = self;
  v20.super_class = (Class)PXSurveyQuestionsMultipleAnswerSelectionController;
  v18 = -[PXSurveyQuestionsMultipleAnswerSelectionController initWithRootViewController:](&v20, sel_initWithRootViewController_, v17);

  if (v18)
    -[PXSurveyQuestionsMultipleAnswerSelectionController setModalPresentationStyle:](v18, "setModalPresentationStyle:", 0);
  return v18;
}

@end
