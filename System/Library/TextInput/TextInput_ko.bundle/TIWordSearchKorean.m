@implementation TIWordSearchKorean

- (int)mecabraInputMethodType
{
  return 17;
}

- (void)updateMecabraState
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TIWordSearchKorean;
  -[TIWordSearch updateMecabraState](&v3, sel_updateMecabraState);
  -[TIWordSearch updateUserWordEntries](self, "updateUserWordEntries");
  -[TIWordSearch updateDictionaryPaths](self, "updateDictionaryPaths");
}

- (id)mecabraCreationOptionsDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIWordSearchKorean;
  -[TIWordSearch mecabraCreationOptionsDictionary](&v10, sel_mecabraCreationOptionsDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[TIWordSearch inputMode](self, "inputMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "originalIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TIInputModeGetSWLayout();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Korean-With-QWERTY"));

  if (v8)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("en_US"), *MEMORY[0x24BEDC810]);
  return v4;
}

- (BOOL)tenKeyEnabled
{
  return self->_tenKeyEnabled;
}

- (void)setTenKeyEnabled:(BOOL)a3
{
  self->_tenKeyEnabled = a3;
}

- (BOOL)bilingualEnabled
{
  return self->_bilingualEnabled;
}

- (void)setBilingualEnabled:(BOOL)a3
{
  self->_bilingualEnabled = a3;
}

@end
