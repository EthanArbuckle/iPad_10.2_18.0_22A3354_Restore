@implementation GPBMessage

+ (void)initialize
{
  id v3;

  v3 = (id)objc_opt_class(GPBMessage);
  if ((id)objc_opt_class(a1) == v3)
  {
    objc_msgSend(a1, "descriptor");
    objc_opt_class(GPBRootObject);
  }
  else if (objc_msgSend(a1, "superclass") == v3)
  {
    objc_msgSend(a1, "descriptor");
  }
}

+ (GPBMessage)allocWithZone:(_NSZone *)a3
{
  return (GPBMessage *)NSAllocateObject((Class)a1, *((unsigned int *)objc_msgSend(a1, "descriptor") + 6), a3);
}

+ (id)descriptor
{
  id result;
  uint64_t v3;

  result = (id)qword_1003893B0;
  if (!qword_1003893B0)
  {
    qword_1003893B8 = -[GPBFileDescriptor initWithPackage:syntax:]([GPBFileDescriptor alloc], "initWithPackage:syntax:", CFSTR("internal"), 2);
    LODWORD(v3) = 0;
    result = +[GPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](GPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", objc_opt_class(GPBMessage), 0, qword_1003893B8, 0, 0, 0, v3);
    qword_1003893B0 = (uint64_t)result;
  }
  return result;
}

+ (id)message
{
  return objc_alloc_init((Class)a1);
}

- (GPBMessage)init
{
  GPBMessage *v2;
  GPBMessage *v3;
  objc_class *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GPBMessage;
  v2 = -[GPBMessage init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v3->messageStorage_ = (GPBMessage_Storage *)((char *)v3 + class_getInstanceSize(v4));
  }
  return v3;
}

- (GPBMessage)initWithData:(id)a3 error:(id *)a4
{
  return -[GPBMessage initWithData:extensionRegistry:error:](self, "initWithData:extensionRegistry:error:", a3, 0, a4);
}

- (GPBMessage)initWithData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  GPBMessage *v8;
  GPBMessage *v9;

  v8 = -[GPBMessage init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[GPBMessage mergeFromData:extensionRegistry:](v8, "mergeFromData:extensionRegistry:", a3, a4);
    if (a5)
      *a5 = 0;
  }
  return v9;
}

- (GPBMessage)initWithCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  GPBMessage *v8;
  GPBMessage *v9;

  v8 = -[GPBMessage init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[GPBMessage mergeFromCodedInputStream:extensionRegistry:](v8, "mergeFromCodedInputStream:extensionRegistry:", a3, a4);
    if (a5)
      *a5 = 0;
  }
  return v9;
}

- (void)dealloc
{
  NSObject *v4;
  objc_super v5;

  -[GPBMessage internalClear:](self, "internalClear:", 0);
  if (self->autocreator_)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[GPBMessage dealloc]"), CFSTR("GPBMessage.m"), 946, CFSTR("Autocreator was not cleared before dealloc."));
  if (atomic_load((unint64_t *)&self->readOnlySemaphore_))
  {
    v4 = atomic_load((unint64_t *)&self->readOnlySemaphore_);
    dispatch_release(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)GPBMessage;
  -[GPBMessage dealloc](&v5, "dealloc");
}

- (void)copyFieldsInto:(id)a3 zone:(_NSZone *)a4 descriptor:(id)a5
{
  _QWORD *v7;
  GPBMessage *v8;
  void *v9;
  id v10;
  id v11;
  int *v12;
  void *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int *v18;
  unsigned int v19;
  unsigned int v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  id v26;
  int v27;
  uint64_t v28;
  id v29;
  id v30;
  GPBMessage *v31;
  _QWORD *v32;
  void *v33;
  id v34;
  uint64_t v35;
  _QWORD v36[6];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];

  v7 = a3;
  v8 = self;
  memcpy(*((void **)a3 + 8), self->messageStorage_, *((unsigned int *)a5 + 6));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v9 = (void *)*((_QWORD *)a5 + 1);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v10)
  {
    v11 = v10;
    v12 = &OBJC_IVAR___GPBFieldDescriptor_description_;
    v35 = *(_QWORD *)v42;
    v31 = v8;
    v32 = v7;
    v33 = v9;
    do
    {
      v13 = 0;
      v34 = v11;
      do
      {
        if (*(_QWORD *)v42 != v35)
          objc_enumerationMutation(v9);
        v14 = *(char **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v13);
        v15 = *(_QWORD *)&v14[*v12];
        if ((*(_WORD *)(v15 + 28) & 0xF02) != 0)
        {
          v16 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)v8, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v13));
          if (!v16)
            goto LABEL_38;
          v17 = (void *)v16;
          v18 = v12;
          v19 = *(unsigned __int8 *)(*(_QWORD *)&v14[*v12] + 30) - 15;
          v20 = objc_msgSend(v14, "fieldType");
          if (v19 <= 1)
          {
            if (v20 == 1)
            {
              v21 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v17, "count"));
              v37 = 0u;
              v38 = 0u;
              v39 = 0u;
              v40 = 0u;
              v22 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v38;
                do
                {
                  for (i = 0; i != v23; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v38 != v24)
                      objc_enumerationMutation(v17);
                    v26 = objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i), "copyWithZone:", a4);
                    objc_msgSend(v21, "addObject:", v26);

                  }
                  v23 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
                }
                while (v23);
                v8 = v31;
                v7 = v32;
              }
              v9 = v33;
              v12 = v18;
LABEL_36:
              v11 = v34;
LABEL_37:
              v30 = v17;
              GPBSetRetainedObjectIvarWithFieldPrivate(v7, v14, v21);
              goto LABEL_38;
            }
            v12 = v18;
            if (objc_msgSend(v14, "mapKeyDataType") == 14)
            {
              v21 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v17, "count"));
              v36[0] = _NSConcreteStackBlock;
              v36[1] = 3221225472;
              v36[2] = sub_10029164C;
              v36[3] = &unk_100364778;
              v36[4] = v21;
              v36[5] = a4;
              objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v36);
              goto LABEL_36;
            }
            v29 = objc_msgSend(v17, "deepCopyWithZone:", a4);
LABEL_35:
            v21 = v29;
            goto LABEL_36;
          }
          if (v20 == 1)
          {
            v12 = v18;
            v28 = *v18;
LABEL_31:
            if (*(unsigned __int8 *)(*(_QWORD *)&v14[v28] + 30) - 13 <= 3)
            {
              v29 = objc_msgSend(v17, "mutableCopyWithZone:", a4);
              goto LABEL_35;
            }
          }
          else
          {
            v12 = v18;
            if (objc_msgSend(v14, "mapKeyDataType") == 14)
            {
              v28 = *v18;
              goto LABEL_31;
            }
          }
          v29 = objc_msgSend(v17, "copyWithZone:", a4);
          goto LABEL_35;
        }
        v27 = *(unsigned __int8 *)(v15 + 30);
        if ((v27 - 15) <= 1)
        {
          if (!GPBGetHasIvar((uint64_t)v8, *(_DWORD *)(v15 + 20), *(_DWORD *)(v15 + 16)))
          {
            *(_QWORD *)(v7[8] + *(unsigned int *)(*(_QWORD *)&v14[*v12] + 24)) = 0;
            goto LABEL_38;
          }
LABEL_26:
          v17 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)v8, (uint64_t)v14);
          v21 = objc_msgSend(v17, "copyWithZone:", a4);
          goto LABEL_37;
        }
        if ((v27 - 13) <= 3 && GPBGetHasIvar((uint64_t)v8, *(_DWORD *)(v15 + 20), *(_DWORD *)(v15 + 16)))
          goto LABEL_26;
LABEL_38:
        v13 = (char *)v13 + 1;
      }
      while (v13 != v11);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v11);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  _QWORD *v6;

  v5 = -[GPBMessage descriptor](self, "descriptor");
  v6 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "messageClass"), "allocWithZone:", a3), "init");
  -[GPBMessage copyFieldsInto:zone:descriptor:](self, "copyFieldsInto:zone:descriptor:", v6, a3, v5);
  v6[1] = -[GPBUnknownFieldSet copyWithZone:](self->unknownFields_, "copyWithZone:", a3);
  v6[2] = sub_100291718(self->extensionMap_, (uint64_t)a3);
  return v6;
}

- (void)clear
{
  -[GPBMessage internalClear:](self, "internalClear:", 1);
}

- (void)internalClear:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  int *v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  GPBMessage **v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  uint64_t v25;
  _QWORD *v26;
  _BOOL4 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v27 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v26 = -[GPBMessage descriptor](self, "descriptor");
  v4 = (void *)v26[1];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v10 = v9[1];
        if ((*(_WORD *)(v10 + 28) & 0xF02) != 0)
        {
          v11 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i));
          if (!v11)
            continue;
          v12 = (char *)v11;
          if (objc_msgSend(v9, "fieldType") == 1)
          {
            if (*(unsigned __int8 *)(v9[1] + 30) - 13 <= 3)
            {
              v13 = objc_opt_class(GPBAutocreatedArray);
              if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
              {
                v14 = &OBJC_IVAR___GPBAutocreatedArray__autocreator;
                goto LABEL_24;
              }
LABEL_27:

              continue;
            }
            v14 = &OBJC_IVAR___GPBInt32Array__autocreator;
LABEL_24:
            v18 = *v14;
          }
          else
          {
            if (objc_msgSend(v9, "mapKeyDataType") == 14
              && *(unsigned __int8 *)(v9[1] + 30) - 13 <= 3)
            {
              v17 = objc_opt_class(GPBAutocreatedDictionary);
              if ((objc_opt_isKindOfClass(v12, v17) & 1) == 0)
                goto LABEL_27;
              v14 = &OBJC_IVAR___GPBAutocreatedDictionary__autocreator;
              goto LABEL_24;
            }
            v18 = 8;
          }
          v19 = (GPBMessage **)&v12[v18];
          if (*v19 == self)
            *v19 = 0;
          goto LABEL_27;
        }
        v15 = *(unsigned __int8 *)(v10 + 30);
        if ((v15 - 15) <= 1)
        {
          GPBClearAutocreatedMessageIvarWithField((uint64_t)self, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i));
          v16 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v9);
LABEL_21:

          continue;
        }
        if ((v15 - 13) <= 3 && GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v10 + 20), *(_DWORD *)(v10 + 16)))
        {
          v16 = GPBGetObjectIvarWithField((uint64_t)self, v9);
          goto LABEL_21;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v6);
  }
  v20 = -[NSMutableDictionary allValues](self->autocreatedExtensionMap_, "allValues");

  self->autocreatedExtensionMap_ = 0;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
        if (*(GPBMessage **)(v25 + 32) != self)
          -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[GPBMessage internalClear:]"), CFSTR("GPBMessage.m"), 1135, CFSTR("Autocreated extension does not refer back to self."));
        GPBClearMessageAutocreator(v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v22);
  }

  self->extensionMap_ = 0;
  self->unknownFields_ = 0;
  if (v27)
    bzero(self->messageStorage_, *((unsigned int *)v26 + 6));
}

- (BOOL)isInitialized
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unsigned int v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  unsigned __int8 IsInitializedInternalHelper;
  NSMutableDictionary *extensionMap;
  BOOL v17;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];

  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v3 = (void *)*((_QWORD *)-[GPBMessage descriptor](self, "descriptor") + 1);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v30;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v5)
        objc_enumerationMutation(v3);
      v7 = *(_QWORD **)(*((_QWORD *)&v29 + 1) + 8 * v6);
      if (objc_msgSend(v7, "isRequired")
        && !GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v7[1] + 20), *(_DWORD *)(v7[1] + 16)))
      {
        return 0;
      }
      if (*(unsigned __int8 *)(v7[1] + 30) - 15 > 1)
        goto LABEL_33;
      v8 = objc_msgSend(v7, "fieldType");
      if (v8 == 1)
      {
        v9 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v7);
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v26;
LABEL_15:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v9);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v12), "isInitialized"))
              return 0;
            if (v10 == (id)++v12)
            {
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
              if (v10)
                goto LABEL_15;
              goto LABEL_33;
            }
          }
        }
        goto LABEL_33;
      }
      if (v8)
      {
        v13 = objc_msgSend(v7, "mapKeyDataType") == 14;
        v14 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v7);
        if (!v13)
        {
          if (v14 && !objc_msgSend(v14, "isInitialized"))
            return 0;
          goto LABEL_33;
        }
        if (v14)
        {
          IsInitializedInternalHelper = GPBDictionaryIsInitializedInternalHelper(v14, v7);
          goto LABEL_29;
        }
      }
      else
      {
        if (objc_msgSend(v7, "isRequired"))
          goto LABEL_28;
        if ((objc_msgSend(v7, "isOptional") & 1) == 0)
          -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBMessage.m"), 1173, CFSTR("%@: Single message field %@ not required or optional?"), objc_opt_class(self), objc_msgSend(v7, "name"));
        if (GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v7[1] + 20), *(_DWORD *)(v7[1] + 16)))
        {
LABEL_28:
          IsInitializedInternalHelper = objc_msgSend((id)GPBGetMessageMessageField(self, v7), "isInitialized");
LABEL_29:
          if ((IsInitializedInternalHelper & 1) == 0)
            return 0;
        }
      }
LABEL_33:
      if ((id)++v6 == v4)
      {
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 1;
  extensionMap = self->extensionMap_;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10029223C;
  v20[3] = &unk_1003647A0;
  v20[4] = &v21;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](extensionMap, "enumerateKeysAndObjectsUsingBlock:", v20);
  v17 = *((_BYTE *)v22 + 24) != 0;
  _Block_object_dispose(&v21, 8);
  return v17;
}

- (id)descriptor
{
  return objc_msgSend((id)objc_opt_class(self), "descriptor");
}

- (id)data
{
  NSMutableData *v3;
  GPBCodedOutputStream *v4;

  v3 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", -[GPBMessage serializedSize](self, "serializedSize"));
  v4 = -[GPBCodedOutputStream initWithData:]([GPBCodedOutputStream alloc], "initWithData:", v3);
  -[GPBMessage writeToCodedOutputStream:](self, "writeToCodedOutputStream:", v4);

  return v3;
}

- (id)delimitedData
{
  unint64_t v3;
  NSMutableData *v4;
  GPBCodedOutputStream *v5;

  v3 = -[GPBMessage serializedSize](self, "serializedSize");
  v4 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", GPBComputeRawVarint32SizeForInteger(v3) + v3);
  v5 = -[GPBCodedOutputStream initWithData:]([GPBCodedOutputStream alloc], "initWithData:", v4);
  -[GPBMessage writeDelimitedToCodedOutputStream:](self, "writeDelimitedToCodedOutputStream:", v5);

  return v4;
}

- (void)writeToOutputStream:(id)a3
{
  GPBCodedOutputStream *v4;

  v4 = -[GPBCodedOutputStream initWithOutputStream:]([GPBCodedOutputStream alloc], "initWithOutputStream:", a3);
  -[GPBMessage writeToCodedOutputStream:](self, "writeToCodedOutputStream:", v4);

}

- (void)writeToCodedOutputStream:(id)a3
{
  _QWORD *v5;
  void *v6;
  char *v7;
  _QWORD *v8;
  unsigned int v9;
  id v10;
  BOOL v11;
  id v12;
  unint64_t v13;
  char *v14;
  _QWORD *v15;
  _QWORD *v16;
  unsigned __int8 v17;
  GPBUnknownFieldSet *unknownFields;
  void *v19;

  v5 = -[GPBMessage descriptor](self, "descriptor");
  v6 = (void *)v5[1];
  v7 = (char *)objc_msgSend(v6, "count");
  v8 = objc_msgSend(v5, "extensionRanges");
  v19 = v5;
  v9 = objc_msgSend(v5, "extensionRangesCount");
  v10 = objc_msgSend(-[NSMutableDictionary allKeys](self->extensionMap_, "allKeys"), "sortedArrayUsingSelector:", "compareByFieldNumber:");
  if (v7)
    v11 = 0;
  else
    v11 = v9 == 0;
  if (!v11)
  {
    v12 = v10;
    v13 = 0;
    v14 = 0;
    do
    {
      if (v14 == v7)
      {
        -[GPBMessage writeExtensionsToCodedOutputStream:range:sortedExtensions:](self, "writeExtensionsToCodedOutputStream:range:sortedExtensions:", a3, v8[v13], v12);
        v14 = v7;
        ++v13;
      }
      else if (v13 == v9
             || (v15 = objc_msgSend(v6, "objectAtIndexedSubscript:", v14),
                 v16 = &v8[v13],
                 *(_DWORD *)(v15[1] + 16) < *(_DWORD *)v16))
      {
        -[GPBMessage writeField:toCodedOutputStream:](self, "writeField:toCodedOutputStream:", objc_msgSend(v6, "objectAtIndexedSubscript:", v14++), a3);
      }
      else
      {
        ++v13;
        -[GPBMessage writeExtensionsToCodedOutputStream:range:sortedExtensions:](self, "writeExtensionsToCodedOutputStream:range:sortedExtensions:", a3, *v16, v12);
      }
    }
    while (v14 < v7 || v13 < v9);
  }
  v17 = objc_msgSend(v19, "isWireFormat");
  unknownFields = self->unknownFields_;
  if ((v17 & 1) != 0)
    -[GPBUnknownFieldSet writeAsMessageSetTo:](unknownFields, "writeAsMessageSetTo:", a3);
  else
    -[GPBUnknownFieldSet writeToCodedOutputStream:](unknownFields, "writeToCodedOutputStream:", a3);
}

- (void)writeDelimitedToOutputStream:(id)a3
{
  GPBCodedOutputStream *v4;

  v4 = -[GPBCodedOutputStream initWithOutputStream:]([GPBCodedOutputStream alloc], "initWithOutputStream:", a3);
  -[GPBMessage writeDelimitedToCodedOutputStream:](self, "writeDelimitedToCodedOutputStream:", v4);

}

- (void)writeDelimitedToCodedOutputStream:(id)a3
{
  objc_msgSend(a3, "writeRawVarintSizeTAs32:", -[GPBMessage serializedSize](self, "serializedSize"));
  -[GPBMessage writeToCodedOutputStream:](self, "writeToCodedOutputStream:", a3);
}

- (void)writeField:(id)a3 toCodedOutputStream:(id)a4
{
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v7 = objc_msgSend(a3, "fieldType");
  if (v7
    || GPBGetHasIvar((uint64_t)self, *(_DWORD *)(*((_QWORD *)a3 + 1) + 20), *(_DWORD *)(*((_QWORD *)a3 + 1) + 16)))
  {
    v8 = *((_QWORD *)a3 + 1);
    v9 = *(unsigned int *)(v8 + 16);
    switch(*(_BYTE *)(v8 + 30))
    {
      case 0:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v10 = GPBFieldTag((uint64_t)a3);
          else
            v10 = 0;
          v40 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          objc_msgSend(a4, "writeBoolArray:values:tag:", v9, v40, v10);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          objc_msgSend(a4, "writeBool:value:", v9, GPBGetMessageBoolField((uint64_t)self, a3));
        }
        break;
      case 1:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v11 = GPBFieldTag((uint64_t)a3);
          else
            v11 = 0;
          objc_msgSend(a4, "writeFixed32Array:values:tag:", v9, GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3), v11);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v28 = GPBGetMessageUInt32Field((uint64_t)self, a3);
          objc_msgSend(a4, "writeFixed32:value:", v9, v28, v53);
        }
        break;
      case 2:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v12 = GPBFieldTag((uint64_t)a3);
          else
            v12 = 0;
          v41 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          objc_msgSend(a4, "writeSFixed32Array:values:tag:", v9, v41, v12);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v29 = GPBGetMessageInt32Field((uint64_t)self, a3);
          objc_msgSend(a4, "writeSFixed32:value:", v9, v29, v59);
        }
        break;
      case 3:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v13 = GPBFieldTag((uint64_t)a3);
          else
            v13 = 0;
          v42 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          objc_msgSend(a4, "writeFloatArray:values:tag:", v9, v42, v13);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          GPBGetMessageFloatField((uint64_t)self, a3);
          objc_msgSend(a4, "writeFloat:value:", v9, v55, v56);
        }
        break;
      case 4:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v14 = GPBFieldTag((uint64_t)a3);
          else
            v14 = 0;
          objc_msgSend(a4, "writeFixed64Array:values:tag:", v9, GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3), v14);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v30 = GPBGetMessageUInt64Field((uint64_t)self, a3);
          objc_msgSend(a4, "writeFixed64:value:", v9, v30, v54);
        }
        break;
      case 5:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v15 = GPBFieldTag((uint64_t)a3);
          else
            v15 = 0;
          v43 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          objc_msgSend(a4, "writeSFixed64Array:values:tag:", v9, v43, v15);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v31 = GPBGetMessageInt64Field((uint64_t)self, a3);
          objc_msgSend(a4, "writeSFixed64:value:", v9, v31, v60);
        }
        break;
      case 6:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v16 = GPBFieldTag((uint64_t)a3);
          else
            v16 = 0;
          v44 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          objc_msgSend(a4, "writeDoubleArray:values:tag:", v9, v44, v16);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          GPBGetMessageDoubleField((uint64_t)self, a3);
          objc_msgSend(a4, "writeDouble:value:", v9, v51, v52);
        }
        break;
      case 7:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v17 = GPBFieldTag((uint64_t)a3);
          else
            v17 = 0;
          v45 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          objc_msgSend(a4, "writeInt32Array:values:tag:", v9, v45, v17);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v32 = GPBGetMessageInt32Field((uint64_t)self, a3);
          objc_msgSend(a4, "writeInt32:value:", v9, v32, v57);
        }
        break;
      case 8:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v18 = GPBFieldTag((uint64_t)a3);
          else
            v18 = 0;
          v46 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          objc_msgSend(a4, "writeInt64Array:values:tag:", v9, v46, v18);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v33 = GPBGetMessageInt64Field((uint64_t)self, a3);
          objc_msgSend(a4, "writeInt64:value:", v9, v33, v58);
        }
        break;
      case 9:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v19 = GPBFieldTag((uint64_t)a3);
          else
            v19 = 0;
          v47 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          objc_msgSend(a4, "writeSInt32Array:values:tag:", v9, v47, v19);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v34 = GPBGetMessageInt32Field((uint64_t)self, a3);
          objc_msgSend(a4, "writeSInt32:value:", v9, v34, v61);
        }
        break;
      case 0xA:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v20 = GPBFieldTag((uint64_t)a3);
          else
            v20 = 0;
          v48 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          objc_msgSend(a4, "writeSInt64Array:values:tag:", v9, v48, v20);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v35 = GPBGetMessageInt64Field((uint64_t)self, a3);
          objc_msgSend(a4, "writeSInt64:value:", v9, v35, v62);
        }
        break;
      case 0xB:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v21 = GPBFieldTag((uint64_t)a3);
          else
            v21 = 0;
          v49 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          objc_msgSend(a4, "writeUInt32Array:values:tag:", v9, v49, v21);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v36 = GPBGetMessageUInt32Field((uint64_t)self, a3);
          objc_msgSend(a4, "writeUInt32:value:", v9, v36, v63);
        }
        break;
      case 0xC:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v22 = GPBFieldTag((uint64_t)a3);
          else
            v22 = 0;
          objc_msgSend(a4, "writeUInt64Array:values:tag:", v9, GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3), v22);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v37 = GPBGetMessageUInt64Field((uint64_t)self, a3);
          objc_msgSend(a4, "writeUInt64:value:", v9, v37, v64);
        }
        break;
      case 0xD:
        v23 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          objc_msgSend(a4, "writeBytesArray:values:", v9, v23);
        }
        else
        {
          if (v7)
            goto LABEL_88;
          objc_msgSend(a4, "writeBytes:value:", v9, v23);
        }
        break;
      case 0xE:
        v23 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          objc_msgSend(a4, "writeStringArray:values:", v9, v23, v24);
        }
        else
        {
          if (v7)
            goto LABEL_88;
          objc_msgSend(a4, "writeString:value:", v9, v23);
        }
        break;
      case 0xF:
        v23 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          objc_msgSend(a4, "writeMessageArray:values:", v9, v23, v25);
        }
        else
        {
          if (v7)
            goto LABEL_88;
          objc_msgSend(a4, "writeMessage:value:", v9, v23);
        }
        break;
      case 0x10:
        v23 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          objc_msgSend(a4, "writeGroupArray:values:", v9, v23, v26);
        }
        else if (v7)
        {
LABEL_88:
          if (objc_msgSend(a3, "mapKeyDataType") != 14)
          {
            v39 = v23;
            goto LABEL_93;
          }
          GPBDictionaryWriteToStreamInternalHelper(a4, v23, a3);
        }
        else
        {
          objc_msgSend(a4, "writeGroup:value:", v9, v23);
        }
        break;
      case 0x11:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v27 = GPBFieldTag((uint64_t)a3);
          else
            v27 = 0;
          v50 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
          objc_msgSend(a4, "writeEnumArray:values:tag:", v9, v50, v27);
        }
        else if (v7)
        {
LABEL_92:
          v39 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)a3);
LABEL_93:
          objc_msgSend(v39, "writeToCodedOutputStream:asField:", a4, a3, v38);
        }
        else
        {
          objc_msgSend(a4, "writeEnum:value:", v9, GPBGetMessageInt32Field((uint64_t)self, a3));
        }
        break;
      default:
        return;
    }
  }
}

- (id)getExtension:(id)a3
{
  _QWORD *v5;
  NSObject *v6;
  NSMutableDictionary *autocreatedExtensionMap;
  NSObject *v8;

  sub_100293218((uint64_t)self, a3);
  v5 = -[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", a3);
  if (v5)
    return v5;
  if ((objc_msgSend(a3, "isRepeated") & 1) != 0)
    return 0;
  if (*(unsigned __int8 *)(*((_QWORD *)a3 + 1) + 44) - 15 < 2)
  {
    GPBPrepareReadOnlySemaphore((uint64_t)self);
    v6 = atomic_load((unint64_t *)&self->readOnlySemaphore_);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    v5 = -[NSMutableDictionary objectForKey:](self->autocreatedExtensionMap_, "objectForKey:", a3);
    if (!v5)
    {
      v5 = objc_alloc_init((Class)objc_msgSend(a3, "msgClass"));
      v5[4] = self;
      v5[6] = a3;
      autocreatedExtensionMap = self->autocreatedExtensionMap_;
      if (!autocreatedExtensionMap)
      {
        autocreatedExtensionMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        self->autocreatedExtensionMap_ = autocreatedExtensionMap;
      }
      -[NSMutableDictionary setObject:forKey:](autocreatedExtensionMap, "setObject:forKey:", v5, a3);

    }
    v8 = atomic_load((unint64_t *)&self->readOnlySemaphore_);
    dispatch_semaphore_signal(v8);
    return v5;
  }
  return objc_msgSend(a3, "defaultValue");
}

- (id)getExistingExtension:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", a3);
}

- (BOOL)hasExtension:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", a3) != 0;
}

- (id)extensionsCurrentlySet
{
  return -[NSMutableDictionary allKeys](self->extensionMap_, "allKeys");
}

- (void)writeExtensionsToCodedOutputStream:(id)a3 range:(GPBExtensionRange)a4 sortedExtensions:(id)a5
{
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(a5);
        v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v14 = objc_msgSend(v13, "fieldNumber");
        if (v14 >= a4.var0)
        {
          if (v14 >= a4.var1)
            return;
          GPBWriteExtensionValueToOutputStream((uint64_t)v13, -[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", v13), a3);
        }
      }
      v10 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }
}

- (void)setExtension:(id)a3 value:(id)a4
{
  NSMutableDictionary *extensionMap;
  id v8;

  if (a4)
  {
    sub_100293218((uint64_t)self, a3);
    if (objc_msgSend(a3, "isRepeated"))
      +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Must call addExtension() for repeated types."));
    extensionMap = self->extensionMap_;
    if (!extensionMap)
    {
      extensionMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      self->extensionMap_ = extensionMap;
    }
    -[NSMutableDictionary setObject:forKey:](extensionMap, "setObject:forKey:", a4, a3);
    if (*(unsigned __int8 *)(*((_QWORD *)a3 + 1) + 44) - 15 <= 1
      && (objc_msgSend(a3, "isRepeated") & 1) == 0)
    {
      v8 = -[NSMutableDictionary objectForKey:](self->autocreatedExtensionMap_, "objectForKey:", a3);
      -[NSMutableDictionary removeObjectForKey:](self->autocreatedExtensionMap_, "removeObjectForKey:", a3);
      GPBClearMessageAutocreator((uint64_t)v8);

    }
    GPBBecomeVisibleToAutocreator(self);
  }
  else
  {
    -[GPBMessage clearExtension:](self, "clearExtension:");
  }
}

- (void)addExtension:(id)a3 value:(id)a4
{
  NSMutableDictionary *extensionMap;
  id v8;

  sub_100293218((uint64_t)self, a3);
  if ((objc_msgSend(a3, "isRepeated") & 1) == 0)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Must call setExtension() for singular types."));
  extensionMap = self->extensionMap_;
  if (!extensionMap)
  {
    extensionMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->extensionMap_ = extensionMap;
  }
  v8 = -[NSMutableDictionary objectForKey:](extensionMap, "objectForKey:", a3);
  if (!v8)
  {
    v8 = +[NSMutableArray array](NSMutableArray, "array");
    -[NSMutableDictionary setObject:forKey:](self->extensionMap_, "setObject:forKey:", v8, a3);
  }
  objc_msgSend(v8, "addObject:", a4);
  GPBBecomeVisibleToAutocreator(self);
}

- (void)setExtension:(id)a3 index:(unint64_t)a4 value:(id)a5
{
  NSMutableDictionary *extensionMap;

  sub_100293218((uint64_t)self, a3);
  if ((objc_msgSend(a3, "isRepeated") & 1) == 0)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Must call setExtension() for singular types."));
  extensionMap = self->extensionMap_;
  if (!extensionMap)
  {
    extensionMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->extensionMap_ = extensionMap;
  }
  objc_msgSend(-[NSMutableDictionary objectForKey:](extensionMap, "objectForKey:", a3), "replaceObjectAtIndex:withObject:", a4, a5);
  GPBBecomeVisibleToAutocreator(self);
}

- (void)clearExtension:(id)a3
{
  sub_100293218((uint64_t)self, a3);
  if (-[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", a3))
  {
    -[NSMutableDictionary removeObjectForKey:](self->extensionMap_, "removeObjectForKey:", a3);
    GPBBecomeVisibleToAutocreator(self);
  }
}

- (void)mergeFromData:(id)a3 extensionRegistry:(id)a4
{
  GPBCodedInputStream *v6;

  v6 = -[GPBCodedInputStream initWithData:]([GPBCodedInputStream alloc], "initWithData:", a3);
  -[GPBMessage mergeFromCodedInputStream:extensionRegistry:](self, "mergeFromCodedInputStream:extensionRegistry:", v6, a4);
  -[GPBCodedInputStream checkLastTagWas:](v6, "checkLastTagWas:", 0);

}

- (void)mergeDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4
{
  uint64_t *v6;
  id RetainedBytesNoCopy;
  id v8;

  v6 = (uint64_t *)((char *)a3 + 8);
  if (!GPBCodedInputStreamIsAtEnd((_QWORD *)a3 + 1))
  {
    RetainedBytesNoCopy = GPBCodedInputStreamReadRetainedBytesNoCopy(v6);
    if (RetainedBytesNoCopy)
    {
      v8 = RetainedBytesNoCopy;
      -[GPBMessage mergeFromData:extensionRegistry:](self, "mergeFromData:extensionRegistry:", RetainedBytesNoCopy, a4);

    }
  }
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  return objc_msgSend(a1, "parseFromData:extensionRegistry:error:", a3, 0, a4);
}

+ (id)parseFromData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithData:extensionRegistry:error:", a3, a4, a5);
}

+ (id)parseFromCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithCodedInputStream:extensionRegistry:error:", a3, a4, a5);
}

+ (id)parseDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  id v8;

  v8 = objc_alloc_init((Class)a1);
  objc_msgSend(v8, "mergeDelimitedFromCodedInputStream:extensionRegistry:", a3, a4);
  if (a5)
    *a5 = 0;
  return v8;
}

- (GPBUnknownFieldSet)unknownFields
{
  return self->unknownFields_;
}

- (void)setUnknownFields:(id)a3
{
  GPBUnknownFieldSet *unknownFields;

  unknownFields = self->unknownFields_;
  if (unknownFields != a3)
  {

    self->unknownFields_ = (GPBUnknownFieldSet *)objc_msgSend(a3, "copy");
    GPBBecomeVisibleToAutocreator(self);
  }
}

- (void)parseMessageSet:(id)a3 extensionRegistry:(id)a4
{
  uint64_t *v7;
  uint64_t Tag;
  uint64_t v9;
  int v10;
  uint64_t UInt32;
  id v12;
  _QWORD *v13;
  void *v14;
  GPBCodedInputStream *v15;

  v7 = (uint64_t *)((char *)a3 + 8);
  Tag = GPBCodedInputStreamReadTag((uint64_t)a3 + 8);
  if ((_DWORD)Tag)
  {
    v9 = Tag;
    v10 = GPBWireFormatMakeTag(2, 0);
    UInt32 = 0;
    v12 = 0;
    v13 = 0;
    do
    {
      if ((_DWORD)v9 == v10)
      {
        UInt32 = GPBCodedInputStreamReadUInt32(v7);
        if ((_DWORD)UInt32)
          v13 = objc_msgSend(a4, "extensionForDescriptor:fieldNumber:", -[GPBMessage descriptor](self, "descriptor"), UInt32);
      }
      else if ((_DWORD)v9 == GPBWireFormatMakeTag(3, 2))
      {
        v12 = GPBCodedInputStreamReadRetainedBytesNoCopy(v7);
      }
      else if (!objc_msgSend(a3, "skipField:", v9))
      {
        break;
      }
      v9 = GPBCodedInputStreamReadTag((uint64_t)v7);
    }
    while ((_DWORD)v9);
  }
  else
  {
    v13 = 0;
    v12 = 0;
    UInt32 = 0;
  }
  objc_msgSend(a3, "checkLastTagWas:", GPBWireFormatMakeTag(1, 4));
  if (v12 && (_DWORD)UInt32)
  {
    if (v13)
    {
      v15 = -[GPBCodedInputStream initWithData:]([GPBCodedInputStream alloc], "initWithData:", v12);
      GPBExtensionMergeFromInputStream(v13, (int)objc_msgSend(v13, "isPackable"), (uint64_t *)v15, (uint64_t)a4, self);

    }
    else
    {
      v14 = (void *)sub_100293AF8(self);
      objc_msgSend(v14, "mergeMessageSetMessage:data:", UInt32, +[NSData dataWithData:](NSData, "dataWithData:", v12));
    }
  }
}

- (BOOL)parseUnknownField:(id)a3 extensionRegistry:(id)a4 tag:(unsigned int)a5
{
  uint64_t v5;
  int TagWireType;
  int TagFieldNumber;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  unsigned int v14;
  unsigned int v15;

  v5 = *(_QWORD *)&a5;
  TagWireType = GPBWireFormatGetTagWireType(a5);
  TagFieldNumber = GPBWireFormatGetTagFieldNumber(v5);
  v11 = -[GPBMessage descriptor](self, "descriptor");
  v12 = objc_msgSend(a4, "extensionForDescriptor:fieldNumber:", v11, TagFieldNumber);
  if (v12)
  {
    v13 = v12;
    if (objc_msgSend(v12, "wireType") == TagWireType)
    {
      v14 = objc_msgSend(v13, "isPackable");
LABEL_4:
      GPBExtensionMergeFromInputStream(v13, v14, (uint64_t *)a3, (uint64_t)a4, self);
LABEL_8:
      LOBYTE(v15) = 1;
      return v15;
    }
    if (objc_msgSend(v13, "isRepeated")
      && *(unsigned __int8 *)(v13[1] + 44) - 13 >= 4
      && objc_msgSend(v13, "alternateWireType") == TagWireType)
    {
      v14 = objc_msgSend(v13, "isPackable") ^ 1;
      goto LABEL_4;
    }
  }
  else if (objc_msgSend(v11, "isWireFormat") && GPBWireFormatMakeTag(1, 3) == (_DWORD)v5)
  {
    -[GPBMessage parseMessageSet:extensionRegistry:](self, "parseMessageSet:extensionRegistry:", a3, a4);
    goto LABEL_8;
  }
  v15 = +[GPBUnknownFieldSet isFieldTag:](GPBUnknownFieldSet, "isFieldTag:", v5);
  if (v15)
    LOBYTE(v15) = objc_msgSend((id)sub_100293AF8(self), "mergeFieldFrom:input:", v5, a3);
  return v15;
}

- (void)addUnknownMapEntry:(int)a3 value:(id)a4
{
  objc_msgSend((id)sub_100293AF8(self), "addUnknownMapEntry:value:", *(_QWORD *)&a3, a4);
}

- (void)mergeFromCodedInputStream:(id)a3 extensionRegistry:(id)a4
{
  _QWORD *v6;
  void *v7;
  char *v8;
  uint64_t Tag;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  _QWORD *v13;
  char *v14;
  unsigned int v15;
  uint64_t v16;
  _BOOL4 Bool;
  int Fixed32;
  int SFixed32;
  float Float;
  uint64_t Fixed64;
  int v22;
  GPBMessage *v23;
  uint64_t v24;
  void *RetainedBytes;
  uint64_t SFixed64;
  double Double;
  void *v28;
  GPBMessage *v29;
  _QWORD *v30;
  uint64_t Enum;
  id v32;
  int v33;

  v6 = -[GPBMessage descriptor](self, "descriptor");
  v33 = objc_msgSend(objc_msgSend(v6, "file"), "syntax");
  v7 = (void *)v6[1];
  v8 = (char *)objc_msgSend(v7, "count");
  Tag = GPBCodedInputStreamReadTag((uint64_t)a3 + 8);
  if ((_DWORD)Tag)
  {
    v10 = Tag;
    v11 = 0;
    do
    {
      v12 = v8;
      if (v8)
      {
        while (1)
        {
          if (v11 >= (unint64_t)v8)
            v11 = 0;
          v13 = objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
          if (GPBFieldTag((uint64_t)v13) == (_DWORD)v10)
            break;
          ++v11;
          if (!--v12)
          {
            v14 = v8;
            while (1)
            {
              if (v11 >= (unint64_t)v8)
                v11 = 0;
              v13 = objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
              if (objc_msgSend(v13, "fieldType") == 1
                && *(unsigned __int8 *)(v13[1] + 30) - 13 >= 4
                && GPBFieldAlternateTag((uint64_t)v13) == (_DWORD)v10)
              {
                break;
              }
              ++v11;
              if (!--v14)
                goto LABEL_15;
            }
            if ((objc_msgSend(v13, "isPackable") & 1) != 0)
              goto LABEL_25;
LABEL_22:
            sub_100294204(self, v13, v33, (uint64_t)a3);
            goto LABEL_57;
          }
        }
        v15 = objc_msgSend(v13, "fieldType");
        if (v15 == 1)
        {
          if (!objc_msgSend(v13, "isPackable"))
          {
LABEL_25:
            sub_10029444C(self, v13, v33, (uint64_t *)a3, (uint64_t)a4);
            goto LABEL_58;
          }
          goto LABEL_22;
        }
        if (v15)
        {
          objc_msgSend(a3, "readMapEntry:extensionRegistry:field:parentMessage:", GPBGetMessageMapField_0(self, v13), a4, v13, self);
          goto LABEL_58;
        }
        v16 = v13[1];
        switch(*(_BYTE *)(v16 + 30))
        {
          case 0:
            Bool = GPBCodedInputStreamReadBool((uint64_t *)a3 + 1);
            GPBSetBoolIvarWithFieldPrivate(self, (uint64_t)v13, Bool);
            break;
          case 1:
            Fixed32 = GPBCodedInputStreamReadFixed32((_QWORD *)a3 + 1);
            goto LABEL_35;
          case 2:
            SFixed32 = GPBCodedInputStreamReadSFixed32((_QWORD *)a3 + 1);
            goto LABEL_32;
          case 3:
            Float = GPBCodedInputStreamReadFloat((_QWORD *)a3 + 1);
            GPBSetFloatIvarWithFieldPrivate(self, (uint64_t)v13, Float);
            break;
          case 4:
            Fixed64 = GPBCodedInputStreamReadFixed64((_QWORD *)a3 + 1);
            goto LABEL_37;
          case 5:
            SFixed64 = GPBCodedInputStreamReadSFixed64((_QWORD *)a3 + 1);
            goto LABEL_47;
          case 6:
            Double = GPBCodedInputStreamReadDouble((_QWORD *)a3 + 1);
            GPBSetDoubleIvarWithFieldPrivate(self, (uint64_t)v13, Double);
            break;
          case 7:
            SFixed32 = GPBCodedInputStreamReadInt32((uint64_t *)a3 + 1);
            goto LABEL_32;
          case 8:
            SFixed64 = GPBCodedInputStreamReadInt64((uint64_t *)a3 + 1);
            goto LABEL_47;
          case 9:
            SFixed32 = GPBCodedInputStreamReadSInt32((uint64_t *)a3 + 1);
LABEL_32:
            v22 = SFixed32;
            v23 = self;
            v24 = (uint64_t)v13;
            goto LABEL_33;
          case 0xA:
            SFixed64 = GPBCodedInputStreamReadSInt64((uint64_t *)a3 + 1);
LABEL_47:
            GPBSetInt64IvarWithFieldPrivate(self, (uint64_t)v13, SFixed64);
            break;
          case 0xB:
            Fixed32 = GPBCodedInputStreamReadUInt32((uint64_t *)a3 + 1);
LABEL_35:
            GPBSetUInt32IvarWithFieldPrivate(self, (uint64_t)v13, Fixed32);
            break;
          case 0xC:
            Fixed64 = GPBCodedInputStreamReadUInt64((char *)a3 + 8);
LABEL_37:
            GPBSetUInt64IvarWithFieldPrivate(self, (uint64_t)v13, Fixed64);
            break;
          case 0xD:
            RetainedBytes = GPBCodedInputStreamReadRetainedBytes((uint64_t *)a3 + 1);
            goto LABEL_49;
          case 0xE:
            RetainedBytes = (void *)GPBCodedInputStreamReadRetainedString((uint64_t *)a3 + 1);
LABEL_49:
            v28 = RetainedBytes;
            v29 = self;
            v30 = v13;
            goto LABEL_56;
          case 0xF:
            if (GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v16 + 20), *(_DWORD *)(v16 + 16)))
            {
              objc_msgSend(a3, "readMessage:extensionRegistry:", GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v13), a4);
              break;
            }
            v32 = objc_alloc_init((Class)objc_msgSend(v13, "msgClass"));
            objc_msgSend(a3, "readMessage:extensionRegistry:", v32, a4);
            goto LABEL_55;
          case 0x10:
            if (GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v16 + 20), *(_DWORD *)(v16 + 16)))
            {
              objc_msgSend(a3, "readGroup:message:extensionRegistry:", *(unsigned int *)(v13[1] + 16), GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v13), a4);
            }
            else
            {
              v32 = objc_alloc_init((Class)objc_msgSend(v13, "msgClass"));
              objc_msgSend(a3, "readGroup:message:extensionRegistry:", *(unsigned int *)(v13[1] + 16), v32, a4);
LABEL_55:
              v29 = self;
              v30 = v13;
              v28 = v32;
LABEL_56:
              GPBSetRetainedObjectIvarWithFieldPrivate(v29, v30, v28);
            }
            break;
          case 0x11:
            Enum = GPBCodedInputStreamReadEnum((uint64_t *)a3 + 1);
            if (v33 == 3 || objc_msgSend(v13, "isValidEnumValue:", Enum))
            {
              v23 = self;
              v24 = (uint64_t)v13;
              v22 = Enum;
LABEL_33:
              GPBSetInt32IvarWithFieldPrivate(v23, v24, v22);
            }
            else
            {
              objc_msgSend((id)sub_100293AF8(self), "mergeVarintField:value:", *(unsigned int *)(v13[1] + 16), Enum);
            }
            break;
          default:
            break;
        }
LABEL_57:
        ++v11;
      }
      else
      {
LABEL_15:
        if (!-[GPBMessage parseUnknownField:extensionRegistry:tag:](self, "parseUnknownField:extensionRegistry:tag:", a3, a4, v10))return;
      }
LABEL_58:
      v10 = GPBCodedInputStreamReadTag((uint64_t)a3 + 8);
    }
    while ((_DWORD)v10);
  }
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  _QWORD *v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int v23;
  int v24;
  void *v26;
  void *v27;
  id v28;
  int v29;
  id v30;
  void *v31;
  int v32;
  float v33;
  double v34;
  GPBUnknownFieldSet *unknownFields;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  _QWORD *v41;
  id v42;
  id v43;
  unsigned int v44;
  id v45;
  id v46;
  uint64_t v47;
  void *j;
  id v49;
  id v50;
  id v51;
  void *v52;
  NSZone *v53;
  uint64_t v54;
  id v55;
  id obj;
  id obja;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];

  v5 = (void *)objc_opt_class(self);
  v6 = (void *)objc_opt_class(a3);
  if ((objc_msgSend(v5, "isSubclassOfClass:", v6) & 1) == 0
    && (objc_msgSend(v6, "isSubclassOfClass:", v5) & 1) == 0)
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Classes must match %@ != %@"), v5, v6);
  }
  GPBBecomeVisibleToAutocreator(self);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v7 = (void *)*((_QWORD *)objc_msgSend((id)objc_opt_class(self), "descriptor") + 1);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v67 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
        v13 = objc_msgSend(v12, "fieldType");
        if (v13 == 1)
        {
          v18 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a3, (uint64_t)v12);
          if (v18)
          {
            v19 = v18;
            v20 = *(unsigned __int8 *)(v12[1] + 30);
            if ((v20 - 13) > 3)
            {
              v26 = GPBGetMessageRepeatedField_0(self, v12);
              if (v20 == 17)
                objc_msgSend(v26, "addRawValuesFromArray:", v19);
              else
                objc_msgSend(v26, "addValuesFromArray:", v19);
            }
            else
            {
              objc_msgSend(GPBGetMessageRepeatedField_0(self, v12), "addObjectsFromArray:", v18);
            }
          }
        }
        else if (v13)
        {
          v21 = GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a3, (uint64_t)v12);
          if (!v21)
            continue;
          v22 = v21;
          v23 = objc_msgSend(v12, "mapKeyDataType");
          v24 = *(unsigned __int8 *)(v12[1] + 30);
          if (v23 - 13 > 3 || (v24 - 13) > 3)
          {
            v27 = GPBGetMessageMapField_0(self, v12);
            if (v24 == 17)
            {
              objc_msgSend(v27, "addRawEntriesFromDictionary:", v22);
              continue;
            }
          }
          else
          {
            v27 = GPBGetMessageMapField_0(self, v12);
          }
          objc_msgSend(v27, "addEntriesFromDictionary:", v22);
        }
        else
        {
          v14 = v12[1];
          v16 = *(_DWORD *)(v14 + 16);
          v15 = *(_DWORD *)(v14 + 20);
          if (GPBGetHasIvar((uint64_t)a3, v15, v16))
          {
            switch(*(_BYTE *)(v12[1] + 30))
            {
              case 0:
                v32 = GPBGetMessageBoolField((uint64_t)a3, v12);
                GPBSetBoolIvarWithFieldPrivate(self, (uint64_t)v12, v32);
                break;
              case 1:
              case 0xB:
                v29 = GPBGetMessageUInt32Field((uint64_t)a3, v12);
                GPBSetUInt32IvarWithFieldPrivate(self, (uint64_t)v12, v29);
                break;
              case 2:
              case 7:
              case 9:
              case 0x11:
                v17 = GPBGetMessageInt32Field((uint64_t)a3, v12);
                GPBSetInt32IvarWithFieldPrivate(self, (uint64_t)v12, v17);
                break;
              case 3:
                v33 = GPBGetMessageFloatField((uint64_t)a3, v12);
                GPBSetFloatIvarWithFieldPrivate(self, (uint64_t)v12, v33);
                break;
              case 4:
              case 0xC:
                v30 = GPBGetMessageUInt64Field((uint64_t)a3, v12);
                GPBSetUInt64IvarWithFieldPrivate(self, (uint64_t)v12, (uint64_t)v30);
                break;
              case 5:
              case 8:
              case 0xA:
                v28 = GPBGetMessageInt64Field((uint64_t)a3, v12);
                GPBSetInt64IvarWithFieldPrivate(self, (uint64_t)v12, (uint64_t)v28);
                break;
              case 6:
                v34 = GPBGetMessageDoubleField((uint64_t)a3, v12);
                GPBSetDoubleIvarWithFieldPrivate(self, (uint64_t)v12, v34);
                break;
              case 0xD:
              case 0xE:
                v31 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a3, (uint64_t)v12);
                GPBSetObjectIvarWithFieldPrivate((uint64_t)self, (uint64_t)v12, v31);
                break;
              case 0xF:
              case 0x10:
                obj = (id)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a3, (uint64_t)v12);
                if (GPBGetHasIvar((uint64_t)self, v15, v16))
                  objc_msgSend((id)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v12), "mergeFrom:", obj);
                else
                  GPBSetRetainedObjectIvarWithFieldPrivate(self, v12, objc_msgSend(obj, "copy"));
                break;
              default:
                continue;
            }
          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    }
    while (v9);
  }
  unknownFields = self->unknownFields_;
  v36 = objc_msgSend(a3, "unknownFields");
  if (unknownFields)
    -[GPBUnknownFieldSet mergeUnknownFields:](unknownFields, "mergeUnknownFields:", v36);
  else
    -[GPBMessage setUnknownFields:](self, "setUnknownFields:", v36);
  if (objc_msgSend(*((id *)a3 + 2), "count"))
  {
    if (!self->extensionMap_)
    {
      v52 = (void *)*((_QWORD *)a3 + 2);
      v53 = NSZoneFromPointer(self);
      self->extensionMap_ = sub_100291718(v52, (uint64_t)v53);
      return;
    }
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    obja = (id)*((_QWORD *)a3 + 2);
    v37 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    if (!v37)
      return;
    v38 = v37;
    v39 = *(_QWORD *)v63;
    v54 = *(_QWORD *)v63;
    do
    {
      v40 = 0;
      v55 = v38;
      do
      {
        if (*(_QWORD *)v63 != v39)
          objc_enumerationMutation(obja);
        v41 = *(_QWORD **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)v40);
        v42 = objc_msgSend(*((id *)a3 + 2), "objectForKey:", v41);
        v43 = -[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", v41);
        v44 = *(unsigned __int8 *)(v41[1] + 44) - 15;
        if (objc_msgSend(v41, "isRepeated"))
        {
          if (!v43)
          {
            v43 = objc_alloc_init((Class)NSMutableArray);
            -[NSMutableDictionary setObject:forKey:](self->extensionMap_, "setObject:forKey:", v43, v41);

          }
          if (v44 > 1)
          {
            objc_msgSend(v43, "addObjectsFromArray:", v42);
            goto LABEL_71;
          }
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v45 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v59;
            do
            {
              for (j = 0; j != v46; j = (char *)j + 1)
              {
                if (*(_QWORD *)v59 != v47)
                  objc_enumerationMutation(v42);
                v49 = objc_msgSend(*(id *)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j), "copy");
                objc_msgSend(v43, "addObject:", v49);

              }
              v46 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
            }
            while (v46);
          }
        }
        else
        {
          if (v44 > 1)
          {
            -[NSMutableDictionary setObject:forKey:](self->extensionMap_, "setObject:forKey:", v42, v41);
            goto LABEL_71;
          }
          if (v43)
          {
            objc_msgSend(v43, "mergeFrom:", v42);
          }
          else
          {
            v50 = objc_msgSend(v42, "copy");
            -[NSMutableDictionary setObject:forKey:](self->extensionMap_, "setObject:forKey:", v50, v41);

          }
        }
        v39 = v54;
        v38 = v55;
        if ((objc_msgSend(v41, "isRepeated") & 1) == 0)
        {
          v51 = -[NSMutableDictionary objectForKey:](self->autocreatedExtensionMap_, "objectForKey:", v41);
          -[NSMutableDictionary removeObjectForKey:](self->autocreatedExtensionMap_, "removeObjectForKey:", v41);
          GPBClearMessageAutocreator((uint64_t)v51);

        }
LABEL_71:
        v40 = (char *)v40 + 1;
      }
      while (v40 != v38);
      v38 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    }
    while (v38);
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  _QWORD *v6;
  unsigned int v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  int v19;
  int HasIvar;
  int v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;
  id v26;
  void *v27;
  uint64_t v29;
  GPBMessage_Storage *messageStorage;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  if (a3 == self)
    goto LABEL_39;
  v5 = objc_opt_class(GPBMessage);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0
    || (v6 = objc_msgSend((id)objc_opt_class(self), "descriptor"),
        objc_msgSend((id)objc_opt_class(a3), "descriptor") != v6))
  {
LABEL_4:
    LOBYTE(v7) = 0;
    return v7;
  }
  v29 = *((_QWORD *)a3 + 8);
  messageStorage = self->messageStorage_;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = (id)v6[1];
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v11);
        v13 = *(_QWORD *)(v12 + 8);
        if ((*(_WORD *)(v13 + 28) & 0xF02) != 0)
        {
          v14 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)v11));
          v15 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a3, v12);
          if (objc_msgSend(v14, "count") || objc_msgSend(v15, "count"))
          {
            v16 = v14;
            v17 = v15;
LABEL_14:
            if ((objc_msgSend(v16, "isEqual:", v17) & 1) == 0)
              goto LABEL_4;
          }
        }
        else
        {
          v19 = *(_DWORD *)(v13 + 16);
          v18 = *(_DWORD *)(v13 + 20);
          HasIvar = GPBGetHasIvar((uint64_t)self, v18, v19);
          v21 = GPBGetHasIvar((uint64_t)a3, v18, v19);
          if (HasIvar)
            v22 = v21 == 0;
          else
            v22 = 1;
          if (!v22)
          {
            v23 = *(_QWORD *)(v12 + 8);
            v24 = *(unsigned int *)(v23 + 24);
            switch(*(_BYTE *)(v23 + 30))
            {
              case 0:
                v25 = GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v23 + 24), 0);
                if (v25 != GPBGetHasIvar((uint64_t)a3, v24, 0))
                  goto LABEL_4;
                goto LABEL_27;
              case 1:
              case 2:
              case 3:
              case 7:
              case 9:
              case 0xB:
              case 0x11:
                if (*(_DWORD *)((char *)messageStorage + v24) != *(_DWORD *)(v29 + v24))
                  goto LABEL_4;
                goto LABEL_27;
              case 4:
              case 5:
              case 6:
              case 8:
              case 0xA:
              case 0xC:
                if (*(_QWORD *)((char *)messageStorage + v24) == *(_QWORD *)(v29 + v24))
                  goto LABEL_27;
                goto LABEL_4;
              case 0xD:
              case 0xE:
              case 0xF:
              case 0x10:
                v16 = *(void **)((char *)messageStorage + v24);
                v17 = *(void **)(v29 + v24);
                goto LABEL_14;
              default:
                goto LABEL_27;
            }
          }
          if (HasIvar != v21)
            goto LABEL_4;
        }
LABEL_27:
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v9 = v26;
    }
    while (v26);
  }
  if (!-[NSMutableDictionary count](self->extensionMap_, "count") && !objc_msgSend(*((id *)a3 + 2), "count")
    || (v7 = -[NSMutableDictionary isEqual:](self->extensionMap_, "isEqual:", *((_QWORD *)a3 + 2))) != 0)
  {
    if ((v27 = (void *)*((_QWORD *)a3 + 1), !-[GPBUnknownFieldSet countOfFields](self->unknownFields_, "countOfFields"))
      && !objc_msgSend(v27, "countOfFields")
      || (v7 = -[GPBUnknownFieldSet isEqual:](self->unknownFields_, "isEqual:", v27)) != 0)
    {
LABEL_39:
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  GPBMessage_Storage *messageStorage;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (unint64_t)objc_msgSend((id)objc_opt_class(self), "descriptor");
  messageStorage = self->messageStorage_;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = *(void **)(v3 + 8);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v10 = *(_QWORD *)(v9 + 8);
        if ((*(_WORD *)(v10 + 28) & 0xF02) != 0)
        {
          v11 = objc_msgSend((id)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i)), "count");
          if (v11)
            v3 = (unint64_t)v11 + 361 * v3 + 19 * *(unsigned int *)(*(_QWORD *)(v9 + 8) + 16);
        }
        else if (GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v10 + 20), *(_DWORD *)(v10 + 16)))
        {
          v12 = *(_QWORD *)(v9 + 8);
          v13 = *(unsigned int *)(v12 + 24);
          switch(*(_BYTE *)(v12 + 30))
          {
            case 0:
              v3 = 19 * v3 + GPBGetHasIvar((uint64_t)self, v13, 0);
              continue;
            case 1:
            case 2:
            case 3:
            case 7:
            case 9:
            case 0xB:
            case 0x11:
              v14 = *(unsigned int *)((char *)messageStorage + v13);
              goto LABEL_13;
            case 4:
            case 5:
            case 6:
            case 8:
            case 0xA:
            case 0xC:
              v14 = *(_QWORD *)((char *)messageStorage + v13);
LABEL_13:
              v3 = v14 + 19 * v3;
              continue;
            case 0xD:
            case 0xE:
              v15 = objc_msgSend(*(id *)((char *)messageStorage + v13), "hash");
              goto LABEL_16;
            case 0xF:
            case 0x10:
              v3 = *(unsigned int *)(v12 + 16) + 19 * v3;
              v15 = objc_msgSend((id)objc_opt_class(*(_QWORD *)((char *)messageStorage + v13)), "descriptor");
LABEL_16:
              v3 = (unint64_t)v15 + 19 * v3;
              break;
            default:
              continue;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  return v3;
}

- (id)description
{
  __CFString *v3;

  v3 = GPBTextFormatForMessage(self, CFSTR("    "));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p>: {\n%@}"), objc_opt_class(self), self, v3);
}

- (unint64_t)serializedSize
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  _QWORD *v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *i;
  char *v19;
  id v20;
  uint64_t v21;
  void *j;
  char *v23;
  id v24;
  uint64_t v25;
  void *k;
  char *v27;
  id v28;
  uint64_t v29;
  void *m;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  id v38;
  int v39;
  id v40;
  unsigned int v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  id v48;
  unsigned int v49;
  GPBUnknownFieldSet *unknownFields;
  unint64_t v51;
  unint64_t v52;
  NSMutableDictionary *extensionMap;
  id v54;
  unint64_t v55;
  uint64_t v56;
  void *n;
  _QWORD *v59;
  void *v60;
  id v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[5];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD v86[5];
  _QWORD v87[5];
  _QWORD v88[5];
  _QWORD v89[5];
  _QWORD v90[5];
  _QWORD v91[5];
  _QWORD v92[5];
  _QWORD v93[5];
  _QWORD v94[5];
  _QWORD v95[5];
  _QWORD v96[5];
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];

  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v59 = objc_msgSend((id)objc_opt_class(self), "descriptor");
  v3 = (void *)v59[1];
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v101, v110, 16);
  if (!v5)
    goto LABEL_89;
  v62 = *(_QWORD *)v102;
  v60 = v3;
  do
  {
    v6 = 0;
    v61 = v5;
    do
    {
      if (*(_QWORD *)v102 != v62)
        objc_enumerationMutation(v3);
      v7 = *(_QWORD **)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)v6);
      v8 = objc_msgSend(v7, "fieldType");
      v9 = v7[1];
      v10 = *(unsigned __int8 *)(v9 + 30);
      if (v8 == 1)
      {
        v13 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v7);
        v14 = objc_msgSend(v13, "count");
        if (v14)
        {
          v97 = 0;
          v98 = &v97;
          v99 = 0x2020000000;
          v100 = 0;
          switch(v10)
          {
            case 0:
              v96[0] = _NSConcreteStackBlock;
              v96[1] = 3221225472;
              v96[2] = sub_100295F24;
              v96[3] = &unk_1003647C8;
              v96[4] = &v97;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v96);
              break;
            case 1:
              v95[0] = _NSConcreteStackBlock;
              v95[1] = 3221225472;
              v95[2] = sub_100295F5C;
              v95[3] = &unk_1003647F0;
              v95[4] = &v97;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v95);
              break;
            case 2:
              v94[0] = _NSConcreteStackBlock;
              v94[1] = 3221225472;
              v94[2] = sub_100295F94;
              v94[3] = &unk_100364818;
              v94[4] = &v97;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v94);
              break;
            case 3:
              v93[0] = _NSConcreteStackBlock;
              v93[1] = 3221225472;
              v93[2] = sub_100295FCC;
              v93[3] = &unk_100364840;
              v93[4] = &v97;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v93);
              break;
            case 4:
              v92[0] = _NSConcreteStackBlock;
              v92[1] = 3221225472;
              v92[2] = sub_100296000;
              v92[3] = &unk_100364868;
              v92[4] = &v97;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v92);
              break;
            case 5:
              v91[0] = _NSConcreteStackBlock;
              v91[1] = 3221225472;
              v91[2] = sub_100296038;
              v91[3] = &unk_100364890;
              v91[4] = &v97;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v91);
              break;
            case 6:
              v90[0] = _NSConcreteStackBlock;
              v90[1] = 3221225472;
              v90[2] = sub_100296070;
              v90[3] = &unk_1003648B8;
              v90[4] = &v97;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v90);
              break;
            case 7:
              v89[0] = _NSConcreteStackBlock;
              v89[1] = 3221225472;
              v89[2] = sub_1002960A4;
              v89[3] = &unk_100364818;
              v89[4] = &v97;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v89);
              break;
            case 8:
              v88[0] = _NSConcreteStackBlock;
              v88[1] = 3221225472;
              v88[2] = sub_1002960DC;
              v88[3] = &unk_100364890;
              v88[4] = &v97;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v88);
              break;
            case 9:
              v87[0] = _NSConcreteStackBlock;
              v87[1] = 3221225472;
              v87[2] = sub_100296114;
              v87[3] = &unk_100364818;
              v87[4] = &v97;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v87);
              break;
            case 10:
              v86[0] = _NSConcreteStackBlock;
              v86[1] = 3221225472;
              v86[2] = sub_10029614C;
              v86[3] = &unk_100364890;
              v86[4] = &v97;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v86);
              break;
            case 11:
              v85[0] = _NSConcreteStackBlock;
              v85[1] = 3221225472;
              v85[2] = sub_100296184;
              v85[3] = &unk_1003647F0;
              v85[4] = &v97;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v85);
              break;
            case 12:
              v84[0] = _NSConcreteStackBlock;
              v84[1] = 3221225472;
              v84[2] = sub_1002961BC;
              v84[3] = &unk_100364868;
              v84[4] = &v97;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v84);
              break;
            case 13:
              v82 = 0u;
              v83 = 0u;
              v80 = 0u;
              v81 = 0u;
              v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v80, v109, 16);
              if (v16)
              {
                v17 = *(_QWORD *)v81;
                do
                {
                  for (i = 0; i != v16; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v81 != v17)
                      objc_enumerationMutation(v13);
                    v19 = GPBComputeBytesSizeNoTag(*(void **)(*((_QWORD *)&v80 + 1) + 8 * (_QWORD)i));
                    v98[3] += (uint64_t)v19;
                  }
                  v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v80, v109, 16);
                }
                while (v16);
              }
              break;
            case 14:
              v78 = 0u;
              v79 = 0u;
              v76 = 0u;
              v77 = 0u;
              v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v108, 16);
              if (v20)
              {
                v21 = *(_QWORD *)v77;
                do
                {
                  for (j = 0; j != v20; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v77 != v21)
                      objc_enumerationMutation(v13);
                    v23 = GPBComputeStringSizeNoTag(*(void **)(*((_QWORD *)&v76 + 1) + 8 * (_QWORD)j));
                    v98[3] += (uint64_t)v23;
                  }
                  v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v76, v108, 16);
                }
                while (v20);
              }
              break;
            case 15:
              v74 = 0u;
              v75 = 0u;
              v72 = 0u;
              v73 = 0u;
              v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v72, v107, 16);
              if (v24)
              {
                v25 = *(_QWORD *)v73;
                do
                {
                  for (k = 0; k != v24; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v73 != v25)
                      objc_enumerationMutation(v13);
                    v27 = GPBComputeMessageSizeNoTag(*(void **)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)k));
                    v98[3] += (uint64_t)v27;
                  }
                  v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v72, v107, 16);
                }
                while (v24);
              }
              break;
            case 16:
              v70 = 0u;
              v71 = 0u;
              v68 = 0u;
              v69 = 0u;
              v28 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v68, v106, 16);
              if (v28)
              {
                v29 = *(_QWORD *)v69;
                do
                {
                  for (m = 0; m != v28; m = (char *)m + 1)
                  {
                    if (*(_QWORD *)v69 != v29)
                      objc_enumerationMutation(v13);
                    v31 = GPBComputeGroupSizeNoTag(*(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * (_QWORD)m));
                    v98[3] += v31;
                  }
                  v28 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v68, v106, 16);
                }
                while (v28);
              }
              break;
            case 17:
              v67[0] = _NSConcreteStackBlock;
              v67[1] = 3221225472;
              v67[2] = sub_1002961F4;
              v67[3] = &unk_100364818;
              v67[4] = &v97;
              objc_msgSend(v13, "enumerateRawValuesWithBlock:", v67);
              break;
            default:
              break;
          }
          v32 = v98[3];
          v33 = GPBComputeTagSize(*(_DWORD *)(v7[1] + 16));
          v34 = objc_msgSend(v7, "isPackable");
          v35 = v32 + v4;
          v36 = v33 << (v10 == 16);
          if (v34)
            v4 = v36 + v35 + GPBComputeSizeTSizeAsInt32NoTag(v98[3]);
          else
            v4 = v35 + v36 * (_QWORD)v14;
          v3 = v60;
          v5 = v61;
          _Block_object_dispose(&v97, 8);
        }
      }
      else if (v8)
      {
        if ((v10 - 13) <= 3 && objc_msgSend(v7, "mapKeyDataType") == 14)
        {
          v15 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v7);
          if (!v15)
            goto LABEL_69;
          v12 = GPBDictionaryComputeSizeInternalHelper(v15, (uint64_t)v7);
        }
        else
        {
          v12 = (uint64_t)objc_msgSend((id)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v7), "computeSerializedSizeAsField:", v7);
        }
LABEL_19:
        v4 += v12;
      }
      else if (GPBGetHasIvar((uint64_t)self, *(_DWORD *)(v9 + 20), *(_DWORD *)(v9 + 16)))
      {
        v11 = *(_DWORD *)(v7[1] + 16);
        switch(v10)
        {
          case 0:
            GPBGetMessageBoolField((uint64_t)self, v7);
            v12 = GPBComputeBoolSize(v11);
            goto LABEL_19;
          case 1:
            GPBGetMessageUInt32Field((uint64_t)self, v7);
            v12 = GPBComputeFixed32Size(v11);
            goto LABEL_19;
          case 2:
            GPBGetMessageInt32Field((uint64_t)self, v7);
            v12 = GPBComputeSFixed32Size(v11);
            goto LABEL_19;
          case 3:
            GPBGetMessageFloatField((uint64_t)self, v7);
            v12 = GPBComputeFloatSize(v11);
            goto LABEL_19;
          case 4:
            GPBGetMessageUInt64Field((uint64_t)self, v7);
            v12 = GPBComputeFixed64Size(v11);
            goto LABEL_19;
          case 5:
            GPBGetMessageInt64Field((uint64_t)self, v7);
            v12 = GPBComputeSFixed64Size(v11);
            goto LABEL_19;
          case 6:
            GPBGetMessageDoubleField((uint64_t)self, v7);
            v12 = GPBComputeDoubleSize(v11);
            goto LABEL_19;
          case 7:
            v37 = GPBGetMessageInt32Field((uint64_t)self, v7);
            v12 = GPBComputeInt32Size(v11, v37);
            goto LABEL_19;
          case 8:
            v38 = GPBGetMessageInt64Field((uint64_t)self, v7);
            v12 = GPBComputeInt64Size(v11, (unint64_t)v38);
            goto LABEL_19;
          case 9:
            v39 = GPBGetMessageInt32Field((uint64_t)self, v7);
            v12 = GPBComputeSInt32Size(v11, v39);
            goto LABEL_19;
          case 10:
            v40 = GPBGetMessageInt64Field((uint64_t)self, v7);
            v12 = GPBComputeSInt64Size(v11, (uint64_t)v40);
            goto LABEL_19;
          case 11:
            v41 = GPBGetMessageUInt32Field((uint64_t)self, v7);
            v12 = GPBComputeUInt32Size(v11, v41);
            goto LABEL_19;
          case 12:
            v42 = GPBGetMessageUInt64Field((uint64_t)self, v7);
            v12 = GPBComputeUInt64Size(v11, (unint64_t)v42);
            goto LABEL_19;
          case 13:
            v43 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v7);
            v12 = (uint64_t)GPBComputeBytesSize(v11, v43);
            goto LABEL_19;
          case 14:
            v44 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v7);
            v12 = (uint64_t)GPBComputeStringSize(v11, v44);
            goto LABEL_19;
          case 15:
            v45 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v7);
            v12 = (uint64_t)GPBComputeMessageSize(v11, v45);
            goto LABEL_19;
          case 16:
            v46 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)self, (uint64_t)v7);
            v12 = (uint64_t)GPBComputeGroupSize(v11, v46);
            goto LABEL_19;
          case 17:
            v47 = GPBGetMessageInt32Field((uint64_t)self, v7);
            v12 = GPBComputeEnumSize(v11, v47);
            goto LABEL_19;
          default:
            break;
        }
      }
LABEL_69:
      v6 = (char *)v6 + 1;
    }
    while (v6 != v5);
    v48 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v101, v110, 16);
    v5 = v48;
  }
  while (v48);
LABEL_89:
  v49 = objc_msgSend(v59, "isWireFormat");
  unknownFields = self->unknownFields_;
  if (v49)
    v51 = -[GPBUnknownFieldSet serializedSizeAsMessageSet](unknownFields, "serializedSizeAsMessageSet");
  else
    v51 = -[GPBUnknownFieldSet serializedSize](unknownFields, "serializedSize");
  v52 = v51;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  extensionMap = self->extensionMap_;
  v54 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](extensionMap, "countByEnumeratingWithState:objects:count:", &v63, v105, 16);
  v55 = v52 + v4;
  if (v54)
  {
    v56 = *(_QWORD *)v64;
    do
    {
      for (n = 0; n != v54; n = (char *)n + 1)
      {
        if (*(_QWORD *)v64 != v56)
          objc_enumerationMutation(extensionMap);
        v55 += GPBComputeExtensionSerializedSizeIncludingTag(*(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)n), -[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)n)));
      }
      v54 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](extensionMap, "countByEnumeratingWithState:objects:count:", &v63, v105, 16);
    }
    while (v54);
  }
  return v55;
}

+ (BOOL)resolveInstanceMethod:(SEL)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  void **v12;
  int32x2_t *v13;
  const char *v14;
  const char **v15;
  void **v17;
  void ***v18;
  void (*v19)(void);
  const char *v20;
  char **v21;
  void *v22;
  void *v23;
  int32x2_t v24;
  __int32 v25;
  BOOL v26;
  char *v27;
  objc_class *v28;
  void *v30;
  const char *name;
  objc_super v32;
  _QWORD v33[5];
  _QWORD block[5];
  void **v35;
  void **v36;
  _QWORD v37[4];
  __int32 v38;
  _QWORD v39[5];
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  _QWORD v46[5];
  _BYTE v47[128];

  v5 = objc_msgSend(a1, "descriptor");
  if (!v5)
  {
    v45.receiver = a1;
    v45.super_class = (Class)&OBJC_METACLASS___GPBMessage;
    return objc_msgSendSuper2(&v45, "resolveInstanceMethod:", a3);
  }
  name = a3;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v30 = v5;
  v6 = (void *)*((_QWORD *)v5 + 1);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
  if (!v7)
  {
LABEL_73:
    v32.receiver = a1;
    v32.super_class = (Class)&OBJC_METACLASS___GPBMessage;
    return objc_msgSendSuper2(&v32, "resolveInstanceMethod:", name);
  }
  v8 = v7;
  v9 = *(_QWORD *)v42;
LABEL_4:
  v10 = 0;
  v11 = name;
  while (1)
  {
    if (*(_QWORD *)v42 != v9)
    {
      objc_enumerationMutation(v6);
      v11 = name;
    }
    v12 = *(void ***)(*((_QWORD *)&v41 + 1) + 8 * v10);
    v13 = (int32x2_t *)v12[1];
    v14 = (const char *)v12[3];
    if ((v13[3].i16[2] & 0xF02) == 0)
      break;
    if (v14 == v11)
    {
      if (objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v10), "fieldType") == 1)
      {
        v36 = _NSConcreteStackBlock;
        v17 = (void **)sub_100296D54;
        v18 = &v36;
      }
      else
      {
        v35 = _NSConcreteStackBlock;
        v17 = (void **)sub_100296E04;
        v18 = &v35;
      }
      v18[1] = (void **)3221225472;
      v18[2] = v17;
      v18[3] = (void **)&unk_100364938;
      v18[4] = v12;
      v19 = imp_implementationWithBlock(v18);
      v20 = "getArray";
      goto LABEL_70;
    }
    if (v12[4] == v11)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100296ED8;
      block[3] = &unk_100364958;
      block[4] = v12;
      v19 = imp_implementationWithBlock(block);
      v20 = "setArray:";
      goto LABEL_70;
    }
    if (v12[5] == v11)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100296EE8;
      v33[3] = &unk_100364978;
      v33[4] = v12;
      v19 = imp_implementationWithBlock(v33);
      v20 = "getArrayCount";
      goto LABEL_70;
    }
LABEL_18:
    if (v8 == (id)++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v8)
        goto LABEL_4;
      goto LABEL_73;
    }
  }
  if (v14 != v11)
  {
    if (v12[4] == v11)
    {
      switch(v13[3].i8[6])
      {
        case 0:
          v21 = &selRef_setBool_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_1003648F8;
          v23 = sub_1002978B4;
          goto LABEL_69;
        case 1:
          v21 = &selRef_setFixed32_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364A58;
          v23 = sub_1002978C4;
          goto LABEL_69;
        case 2:
          v21 = &selRef_setSFixed32_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364A78;
          v23 = sub_1002978D4;
          goto LABEL_69;
        case 3:
          v21 = &selRef_setFloat_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364A98;
          v23 = sub_1002978E4;
          goto LABEL_69;
        case 4:
          v21 = &selRef_setFixed64_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364AB8;
          v23 = sub_1002978F4;
          goto LABEL_69;
        case 5:
          v21 = &selRef_setSFixed64_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364AD8;
          v23 = sub_100297904;
          goto LABEL_69;
        case 6:
          v21 = &selRef_setDouble_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364AF8;
          v23 = sub_100297914;
          goto LABEL_69;
        case 7:
          v21 = &selRef_setInt32_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364A78;
          v23 = sub_100297924;
          goto LABEL_69;
        case 8:
          v21 = &selRef_setInt64_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364AD8;
          v23 = sub_100297934;
          goto LABEL_69;
        case 9:
          v21 = &selRef_setSInt32_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364A78;
          v23 = sub_100297944;
          goto LABEL_69;
        case 0xA:
          v21 = &selRef_setSInt64_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364AD8;
          v23 = sub_100297954;
          goto LABEL_69;
        case 0xB:
          v21 = &selRef_setUInt32_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364A58;
          v23 = sub_100297964;
          goto LABEL_69;
        case 0xC:
          v21 = &selRef_setUInt64_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364AB8;
          v23 = sub_100297974;
          goto LABEL_69;
        case 0xD:
          v21 = &selRef_setBytes_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364958;
          v23 = sub_100297984;
          goto LABEL_69;
        case 0xE:
          v21 = &selRef_setString_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364958;
          v23 = sub_1002979B8;
          goto LABEL_69;
        case 0xF:
          v21 = &selRef_setMessage_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364958;
          v23 = sub_1002979EC;
          goto LABEL_69;
        case 0x10:
          v21 = &selRef_setGroup_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364958;
          v23 = sub_1002979FC;
          goto LABEL_69;
        case 0x11:
          v21 = &selRef_setEnum_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_100364A78;
          v23 = sub_100297A0C;
          goto LABEL_69;
        default:
          goto LABEL_34;
      }
    }
    if (v12[5] == v11)
    {
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v24 = v13[2];
      v40[2] = sub_100296CA0;
      v40[3] = &unk_1003648D8;
      v40[4] = vrev64_s32(v24);
      v19 = imp_implementationWithBlock(v40);
      v20 = "getBool";
      goto LABEL_70;
    }
    if (v12[6] == v11)
    {
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100296CB0;
      v39[3] = &unk_1003648F8;
      v39[4] = v12;
      v19 = imp_implementationWithBlock(v39);
      v20 = "setBool:";
      goto LABEL_70;
    }
    v15 = (const char **)v12[2];
    if (v15 && v15[3] == v11)
    {
      v25 = v13[2].i32[1];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100296D44;
      v37[3] = &unk_100364918;
      v38 = v25;
      v19 = imp_implementationWithBlock(v37);
      v20 = "getEnum";
      goto LABEL_70;
    }
    goto LABEL_18;
  }
  switch(v13[3].i8[6])
  {
    case 0:
      v21 = &selRef_getBool;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_100364998;
      v23 = sub_100297794;
      goto LABEL_69;
    case 1:
      v21 = &selRef_getFixed32;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_1003649B8;
      v23 = sub_1002977A4;
      goto LABEL_69;
    case 2:
      v21 = &selRef_getSFixed32;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_1003649D8;
      v23 = sub_1002977B4;
      goto LABEL_69;
    case 3:
      v21 = &selRef_getFloat;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_1003649F8;
      v23 = sub_1002977C4;
      goto LABEL_69;
    case 4:
      v21 = &selRef_getFixed64;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_100364978;
      v23 = sub_1002977D4;
      goto LABEL_69;
    case 5:
      v21 = &selRef_getSFixed64;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_100364A18;
      v23 = sub_1002977E4;
      goto LABEL_69;
    case 6:
      v21 = &selRef_getDouble;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_100364A38;
      v23 = sub_1002977F4;
      goto LABEL_69;
    case 7:
      v21 = &selRef_getInt32;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_1003649D8;
      v23 = sub_100297804;
      goto LABEL_69;
    case 8:
      v21 = &selRef_getInt64;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_100364A18;
      v23 = sub_100297814;
      goto LABEL_69;
    case 9:
      v21 = &selRef_getSInt32;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_1003649D8;
      v23 = sub_100297824;
      goto LABEL_69;
    case 0xA:
      v21 = &selRef_getSInt64;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_100364A18;
      v23 = sub_100297834;
      goto LABEL_69;
    case 0xB:
      v21 = &selRef_getUInt32;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_1003649B8;
      v23 = sub_100297844;
      goto LABEL_69;
    case 0xC:
      v21 = &selRef_getUInt64;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_100364978;
      v23 = sub_100297854;
      goto LABEL_69;
    case 0xD:
      v21 = &selRef_getBytes;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_100364938;
      v23 = sub_100297864;
      goto LABEL_69;
    case 0xE:
      v21 = &selRef_getString;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_100364938;
      v23 = sub_100297874;
      goto LABEL_69;
    case 0xF:
      v21 = &selRef_getMessage;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_100364938;
      v23 = sub_100297884;
      goto LABEL_69;
    case 0x10:
      v21 = &selRef_getGroup;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_100364938;
      v23 = sub_100297894;
      goto LABEL_69;
    case 0x11:
      v21 = &selRef_getEnum;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_1003649D8;
      v23 = sub_1002978A4;
LABEL_69:
      v46[1] = 3221225472;
      v46[2] = v23;
      v46[3] = v22;
      v46[4] = v12;
      v19 = imp_implementationWithBlock(v46);
      v20 = *v21;
      break;
    default:
LABEL_34:
      v19 = 0;
      v20 = 0;
      break;
  }
LABEL_70:
  if (!v19)
    goto LABEL_73;
  v26 = 1;
  v27 = GPBMessageEncodingForSelector(v20, 1);
  v28 = (objc_class *)objc_msgSend(v30, "messageClass");
  if (!class_addMethod(v28, name, v19, v27))
    return GPBClassHasSel(v28, name);
  return v26;
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  objc_super v6;

  if ((GPBResolveExtensionClassMethod((objc_class *)a1, a3) & 1) != 0)
    return 1;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___GPBMessage;
  return objc_msgSendSuper2(&v6, "resolveClassMethod:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GPBMessage)initWithCoder:(id)a3
{
  GPBMessage *v4;
  id v5;

  v4 = -[GPBMessage init](self, "init");
  if (v4)
  {
    v5 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("GPBData"));
    if (objc_msgSend(v5, "length"))
      -[GPBMessage mergeFromData:extensionRegistry:](v4, "mergeFromData:extensionRegistry:", v5, 0);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = -[GPBMessage data](self, "data");
  if (objc_msgSend(v4, "length"))
    objc_msgSend(a3, "encodeObject:forKey:", v4, CFSTR("GPBData"));
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end
