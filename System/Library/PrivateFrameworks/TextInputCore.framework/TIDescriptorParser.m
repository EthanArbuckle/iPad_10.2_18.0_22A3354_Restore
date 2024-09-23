@implementation TIDescriptorParser

- (TIDescriptorParser)initWithErrorCode:(int64_t)a3
{
  TIDescriptorParser *v4;
  TIDescriptorParser *v5;
  uint64_t v6;
  NSMutableDictionary *context;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TIDescriptorParser;
  v4 = -[TIDescriptorParser init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_errorCode = a3;
    v6 = objc_opt_new();
    context = v5->_context;
    v5->_context = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (id)parseStringForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v7 = a5;
  v10 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__TIDescriptorParser_parseStringForKey_fromConfig_required_errors___block_invoke;
  v14[3] = &unk_1EA0F9D38;
  v14[4] = self;
  v15 = v10;
  v11 = v10;
  -[TIDescriptorParser parseObjectForKey:fromConfig:required:errors:validate:](self, "parseObjectForKey:fromConfig:required:errors:validate:", v11, a4, v7, a6, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)parseIntegerForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v7 = a5;
  v10 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__TIDescriptorParser_parseIntegerForKey_fromConfig_required_errors___block_invoke;
  v14[3] = &unk_1EA0F9D38;
  v14[4] = self;
  v15 = v10;
  v11 = v10;
  -[TIDescriptorParser parseObjectForKey:fromConfig:required:errors:validate:](self, "parseObjectForKey:fromConfig:required:errors:validate:", v11, a4, v7, a6, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)parseFloatForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v7 = a5;
  v10 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__TIDescriptorParser_parseFloatForKey_fromConfig_required_errors___block_invoke;
  v14[3] = &unk_1EA0F9D38;
  v14[4] = self;
  v15 = v10;
  v11 = v10;
  -[TIDescriptorParser parseObjectForKey:fromConfig:required:errors:validate:](self, "parseObjectForKey:fromConfig:required:errors:validate:", v11, a4, v7, a6, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)parseNumberForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v7 = a5;
  v10 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__TIDescriptorParser_parseNumberForKey_fromConfig_required_errors___block_invoke;
  v14[3] = &unk_1EA0F9D38;
  v14[4] = self;
  v15 = v10;
  v11 = v10;
  -[TIDescriptorParser parseObjectForKey:fromConfig:required:errors:validate:](self, "parseObjectForKey:fromConfig:required:errors:validate:", v11, a4, v7, a6, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)parseBooleanForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v7 = a5;
  v10 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__TIDescriptorParser_parseBooleanForKey_fromConfig_required_errors___block_invoke;
  v14[3] = &unk_1EA0F9D38;
  v14[4] = self;
  v15 = v10;
  v11 = v10;
  -[TIDescriptorParser parseObjectForKey:fromConfig:required:errors:validate:](self, "parseObjectForKey:fromConfig:required:errors:validate:", v11, a4, v7, a6, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)parseArrayForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v7 = a5;
  v10 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __66__TIDescriptorParser_parseArrayForKey_fromConfig_required_errors___block_invoke;
  v14[3] = &unk_1EA0F9D38;
  v14[4] = self;
  v15 = v10;
  v11 = v10;
  -[TIDescriptorParser parseObjectForKey:fromConfig:required:errors:validate:](self, "parseObjectForKey:fromConfig:required:errors:validate:", v11, a4, v7, a6, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)parseDictionaryForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v7 = a5;
  v10 = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__TIDescriptorParser_parseDictionaryForKey_fromConfig_required_errors___block_invoke;
  v14[3] = &unk_1EA0F9D38;
  v14[4] = self;
  v15 = v10;
  v11 = v10;
  -[TIDescriptorParser parseObjectForKey:fromConfig:required:errors:validate:](self, "parseObjectForKey:fromConfig:required:errors:validate:", v11, a4, v7, a6, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)parseObjectForKey:(id)a3 fromConfig:(id)a4 required:(BOOL)a5 errors:(id)a6 validate:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  void (**v14)(id, void *);
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v9 = a5;
  v12 = a3;
  v13 = a6;
  v14 = (void (**)(id, void *))a7;
  objc_msgSend(a4, "objectForKey:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v14[2](v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v9)
    {
LABEL_9:
      v18 = v15;
      v17 = 0;
      goto LABEL_10;
    }
    -[TIDescriptorParser missingValueErrorForKey:](self, "missingValueErrorForKey:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v16;
  if (!v16)
    goto LABEL_9;
  if (v13)
    objc_msgSend(v13, "addObject:", v16);
  v18 = 0;
LABEL_10:

  return v18;
}

- (id)missingValueErrorForKey:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Key '%@' is missing."), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDescriptorParser errorWithMessage:](self, "errorWithMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)invalidValueErrorForKey:(id)a3 withValue:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Key '%@' value is invalid."), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDescriptorParser errorWithMessage:andValue:](self, "errorWithMessage:andValue:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)invalidDataTypeErrorForKey:(id)a3 withValue:(id)a4 dataType:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a4;
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Key '%@' data type must be '%@'."), a3, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIDescriptorParser errorWithMessage:andValue:](self, "errorWithMessage:andValue:", v10, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)errorWithMessage:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("message");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIDescriptorParser errorWithDetails:](self, "errorWithDetails:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)errorWithMessage:(id)a3 andValue:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TIDescriptorParser boxNilForValue:](self, "boxNilForValue:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("message");
  v11[1] = CFSTR("value");
  v12[0] = v6;
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TIDescriptorParser errorWithDetails:](self, "errorWithDetails:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)errorWithDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[TIDescriptorParser context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v6);

  objc_msgSend(v5, "addEntriesFromDictionary:", v4);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TIDescriptorErrorDomain"), -[TIDescriptorParser errorCode](self, "errorCode"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)boxNilForValue:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (NSMutableDictionary)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

id __71__TIDescriptorParser_parseDictionaryForKey_fromConfig_required_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_msgSend(MEMORY[0x1E0DBDB38], "isDictionary:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidDataTypeErrorForKey:withValue:dataType:", *(_QWORD *)(a1 + 40), v3, CFSTR("dictionary"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id __66__TIDescriptorParser_parseArrayForKey_fromConfig_required_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_msgSend(MEMORY[0x1E0DBDB38], "isArray:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidDataTypeErrorForKey:withValue:dataType:", *(_QWORD *)(a1 + 40), v3, CFSTR("array"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id __68__TIDescriptorParser_parseBooleanForKey_fromConfig_required_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_msgSend(MEMORY[0x1E0DBDB38], "isBoolean:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidDataTypeErrorForKey:withValue:dataType:", *(_QWORD *)(a1 + 40), v3, CFSTR("BOOLean"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id __67__TIDescriptorParser_parseNumberForKey_fromConfig_required_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_msgSend(MEMORY[0x1E0DBDB38], "isNumber:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidDataTypeErrorForKey:withValue:dataType:", *(_QWORD *)(a1 + 40), v3, CFSTR("number"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id __66__TIDescriptorParser_parseFloatForKey_fromConfig_required_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_msgSend(MEMORY[0x1E0DBDB38], "isFloat:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidDataTypeErrorForKey:withValue:dataType:", *(_QWORD *)(a1 + 40), v3, CFSTR("float"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id __68__TIDescriptorParser_parseIntegerForKey_fromConfig_required_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if ((objc_msgSend(MEMORY[0x1E0DBDB38], "isInteger:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidDataTypeErrorForKey:withValue:dataType:", *(_QWORD *)(a1 + 40), v3, CFSTR("integer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id __67__TIDescriptorParser_parseStringForKey_fromConfig_required_errors___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(MEMORY[0x1E0DBDB38], "isString:", v3) && objc_msgSend(v3, "length"))
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "invalidDataTypeErrorForKey:withValue:dataType:", *(_QWORD *)(a1 + 40), v3, CFSTR("string"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

@end
