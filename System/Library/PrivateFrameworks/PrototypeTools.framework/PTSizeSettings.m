@implementation PTSizeSettings

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  +[PTRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Width"), CFSTR("width"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "precision:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  +[PTRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Height"), CFSTR("height"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PTModule sectionWithRows:](PTModule, "sectionWithRows:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTModule moduleWithTitle:contents:](PTModule, "moduleWithTitle:contents:", CFSTR("Size"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)ignoresKey:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("sizeValue"));
}

- (id)drillDownSummary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PTSizeSettings width](self, "width");
  v5 = v4;
  -[PTSizeSettings height](self, "height");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("(%.1g, %.1g)"), v5, v6);
}

- (void)setSizeValue:(CGSize)a3
{
  double height;

  height = a3.height;
  -[PTSizeSettings setWidth:](self, "setWidth:", a3.width);
  -[PTSizeSettings setHeight:](self, "setHeight:", height);
}

- (CGSize)sizeValue
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[PTSizeSettings width](self, "width");
  v4 = v3;
  -[PTSizeSettings height](self, "height");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (double)width
{
  return self->_width;
}

- (void)setWidth:(double)a3
{
  self->_width = a3;
}

- (double)height
{
  return self->_height;
}

- (void)setHeight:(double)a3
{
  self->_height = a3;
}

@end
