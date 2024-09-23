@implementation VMUFieldInfo

- (NSArray)subFieldArray
{
  return (NSArray *)self->_subFieldArray;
}

- (NSArray)possibleEnumPayloadFieldArray
{
  return self->_possibleEnumPayloadFieldArray;
}

- (void)initializeSubFieldArray
{
  NSMutableArray *v3;
  NSMutableArray *subFieldArray;

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  subFieldArray = self->_subFieldArray;
  self->_subFieldArray = v3;

}

- (unint64_t)hash
{
  return -[NSString hash](self->_ivarName, "hash") ^ self->_flags ^ (self->_offset << self->_scanType);
}

- (BOOL)isEqual:(id)a3
{
  NSString *ivarName;
  int v6;
  NSString *typeName;
  VMUClassInfo *destinationLayout;
  NSMutableArray *subFieldArray;
  NSArray *possibleEnumPayloadFieldArray;

  if (self == a3)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && self->_offset == *((_DWORD *)a3 + 7)
      && self->_scanType == *((_DWORD *)a3 + 6)
      && self->_flags == *((_DWORD *)a3 + 11)
      && self->_size == *((_DWORD *)a3 + 8)
      && self->_scannable == *((_DWORD *)a3 + 9)
      && self->_stride == *((_DWORD *)a3 + 10))
    {
      ivarName = self->_ivarName;
      if (ivarName == *((NSString **)a3 + 1) || (v6 = -[NSString isEqualToString:](ivarName, "isEqualToString:")) != 0)
      {
        typeName = self->_typeName;
        if (typeName == *((NSString **)a3 + 2)
          || (v6 = -[NSString isEqualToString:](typeName, "isEqualToString:")) != 0)
        {
          destinationLayout = self->_destinationLayout;
          if (destinationLayout == *((VMUClassInfo **)a3 + 6)
            || (v6 = -[VMUClassInfo isEqual:](destinationLayout, "isEqual:")) != 0)
          {
            subFieldArray = self->_subFieldArray;
            if (subFieldArray == *((NSMutableArray **)a3 + 7)
              || (v6 = -[NSMutableArray isEqual:](subFieldArray, "isEqual:")) != 0)
            {
              possibleEnumPayloadFieldArray = self->_possibleEnumPayloadFieldArray;
              if (possibleEnumPayloadFieldArray == *((NSArray **)a3 + 8)
                || (v6 = -[NSArray isEqual:](possibleEnumPayloadFieldArray, "isEqual:")) != 0)
              {
                LOBYTE(v6) = 1;
              }
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (NSString)typedDescription
{
  NSString *typeName;
  NSString *v4;

  typeName = self->_typeName;
  if (typeName)
  {
    descriptionForTypeEncoding((unsigned __int8 *)-[NSString UTF8String](typeName, "UTF8String"), (uint64_t)-[NSString UTF8String](self->_ivarName, "UTF8String"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = self->_ivarName;
  }
  return v4;
}

- (id)mutableCopy
{
  VMUMutableFieldInfo *v3;
  id *v4;
  uint64_t v6;

  v3 = [VMUMutableFieldInfo alloc];
  LODWORD(v6) = self->_stride;
  v4 = -[VMUFieldInfo initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:](v3, "initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:", self->_ivarName, 0, 0, self->_scanType, self->_offset, self->_size, v6, self->_subFieldArray, self->_swiftTyperef);
  objc_msgSend(v4, "setTypeName:", self->_typeName);
  objc_msgSend(v4, "setDestinationLayout:", self->_destinationLayout);
  objc_msgSend(v4, "setScannableSize:", self->_scannable);
  objc_msgSend(v4, "setFlags:", self->_flags);
  objc_storeStrong(v4 + 8, self->_possibleEnumPayloadFieldArray);
  return v4;
}

- (VMUFieldInfo)initWithObjcIvar:(objc_ivar *)a3 size:(unsigned int)a4 offset:(unsigned int)a5 ivarName:(const char *)a6 isARC:(BOOL)a7 is64Bit:(BOOL)a8
{
  _BOOL4 v9;
  uint64_t v12;
  VMUFieldInfo *v14;
  VMUFieldInfo *v15;
  uint64_t v16;
  NSString *ivarName;
  unsigned __int8 *TypeEncoding;
  uint64_t v19;
  NSString *typeName;
  unsigned int v21;
  unsigned int scannable;
  int v23;
  char v25;
  objc_super v26;

  v9 = a7;
  v12 = *(_QWORD *)&a4;
  v26.receiver = self;
  v26.super_class = (Class)VMUFieldInfo;
  v14 = -[VMUFieldInfo init](&v26, sel_init);
  v15 = v14;
  if (!v14)
    return v15;
  if (a6)
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", a6);
    ivarName = v15->_ivarName;
    v15->_ivarName = (NSString *)v16;
  }
  else
  {
    ivarName = v14->_ivarName;
    v14->_ivarName = 0;
  }

  TypeEncoding = (unsigned __int8 *)ivar_getTypeEncoding(a3);
  if (TypeEncoding)
  {
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", TypeEncoding);
    typeName = v15->_typeName;
    v15->_typeName = (NSString *)v19;
  }
  else
  {
    typeName = v15->_typeName;
    v15->_typeName = 0;
  }

  v15->_offset = a5;
  v15->_size = v12;
  v25 = 63;
  v21 = pointerScanSizeForTypeEncoding(TypeEncoding, v12, a8, (uint64_t)&v25);
  v15->_scannable = v21;
  if (!v21)
  {
    v15->_stride = v12;
LABEL_16:
    v15->_scanType = 0;
    return v15;
  }
  if (typeEncodingDescribesReferencedAllocation((uint64_t)TypeEncoding))
    v15->_flags |= 0x10u;
  scannable = v15->_scannable;
  v15->_stride = v12;
  if (scannable <= 7)
    goto LABEL_16;
  if (v9 && v25 == 64)
    v23 = 8;
  else
    v23 = 1;
  v15->_scanType = v23;
  return v15;
}

- (VMUFieldInfo)initWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 subFieldArray:(id)a10 swiftTyperef:(void *)a11
{
  uint64_t v11;
  uint64_t v14;
  id v17;
  id v18;
  id v19;
  VMUFieldInfo *v20;
  _OWORD *v21;
  uint64_t v22;
  NSString *ivarName;
  uint64_t v24;
  NSString *typeName;
  unsigned __int8 *v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  NSMutableArray *subFieldArray;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  NSMutableArray *v36;
  void *v37;
  _OWORD *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  char v44;
  objc_super v45;
  _BYTE v46[128];
  uint64_t v47;

  v11 = *(_QWORD *)&a8;
  v14 = *(_QWORD *)&a5;
  v47 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a10;
  v45.receiver = self;
  v45.super_class = (Class)VMUFieldInfo;
  v20 = -[VMUFieldInfo init](&v45, sel_init);
  if (v20)
  {
    v21 = a11;
    v22 = objc_msgSend(v17, "copy");
    ivarName = v20->_ivarName;
    v20->_ivarName = (NSString *)v22;

    v24 = objc_msgSend(v18, "copy");
    typeName = v20->_typeName;
    v20->_typeName = (NSString *)v24;

    -[VMUFieldInfo _setKind:](v20, "_setKind:", v14);
    v20->_scanType = a6;
    v20->_offset = a7;
    v20->_size = v11;
    if (objc_msgSend(v18, "length"))
    {
      v44 = 63;
      v26 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String");
      v27 = pointerScanSizeForTypeEncoding(v26, v11, 1, (uint64_t)&v44);
      v20->_scannable = v27;
      if (v27 && typeEncodingDescribesReferencedAllocation((uint64_t)v26))
        v20->_flags |= 0x10u;
    }
    else
    {
      if (v11 >= 8)
        v28 = v11;
      else
        v28 = 0;
      v20->_scannable = v28;
    }
    v20->_stride = a9;
    if (v19)
    {
      v29 = objc_opt_new();
      subFieldArray = v20->_subFieldArray;
      v20->_subFieldArray = (NSMutableArray *)v29;

      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v31 = v19;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v41 != v34)
              objc_enumerationMutation(v31);
            v36 = v20->_subFieldArray;
            v37 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "mutableCopy");
            -[NSMutableArray addObject:](v36, "addObject:", v37);

          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        }
        while (v33);
      }

      v21 = a11;
    }
    if (v21)
    {
      v38 = malloc_type_calloc(1uLL, 0x10uLL, 0x1000040D9A13B51uLL);
      v20->_swiftTyperef = v38;
      *v38 = *v21;
    }
  }

  return v20;
}

- (void)dealloc
{
  void *swiftTyperef;
  objc_super v4;

  swiftTyperef = self->_swiftTyperef;
  if (swiftTyperef)
  {
    free(swiftTyperef);
    self->_swiftTyperef = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)VMUFieldInfo;
  -[VMUFieldInfo dealloc](&v4, sel_dealloc);
}

- (id)initSwiftEnumPayloadFieldWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 possibleEnumSubFieldArray:(id)a10 swiftTyperef:(void *)a11
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  VMUFieldInfo *v18;
  VMUFieldInfo *v19;
  uint64_t v21;
  id v22;

  v11 = *(_QWORD *)&a8;
  v12 = *(_QWORD *)&a7;
  v13 = *(_QWORD *)&a6;
  v14 = *(_QWORD *)&a5;
  v22 = a10;
  LODWORD(v21) = a9;
  v18 = -[VMUFieldInfo initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:](self, "initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:", a3, a4, v14, v13, v12, v11, v21, 0, a11);
  v19 = v18;
  if (v18)
    objc_storeStrong((id *)&v18->_possibleEnumPayloadFieldArray, a10);

  return v19;
}

- (id)initStorageInfoFieldWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 subFieldArray:(id)a10
{
  id result;
  uint64_t v11;

  LODWORD(v11) = a9;
  result = -[VMUFieldInfo initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:](self, "initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, v11, a10, 0);
  if (result)
    *((_DWORD *)result + 11) |= 4u;
  return result;
}

- (id)initStorageEntryFieldWithName:(id)a3 type:(id)a4 kind:(unsigned int)a5 scan:(unsigned int)a6 offset:(unsigned int)a7 size:(unsigned int)a8 stride:(unsigned int)a9 subFieldArray:(id)a10
{
  id result;
  uint64_t v11;

  LODWORD(v11) = a9;
  result = -[VMUFieldInfo initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:](self, "initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:", a3, a4, *(_QWORD *)&a5, *(_QWORD *)&a6, *(_QWORD *)&a7, *(_QWORD *)&a8, v11, a10, 0);
  if (result)
    *((_DWORD *)result + 11) |= 8u;
  return result;
}

- (VMUFieldInfo)initWithName:(id)a3 type:(id)a4 scan:(unsigned int)a5 offset:(unsigned int)a6 size:(unsigned int)a7
{
  uint64_t v8;

  LODWORD(v8) = a7;
  return -[VMUFieldInfo initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:](self, "initWithName:type:kind:scan:offset:size:stride:subFieldArray:swiftTyperef:", a3, a4, 0, *(_QWORD *)&a5, *(_QWORD *)&a6, v8, 0, 0);
}

- (VMUFieldInfo)initWithSerializer:(id)a3 classMap:(id)a4 version:(unsigned int)a5 error:(id *)a6
{
  return -[VMUFieldInfo initWithSerializer:classMap:version:returnedDestinationLayoutClassInfoIndex:error:](self, "initWithSerializer:classMap:version:returnedDestinationLayoutClassInfoIndex:error:", a3, a4, *(_QWORD *)&a5, 0, a6);
}

- (VMUFieldInfo)initWithSerializer:(id)a3 classMap:(id)a4 version:(unsigned int)a5 returnedDestinationLayoutClassInfoIndex:(unsigned int *)a6 error:(id *)a7
{
  id v12;
  id v13;
  VMUFieldInfo *v14;
  unsigned int *v15;
  uint64_t v16;
  id v17;
  VMUFieldInfo *v18;
  unsigned int *v19;
  unsigned int v20;
  uint64_t v21;
  NSString *ivarName;
  uint64_t v23;
  NSString *typeName;
  int v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v32;
  objc_super v33;
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v33.receiver = self;
  v33.super_class = (Class)VMUFieldInfo;
  v14 = -[VMUFieldInfo init](&v33, sel_init);
  if (!v14)
    goto LABEL_31;
  v32 = 0;
  if (!a7)
    a7 = (id *)&v32;
  v15 = (unsigned int *)objc_msgSend(v12, "_deserializeValues:error:", 2, a7);
  if (*a7)
    goto LABEL_9;
  v14->_offset = *v15;
  v14->_size = v15[1];
  if (*a7)
    goto LABEL_9;
  v34[0] = &v14->_scanType;
  v34[1] = &v14->_flags;
  v34[2] = &v14->_scannable;
  v16 = objc_msgSend(v12, "_deserializeValues:error:", 3, a7);
  v17 = *a7;
  if (*a7)
    goto LABEL_9;
  do
  {
    *(_DWORD *)v34[(_QWORD)v17] = *(_DWORD *)(v16 + 4 * (_QWORD)v17);
    v17 = (char *)v17 + 1;
  }
  while (v17 != (id)3);
  if (*a7)
    goto LABEL_9;
  if (a5 >= 4)
  {
    v19 = (unsigned int *)objc_msgSend(v12, "_deserializeValues:error:", 1, a7);
    if (*a7)
      goto LABEL_9;
    v14->_stride = *v19;
    if (*a7)
      goto LABEL_9;
  }
  v20 = objc_msgSend(v12, "deserialize32WithError:", a7);
  if (*a7)
    goto LABEL_9;
  if (a6)
    *a6 = v20;
  v21 = objc_msgSend(v12, "copyDeserializedStringWithError:", a7);
  ivarName = v14->_ivarName;
  v14->_ivarName = (NSString *)v21;

  if (*a7)
    goto LABEL_9;
  v23 = objc_msgSend(v12, "copyDeserializedStringWithError:", a7);
  typeName = v14->_typeName;
  v14->_typeName = (NSString *)v23;

  if (*a7)
    goto LABEL_9;
  if (a5 < 4)
  {
LABEL_31:
    v18 = v14;
    goto LABEL_32;
  }
  v25 = objc_msgSend(v12, "deserialize32WithError:", a7);
  if (!*a7)
  {
    v26 = v25;
    if (v25)
    {
      v27 = (void *)objc_opt_new();
      do
      {
        v28 = objc_msgSend(v12, "deserialize32WithError:", a7);
        if (*a7)
        {

          goto LABEL_9;
        }
        objc_msgSend(v13, "fieldInfoForIndex:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
          objc_msgSend(v27, "addObject:", v29);
        else
          NSLog(CFSTR("Bad field index in document"));

        --v26;
      }
      while (v26);
      if (objc_msgSend(v27, "count"))
        v30 = v27;
      else
        v30 = 0;
      objc_storeStrong((id *)&v14->_subFieldArray, v30);

    }
    goto LABEL_31;
  }
LABEL_9:
  v18 = 0;
LABEL_32:

  return v18;
}

- (void)serializeWithClassMap:(id)a3 simpleSerializer:(id)a4 version:(unsigned int)a5
{
  id v7;
  id v8;
  unsigned int flags;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  unsigned int stride;
  _BYTE v20[132];
  _DWORD v21[3];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v22[0] = *(_QWORD *)&self->_offset;
  objc_msgSend(v8, "_serializeValues:count:", v22, 2);
  flags = self->_flags;
  v21[0] = self->_scanType;
  v21[1] = flags;
  v21[2] = self->_scannable;
  objc_msgSend(v8, "_serializeValues:count:", v21, 3);
  stride = self->_stride;
  objc_msgSend(v8, "_serializeValues:count:", &stride, 1);
  objc_msgSend(v8, "serialize32:", objc_msgSend(v7, "indexForClassInfo:", self->_destinationLayout));
  objc_msgSend(v8, "serializeString:", self->_ivarName);
  objc_msgSend(v8, "serializeString:", self->_typeName);
  objc_msgSend(v8, "serialize32:", -[NSMutableArray count](self->_subFieldArray, "count"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_subFieldArray;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(v8, "serialize32:", objc_msgSend(v7, "indexForFieldInfo:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++), (_QWORD)v15));
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v12);
  }

}

- (id)getLeafFieldAtOffset:(unsigned int)a3 leafOffset:(unsigned int *)a4
{
  NSMutableArray *subFieldArray;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  VMUFieldInfo *v15;
  id v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _DWORD v23[32];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  subFieldArray = self->_subFieldArray;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = subFieldArray;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
      v14 = objc_msgSend(v13, "offset", (_QWORD)v19);
      if (objc_msgSend(v13, "size") + v14 > a3)
        break;
      if (v10 == ++v12)
      {
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          goto LABEL_3;
        goto LABEL_11;
      }
    }
    if (v14 > a3)
      goto LABEL_11;
    v17 = v13;

    if (v17)
    {
      v23[0] = 0;
      objc_msgSend(v17, "getLeafFieldAtOffset:leafOffset:", a3 - objc_msgSend(v17, "offset"), v23);
      v15 = (VMUFieldInfo *)objc_claimAutoreleasedReturnValue();
      if (a4)
      {
        v18 = objc_msgSend(v17, "offset");
        *a4 = v23[0] + v18;
      }

      return v15;
    }
  }
  else
  {
LABEL_11:

  }
  if (a4)
    *a4 = 0;
  v15 = self;
  return v15;
}

- (id)_fullIvarNameAtOffset:(unsigned int)a3 leafOffset:(unsigned int *)a4 depth:(unsigned int)a5
{
  uint64_t v7;
  NSMutableArray *subFieldArray;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  NSString *v18;
  NSString *v19;
  id v20;
  void *v21;
  int v22;
  NSString *v23;
  NSString *ivarName;
  NSString *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _DWORD v30[32];
  uint64_t v31;

  v7 = *(_QWORD *)&a3;
  v31 = *MEMORY[0x1E0C80C00];
  if (_fullIvarNameAtOffset_leafOffset_depth__onceToken != -1)
    dispatch_once(&_fullIvarNameAtOffset_leafOffset_depth__onceToken, &__block_literal_global_12);
  subFieldArray = self->_subFieldArray;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = subFieldArray;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
LABEL_5:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v14);
      v16 = objc_msgSend(v15, "offset");
      if (objc_msgSend(v15, "size") + v16 > v7)
        break;
      if (v12 == ++v14)
      {
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v12)
          goto LABEL_5;
        goto LABEL_13;
      }
    }
    if (v16 > v7)
      goto LABEL_13;
    v20 = v15;

    if (v20)
    {
      v30[0] = 0;
      objc_msgSend(v20, "_fullIvarNameAtOffset:leafOffset:depth:", v7 - objc_msgSend(v20, "offset"), v30, a5 + 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4)
      {
        v22 = objc_msgSend(v20, "offset");
        *a4 = v30[0] + v22;
      }
      if (a5 && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", CFSTR("some")))
      {
        v23 = v21;
      }
      else if (v21
             && objc_msgSend(v21, "length")
             && !objc_msgSend((id)_fullIvarNameAtOffset_leafOffset_depth__internalPartialIvarNames, "containsObject:", v21))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), self->_ivarName, v21, (_QWORD)v26);
        v23 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        ivarName = self->_ivarName;
        if ((_DWORD)v7)
        {
          -[NSString stringByAppendingFormat:](ivarName, "stringByAppendingFormat:", CFSTR(" + %u"), v7);
          v23 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v23 = ivarName;
        }
      }
      v25 = v23;

      return v25;
    }
  }
  else
  {
LABEL_13:

  }
  if (a4)
    *a4 = 0;
  if (a5
    && (objc_msgSend((id)_fullIvarNameAtOffset_leafOffset_depth__internalPartialIvarNames, "containsObject:", self->_ivarName) & 1) != 0)
  {
    return 0;
  }
  v18 = self->_ivarName;
  if ((_DWORD)v7)
  {
    -[NSString stringByAppendingFormat:](v18, "stringByAppendingFormat:", CFSTR(" + %u"), v7);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v18;
  }
  return v19;
}

void __55__VMUFieldInfo__fullIvarNameAtOffset_leafOffset_depth___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_guts"), CFSTR("_object"), CFSTR("_otherBits"), CFSTR("_rawValue"), CFSTR("rawValue"), CFSTR("_value"), CFSTR("_variantBuffer"), CFSTR("_storage"), CFSTR("_buffer"), CFSTR("object"), CFSTR("some"), CFSTR("native"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_fullIvarNameAtOffset_leafOffset_depth__internalPartialIvarNames;
  _fullIvarNameAtOffset_leafOffset_depth__internalPartialIvarNames = v0;

}

- (id)fullIvarNameAtOffset:(unsigned int)a3
{
  int v4;

  v4 = 0;
  -[VMUFieldInfo _fullIvarNameAtOffset:leafOffset:depth:](self, "_fullIvarNameAtOffset:leafOffset:depth:", *(_QWORD *)&a3, &v4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_setIvarName:(id)a3
{
  NSString *v4;
  NSString *ivarName;

  if (self->_ivarName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    ivarName = self->_ivarName;
    self->_ivarName = v4;

  }
}

- (void)setTypeName:(id)a3
{
  NSString *v4;
  NSString *typeName;

  if (self->_typeName != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    typeName = self->_typeName;
    self->_typeName = v4;

  }
}

- (void)_setScanType:(unsigned int)a3
{
  self->_scanType = a3;
}

- (void)_setOffset:(unsigned int)a3
{
  self->_offset = a3;
}

- (void)_setSize:(unsigned int)a3
{
  unsigned int scannable;

  scannable = self->_scannable;
  if (scannable >= a3)
    scannable = a3;
  self->_size = a3;
  self->_scannable = scannable;
}

- (void)_setFlags:(unsigned int)a3
{
  VMUClassInfo *v4;
  VMUClassInfo *destinationLayout;

  self->_flags = a3;
  if ((a3 & 2) != 0)
  {
    +[VMUClassInfo _genericBlockByrefInfo](VMUClassInfo, "_genericBlockByrefInfo");
    v4 = (VMUClassInfo *)objc_claimAutoreleasedReturnValue();
    destinationLayout = self->_destinationLayout;
    self->_destinationLayout = v4;

  }
}

- (unsigned)bitfieldWidth
{
  NSString *typeName;
  uint64_t v3;

  typeName = self->_typeName;
  if (typeName)
  {
    v3 = -[NSString UTF8String](typeName, "UTF8String");
    if (*(_BYTE *)v3 == 98)
      LODWORD(typeName) = strtol((const char *)(v3 + 1), 0, 10);
    else
      LODWORD(typeName) = 0;
  }
  return typeName;
}

- (BOOL)isCapture
{
  return self->_flags & 1;
}

- (BOOL)isByref
{
  return (LOBYTE(self->_flags) >> 1) & 1;
}

- (BOOL)isStorageImplPointer
{
  return (self->_flags & 4) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoTypeStorageImplPointer);
}

- (BOOL)isArraySize
{
  return (self->_flags & 4) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoTypeArraySize);
}

- (BOOL)isArrayEntries
{
  return (self->_flags & 4) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoTypeArrayEntries);
}

- (BOOL)isStorageBitmapPointer
{
  return (self->_flags & 4) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoTypeBitmapPointer);
}

- (BOOL)isKeysPointer
{
  return (self->_flags & 4) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoTypeKeysPointer);
}

- (BOOL)isValuesPointer
{
  return (self->_flags & 4) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoTypeValuesPointer);
}

- (BOOL)isKeyField
{
  return (self->_flags & 8) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoEntryKeyField);
}

- (BOOL)isValueField
{
  return (self->_flags & 8) != 0
      && -[NSString isEqualToString:](self->_ivarName, "isEqualToString:", storageInfoEntryValueField);
}

- (BOOL)typeNameMayDescribeReferencedAllocation
{
  return (LOBYTE(self->_flags) >> 4) & 1;
}

- (void)_setKind:(unsigned int)a3
{
  self->_flags = self->_flags & 0xFFFFFFF | (a3 << 28);
}

- (void)enumerateSublayoutsForSize:(int)a3 parentOffset:(unsigned int)a4 remotePointerSize:(uint64_t)a5 withBlock:
{
  void *v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  id v22;
  int v23;
  int v24;
  unsigned int v27;
  unsigned int v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if ((v7 = *(void **)(a1 + 56)) != 0 && objc_msgSend(v7, "count") || *(_QWORD *)(a1 + 48))
    {
      v8 = *(_DWORD *)(a1 + 28) + a3;
      v24 = a4 + v8 - 1;
      v9 = v24 & -a4;
      v27 = v8;
      v10 = v8 + *(_DWORD *)(a1 + 36);
      if (v10 >= a2)
        v10 = a2;
      v11 = v9 + a4;
      v28 = v10;
      while (v11 <= v10)
      {
        v12 = *(void **)(a1 + 56);
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v14)
        {
          v15 = v14;
          v16 = v9 - v27;
          v17 = *(_QWORD *)v31;
LABEL_11:
          v18 = 0;
          while (1)
          {
            if (*(_QWORD *)v31 != v17)
              objc_enumerationMutation(v13);
            v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v18);
            v20 = objc_msgSend(v19, "offset");
            if (objc_msgSend(v19, "size") + v20 > v16)
              break;
            if (v15 == ++v18)
            {
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
              if (v15)
                goto LABEL_11;
              goto LABEL_19;
            }
          }
          if (v20 > v16)
            goto LABEL_19;
          v22 = v19;

          if (v22)
          {
            -[VMUFieldInfo enumerateSublayoutsForSize:parentOffset:remotePointerSize:withBlock:](v22, a2, v27, a4, a5);
            v23 = objc_msgSend(v22, "offset");
            v11 = (v24 + v23 + objc_msgSend(v22, "size")) & -a4;

            goto LABEL_24;
          }
        }
        else
        {
LABEL_19:

        }
        v21 = *(_QWORD *)(a1 + 48);
        if (v21)
          (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a5 + 16))(a5, v21, v9, *(unsigned int *)(a1 + 24));
LABEL_24:
        v9 = v11;
        v11 = v11 + a4;
        v10 = v28;
      }
    }
  }
}

- (unsigned)kind
{
  return self->_flags >> 28;
}

- (void)_setScannableSize:(unsigned int)a3
{
  self->_scannable = a3;
}

- (void)_setStride:(unsigned int)a3
{
  self->_stride = a3;
}

- (void)setDestinationLayout:(id)a3
{
  VMUClassInfo *v5;
  VMUClassInfo **p_destinationLayout;
  VMUClassInfo *destinationLayout;
  VMUClassInfo *v8;

  v5 = (VMUClassInfo *)a3;
  destinationLayout = self->_destinationLayout;
  p_destinationLayout = &self->_destinationLayout;
  if (destinationLayout != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_destinationLayout, a3);
    v5 = v8;
  }

}

- (VMUClassInfo)destinationLayout
{
  if ((self->_flags & 2) == 0)
    return self->_destinationLayout;
  +[VMUClassInfo _genericBlockByrefInfo](VMUClassInfo, "_genericBlockByrefInfo");
  return (VMUClassInfo *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)descriptionOfFieldValueInObjectMemory:(void *)a3 scanner:(id)a4
{
  char *v5;
  NSString *typeName;
  id v7;
  void *v8;

  v5 = (char *)a3 + self->_offset;
  typeName = self->_typeName;
  v7 = a4;
  descriptionOfValueAtAddressWithTypeEncoding((uint64_t)v5, (unsigned __int8 *)-[NSString UTF8String](typeName, "UTF8String"), self->_size, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)description
{
  VMUClassInfo *destinationLayout;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  destinationLayout = self->_destinationLayout;
  if (destinationLayout)
  {
    -[VMUClassInfo className](destinationLayout, "className");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E4E04720;
  }
  v10.receiver = self;
  v10.super_class = (Class)VMUFieldInfo;
  -[VMUFieldInfo description](&v10, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VMUFieldInfo offset](self, "offset");
  -[VMUFieldInfo typedDescription](self, "typedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("%+3d \"%@\" size %u (%s)  %@"), v6, v7, -[VMUFieldInfo size](self, "size"), VMUScanTypeScanDescription(-[VMUFieldInfo scanType](self, "scanType")), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)ivarName
{
  return self->_ivarName;
}

- (NSString)typeName
{
  return self->_typeName;
}

- (unsigned)scanType
{
  return self->_scanType;
}

- (unsigned)offset
{
  return self->_offset;
}

- (unsigned)size
{
  return self->_size;
}

- (unsigned)scannableSize
{
  return self->_scannable;
}

- (unsigned)stride
{
  return self->_stride;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)swiftTyperef
{
  return self->_swiftTyperef;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possibleEnumPayloadFieldArray, 0);
  objc_storeStrong((id *)&self->_subFieldArray, 0);
  objc_storeStrong((id *)&self->_destinationLayout, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
  objc_storeStrong((id *)&self->_ivarName, 0);
}

@end
