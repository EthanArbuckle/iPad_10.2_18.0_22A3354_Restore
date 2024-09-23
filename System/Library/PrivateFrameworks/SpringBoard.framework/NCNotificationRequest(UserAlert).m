@implementation NCNotificationRequest(UserAlert)

+ (id)notificationRequestForCarPlayWithAlertItem:()UserAlert
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-CarPlay-%lu"), v7, objc_msgSend(v5, "hash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0DC60C0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_notificationRequestForDestinations:withAlertItem:identifier:", v9, v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)notificationRequestForLockScreenWithAlertItem:()UserAlert
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-LockScreen-%lu"), v7, objc_msgSend(v5, "hash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = *MEMORY[0x1E0DC60C8];
  v15[0] = *MEMORY[0x1E0DC60D0];
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_notificationRequestForDestinations:withAlertItem:identifier:", v12, v5, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_notificationRequestForDestinations:()UserAlert withAlertItem:identifier:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  double v42;
  double v43;
  id v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  _QWORD v68[2];

  v68[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v8, "alertController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(v8, "_prepareNewAlertControllerWithLockedState:requirePasscodeForActions:", 1, 1);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  objc_msgSend(v11, "setNotificationIdentifier:", v9);
  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("com.apple.springboard.alert.%@"), v17);
  v18 = objc_claimAutoreleasedReturnValue();

  v67 = (void *)v18;
  objc_msgSend(v11, "setSectionIdentifier:", v18);
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setThreadIdentifier:", v20);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimestamp:", v21);

  objc_msgSend(v11, "setRequestDestinations:", v10);
  v22 = (void *)objc_opt_new();
  objc_msgSend(v12, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "length"))
  {
    objc_msgSend(v12, "message");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (v25)
      goto LABEL_8;
  }
  else
  {

  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("SYSTEM_NOTIFICATION_HEADER"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setCustomHeader:", v27);

LABEL_8:
  objc_msgSend(v12, "title");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTitle:", v28);

  objc_msgSend(v12, "message");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setMessage:", v29);

  objc_msgSend(v8, "contactIdentifier");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = objc_alloc_init(MEMORY[0x1E0CEC7B0]);
    objc_msgSend(v8, "contactIdentifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setCnContactIdentifier:", v32);

    v33 = objc_alloc_init(MEMORY[0x1E0CEC7A8]);
    objc_msgSend(v33, "setSender:", v31);
    objc_msgSend(v33, "setBundleIdentifier:", v67);
    objc_msgSend(v22, "setCommunicationContext:", v33);

  }
  objc_msgSend(v8, "contentType");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setContentType:", v34);

  objc_msgSend(v8, "iconImage");
  v35 = objc_claimAutoreleasedReturnValue();
  if (!v35)
    goto LABEL_18;
  v36 = (id)v35;
  if (objc_msgSend(v8, "shouldMaskIcon"))
  {
    v65 = v9;
    v37 = objc_alloc(MEMORY[0x1E0D3A810]);
    v36 = objc_retainAutorelease(v36);
    v38 = objc_msgSend(v36, "CGImage");
    objc_msgSend(v36, "scale");
    v39 = (void *)objc_msgSend(v37, "initWithCGImage:scale:", v38);
    v40 = objc_alloc(MEMORY[0x1E0D3A820]);
    v68[0] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = (void *)objc_msgSend(v40, "initWithImages:", v41);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC6198], "prominentIconDimension");
      v43 = v42;
    }
    else
    {
      v43 = 38.0;
    }
    v44 = objc_alloc(MEMORY[0x1E0D3A830]);
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "scale");
    v47 = (void *)objc_msgSend(v44, "initWithSize:scale:", v43, v43, v46);

    objc_msgSend(v66, "imageForDescriptor:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v48)
    {
      v50 = (void *)MEMORY[0x1E0CEA638];
      v64 = v39;
      v51 = a1;
      v52 = objc_msgSend(v48, "CGImage");
      objc_msgSend(v49, "scale");
      objc_msgSend(v50, "imageWithCGImage:scale:orientation:", v52, 0);
      v53 = objc_claimAutoreleasedReturnValue();

      v36 = (id)v53;
      a1 = v51;
      v39 = v64;
    }

    v9 = v65;
    if (!v36)
    {
LABEL_18:
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("exclamationmark.circle"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA5E8], "defaultFontForTextStyle:", *MEMORY[0x1E0CEB5C0]);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = a1;
      v57 = (void *)MEMORY[0x1E0CEA650];
      objc_msgSend(v55, "pointSize");
      objc_msgSend(v57, "configurationWithPointSize:");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "imageWithConfiguration:", v58);
      v36 = (id)objc_claimAutoreleasedReturnValue();

      a1 = v56;
    }
  }
  objc_msgSend(v22, "setIcon:", v36);
  objc_msgSend(v8, "_attachmentImage");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (v59)
    objc_msgSend(v22, "setAttachmentImage:", v59);
  objc_msgSend(v11, "setContent:", v22);
  objc_msgSend(a1, "_notificationOptionsForAlertController:item:", v12, v8);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOptions:", v60);

  objc_msgSend(MEMORY[0x1E0DC5FF0], "defaultNotificationActionForSBAlertItem:", v8);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (v61)
    objc_msgSend(v11, "setDefaultAction:", v61);
  objc_msgSend(MEMORY[0x1E0DC5FF0], "dismissNotificationActionForSBAlertItem:", v8);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  if (v62)
  {
    objc_msgSend(v11, "setClearAction:", v62);
    objc_msgSend(v11, "setCloseAction:", v62);
    objc_msgSend(v11, "setSilenceAction:", v62);
  }

  return v11;
}

+ (id)_notificationOptionsForAlertController:()UserAlert item:
{
  id v5;
  id v6;
  void *v7;
  char v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setDismissAutomatically:", 0);
  objc_msgSend(v7, "setOverridesQuietMode:", objc_msgSend(v6, "_ignoresQuietMode"));
  objc_msgSend(v7, "setAlertsWhenLocked:", 1);
  objc_msgSend(v7, "setAddToLockScreenWhenUnlocked:", objc_msgSend(v6, "shouldShowInLockScreen"));
  objc_msgSend(v7, "setLockScreenPersistence:", 1);
  objc_msgSend(v7, "setLockScreenPriority:", 200);
  objc_msgSend(v7, "setCanPlaySound:", 1);
  objc_msgSend(v7, "setCanTurnOnDisplay:", objc_msgSend(v6, "wakeDisplay"));
  objc_msgSend(v7, "setHideClearActionInList:", objc_msgSend(v6, "allowLockScreenDismissal") ^ 1);
  v8 = objc_msgSend(v6, "allowMessageInCar");

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v5, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLauchUsingSiriForCarPlayDefaultAction:", objc_msgSend(v9, "length") != 0);

  }
  else
  {
    objc_msgSend(v7, "setLauchUsingSiriForCarPlayDefaultAction:", 0);
  }

  return v7;
}

+ (uint64_t)_soundTypeForSBSoundType:()UserAlert
{
  if ((unint64_t)(a3 - 1) > 3)
    return 0;
  else
    return qword_1D0E8B578[a3 - 1];
}

+ (id)_notificationSoundFromSound:()UserAlert
{
  id v4;
  unint64_t v5;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "soundType");
  if (v5 > 4 || v5 == 2)
  {
    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setSoundType:", objc_msgSend(a1, "_soundTypeForSBSoundType:", objc_msgSend(v4, "soundType")));
    objc_msgSend(v4, "songPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSongPath:", v8);

    objc_msgSend(v7, "setSystemSoundID:", objc_msgSend(v4, "systemSoundID"));
    objc_msgSend(v7, "setSoundBehavior:", objc_msgSend(v4, "soundBehavior"));
    objc_msgSend(v4, "vibrationPattern");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVibrationPattern:", v9);

  }
  return v7;
}

@end
