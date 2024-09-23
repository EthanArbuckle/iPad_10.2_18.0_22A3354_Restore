@implementation MGWrapper

+ (id)sharedMGWrapper
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MGWrapper_sharedMGWrapper__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedMGWrapper_onceToken != -1)
    dispatch_once(&sharedMGWrapper_onceToken, block);
  return (id)sharedMGWrapper_sharedMGWrapper;
}

void __28__MGWrapper_sharedMGWrapper__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedMGWrapper_sharedMGWrapper;
  sharedMGWrapper_sharedMGWrapper = (uint64_t)v1;

}

- (id)deviceClass
{
  return (id)MGCopyAnswer();
}

- (BOOL)isDeviceIPad
{
  void *v2;
  char v3;

  -[MGWrapper deviceClass](self, "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPad"));

  return v3;
}

- (BOOL)isDeviceIPhone
{
  void *v2;
  char v3;

  -[MGWrapper deviceClass](self, "deviceClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone"));

  return v3;
}

@end
