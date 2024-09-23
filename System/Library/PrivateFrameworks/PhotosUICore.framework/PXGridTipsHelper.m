@implementation PXGridTipsHelper

+ (NSString)curatedLibrarySwitchTipID
{
  return +[PXGridTipsHelper_Swift curatedLibrarySwitchTipID](PXGridTipsHelper_Swift, "curatedLibrarySwitchTipID");
}

+ (NSString)syndicatedAssetsTipID
{
  return +[PXGridTipsHelper_Swift syndicatedAssetsTipID](PXGridTipsHelper_Swift, "syndicatedAssetsTipID");
}

+ (void)setTip:(id)a3 isPresentable:(BOOL)a4
{
  +[PXGridTipsHelper_Swift setTip:isPresentable:](PXGridTipsHelper_Swift, "setTip:isPresentable:", a3, a4);
}

+ (void)setTipsPresentationDelegate:(id)a3
{
  +[PXGridTipsHelper_Swift setTipsPresentationDelegate:](PXGridTipsHelper_Swift, "setTipsPresentationDelegate:", a3);
}

+ (NSString)filterAllPhotosTipID
{
  return +[PXGridTipsHelper_Swift filterAllPhotosTipID](PXGridTipsHelper_Swift, "filterAllPhotosTipID");
}

+ (void)setTipActionPerformed:(id)a3
{
  +[PXGridTipsHelper_Swift setTipActionPerformed:](PXGridTipsHelper_Swift, "setTipActionPerformed:", a3);
}

+ (void)updatePopoverTip:(id)a3 sourceRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  id v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  +[PXGridTipsHelper_Swift shared](PXGridTipsHelper_Swift, "shared");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updatePopoverTip:sourceRect:", v8, x, y, width, height);

}

@end
