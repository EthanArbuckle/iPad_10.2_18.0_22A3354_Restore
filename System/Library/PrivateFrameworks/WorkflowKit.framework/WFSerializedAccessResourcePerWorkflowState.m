@implementation WFSerializedAccessResourcePerWorkflowState

- (WFSerializedAccessResourcePerWorkflowState)initWithIdentifier:(id)a3 data:(id)a4
{
  id v7;
  id v8;
  void *v9;
  WFSerializedAccessResourcePerWorkflowState *v10;
  uint64_t v11;
  NSString *identifier;
  uint64_t v13;
  NSData *data;
  WFSerializedAccessResourcePerWorkflowState *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSerializedAccessResourcePerWorkflowState.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSerializedAccessResourcePerWorkflowState.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)WFSerializedAccessResourcePerWorkflowState;
  v10 = -[WFSerializedAccessResourcePerWorkflowState init](&v19, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    identifier = v10->_identifier;
    v10->_identifier = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    data = v10->_data;
    v10->_data = (NSData *)v13;

    v15 = v10;
  }

  return v10;
}

- (WFSerializedAccessResourcePerWorkflowState)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFSerializedAccessResourcePerWorkflowState *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v5 && v6)
  {
    self = -[WFSerializedAccessResourcePerWorkflowState initWithIdentifier:data:](self, "initWithIdentifier:data:", v5, v6);
    v7 = self;
  }

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("identifier");
  -[WFSerializedAccessResourcePerWorkflowState identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("data");
  v8[0] = v3;
  -[WFSerializedAccessResourcePerWorkflowState data](self, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[WFSerializedAccessResourcePerWorkflowState identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "compare:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  WFSerializedAccessResourcePerWorkflowState *v4;
  WFSerializedAccessResourcePerWorkflowState *v5;
  WFSerializedAccessResourcePerWorkflowState *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (WFSerializedAccessResourcePerWorkflowState *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[WFSerializedAccessResourcePerWorkflowState identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFSerializedAccessResourcePerWorkflowState identifier](v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", v8))
      {
        -[WFSerializedAccessResourcePerWorkflowState data](self, "data");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFSerializedAccessResourcePerWorkflowState data](v6, "data");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToData:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[WFSerializedAccessResourcePerWorkflowState identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[WFSerializedAccessResourcePerWorkflowState data](self, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)data
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
