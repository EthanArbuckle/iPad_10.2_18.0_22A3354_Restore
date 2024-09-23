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
      v4 = (int64x2_t)xmmword_100060A30;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone2,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100060A40;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone3,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100060A50;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone4,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100060A60;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone5,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100060A70;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone7,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100060A80;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone8,4")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100060A90;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone8,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100060AA0;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone9,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100060AB0;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone10,6")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100060AC0;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone10,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100060AD0;
      goto LABEL_6;
    }
    if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad1,")) & 1) != 0)
    {
      v4 = (int64x2_t)xmmword_100060AE0;
      goto LABEL_6;
    }
    if (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad2,")))
    {
      v17 = xmmword_100060BC0;
      if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad2,1")) & 1) == 0
        && (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad2,2")) & 1) == 0)
      {
        v5 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad2,3"));
        v4 = (int64x2_t)xmmword_100060BC0;
        if ((v5 & 1) != 0)
          goto LABEL_6;
        if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad2,4"), COERCE_DOUBLE(15)) & 1) != 0)
        {
          v4 = (int64x2_t)xmmword_100060BD0;
          goto LABEL_6;
        }
        v17 = xmmword_100060BE0;
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
      v17 = xmmword_100060BA0;
      if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad3,1")) & 1) == 0
        && (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad3,2")) & 1) == 0)
      {
        v6 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad3,3"));
        v4 = (int64x2_t)xmmword_100060BA0;
        if ((v6 & 1) != 0)
          goto LABEL_6;
        v17 = xmmword_100060BB0;
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
      v17 = xmmword_100060B70;
      if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad4,4")) & 1) == 0
        && (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad4,5")) & 1) == 0)
      {
        v8 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad4,6"));
        v4 = (int64x2_t)xmmword_100060B70;
        if ((v8 & 1) != 0)
          goto LABEL_6;
        v17 = xmmword_100060B80;
        if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad4,7"), COERCE_DOUBLE(19)) & 1) == 0
          && (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad4,8")) & 1) == 0)
        {
          v9 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad4,9"));
          v4 = (int64x2_t)xmmword_100060B80;
          if ((v9 & 1) != 0)
            goto LABEL_6;
          v17 = xmmword_100060B90;
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
      v17 = xmmword_100060B50;
      if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad5,3")) & 1) == 0)
      {
        v10 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad5,4"));
        v4 = (int64x2_t)xmmword_100060B50;
        if ((v10 & 1) != 0)
          goto LABEL_6;
        v17 = xmmword_100060B60;
        if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad5,1"), COERCE_DOUBLE(22)) & 1) == 0)
        {
          v7 = CFSTR("iPad5,2");
          goto LABEL_70;
        }
      }
    }
    else if (objc_msgSend(v19, "hasPrefix:", CFSTR("iPad6,")))
    {
      v17 = xmmword_100060B20;
      if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad6,3")) & 1) == 0)
      {
        v11 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad6,4"));
        v4 = (int64x2_t)xmmword_100060B20;
        if ((v11 & 1) != 0)
          goto LABEL_6;
        v17 = xmmword_100060B30;
        if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad6,7"), COERCE_DOUBLE(24)) & 1) == 0)
        {
          v12 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad6,8"));
          v4 = (int64x2_t)xmmword_100060B30;
          if ((v12 & 1) != 0)
            goto LABEL_6;
          v17 = xmmword_100060B40;
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
      v17 = xmmword_100060AF0;
      if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad7,1")) & 1) == 0)
      {
        v14 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad7,2"));
        v4 = (int64x2_t)xmmword_100060AF0;
        if ((v14 & 1) != 0)
          goto LABEL_6;
        v17 = xmmword_100060B00;
        if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad7,3"), COERCE_DOUBLE(28)) & 1) == 0)
        {
          v15 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad7,4"));
          v4 = (int64x2_t)xmmword_100060B00;
          if ((v15 & 1) != 0)
            goto LABEL_6;
          v17 = xmmword_100060B10;
          if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPad7,5"), COERCE_DOUBLE(27)) & 1) == 0)
          {
            v16 = objc_msgSend(v19, "hasPrefix:", CFSTR("iPad7,6"));
            v4 = (int64x2_t)xmmword_100060B10;
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
  self->_deviceType = CRLCapabilitiesDeviceTypeFromHWModelString(v19);

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
    block[2] = sub_10000B1E4;
    block[3] = &unk_100071A88;
    v4 = v2;
    v7 = v4;
    if (qword_100085AA0 != -1)
      dispatch_once(&qword_100085AA0, block);
    -[CRLCapabilities p_setupPlatform](v4, "p_setupPlatform");
    -[CRLCapabilities p_setupDevice](v4, "p_setupDevice");

  }
  return v3;
}

+ (CRLCapabilities)currentCapabilities
{
  if (qword_100085AB0 != -1)
    dispatch_once(&qword_100085AB0, &stru_100071AA8);
  return (CRLCapabilities *)(id)qword_100085AB8;
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
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100071AC8);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004E3F8();
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100071AE8);
    v6 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004DEE8(v6);
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
      if (CRLAssertCat_init_token != -1)
        dispatch_once(&CRLAssertCat_init_token, &stru_100071B08);
      if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
        sub_10004E478();
      if (CRLAssertCat_init_token != -1)
        dispatch_once(&CRLAssertCat_init_token, &stru_100071B28);
      v5 = CRLAssertCat_log_t;
      if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
        sub_10004DEE8(v5);
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
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100071B48);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004E4F8();
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100071B68);
    v6 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004DEE8(v6);
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
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100071B88);
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004E578();
    if (CRLAssertCat_init_token != -1)
      dispatch_once(&CRLAssertCat_init_token, &stru_100071BA8);
    v4 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
      sub_10004DEE8(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCapabilities metalCapabilitiesForDevice:]"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLCapabilities.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 438, 0, "invalid nil value for '%{public}s'", "device");

  }
  if (qword_100085AC8 != -1)
    dispatch_once(&qword_100085AC8, &stru_100071BC8);
  v7 = (CRLMetalDeviceCapabilities *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100085AC0, "objectForKey:", v3));
  if (!v7)
  {
    v7 = -[CRLMetalDeviceCapabilities initWithDevice:]([CRLMetalDeviceCapabilities alloc], "initWithDevice:", v3);
    objc_msgSend((id)qword_100085AC0, "setObject:forKey:", v7, v3);
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
  return byte_100085AA8;
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
  block[2] = sub_10000BBC4;
  block[3] = &unk_100071A88;
  block[4] = self;
  if (qword_100085AD8 != -1)
    dispatch_once(&qword_100085AD8, block);
  return byte_100085AD0;
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
