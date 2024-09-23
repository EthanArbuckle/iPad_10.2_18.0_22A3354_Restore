@implementation _UIStatusBarItemUpdate

- (id)copyWithZone:(_NSZone *)a3
{
  _UIStatusBarItemUpdate *v4;

  v4 = objc_alloc_init(_UIStatusBarItemUpdate);
  -[_UIStatusBarItemUpdate setEnabilityChanged:](v4, "setEnabilityChanged:", self->_enabilityChanged);
  -[_UIStatusBarItemUpdate setEnabled:](v4, "setEnabled:", self->_enabled);
  -[_UIStatusBarItemUpdate setDataChanged:](v4, "setDataChanged:", self->_dataChanged);
  -[_UIStatusBarItemUpdate setData:](v4, "setData:", self->_data);
  -[_UIStatusBarItemUpdate setStyleAttributesChanged:](v4, "setStyleAttributesChanged:", self->_styleAttributesChanged);
  -[_UIStatusBarItemUpdate setStyleAttributes:](v4, "setStyleAttributes:", self->_styleAttributes);
  -[_UIStatusBarItemUpdate setPlacementInfo:](v4, "setPlacementInfo:", self->_placementInfo);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_enabilityChanged);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v3;
  NSStringFromSelector(sel_styleAttributesChanged);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v4;
  NSStringFromSelector(sel_dataChanged);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v5;
  NSStringFromSelector(sel_enabled);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v6;
  NSStringFromSelector(sel_data);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v7;
  NSStringFromSelector(sel_styleAttributes);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v8;
  NSStringFromSelector(sel_placementInfo);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIDescriptionBuilder descriptionForObject:keys:](UIDescriptionBuilder, "descriptionForObject:keys:", self, v10, v13, v14, v15, v16, v17, v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)enabilityChanged
{
  return self->_enabilityChanged;
}

- (void)setEnabilityChanged:(BOOL)a3
{
  self->_enabilityChanged = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)dataChanged
{
  return self->_dataChanged;
}

- (void)setDataChanged:(BOOL)a3
{
  self->_dataChanged = a3;
}

- (_UIStatusBarData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (BOOL)styleAttributesChanged
{
  return self->_styleAttributesChanged;
}

- (void)setStyleAttributesChanged:(BOOL)a3
{
  self->_styleAttributesChanged = a3;
}

- (_UIStatusBarStyleAttributes)styleAttributes
{
  return self->_styleAttributes;
}

- (void)setStyleAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_styleAttributes, a3);
}

- (NSDictionary)placementInfo
{
  return self->_placementInfo;
}

- (void)setPlacementInfo:(id)a3
{
  objc_storeStrong((id *)&self->_placementInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placementInfo, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
