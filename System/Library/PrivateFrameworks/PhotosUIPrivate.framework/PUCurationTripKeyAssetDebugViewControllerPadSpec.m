@implementation PUCurationTripKeyAssetDebugViewControllerPadSpec

- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v24.receiver = self;
  v24.super_class = (Class)PUCurationTripKeyAssetDebugViewControllerPadSpec;
  v10 = a3;
  -[PUPhotosGridViewControllerPadSpec configureCollectionViewGridLayout:forWidth:safeAreaInsets:](&v24, sel_configureCollectionViewGridLayout_forWidth_safeAreaInsets_, v10, a4, top, left, bottom, right);
  objc_msgSend(v10, "sectionContentInset", v24.receiver, v24.super_class);
  v12 = v11;
  v14 = v13;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bounds");
  v17 = v16;

  v18 = 3;
  if (v17 < a4)
    v18 = 4;
  v19 = 17.0;
  if (v17 < a4)
    v19 = 10.0;
  v20 = a4 - (v12 + v14);
  v21 = (double)(v18 - 1);
  v22 = floor((v20 - v21 * v19) / (double)v18);
  v23 = floor((v20 - v22 * (double)v18) / v21);
  objc_msgSend(v10, "setItemSize:", v22, v22);
  objc_msgSend(v10, "setInterItemSpacing:", v23, 48.0);

}

@end
