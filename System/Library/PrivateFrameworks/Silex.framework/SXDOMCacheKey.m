@implementation SXDOMCacheKey

- (SXDOMCacheKey)initWithLayoutOptions:(id)a3 hints:(id)a4
{
  id v7;
  id v8;
  SXDOMCacheKey *v9;
  SXDOMCacheKey *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXDOMCacheKey;
  v9 = -[SXDOMCacheKey init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_options, a3);
    objc_storeStrong((id *)&v10->_hints, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  SXDOMCacheKey *v4;
  SXLayoutOptions *options;
  uint64_t v6;
  __int16 v7;
  SXConditionHints *hints;
  SXConditionHints *v9;
  BOOL v10;

  v4 = (SXDOMCacheKey *)a3;
  if (!v4)
    goto LABEL_43;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_43;
  if (self == v4
    || (options = self->_options, options == v4->_options)
    || (v6 = -[SXLayoutOptions diffWithLayoutOptions:](options, "diffWithLayoutOptions:")) == 0)
  {
LABEL_44:
    v10 = 1;
    goto LABEL_45;
  }
  v7 = v6;
  hints = self->_hints;
  if (!hints)
    goto LABEL_43;
  v9 = v4->_hints;
  if (!v9 || hints != v9 && !-[SXJSONObject isEqual:](hints, "isEqual:"))
    goto LABEL_43;
  if ((v7 & 1) != 0
    && (-[SXConditionHints minColumns](self->_hints, "minColumns")
     || -[SXConditionHints maxColumns](self->_hints, "maxColumns"))
    || (v7 & 2) != 0
    && (-[SXConditionHints minViewportWidth](self->_hints, "minViewportWidth")
     || -[SXConditionHints maxViewportWidth](self->_hints, "maxViewportWidth")
     || -[SXConditionHints minViewportAspectRatio](self->_hints, "minViewportAspectRatio")
     || -[SXConditionHints maxViewportAspectRatio](self->_hints, "maxViewportAspectRatio")))
  {
    goto LABEL_43;
  }
  if ((v7 & 4) != 0)
  {
    if (-[SXConditionHints minContentSizeCategory](self->_hints, "minContentSizeCategory")
      || -[SXConditionHints maxContentSizeCategory](self->_hints, "maxContentSizeCategory") | v7 & 0x100)
    {
      goto LABEL_43;
    }
    goto LABEL_25;
  }
  if ((v7 & 0x100) == 0)
  {
LABEL_25:
    if ((v7 & 8) != 0 && -[SXConditionHints subscriptionStatus](self->_hints, "subscriptionStatus")
      || (v7 & 0x10) != 0 && -[SXConditionHints subscriptionStatus](self->_hints, "subscriptionStatus")
      || (v7 & 0x200) != 0 && -[SXConditionHints horizontalSizeClass](self->_hints, "horizontalSizeClass")
      || (v7 & 0x400) != 0 && -[SXConditionHints verticalSizeClass](self->_hints, "verticalSizeClass")
      || (v7 & 0x40) != 0 && -[SXConditionHints testing](self->_hints, "testing")
      || (v7 & 0x20) != 0 && -[SXConditionHints viewLocation](self->_hints, "viewLocation")
      || (v7 & 0x800) != 0 && -[SXConditionHints newsletter](self->_hints, "newsletter")
      || (v7 & 0x1000) != 0 && -[SXConditionHints upsellScenario](self->_hints, "upsellScenario")
      || (v7 & 0x2000) != 0
      && -[SXConditionHints subscriptionActivationEligibility](self->_hints, "subscriptionActivationEligibility"))
    {
      goto LABEL_43;
    }
    goto LABEL_44;
  }
LABEL_43:
  v10 = 0;
LABEL_45:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SXDOMCacheKey initWithLayoutOptions:hints:]([SXDOMCacheKey alloc], "initWithLayoutOptions:hints:", self->_options, self->_hints);
}

- (SXLayoutOptions)options
{
  return self->_options;
}

- (SXConditionHints)hints
{
  return self->_hints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hints, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
