@implementation SFUIActivityImageRequest

- (SFUIActivityImageRequest)initWithRequestID:(int)a3 identifier:(id)a4 activityCategory:(int64_t)a5 contentSizeCategory:(id)a6 iconFormat:(int)a7 synchronous:(BOOL)a8 resultHandler:(id)a9
{
  _BOOL8 v9;
  uint64_t v14;
  id v16;
  SFUIActivityImageRequest *v17;
  SFUIActivityImageRequest *v18;
  objc_super v20;

  v9 = a8;
  v14 = *(_QWORD *)&a3;
  v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SFUIActivityImageRequest;
  v17 = -[SFUIImageRequest initWithRequestID:identifier:synchronous:resultHandler:](&v20, sel_initWithRequestID_identifier_synchronous_resultHandler_, v14, a4, v9, a9);
  v18 = v17;
  if (v17)
  {
    v17->_activityCategory = a5;
    objc_storeStrong((id *)&v17->_contentSizeCategory, a6);
    v18->_iconFormat = a7;
  }

  return v18;
}

- (SFUIActivityImageRequest)initWithRequestID:(int)a3 activity:(id)a4 contentSizeCategory:(id)a5 imageSymbolConfiguration:(id)a6 synchronous:(BOOL)a7 resultHandler:(id)a8
{
  _BOOL8 v9;
  uint64_t v13;
  id v15;
  id v16;
  void *v17;
  void *v18;
  SFUIActivityImageRequest *v19;
  id obj;
  id v22;
  id v23;
  objc_super v24;

  v9 = a7;
  v13 = *(_QWORD *)&a3;
  v15 = a4;
  v23 = a5;
  obj = a6;
  v22 = a6;
  v16 = a8;
  objc_msgSend(v15, "activityUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)SFUIActivityImageRequest;
  v19 = -[SFUIImageRequest initWithRequestID:identifier:synchronous:resultHandler:](&v24, sel_initWithRequestID_identifier_synchronous_resultHandler_, v13, v18, v9, v16);

  if (v19)
  {
    objc_storeStrong((id *)&v19->_activity, a4);
    objc_storeStrong((id *)&v19->_contentSizeCategory, a5);
    objc_storeStrong((id *)&v19->_imageSymbolConfiguration, obj);
  }

  return v19;
}

- (int64_t)activityCategory
{
  return self->_activityCategory;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (int)iconFormat
{
  return self->_iconFormat;
}

- (UIActivity)activity
{
  return self->_activity;
}

- (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  return self->_imageSymbolConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageSymbolConfiguration, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
}

@end
