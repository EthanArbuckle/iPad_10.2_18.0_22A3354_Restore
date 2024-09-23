@implementation RAPProblemNotListedQuestion

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Other Issue description [Report an Issue category]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (UIImage)image
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  v10[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemLightGrayColor](UIColor, "systemLightGrayColor"));
  v10[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPaletteColors:](UIImageSymbolConfiguration, "configurationWithPaletteColors:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("ellipsis.circle.fill"), v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 3, 26.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageByApplyingSymbolConfiguration:", v7));

  return (UIImage *)v8;
}

- (int64_t)questionCategory
{
  return 1;
}

- (int)analyticTarget
{
  return 1135;
}

- (RAPProblemNotListedQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 localizedTitle:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  RAPProblemNotListedQuestion *v16;
  objc_super v18;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Information [Report a Problem]"), CFSTR("localized string not found"), 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Describe the issue [Report an Issue]"), CFSTR("localized string not found"), 0));
  v18.receiver = self;
  v18.super_class = (Class)RAPProblemNotListedQuestion;
  v16 = -[RAPCommentQuestion initWithReport:parentQuestion:title:placeholderText:emphasis:](&v18, "initWithReport:parentQuestion:title:placeholderText:emphasis:", v11, v10, v13, v15, 2);

  if (v16)
    objc_storeStrong((id *)&v16->_localizedTitle, a5);

  return v16;
}

- (RAPProblemNotListedQuestion)initWithReport:(id)a3 parentQuestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  RAPProblemNotListedQuestion *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Other Issue [Report an Issue category]"), CFSTR("localized string not found"), 0));
  v10 = -[RAPProblemNotListedQuestion initWithReport:parentQuestion:localizedTitle:](self, "initWithReport:parentQuestion:localizedTitle:", v7, v6, v9);

  return v10;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  objc_msgSend(v4, "setFeedbackType");
  v5.receiver = self;
  v5.super_class = (Class)RAPProblemNotListedQuestion;
  -[RAPCommentQuestion _fillSubmissionParameters:](&v5, "_fillSubmissionParameters:", v4);

}

- (int)userAction
{
  return 10124;
}

- (NSString)localizedServerControlledDescription
{
  return self->_localizedServerControlledDescription;
}

- (void)setLocalizedServerControlledDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedServerControlledDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end
