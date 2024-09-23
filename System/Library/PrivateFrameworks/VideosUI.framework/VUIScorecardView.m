@implementation VUIScorecardView

- (void)setDelegate:(id)a3
{
  VUIScorecardViewDelegate **p_delegate;
  id v5;

  p_delegate = &self->_delegate;
  v5 = a3;
  objc_storeWeak((id *)p_delegate, v5);
  self->_delegateRespondsToBackgroundImageForScorecardViewMaterial = objc_opt_respondsToSelector() & 1;
  LOBYTE(p_delegate) = objc_opt_respondsToSelector();

  self->_delegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex = p_delegate & 1;
}

- (void)invalidateData
{
  NSArray *rowScoreValueSizes;

  self->_didCalculatedSize = 0;
  self->_scorecardSize = (CGSize)*MEMORY[0x1E0C9D820];
  self->_interitemSpacing = 0.0;
  rowScoreValueSizes = self->_rowScoreValueSizes;
  self->_rowScoreValueSizes = 0;

  self->_delegateRespondsToBackgroundImageForScorecardViewMaterial = 0;
  self->_delegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex = 0;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  if (!self->_didCalculatedSize)
    -[VUIScorecardView _calculateMetricsOfScorecard](self, "_calculateMetricsOfScorecard", a3.width, a3.height);
  width = self->_scorecardSize.width;
  height = self->_scorecardSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_calculateColumnSpacing
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSArray *v17;
  NSArray *columnWidths;
  id v19;

  -[VUIScorecardView delegate](self, "delegate");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "styleForScorecardView:", self) == 1)
  {
    v3 = -[NSArray count](self->_rowScoreValueSizes, "count");

    if (!v3)
      return;
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSArray objectAtIndexedSubscript:](self->_rowScoreValueSizes, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v6 = 0;
      do
      {
        if (-[NSArray count](self->_rowScoreValueSizes, "count"))
        {
          v7 = 0;
          v8 = 0.0;
          do
          {
            -[NSArray objectAtIndexedSubscript:](self->_rowScoreValueSizes, "objectAtIndexedSubscript:", v7);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "objectAtIndexedSubscript:", v6);
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "CGSizeValue");
            v12 = v11;

            if (v12 >= v8)
              v8 = v12;
            ++v7;
          }
          while (v7 < -[NSArray count](self->_rowScoreValueSizes, "count"));
        }
        v13 = (void *)MEMORY[0x1E0CB37E8];
        VUIRoundValue();
        objc_msgSend(v13, "numberWithDouble:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:atIndexedSubscript:", v14, v6);

        ++v6;
        -[NSArray objectAtIndexedSubscript:](self->_rowScoreValueSizes, "objectAtIndexedSubscript:", 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

      }
      while (v6 < v16);
    }
    v17 = (NSArray *)objc_msgSend(v19, "copy");
    columnWidths = self->_columnWidths;
    self->_columnWidths = v17;

  }
}

- (void)drawRect:(CGRect)a3
{
  uint64_t v4;
  double v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  VUIScoreboardLayout *scoreboardLayout;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  float v21;
  double width;
  double v23;
  void *v24;
  void *v25;
  CGBlendMode v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  id v49;
  CGRect v50;

  if (self->_delegateRespondsToBackgroundImageForScorecardViewMaterial)
  {
    if (!self->_didCalculatedSize)
      -[VUIScorecardView _calculateMetricsOfScorecard](self, "_calculateMetricsOfScorecard", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    -[VUIScorecardView delegate](self, "delegate", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v49 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "backgroundImageForScorecardViewMaterial:", self);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      objc_msgSend(v44, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
      v48 = objc_msgSend(v49, "styleForScorecardView:", self);
      v4 = objc_msgSend(v49, "numberOfRowsInScorecardView:", self);
      -[VUIScoreboardLayout padding](self->_scoreboardLayout, "padding");
      v47 = v5;
      v45 = v4;
      if (v4 >= 1)
      {
        v6 = 0;
        v46 = *MEMORY[0x1E0DC1138];
        v7 = 0.0;
        do
        {
          v8 = objc_msgSend(v49, "numberOfScoreValuesForScorecardView:inRow:", self, v6);
          scoreboardLayout = self->_scoreboardLayout;
          if (v6 == 2)
            -[VUIScoreboardLayout bottomRowLayout](scoreboardLayout, "bottomRowLayout");
          else
            -[VUIScoreboardLayout topRowLayout](scoreboardLayout, "topRowLayout");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8 >= 1)
          {
            v11 = 0;
            v12 = 0.0;
            do
            {
              objc_msgSend(v49, "scoreValue:inRow:atIndex:", self, v6, v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSArray objectAtIndexedSubscript:](self->_rowScoreValueSizes, "objectAtIndexedSubscript:", v6);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectAtIndexedSubscript:", v11);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "CGSizeValue");
              v17 = v16;
              v19 = v18;

              if (v48)
              {
                -[NSArray objectAtIndexedSubscript:](self->_columnWidths, "objectAtIndexedSubscript:", v11);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "floatValue");
                v17 = v21;

              }
              else
              {
                if (v12 != 0.0)
                {
                  width = self->_scorecardSize.width;
                  if (v12 + v17 < width)
                    v17 = width - v12;
                }
                if (v6 == 2)
                  v17 = self->_scorecardSize.width;
              }
              if (self->_delegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex)
              {
                v23 = v19 + v47 * 2.0;
                objc_msgSend(v10, "backgroundColor");
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                if (v24)
                {
                  objc_msgSend(v10, "backgroundColor");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "setFill");

                  v26 = objc_msgSend(v10, "backgroundBlendMode");
                  v50.origin.x = v12;
                  v50.origin.y = v7;
                  v50.size.width = v17;
                  v50.size.height = v23;
                  UIRectFillUsingBlendMode(v50, v26);
                }
                -[VUIScoreboardLayout textLayout](self->_scoreboardLayout, "textLayout");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "color");
                v28 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v28, "set");
                -[VUIScoreboardLayout textLayout](self->_scoreboardLayout, "textLayout");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = v29;
                if (v6 == 2)
                  v31 = 1;
                else
                  v31 = 2 * (v11 != 0);
                objc_msgSend(v29, "setAlignment:", v31);
                objc_msgSend(v30, "attributedStringWithString:view:", v13, self);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "attribute:atIndex:effectiveRange:", v46, 0, 0);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "marginsForRow:atIndex:", v6, v11);
                v37 = v36;
                if (v6 == 2)
                  v38 = 0.0;
                else
                  v38 = v34;
                v39 = v12 + v38;
                if (v6 == 2)
                  v40 = 0.0;
                else
                  v40 = v35;
                objc_msgSend(v33, "ascender");
                VUIRoundValue();
                objc_msgSend(v32, "drawWithRect:options:context:", 32, 0, v39, v37 + v7 + v41, v17 - v40, v23);

              }
              v12 = v12 + v17;

              ++v11;
            }
            while (v8 != v11);
          }
          -[NSArray objectAtIndexedSubscript:](self->_rowHeights, "objectAtIndexedSubscript:", v6);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "doubleValue");
          v7 = v7 + v43;

          ++v6;
        }
        while (v6 != v45);
      }
    }

  }
}

- (CGSize)_calculateMetricsOfScorecard
{
  CGFloat width;
  CGFloat height;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  NSArray *v33;
  NSArray *rowHeights;
  double j;
  NSArray *v36;
  NSArray *rowScoreValueSizes;
  double v38;
  double v39;
  uint64_t v40;
  id v41;
  void *v42;
  uint64_t v43;
  double v44;
  CGSize result;

  if (self->_didCalculatedSize)
  {
    width = self->_scorecardSize.width;
    height = self->_scorecardSize.height;
  }
  else
  {
    v41 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VUIScorecardView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numberOfRowsInScorecardView:", self);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v6;
    if (v6 < 1)
    {
      v11 = 0.0;
      v10 = 0.0;
    }
    else
    {
      v7 = 0;
      v8 = *MEMORY[0x1E0C9D820];
      v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      v10 = 0.0;
      v11 = 0.0;
      do
      {
        v44 = v11;
        v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v13 = objc_msgSend(v5, "numberOfScoreValuesForScorecardView:inRow:", self, v7);
        v14 = 0.0;
        v15 = 0.0;
        v43 = v13 - 1;
        if (v13 >= 1)
        {
          v16 = v13;
          for (i = 0; i != v16; ++i)
          {
            objc_msgSend(v5, "scoreValue:inRow:atIndex:", self, v7, i);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[VUIScoreboardLayout textLayout](self->_scoreboardLayout, "textLayout");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "attributedStringWithString:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "boundingRectWithSize:options:context:", 41, 0, v8, v9);
            objc_msgSend(v20, "boundingRectWithSize:options:context:", 33, 0, v8, v9);
            objc_msgSend(v5, "marginsForRow:atIndex:", v7, i);
            v22 = v21;
            v24 = v23;
            VUIRoundValue();
            v26 = v24 + v25 + v22;
            VUIRoundValue();
            if (v15 <= v27)
              v15 = v27;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v26, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v28);

            v14 = v14 + v26;
          }
        }
        objc_msgSend(v5, "marginsForRow:atIndex:", v7, 0);
        v31 = v30 + v15 + v29;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:atIndexedSubscript:", v32, v7);

        v11 = v44 + v31;
        objc_msgSend(v41, "addObject:", v12);
        if (v10 < v14 + (double)v43 * 8.0)
          v10 = v14 + (double)v43 * 8.0;

        ++v7;
      }
      while (v7 != v40);
    }
    v33 = (NSArray *)objc_msgSend(v42, "copy");
    rowHeights = self->_rowHeights;
    self->_rowHeights = v33;

    for (j = 8.0; v10 < v11; v10 = v10 + 1.0)
      j = j + 1.0;
    self->_interitemSpacing = j;
    v36 = (NSArray *)objc_msgSend(v41, "copy");
    rowScoreValueSizes = self->_rowScoreValueSizes;
    self->_rowScoreValueSizes = v36;

    self->_scorecardSize.width = v10;
    self->_scorecardSize.height = v11;
    -[VUIScorecardView _calculateColumnSpacing](self, "_calculateColumnSpacing");
    self->_didCalculatedSize = 1;
    width = self->_scorecardSize.width;
    height = self->_scorecardSize.height;

  }
  v38 = width;
  v39 = height;
  result.height = v39;
  result.width = v38;
  return result;
}

- (VUIScorecardViewDelegate)delegate
{
  return (VUIScorecardViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (VUIScoreboardLayout)scoreboardLayout
{
  return self->_scoreboardLayout;
}

- (void)setScoreboardLayout:(id)a3
{
  objc_storeStrong((id *)&self->_scoreboardLayout, a3);
}

- (BOOL)didCalculatedSize
{
  return self->_didCalculatedSize;
}

- (void)setDidCalculatedSize:(BOOL)a3
{
  self->_didCalculatedSize = a3;
}

- (CGSize)scorecardSize
{
  double width;
  double height;
  CGSize result;

  width = self->_scorecardSize.width;
  height = self->_scorecardSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setScorecardSize:(CGSize)a3
{
  self->_scorecardSize = a3;
}

- (double)interitemSpacing
{
  return self->_interitemSpacing;
}

- (void)setInteritemSpacing:(double)a3
{
  self->_interitemSpacing = a3;
}

- (NSArray)rowScoreValueSizes
{
  return self->_rowScoreValueSizes;
}

- (void)setRowScoreValueSizes:(id)a3
{
  objc_storeStrong((id *)&self->_rowScoreValueSizes, a3);
}

- (NSArray)columnWidths
{
  return self->_columnWidths;
}

- (void)setColumnWidths:(id)a3
{
  objc_storeStrong((id *)&self->_columnWidths, a3);
}

- (NSArray)rowHeights
{
  return self->_rowHeights;
}

- (void)setRowHeights:(id)a3
{
  objc_storeStrong((id *)&self->_rowHeights, a3);
}

- (UIImage)darkMaterialImage
{
  return self->_darkMaterialImage;
}

- (void)setDarkMaterialImage:(id)a3
{
  objc_storeStrong((id *)&self->_darkMaterialImage, a3);
}

- (BOOL)delegateRespondsToBackgroundImageForScorecardViewMaterial
{
  return self->_delegateRespondsToBackgroundImageForScorecardViewMaterial;
}

- (void)setDelegateRespondsToBackgroundImageForScorecardViewMaterial:(BOOL)a3
{
  self->_delegateRespondsToBackgroundImageForScorecardViewMaterial = a3;
}

- (BOOL)delegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex
{
  return self->_delegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex;
}

- (void)setDelegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex:(BOOL)a3
{
  self->_delegateRespondsToBackgroundBlendModeForScoreValueInRowAtIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkMaterialImage, 0);
  objc_storeStrong((id *)&self->_rowHeights, 0);
  objc_storeStrong((id *)&self->_columnWidths, 0);
  objc_storeStrong((id *)&self->_rowScoreValueSizes, 0);
  objc_storeStrong((id *)&self->_scoreboardLayout, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
