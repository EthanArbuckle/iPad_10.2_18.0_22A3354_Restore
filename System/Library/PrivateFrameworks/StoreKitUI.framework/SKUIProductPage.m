@implementation SKUIProductPage

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        -[SKUIProductPage copyWithZone:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v13, "setDefaultPageFragment:", self->_defaultPageFragment);
  objc_msgSend(v13, "setItem:", self->_item);
  objc_msgSend(v13, "setITMLData:", self->_itmlData);
  objc_msgSend(v13, "setITMLResponse:", self->_itmlResponse);
  objc_msgSend(v13, "setMetricsConfiguration:", self->_metricsConfiguration);
  objc_msgSend(v13, "setMetricsPageDescription:", self->_metricsPageDescription);
  objc_msgSend(v13, "setPageURL:", self->_pageURL);
  objc_msgSend(v13, "setProductInformation:", self->_productInformation);
  objc_msgSend(v13, "setRelatedContentSwooshes:", self->_relatedContentSwooshes);
  objc_msgSend(v13, "setReviewConfiguration:", self->_reviewConfiguration);
  objc_msgSend(v13, "setUber:", self->_uber);
  return v13;
}

- (int64_t)defaultPageFragment
{
  return self->_defaultPageFragment;
}

- (void)setDefaultPageFragment:(int64_t)a3
{
  self->_defaultPageFragment = a3;
}

- (SKUIProductPageItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (NSData)ITMLData
{
  return self->_itmlData;
}

- (void)setITMLData:(id)a3
{
  objc_storeStrong((id *)&self->_itmlData, a3);
}

- (NSHTTPURLResponse)ITMLResponse
{
  return self->_itmlResponse;
}

- (void)setITMLResponse:(id)a3
{
  objc_storeStrong((id *)&self->_itmlResponse, a3);
}

- (SSMetricsConfiguration)metricsConfiguration
{
  return self->_metricsConfiguration;
}

- (void)setMetricsConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_metricsConfiguration, a3);
}

- (NSString)metricsPageDescription
{
  return self->_metricsPageDescription;
}

- (void)setMetricsPageDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)pageURL
{
  return self->_pageURL;
}

- (void)setPageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SKUIProductPageProductInfo)productInformation
{
  return self->_productInformation;
}

- (void)setProductInformation:(id)a3
{
  objc_storeStrong((id *)&self->_productInformation, a3);
}

- (NSArray)relatedContentSwooshes
{
  return self->_relatedContentSwooshes;
}

- (void)setRelatedContentSwooshes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SKUIReviewConfiguration)reviewConfiguration
{
  return self->_reviewConfiguration;
}

- (void)setReviewConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_reviewConfiguration, a3);
}

- (SKUIUber)uber
{
  return self->_uber;
}

- (void)setUber:(id)a3
{
  objc_storeStrong((id *)&self->_uber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uber, 0);
  objc_storeStrong((id *)&self->_reviewConfiguration, 0);
  objc_storeStrong((id *)&self->_relatedContentSwooshes, 0);
  objc_storeStrong((id *)&self->_productInformation, 0);
  objc_storeStrong((id *)&self->_pageURL, 0);
  objc_storeStrong((id *)&self->_metricsPageDescription, 0);
  objc_storeStrong((id *)&self->_metricsConfiguration, 0);
  objc_storeStrong((id *)&self->_itmlResponse, 0);
  objc_storeStrong((id *)&self->_itmlData, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (void)copyWithZone:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end
