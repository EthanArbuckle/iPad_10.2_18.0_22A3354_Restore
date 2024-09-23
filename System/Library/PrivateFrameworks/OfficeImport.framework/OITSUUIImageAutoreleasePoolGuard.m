@implementation OITSUUIImageAutoreleasePoolGuard

- (OITSUUIImageAutoreleasePoolGuard)initWithUIImage:(id)a3
{
  OITSUUIImageAutoreleasePoolGuard *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)OITSUUIImageAutoreleasePoolGuard;
  result = -[OITSUUIImageAutoreleasePoolGuard init](&v5, sel_init);
  if (result)
    result->mImage = (UIImage *)a3;
  return result;
}

- (void)dealloc
{
  UIImage *mImage;
  objc_super v4;
  _QWORD v5[5];

  mImage = self->mImage;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__OITSUUIImageAutoreleasePoolGuard_dealloc__block_invoke;
  v5[3] = &__block_descriptor_40_e5_v8__0l;
  v5[4] = mImage;
  +[OITSUUIImage i_performBlockWithUIImageLock:](OITSUUIImage, "i_performBlockWithUIImageLock:", v5);
  v4.receiver = self;
  v4.super_class = (Class)OITSUUIImageAutoreleasePoolGuard;
  -[OITSUUIImageAutoreleasePoolGuard dealloc](&v4, sel_dealloc);
}

void __43__OITSUUIImageAutoreleasePoolGuard_dealloc__block_invoke(uint64_t a1)
{

}

@end
