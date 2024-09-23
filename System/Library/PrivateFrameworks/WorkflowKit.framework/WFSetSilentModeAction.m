@implementation WFSetSilentModeAction

- (id)staccatoNameOverride
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = WFLocalizedString(CFSTR("Silent Mode"));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3B78]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithKey:table:locale:bundleURL:", CFSTR("Silent Mode"), CFSTR("Localizable"), v6, v4);

  objc_msgSend(v7, "localize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)hiddenParameterKeysForStaccato
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("operation");
  v6[1] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedFocusFilterDescriptionWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFLocalizedStringResourceWithKey(CFSTR("Turn Silent Mode on or off while in this Focus."), CFSTR("Turn Silent Mode on or off while in this Focus."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localize:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)iconSymbolName
{
  return CFSTR("bell.slash.fill");
}

- (id)iconBackgroundColorName
{
  return CFSTR("Red");
}

- (BOOL)skipExecutingInSiri
{
  return 1;
}

- (id)displayableAppDescriptor
{
  return 0;
}

- (void)generateStandaloneShortcutRepresentation:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (id)reversibleSettingParameterKey
{
  return CFSTR("state");
}

- (id)defaultParameterStatesForStaccato
{
  WFLinkEnumerationSubstitutableState *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("operation");
  v2 = -[WFVariableSubstitutableParameterState initWithValue:]([WFLinkEnumerationSubstitutableState alloc], "initWithValue:", CFSTR("toggle"));
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (Class)settingsClientClass
{
  return (Class)objc_opt_class();
}

@end
