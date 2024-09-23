@implementation WFScriptingActionResource

- (WFScriptingActionResource)initWithDefinition:(id)a3
{
  WFScriptingActionResource *v3;
  uint64_t v4;
  WFSecuredPreferences *securedPreferences;
  void *v6;
  void *v7;
  WFScriptingActionResource *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WFScriptingActionResource;
  v3 = -[WFResource initWithDefinition:](&v10, sel_initWithDefinition_, a3);
  if (v3)
  {
    +[WFSecuredPreferences standardPreferences](WFSecuredPreferences, "standardPreferences");
    v4 = objc_claimAutoreleasedReturnValue();
    securedPreferences = v3->_securedPreferences;
    v3->_securedPreferences = (WFSecuredPreferences *)v4;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFScriptingActionResource securedPreferences](v3, "securedPreferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v3, sel_preferencesUpdated_, CFSTR("WFSecuredPreferencesDidChangeNotification"), v7);

    v8 = v3;
  }

  return v3;
}

- (void)refreshAvailability
{
  _BOOL8 v3;
  uint64_t v4;
  id v5;

  v3 = +[WFShortcutsSecuritySettings areScriptingActionsEnabled](WFShortcutsSecuritySettings, "areScriptingActionsEnabled");
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    +[WFShortcutsSecuritySettings scripingActionDisabledErrorWithActionName:](WFShortcutsSecuritySettings, "scripingActionDisabledErrorWithActionName:", 0);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v4;
  -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", v3, v4);

}

- (WFSecuredPreferences)securedPreferences
{
  return self->_securedPreferences;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securedPreferences, 0);
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

@end
