id RPImageForDeviceModel(CFStringRef inTag, int *a2)
{
  __CFString *PreferredIdentifierForTag;
  __CFString *v4;
  CFDictionaryRef v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  int v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;

  PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1650], inTag, 0);
  v4 = PreferredIdentifierForTag;
  if (!PreferredIdentifierForTag)
  {
    v6 = 0;
    v5 = 0;
    goto LABEL_25;
  }
  PreferredIdentifierForTag = (__CFString *)UTTypeCopyDeclaration(PreferredIdentifierForTag);
  v5 = (CFDictionaryRef)PreferredIdentifierForTag;
  v6 = 0;
  if (!PreferredIdentifierForTag)
  {
LABEL_25:
    v12 = 0;
    v11 = -6727;
    goto LABEL_15;
  }
  v7 = *MEMORY[0x24BDC1798];
  v8 = *MEMORY[0x24BDC1738];
  v9 = v4;
  while (1)
  {
    v10 = v6;
    -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    -[__CFDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", v8);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      goto LABEL_8;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = -6756;
      goto LABEL_23;
    }

    v5 = UTTypeCopyDeclaration(v4);
    v9 = v4;
    if (!v5)
    {
LABEL_8:
      v11 = -6727;
LABEL_23:

      PreferredIdentifierForTag = 0;
      v5 = 0;
      v12 = 0;
      goto LABEL_15;
    }
  }

  PreferredIdentifierForTag = (__CFString *)UTTypeCopyDeclaringBundleURL(v9);
  v5 = (CFDictionaryRef)PreferredIdentifierForTag;
  if (PreferredIdentifierForTag)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", PreferredIdentifierForTag);
    PreferredIdentifierForTag = (__CFString *)objc_claimAutoreleasedReturnValue();
    v12 = PreferredIdentifierForTag;
    v11 = -6704;
    if (PreferredIdentifierForTag)
    {
      -[__CFString pathForResource:ofType:](PreferredIdentifierForTag, "pathForResource:ofType:", v6, 0);
      PreferredIdentifierForTag = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (PreferredIdentifierForTag)
        v11 = 0;
      else
        v11 = -6704;
    }
  }
  else
  {
    v12 = 0;
    v11 = -6704;
  }
  v4 = v9;
LABEL_15:
  v13 = PreferredIdentifierForTag;

  if (!v13)
  {
    v14 = 0;
    if (!a2)
      goto LABEL_21;
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithContentsOfFile:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v11 = 0;
  else
    v11 = -6755;
  if (a2)
LABEL_20:
    *a2 = v11;
LABEL_21:

  return v14;
}

id RPUILocalizedString(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  id v5;

  v1 = RPUILocalizedString_sOnce;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&RPUILocalizedString_sOnce, &__block_literal_global_0);
  objc_msgSend((id)RPUILocalizedString_sBundle, "localizedStringForKey:value:table:", v2, 0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = v2;
  v5 = v3;

  return v5;
}

id RPUILocalizedStringF(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  RPUILocalizedStringV(a1, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id RPUILocalizedStringV(void *a1, uint64_t a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a1;
  v5 = [v3 alloc];
  RPUILocalizedString(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithFormat:arguments:", v6, a2);

  if (v7)
    v8 = v7;
  else
    v8 = v4;
  v9 = v8;

  return v9;
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x24BE29128]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t SecondsToUpTicks()
{
  return MEMORY[0x24BE29968]();
}

CFDictionaryRef UTTypeCopyDeclaration(CFStringRef inUTI)
{
  return (CFDictionaryRef)MEMORY[0x24BDC15B0](inUTI);
}

CFURLRef UTTypeCopyDeclaringBundleURL(CFStringRef inUTI)
{
  return (CFURLRef)MEMORY[0x24BDC15B8](inUTI);
}

CFStringRef UTTypeCreatePreferredIdentifierForTag(CFStringRef inTagClass, CFStringRef inTag, CFStringRef inConformingToUTI)
{
  return (CFStringRef)MEMORY[0x24BDC15E0](inTagClass, inTag, inConformingToUTI);
}

uint64_t UpTicksToSecondsF()
{
  return MEMORY[0x24BE29B08]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

