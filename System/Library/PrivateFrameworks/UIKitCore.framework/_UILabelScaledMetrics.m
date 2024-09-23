@implementation _UILabelScaledMetrics

- (double)initWithConfiguration:(double)a3 size:(double)a4
{
  id v7;
  void *v8;
  double *v9;
  BOOL v10;
  double v11;
  double *v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v17;
  double v18;
  double v19;
  objc_super v21;

  v7 = a2;
  v8 = v7;
  if (!a1)
    goto LABEL_19;
  v9 = 0;
  v10 = a4 >= 3.40282347e38 && a3 >= 3.40282347e38;
  if (!v7 || v10)
    goto LABEL_20;
  if (!objc_msgSend(v7, "adjustsFontSizeToFitWidth")
    || (objc_msgSend(v8, "minimumScaleFactor"), v11 >= 1.0))
  {
LABEL_19:
    v9 = 0;
    goto LABEL_20;
  }
  v21.receiver = a1;
  v21.super_class = (Class)_UILabelScaledMetrics;
  v12 = (double *)objc_msgSendSuper2(&v21, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v8, "copy");
    v14 = (void *)*((_QWORD *)v12 + 15);
    *((_QWORD *)v12 + 15) = v13;

    v15 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    if (*MEMORY[0x1E0C9D820] == a3 && v15 == a4)
    {
      v17 = (void *)*((_QWORD *)v12 + 15);
      if (v17)
      {
        objc_msgSend(v17, "bounds", *MEMORY[0x1E0C9D820], v15);
        a3 = v18;
        a4 = v19;
      }
      else
      {
        a3 = 0.0;
        a4 = 0.0;
      }
    }
    v12[1] = a3;
    v12[2] = a4;
  }
  a1 = v12;
  v9 = a1;
LABEL_20:

  return v9;
}

- (double)initWithConfiguration:(void *)a3 size:(double)a4 associatedScaledMetrics:(double)a5
{
  id v10;
  double *v11;
  double *v12;

  v10 = a3;
  if (a1)
  {
    v11 = -[_UILabelScaledMetrics initWithConfiguration:size:](a1, a2, a4, a5);
    v12 = v11;
    if (v11)
      objc_storeStrong((id *)v11 + 16, a3);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)scaledAttributedText
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "_calculateIfNecessary");
    a1 = (id *)v1[10];
  }
  return a1;
}

- (void)_calculateIfNecessary
{
  void *v3;
  void *v4;

  if ((*(_BYTE *)&self->_scaledMetricsFlags & 1) == 0)
  {
    *(_BYTE *)&self->_scaledMetricsFlags |= 1u;
    if (self->_sourceSize.width < 3.40282347e38 || self->_sourceSize.height < 3.40282347e38)
    {
      -[UIBarButtonItemGroup _items]((id *)&self->_configuration->super.isa);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "attributedString");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        if (self->_associatedScaledMetrics)
          -[_UILabelScaledMetrics _calculateIfNecessaryWithAssociatedMetrics](self, "_calculateIfNecessaryWithAssociatedMetrics");
        else
          -[_UILabelScaledMetrics _calculateIfNecessaryWithConfiguration](self, "_calculateIfNecessaryWithConfiguration");
      }
    }
  }
}

- (void)_calculateIfNecessaryWithAssociatedMetrics
{
  void *v3;
  uint64_t v4;
  _UILabelScaledMetrics *associatedScaledMetrics;
  double actualScaleFactor;
  NSAttributedString *v7;
  void *v8;
  _UILabelConfiguration *configuration;
  uint64_t v10;
  _UILabelConfigurationInternal *internal;
  $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags;
  uint64_t v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  _UILabelScaledMetrics *v20;
  double baselineOffset;
  _UILabelScaledMetrics *v22;
  double scaledFirstBaselineOffset;
  _UILabelScaledMetrics *v24;
  double scaledBaselineOffset;
  _UILabelScaledMetrics *v26;
  double v27;
  int64_t v28;
  NSAttributedString *scaledAttributedText;
  id v30;

  -[UIBarButtonItemGroup _items]((id *)&self->_configuration->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributedString");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v30, "length");
  associatedScaledMetrics = self->_associatedScaledMetrics;
  if (associatedScaledMetrics)
  {
    -[_UILabelScaledMetrics _calculateIfNecessary](self->_associatedScaledMetrics, "_calculateIfNecessary");
    actualScaleFactor = associatedScaledMetrics->_actualScaleFactor;
  }
  else
  {
    actualScaleFactor = 0.0;
  }
  objc_msgSend(v30, "_ui_attributedSubstringFromRange:scaledByScaleFactor:", 0, v4, actualScaleFactor);
  v7 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
  -[_UILabelConfiguration _resolvedStringDrawingContext]((void **)&self->_configuration->super.isa);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWantsNumberOfLineFragments:", 1);
  objc_msgSend(v8, "setMaximumNumberOfLines:", -[_UILabelConfiguration numberOfLines](self->_configuration, "numberOfLines"));
  objc_msgSend(v8, "setMinimumScaleFactor:", 1.0);
  objc_msgSend(v8, "setLayout:", 0);
  configuration = self->_configuration;
  if (configuration)
  {
    v10 = 1048577;
    internal = configuration->_internal;
    if (internal)
    {
      configurationFlags = internal->_configurationFlags;
      v13 = 1048705;
      if ((*(_BYTE *)&configurationFlags & 2) == 0)
        v13 = 1048577;
      v10 = v13 | (*(_WORD *)&configurationFlags << 7) & 0x200 | (*(_WORD *)&configurationFlags << 7) & 0x400;
    }
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v30, "boundingRectWithSize:options:context:", v10, v8, self->_sourceSize.width, self->_sourceSize.height);
  v15 = v14;
  v17 = v16;
  objc_msgSend(v8, "setLayout:", 0);
  -[NSAttributedString boundingRectWithSize:options:context:](v7, "boundingRectWithSize:options:context:", v10, v8, self->_sourceSize.width, self->_sourceSize.height);
  self->_scaledSize.width = v18;
  self->_scaledSize.height = v19;
  self->_unscaledAndPossiblyTooLargeSize.width = v15;
  self->_unscaledAndPossiblyTooLargeSize.height = v17;
  v20 = self->_associatedScaledMetrics;
  if (!v20)
  {
    self->_baselineOffset = 0.0;
    goto LABEL_17;
  }
  -[_UILabelScaledMetrics _calculateIfNecessary](self->_associatedScaledMetrics, "_calculateIfNecessary");
  baselineOffset = v20->_baselineOffset;
  v22 = self->_associatedScaledMetrics;
  self->_baselineOffset = baselineOffset;
  if (!v22)
  {
LABEL_17:
    self->_scaledFirstBaselineOffset = 0.0;
    goto LABEL_18;
  }
  -[_UILabelScaledMetrics _calculateIfNecessary](v22, "_calculateIfNecessary");
  scaledFirstBaselineOffset = v22->_scaledFirstBaselineOffset;
  v24 = self->_associatedScaledMetrics;
  self->_scaledFirstBaselineOffset = scaledFirstBaselineOffset;
  if (!v24)
  {
LABEL_18:
    self->_scaledBaselineOffset = 0.0;
    goto LABEL_19;
  }
  -[_UILabelScaledMetrics _calculateIfNecessary](v24, "_calculateIfNecessary");
  scaledBaselineOffset = v24->_scaledBaselineOffset;
  v26 = self->_associatedScaledMetrics;
  self->_scaledBaselineOffset = scaledBaselineOffset;
  if (!v26)
  {
LABEL_19:
    v27 = 0.0;
    goto LABEL_13;
  }
  -[_UILabelScaledMetrics _calculateIfNecessary](v26, "_calculateIfNecessary");
  v27 = v26->_actualScaleFactor;
LABEL_13:
  self->_actualScaleFactor = v27;
  v28 = objc_msgSend(v8, "numberOfLineFragments");
  scaledAttributedText = self->_scaledAttributedText;
  self->_measuredNumberOfLines = v28;
  self->_scaledAttributedText = v7;

}

- (void)_calculateIfNecessaryWithConfiguration
{
  _UILabelConfiguration *configuration;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  _UILabelConfiguration *v9;
  uint64_t v10;
  _UILabelConfigurationInternal *internal;
  $80F9FF894D804BF481F9E54DC1AB63BD configurationFlags;
  uint64_t v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  NSAttributedString *v27;
  NSAttributedString *scaledAttributedText;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGSize v33;
  id v34;

  configuration = self->_configuration;
  if (configuration)
  {
    -[_UILabelConfiguration minimumScaleFactor](configuration, "minimumScaleFactor");
    v5 = v4;
    if (v4 >= 1.0)
      goto LABEL_16;
    configuration = self->_configuration;
  }
  else
  {
    v5 = 0.0;
  }
  -[_UILabelConfiguration _resolvedStringDrawingContext]((void **)&configuration->super.isa);
  v34 = (id)objc_claimAutoreleasedReturnValue();
  -[UIBarButtonItemGroup _items]((id *)&self->_configuration->super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "attributedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0.01;
  if (v5 > 0.0)
    v8 = v5;
  objc_msgSend(v34, "setMinimumScaleFactor:", v8);
  objc_msgSend(v34, "setLayout:", 0);
  objc_msgSend(v34, "setWantsBaselineOffset:", 1);
  objc_msgSend(v34, "setWantsScaledBaselineOffset:", 1);
  objc_msgSend(v34, "setWantsScaledLineHeight:", 1);
  objc_msgSend(v34, "setWantsNumberOfLineFragments:", 1);
  objc_msgSend(v34, "setMaximumNumberOfLines:", -[_UILabelConfiguration numberOfLines](self->_configuration, "numberOfLines"));
  v9 = self->_configuration;
  if (v9)
  {
    v10 = 1048577;
    internal = v9->_internal;
    if (internal)
    {
      configurationFlags = internal->_configurationFlags;
      v13 = 1048705;
      if ((*(_BYTE *)&configurationFlags & 2) == 0)
        v13 = 1048577;
      v10 = v13 | (*(_WORD *)&configurationFlags << 7) & 0x200 | (*(_WORD *)&configurationFlags << 7) & 0x400;
    }
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v7, "boundingRectWithSize:options:context:", v10, v34, self->_sourceSize.width, self->_sourceSize.height);
  v15 = v14;
  v17 = v16;
  objc_msgSend(v34, "scaledLineHeight");
  v19 = v18;
  objc_msgSend(v34, "actualScaleFactor");
  if (v20 > 0.0)
  {
    v21 = v20;
    if (v20 < 1.0)
    {
      v22 = 1.0 - v20;
      if (1.0 - v21 > 0.00000011920929)
      {
        self->_scaledSize.width = v15;
        self->_scaledSize.height = v19;
        self->_unscaledAndPossiblyTooLargeSize.width = v15;
        self->_unscaledAndPossiblyTooLargeSize.height = v17;
        objc_msgSend(v34, "baselineOffset", v22);
        self->_baselineOffset = v23;
        objc_msgSend(v34, "firstBaselineOffset");
        self->_scaledFirstBaselineOffset = v24;
        objc_msgSend(v34, "scaledBaselineOffset");
        self->_scaledBaselineOffset = v25;
        self->_actualScaleFactor = v21;
        self->_measuredNumberOfLines = objc_msgSend(v34, "numberOfLineFragments");
        v26 = objc_msgSend(v7, "length");
        objc_msgSend(v34, "actualScaleFactor");
        objc_msgSend(v7, "_ui_attributedSubstringFromRange:scaledByScaleFactor:", 0, v26);
        v27 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
        scaledAttributedText = self->_scaledAttributedText;
        self->_scaledAttributedText = v27;

        objc_msgSend(v34, "totalBounds");
        self->_totalBounds.origin.x = v29;
        self->_totalBounds.origin.y = v30;
        self->_totalBounds.size.width = v31;
        self->_totalBounds.size.height = v32;

        return;
      }
    }
  }

LABEL_16:
  v33 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
  self->_totalBounds.origin = (CGPoint)*MEMORY[0x1E0C9D648];
  self->_totalBounds.size = v33;
  self->_scaledSize = self->_sourceSize;
  self->_actualScaleFactor = 1.0;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double actualScaleFactor;
  double scaledFirstBaselineOffset;
  double scaledLineHeight;
  double scaledBaselineOffset;
  int64_t measuredNumberOfLines;
  void *v14;
  void *v15;

  if ((*(_BYTE *)&self->_scaledMetricsFlags & 1) != 0)
    v3 = &stru_1E16EDF20;
  else
    v3 = CFSTR("{Calculated} ");
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = v3;
  v6 = objc_opt_class();
  NSStringFromCGSize(self->_sourceSize);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(self->_scaledSize);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  actualScaleFactor = self->_actualScaleFactor;
  scaledFirstBaselineOffset = self->_scaledFirstBaselineOffset;
  scaledBaselineOffset = self->_scaledBaselineOffset;
  scaledLineHeight = self->_scaledLineHeight;
  measuredNumberOfLines = self->_measuredNumberOfLines;
  NSStringFromCGSize(self->_unscaledAndPossiblyTooLargeSize);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@:%p %@sourceSize=%@ scaledSize=%@ scaleFactor=%f scaledLineHeight=%f scaledFirstBaseline=%f scaledLastBaseline=%f numberOfLines=%ld unscaledSize=%@ scaledText=%@>"), v6, self, v5, v7, v8, *(_QWORD *)&actualScaleFactor, *(_QWORD *)&scaledLineHeight, *(_QWORD *)&scaledFirstBaselineOffset, *(_QWORD *)&scaledBaselineOffset, measuredNumberOfLines, v14, self->_scaledAttributedText);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedScaledMetrics, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_scaledAttributedText, 0);
}

@end
