@implementation RAPPlaceClosureQuestion

- (NSString)localizedTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Place Closed [Report an Issue category]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (NSString)localizedSelectableIssueLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Issue [Report an Issue]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (int)analyticTarget
{
  return 1143;
}

- (int64_t)questionCategory
{
  return 9;
}

- (NSArray)selectableIssues
{
  NSArray *selectableIssues;
  RAPPlaceClosureIssue *v4;
  void *v5;
  id v6;
  RAPPlaceClosureIssue *v7;
  void *v8;
  void *v9;
  id v10;
  RAPPlaceClosureIssue *v11;
  void *v12;
  void *v13;
  id v14;
  NSArray *v15;
  NSArray *v16;
  void *v18;
  _QWORD v19[3];

  selectableIssues = self->_selectableIssues;
  if (!selectableIssues)
  {
    v4 = [RAPPlaceClosureIssue alloc];
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Closed Permanently [Report an Issue]"), CFSTR("localized string not found"), 0));
    v6 = -[RAPPlaceClosureIssue _initWithKind:localizedName:](v4, "_initWithKind:localizedName:", 0, v5);
    v19[0] = v6;
    v7 = [RAPPlaceClosureIssue alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Closed Temporarily [Report an Issue]"), CFSTR("localized string not found"), 0));
    v10 = -[RAPPlaceClosureIssue _initWithKind:localizedName:](v7, "_initWithKind:localizedName:", 1, v9);
    v19[1] = v10;
    v11 = [RAPPlaceClosureIssue alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Hours Changed [Report an Issue]"), CFSTR("localized string not found"), 0));
    v14 = -[RAPPlaceClosureIssue _initWithKind:localizedName:](v11, "_initWithKind:localizedName:", 2, v13);
    v19[2] = v14;
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3));
    v16 = self->_selectableIssues;
    self->_selectableIssues = v15;

    selectableIssues = self->_selectableIssues;
  }
  return selectableIssues;
}

- (void)setSelectedIssue:(id)a3
{
  id v5;
  RAPCommentQuestion *commentQuestion;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  RAPPlaceClosureIssue *v11;

  v11 = (RAPPlaceClosureIssue *)a3;
  if (self->_selectedIssue != v11)
  {
    objc_storeStrong((id *)&self->_selectedIssue, a3);
    v5 = -[RAPPlaceClosureIssue kind](v11, "kind");
    commentQuestion = self->_commentQuestion;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = v7;
    if (v5 == (id)2)
      v9 = CFSTR("Tell us more about the new hours");
    else
      v9 = CFSTR("Tell us more about this closure");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("localized string not found"), 0));
    -[RAPCommentQuestion _setPlaceholderText:](commentQuestion, "_setPlaceholderText:", v10);

    -[RAPQuestion _didChange](self, "_didChange");
    -[RAPPlaceClosureQuestion _captureAnalytics](self, "_captureAnalytics");
  }

}

- (void)_captureAnalytics
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v3, "captureUserAction:onTarget:eventValue:", -[RAPPlaceClosureQuestion closureTypeAction](self, "closureTypeAction"), -[RAPPlaceClosureQuestion analyticTarget](self, "analyticTarget"), 0);

}

- (int)closureTypeAction
{
  void *v2;
  id v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceClosureQuestion selectedIssue](self, "selectedIssue"));
  v3 = objc_msgSend(v2, "kind");

  if (v3 == (id)1)
    v4 = 10135;
  else
    v4 = 10134;
  if (v3 == (id)2)
    return 10136;
  else
    return v4;
}

- (RAPCommentQuestion)commentQuestion
{
  RAPCommentQuestion *commentQuestion;
  RAPCommentQuestion *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RAPCommentQuestion *v9;
  RAPCommentQuestion *v10;

  commentQuestion = self->_commentQuestion;
  if (!commentQuestion)
  {
    v4 = [RAPCommentQuestion alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCommentQuestion _localizedOptionalInformationTitle](RAPCommentQuestion, "_localizedOptionalInformationTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Tell us more about this closure"), CFSTR("localized string not found"), 0));
    v9 = -[RAPCommentQuestion initWithReport:parentQuestion:title:placeholderText:emphasis:](v4, "initWithReport:parentQuestion:title:placeholderText:emphasis:", v5, self, v6, v8, 5);
    v10 = self->_commentQuestion;
    self->_commentQuestion = v9;

    commentQuestion = self->_commentQuestion;
  }
  return commentQuestion;
}

- (BOOL)isComplete
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceClosureQuestion selectedIssue](self, "selectedIssue"));
  v3 = v2 != 0;

  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[RAPPlaceClosureQuestion _setupSubmissionParameters:](self, "_setupSubmissionParameters:", v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "details"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "poiFeedback"));

  if (!v5)
  {
    v5 = objc_alloc_init((Class)GEORPPoiFeedback);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "details"));
    objc_msgSend(v6, "setPoiFeedback:", v5);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "corrections"));

  if (!v7)
  {
    v8 = (void *)objc_opt_new(GEORPPoiCorrections);
    objc_msgSend(v5, "setCorrections:", v8);

  }
  objc_msgSend(v5, "setCorrectionType:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "corrections"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceClosureQuestion _geoBusinessHours](self, "_geoBusinessHours"));
  objc_msgSend(v9, "addBusinessHours:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceClosureQuestion commentQuestion](self, "commentQuestion"));
  objc_msgSend(v11, "_fillSubmissionParameters:", v12);

}

- (void)_setupSubmissionParameters:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "commonContext"));

  if (!v4)
  {
    v5 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    objc_msgSend(v10, "setCommonContext:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "commonContext"));
  objc_msgSend(v6, "addUserPath:", 9);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "details"));
  if (!v7)
  {
    v8 = (void *)objc_opt_new(GEORPFeedbackDetails);
    objc_msgSend(v10, "setDetails:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceClosureQuestion commentQuestion](self, "commentQuestion"));
  objc_msgSend(v9, "_fillSubmissionParameters:", v10);

}

- (id)_geoBusinessHours
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc_init((Class)GEORPFeedbackBusinessHours);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceClosureQuestion selectedIssue](self, "selectedIssue"));
  v5 = objc_msgSend(v4, "kind");

  if ((unint64_t)v5 <= 2)
    objc_msgSend(v3, "setHoursType:", (4 - (_DWORD)v5));
  return v3;
}

- (int)userAction
{
  return 10133;
}

- (RAPPlaceClosureIssue)selectedIssue
{
  return self->_selectedIssue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIssue, 0);
  objc_storeStrong((id *)&self->_selectableIssues, 0);
  objc_storeStrong((id *)&self->_commentQuestion, 0);
}

@end
