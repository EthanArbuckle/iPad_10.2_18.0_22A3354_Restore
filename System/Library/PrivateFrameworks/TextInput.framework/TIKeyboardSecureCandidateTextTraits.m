@implementation TIKeyboardSecureCandidateTextTraits

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
}

- (TIKeyboardSecureCandidateTextTraits)initWithCoder:(id)a3
{
  id v4;
  TIKeyboardSecureCandidateTextTraits *v5;
  void *v6;
  uint64_t v7;
  NSString *fontName;
  float v9;
  float v10;
  uint64_t v11;
  TIKeyboardSecureCandidateRGBColor *textColor;
  double v13;
  double v14;

  v4 = a3;
  v5 = -[TIKeyboardSecureCandidateTextTraits init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fontName"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    fontName = v5->_fontName;
    v5->_fontName = (NSString *)v7;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("maxFontSize"));
    v5->_maxFontSize = v9;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("minFontSize"));
    v5->_minFontSize = v10;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textColor"));
    v11 = objc_claimAutoreleasedReturnValue();
    textColor = v5->_textColor;
    v5->_textColor = (TIKeyboardSecureCandidateRGBColor *)v11;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("yCoordinate"));
    v5->_yCoordinate = v13;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("baselineOffset"));
    v5->_baselineOffset = v14;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TIKeyboardSecureCandidateTextTraits *v4;
  uint64_t v5;
  NSString *fontName;

  v4 = objc_alloc_init(TIKeyboardSecureCandidateTextTraits);
  if (v4)
  {
    v5 = -[NSString copy](self->_fontName, "copy");
    fontName = v4->_fontName;
    v4->_fontName = (NSString *)v5;

    v4->_maxFontSize = self->_maxFontSize;
    v4->_minFontSize = self->_minFontSize;
    objc_storeStrong((id *)&v4->_textColor, self->_textColor);
    v4->_yCoordinate = self->_yCoordinate;
    v4->_baselineOffset = self->_baselineOffset;
  }
  return v4;
}

- (TIKeyboardSecureCandidateTextTraits)initWithFontName:(id)a3 maxFontSize:(double)a4 minFontSize:(double)a5 textColor:(id)a6 yCoordinate:(double)a7 baselineOffset:(double)a8
{
  id v14;
  id v15;
  TIKeyboardSecureCandidateTextTraits *v16;
  uint64_t v17;
  NSString *fontName;
  objc_super v20;

  v14 = a3;
  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardSecureCandidateTextTraits;
  v16 = -[TIKeyboardSecureCandidateTextTraits init](&v20, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v14, "copy");
    fontName = v16->_fontName;
    v16->_fontName = (NSString *)v17;

    v16->_maxFontSize = a4;
    v16->_minFontSize = a5;
    objc_storeStrong((id *)&v16->_textColor, a6);
    v16->_yCoordinate = a7;
    v16->_baselineOffset = a8;
  }

  return v16;
}

- (TIKeyboardSecureCandidateTextTraits)initWithFontName:(id)a3 maxFontSize:(double)a4 minFontSize:(double)a5 textColor:(id)a6
{
  return -[TIKeyboardSecureCandidateTextTraits initWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:](self, "initWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", a3, a6, a4, a5, 0.0, 0.0);
}

- (TIKeyboardSecureCandidateTextTraits)init
{
  return -[TIKeyboardSecureCandidateTextTraits initWithFontName:fontSize:textColor:](self, "initWithFontName:fontSize:textColor:", 0, 0, 0.0);
}

- (TIKeyboardSecureCandidateTextTraits)initWithFontName:(id)a3 fontSize:(double)a4 textColor:(id)a5
{
  return -[TIKeyboardSecureCandidateTextTraits initWithFontName:maxFontSize:minFontSize:textColor:](self, "initWithFontName:maxFontSize:minFontSize:textColor:", a3, a5, a4, a4);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *fontName;
  double maxFontSize;
  double minFontSize;
  TIKeyboardSecureCandidateRGBColor *textColor;
  id v9;

  v4 = a3;
  fontName = self->_fontName;
  v9 = v4;
  if (fontName)
  {
    objc_msgSend(v4, "encodeObject:forKey:", fontName, CFSTR("fontName"));
    v4 = v9;
  }
  maxFontSize = self->_maxFontSize;
  if (maxFontSize != 0.0)
  {
    *(float *)&maxFontSize = maxFontSize;
    objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("maxFontSize"), maxFontSize);
    v4 = v9;
  }
  minFontSize = self->_minFontSize;
  if (minFontSize != 0.0)
  {
    *(float *)&minFontSize = minFontSize;
    objc_msgSend(v9, "encodeFloat:forKey:", CFSTR("minFontSize"), minFontSize);
    v4 = v9;
  }
  textColor = self->_textColor;
  if (textColor)
  {
    objc_msgSend(v9, "encodeObject:forKey:", textColor, CFSTR("textColor"));
    v4 = v9;
  }
  objc_msgSend(v4, "encodeDouble:forKey:", CFSTR("yCoordinate"), self->_yCoordinate);
  objc_msgSend(v9, "encodeDouble:forKey:", CFSTR("baselineOffset"), self->_baselineOffset);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  -[TIKeyboardSecureCandidateTextTraits fontName](self, "fontName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardSecureCandidateTextTraits maxFontSize](self, "maxFontSize");
  v6 = v5;
  -[TIKeyboardSecureCandidateTextTraits minFontSize](self, "minFontSize");
  v8 = v7;
  -[TIKeyboardSecureCandidateTextTraits textColor](self, "textColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TIKeyboardSecureCandidateTextTraits yCoordinate](self, "yCoordinate");
  v11 = v10;
  -[TIKeyboardSecureCandidateTextTraits baselineOffset](self, "baselineOffset");
  objc_msgSend(v3, "appendFormat:", CFSTR("; fontName = %@, maxFontSize = %f, minFontSize = %f, textColor = %@, yCoordinate = %f, baselineOffset = %f"),
    v4,
    v6,
    v8,
    v9,
    v11,
    v12);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = (void *)MEMORY[0x1E0CB3940];
    -[TIKeyboardSecureCandidateTextTraits fontName](self, "fontName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fontName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v6, "_string:matchesString:", v7, v8);

    if (!(_DWORD)v6)
      goto LABEL_12;
    -[TIKeyboardSecureCandidateTextTraits maxFontSize](self, "maxFontSize");
    v10 = v9;
    objc_msgSend(v5, "maxFontSize");
    if (v10 != v11)
      goto LABEL_12;
    -[TIKeyboardSecureCandidateTextTraits minFontSize](self, "minFontSize");
    v13 = v12;
    objc_msgSend(v5, "minFontSize");
    if (v13 != v14)
      goto LABEL_12;
    -[TIKeyboardSecureCandidateTextTraits textColor](self, "textColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textColor");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15 == (void *)v16)
    {

    }
    else
    {
      v17 = (void *)v16;
      -[TIKeyboardSecureCandidateTextTraits textColor](self, "textColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "textColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_12;
    }
    -[TIKeyboardSecureCandidateTextTraits yCoordinate](self, "yCoordinate");
    v23 = v22;
    objc_msgSend(v5, "yCoordinate");
    if (v23 == v24)
    {
      -[TIKeyboardSecureCandidateTextTraits baselineOffset](self, "baselineOffset");
      v26 = v25;
      objc_msgSend(v5, "baselineOffset");
      v21 = v26 == v27;
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    v21 = 0;
    goto LABEL_13;
  }
  v21 = 0;
LABEL_14:

  return v21;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (void)setFontName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)maxFontSize
{
  return self->_maxFontSize;
}

- (void)setMaxFontSize:(double)a3
{
  self->_maxFontSize = a3;
}

- (double)minFontSize
{
  return self->_minFontSize;
}

- (void)setMinFontSize:(double)a3
{
  self->_minFontSize = a3;
}

- (TIKeyboardSecureCandidateRGBColor)textColor
{
  return self->_textColor;
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
}

- (double)yCoordinate
{
  return self->_yCoordinate;
}

- (void)setYCoordinate:(double)a3
{
  self->_yCoordinate = a3;
}

- (double)baselineOffset
{
  return self->_baselineOffset;
}

- (void)setBaselineOffset:(double)a3
{
  self->_baselineOffset = a3;
}

+ (id)traitsWithFontName:(id)a3 maxFontSize:(double)a4 minFontSize:(double)a5 textColor:(id)a6 yCoordinate:(double)a7 baselineOffset:(double)a8
{
  id v13;
  id v14;
  TIKeyboardSecureCandidateTextTraits *v15;

  v13 = a6;
  v14 = a3;
  v15 = -[TIKeyboardSecureCandidateTextTraits initWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:]([TIKeyboardSecureCandidateTextTraits alloc], "initWithFontName:maxFontSize:minFontSize:textColor:yCoordinate:baselineOffset:", v14, v13, a4, a5, a7, a8);

  return v15;
}

@end
