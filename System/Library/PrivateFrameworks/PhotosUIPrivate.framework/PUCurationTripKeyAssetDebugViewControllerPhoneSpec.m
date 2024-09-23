@implementation PUCurationTripKeyAssetDebugViewControllerPhoneSpec

- (void)configureCollectionViewGridLayout:(id)a3 forWidth:(double)a4 safeAreaInsets:(UIEdgeInsets)a5
{
  double right;
  double bottom;
  double left;
  double top;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  objc_super v27;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v27.receiver = self;
  v27.super_class = (Class)PUCurationTripKeyAssetDebugViewControllerPhoneSpec;
  v11 = a3;
  -[PUPhotosGridViewControllerPhoneSpec configureCollectionViewGridLayout:forWidth:safeAreaInsets:](&v27, sel_configureCollectionViewGridLayout_forWidth_safeAreaInsets_, v11, a4, top, left, bottom, right);
  -[PUPhotosGridViewControllerPhoneSpec gridContentInsets](self, "gridContentInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v25 = 0.0;
  v26 = 0.0;
  v20 = (void *)MEMORY[0x1E0D7B560];
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  objc_msgSend(v20, "bestItemSizeForAvailableWidth:screenScale:columns:bestSpacing:bestInset:", 3, &v26, &v25, a4 - v15 - v19, *(double *)&PUMainScreenScale_screenScale);
  v21 = v26;
  v22 = v26 + 35.0;
  v23 = v15 + v25;
  v24 = v19 + v25;
  objc_msgSend(v11, "setItemSize:");
  objc_msgSend(v11, "setInterItemSpacing:", v21, v22);
  objc_msgSend(v11, "setSectionContentInset:", v13, v23, v17, v24);

}

@end
