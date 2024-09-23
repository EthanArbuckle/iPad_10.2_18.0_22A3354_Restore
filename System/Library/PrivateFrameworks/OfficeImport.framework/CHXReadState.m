@implementation CHXReadState

- (CHXReadState)initWithDrawingState:(id)a3
{
  id v5;
  CHXReadState *v6;
  CHXReadState *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHXReadState;
  v6 = -[CHXReadState init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->mDrawingState, a3);

  return v7;
}

- (id)drawingState
{
  return self->mDrawingState;
}

- (id)chart
{
  return self->mChart;
}

- (void)setChart:(id)a3
{
  CHDChart *v5;
  OADDrawingTheme *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  OADDrawingTheme *v11;
  CHAutoStyling *v12;
  CHAutoStyling *mAutoStyling;
  CHDChart *v14;

  v5 = (CHDChart *)a3;
  if (self->mChart != v5)
  {
    v14 = v5;
    objc_storeStrong((id *)&self->mChart, a3);
    v6 = [OADDrawingTheme alloc];
    -[OAXDrawingState styleMatrix](self->mDrawingState, "styleMatrix");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[OAXDrawingState fontScheme](self->mDrawingState, "fontScheme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[OAXDrawingState colorScheme](self->mDrawingState, "colorScheme");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[OAXDrawingState colorMap](self->mDrawingState, "colorMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[OADDrawingTheme initWithStyleMatrix:fontScheme:colorScheme:colorMap:colorPalette:](v6, "initWithStyleMatrix:fontScheme:colorScheme:colorMap:colorPalette:", v7, v8, v9, v10, 0);

    +[CHAutoStyling autoStylingWithChart:drawingTheme:](CHAutoStyling, "autoStylingWithChart:drawingTheme:", v14, v11);
    v12 = (CHAutoStyling *)objc_claimAutoreleasedReturnValue();
    mAutoStyling = self->mAutoStyling;
    self->mAutoStyling = v12;

    v5 = v14;
  }

}

- (id)resources
{
  return self->mResources;
}

- (void)setResources:(id)a3
{
  EDResources *v5;
  EDResources **p_mResources;
  EDResources *mResources;
  EDResources *v8;

  v5 = (EDResources *)a3;
  mResources = self->mResources;
  p_mResources = &self->mResources;
  if (mResources != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mResources, a3);
    v5 = v8;
  }

}

- (id)chartPart
{
  return self->mChartPart;
}

- (void)setChartPart:(id)a3
{
  OCPPackagePart *v5;
  OCPPackagePart **p_mChartPart;
  OCPPackagePart *mChartPart;
  OCPPackagePart *v8;

  v5 = (OCPPackagePart *)a3;
  mChartPart = self->mChartPart;
  p_mChartPart = &self->mChartPart;
  if (mChartPart != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mChartPart, a3);
    v5 = v8;
  }

}

- (id)currentChartType
{
  return self->mCurrentChartType;
}

- (void)setCurrentChartType:(id)a3
{
  CHDChartType *v5;
  CHDChartType **p_mCurrentChartType;
  CHDChartType *mCurrentChartType;
  CHDChartType *v8;

  v5 = (CHDChartType *)a3;
  mCurrentChartType = self->mCurrentChartType;
  p_mCurrentChartType = &self->mCurrentChartType;
  if (mCurrentChartType != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mCurrentChartType, a3);
    v5 = v8;
  }

}

- (id)currentSeries
{
  return self->mCurrentSeries;
}

- (void)setCurrentSeries:(id)a3
{
  CHDSeries *v5;
  CHDSeries **p_mCurrentSeries;
  CHDSeries *mCurrentSeries;
  CHDSeries *v8;

  v5 = (CHDSeries *)a3;
  mCurrentSeries = self->mCurrentSeries;
  p_mCurrentSeries = &self->mCurrentSeries;
  if (mCurrentSeries != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mCurrentSeries, a3);
    v5 = v8;
  }

}

- (id)exState
{
  return -[EXOfficeArtState excelState](self->mDrawingState, "excelState");
}

- (id)defaultTextProperties
{
  return self->mDefaultTextProperties;
}

- (void)setDefaultTextProperties:(id)a3
{
  OADParagraphProperties *v5;
  OADParagraphProperties **p_mDefaultTextProperties;
  OADParagraphProperties *mDefaultTextProperties;
  OADParagraphProperties *v8;

  v5 = (OADParagraphProperties *)a3;
  mDefaultTextProperties = self->mDefaultTextProperties;
  p_mDefaultTextProperties = &self->mDefaultTextProperties;
  if (mDefaultTextProperties != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mDefaultTextProperties, a3);
    v5 = v8;
  }

}

- (void)setDefaultTextPropertiesHaveExplicitFontSize:(BOOL)a3
{
  self->mDefaultTextPropertiesHaveExplicitFontSize = a3;
}

- (void)pushTitleTextProperties:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  float v6;
  OADParagraphProperties *v7;

  v3 = a3;
  v7 = objc_alloc_init(OADParagraphProperties);
  -[OADProperties setMergedWithParent:](self->mDefaultTextProperties, "setMergedWithParent:", 0);
  if (!-[OADCharacterProperties hasIsBold](self->mDefaultTextProperties, "hasIsBold"))
    -[OADCharacterProperties setIsBold:](v7, "setIsBold:", 1);
  -[OADProperties setMergedWithParent:](self->mDefaultTextProperties, "setMergedWithParent:", 1);
  if (v3)
  {
    if (self->mDefaultTextPropertiesHaveExplicitFontSize)
    {
      -[OADCharacterProperties size](self->mDefaultTextProperties, "size");
      v5 = v6 * 1.2;
      *(float *)&v5 = v5;
    }
    else
    {
      LODWORD(v5) = 18.0;
    }
    -[OADCharacterProperties setSize:](v7, "setSize:", v5);
  }
  -[OADProperties setParent:](v7, "setParent:", self->mDefaultTextProperties);
  -[CHXReadState setDefaultTextProperties:](self, "setDefaultTextProperties:", v7);

}

- (void)popTitleTextProperties
{
  id v3;

  -[OADProperties parent](self->mDefaultTextProperties, "parent");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CHXReadState setDefaultTextProperties:](self, "setDefaultTextProperties:");

}

- (void)pushDefaultTextProperties:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setParent:", self->mDefaultTextProperties);
  -[CHXReadState setDefaultTextProperties:](self, "setDefaultTextProperties:", v4);

}

- (void)popDefaultTextProperties
{
  id v3;

  -[OADProperties parent](self->mDefaultTextProperties, "parent");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CHXReadState setDefaultTextProperties:](self, "setDefaultTextProperties:");

}

- (id)autoStyling
{
  return self->mAutoStyling;
}

- (BOOL)ignoreFormulas
{
  return self->mIgnoreFormulas;
}

- (void)setIgnoreFormulas:(BOOL)a3
{
  self->mIgnoreFormulas = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mAutoStyling, 0);
  objc_storeStrong((id *)&self->mDefaultTextProperties, 0);
  objc_storeStrong((id *)&self->mCurrentSeries, 0);
  objc_storeStrong((id *)&self->mCurrentChartType, 0);
  objc_storeStrong((id *)&self->mChartPart, 0);
  objc_storeStrong((id *)&self->mResources, 0);
  objc_storeStrong((id *)&self->mChart, 0);
  objc_storeStrong((id *)&self->mDrawingState, 0);
}

@end
