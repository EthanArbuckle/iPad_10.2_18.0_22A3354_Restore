@implementation MTWelcomeUtil

+ (BOOL)presentWelcomeIfNeededFromViewController:(id)a3 metricsSender:(id)a4 acknowledgementCompletionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char isKindOfClass;
  MTWelcomeViewController *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(a1, "shouldShowWelcome"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
    v12 = objc_opt_class(UINavigationController);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
    else
      v13 = 0;

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "viewControllers"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "firstObject"));
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "presentedViewController"));
    v19 = v18;

    isKindOfClass = objc_opt_isKindOfClass(v19, objc_msgSend(a1, "welcomeViewControllerClass"));
    if ((isKindOfClass & 1) == 0)
    {
      v21 = -[MTWelcomeViewController initWithMetricsSender:]([MTWelcomeViewController alloc], "initWithMetricsSender:", v9);
      -[MTWelcomeViewController setModalPresentationStyle:](v21, "setModalPresentationStyle:", 2);
      -[MTWelcomeViewController setTransitioningDelegate:](v21, "setTransitioningDelegate:", v21);
      objc_initWeak(&location, v21);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10013184C;
      v23[3] = &unk_1004AC148;
      v24 = v10;
      objc_copyWeak(&v25, &location);
      -[MTWelcomeViewController addAcknowledgementCompletionBlock:](v21, "addAcknowledgementCompletionBlock:", v23);
      objc_msgSend(v8, "presentViewController:animated:completion:", v21, 1, 0);
      objc_destroyWeak(&v25);

      objc_destroyWeak(&location);
    }
    v14 = isKindOfClass ^ 1;

  }
  else
  {
    v14 = 0;
  }

  return v14 & 1;
}

+ (BOOL)shouldShowWelcomeIgnoringNewFeatures:(BOOL)a3
{
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  uint64_t v21;
  const char *v22;
  NSObject *v23;
  uint32_t v24;
  BOOL v25;
  id v26;
  uint64_t v27;
  _BOOL8 v28;
  _BOOL4 v29;
  uint64_t v30;
  _BOOL4 v31;
  int v33;
  const __CFString *v34;
  __int16 v35;
  id v36;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("SuppressWelcomeScreen"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("SuppressWelcomeScreen"));

  if ((v6 & 1) != 0 || v8)
  {
    v21 = _MTLogCategoryPrivacy(v9);
    v17 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 138412290;
      v34 = CFSTR("SuppressWelcomeScreen");
      v22 = "shouldShowWelcome = NO. Reason: %@ = YES";
      v23 = v17;
      v24 = 12;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v33, v24);
    }
  }
  else
  {
    v10 = qword_100551FA8;
    if (objc_msgSend(a1, "shouldSuppressTranscriptsWhatsNewSheet"))
      v11 = 5;
    else
      v11 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSharedUserDefaults](NSUserDefaults, "_applePodcastsFoundationSharedUserDefaults"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", CFSTR("MTWelcomeVersion")));
    v14 = objc_msgSend(v13, "integerValue");

    if (!a3 && (uint64_t)v14 < v11)
    {
      v16 = _MTLogCategoryPrivacy(v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v33 = 138412546;
        v34 = CFSTR("MTWelcomeVersion");
        v35 = 2048;
        v36 = v14;
        v18 = "shouldShowWelcome = YES. Reason: %@ = %ld";
        v19 = v17;
        v20 = 22;
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v33, v20);
      }
LABEL_22:
      v25 = 1;
      goto LABEL_23;
    }
    v26 = +[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:](AMSAcknowledgePrivacyTask, "acknowledgementNeededForPrivacyIdentifier:", kMTPodcastsPrivacyIdentifier);
    if ((_DWORD)v26)
    {
      v27 = _MTLogCategoryPrivacy(v26);
      v17 = objc_claimAutoreleasedReturnValue(v27);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        goto LABEL_22;
      v33 = 138412290;
      v34 = CFSTR("YES");
      v18 = "shouldShowWelcome = YES. Reason: +[AMSAcknowledgePrivacyTask acknowledgementNeededForPrivacyIdentifier:kMTPo"
            "dcastsPrivacyIdentifier] = %@";
LABEL_20:
      v19 = v17;
      v20 = 12;
      goto LABEL_21;
    }
    v28 = +[MTPrivacyUtil shouldShowPodcastsTermsScreen](MTPrivacyUtil, "shouldShowPodcastsTermsScreen");
    v29 = v28;
    v30 = _MTLogCategoryPrivacy(v28);
    v17 = objc_claimAutoreleasedReturnValue(v30);
    v31 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v29)
    {
      if (!v31)
        goto LABEL_22;
      v33 = 138412290;
      v34 = CFSTR("YES");
      v18 = "shouldShowWelcome = YES. Reason: +[MTPrivacyUtil shouldShowPodcastsTermsScreen] = %@";
      goto LABEL_20;
    }
    if (v31)
    {
      LOWORD(v33) = 0;
      v22 = "shouldShowWelcome = NO. Reason: Fell through all the checks.";
      v23 = v17;
      v24 = 2;
      goto LABEL_12;
    }
  }
  v25 = 0;
LABEL_23:

  return v25;
}

+ (BOOL)shouldShowWelcome
{
  return _objc_msgSend(a1, "shouldShowWelcomeIgnoringNewFeatures:", 0);
}

+ (BOOL)carPlayShouldShowWelcome
{
  return _objc_msgSend(a1, "shouldShowWelcomeIgnoringNewFeatures:", 1);
}

+ (void)markWelcomeAsShown
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  v3 = objc_alloc((Class)AMSAcknowledgePrivacyTask);
  v4 = objc_msgSend(v3, "initWithPrivacyIdentifier:", kMTPodcastsPrivacyIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "acknowledgePrivacy"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100131464;
  v6[3] = &unk_1004AC120;
  v6[4] = a1;
  objc_msgSend(v5, "addFinishBlock:", v6);

}

+ (BOOL)shouldSuppressTranscriptsWhatsNewSheet
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t domain_answer;
  int v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];
  _DWORD v15[2];

  v2 = +[PFClientUtil isRunningOnVisionOS](PFClientUtil, "isRunningOnVisionOS");
  if ((v2 & 1) != 0
    || (v2 = +[PFClientUtil isRunningOnTV](PFClientUtil, "isRunningOnTV"), (_DWORD)v2))
  {
    v3 = _MTLogCategoryPrivacy(v2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14[0]) = 0;
      v5 = "Suppressing what's new sheet: tvOS/visionOS doesn't have transcripts.";
      v6 = (uint8_t *)v14;
LABEL_5:
      v7 = v4;
      v8 = 2;
LABEL_6:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v5, v6, v8);
    }
  }
  else
  {
    v14[0] = 0;
    domain_answer = os_eligibility_get_domain_answer(121, v14, 0, 0, 0);
    if ((_DWORD)domain_answer)
    {
      v11 = domain_answer;
      v12 = _MTLogCategoryPrivacy(domain_answer);
      v4 = objc_claimAutoreleasedReturnValue(v12);
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_7;
      v15[0] = 67109120;
      v15[1] = v11;
      v5 = "OSEligibility error code %d encountered while getting OS_ELIGIBILITY_DOMAIN_PODCASTS_TRANSCRIPTS";
      v6 = (uint8_t *)v15;
      v7 = v4;
      v8 = 8;
      goto LABEL_6;
    }
    if (v14[0] != 2)
      return 0;
    v13 = _MTLogCategoryPrivacy(domain_answer);
    v4 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15[0]) = 0;
      v5 = "OSEligibility encountered OS_ELIGIBILITY_ANSWER_NOT_ELIGIBLE";
      v6 = (uint8_t *)v15;
      goto LABEL_5;
    }
  }
LABEL_7:

  return 1;
}

+ (Class)welcomeViewControllerClass
{
  return (Class)objc_opt_class(MTWelcomeViewController, a2);
}

@end
