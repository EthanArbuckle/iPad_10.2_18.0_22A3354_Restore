@implementation PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource

- (PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource)initWithReasons:(id)a3 currentlySelected:(id)a4
{
  id v6;
  id v7;
  PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *v8;
  PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource;
  v8 = -[PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource setupPromotedReasons:](v8, "setupPromotedReasons:", v6);
    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource setupOtherReasons:](v9, "setupOtherReasons:", v6);
    objc_storeStrong((id *)&v9->_currentlySelectedReasons, a4);
  }

  return v9;
}

- (void)setupPromotedReasons:(id)a3
{
  NSArray *v4;
  NSArray *promotedReasons;
  id v6;

  v6 = a3;
  if ((unint64_t)objc_msgSend(v6, "count") < 5)
  {
    promotedReasons = self->_promotedReasons;
    self->_promotedReasons = (NSArray *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v6, "subarrayWithRange:", 0, 4);
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    promotedReasons = self->_promotedReasons;
    self->_promotedReasons = v4;
  }

}

- (void)setupOtherReasons:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  NSArray *v9;
  NSArray *otherReasons;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithArray:", v5);

  objc_msgSend(v6, "removeObject:", CFSTR("None of These Options"));
  v7 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "sortedArrayUsingSelector:", sel_compare_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSArray *)objc_msgSend(v7, "initWithArray:", v8);

  -[NSArray addObject:](v9, "addObject:", CFSTR("None of These Options"));
  otherReasons = self->_otherReasons;
  self->_otherReasons = v9;

}

- (id)selectedReasons
{
  void *v2;
  void *v3;

  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource currentlySelectedReasons](self, "currentlySelectedReasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)selectedReasonsCount
{
  void *v2;
  int64_t v3;

  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource currentlySelectedReasons](self, "currentlySelectedReasons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)canSelectReason:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  int v7;

  v4 = objc_msgSend(a3, "isEqualToString:", CFSTR("None of These Options"));
  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource currentlySelectedReasons](self, "currentlySelectedReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    LOBYTE(v7) = objc_msgSend(v5, "count") == 0;
  else
    v7 = objc_msgSend(v5, "containsObject:", CFSTR("None of These Options")) ^ 1;

  return v7;
}

- (void)select:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("None of These Options"));
  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource currentlySelectedReasons](self, "currentlySelectedReasons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "removeAllObjects");
  else
    objc_msgSend(v6, "removeObject:", CFSTR("None of These Options"));

  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource currentlySelectedReasons](self, "currentlySelectedReasons");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v4);

}

- (void)deselect:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource currentlySelectedReasons](self, "currentlySelectedReasons");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  NSObject *v10;
  uint8_t v12[16];

  v6 = a3;
  if (a4 == 1)
  {
    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource otherReasons](self, "otherReasons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!a4)
  {
    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource promotedReasons](self, "promotedReasons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = v7;
    v9 = objc_msgSend(v7, "count");

    goto LABEL_9;
  }
  PXAssertGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v12 = 0;
    _os_log_error_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "unsupported configuration", v12, 2u);
  }

  v9 = 0;
LABEL_9:

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  uint8_t v10[16];

  v5 = a3;
  if (a4 == 1)
  {
    v6 = CFSTR("PXInternalPhotosChallengeAdditionalReasonExhaustiveMomentLabelingAllOptions");
    goto LABEL_5;
  }
  if (!a4)
  {
    v6 = CFSTR("PXInternalPhotosChallengeAdditionalReasonExhaustiveMomentLabelingTopHits");
LABEL_5:
    PXLocalizedStringFromTable(v6, CFSTR("PhotosUICore"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  PXAssertGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v10 = 0;
    _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "unsupported configuration", v10, 2u);
  }

  v7 = &stru_1E5149688;
LABEL_9:

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint8_t v22[16];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0DC3D50]);
  if (!objc_msgSend(v7, "section"))
  {
    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource promotedReasons](self, "promotedReasons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v10 = v9;
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    if (objc_msgSend(v11, "isEqualToString:", CFSTR("None of These Options")))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextColor:", v13);

    }
    objc_msgSend(v6, "indexPathsForSelectedRows");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "containsObject:", v7))
    {

    }
    else
    {
      -[PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource currentlySelectedReasons](self, "currentlySelectedReasons");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "containsObject:", v11);

      if (!v17)
      {
        v18 = 0;
        goto LABEL_15;
      }
    }
    objc_msgSend(v6, "selectRowAtIndexPath:animated:scrollPosition:", v7, 1, 0);
    v18 = 3;
LABEL_15:
    objc_msgSend(v8, "setAccessoryType:", v18);
    v20 = v8;

    goto LABEL_16;
  }
  if (objc_msgSend(v7, "section") == 1)
  {
    -[PXSurveyQuestionsMultipleAnswerSelectionTableViewDataSource otherReasons](self, "otherReasons");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  PXAssertGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v22 = 0;
    _os_log_error_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "unsupported configuration", v22, 2u);
  }

  v20 = objc_alloc_init(MEMORY[0x1E0DC3D50]);
LABEL_16:

  return v20;
}

- (NSArray)promotedReasons
{
  return self->_promotedReasons;
}

- (NSArray)otherReasons
{
  return self->_otherReasons;
}

- (NSMutableSet)currentlySelectedReasons
{
  return self->_currentlySelectedReasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlySelectedReasons, 0);
  objc_storeStrong((id *)&self->_otherReasons, 0);
  objc_storeStrong((id *)&self->_promotedReasons, 0);
}

@end
