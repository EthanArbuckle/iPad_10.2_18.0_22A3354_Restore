@implementation CRLCapabilities

- (void)p_setupPlatform
{
  self->_platform = 1;
}

- (void)p_setupDevice
{
  unint64_t v3;
  int64x2_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  const __CFString *v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  unsigned int v16;
  __int128 v17;
  int64x2_t v18;
  id v19;

  v19 = (id)objc_claimAutoreleasedReturnValue(+[UIDevice crl_platformString](UIDevice, "crl_platformString"));
  if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPod3,")) & 1) == 0)
  {
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPod4,")) & 1) != 0)
    {
      v3 = 2;
      goto LABEL_5;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPod5,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100EEFCE0;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone2,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100EEFCF0;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone3,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100EEFD00;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone4,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100EEFD10;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone5,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100EEFD20;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone7,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100EEFD30;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone8,4")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100EEFD40;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone8,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100EEFD50;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone9,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100EEFD60;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone10,6")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100EEFD70;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone10,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100EEFD80;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad1,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100EEFD90;
      goto LABEL_6;
    }
    if (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad2,")))
    {
      v17 = xmmword_100EEFE70;
      if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad2,1")) & 1) == 0
        && (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad2,2")) & 1) == 0)
      {
        v5 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad2,3"));
        v4 = (int64x2_t)xmmword_100EEFE70;
        if ((v5 & 1) != 0)
          goto LABEL_6;
        if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad2,4"), COERCE_DOUBLE(15)) & 1) != 0)
        {
          v4 = (int64x2_t)xmmword_100EEFE80;
          goto LABEL_6;
        }
        v17 = xmmword_100EEFE90;
        if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad2,5")) & 1) == 0
          && (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad2,6")) & 1) == 0)
        {
          v7 = CFSTR("iPad2,7");
LABEL_70:
          v13 = objc_msgSend(v19, "hasPrefix:", v7, v17);
          v4 = v18;
          if ((v13 & 1) == 0)
            goto LABEL_7;
          goto LABEL_6;
        }
      }
    }
    else if (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad3,")))
    {
      v17 = xmmword_100EEFE50;
      if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad3,1")) & 1) == 0
        && (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad3,2")) & 1) == 0)
      {
        v6 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad3,3"));
        v4 = (int64x2_t)xmmword_100EEFE50;
        if ((v6 & 1) != 0)
          goto LABEL_6;
        v17 = xmmword_100EEFE60;
        if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad3,4"), COERCE_DOUBLE(16)) & 1) == 0
          && (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad3,5")) & 1) == 0)
        {
          v7 = CFSTR("iPad3,6");
          goto LABEL_70;
        }
      }
    }
    else if (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad4,")))
    {
      v17 = xmmword_100EEFE20;
      if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad4,4")) & 1) == 0
        && (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad4,5")) & 1) == 0)
      {
        v8 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad4,6"));
        v4 = (int64x2_t)xmmword_100EEFE20;
        if ((v8 & 1) != 0)
          goto LABEL_6;
        v17 = xmmword_100EEFE30;
        if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad4,7"), COERCE_DOUBLE(19)) & 1) == 0
          && (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad4,8")) & 1) == 0)
        {
          v9 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad4,9"));
          v4 = (int64x2_t)xmmword_100EEFE30;
          if ((v9 & 1) != 0)
            goto LABEL_6;
          v17 = xmmword_100EEFE40;
          if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad4,1"), COERCE_DOUBLE(21)) & 1) == 0
            && (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad4,2")) & 1) == 0)
          {
            v7 = CFSTR("iPad4,3");
            goto LABEL_70;
          }
        }
      }
    }
    else if (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad5,")))
    {
      v17 = xmmword_100EEFE00;
      if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad5,3")) & 1) == 0)
      {
        v10 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad5,4"));
        v4 = (int64x2_t)xmmword_100EEFE00;
        if ((v10 & 1) != 0)
          goto LABEL_6;
        v17 = xmmword_100EEFE10;
        if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad5,1"), COERCE_DOUBLE(22)) & 1) == 0)
        {
          v7 = CFSTR("iPad5,2");
          goto LABEL_70;
        }
      }
    }
    else if (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad6,")))
    {
      v17 = xmmword_100EEFDD0;
      if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad6,3")) & 1) == 0)
      {
        v11 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad6,4"));
        v4 = (int64x2_t)xmmword_100EEFDD0;
        if ((v11 & 1) != 0)
          goto LABEL_6;
        v17 = xmmword_100EEFDE0;
        if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad6,7"), COERCE_DOUBLE(24)) & 1) == 0)
        {
          v12 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad6,8"));
          v4 = (int64x2_t)xmmword_100EEFDE0;
          if ((v12 & 1) != 0)
            goto LABEL_6;
          v17 = xmmword_100EEFDF0;
          if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad6,11"), COERCE_DOUBLE(25)) & 1) == 0)
          {
            v7 = CFSTR("iPad6,12");
            goto LABEL_70;
          }
        }
      }
    }
    else
    {
      if (!objc_msgSend(v19, "hasPrefix:", CFSTR("iPad7,")))
        goto LABEL_7;
      v17 = xmmword_100EEFDA0;
      if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad7,1")) & 1) == 0)
      {
        v14 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad7,2"));
        v4 = (int64x2_t)xmmword_100EEFDA0;
        if ((v14 & 1) != 0)
          goto LABEL_6;
        v17 = xmmword_100EEFDB0;
        if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad7,3"), COERCE_DOUBLE(28)) & 1) == 0)
        {
          v15 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad7,4"));
          v4 = (int64x2_t)xmmword_100EEFDB0;
          if ((v15 & 1) != 0)
            goto LABEL_6;
          v17 = xmmword_100EEFDC0;
          if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad7,5"), COERCE_DOUBLE(27)) & 1) == 0)
          {
            v16 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad7,6"));
            v4 = (int64x2_t)xmmword_100EEFDC0;
            if (!v16)
              goto LABEL_7;
            goto LABEL_6;
          }
        }
      }
    }
    v4 = (int64x2_t)v17;
    goto LABEL_6;
  }
  v3 = 1;
LABEL_5:
  v4 = vdupq_n_s64(v3);
LABEL_6:
  *(int64x2_t *)&self->_device = v4;
LABEL_7:
  self->_deviceType = sub_1003F4F08(v19);

}

- (CRLCapabilities)init
{
  CRLCapabilities *v2;
  CRLCapabilities *v3;
  CRLCapabilities *v4;
  _QWORD block[4];
  CRLCapabilities *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLCapabilities;
  v2 = -[CRLCapabilities init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003F57A4;
    block[3] = &unk_10122D110;
    v4 = v2;
    v7 = v4;
    if (qword_101415808 != -1)
      dispatch_once(&qword_101415808, block);
    -[CRLCapabilities p_setupPlatform](v4, "p_setupPlatform");
    -[CRLCapabilities p_setupDevice](v4, "p_setupDevice");

  }
  return v3;
}

+ (CRLCapabilities)currentCapabilities
{
  if (qword_101415818 != -1)
    dispatch_once(&qword_101415818, &stru_10125AB28);
  return (CRLCapabilities *)(id)qword_101415820;
}

- (BOOL)isRendererH3OrBelow
{
  return (unint64_t)(self->_renderer - 1) < 2;
}

- (BOOL)isRendererH4OrBelow
{
  return (unint64_t)(self->_renderer - 1) < 5;
}

- (BOOL)isRendererH5OrBelow
{
  return (unint64_t)(self->_renderer - 1) < 7;
}

- (BOOL)hasLightningPort
{
  int64_t device;

  device = self->_device;
  return ((unint64_t)(device - 4) > 0x3F || ((1 << (device - 4)) & 0x8000000000001C07) == 0)
      && device != 0;
}

- (CGSize)maximumHardcodedTextureSize
{
  int64_t platform;
  CGFloat height;
  CGFloat width;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGSize result;

  platform = self->_platform;
  if ((unint64_t)(platform - 2) < 2)
  {
    v5 = 0x40C0000000000000;
    goto LABEL_6;
  }
  width = CGSizeZero.width;
  height = CGSizeZero.height;
  if (platform)
  {
    if (platform == 1)
    {
      v5 = 0x40B0000000000000;
LABEL_6:
      height = *(double *)&v5;
      width = *(double *)&v5;
    }
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125AB48);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2F6D8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125AB68);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCapabilities maximumHardcodedTextureSize]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLCapabilities.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 386, 0, "Unknown platform!");

  }
  v9 = width;
  v10 = height;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)maximumImageSize
{
  CGFloat height;
  CGFloat width;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  CGSize result;

  width = CGSizeZero.width;
  height = CGSizeZero.height;
  switch(self->_platform)
  {
    case 0:
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125AB88);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2F758();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125ABA8);
      v5 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCapabilities maximumImageSize]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLCapabilities.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 406, 0, "Unknown platform!");

      break;
    case 1:
    case 3:
      v4 = 0x40C0000000000000;
      goto LABEL_13;
    case 2:
      v4 = 0x40D0000000000000;
LABEL_13:
      height = *(double *)&v4;
      width = *(double *)&v4;
      break;
    default:
      break;
  }
  v8 = width;
  v9 = height;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)maximumMetalTextureSizeForDevice:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  CGSize result;

  if (-[CRLCapabilities isMetalCapable](self, "isMetalCapable", a3))
  {
    v4 = 8192.0;
    v5 = 8192.0;
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125ABC8);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2F7D8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125ABE8);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCapabilities maximumMetalTextureSizeForDevice:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLCapabilities.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 424, 0, "Shouldn't be asking for the maximum Metal texture size on a device that doesn't support Metal.");

    -[CRLCapabilities maximumHardcodedTextureSize](self, "maximumHardcodedTextureSize");
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (id)metalCapabilitiesForDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  CRLMetalDeviceCapabilities *v7;

  v3 = a3;
  if (!v3)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125AC08);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2F858();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125AC28);
    v4 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCapabilities metalCapabilitiesForDevice:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLCapabilities.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 438, 0, "invalid nil value for '%{public}s'", "device");

  }
  if (qword_101415830 != -1)
    dispatch_once(&qword_101415830, &stru_10125AC48);
  v7 = (CRLMetalDeviceCapabilities *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_101415828, "objectForKey:", v3));
  if (!v7)
  {
    v7 = -[CRLMetalDeviceCapabilities initWithDevice:]([CRLMetalDeviceCapabilities alloc], "initWithDevice:", v3);
    objc_msgSend((id)qword_101415828, "setObject:forKey:", v7, v3);
  }

  return v7;
}

- (BOOL)p_isMetalCapable
{
  id v2;
  BOOL v3;

  v2 = MTLCreateSystemDefaultDevice();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isMetalCapable
{
  return byte_101415810;
}

- (unint64_t)physicalMemory
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v3 = objc_msgSend(v2, "physicalMemory");

  return (unint64_t)v3;
}

- (BOOL)hasHEVCHardwareEncoding
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003F6184;
  block[3] = &unk_10122D110;
  block[4] = self;
  if (qword_101415840 != -1)
    dispatch_once(&qword_101415840, block);
  return byte_101415838;
}

- (int64_t)platform
{
  return self->_platform;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (int64_t)device
{
  return self->_device;
}

- (int64_t)renderer
{
  return self->_renderer;
}

@end
