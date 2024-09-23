@implementation PXMonthsSublayoutComposition

- (void)setMetrics:(id)a3
{
  PXMonthsLayoutMetrics *v4;
  BOOL v5;
  PXMonthsLayoutMetrics *v6;
  PXMonthsLayoutMetrics *metrics;
  PXMonthsLayoutMetrics *v8;

  v8 = (PXMonthsLayoutMetrics *)a3;
  v4 = self->_metrics;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXMonthsLayoutMetrics isEqual:](v8, "isEqual:", v4);

    if (!v5)
    {
      v6 = (PXMonthsLayoutMetrics *)-[PXMonthsLayoutMetrics copy](v8, "copy");
      metrics = self->_metrics;
      self->_metrics = v6;

      -[PXGGeneratedSublayoutComposition invalidateLayout](self, "invalidateLayout");
    }
  }

}

- (void)updateSublayoutAttributes
{
  id v3;
  id v4;
  void *v5;
  int64_t v6;
  id v7;
  id v8;
  NSIndexSet *v9;
  NSIndexSet *indexesOfChapterHeaders;
  NSIndexSet *v11;
  NSIndexSet *indexesOfHeroes;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  -[PXGSublayoutComposition layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXGSublayoutComposition numberOfSublayouts](self, "numberOfSublayouts");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__PXMonthsSublayoutComposition_updateSublayoutAttributes__block_invoke;
  v14[3] = &unk_1E513B760;
  v15 = v5;
  v16 = v3;
  v17 = v4;
  v7 = v4;
  v8 = v3;
  v13 = v5;
  -[PXGSublayoutComposition enumerateSublayoutProvidersForRange:usingBlock:](self, "enumerateSublayoutProvidersForRange:usingBlock:", 0, v6, v14);
  v9 = (NSIndexSet *)objc_msgSend(v8, "copy");
  indexesOfChapterHeaders = self->_indexesOfChapterHeaders;
  self->_indexesOfChapterHeaders = v9;

  v11 = (NSIndexSet *)objc_msgSend(v7, "copy");
  indexesOfHeroes = self->_indexesOfHeroes;
  self->_indexesOfHeroes = v11;

}

- (id)configuredLayoutGenerator
{
  void *v3;
  void *v4;
  PXMonthsLayoutGenerator *layoutGenerator;
  PXMonthsLayoutGenerator *v6;
  PXMonthsLayoutGenerator *v7;
  void *v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  PXMonthsLayoutGenerator *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PXMonthsLayoutGenerator *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  -[PXMonthsSublayoutComposition metrics](self, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[PXGSublayoutComposition referenceSize](self, "referenceSize");
  objc_msgSend(v4, "setReferenceSize:");
  layoutGenerator = self->_layoutGenerator;
  if (layoutGenerator)
  {
    -[PXMonthsLayoutGenerator setMetrics:](layoutGenerator, "setMetrics:", v4);
  }
  else
  {
    v6 = -[PXMonthsLayoutGenerator initWithMetrics:]([PXMonthsLayoutGenerator alloc], "initWithMetrics:", v4);
    v7 = self->_layoutGenerator;
    self->_layoutGenerator = v6;

  }
  -[PXMonthsLayoutGenerator setItemCount:](self->_layoutGenerator, "setItemCount:", -[PXGSublayoutComposition numberOfSublayouts](self, "numberOfSublayouts"));
  v8 = (void *)-[NSIndexSet copy](self->_indexesOfChapterHeaders, "copy");
  v9 = (void *)-[NSIndexSet copy](self->_indexesOfHeroes, "copy");
  v10 = objc_alloc((Class)off_1E50B3218);
  v11 = *MEMORY[0x1E0C9D820];
  v12 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v13 = (void *)objc_msgSend(v10, "initWithSize:weight:", *MEMORY[0x1E0C9D820], v12, 0.0);
  v14 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B3218), "initWithSize:weight:", v11, v12, -1.0);
  v15 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B3218), "initWithSize:weight:", v11, v12, 1.0);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __57__PXMonthsSublayoutComposition_configuredLayoutGenerator__block_invoke;
  v24[3] = &unk_1E513B788;
  v25 = v8;
  v26 = v14;
  v27 = v9;
  v28 = v15;
  v29 = v13;
  v16 = self->_layoutGenerator;
  v17 = v13;
  v18 = v15;
  v19 = v9;
  v20 = v14;
  v21 = v8;
  -[PXMonthsLayoutGenerator setItemLayoutInfoBlock:](v16, "setItemLayoutInfoBlock:", v24);
  v22 = self->_layoutGenerator;

  return v22;
}

- (BOOL)presentedSingleColumn
{
  return -[PXMonthsLayoutGenerator presentedSingleColumn](self->_layoutGenerator, "presentedSingleColumn");
}

- (UIEdgeInsets)sublayoutInsetsForStylableType:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
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
  void *v19;
  UIEdgeInsets result;

  if (!a3)
  {
    +[PXCursorInteractionSettings sharedInstance](PXCursorInteractionSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "monthsPadding");
    goto LABEL_10;
  }
  if (a3 != 2)
  {
    if (a3 != 1)
      goto LABEL_14;
    +[PXKeyboardSettings sharedInstance](PXKeyboardSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "monthsFocusAnimationStyle");
    objc_msgSend(v5, "monthsFocusPadding");
    if (v6 != 2 && v6 != 1)
    {
      if (!v6)
      {
        v7 = *(double *)off_1E50B8020;
        v8 = *((double *)off_1E50B8020 + 1);
        v9 = *((double *)off_1E50B8020 + 2);
        v10 = *((double *)off_1E50B8020 + 3);
LABEL_11:

        goto LABEL_12;
      }

LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMonthsSublayoutComposition.m"), 103, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
LABEL_10:
    PXEdgeInsetsMake();
    v7 = v11;
    v8 = v12;
    v9 = v13;
    v10 = v14;
    goto LABEL_11;
  }
  v7 = *(double *)off_1E50B8020;
  v8 = *((double *)off_1E50B8020 + 1);
  v9 = *((double *)off_1E50B8020 + 2);
  v10 = *((double *)off_1E50B8020 + 3);
LABEL_12:
  v15 = v7;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  result.right = v18;
  result.bottom = v17;
  result.left = v16;
  result.top = v15;
  return result;
}

- (PXMonthsLayoutMetrics)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_layoutGenerator, 0);
  objc_storeStrong((id *)&self->_indexesOfHeroes, 0);
  objc_storeStrong((id *)&self->_indexesOfChapterHeaders, 0);
}

id __57__PXMonthsSublayoutComposition_configuredLayoutGenerator__block_invoke(id *a1, uint64_t a2)
{
  id *v4;
  int v5;

  if (objc_msgSend(a1[4], "containsIndex:", a2))
  {
    v4 = a1 + 5;
  }
  else
  {
    v5 = objc_msgSend(a1[6], "containsIndex:", a2);
    v4 = a1 + 8;
    if (v5)
      v4 = a1 + 7;
  }
  return *v4;
}

uint64_t __57__PXMonthsSublayoutComposition_updateSublayoutAttributes__block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a2, "layout:collectIndexesOfChapterHeaderSublayouts:heroSublayouts:inRange:", a1[4], a1[5], a1[6], a3, a4);
}

@end
