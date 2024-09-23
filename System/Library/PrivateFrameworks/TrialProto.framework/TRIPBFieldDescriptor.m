@implementation TRIPBFieldDescriptor

- (BOOL)isRequired
{
  return self->description_->var5 & 1;
}

- (BOOL)isOptional
{
  return (self->description_->var5 >> 3) & 1;
}

- (unsigned)fieldType
{
  unsigned __int16 var5;

  var5 = self->description_->var5;
  if ((var5 & 2) != 0)
    return 1;
  else
    return 2 * ((var5 & 0xF00) != 0);
}

- (unsigned)mapKeyDataType
{
  unint64_t v2;

  v2 = (self->description_->var5 & 0xF00u) - 256;
  if (v2 < 0xC00)
    return byte_1921A456D[v2 >> 8];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBDescriptor.m"), 637, CFSTR("Not a map type"));
  return 7;
}

- (Class)msgClass
{
  return self->msgClass_;
}

- (BOOL)isValidEnumValue:(int)a3
{
  uint64_t v3;
  TRIPBMessageFieldDescription *description;
  TRIPBEnumDescriptor *enumDescriptor;

  v3 = *(_QWORD *)&a3;
  description = self->description_;
  if (description->var6 != 17)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBDescriptor.m"), 648, CFSTR("Field Must be of type TRIPBDataTypeEnum"));
    description = self->description_;
  }
  enumDescriptor = self->enumHandling_.enumDescriptor_;
  if ((description->var5 & 0x80) != 0)
    enumDescriptor = -[TRIPBEnumDescriptor enumVerifier](self->enumHandling_.enumDescriptor_, "enumVerifier");
  return ((uint64_t (*)(uint64_t))enumDescriptor)(v3);
}

- (BOOL)isPackable
{
  return (self->description_->var5 >> 2) & 1;
}

- (TRIPBFieldDescriptor)initWithFieldDescription:(void *)a3 includesDefault:(BOOL)a4 syntax:(unsigned __int8)a5
{
  int v5;
  _BOOL4 v6;
  TRIPBFieldDescriptor *v9;
  TRIPBFieldDescriptor *v10;
  uint64_t v11;
  char *v12;
  int v13;
  unsigned int v14;
  int v15;
  SEL v16;
  uint64_t v17;
  const char *v18;
  Class Class;
  uint64_t (*v20)(void);
  BOOL v21;
  unsigned int *v22;
  objc_super v24;

  v5 = a5;
  v6 = a4;
  v24.receiver = self;
  v24.super_class = (Class)TRIPBFieldDescriptor;
  v9 = -[TRIPBFieldDescriptor init](&v24, sel_init);
  v10 = v9;
  if (!v9)
    return v10;
  if (v6)
    v11 = 8;
  else
    v11 = 0;
  if (v6)
    v12 = (char *)a3 + 8;
  else
    v12 = (char *)a3;
  v9->description_ = (TRIPBMessageFieldDescription *)v12;
  v9->getSel_ = sel_getUid(*(const char **)((char *)a3 + v11));
  v10->setSel_ = SelFromStrings("set", *(char **)((char *)a3 + v11), 0, 1);
  v13 = v12[30];
  v14 = v13 - 15;
  v15 = v10->description_->var5 & 0xF02;
  if ((v10->description_->var5 & 0xF02) != 0)
  {
    v16 = SelFromStrings(0, *(char **)((char *)a3 + v11), "_Count", 0);
    v17 = 40;
LABEL_10:
    *(Class *)((char *)&v10->super.isa + v17) = (Class)v16;
    goto LABEL_12;
  }
  if (*((_DWORD *)v12 + 5) <= 0x7FFFFFFEu)
  {
    if (v5 == 3 && v14 > 1)
    {
LABEL_17:
      if (v13 == 17)
      {
        v20 = (uint64_t (*)(void))*((_QWORD *)v12 + 1);
        if ((*((_WORD *)v12 + 14) & 0x80) != 0)
          v10->enumHandling_.enumDescriptor_ = (TRIPBEnumDescriptor *)v20();
        else
          v10->enumHandling_.enumDescriptor_ = (TRIPBEnumDescriptor *)v20;
      }
      goto LABEL_21;
    }
    v10->hasOrCountSel_ = SelFromStrings("has", *(char **)((char *)a3 + v11), 0, 0);
    v16 = SelFromStrings("setHas", *(char **)((char *)a3 + v11), 0, 1);
    v17 = 48;
    goto LABEL_10;
  }
LABEL_12:
  if (v14 > 1)
    goto LABEL_17;
  v18 = (const char *)*((_QWORD *)v12 + 1);
  Class = objc_getClass(v18);
  v10->msgClass_ = Class;
  if (!Class)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("TRIPBDescriptor.m"), 534, CFSTR("Class %s not defined"), v18);
LABEL_21:
  if (v15)
    v21 = 1;
  else
    v21 = !v6;
  if (!v21)
  {
    v22 = *(unsigned int **)a3;
    v10->defaultValue_.valueInt64 = (int64_t)v22;
    if (v13 == 13)
    {
      if (v22)
        v10->defaultValue_.valueInt64 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v22 + 1, bswap32(*v22));
    }
  }
  return v10;
}

- (NSString)name
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", self->description_->var0);
}

- (TRIPBFieldDescriptor)init
{
  TRIPBFieldDescriptor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TRIPBFieldDescriptor;
  v3 = -[TRIPBFieldDescriptor init](&v5, sel_init);
  if (v3)
    -[TRIPBFieldDescriptor doesNotRecognizeSelector:](v3, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)dealloc
{
  TRIPBMessageFieldDescription *description;
  objc_super v4;

  description = self->description_;
  if (description->var6 == 13 && (description->var5 & 2) == 0)

  v4.receiver = self;
  v4.super_class = (Class)TRIPBFieldDescriptor;
  -[TRIPBFieldDescriptor dealloc](&v4, sel_dealloc);
}

- (unsigned)dataType
{
  return self->description_->var6;
}

- (BOOL)hasDefaultValue
{
  return (self->description_->var5 >> 4) & 1;
}

- (unsigned)number
{
  return self->description_->var2;
}

- (TRIPBEnumDescriptor)enumDescriptor
{
  if ((self->description_->var5 & 0x80) != 0)
    return self->enumHandling_.enumDescriptor_;
  else
    return 0;
}

- ($10779BD48C5E5A5359A19962DF980F89)defaultValue
{
  int64_t valueInt64;
  TRIPBMessageFieldDescription *description;
  int var6;
  BOOL v7;

  valueInt64 = self->defaultValue_.valueInt64;
  description = self->description_;
  if ((description->var5 & 2) == 0)
  {
    var6 = description->var6;
    if (var6 == 13 && valueInt64 == 0)
    {
      return ($10779BD48C5E5A5359A19962DF980F89)TRIPBEmptyNSData();
    }
    else
    {
      if (valueInt64)
        v7 = 0;
      else
        v7 = var6 == 14;
      if (v7)
        return ($10779BD48C5E5A5359A19962DF980F89)&stru_1E2E9CC90;
    }
  }
  return ($10779BD48C5E5A5359A19962DF980F89)valueInt64;
}

- (id)textFormatName
{
  NSString *v3;
  unint64_t v4;
  int v5;
  id AssociatedObject;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;

  if ((self->description_->var5 & 0x40) != 0)
  {
    AssociatedObject = objc_getAssociatedObject(self, &kTextFormatExtraValueKey);
    if (AssociatedObject)
      return (id)TRIPBDecodeTextFormatName((char *)objc_msgSend(AssociatedObject, "pointerValue"), self->description_->var2, -[TRIPBFieldDescriptor name](self, "name"));
    return 0;
  }
  else
  {
    v3 = -[TRIPBFieldDescriptor name](self, "name");
    v4 = -[NSString length](v3, "length");
    if (-[NSString hasSuffix:](v3, "hasSuffix:", CFSTR("_p")))
    {
      v3 = -[NSString substringToIndex:](v3, "substringToIndex:", v4 - 2);
      v4 = -[NSString length](v3, "length");
    }
    if ((self->description_->var5 & 2) != 0 && -[NSString hasSuffix:](v3, "hasSuffix:", CFSTR("Array")))
    {
      v3 = -[NSString substringToIndex:](v3, "substringToIndex:", v4 - 5);
      v4 = -[NSString length](v3, "length");
    }
    if (self->description_->var6 == 16)
    {
      v5 = -[NSString characterAtIndex:](v3, "characterAtIndex:", 0);
      if ((v5 - 97) <= 0x19)
        return -[NSString stringByReplacingCharactersInRange:withString:](v3, "stringByReplacingCharactersInRange:withString:", 0, 1, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C"), (unsigned __int16)(v5 - 32)));
      return v3;
    }
    else
    {
      v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", v4);
      if (v4)
      {
        v9 = 0;
        v10 = 1;
        do
        {
          v11 = -[NSString characterAtIndex:](v3, "characterAtIndex:", v9);
          if ((v11 - 65) > 0x19 || v10 == 1)
            objc_msgSend(v8, "appendFormat:", CFSTR("%C"), v11);
          else
            objc_msgSend(v8, "appendFormat:", CFSTR("_%C"), (v11 + 32));
          v9 = v10;
        }
        while (v4 > v10++);
      }
    }
  }
  return v8;
}

- (TRIPBOneofDescriptor)containingOneof
{
  return self->containingOneof_;
}

@end
