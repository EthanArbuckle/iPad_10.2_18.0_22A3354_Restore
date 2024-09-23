@implementation SXFontFamily

- (SXFontFamily)initWithFamilyName:(id)a3 faces:(id)a4
{
  id v7;
  id v8;
  SXFontFamily *v9;
  SXFontFamily *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXFontFamily;
  v9 = -[SXFontFamily init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_familyName, a3);
    objc_storeStrong((id *)&v10->_fontFaces, a4);
  }

  return v10;
}

- (id)fontFaceWithAttributes:(id)a3 size:(int64_t)a4
{
  return +[SXFontMatching matchFontFaceForAttributes:fromFamily:](SXFontMatching, "matchFontFaceForAttributes:fromFamily:", a3, self);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXFontFamily familyName](self, "familyName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; familyName: %@"), v4);

  -[SXFontFamily fontFaces](self, "fontFaces");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("; fontFaces: %@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSSet)fontFaces
{
  return self->_fontFaces;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontFaces, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
}

@end
