@implementation _UICalendarViewPlatformMetrics

- (_UICalendarViewPlatformMetrics)init
{
  _UICalendarViewPlatformMetrics *v2;
  _UICalendarViewPlatformMetrics *v3;
  _UICalendarViewPlatformMetrics *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v14[8];
  _QWORD v15[4];
  _UICalendarViewPlatformMetrics *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_UICalendarViewPlatformMetrics;
  v2 = -[_UICalendarViewPlatformMetrics init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    -[_UICalendarViewPlatformMetrics setMinimumContentWidth:](v2, "setMinimumContentWidth:", 280.0);
    -[_UICalendarViewPlatformMetrics setMinimumLayoutWidth:](v3, "setMinimumLayoutWidth:", 220.0);
    -[_UICalendarViewPlatformMetrics setMaximumContentWidthForLayoutMargins:](v3, "setMaximumContentWidthForLayoutMargins:", &__block_literal_global_26);
    -[_UICalendarViewPlatformMetrics setHeaderViewLayoutMarginsForProposedLayoutMargins:](v3, "setHeaderViewLayoutMarginsForProposedLayoutMargins:", &__block_literal_global_54);
    -[_UICalendarViewPlatformMetrics setHeaderViewIntrinsicLayoutMarginsForProposedLayoutMargins:](v3, "setHeaderViewIntrinsicLayoutMarginsForProposedLayoutMargins:", &__block_literal_global_55);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __38___UICalendarViewPlatformMetrics_init__block_invoke_4;
    v15[3] = &unk_1E16B4978;
    v4 = v3;
    v16 = v4;
    -[_UICalendarViewPlatformMetrics setHeaderViewInsetsForLayoutMargins:](v4, "setHeaderViewInsetsForLayoutMargins:", v15);
    +[_UICalendarViewPlatformMetrics _headerViewDefaultButtonConfiguration](_UICalendarViewPlatformMetrics, "_headerViewDefaultButtonConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICalendarViewPlatformMetrics setHeaderViewDefaultButtonConfiguration:](v4, "setHeaderViewDefaultButtonConfiguration:", v5);

    +[UIColor labelColor](UIColor, "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICalendarViewPlatformMetrics setMonthYearLabelColor:](v4, "setMonthYearLabelColor:", v6);

    +[UIColor tintColor](UIColor, "tintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICalendarViewPlatformMetrics setExpandedMonthYearLabelColor:](v4, "setExpandedMonthYearLabelColor:", v7);

    -[_UICalendarViewPlatformMetrics setMonthYearLabelFontProvider:](v4, "setMonthYearLabelFontProvider:", &__block_literal_global_60);
    -[_UICalendarViewPlatformMetrics setMonthYearChevronSymbolConfiguration:](v4, "setMonthYearChevronSymbolConfiguration:", &__block_literal_global_62);
    -[_UICalendarViewPlatformMetrics setNextPreviousMonthButtonConfiguration:](v4, "setNextPreviousMonthButtonConfiguration:", &__block_literal_global_65);
    -[_UICalendarViewPlatformMetrics setMonthYearButtonConfiguration:](v4, "setMonthYearButtonConfiguration:", &__block_literal_global_66);
    -[_UICalendarViewPlatformMetrics setHeaderViewInterMonthButtonSpacing:](v4, "setHeaderViewInterMonthButtonSpacing:", 0.0);
    -[_UICalendarViewPlatformMetrics setMonthYearContainerEdgeInsets:](v4, "setMonthYearContainerEdgeInsets:", -4.0, -4.0, -4.0, -4.0);
    -[_UICalendarViewPlatformMetrics setMonthYearContainerViewProvider:](v4, "setMonthYearContainerViewProvider:", &__block_literal_global_69);
    +[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UICalendarViewPlatformMetrics setWeekdayLabelTextColor:](v4, "setWeekdayLabelTextColor:", v8);

    -[_UICalendarViewPlatformMetrics setWeekdayViewMinimumHeight:](v4, "setWeekdayViewMinimumHeight:", 0.0);
    -[_UICalendarViewPlatformMetrics setWeekdayViewVerticalSpacing:](v4, "setWeekdayViewVerticalSpacing:", 0.0);
    -[_UICalendarViewPlatformMetrics setDateViewCellBackgroundSize:](v4, "setDateViewCellBackgroundSize:", 44.0);
    -[_UICalendarViewPlatformMetrics setDateViewCellSpacing:](v4, "setDateViewCellSpacing:", -1.0);
    -[_UICalendarViewPlatformMetrics setDateCellForegroundColorProvider:](v4, "setDateCellForegroundColorProvider:", &__block_literal_global_72);
    -[_UICalendarViewPlatformMetrics setDateCellBackgroundColorProvider:](v4, "setDateCellBackgroundColorProvider:", &__block_literal_global_73);
    -[_UICalendarViewPlatformMetrics setDateCellFontProvider:](v4, "setDateCellFontProvider:", &__block_literal_global_75);
    v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v14[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v14[5] = v9;
    v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v14[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v14[7] = v10;
    v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v14[0] = *MEMORY[0x1E0CD2610];
    v14[1] = v11;
    v12 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v14[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v14[3] = v12;
    -[_UICalendarViewPlatformMetrics setHighlightedContentTransform:](v4, "setHighlightedContentTransform:", v14);

  }
  return v3;
}

+ (id)_headerViewDefaultButtonConfiguration
{
  void *v2;
  void *v3;
  void *v4;

  +[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentInsets");
  objc_msgSend(v2, "setContentInsets:");
  +[UIColor clearColor](UIColor, "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "background");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  return v2;
}

- (id)maximumContentWidthForLayoutMargins
{
  return self->_maximumContentWidthForLayoutMargins;
}

- (void)setMaximumContentWidthForLayoutMargins:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)minimumContentWidth
{
  return self->_minimumContentWidth;
}

- (void)setMinimumContentWidth:(double)a3
{
  self->_minimumContentWidth = a3;
}

- (double)minimumLayoutWidth
{
  return self->_minimumLayoutWidth;
}

- (void)setMinimumLayoutWidth:(double)a3
{
  self->_minimumLayoutWidth = a3;
}

- (id)headerViewLayoutMarginsForProposedLayoutMargins
{
  return self->_headerViewLayoutMarginsForProposedLayoutMargins;
}

- (void)setHeaderViewLayoutMarginsForProposedLayoutMargins:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)headerViewIntrinsicLayoutMarginsForProposedLayoutMargins
{
  return self->_headerViewIntrinsicLayoutMarginsForProposedLayoutMargins;
}

- (void)setHeaderViewIntrinsicLayoutMarginsForProposedLayoutMargins:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)headerViewInsetsForLayoutMargins
{
  return self->_headerViewInsetsForLayoutMargins;
}

- (void)setHeaderViewInsetsForLayoutMargins:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIButtonConfiguration)headerViewDefaultButtonConfiguration
{
  return self->_headerViewDefaultButtonConfiguration;
}

- (void)setHeaderViewDefaultButtonConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIColor)monthYearLabelColor
{
  return self->_monthYearLabelColor;
}

- (void)setMonthYearLabelColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (UIColor)expandedMonthYearLabelColor
{
  return self->_expandedMonthYearLabelColor;
}

- (void)setExpandedMonthYearLabelColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (UIColor)monthYearChevronColor
{
  return self->_monthYearChevronColor;
}

- (void)setMonthYearChevronColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (UIColor)expandedMonthYearChevronColor
{
  return self->_expandedMonthYearChevronColor;
}

- (void)setExpandedMonthYearChevronColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)monthYearLabelFontProvider
{
  return self->_monthYearLabelFontProvider;
}

- (void)setMonthYearLabelFontProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)monthYearChevronSymbolConfiguration
{
  return self->_monthYearChevronSymbolConfiguration;
}

- (void)setMonthYearChevronSymbolConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)nextPreviousMonthButtonConfiguration
{
  return self->_nextPreviousMonthButtonConfiguration;
}

- (void)setNextPreviousMonthButtonConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)monthYearButtonConfiguration
{
  return self->_monthYearButtonConfiguration;
}

- (void)setMonthYearButtonConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (double)headerViewInterMonthButtonSpacing
{
  return self->_headerViewInterMonthButtonSpacing;
}

- (void)setHeaderViewInterMonthButtonSpacing:(double)a3
{
  self->_headerViewInterMonthButtonSpacing = a3;
}

- (UIEdgeInsets)monthYearContainerEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_monthYearContainerEdgeInsets.top;
  left = self->_monthYearContainerEdgeInsets.left;
  bottom = self->_monthYearContainerEdgeInsets.bottom;
  right = self->_monthYearContainerEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMonthYearContainerEdgeInsets:(UIEdgeInsets)a3
{
  self->_monthYearContainerEdgeInsets = a3;
}

- (id)monthYearContainerViewProvider
{
  return self->_monthYearContainerViewProvider;
}

- (void)setMonthYearContainerViewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (UIColor)weekdayLabelTextColor
{
  return self->_weekdayLabelTextColor;
}

- (void)setWeekdayLabelTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (double)weekdayViewMinimumHeight
{
  return self->_weekdayViewMinimumHeight;
}

- (void)setWeekdayViewMinimumHeight:(double)a3
{
  self->_weekdayViewMinimumHeight = a3;
}

- (double)weekdayViewVerticalSpacing
{
  return self->_weekdayViewVerticalSpacing;
}

- (void)setWeekdayViewVerticalSpacing:(double)a3
{
  self->_weekdayViewVerticalSpacing = a3;
}

- (double)dateViewCellBackgroundSize
{
  return self->_dateViewCellBackgroundSize;
}

- (void)setDateViewCellBackgroundSize:(double)a3
{
  self->_dateViewCellBackgroundSize = a3;
}

- (double)dateViewCellSpacing
{
  return self->_dateViewCellSpacing;
}

- (void)setDateViewCellSpacing:(double)a3
{
  self->_dateViewCellSpacing = a3;
}

- (UIVisualEffect)defaultCellBackgroundEffect
{
  return self->_defaultCellBackgroundEffect;
}

- (void)setDefaultCellBackgroundEffect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (UIVisualEffect)highlightedCellBackgroundEffect
{
  return self->_highlightedCellBackgroundEffect;
}

- (void)setHighlightedCellBackgroundEffect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (CATransform3D)highlightedContentTransform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self[2].m41;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[2].m33;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self[3].m11;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[2].m43;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self[2].m21;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[2].m13;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self[2].m31;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[2].m23;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setHighlightedContentTransform:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  v5 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_highlightedContentTransform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_highlightedContentTransform.m23 = v5;
  *(_OWORD *)&self->_highlightedContentTransform.m11 = v3;
  *(_OWORD *)&self->_highlightedContentTransform.m13 = v4;
  v6 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  v8 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_highlightedContentTransform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_highlightedContentTransform.m43 = v8;
  *(_OWORD *)&self->_highlightedContentTransform.m31 = v6;
  *(_OWORD *)&self->_highlightedContentTransform.m33 = v7;
}

- (id)dateCellForegroundColorProvider
{
  return self->_dateCellForegroundColorProvider;
}

- (void)setDateCellForegroundColorProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)dateCellBackgroundColorProvider
{
  return self->_dateCellBackgroundColorProvider;
}

- (void)setDateCellBackgroundColorProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (id)dateCellFontProvider
{
  return self->_dateCellFontProvider;
}

- (void)setDateCellFontProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (UIOffset)monthYearContainerOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_monthYearContainerOffset.horizontal;
  vertical = self->_monthYearContainerOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void)setMonthYearContainerOffset:(UIOffset)a3
{
  self->_monthYearContainerOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dateCellFontProvider, 0);
  objc_storeStrong(&self->_dateCellBackgroundColorProvider, 0);
  objc_storeStrong(&self->_dateCellForegroundColorProvider, 0);
  objc_storeStrong((id *)&self->_highlightedCellBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_defaultCellBackgroundEffect, 0);
  objc_storeStrong((id *)&self->_weekdayLabelTextColor, 0);
  objc_storeStrong(&self->_monthYearContainerViewProvider, 0);
  objc_storeStrong(&self->_monthYearButtonConfiguration, 0);
  objc_storeStrong(&self->_nextPreviousMonthButtonConfiguration, 0);
  objc_storeStrong(&self->_monthYearChevronSymbolConfiguration, 0);
  objc_storeStrong(&self->_monthYearLabelFontProvider, 0);
  objc_storeStrong((id *)&self->_expandedMonthYearChevronColor, 0);
  objc_storeStrong((id *)&self->_monthYearChevronColor, 0);
  objc_storeStrong((id *)&self->_expandedMonthYearLabelColor, 0);
  objc_storeStrong((id *)&self->_monthYearLabelColor, 0);
  objc_storeStrong((id *)&self->_headerViewDefaultButtonConfiguration, 0);
  objc_storeStrong(&self->_headerViewInsetsForLayoutMargins, 0);
  objc_storeStrong(&self->_headerViewIntrinsicLayoutMarginsForProposedLayoutMargins, 0);
  objc_storeStrong(&self->_headerViewLayoutMarginsForProposedLayoutMargins, 0);
  objc_storeStrong(&self->_maximumContentWidthForLayoutMargins, 0);
}

@end
