@implementation PTPointSettings

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
  +[PTRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("X"), CFSTR("x"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "precision:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  +[PTRow rowWithTitle:valueKeyPath:](PTEditFloatRow, "rowWithTitle:valueKeyPath:", CFSTR("Y"), CFSTR("y"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PTModule sectionWithRows:](PTModule, "sectionWithRows:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PTModule moduleWithTitle:contents:](PTModule, "moduleWithTitle:contents:", CFSTR("Point"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)ignoresKey:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("pointValue"));
}

- (id)drillDownSummary
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PTPointSettings x](self, "x");
  v5 = v4;
  -[PTPointSettings y](self, "y");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("(%.3g, %.3g)"), v5, v6);
}

- (void)setPointValue:(CGPoint)a3
{
  double y;

  y = a3.y;
  -[PTPointSettings setX:](self, "setX:", a3.x);
  -[PTPointSettings setY:](self, "setY:", y);
}

- (CGPoint)pointValue
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[PTPointSettings x](self, "x");
  v4 = v3;
  -[PTPointSettings y](self, "y");
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (double)x
{
  return self->_x;
}

- (void)setX:(double)a3
{
  self->_x = a3;
}

- (double)y
{
  return self->_y;
}

- (void)setY:(double)a3
{
  self->_y = a3;
}

@end
