id convertResultToObjCInArrayIfNecessary(void *a1)
{
  id v1;
  void *v2;
  char isKindOfClass;
  id v4;
  void *v5;

  v1 = a1;
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v4 = (id)objc_msgSend(v1, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D1CE68], "resultsFromCoreResults:", v1);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = v1;
  }
  v5 = v4;

  return v5;
}

uint64_t DDResultCopyExtractedURL()
{
  return MEMORY[0x1E0D1CC30]();
}

uint64_t DDResultGetCategory()
{
  return MEMORY[0x1E0D1CC90]();
}

uint64_t DDResultGetRangeForURLification()
{
  return MEMORY[0x1E0D1CCD8]();
}

uint64_t DDResultHasType()
{
  return MEMORY[0x1E0D1CD18]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSRange NSRangeFromString(NSString *aString)
{
  NSUInteger v1;
  NSUInteger v2;
  NSRange result;

  v1 = MEMORY[0x1E0CB3128](aString);
  result.length = v2;
  result.location = v1;
  return result;
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

void NSZoneFree(NSZone *zone, void *ptr)
{
  MEMORY[0x1E0CB3458](zone, ptr);
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return (void *)MEMORY[0x1E0CB3468](zone, size);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

