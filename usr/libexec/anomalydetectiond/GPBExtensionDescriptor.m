@implementation GPBExtensionDescriptor

- (GPBExtensionDescriptor)initWithExtensionDescription:(GPBExtensionDescription *)description usesClassRefs:(BOOL)a4
{
  GPBExtensionDescriptor *v7;
  GPBExtensionDescriptor *v8;
  char *var0;
  Class v10;
  char *v11;
  Class v12;
  int var6;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)GPBExtensionDescriptor;
  v7 = -[GPBExtensionDescriptor init](&v15, "init");
  v8 = v7;
  if (v7)
  {
    v7->description_ = description;
    if (!a4)
    {
      var0 = description->var3.var0;
      if (var0)
      {
        v10 = objc_lookUpClass(description->var3.var0);
        if (!v10)
          -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("GPBDescriptor.m"), 993, CFSTR("Class %s not defined"), var0);
        v8->description_->var3.var0 = (char *)v10;
        description = v8->description_;
      }
      v11 = description->var2.var0;
      if (v11)
      {
        v12 = objc_lookUpClass(description->var2.var0);
        if (!v12)
          -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("GPBDescriptor.m"), 1000, CFSTR("Class %s not defined"), v11);
        v8->description_->var2.var0 = (char *)v12;
        description = v8->description_;
      }
    }
    var6 = description->var6;
    if (var6 == 13)
    {
      if (description->var0.var2)
        v8->defaultValue_.valueInt64 = (int64_t)objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", description->var0.var2 + 4, bswap32(*(_DWORD *)description->var0.var2));
    }
    else if ((var6 - 15) >= 2)
    {
      v8->defaultValue_.valueInt64 = description->var0.var2;
    }
  }
  return v8;
}

- (GPBExtensionDescriptor)initWithExtensionDescription:(GPBExtensionDescription *)a3
{
  return -[GPBExtensionDescriptor initWithExtensionDescription:usesClassRefs:](self, "initWithExtensionDescription:usesClassRefs:", a3, 0);
}

- (void)dealloc
{
  GPBExtensionDescription *description;
  objc_super v4;

  description = self->description_;
  if (description->var6 == 13 && (description->var7 & 1) == 0)

  v4.receiver = self;
  v4.super_class = (Class)GPBExtensionDescriptor;
  -[GPBExtensionDescriptor dealloc](&v4, "dealloc");
}

- (NSString)singletonName
{
  return +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", self->description_->var1);
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
  return GPBWireFormatForType(self->description_->var6, (self->description_->var7 & 2) != 0);
}

- (int)alternateWireType
{
  GPBExtensionDescription *description;
  unsigned __int8 var7;

  description = self->description_;
  var7 = description->var7;
  if ((var7 & 1) == 0)
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GPBDescriptor.m"), 1071, CFSTR("Only valid on repeated extensions"));
    description = self->description_;
    var7 = description->var7;
  }
  return GPBWireFormatForType(description->var6, (var7 & 2) == 0);
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
  return self->description_->var3.var1.var1;
}

- (Class)containingMessageClass
{
  return self->description_->var2.var1;
}

- (GPBEnumDescriptor)enumDescriptor
{
  GPBExtensionDescription *description;

  description = self->description_;
  if (description->var6 == 17)
    return (GPBEnumDescriptor *)((uint64_t (*)(void))description->var4)();
  else
    return 0;
}

- (id)defaultValue
{
  double v2;
  GPBExtensionDescription *description;
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
        result = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->defaultValue_.valueBool);
        break;
      case 1u:
      case 0xBu:
        result = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->defaultValue_.valueUInt32);
        break;
      case 2u:
      case 7u:
      case 9u:
      case 0x11u:
        result = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", self->defaultValue_.valueUInt32);
        break;
      case 3u:
        LODWORD(v2) = self->defaultValue_.valueInt32;
        result = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v2);
        break;
      case 4u:
      case 0xCu:
        result = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->defaultValue_.valueInt64);
        break;
      case 5u:
      case 8u:
      case 0xAu:
        result = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", self->defaultValue_.valueInt64);
        break;
      case 6u:
        result = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->defaultValue_.valueDouble);
        break;
      case 0xDu:
        valueData = self->defaultValue_.valueData;
        if (valueData)
          return valueData;
        result = (id)GPBEmptyNSData();
        break;
      case 0xEu:
        valueData = self->defaultValue_.valueData;
        if (!valueData)
          return &stru_100366D80;
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

@end
