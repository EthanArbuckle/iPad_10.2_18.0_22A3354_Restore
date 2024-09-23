@implementation WBSParsecSchema

+ (id)schemaWithConstantValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(a1, "schemaWithExpectedClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__WBSParsecSchema_schemaWithConstantValue___block_invoke;
  v8[3] = &unk_1E4B3DA18;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "setValidationBlock:", v8);

  return v5;
}

uint64_t __43__WBSParsecSchema_schemaWithConstantValue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

+ (id)schemaForArrayWithElementSchema:(id)a3
{
  return (id)objc_msgSend(a1, "schemaForArrayWithElementSchema:associatedError:", a3, 0);
}

+ (id)schemaForDictionaryWithStructure:(id)a3
{
  return (id)objc_msgSend(a1, "schemaForDictionaryWithStructure:associatedError:", a3, 0);
}

+ (id)schemaWithExpectedClass:(Class)a3
{
  return (id)objc_msgSend(a1, "schemaWithExpectedClass:associatedError:", a3, 0);
}

+ (id)schemaForArrayWithElementSchema:(id)a3 associatedError:(id)a4
{
  return (id)objc_msgSend(a1, "schemaForArrayWithElementSchema:associatedError:isOptional:", a3, a4, 0);
}

+ (id)schemaForDictionaryWithStructure:(id)a3 associatedError:(id)a4
{
  return (id)objc_msgSend(a1, "schemaForDictionaryWithStructure:associatedError:isOptional:", a3, a4, 0);
}

+ (id)schemaWithExpectedClass:(Class)a3 associatedError:(id)a4
{
  return (id)objc_msgSend(a1, "schemaWithExpectedClass:associatedError:isOptional:", a3, a4, 0);
}

+ (id)schemaForArrayWithElementSchema:(id)a3 associatedError:(id)a4 isOptional:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  _WBSParsecArraySchema *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[_WBSParsecArraySchema initWithElementSchema:associatedError:isOptional:]([_WBSParsecArraySchema alloc], "initWithElementSchema:associatedError:isOptional:", v8, v7, v5);

  return v9;
}

+ (id)schemaForDictionaryWithStructure:(id)a3 associatedError:(id)a4 isOptional:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  _WBSParsecDictionarySchema *v9;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  v9 = -[_WBSParsecDictionarySchema initWithSchemaDictionary:associatedError:isOptional:]([_WBSParsecDictionarySchema alloc], "initWithSchemaDictionary:associatedError:isOptional:", v8, v7, v5);

  return v9;
}

+ (id)schemaWithExpectedClass:(Class)a3 associatedError:(id)a4 isOptional:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;

  v5 = a5;
  v8 = a4;
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithExpectedClass:associatedError:isOptional:", a3, v8, v5);

  return v9;
}

- (id)_initWithExpectedClass:(Class)a3 associatedError:(id)a4 isOptional:(BOOL)a5
{
  id v9;
  WBSParsecSchema *v10;
  WBSParsecSchema *v11;
  WBSParsecSchema *v12;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WBSParsecSchema;
  v10 = -[WBSParsecSchema init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_expectedClass, a3);
    objc_storeStrong((id *)&v11->_associatedError, a4);
    v11->_optional = a5;
    v12 = v11;
  }

  return v11;
}

- (void)validateObject:(id)a3 withErrorHandler:(id)a4
{
  -[WBSParsecSchema _validateChild:ofParent:withParentAssociatedError:errorHandler:](self, "_validateChild:ofParent:withParentAssociatedError:errorHandler:", a3, 0, 0, a4);
}

- (BOOL)_validateChild:(id)a3 ofParent:(id)a4 withParentAssociatedError:(id)a5 errorHandler:(id)a6
{
  id v10;
  id v11;
  NSError *v12;
  void (**v13)(id, id);
  NSError *associatedError;
  NSError *v15;
  NSObject *v16;
  Class expectedClass;
  NSObject *v18;
  id v19;
  uint64_t (**validationBlock)(id, id, id);
  void (**specializedSchemaBlock)(id, id, id);
  void *v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v28;
  int v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  Class v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = (NSError *)a5;
  v13 = (void (**)(id, id))a6;
  associatedError = self->_associatedError;
  if (!associatedError)
    associatedError = v12;
  v15 = associatedError;
  if (v10)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        expectedClass = self->_expectedClass;
        v18 = v16;
        v29 = 134349826;
        v30 = v10;
        v31 = 2050;
        v32 = v11;
        v33 = 2114;
        v34 = expectedClass;
        v35 = 2114;
        v36 = (id)objc_opt_class();
        v19 = v36;
        _os_log_error_impl(&dword_1A3D90000, v18, OS_LOG_TYPE_ERROR, "Child %{public}p of parent %{public}p: expected class %{public}@, actual class %{public}@", (uint8_t *)&v29, 0x2Au);

      }
LABEL_19:
      v13[2](v13, v15);
LABEL_20:
      v24 = 0;
      goto LABEL_21;
    }
  }
  else if (!self->_optional)
  {
    v26 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[WBSParsecSchema _validateChild:ofParent:withParentAssociatedError:errorHandler:].cold.1((uint64_t)v11, v26);
    goto LABEL_19;
  }
  validationBlock = (uint64_t (**)(id, id, id))self->_validationBlock;
  if (validationBlock && (validationBlock[2](validationBlock, v10, v11) & 1) == 0)
  {
    v25 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[WBSParsecSchema _validateChild:ofParent:withParentAssociatedError:errorHandler:].cold.3();
    goto LABEL_19;
  }
  specializedSchemaBlock = (void (**)(id, id, id))self->_specializedSchemaBlock;
  if (specializedSchemaBlock)
  {
    specializedSchemaBlock[2](specializedSchemaBlock, v10, v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22
      && (objc_msgSend(v22, "_validateChild:ofParent:withParentAssociatedError:errorHandler:", v10, v11, v15, v13) & 1) == 0)
    {
      v28 = WBS_LOG_CHANNEL_PREFIXSafariSuggestions();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[WBSParsecSchema _validateChild:ofParent:withParentAssociatedError:errorHandler:].cold.2();

      goto LABEL_20;
    }

  }
  v24 = 1;
LABEL_21:

  return v24;
}

- (id)validationBlock
{
  return self->_validationBlock;
}

- (void)setValidationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)specializedSchemaBlock
{
  return self->_specializedSchemaBlock;
}

- (void)setSpecializedSchemaBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (Class)expectedClass
{
  return self->_expectedClass;
}

- (void)setExpectedClass:(Class)a3
{
  objc_storeStrong((id *)&self->_expectedClass, a3);
}

- (NSError)associatedError
{
  return self->_associatedError;
}

- (void)setAssociatedError:(id)a3
{
  objc_storeStrong((id *)&self->_associatedError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedError, 0);
  objc_storeStrong((id *)&self->_expectedClass, 0);
  objc_storeStrong(&self->_specializedSchemaBlock, 0);
  objc_storeStrong(&self->_validationBlock, 0);
}

- (void)_validateChild:(uint64_t)a1 ofParent:(NSObject *)a2 withParentAssociatedError:errorHandler:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134349056;
  v3 = a1;
  _os_log_error_impl(&dword_1A3D90000, a2, OS_LOG_TYPE_ERROR, "Non-optional child of parent %{public}p was missing", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)_validateChild:ofParent:withParentAssociatedError:errorHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_14(&dword_1A3D90000, v0, v1, "Specialized schema validation failed on child %{public}p of parent %{public}p");
  OUTLINED_FUNCTION_2();
}

- (void)_validateChild:ofParent:withParentAssociatedError:errorHandler:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_8();
  OUTLINED_FUNCTION_0_14(&dword_1A3D90000, v0, v1, "Primary schema validation failed on child %{public}p of parent %{public}p");
  OUTLINED_FUNCTION_2();
}

@end
