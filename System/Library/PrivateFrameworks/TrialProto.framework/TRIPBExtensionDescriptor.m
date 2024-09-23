@implementation TRIPBExtensionDescriptor

- (TRIPBExtensionDescriptor)initWithExtensionDescription:(TRIPBExtensionDescription *)a3
{
  TRIPBExtensionDescriptor *v5;
  TRIPBExtensionDescriptor *v6;
  char *var2;
  TRIPBExtensionDescription *description;
  uint64_t v9;
  int var6;
  unsigned int *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TRIPBExtensionDescriptor;
  v5 = -[TRIPBExtensionDescriptor init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->description_ = a3;
    var2 = a3->var2;
    description = a3;
    if (var2)
    {
      v9 = (uint64_t)objc_lookUpClass(var2);
      if (!v9 && (strcmp(a3->var2, "TRIPBFieldOptions") || (v9 = objc_opt_class()) == 0))
      {
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("TRIPBDescriptor.m"), 988, CFSTR("Class %s not defined"), a3->var2);
        v9 = 0;
      }
      v6->containingMessageClass_ = (Class)v9;
      description = v6->description_;
    }
    var6 = description->var6;
    if (var6 == 13)
    {
      v11 = (unsigned int *)a3->var0.var2;
      if (v11)
        v6->defaultValue_.valueInt64 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v11 + 1, bswap32(*v11));
    }
    else if ((var6 - 15) >= 2)
    {
      v6->defaultValue_.valueInt64 = a3->var0.var2;
    }
  }
  return v6;
}

- (void)dealloc
{
  TRIPBExtensionDescription *description;
  objc_super v4;

  description = self->description_;
  if (description->var6 == 13 && (description->var7 & 1) == 0)

  v4.receiver = self;
  v4.super_class = (Class)TRIPBExtensionDescriptor;
  -[TRIPBExtensionDescriptor dealloc](&v4, sel_dealloc);
}

- (NSString)singletonName
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", self->description_->var1);
}

- (const)singletonNameC
{
  return self->description_->var1;
}

- (unsigned)fieldNumber
{
  return self->description_->var5;
}

- (unsigned)dataType
{
  return self->description_->var6;
}

- (int)wireType
{
  TRIPBExtensionDescription *description;

  description = self->description_;
  if ((description->var7 & 2) != 0)
    return 2;
  else
    return TRIPBWireFormatForType_format[description->var6];
}

- (int)alternateWireType
{
  TRIPBExtensionDescription *description;

  description = self->description_;
  if ((description->var7 & 1) != 0)
  {
    if ((description->var7 & 2) == 0)
      return 2;
  }
  else
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIPBDescriptor.m"), 1054, CFSTR("Only valid on repeated extensions"));
    description = self->description_;
    if ((description->var7 & 2) == 0)
      return 2;
  }
  return TRIPBWireFormatForType_format[description->var6];
}

- (BOOL)isRepeated
{
  return self->description_->var7 & 1;
}

- (BOOL)isPackable
{
  return (self->description_->var7 >> 1) & 1;
}

- (Class)msgClass
{
  return objc_getClass(self->description_->var3);
}

- (TRIPBEnumDescriptor)enumDescriptor
{
  TRIPBExtensionDescription *description;

  description = self->description_;
  if (description->var6 == 17)
    return (TRIPBEnumDescriptor *)((uint64_t (*)(void))description->var4)();
  else
    return 0;
}

- (id)defaultValue
{
  double v2;
  TRIPBExtensionDescription *description;
  NSData *valueData;
  id result;

  description = self->description_;
  if ((description->var7 & 1) != 0)
  {
    return 0;
  }
  else
  {
    valueData = 0;
    switch(description->var6)
    {
      case 0u:
        result = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->defaultValue_.valueBool);
        break;
      case 1u:
      case 0xBu:
        result = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->defaultValue_.valueUInt32);
        break;
      case 2u:
      case 7u:
      case 9u:
      case 0x11u:
        result = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->defaultValue_.valueUInt32);
        break;
      case 3u:
        LODWORD(v2) = self->defaultValue_.valueInt32;
        result = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v2);
        break;
      case 4u:
      case 0xCu:
        result = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->defaultValue_.valueInt64);
        break;
      case 5u:
      case 8u:
      case 0xAu:
        result = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->defaultValue_.valueInt64);
        break;
      case 6u:
        result = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->defaultValue_.valueDouble);
        break;
      case 0xDu:
        valueData = self->defaultValue_.valueData;
        if (valueData)
          return valueData;
        result = (id)TRIPBEmptyNSData();
        break;
      case 0xEu:
        valueData = self->defaultValue_.valueData;
        if (!valueData)
          return &stru_1E2E9CC90;
        return valueData;
      default:
        return valueData;
    }
  }
  return result;
}

- (int64_t)compareByFieldNumber:(id)a3
{
  int var5;
  int v4;
  BOOL v5;
  int64_t v6;

  var5 = self->description_->var5;
  v4 = *(_DWORD *)(*((_QWORD *)a3 + 1) + 40);
  v5 = var5 < v4;
  v6 = var5 != v4;
  if (v5)
    return -1;
  else
    return v6;
}

- (Class)containingMessageClass
{
  return self->containingMessageClass_;
}

@end
