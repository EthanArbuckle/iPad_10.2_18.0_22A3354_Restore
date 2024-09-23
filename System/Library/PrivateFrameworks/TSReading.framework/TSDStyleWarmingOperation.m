@implementation TSDStyleWarmingOperation

- (TSDStyleWarmingOperation)initWithStyle:(id)a3 property:(int)a4 accessController:(id)a5
{
  TSDStyleWarmingOperation *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSDStyleWarmingOperation;
  result = -[TSDStyleWarmingOperation init](&v9, sel_init);
  if (result)
  {
    result->mStyle = (TSSStyle *)a3;
    result->mProperty = a4;
    result->mAccessController = (TSKAccessController *)a5;
  }
  return result;
}

- (void)main
{
  -[TSKAccessController performRead:withTarget:argument:](self->mAccessController, "performRead:withTarget:argument:", sel_warm, self, 0);
}

- (void)warm
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[TSSStyle valueForProperty:](self->mStyle, "valueForProperty:", self->mProperty);
  v3 = (void *)TSUDynamicCast();
  if (v3)
  {
    v4 = (void *)objc_msgSend(v3, "imageData");
    v5 = (void *)MEMORY[0x219A15874]();
    objc_msgSend(v4, "NSData");
    objc_autoreleasePoolPop(v5);
  }
}

@end
