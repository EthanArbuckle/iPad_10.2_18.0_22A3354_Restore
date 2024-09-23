@implementation GPBDescriptor

+ (id)allocDescriptorForClass:(Class)a3 rootClass:(Class)a4 file:(id)a5 fields:(void *)a6 fieldCount:(unsigned int)a7 storageSize:(unsigned int)a8 flags:(unsigned int)a9
{
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  char *v14;
  void *v15;
  GPBFieldDescriptor *v16;
  id v17;
  uint64_t v23;

  LODWORD(v9) = a7;
  v11 = objc_msgSend(a5, "syntax", a3, a4);
  if ((_DWORD)v9)
  {
    v12 = v11;
    v13 = 0;
    v9 = v9;
    v23 = v9;
    v14 = (char *)a6;
    do
    {
      if (!v13)
        v13 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v23);
      if ((a9 & 1) != 0)
        v15 = v14;
      else
        v15 = a6;
      v16 = -[GPBFieldDescriptor initWithFieldDescription:includesDefault:usesClassRefs:proto3OptionalKnown:syntax:]([GPBFieldDescriptor alloc], "initWithFieldDescription:includesDefault:usesClassRefs:proto3OptionalKnown:syntax:", v15, a9 & 1, (a9 >> 2) & 1, (a9 >> 3) & 1, v12);
      objc_msgSend(v13, "addObject:", v16);

      v14 += 40;
      a6 = (char *)a6 + 32;
      --v9;
    }
    while (v9);
  }
  else
  {
    v13 = 0;
  }
  v17 = objc_msgSend(objc_alloc((Class)a1), "initWithClass:file:fields:storageSize:wireFormat:", a3, a5, v13, a8, (a9 >> 1) & 1);

  return v17;
}

- (GPBDescriptor)initWithClass:(Class)a3 file:(id)a4 fields:(id)a5 storageSize:(unsigned int)a6 wireFormat:(BOOL)a7
{
  GPBDescriptor *v12;
  GPBDescriptor *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GPBDescriptor;
  v12 = -[GPBDescriptor init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    v12->messageClass_ = a3;
    v12->file_ = (GPBFileDescriptor *)a4;
    v12->fields_ = (NSArray *)a5;
    v13->storageSize_ = a6;
    v13->wireFormat_ = a7;
  }
  return v13;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GPBDescriptor;
  -[GPBDescriptor dealloc](&v3, "dealloc");
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
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  GPBOneofDescriptor *v17;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = *(_QWORD *)&a5;
  if ((a5 & 0x80000000) == 0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[GPBDescriptor setupOneofs:count:firstHasIndex:]"), CFSTR("GPBDescriptor.m"), 191, CFSTR("Should always be <0"));
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
            if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16) + 8) + 20) == (_DWORD)v5)
              objc_msgSend(v12, "addObject:");
            v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v14);
      }
      if (!objc_msgSend(v12, "count"))
        -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[GPBDescriptor setupOneofs:count:firstHasIndex:]"), CFSTR("GPBDescriptor.m"), 197, CFSTR("No fields for this oneof? (%s:%d)"), v10, v5);
      v17 = -[GPBOneofDescriptor initWithName:fields:]([GPBOneofDescriptor alloc], "initWithName:fields:", v10, v12);
      -[NSArray addObject:](v8, "addObject:", v17);

      ++v9;
      v5 = (v5 - 1);
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
            objc_setAssociatedObject(v10, algn_1002EE0DD, v4, (void *)1);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](fields, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
  }
}

- (void)setupExtensionRanges:(const GPBExtensionRange *)a3 count:(int)a4
{
  self->extensionRanges_ = a3;
  self->extensionRangesCount_ = a4;
}

- (void)setupContainingMessageClass:(Class)a3
{
  objc_setAssociatedObject(self, &algn_1002EE0DD[1], a3, 0);
}

- (void)setupContainingMessageClassName:(const char *)a3
{
  Class Class;

  Class = objc_getClass(a3);
  if (!Class)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBDescriptor.m"), 237, CFSTR("Class %s not defined"), a3);
  -[GPBDescriptor setupContainingMessageClass:](self, "setupContainingMessageClass:", Class);
}

- (void)setupMessageClassNameSuffix:(id)a3
{
  if (objc_msgSend(a3, "length"))
    objc_setAssociatedObject(self, &algn_1002EE0DD[2], a3, (void *)1);
}

- (NSString)name
{
  return NSStringFromClass(self->messageClass_);
}

- (GPBDescriptor)containingType
{
  return (GPBDescriptor *)objc_msgSend(objc_getAssociatedObject(self, &algn_1002EE0DD[1]), "descriptor");
}

- (NSString)fullName
{
  NSString *v4;
  GPBFileDescriptor *v5;
  NSString *v6;
  GPBDescriptor *v7;
  GPBDescriptor *v8;
  NSString *v9;
  id AssociatedObject;
  void *v11;
  NSString *v12;
  id v13;
  void *v14;
  NSString *v15;
  NSString *v17;

  v4 = NSStringFromClass(-[GPBDescriptor messageClass](self, "messageClass"));
  v5 = -[GPBDescriptor file](self, "file");
  v6 = -[GPBFileDescriptor objcPrefix](v5, "objcPrefix");
  if (v6 && !-[NSString hasPrefix:](v4, "hasPrefix:", v6))
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBDescriptor.m"), 265, CFSTR("Class didn't have correct prefix? (%@ - %@)"), v4, v6);
    return 0;
  }
  v7 = -[GPBDescriptor containingType](self, "containingType");
  v8 = v7;
  if (!v7)
    goto LABEL_8;
  v9 = NSStringFromClass(-[GPBDescriptor messageClass](v7, "messageClass"));
  AssociatedObject = objc_getAssociatedObject(v8, &algn_1002EE0DD[2]);
  if (AssociatedObject)
  {
    v11 = AssociatedObject;
    if (!-[NSString hasSuffix:](v9, "hasSuffix:", AssociatedObject))
    {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBDescriptor.m"), 279, CFSTR("ParentMessage class didn't have correct suffix? (%@ - %@)"), v4, v11);
      return 0;
    }
    v9 = -[NSString substringToIndex:](v9, "substringToIndex:", (_BYTE *)-[NSString length](v9, "length") - (_BYTE *)objc_msgSend(v11, "length"));
  }
  v6 = -[NSString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR("_"));
  if (!-[NSString hasPrefix:](v4, "hasPrefix:", v6))
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBDescriptor.m"), 289, CFSTR("Class didn't have the correct parent name prefix? (%@ - %@)"), v6, v4);
    return 0;
  }
LABEL_8:
  v12 = -[NSString substringFromIndex:](v4, "substringFromIndex:", -[NSString length](v6, "length"));
  v13 = objc_getAssociatedObject(self, &algn_1002EE0DD[2]);
  if (!v13)
    goto LABEL_11;
  v14 = v13;
  if (!-[NSString hasSuffix:](v12, "hasSuffix:", v13))
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBDescriptor.m"), 303, CFSTR("Message class didn't have correct suffix? (%@ - %@)"), v12, v14);
    return 0;
  }
  v12 = -[NSString substringToIndex:](v12, "substringToIndex:", (_BYTE *)-[NSString length](v12, "length") - (_BYTE *)objc_msgSend(v14, "length"));
LABEL_11:
  if (v8)
    v15 = -[GPBDescriptor fullName](v8, "fullName");
  else
    v15 = -[GPBFileDescriptor package](v5, "package");
  v17 = v15;
  if (!-[NSString length](v15, "length"))
    return v12;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@"), v17, v12);
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

- (GPBFileDescriptor)file
{
  return self->file_;
}

- (BOOL)isWireFormat
{
  return self->wireFormat_;
}

@end
