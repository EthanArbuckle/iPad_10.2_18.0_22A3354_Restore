@implementation CACSpokenCommandGroup

- (CACSpokenCommandGroup)initWithIdentifier:(id)a3
{
  id v5;
  CACSpokenCommandGroup *v6;
  CACSpokenCommandGroup *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CACSpokenCommandGroup;
  v6 = -[CACSpokenCommandGroup init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_isCustom = -[NSString hasPrefix:](v7->_identifier, "hasPrefix:", CFSTR("Custom"));
  }

  return v7;
}

- (id)cloneWithoutCommands
{
  id v3;

  v3 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v3, "setIdentifier:", self->_identifier);
  objc_msgSend(v3, "setDisplayString:", self->_displayString);
  objc_msgSend(v3, "setIsEnabled:", self->_isEnabled);
  objc_msgSend(v3, "setIsConfirmationRequired:", self->_isConfirmationRequired);
  objc_msgSend(v3, "setIsCustom:", self->_isCustom);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  NSString *identifier;
  void *v4;

  identifier = self->_identifier;
  objc_msgSend(a3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(identifier) = -[NSString isEqualToString:](identifier, "isEqualToString:", v4);

  return (char)identifier;
}

- (BOOL)isGroup
{
  return 1;
}

- (BOOL)isVisible
{
  return 1;
}

- (void)setLocale:(id)a3
{
  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->_commandsArray, "makeObjectsPerformSelector:withObject:", sel_setLocale_, a3);
}

- (NSString)displayString
{
  NSString *displayString;
  void *v4;
  void *v5;

  displayString = self->_displayString;
  if (!displayString)
  {
    if (!self->_identifier)
      goto LABEL_4;
    +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayNameForCommandSetIdentifier:", self->_identifier);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACSpokenCommandGroup setDisplayString:](self, "setDisplayString:", v5);

    displayString = self->_displayString;
    if (!displayString)
    {
LABEL_4:
      -[CACSpokenCommandGroup setDisplayString:](self, "setDisplayString:", &stru_24F2ADCC8);
      displayString = self->_displayString;
    }
  }
  return displayString;
}

- (NSMutableArray)commandsArray
{
  NSMutableArray *commandsArray;
  NSMutableArray *v4;
  NSMutableArray *v5;

  commandsArray = self->_commandsArray;
  if (!commandsArray)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = self->_commandsArray;
    self->_commandsArray = v4;

    commandsArray = self->_commandsArray;
  }
  return commandsArray;
}

- (void)saveToPreferences
{
  if (-[CACSpokenCommandGroup isGroup](self, "isGroup"))
    -[NSMutableArray makeObjectsPerformSelector:](self->_commandsArray, "makeObjectsPerformSelector:", sel_saveToPreferences);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)setCommandsArray:(id)a3
{
  objc_storeStrong((id *)&self->_commandsArray, a3);
}

- (void)setDisplayString:(id)a3
{
  objc_storeStrong((id *)&self->_displayString, a3);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (void)setIsEnabled:(BOOL)a3
{
  self->_isEnabled = a3;
}

- (BOOL)isConfirmationRequired
{
  return self->_isConfirmationRequired;
}

- (void)setIsConfirmationRequired:(BOOL)a3
{
  self->_isConfirmationRequired = a3;
}

- (BOOL)isCustom
{
  return self->_isCustom;
}

- (void)setIsCustom:(BOOL)a3
{
  self->_isCustom = a3;
}

- (unint64_t)searchScore
{
  return self->_searchScore;
}

- (void)setSearchScore:(unint64_t)a3
{
  self->_searchScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_commandsArray, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
