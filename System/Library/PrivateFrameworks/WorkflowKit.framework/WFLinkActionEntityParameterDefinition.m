@implementation WFLinkActionEntityParameterDefinition

- (WFLinkActionEntityParameterDefinition)initWithParameterMetadata:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  WFLinkActionEntityParameterDefinition *v12;
  objc_super v14;

  v5 = a3;
  objc_msgSend(v5, "valueType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    objc_msgSend(v5, "valueType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;

    objc_msgSend(v9, "memberValueType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v11 = v10;
      v6 = v11;
    }
    else
    {

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionEntityParameterDefinition.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueType"));
      v6 = 0;
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)WFLinkActionEntityParameterDefinition;
  v12 = -[WFLinkActionParameterDefinition initWithValueType:parameterMetadata:](&v14, sel_initWithValueType_parameterMetadata_, v6, v5);

  return v12;
}

- (Class)parameterClass
{
  return (Class)objc_opt_class();
}

- (id)entityMetadata
{
  void *v2;
  void *v3;

  -[WFLinkActionParameterDefinition typeSpecificMetadata](self, "typeSpecificMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("LNValueTypeSpecificMetadataKeyLinkEntityMetadata"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isUniqueEntity
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[WFLinkActionEntityParameterDefinition entityMetadata](self, "entityMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemProtocolMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D43A00]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "displayRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_localizedString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "value");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  WFLinkDynamicOptionSubstitutableState *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  WFLinkDynamicOptionSubstitutableState *v19;

  v4 = a3;
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFLinkActionParameterDefinition valueType](self, "valueType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "objectIsMemberOfType:", v5);

    if ((v7 & 1) == 0)
    {
      v8 = (void *)MEMORY[0x1E0C99DA0];
      v9 = *MEMORY[0x1E0C99768];
      -[WFLinkActionParameterDefinition valueType](self, "valueType");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D441A8]), "initWithValue:indentationLevel:", v4, 0);
    v12 = [WFLinkDynamicOptionSubstitutableState alloc];
    objc_msgSend(v11, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "wf_localizedString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "subtitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "wf_localizedString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "image");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "wf_image");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[WFLinkDynamicOptionSubstitutableState initWithValue:localizedTitle:localizedSubtitle:image:](v12, "initWithValue:localizedTitle:localizedSubtitle:image:", v11, v14, v16, v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

@end
