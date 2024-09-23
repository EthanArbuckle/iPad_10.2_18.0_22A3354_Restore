@implementation TransparencyGPBDescriptor

+ (id)allocDescriptorForClass:(Class)a3 messageName:(id)a4 fileDescription:(TransparencyGPBFileDescription *)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9
{
  uint64_t v9;
  uint64_t v16;
  id v17;
  unsigned int v18;
  unsigned __int16 *v19;
  unsigned __int16 *v20;
  void *v21;
  TransparencyGPBFieldDescriptor *v22;
  id v23;
  id v25;
  unsigned int v26;

  v9 = *(_QWORD *)&a8;
  if (a9 >= 0x20)
    sub_100011E18();
  if (a7)
  {
    v25 = a4;
    v26 = v9;
    v16 = a7;
    v17 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a7);
    v18 = 0;
    v19 = (unsigned __int16 *)a6;
    do
    {
      v20 = v19 + 18;
      if ((a9 & 1) != 0)
      {
        v21 = v19;
      }
      else
      {
        v20 = (unsigned __int16 *)((char *)a6 + 28);
        v21 = a6;
      }
      v18 |= *v20;
      v22 = -[TransparencyGPBFieldDescriptor initWithFieldDescription:descriptorFlags:]([TransparencyGPBFieldDescriptor alloc], "initWithFieldDescription:descriptorFlags:", v21, a9);
      objc_msgSend(v17, "addObject:", v22);

      v19 += 20;
      a6 = (char *)a6 + 32;
      --v16;
    }
    while (v16);
    a4 = v25;
    if (v18 >= 0x2000)
      sub_100011E18();
    v9 = v26;
  }
  else
  {
    v17 = 0;
  }
  v23 = objc_msgSend(objc_alloc((Class)a1), "initWithClass:messageName:fileDescription:fields:storageSize:wireFormat:", a3, a4, a5, v17, v9, (a9 >> 1) & 1);

  return v23;
}

+ (id)allocDescriptorForClass:(Class)a3 file:(id)a4 fields:(void *)a5 fieldCount:(unsigned int)a6 storageSize:(unsigned int)a7 flags:(unsigned int)a8
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  unsigned int v13;
  unsigned int v14;
  _BOOL4 v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  id v22;
  uint64_t v24;
  id v25;
  objc_class *v26;

  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v12 = a4;
  if ((~a8 & 0x1C) != 0)
  {
    v25 = a1;
    v26 = a3;
    v13 = objc_msgSend(a4, "syntax");
    if ((_DWORD)v10)
    {
      v14 = v13;
      v16 = (a8 & 8) == 0 && v13 == 3;
      v17 = v10;
      v18 = (char *)a5 + 8;
      v19 = (char *)a5;
      do
      {
        if ((a8 & 1) != 0)
          v20 = v18;
        else
          v20 = v19;
        if ((a8 & 4) == 0 && v20[30] - 15 <= 1)
          *((_QWORD *)v20 + 1) = objc_getClass(*((const char **)v20 + 1));
        if (v16
          && (*((_WORD *)v20 + 14) & 0xF02) == 0
          && (*((_DWORD *)v20 + 5) & 0x80000000) == 0
          && v20[30] - 17 <= 0xFFFFFFFD)
        {
          *((_WORD *)v20 + 14) |= 0x20u;
        }
        if ((a8 & 0x10) == 0 && v20[30] == 17 && v14 != 3)
          *((_WORD *)v20 + 14) |= 0x1000u;
        v18 += 40;
        v19 += 32;
        --v17;
      }
      while (v17);
    }
    a8 |= 0x1Cu;
    v12 = a4;
    v9 = a7;
    a1 = v25;
    a3 = v26;
  }
  LODWORD(v24) = a8;
  v22 = objc_msgSend(a1, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", a3, 0, 0, a5, v10, v9, v24);
  objc_setAssociatedObject(v22, algn_10006C11A, v12, (void *)1);
  return v22;
}

+ (id)allocDescriptorForClass:(Class)a3 rootClass:(Class)a4 file:(id)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9
{
  return objc_msgSend(a1, "allocDescriptorForClass:file:fields:fieldCount:storageSize:flags:", a3, a5, a6, *(_QWORD *)&a7, *(_QWORD *)&a8, a9);
}

- (TransparencyGPBDescriptor)initWithClass:(Class)a3 messageName:(id)a4 fileDescription:(TransparencyGPBFileDescription *)a5 fields:(id)a6 storageSize:(unsigned int)a7 wireFormat:(BOOL)a8
{
  TransparencyGPBDescriptor *v14;
  TransparencyGPBDescriptor *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TransparencyGPBDescriptor;
  v14 = -[TransparencyGPBDescriptor init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    v14->messageClass_ = a3;
    v14->messageName_ = (NSString *)objc_msgSend(a4, "copy");
    v15->fileDescription_ = a5;
    v15->fields_ = (NSArray *)a6;
    v15->storageSize_ = a7;
    v15->wireFormat_ = a8;
  }
  return v15;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransparencyGPBDescriptor;
  -[TransparencyGPBDescriptor dealloc](&v3, "dealloc");
}

- (void)setupOneofs:(const char *)a3 count:(unsigned int)a4 firstHasIndex:(int)a5
{
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  const char *v10;
  NSArray *fields;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  TransparencyGPBOneofDescriptor *v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v7 = a4;
  v8 = (NSArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", a4);
  if (a4)
  {
    v9 = 0;
    do
    {
      v10 = a3[v9];
      fields = self->fields_;
      v12 = objc_alloc_init((Class)NSMutableArray);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(fields);
            if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16) + 8) + 20) == a5)
              objc_msgSend(v12, "addObject:");
            v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v14);
      }
      v17 = -[TransparencyGPBOneofDescriptor initWithName:fields:]([TransparencyGPBOneofDescriptor alloc], "initWithName:fields:", v10, v12);
      -[NSArray addObject:](v8, "addObject:", v17);

      ++v9;
      --a5;
    }
    while (v9 != v7);
  }
  self->oneofs_ = v8;
}

- (void)setupExtraTextInfo:(const char *)a3
{
  NSValue *v4;
  NSArray *fields;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (a3)
  {
    v4 = +[NSValue valueWithPointer:](NSValue, "valueWithPointer:");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    fields = self->fields_;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(fields);
          v10 = *(_QWORD **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9);
          if ((*(_WORD *)(v10[1] + 28) & 0x40) != 0)
            objc_setAssociatedObject(v10, &algn_10006C11A[1], v4, (void *)1);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
  }
}

- (void)setupExtensionRanges:(const TransparencyGPBExtensionRange *)a3 count:(int)a4
{
  self->extensionRanges_ = a3;
  self->extensionRangesCount_ = a4;
}

- (void)setupContainingMessageClass:(Class)a3
{
  objc_setAssociatedObject(self, &unk_10006C11C, a3, 0);
}

- (void)setupContainingMessageClassName:(const char *)a3
{
  Class Class;

  Class = objc_getClass(a3);
  -[TransparencyGPBDescriptor setupContainingMessageClass:](self, "setupContainingMessageClass:", Class);
}

- (void)setupMessageClassNameSuffix:(id)a3
{
  if (objc_msgSend(a3, "length"))
    objc_setAssociatedObject(self, &unk_10006C11D, a3, (void *)1);
}

- (NSString)name
{
  return NSStringFromClass(self->messageClass_);
}

- (TransparencyGPBFileDescriptor)file
{
  TransparencyGPBFileDescriptor *AssociatedObject;
  const TransparencyGPBFileDescription *fileDescription;
  const __CFString *v5;
  TransparencyGPBFileDescriptor *v6;

  objc_sync_enter(self);
  AssociatedObject = (TransparencyGPBFileDescriptor *)objc_getAssociatedObject(self, algn_10006C11A);
  if (!AssociatedObject)
  {
    fileDescription = self->fileDescription_;
    if (fileDescription->var0)
    {
      v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:");
      fileDescription = self->fileDescription_;
    }
    else
    {
      v5 = &stru_100072BF0;
    }
    if (fileDescription->var1)
      v6 = -[TransparencyGPBFileDescriptor initWithPackage:objcPrefix:syntax:]([TransparencyGPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", v5, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", self->fileDescription_->var1), self->fileDescription_->var2);
    else
      v6 = -[TransparencyGPBFileDescriptor initWithPackage:syntax:]([TransparencyGPBFileDescriptor alloc], "initWithPackage:syntax:", v5, self->fileDescription_->var2);
    AssociatedObject = v6;
    objc_setAssociatedObject(v6, algn_10006C11A, v6, (void *)1);
  }
  objc_sync_exit(self);
  return AssociatedObject;
}

- (TransparencyGPBDescriptor)containingType
{
  return (TransparencyGPBDescriptor *)objc_msgSend(objc_getAssociatedObject(self, &unk_10006C11C), "descriptor");
}

- (NSString)fullName
{
  TransparencyGPBDescriptor *v3;
  TransparencyGPBDescriptor *v4;
  NSString *messageName;
  NSString *v7;
  TransparencyGPBFileDescriptor *v8;
  NSString *v9;
  NSString *v10;
  id AssociatedObject;
  void *v12;
  id v13;
  void *v14;
  NSString *v15;
  NSString *v16;

  v3 = -[TransparencyGPBDescriptor containingType](self, "containingType");
  v4 = v3;
  messageName = self->messageName_;
  if (messageName)
  {
    if (v3)
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), -[TransparencyGPBDescriptor fullName](v3, "fullName"), self->messageName_);
    if (self->fileDescription_->var0)
      return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s.%@"), self->fileDescription_->var0, messageName);
    return messageName;
  }
  v7 = NSStringFromClass(-[TransparencyGPBDescriptor messageClass](self, "messageClass"));
  v8 = -[TransparencyGPBDescriptor file](self, "file");
  v9 = -[TransparencyGPBFileDescriptor objcPrefix](v8, "objcPrefix");
  if (v9 && !-[NSString hasPrefix:](v7, "hasPrefix:", v9))
    return 0;
  if (v4)
  {
    v10 = NSStringFromClass(-[TransparencyGPBDescriptor messageClass](v4, "messageClass"));
    AssociatedObject = objc_getAssociatedObject(v4, &unk_10006C11D);
    if (AssociatedObject)
    {
      v12 = AssociatedObject;
      if (!-[NSString hasSuffix:](v10, "hasSuffix:", AssociatedObject))
        return 0;
      v10 = -[NSString substringToIndex:](v10, "substringToIndex:", (_BYTE *)-[NSString length](v10, "length") - (_BYTE *)objc_msgSend(v12, "length"));
    }
    v9 = -[NSString stringByAppendingString:](v10, "stringByAppendingString:", CFSTR("_"));
    if (!-[NSString hasPrefix:](v7, "hasPrefix:", v9))
      return 0;
  }
  messageName = -[NSString substringFromIndex:](v7, "substringFromIndex:", -[NSString length](v9, "length"));
  v13 = objc_getAssociatedObject(self, &unk_10006C11D);
  if (!v13)
    goto LABEL_14;
  v14 = v13;
  if (!-[NSString hasSuffix:](messageName, "hasSuffix:", v13))
    return 0;
  messageName = -[NSString substringToIndex:](messageName, "substringToIndex:", (_BYTE *)-[NSString length](messageName, "length") - (_BYTE *)objc_msgSend(v14, "length"));
LABEL_14:
  if (v4)
    v15 = -[TransparencyGPBDescriptor fullName](v4, "fullName");
  else
    v15 = -[TransparencyGPBFileDescriptor package](v8, "package");
  v16 = v15;
  if (-[NSString length](v15, "length"))
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v16, messageName);
  return messageName;
}

- (id)fieldWithNumber:(unsigned int)a3
{
  NSArray *fields;
  id result;
  id v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  fields = self->fields_;
  result = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (result)
  {
    v6 = result;
    v7 = *(_QWORD *)v10;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v10 != v7)
        objc_enumerationMutation(fields);
      result = *(id *)(*((_QWORD *)&v9 + 1) + 8 * v8);
      if (*(_DWORD *)(*((_QWORD *)result + 1) + 16) == a3)
        break;
      if (v6 == (id)++v8)
      {
        result = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        v6 = result;
        if (result)
          goto LABEL_3;
        return result;
      }
    }
  }
  return result;
}

- (id)fieldWithName:(id)a3
{
  NSArray *fields;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  fields = self->fields_;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(fields);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend(objc_msgSend(v9, "name"), "isEqual:", a3) & 1) != 0)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (id)oneofWithName:(id)a3
{
  NSArray *oneofs;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  oneofs = self->oneofs_;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](oneofs, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(oneofs);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend(objc_msgSend(v9, "name"), "isEqual:", a3) & 1) != 0)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](oneofs, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (Class)messageClass
{
  return self->messageClass_;
}

- (NSArray)fields
{
  return self->fields_;
}

- (NSArray)oneofs
{
  return self->oneofs_;
}

- (const)extensionRanges
{
  return self->extensionRanges_;
}

- (unsigned)extensionRangesCount
{
  return self->extensionRangesCount_;
}

- (BOOL)isWireFormat
{
  return self->wireFormat_;
}

@end
