@implementation ContentStyle

- (id)copyWithZone:(_NSZone *)a3
{
  double v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
  v7 = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContentStyle fontFamily](self, "fontFamily"));
  v9 = objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v7, "setFontFamily:", v9);

  -[ContentStyle lineHeight](self, "lineHeight");
  objc_msgSend(v7, "setLineHeight:");
  -[ContentStyle fontSize](self, "fontSize");
  objc_msgSend(v7, "setFontSize:");
  objc_msgSend(v7, "setAutoHyphenate:", -[ContentStyle autoHyphenate](self, "autoHyphenate"));
  objc_msgSend(v7, "setOptimizeLegibility:", -[ContentStyle optimizeLegibility](self, "optimizeLegibility"));
  objc_msgSend(v7, "setJustification:", -[ContentStyle justification](self, "justification"));
  return v7;
}

- (BOOL)autoHyphenate
{
  _BOOL4 autoHyphenate;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  autoHyphenate = self->_autoHyphenate;
  v4 = objc_claimAutoreleasedReturnValue(-[ContentStyle overrideProvider](self, "overrideProvider"));
  if (!v4)
    return autoHyphenate;
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContentStyle overrideProvider](self, "overrideProvider"));
  v7 = objc_msgSend(v6, "noAutoHyphenation");

  if (autoHyphenate)
    return v7 ^ 1;
  else
    return 0;
}

- (BOOL)justification
{
  _BOOL4 justification;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;

  justification = self->_justification;
  v4 = objc_claimAutoreleasedReturnValue(-[ContentStyle overrideProvider](self, "overrideProvider"));
  if (!v4)
    return justification;
  v5 = (void *)v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContentStyle overrideProvider](self, "overrideProvider"));
  v7 = objc_msgSend(v6, "noJustification");

  if (justification)
    return v7 ^ 1;
  else
    return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  float v7;
  float v8;
  float v9;
  NSString *mFontFamily;
  void *v11;
  float v12;
  float v13;
  float v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v19;

  v4 = a3;
  objc_opt_class(ContentStyle);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = v4;
    -[ContentStyle fontSize](self, "fontSize");
    v8 = v7;
    objc_msgSend(v6, "fontSize");
    if (v8 == v9)
    {
      mFontFamily = self->mFontFamily;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fontFamily"));
      if (-[NSString isEqualToString:](mFontFamily, "isEqualToString:", v11)
        && (-[ContentStyle lineHeight](self, "lineHeight"), v13 = v12, objc_msgSend(v6, "lineHeight"), v13 == v14)
        && (v15 = -[ContentStyle autoHyphenate](self, "autoHyphenate"),
            v15 == objc_msgSend(v6, "autoHyphenate"))
        && (v16 = -[ContentStyle optimizeLegibility](self, "optimizeLegibility"),
            v16 == objc_msgSend(v6, "optimizeLegibility")))
      {
        v19 = -[ContentStyle justification](self, "justification");
        v17 = v19 ^ objc_msgSend(v6, "justification") ^ 1;
      }
      else
      {
        LOBYTE(v17) = 0;
      }

    }
    else
    {
      LOBYTE(v17) = 0;
    }

  }
  else
  {
    LOBYTE(v17) = 0;
  }

  return v17;
}

- (id)description
{
  void *v3;
  float v4;
  double v5;
  float v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContentStyle fontFamily](self, "fontFamily"));
  -[ContentStyle lineHeight](self, "lineHeight");
  v5 = v4;
  -[ContentStyle fontSize](self, "fontSize");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ContentStyle: <%p> font-family:%@; line-height:%g; font-size:%g; autoHyphenate = %d; optimizeLegibility = %d, justification=%d"),
                   self,
                   v3,
                   *(_QWORD *)&v5,
                   v6,
                   -[ContentStyle autoHyphenate](self, "autoHyphenate"),
                   -[ContentStyle optimizeLegibility](self, "optimizeLegibility"),
                   -[ContentStyle justification](self, "justification")));

  return v7;
}

- (ContentStyle)initWithCoder:(id)a3
{
  id v4;
  ContentStyle *v5;
  double v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = -[ContentStyle init](self, "init");
  if (v5)
  {
    *(_QWORD *)&v6 = objc_opt_class(NSString).n128_u64[0];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("fontFamily"), v6));
    -[ContentStyle setFontFamily:](v5, "setFontFamily:", v8);

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("lineHeight"));
    -[ContentStyle setLineHeight:](v5, "setLineHeight:");
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("fontSize"));
    -[ContentStyle setFontSize:](v5, "setFontSize:");
    -[ContentStyle setAutoHyphenate:](v5, "setAutoHyphenate:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autoHyphenate")));
    -[ContentStyle setOptimizeLegibility:](v5, "setOptimizeLegibility:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("legibility")));
    -[ContentStyle setJustification:](v5, "setJustification:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("justification")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContentStyle fontFamily](self, "fontFamily"));
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("fontFamily"));

  -[ContentStyle lineHeight](self, "lineHeight");
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("lineHeight"));
  -[ContentStyle fontSize](self, "fontSize");
  objc_msgSend(v5, "encodeFloat:forKey:", CFSTR("fontSize"));
  objc_msgSend(v5, "encodeBool:forKey:", -[ContentStyle autoHyphenate](self, "autoHyphenate"), CFSTR("autoHyphenate"));
  objc_msgSend(v5, "encodeBool:forKey:", -[ContentStyle optimizeLegibility](self, "optimizeLegibility"), CFSTR("legibility"));
  objc_msgSend(v5, "encodeBool:forKey:", -[ContentStyle justification](self, "justification"), CFSTR("justification"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summaryString
{
  id v3;
  void *v4;
  float v5;
  void *v6;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v3 = objc_alloc((Class)NSArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContentStyle fontFamily](self, "fontFamily"));
  -[ContentStyle lineHeight](self, "lineHeight");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), v5));
  -[ContentStyle fontSize](self, "fontSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[ContentStyle autoHyphenate](self, "autoHyphenate")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), -[ContentStyle optimizeLegibility](self, "optimizeLegibility")));
  v11 = objc_msgSend(v3, "initWithObjects:", v4, v6, v8, v9, v10, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsJoinedByString:", gContentStyleSeparator));
  return v12;
}

- (ContentStyle)init
{
  ContentStyle *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ContentStyle;
  v2 = -[ContentStyle init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString string](NSString, "string"));
    -[ContentStyle setFontFamily:](v2, "setFontFamily:", v3);

  }
  return v2;
}

+ (id)fontNameFromSummaryString:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", gContentStyleSeparator));
  if (objc_msgSend(v3, "count"))
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));
  else
    v4 = 0;

  return v4;
}

- (ContentStyle)initWithSummaryString:(id)a3
{
  id v4;
  ContentStyle *v5;
  void *v6;
  uint64_t v7;
  NSString *mFontFamily;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[ContentStyle init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsSeparatedByString:", gContentStyleSeparator));
    if ((unint64_t)objc_msgSend(v6, "count") >= 3)
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 0));
      mFontFamily = v5->mFontFamily;
      v5->mFontFamily = (NSString *)v7;

      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 1));
      objc_msgSend(v9, "floatValue");
      -[ContentStyle setLineHeight:](v5, "setLineHeight:");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 2));
      objc_msgSend(v10, "floatValue");
      -[ContentStyle setFontSize:](v5, "setFontSize:");
      if ((unint64_t)objc_msgSend(v6, "count") >= 5)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 3));
        -[ContentStyle setAutoHyphenate:](v5, "setAutoHyphenate:", objc_msgSend(v11, "BOOLValue"));

      }
      if ((unint64_t)objc_msgSend(v6, "count") >= 6)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", 4));
        -[ContentStyle setOptimizeLegibility:](v5, "setOptimizeLegibility:", objc_msgSend(v12, "BOOLValue"));

      }
    }

  }
  return v5;
}

- (ContentStyle)initWithFontFamily:(id)a3 andDetails:(id)a4
{
  id v6;
  id v7;
  ContentStyle *v8;
  ContentStyle *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = -[ContentStyle init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[ContentStyle setFontFamily:](v8, "setFontFamily:", v6);
    *(_QWORD *)&v10 = objc_opt_class(NSNumber).n128_u64[0];
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("fontSize"), v10));
    v14 = BUDynamicCast(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v15, "floatValue");
    -[ContentStyle setFontSize:](v9, "setFontSize:");

    *(_QWORD *)&v16 = objc_opt_class(NSNumber).n128_u64[0];
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForKey:", CFSTR("lineHeight"), v16));
    v20 = BUDynamicCast(v18, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(v21, "floatValue");
    -[ContentStyle setLineHeight:](v9, "setLineHeight:");

  }
  return v9;
}

- (NSString)fontFamily
{
  return self->mFontFamily;
}

- (void)setFontFamily:(id)a3
{
  objc_storeStrong((id *)&self->mFontFamily, a3);
}

- (float)lineHeight
{
  return self->_lineHeight;
}

- (void)setLineHeight:(float)a3
{
  self->_lineHeight = a3;
}

- (float)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(float)a3
{
  self->_fontSize = a3;
}

- (void)setAutoHyphenate:(BOOL)a3
{
  self->_autoHyphenate = a3;
}

- (BOOL)optimizeLegibility
{
  return self->_legibility;
}

- (void)setOptimizeLegibility:(BOOL)a3
{
  self->_legibility = a3;
}

- (void)setJustification:(BOOL)a3
{
  self->_justification = a3;
}

- (ContentStyleOverrideProvider)overrideProvider
{
  return (ContentStyleOverrideProvider *)objc_loadWeakRetained((id *)&self->_overrideProvider);
}

- (void)setOverrideProvider:(id)a3
{
  objc_storeWeak((id *)&self->_overrideProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_overrideProvider);
  objc_storeStrong((id *)&self->mFontFamily, 0);
}

@end
