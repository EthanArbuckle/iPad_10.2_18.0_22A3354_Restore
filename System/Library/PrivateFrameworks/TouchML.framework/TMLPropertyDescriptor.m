@implementation TMLPropertyDescriptor

- (TMLPropertyDescriptor)initWithName:(id)a3 type:(unint64_t)a4 attributes:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  TMLPropertyDescriptor *v15;

  v8 = a5;
  v9 = a3;
  objc_msgSend_typeNameForType_(TMLTypeRegistry, v10, v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (TMLPropertyDescriptor *)objc_msgSend_initWithName_typeName_attributes_(self, v13, v14, v9, v12, v8);

  return v15;
}

- (TMLPropertyDescriptor)initWithName:(id)a3 typeName:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  TMLPropertyDescriptor *v12;
  double v13;
  uint64_t v14;
  NSString *propertyName;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  uint64_t v20;
  NSString *propertyType;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)TMLPropertyDescriptor;
  v12 = -[TMLPropertyDescriptor init](&v27, sel_init);
  if (v12)
  {
    v14 = objc_msgSend_copy(v8, v11, v13);
    propertyName = v12->_propertyName;
    v12->_propertyName = (NSString *)v14;

    v12->_type = objc_msgSend_typeForTypeName_(TMLTypeRegistry, v16, v17, v9);
    v20 = objc_msgSend_copy(v9, v18, v19);
    propertyType = v12->_propertyType;
    v12->_propertyType = (NSString *)v20;

    v12->_readonly = objc_msgSend_containsObject_(v10, v22, v23, CFSTR("readonly"));
    v12->_optional = objc_msgSend_containsObject_(v10, v24, v25, CFSTR("optional"));
  }

  return v12;
}

- (NSString)typeClassName
{
  double v2;

  if (self->_type == 16)
    return self->_propertyType;
  objc_msgSend_classNameForType_(TMLTypeRegistry, a2, v2);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)description
{
  return self->_propertyType;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  NSString *propertyName;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  uint64_t v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  int readonly;
  const char *v27;
  double v28;
  int optional;
  BOOL v30;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    propertyName = self->_propertyName;
    objc_msgSend_propertyName(v4, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(propertyName, v9, v10, v8))
    {
      objc_msgSend_typeClassName(self, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_typeClassName(v4, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToString_(v13, v17, v18, v16)
        && (v21 = objc_msgSend_type(self, v19, v20), v21 == objc_msgSend_type(v4, v22, v23))
        && (readonly = self->_readonly, readonly == objc_msgSend_isReadonly(v4, v24, v25)))
      {
        optional = self->_optional;
        v30 = optional == objc_msgSend_isOptional(v4, v27, v28);
      }
      else
      {
        v30 = 0;
      }

    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (BOOL)canMergeFromPropertyDescriptor:(id)a3
{
  id v4;
  NSString *propertyName;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  uint64_t v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  int readonly;
  const char *v27;
  double v28;
  int optional;
  const char *v30;
  double v31;
  int v32;

  v4 = a3;
  propertyName = self->_propertyName;
  objc_msgSend_propertyName(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(propertyName, v9, v10, v8))
  {
    objc_msgSend_typeClassName(self, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_typeClassName(v4, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_isEqualToString_(v13, v17, v18, v16))
    {
      v21 = objc_msgSend_type(self, v19, v20);
      if (v21 == objc_msgSend_type(v4, v22, v23))
      {
        readonly = self->_readonly;
        if (readonly == objc_msgSend_isReadonly(v4, v24, v25)
          || self->_readonly && (objc_msgSend_isReadonly(v4, v27, v28) & 1) == 0)
        {
          optional = self->_optional;
          if (optional == objc_msgSend_isOptional(v4, v27, v28))
          {
            LOBYTE(v32) = 1;
LABEL_13:

            goto LABEL_14;
          }
          if (self->_optional)
          {
            v32 = objc_msgSend_isOptional(v4, v30, v31) ^ 1;
            goto LABEL_13;
          }
        }
      }
    }
    LOBYTE(v32) = 0;
    goto LABEL_13;
  }
  LOBYTE(v32) = 0;
LABEL_14:

  return v32;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5;
  const char *v6;
  const char *v7;
  const char *v8;
  double v9;
  const char *v10;
  _BOOL4 readonly;
  _BOOL4 optional;
  _BOOL4 v13;

  v5 = sub_22AD3C650(a3);
  v7 = (const char *)objc_msgSend_UTF8String(self->_propertyName, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  v10 = (const char *)objc_msgSend_UTF8String(self->_propertyType, v8, v9);
  *(_QWORD *)&a3[1].var1 = strdup(v10);
  readonly = self->_readonly;
  optional = self->_optional;
  v13 = self->_optional;
  if (self->_readonly)
    optional = 1;
  LODWORD(a3[1].var2) = optional;
  HIDWORD(a3[1].var2) = readonly | (2 * v13);
}

+ (id)decode:(const ProtobufCMessage *)a3
{
  double v3;
  void *v6;
  const char *v7;
  double v8;
  const char *v9;
  void *v10;
  double v11;
  id v12;
  const char *v13;
  double v14;
  void *v15;
  int var2_high;
  id v17;
  const char *v18;
  double v19;
  void *v20;

  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, v3, a3[1].var0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v7, v8, *(_QWORD *)&a3[1].var1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (LODWORD(a3[1].var2))
  {
    v12 = objc_alloc(MEMORY[0x24BDBCEF0]);
    v15 = (void *)objc_msgSend_initWithCapacity_(v12, v13, v14, 2);
  }
  else
  {
    v15 = 0;
  }
  var2_high = HIDWORD(a3[1].var2);
  if ((var2_high & 2) != 0)
  {
    objc_msgSend_addObject_(v15, v9, v11, CFSTR("optional"));
    var2_high = HIDWORD(a3[1].var2);
  }
  if ((var2_high & 1) != 0)
    objc_msgSend_addObject_(v15, v9, v11, CFSTR("readonly"));
  v17 = objc_alloc((Class)a1);
  v20 = (void *)objc_msgSend_initWithName_typeName_attributes_(v17, v18, v19, v6, v10, v15);

  return v20;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (BOOL)isReadonly
{
  return self->_readonly;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyType, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);
}

@end
