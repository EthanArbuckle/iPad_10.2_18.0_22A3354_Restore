@implementation _UIEventSessionTapAction

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIEventSessionTapAction;
  result = -[_UIEventSessionAction copyWithZone:](&v5, sel_copyWithZone_, a3);
  *(CGPoint *)((char *)result + 72) = self->_buttonLocation;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_UIEventSessionTapAction;
  -[_UIEventSessionAction description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[_UIEventSessionTapAction buttonLocation](self, "buttonLocation");
  v7 = v6;
  -[_UIEventSessionTapAction buttonLocation](self, "buttonLocation");
  objc_msgSend(v5, "stringWithFormat:", CFSTR(" buttonLocation = (%f,%f)"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v11;
  }

  return v3;
}

- (id)typeEncoding
{
  return CFSTR("Button");
}

- (int64_t)actionType
{
  return 22;
}

- (CGPoint)buttonLocation
{
  double x;
  double y;
  CGPoint result;

  x = self->_buttonLocation.x;
  y = self->_buttonLocation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setButtonLocation:(CGPoint)a3
{
  self->_buttonLocation = a3;
}

@end
