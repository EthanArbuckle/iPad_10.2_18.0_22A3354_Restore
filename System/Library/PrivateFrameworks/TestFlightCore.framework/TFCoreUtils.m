@implementation TFCoreUtils

+ (id)tf_screenshotInstructionImageDict
{
  int v3;
  void *v4;
  const __CFString **v5;
  const __CFString **v6;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(a1, "tf_deviceHasFaceID");
  if (objc_msgSend(MEMORY[0x24BE08118], "deviceIsiPad"))
  {
    if (v3)
    {
      v16 = CFSTR("TFScreenshotInstructionDeviceImageKey");
      v17[0] = CFSTR("ipad-face-id");
      v4 = (void *)MEMORY[0x24BDBCE70];
      v5 = (const __CFString **)v17;
      v6 = &v16;
    }
    else
    {
      v14 = CFSTR("TFScreenshotInstructionDeviceImageKey");
      v15 = CFSTR("ipad-touch-id");
      v4 = (void *)MEMORY[0x24BDBCE70];
      v5 = &v15;
      v6 = &v14;
    }
  }
  else if (objc_msgSend(a1, "tf_deviceHasTopPowerButton"))
  {
    v12 = CFSTR("TFScreenshotInstructionDeviceImageKey");
    v13 = CFSTR("iphone-touch-id-top-power");
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = &v13;
    v6 = &v12;
  }
  else if (v3)
  {
    v10 = CFSTR("TFScreenshotInstructionDeviceImageKey");
    v11 = CFSTR("iphone-face-id");
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = &v11;
    v6 = &v10;
  }
  else
  {
    v8 = CFSTR("TFScreenshotInstructionDeviceImageKey");
    v9 = CFSTR("iphone-touch-id");
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = &v9;
    v6 = &v8;
  }
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v5, v6, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)tf_deviceHasFaceID
{
  if (tf_deviceHasFaceID_onceToken != -1)
    dispatch_once(&tf_deviceHasFaceID_onceToken, &__block_literal_global_5);
  return tf_deviceHasFaceID_hasFaceID;
}

uint64_t __33__TFCoreUtils_tf_deviceHasFaceID__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  tf_deviceHasFaceID_hasFaceID = result;
  return result;
}

+ (BOOL)tf_deviceHasTopPowerButton
{
  void *v2;
  char v3;
  char v4;

  objc_msgSend(MEMORY[0x24BE08118], "productType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsString:", CFSTR("iPhone8,4"));
  v4 = v3 | objc_msgSend(v2, "containsString:", CFSTR("iPod"));

  return v4;
}

@end
