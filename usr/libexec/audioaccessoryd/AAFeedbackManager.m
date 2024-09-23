@implementation AAFeedbackManager

- (void)displayFeedbackCampaign:(int)a3 promptStyle:(int64_t)a4 completion:(id)a5
{
  -[AAFeedbackManager displayFeedbackCampaign:promptStyle:localizedPrompt:completion:](self, "displayFeedbackCampaign:promptStyle:localizedPrompt:completion:", *(_QWORD *)&a3, a4, 0, a5);
}

- (void)displayFeedbackCampaign:(int)a3 promptStyle:(int64_t)a4 localizedPrompt:(id)a5 completion:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  AAFeedbackManager *v18;
  id v19;
  int64_t v20;
  int v21;

  v8 = *(_QWORD *)&a3;
  v10 = a5;
  v11 = a6;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000150A8;
  v15[3] = &unk_1001E28F8;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[AAFeedbackManager _feedbackCampainIdentifierForCampain:](self, "_feedbackCampainIdentifierForCampain:", v8));
  v17 = v10;
  v18 = self;
  v19 = v11;
  v21 = v8;
  v20 = a4;
  v12 = v10;
  v13 = v16;
  v14 = v11;
  +[FBKSFeedbackCount fetchCountsForFormWithIdentifier:completion:](FBKSFeedbackCount, "fetchCountsForFormWithIdentifier:completion:", v13, v15);

}

- (id)_feedbackCampainIdentifierForCampain:(int)a3
{
  if (a3 == 1)
    return CFSTR(":framework-conversation-awareness");
  else
    return 0;
}

- (id)_feedbackCampainLocalizedTitleForCampain:(int)a3
{
  void *v3;
  void *v4;

  if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/CoreServices/BluetoothUIService.app/")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("FEED_BACK_NOTIFICATION_TITLE_STRING"), &stru_1001ED4C0, CFSTR("Localizable")));

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
