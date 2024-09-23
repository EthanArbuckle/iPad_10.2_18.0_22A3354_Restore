@implementation SXDOMConditionResolverModifier

- (SXDOMConditionResolverModifier)initWithValidationContextFactory:(id)a3 componentResolver:(id)a4 textStyleResolver:(id)a5 componentStyleResolver:(id)a6 componentLayoutResolver:(id)a7 componentTextStyleResolver:(id)a8 advertisementAutoPlacementResolver:(id)a9 suggestedArticlesAutoPlacementResolver:(id)a10 documentStyleResolver:(id)a11 instructions:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  SXDOMConditionResolverModifier *v22;
  SXDOMConditionResolverModifier *v23;
  id obj;
  id v26;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  obj = a4;
  v33 = a4;
  v32 = a5;
  v26 = a6;
  v31 = a6;
  v27 = a7;
  v30 = a7;
  v29 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v35.receiver = self;
  v35.super_class = (Class)SXDOMConditionResolverModifier;
  v22 = -[SXDOMConditionResolverModifier init](&v35, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_validationContextFactory, a3);
    objc_storeStrong((id *)&v23->_componentResolver, obj);
    objc_storeStrong((id *)&v23->_textStyleResolver, a5);
    objc_storeStrong((id *)&v23->_componentStyleResolver, v26);
    objc_storeStrong((id *)&v23->_componentLayoutResolver, v27);
    objc_storeStrong((id *)&v23->_componentTextStyleResolver, a8);
    objc_storeStrong((id *)&v23->_advertisementAutoPlacementResolver, a9);
    objc_storeStrong((id *)&v23->_suggestedArticlesAutoPlacementResolver, a10);
    objc_storeStrong((id *)&v23->_documentStyleResolver, a11);
    objc_storeStrong((id *)&v23->_instructions, a12);
  }

  return v23;
}

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v6;
  SXConditionValidationContextFactory *validationContextFactory;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;

  v31 = a3;
  v6 = a4;
  if (!self->_hasCheckedInstructions)
  {
    self->_resolveAutoplacement = -[SXConditionalResolverModifierInstructions shouldResolveAutoplacement](self->_instructions, "shouldResolveAutoplacement");
    self->_resolveComponents = -[SXConditionalResolverModifierInstructions shouldResolveComponents](self->_instructions, "shouldResolveComponents");
    self->_resolveComponentLayouts = -[SXConditionalResolverModifierInstructions shouldResolveComponentLayouts](self->_instructions, "shouldResolveComponentLayouts");
    self->_resolveComponentStyles = -[SXConditionalResolverModifierInstructions shouldResolveComponentStyles](self->_instructions, "shouldResolveComponentStyles");
    self->_resolveComponentTextStyles = -[SXConditionalResolverModifierInstructions shouldResolveComponentTextStyles](self->_instructions, "shouldResolveComponentTextStyles");
    self->_resolveDocumentStyle = -[SXConditionalResolverModifierInstructions shouldResolveDocumentStyle](self->_instructions, "shouldResolveDocumentStyle");
    self->_resolveTextStyles = -[SXConditionalResolverModifierInstructions shouldResolveTextStyles](self->_instructions, "shouldResolveTextStyles");
    self->_hasCheckedInstructions = 1;
  }
  if (self->_resolveComponents
    || self->_resolveComponentStyles
    || self->_resolveComponentLayouts
    || self->_resolveComponentTextStyles
    || self->_resolveTextStyles
    || self->_resolveAutoplacement
    || self->_resolveDocumentStyle)
  {
    validationContextFactory = self->_validationContextFactory;
    objc_msgSend(v6, "layoutOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXConditionValidationContextFactory createContextWithLayoutOptions:](validationContextFactory, "createContextWithLayoutOptions:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_resolveComponents)
    {
      objc_msgSend(v31, "components");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "analysis");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "conditionalObjectAnalysis");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      self->_resolveComponents = -[SXDOMConditionResolverModifier resolveComponents:conditionalObjectAnalysis:validationContext:](self, "resolveComponents:conditionalObjectAnalysis:validationContext:", v10, v12, v9);

    }
    if (self->_resolveTextStyles)
    {
      objc_msgSend(v31, "textStyles");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "analysis");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "conditionalObjectAnalysis");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      self->_resolveTextStyles = -[SXDOMConditionResolverModifier resolveTextStyles:conditionalObjectAnalysis:validationContext:](self, "resolveTextStyles:conditionalObjectAnalysis:validationContext:", v13, v15, v9);

    }
    if (self->_resolveComponentLayouts)
    {
      objc_msgSend(v31, "componentLayouts");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "analysis");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "conditionalObjectAnalysis");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      self->_resolveComponentLayouts = -[SXDOMConditionResolverModifier resolveComponentLayouts:conditionalObjectAnalysis:validationContext:](self, "resolveComponentLayouts:conditionalObjectAnalysis:validationContext:", v16, v18, v9);

    }
    if (self->_resolveComponentStyles)
    {
      objc_msgSend(v31, "componentStyles");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "analysis");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "conditionalObjectAnalysis");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      self->_resolveComponentStyles = -[SXDOMConditionResolverModifier resolveComponentStyles:conditionalObjectAnalysis:validationContext:](self, "resolveComponentStyles:conditionalObjectAnalysis:validationContext:", v19, v21, v9);

    }
    if (self->_resolveComponentTextStyles)
    {
      objc_msgSend(v31, "componentTextStyles");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "analysis");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "conditionalObjectAnalysis");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      self->_resolveComponentTextStyles = -[SXDOMConditionResolverModifier resolveComponentTextStyle:conditionalObjectAnalysis:validationContext:](self, "resolveComponentTextStyle:conditionalObjectAnalysis:validationContext:", v22, v24, v9);

    }
    if (self->_resolveAutoplacement)
    {
      objc_msgSend(v31, "autoPlacement");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDOMConditionResolverModifier resolveAutoPlacement:validationContext:](self, "resolveAutoPlacement:validationContext:", v25, v9);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setAutoPlacement:", v26);

    }
    if (self->_resolveDocumentStyle)
    {
      objc_msgSend(v31, "documentStyle");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "analysis");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "conditionalObjectAnalysis");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXDOMConditionResolverModifier resolveDocumentStyle:conditionalObjectAnalysis:validationContext:](self, "resolveDocumentStyle:conditionalObjectAnalysis:validationContext:", v27, v29, v9);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setDocumentStyle:", v30);

    }
  }

}

- (BOOL)resolveComponents:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  objc_msgSend(v8, "allComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __96__SXDOMConditionResolverModifier_resolveComponents_conditionalObjectAnalysis_validationContext___block_invoke;
  v16[3] = &unk_24D68CCD8;
  v16[4] = self;
  v12 = v10;
  v17 = v12;
  v13 = v8;
  v18 = v13;
  v20 = &v21;
  v14 = v9;
  v19 = v14;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v16);

  LOBYTE(v11) = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v11;
}

void __96__SXDOMConditionResolverModifier_resolveComponents_conditionalObjectAnalysis_validationContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  uint64_t v18;
  BOOL v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "conditional");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v20[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resolveObjects:context:", v8, *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "object");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 != v5)
      objc_msgSend(*(id *)(a1 + 48), "replaceComponentAtIndex:withComponent:", a3, v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    v11 = *(void **)(a1 + 56);
    objc_msgSend(v5, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "conditionTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addComponentIdentifier:conditionTypes:", v12, v13);

  }
  v14 = *(void **)(a1 + 48);
  objc_msgSend(v5, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "componentsForContainerComponentWithIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = objc_msgSend(*(id *)(a1 + 32), "resolveComponents:conditionalObjectAnalysis:validationContext:", v16, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v19 = (v17 & 1) != 0 || *(_BYTE *)(v18 + 24) != 0;
    *(_BYTE *)(v18 + 24) = v19;
  }

}

- (BOOL)resolveTextStyles:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v11 = (void *)objc_msgSend(v8, "copy");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __96__SXDOMConditionResolverModifier_resolveTextStyles_conditionalObjectAnalysis_validationContext___block_invoke;
  v16[3] = &unk_24D68CD00;
  v16[4] = self;
  v12 = v10;
  v17 = v12;
  v20 = &v21;
  v13 = v8;
  v18 = v13;
  v14 = v9;
  v19 = v14;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v16);

  LOBYTE(v11) = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v11;
}

void __96__SXDOMConditionResolverModifier_resolveTextStyles_conditionalObjectAnalysis_validationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "conditional");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6;
  if (v7)
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v14[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resolveObjects:context:", v10, *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "object");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    if (v8 != v6)
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v8, v5);
    v12 = *(void **)(a1 + 56);
    objc_msgSend(v11, "conditionTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addTextStyleIdentifier:conditionTypes:", v5, v13);

  }
}

- (BOOL)resolveComponentLayouts:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v11 = (void *)objc_msgSend(v8, "copy");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __102__SXDOMConditionResolverModifier_resolveComponentLayouts_conditionalObjectAnalysis_validationContext___block_invoke;
  v16[3] = &unk_24D68CD28;
  v16[4] = self;
  v12 = v10;
  v17 = v12;
  v20 = &v21;
  v13 = v8;
  v18 = v13;
  v14 = v9;
  v19 = v14;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v16);

  LOBYTE(v11) = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v11;
}

void __102__SXDOMConditionResolverModifier_resolveComponentLayouts_conditionalObjectAnalysis_validationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "conditional");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6;
  if (v7)
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v14[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resolveObjects:context:", v10, *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "object");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    if (v8 != v6)
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v8, v5);
    v12 = *(void **)(a1 + 56);
    objc_msgSend(v11, "conditionTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addComponentLayoutIdentifier:conditionTypes:", v5, v13);

  }
}

- (BOOL)resolveComponentStyles:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v11 = (void *)objc_msgSend(v8, "copy");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __101__SXDOMConditionResolverModifier_resolveComponentStyles_conditionalObjectAnalysis_validationContext___block_invoke;
  v16[3] = &unk_24D68CD50;
  v16[4] = self;
  v12 = v10;
  v17 = v12;
  v20 = &v21;
  v13 = v8;
  v18 = v13;
  v14 = v9;
  v19 = v14;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v16);

  LOBYTE(v11) = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v11;
}

void __101__SXDOMConditionResolverModifier_resolveComponentStyles_conditionalObjectAnalysis_validationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "conditional");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6;
  if (v7)
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v14[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resolveObjects:context:", v10, *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "object");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    if (v8 != v6)
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v8, v5);
    v12 = *(void **)(a1 + 56);
    objc_msgSend(v11, "conditionTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addComponentStyleIdentifier:conditionTypes:", v5, v13);

  }
}

- (BOOL)resolveComponentTextStyle:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v11 = (void *)objc_msgSend(v8, "copy");
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __104__SXDOMConditionResolverModifier_resolveComponentTextStyle_conditionalObjectAnalysis_validationContext___block_invoke;
  v16[3] = &unk_24D68CD78;
  v16[4] = self;
  v12 = v10;
  v17 = v12;
  v20 = &v21;
  v13 = v8;
  v18 = v13;
  v14 = v9;
  v19 = v14;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v16);

  LOBYTE(v11) = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);

  return (char)v11;
}

void __104__SXDOMConditionResolverModifier_resolveComponentTextStyle_conditionalObjectAnalysis_validationContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "conditional");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v6;
  if (v7)
  {
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v14[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resolveObjects:context:", v10, *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "object");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    if (v8 != v6)
      objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v8, v5);
    v12 = *(void **)(a1 + 56);
    objc_msgSend(v11, "conditionTypes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addComponentTextStyleIdentifier:conditionTypes:", v5, v13);

  }
}

- (id)resolveAutoPlacement:(id)a3 validationContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  SXConditionalObjectResolver *advertisementAutoPlacementResolver;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  SXConditionalObjectResolver *suggestedArticlesAutoPlacementResolver;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  SXResolvedAutoPlacement *v23;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "advertisement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suggestedArticles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (objc_msgSend(v8, "conditional"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    advertisementAutoPlacementResolver = self->_advertisementAutoPlacementResolver;
    objc_msgSend(v6, "advertisement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v12;
    v13 = 1;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXConditionalObjectResolver resolveObjects:context:](advertisementAutoPlacementResolver, "resolveObjects:context:", v14, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "object");
    v16 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v16;
    if (!v9)
      goto LABEL_8;
  }
  else
  {
    v13 = 0;
    if (!v9)
      goto LABEL_8;
  }
  objc_msgSend(v9, "conditional");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    suggestedArticlesAutoPlacementResolver = self->_suggestedArticlesAutoPlacementResolver;
    objc_msgSend(v6, "suggestedArticles");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v19;
    v13 = 1;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SXConditionalObjectResolver resolveObjects:context:](suggestedArticlesAutoPlacementResolver, "resolveObjects:context:", v20, v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "object");
    v22 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v22;
  }
LABEL_8:
  self->_resolveAutoplacement = v13;
  v23 = -[SXResolvedAutoPlacement initWithAdvertisement:suggestedArticles:]([SXResolvedAutoPlacement alloc], "initWithAdvertisement:suggestedArticles:", v8, v9);

  return v23;
}

- (id)resolveDocumentStyle:(id)a3 conditionalObjectAnalysis:(id)a4 validationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  SXConditionalObjectResolver *documentStyleResolver;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v8;
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "conditional");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      documentStyleResolver = self->_documentStyleResolver;
      v21[0] = v12;
      v15 = 1;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXConditionalObjectResolver resolveObjects:context:](documentStyleResolver, "resolveObjects:context:", v16, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "object");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "conditionTypes");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDocumentStyleConditionTypes:", v19);

    }
    else
    {
      v15 = 0;
      v18 = v12;
    }
  }
  else
  {
    v15 = 0;
    v18 = 0;
  }
  self->_resolveDocumentStyle = v15;

  return v18;
}

- (SXConditionValidationContextFactory)validationContextFactory
{
  return self->_validationContextFactory;
}

- (SXConditionalObjectResolver)componentResolver
{
  return self->_componentResolver;
}

- (SXConditionalObjectResolver)textStyleResolver
{
  return self->_textStyleResolver;
}

- (SXConditionalObjectResolver)componentStyleResolver
{
  return self->_componentStyleResolver;
}

- (SXConditionalObjectResolver)componentLayoutResolver
{
  return self->_componentLayoutResolver;
}

- (SXConditionalObjectResolver)componentTextStyleResolver
{
  return self->_componentTextStyleResolver;
}

- (SXConditionalObjectResolver)advertisementAutoPlacementResolver
{
  return self->_advertisementAutoPlacementResolver;
}

- (SXConditionalObjectResolver)suggestedArticlesAutoPlacementResolver
{
  return self->_suggestedArticlesAutoPlacementResolver;
}

- (SXConditionalObjectResolver)documentStyleResolver
{
  return self->_documentStyleResolver;
}

- (SXConditionalResolverModifierInstructions)instructions
{
  return self->_instructions;
}

- (BOOL)hasCheckedInstructions
{
  return self->_hasCheckedInstructions;
}

- (BOOL)resolveComponents
{
  return self->_resolveComponents;
}

- (BOOL)resolveComponentStyles
{
  return self->_resolveComponentStyles;
}

- (BOOL)resolveComponentLayouts
{
  return self->_resolveComponentLayouts;
}

- (BOOL)resolveComponentTextStyles
{
  return self->_resolveComponentTextStyles;
}

- (BOOL)resolveTextStyles
{
  return self->_resolveTextStyles;
}

- (BOOL)resolveAutoplacement
{
  return self->_resolveAutoplacement;
}

- (BOOL)resolveDocumentStyle
{
  return self->_resolveDocumentStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructions, 0);
  objc_storeStrong((id *)&self->_documentStyleResolver, 0);
  objc_storeStrong((id *)&self->_suggestedArticlesAutoPlacementResolver, 0);
  objc_storeStrong((id *)&self->_advertisementAutoPlacementResolver, 0);
  objc_storeStrong((id *)&self->_componentTextStyleResolver, 0);
  objc_storeStrong((id *)&self->_componentLayoutResolver, 0);
  objc_storeStrong((id *)&self->_componentStyleResolver, 0);
  objc_storeStrong((id *)&self->_textStyleResolver, 0);
  objc_storeStrong((id *)&self->_componentResolver, 0);
  objc_storeStrong((id *)&self->_validationContextFactory, 0);
}

@end
