@implementation STKSoundFactory

+ (id)soundForOptions:(id)a3
{
  uint64_t v4;
  id v5;
  const void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  uint64_t v12;

  v4 = *MEMORY[0x24BDC2E48];
  v5 = a3;
  v6 = (const void *)objc_msgSend(v5, "bs_safeStringForKey:", v4);
  objc_msgSend(v5, "bs_safeNumberForKey:", *MEMORY[0x24BDC2E78]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  if (!v6)
    goto LABEL_28;
  if (!CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDC2EC0]) && !CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDC2EB0]))
  {
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDC2E50]))
    {
      v11 = a1;
      v12 = 1070;
LABEL_27:
      objc_msgSend(v11, "soundForSystemSoundID:duration:", v12, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      return v10;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDC2E68]))
    {
      v11 = a1;
      v12 = 1071;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDC2EA8]))
    {
      v11 = a1;
      v12 = 1072;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDC2E80]))
    {
      v11 = a1;
      v12 = 1073;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDC2E60]))
    {
      v11 = a1;
      v12 = 1074;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDC2E70]))
    {
      v11 = a1;
      v12 = 1075;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDC2E58]))
    {
      v11 = a1;
      v12 = 1051;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDC2E88]))
    {
      v11 = a1;
      v12 = 1052;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDC2EA0]))
    {
      v11 = a1;
      v12 = 1054;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDC2E90]))
    {
      v11 = a1;
      v12 = 1053;
      goto LABEL_27;
    }
    if (CFEqual(v6, (CFTypeRef)*MEMORY[0x24BDC2EB8]))
    {
      v11 = a1;
      v12 = 1055;
      goto LABEL_27;
    }
LABEL_28:
    v10 = 0;
    return v10;
  }
  objc_msgSend(a1, "soundForRingToneWithDuration:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  return v10;
}

+ (id)soundForRingToneWithDuration:(double)a3
{
  return -[STKToneAlertSound initWithType:duration:]([STKToneAlertSound alloc], "initWithType:duration:", 1, a3);
}

+ (id)class0SMSSound
{
  return -[STKToneAlertSound initWithType:duration:]([STKToneAlertSound alloc], "initWithType:duration:", 2, 0.0);
}

+ (id)soundForSystemSoundID:(unsigned int)a3 duration:(double)a4
{
  return -[STKSystemSound initForSystemSoundID:duration:]([STKSystemSound alloc], "initForSystemSoundID:duration:", *(_QWORD *)&a3, a4);
}

@end
