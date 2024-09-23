@implementation WFClipboardVariable

- (WFClipboardVariable)initWithAggrandizements:(id)a3
{
  void *v4;
  WFClipboardVariable *v5;

  WFVariableDictionaryWithAggrandizements(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFVariable initWithDictionary:variableProvider:](self, "initWithDictionary:variableProvider:", v4, 0);

  return v5;
}

- (void)retrieveContentCollectionWithVariableSource:(id)a3 completionHandler:(id)a4
{
  Class (__cdecl *v4)();
  id v5;
  id v6;

  v4 = (Class (__cdecl *)())getUIPasteboardClass_55633;
  v5 = a4;
  -[objc_class generalPasteboard](v4(), "generalPasteboard");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13EA8], "generateCollectionFromPasteboard:completionHandler:", v6, v5);

}

- (id)name
{
  return WFLocalizedStringWithKey(CFSTR("Clipboard variable"), CFSTR("Clipboard"));
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
  v5 = (void *)objc_msgSend(v2, "initWithSymbolName:symbolColor:background:", CFSTR("clipboard"), v3, v4);

  return v5;
}

- (BOOL)isAvailable
{
  return 1;
}

- (BOOL)requiresModernVariableSupport
{
  void *v2;
  BOOL v3;

  -[WFVariable aggrandizements](self, "aggrandizements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)possibleContentClassesWithContext:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithObject:", objc_opt_class());
}

- (id)requiredAccessResources
{
  void *v2;
  void *v3;

  -[objc_class generalPasteboard](getUIPasteboardClass_55633(), "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13EA8], "requiredResourcesForContentInPasteboard:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
