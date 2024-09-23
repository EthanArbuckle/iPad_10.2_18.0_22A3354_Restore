@implementation WFContextualActionParameter

- (WFContextualActionParameter)initWithType:(id)a3 displayString:(id)a4 wfParameterKey:(id)a5 wfSerializedRepresentation:(id)a6 askEachTime:(BOOL)a7 askEachTimeCollectionFilter:(id)a8 actionInput:(BOOL)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  WFContextualActionParameter *v21;
  uint64_t v22;
  NSString *type;
  uint64_t v24;
  NSString *displayString;
  uint64_t v26;
  NSString *wfParameterKey;
  WFContextualActionParameter *v28;
  void *v30;
  objc_super v31;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionParameter.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type"));

  }
  v31.receiver = self;
  v31.super_class = (Class)WFContextualActionParameter;
  v21 = -[WFContextualActionParameter init](&v31, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v16, "copy");
    type = v21->_type;
    v21->_type = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    displayString = v21->_displayString;
    v21->_displayString = (NSString *)v24;

    v26 = objc_msgSend(v18, "copy");
    wfParameterKey = v21->_wfParameterKey;
    v21->_wfParameterKey = (NSString *)v26;

    objc_storeStrong((id *)&v21->_wfSerializedRepresentation, a6);
    v21->_askEachTime = a7;
    objc_storeStrong((id *)&v21->_askEachTimeCollectionFilter, a8);
    v21->_actionInput = a9;
    v28 = v21;
  }

  return v21;
}

- (WFContextualActionParameter)initWithType:(id)a3 displayString:(id)a4 wfParameterKey:(id)a5 wfSerializedRepresentation:(id)a6
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:askEachTime:askEachTimeCollectionFilter:actionInput:](self, "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:askEachTime:askEachTimeCollectionFilter:actionInput:", a3, a4, a5, a6, 0, 0, v7);
}

- (WFContextualActionParameter)initWithType:(id)a3 displayString:(id)a4 wfParameterKey:(id)a5 askEachTime:(BOOL)a6
{
  uint64_t v7;

  LOBYTE(v7) = 0;
  return -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:askEachTime:askEachTimeCollectionFilter:actionInput:](self, "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:askEachTime:askEachTimeCollectionFilter:actionInput:", a3, a4, a5, 0, a6, 0, v7);
}

- (WFContextualActionParameter)initWithType:(id)a3 displayString:(id)a4 wfParameterKey:(id)a5 askEachTime:(BOOL)a6 askEachTimeCollectionFilter:(id)a7
{
  uint64_t v8;

  LOBYTE(v8) = 0;
  return -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:askEachTime:askEachTimeCollectionFilter:actionInput:](self, "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:askEachTime:askEachTimeCollectionFilter:actionInput:", a3, a4, a5, 0, a6, a7, v8);
}

- (WFContextualActionParameter)initWithType:(id)a3 displayString:(id)a4 wfParameterKey:(id)a5 isActionInput:(BOOL)a6
{
  uint64_t v7;

  LOBYTE(v7) = a6;
  return -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:askEachTime:askEachTimeCollectionFilter:actionInput:](self, "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:askEachTime:askEachTimeCollectionFilter:actionInput:", a3, a4, a5, 0, 0, 0, v7);
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  unint64_t v21;

  v3 = (void *)objc_opt_new();
  -[WFContextualActionParameter type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFContextualActionParameter type](self, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v5);

  }
  -[WFContextualActionParameter wfParameterKey](self, "wfParameterKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[WFContextualActionParameter wfParameterKey](self, "wfParameterKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v8);

  }
  -[WFContextualActionParameter displayString](self, "displayString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[WFContextualActionParameter displayString](self, "displayString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v11);

  }
  -[WFContextualActionParameter wfSerializedRepresentation](self, "wfSerializedRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[WFContextualActionParameter wfSerializedRepresentation](self, "wfSerializedRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v14);

  }
  v16 = (id)objc_msgSend(v3, "combineBool:", -[WFContextualActionParameter isAskEachTime](self, "isAskEachTime"));
  -[WFContextualActionParameter askEachTimeCollectionFilter](self, "askEachTimeCollectionFilter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[WFContextualActionParameter askEachTimeCollectionFilter](self, "askEachTimeCollectionFilter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v18);

  }
  v20 = (id)objc_msgSend(v3, "combineBool:", -[WFContextualActionParameter isActionInput](self, "isActionInput"));
  v21 = objc_msgSend(v3, "finalize");

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  WFContextualActionParameter *v4;
  WFContextualActionParameter *v5;
  WFContextualActionParameter *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  int v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  void *v37;
  _BOOL4 v38;
  id v39;
  int v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;

  v4 = (WFContextualActionParameter *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_48:

      goto LABEL_49;
    }
    -[WFContextualActionParameter type](v6, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualActionParameter type](self, "type");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_46;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_47:

        goto LABEL_48;
      }
    }
    -[WFContextualActionParameter wfParameterKey](v6, "wfParameterKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualActionParameter wfParameterKey](self, "wfParameterKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
        goto LABEL_45;
      v21 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v21)
      {
        LOBYTE(v12) = 0;
LABEL_46:

        goto LABEL_47;
      }
    }
    -[WFContextualActionParameter displayString](v6, "displayString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualActionParameter displayString](self, "displayString");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v22;
    v24 = v23;
    v19 = v24;
    v46 = v20;
    if (v20 == v24)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v25 = v24;
      if (!v20 || !v24)
        goto LABEL_44;
      v12 = objc_msgSend(v20, "isEqualToString:", v24);

      if (!v12)
        goto LABEL_45;
    }
    v44 = v19;
    -[WFContextualActionParameter wfSerializedRepresentation](v6, "wfSerializedRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualActionParameter wfSerializedRepresentation](self, "wfSerializedRepresentation");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v26;
    v28 = v27;
    v29 = v20;
    v45 = v28;
    if (v20 != v28)
    {
      LOBYTE(v12) = 0;
      if (v20)
      {
        v30 = v28;
        if (v28)
        {
          v31 = objc_msgSend(v20, "isEqual:", v28);

          if (!v31)
            goto LABEL_31;
LABEL_30:
          v32 = -[WFContextualActionParameter isAskEachTime](v6, "isAskEachTime");
          if (v32 != -[WFContextualActionParameter isAskEachTime](self, "isAskEachTime"))
          {
LABEL_31:
            LOBYTE(v12) = 0;
LABEL_43:
            v19 = v44;
            v25 = v45;
LABEL_44:

            v20 = v46;
LABEL_45:

            goto LABEL_46;
          }
          -[WFContextualActionParameter askEachTimeCollectionFilter](v6, "askEachTimeCollectionFilter");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFContextualActionParameter askEachTimeCollectionFilter](self, "askEachTimeCollectionFilter");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v33;
          v36 = v34;
          v43 = v35;
          if (v35 == v36)
          {
            v42 = v36;

          }
          else
          {
            if (!v35 || !v36)
            {
              v39 = v36;

              v30 = v39;
              LOBYTE(v12) = 0;
              v29 = v20;
              v20 = v43;
              goto LABEL_42;
            }
            v37 = v36;
            v41 = objc_msgSend(v43, "isEqual:", v36);
            v42 = v37;

            if (!v41)
            {
              LOBYTE(v12) = 0;
LABEL_40:
              v29 = v20;
              v30 = v42;
              v20 = v43;
              goto LABEL_42;
            }
          }
          v38 = -[WFContextualActionParameter isActionInput](v6, "isActionInput");
          v12 = v38 ^ -[WFContextualActionParameter isActionInput](self, "isActionInput") ^ 1;
          goto LABEL_40;
        }
      }
      else
      {
        v30 = v28;
        v20 = 0;
      }
LABEL_42:

      v20 = v29;
      goto LABEL_43;
    }

    goto LABEL_30;
  }
  LOBYTE(v12) = 1;
LABEL_49:

  return v12;
}

- (WFContextualActionParameter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  void *v17;
  WFContextualActionParameter *v18;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("wfParameterKey"));
  v21 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("askEachTimeCollectionFilter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("wfSerializedRepresentation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("askEachTime"));
  v16 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("actionInput"));

  if (v5)
  {
    LOBYTE(v20) = v16;
    v17 = (void *)v21;
    self = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:askEachTime:askEachTimeCollectionFilter:actionInput:](self, "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:askEachTime:askEachTimeCollectionFilter:actionInput:", v5, v6, v21, v14, v15, v7, v20);
    v18 = self;
  }
  else
  {
    v18 = 0;
    v17 = (void *)v21;
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayString, CFSTR("displayString"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wfParameterKey, CFSTR("wfParameterKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wfSerializedRepresentation, CFSTR("wfSerializedRepresentation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_askEachTime, CFSTR("askEachTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_askEachTimeCollectionFilter, CFSTR("askEachTimeCollectionFilter"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_actionInput, CFSTR("actionInput"));

}

- (NSString)type
{
  return self->_type;
}

- (NSString)displayString
{
  return self->_displayString;
}

- (NSString)wfParameterKey
{
  return self->_wfParameterKey;
}

- (WFPropertyListObject)wfSerializedRepresentation
{
  return self->_wfSerializedRepresentation;
}

- (BOOL)isAskEachTime
{
  return self->_askEachTime;
}

- (WFDisambiguationCollectionFilter)askEachTimeCollectionFilter
{
  return self->_askEachTimeCollectionFilter;
}

- (BOOL)isActionInput
{
  return self->_actionInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_askEachTimeCollectionFilter, 0);
  objc_storeStrong((id *)&self->_wfSerializedRepresentation, 0);
  objc_storeStrong((id *)&self->_wfParameterKey, 0);
  objc_storeStrong((id *)&self->_displayString, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
