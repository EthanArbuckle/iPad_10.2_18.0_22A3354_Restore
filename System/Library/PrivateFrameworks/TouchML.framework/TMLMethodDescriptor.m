@implementation TMLMethodDescriptor

- (TMLMethodDescriptor)initWithName:(id)a3 returnType:(unint64_t)a4 parameters:(id)a5 methodSelector:(id)a6 attributes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  const char *v16;
  TMLMethodDescriptor *v17;
  double v18;
  uint64_t v19;
  NSString *methodName;
  const char *v21;
  double v22;
  uint64_t v23;
  NSArray *parameters;
  const char *v25;
  double v26;
  objc_super v28;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)TMLMethodDescriptor;
  v17 = -[TMLMethodDescriptor init](&v28, sel_init);
  if (v17)
  {
    v19 = objc_msgSend_copy(v12, v16, v18);
    methodName = v17->_methodName;
    v17->_methodName = (NSString *)v19;

    v17->_returnType = a4;
    v23 = objc_msgSend_copy(v13, v21, v22);
    parameters = v17->_parameters;
    v17->_parameters = (NSArray *)v23;

    objc_storeStrong((id *)&v17->_methodSelector, a6);
    v17->_optional = objc_msgSend_containsObject_(v15, v25, v26, CFSTR("optional"));
  }

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  const char *v6;
  double v7;
  NSString *methodName;
  void *v9;
  const char *v10;
  double v11;
  const char *v12;
  double v13;
  unint64_t returnType;
  const char *v15;
  double v16;
  uint64_t optional;
  const char *v18;
  double v19;
  const char *v20;
  uint64_t v21;
  double v22;
  const char *v23;
  double v24;
  NSArray *parameters;
  const char *v26;
  double v27;
  int v28;
  char isEqualToString;
  NSString *methodSelector;
  uint64_t v32;
  const char *v33;
  double v34;
  void *v35;
  NSString *v36;
  void *v37;
  const char *v38;
  double v39;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    methodName = self->_methodName;
    objc_msgSend_methodName(v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_isEqualToString_(methodName, v10, v11, v9)
      || (returnType = self->_returnType, returnType != objc_msgSend_returnType(v5, v12, v13))
      || (optional = self->_optional, (_DWORD)optional != objc_msgSend_isOptional(v5, v15, v16)))
    {
      isEqualToString = 0;
LABEL_11:

      goto LABEL_12;
    }
    v21 = objc_msgSend_count(self->_parameters, v18, v19);
    if (v21
      || (objc_msgSend_parameters(v5, v20, v22),
          optional = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_count((void *)optional, v23, v24)))
    {
      parameters = self->_parameters;
      objc_msgSend_parameters(v5, v20, v22);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqualToArray_(parameters, v26, v27, v3))
      {
        isEqualToString = 0;
        goto LABEL_17;
      }
      v28 = 1;
    }
    else
    {
      v28 = 0;
    }
    methodSelector = self->_methodSelector;
    objc_msgSend_methodSelector(v5, v20, v22);
    v32 = objc_claimAutoreleasedReturnValue();
    if (methodSelector == (NSString *)v32)
    {

      isEqualToString = 1;
      if (!v28)
      {
LABEL_18:
        if (!v21)

        goto LABEL_11;
      }
    }
    else
    {
      v35 = (void *)v32;
      v36 = self->_methodSelector;
      objc_msgSend_methodSelector(v5, v33, v34);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToString = objc_msgSend_isEqualToString_(v36, v38, v39, v37);

      if ((v28 & 1) == 0)
        goto LABEL_18;
    }
LABEL_17:

    goto LABEL_18;
  }
  isEqualToString = 0;
LABEL_12:

  return isEqualToString;
}

+ (id)methodSelectorForMethodName:(id)a3 parameters:(id)a4
{
  id v5;
  const char *v6;
  double v7;
  const char *v8;
  double v9;
  id v10;
  void *v11;

  v5 = a3;
  if (objc_msgSend_count(a4, v6, v7))
  {
    objc_msgSend_stringByAppendingString_(v5, v8, v9, CFSTR(":"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v5;
  }
  v11 = v10;

  return v11;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5;
  const char *v6;
  const char *v7;
  const char *v8;
  double v9;
  _BOOL4 optional;
  void *methodSelector;
  const char *v12;
  uint64_t v13;
  const char *v14;
  NSArray *parameters;
  _QWORD v16[5];

  v5 = sub_22AD3C724((uint64_t)a3);
  v7 = (const char *)objc_msgSend_UTF8String(self->_methodName, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  a3[1].var1 = self->_returnType;
  optional = self->_optional;
  LODWORD(a3[2].var2) = optional;
  HIDWORD(a3[2].var2) = 2 * optional;
  methodSelector = self->_methodSelector;
  if (methodSelector)
  {
    v12 = (const char *)objc_msgSend_UTF8String(methodSelector, v8, v9);
    methodSelector = strdup(v12);
  }
  *(_QWORD *)&a3[2].var1 = methodSelector;
  v13 = objc_msgSend_count(self->_parameters, v8, v9);
  a3[1].var2 = (ProtobufCMessageUnknownField *)v13;
  if (v13)
    v13 = (uint64_t)malloc_type_malloc(8 * v13, 0x2004093837F09uLL);
  a3[2].var0 = (ProtobufCMessageDescriptor *)v13;
  parameters = self->_parameters;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_22AD1E6EC;
  v16[3] = &unk_24F4FD3F0;
  v16[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(parameters, v14, COERCE_DOUBLE(3221225472), v16);
}

+ (id)decode:(const ProtobufCMessage *)a3
{
  double v3;
  const char *v6;
  void *v7;
  double v8;
  void *v9;
  id v10;
  const char *v11;
  double v12;
  id v13;
  const char *v14;
  double v15;
  void *v16;
  ProtobufCMessageUnknownField *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  id v26;
  const char *v27;
  double v28;
  void *v29;

  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, v3, a3[1].var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)&a3[2].var1)
  {
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (a3[1].var2)
  {
    v10 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v13 = (id)objc_msgSend_initWithCapacity_(v10, v11, v12, a3[1].var2);
  }
  else
  {
    v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  }
  v16 = v13;
  if (a3[1].var2)
  {
    v17 = 0;
    do
    {
      v18 = *((_QWORD *)&a3[2].var0->var0 + (_QWORD)v17);
      v19 = (void *)objc_opt_class();
      objc_msgSend_decode_(v19, v20, v21, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v16, v23, v24, v22);

      v17 = (ProtobufCMessageUnknownField *)((char *)v17 + 1);
    }
    while (v17 < a3[1].var2);
  }
  if (LODWORD(a3[2].var2) && (BYTE4(a3[2].var2) & 2) != 0)
  {
    objc_msgSend_setWithObject_(MEMORY[0x24BDBCF20], v14, v15, CFSTR("optional"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }
  v26 = objc_alloc((Class)a1);
  v29 = (void *)objc_msgSend_initWithName_returnType_parameters_methodSelector_attributes_(v26, v27, v28, v7, a3[1].var1, v16, v9, v25);

  return v29;
}

- (NSString)methodName
{
  return self->_methodName;
}

- (unint64_t)returnType
{
  return self->_returnType;
}

- (NSArray)parameters
{
  return self->_parameters;
}

- (NSString)methodSelector
{
  return self->_methodSelector;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_methodSelector, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_methodName, 0);
}

@end
