@implementation REMDisplayNameUtils

+ (id)displayNameFromListName:(id)a3 isPlaceholder:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    if (!objc_msgSend(v5, "length") && v4)
      goto LABEL_4;
  }
  else if (v4)
  {
LABEL_4:
    v7 = 49;
    goto LABEL_9;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("DEFAULT_TASK_CALENDAR_NAME")) & 1) == 0
    && !objc_msgSend(v6, "isEqualToString:", CFSTR("Reminders")))
  {
    v8 = v6;
    goto LABEL_10;
  }
  v7 = 11;
LABEL_9:
  _REMGetLocalizedString(v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v9 = v8;

  return v9;
}

+ (id)displayNameFromAccountName:(id)a3
{
  id v3;
  void *v4;
  int v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("local"));

  if (v5)
  {
    _REMGetLocalizedString(12);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

@end
