@implementation SBSInCallPresentationConfiguration

- (SBSInCallPresentationConfiguration)initWithSceneBundleIdentifier:(id)a3
{
  id v4;
  SBSInCallPresentationConfiguration *v5;
  SBSInCallPresentationConfiguration *v6;
  uint64_t v7;
  NSString *sceneBundleIdentifier;
  uint64_t v9;
  NSUUID *identifier;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBSInCallPresentationConfiguration;
  v5 = -[SBSInCallPresentationConfiguration init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_preferredPresentationMode = 1;
    v7 = objc_msgSend(v4, "copy");
    sceneBundleIdentifier = v6->_sceneBundleIdentifier;
    v6->_sceneBundleIdentifier = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v9;

  }
  return v6;
}

- (SBSInCallPresentationConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  SBSInCallPresentationConfiguration *v6;
  double v7;
  uint64_t v8;
  NSUUID *identifier;
  SBSInCallPresentationConfiguration *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[SBSInCallPresentationConfiguration initWithSceneBundleIdentifier:](self, "initWithSceneBundleIdentifier:", v5);
    if (v6)
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("preferredBannerHeight"));
      v6->_preferredBannerHeight = v7;
      v6->_preferredPresentationMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("preferredPresentationMode"));
      v6->_userInitiated = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userInitiated"));
      v6->_screenSharingPresentation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("screenSharingPresentation"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
      v8 = objc_claimAutoreleasedReturnValue();
      identifier = v6->_identifier;
      v6->_identifier = (NSUUID *)v8;

      v6->_supportsSystemAperture = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsSystemAperture"));
      v6->_shouldPreventBannersWhenPresentedAsOverlay = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("preventsBannersWhenPresentedAsOverlay"));
      v6->_supportsAmbient = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsAmbient"));
      v6->_shouldPreferContinuityDisplayForFullScreenPresentation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("prefersContinuityDisplayForFullScreenPresentation"));
      v6->_requiresDismissedPresentationmode = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresDismissedPresentationmode"));
    }
    self = v6;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sceneBundleIdentifier;
  void *v5;
  id v6;

  sceneBundleIdentifier = self->_sceneBundleIdentifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", sceneBundleIdentifier, CFSTR("sceneBundleIdentifier"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("preferredBannerHeight"), self->_preferredBannerHeight);
  objc_msgSend(v6, "encodeInteger:forKey:", self->_preferredPresentationMode, CFSTR("preferredPresentationMode"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_userInitiated, CFSTR("userInitiated"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_screenSharingPresentation, CFSTR("screenSharingPresentation"));
  -[SBSInCallPresentationConfiguration identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(v6, "encodeBool:forKey:", self->_supportsSystemAperture, CFSTR("supportsSystemAperture"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_shouldPreventBannersWhenPresentedAsOverlay, CFSTR("preventsBannersWhenPresentedAsOverlay"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_supportsAmbient, CFSTR("supportsAmbient"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_shouldPreferContinuityDisplayForFullScreenPresentation, CFSTR("prefersContinuityDisplayForFullScreenPresentation"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_requiresDismissedPresentationmode, CFSTR("requiresDismissedPresentationmode"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return -[SBSInCallPresentationConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBSInCallPresentationConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSInCallPresentationConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBSInCallPresentationConfiguration *v11;

  -[SBSInCallPresentationConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__SBSInCallPresentationConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E288D940;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyBody:", v9);
  v7 = v5;

  return v7;
}

id __76__SBSInCallPresentationConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("sceneBundleIdentifier"));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v3, CFSTR("identifier"));

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  if (v4 > 3)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E288E198[v4];
  objc_msgSend(*(id *)(a1 + 32), "appendString:withName:", v5, CFSTR("preferredPresentationMode"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("isUserInitiated"), 1);
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 9), CFSTR("isScreenSharingPresentation"), 1);
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendDouble:withName:decimalPrecision:", CFSTR("preferredBannerHeight"), 2, *(double *)(*(_QWORD *)(a1 + 40) + 16));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 10), CFSTR("supportsSystemAperture"), 1);
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 11), CFSTR("shouldPreventBannersWhenPresentedAsOverlay"), 1);
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 12), CFSTR("supportsAmbient"), 1);
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 13), CFSTR("prefersContinuityDisplayForFullScreenPresentation"), 1);
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 14), CFSTR("requiresDismissedPresentationmode"), 1);
}

- (double)preferredBannerHeight
{
  return self->_preferredBannerHeight;
}

- (void)setPreferredBannerHeight:(double)a3
{
  self->_preferredBannerHeight = a3;
}

- (int64_t)preferredPresentationMode
{
  return self->_preferredPresentationMode;
}

- (void)setPreferredPresentationMode:(int64_t)a3
{
  self->_preferredPresentationMode = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (NSString)sceneBundleIdentifier
{
  return self->_sceneBundleIdentifier;
}

- (BOOL)isScreenSharingPresentation
{
  return self->_screenSharingPresentation;
}

- (void)setScreenSharingPresentation:(BOOL)a3
{
  self->_screenSharingPresentation = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)supportsSystemAperture
{
  return self->_supportsSystemAperture;
}

- (void)setSupportsSystemAperture:(BOOL)a3
{
  self->_supportsSystemAperture = a3;
}

- (BOOL)shouldPreventBannersWhenPresentedAsOverlay
{
  return self->_shouldPreventBannersWhenPresentedAsOverlay;
}

- (void)setShouldPreventBannersWhenPresentedAsOverlay:(BOOL)a3
{
  self->_shouldPreventBannersWhenPresentedAsOverlay = a3;
}

- (BOOL)supportsAmbient
{
  return self->_supportsAmbient;
}

- (void)setSupportsAmbient:(BOOL)a3
{
  self->_supportsAmbient = a3;
}

- (BOOL)shouldPreferContinuityDisplayForFullScreenPresentation
{
  return self->_shouldPreferContinuityDisplayForFullScreenPresentation;
}

- (void)setShouldPreferContinuityDisplayForFullScreenPresentation:(BOOL)a3
{
  self->_shouldPreferContinuityDisplayForFullScreenPresentation = a3;
}

- (BOOL)requiresDismissedPresentationmode
{
  return self->_requiresDismissedPresentationmode;
}

- (void)setRequiresDismissedPresentationmode:(BOOL)a3
{
  self->_requiresDismissedPresentationmode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sceneBundleIdentifier, 0);
}

@end
