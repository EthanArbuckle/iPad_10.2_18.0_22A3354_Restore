@implementation _PXSnapshottableImageView

- (id)snapshotViewAfterScreenUpdates:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_PXSnapshottableImageView;
  -[_PXSnapshottableImageView snapshotViewAfterScreenUpdates:](&v4, sel_snapshotViewAfterScreenUpdates_, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
