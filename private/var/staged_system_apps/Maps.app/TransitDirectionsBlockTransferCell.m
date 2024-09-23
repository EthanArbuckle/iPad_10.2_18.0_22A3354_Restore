@implementation TransitDirectionsBlockTransferCell

+ (Class)stepViewClass
{
  return (Class)objc_opt_class(0x101473000, a2);
}

- (void)configureWithItem:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TransitDirectionsBlockTransferCell;
  -[TransitDirectionsCell configureWithItem:](&v3, "configureWithItem:", a3);
}

@end
