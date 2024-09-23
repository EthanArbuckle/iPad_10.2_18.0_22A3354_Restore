@implementation NavBarDateCacheKey

- (BOOL)isEqual:(id)a3
{
  NavBarDateCacheKey *v4;
  NavBarDateCacheKey *v5;
  id month;
  id year;
  UIFont *font;
  UIFont *v9;
  BOOL v10;
  objc_super v12;

  v4 = (NavBarDateCacheKey *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NavBarDateCacheKey;
    if (-[NavBarDateCacheKey isEqual:](&v12, "isEqual:", v4))
    {
      v5 = v4;
      month = (id)self->_month;
      if (month == (id)-[NavBarDateCacheKey month](v5, "month")
        && (year = (id)self->_year, year == (id)-[NavBarDateCacheKey year](v5, "year")))
      {
        font = self->_font;
        v9 = (UIFont *)objc_claimAutoreleasedReturnValue(-[NavBarDateCacheKey font](v5, "font"));
        v10 = font == v9;

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  return self->_month + 100 * self->_year;
}

- (int64_t)month
{
  return self->_month;
}

- (void)setMonth:(int64_t)a3
{
  self->_month = a3;
}

- (int64_t)year
{
  return self->_year;
}

- (void)setYear:(int64_t)a3
{
  self->_year = a3;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
}

@end
