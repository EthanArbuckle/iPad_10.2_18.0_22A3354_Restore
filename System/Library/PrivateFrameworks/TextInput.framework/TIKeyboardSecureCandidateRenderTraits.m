@implementation TIKeyboardSecureCandidateRenderTraits

- (TIKeyboardSecureCandidateRenderTraits)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardSecureCandidateRenderTraits *v5;
  uint64_t v6;
  TIKeyboardSecureCandidateLayoutTraits *layoutTraits;
  uint64_t v8;
  TIKeyboardSecureCandidateTextTraits *headerTextTraits;
  uint64_t v10;
  TIKeyboardSecureCandidateTextTraits *inputTextTraits;
  void *v12;
  uint64_t v13;
  NSString *prefixText;
  void *v15;
  uint64_t v16;
  NSString *suffixText;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSArray *resultCountToSingleCellWidth;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSDictionary *cellWidthOptions;
  float v31;
  float v32;
  float v33;
  float v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)TIKeyboardSecureCandidateRenderTraits;
  v5 = -[TIKeyboardSecureCandidateRenderTraits init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("layoutTraits"));
    v6 = objc_claimAutoreleasedReturnValue();
    layoutTraits = v5->_layoutTraits;
    v5->_layoutTraits = (TIKeyboardSecureCandidateLayoutTraits *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("headerTextTraits"));
    v8 = objc_claimAutoreleasedReturnValue();
    headerTextTraits = v5->_headerTextTraits;
    v5->_headerTextTraits = (TIKeyboardSecureCandidateTextTraits *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inputTextTraits"));
    v10 = objc_claimAutoreleasedReturnValue();
    inputTextTraits = v5->_inputTextTraits;
    v5->_inputTextTraits = (TIKeyboardSecureCandidateTextTraits *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("prefixText"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    prefixText = v5->_prefixText;
    v5->_prefixText = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("suffixText"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "copy");
    suffixText = v5->_suffixText;
    v5->_suffixText = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("resultCountToSingleCellWidth"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");
    resultCountToSingleCellWidth = v5->_resultCountToSingleCellWidth;
    v5->_resultCountToSingleCellWidth = (NSArray *)v22;

    v24 = (void *)MEMORY[0x1E0C99E60];
    v25 = objc_opt_class();
    v26 = objc_opt_class();
    objc_msgSend(v24, "setWithObjects:", v25, v26, objc_opt_class(), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("cellWidthOptions"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "copy");
    cellWidthOptions = v5->_cellWidthOptions;
    v5->_cellWidthOptions = (NSDictionary *)v29;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("singleCellHeight"));
    v5->_singleCellHeight = v31;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("singleCellVerticalPadding"));
    v5->_singleCellVerticalPadding = v32;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("dividerLineWidth"));
    v5->_dividerLineWidth = v33;
    v5->_maxCellCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxCellCount"));
    v5->_sharedCellCount = 0;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("screenScale"));
    v5->_screenScale = v34;
    v5->_isCandidateUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isCandidateUI"));
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TIKeyboardSecureCandidateRenderTraits *v5;
  TIKeyboardSecureCandidateLayoutTraits *v6;
  TIKeyboardSecureCandidateLayoutTraits *layoutTraits;
  TIKeyboardSecureCandidateTextTraits *v8;
  TIKeyboardSecureCandidateTextTraits *headerTextTraits;
  TIKeyboardSecureCandidateTextTraits *v10;
  TIKeyboardSecureCandidateTextTraits *inputTextTraits;
  uint64_t v12;
  NSString *prefixText;
  uint64_t v14;
  NSString *suffixText;
  uint64_t v16;
  NSArray *resultCountToSingleCellWidth;
  uint64_t v18;
  NSDictionary *cellWidthOptions;

  v5 = objc_alloc_init(TIKeyboardSecureCandidateRenderTraits);
  if (v5)
  {
    v6 = -[TIKeyboardSecureCandidateLayoutTraits copyWithZone:](self->_layoutTraits, "copyWithZone:", a3);
    layoutTraits = v5->_layoutTraits;
    v5->_layoutTraits = v6;

    v8 = -[TIKeyboardSecureCandidateTextTraits copyWithZone:](self->_headerTextTraits, "copyWithZone:", a3);
    headerTextTraits = v5->_headerTextTraits;
    v5->_headerTextTraits = v8;

    v10 = -[TIKeyboardSecureCandidateTextTraits copyWithZone:](self->_inputTextTraits, "copyWithZone:", a3);
    inputTextTraits = v5->_inputTextTraits;
    v5->_inputTextTraits = v10;

    v12 = -[NSString copyWithZone:](self->_prefixText, "copyWithZone:", a3);
    prefixText = v5->_prefixText;
    v5->_prefixText = (NSString *)v12;

    v14 = -[NSString copyWithZone:](self->_suffixText, "copyWithZone:", a3);
    suffixText = v5->_suffixText;
    v5->_suffixText = (NSString *)v14;

    v16 = -[NSArray copyWithZone:](self->_resultCountToSingleCellWidth, "copyWithZone:", a3);
    resultCountToSingleCellWidth = v5->_resultCountToSingleCellWidth;
    v5->_resultCountToSingleCellWidth = (NSArray *)v16;

    v18 = -[NSDictionary copyWithZone:](self->_cellWidthOptions, "copyWithZone:", a3);
    cellWidthOptions = v5->_cellWidthOptions;
    v5->_cellWidthOptions = (NSDictionary *)v18;

    v5->_singleCellHeight = self->_singleCellHeight;
    v5->_singleCellVerticalPadding = self->_singleCellVerticalPadding;
    v5->_dividerLineWidth = self->_dividerLineWidth;
    v5->_maxCellCount = self->_maxCellCount;
    v5->_sharedCellCount = self->_sharedCellCount;
    v5->_screenScale = self->_screenScale;
    v5->_cellRenderingStyle = self->_cellRenderingStyle;
    v5->_isCandidateUI = self->_isCandidateUI;
  }
  return v5;
}

- (TIKeyboardSecureCandidateRenderTraits)init
{
  TIKeyboardSecureCandidateRenderTraits *v2;
  TIKeyboardSecureCandidateRenderTraits *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TIKeyboardSecureCandidateRenderTraits;
  v2 = -[TIKeyboardSecureCandidateRenderTraits init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[TIKeyboardSecureCandidateRenderTraits setCellRenderingStyle:](v2, "setCellRenderingStyle:", 0);
  return v3;
}

- (void)setCellRenderingStyle:(int64_t)a3
{
  self->_cellRenderingStyle = a3;
}

- (void)setSingleCellVerticalPadding:(double)a3
{
  self->_singleCellVerticalPadding = a3;
}

- (void)setSingleCellHeight:(double)a3
{
  self->_singleCellHeight = a3;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (void)setResultCountToSingleCellWidth:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setMaxCellCount:(int64_t)a3
{
  self->_maxCellCount = a3;
}

- (void)setIsCandidateUI:(BOOL)a3
{
  self->_isCandidateUI = a3;
}

- (void)setCellWidthOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setInputTextTraits:(id)a3
{
  objc_storeStrong((id *)&self->_inputTextTraits, a3);
}

- (void)setHeaderTextTraits:(id)a3
{
  objc_storeStrong((id *)&self->_headerTextTraits, a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TIKeyboardSecureCandidateLayoutTraits *layoutTraits;
  TIKeyboardSecureCandidateTextTraits *headerTextTraits;
  TIKeyboardSecureCandidateTextTraits *inputTextTraits;
  NSString *prefixText;
  NSString *suffixText;
  NSArray *resultCountToSingleCellWidth;
  NSDictionary *cellWidthOptions;
  double singleCellHeight;
  double singleCellVerticalPadding;
  double dividerLineWidth;
  int64_t maxCellCount;
  double screenScale;
  id v17;

  v4 = a3;
  layoutTraits = self->_layoutTraits;
  v17 = v4;
  if (layoutTraits)
  {
    objc_msgSend(v4, "encodeObject:forKey:", layoutTraits, CFSTR("layoutTraits"));
    v4 = v17;
  }
  headerTextTraits = self->_headerTextTraits;
  if (headerTextTraits)
  {
    objc_msgSend(v17, "encodeObject:forKey:", headerTextTraits, CFSTR("headerTextTraits"));
    v4 = v17;
  }
  inputTextTraits = self->_inputTextTraits;
  if (inputTextTraits)
  {
    objc_msgSend(v17, "encodeObject:forKey:", inputTextTraits, CFSTR("inputTextTraits"));
    v4 = v17;
  }
  prefixText = self->_prefixText;
  if (prefixText)
  {
    objc_msgSend(v17, "encodeObject:forKey:", prefixText, CFSTR("prefixText"));
    v4 = v17;
  }
  suffixText = self->_suffixText;
  if (suffixText)
  {
    objc_msgSend(v17, "encodeObject:forKey:", suffixText, CFSTR("suffixText"));
    v4 = v17;
  }
  resultCountToSingleCellWidth = self->_resultCountToSingleCellWidth;
  if (resultCountToSingleCellWidth)
  {
    objc_msgSend(v17, "encodeObject:forKey:", resultCountToSingleCellWidth, CFSTR("resultCountToSingleCellWidth"));
    v4 = v17;
  }
  cellWidthOptions = self->_cellWidthOptions;
  if (cellWidthOptions)
  {
    objc_msgSend(v17, "encodeObject:forKey:", cellWidthOptions, CFSTR("cellWidthOptions"));
    v4 = v17;
  }
  singleCellHeight = self->_singleCellHeight;
  if (singleCellHeight != 0.0)
  {
    *(float *)&singleCellHeight = singleCellHeight;
    objc_msgSend(v17, "encodeFloat:forKey:", CFSTR("singleCellHeight"), singleCellHeight);
    v4 = v17;
  }
  singleCellVerticalPadding = self->_singleCellVerticalPadding;
  if (singleCellVerticalPadding != 0.0)
  {
    *(float *)&singleCellVerticalPadding = singleCellVerticalPadding;
    objc_msgSend(v17, "encodeFloat:forKey:", CFSTR("singleCellVerticalPadding"), singleCellVerticalPadding);
    v4 = v17;
  }
  dividerLineWidth = self->_dividerLineWidth;
  if (dividerLineWidth != 0.0)
  {
    *(float *)&dividerLineWidth = dividerLineWidth;
    objc_msgSend(v17, "encodeFloat:forKey:", CFSTR("dividerLineWidth"), dividerLineWidth);
    v4 = v17;
  }
  maxCellCount = self->_maxCellCount;
  if (maxCellCount)
  {
    objc_msgSend(v17, "encodeInteger:forKey:", maxCellCount, CFSTR("maxCellCount"));
    v4 = v17;
  }
  screenScale = self->_screenScale;
  if (screenScale != 0.0)
  {
    *(float *)&screenScale = screenScale;
    objc_msgSend(v17, "encodeFloat:forKey:", CFSTR("screenScale"), screenScale);
    v4 = v17;
  }
  objc_msgSend(v4, "encodeBool:forKey:", self->_isCandidateUI, CFSTR("isCandidateUI"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideMyEmailLocalizedText, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
  objc_storeStrong((id *)&self->_cellWidthOptions, 0);
  objc_storeStrong((id *)&self->_resultCountToSingleCellWidth, 0);
  objc_storeStrong((id *)&self->_suffixText, 0);
  objc_storeStrong((id *)&self->_prefixText, 0);
  objc_storeStrong((id *)&self->_inputTextTraits, 0);
  objc_storeStrong((id *)&self->_headerTextTraits, 0);
  objc_storeStrong((id *)&self->_layoutTraits, 0);
}

- (double)singleCellWidth
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[TIKeyboardSecureCandidateRenderTraits resultCountToSingleCellWidth](self, "resultCountToSingleCellWidth");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    v5 = v4;

  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)setSingleCellWidth:(double)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardSecureCandidateRenderTraits setResultCountToSingleCellWidth:](self, "setResultCountToSingleCellWidth:", v5);

}

- (TIKeyboardSecureCandidateLayoutTraits)layoutTraits
{
  TIKeyboardSecureCandidateLayoutTraits *layoutTraits;
  TIKeyboardSecureCandidateLayoutTraits *v4;
  TIKeyboardSecureCandidateLayoutTraits *v5;

  layoutTraits = self->_layoutTraits;
  if (!layoutTraits)
  {
    v4 = (TIKeyboardSecureCandidateLayoutTraits *)objc_opt_new();
    v5 = self->_layoutTraits;
    self->_layoutTraits = v4;

    layoutTraits = self->_layoutTraits;
  }
  return layoutTraits;
}

- (TIKeyboardSecureCandidateTextTraits)headerTextTraits
{
  TIKeyboardSecureCandidateTextTraits *headerTextTraits;
  TIKeyboardSecureCandidateTextTraits *v4;
  TIKeyboardSecureCandidateTextTraits *v5;

  headerTextTraits = self->_headerTextTraits;
  if (!headerTextTraits)
  {
    v4 = (TIKeyboardSecureCandidateTextTraits *)objc_opt_new();
    v5 = self->_headerTextTraits;
    self->_headerTextTraits = v4;

    headerTextTraits = self->_headerTextTraits;
  }
  return headerTextTraits;
}

- (TIKeyboardSecureCandidateTextTraits)inputTextTraits
{
  TIKeyboardSecureCandidateTextTraits *inputTextTraits;
  TIKeyboardSecureCandidateTextTraits *v4;
  TIKeyboardSecureCandidateTextTraits *v5;

  inputTextTraits = self->_inputTextTraits;
  if (!inputTextTraits)
  {
    v4 = (TIKeyboardSecureCandidateTextTraits *)objc_opt_new();
    v5 = self->_inputTextTraits;
    self->_inputTextTraits = v4;

    inputTextTraits = self->_inputTextTraits;
  }
  return inputTextTraits;
}

- (id)description
{
  void *v3;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  const __CFString *v19;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("; layoutTraits = %@"), self->_layoutTraits);
  -[TIKeyboardSecureCandidateRenderTraits headerTextTraits](self, "headerTextTraits");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; headerTextTraits = %@"), v4);

  -[TIKeyboardSecureCandidateRenderTraits inputTextTraits](self, "inputTextTraits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; inputTextTraits = %@"), v5);

  -[TIKeyboardSecureCandidateRenderTraits prefixText](self, "prefixText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TIKeyboardSecureCandidateRenderTraits prefixText](self, "prefixText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; prefixText = %@"), v7);

  }
  -[TIKeyboardSecureCandidateRenderTraits suffixText](self, "suffixText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TIKeyboardSecureCandidateRenderTraits suffixText](self, "suffixText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("; suffixText = %@"), v9);

  }
  -[TIKeyboardSecureCandidateRenderTraits resultCountToSingleCellWidth](self, "resultCountToSingleCellWidth");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; resultCountToSingleCellWidth = (%@)"), v11);

  -[TIKeyboardSecureCandidateRenderTraits cellWidthOptions](self, "cellWidthOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; cellWidthOptions = %@"), v13);

  -[TIKeyboardSecureCandidateRenderTraits singleCellHeight](self, "singleCellHeight");
  objc_msgSend(v3, "appendFormat:", CFSTR("; singleCellHeight = %f"), v14);
  -[TIKeyboardSecureCandidateRenderTraits singleCellVerticalPadding](self, "singleCellVerticalPadding");
  objc_msgSend(v3, "appendFormat:", CFSTR("; singleCellVerticalPadding = %f"), v15);
  -[TIKeyboardSecureCandidateRenderTraits dividerLineWidth](self, "dividerLineWidth");
  objc_msgSend(v3, "appendFormat:", CFSTR("; dividerLineWidth = %f"), v16);
  objc_msgSend(v3, "appendFormat:", CFSTR("; maxCellCount = %ld"),
    -[TIKeyboardSecureCandidateRenderTraits maxCellCount](self, "maxCellCount"));
  objc_msgSend(v3, "appendFormat:", CFSTR("; sharedCellCount = %ld"),
    -[TIKeyboardSecureCandidateRenderTraits sharedCellCount](self, "sharedCellCount"));
  -[TIKeyboardSecureCandidateRenderTraits screenScale](self, "screenScale");
  objc_msgSend(v3, "appendFormat:", CFSTR("; screenScale = %f"), v17);
  v18 = -[TIKeyboardSecureCandidateRenderTraits isCandidateUI](self, "isCandidateUI");
  v19 = CFSTR("NO");
  if (v18)
    v19 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("; isCandidateUI = %@"), v19);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  TIKeyboardSecureCandidateLayoutTraits *layoutTraits;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  int64_t v47;
  int64_t v48;
  double v49;
  double v50;
  double v51;
  _BOOL4 v52;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    layoutTraits = self->_layoutTraits;
    if (layoutTraits != (TIKeyboardSecureCandidateLayoutTraits *)v5[2]
      && !-[TIKeyboardSecureCandidateLayoutTraits isEqual:](layoutTraits, "isEqual:"))
    {
      goto LABEL_30;
    }
    -[TIKeyboardSecureCandidateRenderTraits headerTextTraits](self, "headerTextTraits");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "headerTextTraits");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 == (void *)v8)
    {

    }
    else
    {
      v9 = (void *)v8;
      -[TIKeyboardSecureCandidateRenderTraits headerTextTraits](self, "headerTextTraits");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "headerTextTraits");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_30;
    }
    -[TIKeyboardSecureCandidateRenderTraits inputTextTraits](self, "inputTextTraits");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "inputTextTraits");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v14 == (void *)v15)
    {

    }
    else
    {
      v16 = (void *)v15;
      -[TIKeyboardSecureCandidateRenderTraits inputTextTraits](self, "inputTextTraits");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "inputTextTraits");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqual:", v18);

      if (!v19)
        goto LABEL_30;
    }
    v20 = (void *)MEMORY[0x1E0CB3940];
    -[TIKeyboardSecureCandidateRenderTraits prefixText](self, "prefixText");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "prefixText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v20) = objc_msgSend(v20, "_string:matchesString:", v21, v22);

    if (!(_DWORD)v20)
      goto LABEL_30;
    v23 = (void *)MEMORY[0x1E0CB3940];
    -[TIKeyboardSecureCandidateRenderTraits suffixText](self, "suffixText");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "suffixText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = objc_msgSend(v23, "_string:matchesString:", v24, v25);

    if (!(_DWORD)v23)
      goto LABEL_30;
    -[TIKeyboardSecureCandidateRenderTraits resultCountToSingleCellWidth](self, "resultCountToSingleCellWidth");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resultCountToSingleCellWidth");
    v27 = objc_claimAutoreleasedReturnValue();
    if (v26 == (void *)v27)
    {

    }
    else
    {
      v28 = (void *)v27;
      -[TIKeyboardSecureCandidateRenderTraits resultCountToSingleCellWidth](self, "resultCountToSingleCellWidth");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resultCountToSingleCellWidth");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v29, "isEqual:", v30);

      if (!v31)
        goto LABEL_30;
    }
    -[TIKeyboardSecureCandidateRenderTraits cellWidthOptions](self, "cellWidthOptions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellWidthOptions");
    v33 = objc_claimAutoreleasedReturnValue();
    if (v32 == (void *)v33)
    {

    }
    else
    {
      v34 = (void *)v33;
      -[TIKeyboardSecureCandidateRenderTraits cellWidthOptions](self, "cellWidthOptions");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cellWidthOptions");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v35, "isEqual:", v36);

      if (!v37)
        goto LABEL_30;
    }
    -[TIKeyboardSecureCandidateRenderTraits singleCellHeight](self, "singleCellHeight");
    v39 = v38;
    objc_msgSend(v5, "singleCellHeight");
    if (v39 == v40)
    {
      -[TIKeyboardSecureCandidateRenderTraits singleCellVerticalPadding](self, "singleCellVerticalPadding");
      v42 = v41;
      objc_msgSend(v5, "singleCellVerticalPadding");
      if (v42 == v43)
      {
        -[TIKeyboardSecureCandidateRenderTraits dividerLineWidth](self, "dividerLineWidth");
        v45 = v44;
        objc_msgSend(v5, "dividerLineWidth");
        if (v45 == v46)
        {
          v47 = -[TIKeyboardSecureCandidateRenderTraits maxCellCount](self, "maxCellCount");
          if (v47 == objc_msgSend(v5, "maxCellCount"))
          {
            v48 = -[TIKeyboardSecureCandidateRenderTraits sharedCellCount](self, "sharedCellCount");
            if (v48 == objc_msgSend(v5, "sharedCellCount"))
            {
              -[TIKeyboardSecureCandidateRenderTraits screenScale](self, "screenScale");
              v50 = v49;
              objc_msgSend(v5, "screenScale");
              if (v50 == v51)
              {
                v52 = -[TIKeyboardSecureCandidateRenderTraits isCandidateUI](self, "isCandidateUI");
                v13 = v52 ^ objc_msgSend(v5, "isCandidateUI") ^ 1;
LABEL_31:

                goto LABEL_32;
              }
            }
          }
        }
      }
    }
LABEL_30:
    LOBYTE(v13) = 0;
    goto LABEL_31;
  }
  LOBYTE(v13) = 0;
LABEL_32:

  return v13;
}

- (void)setLayoutTraits:(id)a3
{
  objc_storeStrong((id *)&self->_layoutTraits, a3);
}

- (NSString)prefixText
{
  return self->_prefixText;
}

- (void)setPrefixText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)suffixText
{
  return self->_suffixText;
}

- (void)setSuffixText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)resultCountToSingleCellWidth
{
  return self->_resultCountToSingleCellWidth;
}

- (NSDictionary)cellWidthOptions
{
  return self->_cellWidthOptions;
}

- (double)singleCellHeight
{
  return self->_singleCellHeight;
}

- (double)singleCellVerticalPadding
{
  return self->_singleCellVerticalPadding;
}

- (double)dividerLineWidth
{
  return self->_dividerLineWidth;
}

- (void)setDividerLineWidth:(double)a3
{
  self->_dividerLineWidth = a3;
}

- (int64_t)maxCellCount
{
  return self->_maxCellCount;
}

- (int64_t)sharedCellCount
{
  return self->_sharedCellCount;
}

- (void)setSharedCellCount:(int64_t)a3
{
  self->_sharedCellCount = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (int64_t)cellRenderingStyle
{
  return self->_cellRenderingStyle;
}

- (BOOL)isCandidateUI
{
  return self->_isCandidateUI;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (TIKeyboardSecureCandidateRGBColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (NSString)hideMyEmailLocalizedText
{
  return self->_hideMyEmailLocalizedText;
}

- (void)setHideMyEmailLocalizedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)shouldOfferHideMyEmail
{
  return self->_shouldOfferHideMyEmail;
}

- (void)setShouldOfferHideMyEmail:(BOOL)a3
{
  self->_shouldOfferHideMyEmail = a3;
}

- (BOOL)disableHideMyEmail
{
  return self->_disableHideMyEmail;
}

- (void)setDisableHideMyEmail:(BOOL)a3
{
  self->_disableHideMyEmail = a3;
}

- (BOOL)shouldForceDoubleLineCandidateForCellularAutofill
{
  return self->_shouldForceDoubleLineCandidateForCellularAutofill;
}

- (void)setShouldForceDoubleLineCandidateForCellularAutofill:(BOOL)a3
{
  self->_shouldForceDoubleLineCandidateForCellularAutofill = a3;
}

@end
