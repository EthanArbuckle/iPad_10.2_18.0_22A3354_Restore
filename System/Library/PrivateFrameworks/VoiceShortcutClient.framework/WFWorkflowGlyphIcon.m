@implementation WFWorkflowGlyphIcon

- (WFWorkflowGlyphIcon)initWithGlyph:(unsigned __int16)a3 background:(id)a4
{
  id v8;
  WFWorkflowGlyphIcon *v9;
  WFWorkflowGlyphIcon *v10;
  WFWorkflowGlyphIcon *v11;
  void *v13;
  objc_super v14;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFIcon.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("background"));

  }
  v14.receiver = self;
  v14.super_class = (Class)WFWorkflowGlyphIcon;
  v9 = -[WFIcon _init](&v14, sel__init);
  v10 = v9;
  if (v9)
  {
    v9->_glyph = a3;
    objc_storeStrong((id *)&v9->_background, a4);
    v11 = v10;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t glyph;

  glyph = self->_glyph;
  return -[WFIconBackground hash](self->_background, "hash") ^ glyph;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;

  v4 = a3;
  if (!v4)
  {
    v8 = 0;
    v12 = 0;
    v11 = 0;
LABEL_13:

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    v11 = 0;
    v8 = v4;
    goto LABEL_13;
  }
  v5 = -[WFWorkflowGlyphIcon glyph](self, "glyph");
  if (v5 == objc_msgSend(v4, "glyph"))
  {
    -[WFWorkflowGlyphIcon background](self, "background");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "background");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
      v11 = 1;
    }
    else
    {
      v11 = 0;
      if (v8 && v9)
        v11 = objc_msgSend(v8, "isEqual:", v9);
    }

    v12 = v4;
    goto LABEL_13;
  }
  v11 = 0;
  v12 = v4;
LABEL_14:

  return v11;
}

- (WFWorkflowGlyphIcon)initWithCoder:(id)a3
{
  id v4;
  unsigned __int16 v5;
  void *v6;
  WFWorkflowGlyphIcon *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("glyph"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("background"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[WFWorkflowGlyphIcon initWithGlyph:background:](self, "initWithGlyph:background:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t glyph;
  id v5;

  glyph = self->_glyph;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", glyph, CFSTR("glyph"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_background, CFSTR("background"));

}

- (BOOL)hasClearBackground
{
  void *v2;
  void *v3;
  char v4;

  -[WFWorkflowGlyphIcon background](self, "background");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFIconColorBackground clearBackground](WFIconColorBackground, "clearBackground");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (BOOL)hasTransparentBackground
{
  void *v2;
  void *v3;
  double v4;
  BOOL v5;

  -[WFWorkflowGlyphIcon background](self, "background");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v2, "color");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alpha");
    v5 = v4 < 1.0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unsigned)glyph
{
  return self->_glyph;
}

- (WFIconBackground)background
{
  return self->_background;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_background, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
