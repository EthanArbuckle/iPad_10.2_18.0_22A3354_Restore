@implementation PXOneUpTipsHelper

+ (NSString)livePhotosTipID
{
  return +[PXOneUpTipsHelper_Swift livePhotosTipID](PXOneUpTipsHelper_Swift, "livePhotosTipID");
}

+ (NSString)infoPanelTipID
{
  return +[PXOneUpTipsHelper_Swift infoPanelTipID](PXOneUpTipsHelper_Swift, "infoPanelTipID");
}

+ (NSString)syndicatedPhotosTipID
{
  return +[PXOneUpTipsHelper_Swift syndicatedPhotosTipID](PXOneUpTipsHelper_Swift, "syndicatedPhotosTipID");
}

+ (NSString)actionsMenuTipID
{
  return +[PXOneUpTipsHelper_Swift actionsMenuTipID](PXOneUpTipsHelper_Swift, "actionsMenuTipID");
}

+ (NSString)quickCropTipID
{
  return +[PXOneUpTipsHelper_Swift quickCropTipID](PXOneUpTipsHelper_Swift, "quickCropTipID");
}

+ (void)setTipsPresentationDelegate:(id)a3
{
  +[PXOneUpTipsHelper_Swift setTipsPresentationDelegate:](PXOneUpTipsHelper_Swift, "setTipsPresentationDelegate:", a3);
}

+ (void)setTip:(id)a3 isPresentable:(BOOL)a4
{
  +[PXOneUpTipsHelper_Swift setTip:isPresentable:](PXOneUpTipsHelper_Swift, "setTip:isPresentable:", a3, a4);
}

+ (void)setTipActionPerformed:(id)a3
{
  +[PXOneUpTipsHelper_Swift setTipActionPerformed:](PXOneUpTipsHelper_Swift, "setTipActionPerformed:", a3);
}

+ (void)signalOneUpPhotoOpened
{
  +[PXOneUpTipsHelper_Swift signalOneUpPhotoOpened](PXOneUpTipsHelper_Swift, "signalOneUpPhotoOpened");
}

+ (void)signalSyndicatedPhotosPresented
{
  +[PXOneUpTipsHelper_Swift signalSyndicatedPhotosPresented](PXOneUpTipsHelper_Swift, "signalSyndicatedPhotosPresented");
}

+ (void)signalDidQuickCrop
{
  +[PXOneUpTipsHelper_Swift signalDidQuickCrop](PXOneUpTipsHelper_Swift, "signalDidQuickCrop");
}

@end
