@implementation SVXAFAudioPowerUpdaterProvider

- (id)createWithProvider:(id)a3 queue:(id)a4 frequency:(int64_t)a5 delegate:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = (objc_class *)MEMORY[0x24BE090F8];
  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend([v9 alloc], "initWithProvider:queue:frequency:delegate:", v12, v11, a5, v10);

  return v13;
}

@end
