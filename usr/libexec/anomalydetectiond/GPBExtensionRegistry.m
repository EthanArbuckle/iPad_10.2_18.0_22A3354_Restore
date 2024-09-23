@implementation GPBExtensionRegistry

- (GPBExtensionRegistry)init
{
  GPBExtensionRegistry *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GPBExtensionRegistry;
  v2 = -[GPBExtensionRegistry init](&v4, "init");
  if (v2)
    v2->mutableClassMap_ = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->mutableClassMap_);
  v3.receiver = self;
  v3.super_class = (Class)GPBExtensionRegistry;
  -[GPBExtensionRegistry dealloc](&v3, "dealloc");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "addExtensions:", self);
  return v4;
}

- (void)addExtension:(id)a3
{
  id v5;
  void *Value;

  if (a3)
  {
    v5 = objc_msgSend(a3, "containingMessageClass");
    Value = (void *)CFDictionaryGetValue(self->mutableClassMap_, v5);
    if (!Value)
    {
      Value = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, 0, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(self->mutableClassMap_, v5, Value);
      CFRelease(Value);
    }
    CFDictionarySetValue((CFMutableDictionaryRef)Value, (const void *)objc_msgSend(a3, "fieldNumber"), a3);
  }
}

- (id)extensionForDescriptor:(id)a3 fieldNumber:(int64_t)a4
{
  id result;

  result = (id)CFDictionaryGetValue(self->mutableClassMap_, objc_msgSend(a3, "messageClass"));
  if (result)
    return (id)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)a4);
  return result;
}

- (void)addExtensions:(id)a3
{
  if (a3)
    CFDictionaryApplyFunction(*((CFDictionaryRef *)a3 + 1), (CFDictionaryApplierFunction)sub_1002BDEAC, self->mutableClassMap_);
}

@end
