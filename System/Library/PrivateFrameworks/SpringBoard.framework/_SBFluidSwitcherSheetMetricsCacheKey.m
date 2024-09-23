@implementation _SBFluidSwitcherSheetMetricsCacheKey

- (_SBFluidSwitcherSheetMetricsCacheKey)initWithBoundsSize:(CGSize)a3 interfaceOrientation:(int64_t)a4 configuration:(int64_t)a5 userInterfaceIdiom:(int64_t)a6 displayScale:(double)a7 displayEdgeInfo:(id)a8
{
  CGFloat height;
  CGFloat width;
  id v16;
  _SBFluidSwitcherSheetMetricsCacheKey *v17;
  _SBFluidSwitcherSheetMetricsCacheKey *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v27;

  height = a3.height;
  width = a3.width;
  v16 = a8;
  v27.receiver = self;
  v27.super_class = (Class)_SBFluidSwitcherSheetMetricsCacheKey;
  v17 = -[_SBFluidSwitcherSheetMetricsCacheKey init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_boundsSize.width = width;
    v17->_boundsSize.height = height;
    v17->_interfaceOrientation = a4;
    v17->_displayScale = a7;
    objc_storeStrong((id *)&v17->_displayEdgeInfo, a8);
    v18->_userInterfaceIdiom = a6;
    v18->_configuration = a5;
    objc_msgSend(MEMORY[0x1E0D01788], "builder");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (id)objc_msgSend(v19, "appendCGSize:", v18->_boundsSize.width, v18->_boundsSize.height);
    v21 = (id)objc_msgSend(v19, "appendInteger:", v18->_interfaceOrientation);
    v22 = (id)objc_msgSend(v19, "appendCGFloat:", v18->_displayScale);
    v23 = (id)objc_msgSend(v19, "appendObject:", v18->_displayEdgeInfo);
    v24 = (id)objc_msgSend(v19, "appendInteger:", v18->_userInterfaceIdiom);
    v25 = (id)objc_msgSend(v19, "appendInteger:", v18->_configuration);
    v18->_cachedHash = objc_msgSend(v19, "hash");

  }
  return v18;
}

- (unint64_t)hash
{
  return self->_cachedHash;
}

- (BOOL)isEqual:(id)a3
{
  _SBFluidSwitcherSheetMetricsCacheKey *v4;
  BOOL v5;

  v4 = (_SBFluidSwitcherSheetMetricsCacheKey *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && SBSizeEqualsSize()
      && SBFloatEqualsFloat()
      && self->_interfaceOrientation == v4->_interfaceOrientation
      && BSEqualObjects()
      && self->_userInterfaceIdiom == v4->_userInterfaceIdiom
      && self->_configuration == v4->_configuration;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayEdgeInfo, 0);
}

@end
