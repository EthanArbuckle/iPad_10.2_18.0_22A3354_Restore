@implementation ICThingsWhenContentMapping

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  id v6;
  void *v7;
  void (*v8)(void);
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD *v30;

  v30 = a3;
  v6 = a5;
  objc_msgSend(v6, "objectForKey:", CFSTR("thingsWhen"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("This Evening")))
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("Someday")))
    {
      v8 = (void (*)(void))v30[2];
      goto LABEL_5;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("thingsWhenCustomDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13F28], "datesInString:error:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isEqualToString:", CFSTR("Today")))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("Tomorrow")))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "dateByAddingTimeInterval:", 86400.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
      if (!objc_msgSend(v7, "isEqualToString:", CFSTR("On Date")))
      {
        ((void (*)(_QWORD *, _QWORD, _QWORD))v30[2])(v30, 0, 0);
LABEL_18:

        goto LABEL_19;
      }
      v12 = v11;
    }
    v14 = v12;
LABEL_13:
    v15 = (void *)objc_opt_new();
    objc_msgSend(v6, "objectForKey:", CFSTR("thingsWhenReminderTime"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D13F28], "datesInString:error:", v16, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "length") && v18)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "components:fromDate:", 224, v18);
      v28 = v18;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v11;
      v21 = v9;
      v22 = objc_msgSend(v20, "hour");
      v23 = objc_msgSend(v20, "minute");
      v24 = objc_msgSend(v20, "second");
      v25 = v22;
      v9 = v21;
      v11 = v29;
      objc_msgSend(v19, "dateBySettingHour:minute:second:ofDate:options:", v25, v23, v24, v14, 0);
      v26 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"));
      v18 = v28;

      v14 = (void *)v26;
    }
    else
    {
      objc_msgSend(v15, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    }
    objc_msgSend(v15, "stringFromDate:", v14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(_QWORD *, void *, _QWORD))v30[2])(v30, v27, 0);

    goto LABEL_18;
  }
  v8 = (void (*)(void))v30[2];
LABEL_5:
  v8();
LABEL_19:

}

@end
