void makeIneligibleForProcessing(void *a1)
{
  id v1;

  v1 = a1;
  objc_msgSend(v1, "setEligibleForHandoff:", 0);
  objc_msgSend(v1, "setEligibleForPublicIndexing:", 0);
  objc_msgSend(v1, "setEligibleForSearch:", 0);
  objc_msgSend(v1, "setEligibleForPrediction:", 0);

}

void localizeActivityIfNeeded(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a1;
  +[PCLocalizedString keyValueForKey:](PCLocalizedString, "keyValueForKey:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("displayTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v3))
  {

LABEL_4:
    +[PCLocalizedString localizedStringForKey:](PCLocalizedString, "localizedStringForKey:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("displayTitle"));
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v12, "setUserInfo:", v11);

    objc_msgSend(v12, "setTitle:", v8);
    goto LABEL_5;
  }
  objc_msgSend(v12, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v3);

  if (v7)
    goto LABEL_4;
LABEL_5:

}

void sub_211B1A798(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_211B1A870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_211B1A900(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDCC8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x24BDBDD48](c);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x24BDBE080](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

uint64_t CUMainQueue()
{
  return MEMORY[0x24BE29160]();
}

uint64_t LogCategoryCreateEx()
{
  return MEMORY[0x24BE295C0]();
}

uint64_t LogCategory_Remove()
{
  return MEMORY[0x24BE295D0]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t NSDecodeObjectIfPresent()
{
  return MEMORY[0x24BE29660]();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return MEMORY[0x24BE29668]();
}

uint64_t NSDecodeStandardContainerIfPresent()
{
  return MEMORY[0x24BE29670]();
}

uint64_t NSErrorWithOSStatusF()
{
  return MEMORY[0x24BE296B8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BDF78C0]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BDF78C8](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BDF78D0]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BDF78D8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BDF78E0]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

uint64_t xpc_connection_set_non_launching()
{
  return MEMORY[0x24BDB07D8]();
}

