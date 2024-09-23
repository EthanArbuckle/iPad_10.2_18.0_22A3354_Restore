@implementation SCROStealthBrailleDisplay

+ (id)displayWithDelegate:(id)a3
{
  id v3;
  SCROBrailleStealthDriver *v4;
  id v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(SCROBrailleStealthDriver);
  if (v4)
  {
    v5 = -[SCROBrailleDisplay _initWithDriver:driverIdentifier:ioElement:delegate:]([SCROStealthBrailleDisplay alloc], "_initWithDriver:driverIdentifier:ioElement:delegate:", v4, CFSTR("com.apple.scrod.braille.driver.stealth"), 0, v3);
    v6 = v5;
    if (v5)
      objc_msgSend(v5, "_delayedDisplayLoad");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5
{
  id v7;
  void *v8;

  v7 = a5;
  if (a3 || !objc_msgSend(a4, "isEqualToString:", CFSTR("com.apple.scrod.braille.driver.stealth")))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "displayWithDelegate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (void)_mainDisplayHandler:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;
  _QWORD v7[2];

  v4 = a3;
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v7[0] = 0;
    v7[1] = 0;
    if ((objc_msgSend(v5, "getRange:ofAttribute:", v7, kSCROTokenAttribute[0]) & 1) != 0
      || objc_msgSend(v5, "getRange:ofAttribute:", v7, kSCROAlertAttribute[0]))
    {
      v6.receiver = self;
      v6.super_class = (Class)SCROStealthBrailleDisplay;
      -[SCROStealthBrailleDisplay _mainDisplayHandler:](&v6, sel__mainDisplayHandler_, v4);
    }
  }

}

- (int)token
{
  return -1;
}

@end
