@implementation TransparencyGPBEnumDescriptor

+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 flags:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v10;

  v8 = *(_QWORD *)&a8;
  v10 = *(_QWORD *)&a6;
  if ((a8 & 0xFFFFFFFD) != 0)
    sub_1000C90CC();
  return _objc_msgSend(objc_alloc((Class)a1), "initWithName:valueNames:values:count:enumVerifier:flags:", a3, a4, a5, v10, a7, v8);
}

+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 flags:(unsigned int)a8 extraTextFormatInfo:(const char *)a9
{
  id result;

  result = objc_msgSend(a1, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:", a3, a4, a5, *(_QWORD *)&a6, a7, *(_QWORD *)&a8);
  *((_QWORD *)result + 5) = a9;
  return result;
}

+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7
{
  return objc_msgSend(a1, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:", a3, a4, a5, *(_QWORD *)&a6, a7, 0);
}

+ (id)allocDescriptorForName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 extraTextFormatInfo:(const char *)a8
{
  return objc_msgSend(a1, "allocDescriptorForName:valueNames:values:count:enumVerifier:flags:extraTextFormatInfo:", a3, a4, a5, *(_QWORD *)&a6, a7, 0, a8);
}

- (TransparencyGPBEnumDescriptor)initWithName:(id)a3 valueNames:(const char *)a4 values:(const int *)a5 count:(unsigned int)a6 enumVerifier:(void *)a7 flags:(unsigned int)a8
{
  TransparencyGPBEnumDescriptor *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)TransparencyGPBEnumDescriptor;
  v14 = -[TransparencyGPBEnumDescriptor init](&v16, "init");
  if (v14)
  {
    v14->name_ = (NSString *)objc_msgSend(a3, "copy");
    v14->valueNames_ = a4;
    v14->values_ = a5;
    v14->enumVerifier_ = a7;
    v14->valueCount_ = a6;
    v14->flags_ = a8;
  }
  return v14;
}

- (void)dealloc
{
  unsigned int *nameOffsets;
  objc_super v4;

  nameOffsets = self->nameOffsets_;
  if (nameOffsets)
    free(nameOffsets);
  v4.receiver = self;
  v4.super_class = (Class)TransparencyGPBEnumDescriptor;
  -[TransparencyGPBEnumDescriptor dealloc](&v4, "dealloc");
}

- (BOOL)isClosed
{
  return (LOBYTE(self->flags_) >> 1) & 1;
}

- (void)calcValueNameOffsets
{
  unsigned int *v3;
  unint64_t v4;
  const char *valueNames;
  const char *v6;

  objc_sync_enter(self);
  if (!self->nameOffsets_)
  {
    v3 = (unsigned int *)malloc_type_malloc(4 * self->valueCount_, 0x100004052888210uLL);
    if (v3)
    {
      if (self->valueCount_)
      {
        v4 = 0;
        valueNames = self->valueNames_;
        v6 = valueNames;
        do
        {
          v3[v4] = (_DWORD)v6 - (_DWORD)valueNames;
          while (*(unsigned __int8 *)v6++)
            ;
          ++v4;
        }
        while (v4 < self->valueCount_);
      }
      self->nameOffsets_ = v3;
    }
  }
  objc_sync_exit(self);
}

- (id)enumNameForValue:(int)a3
{
  uint64_t valueCount;
  uint64_t v4;

  valueCount = self->valueCount_;
  if (!(_DWORD)valueCount)
    return 0;
  v4 = 0;
  while (self->values_[v4] != a3)
  {
    if (valueCount == ++v4)
      return 0;
  }
  return -[TransparencyGPBEnumDescriptor getEnumNameForIndex:](self, "getEnumNameForIndex:", v4);
}

- (BOOL)getValue:(int *)a3 forEnumName:(id)a4
{
  NSUInteger v7;
  NSUInteger v8;
  unsigned int v9;
  char *v10;
  unsigned int *nameOffsets;
  uint64_t valueCount;
  unint64_t v13;
  const char *v14;
  const char *valueNames;
  uint64_t v16;

  v7 = -[NSString length](self->name_, "length");
  v8 = v7 + 1;
  if ((unint64_t)objc_msgSend(a4, "length") <= v7 + 1)
    goto LABEL_10;
  v9 = objc_msgSend(a4, "hasPrefix:", self->name_);
  if (!v9)
    return v9;
  if (objc_msgSend(a4, "characterAtIndex:", v7) != 95
    || (v10 = (char *)objc_msgSend(a4, "UTF8String"),
        -[TransparencyGPBEnumDescriptor calcValueNameOffsets](self, "calcValueNameOffsets"),
        (nameOffsets = self->nameOffsets_) == 0)
    || (valueCount = self->valueCount_, !(_DWORD)valueCount))
  {
LABEL_10:
    LOBYTE(v9) = 0;
    return v9;
  }
  v13 = 0;
  v14 = &v10[v8];
  valueNames = self->valueNames_;
  v16 = 4 * valueCount;
  while (strcmp(v14, &valueNames[nameOffsets[v13 / 4]]))
  {
    LOBYTE(v9) = 0;
    v13 += 4;
    if (v16 == v13)
      return v9;
  }
  if (a3)
    *a3 = self->values_[v13 / 4];
  LOBYTE(v9) = 1;
  return v9;
}

- (BOOL)getValue:(int *)a3 forEnumTextFormatName:(id)a4
{
  uint64_t v7;

  -[TransparencyGPBEnumDescriptor calcValueNameOffsets](self, "calcValueNameOffsets");
  if (!self->nameOffsets_ || !self->valueCount_)
    return 0;
  v7 = 0;
  while (!objc_msgSend(-[TransparencyGPBEnumDescriptor getEnumTextFormatNameForIndex:](self, "getEnumTextFormatNameForIndex:", v7), "isEqual:", a4))
  {
    if (++v7 >= self->valueCount_)
      return 0;
  }
  if (a3)
    *a3 = self->values_[v7];
  return 1;
}

- (id)textFormatNameForValue:(int)a3
{
  uint64_t valueCount;
  uint64_t v4;

  valueCount = self->valueCount_;
  if (!(_DWORD)valueCount)
    return 0;
  v4 = 0;
  while (self->values_[v4] != a3)
  {
    if (valueCount == ++v4)
      return 0;
  }
  return -[TransparencyGPBEnumDescriptor getEnumTextFormatNameForIndex:](self, "getEnumTextFormatNameForIndex:", v4);
}

- (unsigned)enumNameCount
{
  return self->valueCount_;
}

- (id)getEnumNameForIndex:(unsigned int)a3
{
  unsigned int *nameOffsets;

  -[TransparencyGPBEnumDescriptor calcValueNameOffsets](self, "calcValueNameOffsets");
  nameOffsets = self->nameOffsets_;
  if (nameOffsets && self->valueCount_ > a3)
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_%s"), self->name_, &self->valueNames_[nameOffsets[a3]]);
  else
    return 0;
}

- (id)getEnumTextFormatNameForIndex:(unsigned int)a3
{
  unsigned int *nameOffsets;
  NSString *v6;
  char *extraTextFormatInfo;
  NSMutableString *v8;
  char *v9;
  char *i;
  unsigned int v11;
  char v12;

  -[TransparencyGPBEnumDescriptor calcValueNameOffsets](self, "calcValueNameOffsets");
  nameOffsets = self->nameOffsets_;
  if (!nameOffsets || self->valueCount_ <= a3)
    return 0;
  v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &self->valueNames_[nameOffsets[a3]]);
  extraTextFormatInfo = (char *)self->extraTextFormatInfo_;
  if (!extraTextFormatInfo || (v8 = (NSMutableString *)sub_1000CB074(extraTextFormatInfo, a3, v6)) == 0)
  {
    v9 = -[NSString length](v6, "length");
    v8 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", v9);
    if (v9)
    {
      for (i = 0; i != v9; ++i)
      {
        v11 = -[NSString characterAtIndex:](v6, "characterAtIndex:", i);
        v12 = v11;
        if (i && v11 >= 0x41 && v11 <= 0x5A)
          -[NSMutableString appendString:](v8, "appendString:", CFSTR("_"));
        -[NSMutableString appendFormat:](v8, "appendFormat:", CFSTR("%c"), __toupper(v12));
      }
    }
  }
  return v8;
}

- (NSString)name
{
  return self->name_;
}

- (void)enumVerifier
{
  return self->enumVerifier_;
}

@end
