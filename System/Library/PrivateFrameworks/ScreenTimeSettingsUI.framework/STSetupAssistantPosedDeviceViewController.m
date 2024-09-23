@implementation STSetupAssistantPosedDeviceViewController

- (STSetupAssistantPosedDeviceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  STSetupAssistantPosedDeviceViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSetupAssistantPosedDeviceViewController;
  v4 = -[STSetupAssistantPosedDeviceViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, a3, a4);
  -[STSetupAssistantPosedDeviceViewController _stSetupAssistantPosedDeviceViewControllerCommonInit](v4, "_stSetupAssistantPosedDeviceViewControllerCommonInit");
  return v4;
}

- (STSetupAssistantPosedDeviceViewController)initWithCoder:(id)a3
{
  STSetupAssistantPosedDeviceViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STSetupAssistantPosedDeviceViewController;
  v3 = -[STSetupAssistantPosedDeviceViewController initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[STSetupAssistantPosedDeviceViewController _stSetupAssistantPosedDeviceViewControllerCommonInit](v3, "_stSetupAssistantPosedDeviceViewControllerCommonInit");
  return v3;
}

- (void)_stSetupAssistantPosedDeviceViewControllerCommonInit
{
  const __CFString *v3;
  int v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (const __CFString *)MGGetStringAnswer();
  self->_isiPad = CFStringCompare(v3, CFSTR("iPad"), 0) == kCFCompareEqualTo;
  if (v3)
    CFRelease(v3);
  v4 = MGGetSInt32Answer();
  self->_deviceSize = 0;
  v5 = 1;
  switch(v4)
  {
    case 9:
      goto LABEL_10;
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 16:
    case 17:
      goto LABEL_11;
    case 15:
      v5 = 3;
      goto LABEL_10;
    case 18:
      v5 = 4;
      goto LABEL_10;
    case 19:
      v5 = 5;
      goto LABEL_10;
    case 20:
      v5 = 6;
      goto LABEL_10;
    default:
      if (v4 != 5)
        goto LABEL_11;
      v5 = 2;
LABEL_10:
      self->_deviceSize = v5;
LABEL_11:
      v6 = 6;
      v7 = MGGetProductType();
      if (v7 <= 2080700390)
      {
        if (v7 <= 1371389548)
        {
          if (v7 == 341800273)
            goto LABEL_27;
          v8 = 1353145733;
          goto LABEL_21;
        }
        if (v7 != 1371389549)
        {
          v8 = 2001966017;
LABEL_21:
          if (v7 != v8)
            return;
          goto LABEL_27;
        }
        goto LABEL_25;
      }
      if (v7 <= 3599094682)
      {
        if (v7 == 2080700391)
        {
          v6 = 7;
          goto LABEL_27;
        }
        if (v7 != 2722529672)
          return;
LABEL_25:
        v6 = 8;
        goto LABEL_27;
      }
      if (v7 != 3599094683 && v7 != 3801472101)
      {
        v8 = 3863625342;
        goto LABEL_21;
      }
LABEL_27:
      self->_deviceSize = v6;
      return;
  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSetupAssistantPosedDeviceViewController;
  -[STSetupAssistantPosedDeviceViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[STSetupAssistantPosedDeviceViewController _deviceWithScreenImage](self, "_deviceWithScreenImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSetupAssistantPosedDeviceViewController deviceWithScreenImageView](self, "deviceWithScreenImageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v3);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STSetupAssistantPosedDeviceViewController.viewDidLoad", v5, 2u);
  }
}

- (id)_deviceWithScreenImage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BEBD640];
  -[STSetupAssistantPosedDeviceViewController _setupGenericImage](self, "_setupGenericImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageNamed:inBundle:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_setupGenericImage
{
  _BOOL4 v3;
  int64_t v4;

  v3 = -[STSetupAssistantPosedDeviceViewController isiPad](self, "isiPad");
  v4 = -[STSetupAssistantPosedDeviceViewController deviceSize](self, "deviceSize");
  if (v3)
  {
    if (v4 == 6)
      return CFSTR("Setup Image Ipad Pro");
    else
      return CFSTR("Setup Image Ipad");
  }
  else if ((unint64_t)(v4 - 1) > 7)
  {
    return CFSTR("Setup Image Iphone 7");
  }
  else
  {
    return off_24DB87C48[v4 - 1];
  }
}

- (BOOL)_isRTL
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x24BEBDB00];
  -[STSetupAssistantPosedDeviceViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v3, "semanticContentAttribute")) == 1;

  return (char)v2;
}

- (BOOL)isiPad
{
  return self->_isiPad;
}

- (int64_t)deviceSize
{
  return self->_deviceSize;
}

- (UIImageView)deviceWithScreenImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 984, 1);
}

- (void)setDeviceWithScreenImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 984);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceWithScreenImageView, 0);
}

@end
