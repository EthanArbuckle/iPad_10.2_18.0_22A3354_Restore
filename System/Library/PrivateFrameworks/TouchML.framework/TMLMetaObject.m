@implementation TMLMetaObject

- (TMLMetaObject)initWithType:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  TMLMetaObject *v9;
  double v10;
  uint64_t v11;
  NSString *type;
  id v13;
  const char *v14;
  double v15;
  uint64_t v16;
  NSMutableArray *declarations;
  const char *v18;
  double v19;
  uint64_t v20;
  NSSet *attributes;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)TMLMetaObject;
  v9 = -[TMLMetaObject init](&v23, sel_init);
  if (v9)
  {
    v11 = objc_msgSend_copy(v6, v8, v10);
    type = v9->_type;
    v9->_type = (NSString *)v11;

    v13 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v16 = objc_msgSend_initWithCapacity_(v13, v14, v15, 8);
    declarations = v9->_declarations;
    v9->_declarations = (NSMutableArray *)v16;

    v20 = objc_msgSend_copy(v7, v18, v19);
    attributes = v9->_attributes;
    v9->_attributes = (NSSet *)v20;

  }
  return v9;
}

- (void)addProperty:(id)a3 value:(id)a4
{
  id v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  NSString *v11;
  NSString *identifier;
  NSMutableDictionary *properties;
  id v14;
  const char *v15;
  double v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  id v19;
  const char *v20;
  double v21;
  NSMutableOrderedSet *v22;
  NSMutableOrderedSet *propertyKeys;
  const char *v24;
  double v25;
  id v26;

  v26 = a3;
  v6 = a4;
  if (objc_msgSend_isEqualToString_(v26, v7, v8, CFSTR("id")))
  {
    v11 = (NSString *)objc_msgSend_copy(v6, v9, v10);
    identifier = self->_identifier;
    self->_identifier = v11;

  }
  else
  {
    properties = self->_properties;
    if (!properties)
    {
      v14 = objc_alloc(MEMORY[0x24BDBCED8]);
      v17 = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v14, v15, v16, 8);
      v18 = self->_properties;
      self->_properties = v17;

      v19 = objc_alloc(MEMORY[0x24BDBCEE0]);
      v22 = (NSMutableOrderedSet *)objc_msgSend_initWithCapacity_(v19, v20, v21, 8);
      propertyKeys = self->_propertyKeys;
      self->_propertyKeys = v22;

      properties = self->_properties;
    }
    objc_msgSend_setObject_forKeyedSubscript_(properties, v9, v10, v6, v26);
    objc_msgSend_addObject_(self->_propertyKeys, v24, v25, v26);
  }

}

- (void)addSignalHandler:(id)a3 signalTarget:(id)a4
{
  const char *v6;
  id v7;
  double v8;
  NSMutableDictionary *signalHandlers;
  id v10;
  const char *v11;
  double v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  signalHandlers = self->_signalHandlers;
  if (!signalHandlers)
  {
    v10 = objc_alloc(MEMORY[0x24BDBCED8]);
    v13 = (NSMutableDictionary *)objc_msgSend_initWithCapacity_(v10, v11, v12, 8);
    v14 = self->_signalHandlers;
    self->_signalHandlers = v13;

    signalHandlers = self->_signalHandlers;
  }
  objc_msgSend_setObject_forKeyedSubscript_(signalHandlers, v6, v8, v15, v7);

}

- (void)addDeclaration:(id)a3
{
  double v3;

  objc_msgSend_addObject_(self->_declarations, a2, v3, a3);
}

- (void)addPropertyDeclaration:(id)a3 typeName:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  TMLPropertyDescriptor *v11;
  const char *v12;
  double v13;
  const char *v14;
  double v15;
  id v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [TMLPropertyDescriptor alloc];
  v16 = (id)objc_msgSend_initWithName_typeName_attributes_(v11, v12, v13, v10, v9, v8);

  objc_msgSend_addDeclaration_(self, v14, v15, v16);
}

- (void)addSignalDeclaration:(id)a3 returnType:(id)a4 parameters:(id)a5 methodSelector:(id)a6 attributes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  TMLSignalDescriptor *v17;
  const char *v18;
  double v19;
  uint64_t v20;
  const char *v21;
  double v22;
  const char *v23;
  double v24;
  id v25;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = [TMLSignalDescriptor alloc];
  v20 = objc_msgSend_typeForTypeName_(TMLTypeRegistry, v18, v19, v15);

  v25 = (id)objc_msgSend_initWithName_returnType_parameters_methodSelector_attributes_(v17, v21, v22, v16, v20, v14, v13, v12);
  objc_msgSend_addDeclaration_(self, v23, v24, v25);

}

- (void)addMethodDeclaration:(id)a3 returnType:(id)a4 parameters:(id)a5 methodSelector:(id)a6 attributes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  TMLMethodDescriptor *v16;
  const char *v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;
  void *v22;
  void *v23;
  const char *v24;
  double v25;
  id v26;

  v26 = a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = a4;
  v16 = [TMLMethodDescriptor alloc];
  v19 = objc_msgSend_typeForTypeName_(TMLTypeRegistry, v17, v18, v15);

  v22 = v13;
  if (!v13)
  {
    objc_msgSend_methodSelectorForMethodName_parameters_(TMLMethodDescriptor, v20, v21, v26, v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)objc_msgSend_initWithName_returnType_parameters_methodSelector_attributes_(v16, v20, v21, v26, v19, v12, v22, v14);
  objc_msgSend_addDeclaration_(self, v24, v25, v23);

  if (!v13)
}

- (void)addConstructorDeclaration:(id)a3 parameters:(id)a4 methodSelector:(id)a5 attributes:(id)a6
{
  id v10;
  id v11;
  id v12;
  TMLMethodDescriptor *v13;
  const char *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  const char *v21;
  double v22;
  id v23;

  v23 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = [TMLMethodDescriptor alloc];
  v17 = objc_msgSend_typeForTypeName_(TMLTypeRegistry, v14, v15, self->_type);
  v19 = v11;
  if (!v11)
  {
    objc_msgSend_methodSelectorForMethodName_parameters_(TMLMethodDescriptor, v16, v18, v23, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)objc_msgSend_initWithName_returnType_parameters_methodSelector_attributes_(v13, v16, v18, v23, v17, v10, v19, v12);
  objc_msgSend_addDeclaration_(self, v21, v22, v20);

  if (!v11)
}

- (void)addImplements:(id)a3
{
  const char *v4;
  double v5;
  NSMutableSet *implements;
  id v7;
  const char *v8;
  double v9;
  NSMutableSet *v10;
  NSMutableSet *v11;
  char *v12;

  v4 = (const char *)a3;
  implements = self->_implements;
  v12 = (char *)v4;
  if (!implements)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCEF0]);
    v10 = (NSMutableSet *)objc_msgSend_initWithCapacity_(v7, v8, v9, 2);
    v11 = self->_implements;
    self->_implements = v10;

    v4 = v12;
    implements = self->_implements;
  }
  objc_msgSend_addObject_(implements, v4, v5, v4);

}

- (void)addObject:(id)a3
{
  const char *v4;
  double v5;
  NSMutableArray *objects;
  id v7;
  const char *v8;
  double v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  char *v12;

  v4 = (const char *)a3;
  objects = self->_objects;
  v12 = (char *)v4;
  if (!objects)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v10 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    v11 = self->_objects;
    self->_objects = v10;

    v4 = v12;
    objects = self->_objects;
  }
  objc_msgSend_addObject_(objects, v4, v5, v4);

}

- (void)applyCategory:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  double v10;
  const char *v11;
  double v12;
  void *v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  id v22;
  const char *v23;
  double v24;
  const char *v25;
  double v26;
  void *v27;
  const char *v28;
  double v29;
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];

  v4 = a3;
  objc_msgSend_declarations(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = sub_22AD68050;
  v34[3] = &unk_24F4FE358;
  v34[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v7, v9, v10, v34);

  objc_msgSend_signalHandlers(v4, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v8;
  v33[1] = 3221225472;
  v33[2] = sub_22AD6805C;
  v33[3] = &unk_24F502A40;
  v33[4] = self;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v13, v14, v15, v33);

  objc_msgSend_properties(v4, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_propertyKeys(v4, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v8;
  v31[1] = 3221225472;
  v31[2] = sub_22AD68068;
  v31[3] = &unk_24F4FD428;
  v31[4] = self;
  v32 = v18;
  v22 = v18;
  objc_msgSend_enumerateObjectsUsingBlock_(v21, v23, v24, v31);

  objc_msgSend_objects(v4, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = v8;
  v30[1] = 3221225472;
  v30[2] = sub_22AD680C8;
  v30[3] = &unk_24F500D88;
  v30[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v27, v28, v29, v30);

}

- (id)propertyDeclaration:(id)a3
{
  id v4;
  NSMutableArray *declarations;
  id v6;
  const char *v7;
  double v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_22AD681C4;
  v18 = sub_22AD681D4;
  v19 = 0;
  declarations = self->_declarations;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_22AD681DC;
  v11[3] = &unk_24F4FDDD0;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  objc_msgSend_enumerateObjectsUsingBlock_(declarations, v7, v8, v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (id)signalDeclaration:(id)a3
{
  id v4;
  NSMutableArray *declarations;
  id v6;
  const char *v7;
  double v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_22AD681C4;
  v18 = sub_22AD681D4;
  v19 = 0;
  declarations = self->_declarations;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_22AD68370;
  v11[3] = &unk_24F4FDDD0;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  objc_msgSend_enumerateObjectsUsingBlock_(declarations, v7, v8, v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5;
  const char *v6;
  const char *v7;
  const char *v8;
  double v9;
  void *identifier;
  const char *v11;
  uint64_t v12;
  const char *v13;
  double v14;
  NSMutableOrderedSet *propertyKeys;
  uint64_t v16;
  const char *v17;
  double v18;
  uint64_t v19;
  const char *v20;
  double v21;
  NSMutableArray *objects;
  id v23;
  id v24;
  NSMutableArray *declarations;
  id v26;
  id v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  uint64_t v32;
  const char *v33;
  double v34;
  const char *v35;
  double v36;
  uint64_t v37;
  const char *v38;
  double v39;
  const char *v40;
  double v41;
  uint64_t v42;
  const char *v43;
  double v44;
  void *v45;
  const char *v46;
  double v47;
  const char *v48;
  double v49;
  ProtobufCMessageUnknownField *v50;
  const char *v51;
  double v52;
  const char *v53;
  double v54;
  uint64_t v55;
  const char *v56;
  double v57;
  void *v58;
  const char *v59;
  double v60;
  _QWORD v61[5];
  _QWORD v62[6];
  _QWORD v63[5];
  _QWORD v64[5];
  _QWORD v65[4];
  id v66;
  id v67;
  _QWORD v68[5];
  _QWORD v69[6];

  v5 = sub_22AD3C82C(a3);
  v7 = (const char *)objc_msgSend_UTF8String(self->_type, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  identifier = self->_identifier;
  if (identifier)
  {
    v11 = (const char *)objc_msgSend_UTF8String(identifier, v8, v9);
    identifier = strdup(v11);
  }
  *(_QWORD *)&a3[1].var1 = identifier;
  v12 = objc_msgSend_count(self->_propertyKeys, v8, v9);
  a3[1].var2 = (ProtobufCMessageUnknownField *)v12;
  if (v12)
    v12 = (uint64_t)malloc_type_malloc(8 * v12, 0x2004093837F09uLL);
  a3[2].var0 = (ProtobufCMessageDescriptor *)v12;
  propertyKeys = self->_propertyKeys;
  v16 = MEMORY[0x24BDAC760];
  v69[0] = MEMORY[0x24BDAC760];
  v69[1] = 3221225472;
  v69[2] = sub_22AD68774;
  v69[3] = &unk_24F502A68;
  v69[4] = self;
  v69[5] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(propertyKeys, v13, v14, v69);
  v19 = objc_msgSend_count(self->_objects, v17, v18);
  a3[5].var0 = (ProtobufCMessageDescriptor *)v19;
  if (v19)
    v19 = (uint64_t)malloc_type_malloc(8 * v19, 0x2004093837F09uLL);
  *(_QWORD *)&a3[5].var1 = v19;
  objects = self->_objects;
  v68[0] = v16;
  v68[1] = 3221225472;
  v68[2] = sub_22AD689B4;
  v68[3] = &unk_24F502A88;
  v68[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(objects, v20, v21, v68);
  v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v24 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  declarations = self->_declarations;
  v65[0] = v16;
  v65[1] = 3221225472;
  v65[2] = sub_22AD68A18;
  v65[3] = &unk_24F500A28;
  v26 = v23;
  v66 = v26;
  v27 = v24;
  v67 = v27;
  objc_msgSend_enumerateObjectsUsingBlock_(declarations, v28, v29, v65);
  v32 = objc_msgSend_count(v26, v30, v31);
  a3[3].var0 = (ProtobufCMessageDescriptor *)v32;
  if (v32)
    v32 = (uint64_t)malloc_type_malloc(8 * v32, 0x2004093837F09uLL);
  *(_QWORD *)&a3[3].var1 = v32;
  v64[0] = v16;
  v64[1] = 3221225472;
  v64[2] = sub_22AD68AA0;
  v64[3] = &unk_24F4FD3F0;
  v64[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v26, v33, v34, v64);
  v37 = objc_msgSend_count(v27, v35, v36);
  a3[3].var2 = (ProtobufCMessageUnknownField *)v37;
  if (v37)
    v37 = (uint64_t)malloc_type_malloc(8 * v37, 0x2004093837F09uLL);
  a3[4].var0 = (ProtobufCMessageDescriptor *)v37;
  v63[0] = v16;
  v63[1] = 3221225472;
  v63[2] = sub_22AD68B04;
  v63[3] = &unk_24F500968;
  v63[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v27, v38, v39, v63);
  v42 = objc_msgSend_count(self->_signalHandlers, v40, v41);
  *(_QWORD *)&a3[2].var1 = v42;
  if (v42)
    v42 = (uint64_t)malloc_type_malloc(8 * v42, 0x2004093837F09uLL);
  a3[2].var2 = (ProtobufCMessageUnknownField *)v42;
  objc_msgSend_allKeys(self->_signalHandlers, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v16;
  v62[1] = 3221225472;
  v62[2] = sub_22AD68B68;
  v62[3] = &unk_24F502A68;
  v62[4] = self;
  v62[5] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v45, v46, v47, v62);

  if (self->_initializer)
  {
    v50 = (ProtobufCMessageUnknownField *)malloc_type_malloc(0x30uLL, 0x10F004065BF17CFuLL);
    a3[5].var2 = v50;
    objc_msgSend_encode_(self->_initializer, v51, v52, v50);
  }
  if (objc_msgSend_count(self->_implements, v48, v49))
  {
    v55 = objc_msgSend_count(self->_implements, v53, v54);
    a3[6].var0 = (ProtobufCMessageDescriptor *)v55;
    if (v55)
      v55 = (uint64_t)malloc_type_malloc(8 * v55, 0x80040B8603338uLL);
    *(_QWORD *)&a3[6].var1 = v55;
    objc_msgSend_allObjects(self->_implements, v56, v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v16;
    v61[1] = 3221225472;
    v61[2] = sub_22AD68C18;
    v61[3] = &unk_24F500948;
    v61[4] = a3;
    objc_msgSend_enumerateObjectsUsingBlock_(v58, v59, v60, v61);

  }
}

+ (id)decode:(const ProtobufCMessage *)a3
{
  double v3;
  uint64_t v6;
  id v7;
  const char *v8;
  double v9;
  const char *v10;
  void *v11;
  double v12;
  uint64_t v13;
  const char *v14;
  double v15;
  const char *v16;
  double v17;
  ProtobufCMessageUnknownField *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  double v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  ProtobufCMessageDescriptor *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  ProtobufCMessageDescriptor *v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  double v43;
  void *v44;
  const char *v45;
  double v46;
  ProtobufCMessageUnknownField *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  double v51;
  void *v52;
  const char *v53;
  double v54;
  unint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  double v59;
  void *v60;
  const char *v61;
  double v62;
  void *v63;
  const char *v64;
  double v65;
  void *v66;
  const char *v67;
  double v68;
  void *v69;
  const char *v70;
  double v71;
  const char *v72;
  double v73;
  ProtobufCMessageDescriptor *v74;
  void *v75;
  const char *v76;
  double v77;
  void *v79;
  void *v80;

  objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], a2, v3, a3[1].var0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc((Class)a1);
  v80 = (void *)v6;
  v11 = (void *)objc_msgSend_initWithType_attributes_(v7, v8, v9, v6, 0);
  if (*(_QWORD *)&a3[1].var1)
  {
    objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v10, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_addProperty_value_(v11, v14, v15, CFSTR("id"), v13, v13);
  }
  else
  {
    objc_msgSend_addProperty_value_(v11, v10, v12, CFSTR("id"), 0, 0);
  }
  if (a3[1].var2)
  {
    v18 = 0;
    do
    {
      v19 = *((_QWORD *)&a3[2].var0->var0 + (_QWORD)v18);
      switch(*(_DWORD *)(v19 + 32))
      {
        case 0:
          objc_msgSend_null(MEMORY[0x24BDBCEF8], v16, v17);
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 1:
          objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v16, v17, *(_QWORD *)(v19 + 40));
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 2:
          objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], v16, v17, *(int *)(v19 + 52));
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 3:
          LODWORD(v17) = *(_DWORD *)(v19 + 68);
          objc_msgSend_numberWithFloat_(MEMORY[0x24BDD16E0], v16, v17);
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 4:
          objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v16, v17, *(_DWORD *)(v19 + 60) != 0);
          v20 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        case 5:
          v22 = (void *)objc_opt_class();
          objc_msgSend_decode_(v22, v23, v24, *(_QWORD *)(v19 + 72));
          goto LABEL_15;
        case 6:
          v25 = (void *)objc_opt_class();
          objc_msgSend_decode_(v25, v26, v27, *(_QWORD *)(v19 + 80));
LABEL_15:
          v20 = objc_claimAutoreleasedReturnValue();
LABEL_16:
          v21 = (void *)v20;
          break;
        default:
          v21 = 0;
          break;
      }
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v16, v17, *(_QWORD *)(v19 + 24));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addProperty_value_(v11, v29, v30, v28, v21);

      v18 = (ProtobufCMessageUnknownField *)((char *)v18 + 1);
    }
    while (v18 < a3[1].var2);
  }
  if (a3[5].var0)
  {
    v31 = 0;
    do
    {
      v32 = *(_QWORD *)(*(_QWORD *)&a3[5].var1 + 8 * (_QWORD)v31);
      v33 = (void *)objc_opt_class();
      objc_msgSend_decode_(v33, v34, v35, v32);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v11, v37, v38, v36);

      v31 = (ProtobufCMessageDescriptor *)((char *)v31 + 1);
    }
    while (v31 < a3[5].var0);
  }
  if (a3[3].var0)
  {
    v39 = 0;
    do
    {
      v40 = *(_QWORD *)(*(_QWORD *)&a3[3].var1 + 8 * (_QWORD)v39);
      v41 = (void *)objc_opt_class();
      objc_msgSend_decode_(v41, v42, v43, v40);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addDeclaration_(v11, v45, v46, v44);

      v39 = (ProtobufCMessageDescriptor *)((char *)v39 + 1);
    }
    while (v39 < a3[3].var0);
  }
  if (a3[3].var2)
  {
    v47 = 0;
    do
    {
      v48 = *((_QWORD *)&a3[4].var0->var0 + (_QWORD)v47);
      v49 = (void *)objc_opt_class();
      objc_msgSend_decode_(v49, v50, v51, v48);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addDeclaration_(v11, v53, v54, v52);

      v47 = (ProtobufCMessageUnknownField *)((char *)v47 + 1);
    }
    while (v47 < a3[3].var2);
  }
  if (*(_QWORD *)&a3[2].var1)
  {
    v55 = 0;
    do
    {
      v56 = *((_QWORD *)a3[2].var2 + v55);
      v57 = (void *)objc_opt_class();
      objc_msgSend_decode_(v57, v58, v59, v56);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v61, v62, *(_QWORD *)(v56 + 48));
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addSignalHandler_signalTarget_(v11, v64, v65, v60, v63);

      ++v55;
    }
    while (v55 < *(_QWORD *)&a3[2].var1);
  }
  if (a3[5].var2)
  {
    v66 = (void *)objc_opt_class();
    objc_msgSend_decode_(v66, v67, v68, a3[5].var2);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInitializer_(v11, v70, v71, v69);

  }
  else
  {
    objc_msgSend_setInitializer_(v11, v16, v17, 0);
  }
  if (a3[6].var0)
  {
    v74 = 0;
    do
    {
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v72, v73, *(_QWORD *)(*(_QWORD *)&a3[6].var1 + 8 * (_QWORD)v74));
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addImplements_(v11, v76, v77, v75);

      v74 = (ProtobufCMessageDescriptor *)((char *)v74 + 1);
    }
    while (v74 < a3[6].var0);
  }

  return v11;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)properties
{
  return &self->_properties->super;
}

- (NSOrderedSet)propertyKeys
{
  return &self->_propertyKeys->super;
}

- (NSDictionary)signalHandlers
{
  return &self->_signalHandlers->super;
}

- (NSArray)declarations
{
  return &self->_declarations->super;
}

- (NSArray)objects
{
  return &self->_objects->super;
}

- (TMLValueExpression)initializer
{
  return self->_initializer;
}

- (void)setInitializer:(id)a3
{
  objc_storeStrong((id *)&self->_initializer, a3);
}

- (NSSet)implements
{
  return &self->_implements->super;
}

- (NSSet)attributes
{
  return self->_attributes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_initializer, 0);
  objc_storeStrong((id *)&self->_implements, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_declarations, 0);
  objc_storeStrong((id *)&self->_signalHandlers, 0);
  objc_storeStrong((id *)&self->_propertyKeys, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
