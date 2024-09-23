@implementation OBDevice

+ (id)currentDevice
{
  if (currentDevice_onceToken != -1)
    dispatch_once(&currentDevice_onceToken, &__block_literal_global_1);
  return (id)currentDevice_currentDevice;
}

uint64_t __25__OBDevice_currentDevice__block_invoke()
{
  OBDevice *v0;
  void *v1;
  const __CFString *v2;
  uint64_t v3;
  int v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v0 = objc_alloc_init(OBDevice);
  v1 = (void *)currentDevice_currentDevice;
  currentDevice_currentDevice = (uint64_t)v0;

  v2 = (const __CFString *)MGGetStringAnswer();
  if (CFStringCompare(v2, CFSTR("iPad"), 0))
    v3 = 1;
  else
    v3 = 2;
  objc_msgSend((id)currentDevice_currentDevice, "setType:", v3);
  if (v2)
    CFRelease(v2);
  v4 = MGGetSInt32Answer();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  if (objc_msgSend((id)currentDevice_currentDevice, "type") == 1)
  {
    switch(v4)
    {
      case 5:
        v10 = (void *)currentDevice_currentDevice;
        v11 = 5;
        goto LABEL_19;
      case 8:
      case 9:
      case 22:
        v10 = (void *)currentDevice_currentDevice;
        v11 = 4;
        goto LABEL_19;
      case 10:
        v10 = (void *)currentDevice_currentDevice;
        v11 = 3;
        goto LABEL_19;
      case 15:
      case 19:
      case 24:
      case 30:
      case 36:
        v10 = (void *)currentDevice_currentDevice;
        goto LABEL_15;
      case 18:
      case 25:
      case 31:
      case 37:
        v10 = (void *)currentDevice_currentDevice;
        if (v7 < 414.0 || v9 < 896.0)
LABEL_15:
          v11 = 2;
        else
          v11 = 1;
        goto LABEL_19;
      default:
        return objc_msgSend((id)currentDevice_currentDevice, "setHasHomeButton:", MGGetSInt32Answer() != 2);
    }
  }
  v10 = (void *)currentDevice_currentDevice;
  v11 = 6;
LABEL_19:
  objc_msgSend(v10, "setTemplateType:", v11);
  return objc_msgSend((id)currentDevice_currentDevice, "setHasHomeButton:", MGGetSInt32Answer() != 2);
}

- (unint64_t)templateTypeForBoundsWidth:(double)a3
{
  if (a3 <= 320.0)
    return 7;
  if (a3 >= 744.0)
    return 6;
  if (a3 >= 414.0)
    return 9;
  return 8;
}

- (BOOL)isMiniPad
{
  BOOL v2;
  uint64_t v3;
  uint64_t v4;

  v2 = 1;
  v3 = MGGetProductType();
  if (v3 > 2903084587)
  {
    if (v3 == 2903084588)
      return v2;
    v4 = 3184375231;
  }
  else
  {
    if (v3 == 88647037)
      return v2;
    v4 = 1895344378;
  }
  if (v3 != v4)
    return 0;
  return v2;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)templateType
{
  return self->_templateType;
}

- (void)setTemplateType:(unint64_t)a3
{
  self->_templateType = a3;
}

- (BOOL)hasHomeButton
{
  return self->_hasHomeButton;
}

- (void)setHasHomeButton:(BOOL)a3
{
  self->_hasHomeButton = a3;
}

@end
