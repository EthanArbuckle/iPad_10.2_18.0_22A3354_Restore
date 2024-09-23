@implementation _PRMonogramFontSpec

+ (id)specForFontWithName:(id)a3 baseSize:(double)a4 tracking:(double)a5
{
  id v7;
  _PRMonogramFontSpec *v8;
  uint64_t v9;
  NSString *fontName;

  v7 = a3;
  v8 = objc_alloc_init(_PRMonogramFontSpec);
  v9 = objc_msgSend(v7, "copy");

  fontName = v8->_fontName;
  v8->_fontName = (NSString *)v9;

  v8->_baseSize = a4;
  v8->_tracking = a5;
  return v8;
}

- (double)tracking
{
  return self->_tracking;
}

- (NSString)fontName
{
  return self->_fontName;
}

- (double)baseSize
{
  return self->_baseSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontName, 0);
}

@end
