@implementation TRIPBDescriptor

- (TRIPBFileDescriptor)file
{
  return self->file_;
}

- (Class)messageClass
{
  return self->messageClass_;
}

- (void)setupOneofs:(const char *)a3 count:(unsigned int)a4 firstHasIndex:(int)a5
{
  uint64_t v5;
  uint64_t v7;
  NSArray *v8;
  uint64_t v9;
  const char *v10;
  NSArray *fields;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  TRIPBOneofDescriptor *v17;
  void *v18;
  void *v19;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v5 = *(_QWORD *)&a5;
  v27 = *MEMORY[0x1E0C80C00];
  if ((a5 & 0x80000000) == 0)
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TRIPBDescriptor setupOneofs:count:firstHasIndex:]"), CFSTR("TRIPBDescriptor.m"), 187, CFSTR("Should always be <0"));
  }
  v7 = a4;
  v8 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", a4);
  if (a4)
  {
    v9 = 0;
    do
    {
      v10 = a3[v9];
      fields = self->fields_;
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v22 = 0u;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v23;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(fields);
            if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v16) + 8) + 20) == (_DWORD)v5)
              objc_msgSend(v12, "addObject:");
            ++v16;
          }
          while (v14 != v16);
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v14);
      }
      if (!objc_msgSend(v12, "count"))
      {
        v18 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[TRIPBDescriptor setupOneofs:count:firstHasIndex:]"), CFSTR("TRIPBDescriptor.m"), 193, CFSTR("No fields for this oneof? (%s:%d)"), v10, v5);
      }
      v17 = -[TRIPBOneofDescriptor initWithName:fields:]([TRIPBOneofDescriptor alloc], "initWithName:fields:", v10, v12);
      -[NSArray addObject:](v8, "addObject:", v17);

      ++v9;
      v5 = (v5 - 1);
    }
    while (v9 != v7);
  }
  self->oneofs_ = v8;
}

+ (id)allocDescriptorForClass:(Class)a3 rootClass:(Class)a4 file:(id)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  TRIPBFieldDescriptor *v17;
  void *v18;

  LODWORD(v9) = a7;
  v11 = objc_msgSend(a5, "syntax", a3, a4);
  if ((_DWORD)v9)
  {
    v12 = v11;
    v13 = 0;
    v14 = v9;
    v15 = (char *)a6;
    v9 = v9;
    do
    {
      if (!v13)
        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v14);
      if ((a9 & 1) != 0)
        v16 = a6;
      else
        v16 = v15;
      v17 = -[TRIPBFieldDescriptor initWithFieldDescription:includesDefault:syntax:]([TRIPBFieldDescriptor alloc], "initWithFieldDescription:includesDefault:syntax:", v16, a9 & 1, v12);
      objc_msgSend(v13, "addObject:", v17);

      v15 += 32;
      a6 = (char *)a6 + 40;
      --v9;
    }
    while (v9);
  }
  else
  {
    v13 = 0;
  }
  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClass:file:fields:storageSize:wireFormat:", a3, a5, v13, a8, (a9 >> 1) & 1);

  return v18;
}

- (TRIPBDescriptor)initWithClass:(Class)a3 file:(id)a4 fields:(id)a5 storageSize:(unsigned int)a6 wireFormat:(BOOL)a7
{
  TRIPBDescriptor *v12;
  TRIPBDescriptor *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)TRIPBDescriptor;
  v12 = -[TRIPBDescriptor init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->messageClass_ = a3;
    v12->file_ = (TRIPBFileDescriptor *)a4;
    v12->fields_ = (NSArray *)a5;
    v13->storageSize_ = a6;
    v13->wireFormat_ = a7;
  }
  return v13;
}

- (NSArray)fields
{
  return self->fields_;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIPBDescriptor;
  -[TRIPBDescriptor dealloc](&v3, sel_dealloc);
}

- (void)setupExtraTextInfo:(const char *)a3
{
  void *v4;
  NSArray *fields;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:");
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
          v10 = *(_QWORD **)(*((_QWORD *)&v11 + 1) + 8 * v9);
          if ((*(_WORD *)(v10[1] + 28) & 0x40) != 0)
            objc_setAssociatedObject(v10, &kTextFormatExtraValueKey, v4, (void *)1);
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
  }
}

- (void)setupExtensionRanges:(const TRIPBExtensionRange *)a3 count:(int)a4
{
  self->extensionRanges_ = a3;
  self->extensionRangesCount_ = a4;
}

- (void)setupContainingMessageClassName:(const char *)a3
{
  if (!objc_getClass(a3))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBDescriptor.m"), 226, CFSTR("Class %s not defined"), a3);
  objc_setAssociatedObject(self, &kParentClassNameValueKey, (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", a3), (void *)1);
}

- (void)setupMessageClassNameSuffix:(id)a3
{
  if (objc_msgSend(a3, "length"))
    objc_setAssociatedObject(self, &kClassNameSuffixKey, a3, (void *)1);
}

- (NSString)name
{
  return NSStringFromClass(self->messageClass_);
}

- (TRIPBDescriptor)containingType
{
  TRIPBDescriptor *result;
  const char *v5;
  Class Class;

  result = (TRIPBDescriptor *)objc_getAssociatedObject(self, &kParentClassNameValueKey);
  if (result)
  {
    v5 = (const char *)-[TRIPBDescriptor pointerValue](result, "pointerValue");
    Class = objc_getClass(v5);
    if (!Class)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBDescriptor.m"), 253, CFSTR("Class %s not defined"), v5);
    return (TRIPBDescriptor *)-[objc_class descriptor](Class, "descriptor");
  }
  return result;
}

- (NSString)fullName
{
  NSString *v4;
  TRIPBFileDescriptor *v5;
  NSString *v6;
  TRIPBDescriptor *v7;
  TRIPBDescriptor *v8;
  NSString *v9;
  id AssociatedObject;
  void *v11;
  NSString *v12;
  id v13;
  void *v14;
  NSString *v15;
  NSString *v17;

  v4 = NSStringFromClass(-[TRIPBDescriptor messageClass](self, "messageClass"));
  v5 = -[TRIPBDescriptor file](self, "file");
  v6 = -[TRIPBFileDescriptor objcPrefix](v5, "objcPrefix");
  if (v6 && !-[NSString hasPrefix:](v4, "hasPrefix:", v6))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBDescriptor.m"), 264, CFSTR("Class didn't have correct prefix? (%@ - %@)"), v4, v6);
    return 0;
  }
  v7 = -[TRIPBDescriptor containingType](self, "containingType");
  v8 = v7;
  if (!v7)
    goto LABEL_8;
  v9 = NSStringFromClass(-[TRIPBDescriptor messageClass](v7, "messageClass"));
  AssociatedObject = objc_getAssociatedObject(v8, &kClassNameSuffixKey);
  if (AssociatedObject)
  {
    v11 = AssociatedObject;
    if (!-[NSString hasSuffix:](v9, "hasSuffix:", AssociatedObject))
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBDescriptor.m"), 278, CFSTR("ParentMessage class didn't have correct suffix? (%@ - %@)"), v4, v11);
      return 0;
    }
    v9 = -[NSString substringToIndex:](v9, "substringToIndex:", -[NSString length](v9, "length") - objc_msgSend(v11, "length"));
  }
  v6 = -[NSString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR("_"));
  if (!-[NSString hasPrefix:](v4, "hasPrefix:", v6))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBDescriptor.m"), 288, CFSTR("Class didn't have the correct parent name prefix? (%@ - %@)"), v6, v4);
    return 0;
  }
LABEL_8:
  v12 = -[NSString substringFromIndex:](v4, "substringFromIndex:", -[NSString length](v6, "length"));
  v13 = objc_getAssociatedObject(self, &kClassNameSuffixKey);
  if (!v13)
    goto LABEL_11;
  v14 = v13;
  if (!-[NSString hasSuffix:](v12, "hasSuffix:", v13))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBDescriptor.m"), 302, CFSTR("Message class didn't have correct suffix? (%@ - %@)"), v12, v14);
    return 0;
  }
  v12 = -[NSString substringToIndex:](v12, "substringToIndex:", -[NSString length](v12, "length") - objc_msgSend(v14, "length"));
LABEL_11:
  if (v8)
    v15 = -[TRIPBDescriptor fullName](v8, "fullName");
  else
    v15 = -[TRIPBFileDescriptor package](v5, "package");
  v17 = v15;
  if (!-[NSString length](v15, "length"))
    return v12;
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v17, v12);
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
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  fields = self->fields_;
  result = (id)-[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
        result = (id)-[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
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
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
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
    if ((objc_msgSend((id)objc_msgSend(v9, "name"), "isEqual:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
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
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
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
    if ((objc_msgSend((id)objc_msgSend(v9, "name"), "isEqual:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](oneofs, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
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
