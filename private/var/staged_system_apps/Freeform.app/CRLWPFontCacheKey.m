@implementation CRLWPFontCacheKey

+ (id)cacheKeyWithFontName:(id)a3 size:(double)a4
{
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  id v14;

  v6 = a3;
  v7 = a1;
  objc_sync_enter(v7);
  if (!qword_101414AB0
    || (objc_msgSend((id)qword_101414AB0, "fontSize"), v9 != a4)
    || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_101414AB0, "fontName")),
        v11 = objc_msgSend(v10, "isEqualToString:", v6),
        v10,
        (v11 & 1) == 0))
  {
    v12 = objc_msgSend(objc_alloc((Class)objc_opt_class(v7, v8)), "initWithFontName:fontSize:hasExtraFields:bold:italic:fontFeatures:", v6, 0, 0, 0, 0, a4);
    v13 = (void *)qword_101414AB0;
    qword_101414AB0 = (uint64_t)v12;

  }
  v14 = (id)qword_101414AB0;
  objc_sync_exit(v7);

  return v14;
}

+ (id)cacheKeyWithFontName:(id)a3 fontSize:(double)a4 bold:(BOOL)a5 italic:(BOOL)a6 fontFeatures:(id)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v7 = a6;
  v8 = a5;
  v12 = a7;
  v13 = a3;
  v15 = objc_msgSend(objc_alloc((Class)objc_opt_class(a1, v14)), "initWithFontName:fontSize:hasExtraFields:bold:italic:fontFeatures:", v13, 1, v8, v7, v12, a4);

  return v15;
}

- (CRLWPFontCacheKey)initWithFontName:(id)a3 fontSize:(double)a4 hasExtraFields:(BOOL)a5 bold:(BOOL)a6 italic:(BOOL)a7 fontFeatures:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  CRLWPFontCacheKey *v16;
  NSString *v17;
  NSString *fontName;
  NSUInteger v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  objc_super v24;

  v11 = a5;
  v14 = a3;
  v15 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CRLWPFontCacheKey;
  v16 = -[CRLWPFontCacheKey init](&v24, "init");
  if (v16)
  {
    v17 = (NSString *)objc_msgSend(v14, "copy");
    fontName = v16->_fontName;
    v16->_fontName = v17;

    v16->_fontSize = a4;
    if (v11)
    {
      v16->_hasExtraFields = 1;
      v16->_bold = a6;
      v16->_italic = a7;
      objc_storeStrong((id *)&v16->_fontFeatures, a8);
      v19 = -[NSString hash](v16->_fontName, "hash");
      v20 = 2;
      if (!v16->_bold)
        v20 = 4;
      v21 = v19 ^ v20;
      v22 = 8;
      if (!v16->_italic)
        v22 = 16;
      v16->_hashValue = v21 ^ v22 ^ (unint64_t)v16->_fontSize;
    }
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v17;

  v4 = a3;
  v6 = objc_opt_class(CRLWPFontCacheKey, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (!v8)
    goto LABEL_13;
  v9 = objc_msgSend(v8, "hash");
  if (v9 != (id)-[CRLWPFontCacheKey hash](self, "hash"))
    goto LABEL_13;
  objc_msgSend(v8, "fontSize");
  if (v10 != self->_fontSize)
    goto LABEL_13;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontName"));
  v12 = objc_msgSend(v11, "isEqualToString:", self->_fontName);

  if (!v12)
    goto LABEL_13;
  if (!objc_msgSend(v8, "hasExtraFields")
    || !self->_hasExtraFields
    || self->_bold != objc_msgSend(v8, "bold")
    || self->_italic != objc_msgSend(v8, "italic"))
  {
    if ((objc_msgSend(v8, "hasExtraFields") & 1) == 0)
    {
      v15 = !self->_hasExtraFields;
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (!self->_fontFeatures)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontFeatures"));

    if (!v17)
    {
      v15 = 1;
      goto LABEL_14;
    }
    if (!self->_fontFeatures)
      goto LABEL_13;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontFeatures"));

  if (!v13)
  {
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fontFeatures"));
  v15 = objc_msgSend(v14, "isEqual:", self->_fontFeatures);

LABEL_14:
  return v15;
}

- (unint64_t)hash
{
  return self->_hashValue;
}

- (id)description
{
  _BOOL4 hasExtraFields;
  uint64_t v4;
  NSString *fontName;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  NSString *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  hasExtraFields = self->_hasExtraFields;
  v4 = objc_opt_class(self, a2);
  fontName = self->_fontName;
  if (hasExtraFields)
  {
    if (self->_bold)
      v6 = CFSTR("+BOLD");
    else
      v6 = CFSTR("-BOLD");
    v7 = CFSTR("+ITALIC");
    if (!self->_italic)
      v7 = CFSTR("-ITALIC");
    if (self->_fontFeatures)
      v8 = CFSTR("+FONTFEATURES");
    else
      v8 = CFSTR("-FONTFEATURES");
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@*) %p %@ %g %@ %@ %@"), v4, self, fontName, *(_QWORD *)&self->_fontSize, v6, v7, v8);
  }
  else
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(%@*) %p %@ %g"), v4, self, fontName, *(_QWORD *)&self->_fontSize, v11, v12, v13);
  }
  return (id)objc_claimAutoreleasedReturnValue(v9);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CRLWPFontCacheKey *v4;
  void *v5;
  double v6;
  double v7;
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  void *v11;
  CRLWPFontCacheKey *v12;

  v4 = [CRLWPFontCacheKey alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontCacheKey fontName](self, "fontName"));
  -[CRLWPFontCacheKey fontSize](self, "fontSize");
  v7 = v6;
  v8 = -[CRLWPFontCacheKey hasExtraFields](self, "hasExtraFields");
  v9 = -[CRLWPFontCacheKey bold](self, "bold");
  v10 = -[CRLWPFontCacheKey italic](self, "italic");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPFontCacheKey fontFeatures](self, "fontFeatures"));
  v12 = -[CRLWPFontCacheKey initWithFontName:fontSize:hasExtraFields:bold:italic:fontFeatures:](v4, "initWithFontName:fontSize:hasExtraFields:bold:italic:fontFeatures:", v5, v8, v9, v10, v11, v7);

  return v12;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (BOOL)hasExtraFields
{
  return self->_hasExtraFields;
}

- (BOOL)bold
{
  return self->_bold;
}

- (BOOL)italic
{
  return self->_italic;
}

- (NSArray)fontFeatures
{
  return self->_fontFeatures;
}

- (unint64_t)hashValue
{
  return self->_hashValue;
}

- (void)setHashValue:(unint64_t)a3
{
  self->_hashValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontFeatures, 0);
  objc_storeStrong((id *)&self->_fontName, 0);
}

@end
