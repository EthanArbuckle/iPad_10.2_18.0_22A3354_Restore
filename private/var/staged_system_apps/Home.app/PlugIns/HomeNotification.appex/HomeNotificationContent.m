@implementation HomeNotificationContent

- (HomeNotificationContent)initWithMode:(unint64_t)a3
{
  HomeNotificationContent *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HomeNotificationContent;
  result = -[HomeNotificationContent init](&v5, "init");
  if (result)
    result->_mode = a3;
  return result;
}

+ (id)contentWithSpinner
{
  return -[HomeNotificationContent initWithMode:]([HomeNotificationContent alloc], "initWithMode:", 0);
}

+ (id)contentWithSnapshot:(id)a3 loadingStream:(BOOL)a4 actionResultText:(id)a5 errorContent:(id)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  id v11;
  HomeNotificationContent *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v7 = a4;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = -[HomeNotificationContent initWithMode:]([HomeNotificationContent alloc], "initWithMode:", 1);
  -[HomeNotificationContent setCameraSource:](v12, "setCameraSource:", v11);

  if (v7)
  {
    v13 = HomeNotificationBundle(-[HomeNotificationContent setStatusDisplayStyle:](v12, "setStatusDisplayStyle:", 1));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("HONStreamStatusLoading"), &stru_100019150, CFSTR("HONLocalizable")));
    -[HomeNotificationContent setStatusText:](v12, "setStatusText:", v15);

  }
  else
  {
    -[HomeNotificationContent setStatusDisplayStyle:](v12, "setStatusDisplayStyle:", 0);
  }
  -[HomeNotificationContent setActionResultText:](v12, "setActionResultText:", v10);

  -[HomeNotificationContent setErrorContent:](v12, "setErrorContent:", v9);
  return v12;
}

+ (id)contentWithStream:(id)a3 microphoneMuted:(BOOL)a4 actionResultText:(id)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  HomeNotificationContent *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  BOOL v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v9 = -[HomeNotificationContent initWithMode:]([HomeNotificationContent alloc], "initWithMode:", 2);
  -[HomeNotificationContent setCameraSource:](v9, "setCameraSource:", v8);

  v11 = HomeNotificationBundle(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  v14 = !v5;
  if (v5)
    v15 = CFSTR("HONMicrophoneStatusOff");
  else
    v15 = CFSTR("HONMicrophoneStatusOn");
  if (v5)
    v16 = CFSTR("microphoneDisabled");
  else
    v16 = CFSTR("microphoneEnabled");
  if (v14)
    v17 = 2;
  else
    v17 = 1;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v15, &stru_100019150, CFSTR("HONLocalizable")));
  -[HomeNotificationContent setStatusText:](v9, "setStatusText:", v18);

  -[HomeNotificationContent setStatusDisplayStyle:](v9, "setStatusDisplayStyle:", v17);
  v19 = HUImageNamed(v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  -[HomeNotificationContent setStatusAccessoryImage:](v9, "setStatusAccessoryImage:", v20);

  -[HomeNotificationContent setActionResultText:](v9, "setActionResultText:", v7);
  return v9;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (HMCameraSource)cameraSource
{
  return self->_cameraSource;
}

- (void)setCameraSource:(id)a3
{
  objc_storeStrong((id *)&self->_cameraSource, a3);
}

- (UIImage)statusAccessoryImage
{
  return self->_statusAccessoryImage;
}

- (void)setStatusAccessoryImage:(id)a3
{
  objc_storeStrong((id *)&self->_statusAccessoryImage, a3);
}

- (unint64_t)statusDisplayStyle
{
  return self->_statusDisplayStyle;
}

- (void)setStatusDisplayStyle:(unint64_t)a3
{
  self->_statusDisplayStyle = a3;
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (HUCameraErrorContent)errorContent
{
  return self->_errorContent;
}

- (void)setErrorContent:(id)a3
{
  objc_storeStrong((id *)&self->_errorContent, a3);
}

- (NSString)actionResultText
{
  return self->_actionResultText;
}

- (void)setActionResultText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionResultText, 0);
  objc_storeStrong((id *)&self->_errorContent, 0);
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_statusAccessoryImage, 0);
  objc_storeStrong((id *)&self->_cameraSource, 0);
}

@end
