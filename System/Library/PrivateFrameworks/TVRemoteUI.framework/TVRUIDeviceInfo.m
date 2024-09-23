@implementation TVRUIDeviceInfo

+ (TVRUIDeviceInfo)currentDeviceInfo
{
  return (TVRUIDeviceInfo *)objc_alloc_init((Class)a1);
}

- (TVRUIDeviceInfo)init
{
  TVRUIDeviceInfo *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVRUIDeviceInfo;
  result = -[TVRUIDeviceInfo init](&v4, sel_init);
  if (result)
  {
    result->_volumeButtonHeight = 0.0;
    v3 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    result->_volumeButtonsRect.origin = (CGPoint)*MEMORY[0x24BDBF090];
    result->_volumeButtonsRect.size = v3;
  }
  return result;
}

- (BOOL)isPad
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == 1;

  return v3;
}

- (BOOL)hasHomeButton
{
  if (hasHomeButton_onceToken != -1)
    dispatch_once(&hasHomeButton_onceToken, &__block_literal_global_8);
  return hasHomeButton_hasHomeButton;
}

uint64_t __32__TVRUIDeviceInfo_hasHomeButton__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  hasHomeButton_hasHomeButton = (_DWORD)result != 2;
  return result;
}

- (id)hardwareInfoForOrientation:(int64_t)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;

  -[TVRUIDeviceInfo _userIntentButtonRect](self, "_userIntentButtonRect", a3);
  v27 = v5;
  v28 = v4;
  v25 = v7;
  v26 = v6;
  -[TVRUIDeviceInfo _volumeUpButtonRect](self, "_volumeUpButtonRect");
  v24 = v8;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[TVRUIDeviceInfo _volumeDownButtonRect](self, "_volumeDownButtonRect");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[TVRUIDeviceInfo volumeButtonsRect](self, "volumeButtonsRect");
  return -[TVRUIDeviceHardwareInfo initWithUserIntentButton:volumeUpButton:volumeDownButton:volumeTotalHeight:]([TVRUIDeviceHardwareInfo alloc], "initWithUserIntentButton:volumeUpButton:volumeDownButton:volumeTotalHeight:", v28, v27, v26, v25, v24, v10, v12, v14, v16, v18, v20, v22, CGRectGetHeight(v29));
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUIDeviceInfo isPad](self, "isPad"), CFSTR("isPad"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUIDeviceInfo hasHomeButton](self, "hasHomeButton"), CFSTR("hasHomeButton"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)_volumeUpButtonRect
{
  double v3;
  double v4;
  CGFloat MinY;
  CGFloat Width;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect v13;
  CGRect result;

  -[TVRUIDeviceInfo _readPlistForParametersIfNeeded](self, "_readPlistForParametersIfNeeded");
  -[TVRUIDeviceInfo _volumeButtonsX](self, "_volumeButtonsX");
  v4 = v3;
  -[TVRUIDeviceInfo volumeButtonsRect](self, "volumeButtonsRect");
  MinY = CGRectGetMinY(v12);
  -[TVRUIDeviceInfo volumeButtonsRect](self, "volumeButtonsRect");
  Width = CGRectGetWidth(v13);
  -[TVRUIDeviceInfo volumeButtonHeight](self, "volumeButtonHeight");
  v8 = v7;
  v9 = v4;
  v10 = MinY;
  v11 = Width;
  result.size.height = v8;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CGRect)_volumeDownButtonRect
{
  double v3;
  double v4;
  double MaxY;
  double v6;
  double v7;
  CGFloat Width;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect result;

  -[TVRUIDeviceInfo _readPlistForParametersIfNeeded](self, "_readPlistForParametersIfNeeded");
  -[TVRUIDeviceInfo _volumeButtonsX](self, "_volumeButtonsX");
  v4 = v3;
  -[TVRUIDeviceInfo volumeButtonsRect](self, "volumeButtonsRect");
  MaxY = CGRectGetMaxY(v14);
  -[TVRUIDeviceInfo volumeButtonHeight](self, "volumeButtonHeight");
  v7 = MaxY - v6;
  -[TVRUIDeviceInfo volumeButtonsRect](self, "volumeButtonsRect");
  Width = CGRectGetWidth(v15);
  -[TVRUIDeviceInfo volumeButtonHeight](self, "volumeButtonHeight");
  v10 = v9;
  v11 = v4;
  v12 = v7;
  v13 = Width;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_userIntentButtonRect
{
  NSObject *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;
  CGRect result;

  v11 = *MEMORY[0x24BDAC8D0];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__TVRUIDeviceInfo__userIntentButtonRect__block_invoke;
  block[3] = &unk_24DE2C198;
  block[4] = self;
  if (_userIntentButtonRect_onceToken != -1)
    dispatch_once(&_userIntentButtonRect_onceToken, block);
  _TVRUIDeviceInfoLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromCGRect(*(CGRect *)_userIntentButtonRect_frame);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_21B042000, v2, OS_LOG_TYPE_DEFAULT, "Power button frame - %@", buf, 0xCu);

  }
  v5 = *(double *)&_userIntentButtonRect_frame[8];
  v4 = *(double *)_userIntentButtonRect_frame;
  v6 = *(double *)&_userIntentButtonRect_frame[16];
  v7 = *(double *)&_userIntentButtonRect_frame[24];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

void __40__TVRUIDeviceInfo__userIntentButtonRect__block_invoke(uint64_t a1)
{
  const __CFData *v2;
  const __CFData *v3;
  CFTypeID v4;
  __int128 *BytePtr;
  __int128 v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  float v16;
  double v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  double v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  float Height;
  float Width;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v2 = (const __CFData *)MGCopyAnswer();
  if (v2)
  {
    v3 = v2;
    v4 = CFGetTypeID(v2);
    if (v4 == CFDataGetTypeID())
    {
      BytePtr = (__int128 *)CFDataGetBytePtr(v3);
      v6 = BytePtr[1];
      _userIntentButtonRect_frame = *BytePtr;
      *(_OWORD *)&qword_25513D6B0 = v6;
    }
    CFRelease(v3);
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_referenceBounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v35.origin.x = v9;
    v35.origin.y = v11;
    v35.size.width = v13;
    v35.size.height = v15;
    v16 = CGRectGetWidth(v35) * *(double *)&_userIntentButtonRect_frame;
    v17 = floorf(v16);
    v36.origin.x = v9;
    v36.origin.y = v11;
    v36.size.width = v13;
    v36.size.height = v15;
    v18 = CGRectGetHeight(v36) * *((double *)&_userIntentButtonRect_frame + 1);
    v19 = floorf(v18);
    v37.origin.x = v9;
    v37.origin.y = v11;
    v37.size.width = v13;
    v37.size.height = v15;
    v20 = CGRectGetWidth(v37) * *(double *)&qword_25513D6B0;
    v21 = floorf(v20);
    v38.origin.x = v9;
    v38.origin.y = v11;
    v38.size.width = v13;
    v38.size.height = v15;
    v22 = CGRectGetHeight(v38) * *(double *)&qword_25513D6B8;
    v23 = floorf(v22);
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "hasHomeButton"))
      return;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "_referenceBounds");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;

    v39.origin.x = v26;
    v39.origin.y = v28;
    v39.size.width = v30;
    v39.size.height = v32;
    Height = CGRectGetHeight(v39);
    v19 = floorf(Height);
    v40.origin.x = v26;
    v40.origin.y = v28;
    v40.size.width = v30;
    v40.size.height = v32;
    Width = CGRectGetWidth(v40);
    v21 = floorf(Width);
    v17 = 0.0;
    v23 = 0.0;
  }
  *(double *)&_userIntentButtonRect_frame = v17;
  *((double *)&_userIntentButtonRect_frame + 1) = v19;
  *(double *)&qword_25513D6B0 = v21;
  qword_25513D6B8 = *(_QWORD *)&v23;
}

- (double)_volumeButtonsX
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  -[TVRUIDeviceInfo volumeButtonsRect](self, "volumeButtonsRect");
  if (CGRectGetWidth(v13) <= 0.0)
  {
    -[TVRUIDeviceInfo volumeButtonsRect](self, "volumeButtonsRect");
    if (CGRectGetMinX(v15) <= 0.0)
    {
      return 0.0;
    }
    else
    {
      -[TVRUIDeviceInfo volumeButtonsRect](self, "volumeButtonsRect");
      return CGRectGetMinX(v16);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v14.origin.x = v5;
    v14.origin.y = v7;
    v14.size.width = v9;
    v14.size.height = v11;
    return CGRectGetWidth(v14);
  }
}

- (void)_readPlistForParametersIfNeeded
{
  OUTLINED_FUNCTION_0_0(&dword_21B042000, a1, a3, "Error loading HardwareInfo plist", a5, a6, a7, a8, 0);
}

- (id)_volumeButtonsDictionaryForSpecificHardware
{
  double v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v9;
  const __CFString *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  if (_volumeButtonsDictionaryForSpecificHardware_onceToken != -1)
    dispatch_once(&_volumeButtonsDictionaryForSpecificHardware_onceToken, &__block_literal_global_24);
  v3 = 0;
  if (_volumeButtonsDictionaryForSpecificHardware_productType <= 2722529671)
  {
    if (_volumeButtonsDictionaryForSpecificHardware_productType > 1434404432)
    {
      if (_volumeButtonsDictionaryForSpecificHardware_productType > 2159747552)
      {
        if (_volumeButtonsDictionaryForSpecificHardware_productType != 2159747553)
        {
          if (_volumeButtonsDictionaryForSpecificHardware_productType == 2309863438)
          {
            v9 = CFSTR("volumeButtonHeight");
            LODWORD(v2) = 1115815936;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
            v5 = objc_claimAutoreleasedReturnValue();
            v6 = (void *)v5;
            v10 = CFSTR("volumeButtonsRect");
            v7 = CFSTR("{{0,221},{0,151}}");
            goto LABEL_43;
          }
          return v3;
        }
      }
      else
      {
        if (_volumeButtonsDictionaryForSpecificHardware_productType == 1434404433)
        {
          v9 = CFSTR("volumeButtonHeight");
          LODWORD(v2) = 1115684864;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
          v5 = objc_claimAutoreleasedReturnValue();
          v6 = (void *)v5;
          v10 = CFSTR("volumeButtonsRect");
          v7 = CFSTR("{{0,218},{0,152}}");
          goto LABEL_43;
        }
        if (_volumeButtonsDictionaryForSpecificHardware_productType != 2078329141)
          return v3;
      }
      v9 = CFSTR("volumeButtonHeight");
      LODWORD(v2) = 1115684864;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      v10 = CFSTR("volumeButtonsRect");
      v7 = CFSTR("{{0,79},{0,145}}");
      goto LABEL_43;
    }
    if (_volumeButtonsDictionaryForSpecificHardware_productType > 746003605)
    {
      if (_volumeButtonsDictionaryForSpecificHardware_productType != 746003606)
      {
        v4 = 1060988941;
        goto LABEL_27;
      }
LABEL_35:
      v9 = CFSTR("volumeButtonHeight");
      LODWORD(v2) = 1112276992;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      v10 = CFSTR("volumeButtonsRect");
      v7 = CFSTR("{{0,52},{1,114}}");
      goto LABEL_43;
    }
    if (_volumeButtonsDictionaryForSpecificHardware_productType != 133314240)
    {
      if (_volumeButtonsDictionaryForSpecificHardware_productType != 689804742)
        return v3;
      v9 = CFSTR("volumeButtonHeight");
      LODWORD(v2) = 1115160576;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      v10 = CFSTR("volumeButtonsRect");
      v7 = CFSTR("{{0,220},{0,155}}");
      goto LABEL_43;
    }
LABEL_36:
    v9 = CFSTR("volumeButtonHeight");
    LODWORD(v2) = 1116471296;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v10 = CFSTR("volumeButtonsRect");
    v7 = CFSTR("{{0,227},{0,147}}");
    goto LABEL_43;
  }
  if (_volumeButtonsDictionaryForSpecificHardware_productType <= 3585085678)
  {
    if (_volumeButtonsDictionaryForSpecificHardware_productType <= 2941181570)
    {
      if (_volumeButtonsDictionaryForSpecificHardware_productType == 2722529672)
      {
        v9 = CFSTR("volumeButtonHeight");
        LODWORD(v2) = 1115160576;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = (void *)v5;
        v10 = CFSTR("volumeButtonsRect");
        v7 = CFSTR("{{0,170},{0,144}}");
        goto LABEL_43;
      }
      if (_volumeButtonsDictionaryForSpecificHardware_productType != 2793418701)
        return v3;
      v9 = CFSTR("volumeButtonHeight");
      LODWORD(v2) = 1115684864;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      v10 = CFSTR("volumeButtonsRect");
      v7 = CFSTR("{{0,226},{0,150}}");
LABEL_43:
      v11[0] = v5;
      v11[1] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v9, 2);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return v3;
    }
    if (_volumeButtonsDictionaryForSpecificHardware_productType != 2941181571)
    {
      if (_volumeButtonsDictionaryForSpecificHardware_productType == 3054476161)
      {
        v9 = CFSTR("volumeButtonHeight");
        LODWORD(v2) = 1112276992;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = (void *)v5;
        v10 = CFSTR("volumeButtonsRect");
        v7 = CFSTR("{{0,170},{1,114}}");
        goto LABEL_43;
      }
      return v3;
    }
    goto LABEL_36;
  }
  if (_volumeButtonsDictionaryForSpecificHardware_productType <= 3743999267)
  {
    if (_volumeButtonsDictionaryForSpecificHardware_productType == 3585085679)
    {
      v9 = CFSTR("volumeButtonHeight");
      LODWORD(v2) = 1115815936;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      v10 = CFSTR("volumeButtonsRect");
      v7 = CFSTR("{{0,219},{0,151}}");
      goto LABEL_43;
    }
    if (_volumeButtonsDictionaryForSpecificHardware_productType != 3677894691)
      return v3;
    goto LABEL_35;
  }
  if (_volumeButtonsDictionaryForSpecificHardware_productType == 3743999268)
  {
    v9 = CFSTR("volumeButtonHeight");
    LODWORD(v2) = 1115160576;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v10 = CFSTR("volumeButtonsRect");
    v7 = CFSTR("{{0,152},{0,140}}");
    goto LABEL_43;
  }
  if (_volumeButtonsDictionaryForSpecificHardware_productType == 3825599860)
  {
    v9 = CFSTR("volumeButtonHeight");
    LODWORD(v2) = 1115684864;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v10 = CFSTR("volumeButtonsRect");
    v7 = CFSTR("{{0,224},{0,148}}");
    goto LABEL_43;
  }
  v4 = 3885279870;
LABEL_27:
  if (_volumeButtonsDictionaryForSpecificHardware_productType == v4)
  {
    v9 = CFSTR("volumeButtonHeight");
    LODWORD(v2) = 1116209152;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v2);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v10 = CFSTR("volumeButtonsRect");
    v7 = CFSTR("{{0,184},{0,156}}");
    goto LABEL_43;
  }
  return v3;
}

uint64_t __62__TVRUIDeviceInfo__volumeButtonsDictionaryForSpecificHardware__block_invoke()
{
  uint64_t result;

  result = MGGetProductType();
  _volumeButtonsDictionaryForSpecificHardware_productType = result;
  return result;
}

- (double)volumeButtonHeight
{
  return self->_volumeButtonHeight;
}

- (void)setVolumeButtonHeight:(double)a3
{
  self->_volumeButtonHeight = a3;
}

- (CGRect)volumeButtonsRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_volumeButtonsRect.origin.x;
  y = self->_volumeButtonsRect.origin.y;
  width = self->_volumeButtonsRect.size.width;
  height = self->_volumeButtonsRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setVolumeButtonsRect:(CGRect)a3
{
  self->_volumeButtonsRect = a3;
}

@end
