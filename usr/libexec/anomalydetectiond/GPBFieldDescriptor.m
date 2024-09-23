@implementation GPBFieldDescriptor

- (GPBFieldDescriptor)init
{
  GPBFieldDescriptor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GPBFieldDescriptor;
  v3 = -[GPBFieldDescriptor init](&v5, "init");
  if (v3)
    -[GPBFieldDescriptor doesNotRecognizeSelector:](v3, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (GPBFieldDescriptor)initWithFieldDescription:(void *)a3 includesDefault:(BOOL)a4 usesClassRefs:(BOOL)a5 proto3OptionalKnown:(BOOL)a6 syntax:(unsigned __int8)a7
{
  int v7;
  _BOOL4 v9;
  _BOOL4 v10;
  GPBFieldDescriptor *v13;
  GPBFieldDescriptor *v14;
  uint64_t v15;
  GPBMessageFieldDescription *v16;
  int var6;
  unsigned int v18;
  int v19;
  int var3;
  SEL v21;
  uint64_t v22;
  uint64_t (*v23)(void);
  const char *var0;
  Class Class;
  BOOL v26;
  unsigned int *v27;
  SEL v29;
  _BOOL4 v30;
  objc_super v31;

  v7 = a7;
  v9 = a5;
  v10 = a4;
  v31.receiver = self;
  v31.super_class = (Class)GPBFieldDescriptor;
  v13 = -[GPBFieldDescriptor init](&v31, "init");
  v14 = v13;
  if (!v13)
    return v14;
  v30 = v9;
  v29 = a2;
  if (v10)
    v15 = 8;
  else
    v15 = 0;
  if (v10)
    v16 = (GPBMessageFieldDescription *)((char *)a3 + 8);
  else
    v16 = (GPBMessageFieldDescription *)a3;
  v13->description_ = v16;
  v13->getSel_ = sel_getUid(*(const char **)((char *)a3 + v15));
  v14->setSel_ = sub_10028F358("set", *(char **)((char *)a3 + v15), 0, 1);
  var6 = v16->var6;
  v18 = var6 - 17;
  v19 = v14->description_->var5 & 0xF02;
  if (v7 != 3 || a6 || (v14->description_->var5 & 0xF02) != 0)
  {
    if ((v14->description_->var5 & 0xF02) != 0)
    {
      v21 = sub_10028F358(0, *(char **)((char *)a3 + v15), "_Count", 0);
      v22 = 40;
LABEL_20:
      *(Class *)((char *)&v14->super.isa + v22) = (Class)v21;
      goto LABEL_21;
    }
    var3 = v16->var3;
LABEL_17:
    if (var3 < 0)
      goto LABEL_21;
    goto LABEL_18;
  }
  var3 = v16->var3;
  if (var3 < 0 || v18 > 0xFFFFFFFD)
    goto LABEL_17;
  v16->var5 |= 0x20u;
LABEL_18:
  if ((v16->var5 & 0x20) == 0)
  {
    v14->hasOrCountSel_ = sub_10028F358("has", *(char **)((char *)a3 + v15), 0, 0);
    v21 = sub_10028F358("setHas", *(char **)((char *)a3 + v15), 0, 1);
    v22 = 48;
    goto LABEL_20;
  }
LABEL_21:
  if (v18 >= 0xFFFFFFFE)
  {
    var0 = v16->var1.var0;
    if (v30)
    {
      v14->msgClass_ = (Class)var0;
    }
    else
    {
      Class = objc_getClass(var0);
      v14->msgClass_ = Class;
      if (!Class)
        -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v29, v14, CFSTR("GPBDescriptor.m"), 555, CFSTR("Class %s not defined"), var0);
    }
  }
  else if (var6 == 17)
  {
    v23 = (uint64_t (*)(void))v16->var1.var0;
    if ((v16->var5 & 0x80) != 0)
      v14->enumHandling_.enumDescriptor_ = (GPBEnumDescriptor *)v23();
    else
      v14->enumHandling_.enumDescriptor_ = (GPBEnumDescriptor *)v23;
  }
  if (v19)
    v26 = 1;
  else
    v26 = !v10;
  if (!v26)
  {
    v27 = *(unsigned int **)a3;
    v14->defaultValue_.valueInt64 = (int64_t)v27;
    if (var6 == 13)
    {
      if (v27)
        v14->defaultValue_.valueInt64 = (int64_t)objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v27 + 1, bswap32(*v27));
    }
  }
  return v14;
}

- (void)dealloc
{
  GPBMessageFieldDescription *description;
  objc_super v4;

  description = self->description_;
  if (description->var6 == 13 && (description->var5 & 2) == 0)

  v4.receiver = self;
  v4.super_class = (Class)GPBFieldDescriptor;
  -[GPBFieldDescriptor dealloc](&v4, "dealloc");
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

- (NSString)name
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", self->description_->var0);
}

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
    return byte_1002EE0E0[v2 >> 8];
  -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBDescriptor.m"), 659, CFSTR("Not a map type"));
  return 7;
}

- (BOOL)isPackable
{
  return (self->description_->var5 >> 2) & 1;
}

- (BOOL)isValidEnumValue:(int)a3
{
  uint64_t v3;
  GPBMessageFieldDescription *description;
  GPBEnumDescriptor *enumDescriptor;

  v3 = *(_QWORD *)&a3;
  description = self->description_;
  if (description->var6 != 17)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBDescriptor.m"), 670, CFSTR("Field Must be of type GPBDataTypeEnum"));
    description = self->description_;
  }
  enumDescriptor = self->enumHandling_.enumDescriptor_;
  if ((description->var5 & 0x80) != 0)
    enumDescriptor = -[GPBEnumDescriptor enumVerifier](self->enumHandling_.enumDescriptor_, "enumVerifier");
  return ((uint64_t (*)(uint64_t))enumDescriptor)(v3);
}

- (GPBEnumDescriptor)enumDescriptor
{
  if ((self->description_->var5 & 0x80) != 0)
    return self->enumHandling_.enumDescriptor_;
  else
    return 0;
}

- ($E03B6C47A93F81A9B698988C0D6CBFEC)defaultValue
{
  int64_t valueInt64;
  GPBMessageFieldDescription *description;
  int var6;
  BOOL v7;

  valueInt64 = self->defaultValue_.valueInt64;
  description = self->description_;
  if ((description->var5 & 2) == 0)
  {
    var6 = description->var6;
    if (var6 == 13 && valueInt64 == 0)
    {
      return ($E03B6C47A93F81A9B698988C0D6CBFEC)GPBEmptyNSData();
    }
    else
    {
      if (valueInt64)
        v7 = 0;
      else
        v7 = var6 == 14;
      if (v7)
        return ($E03B6C47A93F81A9B698988C0D6CBFEC)&stru_100366D80;
    }
  }
  return ($E03B6C47A93F81A9B698988C0D6CBFEC)valueInt64;
}

- (id)textFormatName
{
  NSString *v3;
  char *v4;
  unsigned int v5;
  id AssociatedObject;
  NSMutableString *v7;
  uint64_t v8;
  unsigned int v9;
  id v10;

  if ((self->description_->var5 & 0x40) != 0)
  {
    AssociatedObject = objc_getAssociatedObject(self, algn_1002EE0DD);
    if (AssociatedObject)
      return GPBDecodeTextFormatName((char *)objc_msgSend(AssociatedObject, "pointerValue"), self->description_->var2, -[GPBFieldDescriptor name](self, "name"));
    return 0;
  }
  else
  {
    v3 = -[GPBFieldDescriptor name](self, "name");
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
      if (v5 - 97 <= 0x19)
        return -[NSString stringByReplacingCharactersInRange:withString:](v3, "stringByReplacingCharactersInRange:withString:", 0, 1, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%C"), (unsigned __int16)(v5 - 32)));
      return v3;
    }
    else
    {
      v7 = +[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:", v4);
      if (v4)
      {
        v8 = 0;
        v9 = 1;
        do
        {
          v10 = (id)-[NSString characterAtIndex:](v3, "characterAtIndex:", v8);
          if (((_DWORD)v10 - 65) > 0x19 || v9 == 1)
            -[NSMutableString appendFormat:](v7, "appendFormat:", CFSTR("%C"), v10);
          else
            -[NSMutableString appendFormat:](v7, "appendFormat:", CFSTR("_%C"), ((_DWORD)v10 + 32));
          v8 = v9;
        }
        while ((unint64_t)v4 > v9++);
      }
    }
  }
  return v7;
}

- (Class)msgClass
{
  return self->msgClass_;
}

- (GPBOneofDescriptor)containingOneof
{
  return self->containingOneof_;
}

@end
