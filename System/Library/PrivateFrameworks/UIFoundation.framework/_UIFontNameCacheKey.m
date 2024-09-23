@implementation _UIFontNameCacheKey

- (unint64_t)_hash
{
  return -[NSString hash](self->_fontName, "hash") ^ self->_traits ^ vcvtmd_u64_f64(self->_pointSize * 100.0);
}

- (void)setFontName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setTraits:(int)a3
{
  self->_traits = a3;
}

- (void)setPointSize:(double)a3
{
  self->_pointSize = a3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFontNameCacheKey;
  -[_UIFontNameCacheKey dealloc](&v3, sel_dealloc);
}

- (BOOL)_isEqualToKey:(id)a3
{
  NSString *fontName;
  _BOOL4 v6;
  double pointSize;
  double v8;

  if (self->super._hash != *((_QWORD *)a3 + 1))
    goto LABEL_6;
  fontName = self->_fontName;
  if (fontName == *((NSString **)a3 + 3) || (v6 = -[NSString isEqualToString:](fontName, "isEqualToString:")))
  {
    if (self->_traits == *((_DWORD *)a3 + 4))
    {
      pointSize = self->_pointSize;
      objc_msgSend(a3, "pointSize");
      LOBYTE(v6) = vabdd_f64(pointSize, v8) < 0.00000011920929;
      return v6;
    }
LABEL_6:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (double)pointSize
{
  return self->_pointSize;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fontName: %@, traits: %ld, pointSize: %g"), self->_fontName, self->_traits, *(_QWORD *)&self->_pointSize);
}

- (NSString)fontName
{
  return self->_fontName;
}

- (int)traits
{
  return self->_traits;
}

@end
