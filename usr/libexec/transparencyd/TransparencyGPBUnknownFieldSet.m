@implementation TransparencyGPBUnknownFieldSet

- (id)copyWithZone:(_NSZone *)a3
{
  TransparencyGPBUnknownFieldSet *v4;
  __CFDictionary *fields;

  v4 = -[TransparencyGPBUnknownFieldSet init](+[TransparencyGPBUnknownFieldSet allocWithZone:](TransparencyGPBUnknownFieldSet, "allocWithZone:", a3), "init");
  fields = self->fields_;
  if (fields)
    CFDictionaryApplyFunction(fields, (CFDictionaryApplierFunction)sub_100107270, v4);
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
  v4.super_class = (Class)TransparencyGPBUnknownFieldSet;
  -[TransparencyGPBUnknownFieldSet dealloc](&v4, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  __CFDictionary *fields;
  unint64_t v7;
  BOOL result;
  BOOL v9;

  v5 = objc_opt_class(TransparencyGPBUnknownFieldSet, a2);
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
    return objc_opt_class(TransparencyGPBUnknownFieldSet, a2);
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
  char *v5;
  uint64_t *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *v10;
  _QWORD *v11;
  size_t v12;
  uint64_t v13;
  uint64_t v15;

  fields = self->fields_;
  if (!fields)
    return +[NSArray array](NSArray, "array");
  Count = CFDictionaryGetCount(fields);
  v5 = (char *)&v15 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v5, 8 * Count);
  bzero(v5, 8 * Count);
  CFDictionaryGetKeysAndValues(self->fields_, (const void **)v5, (const void **)v5);
  v6 = &v15 - 2 * Count;
  bzero(v6, 16 * Count);
  if (Count)
  {
    v7 = 0;
    v8 = v6 + 1;
    do
    {
      v9 = *(_QWORD *)&v5[8 * v7];
      *(v8 - 1) = v9;
      *v8 = v9;
      ++v7;
      v8 += 2;
    }
    while (Count != v7);
    qsort_b(&v15 - 2 * Count, Count, 0x10uLL, &stru_100245770);
    v10 = v6 + 1;
    v11 = (uint64_t *)((char *)&v15 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
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
    qsort_b(v6, 0, 0x10uLL, &stru_100245770);
  }
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, Count);
}

- (void)writeToCodedOutputStream:(id)a3
{
  __CFDictionary *fields;
  size_t Count;
  id *v7;
  uint64_t *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  void **v12;
  void *v13;
  uint64_t v14;

  fields = self->fields_;
  if (fields)
  {
    Count = CFDictionaryGetCount(fields);
    v7 = (id *)((char *)&v14 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v7, 8 * Count);
    bzero(v7, 8 * Count);
    CFDictionaryGetKeysAndValues(self->fields_, (const void **)v7, (const void **)v7);
    if (Count < 2)
    {
      objc_msgSend(*v7, "writeToOutput:", a3);
    }
    else
    {
      v8 = &v14 - 2 * Count;
      bzero(v8, 16 * Count);
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
      qsort_b(&v14 - 2 * Count, Count, 0x10uLL, &stru_100245790);
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

  v3 = +[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@ %p>: TextFormat: {\n"), objc_opt_class(self, a2), self);
  -[NSMutableString appendString:](v3, "appendString:", sub_100109E18(self, CFSTR("  ")));
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
    CFDictionaryApplyFunction((CFDictionaryRef)result, (CFDictionaryApplierFunction)sub_1001077AC, &context);
    return context;
  }
  return result;
}

- (void)writeAsMessageSetTo:(id)a3
{
  __CFDictionary *fields;

  fields = self->fields_;
  if (fields)
    CFDictionaryApplyFunction(fields, (CFDictionaryApplierFunction)sub_1001077F4, a3);
}

- (unint64_t)serializedSizeAsMessageSet
{
  unint64_t result;
  unint64_t context;

  context = 0;
  result = (unint64_t)self->fields_;
  if (result)
  {
    CFDictionaryApplyFunction((CFDictionaryRef)result, (CFDictionaryApplierFunction)sub_100107834, &context);
    return context;
  }
  return result;
}

- (id)data
{
  NSMutableData *v3;
  TransparencyGPBCodedOutputStream *v4;

  v3 = +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", -[TransparencyGPBUnknownFieldSet serializedSize](self, "serializedSize"));
  v4 = -[TransparencyGPBCodedOutputStream initWithData:]([TransparencyGPBCodedOutputStream alloc], "initWithData:", v3);
  -[TransparencyGPBUnknownFieldSet writeToCodedOutputStream:](self, "writeToCodedOutputStream:", v4);

  return v3;
}

+ (BOOL)isFieldTag:(int)a3
{
  return sub_10010B5A4(a3) != 4;
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
  TransparencyGPBUnknownField *Value;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  fields = self->fields_;
  if (fields)
  {
    Value = (TransparencyGPBUnknownField *)CFDictionaryGetValue(fields, (const void *)a3);
    if (Value)
      return Value;
  }
  else
  {
    Value = 0;
  }
  if (v4)
  {
    Value = -[TransparencyGPBUnknownField initWithNumber:]([TransparencyGPBUnknownField alloc], "initWithNumber:", v5);
    -[TransparencyGPBUnknownFieldSet addField:](self, "addField:", Value);

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
      CFDictionaryApplyFunction(v4, (CFDictionaryApplierFunction)sub_100107A20, self);
  }
}

- (void)mergeFromData:(id)a3
{
  TransparencyGPBCodedInputStream *v4;

  v4 = -[TransparencyGPBCodedInputStream initWithData:]([TransparencyGPBCodedInputStream alloc], "initWithData:", a3);
  -[TransparencyGPBUnknownFieldSet mergeFromCodedInputStream:](self, "mergeFromCodedInputStream:", v4);
  -[TransparencyGPBCodedInputStream checkLastTagWas:](v4, "checkLastTagWas:", 0);

}

- (void)mergeVarintField:(int)a3 value:(int)a4
{
  uint64_t v5;

  v5 = *(_QWORD *)&a3;
  if (!a3)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Zero is not a valid field number."));
  objc_msgSend(-[TransparencyGPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v5, 1), "addVarint:", a4);
}

- (BOOL)mergeFieldFrom:(int)a3 input:(id)a4
{
  char v5;
  uint64_t v7;
  int v8;
  BOOL v9;
  uint64_t *v10;
  TransparencyGPBUnknownFieldSet *v11;

  v5 = a3;
  v7 = sub_10010B5AC(a3);
  v8 = sub_10010B5A4(v5);
  v9 = 0;
  v10 = (uint64_t *)((char *)a4 + 8);
  switch(v8)
  {
    case 0:
      v9 = 1;
      objc_msgSend(-[TransparencyGPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v7, 1), "addVarint:", sub_1000DC04C(v10));
      break;
    case 1:
      v9 = 1;
      objc_msgSend(-[TransparencyGPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v7, 1), "addFixed64:", sub_1000DC0E8(v10));
      break;
    case 2:
      v11 = (TransparencyGPBUnknownFieldSet *)sub_1000DC448(v10);
      v9 = 1;
      objc_msgSend(-[TransparencyGPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v7, 1), "addLengthDelimited:", v11);
      goto LABEL_6;
    case 3:
      v11 = objc_alloc_init(TransparencyGPBUnknownFieldSet);
      objc_msgSend(a4, "readUnknownGroup:message:", v7, v11);
      v9 = 1;
      objc_msgSend(-[TransparencyGPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v7, 1), "addGroup:", v11);
LABEL_6:

      break;
    case 5:
      v9 = 1;
      objc_msgSend(-[TransparencyGPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v7, 1), "addFixed32:", sub_1000DC120(v10));
      break;
    default:
      return v9;
  }
  return v9;
}

- (void)mergeMessageSetMessage:(int)a3 data:(id)a4
{
  objc_msgSend(-[TransparencyGPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", *(_QWORD *)&a3, 1), "addLengthDelimited:", a4);
}

- (void)addUnknownMapEntry:(int)a3 value:(id)a4
{
  objc_msgSend(-[TransparencyGPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", *(_QWORD *)&a3, 1), "addLengthDelimited:", a4);
}

- (void)mergeFromCodedInputStream:(id)a3
{
  uint64_t v5;

  do
    v5 = sub_1000DC1B4((uint64_t)a3 + 8);
  while ((_DWORD)v5 && -[TransparencyGPBUnknownFieldSet mergeFieldFrom:input:](self, "mergeFieldFrom:input:", v5, a3));
}

- (void)getTags:(int *)a3
{
  __CFDictionary *fields;
  CFIndex Count;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  fields = self->fields_;
  if (fields)
  {
    Count = CFDictionaryGetCount(fields);
    v7 = (uint64_t *)((char *)&v9 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    bzero(v7, 8 * Count);
    CFDictionaryGetKeysAndValues(self->fields_, (const void **)v7, 0);
    for (; Count; --Count)
    {
      v8 = *v7++;
      *a3++ = v8;
    }
  }
}

@end
