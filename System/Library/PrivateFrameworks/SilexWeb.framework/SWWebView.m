@implementation SWWebView

- (void)setShortcutsBarWithLeadingGroups:(id)a3 trailingGroups:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SWWebView inputAssistantItem](self, "inputAssistantItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLeadingBarButtonGroups:", v7);

  -[SWWebView inputAssistantItem](self, "inputAssistantItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTrailingBarButtonGroups:", v6);

}

- (id)_textInputTraits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SWWebView;
  -[SWWebView _textInputTraits](&v11, sel__textInputTraits);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWWebView overridenTraits](self, "overridenTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overrideWithTraits:", v4);

  -[SWWebView overridenTraits](self, "overridenTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overrideWithPrivateTraits:", v5);

  -[SWWebView overridenTraits](self, "overridenTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setForceDisableDictation:", objc_msgSend(v6, "forceDisableDictation"));

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (!v8)
  {
    -[SWWebView overridenTraits](self, "overridenTraits");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidePrediction:", objc_msgSend(v9, "hidePrediction"));

  }
  return v3;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (void)setAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryView, a3);
}

- (UITextInputTraits)overridenTraits
{
  return self->_overridenTraits;
}

- (void)setOverridenTraits:(id)a3
{
  objc_storeStrong((id *)&self->_overridenTraits, a3);
}

- (NSArray)removedMenuIdentifiers
{
  return self->_removedMenuIdentifiers;
}

- (void)setRemovedMenuIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1792);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedMenuIdentifiers, 0);
  objc_storeStrong((id *)&self->_overridenTraits, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end
