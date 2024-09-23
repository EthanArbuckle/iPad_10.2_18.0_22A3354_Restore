@implementation SXConditionalResolverModifierInstructions

- (SXConditionalResolverModifierInstructions)initWithDocumentProvider:(id)a3 hintsConfigurationOptionProvider:(id)a4
{
  id v7;
  id v8;
  SXConditionalResolverModifierInstructions *v9;
  SXConditionalResolverModifierInstructions *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXConditionalResolverModifierInstructions;
  v9 = -[SXConditionalResolverModifierInstructions init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_documentProvider, a3);
    objc_storeStrong((id *)&v10->_hintsConfigurationOptionProvider, a4);
  }

  return v10;
}

- (BOOL)shouldResolveAutoplacement
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SXConditionalResolverModifierInstructions hints](self, "hints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "autoplacement") != 0;
  else
    v4 = 1;

  return v4;
}

- (BOOL)shouldResolveComponents
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SXConditionalResolverModifierInstructions hints](self, "hints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "components") != 0;
  else
    v4 = 1;

  return v4;
}

- (BOOL)shouldResolveComponentLayouts
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SXConditionalResolverModifierInstructions hints](self, "hints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "componentLayouts") != 0;
  else
    v4 = 1;

  return v4;
}

- (BOOL)shouldResolveComponentStyles
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SXConditionalResolverModifierInstructions hints](self, "hints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "componentStyles") != 0;
  else
    v4 = 1;

  return v4;
}

- (BOOL)shouldResolveComponentTextStyles
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SXConditionalResolverModifierInstructions hints](self, "hints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "componentTextStyles") != 0;
  else
    v4 = 1;

  return v4;
}

- (BOOL)shouldResolveDocumentStyle
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SXConditionalResolverModifierInstructions hints](self, "hints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "documentStyle") != 0;
  else
    v4 = 1;

  return v4;
}

- (BOOL)shouldResolveTextStyles
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SXConditionalResolverModifierInstructions hints](self, "hints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "textStyles") != 0;
  else
    v4 = 1;

  return v4;
}

- (id)hints
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[SXHintsConfigurationOptionProvider hints](self->_hintsConfigurationOptionProvider, "hints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreConditionalHints");

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    -[SXDocumentProviding document](self->_documentProvider, "document");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conditionals");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (SXDocumentProviding)documentProvider
{
  return self->_documentProvider;
}

- (SXHintsConfigurationOptionProvider)hintsConfigurationOptionProvider
{
  return self->_hintsConfigurationOptionProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hintsConfigurationOptionProvider, 0);
  objc_storeStrong((id *)&self->_documentProvider, 0);
}

@end
