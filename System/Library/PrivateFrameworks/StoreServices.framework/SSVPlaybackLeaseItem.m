@implementation SSVPlaybackLeaseItem

- (id)assetForFlavor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSVPlaybackLeaseItem;
  -[SSVPlaybackItem assetForFlavor:](&v4, sel_assetForFlavor_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
