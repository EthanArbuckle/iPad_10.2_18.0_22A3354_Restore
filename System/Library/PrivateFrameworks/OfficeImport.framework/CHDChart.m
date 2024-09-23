@implementation CHDChart

- (CHDChart)init
{
  uint64_t v3;
  CHDChart *v4;
  CHDChart *v5;
  CHDPlotArea *v6;
  CHDPlotArea *mPlotArea;
  NSMutableArray *v8;
  NSMutableArray *mDrawables;
  CHDDefaultTextProperties *v10;
  CHDDefaultTextProperties *mDefaultTextProperties;
  OADThemeOverrides *mThemeOverrides;
  objc_super v14;

  v3 = objc_opt_class();
  v14.receiver = self;
  v14.super_class = (Class)CHDChart;
  v4 = -[OADDrawable initWithPropertiesClass:](&v14, sel_initWithPropertiesClass_, v3);
  v5 = v4;
  if (v4)
  {
    v4->mStyleId = -1;
    v6 = -[CHDPlotArea initWithChart:]([CHDPlotArea alloc], "initWithChart:", v4);
    mPlotArea = v5->mPlotArea;
    v5->mPlotArea = v6;

    v5->mAutoTitleDeleted = 1;
    v5->mPlotVisibleCellsOnly = 0;
    v5->mMSGraph = 0;
    v5->mHasSharedXValues = 0;
    v5->mDirectionChanged = 0;
    v5->mHasVisibleSeriesNames = 0;
    v5->mDisplayBlankCellsAs = 2;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mDrawables = v5->mDrawables;
    v5->mDrawables = v8;

    v10 = objc_alloc_init(CHDDefaultTextProperties);
    mDefaultTextProperties = v5->mDefaultTextProperties;
    v5->mDefaultTextProperties = v10;

    v5->mChartDirection = 0;
    mThemeOverrides = v5->mThemeOverrides;
    v5->mThemeOverrides = 0;

  }
  return v5;
}

- (void)setSheet:(id)a3
{
  objc_storeStrong((id *)&self->mSheet, a3);
}

- (void)setStyleId:(int)a3
{
  self->mStyleId = a3;
}

- (BOOL)isBinary
{
  return self->mStyleId == 0;
}

- (void)setLogicalBounds:(CGRect)a3
{
  self->mLogicalBounds = a3;
}

+ (id)binaryEffects:(BOOL)a3
{
  OADOuterShadowEffect *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;

  if (a3)
  {
    v3 = objc_alloc_init(OADOuterShadowEffect);
    +[OADRgbColor black](OADRgbColor, "black");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShadowEffect setColor:](v3, "setColor:", v4);

    LODWORD(v5) = 1110704128;
    -[OADShadowEffect setAngle:](v3, "setAngle:", v5);
    LODWORD(v6) = 3.0;
    -[OADShadowEffect setDistance:](v3, "setDistance:", v6);
    LODWORD(v7) = 0;
    -[OADShadowEffect setBlurRadius:](v3, "setBlurRadius:", v7);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)setChartAreaGraphicProperties:(id)a3
{
  OADGraphicProperties *v5;
  OADGraphicProperties *v6;

  v5 = (OADGraphicProperties *)a3;
  if (self->mChartAreaGraphicProperties != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mChartAreaGraphicProperties, a3);
    v5 = v6;
  }

}

- (void)setPlotVisibleCellsOnly:(BOOL)a3
{
  self->mPlotVisibleCellsOnly = a3;
}

- (void)setDisplayBlankAs:(int)a3
{
  self->mDisplayBlankCellsAs = a3;
}

- (id)defaultTextProperties
{
  return self->mDefaultTextProperties;
}

- (id)plotArea
{
  return self->mPlotArea;
}

- (void)setSideWallGraphicProperties:(id)a3
{
  OADGraphicProperties *v5;
  OADGraphicProperties *v6;

  v5 = (OADGraphicProperties *)a3;
  if (self->mSideWallGraphicProperties != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mSideWallGraphicProperties, a3);
    v5 = v6;
  }

}

- (void)setBackWallGraphicProperties:(id)a3
{
  OADGraphicProperties *v5;
  OADGraphicProperties *v6;

  v5 = (OADGraphicProperties *)a3;
  if (self->mBackWallGraphicProperties != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mBackWallGraphicProperties, a3);
    v5 = v6;
  }

}

- (void)setFloorGraphicProperties:(id)a3
{
  OADGraphicProperties *v5;
  OADGraphicProperties *v6;

  v5 = (OADGraphicProperties *)a3;
  if (self->mFloorGraphicProperties != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mFloorGraphicProperties, a3);
    v5 = v6;
  }

}

- (void)setView3D:(id)a3
{
  CHDView3D *v5;
  CHDView3D *v6;

  v5 = (CHDView3D *)a3;
  if (self->mView3D != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mView3D, a3);
    v5 = v6;
  }

}

- (id)processors
{
  return -[EDSheet processors](self->mSheet, "processors");
}

- (id)legend
{
  return self->mLegend;
}

- (int)direction
{
  return self->mChartDirection;
}

- (void)setPlotArea:(id)a3
{
  CHDPlotArea *v5;
  CHDPlotArea *v6;

  v5 = (CHDPlotArea *)a3;
  if (self->mPlotArea != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mPlotArea, a3);
    v5 = v6;
  }

}

- (void)setTitle:(id)a3
{
  CHDTitle *v5;
  CHDTitle *v6;

  v5 = (CHDTitle *)a3;
  if (self->mTitle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mTitle, a3);
    v5 = v6;
  }

}

- (void)setAutoTitleDeleted:(BOOL)a3
{
  self->mAutoTitleDeleted = a3;
}

- (BOOL)isMSGraph
{
  return self->mMSGraph;
}

- (void)setDirection:(int)a3
{
  self->mChartDirection = a3;
}

- (id)mainType
{
  void *v2;
  void *v3;
  void *v4;

  -[CHDChart plotArea](self, "plotArea");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chartTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)title
{
  return self->mTitle;
}

- (id)chartAreaGraphicProperties
{
  return self->mChartAreaGraphicProperties;
}

- (void)addChild:(id)a3
{
  id v4;

  v4 = a3;
  if (v4)
  {
    -[NSMutableArray addObject:](self->mDrawables, "addObject:", v4);
    objc_msgSend(v4, "setParent:", self);
  }

}

- (void)setParentTextListStyle:(id)a3
{
  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->mDrawables, "makeObjectsPerformSelector:withObject:", sel_setParentTextListStyle_, a3);
}

- (void)setLegend:(id)a3
{
  CHDLegend *v5;
  CHDLegend *v6;

  v5 = (CHDLegend *)a3;
  if (self->mLegend != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mLegend, a3);
    v5 = v6;
  }

}

- (void)setDirectionChanged:(BOOL)a3
{
  self->mDirectionChanged = a3;
}

- (unint64_t)defaultFontIndex
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  -[EDKeyedCollection objectWithKey:](self->mDefaultTextProperties, "objectWithKey:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && (objc_msgSend(v2, "runs"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v4, v4))
  {
    objc_msgSend(v3, "runs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fontIndex");

  }
  else
  {
    v7 = -1;
  }

  return v7;
}

- (int)styleId
{
  return self->mStyleId;
}

- (id)styleMatrix
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[CHDChart workbook](self, "workbook");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "theme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "baseStyles");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "styleMatrix");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)workbook
{
  return -[EDSheet workbook](self->mSheet, "workbook");
}

- (BOOL)is3D
{
  void *v2;
  char v3;

  -[CHDChart mainType](self, "mainType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend((id)objc_opt_class(), "is3DType");

  return v3;
}

- (BOOL)isPie
{
  void *v2;
  char isKindOfClass;

  -[CHDChart mainType](self, "mainType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (unint64_t)seriesCount
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;

  -[CHDChart plotArea](self, "plotArea");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chartTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 += objc_msgSend(v7, "seriesCount");

      ++v5;
    }
    while (v4 != v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setExternalData:(id)a3
{
  EDWorkbook *v5;
  EDWorkbook *v6;

  v5 = (EDWorkbook *)a3;
  if (self->mExternalData != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mExternalData, a3);
    v5 = v6;
  }

}

- (id)view3D
{
  return self->mView3D;
}

- (BOOL)isDirectionChanged
{
  return self->mDirectionChanged;
}

- (unint64_t)categoryCount
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  -[CHDChart plotArea](self, "plotArea");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chartTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "categoryCount");

      if (v8 > v6)
        v6 = v8;
      ++v5;
    }
    while (v4 != v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)sheet
{
  return self->mSheet;
}

- (BOOL)isAutoTitleDeleted
{
  return self->mAutoTitleDeleted;
}

- (BOOL)isPlotVisibleCellsOnly
{
  return self->mPlotVisibleCellsOnly;
}

- (int)displayBlankAs
{
  return self->mDisplayBlankCellsAs;
}

- (id)externalData
{
  return self->mExternalData;
}

- (id)backWallGraphicProperties
{
  return self->mBackWallGraphicProperties;
}

- (id)sideWallGraphicProperties
{
  return self->mSideWallGraphicProperties;
}

- (id)floorGraphicProperties
{
  return self->mFloorGraphicProperties;
}

- (void)setDefaultTextProperties:(id)a3
{
  CHDDefaultTextProperties *v5;
  CHDDefaultTextProperties *v6;

  v5 = (CHDDefaultTextProperties *)a3;
  if (self->mDefaultTextProperties != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->mDefaultTextProperties, a3);
    v5 = v6;
  }

}

- (CGRect)logicalBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->mLogicalBounds.origin.x;
  y = self->mLogicalBounds.origin.y;
  width = self->mLogicalBounds.size.width;
  height = self->mLogicalBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)childCount
{
  return -[NSMutableArray count](self->mDrawables, "count");
}

- (void)addChildren:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "count");
  if (v4)
  {
    v5 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setParent:", self);

      ++v5;
    }
    while (v4 != v5);
  }
  -[NSMutableArray addObjectsFromArray:](self->mDrawables, "addObjectsFromArray:", v7);

}

- (id)childAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->mDrawables, "objectAtIndex:", a3);
}

- (id)children
{
  return self->mDrawables;
}

- (id)themeOverrides
{
  return self->mThemeOverrides;
}

- (void)setThemeOverrides:(id)a3
{
  objc_storeStrong((id *)&self->mThemeOverrides, a3);
}

- (void)replaceChild:(id)a3 with:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = -[NSMutableArray indexOfObjectIdenticalTo:](self->mDrawables, "indexOfObjectIdenticalTo:", v8);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "setParent:", 0);
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->mDrawables, "replaceObjectAtIndex:withObject:", v7, v6);
    objc_msgSend(v6, "setParent:", self);
  }

}

- (void)removeChild:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = -[NSMutableArray indexOfObjectIdenticalTo:](self->mDrawables, "indexOfObjectIdenticalTo:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "setParent:", 0);
    -[NSMutableArray removeObjectAtIndex:](self->mDrawables, "removeObjectAtIndex:", v4);
  }

}

- (void)changeParentTextListStylePreservingEffectiveValues:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->mDrawables;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "changeParentTextListStylePreservingEffectiveValues:", v4, (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)defaultThemeFont
{
  EDWorkbook *v3;
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

  v3 = self->mExternalData;
  if (v3 || (-[CHDChart workbook](self, "workbook"), (v3 = (EDWorkbook *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[OCDDocument theme](v3, "theme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "baseStyles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontScheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "minorFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "latinFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[EDWorkbook resources](v3, "resources");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDFont fontWithResources:](EDFont, "fontWithResources:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v10, "setName:", v8);
    objc_msgSend(v10, "setHeight:", 200.0);
    +[OADSchemeColor schemeColorWithIndex:](OADSchemeColor, "schemeColorWithIndex:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[OCDDocument theme](v3, "theme");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "baseStyles");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "colorScheme");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDWorkbook resources](v3, "resources");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colors");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[OADColor tsuColorWithColor:colorMap:colorScheme:colorPalette:](OADColor, "tsuColorWithColor:colorMap:colorScheme:colorPalette:", v11, 0, v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      +[OITSUColor blackColor](OITSUColor, "blackColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v10, "setColor:", v17);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)defaultTextFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[EDKeyedCollection objectWithKey:](self->mDefaultTextProperties, "objectWithKey:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "runs"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(v4, "runs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "font");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CHDChart defaultThemeFont](self, "defaultThemeFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)defaultDataLabelFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[EDKeyedCollection objectWithKey:](self->mDefaultTextProperties, "objectWithKey:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "runs"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    -[CHDChart defaultTextFont](self, "defaultTextFont");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = (void *)v10;
    goto LABEL_7;
  }
  objc_msgSend(v4, "runs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CHDChart defaultThemeFont](self, "defaultThemeFont");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v4, "runs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

- (id)defaultSeriesTitleFont
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[EDKeyedCollection objectWithKey:](self->mDefaultTextProperties, "objectWithKey:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3 || (objc_msgSend(v3, "runs"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, !v5))
  {
    -[CHDChart defaultTextFont](self, "defaultTextFont");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v9 = (void *)v10;
    goto LABEL_7;
  }
  objc_msgSend(v4, "runs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[CHDChart defaultThemeFont](self, "defaultThemeFont");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v4, "runs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "font");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v9;
}

- (id)defaultContentFormat
{
  void *v2;
  void *v3;
  void *v4;

  -[EDKeyedCollection objectWithKey:](self->mDefaultTextProperties, "objectWithKey:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "contentFormat");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)defaultFontWithResources:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;

  objc_msgSend(a3, "fonts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (v5 = -[CHDChart defaultFontIndex](self, "defaultFontIndex"), v5 == -1))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (int)defaultLabelPosition
{
  void *v2;
  void *v3;
  int v4;

  -[EDKeyedCollection objectWithKey:](self->mDefaultTextProperties, "objectWithKey:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "labelPosition");
  else
    v4 = 0;

  return v4;
}

- (BOOL)isArea
{
  void *v2;
  char isKindOfClass;

  -[CHDChart mainType](self, "mainType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)supportsMarkers
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[CHDChart mainType](self, "mainType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    -[CHDChart mainType](self, "mainType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (BOOL)isScatterOrBubble
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[CHDChart mainType](self, "mainType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    -[CHDChart mainType](self, "mainType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

- (void)setMSGraph:(BOOL)a3
{
  self->mMSGraph = a3;
}

- (BOOL)hasSharedXValues
{
  return self->mHasSharedXValues;
}

- (void)setHasSharedXValues:(BOOL)a3
{
  self->mHasSharedXValues = a3;
}

- (BOOL)hasVisibleSeriesNames
{
  return self->mHasVisibleSeriesNames;
}

- (void)setVisibleSeriesNames:(BOOL)a3
{
  self->mHasVisibleSeriesNames = a3;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CHDChart;
  -[OADGraphic description](&v3, sel_description);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mThemeOverrides, 0);
  objc_storeStrong((id *)&self->mDrawables, 0);
  objc_storeStrong((id *)&self->mDefaultTextProperties, 0);
  objc_storeStrong((id *)&self->mFloorGraphicProperties, 0);
  objc_storeStrong((id *)&self->mSideWallGraphicProperties, 0);
  objc_storeStrong((id *)&self->mBackWallGraphicProperties, 0);
  objc_storeStrong((id *)&self->mChartAreaGraphicProperties, 0);
  objc_storeStrong((id *)&self->mExternalData, 0);
  objc_storeStrong((id *)&self->mLegend, 0);
  objc_storeStrong((id *)&self->mTitle, 0);
  objc_storeStrong((id *)&self->mView3D, 0);
  objc_storeStrong((id *)&self->mPlotArea, 0);
  objc_storeStrong((id *)&self->mSheet, 0);
}

@end
