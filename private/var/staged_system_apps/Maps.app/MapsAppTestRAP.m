@implementation MapsAppTestRAP

- (BOOL)runTest
{
  void *v3;
  RAPProblemNotListedQuestion *v4;
  NSString *v5;
  NSString *rapQuestionCellTitle;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestResetForLaunchURL");

  -[MapsAppTestRAP overrideProblemSubmissionURL](self, "overrideProblemSubmissionURL");
  -[MapsAppTestRAP overridePrivacyConsent](self, "overridePrivacyConsent");
  -[MapsAppTestRAP overrideServerControlledUI](self, "overrideServerControlledUI");
  v4 = -[RAPProblemNotListedQuestion initWithReport:parentQuestion:]([RAPProblemNotListedQuestion alloc], "initWithReport:parentQuestion:", 0, 0);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[RAPProblemNotListedQuestion localizedTitle](v4, "localizedTitle"));
  rapQuestionCellTitle = self->_rapQuestionCellTitle;
  self->_rapQuestionCellTitle = v5;

  self->_rapSel = "handleRAPProblemNotListedControllerLoaded:";
  objc_storeStrong((id *)&self->_rapNotificationString, CFSTR("RAPReportComposerCommentViewControllerDidAppearNotification"));
  -[MapsAppTestRAP handleTappingFromSettingsButtonIntoSettingsTableViewController](self, "handleTappingFromSettingsButtonIntoSettingsTableViewController");

  return 1;
}

- (void)cleanup:(BOOL)a3
{
  _BOOL8 v3;
  NSString *rapQuestionCellTitle;
  NSString *rapNotificationString;
  NSString *rapCurrentSubTestName;
  objc_super v8;

  v3 = a3;
  -[MapsAppTestRAP restoreProblemSubmissionURL](self, "restoreProblemSubmissionURL");
  -[MapsAppTestRAP restorePrivacyConsent](self, "restorePrivacyConsent");
  -[MapsAppTestRAP restoreServerControlledUI](self, "restoreServerControlledUI");
  rapQuestionCellTitle = self->_rapQuestionCellTitle;
  self->_rapQuestionCellTitle = 0;

  self->_rapSel = 0;
  rapNotificationString = self->_rapNotificationString;
  self->_rapNotificationString = 0;

  rapCurrentSubTestName = self->_rapCurrentSubTestName;
  self->_rapCurrentSubTestName = 0;

  v8.receiver = self;
  v8.super_class = (Class)MapsAppTestRAP;
  -[MapsAppTest cleanup:](&v8, "cleanup:", v3);
}

- (void)overrideServerControlledUI
{
  self->_isServerControlledUIEnabled = GEOConfigGetBOOL(MapsConfig_RAPEnableServerControlledUI, off_1014B40F8);
  GEOConfigSetBOOL(MapsConfig_RAPEnableServerControlledUI, off_1014B40F8, 0);
}

- (void)restoreServerControlledUI
{
  GEOConfigSetBOOL(MapsConfig_RAPEnableServerControlledUI, off_1014B40F8, self->_isServerControlledUIEnabled);
}

- (void)overridePrivacyConsent
{
  void *v3;
  void *v4;

  if (!self->_hasOverriddenPrivacyConsent)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    self->_rapHasPrivacyConsent = objc_msgSend(v3, "BOOLForKey:", CFSTR("RAPHasReceived2015PrivacyConsent"));

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v4, "setBool:forKey:", 1, CFSTR("RAPHasReceived2015PrivacyConsent"));

    self->_hasOverriddenPrivacyConsent = 1;
  }
}

- (void)restorePrivacyConsent
{
  void *v3;

  if (self->_hasOverriddenPrivacyConsent)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v3, "setBool:forKey:", self->_rapHasPrivacyConsent, CFSTR("RAPHasReceived2015PrivacyConsent"));

    self->_hasOverriddenPrivacyConsent = 0;
  }
}

- (void)overrideProblemSubmissionURL
{
  uint64_t v3;
  NSString *v4;
  NSString *rapDefaultURL;
  uint64_t v6;
  uint64_t v7;

  if (!self->_rapDefaultURL)
  {
    v3 = GEOURLString(10, a2);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(v3);
    rapDefaultURL = self->_rapDefaultURL;
    self->_rapDefaultURL = v4;

    v6 = GEOURLConfigKey(10);
    GEOConfigSetString(v6, v7, CFSTR("https://jana-mpr-qa1.ls.apple.com/grp/rp"));
  }
}

- (void)restoreProblemSubmissionURL
{
  uint64_t v3;
  uint64_t v4;
  NSString *rapDefaultURL;

  if (self->_rapDefaultURL)
  {
    v3 = GEOURLConfigKey(10);
    GEOConfigSetString(v3, v4, self->_rapDefaultURL);
    rapDefaultURL = self->_rapDefaultURL;
    self->_rapDefaultURL = 0;

  }
}

- (void)handleTappingFromSettingsButtonIntoSettingsTableViewController
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAppTest testCoordinator](self, "testCoordinator"));
  objc_msgSend(v3, "pptTestOpenSettings");

  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "handleSettingsTableViewControllerLoaded:", CFSTR("SettingsTableViewControllerDidAppearNotification"), 0);

}

- (void)handleSettingsTableViewControllerLoaded:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("SettingsTableViewControllerDidAppearNotification"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "object"));
  v6 = objc_opt_class(SettingsTableViewController);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "object"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathForMenuItem:", 1));
    if (v9)
    {
      objc_msgSend(v4, "addObserver:selector:name:object:", self, "handleRAPControllerLoaded:", CFSTR("RAPReportComposerCategoryViewControllerDidAppearNotification"), 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView"));
      objc_msgSend(v10, "selectRowAtIndexPath:animated:scrollPosition:", v9, 1, 1);

      -[MapsAppTest startedTest](self, "startedTest");
      -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("displayRAPController"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableView"));
      objc_msgSend(v8, "tableView:didSelectRowAtIndexPath:", v11, v9);

    }
    else
    {
      -[MapsAppTest failedTest](self, "failedTest");
    }

  }
  else
  {
    -[MapsAppTest failedTest](self, "failedTest");
  }

}

- (void)handleRAPControllerLoaded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];

  v4 = a3;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v23, "removeObserver:name:object:", self, CFSTR("RAPReportComposerCategoryViewControllerDidAppearNotification"), 0);
  -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("displayRAPController"));
  v24 = v4;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "visibleCells"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v26;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "viewModel"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
      v14 = objc_msgSend(v13, "isEqualToString:", self->_rapQuestionCellTitle);

      if ((v14 & 1) != 0)
        break;
      if (v8 == (id)++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = v22;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tableView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "indexPathForCell:", v11));

    if (!v17)
      goto LABEL_14;
    v18 = v23;
    objc_msgSend(v23, "addObserver:selector:name:object:", self, self->_rapSel, self->_rapNotificationString, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tableView"));
    objc_msgSend(v19, "selectRowAtIndexPath:animated:scrollPosition:", v17, 1, 1);

    if (self->_rapCurrentSubTestName)
      -[MapsAppTest startedSubTest:](self, "startedSubTest:");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "tableView"));
    objc_msgSend(v22, "tableView:didSelectRowAtIndexPath:", v20, v17);

    v21 = v24;
  }
  else
  {
LABEL_9:

    v15 = v22;
LABEL_14:
    -[MapsAppTest failedTest](self, "failedTest");
    v18 = v23;
    v21 = v24;
  }

}

- (void)handleRAPProblemNotListedControllerLoaded:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, self->_rapNotificationString, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "object"));
  v6 = objc_opt_class(RAPReportComposerCommentViewController);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "object"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rapReportComposerCommentTableViewCell"));
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "beginEditingCommentIfPossible");
      objc_msgSend(v10, "setCommentText:", CFSTR("Test, Not a real report"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textDidChange"));

      if (v11)
      {
        v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textDidChange"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "commentText"));
        ((void (**)(_QWORD, void *))v12)[2](v12, v13);

      }
      objc_msgSend(v4, "addObserver:selector:name:object:", self, "handleRAPThankYouControllerLoaded:", CFSTR("RAPAcknowledgementViewControllerDidAppearNotification"), 0);
      -[MapsAppTest startedSubTest:](self, "startedSubTest:", CFSTR("displayRAPThankYouController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "navigationController"));
      if ((objc_opt_respondsToSelector(v14, "_sendWithFinalOutcome:acknowledgementOptions:") & 1) != 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[RAPAcknowledgementOptions defaultOptions](RAPAcknowledgementOptions, "defaultOptions"));
        objc_msgSend(v14, "_sendWithFinalOutcome:acknowledgementOptions:", 1, v15);

      }
    }
    else
    {
      -[MapsAppTest failedTest](self, "failedTest");
    }

  }
  else
  {
    -[MapsAppTest failedTest](self, "failedTest");
  }

}

- (void)handleRAPThankYouControllerLoaded:(id)a3
{
  -[MapsAppTest finishedSubTest:](self, "finishedSubTest:", CFSTR("displayRAPThankYouController"));
  -[MapsAppTest finishedTest](self, "finishedTest");
}

- (SEL)rapSel
{
  return self->_rapSel;
}

- (void)setRapSel:(SEL)a3
{
  self->_rapSel = a3;
}

- (NSString)rapQuestionCellTitle
{
  return self->_rapQuestionCellTitle;
}

- (void)setRapQuestionCellTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)rapNotificationString
{
  return self->_rapNotificationString;
}

- (void)setRapNotificationString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)rapCurrentSubTestName
{
  return self->_rapCurrentSubTestName;
}

- (void)setRapCurrentSubTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)rapHasPrivacyConsent
{
  return self->_rapHasPrivacyConsent;
}

- (void)setRapHasPrivacyConsent:(BOOL)a3
{
  self->_rapHasPrivacyConsent = a3;
}

- (NSString)rapDefaultURL
{
  return self->_rapDefaultURL;
}

- (void)setRapDefaultURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)hasOverriddenPrivacyConsent
{
  return self->_hasOverriddenPrivacyConsent;
}

- (void)setHasOverriddenPrivacyConsent:(BOOL)a3
{
  self->_hasOverriddenPrivacyConsent = a3;
}

- (BOOL)isServerControlledUIEnabled
{
  return self->_isServerControlledUIEnabled;
}

- (void)setIsServerControlledUIEnabled:(BOOL)a3
{
  self->_isServerControlledUIEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapDefaultURL, 0);
  objc_storeStrong((id *)&self->_rapCurrentSubTestName, 0);
  objc_storeStrong((id *)&self->_rapNotificationString, 0);
  objc_storeStrong((id *)&self->_rapQuestionCellTitle, 0);
}

@end
