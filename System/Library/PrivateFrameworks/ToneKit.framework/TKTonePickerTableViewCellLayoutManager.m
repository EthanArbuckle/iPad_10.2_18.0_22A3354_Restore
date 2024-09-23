@implementation TKTonePickerTableViewCellLayoutManager

- (CGRect)_adjustedTextFrameWithOriginalTextFrame:(CGRect)a3 forCell:(id)a4
{
  double x;
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double MaxX;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double MinX;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat width;
  CGFloat y;
  CGFloat height;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect result;

  y = a3.origin.y;
  height = a3.size.height;
  width = a3.size.width;
  x = a3.origin.x;
  v6 = a4;
  objc_msgSend(v6, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v6, "safeAreaInsets");
  v17 = v16;
  v19 = v18;
  v20 = (void *)MEMORY[0x24BDF6F90];
  v21 = objc_msgSend(v6, "semanticContentAttribute");

  v22 = objc_msgSend(v20, "userInterfaceLayoutDirectionForSemanticContentAttribute:", v21);
  -[TKTonePickerTableViewCellLayoutManager minimumTextIndentation](self, "minimumTextIndentation");
  v24 = v23;
  if (v22)
  {
    v40.origin.x = v9;
    v40.origin.y = v11;
    v40.size.width = v13;
    v40.size.height = v15;
    MaxX = CGRectGetMaxX(v40);
    v41.origin.x = x;
    v27 = width;
    v26 = y;
    v41.origin.y = y;
    v41.size.width = width;
    v28 = height;
    v41.size.height = height;
    MinX = MaxX - CGRectGetMaxX(v41);
    v17 = v19;
  }
  else
  {
    v42.origin.x = x;
    v27 = width;
    v26 = y;
    v42.origin.y = y;
    v42.size.width = width;
    v28 = height;
    v42.size.height = height;
    MinX = CGRectGetMinX(v42);
  }
  v30 = v24 - MinX - v17;
  v31 = 0.0;
  if (v30 >= 0.0)
    v31 = v30;
  v32 = -0.0;
  if (!v22)
    v32 = v31;
  v33 = x + v32;
  v34 = v27 - v31;
  v35 = v26;
  v36 = v28;
  result.size.height = v36;
  result.size.width = v34;
  result.origin.y = v35;
  result.origin.x = v33;
  return result;
}

- (CGRect)textRectForCell:(id)a3 rowWidth:(double)a4 forSizing:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  CGRect result;

  v5 = a5;
  v21.receiver = self;
  v21.super_class = (Class)TKTonePickerTableViewCellLayoutManager;
  v8 = a3;
  -[UITableViewCellLayoutManager textRectForCell:rowWidth:forSizing:](&v21, sel_textRectForCell_rowWidth_forSizing_, v8, v5, a4);
  -[TKTonePickerTableViewCellLayoutManager _adjustedTextFrameWithOriginalTextFrame:forCell:](self, "_adjustedTextFrameWithOriginalTextFrame:forCell:", v8, v21.receiver, v21.super_class);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (double)minimumTextIndentation
{
  return self->_minimumTextIndentation;
}

- (void)setMinimumTextIndentation:(double)a3
{
  self->_minimumTextIndentation = a3;
}

@end
