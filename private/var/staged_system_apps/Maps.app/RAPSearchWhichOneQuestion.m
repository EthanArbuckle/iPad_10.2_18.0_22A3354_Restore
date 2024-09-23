@implementation RAPSearchWhichOneQuestion

- (NSString)localizedTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Search [Report a Problem category]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (NSString)localizedDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Search issue description [Report an Issue category]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (UIImage)image
{
  return +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("search"));
}

- (int64_t)questionCategory
{
  return 12;
}

- (int)analyticTarget
{
  return 1128;
}

- (NSString)localizedSelectSearchRequestPrompt
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Result [Report a Problem prompt]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (NSArray)selectableSearches
{
  NSArray *selectableSearches;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *v8;
  NSArray *v9;

  selectableSearches = self->_selectableSearches;
  if (!selectableSearches)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_context"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchesHistory"));

    if ((unint64_t)objc_msgSend(v6, "count") >= 6)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", 0, 5));

      v6 = (void *)v7;
    }
    v8 = (NSArray *)objc_msgSend(v6, "copy");
    v9 = self->_selectableSearches;
    self->_selectableSearches = v8;

    selectableSearches = self->_selectableSearches;
  }
  return selectableSearches;
}

- (void)setSelectedValue:(id)a3
{
  RAPUserSearch *v5;
  RAPUserSearch *v6;

  v5 = (RAPUserSearch *)a3;
  if (self->_selectedValue != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectedValue, a3);
    -[RAPQuestion _didChange](self, "_didChange");
    v5 = v6;
  }

}

- (RAPMenu)followUpQuestion
{
  RAPMenu *followUpQuestion;
  RAPSearchResultCategoryQuestion *v4;
  void *v5;
  RAPMenu *v6;
  RAPMenu *v7;

  followUpQuestion = self->_followUpQuestion;
  if (!followUpQuestion)
  {
    v4 = [RAPSearchResultCategoryQuestion alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
    v6 = -[RAPSearchResultCategoryQuestion initWithReport:parentQuestion:search:](v4, "initWithReport:parentQuestion:search:", v5, self, self->_selectedValue);
    v7 = self->_followUpQuestion;
    self->_followUpQuestion = v6;

    followUpQuestion = self->_followUpQuestion;
  }
  return followUpQuestion;
}

- (BOOL)isComplete
{
  return self->_selectedValue != 0;
}

- (BOOL)_isRecursivelyComplete
{
  unsigned int v3;
  objc_super v5;

  v3 = -[RAPMenu _isRecursivelyComplete](self->_followUpQuestion, "_isRecursivelyComplete");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)RAPSearchWhichOneQuestion;
    LOBYTE(v3) = -[RAPQuestion _isRecursivelyComplete](&v5, "_isRecursivelyComplete");
  }
  return v3;
}

- (id)_alternateAuxiliaryControlsRecording
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchWhichOneQuestion selectedValue](self, "selectedValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "auxiliaryControlsRecording"));

  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  unsigned int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "commonContext"));

  if (!v4)
  {
    v5 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    objc_msgSend(v39, "setCommonContext:", v5);

  }
  if (-[RAPSearchWhichOneQuestion _hasSearchRelatedFollowupQuestion](self, "_hasSearchRelatedFollowupQuestion"))
  {
    v6 = objc_alloc_init((Class)GEORPCorrectedSearch);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPSearchWhichOneQuestion selectedValue](self, "selectedValue"));
    objc_msgSend(v7, "applyToCorrectedSearch:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "details"));

    if (!v8)
    {
      v9 = objc_alloc_init((Class)GEORPFeedbackDetails);
      objc_msgSend(v39, "setDetails:", v9);

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "details"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "searchFeedback"));

    if (!v11)
    {
      v12 = objc_alloc_init((Class)GEORPSearchFeedback);
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "details"));
      objc_msgSend(v13, "setSearchFeedback:", v12);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "details"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "searchFeedback"));
    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "context"));

    if (!v16)
    {
      v16 = objc_alloc_init((Class)GEORPSearchFeedbackContext);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "details"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "searchFeedback"));
      objc_msgSend(v18, "setContext:", v16);

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "requestContext"));

    if (!v19)
    {
      v20 = objc_alloc_init((Class)GEORPPlaceRequestResponse);
      objc_msgSend(v16, "setRequestContext:", v20);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeRequest"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "requestContext"));
    objc_msgSend(v22, "setPlaceRequest:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeResponse"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "requestContext"));
    objc_msgSend(v24, "setPlaceResponse:", v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenu selectedMenuItem](self->_followUpQuestion, "selectedMenuItem"));
    v26 = objc_msgSend(v25, "questionCategory");

    if (v26 == (id)1)
      v27 = 7;
    else
      v27 = 0;
    if (v26 == (id)10)
      v28 = 6;
    else
      v28 = v27;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "details"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "searchFeedback"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "corrections"));

    if (!v31)
    {
      v32 = objc_alloc_init((Class)GEORPSearchFeedbackCorrections);
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "details"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "searchFeedback"));
      objc_msgSend(v34, "setCorrections:", v32);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "details"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "searchFeedback"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "corrections"));
    objc_msgSend(v37, "setCorrectionType:", v28);

  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "commonContext"));
  objc_msgSend(v38, "addUserPath:", 11);

  -[RAPMenu _fillSubmissionParameters:](self->_followUpQuestion, "_fillSubmissionParameters:", v39);
}

- (BOOL)_hasSearchRelatedFollowupQuestion
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPMenu selectedMenuItem](self->_followUpQuestion, "selectedMenuItem"));
  v3 = objc_msgSend(v2, "questionCategory");

  return v3 == (id)10 || v3 == (id)1;
}

- (int)userAction
{
  return 10120;
}

- (NSString)localizedServerControlledDescription
{
  return self->_localizedServerControlledDescription;
}

- (void)setLocalizedServerControlledDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (RAPUserSearch)selectedValue
{
  return self->_selectedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedValue, 0);
  objc_storeStrong((id *)&self->_selectableSearches, 0);
  objc_storeStrong((id *)&self->_localizedServerControlledDescription, 0);
  objc_storeStrong((id *)&self->_followUpQuestion, 0);
}

@end
