@implementation TMLMetaContext

- (TMLMetaContext)init
{
  TMLMetaContext *v2;
  id v3;
  const char *v4;
  double v5;
  uint64_t v6;
  NSMutableDictionary *objects;
  id v8;
  const char *v9;
  double v10;
  uint64_t v11;
  NSMutableDictionary *classes;
  id v13;
  const char *v14;
  double v15;
  uint64_t v16;
  NSMutableDictionary *protocols;
  id v18;
  const char *v19;
  double v20;
  uint64_t v21;
  NSMutableDictionary *functions;
  id v23;
  const char *v24;
  double v25;
  uint64_t v26;
  NSMutableArray *categories;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)TMLMetaContext;
  v2 = -[TMLMetaContext init](&v29, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCED8]);
    v6 = objc_msgSend_initWithCapacity_(v3, v4, v5, 16);
    objects = v2->_objects;
    v2->_objects = (NSMutableDictionary *)v6;

    v8 = objc_alloc(MEMORY[0x24BDBCED8]);
    v11 = objc_msgSend_initWithCapacity_(v8, v9, v10, 4);
    classes = v2->_classes;
    v2->_classes = (NSMutableDictionary *)v11;

    v13 = objc_alloc(MEMORY[0x24BDBCED8]);
    v16 = objc_msgSend_initWithCapacity_(v13, v14, v15, 4);
    protocols = v2->_protocols;
    v2->_protocols = (NSMutableDictionary *)v16;

    v18 = objc_alloc(MEMORY[0x24BDBCED8]);
    v21 = objc_msgSend_initWithCapacity_(v18, v19, v20, 16);
    functions = v2->_functions;
    v2->_functions = (NSMutableDictionary *)v21;

    v23 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v26 = objc_msgSend_initWithCapacity_(v23, v24, v25, 16);
    categories = v2->_categories;
    v2->_categories = (NSMutableArray *)v26;

  }
  return v2;
}

- (TMLMetaObject)rootObject
{
  double v2;

  if (self->_rootObjectIdentifier)
    return (TMLMetaObject *)objc_msgSend_objectForKeyedSubscript_(self->_objects, a2, v2, self->_rootObjectIdentifier);
  else
    return (TMLMetaObject *)objc_msgSend_objectForKeyedSubscript_(self->_objects, a2, v2, &stru_24F505EA8);
}

- (void)addObject:(id)a3
{
  const char *v4;
  double v5;
  void *v6;
  const char *v7;
  double v8;
  int isEqualToString;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  int v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  int v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  NSString *v27;
  NSString *rootObjectIdentifier;
  NSMutableDictionary *objects;
  void *v30;
  const char *v31;
  double v32;
  id v33;

  v33 = a3;
  objc_msgSend_type(v33, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v6, v7, v8, CFSTR("Class"));

  if (isEqualToString)
  {
    objc_msgSend_addObjectAsClass_(self, v10, v11, v33);
  }
  else
  {
    objc_msgSend_type(v33, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend_isEqualToString_(v12, v13, v14, CFSTR("Protocol"));

    if (v15)
    {
      objc_msgSend_addObjectAsProtocol_(self, v16, v17, v33);
    }
    else
    {
      objc_msgSend_type(v33, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend_isEqualToString_(v18, v19, v20, CFSTR("Category"));

      if (v21)
      {
        objc_msgSend_addObject_(self->_categories, v22, v23, v33);
      }
      else
      {
        if (!self->_rootObjectIdentifier)
        {
          objc_msgSend_identifier(v33, v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = (NSString *)objc_msgSend_copy(v24, v25, v26);
          rootObjectIdentifier = self->_rootObjectIdentifier;
          self->_rootObjectIdentifier = v27;

        }
        objects = self->_objects;
        objc_msgSend_identifier(v33, v22, v23);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setObject_forKey_(objects, v31, v32, v33, v30);

      }
    }
  }

}

- (void)commit
{
  id v3;
  NSMutableArray *categories;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = objc_alloc_init(MEMORY[0x24BDD1698]);
  categories = self->_categories;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_22AD693BC;
  v10[3] = &unk_24F500A50;
  v10[4] = self;
  v11 = v3;
  v9 = v3;
  objc_msgSend_enumerateObjectsUsingBlock_(categories, v5, v6, v10);
  objc_msgSend_removeObjectsAtIndexes_(self->_categories, v7, v8, v9);

}

- (void)removeClasses
{
  NSMutableDictionary *classes;

  classes = self->_classes;
  self->_classes = 0;

}

- (void)removeFunctions
{
  NSMutableDictionary *functions;

  functions = self->_functions;
  self->_functions = 0;

}

- (void)removeCategories
{
  NSMutableArray *categories;

  categories = self->_categories;
  self->_categories = 0;

}

+ (id)convertObject:(id)a3 toClass:(id)a4
{
  id v5;
  const char *v6;
  id v7;
  double v8;
  TMLClassDescriptor *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  void *v24;
  const char *v25;
  double v26;
  uint64_t v27;
  const char *v28;
  double v29;
  const char *v30;
  double v31;
  void *v32;
  const char *v33;
  double v34;
  void *v35;
  const char *v36;
  double v37;
  void *v38;
  id v39;
  const char *v40;
  double v41;
  _QWORD v43[4];
  id v44;

  v5 = a3;
  v7 = a4;
  if (!v7)
  {
    v9 = [TMLClassDescriptor alloc];
    objc_msgSend_identifier(v5, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_properties(v5, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v15, v16, v17, CFSTR("superclass"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_initializer(v5, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_attributes(v5, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_containsObject_(v24, v25, v26, CFSTR("optional"));
    v7 = (id)objc_msgSend_initWithName_superClassName_initializer_optional_(v9, v28, v29, v12, v18, v21, v27);

    objc_msgSend_properties(v5, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v32, v33, v34, CFSTR("nativeclass"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObjcClassName_(v7, v36, v37, v35);

  }
  objc_msgSend_declarations(v5, v6, v8);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x24BDAC760];
  v43[1] = 3221225472;
  v43[2] = sub_22AD695F8;
  v43[3] = &unk_24F4FE358;
  v39 = v7;
  v44 = v39;
  objc_msgSend_enumerateObjectsUsingBlock_(v38, v40, v41, v43);

  return v39;
}

- (void)addObjectAsClass:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *classes;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  id v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  classes = self->_classes;
  objc_msgSend_identifier(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(classes, v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convertObject_toClass_(v5, v13, v14, v4, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_objects(v4, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_22AD697AC;
  v24[3] = &unk_24F500A50;
  v24[4] = self;
  v25 = v15;
  v23 = v15;
  objc_msgSend_enumerateObjectsUsingBlock_(v18, v19, v20, v24);

  objc_msgSend_addClass_(self, v21, v22, v23);
}

+ (id)convertObject:(id)a3 toProtocol:(id)a4
{
  id v5;
  const char *v6;
  id v7;
  double v8;
  TMLProtocolDescriptor *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  void *v23;
  const char *v24;
  double v25;
  void *v26;
  id v27;
  const char *v28;
  double v29;
  _QWORD v31[4];
  id v32;

  v5 = a3;
  v7 = a4;
  if (!v7)
  {
    v9 = [TMLProtocolDescriptor alloc];
    objc_msgSend_identifier(v5, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_implements(v5, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend_initWithName_implementsProtocols_(v9, v16, v17, v12, v15);

    objc_msgSend_properties(v5, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v20, v21, v22, CFSTR("nativeclass"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObjcProtocolName_(v7, v24, v25, v23);

  }
  objc_msgSend_declarations(v5, v6, v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = sub_22AD69A08;
  v31[3] = &unk_24F4FE358;
  v27 = v7;
  v32 = v27;
  objc_msgSend_enumerateObjectsUsingBlock_(v26, v28, v29, v31);

  return v27;
}

- (void)addObjectAsProtocol:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *protocols;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  protocols = self->_protocols;
  objc_msgSend_identifier(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(protocols, v10, v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_convertObject_toProtocol_(v5, v13, v14, v4, v12);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_addProtocol_(self, v15, v16, v17);
}

- (void)addClass:(id)a3
{
  NSMutableDictionary *classes;
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  classes = self->_classes;
  v4 = a3;
  objc_msgSend_className(v4, v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(classes, v7, v8, v4, v9);

}

- (void)addProtocol:(id)a3
{
  NSMutableDictionary *protocols;
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  protocols = self->_protocols;
  v4 = a3;
  objc_msgSend_protocolName(v4, v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(protocols, v7, v8, v4, v9);

}

- (void)addFunction:(id)a3
{
  NSMutableDictionary *functions;
  id v4;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  functions = self->_functions;
  v4 = a3;
  objc_msgSend_functionName(v4, v5, v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(functions, v7, v8, v4, v9);

}

- (void)addExports:(id)a3
{
  const char *v4;
  double v5;
  NSMutableArray *exports;
  id v7;
  const char *v8;
  double v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  char *v12;

  v4 = (const char *)a3;
  exports = self->_exports;
  v12 = (char *)v4;
  if (!exports)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCEB8]);
    v10 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    v11 = self->_exports;
    self->_exports = v10;

    v4 = v12;
    exports = self->_exports;
  }
  objc_msgSend_addObjectsFromArray_(exports, v4, v5, v4);

}

- (void)addRequire:(id)a3
{
  const char *v4;
  double v5;
  NSMutableSet *requires;
  id v7;
  const char *v8;
  double v9;
  NSMutableSet *v10;
  NSMutableSet *v11;
  char *v12;

  v4 = (const char *)a3;
  requires = self->_requires;
  v12 = (char *)v4;
  if (!requires)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCEF0]);
    v10 = (NSMutableSet *)objc_msgSend_initWithCapacity_(v7, v8, v9, 4);
    v11 = self->_requires;
    self->_requires = v10;

    v4 = v12;
    requires = self->_requires;
  }
  objc_msgSend_addObject_(requires, v4, v5, v4);

}

- (id)findParentForObjectWithIdentifier:(id)a3
{
  id v4;
  NSMutableDictionary *objects;
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
  v17 = sub_22AD69DBC;
  v18 = sub_22AD69DCC;
  v19 = 0;
  objects = self->_objects;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = sub_22AD69DD4;
  v11[3] = &unk_24F502AE0;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(objects, v7, v8, v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5;
  const char *v6;
  const char *v7;
  double v8;
  uint64_t v9;
  const char *v10;
  double v11;
  uint64_t v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  uint64_t v24;
  const char *v25;
  double v26;
  const char *v27;
  double v28;
  uint64_t v29;
  const char *v30;
  double v31;
  const char *v32;
  double v33;
  void *v34;
  const char *v35;
  double v36;
  uint64_t v37;
  const char *v38;
  double v39;
  const char *v40;
  double v41;
  void *v42;
  const char *v43;
  double v44;
  uint64_t v45;
  const char *v46;
  double v47;
  const char *v48;
  double v49;
  void *v50;
  const char *v51;
  double v52;
  uint64_t v53;
  const char *v54;
  double v55;
  id v56;
  _QWORD v57[5];
  _QWORD v58[5];
  _QWORD v59[5];
  _QWORD v60[5];
  _QWORD v61[5];

  v5 = sub_22AD3C3AC((uint64_t)a3);
  objc_msgSend_allValues(self->_classes, v6, v5);
  v56 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v56, v7, v8);
  a3[1].var0 = (ProtobufCMessageDescriptor *)v9;
  if (v9)
    v9 = (uint64_t)malloc_type_malloc(8 * v9, 0x2004093837F09uLL);
  v12 = MEMORY[0x24BDAC760];
  *(_QWORD *)&a3[1].var1 = v9;
  v61[0] = v12;
  v61[1] = 3221225472;
  v61[2] = sub_22AD6A1D0;
  v61[3] = &unk_24F502978;
  v61[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v56, v10, v11, v61);
  objc_msgSend_allValues(self->_objects, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend_mutableCopy(v15, v16, v17);

  objc_msgSend_rootObject(self, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_indexOfObjectIdenticalTo_(v18, v22, v23, v21);

  if (v24 && v24 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(v18, v25, v26, v24, 0);
  objc_msgSend_addObjectsFromArray_(v18, v25, v26, self->_categories);
  v29 = objc_msgSend_count(v18, v27, v28);
  a3[1].var2 = (ProtobufCMessageUnknownField *)v29;
  if (v29)
    v29 = (uint64_t)malloc_type_malloc(8 * v29, 0x2004093837F09uLL);
  a3[2].var0 = (ProtobufCMessageDescriptor *)v29;
  v60[0] = v12;
  v60[1] = 3221225472;
  v60[2] = sub_22AD6A234;
  v60[3] = &unk_24F502A88;
  v60[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v18, v30, v31, v60);
  objc_msgSend_allValues(self->_functions, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend_count(v34, v35, v36);
  *(_QWORD *)&a3[2].var1 = v37;
  if (v37)
    v37 = (uint64_t)malloc_type_malloc(8 * v37, 0x2004093837F09uLL);
  a3[2].var2 = (ProtobufCMessageUnknownField *)v37;
  v59[0] = v12;
  v59[1] = 3221225472;
  v59[2] = sub_22AD6A298;
  v59[3] = &unk_24F502B00;
  v59[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v34, v38, v39, v59);
  objc_msgSend_allValues(self->_protocols, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend_count(v42, v43, v44);
  a3[3].var0 = (ProtobufCMessageDescriptor *)v45;
  if (v45)
    v45 = (uint64_t)malloc_type_malloc(8 * v45, 0x2004093837F09uLL);
  *(_QWORD *)&a3[3].var1 = v45;
  v58[0] = v12;
  v58[1] = 3221225472;
  v58[2] = sub_22AD6A2FC;
  v58[3] = &unk_24F502B20;
  v58[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v42, v46, v47, v58);
  objc_msgSend_allObjects(self->_requires, v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend_count(v50, v51, v52);
  a3[3].var2 = (ProtobufCMessageUnknownField *)v53;
  if (v53)
    v53 = (uint64_t)malloc_type_malloc(8 * v53, 0x80040B8603338uLL);
  a3[4].var0 = (ProtobufCMessageDescriptor *)v53;
  v57[0] = v12;
  v57[1] = 3221225472;
  v57[2] = sub_22AD6A360;
  v57[3] = &unk_24F500948;
  v57[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v50, v54, v55, v57);

}

+ (id)decode:(const ProtobufCMessage *)a3
{
  const char *v4;
  id v5;
  double v6;
  ProtobufCMessageDescriptor *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  ProtobufCMessageDescriptor *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  const char *v21;
  double v22;
  ProtobufCMessageUnknownField *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  double v27;
  void *v28;
  const char *v29;
  double v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  double v35;
  void *v36;
  const char *v37;
  double v38;
  ProtobufCMessageUnknownField *v39;
  void *v40;
  const char *v41;
  double v42;

  v5 = objc_alloc_init((Class)a1);
  if (a3[1].var0)
  {
    v7 = 0;
    do
    {
      v8 = *(_QWORD *)(*(_QWORD *)&a3[1].var1 + 8 * (_QWORD)v7);
      v9 = (void *)objc_opt_class();
      objc_msgSend_decode_(v9, v10, v11, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addClass_(v5, v13, v14, v12);

      v7 = (ProtobufCMessageDescriptor *)((char *)v7 + 1);
    }
    while (v7 < a3[1].var0);
  }
  if (a3[3].var0)
  {
    v15 = 0;
    do
    {
      v16 = *(_QWORD *)(*(_QWORD *)&a3[3].var1 + 8 * (_QWORD)v15);
      v17 = (void *)objc_opt_class();
      objc_msgSend_decode_(v17, v18, v19, v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addProtocol_(v5, v21, v22, v20);

      v15 = (ProtobufCMessageDescriptor *)((char *)v15 + 1);
    }
    while (v15 < a3[3].var0);
  }
  if (a3[1].var2)
  {
    v23 = 0;
    do
    {
      v24 = *((_QWORD *)&a3[2].var0->var0 + (_QWORD)v23);
      v25 = (void *)objc_opt_class();
      objc_msgSend_decode_(v25, v26, v27, v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v5, v29, v30, v28);

      v23 = (ProtobufCMessageUnknownField *)((char *)v23 + 1);
    }
    while (v23 < a3[1].var2);
  }
  if (*(_QWORD *)&a3[2].var1)
  {
    v31 = 0;
    do
    {
      v32 = *((_QWORD *)a3[2].var2 + v31);
      v33 = (void *)objc_opt_class();
      objc_msgSend_decode_(v33, v34, v35, v32);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addFunction_(v5, v37, v38, v36);

      ++v31;
    }
    while (v31 < *(_QWORD *)&a3[2].var1);
  }
  if (a3[3].var2)
  {
    v39 = 0;
    do
    {
      objc_msgSend_stringWithUTF8String_(MEMORY[0x24BDD17C8], v4, v6, *((_QWORD *)&a3[4].var0->var0 + (_QWORD)v39));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addRequire_(v5, v41, v42, v40);

      v39 = (ProtobufCMessageUnknownField *)((char *)v39 + 1);
    }
    while (v39 < a3[3].var2);
  }
  return v5;
}

- (id)serializedData
{
  void **v3;
  const char *v4;
  double v5;
  const char *v6;
  double v7;
  void *v8;

  v3 = (void **)malloc_type_malloc(0x68uLL, 0x10E0040650DB1CFuLL);
  objc_msgSend_encode_(self, v4, v5, v3);
  objc_msgSend_pack_(TMLModelSerialize, v6, v7, v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  sub_22AD3C468(v3, 0);
  return v8;
}

+ (id)deserializeFromData:(id)a3
{
  double v3;
  uint64_t v5;
  const char *v6;
  double v7;
  void **v8;
  void *v9;

  v5 = objc_msgSend_unpackData_withDescriptor_(TMLModelSerialize, a2, v3, a3, &unk_24F4FE820);
  if (v5)
  {
    v8 = (void **)v5;
    objc_msgSend_decode_(a1, v6, v7, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    sub_22AD3C468(v8, 0);
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (NSDictionary)objects
{
  return &self->_objects->super;
}

- (NSDictionary)classes
{
  return &self->_classes->super;
}

- (NSDictionary)protocols
{
  return &self->_protocols->super;
}

- (NSDictionary)functions
{
  return &self->_functions->super;
}

- (NSArray)exports
{
  return &self->_exports->super;
}

- (NSArray)categories
{
  return &self->_categories->super;
}

- (NSSet)requires
{
  return &self->_requires->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requires, 0);
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_exports, 0);
  objc_storeStrong((id *)&self->_functions, 0);
  objc_storeStrong((id *)&self->_rootObjectIdentifier, 0);
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_protocols, 0);
  objc_storeStrong((id *)&self->_classes, 0);
}

@end
