@implementation WFWorkflowIcon

- (WFWorkflowIcon)initWithBackgroundColorValue:(int64_t)a3 glyphCharacter:(unsigned __int16)a4 customImageData:(id)a5
{
  return -[WFWorkflowIcon initWithBackgroundColorValue:glyphCharacter:customImageData:symbolOverride:](self, "initWithBackgroundColorValue:glyphCharacter:customImageData:symbolOverride:", a3, a4, a5, 0);
}

- (WFWorkflowIcon)initWithBackgroundColorValue:(int64_t)a3 glyphCharacter:(unsigned __int16)a4 customImageData:(id)a5 symbolOverride:(id)a6
{
  id v10;
  id v11;
  WFWorkflowIcon *v12;
  WFWorkflowIcon *v13;
  uint64_t v14;
  NSData *customImageData;
  uint64_t v16;
  NSString *symbolOverride;
  WFWorkflowIcon *v18;
  objc_super v20;

  v10 = a5;
  v11 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WFWorkflowIcon;
  v12 = -[WFWorkflowIcon init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_backgroundColorValue = a3;
    v12->_glyphCharacter = a4;
    v14 = objc_msgSend(v10, "copy");
    customImageData = v13->_customImageData;
    v13->_customImageData = (NSData *)v14;

    v16 = objc_msgSend(v11, "copy");
    symbolOverride = v13->_symbolOverride;
    v13->_symbolOverride = (NSString *)v16;

    v18 = v13;
  }

  return v13;
}

- (WFIcon)icon
{
  WFIconGradientBackground *v3;
  void *v4;
  void *v5;
  WFIconGradientBackground *v6;
  void *v7;
  WFSymbolIcon *v8;
  WFSymbolIcon *v9;

  v3 = [WFIconGradientBackground alloc];
  -[WFWorkflowIcon backgroundColor](self, "backgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "paletteGradient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WFIconGradientBackground initWithGradient:](v3, "initWithGradient:", v5);

  WFSystemImageNameForGlyphCharacter(-[WFWorkflowIcon glyphCharacter](self, "glyphCharacter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = -[WFSymbolIcon initWithSymbolName:background:]([WFSymbolIcon alloc], "initWithSymbolName:background:", v7, v6);
  else
    v8 = -[WFWorkflowGlyphIcon initWithGlyph:background:]([WFWorkflowGlyphIcon alloc], "initWithGlyph:background:", -[WFWorkflowIcon glyphCharacter](self, "glyphCharacter"), v6);
  v9 = v8;

  return (WFIcon *)v9;
}

- (WFColor)backgroundColor
{
  return +[WFColor colorWithRGBAValue:](WFColor, "colorWithRGBAValue:", -[WFWorkflowIcon backgroundColorValue](self, "backgroundColorValue"));
}

- (unint64_t)hash
{
  int64_t v3;

  v3 = -[WFWorkflowIcon backgroundColorValue](self, "backgroundColorValue");
  return v3 ^ -[WFWorkflowIcon glyphCharacter](self, "glyphCharacter");
}

- (int64_t)backgroundColorValue
{
  return self->_backgroundColorValue;
}

- (unsigned)glyphCharacter
{
  return self->_glyphCharacter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolOverride, 0);
  objc_storeStrong((id *)&self->_customImageData, 0);
}

- (WFWorkflowIcon)init
{
  return -[WFWorkflowIcon initWithPaletteColor:glyphCharacter:customImageData:](self, "initWithPaletteColor:glyphCharacter:customImageData:", +[WFWorkflowIcon randomPaletteColor](WFWorkflowIcon, "randomPaletteColor"), +[WFWorkflowIcon defaultGlyphCharacter](WFWorkflowIcon, "defaultGlyphCharacter"), 0);
}

- (WFWorkflowIcon)initWithPaletteColor:(unint64_t)a3 glyphCharacter:(unsigned __int16)a4 customImageData:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  WFWorkflowIcon *v10;

  v5 = a4;
  v8 = a5;
  +[WFColor colorWithPaletteColor:](WFColor, "colorWithPaletteColor:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[WFWorkflowIcon initWithBackgroundColorValue:glyphCharacter:customImageData:](self, "initWithBackgroundColorValue:glyphCharacter:customImageData:", (int)objc_msgSend(v9, "RGBAValue"), v5, v8);

  return v10;
}

- (WFWorkflowIcon)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned __int16 v8;
  void *v9;
  void *v10;
  WFWorkflowIcon *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColorValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("glyphCharacter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongValue");

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("customImageData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("symbolOverride"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[WFWorkflowIcon initWithBackgroundColorValue:glyphCharacter:customImageData:symbolOverride:](self, "initWithBackgroundColorValue:glyphCharacter:customImageData:symbolOverride:", v6, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(v4, "numberWithInteger:", -[WFWorkflowIcon backgroundColorValue](self, "backgroundColorValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("backgroundColorValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[WFWorkflowIcon glyphCharacter](self, "glyphCharacter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("glyphCharacter"));

  -[WFWorkflowIcon customImageData](self, "customImageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("customImageData"));

  -[WFWorkflowIcon symbolOverride](self, "symbolOverride");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("symbolOverride"));

}

- (BOOL)isEqual:(id)a3
{
  WFWorkflowIcon *v4;
  WFWorkflowIcon *v5;
  int64_t v6;
  int v7;
  BOOL v8;

  v4 = (WFWorkflowIcon *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[WFWorkflowIcon backgroundColorValue](self, "backgroundColorValue");
      if (v6 == -[WFWorkflowIcon backgroundColorValue](v5, "backgroundColorValue"))
      {
        v7 = -[WFWorkflowIcon glyphCharacter](self, "glyphCharacter");
        v8 = v7 == -[WFWorkflowIcon glyphCharacter](v5, "glyphCharacter");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSData)customImageData
{
  return self->_customImageData;
}

- (NSString)symbolOverride
{
  return self->_symbolOverride;
}

- (void)setSymbolOverride:(id)a3
{
  objc_storeStrong((id *)&self->_symbolOverride, a3);
}

+ (unint64_t)randomPaletteColor
{
  void *v2;
  uint32_t v3;

  +[WFColor workflowPalette](WFColor, "workflowPalette");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return arc4random_uniform(v3);
}

+ (unsigned)defaultGlyphCharacter
{
  return -4096;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
