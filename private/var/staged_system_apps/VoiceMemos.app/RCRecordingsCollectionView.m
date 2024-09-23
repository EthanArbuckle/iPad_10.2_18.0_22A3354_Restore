@implementation RCRecordingsCollectionView

- (RCRecordingsCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  RCRecordingsCollectionView *v4;
  RCRecordingsCollectionView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RCRecordingsCollectionView;
  v4 = -[RCRecordingsCollectionView initWithFrame:collectionViewLayout:](&v7, "initWithFrame:collectionViewLayout:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
    -[RCRecordingsCollectionView _styleView](v4, "_styleView");
  return v5;
}

- (void)_styleView
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "recordingsCollectionViewBackgroundColor"));
  if (v3)
  {
    -[RCRecordingsCollectionView setBackgroundColor:](self, "setBackgroundColor:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RCRecordingsCollectionView backgroundView](self, "backgroundView"));
    objc_msgSend(v4, "setBackgroundColor:", v3);

  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  return 0;
}

@end
