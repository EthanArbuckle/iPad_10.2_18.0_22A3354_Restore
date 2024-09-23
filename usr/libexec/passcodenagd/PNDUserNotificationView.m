@implementation PNDUserNotificationView

+ (void)showPasscodePromptForMCPasscodeComplianceTypeOptionalWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  v10 = MCLocalizedFormat(CFSTR("PASSCODENAGD_CHANGE_PROMPT_NOW"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = MCLocalizedFormat(CFSTR("PASSCODENAGD_CHANGE_PROMPT_LATER"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100003D58;
  v19[3] = &unk_100008288;
  v20 = (id)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](MCUserNotificationManager, "sharedManager"));
  v21 = v8;
  v22 = v9;
  v23 = v11;
  v24 = v13;
  v25 = a1;
  v14 = v13;
  v15 = v11;
  v16 = v9;
  v17 = v8;
  v18 = v20;
  objc_msgSend(v18, "cancelNotificationsWithIdentifier:completionBlock:", CFSTR("passcodenagd-user-notification-id"), v19);

}

+ (void)showPasscodePromptForMCPasscodeComplianceTypeAdvisoryWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  v10 = MCLocalizedFormat(CFSTR("PASSCODENAGD_CHANGE_PROMPT_CONTINUE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = MCLocalizedFormat(CFSTR("PASSCODENAGD_CHANGE_PROMPT_CANCEL"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000402C;
  v19[3] = &unk_100008288;
  v20 = (id)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](MCUserNotificationManager, "sharedManager"));
  v21 = v8;
  v22 = v9;
  v23 = v11;
  v24 = v13;
  v25 = a1;
  v14 = v13;
  v15 = v11;
  v16 = v9;
  v17 = v8;
  v18 = v20;
  objc_msgSend(v18, "cancelNotificationsWithIdentifier:completionBlock:", CFSTR("passcodenagd-user-notification-id"), v19);

}

+ (void)showPasscodePromptForMCPasscodeComplianceTypeMandatoryWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = v6;
  v9 = v7;
  v10 = MCLocalizedFormat(CFSTR("PASSCODENAGD_CHANGE_PROMPT_MANDATORY"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000042D8;
  v16[3] = &unk_1000082B0;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](MCUserNotificationManager, "sharedManager"));
  v18 = v8;
  v19 = v9;
  v20 = v11;
  v21 = a1;
  v12 = v11;
  v13 = v9;
  v14 = v8;
  v15 = v17;
  objc_msgSend(v15, "cancelNotificationsWithIdentifier:completionBlock:", CFSTR("passcodenagd-user-notification-id"), v16);

}

+ (void)beginPromptForChangePasscode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v3 = (void *)qword_10000C360;
  qword_10000C360 = 0;

  v4 = (void *)qword_10000C368;
  qword_10000C368 = 0;

  v5 = (void *)qword_10000C370;
  qword_10000C370 = 0;

  v6 = (void *)qword_10000C378;
  qword_10000C378 = 0;

  qword_10000C380 = objc_msgSend(v7, "isPasscodeSet") ^ 1;
  objc_msgSend(a1, "showCFUserNotifcationWithSecureTextFieldOptionForState:");

}

+ (void)showCFUserNotifcationWithSecureTextFieldOptionForState:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  int64_t v35;
  id v36;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  switch(a3)
  {
    case 2:
      v10 = MCLocalizedFormat(CFSTR("PASSCODENAGD_ENTRY_PROMPT_CONFIRM_NEW_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v11 = 0;
      v12 = CFSTR("PASSCODENAGD_ENTRY_PROMPT_CONFIRM_NEW_BUTTON_TITLE");
LABEL_11:
      v15 = MCLocalizedFormat(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v15);
      goto LABEL_12;
    case 1:
      v13 = MCLocalizedFormat(CFSTR("PASSCODENAGD_ENTRY_PROMPT_NEW_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (qword_10000C360)
        v9 = (id)qword_10000C360;
      else
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescriptionOfCurrentPasscodeConstraints"));
      goto LABEL_10;
    case 0:
      v6 = MCLocalizedFormat(CFSTR("PASSCODENAGD_ENTRY_PROMPT_CURRENT_TITLE"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      v8 = MCLocalizedFormat(CFSTR("PASSCODENAGD_ENTRY_PROMPT_CURRENT_MESSAGE"));
      v9 = (id)objc_claimAutoreleasedReturnValue(v8);
LABEL_10:
      v11 = v9;
      v12 = CFSTR("PASSCODENAGD_CHANGE_PROMPT_CONTINUE");
      goto LABEL_11;
  }
  v14 = 0;
  v11 = 0;
  v7 = 0;
LABEL_12:
  v16 = MCLocalizedFormat(CFSTR("PASSCODENAGD_ENTRY_PROMPT_TEXTFIELD_PLACEHOLDER"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = MCLocalizedFormat(CFSTR("PASSCODENAGD_ENTRY_PROMPT_EMERGENCY_CALL_BUTTON_TITLE"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000046E8;
  v27[3] = &unk_100008328;
  v28 = (id)objc_claimAutoreleasedReturnValue(+[MCUserNotificationManager sharedManager](MCUserNotificationManager, "sharedManager"));
  v29 = v7;
  v30 = v11;
  v31 = v14;
  v32 = v19;
  v33 = v17;
  v34 = v5;
  v35 = a3;
  v36 = a1;
  v20 = v5;
  v21 = v17;
  v22 = v19;
  v23 = v14;
  v24 = v11;
  v25 = v7;
  v26 = v28;
  objc_msgSend(v26, "cancelNotificationsWithIdentifier:completionBlock:", CFSTR("passcodenagd-user-notification-id"), v27);

}

@end
