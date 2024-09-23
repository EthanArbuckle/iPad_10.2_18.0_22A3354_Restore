@implementation _UIOLAConfigurationHistory

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customSpacings, 0);
}

- (double)customSpacingAfterItem:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[NSMapTable objectForKey:](self->_customSpacings, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v6 = v5;
  }
  else
  {
    v6 = 3.40282347e38;
  }

  return v6;
}

- (double)spacing
{
  return self->_spacing;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIOLAConfigurationHistory;
  v4 = -[_UILAConfigurationHistory copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSpacing:", self->_spacing);
  objc_msgSend(v4, "setDistribution:", self->_distribution);
  objc_msgSend(v4, "setBaselineRelativeArrangement:", self->_baselineRelativeArrangement);
  objc_msgSend(v4, "_setItemOrderingChanged:", self->_itemOrderingChanged);
  objc_msgSend(v4, "setHasEstablishedOrderingValues:", self->_hasEstablishedOrderingValues);
  objc_msgSend(v4, "setInOrderedArrangementUpdateSection:", self->_inOrderedArrangementUpdateSection);
  objc_msgSend(v4, "setProportionalFillDenominator:", self->_proportionalFillDenominator);
  objc_msgSend(v4, "_setItemFittingSizeChanged:", self->_itemFittingSizeChanged);
  v5 = -[NSMapTable copy](self->_customSpacings, "copy");
  v6 = (void *)v4[9];
  v4[9] = v5;

  return v4;
}

- (int64_t)distribution
{
  return self->_distribution;
}

- (void)setInOrderedArrangementUpdateSection:(BOOL)a3
{
  self->_inOrderedArrangementUpdateSection = a3;
}

- (BOOL)_itemOrderingChanged
{
  return self->_itemOrderingChanged;
}

- (BOOL)isInOrderedArrangementUpdateSection
{
  return self->_inOrderedArrangementUpdateSection;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (void)_setItemOrderingChanged:(BOOL)a3
{
  self->_itemOrderingChanged = a3;
}

- (void)setDistribution:(int64_t)a3
{
  self->_distribution = a3;
}

- (void)setBaselineRelativeArrangement:(BOOL)a3
{
  self->_baselineRelativeArrangement = a3;
}

- (void)setProportionalFillDenominator:(double)a3
{
  self->_proportionalFillDenominator = a3;
}

- (void)setHasEstablishedOrderingValues:(BOOL)a3
{
  self->_hasEstablishedOrderingValues = a3;
}

- (BOOL)isBaselineRelativeArrangement
{
  return self->_baselineRelativeArrangement;
}

- (NSMapTable)customSpacings
{
  return self->_customSpacings;
}

- (BOOL)hasEstablishedOrderingValues
{
  return self->_hasEstablishedOrderingValues;
}

- (void)_setItemFittingSizeChanged:(BOOL)a3
{
  self->_itemFittingSizeChanged = a3;
}

- (double)proportionalFillDenominator
{
  return self->_proportionalFillDenominator;
}

- (BOOL)_itemFittingSizeChanged
{
  return self->_itemFittingSizeChanged;
}

- (void)setCustomSpacing:(double)a3 afterItem:(id)a4
{
  NSMapTable *customSpacings;
  NSMapTable *v7;
  NSMapTable *v8;
  void *v9;
  id v10;

  v10 = a4;
  customSpacings = self->_customSpacings;
  if (!customSpacings)
  {
    v7 = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    v8 = self->_customSpacings;
    self->_customSpacings = v7;

    customSpacings = self->_customSpacings;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](customSpacings, "setObject:forKey:", v9, v10);

}

@end
