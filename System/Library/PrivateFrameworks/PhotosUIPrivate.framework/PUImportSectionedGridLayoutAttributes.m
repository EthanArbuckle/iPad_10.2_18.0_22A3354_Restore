@implementation PUImportSectionedGridLayoutAttributes

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUImportSectionedGridLayoutAttributes;
  v4 = -[PUSectionedGridLayoutAttributes copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 46, self->_backgroundColor);
  v4[47] = *(id *)&self->_strokeWidth;
  objc_storeStrong(v4 + 48, self->_bottomStrokeColor);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PUImportSectionedGridLayoutAttributes *v4;
  PUImportSectionedGridLayoutAttributes *v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  objc_super v17;

  v4 = (PUImportSectionedGridLayoutAttributes *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[PUImportSectionedGridLayoutAttributes backgroundColor](self, "backgroundColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportSectionedGridLayoutAttributes backgroundColor](v5, "backgroundColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (!v8)
        goto LABEL_9;
      -[PUImportSectionedGridLayoutAttributes strokeWidth](self, "strokeWidth");
      v10 = v9;
      -[PUImportSectionedGridLayoutAttributes strokeWidth](v5, "strokeWidth");
      if (v10 != v11)
        goto LABEL_9;
      -[PUImportSectionedGridLayoutAttributes bottomStrokeColor](self, "bottomStrokeColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUImportSectionedGridLayoutAttributes bottomStrokeColor](v5, "bottomStrokeColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (v14)
      {
        v17.receiver = self;
        v17.super_class = (Class)PUImportSectionedGridLayoutAttributes;
        v15 = -[PUSectionedGridLayoutAttributes isEqual:](&v17, sel_isEqual_, v5);
      }
      else
      {
LABEL_9:
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

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (double)strokeWidth
{
  return self->_strokeWidth;
}

- (void)setStrokeWidth:(double)a3
{
  self->_strokeWidth = a3;
}

- (UIColor)bottomStrokeColor
{
  return self->_bottomStrokeColor;
}

- (void)setBottomStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_bottomStrokeColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomStrokeColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

@end
