@implementation _SBSSystemNotesConnectActionSettingsDescriptionProvider

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  void *v6;

  if (!a3)
    return CFSTR("connectionSource");
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemNotesConnectAction.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("setting < SBSSystemNotesConnectActionSettingsKeyCount"));

  return 0;
}

- (id)valueDescriptionForFlag:(int64_t)a3 object:(id)a4 ofSetting:(unint64_t)a5
{
  id v8;
  void *v9;
  __CFString *v10;
  void *v12;

  v8 = a4;
  v9 = v8;
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSSystemNotesConnectAction.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("setting < SBSSystemNotesConnectActionSettingsKeyCount"));

    v10 = CFSTR("-count-");
  }
  else
  {
    SBSSystemNotesConnectionSourceDescription(objc_msgSend(v8, "unsignedIntegerValue"));
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

@end
