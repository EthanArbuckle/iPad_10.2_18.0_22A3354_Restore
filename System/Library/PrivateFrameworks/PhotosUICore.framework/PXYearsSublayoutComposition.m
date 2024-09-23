@implementation PXYearsSublayoutComposition

- (void)setMetrics:(id)a3
{
  PXYearsLayoutMetrics *v4;
  BOOL v5;
  PXYearsLayoutMetrics *v6;
  PXYearsLayoutMetrics *metrics;
  PXYearsLayoutMetrics *v8;

  v8 = (PXYearsLayoutMetrics *)a3;
  v4 = self->_metrics;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[PXYearsLayoutMetrics isEqual:](v8, "isEqual:", v4);

    if (!v5)
    {
      v6 = (PXYearsLayoutMetrics *)-[PXYearsLayoutMetrics copy](v8, "copy");
      metrics = self->_metrics;
      self->_metrics = v6;

      -[PXGGeneratedSublayoutComposition invalidateLayout](self, "invalidateLayout");
    }
  }

}

- (id)configuredLayoutGenerator
{
  int64_t v3;
  void *v4;
  void *v5;
  PXYearsLayoutGenerator *layoutGenerator;
  PXYearsLayoutGenerator *v7;
  PXYearsLayoutGenerator *v8;
  PXYearsLayoutGenerator *v9;

  v3 = -[PXGSublayoutComposition numberOfSublayouts](self, "numberOfSublayouts");
  -[PXYearsSublayoutComposition metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  -[PXGSublayoutComposition referenceSize](self, "referenceSize");
  objc_msgSend(v5, "setReferenceSize:");
  layoutGenerator = self->_layoutGenerator;
  if (layoutGenerator)
  {
    -[PXYearsLayoutGenerator setMetrics:](layoutGenerator, "setMetrics:", v5);
  }
  else
  {
    v7 = -[PXYearsLayoutGenerator initWithMetrics:]([PXYearsLayoutGenerator alloc], "initWithMetrics:", v5);
    v8 = self->_layoutGenerator;
    self->_layoutGenerator = v7;

  }
  -[PXYearsLayoutGenerator setItemCount:](self->_layoutGenerator, "setItemCount:", v3);
  v9 = self->_layoutGenerator;

  return v9;
}

- (int64_t)presentedNumberOfColumns
{
  return -[PXYearsLayoutGenerator presentedNumberOfColumns](self->_layoutGenerator, "presentedNumberOfColumns");
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
    objc_msgSend(v5, "yearsPadding");
    goto LABEL_10;
  }
  if (a3 != 2)
  {
    if (a3 != 1)
      goto LABEL_14;
    +[PXKeyboardSettings sharedInstance](PXKeyboardSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "yearsFocusAnimationStyle");
    objc_msgSend(v5, "yearsFocusPadding");
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
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXYearsSublayoutComposition.m"), 75, CFSTR("Code which should be unreachable has been reached"));

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

- (PXYearsLayoutMetrics)metrics
{
  return self->_metrics;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_layoutGenerator, 0);
}

@end
