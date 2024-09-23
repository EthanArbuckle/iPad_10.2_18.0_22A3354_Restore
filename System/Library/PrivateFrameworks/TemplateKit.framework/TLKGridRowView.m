@implementation TLKGridRowView

- (TLKGridRowView)init
{
  TLKGridRowView *v2;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TLKGridRowView;
  v2 = -[TLKView init](&v10, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    -[TLKGridRowView setLabels:](v2, "setLabels:", v3);

    v4 = (void *)objc_opt_new();
    -[TLKGridRowView setImageViews:](v2, "setImageViews:", v4);

    v5 = (void *)objc_opt_new();
    -[TLKGridRowView setCurrentListOfViews:](v2, "setCurrentListOfViews:", v5);

    +[TLKUtilities standardTableCellContentInset](TLKUtilities, "standardTableCellContentInset");
    v7 = v6;
    +[TLKUtilities standardTableCellContentInset](TLKUtilities, "standardTableCellContentInset");
    -[TLKGridRowView setLayoutMargins:](v2, "setLayoutMargins:", 12.0, v7, 12.0, v8);
  }
  return v2;
}

- (id)leadingTextView
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[TLKGridRowView currentListOfViews](self, "currentListOfViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v2, "count") < 2)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v4 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v2, "objectAtIndexedSubscript:", 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }

    }
  }

  return v4;
}

- (void)setManager:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TLKGridLayoutManager *v10;

  v10 = (TLKGridLayoutManager *)a3;
  if (self->_manager != v10)
  {
    objc_storeStrong((id *)&self->_manager, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (void)setTableRow:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  TLKTableRow *v10;

  v10 = (TLKTableRow *)a3;
  if (self->_tableRow != v10)
  {
    objc_storeStrong((id *)&self->_tableRow, a3);
    -[TLKView observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKView observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKView observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[TLKGridRowView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isLayoutSizeDependentOnPerpendicularAxis
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  CGSize result;
  CGRect v24;
  CGRect v25;

  height = a3.height;
  width = a3.width;
  -[TLKGridRowView layoutMargins](self, "layoutMargins");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v24.origin.x = 0.0;
  v24.origin.y = 0.0;
  v24.size.width = width;
  v24.size.height = height;
  v25 = CGRectInset(v24, v9, 0.0);
  v12 = v25.size.width;
  v13 = v25.size.height;
  v14 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  -[TLKGridRowView tableRow](self, "tableRow", v25.origin.x, v25.origin.y);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    -[TLKGridRowView manager](self, "manager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[TLKGridRowView manager](self, "manager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLKGridRowView tableRow](self, "tableRow");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sizeForFittingSize:forRow:", v19, v12, v13);
      v14 = v20;

    }
  }
  -[TLKGridRowView setNeedsSizingPass:](self, "setNeedsSizingPass:", 0);
  v21 = v12;
  v22 = v11 + v7 + v14;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  CGFloat v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  CGFloat v12;
  double width;
  double height;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v22;
  void *v23;
  _BOOL4 v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  unint64_t v45;
  double MaxX;
  void *v47;
  void *v48;
  double v49;
  double MinX;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  char isKindOfClass;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[9];
  objc_super v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v73.receiver = self;
  v73.super_class = (Class)TLKGridRowView;
  -[TLKView layoutSubviews](&v73, sel_layoutSubviews);
  -[TLKGridRowView layoutMargins](self, "layoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TLKGridRowView bounds](self, "bounds");
  v12 = v11;
  -[TLKGridRowView bounds](self, "bounds");
  v74.origin.x = 0.0;
  v74.origin.y = 0.0;
  v74.size.width = v12;
  v75 = CGRectInset(v74, v6, 0.0);
  width = v75.size.width;
  height = v75.size.height;
  -[TLKGridRowView tableRow](self, "tableRow", v75.origin.x, v75.origin.y);
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_6;
  v16 = (void *)v15;
  -[TLKGridRowView manager](self, "manager");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    v19 = -[TLKGridRowView needsSizingPass](self, "needsSizingPass");

    if (!v19)
      goto LABEL_6;
    -[TLKGridRowView manager](self, "manager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKGridRowView tableRow](self, "tableRow");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sizeForFittingSize:forRow:", v20, width, height);

  }
LABEL_6:
  if (width != *MEMORY[0x1E0C9D820] || height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    -[TLKGridRowView manager](self, "manager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLKGridRowView tableRow](self, "tableRow");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __32__TLKGridRowView_layoutSubviews__block_invoke;
    v72[3] = &unk_1E5C06F60;
    v72[5] = v4;
    *(CGFloat *)&v72[6] = v6;
    v72[7] = v8;
    v72[8] = v10;
    v72[4] = self;
    objc_msgSend(v22, "placeViewsForSize:forRow:completion:", v23, v72, width, height);

    v24 = +[TLKLayoutUtilities isLTR](TLKLayoutUtilities, "isLTR");
    if (-[TLKGridRowView indexOfFirstCenteredColumnForForcedCentering](self, "indexOfFirstCenteredColumnForForcedCentering"))
    {
      v25 = -[TLKGridRowView indexOfFirstCenteredColumnForForcedCentering](self, "indexOfFirstCenteredColumnForForcedCentering");
      -[TLKGridRowView currentListOfViews](self, "currentListOfViews");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v25 < v27)
      {
        v28 = -[TLKGridRowView indexOfFirstCenteredColumnForForcedCentering](self, "indexOfFirstCenteredColumnForForcedCentering");
        -[TLKGridRowView bounds](self, "bounds");
        v30 = v29;
        v32 = v31;
        -[TLKGridRowView currentListOfViews](self, "currentListOfViews");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", v28);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "frame");
        v36 = v35;
        v38 = v37;

        +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, (v30 - v36) * 0.5);
        v40 = v39;
        +[TLKLayoutUtilities deviceScaledRoundedValue:forView:](TLKLayoutUtilities, "deviceScaledRoundedValue:forView:", self, (v32 - v38) * 0.5);
        v42 = v41;
        -[TLKGridRowView currentListOfViews](self, "currentListOfViews");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectAtIndexedSubscript:", v28);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "setFrame:", v40, v42, v36, v38);

        v45 = v28 + 1;
        if (v45 < -[TLKGridRowView indexOfFirstTrailingColumn](self, "indexOfFirstTrailingColumn"))
        {
          if (v24)
          {
            v76.origin.x = v40;
            v76.origin.y = v42;
            v76.size.width = v36;
            v76.size.height = v38;
            MaxX = CGRectGetMaxX(v76);
            -[TLKGridRowView currentListOfViews](self, "currentListOfViews");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectAtIndexedSubscript:", -[TLKGridRowView indexOfFirstTrailingColumn](self, "indexOfFirstTrailingColumn"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "frame");
            MinX = v49;
          }
          else
          {
            -[TLKGridRowView currentListOfViews](self, "currentListOfViews");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "objectAtIndexedSubscript:", -[TLKGridRowView indexOfFirstTrailingColumn](self, "indexOfFirstTrailingColumn"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "frame");
            MaxX = CGRectGetMaxX(v77);

            v78.origin.x = v40;
            v78.origin.y = v42;
            v78.size.width = v36;
            v78.size.height = v38;
            MinX = CGRectGetMinX(v78);
            -[TLKGridRowView currentListOfViews](self, "currentListOfViews");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "objectAtIndexedSubscript:", -[TLKGridRowView indexOfFirstTrailingColumn](self, "indexOfFirstTrailingColumn"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "frame");
            v40 = v53;
            v42 = v54;
            v36 = v55;
            v38 = v56;
          }
          v79.origin.x = v40;
          v79.origin.y = v42;
          v79.size.width = v36;
          v79.size.height = v38;
          v57 = MinX - CGRectGetMaxX(v79);

          -[TLKGridRowView currentListOfViews](self, "currentListOfViews");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "objectAtIndexedSubscript:", v45);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "frame");
          v61 = v60;
          v63 = v62;

          -[TLKGridRowView currentListOfViews](self, "currentListOfViews");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "objectAtIndexedSubscript:", v45);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v65, "setFrame:", MaxX + 10.0, v61, v57 + -20.0, v63);

          -[TLKGridRowView currentListOfViews](self, "currentListOfViews");
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "objectAtIndexedSubscript:", v45);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            -[TLKGridRowView currentListOfViews](self, "currentListOfViews");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "objectAtIndexedSubscript:", v45);
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            +[TLKFontUtilities preferredFontForTextStyle:maximumContentSizeCategory:](TLKFontUtilities, "preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC48F0]);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "setFont:", v71);

            objc_msgSend(v70, "setTextAlignment:", 4);
          }
        }
      }
    }
  }
}

void __32__TLKGridRowView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a2;
  if (objc_msgSend(v17, "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "frame");
      v6 = v5;
      v8 = v7;
      v10 = v9;
      v12 = v11;

      v13 = v6 + *(double *)(a1 + 48);
      if (fabs(v13) != INFINITY)
      {
        v14 = v8 + *(double *)(a1 + 40);
        if (fabs(v14) != INFINITY && fabs(v10) != INFINITY && fabs(v12) != INFINITY)
        {
          objc_msgSend(*(id *)(a1 + 32), "currentListOfViews");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", v3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setFrame:", v13, v14, v10, v12);

        }
      }
      ++v3;
    }
    while (v3 < objc_msgSend(v17, "count"));
  }

}

- (void)observedPropertiesChanged
{
  void *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  void *v20;
  void *v21;
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
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id obj;
  char *obja;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  -[TLKGridRowView manager](self, "manager");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    return;
  v5 = (void *)v4;
  -[TLKGridRowView tableRow](self, "tableRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    return;
  -[TLKGridRowView resetStateOfAllViews](self, "resetStateOfAllViews");
  -[TLKGridRowView generateLabelsAndImagesIfNecessary](self, "generateLabelsAndImagesIfNecessary");
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  -[TLKGridRowView labels](self, "labels");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (!v7)
    goto LABEL_16;
  v8 = v7;
  v9 = *(_QWORD *)v59;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v59 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v10);
      -[TLKGridRowView tableRow](self, "tableRow");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        -[TLKGridRowView manager](self, "manager");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v2, "tableContainsRowHeaders") & 1) == 0)
        {
          objc_msgSend(v11, "setProminence:", 1);
LABEL_13:

          goto LABEL_14;
        }
      }
      -[TLKGridRowView tableRow](self, "tableRow");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setProminence:", objc_msgSend(v14, "isSubHeader"));

      if ((isKindOfClass & 1) != 0)
        goto LABEL_13;
LABEL_14:

      ++v10;
    }
    while (v8 != v10);
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  }
  while (v8);
LABEL_16:

  -[TLKGridRowView tableRow](self, "tableRow");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "data");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "count"))
  {
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v51 = v16;
    do
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v17, v51);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "hasOnlyImage") & 1) != 0)
      {
        objc_msgSend(v20, "formattedTextItems");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "firstObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "tlkImage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLKGridRowView imageViews](self, "imageViews");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTlkImage:", v23);

        -[TLKGridRowView currentListOfViews](self, "currentListOfViews");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLKGridRowView imageViews](self, "imageViews");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndexedSubscript:", v18);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "addObject:", v28);

        ++v18;
      }
      else if ((objc_msgSend(v20, "hasContent") & 1) != 0 || !v17)
      {
        v29 = (void *)objc_opt_class();
        -[TLKGridRowView labels](self, "labels");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectAtIndexedSubscript:", v19);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLKGridRowView manager](self, "manager");
        obja = v18;
        v32 = v19;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "alignments");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectAtIndexedSubscript:", v17);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "updateLabel:withRichText:alignment:", v31, v20, objc_msgSend(v35, "dataAlignment"));

        v36 = v32;
        v18 = obja;

        v16 = v51;
        -[TLKGridRowView currentListOfViews](self, "currentListOfViews");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[TLKGridRowView labels](self, "labels");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectAtIndexedSubscript:", v36);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addObject:", v39);

        v19 = v36 + 1;
      }

      ++v17;
    }
    while (v17 < objc_msgSend(v16, "count"));
  }
  -[TLKGridRowView manager](self, "manager");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "alignments");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "indexOfObjectPassingTest:", &__block_literal_global_1);

  -[TLKGridRowView manager](self, "manager");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "alignments");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "indexOfObjectPassingTest:", &__block_literal_global_10);

  if (v45 < v42 && v45)
  {
    -[TLKGridRowView setIndexOfFirstCenteredColumnForForcedCentering:](self, "setIndexOfFirstCenteredColumnForForcedCentering:", v45);
    -[TLKGridRowView setIndexOfFirstTrailingColumn:](self, "setIndexOfFirstTrailingColumn:", v42);
  }
  else
  {
    -[TLKGridRowView setIndexOfFirstCenteredColumnForForcedCentering:](self, "setIndexOfFirstCenteredColumnForForcedCentering:", 0x7FFFFFFFFFFFFFFFLL);
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[TLKGridRowView currentListOfViews](self, "currentListOfViews");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v55;
    do
    {
      v50 = 0;
      do
      {
        if (*(_QWORD *)v55 != v49)
          objc_enumerationMutation(v46);
        objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * v50++), "setHidden:", 0);
      }
      while (v48 != v50);
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    }
    while (v48);
  }

  -[TLKGridRowView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[TLKGridRowView setNeedsSizingPass:](self, "setNeedsSizingPass:", 1);

}

BOOL __43__TLKGridRowView_observedPropertiesChanged__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "columnAlignment") == 2;
}

BOOL __43__TLKGridRowView_observedPropertiesChanged__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "columnAlignment") == 1;
}

- (void)resetStateOfAllViews
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TLKGridRowView currentListOfViews](self, "currentListOfViews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = *MEMORY[0x1E0C9D648];
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v12, "setHidden:", 1);
        objc_msgSend(v12, "setFrame:", v7, v8, v9, v10);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  -[TLKGridRowView currentListOfViews](self, "currentListOfViews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeAllObjects");

}

- (void)generateLabelsAndImagesIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[TLKGridRowView tableRow](self, "tableRow", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        if ((objc_msgSend(v11, "hasOnlyImage") & 1) != 0)
        {
          ++v7;
        }
        else
        {
          v12 = objc_msgSend(v11, "hasContent");
          if (v8)
            v13 = v12;
          else
            v13 = 1;
          v8 += v13;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  -[TLKGridRowView labels](self, "labels");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15 < v8)
  {
    do
    {
      v16 = (void *)objc_opt_new();
      -[TLKGridRowView labels](self, "labels");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v16);

      -[TLKGridRowView addSubview:](self, "addSubview:", v16);
      -[TLKGridRowView labels](self, "labels");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

    }
    while (v19 < v8);
  }
  -[TLKGridRowView imageViews](self, "imageViews");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");

  if (v21 < v7)
  {
    do
    {
      v22 = (void *)objc_opt_new();
      +[TLKGridLayoutManager font](TLKGridLayoutManager, "font");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setSymbolFont:", v23);

      -[TLKGridRowView imageViews](self, "imageViews");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v22);

      -[TLKGridRowView addSubview:](self, "addSubview:", v22);
      -[TLKGridRowView imageViews](self, "imageViews");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

    }
    while (v26 < v7);
  }
}

+ (void)updateLabel:(id)a3 withRichText:(id)a4 alignment:(int64_t)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  int64_t v14;

  v7 = a3;
  v8 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__TLKGridRowView_updateLabel_withRichText_alignment___block_invoke;
  v11[3] = &unk_1E5C06E68;
  v13 = v8;
  v14 = a5;
  v12 = v7;
  v9 = v8;
  v10 = v7;
  objc_msgSend(v10, "performBatchUpdates:", v11);

}

uint64_t __53__TLKGridRowView_updateLabel_withRichText_alignment___block_invoke(uint64_t a1)
{
  void *v2;

  +[TLKGridLayoutManager font](TLKGridLayoutManager, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setFont:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setTextAlignment:", *(_QWORD *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "setRichText:", *(_QWORD *)(a1 + 40));
}

- (TLKGridLayoutManager)manager
{
  return self->_manager;
}

- (TLKTableRow)tableRow
{
  return self->_tableRow;
}

- (NSMutableArray)labels
{
  return self->_labels;
}

- (void)setLabels:(id)a3
{
  objc_storeStrong((id *)&self->_labels, a3);
}

- (NSMutableArray)imageViews
{
  return self->_imageViews;
}

- (void)setImageViews:(id)a3
{
  objc_storeStrong((id *)&self->_imageViews, a3);
}

- (NSMutableArray)currentListOfViews
{
  return self->_currentListOfViews;
}

- (void)setCurrentListOfViews:(id)a3
{
  objc_storeStrong((id *)&self->_currentListOfViews, a3);
}

- (unint64_t)indexOfFirstCenteredColumnForForcedCentering
{
  return self->_indexOfFirstCenteredColumnForForcedCentering;
}

- (void)setIndexOfFirstCenteredColumnForForcedCentering:(unint64_t)a3
{
  self->_indexOfFirstCenteredColumnForForcedCentering = a3;
}

- (unint64_t)indexOfFirstTrailingColumn
{
  return self->_indexOfFirstTrailingColumn;
}

- (void)setIndexOfFirstTrailingColumn:(unint64_t)a3
{
  self->_indexOfFirstTrailingColumn = a3;
}

- (BOOL)needsSizingPass
{
  return self->_needsSizingPass;
}

- (void)setNeedsSizingPass:(BOOL)a3
{
  self->_needsSizingPass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentListOfViews, 0);
  objc_storeStrong((id *)&self->_imageViews, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_tableRow, 0);
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
