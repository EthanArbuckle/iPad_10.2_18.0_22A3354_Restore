@implementation TransparencyGPBFieldDescriptor

- (TransparencyGPBFieldDescriptor)initWithFieldDescription:(void *)a3 descriptorFlags:(unsigned int)a4
{
  char v4;
  TransparencyGPBFieldDescriptor *v6;
  TransparencyGPBFieldDescriptor *v7;
  TransparencyGPBMessageFieldDescription *v8;
  int var6;
  int v10;
  SEL v11;
  uint64_t v12;
  unsigned int *v13;
  objc_super v15;

  v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TransparencyGPBFieldDescriptor;
  v6 = -[TransparencyGPBFieldDescriptor init](&v15, "init");
  v7 = v6;
  if (!v6)
    return v7;
  if ((v4 & 1) != 0)
    v8 = (TransparencyGPBMessageFieldDescription *)((char *)a3 + 8);
  else
    v8 = (TransparencyGPBMessageFieldDescription *)a3;
  v6->description_ = v8;
  v6->getSel_ = sel_getUid(*((const char **)a3 + (v4 & 1)));
  v7->setSel_ = sub_10001CE10("set", *((char **)a3 + (v4 & 1)), 0, 1);
  var6 = v8->var6;
  v10 = v7->description_->var5 & 0xF02;
  if ((v7->description_->var5 & 0xF02) != 0)
  {
    v11 = sub_10001CE10(0, *((char **)a3 + (v4 & 1)), "_Count", 0);
    v12 = 40;
LABEL_7:
    *(Class *)((char *)&v7->super.isa + v12) = (Class)v11;
    goto LABEL_8;
  }
  if ((v8->var3 & 0x80000000) == 0 && (v8->var5 & 0x20) == 0)
  {
    v7->hasOrCountSel_ = sub_10001CE10("has", *((char **)a3 + (v4 & 1)), 0, 0);
    v11 = sub_10001CE10("setHas", *((char **)a3 + (v4 & 1)), 0, 1);
    v12 = 48;
    goto LABEL_7;
  }
LABEL_8:
  if ((var6 - 15) <= 1)
  {
    v7->msgClass_ = v8->var1.var1;
LABEL_14:
    if ((v4 & 1) != 0 && !v10)
    {
      v13 = *(unsigned int **)a3;
      v7->defaultValue_.valueInt64 = (int64_t)v13;
      if (var6 == 13)
      {
        if (v13)
          v7->defaultValue_.valueInt64 = (int64_t)objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", v13 + 1, bswap32(*v13));
      }
    }
    return v7;
  }
  if (var6 != 17)
    goto LABEL_14;
  v7->enumDescriptor_ = (TransparencyGPBEnumDescriptor *)((uint64_t (*)(void))v8->var1.var0)();
  if ((v4 & 1) != 0 && !v10)
    v7->defaultValue_.valueInt64 = *(_QWORD *)a3;
  return v7;
}

- (void)dealloc
{
  TransparencyGPBMessageFieldDescription *description;
  objc_super v4;

  description = self->description_;
  if (description->var6 == 13 && (description->var5 & 2) == 0)

  v4.receiver = self;
  v4.super_class = (Class)TransparencyGPBFieldDescriptor;
  -[TransparencyGPBFieldDescriptor dealloc](&v4, "dealloc");
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
  uint64_t v2;

  v2 = (((self->description_->var5 & 0xF00u) - 256) >> 8) - 1;
  if (v2 > 0xA)
    return 7;
  else
    return byte_10006C11E[v2];
}

- (BOOL)isPackable
{
  return (self->description_->var5 >> 2) & 1;
}

- (BOOL)isValidEnumValue:(int)a3
{
  return ((uint64_t (*)(_QWORD))-[TransparencyGPBEnumDescriptor enumVerifier](self->enumDescriptor_, "enumVerifier"))(*(_QWORD *)&a3);
}

- (TransparencyGPBEnumDescriptor)enumDescriptor
{
  return self->enumDescriptor_;
}

- ($592374059145371CE175D116F6F4BC44)defaultValue
{
  int64_t valueInt64;
  TransparencyGPBMessageFieldDescription *description;
  int var6;
  BOOL v7;

  valueInt64 = self->defaultValue_.valueInt64;
  description = self->description_;
  if ((description->var5 & 2) == 0)
  {
    var6 = description->var6;
    if (var6 == 13 && valueInt64 == 0)
    {
      return ($592374059145371CE175D116F6F4BC44)sub_100011848();
    }
    else
    {
      if (valueInt64)
        v7 = 0;
      else
        v7 = var6 == 14;
      if (v7)
        return ($592374059145371CE175D116F6F4BC44)&stru_100072BF0;
    }
  }
  return ($592374059145371CE175D116F6F4BC44)valueInt64;
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
    AssociatedObject = objc_getAssociatedObject(self, &algn_10006C11A[1]);
    if (AssociatedObject)
      return sub_100013DC0((char *)objc_msgSend(AssociatedObject, "pointerValue"), self->description_->var2, -[TransparencyGPBFieldDescriptor name](self, "name"));
    return 0;
  }
  else
  {
    v3 = -[TransparencyGPBFieldDescriptor name](self, "name");
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

- (TransparencyGPBOneofDescriptor)containingOneof
{
  return self->containingOneof_;
}

@end
