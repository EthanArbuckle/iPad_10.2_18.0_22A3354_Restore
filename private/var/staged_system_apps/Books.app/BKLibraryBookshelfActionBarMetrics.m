@implementation BKLibraryBookshelfActionBarMetrics

+ (id)sectionName
{
  return CFSTR("actionBar");
}

- (void)configureWithSection:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("bar-tint-color")));
  -[BKLibraryBookshelfActionBarMetrics setBarTintColor:](self, "setBarTintColor:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "colorForKey:", CFSTR("tint-color")));
  -[BKLibraryBookshelfActionBarMetrics setTintColor:](self, "setTintColor:", v6);

}

- (UIColor)barTintColor
{
  return self->_barTintColor;
}

- (void)setBarTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_barTintColor, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_barTintColor, 0);
}

@end
