@implementation TUICandidateSortControl

- (void)commonInit
{
  id v3;
  UISegmentedControl *v4;
  UISegmentedControl *segmentedControl;

  v3 = objc_alloc(MEMORY[0x1E0DC3C58]);
  -[TUICandidateSortControl segmentedControlFrame](self, "segmentedControlFrame");
  v4 = (UISegmentedControl *)objc_msgSend(v3, "initWithFrame:");
  segmentedControl = self->_segmentedControl;
  self->_segmentedControl = v4;

  -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", self, sel_handleValueChanged, 4096);
  -[TUICandidateSortControl addSubview:](self, "addSubview:", self->_segmentedControl);
}

- (TUICandidateSortControl)initWithFrame:(CGRect)a3
{
  TUICandidateSortControl *v3;
  TUICandidateSortControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateSortControl;
  v3 = -[TUICandidateSortControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[TUICandidateSortControl commonInit](v3, "commonInit");
  return v4;
}

- (TUICandidateSortControl)initWithCoder:(id)a3
{
  TUICandidateSortControl *v3;
  TUICandidateSortControl *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUICandidateSortControl;
  v3 = -[TUICandidateSortControl initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[TUICandidateSortControl commonInit](v3, "commonInit");
  return v4;
}

- (void)layoutSubviews
{
  double MidX;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double MidY;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v16.receiver = self;
  v16.super_class = (Class)TUICandidateSortControl;
  -[TUICandidateSortControl layoutSubviews](&v16, sel_layoutSubviews);
  -[TUICandidateSortControl segmentedControlFrame](self, "segmentedControlFrame");
  -[UISegmentedControl setFrame:](self->_segmentedControl, "setFrame:");
  -[TUICandidateSortControl bounds](self, "bounds");
  MidX = CGRectGetMidX(v17);
  -[TUICandidateSortControl style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortControlPadding");
  v6 = v5;
  -[TUICandidateSortControl style](self, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortControlPadding");
  v9 = MidX + (v6 - v8) * 0.5;
  -[TUICandidateSortControl bounds](self, "bounds");
  MidY = CGRectGetMidY(v18);
  -[TUICandidateSortControl style](self, "style");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortControlPadding");
  v13 = v12;
  -[TUICandidateSortControl style](self, "style");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortControlPadding");
  -[UISegmentedControl setCenter:](self->_segmentedControl, "setCenter:", v9, MidY + (v13 - v15) * 0.5);

}

- (CGRect)segmentedControlFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[TUICandidateSortControl bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3C58], "defaultHeightForStyle:", 5);
  v8 = v7;
  -[TUICandidateSortControl segmentedControlWidth](self, "segmentedControlWidth");
  v10 = v9;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.size.height = v13;
  result.size.width = v10;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)segmentedControlWidth
{
  double Width;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  CGRect v16;

  -[TUICandidateSortControl bounds](self, "bounds");
  Width = CGRectGetWidth(v16);
  -[TUICandidateSortControl style](self, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortControlPadding");
  v6 = Width - v5;
  -[TUICandidateSortControl style](self, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortControlPadding");
  v9 = v6 - v8;

  -[TUICandidateSortControl style](self, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[TUICandidateSortControl style](self, "style");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "performSelector:", sel_maximizeSortControlWidthWithPadding);

    if (v12)
      return v9;
  }
  else
  {

  }
  v13 = v9 + -10.0;
  if (Width >= 320.0)
  {
    v14 = 320.0;
    if (Width < 452.0)
      v14 = Width + -17.0;
  }
  else
  {
    v14 = Width + -10.0;
  }
  if (v14 < v13)
    v13 = v14;
  if (v13 >= 0.0)
    return v13;
  else
    return 0.0;
}

- (void)setStyle:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((-[TUICandidateViewStyle isEqual:](self->_style, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_style, a3);
    if (v5)
    {
      -[TUICandidateSortControl segmentedControl](self, "segmentedControl");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *MEMORY[0x1E0DC32A0];
      v7 = v21;
      objc_msgSend(v5, "sortControlFont");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v8;
      v22 = *MEMORY[0x1E0DC32A8];
      v9 = v22;
      objc_msgSend(v5, "textColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v21, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTitleTextAttributes:forState:", v11, 0);

      -[TUICandidateSortControl segmentedControl](self, "segmentedControl");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v7;
      objc_msgSend(v5, "sortControlFont");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19[1] = v9;
      v20[0] = v13;
      objc_msgSend(v5, "textColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTitleTextAttributes:forState:", v15, 4);

    }
    objc_msgSend(v5, "sortControlColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateSortControl segmentedControl](self, "segmentedControl");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTintColor:", v16);

    objc_msgSend(v5, "sortControlBackgroundColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUICandidateSortControl setBackgroundColor:](self, "setBackgroundColor:", v18);

    -[TUICandidateSortControl setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setTitles:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *titles;
  unint64_t v7;
  UISegmentedControl *segmentedControl;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((-[NSArray isEqual:](self->_titles, "isEqual:", v4) & 1) == 0)
  {
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    titles = self->_titles;
    self->_titles = v5;

    -[UISegmentedControl removeAllSegments](self->_segmentedControl, "removeAllSegments");
    v7 = objc_msgSend(v4, "count");
    segmentedControl = self->_segmentedControl;
    if (v7 > 1)
    {
      -[UISegmentedControl setHidden:](segmentedControl, "setHidden:", 0);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v9 = self->_titles;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v15;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v15 != v12)
              objc_enumerationMutation(v9);
            -[UISegmentedControl insertSegmentWithTitle:atIndex:animated:](self->_segmentedControl, "insertSegmentWithTitle:atIndex:animated:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), -[UISegmentedControl numberOfSegments](self->_segmentedControl, "numberOfSegments", (_QWORD)v14), 0);
          }
          while (v11 != v13);
          v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v11);
      }

      if (-[NSArray count](self->_titles, "count"))
        -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", 0);
      -[TUICandidateSortControl setNeedsLayout](self, "setNeedsLayout", (_QWORD)v14);
    }
    else
    {
      -[UISegmentedControl setHidden:](segmentedControl, "setHidden:", 1);
    }
  }

}

- (int64_t)selectedIndex
{
  void *v2;
  int64_t v3;

  -[TUICandidateSortControl segmentedControl](self, "segmentedControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectedSegmentIndex");

  return v3;
}

- (void)setSelectedIndex:(int64_t)a3
{
  id v4;

  -[TUICandidateSortControl segmentedControl](self, "segmentedControl");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSelectedSegmentIndex:", a3);

}

- (void)handleValueChanged
{
  -[TUICandidateSortControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (NSArray)titles
{
  return self->_titles;
}

- (TUICandidateViewStyle)style
{
  return self->_style;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_titles, 0);
}

@end
