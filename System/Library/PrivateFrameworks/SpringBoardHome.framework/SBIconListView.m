@implementation SBIconListView

void __43__SBIconListView_enumerateIconsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __47__SBIconListView_enumerateIconViewsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "displayedIconViewForIcon:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = v4;
  }

}

- (id)displayedIconViewForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_iconViews, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (objc_msgSend(v4, "isFolderIcon")
      && -[SBIconListView hasTemporaryModel](self, "hasTemporaryModel"))
    {
      -[SBIconListView temporarilyMappedIconForIcon:](self, "temporarilyMappedIconForIcon:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](self->_iconViews, "objectForKey:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (SBIconListLayout)layout
{
  void *v3;
  void *v4;
  void *v5;

  -[SBIconListView layoutProvider](self, "layoutProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView iconLocation](self, "iconLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutForIconLocation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconListLayout *)v5;
}

- (NSString)iconLocation
{
  return self->_iconLocation;
}

- (SBIconListLayoutProvider)layoutProvider
{
  return self->_layoutProvider;
}

- (double)layoutScale
{
  void *v2;
  double v3;
  double v4;

  -[SBIconListView layout](self, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconImageInfo");
  if (v3 == 0.0)
    v4 = 1.0;
  else
    v4 = v3;

  return v4;
}

uint64_t __36__SBIconListView_setVisiblySettled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setUserVisibilityStatus:", *(_QWORD *)(a1 + 32));
}

void __39__SBIconListView_setContentVisibility___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setContentVisibility:", v3);
  objc_msgSend(v4, "setUserVisibilityStatus:", *(_QWORD *)(a1 + 40));

}

- (id)temporarilyMappedIconForIcon:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSMapTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (-[SBIconListView hasTemporaryModel](self, "hasTemporaryModel"))
  {
    v5 = v4;
    if (objc_msgSend(v4, "isFolderIcon"))
    {
      objc_msgSend(v4, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = self->_iconViews;
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v5 = v4;
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v17 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
            objc_msgSend(v12, "uniqueIdentifier", (_QWORD)v16);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isEqual:", v6);

            if (v14)
            {
              v5 = v12;

              goto LABEL_13;
            }
          }
          v9 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v9)
            continue;
          break;
        }
        v5 = v4;
      }
LABEL_13:

    }
  }

  return v5;
}

- (BOOL)hasTemporaryModel
{
  void *v2;
  BOOL v3;

  -[SBIconListView temporaryModel](self, "temporaryModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (SBIconCoordinate)coordinateForIcon:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  SBIconCoordinate result;

  -[SBIconListView temporarilyMappedIconForIcon:](self, "temporarilyMappedIconForIcon:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView displayedModel](self, "displayedModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBIconListView iconCoordinateForIndex:forOrientation:](self, "iconCoordinateForIndex:forOrientation:", objc_msgSend(v5, "indexForIcon:", v4), -[SBIconListView layoutOrientation](self, "layoutOrientation"));
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.row = v10;
  result.column = v9;
  return result;
}

- (SBIconCoordinate)iconCoordinateForIndex:(unint64_t)a3 forOrientation:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  SBIconCoordinate result;

  -[SBIconListView layoutMetrics](self, "layoutMetrics", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gridCellInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBIconListView iconCoordinateForGridCellIndex:metrics:](self, "iconCoordinateForGridCellIndex:metrics:", objc_msgSend(v7, "gridCellIndexForIconIndex:", a3), v6);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.row = v12;
  result.column = v11;
  return result;
}

- (_NSRange)visibleColumnRange
{
  _NSRange *p_visibleColumnRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_visibleColumnRange = &self->_visibleColumnRange;
  location = self->_visibleColumnRange.location;
  length = p_visibleColumnRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)iconColumnsForCurrentOrientation
{
  void *v3;
  unint64_t v4;

  -[SBIconListView layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfColumnsForOrientation:", -[SBIconListView layoutOrientation](self, "layoutOrientation"));

  return v4;
}

- (int64_t)layoutOrientation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;

  -[SBIconListView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "horizontalSizeClass");
  v5 = objc_msgSend(v3, "verticalSizeClass");
  if (-[SBIconListView adaptsOrientationToTraitCollection](self, "adaptsOrientationToTraitCollection")
    && v4 == 1
    && v5 == 2)
  {
    v6 = 1;
  }
  else
  {
    v6 = -[SBIconListView orientation](self, "orientation");
  }

  return v6;
}

- (BOOL)adaptsOrientationToTraitCollection
{
  return 1;
}

- (unint64_t)columnAtPoint:(CGPoint)a3 fractionOfDistanceThroughColumn:(double *)a4
{
  double y;
  double x;
  void *v8;
  unint64_t v9;

  y = a3.y;
  x = a3.x;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBIconListView columnAtPoint:metrics:fractionOfDistanceThroughColumn:](self, "columnAtPoint:metrics:fractionOfDistanceThroughColumn:", v8, a4, x, y);

  return v9;
}

- (SBIconListViewLayoutMetrics)layoutMetrics
{
  SBIconListViewLayoutMetrics *cachedMetrics;
  void *v4;
  SBIconListViewLayoutMetrics *v5;
  SBIconListViewLayoutMetrics *v6;
  _OWORD v8[13];

  cachedMetrics = self->_cachedMetrics;
  if (!cachedMetrics)
  {
    memset(v8, 0, sizeof(v8));
    -[SBIconListView getLayoutMetricsParameters:](self, "getLayoutMetricsParameters:", v8);
    -[SBIconListView displayedModel](self, "displayedModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "layoutMetricsForParameters:listModel:", v8, v4);
    v5 = (SBIconListViewLayoutMetrics *)objc_claimAutoreleasedReturnValue();
    v6 = self->_cachedMetrics;
    self->_cachedMetrics = v5;

    cachedMetrics = self->_cachedMetrics;
  }
  return cachedMetrics;
}

- (void)hideAllIcons
{
  -[SBIconListView setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:](self, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)setContentVisibility:(unint64_t)a3
{
  unint64_t v5;
  _QWORD v6[6];

  if (self->_contentVisibility != a3)
  {
    self->_contentVisibility = a3;
    v5 = -[SBIconListView iconViewUserVisibilityStatus](self, "iconViewUserVisibilityStatus");
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__SBIconListView_setContentVisibility___block_invoke;
    v6[3] = &__block_descriptor_48_e27_v32__0__SBIconView_8Q16_B24l;
    v6[4] = a3;
    v6[5] = v5;
    -[SBIconListView enumerateIconViewsUsingBlock:](self, "enumerateIconViewsUsingBlock:", v6);
  }
}

- (void)setPredictedVisibleColumn:(SBIconListPredictedVisibleColumn)a3
{
  -[SBIconListView setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:](self, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", self->_visibleColumnRange.location, self->_visibleColumnRange.length, a3.column, *(_QWORD *)&a3.confidence, self->_visibleRowRange.location, self->_visibleRowRange.length, self->_predictedVisibleRow.row, *(_QWORD *)&self->_predictedVisibleRow.confidence);
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (SBIconCoordinate)coordinateForIconAtIndex:(unint64_t)a3
{
  int64_t v3;
  int64_t v4;
  SBIconCoordinate result;

  v3 = -[SBIconListView iconCoordinateForIndex:forOrientation:](self, "iconCoordinateForIndex:forOrientation:", a3, -[SBIconListView layoutOrientation](self, "layoutOrientation"));
  result.row = v4;
  result.column = v3;
  return result;
}

- (void)showAllIcons
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[SBIconListView _allIconsVisibleColumnOrRowRange](self, "_allIconsVisibleColumnOrRowRange");
  -[SBIconListView setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:](self, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", v3, v4, 0x7FFFFFFFFFFFFFFFLL, 0, v3, v4, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (_NSRange)_allIconsVisibleColumnOrRowRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0;
  v3 = -1;
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)getLayoutMetricsParameters:(SBIconListLayoutMetricsParameters *)a3
{
  -[SBIconListView getLayoutMetricsParameters:orientation:](self, "getLayoutMetricsParameters:orientation:", a3, -[SBIconListView layoutOrientation](self, "layoutOrientation"));
}

uint64_t __33__SBIconListView_didMoveToWindow__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertOrRemoveCaptureOnlyBackgroundViewIfNecessaryForIconView:", a2);
}

- (CGRect)rectForDefaultSizedCellAtCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row;
  int64_t column;
  id v7;
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
  double v19;
  _BOOL4 v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _BOOL4 v27;
  _BOOL4 v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  CGRect result;

  row = a3.row;
  column = a3.column;
  v7 = a4;
  objc_msgSend(v7, "iconSize");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "iconSpacing");
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "iconInsets");
  v17 = v16;
  v19 = v18;
  -[SBIconListView layoutScale](self, "layoutScale");
  v20 = -[SBIconListView alignsIconsOnPixelBoundaries](self, "alignsIconsOnPixelBoundaries");
  if (column != 0x7FFFFFFFFFFFFFFFLL && column && row != 0x7FFFFFFFFFFFFFFFLL && row)
  {
    v27 = v20;
    v32 = 0;
    v33 = 0;
    -[SBIconListView _getRTLAwareRowIndex:columnIndex:forGridCellIndex:iconGridSize:metrics:](self, "_getRTLAwareRowIndex:columnIndex:forGridCellIndex:iconGridSize:metrics:", &v33, &v32, -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v7), 65537, v7);
    v22 = v19 + (double)v32 * (v9 + v13);
    v28 = v32 >= 0 && v27;
    if (v28 && objc_msgSend(v7, "needsHorizontalColumnBumps"))
    {
      -[SBIconListView horizontalBumpForColumn:metrics:](self, "horizontalBumpForColumn:metrics:", v32, v7);
      v22 = v22 + v29;
    }
    v21 = v17 + (double)v33 * (v11 + v15);
    if (v27)
    {
      SBFFloatFloorForScale();
      v22 = v30;
      SBFFloatFloorForScale();
      v21 = v31;
    }
  }
  else
  {
    v22 = *MEMORY[0x1E0C9D648];
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v23 = v22;
  v24 = v21;
  v25 = v9;
  v26 = v11;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (unint64_t)columnAtPoint:(CGPoint)a3 metrics:(id)a4 fractionOfDistanceThroughColumn:(double *)a5
{
  double x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  unint64_t v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGRect v29;

  x = a3.x;
  v8 = a4;
  objc_msgSend(v8, "iconSize");
  v10 = v9;
  objc_msgSend(v8, "iconSpacing");
  v12 = v11;
  objc_msgSend(v8, "iconInsets");
  v14 = v13;
  v15 = objc_msgSend(v8, "columnOffset");
  v16 = objc_msgSend(v8, "columnsUsedForLayout");
  if (!v16)
  {
    if (a5)
    {
      v20 = 0;
      *a5 = 0.0;
      goto LABEL_26;
    }
    goto LABEL_16;
  }
  v17 = v16;
  v18 = -[SBIconListView isRTL](self, "isRTL");
  v19 = v17 - 1;
  if (v17 == 1)
  {
    v24 = 0.0;
LABEL_13:
    -[SBIconListView bounds](self, "bounds");
    v26 = (x - v24) / (CGRectGetMaxX(v29) - v24);
    if (!v18)
    {
      if (a5)
        *a5 = v26;
      v20 = v19;
      goto LABEL_26;
    }
    if (a5)
    {
      v20 = 0;
      v27 = 1.0 - v26;
      goto LABEL_25;
    }
LABEL_16:
    v20 = 0;
    goto LABEL_26;
  }
  v20 = 0;
  v21 = v12 * 0.5 + v10 + v14;
  v22 = v10 + v12;
  v23 = 0.0;
  while (1)
  {
    v24 = v21 + v22 * ((double)v15 + (double)v20);
    if (-[SBIconListView alignsIconsOnPixelBoundaries](self, "alignsIconsOnPixelBoundaries")
      && objc_msgSend(v8, "needsHorizontalColumnBumps"))
    {
      -[SBIconListView horizontalBumpForColumn:metrics:](self, "horizontalBumpForColumn:metrics:", v20, v8);
      v24 = v24 + v25;
    }
    if (x < v24)
      break;
    ++v20;
    v23 = v24;
    if (v19 == v20)
      goto LABEL_13;
  }
  v27 = (x - v23) / (v24 - v23);
  if (!v18)
  {
    if (!a5)
      goto LABEL_26;
LABEL_25:
    *a5 = v27;
    goto LABEL_26;
  }
  if (a5)
    *a5 = 1.0 - v27;
  v20 = v19 - v20;
LABEL_26:

  return v20;
}

- (double)horizontalBumpForColumn:(unint64_t)a3 metrics:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v20;

  v6 = a4;
  v7 = 0.0;
  if (-[SBIconListView alignsIconsOnPixelBoundaries](self, "alignsIconsOnPixelBoundaries")
    && objc_msgSend(v6, "needsHorizontalColumnBumps"))
  {
    -[SBIconListView layoutScale](self, "layoutScale");
    v9 = v8;
    v10 = objc_msgSend(v6, "columnsUsedForLayout");
    objc_msgSend(v6, "iconInsets");
    v12 = v11;
    v14 = v13;
    objc_msgSend(v6, "iconSpacing");
    v16 = v15;
    -[SBIconListView bounds](self, "bounds");
    v17 = CGRectGetWidth(v20) - v12 - v14;
    objc_msgSend(v6, "iconSize");
    v7 = SBHIconListLayoutCalculateHorizontalColumnBump(a3, v10, v18, v16, v17, v9);
  }

  return v7;
}

- (BOOL)alignsIconsOnPixelBoundaries
{
  return self->_alignsIconsOnPixelBoundaries;
}

- (BOOL)isRTL
{
  return -[SBIconListView userInterfaceLayoutDirection](self, "userInterfaceLayoutDirection") == 1;
}

- (int64_t)userInterfaceLayoutDirection
{
  unint64_t v2;

  v2 = -[SBIconListView userInterfaceLayoutDirectionHandling](self, "userInterfaceLayoutDirectionHandling");
  if (v2 == 2)
    return 1;
  if (v2)
    return 0;
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
}

- (unint64_t)userInterfaceLayoutDirectionHandling
{
  return self->_userInterfaceLayoutDirectionHandling;
}

- (void)_getRTLAwareRowIndex:(int64_t *)a3 columnIndex:(int64_t *)a4 forGridCellIndex:(unint64_t)a5 iconGridSize:(SBHIconGridSize)a6 metrics:(id)a7
{
  _BOOL4 v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v22 = a7;
  v12 = -[SBIconListView isRTL](self, "isRTL");
  v13 = objc_msgSend(v22, "columns");
  v14 = a5 / v13;
  v15 = a5 % v13;
  if (v12)
  {
    v16 = v13;
    v17 = -[SBIconListView layoutInsetsMode](self, "layoutInsetsMode");
    if (v17 >= 2)
    {
      if (v17 == 2)
      {
        objc_msgSend(v22, "gridCellInfo");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v19, "numberOfUsedColumns");

        objc_msgSend(v22, "gridCellInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v20, "numberOfUsedRows");

      }
      else
      {
        v16 = 0;
        v18 = 0;
      }
    }
    else
    {
      v18 = objc_msgSend(v22, "rows");
    }
    if (-[SBIconListView isVertical](self, "isVertical"))
      v14 = ~v14 + 1 - a6.rows + v18;
    else
      v15 = ~v15 - a6.columns + v16 + 1;
  }
  v21 = objc_msgSend(v22, "columnOffset");
  if (a3)
    *a3 = v14;
  if (a4)
    *a4 = v21 + v15;

}

- (void)setVisiblySettled:(BOOL)a3
{
  unint64_t v4;
  _QWORD v5[5];

  if (self->_visiblySettled != a3)
  {
    self->_visiblySettled = a3;
    v4 = -[SBIconListView iconViewUserVisibilityStatus](self, "iconViewUserVisibilityStatus");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __36__SBIconListView_setVisiblySettled___block_invoke;
    v5[3] = &__block_descriptor_40_e27_v32__0__SBIconView_8Q16_B24l;
    v5[4] = v4;
    -[SBIconListView enumerateIconViewsUsingBlock:](self, "enumerateIconViewsUsingBlock:", v5);
  }
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  void *v4;
  id v7;
  id v8;
  void *v9;
  int v10;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  SBIconListView *v37;

  v7 = a3;
  v8 = a4;
  -[SBIconListView effectiveLayoutDelegateForSelector:](self, "effectiveLayoutDelegateForSelector:", sel_iconListView_willConfigureIconView_forIcon_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconListView:willConfigureIconView:forIcon:", self, v7, v8);
  v10 = objc_msgSend(v7, "isDescendantOfView:", self);
  -[SBIconListView overrideIconImageAppearance](self, "overrideIconImageAppearance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v7, "setOverrideIconImageAppearance:", v11);
  if ((v10 & 1) == 0)
  {
    -[SBIconListView traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sbh_iconImageStyleConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOverrideIconImageStyleConfiguration:", v13);
    v4 = (void *)*MEMORY[0x1E0DC4730];
    v32 = MEMORY[0x1E0C809B0];
    v33 = 3221225472;
    v34 = __44__SBIconListView_configureIconView_forIcon___block_invoke;
    v35 = &unk_1E8D84EF0;
    v36 = v7;
    v37 = self;
    objc_msgSend(v4, "_performBlockAfterCATransactionCommits:", &v32);

  }
  -[SBIconListView iconLocation](self, "iconLocation", v32, v33, v34, v35);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocation:", v14);

  -[SBIconListView layoutProvider](self, "layoutProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setListLayoutProvider:", v15);

  -[SBIconListView folderIconImageCache](self, "folderIconImageCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFolderIconImageCache:", v16);

  objc_msgSend(v8, "gridSizeClass");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v8, "gridSizeClass");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")))
    {
      v18 = 0;
LABEL_9:

      goto LABEL_10;
    }
  }
  -[SBIconListView iconImageCache](self, "iconImageCache");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    goto LABEL_9;
LABEL_10:

  objc_msgSend(v7, "setIconImageCache:", v18);
  objc_msgSend(v7, "setContentVisibility:", -[SBIconListView contentVisibility](self, "contentVisibility"));
  -[SBIconListView legibilitySettings](self, "legibilitySettings");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLegibilitySettings:", v19);

  objc_msgSend(v7, "setEditing:", -[SBIconListView isEditing](self, "isEditing"));
  objc_msgSend(v7, "setContinuityInfo:", 0);
  objc_msgSend(v7, "setUserVisibilityStatus:", -[SBIconListView iconViewUserVisibilityStatus](self, "iconViewUserVisibilityStatus"));
  objc_msgSend(v7, "setAlpha:", 1.0);
  objc_msgSend(v8, "gridSizeClass");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20
    && ((objc_msgSend(v20, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) | v10) & 1) == 0)
  {
    objc_msgSend(v7, "iconImageInfo");
    v23 = v22;
    -[SBIconListView iconImageSizeForGridSizeClass:](self, "iconImageSizeForGridSizeClass:", v21);
    v25 = v24;
    v27 = v26;
    -[SBIconListView continuousCornerRadiusForGridSizeClass:](self, "continuousCornerRadiusForGridSizeClass:", v21);
    objc_msgSend(v7, "setIconImageInfo:", v25, v27, v23, v28);
  }
  else if ((v10 & 1) == 0)
  {
    objc_msgSend(v7, "clearIconImageInfo");
  }
  -[SBIconListView iconViewProvider](self, "iconViewProvider");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "configureIconView:forIcon:", v7, v8);

  objc_msgSend(v7, "setIcon:", v8);
  if (!v21)
  {
    if ((v10 & 1) != 0)
      goto LABEL_18;
    goto LABEL_17;
  }
  if (((objc_msgSend(v21, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) ^ 1 | v10) & 1) == 0)
  {
LABEL_17:
    objc_msgSend(v7, "iconViewSize");
    objc_msgSend(v7, "setBounds:", 0.0, 0.0, v30, v31);
  }
LABEL_18:

}

- (unint64_t)iconViewUserVisibilityStatus
{
  if (-[SBIconListView contentVisibility](self, "contentVisibility"))
    return 1;
  if (-[SBIconListView isVisiblySettled](self, "isVisiblySettled"))
    return 3;
  return 2;
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (BOOL)isVisiblySettled
{
  return self->_visiblySettled;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (SBFolderIconImageCache)folderIconImageCache
{
  return self->_folderIconImageCache;
}

- (void)_addIconViewsForIcons:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  self->_inLayout = 1;
  -[SBIconListView effectiveLayoutDelegateForSelector:](self, "effectiveLayoutDelegateForSelector:", sel_iconListView_willLayoutIconView_);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[SBIconListView iconViewForIcon:](self, "iconViewForIcon:", v14, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconListView centerForIcon:metrics:](self, "centerForIcon:metrics:", v14, v7);
        objc_msgSend(v15, "setCenter:");
        -[SBIconListView addSubview:](self, "addSubview:", v15);
        objc_msgSend(v8, "iconListView:willLayoutIconView:", self, v15);
        objc_msgSend(v15, "layoutIfNeeded");
        -[SBIconListView _insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary:](self, "_insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary:", v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  -[SBIconListView effectiveLayoutDelegateForSelector:](self, "effectiveLayoutDelegateForSelector:", sel_iconListViewDidLayoutIcons_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "iconListViewDidLayoutIcons:", self);
  self->_inLayout = 0;
  -[SBIconListView layoutFocusGuides](self, "layoutFocusGuides");
  if (-[SBIconListView isDisplayingWidgetIntroduction](self, "isDisplayingWidgetIntroduction"))
    -[SBIconListView layoutWidgetIntroductionViews](self, "layoutWidgetIntroductionViews");

}

- (id)iconViewForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableSet *draggingIconViews;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;

  v4 = a3;
  -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView displayedModel](self, "displayedModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v5)
  {
    if (self->_inLayout || objc_msgSend(v6, "directlyContainsIcon:", v4))
    {
      draggingIconViews = self->_draggingIconViews;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __34__SBIconListView_iconViewForIcon___block_invoke;
      v15[3] = &unk_1E8D89618;
      v9 = v4;
      v16 = v9;
      -[NSMutableSet bs_firstObjectPassingTest:](draggingIconViews, "bs_firstObjectPassingTest:", v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5
        || (-[SBIconListView dequeueReusableIconView](self, "dequeueReusableIconView"),
            (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
        || (-[SBIconListView makeIconView](self, "makeIconView"),
            (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        SBLogIcon();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);

        if (v11)
        {
          SBLogIcon();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            -[SBIconListView iconViewForIcon:].cold.1(v9, v12);

        }
        -[SBIconListView configureIconView:forIcon:](self, "configureIconView:forIcon:", v5, v9);
        -[NSMapTable setObject:forKey:](self->_iconViews, "setObject:forKey:", v5, v9);
        -[NSMutableSet removeObject:](self->_draggingIconViews, "removeObject:", v5);
        if (!self->_inLayout)
        {
          -[SBIconListView removedIcons](self, "removedIcons");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v9);

          -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
        }
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)setVisibleColumnRange:(_NSRange)a3 predictedVisibleColumn:(SBIconListPredictedVisibleColumn)a4 visibleRowRange:(_NSRange)a5 predictedVisibleRow:(SBIconListPredictedVisibleRow)a6
{
  NSUInteger length;
  uint64_t location;
  double confidence;
  unint64_t column;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v13;
  unint64_t row;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v19;
  double v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  unint64_t v27;
  double v28;
  _BOOL4 v29;
  NSUInteger v30;
  uint8_t buf[4];
  SBIconListView *v32;
  __int16 v33;
  NSUInteger v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  length = a5.length;
  location = a5.location;
  confidence = a4.confidence;
  column = a4.column;
  v10 = a3.length;
  v11 = a3.location;
  v37 = *MEMORY[0x1E0C80C00];
  if (-[NSHashTable count](self->_iconVisibilityAssertions, "count"))
  {
    location = -[SBIconListView _allIconsVisibleColumnOrRowRange](self, "_allIconsVisibleColumnOrRowRange");
    length = v13;
    row = 0x7FFFFFFFFFFFFFFFLL;
    column = 0x7FFFFFFFFFFFFFFFLL;
    v11 = location;
    v10 = v13;
  }
  else
  {
    row = a6.row;
  }
  v30 = v11;
  v16 = v11 != self->_visibleColumnRange.location || v10 != self->_visibleColumnRange.length;
  v17 = column != self->_predictedVisibleColumn.column || self->_predictedVisibleColumn.confidence != confidence;
  v19 = location != self->_visibleRowRange.location || length != self->_visibleRowRange.length;
  if (row == self->_predictedVisibleRow.row)
  {
    v20 = self->_predictedVisibleRow.confidence;
    v29 = v20 != a6.confidence;
    if (!v16 && !v17 && !v19 && v20 == a6.confidence)
    {
      SBLogIcon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[SBIconListView setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:].cold.1();
      goto LABEL_42;
    }
  }
  else
  {
    v29 = 1;
  }
  v27 = row;
  v28 = confidence;
  if (v16)
  {
    SBLogIcon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v32 = self;
      v33 = 2048;
      v34 = v30;
      v35 = 2048;
      v36 = *(double *)&v10;
      _os_log_debug_impl(&dword_1CFEF3000, v22, OS_LOG_TYPE_DEBUG, "%p: change visible columns to {%lu, %lu}", buf, 0x20u);
    }

  }
  if (v17)
  {
    SBLogIcon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v32 = self;
      v33 = 2048;
      v34 = column;
      v35 = 2048;
      v36 = v28;
      _os_log_debug_impl(&dword_1CFEF3000, v23, OS_LOG_TYPE_DEBUG, "%p: change predicted visible column to %lu (%f)", buf, 0x20u);
    }

  }
  if (v19)
  {
    SBLogIcon();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v32 = self;
      v33 = 2048;
      v34 = location;
      v35 = 2048;
      v36 = *(double *)&length;
      _os_log_debug_impl(&dword_1CFEF3000, v24, OS_LOG_TYPE_DEBUG, "%p: change visible rows to {%lu, %lu}", buf, 0x20u);
    }

  }
  if (v29)
  {
    SBLogIcon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218496;
      v32 = self;
      v33 = 2048;
      v34 = v27;
      v35 = 2048;
      v36 = a6.confidence;
      _os_log_debug_impl(&dword_1CFEF3000, v25, OS_LOG_TYPE_DEBUG, "%p: change predicted visible row to %lu (%f)", buf, 0x20u);
    }

  }
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v21 = objc_claimAutoreleasedReturnValue();
  -[SBIconListView visibleGridCellIndexesWithMetrics:](self, "visibleGridCellIndexesWithMetrics:", v21);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  self->_visibleColumnRange.location = v30;
  self->_visibleColumnRange.length = v10;
  self->_predictedVisibleColumn.column = column;
  self->_predictedVisibleColumn.confidence = v28;
  self->_visibleRowRange.location = location;
  self->_visibleRowRange.length = length;
  self->_predictedVisibleRow.row = v27;
  self->_predictedVisibleRow.confidence = a6.confidence;
  -[SBIconListView _updateVisibleIconViewsWithOldVisibleGridCellIndexes:metrics:](self, "_updateVisibleIconViewsWithOldVisibleGridCellIndexes:metrics:", v26, v21);

LABEL_42:
}

- (void)_insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBIconListView *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *groupNamesToCaptureOnlyBackgroundViews;
  NSMutableDictionary *v11;
  NSMutableDictionary *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  SBIconListViewCaptureOnlyBackgroundAssertion *v18;
  SBIconListViewCaptureOnlyBackgroundAssertion *v19;
  NSMapTable *iconsToCaptureOnlyBackgroundAssertions;
  uint64_t v21;
  NSMapTable *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id location;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "backgroundViewGroupNameBase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      v7 = self;
      objc_sync_enter(v7);
      -[NSMutableDictionary objectForKey:](v7->_groupNamesToCaptureOnlyBackgroundViews, "objectForKey:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v9 = (void *)objc_msgSend(v5, "newCaptureOnlyBackgroundView");
        if (v9)
        {
          -[SBIconListView insertSubview:atIndex:](v7, "insertSubview:atIndex:", v9, 0);
          -[SBIconListView bounds](v7, "bounds");
          objc_msgSend(v9, "setFrame:");
          objc_msgSend(v9, "setAutoresizingMask:", 18);
          groupNamesToCaptureOnlyBackgroundViews = v7->_groupNamesToCaptureOnlyBackgroundViews;
          if (!groupNamesToCaptureOnlyBackgroundViews)
          {
            v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
            v12 = v7->_groupNamesToCaptureOnlyBackgroundViews;
            v7->_groupNamesToCaptureOnlyBackgroundViews = v11;

            groupNamesToCaptureOnlyBackgroundViews = v7->_groupNamesToCaptureOnlyBackgroundViews;
          }
          -[NSMutableDictionary setObject:forKey:](groupNamesToCaptureOnlyBackgroundViews, "setObject:forKey:", v9, v6);
        }

      }
      objc_initWeak(&location, v7);
      objc_msgSend(v5, "icon");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMapTable objectForKey:](v7->_iconsToCaptureOnlyBackgroundAssertions, "objectForKey:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (!v14
        || (objc_msgSend(v14, "groupName"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            v17 = objc_msgSend(v16, "isEqualToString:", v6),
            v16,
            (v17 & 1) == 0))
      {
        objc_msgSend(v15, "invalidate");
        v18 = [SBIconListViewCaptureOnlyBackgroundAssertion alloc];
        v23 = MEMORY[0x1E0C809B0];
        v24 = 3221225472;
        v25 = __82__SBIconListView__insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary___block_invoke;
        v26 = &unk_1E8D898C0;
        objc_copyWeak(&v27, &location);
        v19 = -[SBIconListViewCaptureOnlyBackgroundAssertion initWithIcon:groupName:invalidation:](v18, "initWithIcon:groupName:invalidation:", v13, v6, &v23);
        iconsToCaptureOnlyBackgroundAssertions = v7->_iconsToCaptureOnlyBackgroundAssertions;
        if (!iconsToCaptureOnlyBackgroundAssertions)
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable", v23, v24, v25, v26);
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = v7->_iconsToCaptureOnlyBackgroundAssertions;
          v7->_iconsToCaptureOnlyBackgroundAssertions = (NSMapTable *)v21;

          iconsToCaptureOnlyBackgroundAssertions = v7->_iconsToCaptureOnlyBackgroundAssertions;
        }
        -[NSMapTable setObject:forKey:](iconsToCaptureOnlyBackgroundAssertions, "setObject:forKey:", v19, v13, v23, v24, v25, v26);

        objc_destroyWeak(&v27);
      }

      objc_destroyWeak(&location);
      objc_sync_exit(v7);

    }
  }

}

- (void)removeIconView:(id)a3 force:(BOOL)a4
{
  id v6;
  void *v7;
  NSMutableSet *draggingIconViews;
  NSMutableSet *v9;
  NSMutableSet *v10;
  NSHashTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!a4 && ((objc_msgSend(v6, "isDragging") & 1) != 0 || objc_msgSend(v7, "isAddedToDrag")))
  {
    if ((objc_msgSend(v7, "isCancelingDrag") & 1) == 0)
    {
      objc_msgSend(v7, "setAlpha:", 0.0);
      -[SBIconListView centerForDraggedIconView:](self, "centerForDraggedIconView:", v7);
      objc_msgSend(v7, "setCenter:");
    }
    draggingIconViews = self->_draggingIconViews;
    if (!draggingIconViews)
    {
      v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
      v10 = self->_draggingIconViews;
      self->_draggingIconViews = v9;

      draggingIconViews = self->_draggingIconViews;
    }
    -[NSMutableSet addObject:](draggingIconViews, "addObject:", v7);
    objc_msgSend(v7, "addObserver:", self);
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = self->_layoutObservers;
    v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v16, "iconListView:didRemoveIconView:", self, v7, (_QWORD)v19);
          ++v15;
        }
        while (v13 != v15);
        v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }

    -[SBIconListView iconViewProvider](self, "iconViewProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      objc_msgSend(v17, "recycleIconView:", v7);
    if (objc_msgSend(v7, "isDescendantOfView:", self, (_QWORD)v19))
      objc_msgSend(v7, "removeFromSuperview");

  }
}

- (id)dequeueReusableIconView
{
  void *v3;
  void *v4;
  void *v5;

  -[SBIconListView iconViewProvider](self, "iconViewProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dequeueReusableIconViewOfClass:", -[SBIconListView baseIconViewClass](self, "baseIconViewClass"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SBIconListView layoutProvider](self, "layoutProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setListLayoutProvider:", v5);

    objc_msgSend(v4, "setConfigurationOptions:", -[SBIconListView iconViewConfigurationOptions](self, "iconViewConfigurationOptions"));
  }

  return v4;
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (CGPoint)centerForIconCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row;
  int64_t column;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGPoint result;

  row = a3.row;
  column = a3.column;
  v7 = a4;
  -[SBIconListView originForIconAtCoordinate:metrics:](self, "originForIconAtCoordinate:metrics:", column, row, v7);
  v9 = v8;
  v11 = v10;
  -[SBIconListView iconAtCoordinate:metrics:](self, "iconAtCoordinate:metrics:", column, row, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "gridSizeClass");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView iconImageSizeForGridSizeClass:](self, "iconImageSizeForGridSizeClass:", v14);
    v16 = v15;
    v18 = v17;

  }
  else
  {
    -[SBIconListView iconImageSize](self, "iconImageSize");
    v16 = v19;
    v18 = v20;
  }
  -[objc_class defaultIconImageCenterForIconImageSize:](-[SBIconListView baseIconViewClass](self, "baseIconViewClass"), "defaultIconImageCenterForIconImageSize:", v16, v18);
  v22 = v21;
  v24 = v23;
  objc_msgSend(v7, "iconContentScale");
  v26 = v9 + v22 * v25;
  v27 = v11 + v24 * v25;

  v28 = v26;
  v29 = v27;
  result.y = v29;
  result.x = v28;
  return result;
}

- (Class)baseIconViewClass
{
  return (Class)objc_opt_class();
}

- (SBIconImageInfo)iconImageInfoForGridSizeClass:(SEL)a3
{
  id v5;
  void *v6;
  SBIconImageInfo *result;

  v5 = a4;
  -[SBIconListView layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBHIconListLayoutIconImageInfoForGridSizeClass(v6, v5);

  return result;
}

- (CGPoint)originForIconAtCoordinate:(SBIconCoordinate)a3 metrics:(id)a4 options:(unint64_t)a5
{
  int64_t row;
  int64_t column;
  id v9;
  void *v10;
  __CFString *v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGPoint result;

  row = a3.row;
  column = a3.column;
  v9 = a4;
  if ((a5 & 1) != 0)
  {
    v12 = -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v9);
    objc_msgSend(v9, "gridCellInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v13, "gridSizeForGridCellIndex:", v12);

    -[SBIconListView iconGridSizeClassForIconGridSize:](self, "iconGridSizeClassForIconGridSize:", v12);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconListView iconAtCoordinate:metrics:](self, "iconAtCoordinate:metrics:", column, row, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gridSizeClass");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (v11 == CFSTR("SBHIconGridSizeClassDefault")
    || -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")))
  {
    -[SBIconListView rectForDefaultSizedCellAtCoordinate:metrics:](self, "rectForDefaultSizedCellAtCoordinate:metrics:", column, row, v9);
  }
  else
  {
    -[SBIconListView rectForCellAtIconCoordinate:metrics:options:](self, "rectForCellAtIconCoordinate:metrics:options:", column, row, v9, a5);
  }
  v16 = v14;
  v17 = v15;

  v18 = v16;
  v19 = v17;
  result.y = v19;
  result.x = v18;
  return result;
}

- (id)iconAtCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row;
  int64_t column;
  id v7;
  unint64_t v8;
  void *v9;

  row = a3.row;
  column = a3.column;
  v7 = a4;
  v8 = -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    -[SBIconListView iconAtGridCellIndex:metrics:](self, "iconAtGridCellIndex:metrics:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (CGPoint)originForIconAtCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  -[SBIconListView originForIconAtCoordinate:metrics:options:](self, "originForIconAtCoordinate:metrics:options:", a3.column, a3.row, a4, 0);
  result.y = v5;
  result.x = v4;
  return result;
}

- (unint64_t)iconViewConfigurationOptions
{
  return self->_iconViewConfigurationOptions;
}

- (CGPoint)centerForIcon:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  v6 = a4;
  v7 = a3;
  -[SBIconListView displayedModel](self, "displayedModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "indexForIcon:", v7);

  v10 = -[SBIconListView iconCoordinateForIndex:metrics:](self, "iconCoordinateForIndex:metrics:", v9, v6);
  -[SBIconListView centerForIconCoordinate:metrics:](self, "centerForIconCoordinate:metrics:", v10, v11, v6);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (id)iconAtGridCellIndex:(unint64_t)a3 metrics:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;

  v6 = a4;
  -[SBIconListView displayedModel](self, "displayedModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBIconListView iconIndexForGridCellIndex:metrics:](self, "iconIndexForGridCellIndex:metrics:", a3, v6);

  if (v8 >= objc_msgSend(v7, "numberOfIcons"))
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v7, "iconAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (void)enumerateIconViewsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__SBIconListView_enumerateIconViewsUsingBlock___block_invoke;
  v6[3] = &unk_1E8D89728;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBIconListView enumerateIconsUsingBlock:](self, "enumerateIconsUsingBlock:", v6);

}

- (void)enumerateIconsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  -[SBIconListView displayedModel](self, "displayedModel");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "icons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__SBIconListView_enumerateIconsUsingBlock___block_invoke;
  v8[3] = &unk_1E8D89700;
  v9 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

}

- (SBIconListModel)displayedModel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SBIconListView temporaryModel](self, "temporaryModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SBIconListView model](self, "model");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (SBIconListModel *)v6;
}

- (SBIconListModel)temporaryModel
{
  return self->_temporaryModel;
}

- (SBIconListModel)model
{
  return self->_model;
}

- (SBIconCoordinate)iconCoordinateForIndex:(unint64_t)a3 metrics:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  SBIconCoordinate result;

  v6 = a4;
  objc_msgSend(v6, "gridCellInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBIconListView iconCoordinateForGridCellIndex:metrics:](self, "iconCoordinateForGridCellIndex:metrics:", objc_msgSend(v7, "gridCellIndexForIconIndex:", a3), v6);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.row = v12;
  result.column = v11;
  return result;
}

void __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unsigned int v6;
  unsigned __int16 v7;
  NSUInteger v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  NSUInteger v14;
  NSUInteger length;
  NSRange v16;
  BOOL v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  int v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void (**v42)(_QWORD);
  id v43;
  void *v44;
  void (**v45)(_QWORD);
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  char v63;
  int v64;
  __int16 v65;
  uint64_t v66;
  _QWORD aBlock[4];
  id v68;
  uint64_t v69;
  id v70;
  NSRange v71;
  NSRange v72;

  v5 = a2;
  if (*(_QWORD *)(a1 + 104))
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v5);
    objc_msgSend(v5, "gridSizeClass");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(*(id *)(a1 + 40), "iconGridSizeForClass:");
    v7 = v6;
    v8 = HIWORD(v6);
    v9 = objc_msgSend(*(id *)(a1 + 48), "gridCellIndexForIconIndex:", a3);
    v10 = objc_msgSend(*(id *)(a1 + 48), "coordinateForGridCellIndex:", v9);
    v12 = v11;
    v13 = v7 + v9 - 1;
    v14 = v11 - 1;
    v71.length = v13 % *(_QWORD *)(a1 + 104) - v10 + 2;
    v71.location = v10 - 1;
    length = NSIntersectionRange(v71, *(NSRange *)(a1 + 112)).length;
    v72.location = v14;
    v72.length = v8;
    v16 = NSIntersectionRange(v72, *(NSRange *)(a1 + 128));
    if (v9 == 0x7FFFFFFFFFFFFFFFLL || (length ? (v17 = v16.length == 0) : (v17 = 1), v17))
    {
      if (*(_QWORD *)(a1 + 144) != v10 - 1)
        goto LABEL_21;
      if (*(double *)(a1 + 152) <= 0.0)
        goto LABEL_21;
      v25 = objc_msgSend(*(id *)(a1 + 56), "columns");
      v26 = objc_msgSend(*(id *)(a1 + 56), "rows");
      if (*(_QWORD *)(a1 + 144) == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_21;
      v27 = *(_QWORD *)(a1 + 136);
      v28 = vcvtad_u64_f64(*(double *)(a1 + 152) * (double)v26);
      if (v28 < v27)
        v27 = v28;
      if (v9 / v25 >= v27)
      {
LABEL_21:
        if (*(_QWORD *)(a1 + 160) != v14 || *(double *)(a1 + 168) <= 0.0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 432), "objectForKey:", v5);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            SBLogIcon();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_2_cold_1(v5, v29);

            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 432), "removeObjectForKey:", v5);
            objc_msgSend(*(id *)(a1 + 40), "removeIconView:", v18);
          }
          goto LABEL_43;
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "iconViewForIcon:", v5);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!v18 || (objc_msgSend(*(id *)(a1 + 40), "isLayoutPausedForIconView:", v18) & 1) != 0)
    {
LABEL_43:

      goto LABEL_44;
    }
    objc_msgSend(v18, "setLocation:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v18, "setDebugIconIndex:", a3);
    objc_msgSend(v18, "setCursorHitTestPadding:", *(double *)(a1 + 176), *(double *)(a1 + 184), *(double *)(a1 + 192), *(double *)(a1 + 200));
    if (objc_msgSend(v18, "configurationOptions") != *(_QWORD *)(a1 + 208))
      objc_msgSend(v18, "setConfigurationOptions:");
    v19 = objc_msgSend(*(id *)(a1 + 48), "approximateLayoutPositionForCoordinate:", v10, v12);
    objc_msgSend(v18, "setApproximateLayoutPosition:", v19, v20);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 416), "removeObject:", v5);
    objc_msgSend(v18, "superview");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *(void **)(a1 + 40);
    if (v21 == v22)
    {

    }
    else
    {
      v23 = objc_msgSend(v22, "shouldReparentView:", v18);

      if (v23)
      {
        objc_msgSend(*(id *)(a1 + 40), "_insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary:", v18);
        objc_msgSend(*(id *)(a1 + 40), "addSubview:", v18);
        objc_msgSend(*(id *)(a1 + 72), "addObject:", v5);
        v24 = 1;
        goto LABEL_28;
      }
    }
    v24 = 0;
LABEL_28:
    v30 = objc_msgSend(*(id *)(a1 + 40), "iconCoordinateForGridCellIndex:metrics:", v9, *(_QWORD *)(a1 + 56));
    v32 = v31;
    objc_msgSend(*(id *)(a1 + 40), "centerForIconCoordinate:metrics:", v30, v31, *(_QWORD *)(a1 + 56));
    v34 = v33;
    v36 = v35;
    objc_msgSend(v18, "center");
    LODWORD(v37) = SBFPointEqualToPointAtScale() ^ 1;
    if (v24)
      v38 = 2;
    else
      v38 = 6;
    v39 = *(_QWORD *)(a1 + 224);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_69;
    aBlock[3] = &unk_1E8D84F18;
    v40 = *(id *)(a1 + 80);
    v41 = *(_QWORD *)(a1 + 40);
    v68 = v40;
    v69 = v41;
    v18 = v18;
    v70 = v18;
    v42 = (void (**)(_QWORD))_Block_copy(aBlock);
    v43 = *(id *)(a1 + 88);
    v44 = *(void **)(a1 + 96);
    if (v44 && *(_QWORD *)(a1 + 88))
    {
      objc_msgSend(v44, "iconListView:animatorForLayingOutIconView:proposedAnimator:", *(_QWORD *)(a1 + 40), v18);
      v52 = v24;
      v45 = v42;
      v46 = v30;
      v47 = v32;
      v48 = v37;
      v37 = v38;
      v49 = objc_claimAutoreleasedReturnValue();

      v43 = (id)v49;
      v38 = v37;
      LOBYTE(v37) = v48;
      v32 = v47;
      v30 = v46;
      v42 = v45;
      v24 = v52;
    }
    if (v24 && v43)
    {
      if (*(_BYTE *)(a1 + 232))
      {
LABEL_37:
        v50 = *(_QWORD *)(a1 + 40);
        v54 = v34;
        v55 = v36;
        v56 = v39;
        v57 = 0u;
        v58 = 0u;
        v59 = 0;
        v60 = v30;
        v61 = v32;
        v62 = v24;
        v63 = v37;
        v64 = 0;
        v65 = 0;
        v66 = v38;
        objc_msgSend(v43, "iconListView:wantsAnimatedLayoutForIconView:withParameters:alongsideAnimationBlock:", v50, v18, &v54, v42);
LABEL_40:
        objc_msgSend(v18, "setPaused:forReason:", *(unsigned __int8 *)(a1 + 233), 8);
        if (*(_BYTE *)(a1 + 234))
          objc_msgSend(v18, "setIconContentScalingEnabled:", 1);

        goto LABEL_43;
      }
    }
    else if (v43)
    {
      goto LABEL_37;
    }
    v51 = *(void **)(a1 + 40);
    v54 = v34;
    v55 = v36;
    v56 = v39;
    v57 = 0u;
    v58 = 0u;
    v59 = 0;
    v60 = v30;
    v61 = v32;
    v62 = v24;
    v63 = v37;
    v64 = 0;
    v65 = 0;
    v66 = v38;
    objc_msgSend(v51, "performDefaultAnimatedLayoutUpdateForIconView:withParameters:", v18, &v54);
    v42[2](v42);
    goto LABEL_40;
  }
LABEL_44:

}

- (SBIconCoordinate)iconCoordinateForGridCellIndex:(unint64_t)a3 metrics:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  SBIconCoordinate result;

  v4 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a4, "gridCellInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "coordinateForGridCellIndex:", a3);
    v4 = v8;

  }
  v9 = v5;
  v10 = v4;
  result.row = v10;
  result.column = v9;
  return result;
}

- (unint64_t)iconIndexForGridCellIndex:(unint64_t)a3 metrics:(id)a4
{
  void *v5;
  unint64_t v6;

  objc_msgSend(a4, "gridCellInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "iconIndexForGridCellIndex:", a3);

  return v6;
}

- (unint64_t)gridCellIndexForCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row;
  int64_t column;
  void *v6;
  unint64_t v7;

  row = a3.row;
  column = a3.column;
  objc_msgSend(a4, "gridCellInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "gridCellIndexForCoordinate:", column, row);

  return v7;
}

- (SBHIconGridSize)iconGridSizeForClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  SBHIconGridSize v7;

  v4 = a3;
  -[SBIconListView layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBHIconListLayoutIconGridSizeClassSizes(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (SBHIconGridSize)objc_msgSend(v6, "gridSizeForGridSizeClass:", v4);

  return v7;
}

- (BOOL)isDisplayingWidgetIntroduction
{
  return self->_pronouncedContainerView || self->_widgetIntroductionPopover != 0;
}

- (void)performDefaultAnimatedLayoutUpdateForIconView:(id)a3 withParameters:(SBIconListLayoutAnimationParameters *)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setCenter:", a4->var0.x, a4->var0.y);
  objc_msgSend(v5, "setIconContentScale:", a4->var1);
  if (a4->var3)
    objc_msgSend(v5, "setIconImageInfo:", a4->var2.size.width, a4->var2.size.height, a4->var2.scale, a4->var2.continuousCornerRadius);
  else
    objc_msgSend(v5, "clearIconImageInfo");
  objc_msgSend(v5, "layoutIfNeeded");

}

- (BOOL)isLayoutPausedForIconView:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_pausedLayoutAssertionsForIconViews, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)layoutFocusGuides
{
  NSMutableArray *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  _BOOL8 v22;
  double v23;
  double v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void (**v29)(void *, uint64_t, uint64_t, uint64_t, uint64_t, _BOOL8);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSMutableArray *v44;
  NSMutableArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  NSMutableArray *wrappingFocusGuideViews;
  uint64_t v51;
  uint64_t v52;
  id v53;
  NSMutableArray *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  id v60;
  id v61;
  double v62;
  double v63;
  uint64_t v64;
  _QWORD aBlock[4];
  NSMutableArray *v66;
  SBIconListView *v67;
  NSMutableArray *v68;
  _BYTE v69[128];
  uint64_t v70;
  CGRect v71;
  CGRect v72;

  v70 = *MEMORY[0x1E0C80C00];
  v3 = self->_wrappingFocusGuideViews;
  if (!-[SBIconListView addsFocusGuidesForWrapping](self, "addsFocusGuidesForWrapping")
    || (v4 = -[SBIconListView iconRowsForCurrentOrientation](self, "iconRowsForCurrentOrientation"),
        v4 - 2 > 0x7FFFFFFFFFFFFFFCLL))
  {
    v44 = 0;
    if (!v3)
      goto LABEL_18;
    goto LABEL_10;
  }
  v5 = v4;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView iconImageInfoForGridSizeClass:](self, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault"));
  v8 = v7;
  v9 = -[SBIconListView iconColumnsForCurrentOrientation](self, "iconColumnsForCurrentOrientation");
  objc_msgSend(v6, "iconInsets");
  v11 = v10;
  v13 = v12;
  -[SBIconListView bounds](self, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = -[SBIconListView isRTL](self, "isRTL");
  v71.origin.x = v15;
  v71.origin.y = v17;
  v71.size.width = v19;
  v71.size.height = v21;
  v23 = v11 * 0.5 + CGRectGetMinX(v71);
  v72.origin.x = v15;
  v72.origin.y = v17;
  v72.size.width = v19;
  v72.size.height = v21;
  v24 = CGRectGetMaxX(v72) - v13 * 0.5 + -10.0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  v26 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__SBIconListView_layoutFocusGuides__block_invoke;
  aBlock[3] = &unk_1E8D89870;
  v3 = v3;
  v66 = v3;
  v67 = self;
  v54 = v25;
  v68 = v54;
  v27 = _Block_copy(aBlock);
  v59[0] = v26;
  v59[1] = 3221225472;
  v59[2] = __35__SBIconListView_layoutFocusGuides__block_invoke_2;
  v59[3] = &unk_1E8D89898;
  v59[4] = self;
  v28 = v6;
  v60 = v28;
  v62 = v23;
  v63 = v24;
  v64 = v8;
  v53 = v27;
  v61 = v53;
  v29 = (void (**)(void *, uint64_t, uint64_t, uint64_t, uint64_t, _BOOL8))_Block_copy(v59);
  v30 = 0;
  do
  {
    v31 = -[SBIconListView _coordinateBeforeCoordinate:rows:columns:metrics:](self, "_coordinateBeforeCoordinate:rows:columns:metrics:", 1, ++v30, v5, v9, v28);
    v29[2](v29, 1, v30, v31, v32, v22);
    v33 = -[SBIconListView _coordinateAfterCoordinate:rows:columns:metrics:](self, "_coordinateAfterCoordinate:rows:columns:metrics:", v9, v30, v5, v9, v28);
    v29[2](v29, v9, v30, v33, v34, !v22);
  }
  while (v5 != v30);
  -[SBIconListView icons](self, "icons");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "firstObject");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[SBIconListView coordinateForIcon:](self, "coordinateForIcon:", v36);
  v51 = v38;
  v52 = v37;

  -[SBIconListView icons](self, "icons");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "lastObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = -[SBIconListView coordinateForIcon:](self, "coordinateForIcon:", v40);
  v43 = v42;

  v29[2](v29, v52, v51, v41, v43, v22);
  v29[2](v29, v41, v43, v52, v51, !v22);

  v44 = v54;
  if (v3)
  {
LABEL_10:
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v45 = v3;
    v46 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v47; ++i)
        {
          if (*(_QWORD *)v56 != v48)
            objc_enumerationMutation(v45);
          objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * i), "removeFromSuperview");
        }
        v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
      }
      while (v47);
    }

    -[NSMutableArray removeAllObjects](v45, "removeAllObjects");
  }
LABEL_18:
  wrappingFocusGuideViews = self->_wrappingFocusGuideViews;
  self->_wrappingFocusGuideViews = v44;

}

- (BOOL)addsFocusGuidesForWrapping
{
  return self->_addsFocusGuidesForWrapping;
}

- (NSArray)icons
{
  void *v2;
  void *v3;

  -[SBIconListView displayedModel](self, "displayedModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "icons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)_updateVisibleIconViewsWithOldVisibleGridCellIndexes:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
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
  id v18;

  v6 = a4;
  v7 = a3;
  -[SBIconListView visibleGridCellIndexesWithMetrics:](self, "visibleGridCellIndexesWithMetrics:", v6);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v18, "mutableCopy");
  objc_msgSend(v17, "removeIndexes:", v7);
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v8, "removeIndexes:", v18);
  objc_msgSend(v6, "gridCellInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "listModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconsAtGridCellIndexes:gridCellInfo:", v17, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  objc_msgSend(v10, "iconsAtGridCellIndexes:gridCellInfo:", v7, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "removeObjectsInArray:", v13);
  objc_msgSend(v10, "iconsAtGridCellIndexes:gridCellInfo:", v18, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconsAtGridCellIndexes:gridCellInfo:", v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  objc_msgSend(v16, "removeObjectsInArray:", v14);
  -[SBIconListView _removeIconViewsForIcons:](self, "_removeIconViewsForIcons:", v16);
  -[SBIconListView _addIconViewsForIcons:metrics:](self, "_addIconViewsForIcons:metrics:", v12, v6);

}

- (void)_removeIconViewsForIcons:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_iconViews, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          -[NSMapTable removeObjectForKey:](self->_iconViews, "removeObjectForKey:", v9);
          -[SBIconListView removeIconView:](self, "removeIconView:", v10);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)removeIconView:(id)a3
{
  -[SBIconListView removeIconView:force:](self, "removeIconView:force:", a3, 0);
}

- (BOOL)isDisplayingIcon:(id)a3
{
  void *v3;
  BOOL v4;

  -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)didAddSubview:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBIconListView;
  -[SBIconListView didAddSubview:](&v7, sel_didAddSubview_, v4);
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    -[SBIconListView didAddIconView:](self, "didAddIconView:", v4);

}

- (void)didAddIconView:(id)a3
{
  id v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_layoutObservers;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "iconListView:didAddIconView:", self, v4, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  if (self->_widgetIntroductionPopover)
    -[SBIconListView bringWidgetIntroductionPopoverToFront](self, "bringWidgetIntroductionPopoverToFront");

}

- (void)layoutIconsIfNeeded
{
  -[SBIconListView layoutIconsIfNeededUsingAnimator:options:](self, "layoutIconsIfNeededUsingAnimator:options:", 0, 0);
}

- (void)setIconSpacing:(CGSize)a3
{
  if (a3.width != self->_iconSpacing.width || a3.height != self->_iconSpacing.height)
  {
    self->_iconSpacing = a3;
    -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
    -[SBIconListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (UIEdgeInsets)layoutInsetsForOrientation:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  UIEdgeInsets result;

  -[SBIconListView layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutInsetsForOrientation:", a3);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SBIconListView currentIconLocationTransitionHandler](self, "currentIconLocationTransitionHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "iconLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView layoutProvider](self, "layoutProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "layoutForIconLocation:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "layoutInsetsForOrientation:", a3);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(v15, "progress");
    SBHInterpolateEdgeInsets(v7, v9, v11, v13, v20, v22, v24, v26, v27);

  }
  -[SBIconListView additionalLayoutInsets](self, "additionalLayoutInsets");
  UIEdgeInsetsAdd();
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  v36 = v29;
  v37 = v31;
  v38 = v33;
  v39 = v35;
  result.right = v39;
  result.bottom = v38;
  result.left = v37;
  result.top = v36;
  return result;
}

- (SBIconListViewIconLocationTransitionHandler)currentIconLocationTransitionHandler
{
  return self->_currentIconLocationTransitionHandler;
}

- (UIEdgeInsets)additionalLayoutInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_additionalLayoutInsets.top;
  left = self->_additionalLayoutInsets.left;
  bottom = self->_additionalLayoutInsets.bottom;
  right = self->_additionalLayoutInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)getLayoutMetricsParameters:(SBIconListLayoutMetricsParameters *)a3 orientation:(int64_t)a4
{
  unint64_t v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  id v24;

  -[SBIconListView layout](self, "layout");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[SBIconListView alignsIconsOnPixelBoundaries](self, "alignsIconsOnPixelBoundaries");
  if (-[SBIconListView automaticallyAdjustsLayoutMetricsToFit](self, "automaticallyAdjustsLayoutMetricsToFit"))
    v7 |= 2uLL;
  if (-[SBIconListView isLayoutReversed](self, "isLayoutReversed"))
    v7 |= 4uLL;
  if (-[SBIconListView isLayoutFlipped](self, "isLayoutFlipped"))
    v7 |= 0x20uLL;
  if (-[SBIconListView adjustsColumnPositionsForFullScreenWidth](self, "adjustsColumnPositionsForFullScreenWidth"))
    v7 |= 8uLL;
  if (-[SBIconListView allowsGaps](self, "allowsGaps"))
    v7 |= 0x10uLL;
  -[SBIconListView bounds](self, "bounds");
  a3->var0.origin.x = v8;
  a3->var0.origin.y = v9;
  a3->var0.size.width = v10;
  a3->var0.size.height = v11;
  -[SBIconListView layoutScale](self, "layoutScale");
  a3->var1 = v12;
  a3->var4 = a4;
  -[SBIconListView layoutInsetsForOrientation:](self, "layoutInsetsForOrientation:", a4);
  a3->var2.top = v13;
  a3->var2.left = v14;
  a3->var2.bottom = v15;
  a3->var2.right = v16;
  a3->var3 = -[SBIconListView layoutInsetsMode](self, "layoutInsetsMode");
  a3->var5 = objc_msgSend(v24, "numberOfColumnsForOrientation:", a4);
  a3->var6 = objc_msgSend(v24, "numberOfRowsForOrientation:", a4);
  a3->var7 = objc_msgSend(v24, "numberOfColumnsForOrientation:", 1);
  a3->var8 = objc_msgSend(v24, "numberOfRowsForOrientation:", 1);
  a3->var9 = objc_msgSend(v24, "numberOfColumnsForOrientation:", 3);
  a3->var10 = objc_msgSend(v24, "numberOfRowsForOrientation:", 3);
  -[SBIconListView alignmentIconSize](self, "alignmentIconSize");
  a3->var11.width = v17;
  a3->var11.height = v18;
  -[SBIconListView iconImageSize](self, "iconImageSize");
  a3->var12.width = v19;
  a3->var12.height = v20;
  -[SBIconListView iconContentScale](self, "iconContentScale");
  a3->var13 = v21;
  -[SBIconListView iconSpacing](self, "iconSpacing");
  a3->var14.width = v22;
  a3->var14.height = v23;
  a3->var15 = -[SBIconListView effectiveIconSpacingAxisMatchingBehavior](self, "effectiveIconSpacingAxisMatchingBehavior");
  a3->var16 = v7;

}

- (CGSize)iconImageSize
{
  double v2;
  double v3;
  CGSize result;

  -[SBIconListView iconImageInfoForGridSizeClass:](self, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault"));
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)isLayoutReversed
{
  return self->_layoutReversed;
}

- (int64_t)layoutInsetsMode
{
  return self->_layoutInsetsMode;
}

- (CGSize)iconSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_iconSpacing.width;
  height = self->_iconSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)iconContentScale
{
  return self->_iconContentScale;
}

- (BOOL)automaticallyAdjustsLayoutMetricsToFit
{
  return self->_automaticallyAdjustsLayoutMetricsToFit;
}

- (BOOL)allowsGaps
{
  return self->_allowsGaps;
}

- (BOOL)adjustsColumnPositionsForFullScreenWidth
{
  return self->_adjustsColumnPositionsForFullScreenWidth;
}

+ (id)layoutMetricsForParameters:(SBIconListLayoutMetricsParameters *)a3 listModel:(id)a4
{
  id v6;
  CGFloat x;
  CGFloat y;
  CGFloat height;
  CGFloat width;
  double left;
  double right;
  unint64_t var5;
  unint64_t var6;
  CGFloat v15;
  double var13;
  int64_t var15;
  unint64_t var16;
  CGFloat v19;
  double v20;
  double v21;
  uint64_t v22;
  double (**v23)(double, double, double, double, double);
  double v24;
  double v25;
  double v26;
  char v27;
  double v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  double v33;
  char v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  BOOL v45;
  unint64_t v46;
  unsigned int (**v47)(_QWORD, double, double);
  double v48;
  uint64_t (**v49)(_QWORD, double, double, double, double);
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  void *v54;
  double v55;
  unint64_t v56;
  double v57;
  double v58;
  int64_t var3;
  double v60;
  unint64_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  uint64_t v68;
  unint64_t v69;
  double v70;
  double v71;
  double v72;
  uint64_t v73;
  unint64_t v74;
  SBIconListViewLayoutMetrics *v75;
  double v77;
  id v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  unint64_t v84;
  double var1;
  double bottom;
  double v87;
  double v88;
  double v89;
  double v90;
  double top;
  _QWORD v92[11];
  _QWORD v93[6];
  _QWORD aBlock[13];
  char v95;
  BOOL v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;

  v6 = a4;
  x = a3->var0.origin.x;
  y = a3->var0.origin.y;
  width = a3->var0.size.width;
  height = a3->var0.size.height;
  left = a3->var2.left;
  right = a3->var2.right;
  var1 = a3->var1;
  bottom = a3->var2.bottom;
  var5 = a3->var5;
  var6 = a3->var6;
  v15 = a3->var11.height;
  v90 = a3->var11.width;
  top = a3->var2.top;
  var13 = a3->var13;
  var15 = a3->var15;
  var16 = a3->var16;
  v97.origin.x = a3->var0.origin.x;
  v97.origin.y = y;
  v97.size.width = width;
  v97.size.height = height;
  v19 = CGRectGetWidth(v97);
  v79 = y;
  v80 = x;
  v98.origin.x = x;
  v20 = v19;
  v98.origin.y = y;
  v81 = width;
  v82 = height;
  v98.size.width = width;
  v98.size.height = height;
  v21 = CGRectGetHeight(v98);
  v22 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__SBIconListView_layoutMetricsForParameters_listModel___block_invoke;
  aBlock[3] = &__block_descriptor_106_e39__CGSize_dd_48__0_UIEdgeInsets_dddd_8d40l;
  aBlock[4] = var15;
  aBlock[5] = a3;
  *(double *)&aBlock[6] = v20;
  *(double *)&aBlock[7] = v90;
  v89 = v15;
  *(CGFloat *)&aBlock[8] = v15;
  aBlock[9] = var5;
  v95 = var16 & 1;
  v96 = (var16 & 8) != 0;
  *(double *)&aBlock[10] = var1;
  *(double *)&aBlock[11] = v21;
  aBlock[12] = var6;
  v23 = (double (**)(double, double, double, double, double))_Block_copy(aBlock);
  v24 = v23[2](top, left, bottom, right, var13);
  v26 = v25;
  v27 = 0;
  v84 = var5;
  if ((var16 & 2) != 0 && v20 > 0.0 && v21 > 0.0)
  {
    v77 = v20;
    v27 = 0;
    if (v24 >= 10.0 || (v28 = left + -4.0, left + -4.0 < 20.0))
    {
      v30 = right;
      v29 = left;
    }
    else
    {
      v27 = 0;
      do
      {
        v29 = left;
        v30 = right;
        right = right + -4.0;
        if (right < 20.0)
          break;
        left = v28;
        v24 = ((double (*)(double (**)(double, double, double, double, double), double, double, double, double, double))v23[2])(v23, top, v28, bottom, right, var13);
        v26 = v31;
        v28 = left + -4.0;
        v27 = 1;
        v32 = v24 >= 10.0 || v28 < 20.0;
        v30 = right;
        v29 = left;
      }
      while (!v32);
    }
    v88 = v30;
    v78 = a1;
    if (v26 >= 10.0)
    {
      v40 = v6;
      v41 = top;
      v42 = bottom;
    }
    else
    {
      v35 = v29;
      v36 = top;
      v37 = top + -4.0;
      if (top + -4.0 >= 20.0)
      {
        v43 = bottom;
        do
        {
          v39 = v36;
          v38 = v43;
          v43 = v43 + -4.0;
          if (v43 < 20.0)
            break;
          v36 = v37;
          v24 = ((double (*)(double (**)(double, double, double, double, double)))v23[2])(v23);
          v26 = v44;
          v37 = v36 + -4.0;
          v27 = 1;
          v45 = v44 >= 10.0 || v37 < 20.0;
          v38 = v43;
          v39 = v36;
        }
        while (!v45);
      }
      else
      {
        v38 = bottom;
        v39 = top;
      }
      v40 = v6;
      v41 = v39;
      v42 = v38;
      v29 = v35;
    }
    v93[0] = v22;
    v93[1] = 3221225472;
    v93[2] = __55__SBIconListView_layoutMetricsForParameters_listModel___block_invoke_2;
    v93[3] = &__block_descriptor_48_e18_B24__0_CGSize_dd_8l;
    v93[4] = var5;
    v93[5] = var6;
    v46 = var6;
    v47 = (unsigned int (**)(_QWORD, double, double))_Block_copy(v93);
    v92[0] = v22;
    v92[1] = 3221225472;
    v92[2] = __55__SBIconListView_layoutMetricsForParameters_listModel___block_invoke_3;
    v92[3] = &__block_descriptor_88_e31_B40__0_CGSize_dd_8_CGSize_dd_24l;
    top = v41;
    *(double *)&v92[4] = v41;
    *(double *)&v92[5] = v29;
    v87 = v29;
    v48 = v42;
    *(double *)&v92[6] = v42;
    *(double *)&v92[7] = v88;
    v92[8] = var5;
    *(double *)&v92[9] = var1;
    *(double *)&v92[10] = v77;
    v49 = (uint64_t (**)(_QWORD, double, double, double, double))_Block_copy(v92);
    v34 = 0;
    v51 = v89;
    v50 = v90;
    while ((!v47[2](v47, v24, v26) || (v49[2](v49, v50, v51, v24, v26) & 1) == 0) && var13 >= 0.25)
    {
      var13 = var13 + -0.05;
      v50 = v90 * var13;
      v51 = v89 * var13;
      v24 = ((double (*)(double (**)(double, double, double, double, double), double, double, double, double, double))v23[2])(v23, v41, v87, v48, v88, var13);
      v26 = v52;
      v34 = 1;
    }

    bottom = v48;
    var6 = v46;
    v33 = v88;
    v6 = v40;
    a1 = v78;
  }
  else
  {
    v33 = right;
    v34 = 0;
    v87 = left;
  }
  v53 = objc_msgSend(a1, "gridCellInfoOptionsWithInterfaceOrientation:reversedLayout:flippedLayout:allowGaps:", a3->var4, (a3->var16 >> 2) & 1, (a3->var16 >> 5) & 1, (a3->var16 >> 4) & 1);
  v54 = 0;
  v55 = top;
  if (var6 && var5)
  {
    objc_msgSend(v6, "gridCellInfoForGridSize:options:", ((_DWORD)var6 << 16) | (unint64_t)(unsigned __int16)var5, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v56 = var16 & 8;
  v57 = v90 * var13;
  v58 = v89 * var13;
  var3 = a3->var3;
  v83 = v6;
  if (var3)
  {
    v60 = v33;
    if (a3->var14.width == -123.0)
      goto LABEL_49;
    v61 = var5;
    if (var3 == 2)
      v61 = objc_msgSend(v54, "numberOfUsedColumns");
    v62 = v24;
    if (v56)
    {
      SBFFloatRoundForScale();
      v62 = v63;
    }
    v99.origin.x = v80 + v87;
    v99.origin.y = v79 + top;
    v99.size.width = v81 - (v33 + v87);
    v99.size.height = v82 - (bottom + top);
    v64 = CGRectGetWidth(v99);
    if (v61)
    {
      v65 = var1 * (v62 * (double)(v61 - 1) + (double)v61 * (v90 * var13));
      v66 = (var1 * v64 - (v65 - (double)((int)v65 % (int)var1))) * 0.5;
      v67 = round(v66);
      if (v56)
        v66 = v67;
      v64 = v66 / a3->var1;
      v87 = v87 + v64;
      v60 = v33 + v64;
    }
    if (a3->var3 != 2)
LABEL_49:
      v68 = var5;
    else
      v68 = objc_msgSend(v54, "numberOfUsedColumns", v64);
    if (a3->var14.height == -123.0)
    {
      v55 = top;
      v57 = v90 * var13;
      v33 = v60;
    }
    else
    {
      v69 = var6;
      v55 = top;
      v57 = v90 * var13;
      if (a3->var3 == 2)
        var6 = objc_msgSend(v54, "numberOfUsedRows");
      v70 = a3->var1;
      v100.origin.x = v80 + v87;
      v100.origin.y = v79 + top;
      v33 = v60;
      v100.size.width = v81 - (v60 + v87);
      v100.size.height = v82 - (bottom + top);
      v71 = CGRectGetHeight(v100);
      if (var6)
      {
        v58 = v89 * var13;
        v72 = (v71 * a3->var1 - v70 * (v26 * (double)(var6 - 1) + (double)var6 * (v89 * var13))) * 0.5 / a3->var1;
        v55 = top + v72;
        bottom = bottom + v72;
        var6 = v69;
        goto LABEL_59;
      }
      var6 = v69;
    }
    v58 = v89 * var13;
  }
  else
  {
    v68 = var5;
  }
LABEL_59:
  v73 = var6;
  v74 = var6;
  if (var6 == -1)
    v73 = objc_msgSend(v54, "numberOfUsedRows");
  v75 = objc_alloc_init(SBIconListViewLayoutMetrics);
  -[SBIconListViewLayoutMetrics setIconSpacing:](v75, "setIconSpacing:", v24, v26);
  -[SBIconListViewLayoutMetrics setIconContentScale:](v75, "setIconContentScale:", var13);
  -[SBIconListViewLayoutMetrics setColumns:](v75, "setColumns:", v84);
  -[SBIconListViewLayoutMetrics setRows:](v75, "setRows:", v74);
  -[SBIconListViewLayoutMetrics setColumnsUsedForLayout:](v75, "setColumnsUsedForLayout:", v68);
  -[SBIconListViewLayoutMetrics setRowsUsedForLayout:](v75, "setRowsUsedForLayout:", v73);
  -[SBIconListViewLayoutMetrics setIconSize:](v75, "setIconSize:", v57, v58);
  -[SBIconListViewLayoutMetrics setAlignmentIconSize:](v75, "setAlignmentIconSize:", v90, v89);
  -[SBIconListViewLayoutMetrics setIconImageSize:](v75, "setIconImageSize:", a3->var12.width, a3->var12.height);
  -[SBIconListViewLayoutMetrics setIconInsets:](v75, "setIconInsets:", v55, v87, bottom, v33);
  -[SBIconListViewLayoutMetrics setListModel:](v75, "setListModel:", v83);
  -[SBIconListViewLayoutMetrics setGridCellInfo:](v75, "setGridCellInfo:", v54);
  -[SBIconListViewLayoutMetrics setAdjustedInsetsToFit:](v75, "setAdjustedInsetsToFit:", v27 & 1);
  -[SBIconListViewLayoutMetrics setAdjustedIconContentScaleToFit:](v75, "setAdjustedIconContentScaleToFit:", v34 & 1);
  -[SBIconListViewLayoutMetrics setNeedsHorizontalColumnBumps:](v75, "setNeedsHorizontalColumnBumps:", v56 != 0);

  return v75;
}

uint64_t __55__SBIconListView_layoutMetricsForParameters_listModel___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(result + 32) != 2)
  {
    if (*(double *)(*(_QWORD *)(result + 40) + 176) == -123.0)
    {
      if (!*(_BYTE *)(result + 104))
        return result;
    }
    else if (!*(_BYTE *)(result + 105))
    {
      return result;
    }
    return SBFFloatFloorForScale();
  }
  return result;
}

+ (unint64_t)gridCellInfoOptionsWithInterfaceOrientation:(int64_t)a3 reversedLayout:(BOOL)a4 allowGaps:(BOOL)a5
{
  return objc_msgSend(a1, "gridCellInfoOptionsWithInterfaceOrientation:reversedLayout:flippedLayout:allowGaps:", a3, a4, 0, a5);
}

BOOL __55__SBIconListView_layoutMetricsForParameters_listModel___block_invoke_3(uint64_t a1, double a2, double a3, double a4)
{
  double v6;

  SBFFloatFloorForScale();
  return a4 > 0.0 && v6 <= *(double *)(a1 + 80);
}

BOOL __55__SBIconListView_layoutMetricsForParameters_listModel___block_invoke_2(uint64_t a1, double a2, double a3)
{
  return (a2 >= 10.0 || *(_QWORD *)(a1 + 32) <= 1uLL) && (a3 >= 10.0 || *(_QWORD *)(a1 + 40) <= 1uLL);
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (void)updateEditingStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[NSMapTable keyEnumerator](self->_iconViews, "keyEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView _updateEditingStateForIcons:animated:](self, "_updateEditingStateForIcons:animated:", v6, v3);

  if (-[SBIconListView automaticallyShowsEmptyGridCellsWhileEditing](self, "automaticallyShowsEmptyGridCellsWhileEditing"))
  {
    -[SBIconListView setShowsEmptyGridCells:animated:](self, "setShowsEmptyGridCells:animated:", -[SBIconListView isEditing](self, "isEditing"), v3);
  }
}

- (void)layoutIconsIfNeededWithAnimationType:(int64_t)a3 options:(unint64_t)a4
{
  int64_t v7;
  id v8;

  v7 = -[SBHIconEditingSettings overrideAnimationType](self->_iconEditingSettings, "overrideAnimationType");
  if (v7 != -1)
    a3 = v7;
  objc_msgSend((id)objc_opt_class(), "builtInAnimatorForAnimationType:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconListView layoutIconsIfNeededUsingAnimator:options:](self, "layoutIconsIfNeededUsingAnimator:options:", v8, a4);

}

- (void)layoutIconsIfNeededUsingAnimator:(id)a3 options:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  _BOOL4 performingSpecialIconAnimations;
  NSObject *v13;
  _BOOL4 v14;
  NSMapTable *specialIconAnimations;
  NSObject *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  NSHashTable *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  _BOOL4 v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  char v81;
  id v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t j;
  uint64_t v88;
  void *v89;
  SBIconListView *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t k;
  uint64_t v95;
  void *v96;
  SBIconListView *v97;
  void *v98;
  NSMutableSet *removedIcons;
  void *v100;
  NSObject *v101;
  void *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  void *v112;
  id v113;
  BOOL v114;
  char v115;
  uint64_t v116;
  id v117;
  unint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  id v123;
  BOOL v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  id v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  _QWORD v134[4];
  id v135;
  SBIconListView *v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _QWORD v141[4];
  id v142;
  SBIconListView *v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  id v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  unint64_t v164;
  uint64_t v165;
  uint64_t v166;
  BOOL v167;
  BOOL v168;
  char v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _QWORD v174[5];
  id v175;
  unint64_t v176;
  _BYTE v177[128];
  _BYTE v178[128];
  uint8_t v179[128];
  uint8_t buf[4];
  void *v181;
  uint64_t v182;

  v182 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBIconListView _teardownLayoutRunloopObserverIfNeeded](self, "_teardownLayoutRunloopObserverIfNeeded");
  if (!self->_needsLayout || self->_purged || self->_rotating)
    goto LABEL_84;
  SBLogWidgets();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %p>"), v10, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v181 = v11;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_ICON_LIST_VIEW", "iconListView=%{public}@", buf, 0xCu);

  }
  if (-[NSMapTable count](self->_specialIconAnimations, "count"))
  {
    if (v6)
    {
      performingSpecialIconAnimations = self->_performingSpecialIconAnimations;
      SBLogWidgets();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_signpost_enabled(v13);
      if (performingSpecialIconAnimations)
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_ICON_LIST_VIEW", "EndedEarly=YES isAnimation=YES ", buf, 2u);
        }

      }
      else
      {
        if (v14)
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v13, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_ICON_LIST_VIEW", "performSpecialIconAnimations isAnimation=YES ", buf, 2u);
        }

        v174[0] = MEMORY[0x1E0C809B0];
        v174[1] = 3221225472;
        v174[2] = __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke;
        v174[3] = &unk_1E8D865D8;
        v174[4] = self;
        v175 = v6;
        v176 = a4;
        -[SBIconListView performSpecialIconAnimationsWithCompletionHandler:](self, "performSpecialIconAnimationsWithCompletionHandler:", v174);

      }
      goto LABEL_84;
    }
    specialIconAnimations = self->_specialIconAnimations;
    self->_specialIconAnimations = 0;

    SBLogWidgets();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_ICON_LIST_VIEW", "animator Nil isAnimation=YES ", buf, 2u);
    }

  }
  v126 = v6;
  self->_inLayout = 1;
  if (-[SBIconListView boundsSizeTracksContentSize](self, "boundsSizeTracksContentSize"))
  {
    -[SBIconListView iconSpacing](self, "iconSpacing");
    v19 = v18;
    v20 = v17;
    if (v18 != -123.0 || v17 != -123.0)
    {
      -[SBIconListView bounds](self, "bounds");
      v24 = v23;
      v26 = v25;
      v27 = v21;
      v28 = v22;
      v29 = 30000.0;
      if (v19 == -123.0)
        v30 = v21;
      else
        v30 = 30000.0;
      if (v20 == -123.0)
        v29 = v22;
      -[SBIconListView sizeThatFits:](self, "sizeThatFits:", v30, v29);
      if (v31 != v27 || v32 != v28)
      {
        -[SBIconListView setBounds:](self, "setBounds:", v24, v26, v31, v32);
        v172 = 0u;
        v173 = 0u;
        v170 = 0u;
        v171 = 0u;
        v34 = self->_layoutObservers;
        v35 = -[NSHashTable countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v170, v179, 16);
        if (v35)
        {
          v36 = v35;
          v37 = *(_QWORD *)v171;
          do
          {
            for (i = 0; i != v36; ++i)
            {
              if (*(_QWORD *)v171 != v37)
                objc_enumerationMutation(v34);
              v39 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * i);
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend(v39, "iconListViewDidChangeBoundsSize:", self);
            }
            v36 = -[NSHashTable countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v170, v179, 16);
          }
          while (v36);
        }

      }
    }
  }
  -[SBIconListView displayedModel](self, "displayedModel");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "icons");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView iconLocation](self, "iconLocation");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v124 = -[SBIconListView pausesIconsForScrolling](self, "pausesIconsForScrolling");
  v40 = -[SBIconListView isLayoutReversed](self, "isLayoutReversed");
  v41 = 2;
  if (!v40)
    v41 = 0;
  v116 = v41;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "gridCellInfo");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = objc_msgSend(v42, "columnsUsedForLayout");
  objc_msgSend(v42, "iconContentScale");
  v44 = v43;
  v115 = objc_msgSend(v42, "adjustedIconContentScaleToFit");
  v118 = -[SBIconListView iconViewConfigurationOptions](self, "iconViewConfigurationOptions");
  v45 = -[SBIconListView visibleColumnRange](self, "visibleColumnRange");
  v109 = v46;
  v110 = v45;
  v47 = -[SBIconListView visibleRowRange](self, "visibleRowRange");
  v107 = v48;
  v108 = v47;
  v49 = -[SBIconListView predictedVisibleColumn](self, "predictedVisibleColumn");
  v103 = v50;
  v104 = v49;
  v51 = -[SBIconListView predictedVisibleRow](self, "predictedVisibleRow");
  v105 = v52;
  v106 = v51;
  v54 = (a4 & 2) == 0 && v126 != 0;
  v114 = v54;
  -[SBIconListView layoutScale](self, "layoutScale");
  v56 = v55;
  objc_msgSend(v42, "iconSpacing");
  -[SBIconListView cursorHitTestingInsetsForIconSpacing:](self, "cursorHitTestingInsetsForIconSpacing:");
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v64 = v63;
  -[SBIconListView effectiveLayoutDelegateForSelector:](self, "effectiveLayoutDelegateForSelector:", sel_iconListView_willLayoutIconView_);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView effectiveLayoutDelegateForSelector:](self, "effectiveLayoutDelegateForSelector:", sel_iconListView_animatorForLayingOutIconView_proposedAnimator_);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[NSMapTable keyEnumerator](self->_iconViews, "keyEnumerator");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "allObjects");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v67, "initWithArray:", v69);

  v141[0] = MEMORY[0x1E0C809B0];
  v141[1] = 3221225472;
  v141[2] = __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_2;
  v141[3] = &unk_1E8D89640;
  v151 = v128;
  v129 = v70;
  v142 = v129;
  v143 = self;
  v71 = v112;
  v144 = v71;
  v152 = v110;
  v153 = v109;
  v154 = v108;
  v155 = v107;
  v156 = v104;
  v157 = v103;
  v72 = v42;
  v6 = v126;
  v113 = v72;
  v145 = v72;
  v158 = v106;
  v159 = v105;
  v111 = v120;
  v146 = v111;
  v160 = v58;
  v161 = v60;
  v162 = v62;
  v163 = v64;
  v164 = v118;
  v123 = v122;
  v147 = v123;
  v165 = v56;
  v166 = v44;
  v73 = v65;
  v148 = v73;
  v74 = v126;
  v149 = v74;
  v75 = v66;
  v150 = v75;
  v167 = v114;
  v168 = v124;
  v169 = v115;
  objc_msgSend(v127, "enumerateObjectsWithOptions:usingBlock:", v116, v141);
  v76 = v74;
  v77 = v76;
  v78 = (uint64_t)v76;
  v119 = v75;
  v121 = v73;
  if (v126)
  {
    v78 = (uint64_t)v76;
    if ((a4 & 1) == 0)
    {
      v78 = (uint64_t)v76;
      if (objc_msgSend(v129, "count"))
      {
        -[SBIconListView effectiveLayoutDelegateForSelector:](self, "effectiveLayoutDelegateForSelector:", sel_iconListView_animatorForRemovingIcons_proposedAnimator_);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = (uint64_t)v77;
        if (v79)
        {
          objc_msgSend(v129, "allObjects");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "iconListView:animatorForRemovingIcons:proposedAnimator:", self, v80, v77);
          v78 = objc_claimAutoreleasedReturnValue();

        }
        v81 = objc_opt_respondsToSelector();

        if ((v81 & 1) != 0)
        {
          v125 = (void *)v78;
          v117 = v71;
          v82 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v137 = 0u;
          v138 = 0u;
          v139 = 0u;
          v140 = 0u;
          v83 = v129;
          v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v137, v178, 16);
          if (v84)
          {
            v85 = v84;
            v86 = *(_QWORD *)v138;
            do
            {
              for (j = 0; j != v85; ++j)
              {
                if (*(_QWORD *)v138 != v86)
                  objc_enumerationMutation(v83);
                v88 = *(_QWORD *)(*((_QWORD *)&v137 + 1) + 8 * j);
                -[NSMapTable objectForKey:](self->_iconViews, "objectForKey:", v88);
                v89 = (void *)objc_claimAutoreleasedReturnValue();
                if (v89)
                {
                  -[NSMapTable removeObjectForKey:](self->_iconViews, "removeObjectForKey:", v88);
                  objc_msgSend(v89, "superview");
                  v90 = (SBIconListView *)objc_claimAutoreleasedReturnValue();

                  if (v90 == self)
                    objc_msgSend(v82, "addObject:", v89);
                }

              }
              v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v137, v178, 16);
            }
            while (v85);
          }

          if (objc_msgSend(v82, "count"))
          {
            v134[0] = MEMORY[0x1E0C809B0];
            v134[1] = 3221225472;
            v134[2] = __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_2_75;
            v134[3] = &unk_1E8D84EF0;
            v82 = v82;
            v135 = v82;
            v136 = self;
            objc_msgSend(v125, "iconListView:wantsAnimatedRemovalForIconViews:completionHandler:", self, v82, v134);

          }
          v6 = v126;
LABEL_74:
          v98 = v102;
          v71 = v117;
          goto LABEL_76;
        }
      }
    }
  }
  v125 = (void *)v78;
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v82 = v129;
  v91 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v130, v177, 16);
  if (v91)
  {
    v92 = v91;
    v117 = v71;
    v93 = *(_QWORD *)v131;
    do
    {
      for (k = 0; k != v92; ++k)
      {
        if (*(_QWORD *)v131 != v93)
          objc_enumerationMutation(v82);
        v95 = *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * k);
        -[NSMapTable objectForKey:](self->_iconViews, "objectForKey:", v95);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        if (v96)
        {
          -[NSMapTable removeObjectForKey:](self->_iconViews, "removeObjectForKey:", v95);
          objc_msgSend(v96, "superview");
          v97 = (SBIconListView *)objc_claimAutoreleasedReturnValue();

          if (v97 == self)
            -[SBIconListView removeIconView:](self, "removeIconView:", v96);
        }

      }
      v92 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v130, v177, 16);
    }
    while (v92);
    goto LABEL_74;
  }
  v98 = v102;
LABEL_76:

  removedIcons = self->_removedIcons;
  self->_removedIcons = 0;

  if (-[SBIconListView showsEmptyGridCells](self, "showsEmptyGridCells")
    || -[NSMutableDictionary count](self->_emptyGridCells, "count"))
  {
    -[SBIconListView layOutEmptyGridCellViewsUsingAnimator:](self, "layOutEmptyGridCellViewsUsingAnimator:", v77);
  }
  self->_inLayout = 0;
  self->_needsLayout = 0;
  -[SBIconListView layoutFocusGuides](self, "layoutFocusGuides");
  if (-[SBIconListView isDisplayingWidgetIntroduction](self, "isDisplayingWidgetIntroduction"))
    -[SBIconListView layoutWidgetIntroductionViews](self, "layoutWidgetIntroductionViews");
  -[SBIconListView _updateEditingStateForIcons:animated:](self, "_updateEditingStateForIcons:animated:", v123, v6 != 0);
  -[SBIconListView effectiveLayoutDelegateForSelector:](self, "effectiveLayoutDelegateForSelector:", sel_iconListViewDidLayoutIcons_);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v100, "iconListViewDidLayoutIcons:", self);
  SBLogWidgets();
  v101 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v101))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v101, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LAYOUT_ICON_LIST_VIEW", " isAnimation=YES ", buf, 2u);
  }

LABEL_84:
}

- (void)_teardownLayoutRunloopObserverIfNeeded
{
  __CFRunLoopObserver *layoutRunLoopObserver;

  layoutRunLoopObserver = self->_layoutRunLoopObserver;
  if (layoutRunLoopObserver)
  {
    CFRunLoopObserverInvalidate(layoutRunLoopObserver);
    CFRelease(self->_layoutRunLoopObserver);
    self->_layoutRunLoopObserver = 0;
  }
}

+ (id)builtInAnimatorForAnimationType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "defaultAnimator", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(a1, "clusterAnimator", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(a1, "dominoAnimator", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(a1, "multiStageAnimator", v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)effectiveLayoutDelegateForSelector:(SEL)a3
{
  NSUInteger v4;
  NSUInteger v5;
  id v6;
  void *v7;
  void *v8;

  -[NSPointerArray compact](self->_overridingLayoutDelegates, "compact");
  v4 = -[NSPointerArray count](self->_overridingLayoutDelegates, "count");
  if (v4)
  {
    v5 = v4 - 1;
    while (1)
    {
      -[NSPointerArray pointerAtIndex:](self->_overridingLayoutDelegates, "pointerAtIndex:", v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "layoutDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(v6, "reason");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("Overriding layout delegate was lost without invalidating the assertion! Assertion: %@"), v8);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        break;

      if (--v5 == -1)
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    -[SBIconListView layoutDelegate](self, "layoutDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = v6;
      v7 = v6;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (SBIconListLayoutDelegate)layoutDelegate
{
  return (SBIconListLayoutDelegate *)objc_loadWeakRetained((id *)&self->_layoutDelegate);
}

- (id)visibleGridCellIndexesWithMetrics:(id)a3
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  uint64_t v18;
  double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t i;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  double v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  void *v35;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  objc_msgSend(v4, "gridCellInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfUsedColumns");
  v34 = v6;
  v8 = objc_msgSend(v6, "numberOfUsedRows");
  v35 = v4;
  v9 = objc_msgSend(v4, "columnsUsedForLayout");
  v10 = -[SBIconListView visibleColumnRange](self, "visibleColumnRange");
  v33 = v11;
  v12 = -[SBIconListView visibleRowRange](self, "visibleRowRange");
  v14 = v13;
  v15 = -[SBIconListView predictedVisibleColumn](self, "predictedVisibleColumn");
  v17 = v16;
  v18 = -[SBIconListView predictedVisibleRow](self, "predictedVisibleRow");
  v32 = v7;
  if (v10 < v7 && v12 < v8)
  {
    v20 = v17;
    v30 = v18;
    v31 = v19;
    if (v14 >= v8)
      v21 = v8;
    else
      v21 = v14;
    if (v33 >= v9 - v10)
      v22 = v9 - v10;
    else
      v22 = v33;
    if (v12 < v21 + v12)
    {
      v23 = v10 + v12 * v9;
      do
      {
        objc_msgSend(v5, "addIndexesInRange:", v23, v22, v30);
        v23 += v9;
        --v21;
      }
      while (v21);
    }
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v24 = vcvtad_u64_f64((double)v8 * v20);
      for (i = v24 >= v14 ? v14 : v24; i; --i)
      {
        objc_msgSend(v5, "addIndex:", v15, v30);
        v15 += v9;
      }
    }
    if (v30 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v26 = vcvtad_u64_f64((double)v32 * v31);
      if (v26 >= v33)
        v27 = v33;
      else
        v27 = v26;
      if (v27)
      {
        v28 = v30 * v9;
        do
        {
          objc_msgSend(v5, "addIndex:", v28++, v30);
          --v27;
        }
        while (v27);
      }
    }
  }

  return v5;
}

- (_NSRange)visibleRowRange
{
  _NSRange *p_visibleRowRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_visibleRowRange = &self->_visibleRowRange;
  location = self->_visibleRowRange.location;
  length = p_visibleRowRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (SBIconListPredictedVisibleRow)predictedVisibleRow
{
  SBIconListPredictedVisibleRow *p_predictedVisibleRow;
  unint64_t row;
  double confidence;
  SBIconListPredictedVisibleRow result;

  p_predictedVisibleRow = &self->_predictedVisibleRow;
  row = self->_predictedVisibleRow.row;
  confidence = p_predictedVisibleRow->confidence;
  result.confidence = confidence;
  result.row = row;
  return result;
}

- (SBIconListPredictedVisibleColumn)predictedVisibleColumn
{
  SBIconListPredictedVisibleColumn *p_predictedVisibleColumn;
  unint64_t column;
  double confidence;
  SBIconListPredictedVisibleColumn result;

  p_predictedVisibleColumn = &self->_predictedVisibleColumn;
  column = self->_predictedVisibleColumn.column;
  confidence = p_predictedVisibleColumn->confidence;
  result.confidence = confidence;
  result.column = column;
  return result;
}

- (void)_updateEditingStateForIcons:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL8 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[SBIconListView isEditing](self, "isEditing");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v12), (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setEditing:animated:", v7, v4);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (BOOL)pausesIconsForScrolling
{
  return self->_pausesIconsForScrolling;
}

- (UIEdgeInsets)cursorHitTestingInsetsForIconSpacing:(CGSize)a3
{
  double desiredLaserPaddingX;
  double desiredLaserPaddingY;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  desiredLaserPaddingX = fabs(a3.width) * 0.5;
  desiredLaserPaddingY = fabs(a3.height) * 0.5;
  if (!self->_laserPadUsesAllAvailableSpace)
  {
    if (desiredLaserPaddingX > self->_desiredLaserPaddingX)
      desiredLaserPaddingX = self->_desiredLaserPaddingX;
    if (desiredLaserPaddingY > self->_desiredLaserPaddingY)
      desiredLaserPaddingY = self->_desiredLaserPaddingY;
  }
  v5 = -desiredLaserPaddingY;
  v6 = -desiredLaserPaddingX;
  v7 = v5;
  v8 = v6;
  result.right = v8;
  result.bottom = v7;
  result.left = v6;
  result.top = v5;
  return result;
}

- (BOOL)boundsSizeTracksContentSize
{
  return self->_boundsSizeTracksContentSize;
}

- (void)setUserInterfaceLayoutDirectionHandling:(unint64_t)a3
{
  if (self->_userInterfaceLayoutDirectionHandling != a3)
  {
    self->_userInterfaceLayoutDirectionHandling = a3;
    -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
  }
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings *v5;
  _QWORD v6[4];
  _UILegibilitySettings *v7;

  v5 = (_UILegibilitySettings *)a3;
  if (self->_legibilitySettings != v5)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__SBIconListView_setLegibilitySettings___block_invoke;
    v6[3] = &unk_1E8D87340;
    v7 = v5;
    -[SBIconListView enumerateIconViewsUsingBlock:](self, "enumerateIconViewsUsingBlock:", v6);

  }
}

- (void)setLayoutDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_layoutDelegate, obj);
    if (!obj)
      -[SBIconListView layoutIconsNow](self, "layoutIconsNow");
    -[SBIconListView updateIconLocationWithNonDefaultSizedIcons](self, "updateIconLocationWithNonDefaultSizedIcons");
    v5 = obj;
  }

}

- (void)updateIconLocationWithNonDefaultSizedIcons
{
  -[SBIconListView updateIconLocationWithNonDefaultSizedIcons:](self, "updateIconLocationWithNonDefaultSizedIcons:", -[SBIconListView modelHasNonDefaultSizedIcons](self, "modelHasNonDefaultSizedIcons"));
}

- (void)updateIconLocationWithNonDefaultSizedIcons:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[SBIconListView effectiveLayoutDelegateForSelector:](self, "effectiveLayoutDelegateForSelector:", sel_iconListView_alternateIconLocationForListWithNonDefaultSizedIcons_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = v5;
    objc_msgSend(v5, "iconListView:alternateIconLocationForListWithNonDefaultSizedIcons:", self, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[SBIconListView setIconLocation:](self, "setIconLocation:", v6);

    v5 = v7;
  }

}

- (void)setIconImageCache:(id)a3
{
  SBHIconImageCache *v5;
  _QWORD v6[4];
  SBHIconImageCache *v7;

  v5 = (SBHIconImageCache *)a3;
  if (self->_iconImageCache != v5)
  {
    objc_storeStrong((id *)&self->_iconImageCache, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__SBIconListView_setIconImageCache___block_invoke;
    v6[3] = &unk_1E8D87340;
    v7 = v5;
    -[SBIconListView enumerateIconViewsUsingBlock:](self, "enumerateIconViewsUsingBlock:", v6);

  }
}

- (void)setFolderIconImageCache:(id)a3
{
  SBFolderIconImageCache *v5;
  _QWORD v6[4];
  SBFolderIconImageCache *v7;

  v5 = (SBFolderIconImageCache *)a3;
  if (self->_folderIconImageCache != v5)
  {
    objc_storeStrong((id *)&self->_folderIconImageCache, a3);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__SBIconListView_setFolderIconImageCache___block_invoke;
    v6[3] = &unk_1E8D87340;
    v7 = v5;
    -[SBIconListView enumerateIconViewsUsingBlock:](self, "enumerateIconViewsUsingBlock:", v6);

  }
}

- (void)setDragDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dragDelegate, a3);
}

- (void)setAddsFocusGuidesForWrapping:(BOOL)a3
{
  if (self->_addsFocusGuidesForWrapping != a3)
  {
    self->_addsFocusGuidesForWrapping = a3;
    -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
  }
}

- (BOOL)modelHasNonDefaultSizedIcons
{
  void *v2;
  char v3;

  -[SBIconListView displayedModel](self, "displayedModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "directlyContainsNonDefaultSizeClassIcon");

  return v3;
}

- (SBIconListView)initWithModel:(id)a3 layoutProvider:(id)a4 iconLocation:(id)a5 orientation:(int64_t)a6 iconViewProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SBIconListView *v17;
  SBIconListView *v18;
  uint64_t v19;
  NSString *iconLocation;
  uint64_t v21;
  NSString *iconDragTypeIdentifier;
  uint64_t v23;
  NSMapTable *iconViews;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  SBIconListViewDraggingDestinationDelegate *v30;
  SBIconListViewDraggingDestinationDelegate *draggingDelegate;
  void *v32;
  uint64_t v33;
  SBHIconSettings *iconSettings;
  uint64_t v35;
  SBHIconEditingSettings *iconEditingSettings;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  objc_msgSend((id)objc_opt_class(), "defaultFrameForOrientation:", a6);
  v42.receiver = self;
  v42.super_class = (Class)SBIconListView;
  v17 = -[SBIconListView initWithFrame:](&v42, sel_initWithFrame_);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_model, a3);
    objc_storeStrong((id *)&v18->_layoutProvider, a4);
    v19 = objc_msgSend(v15, "copy");
    iconLocation = v18->_iconLocation;
    v18->_iconLocation = (NSString *)v19;

    v18->_orientation = a6;
    objc_storeWeak((id *)&v18->_iconViewProvider, v16);
    v18->_iconContentScale = 1.0;
    v18->_iconViewConfigurationOptions = objc_msgSend((id)objc_opt_class(), "defaultIconViewConfigurationOptions");
    v18->_alignsIconsOnPixelBoundaries = 1;
    v18->_iconSpacing = (CGSize)vdupq_n_s64(0xC05EC00000000000);
    v18->_automaticallyAdjustsLayoutMetricsToFit = 1;
    v21 = objc_msgSend((id)*MEMORY[0x1E0DAB500], "copy");
    iconDragTypeIdentifier = v18->_iconDragTypeIdentifier;
    v18->_iconDragTypeIdentifier = (NSString *)v21;

    v18->_visiblySettled = 1;
    v18->_dragSpringloadingEnabled = 1;
    v18->_contentVisibility = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v23 = objc_claimAutoreleasedReturnValue();
    iconViews = v18->_iconViews;
    v18->_iconViews = (NSMapTable *)v23;

    -[SBIconListView setAutoresizingMask:](v18, "setAutoresizingMask:", 16);
    objc_msgSend(v13, "addListObserver:", v18);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v25 = v13;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v39;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v39 != v28)
            objc_enumerationMutation(v25);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v29++), "addObserver:", v18, (_QWORD)v38);
        }
        while (v27 != v29);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      }
      while (v27);
    }

    v18->_visibleColumnRange.length = -1;
    v18->_visibleRowRange.length = -1;
    v18->_predictedVisibleColumn.column = 0x7FFFFFFFFFFFFFFFLL;
    v30 = -[SBIconListViewDraggingDestinationDelegate initWithIconListView:]([SBIconListViewDraggingDestinationDelegate alloc], "initWithIconListView:", v18);
    draggingDelegate = v18->_draggingDelegate;
    v18->_draggingDelegate = v30;

    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "iconSettings");
    v33 = objc_claimAutoreleasedReturnValue();
    iconSettings = v18->_iconSettings;
    v18->_iconSettings = (SBHIconSettings *)v33;

    -[PTSettings addKeyObserver:](v18->_iconSettings, "addKeyObserver:", v18);
    -[SBIconListView _applyIconPaddingSettings](v18, "_applyIconPaddingSettings");
    objc_msgSend(v32, "iconEditingSettings");
    v35 = objc_claimAutoreleasedReturnValue();
    iconEditingSettings = v18->_iconEditingSettings;
    v18->_iconEditingSettings = (SBHIconEditingSettings *)v35;

    -[SBIconListView _setupStateCaptureHandleIfNeeded](v18, "_setupStateCaptureHandleIfNeeded");
  }

  return v18;
}

+ (unint64_t)defaultIconViewConfigurationOptions
{
  return 0;
}

+ (CGRect)defaultFrameForOrientation:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = *MEMORY[0x1E0C9D648];
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBIconListView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)SBIconListView;
  -[SBIconListView setBounds:](&v13, sel_setBounds_, x, y, width, height);
  if (!self->_inLayout && (v9 != width || v11 != height))
    -[SBIconListView layoutIconsNow](self, "layoutIconsNow");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBIconListView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13.receiver = self;
  v13.super_class = (Class)SBIconListView;
  -[SBIconListView setFrame:](&v13, sel_setFrame_, x, y, width, height);
  if (!self->_inLayout && (v9 != width || v11 != height))
    -[SBIconListView layoutIconsNow](self, "layoutIconsNow");
}

- (void)willMoveToWindow:(id)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBIconListView;
  -[SBIconListView willMoveToWindow:](&v6, sel_willMoveToWindow_);
  if (self->_ignoreNextWindowChange)
  {
    self->_ignoreNextWindowChange = 0;
  }
  else if (a3)
  {
    -[SBIconListView window](self, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[SBIconListView layoutIconsNow](self, "layoutIconsNow");
  }
  else
  {
    -[SBIconListView removeAllIconViews](self, "removeAllIconViews");
    -[SBIconListView _teardownLayoutRunloopObserverIfNeeded](self, "_teardownLayoutRunloopObserverIfNeeded");
  }
}

- (void)_applyIconPaddingSettings
{
  double v3;
  double v4;

  -[SBHIconSettings iconHitboxPaddingX](self->_iconSettings, "iconHitboxPaddingX");
  self->_desiredLaserPaddingX = v3;
  -[SBHIconSettings iconHitboxPaddingY](self->_iconSettings, "iconHitboxPaddingY");
  self->_desiredLaserPaddingY = v4;
  self->_laserPadUsesAllAvailableSpace = -[SBHIconSettings alwaysHitTestNearestIcon](self->_iconSettings, "alwaysHitTestNearestIcon");
  -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
  -[SBIconListView setNeedsLayout](self, "setNeedsLayout");
}

- (void)layoutIconsNow
{
  -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
  -[SBIconListView layoutIconsIfNeeded](self, "layoutIconsIfNeeded");
}

- (void)setIconsNeedLayout
{
  SBIconListViewLayoutMetrics *cachedMetrics;

  self->_needsLayout = 1;
  cachedMetrics = self->_cachedMetrics;
  self->_cachedMetrics = 0;

  if (!self->_layoutRunLoopObserver)
    -[SBIconListView _setupLayoutRunLoopObserver](self, "_setupLayoutRunLoopObserver");
}

- (void)_setupLayoutRunLoopObserver
{
  const __CFAllocator *v3;
  __CFRunLoop *Main;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_layoutRunLoopObserver)
  {
    objc_initWeak(&location, self);
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __45__SBIconListView__setupLayoutRunLoopObserver__block_invoke;
    v5[3] = &unk_1E8D856A8;
    objc_copyWeak(&v6, &location);
    self->_layoutRunLoopObserver = CFRunLoopObserverCreateWithHandler(v3, 0xA0uLL, 0, 1999900, v5);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_layoutRunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (BOOL)containsIcon:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBIconListView displayedModel](self, "displayedModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "directlyContainsIcon:", v4);

  return v6;
}

- (void)_insertOrRemoveCaptureOnlyBackgroundViewIfNecessaryForIconView:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "backgroundViewGroupNameBase");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SBIconListView _insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary:](self, "_insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary:", v6);
  }
  else
  {
    objc_msgSend(v6, "icon");
    v5 = objc_claimAutoreleasedReturnValue();

    -[SBIconListView _removeCaptureOnlyBackgroundViewForRemovedIconIfNecessary:](self, "_removeCaptureOnlyBackgroundViewForRemovedIconIfNecessary:", v5);
    v6 = (id)v5;
  }

}

- (void)_removeCaptureOnlyBackgroundViewForRemovedIconIfNecessary:(id)a3
{
  id v4;
  SBIconListView *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = self;
    objc_sync_enter(v5);
    -[NSMapTable objectForKey:](v5->_iconsToCaptureOnlyBackgroundAssertions, "objectForKey:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    objc_sync_exit(v5);
    v4 = v7;
  }

}

- (void)addLayoutObserver:(id)a3
{
  id v4;
  NSHashTable *layoutObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  layoutObservers = self->_layoutObservers;
  v8 = v4;
  if (!layoutObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_layoutObservers;
    self->_layoutObservers = v6;

    v4 = v8;
    layoutObservers = self->_layoutObservers;
  }
  -[NSHashTable addObject:](layoutObservers, "addObject:", v4);

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBIconListView;
  -[SBIconListView layoutSubviews](&v3, sel_layoutSubviews);
  if (self->_widgetIntroductionPopover)
    -[SBIconListView bringWidgetIntroductionPopoverToFront](self, "bringWidgetIntroductionPopoverToFront");
}

- (void)didMoveToWindow
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBIconListView;
  -[SBIconListView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[SBIconListView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __33__SBIconListView_didMoveToWindow__block_invoke;
    v4[3] = &unk_1E8D87340;
    v4[4] = self;
    -[SBIconListView enumerateIconViewsUsingBlock:](self, "enumerateIconViewsUsingBlock:", v4);
  }
}

+ (int64_t)rotationAnchor
{
  return 0;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[SBIconListView _teardownLayoutRunloopObserverIfNeeded](self, "_teardownLayoutRunloopObserverIfNeeded");
  -[SBIconListView _teardownStateCapture](self, "_teardownStateCapture");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[PTSettings removeKeyObserver:](self->_iconSettings, "removeKeyObserver:", self);
  v4.receiver = self;
  v4.super_class = (Class)SBIconListView;
  -[SBIconListView dealloc](&v4, sel_dealloc);
}

- (id)tintColor
{
  return 0;
}

- (void)removeAllIconViews
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMapTable copy](self->_iconViews, "copy");
  -[NSMapTable removeAllObjects](self->_iconViews, "removeAllObjects");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBIconListView removeIconView:](self, "removeIconView:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)setModel:(id)a3
{
  SBIconListModel *v5;
  SBIconListModel *model;
  SBIconListModel *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  NSMutableSet *removedIcons;
  SBIconListModel *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (SBIconListModel *)a3;
  model = self->_model;
  if (model != v5)
  {
    -[SBIconListModel removeListObserver:](model, "removeListObserver:", self);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = self->_model;
    v8 = -[SBIconListModel countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "removeObserver:", self);
        }
        v9 = -[SBIconListModel countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v9);
    }

    -[SBIconListView removeAllIconViews](self, "removeAllIconViews");
    removedIcons = self->_removedIcons;
    self->_removedIcons = 0;

    objc_storeStrong((id *)&self->_model, a3);
    -[SBIconListModel addListObserver:](v5, "addListObserver:", self);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = v5;
    v14 = -[SBIconListModel countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * j), "addObserver:", self, (_QWORD)v18);
        }
        v15 = -[SBIconListModel countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v15);
    }

    -[SBIconListView updateIconLocationWithNonDefaultSizedIcons](self, "updateIconLocationWithNonDefaultSizedIcons");
    -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
  }

}

uint64_t __42__SBIconListView_setFolderIconImageCache___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFolderIconImageCache:", *(_QWORD *)(a1 + 32));
}

uint64_t __36__SBIconListView_setIconImageCache___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIconImageCache:", *(_QWORD *)(a1 + 32));
}

- (void)setLayoutProvider:(id)a3
{
  -[SBIconListView setLayoutProvider:animated:](self, "setLayoutProvider:animated:", a3, 0);
}

- (void)setLayoutProvider:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  SBIconListLayoutProvider *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  SBIconListLayoutProvider *v19;
  BOOL v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = (SBIconListLayoutProvider *)a3;
  if (self->_layoutProvider != v7)
  {
    objc_storeStrong((id *)&self->_layoutProvider, a3);
    if (v4)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __45__SBIconListView_setLayoutProvider_animated___block_invoke;
      v18[3] = &unk_1E8D89490;
      v19 = v7;
      v20 = v4;
      -[SBIconListView enumerateDisplayedIconViewsUsingBlock:](self, "enumerateDisplayedIconViewsUsingBlock:", v18);

    }
    else
    {
      -[SBIconListView removeAllIconViews](self, "removeAllIconViews");
    }
    -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
    -[SBIconListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    if (v4)
      -[SBIconListView layoutIconsIfNeededWithAnimationType:options:](self, "layoutIconsIfNeededWithAnimationType:options:", 0, 0);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = (void *)-[NSHashTable copy](self->_layoutObservers, "copy", 0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "iconListViewDidChangeListLayoutProvider:", self);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
      }
      while (v10);
    }

  }
}

uint64_t __45__SBIconListView_setLayoutProvider_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setListLayoutProvider:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)setIconLocation:(id)a3
{
  NSString *v4;
  NSString *iconLocation;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    iconLocation = self->_iconLocation;
    self->_iconLocation = v4;

    -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
    -[SBIconListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }

}

- (id)addOverridingLayoutDelegate:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  SBIconListViewIconOverridingLayoutDelegateAssertion *v8;
  NSPointerArray *overridingLayoutDelegates;
  NSPointerArray *v10;
  NSPointerArray *v11;

  v6 = a4;
  v7 = a3;
  v8 = -[SBIconListViewIconOverridingLayoutDelegateAssertion initWithListView:layoutDelegate:reason:]([SBIconListViewIconOverridingLayoutDelegateAssertion alloc], "initWithListView:layoutDelegate:reason:", self, v7, v6);

  overridingLayoutDelegates = self->_overridingLayoutDelegates;
  if (!overridingLayoutDelegates)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v10 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
    v11 = self->_overridingLayoutDelegates;
    self->_overridingLayoutDelegates = v10;

    overridingLayoutDelegates = self->_overridingLayoutDelegates;
  }
  -[NSPointerArray addPointer:](overridingLayoutDelegates, "addPointer:", v8);
  return v8;
}

- (void)removeOverridingLayoutDelegateAssertion:(id)a3
{
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  -[NSPointerArray compact](self->_overridingLayoutDelegates, "compact");
  v4 = -[NSPointerArray count](self->_overridingLayoutDelegates, "count");
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    while (-[NSPointerArray pointerAtIndex:](self->_overridingLayoutDelegates, "pointerAtIndex:", v6) != v7)
    {
      if (v5 == ++v6)
        goto LABEL_7;
    }
    -[NSPointerArray removePointerAtIndex:](self->_overridingLayoutDelegates, "removePointerAtIndex:", v6);
  }
LABEL_7:
  -[SBIconListView updateIconLocationWithNonDefaultSizedIcons](self, "updateIconLocationWithNonDefaultSizedIcons");
  -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");

}

- (BOOL)hasOverridingLayoutDelegates
{
  -[NSPointerArray compact](self->_overridingLayoutDelegates, "compact");
  return -[NSPointerArray count](self->_overridingLayoutDelegates, "count") != 0;
}

- (void)setLayoutReversed:(BOOL)a3
{
  if (self->_layoutReversed != a3)
  {
    self->_layoutReversed = a3;
    -[SBIconListView layoutIconsNow](self, "layoutIconsNow");
  }
}

- (void)setAllowsGaps:(BOOL)a3
{
  if (self->_allowsGaps != a3)
  {
    self->_allowsGaps = a3;
    -[SBIconListView layoutIconsNow](self, "layoutIconsNow");
  }
}

- (void)setShowsEmptyGridCells:(BOOL)a3
{
  -[SBIconListView setShowsEmptyGridCells:animated:](self, "setShowsEmptyGridCells:animated:", a3, 0);
}

- (void)setShowsEmptyGridCells:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;

  if (self->_showsEmptyGridCells != a3)
  {
    v4 = a4;
    self->_showsEmptyGridCells = a3;
    -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
    if (v4)
      -[SBIconListView layoutIconsIfNeededWithAnimationType:options:](self, "layoutIconsIfNeededWithAnimationType:options:", 0, 0);
  }
}

- (void)setAutomaticallyShowsEmptyGridCellsWhileEditing:(BOOL)a3
{
  if (self->_automaticallyShowsEmptyGridCellsWhileEditing != a3)
  {
    self->_automaticallyShowsEmptyGridCellsWhileEditing = a3;
    -[SBIconListView setShowsEmptyGridCells:](self, "setShowsEmptyGridCells:", -[SBIconListView isEditing](self, "isEditing"));
  }
}

- (void)setAutomaticallyReversedLayoutOrientations:(unint64_t)a3
{
  unint64_t automaticallyReversedLayoutOrientations;
  uint64_t v5;

  automaticallyReversedLayoutOrientations = self->_automaticallyReversedLayoutOrientations;
  if (automaticallyReversedLayoutOrientations != a3)
  {
    self->_automaticallyReversedLayoutOrientations = a3;
    if (a3)
    {
      -[SBIconListView orientation](self, "orientation");
      v5 = SBFInterfaceOrientationMaskContainsInterfaceOrientation();
    }
    else
    {
      if (!automaticallyReversedLayoutOrientations)
        return;
      v5 = 0;
    }
    -[SBIconListView setLayoutReversed:](self, "setLayoutReversed:", v5);
  }
}

- (void)updateReversedLayoutBasedOnOrientation
{
  if (-[SBIconListView automaticallyReversedLayoutOrientations](self, "automaticallyReversedLayoutOrientations"))
  {
    -[SBIconListView orientation](self, "orientation");
    -[SBIconListView setLayoutReversed:](self, "setLayoutReversed:", SBFInterfaceOrientationMaskContainsInterfaceOrientation());
  }
}

- (void)setIconViewConfigurationOptions:(unint64_t)a3
{
  if (self->_iconViewConfigurationOptions != a3)
  {
    self->_iconViewConfigurationOptions = a3;
    -[SBIconListView layoutIconsNow](self, "layoutIconsNow");
    -[SBIconListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)addIconViewConfigurationOption:(unint64_t)a3
{
  -[SBIconListView setIconViewConfigurationOptions:](self, "setIconViewConfigurationOptions:", -[SBIconListView iconViewConfigurationOptions](self, "iconViewConfigurationOptions") | a3);
}

- (void)removeIconViewConfigurationOption:(unint64_t)a3
{
  -[SBIconListView setIconViewConfigurationOptions:](self, "setIconViewConfigurationOptions:", -[SBIconListView iconViewConfigurationOptions](self, "iconViewConfigurationOptions") & ~a3);
}

uint64_t __40__SBIconListView_setLegibilitySettings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLegibilitySettings:", *(_QWORD *)(a1 + 32));
}

- (void)setAlignsIconsOnPixelBoundaries:(BOOL)a3
{
  if (self->_alignsIconsOnPixelBoundaries != a3)
  {
    self->_alignsIconsOnPixelBoundaries = a3;
    -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
  }
}

- (void)setLayoutInsetsMode:(int64_t)a3
{
  if (self->_layoutInsetsMode != a3)
  {
    self->_layoutInsetsMode = a3;
    -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
  }
}

- (BOOL)isVertical
{
  return 0;
}

- (unint64_t)iconRowsForCurrentOrientation
{
  void *v3;
  unint64_t v4;

  -[SBIconListView layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfRowsForOrientation:", -[SBIconListView layoutOrientation](self, "layoutOrientation"));

  return v4;
}

- (SBHIconGridSize)gridSizeForCurrentOrientation
{
  unsigned __int16 v3;

  v3 = -[SBIconListView iconColumnsForCurrentOrientation](self, "iconColumnsForCurrentOrientation");
  return (SBHIconGridSize)(v3 | ((unsigned __int16)-[SBIconListView iconRowsForCurrentOrientation](self, "iconRowsForCurrentOrientation") << 16));
}

- (unint64_t)maximumIconCount
{
  void *v2;
  unint64_t v3;

  -[SBIconListView layout](self, "layout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = SBHIconListLayoutMaximumIconCount(v2);

  return v3;
}

- (void)setAdditionalLayoutInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_additionalLayoutInsets.left
    || a3.top != self->_additionalLayoutInsets.top
    || a3.right != self->_additionalLayoutInsets.right
    || a3.bottom != self->_additionalLayoutInsets.bottom)
  {
    self->_additionalLayoutInsets = a3;
    -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
    -[SBIconListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (CGRect)iconLayoutRect
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
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[SBIconListView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBIconListView layoutInsetsForOrientation:](self, "layoutInsetsForOrientation:", -[SBIconListView orientation](self, "orientation"));
  v12 = v6 + v11;
  v15 = v8 - (v13 + v14);
  v17 = v10 - (v11 + v16);
  v18 = v4 + v13;
  v19 = v12;
  v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)_widgetIconLayoutRect
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int64_t v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  -[SBIconListView layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView iconLayoutRect](self, "iconLayoutRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12 = -[SBIconListView orientation](self, "orientation");
    -[SBIconListView layout](self, "layout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "additionalWidgetLayoutInsetsForOrientation:", v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v5 = v5 + v17;
    v7 = v7 + v15;
    v9 = v9 - (v17 + v21);
    v11 = v11 - (v15 + v19);
  }

  v22 = v5;
  v23 = v7;
  v24 = v9;
  v25 = v11;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)_shouldEnforceLayoutInsetsForAxis:(unint64_t)a3
{
  void *v4;
  char v5;

  -[SBIconListView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "enforceLayoutInsetsForAxis:", a3);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)indexForCoordinate:(SBIconCoordinate)a3 forOrientation:(int64_t)a4
{
  int64_t row;
  int64_t column;
  void *v8;
  unint64_t v9;

  row = a3.row;
  column = a3.column;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBIconListView indexForCoordinate:forOrientation:metrics:](self, "indexForCoordinate:forOrientation:metrics:", column, row, a4, v8);

  return v9;
}

- (unint64_t)indexForCoordinate:(SBIconCoordinate)a3 forOrientation:(int64_t)a4 metrics:(id)a5
{
  int64_t row;
  int64_t column;
  id v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  row = a3.row;
  column = a3.column;
  v9 = a5;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  if (row && row != 0x7FFFFFFFFFFFFFFFLL && column != 0x7FFFFFFFFFFFFFFFLL && column)
  {
    -[SBIconListView layout](self, "layout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "numberOfRowsForOrientation:", a4);

    -[SBIconListView layout](self, "layout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "numberOfColumnsForOrientation:", a4);

    if (row > 0)
      v15 = -1;
    else
      v15 = v12;
    if (column > 0)
      v16 = -1;
    else
      v16 = v14;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    v17 = v16 + column;
    if (v17 >= 0)
    {
      v18 = v15 + row;
      if ((v18 & 0x8000000000000000) == 0 && v17 < v14 && v18 < v12)
        v10 = -[SBIconListView iconIndexForGridCellIndex:metrics:](self, "iconIndexForGridCellIndex:metrics:", -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v9), v9);
    }
  }

  return v10;
}

- (SBHIconGridRange)iconGridRangeForIndex:(unint64_t)a3 metrics:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  SBHIconGridRange result;

  objc_msgSend(a4, "gridCellInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "gridRangeForGridCellIndex:", objc_msgSend(v5, "gridCellIndexForIconIndex:", a3));
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.size = (SBHIconGridSize)v10;
  result.cellIndex = v9;
  return result;
}

- (id)iconGridSizeClassForIconGridSize:(SBHIconGridSize)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[SBIconListView layout](self, "layout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBHIconListLayoutIconGridSizeClassSizes(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView displayedModel](self, "displayedModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allowedGridSizeClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bestGridSizeClassForGridSize:allowedGridSizeClasses:", *(unsigned int *)&a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)continuousCornerRadiusForGridSizeClass:(id)a3
{
  double v3;

  -[SBIconListView iconImageInfoForGridSizeClass:](self, "iconImageInfoForGridSizeClass:", a3);
  return v3;
}

- (NSString)description
{
  return (NSString *)-[SBIconListView descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (unint64_t)rowForIcon:(id)a3
{
  uint64_t v3;

  -[SBIconListView coordinateForIcon:](self, "coordinateForIcon:", a3);
  return v3 - 1;
}

- (id)visibleIconIndexes
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;

  -[SBIconListView visibleGridCellIndexes](self, "visibleGridCellIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView gridCellInfo](self, "gridCellInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__SBIconListView_visibleIconIndexes__block_invoke;
  v11[3] = &unk_1E8D894B8;
  v12 = v4;
  v6 = v5;
  v13 = v6;
  v7 = v4;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v11);
  v8 = v13;
  v9 = v6;

  return v9;
}

uint64_t __36__SBIconListView_visibleIconIndexes__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "iconIndexForGridCellIndex:", a2);
  if (result != 0x7FFFFFFFFFFFFFFFLL)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", result);
  return result;
}

- (NSArray)visibleIcons
{
  void *v3;
  void *v4;
  void *v5;

  -[SBIconListView visibleIconIndexes](self, "visibleIconIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView displayedModel](self, "displayedModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconsAtIndexes:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)regenerateTemporaryDisplayedModelIfNecessary
{
  void *v2;
  SBIconListView *v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  BOOL v50;
  id v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  void *v58;
  void *v59;
  uint64_t v60;
  SBHIconGridPath *v61;
  id v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t n;
  uint64_t v68;
  int v69;
  uint64_t v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  int v76;
  void *v77;
  void *v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  NSHashTable *v82;
  id v83;
  NSHashTable *obj;
  id obja;
  id objb;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  _QWORD v94[5];
  _QWORD v95[5];
  _QWORD v96[4];
  id v97;
  SBIconListView *v98;
  _QWORD v99[4];
  id v100;
  id v101;
  SBIconListView *v102;
  char v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[5];
  uint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t (*v120)(uint64_t, uint64_t);
  void (*v121)(uint64_t);
  id v122;
  _QWORD v123[4];
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  _QWORD v133[6];
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  -[SBIconListView model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = self;
  if (-[NSHashTable count](self->_layoutHidingAssertions, "count"))
  {
    v140 = 0u;
    v141 = 0u;
    v138 = 0u;
    v139 = 0u;
    obj = self->_layoutHidingAssertions;
    v90 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v138, v148, 16);
    if (v90)
    {
      v4 = 0;
      v5 = 0;
      v88 = *(_QWORD *)v139;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v139 != v88)
          {
            v7 = v6;
            objc_enumerationMutation(obj);
            v6 = v7;
          }
          v92 = v6;
          v8 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * v6);
          objc_msgSend(v8, "icons");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v8, "options");
          v136 = 0u;
          v137 = 0u;
          v134 = 0u;
          v135 = 0u;
          v11 = v9;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v134, v147, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v135;
            do
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v135 != v13)
                  objc_enumerationMutation(v11);
                v15 = *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * i);
                if ((objc_msgSend(v2, "directlyContainsIcon:", v15) & 1) != 0)
                {
                  v5 = 1;
                }
                else if ((v4 & 1) == 0 && (v10 & 8) != 0)
                {
                  v117 = 0;
                  v118 = &v117;
                  v119 = 0x2020000000;
                  LOBYTE(v120) = 0;
                  v133[0] = MEMORY[0x1E0C809B0];
                  v133[1] = 3221225472;
                  v133[2] = __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke;
                  v133[3] = &unk_1E8D894E0;
                  v133[4] = v15;
                  v133[5] = &v117;
                  objc_msgSend(v2, "enumerateFolderIconsUsingBlock:", v133);
                  v4 = *((_BYTE *)v118 + 24);
                  _Block_object_dispose(&v117, 8);
                }
              }
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v134, v147, 16);
            }
            while (v12);
          }

          v6 = v92 + 1;
        }
        while (v92 + 1 != v90);
        v90 = -[NSHashTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v138, v148, 16);
      }
      while (v90);
    }
    else
    {
      v4 = 0;
      v5 = 0;
    }

    v80 = v4 & 1;
    v16 = v5 & 1;
    v3 = self;
  }
  else
  {
    v80 = 0;
    v16 = 0;
  }
  -[SBIconListView temporaryModel](v3, "temporaryModel");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView temporaryFolder](self, "temporaryFolder");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 | v80;
  if (-[NSHashTable count](self->_placeholderAssertions, "count"))
    v18 = 1;
  else
    v18 = v16 | v80;
  if (!v78 && !v18)
  {
    v19 = 0;
    v20 = 0;
    v91 = 0;
    goto LABEL_122;
  }
  v76 = v18;
  if (!v18)
  {
    v22 = 0;
    v19 = 0;
    v23 = 0;
    v91 = 0;
    goto LABEL_111;
  }
  objc_msgSend(v2, "folder");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueIdentifier");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  if (v74 && (objc_msgSend(v74, "isExtraList:", v2) & 1) == 0)
  {
    v91 = (void *)objc_msgSend(v74, "copyWithOptions:", 12);
    objc_msgSend(v91, "listWithIdentifier:", v75);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v93 = (void *)objc_msgSend(v2, "copy");
    objc_msgSend(v74, "effectiveBadgeBehaviorProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "setBadgeBehaviorProvider:", v21);

    v91 = 0;
  }
  v89 = -[SBIconListView gridCellInfoOptions](self, "gridCellInfoOptions");
  -[NSHashTable allObjects](self->_placeholderAssertions, "allObjects");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "sortedArrayUsingComparator:", &__block_literal_global_43);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v131 = 0u;
  v132 = 0u;
  v129 = 0u;
  v130 = 0u;
  obja = v24;
  v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v129, v146, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v130;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v130 != v26)
          objc_enumerationMutation(obja);
        v28 = *(void **)(*((_QWORD *)&v129 + 1) + 8 * j);
        objc_msgSend(v28, "representedIcon");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "isFolderIcon"))
        {
          objc_msgSend(v29, "nodeIdentifier");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v93, "directlyContainedIconWithIdentifier:", v30);
          v31 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)v31;
        }
        if (v29)
        {
          objc_msgSend(v28, "placeholderIcon");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v93, "directlyContainsIcon:", v29))
          {
            if (v91)
              objc_msgSend(v91, "replaceIcon:withIcon:options:", v29, v32, objc_msgSend(v28, "folderMutationOptions"));
            else
              v33 = (id)objc_msgSend(v93, "replaceIcon:withIcon:options:", v29, v32, objc_msgSend(v28, "listMutationOptions"));
            objc_msgSend(v19, "addObject:", v29);
          }

        }
      }
      v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v129, v146, 16);
    }
    while (v25);
  }

  if (v17)
  {
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    v82 = self->_layoutHidingAssertions;
    v34 = -[NSHashTable countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v125, v145, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v126;
      do
      {
        for (k = 0; k != v34; ++k)
        {
          if (*(_QWORD *)v126 != v35)
            objc_enumerationMutation(v82);
          v37 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * k);
          objc_msgSend(v37, "icons");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v123[0] = MEMORY[0x1E0C809B0];
          v123[1] = 3221225472;
          v123[2] = __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_3;
          v123[3] = &unk_1E8D89528;
          v39 = v93;
          v124 = v39;
          objc_msgSend(v38, "bs_compactMap:", v123);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v91)
            objc_msgSend(v91, "removeIcons:options:listGridCellInfoOptions:", v40, -[SBIconListView folderMutationOptionsForIconLayoutHidingAssertion:](self, "folderMutationOptionsForIconLayoutHidingAssertion:", v37), v89);
          else
            objc_msgSend(v39, "removeIcons:gridCellInfoOptions:mutationOptions:", v40, v89, -[SBIconListView listMutationOptionsForIconLayoutHidingAssertion:](self, "listMutationOptionsForIconLayoutHidingAssertion:", v37));
          objc_msgSend(v19, "addObjectsFromArray:", v38);

        }
        v34 = -[NSHashTable countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v125, v145, 16);
      }
      while (v34);
    }

    if (v80)
    {
      v117 = 0;
      v118 = &v117;
      v119 = 0x3032000000;
      v120 = __Block_byref_object_copy__9;
      v121 = __Block_byref_object_dispose__9;
      v122 = 0;
      v116[0] = MEMORY[0x1E0C809B0];
      v116[1] = 3221225472;
      v116[2] = __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_28;
      v116[3] = &unk_1E8D89550;
      v116[4] = &v117;
      objc_msgSend(v93, "enumerateFolderIconsUsingBlock:", v116);
      if (v118[5])
      {
        v114 = 0u;
        v115 = 0u;
        v112 = 0u;
        v113 = 0u;
        v41 = (id)v118[5];
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v112, v144, 16);
        if (v42)
        {
          v43 = *(_QWORD *)v113;
          do
          {
            for (m = 0; m != v42; ++m)
            {
              if (*(_QWORD *)v113 != v43)
                objc_enumerationMutation(v41);
              v45 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * m);
              objc_msgSend(v45, "folder");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v46, "isEmpty"))
              {
                objc_msgSend(v93, "removeIcon:", v45);
              }
              else
              {
                objc_msgSend(v46, "firstIcon");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = (id)objc_msgSend(v93, "replaceIcon:withIcon:options:", v45, v47, 0);
                -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", v45);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = v49 == 0;

                if (!v50)
                {
                  -[SBIconListView markIcon:asNeedingAnimation:](self, "markIcon:asNeedingAnimation:", v45, 2);
                  -[SBIconListView setExtraIconForFolderCollapseSpecialIconAnimation:](self, "setExtraIconForFolderCollapseSpecialIconAnimation:", v47);
                }

              }
            }
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v112, v144, 16);
          }
          while (v42);
        }

      }
      _Block_object_dispose(&v117, 8);

    }
  }
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v51 = obja;
  v81 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v108, v143, 16);
  if (!v81)
  {
LABEL_108:
    v22 = 0;
    goto LABEL_110;
  }
  v79 = *(_QWORD *)v109;
LABEL_82:
  v52 = 0;
  while (2)
  {
    if (*(_QWORD *)v109 != v79)
      objc_enumerationMutation(v51);
    v53 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * v52);
    objc_msgSend(v53, "placeholderIcon");
    objb = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "positioningRelativeIcon");
    v83 = (id)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "gridCellIndex");
    v55 = objc_msgSend(v53, "listMutationOptions");
    v56 = objc_msgSend(v53, "positioningType");
    v57 = objc_msgSend(v53, "options");
    -[SBIconListView updateIconLocationWithNonDefaultSizedIcons](self, "updateIconLocationWithNonDefaultSizedIcons");
    switch(v56)
    {
      case 0:
        if (v91)
        {
          objc_msgSend(v93, "icons");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = (void *)objc_msgSend(v58, "mutableCopy");

          v60 = objc_msgSend(v53, "folderMutationOptions");
          v61 = -[SBHIconGridPath initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:]([SBHIconGridPath alloc], "initWithFolderIdentifier:listIdentifier:gridCellIndex:gridCellInfoOptions:", 0, v75, v54, v89);
          v62 = (id)objc_msgSend(v91, "insertIcon:atGridPath:options:", objb, v61, v60);
          objc_msgSend(v93, "icons");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "removeObjectsInArray:", v63);

        }
        else
        {
          objc_msgSend(v93, "insertIcon:atGridCellIndex:gridCellInfoOptions:mutationOptions:", objb, v54, v89, v55);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_94;
      case 1:
        objc_msgSend(v93, "swapContainedIcon:withContainedIcon:gridCellInfoOptions:mutationOptions:", objb, v83, v89, v55);
        goto LABEL_93;
      case 2:
        objc_msgSend(v93, "moveContainedIcon:afterIcon:gridCellInfoOptions:mutationOptions:", objb, v83, v89, v55);
        goto LABEL_93;
      case 3:
        objc_msgSend(v93, "moveContainedIcon:beforeIcon:gridCellInfoOptions:mutationOptions:", objb, v83, v89, v55);
        goto LABEL_93;
      case 4:
        objc_msgSend(v93, "moveContainedIcon:aboveIcon:gridCellInfoOptions:mutationOptions:", objb, v83, v89, v55);
        goto LABEL_93;
      case 5:
        objc_msgSend(v93, "moveContainedIcon:belowIcon:gridCellInfoOptions:mutationOptions:", objb, v83, v89, v55);
        goto LABEL_93;
      default:
LABEL_93:
        v59 = 0;
LABEL_94:
        if (!objc_msgSend(v59, "count"))
          goto LABEL_104;
        if ((v57 & 8) == 0)
        {
          v106 = 0u;
          v107 = 0u;
          v104 = 0u;
          v105 = 0u;
          v64 = v59;
          v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v104, v142, 16);
          if (v65)
          {
            v66 = *(_QWORD *)v105;
            do
            {
              for (n = 0; n != v65; ++n)
              {
                if (*(_QWORD *)v105 != v66)
                  objc_enumerationMutation(v64);
                objc_msgSend(v19, "addObject:", *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * n));
              }
              v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v104, v142, 16);
            }
            while (v65);
          }

LABEL_104:
          if (++v52 != v81)
            continue;
          v68 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v108, v143, 16);
          v81 = v68;
          if (!v68)
            goto LABEL_108;
          goto LABEL_82;
        }

        v22 = 1;
LABEL_110:

        v23 = v93;
LABEL_111:
        if (v78 && (v22 & 1) == 0)
        {
          v99[0] = MEMORY[0x1E0C809B0];
          v99[1] = 3221225472;
          v99[2] = __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_2_30;
          v99[3] = &unk_1E8D89578;
          v100 = v2;
          v101 = v77;
          v102 = self;
          v103 = v76;
          objc_msgSend(v78, "enumerateFolderIconsUsingBlock:", v99);

        }
        v69 = v76 ^ 1;
        if (!v23)
          v69 = 1;
        if (((v22 | v69) & 1) != 0)
        {
          v20 = v23;
          if ((v76 & 1) == 0)
          {
            -[SBIconListView setTemporaryModel:](self, "setTemporaryModel:", 0);
            -[SBIconListView setTemporaryFolder:](self, "setTemporaryFolder:", 0);
            v94[0] = MEMORY[0x1E0C809B0];
            v94[1] = 3221225472;
            v94[2] = __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_5;
            v94[3] = &unk_1E8D895A0;
            v94[4] = self;
            objc_msgSend(v2, "enumerateFolderIconsUsingBlock:", v94);
            -[SBIconListView updateIconLocationWithNonDefaultSizedIcons](self, "updateIconLocationWithNonDefaultSizedIcons");
            -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
          }
        }
        else
        {
          v70 = MEMORY[0x1E0C809B0];
          v96[0] = MEMORY[0x1E0C809B0];
          v96[1] = 3221225472;
          v96[2] = __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_3_31;
          v96[3] = &unk_1E8D86168;
          v71 = v2;
          v97 = v71;
          v98 = self;
          v20 = v23;
          objc_msgSend(v23, "enumerateFolderIconsUsingBlock:", v96);
          -[SBIconListView setTemporaryFolder:](self, "setTemporaryFolder:", v91);
          -[SBIconListView setTemporaryModel:](self, "setTemporaryModel:", v23);
          -[SBIconListView updateIconLocationWithNonDefaultSizedIcons:](self, "updateIconLocationWithNonDefaultSizedIcons:", objc_msgSend(v23, "directlyContainsNonDefaultSizeClassIcon"));
          if (v19)
          {
            -[SBIconListView removedIcons](self, "removedIcons");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v72, "addObjectsFromArray:", v19);

          }
          v95[0] = v70;
          v95[1] = 3221225472;
          v95[2] = __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_4;
          v95[3] = &unk_1E8D895A0;
          v95[4] = self;
          objc_msgSend(v71, "enumerateFolderIconsUsingBlock:", v95);
          -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
          -[SBIconListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

        }
LABEL_122:

        return;
    }
  }
}

void __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;

  objc_msgSend(a2, "folder");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "containsIcon:", *(_QWORD *)(a1 + 32)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

BOOL __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "gridCellIndex");
  v6 = objc_msgSend(v4, "gridCellIndex");

  return v5 < v6;
}

id __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  if (objc_msgSend(v3, "isFolderIcon"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "nodeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "directlyContainedIconWithIdentifier:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v3;
  }

  return v6;
}

void __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_28(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "folder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmpty");
  v5 = objc_msgSend(v3, "containsOneIcon");
  if ((v4 & 1) != 0 || (objc_msgSend(v3, "isCancelable") & v5) == 1)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v6, "addObject:", v10);
  }

}

void __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_2_30(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "uniqueIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "directlyContainedIconWithIdentifier:");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "iconWithIdentifier:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "removedIcons");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v5);

      v6 = 1;
      goto LABEL_6;
    }
  }
  v6 = 0;
LABEL_6:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 432), "objectForKey:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 432), "removeObjectForKey:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 432), "setObject:forKey:", v8, v5);
  objc_msgSend(v8, "setOverrideBadgeNumberOrString:", 0);
  if ((v6 & 1) == 0 && !*(_BYTE *)(a1 + 56) && v5)
    objc_msgSend(v8, "setIcon:", v5);

}

void __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_3_31(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "directlyContainedIconWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 432), "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 432), "setObject:forKey:", v5, v8);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 432), "removeObjectForKey:", v4);
      objc_msgSend(v8, "badgeNumberOrString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(v5, "setOverrideBadgeNumberOrString:", v6);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setOverrideBadgeNumberOrString:", v7);

      }
    }

  }
}

void __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "folder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addFolderObserver:", *(_QWORD *)(a1 + 32));

}

void __62__SBIconListView_regenerateTemporaryDisplayedModelIfNecessary__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "folder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFolderObserver:", *(_QWORD *)(a1 + 32));

}

- (unint64_t)folderMutationOptionsForIconLayoutHidingAssertion:(id)a3
{
  unint64_t v4;

  v4 = objc_msgSend(a3, "folderMutationOptions");
  if (-[SBIconListView allowsGaps](self, "allowsGaps"))
    return v4 | 0x400000;
  else
    return v4;
}

- (unint64_t)listMutationOptionsForIconLayoutHidingAssertion:(id)a3
{
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;

  v4 = objc_msgSend(a3, "listMutationOptions");
  v5 = -[SBIconListView allowsGaps](self, "allowsGaps");
  v6 = v4 | 0x100000;
  if (!v5)
    v6 = v4;
  return v6 | 0x8000;
}

- (BOOL)isEmpty
{
  void *v2;
  char v3;

  -[SBIconListView displayedModel](self, "displayedModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEmpty");

  return v3;
}

- (BOOL)isFull
{
  void *v2;
  char v3;

  -[SBIconListView displayedModel](self, "displayedModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFull");

  return v3;
}

- (BOOL)allowsAddingIconCount:(unint64_t)a3
{
  return 1;
}

- (void)popIcon:(id)a3
{
  void *v4;
  void *v5;

  -[NSMapTable objectForKey:](self->_iconViews, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[SBIconListView popIconView:](self, "popIconView:", v4);
    v4 = v5;
  }

}

- (void)popIconView:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  CGAffineTransform v11;

  v3 = a3;
  CGAffineTransformMakeScale(&v11, 0.01, 0.01);
  objc_msgSend(v3, "setTransform:", &v11);
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __30__SBIconListView_popIconView___block_invoke;
  v9[3] = &unk_1E8D84C50;
  v10 = v3;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __30__SBIconListView_popIconView___block_invoke_2;
  v7[3] = &unk_1E8D84F68;
  v8 = v10;
  v6 = v10;
  objc_msgSend(v4, "animateWithDuration:animations:completion:", v9, v7, 0.15);

}

uint64_t __30__SBIconListView_popIconView___block_invoke(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v3, 1.2, 1.2);
  return objc_msgSend(v1, "setTransform:", &v3);
}

void __30__SBIconListView_popIconView___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v1 = (void *)MEMORY[0x1E0DC3F10];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __30__SBIconListView_popIconView___block_invoke_3;
  v2[3] = &unk_1E8D84C50;
  v3 = *(id *)(a1 + 32);
  objc_msgSend(v1, "animateWithDuration:animations:", v2, 0.075);

}

uint64_t __30__SBIconListView_popIconView___block_invoke_3(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (void)fadeInIcon:(id)a3
{
  void *v4;
  void *v5;

  -[NSMapTable objectForKey:](self->_iconViews, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[SBIconListView fadeInIconView:](self, "fadeInIconView:", v4);
    v4 = v5;
  }

}

- (void)fadeInIconView:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(v3, "setAlpha:", 0.0);
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__SBIconListView_fadeInIconView___block_invoke;
  v6[3] = &unk_1E8D84C50;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "animateWithDuration:animations:", v6, 0.25);

}

uint64_t __33__SBIconListView_fadeInIconView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)markIcon:(id)a3 asNeedingAnimation:(int64_t)a4
{
  NSMapTable *specialIconAnimations;
  NSMapTable *v7;
  NSMapTable *v8;
  void *v9;
  id v10;

  v10 = a3;
  specialIconAnimations = self->_specialIconAnimations;
  if (!specialIconAnimations)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v7 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_specialIconAnimations;
    self->_specialIconAnimations = v7;

    specialIconAnimations = self->_specialIconAnimations;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](specialIconAnimations, "setObject:forKey:", v9, v10);

  -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
}

- (id)pauseLayoutForIconView:(id)a3 forReason:(id)a4
{
  id v6;
  id v7;
  NSMapTable *v8;
  NSMapTable *pausedLayoutAssertionsForIconViews;
  SBIconListViewPauseLayoutAssertion *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (!self->_pausedLayoutAssertionsForIconViews)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    pausedLayoutAssertionsForIconViews = self->_pausedLayoutAssertionsForIconViews;
    self->_pausedLayoutAssertionsForIconViews = v8;

  }
  v10 = -[SBIconListViewPauseLayoutAssertion initWithListView:iconView:reason:]([SBIconListViewPauseLayoutAssertion alloc], "initWithListView:iconView:reason:", self, v6, v7);
  -[NSMapTable objectForKey:](self->_pausedLayoutAssertionsForIconViews, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_pausedLayoutAssertionsForIconViews, "setObject:forKey:", v11, v6);
  }
  objc_msgSend(v11, "addObject:", v10);

  return v10;
}

- (void)removePauseLayoutAssertion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "iconView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_pausedLayoutAssertionsForIconViews, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  objc_msgSend(v5, "removeObject:", v4);

  if (!objc_msgSend(v5, "count"))
  {
    -[NSMapTable removeObjectForKey:](self->_pausedLayoutAssertionsForIconViews, "removeObjectForKey:", v7);
    if (v6)
      -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
  }

}

- (void)setPausesIconsForScrolling:(BOOL)a3
{
  if (self->_pausesIconsForScrolling != a3)
  {
    self->_pausesIconsForScrolling = a3;
    -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
  }
}

- (void)performSpecialIconAnimationsWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  NSMapTable *v5;
  NSMapTable *specialIconAnimations;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSMapTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSMapTable *v19;
  void (**v20)(_QWORD);
  _QWORD v21[4];
  NSObject *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD aBlock[5];
  void (**v29)(_QWORD);
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  v5 = self->_specialIconAnimations;
  specialIconAnimations = self->_specialIconAnimations;
  self->_specialIconAnimations = 0;

  v7 = -[NSMapTable count](v5, "count");
  if (v7)
  {
    v8 = v7;
    self->_performingSpecialIconAnimations = 1;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__SBIconListView_performSpecialIconAnimationsWithCompletionHandler___block_invoke;
    aBlock[3] = &unk_1E8D84D28;
    aBlock[4] = self;
    v29 = v4;
    v9 = _Block_copy(aBlock);
    v20 = v4;
    if (v8 == 1)
      v10 = 0;
    else
      v10 = dispatch_group_create();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = v5;
    v11 = v5;
    v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[NSMapTable objectForKey:](v11, "objectForKey:", v16, v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "integerValue");

          if (v10)
            dispatch_group_enter(v10);
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __68__SBIconListView_performSpecialIconAnimationsWithCompletionHandler___block_invoke_2;
          v21[3] = &unk_1E8D84D28;
          v22 = v10;
          v23 = v9;
          -[SBIconListView performSpecialIconAnimation:icon:completionHandler:](self, "performSpecialIconAnimation:icon:completionHandler:", v18, v16, v21);

        }
        v13 = -[NSMapTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
      }
      while (v13);
    }

    if (v10)
      dispatch_group_notify(v10, MEMORY[0x1E0C80D38], v9);

    v5 = v19;
    v4 = v20;
  }
  else
  {
    v4[2](v4);
  }

}

uint64_t __68__SBIconListView_performSpecialIconAnimationsWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 429) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __68__SBIconListView_performSpecialIconAnimationsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
    dispatch_group_leave(v2);
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)performSpecialIconAnimation:(int64_t)a3 icon:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;

  v9 = a4;
  v8 = a5;
  switch(a3)
  {
    case 2:
      -[SBIconListView performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon:completionHandler:](self, "performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon:completionHandler:", v9, v8);
      break;
    case 1:
      -[SBIconListView performZoomInSpecialIconAnimationWithIcon:completionHandler:](self, "performZoomInSpecialIconAnimationWithIcon:completionHandler:", v9, v8);
      break;
    case 0:
      -[SBIconListView performZoomOutSpecialIconAnimationWithIcon:completionHandler:](self, "performZoomOutSpecialIconAnimationWithIcon:completionHandler:", v9, v8);
      break;
  }

}

- (void)performZoomInSpecialIconAnimationWithIcon:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  CGAffineTransform v15;

  v6 = a4;
  -[SBIconListView iconViewForIcon:](self, "iconViewForIcon:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v15, 0.001, 0.001);
  objc_msgSend(v7, "setTransform:", &v15);
  objc_msgSend(v7, "setAlpha:", 0.0);
  v8 = (void *)MEMORY[0x1E0DC3F10];
  v12 = v6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __78__SBIconListView_performZoomInSpecialIconAnimationWithIcon_completionHandler___block_invoke;
  v13[3] = &unk_1E8D84C50;
  v14 = v7;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__SBIconListView_performZoomInSpecialIconAnimationWithIcon_completionHandler___block_invoke_2;
  v11[3] = &unk_1E8D86600;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "animateWithDuration:animations:completion:", v13, v11, 0.2);

}

uint64_t __78__SBIconListView_performZoomInSpecialIconAnimationWithIcon_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v5[3];

  v2 = *(void **)(a1 + 32);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v5);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __78__SBIconListView_performZoomInSpecialIconAnimationWithIcon_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performZoomOutSpecialIconAnimationWithIcon:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3F10];
  v12 = v6;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__SBIconListView_performZoomOutSpecialIconAnimationWithIcon_completionHandler___block_invoke;
  v13[3] = &unk_1E8D84C50;
  v14 = v7;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__SBIconListView_performZoomOutSpecialIconAnimationWithIcon_completionHandler___block_invoke_2;
  v11[3] = &unk_1E8D86600;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "animateWithDuration:animations:completion:", v13, v11, 0.2);

}

uint64_t __79__SBIconListView_performZoomOutSpecialIconAnimationWithIcon_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, 0.001, 0.001);
  objc_msgSend(v2, "setTransform:", &v4);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __79__SBIconListView_performZoomOutSpecialIconAnimationWithIcon_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  _QWORD v56[5];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;

  v6 = a3;
  v54 = a4;
  -[SBIconListView iconViewForIcon:](self, "iconViewForIcon:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "matchingIconViewWithConfigurationOptions:", 6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frameForMiniIconAtIndex:", 0);
  v48 = v10;
  v49 = v9;
  v12 = v11;
  v14 = v13;
  -[SBIconListView extraIconForFolderCollapseSpecialIconAnimation](self, "extraIconForFolderCollapseSpecialIconAnimation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    SBLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SBIconListView performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon:completionHandler:].cold.1();

  }
  -[SBIconListView iconViewForIcon:](self, "iconViewForIcon:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
  v18 = objc_claimAutoreleasedReturnValue();
  -[SBIconListView layout](self, "layout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "iconImageInfo");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v55 = v19;
  v28 = SBHIconListLayoutFolderIconGridCellSize(v19);
  v30 = v29;
  v31 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(v17, "iconImageSnapshot");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v31, "initWithImage:", v32);

  v52 = (void *)v18;
  v53 = v7;
  if (v15)
  {
    objc_msgSend(v7, "folderIconImageCache");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "gridCellImageOfSize:forIcon:iconImageInfo:imageAppearance:", v15, v18, v28, v30, v21, v23, v25, v27);
    v35 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v35 = 0;
  }
  v51 = (void *)v35;
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v35);
  objc_msgSend(v8, "folderIconBackgroundView");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setIconImageAndAccessoryAlpha:", 0.0);
  objc_msgSend(v17, "setIconLabelAlpha:", 0.0);
  objc_msgSend(v17, "setRefusesRecipientStatus:", 1);
  objc_msgSend(v33, "layer");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAllowsEdgeAntialiasing:", 1);

  objc_msgSend(v36, "layer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setAllowsEdgeAntialiasing:", 1);

  objc_msgSend(v17, "iconImageCenter");
  objc_msgSend(v37, "setCenter:");
  objc_msgSend(v33, "setFrame:", v49, v48, v12, v14);
  objc_msgSend(v36, "setFrame:", v49, v48, v12, v14);
  objc_msgSend(v17, "addSubview:", v37);
  objc_msgSend(v17, "addSubview:", v33);
  objc_msgSend(v17, "addSubview:", v36);
  v50 = v8;
  v40 = MEMORY[0x1E0C809B0];
  v41 = (void *)MEMORY[0x1E0DC3F10];
  v62[0] = MEMORY[0x1E0C809B0];
  v62[1] = 3221225472;
  v62[2] = __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke;
  v62[3] = &unk_1E8D86330;
  v63 = v17;
  v64 = v33;
  v65 = v36;
  v66 = v37;
  v56[0] = v40;
  v56[1] = 3221225472;
  v56[2] = __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_4;
  v56[3] = &unk_1E8D895C8;
  v56[4] = self;
  v57 = v15;
  v58 = v66;
  v59 = v64;
  v60 = v65;
  v61 = v54;
  v42 = v17;
  v43 = v15;
  v44 = v66;
  v45 = v64;
  v46 = v65;
  v47 = v54;
  objc_msgSend(v41, "animateKeyframesWithDuration:delay:options:animations:completion:", 0, v62, v56, 0.5, 0.0);
  -[SBIconListView setExtraIconForFolderCollapseSpecialIconAnimation:](self, "setExtraIconForFolderCollapseSpecialIconAnimation:", 0);

}

void __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_2;
  v7[3] = &unk_1E8D86330;
  v8 = a1[4];
  v9 = a1[5];
  v10 = a1[6];
  v11 = a1[7];
  objc_msgSend(v3, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v7, 0.0, 1.0);
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_3;
  v5[3] = &unk_1E8D84C50;
  v6 = a1[4];
  objc_msgSend(v4, "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 0.7, 0.3);

}

uint64_t __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_2(id *a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  CGAffineTransform v12;

  objc_msgSend(a1[4], "iconImageFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1[5], "setFrame:");
  objc_msgSend(a1[6], "setFrame:", v3, v5, v7, v9);
  objc_msgSend(a1[6], "setAlpha:", 0.0);
  objc_msgSend(a1[7], "setAlpha:", 0.0);
  v10 = a1[7];
  CGAffineTransformMakeScale(&v12, 0.01, 0.01);
  return objc_msgSend(v10, "setTransform:", &v12);
}

uint64_t __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconLabelAlpha:", 1.0);
}

void __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "iconViewForIcon:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setIconImageAlpha:", 1.0);
  objc_msgSend(v2, "setIconAccessoryAlpha:", 0.0);
  objc_msgSend(v2, "setRefusesRecipientStatus:", 0);
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_5;
  v5[3] = &unk_1E8D84C50;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "animateWithDuration:animations:", v5, 0.15);
  objc_msgSend(*(id *)(a1 + 48), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 56), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 64), "removeFromSuperview");
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

}

uint64_t __103__SBIconListView_performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon_completionHandler___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconAccessoryAlpha:", 1.0);
}

- (void)layoutAndCreateIcon:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  -[SBIconListView displayedModel](self, "displayedModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexForIcon:", v6);
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    -[SBIconListView layoutAndCreateIcon:atIndex:](self, "layoutAndCreateIcon:atIndex:", v6, v5);

}

- (void)layoutAndCreateIcon:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  __int128 v12;
  SBIconListView *v13;
  SBIconListView *v14;
  _BOOL4 v15;
  void *v16;
  _OWORD v17[3];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBIconListView iconViewForIcon:](self, "iconViewForIcon:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAlpha:", 1.0);
  -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
  if (v7)
  {
    -[SBIconListView centerForIconAtIndex:](self, "centerForIconAtIndex:", a4);
    -[SBIconListView layoutScale](self, "layoutScale");
    UIPointRoundToScale();
    v9 = v8;
    v11 = v10;
    v12 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v17[0] = *MEMORY[0x1E0C9BAA8];
    v17[1] = v12;
    v17[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v7, "setTransform:", v17);
    objc_msgSend(v7, "setCenter:", v9, v11);
    objc_msgSend(v7, "superview");
    v13 = (SBIconListView *)objc_claimAutoreleasedReturnValue();
    if (v13 == self)
    {

    }
    else
    {
      v14 = v13;
      v15 = -[SBIconListView shouldReparentView:](self, "shouldReparentView:", v7);

      if (v15)
      {
        -[SBIconListView _insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary:](self, "_insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary:", v7);
        -[SBIconListView addSubview:](self, "addSubview:", v7);
      }
    }
    v18[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView _updateEditingStateForIcons:animated:](self, "_updateEditingStateForIcons:animated:", v16, 0);

  }
}

- (id)removedIcons
{
  NSMutableSet *removedIcons;
  NSMutableSet *v4;
  NSMutableSet *v5;

  removedIcons = self->_removedIcons;
  if (!removedIcons)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->_removedIcons;
    self->_removedIcons = v4;

    removedIcons = self->_removedIcons;
  }
  return removedIcons;
}

- (void)setAlphaForAllIcons:(double)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[SBIconListView displayedModel](self, "displayedModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v5, "icons", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setAlpha:", a3);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)removeAllIconAnimations
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[SBIconListView displayedModel](self, "displayedModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v3, "icons", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeAllIconAnimations");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (CGSize)alignmentIconViewSize
{
  objc_class *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  v3 = -[SBIconListView baseIconViewClass](self, "baseIconViewClass");
  -[SBIconListView iconImageSize](self, "iconImageSize");
  -[objc_class defaultIconViewSizeForIconImageSize:configurationOptions:](v3, "defaultIconViewSizeForIconImageSize:configurationOptions:", -[SBIconListView iconViewConfigurationOptions](self, "iconViewConfigurationOptions"), v4, v5);
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGPoint)originForIconAtIndex:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  CGPoint result;

  v4 = -[SBIconListView iconCoordinateForIndex:forOrientation:](self, "iconCoordinateForIndex:forOrientation:", a3, -[SBIconListView layoutOrientation](self, "layoutOrientation"));
  -[SBIconListView originForIconAtCoordinate:](self, "originForIconAtCoordinate:", v4, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)originForIcon:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v4 = a3;
  -[SBIconListView displayedModel](self, "displayedModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexForIcon:", v4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBIconListView originForIcon:].cold.1();

    v8 = *MEMORY[0x1E0C9D538];
    v9 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[SBIconListView originForIconAtIndex:](self, "originForIconAtIndex:", v6);
    v8 = v10;
    v9 = v11;
  }

  v12 = v8;
  v13 = v9;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGPoint)centerForIcon:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  CGPoint result;

  v4 = -[SBIconListView coordinateForIcon:](self, "coordinateForIcon:", a3);
  -[SBIconListView centerForIconCoordinate:](self, "centerForIconCoordinate:", v4, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)centerForIconCoordinate:(SBIconCoordinate)a3
{
  int64_t row;
  int64_t column;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  row = a3.row;
  column = a3.column;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView centerForIconCoordinate:metrics:](self, "centerForIconCoordinate:metrics:", column, row, v6);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGRect)rectForCellAtIconCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SBIconListView rectForCellAtIconCoordinate:metrics:options:](self, "rectForCellAtIconCoordinate:metrics:options:", a3.column, a3.row, a4, 0);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)rectForCellAtIconCoordinate:(SBIconCoordinate)a3 metrics:(id)a4 options:(unint64_t)a5
{
  int64_t row;
  int64_t column;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  SBHIconGridSize v23;
  uint64_t v24;
  int64_t v25;
  int64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  int IsOne;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  CGRect result;

  row = a3.row;
  column = a3.column;
  v9 = a4;
  if (column != 0x7FFFFFFFFFFFFFFFLL && column && row != 0x7FFFFFFFFFFFFFFFLL && row)
  {
    v18 = -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v9);
    v19 = -[SBIconListView iconGridRangeForGridCellIndex:metrics:options:](self, "iconGridRangeForGridCellIndex:metrics:options:", v18, v9, a5);
    -[SBIconListView iconAtGridCellIndex:metrics:](self, "iconAtGridCellIndex:metrics:", v18, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v20;
    if (v20)
    {
      objc_msgSend(v20, "gridSizeClass");
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = CFSTR("SBHIconGridSizeClassDefault");
    }
    v22 = v21;
    v23 = (SBHIconGridSize)-[SBIconListView iconGridSizeForClass:](self, "iconGridSizeForClass:", v21);
    v24 = column;
    v25 = row;
    if (v19 != v18)
    {
      v24 = -[SBIconListView iconCoordinateForGridCellIndex:metrics:](self, "iconCoordinateForGridCellIndex:metrics:", v19, v9);
      v25 = v26;
    }
    -[SBIconListView rectForDefaultSizedCellsOfSize:startingAtCoordinate:metrics:](self, "rectForDefaultSizedCellsOfSize:startingAtCoordinate:metrics:", *(unsigned int *)&v23, v24, v25, v9);
    UIRectGetCenter();
    v28 = v27;
    v30 = v29;
    -[SBIconListView iconImageSizeForGridSizeClass:](self, "iconImageSizeForGridSizeClass:", v22);
    v32 = v31;
    v34 = v33;
    objc_msgSend(v9, "iconContentScale");
    v36 = v35;
    IsOne = BSFloatIsOne();
    v38 = 1.0;
    if (!IsOne)
      v38 = v36;
    -[SBIconListView _enforceLayoutInsetsOnRectForCellAtIconCoordinate:gridSizeClass:proposedFrame:metrics:](self, "_enforceLayoutInsetsOnRectForCellAtIconCoordinate:gridSizeClass:proposedFrame:metrics:", v24, v25, v22, v9, v28 - v32 * v38 * 0.5, v30 - v34 * v38 * 0.5);
    v12 = v39;
    v13 = v40;
    -[SBIconListView _alignedIconPointForPoint:](self, "_alignedIconPointForPoint:");
    v10 = v41;
    v11 = v42;
    -[SBIconListView effectiveLayoutDelegateForSelector:](self, "effectiveLayoutDelegateForSelector:", sel_iconListView_centerForIconCoordinate_metrics_proposedCenter_);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (v43)
    {
      UIRectGetCenter();
      v45 = v44;
      v47 = v46;
      objc_msgSend(v43, "iconListView:centerForIconCoordinate:metrics:proposedCenter:", self, column, row, v9);
      if (v49 != v45 || v48 != v47)
      {
        UIRectCenteredAboutPoint();
        v10 = v51;
        v11 = v52;
        v12 = v53;
        v13 = v54;
      }
    }

  }
  else
  {
    v10 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)_enforceLayoutInsetsOnRectForCellAtIconCoordinate:(SBIconCoordinate)a3 gridSizeClass:(id)a4 proposedFrame:(CGRect)a5 metrics:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  double x;
  int64_t column;
  __CFString *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int16 v28;
  uint64_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double MaxX;
  double v36;
  double v37;
  double v38;
  double v39;
  CGRect v40;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  column = a3.column;
  v13 = (__CFString *)a4;
  v14 = a6;
  if (-[SBIconListView _shouldEnforceLayoutInsetsForAxis:](self, "_shouldEnforceLayoutInsetsForAxis:", 1))
  {
    if (CFSTR("SBHIconGridSizeClassDefault") == v13
      || objc_msgSend(CFSTR("SBHIconGridSizeClassDefault"), "isEqualToString:", v13))
    {
      -[SBIconListView iconLayoutRect](self, "iconLayoutRect");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v23 = 1;
    }
    else
    {
      -[SBIconListView _widgetIconLayoutRect](self, "_widgetIconLayoutRect");
      v16 = v24;
      v18 = v25;
      v20 = v26;
      v22 = v27;
      v23 = 0;
    }
    v28 = (unsigned __int16)-[SBIconListView iconGridSizeForClass:](self, "iconGridSizeForClass:", v13);
    v29 = objc_msgSend(v14, "columns");
    if ((v23 & 1) == 0 && (column == 1 || column + v28 - 1 == v29))
    {
      v30 = -[SBIconListView isRTL](self, "isRTL");
      v31 = v16;
      v32 = v18;
      v33 = v20;
      v34 = v22;
      if ((column == 1) == v30)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v31);
        v40.origin.x = x;
        v40.origin.y = y;
        v40.size.width = width;
        v40.size.height = height;
        x = MaxX - CGRectGetWidth(v40);
      }
      else
      {
        x = CGRectGetMinX(*(CGRect *)&v31);
      }
    }
  }

  v36 = x;
  v37 = y;
  v38 = width;
  v39 = height;
  result.size.height = v39;
  result.size.width = v38;
  result.origin.y = v37;
  result.origin.x = v36;
  return result;
}

- (CGRect)fullRectForCellAtIconCoordinate:(SBIconCoordinate)a3 metrics:(id)a4 options:(unint64_t)a5
{
  int64_t row;
  int64_t column;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  row = a3.row;
  column = a3.column;
  v9 = a4;
  if (column != 0x7FFFFFFFFFFFFFFFLL && column && row != 0x7FFFFFFFFFFFFFFFLL && row)
  {
    v18 = -[SBIconListView iconGridRangeForGridCellIndex:metrics:options:](self, "iconGridRangeForGridCellIndex:metrics:options:", -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v9), v9, a5);
    -[SBIconListView fullRectForGridRange:metrics:](self, "fullRectForGridRange:metrics:", v18, v19, v9);
    v10 = v20;
    v11 = v21;
    v12 = v22;
    v13 = v23;
  }
  else
  {
    v10 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v14 = v10;
  v15 = v11;
  v16 = v12;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (CGRect)fullRectForGridRange:(SBHIconGridRange)a3 metrics:(id)a4
{
  int size;
  unint64_t cellIndex;
  id v7;
  __int128 v8;
  void *v9;
  unsigned __int16 v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  CGRect result;

  size = (int)a3.size;
  cellIndex = a3.cellIndex;
  v7 = a4;
  v23 = 0;
  v24 = (double *)&v23;
  v25 = 0x4010000000;
  v26 = &unk_1D01C8D52;
  v8 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v27 = *MEMORY[0x1E0C9D628];
  v28 = v8;
  objc_msgSend(v7, "gridCellInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "gridSize");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __47__SBIconListView_fullRectForGridRange_metrics___block_invoke;
  v20[3] = &unk_1E8D895F0;
  v20[4] = self;
  v11 = v7;
  v21 = v11;
  v22 = &v23;
  SBHIconGridRangeEnumerateCellIndexes(cellIndex, size, v10, v20);

  v12 = v24[4];
  v13 = v24[5];
  v14 = v24[6];
  v15 = v24[7];

  _Block_object_dispose(&v23, 8);
  v16 = v12;
  v17 = v13;
  v18 = v14;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

void __47__SBIconListView_fullRectForGridRange_metrics___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  _BOOL4 IsNull;
  CGRect *v14;
  CGRect v15;
  CGRect v16;

  v3 = objc_msgSend(*(id *)(a1 + 32), "iconCoordinateForGridCellIndex:metrics:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "fullRectForDefaultSizedCellAtCoordinate:metrics:", v3, v4, *(_QWORD *)(a1 + 40));
  v6 = v5;
  y = v7;
  width = v9;
  height = v11;
  IsNull = CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
  v14 = *(CGRect **)(*(_QWORD *)(a1 + 48) + 8);
  if (IsNull)
  {
    v14[1].origin.x = v6;
  }
  else
  {
    v16.origin.x = v6;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v15 = CGRectUnion(v14[1], v16);
    y = v15.origin.y;
    width = v15.size.width;
    height = v15.size.height;
    v14 = *(CGRect **)(*(_QWORD *)(a1 + 48) + 8);
    v14[1].origin.x = v15.origin.x;
  }
  v14[1].origin.y = y;
  v14[1].size.width = width;
  v14[1].size.height = height;
}

- (CGPoint)centerForIconAtIndex:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  double v6;
  double v7;
  CGPoint result;

  v4 = -[SBIconListView iconCoordinateForIndex:forOrientation:](self, "iconCoordinateForIndex:forOrientation:", a3, -[SBIconListView layoutOrientation](self, "layoutOrientation"));
  -[SBIconListView centerForIconCoordinate:](self, "centerForIconCoordinate:", v4, v5);
  result.y = v7;
  result.x = v6;
  return result;
}

- (CGPoint)centerForIconAtIndex:(unint64_t)a3 metrics:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  v6 = a4;
  v7 = -[SBIconListView iconCoordinateForIndex:metrics:](self, "iconCoordinateForIndex:metrics:", a3, v6);
  -[SBIconListView centerForIconCoordinate:metrics:](self, "centerForIconCoordinate:metrics:", v7, v8, v6);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGRect)rectForIconAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
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
  double v19;
  CGRect result;

  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBIconListView iconCoordinateForIndex:metrics:](self, "iconCoordinateForIndex:metrics:", a3, v5);
  -[SBIconListView rectForIconCoordinate:metrics:](self, "rectForIconCoordinate:metrics:", v6, v7, v5);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)rectForIcon:(id)a3
{
  id v4;
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
  CGRect result;

  v4 = a3;
  -[SBIconListView displayedModel](self, "displayedModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexForIcon:", v4);

  -[SBIconListView rectForIconAtIndex:](self, "rectForIconAtIndex:", v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)rectForIconCoordinate:(SBIconCoordinate)a3
{
  int64_t row;
  int64_t column;
  void *v6;
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
  CGRect result;

  row = a3.row;
  column = a3.column;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView rectForIconCoordinate:metrics:](self, "rectForIconCoordinate:metrics:", column, row, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)rectForIconCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row;
  int64_t column;
  id v7;
  unint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  row = a3.row;
  column = a3.column;
  v7 = a4;
  v8 = -[SBIconListView iconIndexForCoordinate:metrics:](self, "iconIndexForCoordinate:metrics:", column, row, v7);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = *MEMORY[0x1E0C9D628];
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    v13 = v8;
    -[SBIconListView displayedModel](self, "displayedModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "iconAtIndex:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "gridSizeClass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView originForIconAtCoordinate:metrics:](self, "originForIconAtCoordinate:metrics:", column, row, v7);
    v9 = v17;
    v10 = v18;
    -[SBIconListView iconImageSizeForGridSizeClass:](self, "iconImageSizeForGridSizeClass:", v16);
    v11 = v19;
    v12 = v20;

  }
  v21 = v9;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (unint64_t)numberOfDisplayedIconViews
{
  return -[NSMapTable count](self->_iconViews, "count");
}

BOOL __34__SBIconListView_iconViewForIcon___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

- (id)makeIconView
{
  unint64_t v3;
  void *v4;
  void *v5;

  v3 = -[SBIconListView iconViewConfigurationOptions](self, "iconViewConfigurationOptions");
  -[SBIconListView layoutProvider](self, "layoutProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(-[SBIconListView baseIconViewClass](self, "baseIconViewClass")), "initWithConfigurationOptions:listLayoutProvider:", v3, v4);

  return v5;
}

void __44__SBIconListView_configureIconView_forIcon___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "overrideIconImageStyleConfiguration");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setOverrideIconImageStyleConfiguration:", v2);

}

- (unint64_t)gridCellIndexForIcon:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = -[SBIconListView coordinateForIcon:](self, "coordinateForIcon:", a3);
  return SBIconCoordinateGetGridCellIndex(v4, v5, -[SBIconListView gridSizeForCurrentOrientation](self, "gridSizeForCurrentOrientation"));
}

- (unint64_t)gridCellIndexForIconView:(id)a3
{
  void *v4;
  unint64_t v5;

  objc_msgSend(a3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBIconListView gridCellIndexForIcon:](self, "gridCellIndexForIcon:", v4);

  return v5;
}

- (SBHIconGridRange)gridRangeForIconAtIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  SBHIconGridRange result;

  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBIconListView iconGridRangeForIndex:metrics:](self, "iconGridRangeForIndex:metrics:", a3, v5);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.size = (SBHIconGridSize)v10;
  result.cellIndex = v9;
  return result;
}

- (id)iconViewForCoordinate:(SBIconCoordinate)a3
{
  int64_t row;
  int64_t column;
  void *v6;
  void *v7;
  void *v8;

  row = a3.row;
  column = a3.column;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView iconAtCoordinate:metrics:](self, "iconAtCoordinate:metrics:", column, row, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SBIconListView iconViewForIcon:](self, "iconViewForIcon:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)iconViewForGridCellIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView iconAtGridCellIndex:metrics:](self, "iconAtGridCellIndex:metrics:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[SBIconListView iconViewForIcon:](self, "iconViewForIcon:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)indexOfIcon:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  -[SBIconListView temporarilyMappedIconForIcon:](self, "temporarilyMappedIconForIcon:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView displayedModel](self, "displayedModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexForIcon:", v4);

  return v6;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  return objc_msgSend(a3, "isDescendantOfView:", self);
}

- (BOOL)shouldReparentView:(id)a3
{
  id v4;
  SBIconListView *v5;
  void *v6;
  char v7;
  BOOL v8;
  SBIconWidgetIntroductionView *pronouncedContainerView;
  BOOL v11;
  int v12;

  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (SBIconListView *)objc_claimAutoreleasedReturnValue();
  if (v5
    && (-[SBIconListView iconViewProvider](self, "iconViewProvider"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isIconViewRecycled:", v4),
        v6,
        (v7 & 1) == 0))
  {
    pronouncedContainerView = self->_pronouncedContainerView;
    if (pronouncedContainerView)
      v11 = v5 == (SBIconListView *)pronouncedContainerView;
    else
      v11 = 0;
    if (v11)
    {
      v8 = 0;
    }
    else
    {
      v12 = !-[SBIconListView hasOverridingLayoutDelegates](self, "hasOverridingLayoutDelegates");
      if (v5 == self)
        v8 = 0;
      else
        v8 = v12;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (id)defaultAnimator
{
  void *v2;
  SBIconListViewDefaultAnimator *v3;
  void *v4;

  v2 = (void *)defaultAnimator_animator;
  if (!defaultAnimator_animator)
  {
    v3 = objc_alloc_init(SBIconListViewDefaultAnimator);
    v4 = (void *)defaultAnimator_animator;
    defaultAnimator_animator = (uint64_t)v3;

    v2 = (void *)defaultAnimator_animator;
  }
  return v2;
}

+ (id)dominoAnimator
{
  void *v2;
  SBIconListViewDominoAnimator *v3;
  void *v4;

  v2 = (void *)dominoAnimator_animator;
  if (!dominoAnimator_animator)
  {
    v3 = objc_alloc_init(SBIconListViewDominoAnimator);
    v4 = (void *)dominoAnimator_animator;
    dominoAnimator_animator = (uint64_t)v3;

    v2 = (void *)dominoAnimator_animator;
  }
  objc_msgSend(v2, "reset");
  return (id)dominoAnimator_animator;
}

+ (id)clusterAnimator
{
  void *v2;
  SBIconListViewClusterAnimator *v3;
  void *v4;

  v2 = (void *)clusterAnimator_animator;
  if (!clusterAnimator_animator)
  {
    v3 = objc_alloc_init(SBIconListViewClusterAnimator);
    v4 = (void *)clusterAnimator_animator;
    clusterAnimator_animator = (uint64_t)v3;

    v2 = (void *)clusterAnimator_animator;
  }
  return v2;
}

+ (id)multiStageAnimator
{
  void *v2;
  SBIconListViewMultiStageAnimator *v3;
  void *v4;

  v2 = (void *)multiStageAnimator_animator;
  if (!multiStageAnimator_animator)
  {
    v3 = objc_alloc_init(SBIconListViewMultiStageAnimator);
    v4 = (void *)multiStageAnimator_animator;
    multiStageAnimator_animator = (uint64_t)v3;

    v2 = (void *)multiStageAnimator_animator;
  }
  return v2;
}

- (void)layoutIconsIfNeeded:(double)a3
{
  uint64_t v3;

  if (a3 > 0.0)
    v3 = 0;
  else
    v3 = -1;
  -[SBIconListView layoutIconsIfNeededWithAnimationType:options:](self, "layoutIconsIfNeededWithAnimationType:options:", v3, 0);
}

uint64_t __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIconsIfNeededUsingAnimator:options:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_69(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "iconListView:willLayoutIconView:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_2_75(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "removeIconView:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)layOutEmptyGridCellViewsUsingAnimator:(id)a3
{
  _BOOL4 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  NSMutableDictionary *emptyGridCells;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  NSMutableDictionary *v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id obj;
  void *v41;
  _QWORD v42[4];
  id v43;
  SBIconListView *v44;
  uint64_t v45;
  id v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  id v54;
  int v55;
  BOOL v56;
  _QWORD v57[4];
  id v58;
  SBIconListView *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  BOOL v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  v4 = -[SBIconListView showsEmptyGridCells](self, "showsEmptyGridCells");
  if (v4 || -[NSMutableDictionary count](self->_emptyGridCells, "count"))
  {
    -[SBIconListView layoutMetrics](self, "layoutMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gridCellInfo");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v4)
      v8 = (void *)v6;
    else
      v8 = 0;
    v9 = v8;
    -[NSMutableDictionary allKeys](self->_emptyGridCells, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    LODWORD(v10) = objc_msgSend(v7, "gridSize");
    -[SBIconListView iconImageInfoForGridSizeClass:](self, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault"));
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = MEMORY[0x1E0C809B0];
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke;
    v57[3] = &unk_1E8D89668;
    v21 = v11;
    v65 = (int)v10;
    v58 = v21;
    v59 = self;
    v22 = v5;
    v60 = v22;
    v66 = v39 != 0;
    v61 = v13;
    v62 = v15;
    v63 = v17;
    v64 = v19;
    objc_msgSend(v9, "enumerateEmptyGridCellIndexesUsingBlock:", v57);
    emptyGridCells = self->_emptyGridCells;
    v53[0] = v20;
    v53[1] = 3221225472;
    v53[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_5;
    v53[3] = &unk_1E8D89690;
    v55 = (int)v10;
    v53[4] = self;
    v24 = v22;
    v54 = v24;
    v56 = v39 != 0;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](emptyGridCells, "enumerateKeysAndObjectsUsingBlock:", v53);
    if (objc_msgSend(v21, "count"))
    {
      v35 = v24;
      v36 = v21;
      v37 = v9;
      v38 = v7;
      v51 = 0u;
      v52 = 0u;
      v49 = 0u;
      v50 = 0u;
      obj = v21;
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v50;
        v28 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v50 != v27)
              objc_enumerationMutation(obj);
            v30 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
            -[NSMutableDictionary objectForKey:](self->_emptyGridCells, "objectForKey:", v30, v35, v36, v37, v38);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v31, "isRemoved") & 1) == 0)
            {
              objc_msgSend(v31, "cellView");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "setRemoved:", 1);
              if (v39)
              {
                v41 = (void *)MEMORY[0x1E0DC3F10];
                v47[0] = v28;
                v47[1] = 3221225472;
                v47[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_7;
                v47[3] = &unk_1E8D84C50;
                v33 = v32;
                v48 = v33;
                v42[0] = v28;
                v42[1] = 3221225472;
                v42[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_8;
                v42[3] = &unk_1E8D896B8;
                v43 = v31;
                v44 = self;
                v45 = v30;
                v46 = v33;
                objc_msgSend(v41, "animateWithDuration:animations:completion:", v47, v42, 0.2);

              }
              else
              {
                objc_msgSend(v32, "removeFromSuperview");
                -[NSMutableDictionary removeObjectForKey:](self->_emptyGridCells, "removeObjectForKey:", v30);
              }

            }
          }
          v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v67, 16);
        }
        while (v26);
      }

      v9 = v37;
      v7 = v38;
      v24 = v35;
      v21 = v36;
    }
    if (!-[NSMutableDictionary count](self->_emptyGridCells, "count", v35, v36, v37, v38))
    {
      v34 = self->_emptyGridCells;
      self->_emptyGridCells = 0;

    }
  }

}

void __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  SBIconListViewEmptyCell *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v5);

  v6 = SBIconCoordinateMakeWithGridCellIndex(a2, *(_DWORD *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 40), "rectForDefaultSizedCellAtCoordinate:metrics:", v6, v7, *(_QWORD *)(a1 + 48));
  UIRectGetCenter();
  v9 = v8;
  v11 = v10;
  v12 = *(void **)(*(_QWORD *)(a1 + 40) + 504);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (SBIconListViewEmptyCell *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "makeEmptyGridCellView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v18;
    if (v18)
    {
      v19 = (void *)MEMORY[0x1E0DC3F10];
      v20 = MEMORY[0x1E0C809B0];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_3;
      v29[3] = &unk_1E8D88798;
      v15 = v18;
      v30 = v15;
      v31 = *(_OWORD *)(a1 + 56);
      v32 = *(_OWORD *)(a1 + 72);
      v33 = v9;
      v34 = v11;
      objc_msgSend(v19, "performWithoutAnimation:", v29);
      objc_msgSend(*(id *)(a1 + 40), "insertSubview:atIndex:", v15, 0);
      v14 = -[SBIconListViewEmptyCell initWithCellView:]([SBIconListViewEmptyCell alloc], "initWithCellView:", v15);
      v21 = *(void **)(*(_QWORD *)(a1 + 40) + 504);
      if (!v21)
      {
        v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v23 = *(_QWORD *)(a1 + 40);
        v24 = *(void **)(v23 + 504);
        *(_QWORD *)(v23 + 504) = v22;

        v21 = *(void **)(*(_QWORD *)(a1 + 40) + 504);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKey:", v14, v25);

      if (*(_BYTE *)(a1 + 92))
      {
        objc_msgSend(v15, "setAlpha:", 0.0);
        v26 = (void *)MEMORY[0x1E0DC3F10];
        v27[0] = v20;
        v27[1] = 3221225472;
        v27[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_4;
        v27[3] = &unk_1E8D84C50;
        v28 = v15;
        objc_msgSend(v26, "animateWithDuration:animations:", v27, 0.2);

      }
      else
      {
        objc_msgSend(v15, "setAlpha:", 1.0);
      }
      v17 = v30;
      goto LABEL_14;
    }
    v14 = 0;
LABEL_15:

    goto LABEL_16;
  }
  if (-[SBIconListViewEmptyCell isRemoved](v14, "isRemoved"))
  {
    -[SBIconListViewEmptyCell cellView](v14, "cellView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[SBIconListViewEmptyCell setRemoved:](v14, "setRemoved:", 0);
    if (*(_BYTE *)(a1 + 92))
    {
      v16 = (void *)MEMORY[0x1E0DC3F10];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_2;
      v35[3] = &unk_1E8D84C50;
      v15 = v15;
      v36 = v15;
      objc_msgSend(v16, "animateWithDuration:animations:", v35, 0.2);
      v17 = v36;
LABEL_14:

      goto LABEL_15;
    }
    objc_msgSend(v15, "setAlpha:", 1.0);
    goto LABEL_15;
  }
LABEL_16:

}

uint64_t __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_setContinuousCornerRadius:", *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 72), *(double *)(a1 + 80));
}

uint64_t __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

void __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  double v17;
  double v18;

  v5 = a2;
  objc_msgSend(a3, "cellView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "unsignedIntegerValue");

  v8 = SBIconCoordinateMakeWithGridCellIndex(v7, *(_DWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "rectForDefaultSizedCellAtCoordinate:metrics:", v8, v9, *(_QWORD *)(a1 + 40));
  UIRectGetCenter();
  v12 = v10;
  v13 = v11;
  if (*(_BYTE *)(a1 + 52))
  {
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_6;
    v15[3] = &unk_1E8D886D8;
    v16 = v6;
    v17 = v12;
    v18 = v13;
    objc_msgSend(v14, "animateWithDuration:animations:", v15, 0.2);

  }
  else
  {
    objc_msgSend(v6, "setCenter:", v10, v11);
  }

}

uint64_t __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

void __56__SBIconListView_layOutEmptyGridCellViewsUsingAnimator___block_invoke_8(uint64_t a1, int a2)
{
  void *v3;
  void *v4;

  if (a2 && objc_msgSend(*(id *)(a1 + 32), "isRemoved"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 504), "objectForKey:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);

    if (v3 == v4)
    {
      objc_msgSend(*(id *)(a1 + 56), "removeFromSuperview");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 504), "removeObjectForKey:", *(_QWORD *)(a1 + 48));
    }
  }
}

- (id)makeEmptyGridCellView
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  return v2;
}

- (void)performDefaultAnimatedRemovalForIconViews:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v11 = v6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__SBIconListView_performDefaultAnimatedRemovalForIconViews_completionHandler___block_invoke;
  v12[3] = &unk_1E8D84C50;
  v13 = v5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__SBIconListView_performDefaultAnimatedRemovalForIconViews_completionHandler___block_invoke_2;
  v10[3] = &unk_1E8D86600;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 0, v12, v10, 0.3, 0.0);

}

void __78__SBIconListView_performDefaultAnimatedRemovalForIconViews_completionHandler___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "setAlpha:", 0.0, (_QWORD)v6);
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

uint64_t __78__SBIconListView_performDefaultAnimatedRemovalForIconViews_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)iconsNeedLayout
{
  return self->_needsLayout;
}

- (id)iconAtCoordinate:(SBIconCoordinate)a3
{
  int64_t row;
  int64_t column;
  void *v6;
  void *v7;

  row = a3.row;
  column = a3.column;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView iconAtCoordinate:metrics:](self, "iconAtCoordinate:metrics:", column, row, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)iconIndexForCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row;
  int64_t column;
  id v7;
  unint64_t v8;

  row = a3.row;
  column = a3.column;
  v7 = a4;
  v8 = -[SBIconListView iconIndexForGridCellIndex:metrics:](self, "iconIndexForGridCellIndex:metrics:", -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v7), v7);

  return v8;
}

- (id)iconAtPoint:(CGPoint)a3 index:(unint64_t *)a4
{
  double y;
  double x;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  CGPoint v16;
  CGRect v17;

  y = a3.y;
  x = a3.x;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView bounds](self, "bounds");
  v16.x = x;
  v16.y = y;
  if (CGRectContainsPoint(v17, v16) || objc_msgSend(v8, "columnOffset"))
  {
    v9 = -[SBIconListView coordinateAtPoint:metrics:](self, "coordinateAtPoint:metrics:", v8, x, y);
    v11 = -[SBIconListView indexForCoordinate:forOrientation:metrics:](self, "indexForCoordinate:forOrientation:metrics:", v9, v10, -[SBIconListView layoutOrientation](self, "layoutOrientation"), v8);
    v12 = v11;
    if (a4)
      *a4 = v11;
    -[SBIconListView displayedModel](self, "displayedModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 >= objc_msgSend(v13, "numberOfIcons"))
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v13, "iconAtIndex:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)dragHitRegionForPoint:(CGPoint)a3 icon:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  unint64_t v9;
  CGRect v11[6];
  CGPoint v12;
  CGPoint v13;
  CGPoint v14;
  CGPoint v15;
  CGPoint v16;
  CGPoint v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (!v7)
  {
    -[SBIconListView iconAtPoint:index:](self, "iconAtPoint:index:", 0, x, y);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
      return 0;
  }
  -[SBIconListView iconViewForIcon:](self, "iconViewForIcon:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v11, 0, sizeof(v11));
  -[SBIconListView _getDragRegionRects:forIconView:](self, "_getDragRegionRects:forIconView:", v11, v8);
  v12.x = x;
  v12.y = y;
  v9 = CGRectContainsPoint(v11[0], v12);
  v13.x = x;
  v13.y = y;
  if (CGRectContainsPoint(v11[1], v13))
    v9 |= 2uLL;
  v14.x = x;
  v14.y = y;
  if (CGRectContainsPoint(v11[2], v14))
    v9 |= 0x10uLL;
  v15.x = x;
  v15.y = y;
  if (CGRectContainsPoint(v11[3], v15))
    v9 |= 0x20uLL;
  v16.x = x;
  v16.y = y;
  if (CGRectContainsPoint(v11[4], v16))
    v9 |= 4uLL;
  v17.x = x;
  v17.y = y;
  if (CGRectContainsPoint(v11[5], v17))
    v9 |= 8uLL;

  return v9;
}

- (void)_getDragRegionRects:(SBIconListViewCellDragRegionRects *)a3 forIconView:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  id v20;

  v6 = a4;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconImageFrame");
  -[SBIconListView convertRect:fromView:](self, "convertRect:fromView:", v6);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = -[SBIconListView coordinateForIcon:](self, "coordinateForIcon:", v7);
  v18 = v17;
  if ((objc_msgSend(v7, "isFolderIcon") & 1) != 0)
  {
    v19 = 0.833333333;
  }
  else if (objc_msgSend(v7, "isWidgetIcon"))
  {
    v19 = 0.7;
  }
  else
  {
    v19 = 0.666666667;
  }
  -[SBIconListView _getDragRegionRects:forIconCoordinate:iconImageFrame:overlapWindowFraction:metrics:options:](self, "_getDragRegionRects:forIconCoordinate:iconImageFrame:overlapWindowFraction:metrics:options:", a3, v16, v18, v20, 0, v9, v11, v13, v15, v19);

}

- (void)_getDragRegionRects:(SBIconListViewCellDragRegionRects *)a3 forIconCoordinate:(SBIconCoordinate)a4 iconImageFrame:(CGRect)a5 overlapWindowFraction:(double)a6 metrics:(id)a7 options:(unint64_t)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double MinX;
  double MaxX;
  double MinY;
  double MaxY;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double v32;
  CGFloat amount;
  CGFloat v34;
  CGFloat v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect slice;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect remainder;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  -[SBIconListView fullRectForCellAtIconCoordinate:metrics:options:](self, "fullRectForCellAtIconCoordinate:metrics:options:", a4.column, a4.row, a7, a8);
  v30 = v14;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = 1.0 - a6;
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  v34 = v21 * CGRectGetWidth(v45) * 0.5;
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v32 = v21 * CGRectGetHeight(v46) * 0.5;
  a3->var0.origin.x = x;
  a3->var0.origin.y = y;
  v47.size.width = width;
  a3->var0.size.width = width;
  a3->var0.size.height = height;
  v47.size.height = height;
  v47.origin.x = x;
  v47.origin.y = y;
  v22 = y;
  v23 = v47.size.width;
  v29 = v47.size.width;
  MinX = CGRectGetMinX(v47);
  v48.origin.x = v30;
  v48.origin.y = v16;
  v48.size.width = v18;
  v48.size.height = v20;
  amount = v34 + MinX - CGRectGetMinX(v48);
  memset(&remainder, 0, sizeof(remainder));
  v49.origin.x = v30;
  v49.origin.y = v16;
  v49.size.width = v18;
  v49.size.height = v20;
  CGRectDivide(v49, &a3->var2, &remainder, amount, CGRectMinXEdge);
  v50.origin.x = v30;
  v50.origin.y = v16;
  v50.size.width = v18;
  v50.size.height = v20;
  MaxX = CGRectGetMaxX(v50);
  v51.origin.x = x;
  v51.origin.y = v22;
  v51.size.width = v23;
  v51.size.height = height;
  v35 = v34 + MaxX - CGRectGetMaxX(v51);
  memset(&v43, 0, sizeof(v43));
  v52.origin.x = v30;
  v52.origin.y = v16;
  v52.size.width = v18;
  v52.size.height = v20;
  CGRectDivide(v52, &a3->var3, &v43, v35, CGRectMaxXEdge);
  v53.origin.x = x;
  v53.origin.y = v22;
  v53.size.width = v29;
  v53.size.height = height;
  MinY = CGRectGetMinY(v53);
  v54.origin.x = v30;
  v54.origin.y = v16;
  v54.size.width = v18;
  v54.size.height = v20;
  v31 = v32 + MinY - CGRectGetMinY(v54);
  memset(&v42, 0, sizeof(v42));
  v55.origin.x = v30;
  v55.origin.y = v16;
  v55.size.width = v18;
  v55.size.height = v20;
  CGRectDivide(v55, &a3->var4, &v42, v31, CGRectMinYEdge);
  v56.origin.x = v30;
  v56.origin.y = v16;
  v56.size.width = v18;
  v56.size.height = v20;
  MaxY = CGRectGetMaxY(v56);
  v57.origin.y = v22;
  v57.origin.x = x;
  v57.size.width = v29;
  v57.size.height = height;
  v28 = v32 + MaxY - CGRectGetMaxY(v57);
  memset(&v41, 0, sizeof(v41));
  v58.origin.x = v30;
  v58.origin.y = v16;
  v58.size.width = v18;
  v58.size.height = v20;
  CGRectDivide(v58, &a3->var5, &v41, v28, CGRectMaxYEdge);
  v40.origin.x = v30;
  v40.origin.y = v16;
  v40.size.width = v18;
  v40.size.height = v20;
  memset(&slice, 0, sizeof(slice));
  v59.origin.x = v30;
  v59.origin.y = v16;
  v59.size.width = v18;
  v59.size.height = v20;
  CGRectDivide(v59, &slice, &v40, amount, CGRectMinXEdge);
  memset(&v38, 0, sizeof(v38));
  CGRectDivide(v40, &v38, &v40, v35, CGRectMaxXEdge);
  memset(&v37, 0, sizeof(v37));
  CGRectDivide(v40, &v37, &v40, v31, CGRectMinYEdge);
  memset(&v36, 0, sizeof(v36));
  CGRectDivide(v40, &v36, &a3->var1, v28, CGRectMaxYEdge);
}

- (CGRect)rectForDragHitRegion:(unint64_t)a3 forDefaultSizedCellAtCoordinate:(SBIconCoordinate)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SBIconListView rectForDragHitRegion:forCellAtCoordinate:options:](self, "rectForDragHitRegion:forCellAtCoordinate:options:", a3, a4.column, a4.row, 1);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)rectForDragHitRegion:(unint64_t)a3 forIconAtCoordinate:(SBIconCoordinate)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  -[SBIconListView rectForDragHitRegion:forCellAtCoordinate:options:](self, "rectForDragHitRegion:forCellAtCoordinate:options:", a3, a4.column, a4.row, 0);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)rectForDragHitRegion:(unint64_t)a3 forCellAtCoordinate:(SBIconCoordinate)a4 options:(unint64_t)a5
{
  int64_t row;
  int64_t column;
  void *v10;
  uint8x8_t v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  CGRect v40;
  CGRect result;

  row = a4.row;
  column = a4.column;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView rectForCellAtIconCoordinate:metrics:options:](self, "rectForCellAtIconCoordinate:metrics:options:", column, row, v10, a5);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[SBIconListView _getDragRegionRects:forIconCoordinate:iconImageFrame:overlapWindowFraction:metrics:options:](self, "_getDragRegionRects:forIconCoordinate:iconImageFrame:overlapWindowFraction:metrics:options:", &v28, column, row, v10, a5);
  v11 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
  v11.i16[0] = vaddlv_u8(v11);
  if (v11.i32[0] < 3u)
  {
    if ((~(_BYTE)a3 & 0x14) != 0)
    {
      if ((~(_BYTE)a3 & 0x24) != 0)
      {
        if ((~(_BYTE)a3 & 3) != 0)
        {
          if ((a3 & 4) != 0)
          {
            y = *((double *)&v36 + 1);
            x = *(double *)&v36;
            height = *((double *)&v37 + 1);
            width = *(double *)&v37;
            goto LABEL_10;
          }
          if ((a3 & 0x20) != 0)
          {
            y = *((double *)&v34 + 1);
            x = *(double *)&v34;
            height = *((double *)&v35 + 1);
            width = *(double *)&v35;
            goto LABEL_10;
          }
          if ((a3 & 8) != 0)
          {
            y = *((double *)&v38 + 1);
            x = *(double *)&v38;
            height = *((double *)&v39 + 1);
            width = *(double *)&v39;
            goto LABEL_10;
          }
          if ((a3 & 0x10) != 0)
          {
            y = *((double *)&v32 + 1);
            x = *(double *)&v32;
            height = *((double *)&v33 + 1);
            width = *(double *)&v33;
            goto LABEL_10;
          }
          if ((a3 & 2) != 0)
          {
            y = *((double *)&v30 + 1);
            x = *(double *)&v30;
            height = *((double *)&v31 + 1);
            width = *(double *)&v31;
            goto LABEL_10;
          }
          if ((a3 & 1) != 0)
          {
            y = *((double *)&v28 + 1);
            x = *(double *)&v28;
            height = *((double *)&v29 + 1);
            width = *(double *)&v29;
            goto LABEL_10;
          }
          goto LABEL_2;
        }
        v17 = *((_QWORD *)&v28 + 1);
        v16 = v28;
        v19 = *((_QWORD *)&v29 + 1);
        v18 = v29;
        v21 = *((_QWORD *)&v30 + 1);
        v20 = v30;
        v23 = *((_QWORD *)&v31 + 1);
        v22 = v31;
      }
      else
      {
        v17 = *((_QWORD *)&v36 + 1);
        v16 = v36;
        v19 = *((_QWORD *)&v37 + 1);
        v18 = v37;
        v21 = *((_QWORD *)&v34 + 1);
        v20 = v34;
        v23 = *((_QWORD *)&v35 + 1);
        v22 = v35;
      }
    }
    else
    {
      v17 = *((_QWORD *)&v36 + 1);
      v16 = v36;
      v19 = *((_QWORD *)&v37 + 1);
      v18 = v37;
      v21 = *((_QWORD *)&v32 + 1);
      v20 = v32;
      v23 = *((_QWORD *)&v33 + 1);
      v22 = v33;
    }
    v40 = CGRectIntersection(*(CGRect *)&v16, *(CGRect *)&v20);
    x = v40.origin.x;
    y = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;
    goto LABEL_10;
  }
LABEL_2:
  x = *MEMORY[0x1E0C9D628];
  y = *(double *)(MEMORY[0x1E0C9D628] + 8);
  width = *(double *)(MEMORY[0x1E0C9D628] + 16);
  height = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_10:

  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (BOOL)isShowingAllIcons
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger location;
  NSUInteger length;

  v3 = -[SBIconListView _allIconsVisibleColumnOrRowRange](self, "_allIconsVisibleColumnOrRowRange");
  location = self->_visibleColumnRange.location;
  length = self->_visibleColumnRange.length;
  if (location != v3 || length != v4)
    return 0;
  return self->_visibleRowRange.location == location && self->_visibleRowRange.length == length;
}

- (void)setVisibleColumnRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  SBIconListPredictedVisibleColumn *p_predictedVisibleColumn;
  uint64_t v7;
  uint64_t v8;

  length = a3.length;
  location = a3.location;
  p_predictedVisibleColumn = &self->_predictedVisibleColumn;
  v7 = -[SBIconListView _allIconsVisibleColumnOrRowRange](self, "_allIconsVisibleColumnOrRowRange");
  -[SBIconListView setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:](self, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", location, length, p_predictedVisibleColumn->column, *(_QWORD *)&p_predictedVisibleColumn->confidence, v7, v8, self->_predictedVisibleRow.row, *(_QWORD *)&self->_predictedVisibleRow.confidence);
}

- (void)setVisibleColumnRange:(_NSRange)a3 predictedVisibleColumn:(SBIconListPredictedVisibleColumn)a4
{
  double confidence;
  unint64_t column;
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;

  confidence = a4.confidence;
  column = a4.column;
  length = a3.length;
  location = a3.location;
  v9 = -[SBIconListView _allIconsVisibleColumnOrRowRange](self, "_allIconsVisibleColumnOrRowRange");
  -[SBIconListView setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:](self, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", location, length, column, *(_QWORD *)&confidence, v9, v10, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)setVisibleRowRange:(_NSRange)a3 predictedVisibleRow:(SBIconListPredictedVisibleRow)a4
{
  double confidence;
  unint64_t row;
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;

  confidence = a4.confidence;
  row = a4.row;
  length = a3.length;
  location = a3.location;
  v9 = -[SBIconListView _allIconsVisibleColumnOrRowRange](self, "_allIconsVisibleColumnOrRowRange");
  -[SBIconListView setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:](self, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", v9, v10, 0x7FFFFFFFFFFFFFFFLL, 0, location, length, row, *(_QWORD *)&confidence);
}

- (void)setVisibleRowRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  uint64_t v7;

  length = a3.length;
  location = a3.location;
  v6 = -[SBIconListView _allIconsVisibleColumnOrRowRange](self, "_allIconsVisibleColumnOrRowRange");
  -[SBIconListView setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:](self, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", v6, v7, self->_predictedVisibleColumn.column, *(_QWORD *)&self->_predictedVisibleColumn.confidence, location, length, self->_predictedVisibleRow.row, *(_QWORD *)&self->_predictedVisibleRow.confidence);
}

- (void)setPredictedVisibleRow:(SBIconListPredictedVisibleRow)a3
{
  -[SBIconListView setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:](self, "setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:", self->_visibleColumnRange.location, self->_visibleColumnRange.length, self->_predictedVisibleColumn.column, *(_QWORD *)&self->_predictedVisibleColumn.confidence, self->_visibleRowRange.location, self->_visibleRowRange.length, a3.row, *(_QWORD *)&a3.confidence);
}

- (SBHIconGridRange)visibleGridRange
{
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned __int16 v6;
  unsigned int v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  SBHIconGridRange result;

  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gridCellInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "gridSize");
  v6 = v5;
  v7 = HIWORD(v5);
  v8 = objc_msgSend(v4, "usedGridSize");
  v9 = -[SBIconListView visibleColumnRange](self, "visibleColumnRange");
  v11 = v10;
  v12 = -[SBIconListView visibleRowRange](self, "visibleRowRange");
  v14 = (unsigned __int16)v8;
  if (v11 >= (unsigned __int16)v8)
    v15 = (unsigned __int16)v8;
  else
    v15 = v11;
  if (v7 >= HIWORD(v8))
    v16 = HIWORD(v8);
  else
    v16 = v7;
  v17 = v15 | (v16 << 16);
  if (v7 < (unsigned __int16)v8)
    v14 = v7;
  if (v13 >= HIWORD(v8))
    v18 = HIWORD(v8);
  else
    v18 = v13;
  v19 = SBHIconGridRangeIntersection(v9, v17, v12 * v6, v14 | (v18 << 16), v6);
  v21 = v20;

  v22 = v19;
  v23 = v21;
  result.size = (SBHIconGridSize)v23;
  result.cellIndex = v22;
  return result;
}

- (NSIndexSet)visibleGridCellIndexes
{
  void *v3;
  void *v4;

  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView visibleGridCellIndexesWithMetrics:](self, "visibleGridCellIndexesWithMetrics:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v4;
}

- (id)requireAllIconsShownForReason:(id)a3
{
  id v4;
  SBIconListViewIconVisibilityAssertion *v5;
  NSHashTable *iconVisibilityAssertions;
  NSHashTable *v7;
  NSHashTable *v8;

  v4 = a3;
  v5 = -[SBIconListViewIconVisibilityAssertion initWithListView:reason:]([SBIconListViewIconVisibilityAssertion alloc], "initWithListView:reason:", self, v4);

  iconVisibilityAssertions = self->_iconVisibilityAssertions;
  if (!iconVisibilityAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_iconVisibilityAssertions;
    self->_iconVisibilityAssertions = v7;

    iconVisibilityAssertions = self->_iconVisibilityAssertions;
  }
  -[NSHashTable addObject:](iconVisibilityAssertions, "addObject:", v5);
  -[SBIconListView showAllIcons](self, "showAllIcons");
  return v5;
}

- (void)removeShowAllIconsAssertion:(id)a3
{
  NSHashTable *iconVisibilityAssertions;

  -[NSHashTable removeObject:](self->_iconVisibilityAssertions, "removeObject:", a3);
  if (!-[NSHashTable count](self->_iconVisibilityAssertions, "count"))
  {
    iconVisibilityAssertions = self->_iconVisibilityAssertions;
    self->_iconVisibilityAssertions = 0;

  }
}

- (id)iconVisibilityInfoForRect:(CGRect)a3 normalized:(BOOL)a4
{
  _BOOL8 v4;
  SBIconListViewIconVisibilityInfo *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double MinX;
  double v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v4 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(SBIconListViewIconVisibilityInfo);
  -[SBIconListViewIconVisibilityInfo setNormalized:](v6, "setNormalized:", v4);
  -[SBIconListView icons](self, "icons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        -[SBIconListView rectForIcon:](self, "rectForIcon:", v12);
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v20 = v19;
        v46.origin.x = v13;
        v46.origin.y = v15;
        v46.size.width = v17;
        v46.size.height = v19;
        v41 = CGRectIntersection(a3, v46);
        x = v41.origin.x;
        y = v41.origin.y;
        width = v41.size.width;
        height = v41.size.height;
        if (!CGRectIsNull(v41))
        {
          v42.origin.x = x;
          v42.origin.y = y;
          v42.size.width = width;
          v42.size.height = height;
          MinX = CGRectGetMinX(v42);
          v43.origin.x = v14;
          v43.origin.y = v16;
          v43.size.width = v18;
          v43.size.height = v20;
          v33 = MinX - CGRectGetMinX(v43);
          v44.origin.x = x;
          v44.origin.y = y;
          v44.size.width = width;
          v44.size.height = height;
          MinY = CGRectGetMinY(v44);
          v45.origin.x = v14;
          v45.origin.y = v16;
          v45.size.width = v18;
          v45.size.height = v20;
          v26 = MinY - CGRectGetMinY(v45);
          if (v4)
          {
            v27 = SBHNormalizedRectFromSubRect(v14, v16, v18, v20, v33, v26, width, height);
            v26 = v28;
            width = v29;
            height = v30;
          }
          else
          {
            v27 = v33;
          }
          -[SBIconListViewIconVisibilityInfo setVisibleRect:forIcon:](v6, "setVisibleRect:forIcon:", v12, v27, v26, width, height);
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)enumerateVisibleIconsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SBIconListView visibleIcons](self, "visibleIcons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SBIconListView_enumerateVisibleIconsUsingBlock___block_invoke;
  v7[3] = &unk_1E8D89700;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __50__SBIconListView_enumerateVisibleIconsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateKnownIconViewsUsingBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  NSMutableSet *draggingIconViews;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__SBIconListView_enumerateKnownIconViewsUsingBlock___block_invoke;
  v11[3] = &unk_1E8D86D10;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  -[SBIconListView enumerateIconViewsUsingBlock:](self, "enumerateIconViewsUsingBlock:", v11);
  if (!*((_BYTE *)v15 + 24))
  {
    draggingIconViews = self->_draggingIconViews;
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __52__SBIconListView_enumerateKnownIconViewsUsingBlock___block_invoke_2;
    v8[3] = &unk_1E8D86D60;
    v9 = v6;
    v10 = &v14;
    -[NSMutableSet enumerateObjectsUsingBlock:](draggingIconViews, "enumerateObjectsUsingBlock:", v8);

  }
  _Block_object_dispose(&v14, 8);

}

uint64_t __52__SBIconListView_enumerateKnownIconViewsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v7;

  v7 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t __52__SBIconListView_enumerateKnownIconViewsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;
  char v6;

  v6 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isDock
{
  return 0;
}

- (void)setIconsLabelAlpha:(double)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__SBIconListView_setIconsLabelAlpha___block_invoke;
  v3[3] = &__block_descriptor_40_e27_v32__0__SBIconView_8Q16_B24l;
  *(double *)&v3[4] = a3;
  -[SBIconListView enumerateIconViewsUsingBlock:](self, "enumerateIconViewsUsingBlock:", v3);
}

uint64_t __37__SBIconListView_setIconsLabelAlpha___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIconLabelAlpha:", *(double *)(a1 + 32));
}

- (void)setIconContentScale:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_iconContentScale = a3;
    -[SBIconListView layoutIconsNow](self, "layoutIconsNow");
  }
}

- (void)addDragObserver:(id)a3 forDropSession:(id)a4
{
  -[SBIconListViewDraggingDestinationDelegate addDragObserver:forDropSession:](self->_draggingDelegate, "addDragObserver:forDropSession:", a3, a4);
}

- (void)setAllowsReordering:(BOOL)a3
{
  SBIconListViewReorderingManager *v4;
  SBIconListViewReorderingManager *reorderingManager;
  SBIconListViewReorderingManager *v6;

  if (self->_allowsReordering != a3)
  {
    self->_allowsReordering = a3;
    if (a3)
    {
      v4 = -[SBIconListViewReorderingManager initWithIconListView:]([SBIconListViewReorderingManager alloc], "initWithIconListView:", self);
      reorderingManager = self->_reorderingManager;
      self->_reorderingManager = v4;

    }
    else
    {
      -[SBIconListViewReorderingManager invalidate](self->_reorderingManager, "invalidate");
      v6 = self->_reorderingManager;
      self->_reorderingManager = 0;

    }
  }
}

- (NSString)iconDragTypeIdentifier
{
  NSString *v3;

  if (-[SBIconListView allowsReordering](self, "allowsReordering"))
  {
    -[SBIconListViewReorderingManager uniqueDragTypeIdentifier](self->_reorderingManager, "uniqueDragTypeIdentifier");
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_iconDragTypeIdentifier;
  }
  return v3;
}

- (void)setOccluded:(BOOL)a3
{
  -[SBIconListView setContentVisibility:](self, "setContentVisibility:", a3);
}

- (id)layoutMetricsForOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  _OWORD v7[13];

  memset(v7, 0, sizeof(v7));
  -[SBIconListView getLayoutMetricsParameters:orientation:](self, "getLayoutMetricsParameters:orientation:", v7, a3);
  -[SBIconListView displayedModel](self, "displayedModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "layoutMetricsForParameters:listModel:", v7, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)layoutMetricsForModel:(id)a3
{
  id v4;
  void *v5;
  _OWORD v7[13];

  memset(v7, 0, sizeof(v7));
  v4 = a3;
  -[SBIconListView getLayoutMetricsParameters:](self, "getLayoutMetricsParameters:", v7);
  objc_msgSend((id)objc_opt_class(), "layoutMetricsForParameters:listModel:", v7, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setAutomaticallyAdjustsLayoutMetricsToFit:(BOOL)a3
{
  if (self->_automaticallyAdjustsLayoutMetricsToFit != a3)
  {
    self->_automaticallyAdjustsLayoutMetricsToFit = a3;
    -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
  }
}

- (double)horizontalIconPadding
{
  void *v2;
  double v3;
  double v4;

  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconSpacing");
  v4 = v3;

  return v4;
}

- (double)verticalIconPadding
{
  void *v2;
  double v3;
  double v4;

  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconSpacing");
  v4 = v3;

  return v4;
}

- (CGPoint)_alignedIconPointForPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  double v6;
  double v7;
  double v8;
  double v9;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  if (-[SBIconListView alignsIconsOnPixelBoundaries](self, "alignsIconsOnPixelBoundaries"))
  {
    -[SBIconListView layoutScale](self, "layoutScale");
    SBFFloatFloorForScale();
    x = v6;
    SBFFloatFloorForScale();
    y = v7;
  }
  v8 = x;
  v9 = y;
  result.y = v9;
  result.x = v8;
  return result;
}

- (CGPoint)originForIconAtCoordinate:(SBIconCoordinate)a3
{
  int64_t row;
  int64_t column;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint result;

  row = a3.row;
  column = a3.column;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView originForIconAtCoordinate:metrics:](self, "originForIconAtCoordinate:metrics:", column, row, v6);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGRect)rectForDefaultSizedCellsOfSize:(SBHIconGridSize)a3 startingAtCoordinate:(SBIconCoordinate)a4 metrics:(id)a5
{
  int64_t row;
  int64_t column;
  id v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  int64_t v15;
  uint64_t columns;
  double v17;
  CGFloat x;
  double v19;
  CGFloat y;
  double v21;
  CGFloat width;
  double v23;
  CGFloat height;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;
  CGRect v33;

  row = a4.row;
  column = a4.column;
  v9 = a5;
  v10 = *MEMORY[0x1E0C9D628];
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (a3.rows)
  {
    v14 = 0;
    do
    {
      if (a3.columns)
      {
        v15 = column;
        columns = a3.columns;
        do
        {
          -[SBIconListView rectForDefaultSizedCellAtCoordinate:metrics:](self, "rectForDefaultSizedCellAtCoordinate:metrics:", v15, v14 + row, v9);
          x = v17;
          y = v19;
          width = v21;
          height = v23;
          v29.origin.x = v10;
          v29.origin.y = v11;
          v29.size.width = v12;
          v29.size.height = v13;
          if (!CGRectIsNull(v29))
          {
            v30.origin.x = v10;
            v30.origin.y = v11;
            v30.size.width = v12;
            v30.size.height = v13;
            v33.origin.x = x;
            v33.origin.y = y;
            v33.size.width = width;
            v33.size.height = height;
            v31 = CGRectUnion(v30, v33);
            x = v31.origin.x;
            y = v31.origin.y;
            width = v31.size.width;
            height = v31.size.height;
          }
          ++v15;
          v10 = x;
          v11 = y;
          v12 = width;
          v13 = height;
          --columns;
        }
        while (columns);
      }
      else
      {
        height = v13;
        width = v12;
        y = v11;
        x = v10;
      }
      ++v14;
      v10 = x;
      v11 = y;
      v12 = width;
      v13 = height;
    }
    while (v14 != a3.rows);
  }
  else
  {
    height = *(double *)(MEMORY[0x1E0C9D628] + 24);
    width = *(double *)(MEMORY[0x1E0C9D628] + 16);
    y = *(double *)(MEMORY[0x1E0C9D628] + 8);
    x = *MEMORY[0x1E0C9D628];
  }

  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (CGRect)rectForDefaultSizedCellsOfSizeClass:(id)a3 startingAtCoordinate:(SBIconCoordinate)a4 metrics:(id)a5
{
  int64_t row;
  int64_t column;
  id v9;
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
  double v21;
  CGRect result;

  row = a4.row;
  column = a4.column;
  v9 = a5;
  -[SBIconListView rectForDefaultSizedCellsOfSize:startingAtCoordinate:metrics:](self, "rectForDefaultSizedCellsOfSize:startingAtCoordinate:metrics:", -[SBIconListView iconGridSizeForClass:](self, "iconGridSizeForClass:", a3), column, row, v9);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (CGRect)fullRectForDefaultSizedCellAtCoordinate:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row;
  int64_t column;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  uint64_t v40;
  uint64_t v41;
  double v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect result;

  row = a3.row;
  column = a3.column;
  v7 = a4;
  if (column != 0x7FFFFFFFFFFFFFFFLL && column && row != 0x7FFFFFFFFFFFFFFFLL && row)
  {
    -[SBIconListView layout](self, "layout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "iconImageInfo");
    v42 = v17;
    v19 = v18;
    objc_msgSend(v7, "iconInsets");
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    objc_msgSend(v7, "iconSpacing");
    v29 = v28;
    v31 = v30;
    -[SBIconListView bounds](self, "bounds");
    v43.origin.x = v23 + v32;
    v43.origin.y = v21 + v33;
    v43.size.width = v34 - (v23 + v27);
    v43.size.height = v35 - (v21 + v25);
    v44 = CGRectInset(v43, v29 * -0.5, v31 * -0.5);
    x = v44.origin.x;
    y = v44.origin.y;
    width = v44.size.width;
    height = v44.size.height;
    v40 = objc_msgSend(v7, "columnsUsedForLayout");
    v10 = v19 + v31;
    v11 = v42 + v29;
    if (-[SBIconListView isRTL](self, "isRTL"))
      v41 = v40 - column;
    else
      v41 = column - 1;
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    v8 = CGRectGetMinX(v45) + (double)v41 * v11;
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    v9 = CGRectGetMinY(v46) + (double)(row - 1) * v10;

  }
  else
  {
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v12 = v8;
  v13 = v9;
  v14 = v11;
  v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)getIconStartGridCellIndex:(unint64_t *)a3 gridSize:(SBHIconGridSize *)a4 forGridCellIndex:(unint64_t)a5 metrics:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  unint64_t v16;
  uint64_t v17;

  v10 = a6;
  -[SBIconListView displayedModel](self, "displayedModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = 0;
  objc_msgSend(v10, "gridCellInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v11, "getIconGridRange:forGridCellIndex:gridCellInfo:", &v16, a5, v12);
  if (a3 && v13)
    *a3 = v16;
  v14 = v13 ^ 1;
  if (!a4)
    v14 = 1;
  if ((v14 & 1) == 0)
    *a4 = (SBHIconGridSize)v17;

  return v13;
}

- (BOOL)getIconGridRange:(SBHIconGridRange *)a3 forGridCellIndex:(unint64_t)a4 metrics:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  -[SBIconListView displayedModel](self, "displayedModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gridCellInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = objc_msgSend(v9, "getIconGridRange:forGridCellIndex:gridCellInfo:", a3, a4, v10);
  return a4;
}

- (SBHIconGridRange)iconGridRangeForGridCellIndex:(unint64_t)a3 metrics:(id)a4 options:(unint64_t)a5
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  SBHIconGridRange result;

  if ((a5 & 1) != 0
    || (v8 = 0,
        v9 = 0,
        !-[SBIconListView getIconGridRange:forGridCellIndex:metrics:](self, "getIconGridRange:forGridCellIndex:metrics:", &v8, a3, a4)))
  {
    v8 = a3;
    LODWORD(v9) = 65537;
  }
  v6 = v8;
  v7 = v9;
  result.size = (SBHIconGridSize)v7;
  result.cellIndex = v6;
  return result;
}

- (unint64_t)bestGridCellIndexForInsertingIcon:(id)a3 atCoordinate:(SBIconCoordinate)a4
{
  int64_t row;
  int64_t column;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;

  row = a4.row;
  column = a4.column;
  v7 = a3;
  -[SBIconListView displayedModel](self, "displayedModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBIconListView gridCellIndexForCoordinate:metrics:](self, "gridCellIndexForCoordinate:metrics:", column, row, v9);
  objc_msgSend(v9, "gridCellInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "bestGridCellIndexForInsertingIcon:atGridCellIndex:gridCellInfo:", v7, v10, v11);

  return v12;
}

- (unint64_t)bestIndexForInsertingIcon:(id)a3 atCoordinate:(SBIconCoordinate)a4
{
  unint64_t v5;
  void *v6;
  unint64_t v7;

  v5 = -[SBIconListView bestGridCellIndexForInsertingIcon:atCoordinate:](self, "bestGridCellIndexForInsertingIcon:atCoordinate:", a3, a4.column, a4.row);
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBIconListView iconIndexForGridCellIndex:metrics:](self, "iconIndexForGridCellIndex:metrics:", v5, v6);

  return v7;
}

+ (unint64_t)gridCellInfoOptionsWithInterfaceOrientation:(int64_t)a3 reversedLayout:(BOOL)a4
{
  return objc_msgSend(a1, "gridCellInfoOptionsWithInterfaceOrientation:reversedLayout:allowGaps:", a3, a4, 0);
}

+ (unint64_t)gridCellInfoOptionsWithInterfaceOrientation:(int64_t)a3 reversedLayout:(BOOL)a4 flippedLayout:(BOOL)a5 allowGaps:(BOOL)a6
{
  unint64_t v6;

  v6 = a4;
  if (a6)
    v6 = a4 | 4;
  if ((unint64_t)(a3 - 3) < 2)
    v6 |= 2uLL;
  if (a5)
    return v6 | 0x10;
  else
    return v6;
}

- (unint64_t)gridCellInfoOptions
{
  return objc_msgSend((id)objc_opt_class(), "gridCellInfoOptionsWithInterfaceOrientation:reversedLayout:flippedLayout:allowGaps:", -[SBIconListView orientation](self, "orientation"), -[SBIconListView isLayoutReversed](self, "isLayoutReversed"), -[SBIconListView isLayoutFlipped](self, "isLayoutFlipped"), -[SBIconListView allowsGaps](self, "allowsGaps"));
}

- (id)gridCellInfo
{
  void *v2;
  void *v3;

  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gridCellInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)layoutDescription
{
  void *v2;
  void *v3;

  -[SBIconListView gridCellInfo](self, "gridCellInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isLayoutFlipped
{
  return 0;
}

- (unint64_t)columnAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  unint64_t v7;

  y = a3.y;
  x = a3.x;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBIconListView columnAtPoint:metrics:fractionOfDistanceThroughColumn:](self, "columnAtPoint:metrics:fractionOfDistanceThroughColumn:", v6, 0, x, y);

  return v7;
}

- (unint64_t)rowAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  unint64_t v7;

  y = a3.y;
  x = a3.x;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBIconListView rowAtPoint:metrics:fractionOfDistanceThroughRow:](self, "rowAtPoint:metrics:fractionOfDistanceThroughRow:", v6, 0, x, y);

  return v7;
}

- (unint64_t)rowAtPoint:(CGPoint)a3 fractionOfDistanceThroughRow:(double *)a4
{
  double y;
  double x;
  void *v8;
  unint64_t v9;

  y = a3.y;
  x = a3.x;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBIconListView rowAtPoint:metrics:fractionOfDistanceThroughRow:](self, "rowAtPoint:metrics:fractionOfDistanceThroughRow:", v8, a4, x, y);

  return v9;
}

- (unint64_t)rowAtPoint:(CGPoint)a3 metrics:(id)a4 fractionOfDistanceThroughRow:(double *)a5
{
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat width;
  CGFloat height;
  double v23;
  double v24;
  void *v25;
  void *v26;
  uint64_t v27;
  CGRect v29;
  CGRect v30;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  objc_msgSend(v9, "iconInsets");
  v11 = v10;
  objc_msgSend(v9, "iconSize");
  v13 = v12;
  objc_msgSend(v9, "iconSpacing");
  v15 = v14;
  v16 = objc_msgSend(v9, "rows");
  if (y >= v11)
    v17 = vcvtmd_u64_f64((y - v11 + v15 * 0.5) / (v13 + v15));
  else
    v17 = 0;
  if (v16 - 1 >= v17)
    v18 = v17;
  else
    v18 = v16 - 1;
  -[SBIconListView fullRectForDefaultSizedCellAtCoordinate:metrics:](self, "fullRectForDefaultSizedCellAtCoordinate:metrics:", 1, v18 + 1, v9);
  v19 = v29.origin.x;
  v20 = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  v23 = y - CGRectGetMinY(v29);
  v30.origin.x = v19;
  v30.origin.y = v20;
  v30.size.width = width;
  v30.size.height = height;
  v24 = v23 / CGRectGetHeight(v30);
  -[SBIconListView effectiveLayoutDelegateForSelector:](self, "effectiveLayoutDelegateForSelector:", sel_iconListView_rowAtPoint_metrics_proposedRow_);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v27 = objc_msgSend(v25, "iconListView:rowAtPoint:metrics:proposedRow:", self, v9, v18, x, y);
    if (v27 != v18)
      v24 = 0.0;
    v18 = v27;
  }
  if (a5)
    *a5 = v24;

  return v18;
}

- (CGPoint)fractionalCoordinateAtPoint:(CGPoint)a3
{
  double x;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
  double y;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  objc_msgSend(v6, "gridCellInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clearAllIconAndGridCellIndexes");
  -[SBIconListView displayedModel](self, "displayedModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "numberOfIcons");
  if (v9)
  {
    v10 = v9;
    for (i = 0; i != v10; ++i)
    {
      objc_msgSend(v7, "setIconIndex:forGridCellIndex:", i, i);
      objc_msgSend(v7, "setGridCellIndex:forIconIndex:", i, i);
    }
  }
  -[SBIconListView iconImageSizeForGridSizeClass:](self, "iconImageSizeForGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault"));
  -[objc_class defaultIconImageCenterForIconImageSize:](-[SBIconListView baseIconViewClass](self, "baseIconViewClass"), "defaultIconImageCenterForIconImageSize:", v12, v13);
  v15 = v14;
  v17 = v16;
  objc_msgSend(v6, "iconContentScale");
  v19 = v15 * v18;
  objc_msgSend(v6, "iconContentScale");
  v21 = v17 * v20;
  -[SBIconListView originForIconAtCoordinate:metrics:options:](self, "originForIconAtCoordinate:metrics:options:", 1, 1, v6, 1);
  v23 = v22;
  v25 = v19 + v24;
  v26 = (double)(unint64_t)objc_msgSend(v6, "rows");
  if (v26 == 1.84467441e19)
    v26 = (double)(unint64_t)objc_msgSend(v8, "numberOfUsedRows");
  v27 = v21 + v23;
  -[SBIconListView originForIconAtCoordinate:metrics:options:](self, "originForIconAtCoordinate:metrics:options:", objc_msgSend(v6, "columns"), (uint64_t)v26, v6, 1);
  v30 = v21 + v29;
  v31 = v19 + v28 - v25;
  v32 = 0.0;
  v33 = 0.0;
  if ((BSFloatIsZero() & 1) == 0)
    v33 = (x - v25) / v31;
  v34 = objc_msgSend(v6, "columns");
  if ((BSFloatIsZero() & 1) == 0)
    v32 = (y - v27) / (v30 - v27);

  v35 = v33 * (double)(unint64_t)(v34 - 1) + 1.0;
  v36 = v32 * (v26 + -1.0) + 1.0;
  result.y = v36;
  result.x = v35;
  return result;
}

- (SBIconCoordinate)coordinateAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  SBIconCoordinate result;

  y = a3.y;
  x = a3.x;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SBIconListView coordinateAtPoint:metrics:](self, "coordinateAtPoint:metrics:", v6, x, y);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.row = v11;
  result.column = v10;
  return result;
}

- (SBIconCoordinate)coordinateAtPoint:(CGPoint)a3 metrics:(id)a4
{
  double y;
  double x;
  id v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  int64_t v11;
  SBIconCoordinate result;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = -[SBIconListView columnAtPoint:metrics:fractionOfDistanceThroughColumn:](self, "columnAtPoint:metrics:fractionOfDistanceThroughColumn:", v7, 0, x, y);
  v9 = -[SBIconListView rowAtPoint:metrics:fractionOfDistanceThroughRow:](self, "rowAtPoint:metrics:fractionOfDistanceThroughRow:", v7, 0, x, y);

  v10 = v8 + 1;
  v11 = v9 + 1;
  result.row = v11;
  result.column = v10;
  return result;
}

- (SBHIconGridRange)gridRangeForRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  unsigned __int16 v8;
  double MinX;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double MaxX;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t GridCellIndex;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  SBHIconGridRange result;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (unsigned __int16)-[SBIconListView gridSizeForCurrentOrientation](self, "gridSizeForCurrentOrientation");
  v42.origin.x = x;
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  MinX = CGRectGetMinX(v42);
  v43.origin.x = x;
  v43.origin.y = y;
  v43.size.width = width;
  v43.size.height = height;
  v10 = -[SBIconListView coordinateAtPoint:](self, "coordinateAtPoint:", MinX, CGRectGetMinY(v43));
  v12 = v11;
  v44.origin.x = x;
  v44.origin.y = y;
  v44.size.width = width;
  v44.size.height = height;
  MaxX = CGRectGetMaxX(v44);
  v45.origin.x = x;
  v45.origin.y = y;
  v45.size.width = width;
  v45.size.height = height;
  v14 = -[SBIconListView coordinateAtPoint:](self, "coordinateAtPoint:", MaxX, CGRectGetMinY(v45));
  v16 = v15;
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  v17 = CGRectGetMinX(v46);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  v18 = -[SBIconListView coordinateAtPoint:](self, "coordinateAtPoint:", v17, CGRectGetMaxY(v47));
  v20 = v19;
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = width;
  v48.size.height = height;
  v21 = CGRectGetMaxX(v48);
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  v22 = -[SBIconListView coordinateAtPoint:](self, "coordinateAtPoint:", v21, CGRectGetMaxY(v49));
  v24 = v23;
  GridCellIndex = SBIconCoordinateGetGridCellIndex(v10, v12, v8);
  v26 = SBIconCoordinateGetGridCellIndex(v14, v16, v8);
  v27 = SBHIconGridRangeAddCellIndex(GridCellIndex, 65537, v26, v8);
  v29 = v28;
  v30 = SBIconCoordinateGetGridCellIndex(v14, v16, v8);
  v31 = SBHIconGridRangeAddCellIndex(v27, v29, v30, v8);
  v33 = v32;
  v34 = SBIconCoordinateGetGridCellIndex(v18, v20, v8);
  v35 = SBHIconGridRangeAddCellIndex(v31, v33, v34, v8);
  v37 = v36;
  v38 = SBIconCoordinateGetGridCellIndex(v22, v24, v8);
  v39 = SBHIconGridRangeAddCellIndex(v35, v37, v38, v8);
  result.size = (SBHIconGridSize)v40;
  result.cellIndex = v39;
  return result;
}

- (CGRect)rectForGridRange:(SBHIconGridRange)a3
{
  uint64_t v3;
  unint64_t cellIndex;
  void *v6;
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
  CGRect result;

  v3 = *(_QWORD *)&a3.size.columns;
  cellIndex = a3.cellIndex;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView fullRectForGridRange:metrics:](self, "fullRectForGridRange:metrics:", cellIndex, v3, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (SBHIconGridRange)closestGridRangeForIconOfSize:(SBHIconGridSize)a3 centeredAtPoint:(CGPoint)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  int v16;
  int v17;
  unsigned __int16 v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD v23[12];
  _QWORD v24[4];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  SBHIconGridRange result;

  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView rectForDefaultSizedCellsOfSize:startingAtCoordinate:metrics:](self, "rectForDefaultSizedCellsOfSize:startingAtCoordinate:metrics:", *(unsigned int *)&a3, 1, 1, v6);

  UIRectCenteredAboutPoint();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = -[SBIconListView gridRangeForRect:](self, "gridRangeForRect:");
  v17 = v16;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3010000000;
  v28 = &unk_1D01C8D52;
  v29 = xmmword_1D01912E0;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v24[3] = 0;
  v18 = (unsigned __int16)-[SBIconListView gridSizeForCurrentOrientation](self, "gridSizeForCurrentOrientation");
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __64__SBIconListView_closestGridRangeForIconOfSize_centeredAtPoint___block_invoke;
  v23[3] = &unk_1E8D897D0;
  v23[7] = v8;
  v23[8] = v10;
  *(double *)&v23[9] = v12;
  *(double *)&v23[10] = v14;
  *(double *)&v23[11] = v12 * v14;
  v23[4] = self;
  v23[5] = v24;
  v23[6] = &v25;
  SBHIconGridRangeEnumerateSubranges(v15, v17, *(_DWORD *)&a3, v18, 1, v23);
  v19 = v26[4];
  v20 = v26[5];
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);
  v21 = v19;
  v22 = v20;
  result.size = (SBHIconGridSize)v22;
  result.cellIndex = v21;
  return result;
}

uint64_t __64__SBIconListView_closestGridRangeForIconOfSize_centeredAtPoint___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t result;
  uint64_t v13;
  CGRect v14;
  CGRect v15;

  objc_msgSend(*(id *)(a1 + 32), "rectForGridRange:", a2, a3);
  v15.origin.x = v6;
  v15.origin.y = v7;
  v15.size.width = v8;
  v15.size.height = v9;
  v10 = v8 * v9;
  v14 = CGRectIntersection(*(CGRect *)(a1 + 56), v15);
  v11 = 1.0
      - (v10 + *(double *)(a1 + 88) - v14.size.width * v14.size.height - v14.size.width * v14.size.height)
      / (v10 + *(double *)(a1 + 88));
  result = BSFloatGreaterThanFloat();
  if ((_DWORD)result)
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v11;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    *(_QWORD *)(v13 + 32) = a2;
    *(_QWORD *)(v13 + 40) = a3;
  }
  return result;
}

- (CGSize)effectiveIconSpacing
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconSpacing");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setIconSpacingAxisMatchingBehavior:(int64_t)a3
{
  if (self->_iconSpacingAxisMatchingBehavior != a3)
  {
    self->_iconSpacingAxisMatchingBehavior = a3;
    -[SBIconListView setHasSetIconSpacingAxisMatchingBehavior:](self, "setHasSetIconSpacingAxisMatchingBehavior:", 1);
    -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
    -[SBIconListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (int64_t)effectiveIconSpacingAxisMatchingBehavior
{
  void *v4;
  int64_t v5;

  if (-[SBIconListView hasSetIconSpacingAxisMatchingBehavior](self, "hasSetIconSpacingAxisMatchingBehavior"))
    return -[SBIconListView iconSpacingAxisMatchingBehavior](self, "iconSpacingAxisMatchingBehavior");
  -[SBIconListView layout](self, "layout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SBHIconListLayoutIconSpacingAxisMatchingBehavior(v4);

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v19 = 0u;
  -[SBIconListView getLayoutMetricsParameters:](self, "getLayoutMetricsParameters:", &v19);
  -[SBIconListView displayedModel](self, "displayedModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gridSize");
  v7 = objc_msgSend(v6, "numberOfUsedRows");
  *(double *)&v20 = width;
  *((double *)&v20 + 1) = height;
  *(_QWORD *)&v25 = v7;
  *((_QWORD *)&v23 + 1) = 0;
  objc_msgSend((id)objc_opt_class(), "layoutMetricsForParameters:listModel:", &v19, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alignmentIconSize");
  objc_msgSend(v8, "iconContentScale");
  objc_msgSend(v8, "alignmentIconSize");
  objc_msgSend(v8, "iconContentScale");
  objc_msgSend(v8, "iconInsets");
  objc_msgSend(v8, "iconSpacing");
  objc_msgSend(v8, "iconInsets");
  objc_msgSend(v8, "iconInsets");
  objc_msgSend(v8, "iconSpacing");
  objc_msgSend(v8, "iconInsets");
  UISizeRoundToViewScale();
  v10 = v9;
  v12 = v11;
  -[SBIconListView effectiveLayoutDelegateForSelector:](self, "effectiveLayoutDelegateForSelector:", sel_iconListView_sizeThatFits_metrics_proposedSize_);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "iconListView:sizeThatFits:metrics:proposedSize:", self, v8, width, height, v10, v12);
    v10 = v15;
    v12 = v16;
  }

  v17 = v10;
  v18 = v12;
  result.height = v18;
  result.width = v17;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SBIconListView iconSpacing](self, "iconSpacing");
  v5 = v4;
  if (v3 == -123.0 && v4 == -123.0)
  {
    v6 = *MEMORY[0x1E0DC55F0];
    v7 = *MEMORY[0x1E0DC55F0];
  }
  else if (v3 == -123.0)
  {
    v7 = *MEMORY[0x1E0DC55F0];
    -[SBIconListView sizeThatFits:](self, "sizeThatFits:", 10000.0, 10000.0);
  }
  else
  {
    -[SBIconListView sizeThatFits:](self, "sizeThatFits:", 10000.0, 10000.0);
    v7 = v6;
    if (v5 == -123.0)
      v6 = *MEMORY[0x1E0DC55F0];
    else
      v7 = v8;
  }
  v9 = v7;
  result.height = v6;
  result.width = v9;
  return result;
}

- (void)ignoreNextWindowChange
{
  self->_ignoreNextWindowChange = 1;
}

- (void)removeLayoutObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_layoutObservers, "removeObject:", a3);
}

- (id)gridSizeClassDomain
{
  void *v2;
  void *v3;

  -[SBIconListView model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveGridSizeClassDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setOverrideIconImageAppearance:(id)a3
{
  SBHIconImageAppearance *v4;
  SBHIconImageAppearance *overrideIconImageAppearance;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconImageAppearance *)objc_msgSend(v6, "copy");
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v4;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__SBIconListView_setOverrideIconImageAppearance___block_invoke;
    v7[3] = &unk_1E8D85CC0;
    v8 = v6;
    -[SBIconListView enumerateDisplayedIconViewsUsingBlock:](self, "enumerateDisplayedIconViewsUsingBlock:", v7);

  }
}

uint64_t __49__SBIconListView_setOverrideIconImageAppearance___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOverrideIconImageAppearance:", *(_QWORD *)(a1 + 32));
}

- (id)effectiveIconImageAppearance
{
  void *v3;
  void *v4;
  void *v5;

  -[SBIconListView overrideIconImageAppearance](self, "overrideIconImageAppearance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3E88], "sbh_iconImageAppearanceFromTraitCollection:overrideIconImageAppearance:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setOverrideIconImageStyleConfiguration:(id)a3
{
  SBHIconImageStyleConfiguration *v4;
  SBHIconImageStyleConfiguration *overrideIconImageStyleConfiguration;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconImageStyleConfiguration *)objc_msgSend(v6, "copy");
    overrideIconImageStyleConfiguration = self->_overrideIconImageStyleConfiguration;
    self->_overrideIconImageStyleConfiguration = v4;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__SBIconListView_setOverrideIconImageStyleConfiguration___block_invoke;
    v7[3] = &unk_1E8D85CC0;
    v8 = v6;
    -[SBIconListView enumerateDisplayedIconViewsUsingBlock:](self, "enumerateDisplayedIconViewsUsingBlock:", v7);

  }
}

uint64_t __57__SBIconListView_setOverrideIconImageStyleConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOverrideIconImageStyleConfiguration:", *(_QWORD *)(a1 + 32));
}

- (BOOL)containsWidget
{
  void *v2;
  void *v3;
  char v4;

  -[SBIconListView displayedModel](self, "displayedModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "directlyContainsIconOfClass:", v3);

  return v4;
}

- (id)widgetIconsForIntroductionContainerView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SBIconListView displayedModel](self, "displayedModel", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "icons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "isWidgetIcon"))
          objc_msgSend(v3, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)addPronouncedContainerViewWithDelegate:(id)a3 vertical:(BOOL)a4
{
  id v6;
  SBIconWidgetIntroductionView *pronouncedContainerView;
  SBIconWidgetIntroductionView *v8;
  void *v9;
  SBIconWidgetIntroductionView *v10;
  SBIconWidgetIntroductionView *v11;
  id WeakRetained;
  double v13;
  double v14;
  double v15;
  double v16;
  SBIconWidgetIntroductionPopoverView *v17;
  SBIconWidgetIntroductionPopoverView *widgetIntroductionPopover;
  double v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *widgetIntroductionPopoverTopAnchorConstraint;
  void *v24;
  void *v25;
  NSLayoutConstraint *v26;
  NSLayoutConstraint *widgetIntroductionPopoverLeadingAnchorConstraint;
  SBIconWidgetIntroductionPopoverView *v28;
  void *v29;
  void *v30;
  void *v31;
  NSLayoutConstraint *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  NSLayoutConstraint *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[4];
  _QWORD v45[6];

  v45[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pronouncedContainerView = self->_pronouncedContainerView;
  if (pronouncedContainerView)
  {
    -[SBIconWidgetIntroductionView removeFromSuperview](pronouncedContainerView, "removeFromSuperview");
    v8 = self->_pronouncedContainerView;
    self->_pronouncedContainerView = 0;

  }
  -[SBIconListView widgetIconsForIntroductionContainerView](self, "widgetIconsForIntroductionContainerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v42 = v6;
    objc_storeWeak((id *)&self->_widgetIntroductionDelegate, v6);
    self->_isWidgetIntroductionVertical = a4;
    v41 = v9;
    v10 = -[SBIconWidgetIntroductionView initWithWidgetIcons:]([SBIconWidgetIntroductionView alloc], "initWithWidgetIcons:", v9);
    v11 = self->_pronouncedContainerView;
    self->_pronouncedContainerView = v10;

    -[SBIconListView addSubview:](self, "addSubview:", self->_pronouncedContainerView);
    -[SBIconListView sendSubviewToBack:](self, "sendSubviewToBack:", self->_pronouncedContainerView);
    WeakRetained = objc_loadWeakRetained((id *)&self->_widgetIntroductionDelegate);
    +[SBIconWidgetIntroductionPopoverView contentSize:](SBIconWidgetIntroductionPopoverView, "contentSize:", self->_isWidgetIntroductionVertical);
    v14 = v13;
    v16 = v15;
    v17 = -[SBIconWidgetIntroductionPopoverView initWithDelegate:vertical:]([SBIconWidgetIntroductionPopoverView alloc], "initWithDelegate:vertical:", WeakRetained, self->_isWidgetIntroductionVertical);
    widgetIntroductionPopover = self->_widgetIntroductionPopover;
    self->_widgetIntroductionPopover = v17;

    -[SBIconListView addSubview:](self, "addSubview:", self->_widgetIntroductionPopover);
    -[SBIconWidgetIntroductionPopoverView setTranslatesAutoresizingMaskIntoConstraints:](self->_widgetIntroductionPopover, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBIconListView _introductionContainerViewFrameForView:](self, "_introductionContainerViewFrameForView:", self->_pronouncedContainerView);
    self->_widgetIntroductionPopOverTopAnchorOffset = v19;
    -[SBIconWidgetIntroductionPopoverView topAnchor](self->_widgetIntroductionPopover, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView topAnchor](self, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView _topSpacingForWidgetIntroductionPopoverView](self, "_topSpacingForWidgetIntroductionPopoverView");
    objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:constant:", v21);
    v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    widgetIntroductionPopoverTopAnchorConstraint = self->_widgetIntroductionPopoverTopAnchorConstraint;
    self->_widgetIntroductionPopoverTopAnchorConstraint = v22;

    -[SBIconWidgetIntroductionPopoverView leadingAnchor](self->_widgetIntroductionPopover, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView leadingAnchor](self, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView _leadingSpacingForWidgetIntroductionPopoverView](self, "_leadingSpacingForWidgetIntroductionPopoverView");
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25);
    v26 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    widgetIntroductionPopoverLeadingAnchorConstraint = self->_widgetIntroductionPopoverLeadingAnchorConstraint;
    self->_widgetIntroductionPopoverLeadingAnchorConstraint = v26;

    v40 = (void *)MEMORY[0x1E0CB3718];
    v28 = self->_widgetIntroductionPopover;
    if (self->_isWidgetIntroductionVertical)
    {
      -[SBIconWidgetIntroductionPopoverView topAnchor](v28, "topAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListView topAnchor](self, "topAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListView _topSpacingForWidgetIntroductionPopoverView](self, "_topSpacingForWidgetIntroductionPopoverView");
      objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = self->_widgetIntroductionPopoverLeadingAnchorConstraint;
      v45[0] = v31;
      v45[1] = v32;
      -[SBIconWidgetIntroductionPopoverView widthAnchor](self->_widgetIntroductionPopover, "widthAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToConstant:", v14);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v45[2] = v34;
      -[SBIconWidgetIntroductionPopoverView heightAnchor](self->_widgetIntroductionPopover, "heightAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToConstant:", v16);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v45[3] = v36;
      v37 = v45;
    }
    else
    {
      -[SBIconWidgetIntroductionPopoverView centerXAnchor](v28, "centerXAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListView centerXAnchor](self, "centerXAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "constraintEqualToAnchor:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v31;
      -[SBIconWidgetIntroductionPopoverView widthAnchor](self->_widgetIntroductionPopover, "widthAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToConstant:", v14);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v44[1] = v34;
      -[SBIconWidgetIntroductionPopoverView heightAnchor](self->_widgetIntroductionPopover, "heightAnchor");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "constraintEqualToConstant:", v16);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = self->_widgetIntroductionPopoverTopAnchorConstraint;
      v44[2] = v36;
      v44[3] = v38;
      v37 = v44;
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "activateConstraints:", v39);

    -[SBIconListView bringSubviewToFront:](self, "bringSubviewToFront:", self->_widgetIntroductionPopover);
    -[SBIconListView layoutWidgetIntroductionViews](self, "layoutWidgetIntroductionViews");
    -[SBIconListView setNeedsLayout](self, "setNeedsLayout");
    -[SBIconListView layoutIfNeeded](self, "layoutIfNeeded");
    -[SBIconListView startAnimatingPronouncedContainerAndPopoverView](self, "startAnimatingPronouncedContainerAndPopoverView");
    -[SBIconWidgetIntroductionPopoverView setAlpha:](self->_widgetIntroductionPopover, "setAlpha:", 0.0);
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __66__SBIconListView_addPronouncedContainerViewWithDelegate_vertical___block_invoke;
    v43[3] = &unk_1E8D84C50;
    v43[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v43, 0.225);

    v9 = v41;
    v6 = v42;
  }

}

uint64_t __66__SBIconListView_addPronouncedContainerViewWithDelegate_vertical___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 840), "setAlpha:", 1.0);
}

- (CGRect)_introductionContainerViewFrameForView:(id)a3
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  double width;
  CGFloat x;
  CGFloat y;
  double height;
  uint64_t i;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  NSObject *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect result;
  CGRect v40;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "widgetIcons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v29;
    width = 1.0;
    x = 0.0;
    *(_QWORD *)&v6 = 138412290;
    v27 = v6;
    y = 0.0;
    height = 1.0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v4);
        v14 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", v14, v27);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogWidgetDiscoverabilityMigration();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v27;
          v33 = v15;
          _os_log_impl(&dword_1CFEF3000, v16, OS_LOG_TYPE_DEFAULT, "introductionContainerView contained icon view %@", buf, 0xCu);
        }

        if (v15)
        {
          -[SBIconListView rectForIcon:](self, "rectForIcon:", v14);
          v40.origin.x = v17;
          v40.origin.y = v18;
          v40.size.width = v19;
          v40.size.height = v20;
          v36.origin.x = x;
          v36.origin.y = y;
          v36.size.width = width;
          v36.size.height = height;
          v37 = CGRectUnion(v36, v40);
          x = v37.origin.x;
          y = v37.origin.y;
          width = v37.size.width;
          height = v37.size.height;
          SBLogWidgetDiscoverabilityMigration();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v38.origin.x = x;
            v38.origin.y = y;
            v38.size.width = width;
            v38.size.height = height;
            NSStringFromCGRect(v38);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v27;
            v33 = v22;
            _os_log_impl(&dword_1CFEF3000, v21, OS_LOG_TYPE_DEFAULT, "introductionContainerView union frame %@", buf, 0xCu);

          }
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v7);
  }
  else
  {
    width = 1.0;
    x = 0.0;
    y = 0.0;
    height = 1.0;
  }

  v23 = x;
  v24 = y;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)layoutWidgetIntroductionViews
{
  SBIconWidgetIntroductionView *v3;
  SBIconWidgetIntroductionView *v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  SBIconListView *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];
  uint64_t v35;
  CGPoint v36;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = self->_pronouncedContainerView;
  v4 = v3;
  if (v3)
  {
    -[SBIconWidgetIntroductionView widgetIcons](v3, "widgetIcons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView _introductionContainerViewFrameForView:](self, "_introductionContainerViewFrameForView:", v4);
    -[SBIconWidgetIntroductionView sbf_setBoundsAndPositionFromFrame:](v4, "sbf_setBoundsAndPositionFromFrame:");
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v29;
      *(_QWORD *)&v8 = 138412290;
      v27 = v8;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v6);
          v12 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", v12, v27, (_QWORD)v28);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
          {
            objc_msgSend(v13, "superview");
            v15 = (SBIconListView *)objc_claimAutoreleasedReturnValue();

            if (v15 == self)
            {
              -[SBIconWidgetIntroductionView addSubview:](v4, "addSubview:", v14);
              -[SBIconListView centerForIcon:](self, "centerForIcon:", v12);
              v17 = v16;
              v19 = v18;
              objc_msgSend(v14, "superview");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[SBIconListView convertPoint:toView:](self, "convertPoint:toView:", v20, v17, v19);
              v22 = v21;
              v24 = v23;

              SBLogWidgetDiscoverabilityMigration();
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                v36.x = v22;
                v36.y = v24;
                NSStringFromCGPoint(v36);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v27;
                v33 = v26;
                _os_log_impl(&dword_1CFEF3000, v25, OS_LOG_TYPE_DEFAULT, "introductionContainerView contained icon view reparent center(%@)", buf, 0xCu);

              }
              objc_msgSend(v14, "setCenter:", v22, v24);
            }
          }

        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v9);
    }

  }
  if (self->_widgetIntroductionPopover)
    -[SBIconListView bringWidgetIntroductionPopoverToFront](self, "bringWidgetIntroductionPopoverToFront");

}

- (double)_topSpacingForWidgetIntroductionPopoverView
{
  int64_t v3;
  double result;
  void *v5;
  uint64_t v6;
  double v7;

  if (-[SBIconListView isWidgetIntroductionVertical](self, "isWidgetIntroductionVertical"))
  {
    v3 = -[SBIconListView layoutOrientation](self, "layoutOrientation");
    result = 70.0;
    if ((unint64_t)(v3 - 1) < 2)
      return 50.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    v7 = 33.0;
    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v7 = 15.0;
    return self->_widgetIntroductionPopOverTopAnchorOffset + v7;
  }
  return result;
}

- (double)_leadingSpacingForWidgetIntroductionPopoverView
{
  unint64_t v3;
  double v4;
  double result;

  v3 = -[SBIconListView layoutOrientation](self, "layoutOrientation") - 1;
  -[SBIconListView frame](self, "frame");
  result = v4 / 3.0 + 50.0;
  if (v3 <= 1)
    return v4 * 0.5 + 15.0;
  return result;
}

- (void)removePronouncedContainerView
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  SBIconWidgetIntroductionPopoverView *widgetIntroductionPopover;
  SBIconWidgetIntroductionPopoverView *v10;
  SBIconWidgetIntroductionView *pronouncedContainerView;
  SBIconWidgetIntroductionView *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SBIconListView stopAnimatingPronouncedContainerAndPopoverView](self, "stopAnimatingPronouncedContainerAndPopoverView");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SBIconWidgetIntroductionView subviews](self->_pronouncedContainerView, "subviews", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[SBIconListView addSubview:](self, "addSubview:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  widgetIntroductionPopover = self->_widgetIntroductionPopover;
  if (widgetIntroductionPopover)
  {
    -[SBIconWidgetIntroductionPopoverView removeFromSuperview](widgetIntroductionPopover, "removeFromSuperview");
    v10 = self->_widgetIntroductionPopover;
    self->_widgetIntroductionPopover = 0;

  }
  pronouncedContainerView = self->_pronouncedContainerView;
  if (pronouncedContainerView)
  {
    -[SBIconWidgetIntroductionView removeFromSuperview](pronouncedContainerView, "removeFromSuperview");
    v12 = self->_pronouncedContainerView;
    self->_pronouncedContainerView = 0;

  }
  objc_storeWeak((id *)&self->_widgetIntroductionDelegate, 0);
  -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
}

- (void)bringWidgetIntroductionPopoverToFront
{
  -[SBIconListView bringSubviewToFront:](self, "bringSubviewToFront:", self->_widgetIntroductionPopover);
}

- (void)startAnimatingPronouncedContainerAndPopoverView
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__SBIconListView_startAnimatingPronouncedContainerAndPopoverView__block_invoke;
  v2[3] = &unk_1E8D84C50;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 30, v2, 0, 0.65, 0.0);
}

uint64_t __65__SBIconListView_startAnimatingPronouncedContainerAndPopoverView__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  double v6;
  CGAffineTransform v8;

  objc_msgSend(*(id *)(a1 + 32), "pronouncedContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v8, 1.01, 1.01);
  objc_msgSend(v2, "setTransform:", &v8);

  v3 = objc_msgSend(*(id *)(a1 + 32), "isWidgetIntroductionVertical");
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "widgetIntroductionPopoverLeadingAnchorConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_leadingSpacingForWidgetIntroductionPopoverView");
  }
  else
  {
    objc_msgSend(v4, "widgetIntroductionPopoverTopAnchorConstraint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_topSpacingForWidgetIntroductionPopoverView");
  }
  objc_msgSend(v5, "setConstant:", v6 + 2.0);

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)stopAnimatingPronouncedContainerAndPopoverView
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__SBIconListView_stopAnimatingPronouncedContainerAndPopoverView__block_invoke;
  v2[3] = &unk_1E8D84C50;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v2, 0, 0.5, 0.0);
}

uint64_t __64__SBIconListView_stopAnimatingPronouncedContainerAndPopoverView__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  int v4;
  void *v5;
  void *v6;
  _OWORD v8[3];

  objc_msgSend(*(id *)(a1 + 32), "pronouncedContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v8[0] = *MEMORY[0x1E0C9BAA8];
  v8[1] = v3;
  v8[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v2, "setTransform:", v8);

  v4 = objc_msgSend(*(id *)(a1 + 32), "isWidgetIntroductionVertical");
  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "widgetIntroductionPopoverLeadingAnchorConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_leadingSpacingForWidgetIntroductionPopoverView");
  }
  else
  {
    objc_msgSend(v5, "widgetIntroductionPopoverTopAnchorConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_topSpacingForWidgetIntroductionPopoverView");
  }
  objc_msgSend(v6, "setConstant:");

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (SBIconListViewDragDelegate)effectiveDragDelegate
{
  void *v3;

  -[SBIconListView dragDelegate](self, "dragDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SBIconListViewReorderingManager reorderingDragDelegate](self->_reorderingManager, "reorderingDragDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (SBIconListViewDragDelegate *)v3;
}

- (id)beginTransitionToIconLocation:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  SBIconListViewIconLocationTransitionHandler *v10;

  v6 = a3;
  v7 = a4;
  -[SBIconListView iconLocation](self, "iconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = BSEqualObjects();

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v10 = -[SBIconListViewIconLocationTransitionHandler initWithIconLocation:reason:iconListView:]([SBIconListViewIconLocationTransitionHandler alloc], "initWithIconLocation:reason:iconListView:", v6, v7, self);
    -[SBIconListView setCurrentIconLocationTransitionHandler:](self, "setCurrentIconLocationTransitionHandler:", v10);
    -[SBIconListView setAlignsIconsOnPixelBoundaries:](self, "setAlignsIconsOnPixelBoundaries:", 0);
    -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
  }

  return v10;
}

- (BOOL)isTransitioningIconLocation
{
  void *v2;
  BOOL v3;

  -[SBIconListView currentIconLocationTransitionHandler](self, "currentIconLocationTransitionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)iconLocationTransitionHandler:(id)a3 setProgress:(double)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[SBIconListView currentIconLocationTransitionHandler](self, "currentIconLocationTransitionHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[SBIconListView layoutIconsNow](self, "layoutIconsNow");
}

- (void)iconLocationTransitionHandler:(id)a3 completeTransition:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[SBIconListView currentIconLocationTransitionHandler](self, "currentIconLocationTransitionHandler");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6 == v9)
  {
    if (v4)
    {
      objc_msgSend(v9, "iconLocation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListView setIconLocation:](self, "setIconLocation:", v8);

    }
    -[SBIconListView setCurrentIconLocationTransitionHandler:](self, "setCurrentIconLocationTransitionHandler:", 0);
    -[SBIconListView setAlignsIconsOnPixelBoundaries:](self, "setAlignsIconsOnPixelBoundaries:", 1);
    -[SBIconListView layoutIconsNow](self, "layoutIconsNow");
    v7 = v9;
  }

}

- (void)setOrientation:(int64_t)a3
{
  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    if (!self->_rotating)
    {
      -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
      -[SBIconListView updateReversedLayoutBasedOnOrientation](self, "updateReversedLayoutBasedOnOrientation");
    }
  }
}

- (void)willRotateWithTransitionCoordinator:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  int v42;
  _BOOL4 v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  BOOL v57;
  void *v58;
  _BOOL4 v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  id v64;
  id v65;
  void (**v66)(void *, void *, void *, uint64_t, uint64_t);
  void *v67;
  void *v68;
  void *v69;
  SBIconListView *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  _QWORD v75[4];
  id v76;
  SBIconListView *v77;
  id v78;
  uint8_t *v79;
  BOOL v80;
  _QWORD v81[5];
  id v82;
  uint64_t v83;
  unint64_t v84;
  unint64_t v85;
  BOOL v86;
  _QWORD aBlock[5];
  id v88;
  void *v89;
  id v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint8_t buf[8];
  uint8_t *v96;
  uint64_t v97;
  void *v98;
  os_activity_scope_state_s v99;

  v4 = a3;
  -[SBIconListView _window](self, "_window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(v5, "_toWindowOrientation");
  if (v72 == -[SBIconListView orientation](self, "orientation"))
  {
    SBLogIcon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_INFO, "Trying to rotate an icon list view to the orientation it already is; ignoring",
        buf,
        2u);
    }

    goto LABEL_59;
  }
  if (!self->_rotating)
  {
    -[SBIconListView layout](self, "layout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBIconListView isDisplayingWidgetIntroduction](self, "isDisplayingWidgetIntroduction");
    -[SBIconListView widgetIntroductionDelegate](self, "widgetIntroductionDelegate");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9)
      -[SBIconListView removePronouncedContainerView](self, "removePronouncedContainerView");
    v11 = _os_activity_create(&dword_1CFEF3000, "IconListView rotation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    *(_QWORD *)buf = 0;
    v96 = buf;
    v97 = 0x3010000000;
    v99.opaque[0] = 0;
    v99.opaque[1] = 0;
    v98 = &unk_1D01C8D52;
    os_activity_scope_enter(v11, &v99);
    self->_rotating = 1;
    -[SBIconListView displayedModel](self, "displayedModel");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "numberOfColumnsForOrientation:", self->_orientation);
    v55 = v5;
    v56 = (void *)v10;
    v57 = v9;
    v54 = v11;
    v13 = objc_msgSend(v8, "numberOfColumnsForOrientation:", v72);
    v14 = v13;
    v15 = v12;
    if (v12 <= v13)
      v16 = v13;
    else
      v16 = v12;
    v61 = v16;
    v70 = self;
    v17 = objc_msgSend(v8, "numberOfRowsForOrientation:", self->_orientation);
    v53 = v8;
    v18 = objc_msgSend(v8, "numberOfRowsForOrientation:", v72);
    v19 = v18;
    if (v17 <= v18)
      v20 = v18;
    else
      v20 = v17;
    v62 = v20;
    v74 = objc_msgSend(v68, "numberOfIcons");
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v74);
    v65 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v64 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v59 = -[SBIconListView isRTL](v70, "isRTL");
    v22 = objc_msgSend((id)objc_opt_class(), "rotationAnchor");
    v23 = 1;
    if ((v22 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      v23 = -1;
    v60 = v23;
    v24 = -1;
    if (v22 <= 1)
      v24 = 1;
    v71 = v24;
    -[SBIconListView iconLocation](v70, "iconLocation");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView layoutMetrics](v70, "layoutMetrics");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = (void *)objc_msgSend(v25, "copy");

    -[SBIconListView layoutMetricsForOrientation:](v70, "layoutMetricsForOrientation:", v72);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v69, "copy");
    v52 = v4;
    v27 = objc_msgSend(v26, "columns");
    v28 = objc_msgSend(v26, "rows");
    v29 = v61 - v27;
    if ((uint64_t)(v61 - v27) >= 1)
    {
      objc_msgSend(v26, "gridCellInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addEmptyColumns:", v29);

    }
    if ((uint64_t)(v62 - v28) >= 1)
    {
      objc_msgSend(v26, "gridCellInfo");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addEmptyRows:", v62 - objc_msgSend(v26, "rows"));

    }
    objc_msgSend(v26, "setColumns:", v61);
    objc_msgSend(v26, "setRows:", v62);
    if (v59)
      v32 = -(uint64_t)v29;
    else
      v32 = 0;
    objc_msgSend(v26, "setColumnOffset:", v32);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__SBIconListView_willRotateWithTransitionCoordinator___block_invoke;
    aBlock[3] = &unk_1E8D897F8;
    v92 = v15;
    v93 = v19;
    v94 = v14;
    v91 = v17;
    aBlock[4] = v70;
    v50 = v26;
    v88 = v50;
    v89 = v58;
    v51 = v21;
    v90 = v51;
    v66 = (void (**)(void *, void *, void *, uint64_t, uint64_t))_Block_copy(aBlock);
    if (!v62)
      goto LABEL_58;
    v33 = 0;
    v73 = 0;
    v34 = 0;
    v35 = v60;
    while (1)
    {
      if (v34 == v73 && v34 >= v74)
        goto LABEL_58;
      v63 = v33;
      v36 = v61;
      v37 = v71;
      if (!v61)
        goto LABEL_57;
      while (v34 != v73 || v34 < v74)
      {
        v38 = -[SBIconListView indexForCoordinate:forOrientation:metrics:](v70, "indexForCoordinate:forOrientation:metrics:", v37, v35, v70->_orientation, v69);
        v39 = -[SBIconListView indexForCoordinate:forOrientation:metrics:](v70, "indexForCoordinate:forOrientation:metrics:", v37, v35, v72, v67);
        if (v38 >= v74)
          goto LABEL_39;
        objc_msgSend(v68, "iconAtIndex:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        if (v40)
        {
          if (!objc_msgSend(v65, "containsObject:", v40))
          {
            objc_msgSend(v65, "addObject:", v40);
            ++v34;
            goto LABEL_40;
          }

LABEL_39:
          v40 = 0;
        }
LABEL_40:
        if (v39 < v74)
        {
          objc_msgSend(v68, "iconAtIndex:", v39);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            if (!objc_msgSend(v64, "containsObject:", v41))
            {
              objc_msgSend(v64, "addObject:", v41);
              ++v73;
              v43 = v40 != 0;
              v42 = 1;
LABEL_48:
              objc_msgSend(v40, "gridSizeClass");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "gridSizeClass");
              v45 = objc_claimAutoreleasedReturnValue();
              v46 = (void *)v45;
              if ((v42 & v43) != 1 || v44 == (void *)v45 || objc_msgSend(v44, "isEqualToString:", v45))
              {
                v66[2](v66, v40, v41, v37, v35);
              }
              else
              {
                v66[2](v66, v40, 0, v37, v35);
                v66[2](v66, 0, v41, v37, v35);
              }

              goto LABEL_54;
            }

          }
        }
        if (v40)
        {
          v42 = 0;
          v41 = 0;
          v43 = 1;
          goto LABEL_48;
        }
LABEL_54:

        v37 += v71;
        if (!--v36)
          goto LABEL_57;
      }
      v34 = v73;
LABEL_57:
      v33 = v63 + 1;
      v35 += v60;
      if (v63 + 1 == v62)
      {
LABEL_58:
        v47 = MEMORY[0x1E0C809B0];
        v81[0] = MEMORY[0x1E0C809B0];
        v81[1] = 3221225472;
        v81[2] = __54__SBIconListView_willRotateWithTransitionCoordinator___block_invoke_2;
        v81[3] = &unk_1E8D89820;
        v81[4] = v70;
        v83 = v72;
        v84 = v61;
        v85 = v62;
        v86 = v59;
        v82 = v51;
        v75[0] = v47;
        v75[1] = 3221225472;
        v75[2] = __54__SBIconListView_willRotateWithTransitionCoordinator___block_invoke_3;
        v75[3] = &unk_1E8D89848;
        v48 = v82;
        v76 = v48;
        v77 = v70;
        v80 = v57;
        v49 = v56;
        v78 = v49;
        v79 = buf;
        v4 = v52;
        objc_msgSend(v52, "animateAlongsideTransition:completion:", v81, v75);

        _Block_object_dispose(buf, 8);
        v5 = v55;
        goto LABEL_59;
      }
    }
  }
  SBLogIcon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_DEFAULT, "Trying to rotate an icon list view that is already rotating; ignoring",
      buf,
      2u);
  }

  -[SBIconListView setOrientation:](self, "setOrientation:", v72);
  -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
LABEL_59:

}

void __54__SBIconListView_willRotateWithTransitionCoordinator___block_invoke(uint64_t a1, void *a2, void *a3, unint64_t a4, unint64_t a5)
{
  id v9;
  BOOL v10;
  uint64_t v11;
  __CFString *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  SBIconRotationContainer *v25;
  uint64_t v26;
  id v27;

  v27 = a2;
  v9 = a3;
  if (v27 == v9)
  {
    v11 = 0;
    v10 = 0;
    if (v27)
      goto LABEL_16;
  }
  else
  {
    if (v27)
    {
      if (v9)
      {
        v10 = 0;
        v11 = 3;
      }
      else if (a5 >= *(_QWORD *)(a1 + 80))
      {
        v11 = 1;
        v10 = 1;
      }
      else
      {
        v10 = a4 >= *(_QWORD *)(a1 + 88);
        v11 = 1;
      }
LABEL_16:
      objc_msgSend(v27, "gridSizeClass");
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_17;
LABEL_20:
      objc_msgSend(*(id *)(a1 + 32), "originForIconAtCoordinate:metrics:", a4, a5, *(_QWORD *)(a1 + 40));
      v14 = v21;
      v16 = v22;
      objc_msgSend(*(id *)(a1 + 32), "iconImageSizeForGridSizeClass:", v12);
      v18 = v23;
      v20 = v24;
      goto LABEL_21;
    }
    v10 = a5 >= *(_QWORD *)(a1 + 64) || a4 >= *(_QWORD *)(a1 + 72);
    v11 = 2;
  }
  objc_msgSend(v9, "gridSizeClass");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_20;
LABEL_17:
  if (v12 != CFSTR("SBHIconGridSizeClassDefault")
    && !-[__CFString isEqualToString:](v12, "isEqualToString:"))
  {
    goto LABEL_20;
  }
  objc_msgSend(*(id *)(a1 + 32), "rectForDefaultSizedCellAtCoordinate:metrics:", a4, a5, *(_QWORD *)(a1 + 40));
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
LABEL_21:
  LOBYTE(v26) = v10;
  v25 = -[SBIconRotationContainer initWithFrame:startIcon:endIcon:listView:coordinate:location:transitionAnimation:offscreen:]([SBIconRotationContainer alloc], "initWithFrame:startIcon:endIcon:listView:coordinate:location:transitionAnimation:offscreen:", v27, v9, *(_QWORD *)(a1 + 32), a4, a5, *(_QWORD *)(a1 + 48), v14, v16, v18, v20, v11, v26);
  -[SBIconRotationContainer prepareToTransition](v25, "prepareToTransition");
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v25);
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", v25);

}

void __54__SBIconListView_willRotateWithTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setOrientation:", *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 552);
  *(_QWORD *)(v2 + 552) = 0;

  objc_msgSend(*(id *)(a1 + 32), "layoutMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  v6 = *(_QWORD *)(a1 + 56);
  v7 = v6 - objc_msgSend(v5, "columns");
  objc_msgSend(v5, "gridCellInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEmptyColumns:", v7);

  objc_msgSend(v5, "gridCellInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEmptyRows:", *(_QWORD *)(a1 + 64) - objc_msgSend(v5, "rows"));

  objc_msgSend(v5, "setColumns:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v5, "setRows:", *(_QWORD *)(a1 + 64));
  if (*(_BYTE *)(a1 + 72))
    v10 = -v7;
  else
    v10 = 0;
  objc_msgSend(v5, "setColumnOffset:", v10);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = *(id *)(a1 + 40);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v16, "startIcon", (_QWORD)v23);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "endIcon");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v17)
        {
          objc_msgSend(v17, "gridSizeClass");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v16, "coordinate");
          if (v19)
            goto LABEL_11;
        }
        else
        {
          objc_msgSend(v18, "gridSizeClass");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v16, "coordinate");
          if (!v19)
          {
LABEL_11:
            objc_msgSend(*(id *)(a1 + 32), "centerForIconCoordinate:metrics:", v22, v21, v5);
            goto LABEL_14;
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "rectForDefaultSizedCellsOfSizeClass:startingAtCoordinate:metrics:", v20, v22, v21, v5);
        UIRectGetCenter();
LABEL_14:
        objc_msgSend(v16, "setCenter:");
        objc_msgSend(v16, "performTransition");

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

}

void __54__SBIconListView_willRotateWithTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "concludeTransition", (_QWORD)v8);
        objc_msgSend(v7, "removeFromSuperview");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 426) = 0;
  objc_msgSend(*(id *)(a1 + 40), "layoutIconsNow");
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 40), "addPronouncedContainerViewWithDelegate:vertical:", *(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 40), "isWidgetIntroductionVertical"));
  os_activity_scope_leave((os_activity_scope_state_t)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 32));
}

- (BOOL)_allowsFocusToLeaveViaHeading:(unint64_t)a3
{
  return (a3 & 0x330) == 0;
}

SBHFocusGuideView *__35__SBIconListView_layoutFocusGuides__block_invoke(id *a1)
{
  SBHFocusGuideView *v2;

  if (objc_msgSend(a1[4], "count"))
  {
    objc_msgSend(a1[4], "lastObject");
    v2 = (SBHFocusGuideView *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "removeLastObject");
  }
  else
  {
    v2 = objc_alloc_init(SBHFocusGuideView);
    objc_msgSend(a1[5], "addSubview:", v2);
  }
  objc_msgSend(a1[6], "addObject:", v2);
  return v2;
}

void __35__SBIconListView_layoutFocusGuides__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  objc_msgSend(*(id *)(a1 + 32), "rectForDefaultSizedCellAtCoordinate:metrics:", a2, a3, *(_QWORD *)(a1 + 40));
  v11 = v10;
  v12 = 56;
  if (a6)
    v12 = 64;
  v13 = *(double *)(a1 + v12);
  v14 = *(double *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "iconAtCoordinate:metrics:", a4, a5, *(_QWORD *)(a1 + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v19 = v15;
    objc_msgSend(*(id *)(a1 + 32), "displayedIconViewForIcon:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    v15 = v19;
    if (v16)
    {
      v17 = (void *)v16;
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setFrame:", v13, v11, 10.0, v14);
      objc_msgSend(v18, "setTargetView:", v17);

      v15 = v19;
    }
  }

}

- (BOOL)_iconMatchingCoordinateBeginsInThatRow:(SBIconCoordinate)a3 metrics:(id)a4
{
  int64_t row;
  void *v6;
  uint64_t v7;

  row = a3.row;
  -[SBIconListView iconAtCoordinate:metrics:](self, "iconAtCoordinate:metrics:", a3.column, a3.row, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView coordinateForIcon:](self, "coordinateForIcon:", v6);
  LOBYTE(row) = v7 == row;

  return row;
}

- (SBIconCoordinate)_coordinateBeforeCoordinate:(SBIconCoordinate)a3 rows:(unint64_t)a4 columns:(unint64_t)a5 metrics:(id)a6
{
  int64_t row;
  int64_t column;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  SBIconCoordinate result;

  row = a3.row;
  column = a3.column;
  v10 = a6;
  if (column < 2)
  {
    if (row < 2)
    {
      row = 0x7FFFFFFFFFFFFFFFLL;
      a5 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else if (!-[SBIconListView _iconMatchingCoordinateBeginsInThatRow:metrics:](self, "_iconMatchingCoordinateBeginsInThatRow:metrics:", a5, --row, v10))
    {
      -[SBIconListView iconAtCoordinate:metrics:](self, "iconAtCoordinate:metrics:", a5, row, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        objc_msgSend(v11, "gridSizeClass");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (unsigned __int16)-[SBIconListView iconGridSizeForClass:](self, "iconGridSizeForClass:", v13);

      }
      else
      {
        v14 = 1;
      }
      a5 -= v14;

    }
  }
  else
  {
    a5 = column - 1;
  }

  v15 = a5;
  v16 = row;
  result.row = v16;
  result.column = v15;
  return result;
}

- (SBIconCoordinate)_coordinateAfterCoordinate:(SBIconCoordinate)a3 rows:(unint64_t)a4 columns:(unint64_t)a5 metrics:(id)a6
{
  unint64_t row;
  unint64_t column;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v16;
  int64_t v17;
  SBIconCoordinate result;

  row = a3.row;
  column = a3.column;
  v11 = a6;
  if (column >= a5)
  {
    if (row >= a4)
    {
      row = 0x7FFFFFFFFFFFFFFFLL;
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      ++row;
      v12 = 1;
      if (!-[SBIconListView _iconMatchingCoordinateBeginsInThatRow:metrics:](self, "_iconMatchingCoordinateBeginsInThatRow:metrics:", 1, row, v11))
      {
        -[SBIconListView iconAtCoordinate:metrics:](self, "iconAtCoordinate:metrics:", 1, row, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "gridSizeClass");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (unsigned __int16)-[SBIconListView iconGridSizeForClass:](self, "iconGridSizeForClass:", v15)+ 1;

        }
        else
        {
          v12 = 2;
        }

      }
    }
  }
  else
  {
    v12 = column + 1;
  }

  v16 = v12;
  v17 = row;
  result.row = v17;
  result.column = v16;
  return result;
}

- (id)addPlaceholderAtGridCellIndex:(unint64_t)a3 gridSizeClass:(id)a4 reason:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  SBIconListViewPlaceholderAssertion *v16;
  NSHashTable *placeholderAssertions;
  NSHashTable *v18;
  NSHashTable *v19;
  int v21;
  SBIconListView *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  -[SBIconListView model](self, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView gridCellInfoOptions](self, "gridCellInfoOptions");
  SBLogIcon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[SBIconListView gridSizeClassDomain](self, "gridSizeClassDomain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "descriptionForGridSizeClass:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 134218754;
    v22 = self;
    v23 = 2048;
    v24 = a3;
    v25 = 2114;
    v26 = v15;
    v27 = 2114;
    v28 = v11;
    _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_DEFAULT, "%p: add placeholder at grid cell index %lu size '%{public}@ reason %{public}@", (uint8_t *)&v21, 0x2Au);

  }
  v16 = -[SBIconListViewPlaceholderAssertion initWithGridCellIndex:gridSizeClass:reason:options:listView:]([SBIconListViewPlaceholderAssertion alloc], "initWithGridCellIndex:gridSizeClass:reason:options:listView:", a3, v10, v11, a6, self);
  placeholderAssertions = self->_placeholderAssertions;
  if (!placeholderAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v18 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v19 = self->_placeholderAssertions;
    self->_placeholderAssertions = v18;

    placeholderAssertions = self->_placeholderAssertions;
  }
  -[NSHashTable addObject:](placeholderAssertions, "addObject:", v16);
  -[SBIconListView regenerateTemporaryDisplayedModelIfNecessary](self, "regenerateTemporaryDisplayedModelIfNecessary");
  -[SBIconListView _informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged](self, "_informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged");

  return v16;
}

- (id)addPlaceholderRepresentingIcon:(id)a3 reason:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v8 = a3;
  v9 = a4;
  -[SBIconListView displayedModel](self, "displayedModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexForIcon:", v8);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[SBIconListView model](self, "model");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "indexForIcon:", v8);
    objc_msgSend(v12, "gridCellInfoWithOptions:", -[SBIconListView gridCellInfoOptions](self, "gridCellInfoOptions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "gridCellIndexForIconIndex:", v13);

  }
  else
  {
    v16 = v11;
    -[SBIconListView gridCellInfo](self, "gridCellInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "gridCellIndexForIconIndex:", v16);
  }

  -[SBIconListView addPlaceholderAtGridCellIndex:representingIcon:reason:options:](self, "addPlaceholderAtGridCellIndex:representingIcon:reason:options:", v15, v8, v9, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)addPlaceholderAtGridCellIndex:(unint64_t)a3 representingIcon:(id)a4 reason:(id)a5 options:(unint64_t)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  SBIconListViewPlaceholderAssertion *v14;
  NSHashTable *placeholderAssertions;
  NSHashTable *v16;
  NSHashTable *v17;
  int v19;
  SBIconListView *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  -[SBIconListView model](self, "model");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView gridCellInfoOptions](self, "gridCellInfoOptions");
  SBLogIcon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 134218754;
    v20 = self;
    v21 = 2112;
    v22 = v10;
    v23 = 2048;
    v24 = a3;
    v25 = 2114;
    v26 = v11;
    _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_DEFAULT, "%p: add placeholder for icon %@ at grid cell index %lu reason %{public}@", (uint8_t *)&v19, 0x2Au);
  }

  v14 = -[SBIconListViewPlaceholderAssertion initWithGridCellIndex:representedIcon:reason:options:listView:]([SBIconListViewPlaceholderAssertion alloc], "initWithGridCellIndex:representedIcon:reason:options:listView:", a3, v10, v11, a6, self);
  placeholderAssertions = self->_placeholderAssertions;
  if (!placeholderAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v17 = self->_placeholderAssertions;
    self->_placeholderAssertions = v16;

    placeholderAssertions = self->_placeholderAssertions;
  }
  -[NSHashTable addObject:](placeholderAssertions, "addObject:", v14);
  -[SBIconListView regenerateTemporaryDisplayedModelIfNecessary](self, "regenerateTemporaryDisplayedModelIfNecessary");
  -[SBIconListView _informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged](self, "_informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged");

  return v14;
}

- (void)placeholderAssertionDidChangePosition:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  SBIconListView *v7;
  __int16 v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogIcon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134218496;
    v7 = self;
    v8 = 2048;
    v9 = v4;
    v10 = 2048;
    v11 = objc_msgSend(v4, "gridCellIndex");
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "%p: placeholder %p did change position to grid cell index %lu", (uint8_t *)&v6, 0x20u);
  }

  if (-[NSHashTable containsObject:](self->_placeholderAssertions, "containsObject:", v4))
    -[SBIconListView regenerateTemporaryDisplayedModelIfNecessary](self, "regenerateTemporaryDisplayedModelIfNecessary");

}

- (void)removePlaceholderAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSHashTable *placeholderAssertions;
  int v9;
  SBIconListView *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogIcon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 134218496;
    v10 = self;
    v11 = 2048;
    v12 = v4;
    v13 = 2048;
    v14 = objc_msgSend(v4, "gridCellIndex");
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "%p: remove placeholder %p from grid cell index %lu", (uint8_t *)&v9, 0x20u);
  }

  if (-[NSHashTable containsObject:](self->_placeholderAssertions, "containsObject:", v4))
  {
    objc_msgSend(v4, "placeholderIcon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SBIconListView removedIcons](self, "removedIcons");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v6);

    }
    -[NSHashTable removeObject:](self->_placeholderAssertions, "removeObject:", v4);
    if (!-[NSHashTable count](self->_placeholderAssertions, "count"))
    {
      placeholderAssertions = self->_placeholderAssertions;
      self->_placeholderAssertions = 0;

    }
    -[SBIconListView regenerateTemporaryDisplayedModelIfNecessary](self, "regenerateTemporaryDisplayedModelIfNecessary");
    -[SBIconListView _informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged](self, "_informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged");

  }
}

- (void)_informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_layoutObservers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "iconListViewDidChangeNumberOfPlaceholdersOrLayoutHiddenIcons:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (unint64_t)gridCellIndexForFirstPlaceholder
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[NSHashTable objectEnumerator](self->_placeholderAssertions, "objectEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "effectiveGridCellIndex");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (id)beginHidingIconsFromLayout:(id)a3 reason:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  SBHIconLayoutHidingAssertion *v11;
  NSHashTable *layoutHidingAssertions;
  NSHashTable *v13;
  NSHashTable *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  SBIconListView *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  SBLogIcon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218754;
    v28 = self;
    v29 = 2112;
    v30 = v8;
    v31 = 2114;
    v32 = v9;
    v33 = 2048;
    v34 = a5;
    _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "%p: begin hiding icons %@ for reason '%{public}@' options: %lx", buf, 0x2Au);
  }

  v11 = -[SBHIconLayoutHidingAssertion initWithDelegate:icons:reason:options:]([SBHIconLayoutHidingAssertion alloc], "initWithDelegate:icons:reason:options:", self, v8, v9, a5);
  layoutHidingAssertions = self->_layoutHidingAssertions;
  if (!layoutHidingAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v14 = self->_layoutHidingAssertions;
    self->_layoutHidingAssertions = v13;

    layoutHidingAssertions = self->_layoutHidingAssertions;
  }
  -[NSHashTable addObject:](layoutHidingAssertions, "addObject:", v11);
  -[SBIconListView regenerateTemporaryDisplayedModelIfNecessary](self, "regenerateTemporaryDisplayedModelIfNecessary");
  if ((a5 & 1) != 0)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v8;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19), (_QWORD)v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setAlpha:", 0.0);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

  }
  if ((a5 & 2) != 0)
    -[SBIconListView layoutIconsIfNeededWithAnimationType:options:](self, "layoutIconsIfNeededWithAnimationType:options:", 0, 0);
  -[SBIconListView _informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged](self, "_informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged", (_QWORD)v22);

  return v11;
}

- (void)layoutHidingAssertionDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  SBIconListView *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogIcon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "icons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 134218498;
    v8 = self;
    v9 = 2048;
    v10 = v4;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "%p: icon hiding assertion %p did change icons %@", (uint8_t *)&v7, 0x20u);

  }
  if (-[NSHashTable containsObject:](self->_layoutHidingAssertions, "containsObject:", v4))
  {
    -[SBIconListView regenerateTemporaryDisplayedModelIfNecessary](self, "regenerateTemporaryDisplayedModelIfNecessary");
    -[SBIconListView _informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged](self, "_informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged");
  }

}

- (void)layoutHidingAssertionDidInvalidate:(id)a3
{
  id v4;
  NSObject *v5;
  NSHashTable *layoutHidingAssertions;
  int v7;
  SBIconListView *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogIcon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = self;
    v9 = 2048;
    v10 = v4;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "%p: remove icon hiding assertion %p", (uint8_t *)&v7, 0x16u);
  }

  if (-[NSHashTable containsObject:](self->_layoutHidingAssertions, "containsObject:", v4))
  {
    -[NSHashTable removeObject:](self->_layoutHidingAssertions, "removeObject:", v4);
    if (!-[NSHashTable count](self->_layoutHidingAssertions, "count"))
    {
      layoutHidingAssertions = self->_layoutHidingAssertions;
      self->_layoutHidingAssertions = 0;

    }
    -[SBIconListView regenerateTemporaryDisplayedModelIfNecessary](self, "regenerateTemporaryDisplayedModelIfNecessary");
    -[SBIconListView _informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged](self, "_informLayoutObserversNumberOfPlaceholdersOrLayoutHiddenIconsChanged");
  }

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_iconSettings == a3)
    -[SBIconListView _applyIconPaddingSettings](self, "_applyIconPaddingSettings");
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend(v5, "addObserver:", self);
  -[SBIconListView removedIcons](self, "removedIcons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObject:", v5);

  -[SBIconListView updateIconViewForIcon:toIcon:](self, "updateIconViewForIcon:toIcon:", v5, v5);
  -[SBIconListView regenerateTemporaryDisplayedModelIfNecessary](self, "regenerateTemporaryDisplayedModelIfNecessary");
  -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
  -[SBIconListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  -[SBIconListView removedIcons](self, "removedIcons");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v8);

  -[SBIconListView removedIcons](self, "removedIcons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v7);

  objc_msgSend(v8, "removeObserver:", self);
  -[SBIconListView updateIconViewForIcon:toIcon:](self, "updateIconViewForIcon:toIcon:", v8, v7);

  objc_msgSend(v7, "addObserver:", self);
  -[SBIconListView regenerateTemporaryDisplayedModelIfNecessary](self, "regenerateTemporaryDisplayedModelIfNecessary");
  -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
  -[SBIconListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "removeObserver:", self);
  -[SBIconListView removedIcons](self, "removedIcons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v5);

  -[SBIconListView _removeCaptureOnlyBackgroundViewForRemovedIconIfNecessary:](self, "_removeCaptureOnlyBackgroundViewForRemovedIconIfNecessary:", v5);
  -[SBIconListView regenerateTemporaryDisplayedModelIfNecessary](self, "regenerateTemporaryDisplayedModelIfNecessary");
  -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
  -[SBIconListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconListView _cleanupIconViewsForRemovedIcons:](self, "_cleanupIconViewsForRemovedIcons:", v7);
}

- (void)iconList:(id)a3 didMoveIcon:(id)a4
{
  -[SBIconListView regenerateTemporaryDisplayedModelIfNecessary](self, "regenerateTemporaryDisplayedModelIfNecessary", a3, a4);
  -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");
}

- (void)iconView:(id)a3 willCancelDragForItem:(id)a4
{
  id v5;

  v5 = a3;
  if (-[NSMutableSet containsObject:](self->_draggingIconViews, "containsObject:"))
  {
    -[SBIconListView setCanceledDraggingIconView:](self, "setCanceledDraggingIconView:", v5);
    -[SBIconListView restoreDraggedIconView:](self, "restoreDraggedIconView:", v5);
  }

}

- (void)iconViewDidEndDrag:(id)a3
{
  SBIconListView *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  if (-[NSMutableSet containsObject:](self->_draggingIconViews, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_draggingIconViews, "removeObject:", v8);
    objc_msgSend(v8, "superview");
    v4 = (SBIconListView *)objc_claimAutoreleasedReturnValue();

    if (v4 == self)
    {
      objc_msgSend(v8, "setAlpha:", 1.0);
      objc_msgSend(v8, "icon");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListView canceledDraggingIconView](self, "canceledDraggingIconView");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v6 == v8)
      {
        -[SBIconListView setCanceledDraggingIconView:](self, "setCanceledDraggingIconView:", 0);
      }
      else if (!v5
             || (-[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", v5),
                 v7 = (id)objc_claimAutoreleasedReturnValue(),
                 v7,
                 v7 != v8))
      {
        -[SBIconListView removeIconView:](self, "removeIconView:", v8);
      }

    }
  }

}

- (void)_captureOnlyBackgroundAssertionDidInvalidate:(id)a3
{
  id v4;
  SBIconListView *v5;
  NSMapTable *iconsToCaptureOnlyBackgroundAssertions;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSMapTable *v14;
  void *v15;
  NSMutableDictionary *groupNamesToCaptureOnlyBackgroundViews;
  id v17;

  v4 = a3;
  if (v4)
  {
    v17 = v4;
    v5 = self;
    objc_sync_enter(v5);
    iconsToCaptureOnlyBackgroundAssertions = v5->_iconsToCaptureOnlyBackgroundAssertions;
    objc_msgSend(v17, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](iconsToCaptureOnlyBackgroundAssertions, "removeObjectForKey:", v7);

    objc_msgSend(v17, "groupName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectEnumerator](v5->_iconsToCaptureOnlyBackgroundAssertions, "objectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    do
    {
      objc_msgSend(v9, "nextObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
        break;
      objc_msgSend(v11, "groupName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v8);

      v10 = v11;
    }
    while ((v13 & 1) == 0);
    if (-[NSMapTable count](v5->_iconsToCaptureOnlyBackgroundAssertions, "count"))
    {
      if (!v11)
        goto LABEL_9;
    }
    else
    {
      v14 = v5->_iconsToCaptureOnlyBackgroundAssertions;
      v5->_iconsToCaptureOnlyBackgroundAssertions = 0;

      if (!v11)
      {
LABEL_9:
        -[NSMutableDictionary objectForKey:](v5->_groupNamesToCaptureOnlyBackgroundViews, "objectForKey:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeFromSuperview");
        -[NSMutableDictionary removeObjectForKey:](v5->_groupNamesToCaptureOnlyBackgroundViews, "removeObjectForKey:", v8);
        if (!-[NSMutableDictionary count](v5->_groupNamesToCaptureOnlyBackgroundViews, "count"))
        {
          groupNamesToCaptureOnlyBackgroundViews = v5->_groupNamesToCaptureOnlyBackgroundViews;
          v5->_groupNamesToCaptureOnlyBackgroundViews = 0;

        }
      }
    }

    objc_sync_exit(v5);
    v4 = v17;
  }

}

void __82__SBIconListView__insertCaptureOnlyBackgroundViewForInsertingIconViewIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_captureOnlyBackgroundAssertionDidInvalidate:", v3);

}

- (void)_addIconViewsForIcons:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBIconListView layoutMetrics](self, "layoutMetrics");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconListView _addIconViewsForIcons:metrics:](self, "_addIconViewsForIcons:metrics:", v4, v5);

}

- (void)_cleanupIconViewsForRemovedIcons:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_iconViews, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "superview");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v12)
          {
            -[NSMapTable removeObjectForKey:](self->_iconViews, "removeObjectForKey:", v9);
            -[SBIconListView removeIconView:](self, "removeIconView:", v11);
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

void __45__SBIconListView__setupLayoutRunLoopObserver__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "layoutIconsIfNeeded");

}

- (void)updateIconViewForIcon:(id)a3 toIcon:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  id v11;

  v6 = a4;
  -[SBIconListView temporarilyMappedIconForIcon:](self, "temporarilyMappedIconForIcon:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconListView temporarilyMappedIconForIcon:](self, "temporarilyMappedIconForIcon:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMapTable objectForKey:](self->_iconViews, "objectForKey:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v11)
  {
    v10 = 0;
    if (!v8)
      goto LABEL_7;
  }
  else
  {
    -[NSMapTable objectForKey:](self->_iconViews, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v9 != 0;
    if (!v8)
      goto LABEL_7;
  }
  if (!v10)
  {
    -[NSMapTable removeObjectForKey:](self->_iconViews, "removeObjectForKey:", v11);
    -[SBIconListView configureIconView:forIcon:](self, "configureIconView:forIcon:", v8, v7);
    -[NSMapTable setObject:forKey:](self->_iconViews, "setObject:forKey:", v8, v7);
  }
LABEL_7:

}

- (void)forgetIconView:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[SBIconListView isDisplayingIconView:](self, "isDisplayingIconView:"))
  {
    objc_msgSend(v5, "icon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable removeObjectForKey:](self->_iconViews, "removeObjectForKey:", v4);
    -[NSMutableSet removeObject:](self->_draggingIconViews, "removeObject:", v5);
    -[SBIconListView setIconsNeedLayout](self, "setIconsNeedLayout");

  }
}

- (id)_iconForDragItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "sbh_appDragLocalContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "droppedIconIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v5, "uniqueIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SBIconListView model](self, "model");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "iconWithIdentifier:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)restoreDraggedIconView:(id)a3
{
  id v4;
  SBIconListView *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "superview");
  v5 = (SBIconListView *)objc_claimAutoreleasedReturnValue();

  if (v5 == self)
  {
    objc_msgSend(v4, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      v6 = v8 != (_QWORD)v4;
      if ((id)v8 != v4)
      {
        if (v8)
          -[SBIconListView removeIconView:](self, "removeIconView:", v8);
        -[SBIconListView configureIconView:forIcon:](self, "configureIconView:forIcon:", v4, v7);
        -[NSMapTable setObject:forKey:](self->_iconViews, "setObject:forKey:", v4, v7);
        objc_msgSend(v4, "setAlpha:", 1.0);
        -[SBIconListView centerForDraggedIconView:](self, "centerForDraggedIconView:", v4);
        objc_msgSend(v4, "setCenter:");
        -[NSMutableSet removeObject:](self->_draggingIconViews, "removeObject:", v4);
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CGPoint)centerForDraggedIconView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  objc_msgSend(a3, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView layoutMetricsForModel:](self, "layoutMetricsForModel:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gridCellInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBIconListView iconGridRangeForGridCellIndex:metrics:options:](self, "iconGridRangeForGridCellIndex:metrics:options:", objc_msgSend(v7, "gridCellIndexForIconIndex:", objc_msgSend(v5, "indexForIcon:", v4)), v6, 0);
  -[SBIconListView fullRectForGridRange:metrics:](self, "fullRectForGridRange:metrics:", v8, v9, v6);
  UIRectGetCenter();
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)clearDraggedIconViews
{
  NSMutableSet *v3;
  NSMutableSet *draggingIconViews;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = self->_draggingIconViews;
  draggingIconViews = self->_draggingIconViews;
  self->_draggingIconViews = 0;

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "icon", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v11
          || (-[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", v11),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v12,
              v12 != v10))
        {
          -[SBIconListView removeIconView:force:](self, "removeIconView:force:", v10, 1);
        }

      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[SBIconListView setCanceledDraggingIconView:](self, "setCanceledDraggingIconView:", 0);
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[SBIconListView iconLocation](self, "iconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[SBIconListView iconLocation](self, "iconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[SBIconListView iconLocation](self, "iconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if ((v9 & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  -[SBIconListView iconLocation](self, "iconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  -[SBIconListView iconLocation](self, "iconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "containsObject:", v8);

  if (v9)
  {
    -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 != 0;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  SBIconListView *v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  -[SBIconListView iconLocation](self, "iconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_msgSend(v6, "superview");
    v10 = (SBIconListView *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == self;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a4;
  -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7[2](v7, v6);

}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *, _BYTE *))a3;
  -[SBIconListView icons](self, "icons");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        -[SBIconListView displayedIconViewForIcon:](self, "displayedIconViewForIcon:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = 0;
          v4[2](v4, v10, &v11);
          if (v11)
          {

            goto LABEL_12;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBIconListView succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIconListView descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  int64_t orientation;
  const __CFString *v12;
  id v13;
  int64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id WeakRetained;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  unint64_t column;
  id v37;
  id v38;
  void *v39;
  id v40;
  NSRange v42;
  NSRange v43;

  -[SBIconListView succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView frame](self, "frame");
  v5 = (id)objc_msgSend(v4, "appendRect:withName:", CFSTR("frame"));
  -[SBIconListView model](self, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("model"));

  -[SBIconListView temporaryModel](self, "temporaryModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v8, CFSTR("temporaryModel"), 1);

  v10 = (id)objc_msgSend(v4, "appendObject:withName:", self->_iconLocation, CFSTR("iconLocation"));
  orientation = self->_orientation;
  switch(orientation)
  {
    case 1:
      v12 = CFSTR("UIInterfaceOrientationPortrait");
      break;
    case 3:
      v12 = CFSTR("UIInterfaceOrientationLandscapeRight");
      break;
    case 4:
      v12 = CFSTR("UIInterfaceOrientationLandscapeLeft");
      break;
    case 2:
      v12 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
      break;
    default:
      v12 = 0;
      break;
  }
  v13 = (id)objc_msgSend(v4, "appendObject:withName:", v12, CFSTR("orientation"));
  v14 = -[SBIconListView layoutOrientation](self, "layoutOrientation");
  if (v14 != self->_orientation)
  {
    v15 = CFSTR("UIInterfaceOrientationLandscapeRight");
    v16 = CFSTR("UIInterfaceOrientationLandscapeLeft");
    v17 = CFSTR("UIInterfaceOrientationPortraitUpsideDown");
    if (v14 != 2)
      v17 = 0;
    if (v14 != 4)
      v16 = v17;
    if (v14 != 3)
      v15 = v16;
    if (v14 == 1)
      v18 = CFSTR("UIInterfaceOrientationPortrait");
    else
      v18 = v15;
    v19 = (id)objc_msgSend(v4, "appendObject:withName:", v18, CFSTR("layoutOrientation"));
  }
  v20 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", CFSTR("iconContentScale"), 2, self->_iconContentScale);
  v21 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBIconListView iconRowsForCurrentOrientation](self, "iconRowsForCurrentOrientation"), CFSTR("iconRowsForCurrentOrientation"));
  v22 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", -[SBIconListView iconColumnsForCurrentOrientation](self, "iconColumnsForCurrentOrientation"), CFSTR("iconColumnsForCurrentOrientation"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  v24 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", WeakRetained, CFSTR("layoutDelegate"), 1);

  v25 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_needsLayout, CFSTR("needsLayout"), 1);
  v26 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_inLayout, CFSTR("inLayout"), 1);
  v27 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_performingSpecialIconAnimations, CFSTR("performingSpecialIconAnimations"), 1);
  v28 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_rotating, CFSTR("rotating"), 1);
  v29 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_layoutReversed, CFSTR("layoutReversed"), 1);
  v30 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_purged, CFSTR("purged"), 1);
  v31 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", self->_alignsIconsOnPixelBoundaries, CFSTR("alignsIconsOnPixelBoundaries"), 0);
  v42.location = -[SBIconListView visibleColumnRange](self, "visibleColumnRange");
  NSStringFromRange(v42);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (id)objc_msgSend(v4, "appendObject:withName:", v32, CFSTR("visibleColumns"));

  v43.location = -[SBIconListView visibleRowRange](self, "visibleRowRange");
  NSStringFromRange(v43);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (id)objc_msgSend(v4, "appendObject:withName:", v34, CFSTR("visibleRows"));

  column = self->_predictedVisibleColumn.column;
  if (column != 0x7FFFFFFFFFFFFFFFLL)
  {
    v37 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", column, CFSTR("predictedVisibleColumn"));
    v38 = (id)objc_msgSend(v4, "appendFloat:withName:", CFSTR("predictedVisibleColumnConfidence"), self->_predictedVisibleColumn.confidence);
  }
  -[SBIconListView currentIconLocationTransitionHandler](self, "currentIconLocationTransitionHandler");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v39, CFSTR("currentIconLocationTransitionHandler"), 1);

  return v4;
}

- (void)_setupStateCaptureHandleIfNeeded
{
  id v3;
  BSInvalidatable *v4;
  BSInvalidatable *stateCaptureHandle;
  id v6;
  id location;

  if (!self->_stateCaptureHandle)
  {
    objc_initWeak(&location, self);
    v3 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v6, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    stateCaptureHandle = self->_stateCaptureHandle;
    self->_stateCaptureHandle = v4;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

__CFString *__50__SBIconListView__setupStateCaptureHandleIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_stateCaptureString");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = CFSTR("nil");
  }

  return v3;
}

- (id)_stateCaptureString
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  -[SBIconListView descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", &stru_1E8D8E958);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__SBIconListView__stateCaptureString__block_invoke;
  v7[3] = &unk_1E8D87340;
  v8 = v3;
  v4 = v3;
  -[SBIconListView enumerateIconViewsUsingBlock:](self, "enumerateIconViewsUsingBlock:", v7);
  objc_msgSend(v4, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __37__SBIconListView__stateCaptureString__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__SBIconListView__stateCaptureString__block_invoke_2;
  v9[3] = &unk_1E8D84EF0;
  v10 = v7;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", 0, 0, v9);
  *a4 = 1;

}

void __37__SBIconListView__stateCaptureString__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendString:withName:", v4, CFSTR("Display Name"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "listLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("List Layout"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_labelHidingReason");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:withName:", v9, CFSTR("Label Hiding Reason"));

}

- (void)_teardownStateCapture
{
  BSInvalidatable *stateCaptureHandle;
  BSInvalidatable *v4;

  stateCaptureHandle = self->_stateCaptureHandle;
  if (stateCaptureHandle)
  {
    -[BSInvalidatable invalidate](stateCaptureHandle, "invalidate");
    v4 = self->_stateCaptureHandle;
    self->_stateCaptureHandle = 0;

  }
}

- (BOOL)isPurged
{
  return self->_purged;
}

- (void)setPurged:(BOOL)a3
{
  self->_purged = a3;
}

- (unint64_t)automaticallyReversedLayoutOrientations
{
  return self->_automaticallyReversedLayoutOrientations;
}

- (void)setAdjustsColumnPositionsForFullScreenWidth:(BOOL)a3
{
  self->_adjustsColumnPositionsForFullScreenWidth = a3;
}

- (void)setIconViewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_iconViewProvider, a3);
}

- (int64_t)iconSpacingAxisMatchingBehavior
{
  return self->_iconSpacingAxisMatchingBehavior;
}

- (void)setBoundsSizeTracksContentSize:(BOOL)a3
{
  self->_boundsSizeTracksContentSize = a3;
}

- (BOOL)isDragSpringloadingEnabled
{
  return self->_dragSpringloadingEnabled;
}

- (void)setDragSpringloadingEnabled:(BOOL)a3
{
  self->_dragSpringloadingEnabled = a3;
}

- (SBIconListViewDragDelegate)dragDelegate
{
  return (SBIconListViewDragDelegate *)objc_loadWeakRetained((id *)&self->_dragDelegate);
}

- (BOOL)allowsReordering
{
  return self->_allowsReordering;
}

- (SBIconListViewReorderingDelegate)reorderingDelegate
{
  return (SBIconListViewReorderingDelegate *)objc_loadWeakRetained((id *)&self->_reorderingDelegate);
}

- (void)setReorderingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_reorderingDelegate, a3);
}

- (void)setIconDragTypeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 768);
}

- (BOOL)wantsFastIconReordering
{
  return self->_wantsFastIconReordering;
}

- (void)setWantsFastIconReordering:(BOOL)a3
{
  self->_wantsFastIconReordering = a3;
}

- (BOOL)isOccluded
{
  return self->_occluded;
}

- (BOOL)showsEmptyGridCells
{
  return self->_showsEmptyGridCells;
}

- (BOOL)automaticallyShowsEmptyGridCellsWhileEditing
{
  return self->_automaticallyShowsEmptyGridCellsWhileEditing;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (SBHIconImageStyleConfiguration)overrideIconImageStyleConfiguration
{
  return self->_overrideIconImageStyleConfiguration;
}

- (void)setCurrentIconLocationTransitionHandler:(id)a3
{
  objc_storeStrong((id *)&self->_currentIconLocationTransitionHandler, a3);
}

- (SBIconWidgetIntroductionDelegate)widgetIntroductionDelegate
{
  return (SBIconWidgetIntroductionDelegate *)objc_loadWeakRetained((id *)&self->_widgetIntroductionDelegate);
}

- (void)setWidgetIntroductionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetIntroductionDelegate, a3);
}

- (SBIconWidgetIntroductionView)pronouncedContainerView
{
  return self->_pronouncedContainerView;
}

- (void)setPronouncedContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_pronouncedContainerView, a3);
}

- (SBIconWidgetIntroductionPopoverView)widgetIntroductionPopover
{
  return self->_widgetIntroductionPopover;
}

- (void)setWidgetIntroductionPopover:(id)a3
{
  objc_storeStrong((id *)&self->_widgetIntroductionPopover, a3);
}

- (NSLayoutConstraint)widgetIntroductionPopoverTopAnchorConstraint
{
  return self->_widgetIntroductionPopoverTopAnchorConstraint;
}

- (void)setWidgetIntroductionPopoverTopAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widgetIntroductionPopoverTopAnchorConstraint, a3);
}

- (NSLayoutConstraint)widgetIntroductionPopoverLeadingAnchorConstraint
{
  return self->_widgetIntroductionPopoverLeadingAnchorConstraint;
}

- (void)setWidgetIntroductionPopoverLeadingAnchorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widgetIntroductionPopoverLeadingAnchorConstraint, a3);
}

- (BOOL)isWidgetIntroductionVertical
{
  return self->_isWidgetIntroductionVertical;
}

- (void)setIsWidgetIntroductionVertical:(BOOL)a3
{
  self->_isWidgetIntroductionVertical = a3;
}

- (SBFolder)temporaryFolder
{
  return self->_temporaryFolder;
}

- (void)setTemporaryFolder:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryFolder, a3);
}

- (void)setTemporaryModel:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryModel, a3);
}

- (NSString)iconLocationWithoutWidgets
{
  return self->_iconLocationWithoutWidgets;
}

- (void)setIconLocationWithoutWidgets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 880);
}

- (NSString)iconLocationWithWidgets
{
  return self->_iconLocationWithWidgets;
}

- (void)setIconLocationWithWidgets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 888);
}

- (SBIconView)canceledDraggingIconView
{
  return self->_canceledDraggingIconView;
}

- (void)setCanceledDraggingIconView:(id)a3
{
  objc_storeStrong((id *)&self->_canceledDraggingIconView, a3);
}

- (SBIcon)extraIconForFolderCollapseSpecialIconAnimation
{
  return self->_extraIconForFolderCollapseSpecialIconAnimation;
}

- (void)setExtraIconForFolderCollapseSpecialIconAnimation:(id)a3
{
  objc_storeStrong((id *)&self->_extraIconForFolderCollapseSpecialIconAnimation, a3);
}

- (BOOL)hasSetIconSpacingAxisMatchingBehavior
{
  return self->_hasSetIconSpacingAxisMatchingBehavior;
}

- (void)setHasSetIconSpacingAxisMatchingBehavior:(BOOL)a3
{
  self->_hasSetIconSpacingAxisMatchingBehavior = a3;
}

- (void)setDisplayedModel:(id)a3
{
  objc_storeStrong((id *)&self->_displayedModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedModel, 0);
  objc_storeStrong((id *)&self->_extraIconForFolderCollapseSpecialIconAnimation, 0);
  objc_storeStrong((id *)&self->_canceledDraggingIconView, 0);
  objc_storeStrong((id *)&self->_iconLocationWithWidgets, 0);
  objc_storeStrong((id *)&self->_iconLocationWithoutWidgets, 0);
  objc_storeStrong((id *)&self->_temporaryModel, 0);
  objc_storeStrong((id *)&self->_temporaryFolder, 0);
  objc_storeStrong((id *)&self->_widgetIntroductionPopoverLeadingAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_widgetIntroductionPopoverTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_widgetIntroductionPopover, 0);
  objc_storeStrong((id *)&self->_pronouncedContainerView, 0);
  objc_destroyWeak((id *)&self->_widgetIntroductionDelegate);
  objc_storeStrong((id *)&self->_currentIconLocationTransitionHandler, 0);
  objc_storeStrong((id *)&self->_overrideIconImageStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_iconDragTypeIdentifier, 0);
  objc_destroyWeak((id *)&self->_reorderingDelegate);
  objc_destroyWeak((id *)&self->_dragDelegate);
  objc_storeStrong((id *)&self->_iconLocation, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_layoutProvider, 0);
  objc_storeStrong((id *)&self->_stateCaptureHandle, 0);
  objc_storeStrong((id *)&self->_iconEditingSettings, 0);
  objc_storeStrong((id *)&self->_iconSettings, 0);
  objc_storeStrong((id *)&self->_wrappingFocusGuideViews, 0);
  objc_storeStrong((id *)&self->_cachedMetrics, 0);
  objc_storeStrong((id *)&self->_overridingLayoutDelegates, 0);
  objc_storeStrong((id *)&self->_layoutObservers, 0);
  objc_storeStrong((id *)&self->_reorderingManager, 0);
  objc_storeStrong((id *)&self->_draggingDelegate, 0);
  objc_storeStrong((id *)&self->_emptyGridCells, 0);
  objc_storeStrong((id *)&self->_draggingIconViews, 0);
  objc_storeStrong((id *)&self->_iconsToCaptureOnlyBackgroundAssertions, 0);
  objc_storeStrong((id *)&self->_groupNamesToCaptureOnlyBackgroundViews, 0);
  objc_storeStrong((id *)&self->_layoutHidingAssertions, 0);
  objc_storeStrong((id *)&self->_placeholderAssertions, 0);
  objc_storeStrong((id *)&self->_iconVisibilityAssertions, 0);
  objc_storeStrong((id *)&self->_pausedLayoutAssertionsForIconViews, 0);
  objc_storeStrong((id *)&self->_specialIconAnimations, 0);
  objc_storeStrong((id *)&self->_iconViews, 0);
  objc_storeStrong((id *)&self->_removedIcons, 0);
}

- (void)performCollapseFolderWithContainedIconSpecialIconAnimationWithIcon:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "No extra icon found for collapsing folder special animation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)originForIcon:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, v0, v1, "Can't return an origin for icon not in this list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)iconViewForIcon:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1CFEF3000, a2, v4, "Configuring icon view for icon %@", v5);

  OUTLINED_FUNCTION_5_2();
}

void __59__SBIconListView_layoutIconsIfNeededUsingAnimator_options___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1CFEF3000, a2, v4, "Removing icon view from screen for icon %@", v5);

  OUTLINED_FUNCTION_5_2();
}

- (void)setVisibleColumnRange:predictedVisibleColumn:visibleRowRange:predictedVisibleRow:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1CFEF3000, v0, v1, "%p: No change in visible column range; skipping work.", v2);
  OUTLINED_FUNCTION_3();
}

@end
