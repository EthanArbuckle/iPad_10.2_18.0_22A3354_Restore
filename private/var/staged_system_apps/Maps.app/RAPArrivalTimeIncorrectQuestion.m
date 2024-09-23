@implementation RAPArrivalTimeIncorrectQuestion

- (NSString)localizedTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Estimated Time of Arrival [Report an Issue category]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (RAPArrivalTimeIncorrectQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  RAPArrivalTimeIncorrectQuestion *v12;
  objc_super v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Information [Report a Problem]"), CFSTR("localized string not found"), 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Tell us more about how the arrival time was incorrect [Report an Issue]"), CFSTR("localized string not found"), 0));
  v14.receiver = self;
  v14.super_class = (Class)RAPArrivalTimeIncorrectQuestion;
  v12 = -[RAPCommentQuestion initWithReport:parentQuestion:title:placeholderText:emphasis:](&v14, "initWithReport:parentQuestion:title:placeholderText:emphasis:", v7, v6, v9, v11, 3);

  return v12;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4;
  void *v5;
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
  objc_super v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonContext"));

  if (!v5)
  {
    v6 = objc_alloc_init((Class)GEORPFeedbackCommonContext);
    objc_msgSend(v4, "setCommonContext:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonContext"));
  objc_msgSend(v7, "addUserPath:", 45);

  objc_msgSend(v4, "setType:", 8);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));

  if (!v8)
  {
    v9 = objc_alloc_init((Class)GEORPFeedbackDetails);
    objc_msgSend(v4, "setDetails:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "directionsFeedback"));

  if (!v11)
  {
    v12 = objc_alloc_init((Class)GEORPDirectionsFeedback);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
    objc_msgSend(v13, "setDirectionsFeedback:", v12);

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "details"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "directionsFeedback"));
  objc_msgSend(v15, "setCorrectionType:", 5);

  v16.receiver = self;
  v16.super_class = (Class)RAPArrivalTimeIncorrectQuestion;
  -[RAPCommentQuestion _fillSubmissionParameters:](&v16, "_fillSubmissionParameters:", v4);

}

- (int)analyticTarget
{
  return 1104;
}

- (int)userAction
{
  return 10104;
}

- (int64_t)questionCategory
{
  return 3;
}

@end
