@implementation SBHIconResizingSettings

- (void)setDefaultValues
{
  -[SBHIconResizingSettings setResizeHandleFollowsIconCornerRadius:](self, "setResizeHandleFollowsIconCornerRadius:", 0);
  -[SBHIconResizingSettings setResizeHandleLineWidth:](self, "setResizeHandleLineWidth:", 13.0);
  -[SBHIconResizingSettings setResizeHandleLineLength:](self, "setResizeHandleLineLength:", 36.0);
  -[SBHIconResizingSettings setResizeHandleCornerRadius:](self, "setResizeHandleCornerRadius:", 18.0);
  -[SBHIconResizingSettings setResizeHandleHorizontalOffset:](self, "setResizeHandleHorizontalOffset:", -1.0);
  -[SBHIconResizingSettings setResizeHandleVerticalOffset:](self, "setResizeHandleVerticalOffset:", -1.0);
  -[SBHIconResizingSettings setResizeHandleUsesTruncatedSectorHitArea:](self, "setResizeHandleUsesTruncatedSectorHitArea:", 0);
  -[SBHIconResizingSettings setResizeHandleHitAreaTopInset:](self, "setResizeHandleHitAreaTopInset:", -15.0);
  -[SBHIconResizingSettings setResizeHandleHitAreaLeadingInset:](self, "setResizeHandleHitAreaLeadingInset:", -15.0);
  -[SBHIconResizingSettings setResizeHandleHitAreaTrailingInset:](self, "setResizeHandleHitAreaTrailingInset:", -15.0);
  -[SBHIconResizingSettings setResizeHandleHitAreaBottomInset:](self, "setResizeHandleHitAreaBottomInset:", -15.0);
  -[SBHIconResizingSettings setResizeHandleTruncatedSectorHitAreaTopInset:](self, "setResizeHandleTruncatedSectorHitAreaTopInset:", 0.0);
  -[SBHIconResizingSettings setResizeHandleTruncatedSectorHitAreaLeadingInset:](self, "setResizeHandleTruncatedSectorHitAreaLeadingInset:", 0.0);
  -[SBHIconResizingSettings setResizeHandleTruncatedSectorHitAreaTrailingInset:](self, "setResizeHandleTruncatedSectorHitAreaTrailingInset:", -20.0);
  -[SBHIconResizingSettings setResizeHandleTruncatedSectorHitAreaBottomInset:](self, "setResizeHandleTruncatedSectorHitAreaBottomInset:", 0.0);
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
  void *v21;
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
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[2];
  void *v44;
  _QWORD v45[13];

  v45[11] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Follow Icon Corner Radius"), CFSTR("resizeHandleFollowsIconCornerRadius"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v42;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Line Width"), CFSTR("resizeHandleLineWidth"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "between:and:", 0.0, 30.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "precision:", 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v39;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Line Length"), CFSTR("resizeHandleLineLength"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "between:and:", 0.0, 200.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "precision:", 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v36;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Custom Corner Radius"), CFSTR("resizeHandleCornerRadius"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "between:and:", 0.0, 200.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "precision:", 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v33;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Horizontal Offset"), CFSTR("resizeHandleHorizontalOffset"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "between:and:", 0.0, 50.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "precision:", 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v30;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Vertical Offset"), CFSTR("resizeHandleVerticalOffset"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "between:and:", 0.0, 50.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "precision:", 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v27;
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Use Arc Hit Area"), CFSTR("resizeHandleUsesTruncatedSectorHitArea"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v26;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Arc Hit Area Top End Cap Inset"), CFSTR("resizeHandleTruncatedSectorHitAreaTopInset"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "between:and:", -50.0, 50.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "precision:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v2;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Arc Hit Area Leading Edge Inset"), CFSTR("resizeHandleTruncatedSectorHitAreaLeadingInset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", -50.0, 50.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45[8] = v5;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Arc Hit Area Trailing Edge Inset"), CFSTR("resizeHandleTruncatedSectorHitAreaTrailingInset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", -50.0, 50.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "precision:", 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[9] = v8;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Arc Hit Area Bottom End Cap Inset"), CFSTR("resizeHandleTruncatedSectorHitAreaBottomInset"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", -50.0, 50.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "precision:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v45[10] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:", v23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rowWithTitle:action:", CFSTR("Restore Defaults"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83078];
  v44 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionWithRows:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0D83078];
  v43[0] = v12;
  v43[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "moduleWithTitle:contents:", CFSTR("Icon Resizing"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)resizeHandleFollowsIconCornerRadius
{
  return self->_resizeHandleFollowsIconCornerRadius;
}

- (void)setResizeHandleFollowsIconCornerRadius:(BOOL)a3
{
  self->_resizeHandleFollowsIconCornerRadius = a3;
}

- (double)resizeHandleLineWidth
{
  return self->_resizeHandleLineWidth;
}

- (void)setResizeHandleLineWidth:(double)a3
{
  self->_resizeHandleLineWidth = a3;
}

- (double)resizeHandleLineLength
{
  return self->_resizeHandleLineLength;
}

- (void)setResizeHandleLineLength:(double)a3
{
  self->_resizeHandleLineLength = a3;
}

- (double)resizeHandleCornerRadius
{
  return self->_resizeHandleCornerRadius;
}

- (void)setResizeHandleCornerRadius:(double)a3
{
  self->_resizeHandleCornerRadius = a3;
}

- (double)resizeHandleHorizontalOffset
{
  return self->_resizeHandleHorizontalOffset;
}

- (void)setResizeHandleHorizontalOffset:(double)a3
{
  self->_resizeHandleHorizontalOffset = a3;
}

- (double)resizeHandleVerticalOffset
{
  return self->_resizeHandleVerticalOffset;
}

- (void)setResizeHandleVerticalOffset:(double)a3
{
  self->_resizeHandleVerticalOffset = a3;
}

- (BOOL)resizeHandleUsesTruncatedSectorHitArea
{
  return self->_resizeHandleUsesTruncatedSectorHitArea;
}

- (void)setResizeHandleUsesTruncatedSectorHitArea:(BOOL)a3
{
  self->_resizeHandleUsesTruncatedSectorHitArea = a3;
}

- (double)resizeHandleHitAreaTopInset
{
  return self->_resizeHandleHitAreaTopInset;
}

- (void)setResizeHandleHitAreaTopInset:(double)a3
{
  self->_resizeHandleHitAreaTopInset = a3;
}

- (double)resizeHandleHitAreaLeadingInset
{
  return self->_resizeHandleHitAreaLeadingInset;
}

- (void)setResizeHandleHitAreaLeadingInset:(double)a3
{
  self->_resizeHandleHitAreaLeadingInset = a3;
}

- (double)resizeHandleHitAreaTrailingInset
{
  return self->_resizeHandleHitAreaTrailingInset;
}

- (void)setResizeHandleHitAreaTrailingInset:(double)a3
{
  self->_resizeHandleHitAreaTrailingInset = a3;
}

- (double)resizeHandleHitAreaBottomInset
{
  return self->_resizeHandleHitAreaBottomInset;
}

- (void)setResizeHandleHitAreaBottomInset:(double)a3
{
  self->_resizeHandleHitAreaBottomInset = a3;
}

- (double)resizeHandleTruncatedSectorHitAreaTopInset
{
  return self->_resizeHandleTruncatedSectorHitAreaTopInset;
}

- (void)setResizeHandleTruncatedSectorHitAreaTopInset:(double)a3
{
  self->_resizeHandleTruncatedSectorHitAreaTopInset = a3;
}

- (double)resizeHandleTruncatedSectorHitAreaLeadingInset
{
  return self->_resizeHandleTruncatedSectorHitAreaLeadingInset;
}

- (void)setResizeHandleTruncatedSectorHitAreaLeadingInset:(double)a3
{
  self->_resizeHandleTruncatedSectorHitAreaLeadingInset = a3;
}

- (double)resizeHandleTruncatedSectorHitAreaTrailingInset
{
  return self->_resizeHandleTruncatedSectorHitAreaTrailingInset;
}

- (void)setResizeHandleTruncatedSectorHitAreaTrailingInset:(double)a3
{
  self->_resizeHandleTruncatedSectorHitAreaTrailingInset = a3;
}

- (double)resizeHandleTruncatedSectorHitAreaBottomInset
{
  return self->_resizeHandleTruncatedSectorHitAreaBottomInset;
}

- (void)setResizeHandleTruncatedSectorHitAreaBottomInset:(double)a3
{
  self->_resizeHandleTruncatedSectorHitAreaBottomInset = a3;
}

@end
