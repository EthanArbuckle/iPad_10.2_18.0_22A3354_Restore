@implementation TMLClassDescriptor

- (TMLClassDescriptor)initWithName:(id)a3 superClassName:(id)a4 initializer:(id)a5 optional:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  TMLClassDescriptor *v14;
  double v15;
  uint64_t v16;
  NSString *className;
  const char *v18;
  double v19;
  uint64_t v20;
  NSString *superClassName;
  NSMutableDictionary *v22;
  NSMutableDictionary *properties;
  NSMutableDictionary *v24;
  NSMutableDictionary *signals;
  NSMutableDictionary *v26;
  NSMutableDictionary *methods;
  NSMutableDictionary *v28;
  NSMutableDictionary *childClasses;
  objc_super v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)TMLClassDescriptor;
  v14 = -[TMLClassDescriptor init](&v31, sel_init);
  if (v14)
  {
    v16 = objc_msgSend_copy(v10, v13, v15);
    className = v14->_className;
    v14->_className = (NSString *)v16;

    v20 = objc_msgSend_copy(v11, v18, v19);
    superClassName = v14->_superClassName;
    v14->_superClassName = (NSString *)v20;

    objc_storeStrong((id *)&v14->_initializer, a5);
    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    properties = v14->_properties;
    v14->_properties = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    signals = v14->_signals;
    v14->_signals = v24;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    methods = v14->_methods;
    v14->_methods = v26;

    v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    childClasses = v14->_childClasses;
    v14->_childClasses = v28;

    v14->_optional = a6;
  }

  return v14;
}

- (Class)objcClass
{
  double v2;
  objc_class *objcClass;
  uint64_t v5;
  uint64_t v6;
  Class v7;

  objcClass = self->_objcClass;
  if (!objcClass)
  {
    v5 = objc_msgSend_length(self->_objcClassName, a2, v2);
    v6 = 88;
    if (!v5)
      v6 = 8;
    NSClassFromString(*(NSString **)((char *)&self->super.isa + v6));
    objcClass = (objc_class *)objc_claimAutoreleasedReturnValue();
    v7 = self->_objcClass;
    self->_objcClass = objcClass;

  }
  return objcClass;
}

- (void)addProperty:(id)a3
{
  NSMutableDictionary *properties;
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  properties = self->_properties;
  v4 = a3;
  objc_msgSend_propertyName(v4, v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(properties, v7, v8, v4, v9);

}

- (id)propertyForName:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  id v11;
  void *v12;

  v4 = a3;
  objc_msgSend_objectForKeyedSubscript_(self->_properties, v5, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  if (v7)
  {
    v11 = v7;
  }
  else
  {
    objc_msgSend_propertyForName_(self->_superClass, v8, v9, v4);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (void)addSignal:(id)a3
{
  NSMutableDictionary *signals;
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  signals = self->_signals;
  v4 = a3;
  objc_msgSend_signalName(v4, v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(signals, v7, v8, v4, v9);

}

- (void)addMethod:(id)a3
{
  NSMutableDictionary *methods;
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  methods = self->_methods;
  v4 = a3;
  objc_msgSend_methodName(v4, v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(methods, v7, v8, v4, v9);

}

- (void)addChildClass:(id)a3
{
  NSMutableDictionary *childClasses;
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  childClasses = self->_childClasses;
  v4 = a3;
  objc_msgSend_className(v4, v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(childClasses, v7, v8, v4, v9);

}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  TMLClassDescriptor *v5;
  TMLClassDescriptor *v6;
  NSString *className;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  const char *v13;
  double v14;
  NSString *superClassName;
  const char *v16;
  NSString *v17;
  double v18;
  NSString *v19;
  const char *v20;
  double v21;
  char isEqualToDictionary;
  NSMutableDictionary *properties;
  void *v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  NSMutableDictionary *signals;
  void *v30;
  const char *v31;
  double v32;
  const char *v33;
  double v34;
  NSMutableDictionary *methods;
  void *v36;
  const char *v37;
  double v38;

  v5 = (TMLClassDescriptor *)a3;
  if (self == v5)
  {
    isEqualToDictionary = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      className = self->_className;
      objc_msgSend_className(v6, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend_isEqualToString_(className, v11, v12, v10))
      {
        isEqualToDictionary = 0;
LABEL_18:

        goto LABEL_19;
      }
      superClassName = self->_superClassName;
      objc_msgSend_superClassName(v6, v13, v14);
      v17 = (NSString *)objc_claimAutoreleasedReturnValue();
      if (superClassName != v17)
      {
        v19 = self->_superClassName;
        objc_msgSend_superClassName(v6, v16, v18);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend_isEqualToString_(v19, v20, v21, v3))
        {
          isEqualToDictionary = 0;
          goto LABEL_16;
        }
      }
      properties = self->_properties;
      objc_msgSend_properties(v6, v16, v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_isEqualToDictionary_(properties, v25, v26, v24))
      {
        signals = self->_signals;
        objc_msgSend_signals(v6, v27, v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToDictionary_(signals, v31, v32, v30))
        {
          methods = self->_methods;
          objc_msgSend_methods(v6, v33, v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToDictionary = objc_msgSend_isEqualToDictionary_(methods, v37, v38, v36);

          goto LABEL_15;
        }

      }
      isEqualToDictionary = 0;
LABEL_15:
      if (superClassName == v17)
      {
LABEL_17:

        goto LABEL_18;
      }
LABEL_16:

      goto LABEL_17;
    }
    isEqualToDictionary = 0;
  }
LABEL_19:

  return isEqualToDictionary;
}

- (NSDictionary)inheritedProperties
{
  double v2;
  TMLClassDescriptor *superClass;
  void *v5;
  const char *v6;
  double v7;
  NSMutableDictionary *v8;
  const char *v9;
  double v10;

  superClass = self->_superClass;
  if (superClass)
  {
    objc_msgSend_inheritedProperties(superClass, a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSMutableDictionary *)objc_msgSend_mutableCopy(v5, v6, v7);

    objc_msgSend_addEntriesFromDictionary_(v8, v9, v10, self->_properties);
  }
  else
  {
    v8 = self->_properties;
  }
  return (NSDictionary *)v8;
}

- (NSDictionary)inheritedSignals
{
  double v2;
  TMLClassDescriptor *superClass;
  void *v5;
  const char *v6;
  double v7;
  NSMutableDictionary *v8;
  const char *v9;
  double v10;

  superClass = self->_superClass;
  if (superClass)
  {
    objc_msgSend_inheritedSignals(superClass, a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSMutableDictionary *)objc_msgSend_mutableCopy(v5, v6, v7);

    objc_msgSend_addEntriesFromDictionary_(v8, v9, v10, self->_signals);
  }
  else
  {
    v8 = self->_signals;
  }
  return (NSDictionary *)v8;
}

- (NSDictionary)inheritedMethods
{
  double v2;
  TMLClassDescriptor *superClass;
  void *v5;
  const char *v6;
  double v7;
  NSMutableDictionary *v8;
  const char *v9;
  double v10;

  superClass = self->_superClass;
  if (superClass)
  {
    objc_msgSend_inheritedMethods(superClass, a2, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSMutableDictionary *)objc_msgSend_mutableCopy(v5, v6, v7);

    objc_msgSend_addEntriesFromDictionary_(v8, v9, v10, self->_methods);
  }
  else
  {
    v8 = self->_methods;
  }
  return (NSDictionary *)v8;
}

- (BOOL)canMergeFromClassDescriptor:(id)a3
{
  id v4;
  NSString *className;
  const char *v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  NSString *superClassName;
  uint64_t v14;
  const char *v15;
  double v16;
  void *v17;
  NSString *v18;
  void *v19;
  const char *v20;
  double v21;
  const char *v22;
  BOOL v23;
  void *v24;
  const char *v25;
  double v26;
  void *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  double v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  void *v37;
  id v38;
  const char *v39;
  double v40;
  const char *v41;
  double v42;
  void *v43;
  const char *v44;
  double v45;
  void *v46;
  id v47;
  const char *v48;
  double v49;
  _QWORD v51[4];
  id v52;
  uint64_t *v53;
  _QWORD v54[4];
  id v55;
  uint64_t *v56;
  _QWORD v57[4];
  id v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;

  v4 = a3;
  className = self->_className;
  objc_msgSend_className(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_isEqualToString_(className, v9, v10, v8) & 1) != 0)
  {
    superClassName = self->_superClassName;
    objc_msgSend_superClassName(v4, v11, v12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (superClassName == (NSString *)v14)
    {

LABEL_8:
      v60 = 0;
      v61 = &v60;
      v62 = 0x2020000000;
      v63 = 1;
      objc_msgSend_inheritedProperties(self, v22, COERCE_DOUBLE(0x2020000000));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_properties(v4, v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = MEMORY[0x24BDAC760];
      v57[0] = MEMORY[0x24BDAC760];
      v57[1] = 3221225472;
      v57[2] = sub_22AD64B1C;
      v57[3] = &unk_24F502890;
      v29 = v24;
      v58 = v29;
      v59 = &v60;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v27, v30, v31, v57);

      objc_msgSend_inheritedMethods(self, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_methods(v4, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v28;
      v54[1] = 3221225472;
      v54[2] = sub_22AD64BAC;
      v54[3] = &unk_24F5028B8;
      v38 = v34;
      v55 = v38;
      v56 = &v60;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v37, v39, v40, v54);

      objc_msgSend_inheritedSignals(self, v41, v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_signals(v4, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v28;
      v51[1] = 3221225472;
      v51[2] = sub_22AD64C2C;
      v51[3] = &unk_24F5028E0;
      v47 = v43;
      v52 = v47;
      v53 = &v60;
      objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v46, v48, v49, v51);

      v23 = *((_BYTE *)v61 + 24) != 0;
      _Block_object_dispose(&v60, 8);
      goto LABEL_9;
    }
    v17 = (void *)v14;
    v18 = self->_superClassName;
    objc_msgSend_superClassName(v4, v15, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = objc_msgSend_isEqualToString_(v18, v20, v21, v19);

    if ((_DWORD)v18)
      goto LABEL_8;
  }
  else
  {

  }
  v23 = 0;
LABEL_9:

  return v23;
}

- (BOOL)mergeFromClassDescriptor:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  const char *v34;
  double v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;
  void *v41;
  const char *v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  void *v47;
  const char *v48;
  double v49;
  const char *v50;
  double v51;
  const char *v52;
  double v53;
  uint64_t v54;
  const char *v55;
  double v56;
  uint64_t v57;
  const char *v58;
  double v59;
  _QWORD v61[5];
  _QWORD v62[5];
  _QWORD v63[5];
  _QWORD v64[4];
  id v65;

  v4 = a3;
  objc_msgSend_properties(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend_mutableCopy(v7, v8, v9);

  objc_msgSend_inheritedProperties(self, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v64[0] = MEMORY[0x24BDAC760];
  v64[1] = 3221225472;
  v64[2] = sub_22AD64EC4;
  v64[3] = &unk_24F502908;
  v65 = v10;
  v15 = v10;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v13, v16, v17, v64);

  v63[0] = v14;
  v63[1] = 3221225472;
  v63[2] = sub_22AD64F44;
  v63[3] = &unk_24F502908;
  v63[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v15, v18, v19, v63);
  objc_msgSend_methods(v4, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend_mutableCopy(v22, v23, v24);

  objc_msgSend_inheritedMethods(self, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectsForKeys_(v25, v32, v33, v31);

  v62[0] = v14;
  v62[1] = 3221225472;
  v62[2] = sub_22AD64F4C;
  v62[3] = &unk_24F502930;
  v62[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v25, v34, v35, v62);
  objc_msgSend_signals(v4, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = (void *)objc_msgSend_mutableCopy(v38, v39, v40);
  objc_msgSend_inheritedSignals(self, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObjectsForKeys_(v41, v48, v49, v47);

  v61[0] = v14;
  v61[1] = 3221225472;
  v61[2] = sub_22AD64F54;
  v61[3] = &unk_24F502958;
  v61[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v41, v50, v51, v61);
  v54 = objc_msgSend_count(v15, v52, v53);
  v57 = objc_msgSend_count(v25, v55, v56) + v54;
  LOBYTE(v57) = v57 + objc_msgSend_count(v41, v58, v59) != 0;

  return v57;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5;
  const char *v6;
  const char *v7;
  const char *v8;
  double v9;
  void *superClassName;
  const char *v11;
  ProtobufCMessageUnknownField *objcClassName;
  const char *v13;
  const char *v14;
  double v15;
  uint64_t v16;
  const char *v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  uint64_t v25;
  const char *v26;
  double v27;
  const char *v28;
  double v29;
  void *v30;
  const char *v31;
  double v32;
  uint64_t v33;
  const char *v34;
  double v35;
  const char *v36;
  double v37;
  void *v38;
  const char *v39;
  double v40;
  uint64_t v41;
  const char *v42;
  double v43;
  ProtobufCMessageUnknownField *v44;
  const char *v45;
  double v46;
  _BOOL4 optional;
  id v48;
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];

  v5 = sub_22AD3C490(a3);
  v7 = (const char *)objc_msgSend_UTF8String(self->_className, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  superClassName = self->_superClassName;
  if (superClassName)
  {
    v11 = (const char *)objc_msgSend_UTF8String(superClassName, v8, v9);
    superClassName = strdup(v11);
  }
  *(_QWORD *)&a3[1].var1 = superClassName;
  objcClassName = (ProtobufCMessageUnknownField *)self->_objcClassName;
  if (objcClassName)
  {
    v13 = (const char *)objc_msgSend_UTF8String(objcClassName, v8, v9);
    objcClassName = (ProtobufCMessageUnknownField *)strdup(v13);
  }
  a3[1].var2 = objcClassName;
  objc_msgSend_allValues(self->_properties, v8, v9);
  v48 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_count(v48, v14, v15);
  a3[2].var0 = (ProtobufCMessageDescriptor *)v16;
  if (v16)
    v16 = (uint64_t)malloc_type_malloc(8 * v16, 0x2004093837F09uLL);
  v19 = MEMORY[0x24BDAC760];
  *(_QWORD *)&a3[2].var1 = v16;
  v52[0] = v19;
  v52[1] = 3221225472;
  v52[2] = sub_22AD651CC;
  v52[3] = &unk_24F4FD3F0;
  v52[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v48, v17, v18, v52);
  objc_msgSend_allValues(self->_signals, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_count(v22, v23, v24);
  a3[2].var2 = (ProtobufCMessageUnknownField *)v25;
  if (v25)
    v25 = (uint64_t)malloc_type_malloc(8 * v25, 0x2004093837F09uLL);
  a3[3].var0 = (ProtobufCMessageDescriptor *)v25;
  v51[0] = v19;
  v51[1] = 3221225472;
  v51[2] = sub_22AD65230;
  v51[3] = &unk_24F500968;
  v51[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v22, v26, v27, v51);
  objc_msgSend_allValues(self->_childClasses, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend_count(v30, v31, v32);
  a3[4].var0 = (ProtobufCMessageDescriptor *)v33;
  if (v33)
    v33 = (uint64_t)malloc_type_malloc(8 * v33, 0x2004093837F09uLL);
  *(_QWORD *)&a3[4].var1 = v33;
  v50[0] = v19;
  v50[1] = 3221225472;
  v50[2] = sub_22AD65294;
  v50[3] = &unk_24F502978;
  v50[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v30, v34, v35, v50);
  objc_msgSend_allValues(self->_methods, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend_count(v38, v39, v40);
  *(_QWORD *)&a3[3].var1 = v41;
  if (v41)
    v41 = (uint64_t)malloc_type_malloc(8 * v41, 0x2004093837F09uLL);
  a3[3].var2 = (ProtobufCMessageUnknownField *)v41;
  v49[0] = v19;
  v49[1] = 3221225472;
  v49[2] = sub_22AD652F8;
  v49[3] = &unk_24F502998;
  v49[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v38, v42, v43, v49);
  if (self->_initializer)
  {
    v44 = (ProtobufCMessageUnknownField *)malloc_type_malloc(0x30uLL, 0x10F004065BF17CFuLL);
    a3[4].var2 = v44;
    objc_msgSend_encode_(self->_initializer, v45, v46, v44);
  }
  optional = self->_optional;
  LODWORD(a3[5].var0) = optional;
  HIDWORD(a3[5].var0) = optional;

}

+ (id)decode:(const ProtobufCMessage *)a3
{
  double v3;
  const char *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  double v17;
  const char *v18;
  void *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  ProtobufCMessageDescriptor *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  double v28;
  void *v29;
  const char *v30;
  double v31;
  ProtobufCMessageUnknownField *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  double v36;
  void *v37;
  const char *v38;
  double v39;
  ProtobufCMessageDescriptor *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  unint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  double v52;
  void *v53;
  const char *v54;
  double v55;

  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, v3, a3[1].var0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)&a3[1].var1)
  {
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (a3[4].var2)
  {
    v10 = (void *)objc_opt_class();
    objc_msgSend_decode_(v10, v11, v12, a3[4].var2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  if (LODWORD(a3[5].var0))
    v14 = BYTE4(a3[5].var0) & 1;
  else
    v14 = 0;
  v15 = objc_alloc((Class)a1);
  v19 = (void *)objc_msgSend_initWithName_superClassName_initializer_optional_(v15, v16, v17, v7, v9, v13, v14);
  if (a3[1].var2)
  {
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObjcClassName_(v19, v22, v23, v21);

  }
  if (a3[2].var0)
  {
    v24 = 0;
    do
    {
      v25 = *(_QWORD *)(*(_QWORD *)&a3[2].var1 + 8 * (_QWORD)v24);
      v26 = (void *)objc_opt_class();
      objc_msgSend_decode_(v26, v27, v28, v25);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addProperty_(v19, v30, v31, v29);

      v24 = (ProtobufCMessageDescriptor *)((char *)v24 + 1);
    }
    while (v24 < a3[2].var0);
  }
  if (a3[2].var2)
  {
    v32 = 0;
    do
    {
      v33 = *((_QWORD *)&a3[3].var0->var0 + (_QWORD)v32);
      v34 = (void *)objc_opt_class();
      objc_msgSend_decode_(v34, v35, v36, v33);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addSignal_(v19, v38, v39, v37);

      v32 = (ProtobufCMessageUnknownField *)((char *)v32 + 1);
    }
    while (v32 < a3[2].var2);
  }
  if (a3[4].var0)
  {
    v40 = 0;
    do
    {
      v41 = *(_QWORD *)(*(_QWORD *)&a3[4].var1 + 8 * (_QWORD)v40);
      v42 = (void *)objc_opt_class();
      objc_msgSend_decode_(v42, v43, v44, v41);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addChildClass_(v19, v46, v47, v45);

      v40 = (ProtobufCMessageDescriptor *)((char *)v40 + 1);
    }
    while (v40 < a3[4].var0);
  }
  if (*(_QWORD *)&a3[3].var1)
  {
    v48 = 0;
    do
    {
      v49 = *((_QWORD *)a3[3].var2 + v48);
      v50 = (void *)objc_opt_class();
      objc_msgSend_decode_(v50, v51, v52, v49);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addMethod_(v19, v54, v55, v53);

      ++v48;
    }
    while (v48 < *(_QWORD *)&a3[3].var1);
  }

  return v19;
}

- (NSString)className
{
  return self->_className;
}

- (NSString)superClassName
{
  return self->_superClassName;
}

- (NSDictionary)properties
{
  return &self->_properties->super;
}

- (NSDictionary)signals
{
  return &self->_signals->super;
}

- (NSDictionary)methods
{
  return &self->_methods->super;
}

- (NSDictionary)childClasses
{
  return &self->_childClasses->super;
}

- (TMLClassDescriptor)superClass
{
  return self->_superClass;
}

- (void)setSuperClass:(id)a3
{
  objc_storeStrong((id *)&self->_superClass, a3);
}

- (NSString)objcClassName
{
  return self->_objcClassName;
}

- (void)setObjcClassName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (TMLValueExpression)initializer
{
  return self->_initializer;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objcClassName, 0);
  objc_storeStrong((id *)&self->_objcClass, 0);
  objc_storeStrong((id *)&self->_superClass, 0);
  objc_storeStrong((id *)&self->_initializer, 0);
  objc_storeStrong((id *)&self->_childClasses, 0);
  objc_storeStrong((id *)&self->_methods, 0);
  objc_storeStrong((id *)&self->_signals, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_superClassName, 0);
  objc_storeStrong((id *)&self->_className, 0);
}

@end
