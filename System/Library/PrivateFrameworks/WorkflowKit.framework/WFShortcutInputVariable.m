@implementation WFShortcutInputVariable

- (WFShortcutInputVariable)initWithVariableProvider:(id)a3 aggrandizements:(id)a4
{
  id v6;
  void *v7;
  WFShortcutInputVariable *v8;

  v6 = a3;
  WFVariableDictionaryWithAggrandizements(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFShortcutInputVariable initWithDictionary:variableProvider:](self, "initWithDictionary:variableProvider:", v7, v6);

  return v8;
}

- (WFShortcutInputVariable)initWithDictionary:(id)a3 variableProvider:(id)a4
{
  id v6;
  WFShortcutInputVariable *v7;
  WFShortcutInputVariable *v8;
  WFShortcutInputVariable *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)WFShortcutInputVariable;
  v7 = -[WFVariable initWithDictionary:variableProvider:](&v11, sel_initWithDictionary_variableProvider_, a3, v6);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_variableProvider, v6);
    v9 = v8;
  }

  return v8;
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "workflowInput");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a4 + 2))(v6, v7, 0);

}

- (id)name
{
  return WFLocalizedString(CFSTR("Shortcut Input"));
}

- (id)icon
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0DC7DB0]);
  objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithSystemColor:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC7B68], "clearBackground");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithSymbolName:symbolColor:background:", CFSTR("arrow.down.app.2.stack.3d"), v3, v4);

  return v5;
}

- (BOOL)isAvailable
{
  return 1;
}

- (id)possibleContentClassesWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc(MEMORY[0x1E0C99E40]);
  -[WFShortcutInputVariable variableProvider](self, "variableProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workflowInputClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithArray:", v6);

  return v7;
}

- (id)variableProvider
{
  return objc_loadWeakRetained((id *)&self->_variableProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_variableProvider);
}

@end
