@implementation WFSliderParameter

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (WFSliderParameter)initWithDefinition:(id)a3
{
  id v4;
  WFSliderParameter *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  WFSliderParameter *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFSliderParameter;
  v5 = -[WFParameter initWithDefinition:](&v18, sel_initWithDefinition_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("MinimumValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    WFEnforceClass(v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = &unk_1E7B8BD58;
    objc_storeStrong((id *)&v5->_minimumValue, v10);

    objc_msgSend(v4, "objectForKey:", CFSTR("MaximumValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    WFEnforceClass(v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = &unk_1E7B8BD70;
    objc_storeStrong((id *)&v5->_maximumValue, v15);

    v16 = v5;
  }

  return v5;
}

- (id)defaultSerializedRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFSliderParameter;
  -[WFParameter defaultSerializedRepresentation](&v8, sel_defaultSerializedRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WFSliderParameter minimumValue](self, "minimumValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFNumberSubstitutableState serializedRepresentationFromNumber:](WFNumberSubstitutableState, "serializedRepresentationFromNumber:", v6);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)shouldAlignLabels
{
  return 1;
}

- (void)setMinimumValue:(id)a3
{
  id v4;
  NSNumber *v5;
  void *v6;
  char v7;
  NSNumber *minimumValue;

  v4 = &unk_1E7B8BD58;
  if (a3)
    v4 = a3;
  v5 = (NSNumber *)v4;
  -[WFSliderParameter minimumValue](self, "minimumValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToNumber:", v5);

  minimumValue = self->_minimumValue;
  self->_minimumValue = v5;

  if ((v7 & 1) == 0)
  {
    -[WFParameter attributesDidChange](self, "attributesDidChange");
    -[WFParameter defaultSerializedRepresentationDidChange](self, "defaultSerializedRepresentationDidChange");
  }
}

- (void)setMaximumValue:(id)a3
{
  id v4;
  NSNumber *v5;
  void *v6;
  char v7;
  NSNumber *maximumValue;

  v4 = &unk_1E7B8BD70;
  if (a3)
    v4 = a3;
  v5 = (NSNumber *)v4;
  -[WFSliderParameter maximumValue](self, "maximumValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToNumber:", v5);

  maximumValue = self->_maximumValue;
  self->_maximumValue = v5;

  if ((v7 & 1) == 0)
    -[WFParameter attributesDidChange](self, "attributesDidChange");
}

- (WFImage)minimumIcon
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[WFParameter definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("MinimumIconName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  WFEnforceClass(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC7B70], "workflowKitImageNamed:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (WFImage *)v6;
}

- (WFImage)maximumIcon
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[WFParameter definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("MaximumIconName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  WFEnforceClass(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC7B70], "workflowKitImageNamed:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return (WFImage *)v6;
}

- (id)localizedLabelWithState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;

  v4 = a3;
  objc_msgSend(v4, "variable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFParameter localizedLabel](self, "localizedLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
      objc_msgSend(v4, "number");
    else
      -[WFSliderParameter minimumValue](self, "minimumValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    -[WFSliderParameter minimumValue](self, "minimumValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    -[WFSliderParameter maximumValue](self, "maximumValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;

    v16 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (v9 - v12) / (v15 - v12));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringFromNumber:numberStyle:", v17, 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

@end
