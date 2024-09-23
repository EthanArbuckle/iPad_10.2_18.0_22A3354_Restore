@implementation EMChartMapper

- (EMChartMapper)initWithChart:(id)a3 parent:(id)a4
{
  id v7;
  EMChartMapper *v8;
  EMChartMapper *v9;

  v7 = a3;
  v8 = -[CMMapper initWithParent:](self, "initWithParent:", a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->mChart, a3);

  return v9;
}

- (id)copyPdfWithState:(id)a3 withSize:(CGSize)a4
{
  double height;
  double width;
  EDResources *v8;
  EDResources *mResources;
  CHDChartType *v10;
  CHDChartType *mMainType;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  CHDSeries *v20;
  CHDSeries *mMainSeries;
  void *v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  CHDAxis *mPrimaryAxis;
  CHDAxis *mSecondaryAxis;
  void *PDFDataWithFormatterCallback;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  height = a4.height;
  width = a4.width;
  v39 = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  objc_storeStrong((id *)&self->mState, a3);
  objc_msgSend(v32, "resources");
  v8 = (EDResources *)objc_claimAutoreleasedReturnValue();
  mResources = self->mResources;
  self->mResources = v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHDChart mainType](self->mChart, "mainType");
  v10 = (CHDChartType *)objc_claimAutoreleasedReturnValue();
  mMainType = self->mMainType;
  self->mMainType = v10;

  v30 = 72;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v12 = -[CHDChartType isColumn](self->mMainType, "isColumn", 72) ^ 1;
  else
    v12 = 0;
  self->mIsHorizontal = v12;
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v30), "axes", v30);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        if ((objc_msgSend(v17, "axisPosition") || self->mIsHorizontal)
          && (objc_msgSend(v17, "axisPosition") != 1 || !self->mIsHorizontal))
        {
          if ((objc_msgSend(v17, "isSecondary") & 1) != 0)
            v18 = 104;
          else
            v18 = 96;
        }
        else
        {
          v18 = 88;
        }
        if (!*(Class *)((char *)&self->super.super.isa + v18))
          objc_storeStrong((id *)((char *)&self->super.super.isa + v18), v17);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v14);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    self->mIsStacked = objc_msgSend(*(id *)((char *)&self->super.super.isa + v31), "grouping") == 2;
    self->mIsPercentStacked = objc_msgSend(*(id *)((char *)&self->super.super.isa + v31), "grouping") == 1;
  }
  else
  {
    self->mIsStacked = 0;
    self->mIsPercentStacked = 0;
  }
  -[EMChartMapper addTitleToDescription:withState:](self, "addTitleToDescription:withState:", v33, v32);
  -[EMChartMapper addBackgroundToDescription:withState:](self, "addBackgroundToDescription:withState:", v33, v32);
  -[EMChartMapper addLegendToDescription:chartSize:withState:](self, "addLegendToDescription:chartSize:withState:", v33, v32, width, height);
  objc_msgSend(*(id *)((char *)&self->super.super.isa + v31), "seriesCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
  {
    objc_msgSend(v19, "objectAtIndex:", 0);
    v20 = (CHDSeries *)objc_claimAutoreleasedReturnValue();
    mMainSeries = self->mMainSeries;
    self->mMainSeries = v20;

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[EMChartMapper _addCategoryAxis:series:state:toDescription:](self, "_addCategoryAxis:series:state:toDescription:", self->mBaseAxis, self->mMainSeries, v32, v33);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      -[EMChartMapper _addUnitAxis:series:state:toDescription:](self, "_addUnitAxis:series:state:toDescription:", self->mBaseAxis, self->mMainSeries, v32, v33);
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setValue:forKey:", v22, *MEMORY[0x24BE7BC58]);

  v23 = objc_msgSend(v19, "count");
  if (v23 >= 1)
  {
    for (j = 0; j != v23; ++j)
    {
      objc_msgSend(v19, "objectAtIndex:", j);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMChartMapper addSeries:toDescription:withState:](self, "addSeries:toDescription:withState:", v25, v33, v32);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    mPrimaryAxis = self->mPrimaryAxis;
    if (!mPrimaryAxis)
      goto LABEL_41;
    goto LABEL_40;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_43;
  }
  mPrimaryAxis = self->mPrimaryAxis;
  if (mPrimaryAxis)
LABEL_40:
    -[EMChartMapper _addUnitAxis:series:state:toDescription:](self, "_addUnitAxis:series:state:toDescription:", mPrimaryAxis, self->mMainSeries, v32, v33);
LABEL_41:
  mSecondaryAxis = self->mSecondaryAxis;
  if (mSecondaryAxis)
    -[EMChartMapper _addUnitAxis:series:state:toDescription:](self, "_addUnitAxis:series:state:toDescription:", mSecondaryAxis, self->mMainSeries, v32, v33);
LABEL_43:
  PDFDataWithFormatterCallback = (void *)OIChartingCreatePDFDataWithFormatterCallback();

  return PDFDataWithFormatterCallback;
}

- (void)addTitleToDescription:(id)a3 withState:(id)a4
{
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
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  CGColor *v24;
  id v25;

  v25 = a3;
  -[CHDChart title](self->mChart, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "lastCachedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forKey:", v8, *MEMORY[0x24BE7BB68]);
      objc_msgSend(v6, "lastCachedName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "runs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "count"))
      {
        objc_msgSend(v11, "objectAtIndex:", 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "font");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "color");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          v16 = objc_msgSend(v14, "CGColor");
          objc_msgSend(v9, "setValue:forKey:", v16, *MEMORY[0x24BE7BC48]);
        }

      }
      objc_msgSend(v6, "graphicProperties");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "hasFill")
        && (objc_msgSend(v17, "fill"), v22 = (void *)objc_claimAutoreleasedReturnValue(), v22, v22))
      {
        objc_msgSend(v17, "fill");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = +[CMColorProperty copyCGColorFromOADFill:state:](CMColorProperty, "copyCGColorFromOADFill:state:", v23, self->mState);

      }
      else
      {
        LODWORD(v18) = 1.0;
        LODWORD(v19) = 1.0;
        LODWORD(v20) = 1.0;
        LODWORD(v21) = 1.0;
        v24 = +[EMChartMapper newColorWithCalibratedRed:green:blue:alpha:](EMChartMapper, "newColorWithCalibratedRed:green:blue:alpha:", v18, v19, v20, v21);
      }
      objc_msgSend(v9, "setValue:forKey:", v24, *MEMORY[0x24BE7BB58]);
      CGColorRelease(v24);
      objc_msgSend(v25, "setValue:forKey:", v9, *MEMORY[0x24BE7BC50]);

    }
  }

}

+ (CGColor)newColorWithCalibratedRed:(float)a3 green:(float)a4 blue:(float)a5 alpha:(float)a6
{
  CGColorSpace *DeviceRGB;
  CGColor *v11;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x24BDAC8D0];
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  components[0] = a3;
  components[1] = a4;
  components[2] = a5;
  components[3] = a6;
  v11 = CGColorCreate(DeviceRGB, components);
  CFRelease(DeviceRGB);
  return v11;
}

- (void)addBackgroundToDescription:(id)a3 withState:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  CGColor *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGColor *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CGColor *v27;
  int v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGColor *v37;
  id v38;

  v38 = a3;
  v6 = a4;
  -[CHDChart plotArea](self->mChart, "plotArea");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "graphicProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isOffice12"))
      v10 = 0.0;
    else
      v10 = 1.0;
    if (objc_msgSend(v8, "hasFill")
      && (objc_msgSend(v8, "fill"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, v15))
    {
      objc_msgSend(v8, "fill");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = +[CMColorProperty copyCGColorFromOADFill:state:](CMColorProperty, "copyCGColorFromOADFill:state:", v16, self->mState);

    }
    else
    {
      LODWORD(v11) = 1.0;
      LODWORD(v12) = 1.0;
      LODWORD(v13) = 1.0;
      *(float *)&v14 = v10;
      v17 = +[EMChartMapper newColorWithCalibratedRed:green:blue:alpha:](EMChartMapper, "newColorWithCalibratedRed:green:blue:alpha:", v11, v12, v13, v14);
    }
    objc_msgSend(v9, "setValue:forKey:", v17, *MEMORY[0x24BE7BB58]);
    CGColorRelease(v17);
    LODWORD(v18) = 0;
    LODWORD(v19) = 0;
    LODWORD(v20) = 0;
    *(float *)&v21 = v10;
    v22 = +[EMChartMapper newColorWithCalibratedRed:green:blue:alpha:](EMChartMapper, "newColorWithCalibratedRed:green:blue:alpha:", v18, v19, v20, v21);
    objc_msgSend(v9, "setValue:forKey:", v22, *MEMORY[0x24BE7BC38]);
    CGColorRelease(v22);
    objc_msgSend(v38, "setValue:forKey:", v9, *MEMORY[0x24BE7BBA8]);

  }
  -[CHDChart chartAreaGraphicProperties](self->mChart, "chartAreaGraphicProperties");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "hasFill")
      && (objc_msgSend(v23, "fill"), v25 = (void *)objc_claimAutoreleasedReturnValue(), v25, v25))
    {
      objc_msgSend(v23, "fill");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = +[CMColorProperty copyCGColorFromOADFill:state:](CMColorProperty, "copyCGColorFromOADFill:state:", v26, self->mState);

    }
    else
    {
      v28 = objc_msgSend(v6, "isOffice12");
      LODWORD(v32) = 0.5;
      if (v28)
        *(float *)&v32 = 1.0;
      LODWORD(v31) = 1.0;
      LODWORD(v29) = LODWORD(v32);
      LODWORD(v30) = LODWORD(v32);
      v27 = +[EMChartMapper newColorWithCalibratedRed:green:blue:alpha:](EMChartMapper, "newColorWithCalibratedRed:green:blue:alpha:", v32, v29, v30, v31);
    }
    objc_msgSend(v24, "setValue:forKey:", v27, *MEMORY[0x24BE7BB58]);
    CGColorRelease(v27);
    LODWORD(v33) = 1064514355;
    LODWORD(v34) = 1.0;
    LODWORD(v35) = 1064514355;
    LODWORD(v36) = 1064514355;
    v37 = +[EMChartMapper newColorWithCalibratedRed:green:blue:alpha:](EMChartMapper, "newColorWithCalibratedRed:green:blue:alpha:", v33, v35, v36, v34);
    objc_msgSend(v24, "setValue:forKey:", v37, *MEMORY[0x24BE7BC38]);
    CGColorRelease(v37);
    objc_msgSend(v38, "setValue:forKey:", v24, *MEMORY[0x24BE7BB40]);

  }
}

- (void)addLegendToDescription:(id)a3 chartSize:(CGSize)a4 withState:(id)a5
{
  void *v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  -[CHDChart legend](self->mChart, "legend");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "legendPosition") - 1;
    if (v8 >= 4)
      v9 = 3;
    else
      v9 = dword_22A4D55B0[v8];
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v11, *MEMORY[0x24BE7BB78]);

    objc_msgSend(v7, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "color");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = objc_msgSend(v13, "CGColor");
      objc_msgSend(v10, "setValue:forKey:", v15, *MEMORY[0x24BE7BC48]);
    }
    else
    {
      +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "CGColor");
      objc_msgSend(v10, "setValue:forKey:", v17, *MEMORY[0x24BE7BC48]);

    }
    objc_msgSend(v18, "setValue:forKey:", v10, *MEMORY[0x24BE7BB70]);

  }
}

- (void)_addCategoryAxis:(id)a3 series:(id)a4 state:(id)a5 toDescription:(id)a6
{
  id v9;
  void *v10;
  __CFString *v11;
  char v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int SInt32;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t j;
  uint64_t k;
  const EDCellHeader *v30;
  EDResources *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  _QWORD *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  __CFString *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  EDValue v58;

  v49 = a3;
  v46 = a4;
  v9 = a5;
  v48 = a6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  self->mHasDateCategory = objc_opt_isKindOfClass() & 1;
  objc_msgSend(v49, "contentFormat");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "formatString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "string");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v47 = v11;
  if (!v11
    || (v12 = -[__CFString isEqualToString:](v11, "isEqualToString:", CFSTR("General")), v13 = v11, (v12 & 1) != 0))
  {
    if (!self->mHasDateCategory)
      goto LABEL_8;
    v13 = CFSTR("GenericDate");
  }
  +[EMNumberFormatter formatterForFormat:](EMNumberFormatter, "formatterForFormat:", v13);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->mHasDateCategory)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setValue:forKey:", v14, *MEMORY[0x24BE7BB18]);

  if (v51)
  {
    objc_msgSend(v50, "setValue:forKey:");
    goto LABEL_9;
  }
LABEL_8:
  v51 = 0;
LABEL_9:
  objc_msgSend(v46, "categoryData");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "dataValues");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_opt_new();
  if (objc_msgSend(v55, "count"))
  {
    v16 = objc_msgSend(v55, "count");
    if (v16 >= 1)
    {
      for (i = 0; v16 != i; ++i)
      {
        objc_msgSend(v55, "dataValueAtIndex:", i);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        EDValue::EDValue(&v58, (const EDValue *)objc_msgSend(v18, "value"));

        SInt32 = CsLeReadSInt32((unsigned int *)&v58);
        if (self->mHasDateCategory)
        {
          -[EMChartMapper dateFromXlDateTimeNumber:](self, "dateFromXlDateTimeNumber:", EDValue::numberValue(&v58));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v20, "timeIntervalSinceReferenceDate");
          objc_msgSend(v21, "numberWithDouble:");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v22);
        }
        else
        {
          if (SInt32 == 3)
          {
            EDValue::nsStringValue(&v58);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            if (v20)
              objc_msgSend(v15, "addObject:", v20);
            goto LABEL_15;
          }
          if (SInt32 != 2)
            goto LABEL_16;
          if (v51)
          {
            v23 = EDValue::numberValue(&v58);
            -[CHDChart workbook](self->mChart, "workbook");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "formatValue:inWorkbook:", v20, v23);
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", EDValue::numberValue(&v58));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "description");
          }
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v22);
        }

LABEL_15:
LABEL_16:
        EDValue::~EDValue(&v58);
      }
    }
  }
  else
  {
    objc_msgSend(v45, "formula");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "references");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v24, "count");
    if (v53 >= 1)
    {
      v25 = 0;
      v52 = v24;
      do
      {
        objc_msgSend(v24, "objectAtIndex:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "document");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "sheetAtIndex:", objc_msgSend(v26, "sheetIndex"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "rowBlocks");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        for (j = objc_msgSend(v26, "firstColumn");
              (int)j <= (int)objc_msgSend(v26, "lastColumn");
              j = (j + 1))
        {
          for (k = objc_msgSend(v26, "firstRow"); (int)k <= (int)objc_msgSend(v26, "lastRow"); k = (k + 1))
          {
            v30 = (const EDCellHeader *)objc_msgSend(v27, "cellWithRowNumber:columnNumber:", k, j);
            objc_msgSend(v9, "resources");
            v31 = (EDResources *)objc_claimAutoreleasedReturnValue();
            stringValueForEDCell(v30, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v32, "string");
            v33 = objc_claimAutoreleasedReturnValue();
            v34 = (void *)v33;
            if (v33)
              v35 = (const __CFString *)v33;
            else
              v35 = &stru_24F3BFFF8;
            objc_msgSend(v15, "addObject:", v35);

          }
        }

        ++v25;
        v24 = v52;
      }
      while (v25 != v53);
    }

  }
  objc_msgSend(v50, "setValue:forKey:", v15, *MEMORY[0x24BE7BB00]);
  objc_msgSend(v49, "font");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "color");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    v39 = objc_msgSend(v37, "CGColor");
    objc_msgSend(v50, "setValue:forKey:", v39, *MEMORY[0x24BE7BC48]);
  }
  v40 = *MEMORY[0x24BE7BAF8];
  objc_msgSend(v48, "objectForKey:", *MEMORY[0x24BE7BAF8]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v41)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setValue:forKey:", v41, v40);
  }
  if (self->mIsHorizontal)
    v42 = (_QWORD *)MEMORY[0x24BE7BB28];
  else
    v42 = (_QWORD *)MEMORY[0x24BE7BB20];
  objc_msgSend(v41, "setValue:forKey:", v50, *v42);

}

- (void)_addStandardSeries:(id)a3 toDescription:(id)a4 withState:(id)a5
{
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  _QWORD *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  _QWORD *v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t j;
  uint64_t k;
  EDCellHeader *v37;
  const EDCellHeader *v38;
  double v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t ii;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t m;
  uint64_t n;
  EDCellHeader *v55;
  const EDCellHeader *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  void *v62;
  EDValue *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t jj;
  EDCellHeader *v71;
  EDResources *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  CGColor *v81;
  CGColor *v82;
  void *v83;
  int v84;
  void *v85;
  void *v86;
  void *v87;
  int v88;
  int v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  void *v97;
  void *v98;
  double v99;
  void *v100;
  void *v101;
  double v102;
  void *v103;
  void *v104;
  _BOOL4 mIsPercentStacked;
  _QWORD *v106;
  _QWORD *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  id v127;
  void *v128;
  void *v129;
  void *v131;
  void *v132;
  void *v133;
  EDValue v134;

  v7 = a3;
  v8 = a4;
  v127 = a5;
  v118 = v7;
  v9 = objc_msgSend(v7, "isDateTimeFormattingFlag");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BE7BBE0];
  v109 = v8;
  objc_msgSend(v8, "valueForKey:", *MEMORY[0x24BE7BBE0]);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v112)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v112, v10);
  }
  objc_msgSend(v112, "addObject:", v117);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (_QWORD *)MEMORY[0x24BE7BBB0];
LABEL_5:
    objc_msgSend(v117, "setValue:forKey:", *v11, *MEMORY[0x24BE7BC10]);
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v117, "setValue:forKey:", *MEMORY[0x24BE7BB38], *MEMORY[0x24BE7BC10]);
    v12 = 0;
    v13 = 1;
    if (!v9)
      goto LABEL_18;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "chartType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v22 = (_QWORD *)MEMORY[0x24BE7BAD0];
    }
    else
    {
      objc_msgSend(v118, "chartType");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = objc_msgSend(v83, "isDoughnutType");

      v22 = (_QWORD *)MEMORY[0x24BE7BBA0];
      if (v84)
        v22 = (_QWORD *)MEMORY[0x24BE7BB50];
    }
    objc_msgSend(v117, "setValue:forKey:", *v22, *MEMORY[0x24BE7BC10]);
    objc_msgSend(v118, "dataValuePropertiesCollection");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v85, "count"))
    {
      objc_msgSend(v85, "objectAtIndex:", 0);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v87 = (void *)MEMORY[0x24BDD16E0];
        v88 = objc_msgSend(v86, "explosion");
        if (v88 >= 0)
          v89 = v88;
        else
          v89 = v88 + 1;
        objc_msgSend(v87, "numberWithInt:", (v89 >> 1));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v117, "setValue:forKey:", v90, *MEMORY[0x24BE7BC00]);

      }
    }

LABEL_6:
    v12 = 0;
    v13 = 0;
    if (!v9)
      goto LABEL_18;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (self->mIsStacked)
      {
        v11 = (_QWORD *)MEMORY[0x24BE7BC30];
        goto LABEL_5;
      }
      mIsPercentStacked = self->mIsPercentStacked;
      v106 = (_QWORD *)MEMORY[0x24BE7BB98];
      v107 = (_QWORD *)MEMORY[0x24BE7BB80];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (self->mIsHorizontal)
        {
          if (self->mIsStacked)
          {
            v11 = (_QWORD *)MEMORY[0x24BE7BAD8];
            goto LABEL_5;
          }
          mIsPercentStacked = self->mIsPercentStacked;
          v106 = (_QWORD *)MEMORY[0x24BE7BAC0];
          v107 = (_QWORD *)MEMORY[0x24BE7BAB0];
        }
        else
        {
          if (self->mIsStacked)
          {
            v11 = (_QWORD *)MEMORY[0x24BE7BAE0];
            goto LABEL_5;
          }
          mIsPercentStacked = self->mIsPercentStacked;
          v106 = (_QWORD *)MEMORY[0x24BE7BAC8];
          v107 = (_QWORD *)MEMORY[0x24BE7BAB8];
        }
      }
      else if (self->mIsHorizontal)
      {
        if (self->mIsStacked)
        {
          v11 = (_QWORD *)MEMORY[0x24BE7BC20];
          goto LABEL_5;
        }
        mIsPercentStacked = self->mIsPercentStacked;
        v106 = (_QWORD *)MEMORY[0x24BE7BB88];
        v107 = (_QWORD *)MEMORY[0x24BE7BB30];
      }
      else
      {
        if (self->mIsStacked)
        {
          v11 = (_QWORD *)MEMORY[0x24BE7BC28];
          goto LABEL_5;
        }
        mIsPercentStacked = self->mIsPercentStacked;
        v106 = (_QWORD *)MEMORY[0x24BE7BB90];
        v107 = (_QWORD *)MEMORY[0x24BE7BB48];
      }
    }
    if (mIsPercentStacked)
      v11 = v106;
    else
      v11 = v107;
    goto LABEL_5;
  }
  objc_msgSend(v117, "setValue:forKey:", *MEMORY[0x24BE7BC60], *MEMORY[0x24BE7BC10]);
  v13 = 0;
  v12 = 1;
  if (!v9)
    goto LABEL_18;
LABEL_10:
  self->mHasPrimaryDateAxis = 1;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v117, "setValue:forKey:", v14, *MEMORY[0x24BE7BB18]);

  objc_msgSend(v118, "valueData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentFormat");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "formatString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "string");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18 && (objc_msgSend(v18, "isEqualToString:", CFSTR("General")) & 1) == 0)
  {
    +[EMNumberFormatter formatterForFormat:](EMNumberFormatter, "formatterForFormat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setValue:forKey:", v19, *MEMORY[0x24BE7BAE8]);
  }
  else
  {
    +[EMNumberFormatter formatterForFormat:](EMNumberFormatter, "formatterForFormat:", CFSTR("GenericDate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setValue:forKey:", v19, *MEMORY[0x24BE7BAE8]);
  }

LABEL_18:
  objc_msgSend(v118, "categoryData");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "valueData");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  if (((v12 | v13) & 1) != 0 || self->mHasDateCategory)
  {
    objc_msgSend(v110, "dataValues");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v128, "count"))
    {
      v23 = objc_msgSend(v128, "count");
      if (v23)
      {
        for (i = 0; i != v23; ++i)
        {
          objc_msgSend(v128, "dataValueAtIndex:", i);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          EDValue::EDValue(&v134, (const EDValue *)objc_msgSend(v25, "value"));

          if (self->mHasDateCategory)
          {
            -[EMChartMapper dateFromXlDateTimeNumber:](self, "dateFromXlDateTimeNumber:", EDValue::numberValue(&v134));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v26, "timeIntervalSinceReferenceDate");
            objc_msgSend(v27, "numberWithDouble:");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "addObject:", v28);

          }
          else
          {
            v29 = EDValue::numberValue(&v134);
            if (v29 > 1.79769313e308)
              v29 = 1.79769313e308;
            if (v29 < -1.79769313e308)
              v29 = -1.79769313e308;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v29);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v131, "addObject:", v26);
          }

          EDValue::~EDValue(&v134);
        }
      }
      v30 = v131;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v110, "formula");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v113, "references");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = objc_msgSend(v31, "count");
      if (v119)
      {
        v32 = 0;
        v115 = v31;
        do
        {
          v121 = v32;
          objc_msgSend(v31, "objectAtIndex:");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v127, "document");
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "sheetAtIndex:", objc_msgSend(v33, "sheetIndex"));
          v124 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v124, "rowBlocks");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          for (j = objc_msgSend(v33, "firstColumn");
                (int)j <= (int)objc_msgSend(v33, "lastColumn");
                j = (j + 1))
          {
            for (k = objc_msgSend(v33, "firstRow"); (int)k <= (int)objc_msgSend(v33, "lastRow"); k = (k + 1))
            {
              v37 = (EDCellHeader *)objc_msgSend(v34, "cellWithRowNumber:columnNumber:", k, j);
              v38 = v37;
              if (v37 && typeForEDCell(v37) == 2)
              {
                v39 = numberValueForEDCell(v38);
                if (v39 > 1.79769313e308)
                  v39 = 1.79769313e308;
                if (v39 < -1.79769313e308)
                  v39 = -1.79769313e308;
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "addObject:", v40);

              }
            }
          }

          v32 = v121 + 1;
          v31 = v115;
        }
        while (v121 + 1 != v119);
      }

    }
    objc_msgSend(v117, "setValue:forKey:", v30, *MEMORY[0x24BE7BBB8]);
  }
  else
  {
    v30 = 0;
    v128 = 0;
  }
  v41 = v128;
  objc_msgSend(v111, "dataValues");
  v129 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v129, "count"))
  {
    objc_msgSend(v111, "formula");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "references");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = objc_msgSend(v49, "count");
    if (!v116)
      goto LABEL_81;
    v50 = 0;
    v114 = v49;
    while (1)
    {
      v120 = v50;
      objc_msgSend(v49, "objectAtIndex:");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "document");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v125, "sheetAtIndex:", objc_msgSend(v51, "sheetIndex"));
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "rowBlocks");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      for (m = objc_msgSend(v51, "firstColumn"); (int)m <= (int)objc_msgSend(v51, "lastColumn"); m = (m + 1))
      {
        for (n = objc_msgSend(v51, "firstRow"); (int)n <= (int)objc_msgSend(v51, "lastRow"); n = (n + 1))
        {
          v55 = (EDCellHeader *)objc_msgSend(v52, "cellWithRowNumber:columnNumber:", n, m);
          v56 = v55;
          if (v9)
          {
            -[EMChartMapper dateFromXlDateTimeNumber:](self, "dateFromXlDateTimeNumber:", numberValueForEDCell(v55));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v57, "timeIntervalSinceReferenceDate");
            objc_msgSend(v58, "numberWithDouble:");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v133, "addObject:", v59);

LABEL_76:
            continue;
          }
          if (typeForEDCell(v55))
          {
            v60 = numberValueForEDCell(v56);
            if (v60 > 1.79769313e308)
              v60 = 1.79769313e308;
            if (v60 < -1.79769313e308)
              v60 = -1.79769313e308;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v60);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v133, "addObject:", v57);
            goto LABEL_76;
          }
          objc_msgSend(v133, "addObject:", &unk_24F46A9A8);
        }
      }

      v50 = v120 + 1;
      v49 = v114;
      if (v120 + 1 == v116)
      {
LABEL_81:

        goto LABEL_82;
      }
    }
  }
  v42 = objc_msgSend(v129, "count");
  if (v42)
  {
    for (ii = 0; ii != v42; ++ii)
    {
      objc_msgSend(v129, "dataValueAtIndex:", ii);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      EDValue::EDValue(&v134, (const EDValue *)objc_msgSend(v44, "value"));

      if (v9)
      {
        -[EMChartMapper dateFromXlDateTimeNumber:](self, "dateFromXlDateTimeNumber:", EDValue::numberValue(&v134));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v45, "timeIntervalSinceReferenceDate");
        objc_msgSend(v46, "numberWithDouble:");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "addObject:", v47);

      }
      else
      {
        v48 = EDValue::numberValue(&v134);
        if (v48 > 1.79769313e308)
          v48 = 1.79769313e308;
        if (v48 < -1.79769313e308)
          v48 = -1.79769313e308;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v48);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v133, "addObject:", v45);
      }

      EDValue::~EDValue(&v134);
    }
  }
LABEL_82:
  objc_msgSend(v117, "setValue:forKey:", v133, *MEMORY[0x24BE7BC18]);
  objc_msgSend(v118, "lastCachedName");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (v61 && CsLeReadSInt32((unsigned int *)objc_msgSend(v61, "value")) == 3)
  {
    v63 = EDValue::EDValue(&v134, (const EDValue *)objc_msgSend(v62, "value"));
    EDValue::nsStringValue(v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setValue:forKey:", v64, *MEMORY[0x24BE7BB68]);

    EDValue::~EDValue(&v134);
  }
  else
  {
    objc_msgSend(v118, "name");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "references");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v66, "count"))
    {
      objc_msgSend(v66, "objectAtIndex:", 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "document");
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v126, "sheetAtIndex:", objc_msgSend(v67, "sheetIndex"));
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "rowBlocks");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v67, "firstColumn");
LABEL_87:
      if ((int)v69 <= (int)objc_msgSend(v67, "lastColumn"))
      {
        for (jj = objc_msgSend(v67, "firstRow"); ; jj = (jj + 1))
        {
          if ((int)jj > (int)objc_msgSend(v67, "lastRow"))
          {
            v69 = (v69 + 1);
            goto LABEL_87;
          }
          v71 = (EDCellHeader *)objc_msgSend(v68, "cellWithRowNumber:columnNumber:", jj, v69);
          if (typeForEDCell(v71) == 3)
          {
            objc_msgSend(v127, "resources");
            v72 = (EDResources *)objc_claimAutoreleasedReturnValue();
            stringValueForEDCell(v71, v72);
            v73 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v73, "string");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v74, "length"))
            {
              objc_msgSend(v117, "setValue:forKey:", v74, *MEMORY[0x24BE7BB68]);

              break;
            }

          }
        }
      }

    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v118, "marker");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v75, "size") && (int)objc_msgSend(v75, "style") >= 1)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v75, "size"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setValue:forKey:", v76, *MEMORY[0x24BE7BBF8]);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "setValue:forKey:", v77, *MEMORY[0x24BE7BBF0]);

      objc_msgSend(v75, "graphicProperties");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "fill");
      v79 = (void *)objc_claimAutoreleasedReturnValue();

      if (v79)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = (CGColor *)objc_msgSend(v80, "CGColor");
          v82 = v81;
          if (v81)
            CGColorRetain(v81);

        }
        else
        {
          v82 = +[CMColorProperty copyCGColorFromOADFill:state:](CMColorProperty, "copyCGColorFromOADFill:state:", v79, v127);
        }
        objc_msgSend(v117, "setValue:forKey:", v82, *MEMORY[0x24BE7BBE8]);
        CGColorRelease(v82);
      }

    }
  }
  objc_msgSend(v118, "defaultDataLabel");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v91, "isShowValue"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v117, "setValue:forKey:", v92, *MEMORY[0x24BE7BC08]);

  }
  objc_msgSend(v118, "errorBarYAxis");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  if (v93)
  {
    v94 = (void *)objc_opt_new();
    v95 = (void *)MEMORY[0x24BDD16E0];
    *(float *)&v96 = (float)objc_msgSend(v93, "valueType");
    objc_msgSend(v95, "numberWithFloat:", v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setValue:forKey:", v97, *MEMORY[0x24BE7BBD8]);

    v98 = (void *)MEMORY[0x24BDD16E0];
    *(float *)&v99 = (float)objc_msgSend(v93, "type");
    objc_msgSend(v98, "numberWithFloat:", v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setValue:forKey:", v100, *MEMORY[0x24BE7BBC8]);

    v101 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v93, "value");
    *(float *)&v102 = v102;
    objc_msgSend(v101, "numberWithFloat:", v102);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "setValue:forKey:", v103, *MEMORY[0x24BE7BBD0]);

    objc_msgSend(v117, "setValue:forKey:", v94, *MEMORY[0x24BE7BBC0]);
  }
  objc_msgSend(v118, "graphicProperties");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMChartMapper _addGraphicProperties:toDescription:withState:](self, "_addGraphicProperties:toDescription:withState:", v104, v117, v127);

}

- (void)_addGraphicProperties:(id)a3 toDescription:(id)a4 withState:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  CGColor *v15;
  CGColor *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  CGImage *v21;
  CGColor *v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v23, "hasStroke"))
  {
    objc_msgSend(v23, "stroke");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "fill");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v23, "fill");
        v13 = objc_claimAutoreleasedReturnValue();

        v12 = (void *)v13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        +[OITSUColor colorWithCalibratedRed:green:blue:alpha:](OITSUColor, "colorWithCalibratedRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (CGColor *)objc_msgSend(v14, "CGColor");
        v16 = v15;
        if (v15)
          CGColorRetain(v15);

      }
      else
      {
        v16 = +[CMColorProperty copyCGColorFromOADFill:state:](CMColorProperty, "copyCGColorFromOADFill:state:", v12, v9);
      }
      objc_msgSend(v8, "setValue:forKey:", v16, *MEMORY[0x24BE7BC38]);
      CGColorRelease(v16);
      v17 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v11, "width");
      objc_msgSend(v17, "numberWithFloat:");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v18, *MEMORY[0x24BE7BC40]);

    }
  }
  if (objc_msgSend(v23, "hasFill"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(v23, "fill");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[CMMapper parent](self, "parent");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = +[CMShapeRenderer copyImageFromOADImageFill:withMapper:](CMShapeRenderer, "copyImageFromOADImageFill:withMapper:", v19, v20);

          if (v21)
          {
            objc_msgSend(v8, "setValue:forKey:", v21, *MEMORY[0x24BE7BB60]);
            CGImageRelease(v21);
          }
        }
        else if (v19)
        {
          v22 = +[CMColorProperty copyCGColorFromOADFill:state:](CMColorProperty, "copyCGColorFromOADFill:state:", v19, v9);
          objc_msgSend(v8, "setValue:forKey:", v22, *MEMORY[0x24BE7BB58]);
          CGColorRelease(v22);
        }

      }
    }
  }

}

- (void)_addUnitAxis:(id)a3 series:(id)a4 state:(id)a5 toDescription:(id)a6
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unsigned int v28;
  _QWORD *v29;
  id v30;

  v30 = a3;
  v8 = a6;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BE7BAF8];
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BE7BAF8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forKey:", v11, v10);
  }
  if (self->mIsPercentStacked)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v12, *MEMORY[0x24BE7BB18]);
  }
  else
  {
    if (!self->mHasPrimaryDateAxis)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v12, *MEMORY[0x24BE7BB18]);
  }

LABEL_8:
  objc_msgSend(v30, "majorGridLinesGraphicProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stroke");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fill");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v17, *MEMORY[0x24BE7BAF0]);

  }
  if ((objc_msgSend(v30, "isAutoMinimumValue") & 1) == 0)
  {
    v18 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v30, "scalingMinimum");
    *(float *)&v19 = v19;
    objc_msgSend(v18, "numberWithFloat:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v20, *MEMORY[0x24BE7BB10]);

  }
  if ((objc_msgSend(v30, "isAutoMaximumValue") & 1) == 0)
  {
    v21 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v30, "scalingMaximum");
    *(float *)&v22 = v22;
    objc_msgSend(v21, "numberWithFloat:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forKey:", v23, *MEMORY[0x24BE7BB08]);

  }
  objc_msgSend(v30, "font");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "color");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v27 = objc_msgSend(v25, "CGColor");
    objc_msgSend(v9, "setValue:forKey:", v27, *MEMORY[0x24BE7BC48]);
  }
  v28 = objc_msgSend(v30, "axisPosition");
  if (v28 >= 4)
    v29 = (_QWORD *)MEMORY[0x24BE7BB28];
  else
    v29 = (_QWORD *)qword_24F3BF910[v28];
  objc_msgSend(v11, "setValue:forKey:", v9, *v29);

}

- (id)dateFromXlDateTimeNumber:(double)a3
{
  void *v4;
  void *v5;

  -[CHDChart workbook](self->mChart, "workbook");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ECUtils dateFromXlDateTimeNumber:edWorkbook:](ECUtils, "dateFromXlDateTimeNumber:edWorkbook:", v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSecondaryAxis, 0);
  objc_storeStrong((id *)&self->mPrimaryAxis, 0);
  objc_storeStrong((id *)&self->mBaseAxis, 0);
  objc_storeStrong((id *)&self->mMainSeries, 0);
  objc_storeStrong((id *)&self->mMainType, 0);
  objc_storeStrong((id *)&self->mResources, 0);
  objc_storeStrong((id *)&self->mState, 0);
  objc_storeStrong((id *)&self->mChart, 0);
}

@end
