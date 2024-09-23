void PRRectGetMinLength(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRect v8;

  CGRectGetWidth(*(CGRect *)&a1);
  v8.origin.x = a1;
  v8.origin.y = a2;
  v8.size.width = a3;
  v8.size.height = a4;
  CGRectGetHeight(v8);
}

void PRRectGetMaxLength(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRect v8;

  CGRectGetWidth(*(CGRect *)&a1);
  v8.origin.x = a1;
  v8.origin.y = a2;
  v8.size.width = a3;
  v8.size.height = a4;
  CGRectGetHeight(v8);
}

double PRRectScale(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6)
{
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double result;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v11 = CGRectGetWidth(*(CGRect *)&a1) * a5;
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  v12 = CGRectGetWidth(v16) - v11;
  v17.origin.x = a1;
  v17.origin.y = a2;
  v17.size.width = a3;
  v17.size.height = a4;
  v13 = CGRectGetHeight(v17) * a6;
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  v14 = (CGRectGetHeight(v18) - v13) * 0.5;
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v19, v12 * 0.5, v14);
  return result;
}

double PRSizeScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

void _InvalidPRLikenessCacheSize(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  v1 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("Unsupported PRLikenessCacheSize provided: %@"), v2);
  v3 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v3, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

const __CFString *NSStringFromPRLikenessCacheSize(uint64_t a1)
{
  if (a1 <= 127)
  {
    if (a1 == 32)
    {
      return CFSTR("32x32");
    }
    else
    {
      if (a1 != 64)
        goto LABEL_12;
      return CFSTR("64x64");
    }
  }
  else
  {
    switch(a1)
    {
      case 128:
        return CFSTR("128x128");
      case 256:
        return CFSTR("256x256");
      case 512:
        return CFSTR("512x512");
      default:
LABEL_12:
        _InvalidPRLikenessCacheSize(a1);
    }
  }
}

double CGSizeFromPRLikenessCacheSize(uint64_t a1)
{
  if (a1 <= 127)
  {
    if (a1 == 32)
      return 32.0;
    if (a1 == 64)
      return 64.0;
LABEL_13:
    _InvalidPRLikenessCacheSize(a1);
  }
  if (a1 == 128)
    return 128.0;
  if (a1 == 256)
    return 256.0;
  if (a1 != 512)
    goto LABEL_13;
  return 512.0;
}

uint64_t PRLikenessCacheSizeGetCost(uint64_t a1)
{
  if (a1 <= 127)
  {
    if (a1 == 32)
    {
      return 1024;
    }
    else
    {
      if (a1 != 64)
        goto LABEL_12;
      return 4096;
    }
  }
  else
  {
    switch(a1)
    {
      case 128:
        return 0x4000;
      case 256:
        return 0x10000;
      case 512:
        return 0x40000;
      default:
LABEL_12:
        _InvalidPRLikenessCacheSize(a1);
    }
  }
}

uint64_t PRLikenessCacheSizeClosestToSize(double a1, double a2)
{
  if (a1 < a2)
    a1 = a2;
  if (a1 <= 32.0)
    return 32;
  if (a1 <= 64.0)
    return 64;
  if (a1 <= 128.0)
    return 128;
  if (a1 <= 256.0)
    return 256;
  return 512;
}

CGImageRef PRImageCreateWithImageInRect(CGImage *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGRect v11;
  CGRect v12;

  if (CGRectIsNull(*(CGRect *)&a2))
    return CGImageRetain(a1);
  v11.origin.x = a2;
  v11.origin.y = a3;
  v11.size.width = a4;
  v11.size.height = a5;
  if (CGRectIsEmpty(v11))
    return CGImageRetain(a1);
  v12.origin.x = a2;
  v12.origin.y = a3;
  v12.size.width = a4;
  v12.size.height = a5;
  return CGImageCreateWithImageInRect(a1, v12);
}

CGImageRef PRImageCreateCircularImageInRect(CGImage *a1, CGFloat a2, CGFloat a3, CGFloat Width, CGFloat Height)
{
  CGFloat v8;
  size_t v10;
  size_t v11;
  size_t v12;
  CGColorSpace *ColorSpace;
  CGContextRef v14;
  CGContext *v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGImageRef Image;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  if (!a1)
    return 0;
  v8 = a2;
  if (CGRectIsNull(*(CGRect *)&a2)
    || (v22.origin.x = v8, v22.origin.y = a3, v22.size.width = Width, v22.size.height = Height, CGRectIsEmpty(v22)))
  {
    Width = (double)CGImageGetWidth(a1);
    Height = (double)CGImageGetHeight(a1);
    v8 = 0.0;
    a3 = 0.0;
  }
  v23.origin.x = v8;
  v23.origin.y = a3;
  v23.size.width = Width;
  v23.size.height = Height;
  v10 = (unint64_t)CGRectGetWidth(v23);
  v24.origin.x = v8;
  v24.origin.y = a3;
  v24.size.width = Width;
  v24.size.height = Height;
  v11 = (unint64_t)CGRectGetHeight(v24);
  v25.origin.x = v8;
  v25.origin.y = a3;
  v25.size.width = Width;
  v25.size.height = Height;
  v12 = vcvtd_n_u64_f64(CGRectGetWidth(v25), 2uLL);
  ColorSpace = CGImageGetColorSpace(a1);
  v14 = CGBitmapContextCreate(0, v10, v11, 8uLL, v12, ColorSpace, 0x2001u);
  if (!v14)
    return 0;
  v15 = v14;
  v26.origin.x = v8;
  v26.origin.y = a3;
  v26.size.width = Width;
  v26.size.height = Height;
  v16 = CGRectGetWidth(v26);
  v27.origin.x = v8;
  v27.origin.y = a3;
  v27.size.width = Width;
  v27.size.height = Height;
  v28.size.height = CGRectGetHeight(v27);
  v28.origin.x = 0.0;
  v28.origin.y = 0.0;
  v28.size.width = v16;
  CGContextAddEllipseInRect(v15, v28);
  CGContextClip(v15);
  v29.origin.x = v8;
  v29.origin.y = a3;
  v29.size.width = Width;
  v29.size.height = Height;
  v17 = -CGRectGetMinX(v29);
  v30.origin.x = v8;
  v30.origin.y = a3;
  v30.size.width = Width;
  v30.size.height = Height;
  v18 = -CGRectGetMinY(v30);
  v19 = (double)CGImageGetWidth(a1);
  v31.size.height = (double)CGImageGetHeight(a1);
  v31.origin.x = v17;
  v31.origin.y = v18;
  v31.size.width = v19;
  CGContextDrawImage(v15, v31, a1);
  Image = CGBitmapContextCreateImage(v15);
  CGContextRelease(v15);
  return Image;
}

void PRImageForceDecompress(CGImage *a1)
{
  double Width;
  double Height;
  size_t BitsPerComponent;
  size_t BytesPerRow;
  CGColorSpace *ColorSpace;
  CGImageAlphaInfo AlphaInfo;
  CGBitmapInfo BitmapInfo;
  CGContext *v9;
  CGContext *v10;
  CGRect v11;

  if (a1)
  {
    Width = (double)CGImageGetWidth(a1);
    Height = (double)CGImageGetHeight(a1);
    BitsPerComponent = CGImageGetBitsPerComponent(a1);
    BytesPerRow = CGImageGetBytesPerRow(a1);
    ColorSpace = CGImageGetColorSpace(a1);
    AlphaInfo = CGImageGetAlphaInfo(a1);
    BitmapInfo = CGImageGetBitmapInfo(a1);
    v9 = CGBitmapContextCreate(0, (unint64_t)Width, (unint64_t)Height, BitsPerComponent, BytesPerRow, ColorSpace, BitmapInfo | AlphaInfo);
    if (v9)
    {
      v10 = v9;
      v11.origin.x = *(CGFloat *)MEMORY[0x24BDBEFB0];
      v11.origin.y = *(CGFloat *)(MEMORY[0x24BDBEFB0] + 8);
      v11.size.width = Width;
      v11.size.height = Height;
      CGContextDrawImage(v9, v11, a1);
      CGContextRelease(v10);
    }
  }
}

void sub_20AE12EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

uint64_t CGBitmapAllocateData()
{
  return MEMORY[0x24BDBD910]();
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

uint64_t CGBitmapFreeData()
{
  return MEMORY[0x24BDBD980]();
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x24BDBDB40](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x24BDBDB48](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDCC8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x24BDBDD28](c);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDDF8](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x24BDBDFA0](c, alpha);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBE0F8](c, x, y);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x24BDBE550](gradient);
}

uint64_t CGImageCreateByScaling()
{
  return MEMORY[0x24BDD9020]();
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x24BDBE5F8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9088](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE620](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x24BDBE628](image);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBE658](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9158](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CTLineCreateWithString()
{
  return MEMORY[0x24BDC4A40]();
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x24BDC4A68](line, context);
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  double result;

  MEMORY[0x24BDC4AC8](line, ascent, descent, leading);
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x24BDF78E8]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x24BDF78F0](context);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _PRGetLogSystem()
{
  return MEMORY[0x24BE71A88]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

