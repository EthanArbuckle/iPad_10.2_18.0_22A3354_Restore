@implementation _UITabBarBehaviorSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UITabBarBehaviorSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UITabBarBehaviorSettings setStackedLeadingPadding:](self, "setStackedLeadingPadding:", 35.0);
  -[_UITabBarBehaviorSettings setStackedTrailingPadding:](self, "setStackedTrailingPadding:", 35.0);
  -[_UITabBarBehaviorSettings setStackedTopInset:](self, "setStackedTopInset:", 0.5);
  -[_UITabBarBehaviorSettings setStackedBottomInset:](self, "setStackedBottomInset:", 1.5);
  -[_UITabBarBehaviorSettings setStackedCornerRadius:](self, "setStackedCornerRadius:", 8.0);
  -[_UITabBarBehaviorSettings setInlineLeadingPadding:](self, "setInlineLeadingPadding:", 35.0);
  -[_UITabBarBehaviorSettings setInlineTrailingPadding:](self, "setInlineTrailingPadding:", 40.0);
  -[_UITabBarBehaviorSettings setInlineTopInset:](self, "setInlineTopInset:", 4.0);
  -[_UITabBarBehaviorSettings setInlineBottomInset:](self, "setInlineBottomInset:", 4.0);
  -[_UITabBarBehaviorSettings setInlineCornerRadius:](self, "setInlineCornerRadius:", 8.0);
  -[_UITabBarBehaviorSettings setInlineHomeButtonVerticalOffset:](self, "setInlineHomeButtonVerticalOffset:", -0.5);
  -[_UITabBarBehaviorSettings setInlineHomeAffordanceVerticalOffset:](self, "setInlineHomeAffordanceVerticalOffset:", 0.5);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[2];
  void *v40;
  _QWORD v41[14];

  v41[12] = *MEMORY[0x1E0C80C00];
  v30 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Leading Padding (vertically stacked)"), CFSTR("stackedLeadingPadding"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "between:and:", 0.0, 80.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v37;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Trailing Padding (vertically stacked)"), CFSTR("stackedTrailingPadding"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "between:and:", 0.0, 80.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v35;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Top Inset (vertically stacked)"), CFSTR("stackedTopInset"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "between:and:", -5.0, 5.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v33;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Bottom Inset (vertically stacked)"), CFSTR("stackedBottomInset"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "between:and:", -5.0, 5.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v29;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Corner Radius (vertically stacked)"), CFSTR("stackedCornerRadius"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "between:and:", 4.0, 20.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v27;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Leading Padding (inline)"), CFSTR("inlineLeadingPadding"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "between:and:", 0.0, 80.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v41[5] = v25;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Trailing Padding (inline)"), CFSTR("inlineTrailingPadding"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "between:and:", 0.0, 80.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v41[6] = v23;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Top Inset (inline)"), CFSTR("inlineTopInset"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "between:and:", -5.0, 5.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v41[7] = v2;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Bottom Inset (inline)"), CFSTR("inlineBottomInset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", -5.0, 5.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v41[8] = v4;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Corner Radius (inline)"), CFSTR("inlineCornerRadius"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "between:and:", 4.0, 20.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41[9] = v6;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Vertical Offset (inline, home button devices)"), CFSTR("inlineHomeButtonVerticalOffset"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "between:and:", -5.0, 5.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41[10] = v8;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Vertical Offset (inline, home affordance devices)"), CFSTR("inlineHomeAffordanceVerticalOffset"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", -5.0, 5.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v41[11] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sectionWithRows:title:", v11, CFSTR("TabBar Button Highlight"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "actionWithSettingsKeyPath:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:action:", CFSTR("Restore Defaults"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0D83078];
  v40 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionWithRows:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83078];
  v39[0] = v31;
  v39[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "moduleWithTitle:contents:", 0, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (double)stackedLeadingPadding
{
  return self->_stackedLeadingPadding;
}

- (void)setStackedLeadingPadding:(double)a3
{
  self->_stackedLeadingPadding = a3;
}

- (double)stackedTrailingPadding
{
  return self->_stackedTrailingPadding;
}

- (void)setStackedTrailingPadding:(double)a3
{
  self->_stackedTrailingPadding = a3;
}

- (double)stackedTopInset
{
  return self->_stackedTopInset;
}

- (void)setStackedTopInset:(double)a3
{
  self->_stackedTopInset = a3;
}

- (double)stackedBottomInset
{
  return self->_stackedBottomInset;
}

- (void)setStackedBottomInset:(double)a3
{
  self->_stackedBottomInset = a3;
}

- (double)stackedCornerRadius
{
  return self->_stackedCornerRadius;
}

- (void)setStackedCornerRadius:(double)a3
{
  self->_stackedCornerRadius = a3;
}

- (double)inlineLeadingPadding
{
  return self->_inlineLeadingPadding;
}

- (void)setInlineLeadingPadding:(double)a3
{
  self->_inlineLeadingPadding = a3;
}

- (double)inlineTrailingPadding
{
  return self->_inlineTrailingPadding;
}

- (void)setInlineTrailingPadding:(double)a3
{
  self->_inlineTrailingPadding = a3;
}

- (double)inlineTopInset
{
  return self->_inlineTopInset;
}

- (void)setInlineTopInset:(double)a3
{
  self->_inlineTopInset = a3;
}

- (double)inlineBottomInset
{
  return self->_inlineBottomInset;
}

- (void)setInlineBottomInset:(double)a3
{
  self->_inlineBottomInset = a3;
}

- (double)inlineCornerRadius
{
  return self->_inlineCornerRadius;
}

- (void)setInlineCornerRadius:(double)a3
{
  self->_inlineCornerRadius = a3;
}

- (double)inlineHomeButtonVerticalOffset
{
  return self->_inlineHomeButtonVerticalOffset;
}

- (void)setInlineHomeButtonVerticalOffset:(double)a3
{
  self->_inlineHomeButtonVerticalOffset = a3;
}

- (double)inlineHomeAffordanceVerticalOffset
{
  return self->_inlineHomeAffordanceVerticalOffset;
}

- (void)setInlineHomeAffordanceVerticalOffset:(double)a3
{
  self->_inlineHomeAffordanceVerticalOffset = a3;
}

@end
