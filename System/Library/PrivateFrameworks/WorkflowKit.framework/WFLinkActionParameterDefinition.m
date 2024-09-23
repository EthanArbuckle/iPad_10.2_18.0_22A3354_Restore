@implementation WFLinkActionParameterDefinition

- (WFLinkActionParameterDefinition)initWithValueType:(id)a3 parameterMetadata:(id)a4
{
  id v8;
  id v9;
  void *v10;
  WFLinkActionParameterDefinition *v11;
  WFLinkActionParameterDefinition *v12;
  WFLinkActionParameterDefinition *v13;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionParameterDefinition.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("valueType"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFLinkActionParameterDefinition.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parameterMetadata"));

LABEL_3:
  v17.receiver = self;
  v17.super_class = (Class)WFLinkActionParameterDefinition;
  v11 = -[WFLinkActionParameterDefinition init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_valueType, a3);
    objc_storeStrong((id *)&v12->_parameterMetadata, a4);
    v13 = v12;
  }

  return v12;
}

- (WFParameterDefinition)parameterDefinitionDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFParameterDefinition *v16;

  v3 = (void *)objc_opt_new();
  -[WFLinkActionParameterDefinition parameterMetadata](self, "parameterMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v5, CFSTR("Key"));

  -[WFLinkActionParameterDefinition parameterMetadata](self, "parameterMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wf_localizedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v7, CFSTR("Label"));

  -[WFLinkActionParameterDefinition parameterMetadata](self, "parameterMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wf_localizedTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v9, CFSTR("Placeholder"));

  -[WFLinkActionParameterDefinition parameterMetadata](self, "parameterMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "wf_localizedDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v11, CFSTR("Description"));

  NSStringFromClass(-[WFLinkActionParameterDefinition parameterClass](self, "parameterClass"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v12, CFSTR("Class"));

  -[WFLinkActionParameterDefinition typeSpecificMetadata](self, "typeSpecificMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0D43AE0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFLinkActionParameterDefinition defaultSerializedRepresentationFromParameterMetadataDefaultValue:](self, "defaultSerializedRepresentationFromParameterMetadataDefaultValue:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "if_setObjectIfNonNil:forKey:", v15, CFSTR("DefaultValue"));

  v16 = -[WFParameterDefinition initWithDictionary:]([WFParameterDefinition alloc], "initWithDictionary:", v3);
  return v16;
}

- (LNActionParameterMetadata)parameterMetadata
{
  return self->_parameterMetadata;
}

- (id)objectForTypeSpecificMetadataKey:(id)a3 ofClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  Class v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[WFLinkActionParameterDefinition typeSpecificMetadata](self, "typeSpecificMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  if (v9 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      v14 = 136315906;
      v15 = "WFEnforceClass";
      v16 = 2114;
      v17 = v9;
      v18 = 2114;
      v19 = (id)objc_opt_class();
      v20 = 2114;
      v21 = a4;
      v12 = v19;
      _os_log_impl(&dword_1C15B3000, v11, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v14, 0x2Au);

    }
    v10 = 0;
  }
  else
  {
    v10 = v9;
  }

  return v10;
}

- (NSDictionary)typeSpecificMetadata
{
  void *v2;
  void *v3;

  -[WFLinkActionParameterDefinition parameterMetadata](self, "parameterMetadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "typeSpecificMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValue:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  id v7;

  v4 = a3;
  -[WFLinkActionParameterDefinition valueType](self, "valueType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectClass");
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v7 = v4;
  else
    v7 = 0;

  return v7;
}

- (LNValueType)valueType
{
  return self->_valueType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameterMetadata, 0);
  objc_storeStrong((id *)&self->_valueType, 0);
}

- (id)linkValueWithValue:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id v26;
  int v28;
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v5 = 0;
    goto LABEL_30;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0D43E38]);
      objc_msgSend(MEMORY[0x1E0D43D10], "fileValueType");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (id)objc_msgSend(v9, "initWithValue:valueType:", v8, v10);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[WFLinkActionParameterDefinition valueType](self, "valueType");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "value");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "objectIsMemberOfType:", v12);

        if (v13)
        {
          v5 = v6;
LABEL_29:

          goto LABEL_30;
        }
      }
      v14 = v6;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
      v10 = v15;

      if (objc_msgSend(v10, "count"))
      {
        v16 = objc_alloc(MEMORY[0x1E0D43E38]);
        v17 = objc_alloc(MEMORY[0x1E0D43BD0]);
        objc_msgSend(v10, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "valueType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v17, "initWithMemberValueType:", v19);
        v5 = (id)objc_msgSend(v16, "initWithValue:valueType:", v14, v20);

      }
      else
      {
        -[WFLinkActionParameterDefinition valueType](self, "valueType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "objectIsMemberOfType:", v14);

        if ((v22 & 1) == 0)
        {
          getWFAppIntentsLogObject();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          {
            -[WFLinkActionParameterDefinition valueType](self, "valueType");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = 136315650;
            v29 = "-[WFLinkActionParameterDefinition linkValueWithValue:]";
            v30 = 2112;
            v31 = v14;
            v32 = 2112;
            v33 = v24;

          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          getWFAppIntentsLogObject();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            v28 = 136315138;
            v29 = "-[WFLinkActionParameterDefinition linkValueWithValue:]";
            _os_log_impl(&dword_1C15B3000, v25, OS_LOG_TYPE_DEBUG, "%s Temporarily returning nil for a NSDictionary used to initialize a LNValue", (uint8_t *)&v28, 0xCu);
          }

          v5 = 0;
          goto LABEL_28;
        }
        v26 = objc_alloc(MEMORY[0x1E0D43E38]);
        -[WFLinkActionParameterDefinition valueType](self, "valueType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = (id)objc_msgSend(v26, "initWithValue:valueType:", v14, v18);
      }

    }
LABEL_28:

    goto LABEL_29;
  }
  v5 = v4;
LABEL_30:

  return v5;
}

- (id)linkValueFromParameterState:(id)a3 action:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;
  objc_msgSend(v7, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)getLinkValueFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 runningFromToolKit:(BOOL)a6 completionHandler:(id)a7
{
  id v10;
  id v11;

  v10 = a7;
  -[WFLinkActionParameterDefinition linkValueWithValue:](self, "linkValueWithValue:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a7 + 2))(v10, v11, 0);

}

- (Class)parameterClass
{
  Class result;

  result = (Class)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[WFLinkActionParameterDefinition parameterClassWithParameterMetadata:] must be overridden"));
  __break(1u);
  return result;
}

- (id)defaultSerializedRepresentationFromParameterMetadataDefaultValues:(id)a3
{
  return 0;
}

- (id)parameterStateFromLinkValue:(id)a3
{
  id v3;
  id result;

  v3 = a3;
  result = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[WFLinkActionParameterDefinition parameterStateFromLinkValue:] must be overridden"));
  __break(1u);
  return result;
}

- (id)localizedTitleForLinkValue:(id)a3
{
  id v3;
  id result;

  v3 = a3;
  result = (id)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("-[WFLinkActionParameterDefinition localizedTitleForValue:parameterMetadata:] must be overridden"));
  __break(1u);
  return result;
}

- (int64_t)integerForTypeSpecificMetadataKey:(id)a3 defaultValue:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    a4 = objc_msgSend(v7, "integerValue");

  return a4;
}

- (BOOL)BOOLForTypeSpecificMetadataKey:(id)a3 defaultValue:(BOOL)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[WFLinkActionParameterDefinition objectForTypeSpecificMetadataKey:ofClass:](self, "objectForTypeSpecificMetadataKey:ofClass:", v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    a4 = objc_msgSend(v7, "BOOLValue");

  return a4;
}

- (void)getLinkArrayValuesFromProcessedParameterValue:(id)a3 parameterState:(id)a4 permissionRequestor:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD, _QWORD))a6 + 2))(a6, 0, 0);
}

@end
