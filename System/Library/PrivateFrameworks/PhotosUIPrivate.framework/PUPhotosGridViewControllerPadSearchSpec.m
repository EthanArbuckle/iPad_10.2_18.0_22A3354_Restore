@implementation PUPhotosGridViewControllerPadSearchSpec

- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v10;
  objc_super v11;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v11.receiver = self;
  v11.super_class = (Class)PUPhotosGridViewControllerPadSearchSpec;
  v10 = a3;
  -[PUPhotosGridViewControllerPadSpec configureCollectionViewGridLayout:forWidth:safeAreaInsets:](&v11, sel_configureCollectionViewGridLayout_forWidth_safeAreaInsets_, v10, a4, top, left, bottom, right);
  objc_msgSend(v10, "setSectionTopPadding:", 0.0, v11.receiver, v11.super_class);
  objc_msgSend(v10, "setGlobalTopPadding:", 0.0);

}

@end
