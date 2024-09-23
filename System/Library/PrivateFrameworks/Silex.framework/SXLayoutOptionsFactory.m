@implementation SXLayoutOptionsFactory

- (SXLayoutOptionsFactory)initWithColumnCalculator:(id)a3 documentProvider:(id)a4
{
  id v7;
  id v8;
  SXLayoutOptionsFactory *v9;
  SXLayoutOptionsFactory *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXLayoutOptionsFactory;
  v9 = -[SXLayoutOptionsFactory init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_columnCalculator, a3);
    objc_storeStrong((id *)&v10->_documentProvider, a4);
  }

  return v10;
}

- (id)createLayoutOptionsWithViewportSize:(CGSize)a3 safeAreaInsets:(UIEdgeInsets)a4 traitCollection:(id)a5 bundleSubscriptionStatus:(int64_t)a6 channelSubscriptionStatus:(int64_t)a7 contentSizeCategory:(id)a8 testing:(BOOL)a9 viewingLocation:(unint64_t)a10 contentScaleFactor:(double)a11 newsletterSubscriptionStatus:(unint64_t)a12 offerUpsellScenario:(int64_t)a13 subscriptionActivationEligibility:(int64_t)a14 smartInvertColorsEnabled:(BOOL)a15 conditionKeys:(id)a16
{
  double right;
  double left;
  double height;
  double width;
  NSString *v23;
  NSString *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  SXLayoutOptions *v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSString *v38;
  void *v40;
  NSObject *v41;
  NSString *v42;
  uint64_t v43;
  _BOOL4 v47;
  uint8_t buf[4];
  NSString *v49;
  uint64_t v50;
  CGSize v51;

  v47 = a9;
  right = a4.right;
  left = a4.left;
  height = a3.height;
  width = a3.width;
  v50 = *MEMORY[0x24BDAC8D0];
  v23 = (NSString *)a5;
  v24 = (NSString *)a8;
  v25 = a16;
  -[SXLayoutOptionsFactory documentProvider](self, "documentProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "document");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "layout");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    v35 = (void *)SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v35;
      -[SXLayoutOptionsFactory documentProvider](self, "documentProvider");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "document");
      v38 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v49 = v38;
      _os_log_impl(&dword_217023000, v36, OS_LOG_TYPE_DEFAULT, "Unable to create LayoutOptions, missing document layout for document: %@", buf, 0xCu);

    }
    goto LABEL_19;
  }
  if (!v23
    || !-[NSString horizontalSizeClass](v23, "horizontalSizeClass")
    || !-[NSString verticalSizeClass](v23, "verticalSizeClass")
    || !-[NSString userInterfaceStyle](v23, "userInterfaceStyle"))
  {
    v33 = SXLayoutLog;
    if (!os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
LABEL_19:
      v32 = 0;
      goto LABEL_20;
    }
    *(_DWORD *)buf = 138412290;
    v49 = v23;
    v34 = "Unable to create LayoutOptions, invalid trait collection %@";
LABEL_16:
    _os_log_impl(&dword_217023000, v33, OS_LOG_TYPE_DEFAULT, v34, buf, 0xCu);
    goto LABEL_19;
  }
  if (!v24 || UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x24BDF76C0], v24) == NSOrderedSame)
  {
    v33 = SXLayoutLog;
    if (!os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
      goto LABEL_19;
    *(_DWORD *)buf = 138412290;
    v49 = v24;
    v34 = "Unable to create LayoutOptions, unspecified content size category %@";
    goto LABEL_16;
  }
  v29 = *MEMORY[0x24BDBF148] == width;
  if (*(double *)(MEMORY[0x24BDBF148] + 8) != height)
    v29 = 0;
  if (width < 2.22044605e-16 || v29 || height < 2.22044605e-16)
  {
    v40 = (void *)SXLayoutLog;
    if (os_log_type_enabled((os_log_t)SXLayoutLog, OS_LOG_TYPE_DEFAULT))
    {
      v41 = v40;
      v51.width = width;
      v51.height = height;
      NSStringFromCGSize(v51);
      v42 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v49 = v42;
      _os_log_impl(&dword_217023000, v41, OS_LOG_TYPE_DEFAULT, "Unable to create LayoutOptions, invalid viewport size: %{public}@", buf, 0xCu);

    }
    goto LABEL_19;
  }
  -[SXLayoutOptionsFactory columnCalculator](self, "columnCalculator");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "columnLayoutWithViewportSize:constrainedToWidth:documentLayout:contentScaleFactor:", v28, width, height, width - (left + right), a11);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v43) = a15;
  v32 = -[SXLayoutOptions initWithColumnLayout:viewportSize:traitCollection:contentSizeCategory:bundleSubscriptionStatus:channelSubscriptionStatus:testing:viewingLocation:contentScaleFactor:newsletterSubscriptionStatus:offerUpsellScenario:subscriptionActivationEligibility:smartInvertColorsEnabled:conditionKeys:]([SXLayoutOptions alloc], "initWithColumnLayout:viewportSize:traitCollection:contentSizeCategory:bundleSubscriptionStatus:channelSubscriptionStatus:testing:viewingLocation:contentScaleFactor:newsletterSubscriptionStatus:offerUpsellScenario:subscriptionActivationEligibility:smartInvertColorsEnabled:conditionKeys:", v31, v23, v24, a6, a7, v47, width, height, a11, a10, a12, a13, a14, v43, v25);

LABEL_20:
  return v32;
}

- (SXColumnCalculator)columnCalculator
{
  return self->_columnCalculator;
}

- (SXDocumentProvider)documentProvider
{
  return self->_documentProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentProvider, 0);
  objc_storeStrong((id *)&self->_columnCalculator, 0);
}

@end
