@implementation MailMoveActionsViewDataSource

- (id)sectionDataForMailActionsViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSMutableArray *v15;
  MFCardActionSectionData *v16;
  void *v17;
  MFCardActionSectionData *v18;
  void *v20;
  void *v21;

  if (!-[MailActionsViewDataSource isTargetValid](self, "isTargetValid", a3))
    return &__NSArray0__struct;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource presentationSource](self, "presentationSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource completion](self, "completion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource predictedMailbox](self, "predictedMailbox"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resultIfAvailable"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource moveToPredictionTriageInteractionDelegate](self, "moveToPredictionTriageInteractionDelegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource presentingViewControllerForTransferUI](self, "presentingViewControllerForTransferUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource target](self, "target"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "messageListItem"));
  v21 = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailActionsViewDataSource scene](self, "scene"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "undoManager"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MFMoveToPredictionTriageInteraction interactionWithMessageListItems:undoManager:origin:actor:presentationSource:delegate:presentingViewController:predictedMailbox:](MFMoveToPredictionTriageInteraction, "interactionWithMessageListItems:undoManager:origin:actor:presentationSource:delegate:presentingViewController:predictedMailbox:", v11, v13, -[MailActionsViewDataSource origin](self, "origin"), 2, v20, v7, v8, v6));
  v15 = objc_opt_new(NSMutableArray);
  v16 = [MFCardActionSectionData alloc];
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cardActionsWithCompletion:", v4));
  v18 = -[MFCardActionSectionData initWithActions:viewLayout:](v16, "initWithActions:viewLayout:", v17, 2);
  -[NSMutableArray addObject:](v15, "addObject:", v18);

  return v15;
}

@end
