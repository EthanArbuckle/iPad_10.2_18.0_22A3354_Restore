@implementation UIPointerRegion

+ (UIPointerRegion)regionWithRect:(CGRect)rect identifier:(id)identifier
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v8 = identifier;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setRect:", x, y, width, height);
  objc_msgSend(v9, "setIdentifier:", v8);

  return (UIPointerRegion *)v9;
}

- (BOOL)_isLatching
{
  return -[UIPointerRegion latchingAxes](self, "latchingAxes") != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (void *)objc_opt_class();
  -[UIPointerRegion rect](self, "rect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIPointerRegion identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regionWithRect:identifier:", v13, v6, v8, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIPointerRegion referenceView](self, "referenceView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setReferenceView:", v15);

  objc_msgSend(v14, "setGenerationID:", -[UIPointerRegion generationID](self, "generationID"));
  objc_msgSend(v14, "setLatchingAxes:", -[UIPointerRegion latchingAxes](self, "latchingAxes"));
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  UIPointerRegion *v4;
  UIPointerRegion *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  int v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;
  uint64_t v27;
  CGRect v29;
  CGRect v30;

  v4 = (UIPointerRegion *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UIPointerRegion identifier](v5, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPointerRegion identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6;
      v9 = v7;
      v10 = v9;
      if (v8 == v9)
      {

      }
      else
      {
        v11 = 0;
        v12 = v8;
        if (!v8 || !v9)
        {
LABEL_18:

          goto LABEL_19;
        }
        v13 = objc_msgSend(v8, "isEqual:", v9);

        if (!v13)
        {
          v11 = 0;
LABEL_19:

          goto LABEL_20;
        }
      }
      -[UIPointerRegion referenceView](v5, "referenceView");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      -[UIPointerRegion referenceView](self, "referenceView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v12 == v9)
      {
        -[UIPointerRegion rect](v5, "rect");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        -[UIPointerRegion rect](self, "rect");
        v30.origin.x = v22;
        v30.origin.y = v23;
        v30.size.width = v24;
        v30.size.height = v25;
        v29.origin.x = v15;
        v29.origin.y = v17;
        v29.size.width = v19;
        v29.size.height = v21;
        if (CGRectEqualToRect(v29, v30)
          && (v26 = -[UIPointerRegion generationID](v5, "generationID"),
              v26 == -[UIPointerRegion generationID](self, "generationID")))
        {
          v27 = -[UIPointerRegion latchingAxes](v5, "latchingAxes");
          v11 = v27 == -[UIPointerRegion latchingAxes](self, "latchingAxes");
        }
        else
        {
          v11 = 0;
        }
        v9 = v12;
      }
      else
      {
        v11 = 0;
      }
      goto LABEL_18;
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  double v3;
  int v4;
  double v5;
  int v6;
  double v7;
  int v8;
  double v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  UIAxis v16;

  -[UIPointerRegion rect](self, "rect");
  v4 = (int)v3;
  -[UIPointerRegion rect](self, "rect");
  v6 = (int)v5 ^ v4;
  -[UIPointerRegion rect](self, "rect");
  v8 = (int)v7;
  -[UIPointerRegion rect](self, "rect");
  v10 = v6 ^ v8 ^ (int)v9;
  -[UIPointerRegion identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  -[UIPointerRegion referenceView](self, "referenceView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");
  v15 = -[UIPointerRegion generationID](self, "generationID");
  v16 = v12 ^ v14 ^ v15 ^ -[UIPointerRegion latchingAxes](self, "latchingAxes") ^ v10;

  return v16;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIAxis v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UIPointerRegion rect](self, "rect");
  v5 = v4;
  -[UIPointerRegion rect](self, "rect");
  v7 = v6;
  -[UIPointerRegion rect](self, "rect");
  v9 = v8;
  -[UIPointerRegion rect](self, "rect");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%g %g; %g %g)"), v5, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; rect = %@"), objc_opt_class(), self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPointerRegion identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[UIPointerRegion identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "appendFormat:", CFSTR("; identifier = %@"), v14);

  }
  v15 = -[UIPointerRegion latchingAxes](self, "latchingAxes") - 1;
  if (v15 <= 2)
    objc_msgSend(v12, "appendString:", off_1E16E5EA8[v15]);
  objc_msgSend(v12, "appendString:", CFSTR(">"));

  return (NSString *)v12;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

- (id)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (UIAxis)latchingAxes
{
  return self->_latchingAxes;
}

- (void)setLatchingAxes:(UIAxis)latchingAxes
{
  self->_latchingAxes = latchingAxes;
}

- (unint64_t)generationID
{
  return self->_generationID;
}

- (void)setGenerationID:(unint64_t)a3
{
  self->_generationID = a3;
}

- (UIView)referenceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_referenceView);
}

- (void)setReferenceView:(id)a3
{
  objc_storeWeak((id *)&self->_referenceView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_referenceView);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
