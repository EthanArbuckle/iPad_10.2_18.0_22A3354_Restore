@implementation TCImportFontCacheKey

+ (id)createFontCacheKeyForName:(id)a3 size:(int)a4
{
  uint64_t v4;
  id v5;
  TCImportFontCacheKey *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = objc_alloc_init(TCImportFontCacheKey);
  -[TCImportFontCacheKey setName:](v6, "setName:", v5);
  -[TCImportFontCacheKey setSize:](v6, "setSize:", v4);

  return v6;
}

- (unint64_t)hash
{
  uint64_t size;

  size = self->_size;
  return -[NSString hash](self->_name, "hash") ^ size;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_size == v4[2]
    && -[NSString isEqualToString:](self->_name, "isEqualToString:", *((_QWORD *)v4 + 2));

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int)size
{
  return self->_size;
}

- (void)setSize:(int)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
