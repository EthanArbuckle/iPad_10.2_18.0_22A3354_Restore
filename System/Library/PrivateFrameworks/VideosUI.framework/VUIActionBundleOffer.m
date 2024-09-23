@implementation VUIActionBundleOffer

- (VUIActionBundleOffer)initWithContextData:(id)a3
{
  id v4;
  VUIActionBundleOffer *v5;
  uint64_t v6;
  NSString *offerURLString;
  uint64_t v8;
  NSString *offerDomain;
  uint64_t v10;
  NSString *notificationTitle;
  uint64_t v12;
  NSString *notificationBundleTitle;
  uint64_t v14;
  NSString *notificationBody;
  uint64_t v16;
  NSDictionary *offerMetrics;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)VUIActionBundleOffer;
  v5 = -[VUIActionBundleOffer init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("offerURL"));
    v6 = objc_claimAutoreleasedReturnValue();
    offerURLString = v5->_offerURLString;
    v5->_offerURLString = (NSString *)v6;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("offerDomain"));
    v8 = objc_claimAutoreleasedReturnValue();
    offerDomain = v5->_offerDomain;
    v5->_offerDomain = (NSString *)v8;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("notificationTitle"));
    v10 = objc_claimAutoreleasedReturnValue();
    notificationTitle = v5->_notificationTitle;
    v5->_notificationTitle = (NSString *)v10;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("notificationBundleTitle"));
    v12 = objc_claimAutoreleasedReturnValue();
    notificationBundleTitle = v5->_notificationBundleTitle;
    v5->_notificationBundleTitle = (NSString *)v12;

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("notificationBody"));
    v14 = objc_claimAutoreleasedReturnValue();
    notificationBody = v5->_notificationBody;
    v5->_notificationBody = (NSString *)v14;

    objc_msgSend(v4, "vui_dictionaryForKey:", CFSTR("metricsDictionary"));
    v16 = objc_claimAutoreleasedReturnValue();
    offerMetrics = v5->_offerMetrics;
    v5->_offerMetrics = (NSDictionary *)v16;

    v5->_isMultiOfferDynamicVC = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("isMultiOfferDynamicVC"), 0);
  }

  return v5;
}

- (BOOL)isAccountRequired
{
  return 1;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSString *notificationTitle;
  NSString *offerDomain;
  NSString *notificationBundleTitle;
  NSString *notificationBody;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *offerMetrics;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25;
  const __CFString *v26;
  NSDictionary *v27;
  _QWORD v28[5];
  _QWORD v29[6];

  v29[5] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", self->_offerURLString);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __69__VUIActionBundleOffer_performWithTargetResponder_completionHandler___block_invoke;
    v24 = &unk_1E9F98E18;
    v25 = v5;
    v7 = _Block_copy(&v21);
    notificationTitle = self->_notificationTitle;
    v28[0] = CFSTR("notificationTitle");
    v28[1] = CFSTR("offerDomain");
    offerDomain = self->_offerDomain;
    notificationBundleTitle = self->_notificationBundleTitle;
    v29[0] = notificationTitle;
    v29[1] = offerDomain;
    notificationBody = self->_notificationBody;
    v28[2] = CFSTR("notificationBundleTitle");
    v28[3] = CFSTR("notificationBody");
    v29[2] = notificationBundleTitle;
    v29[3] = notificationBody;
    v28[4] = CFSTR("isMultiOfferDynamicVC");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isMultiOfferDynamicVC, v21, v22, v23, v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v29[4] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_offerMetrics)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      offerMetrics = self->_offerMetrics;
      v26 = CFSTR("metricsDictionary");
      v27 = offerMetrics;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addEntriesFromDictionary:", v16);

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v14);
      v17 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v17;
    }
    +[VUIInterfaceFactory sharedInstance](VUIInterfaceFactory, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "openURLHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "processNonDeeplinkURL:contextData:completion:", v6, v13, v7);

  }
  else
  {
    VUIDefaultLogObject();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[VUIActionBundleOffer performWithTargetResponder:completionHandler:].cold.1(v20);

    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

uint64_t __69__VUIActionBundleOffer_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t result;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  VUIDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_1D96EE000, v4, OS_LOG_TYPE_DEFAULT, "VUIActionBundleOffer - BundleOffer:: Action completed with success:%d", (uint8_t *)v6, 8u);
  }

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (NSString)offerURLString
{
  return self->_offerURLString;
}

- (void)setOfferURLString:(id)a3
{
  objc_storeStrong((id *)&self->_offerURLString, a3);
}

- (NSString)offerDomain
{
  return self->_offerDomain;
}

- (void)setOfferDomain:(id)a3
{
  objc_storeStrong((id *)&self->_offerDomain, a3);
}

- (NSString)notificationTitle
{
  return self->_notificationTitle;
}

- (void)setNotificationTitle:(id)a3
{
  objc_storeStrong((id *)&self->_notificationTitle, a3);
}

- (NSString)notificationBundleTitle
{
  return self->_notificationBundleTitle;
}

- (void)setNotificationBundleTitle:(id)a3
{
  objc_storeStrong((id *)&self->_notificationBundleTitle, a3);
}

- (NSString)notificationBody
{
  return self->_notificationBody;
}

- (void)setNotificationBody:(id)a3
{
  objc_storeStrong((id *)&self->_notificationBody, a3);
}

- (BOOL)isMultiOfferDynamicVC
{
  return self->_isMultiOfferDynamicVC;
}

- (void)setIsMultiOfferDynamicVC:(BOOL)a3
{
  self->_isMultiOfferDynamicVC = a3;
}

- (NSString)secondaryOfferNotificationTitle
{
  return self->_secondaryOfferNotificationTitle;
}

- (void)setSecondaryOfferNotificationTitle:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryOfferNotificationTitle, a3);
}

- (NSString)secondaryOfferNotificationBody
{
  return self->_secondaryOfferNotificationBody;
}

- (void)setSecondaryOfferNotificationBody:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryOfferNotificationBody, a3);
}

- (NSDictionary)offerMetrics
{
  return self->_offerMetrics;
}

- (void)setOfferMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_offerMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offerMetrics, 0);
  objc_storeStrong((id *)&self->_secondaryOfferNotificationBody, 0);
  objc_storeStrong((id *)&self->_secondaryOfferNotificationTitle, 0);
  objc_storeStrong((id *)&self->_notificationBody, 0);
  objc_storeStrong((id *)&self->_notificationBundleTitle, 0);
  objc_storeStrong((id *)&self->_notificationTitle, 0);
  objc_storeStrong((id *)&self->_offerDomain, 0);
  objc_storeStrong((id *)&self->_offerURLString, 0);
}

- (void)performWithTargetResponder:(os_log_t)log completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUIActionBundleOffer - BundleOffer:: No offer url", v1, 2u);
}

@end
