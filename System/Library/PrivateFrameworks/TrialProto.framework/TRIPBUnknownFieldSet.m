@implementation TRIPBUnknownFieldSet

- (id)copyWithZone:(_NSZone *)a3
{
  TRIPBUnknownFieldSet *v4;
  __CFDictionary *fields;

  v4 = -[TRIPBUnknownFieldSet init](+[TRIPBUnknownFieldSet allocWithZone:](TRIPBUnknownFieldSet, "allocWithZone:", a3), "init");
  fields = self->fields_;
  if (fields)
    CFDictionaryApplyFunction(fields, (CFDictionaryApplierFunction)CopyWorker, v4);
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
  v4.super_class = (Class)TRIPBUnknownFieldSet;
  -[TRIPBUnknownFieldSet dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  __CFDictionary *fields;
  unint64_t v6;
  BOOL result;
  BOOL v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  fields = self->fields_;
  v6 = *((_QWORD *)a3 + 1);
  result = ((unint64_t)fields | v6) == 0;
  if (fields)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8)
    return CFEqual(self->fields_, (CFTypeRef)v6) != 0;
  return result;
}

- (unint64_t)hash
{
  __CFDictionary *fields;

  fields = self->fields_;
  if (fields)
    return CFHash(fields);
  else
    return objc_opt_class();
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
  const void *v15[2];

  v15[1] = *(const void **)MEMORY[0x1E0C80C00];
  fields = self->fields_;
  if (!fields)
    return (id)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  Count = CFDictionaryGetCount(fields);
  v5 = (const void **)((char *)v15 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
  CFDictionaryGetKeysAndValues(self->fields_, v15, v5);
  v6 = &v15[-2 * Count];
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
    qsort_b(&v15[-2 * Count], Count, 0x10uLL, &__block_literal_global_0);
    v10 = (uint64_t *)(v6 + 1);
    v11 = (const void **)((char *)v15 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
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
    qsort_b(v6, 0, 0x10uLL, &__block_literal_global_0);
  }
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, Count);
}

uint64_t __36__TRIPBUnknownFieldSet_sortedFields__block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  unsigned int v3;

  if (*a2 == *a3)
    v3 = 0;
  else
    v3 = -1;
  if (*a2 > *a3)
    return 1;
  else
    return v3;
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
  const void *v14[2];

  v14[1] = *(const void **)MEMORY[0x1E0C80C00];
  fields = self->fields_;
  if (fields)
  {
    Count = CFDictionaryGetCount(fields);
    v7 = (const void **)((char *)v14 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    CFDictionaryGetKeysAndValues(self->fields_, v14, v7);
    if (Count < 2)
    {
      objc_msgSend((id)*v7, "writeToOutput:", a3);
    }
    else
    {
      v8 = &v14[-2 * Count];
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
      qsort_b(&v14[-2 * Count], Count, 0x10uLL, &__block_literal_global_2);
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

uint64_t __49__TRIPBUnknownFieldSet_writeToCodedOutputStream___block_invoke(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  unsigned int v3;

  if (*a2 == *a3)
    v3 = 0;
  else
    v3 = -1;
  if (*a2 > *a3)
    return 1;
  else
    return v3;
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p>: TextFormat: {\n"), objc_opt_class(), self);
  objc_msgSend(v3, "appendString:", TRIPBTextFormatForUnknownFieldSet(self, CFSTR("  ")));
  objc_msgSend(v3, "appendString:", CFSTR("}"));
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
    CFDictionaryApplyFunction((CFDictionaryRef)result, (CFDictionaryApplierFunction)TRIPBUnknownFieldSetSerializedSize, &context);
    return context;
  }
  return result;
}

- (void)writeAsMessageSetTo:(id)a3
{
  __CFDictionary *fields;

  fields = self->fields_;
  if (fields)
    CFDictionaryApplyFunction(fields, (CFDictionaryApplierFunction)TRIPBUnknownFieldSetWriteAsMessageSetTo, a3);
}

- (unint64_t)serializedSizeAsMessageSet
{
  unint64_t result;
  unint64_t context;

  context = 0;
  result = (unint64_t)self->fields_;
  if (result)
  {
    CFDictionaryApplyFunction((CFDictionaryRef)result, (CFDictionaryApplierFunction)TRIPBUnknownFieldSetSerializedSizeAsMessageSet, &context);
    return context;
  }
  return result;
}

- (id)data
{
  void *v3;
  TRIPBCodedOutputStream *v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", -[TRIPBUnknownFieldSet serializedSize](self, "serializedSize"));
  v4 = -[TRIPBCodedOutputStream initWithData:]([TRIPBCodedOutputStream alloc], "initWithData:", v3);
  -[TRIPBUnknownFieldSet writeToCodedOutputStream:](self, "writeToCodedOutputStream:", v4);

  return v3;
}

+ (BOOL)isFieldTag:(int)a3
{
  return (a3 & 7) != 4;
}

- (void)addField:(id)a3
{
  int v5;
  __CFDictionary *fields;

  v5 = objc_msgSend(a3, "number");
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Zero is not a valid field number."));
  fields = self->fields_;
  if (!fields)
  {
    fields = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
    self->fields_ = fields;
  }
  CFDictionarySetValue(fields, (const void *)v5, a3);
}

- (id)mutableFieldForNumber:(int)a3 create:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  __CFDictionary *fields;
  TRIPBUnknownField *Value;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  fields = self->fields_;
  if (fields)
  {
    Value = (TRIPBUnknownField *)CFDictionaryGetValue(fields, (const void *)a3);
    if (Value)
      return Value;
  }
  else
  {
    Value = 0;
  }
  if (v4)
  {
    Value = -[TRIPBUnknownField initWithNumber:]([TRIPBUnknownField alloc], "initWithNumber:", v5);
    -[TRIPBUnknownFieldSet addField:](self, "addField:", Value);

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
      CFDictionaryApplyFunction(v4, (CFDictionaryApplierFunction)TRIPBUnknownFieldSetMergeUnknownFields, self);
  }
}

- (void)mergeFromData:(id)a3
{
  TRIPBCodedInputStream *v4;

  v4 = -[TRIPBCodedInputStream initWithData:]([TRIPBCodedInputStream alloc], "initWithData:", a3);
  -[TRIPBUnknownFieldSet mergeFromCodedInputStream:](self, "mergeFromCodedInputStream:", v4);
  -[TRIPBCodedInputStream checkLastTagWas:](v4, "checkLastTagWas:", 0);

}

- (void)mergeVarintField:(int)a3 value:(int)a4
{
  uint64_t v5;

  v5 = *(_QWORD *)&a3;
  if (!a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Zero is not a valid field number."));
  objc_msgSend(-[TRIPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v5, 1), "addVarint:", a4);
}

- (BOOL)mergeFieldFrom:(int)a3 input:(id)a4
{
  BOOL v7;
  int v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *RetainedBytes;
  TRIPBUnknownFieldSet *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  if ((~a3 & 6) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBUnknownFieldSet.m"), 325, CFSTR("Got passed an invalid tag"));
  v7 = 0;
  v8 = a3 & 7;
  v9 = a3 >> 3;
  switch(v8)
  {
    case 0:
      v7 = 1;
      objc_msgSend(-[TRIPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v9, 1), "addVarint:", ReadRawVarint64((uint64_t *)a4 + 1));
      break;
    case 1:
      v7 = 1;
      v10 = -[TRIPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v9, 1);
      CheckSize((uint64_t)a4 + 8, 8);
      v11 = *((_QWORD *)a4 + 3);
      v12 = *(_QWORD *)(*((_QWORD *)a4 + 1) + v11);
      *((_QWORD *)a4 + 3) = v11 + 8;
      objc_msgSend(v10, "addFixed64:", v12);
      break;
    case 2:
      RetainedBytes = (void *)TRIPBCodedInputStreamReadRetainedBytes((uint64_t *)a4 + 1);
      v7 = 1;
      objc_msgSend(-[TRIPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v9, 1), "addLengthDelimited:", RetainedBytes);

      break;
    case 3:
      v14 = objc_alloc_init(TRIPBUnknownFieldSet);
      objc_msgSend(a4, "readUnknownGroup:message:", v9, v14);
      v7 = 1;
      objc_msgSend(-[TRIPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v9, 1), "addGroup:", v14);

      break;
    case 5:
      v7 = 1;
      v15 = -[TRIPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", v9, 1);
      CheckSize((uint64_t)a4 + 8, 4);
      v16 = *((_QWORD *)a4 + 3);
      v17 = *(unsigned int *)(*((_QWORD *)a4 + 1) + v16);
      *((_QWORD *)a4 + 3) = v16 + 4;
      objc_msgSend(v15, "addFixed32:", v17);
      break;
    default:
      return v7;
  }
  return v7;
}

- (void)mergeMessageSetMessage:(int)a3 data:(id)a4
{
  objc_msgSend(-[TRIPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", *(_QWORD *)&a3, 1), "addLengthDelimited:", a4);
}

- (void)addUnknownMapEntry:(int)a3 value:(id)a4
{
  objc_msgSend(-[TRIPBUnknownFieldSet mutableFieldForNumber:create:](self, "mutableFieldForNumber:create:", *(_QWORD *)&a3, 1), "addLengthDelimited:", a4);
}

- (void)mergeFromCodedInputStream:(id)a3
{
  char *v5;
  uint64_t Tag;

  v5 = (char *)a3 + 8;
  do
    Tag = TRIPBCodedInputStreamReadTag((uint64_t)v5);
  while ((_DWORD)Tag && -[TRIPBUnknownFieldSet mergeFieldFrom:input:](self, "mergeFieldFrom:input:", Tag, a3));
}

- (void)getTags:(int *)a3
{
  __CFDictionary *fields;
  CFIndex Count;
  const void **v7;
  const void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  fields = self->fields_;
  if (fields)
  {
    Count = CFDictionaryGetCount(fields);
    v7 = (const void **)((char *)v9 - ((8 * Count + 15) & 0xFFFFFFFFFFFFFFF0));
    CFDictionaryGetKeysAndValues(self->fields_, v7, 0);
    for (; Count; --Count)
    {
      v8 = *v7++;
      *a3++ = (int)v8;
    }
  }
}

@end
