@implementation PXCloudQuotaBannerView

- (PXCloudQuotaBannerView)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaView.m"), 104, CFSTR("%s is not available as initializer"), "-[PXCloudQuotaBannerView init]");

  abort();
}

- (PXCloudQuotaBannerView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaView.m"), 108, CFSTR("%s is not available as initializer"), "-[PXCloudQuotaBannerView initWithFrame:]");

  abort();
}

- (PXCloudQuotaBannerView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaView.m"), 112, CFSTR("%s is not available as initializer"), "-[PXCloudQuotaBannerView initWithCoder:]");

  abort();
}

- (PXCloudQuotaBannerView)initWithContentView:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaView.m"), 116, CFSTR("%s is not available as initializer"), "-[PXCloudQuotaBannerView initWithContentView:]");

  abort();
}

- (PXCloudQuotaBannerView)initWithBannerView:(id)a3
{
  id v6;
  PXCloudQuotaBannerView *v7;
  PXCloudQuotaBannerView *v8;
  void *v9;
  uint64_t v10;
  NSDate *lastUpdatedDate;
  void *v13;
  objc_super v14;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCloudQuotaView.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bannerView"));

  }
  v14.receiver = self;
  v14.super_class = (Class)PXCloudQuotaBannerView;
  v7 = -[PXCloudQuotaView initWithContentView:](&v14, sel_initWithContentView_, v6);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_bannerView, a3);
    objc_msgSend(v6, "offer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v9, "lastUpdated");
      v10 = objc_claimAutoreleasedReturnValue();
      lastUpdatedDate = v8->_lastUpdatedDate;
      v8->_lastUpdatedDate = (NSDate *)v10;

    }
    v8->_offerType = objc_msgSend(v9, "offerType");

  }
  return v8;
}

- (UIFont)contentViewFont
{
  return (UIFont *)-[ICQBannerView font](self->_bannerView, "font");
}

- (CGSize)contentViewSizeForWidth:(double)a3
{
  double v3;
  double v4;
  CGSize result;

  -[ICQBannerView sizeThatFits:](self->_bannerView, "sizeThatFits:", a3, 1.79769313e308);
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (int64_t)offerType
{
  return self->_offerType;
}

- (void)setOfferType:(int64_t)a3
{
  self->_offerType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
}

@end
