@implementation TRIPBExtensionRegistry

- (TRIPBExtensionRegistry)init
{
  TRIPBExtensionRegistry *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TRIPBExtensionRegistry;
  v2 = -[TRIPBExtensionRegistry init](&v4, sel_init);
  if (v2)
    v2->mutableClassMap_ = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRIPBExtensionRegistry;
  -[TRIPBExtensionRegistry dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "addExtensions:", self);
  return v4;
}

- (void)addExtension:(id)a3
{
  uint64_t v5;
  CFMutableDictionaryRef Mutable;

  if (a3)
  {
    v5 = objc_msgSend(a3, "containingMessageClass");
    Mutable = (CFMutableDictionaryRef)-[NSMutableDictionary objectForKey:](self->mutableClassMap_, "objectForKey:", v5);
    if (!Mutable)
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
      -[NSMutableDictionary setObject:forKey:](self->mutableClassMap_, "setObject:forKey:", Mutable, v5);
      CFRelease(Mutable);
    }
    CFDictionarySetValue(Mutable, (const void *)objc_msgSend(a3, "fieldNumber"), a3);
  }
}

- (id)extensionForDescriptor:(id)a3 fieldNumber:(int64_t)a4
{
  id result;

  result = (id)-[NSMutableDictionary objectForKey:](self->mutableClassMap_, "objectForKey:", objc_msgSend(a3, "messageClass"));
  if (result)
    return (id)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)a4);
  return result;
}

- (void)addExtensions:(id)a3
{
  void *v3;
  _QWORD v4[5];

  if (a3)
  {
    v3 = (void *)*((_QWORD *)a3 + 1);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __40__TRIPBExtensionRegistry_addExtensions___block_invoke;
    v4[3] = &unk_1E2E9B9A0;
    v4[4] = self;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);
  }
}

void __40__TRIPBExtensionRegistry_addExtensions___block_invoke(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  void *v6;
  CFMutableDictionaryRef MutableCopy;

  v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectForKey:", a2);
  if (v6)
  {
    CFDictionaryApplyFunction(a3, (CFDictionaryApplierFunction)CopyKeyValue, v6);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, a3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", MutableCopy, a2);
    CFRelease(MutableCopy);
  }
}

@end
