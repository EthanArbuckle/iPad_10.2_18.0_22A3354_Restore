@implementation WFSmartPromptDatabaseLookupResult

- (WFSmartPromptDatabaseLookupResult)initWithAllowedStates:(id)a3 deniedStates:(id)a4 undefinedStates:(id)a5
{
  return -[WFSmartPromptDatabaseLookupResult initWithAllowedStates:deniedStates:undefinedStates:restrictedStates:previousAttribution:](self, "initWithAllowedStates:deniedStates:undefinedStates:restrictedStates:previousAttribution:", a3, a4, a5, MEMORY[0x1E0C9AA60], 0);
}

- (WFSmartPromptDatabaseLookupResult)initWithAllowedStates:(id)a3 deniedStates:(id)a4 undefinedStates:(id)a5 restrictedStates:(id)a6
{
  return -[WFSmartPromptDatabaseLookupResult initWithAllowedStates:deniedStates:undefinedStates:restrictedStates:previousAttribution:](self, "initWithAllowedStates:deniedStates:undefinedStates:restrictedStates:previousAttribution:", a3, a4, a5, a6, 0);
}

- (WFSmartPromptDatabaseLookupResult)initWithAllowedStates:(id)a3 deniedStates:(id)a4 undefinedStates:(id)a5 previousAttribution:(id)a6
{
  return -[WFSmartPromptDatabaseLookupResult initWithAllowedStates:deniedStates:undefinedStates:restrictedStates:previousAttribution:](self, "initWithAllowedStates:deniedStates:undefinedStates:restrictedStates:previousAttribution:", a3, a4, a5, MEMORY[0x1E0C9AA60], a6);
}

- (WFSmartPromptDatabaseLookupResult)initWithAllowedStates:(id)a3 deniedStates:(id)a4 undefinedStates:(id)a5 restrictedStates:(id)a6 previousAttribution:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  WFSmartPromptDatabaseLookupResult *v17;
  WFSmartPromptDatabaseLookupResult *v18;
  WFSmartPromptDatabaseLookupResult *v19;
  id v21;
  objc_super v22;

  v21 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)WFSmartPromptDatabaseLookupResult;
  v17 = -[WFSmartPromptDatabaseLookupResult init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_allowedStates, a3);
    objc_storeStrong((id *)&v18->_deniedStates, a4);
    objc_storeStrong((id *)&v18->_undefinedStates, a5);
    objc_storeStrong((id *)&v18->_restrictedStates, a6);
    objc_storeStrong((id *)&v18->_previousAttribution, a7);
    v19 = v18;
  }

  return v18;
}

- (NSArray)allowedStates
{
  return self->_allowedStates;
}

- (NSArray)deniedStates
{
  return self->_deniedStates;
}

- (NSArray)undefinedStates
{
  return self->_undefinedStates;
}

- (NSArray)restrictedStates
{
  return self->_restrictedStates;
}

- (WFContentAttribution)previousAttribution
{
  return self->_previousAttribution;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousAttribution, 0);
  objc_storeStrong((id *)&self->_restrictedStates, 0);
  objc_storeStrong((id *)&self->_undefinedStates, 0);
  objc_storeStrong((id *)&self->_deniedStates, 0);
  objc_storeStrong((id *)&self->_allowedStates, 0);
}

@end
