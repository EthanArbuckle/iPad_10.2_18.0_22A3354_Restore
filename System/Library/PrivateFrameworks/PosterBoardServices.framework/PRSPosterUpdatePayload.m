@implementation PRSPosterUpdatePayload

+ (id)nullPayload
{
  return -[PRSPosterUpdatePayload _init]([PRSPosterUpdatePayload alloc], "_init");
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRSPosterUpdatePayload;
  return -[PRSPosterUpdatePayload init](&v3, sel_init);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)rawValue
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E38], "null");
}

@end
