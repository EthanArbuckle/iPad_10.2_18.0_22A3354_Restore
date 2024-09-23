@implementation TLKManyTrailingGridLayoutManager

- (CGSize)sizeForFittingSize:(CGSize)a3 forRow:(id)a4
{
  double height;
  double width;
  id v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  unint64_t v21;
  double v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  objc_super v34;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[TLKGridLayoutManager cachedFittingSize](self, "cachedFittingSize");
  if (width != v9 || height != v8)
  {
    -[TLKGridLayoutManager setCachedFittingSize:](self, "setCachedFittingSize:", width, height);
    -[TLKGridLayoutManager gridArrangement](self, "gridArrangement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutSizeFittingSize:", width, height);
    -[TLKGridLayoutManager setCachedGridSize:](self, "setCachedGridSize:");

    -[TLKGridLayoutManager itemsForRows](self, "itemsForRows");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v14 = 0;
      v15 = 0.0;
      do
      {
        -[TLKGridLayoutManager itemsForRows](self, "itemsForRows");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "sizeForTargetSize:", width, height);
        if (v15 < v19)
          v15 = v19;

        ++v14;
        -[TLKGridLayoutManager itemsForRows](self, "itemsForRows");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

      }
      while (v14 < v21);
    }
    else
    {
      v15 = 0.0;
    }
    +[TLKLabelItem minimumWidthForLabelItem](TLKLabelItem, "minimumWidthForLabelItem");
    v23 = vcvtmd_u64_f64((width - v15) / v22);
    -[TLKGridLayoutManager alignments](self, "alignments");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "count") - v23;

    if (v25 > 0)
      v26 = 1;
    else
      v26 = 0x7FFFFFFFFFFFFFFFLL;
    -[TLKManyTrailingGridLayoutManager setIgnoreRange:](self, "setIgnoreRange:", v26, v25 & ~(v25 >> 63));
    -[TLKGridLayoutManager gridArrangement](self, "gridArrangement");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "reloadData");

  }
  v34.receiver = self;
  v34.super_class = (Class)TLKManyTrailingGridLayoutManager;
  -[TLKGridLayoutManager sizeForFittingSize:forRow:](&v34, sel_sizeForFittingSize_forRow_, v7, width, height);
  v29 = v28;
  v31 = v30;

  v32 = v29;
  v33 = v31;
  result.height = v33;
  result.width = v32;
  return result;
}

- (double)gridArrangement:(id)a3 widthOfColumnAtIndex:(int64_t)a4 spacingAfter:(double *)a5
{
  double result;
  unint64_t v8;
  unint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TLKManyTrailingGridLayoutManager;
  -[TLKGridLayoutManager gridArrangement:widthOfColumnAtIndex:spacingAfter:](&v10, sel_gridArrangement_widthOfColumnAtIndex_spacingAfter_, a3, a4, a5);
  if (-[TLKManyTrailingGridLayoutManager ignoreRange](self, "ignoreRange") == 0x7FFFFFFFFFFFFFFFLL)
    return *MEMORY[0x1E0CFAA78];
  v8 = -[TLKManyTrailingGridLayoutManager ignoreRange](self, "ignoreRange");
  if (a4 < v8)
    return *MEMORY[0x1E0CFAA78];
  result = 0.0;
  if (a4 - v8 >= v9)
    return *MEMORY[0x1E0CFAA78];
  return result;
}

+ (id)computeTruncationForAlignments:(id)a3 indexForFirstTrailingColumn:(unint64_t)a4 totalEqualColumns:(unint64_t)a5
{
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    do
    {
      if (v7)
      {
        v8 = &unk_1E5C16540;
        v9 = v7;
      }
      else
      {
        v8 = &unk_1E5C16530;
        v9 = 0;
      }
      objc_msgSend(v6, "setObject:atIndexedSubscript:", v8, v9);
      ++v7;
    }
    while (v7 < objc_msgSend(v5, "count"));
  }

  return v6;
}

- (_NSRange)ignoreRange
{
  _NSRange *p_ignoreRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_ignoreRange = &self->_ignoreRange;
  location = self->_ignoreRange.location;
  length = p_ignoreRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setIgnoreRange:(_NSRange)a3
{
  self->_ignoreRange = a3;
}

@end
