@implementation VKDataScannerViewControllerBridge

- (VKDataScannerViewControllerBridge)init
{
  VKDataScannerViewControllerBridge *v2;
  void *v3;
  id v4;
  id v6;
  id location;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)VKDataScannerViewControllerBridge;
  v2 = -[VKDataScannerViewControllerBridge init](&v8, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    v9[0] = CFSTR("cameraRestriction");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v6, &location);
    v2->_notificationToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __41__VKDataScannerViewControllerBridge_init__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cameraRestrictedDidChange:", WeakRetained);

}

- (void)dealloc
{
  objc_super v3;

  MGCancelNotifications();
  -[VKDataScannerViewControllerBridge endSession](self, "endSession");
  v3.receiver = self;
  v3.super_class = (Class)VKDataScannerViewControllerBridge;
  -[VKDataScannerViewControllerBridge dealloc](&v3, sel_dealloc);
}

+ (BOOL)isCameraRestricted
{
  return (MGGetBoolAnswer() & 1) != 0 || +[VKAVCapture authorizationStatus]() == 2;
}

+ (BOOL)isOpticalFlowForTextEnabled
{
  int v2;

  v2 = vk_supportsOpticalFlowTracking();
  if (v2)
    LOBYTE(v2) = !vk_isInternalBuild()
              || +[VKCInternalSettings isOpticalFlowForTextEnabled](VKCInternalSettings, "isOpticalFlowForTextEnabled");
  return v2;
}

- (void)beginSessionForText:(BOOL)a3 barcodes:(BOOL)a4
{
  NSDate *v7;
  NSDate *sessionStartDate;

  if (!self->_sessionStartDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    sessionStartDate = self->_sessionStartDate;
    self->_sessionStartDate = v7;

    self->_isScanningForText = a3;
    self->_isScanningForBarcodes = a4;
  }
}

- (void)endSession
{
  void *v3;
  double v4;
  double v5;
  VKAnalyticsProcessor *v6;
  NSDate *sessionStartDate;
  VKAnalyticsDataScannerEvent *v8;

  if (self->_sessionStartDate)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", self->_sessionStartDate);
    v5 = v4;

    v8 = -[VKAnalyticsDataScannerEvent initWithFeedDuration:scannedForText:scannedForBarcodes:customIdentifier:]([VKAnalyticsDataScannerEvent alloc], "initWithFeedDuration:scannedForText:scannedForBarcodes:customIdentifier:", self->_isScanningForText, self->_isScanningForBarcodes, 0, v5);
    if (!-[VKAnalyticsDataScannerEvent isHealth](v8, "isHealth"))
    {
      v6 = objc_alloc_init(VKAnalyticsProcessor);
      -[VKAnalyticsProcessor setIsPublicAPI:](v6, "setIsPublicAPI:", 1);
      -[VKAnalyticsProcessor processAndSendEvent:](v6, "processAndSendEvent:", v8);

    }
    sessionStartDate = self->_sessionStartDate;
    self->_sessionStartDate = 0;

  }
}

- (VKDataScannerViewControllerBridgeDelegate)delegate
{
  return (VKDataScannerViewControllerBridgeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
}

@end
