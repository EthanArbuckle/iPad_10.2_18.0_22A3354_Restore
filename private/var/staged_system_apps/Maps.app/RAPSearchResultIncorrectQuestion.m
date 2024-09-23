@implementation RAPSearchResultIncorrectQuestion

+ (id)localizedTitleForResultCount:(unint64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = v4;
  if (a3 == 1)
    v6 = CFSTR("Unexpected Result [Report a Problem category]");
  else
    v6 = CFSTR("Unexpected Results [Report a Problem category]");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, CFSTR("localized string not found"), 0));

  return v7;
}

- (RAPSearchResultIncorrectQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 searchResultsCount:(unint64_t)a5
{
  RAPSearchResultIncorrectQuestion *v6;
  RAPSearchResultIncorrectQuestion *v7;
  id v8;
  uint64_t v9;
  NSString *localizedTitle;
  void *v11;
  uint64_t v12;
  NSString *localizedPhotosPickerExplanation;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RAPSearchResultIncorrectQuestion;
  v6 = -[RAPCommentQuestion initWithReport:parentQuestion:](&v15, "initWithReport:parentQuestion:", a3, a4);
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend((id)objc_opt_class(v6), "localizedTitleForResultCount:", a5);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    localizedTitle = v7->_localizedTitle;
    v7->_localizedTitle = (NSString *)v9;

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Submit a Photo [Report a Search Issue photos]"), CFSTR("localized string not found"), 0));
    localizedPhotosPickerExplanation = v7->_localizedPhotosPickerExplanation;
    v7->_localizedPhotosPickerExplanation = (NSString *)v12;

  }
  return v7;
}

- (int64_t)questionCategory
{
  return 10;
}

- (int)analyticTarget
{
  return 1129;
}

- (int)userAction
{
  return 10120;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (id)localizedPhotosPickerExplanation
{
  return self->_localizedPhotosPickerExplanation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedPhotosPickerExplanation, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
