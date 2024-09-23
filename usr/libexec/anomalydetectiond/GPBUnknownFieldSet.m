@implementation GPBUnknownFieldSet

- (id)copyWithZone:(_NSZone *)a3
{
  GPBUnknownFieldSet *v4;
  __CFDictionary *fields;

  v4 = -[GPBUnknownFieldSet init](+[GPBUnknownFieldSet allocWithZone:](GPBUnknownFieldSet, "allocWithZone:", a3), "init");
  fields = self->fields_;
  if (fields)
    CFDictionaryApplyFunction(fields, (CFDictionaryApplierFunction)sub_10029C480, v4);
  return v4;
}

- (void)dealloc
{
  __CFDictionary *fields;
  objc_super v4;

  fields = self->fields_;
  if (fields)
    CFRelease(fields);
  v4.receiver = self;
  v4.super_class = (Class)GPBUnknownFieldSet;
  -[GPBUnknownFieldSet dealloc](&v4, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  __CFDictionary *fields;
  unint64_t v7;
  BOOL result;
  BOOL v9;

  v5 = objc_opt_class(GPBUnknownFieldSet);
  if ((objc_opt_isKindOfClass(a3, v5) & 1) == 0)
    return 0;
  fields = self->fields_;
  v7 = *((_QWORD *)a3 + 1);
  result = ((unint64_t)fields | v7) == 0;
  if (fields)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (!v9)
    return CFEqual(self->fields_, (CFTypeRef)v7) != 0;
  return result;
}

- (unint64_t)hash
{
  __CFDictionary *fields;

  fields = self->fields_;
  if (fields)
    return CFHash(fields);
  else
    return objc_opt_class(GPBUnknownFieldSet);
}

- (BOOL)hasField:(int)a3
{
  __CFDictionary *fields;

  fields = self->fields_;
  if (fields)
    LOBYTE(fields) = CFDictionaryGetValue(fields, (const void *)a3) != 0;
  return (char)fields;
}

- (id)getField:(int)a3
{
  id result;

  result = self->fields_;
  if (result)
    return (id)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)a3);
  return result;
}

- (unint64_t)countOfFields
{
  unint64_t result;

  result = (unint64_t)self->fields_;
  if (result)
    return CFDictionaryGetCount((CFDictionaryRef)result);
  return result;
}

- (id)sortedFields
{
  __CFDictionary *fields;
  size_t Count;
  const void **v5;
  const void **v6;
  uint64_t v7;
  _QWORD *v8;
  const void *v9;
  uint64_t *v10;
  _QWORD *v11;
  size_t v12;
  uint64_t v13;
  const void *v15;

  fields = self->fields_;
  if (!fields)
    return +[NSArray array](NSArray, "array");
  Count = CFDictionaryGetCount(fields);
  v5 = (const void **)((char *)&v15 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
  CFDictionaryGetKeysAndValues(self->fields_, &v15, v5);
  v6 = &v15 - 2 * Count;
  if (Count)
  {
    v7 = 0;
    v8 = v6 + 1;
    do
    {
      v9 = v5[v7];
      *(v8 - 1) = v9;
      *v8 = v9;
      ++v7;
      v8 += 2;
    }
    while (Count != v7);
    qsort_b(&v15 - 2 * Count, Count, 0x10uLL, &stru_100364D88);
    v10 = (uint64_t *)(v6 + 1);
    v11 = (const void **)((char *)&v15 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    v12 = Count;
    do
    {
      v13 = *v10;
      v10 += 2;
      *v11++ = v13;
      --v12;
    }
    while (v12);
  }
  else
  {
    qsort_b(v6, 0, 0x10uLL, &stru_100364D88);
  }
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, Count);
}

- (void)writeToCodedOutputStream:(id)a3
{
  __CFDictionary *fields;
  size_t Count;
  const void **v7;
  const void **v8;
  uint64_t v9;
  _QWORD *v10;
  const void *v11;
  void **v12;
  void *v13;
  const void *v14;

  fields = self->fields_;
  if (fields)
  {
    Count = CFDictionaryGetCount(fields);
    v7 = (const void **)((char *)&v14 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    CFDictionaryGetKeysAndValues(self->fields_, &v14, v7);
    if (Count < 2)
    {
      objc_msgSend((id)*v7, "writeToOutput:", a3);
    }
    else
    {
      v8 = &v14 - 2 * Count;
      v9 = 0;
      v10 = v8 + 1;
      do
      {
        v11 = v7[v9];
        *(v10 - 1) = v11;
        *v10 = v11;
        ++v9;
        v10 += 2;
      }
      while (Count != v9);
      qsort_b(&v14 - 2 * Count, Count, 0x10uLL, &stru_100364DA8);
      v12 = (void **)(v8 + 1);
      do
      {
        v13 = *v12;
        v12 += 2;
        objc_msgSend(v13, "writeToOutput:", a3);
        --Count;
      }
      while (Count);
    }
  }
}

- (id)description
{
  NSMutableString *v3;

  v3 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@ %p>: TextFormat: {\n"), objc_opt_class(self), self);
  -[NSMutableString appendString:](v3, "appendString:", GPBTextFormatForUnknownFieldSet(self, CFSTR("  ")));
  -[NSMutableString appendString:](v3, "appendString:", CFSTR("}"));
  return v3;
}

- (unint64_t)serializedSize
{
  unint64_t result;
  unint64_t context;

  context = 0;
  result = (unint64_t)self->fields_;
  if (result)
  {
    CFDictionaryApplyFunction((CFDictionaryRef)result, (CFDictionaryApplierFunction)sub_10029C974, &context);
    return context;
  }
  return result;
}

- (void)writeAsMessageSetTo:(id)a3
{
  __CFDictionary *fields;

  fields = self->fields_;
  if (fields)
    CFDictionaryApplyFunction(fields, (CFDictionaryApplierFunction)sub_10029C9BC, a3);
}

- (unint64_t)serializedSizeAsMessageSet
{
  unint64_t result;
  unint64_t context;

  context = 0;
  result = (unint64_t)self->fields_;
  if (result)
  {
    CFDictionaryApplyFunction((CFDictionaryRef)result, (CFDictionaryApplierFunction)sub_10029C9FC, &context);
    return context;
  }
  return result;
}

- (id)data
{
  NSMutableData *v3;
  GPBCodedOutputStream *v4;

  v3 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", -[GPBUnknownFieldSet serializedSize](self, "serializedSize"));
  v4 = -[GPBCodedOutputStream initWithData:]([GPBCodedOutputStream alloc], "initWithData:", v3);
  -[GPBUnknownFieldSet writeToCodedOutputStream:](self, "writeToCodedOutputStream:", v4);

  return v3;
}

+ (BOOL)isFieldTag:(int)a3
{
  return GPBWireFormatGetTagWireType(a3) != 4;
}

- (void)addField:(id)a3
{
  signed int v5;
  __CFDictionary *fields;

  v5 = objc_msgSend(a3, "number");
  if (!v5)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Zero is not a valid field number."));
  fields = self->fields_;
  if (!fields)
  {
    fields = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
    self->fields_ = fields;
  }
  CFDictionarySetValue(fields, (const void *)v5, a3);
}

- (id)mutableFieldForNumber:(int)a3 create:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  __CFDictionary *fields;
  GPBUnknownField *Value;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  fields = self->fields_;
  if (fields)
  {
    Value = (GPBUnknownField *)CFDictionaryGetValue(fields, (const void *)a3);
    if (Value)
      return Value;
  }
  else
  {
    Value = 0;
  }
  if (v4)
  {
    Value = -[GPBUnknownField initWithNumber:]([GPBUnknownField alloc], "initWithNumber:", v5);
    -[GPBUnknownFieldSet addField:](self, "addField:", Value);

  }
  return Value;
}

- (void)mergeUnknownFields:(id)a3
{
  const __CFDictionary *v4;

  if (a3)
  {
    v4 = (const __CFDictionary *)*((_QWORD *)a3 + 1);
    if (v4)
      CFDictionaryApplyFunction(v4, (CFDictionaryApplierFunction)sub_10029CBE8, self);
  }
}

- (void)mergeFromData:(id)a3
{
  GPBCodedInputStream *v4;

  v4 = -[GPBCodedInputStream initWithData:]([GPBCodedInputStream alloc], "initWithData:", a3);
  -[GPBUnknownFieldSet mergeFromCodedInputStream:](self, "mergeFromCodedInputStream:", v4);
  -[GPBCodedInputStream checkLastTagWas:](v4, "checkLastTagWas:", 0);

}

- (void)mergeVarintField:(int)a3 value:(int)a4
{
  uint64_t v5;

  v5 = *(_QWORD *)&a3;
  if (!a3)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Zero is not a valid field number."));
  objc_msgSend(-[GPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v5, 1), "addVarint:", a4);
}

- (BOOL)mergeFieldFrom:(int)a3 input:(id)a4
{
  uint64_t TagFieldNumber;
  int TagWireType;
  BOOL v10;
  uint64_t *v11;
  id RetainedBytes;
  GPBUnknownFieldSet *v13;

  if (!GPBWireFormatIsValidTag(a3))
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBUnknownFieldSet.m"), 325, CFSTR("Got passed an invalid tag"));
  TagFieldNumber = GPBWireFormatGetTagFieldNumber(a3);
  TagWireType = GPBWireFormatGetTagWireType(a3);
  v10 = 0;
  v11 = (uint64_t *)((char *)a4 + 8);
  switch(TagWireType)
  {
    case 0:
      v10 = 1;
      objc_msgSend(-[GPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", TagFieldNumber, 1), "addVarint:", GPBCodedInputStreamReadInt64(v11));
      break;
    case 1:
      v10 = 1;
      objc_msgSend(-[GPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", TagFieldNumber, 1), "addFixed64:", GPBCodedInputStreamReadFixed64(v11));
      break;
    case 2:
      RetainedBytes = GPBCodedInputStreamReadRetainedBytes(v11);
      v10 = 1;
      objc_msgSend(-[GPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", TagFieldNumber, 1), "addLengthDelimited:", RetainedBytes);

      break;
    case 3:
      v13 = objc_alloc_init(GPBUnknownFieldSet);
      objc_msgSend(a4, "readUnknownGroup:message:", TagFieldNumber, v13);
      v10 = 1;
      objc_msgSend(-[GPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", TagFieldNumber, 1), "addGroup:", v13);

      break;
    case 5:
      v10 = 1;
      objc_msgSend(-[GPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", TagFieldNumber, 1), "addFixed32:", GPBCodedInputStreamReadFixed32(v11));
      break;
    default:
      return v10;
  }
  return v10;
}

- (void)mergeMessageSetMessage:(int)a3 data:(id)a4
{
  objc_msgSend(-[GPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", *(_QWORD *)&a3, 1), "addLengthDelimited:", a4);
}

- (void)addUnknownMapEntry:(int)a3 value:(id)a4
{
  objc_msgSend(-[GPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", *(_QWORD *)&a3, 1), "addLengthDelimited:", a4);
}

- (void)mergeFromCodedInputStream:(id)a3
{
  uint64_t Tag;

  do
    Tag = GPBCodedInputStreamReadTag((uint64_t)a3 + 8);
  while ((_DWORD)Tag && -[GPBUnknownFieldSet mergeFieldFrom:input:](self, "mergeFieldFrom:input:", Tag, a3));
}

- (void)getTags:(int *)a3
{
  __CFDictionary *fields;
  CFIndex Count;
  const void **v7;
  const void *v8;
  uint64_t v9;

  fields = self->fields_;
  if (fields)
  {
    Count = CFDictionaryGetCount(fields);
    v7 = (const void **)((char *)&v9 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    CFDictionaryGetKeysAndValues(self->fields_, v7, 0);
    for (; Count; --Count)
    {
      v8 = *v7++;
      *a3++ = (int)v8;
    }
  }
}

@end
