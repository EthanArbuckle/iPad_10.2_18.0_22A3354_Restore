@implementation VMUObjectIdentifierDriverKitSupport

- (VMUObjectIdentifierDriverKitSupport)initWithObjectIdentifier:(id)a3
{
  id v4;
  VMUObjectIdentifierDriverKitSupport *v5;
  VMUObjectIdentifierDriverKitSupport *v6;
  void *v7;
  uint64_t SymbolOwnerWithNameAtTime;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t StructureLayoutDescription;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSArray *privateFieldsOfLocalDriverKitOSObject;
  NSArray *v17;
  void *v18;
  NSArray *privateFieldsOfRemoteDriverKitOSObject;
  VMUObjectIdentifierDriverKitSupport *v20;
  unint64_t *v21;
  objc_super v23;

  v4 = a3;
  if (objc_msgSend(v4, "taskIsDriverKit"))
  {
    v23.receiver = self;
    v23.super_class = (Class)VMUObjectIdentifierDriverKitSupport;
    v5 = -[VMUObjectIdentifierDriverKitSupport init](&v23, sel_init);
    v6 = v5;
    if (v5)
    {
      objc_storeWeak((id *)&v5->_objectIdentifier, v4);
      objc_msgSend(v4, "scanner");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_task = objc_msgSend(v7, "task");

      objc_msgSend(v4, "symbolicator");
      SymbolOwnerWithNameAtTime = CSSymbolicatorGetSymbolOwnerWithNameAtTime();
      v10 = v9;
      objc_msgSend(v4, "memoryReader");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      StructureLayoutDescription = getStructureLayoutDescription(SymbolOwnerWithNameAtTime, v10, (uint64_t)"gOSMetaClassBasePrivateLayout", v11);

      objc_msgSend(v4, "memoryReader");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = getStructureLayoutDescription(SymbolOwnerWithNameAtTime, v10, (uint64_t)"gOSMetaClassBaseRemotePrivateLayout", v13);

      if (StructureLayoutDescription)
      {
        v6->_vtableOffsetOfLocalDriverKitOSObject = *(_QWORD *)(StructureLayoutDescription + 24);
        -[VMUObjectIdentifierDriverKitSupport _fieldsFromStructureLayout:withOffset:](v6, "_fieldsFromStructureLayout:withOffset:", StructureLayoutDescription, 0);
        v15 = objc_claimAutoreleasedReturnValue();
        privateFieldsOfLocalDriverKitOSObject = v6->_privateFieldsOfLocalDriverKitOSObject;
        v6->_privateFieldsOfLocalDriverKitOSObject = (NSArray *)v15;

        if (v14)
        {
          v6->_vtableOffsetOfRemoteDriverKitOSObject = *(_QWORD *)(StructureLayoutDescription + 24)
                                                     + *(_QWORD *)(v14 + 24);
          -[VMUObjectIdentifierDriverKitSupport _fieldsFromStructureLayout:withOffset:](v6, "_fieldsFromStructureLayout:withOffset:", v14, 0);
          v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
          -[VMUObjectIdentifierDriverKitSupport _fieldsFromStructureLayout:withOffset:](v6, "_fieldsFromStructureLayout:withOffset:", StructureLayoutDescription, *(_QWORD *)(v14 + 24));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObjectsFromArray:](v17, "addObjectsFromArray:", v18);

          privateFieldsOfRemoteDriverKitOSObject = v6->_privateFieldsOfRemoteDriverKitOSObject;
          v6->_privateFieldsOfRemoteDriverKitOSObject = v17;

        }
      }
      else
      {
        v6->_vtableOffsetOfLegacyOSObject = 88;
      }
      v6->_vtableOffsetsCount = 3;
      v21 = (unint64_t *)malloc_type_malloc(0x18uLL, 0x100004000313F17uLL);
      v6->_vtableOffsets = v21;
      *v21 = v6->_vtableOffsetOfRemoteDriverKitOSObject;
      v21[1] = v6->_vtableOffsetOfLocalDriverKitOSObject;
      v21[2] = v6->_vtableOffsetOfLegacyOSObject;
    }
    self = v6;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)dealloc
{
  unint64_t *vtableOffsets;
  objc_super v4;

  vtableOffsets = self->_vtableOffsets;
  if (vtableOffsets)
    free(vtableOffsets);
  v4.receiver = self;
  v4.super_class = (Class)VMUObjectIdentifierDriverKitSupport;
  -[VMUObjectIdentifierDriverKitSupport dealloc](&v4, sel_dealloc);
}

- (id)_fieldsFromStructureLayout:(id *)a3 withOffset:(unint64_t)a4
{
  int v4;
  void *v7;
  unint64_t var4;
  _IntrospectedObjectField *var5;
  mach_vm_address_t v10;
  mach_vm_address_t v11;
  VMUMutableFieldInfo *v12;
  void *v13;
  void *v14;
  VMUMutableFieldInfo *v15;

  v4 = a4;
  v7 = (void *)objc_opt_new();
  var4 = a3->var4;
  if (var4)
  {
    var5 = a3->var5;
    do
    {
      v10 = task_peek_string(self->_task, (mach_vm_address_t)var5->var0);
      v11 = task_peek_string(self->_task, (mach_vm_address_t)var5->var1);
      v12 = [VMUMutableFieldInfo alloc];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[VMUFieldInfo initWithName:type:scan:offset:size:](v12, "initWithName:type:scan:offset:size:", v13, v14, 1, (LODWORD(var5->var2) + v4), LODWORD(var5->var3));

      objc_msgSend(v7, "addObject:", v15);
      ++var5;
      --var4;
    }
    while (var4);
  }
  return v7;
}

- (id)_fieldsOfLegacyOSObject:(id)a3
{
  id v3;
  uint64_t v4;
  VMUMutableFieldInfo *v5;
  VMUMutableFieldInfo *v6;
  VMUMutableFieldInfo *v7;
  VMUMutableFieldInfo *v8;
  void *v9;
  void *v10;
  void *v11;
  VMUMutableFieldInfo *v12;
  id v14;
  VMUMutableFieldInfo *v15;
  VMUMutableFieldInfo *v16;
  VMUMutableFieldInfo *v17;
  VMUMutableFieldInfo *v18;
  VMUMutableFieldInfo *v19;
  VMUMutableFieldInfo *v20;
  VMUMutableFieldInfo *v21;
  VMUMutableFieldInfo *v22;
  VMUMutableFieldInfo *v23;
  VMUMutableFieldInfo *v24;
  VMUMutableFieldInfo *v25;
  VMUMutableFieldInfo *v26;
  VMUMutableFieldInfo *v27;
  VMUMutableFieldInfo *v28;
  _QWORD v29[21];

  v29[19] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "pointerSize");
  v28 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("server"), CFSTR("^{IOUserServer_IVars}"), 1, 0, v4);
  v25 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("objectRefsListEntryNext"), CFSTR("^v"), 4, 8, v4);
  v24 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("objectRefsListEntryPrev"), CFSTR("^v"), 4, 16, v4);
  v27 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("objectRef"), CFSTR("Q"), 0, 24, 8);
  v26 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("flags"), CFSTR("Q"), 0, 32, 8);
  v20 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("sendRights"), CFSTR("L"), 0, 40, 4);
  v23 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("remoteQueueCount"), CFSTR("L"), 0, 44, 4);
  v19 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("remoteMethodsCount"), CFSTR("L"), 0, 48, 4);
  v22 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("remoteQueues"), CFSTR("^Q"), 1, 56, v4);
  v21 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("remoteMethods"), CFSTR("^Q"), 1, 64, v4);
  v5 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("queueAlloc"), CFSTR("L"), 0, 72, 4);
  v6 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("queueArray"), CFSTR("^@\"IODispatchQueue\"), 1, 80, v4);
  v18 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("vtable"), CFSTR("^"), 0, 88, v4);
  v17 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("refcount"), CFSTR("l"), 0, 96, 4);
  v7 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("reserved"), CFSTR("l"), 0, 100, 4);
  v8 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("meta"), CFSTR("@"), 1, 104, v4);
  v16 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("metaClassPrivate"), CFSTR("^{OSMetaClassPrivate}"), 1, 112, v4);
  v15 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("retainCount"), CFSTR("i"), 0, 120, 4);
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v3, "className");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringWithFormat:", CFSTR("^{%@_IVars}"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("ivars"), v11, 1, 128, v4);
  v29[0] = v28;
  v29[1] = v25;
  v29[2] = v24;
  v29[3] = v27;
  v29[4] = v26;
  v29[5] = v20;
  v29[6] = v23;
  v29[7] = v19;
  v29[8] = v22;
  v29[9] = v21;
  v29[10] = v5;
  v29[11] = v6;
  v29[12] = v18;
  v29[13] = v17;
  v29[14] = v7;
  v29[15] = v8;
  v29[16] = v16;
  v29[17] = v15;
  v29[18] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 19);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_fieldsOfOSObject:(id)a3 startOffset:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  VMUMutableFieldInfo *v7;
  VMUMutableFieldInfo *v8;
  VMUMutableFieldInfo *v9;
  VMUMutableFieldInfo *v10;
  void *v11;
  void *v12;
  void *v13;
  VMUMutableFieldInfo *v14;
  void *v15;
  VMUMutableFieldInfo *v17;
  VMUMutableFieldInfo *v18;
  _QWORD v19[8];

  v19[7] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "pointerSize");
  v18 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("vtable"), CFSTR("^"), 0, a4, v6);
  v17 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("refcount"), CFSTR("l"), 0, (a4 + 8), 4);
  v7 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("reserved"), CFSTR("l"), 0, (a4 + 12), 4);
  v8 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("meta"), CFSTR("@"), 1, (a4 + 16), v6);
  v9 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("metaClassPrivate"), CFSTR("^{OSMetaClassPrivate}"), 1, (a4 + 24), v6);
  v10 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("extra"), CFSTR("i"), 0, (a4 + 32), 4);
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v5, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringWithFormat:", CFSTR("^{%@_IVars}"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[VMUFieldInfo initWithName:type:scan:offset:size:]([VMUMutableFieldInfo alloc], "initWithName:type:scan:offset:size:", CFSTR("ivars"), v13, 1, (a4 + 40), v6);
  v19[0] = v18;
  v19[1] = v17;
  v19[2] = v7;
  v19[3] = v8;
  v19[4] = v9;
  v19[5] = v10;
  v19[6] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_fieldsOfRemoteDriverKitOSObject:(id)a3
{
  unint64_t vtableOffsetOfRemoteDriverKitOSObject;
  NSArray *v6;
  void *v7;
  void *v8;

  vtableOffsetOfRemoteDriverKitOSObject = self->_vtableOffsetOfRemoteDriverKitOSObject;
  v6 = self->_privateFieldsOfRemoteDriverKitOSObject;
  -[VMUObjectIdentifierDriverKitSupport _fieldsOfOSObject:startOffset:](self, "_fieldsOfOSObject:startOffset:", a3, vtableOffsetOfRemoteDriverKitOSObject);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray arrayByAddingObjectsFromArray:](v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_fieldsOfLocalDriverKitOSObject:(id)a3
{
  unint64_t vtableOffsetOfLocalDriverKitOSObject;
  NSArray *v6;
  void *v7;
  void *v8;

  vtableOffsetOfLocalDriverKitOSObject = self->_vtableOffsetOfLocalDriverKitOSObject;
  v6 = self->_privateFieldsOfLocalDriverKitOSObject;
  -[VMUObjectIdentifierDriverKitSupport _fieldsOfOSObject:startOffset:](self, "_fieldsOfOSObject:startOffset:", a3, vtableOffsetOfLocalDriverKitOSObject);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray arrayByAddingObjectsFromArray:](v6, "arrayByAddingObjectsFromArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)classInfoForDriverKitOSClassScan
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_objectIdentifier);
  objc_msgSend(WeakRetained, "classInfoWithNonobjectType:binaryPath:", CFSTR("struct OSClassScan"), CFSTR("DriverKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)classInfoForDriverKitOSMetaClassPrivate
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_objectIdentifier);
  objc_msgSend(WeakRetained, "classInfoWithNonobjectType:binaryPath:", CFSTR("struct OSMetaClassPrivate"), CFSTR("DriverKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)classInfoForDriverKitOSMetaClass
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_objectIdentifier);
  objc_msgSend(WeakRetained, "classInfoWithNonobjectType:binaryPath:", CFSTR("OSMetaClass"), CFSTR("DriverKit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)classInfoForDriverKitMemory:(void *)a3 length:(unint64_t)a4 atOffset:(unint64_t)a5 translatedIsa:(unint64_t)a6 symbol:(_CSTypeRef)a7
{
  const char *Name;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  Name = (const char *)CSSymbolGetName();
  if (!Name)
    goto LABEL_4;
  v11 = (char *)Name;
  if (!strncmp(Name, "vtable for ", 0xBuLL))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11 + 11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "hasSuffix:", CFSTR("MetaClass")))
    {
      -[VMUObjectIdentifierDriverKitSupport classInfoForDriverKitOSMetaClass](self, "classInfoForDriverKitOSMetaClass");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a5)
      {
        CSSymbolGetSymbolOwner();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CSSymbolOwnerGetPath());
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[VMUClassInfo classInfoWithClassName:binaryPath:type:](VMUMutableClassInfo, "classInfoWithClassName:binaryPath:type:", v13, v14, 128);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (self->_vtableOffsetOfRemoteDriverKitOSObject == a5)
        {
          -[VMUObjectIdentifierDriverKitSupport _fieldsOfRemoteDriverKitOSObject:](self, "_fieldsOfRemoteDriverKitOSObject:", v12);
          v15 = objc_claimAutoreleasedReturnValue();
        }
        else if (self->_vtableOffsetOfLocalDriverKitOSObject == a5)
        {
          -[VMUObjectIdentifierDriverKitSupport _fieldsOfLocalDriverKitOSObject:](self, "_fieldsOfLocalDriverKitOSObject:", v12);
          v15 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (self->_vtableOffsetOfLegacyOSObject != a5)
            goto LABEL_22;
          -[VMUObjectIdentifierDriverKitSupport _fieldsOfLegacyOSObject:](self, "_fieldsOfLegacyOSObject:", v12);
          v15 = objc_claimAutoreleasedReturnValue();
        }
        v16 = (void *)v15;
        if (v15)
        {
          objc_msgSend(v12, "setFields:", v15);

        }
        goto LABEL_22;
      }
      v12 = 0;
    }
LABEL_22:

    return v12;
  }
  if (a5 || !strstr(v11, "_Class"))
  {
LABEL_4:
    v12 = 0;
    return v12;
  }
  if (a4 < 0x28)
    -[VMUObjectIdentifierDriverKitSupport classInfoForDriverKitOSClassScan](self, "classInfoForDriverKitOSClassScan");
  else
    -[VMUObjectIdentifierDriverKitSupport classInfoForDriverKitOSMetaClassPrivate](self, "classInfoForDriverKitOSMetaClassPrivate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  return v12;
}

- (id)driverKitClassInfoForMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  unint64_t vtableOffsetsCount;
  unint64_t v10;
  VMUObjectIdentifier **p_objectIdentifier;
  unint64_t v12;
  id WeakRetained;
  void *v14;

  vtableOffsetsCount = self->_vtableOffsetsCount;
  if ((_DWORD)vtableOffsetsCount)
  {
    v10 = 0;
    p_objectIdentifier = &self->_objectIdentifier;
    do
    {
      v12 = self->_vtableOffsets[v10];
      if (v12 + 8 <= a4)
      {
        WeakRetained = objc_loadWeakRetained((id *)p_objectIdentifier);
        objc_msgSend(WeakRetained, "_classInfoForMemory:length:atOffset:remoteAddress:", a3, a4, v12, a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          return v14;
        vtableOffsetsCount = self->_vtableOffsetsCount;
      }
      ++v10;
    }
    while (v10 < vtableOffsetsCount);
  }
  v14 = 0;
  return v14;
}

- (id)_labelForDriverKitOSClassLoadInformation:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  BOOL v5;
  id WeakRetained;
  void *Name;

  if (HIDWORD(*(_QWORD *)a3))
    v5 = (*(_QWORD *)a3 & 7) == 0;
  else
    v5 = 0;
  if (v5
    && (WeakRetained = objc_loadWeakRetained((id *)&self->_objectIdentifier),
        objc_msgSend(WeakRetained, "symbolicator"),
        CSSymbolicatorGetSymbolWithAddressAtTime(),
        WeakRetained,
        (CSIsNull() & 1) == 0))
  {
    Name = (void *)CSSymbolGetName();
    if (Name)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", Name);
      Name = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    Name = 0;
  }
  return Name;
}

- (id)_labelForDriverKitOSMetaClass:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5
{
  uint64_t v7;
  VMUObjectIdentifier **p_objectIdentifier;
  id WeakRetained;
  const char *Name;
  const char *v12;
  void *v13;

  if (self->_vtableOffsetsCount)
  {
    v7 = 0;
    p_objectIdentifier = &self->_objectIdentifier;
    while (1)
    {
      if (HIDWORD(*(_QWORD *)((char *)a3 + self->_vtableOffsets[v7]))
        && (*(_QWORD *)((_BYTE *)a3 + self->_vtableOffsets[v7]) & 7) == 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)p_objectIdentifier);
        objc_msgSend(WeakRetained, "symbolicator");
        CSSymbolicatorGetSymbolWithAddressAtTime();

        if ((CSIsNull() & 1) == 0)
        {
          Name = (const char *)CSSymbolGetName();
          if (Name)
          {
            v12 = Name;
            if (!strncmp(Name, "vtable for ", 0xBuLL))
              break;
          }
        }
      }
      if (++v7 >= (unint64_t)self->_vtableOffsetsCount)
        goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v12 + 11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_12:
    v13 = 0;
  }
  return v13;
}

- (id)labelForDriverKitMemory:(void *)a3 length:(unint64_t)a4 remoteAddress:(unint64_t)a5 class:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v17;
  int v18;

  v10 = a6;
  objc_msgSend(v10, "className");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("struct OSClassScan")))
  {

LABEL_4:
    -[VMUObjectIdentifierDriverKitSupport _labelForDriverKitOSClassLoadInformation:length:remoteAddress:](self, "_labelForDriverKitOSClassLoadInformation:length:remoteAddress:", a3, a4, a5);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(v10, "className");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("struct OSMetaClassPrivate"));

  if (v13)
    goto LABEL_4;
  objc_msgSend(v10, "className");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("OSMetaClass"));

  if (!v18)
  {
    v15 = 0;
    goto LABEL_6;
  }
  -[VMUObjectIdentifierDriverKitSupport _labelForDriverKitOSMetaClass:length:remoteAddress:](self, "_labelForDriverKitOSMetaClass:length:remoteAddress:", a3, a4, a5);
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v15 = (void *)v14;
LABEL_6:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateFieldsOfLocalDriverKitOSObject, 0);
  objc_storeStrong((id *)&self->_privateFieldsOfRemoteDriverKitOSObject, 0);
  objc_destroyWeak((id *)&self->_objectIdentifier);
}

@end
