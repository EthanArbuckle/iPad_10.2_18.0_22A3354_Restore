@implementation SXLayoutOptions

- (SXLayoutOptions)initWithColumnLayout:(id)a3 viewportSize:(CGSize)a4 traitCollection:(id)a5 contentSizeCategory:(id)a6 bundleSubscriptionStatus:(int64_t)a7 channelSubscriptionStatus:(int64_t)a8 testing:(BOOL)a9 viewingLocation:(unint64_t)a10 contentScaleFactor:(double)a11 newsletterSubscriptionStatus:(unint64_t)a12 offerUpsellScenario:(int64_t)a13 subscriptionActivationEligibility:(int64_t)a14 smartInvertColorsEnabled:(BOOL)a15 conditionKeys:(id)a16
{
  CGFloat height;
  CGFloat width;
  id v26;
  id v27;
  SXLayoutOptions *v28;
  SXLayoutOptions *v29;
  id v31;
  id v32;
  objc_super v33;

  height = a4.height;
  width = a4.width;
  v26 = a3;
  v27 = a5;
  v32 = a6;
  v31 = a16;
  v33.receiver = self;
  v33.super_class = (Class)SXLayoutOptions;
  v28 = -[SXLayoutOptions init](&v33, sel_init);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_columnLayout, a3);
    v29->_viewportSize.width = width;
    v29->_viewportSize.height = height;
    objc_storeStrong((id *)&v29->_traitCollection, a5);
    objc_storeStrong((id *)&v29->_contentSizeCategory, a6);
    v29->_bundleSubscriptionStatus = a7;
    v29->_channelSubscriptionStatus = a8;
    v29->_testing = a9;
    v29->_viewingLocation = a10;
    v29->_contentScaleFactor = a11;
    v29->_newsletterSubscriptionStatus = a12;
    v29->_offerUpsellScenario = a13;
    v29->_subscriptionActivationEligibility = a14;
    v29->_smartInvertColorsEnabled = a15;
    objc_storeStrong((id *)&v29->_conditionKeys, a16);
  }

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  return -[SXLayoutOptions diffWithLayoutOptions:](self, "diffWithLayoutOptions:", a3) == 0;
}

- (unint64_t)diffWithLayoutOptions:(id)a3
{
  SXLayoutOptions *v4;
  uint64_t v5;
  UIUserInterfaceSizeClass v6;
  UIUserInterfaceSizeClass v7;
  UIUserInterfaceStyle v8;
  uint64_t v9;
  uint64_t v10;
  double width;
  unint64_t v13;
  int v14;
  unint64_t v15;
  double v16;
  unint64_t v17;
  unint64_t v18;

  v4 = (SXLayoutOptions *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self == v4)
    {
      v18 = 0;
    }
    else
    {
      if (-[SXColumnLayout isEqual:](self->_columnLayout, "isEqual:", v4->_columnLayout))
        v5 = 65534;
      else
        v5 = 0xFFFFLL;
      v6 = -[UITraitCollection horizontalSizeClass](self->_traitCollection, "horizontalSizeClass");
      if (v6 == -[UITraitCollection horizontalSizeClass](v4->_traitCollection, "horizontalSizeClass"))
        v5 = (unsigned __int16)v5 & 0xFDFF;
      v7 = -[UITraitCollection verticalSizeClass](self->_traitCollection, "verticalSizeClass");
      if (v7 == -[UITraitCollection verticalSizeClass](v4->_traitCollection, "verticalSizeClass"))
        v5 = (unsigned __int16)v5 & 0xFBFF;
      v8 = -[UITraitCollection userInterfaceStyle](self->_traitCollection, "userInterfaceStyle");
      v9 = -[UITraitCollection userInterfaceStyle](v4->_traitCollection, "userInterfaceStyle");
      v10 = (unsigned __int16)v5 & 0xFEFF;
      if (v8 != v9)
        v10 = v5;
      width = self->_viewportSize.width;
      if (self->_viewportSize.height == v4->_viewportSize.height && width == v4->_viewportSize.width)
        v13 = (unsigned __int16)v10 & 0xFFFD;
      else
        v13 = v10;
      v14 = -[NSString isEqual:](self->_contentSizeCategory, "isEqual:", v4->_contentSizeCategory, width);
      v15 = (unsigned __int16)v13 & 0xFFFB;
      if (!v14)
        v15 = v13;
      if (self->_bundleSubscriptionStatus == v4->_bundleSubscriptionStatus)
        v15 = (unsigned __int16)v15 & 0xFFF7;
      if (self->_channelSubscriptionStatus == v4->_channelSubscriptionStatus)
        v15 &= ~0x10uLL;
      if (self->_viewingLocation == v4->_viewingLocation)
        v15 &= ~0x20uLL;
      if (self->_testing == v4->_testing)
        v15 &= ~0x40uLL;
      v16 = self->_contentScaleFactor - v4->_contentScaleFactor;
      if (v16 < 0.0)
        v16 = -v16;
      if (v16 < 2.22044605e-16)
        v15 &= ~0x80uLL;
      if (self->_newsletterSubscriptionStatus == v4->_newsletterSubscriptionStatus)
        v15 &= ~0x800uLL;
      if (self->_offerUpsellScenario == v4->_offerUpsellScenario)
        v15 &= ~0x1000uLL;
      if (self->_subscriptionActivationEligibility == v4->_subscriptionActivationEligibility)
        v15 &= ~0x2000uLL;
      if (self->_smartInvertColorsEnabled == v4->_smartInvertColorsEnabled)
        v17 = v15 & 0xFFFFFFFFFFFFBFFFLL;
      else
        v17 = v15;
      if (-[NSSet isEqual:](self->_conditionKeys, "isEqual:", v4->_conditionKeys))
        v18 = v17 & 0xFFFFFFFFFFFF7FFFLL;
      else
        v18 = v17;
    }
  }
  else
  {
    v18 = 0xFFFFLL;
  }

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t height;
  uint64_t v5;

  v3 = -[SXColumnLayout hash](self->_columnLayout, "hash") ^ (unint64_t)self->_viewportSize.width;
  height = (unint64_t)self->_viewportSize.height;
  v5 = v3 ^ height ^ -[UITraitCollection hash](self->_traitCollection, "hash");
  return v5 ^ -[NSString hash](self->_contentSizeCategory, "hash") ^ self->_testing ^ self->_viewingLocation ^ (unint64_t)self->_contentScaleFactor;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const __CFString *v19;
  int64_t v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  CGSize v25;
  CGSize v26;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; options: \n"), objc_opt_class(), self);
  -[SXLayoutOptions viewportSize](self, "viewportSize");
  NSStringFromCGSize(v25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  viewportSize: %@; \n"), v4);

  -[SXLayoutOptions contentSizeCategory](self, "contentSizeCategory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  contentSizeCategory: %@; \n"), v5);

  v6 = -[SXLayoutOptions bundleSubscriptionStatus](self, "bundleSubscriptionStatus");
  if (v6 <= 2)
    objc_msgSend(v3, "appendFormat:", off_24D68A318[v6]);
  v7 = -[SXLayoutOptions channelSubscriptionStatus](self, "channelSubscriptionStatus");
  if (v7 <= 2)
    objc_msgSend(v3, "appendFormat:", off_24D68A330[v7]);
  v8 = -[SXLayoutOptions offerUpsellScenario](self, "offerUpsellScenario");
  if (v8 <= 9 && ((0x3FDu >> v8) & 1) != 0)
    objc_msgSend(v3, "appendFormat:", off_24D68A348[v8]);
  -[SXLayoutOptions columnLayout](self, "columnLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "numberOfColumns");
  -[SXLayoutOptions columnLayout](self, "columnLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constrainedViewportSize");
  NSStringFromCGSize(v26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  columnLayout: (numberOfColumns: %d, constrainedViewportSize: %@); \n"),
    v10,
    v12);

  -[SXLayoutOptions traitCollection](self, "traitCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  traitCollection: %@; \n"), v14);

  if (-[SXLayoutOptions testing](self, "testing"))
    v15 = CFSTR("YES");
  else
    v15 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("  testing: %@; \n"), v15);
  v16 = -[SXLayoutOptions viewingLocation](self, "viewingLocation");
  if (v16 <= 3)
    objc_msgSend(v3, "appendFormat:", off_24D68A398[v16]);
  -[SXLayoutOptions contentScaleFactor](self, "contentScaleFactor");
  objc_msgSend(v3, "appendFormat:", CFSTR("  contentScaleFactor: %f; \n"), v17);
  v18 = -[SXLayoutOptions newsletterSubscriptionStatus](self, "newsletterSubscriptionStatus");
  if (v18 - 1 > 4)
    v19 = CFSTR("unspecified");
  else
    v19 = off_24D68A3B8[v18 - 1];
  objc_msgSend(v3, "appendFormat:", CFSTR("  newsletter status: %@; \n"), v19);
  v20 = -[SXLayoutOptions subscriptionActivationEligibility](self, "subscriptionActivationEligibility");
  if ((unint64_t)(v20 - 1) > 3)
    v21 = CFSTR("unknown");
  else
    v21 = off_24D68A3E0[v20 - 1];
  objc_msgSend(v3, "appendFormat:", CFSTR("  subscriptionActivationEligibility: %@; \n"), v21);
  -[SXLayoutOptions conditionKeys](self, "conditionKeys");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("  conditionKeys: %@; \n"), v22);

  if (-[SXLayoutOptions smartInvertColorsEnabled](self, "smartInvertColorsEnabled"))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("  _smartInvertColorsEnabled: %@; \n"), v23);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (SXColumnLayout)columnLayout
{
  return self->_columnLayout;
}

- (CGSize)viewportSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewportSize.width;
  height = self->_viewportSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UITraitCollection)traitCollection
{
  return self->_traitCollection;
}

- (NSString)contentSizeCategory
{
  return self->_contentSizeCategory;
}

- (int64_t)bundleSubscriptionStatus
{
  return self->_bundleSubscriptionStatus;
}

- (int64_t)channelSubscriptionStatus
{
  return self->_channelSubscriptionStatus;
}

- (int64_t)offerUpsellScenario
{
  return self->_offerUpsellScenario;
}

- (int64_t)subscriptionActivationEligibility
{
  return self->_subscriptionActivationEligibility;
}

- (BOOL)testing
{
  return self->_testing;
}

- (unint64_t)viewingLocation
{
  return self->_viewingLocation;
}

- (double)contentScaleFactor
{
  return self->_contentScaleFactor;
}

- (unint64_t)newsletterSubscriptionStatus
{
  return self->_newsletterSubscriptionStatus;
}

- (BOOL)smartInvertColorsEnabled
{
  return self->_smartInvertColorsEnabled;
}

- (NSSet)conditionKeys
{
  return self->_conditionKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionKeys, 0);
  objc_storeStrong((id *)&self->_contentSizeCategory, 0);
  objc_storeStrong((id *)&self->_traitCollection, 0);
  objc_storeStrong((id *)&self->_columnLayout, 0);
}

@end
