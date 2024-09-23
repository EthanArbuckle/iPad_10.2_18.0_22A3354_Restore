@implementation PSRestrictionsPINController

+ (BOOL)settingEnabled
{
  return objc_msgSend(MEMORY[0x1E0D8D650], "settingEnabled");
}

- (PSRestrictionsPINController)init
{
  PSRestrictionsPINController *v2;
  PSSpecifier *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSRestrictionsPINController;
  v2 = -[DevicePINController init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PSSpecifier);
    -[PSSpecifier setEditPaneClass:](v3, "setEditPaneClass:", objc_opt_class());
    -[DevicePINController setSpecifier:](v2, "setSpecifier:", v3);

  }
  return v2;
}

- (id)pinInstructionsPrompt
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[PSViewController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("screenTimePinEntry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    -[PSRestrictionsPINController stringsBundle](self, "stringsBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DevicePINController stringsTable](self, "stringsTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PMENTER_SC_PROMPT"), &stru_1E4A69238, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PSRestrictionsPINController;
    -[DevicePINController pinInstructionsPrompt](&v10, sel_pinInstructionsPrompt);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)title
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[PSViewController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("screenTimePinEntry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    -[PSRestrictionsPINController stringsBundle](self, "stringsBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DevicePINController stringsTable](self, "stringsTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PMENTER_SC"), &stru_1E4A69238, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PSRestrictionsPINController;
    -[DevicePINController title](&v10, sel_title);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (int)pinLength
{
  return 4;
}

- (BOOL)validatePIN:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0D8D650], "validatePIN:", a3);
}

- (id)stringsBundle
{
  return (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

- (void)setPIN:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D8D650], "setPIN:", a3);
}

- (BOOL)pinIsAcceptable:(id)a3 outError:(id *)a4
{
  return 1;
}

- (id)pinInstructionsPromptFont
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB538]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = v3;

  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "boldSystemFontOfSize:", v4);
}

- (__CFString)defaultsID
{
  return CFSTR("com.apple.springboard");
}

- (__CFString)failedAttemptsKey
{
  return CFSTR("SBParentalControlsFailedAttempts");
}

- (__CFString)blockTimeIntervalKey
{
  return CFSTR("SBParentalControlsBlockTimeIntervalSinceReferenceDate");
}

- (__CFString)blockedStateKey
{
  return CFSTR("SBParentalControlsBlocked");
}

- (BOOL)simplePIN
{
  return 1;
}

- (BOOL)isNumericPIN
{
  return 1;
}

@end
