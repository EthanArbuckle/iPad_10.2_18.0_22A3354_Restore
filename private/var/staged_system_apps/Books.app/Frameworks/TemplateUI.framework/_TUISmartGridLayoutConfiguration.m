@implementation _TUISmartGridLayoutConfiguration

- (_TUISmartGridLayoutConfiguration)initWithWidth:(double)a3 height:(double)a4 box:(id)a5
{
  id v9;
  _TUISmartGridLayoutConfiguration *v10;
  _TUISmartGridLayoutConfiguration *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)_TUISmartGridLayoutConfiguration;
  v10 = -[_TUISmartGridLayoutConfiguration init](&v13, "init");
  v11 = v10;
  if (v10)
  {
    v10->_width = a3;
    v10->_height = a4;
    objc_storeStrong((id *)&v10->_box, a5);
  }

  return v11;
}

- (UIEdgeInsets)contentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[TUISmartGridBox insets](self->_box, "insets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)gradientInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[TUISmartGridBox gradientInsets](self->_box, "gradientInsets");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)gradientFraction
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[TUISmartGridBox gradientFraction](self->_box, "gradientFraction");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)columnWidth
{
  return -[TUISmartGridBox columnWidth](self->_box, "columnWidth");
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)columnSpacing
{
  return -[TUISmartGridBox columnSpacing](self->_box, "columnSpacing");
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)rowSpacing
{
  return -[TUISmartGridBox rowSpacing](self->_box, "rowSpacing");
}

- (unint64_t)rows
{
  return -[TUISmartGridBox rows](self->_box, "rows");
}

- (unint64_t)verticalPlacement
{
  return -[TUISmartGridBox verticalPlacement](self->_box, "verticalPlacement");
}

- (TUISnap)widthSnap
{
  return -[TUISmartGridBox widthSnap](self->_box, "widthSnap");
}

- (NSDictionary)additionalConfiguration
{
  return -[TUISmartGridBox configuration](self->_box, "configuration");
}

- (unint64_t)columns
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TUISmartGridBox columns](self->_box, "columns"));
  v4 = -[_TUISmartGridLayoutConfiguration unsignedIntegerWithSpec:](self, "unsignedIntegerWithSpec:", v3);

  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return v4;
}

- (unint64_t)unsignedIntegerWithSpec:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_9;
  if ((objc_opt_respondsToSelector(v4, "integerValue") & 1) != 0)
  {
    v6 = (unint64_t)objc_msgSend(v5, "integerValue");
    goto LABEL_10;
  }
  v7 = objc_claimAutoreleasedReturnValue(-[TUISmartGridBox widthSnap](self->_box, "widthSnap"));
  if (!v7
    || (v8 = (void *)v7,
        v9 = objc_opt_respondsToSelector(v5, "objectForKeyedSubscript:"),
        v8,
        (v9 & 1) == 0))
  {
LABEL_9:
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_10;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TUISmartGridBox widthSnap](self->_box, "widthSnap"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifierForValue:", self->_width));

  if (v11)
  {
    v12 = objc_opt_class(NSNumber);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v11));
    v14 = TUIDynamicCast(v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (!v15)
    {
      v16 = objc_opt_class(NSNumber);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("*")));
      v18 = TUIDynamicCast(v16, v17);
      v15 = (void *)objc_claimAutoreleasedReturnValue(v18);

    }
  }
  else
  {
    v15 = 0;
  }
  v6 = (unint64_t)objc_msgSend(v15, "integerValue");

LABEL_10:
  return v6;
}

- (unint64_t)columnMultiple
{
  return -[TUISmartGridBox columnMultiple](self->_box, "columnMultiple");
}

- (unint64_t)maxColumns
{
  return -[TUISmartGridBox maxColumns](self->_box, "maxColumns");
}

- (BOOL)paginated
{
  return -[TUISmartGridBox paginated](self->_box, "paginated");
}

- (unint64_t)maxPages
{
  return -[TUISmartGridBox maxPages](self->_box, "maxPages");
}

- ($881BB7C90C7D0DFCC1492E3DC022A30F)specifiedHeight
{
  return -[TUIBox height](self->_box, "height");
}

- (BOOL)balanceSections
{
  return -[TUISmartGridBox balanceSections](self->_box, "balanceSections");
}

- (BOOL)truncate
{
  return -[TUISmartGridBox truncate](self->_box, "truncate");
}

- (double)width
{
  return self->_width;
}

- (double)height
{
  return self->_height;
}

- (TUISmartGridBox)box
{
  return self->_box;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_box, 0);
}

@end
