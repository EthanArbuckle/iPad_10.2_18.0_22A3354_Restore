@implementation TSWPFontCacheKey

+ (id)cacheKeyWithFontName:(id)a3 size:(double)a4 weight:(double)a5
{
  void *v9;
  double v10;
  double v11;
  char v12;
  id v13;

  objc_sync_enter(a1);
  v9 = (void *)+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey;
  if (!+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey
    || (objc_msgSend((id)+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey, "fontSize"),
        v9 = (void *)+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey,
        v10 != a4)
    || (objc_msgSend((id)+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey, "fontWeight"),
        v9 = (void *)+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey,
        v11 != a5)
    || (v12 = objc_msgSend((id)objc_msgSend((id)+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey, "fontName"), "isEqualToString:", a3), v9 = (void *)+[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey, (v12 & 1) == 0))
  {

    v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithFontName:size:weight:", a3, a4, a5);
    +[TSWPFontCacheKey cacheKeyWithFontName:size:weight:]::sLastKey = (uint64_t)v9;
  }
  v13 = v9;
  objc_sync_exit(a1);
  return v13;
}

- (TSWPFontCacheKey)initWithFontName:(id)a3 size:(double)a4 weight:(double)a5
{
  TSWPFontCacheKey *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSWPFontCacheKey;
  v8 = -[TSWPFontCacheKey init](&v10, sel_init);
  if (v8)
  {
    v8->_fontName = (NSString *)objc_msgSend(a3, "copy");
    v8->_fontSize = a4;
    v8->_fontWeight = a5;
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  self->_fontName = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWPFontCacheKey;
  -[TSWPFontCacheKey dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_fontName, "hash");
}

- (BOOL)isEqual:(id)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  objc_opt_class();
  v5 = (void *)TSUDynamicCast();
  if (a3
    && (v6 = v5, objc_msgSend(v5, "fontSize"), v7 == self->_fontSize)
    && (objc_msgSend(v6, "fontWeight"), v8 == self->_fontWeight))
  {
    return objc_msgSend((id)objc_msgSend(v6, "fontName"), "isEqualToString:", self->_fontName);
  }
  else
  {
    return 0;
  }
}

- (NSString)fontName
{
  return self->_fontName;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (double)fontWeight
{
  return self->_fontWeight;
}

@end
