@implementation _UIKeyboardInputModeIconConfiguration

+ (id)defaultConfiguration
{
  void *v2;

  objc_opt_class();
  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setSize:", 23.0, 18.0);
  objc_msgSend(v2, "setWeight:", 4);
  objc_msgSend(v2, "setBackground:", 1);
  objc_msgSend(v2, "setScaleFactor:", 1.0);
  return v2;
}

- (unint64_t)hash
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UIKeyboardInputModeIconConfiguration;
  v3 = (double)(3 * -[_UIKeyboardInputModeIconConfiguration hash](&v10, sel_hash));
  -[_UIKeyboardInputModeIconConfiguration size](self, "size");
  v5 = (double)(3 * (unint64_t)(v4 + v3));
  -[_UIKeyboardInputModeIconConfiguration size](self, "size");
  v7 = (double)(3 * (unint64_t)(v6 + v5));
  -[_UIKeyboardInputModeIconConfiguration scaleFactor](self, "scaleFactor");
  return (unint64_t)(v8 + v7);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendSize:withName:", CFSTR("size"), self->_size.width, self->_size.height);
  v5 = (id)objc_msgSend(v3, "appendInteger:withName:", self->_weight, CFSTR("fontWeight"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_background, CFSTR("background"));
  v7 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("scale"), self->_scaleFactor);
  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  _UIKeyboardInputModeIconConfiguration *v4;
  _UIKeyboardInputModeIconConfiguration *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  uint64_t v13;
  _BOOL4 v14;
  BOOL v15;
  double v17;
  double v18;
  double v19;

  v4 = (_UIKeyboardInputModeIconConfiguration *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[_UIKeyboardInputModeIconConfiguration size](v5, "size");
      v7 = v6;
      v9 = v8;
      -[_UIKeyboardInputModeIconConfiguration size](self, "size");
      v12 = v7 == v11 && v9 == v10;
      if (v12
        && (v13 = -[_UIKeyboardInputModeIconConfiguration weight](v5, "weight"),
            v13 == -[_UIKeyboardInputModeIconConfiguration weight](self, "weight"))
        && (v14 = -[_UIKeyboardInputModeIconConfiguration background](v5, "background"),
            v14 == -[_UIKeyboardInputModeIconConfiguration background](self, "background")))
      {
        -[_UIKeyboardInputModeIconConfiguration scaleFactor](v5, "scaleFactor");
        v18 = v17;
        -[_UIKeyboardInputModeIconConfiguration scaleFactor](self, "scaleFactor");
        v15 = v18 == v19;
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (int64_t)weight
{
  return self->_weight;
}

- (void)setWeight:(int64_t)a3
{
  self->_weight = a3;
}

- (BOOL)background
{
  return self->_background;
}

- (void)setBackground:(BOOL)a3
{
  self->_background = a3;
}

- (double)scaleFactor
{
  return self->_scaleFactor;
}

- (void)setScaleFactor:(double)a3
{
  self->_scaleFactor = a3;
}

@end
