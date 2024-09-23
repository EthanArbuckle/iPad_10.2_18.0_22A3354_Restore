@implementation _UIListSeparatorConfiguration

- (void)_setInsets:(NSDirectionalEdgeInsets)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIListSeparatorConfiguration;
  -[UIListSeparatorConfiguration setBottomSeparatorInsets:](&v3, sel_setBottomSeparatorInsets_, a3.top, a3.leading, a3.bottom, a3.trailing);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIListSeparatorConfiguration;
  result = -[UIListSeparatorConfiguration copyWithZone:](&v6, sel_copyWithZone_, a3);
  if (result)
  {
    *((_QWORD *)result + 16) = self->_hidingBehavior;
    *((_QWORD *)result + 17) = self->_insetAdjustmentBehavior;
    v5 = *(_OWORD *)&self->_insetsForBoundarySeparators.bottom;
    *((_OWORD *)result + 9) = *(_OWORD *)&self->_insetsForBoundarySeparators.top;
    *((_OWORD *)result + 10) = v5;
  }
  return result;
}

- (int64_t)_hidingBehavior
{
  return self->_hidingBehavior;
}

- (NSDirectionalEdgeInsets)_insetsForBoundarySeparators
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_insetsForBoundarySeparators.top;
  leading = self->_insetsForBoundarySeparators.leading;
  bottom = self->_insetsForBoundarySeparators.bottom;
  trailing = self->_insetsForBoundarySeparators.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

+ (id)_configurationForAppearanceStyle:(int64_t)a3 inLayoutEnvironment:(id)a4
{
  id v5;
  int64_t v6;

  v5 = objc_alloc((Class)a1);
  if ((unint64_t)(a3 - 1) >= 4)
    v6 = 0;
  else
    v6 = a3;
  return (id)objc_msgSend(v5, "initWithListAppearance:", v6);
}

- (BOOL)isEqual:(id)a3
{
  id v5;
  BOOL v6;
  objc_super v8;

  if (a3 == self)
    return 1;
  if (!a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)_UIListSeparatorConfiguration;
  if (!-[UIListSeparatorConfiguration isEqual:](&v8, sel_isEqual_, a3))
    return 0;
  v5 = a3;
  v6 = self->_hidingBehavior == *((_QWORD *)v5 + 16)
    && self->_insetAdjustmentBehavior == *((_QWORD *)v5 + 17)
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insetsForBoundarySeparators.top, *((float64x2_t *)v5 + 9)), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_insetsForBoundarySeparators.bottom, *((float64x2_t *)v5 + 10)))), 0xFuLL))) & 1) != 0;

  return v6;
}

- (NSDirectionalEdgeInsets)_insets
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  NSDirectionalEdgeInsets result;

  v6.receiver = self;
  v6.super_class = (Class)_UIListSeparatorConfiguration;
  -[UIListSeparatorConfiguration bottomSeparatorInsets](&v6, sel_bottomSeparatorInsets);
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)_setColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIListSeparatorConfiguration;
  -[UIListSeparatorConfiguration setColor:](&v3, sel_setColor_, a3);
}

- (UIColor)_color
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIListSeparatorConfiguration;
  -[UIListSeparatorConfiguration color](&v3, sel_color);
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)_setMultipleSelectionColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIListSeparatorConfiguration;
  -[UIListSeparatorConfiguration setMultipleSelectionColor:](&v3, sel_setMultipleSelectionColor_, a3);
}

- (UIColor)_multipleSelectionColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIListSeparatorConfiguration;
  -[UIListSeparatorConfiguration multipleSelectionColor](&v3, sel_multipleSelectionColor);
  return (UIColor *)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UIListSeparatorConfiguration)initWithCoder:(id)a3
{
  _UIListSeparatorConfiguration *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIListSeparatorConfiguration;
  v4 = -[UIListSeparatorConfiguration initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    v4->_hidingBehavior = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("hidingBehavior"));
    v4->_insetAdjustmentBehavior = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("insetAdjustmentBehavior"));
    objc_msgSend(a3, "decodeDirectionalEdgeInsetsForKey:", CFSTR("insetsForBoundarySeparators"));
    v4->_insetsForBoundarySeparators.top = v5;
    v4->_insetsForBoundarySeparators.leading = v6;
    v4->_insetsForBoundarySeparators.bottom = v7;
    v4->_insetsForBoundarySeparators.trailing = v8;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIListSeparatorConfiguration;
  -[UIListSeparatorConfiguration encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_hidingBehavior, CFSTR("hidingBehavior"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_insetAdjustmentBehavior, CFSTR("insetAdjustmentBehavior"));
  objc_msgSend(a3, "encodeDirectionalEdgeInsets:forKey:", CFSTR("insetsForBoundarySeparators"), self->_insetsForBoundarySeparators.top, self->_insetsForBoundarySeparators.leading, self->_insetsForBoundarySeparators.bottom, self->_insetsForBoundarySeparators.trailing);
}

- (void)_setHidingBehavior:(int64_t)a3
{
  self->_hidingBehavior = a3;
}

- (int64_t)_insetAdjustmentBehaviour
{
  return self->_insetAdjustmentBehavior;
}

- (void)_setInsetAdjustmentBehavior:(int64_t)a3
{
  self->_insetAdjustmentBehavior = a3;
}

- (BOOL)_shouldAdjustColorForMultipleSelection
{
  return self->_adjustColorForMultipleSelection;
}

- (void)_setAdjustColorForMultipleSelection:(BOOL)a3
{
  self->_adjustColorForMultipleSelection = a3;
}

- (void)_setInsetsForBoundarySeparators:(NSDirectionalEdgeInsets)a3
{
  self->_insetsForBoundarySeparators = a3;
}

@end
