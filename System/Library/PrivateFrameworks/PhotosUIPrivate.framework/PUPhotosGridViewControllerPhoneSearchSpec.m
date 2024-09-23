@implementation PUPhotosGridViewControllerPhoneSearchSpec

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
  double v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;

  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v28.receiver = self;
  v28.super_class = (Class)PUPhotosGridViewControllerPhoneSearchSpec;
  v11 = a3;
  -[PUPhotosGridViewControllerPhoneSpec configureCollectionViewGridLayout:forWidth:safeAreaInsets:](&v28, sel_configureCollectionViewGridLayout_forWidth_safeAreaInsets_, v11, a4, top, left, bottom, right);
  -[PUPhotosGridViewControllerPhoneSpec gridContentInsets](self, "gridContentInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = a4 - v14 - v18;
  v21 = objc_msgSend(MEMORY[0x1E0D7B560], "photosGridLayoutColumnsForWidth:", v20);
  v26 = 0.0;
  v27 = 0.0;
  v22 = (void *)MEMORY[0x1E0D7B560];
  if (PUMainScreenScale_onceToken != -1)
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_32103);
  objc_msgSend(v22, "bestItemSizeForAvailableWidth:screenScale:columns:bestSpacing:bestInset:", v21, &v27, &v26, v20, *(double *)&PUMainScreenScale_screenScale);
  v23 = v27;
  v24 = v15 + v26;
  v25 = v19 + v26;
  objc_msgSend(v11, "setItemSize:");
  objc_msgSend(v11, "setInterItemSpacing:", v23, v23);
  objc_msgSend(v11, "setSectionContentInset:", v13, v24, v17, v25);
  objc_msgSend(v11, "setSectionTopPadding:", 0.0);
  objc_msgSend(v11, "setGlobalTopPadding:", 0.0);
  objc_msgSend(v11, "setGlobalBottomPadding:", 4.0);
  objc_msgSend(v11, "setCropType:", 0);
  objc_msgSend(v11, "setCropAmount:", 0.0);

}

@end
