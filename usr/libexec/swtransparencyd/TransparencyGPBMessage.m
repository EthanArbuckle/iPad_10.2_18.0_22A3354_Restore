@implementation TransparencyGPBMessage

+ (void)initialize
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (id)objc_opt_class(TransparencyGPBMessage, a2);
  if ((id)objc_opt_class(a1, v4) == v3)
  {
    objc_msgSend(a1, "descriptor");
    objc_opt_class(TransparencyGPBRootObject, v5);
  }
  else if (objc_msgSend(a1, "superclass") == v3)
  {
    objc_msgSend(a1, "descriptor");
  }
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return NSAllocateObject((Class)a1, *((unsigned int *)objc_msgSend(a1, "descriptor") + 6), a3);
}

+ (id)descriptor
{
  id result;
  uint64_t v3;
  uint64_t v4;

  result = (id)qword_100131308;
  if (!qword_100131308)
  {
    qword_100131310 = -[TransparencyGPBFileDescriptor initWithPackage:syntax:]([TransparencyGPBFileDescriptor alloc], "initWithPackage:syntax:", CFSTR("internal"), 2);
    LODWORD(v4) = 0;
    result = +[TransparencyGPBDescriptor allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:", objc_opt_class(TransparencyGPBMessage, v3), 0, qword_100131310, 0, 0, 0, v4);
    qword_100131308 = (uint64_t)result;
  }
  return result;
}

+ (id)message
{
  return objc_alloc_init((Class)a1);
}

- (TransparencyGPBMessage)init
{
  TransparencyGPBMessage *v2;
  uint64_t v3;
  TransparencyGPBMessage *v4;
  objc_class *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TransparencyGPBMessage;
  v2 = -[TransparencyGPBMessage init](&v7, "init");
  v4 = v2;
  if (v2)
  {
    v5 = (objc_class *)objc_opt_class(v2, v3);
    v4->messageStorage_ = (TransparencyGPBMessage_Storage *)((char *)v4 + class_getInstanceSize(v5));
    v4->readOnlyLock_._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (TransparencyGPBMessage)initWithData:(id)a3 error:(id *)a4
{
  return -[TransparencyGPBMessage initWithData:extensionRegistry:error:](self, "initWithData:extensionRegistry:error:", a3, 0, a4);
}

- (TransparencyGPBMessage)initWithData:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  TransparencyGPBMessage *v8;
  TransparencyGPBMessage *v9;

  v8 = -[TransparencyGPBMessage init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[TransparencyGPBMessage mergeFromData:extensionRegistry:](v8, "mergeFromData:extensionRegistry:", a3, a4);
    if (a5)
      *a5 = 0;
  }
  return v9;
}

- (TransparencyGPBMessage)initWithCodedInputStream:(id)a3 extensionRegistry:(id)a4 error:(id *)a5
{
  TransparencyGPBMessage *v8;
  TransparencyGPBMessage *v9;

  v8 = -[TransparencyGPBMessage init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[TransparencyGPBMessage mergeFromCodedInputStream:extensionRegistry:](v8, "mergeFromCodedInputStream:extensionRegistry:", a3, a4);
    if (a5)
      *a5 = 0;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[TransparencyGPBMessage internalClear:](self, "internalClear:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBMessage;
  -[TransparencyGPBMessage dealloc](&v3, "dealloc");
}

- (void)copyFieldsInto:(id)a3 zone:(_NSZone *)a4 descriptor:(id)a5
{
  _QWORD *v7;
  TransparencyGPBMessage *v8;
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
  TransparencyGPBMessage *v31;
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
    v12 = &OBJC_IVAR___TransparencyGPBFieldDescriptor_description_;
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
          v16 = sub_1000C8FE0((uint64_t)v8, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v13));
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
              sub_1000C95FC((uint64_t)v7, v14, v21);
              goto LABEL_38;
            }
            v12 = v18;
            if (objc_msgSend(v14, "mapKeyDataType") == 14)
            {
              v21 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v17, "count"));
              v36[0] = _NSConcreteStackBlock;
              v36[1] = 3221225472;
              v36[2] = sub_1000BFAE0;
              v36[3] = &unk_10010BD20;
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
          if (!sub_1000C94C8((uint64_t)v8, *(_DWORD *)(v15 + 20), *(_DWORD *)(v15 + 16)))
          {
            *(_QWORD *)(v7[8] + *(unsigned int *)(*(_QWORD *)&v14[*v12] + 24)) = 0;
            goto LABEL_38;
          }
LABEL_26:
          v17 = (void *)sub_1000C8FE0((uint64_t)v8, (uint64_t)v14);
          v21 = objc_msgSend(v17, "copyWithZone:", a4);
          goto LABEL_37;
        }
        if ((v27 - 13) <= 3 && sub_1000C94C8((uint64_t)v8, *(_DWORD *)(v15 + 20), *(_DWORD *)(v15 + 16)))
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

  v5 = -[TransparencyGPBMessage descriptor](self, "descriptor");
  v6 = objc_msgSend(objc_msgSend(objc_msgSend(v5, "messageClass"), "allocWithZone:", a3), "init");
  -[TransparencyGPBMessage copyFieldsInto:zone:descriptor:](self, "copyFieldsInto:zone:descriptor:", v6, a3, v5);
  v6[1] = -[TransparencyGPBUnknownFieldSet copyWithZone:](self->unknownFields_, "copyWithZone:", a3);
  v6[2] = sub_1000BFBAC(self->extensionMap_, (uint64_t)a3);
  return v6;
}

- (void)clear
{
  -[TransparencyGPBMessage internalClear:](self, "internalClear:", 1);
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
  uint64_t v14;
  int *v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  TransparencyGPBMessage **v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  _QWORD *v27;
  _BOOL4 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v28 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = -[TransparencyGPBMessage descriptor](self, "descriptor");
  v4 = (void *)v27[1];
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v10 = v9[1];
        if ((*(_WORD *)(v10 + 28) & 0xF02) != 0)
        {
          v11 = sub_1000C8FE0((uint64_t)self, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i));
          if (!v11)
            continue;
          v12 = (char *)v11;
          if (objc_msgSend(v9, "fieldType") == 1)
          {
            if (*(unsigned __int8 *)(v9[1] + 30) - 13 <= 3)
            {
              v14 = objc_opt_class(TransparencyGPBAutocreatedArray, v13);
              if ((objc_opt_isKindOfClass(v12, v14) & 1) != 0)
              {
                v15 = &OBJC_IVAR___TransparencyGPBAutocreatedArray__autocreator;
                goto LABEL_24;
              }
LABEL_27:

              continue;
            }
            v15 = &OBJC_IVAR___TransparencyGPBInt32Array__autocreator;
LABEL_24:
            v20 = *v15;
          }
          else
          {
            if (objc_msgSend(v9, "mapKeyDataType") == 14
              && *(unsigned __int8 *)(v9[1] + 30) - 13 <= 3)
            {
              v19 = objc_opt_class(TransparencyGPBAutocreatedDictionary, v18);
              if ((objc_opt_isKindOfClass(v12, v19) & 1) == 0)
                goto LABEL_27;
              v15 = &OBJC_IVAR___TransparencyGPBAutocreatedDictionary__autocreator;
              goto LABEL_24;
            }
            v20 = 8;
          }
          v21 = (TransparencyGPBMessage **)&v12[v20];
          if (*v21 == self)
            *v21 = 0;
          goto LABEL_27;
        }
        v16 = *(unsigned __int8 *)(v10 + 30);
        if ((v16 - 15) <= 1)
        {
          sub_1000C9530((uint64_t)self, *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i));
          v17 = (void *)sub_1000C8FE0((uint64_t)self, (uint64_t)v9);
LABEL_21:

          continue;
        }
        if ((v16 - 13) <= 3 && sub_1000C94C8((uint64_t)self, *(_DWORD *)(v10 + 20), *(_DWORD *)(v10 + 16)))
        {
          v17 = sub_1000C01A0((uint64_t)self, v9);
          goto LABEL_21;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v6);
  }
  v22 = -[NSMutableDictionary allValues](self->autocreatedExtensionMap_, "allValues");

  self->autocreatedExtensionMap_ = 0;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(_QWORD *)v30 != v25)
          objc_enumerationMutation(v22);
        sub_1000BF288(*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j));
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v24);
  }

  self->extensionMap_ = 0;
  self->unknownFields_ = 0;
  if (v28)
    bzero(self->messageStorage_, *((unsigned int *)v27 + 6));
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
  unsigned __int8 v15;
  NSMutableDictionary *extensionMap;
  BOOL v17;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = (void *)*((_QWORD *)-[TransparencyGPBMessage descriptor](self, "descriptor") + 1);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v29;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v5)
        objc_enumerationMutation(v3);
      v7 = *(_QWORD **)(*((_QWORD *)&v28 + 1) + 8 * v6);
      if (objc_msgSend(v7, "isRequired")
        && !sub_1000C94C8((uint64_t)self, *(_DWORD *)(v7[1] + 20), *(_DWORD *)(v7[1] + 16)))
      {
        return 0;
      }
      if (*(unsigned __int8 *)(v7[1] + 30) - 15 > 1)
        goto LABEL_31;
      v8 = objc_msgSend(v7, "fieldType");
      if (v8 == 1)
      {
        v9 = (void *)sub_1000C8FE0((uint64_t)self, (uint64_t)v7);
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v25;
LABEL_15:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v25 != v11)
              objc_enumerationMutation(v9);
            if (!objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12), "isInitialized"))
              return 0;
            if (v10 == (id)++v12)
            {
              v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              if (v10)
                goto LABEL_15;
              goto LABEL_31;
            }
          }
        }
        goto LABEL_31;
      }
      if (v8)
      {
        v13 = objc_msgSend(v7, "mapKeyDataType") == 14;
        v14 = (void *)sub_1000C8FE0((uint64_t)self, (uint64_t)v7);
        if (!v13)
        {
          if (v14 && !objc_msgSend(v14, "isInitialized"))
            return 0;
          goto LABEL_31;
        }
        if (v14)
        {
          v15 = sub_1000A379C(v14);
          goto LABEL_27;
        }
      }
      else if (objc_msgSend(v7, "isRequired")
             || sub_1000C94C8((uint64_t)self, *(_DWORD *)(v7[1] + 20), *(_DWORD *)(v7[1] + 16)))
      {
        v15 = objc_msgSend(sub_1000CA0C4((uint64_t)self, v7), "isInitialized");
LABEL_27:
        if ((v15 & 1) == 0)
          return 0;
      }
LABEL_31:
      if ((id)++v6 == v4)
      {
        v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 1;
  extensionMap = self->extensionMap_;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000C05A8;
  v19[3] = &unk_10010BD48;
  v19[4] = &v20;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](extensionMap, "enumerateKeysAndObjectsUsingBlock:", v19);
  v17 = *((_BYTE *)v21 + 24) != 0;
  _Block_object_dispose(&v20, 8);
  return v17;
}

- (id)descriptor
{
  return objc_msgSend((id)objc_opt_class(self, a2), "descriptor");
}

- (id)data
{
  NSMutableData *v3;
  TransparencyGPBCodedOutputStream *v4;

  v3 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", -[TransparencyGPBMessage serializedSize](self, "serializedSize"));
  v4 = -[TransparencyGPBCodedOutputStream initWithData:]([TransparencyGPBCodedOutputStream alloc], "initWithData:", v3);
  -[TransparencyGPBMessage writeToCodedOutputStream:](self, "writeToCodedOutputStream:", v4);

  return v3;
}

- (id)delimitedData
{
  unint64_t v3;
  NSMutableData *v4;
  TransparencyGPBCodedOutputStream *v5;

  v3 = -[TransparencyGPBMessage serializedSize](self, "serializedSize");
  v4 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", sub_10009F23C(v3) + v3);
  v5 = -[TransparencyGPBCodedOutputStream initWithData:]([TransparencyGPBCodedOutputStream alloc], "initWithData:", v4);
  -[TransparencyGPBMessage writeDelimitedToCodedOutputStream:](self, "writeDelimitedToCodedOutputStream:", v5);

  return v4;
}

- (void)writeToOutputStream:(id)a3
{
  TransparencyGPBCodedOutputStream *v4;

  v4 = -[TransparencyGPBCodedOutputStream initWithOutputStream:]([TransparencyGPBCodedOutputStream alloc], "initWithOutputStream:", a3);
  -[TransparencyGPBMessage writeToCodedOutputStream:](self, "writeToCodedOutputStream:", v4);

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
  TransparencyGPBUnknownFieldSet *unknownFields;
  void *v19;

  v5 = -[TransparencyGPBMessage descriptor](self, "descriptor");
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
        -[TransparencyGPBMessage writeExtensionsToCodedOutputStream:range:sortedExtensions:](self, "writeExtensionsToCodedOutputStream:range:sortedExtensions:", a3, v8[v13], v12);
        v14 = v7;
        ++v13;
      }
      else if (v13 == v9
             || (v15 = objc_msgSend(v6, "objectAtIndexedSubscript:", v14),
                 v16 = &v8[v13],
                 *(_DWORD *)(v15[1] + 16) < *(_DWORD *)v16))
      {
        -[TransparencyGPBMessage writeField:toCodedOutputStream:](self, "writeField:toCodedOutputStream:", objc_msgSend(v6, "objectAtIndexedSubscript:", v14++), a3);
      }
      else
      {
        ++v13;
        -[TransparencyGPBMessage writeExtensionsToCodedOutputStream:range:sortedExtensions:](self, "writeExtensionsToCodedOutputStream:range:sortedExtensions:", a3, *v16, v12);
      }
    }
    while (v14 < v7 || v13 < v9);
  }
  v17 = objc_msgSend(v19, "isWireFormat");
  unknownFields = self->unknownFields_;
  if ((v17 & 1) != 0)
    -[TransparencyGPBUnknownFieldSet writeAsMessageSetTo:](unknownFields, "writeAsMessageSetTo:", a3);
  else
    -[TransparencyGPBUnknownFieldSet writeToCodedOutputStream:](unknownFields, "writeToCodedOutputStream:", a3);
}

- (void)writeDelimitedToOutputStream:(id)a3
{
  TransparencyGPBCodedOutputStream *v4;

  v4 = -[TransparencyGPBCodedOutputStream initWithOutputStream:]([TransparencyGPBCodedOutputStream alloc], "initWithOutputStream:", a3);
  -[TransparencyGPBMessage writeDelimitedToCodedOutputStream:](self, "writeDelimitedToCodedOutputStream:", v4);

}

- (void)writeDelimitedToCodedOutputStream:(id)a3
{
  objc_msgSend(a3, "writeRawVarintSizeTAs32:", -[TransparencyGPBMessage serializedSize](self, "serializedSize"));
  -[TransparencyGPBMessage writeToCodedOutputStream:](self, "writeToCodedOutputStream:", a3);
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
  double v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
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

  v7 = objc_msgSend(a3, "fieldType");
  if (v7
    || sub_1000C94C8((uint64_t)self, *(_DWORD *)(*((_QWORD *)a3 + 1) + 20), *(_DWORD *)(*((_QWORD *)a3 + 1) + 16)))
  {
    v8 = *((_QWORD *)a3 + 1);
    v9 = *(unsigned int *)(v8 + 16);
    switch(*(_BYTE *)(v8 + 30))
    {
      case 0:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v10 = sub_1000A262C((uint64_t)a3);
          else
            v10 = 0;
          v37 = sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
          _objc_msgSend(a4, "writeBoolArray:values:tag:", v9, v37, v10);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          objc_msgSend(a4, "writeBool:value:", v9, sub_1000C9A78((uint64_t)self, a3));
        }
        break;
      case 1:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v11 = sub_1000A262C((uint64_t)a3);
          else
            v11 = 0;
          objc_msgSend(a4, "writeFixed32Array:values:tag:", v9, sub_1000C8FE0((uint64_t)self, (uint64_t)a3), v11);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          objc_msgSend(a4, "writeFixed32:value:", v9, sub_1000C986C((uint64_t)self, a3));
        }
        break;
      case 2:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v12 = sub_1000A262C((uint64_t)a3);
          else
            v12 = 0;
          v38 = sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
          _objc_msgSend(a4, "writeSFixed32Array:values:tag:", v9, v38, v12);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v28 = sub_1000C986C((uint64_t)self, a3);
          _objc_msgSend(a4, "writeSFixed32:value:", v9, v28, v50);
        }
        break;
      case 3:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v13 = sub_1000A262C((uint64_t)a3);
          else
            v13 = 0;
          v39 = sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
          _objc_msgSend(a4, "writeFloatArray:values:tag:", v9, v39, v13);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          *(float *)&v29 = sub_1000C9DC4((uint64_t)self, a3);
          objc_msgSend(a4, "writeFloat:value:", v9, v29);
        }
        break;
      case 4:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v14 = sub_1000A262C((uint64_t)a3);
          else
            v14 = 0;
          objc_msgSend(a4, "writeFixed64Array:values:tag:", v9, sub_1000C8FE0((uint64_t)self, (uint64_t)a3), v14);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          objc_msgSend(a4, "writeFixed64:value:", v9, sub_1000C9C5C((uint64_t)self, a3));
        }
        break;
      case 5:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v15 = sub_1000A262C((uint64_t)a3);
          else
            v15 = 0;
          v40 = sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
          _objc_msgSend(a4, "writeSFixed64Array:values:tag:", v9, v40, v15);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v30 = sub_1000C9C5C((uint64_t)self, a3);
          _objc_msgSend(a4, "writeSFixed64:value:", v9, v30, v51);
        }
        break;
      case 6:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v16 = sub_1000A262C((uint64_t)a3);
          else
            v16 = 0;
          v41 = sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
          _objc_msgSend(a4, "writeDoubleArray:values:tag:", v9, v41, v16);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          objc_msgSend(a4, "writeDouble:value:", v9, sub_1000C9F44((uint64_t)self, a3));
        }
        break;
      case 7:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v17 = sub_1000A262C((uint64_t)a3);
          else
            v17 = 0;
          v42 = sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
          _objc_msgSend(a4, "writeInt32Array:values:tag:", v9, v42, v17);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v31 = sub_1000C986C((uint64_t)self, a3);
          _objc_msgSend(a4, "writeInt32:value:", v9, v31, v48);
        }
        break;
      case 8:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v18 = sub_1000A262C((uint64_t)a3);
          else
            v18 = 0;
          v43 = sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
          _objc_msgSend(a4, "writeInt64Array:values:tag:", v9, v43, v18);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v32 = sub_1000C9C5C((uint64_t)self, a3);
          _objc_msgSend(a4, "writeInt64:value:", v9, v32, v49);
        }
        break;
      case 9:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v19 = sub_1000A262C((uint64_t)a3);
          else
            v19 = 0;
          v44 = sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
          _objc_msgSend(a4, "writeSInt32Array:values:tag:", v9, v44, v19);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v33 = sub_1000C986C((uint64_t)self, a3);
          _objc_msgSend(a4, "writeSInt32:value:", v9, v33, v52);
        }
        break;
      case 0xA:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v20 = sub_1000A262C((uint64_t)a3);
          else
            v20 = 0;
          v45 = sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
          _objc_msgSend(a4, "writeSInt64Array:values:tag:", v9, v45, v20);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          v34 = sub_1000C9C5C((uint64_t)self, a3);
          _objc_msgSend(a4, "writeSInt64:value:", v9, v34, v53);
        }
        break;
      case 0xB:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v21 = sub_1000A262C((uint64_t)a3);
          else
            v21 = 0;
          v46 = sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
          _objc_msgSend(a4, "writeUInt32Array:values:tag:", v9, v46, v21);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          objc_msgSend(a4, "writeUInt32:value:", v9, sub_1000C986C((uint64_t)self, a3));
        }
        break;
      case 0xC:
        if (v7 == 1)
        {
          if (objc_msgSend(a3, "isPackable"))
            v22 = sub_1000A262C((uint64_t)a3);
          else
            v22 = 0;
          objc_msgSend(a4, "writeUInt64Array:values:tag:", v9, sub_1000C8FE0((uint64_t)self, (uint64_t)a3), v22);
        }
        else
        {
          if (v7)
            goto LABEL_92;
          objc_msgSend(a4, "writeUInt64:value:", v9, sub_1000C9C5C((uint64_t)self, a3));
        }
        break;
      case 0xD:
        v23 = (void *)sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
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
        v23 = (void *)sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          _objc_msgSend(a4, "writeStringArray:values:", v9, v23, v24);
        }
        else
        {
          if (v7)
            goto LABEL_88;
          objc_msgSend(a4, "writeString:value:", v9, v23);
        }
        break;
      case 0xF:
        v23 = (void *)sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          _objc_msgSend(a4, "writeMessageArray:values:", v9, v23, v25);
        }
        else
        {
          if (v7)
            goto LABEL_88;
          objc_msgSend(a4, "writeMessage:value:", v9, v23);
        }
        break;
      case 0x10:
        v23 = (void *)sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
        if (v7 == 1)
        {
          _objc_msgSend(a4, "writeGroupArray:values:", v9, v23, v26);
        }
        else if (v7)
        {
LABEL_88:
          if (objc_msgSend(a3, "mapKeyDataType") != 14)
          {
            v36 = v23;
            goto LABEL_93;
          }
          sub_1000A3674(a4, v23, (uint64_t)a3);
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
            v27 = sub_1000A262C((uint64_t)a3);
          else
            v27 = 0;
          v47 = sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
          _objc_msgSend(a4, "writeEnumArray:values:tag:", v9, v47, v27);
        }
        else if (v7)
        {
LABEL_92:
          v36 = (void *)sub_1000C8FE0((uint64_t)self, (uint64_t)a3);
LABEL_93:
          _objc_msgSend(v36, "writeToCodedOutputStream:asField:", a4, a3, v35);
        }
        else
        {
          objc_msgSend(a4, "writeEnum:value:", v9, sub_1000C986C((uint64_t)self, a3));
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
  NSMutableDictionary *autocreatedExtensionMap;

  sub_1000C1578((uint64_t)self, a3);
  v5 = -[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", a3);
  if (v5)
    return v5;
  if ((objc_msgSend(a3, "isRepeated") & 1) != 0)
    return 0;
  if (*(unsigned __int8 *)(*((_QWORD *)a3 + 1) + 44) - 15 < 2)
  {
    os_unfair_lock_lock(&self->readOnlyLock_);
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
    os_unfair_lock_unlock(&self->readOnlyLock_);
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

- (void)writeExtensionsToCodedOutputStream:(id)a3 range:(TransparencyGPBExtensionRange)a4 sortedExtensions:(id)a5
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
          sub_1000BDF7C((uint64_t)v13, -[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", v13), a3);
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
    sub_1000C1578((uint64_t)self, a3);
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
      sub_1000BF288((uint64_t)v8);

    }
    sub_1000BEF7C(self);
  }
  else
  {
    -[TransparencyGPBMessage clearExtension:](self, "clearExtension:");
  }
}

- (void)addExtension:(id)a3 value:(id)a4
{
  NSMutableDictionary *extensionMap;
  id v8;

  sub_1000C1578((uint64_t)self, a3);
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
  sub_1000BEF7C(self);
}

- (void)setExtension:(id)a3 index:(unint64_t)a4 value:(id)a5
{
  NSMutableDictionary *extensionMap;

  sub_1000C1578((uint64_t)self, a3);
  if ((objc_msgSend(a3, "isRepeated") & 1) == 0)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Must call setExtension() for singular types."));
  extensionMap = self->extensionMap_;
  if (!extensionMap)
  {
    extensionMap = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->extensionMap_ = extensionMap;
  }
  objc_msgSend(-[NSMutableDictionary objectForKey:](extensionMap, "objectForKey:", a3), "replaceObjectAtIndex:withObject:", a4, a5);
  sub_1000BEF7C(self);
}

- (void)clearExtension:(id)a3
{
  sub_1000C1578((uint64_t)self, a3);
  if (-[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", a3))
  {
    -[NSMutableDictionary removeObjectForKey:](self->extensionMap_, "removeObjectForKey:", a3);
    sub_1000BEF7C(self);
  }
}

- (void)mergeFromData:(id)a3 extensionRegistry:(id)a4
{
  TransparencyGPBCodedInputStream *v6;

  v6 = -[TransparencyGPBCodedInputStream initWithData:]([TransparencyGPBCodedInputStream alloc], "initWithData:", a3);
  -[TransparencyGPBMessage mergeFromCodedInputStream:extensionRegistry:](self, "mergeFromCodedInputStream:extensionRegistry:", v6, a4);
  -[TransparencyGPBCodedInputStream checkLastTagWas:](v6, "checkLastTagWas:", 0);

}

- (void)mergeDelimitedFromCodedInputStream:(id)a3 extensionRegistry:(id)a4
{
  uint64_t *v6;
  id v7;
  id v8;

  v6 = (uint64_t *)((char *)a3 + 8);
  if (!sub_10009CEE4((_QWORD *)a3 + 1))
  {
    v7 = sub_10009D15C(v6);
    if (v7)
    {
      v8 = v7;
      -[TransparencyGPBMessage mergeFromData:extensionRegistry:](self, "mergeFromData:extensionRegistry:", v7, a4);

    }
  }
}

+ (id)parseFromData:(id)a3 error:(id *)a4
{
  return _objc_msgSend(a1, "parseFromData:extensionRegistry:error:", a3, 0, a4);
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

- (TransparencyGPBUnknownFieldSet)unknownFields
{
  return self->unknownFields_;
}

- (void)setUnknownFields:(id)a3
{
  TransparencyGPBUnknownFieldSet *unknownFields;

  unknownFields = self->unknownFields_;
  if (unknownFields != a3)
  {

    self->unknownFields_ = (TransparencyGPBUnknownFieldSet *)objc_msgSend(a3, "copy");
    sub_1000BEF7C(self);
  }
}

- (void)parseMessageSet:(id)a3 extensionRegistry:(id)a4
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  id v12;
  _QWORD *v13;
  void *v14;
  TransparencyGPBCodedInputStream *v15;

  v7 = (uint64_t *)((char *)a3 + 8);
  v8 = sub_10009CE54((uint64_t)a3 + 8);
  if ((_DWORD)v8)
  {
    v9 = v8;
    v10 = sub_1000CC22C(2, 0);
    v11 = 0;
    v12 = 0;
    v13 = 0;
    do
    {
      if ((_DWORD)v9 == v10)
      {
        v11 = sub_10009CD74(v7);
        if ((_DWORD)v11)
          v13 = objc_msgSend(a4, "extensionForDescriptor:fieldNumber:", -[TransparencyGPBMessage descriptor](self, "descriptor"), v11);
      }
      else if ((_DWORD)v9 == sub_1000CC22C(3, 2))
      {
        v12 = sub_10009D15C(v7);
      }
      else if (!objc_msgSend(a3, "skipField:", v9))
      {
        break;
      }
      v9 = sub_10009CE54((uint64_t)v7);
    }
    while ((_DWORD)v9);
  }
  else
  {
    v13 = 0;
    v12 = 0;
    v11 = 0;
  }
  objc_msgSend(a3, "checkLastTagWas:", sub_1000CC22C(1, 4));
  if (v12 && (_DWORD)v11)
  {
    if (v13)
    {
      v15 = -[TransparencyGPBCodedInputStream initWithData:]([TransparencyGPBCodedInputStream alloc], "initWithData:", v12);
      sub_1000C1E58(v13, (int)objc_msgSend(v13, "isPackable"), (uint64_t *)v15, (uint64_t)a4, self);

    }
    else
    {
      v14 = (void *)sub_1000C1FFC(self);
      _objc_msgSend(v14, "mergeMessageSetMessage:data:", v11, +[NSData dataWithData:](NSData, "dataWithData:", v12));
    }
  }
}

- (BOOL)parseUnknownField:(id)a3 extensionRegistry:(id)a4 tag:(unsigned int)a5
{
  uint64_t v5;
  int v9;
  int v10;
  id v11;
  _QWORD *v12;
  _QWORD *v13;
  unsigned int v14;
  unsigned int v15;

  v5 = *(_QWORD *)&a5;
  v9 = sub_1000CC234(a5);
  v10 = sub_1000CC23C(v5);
  v11 = -[TransparencyGPBMessage descriptor](self, "descriptor");
  v12 = objc_msgSend(a4, "extensionForDescriptor:fieldNumber:", v11, v10);
  if (v12)
  {
    v13 = v12;
    if (objc_msgSend(v12, "wireType") == v9)
    {
      v14 = objc_msgSend(v13, "isPackable");
LABEL_4:
      sub_1000C1E58(v13, v14, (uint64_t *)a3, (uint64_t)a4, self);
LABEL_8:
      LOBYTE(v15) = 1;
      return v15;
    }
    if (objc_msgSend(v13, "isRepeated")
      && *(unsigned __int8 *)(v13[1] + 44) - 13 >= 4
      && objc_msgSend(v13, "alternateWireType") == v9)
    {
      v14 = objc_msgSend(v13, "isPackable") ^ 1;
      goto LABEL_4;
    }
  }
  else if (objc_msgSend(v11, "isWireFormat") && sub_1000CC22C(1, 3) == (_DWORD)v5)
  {
    -[TransparencyGPBMessage parseMessageSet:extensionRegistry:](self, "parseMessageSet:extensionRegistry:", a3, a4);
    goto LABEL_8;
  }
  v15 = +[TransparencyGPBUnknownFieldSet isFieldTag:](TransparencyGPBUnknownFieldSet, "isFieldTag:", v5);
  if (v15)
    LOBYTE(v15) = objc_msgSend((id)sub_1000C1FFC(self), "mergeFieldFrom:input:", v5, a3);
  return v15;
}

- (void)addUnknownMapEntry:(int)a3 value:(id)a4
{
  objc_msgSend((id)sub_1000C1FFC(self), "addUnknownMapEntry:value:", *(_QWORD *)&a3, a4);
}

- (void)mergeFromCodedInputStream:(id)a3 extensionRegistry:(id)a4
{
  void *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  _QWORD *v12;
  char *v13;
  unsigned int v14;
  uint64_t v15;
  _BOOL4 v16;
  int v17;
  int v18;
  float v19;
  uint64_t v20;
  int v21;
  TransparencyGPBMessage *v22;
  uint64_t v23;
  void *v24;
  double v25;
  void *v26;
  TransparencyGPBMessage *v27;
  _QWORD *v28;
  uint64_t v29;
  id v30;

  v6 = (void *)*((_QWORD *)-[TransparencyGPBMessage descriptor](self, "descriptor") + 1);
  v7 = (char *)objc_msgSend(v6, "count");
  v8 = sub_10009CE54((uint64_t)a3 + 8);
  if ((_DWORD)v8)
  {
    v9 = v8;
    v10 = 0;
    do
    {
      v11 = v7;
      if (v7)
      {
        while (1)
        {
          if (v10 >= (unint64_t)v7)
            v10 = 0;
          v12 = objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
          if (sub_1000A262C((uint64_t)v12) == (_DWORD)v9)
            break;
          ++v10;
          if (!--v11)
          {
            v13 = v7;
            while (1)
            {
              if (v10 >= (unint64_t)v7)
                v10 = 0;
              v12 = objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
              if (objc_msgSend(v12, "fieldType") == 1
                && *(unsigned __int8 *)(v12[1] + 30) - 13 >= 4
                && sub_1000A2674((uint64_t)v12) == (_DWORD)v9)
              {
                break;
              }
              ++v10;
              if (!--v13)
                goto LABEL_15;
            }
            if ((objc_msgSend(v12, "isPackable") & 1) != 0)
              goto LABEL_25;
LABEL_22:
            sub_1000C26F4(self, v12, (uint64_t)a3);
            goto LABEL_57;
          }
        }
        v14 = objc_msgSend(v12, "fieldType");
        if (v14 == 1)
        {
          if (!objc_msgSend(v12, "isPackable"))
          {
LABEL_25:
            sub_1000C28D8(self, v12, (uint64_t *)a3, (uint64_t)a4);
            goto LABEL_58;
          }
          goto LABEL_22;
        }
        if (v14)
        {
          objc_msgSend(a3, "readMapEntry:extensionRegistry:field:parentMessage:", sub_1000C2B64((uint64_t)self, v12), a4, v12, self);
          goto LABEL_58;
        }
        v15 = v12[1];
        switch(*(_BYTE *)(v15 + 30))
        {
          case 0:
            v16 = sub_10009CE38((uint64_t *)a3 + 1);
            sub_1000C9B2C(self, (uint64_t)v12, v16);
            break;
          case 1:
            v17 = sub_10009CDC0((_QWORD *)a3 + 1);
            goto LABEL_35;
          case 2:
            v18 = sub_10009CDC0((_QWORD *)a3 + 1);
            goto LABEL_32;
          case 3:
            v19 = sub_10009CCB4((_QWORD *)a3 + 1);
            sub_1000C9E5C(self, (uint64_t)v12, v19);
            break;
          case 4:
            v20 = sub_10009CD88((_QWORD *)a3 + 1);
            goto LABEL_37;
          case 5:
            v20 = sub_10009CD88((_QWORD *)a3 + 1);
            goto LABEL_37;
          case 6:
            v25 = sub_10009CC7C((_QWORD *)a3 + 1);
            sub_1000C9FDC(self, (uint64_t)v12, v25);
            break;
          case 7:
            v18 = sub_10009CD74((uint64_t *)a3 + 1);
            goto LABEL_32;
          case 8:
            v20 = sub_10009CCEC((char *)a3 + 8);
            goto LABEL_37;
          case 9:
            v18 = sub_10009CDF8((uint64_t *)a3 + 1);
LABEL_32:
            v21 = v18;
            v22 = self;
            v23 = (uint64_t)v12;
            goto LABEL_33;
          case 0xA:
            v20 = sub_10009CE18((uint64_t *)a3 + 1);
            goto LABEL_37;
          case 0xB:
            v17 = sub_10009CD74((uint64_t *)a3 + 1);
LABEL_35:
            sub_1000C998C(self, (uint64_t)v12, v17);
            break;
          case 0xC:
            v20 = sub_10009CCEC((char *)a3 + 8);
LABEL_37:
            sub_1000C9CE0(self, (uint64_t)v12, v20);
            break;
          case 0xD:
            v24 = sub_10009D0E8((uint64_t *)a3 + 1);
            goto LABEL_49;
          case 0xE:
            v24 = (void *)sub_10009CFFC((uint64_t *)a3 + 1);
LABEL_49:
            v26 = v24;
            v27 = self;
            v28 = v12;
            goto LABEL_56;
          case 0xF:
            if (sub_1000C94C8((uint64_t)self, *(_DWORD *)(v15 + 20), *(_DWORD *)(v15 + 16)))
            {
              objc_msgSend(a3, "readMessage:extensionRegistry:", sub_1000C8FE0((uint64_t)self, (uint64_t)v12), a4);
              break;
            }
            v30 = objc_alloc_init((Class)objc_msgSend(v12, "msgClass"));
            objc_msgSend(a3, "readMessage:extensionRegistry:", v30, a4);
            goto LABEL_55;
          case 0x10:
            if (sub_1000C94C8((uint64_t)self, *(_DWORD *)(v15 + 20), *(_DWORD *)(v15 + 16)))
            {
              objc_msgSend(a3, "readGroup:message:extensionRegistry:", *(unsigned int *)(v12[1] + 16), sub_1000C8FE0((uint64_t)self, (uint64_t)v12), a4);
            }
            else
            {
              v30 = objc_alloc_init((Class)objc_msgSend(v12, "msgClass"));
              objc_msgSend(a3, "readGroup:message:extensionRegistry:", *(unsigned int *)(v12[1] + 16), v30, a4);
LABEL_55:
              v27 = self;
              v28 = v12;
              v26 = v30;
LABEL_56:
              sub_1000C95FC((uint64_t)v27, v28, v26);
            }
            break;
          case 0x11:
            v29 = sub_10009CD74((uint64_t *)a3 + 1);
            if ((*(_WORD *)(v12[1] + 28) & 0x1000) != 0 && !objc_msgSend(v12, "isValidEnumValue:", v29))
            {
              objc_msgSend((id)sub_1000C1FFC(self), "mergeVarintField:value:", *(unsigned int *)(v12[1] + 16), v29);
            }
            else
            {
              v22 = self;
              v23 = (uint64_t)v12;
              v21 = v29;
LABEL_33:
              sub_1000C998C(v22, v23, v21);
            }
            break;
          default:
            break;
        }
LABEL_57:
        ++v10;
      }
      else
      {
LABEL_15:
        if (!-[TransparencyGPBMessage parseUnknownField:extensionRegistry:tag:](self, "parseUnknownField:extensionRegistry:tag:", a3, a4, v9))return;
      }
LABEL_58:
      v9 = sub_10009CE54((uint64_t)a3 + 8);
    }
    while ((_DWORD)v9);
  }
}

- (void)mergeFrom:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  _QWORD *v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  int v26;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _BOOL4 v32;
  float v33;
  double v34;
  TransparencyGPBUnknownFieldSet *unknownFields;
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

  v5 = (void *)objc_opt_class(self, a2);
  v7 = (void *)objc_opt_class(a3, v6);
  if ((objc_msgSend(v5, "isSubclassOfClass:", v7) & 1) == 0
    && (objc_msgSend(v7, "isSubclassOfClass:", v5) & 1) == 0)
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Classes must match %@ != %@"), v5, v7);
  }
  sub_1000BEF7C(self);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v9 = (void *)*((_QWORD *)objc_msgSend((id)objc_opt_class(self, v8), "descriptor") + 1);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v67 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
        v15 = objc_msgSend(v14, "fieldType");
        if (v15 == 1)
        {
          v20 = sub_1000C8FE0((uint64_t)a3, (uint64_t)v14);
          if (v20)
          {
            v21 = v20;
            v22 = *(unsigned __int8 *)(v14[1] + 30);
            if ((v22 - 13) > 3)
            {
              v28 = sub_1000C3240((uint64_t)self, v14);
              if (v22 == 17)
                objc_msgSend(v28, "addRawValuesFromArray:", v21);
              else
                objc_msgSend(v28, "addValuesFromArray:", v21);
            }
            else
            {
              objc_msgSend(sub_1000C3240((uint64_t)self, v14), "addObjectsFromArray:", v20);
            }
          }
        }
        else if (v15)
        {
          v23 = sub_1000C8FE0((uint64_t)a3, (uint64_t)v14);
          if (!v23)
            continue;
          v24 = v23;
          v25 = objc_msgSend(v14, "mapKeyDataType");
          v26 = *(unsigned __int8 *)(v14[1] + 30);
          if (v25 - 13 > 3 || (v26 - 13) > 3)
          {
            v29 = sub_1000C2B64((uint64_t)self, v14);
            if (v26 == 17)
            {
              objc_msgSend(v29, "addRawEntriesFromDictionary:", v24);
              continue;
            }
          }
          else
          {
            v29 = sub_1000C2B64((uint64_t)self, v14);
          }
          objc_msgSend(v29, "addEntriesFromDictionary:", v24);
        }
        else
        {
          v16 = v14[1];
          v18 = *(_DWORD *)(v16 + 16);
          v17 = *(_DWORD *)(v16 + 20);
          if (sub_1000C94C8((uint64_t)a3, v17, v18))
          {
            switch(*(_BYTE *)(v14[1] + 30))
            {
              case 0:
                v32 = sub_1000C9A78((uint64_t)a3, v14);
                sub_1000C9B2C(self, (uint64_t)v14, v32);
                break;
              case 1:
              case 2:
              case 7:
              case 9:
              case 0xB:
              case 0x11:
                v19 = sub_1000C986C((uint64_t)a3, v14);
                sub_1000C998C(self, (uint64_t)v14, v19);
                break;
              case 3:
                v33 = sub_1000C9DC4((uint64_t)a3, v14);
                sub_1000C9E5C(self, (uint64_t)v14, v33);
                break;
              case 4:
              case 5:
              case 8:
              case 0xA:
              case 0xC:
                v30 = sub_1000C9C5C((uint64_t)a3, v14);
                sub_1000C9CE0(self, (uint64_t)v14, (uint64_t)v30);
                break;
              case 6:
                v34 = sub_1000C9F44((uint64_t)a3, v14);
                sub_1000C9FDC(self, (uint64_t)v14, v34);
                break;
              case 0xD:
              case 0xE:
                v31 = (void *)sub_1000C8FE0((uint64_t)a3, (uint64_t)v14);
                sub_1000C95CC((uint64_t)self, v14, v31);
                break;
              case 0xF:
              case 0x10:
                obj = (id)sub_1000C8FE0((uint64_t)a3, (uint64_t)v14);
                if (sub_1000C94C8((uint64_t)self, v17, v18))
                  objc_msgSend((id)sub_1000C8FE0((uint64_t)self, (uint64_t)v14), "mergeFrom:", obj);
                else
                  sub_1000C95FC((uint64_t)self, v14, objc_msgSend(obj, "copy"));
                break;
              default:
                continue;
            }
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
    }
    while (v11);
  }
  unknownFields = self->unknownFields_;
  v36 = objc_msgSend(a3, "unknownFields");
  if (unknownFields)
    -[TransparencyGPBUnknownFieldSet mergeUnknownFields:](unknownFields, "mergeUnknownFields:", v36);
  else
    -[TransparencyGPBMessage setUnknownFields:](self, "setUnknownFields:", v36);
  if (objc_msgSend(*((id *)a3 + 2), "count"))
  {
    if (!self->extensionMap_)
    {
      v52 = (void *)*((_QWORD *)a3 + 2);
      v53 = NSZoneFromPointer(self);
      self->extensionMap_ = sub_1000BFBAC(v52, (uint64_t)v53);
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
            goto LABEL_69;
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
            goto LABEL_69;
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
          sub_1000BF288((uint64_t)v51);

        }
LABEL_69:
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
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  int v21;
  int v22;
  int v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  uint64_t v31;
  TransparencyGPBMessage_Storage *messageStorage;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  if (a3 == self)
    goto LABEL_39;
  v5 = objc_opt_class(TransparencyGPBMessage, a2);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0
    || (v7 = objc_msgSend((id)objc_opt_class(self, v6), "descriptor"),
        objc_msgSend((id)objc_opt_class(a3, v8), "descriptor") != v7))
  {
LABEL_4:
    LOBYTE(v9) = 0;
    return v9;
  }
  v31 = *((_QWORD *)a3 + 8);
  messageStorage = self->messageStorage_;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = (id)v7[1];
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v35;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v13);
        v15 = *(_QWORD *)(v14 + 8);
        if ((*(_WORD *)(v15 + 28) & 0xF02) != 0)
        {
          v16 = (void *)sub_1000C8FE0((uint64_t)self, *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v13));
          v17 = (void *)sub_1000C8FE0((uint64_t)a3, v14);
          if (objc_msgSend(v16, "count") || objc_msgSend(v17, "count"))
          {
            v18 = v16;
            v19 = v17;
LABEL_14:
            if ((objc_msgSend(v18, "isEqual:", v19) & 1) == 0)
              goto LABEL_4;
          }
        }
        else
        {
          v21 = *(_DWORD *)(v15 + 16);
          v20 = *(_DWORD *)(v15 + 20);
          v22 = sub_1000C94C8((uint64_t)self, v20, v21);
          v23 = sub_1000C94C8((uint64_t)a3, v20, v21);
          if (v22)
            v24 = v23 == 0;
          else
            v24 = 1;
          if (!v24)
          {
            v25 = *(_QWORD *)(v14 + 8);
            v26 = *(unsigned int *)(v25 + 24);
            switch(*(_BYTE *)(v25 + 30))
            {
              case 0:
                v27 = sub_1000C94C8((uint64_t)self, *(_DWORD *)(v25 + 24), 0);
                if (v27 != sub_1000C94C8((uint64_t)a3, v26, 0))
                  goto LABEL_4;
                goto LABEL_27;
              case 1:
              case 2:
              case 3:
              case 7:
              case 9:
              case 0xB:
              case 0x11:
                if (*(_DWORD *)((char *)messageStorage + v26) != *(_DWORD *)(v31 + v26))
                  goto LABEL_4;
                goto LABEL_27;
              case 4:
              case 5:
              case 6:
              case 8:
              case 0xA:
              case 0xC:
                if (*(_QWORD *)((char *)messageStorage + v26) == *(_QWORD *)(v31 + v26))
                  goto LABEL_27;
                goto LABEL_4;
              case 0xD:
              case 0xE:
              case 0xF:
              case 0x10:
                v18 = *(void **)((char *)messageStorage + v26);
                v19 = *(void **)(v31 + v26);
                goto LABEL_14;
              default:
                goto LABEL_27;
            }
          }
          if (v22 != v23)
            goto LABEL_4;
        }
LABEL_27:
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      v11 = v28;
    }
    while (v28);
  }
  if (!-[NSMutableDictionary count](self->extensionMap_, "count") && !objc_msgSend(*((id *)a3 + 2), "count")
    || (v9 = -[NSMutableDictionary isEqual:](self->extensionMap_, "isEqual:", *((_QWORD *)a3 + 2))) != 0)
  {
    if ((v29 = (void *)*((_QWORD *)a3 + 1),
          !-[TransparencyGPBUnknownFieldSet countOfFields](self->unknownFields_, "countOfFields"))
      && !objc_msgSend(v29, "countOfFields")
      || (v9 = -[TransparencyGPBUnknownFieldSet isEqual:](self->unknownFields_, "isEqual:", v29)) != 0)
    {
LABEL_39:
      LOBYTE(v9) = 1;
    }
  }
  return v9;
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
  TransparencyGPBMessage_Storage *messageStorage;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = (unint64_t)objc_msgSend((id)objc_opt_class(self, a2), "descriptor");
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
          v11 = objc_msgSend((id)sub_1000C8FE0((uint64_t)self, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i)), "count");
          if (v11)
            v3 = (unint64_t)v11 + 361 * v3 + 19 * *(unsigned int *)(*(_QWORD *)(v9 + 8) + 16);
        }
        else if (sub_1000C94C8((uint64_t)self, *(_DWORD *)(v10 + 20), *(_DWORD *)(v10 + 16)))
        {
          v12 = *(_QWORD *)(v9 + 8);
          v13 = *(unsigned int *)(v12 + 24);
          switch(*(_BYTE *)(v12 + 30))
          {
            case 0:
              v3 = 19 * v3 + sub_1000C94C8((uint64_t)self, v13, 0);
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
              v15 = objc_msgSend((id)objc_opt_class(*(_QWORD *)((char *)messageStorage + v13), v13), "descriptor");
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
  uint64_t v4;

  v3 = sub_1000CA198(self, CFSTR("    "));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p>: {\n%@}"), objc_opt_class(self, v4), self, v3);
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
  id v31;
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
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  unsigned int v47;
  TransparencyGPBUnknownFieldSet *unknownFields;
  unint64_t v49;
  unint64_t v50;
  NSMutableDictionary *extensionMap;
  id v52;
  unint64_t v53;
  uint64_t v54;
  void *n;
  _QWORD *v57;
  void *v58;
  id v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD v65[5];
  __int128 v66;
  __int128 v67;
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
  _QWORD v82[5];
  _QWORD v83[5];
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
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];

  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v57 = objc_msgSend((id)objc_opt_class(self, a2), "descriptor");
  v3 = (void *)v57[1];
  v4 = 0;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
  if (!v5)
    goto LABEL_85;
  v60 = *(_QWORD *)v100;
  v58 = v3;
  do
  {
    v6 = 0;
    v59 = v5;
    do
    {
      if (*(_QWORD *)v100 != v60)
        objc_enumerationMutation(v3);
      v7 = *(_QWORD **)(*((_QWORD *)&v99 + 1) + 8 * (_QWORD)v6);
      v8 = objc_msgSend(v7, "fieldType");
      v9 = v7[1];
      v10 = *(unsigned __int8 *)(v9 + 30);
      if (v8 == 1)
      {
        v13 = (void *)sub_1000C8FE0((uint64_t)self, (uint64_t)v7);
        v14 = objc_msgSend(v13, "count");
        if (v14)
        {
          v95 = 0;
          v96 = &v95;
          v97 = 0x2020000000;
          v98 = 0;
          switch(v10)
          {
            case 0:
              v94[0] = _NSConcreteStackBlock;
              v94[1] = 3221225472;
              v94[2] = sub_1000C43B4;
              v94[3] = &unk_10010B680;
              v94[4] = &v95;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v94);
              break;
            case 1:
              v93[0] = _NSConcreteStackBlock;
              v93[1] = 3221225472;
              v93[2] = sub_1000C43EC;
              v93[3] = &unk_10010B608;
              v93[4] = &v95;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v93);
              break;
            case 2:
              v92[0] = _NSConcreteStackBlock;
              v92[1] = 3221225472;
              v92[2] = sub_1000C4424;
              v92[3] = &unk_10010B590;
              v92[4] = &v95;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v92);
              break;
            case 3:
              v91[0] = _NSConcreteStackBlock;
              v91[1] = 3221225472;
              v91[2] = sub_1000C445C;
              v91[3] = &unk_10010B428;
              v91[4] = &v95;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v91);
              break;
            case 4:
              v90[0] = _NSConcreteStackBlock;
              v90[1] = 3221225472;
              v90[2] = sub_1000C4490;
              v90[3] = &unk_10010B4A0;
              v90[4] = &v95;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v90);
              break;
            case 5:
              v89[0] = _NSConcreteStackBlock;
              v89[1] = 3221225472;
              v89[2] = sub_1000C44C8;
              v89[3] = &unk_10010B518;
              v89[4] = &v95;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v89);
              break;
            case 6:
              v88[0] = _NSConcreteStackBlock;
              v88[1] = 3221225472;
              v88[2] = sub_1000C4500;
              v88[3] = &unk_10010B3B0;
              v88[4] = &v95;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v88);
              break;
            case 7:
              v87[0] = _NSConcreteStackBlock;
              v87[1] = 3221225472;
              v87[2] = sub_1000C4534;
              v87[3] = &unk_10010B590;
              v87[4] = &v95;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v87);
              break;
            case 8:
              v86[0] = _NSConcreteStackBlock;
              v86[1] = 3221225472;
              v86[2] = sub_1000C456C;
              v86[3] = &unk_10010B518;
              v86[4] = &v95;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v86);
              break;
            case 9:
              v85[0] = _NSConcreteStackBlock;
              v85[1] = 3221225472;
              v85[2] = sub_1000C45A4;
              v85[3] = &unk_10010B590;
              v85[4] = &v95;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v85);
              break;
            case 10:
              v84[0] = _NSConcreteStackBlock;
              v84[1] = 3221225472;
              v84[2] = sub_1000C45DC;
              v84[3] = &unk_10010B518;
              v84[4] = &v95;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v84);
              break;
            case 11:
              v83[0] = _NSConcreteStackBlock;
              v83[1] = 3221225472;
              v83[2] = sub_1000C4614;
              v83[3] = &unk_10010B608;
              v83[4] = &v95;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v83);
              break;
            case 12:
              v82[0] = _NSConcreteStackBlock;
              v82[1] = 3221225472;
              v82[2] = sub_1000C464C;
              v82[3] = &unk_10010B4A0;
              v82[4] = &v95;
              objc_msgSend(v13, "enumerateValuesWithBlock:", v82);
              break;
            case 13:
              v80 = 0u;
              v81 = 0u;
              v78 = 0u;
              v79 = 0u;
              v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v78, v107, 16);
              if (v16)
              {
                v17 = *(_QWORD *)v79;
                do
                {
                  for (i = 0; i != v16; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v79 != v17)
                      objc_enumerationMutation(v13);
                    v19 = sub_1000A09B4(*(void **)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)i));
                    v96[3] += (uint64_t)v19;
                  }
                  v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v78, v107, 16);
                }
                while (v16);
              }
              break;
            case 14:
              v76 = 0u;
              v77 = 0u;
              v74 = 0u;
              v75 = 0u;
              v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v74, v106, 16);
              if (v20)
              {
                v21 = *(_QWORD *)v75;
                do
                {
                  for (j = 0; j != v20; j = (char *)j + 1)
                  {
                    if (*(_QWORD *)v75 != v21)
                      objc_enumerationMutation(v13);
                    v23 = sub_1000A0914(*(void **)(*((_QWORD *)&v74 + 1) + 8 * (_QWORD)j));
                    v96[3] += (uint64_t)v23;
                  }
                  v20 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v74, v106, 16);
                }
                while (v20);
              }
              break;
            case 15:
              v72 = 0u;
              v73 = 0u;
              v70 = 0u;
              v71 = 0u;
              v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, v105, 16);
              if (v24)
              {
                v25 = *(_QWORD *)v71;
                do
                {
                  for (k = 0; k != v24; k = (char *)k + 1)
                  {
                    if (*(_QWORD *)v71 != v25)
                      objc_enumerationMutation(v13);
                    v27 = sub_1000A0968(*(void **)(*((_QWORD *)&v70 + 1) + 8 * (_QWORD)k));
                    v96[3] += (uint64_t)v27;
                  }
                  v24 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v70, v105, 16);
                }
                while (v24);
              }
              break;
            case 16:
              v68 = 0u;
              v69 = 0u;
              v66 = 0u;
              v67 = 0u;
              v28 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v66, v104, 16);
              if (v28)
              {
                v29 = *(_QWORD *)v67;
                do
                {
                  for (m = 0; m != v28; m = (char *)m + 1)
                  {
                    if (*(_QWORD *)v67 != v29)
                      objc_enumerationMutation(v13);
                    v31 = objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)m), "serializedSize");
                    v96[3] += (uint64_t)v31;
                  }
                  v28 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v66, v104, 16);
                }
                while (v28);
              }
              break;
            case 17:
              v65[0] = _NSConcreteStackBlock;
              v65[1] = 3221225472;
              v65[2] = sub_1000C4684;
              v65[3] = &unk_10010B590;
              v65[4] = &v95;
              objc_msgSend(v13, "enumerateRawValuesWithBlock:", v65);
              break;
            default:
              break;
          }
          v32 = v96[3];
          v33 = sub_1000A0A4C(*(_DWORD *)(v7[1] + 16));
          v34 = objc_msgSend(v7, "isPackable");
          v35 = v32 + v4;
          v36 = v33 << (v10 == 16);
          if (v34)
            v4 = v36 + v35 + sub_10009F030(v96[3]);
          else
            v4 = v35 + v36 * (_QWORD)v14;
          v3 = v58;
          v5 = v59;
          _Block_object_dispose(&v95, 8);
        }
      }
      else if (v8)
      {
        if ((v10 - 13) <= 3 && objc_msgSend(v7, "mapKeyDataType") == 14)
        {
          v15 = (void *)sub_1000C8FE0((uint64_t)self, (uint64_t)v7);
          if (!v15)
            goto LABEL_69;
          v12 = sub_1000A354C(v15, (uint64_t)v7);
        }
        else
        {
          v12 = (uint64_t)objc_msgSend((id)sub_1000C8FE0((uint64_t)self, (uint64_t)v7), "computeSerializedSizeAsField:", v7);
        }
LABEL_19:
        v4 += v12;
      }
      else if (sub_1000C94C8((uint64_t)self, *(_DWORD *)(v9 + 20), *(_DWORD *)(v9 + 16)))
      {
        v11 = *(_DWORD *)(v7[1] + 16);
        switch(v10)
        {
          case 0:
            sub_1000C9A78((uint64_t)self, v7);
            v12 = sub_1000A0BE4(v11);
            goto LABEL_19;
          case 1:
          case 2:
            sub_1000C986C((uint64_t)self, v7);
            v12 = sub_1000A0A98(v11);
            goto LABEL_19;
          case 3:
            sub_1000C9DC4((uint64_t)self, v7);
            v12 = sub_1000A0A98(v11);
            goto LABEL_19;
          case 4:
          case 5:
            sub_1000C9C5C((uint64_t)self, v7);
            v12 = sub_1000A0A00(v11);
            goto LABEL_19;
          case 6:
            sub_1000C9F44((uint64_t)self, v7);
            v12 = sub_1000A0A00(v11);
            goto LABEL_19;
          case 7:
          case 17:
            v37 = sub_1000C986C((uint64_t)self, v7);
            v12 = sub_1000A0B48(v11, v37);
            goto LABEL_19;
          case 8:
          case 12:
            v38 = sub_1000C9C5C((uint64_t)self, v7);
            v12 = sub_1000A0AE4(v11, (unint64_t)v38);
            goto LABEL_19;
          case 9:
            v39 = sub_1000C986C((uint64_t)self, v7);
            v12 = sub_1000A0F00(v11, v39);
            goto LABEL_19;
          case 10:
            v40 = sub_1000C9C5C((uint64_t)self, v7);
            v12 = sub_1000A0F98(v11, (uint64_t)v40);
            goto LABEL_19;
          case 11:
            v41 = sub_1000C986C((uint64_t)self, v7);
            v12 = sub_1000A0E70(v11, v41);
            goto LABEL_19;
          case 13:
            v42 = (void *)sub_1000C8FE0((uint64_t)self, (uint64_t)v7);
            v12 = (uint64_t)sub_1000A0DD4(v11, v42);
            goto LABEL_19;
          case 14:
            v43 = (void *)sub_1000C8FE0((uint64_t)self, (uint64_t)v7);
            v12 = (uint64_t)sub_1000A0C30(v11, v43);
            goto LABEL_19;
          case 15:
            v44 = (void *)sub_1000C8FE0((uint64_t)self, (uint64_t)v7);
            v12 = (uint64_t)sub_1000A0D38(v11, v44);
            goto LABEL_19;
          case 16:
            v45 = (void *)sub_1000C8FE0((uint64_t)self, (uint64_t)v7);
            v12 = (uint64_t)sub_1000A0CD0(v11, v45);
            goto LABEL_19;
          default:
            break;
        }
      }
LABEL_69:
      v6 = (char *)v6 + 1;
    }
    while (v6 != v5);
    v46 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v99, v108, 16);
    v5 = v46;
  }
  while (v46);
LABEL_85:
  v47 = objc_msgSend(v57, "isWireFormat");
  unknownFields = self->unknownFields_;
  if (v47)
    v49 = -[TransparencyGPBUnknownFieldSet serializedSizeAsMessageSet](unknownFields, "serializedSizeAsMessageSet");
  else
    v49 = -[TransparencyGPBUnknownFieldSet serializedSize](unknownFields, "serializedSize");
  v50 = v49;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  extensionMap = self->extensionMap_;
  v52 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](extensionMap, "countByEnumeratingWithState:objects:count:", &v61, v103, 16);
  v53 = v50 + v4;
  if (v52)
  {
    v54 = *(_QWORD *)v62;
    do
    {
      for (n = 0; n != v52; n = (char *)n + 1)
      {
        if (*(_QWORD *)v62 != v54)
          objc_enumerationMutation(extensionMap);
        v53 += sub_1000BE664(*(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)n), -[NSMutableDictionary objectForKey:](self->extensionMap_, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)n)));
      }
      v52 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](extensionMap, "countByEnumeratingWithState:objects:count:", &v61, v103, 16);
    }
    while (v52);
  }
  return v53;
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
    v45.super_class = (Class)&OBJC_METACLASS___TransparencyGPBMessage;
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
    v32.super_class = (Class)&OBJC_METACLASS___TransparencyGPBMessage;
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
        v17 = (void **)sub_1000C51E4;
        v18 = &v36;
      }
      else
      {
        v35 = _NSConcreteStackBlock;
        v17 = (void **)sub_1000C5294;
        v18 = &v35;
      }
      v18[1] = (void **)3221225472;
      v18[2] = v17;
      v18[3] = (void **)&unk_10010BDC8;
      v18[4] = v12;
      v19 = imp_implementationWithBlock(v18);
      v20 = "getArray";
      goto LABEL_70;
    }
    if (v12[4] == v11)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000C5368;
      block[3] = &unk_10010BDE8;
      block[4] = v12;
      v19 = imp_implementationWithBlock(block);
      v20 = "setArray:";
      goto LABEL_70;
    }
    if (v12[5] == v11)
    {
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000C5378;
      v33[3] = &unk_10010BE08;
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
          v22 = &unk_10010BD88;
          v23 = sub_1000C5F3C;
          goto LABEL_69;
        case 1:
          v21 = &selRef_setFixed32_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BEE8;
          v23 = sub_1000C5F4C;
          goto LABEL_69;
        case 2:
          v21 = &selRef_setSFixed32_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BF08;
          v23 = sub_1000C5F5C;
          goto LABEL_69;
        case 3:
          v21 = &selRef_setFloat_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BF28;
          v23 = sub_1000C5F6C;
          goto LABEL_69;
        case 4:
          v21 = &selRef_setFixed64_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BF48;
          v23 = sub_1000C5F7C;
          goto LABEL_69;
        case 5:
          v21 = &selRef_setSFixed64_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BF68;
          v23 = sub_1000C5F8C;
          goto LABEL_69;
        case 6:
          v21 = &selRef_setDouble_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BF88;
          v23 = sub_1000C5F9C;
          goto LABEL_69;
        case 7:
          v21 = &selRef_setInt32_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BF08;
          v23 = sub_1000C5FAC;
          goto LABEL_69;
        case 8:
          v21 = &selRef_setInt64_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BF68;
          v23 = sub_1000C5FBC;
          goto LABEL_69;
        case 9:
          v21 = &selRef_setSInt32_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BF08;
          v23 = sub_1000C5FCC;
          goto LABEL_69;
        case 0xA:
          v21 = &selRef_setSInt64_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BF68;
          v23 = sub_1000C5FDC;
          goto LABEL_69;
        case 0xB:
          v21 = &selRef_setUInt32_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BEE8;
          v23 = sub_1000C5FEC;
          goto LABEL_69;
        case 0xC:
          v21 = &selRef_setUInt64_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BF48;
          v23 = sub_1000C5FFC;
          goto LABEL_69;
        case 0xD:
          v21 = &selRef_setBytes_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BDE8;
          v23 = sub_1000C600C;
          goto LABEL_69;
        case 0xE:
          v21 = &selRef_setString_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BDE8;
          v23 = sub_1000C6040;
          goto LABEL_69;
        case 0xF:
          v21 = &selRef_setMessage_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BDE8;
          v23 = sub_1000C6074;
          goto LABEL_69;
        case 0x10:
          v21 = &selRef_setGroup_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BDE8;
          v23 = sub_1000C6084;
          goto LABEL_69;
        case 0x11:
          v21 = &selRef_setEnum_;
          v46[0] = _NSConcreteStackBlock;
          v22 = &unk_10010BF08;
          v23 = sub_1000C6094;
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
      v40[2] = sub_1000C5130;
      v40[3] = &unk_10010BD68;
      v40[4] = vrev64_s32(v24);
      v19 = imp_implementationWithBlock(v40);
      v20 = "getBool";
      goto LABEL_70;
    }
    if (v12[6] == v11)
    {
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1000C5140;
      v39[3] = &unk_10010BD88;
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
      v37[2] = sub_1000C51D4;
      v37[3] = &unk_10010BDA8;
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
      v22 = &unk_10010BE28;
      v23 = sub_1000C5E1C;
      goto LABEL_69;
    case 1:
      v21 = &selRef_getFixed32;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BE48;
      v23 = sub_1000C5E2C;
      goto LABEL_69;
    case 2:
      v21 = &selRef_getSFixed32;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BE68;
      v23 = sub_1000C5E3C;
      goto LABEL_69;
    case 3:
      v21 = &selRef_getFloat;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BE88;
      v23 = sub_1000C5E4C;
      goto LABEL_69;
    case 4:
      v21 = &selRef_getFixed64;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BE08;
      v23 = sub_1000C5E5C;
      goto LABEL_69;
    case 5:
      v21 = &selRef_getSFixed64;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BEA8;
      v23 = sub_1000C5E6C;
      goto LABEL_69;
    case 6:
      v21 = &selRef_getDouble;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BEC8;
      v23 = sub_1000C5E7C;
      goto LABEL_69;
    case 7:
      v21 = &selRef_getInt32;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BE68;
      v23 = sub_1000C5E8C;
      goto LABEL_69;
    case 8:
      v21 = &selRef_getInt64;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BEA8;
      v23 = sub_1000C5E9C;
      goto LABEL_69;
    case 9:
      v21 = &selRef_getSInt32;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BE68;
      v23 = sub_1000C5EAC;
      goto LABEL_69;
    case 0xA:
      v21 = &selRef_getSInt64;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BEA8;
      v23 = sub_1000C5EBC;
      goto LABEL_69;
    case 0xB:
      v21 = &selRef_getUInt32;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BE48;
      v23 = sub_1000C5ECC;
      goto LABEL_69;
    case 0xC:
      v21 = &selRef_getUInt64;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BE08;
      v23 = sub_1000C5EDC;
      goto LABEL_69;
    case 0xD:
      v21 = &selRef_getBytes;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BDC8;
      v23 = sub_1000C5EEC;
      goto LABEL_69;
    case 0xE:
      v21 = &selRef_getString;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BDC8;
      v23 = sub_1000C5EFC;
      goto LABEL_69;
    case 0xF:
      v21 = &selRef_getMessage;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BDC8;
      v23 = sub_1000C5F0C;
      goto LABEL_69;
    case 0x10:
      v21 = &selRef_getGroup;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BDC8;
      v23 = sub_1000C5F1C;
      goto LABEL_69;
    case 0x11:
      v21 = &selRef_getEnum;
      v46[0] = _NSConcreteStackBlock;
      v22 = &unk_10010BE68;
      v23 = sub_1000C5F2C;
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
  v27 = sub_1000CA158(v20, 1);
  v28 = (objc_class *)objc_msgSend(v30, "messageClass");
  if (!class_addMethod(v28, name, v19, v27))
    return sub_1000CB344(v28, name);
  return v26;
}

+ (BOOL)resolveClassMethod:(SEL)a3
{
  objc_super v6;

  if ((sub_1000C6234((objc_class *)a1, a3) & 1) != 0)
    return 1;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___TransparencyGPBMessage;
  return objc_msgSendSuper2(&v6, "resolveClassMethod:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TransparencyGPBMessage)initWithCoder:(id)a3
{
  uint64_t v4;
  TransparencyGPBMessage *v5;
  id v6;

  v5 = -[TransparencyGPBMessage init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(NSData, v4), CFSTR("TransparencyGPBData"));
    if (objc_msgSend(v6, "length"))
      -[TransparencyGPBMessage mergeFromData:extensionRegistry:](v5, "mergeFromData:extensionRegistry:", v6, 0);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = -[TransparencyGPBMessage data](self, "data");
  if (objc_msgSend(v4, "length"))
    _objc_msgSend(a3, "encodeObject:forKey:", v4, CFSTR("TransparencyGPBData"));
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end
