@implementation _UISystemBannerRequest

- (_UISystemBannerRequest)init
{
  _UISystemBannerRequest *v2;
  _UISystemBannerRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISystemBannerRequest;
  v2 = -[_UISystemBannerRequest init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_UISystemBannerRequest setBannerTimeoutDuration:](v2, "setBannerTimeoutDuration:", 2.5);
  return v3;
}

- (void)verifyParameters
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  -[_UISystemBannerRequest primaryTitleText](self, "primaryTitleText");
  v4 = objc_claimAutoreleasedReturnValue();

  -[_UISystemBannerRequest secondaryTitleText](self, "secondaryTitleText");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v4 | v5;

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISystemBannerRequest.m"), 34, CFSTR("System banner request must contain some text"));

  }
}

- (void)postBanner
{
  _UIOverlayService *v3;
  _UIOverlayService *overlayService;
  void *v5;
  _QWORD v6[5];

  -[_UISystemBannerRequest verifyParameters](self, "verifyParameters");
  v3 = (_UIOverlayService *)objc_opt_new();
  overlayService = self->_overlayService;
  self->_overlayService = v3;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36___UISystemBannerRequest_postBanner__block_invoke;
  v6[3] = &unk_1E16B1B28;
  v6[4] = self;
  +[_UIOBannerRequestAction actionForSystemBannerRequest:completionHandler:]((uint64_t)_UIOBannerRequestAction, self, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIOverlayService sendOverlayAction:](self->_overlayService, "sendOverlayAction:", v5);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[_UISystemBannerRequest primaryTitleText](self, "primaryTitleText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "primaryTitleText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {

    }
    else
    {
      LOBYTE(v11) = 0;
      v12 = v9;
      v13 = v8;
      if (!v8 || !v9)
      {
LABEL_15:

LABEL_16:
        goto LABEL_17;
      }
      v11 = objc_msgSend(v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_16;
    }
    -[_UISystemBannerRequest secondaryTitleText](self, "secondaryTitleText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "secondaryTitleText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;
    v16 = v15;
    v12 = v16;
    if (v13 == v16)
    {
      LOBYTE(v11) = 1;
    }
    else
    {
      LOBYTE(v11) = 0;
      if (v13 && v16)
        LOBYTE(v11) = objc_msgSend(v13, "isEqual:", v16);
    }

    goto LABEL_15;
  }
  LOBYTE(v11) = 0;
LABEL_17:

  return v11;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (_UISystemBannerRequest)initWithBSXPCCoder:(id)a3
{
  id v4;
  _UISystemBannerRequest *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[_UISystemBannerRequest init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("primaryText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISystemBannerRequest setPrimaryTitleText:](v5, "setPrimaryTitleText:", v6);

    objc_msgSend(v4, "decodeStringForKey:", CFSTR("secondaryText"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UISystemBannerRequest setSecondaryTitleText:](v5, "setSecondaryTitleText:", v7);

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("bannerTimeoutDuration"));
    -[_UISystemBannerRequest setBannerTimeoutDuration:](v5, "setBannerTimeoutDuration:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("preferredMinimumBannerWidth"));
    -[_UISystemBannerRequest setPreferredMinimumBannerWidth:](v5, "setPreferredMinimumBannerWidth:");
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("preferredMaximumBannerWidth"));
    -[_UISystemBannerRequest setPreferredMaximumBannerWidth:](v5, "setPreferredMaximumBannerWidth:");
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_UISystemBannerRequest primaryTitleText](self, "primaryTitleText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("primaryText"));

  -[_UISystemBannerRequest secondaryTitleText](self, "secondaryTitleText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("secondaryText"));

  -[_UISystemBannerRequest bannerTimeoutDuration](self, "bannerTimeoutDuration");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("bannerTimeoutDuration"));
  -[_UISystemBannerRequest preferredMinimumBannerWidth](self, "preferredMinimumBannerWidth");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("preferredMinimumBannerWidth"));
  -[_UISystemBannerRequest preferredMaximumBannerWidth](self, "preferredMaximumBannerWidth");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("preferredMaximumBannerWidth"));

}

- (NSString)primaryTitleText
{
  return self->_primaryTitleText;
}

- (void)setPrimaryTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTitleText, a3);
}

- (NSString)secondaryTitleText
{
  return self->_secondaryTitleText;
}

- (void)setSecondaryTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTitleText, a3);
}

- (double)preferredMinimumBannerWidth
{
  return self->_preferredMinimumBannerWidth;
}

- (void)setPreferredMinimumBannerWidth:(double)a3
{
  self->_preferredMinimumBannerWidth = a3;
}

- (double)preferredMaximumBannerWidth
{
  return self->_preferredMaximumBannerWidth;
}

- (void)setPreferredMaximumBannerWidth:(double)a3
{
  self->_preferredMaximumBannerWidth = a3;
}

- (double)bannerTimeoutDuration
{
  return self->_bannerTimeoutDuration;
}

- (void)setBannerTimeoutDuration:(double)a3
{
  self->_bannerTimeoutDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryTitleText, 0);
  objc_storeStrong((id *)&self->_primaryTitleText, 0);
  objc_storeStrong((id *)&self->_overlayService, 0);
}

@end
