@implementation RAPStationClosureQuestion

- (id)localizedTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Station Closed [Report an Issue category]"), CFSTR("localized string not found"), 0));

  return v3;
}

- (int)analyticTarget
{
  return 1111;
}

- (id)selectableIssues
{
  NSArray *selectableIssues;
  RAPPlaceClosureIssue *v4;
  void *v5;
  void *v6;
  id v7;
  RAPPlaceClosureIssue *v8;
  void *v9;
  void *v10;
  id v11;
  NSArray *v12;
  NSArray *v13;
  _QWORD v15[2];

  selectableIssues = self->super._selectableIssues;
  if (!selectableIssues)
  {
    v4 = [RAPPlaceClosureIssue alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Closed Permanently [Report an Issue]"), CFSTR("localized string not found"), 0));
    v7 = -[RAPPlaceClosureIssue _initWithKind:localizedName:](v4, "_initWithKind:localizedName:", 0, v6);
    v15[0] = v7;
    v8 = [RAPPlaceClosureIssue alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Closed Temporarily [Report an Issue]"), CFSTR("localized string not found"), 0));
    v11 = -[RAPPlaceClosureIssue _initWithKind:localizedName:](v8, "_initWithKind:localizedName:", 1, v10);
    v15[1] = v11;
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
    v13 = self->super._selectableIssues;
    self->super._selectableIssues = v12;

    selectableIssues = self->super._selectableIssues;
  }
  return selectableIssues;
}

- (id)commentQuestion
{
  RAPCommentQuestion *commentQuestion;
  RAPCommentQuestion *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RAPCommentQuestion *v9;
  RAPCommentQuestion *v10;

  commentQuestion = self->super._commentQuestion;
  if (!commentQuestion)
  {
    v4 = [RAPCommentQuestion alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCommentQuestion _localizedInformationTitle](RAPCommentQuestion, "_localizedInformationTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Tell us more about this station closure"), CFSTR("localized string not found"), 0));
    v9 = -[RAPCommentQuestion initWithReport:parentQuestion:title:placeholderText:emphasis:](v4, "initWithReport:parentQuestion:title:placeholderText:emphasis:", v5, self, v6, v8, 2);
    v10 = self->super._commentQuestion;
    self->super._commentQuestion = v9;

    commentQuestion = self->super._commentQuestion;
  }
  return commentQuestion;
}

- (BOOL)_isRecursivelyComplete
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RAPStationClosureQuestion;
  v3 = -[RAPQuestion _isRecursivelyComplete](&v5, "_isRecursivelyComplete");
  if (v3)
    LOBYTE(v3) = -[RAPQuestion _isRecursivelyComplete](self->super._commentQuestion, "_isRecursivelyComplete");
  return v3;
}

- (void)_fillSubmissionParameters:(id)a3
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[RAPPlaceClosureQuestion _setupSubmissionParameters:](self, "_setupSubmissionParameters:", v20);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "details"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitPoiFeedback"));

  if (!v5)
  {
    v6 = (void *)objc_opt_new(GEORPTransitPoiFeedback);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "details"));
    objc_msgSend(v7, "setTransitPoiFeedback:", v6);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "details"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "transitPoiFeedback"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "corrections"));

  if (!v10)
  {
    v11 = (void *)objc_opt_new(GEORPTransitPoiCorrections);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "details"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transitPoiFeedback"));
    objc_msgSend(v13, "setCorrections:", v11);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "details"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "transitPoiFeedback"));
  objc_msgSend(v15, "setCorrectionType:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "details"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "transitPoiFeedback"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "corrections"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceClosureQuestion _geoBusinessHours](self, "_geoBusinessHours"));
  objc_msgSend(v18, "addBusinessHours:", v19);

}

@end
