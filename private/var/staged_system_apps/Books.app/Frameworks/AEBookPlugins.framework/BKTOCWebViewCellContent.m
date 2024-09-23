@implementation BKTOCWebViewCellContent

+ (id)cellContentWithHeight:(double)a3 cacheKey:(id)a4
{
  id v5;
  BKTOCWebViewCellContent *v6;

  v5 = a4;
  v6 = objc_opt_new(BKTOCWebViewCellContent);
  -[BKTOCWebViewCellContent setHeight:](v6, "setHeight:", a3);
  -[BKTOCWebViewCellContent setCacheKey:](v6, "setCacheKey:", v5);

  return v6;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

- (NSString)cacheKey
{
  return self->_cacheKey;
}

- (void)setCacheKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheKey, 0);
}

@end
